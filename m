Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3CF23EAA6
	for <dmaengine@vger.kernel.org>; Mon, 24 Aug 2026 11:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787570784; cv=none; b=Zwe1HYaKC4NDkjjrl9THXEdLO1rQz+N+JIRBiG6VorbZxKl8tuE2URdGgaoptWPDbqQCF8ndPEEOiGeW8pgs2u0LO1uGtX9QuQHpkHWXBm+nT9BTFHhMc8Ktj5qUyIyyFO/y4nF3Ovy5C5AoUYMcag8XIx0262W1PsvjHeyunUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787570784; c=relaxed/simple;
	bh=wyZrDrT94kleNnxYe3zfwal6cWHvi+0Xa2JF7iNHiCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PEdQNucsLEx9r5mmLkMlZuv49WTSRJLGeIRg0qhyegZv03zClnYKTdMpxYlnVkMR2zTg54yiM9moSwJjMI/C1/xu28IQUAuyTtyVC/nL2jGuzLTQtNbURyJyepzYTwc3Ti1qijBp37EEbxplZrycbfgq4RSMC/P8E9TtF5wuY4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hwo1DxCV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jcneYvbS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hwo1DxCV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jcneYvbS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMYCv1673198
	for <dmaengine@vger.kernel.org>; Mon, 24 Aug 2026 11:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SuDJmzv9VCByMHTq2q9HTLWJYFjDIUBgT1sx9HrKQ04=; b=Hwo1DxCVLBL2oFSP
	D1cGUJkwkNKVBzV/IQf5MxsbyHkdsmzdpmX3p35HKpGfXFMDetmk0EFQB9oeWiWz
	KDmVIsHfUg3ZoprGwo9QQeB5efO33c9UyE1IHegPR8lxgfQqLaleOaqTny464IGo
	mn+UuWLm5ocHHE1TO/HDUBijPzPLWK1NgfHZbXHlRZ3YqJq2L7UqMa2fdxxW2CDD
	4mwljV3FC7QS1Rnxz08Iwu+zJHGaWjeQOzPQfiROmHH4rE59G8wpzn18yPwhH6V4
	ZXj1FmvJO2/dhxueKUIKBJaxZnCRDp9k3H35bJteQ1Li7Vfq9QJfJuJT+aUpNhHb
	89J6sQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf0x8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 24 Aug 2026 11:26:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so7316252a91.1
        for <dmaengine@vger.kernel.org>; Mon, 24 Aug 2026 04:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787570780; x=1788175580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SuDJmzv9VCByMHTq2q9HTLWJYFjDIUBgT1sx9HrKQ04=;
        b=jcneYvbSKwWXwW+Dc2QrZGmvY12CyQcQF+m5YsU7hNcxLOeOz6ErYX1EfedpDYRuqM
         +11e6iXRVaJaT/h/frupGumxX1e2j6wH+4owRXxUgcXaKvFjLBUTEzCHcjHzCLjhaVU8
         YyQJ7LOW4f6CWXE05drdJOaxl+BzagQCNxqlLM7dLLGCOpxgBDDeRd1qhoA4xu7qwyfg
         SpHjLyJDopaeX/Jm5p89Xcq44yqmVoirHp0LA9+IsXFK2nHBxqbpa9+Cvgx8Fv7+FQX9
         fHyG2F2QulAmngEXubrzR/bN27M5qICQwIk6gxl0ojYXN0iRaDlKd7AAkr5rRt5g4Y+k
         +yUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787570780; x=1788175580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SuDJmzv9VCByMHTq2q9HTLWJYFjDIUBgT1sx9HrKQ04=;
        b=e54+IluRek8i1LI1rxvwiESf8qbxzwbA+NK11V+LOwxUCa7zYZgROY+IID3ZJKhO0K
         mz04vu3dAMvTc1Y0Xu8rlmf+aQb8kuljgdom3eXMGlxcE6AWDA8MmcOlwMguKdZmLxxQ
         tWUhgm8rfujeOTNwZAVdudN+yba+j2YmyP2BtsuBYjLEHWOXGjfnxTlxXmiXJ1R2pKoF
         KrqBhviJoHcRhh4Iq34kQh+uhxwch5eABYAMyuiz9FdvhIoWGoRUcxJNgQqjuD9MxGrz
         V5XobJbIWV81rVb56WCz3tKvfBULTEaOt6a4vpPnZJorQ0rGM4ern3XD6gsYgMaAxBeU
         v2aA==
