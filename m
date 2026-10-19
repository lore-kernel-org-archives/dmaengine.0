Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422877;
	b=2rMrzEk1ZRg9hxoC28qASmgchmJUQr5wxDT+CJtV1+Xq8oxSMY9pL6vRANFuCOVfuD3O
	 c3y52OTj3Q0l3lXNZ2C2xaRfjgDmOO2orHKMF++nfcWPahrIItL9MLV5/DVx+Cu344GgK
	 EvCM/J3oTJgFm8BJCJZ61+7UX+Eclrli6IrBqaQgYph8o0VZwHsPYgd+0YsxTXgm72YFs
	 dJ+aHjm5YrfuJIPb/zpv/Zoer4PhN/6OvVGV/VC0VtPI6/buP+z/qE35B3uGIgxpefHPx
	 A8pBRmKKC4l/faFT311CAXGWb/Yr+AciNIC54W9MzYvjBnVkNthLRFjR/ww0Wniv4qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422877;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=GwztzXGiW7OnAu9QbRSyq73Z8Eatn3pZ575kk94zIeU=;
	b=OHbwRgjShnsmAjXHEhCgDvk3BPy85EOMIwA34oFNzD2p6uqu3jq5WnZ1n96fBBJozTbA
	 ASOrqjGRvc6jrWuD3nBwfx76wEA0WnDrCXAwuvqorgewbksEPRDEYdVzxBtmrhMRAF8f2
	 9/WA6V7k+vBVzGWZZ9Fn2nThFNV6HysTwzrQwv6TJkrXNv9GeTSFBBpXp9ASkqUcJQl8E
	 Q4YaBvCqj4TXs5L9Crr1fxpyG2vBL3q9nNewmUgGX4DTPUYgtwqCitXYnsL1SmZ6OGTqu
	 4g9EIZZ1Wx0hKL29hbvYAXtmzQ1jQNFkSb07qMyXuQzoTKt4/YCAy1UdktyCGwY1pQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Cb/pLjbt";
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA15609CED4;
	Mon, 19 Oct 2026 15:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDA15609CED4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cb/pLjbt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792422876; x=1823958876;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OxZSt/jYZA56remEOs1LpCwtEvXYIh/MngBNA+cobgk=;
  b=Cb/pLjbtqHSrTwHgmm1m1TDPMaxt6VGIzMe0NbgnzO/0mEfp7zcAGVwD
   ZVwBIqRBqbS6J6FPvorBpA0e9eq46FXU2xcp0OUGBLt/cCv0osWd8t/tb
   l/NpaFq0dUV25OEpH+xhreC84r29mlZ7fTTAWePGcs10GjBqlC9bhpqHq
   oWqKn3fu9VvK9zI34qUr2l3wDxgzX5H04ubf/MvDuehKpONfNTdH+2+QE
   xCdvg8X8KWYu/OnLFmmQh+kCdRqI1wYl+EficcAtKDBd9xwDh2ISTrxQR
   EyRMGiGfG34a592L+1x2gl7h9vUy6d77xJowlW0zCO3wKzSO/hGT5VEMf
   Q==;
X-CSE-ConnectionGUID: ajG/gNPdTT64e6lpYil1mQ==
X-CSE-MsgGUID: cNubKg2ISlyvMjaiVSGCNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="992123"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="992123"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 08:14:36 -0700
X-CSE-ConnectionGUID: fMGnTY3hS0iQdJ3EoYwDkw==
X-CSE-MsgGUID: pdPHpR76Q/+JLFYQNK5E1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2636134"
Received: from jf5300-15a101203tc.jf.intel.com (HELO meta-crater2c.jf.intel.com) ([10.54.113.49])
  by fmviesa005.fm.intel.com with ESMTP; 19 Oct 2026 08:14:35 -0700
From: Daniel Byrne <daniel1.byrne@intel.com>
To: Vinod Koul <vkoul@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>,
	Frank Li <Frank.Li@kernel.org>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	dmaengine@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] [PATCH 0/3] dmaengine: polled completion status for out-of-order providers
