Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977334;
	b=IakNDSqlbxyW+phQAa1ChLt6stfpiItaFo8FPa0dNef1TcVvCzCjj8Ag/hsuIApU9DFc
	 WJZeN9neJnYHOeGxhfAeAV+9RwSTVFgSsD77pPLZMZpMIpBC3SFmNkWLDFNb1hryRdwgs
	 GnZnrbLXAKQ62Y0OVBAuM0ci6eVGtvV0LWP7FhGbDdVW2nJys3ZSqNEruVdjJ8LYAJatN
	 Az9Wto5ycV5mN9rAXAfimfJwUaHxfbBWfWASLt5DlnuhI0oykal8e7dERy+hgdVSx3AnL
	 vNF7/NTtW22LzF9cXK8vLUvKaifhthsH125sHUVzkT/tzN1PNjJheje/qECvORkWgJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=x3QLozfCyQOXqamzqmwUwQlpNil8HpltlRmIUwTug6E=;
	b=d6eI/bvLe+AuNqHBA59VNSBWfcntP9aXcO3MlWSRSmAP6Sm6H2qpUV4OZLLzEeDBTaPj
	 cLJNbpPSM+2mQTqzwk31UV7+yBKKQiIOC6uf2c6Tv1WF5Vp+Txw7cVUdSWmBwUsfYgJCC
	 tfZWdHj4jJpCgm/j8gPo8TLkB4L0jSi69lYt+JMoAFHmCff2+QNyM/F7DyL8yRnoW33VG
	 int60UNGU3i04N9n+wDp4KmEiNv45rxfVqgO2ZW7dW2/veRM392PCor78jQ/l5vQpHjQm
	 AJAIUWdu5GfAiB/zgsmt8Ao/v9y2PyYtxWFFF+AH7uLXNSQLYI0nHpVCKHKNfc+7lBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xbh7m8ur;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fXfz2Dig;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F3D606A333
	for <dmaengine@vger.kernel.org>; Fri,  6 Nov 2026 15:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8F3D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xbh7m8ur;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fXfz2Dig
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Exqfj1038776
	for <dmaengine@vger.kernel.org>; Fri, 6 Nov 2026 15:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x3QLozfCyQOXqamzqmwUwQlpNil8HpltlRmIUwTug6E=; b=Xbh7m8urGrHgjcfH
	C9Jj0JDKyF6sex7I0ecYyn8uOXYx+Mq+2o+q4OVZsIrRVYm8lvV+6wjoFJ8ZO0Hw
	gnGiNk4ZEi/a1e04is8cN7Wd5Dq7bSLwQXAebb3nxwvttQ8QGHPeJxH7uKPdolIL
	j75jc2Y+SxwndaEORzmN6/SDKfTvbIf9cXwHSqTpZILgpvqnrL6bOFD6xRBK1YjL
	ZJtMTjD6SPQhm5L7U5qKKpnW2qn/gGNOFk1t+CYjPRvvn4N3XMDlwu5BkoTZmY+7
	RtcHSR9+2givifm7yIsvFpecrhf/4J0GOmDpOVnlCeN5OavnN/fzVN+XSII0GZix
	Hmhsug==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9uap8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 06 Nov 2026 15:02:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a3ee64bbso1488154a91.1
        for <dmaengine@vger.kernel.org>; Fri, 06 Nov 2026 07:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977333; x=1794582133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x3QLozfCyQOXqamzqmwUwQlpNil8HpltlRmIUwTug6E=;
        b=fXfz2DigYC9W6AZStwUIvED5E3+G9TM3hT/6b/mXMa3Fw5VUM4LqVETnXJAFTvuPXw
         iXwUURsT7GlR3NnH1ifiH2e+mh5qnA3R8LuNXAW9zORo5vExAx82UFfIY2ZoxrViSRU4
         UTCb7nOOi5MWhXfJ23EnaJj+04+QHVMvRnd5oK9hhar2/Mn7Zt3uUSjcgOmrBVkhbVjz
         DU97ehRMM80KqWdEx6aXURIDeWJh2DpWH1P9c8H2UcCq5ygG0sTNkhdUdLxmqMpVPs6q
         MrqZmdpr5aQD5gx8ftw1JfVHE5iadgBg3N4+1Lt8bvqM0T7Tan95yP2ON2aJPq5MFgW5
         jKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977333; x=1794582133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3QLozfCyQOXqamzqmwUwQlpNil8HpltlRmIUwTug6E=;
        b=QwGy4gyuCc1Lw2Zruhu33Xrg+rAsNUzI1+mQhSXMqTQFyQNw/kewllgZJ6o5qC2aOx
         5lBy5/pTP7pWjGYKhBLNRwrkfSJ+SzKtMLVS4IzD6YUvgUoY7AOFUWyl8xvhxWXquyBU
         ieGeDxPbNV7liztxM2cptn9BOWDOyzfEzg6kX2/tzZcfy3PwTB7Qgfz2MnYqHjMlhVST
         Ul7Bk2iSOTHLAaUEA0E58OUSOAqB6HlTzvM1QqlgVf67iZwaP+T6zYChLz6pO/GPmIgY
         5dLqsN6n8R4aMc4mSFWKZgsM3xJprV+U1AQ0CwfdIpOjyQBfttDk4QAka2XtHby+FKTb
         8U+w==
