Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777454;
	b=gFoe8Xy+A41fGvleQH+BWYVzFdlZe1435G1NVO6pxmvSG/1utNP7CmSO8BhUHz86XR+b
	 Txl8bybVh0yek0/NlCDgKCHzPoNt9VkTAD7nPi1eY0ucKYK6iMj15ELlIKG2rMNYr0a1E
	 iozP2aJkGqQAcPNi0Rr02sb4TZekfNWG4C+n9TlAohdtHvrQBkQYRuVXTa5Jnqk/WERcW
	 VkTHB+Zah86OO201ZeogmzET2/BNmPeGQG+3oZ6ALxuB6TBwfmujcwD3x2JdR6hSLJ/JC
	 +hr/QoksGK/cbE+4OhTXlKqo88GT0EnVxYf7INtZbZINflMLs51RT6wh5vojht5527w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777454;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=ds4sm9si83a81aIQG4knnSuuijkX5GS60QybAJGIn3Y=;
	b=cz98+l7pgi68XG+5/WoddoGEHhNt8ybgrbfnPWWKrhoUDcuO98Rw6qgsI+B+5XvYgWUU
	 A5mThwnpT7ElEQG0Jblnq9Inpzwf0TonucfnUszF5diplW9Q2NzVip1lkTo45BzeWg+q/
	 GDdLORkvygLDsWTk+I8nZtJ+Zy00Lt/WnnK+G5nH67Iazp9q5eRAkCycJswlUmbyzoCSJ
	 rKSyCi2tGtRGZqLJAWJH++PSAy//uQWP++GeD62gUv99yADWmUAuGex7fUZcXPxYScBUl
	 S5Qzt4jqF2fk+Of0qau69S03UYKTyXnvo4TJdxlwmF8j3EMxyWgeORNkLJJ4LiKvW1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=W7Ka+ecY;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C671606A33E;
	Fri, 27 Nov 2026 11:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C671606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=W7Ka+ecY
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5641a2c39;
	Fri, 27 Nov 2026 19:04:02 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	Frank.li@oss.nxp.com,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com,
	manabian@gmail.com,
	robh@kernel.org,
	saravanak@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/3] dmaengine: of: Add managed DMA router registration
Date: Fri, 27 Nov 2026 19:03:58 +0800
Message-Id: <20261127110400.379397-2-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127110400.379397-1-202300460064@mail.sdu.edu.cn>
References: <20261127110400.379397-1-202300460064@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa21cad339203a2kunm13da2c70394a81
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSRkeVk8dTRgfSUlJHk1IHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=W7Ka+ecYvyw4V8c6uiTg2flQXAlY6YfUwjGS2RAdLmNEwTFsjVqeKUHR5sXB63kdRAfIOZzTtf1NPxHcGFi0Aezp4k+14h6iAKuivYneUMXUKDj+sBzKhbtZA4yOmJIdE/9WE33hkpCwmrXQV7+ft5jGLChKhbB3wCOuQtrG8MY=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=ds4sm9si83a81aIQG4knnSuuijkX5GS60QybAJGIn3Y=;
	h=date:mime-version:subject:message-id:from;

Add devm_of_dma_router_register() to unregister a router when its
device is detached. Reuse the controller cleanup action, since routers
share the same OF registry. If registering the cleanup action fails,
remove the newly registered router immediately.

Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
Changes in v2:
  - Add the reusable managed router helper.

 include/linux/of_dma.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/linux/of_dma.h b/include/linux/of_dma.h
index 16b08234d03b..7f9198ea9627 100644
--- a/include/linux/of_dma.h
+++ b/include/linux/of_dma.h
@@ -64,6 +64,21 @@ extern int of_dma_router_register(struct device_node *np,
 		struct dma_router *dma_router);
 #define of_dma_router_free of_dma_controller_free
 
+static inline int
+devm_of_dma_router_register(struct device *dev, struct device_node *np,
+			    void *(*of_dma_route_allocate)
+			    (struct of_phandle_args *, struct of_dma *),
+			    struct dma_router *dma_router)
+{
+	int ret;
+
+	ret = of_dma_router_register(np, of_dma_route_allocate, dma_router);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, __of_dma_controller_free, np);
+}
+
 extern struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
 						     const char *name);
 extern struct dma_chan *of_dma_simple_xlate(struct of_phandle_args *dma_spec,
@@ -103,6 +118,15 @@ static inline int of_dma_router_register(struct device_node *np,
 
 #define of_dma_router_free of_dma_controller_free
 
+static inline int
+devm_of_dma_router_register(struct device *dev, struct device_node *np,
+			    void *(*of_dma_route_allocate)
+			    (struct of_phandle_args *, struct of_dma *),
+			    struct dma_router *dma_router)
+{
+	return -ENODEV;
+}
+
 static inline struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
 						     const char *name)
 {
-- 
2.43.0

