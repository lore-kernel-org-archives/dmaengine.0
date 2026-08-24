Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E419C3EC82A
	for <dmaengine@vger.kernel.org>; Mon, 24 Aug 2026 11:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787570777; cv=none; b=rbOTXLJkU+1Spdezo8/mLJOSe5K3Ys9xz30JB2l6306w5gI56VdJFx0gRisovn7I+n9r5UlMnFPEHxD6iwe4gRMFfXF5dqfflGeVyTC/O2VaoJQJiPYQ2Aeo45AiXObo2hZDwfCOFECcbi1al75J0MnW4N2zViONWOErGtJIt9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787570777; c=relaxed/simple;
	bh=cLkJLX+H69tkE3/m3/QggjlzGba7oXv/ShCNu9i/mfA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sbA8yM1nmsXky6FDAiIsLU0yDPtS5g2e8WgaiuIY9h1jqJnt0QSX/a6sOmR1XcTyEx3uwlfXxszXhO7BZOrYsWNAzJOvkkcwJ6ZzF/S8OfJyiDJ5WWzEojXGsFpx8KvUtvKDO8EPWIRHCTwZoJ4lSr9oC6RevPwveDTnZ1KBjzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JdsqGeQX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bLSdckN0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JdsqGeQX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bLSdckN0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMT7x1673133
	for <dmaengine@vger.kernel.org>; Mon, 24 Aug 2026 11:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UAVPp94T/5SaNTTaQXVK8f
	eOqhgiEdfM1yPy3gJVPb8=; b=JdsqGeQXYj5cXIZBtSkum6YDHOuFcYZKzaVTdO
	QeWC0CPC6gyM2w/X/VRUDuszVHHg3HHielQ15fBfUVVWepewtNiXFtqE0mFcM6tq
	wv4zh+7vGIIWKTwGfX8LBBuar9sust572a2zU0DzNT+BtDimE+cbB3ZKIx0SXtGq
	inIJHHtw0SStq3gvla5rrzy+evtjmbktbqBKK7UQc0nFofL7VbN6ZZefY3P5odqD
	nEY4kSfTXSRUET9oGNMD8eSCdBUQpLgwaR6+DXdepAJ/RwiemZf4zo8wUPxxNNzY
	MoJpH6Kt/8OLVaaU9h4Ymcs2CxpBbloT19QRXKlW4J74ztwA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf0x84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 24 Aug 2026 11:26:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39512608fb1so8564985a91.1
        for <dmaengine@vger.kernel.org>; Mon, 24 Aug 2026 04:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787570774; x=1788175574; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UAVPp94T/5SaNTTaQXVK8feOqhgiEdfM1yPy3gJVPb8=;
        b=bLSdckN0BEajvW8HhE9u2/dbcR0TtcqhRjHB/D7tMwn9Vtl1Yw+D9OKURoN/YdgIRO
         aRdEXxRya+F3jDexHo5baysy3yyIJPLAOITmZr6f2i4Ni0AMHP2Y1xReFQEndB7XIqQU
         NfITcXX9XdWstCjSVEtrxfDGnn6uGYsPHkD9uTDHjODWUmomzGv+TzV0IC912EGYF9ao
         SJfCYJA3xQd2tE/KouciyjxuHxXbNd5q9esP/Rlo5B/ZJ1CZ3F/zUf5oLM1KCNrNGuhP
         ATMt83nHuEQwsLo/pW1hOUiwwEUngYbN+VhcLxYZVUibXQKTwYiWEKu32w96PaHsb7nN
         LKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787570774; x=1788175574;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UAVPp94T/5SaNTTaQXVK8feOqhgiEdfM1yPy3gJVPb8=;
        b=nJ5eyV93PepQwtUmUDs0Qi3syyI/hwzzvugpUHh9p+E9TKOCqzw86SVIQ4+AQHiz+l
         C9YT2f23ErzG6iMfTGa7PCOzReH0LwNxeOMrWTLzG6SrUSybV5mih3Vkk5QU11zLaZFO
         Ih4pwLiUdzrf9qkLqmXQSCGNYoWtUdkZ3wuywtVywDdJktOxNcCnk9+UQ29BIiDpTlqS
         Pmw1dkbfkIsVgj9vGPh+Y4wyhORhrUDpHwjAk8LFa9GTlLrolBFqdD8pB2SFE7BHWKKE
         QtYOTC7j78C907blHXdbcPlj03mshUMoa+hpzfmfsri1oiq6twdPf13ug8mP7yvEmFQa
         g0+A==
