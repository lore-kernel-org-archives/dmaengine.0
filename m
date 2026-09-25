Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4F94F55B7
	for <dmaengine@vger.kernel.org>; Fri, 25 Sep 2026 20:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790369509; cv=none; b=MT9+tABql5QejKX+q1YVnNjaRV7fDKPd3G2x6mNrzzuNvZcHspa2By44m18ghb0P8eeH3DTVG2D5FjsCuAxFv9ceH2kyO3PKvE0NP5jYRU9LRlR3qk4+QiMm06wHrE5bpfYvfHuk/Z0UMsXZwHOUHQQfoZB0yL6vsIvEu2/ocQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790369509; c=relaxed/simple;
	bh=ts9DOEaWf1lBa+eQI547Ro/oe0Z02nVSejCO7cX47qg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m5yHVd/4t8+nugy3LCz0cb/Bgu6Pf+brvqN4ZmuXme+6WEKyNu56zhLTqSTxH/Aq8puZ9R0IJUQfTggr1uZJHXLNy36Px395J/aJImhBAy0vQF9jQ4xDtuUbWsjBrKbcBLsuMQVdVpSB1STpRZOdZWoNlrNCVesPU70Lwoga9BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RdcZgjxJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wx/g4gqY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RdcZgjxJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wx/g4gqY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PIoC3p1862906
	for <dmaengine@vger.kernel.org>; Fri, 25 Sep 2026 20:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pEVAjbFWnMm/lUi5VG3+Ez
	bqFp3o1qRYwGZDsG3MLYo=; b=RdcZgjxJ9JSf1+Ey1elKEXGW4DC+8xleOCd6+m
	s8H56mFZhPaZl+QzJOVKD6Nj/nPnm7kavhuPvKe6Rd09gpl4qKO6/8pliN0YG2aq
	NUyduOpIjVz6UKBgMTGlmZwN6Pmc9qGInQTZVB+aCxLuVkWPL+etQyQlPFkh20hQ
	DPv+Iah+7YB3P33O1aGgn9AXiIzHQN7OwamTkQDhkdbqHjqVDEphDjWKGoUkFBeL
	2Yjj5/nznXIAn6isgx87DsH0MJLjY/mo8C8iy3AfZDjEykMkfT4EBqmRT52NWyoh
	abpd7cTknCLnyn4Mxxu/2Y2JgoQgo9XZqeGJIYzR4LEOmgyg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr1021xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 25 Sep 2026 20:51:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-313d1015161so4461472eec.1
        for <dmaengine@vger.kernel.org>; Fri, 25 Sep 2026 13:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790369504; x=1790974304; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pEVAjbFWnMm/lUi5VG3+EzbqFp3o1qRYwGZDsG3MLYo=;
        b=Wx/g4gqYRPigiEJJxUOtcJxoBTJH/b1upSFJyyDO82kQmBP0734R8jtt83mLt+I/sf
         MiTlr122rTPOPk1o8455OfLD2oAG0HfQS82snpgj/kZ3DO4Xd6EaCmud92Dv5+egH4DU
         FOI2k165Bj9HHht75wJvOIBgqzi7up+j6cDU/Cj4UPQ1VV5qVpIdwAgzLf9A2u9J//J5
         CQc1kHvr5cupZIrJsf5QkuMGYmINxkD+gTpM4Ii5XV3ZWJ1k3oY2xpSV1Uvz4tN1wZ+P
         XooruyLykW+kPFPQcyevQ/vdQ6akPSLd5V3h8SR34n8emm/NtmEsjjaqZw4eBnyiCT3Y
         E+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790369504; x=1790974304;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pEVAjbFWnMm/lUi5VG3+EzbqFp3o1qRYwGZDsG3MLYo=;
        b=dt2oHfvbi9RQae/dSKKgmKzOBW4oqyMYzdQLreu2eacYPT7LgUJda5Lui+ZjWQ6DTk
         rRHT0TuP6jq4G6n/VabwKgH8xRKE7/U/QqeSZ4V3WvQz0UAbDFyHh1VcwACunA3wn6Wk
         bRWKJ5dnj7LPrtJGITynTQfTr5OF0P70FLM3LSm6TX83AaGVISW94CJMkj/zi+rdQRE3
         ewWl9L5Z6NSRc0KokEQlhRHHpr8T5dBgAudhW8PqxmbCGalcvHAFwDAaWtA8fGLHjFi5
         ldcE3qZY9sKZn8ACtkwNTpmxPITwEcvuzP0Qxw2bCY6CXLD9//61+i1YyPy2PoOShqBS
         5rDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyxZ4J3fdEMpg7hVgMBhZGO9axP7jW1/YXELsRrPeSK3kWh+6npfAgK9X1txVDRwq7hJ/tXONXx+A=@vger.kernel.org
