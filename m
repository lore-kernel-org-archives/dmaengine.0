Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734693;
	b=O0IB+qN78ggMAfdZhX4VwTXzZMW4+0l6YNxXW5zBuujAxTys431l+9MdYBn+cAMVk8Zw
	 zBP16Ph8TxvCINLZxOVAoM1iuiT5tihpNo3/XUI+toZL0JAilIHoaNA499093Rv1EcxcQ
	 bfEQ+8sFiYBqmL0PJ/xX+VoN5KvAm6+zHCwytubJg21XbfWywjLWxgOQwH8VFi0PeGd+O
	 hYSdwMDwqSrNGwAlXPhI1pe+9bWLnfwghM/OFQ2prUwxW3QVi/pO3npHDWJ1lU/gCE8DZ
	 iJxzIs4L7PQkNYc8Snw3pVXS0s2hkCK7xk4bFoIlNkzbAfjYiN7/mXxLntW7XicP1Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=tuTSxu3KTMYXj5m2sq/CjElD/51ek2rmveUedi9cdvQ=;
	b=pXrhNd+cmYBdEySXCvejLV2RD5yIJ3EafGXx77rL3mnQ0Mi7fFNqAhwLaaSTfQjUZcxR
	 H2WFkonPBfit+FPVyCwbChbEbWTQB+UIhHeXPDZUhMiW7CDfnyuqxtSiASD40zbfHUNqe
	 Xef+N8/y+lZ/UvPKYwzhZfc+p2YTrB1GGNvpugOuQeRzqrr+pj1rEQOOxpwvc/2FYaUKC
	 i5gr2nK7wWHK3eur3K/b4U41M5ircii3L7g7xY+YJKtYtT/jGCCVvaz2aht+Tf2bRs5sh
	 zTdceMkzJWszAsrMILIIvG+lRg66EH1e7OQsJL9agSe3ebomgvMfSL/xCByU3ujKmwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="GKRtY/xR";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1035606D806
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 19:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1035606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GKRtY/xR
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso36598545e9.1
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 11:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793734691; x=1794339491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tuTSxu3KTMYXj5m2sq/CjElD/51ek2rmveUedi9cdvQ=;
        b=GKRtY/xRqxKE0icRGOY1BmyhxrRDxuz7CSnjvN1kQlWXikkvz0R3sFAz8EPh+B8BED
         VHYDvslWBn1s8MtghLOL4W6uzFOja+20OtOFQbOF7QwyCVzyykDJ5gnCXuYj60qiIWDO
         HU5FW5OdZXn1Y6X1hmQc4YAx+rjaMNbVGA+01AQ7JSakygrakPRCy6P7ezF7/f/7JidB
         P31QRfc4IITd5Dikbcf7f6t519fkGW02GVIJEDEJK8I/8i489SdL/z+fBSwSlo4aNUkB
         a9svGfTw4Gh55GeKCCczCqgKD4PVjZGCzK4jYgVuvw8Upd85z+B8RrWCVWBxkyEbXeEy
         185w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734691; x=1794339491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tuTSxu3KTMYXj5m2sq/CjElD/51ek2rmveUedi9cdvQ=;
        b=zQRoJVQpixbqybqgdqC9xrj6r2GUr1GLZbxOycBpnLGvXRki7CFBHu7ndeF7o1tR7Y
         cR0CJ7rhbACKJWQ+DsZREN3k7WXlhawF8of3xPxfNefdH9hVb14f2HxFsw0P/vThgNdG
         Xa9uVIZCiaIRNx6eXI/4goLJIA3cIaV3Asbm3EDZaiIZDVEOo+SogWOXjzqXbBeugBia
         X6t8EK6YPjGsuQjNItD8aE9bthU0i1SOwwg1Qx0TV77avG1tTtDkyRagNw843aqbEUdX
         ZnAbP8zMEkcznuvYSyW8l/DczLjo8U9x4mPufu+bguSpqKSa2FgN6x6CJh7o8/0Y8qbP
         oSWg==
X-Gm-Message-State: APuU4Z/jA+06AoV3x8cpxVCh898qEMsTaNlRPTjRMEfU7NtrVdK0C8jQ
	D8Ke7mrJa7C2DNqXOtTKSy0IPWJY2xyK07VSObK6rY23WJ37dgX/LvHOjqmEwBaWTEs=
X-Gm-Gg: AYBFou3wqbainfOC0eYpYxhEGdQ1507114qQJckJo4Qzigqmyo6Jdf9I1CefxHrmLSv
	HEtkZq+w6i42kBmwqMpMWKkA100ZnrwOjtXyp22JJkIBszysIaEmnEziwcvYy+t3ortVPduNzWe
	66J3VRWF2isNAK+XHd6dwgsQBoC7w7Rrdk/zD9KPM0FQcnUu2UR9j49N+c6IW74qVoh1c1/Z8Gy
	12dH+Kfdc9TnRybEEz4iDNkIfKUhcgytuSZMu5sikQKq3lo5joaUxIAghmlGNdqS7yAK2Iql0s2
	v4Hvw9CZliH3io5FIn02V3Cx3uN3h0Re4sHP7B5CjJl4mJ15GSmfxvHa0mC2JoaiJ/RAVWR5JOA
	ePirwhOhPEaTir0k75aDdgeZ96tlBT9G6bf6tkbeczxjNmtRujG74kXLJonQmuPqtHF3NTJ1zsA
	Iss+LCiV7umWHOPas3OcJg0yLFa94osxZq9EBiVILpQBhZUK1JanVCenH0cT/DrSY1a906F42vE
	nawT+fMwMioC6XW0XOarrtJLGFpUerBr4aH45Lat43q71Rs62yjiINM5eG1nnM5cbbBjeEu8Itg
	bNGNsq3qjyD+AWek2Rq9jMqu2Q==
