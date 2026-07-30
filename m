Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A3B43B6D1
	for <dmaengine@vger.kernel.org>; Thu, 30 Jul 2026 14:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422316; cv=none; b=De8Fw2RpVv8OM/D1sIqtslMm+jY5+OqoFFfsVbbqDLUW8iQFnpWFvyEi9cDulbQL0eRzp3Pyou9w+NoivCE/BJKoIn8G9eF0q0TAZ95gOrgWFpxTsxnublPIfAaPnZ/K19jVb9VtvrpTDOEo8PigmFsiAWTgmvFaMbeSXx1EPeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422316; c=relaxed/simple;
	bh=ZyUbiyGmakpWn57YLmdFvCVf617Iz+yERZqU0QKYC3E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ud7PULofsCO5Hz0WGGb1nsYHbxfGVKSGZD14KO+DGoKHLicuXiSpQdmwkOnimmtHha3F3Qm+hlhbhOjv5k6yKqq54mGEG4abf3M99rh6pVSsNyFz8k7p+mqg8o/Vxh/rAR9DO27weM+QLeISnSh4znhk5aKjrSJMXEzoUNnheek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ayEDnDHB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ayEDnDHB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A071F00A3A;
	Thu, 30 Jul 2026 14:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785422314;
	bh=av9KE6vkheX9zL8x5ehOWAjGflqkjie4Qw2kbll1tbQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ayEDnDHBVR6gD+nw6nYm9v4EahiOh8c5UCcT4mLjk4XZZl6Nd0R/v8bIkbvHOhXY2
	 n99gaWMVBpK94PlbXC92UBA6+xhguBvbEjpjydcdFCprZpgtosHtTA0poIJdBK0jBE
	 aN2ZnncOdhTMUuYXVjDw6fpOtlWn/DEc2FneD/gAArq6O4bO6SX8hz+Ud95HYPQ5ub
	 ZUG1kKib7LNQ3rqKl6J/KFhGc1U/qV2uF9skTrAF+8s72S4dE/Zp+sBdXgiEkwkYBk
	 LwSxvLzmpz4vHHoWOcUXNSZIGdqFfuA2bHeXKp1wrOGWnggG11JpdWO3Z0zMJ7cJyj
	 5UAOXY8ZQfCwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/9] dmaengine: Support bus widths of 32 bytes and above
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260730-dmaengine-support-wider-dma-masks-v1-1-3732f1f9d9ca@analog.com>
References: <20260730-dmaengine-support-wider-dma-masks-v1-0-3732f1f9d9ca@analog.com>
 <20260730-dmaengine-support-wider-dma-masks-v1-1-3732f1f9d9ca@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 14:38:33 +0000
Message-Id: <20260730143834.36A071F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Legacy `device_caps()` callbacks cause desynchronization between t=
he legacy `u32` capability masks and the newly introduced bitmap fields in =
`struct dma_slave_caps`, leading to unsupported bus widths being falsely ad=
vertised to consumers.
--

--- Patch [1]: [PATCH 1/9] dmaengine: Support bus widths of 32 bytes and ab=
ove ---
commit 2d5a426ace9eaa0310bd634be5edc8e4ed522c24
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

dmaengine: Support bus widths of 32 bytes and above

Introduces bitmap-based bus width capabilities that span the full enum
range to support widths of 32 bytes and above. Retains the legacy u32
fields alongside the new bitmaps to allow incremental conversion of
producers.

> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 9049171df8578..7be23ba769d0d 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -593,7 +593,25 @@ int dma_get_slave_caps(struct dma_chan *chan, struct=
 dma_slave_caps *caps)
[ ... ]
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
>  	caps->directions =3D device->directions;
>  	caps->min_burst =3D device->min_burst;
>  	caps->max_burst =3D device->max_burst;

[Severity: High]
Does this setup cause a desynchronization between the new bitmaps and the
legacy u32 fields after device_caps() is invoked?

Looking at the end of dma_get_slave_caps() in drivers/dma/dmaengine.c:

	if (device->device_caps)
		device->device_caps(chan, caps);

	return 0;

Legacy drivers dynamically modify the u32 fields in their device_caps()
callback. For example, stm32_dma3_caps() in drivers/dma/stm32/stm32-dma3.c
modifies the capabilities:

	caps->src_addr_widths &=3D ~BIT(DMA_SLAVE_BUSWIDTH_8_BYTES);

Since the new bitmaps are initialized before device_caps() is called, and
there is no re-synchronization of the legacy u32 fields back to the bitmaps
after it returns, won't consumers querying capabilities using new helpers
like dma_slave_caps_intersect_widths() read the unmodified, stale bitmaps?

Could this result in consumer drivers configuring a DMA transfer with an
unsupported bus width?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-dmaengine-=
support-wider-dma-masks-v1-0-3732f1f9d9ca@analog.com?part=3D1
