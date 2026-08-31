Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D124A2040
	for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 16:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194219; cv=none; b=mJ1J5Y6FkK7mmlU7WDHfQASzXUxQkrKqTfvXcW2/fCKE1K9KVkw+8yDvdXA8AwnZxtCLxpEH5ge9pzGUi+zTubYmCx2Q3cTV4cdztYyQCoI4AU6ScU3b4GiaUFBc/7Mishf7lFd6aMZcqBagvO6Vkco6Q5trw6LXN/xXpYJdmzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194219; c=relaxed/simple;
	bh=UEdUJRDY9H4+0GuHwhSoACVAk/wqqFOFObA+tTHfnnw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LMsMrpNQKBj8FCP5UVClHCV5oQ4n9yXdpbOXseiLXAMsI9sSwPqOGYqA0Ger994wt6izOnA9c39CnglaZ10PoiHjXo01AdWK2Lj7Cq0lHSw8SXdPTIaNgFmPqrCEdADUTXKfc4Pbfr5V420UYkeIPMb6iaKCZA5uHyqWZdiC00M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZqvZD+ib; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b3cWk4b3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZqvZD+ib";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b3cWk4b3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFrSlL3891249
	for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 16:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8nCufShizWqApSyu/hCbdpwpYCeP+qWNQHyYW/PYcyY=; b=ZqvZD+ibiZL1Mwzv
	0BBiOrBcpozQbzr95Z11H8sCwGPh/47Hho2r1SiHW8pv0Io3q+MW7fUBCi0ZE7NK
	25L9R3SRGkAGfGZ+j613KtswBhfczRLZeWZyh41gDRP2knP5GAzQR0Lgx6yvfb2X
	4MublWHApoVd5dzv+flJeRPZ+P4bHMysj/yyq1vqVFeZ4wHsH2IG5tTmPVE7l4EG
	+4Mme8nkX2ilDW3KIS7DvbsLSmE2PNn+YX4QTxYj5++B4RhCXLVjqglycIVWxrgR
	x/bN0UKJBRK7tfHDPQiraAsAUfwmwqonawClOFhj8qkQYNpRTNkyG+b1S24Hcb1A
	I7NlmQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yasvhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 16:36:55 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1d85c012dso6150252a12.2
        for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 09:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788194215; x=1788799015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8nCufShizWqApSyu/hCbdpwpYCeP+qWNQHyYW/PYcyY=;
        b=b3cWk4b3DQPOIh1oLNwnjkeGuMUkVH+ow71Rze7b7qpaP595i1j95ry2TWL7O7+bk5
         RYIFTbcPkPCy6prbBRNG3uS1My/6Ng5521h0vu7RFqi+D6DL9hoXfKBAwb6wq4ZCP/g8
         WnZg5Cym15hRgq0lYyrYLtn/UgPAVEEfXCe7uMvqHD0s1ykPxOUkW/Sz0a+E7SIKEHk9
         mCxGDJM9BZjE8jMfSrrxDwZBCGgzxQ1N11grT1iix5hcscePS7fhFHTXDIguadBFpNDh
         UL955Huu0/5x8L7E3H+0PmSzwcTpgnZcKm38kVynCHtc1Qx6RvjetM0W5ume6WePnF/a
         UlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788194215; x=1788799015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8nCufShizWqApSyu/hCbdpwpYCeP+qWNQHyYW/PYcyY=;
        b=SrM78m2CR0F1jMCUG3u2mZnPTikpqTB/HUuj3hR80/7jSGT59bYeColenyV63ViQ3F
         n3577E0klgtwg7+dmHZ0Y+czV8SUQwvbbHko13KpFgtddQ5nQasE8ZYkky3H724uDy3i
         JrzJZ3E+pO5H4GZBEUafzqTTkb1S499PMM3PknlTTh9RZ3Rz0jRVuH1O0ZcnuhaRf1Qy
         Pi45wbnqOExslhNJ8XjV97rrnh1z7xlRDxusH/p6hzZmBm42HCVmpYxT2RCsiGLVc1/2
         K0y8Js4K+Xan3IxqNzfppX7dZMBS40z9SMMgbx+9Cxz1K2vCK+LVPSqUxLEqMAMMYYva
         bG+w==
