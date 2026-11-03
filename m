Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696220;
	b=Z+/wmfjRRlS6SXMZWzSle48cusTYW0O3sU2+i9+JsW8Zjk2akKCP2QLHIwji0j5/NZl4
	 O6+UcDYeiOcvaNrSFizQUVhaunit8CBC96KDDvwDxBvDYpEkCXC0TS2q1SaibH0gUq2zl
	 EfO9GxqPj6DIEsYTsiNlvGhZNoHnjoPeQX2L4QJ/aF8hO065uFe/+zAUu96kloWIqDlXD
	 BEX07YfhUk+hgruenHun962c2NzdY4sYmOzbd9o+TX3NG0eE7xyvwb1ELr4ntbN+cRnl2
	 JJRg1+KerV/te3E5peJ4c933AfrQ/dqVTTT4xZIS7qLgahr5wSmB3gR9AXUvrs6KEoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696220;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dZ7RChXsBE4e2NQjMFi9+emvoDPdpsRGyTqHgg2FmS0=;
	b=pXd38gWZNgljZuzsLkWaH1OT0MTaii8eTLdQlAukEQDuK4ZigdXu89pzOwuBQnGaCRlG
	 B58THj7/3tj9ZvuPozzzamNCr5J+xfSx1CEKa03oSgWCzL1os1zMh2AU/pLehHNc7Fs/8
	 7RzDjKiVWxWt3uHA8NV+pslvCt1Ub3GsFiu9xIonsnaNSx/Gb9ogkJo/o9O1xkR1zH28z
	 w2oj6iV4ujQzvq7xePouNZvYh+mcAIQYme6EWq4ucj8tnOV1a2PkFZafSzjByCi8+yI6y
	 v9EubmWF7ftyhb27ry7iHlSd+g49B1i2w7BzCoehzMJyouclywvFS1yAkqdP+vqnWfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SXwmlaMz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=heQJWxrg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85D9606D819
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 08:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A85D9606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SXwmlaMz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=heQJWxrg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A352mfi2449132
	for <dmaengine@vger.kernel.org>; Tue, 3 Nov 2026 08:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dZ7RChXsBE4e2NQjMFi9+emvoDPdpsRGyTqHgg2FmS0=; b=SXwmlaMzvHwEqdoi
	ub910vcWjvuzmpW9MzUn6trvKdaNNE/c3sLQSROhNqe6IpTSOIKoi9pe4bWQNEkC
	6LS94Uoe/9Rquwj25P/rR7C9QiNe2q5P9myC08Cq9evvThMHD2ZAwhPtD5x+tuVf
	GZWNsAODvQ3M9bdlCvn+HUlYiPA8Hrqfe+7isn5PpLh/VDcfifBJ280prZRc797m
	j3ftLKfWlVAUCdPksy4gS4CfnV4S0jXiXepYT5BvInQ9ybYcaYvMJ5J32cKKFCWd
	rMBsoel/ojywATkMwxVfTlm2fG3o0uWFRIHLM0u4yAtG70blzN+ssS2OX0+drxzf
	ZzEToQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94crut2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 08:56:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0592d4539so5342197b3a.3
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 00:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793696218; x=1794301018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZ7RChXsBE4e2NQjMFi9+emvoDPdpsRGyTqHgg2FmS0=;
        b=heQJWxrgxOXsSqLWKpQS5RFL8bmCtLzmZVRiy2cpZRRxc7w9CGKeLCazDrvhinUNp2
         0Dvr88udSAd3kO3lq1SNt6jr0/dpd9K9toUm+HiyrOHFwo4haRByLCdyDX9LXhLB+77r
         tCGfzanbYatm+sW4EPvvFyn/bGPtPmVYahudHjw2E2AZI772/FZGAajp9N0w9qnhXhMV
         pi4wU8kZ/4vdJBSDJ8evZhFDDjlpelBqhD2KJFdhDsft+hvSRIxNW+4PJywpYaIWYK9o
         aeqdBOzkYHzSxzNV7nEkx8hmNNoawsyTjRxTbhgAiv1+P7OiXCiOCxN0Rsa/4RMh30eY
         px/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696218; x=1794301018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dZ7RChXsBE4e2NQjMFi9+emvoDPdpsRGyTqHgg2FmS0=;
        b=IQYOH2Tq9yuXqNUH72d1qXvdGzu2G++3nxsyye2EWSSfngGLFRxs/zpVZ/uWWJnRRM
         vD3JayaWPnOyAT80u9C7ziz4Q7g01htBkYXaY9dLq4V2zyVvCRN01GItKcYHhgwbmLSc
         yFifJ2WWycFh5/OOPYrRDDKtakO5wc0pRboOne1Ukv/XjId4RnFKUZKE+pgDQFU+ShNw
         50dnELvFIJBNoy4bnIvNh3xo7tPXIdSxiy1TOHYTTwJnxxBumY9voOPkWpMfoMn2lcDe
         S1BflyXfioVm9IPrV20IEoBWLrJGsNwYyTWQYtdgQR0ICXHpSLsxDmfJKGzFE8fBMu9x
         H7mA==
