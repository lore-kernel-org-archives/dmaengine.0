Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFA146AF08
	for <dmaengine@vger.kernel.org>; Tue,  1 Sep 2026 07:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248505; cv=none; b=gLosNdChazA//K/VQetNg7yBt4EWdAeB6AUqci7Xg1/VE4X1dSiNUef3GL821YL9RPvCP8svS6WUuS2JW3SQueR8pYX7+2lZfpTfuDc8j/1bv9dt4Iw9h7X7cJGTowcSi6yyB2Ik2/kniYuU9mSNUL2WVjaI7uxESGnG7QJO/Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248505; c=relaxed/simple;
	bh=ONrmBwAPLKPDlLFjD5hZmt3ziTbYPhrJZcF4w2m5+I4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=d3GAsRNJF3RYSIYRD7c2s4Mp8p7uhlig6RP3Lk+EOQQfiApPaPAX0Wxia3GFw3B+3kLq6h9syv5Jv4DfuoK9sfrSCucF0G0RkBq1tqZZU9hMRaVvOYSVzxkHpW0FfhexyTOa0sLJ4oLGVJDNkI9CXrQml0tsV6Kvq0Y5ijvrnYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YdY5cTsk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dLpGYi10; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YdY5cTsk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dLpGYi10"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179PE41282911
	for <dmaengine@vger.kernel.org>; Tue, 1 Sep 2026 07:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nnUNgIXtKmNalo4SOMUEDy
	v7hRZV28dJ8kqH+HmyC9M=; b=YdY5cTskCMzpW4N4kEBkWYQmFZCo8yibD/YSWY
	agJ7X/9MxI3Opgj6tAP69fWzme5x+3N7sAZ58623qdBmdEIWIDYxm1x5p4ye2ZrO
	/BZ5W5dM0hZsKyknh0c52WEK9NhR1HBqNsGqmfXZKm6dFL99WnIa8f8N5apVI2rj
	cIXeBni4Fim+SBnmvNqzVeYkMmjT4Z+51l1zqgELqrc6B49G/tHNlmFXZ4tccEg6
	2pa/7oGOomg1QShKtdPpZXIaAElHgVQeWH21YnJpQvQ86D+hqcVARTajOw3lYOIx
	HV3qcgVGXUXfMF9KD9eaTQGlRC4dx5HlAO/BrPdO9Lzga/XA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndx991y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 01 Sep 2026 07:41:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so8335817a91.0
        for <dmaengine@vger.kernel.org>; Tue, 01 Sep 2026 00:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788248501; x=1788853301; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nnUNgIXtKmNalo4SOMUEDyv7hRZV28dJ8kqH+HmyC9M=;
        b=dLpGYi10ymix9+LhzbUOordnZSM+xGHm6J5wpEwQGk1aG7oaFBKLENttcFb2GE990e
         XmeAFjHGVa36oW6RlBkzVz052ol8+kYzTPrfDL3zt8QoPjiy4ohC0mtb9BFEcdidhUaq
         1raSpI2N91n1gP6Zb15SKFyTmYzcQ9eXu1WIChsLbv8xfI76nnRXS0QpfF7BOqo77Xam
         dgz/PTYtCui4ywd1T33KKaMT39oIvTeym+70s/hA82Pa4w+FGzcOCaZJcHArJrNs9B4j
         EoJ7XFMPtdU0noTN7G2xe1BJ9nLO0AFzPAP6y8gX8OLei12O8IeNkWtfgw9bBqAePKTy
         MOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248501; x=1788853301;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nnUNgIXtKmNalo4SOMUEDyv7hRZV28dJ8kqH+HmyC9M=;
        b=ZlV2svCIlVwCuiIBqE3Q06SxKcStkN0TmSmZTKJV6k+qblYjsh/ndtj0iS3J3raEff
         W7z4wB9uADKivYG6SzK8Z8RoQhP2JUSaJBYJaMuHdtu7LvhhbN7b0wEiV5BFFKXjMHxk
         4O1aOnLDmAYFVZ8bmVAmMz1YKEtTDNgc8YKXWQ+WQibqAs5asKrdH0QLRhkd7RWxTbTn
         IbjPRR5JpPqku2rj5mLV2e5FtsxdhC5BO25Mwn9LebsdL7A0XtAoVk9K5WBr1VbMoRVJ
         7YFLCUAXMcZQYQrXBxbzh+bqTjEgvXC7Ah64F+pHcGE8t3Q5gab7HeMc6FYkOKXaOLey
         0PLw==
X-Forwarded-Encrypted: i=1; AKwUvBynQ1a3qaRSAelafDTiK3yfzymF7XbvJnxnpvz6M2DVOF1D13L7LNDSKC0tRV+HMVIs0iMZcSSKGLA=@vger.kernel.org
X-Gm-Message-State: AFuF++l3J05tKtrkqhh1P88zVVAkWnHGXRf6vy/f78lNiTgg4tgzsX3H
	hyUIcmCot3U1FSKmvVqbFlfAUF0cBVRBK6jy3sW8UNJ2zxOD5NnWYMzUnRSpUYoOOLL45Xqa0jl
	pMALVDsrki5hKgya6KOTDUUiaKzBswQS3UCz4cfOOMMcVx5Y/BqINhkSG6dF96sfv//tMnWM=
