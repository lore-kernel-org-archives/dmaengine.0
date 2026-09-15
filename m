Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DEB41E6C5;
	Tue, 15 Sep 2026 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466984; cv=none; b=Svsf6JSbWszTrsvHkDfqT/tRrzKb3Ee2g5DSfbiulMaSFXnXPIjkUKdkxDEJV/TWJtakyox6DZosYURfwauYj7aGqZOa1IdQly621A7lpGd5sGdztuEM2NrTI/6SUx/NwzcuiQVNKUdG4Wli7wKaG10sNf3QjGEwWczyS2lkhik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466984; c=relaxed/simple;
	bh=XxzPfKb26yPDb3QB4Ys98nkLHzeVIxXPUdPsL4DGLI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jy6xr7hMMph0W89bti6Lzd3o+n4jzZsQ18PTC0yfEHxXYDzn5Qs22Pd0wBb+vNxFcEvbRMJXHk/kwGeTkm9FEeig6uVfToxiI3W+mlGaC+IH+oS4tDuA3FM8K87FjkrGaJ6dkqmZqjtlU/w7bJuOeboFEKa4hCD/pJ8v2H1eA7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdHx2Vny; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdHx2Vny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789466984; x=1821002984;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XxzPfKb26yPDb3QB4Ys98nkLHzeVIxXPUdPsL4DGLI0=;
  b=NdHx2Vny1QtEbEN/nOwjZyzG+y76jTTjC+eOKtVfxzLgwj7u2q46eHmH
   P+l0EOLK4sApMttIPbo6XV9TWg2DKl84x/h8sO6cDqw0GV7nshvV0bK4q
   m7r+EZCv0abSyPMsbV9ND9jUusduwRNA5At+82qEbrni9UB7SrjhNMeJl
   mECdU1IqenIXUYQi3muCi5z5UutNhgYfhDsyjEmrhGMHWaFqPfK6fT7cU
   0g0wzOF0211xxm5FJXV6cgc4OagqC6C2KcDV+ZYUgJgX/39ELfP9P0e6M
   WHyo2hmkstMg0IFluCYxKPmHeBRc4nW5ByDp3/xb0YnNzt1e5zqgdlS8Q
   Q==;
X-CSE-ConnectionGUID: 8rjz340dQ7+JQ1cVB+feXA==
X-CSE-MsgGUID: nGhk++KfRtid7AJheqCH6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93524815"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93524815"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:09:40 -0700
X-CSE-ConnectionGUID: nZRD54hqQCCBbziNJTgorA==
X-CSE-MsgGUID: MkB4LrVBQBerTakV6p2ZVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269670280"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 15 Sep 2026 03:09:33 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6990E9E; Tue, 15 Sep 2026 12:09:32 +0200 (CEST)
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
Subject: [PATCH v1 3/7] ASoC: soc-generic-dmaengine-pcm: Replace dma_request_slave_channel() by dma_request_chan()
Date: Tue, 15 Sep 2026 12:04:24 +0200
Message-ID: <20260915100931.3593242-4-andriy.shevchenko@linux.intel.com>
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