X-Received: by 2002:a05:600c:8b61:b0:4a2:1398:dd05 with SMTP id 5b1f17b1804b1-4ac17752ee4mr302304865e9.16.1793734691196;
        Tue, 03 Nov 2026 11:38:11 -0800 (PST)
Received: from localhost ([2001:4090:a244:81d0:2c16:1c4d:8a04:e0bf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b413312b94sm2165015e9.3.2026.11.03.11.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:38:10 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 03 Nov 2026 20:37:30 +0100
Subject: [PATCH 3/4] dmaengine: ti: cppi41: Restore QMGR_MEMCTRL in resume
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-v7-3-topic-am335lpm-cppi41-v1-3-d7213446c5f5@baylibre.com>
References: <20261103-v7-3-topic-am335lpm-cppi41-v1-0-d7213446c5f5@baylibre.com>
In-Reply-To: <20261103-v7-3-topic-am335lpm-cppi41-v1-0-d7213446c5f5@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Daniel Mack <zonque@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Julien Panis <jpanis@baylibre.com>, "Mendez, Judith" <jm@ti.com>, 
 "Francis, Sebin" <sebin.francis@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2614; i=msp@baylibre.com;
 h=from:subject:message-id; bh=T6rTeOj2mOVu4qd7MFS1jh/VVnFzsdhhla/rk3UZJo8=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqxXFsKpjQ9+x5c/rYm9/bl9wn7BJ3u/L6rfcPTZ9I6rX
 878iV27uKOUhUGMi0FWTJGlMzE07b/8zmPJi5ZthpnDygQyhIGLUwAmcu0RI8OC25+Ur8mGMu6Z
 89M0nvPsjc+vhZttq3+zVO1bryq3ze86w//QY618XK2+0keu63f1Pvog/bkr/Idl7j/PyFLnIN4
 d6hwA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Currently only QMGR_MEMBASE is restored in resume, QMGR_MEMCTRL is left
at its default values.

Add a restore for QMGR_MEMCTRL. This introduces a helper function
cppi41_memctrl() to not duplicate this calcuation in init and resume.

Fixes: f97b98d6d02e ("dma: cppi41: add support for suspend and resume")
Cc: stable@vger.kernel.org
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 drivers/dma/ti/cppi41.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/ti/cppi41.c b/drivers/dma/ti/cppi41.c
index f5a824418fe7..e2a089066c6d 100644
--- a/drivers/dma/ti/cppi41.c
+++ b/drivers/dma/ti/cppi41.c
@@ -842,13 +842,22 @@ static void deinit_cppi41(struct device *dev, struct cppi41_dd *cdd)
 			cdd->scratch_phys);
 }
 
+static u32 cppi41_memctrl(int area)
+{
+	u32 reg;
+
+	reg = (area * ALLOC_DECS_NUM) << QMGR_MEMCTRL_IDX_SH;
+	reg |= (ilog2(sizeof(struct cppi41_desc)) - 5) << QMGR_MEMCTRL_DESC_SH;
+	reg |= ilog2(ALLOC_DECS_NUM) - 5;
+
+	return reg;
+}
+
 static int init_descs(struct device *dev, struct cppi41_dd *cdd)
 {
 	unsigned int desc_size;
 	unsigned int mem_decs;
 	int i;
-	u32 reg;
-	u32 idx;
 
 	BUILD_BUG_ON(sizeof(struct cppi41_desc) &
 			(sizeof(struct cppi41_desc) - 1));
@@ -858,13 +867,7 @@ static int init_descs(struct device *dev, struct cppi41_dd *cdd)
 	desc_size = sizeof(struct cppi41_desc);
 	mem_decs = ALLOC_DECS_NUM * desc_size;
 
-	idx = 0;
 	for (i = 0; i < DESCS_AREAS; i++) {
-
-		reg = idx << QMGR_MEMCTRL_IDX_SH;
-		reg |= (ilog2(desc_size) - 5) << QMGR_MEMCTRL_DESC_SH;
-		reg |= ilog2(ALLOC_DECS_NUM) - 5;
-
 		BUILD_BUG_ON(DESCS_AREAS != 1);
 		cdd->cd = dma_alloc_coherent(dev, mem_decs,
 				&cdd->descs_phys, GFP_KERNEL);
@@ -872,9 +875,7 @@ static int init_descs(struct device *dev, struct cppi41_dd *cdd)
 			return -ENOMEM;
 
 		cppi_writel(cdd->descs_phys, cdd->qmgr_mem + QMGR_MEMBASE(i));
-		cppi_writel(reg, cdd->qmgr_mem + QMGR_MEMCTRL(i));
-
-		idx += ALLOC_DECS_NUM;
+		cppi_writel(cppi41_memctrl(i), cdd->qmgr_mem + QMGR_MEMCTRL(i));
 	}
 	return 0;
 }
@@ -1191,8 +1192,10 @@ static int __maybe_unused cppi41_resume(struct device *dev)
 	if (pm_runtime_status_suspended(dev))
 		return 0;
 
-	for (i = 0; i < DESCS_AREAS; i++)
+	for (i = 0; i < DESCS_AREAS; i++) {
 		cppi_writel(cdd->descs_phys, cdd->qmgr_mem + QMGR_MEMBASE(i));
+		cppi_writel(cppi41_memctrl(i), cdd->qmgr_mem + QMGR_MEMCTRL(i));
+	}
 
 	list_for_each_entry(c, &cdd->ddev.channels, chan.device_node)
 		if (!c->is_tx)

-- 
2.55.0

