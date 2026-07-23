Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5F347668A
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826621; cv=none; b=FbioEXAn5evxIpVGTZHB2GJ4rY6XHYjho+xdN4uuUIfafA2k68tK4EUbxL23Xtr3Eb8PqRkzlhDIUtMBPb6pQ5bvazehyvGrGSpc8cT7eZHSdFBMcG32C2zXn7TzBrOM25KOXu6Xnx/hhtXNviUoXB1rBrfnjdUNG+osW/X+46o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826621; c=relaxed/simple;
	bh=czoxItsxxVvFFRsK/bUJo7zI9PxP/5bmJEdhhzZ9wNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H8J5OiEyrD3HG3w3Yuppw2gRMj+YTJelPGLrq2s8OdpITHjRtSMHCxQFVwWwPGBpZrFEdrBSBCBswrlbXi9ms3iVsJrGMUDhChUSOGKE6PBz0auee2CU6ny0mzsFFWlFfTWbTHxLIRY3grsjd7OeqQ8ArXG2kXQ8J2lc5bpDZw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ebnZ8Og1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ua1JDbLE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ebnZ8Og1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ua1JDbLE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvp9Z011887
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=; b=ebnZ8Og19oSO0yyt
	MeE5Au0Qr0sgRzlfgMFfGQqrF5t3SnmYZI9HSQsDYizxdOH9jKjF5YevQGCvv/EG
	jvdNX8x9iq+NYgtmbPnQI18alH8XkJReeZL84g6cAeZYm8KybmBzAtv1CGvgl5yW
	yjASBY50WwdSdNeoJGeCQe4UKTJjkL0xdVIKYlmSy45O1sVdx6PptI3ZI8HQjVdS
	v2nx9hkLp6myeS6nF7GdFjVwBaSNFT/qrXFXckhqkiLHqyKpHMvpDCLHvKxYkFgw
	Z4wvzTB93n0HL3GF9DgqR+tnbIdr4JFBTNtYreHYSxEictWXNgxrOE07iMKaLwbD
	nfTRBw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkayhbcuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:10:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d30035dso13737021cf.2
        for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 10:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826604; x=1785431404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=Ua1JDbLE7d95U8zgWXZ7znMIQC15i0ECmpWfmgxXyYk3AYk/3J6ZJGNupnIQA7plGL
         OwHrZPtJs7Y+RJ7AUQLCKLezv38nn0kredXTkoOimY+zvzwvP0Gn/3JN/QaeHnJ2g5QW
         9uq0SFhfeFdA4nby5R8sNSU0Sof8VD9vwHrI80tbxWuBxhSR+VF2RgBV1wEwtpxvQv+0
         cJLLgEc4KsXIUSdMmVRGhTNcqDNBtIkEKSbbUsCUCwCPag0asjUzAR24woan30RpGo4o
         aBpsfBXvcnc0P9B65MT8IAT4qPg6GJL4bwgUSA+0G2i426jmmvh/SE3b4Rk0J7wmYPmv
         sG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826604; x=1785431404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=LrVffSIrqoSaZFpD7B1TIkALB3q6VQZbzBuZ4d7xW3n80yXb+QM2Swm5Wit+uDFJoH
         nLuKt8SXNCpKiOMyhTOpRAi4fhaoS+pjUCwX/kcjPN8JS0bW7xHdJzHhLYUQhJD2oREr
         /joZZQr6W37M1fZCuV12d7sarfGxG6UxC0LtNFmxlO3DF39Z279T5HvSFft8atJIBVsg
         p4v8yX5FaGAGCmFBinxrmYCZ0/dwT6pryqDyneyIOM0HAB0uYpgNdRY+pkfTw/g39KsE
         xJfkPGzuzAaiKtVpJT0O3t2sR6idc0k0crg6BuMA0rcdkUft3/Xj5TKD/dBVUADt4IJl
         adlw==