X-Forwarded-Encrypted: i=1; AHgh+RoxMz1940N+b96GzUHhJjbA08uPOAENZgfa0Tl8Mr1dvCaVD7iGK2jvkN3TEJunc6FB4QCiVWXOf2o=@vger.kernel.org
X-Gm-Message-State: AFuF++l8izDcdSdxLyCILztKFIijl423NCnhWkHOZmhnGkzhK9JAI02F
	iWwsnqPJIfuyDJ6fpl2lS2k9u9halLstOtJ8a4RsrhQIr0U+Me9gptAK2TrW6ZE+Y2fiNtWL+UJ
	n2VY23IVDk8Y3/ZkW5G/Vw5XR3ljTvBwbYG6koYlR2O1oeN7B8nrVEMkwh6Fkjfw=
X-Gm-Gg: AR+sD11TWFPsOIc0KC+spCkZk1J5z7xdtwxsp/3F4rlNWUj8AwbxBVh/kMJgafYqMcv
	5eTAukfFEEtxsIoPOCUcjHs9DTPmEyIl3wiwPGHT3PM4V+mQyaxCXYfdYcQkOWLm/rfLmmi80ZE
	Ao+ImJaB/EoSbxyZe6odlFvyDaPUgBbWzRen3oxX2PI1vNESQ+IF48KSB+fDz4GgKfLo4640J1g
	Dtwhwk0oSCzR11j/7dRorbDvDS9F77RcMvhER8EQXjZx4dwzY9EKfg3FP/qgJhFUZLT7slNMTK4
	4Ol7PAfhGZGQ/EVFWZTWw8Xu5f8KcUDdvlTvA1RCPy4bs3MOpFIHSTO2ir0VHzat9ApGgKUt+79
	tY6RL6pccQ7uf4gpb/11Oe3jmAI2wp1Xb1D4=
X-Received: by 2002:a17:90b:5347:b0:395:a7eb:a4d8 with SMTP id 98e67ed59e1d1-395c3a4bd22mr49999927a91.14.1787570773847;
        Mon, 24 Aug 2026 04:26:13 -0700 (PDT)
X-Received: by 2002:a17:90b:5347:b0:395:a7eb:a4d8 with SMTP id 98e67ed59e1d1-395c3a4bd22mr49999852a91.14.1787570773410;
        Mon, 24 Aug 2026 04:26:13 -0700 (PDT)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4a1597csm9767137a91.13.2026.08.24.04.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:26:13 -0700 (PDT)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Subject: [PATCH 0/2] i2c: Add I2C High-Speed mode support for qcom-geni
Date: Mon, 24 Aug 2026 16:55:47 +0530
Message-Id: <20260824-i2c-hs-v1-0-8dd94e5c6113@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADsqjGoC/yXMQQ5AMBCF4avIrDWphipXEQtq6FggHUTSuLti+
 SX/ewEYPSFDnQTweBLTukRkaQLWdcuEgoZoUFJpaVQmSFnhWOTSlNoUsjK6gBhvHke6vqOm/c1
 HP6Pd3zXc9wNf4xhEagAAAA==
