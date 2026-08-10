Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99117397933
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 06:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786344703; cv=none; b=ns50z/7G92yYHCBId4eDTAXkKX/LMEqbFXsYct/84dPfd+e5YRSIRV+b4om7sTHPBUHAnJv/hUvD6kyODIrpbpMUoJr4t3TWbtViejI9Da2YnzGXPycw0uqZFT9WA0VBieNVwl9kXz39xJYW+LcA5CgljVWR8tLo8F+4OYkpnn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786344703; c=relaxed/simple;
	bh=RPOctzV+RKxb3xJXErTJc0vDALFcDOTB79vTZkKh2OQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jxx4h6V+pjcsRJT5yQ9oGvCP07us32qZBGIcSWLTheP0wXl6S0NJjstyqsOkQswy5fvREjieAarQ3l3GmUeu2dlQt3TBuu5G+usOD7aLttdV2ToMcmjf2w928f7b0BoXr+jceMGBf0TbwCbnC8Wf23Q2st+cYYE3Wc/SjUQeKaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAS8div1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W7b3GAwC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAS8div1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W7b3GAwC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5pOYK1014433
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 06:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=p7xoezRWgP0BGhKK6+4vr9
	cVInLGyGVotTxlS+aj3SI=; b=hAS8div1NgbKKZI2vxJe62L1hM3idNwKL8yaK2
	9TBijRbQycXpMHJlfr4XjMmgiK/99vzA7QTwKbO8xWW+qKhxlyqdTiMUq/W3MtMi
	9IwLoJvxwvPCw7RLFM33Zv7sKik71kaS2CKJ/JWhNtrwP8pZh5yngU7O1Vg2rP6Z
	cv/7SnGn38Nq7NZbosqczilyXw6mc+hj1c3u6359qrMTBlJsQZSJ+2xZGhYoR13g
	bBlcaILZKPw8R1RwJ5QmSCLdhrId9R6Q5NSBr8EJPuXZki6AhoGzwq9YbNR/SaOM
	6i2LR/Xq4DdJgP9R7kFnNtFJMteyzUyLacf34dE2L9rNuYkg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v4g5yn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 06:51:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so2864323a91.1
        for <dmaengine@vger.kernel.org>; Sun, 09 Aug 2026 23:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786344699; x=1786949499; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p7xoezRWgP0BGhKK6+4vr9cVInLGyGVotTxlS+aj3SI=;
        b=W7b3GAwCSzLdSxzXnCs7t0YBP8VsFilyl4wbwZiVKhGh9OmHx9XoJXo/ZKWiJSiJZR
         62KvojXmnfiBHADJZkjTXW9J3e90YmDuURL7fDueuXiGldHg+U5Awh5RmKFf2JGLqhac
         qzKFXl089+1bxe/IpuPPhiVUq0rDAMvbym7rBljWa1WAxybadf1+ZyGY1J7LwjnHo2BS
         4RLRlDymc3hAxcpQtNEbDKxTQuIPvXvQl/qF3kfOu3AXPxDoPJofJhg/eq4Bh87wAlv0
         duLL7qxQyWG3z1f0bgjLAs6qqhY6hoHIPF8rMlbGkPXDc5cn07Q+eAr34V1s+VEn17wD
         pEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786344699; x=1786949499;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p7xoezRWgP0BGhKK6+4vr9cVInLGyGVotTxlS+aj3SI=;
        b=tL0r0FfF3fs86roWuLq4b55+6cYk/48N6YwQLdYeHyctgfMvr6nNCdwkYuemJRFTgg
         vP62ZGRfjGrCLbIBYeE4WEsFQzEU2ukt1RYn5BeOlOGf2uGyPAjsC1aUoUcO6QMRXzMC
         4S40Thwdg31o6aiCOmhfLj9fMIgBw77MtNSMCI1L2JmI2VUNPpvpIkCltxxQGCtBAYSg
         SpFR4Z5AJb2u+Ik+Ct1HAOfM2+CTiTWD63BYTv3Bv5xPZx9WoQhuYD1yGbrjVg5cf9b9
         39ymVOGNVdsB2AvEgbbL8ixrP3DsCGU0f0aiI55zFv3wqvSMPnQDwVZo1YeQ+ie2sF3N
         vAyA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4/h7ctQMMbNrkHbsRPnSIZgGNXL6xcWWEhD2wyst71nsefn2oIRK2aYgid1Lc0vCmYQaZA01SEg8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc8NmRI3EtA+Qr45J313eigBLzqXPwUWgkd9qKCSLvF+kD9fO3
	kl0XrLne2Q0UIYNCSQgGErZ04zy7gbV0y3+IpqRwFRqkFjGXGRv9QGoODHivluSWuIk94aCpu8R
	P4AgTxwEoWHjenW0E2GgzrGvg3nMN3QH5wL3IR5VU93aBhho5v29T7Revyw4g5jY=
