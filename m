Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56270480DC5
	for <dmaengine@vger.kernel.org>; Sat, 12 Sep 2026 13:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789218307; cv=none; b=LgfWMEbEUL7D9fLfEpEggSqn36PmwnR19PM8brncEsbGtmPLNF5fITKO4/xPAxLHCTPwHEvg4l8JhReFCa7yQo2H838F4cqAPf5Jb1ldEnv36mXjJprHrFoUaYm2epvvWs1dwg6pQiSxoE6gQ6+9mgNvet260EF6PhDC7xiW9Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789218307; c=relaxed/simple;
	bh=79Fr5OwJj3rXBZztb4Irukv1fBUVIxftWbDY0TgTFr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cn9WfejGaXG4ic1x+6zPzsEDM8ry39f7FyRkpS/BlpAbNhEzjNxGurSBMG2ne4ztTd10eO/QKmQtRXHCIlDTS16+0NHgpRCgtRPRTMktPH9PnBwa8UiXJhP8HuO/k70OByWYIVraKLEyRz7XdWwSegqvyHNr/xgFWZAXlPKYSdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QPU1O1TR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EyInj4ni; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QPU1O1TR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EyInj4ni"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBduMk2428072
	for <dmaengine@vger.kernel.org>; Sat, 12 Sep 2026 13:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q6iPIf53YQku72sisV18OVAO89sx7Fr8T67qn+OtB0Y=; b=QPU1O1TR8YP0bjnF
	uPBp79wgrYkEvQaQrRoxZMAIFfpSbj7+PhoE4qz6kervXCdbVMTdvoqk0777R4RL
	6xiwhxexcUZZOsFNnBAkRI/o+/svCV4yIWzetUBucSadAa6nCcsPPJt3fGnc/EZT
	MxqvvqGRvQ94h1itW6KI8CbjpqGZGt9kRyO0ZYhLoPdpsIU/j73rIsh2jx3uqded
	qWo4NmWJSbP3U2vtQEwRyjUvGFcUjSG2oMss4VXMPAkq4LTREti4Xnh3dWa3cW3O
	8u7GgziP9DpkJJJHNvHVnmhVo5NASD5mRXfBmnPy/gnFy3jZ/6uv6/R99QLp+Xt1
	smaqBA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd0yww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Sat, 12 Sep 2026 13:05:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so3238837a91.3
        for <dmaengine@vger.kernel.org>; Sat, 12 Sep 2026 06:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789218303; x=1789823103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6iPIf53YQku72sisV18OVAO89sx7Fr8T67qn+OtB0Y=;
        b=EyInj4niBMB8gc2wT6mDtdrAqiYGiWOhqRDOshXsWbkveLdWJJBwRyYSOX+QvJ/kEd
         6fLg25CKQae4uneT97Dc5WgDaPdWJLhWOriIh0asqI2KPAVqpaGKMo4+jkK1V/niBng7
         0nfJpSrxsSPDAScwz6uf6a/yz8DODbAgrvjXPbXahG69rXzgLlvoEMYbDwp5n5KaKTy5
         bnVrzyG/4eGVkYxWTCvFucuelzFr/V918pw0gxf5fLs6RvMwAfKgl6R9zrQNy/sFROEo
         xbf0jBPR0TyAu4Yaob2WEkSq5fChV4Uk6FbMZOpuw/3WazaQpAay/oKv3MA7UNi7R146
         i9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789218303; x=1789823103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q6iPIf53YQku72sisV18OVAO89sx7Fr8T67qn+OtB0Y=;
        b=KAoVAxdpL8siP4KDkh3vIbrWMYNSoA94EVzJdPJJC0JxtYtd54SwoJCeVLxpafcHmA
         FMhqjNvMOBfpeTYb+i3XQ4QKCoXw5j/Y4Zn06tn6g6MPFrnk1cewbxS9GQUsajcPYPOP
         Gne2z+NPpKa6shGDpNeHZV/UWTbw1RGlG55jKa8IQKXFUjIP4GPUwrLVElHHZ5nfuOJN
         KZWG4ofKjBqpCJvZcNvrkKyXH1zuZQV7tkUtitcy+hEue1ex9hYKjCdNGyFhOuHzvZJi
         yeHxb2BFTgVQnpBSlQGwY3B0/7topLu6Ly/2ygbG3m/sj30/O4UZ/9k6II0Gc9UZ8hJ3
         maEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFQ6jbHrCPICZlnLhBWtk7qqrGeKyH1zmZZZJOraz0ukgmqW8zhKT9WW4pTMjG9/326bGILPcl16U=@vger.kernel.org
