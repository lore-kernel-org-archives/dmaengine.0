Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522585;
	b=0n7ITpXsjfBMJ9StOz79tHdAddoZ63dCGDyvkF9th70XIibEuD8v1j9/4Z9t+5Jq8oVA
	 E+A7RcedxlSUI5L86jcku4OSMSfINlruznlqZt3R2a8vrTlr9rdB6M4SZ+CMzZopDAGmZ
	 +GrM/YogIZCrgW+MAkm+bi20vLx4gMtNy8/lBMG1fh4on52XHyi+7SQkAZz+MpI+0zAmG
	 /AuaX7OtNL5c8rtslrxzGOcYZDEi4yK778w54T6zRzUi08z5E1pTbgwl12cNRJhCiWCMY
	 QbE2yGh0cAxQYrBJhunRCYFLSPq1LR1AOge9X4+1oumeAmYBHf9v/LrId9ETI1idi+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522585;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6MRwCGY3EIkm2Sb+ci3Y/6bF7HgSt7oRZHgHfupwS00=;
	b=OZcSxywR/d2WBz4M+z/RI4+cyXZi/3qdYzOiClEav1SmbUofR1MuSSgrWS0Skz9P8ial
	 1FaMSOS7q0Vm6oA/zoHtRlTSL2TFV/Vi3QdoSIB03ilHJ+eKSl/T0fnngEpEhjhM747+l
	 HVFue8t1uChuOh0HirxxRp8kHBIcb24UcCug7Qks9HKNvDuuoFTPQGNYNwEIL9Q0YB56G
	 WfNVNxxNvKUrWsfhxlCuMyUuPmq4EjmWZe6u8Kpyi2Dz5TYWA2tNf7Oc8JtLPfJkJPq+t
	 40uOO4UwiDF1RsUsAPML9NHyYIOHfghi0155XRrHzrSz70GK76OCC8uFTs4+zwZyKXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lPhv7E3Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ijeEuiq7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3F9606A31E
	for <dmaengine@vger.kernel.org>; Tue, 24 Nov 2026 12:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF3F9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lPhv7E3Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ijeEuiq7
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAubtu1025308
	for <dmaengine@vger.kernel.org>; Tue, 24 Nov 2026 12:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6MRwCGY3EIkm2Sb+ci3Y/6bF7HgSt7oRZHgHfupwS00=; b=lPhv7E3YmnPEk8qa
	4smohmy9wBKRAbB/cU7qwdF+X8P3rc1IpypwQb5GcjmXC8fKu1pfAgTKTP83T59H
	exAfVmLqi9cQuHeO97KcUoO8FDpAhWcc8aLj5BQMeA61DPwbDWdyeL9kDtSTDV7C
	yjBwrY774PC559i8tUM2JiSrBWpMTp7+xat+tO06EGVatTfpZwkTHsxdiPkXqqI9
	1ZrZQIP7K7coRt/N7PwIYg9tuthEOB+RcpMQYDCQRL5+Jvtx2G+RmAvENioEOkEL
	QasJoTCmpJfLJCIU7cOUAwh6ofd+kai46p6U36zMnmKlNEAqVuYQaGSDWJ2cCVe2
	qgrdUg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt2mpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 24 Nov 2026 12:16:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so2405692a12.3
        for <dmaengine@vger.kernel.org>; Tue, 24 Nov 2026 04:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795522583; x=1796127383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MRwCGY3EIkm2Sb+ci3Y/6bF7HgSt7oRZHgHfupwS00=;
        b=ijeEuiq7jbW3AojaiCBI7WVrxVWCC7Xyz+2V61JvkvolM3at5yfTgQMCW8bPfmsnLt
         ZEhhbLDlzpW44Xihe5whkqT9nnCDWH4wzaKEAf562ropQtdKBba5DVWoBBA8YycAciBk
         S6gI5Hm/ENHXVl7jT4Y9HSVF8OtQ7wWPPQme+cBZ8y+u2XhdQYmSJ1+J6d6VT8eRpgyh
         dcoFVSCiw5nwCnabxVFhdaY2vFlDA/KYeGAMYUVpJteqCKzRSX78r+lj1xu8zhWDyx2J
         KYVVxtiMygwwW6SjxGWpwR0hJ8iX8CdPHNBYFOxi6sJIdL3lSXOuCK0eZ3sxxoVAP7Np
         oh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522583; x=1796127383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6MRwCGY3EIkm2Sb+ci3Y/6bF7HgSt7oRZHgHfupwS00=;
        b=M7xMjvoXufMX2DURl04EYq440hza4hCVBnng7NGoepDwbLANIxyFzonsCiOpRQKH59
         j+BJPehXR3htJceLHh7ANDznnVtvOy2174WR+KGi5vvLsyhIKF9EREzd3vkL9Vubnicq
         ztGM8kTo08FF/TB0cO/hMNYWLxxbgj2bPQmjlIhaB0308vdZQGr4NzpuJU0h7Y4T+nz3
         iOxmnVNKVXmLzX0ZdbCPWsZo16h8deLIYSPdaaDGkaHnJg6JKmE/Mq5DTfh9G9MMVuBy
         +pCokETNl+Tt73auwUcFGDmNxT98g/1DE6UdFmUj5UWR9PYCP62aX++AAdvDd5tRa7yu
         EPOQ==