X-Forwarded-Encrypted: i=1; AKwUvBwqNIqu2DMFTtfwiNePYCDxEOZr9CVkDCGTu9cJv9KRSeqrdrCiXYiOMFL5hFH7tdfDaJ+4RAQENco=@vger.kernel.org
X-Gm-Message-State: AFuF++mLLh+H/6iMs3CJPFurZCfwm0ccmNjHcavBWNrtrlGX5WppT2S4
	Q8hCOXie3qPhOwezuofTnysw0b2lkmqm06EdjF9VToJ2J6CsYgLllj9KgzQ1hu7lKxh+vuSOBWq
	heOFWU9bFU2JKjfUVqL4E8/h5h33C/QWdJxh7VXEHLX934QFqyNMgv8OiTEdMyYY=
X-Gm-Gg: AYBFou2mpWm2JXjHu2yKY8ZClM+o9NdFBIVA4zoSBiGgaVhJtf9ntphy7C4d7K64GIV
	EKpm1repHtqEa879a9X1dMc6jEV66IkvBNUy0knRjJ+ijlbW1YJcjm1RX8WoHfd8EJVeFLDW/Ah
	ChOaINigLbQhtrULmHimdRWFizRW8E5nySOhjkO8sjr7M4oaKZXaHQqICKfV/J1+wsWRRZPQqH/
	XPCGr073Uf53IF7aSMCbspbBP3dMK8u41SmOBeArhYCA5r4gmXl5C7WIgZpe950vM+L8bKIYgZf
	dBCjJsJ0vGQNH+a84X8+G69SN1DbSPHrh2Sr4O9ANZy/nCjBqC6I/RAA4AVlV37ekXYjvfNEnhk
	SYKzVUeZOZjEEME+7mtPN3eFJqVYh8Lpxqg==
X-Received: by 2002:a17:90b:48d1:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39907e4aeb2mr2834614a91.18.1788194214672;
        Mon, 31 Aug 2026 09:36:54 -0700 (PDT)
X-Received: by 2002:a17:90b:48d1:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39907e4aeb2mr2834531a91.18.1788194214064;
        Mon, 31 Aug 2026 09:36:54 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d75fc49sm271260a91.12.2026.08.31.09.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:36:53 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 22:06:35 +0530
Subject: [PATCH 1/3] dmaengine: qcom: gpi: trace: Add trace events header
 for Qualcomm GPI DMA
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-add-trace-support-gpio-v1-1-7b0fd0d0ddb3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788194205; l=10756;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=UEdUJRDY9H4+0GuHwhSoACVAk/wqqFOFObA+tTHfnnw=;
 b=cQ9JLNes62buicXZqKs24pgKFdpQDInc4Cwuc8OXaJ13HNuF34aLzE+z76E1vGnaDIqC4lOv2
 rzhamwhLO0bDzNTOrMwHY2Zzfe9kibB2H7nZ80+VKUsmDdmMkMh0WmV
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0MyBTYWx0ZWRfX3s0cp4SM716v
 GpxoqflkZKk9yo86qYYv1WVq71RfaSAEVhjR8Ru14r0lMSrVLk+iHwGRG84vBhSpVLaEdw2DcWq
 BQBbMtqlcniGD49SbUkUY1r7DhV+rYs=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a95ada7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=E82JpRapckMa8tCxcIoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0MyBTYWx0ZWRfX4bQGu4uc4JJ8
 2RGkdFr5Ip08WYJRiTEJ0A8z/Tl0FJcVQruquFhknnPLZLqNSRlOmOrOEiHwnA7vnz13BqXIBw3
 XEokkG2UE7VH7BCneIg1lOqaWQCKSSC4BtfLJi5S3uiDCF0U/mWCsRpRMRF6BIu2wL5ctoPUHRg
 DcBCD5kd928iHHtQKD4m0Fs7b7id0+fe7Q1qpqOC57sQBqLANIMebway73pdlWjwMYDeggmNbA8
 +FAAmMn6KaC1je4yo8137hEtTNKxPFJSyOIxX0ViBUXPxt8RfNt5Ju+03rZ8fbi6sSsAoLlnvHh
 WZkSv8qFMXVoHklfBOKRNZREL8dGTYOoE+cHDOimtskokG934mlLDLHS2B5bC4790n+3GpyHEKv
 aL3yj5bOaqamIDVEES1/MkyWqN9Mle3NDPq/PbiaOlomM5JEhGv8spfvfLSH3WNlBayTxmRfSiS
 F02JJQrCmV4c4sJ5BpA==
