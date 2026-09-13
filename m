Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A604282F21
	for <dmaengine@vger.kernel.org>; Sun, 13 Sep 2026 05:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789275744; cv=none; b=kjI7GcoOUrRQFOvzz4lTa6H7uB3r4REDsbIed6RFF8JSiLv37snsa9A0Rt7x/sEZT2TrUfGq/K7mUgATgQtVsDrltyAtCjnhtmkJkHevLppWGduj29FJ3cKhdVc/QkSSTkn66adK6hmPClFeXzF+Oz4agmG1ar6MDLjeWOZu2a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789275744; c=relaxed/simple;
	bh=GgHddRlY9bfRnJf2PT+1xEHCmPKnQ+lImlSZoOEUKBU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=keCitVROy85iFdcbqzozQ0KLEVwxBU9qyhQDN6Ae8S9PK9co9Dvdo436qbQ5pEcjlMQGiftWY6GQB2OBEP+6771uR+e9aGSxc4LonNnZGCQc3I/OJMhMDaUqzEjQbZRcZnqlw57lGElP2rCfV5l1f9PTQ9Iww+x7P0S4rUtESes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcGvhxhi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcGvhxhi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C621D1F000FF;
	Sun, 13 Sep 2026 05:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789275743;
	bh=W2Wm9sNAZtOdgx83/NRsPhmmg6eS5nBdztVNaim3z6g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KcGvhxhi2Asjifvk1f4QRBLEfFkzh3JAI7vHAbsVasdIiCp6DePBTZ0bDjVcVDlKg
	 fWCqztiGxZzxRDi8M/e2vEggW1YHYG1/iNUOelmIvQigS4gMQMbKz8iQl3aENTzxHa
	 hvJjhQ2YsprCVzT29CmWkktEJVPAUHQ/6git8g114p0H7G4ScGBK1gOao2ATGNokMo
	 C7dDMS4W2Z6sZOoJi/4wcE8N2duKSZLQ+T55B0se6f/t9VkjbHbVEnrHSAAi25GMBe
	 JQtxp58ObYbjsMTTbAKs7lQJy0K+AAq+BAij9vPS6aoZ69iTRUVW1Gr+hu2214flbR
	 YuPGfDSYv6wyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: fsl-dpaa2-qdma: fix ppriv memory leaks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260913045001.1126563-1-lgs201920130244@gmail.com>
References: <20260913045001.1126563-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 05:02:22 +0000
Message-Id: <20260913050222.C621D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Double free of DMA pools (`fd_pool`, `fl_pool`, `sdd_pool`) during=
 driver removal if channels were previously used.
- [High] Incorrect teardown sequence in `dpaa2_qdma_remove()` destroys hard=
ware state and channel resources before unregistering the DMA device.
- [High] Missing `tasklet_kill()` leads to Use-After-Free on the tasklet st=
ructures during driver removal.
- [High] Race condition in `dpaa2_qdma_remove()` leading to Use-After-Free =
in concurrent DPIO notifications.
--

commit 7bbc2b15c0a3c76af93c56c1e6c4036a65094cf2
Author: Guangshuo Li <lgs201920130244@gmail.com>

dmaengine: fsl-dpaa2-qdma: fix ppriv memory leaks

dpaa2_qdma_setup() allocates priv->ppriv separately from priv, but the
allocation is not released on all teardown paths. This commit frees
priv->ppriv on setup failures and during driver removal.

> diff --git a/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c b/drivers/dma/fsl-dp=
aa2-qdma/dpaa2-qdma.c
> index bf771251264d9..0f0fe0291a06f 100644
> --- a/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c
> +++ b/drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c
[ ... ]
> @@ -787,6 +790,7 @@ static void dpaa2_qdma_remove(struct fsl_mc_device *l=
s_dev)

[Severity: High]
This is a pre-existing issue, but is there a risk of a use-after-free
in the DPIO hardware notification callback during unbind?

Earlier in dpaa2_qdma_remove(), the DPIO store memory is freed:

    dpaa2_dpmai_store_free(priv);
    dpaa2_dpdmai_dpio_free(priv);

If a hardware notification triggers dpaa2_qdma_fqdan_cb() concurrently
between these two calls, it will heavily access the freed ppriv->store
memory. Should the DPIO service be deregistered before the memory it
depends on is destroyed?

>  	dpaa2_dpdmai_free_channels(dpaa2_qdma);

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for
dpaa2_dpdmai_free_channels() to cause a double free of the DMA pools here?

When a client releases a DMA channel, dpaa2_qdma_free_chan_resources()
destroys the pools but leaves the pointers intact:

drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c:dpaa2_qdma_free_chan_resources() {
    ...
    dma_pool_destroy(dpaa2_chan->fd_pool);
    dma_pool_destroy(dpaa2_chan->fl_pool);
    dma_pool_destroy(dpaa2_chan->sdd_pool);
    ...
}

If the driver is later unbound, dpaa2_qdma_remove() unconditionally calls
dpaa2_dpdmai_free_channels(), which iterates over the channels and calls
dma_pool_destroy() on these same pointers again. Could this lead to a
panic or memory corruption in the SLUB allocator?

> =20
>  	dma_async_device_unregister(&dpaa2_qdma->dma_dev);

[Severity: High]
This is a pre-existing issue, but does this teardown sequence destroy
hardware state and channel resources while the device is still exposed to
clients?

Because dma_async_device_unregister() is called after
dpaa2_dpdmai_free_channels(), the DMA device is still registered with the
DMA core during hardware teardown. Couldn't concurrent clients still submit
operations or request channels, attempting to access already-destroyed pools
or freed portals?

> +	kfree(priv->ppriv);
>  	kfree(priv);
>  	kfree(dpaa2_qdma);

[Severity: High]
This isn't a bug introduced by this patch, but does freeing dpaa2_qdma
here cause a use-after-free for pending tasklets?

The driver initializes a tasklet for each channel during setup:

drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.c:dpaa2_dpdmai_init_channels() {
    ...
    vchan_init(&dpaa2_chan->vchan, &dpaa2_qdma->dma_dev);
    ...
}

During removal, kfree(dpaa2_qdma) frees the structure containing these
channels and their embedded tasklets, but tasklet_kill() is never called.
If a tasklet is scheduled when the module unbinds, could this lead to a
use-after-free when the pending tasklet executes?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913045001.1126=
563-1-lgs201920130244@gmail.com?part=3D1
