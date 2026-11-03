Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696215;
	b=Xuv2YqYoOstCMTmHWOMJOrQJayYkYvdDn6NgImXnF9Wk6X1y8wqfQwoLNA1wg98avcMp
	 XFYr212vcESImxVg+zViRBvMj0aZ2WXUpYhtz0fOmA1oPIKAG6D6+bsHW9uw9Hnzlr54o
	 Yr8L0bIxFVp+xP9D3K8VOkv2VW+wmUxBwff7E/b79YE5sBQ7jZgOPDcAb3q8u2zRyHmwh
	 uG0FbTjD3oPaG37ox48hpPW8YqKK7apT1bTHRJsLUHqQRJZMkQCpeaNWnvFkILD+UUzUW
	 In/4oth1Et0sW/VFumMYWSIOwBVUccword8zycGvHEGFROrlMZfceOAh6QrDflo9uFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696215;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FEecnKLlXzt/HC9JpeSUXiTjYz2aMCqEmF5O57ZyRuI=;
	b=KfP86evucQ1Ks86t4Xj+3ZTHhSCBpwwZ/wkViYNqLEun1Mu8zFwC354xFeSA/XcMnbWp
	 Se4yULkwRSd4kDyclB/daM6RH3zt2iiqhfQm9Knh9q5F00Ix+YQMzElLn0fZT20RCbGtk
	 R78+Lu7ozOxXtACwPFJYsZ8M9FBSuKUt/vU7hofP+z2UovScpR0807YWnT8qc1QqB/uru
	 Y3fnWEkmaaz/Y6Z3w4GRM7H/J3cM8i9pc2VMV9cLxoWEj1Or+FKE7sry4dAJAKjpBTrIq
	 6RUju/CBY0K+BvZ9Ddq1o3WBBK2XcgbdNZ0VIKYU1FSziP/sXaEHaCbyLGQU83JEUpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Db5AuDi0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Ueftq/vJ";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A141606D808
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 08:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A141606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Db5AuDi0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ueftq/vJ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37tZ6Q1434036
	for <dmaengine@vger.kernel.org>; Tue, 3 Nov 2026 08:56:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FEecnKLlXzt/HC9JpeSUXiTjYz2aMCqEmF5O57ZyRuI=; b=Db5AuDi01MN2yu2a
	G1d32ld1CpAkrhy+vN4Wt1WUOw3gfJ4LCOrZq22vhr3I++KLkNOnx/wDwSH5OpXx
	E0FFbq65dmJB9SPbjYDRnsUgChun4OrnlR4+Z6ruBQThrM0A2pml+xULZ/+cSuwE
	FV2ycgEqZ6fGlrhJU/OCpvZwivqZQQurCvxg1jKbzY8gR0xj4LwEbPN+ViC+D0B9
	N5QkWff4/lvwJhfI1txxIobldpsnV5ENZ8cUFZJifDssLHpitbTOm9e8tP/x0ged
	3/Yd3lOteP7pZ2vnsH+7QAbytt7INufhDf+CyRqwfBrX/CZZaNA27/wjJEUfup8B
	L8VtNw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2acj9fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 08:56:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a065d0e9deso418708b3a.0
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 00:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793696213; x=1794301013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FEecnKLlXzt/HC9JpeSUXiTjYz2aMCqEmF5O57ZyRuI=;
        b=Ueftq/vJliox2wciwor9mup82fHjfif2JDwgGiFfTnOxiWy7hepW2K91YfZE9ydXn+
         RPICT5v0Ijzx7o3nX5N2rEOE87BuowlYe/U2NHUF/XZWGgQfhV/ZVXHx7Dmk3jz6comp
         hLt2ybetW0EWSi0Lpfb+IYCsqxcOekOR+A3bQQQ6lSXHqbehWZfjRBFdu1rIEPGJ8lVU
         JB/gCAwwkrzvsU/gNzVMZxIQrfoI087KqgKag42WgZOHE6zM4ii6lQk3ABYV64bkr3eb
         ceFjBvQF7Y+Z7MMwGJcpKZdZgRe99ngIcrBLF7d1e550hkZkkTzN1E2I08x12betV9XM
         bq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696213; x=1794301013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FEecnKLlXzt/HC9JpeSUXiTjYz2aMCqEmF5O57ZyRuI=;
        b=a/qqolc49g7+pnk+UbsGkOM+SU0P3gDYSLSSmKiuT3NeLexcYFbwNEcx3eTzVwbClF
         x1EBlsyIvmx+0QTlirMfCctfWj/VXLM1ywFscQG0CItE5maXF93y4NvKE3mfQyPO2yCE
         4gFDUtkl5O+BN7xvtA2Z9yzlRAOL8KxttPCUw1xp2hlqh31KJrKAfEWaPu8PLtw1/a8Q
         6ppJ4PnE+9y1oofIU+XUFSySYm8W7vmKJZE5lNoa9pMdX1Kq4xd2qibPjLnFVuJWH0Vd
         xkW6xCV21GBqhHBsb2Wbbyt4ta3O0aNJYihc+hMECQ+rGg0pNYhqiDGM4Fitn0in/u/C
         Uc6Q==
