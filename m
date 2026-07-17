Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1513E5574
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 08:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277426; cv=none; b=uC9vMSOlXMf+XiBB7mo2/g58pwMLghMMmJmqGKJK716+m35GBy7lKWOoVWMQQojAvbkfUFQZdvkVy2SoJMV4O+mZzvoluP9n5ZVHAYdcOQth5Ao3+ke2R2SxoueubHXqxvsWcYPgna10rmZo3mbfW6GWcz8Jwd241uu+jq8qUj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277426; c=relaxed/simple;
	bh=zHIuoWgA0JNzB45qmsTvX1DiRfFAkkbG2L0hbAcWpaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lcg/ACDKriwhGIZSxsWZuMFwXERokIUjV0JEVRqe26oG6PFaX944erL2BQKIwLAxPTX5BJ7c6MWbgnPR6Jni0rdBkUjxSwaAa9Yl7HwsXl2etfHPDH67eywH24Z4do2lmbKIdIC4fuDE8gNbapYodKLrGuTqdVCtdrV/a+u44AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9aVLAaj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MYJ7Y0XZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9aVLAaj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MYJ7Y0XZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cINS2098594
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 08:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=; b=j9aVLAajLlQZVooi
	DUGpSa8iC6YOhXTvIPaHqRxhiSMlqRLk0vO/bvmZ/ATTK5jNYPQBH/+QjX7vsVAx
	mIWUip/74VhOVTmxr+ZIi0O4/1yMApOMei7RjjyXyjGskxiSfsDhxwvz1QHUpMwB
	FwULHxHHevdQqnSo2AkQMtX0DmFixGAtuUaMEBBHM61KCiuKXSaUi07/wn/cqhct
	kJXN5ohWNp6q4Wm6NBajFq903x3Vz51q64sDt8z1us0/uFQiqvcel2ZIx0DMZGig
	/PVS4lDRwacAq5fPEHC9fMZEtv7fo9OV5XJouDDd+tX/MqVGm7G5tQONLc47xvSp
	5RqvFw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6ju37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 08:37:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8db414c7so115018121cf.0
        for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 01:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277423; x=1784882223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=MYJ7Y0XZ3LxwtABPVgmzSq1Cf5DnElK0yk+77KW9ZDJEMy2Z5UEW1dygR28rWIve9Y
         9QivCu5FvuvWxBWlT/j1arrC66mvtFlTbreLZJiacYidro0z2PuJqQZbtKq5SexFT8yU
         KdoaunmVn5jmOmM8hZDOeWK9MRFXmrBA9HEW/Rj63Hi2Com420GFEjei7O9xpy43uHQ/
         /XPo02xw5QGpXfkEDyQRSvUXjaf9wB8oZfLnTVWHnOIzVgzqke1AgigDGASw/yzW6zPx
         orvlBI3qkdH/7YV4GbvYQWAZQGuX8Mixd/r/5znZqoMWXnTaCNBL3wQmkMvbGwXDdV5z
         nNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277423; x=1784882223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=Ows3zdQYy2eXXP8NRry/ORlZ6Ap9fVkSPr8ArU6YcKtS98AaqTZm1eR5MkbehJTk1G
         NB8X/njLbqQkbQ/9qNJaNwv6UIO7yolCemtgG0Fqfti6rOeuaP4PfCgdqX/8i+Ia/sgP
         Pr5MJNp1++h2hdjlQEnejltDAnsZYURUl68idLyrpT25lvOI/RexI2yGqsrZMKzPAgyB
         iepgFZ7OTjAJachvHRpN888tYKVvkIu5uq9Cr62r94UahcXOzU95LbB+JNqRu4zIrW8Y
         964EQ430L6ex/KdA2m6+Z1f2jbRTUIIboXVw6bKv4EfA2yxepwrqgln6LNPUGJaOL1qu
         YOBA==
X-Gm-Message-State: AOJu0YzbFIH2wYEx1OeTbhslTFpLLm3HHVpT1wg6fv0J2htaNKWBrRF2
	PF5DLy2Eb/9alFkAg/81/ak1lJZ0GCF18qqhLAckT+NgB08ncYK4h96LUkHAqipF0at6hnJ9/GM
	x+dpl6/79oBy7FkuVSZ4DoyZRyosXwm3j2Kmyi6+PMQbNFE1QWDg+tXETBG3VIKc=