X-Gm-Gg: AR+sD13QbMdwxy6eDlVa4TqJcbMJsOELr9+oXbtO9m4DO4MgUZsLbT6Xfc/Cvo/lGMq
	dK9Mqcjb5uMIEqrPWCpn1jV9QhjZy0Vvb6dIP4/eOw6byp2QFpt58rKSplOAMe3wVdaEvSkwfbC
	h5SHkoAZNdNiNvqIjXwUmrLNar/73SzwodouYCFlN5Yyi6oKb9tlDrl4elRSqI+QpPVetmLd8HU
	0Gjbgqtfv2xlUZy9TR33vyU2CxlIkcWBlUmA9+moHLQDw6XBNAFT8lzw2e9nST3uvKe7G1TvRFR
	cfae8z8216U4ZenVtz1w8CppIApfmnN68y89oUz3Lb8+uefJWalhpMD+s4cTIqdR4Xn997DQq77
	2qKxGrS0HlhZpcngFNHcrlCMHlZk2kiNSRV0=
X-Received: by 2002:a17:90b:2785:b0:37d:ee77:78ac with SMTP id 98e67ed59e1d1-3903c5e70c3mr40377919a91.19.1786344699377;
        Sun, 09 Aug 2026 23:51:39 -0700 (PDT)
X-Received: by 2002:a17:90b:2785:b0:37d:ee77:78ac with SMTP id 98e67ed59e1d1-3903c5e70c3mr40377883a91.19.1786344698936;
        Sun, 09 Aug 2026 23:51:38 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fa4fc7fsm11255959a91.0.2026.08.09.23.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 23:51:38 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 12:21:33 +0530
Subject: [PATCH v2] dmaengine: qcom: gpi: Fix channel cleanup in unwind
 path
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-gpi_bug_fix-v2-1-60555394cbf9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPR0eWoC/yXM0QpAQBCF4VfRXNsaK5JXkWTW7BoXaBcpeXeLy
 +/U+S8I7IUD1MkFng8JsswROk3AjP3sWMkQDRp1iRXmyq3S0e46K6cipArZ5llBBcTH6jnOX61
 pf4edJjbbm4D7fgDVqgUebwAAAA==
X-Change-ID: 20260803-gpi_bug_fix-b0b80ef315b5
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786344696; l=2237;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=RPOctzV+RKxb3xJXErTJc0vDALFcDOTB79vTZkKh2OQ=;
 b=AcM1LNYDwHPqINhO1uOjL3UARNoNgbpIH3g3NFqhoSN4UCIQeSnBBeBiwNw1zWP/X6f9ecRsW
 9RcktteR6yaAkycn06ZRS0nlvitMmxqwaMqNH6oXXkQkOa986lZEXlR
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-GUID: 8aXGv7ZJrXcviFSTGVIOaLDBLsdOxrqP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA1NyBTYWx0ZWRfX+sjTpXIvyf6p
 2gcvItldloQjRr/5ZKyfgMDTrQub5UOvoVZarsWvLatLi1PfxfrlsOOQ7N6Y8n0T1BhjlTYSuMN
 TYWSTMR5Rr40WCRAz9IYQZx/4at2egSn85WCH5f0n0e0aUGMEx+rqtP4EeTCqOT//hNCEzjT66s
 559dUVzEWHTpWrKo7ZBeP23ZzED6HmLyYJ7Vu9qtsUlj5J9IXq27eboKftMFyVkE+ek7DgxIzr7
 c7347qvNQYJH/l7JAE3iU1Z7oEOaw8zDcKkTW+eihm21f5sMlImc73JFQNYNwFehZ7mgHlNMEBb
 C26Q/n1zIUq9L8hZ2aAkYuIKnktg+oZGbKEBQa+htDVGnTSfG+f0CbEq/QOLmVqu+Z8TkqlKdsC
 qhTlmV/EpIjSEv7RJphk/UJ76ehsSVnK9ZYyE2B/iy7EFMbt5ZumL/d03+nJieszP+hK0IM2OXC
 5u5fALTyk9nU+6OGS8Q==
