Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522595;
	b=y487GSyXjbMHkVsKDzZonMPbsyEDz9+H0xywaQQruWrN+pz4sfh18wgkC10fEskMwUW/
	 tZnBhkD+CwnWZ3dLGvAZ23VquUgX8UVyfTj1KdzKcC6I9NeA+tXFgU8nhOAi2lOSWrp0A
	 TZbazBhewn2AMnHZTkT9DJjotHR2/i+E04pGMiKb/aA+ymbSyJ0icIf5OAH+NQBPKSkg0
	 aODlElNndSQBAq0asOK+ENhVrk5rtNgcsNCVTCmwtbpd5sG+nUikIfJdTmERhtcATALaT
	 7TncrhVaoYnB3W+6njFjtdJeYvaTUoFGF5wsQHe+/krSH9Tc4rx9vlY9a1ZDdasEsoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522595;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WZg4Ou0qm95abbmdARxKRie/3fTGXUgMeoAOpNZ8jkc=;
	b=kuDjI66/pjai5z/Fy30hFFI0epY0loD3ljAETFJ4xOS2fpy8vcoEMnTPlljzxr1d42xH
	 qJdiMZGIkVg4QitBX24+5PUAQftTiZlWlEBVFUFN8Gro7c97BeijYTzQtN825yzVrO8+D
	 vWLNMOBqIlm91Qa0LPdLryz1egqlNCWsjifyJccg3QFEgL6H9GslUzI7EEiSsNtrOdNLr
	 ZmYcQciC+cp1snIyTvgOGyjLpPpSbTzNaEBltiloReN/MFWeBL2L8BD5AirlRZGinrjgT
	 S6vbYNm7737RZlWh6/d4KVyd1pkuhkUxQns+8jeqiXO2q+nIJtAJiDBbTXVCKeWZK4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gpLeKnHB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=krJx9cTc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA4D606A322
	for <dmaengine@vger.kernel.org>; Tue, 24 Nov 2026 12:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCA4D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gpLeKnHB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=krJx9cTc
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAusVc1291766
	for <dmaengine@vger.kernel.org>; Tue, 24 Nov 2026 12:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZg4Ou0qm95abbmdARxKRie/3fTGXUgMeoAOpNZ8jkc=; b=gpLeKnHB5zae52Ev
	ZZvvL1US9ny1DqHyeBYnvUgnD6BY/cAGvQaQY1dhRDv7CeJenbz0/sbGudVneGCU
	XETi4z37ITez/wd5vc/UK//KPZ7OBsV6TFnmnvDoXmnQbdDUU4cyb43NQLPCEPC9
	Pm4xwYvi3tUpQu+BagihZbX/vnJpjrBTZWraiPsm7HariWsJ/8kD3T467Yy4aE6l
	64quk5yM3N4OvKP0XCFPhUWa6TiRJqNbxo4gDzJQMcravJfIGejt7KQTAy7v4lb7
	SOz9tmO4Q2nbUBKjQo6FWRfCP3JO7dl8xdesp8dmEj/vwCKMbfNlo0FkG85gl1o8
	qiFJjw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrbmg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 24 Nov 2026 12:16:34 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b691cf0eeaso5225312b3a.1
        for <dmaengine@vger.kernel.org>; Tue, 24 Nov 2026 04:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795522593; x=1796127393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZg4Ou0qm95abbmdARxKRie/3fTGXUgMeoAOpNZ8jkc=;
        b=krJx9cTcX6VysrClS+33E7RBES+SpurfapR9+dmJBe7cIEXOx6uxLVx0/t10f4WPY9
         aThurtvuw+rCjriuajcidUeThkZb06hBSI5q6g25Jqcb7/oNArLTRYLBweTKgl+p+jGX
         ApNB1fQsV7hwrTwUKtCfWu62ZkHJHIY1Sp3ZxJbgt45Urj0t84v8sCz1hYUH/IcJtGY/
         0xa98R5mRdO/ZG/Tx4EZLdhvTT3Rr+U1rRkRSLROgnMqFgJs7LvgKRPUY4/V++HPhp8V
         wdKwkRC5AbVdsdQPhGfgR7/HfotvUGllyYrnVUZ/BtqtSyJTdAEHq851y/o/YmLJuFKW
         jaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522593; x=1796127393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZg4Ou0qm95abbmdARxKRie/3fTGXUgMeoAOpNZ8jkc=;
        b=nP3kODj0sqaZze9ISLo5VsMEzbS8vIWKOT4gbtRc07UymVrJhSo0HE0zIk/XCXMu//
         N1iBljOpttklkyTCc1M1tyMl3rjLi9fs9UbFu833QStnJ/cJIsBBsMHb9TlYgdjtxw6J
         dNl03HsaufhLioGNBnVLG6UlAH+ilVbe3EEpMwD5tdNukEhW1GvHNXpAe86yGdCNk8QV
         +R0XOtS8iEJlEIh4sKWqoPqhgEiwsPxnLpJA939SVq/NPWL4rhVRNzagIbj/wtlvyStO
         qCvOT3MIgm+ZfjjTWKW7RSd+eUI4pKmtUOrr92O8o+Zs+qRO2u4WDKzo0hLFLEHVozEH
         Z5vQ==
