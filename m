Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522580;
	b=Vdbbp8cYNNz62L6/S59dxTEJjpqKVh7CA0/ZaZn2jXl8X8epqLMMcLgohiWtcdfeId9Z
	 R7u7t46ZphlxkRw6LOO07fpBfhzCPbAzQ3XIBZHtxtKJj1LHMWiZ5+GRYv+6Wt9RYHVvg
	 sJSce537gku5Q6vPgwG/rlMTt8B3zaHiu0MGokCru9AHyBp8IITF1A2nLNSWvk3aUsF6r
	 50nBx/LD/8V1u+HB9CQVb7UU2iJ5DPbjg/MnTwMsh7B4sOIkgbjfpC98tshX3uDm3AGwX
	 KC6/7u0GrvI8/Gm2TMOWQeiA0wcToJF3CN4MzzQmYRpB1mm7EjIFNlRZIgOw7ykJRiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522580;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZsGGYXWDuEAPZyeN8P880JLDy4GjUNE8fC94ZgoIpmM=;
	b=wSqM/wlx0QqfcJaI3Ip43WyA6NAMOwTbA1f6QQML8c66NjtiJ0UlUS+yFgBRM6QiQb8q
	 XPE7MLP8QnolkCLstXiIiiO/IxbwWwDZNp80A2zP6mmrekZupe0OcgEMuD85GlAQIZyWQ
	 ZtABkcJhDke0nJtn1r4PCNw7mYEHK8XsrvWAH9/z/daZLEKG0b/2UlnvbhbpptL58uXCe
	 moza4HXookfMFEsgjGujgKC6+/y7Kwmwx5ssFs4jB9KNuudxnXXyoEfFtoYiyBYvR7ia5
	 We/KfGr/NU2YK/n4OWc5OJptQ2oN49pfbx0D2vGVJsh+UkJTQr2vSWQEhSudnY4kAnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DLywCx7V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="HTo/7HJA";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CE5606A327
	for <dmaengine@vger.kernel.org>; Tue, 24 Nov 2026 12:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2CE5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DLywCx7V;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HTo/7HJA
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuflq1025411
	for <dmaengine@vger.kernel.org>; Tue, 24 Nov 2026 12:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZsGGYXWDuEAPZyeN8P880JLDy4GjUNE8fC94ZgoIpmM=; b=DLywCx7VIF2etErr
	6/pg/2IJDYM2z4mJ0hQ4hcgCsPlCa3TtUijIegMrSptOT4gF1l0Yg+lTcfJ+DuXg
	uQuADbfcHe3sbS6B32qwvvNNOpe1IuXxrYe796vilRKuGD1MAAZ8TDr3gP/grFIx
	NnQp2Olb/saku5yjsaWCP3cWtAvbzStHGk/I/DZc1/RyGjbnVhoGqIM8KbN8YVg+
	biDZSlGGtW4FTyXbNj/gG+GurOMyDS5lTYQeOL/PhLxJERv5fACAzOBs1RW/iH68
	Vh61/I1CQ+VdiDRYSMFhd6TXk/ei5DyDYpOFAbTWUBsW4WIp/s0R12+AIxtGG9Vc
	HeL4Ug==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt2mp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 24 Nov 2026 12:16:19 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so3414580b3a.1
        for <dmaengine@vger.kernel.org>; Tue, 24 Nov 2026 04:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795522578; x=1796127378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZsGGYXWDuEAPZyeN8P880JLDy4GjUNE8fC94ZgoIpmM=;
        b=HTo/7HJAEFaRVK5Wvgiol6t7ZENfcCUcfL3F+CIFFqe8/dHFqUqxwYOGMotOn5SL3K
         /LS8eKx9Zz6P2O4oogUu5pGK7imz4XUc8F9J7wcghHUohuDysurE+uXUzP68kMiRlxJq
         wu/ut8eiIXbbzNn9d+QO85S/vstmFZMGS0CvuPQkLhe2Q4z0TOhnQPQ3gM1vqDMqLULO
         hq21wWptutn5NxBxZgRHe80xlEHhDmlMSC2jR+FyP15gs452n6XFWV7iA6fTYrVL9cB4
         bf946A7QfzYgTva7jjAoYjQpQAa7fhfi5TWv55gZFVSHmNldDPz0jtIW2epoxE9wbwot
         YDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522578; x=1796127378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsGGYXWDuEAPZyeN8P880JLDy4GjUNE8fC94ZgoIpmM=;
        b=aKjVeCIZb12nsUswPNCoi6Snwhs2+JwBM2a2HVffW3cE9hHfwWJdggOgsvVgoCVeZv
         O2uPHuxLGvUZvPvqcikWg6uh0YnHJ/edQ5q2INlftaOopLplO9sSEhzT2OuyCmHPwz8+
         ihRsC/uEQe6P747nQ4FeumnhhnDSKley2maBpyrtT6KD7bE49KHYP97jCC/8aWUTB6fK
         iS3ZOPhDWgSjZMyUStmC/WhSeMvWIf+88LcGLQaWdptPGCmjwPaf9IkaqmK6dy5gpZhw
         3gKAzkNxFo+3Zh1W6j0D9pjICmJx00sXSYGqSb6FwE9gJXeCVG2f0VPqlqDE7ZRGlSEG
         ClLA==
X-Forwarded-Encrypted: i=1; AL+hErE2RzFJ8anVE4F/mH+S4TaDXxrxJx6Wc6bKyNul6z0fJph19KwVVDv11k1L59Uu4a9+iS13zRI0qo0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wlNnOXmr4RTOC7s9fnC56v6KCS8+xhlyFsb2FXGpK6LtlkS5q
	E/MMKn6OmlLd4z8CALQ7VUDgdF9GOzqiKatJc924nURcss5qn63nGn2as6QffMeXC12xR2655sg
	Jo11r2etBJ5yeiybetrmGj/NsBX+WvJB0d4RMIvRD6+Uh4jlEz6yYPI+aGHPYqN4=
