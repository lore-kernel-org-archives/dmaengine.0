Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E693368A5
	for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 22:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787179810; cv=none; b=Qgbve4fgsHrguBHUmTLCyJVYauTBXLNAmIz6WuC4Wfn5u06ngfMQkRDA67KOsFLXQkHrJExTlcqIPzk70e1CFVovqnQ6MEasnoAamP9a55ObJ2koW4zSboOf4Oc3b0SbP/A86Pw8fyKqF/rLNtsV+P31OVR1c70vC5dmkSllho8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787179810; c=relaxed/simple;
	bh=YgE5R5awWR81QpuKFCibRRwmnkca6md3Yxmeej0wmPk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZGkwYQ/4JXAAtlyUEpyrz7BjPZtoF+bKd27mujm5kzmtbRHioAHyF1lGve8KYqR+2zE1LKnlr64Wn1kmGcTcOW5kGnFd5m7pOpvDCarpOw7+NtWaqB6mePxY6XEDcoqgZKvcEq0GYrcdoM3dAjVobYzf4Mx8cyLXhmRGPAZ1NJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D83QDN0Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D83QDN0Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9651F000E9;
	Wed, 19 Aug 2026 22:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787179808;
	bh=fvIyEr5iBz/m0vpmDg9w2Vruw8XYySbFxeGt1lRD8wc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D83QDN0Qi4wt+JCbIsGgI1MoaFHmSrbEwKzuDsbynYu8keMDkbmNCzA+btHTuJ+oh
	 gBMYzV2ab95RIuf+3liGgNyVb1XX6Zq+jFhdL4R/tlnUaMAtMKJ2TILJkxed/biPez
	 UUqfxGtNZGb6tux9beKLLqlveYc68uDdoUlLijE73G7exFDA0BhLExGokY5kNf3Vw4
	 jRpZns7P+cwo7kV8dlaQvZAQNacHloV7RwaRbbZXcXKMQuswBJVhdvNfz0ZBuvETJ1
	 9Sc3LFlS/+YMi5HJ8Of+OoxVnB39wTjIJqJwumcZiZb43ppBYp1SEACvX/eD+d/v/k
	 l5mvi7IOo7new==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] dmaengine: ste_dma40: Fix logical channel bounds
 check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260820-dma40-fixes-v1-4-5e14815ad689@kernel.org>
References: <20260820-dma40-fixes-v1-0-5e14815ad689@kernel.org>
 <20260820-dma40-fixes-v1-4-5e14815ad689@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 22:50:07 +0000
Message-Id: <20260819225008.5F9651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds access on the `phys` array and potentially arbitrary=
 MMIO writes during channel allocation due to unconstrained `event_group`.
- [High] The out-of-bounds write fix for `lookup_log_chans` is bypassed for=
 memcpy channels configured via the Device Tree.
- [High] Global buffer overflow when reading `memcpy-channels` from Device =
Tree.
--

--- Patch [4]: [PATCH 4/4] dmaengine: ste_dma40: Fix logical channel bounds=
 check ---
commit 53c98a760123837b647fa917a72020a724b5f32f
Author: Linus Walleij <linusw@kernel.org>

dmaengine: ste_dma40: Fix logical channel bounds check
   =20
d40_validate_conf() checks the raw dev_type against num_log_chans,
but d40_allocate_channel() derives the lookup_log_chans index as either
2 * dev_type or 2 * dev_type + 1.

