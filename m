Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC33C36F902
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 11:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784632559; cv=none; b=rMCVBj08w5KsUyJm+NGXg7TSAC1jna1HaIUXGJvYrbH1Za8XWD4tUjmwS1q5NFlKXymoVqr9Wnt2mG2UC2VWdTsHozwg7UgL5BvJixowNOtxZHN5H5j4PmwN39CkxveKSzyGBKNOT59VSA/sU8hSLqs/Zdj66LJhL3Oe4H99WSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784632559; c=relaxed/simple;
	bh=NEBTq2qMO+3a3T1pVwTZ2uHZNFbfvbkcYWMWPDjDQVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bUZNoogY04rGezkwTy3CQdkm8ghMliZpHJdcwDmxSLYdGZmkqIjUrTvph5sqB8HZHop+pIiV8+DY1EZb1X9H9scaV+0rFJodtf9QkVcEnJPsy0CtOaWOL5Uvq4XHC8wqfYW9kfWOokhCj9rkgW8h16vofxw+D+A3zgGL3tDGZpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BlpayPPf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgLeio6u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BlpayPPf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XgLeio6u"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARQp11230082
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 11:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MVsnZcPY5WUUaWj8/5K5hz
	/PWPFC6jvi3dDQkOYyYj4=; b=BlpayPPfW+g3+dk0nsVDuYKTyjD6MkAWe8hZik
	bAjDnpfKV+US+su5Imf+7mJWAd0QYufw2rOUjA2SoBSFRcwxyAWZpfRSgl1sH11E
	CTDUQQgZkT47UxbI3oYQ4KkFSCrzMLivLFnF6Verd+TkE0tGVyRWQheb8f4iddSa
	qB/dmJxNknasdUMDb4liLW5D0Li9MReA8tgxbsExfNoh5DKzlW7zQSGl/vqdQgVm
	kmfz87/O1e3RjO1ccLaKkBXCcMtQF8WiomxVpCh7WvUUBrWTk5b4i8ph9dSNL+YU
	aWH8ftipLdA99bGNXVQ2AdKENemd+9QWK0ve6sQnkIqxBI2w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj01aa8xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 11:15:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e6d253330so2838289a91.1
        for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 04:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784632556; x=1785237356; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MVsnZcPY5WUUaWj8/5K5hz/PWPFC6jvi3dDQkOYyYj4=;
        b=XgLeio6uPSgk5gUy8Vp+AIPRaJOGYrfwCtVcX1q7RqgC1x/WIW7omX5BYUVcH/hf2K
         4ruselIdIA6rAqpNfSK/iMCVXKqsgzvHVp34w4eKFHHxrK6+ktsjZyKMGvEKH2dqJLUS
         kq66b8aB7HQqwHZIkHFlYtj0ZjzYYpkJ3YfKDLEYxR3eHo87qjLO4lq/t7lzHOhP/CWM
         Vj3MEy4FIRQSviQrgH3kVYz7Hfm96tlZ/WRPofCMOfL1DnI8UcHjqWOoNIYnS67iMscF
         HIiaoe9o19Wy84ggVs9IHENWr2UjYucTN9AyfFl50uLdU51BtF98fo2leWhaIX+RGf4m
         diiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784632556; x=1785237356;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MVsnZcPY5WUUaWj8/5K5hz/PWPFC6jvi3dDQkOYyYj4=;
        b=cMBt4vT1JTj+P7t9VLrbs+tT7WezoEmcFOEi4R0AiwGI34LQySoHaPVvSvB+OY9B/o
         ItTlozMX9FCvyCRYRGB8kFw3qpQdNuCMWTRoo+wTTKAdxxKZhUITVs5ToDpQHJos31Mj
         qnP56VCrqn/A4Ldkgnp7TIPqoFcfZW/z9Pgp39tWEN4ep52vm+lAo0yGUHqtziq/Ojg5
         ax9WsCp2i+cSQyC9PwtiHcDny3kMruRLR0rEBmBaaS9Tuq8tQZjFUImJXJrhD4h1b3Wk
         AlO0ag3SoxGpllDg8UN6xhdPGgrWRll/21aOId+hEZmjL2EetFH8e4NMAaB/RUgYsMb2
         eLfA==
