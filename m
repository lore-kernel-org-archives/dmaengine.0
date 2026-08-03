Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ECD33F585
	for <dmaengine@vger.kernel.org>; Mon,  3 Aug 2026 12:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785758607; cv=none; b=tr2by328Ybp2YRgZyu0GGvLgOL3gYbXTdUUEnkrwz1Nrsz+KL4U+1Jq4zbr/c9KT65oIVVtXc10vn+ZuNuZLR2VMBfiUP0l09teMMUwyLhY3QV5zgm3JiA5cJ/qoIDp31oT9TdSmwADa5PPx5wUMkNT8usqxM39bHdq8ZQ/qCJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785758607; c=relaxed/simple;
	bh=b4P5gpqQXJvE+5D7NTYuJLS8awT2aYmEnf2h2Wt8eps=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bedDAW0tmO1zihsj1g2YJ40magH0SubAo/bI6iZsnqoXoIJ9QVAfgU4bEUfj8EKyEoVhWx7lRPTmSMJ/F940AwN5fcmxX+o4590uAOKLKCuNAl44HZ2VTXV/jE82dwZKyufk2v3qsIm4MH0aWo34FpOond4l7LJw/ZMomnDLjzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PO+1I9VK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M7t7IbCx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PO+1I9VK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M7t7IbCx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6739uYYt3654647
	for <dmaengine@vger.kernel.org>; Mon, 3 Aug 2026 12:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QwIMHmcwUjBkFbCKRQ/lfdbRU1+R9mO353t
	JF2bxxE4=; b=PO+1I9VKv2lrpw8v/8EVLtGTOvPF4itjfUmjrGZTY1dg93d6g6z
	yQ3B7BZY9QkdkA8dhWWBEScXaxF257kgFkZKF9/3c5PVHoSusFPoWFQpM53L75ET
	VxViz068cRWWmLYJL/Ri9DZYQTWgtiT7KxewOdph0cBTwpEXXOXfVPz6w8HadWjm
	vteLHwuD70T/eS5sX+wOoWsR+gLX9l6wt/FC58P1VP+eJgIAWDoeHLa9jBHHPd1J
	AbSnsUDHwAP1DxpTmg+Vja0dz/rYqGnEDJXdLqjbKaDjRE6FexZHLupeJ7cqeieu
	fToNgPNQpXJZ7VRqAJWcthnw9I25nILVhhQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhb1f64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 03 Aug 2026 12:03:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8484b9fb055so9281679b3a.0
        for <dmaengine@vger.kernel.org>; Mon, 03 Aug 2026 05:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785758604; x=1786363404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QwIMHmcwUjBkFbCKRQ/lfdbRU1+R9mO353tJF2bxxE4=;
        b=M7t7IbCxD8XN+Nz/ViKI+1Gm4TeSeV7vBixhrzJYyDkLNPX6LANFVMak8fvZrBH6qC
         zqRjnO+gWojZwa9mDOzhGnPeRSIM9nYylyxCX4IcUg3NC9j75j32inQ9/y8Qwr5ZZsUQ
         DOQy+9PW4+c10ZH759o6gQavjNPbcRa7mS5nJwoX8Kp82w2i1QGZSqO/TXfb/HpIVQId
         C4aHLzJb/XXaw8T58snIYPCjvj9OdX3C2J2/uZ57OkqD5oLEZUEorl9bPyPaWMY5sqtX
         mwZ0R6jR7dsb08440lk8TRNNe5+XBogwYh+xBcWNlC6RWcDu3TU/gXbY8WrP2BO6XyEz
         dUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785758604; x=1786363404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QwIMHmcwUjBkFbCKRQ/lfdbRU1+R9mO353tJF2bxxE4=;
        b=d022ubBlaJPeMLJeUr+7qgahiwWZj0Sa0OwGaD7PgVXGlc/wge/odmkYQko92vd0TO
         ZGB8PMB8bgXeLVVBPwulzf7CArcxmvo5TfCMIpucrFks/FTJaxhHc6y5K57jd7aSruT1
         YJxhPx1ey6kbF2883GOIksxMIejB31EShkvcMkbEfGVrOm3s9/HXIkhRguVb/TC1veac
         gdi4CGCr0yazx7uVsDDa9tiJnscZ3CBwJp6HHjGHkdFTEYAgkqWIO4BAAD36w61tpeu2
         ZxKXTn5umMGnFTW19tT2VpwKKY0tiX2tGliz7qGX5TWqTnYB/apmu1LVzeZeACTGNxpO
         59kw==
X-Forwarded-Encrypted: i=1; AHgh+RqHjk1S7in7d4BxELvOLXYWL9XWb7HQglmIM/zHJW+qtgXkx9QlJIn5FfhDqI/bfDpouKBwBnsDImU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZynPNX3dM1l0NNNjjGXoiJ5UlhSr6ZtXnSjI+qxGiDZCNUfY+
	2SlTh6pP2xOxP9/dvMD2Ffm1o7HDkEQUmsKuN86DI4LN2QzyfBEX8TI5Ht6ZrrmM6icE22hJZ7h
	hdDxVp4z6/p6pLmZQd7l3Y7d0t9u4Mb3O5/qNfVOROnp4mhI/WBDif38I0u0i93Y=
