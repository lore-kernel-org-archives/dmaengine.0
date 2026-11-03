Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696224;
	b=vxSL6og5hG3ABmSWtjyDcwArCQ9WOKUjeY4+/DLz1N/k9qfxbhMk62PRem5+gFrF72ty
	 6RemNoJRK6IQ4zNCsAbmJDwYOwa2P0l/SiodTyvEq3oq6Jd1MlnzEcX1BxpLAcK51AYfj
	 Mj/ZBobFBkIBZkRSHTx63+bQpCPoq1iwvFJHBYqN8zjiYgCMa3O+qvtc2Nt5iuSkLDhEV
	 oCtGy5prWiAasQZF/fcxrMXoovFegIQX/MgqQ5EEgeDR1FR47WgGh7phqa3sCBAZZdMMn
	 xCJBR6W16U1QbOEclarje5sORDnMYNpZ8+6iOIHcrnJ4ln8r70gEp1Zq3lYlgvXdPmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696224;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hKcDKGT4XgxiM4YNoHtu46Rb42jfodjdkpL7uHJPAVk=;
	b=KmPO1BzL46ZquTcJZ3DUQxgCuA7zf+hc4wZ8vm0ox2EHErHibuLK949SN1bsDJBg1xky
	 kRM98ojmhcFvV6/xGEYWR55J0PV5vZRP6DWg0hynP7UuRm3tL72iCyQdx+aIY4rvlPXgB
	 kAxhTfqAFOQIr9zuQ77FJfhe/X0/JgWd2nxgUGiF9d4cAfxUNq3LUW2Oj/qVNslQoNNk8
	 +CUaG+qlcCLw+mZkI/R1GoKvte/7Lc4u/0WfPDc4ZPGV+cpgHlHqGgbd78orhlObQYrxT
	 56MyoqBB1372AgLOq202EHW9UM3HLocqgRJhHQ5bO6S5TInOsUNq/gR5cWcZfp30Krw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jevWMVrK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gUrggv8K;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D30606A33E
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 08:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2D30606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jevWMVrK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gUrggv8K
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38H8K01120773
	for <dmaengine@vger.kernel.org>; Tue, 3 Nov 2026 08:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKcDKGT4XgxiM4YNoHtu46Rb42jfodjdkpL7uHJPAVk=; b=jevWMVrK3YG/smJv
	PRUAAcZBTxEFbSHMEqlzpQfyqWh7W9MOGUyL34h8YvleqMDw4m27wU8oFGcN49O1
	aopGCyST9KWJ2ZI069FXC5nz3dPmsu4SFzI7nUQ2+Vw8tpn/T3Qa2Ub+i4t+gtAZ
	0U6cIVDKCUiUm/7fRS1MDE21bZsH4FiTD2fMx5TJPPmefEZW0sz0crq6XjdnddLq
	2VboE+dXJw+cqR7FJcfYWkG53FKziaeWC0r8qkKfCjbuJvtxS2yyKKkJeGGnXs04
	fE6+3L7Z3BbNY51C/AgNiWDjm1m5Ly0mdGsY7EnISYDD5nSB4hbNUbZ/vslX9Ns0
	+xXTUA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r2vnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 08:57:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so3153498b3a.2
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 00:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793696222; x=1794301022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hKcDKGT4XgxiM4YNoHtu46Rb42jfodjdkpL7uHJPAVk=;
        b=gUrggv8KH80pB7uIvNgERSJ5cnt8UvmBbTlDxvxCPLfGD1WB9xG4+exfGq1Qn6KTGD
         uBtRPg2GahDOQ/YcuBD16ow0RNvCG+autpN0veI1UbqNR3GauiclgvdfmwxREQxRuo9/
         EdVoUSHFg8mvTj8cF+IGOu8itfJiGZ/ckBoBK4445wEUsHQTs3beHN7Xi7EXG5z+PFNG
         AGlQTEXMuCPsaNaXs7bCLL5MORa5CaEMNC9KGCPOj+2X56V26hXgyarJGBX9GEvpbeHj
         jrh2DgP7+5zzoaNZ8ynKPOpdzgXFNS6I1Z/K0cQ43DviiPjDtSL9HgJxM7LikTdptR+Y
         cwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696222; x=1794301022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKcDKGT4XgxiM4YNoHtu46Rb42jfodjdkpL7uHJPAVk=;
        b=cVhmP2fxA5RZjbPsXmNWAQ/evvNZW2sUh1KPthC3NZNIc9cIIBKxBh71bRu7CIhzQ6
         7egFpRorj20YPwGlLKenwAVTUZ0FcWJNeHbYn8naA5XLPxTA4fbbmuBndKP+MVb3V0Qo
         Q9Qnrij/tSp4+pan3Htxey5oZuXiboBqnKgFd0OMaOtcp6TzLCC4BdH4IrZ0aNDjqYF3
         8XQ54dx/b/peazIthhCcusTO1m3p3fAtLQhZKoAEaQWtz+cJNdCWGYG47Va4SsKK/4hH
         MKwh4jnocqMZBGI8Xug7MvR3mr1lTqsHxDzwSRucWEEGG+3J+Gol4CaR/ZY6JsF5osDl
         BEPg==
