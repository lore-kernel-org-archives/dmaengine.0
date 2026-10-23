Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756750;
	b=AxjMMg+tIwV0KRg0o6tU+CerYnkE774sBdIPSEj6YMD9avU1douD6APxI8gGcOE82z9l
	 Pm4T7+4h0hlyEcaLcsSP4Mb8jPaR1Gf5CuedDPrg0JXGySFrQfUIfLk83hKeqbYSitj5s
	 ehDUhDYSbG9F+DGXGsANTfNVYW8KZSHxfkT3UyGZAl6WDCWn9C+lbucCWunSpg4WdfGZX
	 rw/J4rI+h9Qo+jzr/Y954/u5y7+RoKl8i783JTZnfikc85ufVGaqM3hhVKFy/HTfwGO0Q
	 Roerr9jBd14mITsZxVtxcNMd/NlWXOsLyyrZ6sIK/tCWi9m/Y7c1MMDLp1CaATh7qJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756750;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HihkSyB477snEx2qkjOAH7gF9pw6KdJj1K6P0VttmfQ=;
	b=egj2wypVbm5PxLf5P8nAT//w4TpK44cMIYR5kTA81LAFuWSFzEyCPYRVOpXVTl/6zbpn
	 QpJthDSfX5scg0LjEPc40PAl3QmjLdN2P8bL/vxZYP4gHG+kq2BPm//KRGJzuzQ9tt4mv
	 YD9+kJ2SWYOrUQfQZ1kp2kWft4vUSVdGDvOGzt4gPYYYOY+f9MBiYLuVDwQyu3Rc8aQvi
	 eFe8bOqcp/ad5KLMCWpO+RET2/wJ3molziPhDRa5Y6Fau7N1y/+E6TIlyRQ+ep9hsaO3s
	 GlYuIgJEhuedCSNkiJjqb/zjWY/AFfGuD4C987f3lmbuAfBkz9QoQ8XjEFdGBItK/4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2xnCnmY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LxlOKORN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3753C606A320
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 11:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3753C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2xnCnmY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LxlOKORN
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAToV3560866
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 11:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HihkSyB477snEx2qkjOAH7gF9pw6KdJj1K6P0VttmfQ=; b=f2xnCnmYqrv7Vo6P
	hye01ZDbKV3YIjqnNXj7RYcKG1z5iln+NNIzYFdebVX/cQ+M5rAgCE3XrUDYR7bz
	sPRzX0Jt9kl1GssBZNX5CNxIKYv0eQF0OjoyXFWEwQf7GdQikPKkzdJBsyeEJo+b
	V5Y9ylZmy7hpzkQvGjkIWLXDWsMi8fWeyc+Se+1nP/00x4bTX1UqQCSvNgRsdTB2
	qZmWr5PbRVY7Y4oj76q6s8OHmj+GQIM+kQG4VarjaPCvKoaJlOmth2QU04ovqNHy
	vXNU9AgIGSRq+UAzeiDSN8HU30jpTHIvtLLH9/aOJC9JRU8sLfGi8covIgsWuwvM
	xyFU1Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmpbh7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 11:59:09 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3552883bd19so2635044eec.1
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 04:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792756749; x=1793361549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HihkSyB477snEx2qkjOAH7gF9pw6KdJj1K6P0VttmfQ=;
        b=LxlOKORNS4DIzhtg3vF71wL6K42RO/Nyim6reKytsZGiqsdhRKRKAEECAN/tBNHAFy
         2u/DaHGLRPm21cwk3WE91TyOLxJuCdZYIfBrlKksSlcoSmgrpBiyGGe77zc+rU5968wo
         f4f5cDhKY3+RaCnqhMARG8HuZ1jrKjhrxpGULkqurWWRu1BXp14+8EArKudANLVTCWaj
         o3q3J1w/6SrOzJgoy/1AoI9rGxU81XGsYVoZDTK/xQgY4Hh9477q5f6HaFGAFX8wpDCr
         hkLVUBlj0IzNvvBruSb5EBLGRq2oBa9K6BUdzV5ATDHha/AnXyRx9wkZ8ZzusYPRhsU4
         FGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756749; x=1793361549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HihkSyB477snEx2qkjOAH7gF9pw6KdJj1K6P0VttmfQ=;
        b=cMd2SaOLhmIaI44YVVk5HdPClt3vTd+QSEEx7DcYlEGBGHxiCiT1nJSzxEnPpSbIPz
         y/JaH8mHwaZ23pBXX8mBwm6WRCp5odWjFLriNnr0qldQBQOEQbjeoIIYZxo7kegbiNTz
         2GROOP+9IizO4oYyKXXYvzfYNNwLGlrX/6e2s+bWQzEnJZsNe4ET6M/InEnexstwNu1U
         fQYKFtsl/yDEzbfDDRYZbu9jfa2Uf48G0bDStBLarNE8PvtClXScfbJ4Yzd8oTwVOH7a
         MfbfThV9jRpXqmkQF2BcjjEKW4NVkAAsJ5RU7Q5EMRd0tTDLwSWJp4PsuO00tz1udL5d
         wzmw==
