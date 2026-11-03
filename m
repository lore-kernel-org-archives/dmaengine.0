Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720097;
	b=5F06LbSYLVF/HWDkoweMb4f1b/y9U2Gm9i81svPf71OcVImvn9oZOGs94nJUsWGUulYq
	 7c2MnBS28coSsY+AP3Bx8ZLoZojcaba790l89YjxuyFmrctyAGIfM9NQqBb0rmOMBsTDc
	 qb5uPX70iJnzntBlppTk31nLe7oSgmw7eKDuh42lhup6LejK30yWM7aDbFuXBoM5yg9rX
	 KsZE0O9XjYdKtLjBe281ED4fSLADRkAT9O6FdxElAVag9EJN5lLk/3Ud2Z86GbzEgDWy8
	 miHhOZ0zi9J77QEAQiH4yCprLRWth5NkM42YEcqJlcdZr00Rd1rCvEo6vS6PqtL4/gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720097;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qRKSJuJfdvaq4TPk0dH3fL/nV91BhjtYgBu71pUkKew=;
	b=pKGPfUQUJS0x/qghNiKjCTus9bTqfcof0Er7V+4zm96nFsFT/SLaqoJ+RJYVsgORmleK
	 u+lNkUy9QJqSvLDsw9MDjghQfSYWrkW/kzIJBqNws7skyZEJfhVdlWWemK0UrmGGq3x9L
	 c4BvZBiIOF0rETT8l4yAaer+FOwhV/J+1Gx554xRqQpTtqWXzr7/E5KB6slIH9STTw28V
	 CK0a2O/6XgIGrDI95fKuRJgnp9fIGO3ETQKj/IwZq71j1qnouaQDrWIvwsu0fwEZIOaS/
	 UEJ6Ot9REGIOHjk9QsdYd97KywMJY6AW1D6fe9qveTuYmlvDyiG2SPMx4lIIHiMjgfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MsRDJTGO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4971B606D803;
	Tue,  3 Nov 2026 15:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MsRDJTGO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7B71F00919;
	Tue,  3 Nov 2026 15:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793720096;
	bh=qRKSJuJfdvaq4TPk0dH3fL/nV91BhjtYgBu71pUkKew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MsRDJTGO+JDw7BOZcoDziAEdfhP8fQdTnjN6aL8/Jh7bmrVp0kIdXRKnIVTWgEnZI
	 HCylapTJi4+ilie4mxin5myolbY3L5M85nmPt84za4mG+Hq75etdg8FR+llx0RwXoD
	 Oj2+pLYl+TFrsI9ES+BePCyE57NEJV8Do3L5AeTA3PmBIde9EIyGI6AaiIdUbBdgVl
	 UGBtY7pztDpiWOB7YPV+gzGaJbAyy+5gqaUbFbU1yrtFZaM98wJFzLIMBTauMJCAqY
	 4thQ1jFfwyegc978Vg9d1Tol0mV+bNwLqSNcm0latThYWQulKHdKFyAXZusd9mODFW
	 ReDmLbncjtYow==
Message-ID: <sashiko-outbox-195623@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/7] dmaengine: fsl-edma: support per-channel DT
 child nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261103-edma-iommu-v3-v4-6-470415d418c5@Example.Com>
References: <20261103-edma-iommu-v3-v4-0-470415d418c5@Example.Com>
 <20261103-edma-iommu-v3-v4-6-470415d418c5@Example.Com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:34:56 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dmaengine: fsl-edma: 64-bit modulo in fsl_edma_child_to_chan_id()
--

commit 76cf0654e1725c0e3aaa1017f35c2a7303b2f234
Author: Peng Fan <peng.fan@nxp.com>

dmaengine: fsl-edma: support per-channel DT child nodes

This commit adds support for parsing per-channel devicetree child nodes in
the fsl-edma driver to configure per-channel interrupts and IOMMU mappings.
It introduces helpers to derive the channel index from the child MMIO
address, obtain child interrupts before IRQ setup, and configure per-channel
IOMMUs after device registration.

> diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
> index 30d548a723462..8691676b3b692 100644
> --- a/drivers/dma/fsl-edma-main.c
> +++ b/drivers/dma/fsl-edma-main.c

[ ... ]

> @@ -703,6 +720,184 @@ static int fsl_edma3_attach_pd(struct platform_devi=
ce *pdev, struct fsl_edma_eng
>  	return -EINVAL;
>  }
> =20
> +static int fsl_edma_child_to_chan_id(struct fsl_edma_engine *fsl_edma,
> +				     struct device_node *child,
> +				     struct resource *parent_res)
> +{
> +	const struct fsl_edma_drvdata *drvdata =3D fsl_edma->drvdata;
> +	struct resource child_res;
> +	u64 offset, ch_id;
> +	int ret;
> +
> +	ret =3D of_address_to_resource(child, 0, &child_res);
> +	if (ret)
> +		return ret;
> +
> +	if (!resource_contains(parent_res, &child_res))
> +		return -EINVAL;
> +
> +	if (child_res.start < parent_res->start + drvdata->chreg_off)
> +		return -EINVAL;
> +
> +	offset =3D child_res.start - parent_res->start - drvdata->chreg_off;
> +	if (offset % drvdata->chreg_space_sz)
> +		return -EINVAL;
> +
> +	ch_id =3D div_u64(offset, drvdata->chreg_space_sz);

[Severity: Medium]
As reported by kernel test robot on v3 [1], in fsl_edma_child_to_chan_id() =
in
drivers/dma/fsl-edma-main.c, offset is a u64 and drvdata->chreg_space_sz is=
 a
u32. While the division uses div_u64(), evaluating offset %
drvdata->chreg_space_sz directly above it promotes drvdata->chreg_space_sz =
to
u64 and emits a 64-bit modulo library call (__umoddi3 or __aeabi_uldivmod),
which fails to link on 32-bit architectures when CONFIG_FSL_EDMA is enabled.

Could this use div_u64_rem(offset, drvdata->chreg_space_sz, &rem) to compute
both the alignment remainder and the channel ID quotient in a single step?

[1] https://lore.kernel.org/r/202611031650.EONIRpF4-lkp@intel.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-edma-iommu=
-v3-v4-0-470415d418c5@Example.Com?part=3D6
