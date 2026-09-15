Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E749947FAE1;
	Tue, 15 Sep 2026 10:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466990; cv=none; b=Y9BSbMVUNs27dCgG5jd4PqY30m2OB2hZKxVeGFxrl7LdCDNy5PlN1jeJgRNalv1dU3BPATBhZyNLWgde743y1po2Ssee1r9gzPoqust3vXB94QUiDabppF56fAwMwit9n3G9m+fBCBKYsC9mzDW4siPX6FiBhEXEEUFPgzEncxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466990; c=relaxed/simple;
	bh=S3szUq2krwYbTZZeTS/C4wC1E20wM6Ut+0nvD27YgTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pS/ZdbBgGexBaPP66MBNKvJKgbggnnfDLWQnX+Q9FIYRbujh4eD/rRRJndukxlL1KibWlI0ruwTAD1JpylfZlkzW6xcBDu/9UXUKxLYFx7SRC04fyBJUgMUtsoRshg6tnLJ2P8V0okLYNhp6sMAWJNnsN1FDPwLBOVtVKiIS2C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d22DNdVC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d22DNdVC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789466989; x=1821002989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S3szUq2krwYbTZZeTS/C4wC1E20wM6Ut+0nvD27YgTw=;
  b=d22DNdVCstiQJWSqMmGlyr4E3S4OOM449ZL4xPljqJgmxqZC9Ju2cK3C
   qESQzn4VAf/QtW00trLTnnME3KcydTlwLnaz1fjiqYyXsAwC9PMEytou+
   mwlj3TGVoL86glb7KJZt1f4RXuvVjJKd1gIN6aZxxGU/VSZD4OJl9KrLh
   wGAKwMjf/TrxXQ+RuWkABbusiEschBOxwKymlWA8yZ/DbgRaI2l+Ohdod
   VhS+kUG11O1lAmPHoBYdrnzN0eDCOqbWsd8JWaQcQk7RJtE7/mBkyTuXc
   fVnIqyOKThNGrOoM8O6MUZaqB+ciD9eNDdTvWaVxQ65hOm09Of9za0dco
   g==;
X-CSE-ConnectionGUID: gp+SrwANQkm2q+ooYtW1hQ==
X-CSE-MsgGUID: 5i8kAM0zQSaywgDw0sg8ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115360955"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="115360955"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:09:47 -0700
X-CSE-ConnectionGUID: 42MLKcpWQmuH0LoosqBueg==
X-CSE-MsgGUID: +GC634cpT4uXWqdlsRFeRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271517611"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 15 Sep 2026 03:09:40 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 77E2BA4; Tue, 15 Sep 2026 12:09:32 +0200 (CEST)
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
Subject: [PATCH v1 6/7] gpib: fmh_gpib: Replace dma_request_slave_channel() by dma_request_chan()
Date: Tue, 15 Sep 2026 12:04:27 +0200
Message-ID: <20260915100931.3593242-7-andriy.shevchenko@linux.intel.com>
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
 drivers/gpib/fmh_gpib/fmh_gpib.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpib/fmh_gpib/fmh_gpib.c b/drivers/gpib/fmh_gpib/fmh_gpib.c
index 5e10e9353fed..3fdcc673ec8b 100644
--- a/drivers/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/gpib/fmh_gpib/fmh_gpib.c
@@ -1458,10 +1458,11 @@ static int fmh_gpib_attach_impl(struct gpib_board *board, const struct gpib_boar
 	e_priv->irq = irq;
 
 	if (acquire_dma) {
-		e_priv->dma_channel = dma_request_slave_channel(board->dev, "rxtx");
-		if (!e_priv->dma_channel) {
+		e_priv->dma_channel = dma_request_chan(board->dev, "rxtx");
+		retval = PTR_ERR_OR_ZERO(e_priv->dma_channel);
+		if (retval) {
 			dev_err(board->dev, "failed to acquire dma channel \"rxtx\".\n");
-			return -EIO;
+			return retval;
 		}
 	}
 	/*
-- 
2.50.1