X-Forwarded-Encrypted: i=1; AKwUvBxjk1NV4MTb+1HDSX+I9n2jGgVFgjLILIcMSlpcWam2Sppw/0ahfq0WG5uyj0TMSbWSNAGoGR5opQo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MEPo6ZOHhSvCuTm94658ZHXbdJhgtf0cmYCijXRJMWTsoHrdJ
	ZYMyTw5OJYIsL2/mQ2Vd1ryFKd9rBEoujkeg+DFyj63zYBjnWUbZKZa5oMBE5TrpstDNjfGOu9T
	H9ZbOs6Mi5t7Pzi99zmjleDxO9dqCBT2zp+aE2ElfXC5dydt6/ncj6jERPtADmqg=
X-Gm-Gg: AYBFou0zbZcV5DLF9w5TXW8Q4YS8kvpb0LNSM+6n4qpHLcNwns6AJFVs1jdaHkVGBoI
	mbo4n9RZuJOsNs48F6Z+AV+rRbZCE18Nn0n/Mm1ATHfyaXKsCtfvVUMkm7EJVZbiFCQj1CpGX4s
	l9uujXwEQ9V1JRqA5LqTTJv9DYQiLo3/mtP9MJYJHGoUpj+UDJfluWVJhV0nC4swoF1lcSvEW9o
	CFgPz0SZdJqpiUwDPYNpW3H/uDygYYXL7b8CAY/kYtU9m5WHFlU8lCWlw/RKnc1SOt+oOIPMCGW
	/S7kXPBP6vwiol9LXFcdXHLbBlwKcQRD0DdB+6gp9o2eo0fM2DQvH093M/8GeURRUQ7KJWSl3fZ
	rBPzhRsXNinOEBNP33ooAxNhO1mtJj0jdeXXv+KNW6uejbVLKdblb0W6NvAnDZGZqNKjWxELzNr
	nElMUqvn8=
X-Received: by 2002:a05:6a00:3a1b:b0:882:94ab:20ec with SMTP id d2e1a72fcca58-8a9be587fd4mr10038550b3a.25.1793696221642;
        Tue, 03 Nov 2026 00:57:01 -0800 (PST)
X-Received: by 2002:a05:6a00:3a1b:b0:882:94ab:20ec with SMTP id d2e1a72fcca58-8a9be587fd4mr10038532b3a.25.1793696221115;
        Tue, 03 Nov 2026 00:57:01 -0800 (PST)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963cfe7sm3017471b3a.19.2026.11.03.00.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:57:00 -0800 (PST)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 14:26:42 +0530