X-Gm-Message-State: AOJu0YwcCi5U6vUabO4Ljd0oPG/2R+gms95Da1XgsKdizAsbfmqWRYh9
	qZ6YGxRZyRiPXrMhG0uMvAOHeN6nIWqDKP+1yd3YIS16RMZ2IThhVaxjeaF+Oalfa58Su5r7Gw/
	5RnZnwMlMey92+q8oHNFJinNLVGnwE3tPXJ2IBg1Tklh+GftdjcF0h7J4UfaMsfo=
X-Gm-Gg: AR+sD135yhtrkgoPdW0ZoPQXrtOt3VoU+35OuuS959eTKid0hMZqEIlkJxTl1tc7DZm
	oGb2AbDzWcmdoyFJlNUp7Bv59is9Cz6J8igdpqy7GmGu4Z86Nykdw1IMoUYsF9SOom61WaPV9PA
	s5iJmlMb0TJylJiM3tKmQsjdjomS7kC1FwevJzYxr9PQVqJipos+oC7cY9s8rhtNK9VXGHbLDzA
	V/Nb0Hb61dLqEhVMuuqBt2Wk0AaWb0L8EsB3nDuzl8x415v0myhczx9yTJjKhgfclbhUehF7BoQ
	/JOGDzk8QrxofHGfzW198sG+UxF6/brZlCXgb2LgDm2ndLe6QXZzQpu5q2y5jGBH0I63WYZchD5
	6LKjotmWSAr8wgssxiW6IaHtZhRdy
X-Received: by 2002:a05:622a:5cc:b0:51b:f563:f613 with SMTP id d75a77b69052e-5283de11072mr36590731cf.35.1784826604291;
        Thu, 23 Jul 2026 10:10:04 -0700 (PDT)
X-Received: by 2002:a05:622a:5cc:b0:51b:f563:f613 with SMTP id d75a77b69052e-5283de11072mr36590161cf.35.1784826603701;
        Thu, 23 Jul 2026 10:10:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:10:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:17 +0200
Subject: [PATCH v24 11/14] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-11-4f87bb4d9938@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2502;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9GKLcUmlCf8HlWjhhByBBy4VvPdK7WbPpBpBdYahW+0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkrJbewWNT9pp3Iuj5o3JRrVPX68BimOcebxp
 b1lNT8J6w+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKyQAKCRAFnS7L/zaE
 w0keEACQof/cuLvUHKye7tcsrRsQkf3ZRamIThHi+aI6BsMNPxt/AiopzRmZz4ndWpJ+USLZinb
 nDdpcY0tY10kEpyLtN9W5Mnf31qIJFShbhOg7tOrPf5Oy0q5RmoPs3C6oKLCENbLIDOFUIFcnly
 NAeDO3wOzN8MlHHYcf4P6fNgV4JyeUTeaK2ZsFeqX0CFVhQ+K9QlwOQx7qe97dkxM9oPSXRaL3X
 YzwWSqQop2j2ChJbO7+NsaA9KhBPouuHJgLz6l3NmwZxi4qZwvXHIPY4ZU1yb5KkohmMPkbjCHx
 9ajv6adWteDjG9/jLH0Aey6rLjz+Uf3wf0qgOZW7e3WNpbETEopNJ2QS/T0KdQqTyheFU7zrEep
 OlBt3D4vowcpxdZUyqv5vJiqCPdII4+fxArhqEpVRVdlnIn8luBE7WJvaY2LIbgeheC+dTCEI+a
 9NZIAq+6YVGkHPIdA5erDs87gc7cdyOO+X7HOW4hqVyw190PrWP1Xc/K2VfrJv50LyT9c93cIcM
 CVXWZlIPzxHg34xlblv5R2P3sxBtRO3InHnVKa4NSU0rVq373NtJGIaK2v20GG74zPJWLjgWqlm
 4N7P1dv8O/uVfXIavjEX2rHv6KyA7i6qarewiG2bO06plsiDJggI8CzbEGebsBkRdIR9efbLlBD
 GujAj0dlDs/plmA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a624aed cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=rzIBUVXPi645tD0pnwUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5p53Tu_n08ih270eZy0vs0vsopeqkvXz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX4NxYR5wTFfVg
 3OLvFg/LsX/+UWo3kRITZasveFWlXLolPbjShNHmjMsykVd7zrSvCrBgeraorpysQPARJmVMM3O
 RPS6ytGysxGmAOvLhFmxjh+totIrXRCWSF4tpxMpzXq3Kpffq8acG1tzCdReaWYIeC046AmwiAC
 kMHijMFcW6VpfffxQjAxRS7qjusJRZeJciW+k8JPl89gd1bDlJErvM5UrHrpbeCO24TGfEXv4IK
 IuuPoj1/9lECCfdKz05czqY0VCtdAOJY2uCUYuBTSpEL4g9roS29xOtEi/fYbvAuz0QUWUfQmlG
 i+9Zci8zqQ3sN7AEVyzExeBTjzW43USzMAhhPrUqTfMg2wmOcmzR0dawFH9LGNcQzV1A73XabQw
 tgi7nk7BKZ+8NVyY7Y4jsESjE3ZjGt/DJRb8Pf73XS/YNsjjeviXU2x6M6PoefHv8vGLN8k4EtH
 Kx0VUjTGndTRRh/JOVw==
