Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792561973;
	b=1ySb0UCSQcrgJTii683ZTfqHBWg1ge54CLAPfrJr8Ygl/2fxeE7fCLzoUZYH5PLhr4Ip
	 hMEyO7lmWkNC709xt+k9DBnBhdafOeFT7otVK9wttbeaTRCrMkRLcYvVHkDdCwtBo8CQa
	 EqHxEULe70RpNUV8qnBugkQ4+TLDehJMtAmjl1Q5uh5ke+UucuWLnz3ipQh6v1T+l5AJk
	 taA7/DvQOg//UnvcHxkovvJJg5ChyiXxyYSGBvXBsg3Rh9dQuQED5UJmIHFblGLN949nh
	 Xx+xn//aByLiemPdWtKfJyJ0xQHNQS5ArtSKAwnpuNz7O4C2cePVjNf/ZFRRBdllTIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792561973;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aeBOLAfuvG3vLQIFm4QLu9+eSGhAKNA99zhnOE/PgGo=;
	b=T39OYXlYrSAas21HR4CxpdacoD+osN5zeSCo+wW1MgYj00JFdvTbgI1lykIsuI4JRhES
	 90LL4xCHij9P5UkGeB33/Xb+xdCWH9eNjPrQuVUpik2SxQbcd1OLSvbPJM9ItKOk/lVmc
	 rU7cdZGYXrJ8phUglRMA0msgKhlfKgMh1Z1xecNTtdChJssZUc3rSyvmHt8LRZ0L9pBMP
	 YB9naCacs3dsCTA0uiIkC1ipgWT9x9G1mUdL3D23mYHl7Taer+rG4VFYc+R0jtcPIaRt9
	 b0ibXk/EZlpqHVuX4KQy2TZd5Hg7sgQ/V5cCWPiYYxyLVpKpbTZ5UTJeztiCycCbCsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CQxl4eRu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JzDvXP5F;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E22606A31D
	for <dmaengine@vger.kernel.org>; Wed, 21 Oct 2026 05:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81E22606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CQxl4eRu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JzDvXP5F
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5isch3018434
	for <dmaengine@vger.kernel.org>; Wed, 21 Oct 2026 05:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aeBOLAfuvG3vLQIFm4QLu9
	+eSGhAKNA99zhnOE/PgGo=; b=CQxl4eRutcoGdA1Jg3xSfH2ckXztn98/jdR6E9
	QWAbjjxNQMJ09NR/YG2cUZPOBfXI0kxcuCCiJ7vW5PgB1rzl/bUHnd/QIKXyr2kB
	SwsYg11evoE7PVaB+8BFvZLuJW+CHpw0tOskRYU/3nDCyeHtmDKip64hQkDdAJXJ
	QiIq9f/8MlowszX4k8KZ68qI72cOsr/c3obDEtru6QitKmSOxDBKirIUa8W0ixVD
	EDQ0wX2q2Gi2T8BatQnI+SveJANbrqL2x96ETo6eubQDjBK6nJm6tIrEnNNNTUo/
	zEzVDDqlFAOywSESmhpzi92uUgWIzmmOnSh2eYsTJXBZ/SGg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd2k3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Wed, 21 Oct 2026 05:52:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39512608fb1so767518a91.1
        for <dmaengine@vger.kernel.org>; Tue, 20 Oct 2026 22:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792561971; x=1793166771; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aeBOLAfuvG3vLQIFm4QLu9+eSGhAKNA99zhnOE/PgGo=;
        b=JzDvXP5F5GnI/6iPdXVDobc2CsmdTfyJbS6/bxpnYc03VS/0kxrqErnga1u9VUmVsP
         hbvSV+/d2UPJYllfOU49tnsk5hDG+B1GRU/eOzp54v7Ak6EBBkkK9KOcNyf0OyqPQigl
         2hnCLmzDUn8BUTChdmKZ3MVTG6MSJFG/xOKMQcbTeEN4GrHRe4dn0vezgGFQSotzQh/i
         VrfA3DzJIBFOClj5SaCocbYIagH7+wcmTOB9M9tJelZPPs7WBrUNujE1MgBPab1oSMKy
         eeotc0NTFc2XPyeaGh8HOLK83JAWtuEL6ucaCbRChK4fxWY5KrjC65q7WFDIjq6bJLYA
         tm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792561971; x=1793166771;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aeBOLAfuvG3vLQIFm4QLu9+eSGhAKNA99zhnOE/PgGo=;
        b=uHjqIRTjxkL+GofGNS/MrVyYpLYmnGn30sw/pZhCTJqRB9pnOOEmKVgOx04/4WA4JA
         jcFlDXJKDNU7n/wlxZffLU6yQqpwnklWJfyBpXAQP9pPGYgweEn4aWVLSx7q7qR2+iDW
         Wopv9QHMpZPxDXmBfv3fTy6FO2zehgI06R5LNzenvSVlI1WvItrUVXSgiNNEJ8Zmwom/
         qUNVGtjS3Oo/cdB8JOlIFZu/SnaZINzF61bqvz6WawwAXDIOj3jPzNlDN90Vkz9jFGM/
         pfzylDma21U2m8pafq//IvM+H6MP0DlPZGfXjhrCanE+Uzl2iPElgkEtaILJhRFm3tYa
         DWrw==
