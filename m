Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E80348095E
	for <dmaengine@vger.kernel.org>; Sat, 12 Sep 2026 13:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789218302; cv=none; b=FVMF28acwVJaE3IyvPLp9xESjHQWFQ+AVh4ZQcoehS0Yo+EWFjjvl5YJ669M5EVoFwzWicBHOtXIdJy7seb+ehtGaDFWWrqjZZHMsOISmT5mvY7wZEuZgc2c7dvnG5iY6xbjsZH0Y8grUN2pXIDctWS+XJRpcTw9uBLSpLgB2eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789218302; c=relaxed/simple;
	bh=wyw1WqsiNFGKoo42wz77AWZNLZL4lodVAHqdQSR+w2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IIfb9OTAiWOnvHeA81LJdtQ6tIM4OVc6aCoHeDnu7H6L2ESrhkAzBUUGRyXXZrJ3Z0DOugqmeNreyG8BIjyeEhY98Ff8ZIdHvQKCV1dDCiNmvvxKDm/5s5QwHVPOihl1fedWetHrIvt+1L5qd7GJdMGshqKNlPGKl9uAUFRIcPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cCqEHrHI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AZVwVY9y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cCqEHrHI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AZVwVY9y"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBdecL1707378
	for <dmaengine@vger.kernel.org>; Sat, 12 Sep 2026 13:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SSh8gFqeHXIIjFJPAXzKIU1K8Q/Grp6yUgkciIM+fPo=; b=cCqEHrHIAuv458Zp
	VvX/ApBPIa2MsTuaoXWNuCvbKC3XXaq+hVWdxAstTvglo0v82Ux0/LUZHQwQG8VT
	Bajbxv7L9WnlgekMS+9nmnicLQlcrGLMbjPrJjRc+CBC+PalBS/IIoyXfbDtSnbZ
	LsSD4NC02fm1lt11U1Qg/ic3yqRtk2SNIEPHDFZDkhuYWdY0N3Twqi9w8zSuCmtA
	xq+lcSfu19mkie4pc6z8FYa2YL5QYNkyT12BzwGBwXrTlc/ppgqAeNPFBvWvCEci
	NoPqDXSrXHD0XU0BFlrvD7snK0GFIJi7d9FQhCwYe9xV3YXT3ORFROEGEdy85Nd6
	d7r/xA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh0w1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Sat, 12 Sep 2026 13:04:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb687f82eso23217875ad.3
        for <dmaengine@vger.kernel.org>; Sat, 12 Sep 2026 06:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789218299; x=1789823099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSh8gFqeHXIIjFJPAXzKIU1K8Q/Grp6yUgkciIM+fPo=;
        b=AZVwVY9yHMdXuVSStWu5la5cq4So5/t+WFlt1/M7Z3pBsc6vzSEgjz/IJTaia9VuJT
         IRDk58gmiOoVTrv42n2INBRC170/1toUbl5g6Q5ynwSjjDoKX/ORYB2rIwAAXKMVb6h7
         Y4suppALd8r8iazoSoIHL2VC5QzLfW1QHmKOvBswdNBdtt+YifFRKfnNJNkuqWapywaI
         fEay2maQKiEq2RyohXVpTDSE8HXSoye7xZdO5blAAQWUmhRHlhE5m/Vp+U+DmoVI+PfR
         MBc0+VmStuLq/KQwybTfU8ui3uVdjXbsuWoaF3P5WOqJSP1ymBURko26Fr+1h/LdBkH6
         +xIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789218299; x=1789823099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SSh8gFqeHXIIjFJPAXzKIU1K8Q/Grp6yUgkciIM+fPo=;
        b=MCaT/GDM8ELGFy3z3pT2EjS1fUTY7LVYLGFlDRneBO34uO8F2oD/R/rvjXnvpHKtsp
         Gv4Os2hvLHN3P9Zz3ZoBiCKG2SAsJ1KzGniGSQ6FjkaEqS0nXXGek3dQQrVjZzDDzuzJ
         4aWa8/4ka7IWbvnSM3JBA80+rpSTRNXPWDh0OtVrxowdp5y6fSTRhHKYpm/op5dYLPmw
         Mc/6x8CQmTbuSs6wheTycbOy87SekEMNCq9KpIi9AHVmEue+48DGeKacS0myGC2Ki5mT
         +gxxl6IxL5ksz+ANa/Pp5dC5jXd6VMi7LKzEH+8lDun1wCRB9UaAl+zIs7xTW418uAUI
         NC9A==
X-Forwarded-Encrypted: i=1; AKwUvBwhAFgi4Rkmkd2mSurtmcX6xUaFzhEtyJik42zXCev2XXuY/WvgsYFBhWPiZpCr0E4Lql2zxG1hv4Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kqRaaiJ1LmtEZuQdcmpZ/zwmiU549vgycL4rwSPrR/4ep1uV04
	xhPrhpSs2mssyu+eLa/AdPWLNyXDvMSFso11w3YRtdqYvd4ajkrG6xXT/wSQVbximsD20oh88lb
	EBtbfUtGSB7KP90RDm8jqMaSWmSigiBwxceXetepmQolr3H6oQknTqdIxkjh8AlE=
