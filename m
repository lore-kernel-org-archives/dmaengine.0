Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6943B3DA5B2
	for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737911; cv=none; b=JGRSA3oTZV27CxjkVrk0iUhQqlxwoEtapdkGZ0DfVwwlNlYxb2qT3BqUsKajAHcI+d7rs1y2owVCDQWWoGVzPsIWrJh/w13eqcvDboBxQ2G5pfetAbNO3MuuIVdS6q4MQMEOT6r3NTPcANx8E9z+qLve8TAxUVH3jiahzz7ZeYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737911; c=relaxed/simple;
	bh=UvNJWScAUMw5qzE4pPixW9hPym/GBTWgCiAF/Xkhnys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R1cNHlZCOLuflB3DRU5biXPmnsWGJBrxvnknCp/lc46F5wPMTbWJiEcqIn1qD+CPAx+yfiE6/cYkOFMFq3QVt0phHldjWgzRMgj56tPDZM2obFjCkc9uPQRc7++LCkSpP76okcPRhFH7hYSpccY9jzf99/gZXLuHwYhBGvPq6jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dedv0dEj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=McvUKaTz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dedv0dEj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="McvUKaTz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9Cfas4065878
	for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 09:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MJdLJ2/eq1GUPmY+HSV6dQETw+k5xD0t1z7GbxkxqVA=; b=dedv0dEjDL1XFf8M
	4pYTI2qxCArdbHRI5yC/f8F2mTYigJcEeIAJ1H2qxBT5V4DbTvwnosjVCvVZRomU
	++E9NKg7Ftoz0Wh+ZEmJ5zrqw/37KNf43iNrkRBitegdClaJd+WctPLBAtBigQS4
	YHtyH4eI/z9CogOzhHRn+UACuA1M6G6AnCwh1j8YF5DndS6+nxXFR1AMlAI7DO2G
	itLcg6+YNiqTH6E7d9ueZfts7JBUk2EbABPkCzKRo7kETngD/VC7urHt0KbjG06M
	Sq/ypHpxI+5iA1iZ+eG3ichupKMHtW1BL/sVa2tOCilqpxsYXVPG48MyCGbaGxn3
	6QK1TQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn396j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 09:51:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso1046615a91.3
        for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 02:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787737908; x=1788342708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MJdLJ2/eq1GUPmY+HSV6dQETw+k5xD0t1z7GbxkxqVA=;
        b=McvUKaTzYRPHYuQAw9LKZ0XT94Nm6f+wDJ0Qb5bNgcLc3ATlP7k3HoJoHsuLqNEfzg
         129QJWAFRLinjDEbydABqIqitk1Tyjmud0m+OHCnlRIYiHr/aNvrOs1eKlegOfzckh6z
         5z6PpW6y9i1Yk6i53wbS7lWYjUvv5Sp3uR+AXhenDlWehqL3dI4+6MM75YfVduPm5K9J
         v97KFAVR7o0sfVaSPb8m94LEh23Am48jufgitksMe2cZXf/7cOQ4JDMW2ENrGwp02sZQ
         nOufFTRmH9QdhOJaFwGjozrDqAIVT9UN+TVdhajwZjfrpvEG2vY8P7m3BkGb8vFE5CNA
         p18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787737908; x=1788342708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MJdLJ2/eq1GUPmY+HSV6dQETw+k5xD0t1z7GbxkxqVA=;
        b=HzLP5cV/JDjuQvmHU0nfHmGq/VJOX66gHSYpJstqRccPiXbXyzliabfZStu8u7sH6r
         VZIADZx4CtfnPTQreTtuVOl6K8mGeypr9PtQtV2Us7gl1D2ZRMsJLZ5eQHEJzZWft/Y9
         LiVUkA1LHEnMXOzD4a0KhFtK+UnGNgWMzpE2kSaPGH5bVuoTYaBl73/G/Xu4SttlI0wX
         1SAjgor4AeTuA7IZ8oVZQAUaGbanbPDi0kmmsqOkvUtnsdwe/0CxD/LJVFCJP2mHxmp7
         EBIdMMZUCFuqi+VAFQTnYA3ZlqrHIymWjWJppMw9YdrVhaf4sT50QcXb/UtHFVqrktFT
         EqRw==