X-Forwarded-Encrypted: i=1; AKwUvBxZ91jHMcmlJK2H2fd/3BdIQ72QdGusl46WZr+vuPFkrb3QCymAkXqP/0Rfcv8sB8s1PPFVyA9badw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLj6F5LABaBldkyRmES/wqDoAzdE+0Cz4yRkzy5QrZgA1cbqP6W
	AgTYlbOz/x9FhjllGGshUrduYw+kbsZ2VVNElRhGKx7K1G2QhMKyBejWTsl389lhN+BMGnFjSw5
	B6Q0luGs4MOSmexDdsEqyoT/QgFZ3xRf3cFEL8GuOa9HKz8ODJCSKgCOlO6gxsHQ=
X-Gm-Gg: AYBFou1JQ5r+bpdn8VIAhNnzn9Reb00yMhB7gntEW1p97hyzW+N8Q3OUUJBd3FXjmMb
	Sub/LEu9d/BgLGJBG1h5hP/d5QTvoIdookHy7Z1zHBK0v+9tseMFg7GCls9qhGHvHy16y3R3SK0
	e0H/gyDUCfBe1JGmVfriRPdTI4fJDD9nmRxqDRpasP34553AOhGTDJ9fW4eEgAMZLov8LFwDABg
	j23FMt1Ci1ZF4KcWpfQLxlxVnpJaGzvX2sQqvJ90stJ8DFAifQ0tZYRqSvU4scYJaIakb90ArAH
	/5qxf+mx3UAjVzY3RsAKQYOZne5m3Rct2NtMrC/N4gvqeS0tGoFV34A59uDtoDL7aqKCpY5VTG6
	NI/S8P6TA3BdLU+kS8++8dbC3zwEtqaYPCQ==
X-Received: by 2002:a05:693c:894b:20b0:369:9eea:cd25 with SMTP id 5a478bee46e88-369d971dbcamr2958362eec.7.1792756748421;
        Fri, 23 Oct 2026 04:59:08 -0700 (PDT)
X-Received: by 2002:a05:693c:894b:20b0:369:9eea:cd25 with SMTP id 5a478bee46e88-369d971dbcamr2958316eec.7.1792756747751;
        Fri, 23 Oct 2026 04:59:07 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d5ea64sm8786134eec.5.2026.10.23.04.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:59:07 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:27:58 +0530
Subject: [PATCH v2 2/3] i2c: qcom-geni: Add bus recovery support for FIFO
 mode
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
Message-Id: <20261023-20260826_aniket_randive_oss_qualcomm_com-v2-2-93572b453d6f@oss.qualcomm.com>
References: <20261023-20260826_aniket_randive_oss_qualcomm_com-v2-0-93572b453d6f@oss.qualcomm.com>
In-Reply-To: <20261023-20260826_aniket_randive_oss_qualcomm_com-v2-0-93572b453d6f@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792756735; l=5941;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=rQC++aix1hZIuBxUGJVRZIONS5Ev4yVut66D1SWXROo=;
 b=KLxNM4ecIsw20dHO7vzuFUlgkcJKLn++hCLHgu0KgyxNZXrU4RVhfOBJrH+bCaqQwi6paJ3ZE
 HSCDxdlQf8SC0pNOk8ovQu4RMXPyXKfOFPgJDRU3LCvGvTlKCHd9AJ4
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX1xZ3W7bAmZLS
 0Q7MF1WOUl9iyv26K7SYUhPggp1EeNNjAeSslLacnEjQH19JCIAVeCJ67EyUfAUWe43/9WhZ4Hk
 rkL9PqQs7vQcIt3vo5sRWCQZEprlkYQ=
