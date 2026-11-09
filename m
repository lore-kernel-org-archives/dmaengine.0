Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794198541;
	b=kW0IC3L+/Pju7FZ0wlo1gR1zOuGC0T77OWLGtsMtjKPX1DhLx7NwcYnZy/JmavLTKq+o
	 OSosgiNWJq+YdVaHZMKzTiNEmkAXgBDJg9Cuc9PQpNo4BpxmWDVB2r+958y5H0j7jgvfC
	 fX97b8f/qsUbUSgwv9whCN6uiSfc38ywHiaNhC3/w0ivn1C+8R+cufwZ4Jh0H5jfrkTM7
	 w5Ol9znX4LkWU9mPu4gAXAH1vxtX1IQAB5kBkdnz5+/6bmatJQ1wqLMJSUrviA9NhWoXI
	 rw4K0PLW2aVec9n7gf07YUYq15SwlwfKl/J8LQMLVEuLq1KYXD0gfagBt2vkpAZNBng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794198541;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LJwHANRk4tsTqKIG5HVa8grr0FIcoaYoEAnJnona81k=;
	b=IT69FYy63VPARZ/Q++7vXb2HiQw0p4J/mm48oP5hsjSLrDmcVIUe14RkV2pOZarUb3ZN
	 muJtwQ+BwUtDVpLOUuWlEL+KnglpuWt8gpDUCfhlyLZrG1RDj1zMbDTocUROkpxlZeRIG
	 ch813S6/njogNqxqL3TV6lQ2OP6SwPaUrE/FFPaw72GXVE2ajU5EVxLk4lwo1BwL8O55B
	 y0l0drE9bUsaiIzXTsJ5dzQbqwyh9fFqRVzeIQ4Y2vL5rvGM/NvDTpxCQ8aySl1C/S6XH
	 Gy0xtyQkuSTjj2ohdx+YpHz4sktwzaLFyL4WkfBZR4c9wwMAW7TIQ1tF9wv8Ulaod0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Dg/1ADdW";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aRhhKj79;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29388606A332
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 04:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29388606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dg/1ADdW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aRhhKj79
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A93KiCN2938280
	for <dmaengine@vger.kernel.org>; Mon, 9 Nov 2026 04:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LJwHANRk4tsTqKIG5HVa8g
	rr0FIcoaYoEAnJnona81k=; b=Dg/1ADdWiOGDtcP7ApMBmxrDdb8yocp1SJYpZL
	0Ux+tI2H7ygWfveTOoeSVb+oA+Akm5KSjOC9zTX67IZ4nIMd8HWGZsXxz2SP9zOZ
	9AbCahH5/55oXE5ys5AYNAlu6L9WjQGMQwQFr3ZHUWmi60aIRk8amMYpw/fHgnG+
	ol7duHA4L5ImhR3h4YP56WWqbwi/rVF14cA9lCzk/kHzr08GyxNIkfI33DsGj3Tu
	0y6NMgczE7sXSxb0fyfDiwvW7k/L4OeIw9gxLUbdC6fy8j1v9zK6Ojfbt40E7MS5
	PPmm1+yi16Qc/p7s/JvA212RwPCpg0f+pkTQNAy6BzyuVL9w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagvrhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 04:28:58 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1ac19c6bc71so618615c88.0
        for <dmaengine@vger.kernel.org>; Sun, 08 Nov 2026 20:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794198538; x=1794803338; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LJwHANRk4tsTqKIG5HVa8grr0FIcoaYoEAnJnona81k=;
        b=aRhhKj79xqFwVidt96guMcvvEhRpd2/OtrUg7NJTbn6+llkvwtiBoQ16hnWCa3sjTd
         37MqlQhmFeMnQehWqKCQzJ0qC7nakUh+6z8q8RzxfBdth5hd21FCTk4/qp6r5FgtEnTj
         d7GIQ44mMZgQwybNGY8dlUv6X8M3WUohrcXLwYDSwUUlmC5d2U2gBKA0R9IIEhmlZAOZ
         ct6mCPO1yPNBdf+hd5vNZaSxC/HkCfjPoq7TeUzSzaWEEJUozUhD0dtXxigm1EW6BdD0
         YrQxgRRW0r+nXqO2I4RRlzLEjXgMDIYXdOzKAI7CYR9TLBq+0itCu7mUo4g8qgxQGSP+
         5ZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794198538; x=1794803338;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LJwHANRk4tsTqKIG5HVa8grr0FIcoaYoEAnJnona81k=;
        b=E1tDuYcgfXJHH0MxL4SOW0GMkx3BmrvLWdjzQYXcQfGTWFp0FQW8sxR9os4MCYhZVh
         R2MixQbQGLTL8xKx/2UToMWO3Q5dZoty+Zq6uP82FXFMGwkSekVlSOo6MaSUlGKP4AuL
         YpMrzYMMN28QB7fcKCNQLfSZGt+l77gEjDJ+qAseRKOUSdDNa8WGw++Hc1aqcQep5+vy
         ZtoVUgTJOWItjKAU84o0RS1KT9kfpmwNo0Be2PdzAk3/RiOAI5QN1xu43Sv0A4wvAxvL
         YLdU1a6nzHG4me0N5Yjq0zE3Vph71VqgxYajHU5eif1QgDhmkGA2TnqH3sJrEKcGOcBE
         mBug==