Subject: [PATCH v4 3/3] i2c: qcom-geni: Add bus recovery support for GPI
 DMA mode
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
Message-Id: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-3-59b3ce96dc4b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793696204; l=6139;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=OkAop6VQcxoEVUH+raJn/MdzrvaCmRT+U2bHKkK7yRU=;
 b=snezTj5q1ec0WOXdPcNQ4WHT818EUplJVlK3AsJrJ6LbsMxpdy6XLX9J2urMP34M/uXXZ9Oxm
 Rsttk3yeeA4B9UyRyx3T04yvTIXzGGEPIfD8ycvIcxVJV+SxbAlgyDb
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-ORIG-GUID: 8rc14DPHaFEARpFFoIdp4DSyjGj0haoo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNSBTYWx0ZWRfX6lkFMp99XrDt
 2KOLvt34MAblkF6kaqOydB565Yyf2ei2q2cQm9f9xWPcceLAOor5yTSyohHaazEk4wkpsKtZkod
 ExnOquod4Wp3gkpGN/4uEv/7f3hqbp3sdimVZwdQrnF/quwrkpftiose58cSO2W88+ZAZaUSP0k
 BbaADUrmWjvPuUaHaQvS933hHybhLGnSP+4Ed5j4X/PguJ57DlNwu46S2i0eJe2PNeYMy0AbZpW
 6s41oZ03wvPyq9JGs9tjvZKtABEW7NfENk03H3yAs/c5Y3JyuvIuDXJ0XbO5r5c/dKLy4HUVhuv
 WDTW866bho7UJSqjP5tJeLl70/0BRKS3YY/5z0001E8HYLv2cP4WYTw8kDxO5RHjHy3fQTetrY+
 hXAJDIG6zNSDQtD4yZaK33vKcZebMT+SXKzDstIImgax1R0h+U0GhJ18kNXaWn2i5tGEuwu5/kK
 cY8HrBFI9H0qEk8psyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNSBTYWx0ZWRfX/Mwv5ZQc3+vz
 AU81EAXO6ToogUr0aSVa1JabFdCRZbDl6QEaCxDiPwbmn4I/w+iNAzifmXXbdeOi0jhLxrBZRhs
 uLDHeouIun2mZwoELOE6GlFtXUACuPs=
X-Proofpoint-GUID: 8rc14DPHaFEARpFFoIdp4DSyjGj0haoo
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9a1de cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=dp2dQu5AD0A0ugWeZkcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030035

I2C transfers in GPI DMA mode can fail with -EIO when a target holds
SDA low, leaving the bus stuck and preventing subsequent transactions.
The GPI completion callback reports a NACK and a genuine bus error
alike as -EIO, and the existing recovery path switches the SE to FIFO
mode which is not valid in GPI DMA mode.

Add bus recovery support using the I2C_BUS_CLEAR and I2C_STOP_ON_BUS
opcodes issued via the GPI TX DMA channel. Guard the -EIO recovery
trigger with a SE_GENI_IOS I2C_BUS_FREE check to skip recovery when both
SDA and SCL are already released. Extend the recovery callback to dispatch
through the GPI DMA path when gi2c->gpi_mode is set.

Use the adapter timeout for GPI recovery commands, and preserve the DMA
configuration error code when GPI setup fails.

Stop recovery on a GPI command timeout and report DMA termination
failures. Do not issue another command or override the timeout with a
bus-idle result, since DMA cleanup may not have completed successfully.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 107 ++++++++++++++++++++++++++++++++-----
 1 file changed, 94 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index b08353616adc..d5d5d90544e8 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1065,13 +1065,82 @@ static bool geni_i2c_needs_bus_recovery(struct geni_i2c_dev *gi2c, int ret)
 	 * -EPROTO and -ETIMEDOUT indicate bus errors where the target may be
 	 * holding a bus line low. ARB_LOST (-EAGAIN) on a single-controller
 	 * bus indicates a stuck target, not a real arbitration loss.