X-Forwarded-Encrypted: i=1; AHgh+RpaszFyHspG6ElYUBByRR/M/3d2eKOfjNRFP62dYvhk0NrYdKAL01npxab1QtQe1jsa/T5exrhnJIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuWglkMPAFXbDrYgkF33HolR3voXnZcfVwb8clAZlUS38/NQVD
	JTT2xRsxCWM1+SDUx9dJjM3rVAlOKB11WIKYINrjEBrL3N2DVOB+WECv056RKCUc8VYa8pNcrM7
	FDcl9YBqScUkZgviyJRS4Pu7YT1lzWV7ToNw/u/W36j93Mkpcyv4yknR5GSFpgCM=
X-Gm-Gg: AR+sD12vav80pWFjthdGaESUVOK6UQlRVJJRp53SoQPIwWwluJ6ReA8K30OK08GYgLE
	hwTCuCzkmsCYVqxCykOy9yD2R767QeIFcFR76iK4YEOj0sJMBw4WJEDXKBlAX+AoC63oIa3Zf5q
	Kd51OgTXrBi1p21UeVwPF3nTNX4U2OJjK6XS4pK9Lc01B8x3HJ1WmlallFYXzXx6oYcA2Oit9Xq
	sCCIR91VfMHslcu0rPEljSyaTAqygIdOTz+6Tx+0/Q11WHWBxkUoLrazgDNPJtN5hatG+OZ/1CB
	f7aYtjI+SuKdvBg/kHlEsYmdHEpVT3HU++0/buvHVwJZQP5TYr722uqy+R0DLBcRSwFvcxRsUN4
	2AOOCvSJxYkrqXMJtNclXAr/ZM6TJHE8qtuCqlcofJc3j4maEgSCGAFWPfFIVQhQ=
X-Received: by 2002:a17:90b:3e8d:b0:386:ca4b:16a9 with SMTP id 98e67ed59e1d1-38e4b686025mr14627247a91.16.1784632556185;
        Tue, 21 Jul 2026 04:15:56 -0700 (PDT)
X-Received: by 2002:a17:90b:3e8d:b0:386:ca4b:16a9 with SMTP id 98e67ed59e1d1-38e4b686025mr14627233a91.16.1784632555716;
        Tue, 21 Jul 2026 04:15:55 -0700 (PDT)
Received: from hu-cchiluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e9232c388sm1358096a91.6.2026.07.21.04.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 04:15:55 -0700 (PDT)
From: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 04:15:46 -0700
Subject: [PATCH v2] dmaengine: qcom: gpi: Fix SE ID and SE Protocol fields
 widths in SCRATCH_0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-fix_se_id_and_se_protocol_fields-v2-1-ee1d63d6c549@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOFUX2oC/42OQQ6CMBBFr0K6tqRttA2uvIchDbRTqUGKHSAaw
 t1t0QO4mcxL/vw3K0GIHpCci5VEWDz6MCQQh4KYrhluQL1NTAQTkinOqPMvjaC91c1g8zbGMAU
 Teu089BapVY45kFyeKklSzRgh3eyKa/1lnNs7mCn35kTncQrxvf+w8Jz76cQfuoVTTuHIbdtyp
 mylLgGxfM5Nb8LjUaZB6m3bPqgvAI/pAAAA
X-Change-ID: 20260710-fix_se_id_and_se_protocol_fields-d7f0fe616596
To: konrad.dybcio@oss.qualcomm.com, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, bjorn.andersson@oss.qualcomm.com
Cc: praveen.talari@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com,
        Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784632554; l=2400;
 i=chandana.chiluveru@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=NEBTq2qMO+3a3T1pVwTZ2uHZNFbfvbkcYWMWPDjDQVA=;
 b=Qe4keT7HCz1AgMg/XDMgDqta4qcDs6+JohgeQSgDZVnpPoKXa92NyHuS7BN8df8wZHLD1VvxS
 6YXlugjjUiuAXhZoPi6NYlN6vX+eDJiLTa7nv7Udel7aV57zovLq3tR
X-Developer-Key: i=chandana.chiluveru@oss.qualcomm.com; a=ed25519;
 pk=JOK6siShQPtXwMyPXnFlFIPPNGXclzVFIJL1EuyLmy4=
