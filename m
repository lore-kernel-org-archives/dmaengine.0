Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6553546CD
	for <dmaengine@vger.kernel.org>; Wed,  9 Sep 2026 05:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788930597; cv=none; b=O/9a65KGpw2G3hKICOo1/1pCEDdYDuQfy1GrfC92f6kZq4PIyUtNZj5K3S/tKj6sBQu/EAe2831AtHWIwSuCInspSXZm9C+LR7AVNrvZoednHL72zm2qM3lZiKD5dp10mNqGszcyumYQFuh+b3XUkZgbG7MyV/7duoVGM31m9Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788930597; c=relaxed/simple;
	bh=medeQtILtXnou9GENFPGPSE4wA2XEvyNNFClxGKY+CI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JEsqE7MhB0aoPA7z57bah+UGqSXhagGsEsWzvlxAKoUwGzMNWxc79gG4FwxgyvIg01W5HFBS/zhMOPiWDfCDlVPebOqkV+m96o4w00wMAa/XhfI//m/RyVXLENkV/XM04pOIS6mjs7Xv1OQtiuTz8z113kjFCiNqVahZbMCTr4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TIUo0t/8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UjqOe05Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TIUo0t/8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UjqOe05Y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688MgG7f1274611
	for <dmaengine@vger.kernel.org>; Wed, 9 Sep 2026 05:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M9wz1eYsrgbeb+Bam//FWE
	dAOWGxAvwV+SvxgKwwx1M=; b=TIUo0t/8y5Tj3Voh2Et/3KLbTRW+C2DTW7v56p
	ZoXzrzUPKHq2x6kZbEoPg0OOXqD8tdFpjQzh8QneWAIY6k2IaG5FHVwyxADVkHMs
	y10UyZzkOBOzDk7gmZ6zorOImUMA9aOk0GGiiJp2u2CzAWXV/h/DWYm/4UxKD5Hm
	sh+UPL1ReFged0lwe0WM2HzGV4MeZxgtDlcGmUfZ7fdsSML2LxGO0Ey5vfCisz5i
	NAZbl+Gd1SdW7w1+sZ6kIx/cL96iwh/j2YgLi4tlXDe+e8H6XLZCC0VEo3/XZSVd
	C8Ht0fkEDupHgrzbaVeG0pzg/7Ae9mAQJqX2htLM9jT/G6bQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqdw2ayf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Wed, 09 Sep 2026 05:09:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398d292eac1so10812444a91.1
        for <dmaengine@vger.kernel.org>; Tue, 08 Sep 2026 22:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788930595; x=1789535395; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M9wz1eYsrgbeb+Bam//FWEdAOWGxAvwV+SvxgKwwx1M=;
        b=UjqOe05Y21sNBq4KcB2maqKzOSviYXHL4qzZC24xDXEVgcjzHy+9lpUpjpL493JVDk
         lcgnFegeuwDyms22FWlAzmW+P3K1hwBBhrKT+5Ba3F6CjNjGhhAPMR0kTOZfMiB7KMpn
         qD+bCbaKdTt1IX+IdQvSdF9wI9FEYEdH/wEfm2Me+vMlYi+ruoApPJSoscnM1+VKNx0v
         QQO9Hlsk1zSQYyYFLifrUbIT7xVWwSazDuzyRLaT9+AjqX18suMSo0FEWtdjZAo690WF
         Pb3Tb+aNAcbY4tELKBTIi1AyuQIV26Tk57l01180l4MIMG7qC9/8A0ro6f7EZz7JYvcr
         ipXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788930595; x=1789535395;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M9wz1eYsrgbeb+Bam//FWEdAOWGxAvwV+SvxgKwwx1M=;
        b=oxhQjI8OOMKQiLQjm4a3XowGXBJsghfhKzoPgPfDavV1hTktZdwhO5cwYz7QaxDf3b
         u7b/nBe8nIksk3NrsGqZRqmP4RUC+MFs5+zhStYwVUdq7elPDX6v5Q5zmTZtF6Jnc6mM
         g4lnFMGiCze0A56lGITyV5AthACreyBIYtFXenQAU6vXRpCI7iEROzi3v7pvblMUMSbN
         2I/64kFbPPOoSmPcGcN0Gu2WCwcAAb1YQNb+5msWBiySxanNGKFqti/jbhJlC+RdnZ9R
         UjXFA40xcNAGMdLYB++vWpYU49v3UTuCh1H3YVRDvqabSWjiLmdYJPdIP4Oq5Gk0gLzi
         FyLg==
