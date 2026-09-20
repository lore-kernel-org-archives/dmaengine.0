Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA523438A9
	for <dmaengine@vger.kernel.org>; Sun, 20 Sep 2026 02:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789871608; cv=none; b=Zvi/bytua3n5HS8WT9KhkVzgg8hG4S9K2ScGLQPy8TTDJZVjnS+WQPwl8RyfjVA6xgUhZ3XbJmJ17uIhnugxWaVH44E1EI7hr7lhM6Qy887ndYcE/ZGcbaN0QdlF54b9gdVDW73rYXvnLnmNPkZ3toHJgQO+e2L71BKn13hts7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789871608; c=relaxed/simple;
	bh=AIciJD7ZR0wQX72ob08+OdJjOe+jTPh+QkN3fU7AnV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qYdbqy1XqdEszV1ak+axvVRn1oVFapN3QRZ9pU9fIvDg4zN2WafyzBefv9Neao3Y98ne5XKHdcdO25pHW4MpkRz/lqM2UWJyn9XSuLhuvy06DqWLFzkEMkPkYnKSl/lWwMB+DRbpftjumUKJ0vRJNfzt1usQyl3/JXblIh2648Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MFd2iUjj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WyEuv1TZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFd2iUjj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WyEuv1TZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K1mVUc3961623
	for <dmaengine@vger.kernel.org>; Sun, 20 Sep 2026 02:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1j6nqTITOk8SF7fJV0hjTN
	onoSPb53+oHpIjMalqk3M=; b=MFd2iUjjv8qQSBRfQmlBaLRsIuKVJyznWJFeEc
	61w3Sdmk4gOslOU2Vvpp1DDrwG6rpqIp9ZF3KYV0oewX8e5Mj+/qaq/SX5ez54xp
	48P/99AIUuL2gO5AXfLJFscas4z0xQdHCFx8CsSV8MjyqgZPn5aN/PzHiErToacJ
	FaCBreQDzEutaRMN1nrd50Jf3jw8MStFjo08AXIFRehReQWOIiJmfkCA4gFw2gig
	C64ChvyJnJ9p660ZOPKX8i7JLXBHTKVtuuxX27fiDgUEJS0wUgchhm54rCbnOzaN
	HytDKK5duiu/aLlJThR2Mz9nME1iE2f0frSPllHLUgfqq0vA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskjk1y0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Sun, 20 Sep 2026 02:33:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db8c152622so18986895ad.2
        for <dmaengine@vger.kernel.org>; Sat, 19 Sep 2026 19:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789871606; x=1790476406; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1j6nqTITOk8SF7fJV0hjTNonoSPb53+oHpIjMalqk3M=;
        b=WyEuv1TZCsrE7/FpiBC3T52aMbLPxkKwLG54pBYNhnhoMWoeG3Lj/MfjY4w4wod4Yu
         NU4/FHJw9NrHuTLd9hRVVc4s7SinkS4M0oiShht37efJ4H7fsGy4witjzJL9kquB42Yk
         GYz82g0iDb9SLx1bH/2PNbMd/DQm5qQSY2aJW5CHfm2UCD7rUNk4xgfk3ppQz0Qhg614
         Ph+mM6LdCyyaKECvJpumVRJ/9ak5rzdiuqE194uKRjeurOuXETa2DJo9Mt3UewiAH1hs
         bmE6DwE4tPmvwsE+174Ntihjgen3MK+7zskMmuSe9DpAdKVIbBOjSws4nA1IoXsms1dN
         8yFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789871606; x=1790476406;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1j6nqTITOk8SF7fJV0hjTNonoSPb53+oHpIjMalqk3M=;
        b=lNA4hD/MJYdamntFvL8JhsPKdBBB8DExnD0PZDLp683zmhPCAZankHnYBOn2ABsBLV
         MlwbqnH4MN4CZX0Upf3Qn2Wa6FDfBIG7fLhhlTGauQCryXkfGx7noduEnsH4P+EV0Bh7
         J/DLiuDCqhoOOKKVSJyWbKFOCr4XdRY2WjzNUiH7Hx/4c0jza0Ngxwm35dLecyFDC3Ym
         mR6k+TqYIPHPl+18l85RiPDg/m/Sk1YFat1kbbuWTlN48wsNf2Oz/WZOUTTl22HzetWM
         Rf9dVyTXV+Ax/nkR7w6ZQdJiLsZpuC3WpdlD7VykojMP3+D3KFJUfyCevqmjWbOfMQYm
         m0MQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/STfiKuT8HzibLbbgfawqo2UgIOviNeAzvii9soAMQ7ymC2H4/Lf8Lv2eIpAwsd6e7ykc8Pk3bH0=@vger.kernel.org