X-Authority-Analysis: v=2.4 cv=BL6DalQG c=1 sm=1 tr=0 ts=6a5f54ed cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=ptTHJtPLR270ybZWXd8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDExOCBTYWx0ZWRfX4MB8mscJ5Ki3
 BO1kQyFxeyNoNO/fD0GWjkbcmln91cxdW2CW/tsqxoV0+BOVyLPcRYWdHEaZjx3MIadkWF82yaE
 TTZ6WI1taGBH7t3HLlkesD0NmsJI/Hd253FBRKsZu1c1Duo8zHhrpeNbH3Y29Cr9RYDpjObzMko
 mm9ePOBoqe6GK53PJYFs6Mwsk8/0WZTUn8g0QZw/LhBq9lq4oySxxGkP8mPKqJYIXYLk+VDDTyV
 uDtTr3/LYoC4p4y6C2tkOGgu9/2ghoX5KkilbvehCLlbwt1jTz+jtfBqyL3mUm81X8tG5YLy+A/
 7pTyNOyA/xbIc+xL5L/ZyM8axvzeZk18lSZxl3/SsYRgnx4PzwC7BMvf0RJ4OgKs5fLwDgCLbak
 HC7eCeJH+9eLCdpcUjl2lwU+7BnVI2wndNTzxO4kcz/TWLGLQoqe/rOPJGqW40FXiqjIB1y4Pk/
 NMEO42u6k5RwFLYS9SA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDExOCBTYWx0ZWRfXyQOB6eBOEW77
 xmhJjHxGK68MgMhL165a03CzP7PcYCBHVTjqjEA2QOxGP6rN1VkkdT1WhzUiwEds7Kpsw6we9XF
 fOoh5TA1qWKZDyq1yGpLTzE21aMWXI0=
X-Proofpoint-ORIG-GUID: 8ENp1cGpE9BYsNxJoPGKmkqs1qmzB9Cn
X-Proofpoint-GUID: 8ENp1cGpE9BYsNxJoPGKmkqs1qmzB9Cn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210118

GPII_n_CH_k_SCRATCH_0_SEID is currently defined as GENMASK(2, 0), only
3 bits wide. Serial engine indices >= 8 get silently truncated by
FIELD_PREP()/u32_encode_bits() when written into the scratch register,
causing the GPI channel to bind to the wrong serial engine. The
channel allocate command still succeeds (it doesn't require the
target SE to respond), but the subsequent channel start command times
out waiting for hardware to complete the handoff to the (incorrectly
bound) SE, and gpi_send_cmd() returns -EIO leading to GSI usecase failures
for SE8 and SE9 serial engines.

Older documentation, such as the SDM845 hardware programming guide,
describes the SE ID field as bits [2:0]. More recent QUP hardware
documentation defines the field as bits [3:0]. Use the wider definition
to match current hardware documentation while remaining compatible with
existing platforms and enabling serial engine IDs greater than 7.

Also update the SE Protocol field definition to match the documented
register layout and keep both fields correctly packed.

Fixes: 5d0c3533a19f ("dmaengine: qcom: Add GPI dma driver")
Signed-off-by: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>
---
Changes in v2:
- Updated the protocol field value properly
- Link to v1: https://patch.msgid.link/20260720-fix_se_id_and_se_protocol_fields-v1-1-e41dbb107d97@oss.qualcomm.com
---
 drivers/dma/qcom/gpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index a5055a6273af..fc12cf9122f9 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -207,8 +207,8 @@ enum CNTXT_OFFS {
 
 /* Scratch registers */
 #define GPII_n_CH_k_SCRATCH_0_OFFS(n, k)	(0x20060 + (0x4000 * (n)) + (0x80 * (k)))
-#define GPII_n_CH_k_SCRATCH_0_SEID		GENMASK(2, 0)
-#define GPII_n_CH_k_SCRATCH_0_PROTO		GENMASK(7, 4)
+#define GPII_n_CH_k_SCRATCH_0_SEID		GENMASK(3, 0)
+#define GPII_n_CH_k_SCRATCH_0_PROTO		GENMASK(8, 4)
 #define GPII_n_CH_k_SCRATCH_0_PAIR		GENMASK(20, 16)
 #define GPII_n_CH_k_SCRATCH_0(pair, proto, seid)		\
 			     (FIELD_PREP(GPII_n_CH_k_SCRATCH_0_PAIR, pair)	| \

---
base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
change-id: 20260710-fix_se_id_and_se_protocol_fields-d7f0fe616596

Best regards,
--  
Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>

