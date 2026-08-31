Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EF44A2063
	for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 16:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194222; cv=none; b=MEbwZJHGR6gB9ZhDTqYcuBL6S8Au4h1l9KCxyrmga0iHeK6Rny0+HLbDVSekPU+jZSpJnS3dNbgeQNiP4yoPzD94t/FB8c9G4oFzG0VJtpTRgObox7oh38TPQFYFcZ+vsPeC54xcbGkOyBSxVzIJhmKs6+W/RqUu4Vkuu1X6QYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194222; c=relaxed/simple;
	bh=Z6l42kmbZIdLCp5HS8lQr0U0ximrV+BKEFCMLwjPxeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=POQX/DZqmI1sSlWxKWqzPeO4w2cJOJWbrkrXOYVh10i0Jm9at8WYkxMbzzuJ4F7tx5deWs4uqmsxNreEPBZRGPgm/8LG6zGQgdYJmqWv03tortiumGciISQcJRZa3QcVCIw/KbUPD38dMKewyW6BHBv1GCPN/YTUWGj4GleZ9fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O2IveTK+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DxcXym8l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O2IveTK+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DxcXym8l"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFq9do305921
	for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 16:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VHqBJxd6rqKL88lhmyF6Ow7x7erHmkPvtp2e7XDc4gg=; b=O2IveTK+m5vfkkZG
	dDTk22atmDu69bjKVVwAIjdcv541EekKqOs5kPQ4LH6BjdfZWCR86mxk3n9VfzTb
	keyQbUSHxdA0OXbb8lIW5gfGuUR95VDEYRkpAPrpZHOrNUhAC+tc+nqDKm0xQoDp
	e5LfPIJ1vraSGXFjinQgod08IyGf76gmC4VEjoKxr4PFXBkvSpiqJdbUvaYw+OWT
	tLeh+Pl4yX7DT9pcIVoegCx2ZWYLucZFyVaQbulJyw9vlJBwtwfGWeYvZOqFto0i
	SlhXzKpHamXTxpisfOfzNWGYbLEEcbmFAGx89LBQ5DYhX5WfE5YCPfWLAeJh2ltT
	9/Qjvg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4pmahv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 16:36:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396638f9a18so6334595a91.2
        for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 09:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788194219; x=1788799019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VHqBJxd6rqKL88lhmyF6Ow7x7erHmkPvtp2e7XDc4gg=;
        b=DxcXym8loc9mJa98HYbiqtbxFNqGVWSFnz7NXY2EFH8wN6B4HNIxuAwQkCG7iT1K1j
         RJPzXvYMTMxTsgDZQzblQYJC67/X8+pGljMfOlVhzekFm8LMaYrA7qBc8j7ZQ6sD/0nG
         sA9URfmBTzOeh70qgw8aOVEIwXDpmJGEXwmF46Xb/7cJC4aMFPQleVlxZxQ9wOT9KX9o
         BqpQJyNv2oswef14qQkaBcwBGSh8hGnSCqRcJt8IFFsUqLsIgbNMY5srL8DaNAag/xbe
         s6VpxExlDjCLV6rhDWDkjhrA5l10wzBacj4WJNOHQT+i+UDK2jWWi0o+E741x8tbSzii
         m3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788194219; x=1788799019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VHqBJxd6rqKL88lhmyF6Ow7x7erHmkPvtp2e7XDc4gg=;
        b=mWo6pKUlT/uOa6Uxmvwpzi+SN1B/78oGQHgRVk+eQXEOyZru3+1enxpryN3QNf19SL
         Oy4kQe6qX8XPxelfYEprpTBzDOioXDjA3USJgEAYLg05BzWaK6YYop15Uz1gtZcy/uqS
         s5f4HhbVnPodTk1xbm+GNtkzc0wc0fkyx9n8iIAFKFsryeAUiJcjuyOMu9UMjdzjc/2I
         IXi2bhD4At7Z19w2aRQaJiTx5tXvtrDkGvDjp+Vx0pprTEAkXmm4ai5LzJqXre8ts8mP
         QHoWA8/3NUyC0eJaT+KNYVw7eSIxV2xY3pJMjlPLKy8pOYlu6DzfbVHp9mxvqycljATJ
         AmSw==