X-Forwarded-Encrypted: i=1; AL+hErGv+xPHUyxCskmHGq24EZht3vrf5JnQ7jWXSBzlEBXAHrqYcT+v6ApJJ9aYctT/3dX+YZ1ZqADhoF8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EnVk0JbPspHSwvqgjjO1BcyYiM3iDjGnoltsFGHya69L4HwwU
	JN2XvNyERuWkzJHBtTNdGsSpqSNRaSGrZVC9oSCMVxmJbcmE6Z+I1TpGZQvILqoT3yVEpc/JQfO
	H9OPIrHnW9kDVpVdz+0QRUwsPspXnkyeYcpBv/wZKG54abn0VLa44K/8ztjmoBvE=
X-Gm-Gg: AYBFou2IRaQgLVl9G6zCbPcbBABInKPLx/8b/t/YUMTy/n+dzYdCyl+3wbxVkUvS3pj
	jJhmKw8T+HRrrk0cXG+Wx6N+2gBAwWKfeXy+mJyzm95NheQbFHTjvhQzAN5nba+YPWrIPyYSDyw
	qkOH3ojKQ9emLgDPtY0qidLQNIx2V/l2t5LP3MN8Tn7gG1wZeMAfTBon4Dh3u5whH+T86yGwGzN
	5tnWTtW1dV+VEaFtPLRQ0jd3vYa6gsyTZkdJHoHGvCvQEQtEesSyedwAnkd/j8chSUdFy5BxNKE
	VDkz18vriB5khh9A737HZqUGzWGGllAsSsOSSmhk2VYdsNE2SKNw08DkWuVztZ599EE4aDKqHMd
	vBDzUfmwEpg46CZ82LcCZXj8zOsRO3MifCkdZamYXrLZKZ0XJF50jYIphSzYG2Uw20PaAPQFMcC
	c/nV1cpQ==
X-Received: by 2002:a05:7022:7f1b:b0:1b3:abd2:2eb2 with SMTP id a92af1059eb24-1b3abd22ef9mr1860354c88.10.1794198537665;
        Sun, 08 Nov 2026 20:28:57 -0800 (PST)
X-Received: by 2002:a05:7022:7f1b:b0:1b3:abd2:2eb2 with SMTP id a92af1059eb24-1b3abd22ef9mr1860338c88.10.1794198537076;
        Sun, 08 Nov 2026 20:28:57 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3773ea50asm8995525c88.23.2026.11.08.20.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:28:56 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v4 0/2] dmaengine: qcom: gpi: Add trace event support
