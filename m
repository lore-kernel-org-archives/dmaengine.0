Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1BF4F55D7
	for <dmaengine@vger.kernel.org>; Fri, 25 Sep 2026 20:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790369518; cv=none; b=SKGVQBz9/EwTJgqXqD2fY6zNn0qWsqHZ/umDFn8YX97VyzoQQC+nud008yjLKzzC9+2LWQWtTktOlBcCvXahTB2Mb2naZKUy+GdExmJEO7u5t2Q6xiULVNSXYsFewdY9hoMlfpHBsY51X5zFXwbWNNXaZFjwR/ws0wf3aKdKyEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790369518; c=relaxed/simple;
	bh=IBzKwuEAw2IzSX3BSi9sh3eWLeU2EFMHDvkG5DZOjbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PW+7TV8fb0VCclYrHznep8yAJsFNCj77xks0hImOvEn9LzQj4TJ+l3Egwzo0xGaCug8k/8wozaXvwqA5jbVhtd932nJbVCQ6ozeri53oVfkXB0rTUSGSf0XTpRtvAzatkIbwoEpruqZgEV9z1rLNfRKVlf+/rJZN2bAjTxEPiXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UTVYqV9v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RSWvml2x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UTVYqV9v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RSWvml2x"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PIncrA2888664
	for <dmaengine@vger.kernel.org>; Fri, 25 Sep 2026 20:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iZQSoAYjcp8FM4R9KKzLNu8MzgRqTqIgLzMBLesMe5Q=; b=UTVYqV9vIh/P43mY
	UWY+FRv9epQk7Us/LrbAFjD+yL6ar6yT3RN9UmvWVKpEPLpttZVIrDg8NUUnPXE6
	Mn0E11+7AisiU+rGjeoXF3Ryh/dM/VuYSx1e6KDA6+uXk1jWOO5eWy3eAeWm3VAS
	0xgMwPG8xnc4+3d7VHC6FSzrC7skK7EvzbrYtCdme+IsiJul2ebEkAsCbdc77JH2
	83aO6ZTZjIvusjz1U+pU2+7/tPsUxu3oo8AlLIXCF7UU7PD6IwzPL+GcdBoKS6HF
	Qbia2klKmAAgLGZbrwFeyQ2FKSW4gWtp0nl7rS8WhZQlnEG/f3iD5H9PdVn3jWFx
	sgOR4g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwwjc8qvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 25 Sep 2026 20:51:54 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-333543ac378so1717846eec.1
        for <dmaengine@vger.kernel.org>; Fri, 25 Sep 2026 13:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790369513; x=1790974313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iZQSoAYjcp8FM4R9KKzLNu8MzgRqTqIgLzMBLesMe5Q=;
        b=RSWvml2xgfiWhXNkGMHcCiU7lcO3ypz3VwrwuOM2TbuFRsFzmZjMVf7/qNPWl4rWrX
         e3cpKJ+Bcp4Pa0FkHVWr4+GwL7qLx3bwMR7/AcB5ElnSJZFYTuKTsrwnLeWHZ8W1zAEM
         LxmTluoO1yoZM11tlVoxHKuyMnC6Wzi3DVwM597ni0cQVMkhTBoF6mnMXmHAYT6uJ1oF
         7QBRHRdSrH+2nMe2iw+PS3j834tKYHRjroBehITZRlyqP3GW1xfNsGaNcE1jGRMf7nar
         cRgU4v2CmV/xe3n/ckU5GW/nLae6VtAySAzeqUs2GSeZCFasdjwTWHKxRfqDgWTpbKR+
         XTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790369513; x=1790974313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZQSoAYjcp8FM4R9KKzLNu8MzgRqTqIgLzMBLesMe5Q=;
        b=Xui3oV/ux+xDasKnywSLfBY2SAVM2bP+aFVPQJ4XoL6yaA/rrx+jyuzKXWkUwDc0V5
         V46XXp1eusjUNTbG1fGqF7vkfw5AkJi/+0aNNobZdv1rIKch5DPEBW7uIHhlczmQ1RN9
         N/MJ6QKRV4mtMUpE0LNUKSbLwIdgqM0iDOyB5iGd2G5jWRSh9uGS+5E4aX9TpSQYFAFY
         pbQQNcEPekGoQ9LIoce7nu3/CymOKhWc1pvDphiTInl+lDJ48JIV4CmVlClknSkHp0Ww
         WUcG24eXp1Nn0QKktGwztha1/+pJfWrzGMPkmNXt7BMF0fsdGiOoLue2S5zXsaAzRFi4
         /c2Q==
