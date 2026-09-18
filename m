Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5E24F0552;
	Fri, 18 Sep 2026 11:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731471; cv=none; b=SSJ3NMHYgNI2mBx4FFtbcEoHh39iOIUZNgoAAcIkHhWl742ummEY1A3bRbi+5Ese6LuSTBsHL8OaiQiaei3PDt0bDVozfy2Rog1rpqQAvoyq/IKL41uedWGtyEgnj3Ybmrw1pcBOt1lxU5IS9etUVyy0KVkcjHdbquincho7tck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731471; c=relaxed/simple;
	bh=YSI2Kqp03uJdGsxs/TigJRkMGLCix8Ae7tfRm9DSN0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B/WtHfyxrhc1Pe8YTOy+Rzm8CVcVKfHHUT4ueIhj4oAr3mwwXSbXGRhq5yxLK1I8VWK8pE8YFmWk2vb+2RWcDFsQFZnYq9Fjb4ZndOMw0nyxVUsr8sYy7PQnZs7LQS0IolfnYQvCjGxK59gEVPWKxN9nDXcVVRkilRoRsCf+d6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LyPt0Rsz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LyPt0Rsz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789731469; x=1821267469;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YSI2Kqp03uJdGsxs/TigJRkMGLCix8Ae7tfRm9DSN0Q=;
  b=LyPt0Rsz4dobQnAjwJhSt4QmxfeyodgDTe0xgtdP0CVvQVTiLhpy5yF3
   m7gSKNrPW6Ofev+5vIrJBsDgpkwM05D9T4nYAAxzIh8a3vzmlW8ZqUJlg
   woaFnM1WWV6VDEUHzqMIEsxfY4yURC1VeZW8vWAOgAmJ9KV3DayQV2rDR
   YkRptn/8q5mRZH7AJIunCf0qwpFaBvvMtZq8WMwtl4Qvp1C+4qDyK7B03
   jwshoNi6OpNHI2WUOjg6T8XemXL1z9a9K/vvKCu7XeYa2BY60hHwtkFO0
   rrn83n53RSy/qg8pfpdJkxe8zYbUJd2BC5W1AwuRGe1BLHKApdUfgIP5E
   w==;
X-CSE-ConnectionGUID: OyyztqV1SmSauExFqrJdnQ==
X-CSE-MsgGUID: KNH/gJ0/RjWHdU9daO+u1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="89367488"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="89367488"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:37:47 -0700
X-CSE-ConnectionGUID: c6DS/Y6KQE6nNfenLUwhZQ==
X-CSE-MsgGUID: dSLxz0Y6Sn2i5TM1ASrqFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="2783722"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 18 Sep 2026 04:37:41 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 7BEA3A5; Fri, 18 Sep 2026 13:37:29 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank Li <Frank.Li@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH v2 7/7] dmaengine: Remove deprecated dma_request_slave_channel()
Date: Fri, 18 Sep 2026 13:34:11 +0200
Message-ID: <20260918113727.1898998-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260918113727.1898998-1-andriy.shevchenko@linux.intel.com>
References: <20260918113727.1898998-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No more users.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/dmaengine.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index c3a49a33307c..1b57bc4a7e72 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -1768,15 +1768,6 @@ void dma_run_dependencies(struct dma_async_tx_descriptor *tx);
 #define dma_request_channel(mask, x, y) \
 	__dma_request_channel(&(mask), x, y, NULL)
 
-/* Deprecated, please use dma_request_chan() directly */
-static inline struct dma_chan * __deprecated
-dma_request_slave_channel(struct device *dev, const char *name)
-{
-	struct dma_chan *ch = dma_request_chan(dev, name);
-
-	return IS_ERR(ch) ? NULL : ch;
-}
-
 static inline struct dma_chan
 *dma_request_slave_channel_compat(const dma_cap_mask_t mask,
 				  dma_filter_fn fn, void *fn_param,
-- 
2.50.1

