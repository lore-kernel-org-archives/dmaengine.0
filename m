Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734691;
	b=KMjLoDjCMo8Lu+u9jjUbSA0ontlHA3SdFiJozM1CSuHFcYn6egKJXBnd42CRxws5Glp+
	 hZChKmLF6Zo6AGZhdzjLXTYJOVjzQgYfLE5BK34rP3z07BSjqo/AmzRMXu7ENUaPZJVZs
	 z8fboIZMhg3J8GCvvXQJpb8dR3yKu6OPSGoTLFHJStkqO0OLu/zNPuAMkpXKM887y2IKR
	 +qtmjDdZxc5F6n1zmAZA8vj6vvwde9U/2Of8rK5slLTEdJo01+2ZYzwpQD8C4n5p2qABU
	 4kbp1ZNBrb4YBXuh+YOHpFs4lXurkTen/U8WgImOuDrliBMW7ZobaqBkX+eGSfgLX4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=8PPx/HR4xDG+iQY+cv1KoaG7KZBkWYuC6hmVzUweW8E=;
	b=HXIJJ5/BvqYjRCdxgSWZpP7A4xWWFwR34Y6OBaDhaDSTCBpefzVCXHxjt060oKRE3aoy
	 reXLpRdGvTVmKPzmDQxlwUiax7iejOMEhx8celNOxTHYpq4KWRLEwsSKnt/OdsUq4tUJ5
	 WzMSl7noXSl5IP83gCSYFODhxQkrVCbomV3Sn3Rj5A58qni88VfiVDqHcTi76VjhEIMXS
	 Kovp40KERrrH4cNRxQ9fnT4nI+6Vn8eOvlRRHL1onUxqet2cQssYxeXRsbqx3W8Mrdw8d
	 tvni2Tv+s79sA6HbOe03w6Yh6jxtt/V8npu2pznM54AItyzZBBIohlGgdFmR+mi6lJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Fpvs0M3M;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0AA606A334
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 19:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D0AA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Fpvs0M3M
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so34752955e9.0
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 11:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793734689; x=1794339489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8PPx/HR4xDG+iQY+cv1KoaG7KZBkWYuC6hmVzUweW8E=;
        b=Fpvs0M3MJhfioY9sbGDh6sQpSD9Paq/GLsra9eG2IsBCECMHqW/VdV9qY4TiuxhRrr
         cTyFX27EkNM+Kzl1cJR6W+R5Cg/eP7GdbSQPB2wa4aI5XQr4JWBXaYh7RtYF5UJjx4NY
         3VkuqRbCTUOJ7l6YaSZVQOiiAnB9YSyjVYUczbVorXCkvTMEDGUiSZXj70NDg3xhDHvn
         c+lBuNeaJ05Um34iCSb8ldNZU5474mF4yP+njoF3/NcIx/WC2oKmpdbEO9Pg4BlxSrIK
         d56ApTQNhRN6nt5+gLZz5T8FNuHz25vvI2rTl9zzKLpwN7MUJShsl+VbpL/3K67EoxKa
         C3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734689; x=1794339489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8PPx/HR4xDG+iQY+cv1KoaG7KZBkWYuC6hmVzUweW8E=;
        b=dcvVl9Nvrh0W9GtNilksxBabmzrLpidowBXvHl98KNu6cCsjF+hGekdJ35+peDGvdI
         A4t7Zm3iIdteWdfjCu7zZ8Ex5eIczXKPotI34vk8OEpwNvS5rPyUueedZyUf6CjbRzbp
         jrl8aGg1xKpEZLMnffZbB/lb/zRoGe0P2qkjXPDH5T6oyczfcLgQ/7PA+OdsIzIaEZ3N
         +zR9HWtFKgs+LtFL97mx7WuhTZgNN9yQYlEIy4Sbe1JZy+6pf1Quf3YmF2pq3UrFXvDw
         VM8SAxfoEVrgFB8X9Krjox57me52d+cj7hRiOQbaPcoUU0ucrNWfajUIUkzSP0tPM48Z
         +WxQ==
X-Gm-Message-State: APuU4Z+ONJQQ8C1qfj7BAQ7gdzZGxQI6qF44hB2kLoM/1kBMY8sYqpwx
	5yO1fm9SzJX6MPBi+wBOXRIaen5U7zXsEj2XH78m+cTD3aPV79OBnZ6S9gbj7gAD5jA=
