Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C6E175A7F;
	Mon, 28 Sep 2026 03:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565488; cv=none; b=QbzLtzyXMaI9abkeKFBaGDhEeSgSwkEOYKkKT4rKqoFiqRIu6VvkPPlw2kQ3EILUbIToUZPWLGVqqf4PmB7bx4dCmBmsqhGOBCINtxl3ls2yz2aMAKzff87obor8vrclRqrZo+Xlu3d8T1USPsQTFYKtGXkXr7Uvgtvkuy0gVnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565488; c=relaxed/simple;
	bh=B6cnQMX2SDLqeE+frScF75TPtN+R2oO6EKhwANssC8U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qxXrNjSl/kqhvCYrwC4+/8jmMc7t6rC13KuJX/avR0vLw47X0ZrT0Eor4V3ofKf7qi7yWtbxRz/bC4bndqEHRe3mXy4BGqtr/2Ohy97qyxc6lR7W/4Hn0YuN7Pvwfrv2L0k/gITG5zbod7DSVg9HLN3UeIWjlVr+9CPRlesLCUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rm857HN8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rm857HN8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505D71F000FF;
	Mon, 28 Sep 2026 03:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790565486;
	bh=87iIjPRWuFJFcy+pmBKFhpxs096+kNOeBzM8okWbU/8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rm857HN8f+PfPaVueARustJLiDkwcSMaYwiYtvXs77Xz3uZeYNd4a8td/tHK5SAKU
	 NUVGapSiaPHce/B/OPAcNKW1fZyqb6Rlm2d/SYxYaafN20Mq98O9ctlumBtzXbgYue
	 9GHy4a8naTXQ+o+s25gqLZopJKZqgNHchHGg0aKiKMHnUatOkBsG5ZuwVz71f3VaVO
	 Z5h92P7zBlvKWHKzIL5A5BHq8ZqNSHKJyhO0wovvKbiQH+370zJRsX7Um/W0HHj6/A
	 +LIs9dmrm6c/vDElQ7JhIKbqyFWD2V1b4v5IKPDOvxZAsUmiu8fCtyaxKZsQMVi46U
	 0M9H+WlziO6Qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 15/19] dmaengine: ti: k3-psil-am62l: Add AM62Lx PSIL
 and PDMA data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260928025749.1055383-16-s-adivi@ti.com>
References: <20260928025749.1055383-1-s-adivi@ti.com>
 <20260928025749.1055383-16-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 03:18:05 +0000
Message-Id: <20260928031806.505D71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] ti: k3-psil: Data race when reading/writing shared static endpoi=
nt configuration
- [Low] ti: k3-psil: Misleading error log prints channel ID instead of thre=
ad ID
--

commit fa7e3efdc8ec449e5c46f7824fe82e5b4d465743
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Subject: dmaengine: ti: k3-psil-am62l: Add AM62Lx PSIL and PDMA data

This commit adds PSIL and PDMA data for the AM62Lx SoC. It also introduces
a new PSIL endpoint type for multiple selectable FIFOs along with a new
fifo_id field.

> diff --git a/drivers/dma/ti/k3-psil.c b/drivers/dma/ti/k3-psil.c
> index c4b6f0df46861..153ed5fc79e53 100644
> --- a/drivers/dma/ti/k3-psil.c
> +++ b/drivers/dma/ti/k3-psil.c
> @@ -71,12 +72,68 @@ struct psil_endpoint_config *psil_get_ep_config(u32 t=
hread_id)
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
[ ... ]
> +	if (soc_ep_map->src) {
> +		for (i =3D 0; i < soc_ep_map->src_count; i++) {
> +			struct psil_ep *ep =3D &soc_ep_map->src[i];
> +
> +			if (ep->ep_config.mapped_channel_id !=3D (s16)channel_id)
> +				continue;
> +			if ((bool)ep->ep_config.pkt_mode !=3D is_pktdma)
> +				continue;

[Severity: Medium]
Could this iteration cause a data race?

This loop reads fields from the shared ep_config struct while holding
ep_map_mutex. However, in psil_set_new_ep_config(), the exact same
ep_config fields are mutated locklessly via:

    memcpy(dst_ep_config, ep_config, sizeof(*dst_ep_config));

Since this iteration reads fields inside ep_config while the memcpy()
overwrites them locklessly, a race condition appears to exist that could
lead to torn reads of endpoint configurations like mapped_channel_id or
the pkt_mode bitfield.

[ ... ]
> @@ -90,9 +147,34 @@ int psil_set_new_ep_config(struct device *dev, const =
char *name,
>  				       index, &dma_spec))
>  		return -ENOENT;
> =20
> -	thread_id =3D dma_spec.args[0];
> +	if (of_device_is_compatible(dma_spec.np, "ti,am62l-dmss-pktdma")) {
> +		bool dev_to_mem;
> +
> +		if (dma_spec.args_count < 1) {
> +			of_node_put(dma_spec.np);
> +			return -EINVAL;
> +		}
> =20
> -	dst_ep_config =3D psil_get_ep_config(thread_id);
> +		thread_id =3D dma_spec.args[0];
> +		dst_ep_config =3D psil_get_ep_config_by_id(dma_spec.args[0],
> +							  true,
> +							  &thread_id, &dev_to_mem);
> +	} else if (of_device_is_compatible(dma_spec.np, "ti,am62l-dmss-bcdma"))=
 {
> +		bool dev_to_mem;
> +
> +		if (dma_spec.args_count < 3) {
> +			of_node_put(dma_spec.np);
> +			return -EINVAL;
> +		}
> +
> +		thread_id =3D dma_spec.args[2];
> +		dst_ep_config =3D psil_get_ep_config_by_id(dma_spec.args[2],
> +							  false,
> +							  &thread_id, &dev_to_mem);
> +	} else {
> +		thread_id =3D dma_spec.args[0];
> +		dst_ep_config =3D psil_get_ep_config(thread_id);
> +	}
>  	if (IS_ERR(dst_ep_config)) {
>  		pr_err("PSIL: thread ID 0x%04x not defined in map\n",
>  		       thread_id);

[Severity: Low]
Is this error message misleading?

If psil_get_ep_config_by_id() fails to find a matching channel for the
ti,am62l-dmss-pktdma or ti,am62l-dmss-bcdma bindings, it returns an error
pointer without modifying the thread_id variable.

At this point, the thread_id variable still holds the raw channel ID
extracted from the device tree (such as dma_spec.args[0] or
dma_spec.args[2]). Printing it as "PSIL: thread ID 0x%04x not defined in
map" displays the channel ID as if it were a thread ID, which could cause
confusion during device tree debugging.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928025749.1055=
383-1-s-adivi@ti.com?part=3D15
