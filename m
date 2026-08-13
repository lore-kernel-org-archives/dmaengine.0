Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CE133FE15
	for <dmaengine@vger.kernel.org>; Thu, 13 Aug 2026 15:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635910; cv=none; b=Y0sOqUy2rO2cOwVKsR1GrMmu/tJwR0UjrMgDsp8JT2motHVwfumJfw9EQxpHGljbRoOrpRbrhOvJsvIbPR7PW3Pc54ls3dGGE++81vKwVrsa13y3xjGB13yMcBiPBLAWRsdhsixNgZFCDuM/CB8SNjJOrWJZ5SOiCoumv/yKAjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635910; c=relaxed/simple;
	bh=IkbMjJ2ke/8G74gAKGeZRHOb0BsLHP0S9FADrAjbFOo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rIh8uIOp7DIE8ws6Wot8dS/0mFzsdybWAW7AVdkxUv+B0/ttdUWp3wtDqZr0URoaYCoxdgR+5HlvmILzyvpQogXNxM9Pm0Ljtj9Sr60rBM1woeX4WHHuMmBgFJA04VnqFmvOn32HbDAd4Sh17mBGBPhfaKlzmHp0pMb48F/g1nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHB9/xXM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHB9/xXM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FC21F000E9;
	Thu, 13 Aug 2026 15:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786635909;
	bh=kFgXUe0ia+ZZAhITIDgTHjWeOLGChUkn6aulK9k4IW0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jHB9/xXMcdsTpmONQVfSYgfA1b1KHXmDmWRuJeW5TnLVkkwUGKFbt+9AYXczEa27h
	 jDSAJvqfgZE+rjzo+qwK6O4FWb4h8lfRGvU77Kkgr2nWNZOgvvDcnmksdwzrL6cGNd
	 6rOFliY64tbeou3V3c/9T7PFv1pL38Dz+J6uDNCJcREpvmyq1/2ojGB5C8DHIpdn6k
	 BVRJOru3WbZ3Avahc6xk8l3FXmknPjULvrQKArGaW3WyWu5UXWnVrGRoNlYqE2Mmod
	 iWVQ5xgpwkuPL3UCt8WGhtcNxf0hX3V0YehmewZ8+L58zeWzwvXIoDwS9oBXpNMfIh
	 rTHocVQo+ZuvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: img-mdc: Fix runtime PM usage counter leak
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ruoyu Wang" <ruoyuw560@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260813153143.3953303-1-ruoyuw560@gmail.com>
References: <20260813153143.3953303-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 15:45:08 +0000
Message-Id: <20260813154508.E5FC21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware register access before clock enablement during device pro=
be.
- [High] NULL pointer dereference when calculating residue for cyclic trans=
fers.
--

--- Patch [1]: [PATCH] dmaengine: img-mdc: Fix runtime PM usage counter lea=
k ---
commit ab74c845981a8cdefe6ab65f16f64bbdc3a65623
Author: Ruoyu Wang <ruoyuw560@gmail.com>

dmaengine: img-mdc: Fix runtime PM usage counter leak

pm_runtime_get_sync() leaves the IMG MDC device's usage counter
incremented when runtime resume fails. This patch replaces it with
pm_runtime_resume_and_get() so a failed resume does not retain a usage
reference, preventing runtime PM usage counter leaks.

> diff --git a/drivers/dma/img-mdc-dma.c b/drivers/dma/img-mdc-dma.c
> index b3765ba158030..a3192d49b6c86 100644
> --- a/drivers/dma/img-mdc-dma.c
> +++ b/drivers/dma/img-mdc-dma.c
> @@ -738,7 +738,7 @@ static int mdc_alloc_chan_resources(struct dma_chan *=
chan)
>  	struct mdc_chan *mchan =3D to_mdc_chan(chan);
>  	struct device *dev =3D mdma2dev(mchan->mdma);
> =20
> -	return pm_runtime_get_sync(dev);
> +	return pm_runtime_resume_and_get(dev);
>  }
> =20
>  static void mdc_free_chan_resources(struct dma_chan *chan)

[Severity: High]
This is a pre-existing issue, but I noticed a potential hardware register
access before clock enablement during device probe:

drivers/dma/img-mdc-dma.c:mdc_dma_probe() {
    ...
	mdma->clk =3D devm_clk_get(&pdev->dev, "sys");
	if (IS_ERR(mdma->clk))
		return PTR_ERR(mdma->clk);

	dma_cap_zero(mdma->dma_dev.cap_mask);
	dma_cap_set(DMA_SLAVE, mdma->dma_dev.cap_mask);
	dma_cap_set(DMA_PRIVATE, mdma->dma_dev.cap_mask);
	dma_cap_set(DMA_CYCLIC, mdma->dma_dev.cap_mask);
	dma_cap_set(DMA_MEMCPY, mdma->dma_dev.cap_mask);

	val =3D mdc_readl(mdma, MDC_GLOBAL_CONFIG_A);
    ...
}

In mdc_dma_probe(), MDC_GLOBAL_CONFIG_A is read to determine hardware
capabilities immediately after fetching the clock, but before the clock is
ever enabled. The clock is explicitly enabled only later via
img_mdc_runtime_resume() or by PM runtime.=20

If the bootloader has not left the clock enabled, could accessing the
unclocked peripheral's registers cause a system hang or synchronous external
abort?

[Severity: High]
This is also a pre-existing issue, but is it possible to encounter a NULL
pointer dereference when calculating the residue for cyclic transfers?

drivers/dma/img-mdc-dma.c:mdc_tx_status() {
    ...
		bytes =3D mdesc->list_xfer_size;
		ldesc =3D mdesc->list;
		for (i =3D 0; i < cmds; i++) {
			bytes -=3D ldesc->xfer_size + 1;
			ldesc =3D ldesc->next_desc;
		}
    ...
}

In mdc_tx_status(), the cmds variable is computed by adding unhandled hardw=
are
completions to mdesc->list_cmds_done. In cyclic mode, the CPU-side descript=
or
list is not circular, so the last descriptor's next_desc is NULL.

If the interrupt handler is delayed due to high system load, cmds might exc=
eed
the list length. Under these conditions, wouldn't the loop traverse past the
end of the list, causing ldesc to become NULL and dereferencing it on the
subsequent loop iteration's ldesc->xfer_size read?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813153143.3953=
303-1-ruoyuw560@gmail.com?part=3D1
