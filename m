Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCB5450400
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787232895; cv=none; b=iW8tPBk9d7becebW+vbWxSrdWuw/zcyEr0BQ+YIJ8ALAL1iTrPO7nreTsSGKaf7u/GgfpzLdMt35JikYwqPwco9+VyoUVp+deZTbKduUAOi8ssxsm+P+BfTz2Spvl1RHDXQImvsTxZZyJDtEV3KybbKAudT3RjonXkGDqpVHGSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787232895; c=relaxed/simple;
	bh=ZWJPOHmqr2U/Y0QZngd2C+rlYqBTpJN8oElbiTq6uuo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H3ka9nFEyU2vBoVCGlr/WrOgqszq70mX1YNgLXfAIy3h6Xxba65nPfCz3f7CbSVQ/VYNM0Sb45TvpYwpED2HqXaL20JakiNZQC1mAghUAfxi3Qx6Xthj+MV2h2VRBTcaww37Ga/NuktIHjVa1MFtb9mokiwYgo2dY6yWnjvfV68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fzwzWVkk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fzwzWVkk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10C31F000E9;
	Thu, 20 Aug 2026 13:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787232893;
	bh=sFY4mGiQZZHYsPgxsBNi7Dr8m3NuYRvrUrqfMl8XWs8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fzwzWVkkAipDjAwhNbcEt4mKxREEymu6IXzeMYtaLpadsGed1CYDaYRfXdIGdomHg
	 AaPxuJURmj+U6ivu1hHAw0O2Exb0WgKTnMDpa1cr8zehLZSM2G+BZ2DG2LFSUsLB8d
	 oki8r4eyERrjvJxnQ9HgcP8H0nFp97jy/gmomloc9jyWLMoEo7WzQszCkvaNLVafJf
	 RIkWp4hW3LyEhkkqSGcW9869XAtALcRV0+hZQj2pJFtikmajKHXO7QS50Wc2aKog24
	 qp7b7IIlc5yeI6zoffqCtRDbXsJIoAGId5MxdRYsQrOYdgrDtJAAOv6UF9wG/hhqf7
	 AlpavYZsYa89A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/13] dmaengine: ste_dma40: Fix event group bounds
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260820-dma40-fixes-v2-11-63238334c707@kernel.org>
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
 <20260820-dma40-fixes-v2-11-63238334c707@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 13:34:53 +0000
Message-Id: <20260820133453.A10C31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The patch incorrectly rejects valid device types for event group 4=
, breaking DMA support for those devices on newer hardware (e.g., DB8540).

Pre-existing issues:
- [High] Logical channel allocation fails for fixed channels located outsid=
e the first physical channel block (j=3D0) due to a premature loop abort.
- [High] Missing bounds check on `phy_channel` when allocating fixed physic=
al mem-to-mem channels allows out-of-bounds array access.
- [High] Error paths in `d40_alloc_chan_resources()` drop a PM runtime refe=
rence that was never acquired, leading to an unbalanced refcount underflow.
--

--- Patch [11]: [PATCH v2 11/13] dmaengine: ste_dma40: Fix event group boun=
ds ---
commit 409873531e42fe4afcb7eb90c8da7d95a228b5d7
Author: Linus Walleij <linusw@kernel.org>

dmaengine: ste_dma40: Fix event group bounds

The dev_type validation can allow values whose derived event group has no
matching physical channel pair. This patch rejects dev_type values outside
the hardware event-group range and stops physical-channel searches before
indexing past phy_res.