X-Gm-Gg: AYBFou3xmicRA9zQv3c6tSXWHi8QuhWLHTgbsjig94pZu40TISNgzcLiVep+PLcfaz9
	Krb7uZaBx6FtFC6UEbS58pHZZjm3cw5h9VeRJSOaXRiGbmGjrZqAFrJjbLjbXh02IO7nzk/lk5h
	eV7CUIooONsz7c0RL72j75WhXN8dMswri/MZurFRgR1d5FyJ/mJzxRJUGSEcNRoLLJBOKpSuYsR
	ZEVpjK/IVhjJ5dUpb8D3OnAnu2sJj9/6lLtwI7c6LLAajx96EaIXeifpRtzjfshrsx5Ifk3KpYM
	8WmHJysZv7wgTPq3ew4vaC0t8fl9YuffF6dWBSJUtQ8XiFhPl4ED5EZF/y/QIXphZ08x3SU5aOr
	6HOQUj2iiouYzaARyKiRp97YAbEasdOhDiB8=
X-Received: by 2002:a17:90a:10c8:b0:399:221d:63c0 with SMTP id 98e67ed59e1d1-399221d655emr2102116a91.25.1788248501278;
        Tue, 01 Sep 2026 00:41:41 -0700 (PDT)
X-Received: by 2002:a17:90a:10c8:b0:399:221d:63c0 with SMTP id 98e67ed59e1d1-399221d655emr2102052a91.25.1788248500815;
        Tue, 01 Sep 2026 00:41:40 -0700 (PDT)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d4f1bb8sm5348784a91.14.2026.09.01.00.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:41:40 -0700 (PDT)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 13:10:59 +0530
Subject: [PATCH v2] dt-bindings: dma: qcom,gpi: Document GPI DMA engine for
 Maili
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-maili_gpi_binding-v2-1-c10dd2324a09@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIqBlmoC/yXMQQqDMBRF0a3IHxuIaa3oVkTExG/6pI2SWBHEv
 Tfq8Azu3SmwBweqkp08rwiYXIRKEzLvzlkW6KNJSfWSpczEt8MHrZ3RargezopHoTOlh5Jz86T
 YzZ4HbNezbm6Hnx7ZLOeIjuMPqAToiHUAAAA=
X-Change-ID: 20260901-maili_gpi_binding-37b12bf9e5c4
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788248496; l=1133;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=ONrmBwAPLKPDlLFjD5hZmt3ziTbYPhrJZcF4w2m5+I4=;
 b=QU1D+HH1NTvIIaP4M6LcF4kHhVq3AN88zrlvq9ubeNwxKCWBZZdTGu4CHHV97vAlhBNi6z4uN
 34Uvq+LKPjjCZ8dSvEV34LyNVfQgGbShuTu9yKQrRfJ/RRyKrTZYxgM
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-GUID: IzRP2_pVrRv1EWnc3evzzB4ywEvKLg4J
X-Proofpoint-ORIG-GUID: IzRP2_pVrRv1EWnc3evzzB4ywEvKLg4J
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2OCBTYWx0ZWRfX8NVLu9YcV7Bw
 nuTx7pC8zugWOtFMKEDlUZZGeotXuW7mSQzPt76XGOdgBJtP1GkSgqQOMH3cWwi32YerXSBEzPv
 /Yyg9P+1ZhB/2xnFzeMHzRIbOKYJ8wM=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a9681b6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=THIw8Hy6Aik7p87rLRkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2OCBTYWx0ZWRfX3+fCeEloC8yu
 kI3+QWo9Oa8SMTWd1zwFQ2XLELe/xe1/8hvzIvMcTGC5REJ5jud+OjCkH9r6sy25FeeLSI8w6Ki
 RieoWeIgVdZWUPqQZ1PcbpIj8P+xYQXtC9Abatd22N75eSo0/B3Ings0SHe0thrQzEVwfok56Od
 R1G0qE/Zk5FqV3URxwnw0UJeUCu5GdA1kdCdYKR2/Aeek1d3T2/jjs0wNI7Om3FC/RhOSKU7C5T
 s8YiaWV5QaWXxScIS15okHNehUfbw7Wdr8bkO1VtAOGhtEGaTEouzNR0QyItj7b5LEErsOsBUOA
 ocGmIafDmIdmOWIlFteKx6h0GTRDE9Z2dP+19s6WtsIEI5qj0B3eUDG9Tylz1QTOaijsoJm7Wc4
 1KS8ej8uMYmcKLVJ1yHYdGrsdO/U9C5xf2faXclbLsiuXtB3DgzQhvw/obu6O0+IqnZpWxyTwTJ
 NFuzoXrlbqH69/tJL3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010068

Document the GPI DMA engine on the Maili platform.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Acked-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 54dca623223d..dfc4a3054b5d 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,glymur-gpi-dma
               - qcom,hawi-gpi-dma
               - qcom,kaanapali-gpi-dma
+              - qcom,maili-gpi-dma
               - qcom,milos-gpi-dma
               - qcom,qcm2290-gpi-dma
               - qcom,qcs8300-gpi-dma

---
base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
change-id: 20260901-maili_gpi_binding-37b12bf9e5c4

Best regards,
--  
Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