Validate the dev_type against the derived logical channel index limit so
channel allocation cannot write past lookup_log_chans.
   =20
Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.=
kernel.org/

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index a723133d096ec..eda3f91741ed5 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -1727,15 +1727,26 @@ static int d40_validate_conf(struct d40_chan *d40=
c,
>  {
>  	int res =3D 0;
>  	bool is_log =3D conf->mode =3D=3D STEDMA40_MODE_LOGICAL;
> +	bool invalid_dev_type =3D conf->dev_type < 0;
> =20
>  	if (!conf->dir) {
>  		chan_err(d40c, "Invalid direction.\n");
>  		res =3D -EINVAL;
>  	}
> =20
> -	if ((is_log && conf->dev_type > d40c->base->num_log_chans)  ||
> -	    (!is_log && conf->dev_type > d40c->base->num_phy_chans) ||
> -	    (conf->dev_type < 0)) {
> +	if (!invalid_dev_type && is_log) {
> +		int max_dev_type;
> +
> +		if (conf->dir =3D=3D DMA_DEV_TO_MEM)
> +			max_dev_type =3D DIV_ROUND_UP(d40c->base->num_log_chans, 2);
> +		else
> +			max_dev_type =3D d40c->base->num_log_chans / 2;
> +
> +		invalid_dev_type =3D conf->dev_type >=3D max_dev_type;
> +	}

[Severity: High]
This is a pre-existing issue, but does this bounds check fully protect the
phys array during channel allocation?

In d40_allocate_channel(), phy_num is calculated as j + event_group * 2,
where event_group is derived from dev_type / 16.

If num_log_chans is heavily scaled compared to num_phy_chans, could an
allowed logical dev_type produce an event_group that causes
event_group * 2 to greatly exceed the physical channel count?

drivers/dma/ste_dma40.c:d40_allocate_channel() {
    ...
            for (i =3D phy_num; i < phy_num + 2; i++) {
                if (d40_alloc_mask_set(&phys[i], ...
    ...
}

Could this cause out-of-bounds accesses on the phys array, as well as
arbitrary MMIO writes later in __d40_set_prio_rt() which uses the
unvalidated group multiplier?

drivers/dma/ste_dma40.c:__d40_set_prio_rt() {
    ...
        writel(bit, d40c->base->virtbase + rtreg + group * 4);
    ...
}

[Severity: High]
This is also a pre-existing issue, but is the validation in
d40_validate_conf() bypassed for memcpy channels configured via the
Device Tree?

In the fallback configuration path d40_config_memcpy(), the driver
assigns dev_type directly from the dma40_memcpy_channels array without
calling d40_validate_conf():

drivers/dma/ste_dma40.c:d40_config_memcpy() {
    ...
        d40c->dma_cfg.dev_type =3D dma40_memcpy_channels[d40c->chan.chan_id=
];
    ...
}

If the device tree supplies an arbitrarily large ID for a memcpy channel
via the memcpy-channels property, could this unvalidated dev_type cause
an out-of-bounds write into lookup_log_chans during allocation, subverting
this patch's fix?

drivers/dma/ste_dma40.c:d40_allocate_channel() {
    ...
        d40c->base->lookup_log_chans[d40c->log_num] =3D d40c;
    ...
}

[Severity: High]
Another pre-existing issue, but is there a risk of a global buffer overflow
when reading memcpy-channels from the Device Tree?

The dma40_memcpy_channels array is statically sized with exactly 6 elements:

drivers/dma/ste_dma40.c:
static int dma40_memcpy_channels[] =3D {
    DB8500_DMA_MEMCPY_EV_0,
    ...
    DB8500_DMA_MEMCPY_EV_5,
};

However, in d40_probe(), the DT parsing logic reads memcpy-channels up to
D40_MEMCPY_MAX_CHANS (which is 8) via of_property_read_u32_array():

drivers/dma/ste_dma40.c:d40_probe() {
    ...
        of_property_read_u32_array(np, "memcpy-channels",
                                   dma40_memcpy_channels,
                                   num_memcpy);
    ...
}

If a Device Tree blob provides 7 or 8 elements in the memcpy-channels
property, will the driver write past the end of the 6-element array during
initialization?

> +
> +	if (invalid_dev_type ||
> +	    (!is_log && conf->dev_type > d40c->base->num_phy_chans)) {
>  		chan_err(d40c, "Invalid device type (%d)\n", conf->dev_type);
>  		res =3D -EINVAL;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-dma40-fixe=
s-v1-0-5e14815ad689@kernel.org?part=3D4