Link: https://lore.kernel.org/dmaengine/20260819225008.5F9651F000E9@smtp.ke=
rnel.org/

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 7c777e410c104..e0c694a1fc8b0 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -1739,6 +1739,10 @@ static int d40_validate_conf(struct d40_chan *d40c,
>  	bool is_log =3D conf->mode =3D=3D STEDMA40_MODE_LOGICAL;
>  	bool invalid_dev_type =3D conf->dev_type < 0;
> =20
> +	if (!invalid_dev_type &&
> +	    D40_TYPE_TO_GROUP(conf->dev_type) >=3D D40_GROUP_SIZE / 2)
> +		invalid_dev_type =3D true;

[Severity: High]
Does this check incorrectly reject valid device types for event group 4?

Since D40_GROUP_SIZE is 8, D40_GROUP_SIZE / 2 is 4, which means any dev_type
mapped to event_group >=3D 4 (i.e. dev_type >=3D 64) is flagged as invalid.

Newer hardware like DB8540 has 5 event groups (0-4). The new out-of-bounds
safety is correctly handled later in d40_allocate_channel():

if (phy_num + 1 >=3D num_phy_chans)
        break;

Could this dev_type validation cause a regression by breaking valid logical
channels mapped to event group 4 on these devices?

[ ... ]

> @@ -1942,8 +1950,10 @@ static int d40_allocate_channel(struct d40_chan *d=
40c, bool *first_phy_user)
>  		return -EINVAL;
> =20
>  	/* Find logical channel */
> -	for (j =3D 0; j < d40c->base->num_phy_chans; j +=3D 8) {
> +	for (j =3D 0; j < d40c->base->num_phy_chans; j +=3D D40_GROUP_SIZE) {
>  		int phy_num =3D j + event_group * 2;
> +		if (phy_num + 1 >=3D num_phy_chans)
> +			break;
> =20
>  		if (d40c->dma_cfg.use_fixed_channel) {
>  			i =3D d40c->dma_cfg.phy_channel;

[Severity: High]
This is a pre-existing issue, but does this loop prematurely abort if a fix=
ed
channel isn't in the first physical block?

Looking at d40_allocate_channel(), when iterating over blocks of physical
channels for logical channels with use_fixed_channel =3D=3D true, it checks=
 if
the requested phy_channel matches phy_num or phy_num + 1 for the current
group j.

If they do not match, it prints an error and returns -EINVAL immediately:

drivers/dma/ste_dma40.c:d40_allocate_channel() {
    ...
    if (d40c->dma_cfg.use_fixed_channel) {
        i =3D d40c->dma_cfg.phy_channel;
        if ((i !=3D phy_num) && (i !=3D phy_num + 1)) {
            dev_err(chan2dev(d40c), "invalid fixed phy channel %d\n", i);
            return -EINVAL;
        }
    ...
}

Should this use continue instead of returning -EINVAL to allow checking the
remaining physical channel groups?


While reviewing the channel allocation logic, I noticed two other pre-exist=
ing
issues in the surrounding code.

[Severity: High]
This is a pre-existing issue, but can an unvalidated phy_channel lead to an
out-of-bounds array access when configuring fixed physical mem-to-mem chann=
els?

In d40_allocate_channel(), when configuring a physical DMA_MEM_TO_MEM chann=
el
with use_fixed_channel, the driver directly assigns phy_channel and uses
it as an index into the phys array:

drivers/dma/ste_dma40.c:d40_allocate_channel() {
    ...
    if (d40c->dma_cfg.dir =3D=3D DMA_MEM_TO_MEM) {
        if (d40c->dma_cfg.use_fixed_channel) {
            i =3D d40c->dma_cfg.phy_channel;
            if (d40_alloc_mask_set(&phys[i], is_src, 0, is_log, first_phy_u=
ser))
                goto found_phy;
        }
    ...
}

Since phy_channel is not validated against num_phy_chans in
d40_validate_conf() or locally in this block, could a misconfiguration via
device tree access memory outside the bounds of the phys array?


[Severity: High]
This is a pre-existing issue, but do the error paths in
d40_alloc_chan_resources() drop a PM runtime reference that was never
acquired?

If channel allocation fails, the function jumps to the mark_last_busy label,
which unconditionally calls pm_runtime_put_autosuspend(). However,
pm_runtime_get_sync() is only called after a successful allocation:

drivers/dma/ste_dma40.c:d40_alloc_chan_resources() {
    ...
    err =3D d40_allocate_channel(d40c, &is_free_phy);
    if (err) {
        chan_err(d40c, "Failed to allocate channel\n");
        d40c->configured =3D false;
        goto mark_last_busy;
    }

    pm_runtime_get_sync(d40c->base->dev);
    ...
mark_last_busy:
    pm_runtime_put_autosuspend(d40c->base->dev);
    ...
}

Could this lead to a refcount underflow and cause the device to suspend
prematurely?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-dma40-fixe=
s-v2-0-63238334c707@kernel.org?part=3D11
