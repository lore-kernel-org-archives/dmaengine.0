Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977340;
	b=o4XznY9mBXIH9ZCrMsaEzsXm604KwdeCGFf2HGNy44QWbDJGd3ct/C9W9mCCa6+tAWRW
	 zBOzcBGEdZ6johBxfmqrd/jfTuK0w8ZGZ0bxPCGU8JVZfFnPmhJ/OC2BFpgmUr4Jla8ZY
	 V/yDdPCMIzJHXYI0I798NugcLO+qGp/JGP0jkOZmGAP8rYmjVlK2GjPsvPjvXsn7FfUP/
	 fXy5beS4BCzDfLtACKYXYtzM3ucATUPtJl0Pj7qRfGOZ/6lwvp2cqXT9mCg6+ZYSXx1f1
	 yp6HnhTQUNyHkoJ03qUVZ3VzW9Giq2b4x/R8Mxc4sc6t8bYeTQr8blfX+Fr8/XwYCqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977340;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Yx8cGy6GRV/5KE7+yO4+nlU2i7SRus2h+xb24HPkgYE=;
	b=ClRxr4Gewi7rv+J8udPvzJtGAbOv5D/Exk0JP7PtO4BpwEkfbbae3HcLSP48eO0tle4m
	 ZrgsREdNFPQy4XC6vntiCSALgwbjETGGI8hWaSeRlWxKmghtvDrjB4QouKA+HrJxzMO/p
	 dvS6/W6sDIQY3zIdAofjcxnMIXcNO5JOt60QLIhpT7R5xXbygsUW8Q8cY7EFrLPgopFlR
	 0+6WdwhhWf6Q7rdxB5nI6baM99qdgEsUiNZ1kfR1WEkfM3B9/T4XA/gg5zA1SsUHNOcmO
	 xY/OSg53W01zq4NeCdnyUxxifXXtjFNlCD83AcFfHmDiEaxj5nZfpH4uFu3nUyM/oBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ooiae5c8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvIYChHZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC20D606D82E
	for <dmaengine@vger.kernel.org>; Fri,  6 Nov 2026 15:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC20D606D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ooiae5c8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvIYChHZ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Exwwn1039347
	for <dmaengine@vger.kernel.org>; Fri, 6 Nov 2026 15:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yx8cGy6GRV/5KE7+yO4+nlU2i7SRus2h+xb24HPkgYE=; b=Ooiae5c8LeL790vg
	3HfGqpQUSGhnFjRhtcuabcQooUZ2p2X67qIfBqVZ6cJSiDsr89ZsiEPfS16DrFSC
	jmGDzOugKZM1tmiZzb0zZBQlBfyTzTC4DY38Wz41e8+IbgNtHmonNQnFmZWUUy2q
	Wx/qoKO8cVvXowyRBYaLrDGLqv1Fw7WJ8xCMDfm7r32yupZuEkTxJiG6QFDjYUXL
	B7c6U7v9i2dksJOHuTXFC4jWgnHtNwLsf644DC4Rsf2hdisD5Ps6jnfD+b0BsOSO
	raMctBdtu7Z6JnMqLTre3pUEZiQ+43kNLuZ/FKMa/TV+s3xov3PSIC/f9eoeZzrL
	6pHzig==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9uapu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 06 Nov 2026 15:02:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adc5b185bfso787733a91.3
        for <dmaengine@vger.kernel.org>; Fri, 06 Nov 2026 07:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977338; x=1794582138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yx8cGy6GRV/5KE7+yO4+nlU2i7SRus2h+xb24HPkgYE=;
        b=fvIYChHZ/VHb44k1posJawhbEGdasBVHP6OuucAG55bMZyX5yLzA4Dd8JcOMo0iIA1
         mLzEd6PHs74xzqhX7aOdUvLf9jHgKSXJU3K86l8Bm37SBIHl35O1tWJ/dO3uWb2+A6FN
         zTov97mqiwmS+8k8D3FahTDF3S0E6/XWQfLBCeOl+t8dWWb3vlpSuukeBi93x/UaKGDh
         iaCc4+4RRNP5dedWVLEl+wUHdQ/xyrY4B1+0R8ZnB1KWBrW8m26W14WCfVBQhb82FVMF
         1CUpzDkISLKoJ5XzgkQEH+jcXHwnOaChgWP2vnbxnLZ4J/4bkW8e06hLfx3Z5LKCekgd
         3BIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977338; x=1794582138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yx8cGy6GRV/5KE7+yO4+nlU2i7SRus2h+xb24HPkgYE=;
        b=ZSIb8HrwqyV23NZs4aAclyYeNitE8tgLuJKh+tG3zgTpkk8ST5JSOcaaYL8Yvxfg6W
         cV6wttvllGopBotIoT8ja5RO0QXAcbrxNV4CEiD90GO7OVz/zrFtNVzqmRe6sQk+fvYy
         PSjA9PdCNUvesdMgKmV1eWbP9/zbmIxAduKl4uc+XNrh8ZboxR2Olz8sWth+ALdPxfua
         9pD8X+f71hDPol91HFavlVK2GGf/CdBfGuz8yesrU+V8QYZdDT4VgnvJYOYiVX7oIScN
         gUKmfas6iDWIhIaRlI/WGnjinTcTmM3XIeM+hprRJbgiZS5jp22QKweurRFpU4UoDOcc
         jSeQ==