X-Gm-Message-State: AFuF++nKZCBeWobEf+bmwKmw5u/NhDFuqhwX6FqFQR++ru1Ur2srttQo
	G6ewnF4vNcSlc9rkod+ss4GeuxHmk+V9x5ESzXVcnVSF6qjZ/OPNuFyj3PKu+qZ+8mrD5LseYn5
	gKY/W6321MtYVOE9ZJ+4i/OnnYu2teWcI95Z8wDiTJwCn7I5hJeJCioXFL8s8+/k=
X-Gm-Gg: AYBFou11QfDjpoPv1hJF2sLULQJGO42jNt/uEJWbsx4L4hxKAYvZF0/DDw0Dsg1tB4D
	sJ7nZP1SXpCXHh91klRp10qmcAXPgdn9FYUJkAjBB5NMEGkJHEKpTsTVLKnKBpm8NPKG4fFe792
	H+DUxtVJTnzkJz2sFM3FAQlcPLZ5he0Gxb6iC9WcN+87TKp7Do8G2Wh1QsbK+ZVycBv/a7x8DhG
	NRZ0Tjguv99gaihxcRs+faWEWbtbLTZkfUjce8+CiGMBnS8jc9kll8JlEa2IpWChaUxzdAixHsu
	Hq2MtQBRUpaSUmMwItGfcZ7P3aQWjzc1bKCdWk7S8KB0uFoitxDP+Ku96s01VfcGbHC6+k9E86S
	c5QgD2NeTGQLFPT4se/mgwSFu1lE+BJm+
X-Received: by 2002:a05:7300:d204:b0:33b:f8f9:c8e8 with SMTP id 5a478bee46e88-3426feb9da1mr1237308eec.1.1790369503952;
        Fri, 25 Sep 2026 13:51:43 -0700 (PDT)
X-Received: by 2002:a05:7300:d204:b0:33b:f8f9:c8e8 with SMTP id 5a478bee46e88-3426feb9da1mr1237274eec.1.1790369503231;
        Fri, 25 Sep 2026 13:51:43 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757f31sm13085734eec.14.2026.09.25.13.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:51:42 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v3 0/2] dmaengine: qcom: gpi: Add trace event support
Date: Sat, 26 Sep 2026 02:21:34 +0530
Message-Id: <20260926-add-trace-support-gpio-v3-0-8572bf7456b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANbetmoC/4WNyw6CMBBFf4V0bUkfKNSV/2FctLRAjdDagUZD+
 HcLLtxozCST3OTec2YEJlgD6JjNKJhowbohBb7LUN3JoTXY6pQRI+xAKk6x1BqPQdYGw+S9CyN
 uvXVYCKP2hS5YyQRKYx9MYx8b+Hx5Z5jU1dTjSlsbnYXRhedmjnTt/ZVEigkuFWk0SacVPzmA/
 D7JW+36Pk8Pra7IPjRBxE8aSzRCm4qWXChVVV9oy7K8AE/PSo4jAQAA