X-Forwarded-Encrypted: i=1; AKwUvBytjjuRp3ogymGYlYVNX0SALtDbJBqYRVr8I2+RD3xR+kMyfvmBR7p3l/m/UOe3uMJyEShgbUxC+Jk=@vger.kernel.org
X-Gm-Message-State: AFuF++k06d+CLxJ4hT4teFMJ35WPV4yHas5HGfAL7J4oejI4CkOGdMJp
	oYQ0YTptYyfk2pzpFH9BsgK7YPZnDBvbmiO37+/KmbfsNv2UWZZwpDFo5qu03+XprxFkb654bUQ
	HHvFwZ3aEDVpDWGRQVSSHAmpymJFBSGQHQ79pCDE/Mg/x/y0STSQMerxIjU1FQyU=
X-Gm-Gg: AYBFou0AnpPe9cQ8Cdr7oL5J7tckr+MtpyINh6TwtQaLo68DWFCCmiRwjKlYl2ANqEr
	6gZeR0qGDmfFGHyEm92dskZoHYw7Tsnmi9v1O0MXBQQMr+GSRJedXuFfi0tjkxp1m3lJ83WaajX
	hemKrAbgxRd+Gi+gbzdoOF+lKDQs1uFM651SGc4dH4Xx2z3JUdkZ6ahrWehzc3yVux3GhFecCpQ
	2XJiQhRMUly8wk2yN4yPhCNN2pKUzqFU3abc1Bb0Hb09hC9p/Zz7cGQM8skASPLEQ5ih0UKfZBj
	P8w26SEf67c2XhkzanM+WOM4iecTSHoNxBY8/mFN+XVbZztRaOry1+aiXsa4AK7+8XNk7evimo/
	CyOv858RiuUa8O81IlFg0HUme3CA/aswHA5sblwyHqqY=
X-Received: by 2002:a05:693c:2a08:b0:33b:7fff:dfea with SMTP id 5a478bee46e88-342700bf366mr1168088eec.2.1790369513396;
        Fri, 25 Sep 2026 13:51:53 -0700 (PDT)
X-Received: by 2002:a05:693c:2a08:b0:33b:7fff:dfea with SMTP id 5a478bee46e88-342700bf366mr1168056eec.2.1790369512668;
        Fri, 25 Sep 2026 13:51:52 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757f31sm13085734eec.14.2026.09.25.13.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:51:52 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 02:21:36 +0530
Subject: [PATCH v3 2/2] dmaengine: qcom: gpi: Convert dev_dbg() calls to
 tracepoints
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-add-trace-support-gpio-v3-2-8572bf7456b2@oss.qualcomm.com>
References: <20260926-add-trace-support-gpio-v3-0-8572bf7456b2@oss.qualcomm.com>
In-Reply-To: <20260926-add-trace-support-gpio-v3-0-8572bf7456b2@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790369498; l=7464;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=IBzKwuEAw2IzSX3BSi9sh3eWLeU2EFMHDvkG5DZOjbk=;
 b=kWa1HxqLG5GpSXPv03O2FAd72j4c58leYBHJkisUNw+YbrNXn5v+3YVmvDkofVz6nVACoBb2W
 dEU7/3Zi6R+CCF4//W7GjcVHTGUaDnAELs+EIh2cILioWv4irhwEbxr
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA4MyBTYWx0ZWRfX83dC4McDoFS4
 ebhSx1drPUIy1U0DqIR3Bx9E/u6cLguaAlI76DY0v951GGf6TC2lJQn0Og4xF5r2EwaJd028O4d
 EnpfemzmJ9jeU8q4SnlN4uTX5gqcsVg=