X-Forwarded-Encrypted: i=1; AL+hErH0KHss1Ogm9OEKFs8a99JepkGruLzF5RWymoOoSLqDH+IXrvGDo4cvYUDbhrxRGKdEcuQCnJmmxrU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Dg9oe9VTdD3oijeKn2damiftQ3mYRT4fJk0x4bdNZmew0U5mj
	lbcQEor1Oto5MgdGGBvmn4m8hKBW6r9wxFDyYevRIg8jwQToOuQ8uULlvygMElqEBBNpYmGB50k
	E+HSBrka6wE1JISsfiXRB5P/86lUBchEaF7tY4MXAtVnVQBQoC6MEwI2AMZZWwM8=
X-Gm-Gg: AZFdTZcUzJdQ7ozufIId2tiRFEhKk1VtltI+a9cFpbj5sYlI8hTFtPTJImsGQP5lHdo
	DhfTyBs05MG8bKRBjDde6aeZvd0px3WShOGA/5xsKmINVaLwDB+4pOLiKZxg1H6cE8cH76JBzg0
	JwjVOuzagEYy+X/xmbfud7NooX9VeY57Aui5tS12c2wQMs0Z+RczDTR9qNxpq5uWrMZKKvg5LQs
	w+wPmPY2BD5usEBm+yZvm5RK9OG42g0GrfvQs8xHSReGBkWe4VAi4G4IW1HYijM0sToLP98+y31
	PHttUPDohOBCq//Ar9PPuOE7RdQUQLyT8eB7FKWNetBhEx668l0X2y65DO5z+3Z5B3tu1CUkf6a
	Gl9xX5FH9vvwUcimSMqlvyMPBniummhasSgmu9toxZNVi1VXNj2wAAVSU0d3EaI8GIkxlx/fX8V
	VmAyXc5TuB
X-Received: by 2002:a05:6300:8095:b0:3f9:a6b6:e173 with SMTP id adf61e73a8af0-4014d14a577mr12497093637.26.1795522583467;
        Tue, 24 Nov 2026 04:16:23 -0800 (PST)
X-Received: by 2002:a05:6300:8095:b0:3f9:a6b6:e173 with SMTP id adf61e73a8af0-4014d14a577mr12497059637.26.1795522582966;
        Tue, 24 Nov 2026 04:16:22 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8706844a0sm7245572b3a.1.2026.11.24.04.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:16:22 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 17:45:24 +0530
Subject: [PATCH v2 3/6] dt-bindings: spi: qcom,spi-geni-qcom: Document QSPI
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
Message-Id: <20261124-qspi_qup_upstream-v2-3-cd69894107c8@oss.qualcomm.com>
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
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795522563; l=1598;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=wquPpfro8iDyDqLV7D69xsSCzyvDGmM++tbpNclpPwQ=;
 b=N3l5nqiq+539iw0mq033y0lWszIasIovNOKFVkYaPOZOh6w9Q3p13NNJ3jevhXXmkWjRhaMgq
 J0gD/S2lXt4Ct372gS3D8np8RqR+QN+4Ajgjx2cNhkp2CubyWGRZevz
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX/TbARGoHhGC3
 vPookSL0kwvcqfqAm0p9e06YTJi26hFnSKqPhetqAr2HsRNHToZypDYrvsUMhNEaaijuJ0xaoOu
 Zg2d35TrTaqxIEznEcRyvWpfYu9AJOA=
X-Proofpoint-GUID: qp6o1Ijl3P9_SPfiVbeSEVyulQ1nKSX2
X-Proofpoint-ORIG-GUID: qp6o1Ijl3P9_SPfiVbeSEVyulQ1nKSX2
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b058018 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yrtxUKLFhIMtdVcRTsUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX3ujO/wEp6vQq
 ml3eINctC2rA1maKVwHE+ov7nhad7xGnF/GBAm7WZ9YYKbirUSLHUslADBCPPFC6KxDksIwJsZw
 UCyNxrHTL5T43EySJZ/U3rbvGyW3bYD8+hvzRjNKvulyzW214gHSOe3mwbxbTUpvDhzZ1cCqw97
 aNOe3vRvyE83WhvwSIljn1FNjOVCgy7AXZCQYFjpRcw0jxHqCAUeZ9GIwOt38gwwhiDLw0Ham/G
 J3rNFnM73QxHVEy17mxqr+rz33XkfNlGfVNA0GbZv4+YYVayD4thxyTruX3+MD28J46YXYdy9UW
 xQA6kOmOupjT6arIi4/q0HIeFuO7sjdnbcY/5Gbl1PrSdSKum2fPDAlEvgmSrFl4ppVWu6ru/1Q
 CsUwJzhQw7MSPUeR17VstK6ECdNuk+4T4Cyg1bCRIRAtdLTIp5fL1JKz/Nmibp1kyCAuy/LzyWB
 4+Ew2MYUblhPoMve9Dw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240047

The GENI serial engine supports QSPI transfers using up to four data
lines.

Add the qcom,geni-qspi compatible to identify serial engines configured
for QSPI operation.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
index 8d1c78701657..eb44f1fa96e2 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
@@ -19,6 +19,10 @@ description:
   SPI in master mode supports up to 50MHz, up to four chip selects,
   programmable data path from 4 bits to 32 bits and numerous protocol variants.
 
+  The "qcom,geni-qspi" compatible string identifies GENI serial engine
+  instances configured for QSPI operation. QSPI supports transfers over
+  multiple data lines for higher throughput than standard SPI.
+
   SPI Controller nodes must be child of GENI based Qualcomm Universal
   Peripharal. Please refer GENI based QUP wrapper controller node bindings
   described in Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.
@@ -29,7 +33,9 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,geni-spi
+    enum:
+      - qcom,geni-spi
+      - qcom,geni-qspi
 
   clocks:
     maxItems: 1

-- 
2.34.1