X-Forwarded-Encrypted: i=1; AKwUvBwTUW1hn8sR1W/sPwLHd5e52m/PkO6ya7KKvi+nA8AZd4VeMjpRPKtVFmOCmrrvNwG+Nb0GSPi3Y4g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8bsfycjWbWuJXJk+qsW9FVKyrHonEchfQxrWC7XKXZEB0RfMl
	flTdTFl0AAfeuEEmRPXOFHCNoiV27xDYF/o24WVlLmS8CyLWF3nWS7WSeIozpNsypYnFxP6US3B
	JPXxX+5c3t9wpLeVgju8DmioS9vrxtqrtAkmCkHMIvPqEa4uTzGDqPxkqMs9MFbk=
X-Gm-Gg: AYBFou004ioCcj86CM9QhF5auOu7tcpl4RTo3zjuxVcPIspjotxcbEGKFY61wwkyfp8
	CIifYdRKL9rQJLVoCvktYK7hnUfJPDi5o2W0OPu4bl1wYyKO7kbhq1OiajWi6i6tTV8UGkKPFyQ
	E/XH4VNve42l4Oqf8i4E2WGGa09fDN5Tpu1G4qFsINTNMuNmTBku+xr5AspWMFNtfqQcaPmRJaZ
	o8DLLoOIVX2b5HoYMeDEE2kr+rvSOno3XiLZdZBnIsVUNbFrxJSaaF+Hj7CCRvCcguGvZQhAfoR
	xnlxYaQoEtmzZp3tWDu+cVrzEbBEa5xemfwt6fHcyxeFY43D4S0bKNFnK7o7h4xQ+A9HRi0L8ZG
	Sm9T9SOWwmHYPcVNFyetZHwB2aKA8sfTSRNmShSL2vsbXkaI0TAeV42nykbGji+m0r48G7tKLwY
	X2fMD1kc4=
X-Received: by 2002:a05:6a00:b48:b0:8a0:1889:9685 with SMTP id d2e1a72fcca58-8a9be681f7emr10562565b3a.28.1793696217559;
        Tue, 03 Nov 2026 00:56:57 -0800 (PST)
X-Received: by 2002:a05:6a00:b48:b0:8a0:1889:9685 with SMTP id d2e1a72fcca58-8a9be681f7emr10562542b3a.28.1793696216891;
        Tue, 03 Nov 2026 00:56:56 -0800 (PST)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963cfe7sm3017471b3a.19.2026.11.03.00.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:56:56 -0800 (PST)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 14:26:41 +0530
