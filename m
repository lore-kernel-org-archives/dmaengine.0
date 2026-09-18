Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE6F4E532A;
	Fri, 18 Sep 2026 11:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731464; cv=none; b=tnwVJxiZB0ich1jCPGXWAQS1IkpSuY1QVYSg6K0Crdty9dso7QuNTdV6B6beg4vvk9Vbygp2N0vFGR1WEaz5Wlkur+9biGxaofA0s5EKFSRcBcdO1NU8p9XEbJ117wGLl6sllmILDPiAlwRfBWdkhKCYETcAVn/THWg9qMdf/BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731464; c=relaxed/simple;
	bh=iHSC1nNEnhUx/XbEolv5AtLHIEcgA20Dn5X1VVvaZ8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D80Pk7NOFKmXFTWb0vceHr2rff+2XiEwnhfDiJYdd5K+6myzo24KdjNwww6uBGE7ZnB9jdO08HVwLtKxPNoXdlq/U4z04oIPJA4tH7+1GgUMu0uTknG8aMWdDQ8LtEJX0gW/Iehni29/zqK4aYLlQwOaEHANsLtnwGU/oR25PsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6Uy1wb5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6Uy1wb5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789731462; x=1821267462;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iHSC1nNEnhUx/XbEolv5AtLHIEcgA20Dn5X1VVvaZ8M=;
  b=P6Uy1wb5zyKa0yeadElmd5JVpEm+zTDeK7b6G9nTOVSkxx8nmITa5AQ1
   aav8IXn2uMBbRfGIXGZrKZn16yYvPD1fXXIEP571Zai/dddjDWrYqUI7+
   l+ZlRcM0IymCgSk+9McfSu9wePbuQORjooHvAR/z1xRD5/hUwQHnGmQ71
   9Rb35jdqJNoolt1wvF8sGidoW9J3ARubppZDCxKdpsEa2hen/3FY+jqMk
   EyT0z5o+4xGLbX7JYH+Y19HYR4SdQ/v3zhXNRwe4rgU7uq2SI0RVArK7s
   Kt+NTnRCTRqKyN9Pn9K4Hw9dfsqqcUJFKpBjiyIng5XgutMavg30Bj2/F
   w==;
X-CSE-ConnectionGUID: isc1UwJvQKqFQoMfLHhxmQ==
X-CSE-MsgGUID: +5rVTmyqSN+XACgcjVq2aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="89367475"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="89367475"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:37:41 -0700
X-CSE-ConnectionGUID: vwoX+4jyTkKozcevs1734A==
X-CSE-MsgGUID: P5cUJ9SJT2GCeaMH1c7Yjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="2783683"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 18 Sep 2026 04:37:35 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6CEB5A1; Fri, 18 Sep 2026 13:37:29 +0200 (CEST)
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
Subject: [PATCH v2 4/7] ASoC: pxa: Replace dma_request_slave_channel() by dma_request_chan()
Date: Fri, 18 Sep 2026 13:34:08 +0200
Message-ID: <20260918113727.1898998-5-andriy.shevchenko@linux.intel.com>
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

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/pxa/pxa2xx-pcm-lib.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/pxa/pxa2xx-pcm-lib.c b/sound/soc/pxa/pxa2xx-pcm-lib.c
index 88a9d3226302..4b5b07f0c444 100644
--- a/sound/soc/pxa/pxa2xx-pcm-lib.c
+++ b/sound/soc/pxa/pxa2xx-pcm-lib.c
@@ -79,6 +79,7 @@ static int pxa2xx_pcm_open(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_dmaengine_dai_dma_data *dma_params;
+	struct dma_chan *chan;
 	int ret;
 
 	runtime->hw = pxa2xx_pcm_hardware;
@@ -107,9 +108,11 @@ static int pxa2xx_pcm_open(struct snd_pcm_substream *substream)
 	if (ret < 0)
 		return ret;
 
-	return snd_dmaengine_pcm_open(
-		substream, dma_request_slave_channel(snd_soc_rtd_to_cpu(rtd, 0)->dev,
-						     dma_params->chan_name));
+	chan = dma_request_chan(snd_soc_rtd_to_cpu(rtd, 0)->dev, dma_params->chan_name);
+	if (IS_ERR(chan))
+		return -ENXIO;
+
+	return snd_dmaengine_pcm_open(substream, chan);
 }
 
 static int pxa2xx_pcm_close(struct snd_pcm_substream *substream)
-- 
2.50.1

