Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698B326FA60
	for <dmaengine@vger.kernel.org>; Fri, 14 Aug 2026 05:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786684252; cv=none; b=Gu3YyPCPGUKw9zCZRsdAlDblQqgFxI4eGpYVzaaUM6QxRiwffoJWSdzh6W0dQkWGoH5U8ZjuwI5/P8tn8+rQRS7TvJDrvqoq5j93QLhtoTmfzur4yaSLLZpRbYAA8FwPI0mp2poXSyjkP5bCx9Pr4iPSb9ejEn4FESG7sjTIq8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786684252; c=relaxed/simple;
	bh=nQ8jFePROpMbjkfNpckcckBmPNqPtMJy3/NNyW7iaK0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UkQjXK/wOsLh89d4+us2gamlzivuYQOpU3EPIqi3ud6j+hhEBuhhuSMVOLEp0i3mnRFE3T7UKFkX3uPVpo4UZw640La1sRSEKW2CTNsVu7YRI+wUlxLX2+u1Ok2krCCxZG/mFQgFp8kEDSqZuSmTpeAK1dL9IN/KblPCx9gLrOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hmZz+0Nr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hmZz+0Nr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B685F1F000E9;
	Fri, 14 Aug 2026 05:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786684251;
	bh=I9oQxfowTe/OxSp9iEyH1C/BxkL21aJAY9jamzdszfk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hmZz+0Nrun1+k6R10CrtlWnPtp+FaumdI0dDTg3iAzF+jmoSdlX/fcgAmDX1LWVrb
	 7UNPTc3pk8Gzm9O0FNGhdjDfkOXeq/9yCApsllk+yWpioPduOozYvZRdTvxKwtN44u
	 //rZZqA65aVhYiUFTjndHSc6rhOYzSvujeIiVPrlfgwcejIP6TwAXPYdfX7ceW2Eja
	 nl1mBsyv3aVaJjYc3Cdhd7aXxEA50M95BiICNg4ILNkwfPbDdIoLOdSW65xb9y+Onw
	 m1TJwdMLYwYsN/CWnmXII7ug0L/MfROMwCO5F9IAnWfjsxxYZ0x1pPVqW4JAqHKj7T
	 uXF4Yrwzg/bvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 6/8] dmaengine: zynqmp_dma: Use of_dma_is_coherent
 for dma-coherent
Reply-To: sashiko-reviews@lists.linux.dev
To: "Golla Nagendra" <nagendra.golla@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260814045616.1661199-7-nagendra.golla@amd.com>
References: <20260814045616.1661199-1-nagendra.golla@amd.com>
 <20260814045616.1661199-7-nagendra.golla@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 05:10:50 +0000
Message-Id: <20260814051050.B685F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing hardware context restore on system resume leads to DMA dat=
a corruption.
- [High] DMA descriptor structures lack explicit little-endian types, break=
ing on big-endian kernels.
--

--- Patch [6]: [PATCH V2 6/8] dmaengine: zynqmp_dma: Use of_dma_is_coherent=
 for dma-coherent ---
commit 85ed10a27c3d9299f4dbcb91c70a55052ad9638d
Author: Golla Nagendra <nagendra.golla@amd.com>

dmaengine: zynqmp_dma: Use of_dma_is_coherent for dma-coherent

Use of_dma_is_coherent() instead of parsing the common dma-coherent
device-tree property directly.

> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_=
dma.c
> index 5e81e0d950e8f..194abfd6cb25d 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c

[ ... ]

> @@ -947,7 +948,7 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_de=
vice *zdev,
>  	if (match_data)
>  		chan->irq_offset =3D match_data->offset;
> =20
> -	chan->is_dmacoherent =3D  of_property_read_bool(node, "dma-coherent");
> +	chan->is_dmacoherent =3D of_dma_is_coherent(node);

[Severity: High]
This is a pre-existing issue, but does the system resume path fail to
restore the DMA hardware register context?

A system suspend-to-RAM cycle causes the PM domain to power off, which
wipes the DMA register context. Upon resume, zynqmp_dma_resume() calls
pm_runtime_force_resume():

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_resume() {
    ...
    if (!device_may_wakeup(dev))
        return pm_runtime_force_resume(dev);
    ...
}

This re-enables clocks but doesn't call zynqmp_dma_init() to restore
critical registers like ZYNQMP_DMA_DSCR_ATTR and ZYNQMP_DMA_DATA_ATTR.

Will subsequent DMA transfers proceed with non-coherent hardware defaults
and silently bypass CPU cache snooping?


[Severity: High]
This is also a pre-existing issue, but are the hardware descriptor fields
missing explicit little-endian types?

The hardware descriptor layout uses native C types instead of __le32 and
__le64:

struct zynqmp_dma_desc_ll {
    u64 addr;
    u32 size;
    u32 ctrl;
    u64 nxtdscraddr;
    u64 rsvd;
};

When the driver is built on a big-endian architecture (like ARM64 with
CPU_BIG_ENDIAN), the native assignments in zynqmp_dma_config_sg_ll_desc()
will store values in big-endian format:

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_config_sg_ll_desc() {
    ...
    sdesc->size =3D ddesc->size =3D len;
    sdesc->addr =3D src;
    ddesc->addr =3D dst;
    ...
}

Could the little-endian ZynqMP DMA hardware misinterpret these swapped
sizes and addresses, leading to corrupted DMA transfers and memory corrupti=
on?

>  	zdev->chan =3D chan;
>  	tasklet_setup(&chan->tasklet, zynqmp_dma_do_tasklet);
>  	spin_lock_init(&chan->lock);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814045616.1661=
199-1-nagendra.golla@amd.com?part=3D6