X-Gm-Message-State: AFuF++kFbG2h8K3McCBUgefaHoJpo/EbYFH1QlnR9dEGjjiXnKd8RnP+
	TZ9WWGYGU0Tzai0M/6cyz79I5iFAnxY3QlpThmvXcB7LGWmOgBzQMz9jDvgLIcBVTc9vmSTR90w
	4KyvEEXlVa5ReVi20LX8jU+JnKyTBV72hA7eiy0l7qOA9VIH5mt+9brlkqdtXQ7c=
X-Gm-Gg: AYBFou1yUGdLTk/uEKVDsR76EC8JACQAFTalB3c7MoO9t0qRt8fKC1jhJ0DmymI7nLv
	DRoFd80AnIMSd+Gcoh43gMfWa6nusvT67jUP9deaBJCPK7arHxEWKsbYPuiehLs/aa+kvfKDT2F
	4GhQmGau6ZEuubY7jQgLGHfXjWg79Ox9UG0qDm8+0WIcT/DGY9ITqlV8Ge1zGjP1hdg+Rlr94wD
	TcjeNzHAGOhwKQoTGXmlc3kt/IGOrhKvD/UPa5kEZlIAEmahr5lgOgObT26IprEkPAIUjK9NKH0
	nnC4hOW7r9oVEISbmvIJMJYYET3PwKRnHjQwkV6Ke/WUJQ3IZ0DB3l+0q0ug3+Aqxbq46ORNkap
	ZYAyTtC53Q5cCUao4w7ZhDuefW27DqybUamk=
X-Received: by 2002:a17:90b:540d:b0:398:ba96:1afd with SMTP id 98e67ed59e1d1-39d9bee4822mr15258936a91.8.1789218302564;
        Sat, 12 Sep 2026 06:05:02 -0700 (PDT)
X-Received: by 2002:a17:90b:540d:b0:398:ba96:1afd with SMTP id 98e67ed59e1d1-39d9bee4822mr15258873a91.8.1789218302058;
        Sat, 12 Sep 2026 06:05:02 -0700 (PDT)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f1e434sm13665036eec.22.2026.09.12.06.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 06:05:01 -0700 (PDT)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 18:34:23 +0530
Subject: [PATCH v2 2/2] i2c: qcom-geni: Add support for I2C High-Speed mode
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-i2c-hs-v2-2-b0901791e244@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789218290; l=9959;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=79Fr5OwJj3rXBZztb4Irukv1fBUVIxftWbDY0TgTFr0=;
 b=5bH5F2JZ+Qn5sf6GDPcxFodFCLDd9mwLIxABbAtzWDu2oKoQD3I3LugWXwmUyrRbu7nbpAvqQ
 BzYzMRToK2xBN+1+Vkc28GTwVdRjOZ2wty66Xv7iYjeZrkywNSr1zJb
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa54dff cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=CVQZEhLW7cNm6rAVh1IA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE4OSBTYWx0ZWRfX+kDUZu35m5Nf
 b+OAQuzha7az4fRuTo0A38lkurJHNIyU5+dRPZ9+2h9SvCSrc+BzFpBJewvgO0d2c3RWOgvH+dp
 WrqTMrCZN+hcVUFNw6AogUF7TYORZZ0uQgG2GbJvq7xxmjoKQm4iF74ZbgXhZJHeTuFiTZmnEun
 EJa31SJBZPvD6Uint1f9o3Q4dJMVQy994K93cy42cPSfFOJ5UaoRircGIbRD+BEsTiMyGb6W9Sk
 AcWW27VZNlknTqERezFw4d2YK+WbpU570+HcYKcUwYSD0bj/i3caaOVMX+0LQN2aCr3BJCKtNwo
 EauN4hB2D1iZl8BIw0XhZ3g+yrC39BB1m9I3PulRfiJV99wOH3vG4MnA8NCpIhzt+c5wc2SNQte
 VrmlpKRltpgylLSa31aFuF4qLH4nX3NZRgap6tvrt96VVjv22Vy72kvKojNKkIVsxDH88fAhRsb
 Alvr06e3zuQG6zgKWTw==
