Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F11423EAB;
	Fri, 24 Jul 2026 10:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889781; cv=none; b=ibtTC+88KXWPCZFUZMnwpbia+EXVZzajAcN7f6yaw+b3+pna48MyDzU3zD1lHYWmhRoQf3/v48jub8iWn6OyWtY6+Ch+YIKZrCK3GGV6+w99YdiNMg/6wMcygOiJHjQpRanIPkj0abXQbGyv38EdreILIoyTJX+FpvvZYWYEHiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889781; c=relaxed/simple;
	bh=oYX9Hp9c8qxtud6Kn9BZVhGEoWUV/trV2r9x77P+EJk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=imzZ7m6bs7PxDSQfeHE+s8GkLIdi75OWR1bt80Xfxn5e34FI7MKqe6eR9L9UABB8kcknjl/utCmbNt79Xb7hSG+NBeucTtMi4W5JoL8l5kMoyFU3acUiUWJureSsHUvRtDU18H9o8Sb1o1S2y/IQJLKMW/aD3QHzRQd2auP93fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+QcJZ+c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+QcJZ+c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04861F000E9;
	Fri, 24 Jul 2026 10:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784889777;
	bh=unBA+twcs5wyjq0zSIErcN1eWUJcs4wgJx8ipNWbNKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X+QcJZ+cHMLjWeMUoOxKSJ6QkThAapqitkZcVytZax9rENho3lROqoodX6Rmb0lx1
	 rpVVZtraU7jHHZfcAd5ZXVGSRj57nLEoTIgmALPnU1p9a5gcUm1iF4k/EtzjOAasLP
	 2lh1O/Gz6HVJfqOnvLFtuk82SlCx+5MyFH921dYqfKGXXcrPSWmsAZxgkW/18k5Ure
	 2TyWL217/M8SF8HjrXJcmPl86ofli7nF5b08BV0GPTAm0m/+jJu1vCtxZMUsekvsnM
	 XIgbxGVoaMy0g38hS5g2xAEqj55oSZGBqbZ9ShK8jpUg9EBsOFP+9QgU+FlgbyI7sT
	 TkuauL5t/78hA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 10/19] dmaengine: ti: k3-udma: refactor resource
 setup functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724102115.2854-11-s-adivi@ti.com>
References: <20260724102115.2854-1-s-adivi@ti.com>
 <20260724102115.2854-11-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 10:42:55 +0000
Message-Id: <20260724104255.A04861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] Bitmaps allocated with `devm_kmalloc_array` remain uninitialized=
 if the optional SCI resource setup functions are not provided.
- [Medium] Missing NULL pointer check before invoking the `ud->udma_setup_r=
esources` callback.
- [Low] Exporting an overly generic symbol name `setup_resources` pollutes =
the global kernel namespace, and internal functions lack static scope.

Pre-existing issues:
- [High] Missing bounds check on hardware/firmware-provided resource ranges=
 leads to a potential out-of-bounds write in `udma_mark_resource_ranges`.
--

--- Patch [10]: [PATCH v7 10/19] dmaengine: ti: k3-udma: refactor resource =
setup functions ---
commit 3e6d342dd828c46abfda9610c9254ebd7a374ce5
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma: refactor resource setup functions

This commit refactors the resource setup functions for K3 UDMA variants by
moving shared logic to a common file. It splits SCI resource setup into
variant-specific functions and uses function pointers to retain existing
functionality.

> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-com=
mon.c
> index 472903e7d1a9f..8b2a3be3fa932 100644
> --- a/drivers/dma/ti/k3-udma-common.c
> +++ b/drivers/dma/ti/k3-udma-common.c

[ ... ]

> +int bcdma_setup_resources(struct udma_dev *ud)
> +{
> +	int ret;
> +	struct device *dev =3D ud->dev;
> +	u32 cap;

[ ... ]

> +	ud->bchan_map =3D devm_kmalloc_array(dev, BITS_TO_LONGS(ud->bchan_cnt),
> +					   sizeof(unsigned long), GFP_KERNEL);

[Severity: Medium]
Because devm_kmalloc_array() does not zero the allocated memory, will
ud->bchan_map remain uninitialized if the optional
bcdma_setup_sci_resources() callback isn't set or fails to populate it?=20

Later in setup_resources():

    if (ud->bchan_cnt)
        ch_count -=3D bitmap_weight(ud->bchan_map, ud->bchan_cnt);
       =20
Could this call bitmap_weight() on uninitialized memory, leading to
corrupted channel counts? Using devm_bitmap_zalloc() might ensure the
bitmaps are safely initialized.

> +	ud->bchans =3D devm_kcalloc(dev, ud->bchan_cnt, sizeof(*ud->bchans),
> +				  GFP_KERNEL);

[ ... ]

> +int setup_resources(struct udma_dev *ud)
> +{
> +	struct device *dev =3D ud->dev;
> +	int ch_count, ret;
> +
> +	switch (ud->match_data->type) {
> +	case DMA_TYPE_UDMA:
> +		ret =3D ud->udma_setup_resources(ud);

[Severity: Medium]
Should there be a NULL pointer check here before invoking=20
ud->udma_setup_resources(ud)? While the current code might populate it=20
unconditionally, other variant callbacks in this file are guarded with
NULL checks before invocation.

> +		break;

[ ... ]

> +EXPORT_SYMBOL_GPL(setup_resources);

[Severity: Low]
Does exporting setup_resources with such a generic name risk polluting the=
=20
global kernel namespace? Renaming it to something like=20
k3_udma_setup_resources might avoid future linking collisions.

> diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
> index 329df7eb156b2..5e222ce366faf 100644
> --- a/drivers/dma/ti/k3-udma.h
> +++ b/drivers/dma/ti/k3-udma.h

[ ... ]

> @@ -679,6 +682,11 @@ struct udma_bchan *__udma_reserve_bchan(struct udma_=
dev *ud, enum udma_tp_level
>  struct udma_tchan *__udma_reserve_tchan(struct udma_dev *ud, enum udma_t=
p_level tpl, int id);
>  struct udma_rchan *__udma_reserve_rchan(struct udma_dev *ud, enum udma_t=
p_level tpl, int id);
> =20
> +int udma_setup_resources(struct udma_dev *ud);
> +int bcdma_setup_resources(struct udma_dev *ud);
> +int pktdma_setup_resources(struct udma_dev *ud);
> +int setup_resources(struct udma_dev *ud);

[Severity: Low]
Since bcdma_setup_resources() and pktdma_setup_resources() are only called=
=20
internally within k3-udma-common.c, could they be declared static in the C=
=20
file instead of being exposed globally in this header?

[Severity: High]
This is a pre-existing issue, but I noticed a potential out-of-bounds write=
=20
in udma_mark_resource_ranges() in k3-udma-common.c:

void udma_mark_resource_ranges(struct udma_dev *ud, unsigned long *map,
                               struct ti_sci_resource_desc *rm_desc,
                               char *name)
{
    bitmap_clear(map, rm_desc->start, rm_desc->num);
    bitmap_clear(map, rm_desc->start_sec, rm_desc->num_sec);
    ...
}

Is it possible for firmware or device tree to provide a resource range wher=
e=20
rm_desc->start + rm_desc->num exceeds the allocated bitmap size? If this=20
happens, it seems it would silently corrupt adjacent memory on the heap.=20
Would it make sense to add bounds checking against the channel count before=
=20
clearing the bits?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724102115.2854=
-1-s-adivi@ti.com?part=3D10