X-Forwarded-Encrypted: i=1; AHgh+Rr2n7yOokP11dpex9p5IhpjSHDLO+dCr3Lu5WEiAsPhfhEyYd94JWn99bkVwn/Ep/1bfTpTq4zp4oo=@vger.kernel.org
X-Gm-Message-State: AFuF++lE74T96WVf6fSL3PO4UCHDm+l7t4dGUi/nDoo3YKFNSBJV9a6J
	2/uYSxFlyK/NhzaobTYZVttiVM7C0YwYSFJxZ4VDkX4nPklIokT/g5MCWl8oKlXvG1fTqGudyJH
	Gl5a2LvAQ7I5x8romD4nSpfxnjF4MwZU7/DhtHbihwsg7p383Ptk4peVXCEerC0c=
X-Gm-Gg: AR+sD10KnLIjAwjv/jLTh/kQbE9GBsSMDUn5NJ/Q7eG4hD6dvVO+Ri91HxRKBiASEcC
	g39NYqVpu9E9cDXz6/y36W5Z9etHxkANgJ2a9MLP0gu/wHGso9aZQx0zWrC0VVDZwF/mtJ43y9e
	42odYwZbbA2Nw+JPdHAxLb64TBIO9XW+zkk/t2l66lDM2LZK/KEyvqKsAoSZPqHhkd9XF4Ydx2A
	mYNF+nhK9hhbhj8JAUKEOeiD/GcvqWvjOPyx+1vlrW4ofZDmLKZNLrtQjMAZemCBXMZUZwaOugM
	DyktmDTBFWJO8ulQ5/w0Qr68+vEYl1x9vcwG+QduCeMyx3Sgx3pdau3eehTYrdDP06yKROEJmzs
	zULVCunY8ZCGkHGjNFaHqelXjQB2opVuP8CI=
X-Received: by 2002:a17:90b:580d:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-395df24e757mr34314773a91.9.1787570780133;
        Mon, 24 Aug 2026 04:26:20 -0700 (PDT)
X-Received: by 2002:a17:90b:580d:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-395df24e757mr34314069a91.9.1787570777103;
        Mon, 24 Aug 2026 04:26:17 -0700 (PDT)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4a1597csm9767137a91.13.2026.08.24.04.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:26:16 -0700 (PDT)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:55:48 +0530
Subject: [PATCH 1/2] dmaengine: qcom-gpi: Add I2C High-Speed mode
 configuration support
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-i2c-hs-v1-1-8dd94e5c6113@oss.qualcomm.com>
References: <20260824-i2c-hs-v1-0-8dd94e5c6113@oss.qualcomm.com>
In-Reply-To: <20260824-i2c-hs-v1-0-8dd94e5c6113@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787570769; l=6680;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=wyZrDrT94kleNnxYe3zfwal6cWHvi+0Xa2JF7iNHiCE=;
 b=EuI+Sk/+uPt6HFuMFlCzcMt3ddMe6yPUfrqw67ON+f5gUHInF6WXskUt1hyKAYAeWS6QQaTH4
 VFMcKpmn+25DUNmGmBM9Z6LnjFIQcDItjXN1fgfC9mm1w6nMDoddGt1
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NSBTYWx0ZWRfXw2JoHzPYPbQL
 k2ZMQGKI+gdj07X5jins4sDfYXQ/ZeZNS5XLhu7LMiKPazAehNfqbELZ7TFdsTEZavb03aAffRl
 05xflnA6PCicppLG5/xlk+HHF+n3iXw=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c2a5d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=8yvkWvxPp_QYhSqoyPwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: bp19ukpCyvMw1Rxfl6JIXiZNtkuyoOBI
X-Proofpoint-GUID: bp19ukpCyvMw1Rxfl6JIXiZNtkuyoOBI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NSBTYWx0ZWRfX7OjnYBYgIq77
 hl6Y8IwUGrO69kaEL0zsRqZQPPoMRjwTCV8a/65ud8CIEVUgtUsNJAKOoetxjQRGeCCZRh3LzHW
 MvQ4MzbmK6U+mwe4VdC/e4XropV6XCTut1CdIXFyF5r7t0F8gvT5sJaEPgbI2itWe0ZJ3G7BbOR
 UjXmUJ5t1sBfx7oUAYTgDNS72Kawj83R2lbEDOf2le7Dguxo2U28mG6b6muMf5kRiLkAxe86LCb
 dqi4DxpXS9zZWwfqVVjLhGwUDT5QL78UqGt0lI+91NhdAdltsU0iNp2jCSPdkiG6gXhFAXEic2u
 z6jBHLLLBPWgWlr7GY3D1J1ilP34O9ZQrUSTm7qjMIGSvRxfVwUfSsjv3vS9TdxNz8fK5/+ENUy
 E6EkKeC66P75BA0D4fy9N8JBnzZQm3x1jHm+mXA7ShmTWCNnWQqLRMQxjTAvn0HQ8JVavsQ/4Oa
 icwHk7G1rtEqHzmU3bQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240095

