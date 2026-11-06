Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977345;
	b=luLPzN2M6th0n3IwK5u8ggCFw2/fnxRhGHGo2U27aHlLNqxCk8q5E/RH1GiUtt4U69Sa
	 zt+7/YXCSQ8iitxdEdNaCC1uHpamdwavxWQZHEq3BMb+FSWOk4TtlwePGJfFDxkyOpXu0
	 lWmtGTmPFnANytN3k14yjjBZMM5nKitmS++LqHe0Feh8Y8Ktds8omfY1FGpHqyDhHjsNX
	 hL+ffYcUkAo0Xp+7BRShHKVIEf08+fcYvfGD3RG1NtkKz5jU0Me4Ax2qjWQr4N809AhK5
	 hBCQuDSaAbURKL4Ii7r2X3n+1hfJxFRWrJG5/5YYzkN9VSvHOgkl3hlytJZ2qwPKhQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977345;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=99GhaTNH5mb9xE9J4JWzIgUnSd5N1QJXdiYFGKhRYFY=;
	b=an7WQaivkfMJuecgo73Lxy1jD4S35Z8buaq56D2R6u7p4ylQhDLugPPV/oWTK9BYsPhl
	 xoJFWQq6sxG74DIxLXIPx8MLAJ8XhX8XWGZ+S1hLiunkgbSmOEpTbv9hG9MNJ1rkU23Rv
	 sFl1auaYCbvbZKCWDE4CT6akm0iS2gJap3a/gXobWPhs3dE3d/WtERWfI/qPeoaYXIDmz
	 WPk2SI640huRf/aDNFd4otPwEZajPvIYEU1WUs0PH2aFbesb2AGjd3vW/PMjki3GEEuPU
	 ZgP9Mpe5Py1GE/sxOfCNL26/95byJ3rSTsC9fXS4vcqADsV4omVzQHEI3u2LmX3jihQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PpQsVZ5L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="c2m/3BbZ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562D9606A33C
	for <dmaengine@vger.kernel.org>; Fri,  6 Nov 2026 15:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 562D9606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PpQsVZ5L;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c2m/3BbZ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F05Z01121979
	for <dmaengine@vger.kernel.org>; Fri, 6 Nov 2026 15:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	99GhaTNH5mb9xE9J4JWzIgUnSd5N1QJXdiYFGKhRYFY=; b=PpQsVZ5LfHyljO2n
	B8PBSeI3SP7QWydxoXexEgZECre951XwZcx5mNOiKqOXDDcjy6XXaos+tadoWUic
	0YF/0fO1FmCEgi9BpVJ7UpiQBcEsqEvoKIv1V1Dt7+eI74uGv08w928CIwMPwisg
	QArspzJZcbJVY+QgUmsZox1RD6oxO6QZGtwHfhJytBI0rnE7JQxMWkyFNIe1Aikg
	txbStzwfaEpY+YqWJrCNIIQIn/LTeYzlws3X5zUcppT+vdck+A3Phc4A9rz3leJ3
	gjQGEAI6NamhFczGbbp4TTk0CodjeNAryoXmd0vIPXMPX2PN6XE58tGPefAtPR64
	0t6VQA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9u90q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 06 Nov 2026 15:02:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so1108194a91.3
        for <dmaengine@vger.kernel.org>; Fri, 06 Nov 2026 07:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977344; x=1794582144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=99GhaTNH5mb9xE9J4JWzIgUnSd5N1QJXdiYFGKhRYFY=;
        b=c2m/3BbZB6KMf6j3kJ4jJ4FDXd+F2hsCdF7lFfJZN9oXsPszJ9sLTZrc+aA2RDmbzS
         U7nVwrLBjbsgBGmKkK0TBxHxfC5sB9zIPH2mp0c1lxZnAE0OXGsCV9s/Du/Cb3O+iENN
         a6cyCuwogda5laBrW8O2hWbTYlvWgJVPujBqkKqElYvv6V3A/OwG5jIhoaOJS+dsAWME
         9mP+4Bw0aCEYeeWaRHMCSsL+6CYajqZNvrYvNDqu/DvuMWR+jCTCZGSs38E7jjzjJoKW
         xfGdK9CWl/JgCpSiuSvNtDnMjtCEF8jveaymTLG/sBO/CoOqMY7/bD1lhCdve//MTgLL
         kdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977344; x=1794582144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=99GhaTNH5mb9xE9J4JWzIgUnSd5N1QJXdiYFGKhRYFY=;
        b=MA/bafv5uaHzCClYxGiaSccPnwGOt9uDF7o3RrlrKsU6u1joEjG0/A+HvtKWWbrLLD
         xqjZxSkZdFPsAhZdsWGnIONAv7EilwmEEhsVBQM+4TWqT9SbRWHdCczKA3W9WvNis7LO
         SeYWtuqmgnu1wGJhQftP9wkixLOU87HflNH4jdmY6ZZ194LSdwq+Mc1k0qxu+1GRtF79
         Z8xbszlrzUAcCan/8rzAhAwaEGS/SYrbjuKsn0TqXz3kj5SadDYiF0WmGeDzJ1Anho0o
         Cg/aYQvY5XgNi8yGHY1zbxRm81ukSbTIZHiPFbQFbJiawailmvj0air6Nph7g5VNf2+B
         zgwQ==
