Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9014ED198;
	Fri, 18 Sep 2026 11:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731463; cv=none; b=rCFh7GozzNj0DVFqvhQW0VSiCH969KnBJ+p8QNvgBGBIyorNx24nz8FRZhBxoze7Pizmv8bV1cDQF5AJmlaAvm15OCXpS3sBun7DrLoq295UDE7Po/yRSugDa89SenHLhn+Ny52NPBal/GWGpGNaYAtasWEO7J748ezh4qsAgf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731463; c=relaxed/simple;
	bh=HBMn/5uoBJRDMKsyJnTaBaHBHzv4hmzBn/RwfpsTeuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XbAvNsG9bfOx5e3z+hR41KW5VsJ2LnOPD+vENExLmA7Y6SB1xF2ppSveTZ9gQRFu3yKp5sEBWCDD7PWRe0/yovbbbE5vWTWmO8XKgL3jksQo/lT/sDRp956jMMYjQw2zUZ//vuomhEp56OiWD0Qw8b91bMm4S1IbUhOU0NM/YOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hixdT9J0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hixdT9J0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789731461; x=1821267461;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HBMn/5uoBJRDMKsyJnTaBaHBHzv4hmzBn/RwfpsTeuY=;
  b=hixdT9J0ebvY3QHvsaxGhMCm3XvWSJxpRVECgaDg8mDrvv3x4uY0aZzt
   LcFAlv0aDcNZ/P/9T9y//KVOg7GAieuxL9KIxLZQY0OBqCsD1xZdl4Iu0
   KvJ0V9+ac/uSGyDTMhthMNE0SFMMkHNjaL6b5zlVJEz4T/YPH93hT1p7K
   RZAigk7BbJ1g4JtZI3yukdyi5TnSfkkvHMs8pxvGwyC75dHfqB6w7O4iI
   r+/bJeugAvHFb3PDj+16VlwTwG2M87oP0cz+kdeHR1T5g0hw0dxvMslQ9
   TsDmYfNKWTUqZPwqurOFxJCAWmkawdyUscjxxnZRMLEF4oDSf4AkPZ/Li
   Q==;
X-CSE-ConnectionGUID: f6+i7kDJSoaa07t0z0QGcg==
X-CSE-MsgGUID: hEWa3OUISGSB6eZqmxCs8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="92739721"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="92739721"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:37:40 -0700
X-CSE-ConnectionGUID: ojMW1seUSfORwlkiKf3M8Q==
X-CSE-MsgGUID: knn7zAWeRM+3HtKgvEjlkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="271029239"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 18 Sep 2026 04:37:34 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 67EEC9E; Fri, 18 Sep 2026 13:37:29 +0200 (CEST)
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
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 3/7] ASoC: soc-generic-dmaengine-pcm: Replace dma_request_slave_channel() by dma_request_chan()
Date: Fri, 18 Sep 2026 13:34:07 +0200
Message-ID: <20260918113727.1898998-4-andriy.shevchenko@linux.intel.com>
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

Replace dma_request_slave_channel() by dma_request_chan() as suggested
since the former is deprecated.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 65b7ec52a054..6d1dbee8f6c1 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -242,9 +242,11 @@ static int dmaengine_pcm_new(struct snd_soc_component *component,
 		if (!substream)
 			continue;
 
-		if (!pcm->chan[i] && config->chan_names[i])
-			pcm->chan[i] = dma_request_slave_channel(dev,
-				config->chan_names[i]);
+		if (!pcm->chan[i] && config->chan_names[i]) {
+			pcm->chan[i] = dma_request_chan(dev, config->chan_names[i]);
+			if (IS_ERR(pcm->chan[i]))
+				pcm->chan[i] = NULL;
+		}
 
 		if (!pcm->chan[i] && (pcm->flags & SND_DMAENGINE_PCM_FLAG_COMPAT)) {
 			pcm->chan[i] = dmaengine_pcm_compat_request_channel(
-- 
2.50.1