X-Forwarded-Encrypted: i=1; AHgh+RqUuM4RhPU8A2wSlovM3FHjUm51zMqYAPtlmaiY8kOdWF+7R+g7HfZn9CKuMGv5oUyC8w3/KgNbmzo=@vger.kernel.org
X-Gm-Message-State: AFuF++kpWbfM04eE/VyV157ppUO3qTTN/MZutstCsg8r9F3SRyL2H0Uj
	ijtI3tNMIrw4l9iVrICaRZZSUuBs6iXuKo/3zdBFwT4kl1KY7FD1vWEFPShmYNRAzrYbwNcme6Z
	OeR8EqyjcXWIZWz3d+QAIup8YUrAbiOnb5mw1J7c+lWz8xLu1Oc71yrlGEODj3PY=
X-Gm-Gg: AR+sD11lr7B9kqb7rYS6lmQhcL7NFCSFZLQty1YklBrZfjvk+bJy0eqpMKcfRprIIJh
	WV+UZehwem0EPdTdpeQ0mN0YoIx3pG+dSjqi7gda45TTPkMvdPXNy5M3mM20oqPQu4AntlEXJsm
	XmtkowIko+L4hDWHl2L5bBcD8aZdEUOWaXtFB2kk1iWWK//VtpSY6ipUG56B/CeWzNUczNrkvjP
	2Kfsjg7WrydTtO9iUJzoQ7tEf6Ca5dMKImyOQasgJYe82R1+IFoSEwb7iLg0eXT8+b005+eBtGl
	JX0EFJ/hxEQl8iACszUrohqYqgbk3vIgClHXk5U3f3v554FhVCGRRzVpEzmubwIdqW06M9jMAI3
	5FHui3+x5AzxiUIpEGx9zD8wvZcINFlhtPnU=
X-Received: by 2002:a17:90b:280a:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-3966d1e226bmr12261769a91.4.1787737907523;
        Wed, 26 Aug 2026 02:51:47 -0700 (PDT)
X-Received: by 2002:a17:90b:280a:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-3966d1e226bmr12261687a91.4.1787737907064;
        Wed, 26 Aug 2026 02:51:47 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d8d208csm7249738eec.23.2026.08.26.02.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 02:51:46 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:21:24 +0530
Subject: [PATCH v1 3/3] i2c: qcom-geni: Add bus recovery support for GPI
 DMA mode
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-i2c_bus_recovery-v1-3-203f0ec76f84@oss.qualcomm.com>
References: <20260826-i2c_bus_recovery-v1-0-203f0ec76f84@oss.qualcomm.com>
In-Reply-To: <20260826-i2c_bus_recovery-v1-0-203f0ec76f84@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787737892; l=6221;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=UvNJWScAUMw5qzE4pPixW9hPym/GBTWgCiAF/Xkhnys=;
 b=Oy/uVaMdZT6R3pIgTb5zdf3W7wGJgvZhj4spHa3A3mlzKTLXvrBYf8zBef92imcmhB057RuEi
 kLxtM4MOlwrD2QrZa3i+UGxBtPEhGVTjc1Jf3n3d3rSgTQkNn3cT5Yg
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-GUID: 5vmtRhBmVZ-lv0br5hlVpwunSKUWzvvz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4MSBTYWx0ZWRfXzwzHQq+npY+O
 ypMRiV07tNRisDANhDb5ygN8ncpDIO2DCMgI/2SOuB5UF3/dtEAhUCpZ+Dm89+cQOEH8PZR1+vs
 Ltf16dztpfGxrXQjglHPQ4GejibdgDM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4MSBTYWx0ZWRfXymLrMnxNmaZR
 r48drTsATNiri2KM4wXbt9MrfP/vePH9dxsx3GvaPj7OwpclYWutT4q8yVKefGuah+YmsXhZ0X1
 h1xsFQGFQvOoHTQJx1KhYVNoSYnOwS2ADwwWh6EVYnvTIoejv+YWhBZ1vwg537GBdcPr/JCoaCG
 VH1iuS6yxJyyJw+YvFu1zVB+59Jh9zpjTwnMbmjIXD6vB3XaSGP/zgKAT1LDS5s25WvjB6dKvnQ
 tqyOIOYb+B+cSCo7Ia7nJ5JalpRvCojRrRdbhZbRJHPoEfPPXcx6rZWMfZJrGPbgiTLspehbFU9
 4L53qXH6htzxbZ+mQKILcnfc58vmIaqlprWeIK6pkf5AlqDUKUzshv6LWEP8c7Vi7j3w1GIQEk8
 6wYGHtVwPiFv6K9fz+Rqsjo6QcyXN6elKSADyBv8/odM1I+rz432LQMDhr7uhzW1ekX/qWwNLn2
 /auFgdwrMTyeprReDQw==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8eb734 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=tOGb6KSYT5r5fpq5OAUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 5vmtRhBmVZ-lv0br5hlVpwunSKUWzvvz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260081

