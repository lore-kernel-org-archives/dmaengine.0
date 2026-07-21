Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01AB36E493
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640834; cv=none; b=rWoT68ShjadJtzdsfs4MZ7K7AYeSKp00OY5H4utQcxxk2uKdWh/f0kQaHyxR1KI5rO6BQ7WGH7i9zgQB+Qr4hDpvFdKRSimm4v/s041AVuKfe01mFxH0/M37gwOaAgEOT6wNLk6WTVsZfPKdQGXJ78qdMpclVqchLO2jwkqS+Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640834; c=relaxed/simple;
	bh=zHIuoWgA0JNzB45qmsTvX1DiRfFAkkbG2L0hbAcWpaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P4/wYCI+o8IpeFT2xIB08My+o6mFfmh3zexABKIi/ZYf3uGBjQSz9V0ni9AHv0M4uWy/y5FdeV1HMH85SrphM+mzBQD8jz/EmmCrv0GwgIIBCXNEgQQBQRzNN9M69KwfAHTQpe70UpOc+oQzm/IHQT8VmEkzXJgnuSew5VkfKfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SkKaAy6B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RK7oK12N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SkKaAy6B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RK7oK12N"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMI2B1793878
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=; b=SkKaAy6BFf5MvwmL
	31AAkggDMdENr2ZIsqudMVzSFlX0EvTgVNQrRnPbeHsqQrCkP50KMy2jevHxgg0V
	PPG+I28a/BcvYVEWceaOXf26yy534lIcc1t1ddMnXj/KNgoepYsBF/kZV9ubbcNH
	nfUwyY/Me47oFy7XMI7fZk0HaKC3gt5DPC8WGORQ8bHBRbmzv2d1NDQd20SaeX2t
	OpKEfM/iBIYKfgzKrTOMM7/I2cLZWbz10xCNS9I0AXyiMacq32VBPkl6nRMtsclB
	+CIK3GY+0q2W+SiBhfVIUC1Vxn3zYi9DOP551ZwYIVGGay8nWslX/jLHF2EdARn4
	Shm+Qw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se2ekp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:33:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a23afcbso99190251cf.3
        for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 06:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640831; x=1785245631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=RK7oK12NxAFOa1t5XGvwcBHsoIfmJzHsFkPwnML0Ohq97ymSpJMG1iXHGn9F1Ck+hv
         CnTbaSPBcaLBxYOCcz9VK66NPRu8xcD05Htq4sALv4RrcVWBJPuOaWlBDhKnS4wgvsUT
         0oN7Rw6OWzOlj37fKFdKt3rVTRGSSXKxH5t1z5wSPpOrV6fKOQIwf6bQ3Bmc1NAf+faJ
         XwDid8gbYXy6Ib7P86SwyZR1UgASTgvImG05TbMQybPTc7lQoqiYplH/KyDJDaY3QRL3
         4tPE6oGBJH59RNXFjYD/JScpBl1xJgxiTrGpLVPaHDN/v+H4uYqdkxzT89AMvF53t/7U
         yhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640831; x=1785245631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=HrRU9KEhfdnB+uWiBFE5rFx+bsFuggjYhbYZewZGMB/EBOJ4Zohhxl8oq2xNafGd5V
         UxBCZXslCkcmgCi2giWwhX2iotnSFW2nf4Z540mAh7HBSGla3ksqyIdxT7Szdnl74FZP
         3YE0+l8R2LENteWmwiQONIlk6Dt44AcAma3SfI28nqO/tGx3ZVBwQIjupomM9T/LGFva
         0uxJBWcv+qmZRAbpFuvM/D265aMR8oVYDGqGGZNYzgTeenuneE48XTg/wBYqR9L4mlNB
         CwScRqJ6w4qBJuOyF02yzDdHYSdjKXr9nGek/YW/aCmmO07eA1sy4MVXhMU99QZnH733
         FXiA==
X-Gm-Message-State: AOJu0Yw9Zhljzd/ECTpkJjNtwVxFxtu9Q68vc9aIuORcMlLXOmT1tALS
	qoAVVLt30pal6QlTI6wQKzoukE6rELvMSw2nFZOCWGQOLVN8F21PS+V6HOMklRZom5k9z19P8VI
	GuKistDAY2J1XTiBHTe2prwFd92/dZOPCvAMd5iin0jUn9U/jYRpce95lJvbUijY=
X-Gm-Gg: AfdE7cmtB9/bD9MCvliuOZbpRQuJo22TeJ5wOe5xgOJhGVzKzS4uMOsYDm8vu0e49TO
	J6dgbNaz5O1xA7nttbD3Xo4WhChCBFZIfC4MVlWUWptWzLNjfPUc7dhngMt/xX14jFyd1lLCghP
	IT1ZF4nJO/dRYu4eidYcXWaWnxIiqiq+qxovJdyM5YMPfnr6TpkgANFF+C0vK3rxc7mMZNLOrhZ
	pKkK6CHuxsDfhkSPnyT9s/2uzAG2pMgCJE+meYVa6u2k7WCsRuAPkwgcxnYGQzKd5ELD/ODZSq2
	CxF8LzLJ0asaz4YirEr8VvD41UhOLj++E848GRYOKwI9OHFvmG2PgZj6e/KG2xO8Vrdw3LhnFJ/
	BelomzcKUksYK8wzdPAtuQaz2HS4/RA==
