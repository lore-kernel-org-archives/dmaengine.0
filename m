Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078005;
	b=F/1LzsRTRZqaOUIaP/+LlMA8gAOBhfnlNtsThzlLLXtvmOiDXF82LgKf1I6rguqv3Mbo
	 X985ngtk08Bod0eq8wnrWP/FBCBQ146Jj3zqUlfXA0uBslXcnVuleqAiEJhP7VjLz0Hgz
	 rQI45P5tv7l6OGsTzqCCBVFgjbtkJ/K20NtgkTIFNE9ZGkUgsfmBJg4h5MGpArr8WEVcy
	 apVGzQnkfsnBR19aHXBr83Xt4WjhpoI0NfYwqOTL80gCNW9wuqdxGoeTb8QUjh4EJ8LQC
	 utPYpgdwdCMkp/a7ENF2yEgXfZym6woFQbfqW5Bs9TniQNa+yxwlNPidMqdB/yI00ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078005;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MarEIKFbQwA9h6Hy1ZNcr17QnNWznQahW2ON7TrWhXM=;
	b=RIuuACyx+6qZIPQkH9UF722wFyDhFipb7xjd6Hu+b8H//HpcUKEA13L6sXCjO0crXjas
	 XgCxsGx6LNErIEJzgnz08mmKIjKeS1SaDm53pybzWSqfNKnfVNAShuvN0tQrEwUTYr5PQ
	 et8NnaT35nT+ghdG5CfMLWT4t+pG3sERBRY07VUu/yDq9KhMGp5JS9FoCC99uN4+qVllS
	 LRWQOCECFM1PWFgqwLWet3HgtWiw7Ho5vj2UxtnLpWQeQ6ko82DkQPFzftm54Q02aNR8x
	 Lp0kzxHaA1j7AesFC1BI+BtlZ+bLqSOUsDhTPcpce1RdSeDcAbPa3D1/wvZDtRdBSTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GXInQVsc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVdbmptb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D32C606A31D
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 05:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D32C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GXInQVsc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVdbmptb
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R2F3ni3521335
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 05:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MarEIKFbQwA9h6Hy1ZNcr1
	7QnNWznQahW2ON7TrWhXM=; b=GXInQVscNUjoLeyZ0knax1ZMh01UEqjcmjclZB
	Ij9qQYKae5YoeymMqN6TycwNwBxYeyrzGZ/GMnWWUvqYP6XKa/0yszUba8L1oHJ0
	6/NrtlWButpp82x9LDk2znEZu/XBISZBpQRsJ+PNA7iTMzOOM20WUkqQ2Z4eJ2HI
	Bg7TXGpoKe/0LFJZSo8LsgchSlshyUPPCJM98yiujHc33n7yowxCwP4OZ8absyh5
	hOeQ2bNP7MfAz3GiRF1howedSn3P0J8pBzjgs+6OTE/EtP7D8FrlAHCa8s8CPKu9
	twG8n2/7hejuuy6Nx/3G1kHJBAN7nF7Ep3j+zG65b+a0QxmQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54j5k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 05:13:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so10175476eec.1
        for <dmaengine@vger.kernel.org>; Mon, 26 Oct 2026 22:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793078003; x=1793682803; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MarEIKFbQwA9h6Hy1ZNcr17QnNWznQahW2ON7TrWhXM=;
        b=BVdbmptbIDBnxzcw47989D+U/lURQvLS59KIqnf2H8b2uzBYJisXzn0oNXzBrUq+XV
         K3OMBULA5nd2yOS2gmYgaUh/y9way32ODsEPpWk0dqITij9AC10zsWW7psD+C3Fll0c0
         awpQC3W/D+IBfTlz76eE1h5DIijBLGJD0wicW7tRTM4reAEvljcr/DRYlw3/7ZSIeL8c
         p9c4Qk0CqUfeuQg40poJSpOox1gVitx7mbZBbgxDR3gQn1/8wgXCW9r3S+DMBcO2JlWq
         /yHNsWq3yp7SRWlVfGgCkgHsJ8za++iKjoBlt/sMZeY1Wy0aE7s5ENqtRry+5+xEAOJj
         HCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078003; x=1793682803;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MarEIKFbQwA9h6Hy1ZNcr17QnNWznQahW2ON7TrWhXM=;
        b=0Pqm7QGt+pVRivHmTMD0EUmfhNAJCjGkQUNpBafED7RX+6NaePWD2/ISoTneIUqjqW
         MMgc7DzPytNif1POwFGuT4qjBp3mqljrHrru0NJbI+ubWVmNU0v74e2cZX/5xU2jXt9Z
         uHw+coQQHdwpk6yRwBJZ/Ml2FYQI9DUjiZ/N/S1REFEn4txfxB9CPbT4TQo09UAynmqt
         UFZEtqmHiAOvYE2e8six98bx4DqCE3MytStDb3vKEyy0pxM8C+Fr//uYYTv8RXEyKpHC
         eLGfbc4rk9AZUKTkfwyHUy87J/mjMgZ0aScLBN0vbW+DCUc7dNDhlyREhX3BvSkyoPYx
         S4rg==
