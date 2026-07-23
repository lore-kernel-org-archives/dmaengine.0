Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9091E391E57
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 05:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784783811; cv=none; b=n/PesqJXKBNPIf5L8WSRAo7sLdW7XIiz+UOuoIm3ZP+Xt2Z6a604pYhe20lHCeIcqqaUtmEgrw6imUfJ1/jnNqZ83zn4HT75rYdKgvhEv2T/BGi8k0fKh9ZLSVagA6p1ZdHhrpya7bzHu5hCoJho+nSlScVN+mq5Wghdc8hiBZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784783811; c=relaxed/simple;
	bh=GneefJxttzXAHwoV37sJ+BkqmMpNXN7byc3wiohn/5o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FDcZaFEGOfINPD8tOO0+w6c+jrCcYe7LE1fyTKSjs3M1vovQSLcqlSGi+FgB/WMRkUHZVeVY77QlZP8jyCZqMZtp7pDjS622jW/8FOlHYC8SJIH1mYa9OujNbuZw9HvKUaJ4yqtA3VQTX0cKm7inj1bvqHyka/ZP7gAfnSKwMpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EeX/c/MT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EeX/c/MT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75A21F000E9;
	Thu, 23 Jul 2026 05:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784783810;
	bh=y8Jesob8oqZ2/yb25Iiie9CLTjDU1lgbn2Mfw2t6/0Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EeX/c/MTLGBqB70K4Hm0W1A2mWToJCCcv5YTrsFRfdf90D0x4XZ+4DUOsb6YmLv5n
	 T21OojzOE95hXcEwvOVBkQOj9HgvPmw17RqtTr97yS8t1S/46q9nAJjT6qvbJ+AoAx
	 c7mLlR+iTd9GmV+CzbRdenOJ9kMdpBDC1efnMVbHYA5n7023ujij21vYbQFHwxhgp/
	 MDG1RM+CVNOEvZFJwsqj4muzxUZGavbcbIyZ12s0IOZupLOttSbL9XIonbwFjbTP+W
	 5wsBW7QlmjsrrKpLaPFfBDTA5eXvLKYXv6ibkIfIklEXV12t/+TZy/cctTdPo1Y4N2
	 cPM9vgv1Sat7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: at_hdmac: ioremap and get irq early
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260723050606.283453-1-rosenp@gmail.com>
References: <20260723050606.283453-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 05:16:49 +0000
Message-Id: <20260723051649.D75A21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free due to missing tasklet_kill() on driver removal
--

--- Patch [1]: [PATCH] dmaengine: at_hdmac: ioremap and get irq early ---
commit c590e127b59a7e207f5a617b28aad848c06bc09b
Author: Rosen Penev <rosenp@gmail.com>

    dmaengine: at_hdmac: ioremap and get irq early
   =20
This commit updates the driver to map I/O memory and retrieve the IRQ early
during probe. By performing these operations before allocating memory and
configuring the DMA controller, it avoids unnecessary work if they return
-EPROBE_DEFER.

> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index e5b30a57c477a..2f6f5877fc3cc 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c
[ ... ]
> @@ -1968,13 +1977,7 @@ static int __init at_dma_probe(struct platform_dev=
ice *pdev)
>  	if (!atdma)
>  		return -ENOMEM;
> =20
> -	atdma->regs =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(atdma->regs))
> -		return PTR_ERR(atdma->regs);
> -
> -	irq =3D platform_get_irq(pdev, 0);
> -	if (irq < 0)
> -		return irq;
> +	atdma->regs =3D regs;
> =20
>  	/* discover transaction capabilities */
>  	atdma->dma_device.cap_mask =3D plat_dat->cap_mask;

[Severity: High]
This is a pre-existing issue, but does at_dma_remove() need to call
tasklet_kill() to prevent a use-after-free during driver removal?

If an interrupt fires just before driver removal or device unbind, it can
schedule a channel tasklet via vchan_cookie_complete(), leaving it in the
scheduler queue.

at_dma_remove() cleans up the channels but doesn't kill the tasklets:

drivers/dma/at_hdmac.c:at_dma_remove() {
...
	list_for_each_entry_safe(chan, _chan, &atdma->dma_device.channels,
			device_node) {
		/* Disable interrupts */
		atc_disable_chan_irq(atdma, chan->chan_id);
		list_del(&chan->device_node);
	}
...
}

When at_dma_remove() returns, the devres mechanism frees the at_dma
structure containing the tasklet structs.

If a pending tasklet executes on the freed memory, can it cause a
use-after-free and memory corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723050606.2834=
53-1-rosenp@gmail.com?part=3D1
