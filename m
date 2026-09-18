Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8704ED19C;
	Fri, 18 Sep 2026 11:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731463; cv=none; b=hoy44p6esFSxBK9UIfDMPJVlvSUvYMoRmJkdFpoLJJea5TjRHkneT6S760pnTxBbclyHaPAuANBSCPuifkeZFCKp7P0bh5bRRjL4WkZzNriV3rA3lFupu+jwOSGiH99X1ZYiXGzlqKjZpiueod60JxedbqsvDpAOCN0e/h7Yjck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731463; c=relaxed/simple;
	bh=XLzgAaMNDk785gOrzo3Jw9J0cT01zC/WwTUadr7d3+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VQ5/3sBgsa09JD7roQeCXwCBWLcauR8R9FDh+o3wAxOH30yNmubqky09qA8NfW/GbNTd/pO0HGh6/s+/C69die3MnT284CMJfvr9UMdfJCbC50QSiETxYyG9/H2Mdq8x+7jBDEWbKO2jWtQ04hQ6QeDsZP1GlrvPQYEof6ZOGmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0zZCmxS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0zZCmxS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789731462; x=1821267462;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XLzgAaMNDk785gOrzo3Jw9J0cT01zC/WwTUadr7d3+M=;
  b=R0zZCmxSzDNv9IIquIGc9X/y1lbowQrsOx2ayGo4uMLnQCoDFTnRdjl4
   xXqSp6hEln0PyrZNj6Fs8XR2bHSMAM2Obzea5M0S7fL6nToKpPx33mb7q
   o/TlUNOa9OdL+IewIjeJebWtRDJuKuK+hEbAJMRlxs10rVqUn2PAml0xu
   /ymdAOFM1vQXP1y1oFrKA/qR1JvKjWz3KHeI1RsVsu1OlRcGL46zYbILq
   i33NYOsq1ohNMP4Exgo9UKOKPU828Bp7IVdO9UUhUhXYXPjnO36W/DDSn
   TXOegoNqqriv3x8bAqxLSSg+O4P8QYEN60UKTqU5IoO+hN6h5wLc9sgJc
   A==;
X-CSE-ConnectionGUID: kgFDnRYWSxiob3Gi+bIMiA==
X-CSE-MsgGUID: Oah3orXYSw+/SVr3JaRNDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="89367452"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="89367452"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:37:41 -0700
X-CSE-ConnectionGUID: StlknkQKRBWNDpL5Ln95KQ==
X-CSE-MsgGUID: 9pOIgltNRyOJG64WTtDAzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="2783682"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 18 Sep 2026 04:37:35 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5D2009B; Fri, 18 Sep 2026 13:37:29 +0200 (CEST)
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
Subject: [PATCH v2 1/7] ASoC: stm32: spdifrx: Drop mention of the deprecated and unused call
Date: Fri, 18 Sep 2026 13:34:05 +0200
Message-ID: <20260918113727.1898998-2-andriy.shevchenko@linux.intel.com>
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

The error message was not updated while driver moved from the
deprecated dma_request_slave_channel() to the dma_request_chan().
Update the message by replacing it with the correct function.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/stm/stm32_spdifrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index e0fef47a227e..0ece54740773 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -400,7 +400,7 @@ static int stm32_spdifrx_dma_ctrl_register(struct device *dev,
 	spdifrx->ctrl_chan = dma_request_chan(dev, "rx-ctrl");
 	if (IS_ERR(spdifrx->ctrl_chan))
 		return dev_err_probe(dev, PTR_ERR(spdifrx->ctrl_chan),
-				     "dma_request_slave_channel error\n");
+				     "dma_request_chan error\n");
 
 	spdifrx->dmab = devm_kzalloc(dev, sizeof(struct snd_dma_buffer),
 				     GFP_KERNEL);
-- 
2.50.1

