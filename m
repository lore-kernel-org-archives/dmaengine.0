Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5783914E9;
	Fri, 18 Sep 2026 11:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731458; cv=none; b=d7ACoa7EJuiMVuiFqKEpHG6RDCfRAik1Tlka8q9OPPgzLuHY96sZgBnOJfztXRI+XOtRVVZTS9c9dLi4ZzpPKQGh34oFDfSJD2+Px834qdZmuCq5l7QncnApEmkHxOkSTU7Uy/gO3rnVuHyu+UqLx2NL8BlpopJVzm41eivnX5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731458; c=relaxed/simple;
	bh=3kWwrnL64mx1dLXwcHsMMT0BAa2zKW4PRgmp1oM+8L4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nb+myDIlnEL+3wzqxVwAZeGBgamtvm+5xPYOvlVOIoajKhTeOAdwg6REzDx9A54vQj+/cuVFQtAErxMkazIxNjdpwqfl5aZZ/VuZr3ulW3g7RC2E9gwxNlUzAa+uaLz4oFqVjqFeOFG+aKbxlyZLa9TmFys+VfCXIbiHUfGhc8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TpbMFl7a; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TpbMFl7a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789731457; x=1821267457;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3kWwrnL64mx1dLXwcHsMMT0BAa2zKW4PRgmp1oM+8L4=;
  b=TpbMFl7athYqFbOgZq1vAX5zTqwGJM0d4z+gB7lI32rN1bFYuGRSw8BZ
   zZ5N4obdV8U/M2VecjGSq+NXNScPZblyAH9Du3NJ9XVmpgse4/vKVqrA8
   48gGT2xLDkENRr/7EIPGaWau5H1LlwUIHz1eKoXT1IigT2wa79guaooUq
   ZrbrVUy0FIWwJhyuPe/PdNAvGnrcZLIp3Fh/BQPDOKClKUNyYrkOVjUTW
   CKC0mBPz/oEVDeFjVDM0lGJOCyI0m/h4ctSliwkJFPED98UMh5pb5AX+3
   d0q0oTGiG5HLIEvotEnvHQxcGiMZ4ttCYntDrf1yxkdZEKL5vskb0BiLb
   A==;
X-CSE-ConnectionGUID: ly+nxso2SOqk39i5QOf78g==
X-CSE-MsgGUID: NDPwkaF/S3aHfqjcMQ4zjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="89367423"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="89367423"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:37:36 -0700
X-CSE-ConnectionGUID: 1R6KiivqQbSH2qbKz/O6QA==
X-CSE-MsgGUID: CLf4k4XbTtOWa//DNCduFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="2783655"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 18 Sep 2026 04:37:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6253F9D; Fri, 18 Sep 2026 13:37:29 +0200 (CEST)
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
Subject: [PATCH v2 2/7] ASoC: sprd: Replace dma_request_slave_channel() by dma_request_chan()
Date: Fri, 18 Sep 2026 13:34:06 +0200
Message-ID: <20260918113727.1898998-3-andriy.shevchenko@linux.intel.com>
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
since the former is deprecated. With this, propagate all possible errors
to the caller.

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/sprd/sprd-pcm-compress.c | 9 +++++----
 sound/soc/sprd/sprd-pcm-dma.c      | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sprd/sprd-pcm-compress.c b/sound/soc/sprd/sprd-pcm-compress.c
index e5249924b54d..f394121d417a 100644
--- a/sound/soc/sprd/sprd-pcm-compress.c
+++ b/sound/soc/sprd/sprd-pcm-compress.c
@@ -145,6 +145,7 @@ static int sprd_platform_compr_dma_config(struct snd_soc_component *component,
 	enum dma_slave_buswidth bus_width;
 	int period, period_cnt, sg_num = 2;
 	dma_addr_t src_addr, dst_addr;
+	struct dma_chan *chan;
 	unsigned long flags;
 	int ret, j;
 
@@ -153,12 +154,12 @@ static int sprd_platform_compr_dma_config(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	dma->chan = dma_request_slave_channel(dev,
-					      dma_params->chan_name[channel]);
-	if (!dma->chan) {
+	chan = dma_request_chan(dev, dma_params->chan_name[channel]);
+	if (IS_ERR(chan)) {
 		dev_err(dev, "failed to request dma channel\n");
-		return -ENODEV;
+		return PTR_ERR(chan);
 	}
+	dma->chan = chan;
 
 	sgt = sg = kzalloc_objs(*sg, sg_num);
 	if (!sg) {
diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index 2d5ffbe17e81..2a89dc7616bf 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -170,15 +170,16 @@ static int sprd_pcm_request_dma_channel(struct snd_soc_component *component,
 
 	for (i = 0; i < channels; i++) {
 		struct sprd_pcm_dma_data *data = &dma_private->data[i];
+		struct dma_chan *chan;
 
-		data->chan = dma_request_slave_channel(dev,
-						       dma_params->chan_name[i]);
-		if (!data->chan) {
+		chan = dma_request_chan(dev, dma_params->chan_name[i]);
+		if (IS_ERR(chan)) {
 			dev_err(dev, "failed to request dma channel:%s\n",
 				dma_params->chan_name[i]);
 			sprd_pcm_release_dma_channel(substream);
-			return -ENODEV;
+			return PTR_ERR(chan);
 		}
+		data->chan = chan;
 	}
 
 	return 0;
-- 
2.50.1

