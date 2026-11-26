Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699693;
	b=Wbc+iyn2MFpBmw2S3JYKdAMNqkmqfEoMiH9G73VIF68jNgR3/5Chdh+cv2JlyDzMXZVL
	 hk7Phj4XwaY1zmpUE5kD+X4rCTBlppmJkd15asY8H6LtAVISWuMAH3cAebWB+Ka2ldfp8
	 rbd1hT7tSjsNuuJKcHJDjbhQtHFCJDnbeCzjke9FKPeybO51h0sE5m+des/g3zdE/upOu
	 66QESHrNZn5kJ1JGooANudhZNz/SR3qGOrn5SxmWTJ6U0ztkjlLUDOCZZbmI318e8H5QM
	 HX+qsmrswuE8RGIwBTntR8VG7aEHuJhxlUA7fQj6ss+eS5N2bR7YdwrWq1V7SYawHtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699693;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=ZsLSyj095odhNFSzmJK1s2C6OYwLrN2sRDKqCzKWD7I=;
	b=fsGksuuYwRFw97HH2qcjldybT45fMeZx8Kcq/Hj3ri8r5rAVx10nfxi+bONtSIKf0igc
	 YOhQ1i3WkWWInqMXm+QRpUP/JQaYgFoaolca7aTdiIalWlXRaWJWaRDKWsiIpse5fxg4m
	 XN2Pbv+sHOxKCX3nCbcpEDt/OlhsOIXkZMy3H0IYKHt5+8a2bCKp3NcNq1plb2WL/jwop
	 2/u91a9LB1W2liGdS+U+vuYZsas4Hn/u3KyXwTYJazN0DJidRDGGCUzKgxY8XVSnLLdEU
	 HvdP1fhCVWG9L+kv0SvJXDiFi/F0CKegIyyHgIBhxeym5oncOOH3Xc6BbSfLGz99vVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=EaINhOIs;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9A7606A31E
	for <dmaengine@vger.kernel.org>; Thu, 26 Nov 2026 13:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D9A7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=EaINhOIs
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561f6fcb8;
	Thu, 26 Nov 2026 21:28:08 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: vkoul@kernel.org,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com,
	manabian@gmail.com
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH 1/2] dmaengine: lpc18xx-dmamux: Unregister the DMA router on removal
Date: Thu, 26 Nov 2026 21:28:05 +0800
Message-Id: <20261126132806.4091183-2-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126132806.4091183-1-202300460064@mail.sdu.edu.cn>
References: <20261126132806.4091183-1-202300460064@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa2180ac31d03a2kunme5d0c11035d95f
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGU0ZVkJKSR5IGkgZQ0kfGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=EaINhOIsKHufBDDUOY5PAE8cJyLjAbBJgiP9dgMdxGk5V7j/N5qJ+rF63pWekZAeQqSgmh8rmmmRthdRVJnuDJoGZmFH/FIGKgIDeCTJyI9Y4zVPJMzKJnjZ8ojQfGpdrTvjwfP4wmMArzRM2jj7bzhO/IlCZEYsnysjtqKmHZU=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=ZsLSyj095odhNFSzmJK1s2C6OYwLrN2sRDKqCzKWD7I=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

The DMA router remains in the OF registry after its device-managed
data is released. Remove the routing entry when the device is
unbound.

This issue was found by our static analysis tool under development.

Fixes: e5f4ae84be74 ("dmaengine: add driver for lpc18xx dmamux")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/dma/lpc18xx-dmamux.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/lpc18xx-dmamux.c b/drivers/dma/lpc18xx-dmamux.c
index 40a338f0d44b..412d425dc1ab 100644
--- a/drivers/dma/lpc18xx-dmamux.c
+++ b/drivers/dma/lpc18xx-dmamux.c
@@ -169,6 +169,11 @@ static int lpc18xx_dmamux_probe(struct platform_device *pdev)
 				      &dmamux->dmarouter);
 }
 
+static void lpc18xx_dmamux_remove(struct platform_device *pdev)
+{
+	of_dma_router_free(pdev->dev.of_node);
+}
+
 static const struct of_device_id lpc18xx_dmamux_match[] = {
 	{ .compatible = "nxp,lpc1850-dmamux" },
 	{},
@@ -176,6 +181,7 @@ static const struct of_device_id lpc18xx_dmamux_match[] = {
 
 static struct platform_driver lpc18xx_dmamux_driver = {
 	.probe	= lpc18xx_dmamux_probe,
+	.remove	= lpc18xx_dmamux_remove,
 	.driver = {
 		.name = "lpc18xx-dmamux",
 		.of_match_table = lpc18xx_dmamux_match,

-- 
2.43.0