X-Forwarded-Encrypted: i=1; AKwUvByWdjkkitzDxAwfiZkN1/hVQ28+TKhSqMvrG3CeZY2A+RIVapuyWSwFAkk4PCb0w8XMM2mQUifJTCA=@vger.kernel.org
X-Gm-Message-State: AFuF++lEUkwPbaROfQoATUVV5yX/VuRK5zZxwFcN5FRt8vsx9f5X3U+5
	BiFi1PU2HxZPbM8XCCgb1TU3HQOYPM8oVy6QE00LD6RU/VPKAw1S7Z/vzOHkDrE8SWiG7OKPU6k
	cJ16IU+ED0XrgvfP6NJk4z6L7RSR26ooFSF4bBajKOWvkZ53OoBgSTve8+3aMUXE=
X-Gm-Gg: AYBFou0IOYizQOoI0hhuD4Bz8M/xX6303lDEbGZCpM2dkBPg4SBh+Zs6eYm3T8d/KVo
	BToT7ZSPvrZeRXHD2Mk9L/zjvwDGGw/rREClWFlb3qv+AusYD5F/UAygynJPb0ke1ek4whUrzM0
	zfF8RsPLsQC4cinCjMFGGRVGCNdsURzF2x2V+uJWfST1dNC2kRLCwlFJAD+9CZfN++Ohpwnb7nn
	SlU3DxxvTl1KtqJSnnkV3kGUc71rlizkY/ihuJz/lUiMKSqcAWH7Baxwl57jR86PvvwPf5+7UdS
	llumBb19Ki+04/1rU8qguJpVyTyEh0vgqZzJ6oOh89hza87xIH0GfVWUXg+3pRMJWBR3qhUc+i4
	VSMTZusSOD2INsrWH/WOmTNAfq6HtKhaMZg==
X-Received: by 2002:a17:90b:270b:b0:398:c9be:cca8 with SMTP id 98e67ed59e1d1-39bac13b38dmr5724108a91.2.1788930594985;
        Tue, 08 Sep 2026 22:09:54 -0700 (PDT)
X-Received: by 2002:a17:90b:270b:b0:398:c9be:cca8 with SMTP id 98e67ed59e1d1-39bac13b38dmr5724013a91.2.1788930594402;
        Tue, 08 Sep 2026 22:09:54 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm11082833eec.14.2026.09.08.22.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 22:09:54 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v2 0/3] dmaengine: qcom: gpi: Add trace event support