X-Forwarded-Encrypted: i=1; AKwUvBydlrmtM4MHyvZug8yiKEboUAmLFduLkjLdAo3evu4o1Z4l0LbbobegNs1dKbqZtA2BAppOAuipX9o=@vger.kernel.org
X-Gm-Message-State: AFuF++kHnTdHy7JR0ciHdN6S26Ryb8gwGqecz/nQL/Ru4M7jwIS8G/gT
	Lbj2Clr3ECH1uCak7spgec5WSJJ8FPQlloraUm3XX02u6Mkt8aZ5K9REWYebuV6UooclELX1h5g
	sUbUoy8jL7t/QC9YfdGueEeGF+N672usEhwO5llAEkZxlK6vDAdFmGEkNAK/jnB0=
X-Gm-Gg: AYBFou3YXMuqVK9HIninn3EoFfG3U1jYpRolENwg7YJCDC3CGjDsTdFN9QVlMC1gVHO
	MXex90pD1VPokK4r0vm/OMsW06evV/lL+Ym9wpCaF/NWXjkD2qL7qy8Lz87jvGb51I2bkY5AS6u
	9W0kkgTMF+4GNxq7Vv8YtSRIo4Z1EcC6oiCeuR4qyjt3zx82mmiz04XwIn1pR0bH80CUXyiE38C
	jiax3sHUxPY0heoIcZ8nYDdWFxAX2yPrpc8TJLXLX13zr12Qohh0F8GCNLnNqqksjG8EMI+kOf9
	w5VE2yPc6xcfAa8GisDD8mEbK/10yMTkCMowgbAxjMkINO1oAnthYOAr1HbhIERzrFGYd87xrC/
	fOk84T6m9dBVJMYLct6UY5xtxq0kwOV4w2g==
X-Received: by 2002:a17:90b:534b:b0:398:ceef:edbd with SMTP id 98e67ed59e1d1-398ceefee8emr15995910a91.18.1788194218937;
        Mon, 31 Aug 2026 09:36:58 -0700 (PDT)
X-Received: by 2002:a17:90b:534b:b0:398:ceef:edbd with SMTP id 98e67ed59e1d1-398ceefee8emr15995835a91.18.1788194218342;
        Mon, 31 Aug 2026 09:36:58 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d75fc49sm271260a91.12.2026.08.31.09.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:36:58 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 22:06:36 +0530
Subject: [PATCH 2/3] dmaengine: qcom: gpi: Add trace event support
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-add-trace-support-gpio-v1-2-7b0fd0d0ddb3@oss.qualcomm.com>
References: <20260831-add-trace-support-gpio-v1-0-7b0fd0d0ddb3@oss.qualcomm.com>
In-Reply-To: <20260831-add-trace-support-gpio-v1-0-7b0fd0d0ddb3@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788194205; l=3171;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=Z6l42kmbZIdLCp5HS8lQr0U0ximrV+BKEFCMLwjPxeM=;
 b=GH6eTEeWfr3q8FZmKLVtP/Zvo7mbg7bRxvyH5HMvr2vnuU6wPNZRQ7Dhu5TmRGyWsUWugLqDz
 4Bdn7VAthiaBQO14bh3VBklpdJzojchBUcacFtCu4c4EuQFLJSF2/R1
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: ZnK7OB60ID3RfiSb6wRQKwP3SjaMjQ4f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0MyBTYWx0ZWRfX7SkNBeHjK6/v
 2nYGa1Tc3UkgeL7h/+yQiEpUS7eXRNKVhe7vznpwJndY+TLsmARIbEptwDJqGWY7SjaU9WYWRgz
 p047JKyVs3OLpvIZOx+2WmWBq336dPc9LZv2fQl0R0BSNfD5DQ/8kWfW8lrcCpU+ts9/C/EsU9t
 RQ/EiBbCpnGuvE2/6qAueDLD1TpHtb7PxYrHiHnjJ0zo9t3cgOCnj7HWl4sSu27oXEdH3DsMsMw
 2nOaalM4a5nMi2vA0r06HDqyPB8lMdMnImjYHQAZ82MnToOmd/6FBgu51NJQ4Jk3999fkZ+Sn/l
 Bv4bbIJc6TT1vFjNuA2E07TP1y9aeyMbiGiZ6mWY8AGrZJHnYQw/Xv/mQjWXT0WExm2Jh3P68Ic
 o8wPcl2wS998OOJ2zcyw7f8KyC9n2386wu519suBk+1NTb9kxfx8kRTsQM3X+GXXW1f0el9uWFF
 D53HZTeXbeAYm7TEeWQ==