X-Forwarded-Encrypted: i=1; AKwUvBx5fW9E8ShynEUA2GG7N7l9xZnDv6obfHbD99McYsuhcmI/u8VPrcggk/gyEHeiLmFcPGEmVDjA7ok=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e4bJpV9euJFnjJMxyuO09xzZYAE2LZ1UrNaYxFAbE8b2UvYHi
	4D3PK51BUMn5o0xypTXS4WfXC+V5wr1pV+ywVpHnc/cmO9sgaTPELmsID275iqI+OPpKXgCucWC
	5LXDJctZrN3LJoucmlomR0X953/ZS6AztCr8oBKMxy6KYHEPZBhQag41QanUATI8=
X-Gm-Gg: AYBFou2zl2sne/RmzYKfap8K2CF6FCchM8mLIScbM0WhPpwWETTAWYnq31rhFaIgCo7
	iimr1zW3/Nb4UL3FFDRO9e/tPnCD1PQwOlCyPVEBNbeLgv9wcr3slekf1jy1yT2h49RnTi4lJ+4
	rQzDtLoIRYa9As0Mcbn8A8lbmuelzy/l3cFHqeV8ZmCcDAN5lMtzsXV9ci2g59BIBc1UIyuwpTH
	5Q0s+dn9z4cMHAK11tbj6Sd5CWyJaIYdbUkItkfzKDK3ZeTTYMonE5n9tlrgESbgBMz8WdHchog
	/iNGjogpD87+53qFqU9E7rOCvWnih5uWnBHjvkBXa1OD8k3skYR47KhMHVFRmlqpppy3S8mmL7i
	JItWlgo8DhJO198SLQkZMsFv1dQYgQIFeN45rCxSo5HrdGQ/Jigdq6LR8LBJHvUsVBaRtO1mzpN
	OILpS6nOM=
X-Received: by 2002:a05:6a00:1792:b0:898:3e:3101 with SMTP id d2e1a72fcca58-8a83279ca2bmr9271205b3a.31.1793696212916;
        Tue, 03 Nov 2026 00:56:52 -0800 (PST)
X-Received: by 2002:a05:6a00:1792:b0:898:3e:3101 with SMTP id d2e1a72fcca58-8a83279ca2bmr9271192b3a.31.1793696212415;
        Tue, 03 Nov 2026 00:56:52 -0800 (PST)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963cfe7sm3017471b3a.19.2026.11.03.00.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:56:51 -0800 (PST)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 14:26:40 +0530
Subject: [PATCH v4 1/3] dmaengine: qcom: gpi: Add I2C bus recovery opcode
 support
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
Message-Id: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-1-59b3ce96dc4b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793696204; l=3975;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=t+OViUYZuF5AFBgpyu9xH8efZnLrbkVXvRT0Slsn2no=;
 b=a69btCBagvIzcUI6hNcBXZCtadlEZWWQEH4tF480cm/o+fqmBEl0K5kEMgArZDDFskH999W9G
 oI+s9teFjmPBhUVDmwRrQzJmAbqKmwbHqypCGDB+e8RjkmI0FDJbbyy
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae9a1d6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=6qpgm5iOkbbos6gE2JIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNSBTYWx0ZWRfX6iuj/KBuy0wI
 bCfbbNX3MzEoRtKUDOoNz+4QCbPKUxFV79s/P+ONllyxgMKTi8NOdIUcWVPeRa5YYsgcnUUninm
 brmz14Gk/nGEVkPqDdLjBTKR7833zeweuRbrFwmBcGyLlZV7YgFtHt3GnXf0zDyBtVcCpPgGneM
 A3BP36FQ4GXYhCbuR/D5fq7a+ebulDiXBVyQekGebIkXjfAFbMia68bd/ymjr88CjrIMnm3cA9s
 qck6SXO77Wm/yUfFF89dHBl9AoK9iuF+GKXkmc9BvaUy9k26rXFTLz5FLniSQ4Xo8+kP+WFmIzB
 zFCbmQa6lOqIJNxUY9Q1gDH6hKOGouy7UAbJUovg948KEP1QsNUL6appAStyEvrwx3AVJHWdeVv
 Sntcc1NyD2wQrTR0/j4qGrrqwBh+5FoiCwfPBIrILg1WTXLOZsNmdTksSqPpLpBwNfosb5sMlLw
 aS7luXJiir2bHyaQpGw==