X-Forwarded-Encrypted: i=1; AL+hErHlPjE6bDmhWhzT0BFYEUqj4xjgh+JeB/sudvKoq5UuI0A6Hypph5WsYmF666PdzBK0nNR5Gtev9/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uh+eg9/1gu27g/7q6xwXg0+VDlQhEp5gq0893+J4APIFZ/hOK
	uDdBYWzcxoaBsGAv2azWC7rXm9COU3I2Typi15ixqp9XrvfR6MkZehgahmsX5a7xFe99jGNypZj
	2HSvVgSKi03dR854Bc4Oj/GGj3bDBfTJeA3Zsy+yq26OEY6liZQfeD+oot+fdTvjl0PH0D04=
X-Gm-Gg: AYBFou1frsB8rIh4tiEctHOa4+nAXi6e9ToaTEYMLv4tIzjPWUiOvl9zsgYqeszC647
	LHznRsN+Mmb9SO5sw4ofeLQUtJfFcjxVGnqfB8ljwGiPoxibhW2SPrCULka29D9I9lxIVeZ/HnB
	jO4sVqgHb4XSddRwrXlvLfhr/Ek8CLTlT/307z6S3FdQJRDyyPSLruDubVfSYjiTgE4mlpGjo/E
	q8zsKHL9x2/7wnMV1EXQyqBlPg1ebWFwJ+w9XbCxWoIDX+JTHqDKP2OyjdaicOB8CLX5rNJ75B9
	IumCo8kjz5djKisZI4qkFkUID4flLIUCRruomX8bT35g2G0JYYjNR37it1HMqj5Mjt07z+1amYg
	xu0udTiJ7bq7USJnJJ/kpEjNd4Qb76gdzHfduip+MwGTb49QzymewS9bogxQdHHH8VAKGzVfoDq
	8wAd9hWjCK
X-Received: by 2002:a17:90b:1642:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b0db6d6e03mr2861065a91.30.1793977343805;
        Fri, 06 Nov 2026 07:02:23 -0800 (PST)
X-Received: by 2002:a17:90b:1642:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b0db6d6e03mr2861014a91.30.1793977343194;
        Fri, 06 Nov 2026 07:02:23 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc1bc1e6sm100032a91.0.2026.11.06.07.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:02:22 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 20:31:23 +0530
Subject: [PATCH 5/6] dmaengine: qcom: gpi: Add QSPI protocol support
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
Message-Id: <20261106-qspi_upstream_series-v1-5-21f43042dd60@oss.qualcomm.com>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
In-Reply-To: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793977309; l=5767;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=DU/0jG2VsMzJIcwjBy6FqxX/qcBvTcCraw1OReUmll4=;
 b=rJ/9kkVw20vLRULI1yFVmo5VxruTh4sAL4u3bITIWG4T1/lZbTVomTOkN+copafILcYhGGGCn
 DQI3jNFgoTeCFHUl57qrFQG/WpRtyrkkr4Xng7kDRgfrGE1IXO5RNjb
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX9KUZn/Giqe2W
 rwn4Guw8sxtuaESwNiRBkxhIyodE3KjBSRkXuBI6hMmTqfTKp+xZexZCHHxzFWUNhq1DFO6eAB0
 t6uuj/i71xi/yupHlry/xgMQHvQqNiU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX/9tsKmaGY6Dt
 ImDTrov71byyZ3uEhKn8tByAf6NsqveA1zNxZZlK1EgelruzlIULsUQ/XqrMSD0qGnzJUdA7D5r
 d5HnRdeJXJ9seBFtfbKqBlXUJJDcPh4AMZSCqwoYUxm7UGbw5/DA0wKDJwFZ2BZjDM0po1V2yTl
 yoeJo0zluNo0dz+SbWqJ80gv4Q1qffDRrkDKHsFEX/jgTHkXMfr+Z4HI6LH/af9kEdBqIuaRbfG
 Gx5oAWHBP09Rnt5MqOUBvhU90a4tIG5gAkQ6oGWg+IOysZa1B2pDbP5mSZRgOJ7F2CxMkxxYWhS
 UGGin6Nv1s0o3NOy8bl1LuRDBNsP3PipZ/L9ZXyXXekztLcQ3DPWjLpnL71TgN2FCW5DlfEYjSg
 uFX8eDp88xp8XLCFjv261l2S3NurBez0+5Ncs34K2zRyc8Ra357YdD8rdSg7e2TZD4aOzaQlcLu
 syNU+qh8GGwoa3FDiTA==