X-Forwarded-Encrypted: i=1; AL+hErGNjMXxTPXAxKh4rBi2I36kchbZPyEHOfwsCeUBGloECWBc5ExXlrnxGJ1rBulwzIk+cy/aeyqQfSA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ICiPjVDzdDlXiR9W0K7fI7fnKAQbIWzbMTkw4QNFAWlBS9ZGT
	/f56N1Mvs9U3w2hkzNH28pyTS4ZYZwQDPPGUvr99K/yh/1gd9ILfqxgZFE45G5bEjets+d9/OxE
	QmkNrqNtmz8ZxnyyMtA31qn4yTPcp+/6OQevK/1cH4V17O9Z9j3n2ncdfrT/5org=
X-Gm-Gg: AYBFou1Uw4+HfZa38TJmfGps6hgZMpQn/efXlUm7IVpOXduKnIPUpqjCP4KAXetLdDb
	6hc7Xio7GNSi7WGIBH/OmdUlngAE7o7WMcrJ0nu9smSb6uTmE02NgeXHQJAIHD2uzhDm+uZpOb6
	UVcjGQGl6n8S518u6Glga/DrBdVtlLT7hMQTtzYfHsz3t35Rh8bwMio3pNTKAyvryNqNfqasiiF
	sRbYK1x9uBFQjyJ2PfqpKbCa3lq8Ba1qFWZTduI5HIdqc4OPZiOpTEylpxGcDR78o576/PsdB7f
	P5y2q2sxCUdZDlhJ6HJBo7XZVaeFG1ogB9fSD1t8JQedI3L5Gv8jS4ENWhG65TDESYwrhvwBkzz
	cUZOuQ7uRF+SnDtRFL7zoKzpZvuzF22EavIzIxGVY93msnh7eEasrH6D6gQaktm2u2kHzzGYr80
	yF2Hjo8RM5
X-Received: by 2002:a17:90b:2552:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3b0db6a8e74mr2884525a91.10.1793977338282;
        Fri, 06 Nov 2026 07:02:18 -0800 (PST)
X-Received: by 2002:a17:90b:2552:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3b0db6a8e74mr2884448a91.10.1793977337611;
        Fri, 06 Nov 2026 07:02:17 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc1bc1e6sm100032a91.0.2026.11.06.07.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:02:17 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 20:31:22 +0530
