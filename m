Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522571;
	b=lGRPSxdLMAgZVfnSeXQEXfZ5InkCrqtoni4rYMNJrCYHm79EkDNkik25QGb9t/VdRaGt
	 wvl6O4yK0xUplYC53y/h7rk1vp7OtrAnN+xRt+5jpR1zmn6d/v6+Ikbl9aJNJ6MQpAom1
	 9aauDnVF7UHQL1omMGlXwmqzFf76ibrMO6R4GzugroGZRPf2j0wz66Xfm+fu8RLHe/CVk
	 aum3X2dUdrhWo3LcofYWSLbMI5pZB5n951DhzjDVtHTbIKlWZp1xaW03ISTodoSyfABFp
	 avaBbQATN17rG1AtK9WMkvrqPYj9vvmJX13vbirMMvFMGEtN5o7efAW3dCESXoCfoyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522571;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ixFK06xgvrfX8joDhud1rnO4Ij9um41EYO6B2Y6KWgg=;
	b=1tM1ZiTKRwL9Q0SYSd0Ds2O2Lhi+gfijMoGok5HBL+9OANMvOiFcyMEZx6bJE5uXPv+/
	 y7gli/hr8A1QShNBdjNzbCLeljV1Eg74iY8Qn7wSjoSwO3ubybl3bsetj2Wn7ovaaRbq+
	 vGVVyw/fnvW76J68e74kcwqGhmZdp0tiHaFV/D80cUy8MLPgnbXxiWIv/ch5L0mJlJXDd
	 1c1upJ/6/3YOEGVOFBIIX06qbeSmMIsAKI9rQPxbl038Q1OR8tXRjsIS1+2fU9faozko9
	 9hnxO+faEFOhSU8hnfJGlJQAVDlY3bZ7Buft+bH2HydojvMp07yKGZVzO88evnBFd9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZLunYTpP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ajSCe/np";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6F4606A322
	for <dmaengine@vger.kernel.org>; Tue, 24 Nov 2026 12:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC6F4606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZLunYTpP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ajSCe/np
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuV2E1736766
	for <dmaengine@vger.kernel.org>; Tue, 24 Nov 2026 12:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ixFK06xgvrfX8joDhud1rn
	O4Ij9um41EYO6B2Y6KWgg=; b=ZLunYTpPF7UJIGaFnz4hnuMYf7ftnsRkA2ZOEV
	PF8xI2+zq9hSG/Na7WMkxyjR6BKEtB63YPEJqbtVKYZoOocFrnt5pJe5HcEBhjCm
	muMA9NihnFy0UtDv0w2WAJjPXgzI9Ws4TS06JoVe+7H3R7Z1f7N0Bm2zSTdGqN7i
	LnI+TwK/shXgWo7B+NCIY64GvixmguIgW/yDDFd5gq0TDBQQcAzUBlEp8zgscUvu
	uDnCqYI9lfCfRLauff7oFl1YE9YM8bBkXi8mksNzMGIRwTuRlcFrrT6gQHVXY+v1
	8FxmBbCeVNJxVdgNIxNUIE9nxgZdmpNVa/vVCdosGCno+ROw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd2n17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 24 Nov 2026 12:16:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b5e3b5daffso4762533b3a.2
        for <dmaengine@vger.kernel.org>; Tue, 24 Nov 2026 04:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795522569; x=1796127369; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ixFK06xgvrfX8joDhud1rnO4Ij9um41EYO6B2Y6KWgg=;
        b=ajSCe/np4yhWPViUQLNx5fuXvdoY7vzo4UaeTrbBI/YF8z7WOeouJF8LU3RfhCuNK3
         orVufJ+S44p9MiRUO5BRsL1izEBVWVTKONSkQNO3QrLzqE3o+d/a24CmQU0WuGhl9XWH
         2AGGNSFkjcZCiPinAsfmcC3UbvCND90FEoXk2g6DKC6MOhj944cNQ5x85kG3vCHh6Q6h
         Wwyukgnt6Da/2X1Gd3HShTmJi1h8IJfYb1vQppM48AfpZpBSk5xO1zOjw2znCXhiQVI1
         8qx/QrUh2jAUpIqhSjc7Dz9aEqTFNBG5k1+BWHwTry/DwZ5p8wOhsCxMpQqeDj/Bx43o
         LNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522569; x=1796127369;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ixFK06xgvrfX8joDhud1rnO4Ij9um41EYO6B2Y6KWgg=;
        b=rhiClzINboau12C7x6X+cj1SKm2cgnM1GfF2M3AoppETKXUAg0pu/+uUvBChwWNfCk
         ssJgZco7FU6+kQKefPAYl+as9l8VdNy0aUCFmMn+16CJIQpq4BROrCmQosOXzEXYYWul
         a5+EADIB0Z7T6dmsYreSxjjvoLbT8vwOLvX0gs9ZKta/VVLWM8OTOg3QOCJ+QEQTG86q
         nYvNC1m+7XuhOQWmkfJSoru8yru2rj+Tlwp0jZAv9B11VU/Nc6yL0EtUeXgduyuKQYje
         vHnFX8zM2CIS/4PNBxsM+wQ1xpScMEedYLoZOsDg7yem9D1ALjf+6rqR6OwmS2nTB9H3
         +7Mg==