I2C transfers in GPI DMA mode can fail with -EIO when a target holds
SDA low, leaving the bus stuck and preventing subsequent transactions.
The GPI completion callback reports a NACK and a genuine bus error
alike as -EIO, and the existing recovery path switches the SE to FIFO
mode which is not valid in GPI DMA mode.

Add bus recovery support using the I2C_BUS_CLEAR and I2C_STOP_ON_BUS
opcodes issued via the GPI TX DMA channel. Guard the -EIO recovery
trigger with a SE_GENI_IOS RX_DATA_IN check to skip recovery when SDA
is already released. Extend the recovery callback to dispatch through
the GPI DMA path when gi2c->gpi_mode is set.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 104 +++++++++++++++++++++++++++++++------
 1 file changed, 88 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 9fa1a8ac400c..85cb1367958c 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -34,8 +34,6 @@
 #define I2C_READ		0x2
 #define I2C_WRITE_READ		0x3
 #define I2C_ADDR_ONLY		0x4
-#define I2C_BUS_CLEAR		0x6
-#define I2C_STOP_ON_BUS		0x7
 /* M_CMD params for I2C */
 #define PRE_CMD_DELAY		BIT(0)
 #define TIMESTAMP_BEFORE	BIT(1)
@@ -1003,6 +1001,70 @@ static int geni_i2c_fifo_bus_cmd(struct geni_i2c_dev *gi2c, u32 cmd)
 	return gi2c->err;
 }
 