X-Authority-Analysis: v=2.4 cv=dZwVTnXe c=1 sm=1 tr=0 ts=6ab6deea cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=aSNI5RSwOxee8bqK_isA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA4MyBTYWx0ZWRfX2znKzfq9kqGJ
 PN8Q30I/+YdyST+fQR7kLfFkYlsTbnfReVGS7poDzN5sl5qFtUslHJk0aztxC0bZNHoLLW2buoP
 QIiZgpftG2262PPk5cshlPGXvpOs1rGI5nyCcUVM6qL83ZksWU3pq8XCcIPg/BxQPsOMbgT0fn5
 /C3gUNhA/Goyv9MSwGKTEEWCq7kc8NCH6gxmujwKsBDHpjgLvvVDmlS36HLV/148bytB6N1/wxn
 ohAPQhIhqfxKVQz1qLjWBbc1BfswIEQ+No8E/xjppwuvMGA++VehNLGssFfMViHDv5wylyt9B0a
 otVbpaZUhW4nPI9KFd4SKbdTaWMzoUp+jzszJFNBQNUISpHa9QCczf4s9lmdzhwvKwjHsMLAmIt
 l5IBLpPmv6k4AE6/tkdXdgv/KZXuUSzV0vjS39wDoWxHqG+6cw5TR+pHqWUUVXsBMW6jSnXvrUr
 ZTbcp4jJMe0nhy8fveg==
X-Proofpoint-GUID: nQZFTuzPR-R4XkH_IhidI5PWwyTRNMtw
X-Proofpoint-ORIG-GUID: nQZFTuzPR-R4XkH_IhidI5PWwyTRNMtw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250083

Replace the remaining dev_dbg() based debug logging in the GPI DMA
driver with the qcom_gpi tracepoints, providing structured runtime
visibility into GPI DMA behavior without requiring invasive debug
patches. dev_err() calls are left untouched.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/dma/qcom/gpi.c | 58 ++++++++++++++------------------------------------
 1 file changed, 16 insertions(+), 42 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index fafe6ac848d9..6aff2a0d5416 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -684,8 +684,6 @@ static int gpi_send_cmd(struct gpii *gpii, struct gchan *gchan,
 	if (IS_CHAN_CMD(gpi_cmd))
 		chid = gchan->chid;
 
-	dev_dbg(gpii->gpi_dev->dev,
-		"sending cmd: %s:%u\n", TO_GPI_CMD_STR(gpi_cmd), chid);
 	trace_gpi_send_cmd(gpii->gpi_dev->dev, chid, gpi_cmd, TO_GPI_CMD_STR(gpi_cmd));
 
 	/* send opcode and wait for completion */
@@ -797,7 +795,7 @@ static void gpi_process_gen_err_irq(struct gpii *gpii)
 	u32 irq_stts = gpi_read_reg(gpii, gpii->regs + offset);
 
 	/* clear the status */
-	dev_dbg(gpii->gpi_dev->dev, "irq_stts:0x%x\n", irq_stts);
+	trace_gpi_gen_err_irq(gpii->gpi_dev->dev, gpii_id, irq_stts);
 
 	/* Clear the register */
 	offset = GPII_n_CNTXT_GPII_IRQ_CLR_OFFS(gpii_id);
@@ -866,8 +864,6 @@ static irqreturn_t gpi_handle_irq(int irq, void *data)
 			u32 ev_state;
 			u32 ev_ch_irq;
 
-			dev_dbg(gpii->gpi_dev->dev,
-				"processing EV CTRL interrupt\n");
 			offset = GPII_n_CNTXT_SRC_EV_CH_IRQ_OFFS(gpii_id);
 			ev_ch_irq = gpi_read_reg(gpii, gpii->regs + offset);
 
@@ -887,15 +883,14 @@ static irqreturn_t gpi_handle_irq(int irq, void *data)
 				ev_state = DEFAULT_EV_CH_STATE;
 
 			gpii->ev_state = ev_state;
-			dev_dbg(gpii->gpi_dev->dev, "setting EV state to %s\n",
-				TO_GPI_EV_STATE_STR(gpii->ev_state));
+			trace_gpi_ev_ctrl_irq(gpii->gpi_dev->dev, gpii_id, ev_ch_irq,
+					      gpii->ev_state);
 			complete_all(&gpii->cmd_completion);
 			type &= ~(GPII_n_CNTXT_TYPE_IRQ_MSK_EV_CTRL);
 		}
 
 		/* channel control irq */
 		if (type & GPII_n_CNTXT_TYPE_IRQ_MSK_CH_CTRL) {
-			dev_dbg(gpii->gpi_dev->dev, "process CH CTRL interrupts\n");
 			gpi_process_ch_ctrl_irq(gpii);
 			type &= ~(GPII_n_CNTXT_TYPE_IRQ_MSK_CH_CTRL);
 		}