X-Gm-Message-State: AFuF++kEPOvWQ0oP5/ytL6EM159WGRNNb+L75a5+moa5QSJulsBNvRIg
	i6RSX0IZj3v/FPUBaa6BIUTF7bK/yU6dRUSkrWo1CbIxOEnbttKmOgO03dmmsvvqa+gwRBdfd4z
	COgaXUoKHydm/XlC4LDDCdldV+yCcnfXrub90i3ytSn2BF3r9xHaH7eIkkzcxgzg=
X-Gm-Gg: AYBFou1Ib8MP8cxzEOcNc8jrHpeomldC2Wfl7ZMF4F77TjWdeqtBipiU+f0oA/olEsn
	whvpHqVBhpnpGm8auwoGyZemB7n8Igm//XPGJL/Ll8x8tr8iA4xEgiRHDVVd2CGdk2rNTKwwRsP
	IWpSALvDjOUEn0Py56PMmGrQANFheG5gp+HBiDZw6vSiqvKs19/VX4UXfhSYWUa040Fwh9MdXta
	yTNd6u24G2169cPeJEqhyBh2SxK4UAqQrXMcMAocd/0GI6uq12AH0Rhy0MSnvBNNIFXJO4lfavp
	ZDtat+TmRL2/y6LcxV7kQh+lvWaiekx80qAA5yHQJisqyIaNvPLhqL77bqoVQYSAtxfGbAciDuD
	0ZTYDA84U9Utf4wUj4xc27O2qA1boh3nYx2tk
X-Received: by 2002:a17:902:fda8:b0:2dd:87c7:a907 with SMTP id d9443c01a7336-2ddb1b7a312mr116771425ad.15.1789871605638;
        Sat, 19 Sep 2026 19:33:25 -0700 (PDT)
X-Received: by 2002:a17:902:fda8:b0:2dd:87c7:a907 with SMTP id d9443c01a7336-2ddb1b7a312mr116771175ad.15.1789871605121;
        Sat, 19 Sep 2026 19:33:25 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d5a21sm9045566eec.31.2026.09.19.19.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 19:33:24 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 08:03:05 +0530
Subject: [PATCH v2] dt-bindings: dma: qcom,bam-dma: Allow memory-region
 property
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-qcom-bam-dma-vmid-ext-v2-1-4dbbff0e57c8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOBFr2oC/4WNTQ6CMBCFr0Jm7ZBSxBJX3sOwKO0gk1gqLTYYw
 t2tXMDNS76X97NBpMAU4VpsEChxZD9lkKcCzKinByHbzCCFvAhVnXE23mGvHVqnMTm2SOuCra5
 7W5vGCEGQu69AA6/H7r3LPHJcfPgcN6n6uf8WU4UCDQ2tMo3qlTU3H2M5v/Uzx12ZBbp9379g6
 dTFwQAAAA==
