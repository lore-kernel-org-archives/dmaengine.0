Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4FC4028E8
	for <dmaengine@vger.kernel.org>; Thu, 24 Sep 2026 21:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284685; cv=none; b=rwqux+ltXRdYz1hknApwS2Mom+a+e553AdDSX+ZjBt/1IU3/hRpebF1+ObLbYByoagSL6pOnlEw7WJKnsvIKPM9KIDv4Qjwk8Mq4K4Phb1tnyKc9ilfT22U3HBf6zI4HJB/9SUtGK0ZEwqRZm5U9UcIwiJ06ftYk+AwmZaPB/Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284685; c=relaxed/simple;
	bh=zp1GtFAWNLSN7+BfopZI5W35y9BoiCnO65i6+zRDnoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lbfo2v4SRPN8P0C6szToWgnR2rMLZXaXike4MVhf+4/53EHc62LY0H6IipFQAIi0inErLkkVzjAjc58M8Qrem727c/IXMS7enaHIXoNhwzM6sLcYbvwmafZkv9fMQ7R1Z/NVi2YJwriZzC/ndKUbesYgyCeTnNTnPEkCjYR5oKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmVD5QDS; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmVD5QDS"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0b18f811cso249297a91.0
        for <dmaengine@vger.kernel.org>; Thu, 24 Sep 2026 14:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790284683; x=1790889483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QD6KVQmWiWZCi2apQJykDCktIAOK2lbc8NkdM91LUdQ=;
        b=KmVD5QDS9d6OoxzPnNgkdkgRi1hs5EwrTwZhv6Gr/fy/ij1+eYPW2u7T6FVkk53zji
         YZ9KNnZ5dT9j5wXuE5HPnnpbriBikZ51ZaTBpy5oeH+bbnLtpwDHY9Ph5qvIW9+GSuQS
         +wairQSu0Eloh86B2S9fBA7g7XBWs4bBDp2zhSgrnQMVUE3h3pcGaJYrA8pLZZT39v9L
         y9/UKj5lTuHpQAQnIc2BLWJC6UdYvW9redUgP4c7BKbaPioSYGWIFyfLGd/s7s6KajLg
         4KkkhyacKvDXoJwrZjmkcGmKBUaWVs4RbGVRtM7WuaCa/SpsBWNg+jhKkQ1LQNLo0YPY
         ePyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284683; x=1790889483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QD6KVQmWiWZCi2apQJykDCktIAOK2lbc8NkdM91LUdQ=;
        b=gVmHtgaK+CeXW/stlUhWPGfvT0zakkq4NXv+lHreERvrcL0jWfwL3Gg+V5L2JvuSVh
         ZjoAs3KqiOorP+EOpPviSm/+MplszTxhHrZT4VBg9uwjw/73YdT+PDfRLfPrx2DxEFIi
         tN04wOUMMSSvJinGUo5qIQq5YieHAN8EhI5/smCOWGyl7r8HRTbutOsfRokGl+TwwwVf
         /i/JnPV0Tp0ZNryRoXA7CmQW0/Rd/QS5r0VragDXDfbHPSOx7DiEdekYTFO/WQnYmQJQ
         mea5uvc5W0W1eGyJ95yj1qVQXurMCnONxl0jOF/HMJvLkyj5usWkrNgJIItGe9JjMudK
         C11g==
X-Gm-Message-State: AFuF++kjTSRSiIN6SYhW4OVOXkJ2eBndLyiTCMmzh2tGC1pWtLFldr3k
	mpxMRMpvpCUdDkHwrvbZAvyrNOdIx1YVxDTBGJf5E93lXUNbYTp/XUuNnR/atw==
