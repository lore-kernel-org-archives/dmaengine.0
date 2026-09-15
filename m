Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AB247F774;
	Tue, 15 Sep 2026 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466990; cv=none; b=D0MF19iAC3Z4/1j7vny5hvTvn/fZrmKuZ+7WrSwNyLdJDnkkTvLpeND+1j4mmQX5jmFeGeTXnOom2xIHdpEyumP/fHDbv2EDUUOcbc91ULoxymJHg8hQBUguNhzB/pUnmMijIlAw2n8VjWOPZ0XDaEaXmoQpqaOGz2PVIzr3oHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466990; c=relaxed/simple;
	bh=D1bk2913pdN2XTk5dYfDZD30b03Yi/im1ni4fvAIaRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RkeXEfytRjXJgPTEQZjt+5n8BYuw2LL1VJC80BljQ0ToWI0rHNSDcPrF+xrVELlSX4D7R7M/w13BVHXZuQmUIWtPNkKEigyclqU5k0M0r5xhjg/UJcyfAMsMUNLaBOvekVgP2uOtmqULXFoE64rXOiOioGvSVmAfEk64poE5QfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8jYmR0K; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8jYmR0K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789466988; x=1821002988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D1bk2913pdN2XTk5dYfDZD30b03Yi/im1ni4fvAIaRg=;
  b=I8jYmR0KqD2fG4nMlKXz1yuP8tJMwyPWKroQ15MDWaVz5Ze8q8tVD08e
   voHTdLkdPZaQDIgj1h1RQEzTXLskNnNOHndytCYTjUcHMfNepoHPzy4tL
   XVO3KuOg1wyrHoLMYGbqbKetv/8od2/p+Xn5Qf2+1Pp94eCjlec+RctaE
   FEugSqQITddJ8YjPwWWdXzODWljoMjW0hGZSYolSeHguszm8w1dqjrF6g
   nN6YSiw0OccbALNrwLS2gAhXOYAucNymP5IqnW1eJk0mX+r3Nmrjii3Sq
   Jy+IJk7Gkmm7aU1Ysq+dxLlqbsqRycVqN7pfXboqynruVJLrMqM1mCh0H
   g==;
X-CSE-ConnectionGUID: 6AukA2E1R+yvvjY2MlRX+A==
X-CSE-MsgGUID: 2M/QkdDXSA6U13b1cW4/8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93649188"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93649188"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:09:47 -0700
X-CSE-ConnectionGUID: 2n8xZtl4QHaOyEk6gsbb5Q==
X-CSE-MsgGUID: zwriBC04QHyA/SUGdRggxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296442788"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 15 Sep 2026 03:09:40 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 73190A2; Tue, 15 Sep 2026 12:09:32 +0200 (CEST)
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
Subject: [PATCH v1 5/7] ASoC: fsl_asrc: Replace dma_request_slave_channel() by dma_request_chan()
Date: Tue, 15 Sep 2026 12:04:26 +0200
Message-ID: <20260915100931.3593242-6-andriy.shevchenko@linux.intel.com>
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
 sound/soc/fsl/fsl_asrc.c     |  2 +-
 sound/soc/fsl/fsl_asrc_dma.c | 13 +++++++------
 sound/soc/fsl/fsl_asrc_m2m.c |  8 ++++----
 sound/soc/fsl/fsl_easrc.c    |  2 +-
 4 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index b24737add001..ae682bf450f6 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -638,7 +638,7 @@ static struct dma_chan *fsl_asrc_get_dma_channel(struct fsl_asrc_pair *pair,
 
 	sprintf(name, "%cx%c", dir == IN ? 'r' : 't', index + 'a');
 
-	return dma_request_slave_channel(&asrc->pdev->dev, name);
+	return dma_request_chan(&asrc->pdev->dev, name);
 }
 
 static int fsl_asrc_dai_startup(struct snd_pcm_substream *substream,
diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 2f662bdf14d0..5cd12781c604 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -191,9 +191,10 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	dma_params_fe->maxburst = dma_params_be->maxburst;
 
 	pair->dma_chan[!dir] = asrc->get_dma_channel(pair, !dir);
-	if (!pair->dma_chan[!dir]) {
+	ret = PTR_ERR_OR_ZERO(pair->dma_chan[!dir]);
+	if (ret) {
 		dev_err(dev, "failed to request DMA channel\n");
-		return -EINVAL;
+		return ret;
 	}
 
 	ret = snd_dmaengine_pcm_prepare_slave_config(substream, params, &config_fe);
@@ -404,9 +405,9 @@ static int fsl_asrc_dma_startup(struct snd_soc_component *component,
 
 	/* Request a dummy dma channel, which will be released later. */
 	tmp_chan = asrc->get_dma_channel(pair, dir);
-	if (!tmp_chan) {
+	ret = PTR_ERR_OR_ZERO(tmp_chan);
+	if (ret) {
 		dev_err(dev, "failed to get dma channel\n");
-		ret = -EINVAL;
 		goto dma_chan_err;
 	}
 
@@ -497,9 +498,9 @@ static int fsl_asrc_dma_pcm_new(struct snd_soc_component *component,
 
 	/* Request a dma channel, which will be released later. */
 	chan = asrc->get_dma_channel(pair, IN);
-	if (!chan) {
+	ret = PTR_ERR_OR_ZERO(chan);
+	if (ret) {
 		dev_err(dev, "failed to get dma channel\n");
-		ret = -EINVAL;
 		goto dma_chan_err;
 	}
 
diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
index 4bc40f328f58..e440cc083ebb 100644
--- a/sound/soc/fsl/fsl_asrc_m2m.c
+++ b/sound/soc/fsl/fsl_asrc_m2m.c
@@ -503,16 +503,16 @@ static int fsl_asrc_m2m_comp_task_create(struct snd_compr_stream *stream,
 
 	/* Request dma channels */
 	pair->dma_chan[IN] = asrc->get_dma_channel(pair, IN);
-	if (!pair->dma_chan[IN]) {
+	ret = PTR_ERR_OR_ZERO(pair->dma_chan[IN]);
+	if (ret) {
 		dev_err(dev, "[ctx%d] failed to get input DMA channel\n", pair->index);
-		ret = -EBUSY;
 		goto err_dma_channel_in;
 	}
 
 	pair->dma_chan[OUT] = asrc->get_dma_channel(pair, OUT);
-	if (!pair->dma_chan[OUT]) {
+	ret = PTR_ERR_OR_ZERO(pair->dma_chan[OUT]);
+	if (ret) {
 		dev_err(dev, "[ctx%d] failed to get output DMA channel\n", pair->index);
-		ret = -EBUSY;
 		goto err_dma_channel_out;
 	}
 
diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index aced16d1228a..d30cc3e90215 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1433,7 +1433,7 @@ static struct dma_chan *fsl_easrc_get_dma_channel(struct fsl_asrc_pair *ctx,
 	/* Example of dma name: ctx0_rx */
 	sprintf(name, "ctx%c_%cx", index + '0', dir == IN ? 'r' : 't');
 
-	return dma_request_slave_channel(&easrc->pdev->dev, name);
+	return dma_request_chan(&easrc->pdev->dev, name);
 };
 
 static const unsigned int easrc_rates[] = {
-- 
2.50.1