X-Forwarded-Encrypted: i=1; AL+hErHz+HtS9oa4pOHD8Am/aWl2xMh8SuyzdCVET41gevQ7/51TTgRzwfNMbYqOaXHA3SLbop0rBmX6c1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hxYANyirfV7f41dpfj4WhsvFhayjabARcEgvDetdRDt6NIY5z
	VbB3RBblxbTXRGzTT5oErHTEy/DKGOpSQkSUCrTXONyXnyhSMneI7cjh8GoWeqgGc3wYG8ACRoW
	APsVv/G7jTKGc2r5L6BJLgvaUIlIaLiq/xQPPdoEDxinlUjOBrPuloIc8x4V/Th2BglUgSOQ=
X-Gm-Gg: AZFdTZdTgpNqCdTKOef9VzWjvF4pQv7voIlUNZieyDJLcCxJPQModSnvWand9dDImuO
	9muKWjzSxie7RAvkHUfPzZOWqKrvdiKIJXDSjgH5+WuUVdkM9TsmNUaLcVztvqMV1ZREXS8tQZB
	XHKEDCT0GBNln+J3na8UBaSYE+CsnzcflU0zZYYocCpcuTVYDQ56ifFyXLEG7KzSD+qb6ug0ZP/
	EgNAwvZz19MkeaU+f62ILewbWwlR4N0YahZDN4sh0P/GGwT6lvsudrEUpzzmPE7t0Bp68fIZ581
	Iw9ltVadRWGXInzLugJn2AH5R28+aWBkRftcoEbt6YMEVhZuMi58hzZNS10CHB204c1ACXp8G++
	2v1uo+ELImesxVd1RADjWseMW5wVZt1nMRkUfbcxgNQ9NeJwpJmCOYtb34xK/1IH2tz4ybwRGkc
	tJo+cm3Fhf
X-Received: by 2002:aa7:9316:0:b0:8b1:1410:ac5a with SMTP id d2e1a72fcca58-8c87bdb43a3mr12426150b3a.13.1795522593219;
        Tue, 24 Nov 2026 04:16:33 -0800 (PST)
X-Received: by 2002:aa7:9316:0:b0:8b1:1410:ac5a with SMTP id d2e1a72fcca58-8c87bdb43a3mr12426124b3a.13.1795522592673;
        Tue, 24 Nov 2026 04:16:32 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8706844a0sm7245572b3a.1.2026.11.24.04.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:16:32 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 17:45:26 +0530
Subject: [PATCH v2 5/6] dmaengine: qcom: gpi: Add QSPI protocol support
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
Message-Id: <20261124-qspi_qup_upstream-v2-5-cd69894107c8@oss.qualcomm.com>
References: <20261124-qspi_qup_upstream-v2-0-cd69894107c8@oss.qualcomm.com>
In-Reply-To: <20261124-qspi_qup_upstream-v2-0-cd69894107c8@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795522563; l=7979;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=JZlztrmcHaS1DdxCDsT8jQs/w09XAiC0IM0iGjr15sU=;
 b=d4NbGGwnm3gPKm8s7d+m57fSPqikkLUgJigEAiGIN6Xjwz3vlQPzAk03oa5YGLH+teTy9Pvee
 sh33loJX+2HDWYpCDIZO3zFIv5zsh/F7bUbGOhoJVovOup+wzdxt2re
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX2Bo1m9BsupUx
 uPKoVJr02GJoljFvxZ8SEoq3rvZjFdum80ceFecFPpTMuqXFgMlgGQvt+4k8+wRoN/utW3HTn33
 OwM6uEjdTkzkB7g1xlnXUrajy/iMH20=
