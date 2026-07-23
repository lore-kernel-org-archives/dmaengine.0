Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B0A4766A9
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826618; cv=none; b=gubOQErwvdsacnwVmuQsErpB8kL+jw1GWI8oxUDAf2i9r35hia/c5g9wTmPjYS8RUpOYzOGwl8ty/TsLccy7O/9V0mihDFLNnoCBGvdV43HmQmtNrNKY6h2Z7LygLWj3Q5oVAbrGwgk6pCbfkL4Qv+Q7Zb6+ACXFUWWsAAvw7Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826618; c=relaxed/simple;
	bh=zHIuoWgA0JNzB45qmsTvX1DiRfFAkkbG2L0hbAcWpaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DRq7RxcO4vZC6BBcYZFOvhFLYeWOdOm1HQlhU0HYARo0AYXdZSaAuB/EujSQpv250zgDchhaqjylat27+xCFu46Hfks7L/Z1zRXzPBxBpeESELuKHVSgQfhIkJllspbiIOOjPsDduMhJ7Rq8CLxXG2dJcHg3yigpCC27AoQIkHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jbWY6Ab0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BWiZ3XeR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jbWY6Ab0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BWiZ3XeR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NF9WGc162561
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=; b=jbWY6Ab0LtE02a9k
	nzQjefrQYoPi8EB+5t07GosHgPVpg+XeBafY6+2+mZznmiqxx77/3VpDk/4N0Gw3
	KqzBDj8cflM9Yt9uDgGmcUUhjLvlpxYLNK/iDRKtLt4nFoRSFVnDtnxqKn5LVDgu
	6ua/VJNZtouLLm/2zeWe+TzSIKiYFVBRtijqrUrmaCimoC8cZnyKfrUYyTxhovwJ
	wZxp5RuR17twKADvSgyL4qacYziebU7z4tiUPyvHlUMFOL1+W9ocBgwYz+hHh8zN
	LM69bKCDC8R6cDAQy0PiGhnNar7I2bwydhxkit225EcxIwIMGUOC/4I4bUQ81efS
	i8KunQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fknbmgnb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:09:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-526da7e3c9dso17054741cf.1
        for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 10:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826588; x=1785431388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=BWiZ3XeRRCyeKk5LBxYCMXInuOv7cPouL0zERorKnrvekxRyNAM/Suq6ou9ctXRYJ9
         /OLgOmOaoNKmt2Bb7v3kC2dhrhTdmAgtq5pI4cj2g0zxOhXp2wjIR1G6Yhwi3r4vdGIB
         iXfC9tfz7VE/0FzWVNEJs5aF817buiC0lUAe2hc5eY5kf6nFCFbxp+9OtJvCiF3KEtBg
         HTnlgiUr+gJiHVtudrdvCQLhC+EQDbjs6UK46xQNCwaqTbGHKXlcS4rm/GLnXntwt0rS
         E9pg8QA23hDV5HWYkl+qukaxlrd6AxWovby/MtAjWNZQn9v+yidLZiqb/bL1HyopWZdY
         CUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826588; x=1785431388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=IbVkBexwJlnNUX1K9jIyDMxrQfuOIWRqGBPNNc94wEtbJFH9D+8P3u38sXG2awUFfr
         I1RQaqtmxQzyqRZSuqk8+NxGpOxI8XTbNrdsGcczIsRob18PjV8sQuvTGDR+KzRE5ICD
         LWTDZthplyWfW7l9hLLP7hQeoYYGL5iQ/LQVOIls3oe/lNnMVPDKvreI+COjQOfQUDBH
         DaMGadBkqAjPMG8hGTLpNv8PAJ4uLOXCKHggBa7iW47/JMdiC8rEwPD7ac0XOEnETW9+
         hH9ruEYFmdHGrBxeGL0z6MwxJw04UrXExQgDdqNqcAdooxIl5wCnqd3ZVuAQjwNXIR/i
         jfAg==
X-Gm-Message-State: AOJu0Yz+/z3SAp4APm+hv0dyFhFcmmThsdlbmFU7oRGsmd7IczKjUOp1
	MhucZZqkPVgEjZzhUWzAPArx9iqIAMTtT+FTopLijhVDTa4GUTD96QvgE/Y8iHBgkejdq5QVNKP
	j3EqQD7BqHHnAVXnpSQAJ+W/oGoy1ZFAlQA35jSyx+vRyRUoPopW2vR2IaYviyzs=