X-Proofpoint-GUID: 1sq19-pKsUNQ7NATN3Pny0uSkkIIUwRm
X-Proofpoint-ORIG-GUID: 1sq19-pKsUNQ7NATN3Pny0uSkkIIUwRm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNSBTYWx0ZWRfX3FnuyzPCyRqT
 HpH0jxDGRFi5PHS+Qc7JSgRumQsL8jDYMG36J4xQANj+W3NjcO090OxLb60vqxJBrwrOHSmYqrW
 NTEzw5ilTk5c9hScMlBUJZGXNWRr4qg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030035

The I2C_BUS_CLEAR and I2C_STOP_ON_BUS GENI sequencer opcodes release a
stuck I2C bus, but the GPI DMA driver has no way to emit these
zero-payload control commands, so an I2C controller using GPI DMA
cannot recover the bus.

Add I2C_BUS_CLEAR and I2C_STOP_ON_BUS to enum i2c_op so I2C drivers can
request them through gpi_i2c_config.op. Handle them in
gpi_create_i2c_tre() by emitting a CONFIG TRE (when set_config is set)
followed by a GO TRE with IEOT set and no DMA TRE, and reserve the
matching number of ring entries in gpi_prep_slave_sg().

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
 drivers/dma/qcom/gpi.c             | 30 ++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-qcom-geni.c |  2 --
 include/linux/dma/qcom-gpi-dma.h   |  2 ++
 3 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index c41bfac65ddf..3dda58e6a99d 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -1620,6 +1620,17 @@ gpi_peripheral_config(struct dma_chan *chan, struct dma_slave_config *config)
 	return 0;
 }
 
+static void gpi_create_i2c_go_recovery_tre(struct gpi_i2c_config *i2c,
+					   struct gpi_tre *tre)
+{
+	tre->dword[0] = u32_encode_bits(i2c->op, TRE_I2C_GO_CMD);
+	tre->dword[1] = 0;
+	tre->dword[2] = 0;
+
+	tre->dword[3] = u32_encode_bits(TRE_TYPE_GO, TRE_FLAGS_TYPE);
+	tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
+}
+
 static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 			      struct scatterlist *sgl, enum dma_transfer_direction direction,
 			      unsigned long flags)
@@ -1650,6 +1661,12 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
 	}
 
+	if (i2c->op == I2C_BUS_CLEAR || i2c->op == I2C_STOP_ON_BUS) {
+		gpi_create_i2c_go_recovery_tre(i2c, &desc->tre[tre_idx]);
+		tre_idx++;
+		goto log_tre;
+	}
+
 	/* create the GO tre for Tx */
 	if (i2c->op == I2C_WRITE) {
 		tre = &desc->tre[tre_idx];
@@ -1692,6 +1709,7 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
 	}
 
+log_tre:
 	for (i = 0; i < tre_idx; i++)
 		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
 			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
@@ -1825,6 +1843,18 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 		nr_tre = 2;
 	if (direction == DMA_DEV_TO_MEM) /* rx */
 		nr_tre = 1;
+	/*
+	 * Recovery opcodes do not require DMA data TREs, only CONFIG
+	 * (for set_config) and GO TREs. Since gpi_prep_slave_sg() is
+	 * common to all protocols, verify the channel is I2C before
+	 * accessing the configuration data.
+	 */
+	if (gchan->protocol == QCOM_GPI_I2C) {
+		struct gpi_i2c_config *i2c = gchan->config;
+
+		if (i2c->op == I2C_BUS_CLEAR || i2c->op == I2C_STOP_ON_BUS)
+			nr_tre = set_config ? 2 : 1;
+	}
 
 	/* calculate # of elements required & available */
 	nr = gpi_ring_num_elements_avail(ch_ring);
diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 5cc47b670bd1..60b6273f538c 100644
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
diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
index 332be28427e4..b9b75c302825 100644
--- a/include/linux/dma/qcom-gpi-dma.h
+++ b/include/linux/dma/qcom-gpi-dma.h
@@ -52,6 +52,8 @@ struct gpi_spi_config {
 enum i2c_op {
 	I2C_WRITE = 1,
 	I2C_READ,
+	I2C_BUS_CLEAR = 6,
+	I2C_STOP_ON_BUS,
 };
 
 /**

-- 
2.34.1

