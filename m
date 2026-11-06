Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977318;
	b=E/bflVHkB0dfzn2+gHFjdsg1BrmHtJkxOLTThwkLIorIdMZB0DkAAlIhptfSgVkIvmCo
	 AdO4YqmKhkU2OGfN1B8fCPvTqiyIZZRyvkCRRynfSnTPcDVoi79xoQlPkV/fXyIW2wJGM
	 Tb5x9UaR/BLVzwMyPH2VmLA2vFOZSVLYcAJo61M13MZ2/7w9rHRYMFmnTr4nbP5Uvxoq6
	 ma7cMNHNrqDm/dqXqmfXJ42yK+JL5FeLiYfUZDT0Ma55RCdsT5ujku2yTLyUwgM1jSF/B
	 NYQIkm4VAC0LY/qlYQ5jTFAR6TpjqEFbK8bAetos7WzxkSmhTvct3Xg5TYm5abMiPsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977318;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YlRX2h9r/M7y5/J/Ewe1L+KbEKnvM7owZqTGSJa2SZs=;
	b=K0REhn3sgMMAQTZhb4LlAW/ds6JjFpvpAyqmd8KQXCLc+IQkPg6nsSt3ghSetRAn8lnR
	 SNstupxNsetJpKLWZS3UcKYm8YxTVOTg+rFU0ZWU9IpqabaMIhYRtKdeLQNul91ebSGj+
	 P0hsm9Dxska4L6rI2ueTEoY+GnGA0DRo/nAfUkOMS9xJi9RqmBes1PoOsbYROScdFO1mO
	 3TRUOdXoaeJkE80P+eUBJE+QdWnmdZBxTQ3wM2EUL+ilx4HpxGqPZa1XN8GWcV/8GQ/vp
	 56m4e/Ki/SYAxHurMY0VCTUADoqbiJjMhjGZX8vlLAec+Q3+MXikxm6Ol6v7tFRV3uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IpPNuUns;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UH4mubwL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8DA606A333
	for <dmaengine@vger.kernel.org>; Fri,  6 Nov 2026 15:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A8DA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IpPNuUns;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UH4mubwL
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F03r9045199
	for <dmaengine@vger.kernel.org>; Fri, 6 Nov 2026 15:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YlRX2h9r/M7y5/J/Ewe1L+
	KbEKnvM7owZqTGSJa2SZs=; b=IpPNuUnsui2joIDxMx5HdCY8husIcj08vS9KY6
	ZUibYTbFfnKieTvHPHnTB7xwzC4mTuqLb+f+0Wekxqb0wCw/3r/RtUTlp6pcdxcK
	YRd+ReLYF8CywfaUnPAPe3kmLq3exlrCHcNESxBi8iUiWEYlJON+p0kLclKYF1yC
	heeq1p6JtLqNEPFyCR8MtS/2sHEwQMkMFQWfJGJnLEGaTpWj0CE6G8wQeTwB7F4X
	9mEUMZMcam2j6K7c69+HzuiwIF5u9GclPuAmQGXjh+TwcvIPsZ+OU650J/+3sEzH
	hF5s/DPr8+rR74xspjWIIbEmeI23CEkObHqqJF7WjLFi23aQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa37u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 06 Nov 2026 15:01:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd65070d3feso486007a12.0
        for <dmaengine@vger.kernel.org>; Fri, 06 Nov 2026 07:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977315; x=1794582115; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YlRX2h9r/M7y5/J/Ewe1L+KbEKnvM7owZqTGSJa2SZs=;
        b=UH4mubwLRNi+uA5+H3EJpU7sNt/MJXsY/PFrgk3BCGI271d3WKB9inw/qyxH8Nw4F6
         56pUKxYvZCM6neE4gsG2RyJTv+Jfb7efv6it/ddFK4I0ebn3pmL3Nmk5zF+QxJfW/LkV
         sE5d/w5FGMIMZmQgob6VGjoo0ekwhgCgamJxG9E/NDAtNKceCdRmPorR9xeeYDc9Dsp7
         rkoCS6ZqbUNKwWqZCOwrcKNnWx0jETy2ur34avWUW30J1geN+BjWtvvWM1roNJrnKpFL
         IU9e/OF6fx+v0/ThbwPA0d/d7RrotIRZ4E+jC6rKm/DTMo4mNxnOL75O/LtYXLqYblv8
         VxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977315; x=1794582115;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YlRX2h9r/M7y5/J/Ewe1L+KbEKnvM7owZqTGSJa2SZs=;
        b=dsB+dA4DT1uei3KqXUHbvOBpRiuW/N6UWc+PRLmtjeqOHbwiLhkJLwQm8Vk8yyh3bL
         Yc9HusgYac/S/JS0/BnHP/wlUlz0Jg0cmU4J3ntE24y59J1FKsBwr3af/Jgq/fzME3et
         BbmzFwS8COX8iWOiIJ1gfsysclFDXgk8G5dEHCyfUDc5gvTfSuqbrHOorFJ0iwJJs9z/
         reD2f8L7A0tqP5ChhMuKrtC1He5Yj1GcWHr+wpXIlaOskus2jkOOUKM+HP3U+W7V6eWt
         hJKB77V0D8PoUIpPM7ueHx83aAG7NHAdDg9oopqbSHOvdiPk3QqXKrKo7dhWFdvFTjsP
         O6iQ==