X-Gm-Gg: AR+sD138/UGTfcJQsC2OGYgYcCi3oQHf65eI26SbygNpDvZJ5wI8UipGMZ23lnxG07F
	kAlqXCH2Wvc2ArYuSmYTzYaHWFGleSO11Q/RbuqGqVobeiSk9tRBnJOYa/HWWZfnZEd0lSC/E8I
	L/HOLhFPddHYGUsMkyv10RZ+oPV4bz8SGDz3j1zjHXC6wyRsCttRpEO7/G6BJZZhjLOVetWS9BV
	nFUU/A0QRR4sCd+bYbdc7CpMHWU66C6RcZAPwFmao3QzEgTdyw7zIKQlefkl+UrMPBBnqYWCpIe
	JGoz34eMp5GAYGDSLyDZ5wYIL3elLL1WmA+z4I+mBGAKTxHgiY0jE6eHiHbwd+Mvyx26geb+rgY
	rEubdZyBWB0sfjFNMytdPaFFXbNGc
X-Received: by 2002:ac8:59c5:0:b0:51b:ff45:bc82 with SMTP id d75a77b69052e-5283def047fmr38941701cf.54.1784826588196;
        Thu, 23 Jul 2026 10:09:48 -0700 (PDT)
X-Received: by 2002:ac8:59c5:0:b0:51b:ff45:bc82 with SMTP id d75a77b69052e-5283def047fmr38941091cf.54.1784826587612;
        Thu, 23 Jul 2026 10:09:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:09:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:11 +0200
Subject: [PATCH v24 05/14] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-5-4f87bb4d9938@oss.qualcomm.com>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkrDbgCD7phY3Uv4PgeKzNuMgjyq16Ha9+jE1
 ekzU9LOXVGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKwwAKCRAFnS7L/zaE
 w+rHD/9yY8Gd9PEPIebmnnDAMTNO7Rfr0HVIH1hqo3NFdpV50y9bf0qKCMa2PDllweAqWysUlsY
 OM1NNzPNAWSGRNk1un67WeGOdEujiXoEF0mHT5EEvurrs27xlPeK8gO/ycdhD1ITNgYTjcn5wFE
 m28QKupJzTy0gooQsgasLhB08H7e3qiNxMI3TIKAMHSjKe1HoVUUaGDASaeMI+8+KO4zYWwCEk8
 7AalLfGQQG6V5RFZwCRBz9Czy73VQUFYOBljAzaxbEQSESjWcbOS6nMRTWOjAivZ92TBD945u72
 OeRV3Iajr1NzY/pfxj2THL2OSgDY/vLWmHjCNhobH7BB1c4/L6JInUkkPYqrrtYUuH0LMp4dh9A
 rJZyzrldxi7rb0gMcl1JPDwV8u4UXL8m7HPWtmxhL0k7XdFvWAwnu78a/3Iv5Zgy2/wM9MYqXJA
 T/v6H2qhj27EiUL0+t/f8mY4/XoGRbhHK7jxHl0lcpwRguq05Mz4d7QM8KsJL3aL0lO8YFW/kmV
 wapRqisIrziTVCTXzGNgP4LZbJS/fF4ak5vMsydCSF8pSYZJU10KhsvzjmIvyiQ49duNj2dyOh/
 gplxjZCjqgVJI4OUoG2ZXWShjuh6hU1bF5fMds1QxiQyKf69k3ggq/APrjwnAZlZ8VOfw28zdWt
 wYwCJoiKU6E2AAg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=e742j6p/ c=1 sm=1 tr=0 ts=6a624adc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uku9tfdJRLefXavIxbn0w9Y1ceRdGmcJ
X-Proofpoint-GUID: uku9tfdJRLefXavIxbn0w9Y1ceRdGmcJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX0SMN4gInOl9b
 0C+7n2DZ7Q+RODVcz5cow/3wTgIUq7mijkD52wr7NETS+lLaEC0NoWl6LgOkv4B5Y8pUAxb7yRe
 FfgWgLYtqHE6QT1WHmPjVSKh11jsT9A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX4KapT48dnUZR
 mvoGyU8o1SAeevGsYAUV225NBgeMsQiDv3OSUv+xDTZxHvmOWqJmKeRxGtHae1eFBkyyFdG5kz2
 iNBDvJ84MaKjc+O2Vpp0R6ZuS+c1J9iK8myZVpeSxzvhHfSkIVMTJ59WIQTky2zwUzAfl8BUZyr
 1gD613Bu6zQ75CwIBwU+hhtXuroegoxKPQ40h/0fQNbwuXZi5r/hqCEq5EGU+wLPWhBbprXVIul
 0DECvQSPvMWBkh1fzsApoKDn0xydrzlTnVTXDkBjg0q06WYUdrsKaV/cWxwODTjAJIelDzr5mjT
 N81i9XngkKIi+cuNGKIiy13RPnsO3uzKjOMw8di5LXyK60z9fWLn5aPf/hLqdE5b2u69AnA+RPe
 WqjGIH7BkgL2T5V1WVukIE21g+WQ93+ttoV1O9os5o7O3+DCttoZTuq7JnshcpXXvdm4/WNrOV4
 HORb+pmprvENRQqSmZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230167

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