X-Proofpoint-ORIG-GUID: 8aXGv7ZJrXcviFSTGVIOaLDBLsdOxrqP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA1NyBTYWx0ZWRfX0WHyuOFMGS2P
 Ez5If79sAv6OMiLNUYEAFTCmcUhIpc20sKJsHomBItPuPx1hHqMHEGCjLc9SS8lgl8JEHp8HuGs
 YArrOMqX1y1xPD1MQQrhNl/Esfb65yE=
X-Authority-Analysis: v=2.4 cv=W8AIkxWk c=1 sm=1 tr=0 ts=6a7974fc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=OU4UCbDFA99cvMy684EA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100057

The gpi_ch_init() error path has three bugs: sibling channels are
not fully reset and deallocated, the event ring pm_state is left
stale after being freed, and ch_ring leaks if gpi_ch_init() fails.

Fix the unwind loops in error_start_chan and error_alloc_chan to
iterate over gpii->gchan[i] instead of the original gchan pointer,
so each sibling channel is properly reset and deallocated.

Restore pm_state to DISABLE_STATE after freeing the event ring, so
gpi_free_chan_resources() does not attempt to free an already freed
ring or issue a redundant EV_CMD_DEALLOC.

Free ch_ring in gpi_alloc_chan_resources() if gpi_ch_init() fails,
since the ring is allocated before the call and would otherwise leak.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
Changes in v2:
- Updated the commit message as per Mukesh suggestion.
---
 drivers/dma/qcom/gpi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index a5055a6273af..c41bfac65ddf 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -1965,16 +1965,19 @@ static int gpi_ch_init(struct gchan *gchan)
 error_start_chan:
 	for (i = i - 1; i >= 0; i--) {
 		gpi_stop_chan(&gpii->gchan[i]);
-		gpi_send_cmd(gpii, gchan, GPI_CH_CMD_RESET);
+		gpi_send_cmd(gpii, &gpii->gchan[i], GPI_CH_CMD_RESET);
 	}
 	i = 2;
 error_alloc_chan:
 	for (i = i - 1; i >= 0; i--)
-		gpi_reset_chan(gchan, GPI_CH_CMD_DE_ALLOC);
+		gpi_reset_chan(&gpii->gchan[i], GPI_CH_CMD_DE_ALLOC);
 error_alloc_ev_ring:
 	gpi_disable_interrupts(gpii);
 error_config_int:
 	gpi_free_ring(&gpii->ev_ring, gpii);
+	write_lock_irq(&gpii->pm_lock);
+	gpii->pm_state = DISABLE_STATE;
+	write_unlock_irq(&gpii->pm_lock);
 exit_gpi_init:
 	return ret;
 }
@@ -2065,6 +2068,8 @@ static int gpi_alloc_chan_resources(struct dma_chan *chan)
 		goto xfer_alloc_err;
 
 	ret = gpi_ch_init(gchan);
+	if (ret)
+		gpi_free_ring(&gchan->ch_ring, gpii);
 
 	mutex_unlock(&gpii->ctrl_lock);
 

---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260803-gpi_bug_fix-b0b80ef315b5

Best regards,
--  
Aniket Randive <aniket.randive@oss.qualcomm.com>