X-Forwarded-Encrypted: i=1; AKwUvBzWgIm8//7DykDmMcLuGTOaHDtj7n1C3FHt6FzOZtaJaF0iBEkNzfVWskeGPplEZnpOEHbm0sxnJz0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQgd5O4iVWLPoilvHDHfYx3J9klEoGRTZ9UDUiBXZwyzbwc3Wb
	b9/uhzcHmPHzBPoZ2ImfNn+XgifR5fOrjVj8BJyn9GJm3o/giNo10VCaL2Ws1zrIsmUPxJ2ltoQ
	UPbh9auuBbGRGfQvOiTs45YgI/VwasJkjsmJwK9brWVqrGHHH2Of8aT5H+VB8DEU=
X-Gm-Gg: AYBFou0lyCmSpsCZLbMvqA+aqH2a939cDSQH/Ql7UxuGpiTsakyuibLvDlsY03PkmD7
	PI9GptHJV+x2hvEsoK1d7edpEP2tDeO4RqNuIUFJu9wyIaoLPLhjOKce9oATQg2CjusTzChIMLr
	DFEoCeGg6LBOGmfEfHvot0wpG5tP3D2NIrISoeH4VFXEoJ+jdg7FWy8Kh+/mwmHuCcggCYBy9lE
	kcKR+QMW8i44MjepdAYcq6Nh9PhxBPs92aA18XTg8/vRgnSgHs/AbP2H1aZaBzV3OD6z6Plk6AD
	IcfPsSYaQHx9rDiBQ6nZyjYwpMrWiot1ql8xqb9TZfBNN9pIkFMR3paY518s//WvEFsOjeqQHEo
	adT/P9dh0ZD/CIf3egAdWwgrbmNklMLpqXA==
X-Received: by 2002:a05:7022:b0d4:b0:14d:3c0c:79e8 with SMTP id a92af1059eb24-19934e7166bmr10591555c88.10.1793078002836;
        Mon, 26 Oct 2026 22:13:22 -0700 (PDT)
X-Received: by 2002:a05:7022:b0d4:b0:14d:3c0c:79e8 with SMTP id a92af1059eb24-19934e7166bmr10591519c88.10.1793078002146;
        Mon, 26 Oct 2026 22:13:22 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a249c331sm62298866c88.17.2026.10.26.22.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:13:21 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Subject: [PATCH v3 0/3] i2c: qcom-geni: Add I2C bus recovery support
Date: Tue, 27 Oct 2026 10:43:14 +0530
Message-Id: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-0-7f2a6e572de9@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAOoy4GoC/42Owa7CIBBFf8WwFkOHFqur9x8vhrR00FFb3oOWa
 Ez/XdDoyoWbydzk5txzYwE9YWDbxY15jBTIDSnI5YKZQzPskVOXMgMBqhCi5vkRNSjdDHTCUft
 m6CiidiHo/6k5G9f3Oh1el7aylVRSQMcS7s+jpctj6nf3zGFqj2jGzM+NA4XR+evDJRa5x15rn
 MDodgrao3ER/ZXHgoskI61As1a2Ln+SweplsEqH5ZUIb04hQH6vHyHxN7JaQ1tWslP2A3+e5zt
 LuSdIQQEAAA==