X-Proofpoint-GUID: 5p53Tu_n08ih270eZy0vs0vsopeqkvXz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfXwYwJLMJsVSVC
 B9eIejREUcFWLvVvORmlJgAtQDvnS5PVidGUx04a6yxTFVpx6BxNLD92RLWzh4p4ORs5yAGmmt7
 /bT25M9DJ6KM9zMsVme+aqIGSoCwTUI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230167

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Switch to devm_kmalloc() and devm_dma_alloc_chan() in
devm_qce_dma_request(). This allows us to drop two labels and shrink the
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index d60efb5c26d88f8b0259b1dccc8724d0f75571c6..26347e9fc078adede712722107e74958538accdf 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,49 +12,34 @@
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 
-static void qce_dma_release(void *data)
+static void qce_dma_terminate(void *data)
 {
 	struct qce_dma_data *dma = data;
 
 	dmaengine_terminate_sync(dma->txchan);
 	dmaengine_terminate_sync(dma->rxchan);
-	dma_release_channel(dma->txchan);
-	dma_release_channel(dma->rxchan);
-	kfree(dma->result_buf);
 }
 
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
-	int ret;
 
-	dma->txchan = dma_request_chan(dev, "tx");
+	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
+	if (!dma->result_buf)
+		return -ENOMEM;
+
+	dma->txchan = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
 		return dev_err_probe(dev, PTR_ERR(dma->txchan),
 				     "Failed to get TX DMA channel\n");
 
-	dma->rxchan = dma_request_chan(dev, "rx");
-	if (IS_ERR(dma->rxchan)) {
-		ret = dev_err_probe(dev, PTR_ERR(dma->rxchan),
-				    "Failed to get RX DMA channel\n");
-		goto error_rx;
-	}
-
-	dma->result_buf = kmalloc(QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ,
-				  GFP_KERNEL);
-	if (!dma->result_buf) {
-		ret = -ENOMEM;
-		goto error_nomem;
-	}
-
-	return devm_add_action_or_reset(dev, qce_dma_release, dma);
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
+				     "Failed to get RX DMA channel\n");
 
-error_nomem:
-	dma_release_channel(dma->rxchan);
-error_rx:
-	dma_release_channel(dma->txchan);
-	return ret;
+	return devm_add_action_or_reset(dev, qce_dma_terminate, dma);
 }
 
 struct scatterlist *

-- 
2.47.3