X-Received: by 2002:a05:622a:15cd:b0:51c:7b12:1208 with SMTP id d75a77b69052e-5213f66b8b9mr181067881cf.86.1784640830582;
        Tue, 21 Jul 2026 06:33:50 -0700 (PDT)
X-Received: by 2002:a05:622a:15cd:b0:51c:7b12:1208 with SMTP id d75a77b69052e-5213f66b8b9mr181067221cf.86.1784640829940;
        Tue, 21 Jul 2026 06:33:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:33:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:10 +0200
Subject: [PATCH v23 05/14] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-5-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1807;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8sCOVL39BX2AFiqeGpscXeG1puX7rtAOjEFEhJGJOUQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3UiUo/1PbzcbkzvcpLMhdrqFFhhRAk9oqyXd
 8omL3yK9CyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91IgAKCRAFnS7L/zaE
 w8CmD/4kXWevD3HFNqXcnVs7UHVfZ1TCQg5k/DCcmcjzG6RzyH1w4f+ztuqFmtixd1OZiWYssEq
 P3qeTKJ8jkNWr/HjMDlj9uj71EnVKCGuXloOrpoaGwMDWos2zcG5XuW1+felKeiLKWtBBGWcHFK
 guJNm/dcwKUGKG/3UfNYaxVOvztIUiN2QeWTAX861SRbQQOGnOGrspEeCYxhuOOMwAAQDkllrI6
 +DXlpNaA4sIIbjfDkwCEeazVjOTC3LyDuPVIoVdxLvZb8eBlEDT+/yrm46Jzz2S401l5D4HcM9v
 Rweo3bWIltJVesr+9AuaDQQP3YgG8rBFXLx3wORnmCGJDbFN/nhx1vmaiiOnkjxy663/3VSZWiB
 zPaG+lP3p20tM0/TumWw4FRfPNAAzZ5dBwXOPWOHerh1HHuFI4tQ+9mU1rKqR+jgkpy1PVMGRtb
 iKUwiS2CJzVzEXgVZ+W/tmtEuwwO5xQEUy/q63kwkQNPGoG1gpplMceb8i/quCzJvisyEJ/9ctC
 u+ARBbfmzLj7wDZc+eY8Huq6QV6wOci0I5i7Xd/e0utYBtjxZmXxqmoXsh6prinMWTQl3p3KQwq
 kssm/iI/z7CKeQYWpB23NXUN1z4f+FKA31E3taLQF0+rxW5ogTUdi05ndIVjrtDy5p8YVxQU5YC
 a1+5TmH8EWdF03g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: LUcosUWGZbwcEjAOJwmmLQCSvi5AmLkl
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f753f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX8dxYVGjCrIHL
 WhCD3aPD1VuaJLPhmWLM5uFjG/vQs+5FJDZQS/W9Jw3Ozt/321ik5+izSXAsP2lbGyLN9LgB6VX
 qSZ01Wj3hZhjRL2us5Gn9VivTSOPZYs=
X-Proofpoint-GUID: LUcosUWGZbwcEjAOJwmmLQCSvi5AmLkl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX9Z6wZRm2p+kP
 9faWNYu1TsAuITObZSiyZGgsDQD0pYr2i3/Q25qTl6QKwUyzqcwRAAIL4avgTi+qPbNdUDvu4VY
 DrKWCzY0x1V6ctDyiucpx3Iwk+Zrk04OSmAcweY21H+HagTdn1exS/CN5ThzlPoFOeWBH7butCQ
 s3nLvaArt4lZUWU63QySm5UpaMxQejq4OaR5FuHJOqWq5NTp90uhyAV/tev4gniq7mUGesU99Gs
 D69hAxeduK2elTVftq7VLQrj5dam/v4nfpI9cazaIuKr8pwAtRAeJJExt+Ub7LaHzez9vfaMiU4
 mqU9GUX+UZNONwMGGZ90EdPwyRFk8HV/TVl6LHHA8/yLisuWedP1Se+62nVjW4ocGgCpSe6vWoq
 YxDwRy/pnDS037n/Oa4k2HP5N7d8yovqytBuzf5FTR6EDL63EWICE8Li/xGUWpZpbHhN29LxrlK
 p0io3Yu/f44fAHMmLaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210144

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the device match data with a flag indicating whether the IP
supports the BAM lock/unlock feature. Set it to true on BAM IP versions
1.4.0 and above.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 8ce0fe085c5fea6cc614edd692b5cfd264b94d5a..f3e713a5259c2c7c24cfdcec094814eb1202971a 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -115,6 +115,7 @@ struct reg_offset_data {
 
 struct bam_device_data {
 	const struct reg_offset_data *reg_info;
+	bool pipe_lock_supported;
 };
 
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
@@ -181,6 +182,7 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 
 static const struct bam_device_data bam_v1_4_data = {
 	.reg_info = bam_v1_4_reg_info,
+	.pipe_lock_supported = true,
 };
 
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
@@ -214,6 +216,7 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 
 static const struct bam_device_data bam_v1_7_data = {
 	.reg_info = bam_v1_7_reg_info,
+	.pipe_lock_supported = true,
 };
 
 static const struct reg_offset_data bam_v2_0_reg_info[] = {
@@ -247,6 +250,7 @@ static const struct reg_offset_data bam_v2_0_reg_info[] = {
 
 static const struct bam_device_data bam_v2_0_data = {
 	.reg_info = bam_v2_0_reg_info,
+	.pipe_lock_supported = true,
 };
 
 /* BAM CTRL */

-- 
2.47.3