Subject: [PATCH 4/6] soc: qcom: geni-se: Define the QSPI firmware protocol
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
Message-Id: <20261106-qspi_upstream_series-v1-4-21f43042dd60@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793977309; l=1942;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=ojWeR4VoxNLp6SSgIqv2hrWvgVO2h3SZMPicVyzBSmg=;
 b=tXEQEoZ/2GxkCiFk/2JvJdGrCiIpMiZY7dqXyKOv0bjxZA4pHhyNLUF7zxzajclaa1/wm6dN1
 Oo68+1Np2XfCQpX9o6a5Sa31CNZVIfN+QTegPB27oFb8jKr8OUrnAw1
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX5jSfjGglAYpm
 SeQl5nvB46euWFA4zAhN/okBd1XyBQY6aeyIKbD59todB9uBBMF8AvQXFSHrrZwCnW86Ztal4W2
 XpBjBswc09SdUR88dD+/322iqvhuHzQ=
X-Proofpoint-GUID: Bq0n43jcG5s7E92RjGEaAFeoEk9uHwvH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX57MTigR3avf6
 eCw72q0yG5UtXbdEnY+wOMNF5U0H2LP5CAAk63D0L81zAFiuhpi/iqQWXyAaBzAdnr2N7xTxkwm
 vkuh25jE5Bmxk6xnZoPvxHaP8VF1B4NwU8DkzNS8B1ehCrw0Y+/PfDn5xXXNVXzCUouJhFrj5M6
 jeTpvA/szrcw+e/P92nIf9kBswk2NPExR9vv2y6klbjtf27Se3C1jNdfHZddIhpxH7wfiCRNcUX
 HBo+I7E0h79jWoPkrHPwLky0x30YNEvX0XxmBjXih0tuYCkw8a3uei9n7uPpS8RtRQDOFGnR4w7
 0AsxlBlQj6q0RTTxT0dsPOzXEmnUVwN8dJt+LSGV94JN54ZmGp2qtCqyXmycdp8CN3Yi1Fgdjol
 MX0Ss+tMBD/LrVt1hRNlqxtQ7ahrQLzCQHPCpvuVlqZHrc61OvfRgmWIv/4grT1SCpUsMoXY1pP
 eiaQOTd5EMHkh+BbF6w==
X-Proofpoint-ORIG-GUID: Bq0n43jcG5s7E92RjGEaAFeoEk9uHwvH
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aedebfb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=0Zn3HNfoxhtf-8mV_PwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059

Add GENI_SE_QSPI with firmware protocol ID 9. The GENI SPI driver uses
this value to request QSPI firmware and validate the protocol running
on a serial engine.

Extend the firmware loader's protocol-name table to accept QSPI.
Reject unused protocol IDs in the sparse table before looking up
firmware.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 7 +++++--
 include/linux/soc/qcom/geni-se.h | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 873bfbd6b2b7..396f3d81d292 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -122,7 +122,10 @@ struct geni_se_desc {
 static const char * const icc_path_names[] = {"qup-core", "qup-config",
 						"qup-memory"};
 
-static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
+static const char * const protocol_name[] = {
+	"None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE",
+	[GENI_SE_QSPI] = "QSPI",
+};
 
 /**
  * struct se_fw_hdr - Serial Engine firmware configuration header
@@ -1557,7 +1560,7 @@ int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protoco
 	enum geni_se_xfer_mode mode = GENI_SE_FIFO;
 	int ret;
 
-	if (protocol >= ARRAY_SIZE(protocol_name)) {
+	if (protocol >= ARRAY_SIZE(protocol_name) || !protocol_name[protocol]) {
 		dev_err(se->dev, "Invalid geni-se protocol: %d", protocol);
 		return -EINVAL;
 	}
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 29a53bbc0dd4..e96266631ae1 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -37,6 +37,7 @@ enum geni_se_protocol_type {
 	GENI_SE_I2C,
 	GENI_SE_I3C,
 	GENI_SE_SPI_SLAVE,
+	GENI_SE_QSPI = 9,
 	GENI_SE_INVALID_PROTO = 255,
 };
 

-- 
2.34.1