X-Proofpoint-ORIG-GUID: AUVt02xjqWLijUTE1EbL0mKjtw3TJf-A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE4OSBTYWx0ZWRfX5fdnlK1fZcUb
 Qjsd0DaA+wEGO7HY4tOW/qEcG45YxGG5n8X+yybH+la5oiflo74mK/HihACaMJ7nOvssAWDdRjr
 6nrqTBYPMOipFgLe0I93+MQSvdhMV8w=
X-Proofpoint-GUID: AUVt02xjqWLijUTE1EbL0mKjtw3TJf-A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120189

Implement I2C High-Speed (HS) mode for the Qualcomm GENI I2C controller.
Detect HS mode requests based on 3.4 MHz frequency and configure the
hardware accordingly. When HS mode is active, set the source clock to
100 MHz and program timing parameters (TCYCLE=28, TLOW=38).

For FIFO/SE-DMA transfers, use HS-specific opcodes I2C_HS_WRITE (0xa)
and I2C_HS_READ (0xb). Transmit the master code at Fast Mode Plus
timing (1 MHz) before switching to 3.4 MHz for data transfer.

For GPI DMA, extend the configuration with a CONFIG1 TRE to pass HS
timing parameters to the DMA engine. Add gpi_i2c_config1 with
tcycle_cnt and tlow_cnt fields (defaults: 28 and 38).
Use the set_config1 flag in gpi_i2c_config to send CONFIG1 TRE before
the GO TRE in HS mode.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 127 +++++++++++++++++++++++++++++++++----
 1 file changed, 113 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 658636c1ee0e..03c7bf95aec6 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -21,9 +21,21 @@
 #include <linux/spinlock.h>
 #include <linux/units.h>
 
+#define SE_GENI_CFG_REG68		0x210
+#define SE_I2C_HS_TLOW_REG		0x268
 #define SE_I2C_TX_TRANS_LEN		0x26c
 #define SE_I2C_RX_TRANS_LEN		0x270
 #define SE_I2C_SCL_COUNTERS		0x278
+#define SE_I2C_HS_TCYCLE_REG		0x27c
+
+/* I2C High-Speed mode definitions */
+#define I2C_HS_MODE_FREQ		3400000
+#define I2C_HS_SRC_CLK_FREQ		(100 * HZ_PER_MHZ)
+#define I2C_HS_TCYCLE_CNT		28
+#define I2C_HS_TLOW_CNT			38
+/* I2C HS mode support requires QUPv3 core version >= 4.3 per HPG */
+#define QUP_I2C_HS_MIN_MAJOR		4
+#define QUP_I2C_HS_MIN_MINOR		3
 
 #define SE_I2C_ERR  (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE_EN |\
 			M_GP_IRQ_1_EN | M_GP_IRQ_3_EN | M_GP_IRQ_4_EN)
@@ -36,6 +48,9 @@
 #define I2C_ADDR_ONLY		0x4
 #define I2C_BUS_CLEAR		0x6
 #define I2C_STOP_ON_BUS		0x7
+#define I2C_HS_WRITE		0xa
+#define I2C_HS_READ		0xb
+
 /* M_CMD params for I2C */
 #define PRE_CMD_DELAY		BIT(0)
 #define TIMESTAMP_BEFORE	BIT(1)
