Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41AD412BED;
	Tue, 15 Sep 2026 10:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466983; cv=none; b=ZS06wUxbQ3PeMTSvRgSdr0ntcwo9UqV+RTm5VJHtzpfQEwxKMhq4J3RqB16wOQyAAoKZeyHerHSDxKcYE6ZrGFjM5gkYfBHH6jEpLcuaeE9E6IV4oUbPdFVchBC3CQYxc/B+sWhOEk2go7u8Kjg9AfVhJ5UmselEGuikM0/YR3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466983; c=relaxed/simple;
	bh=jxYDYzHVYPq4YEIyup/T+qLWIcnk64L3iLPbr0dWZJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DD8i2SjDSVYJyqgcc3DYQCCKZCj/74ApqF+GnCmY9ueCA4VW7mef7cjU9vuqaUTmmy45rr/J1iAdwRyihslpwoX4foowMWJYY4LVzTAqoOzwttCt6f6UczrZLYgqY3FtV+LK8Y1s3HAzVeqgfyt0Rl75u49Yh/xY1wWXuawiX50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jtA8XU9n; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jtA8XU9n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789466981; x=1821002981;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jxYDYzHVYPq4YEIyup/T+qLWIcnk64L3iLPbr0dWZJU=;
  b=jtA8XU9nUrCp+x6szxl4/7bHyAbqJeOj9dmEjfZV/3eHhlb7hxOveAUO
   DyQSBKoePyfi3nLeIV/jEmHWddapPyfWh4ShxSIYwLxyTEBIUqMv32kMT
   FybGM4wNRhOtzisxsM3e3GVrKGGt+WLucSdV57STTNg2zvkXnze2lYJq1
   /d+3v80jLu4eKGhpw/9l7pU6di+CF7D8hfzry5q5MYleAFg35lM6WHH8b
   0QK3/m6vAZr7UEu98mgixb8AsIYReuR4WpNx2NyZ2WkVcSs1Y7AdIb4MK
   xu3zKNFf+SfprAq45bBCCRzaDPFR0cLFHCVp010HGY0lGaQ/fB5BY0erZ
   g==;
X-CSE-ConnectionGUID: XNi52E0dRX2L+NobB1iIzw==
X-CSE-MsgGUID: Q4En0cwAR2OeWe4XCPlchg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93524793"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93524793"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:09:40 -0700
X-CSE-ConnectionGUID: xOLmSWPLQt6bUxhTM7s3Ow==
X-CSE-MsgGUID: YCeL3QUOR+uEihCX/mCHZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269670281"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 15 Sep 2026 03:09:33 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6E192A1; Tue, 15 Sep 2026 12:09:32 +0200 (CEST)
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
Subject: [PATCH v1 4/7] ASoC: pxa: Replace dma_request_slave_channel() by dma_request_chan()
Date: Tue, 15 Sep 2026 12:04:25 +0200
Message-ID: <20260915100931.3593242-5-andriy.shevchenko@linux.intel.com>
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

Replace dma_request_slave_channel() by dma_request_chan() as suggested
since the former is deprecated.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/pxa/pxa2xx-pcm-lib.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/pxa/pxa2xx-pcm-lib.c b/sound/soc/pxa/pxa2xx-pcm-lib.c
index 88a9d3226302..0ccf88aa1138 100644
--- a/sound/soc/pxa/pxa2xx-pcm-lib.c
+++ b/sound/soc/pxa/pxa2xx-pcm-lib.c
@@ -79,6 +79,7 @@ static int pxa2xx_pcm_open(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_dmaengine_dai_dma_data *dma_params;
+	struct dma_chan *chan;
 	int ret;
 
 	runtime->hw = pxa2xx_pcm_hardware;
@@ -107,9 +108,12 @@ static int pxa2xx_pcm_open(struct snd_pcm_substream *substream)
 	if (ret < 0)
 		return ret;
 
-	return snd_dmaengine_pcm_open(
-		substream, dma_request_slave_channel(snd_soc_rtd_to_cpu(rtd, 0)->dev,
-						     dma_params->chan_name));
+	chan = dma_request_chan(snd_soc_rtd_to_cpu(rtd, 0)->dev, dma_params->chan_name);
+	ret = PTR_ERR_OR_ZERO(chan);
+	if (ret)
+		return ret;
+
+	return snd_dmaengine_pcm_open(substream, chan);
 }
 
 static int pxa2xx_pcm_close(struct snd_pcm_substream *substream)
-- 
2.50.1

