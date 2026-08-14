Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877174749FD;
	Fri, 14 Aug 2026 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714897; cv=none; b=mIZJ1I2cw/Ajt4nhxfOcoPx7maKk1dxLTIPj6XTdMS48FNd1y6ORlHRurN4KdlLdblLdASWy6egxSdsP/HUpVSMYLIxIQUYQeB257yoyP//NyECWKUBrRNQvLUj7L33fbqZydhioUpklRVm0e5LQT7neQnaWMKVopRGmX+mOrRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714897; c=relaxed/simple;
	bh=5SUNg3N1/3brsypI8WNQ+FAr89N4r9zgXj/8TE/SUNE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mZyYNQg+b4OwlmKyR28VM089j1xZIDVM19fEf4pkRcSw8splivdvhcUcSD/Is69fJgYzCrLXDQBBimZg3xRwurr32sIM+1YFch3+6zo6uGK69hMuPoA4+DcBtiqFVH7e9Oo0Iv6QLVkboHiwzZvmx7vTWuhjfM3UDMBkJimEuhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NSgAuVsH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NSgAuVsH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02C01F000E9;
	Fri, 14 Aug 2026 13:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786714895;
	bh=mHt869e8TqmWIIaDV0Mn9pbafD8PjpTQUGAPMqVUJTA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NSgAuVsHZdl+6fqYF+/UhcCsdnrwxyjssvvB2eugF7hAH0/n0MCgmfOSWAg0cICia
	 QjYEDGdedQXDm/w0RhoByjZL2+Y114/pMVH2vDNMguO7Aw+L9oE3+PR2oTaoMQZBu6
	 2sbQ2DlTMPatAVX9/3A1FLstLk2Z4h+BDImggUIsDZZIc7tQ+xvifQlZlATKN23Q2H
	 O08LQozKWIzmxHoRWrF66U/en5XkWtOACkY3G0Hd6XMGmvxxRaQ9wuUA9a3aiBUYdQ
	 VmJpVq/jYV/454LzVMkVlNpExjzPc52/0QmKtvL/7ghCV/Z21rR7er2T9f1oxBc58a
	 F2wB+Qn3eCKIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dmaengine: sun6i: fix non-atomic read of DMA
 position registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Lugnberg" <christian.lugnberg@soundtrack.io>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260814132906.70322-2-christian.lugnberg@soundtrack.io>
References: <20260814132906.70322-1-christian.lugnberg@soundtrack.io>
 <20260814132906.70322-2-christian.lugnberg@soundtrack.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 13:41:34 +0000
Message-Id: <20260814134134.C02C01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] A race condition between two asynchronously scheduled tasklets=
 can lead to a Use-After-Free when calculating the residue of a completed D=
MA transfer.
- [Critical] The hardware DMA descriptor (`struct sun6i_dma_lli`) uses nati=
ve `u32` fields instead of `__le32` and lacks `cpu_to_le32()` conversions, =
which will cause data corruption on big-endian systems.
- [High] Lockless reading of `vchan->phy` before acquiring `vchan->vc.lock`=
 allows a race condition where `tx_status` can report the residue of a comp=
letely unrelated transfer.
--

--- Patch [1]: [PATCH 1/2] dmaengine: sun6i: fix non-atomic read of DMA pos=
ition registers ---
commit 6f389dcb6ffcfcb91977e76e00d8063e17e3119f
Author: Christian Lugnberg <christian.lugnberg@soundtrack.io>

dmaengine: sun6i: fix non-atomic read of DMA position registers

This commit fixes a race condition when reading DMA_CHAN_LLI_ADDR and
DMA_CHAN_CUR_CNT in sun6i_get_chan_size(). It implements a double-read
pattern to ensure both registers are sampled during the same descriptor
interval. This prevents inaccurate residue calculations that caused
phantom position jumps and false xrun reports.

> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index a9a254dbf8cb9..eb060ba2d4738 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -354,8 +354,10 @@ static size_t sun6i_get_chan_size(struct sun6i_pchan=
 *pchan)
>  	size_t bytes;
>  	dma_addr_t pos;
> =20
> -	pos =3D readl(pchan->base + DMA_CHAN_LLI_ADDR);
> -	bytes =3D readl(pchan->base + DMA_CHAN_CUR_CNT);
> +	do {
> +		pos =3D readl(pchan->base + DMA_CHAN_LLI_ADDR);
> +		bytes =3D readl(pchan->base + DMA_CHAN_CUR_CNT);
> +	} while (pos !=3D readl(pchan->base + DMA_CHAN_LLI_ADDR));
> =20
>  	if (pos =3D=3D LLI_LAST_ITEM)
>  		return bytes;

[Severity: High]
This is a pre-existing issue, but can sun6i_get_chan_size() be called with
a stale pchan?

Looking at sun6i_dma_tx_status(), the pchan pointer is read locklessly:

    struct sun6i_pchan *pchan =3D vchan->phy;
    ...
    spin_lock_irqsave(&vchan->vc.lock, flags);

If the sun6i_dma_tasklet() reallocates this physical channel to a different
virtual channel before the lock is acquired, pchan becomes stale. Once the
lock is held, sun6i_dma_tx_status() fails to find the original descriptor,
falls back to using the stale pchan, and calls sun6i_get_chan_size().

Will this result in calculating the residue based on a completely unrelated
transfer?

[Severity: Critical]
This is another pre-existing issue, but is it safe to trust pchan->desc when
calculating the size?

In sun6i_dma_tx_status(), if the descriptor is no longer in the active list=
s:

    } else if (!pchan || !pchan->desc) {
        bytes =3D 0;
    } else {
        bytes =3D sun6i_get_chan_size(pchan);
    }

If the vchan tasklet has just run, it might have already freed the descript=
or.
When sun6i_get_chan_size() is called, it dereferences this dangling pointer:

    struct sun6i_desc *txd =3D pchan->desc;
    ...
    for (lli =3D txd->v_lli; lli; lli =3D lli->v_lli_next) {

Could this race condition between the asynchronously scheduled tasklets lead
to a use-after-free?

[Severity: Critical]
This is also a pre-existing issue, but does the hardware descriptor layout
properly account for CPU endianness?

In struct sun6i_dma_lli, the fields are defined as native u32 rather than
__le32:

    struct sun6i_dma_lli {
        u32         cfg;
        u32         src;
        ...
    };

And in sun6i_dma_set_addr(), values are assigned directly without
cpu_to_le32() conversions:

    v_lli->src =3D lower_32_bits(src);
    v_lli->dst =3D lower_32_bits(dst);

Since the DMA controller reads these values from memory, won't this cause
data corruption and DMA faults on big-endian systems?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814132906.7032=
2-1-christian.lugnberg@soundtrack.io?part=3D1
