Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976444EE87F;
	Fri, 18 Sep 2026 11:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731467; cv=none; b=c03yNtkksWFqQyY0HT0tVUV2nPuJn2dyTs7m8eqd7YoVdUBiK1Srs6LhSrMHJ9fCxqHuHJFjX6sBN258vP2UelR0nYn7qo+ymz+2HnpC1BUfm/mpw39twLnlf1RjVePxN6WPSkRzMLx+2G28jwKK7VXNiGQOQZ+dDQeQa0Jqtrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731467; c=relaxed/simple;
	bh=dsocwb7K2ZpRqzpDad5Pm4Zdlbi0/SbBbWa0Q7zC82k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BeLsyY5vpOkOZvW2QDs0PpozVqOfxMys2q+xGsEXXg+hEDV966j1FxjtnZBHetf2nvZlKje/rYx6nbz2fJMP4ywuKK4laBPcmOEKuoRGZfD9Fl5Uo9VXQip/PFw208FV5mE9P66CZHarNLsgGCTvwnxHNh9mXxpb7yH8yS/1saE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hs/utz7h; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hs/utz7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789731466; x=1821267466;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dsocwb7K2ZpRqzpDad5Pm4Zdlbi0/SbBbWa0Q7zC82k=;
  b=hs/utz7hPFkt3A0tN/U29ekwNfJD+3Ou6pXreL5kl0Dwx+BHS46JLB/W
   ASP/K5Cc5EWADJj3a7PrVpdgHj1R5PNyIgNRB48gjsPt+IFtjoJvAPhz4
   P9X/b662XNGhrl2KhI95vHUof3Edqm7lYVIBek9lZLxzzlap08zAVMU5h
   zFT9tn2CEpFamKGIqFCcTaZK0kLxvnIBJom3OZ3G9Plm7GijgvhQ2ynYA
   +K7cHs/Gi9VSPSq3BHkcQkm2LZgsYgucrWq9XRtWs6+DL0NF0Fi8rWs9B
   Dg7687Y9TjDS7zO7WM9JtdafW8geGj/O3Beyvj96O6n7LrdKVKktiw6m0
   Q==;
X-CSE-ConnectionGUID: kT2iOyJqSgq1LHcN58lr/w==
X-CSE-MsgGUID: 8k+pu6d6S1ikBsO8pEXErg==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="92739760"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="92739760"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:37:43 -0700
X-CSE-ConnectionGUID: iLqdN8XLQ3SjN2203lubpg==
X-CSE-MsgGUID: VSAVOy0OQ9qg8FU7OlJ13w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="271029227"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 18 Sep 2026 04:37:37 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 76EA8A4; Fri, 18 Sep 2026 13:37:29 +0200 (CEST)
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
Subject: [PATCH v2 6/7] gpib: fmh_gpib: Replace dma_request_slave_channel() by dma_request_chan()
Date: Fri, 18 Sep 2026 13:34:10 +0200
Message-ID: <20260918113727.1898998-7-andriy.shevchenko@linux.intel.com>
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

Reviewed-by: Dave Penkler <dpenkler@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpib/fmh_gpib/fmh_gpib.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpib/fmh_gpib/fmh_gpib.c b/drivers/gpib/fmh_gpib/fmh_gpib.c
index 5e10e9353fed..4ab9b0a317fd 100644
--- a/drivers/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/gpib/fmh_gpib/fmh_gpib.c
@@ -1458,11 +1458,15 @@ static int fmh_gpib_attach_impl(struct gpib_board *board, const struct gpib_boar
 	e_priv->irq = irq;
 
 	if (acquire_dma) {
-		e_priv->dma_channel = dma_request_slave_channel(board->dev, "rxtx");
-		if (!e_priv->dma_channel) {
+		struct dma_chan *tmp_chan;
+
+		tmp_chan = dma_request_chan(board->dev, "rxtx");
+		retval = PTR_ERR_OR_ZERO(tmp_chan);
+		if (retval) {
 			dev_err(board->dev, "failed to acquire dma channel \"rxtx\".\n");
-			return -EIO;
+			return retval;
 		}
+		e_priv->dma_channel = tmp_chan;
 	}
 	/*
 	 * in the future we might want to know the half-fifo size
-- 
2.50.1

