Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A8F459AF8
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 13:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787232636; cv=none; b=fESeaitLtQsoz/ZK5i+3nmc/qGlv5XJep6bWzVbapkwfvokh54MQkA/eGQ91aqKIK7aZ6Xz+JpiaQYgicFFM9tXJIfrFpS0SggfaL3pwhqzn8GiwTjwx+nXpR3vUbU0B7wLaEPSwhBaoFBmrp6iNRUcaIp45MyJWsdN5cLMZ6os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787232636; c=relaxed/simple;
	bh=oyPjcMsbFogFAkZFyt6nSjpjkpdXxpvbl+4cMK+5ETw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EcEeeNPW2Fb9erM05Q0MdhLGbc4rtlxkwgeksOv9WuPBTRAzrq63G8SpyFEMBbtvwBZak+jrvrILBfzKiiZdqig66mNl47VwvBV3PNL6rYNCujwoxb29hQiZ+FJKGoraHGxAMw1kudW/1SJYUxUf4w2mDcAWukbEHbVgFTrDqdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mp12wIT3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mp12wIT3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AA281F000E9;
	Thu, 20 Aug 2026 13:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787232630;
	bh=Di6D7eYiKAr2aHz48PJWMp3NfyhOhHiIuLfeVTTRwxg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mp12wIT3nxcvRc4IF6kIkSv31VIsfJn7PknsoVwHrloxItm61OoDRl+Yq9w8RRY0m
	 8d4qqFupkN8nSiZMasdE88odeGozWXNJBDD4YSlKXduYTumIJSYXk5aafgqDWmsERv
	 tA+Iouw9glmtdF8U5kCczbxElMsQjT7zQLncYu+GsAaTPYZm2gXkIbowqer7mBYyzU
	 Q30yffWWeuzYKNGUKjEx8MYrxwUM2FX/4lXr/+bzrcIJctOAiz0GAx/4boH7i5xC6U
	 L5S90iVC+8n3BV2J6xpOPdDWcAkRcsWtGXdX6XAGEKKiWJg9B9KfL/otooVB56UukD
	 PwAKwRPB5cZFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/13] dmaengine: ste_dma40: Fix DMA registration
 unwind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260820-dma40-fixes-v2-4-63238334c707@kernel.org>
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
 <20260820-dma40-fixes-v2-4-63238334c707@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 13:30:29 +0000
Message-Id: <20260820133030.3AA281F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The DMA_CYCLIC capability is incorrectly applied to dma_slave inst=
ead of dma_both during dma_both setup.
- [High] The channel tasklets are not explicitly killed on the probe error =
path, which can result in a Use-After-Free if a tasklet is scheduled before=
 the probe fails.
--

--- Patch [4]: [PATCH v2 04/13] dmaengine: ste_dma40: Fix DMA registration =
unwind ---
commit b477f2730e0cab6c69890c774c76310e0edd988b
Author: Linus Walleij <linusw@kernel.org>

dmaengine: ste_dma40: Fix DMA registration unwind

d40_dmaengine_init() registers DMAengine devices using devres-managed
unregister actions. This commit wraps the registration in a temporary
devres group, releasing it if probe fails to prevent DMAengine devices
from staying visible until devres unwinds.

Closes: https://lore.kernel.org/dmaengine/20260819225215.5EA2F1F000E9@smtp.=
kernel.org/

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 145f7105218ce..384c2f3805b02 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
[ ... ]
> @@ -3638,20 +3639,29 @@ static int __init d40_probe(struct platform_devic=
e *pdev)
> =20
>  	d40_hw_init(base);
> =20
> +	dmaenginem_reg_group =3D devres_open_group(dev, NULL, GFP_KERNEL);
> +	if (!dmaenginem_reg_group) {
> +		ret =3D -ENOMEM;
> +		goto destroy_cache;
> +	}
> +
>  	ret =3D d40_dmaengine_init(base, num_reserved_chans);

[Severity: High]
This isn't a bug introduced by this patch, but does the configuration of
base->dma_both in d40_dmaengine_init() incorrectly set the DMA_CYCLIC
capability on base->dma_slave instead of base->dma_both?

Looking at d40_dmaengine_init():

drivers/dma/ste_dma40.c:d40_dmaengine_init() {
    ...
    dma_cap_zero(base->dma_both.cap_mask);
    dma_cap_set(DMA_SLAVE, base->dma_both.cap_mask);
    dma_cap_set(DMA_MEMCPY, base->dma_both.cap_mask);
    dma_cap_set(DMA_CYCLIC, base->dma_slave.cap_mask);
    ...
}

Should the last line be setting DMA_CYCLIC on base->dma_both.cap_mask so th=
at
physical channels managed by dma_both advertise cyclic support?

>  	if (ret)
> -		goto destroy_cache;
> +		goto release_dmaenginem;
> =20
>  	ret =3D of_dma_controller_register(np, d40_xlate, NULL);
>  	if (ret) {
>  		dev_err(dev,
>  			"could not register of_dma_controller\n");
> -		goto destroy_cache;
> +		goto release_dmaenginem;
>  	}
> +	devres_remove_group(dev, dmaenginem_reg_group);
> =20
>  	dev_info(base->dev, "initialized\n");
>  	return 0;
> =20
> + release_dmaenginem:
> +	devres_release_group(dev, dmaenginem_reg_group);

[Severity: High]
This is a pre-existing issue, but does this error path need to explicitly
kill the channel tasklets initialized during probe?

During d40_probe(), tasklets are initialized for all channels in
d40_chan_init(). Then d40_dmaengine_init() exposes the DMA devices via
dmaenginem_async_device_register().

At this point, a client could request a channel and submit a transfer,
causing a hardware interrupt to schedule the tasklet. If probe subsequently
fails here at of_dma_controller_register(), the driver unwinds and returns
an error, causing devm to free the base structure containing the tasklets.

Since tasklet_kill() is never called in the error path, could a scheduled
tasklet execute after the memory is freed, leading to a Use-After-Free cras=
h?

>   destroy_cache:
>  	if (base->lcla_pool.dma_addr)
>  		dma_unmap_single(base->dev, base->lcla_pool.dma_addr,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-dma40-fixe=
s-v2-0-63238334c707@kernel.org?part=3D4