X-Proofpoint-GUID: ZnK7OB60ID3RfiSb6wRQKwP3SjaMjQ4f
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0MyBTYWx0ZWRfX4UjvEIXcO8lA
 2j1PRt57l8+Lyanh8mt6GrazZbVa93UUsVJAjV9LJWZuLq2HC+OGGKDfIvVqTTxXZ4HnTn8RHcb
 ckv9v7+r1NjZMJgS1aeBZzqn+K4RvB0=
X-Authority-Analysis: v=2.4 cv=GbQnWwXL c=1 sm=1 tr=0 ts=6a95adab cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=vNIMIT6v7fynGdS8nZ4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310143

Wire up the qcom_gpi tracepoints into the GPI DMA engine driver to
provide runtime visibility into driver behavior without requiring
invasive debug patches.

Tracepoints are added at the same points as their existing dev_dbg()
counterparts: channel/event command dispatch in gpi_send_cmd(),
top-level interrupt type in gpi_handle_irq(), channel state
transitions in gpi_process_ch_ctrl_irq(), completion event handling
in gpi_process_xfer_compl_event() and gpi_process_imed_data_event(),
and TRE queuing in gpi_issue_pending().

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/dma/qcom/gpi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index a5055a6273af..b09354a73b46 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -17,6 +17,9 @@
 #include "../dmaengine.h"
 #include "../virt-dma.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/qcom_gpi.h>
+
 #define TRE_TYPE_DMA		0x10
 #define TRE_TYPE_IMMEDIATE_DMA	0x11
 #define TRE_TYPE_GO		0x20
@@ -683,6 +686,7 @@ static int gpi_send_cmd(struct gpii *gpii, struct gchan *gchan,
 
 	dev_dbg(gpii->gpi_dev->dev,
 		"sending cmd: %s:%u\n", TO_GPI_CMD_STR(gpi_cmd), chid);
+	trace_gpi_send_cmd(gpii->gpi_dev->dev, chid, gpi_cmd, TO_GPI_CMD_STR(gpi_cmd));
 
 	/* send opcode and wait for completion */
 	reinit_completion(&gpii->cmd_completion);
@@ -773,6 +777,7 @@ static void gpi_process_ch_ctrl_irq(struct gpii *gpii)
 		if (gpii->gpi_cmd == GPI_CH_CMD_DE_ALLOC)
 			state = DEFAULT_CH_STATE;
 		gchan->ch_state = state;
+		trace_gpi_ch_ctrl_irq(gpii->gpi_dev->dev, chid, gchan->ch_state);
 
 		/*
 		 * Triggering complete all if ch_state is not a stop in process.
@@ -841,6 +846,7 @@ static irqreturn_t gpi_handle_irq(int irq, void *data)
 
 	offset = GPII_n_CNTXT_TYPE_IRQ_OFFS(gpii->gpii_id);
 	type = gpi_read_reg(gpii, gpii->regs + offset);
+	trace_gpi_irq_status(gpii->gpi_dev->dev, gpii_id, type);
 
 	do {
 		/* global gpii error */
@@ -968,6 +974,8 @@ static void gpi_process_imed_data_event(struct gchan *gchan,
 	smp_wmb();
 
 	chid = imed_event->chid;
+	trace_gpi_ev_process(gpii->gpi_dev->dev, chid, IMMEDIATE_DATA_EV_TYPE,
+			     imed_event->code, imed_event->status, imed_event->length);
 	if (imed_event->code == MSM_GPI_TCE_EOT && gpii->ieob_set) {
 		if (chid == GPI_RX_CHAN)
 			goto gpi_free_desc;
@@ -1043,6 +1051,8 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
 	smp_wmb();
 
 	chid = compl_event->chid;
+	trace_gpi_ev_process(gpii->gpi_dev->dev, chid, XFER_COMPLETE_EV_TYPE,
+			     compl_event->code, compl_event->status, compl_event->length);
 	if (compl_event->code == MSM_GPI_TCE_EOT && gpii->ieob_set) {
 		if (chid == GPI_RX_CHAN)
 			goto gpi_free_desc;
@@ -1887,6 +1897,7 @@ static void gpi_issue_pending(struct dma_chan *chan)
 	}
 
 	gpi_desc = to_gpi_desc(vd);
+	trace_gpi_queue_xfer(gpii->gpi_dev->dev, gchan->chid, gpi_desc->num_tre);
 	for (i = 0; i < gpi_desc->num_tre; i++) {
 		tre = &gpi_desc->tre[i];
 		gpi_queue_xfer(gpii, gchan, tre, &wp);

-- 
2.34.1

