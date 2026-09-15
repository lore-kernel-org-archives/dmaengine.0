Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B270E41D112;
	Tue, 15 Sep 2026 10:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466992; cv=none; b=dsixCnwZsZL4fMGVhefPB5S6vOwNgObovb53pOr91QMmlNV99KnWGwNwq66Lr9KRxpB1QhyfothNbPahdAl1mHjgyoKPMFCYUIHYha3QXdhIOs8VyVnNneIXbW9ko76IgxU7224NayaswVfHp55zHRrdvcO1U3+zr4SzoiDiAj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466992; c=relaxed/simple;
	bh=0d8AW04j6ZeFgJ4c0uEx4Ne8a9AlVDa/j/DF24QsWEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lZrVP9ldp/fp95E005S8M2cqU0bqUkh4a2CidEiG2y7PnNYRgt6DSLThzdqw9cGD/2IZQyjQIJVDims+uQIySMzghdL7lVgsupf8Q/SBanZxtSphltOHH4Cediix0ROqaqrrQPDmQ5Wa3QvN6qAPlaRS7yMEPSIJOnnDaU5NDWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KUpNiFJP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KUpNiFJP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789466991; x=1821002991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0d8AW04j6ZeFgJ4c0uEx4Ne8a9AlVDa/j/DF24QsWEE=;
  b=KUpNiFJPWjB3c85/DwHpZICpPLWjj6KwemA5CjYTXyEwldntWOEAt9Xy
   dLFFBDVOii1fiEd9KfTi5lrI3sGiUqu7+JlkZEWlNr9FAokXDkyoilhJ4
   EyWCLjchftJiKJLeRn+X+Tle5L0Z2zJrP2zUjdqF9w+qvSP2IaQToMxZu
   w/i1cGumswh0CP43XvxDU3k9P/OrT7l20FHRSUAmF6IvKh/uxaGhmN7/A
   ZilbM/BXpkb+5HkcoBMwZ5bjx7AkDRoSdgX0lQiWZUWvP4rtMv3fdJsjO
   gwmXyArM24uKMMvr6ZCHYQeU1uV/rA9KbWIW4V8+Ym4UPF454f4BgPPcf
   Q==;
X-CSE-ConnectionGUID: KoSF1LvyReeYl3KetdwgoA==
X-CSE-MsgGUID: zL2I8muWRBaw/gLTE8Vrqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115360981"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="115360981"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:09:47 -0700
X-CSE-ConnectionGUID: 6KAa62Q0Q8ql7BY528Qu4g==
X-CSE-MsgGUID: tKnat4EfTZSUkMp5WOouHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271517612"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 15 Sep 2026 03:09:40 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 7D1F3A5; Tue, 15 Sep 2026 12:09:32 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank Li <Frank.Li@nxp.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Tianchu Chen <flynnnchen@tencent.com>,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>,
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
Subject: [PATCH v1 7/7] dmaengine: Remove deprecated dma_request_slave_channel()
Date: Tue, 15 Sep 2026 12:04:28 +0200
Message-ID: <20260915100931.3593242-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No more users.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/dmaengine.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index c50497ecd52d..7596ebdac466 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -1763,15 +1763,6 @@ void dma_run_dependencies(struct dma_async_tx_descriptor *tx);
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

