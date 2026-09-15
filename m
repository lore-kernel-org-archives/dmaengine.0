Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91728470E80;
	Tue, 15 Sep 2026 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466985; cv=none; b=QyC3AIU7rlVdQ2hWWlrD+wN2xWk6hZC2Cc6GvcEC+bKsxXcmcSCgPb9xIuRB0sSRrP+VuWY9/+VmhYH3YbJqHH7W044sX6HelK/n2bDHPus2rYpWncPaa3m0jljylAQ0xWt84bF1R+AWDAFhU5YHmQ3h8aXYxU0O5AFtMihT9gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466985; c=relaxed/simple;
	bh=W9AeHQQ9O7vDh1ohv/edIAywDUCEHTQoqqfoGL/kpls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ppFyDYkIz9RLyHrUv7CDBBTMdC2qeJ4rFrb2QJnm8zTC8KE+LS0tg2Y3+/Ke4nxeu5JvToRUNQmbJtcQaQAwJIDpJj0RVF3ot8xXu4Zq4frKm0JR/CQCsOFm7/SiS/COOYqGOzWy3pU1vkDBCscPmBxhzmnknfSpbSBe9ChKqsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eDVblaWP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDVblaWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789466984; x=1821002984;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=W9AeHQQ9O7vDh1ohv/edIAywDUCEHTQoqqfoGL/kpls=;
  b=eDVblaWPGyBKkdAzqZuvJxFYCUKzHhCdXnroY6EumFywhJGCs22f5mj2
   lEk9Vjso3WuZ8Wwby/0Ty1jz1naFnmGx1zpdd9xkTZvRZVjGBaHFg38kQ
   1Y73gxtTunwKHSm+c182+k/gew8cxvSJEqcPX7wyyS1AAihphDfEE7Khi
   Jg8ep0bOGixD9RskFKeNJ03pxgtZhl44G+5UR+0sGQUXmJpLfGHcGEvwN
   C9kpplWmSUCLEQ0LOF39PwiFAN0U+DGFOPou1bMRgwA0aCwIKAgkigFJ7
   Bg90YDGdA7X8WbHMewss963KwHgg9uhRsAkIWIF4tONzXa5GrL1RyohAW
   Q==;
X-CSE-ConnectionGUID: +gppi7SyReOyVFrdCNYdew==
X-CSE-MsgGUID: i22q/XecQiWARxpslSizfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93524831"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93524831"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:09:41 -0700
X-CSE-ConnectionGUID: K1NmNoVzTm+8qhwkZ/RYog==
X-CSE-MsgGUID: zb6nhcKYRhehd3UVzZyxHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269670283"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 15 Sep 2026 03:09:33 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5BF7799; Tue, 15 Sep 2026 12:09:32 +0200 (CEST)
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
Subject: [PATCH v1 0/7] ASoC et alia: Convert to use dma_request_chan()
Date: Tue, 15 Sep 2026 12:04:21 +0200
Message-ID: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the last users (mostly in ASoC) to use dma_request_chan() and
drop deprecated dma_request_slave_channel() completely.

I think the best is to allow Mark to take the whole lot and provide an
immutable tag or branch to others (DMAengine and GPIB).

Andy Shevchenko (7):
  ASoC: stm32: spdifrx: Drop mention of the deprecated and unused call
  ASoC: sprd: Replace dma_request_slave_channel() by dma_request_chan()
  ASoC: soc-generic-dmaengine-pcm: Replace dma_request_slave_channel()
    by dma_request_chan()
  ASoC: pxa: Replace dma_request_slave_channel() by dma_request_chan()
  ASoC: fsl_asrc: Replace dma_request_slave_channel() by
    dma_request_chan()
  gpib: fmh_gpib: Replace dma_request_slave_channel() by
    dma_request_chan()
  dmaengine: Remove deprecated dma_request_slave_channel()

 drivers/gpib/fmh_gpib/fmh_gpib.c      |  7 ++++---
 include/linux/dmaengine.h             |  9 ---------
 sound/soc/fsl/fsl_asrc.c              |  2 +-
 sound/soc/fsl/fsl_asrc_dma.c          | 13 +++++++------
 sound/soc/fsl/fsl_asrc_m2m.c          |  8 ++++----
 sound/soc/fsl/fsl_easrc.c             |  2 +-
 sound/soc/pxa/pxa2xx-pcm-lib.c        | 10 +++++++---
 sound/soc/soc-generic-dmaengine-pcm.c |  8 +++++---
 sound/soc/sprd/sprd-pcm-compress.c    |  7 +++----
 sound/soc/sprd/sprd-pcm-dma.c         |  7 +++----
 sound/soc/stm/stm32_spdifrx.c         |  2 +-
 11 files changed, 36 insertions(+), 39 deletions(-)

-- 
2.50.1