X-Proofpoint-ORIG-GUID: TwZbEMZSHuFgOUdJ7AWukRs6h2KJ0n-v
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b058022 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Q_YMRLC3c4VJkHlJM2QA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX6WBaBg4nuUqQ
 x1l1p/DlraYEsQM2ycsYJvMcsmz5NhfofIXhCDipCNFQYiIERZmzSWyVB6ladTBstsnFu8jCDcN
 oQgPrdt1U2VakXgYHIZXjOW7o7OYX8UUMqyYLATm8IvXCPREQPy4J3phDvZa42SaATKaDIXY/2q
 I8s6dZVWEsYCDJpTT5aLD0/7FwVdb/L3SnRWpj9roxVqhSas58/yJk86O+8cH2jPGyD9lupIB9T
 Cuok8ESlhF0+s27/MTRHI5K9AwJCMJcqGRCRrF52agBMlORiQs4Emf4VTRS+JXw1D77Y2ruI4fb
 6WdABpVgS2nD57zUd8++cvsF33caDSTgOevMJqHfo9OrhEUc4YwZukWXQ7Q4skYH4DGtWnxP/Ge
 kVUT1WGcuHBrN0S9vuN/ud2WCboFHmwHyH5wLf6abjHwlFPYkolTZWr1WKcih/0lFtB4kykK2g6
 0TGextNWVB3aAvR8YUg==
X-Proofpoint-GUID: TwZbEMZSHuFgOUdJ7AWukRs6h2KJ0n-v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240047

QSPI reuses the SPI TRE format but requires protocol-specific handling
for GO TRE fragmentation, transfer mode selection and dummy cycles.

Translate the QCOM_GPI_QSPI DT client identifier to hardware protocol
encoding 9 when programming the channel's SCRATCH_0 register. Retain
the DT identifier for protocol-specific driver operations and leave
the existing SPI, UART and I2C hardware mappings unchanged.

Add QSPI support to the SPI TRE generation path and extend
gpi_spi_config with transfer mode and dummy-cycle parameters. Encode
dummy cycles in CONFIG0 and select the QSPI GO format for single,
dual and quad SDR transfers, preserving the existing SPI encoding.

Add SPI_TX_RX to the shared DMA interface for sequential TX-then-RX
transactions. Enable RX end-of-transfer events for QSPI TX-then-RX
commands so clients can wait for both DMA completions.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 drivers/dma/qcom/gpi.c           | 32 ++++++++++++++++++++++++++------
 drivers/spi/spi-geni-qcom.c      |  1 -
 include/linux/dma/qcom-gpi-dma.h |  6 ++++++
 3 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index f2a2f653cc0b..59d9a393120e 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -36,6 +36,7 @@
 #define TRE_SPI_C0_CS		BIT(11)
 #define TRE_SPI_C0_CPHA		BIT(12)
 #define TRE_SPI_C0_CPOL		BIT(13)
+#define TRE_SPI_C0_DUMMY_CYCLES	GENMASK(21, 14)
 #define TRE_SPI_C0_TX_PACK	BIT(24)
 #define TRE_SPI_C0_RX_PACK	BIT(25)
 
@@ -48,6 +49,10 @@
 #define TRE_SPI_GO_CS		GENMASK(10, 8)
 #define TRE_SPI_GO_FRAG		BIT(26)
 
+/* QSPI GO WD0 */
+#define TRE_QSPI_GO_FRAG	BIT(22)
+#define TRE_QSPI_GO_MODE	GENMASK(31, 28)
+
 /* GO WD2 */
 #define TRE_RX_LEN		GENMASK(23, 0)
 
