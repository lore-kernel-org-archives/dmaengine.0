Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD40B493634
	for <dmaengine@vger.kernel.org>; Sun, 23 Aug 2026 04:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787461002; cv=none; b=NX+S4MDn1nZTbcFVAVbOXaXg0Fy2SushVQVedT94tvkahTPZnSnd5PmzE2Tosdd9js3qkzDu1MFdKaWWNa686babf0nY3ZIWsKeTK1hUS6KtwPomwaWM8Q7l5JE7liuAxHH+fSy+uXwICupfTj/mefcYHtQnlj13AfZrvNjflBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787461002; c=relaxed/simple;
	bh=tGZjhoWd6+kKnfTicwrma+ZasXPjQ63cn2e17DlOu9I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AjZpS4geiUHrEG/czY9Xu6EBoUXEK+K/bgLxlx+J5cED5DVB+R89ovOWuDDKlc2lXq5BjoIrbWQIf4wPmVscvzu7ft7LHcaMx6XBWi+ezAwagwoHEYv2iPtzI0f5SM19Mi9PtySaMZjXAy0nOt8xZTzMyy054abMz8Mir0LGzX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hymn3qrQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hymn3qrQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8B81F000E9;
	Sun, 23 Aug 2026 04:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787461001;
	bh=R6FWRYHwE6xxxtfzS9LVSXl5knhP6vMj9Lm1KW3oGW0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hymn3qrQBnrn5w2fMnhW/n9RnwlkTfZ9sH5LgUJyXbZwZsIfHzJFyy++MSUXX69L7
	 xgmc2qXZ2ztMBiDhPQKFnx3zfAIW5OFsl3FH9oczZoiUsGOq+SMLFSPSTRJnlZXmDk
	 SBQV1f2ynltpr28OfbxZX4LhMfYESi1CwlsjTRMxJNbI+0xS/OjsHNBjQ4LksV3e4S
	 /9XGhwhPhdzLGTxcjXfdN5IHmHqTwmLCh9u3DgpimmuAWKSBnx32an9OjxwV1vdgaC
	 CKYCTJ/s65OA9uO6SlKSV78PUEkhTnZD6BlzwQYEsoKXbaEuxoUFzJItFg6qjJN+7w
	 GJuxC+hwZl39g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: bestcomm: ioremap early
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260823044900.11466-1-rosenp@gmail.com>
References: <20260823044900.11466-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 04:56:40 +0000
Message-Id: <20260823045641.2E8B81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The globally exported pointer `bcom_eng` is left dangling if `mpc5=
2xx_bcom_probe()` fails after allocating it, leading to a potential Use-Aft=
er-Free.
--

--- Patch [1]: [PATCH] dmaengine: bestcomm: ioremap early ---
commit 58088fd211b9916066bb25d1ffe4afa62733063f
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: bestcomm: ioremap early

This commit replaces open-coded resource lookup and mapping in the
probe function with the managed devm_platform_get_and_ioremap_resource()
helper. It also addresses a resource size mismatch between allocation
and freeing.

> diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestc=
omm.c
> --- a/drivers/dma/bestcomm/bestcomm.c
> +++ b/drivers/dma/bestcomm/bestcomm.c

[ ... ]

> @@ -439,10 +422,6 @@ static int mpc52xx_bcom_probe(struct platform_device=
 *op)
>  	return 0;
> =20
>  	/* Error path */
> -error_unmap:
> -	iounmap(bcom_eng->regs);
> -error_release:
> -	release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
>  error_sramclean:
>  	kfree(bcom_eng);

[Severity: High]
This is a pre-existing issue, but if mpc52xx_bcom_probe() fails after
allocating bcom_eng (for instance, if bcom_engine_init() fails), does this
leave the globally exported pointer bcom_eng dangling?

If it remains non-NULL after kfree(), a dependent driver like mpc52xx_fec
might later call bcom_task_alloc(), which checks if (!bcom_eng) to verify
initialization. Since the check passes, could this lead to a use-after-free
when it accesses bcom_eng->lock?

Should bcom_eng be set to NULL here, similar to how it is handled in
mpc52xx_bcom_remove()?

>  	bcom_sram_cleanup();

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260823044900.1146=
6-1-rosenp@gmail.com?part=3D1