+static int geni_i2c_gpi_bus_cmd(struct geni_i2c_dev *gi2c, enum i2c_op cmd)
+{
+	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
+	struct dma_async_tx_descriptor *desc;
+	struct gpi_i2c_config peripheral = {};
+	struct dma_slave_config config = {};
+	unsigned long time_left;
+	unsigned long flags;
+	dma_cookie_t cookie;
+
+	config.peripheral_config = &peripheral;
+	config.peripheral_size = sizeof(peripheral);
+
+	peripheral.set_config  = 1;
+	peripheral.pack_enable = I2C_PACK_TX | I2C_PACK_RX;
+	peripheral.cycle_count = itr->t_cycle_cnt;
+	peripheral.high_count  = itr->t_high_cnt;
+	peripheral.low_count   = itr->t_low_cnt;
+	peripheral.clk_div     = itr->clk_div;
+	peripheral.op          = cmd;
+
+	if (dmaengine_slave_config(gi2c->tx_c, &config)) {
+		dev_err(gi2c->se.dev, "dma config error for bus cmd %u\n", cmd);
+		return -EIO;
+	}
+
+	desc = dmaengine_prep_slave_single(gi2c->tx_c, 0, 0, DMA_MEM_TO_DEV,
+					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	if (!desc)
+		return -EIO;
+
+	desc->callback_result = i2c_gpi_cb_result;
+	desc->callback_param = gi2c;
+
+	cookie = dmaengine_submit(desc);
+	if (dma_submit_error(cookie))
+		return -EIO;
+
+	/*
+	 * cur and err are shared with geni_i2c_irq() and the GPI callback
+	 * i2c_gpi_cb_result(); both write err (the IRQ handler under
+	 * gi2c->lock). Reset them under the lock before issuing the transfer.
+	 */
+	spin_lock_irqsave(&gi2c->lock, flags);
+	gi2c->cur = NULL;
+	gi2c->err = 0;
+	spin_unlock_irqrestore(&gi2c->lock, flags);
+	reinit_completion(&gi2c->done);
+	dma_async_issue_pending(gi2c->tx_c);
+
+	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+	if (!time_left) {
+		dev_err(gi2c->se.dev, "timeout waiting for GPI bus cmd %u\n", cmd);
+		dmaengine_terminate_sync(gi2c->tx_c);
+		return -ETIMEDOUT;
+	}
+
+	/* ARB_LOST and BUS_PROTO may be expected during recovery; treat as success */
+	if (gi2c->err == -EAGAIN || gi2c->err == -EPROTO)
+		return 0;
+
+	return gi2c->err;
+}
+
 static int geni_i2c_recover_bus(struct i2c_adapter *adap)
 {
 	struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
@@ -1021,15 +1083,23 @@ static int geni_i2c_recover_bus(struct i2c_adapter *adap)
 		return 0;
 	}
 
-	ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR);
-	if (!ret)
-		ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_STOP_ON_BUS);
+	if (gi2c->gpi_mode) {
+		ret = geni_i2c_gpi_bus_cmd(gi2c, I2C_BUS_CLEAR);
+		if (ret)
+			dev_dbg(gi2c->se.dev, "GPI bus clear returned %d, issuing stop anyway\n",
+				ret);
+
+		ret = geni_i2c_gpi_bus_cmd(gi2c, I2C_STOP_ON_BUS);
+	} else {
+		ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR);
+		if (!ret)
+			ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_STOP_ON_BUS);
+	}
 
 	/*
-	 * Recovery succeeds only once the slave releases SDA, so the bus
-	 * state is the authority: RX_DATA_IN high means the bus is free,
-	 * while a clean opcode status with SDA still low is a failed
-	 * recovery.
+	 * Recovery succeeds when SDA is released. RX_DATA_IN high means the
+	 * bus is free; trust this over the opcode return path, which cannot
+	 * flag a benign recovery event in GPI mode.
 	 */
 	if (readl_relaxed(gi2c->se.base + SE_GENI_IOS) & RX_DATA_IN)
 		ret = 0;
@@ -1066,14 +1136,18 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 	else
 		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
 
-	if (!gi2c->gpi_mode &&
-	    (ret == -EPROTO || ret == -ETIMEDOUT || ret == -EAGAIN)) {
+	if (ret == -EPROTO || ret == -ETIMEDOUT || ret == -EAGAIN ||
+	    (gi2c->gpi_mode && ret == -EIO)) {
 		/*
 		 * Only attempt recovery if SDA is stuck low. -EPROTO and
 		 * -ETIMEDOUT indicate bus errors where the target may be
 		 * holding SDA low. ARB_LOST (-EAGAIN) on a single-controller
 		 * bus indicates a stuck target, not a real arbitration loss.
-		 * GPI DMA mode extends this trigger separately.
+		 * In GPI DMA mode the completion callback reports NACK,
+		 * BUS_PROTO and ARB_LOST alike as -EIO, so the SE_GENI_IOS
+		 * RX_DATA_IN check below is what distinguishes a genuinely
+		 * stuck bus from a benign NACK: a NACK leaves SDA released
+		 * (high) after the STOP, so recovery is skipped.
 		 */
 		if (!(readl_relaxed(gi2c->se.base + SE_GENI_IOS) & RX_DATA_IN)) {
 			int recovery_ret = i2c_recover_bus(adap);
@@ -1292,10 +1366,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	if (!gi2c->gpi_mode) {
-		gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
-		gi2c->adap.bus_recovery_info = &gi2c->rinfo;
-	}
+	gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
+	gi2c->adap.bus_recovery_info = &gi2c->rinfo;
 
 	ret = i2c_add_adapter(&gi2c->adap);
 	if (ret)

-- 
2.34.1