X-Forwarded-Encrypted: i=1; AL+hErG2PZ0+iac/WF/aGO9cl3so1O+ZWZpGskvpMGiqBPmHxI6FkXgeJU355enWe4L6WF3iScLMYpcilIM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QAATeHUobiNF2APXLwU/5UEOMNwd0STHqp5ASf4SwjkcnmrVJ
	30Y7ZmYyowlwuSIMUOyE/7nuyYqg3IFzJFNUeFFNKeeKsXCG39WbTYTblcTIkTf8Ru8363HFBNc
	QmX8VNkV3GO19xaZFvWLYlH8xq9AsDbixtkGe7RmzyyoE6KyLBNpPUcwOsoQOd5k=
X-Gm-Gg: AZFdTZeDpuZHm8nwjp8evtrIGEIdp1/uiyvo0GW/Eu18gQeKKizxj+idjJqIEIGQxdZ
	tINYII8kpTMQU4sKCNvZwxwB3MEeKVAonNa6DA7N3FnqdNEG69CnM+JzZIoMj3UyBOyJZkjv3j5
	DjC6M2e6uQgl4FVzBLD4teZm7qDL69Jod2c8/T3imIHHTR6G0QvvV0/0yqpWPWFWhjNuLYVxAVq
	Tt/4l8/Sp2NFJ8FjM3SpV0EQ3K39fKXvO8caBG6NaAP9Hlx7PbskC3UIFWkCFl6OdQBoJJJL4/k
	cuwHG0fkkCyRImou2tU7C6Q2UNpsCVTv/IPgVY/ixVYjMOofdye+rVLjj1wJENFDWlzzg/dbAta
	qM2H7IkC3GHa5FJIqamv5DKLVXXZgWRxJIWargILtCFX3LTwgGYw4Pf8lxmg0HFK6MEsymDC/2I
	M7BwTzt6ys
X-Received: by 2002:a05:6a00:2da9:b0:881:8b53:f66 with SMTP id d2e1a72fcca58-8c87bfa7ad6mr12424561b3a.24.1795522568545;
        Tue, 24 Nov 2026 04:16:08 -0800 (PST)
X-Received: by 2002:a05:6a00:2da9:b0:881:8b53:f66 with SMTP id d2e1a72fcca58-8c87bfa7ad6mr12424531b3a.24.1795522568064;
        Tue, 24 Nov 2026 04:16:08 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8706844a0sm7245572b3a.1.2026.11.24.04.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:16:07 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Subject: [PATCH v2 0/6] spi: qcom-geni: Add QSPI support over GPI DMA
Date: Tue, 24 Nov 2026 17:45:21 +0530
Message-Id: <20261124-qspi_qup_upstream-v2-0-cd69894107c8@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIANl/BWsC/zWOQQqDMBBFr1KybmSSSGq76j2KiNVYp1QTM0Zax
 Ls3Km4+PPjz5s+MjEdD7HaamTcTEto+gjyfWNWW/ctwrCMzCVILAVc+kMNiCK4IjkZvyo4rLS+
 ZBgUqAxbvnDcNfjfnI9+ZwvNtqnEVrY0WabT+tz2dxNo7/Hr3H+5iX8cnwYFL0aQKUlnXGu6WK
 BlC+als1yUxWL4syx/Dy5rfzgAAAA==