X-Change-ID: 20260714-qcom-bam-dma-vmid-ext-8a3bd3c5c00e
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789871600; l=2666;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=AIciJD7ZR0wQX72ob08+OdJjOe+jTPh+QkN3fU7AnV4=;
 b=PBW27f4qUH9Hvcj4x0CFOOZybT847Owl6O4ioQHJsMjHzGa7mZD5gBxbPskCnE0HkbpJWazrK
 j516oPwuXscAircVdd1TkN2FYIKMmlVeG2SiohiMucxT6XXYFMbT3S8
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Authority-Analysis: v=2.4 cv=H6JOUOYi c=1 sm=1 tr=0 ts=6aaf45f6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_tQzNdYRXts5BJOlV6YA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDAzMyBTYWx0ZWRfXxZAALY8NvkKv
 1CuWJrVw+nfgOvw8NHW3icE/Uire3RvoLb/msXCx9pJZIgYtc41QTpdKTC9xg6Y6nsD9nY7k9Mh
 +lwB11YSpuw6OGXVm+J8Ohn0rxVZBhWn+voRHSt0HV2Hhf4ANLJonPE87ccGmfxKNcrPcxxPsRS
 pbcA2HdPTVsm0dTTjJUMQrf+9xoC5MHaGybzV7Vw7EKpSyftJu6+QRewDQnghjM0iU64PzhOBAw
 2xrKinRbGhoZyGRb5GKVIye/yg9i8SPWGLmS+ibXNs1n3kZl/3xAVxAxrSImC4dhFBWnOIAiSPq
 +0ungnFZdPVbI7Q0TlVsdmq1piiOKCWitXdNcP2CB2Sk9+4A30F8prxkL9hCZyEOh9biGuh6KlD
 XG/+YKBGC1BIdnOIgjPqpugzM53W8CvQMIKTPkMKsJDJhgulU2S1kaNAJLJ+eoa7G1CHPlEDpnH
 zmyBxZjrgEZtoZpPRgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDAzMyBTYWx0ZWRfX4xvmSOIAeK8s
 tvm2py2D9Kp65lAUzaefHkn9FAotgl1i1rt8Lv9sD6R5yn/3rXWh7XKJqU1hZqgrp4VPxyr0+nU
 GDe6qKh90yEIpRx62iPJL9A1szROonY=
X-Proofpoint-ORIG-GUID: pxOaPfsK-NVlOOc8r3nSZiP0mNDDI8Lk
X-Proofpoint-GUID: pxOaPfsK-NVlOOc8r3nSZiP0mNDDI8Lk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200033

Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
domain, preventing it from accessing BAM descriptor FIFOs allocated from
arbitrary host memory.

Add an optional memory-region property to constrain DMA allocations made
by the BAM DMA controller to a restricted DMA pool. Access permissions
for the remote execution environment are managed separately.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
Changes in v2:
- Replace the qcom,vmid property and BAM DMA driver SCM assignment with
  the standard memory-region restricted DMA pool mechanism.
- Rely on generic DMA handling to constrain descriptor FIFO allocations
  to the restricted pool.
- Drop the Shikra-specific BAM compatible and all BAM DMA driver changes.
- Link to v1: https://lore.kernel.org/r/20260714-qcom-bam-dma-vmid-ext-v1-0-cef87c57b7dc@oss.qualcomm.com
---
 .../devicetree/bindings/dma/qcom,bam-dma.yaml       | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
index e72adc172af102d8f400044ea0dc32db6b2365be..1e4324799f2b3b8a9ebf9f084e457e66aad20d28 100644
--- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
@@ -50,6 +50,13 @@ properties:
     minItems: 1
     maxItems: 7
 
+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to a reserved-memory node compatible with restricted-dma-pool.
+      The BAM DMA controller uses the pool for DMA allocations, including
+      channel descriptor FIFOs.
+
   num-channels:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -137,6 +144,20 @@ examples:
             qcom,num-ees = <4>;
             num-channels = <20>;
             qcom,controlled-remotely;
+            memory-region = <&bam_dmux_pool>;
+        };
+    };
+
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        bam_dmux_pool: restricted-dma-pool {
+            compatible = "restricted-dma-pool";
+            size = <0x40000>;
+            alignment = <0x40000>;
+            alloc-ranges = <0x80000000 0x80000000>;
         };
     };
 ...

---
base-commit: 40288c9206c17eb66a603262e06a58d300d0f279
change-id: 20260714-qcom-bam-dma-vmid-ext-8a3bd3c5c00e

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

