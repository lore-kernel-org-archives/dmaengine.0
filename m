Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559132D837C
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 15:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375962; cv=none; b=al3W87lYR6ptJzmIqgmQiU1qFObOadaN/UYyGsQ5IlCVjqqJZe1AWuipSZJddm0CJxiovoZiZRsc1gx6fGnnax4DTQVyTu8ijWRvG0Hj7EBmqJk9iRVCv0DScyrmqYvZCcYGFErToASopx6WRcpxIKw3KTS/A9rLas7ELa6lekw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375962; c=relaxed/simple;
	bh=0D+maKdDPmdi0xSzOHunU6tmab8xfd/RK8dEpqC4HjA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RFkv4h85URuv3uhfUkcvu+KtfaKDBmVz9um+j2QbhPS8pK9cGRO7YJm6BbRNDxAGi0bBKD3Crz7cXsLwmQhy2GsGmTFHPx49/wPBtxJa21GflJn0y4Es0AlhL2irTndBJmjlipKhufdmBQl6FPLHOF5xH5Ohp7zeTh2Fi391Las=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWdzc6AW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWdzc6AW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C5861F000E9;
	Mon, 10 Aug 2026 15:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786375961;
	bh=l+2t98Dw+B4pCqMpqe5urPJHMx5IjKnmhNbJVvglSoc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lWdzc6AWasAbwKjKNmRCtEfmOsXeQV1pq14aowM0uYQiVLz2/RWajxiNSncPfLklg
	 tnuEj4oXFSPQiDwmNl7rZgaiCSmAX/ZQDAk4+5gKadjTYKaUIWot+zBczOQ99PkvBU
	 s6mncsJf5GB6/lex7kDtkkpPl9dYe0mSbYc7sx/BJMVWgnGTx9TCjQVvQ/vBZ2+UDA
	 ji8Gv8L9ZVdL2dES49sMeSpQh8ZbXYG+44I3038lXlufO7U21Pp44kRbLrAPvyoGEb
	 2qA1U+jmLOyHtoLNs2q0ccn7EivWu9FSb46UdKtMuR9+TpvFgrbCUv16NTsmkYXrcJ
	 xdDYmkVQFvtJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/9] iio: buffer-dmaengine: Use dma_slave_caps bus
 width accessors
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260810-dmaengine-support-wider-dma-masks-v2-6-1f7b798d035f@analog.com>
References: <20260810-dmaengine-support-wider-dma-masks-v2-0-1f7b798d035f@analog.com>
 <20260810-dmaengine-support-wider-dma-masks-v2-6-1f7b798d035f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:32:39 +0000
Message-Id: <20260810153240.5C5861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] DMA buffer alignment calculation uses `round_down()` with non-powe=
r-of-2 alignments, causing broken truncation
--

--- Patch [6]: [PATCH v2 6/9] iio: buffer-dmaengine: Use dma_slave_caps bus=
 width accessors ---
commit 5f03b0a586d9a871f77efec877e70d9047e60575
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

iio: buffer-dmaengine: Use dma_slave_caps bus width accessors

This commit updates the IIO DMA buffer to use the new dma_slave_caps
bus width helpers instead of decoding raw legacy width masks. This ensures
compatibility with DMA controllers using the new bitmap representation.

> diff --git a/drivers/iio/buffer/industrialio-buffer-dmaengine.c b/drivers=
/iio/buffer/industrialio-buffer-dmaengine.c
> index 98acce9098547..855e3662cd3dc 100644
> --- a/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> +++ b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> @@ -229,14 +229,13 @@ static struct iio_buffer *iio_dmaengine_buffer_allo=
c(struct dma_chan *chan)
>  		return ERR_PTR(-ENOMEM);
> =20
>  	/* Needs to be aligned to the maximum of the minimums */
> -	if (caps.src_addr_widths)
> -		src_width =3D __ffs(caps.src_addr_widths);
> -	else
> -		src_width =3D 1;
> -	if (caps.dst_addr_widths)
> -		dest_width =3D __ffs(caps.dst_addr_widths);
> -	else
> -		dest_width =3D 1;
> +	src_width =3D dma_slave_caps_get_src_width_min(&caps);
> +	if (src_width =3D=3D DMA_SLAVE_BUSWIDTH_UNDEFINED)
> +		src_width =3D DMA_SLAVE_BUSWIDTH_1_BYTE;
> +	dest_width =3D dma_slave_caps_get_dst_width_min(&caps);
> +	if (dest_width =3D=3D DMA_SLAVE_BUSWIDTH_UNDEFINED)
> +		dest_width =3D DMA_SLAVE_BUSWIDTH_1_BYTE;
> +
>  	width =3D max(src_width, dest_width);

[Severity: High]
This is a pre-existing issue, but does this alignment calculation
cause broken truncation when used with 3-byte bus widths?

If a DMA controller advertises a 3-byte minimum bus width
(e.g., using 24-bit transfers), width and subsequently
dmaengine_buffer->align will be set to 3.

In iio_dmaengine_buffer_submit_block(), this alignment is used:

    max_size =3D round_down(max_size, dmaengine_buffer->align);

The round_down(x, y) macro requires y to be a power of 2 because it
evaluates to (x & ~(y - 1)). When align is 3, round_down(max_size, 3)=20
yields (max_size & ~2) instead of properly rounding to a multiple of 3.

For example, round_down(30, 3) evaluates to 28 instead of 27.=20

This incorrectly aligned length is then assigned to block->bytes_used=20
and passed to the DMA controller, which could result in unaligned=20
transfer configurations and DMA controller faults.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-dmaengine-=
support-wider-dma-masks-v2-0-1f7b798d035f@analog.com?part=3D6