Date: Wed, 09 Sep 2026 10:39:40 +0530
Message-Id: <20260909-add-trace-support-gpio-v2-0-01f81739bb88@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABTqoGoC/4WNWw6CMBBFt0L67ZBSUMQv92H46GOAGqW1U4iGs
 HcLLsDc5CYnuY+FEQaLxC7ZwgLOlqwbE4hDxvQgxx7BmsRMcHHi57IAaQzEIDUCTd67EKH31kH
 ToDpWphK1aFgq+4Cdfe/Dt/bHNKk76ritbYnBUnThsz/PxZb7ezIXwKFWvDM8yajy6ojy1yQf2
 j2feTLWruv6BS3nAKzVAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788930590; l=1648;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=medeQtILtXnou9GENFPGPSE4wA2XEvyNNFClxGKY+CI=;
 b=016zUGsLJxeo+zQ3mYzHto/4nRE7sqB7+G5Q+miZ9CJV6+Hn8hRGIQouhb15R/ZxIG27LXtRZ
 3JwusuYeTRpDHx9qZ+vY0xAgV1U1nVAisfmpOb4e/6bSofGxgvLUXX+
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: eQE8ZECQ0JZqr0wLQeUFaeHqmLWqZGAu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA1NiBTYWx0ZWRfX3TJJCXtpRNP0
 W2H4NI57DeXekdvc9Ift5UEC3DzGbTlKUopUDCgozsj62uxR6kCMvNRNauR5E6cYXULuB48c6Ux
 GEHrn+tp8R9GLbPXjAyNZwsXxWcxaaw=
X-Proofpoint-GUID: eQE8ZECQ0JZqr0wLQeUFaeHqmLWqZGAu
X-Authority-Analysis: v=2.4 cv=Bo2tB4X5 c=1 sm=1 tr=0 ts=6aa0ea23 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=bEzAOnUhC74fLp94dtcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA1NiBTYWx0ZWRfXwiqb2GnlwCZb
 cSLnbpC5m+Pr++jyjWqn5rYVoTrFQASGPdF1PqkHfYAkQZkMgDBchcIpaPNVozjAYEU4g8x0mez
 P8eb+TKxo9ZnEjuLuQzePVwMehM3bN9N7CBUFgXR8orPW9NCXfnELDsphcV2YNUVIYqY86bDZ6N
 dOxMBpnry+zYeiqTSnedU5e+DKkLsj1KsaRkzxZNrSTRG2dvma5LdTABaRQN8/UR7Hn427PPuJu
 WWW9KxAlrjQSNINI76as5kb62HdTVkabPEzhzO0B78s1gGM/pjd6i3D2YzdtXbIEBVzm31kGTZM
 Vm0yoF7nJOuyRsozaeMcxP9Rft1cJILU4zoyVQ1bbPOPMLX1b+b6j3J2Q+IiUMq8LQOzYxlx3Sf
 Z4o2Plz5Ajl+tOVJkYrxyBwPyKafN/7SAdp1oGWyWVkiI5LFwAiFmEZORQWvOCp/fYogfdWPBzE
 VlH8MWZq2QBeW5NArvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090056

This series adds tracepoint support to the Qualcomm GPI DMA engine
driver, giving structured runtime visibility into GPI DMA behavior
without requiring invasive debug patches.

Patch 1 adds the qcom_gpi trace events header, covering command
dispatch, IRQ handling, channel/event control state transitions,
completion event processing, ring allocation, and TRE contents.

Patch 2 wires these tracepoints into the driver alongside the
existing dev_dbg() calls.

Patch 3 converts the remaining dev_dbg() call sites in the driver to
use the new tracepoints instead.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Changes in v2:
- Reorder TP_STRUCT__entry() fields in gpi_ev_process, gpi_alloc_ring,
  and gpi_ring_info to avoid holes: 8/16-bit fields moved to the end,
  and 64-bit/size_t fields moved before the __string() field (treating
  __string() as 4 bytes of metadata). (Steven Rostedt)
- Link to v1: https://patch.msgid.link/20260831-add-trace-support-gpio-v1-0-7b0fd0d0ddb3@oss.qualcomm.com

---
Praveen Talari (3):
      dmaengine: qcom: gpi: trace: Add trace events header for Qualcomm GPI DMA
      dmaengine: qcom: gpi: Add trace event support
      dmaengine: qcom: gpi: Convert dev_dbg() calls to tracepoints

 drivers/dma/qcom/gpi.c          |  69 ++++-----
 include/trace/events/qcom_gpi.h | 313 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 340 insertions(+), 42 deletions(-)
---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260831-add-trace-support-gpio-99eb54d42729

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