Add support in the Qualcomm GPI (Generic Packet Interface) DMA engine
to configure I2C High-Speed (HS) mode transfers.

Introduce support for CONFIG1 Transfer Ring Element (TRE) to convey
HS-specific timing parameters to the hardware. Define a new
gpi_i2c_config1 structure containing tcycle_cnt and tlow_cnt fields,
with default values of 28 and 38 respectively, as required for 3.4 MHz
HS mode operation.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 drivers/dma/qcom/gpi.c           | 54 +++++++++++++++++++++++++++++++++++-----
 include/linux/dma/qcom-gpi-dma.h | 28 ++++++++++++++++++++-
 2 files changed, 75 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index a5055a6273af..52a7800ed4f5 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -21,6 +21,7 @@
 #define TRE_TYPE_IMMEDIATE_DMA	0x11
 #define TRE_TYPE_GO		0x20
 #define TRE_TYPE_CONFIG0	0x22
+#define TRE_TYPE_CONFIG1	0x23
 
 /* TRE flags */
 #define TRE_FLAGS_CHAIN		BIT(0)
@@ -58,9 +59,14 @@
 #define TRE_I2C_C0_TX_PACK	BIT(24)
 #define TRE_I2C_C0_RX_PACK      BIT(25)
 
+/* I2C Config1 WD0 */
+#define TRE_I2C_C1_TLOW		GENMASK(9, 0)
+#define TRE_I2C_C1_TCYCLE	GENMASK(19, 10)
+
 /* I2C GO WD0 */
 #define TRE_I2C_GO_CMD          GENMASK(4, 0)
 #define TRE_I2C_GO_ADDR		GENMASK(14, 8)
+#define TRE_I2C_GO_MASTER_CODE	GENMASK(17, 15)
 #define TRE_I2C_GO_STRETCH	BIT(26)
 
 /* DMA TRE */
@@ -1631,7 +1637,7 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 	struct gpi_tre *tre;
 	unsigned int i;
 
-	/* first create config tre if applicable */
+	/* first create config0 tre if applicable */
 	if (i2c->set_config) {
 		tre = &desc->tre[tre_idx];
 		tre_idx++;
@@ -1645,20 +1651,48 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 		tre->dword[1] = 0;
 
 		tre->dword[2] = u32_encode_bits(i2c->clk_div, TRE_C0_CLK_DIV);
+		tre->dword[2] |= u32_encode_bits(i2c->clk_src, TRE_C0_CLK_SRC);
 
 		tre->dword[3] = u32_encode_bits(TRE_TYPE_CONFIG0, TRE_FLAGS_TYPE);
 		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
 	}
 