X-Forwarded-Encrypted: i=1; AL+hErEK6BCMnpZBdLPrOzLa+rPPRPqk6y8zb5PU5hiC+8+EFKWWAlUwAKXYzz4hlVn7rDJonVTFrxs/WfA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Zx45mWdYWwCtYJABQHHAegp9UrSVByJdVJpjszEy18XCyH5n2
	o0++a6WAC6tR0U0o3QjE67Pm4jeCzxGLJ9vOfuvgSvRYCjwMwP78/nh2V+Za4Qqk3PpFP4sbENV
	vX6tjcQakpxhfvPqjw8nfdJKQEVtYNOZH5Ll33g7w7i1gSP58OAusZ/JmTwt93Ns=
X-Gm-Gg: AYBFou1beEqzZ3lzr5+Nc2UJPIOF1uGBwmf+vJL3v6fAmIfvAi1g0aNHgcLQvL/e3sM
	+bK0CsMsNmz7jHKz9GJGTM6angR69kPslaAaZt6ADkOSGpqYs0DXyj4avaaMHeTCuC2+K3DeIFR
	xjnf6T85e7wlub/9Nl/zD3TDbukSUkFEJTFoN/G//xoKAiDPRvWmSEqFubZ9AP4tWKEDpVmNI61
	veey8Gam0uFOcq2rg2iEI8RWAgV0bKZh6Z91gDch4tZsAdpg00kTVPgu2GTzmDRGnF6GkWDf/q3
	sNE/VZ9IqzPtd5+Hv4XPxvrjE8eE/YShjrX5Ox13xjJWbo3nbbOoxlW/6haAHTqCcpJUulqfiF7
	oQg0vjazqhtU8su/Ic0ul60gYeg+xSF+XCJD5aiW/cbNwr5GLfqx06yCf+JG6cuEg0nRuYiFwAW
	tbrcUB0eqN
X-Received: by 2002:a17:90b:580b:b0:3a4:b418:94ce with SMTP id 98e67ed59e1d1-3b0db5f6fc2mr2667449a91.1.1793977332433;
        Fri, 06 Nov 2026 07:02:12 -0800 (PST)
X-Received: by 2002:a17:90b:580b:b0:3a4:b418:94ce with SMTP id 98e67ed59e1d1-3b0db5f6fc2mr2667408a91.1.1793977331926;
        Fri, 06 Nov 2026 07:02:11 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc1bc1e6sm100032a91.0.2026.11.06.07.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:02:11 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 20:31:21 +0530
Subject: [PATCH 3/6] dt-bindings: spi: qcom,spi-geni-qcom: Document QSPI
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
Message-Id: <20261106-qspi_upstream_series-v1-3-21f43042dd60@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793977309; l=1658;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=C58xMketS0t+z7bSIzaXbo2bSN49O8Fa6mvoWIRxlbM=;
 b=f9X8SstJaOTh1ZHqgsSboJwCtiukraMhFpa6kFNyRXhI0Nml5kv+MfcVpiY6beP6mpMSe9ePB
 g5MiXbB63ooDtkpJneWzUOrCzhZm/9MSz6TsCXjt2M5nAG0m68MBcuW
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX5hNqKZQXakww
 ChZDDV7RWI9GefDvEhZnESbVlFRKrqMHs76cGapfW0TLjDFwz6KgPik7r8ETKWtLYm+7C1IoEvF
 EwzW6n1AZVNPK8+4DzH24iTQJBq9+iI=
X-Proofpoint-GUID: zGy_3CIvfD5VvHymj0c3tomU4LfO0lKE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX4dSiefOx4z9U
 RAcG9KMmrFIsb+9LV0raEDoUcG5JeuBAhx1LKilBBHQqOGfmelBZHBgqHhZISpudM4sOkVYzGVh
 8EQGtMOUoTk6VwQ8RBVUZwZBMVUK7uGl/9KeoqwN+P9GCucOPwOsDAA9OY+7aEUx6wO5n9mpyCa
 M/2OiS44rdhHD04hcjQuOV8ckjy3MOV1xWKabMCzIPH9DojOpiZ/KGMijzRu2kvrafBeriIMWgr
 /cWH7zHvAyYIcIGaW8GmZCprkRqoEKvbtaNocZtDw8scp9mIgwEDDL79cm/eYRPf6/7jQX/E2wN
 VuE4DOYNpACB3iKY10STh4o9chtAY8Z8NtvEtW7uuG8bPUoKbFGnIcqAN5InA563j6EZbYzLhtN
 ph9in4wq7u/PA79nQCGw8ddT9RVN2Kqz5ZXEQHEkBUqV/Rg6zAM/pDG2R40ceJX2/W4BCvAqLO/
 8+RY1C/Gg195hojnhCw==
X-Proofpoint-ORIG-GUID: zGy_3CIvfD5VvHymj0c3tomU4LfO0lKE
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aedebf5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KUikZgbwDMKjgD0mul4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059

Add the "qcom,geni-qspi" compatible to identify GENI Serial Engine
instances configured for QSPI operation.

The compatible also allows the driver to select the appropriate protocol
firmware when the Serial Engine is unconfigured (GENI_SE_INVALID_PROTO),
distinguishing between SPI and QSPI firmware.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
index edf399681d7a..e568b67d077e 100644
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

