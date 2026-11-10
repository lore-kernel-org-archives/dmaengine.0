Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316658;
	b=BuVwVP6tx7E75DySqc5KiRRpZ+8qFp1w8davCXNSUMc5DH9zyRayr4C+PiQLQYyejqWZ
	 uL+3ze7lqjecKnJrejEMmfYX6n9Xeb0hgN4Or4z7rABlH7D1cJdVF0I9y8Kt8vRb3ujkg
	 ItmvKU3f0YxnUyytxlWw6rIh/pwxF7Cyq87C1qB96MkzF2F8h3lSGqVGIsXaFM38Ry5M6
	 ++fn211LfIWFOGNMqYRBE8iupPrOR1LqnvzfQIBqmhiXhd5/xzS3WkeCdK8GXKwP2xdkY
	 dKdZ8jIjyQmNZmi54Lhsr+OPAJukw9rw2H32/GSYZgMNcg6923kER2i6FIIQkzbrEVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SmC6z0SGnHZMqw33i8OvX2WsVfy3whtNtxw8axc49Lo=;
	b=fwv9/FvmIs6aoCSEBdSJKCfa3WV2IzujMe6nrqGj3Z+GOW2IaXDV82hMszAozrlHEU7W
	 0eUIk/hogMUbbhaOunLK2P1FNbaeHBzHLntxzA3nkUOGTfFx1C7DNdXRVUX4Jy3rWfI9i
	 QGenMpECq64wT/PB1f8Cbc6pOc0lb9GFFwlav4BhVxFQoamhhYRJF83PEQImXEkCGGpT2
	 CN5MX5xK9urcMK7Ro4wcKVfDvQDIo8LEf1ksKmFpclSiLLkhvPtNvbUSTq2bPHZ6Bd1W5
	 2gxiH2pgESvlyzXEndACupikFBHrp7pHQs6wzHSsDETzDpzSizVSmYN5xwlmyr8TO5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="X8RMi/CA";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8938606A7E2
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8938606A7E2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X8RMi/CA
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so1107752a91.1
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316657; x=1794921457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmC6z0SGnHZMqw33i8OvX2WsVfy3whtNtxw8axc49Lo=;
        b=X8RMi/CA6HMKcE6Lk2v8Y8XdKMsZf2NhdEGCKNU31vVNOwqNB94z5UNdZMgKbu8J3b
         W4DKF863+WXJJvgMBYSnsleUlRP6TdA790cSuHpjFch+FWbFpuWJOK9bKla0xDQRJyIc
         cH7KHVdKlzcAXpjg1x7PqmYbeLKMBtxKXY/ds8llnlxwpzPczGm22KrZni+VXrIlrddH
         n83+NuIY2JdUiZL1I+wsVz7FM370xEmTz40jex1iI/bR60CmKQb6ramgKCegOjVoGisG
         OrbtsiN7vwvsorkt8xBbth7xuwZvdkV/7euiBH3H2osbKYCnHD+n3lYikTHL54YtrM3j
         hprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316657; x=1794921457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SmC6z0SGnHZMqw33i8OvX2WsVfy3whtNtxw8axc49Lo=;
        b=i10X+bF9DNKYR1Y5Bl45/346koZ7sd04ehFyu1X9ahz3nw1xiC8+3Fb8C7M11PzvUN
         5/Et/hxtfKKvMwMz0WPmx6riJvAw1qgHuSim+0DmSW+YhU6kVvojh3AwFinFSR1B1TuS
         CK9i/9zzAw6N8UCHwD6uTw1BaBGHfNVuFoub47LVNnU6hcsj0BQHeC8gheRqWOwRSVVz
         UHtpxqNK/3jydkKsgHkI26lHoTqP6+2i6RQGdmeD5EKcTMTZfkkdbtP2YBQ4bmQW3Nhf
         m7IjDKPj7VjCbnYfQV6ZDEQRulvRikO9jUrTZ6Ju++HorPCG/HRyx7dHqjP9hZzk1eJO
         3zsg==
X-Forwarded-Encrypted: i=1; AL+hErHDFW1RZ2u1HLsnPRyXe3qP0RuvzXqBP4hlaEnhHkNzTVMXIReuIEF1i2IgZz1Pm86N575m8YQd94c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QnMSJPqU1o9vYRorAXapY6PzgHHQ68YBFow3gg1aMf1ouvBWO
	YWcbvWlyFyhKCtr/5pCjQmWMEtOR8oro03C/YZ3E+QWI46SZhDlzKd/N
