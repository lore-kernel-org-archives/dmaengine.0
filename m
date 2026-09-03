Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9E340BCB2;
	Thu,  3 Sep 2026 09:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429439; cv=none; b=IAGFpGn864cVBDAR2jrA22xWQsRdTvfaAmWZTsl+nkzfjX1nhAtsAvws+ijZ6Du87c0281doWzdDIEZKnYw0Zn+Df1ge+r+kbLtY/wKeSJIO87xf8+VPSBCOkmRfzSFq1Ir2AhiR5cPJ9f8rD08/DBAK+AZZ0EHHIVR//90Y1sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429439; c=relaxed/simple;
	bh=NTjEyY0BUyvGYpivcJzXyrD6JGFTmJSwcbJa8YR6TKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C7RbrMzOuR1UCKKbwhZngia2ilNl4wptJYqh9p3T10gZv46tCNtNGbVQFZB/AoI7PnLjdPT926exxBq3bQvIuKMz1tx5AWKT1kUlRzk2JXlnkxzPIFs6v8NTyoA10ciNlZUrUU0osZR94AmVP/BLFmqmpoSNt6zd75NPa0rbLis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=piJvZ4AN; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AwXEdyzR; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="piJvZ4AN";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="AwXEdyzR"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hbFPl2c7BzKrt2;
	Thu, 03 Sep 2026 11:57:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788429435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SbaKgAu7R/FDCwmuLCcWl14lYq7sEdvI8vaAnN/rV6Y=;
	b=piJvZ4ANxQwYx1GTTDhRAl4NSCtly102ng76aZcDjNpYPme0Wx0P9y/CPOCmhYDgrUwAGM
	gM4sDU9SKMLzTeFbLBb2u3uNEUdDHh9D8QsD9YJz8PYyYanphJKL0koLEWtnRjxcp4qe2J
	R/rK6eBPcrkO4kcA4FAvJJQe3Rohe12lZUPqixV2R5hw9nXkU2/4BGRdmR16F0NR7V1GvZ
	gBARXLvZgE2f3OVmcI12K7/YFAHc2VYFm89BEKZ7It5xwg2SSpc+LrOshhTtAyiICBSEr3
	TMqqhbeCbHdODilILBp69j5xNnMPFDZghUt9rrtY5WPBSuA3/nnod31U3CYL6w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=AwXEdyzR;
	spf=pass (outgoing_mbo_mout: domain of manuelebnerli@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=manuelebnerli@mailbox.org
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788429433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SbaKgAu7R/FDCwmuLCcWl14lYq7sEdvI8vaAnN/rV6Y=;
	b=AwXEdyzRCRYdgGFn55NERCtTL06jMRp+S61XruRntPV/sk3MPZcPK9JIWGK5TVQa1FyOfm
	lEPTYyxl1MW7tyPZKXS3PRW2VWKDkInLvdTLN+hv1ZELOJ4UU/7Ue+sUMGCSO8V+OjXleS
	DJiLHWY0S+rCID+2KaskAF6zi18lp/F0zO/phMvhjT0Zdz6WRh4qJU+19DL53tUYIIgRHn
	Bs2uWZK9oZLeZxRNjRsrdSgvuTTgfZU9leJXjrRL0wPk9Bf3PVqm3Kew9CAYTtRS7dl+6H
	eURB7JUmQH27PMzaw7B2273W8Fm5jK8ZaGauHPGihsp1KkbPBmKIsw1vzObcew==
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	dmaengine@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: dmaengine: Fix bracket
Date: Thu,  3 Sep 2026 11:55:45 +0200
Message-ID: <20260903095545.729607-3-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5owa1nid18e75quktu17j6oicdhmkhea
X-MBO-RS-ID: 3277edacf24f18ba88c
X-Rspamd-Queue-Id: 4hbFPl2c7BzKrt2

Add missing ')' to sentence.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/driver-api/dmaengine/provider.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentation/driver-api/dmaengine/provider.rst
index f4ed98f70..22d235fb4 100644
--- a/Documentation/driver-api/dmaengine/provider.rst
+++ b/Documentation/driver-api/dmaengine/provider.rst
@@ -321,7 +321,7 @@ to use.
 - DESC_METADATA_CLIENT
 
   The metadata buffer is allocated/provided by the client driver and it is
-  attached (via the dmaengine_desc_attach_metadata() helper to the descriptor.
+  attached (via the dmaengine_desc_attach_metadata() helper) to the descriptor.
 
   From the DMA driver the following is expected for this mode:
 
-- 
2.54.0