X-Proofpoint-GUID: oUBXwdwTGHgUdWKEpu48Uow2YDS0yIO8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX0QQAY57M+BVF
 Ab6ZXg9R4MkjgIzAAUR5FnazkcmpQ9m086pSWZqaBSvlgwYXj7x4Lv8CQz3sbmbfjFXVFQ5xWDt
 h1rSzCHeq92YxDh4DeubSbUwjBb6iva7v++pGm3D4cLD6qawrrFcYDkn3U/Kl3qkbD6YERo5o8/
 KjP3V0X1Ir/Tf52VTAh1FPglCc5CDyb14qnN6CItHRb3wuiFxrUvfxhpBd8yzPlxKmQzPORMaxn
 9ny/EW8ooARrel/qCQO+dGj0KvLNqjkJ/JSW0C45tyX/EAS5UNFIfD7sVV8aHYsYm3nucVFppLv
 py84hN4PRIbDSWDCs28MeYLcyrQqM35fPAvpc2OZNQqkTmhCGVxI3SqCNJU8wBxbZsmXjM+VIi5
 Y2fpf6c8sK6pdtpZnPjtYSz9ILwU3QRtfEKPXmKRLeNbGDLrjYQultukgAmLSfJOGnKYCtCcK1B
 EMbeNx+qLL2oXVF3zkA==
X-Proofpoint-ORIG-GUID: oUBXwdwTGHgUdWKEpu48Uow2YDS0yIO8
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adb4c0d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ah_FiUNgRufG_lHBlQAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230046

I2C transfers in FIFO mode can fail with -EPROTO, -ETIMEDOUT or
-EAGAIN when a target holds SDA low, leaving the bus stuck and
preventing subsequent transactions.

Add bus recovery support using the I2C_BUS_CLEAR and I2C_STOP_ON_BUS
hardware opcodes to restore the bus to an idle state. Check the SDA
line state through SE_GENI_IOS.RX_DATA_IN and skip recovery when the
bus is already free. Trigger recovery automatically from
geni_i2c_xfer() on -EPROTO, -ETIMEDOUT and -EAGAIN (arbitration-lost)
errors, and register the recovery callback through i2c_bus_recovery_info
to allow recovery via i2c_recover_bus().

This adds bus recovery support for FIFO mode only.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 119 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 118 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 60b6273f538c..065d7240de04 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -34,6 +34,7 @@
 #define I2C_READ		0x2
 #define I2C_WRITE_READ		0x3
 #define I2C_ADDR_ONLY		0x4
+#define I2C_BUS_FREE		(RX_DATA_IN | IO2_DATA_IN)
 /* M_CMD params for I2C */
 #define PRE_CMD_DELAY		BIT(0)
 #define TIMESTAMP_BEFORE	BIT(1)