X-Change-ID: 20260831-add-trace-support-gpio-99eb54d42729
To: konrad.dybcio@oss.qualcomm.com, Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790369498; l=1972;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=ts9DOEaWf1lBa+eQI547Ro/oe0Z02nVSejCO7cX47qg=;
 b=emdfuG2GAP2OB7/X4F59dGDE24GgzSnqsrAyM30SzdpZprd0kVmSz1qSgnQNvJIR72EjhD8NX
 MCyVhecKWc0Ai6HGkTJkvh/OA+ZZzWvsRBcN+hjzDBpp6azgPzxTFUr
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA4MyBTYWx0ZWRfXzFifSaifF119
 vjo8VavvWJSSYwT/Wxsp+ClmHoMPHRgJG/4FfptnWs60b0aotmpRvtwOJlQyztCAlaYRdgVOBRk
 d+gTG6OOt1ozaDlH7rbnOjfzGPm/RHi2ldkdx8hW3sTLgqyo0kAnwm6qdtloDfw/vbcI9lQybJ7
 NF8hmjhM7gziPXPsIfRliYTnXPLDSp+OurdgNfoCab6yk7qrDIEtQNV2uQ/Flh4wGjDTq/kGwCG
 LBkk+YS79oaoZQqcntxHL+2HO3Q1OFMFhDwKnMAE1IqUxVf8qmgQn50+x6P6A1imAZ3m4O5fK/j
 TvASvLMdSNH44N0Ze5z12e19efumCOSKhccjIGviEN6UKZOgQFGxK0fjTQMB8qXdPQCmXLU2/cF
 oRImy2qKJXIgvynzma0JMRwTvLTDlNRW/ItkaY2d/HwnmxeeycGkXRWymmimNxHLd0yTQid4wPW
 n4yMJ4r8zZ5mxJCGqYg==
X-Authority-Analysis: v=2.4 cv=ZfKIpcVA c=1 sm=1 tr=0 ts=6ab6dee1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=n0A2qb7kpkoggacqyAEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: NxCgAwXh0Vd8ybxG_rxK74TA-wsjWkds
X-Proofpoint-GUID: NxCgAwXh0Vd8ybxG_rxK74TA-wsjWkds
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA4MyBTYWx0ZWRfX1kvrsdmb257B
 zwUoqd2+YaqYaCVyElb8P+Jrob6OTNexgM5yNjMFXALjT6XmjFeDej+fBbBjSqsWHEF4T1ilDuz
 G8DiXJ/WGRM9z1JJRys7C4g0xnObGqU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250083

This series adds tracepoint support to the Qualcomm GPI DMA engine
driver, giving structured runtime visibility into GPI DMA behavior
without requiring invasive debug patches.

Patch 1 adds the qcom_gpi trace events header (private to the driver,
in drivers/dma/qcom/gpi_trace.h) and wires the tracepoints into the
driver alongside the existing dev_dbg() calls.

Patch 2 converts the remaining dev_dbg() call sites in the driver to
use the new tracepoints instead.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Changes in v3:
- Move the qcom_gpi trace events header from
  include/trace/events/qcom_gpi.h into drivers/dma/qcom/gpi_trace.h,
  since it has no users outside the GPI DMA driver, and squash it
  into the tracepoint-wiring patch.
- Drop the redundant per-function breakdown paragraph from the
  dev_dbg()-to-tracepoint conversion patch; the first paragraph
  already describes the change.
- Link to v2: https://patch.msgid.link/20260909-add-trace-support-gpio-v2-0-01f81739bb88@oss.qualcomm.com

Changes in v2:
- Reorder TP_STRUCT__entry() fields in gpi_ev_process, gpi_alloc_ring,
  and gpi_ring_info to avoid holes: 8/16-bit fields moved to the end,
  and 64-bit/size_t fields moved before the __string() field (treating
  __string() as 4 bytes of metadata). (Steven Rostedt)
- Link to v1: https://patch.msgid.link/20260831-add-trace-support-gpio-v1-0-7b0fd0d0ddb3@oss.qualcomm.com

---
Praveen Talari (2):
      dmaengine: qcom: gpi: Add trace event support
      dmaengine: qcom: gpi: Convert dev_dbg() calls to tracepoints

 drivers/dma/qcom/gpi.c       |  69 ++++------
 drivers/dma/qcom/gpi_trace.h | 317 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 344 insertions(+), 42 deletions(-)
---
base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
change-id: 20260831-add-trace-support-gpio-99eb54d42729

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

