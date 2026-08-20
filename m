Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCF6470102
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 13:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787233031; cv=none; b=TXsvxq/rzYrFIJA0+Jkak3dzuBaOXWEuYPh5qAFrNSNAHbU1F3jDPIQRvsoAWEJlsz81AW6ZRSt1ADgqBDWGpsJ+gx4uD4rXrASEfVh8LnkfNieQPy85vJZX/+LOIZ09sGqyOfgProxyGeQWovX4Jd/vtqbthJGAKqqW/ooh/CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787233031; c=relaxed/simple;
	bh=R9SUXIxoD4sYzb4un6Wi4YfRdh9iw/SnJeVXnBOMm6w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QR5POKOE9/R8mcKPf2xGNkvcnUAwXUrJ7fy74vA4M52ubzb9M4f16OsZf9lxcOcSicA0Yt6xQlJgDKRCJEOMziKmoaip5cM6QrNGZAwYElkdpdUypN3EGyE2Iw7kUj5NqHD6dly0GxqZFRtrqlluJZ9Zrt/mshsduO4E7Qjkb1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tlrbelqy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tlrbelqy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9027C1F000E9;
	Thu, 20 Aug 2026 13:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787233029;
	bh=vQugHnt04XDqYQ4vuGvZqRS0tmO3g/hAklSBouNvgAA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TlrbelqyyFB+h703HwYopJsEvxlHv5b+3IZvbKu6o0tDCcnHjGb2OJm3CtxPLGktK
	 FCli5aAM7nXhnCf57+f2C55B4v2o+GKybMPyTglfQ7KIR2HB0SCaBVxKfj/uea1Vde
	 Pz7yJ6vWwVJ9PwZSVJ6g/RfUwODoVHjZIf0yahDOFqxPlrDmIXLY1V5O/YBKwb0qtp
	 3CgzLOj60gUMGbGMA6SDFlmqGSMderJbxEa7luTUAdGwvI5vMTUcKaZDUw/jy3MNmd
	 fPDb8GDmbFDprr8UxuDceluV+iCrH+4V5kjeSYYmydFADzxWx4RiNGYUbrtCa5PbKz
	 uqAmLKdmI5b5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/13] dmaengine: ste_dma40: Validate memcpy
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260820-dma40-fixes-v2-12-63238334c707@kernel.org>
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
 <20260820-dma40-fixes-v2-12-63238334c707@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 13:37:09 +0000
Message-Id: <20260820133709.9027C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] d40_validate_conf() unconditionally rejects memcpy configurations.

Pre-existing issues:
- [High] Error paths in d40_alloc_chan_resources() underflow PM runtime ref=
erence count.
--

--- Patch [12]: [PATCH v2 12/13] dmaengine: ste_dma40: Validate memcpy conf=
iguration ---
commit 19f873d8b80c96a75bea7cfedde33c6486eb34af
Author: Linus Walleij <linusw@kernel.org>

dmaengine: ste_dma40: Validate memcpy configuration

This patch validates the generated memcpy configuration before deriving
logical channel registers or allocating the channel. This ensures that
a dev_type supplied through the memcpy-channels device tree property
cannot bypass the bounds checks.

Closes: https://lore.kernel.org/dmaengine/20260819225008.5F9651F000E9@smtp.=
kernel.org/

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index e0c694a1fc8b0..49bca706b638f 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -2013,11 +2013,16 @@ static int d40_allocate_channel(struct d40_chan *=
d40c, bool *first_phy_user)
>  static int d40_config_memcpy(struct d40_chan *d40c)
>  {
>  	dma_cap_mask_t cap =3D d40c->chan.device->cap_mask;
> +	int ret;
> =20
>  	if (dma_has_cap(DMA_MEMCPY, cap) && !dma_has_cap(DMA_SLAVE, cap)) {
>  		d40c->dma_cfg =3D dma40_memcpy_conf_log;
>  		d40c->dma_cfg.dev_type =3D dma40_memcpy_channels[d40c->chan.chan_id];
> =20
> +		ret =3D d40_validate_conf(d40c, &d40c->dma_cfg);
> +		if (ret)
> +			return ret;
> +

[Severity: High]
Does this unconditionally reject memcpy configurations?

In the framework, DMA_MEM_TO_MEM has an integer value of 0. When this calls
d40_validate_conf() for the memcpy configurations (which have a direction of
DMA_MEM_TO_MEM), it hits this check in d40_validate_conf():

drivers/dma/ste_dma40.c:d40_validate_conf() {
	...
	if (!conf->dir) {
		chan_err(d40c, "Invalid direction.\n");
		res =3D -EINVAL;
	}
	...
}

Because conf->dir is 0, this evaluates to true, resulting in validation alw=
ays
returning -EINVAL and completely breaking memcpy functionality for this
driver.

[Severity: High]
This is a pre-existing issue, but returning an error here uncovers a
PM runtime reference underflow in the caller.

If d40_config_memcpy() fails, d40_alloc_chan_resources() jumps to its error
handler before the PM runtime reference is acquired:

drivers/dma/ste_dma40.c:d40_alloc_chan_resources() {
	...
	if (!d40c->configured) {
		err =3D d40_config_memcpy(d40c);
		if (err) {
			chan_err(d40c, "Failed to configure memcpy channel\n");
			goto mark_last_busy;
		}
	}
	...
mark_last_busy:
	pm_runtime_put_autosuspend(d40c->base->dev);
	spin_unlock_irqrestore(&d40c->lock, flags);
	return err;
}

The error handler unconditionally calls pm_runtime_put_autosuspend(),
decrementing the reference count without it having been incremented.

Could this lead to the device being prematurely suspended while actively
in use?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-dma40-fixe=
s-v2-0-63238334c707@kernel.org?part=3D12