X-Change-ID: 20261008-20260826_aniket_randive_oss_qualcomm_com-84f5f536302d
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793077998; l=2681;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=o1kpDOqfPBPXbo5TDZm+ulJUUJzq8+gQRhql7a3zJW4=;
 b=HwCvHxL9FSP0kbvMu/177jOQ2MKmoI/8ttmgetmO2QYu+emxG4q/hH1eyBOB0jSuQTQ21OirI
 aoQ8v1Bwh5jBgHBZBdjeFfFFMNr+opJSzWtZ/oT7MYolW8o0tHQjtNO
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyMCBTYWx0ZWRfX2q9Yb4A66VZQ
 MLUX1uVu9C6gOL8SO0/9YXATN9uvzfU8uKe9oqXeBaXQ4rnpM3hS7U6ifPdwARkqFCP3MlEHIsZ
 +KipkU2Xz0dNJDx3Zk83luAhp/u8FW0=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae032f3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5qjwvz7LsgNgZhFB2CoA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 7koqmKxc08GET_fwXLNvgXoHwg9u55C6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyMCBTYWx0ZWRfX9FKacl/jzzn8
 SQRDSSPndHYpBX1IrtAtVhfh3KJywBlY2iS3P9gJPKNG5sJaIYn0GO5TGhyMEdOC2ySxMO80p3Q
 PzPWlOQHMqfKwxal42dOCemIonG+jp6AVBLYoG19EF13qcsLNxmAqvckCgNsTxAxBDeTgjBb0X2
 Fpz6eVR7pXLgYE1ZNfhRNhRUC2MaPJlncX0YQM/YNbT6tQyM7E7Z9OOJ64rL51Q9pvF3R8207b+
 ZgONv2dYBGdlzI6tI2vq/Og80tnVZpdLPVYrd2FsmF7iFyY6MmlKIavXWB1HXXTQVsz/pRh1dwu
 ngBVxICG21bADxAW7Tw2beLUvS1KcjEP+p3WvZQF5kKmCErTqWtXui/CXQ0V5Cz7btRFPrjnNjY
 P6oygrUDQDD8ccLaMsyjJF1Q/KIS4SMbnZg1Ddywh6/GkkUaFaJgs7mWTHdG9DsO025NagSFGGi
 Vk0BVbDjmYz8eoewZOg==
X-Proofpoint-GUID: 7koqmKxc08GET_fwXLNvgXoHwg9u55C6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270020

An interrupted I2C transaction can leave a target holding SDA low and
prevent subsequent transfers. Add recovery using the GENI I2C_BUS_CLEAR
and I2C_STOP_ON_BUS opcodes in both FIFO and GPI DMA modes.

The series adds zero-payload recovery opcode support to the GPI DMA
driver, registers an I2C bus recovery callback, and triggers recovery
following relevant transfer errors when the bus is not free. Recovery
checks both SDA and SCL and preserves the original transfer error.

---
Changes in v3:
- Use the adapter timeout from the FIFO recovery patch onward.
- Configure clocks and timing before recovery, with PM cleanup on failure.
- Remove unreachable GPI error checks.
- Log DMA termination failures during GPI recovery.
- Preserve GPI timeouts and stop further recovery commands.
- Link to v2: https://patch.msgid.link/20261023-20260826_aniket_randive_oss_qualcomm_com-v2-0-93572b453d6f@oss.qualcomm.com

Changes in v2:
- Rebase onto next-20261006.
- Move the recovery opcode macro removal into the DMA opcode patch.
- Check both SDA and SCL for bus idle and reject recovery with SCL low.
- Share the bus-state and recovery-trigger checks between both modes.
- Guard the current message pointer when checking data NACK status.
- Reuse the FIFO transfer abort helper for recovery command timeouts.
- Use the adapter timeout for FIFO and GPI recovery commands.
- Preserve the DMA configuration error code in GPI recovery.
- Link to v1: https://lore.kernel.org/r/20260826-i2c_bus_recovery-v1-0-203f0ec76f84@oss.qualcomm.com

To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>

---
Aniket Randive (3):
      dmaengine: qcom: gpi: Add I2C bus recovery opcode support
      i2c: qcom-geni: Add bus recovery support for FIFO mode
      i2c: qcom-geni: Add bus recovery support for GPI DMA mode

 drivers/dma/qcom/gpi.c             |  30 ++++++
 drivers/i2c/busses/i2c-qcom-geni.c | 210 ++++++++++++++++++++++++++++++++++++-
 include/linux/dma/qcom-gpi-dma.h   |   2 +
 3 files changed, 239 insertions(+), 3 deletions(-)
---
base-commit: eea3fef32a9cf36abcb5975a5a594e4135a6b026
change-id: 20261008-20260826_aniket_randive_oss_qualcomm_com-84f5f536302d

Best regards,
--  
Aniket Randive <aniket.randive@oss.qualcomm.com>