X-Gm-Gg: AYBFou2oateiv+M9MJQSJrxDA0dPy+uavWuY37I6nleb6SUJPNcrchMpYBMLJ05+qVl
	XChnPwrdQZfQ17TT6o4YB9JnUK1afzaRiudAcIGIkpfhZS4USX7WKCRyssW+YPe85Vl1JGODW9r
	RdIB5xvY6j47UG0NfxuXSwxVQSnZLTTY5T5xs4TrYDSDE74BMw9mH66v0dVX9hzCegFnx+O0t+w
	K6USbk1Hz+IXQ3A7RsmVoF9/IE3OivXeNf4U0UXBBQhiluCVb+uCQ2trahYmxVLXieX0tpJeuDr
	O4aSZwvyU72TCupTu75NoQ+4WVmw9bnldOFUmQrKBDS135GmkR2cTbyqal6qHEMkf/OCM9AltqR
	nC71FLPcMLV4z1y/fItEUYqTQ/Asy78vLJRYUG8iZNva93Efqo7lL5xaezAo+kkI31EWcWx6SpU
	nqJW3DlRiTdm9Cc9GEFuaSi8Nwp6J6DFdjG4TnvLTtByuO/EvyNFr28Qm9JyyCkJ6BMWamaMH52
	XrU98WUEORmyIVCs7Nzs3Bkakp15x4RCe81OOaZaoaxSM+ZXyGA1r66o1XLfN6hV5DCgW2Upu1h
	iVJeq3L5KFoXEvXo6s3fKRHyMg==
X-Received: by 2002:a05:600c:1387:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4ac17d16afbmr327136595e9.8.1793734688513;
        Tue, 03 Nov 2026 11:38:08 -0800 (PST)
Received: from localhost ([2001:4090:a244:81d0:2c16:1c4d:8a04:e0bf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b41297c16asm5880115e9.3.2026.11.03.11.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:38:07 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 03 Nov 2026 20:37:28 +0100
Subject: [PATCH 1/4] dmaengine: ti: cppi41: Use td_queue to restore
 DMA_TDFDQ
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
Message-Id: <20261103-v7-3-topic-am335lpm-cppi41-v1-1-d7213446c5f5@baylibre.com>
References: <20261103-v7-3-topic-am335lpm-cppi41-v1-0-d7213446c5f5@baylibre.com>
In-Reply-To: <20261103-v7-3-topic-am335lpm-cppi41-v1-0-d7213446c5f5@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Daniel Mack <zonque@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Julien Panis <jpanis@baylibre.com>, "Mendez, Judith" <jm@ti.com>, 
 "Francis, Sebin" <sebin.francis@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1510; i=msp@baylibre.com;
 h=from:subject:message-id; bh=B/woc6BJx2wq+Pk4aPkNjANUiNT1MPY10g3hs4IO0Lw=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqxXFlyRG8zuTBTpWpAlxTx3WtnpBxcO69g8tjr4bdF+e
 4NuL4FVHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCR+kuMDN++hwdM3JT0Tyz0
 942/oX37VxlO3nTyqs631XPZrW4d3sjA8IeLazrbguufuTwsdxSqh5uFz7nr4+m+Unp74tcVSVn
 tS7kB
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

In init_cppi41() td_queue.submit is used to setup DMA_TDFDQ. In
suspend/resume the same value is read, stored and restored.

To get rid of the suspend register access, use td_queue.submit in resume
as well to restore the value.

Cc: stable@vger.kernel.org
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 drivers/dma/ti/cppi41.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/dma/ti/cppi41.c b/drivers/dma/ti/cppi41.c
index 88756dccd62c..458d20b12462 100644
--- a/drivers/dma/ti/cppi41.c
+++ b/drivers/dma/ti/cppi41.c
@@ -146,9 +146,6 @@ struct cppi41_dd {
 	struct list_head pending;	/* Pending queued transfers */
 	spinlock_t lock;		/* Lock for pending list */
 
-	/* context for suspend/resume */
-	unsigned int dma_tdfdq;
-
 	bool is_suspended;
 };
 
@@ -1174,7 +1171,6 @@ static int __maybe_unused cppi41_suspend(struct device *dev)
 {
 	struct cppi41_dd *cdd = dev_get_drvdata(dev);
 
-	cdd->dma_tdfdq = cppi_readl(cdd->ctrl_mem + DMA_TDFDQ);
 	disable_sched(cdd);
 
 	return 0;
@@ -1195,7 +1191,7 @@ static int __maybe_unused cppi41_resume(struct device *dev)
 
 	init_sched(cdd);
 
-	cppi_writel(cdd->dma_tdfdq, cdd->ctrl_mem + DMA_TDFDQ);
+	cppi_writel(cdd->td_queue.submit, cdd->ctrl_mem + DMA_TDFDQ);
 	cppi_writel(cdd->scratch_phys, cdd->qmgr_mem + QMGR_LRAM0_BASE);
 	cppi_writel(QMGR_SCRATCH_SIZE, cdd->qmgr_mem + QMGR_LRAM_SIZE);
 	cppi_writel(0, cdd->qmgr_mem + QMGR_LRAM1_BASE);

-- 
2.55.0