@@ -145,6 +146,7 @@ struct geni_i2c_dev {
 	u32 num_msgs;
 	struct geni_i2c_gpi_multi_desc_xfer i2c_multi_desc_config;
 	const struct geni_i2c_desc *dev_data;
+	struct i2c_bus_recovery_info rinfo;
 };
 
 struct geni_i2c_err_log {
@@ -316,7 +318,7 @@ static void geni_i2c_check_addr_data_nack(struct geni_i2c_dev *gi2c)
 {
 	if (!readl_relaxed(gi2c->se.base + SE_GENI_M_GP_LENGTH))
 		geni_i2c_err(gi2c, ADDR_NACK);
-	else if (!(gi2c->cur->flags & I2C_M_RD))
+	else if (gi2c->cur && !(gi2c->cur->flags & I2C_M_RD))
 		geni_i2c_err(gi2c, DATA_NACK);
 }
 
@@ -1013,6 +1015,107 @@ static int geni_i2c_fifo_xfer(struct geni_i2c_dev *gi2c,
 	return num;
 }
 
+static int geni_i2c_fifo_bus_cmd(struct geni_i2c_dev *gi2c, u32 cmd)
+{
+	unsigned long time_left;
+	unsigned long flags;
+
+	/*
+	 * Clear cur so the IRQ handler does not attempt FIFO watermark
+	 * filling or draining while the recovery opcode is in flight.
+	 * cur and err are shared with geni_i2c_irq(), which reads cur and
+	 * writes err under gi2c->lock, so take the lock around this reset.
+	 */
+	spin_lock_irqsave(&gi2c->lock, flags);
+	gi2c->cur = NULL;
+	gi2c->err = 0;
+	spin_unlock_irqrestore(&gi2c->lock, flags);
+	geni_se_select_mode(&gi2c->se, GENI_SE_FIFO);
+	reinit_completion(&gi2c->done);
+
+	geni_se_setup_m_cmd(&gi2c->se, cmd, 0);
+	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+	if (!time_left) {
+		dev_err(gi2c->se.dev, "timeout waiting for bus cmd %u\n", cmd);
+		geni_i2c_abort_xfer(gi2c);
+
+		return -ETIMEDOUT;
+	}
+
+	/*
+	 * ARB_LOST and BUS_PROTO interrupts may be reported while the bus
+	 * transitions from stuck to idle during the recovery sequence.
+	 * The opcode completed successfully so treat these as success.
+	 */
+	if (gi2c->err == -EAGAIN || gi2c->err == -EPROTO)
+		return 0;
+
+	return gi2c->err;
+}
+
+static bool geni_i2c_bus_is_free(struct geni_i2c_dev *gi2c)
+{
+	return (readl_relaxed(gi2c->se.base + SE_GENI_IOS) & I2C_BUS_FREE) ==
+	       I2C_BUS_FREE;
+}
+
+static bool geni_i2c_needs_bus_recovery(struct geni_i2c_dev *gi2c, int ret)
+{
+	/*
+	 * -EPROTO and -ETIMEDOUT indicate bus errors where the target may be
+	 * holding a bus line low. ARB_LOST (-EAGAIN) on a single-controller
+	 * bus indicates a stuck target, not a real arbitration loss.
+	 * GPI DMA mode extends this trigger separately.
+	 */
+	return !gi2c->gpi_mode &&
+	       (ret == -EPROTO || ret == -ETIMEDOUT || ret == -EAGAIN) &&
+	       !geni_i2c_bus_is_free(gi2c);
+}
+
+static int geni_i2c_recover_bus(struct i2c_adapter *adap)
+{
+	struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
+	u32 ios;
+	int ret;
+
+	ret = pm_runtime_get_sync(gi2c->se.dev);
+	if (ret < 0) {
+		dev_err(gi2c->se.dev, "bus recovery failed, error turning SE resources:%d\n", ret);
+		pm_runtime_put_noidle(gi2c->se.dev);
+		return ret;
+	}
+
+	if (geni_i2c_bus_is_free(gi2c)) {
+		pm_runtime_put_autosuspend(gi2c->se.dev);
+		return 0;
+	}
+
+	/* Bus clear cannot recover a target holding SCL low. */
+	ios = readl_relaxed(gi2c->se.base + SE_GENI_IOS);
+	if (!(ios & IO2_DATA_IN)) {
+		pm_runtime_put_autosuspend(gi2c->se.dev);
+		return -EBUSY;
+	}
+
+	ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR);
+	if (!ret)
+		ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_STOP_ON_BUS);
+
+	/*
+	 * Recovery succeeds only once both bus lines are released. The bus
+	 * state is the authority, while a clean opcode status with either
+	 * line low is a failed recovery.
+	 */
+	if (geni_i2c_bus_is_free(gi2c))
+		ret = 0;
+	else if (!ret)
+		ret = -EBUSY;
+
+	pm_runtime_put_autosuspend(gi2c->se.dev);
+
+	return ret;
+}
+
 static int geni_i2c_xfer(struct i2c_adapter *adap,
 			 struct i2c_msg msgs[],
 			 int num)
@@ -1037,6 +1140,15 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 	else
 		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
 
+	if (geni_i2c_needs_bus_recovery(gi2c, ret)) {
+		int recovery_ret = i2c_recover_bus(adap);
+
+		if (recovery_ret)
+			dev_err(gi2c->se.dev,
+				"bus recovery failed: %d (xfer error: %d)\n",
+				recovery_ret, ret);
+	}
+
 out_pm:
 	pm_runtime_put_autosuspend(gi2c->se.dev);
 	gi2c->cur = NULL;
@@ -1239,6 +1351,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	if (!gi2c->gpi_mode) {
+		gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
+		gi2c->adap.bus_recovery_info = &gi2c->rinfo;
+	}
+
 	ret = i2c_add_adapter(&gi2c->adap);
 	if (ret) {
 		release_gpi_dma(gi2c);

-- 
2.34.1

