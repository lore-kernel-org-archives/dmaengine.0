Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942621990A7
	for <dmaengine@vger.kernel.org>; Thu,  6 Aug 2026 12:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786020506; cv=none; b=F8H8iAfKbNSzwILINgRAssuhUHa2YRdyVsoxUPSrz9kSaPHNuRzxzwkSO++GlYUcriXRqrz3d0nfriE2A4BsJSYMbDj8gr6VQRiOQnheb5D+x1k+0MkPbSpuyDL/T+3GRuvxBFlJaSqCEsTZkP1gKMhKXx9SmKsbe48nFmOHJGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786020506; c=relaxed/simple;
	bh=mojwWIO1ILmrdkvSkY3WAKSSb11ks5AScc4fOV3gEGg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vcn5sR2RgUjtYB5IjdtbE6AlvJA46N/cuAfmQRKUznuPlrYoJfMDMDyHUIUTV2Uz2GWXg7n6quGib9UJvT1tr3AEn5pQMqEt0C6GPFkeSnxZA1+JILWfv/oDG58Iyj4ClDzuHOuhl8BZ4ZT5zSL92XiFDpML+bYGzL/66kdjGeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdhxfGfm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdhxfGfm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014A81F000E9;
	Thu,  6 Aug 2026 12:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786020505;
	bh=q5Ja/+davtim0i4b+m6ntF84ccJ8HBSy+hZdVZ21Ot8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OdhxfGfmTWtbLC24yLci2Nk8XS3kEDjugQrBVkDYkpfg3qDYN+OjvX71d8MDYILmE
	 Ihra4hLLYXW1/Lz3g00EJcAFTZhM7+pa4IMYHJSTl4UVgrj2MGu+WmilaMzBfdI9hy
	 tobI8cPlA1r0s2LRl2Nt50s8SD91hPHlijrs2wi3LZnEzBz43nyRttlxQ/Eu97P2lq
	 I9JiPjcsV2h7DVAayU3nB7Nz19NzFx6V1poa//d0nw/T6BFkobaSbfVu9vJxQr7uLq
	 r/bIzFfa/o/0YtxLoUqRhLVafDH8Wivd7Sknj6ILHurAspgoYPG8Sdqw60zSondVqx
	 O0wl6gg/pSeCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] dmaengine: zynqmp_dma: Fix alloc_chan_resources
 error cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Golla Nagendra" <nagendra.golla@amd.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260806123014.2120447-2-nagendra.golla@amd.com>
References: <20260806123014.2120447-1-nagendra.golla@amd.com>
 <20260806123014.2120447-2-nagendra.golla@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 12:48:24 +0000
Message-Id: <20260806124825.014A81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Stale list iteration pointers after dropping and reacquiring the l=
ock in zynqmp_dma_chan_desc_cleanup.
--

--- Patch [1]: [PATCH 1/6] dmaengine: zynqmp_dma: Fix alloc_chan_resources =
error cleanup ---
commit 8086a707a0f2604d248437e0453b7591161223d9
Author: Golla Nagendra <nagendra.golla@amd.com>

dmaengine: zynqmp_dma: Fix alloc_chan_resources error cleanup

Channel resource allocation can fail after runtime PM has been acquired
and after part of the descriptor state has been initialized. Without
proper rollback, the error path leaks a runtime PM reference and, on
coherent allocation failure, also leaks the software descriptor pool.

> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_=
dma.c
> index f6a812e49ddca..b7c5612806948 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c

[ ... ]

> @@ -516,6 +520,13 @@ static int zynqmp_dma_alloc_chan_resources(struct dm=
a_chan *dchan)
>  	}
> =20
>  	return ZYNQMP_DMA_NUM_DESCS;
> +
> +err_free_sw_desc_pool:
> +	kfree(chan->sw_desc_pool);
> +	chan->sw_desc_pool =3D NULL;
> +err_pm:
> +	pm_runtime_put_autosuspend(chan->dev);
> +	return ret;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but looking at
zynqmp_dma_chan_desc_cleanup() in drivers/dma/xilinx/zynqmp_dma.c,
can dropping the lock during iteration lead to list corruption?

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_chan_desc_cleanup() {
    ...
    list_for_each_entry_safe(desc, next, &chan->done_list, node) {
        ...
        if (dmaengine_desc_callback_valid(&cb)) {
            spin_unlock_irqrestore(&chan->lock, irqflags);
            dmaengine_desc_callback_invoke(&cb, NULL);
            spin_lock_irqsave(&chan->lock, irqflags);
        }
    ...
}

If a DMA client invokes dmaengine_terminate_all() from the callback,
zynqmp_dma_device_terminate_all() will acquire the lock and move all pending
and done descriptors (including the cached next pointer) to chan->free_list.

When the callback returns and the lock is reacquired, would the loop iterat=
or
operate on nodes linked in the free_list instead of done_list?

Since the loop condition checks against &chan->done_list, could this iterate
past the end of the list and trigger an out-of-bounds dereference?

Additionally, would calling zynqmp_dma_free_descriptor() again on a descrip=
tor
already moved to free_list cause desc_free_cnt to exceed its maximum limit
and corrupt the allocator state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806123014.2120=
447-1-nagendra.golla@amd.com?part=3D1