X-Gm-Gg: AfdE7cmIx1Xkxd2H2h6U07zON5IkUtUGmtcFNHTdH8hYJ0wKy0eP8DsI3CdoDIMgFrI
	cFufoMEJmUfgGH0Xs1VoeaPGAOHHufSKrX47X1ZOAuVj9B/dTVqed8CsproXig3uRJ84YUDWLsT
	9Zbtvpx+TZEPnRtbZgZShyXYyhQRA3at5+67dYjRxF6hFBBJyhqIKKkbIbRZ5HYOrq/4XuMaMLv
	HV3KgnSyApg7SEJDTL7yUPQbxdOPIIqmjK0fmfoBhWZ5/JPYTe5z+9ZgCnX1psUK42SdgH+iAMT
	aDCQN7VCcif4nY+reNW2eJtx912FgiW9+DLSCsY8D04SwhEvelEUr7T1jNlTiW8bZDhmEPmLmP0
	FUzLwTJNK8aHFclQrjN7kLLyq6FgKyA==
X-Received: by 2002:a05:622a:4d:b0:51c:cf4:5f94 with SMTP id d75a77b69052e-5213cecc4aamr13176591cf.21.1784277422777;
        Fri, 17 Jul 2026 01:37:02 -0700 (PDT)
X-Received: by 2002:a05:622a:4d:b0:51c:cf4:5f94 with SMTP id d75a77b69052e-5213cecc4aamr13176301cf.21.1784277422414;
        Fri, 17 Jul 2026 01:37:02 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:37:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:31 +0200
Subject: [PATCH v22 05/14] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-5-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemZiYXlJjtNLGq4+ySy7ccYjPOIKJ19llAso
 ExQ+mfEbAWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnpmQAKCRAFnS7L/zaE
 w//ZD/9e0V58j83h1ywDxEDPaPrjjZLuq2/4RWGO5kSTfH/Ne1B6nPViBLwOsmv/7XzR5dRGZWp
 MdI3uNtgro1ZAris68UkveWoptrSrpHVujRS4utFrk/+DSQAb6yUreIicW1lCiVvjScL0ihN5qn
 eeWX0MyNIgu/vr1eTqbBqaf2g9BQt0RsbbEHMMloPiPTDq1hnLvsFEPv0IaA48utNMXgWVPaeYG
 SRfUx9Y9FYDcPb4iiZJDBwIdm3MPB/x8gCG2PCg9oteUKIAV+tSG0ZOGvvBvfdJQPPnrbjTKaJU
 6/mApnI3INj3DvBk1p5s6kH1Bur2OrrVLUxc5d1siA3idZ+llzlLbmxQzdccMQyVTb0ompSf6sO
 gZtWu8zBS89TtILxZ9LK88ZKhljzJg0fyFbreR+pcDxZwOE/h/imtbh+tUTYCiNiGYS9rRyVCWq
 C6W4cFq6rAH1rBOm0vumliGPYPbhBRXWraEcE0KdwXRls3g1dR75fE4FFqA/e+gXVgT/rhkCspy
 eOckOcmLQKfsxu/uZCiOViPLvTJmSp4UgSpcrmwOnLjzC0jJfva1shM1WSt5fZckAn2BP+YzOhV
 ksy8IwZrKA+DWAsnZ5VFhE4vD4UQBF9fgXlJgLXIEtZ3xkiJhslevoHB1TFfe+dlAKlXVuvQTsy
 7iHJn6tRBfep1Xg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX0yLCgLCGfL53
 p49d7qi1IAd5+TkKqppKxPSOSUhr8tjmmUXqQmJBRCScO49RwdwjkBrShWoxX0YJAmA3r0mYZS0
 XmKVcDO7egQcvF5NZQwZYvTY5+0ZAAQ4KYnBqPAAm3iZRd3r6+abFRuxyfZVNHvYbCHNPEMT286
 f7h31oZLWZEfjbn/GXb6yGC/2aT4HvhsdCrQHYPARYzi36jDR/LcJNM+jHywokxwF5yzcF/M6/B
 RJAKdWAGQMiM6EBaPmJoX/gOdz8she0jzBFvRUkca2VSrCBopY10p6TBwVlZ9041+8ws3N6U11r
 qTE5pmn8ZuK9k9dOnhLu5VkrwAqXYr2GFzOeB5sj+AQtSlXYzgNaOy8BcH274vHX3QiqOPMmLcR
 LRSMmXzVXd+Q3DVuRGx/m8nNm/zd7TJU5m7AgUQZwBtiCC9BadBfImSKpCQ95B4TNdWix+CiFfO
 DPMNBxlnchob4wUo9jQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfXyjpwpUgb3fhM
 UM76POtvdPFLgT7TebhK6uKEy189GHzqTZIslFtAHs+6U0X0Whxsun4mPW1ROKbL3vHq7XHrSVZ
 TlQMO9fLwN0BuHgDtUaRh6K74nvw7is=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59e9af cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2B2_kRKcz1gzuFGISABaEV6OPss1w53b
X-Proofpoint-ORIG-GUID: 2B2_kRKcz1gzuFGISABaEV6OPss1w53b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170084

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