-	/* create the GO tre for Tx */
-	if (i2c->op == I2C_WRITE) {
+	/* Create CONFIG1 TRE if requested */
+	if (i2c->set_config1) {
 		tre = &desc->tre[tre_idx];
 		tre_idx++;
 
+		/* CONFIG1 TRE with timing parameters */
+		tre->dword[0] = u32_encode_bits(i2c->config1.tlow_cnt, TRE_I2C_C1_TLOW);
+		tre->dword[0] |= u32_encode_bits(i2c->config1.tcycle_cnt, TRE_I2C_C1_TCYCLE);
+		tre->dword[1] = 0;
+		tre->dword[2] = 0;
+		tre->dword[3] = u32_encode_bits(TRE_TYPE_CONFIG1, TRE_FLAGS_TYPE);
+		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
+	}
+
+	/* create the GO tre for Tx */
+	if (i2c->op == I2C_WRITE || i2c->op == I2C_HS_WRITE) {
+		u8 master_code = 0; /* Default master code for Linux EE */
+		u32 cmd_opcode;
+		bool is_hs_mode = false;
+
+		tre = &desc->tre[tre_idx];
+		tre_idx++;
+
+		is_hs_mode = (i2c->op == I2C_HS_WRITE || i2c->op == I2C_HS_READ);
+
+		/* Determine the command opcode based on HS mode and multi_msg flag */
 		if (i2c->multi_msg)
-			tre->dword[0] = u32_encode_bits(I2C_READ, TRE_I2C_GO_CMD);
+			cmd_opcode = is_hs_mode ? I2C_HS_READ : I2C_READ;
 		else
-			tre->dword[0] = u32_encode_bits(i2c->op, TRE_I2C_GO_CMD);
+			/* I2C HS write vs Regular I2C write */
+			cmd_opcode = is_hs_mode ? I2C_HS_WRITE : i2c->op;
+
+		tre->dword[0] = u32_encode_bits(cmd_opcode, TRE_I2C_GO_CMD);
+
+		if (is_hs_mode)
+			tre->dword[0] |= u32_encode_bits(master_code, TRE_I2C_GO_MASTER_CODE);
 
 		tre->dword[0] |= u32_encode_bits(i2c->addr, TRE_I2C_GO_ADDR);
 		tre->dword[0] |= u32_encode_bits(i2c->stretch, TRE_I2C_GO_STRETCH);
@@ -1674,7 +1708,7 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
 	}
 
-	if (i2c->op == I2C_READ || i2c->multi_msg == false) {
+	if (i2c->op == I2C_READ || i2c->op == I2C_HS_READ || i2c->multi_msg == false) {
 		/* create the DMA TRE */
 		tre = &desc->tre[tre_idx];
 		tre_idx++;
@@ -1826,6 +1860,14 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 	if (direction == DMA_DEV_TO_MEM) /* rx */
 		nr_tre = 1;
 
+	/* I2C High-Speed mode sends an extra CONFIG1 TRE ahead of the GO TRE */
+	if (gchan->protocol == QCOM_GPI_I2C) {
+		struct gpi_i2c_config *i2c = gchan->config;
+
+		if (i2c->set_config1)
+			nr_tre++;
+	}
+
 	/* calculate # of elements required & available */
 	nr = gpi_ring_num_elements_avail(ch_ring);
 	if (nr < nr_tre) {
diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
index 332be28427e4..6e9f09fc109a 100644
--- a/include/linux/dma/qcom-gpi-dma.h
+++ b/include/linux/dma/qcom-gpi-dma.h
@@ -6,6 +6,24 @@
 #ifndef QCOM_GPI_DMA_H
 #define QCOM_GPI_DMA_H
 
+/**
+ * struct gpi_i2c_config1 - I2C High-Speed mode timing configuration
+ * @tcycle_cnt: I2C HS mode TCYCLE counter value
+ * @tlow_cnt: I2C HS mode TLOW counter value
+ *
+ * This structure is used for I2C High-Speed mode to configure the
+ * high-speed timing parameters via CONFIG1 TRE. The CONFIG1 TRE
+ * must be sent before the GO TRE when operating in HS mode.
+ *
+ * For I2C HS mode (3.4 MHz):
+ * - tcycle_cnt: Typically 28 for 100 MHz source clock
+ * - tlow_cnt: Typically 38 for 100 MHz source clock
+ */
+struct gpi_i2c_config1 {
+	u16 tcycle_cnt;
+	u16 tlow_cnt;
+};
+
 /**
  * enum spi_transfer_cmd - spi transfer commands
  * @SPI_TX: SPI peripheral TX command
@@ -52,6 +70,8 @@ struct gpi_spi_config {
 enum i2c_op {
 	I2C_WRITE = 1,
 	I2C_READ,
+	I2C_HS_WRITE = 0xa,
+	I2C_HS_READ = 0xb,
 };
 
 /**
@@ -62,15 +82,19 @@ enum i2c_op {
  * @high_count: high period of clock
  * @low_count: low period of clock
  * @clk_div: source clock divider
+ * @clk_src: serial clock
  * @addr: i2c bus address
  * @stretch: stretch the clock at eot
- * @set_config: set peripheral config
+ * @set_config: set peripheral config (CONFIG0)
+ * @set_config1: set peripheral config1 (CONFIG1)
+ * @config1: I2C HS mode timing configuration (CONFIG1 TRE parameters)
  * @rx_len: receive length for buffer
  * @op: i2c cmd
  * @multi_msg: is part of multi i2c r-w msgs
  */
 struct gpi_i2c_config {
 	u8 set_config;
+	u8 set_config1;
 	u8 pack_enable;
 	u8 cycle_count;
 	u8 high_count;
@@ -78,6 +102,8 @@ struct gpi_i2c_config {
 	u8 addr;
 	u8 stretch;
 	u16 clk_div;
+	u32 clk_src;
+	struct gpi_i2c_config1 config1;
 	u32 rx_len;
 	enum i2c_op op;
 	bool multi_msg;

-- 
2.34.1

