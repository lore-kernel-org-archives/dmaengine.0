Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAAD284B4F
	for <dmaengine@vger.kernel.org>; Thu,  6 Aug 2026 12:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786020676; cv=none; b=A2XILzRNMvfYe+f/ldeO3u4V3lnV8Vgt49eg7lAVw2BcFzFBQEc5IUdj3hB/jU8tYSGsYZGkiGoS1/v9vMBQj9h9pwTSy3sbS2yK7VIVgoE8tE3Q7KL4IN2SPZEi4hGmxrCpWWqXmcp5h+fcIW10oB0wOocW/8fFaWllcs3Gvls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786020676; c=relaxed/simple;
	bh=1kcVieUNexqsCX76NP/YcwuTdE3EpQRjZ8+IiL2eWbA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O/7scaFXwRRLPhxSaocqT7d/aCHaTmNtsi14lXiwaZse+XIWYf2NmIEh/4Ef3bqo+jZbZUiYy96Ch9kV06MTlg788OiXkRcmYF3eZeBiRZ4ktufftIakNtLJMif1W+OIttQLffpFMfm6RR0qzWIUU8EiK8cfaBwU30beI/qed6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oc/DOuLj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oc/DOuLj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13D81F000E9;
	Thu,  6 Aug 2026 12:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786020675;
	bh=kL79HAfBfIVwnn266CTpy3kNz5uyyhPqOZkmA/B0Iwc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Oc/DOuLjEbJINrUsmrRCfITCopJv9ptL9i4Vr/7eQEP8tN1X6dAQvwZ2dDRPM9EVp
	 nNYM8qwBwhIVzhcMch91oK75+cgP7zATPlwhKm5hgsypywZ8R/27GlXUsrfb8NdABp
	 QjpCORF+9KcCEAofxSTAVKfUilA2KsO0OzP3v9Oy1+OzYKwBoZaUOGEXzAK5VwHpzT
	 7f5ndoSfgyGYLAZe8KpIZE7uhq4jw8HDSsnM2YLlJ5J0PrdsrXK8tFG10DwOHwSeub
	 v8R7YiwGFTUl6t+WaJVq91A2qKomhqDT+2cEIqD3N9OLcn/49VMm/66wj0XRDf31lC
	 k6qs5iAzi1uUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] dmaengine: zynqmp_dma: Fix chan probe error
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Golla Nagendra" <nagendra.golla@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260806123014.2120447-3-nagendra.golla@amd.com>
References: <20260806123014.2120447-1-nagendra.golla@amd.com>
 <20260806123014.2120447-3-nagendra.golla@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 12:51:14 +0000
Message-Id: <20260806125114.E13D81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Dropping a spinlock inside `list_for_each_entry_safe` in `zynqmp_d=
ma_chan_desc_cleanup` allows concurrent modification by `zynqmp_dma_device_=
terminate_all`, leading to list corruption and out-of-bounds memory accesse=
s.
--

--- Patch [2]: [PATCH 2/6] dmaengine: zynqmp_dma: Fix chan probe error hand=
ling ---
commit d9496c3d465362f9e2e30dc80285227c14d66d2b
Author: Golla Nagendra <nagendra.golla@amd.com>

dmaengine: zynqmp_dma: Fix chan probe error handling

This commit improves the channel probe error handling in the zynqmp_dma dri=
ver.
It fixes the IRQ registration by ensuring the correct error value is return=
ed
and that IRQ freeing in the remove path only occurs for valid numbers.
Additionally, it delays channel list registration until after successful IRQ
setup and cleans up the tasklet on probe failure.

> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_=
dma.c
> index b7c5612806948..f7e4a177bd17e 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a pre-existing iss=
ue
while reviewing the file.

In zynqmp_dma_chan_desc_cleanup():

	list_for_each_entry_safe(desc, next, &chan->done_list, node) {
		struct dmaengine_desc_callback cb;

		dmaengine_desc_get_callback(&desc->async_tx, &cb);
		if (dmaengine_desc_callback_valid(&cb)) {
			spin_unlock_irqrestore(&chan->lock, irqflags);
			dmaengine_desc_callback_invoke(&cb, NULL);
			spin_lock_irqsave(&chan->lock, irqflags);
		}

		/* Run any dependencies, then free the descriptor */
		zynqmp_dma_free_descriptor(chan, desc);
	}

Does dropping the spinlock inside list_for_each_entry_safe() expose the tra=
versal
state to concurrent modifications?

If a client driver calls dmaengine_terminate_async() concurrently,
zynqmp_dma_device_terminate_all() will acquire chan->lock and move all
descriptors from chan->done_list to chan->free_list (including the cached
'next' pointer).

When the lock is reacquired, the loop will blindly continue traversal on
chan->free_list instead of chan->done_list.

Since the loop termination checks against &chan->done_list, could it iterate
past the list head and treat it as a descriptor, leading to out-of-bounds
memory accesses?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806123014.2120=
447-1-nagendra.golla@amd.com?part=3D2
