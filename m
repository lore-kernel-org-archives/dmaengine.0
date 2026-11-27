Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779218;
	b=SmbOTW6mJbKigQ0Rt9wkh02pdHCCSgNt4fsaYBTfQB01ZBG7KpQARPbP6gxOepaKCmNd
	 ohvw/XXlklUpi3lhO4GNwKRrfmTzzwRMJNtjW3aaK6EIfqC1z1DMqvKPoXJA8YReor5jf
	 G1KfeJ5zvK6gUTQDgNGJZJBR3wJWd7C7wK+jRRZpkgT97Og0hO7r3Spr0OSw1PxddeYBt
	 h7kzthN5fAxgJX9a/x+5ANYnDT6uoksZZ02skxEHR3rRovFbnbjidK1IcGYG6qAy4n5SJ
	 mzm+SBccprrCUdFq2bIjIR4IATDxABSHt4FDQpllcU2tG7ZQ23XqOcZMgEAHbGSAMUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779218;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=YmRsZyfOBwEebm57e1uhgiWT8YV2brPEanQzojdKxVY=;
	b=ZlKlAhB+nh7HxFVCKw9izrDjUfLUY7WTx1ySs5GQUmwXa+HeUa/ChXsNgLAoxjRWHDPp
	 XQKp7h47F/NQvwRS/AWxIEkX4MMCgOl2EY82ugf41l1IZOK3unc+nviGbzGUNP7uJlHDJ
	 tZmbTbMfFc/XnIizmZk/YohDDt4ZnC3HIcTolNyiaUJUxDGgl5DJAMXsCPqpX1CwkvOMA
	 zdubbXJCnr0W/0Ednok4YQJWGt7g2W+EO2FP3uwscHgBWndYeQfcJPnkGAXlGZ0dNBLLI
	 lugWZQxDrNpTE9iOdWuMv1mXW3arhW3kcFzpM8AFbFSxH/wPburKDrkgNf4/TfEo8JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=CnWlfi6d;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8145F606A31E
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 11:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8145F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=CnWlfi6d
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 564299836;
	Fri, 27 Nov 2026 19:33:34 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: amelie.delaunay@foss.st.com,
	vkoul@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	cedric.madianga@gmail.com,
	pierre-yves.mordret@st.com
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] dmaengine: stm32-dmamux: Unregister the DMA router on removal
Date: Fri, 27 Nov 2026 19:33:30 +0800
Message-Id: <20261127113332.390552-2-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127113332.390552-1-202300460064@mail.sdu.edu.cn>
References: <20261127113332.390552-1-202300460064@mail.sdu.edu.cn>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa21cc83c5603a2kunm85c9bc3d395dfc
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSUsYVk0YSRlJTExLHkMdGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=CnWlfi6djbcQj5gl6XVsFkrplbFqXE7T10I3VCokGbE6ys+mLE2tIR9rA3szdbYqZFOZI6/ZwVDtgxPUY1aIOScCNQv0WMcx4hdp396MQnMSDwGN+NPqkmkh+pS71Cpl+MFTXkWYU5eehd1B7HrFsW2MiCN1h+36uJWNPUKG3zA=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=YmRsZyfOBwEebm57e1uhgiWT8YV2brPEanQzojdKxVY=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

The DMA router remains in the OF registry after its device-managed
data is released. Remove the routing entry when the device is
unbound.

This issue was found by our static analysis tool under development.

Fixes: df7e762db5f6 ("dmaengine: Add STM32 DMAMUX driver")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/dma/stm32/stm32-dmamux.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/stm32/stm32-dmamux.c b/drivers/dma/stm32/stm32-dmamux.c
index 57318715d9f3..6f49d78bfe3d 100644
--- a/drivers/dma/stm32/stm32-dmamux.c
+++ b/drivers/dma/stm32/stm32-dmamux.c
@@ -389,8 +389,14 @@ static const struct of_device_id stm32_dmamux_match[] = {
 	{},
 };
 
+static void stm32_dmamux_remove(struct platform_device *pdev)
+{
+	of_dma_router_free(pdev->dev.of_node);
+}
+
 static struct platform_driver stm32_dmamux_driver = {
 	.probe	= stm32_dmamux_probe,
+	.remove	= stm32_dmamux_remove,
 	.driver = {
 		.name = "stm32-dmamux",
 		.of_match_table = stm32_dmamux_match,

-- 
2.43.0