X-Proofpoint-ORIG-GUID: mayqTGpXTKtme-z6s35-e8m2cWP4ydGy
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aedec00 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Ygj2nM-Zz2zQjpz6_bQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: mayqTGpXTKtme-z6s35-e8m2cWP4ydGy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059

QSPI reuses the SPI TRE format but requires protocol-specific handling
for GO TRE fragmentation, transfer mode selection and dummy cycles.

Add QCOM_GPI_QSPI support to the SPI TRE generation path and extend
gpi_spi_config with QSPI transfer mode and dummy-cycle parameters.
Encode dummy cycles in CONFIG0 and select the appropriate GO TRE
format based on the channel protocol, enabling single, dual and quad
SDR transfers while preserving the existing SPI encoding.

Also add SPI_TX_RX to the GPI DMA interface to represent sequential
TX-then-RX transactions used for QSPI read operations.

Enable RX end-of-transfer events for QSPI TX-then-RX commands so
clients can wait for both transmit and receive DMA completion.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 drivers/dma/qcom/gpi.c           | 22 ++++++++++++++++++----
 drivers/spi/spi-geni-qcom.c      |  1 -
 include/linux/dma/qcom-gpi-dma.h |  6 ++++++
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index a5055a6273af..487e023287aa 100644
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
 
@@ -1719,6 +1724,7 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
 		tre->dword[0] |= u32_encode_bits(spi->loopback_en, TRE_SPI_C0_LOOPBACK);
 		tre->dword[0] |= u32_encode_bits(spi->clock_pol_high, TRE_SPI_C0_CPOL);
 		tre->dword[0] |= u32_encode_bits(spi->data_pol_high, TRE_SPI_C0_CPHA);
+		tre->dword[0] |= u32_encode_bits(spi->dummy_cycles, TRE_SPI_C0_DUMMY_CYCLES);
 		tre->dword[0] |= u32_encode_bits(spi->pack_en, TRE_SPI_C0_TX_PACK);
 		tre->dword[0] |= u32_encode_bits(spi->pack_en, TRE_SPI_C0_RX_PACK);
 
@@ -1736,7 +1742,12 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
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
 
@@ -1750,7 +1761,7 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
 			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_LINK);
 		} else if (spi->cmd == SPI_TX) {
 			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
-		} else { /* SPI_DUPLEX */
+		} else { /* SPI_DUPLEX or SPI_TX_RX */
 			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
 			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_LINK);
 		}
@@ -1783,7 +1794,10 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
 		tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
 	}
 
-	tre->dword[3] |= u32_encode_bits(direction == DMA_MEM_TO_DEV,
+	/* QSPI TX-then-RX commands need a separate RX completion event. */
+	tre->dword[3] |= u32_encode_bits(direction == DMA_MEM_TO_DEV ||
+					 (chan->protocol == QCOM_GPI_QSPI &&
+					  spi->cmd == SPI_TX_RX),
 					 TRE_FLAGS_IEOT);
 
 	for (i = 0; i < tre_idx; i++)
@@ -1841,7 +1855,7 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 		return NULL;
 
 	/* create TREs for xfer */
-	if (gchan->protocol == QCOM_GPI_SPI) {
+	if (gchan->protocol == QCOM_GPI_SPI || gchan->protocol == QCOM_GPI_QSPI) {
 		i = gpi_create_spi_tre(gchan, gpi_desc, sgl, direction);
 	} else if (gchan->protocol == QCOM_GPI_I2C) {
 		i = gpi_create_i2c_tre(gchan, gpi_desc, sgl, direction, flags);
diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 25c03096ee23..c2c3400b24c4 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -66,7 +66,6 @@
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

