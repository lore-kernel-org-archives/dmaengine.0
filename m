Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02954766AA
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826620; cv=none; b=J0a9oQ4nlPBn95WRxNTailqR63Dc6ceBqkOa74rNbXdLe8C/lzoR77qpOyHifSKzvA5qPf+3a/vgvcmlC/38Xxj8lvSts2uAb67xSqPO4QzZjTAN7azZ3BksEh4SwzlNJl2afvH+eLDsDUtqdKkyhqnpMiZzjqnlp2eI02lGJfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826620; c=relaxed/simple;
	bh=KeA2nSTNl2mDaJCzIxdtrLUkRk83eDvjYrA1TIhvlbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RtQvg2zrHY8JXf1enOmocT/mQ7IMFILJGGw0I8hrFa4PFF/DrLksQhExcQvzkeYg/vuMPlAuoxKBS6bnU8vaY786Ye5efmIms9BHzTkN3ZsfJdwaN0O5IXuQBFbi3DSCzwyebZSPPHeMVowl8fTOkB2ArBpN+ItxdOahLkLVg0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WInOlkdy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLxBtEw2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WInOlkdy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gLxBtEw2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvUAo3819799
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tWAPezfKekMTeUaXy15klHPr2QCAL4plvMCAq141yTg=; b=WInOlkdyW0bqceuJ
	XP5J+K4waTI2PIMPHCKf6xQGma6zeMfIoQA5N6dRnlpGJcjd6cO1e821jPzmKhrd
	acDTzvEg6dbppefZiCOEl3MGEBS/9TWYEUnnneb/RtSHnoyHKOHZT2Ui2YbQL1qH
	Uj6YP8j7BEutk5SNBJmg2YN2leGIEuJ164IA1nau/BEu+kfeq/kxJVmJYbTAuK37
	F7O+ECK2HxFIfLeJP7qZSd4MyDsoqjDwZw9/8MdT1wxgV26CGW6IzJfwvJHrCs2N
	htKmrc3dCg1MGt7R68FqyuCwwQv/f3cNbh+Sst4Yo7cpQwySmzmp4YwZNzVnol/e
	kcK8Ew==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkafw3he9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:10:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0408254aso12857851cf.0
        for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 10:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826611; x=1785431411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tWAPezfKekMTeUaXy15klHPr2QCAL4plvMCAq141yTg=;
        b=gLxBtEw2qLd8Pq72f+g8JYUG4ci+wb3AIG/fzgP2geRWdrrKrZDIIIGUsG42z6jDQn
         P2VyjNRKpyP1Rchj5pfPqkiCiApDYuag7VVrwQ0H3LohysU/zf+29QiJpJufoczS/0GS
         dQENsyLJkGHkK518Ec1YrauhTUjg5w3vg5Hqe1WGQpPt6rBcnGkdWCiJk4RjBWXTetfz
         0OEsFPfrFy3Mu5oE+Fr1R1qHxsElhQlYD/X8V25zS61OTubvz69Z9yctE2uf+jjbxdUt
         KHecpXcX6nTY7aFEocqb3lgQkf1rgLoIgxveMLHbTzASvfrxt0ytgkXHrn7ZSSjWgYiG
         uhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826611; x=1785431411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWAPezfKekMTeUaXy15klHPr2QCAL4plvMCAq141yTg=;
        b=QKHdDf+JO9zy9lqshJ/c5VyPd1pjErvrcTTMlZdZsJpsEqCHYrZTedv6tEhfdSxuNl
         N4A9E9YyVc+LIhIq7vuHoDwDWRSwacR+9CsWqnyfemHEg0ySTX6JWMrqhOnyLBVedmR9
         sWSdUtK8dRIedySnW3J874uUgh8Yc3m0HXxuobBMPhd9ljd5U528ML4kjXjc4zsQdf70
         K6iBaTOp+MpobyAS15gDtbKY89svQO+YCVVa/oMlU9jOm4hsivpMzxvzHPHJNuUkFP3J
         gkgXvxmNZvv7CsgmIcapkPjhEHYZ7KwsyK7hQsR611j965Tnkdl9Vo5vo9l9o41s2gox
         Gk/A==