@@ -945,17 +940,10 @@ static void gpi_process_imed_data_event(struct gchan *gchan,
 		struct gpi_tre *gpi_tre;
 
 		spin_unlock_irqrestore(&gchan->vc.lock, flags);
-		dev_dbg(gpii->gpi_dev->dev, "event without a pending descriptor!\n");
 		gpi_ere = (struct gpi_ere *)imed_event;
-		dev_dbg(gpii->gpi_dev->dev,
-			"Event: %08x %08x %08x %08x\n",
-			gpi_ere->dword[0], gpi_ere->dword[1],
-			gpi_ere->dword[2], gpi_ere->dword[3]);
 		gpi_tre = tre;
-		dev_dbg(gpii->gpi_dev->dev,
-			"Pending TRE: %08x %08x %08x %08x\n",
-			gpi_tre->dword[0], gpi_tre->dword[1],
-			gpi_tre->dword[2], gpi_tre->dword[3]);
+		trace_gpi_ev_no_desc(gpii->gpi_dev->dev, imed_event->chid,
+				     gpi_ere->dword, gpi_tre->dword);
 		return;
 	}
 	gpi_desc = to_gpi_desc(vd);
@@ -1064,11 +1052,10 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
 		dev_err(gpii->gpi_dev->dev, "Error in Transaction\n");
 		result.result = DMA_TRANS_ABORTED;
 	} else {
-		dev_dbg(gpii->gpi_dev->dev, "Transaction Success\n");
 		result.result = DMA_TRANS_NOERROR;
 	}
 	result.residue = gpi_desc->len - compl_event->length;
-	dev_dbg(gpii->gpi_dev->dev, "Residue %d\n", result.residue);
+	trace_gpi_xfer_result(gpii->gpi_dev->dev, chid, result.result, result.residue);
 
 	dma_cookie_complete(&vd->tx);
 	dmaengine_desc_get_callback_invoke(&vd->tx, &result);
@@ -1100,11 +1087,8 @@ static void gpi_process_events(struct gpii *gpii)
 			chid = gpi_event->xfer_compl_event.chid;
 			type = gpi_event->xfer_compl_event.type;
 
-			dev_dbg(gpii->gpi_dev->dev,
-				"Event: CHID:%u, type:%x %08x %08x %08x %08x\n",
-				chid, type, gpi_event->gpi_ere.dword[0],
-				gpi_event->gpi_ere.dword[1], gpi_event->gpi_ere.dword[2],
-				gpi_event->gpi_ere.dword[3]);
+			trace_gpi_process_event(gpii->gpi_dev->dev, chid, type,
+						gpi_event->gpi_ere.dword);
 
 			switch (type) {
 			case XFER_COMPLETE_EV_TYPE:
@@ -1113,7 +1097,6 @@ static void gpi_process_events(struct gpii *gpii)
 							     &gpi_event->xfer_compl_event);
 				break;
 			case STALE_EV_TYPE:
-				dev_dbg(gpii->gpi_dev->dev, "stale event, not processing\n");
 				break;
 			case IMMEDIATE_DATA_EV_TYPE:
 				gchan = &gpii->gchan[chid];
@@ -1121,11 +1104,8 @@ static void gpi_process_events(struct gpii *gpii)
 							    &gpi_event->immediate_data_event);
 				break;
 			case QUP_NOTIF_EV_TYPE:
-				dev_dbg(gpii->gpi_dev->dev, "QUP_NOTIF_EV_TYPE\n");
 				break;
 			default:
-				dev_dbg(gpii->gpi_dev->dev,
-					"not supported event type:0x%x\n", type);
 			}
 			gpi_ring_recycle_ev_element(ev_ring);
 		}
@@ -1409,10 +1389,8 @@ static int gpi_alloc_ring(struct gpi_ring *ring, u32 elements,
 		bit++;
 	len = 1 << bit;
 	ring->alloc_size = (len + (len - 1));
-	dev_dbg(gpii->gpi_dev->dev,
-		"#el:%u el_size:%u len:%u actual_len:%llu alloc_size:%zu\n",
-		  elements, el_size, (elements * el_size), len,
-		  ring->alloc_size);
+	trace_gpi_alloc_ring(gpii->gpi_dev->dev, elements, el_size,
+			     (elements * el_size), len, ring->alloc_size);
 
 	ring->pre_aligned = dma_alloc_coherent(gpii->gpi_dev->dev,
 					       ring->alloc_size,
@@ -1437,10 +1415,8 @@ static int gpi_alloc_ring(struct gpi_ring *ring, u32 elements,
 	/* update to other cores */
 	smp_wmb();
 
-	dev_dbg(gpii->gpi_dev->dev,
-		"phy_pre:%pad phy_alig:%pa len:%u el_size:%u elements:%u\n",
-		&ring->dma_handle, &ring->phys_addr, ring->len,
-		ring->el_size, ring->elements);
+	trace_gpi_ring_info(gpii->gpi_dev->dev, ring->dma_handle, ring->phys_addr,
+			    ring->len, ring->el_size, ring->elements);
 
 	return 0;
 }
@@ -1542,7 +1518,7 @@ static int gpi_pause(struct dma_chan *chan)
 	 * client needs to call pause only once
 	 */
 	if (gpii->pm_state == PAUSE_STATE) {
-		dev_dbg(gpii->gpi_dev->dev, "channel is already paused\n");
+		trace_gpi_already_state(gpii->gpi_dev->dev, gpii->gpii_id, gpii->pm_state);
 		mutex_unlock(&gpii->ctrl_lock);
 		return 0;
 	}
@@ -1578,7 +1554,7 @@ static int gpi_resume(struct dma_chan *chan)
 
 	mutex_lock(&gpii->ctrl_lock);
 	if (gpii->pm_state == ACTIVE_STATE) {
-		dev_dbg(gpii->gpi_dev->dev, "channel is already active\n");
+		trace_gpi_already_state(gpii->gpi_dev->dev, gpii->gpii_id, gpii->pm_state);
 		mutex_unlock(&gpii->ctrl_lock);
 		return 0;
 	}
@@ -1703,8 +1679,7 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 	}
 
 	for (i = 0; i < tre_idx; i++)
-		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
-			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
+		trace_gpi_tre(dev, chan->chid, i, desc->tre[i].dword);
 
 	return tre_idx;
 }
@@ -1797,8 +1772,7 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
 					 TRE_FLAGS_IEOT);
 
 	for (i = 0; i < tre_idx; i++)
-		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
-			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
+		trace_gpi_tre(dev, chan->chid, i, desc->tre[i].dword);
 
 	return tre_idx;
 }

-- 
2.34.1

