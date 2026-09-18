Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AEE4ED1B9;
	Fri, 18 Sep 2026 11:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731465; cv=none; b=PgGjqWqSqNPk9Mu9+/4yuU8Fi6IsrkFmg7uy3nBi1NDrbplWzhkPOu0aJykUhoOUACMtP7uTfpEP1jT+BHNbXKRRnpOcGtEVrqgoDN+P97dVunjayqRsgv2sToc15uaLX/1FOBY7egjIPTR0/XuwlfRHzhBUp5eXxWSX5GGJyAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731465; c=relaxed/simple;
	bh=3tCjl0Z1sktzbW2YwCZvEyafyorhC/cCFxIhMbEzRQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P7iT4Zsl5dg9p74TaaNADAOIzn8vywLGAhgHIUbfTm7L68VE33I3M6QMv/UEkRQXjcjgnqSlo8lgH504eYy2ARg+hTlXGy9krKMWu+wdCcgybguxY29jkkXsNI0Y2ckS0MF5L9nEFTEgtOzzpYBefXJi6ObeI6SqloridCQtvEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YbElPtlb; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YbElPtlb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789731464; x=1821267464;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3tCjl0Z1sktzbW2YwCZvEyafyorhC/cCFxIhMbEzRQg=;
  b=YbElPtlbs+O1E+arsrrnLqQ2/HGggUrITJi4W/4AauC+zyV96StuPh4S
   TqEidE44+RytS1YCpEDmxUdD9YDmoUPEETnA1U8VXMfaPTtPdcqjLgj0q
   Th305rkDe5dHLEYvb5WqceCoBwJdWgwGGE3cR5A3v1RxL8wsfQRA83Fxq
   WBdMliGm3PUuh5B/dX/sqrEtaR0VOnOTfv3wng0a5RzHA2wQ/XENeSFc2
   qtNLhKAWZLKDj8PhNWNmqeKMCgU4xrxqOE/3rc1EZ+ycenbMlI67pZNdK
   o0iA0VCHz+YsS25pc2AkrXfET1tPeTQ6qmol3z114evQUMj37GErfYtlt
   Q==;
X-CSE-ConnectionGUID: 4jU9DjdfSxilVl8Zpe6nIQ==
X-CSE-MsgGUID: Kuc5Aw6EQkSwd4NRohJkww==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="92739738"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="92739738"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:37:41 -0700
X-CSE-ConnectionGUID: Jf/bNaFCTZSqe9QU4FSD7g==
X-CSE-MsgGUID: 1EkaHw41Qp2XYb8vIyZBcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="271029220"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 18 Sep 2026 04:37:35 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5958099; Fri, 18 Sep 2026 13:37:29 +0200 (CEST)
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
Subject: [PATCH v2 0/7] ASoC et alia: Convert to use dma_request_chan()
Date: Fri, 18 Sep 2026 13:34:04 +0200
Message-ID: <20260918113727.1898998-1-andriy.shevchenko@linux.intel.com>
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

Changelog v2:
- Add a comment that errors are now propagated to the caller (Frank)
- Make sure the error pointer is not dereferenced (Sashiko, Mark)
- Collected tags

v1: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>

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

 drivers/gpib/fmh_gpib/fmh_gpib.c      | 10 +++++++---
 include/linux/dmaengine.h             |  9 ---------
 sound/soc/fsl/fsl_asrc.c              |  2 +-
 sound/soc/fsl/fsl_asrc_dma.c          | 19 +++++++++++--------
 sound/soc/fsl/fsl_asrc_m2m.c          | 15 +++++++++------
 sound/soc/fsl/fsl_easrc.c             |  2 +-
 sound/soc/pxa/pxa2xx-pcm-lib.c        |  9 ++++++---
 sound/soc/soc-generic-dmaengine-pcm.c |  8 +++++---
 sound/soc/sprd/sprd-pcm-compress.c    |  9 +++++----
 sound/soc/sprd/sprd-pcm-dma.c         |  9 +++++----
 sound/soc/stm/stm32_spdifrx.c         |  2 +-
 11 files changed, 51 insertions(+), 43 deletions(-)

-- 
2.50.1

