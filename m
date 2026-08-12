Received: from mailhub16-fb.kaspersky-labs.com (mailhub16-fb.kaspersky-labs.com [5.79.125.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8677038E8B1
	for <dmaengine@vger.kernel.org>; Wed, 12 Aug 2026 05:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.79.125.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786513357; cv=none; b=IHGG4tUVv+2XWIN1+0C+liYBBOfHCeP8KMyk9fWAc4vEtE/tva3jDyWMzYt17HK54YfVokDofnaCKQr25y63m6KJXxRoIAewCinUKq/l7nl2ubAH912ZD7WGqca78mPAk3hudG/cF7F0EF0fb061DBTtFuQ1aXi1D7GBnKGxeTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786513357; c=relaxed/simple;
	bh=voZpAkFs/pYrbWE7SLKpnqGIyf16jhQRdcvQqrXtdv4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sSjmC/2YgXe9HUdmKpADozECkNdaO+8RBZeOIgsxtOKXLzqQ+Oj71sJvElX/FmGr6BWQoiNdG6UmZQqhbt8BHMT0eyO52KRMVOlrAF2yBG7VOBhxRWCwLuW/nODc4WxL2lOxH+iHcnZQM7E208bGuMV3lSPo5WeKQUvtEhXAaRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com; spf=pass smtp.mailfrom=kaspersky.com; dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b=RB5P3zgF; dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b=m87Cfgy0; arc=none smtp.client-ip=5.79.125.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaspersky.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b="RB5P3zgF";
	dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b="m87Cfgy0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
	s=mail202505; t=1786512876;
	bh=142kpY8nbLE4y5wJsRPfIKMXuQYACzheH8tURmpk3Zg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=RB5P3zgFXGb9d4KhNcPdTzAXGO/0yZU7Rx880jIj/+KfEsaeNeXjYlbhdxns0MOqN
	 KIUEOU7YKehowtjdqgbbUEvvO5yWfhi91gG1ceXd0bo7+mxIwWHbApogBmTYZYW5Z/
	 AXWFoxiWMozGzrFHoXCQsc2Fs3zhhccAMfRsmKUn9/uN/cuuU8O8R5WQjYq8YPKiUc
	 wzuH2kzf99H+lgVh6AEVg94qlU2NoQ0Nto/iltNtbmJAqm5yDMBDeXYzsPmbTZxFVF
	 KMe5YBxITYhEKfJrxKp8xXSkbApzSEOHgT8QMEFgbIbYKu7kPA4UK0oXCkLOPms8Yd
	 klZqpAbmdWwTg==
Received: from mailhub16-fb.kaspersky-labs.com (localhost [127.0.0.1])
	by mailhub16-fb.kaspersky-labs.com (Postfix) with ESMTP id CE6FBC09DCE;
	Wed, 12 Aug 2026 08:34:36 +0300 (MSK)
Received: from mx16.kaspersky-labs.com (mx16.kaspersky-labs.com [5.79.125.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "mx16.kaspersky-labs.com", Issuer "Kaspersky MailRelays CA G3" (verified OK))
	by mailhub16-fb.kaspersky-labs.com (Postfix) with ESMTPS id A5429C08CA1;
	Wed, 12 Aug 2026 08:34:36 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
	s=mail202505; t=1786512869;
	bh=142kpY8nbLE4y5wJsRPfIKMXuQYACzheH8tURmpk3Zg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=m87Cfgy0YBOfyej+8zFJ84dDY4fQQ+xYbciuyYXaHS0jIfCUceYHlbuwih5Q6rj/y
	 vJ3woDl0FbWgPZ92aOvj8R0sZX75L2i6kBnPZcRU1QGX/+inyToMaT7BymNQbPGKy+
	 /inUjB5kFK2KFCljmw7dUhRbatUcGsqonsCrIAbateJTdAb8vi5q13kHIsJZQPuZOY
	 ZlaIabXxgz+eOkAfcoL2N9wTowRTWsvYuBSkobXplGrBsygPp4V5GPL1sh7tvPpqRZ
	 KnTJSy945ZQgEOQvaNwYM6gZo86nVJ+R98JF2qo6xm9+8GhN3ZkZ/Kq6QG3uuxfy3Q
	 QSVSkF5zwUIwg==
Received: from relay16.kaspersky-labs.com (localhost [127.0.0.1])
	by relay16.kaspersky-labs.com (Postfix) with ESMTP id 9601DC09CBD;
	Wed, 12 Aug 2026 08:34:29 +0300 (MSK)
Received: from mail-hq2.kaspersky.com (unknown [91.103.66.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail-hq2.kaspersky.com", Issuer "Kaspersky MailRelays CA G3" (verified OK))
	by mailhub16.kaspersky-labs.com (Postfix) with ESMTPS id 4A46DC08376;
	Wed, 12 Aug 2026 08:34:28 +0300 (MSK)
Received: from chesnokov.avp.ru (10.16.105.7) by HQMAILSRV2.avp.ru
 (10.64.57.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 12 Aug
 2026 08:34:27 +0300
From: <Alexander.Chesnokov@kaspersky.com>
To: <peter.ujfalusi@gmail.com>
CC: <vkoul@kernel.org>, <grygorii.strashko@ti.com>,
	<dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>, <Pavel.Zhigulin@kaspersky.com>,
	<Oleg.Kazakov@kaspersky.com>, <Alexander.Chesnokov@kaspersky.com>
Subject: [PATCH v3] dmaengine: ti: k3-udma-glue: fix NULL dereference in k3_udma_glue_release_rx_chn()
Date: Wed, 12 Aug 2026 08:34:26 +0300
Message-ID: <20260812053426.3521589-1-Alexander.Chesnokov@kaspersky.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HQMAILSRV5.avp.ru (10.64.57.55) To HQMAILSRV2.avp.ru
 (10.64.57.52)
X-KSE-ServerInfo: HQMAILSRV2.avp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 08/12/2026 05:16:05
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 205193 [Aug 11 2026]
X-KSE-AntiSpam-Info: Version: 6.1.1.22
X-KSE-AntiSpam-Info: Envelope from: Alexander.Chesnokov@kaspersky.com
X-KSE-AntiSpam-Info: LuaCore: 114 0.3.114
 e27389a6c5d460ad26321fd0e0409b926c7b28a0
X-KSE-AntiSpam-Info: {Tracking_ml_letters}
X-KSE-AntiSpam-Info: {Tracking_cluster_exceptions}
X-KSE-AntiSpam-Info: {Tracking_real_kaspersky_domains}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_black_eng_exceptions}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2;chesnokov.avp.ru:7.1.1,5.0.1;kaspersky.com:7.1.1,5.0.1;lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: {Tracking_white_helo}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 08/12/2026 05:18:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 8/12/2026 2:11:00 AM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSMG-AntiPhishing: NotDetected, bases: 2026/08/12 04:54:00
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2026/08/12 01:51:00 #28674521
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected, bases: 2026/08/12 04:54:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 52

From: Alexander Chesnokov <Alexander.Chesnokov@kaspersky.com>

If devm_kcalloc() for rx_chn->flows fails in a channel request function,
the error path calls k3_udma_glue_release_rx_chn(), which dereferences
the NULL rx_chn->flows pointer in k3_udma_glue_release_rx_flow().

Skip the flow release loop in k3_udma_glue_release_rx_chn() when
rx_chn->flows is not allocated.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: d70241913413 ("dmaengine: ti: k3-udma: Add glue layer for non DMAengine users")
Cc: stable@vger.kernel.org
Reported-by: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
Signed-off-by: Alexander Chesnokov <Alexander.Chesnokov@kaspersky.com>
---

v3: guard the flow release loop in k3_udma_glue_release_rx_chn() instead
of reordering the flow_num assignment. Covers all error paths in both
request functions.
v2: https://lore.kernel.org/all/20251006124258.1132312-1-Pavel.Zhigulin@kaspersky.com/

 drivers/dma/ti/k3-udma-glue.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
index 4f1aeb81e9c7..a739e60b0764 100644
--- a/drivers/dma/ti/k3-udma-glue.c
+++ b/drivers/dma/ti/k3-udma-glue.c
@@ -1103,8 +1103,9 @@ void k3_udma_glue_release_rx_chn(struct k3_udma_glue_rx_channel *rx_chn)
 		rx_chn->psil_paired = false;
 	}
 
-	for (i = 0; i < rx_chn->flow_num; i++)
-		k3_udma_glue_release_rx_flow(rx_chn, i);
+	if (rx_chn->flows)
+		for (i = 0; i < rx_chn->flow_num; i++)
+			k3_udma_glue_release_rx_flow(rx_chn, i);
 
 	if (xudma_rflow_is_gp(rx_chn->common.udmax, rx_chn->flow_id_base))
 		xudma_free_gp_rflow_range(rx_chn->common.udmax,
-- 
2.43.0