X-Forwarded-Encrypted: i=1; AKwUvBwwXw8CPburw+acTnuEcv0svCi8DndIKb5yZ7Gfs+NK4sAod/PGm3IA5ZiZqQSanyik5/yBdzyBbCI=@vger.kernel.org
X-Gm-Message-State: AFq9FYInTiVGyl8nH83rUFIQAOswq0vEaLcB9qxZaTWctMA8/8wZZOZg
	kXc9daUjiI5zr03cla/8CGd+ZZYUZ5gqTUmdhrmsSXbWGslT50CUPamaRR4d69a2uPBYL7CVm4d
	ijTqqs2osc1xpHCrK/e+i2PfuKvSpNvxve8uI8gEa/+ZBd7my/ZLgOloSqbk7JCA=
X-Gm-Gg: AYBFou0zTdcIwjdFKBQFNAyS+HzdGoKXkhKxh6VctubfLupeZrA6nVVlX5VufhRzTcT
	CqqohpZc9PjXaukkt7CQyzOyNFBI9HC0/QBwBff5ikgLXJcgq+kzq1fm54K6ub+myo8WMHtXysv
	LkeqW1s2oon63FUUID1JoHzZkBJnhVlvXHgBWjsyH/HjuCJWkzJvbxRolBSewtx3tTEbij0X/J4
	sGU3J0byYMcgXrBSbOP8N+o8MR19LMY3uHKdckiZOZU2rU3YDqYrixq9QmpwvPQd34rW/DlmxKH
	BIUhKWqHtSqpmq4AONsYofdLI8449tNCQ4A4d4NdvZFa+EAgdzmvtkx/+hmPwXYXOJzC5yV+dll
	4IwnpjMXxcQ+zIt2texZEfC4XK5sJOOJ7nAQ=
X-Received: by 2002:a17:90b:54d0:b0:3a7:9adb:2a18 with SMTP id 98e67ed59e1d1-3ad870a6e58mr927338a91.62.1792561970902;
        Tue, 20 Oct 2026 22:52:50 -0700 (PDT)
X-Received: by 2002:a17:90b:54d0:b0:3a7:9adb:2a18 with SMTP id 98e67ed59e1d1-3ad870a6e58mr927320a91.62.1792561970463;
        Tue, 20 Oct 2026 22:52:50 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad87b464b3sm1537488a91.8.2026.10.20.22.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 22:52:49 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:22:35 +0530