X-Gm-Gg: AZFdTZe5wdJXJX0R/tKSfEPoX5zARsbGM/3l5wb2cDjd/BMDVN3zO5kn2dF3E0TNkll
	X3NVCG3vs6v1zktJkyKwlJCLn5Fa1VcSS7bvoOhpCAVF32oW6AlY9XPcA+axL0x22jWa212rGQd
	0eXgcL+xqEbtoudxuETRYv2Ofh1KBKO8FS81T0gSA2bmMVPNDpxf9bxJ95VOK6jBVgn5y0Dzu6n
	8bk01hyK4yRsC9GQ+f/JZnHo4bNZ7uiIET8IBfgrkftYags0xKbdzlzKyXzjg1w2voeJr/SDHAu
	s5MC6TO0LgQmPTC+KyrRPSiZxD8RIwnNf3CFWOj5W0SbM2ls98l8LBuVDfENURD54CniP9bBoXG
	pm5iXF+K1U3B9RtfGttI5+cjDs3DkgkgQqPcKkQckPLshuHJ1wHtoo0Dh/Z0NbO7wzc3eGIZbsZ
	TuTIpX+N14
X-Received: by 2002:a05:6a00:44c7:b0:886:5938:cdd4 with SMTP id d2e1a72fcca58-8c87baccf21mr12944492b3a.19.1795522578364;
        Tue, 24 Nov 2026 04:16:18 -0800 (PST)
X-Received: by 2002:a05:6a00:44c7:b0:886:5938:cdd4 with SMTP id d2e1a72fcca58-8c87baccf21mr12944474b3a.19.1795522577871;
        Tue, 24 Nov 2026 04:16:17 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8706844a0sm7245572b3a.1.2026.11.24.04.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:16:17 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 17:45:23 +0530
Subject: [PATCH v2 2/6] dt-bindings: dma: qcom-gpi: Add QSPI protocol
 identifier
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
Message-Id: <20261124-qspi_qup_upstream-v2-2-cd69894107c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795522563; l=1017;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=EEx2Qf9ht9RV2ShxIZ5R8hgTYqT6216fgvKWmMYEzDw=;
 b=MgqTwicYRlvJgrM+Ti/uoSQignoLBWDzOxIHDD22f7YmBLV3491zS+retoQpIsYP5p+DKHrhf
 mKE2Qd6sMgCCVjhNsFOTSJZT/LrZ8iIqqNAz5nUPLgwvYkHYqWm4gyL
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfXxDhvUKJpoJ4M
 F0Rm50PRVPFRBlozkQ3vIqFLCfOyvpu9eE6uY4I/O3F73qEsJDpbBcwstGJ2pATa80E7RgBMbXf
 nZ453BXaVdfCV8w79xX6Zq2Ia//J7eM=
X-Proofpoint-GUID: gwMp_yjz2cOk5wscyYmtEvs__SEp5Zy7
X-Proofpoint-ORIG-GUID: gwMp_yjz2cOk5wscyYmtEvs__SEp5Zy7
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b058013 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XDCUMzA_0XyrBmuHy_cA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX2QczRf5oSaC8
 minCQQb4jB95DIxmcCs7ppAe+KrIrQ1CYmGicGGyWw83UQCwsYHtbRCvZ2tmVnAWgQTux/XgDzD
 GiRKAsXSUWn7Uc7W9wh+2I4cQfP3qGRbCN+T2yInTW9XOWyTOtt6PoehoXxDT+aY6mpf8pZ1otE
 BP+2a1Nquq6y+Cu7uyaQYQJdC+hrXC+aTkkjEf+OcVT3U0YjP374bf4nRzzEaTDPaZfPJD1Wq93
 kCGDZt2Al3a8rMvUr8GwGlzIEVsVBp9y2+gtIuRVp5JiIgCnHmAxtlyrCRfMJE3qp4yngsPE6+V
 oQDvIJydskDcH+t8btYxsD7YTTxZtVgTnoWwJruuuvbtTO+TCIOJGRfpr3h7nAhEY+0BeXIcMey
 w1IzjWUGWncB6VOD7XYIB1pFwGF/vcIgQxCRIRULlfZ+zgED58dQymxhlrRIGBiuh+56GYX491a
 MrObjYvp4iRepq8HQ+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240047

Qualcomm GPI DMA supports transfers for peripherals using serial
protocols such as SPI and I2C. The third argument of each DMA specifier
identifies the client protocol so the GPI driver can configure the
channel and generate the appropriate transfer descriptors.

Add QCOM_GPI_QSPI with value 6 to identify QSPI TX and RX channels in
the dmas property. This is a DT client identifier, independent of the
hardware protocol encoding used by the GPI driver.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 include/dt-bindings/dma/qcom-gpi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/dma/qcom-gpi.h b/include/dt-bindings/dma/qcom-gpi.h
index ebda2a37f52a..50fdfc5fd9a5 100644
--- a/include/dt-bindings/dma/qcom-gpi.h
+++ b/include/dt-bindings/dma/qcom-gpi.h
@@ -7,5 +7,6 @@
 #define QCOM_GPI_SPI		1
 #define QCOM_GPI_UART		2
 #define QCOM_GPI_I2C		3
+#define QCOM_GPI_QSPI		6
 
 #endif /* __DT_BINDINGS_DMA_QCOM_GPI_H__ */

-- 
2.34.1