Subject: [PATCH v4 2/3] i2c: qcom-geni: Add bus recovery support for FIFO
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
Message-Id: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-2-59b3ce96dc4b@oss.qualcomm.com>
References: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-0-59b3ce96dc4b@oss.qualcomm.com>
In-Reply-To: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-0-59b3ce96dc4b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793696204; l=6282;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=JXZdYXeEm5Hz86I39VFbba/pmrAnLFDlRH2tGQYtGfY=;
 b=+fK/A5cV3UJOyGvZlLXqUWWive3KXGBnZEiBM9abnRWbgZVNpzqprVKSP98e9lam4ECVmjvyH
 wIMKMAz20X5AVQqWiNcU06ZRP7yCQ+Ne50hy1iF0m8wI/I9D6HhIH8X
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae9a1da cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=c5Wb_hjG3JCSEPZH9V0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: fckFqZL1MnjswwCYKsIHU22vi1t0Pja7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNSBTYWx0ZWRfXzG6Q0igB3DfX
 ZwJ84YTVFHv9UCDaZMCiGt7BZYG+D0sSE1JQzY8UaTv5WvIO8Pew1fV1+3uNN++f6g3R8Yl5TJQ
 dPdsPitUFmYMp37ItIN4g5lCwo8+jLqjngTgIOsAN1lPL86D7AqMzUr+wE800PFjKq4RPq+UWwo
 zQsFqRfw3sVeAVdJK4Ow6z+C6dexc/aTTLFAH7HXUOGMe5WCBay4WtyKWOMgdzfRIkYumr6IuEf
 FHTDSRV6OeJ8xl4NKiif4uO5x+8A/y7Vy3qoNHOS78DOUStdHcpyYiqBf9txW6Klwau4HoH3m4L
 Ktc7609nY/pm9ws0nVSv6bqbzJfj4dOJOywbem+AaYIt+iWvuO1KV03VpQ+v0aS7Rx/d7Nq2M5t
 LC32zAV3kY+Wj9FyCUkBmG40nrPd9nRzYGjPXbyYP8Lqa9FlA9znst+V8uQLOdDE6OBqhVCDHc3
 o/oeKmlAn93ttLEvVpQ==
X-Proofpoint-GUID: fckFqZL1MnjswwCYKsIHU22vi1t0Pja7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNSBTYWx0ZWRfX//I6cry3h4wA
 Tg47sRsgdwTWOMYiC4IFt4V83HwnAvKHXMU0/nVuwTgWSamDfe+Og39DaMRj+hIHrYzqFlGM2f/
 blt/wxDv6cQuhVvLLS4RE2GbRQ2xBk4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030035

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

Use the adapter timeout for recovery commands. Configure the serial clock
and bus timing after runtime resume so direct calls to i2c_recover_bus()
do not depend on an earlier transfer having configured them.

This adds bus recovery support for FIFO mode only.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 124 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 123 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 60b6273f538c..b08353616adc 100644
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
 
@@ -1013,6 +1015,112 @@ static int geni_i2c_fifo_xfer(struct geni_i2c_dev *gi2c,
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
+	time_left = wait_for_completion_timeout(&gi2c->done, gi2c->adap.timeout);
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
+	ret = gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out);
+	if (ret) {
+		dev_err(gi2c->se.dev, "bus recovery failed, error setting clock rate: %d\n",
+			ret);
+		goto out_pm;
+	}
+
+	if (geni_i2c_bus_is_free(gi2c)) {
+		ret = 0;
+		goto out_pm;
+	}
+
+	/* Bus clear cannot recover a target holding SCL low. */
+	ios = readl_relaxed(gi2c->se.base + SE_GENI_IOS);
+	if (!(ios & IO2_DATA_IN)) {
+		ret = -EBUSY;
+		goto out_pm;
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
+	ret = geni_i2c_bus_is_free(gi2c) ? 0 : (ret ?: -EBUSY);
+
+out_pm:
+	pm_runtime_put_autosuspend(gi2c->se.dev);
+
+	return ret;
+}
+
 static int geni_i2c_xfer(struct i2c_adapter *adap,
 			 struct i2c_msg msgs[],
 			 int num)
@@ -1037,6 +1145,15 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
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
@@ -1239,6 +1356,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
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