X-Forwarded-Encrypted: i=1; AL+hErGqupw8eQC5mghQYcn609YVzyIMsOGmz2S/es0SOLfMFHi9jFLkCmhsOcb5DPNckRSf0h++0t9+wRQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xJvpcUdeCTnJ9DDVB7YKbxtSUKvPYBxYsgxbvCKPuRoWyoTRL
	7Nq6lzROUdrxxMGvf6FoBXyzKr6n8Bo3xMS3mU60qKRs0YKzuOOwT+INNyvekALuMVJGyZv/6ug
	u84hP7tR/eYgu6Lrqauively/+fVBqAmN5D1rG8jvoyJ7kAJaY+4CAJN4GJmR3kA=
X-Gm-Gg: AYBFou3Wjzmp4TucgNUG6RbuTTkwXpZ7DW5WZ1izGynOI741PBKUMDWOcLPPkQj6lXn
	len1ICSo19lhzBGEzlvWZny+Q717bIn8UphjTYYNhOqXxS76TWdDk0Csdvv4KaO94qkuCXwhUfe
	CyCcxPVUDF1XSkbLoGp0aSgos7kQVXed18x+fwSlNsuftF6G5NFVkA0r2wxRokKd/rJQDIu44f4
	dWjJNKu2gkOsGI/YYP47LG1kS74vjjjEl4rAQD133eXac+8hxwKF47Xj1qJawPvQb1FNZh+l8yD
	VunNKN/cGbZGJF4bx1d4+eODpXX6Ob6cLfTFOWOYHlmP7feDK7e84B95jw6PqyyTii1Cnt+XS81
	/M1ERkfu0QIh3dRUkxNpmpjNBK8jEPzgou2SkvzRGCLnngVuTttFX7UK0LfCN+8NypjTWvwj4g+
	jyYjk5SbrF
X-Received: by 2002:a17:90a:da86:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b0db60977cmr1689171a91.3.1793977315358;
        Fri, 06 Nov 2026 07:01:55 -0800 (PST)
X-Received: by 2002:a17:90a:da86:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b0db60977cmr1689128a91.3.1793977314752;
        Fri, 06 Nov 2026 07:01:54 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc1bc1e6sm100032a91.0.2026.11.06.07.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:01:54 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Subject: [PATCH 0/6] spi: qcom-geni: Add QSPI support over GPI DMA
Date: Fri, 06 Nov 2026 20:31:18 +0530
Message-Id: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAL/r7WoC/22NQQ6CMBREr0K6tqT9FgRX3sMQUvEjNZZCPxAN4
 e4WiDs3k7xkZt7MCL1BYudoZh4nQ8a1AeQhYlWj2wdycw/MQEAqBUjeU2fKsaPBo7blvuZZIkD
 lqI5QJyxMO4+1eW+312JnGm9PrIb1a200hgbnP5t3kmvvp4D/iklywbNanUBoBXmaXhxR3I/6V
 Tlr4xCsWJblC89vg5fRAAAA
X-Change-ID: 20261021-qspi_upstream_series-850249e432f5
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793977309; l=2393;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=sT9UgwhMsmzsH1VR9CYbGXTbSBlB1pzQsIePFqgsQYI=;
 b=C7A6XrHKQ4XQj59UI1RyunXvtophOtPfyUZ40INZlB0wVQ1WwavhDZi/XQdHdag/KPYoESnrp
 /DA2fyYU2OiCiJkgXkeSKhD9clZFrHFuhY4Ck116NuLNZOju5EM/9dr
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aedebe5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Z6aUeMXpdRP9Q2--PI4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX69aEiwWlOjq5
 ILQWW2mexr5ooDnL3Smk6mUKOTcE9mDME16TyakGR2R3rr7ORSc5Q7sAlupp/NvJdmrsC6LzTYK
 3+CGUAODtJAtZWLjubxeS21bjRrlcT4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX8W1KPkouVE0E
 u0fbZ4Q61RnRIqCzuEK5cku8RcoG6FxrMr37MkY8mv3VhTMhulNxpUqH/esBW2BYU+9gRM62Z1g
 7PPuQ2FTbdSzewboYP5rcZxjue70f6juqbNKzaWmBUwUcDJpovx5eG+NpkxcELNpKZF75fRTZqK
 OFE3/WfHfc++thL+EaYTvwJJBEOy9h/qBU+x4qURYWypGLoHQ0tfAPPhTd2FCMD7sQyFBGjF1Dy
 1PfcFeY/7Df7fhdpIHpTYO2EWvBJ+cOUUUfO/KUWYwNP+9jBBwViGnswMXyPyHXiNK5ZkouHesd
 uF8XKh7g8TeBgv7ik+CpRYgylMUByLuT+LLPMFtB+VVNwXPu3ZUT1+Vb6fBRjyYPO0KTsXu8zba
 Cpwr8MFhat46N+ehi3/bUm0oewXClmN3UfTEldZ3POoTw7u2dWwsDVcQM8kGim5XClvcPnDrfGx
 1bgMQzBXB3qRA3FYE5Q==
X-Proofpoint-GUID: PjRj4Ep_ABv2OvfKR_5poquQBA2BbZsv
X-Proofpoint-ORIG-GUID: PjRj4Ep_ABv2OvfKR_5poquQBA2BbZsv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1011 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059

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
 drivers/dma/qcom/gpi.c                             |  22 +-
 drivers/soc/qcom/qcom-geni-se.c                    |   7 +-
 drivers/spi/spi-geni-qcom.c                        | 455 ++++++++++++++++++---
 include/dt-bindings/dma/qcom-gpi.h                 |   1 +
 include/linux/dma/qcom-gpi-dma.h                   |   6 +
 include/linux/soc/qcom/geni-se.h                   |   1 +
 7 files changed, 446 insertions(+), 54 deletions(-)
---
base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
change-id: 20261021-qspi_upstream_series-850249e432f5

Best regards,
--  
Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