Date: Mon, 19 Oct 2026 08:06:29 -0700
Message-ID: <20261019150632.4026424-1-daniel1.byrne@intel.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A client that polls transaction status on a device whose work queues
complete out of order, as DSA's do when several engines serve one
queue, cannot use the cookie-ordered dma_async_is_tx_complete(): the
completed-cookie watermark moves past descriptors still in flight.
These three patches add dmaengine_async_is_tx_complete() as the polling
API, routing the query to device_tx_status() without the cookie-window
outputs, implement it in idxd from a generation-numbered cookie that
reads the descriptor's own completion record, and drop
DMA_COMPLETION_NO_ORDER and DMA_OUT_OF_ORDER, whose only setter was
idxd. dmatest's polled mode is the in-tree user; the io_uring DMA copy
offload, to be posted separately, is the one that needs the exact answers.

This applies on top of "dmaengine: idxd: fixes found by an in-kernel
polling client", posted alongside, which the status implementation's
reset-epoch handling depends on.

Daniel Byrne (3):
  dmaengine: add dmaengine_async_is_tx_complete() for channel status
    queries
  dmaengine: idxd: generation-number transaction status
  dmaengine: drop DMA_COMPLETION_NO_ORDER and DMA_OUT_OF_ORDER

 Documentation/driver-api/dmaengine/client.rst |  24 +--
 .../driver-api/dmaengine/provider.rst         |  64 ++++---
 drivers/dma/amba-pl08x.c                      |   2 +-
 drivers/dma/at_hdmac.c                        |   5 +-
 drivers/dma/dmaengine.c                       |   2 +-
 drivers/dma/dmaengine.h                       |  21 ++-
 drivers/dma/dmatest.c                         |  14 +-
 drivers/dma/idxd/device.c                     |   1 +
 drivers/dma/idxd/dma.c                        | 159 +++++++++++++++++-
 drivers/dma/idxd/idxd.h                       |   3 +
 drivers/dma/idxd/irq.c                        |   8 +
 include/linux/dmaengine.h                     |  55 +++---
 12 files changed, 268 insertions(+), 90 deletions(-)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
prerequisite-patch-id: b50615a6696ce4ffa7e20911f77b9f7f0481f14f
prerequisite-patch-id: 36d833fd556bce04054a7e373ee46575186bb58c
prerequisite-patch-id: 3aeecac097eafb6812e10b9896a242c61c4ca5da
prerequisite-patch-id: 99e0468cdabf56a287c6a7f2d7ef06aa6d5a573e
prerequisite-patch-id: b1dd90551e6b671e751aae8d2a688d9db8f300f5
prerequisite-patch-id: c99a06be81e6a56d84a14bf9e00d2b48455c3a89
prerequisite-patch-id: 3e39b306130b75fedae70a328072dc9577818b9f
prerequisite-patch-id: b1d8fb5b5f7f478adca95f4c8b632480164d18b4
prerequisite-patch-id: b6d48ab83002f113833ba874be299c241788dd30
prerequisite-patch-id: 53bb73bdfd98cd78ca5d86b00ad7e96fcebf7ee6
prerequisite-patch-id: de44e2d44df13e8e07ae00df842d67c9d5c874d2
prerequisite-patch-id: 8191bc0ef2c849d2d9d55f73fc2169f695ea8594
prerequisite-patch-id: bfc55b104522278ca1fba36d3f4adb3a306267bc
prerequisite-patch-id: 12c1f4cba95509b8e7e87ce5c2f9c4265ec0c2df
prerequisite-patch-id: 6e859bfd95e53386bce02ac6585f09a067d0bb8e
prerequisite-patch-id: 2874936c0a5b3863db0309e06ee93008890a714e
prerequisite-patch-id: 85ef17aa68aecd398d3b47ad8df435ce715572e8
-- 
2.43.0