X-Change-ID: 20260821-i2c-hs-408768509865
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787570769; l=1599;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=cLkJLX+H69tkE3/m3/QggjlzGba7oXv/ShCNu9i/mfA=;
 b=oLX1iowxS4Wmt2opkT74s3VIjIFLSoTXBB+pJPFvPwPxzghoRi5exrfkRyWEPlUt1uuHaPfmC
 wQjXshkPXX1C5O1B8+zBPjUWyPVo0lSLphxuzpmeI/cHOUqfNO53dKK
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NSBTYWx0ZWRfX62LhBoBL63mJ
 Ih9fqcA2uafGXIIjnI6HE0kZj6idC31L9IXw+jMu66CFLtZLl+3Uyxnezs8lm2yVVhkW1uF+/y/
 QS3OLUfbBpzo6jDojJDMjIJOK/aooVc=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c2a56 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=DYxQ9-Bz8KIyXcFcPm8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: FnzH3IZP_CYY-hFR9_aNHR60O84dZFHE
X-Proofpoint-GUID: FnzH3IZP_CYY-hFR9_aNHR60O84dZFHE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NSBTYWx0ZWRfXzygru45Ciz2D
 7Pemlk/lbY6KhN1cS6WeDF6cvmH3rRsHuGJ0wb5fiYWMOnRCet9VBHknSRHjav4BbE8GV4gb/Z2
 t1mwojqpFFI00X2ADTF8WyW2UpCBr3/O5qDf84yG1codSgMkyNCs6Z26JeT405htFdd0Jey5j0t
 sLc4UCZZYla+2wYHOtx8/WQuSJvg1Ty9JxkmZCJ1X0ULIvwHxH9JnwZmsTGiisfqQzxq62epkg0
 IokAvExBoyFzoB5KvfWnloBvwhPmOLGDYWWCy1q5wKhl3qgiNCQsJ1fqrhjPDtkyDFNuX7tinMg
 fir3ZfzSVoyoM9wuJo1z7CFxPmQB/Akn2Gmp10QAS9jMrUtva1clOdteYsVPhz3aOHFUrVzfHM3
 irO9WOT9bTwU1uqaUyR/48QuTt4rJEA5aUOofd0fr9bDXKeItb2/BV1HgS0npC/W4Sr7Fl6hQ75
 yU4Td3a8/SvpqFwz3FQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240095

Add I2C High-Speed (HS) mode support for the Qualcomm GENI I2C
controller, detecting HS mode requests based on a 3.4 MHz bus
frequency.

I2C HS mode is supported by the underlying QUP hardware starting with
QUPv3 core version 4.3 (per the GENI/QUP Hardware Programming Guide).
This series adds the driver support to detect that capability and
enable HS-mode transfers on SoCs whose QUP core version meets that
requirement, rather than tying HS mode to any specific peripheral.

Patch 1 (dmaengine: qcom-gpi) is for GPI DMA transfers and adds
a CONFIG1 TRE to the GPI DMA engine to convey HS-specific timing
parameters (tcycle_cnt/tlow_cnt) to the hardware.

Patch 2 (i2c: qcom-geni) handles FIFO/SE-DMA transfers; It configures
the GENI controller's source clock and timing accordingly, and adds
the HS-specific FIFO/SE-DMA opcodes and master-code preamble needed
to switch the bus from Fast Mode Plus to HS speed.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
Jyothi Kumar Seerapu (2):
      dmaengine: qcom-gpi: Add I2C High-Speed mode configuration support
      i2c: qcom-geni: Add support for I2C High-Speed mode

 drivers/dma/qcom/gpi.c             |  54 +++++++++++++--
 drivers/i2c/busses/i2c-qcom-geni.c | 133 +++++++++++++++++++++++++++++++++----
 include/linux/dma/qcom-gpi-dma.h   |  28 +++++++-
 3 files changed, 196 insertions(+), 19 deletions(-)
---
base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
change-id: 20260821-i2c-hs-408768509865

Best regards,
--  
Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

