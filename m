Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C1E35B644
	for <dmaengine@vger.kernel.org>; Thu,  4 Jun 2026 07:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780558786; cv=none; b=RKaWx8YRoz48CcdKrTC2FCL02vPR10xETUyjLgFDMpWi2P8CKiI2g7LX3MJFy+pCsa3qH7yyy9vMjKf8JQbHuxWNgfrCkORFwxxsWVn6pw+61Kk2qLYTEa7lxUlqBVre9gjxYoFOf9viNg+RtCh28fJ3D9fSsCtoqIWabA1mMaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780558786; c=relaxed/simple;
	bh=O83e9tD2mvcjA0H+DT9/NdEVPuzjaLU7jsIoyR2jh4A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uIDW4UwIsVY2qMuIUznAfONC1RXzdev0hAvl+MQNYTT45n3kpqoJ3zol9bTdXG7od+/28MEZweVpYW/6t0G/v29JFtMNc4PMYq8jmvSNN0SjJ+16eHAFjKwVYvAg3IV/7dcPZr+BRVh+WgwbBeiRGXgqj9Q9+cLUtehmmUVldVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAhd4sgI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAhd4sgI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B311F00898;
	Thu,  4 Jun 2026 07:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780558785;
	bh=iPjXzqS0G6TRRRXksthY/u3NdcR9UQFUXPvVnIVqBtk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OAhd4sgIxR7ZAb48INyAUThG8s7mQaZgJJprJVi+XfU/WvZ1uOzv/Smzkfl/q0sS5
	 kkt/vZMubgv8hv6Fl4mWtI1T/ATmnCQ+ghMzAcexYpXHemr4anSbeqi+qwYTR9sgzJ
	 IzwoJpJ3E33pjjlPcK7V/+O69XpIGRJ7bx2NDI1ZpJJQslBxPXYYqHph67lQwxZVTy
	 Y7FbzCp1UKxnbhIQJnlWqTUSewcVNOLX21F2BqGDJ0nUbtVnNLFEFjmXvFCd88fe9a
	 8L7ovT+1J49VA4oaolbUl1acJQwGwS+LS2exuPzuSdppqD9zFb7X2/7idMn/4PJksI
	 iJAKGtcNJWNKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dma: at_hdmac: Use stored IRQ in error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongling Zeng" <zenghongling@kylinos.cn>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260604073043.207844-1-zenghongling@kylinos.cn>
References: <20260604073043.207844-1-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 07:39:44 +0000
Message-Id: <20260604073945.54B311F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver fails to kill the `virt-dma` tasklets during device rem=
oval and probe error handling, introducing a potential use-after-free vulne=
rability.
--

commit ec631cae7f09ccd02ee02a4198acec6059bb578b
Author: Hongling Zeng <zenghongling@kylinos.cn>

dma: at_hdmac: Use stored IRQ in error path

When request_irq() succeeds but a later error occurs in at_dma_probe(),
the error handling path attempts to free the IRQ by calling
platform_get_irq() again instead of using the already stored IRQ number.
This patch uses the stored 'irq' variable directly.

> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index e5b30a57c477a..2a860679b9e1c 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c
> @@ -2109,7 +2109,7 @@ static int __init at_dma_probe(struct platform_devi=
ce *pdev)
>  err_memset_pool_create:
>  	dma_pool_destroy(atdma->lli_pool);
>  err_desc_pool_create:
> -	free_irq(platform_get_irq(pdev, 0), atdma);
> +	free_irq(irq, atdma);

[Severity: High]
This is a pre-existing issue, but does this error path (as well as
at_dma_remove()) fail to kill the virt-dma tasklets?

In at_dma_probe(), if an error occurs after channels are initialized via
vchan_init(), free_irq() will wait for the currently executing IRQ handler =
to
complete, but it does not wait for scheduled tasklets.

Because the struct at_dma memory is devm-managed, it will be automatically
freed shortly after the probe error path or at_dma_remove() completes. If a
scheduled tasklet executes after the device memory is freed, could this
cause a use-after-free regression?

Should the cleanup paths loop over the initialized channels and call
tasklet_kill(&chan->vc.task) to ensure tasklets are safely stopped?

>  err_irq:
>  	clk_disable_unprepare(atdma->clk);
>  	return err;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604073043.2078=
44-1-zenghongling@kylinos.cn?part=3D1
