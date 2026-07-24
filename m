Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6317A3859E0;
	Fri, 24 Jul 2026 10:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784890136; cv=none; b=PrgFZu0HR9JKt9W3nsycq5/vDBNKZ+M9IQtem1tF1mVktYKIhoAiB8yxO3U04Rrd9mupFOZ1Y8Npwx7snYxJLfcYyxcR/+dnrW/Em2E7y6+EZQKonYuLKVXIVseisB77M2WvibFsjmcrY14TUxIDW1AsZ7mbNzOjlIbzNrvK7g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784890136; c=relaxed/simple;
	bh=U+4kGWb/OH++9k/cnyaAqWRscGLl1Gjnp6J1XeJZJ6U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bRXBl4BbxESFRm6GLO3mgC2/rrjcApiV5myXOgRrHjNZb6oRdZXCbJ+Tslx2W8zSwV/xDi31hGfpF9jnr492hqdmTv7fVWwS7P4pGWKpnncxQXCfyzj2nwftH3VTxX9HXpCE1GrakTgGCzY9QVZULI8wVqPx5vHQCCR7ibjqW8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkPFEjWZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkPFEjWZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38971F000E9;
	Fri, 24 Jul 2026 10:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784890135;
	bh=AKyBkjl5p16HnZ20sR7ZVM26h8JtLCK599D6rzSUi8g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZkPFEjWZUaNQbZyeX8ChAtdd/j8iJrKgwuSJ5GwH0F6AJwxsus85I2JewuakN3am5
	 WCz3H4QWMlE1NjakjiuCK5sG0ywvsQTBzymdbrgKZYf78NcqUjq2dzceyeJZgn1pW/
	 xNqDpQIBy+hWs0C6hSL2yUlRCmuyY240bvox5on9F9qdhH/aRNCt8C9adbDAjYokWM
	 k8UjBEKnOnV1BR0EY+NUDjGbnp4s1rr/heRK8dSO6yjhPC8aU26nxeSgc0jGmOdERh
	 kvlRqaSmmagBwBcA8EyWx8LsERtVvAaesJkxESJVFO2YvKMSzy6e+/nuv5ip/e6Ha1
	 tYd9pPMF2XFCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 15/19] dmaengine: ti: k3-psil-am62l: Add AM62Lx PSIL
 and PDMA data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260724102115.2854-16-s-adivi@ti.com>
References: <20260724102115.2854-1-s-adivi@ti.com>
 <20260724102115.2854-16-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 10:48:54 +0000
Message-Id: <20260724104854.D38971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] NULL pointer dereference in psil_get_ep_config_by_id() if the SoC =
is not matched.
- [High] psil_set_new_ep_config() incorrectly checks the client device node=
 instead of the DMA controller node for compatibility.
- [Medium] Uninitialized stack variable 'thread_id' is logged on the error =
path, leaking stack memory.
--

--- Patch [15]: [PATCH v7 15/19] dmaengine: ti: k3-psil-am62l: Add AM62Lx P=
SIL and PDMA data ---
commit 508a30e21ce25dc9ce58a2b1505b256e86a5d8a4
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-psil-am62l: Add AM62Lx PSIL and PDMA data

Add PSIL and PDMA data for AM62Lx SoC.

Introduce new PSIL_EP_PDMA_XYMF type for channels that have multiple
selectable fifos. Also add a new fifo_id field to psil_endpoint_config
to specify the selectable fifo_id.

> diff --git a/drivers/dma/ti/k3-psil.c b/drivers/dma/ti/k3-psil.c
> index c4b6f0df46861..ed9c92d5a7b2b 100644
> --- a/drivers/dma/ti/k3-psil.c
> +++ b/drivers/dma/ti/k3-psil.c
[ ... ]
> @@ -71,6 +72,57 @@ struct psil_endpoint_config *psil_get_ep_config(u32 th=
read_id)
>  }
>  EXPORT_SYMBOL_GPL(psil_get_ep_config);
> =20
> +struct psil_endpoint_config *psil_get_ep_config_by_id(u32 channel_id,
> +						       bool is_pktdma,
> +						       u32 *thread_id,
> +						       bool *dev_to_mem)
> +{
> +	int i;
> +
> +	mutex_lock(&ep_map_mutex);
> +	if (!soc_ep_map) {
> +		const struct soc_device_attribute *soc;
> +
> +		soc =3D soc_device_match(k3_soc_devices);
> +		if (soc)
> +			soc_ep_map =3D soc->data;
> +	}
> +
> +	if (soc_ep_map->src) {

[Severity: High]
If soc_device_match() fails to find a match, soc_ep_map is not populated and
remains NULL. Will this unconditionally dereference soc_ep_map here?

> +		for (i =3D 0; i < soc_ep_map->src_count; i++) {
> +			struct psil_ep *ep =3D &soc_ep_map->src[i];
[ ... ]
> @@ -90,9 +142,22 @@ int psil_set_new_ep_config(struct device *dev, const =
char *name,
>  				       index, &dma_spec))
>  		return -ENOENT;
> =20
> -	thread_id =3D dma_spec.args[0];
> -
> -	dst_ep_config =3D psil_get_ep_config(thread_id);
> +	if (of_device_is_compatible(dev->of_node, "ti,am62l-dmss-pktdma")) {

[Severity: High]
Are we checking the compatibility of the correct device node here?

dev->of_node is the client device's node, which won't match the DMA
controller's compatible string. Should this check dma_spec.np instead?

> +		bool dev_to_mem;
> +
> +		dst_ep_config =3D psil_get_ep_config_by_id(dma_spec.args[0],
> +							  true,
> +							  &thread_id, &dev_to_mem);
> +	} else if (of_device_is_compatible(dev->of_node, "ti,am62l-dmss-bcdma")=
) {

[Severity: High]
This check also seems to use the client device node (dev->of_node) instead =
of
the DMA controller node.

> +		bool dev_to_mem;
> +
> +		dst_ep_config =3D psil_get_ep_config_by_id(dma_spec.args[0],
> +							  false,
> +							  &thread_id, &dev_to_mem);
> +	} else {
> +		thread_id =3D dma_spec.args[0];
> +		dst_ep_config =3D psil_get_ep_config(thread_id);
> +	}
>  	if (IS_ERR(dst_ep_config)) {
>  		pr_err("PSIL: thread ID 0x%04x not defined in map\n",
>  		       thread_id);

[Severity: Medium]
If psil_get_ep_config_by_id() fails to find a channel and returns an error
pointer, thread_id is left uninitialized. Does this cause the error log to
print uninitialized stack memory?

>  		of_node_put(dma_spec.np);
>  		return PTR_ERR(dst_ep_config);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724102115.2854=
-1-s-adivi@ti.com?part=3D15