@@ -206,6 +211,7 @@ enum CNTXT_OFFS {
 #define GPII_n_CH_k_QOS_OFFS(n, k)		(0x2005C + (0x4000 * (n)) + (0x80 * (k)))
 
 /* Scratch registers */
+#define GPI_QSPI_PROTOCOL_ID		9
 #define GPII_n_CH_k_SCRATCH_0_OFFS(n, k)	(0x20060 + (0x4000 * (n)) + (0x80 * (k)))
 #define GPII_n_CH_k_SCRATCH_0_SEID		GENMASK(2, 0)
 #define GPII_n_CH_k_SCRATCH_0_PROTO		GENMASK(7, 4)
@@ -482,7 +488,7 @@ struct gchan {
 	struct virt_dma_chan vc;
 	u32 chid;
 	u32 seid;
-	u32 protocol;
+	u32 protocol; /* DT client protocol identifier */
 	struct gpii *gpii;
 	enum gpi_ch_state ch_state;
 	enum gpi_pm_state pm_state;
@@ -1264,6 +1270,7 @@ static int gpi_alloc_chan(struct gchan *chan, bool send_alloc_cmd)
 	u32 id = gpii->gpii_id;
 	u32 chid = chan->chid;
 	u32 pair_chid = !chid;
+	u32 protocol = chan->protocol;
 
 	if (send_alloc_cmd) {
 		ret = gpi_send_cmd(gpii, chan, GPI_CH_CMD_ALLOCATE);
@@ -1274,6 +1281,10 @@ static int gpi_alloc_chan(struct gchan *chan, bool send_alloc_cmd)
 		}
 	}
 
+	/* Translate the DT client identifier to the hardware protocol encoding. */
+	if (protocol == QCOM_GPI_QSPI)
+		protocol = GPI_QSPI_PROTOCOL_ID;
+
 	gpi_write_reg(gpii, chan->ch_cntxt_base_reg + CNTXT_0_CONFIG,
 		      GPII_n_CH_k_CNTXT_0(ring->el_size, 0, chan->dir, GPI_CHTYPE_PROTO_GPI));
 	gpi_write_reg(gpii, chan->ch_cntxt_base_reg + CNTXT_1_R_LENGTH, ring->len);
@@ -1283,7 +1294,7 @@ static int gpi_alloc_chan(struct gchan *chan, bool send_alloc_cmd)
 	gpi_write_reg(gpii, chan->ch_cntxt_db_reg + CNTXT_5_RING_RP_MSB - CNTXT_4_RING_RP_LSB,
 		      upper_32_bits(ring->phys_addr));
 	gpi_write_reg(gpii, gpii->regs + GPII_n_CH_k_SCRATCH_0_OFFS(id, chid),
-		      GPII_n_CH_k_SCRATCH_0(pair_chid, chan->protocol, chan->seid));
+		      GPII_n_CH_k_SCRATCH_0(pair_chid, protocol, chan->seid));
 	gpi_write_reg(gpii, gpii->regs + GPII_n_CH_k_SCRATCH_1_OFFS(id, chid), 0);
 	gpi_write_reg(gpii, gpii->regs + GPII_n_CH_k_SCRATCH_2_OFFS(id, chid), 0);
 	gpi_write_reg(gpii, gpii->regs + GPII_n_CH_k_SCRATCH_3_OFFS(id, chid), 0);
@@ -1728,6 +1739,7 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
 		tre->dword[0] |= u32_encode_bits(spi->loopback_en, TRE_SPI_C0_LOOPBACK);
 		tre->dword[0] |= u32_encode_bits(spi->clock_pol_high, TRE_SPI_C0_CPOL);
 		tre->dword[0] |= u32_encode_bits(spi->data_pol_high, TRE_SPI_C0_CPHA);
+		tre->dword[0] |= u32_encode_bits(spi->dummy_cycles, TRE_SPI_C0_DUMMY_CYCLES);
 		tre->dword[0] |= u32_encode_bits(spi->pack_en, TRE_SPI_C0_TX_PACK);
 		tre->dword[0] |= u32_encode_bits(spi->pack_en, TRE_SPI_C0_RX_PACK);
 
@@ -1745,7 +1757,12 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
 		tre = &desc->tre[tre_idx];
 		tre_idx++;
 