X-Gm-Gg: AYBFou1mCHNE/Mk10OxHzAu+3iOPRAyg54mPVH/E09npGmv0LW21nlFH0eS6YoeJd9d
	HeMpvXfR1rJRkqFy46PLZJl0nmjl5k+fMwsa2p36Hvp4eCX44UUZ7MlbBMcE72ifazuJCr/iIv5
	eW31eyDcRFXaUGdrnvXwMwG0BZJ1uAhN1egk7trOVxhT7TFfO5zDSbq0bjbQP/1fqH4Z4euy/jR
	Ojyn3oyArOAhW1nk/Tm49zt4CAu4/1NaOmGGhY4Zf8oojO9iLjxS6IxQN/bwMVqvH/sORb5bOVN
	TkQmkyhJi08Cd+yEblmgkgSNNQ/+vt15rGo3OkO3vTEQke0boz7AHAKQLcO9kSpLGW/pXTigYAi
	C/olbfsszxF77pDpUO+H7rzc2InzkLMCCN3A=
X-Received: by 2002:a17:90b:51c3:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39dbc6ed4b1mr4957426a91.20.1789218298588;
        Sat, 12 Sep 2026 06:04:58 -0700 (PDT)
X-Received: by 2002:a17:90b:51c3:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39dbc6ed4b1mr4957403a91.20.1789218298123;
        Sat, 12 Sep 2026 06:04:58 -0700 (PDT)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f1e434sm13665036eec.22.2026.09.12.06.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 06:04:57 -0700 (PDT)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 18:34:22 +0530
Subject: [PATCH v2 1/2] dmaengine: qcom-gpi: Add I2C High-Speed mode
 configuration support
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-i2c-hs-v2-1-b0901791e244@oss.qualcomm.com>
References: <20260912-i2c-hs-v2-0-b0901791e244@oss.qualcomm.com>
In-Reply-To: <20260912-i2c-hs-v2-0-b0901791e244@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789218290; l=6772;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=wyw1WqsiNFGKoo42wz77AWZNLZL4lodVAHqdQSR+w2U=;
 b=QZsYJKPUtKBBZIOhyUlWeQfDtdu06FuOAoUiFNstXty+oOI7HrnlzcCsDQIgGODNCnGBS0lEk
 KoeMaYeBNu4BQ3gK83h1ZUQooRhNRhoZ+rnm3IDaPQXH1dSRq/2Q1Gi
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-GUID: bSbh8gE8kZKFtiKeS9XCB0AJsNuXgu3C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE4OSBTYWx0ZWRfX7glQ0AsrqMnm
 bxtOrBpBLUBMqlSSMwUIk8Kj3yItEIp3KeXWTVIYUa/Sp+Cfhu8VDDHKV0CHEKnyRH7ZreQQ4Q8
 okcKtf+bzw9l4DaVrwNDY8LBldF6+XSvSjWt8Qy8GVH725SmtAl26gzupwUWtxYnBWgOWj+qVLx
 dIjI4rlyB1leCbervwxNTnD/eTTEIvFCgWhK3bDMt7LUuyxFYJpNLzMQY8W1GkMA7teKpeUp+sB
 NpBA6WlxHmBUR3mRMUO3XSCQE+Q21Ifa4czje7xG9IkZW8Elv8hUtlCdnEWUoUDHc/wLff2Omn4
 i0zgQ09RBYQdXXO0A7eACzEQZYWlZqYHE2NG/Np8QtLGN3Ij0HEEfXWC0IyUpKE8LwjHVK4gd8N
 nl3kB7keO/vIiBoglA2Kgt5E15NNc+zE0V930GOEl3fXAv1oIqyjYC8XZrDZKbNaxw8g+MTkQpN
 lT0xEZ3yP+rhn47wiYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE4OSBTYWx0ZWRfXxsGTz1Nw9ybD
 KXhprV6hZWt9H8VaRnHRRjUSNe17DL5cdJtr58dmhXYmfAbb6shkXtNS7vpVdop/jw1mjgoZDx8
 zVsOKdiRE+scUcgEX9NReQ7mvE9+460=
X-Proofpoint-ORIG-GUID: bSbh8gE8kZKFtiKeS9XCB0AJsNuXgu3C
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa54dfb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8yvkWvxPp_QYhSqoyPwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120189

Add support in the Qualcomm GPI (Generic Packet Interface) DMA engine
for I2C High-Speed (HS) mode transfers

Introduce support for CONFIG1 Transfer Ring Element (TRE) to convey
HS-specific timing parameters to the Qualcomm GPI DMA engine.

Define a new gpi_i2c_config1 structure containing tcycle_cnt and
tlow_cnt fields, with default values of 28 and 38 respectively,
as required for 3.4 MHz HS mode operation.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 drivers/dma/qcom/gpi.c           | 56 +++++++++++++++++++++++++++++++++++-----
 include/linux/dma/qcom-gpi-dma.h | 28 +++++++++++++++++++-
 2 files changed, 76 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index a5055a6273af..835021a9b7ed 100644
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
@@ -518,7 +524,7 @@ struct gpii {
 	bool ieob_set;
 };
 
-#define MAX_TRE 3
+#define MAX_TRE 4
 
 struct gpi_desc {
 	struct virt_dma_desc vd;
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
+		u8 master_code = 0;
+		u32 cmd_opcode;
+		bool is_hs_mode = false;
+
+		tre = &desc->tre[tre_idx];
+		tre_idx++;
+
+		is_hs_mode = (i2c->op == I2C_HS_WRITE || i2c->op == I2C_HS_READ);
+
+		/* Select HS-mode or standard I2C opcode */
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
index 332be28427e4..dda5f00660f9 100644
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
+ * @clk_src: source clock
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