Date: Mon, 09 Nov 2026 09:58:48 +0530
Message-Id: <20261109-add-trace-support-gpio-v4-0-85ed08134917@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAABM8WoC/4XNQQ7CIBAF0KsY1tLA0BZw5T2Mi1Joi1FBaBuN6
 d2ldaELGzPJJD+Zef+JognWRLTbPFEwo43WXVPItxtUd9W1NdjqlBEQKIlgFFda4z5UtcFx8N6
 FHrfeOiylUUWuc+AgUXr2wTT2vsCH4zvHQZ1M3c/afNHZ2LvwWJpHOt/9LRkpJpgr0miSRiu2d
 zFmt6E61+5yydJCc9cIH00SuapB0ghtBOVMKiXEisa+NChXNZY0UXBQDc+LUsEPbZqmF07eqAZ
 xAQAA
X-Change-ID: 20260831-add-trace-support-gpio-99eb54d42729
To: konrad.dybcio@oss.qualcomm.com, Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794198532; l=2238;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=uZVsM1c8oIXO7DcXPRYabeES5UWADGd7YRW30QOmPMY=;
 b=dD6i0TZeO2EkikZu+u8mBbu1ftPGi2a4YnQEgcar4pMs3uLTQBLfDuLmEjuY2o4DBcS5zgLBt
 XhZGQsJF0ITAa5Z9hJprvAW1Bu7xypmJ0sLICCjonUaIb8mllMnTHtv
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAxNyBTYWx0ZWRfX4GThQGYVhRAI
 zXWZTtIMZVKTPSGJfVRBkPRMnEO54J1C3u/zr63lspe7e5VmfWpW0ZOJKvROV9V0D+i9gscZVaD
 3/Ij2wHvtv/SkBJSfe4XqjliJMEI5S3acW6HVt0xoPzxi79iSuQvm8imPixXB6h6kIlKhq2pqOA
 n2HsBsA1574lYxvhfXtbmzmGDsMOPyKbQShybuTBz1U/+GmtEFVrnyz8fcO3tqohC7M2bl+0Ymu
 wJovvnEQnh4eqe/qWPoqlkivVxoGeGZ7Py0jRoOfE3bjbFhiWVnrLjAuBHxvJHnyp/lYKt25WLp
 Inh+V/hoiMVwpP73qW2Dqebca4wiAY7pW1JJ9/WltYlJFz4FCThgnYN6Mxpyf+erfIsvtBXa7c6
 lFZ2ejSUc2xzbRzyc35XVs/1poaMY3ISIRjBCNU0gmjU1XVCAC5q6fVnne0qDBVm5hJmRTlul/f
 GfpIHMdNdM6R3Hpnb5g==
X-Proofpoint-ORIG-GUID: fxcAokjx6NqAKS2JSKCkGa_ZNggVc0n0
X-Proofpoint-GUID: fxcAokjx6NqAKS2JSKCkGa_ZNggVc0n0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAxNyBTYWx0ZWRfX7qH6MRZX+qSu
 yescxVWnI8sKqsKKs2QBfmYXyhd6qobVNSnlgJRWGFVvFiCWxmi97PPSCXVsvw1k+h1iWQDCHoL
 1nrfljVNGMK7drYKqmIWGueyUClVNmA=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6af14c0a cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=bdZYBwkQuwfaf9MGlS0A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090017

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
Changes in v4:
- Use TO_GPI_EV_STATE_STR() in the gpi_ev_ctrl_irq tracepoint so the
  event channel state is traced by name along with its numeric value.
- Link to v3: https://patch.msgid.link/20260926-add-trace-support-gpio-v3-0-8572bf7456b2@oss.qualcomm.com

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

 drivers/dma/qcom/gpi.c       |  70 ++++------
 drivers/dma/qcom/gpi_trace.h | 320 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 348 insertions(+), 42 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20260831-add-trace-support-gpio-99eb54d42729

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