-		tre->dword[0] = u32_encode_bits(spi->fragmentation, TRE_SPI_GO_FRAG);
+		if (chan->protocol == QCOM_GPI_QSPI) {
+			tre->dword[0] = u32_encode_bits(spi->fragmentation, TRE_QSPI_GO_FRAG);
+			tre->dword[0] |= u32_encode_bits(spi->qspi_mode, TRE_QSPI_GO_MODE);
+		} else {
+			tre->dword[0] = u32_encode_bits(spi->fragmentation, TRE_SPI_GO_FRAG);
+		}
 		tre->dword[0] |= u32_encode_bits(spi->cs, TRE_SPI_GO_CS);
 		tre->dword[0] |= u32_encode_bits(spi->cmd, TRE_SPI_GO_CMD);
 
@@ -1759,7 +1776,7 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
 			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_LINK);
 		} else if (spi->cmd == SPI_TX) {
 			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
-		} else { /* SPI_DUPLEX */
+		} else { /* SPI_DUPLEX or SPI_TX_RX */
 			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
 			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_LINK);
 		}
@@ -1792,7 +1809,10 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
 		tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
 	}
 
-	tre->dword[3] |= u32_encode_bits(direction == DMA_MEM_TO_DEV,
+	/* QSPI TX-then-RX commands need a separate RX completion event. */
+	tre->dword[3] |= u32_encode_bits(direction == DMA_MEM_TO_DEV ||
+					 (chan->protocol == QCOM_GPI_QSPI &&
+					  spi->cmd == SPI_TX_RX),
 					 TRE_FLAGS_IEOT);
 
 	for (i = 0; i < tre_idx; i++)
@@ -1850,7 +1870,7 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 		return NULL;
 
 	/* create TREs for xfer */
-	if (gchan->protocol == QCOM_GPI_SPI) {
+	if (gchan->protocol == QCOM_GPI_SPI || gchan->protocol == QCOM_GPI_QSPI) {
 		i = gpi_create_spi_tre(gchan, gpi_desc, sgl, direction);
 	} else if (gchan->protocol == QCOM_GPI_I2C) {
 		i = gpi_create_i2c_tre(gchan, gpi_desc, sgl, direction, flags);
diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 0a15e75051d8..631908522957 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -69,7 +69,6 @@
 /* M_CMD OP codes for SPI */
 #define SPI_TX_ONLY		1
 #define SPI_RX_ONLY		2
-#define SPI_TX_RX		7
 #define SPI_CS_ASSERT		8
 #define SPI_CS_DEASSERT		9
 #define SPI_SCK_ONLY		10
diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
index 332be28427e4..d2d659a075f9 100644
--- a/include/linux/dma/qcom-gpi-dma.h
+++ b/include/linux/dma/qcom-gpi-dma.h
@@ -11,11 +11,13 @@
  * @SPI_TX: SPI peripheral TX command
  * @SPI_RX: SPI peripheral RX command
  * @SPI_DUPLEX: SPI peripheral Duplex command
+ * @SPI_TX_RX: SPI peripheral Tx-then-Rx command (QSPI read transactions)
  */
 enum spi_transfer_cmd {
 	SPI_TX = 1,
 	SPI_RX,
 	SPI_DUPLEX,
+	SPI_TX_RX = 7,
 };
 
 /**
@@ -33,6 +35,8 @@ enum spi_transfer_cmd {
  * @cs: chip select toggle
  * @set_config: set peripheral config
  * @rx_len: receive length for buffer
+ * @dummy_cycles: number of dummy clock cycles for a QSPI transfer
+ * @qspi_mode: QSPI bus-width/SDR-DDR mode for the GO TRE
  */
 struct gpi_spi_config {
 	u8 set_config;
@@ -43,10 +47,12 @@ struct gpi_spi_config {
 	u8 word_len;
 	u8 fragmentation;
 	u8 cs;
+	u8 dummy_cycles;
 	u32 clk_div;
 	u32 clk_src;
 	enum spi_transfer_cmd cmd;
 	u32 rx_len;
+	u16 qspi_mode;
 };
 
 enum i2c_op {

-- 
2.34.1

