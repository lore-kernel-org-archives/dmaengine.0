Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D4E42B316;
	Mon, 10 Aug 2026 16:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380328; cv=none; b=TSojYQQbDQ9IJNJc3fAxR4SMxB+TzT3tWIESTt38mWuGIYJCBOHMLEnVgRqm2V4Xu4rjsFQ1m7os09QuwYp04+tn/MnYOGnMVlhQaXgMZI7o/e3cjj/F6oO1FHGpENagFnxp4f7sJjmU11LZ+04MlFNgFQBR4g1bD7f32duUBVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380328; c=relaxed/simple;
	bh=LnZV7pNxPoU49IV3NFreZDbOpa6kDXDHFdKdcPs17f0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eHV43CGQAioDZ9DNjhpQiCkZboZ1H69d1m0luFP6gm43m8PK75gqgARoDYx4ypxqur3psExVPb2UuA0x87suS1CExNXGHjG2N0j2lw+Zab9+TQn1+e2hF0xtY2W7JgjI0O6oWdI9HxtRjpbJuvs1ruUSIm+eQxLo9s3sRbxfAxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqtWemoD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqtWemoD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B331F000E9;
	Mon, 10 Aug 2026 16:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786380327;
	bh=x69Az/UT7cTjMVgUeiTZh+wDpEQur6+hILmknmBHs4Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fqtWemoDpFhNA1EKAbPbmn+Ycicj0RLRH0U1nHce66O6NvCwaEU4yWMSrMKJXFeTV
	 agp0/iX3Wo/nORt4Ub1nzi6k6ztU8OYUWyCyJLZ9Xm7jmX2njnjA26ar2SCiMyyvXQ
	 k69hkkyGS32C0RWLPhUPYdqrsR38AdKxjIx9Z9oByj+XnpPjmDoq4YuGnMEi9CiD24
	 ipf+qhcw2hfbaGYPyTOXfotAwzdPY/Xy2kyQJtqVvUxP0Tm2R5BiCN6d7rlfYEC5G8
	 bgm7cInC0GLDjrkI1RwIEp3kiQLVqk7RjSokmF0HF+jGrA/BrLLdNWP6ysxrTYaKBO
	 dCw3VWpPdqw6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 15/19] dmaengine: ti: k3-psil-am62l: Add AM62Lx PSIL
 and PDMA data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260810151423.1948224-16-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-16-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 16:45:26 +0000
Message-Id: <20260810164526.C3B331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] psil_set_new_ep_config() uses the incorrect dma-cells index for BC=
DMA channel ID lookup.
- [Medium] Misleading error message on lookup failure in psil_set_new_ep_co=
nfig() logs '0x0000'.
--

--- Patch [15]: [PATCH v8 15/19] dmaengine: ti: k3-psil-am62l: Add AM62Lx P=
SIL and PDMA data ---
commit 341f27f741b8359a8b0d9ea36665be0d14b7d6b0
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-psil-am62l: Add AM62Lx PSIL and PDMA data

This commit adds PSIL and PDMA data for the AM62Lx SoC. It also introduces a
new PSIL_EP_PDMA_XYMF type for channels that have multiple selectable fifos
and adds a fifo_id field to the psil_endpoint_config structure.

> diff --git a/drivers/dma/ti/k3-psil.c b/drivers/dma/ti/k3-psil.c
> index c4b6f0df46861..3a9b43e179d1e 100644
> --- a/drivers/dma/ti/k3-psil.c
> +++ b/drivers/dma/ti/k3-psil.c

[ ... ]

> @@ -90,9 +147,22 @@ int psil_set_new_ep_config(struct device *dev, const =
char *name,
>  				       index, &dma_spec))
>  		return -ENOENT;
> =20
> -	thread_id =3D dma_spec.args[0];
> -
> -	dst_ep_config =3D psil_get_ep_config(thread_id);
> +	if (of_device_is_compatible(dma_spec.np, "ti,am62l-dmss-pktdma")) {
> +		bool dev_to_mem;
> +
> +		dst_ep_config =3D psil_get_ep_config_by_id(dma_spec.args[0],
> +							  true,
> +							  &thread_id, &dev_to_mem);
> +	} else if (of_device_is_compatible(dma_spec.np, "ti,am62l-dmss-bcdma"))=
 {
> +		bool dev_to_mem;
> +
> +		dst_ep_config =3D psil_get_ep_config_by_id(dma_spec.args[0],
> +							  false,
> +							  &thread_id, &dev_to_mem);

[Severity: High]
For devices matching ti,am62l-dmss-bcdma, does this code pass the trigger t=
ype
instead of the mapped channel ID to psil_get_ep_config_by_id?

If dma_spec.args[0] is the trigger type for a BCDMA node (which has 4 cells=
),
this lookup might consistently fail with -ENOENT since it will not match a
valid mapped channel ID. Would passing dma_spec.args[2] be the intended
approach here?

> +	} else {
> +		thread_id =3D dma_spec.args[0];
> +		dst_ep_config =3D psil_get_ep_config(thread_id);
> +	}
>  	if (IS_ERR(dst_ep_config)) {
>  		pr_err("PSIL: thread ID 0x%04x not defined in map\n",
>  		       thread_id);

[Severity: Medium]
When psil_get_ep_config_by_id fails to find the endpoint, it returns
ERR_PTR(-ENOENT) without updating the thread_id out-parameter.

Since thread_id is initialized to 0 at the start of psil_set_new_ep_config,
would this error path print an uninitialized thread ID (0x0000) upon a look=
up
failure? This might hide the actual failing channel or thread ID and make
debugging difficult.

>  		of_node_put(dma_spec.np);
>  		return PTR_ERR(dst_ep_config);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810151423.1948=
224-1-s-adivi@ti.com?part=3D15