X-Gm-Gg: AR+sD12WlHM+aCzam+2YaPiLOLVfBntysAxaVWoWRIMar/JRSy/w5xvIreABBGo9wSD
	++1geaEU+D/49eqRmkBtR3nH+zh3f5yNGqtfFKpxe8EDQuDUErSQRfwJ8BwknOtnhZU/I6gYakD
	Za5ogesXCV5xpyVoxKOrnH+wlzxLSCZFvGXHVIz6ErC7Tlhaef8KVHCU9Cwf9EjJL5ZIyZ2aoGs
	vtwF04DIpFQZVRGKkMlhbeGLOGFEG/vBrpUzidaiSGMPYOOiqBgbM5u5RtuDL2jWLNztaCpL8tT
	EI6hnHkwfisVw/g2zxflrPaaiJFk1ilkfKu4dJMvyaEoQvhHDHc8zCvewIG3bJJC1/NwXOurdhx
	2JBfjQatK4654qhXrairV6ZZ0SY58k58kFC0=
X-Received: by 2002:a05:6a00:188b:b0:845:eadb:821 with SMTP id d2e1a72fcca58-84ee47e4818mr9124414b3a.14.1785758603684;
        Mon, 03 Aug 2026 05:03:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:188b:b0:845:eadb:821 with SMTP id d2e1a72fcca58-84ee47e4818mr9124381b3a.14.1785758603305;
        Mon, 03 Aug 2026 05:03:23 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d7bbdsm3633916b3a.47.2026.08.03.05.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 05:03:22 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>, Icenowy Zheng <zhengxingda@iscas.ac.cn>,
        Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
        Miaoqian Lin <linmq006@gmail.com>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
Subject: [PATCH v1] dmaengine: qcom: gpi: Fix channel cleanup in unwind path
Date: Mon,  3 Aug 2026 17:33:16 +0530
Message-Id: <20260803120316.2703956-1-aniket.randive@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: W0HdURJWnzLCtoxdNVqNVF1ns77XJGJo
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEwNyBTYWx0ZWRfXxD0inDurFedq
 R11VOv15tJ5FYy6tI7do1ah9sUpD0GNBAOyilHARWW0WuB84WRUZ0818EHmd6FNk8mQLgtak93i
 2dDCZQldIy5639acgdjauJ6R7G6Iz68=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEwNyBTYWx0ZWRfX6QVxsJkyupEA
 PRL7tCNnQrXsDwyr7oEyF7GlvcPl5VN5NZigFs7HNotcqtWfsxXZtfKwBGfCJrPH5S+6Kz9Wew5
 Tfzv5v2UhKwRwyjZlxTQ2TZ6wM3tY/boDFh2XviMB/fag0p5alfDlesEC+ed/6RGNwhTU9VYA8p
 hv246zNhZw181Jg/mop3qoCKCE++1lw+vyqbpFwGrMhnkHOyRFocrddRQ89fMutUTrmFbMzaB16
 xEY0HqymtpM5Wf2unDoTKIZPv3Kkqt1gtLogrscsfnl6UGfolGixNMyx+w5nqEFH/EVJmsKYRzk
 G3WTcSyqYPc0o3IB6FON6J0mEgW0NZsq7Vzg+pXf/7z9tsk/oYXz+sysg+H9J7hQYaOUv1zmYPb
 dqW4ww7XbG2nmRePnRvZ6cJnXKJUhThBk9vDFtgyryxSPLzh8nGq0JzpbuHw8V6WK9kD88E1jSN
 eR9HubKE5CiG4+7ZVRg==
X-Proofpoint-GUID: W0HdURJWnzLCtoxdNVqNVF1ns77XJGJo
X-Authority-Analysis: v=2.4 cv=bKEm5v+Z c=1 sm=1 tr=0 ts=6a70838c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=FETWPXT763Spi1ujXv4A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030107

Fix three issues in the gpi_ch_init() error path.

Use the indexed channel in the error_start_chan and
error_alloc_chan unwind loops instead of the original gchan
pointer. Otherwise, each iteration operates on the same channel,
leaving sibling channels unreset and undeallocated on failure.

Clear pm_state after freeing the event ring in the error path.
gpi_alloc_ev_chan() sets pm_state to ACTIVE_STATE, but the error
path frees ev_ring without restoring pm_state. As a result,
gpi_free_chan_resources() may attempt to deallocate an already
freed event ring and issue a redundant EV_CMD_DEALLOC.

Also free ch_ring in gpi_alloc_chan_resources() if gpi_ch_init()
fails. The ring is allocated before calling gpi_ch_init(), so a
failure leaves it leaked without this free.

Fix all three issues by unwinding the correct channels, restoring
pm_state to DISABLE_STATE after freeing the event ring, and freeing
ch_ring on gpi_ch_init() failure.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
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
 
-- 
2.34.1