X-Change-ID: 20261109-qspi_qup_upstream-362786030380
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795522563; l=3465;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=3x7IxR30b+fLOfBMjoTm3GrgxyaudUYG6eqo2xPRnfI=;
 b=lDtuZG2j5Mukp/INOFK+JuYBrMSCPgCmCUqnsf/f+LCEc1IcMMZNzjBIHmjAAyMmMUkm2LKdq
 DdOYe/80gzUDp6J/uZuMfRLqkoq1Wj7bl/U64HaOIz3MzyYBKaXjAvN
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b058009 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=itYn7UiM_CVZcFK5LroA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX7dWd7qQA6dt8
 XY/MW21outHx/3hQssGRmRBHLEFR9F0nwPT0Hw8PPdRXqPFBlpMqUfO+tA7bvPOHJ9VsA8yJdEE
 sTVAH0l8C+RrCNVL0sHpZSa+nwOOkK+OvFsN3vwaw5K9H0jWd3axAghbmhMYci4oQfZX2uwEf0w
 N3QwaFyguWeeYiqew+hXaSpJalsgoAK+fv/uLVEy5Py2+Or+NDFSHyfXPwIcyQdsE+w6iiFYx+k
 Uaiwdv/9VLqnHfy5C5TT3VveZZSd4ylFcqfidHQ/4a65oS4zdne92ktDQPemTNtGfemtIcX7hAO
 bkaKTNlz/1N3/g7S7vaC/B9AOAp3YHhnktQcKeWxep826hdygP9z/MZt8SB9tj7r28ma74L9GlP
 0z95gGDKmAR4Asa4+3gBQn/8kYpdjVHfnKUG6kbFUOOuyC601drpFmI71g7kZO9i21iUBJ0h05D
 mMeVELXlRtVKmznwAJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX9aBmRX5PMhSv
 J856lUtRhlD+KCyWb6VXCduwgMXYTvrGxJNU7qCxwQhgd3AKR+sWVlXw+qCyDqllsiPRRHDGUi9
 E3gySgiQMqkbMrysny3N6GLf5wgzMjo=
X-Proofpoint-ORIG-GUID: r8772uWIjQ0-nBOGAU7Rs8f-kSjxfRhu
X-Proofpoint-GUID: r8772uWIjQ0-nBOGAU7Rs8f-kSjxfRhu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240047

This series adds QSPI support to the Qualcomm GENI SPI driver using
GPI DMA. It supports single, dual and quad SDR transfers in controller
mode.

GENI QSPI reads require a command/address TX phase, an optional dummy
phase and an RX data phase to execute as one hardware command. Add
driver-managed message sequencing to combine these SPI transfers
into a single SPI_TX_RX command.

The series is organized as follows:

1. Add transfer_one_message() support, including completion handling,
   GPIO chip-select sequencing, delays and DMA buffer synchronization.

2. Define QCOM_GPI_QSPI for identifying QSPI channels in GPI DMA
   specifiers.

3. Document the qcom,geni-qspi compatible.

4. Define GENI_SE_QSPI and update the firmware loader to accept the
   QSPI protocol.

5. Add QSPI CONFIG0 and GO TRE formatting to the GPI driver, including
   dummy cycles, transfer mode and the TX-then-RX command.

6. Add QSPI support to the SPI driver, combining read phases and
   accounting for them in message length, DMA synchronization and
   timeout calculations.

SPI and QSPI transfers have been tested using native GENI chip-select.
GPIO chip-select handling has not been tested on hardware.

---
Changes in v2:
- Rebase onto linux-next next-20261120, preserving the newer SPI target
  ready-GPIO, shutdown and panic notifier support.
- Use designated initializers for all protocol-name table entries.
- Use DT client identifier 6 for QSPI and translate it to hardware
  protocol encoding 9 in the GPI driver.
- Clarify the DMA and SPI binding commit descriptions.
- Use the DMA callback helper for QSPI receive completion.
- Link to v1:
  https://lore.kernel.org/all/20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com/

To: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Cc: dmaengine@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

---
Jyothi Kumar Seerapu (6):
      spi: spi-geni-qcom: Add transfer_one_message() support
      dt-bindings: dma: qcom-gpi: Add QSPI protocol identifier
      dt-bindings: spi: qcom,spi-geni-qcom: Document QSPI support
      soc: qcom: geni-se: Define the QSPI firmware protocol
      dmaengine: qcom: gpi: Add QSPI protocol support
      spi: spi-geni-qcom: Add QSPI support over GPI DMA

 .../bindings/spi/qcom,spi-geni-qcom.yaml           |   8 +-
 drivers/dma/qcom/gpi.c                             |  32 +-
 drivers/soc/qcom/qcom-geni-se.c                    |  12 +-
 drivers/spi/spi-geni-qcom.c                        | 453 ++++++++++++++++++---
 include/dt-bindings/dma/qcom-gpi.h                 |   1 +
 include/linux/dma/qcom-gpi-dma.h                   |   6 +
 include/linux/soc/qcom/geni-se.h                   |   1 +
 7 files changed, 458 insertions(+), 55 deletions(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261109-qspi_qup_upstream-362786030380

Best regards,
--  
Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