-	 * GPI DMA mode extends this trigger separately.
+	 * In GPI DMA mode the completion callback reports NACK, BUS_PROTO and
+	 * ARB_LOST alike as -EIO, so the SE_GENI_IOS I2C_BUS_FREE check
+	 * distinguishes a genuinely stuck bus from a benign NACK. Recovery is
+	 * skipped when both SDA and SCL are released (high) after the STOP.
 	 */
-	return !gi2c->gpi_mode &&
-	       (ret == -EPROTO || ret == -ETIMEDOUT || ret == -EAGAIN) &&
+	return (ret == -EPROTO || ret == -ETIMEDOUT || ret == -EAGAIN ||
+		(gi2c->gpi_mode && ret == -EIO)) &&
 	       !geni_i2c_bus_is_free(gi2c);
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
+	int ret;
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
+	ret = dmaengine_slave_config(gi2c->tx_c, &config);
+	if (ret) {
+		dev_err(gi2c->se.dev, "dma config error %d for bus cmd %u\n", ret, cmd);
+		return ret;
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
+	reinit_completion(&gi2c->done);
+	cookie = dmaengine_submit(desc);
+	ret = dma_submit_error(cookie);
+	if (ret)
+		return ret;
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
+	dma_async_issue_pending(gi2c->tx_c);
+
+	time_left = wait_for_completion_timeout(&gi2c->done, gi2c->adap.timeout);
+	if (!time_left) {
+		dev_err(gi2c->se.dev, "timeout waiting for GPI bus cmd %u\n", cmd);
+		ret = dmaengine_terminate_sync(gi2c->tx_c);
+		if (ret)
+			dev_err(gi2c->se.dev, "DMA termination failed for bus cmd %u: %d\n",
+				cmd, ret);
+		return -ETIMEDOUT;
+	}
+
+	return gi2c->err;
+}
+
 static int geni_i2c_recover_bus(struct i2c_adapter *adap)
 {
 	struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
@@ -1104,14 +1173,28 @@ static int geni_i2c_recover_bus(struct i2c_adapter *adap)
 		goto out_pm;
 	}
 
-	ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR);
-	if (!ret)
-		ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_STOP_ON_BUS);
+	if (gi2c->gpi_mode) {
+		ret = geni_i2c_gpi_bus_cmd(gi2c, I2C_BUS_CLEAR);
+		/* Do not issue more commands after a timeout: DMA cleanup may have failed. */
+		if (ret == -ETIMEDOUT)
+			goto out_pm;
+		if (ret)
+			dev_dbg(gi2c->se.dev, "GPI bus clear returned %d, issuing stop anyway\n",
+				ret);
+
+		ret = geni_i2c_gpi_bus_cmd(gi2c, I2C_STOP_ON_BUS);
+		if (ret == -ETIMEDOUT)
+			goto out_pm;
+	} else {
+		ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR);
+		if (!ret)
+			ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_STOP_ON_BUS);
+	}
 
 	/*
-	 * Recovery succeeds only once both bus lines are released. The bus
-	 * state is the authority, while a clean opcode status with either
-	 * line low is a failed recovery.
+	 * Recovery succeeds when both bus lines are released. Trust the bus
+	 * state over the opcode return path, which cannot flag a benign
+	 * recovery event in GPI mode.
 	 */
 	ret = geni_i2c_bus_is_free(gi2c) ? 0 : (ret ?: -EBUSY);
 
@@ -1356,10 +1439,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	if (!gi2c->gpi_mode) {
-		gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
-		gi2c->adap.bus_recovery_info = &gi2c->rinfo;
-	}
+	gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
+	gi2c->adap.bus_recovery_info = &gi2c->rinfo;
 
 	ret = i2c_add_adapter(&gi2c->adap);
 	if (ret) {

-- 
2.34.1