X-Gm-Message-State: AOJu0YxvoIOzftHuQYSxhPoP0ryghMVHHY8E3HWGWyxaWmSNoBcELx23
	c+mWGD+l/fHltpSD4zx0UT/DaOl8s6XeHKTRKK/Joy5xfBLidoR7Mmd3oaTbXnoLe72xx6As1iq
	Q7MFPxa3IAnsYmZ6uTynpM6R0Hxs+2942puGRy2Euqrd/0NVuP6lUo0f+/K9aBSY=
X-Gm-Gg: AR+sD11D16q3i4q97ilf4SV9c2OHSNFesVyIeGGjhC6+qkIOCncktSUfm1IitbfShUJ
	T8OlWQpxAiPAdMYRdvZx1HXMJ/YD3LzQPsYPcD2RVsDn7s5ljCUk9yXZI1ZFcucupT/8lzjFqr3
	PPVj0/f7E6JVp+SzZreM+iKZ33/TxpdCE9AN0NIpEDjKVj0/nWv158LPI4sh6/X/4icRqH40egl
	Y6xqX0xv/DUQrAQW8U6M2hqig8ZAgHXyGGNJegcu84An2wK651e/x6O/W3gT0zVI74BGoW0Xt5R
	sZcxeaGjwTE5+wlBLIgq2ShC5rA5XNXvcVAn8a0XfYsyztT7CptjqvvveUYK9unV2qa5Bwgv3HR
	ns7eBCAu8Xg8G1eycpbUJxBUvIIX+
X-Received: by 2002:a05:622a:4d44:b0:528:1bad:a2a4 with SMTP id d75a77b69052e-5283ed28baemr34689601cf.15.1784826611452;
        Thu, 23 Jul 2026 10:10:11 -0700 (PDT)
X-Received: by 2002:a05:622a:4d44:b0:528:1bad:a2a4 with SMTP id d75a77b69052e-5283ed28baemr34689351cf.15.1784826610957;
        Thu, 23 Jul 2026 10:10:10 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:10:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:20 +0200
Subject: [PATCH v24 14/14] crypto: qce - Communicate the base physical
 address to the dmaengine
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-14-4f87bb4d9938@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2903;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KeA2nSTNl2mDaJCzIxdtrLUkRk83eDvjYrA1TIhvlbk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkrKe6UqD+TDnHwjbOTrmC7yHfh6DFtjTuZM2
 qORlKVkrc6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKygAKCRAFnS7L/zaE
 w3soD/9tkyrjFGKxSib9ygzwLxNvhuL6MH/F4spX6VXKXz/JZ1DgRRetA1dhStrhWjwcWHyQbPs
 tG8dPKx+MV8/Wyrz+ELdMYHkGiTLa7zVFbJx4F9uRDQ+o2s6G0JBCYfEMUHfgjiZQ9wuwfRPK4B
 SYj4r2oSVTilPS8LT723DNYTJUi7mN6wQTq6aFt3TwubwU8hb2+jmvhVgZrpQ6Arc14ahAEKHyg
 6CgjZ+Vj1yHCJcJsKEWZyLck0fW+kg76xuz4GmAKHBOQIfNffjjvWITGqXb2amPXayfWrCnQwE9
 wt1/H9sp9Nge/zdE6JgRe8m+cuxxFYDcSw9N+5Q8272vcTo9bP2SbuilMsVrYNwCvtP8AUt4F/1
 TMjlEPkDLCw8clfqx8SH9ZhfdKmZGHzT1r4WRpEoQrdoDV45W3qPLpJIhCUWCtqZo1tqF9Tnrnj
 YRIzwMCK/qUh4xJf1Z44Yc7zcsUppmBlUaVWM9O484FMXD9xeojk+JoTAlTHAJY0DcooY2O/CjE
 6CWKFoDV6R0kK78xhygNqKVYlggk7c/YSlQLQbFZkhIu3ylWETzXMLdZ6APFaP4nqHzsx296H4l
 2VT8T+Whq13rgpAZi5E+7w1zrkQbk8Sx1DoPxHtL4ctvR9a6gY+8inx4kiHahJPtO4IO5Xocdt3
 c8Vaimv34oc6Y3g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=XNkAjwhE c=1 sm=1 tr=0 ts=6a624af4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6g4OycmRf1yXlxMorl0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: YFxIBd35tU7u-gU1O5cF6svWbwoe25vC