Subject: [PATCH v3] dt-bindings: dma: qcom,bam-dma: Allow memory-region
 property
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
Message-Id: <20261021-qcom-bam-dma-vmid-ext-v3-1-299355e8dd3b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACJT2GoC/4XNTQ6CMBAF4KuQrh3SFrDoynsYF/0ZpIm10mKDI
 dzdwsaNxs0kb/Lmm5lEDBYjORYzCZhstP6eQ7UriO7l/YpgTc6EU76ngtUwaO9ASQfGSUjOGsB
 phFZWylS60ZQiybePgJ2dNvd8ybm3cfThtb1JbN3+ExMDChq7VuhGKGH0ycdYDk95y3VX5kFWO
 PEPduD0F8aBQW2U6jqKjdDtF2xZljdEg6NoDgEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792561965; l=2323;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=GKu3U/JCde6C7CFbeQ7u/luBX2KRqwiMUvd07abBmHw=;
 b=8UBo3+7w2W1I/hvoc27B4fN+nKagnrduc1WllIkWSNVUERVb7XKK+TZaQDH7/c6JfE/2lY4CI
 dHVWr4ZxD93BAHm+Z/eTYG1pBONsOmc09ykiGJbA9sav5pg4CGjJofK
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyMiBTYWx0ZWRfXzHGhpUJWGTBp
 1tNdfS2h0wkGAvCtOB0K1k3Q99w89XtEhMyp43v3FYBcbF5Zw0ZX7H/pl9KDVQwGP1lWwl3m4Uo
 Ga125eu1YnyV23a5V6IW7Ik8lGWc2JO4gjEKkmtNrZAhRBf62hqn1zILKQNj9jl32H888102iqA
 0WVh44yprj+0FY71uppsmsCOHacL/42LwG3eWK/Qm7PlVNxov6wCtg5AZMcKJ6sV+TswsHNXVmC
 h4tEQXpNPas3uZg9OdK68DSN81dK/3y5bBuI//1y7fV0hHISMFc6dn9Gqrvop+/5N1JppEWwlKj
 YPU6AyHC4weeMrJKE5r06bqHz8TPGpQoErjpYZJTkrMnLbrl2nl20JCK7WoZGQ7W8mKIsGZamTp
 oEOy9aEjT0sOL9GnVyoEoplV3MsmPuFgNczroZ0lDDkPJpejFxkl1ciaysvlp9sQqb3XADLe5Kn
 lQ1b+EOy9q/t1ebifCQ==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad85333 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_tQzNdYRXts5BJOlV6YA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Rdypu_lxLGvbpTNeejHN5jblB_-oyplP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyMiBTYWx0ZWRfXxJOkznJB4KCh
 eQ+XHoc8Ld2fbnOgK6rrBPqaynBsF/U6DobKQP0R+IH52nFfUzI36Jr8q8Y4NcWh7PLp+yOLR/Y
 CPcEkNOLd8Pcr8h2ddCKMfpfLzkKa6M=
X-Proofpoint-GUID: Rdypu_lxLGvbpTNeejHN5jblB_-oyplP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210022

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
Changes in v3:
- Drop the example changes (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260920-qcom-bam-dma-vmid-ext-v2-1-4dbbff0e57c8@oss.qualcomm.com

Changes in v2:
- Replace the qcom,vmid property and BAM DMA driver SCM assignment with
  the standard memory-region restricted DMA pool mechanism.
- Rely on generic DMA handling to constrain descriptor FIFO allocations
  to the restricted pool.
- Drop the Shikra-specific BAM compatible and all BAM DMA driver changes.
- Drop Rob's Reviewed-by, as the binding was substantially redesigned.
- Link to v1: https://lore.kernel.org/r/20260714-qcom-bam-dma-vmid-ext-v1-0-cef87c57b7dc@oss.qualcomm.com
---
 Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
index e72adc172af102d8f400044ea0dc32db6b2365be..b7b348bf6ae2feba32ecaf17ca8696817a1ada4a 100644
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

---
base-commit: 2c455ddca7827ad8fa3a64fdbf5a60efb928b46a
change-id: 20260714-qcom-bam-dma-vmid-ext-8a3bd3c5c00e

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

