Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8413840FDAD
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 15:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375050; cv=none; b=UIK2h9QyWA1Mv/v86HIp0wetx4fdML1v2e+zvEHZTAEhPn1TUUw7izMg0WnnfuI/H64oGcA+HG/TIfN7zTi4M8fzPSuWHdVewTdNN6uKJ9kWCSQ46vCJsbungVgMExFs1rrOF1SME0LppJI3Ls4bap++P21sShFRYJvUD1+Fi0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375050; c=relaxed/simple;
	bh=BcARo17C6i1yoPGDx1+tWdwnreJrWXKeXQKUaTNqTQQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tk7XWHN72NmdsyLrrNrFuj+BCMaS7MpQ0KsWXZUmM/S4q8Vz6RpHHU8CBLkDIx8gQ4I+MI/vtlM5e69lJ/+Lp2ZiNiif3h7FLiVcHF+oDI872Ssxu/NWvkbGHCoOyfFL7FHM16Kpi6YgHs8lzO6joZukT2vUhg/fdRff1S67bDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apGVkj+V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apGVkj+V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F7891F00A3A;
	Mon, 10 Aug 2026 15:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786375045;
	bh=BUSolQnXWtCZiKzAQ2fd+MS+tM+pDRc3yUeligiiuLQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=apGVkj+Vj9SnEl9CFN9NFd675YunbRnt5rcRONlImb+iqxy4/Gok9jvnqmc32Nbik
	 dDv9j541lBvRrtcSZQnPqaM2aDDD5Bub0e9ugVnTw24CRaUh5i7ymT0wEO/rMobBje
	 mJ6YdsVwJ2xGy1tXRmU+FDXaOrqvCsD1Ei2h9c6T8PmVVtLlA1wSbWUW/G968/JGaP
	 mx2pzoBZWviZcm4HOBzG68+ymTCFurMsfMOLMJrw+F+kzGB9nPTGJdJCXWKPIC110y
	 b77PbqZLKWZyAkRX/nvdfI1X7oa+/Bk8lpewCD0nm5JZzuJh9cmFU3nYCLlU7KUkJm
	 hDy5ZiRaDzNOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/9] dmaengine: Support bus widths of 32 bytes and
 above
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260810-dmaengine-support-wider-dma-masks-v2-1-1f7b798d035f@analog.com>
References: <20260810-dmaengine-support-wider-dma-masks-v2-0-1f7b798d035f@analog.com>
 <20260810-dmaengine-support-wider-dma-masks-v2-1-1f7b798d035f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:17:25 +0000
Message-Id: <20260810151725.8F7891F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Inconsistent state between legacy `u32` capabilities and new bus=
 width bitmaps due to legacy `device_caps()` modifications.
--

--- Patch [1]: [PATCH v2 1/9] dmaengine: Support bus widths of 32 bytes and=
 above ---
commit cae7966e8491d2d3566b285f48d250a84ed67596
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

dmaengine: Support bus widths of 32 bytes and above

This commit introduces bitmap-based bus width capabilities to support
bus widths of 32 bytes and above, which exceed the capacity of the
legacy u32 masks. Legacy u32 fields are kept alongside the new bitmaps
to allow incremental conversion of drivers.

> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -593,7 +593,25 @@ int dma_get_slave_caps(struct dma_chan *chan, struct=
 dma_slave_caps *caps)
>  		return -ENXIO;
> =20
>  	caps->src_addr_widths =3D device->src_addr_widths;
> +	if (bitmap_empty(device->src_bus_widths, DMA_SLAVE_BUSWIDTH_MAX)) {
> +		bitmap_zero(caps->src_bus_widths, DMA_SLAVE_BUSWIDTH_MAX);
> +		bitmap_from_arr32(caps->src_bus_widths,
> +				  &device->src_addr_widths, 32);
> +	} else {
> +		bitmap_copy(caps->src_bus_widths, device->src_bus_widths,
> +			    DMA_SLAVE_BUSWIDTH_MAX);
> +	}
> +
>  	caps->dst_addr_widths =3D device->dst_addr_widths;
> +	if (bitmap_empty(device->dst_bus_widths, DMA_SLAVE_BUSWIDTH_MAX)) {
> +		bitmap_zero(caps->dst_bus_widths, DMA_SLAVE_BUSWIDTH_MAX);
> +		bitmap_from_arr32(caps->dst_bus_widths,
> +				  &device->dst_addr_widths, 32);
> +	} else {
> +		bitmap_copy(caps->dst_bus_widths, device->dst_bus_widths,
> +			    DMA_SLAVE_BUSWIDTH_MAX);
> +	}
> +

[Severity: Medium]
Does this sequence leave the new bitmaps out of sync if a legacy driver
modifies the capabilities dynamically?

Later in dma_get_slave_caps(), the device_caps callback is invoked:

    if (device->device_caps)
        device->device_caps(chan, caps);

Some legacy drivers restrict bus widths dynamically in this callback by
modifying the legacy u32 fields directly. For example, in stm32-dma3.c:

stm32_dma3_caps() {
    ...
    caps->src_addr_widths &=3D ~BIT(DMA_SLAVE_BUSWIDTH_8_BYTES);
}

Because the new bitmaps are populated from the static device capabilities
before the callback is executed, won't these dynamic restrictions be missed
in the new bitmap fields?

When consumers migrate to the new API, could they see unsupported bus widths
as available, potentially leading to invalid configurations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-dmaengine-=
support-wider-dma-masks-v2-0-1f7b798d035f@analog.com?part=3D1