X-Proofpoint-GUID: YFxIBd35tU7u-gU1O5cF6svWbwoe25vC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX7PypCIvEYfoY
 vB01BOF5rVhVMtMa0c8BiF7QkgIrPif+J5hkq9aUYpd9HQpnoaL788vGWo6KOH+VMY7KZAlQxb5
 ZINGv1HGMYKWMVuoyadjITy6Sh8aznw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX48TjRQJWaFBV
 OyFIyLARGQCE3eJR+UeZW+W4gJtZbdBAKr3RkosTgqPzKnr85XwLXPpqeEewh46ZjJBmt80YJTJ
 tovPZiQ24Ye5KaBOEvHMQnej1ALo+zlC+Qqkaziido3HNgH7PBOCjBRswNATSTHrgk0DZ1C2mGb
 3Tl2LzKA5Wql3zjwzAfbDdK8bLGYer7pDX38mJ094d8UTeUxwanONpHZ01AJk4djTgrJQJNVhzW
 gkABtzQxGIoD/svG+g6OiM8QDU/8VpEYDfRA9xD2w5qY0LDj/HVARz4pJCrkm5/aCW9UTtDz8kd
 r/UNZQ8kwasJfMge+ow/7DGh3LPuBT9Cw9fzRQpFKBv8AppcJ1dsWmLRIyt9VhCtJd2JXioOQc/
 Ap2bCaSpXReAVXpD+WFVaXE3Le9mkyCFM8a8XJApXtD4Zc+DkBwKvAznJGmGsmKyzhRtvMbKdxh
 e+vpcU2mIKLUHFH1GPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230167

In order to communicate to the BAM DMA engine which address should be
used as a scratchpad for dummy writes related to BAM pipe locking,
fill out the dedicated BAM peripheral config structure and pass it to
the DMA driver using dmaengine_slave_config().

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c |  6 ++++--
 drivers/crypto/qce/dma.c  | 14 ++++++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 4031b4516d6519fc5024bbbcc439500a7b3314b2..50fdc8d808d0fe1d9d430ec601ab2ccf2ddf6e91 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -246,6 +246,9 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	qce->base_phys = res->start;
+	qce->dma_size = resource_size(res);
+
 	ret = devm_qce_dma_request(qce);
 	if (ret)
 		return ret;
@@ -263,10 +266,9 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
-	qce->dma_size = resource_size(res);
 	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
 					 DMA_BIDIRECTIONAL, 0);
-	qce->base_phys = res->start;
+
 	ret = dma_mapping_error(dev, qce->base_dma);
 	if (ret)
 		return ret;
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 88d253d9147cfc9ed275653f7fd248538378194a..ad951a8821a480ebfe4e025eb6a7417f97d7331e 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -11,6 +11,7 @@
 
 #include "core.h"
 #include "dma.h"
+#include "regs-v5.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 #define QCE_BAM_CMD_SGL_SIZE		128
@@ -116,8 +117,17 @@ static void qce_dma_terminate(void *data)
 
 int devm_qce_dma_request(struct qce_device *qce)
 {
+	struct bam_config peripheral_cfg = {
+		.lock_scratchpad_addr = (u32)qce->base_phys + REG_VERSION,
+	};
+	struct dma_slave_config cfg = {
+		.direction = DMA_MEM_TO_DEV,
+		.peripheral_config = &peripheral_cfg,
+		.peripheral_size = sizeof(peripheral_cfg),
+	};
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
+	int ret;
 
 	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
 	if (!dma->result_buf)
@@ -133,6 +143,10 @@ int devm_qce_dma_request(struct qce_device *qce)
 		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
 				     "Failed to get RX DMA channel\n");
 
+	ret = dmaengine_slave_config(dma->rxchan, &cfg);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to configure the RX DMA channel\n");
+
 	dma->bam_txn = devm_kzalloc(dev, sizeof(*dma->bam_txn), GFP_KERNEL);
 	if (!dma->bam_txn)
 		return -ENOMEM;

-- 
2.47.3

