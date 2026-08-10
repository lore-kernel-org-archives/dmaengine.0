Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCB53385B6;
	Mon, 10 Aug 2026 17:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786383310; cv=none; b=fBzG2nczPGhfX+D1lFBtgu4RM9hkGgSj/FiVXwmSLvPDkS06dg3GJGtRc6Y1iSTY8LODbaw78Bgmmb7pAgq5npBa1+8uJgXD9DeZmUbePSc7vKM1Jklcs2HAjT8yCWFrlR8dIvZwkOc3rwNud3lA3kEsEYSeqkv+FkAgxcJE6/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786383310; c=relaxed/simple;
	bh=YdqrW7bcMeq92CD/NAspTlEg4QSpyTisWyhqs2CCmL4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qcpWZeXekg03pEb6yuf0ueGKr3m+taNQ8qQyJBPDMqC+479gVPoLcZhOMVw6CuahLCvGcyJWmHjKP37OX/RNE8os2ZlzhXA6J5p+ZNeEmsujMQU/FRWyBGhgVo0Mx6GLiGdLxTPz2QPbsKAt03iwQTxCr9oxGOvesePTRgWM6N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q0GBFMBa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0GBFMBa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D691F000E9;
	Mon, 10 Aug 2026 17:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786383308;
	bh=lOaigcCRV0HRRLoN3lTVaMyuUhsSq3Xq2fGoekEU3lw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q0GBFMBaRZj38Ef0RlH2aFQVXD3sVP5qzqHwSdIOiJFBjnJBwxc0+APKYQxyl85SG
	 8JXna1d9z2Fs274m21CLTv6yNgaXAlEZ3N94STghcthZEv0JvmUrts/E+UWTvpSmYv
	 KfZiBzaqHBJwD3PUbrkg+nMA/ULdQGVRKmrsTxUJbUe3RjLh1ZQX0lbYvyzdfTEXsD
	 4Fk+DaaOo2dwesjlx8hRHdx5t9Ioqav19j51VHVcnPtanzlh292kgQJYVe1v+3nwFH
	 IDGVujEiMTVRv6pV0t7m8TfrWZfCTqa7EcCgJPYomQj12FNM4fb2CVAWZ6O2tx7iCR
	 Vnsi8KIfLH5xw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 19/19] dmaengine: ti: k3-udma: Validate resource ID
 and fix logging in reservation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260810151423.1948224-20-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-20-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 17:35:08 +0000
Message-Id: <20260810173508.86D691F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The K3 UDMA resource allocation APIs perform unprotected, non-atom=
ic test-and-set sequences on resource bitmaps, leading to concurrent alloca=
tions of the same hardware DMA channel.
- [High] Missing bounds check on `tflow_id` when allocating a transmit flow=
 in `udma_get_tchan()`, leading to potential out-of-bounds bitmap access an=
d incorrect error return.
--

--- Patch [19]: [PATCH v8 19/19] dmaengine: ti: k3-udma: Validate resource =
ID and fix logging in reservation ---
commit 491caa42a0fc50724787a5febd8ecf1dd0d46ac0
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
dmaengine: ti: k3-udma: Validate resource ID and fix logging in reservation

The __udma_reserve_##res macro currently lacks a bounds check for
the provided id. If a caller passes an ID exceeding the resource
count (ud->res##_cnt), test_bit() performs an out-of-bounds
memory access on the bitmap.

Additionally, the macro returns -ENOENT when a resource is already
in use, which is semantically incorrect.

Update the macro to validate the id, return -EBUSY instead of -ENOENT
for reserved resources, and properly print the resource name.

> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-com=
mon.c
> index d5d7158a37f8f..381e1a30c0be7 100644
> --- a/drivers/dma/ti/k3-udma-common.c
> +++ b/drivers/dma/ti/k3-udma-common.c
> @@ -2016,9 +2016,14 @@ struct udma_##res *__udma_reserve_##res(struct udm=
a_dev *ud,	\
>  					       int id)			\
>  {									\
>  	if (id >=3D 0) {							\
> +		if (id >=3D ud->res##_cnt) {				\
> +			dev_err(ud->dev,				\
> +				#res " id %d is out of bounds.\n", id);	\
> +			return ERR_PTR(-EINVAL);			\
> +		}							\
>  		if (test_bit(id, ud->res##_map)) {			\
> -			dev_err(ud->dev, "res##%d is in use\n", id);	\
> -			return ERR_PTR(-ENOENT);			\
> +			dev_err(ud->dev, #res "%d is in use\n", id);	\
> +			return ERR_PTR(-EBUSY);			\
>  		}							\

[Severity: High]
This is a pre-existing issue, but does this unprotected non-atomic
test-and-set sequence on the resource bitmap allow concurrent allocations of
the same hardware DMA channel?

If multiple client drivers request resources during parallel asynchronous
probe without external synchronization:

Driver 1 checks test_bit():
	if (test_bit(id, ud->res##_map)) { ... }

Driver 2 checks test_bit() concurrently:
	if (test_bit(id, ud->res##_map)) { ... }

Both drivers then proceed to set the same bit at the end of the macro:
	set_bit(id, ud->res##_map);

Could they both receive the same DMA channel?

This same unprotected pattern appears in __udma_get_rflow() and
__udma_alloc_gp_rflow_range().

[Severity: High]
This isn't a bug introduced by this patch, but while adding bounds checks
here, should we also add them to udma_get_tchan() in the same file?

In udma_get_tchan(), tflow_id is used in test_bit() and set_bit() on
ud->tflow_map without being validated against ud->tflow_cnt:

	if (test_bit(tflow_id, ud->tflow_map)) {
		dev_err(ud->dev, "tflow%d is in use\n", tflow_id);
		clear_bit(uc->tchan->id, ud->tchan_map);
		uc->tchan =3D NULL;
		return -ENOENT;
	}

	uc->tchan->tflow_id =3D tflow_id;
	set_bit(tflow_id, ud->tflow_map);

Can this write beyond the bounds of the bitmap if an invalid default_flow_id
is supplied from the Device Tree, or if tchan_cnt > tflow_cnt?

Additionally, it looks like this function still returns -ENOENT instead of
-EBUSY when a resource is already in use.

>  	} else {							\
>  		int start;						\

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810151423.1948=
224-1-s-adivi@ti.com?part=3D19
