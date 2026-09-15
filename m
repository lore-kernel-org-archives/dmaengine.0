Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930FB41D4E9;
	Tue, 15 Sep 2026 10:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466987; cv=none; b=Sq3UysFxL/g/XErrAVSoWwE/LaJh5gDtZYc9nvbs4+jS7gcwIVmIsv/PCPO/cfOZK0kYqrWHmwTqnNMARKFi3viPOD70wwrNcvXOX5u+nm63sHHpubnnBo6DAybg13pKY8hUEjQM/q1SKD0Y3YLRwstu49y01f/JFWQtZyPlPrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466987; c=relaxed/simple;
	bh=w2DAbC3uMPgmhkJrhUyn5lKx37XxWntjSija75HyW4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUT10R6CBv9QAw3MKzXDWhK/rOpyPu6ksfGffW1QilsOLiW99ELg34Ssf8lv4CdvlWTLkuza3vpHXhPN0TeV/+ukRwLNLXHQSbX9V+z9Nv3NDu2ciE16NDTl4iB8ykVDA6VYkAOWHww7NTZzoRnwBWuHHzKaEulyAMNggTcHUkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Al+s0n3l; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Al+s0n3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789466986; x=1821002986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w2DAbC3uMPgmhkJrhUyn5lKx37XxWntjSija75HyW4U=;
  b=Al+s0n3ltQb2AvhONBskTVgR9bfD3jHyOvrjd61nar2OIESKwwDViy+A
   +PzHGtlp9qV2RswR6V75x++Isz3D1tJNF9AnNvJ80AI9eefIIEP/giM52
   NyrNn3Jp0rh4jE9mFGNVFEMutUWDj5Da8J19opODwZK5gN9RjmOilerMc
   pIWRZ8Pux74DPLwxfuWfQwn1mTLUghuO7fFEyzxl/jeVjYlJcy0OGfTs7
   PbIgK0xRmFPVJoqyj1RFJCuhQYI8qMV61J632mkFkJbAaEnbgMip6wTnC
   4jRWmK0LGcnNM3sbh8JXn8mIJdqVA2ZA4V+eGTOttY7uQ9DJVe7UUJ4Oo
   w==;
X-CSE-ConnectionGUID: +g1LbzhXR32K0fDXOQdLAQ==
X-CSE-MsgGUID: T4DC5/XhQT+IbDKHa4NRRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93649168"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93649168"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:09:43 -0700
X-CSE-ConnectionGUID: aMDeGoWGStOWi0L2fcNgqQ==
X-CSE-MsgGUID: AzomspuhSQKxEu/pCuSgJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296442487"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 15 Sep 2026 03:09:33 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6438C9D; Tue, 15 Sep 2026 12:09:32 +0200 (CEST)
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
Subject: [PATCH v1 2/7] ASoC: sprd: Replace dma_request_slave_channel() by dma_request_chan()
Date: Tue, 15 Sep 2026 12:04:23 +0200
Message-ID: <20260915100931.3593242-3-andriy.shevchenko@linux.intel.com>
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
 sound/soc/sprd/sprd-pcm-compress.c | 7 +++----
 sound/soc/sprd/sprd-pcm-dma.c      | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sprd/sprd-pcm-compress.c b/sound/soc/sprd/sprd-pcm-compress.c
index e5249924b54d..5613c25fffd7 100644
--- a/sound/soc/sprd/sprd-pcm-compress.c
+++ b/sound/soc/sprd/sprd-pcm-compress.c
@@ -153,11 +153,10 @@ static int sprd_platform_compr_dma_config(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	dma->chan = dma_request_slave_channel(dev,
-					      dma_params->chan_name[channel]);
-	if (!dma->chan) {
+	dma->chan = dma_request_chan(dev, dma_params->chan_name[channel]);
+	if (IS_ERR(dma->chan)) {
 		dev_err(dev, "failed to request dma channel\n");
-		return -ENODEV;
+		return PTR_ERR(dma->chan);
 	}
 
 	sgt = sg = kzalloc_objs(*sg, sg_num);
diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index f509a4601de2..1586eff61120 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -171,13 +171,12 @@ static int sprd_pcm_request_dma_channel(struct snd_soc_component *component,
 	for (i = 0; i < channels; i++) {
 		struct sprd_pcm_dma_data *data = &dma_private->data[i];
 
-		data->chan = dma_request_slave_channel(dev,
-						       dma_params->chan_name[i]);
-		if (!data->chan) {
+		data->chan = dma_request_chan(dev, dma_params->chan_name[i]);
+		if (IS_ERR(data->chan)) {
 			dev_err(dev, "failed to request dma channel:%s\n",
 				dma_params->chan_name[i]);
 			sprd_pcm_release_dma_channel(substream);
-			return -ENODEV;
+			return PTR_ERR(data->chan);
 		}
 	}
 
-- 
2.50.1