X-Proofpoint-ORIG-GUID: DAPSnlqTLBYlLU82PYC_-QZugGSuClrt
X-Proofpoint-GUID: DAPSnlqTLBYlLU82PYC_-QZugGSuClrt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310143

Add a tracepoint header for the Qualcomm GPI DMA engine driver.

The events defined here cover channel/event command dispatch, IRQ
type handling, channel/event control state transitions, error IRQ
status, completion event processing (including the no-pending-
descriptor and transfer result paths), per-event processing in the
event ring, ring allocation/programming details, already-in-state
checks for pause/resume, and TRE queuing and contents. Together they
give full runtime visibility into GPI DMA behavior in place of the
driver's former dev_dbg() based debug logging.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 include/trace/events/qcom_gpi.h | 313 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 313 insertions(+)

diff --git a/include/trace/events/qcom_gpi.h b/include/trace/events/qcom_gpi.h
new file mode 100644
index 000000000000..5474e762f4b6
--- /dev/null
+++ b/include/trace/events/qcom_gpi.h
@@ -0,0 +1,313 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM qcom_gpi
+
+#if !defined(_TRACE_QCOM_GPI_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_QCOM_GPI_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(gpi_send_cmd,
+	    TP_PROTO(struct device *dev, u32 chid, u32 cmd, const char *cmd_str),
+	    TP_ARGS(dev, chid, cmd, cmd_str),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __string(cmd_str, cmd_str)
+			     __field(u32, chid)
+			     __field(u32, cmd)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __assign_str(cmd_str);
+			   __entry->chid = chid;
+			   __entry->cmd = cmd;
+	    ),
+
+	    TP_printk("%s: chid=%u cmd=%s(%u)",
+		      __get_str(name), __entry->chid, __get_str(cmd_str),
+		      __entry->cmd)
+);
+
+TRACE_EVENT(gpi_irq_status,
+	    TP_PROTO(struct device *dev, u32 gpii_id, u32 irq_type),
+	    TP_ARGS(dev, gpii_id, irq_type),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(u32, gpii_id)
+			     __field(u32, irq_type)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->gpii_id = gpii_id;
+			   __entry->irq_type = irq_type;
+	    ),
+
+	    TP_printk("%s: gpii=%u irq_type=0x%08x",
+		      __get_str(name), __entry->gpii_id, __entry->irq_type)
+);
+
+TRACE_EVENT(gpi_ch_ctrl_irq,
+	    TP_PROTO(struct device *dev, u32 chid, u32 ch_state),
+	    TP_ARGS(dev, chid, ch_state),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(u32, chid)
+			     __field(u32, ch_state)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->chid = chid;
+			   __entry->ch_state = ch_state;
+	    ),
+
+	    TP_printk("%s: chid=%u ch_state=%u",
+		      __get_str(name), __entry->chid, __entry->ch_state)
+);
+
+TRACE_EVENT(gpi_ev_process,
+	    TP_PROTO(struct device *dev, u32 chid, u32 ev_type, u8 code,
+		     u16 status, u32 length),
+	    TP_ARGS(dev, chid, ev_type, code, status, length),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(u32, chid)
+			     __field(u32, ev_type)
+			     __field(u8, code)
+			     __field(u16, status)
+			     __field(u32, length)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->chid = chid;
+			   __entry->ev_type = ev_type;
+			   __entry->code = code;
+			   __entry->status = status;
+			   __entry->length = length;
+	    ),
+
+	    TP_printk("%s: chid=%u ev_type=0x%02x code=%u status=%u length=%u",
+		      __get_str(name), __entry->chid, __entry->ev_type,
+		      __entry->code, __entry->status, __entry->length)
+);
+
+TRACE_EVENT(gpi_queue_xfer,
+	    TP_PROTO(struct device *dev, u32 chid, u32 num_tre),
+	    TP_ARGS(dev, chid, num_tre),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(u32, chid)
+			     __field(u32, num_tre)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->chid = chid;
+			   __entry->num_tre = num_tre;
+	    ),
+
+	    TP_printk("%s: chid=%u num_tre=%u",
+		      __get_str(name), __entry->chid, __entry->num_tre)
+);
+
+TRACE_EVENT(gpi_gen_err_irq,
+	    TP_PROTO(struct device *dev, u32 gpii_id, u32 irq_stts),
+	    TP_ARGS(dev, gpii_id, irq_stts),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(u32, gpii_id)
+			     __field(u32, irq_stts)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->gpii_id = gpii_id;
+			   __entry->irq_stts = irq_stts;
+	    ),
+
+	    TP_printk("%s: gpii=%u irq_stts=0x%08x",
+		      __get_str(name), __entry->gpii_id, __entry->irq_stts)
+);
+
+TRACE_EVENT(gpi_ev_ctrl_irq,
+	    TP_PROTO(struct device *dev, u32 gpii_id, u32 ev_ch_irq, u32 ev_state),
+	    TP_ARGS(dev, gpii_id, ev_ch_irq, ev_state),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(u32, gpii_id)
+			     __field(u32, ev_ch_irq)
+			     __field(u32, ev_state)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->gpii_id = gpii_id;
+			   __entry->ev_ch_irq = ev_ch_irq;
+			   __entry->ev_state = ev_state;
+	    ),
+
+	    TP_printk("%s: gpii=%u ev_ch_irq=0x%08x ev_state=%u",
+		      __get_str(name), __entry->gpii_id, __entry->ev_ch_irq,
+		      __entry->ev_state)
+);
+
+TRACE_EVENT(gpi_ev_no_desc,
+	    TP_PROTO(struct device *dev, u32 chid, const u32 *ev_dword,
+		     const u32 *tre_dword),
+	    TP_ARGS(dev, chid, ev_dword, tre_dword),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(u32, chid)
+			     __array(u32, ev_dword, 4)
+			     __array(u32, tre_dword, 4)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->chid = chid;
+			   memcpy(__entry->ev_dword, ev_dword, sizeof(__entry->ev_dword));
+			   memcpy(__entry->tre_dword, tre_dword, sizeof(__entry->tre_dword));
+	    ),
+
+	    TP_printk("%s: chid=%u event=%08x:%08x:%08x:%08x pending_tre=%08x:%08x:%08x:%08x",
+		      __get_str(name), __entry->chid,
+		      __entry->ev_dword[0], __entry->ev_dword[1],
+		      __entry->ev_dword[2], __entry->ev_dword[3],
+		      __entry->tre_dword[0], __entry->tre_dword[1],
+		      __entry->tre_dword[2], __entry->tre_dword[3])
+);
+
+TRACE_EVENT(gpi_xfer_result,
+	    TP_PROTO(struct device *dev, u32 chid, int result, u32 residue),
+	    TP_ARGS(dev, chid, result, residue),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(u32, chid)
+			     __field(int, result)
+			     __field(u32, residue)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->chid = chid;
+			   __entry->result = result;
+			   __entry->residue = residue;
+	    ),
+
+	    TP_printk("%s: chid=%u result=%d residue=%u",
+		      __get_str(name), __entry->chid, __entry->result,
+		      __entry->residue)
+);
+
+TRACE_EVENT(gpi_process_event,
+	    TP_PROTO(struct device *dev, u32 chid, u32 type, const u32 *dword),
+	    TP_ARGS(dev, chid, type, dword),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(u32, chid)
+			     __field(u32, type)
+			     __array(u32, dword, 4)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->chid = chid;
+			   __entry->type = type;
+			   memcpy(__entry->dword, dword, sizeof(__entry->dword));
+	    ),
+
+	    TP_printk("%s: chid=%u type=0x%02x %08x:%08x:%08x:%08x",
+		      __get_str(name), __entry->chid, __entry->type,
+		      __entry->dword[0], __entry->dword[1],
+		      __entry->dword[2], __entry->dword[3])
+);
+
+TRACE_EVENT(gpi_alloc_ring,
+	    TP_PROTO(struct device *dev, u32 elements, u32 el_size,
+		     u32 req_len, u64 len, size_t alloc_size),
+	    TP_ARGS(dev, elements, el_size, req_len, len, alloc_size),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(u32, elements)
+			     __field(u32, el_size)
+			     __field(u32, req_len)
+			     __field(u64, len)
+			     __field(size_t, alloc_size)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->elements = elements;
+			   __entry->el_size = el_size;
+			   __entry->req_len = req_len;
+			   __entry->len = len;
+			   __entry->alloc_size = alloc_size;
+	    ),
+
+	    TP_printk("%s: elements=%u el_size=%u req_len=%u len=%llu alloc_size=%zu",
+		      __get_str(name), __entry->elements, __entry->el_size,
+		      __entry->req_len, __entry->len, __entry->alloc_size)
+);
+
+TRACE_EVENT(gpi_ring_info,
+	    TP_PROTO(struct device *dev, dma_addr_t dma_handle, phys_addr_t phys_addr,
+		     u32 len, u32 el_size, u32 elements),
+	    TP_ARGS(dev, dma_handle, phys_addr, len, el_size, elements),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(u64, dma_handle)
+			     __field(u64, phys_addr)
+			     __field(u32, len)
+			     __field(u32, el_size)
+			     __field(u32, elements)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->dma_handle = dma_handle;
+			   __entry->phys_addr = phys_addr;
+			   __entry->len = len;
+			   __entry->el_size = el_size;
+			   __entry->elements = elements;
+	    ),
+
+	    TP_printk("%s: dma_handle=%llx phys_addr=%llx len=%u el_size=%u elements=%u",
+		      __get_str(name), __entry->dma_handle, __entry->phys_addr,
+		      __entry->len, __entry->el_size, __entry->elements)
+);
+
+TRACE_EVENT(gpi_already_state,
+	    TP_PROTO(struct device *dev, u32 gpii_id, u32 pm_state),
+	    TP_ARGS(dev, gpii_id, pm_state),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(u32, gpii_id)
+			     __field(u32, pm_state)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->gpii_id = gpii_id;
+			   __entry->pm_state = pm_state;
+	    ),
+
+	    TP_printk("%s: gpii=%u already in pm_state=%u",
+		      __get_str(name), __entry->gpii_id, __entry->pm_state)
+);
+
+TRACE_EVENT(gpi_tre,
+	    TP_PROTO(struct device *dev, u32 chid, u32 idx, const u32 *dword),
+	    TP_ARGS(dev, chid, idx, dword),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(u32, chid)
+			     __field(u32, idx)
+			     __array(u32, dword, 4)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->chid = chid;
+			   __entry->idx = idx;
+			   memcpy(__entry->dword, dword, sizeof(__entry->dword));
+	    ),
+
+	    TP_printk("%s: chid=%u tre[%u]=%08x:%08x:%08x:%08x",
+		      __get_str(name), __entry->chid, __entry->idx,
+		      __entry->dword[0], __entry->dword[1],
+		      __entry->dword[2], __entry->dword[3])
+);
+
+#endif /* _TRACE_QCOM_GPI_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>

-- 
2.34.1