X-Gm-Gg: AYBFou2r7grq1iOlmJbXlgIvxpSjsTpnQHd7dvxBU3sVRnjVrV52SxkMxLlfMEjBNBn
	VrbBpqVCYXqy/yBPjAJsLmwkW5FoWutLeXCe+h5CbtkyXpeGfi8YbZHMBWzlHyHgCMIrDEh9VP5
	ZSwk6hDOKn7a1CJXUTSgrXSL63vwbx/xXlTTRPVOABrhyxqpOOvLpIOBmKQvRejhBouSM+raFha
	rrY2evuYoQxWPTn68AnuJz4/fp7wHC+6LzDoJbKaHsYOSh4fbZyTnxt2yNQQ6jIXfvlmPzEvusO
	DRNny8ktIAnA9E2OqFJv4hsph+yxPJgj2Co4oQhE/3YPD56+N+mTNuQdYLRZa7SrhFCTqnizvx4
	vDnivw2F/GOnR08nZkRiP+kvyGkuLpsc3U8+DFgdVrpu0ZOF4XHvm6SslgDhD83gHvMMlMOBikn
	hqZk8Jj1BOp34rtiN9LwshbjcVE1JbhXkT/U9bwKQOgUK5RaPgIXUo6UY+Gmn+fQZAOpuMT1MHp
	t0c6L1hJ9JijZpnrafyjv1iUSFoeALoGbbDh0w4CTxEN0RM6sOjWje4Rzy7qjNpTjetNPIPE0+c
	9bXbyOboLXMxjoEBClnlPnQMnMrC0ZNgGScwhoh2ZLTJnFecjnU8yDrMDGA=
X-Received: by 2002:a17:90b:1c84:b0:39e:6a81:5a94 with SMTP id 98e67ed59e1d1-3a098e39a55mr3083632a91.40.1790284682689;
        Thu, 24 Sep 2026 14:18:02 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a097663fd0sm6613523a91.9.2026.09.24.14.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:18:02 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: mv_xor: use devm_platform_ioremap_resource()
Date: Thu, 24 Sep 2026 14:18:00 -0700
Message-ID: <20260924211800.79208-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the two open-coded platform_get_resource() plus devm_ioremap()
sequences with devm_platform_ioremap_resource() for the low and high XOR
register windows. This folds the resource lookup and mapping into a
single call and returns an ERR_PTR on failure, checked with IS_ERR() and
propagated via PTR_ERR().

devm_platform_ioremap_resource() reserves the region via
devm_request_mem_region(), which requires non-overlapping reg ranges. All
XOR nodes in the Marvell DTS describe two distinct 0x100 register windows
that do not overlap each other, and sibling XOR nodes interleave without
overlapping, so the newly-reserving mapping introduces no region
conflict.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 v2: remove build message
 drivers/dma/mv_xor.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index c4e0dce3ca64..481a34f2384f 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -1315,7 +1315,6 @@ static int mv_xor_probe(struct platform_device *pdev)
 	const struct mbus_dram_target_info *dram;
 	struct mv_xor_device *xordev;
 	struct mv_xor_platform_data *pdata = dev_get_platdata(&pdev->dev);
-	struct resource *res;
 	unsigned int max_engines, max_channels;
 	int i, ret;
 
@@ -1325,23 +1324,13 @@ static int mv_xor_probe(struct platform_device *pdev)
 	if (!xordev)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
+	xordev->xor_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(xordev->xor_base))
+		return PTR_ERR(xordev->xor_base);
 
-	xordev->xor_base = devm_ioremap(&pdev->dev, res->start,
-					resource_size(res));
-	if (!xordev->xor_base)
-		return -EBUSY;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!res)
-		return -ENODEV;
-
-	xordev->xor_high_base = devm_ioremap(&pdev->dev, res->start,
-					     resource_size(res));
-	if (!xordev->xor_high_base)
-		return -EBUSY;
+	xordev->xor_high_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(xordev->xor_high_base))
+		return PTR_ERR(xordev->xor_high_base);
 
 	platform_set_drvdata(pdev, xordev);
 
-- 
2.55.0