@@ -138,6 +153,9 @@ struct geni_i2c_dev {
 	u32 num_msgs;
 	struct geni_i2c_gpi_multi_desc_xfer i2c_multi_desc_config;
 	const struct geni_i2c_desc *dev_data;
+	bool is_hs_mode;
+	bool config1_sent;
+	u32 dfs_index;
 };
 
 struct geni_i2c_err_log {
@@ -162,9 +180,9 @@ static const struct geni_i2c_err_log gi2c_log[] = {
 struct geni_i2c_clk_fld {
 	u32	clk_freq_out;
 	u8	clk_div;
-	u8	t_high_cnt;
-	u8	t_low_cnt;
-	u8	t_cycle_cnt;
+	u16	t_high_cnt;
+	u16	t_low_cnt;
+	u16	t_cycle_cnt;
 };
 
 /*
@@ -194,10 +212,30 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
 	{}
 };
 
+/* source_clock = 100 MHz */
+static const struct geni_i2c_clk_fld geni_i2c_clk_map_100mhz[] = {
+	{ I2C_MAX_STANDARD_MODE_FREQ, 1, 449, 548, 998 },
+	{ I2C_MAX_FAST_MODE_FREQ, 1, 76, 167, 248 },
+	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 1, 23, 59, 98 },
+	{}
+};
+
 static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 {
 	const struct geni_i2c_clk_fld *itr;
 
+	/* Check if HS mode is requested */
+	if (gi2c->clk_freq_out == I2C_HS_MODE_FREQ) {
+		gi2c->is_hs_mode = true;
+		/* For HS mode, source clock should be 100 MHz */
+		itr = geni_i2c_clk_map_100mhz;
+		/* For HS mode, start with 1MHz for master code */
+		gi2c->clk_fld = &itr[2];
+		return 0;
+	}
+
+	gi2c->is_hs_mode = false;
+
 	if (clk_get_rate(gi2c->se.clk) == 32 * HZ_PER_MHZ)
 		itr = geni_i2c_clk_map_32mhz;
 	else
@@ -219,7 +257,12 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
 	u32 val;
 
-	writel_relaxed(0, gi2c->se.base + SE_GENI_CLK_SEL);
+	if (gi2c->is_hs_mode) {
+		writel_relaxed(I2C_HS_TCYCLE_CNT, gi2c->se.base + SE_I2C_HS_TCYCLE_REG);
+		writel_relaxed(I2C_HS_TLOW_CNT, gi2c->se.base + SE_I2C_HS_TLOW_REG);
+	}
+
+	writel_relaxed(gi2c->dfs_index, gi2c->se.base + SE_GENI_CLK_SEL);
 
 	val = (itr->clk_div << CLK_DIV_SHFT) | SER_CLK_EN;
 	writel_relaxed(val, gi2c->se.base + GENI_SER_M_CLK_CFG);
@@ -500,7 +543,9 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		geni_se_select_mode(se, GENI_SE_FIFO);
 
 	writel_relaxed(len, se->base + SE_I2C_RX_TRANS_LEN);
-	geni_se_setup_m_cmd(se, I2C_READ, m_param);
+
+	geni_se_setup_m_cmd(se, gi2c->is_hs_mode ? I2C_HS_READ : I2C_READ,
+			    m_param);
 
 	if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, len, &rx_dma)) {
 		geni_se_select_mode(se, GENI_SE_FIFO);
@@ -539,7 +584,9 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		geni_se_select_mode(se, GENI_SE_FIFO);
 
 	writel_relaxed(len, se->base + SE_I2C_TX_TRANS_LEN);
-	geni_se_setup_m_cmd(se, I2C_WRITE, m_param);
+
+	geni_se_setup_m_cmd(se, gi2c->is_hs_mode ? I2C_HS_WRITE : I2C_WRITE,
+			    m_param);
 
 	if (dma_buf && geni_se_tx_dma_prep(se, dma_buf, len, &tx_dma)) {
 		geni_se_select_mode(se, GENI_SE_FIFO);
@@ -689,7 +736,8 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 	 * programming an extra TX DMA TRE that would cause an unintended
 	 * write cycle on the I2C bus before the actual read operation.
 	 */
-	if (op == I2C_WRITE && msgs[msg_idx].flags & I2C_M_RD) {
+	if ((op == I2C_WRITE || op == I2C_HS_WRITE) &&
+	    msgs[msg_idx].flags & I2C_M_RD) {
 		peripheral->multi_msg = true;
 		goto skip_tx_dma_map;
 	}
@@ -700,7 +748,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 		goto out;
 	}
 
-	if (op == I2C_WRITE)
+	if (op == I2C_WRITE || op == I2C_HS_WRITE)
 		map_dirn = DMA_TO_DEVICE;
 	else
 		map_dirn = DMA_FROM_DEVICE;
@@ -737,7 +785,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 	peripheral->set_config = 0;
 	peripheral->multi_msg = true;
 
-	if (op == I2C_WRITE)
+	if (op == I2C_WRITE || op == I2C_HS_WRITE)
 		dma_dirn = DMA_MEM_TO_DEV;
 	else
 		dma_dirn = DMA_DEV_TO_MEM;
@@ -760,7 +808,8 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 	desc->callback_result = i2c_gpi_cb_result;
 	desc->callback_param = gi2c;
 
-	if (!((msgs[msg_idx].flags & I2C_M_RD) && op == I2C_WRITE))
+	if (!((msgs[msg_idx].flags & I2C_M_RD) &&
+	    (op == I2C_WRITE || op == I2C_HS_WRITE)))
 		gi2c_gpi_xfer->msg_idx_cnt++;
 
 	cookie = dmaengine_submit(desc);
@@ -827,6 +876,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 	peripheral.high_count = itr->t_high_cnt;
 	peripheral.low_count = itr->t_low_cnt;
 	peripheral.clk_div = itr->clk_div;
+	peripheral.clk_src = gi2c->dfs_index;
 	peripheral.set_config = 1;
 	peripheral.multi_msg = false;
 
@@ -836,6 +886,13 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 
 	gi2c->num_msgs = num;
 	gi2c->is_tx_multi_desc_xfer = false;
+	gi2c->config1_sent = false;
+
+	/* Initialize config1 TRE settings for HS mode */
+	if (gi2c->is_hs_mode) {
+		peripheral.config1.tcycle_cnt = I2C_HS_TCYCLE_CNT;
+		peripheral.config1.tlow_cnt = I2C_HS_TLOW_CNT;
+	}
 
 	tx_multi_xfer = &gi2c->i2c_multi_desc_config;
 	memset(tx_multi_xfer, 0, sizeof(struct geni_i2c_gpi_multi_desc_xfer));
@@ -883,14 +940,25 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 		if (i > 0 && (!(msgs[i].flags & I2C_M_RD)))
 			peripheral.multi_msg = false;
 
-		ret =  geni_i2c_gpi(gi2c, msgs, &config,
-				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
+		/* Set config1 TRE only for HS mode */
+		if (gi2c->is_hs_mode && !gi2c->config1_sent) {
+			peripheral.set_config1 = 1;
+			gi2c->config1_sent = true;
+		} else {
+			peripheral.set_config1 = 0;
+		}
+
+		ret =  geni_i2c_gpi(gi2c, msgs, &config, &tx_addr, &tx_buf,
+				    gi2c->is_hs_mode ? I2C_HS_WRITE : I2C_WRITE, gi2c->tx_c);
 		if (ret)
 			goto err;
 
+		/* CONFIG1 TRE is only for the TX channel; clear before RX call */
+		peripheral.set_config1 = 0;
+
 		if (msgs[i].flags & I2C_M_RD) {
-			ret =  geni_i2c_gpi(gi2c, msgs, &config,
-					    &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
+			ret =  geni_i2c_gpi(gi2c, msgs, &config, &rx_addr, &rx_buf,
+					    gi2c->is_hs_mode ? I2C_HS_READ : I2C_READ, gi2c->rx_c);
 			if (ret)
 				goto err;
 
@@ -1037,6 +1105,7 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
 static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 {
 	u32 proto, tx_depth;
+	unsigned long freq_out;
 	bool fifo_disable;
 	int ret;
 
@@ -1046,6 +1115,36 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 		return ret;
 	}
 
+	/* HS mode requires QUPv3 version >= 4.3 and source clock=100 MHz */
+	if (gi2c->is_hs_mode) {
+		u32 hw_ver = geni_se_get_qup_hw_version(&gi2c->se);
+		u32 major = GENI_SE_VERSION_MAJOR(hw_ver);
+		u32 minor = GENI_SE_VERSION_MINOR(hw_ver);
+
+		if (major < QUP_I2C_HS_MIN_MAJOR ||
+		    (major == QUP_I2C_HS_MIN_MAJOR && minor < QUP_I2C_HS_MIN_MINOR)) {
+			dev_err(gi2c->se.dev,
+				"QUP HW v%u.%u does not support I2C HS mode (requires >= %u.%u)\n",
+				major, minor,
+				QUP_I2C_HS_MIN_MAJOR, QUP_I2C_HS_MIN_MINOR);
+			ret = -EOPNOTSUPP;
+			goto err;
+		}
+
+		ret = geni_se_clk_freq_match(&gi2c->se, I2C_HS_SRC_CLK_FREQ,
+					     &gi2c->dfs_index, &freq_out, false);
+		if (ret) {
+			dev_err(gi2c->se.dev, "Failed to get DFS index for HS mode: %d\n", ret);
+			goto err;
+		}
+
+		ret = clk_set_rate(gi2c->se.clk, freq_out);
+		if (ret) {
+			dev_err(gi2c->se.dev, "Failed to set HS mode clock rate: %d\n", ret);
+			goto err;
+		}
+	}
+
 	proto = geni_se_read_proto(&gi2c->se);
 	if (proto == GENI_SE_INVALID_PROTO) {
 		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);

-- 
2.34.1