X-Gm-Gg: AYBFou1Jd5GQbjcfns2nsfMmmprulncR7s8QpWq6GuUoV19AgrWDXtq2pPSniNrUKAD
	mEqRf2Axz43MLePgB5uXvnjCT/b82RobKHzCAkvX7Cba2aLXFwOdwNjyb6y86fNFyipP/jD1nB0
	2O5CRW58YBuzv/J90qjiTkOPywgB+S6/WN8EOCXH6U3l4aFVVl0D7J2rkQtT0TiQ/sY6enZEMHW
	BTQ2y2ATUxyEE9L2IoZKSLbnJmryUcdfMV3dJr4FgndpqQvwEOmQ+iLb1+PkJ/ItyyFLkjt4o4d
	wcfBmYh6NxGARgNA8+paou9NcDwLvELMHepiXTCvuwxF4M7Ocj8fSyLXEiUM/5q9sVzkbt6mAaS
	S4Dw49ci2/E0Ietm69TG/y9ZNntQmdkdILBh7jUf82DbEFOcjrwl3gcD3PwYNfl+NZfsHLSrQEx
	sPsA+J/czvZuOs5bRMUK6glv0bNMIW4SFNm768L0F4YTx3O4FwDjcyaQKWDLuoPDIm3mf7yoa64
	2FoipTgHeFLfdeAvaDN1u+yCyapLeE6ErBmIRWu4AVEHDTt4ANI7JIoS53yFXd2wYV78+sJrNCt
	RWGSevfJtEy/xI9/V8a7tDkMT6m8oF4=
X-Received: by 2002:a17:90b:534c:b0:3b0:a757:e370 with SMTP id 98e67ed59e1d1-3b167a3863bmr1474256a91.42.1794316657157;
        Tue, 10 Nov 2026 05:17:37 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:36 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Bjorn Andersson <andersson@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 32/33] dmaengine: qcom-gpi: defer callbacks via vchan
Date: Tue, 10 Nov 2026 05:13:32 -0800
Message-ID: <f7d8c6b405705d941201a1b11872442dbf5682c0.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
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

Complete descriptors through virt-dma instead of invoking callbacks
directly from event processing. This preserves the transfer result for
the shared vchan BH, which invokes the callback and frees the
descriptor.

Because callbacks are now deferred, synchronize the vchan before the
channel ring is freed in gpi_free_chan_resources(), so a late callback
cannot observe a torn-down ring, and provide a device_synchronize()
callback so dmaengine_terminate_sync() waits for pending callbacks.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/qcom/gpi.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index d3c3d0f35afb..e125b3a83b1a 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -981,8 +981,12 @@ static void gpi_process_imed_data_event(struct gchan *gchan,
 		result.result = DMA_TRANS_NOERROR;
 	result.residue = gpi_desc->len - imed_event->length;
 
-	dma_cookie_complete(&vd->tx);
-	dmaengine_desc_get_callback_invoke(&vd->tx, &result);
+	spin_lock_irqsave(&gchan->vc.lock, flags);
+	list_del(&vd->node);
+	vd->tx_result = result;
+	vchan_cookie_complete(vd);
+	spin_unlock_irqrestore(&gchan->vc.lock, flags);
+	return;
 
 gpi_free_desc:
 	spin_lock_irqsave(&gchan->vc.lock, flags);
@@ -1060,8 +1064,12 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
 	result.residue = gpi_desc->len - compl_event->length;
 	dev_dbg(gpii->gpi_dev->dev, "Residue %d\n", result.residue);
 
-	dma_cookie_complete(&vd->tx);
-	dmaengine_desc_get_callback_invoke(&vd->tx, &result);
+	spin_lock_irqsave(&gchan->vc.lock, flags);
+	list_del(&vd->node);
+	vd->tx_result = result;
+	vchan_cookie_complete(vd);
+	spin_unlock_irqrestore(&gchan->vc.lock, flags);
+	return;
 
 gpi_free_desc:
 	spin_lock_irqsave(&gchan->vc.lock, flags);
@@ -1983,6 +1991,13 @@ static int gpi_ch_init(struct gchan *gchan)
 }
 
 /* release all channel resources */
+static void gpi_synchronize(struct dma_chan *chan)
+{
+	struct gchan *gchan = to_gchan(chan);
+
+	vchan_synchronize(&gchan->vc);
+}
+
 static void gpi_free_chan_resources(struct dma_chan *chan)
 {
 	struct gchan *gchan = to_gchan(chan);
@@ -2010,6 +2025,9 @@ static void gpi_free_chan_resources(struct dma_chan *chan)
 		gpi_reset_chan(gchan, GPI_CH_CMD_DE_ALLOC);
 	}
 
+	/* drain deferred completions before the ring goes away */
+	vchan_synchronize(&gchan->vc);
+
 	/* free all allocated memory */
 	gpi_free_ring(&gchan->ch_ring, gpii);
 	vchan_free_chan_resources(&gchan->vc);
@@ -2279,6 +2297,7 @@ static int gpi_probe(struct platform_device *pdev)
 	gpi_dev->dma_device.device_prep_slave_sg = gpi_prep_slave_sg;
 	gpi_dev->dma_device.device_config = gpi_peripheral_config;
 	gpi_dev->dma_device.device_terminate_all = gpi_terminate_all;
+	gpi_dev->dma_device.device_synchronize = gpi_synchronize;
 	gpi_dev->dma_device.dev = gpi_dev->dev;
 	gpi_dev->dma_device.device_pause = gpi_pause;
 	gpi_dev->dma_device.device_resume = gpi_resume;
-- 
2.43.0

