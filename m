Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF639375ABD
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640852; cv=none; b=g7RY8gjGcOpA16BSVZluQabIykHGNQwu5e0IhnHTcsTcXlJeWpPMbHV+MosBlu3JrKKe4V4U+n7Rs/7l9Qy+DaDxf0IqF4j5edzmkGjWseAIXT20FScsDjCE9IuuSYPQ/4odeRaMAW67JZPqu+Uw+fwde/nEvPS+TSsDTxIVCWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640852; c=relaxed/simple;
	bh=czoxItsxxVvFFRsK/bUJo7zI9PxP/5bmJEdhhzZ9wNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y7XJDFkJKVTBNMtZzZ/gruMtU+RKw56SLXVuanngnysaGsBKSDixEqx5zM0numNXWonFIElClB02rUsCeZaeZDiHA07Pxk7UrQvLKw3+YZ2QW5t/uYppjdRY8EZg4uvvLjDwuTEoJFEX0uEq7sGKFX9g4SDJa5rmgaeOF/5Yg/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNrzb8VO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hbZZOoMx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNrzb8VO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hbZZOoMx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDLu421890679
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=; b=bNrzb8VOaSdLwG18
	Uf7Lr3urSx+Hph/rhJmXjex0QXi6DfJaoGa5KQJh2A72Kij0zcjOBZIVtmWH6Z1p
	yoqulvx4wCdFe5IG0Y4uENqW0taTKw5YfFFXguylQCPHN708yKvU2QqXBY3c6f03
	CxwKkZ68NB4pEGbEz5M+kIApwc8c14aaNxkuSOH4zgEzfI9lU0InjaalPQGRxE5B
	qCkXtVD7mrO8nRz3oDd/zoHmZMBeWhPQtKfusH3vmKqEghJUwCCSf3y729ycWIwm
	w8wANwDCn4KcrFn4R32REJyugaV2i8Yi7y1fced8GSTkudt4589rmecoX2nQv0FW
	msl9HQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bs83xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:34:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f39a46efd9so92826736d6.1
        for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 06:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640849; x=1785245649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=hbZZOoMx5AcIx17LVOyOw937YbOWpbFdSNZzTL68WxFGLJo8k7gbtT8iFCBZHxhBDz
         Y6J3jb+PDTZ/K9TYAxxbabF/kl0tyuQweEcT286Pr4wmPdKdVjL8pxw5qDYNRYT8Ckir
         /1RQApvCZNWkGUSv0uNdBy+iS3IHM9PCQoNGEpcniu9jrv6M15zwuIZcJ9fokINvDbOh
         34BeqqudR9g+S7odZ8PSiP1oHGu+uqmqg65mRs0ZgP9Y6mRvJ4oHzcKJtu7938jzhq7X
         /274nYq2+oDqrK9liiHy9xnomUwDfYbnAXLgXTDFxtMqVnCc784v/bkea5cA76OyO36V
         oQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640849; x=1785245649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=qW5qpEk+MQDcnvEssKw1NOIqJz8VdS4Qr4GZb425vcYXK+eC98ZAX+wpyAqJKJAARX
         irMUvHk5fyh9Pr4SmmuicmiWk8Irhx4YmnhyVhdDmF91lrUyCdqYPYIK7PhQFkGHubT6
         mZgKfT8paS00Mkr3aUMRlgLp5qIGNX/idTqhugTPW/4/eNdbqRgPPURirZ7LSoH9/Ysg
         e1a1QdopOz2CRownaZlrsrp/Xa6JbxlL8WEjlauR3aE46fv+7YarsZg3XnmrbBeN27ng
         EtKjQC2fS8e8fI4yzzHOtxCjGbOGyALbWK8J8I6XlGNFiYbzWuz1NPRa3CMTN4QgS0S9
         KogQ==
X-Gm-Message-State: AOJu0YzfA8mXCpy7calDqdWXUzbYLE0ww5o0MK5Sc8fGmxoaRzD6ZNbQ
	LhObU15nnFBjxzEVVotkj2LuMC379cVmUZrimMpNwmD8uMC5/ZHGSqW0yYNSadmkA4iL1IHNhdR
	felCFY38/qVHNQUQCSKsqpe5bKFHbpak0VNLeNLLHFcaeeyD8Wp2rVQx+UIuYuFI=
X-Gm-Gg: AfdE7ckZwRIKk/Q6qqgYgqvK7+C1UZ+ZZpiOIm3P5gdUW4sgyQ4X9Mm7u8pHo0vg3n6
	qwHyOQdZAbuKhuaGgvz954ZCMGBub7/3L7R7zKOioSYJK+TwDdeweqn1rd+teJiilv2bZaPDaZJ
	cqbOUnbhAEq6D14PK8q8czqp1jWNjAv6f83SgiisaOs+aDbuhHzGvLva2XH9IN+uJpEGLh3dYbj
	yWID2uY+WYe1205Q1KYX6x1yQSv1TOggRxKeVkWb7jUS+jhQyNJznRX9HiH+TVsb4oij/txuKKV
	B9mYO6a6Rx0b4/j0wkOb04gwG5x0vawwtTOW0NbJEf6iK9+UYspOfFz2B5EWM6n84ub55g+LKaF
	ep40TWKqyxsCxTArUysETpEANcmOmKw==
X-Received: by 2002:a05:622a:180a:b0:517:9407:5c38 with SMTP id d75a77b69052e-51fc12933a8mr214249141cf.24.1784640849001;
        Tue, 21 Jul 2026 06:34:09 -0700 (PDT)
X-Received: by 2002:a05:622a:180a:b0:517:9407:5c38 with SMTP id d75a77b69052e-51fc12933a8mr214248451cf.24.1784640848419;
        Tue, 21 Jul 2026 06:34:08 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:34:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:16 +0200
Subject: [PATCH v23 11/14] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-11-1be02deffda9@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2502;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9GKLcUmlCf8HlWjhhByBBy4VvPdK7WbPpBpBdYahW+0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3UnilkLGADgQanf5CoLM+EtXAFOMj6jWwzBH
 LQYyN3el+mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91JwAKCRAFnS7L/zaE
 w67WD/9qMG27fKE1FBdPDfxrHY4ToxuSnX05+cNKbh2lS3GHPkXwmoXy7ylnG5HIMwEtB0/Gtqg
 NME69dDUowuLy5BEd1BbM74oJabRrIhpigkKamMwJC1qpHRaXPMPP54qpbbPNEgt5ZnvY8kG2OX
 MPakkw29VOOvG69FYZqXeHoVnFWoD4MXDCea5HybyWeIhaCQ/J4M4NdQ7Bhwu4kTxTEoLSer4/x
 jjH5mJSW0ESaWTLRFS5KWlnliH5ITFaMbzglzYVZqr6SFZfDawRH5gv5aya7Zu9LPbsm/X0EVWG
 c3Rd9sOkyWu0Wwgq/3IEZ+EVhHPfjPr+VLfrB537yTn6QmQC3z1R4E3q/lI/8iLEEjcFOynG4jF
 er+yArLEIc9JaoOaKYNF4h89OjDic6RX79e6Mp5IvM2wrrnPuCOFLTxEgsKeXo6aWALioo4liI6
 NxUBn7jB9D0/nOHtJluKrmf46rrlt+6d66aw3Tc5s3tsYQ8GLZ74boBGj5pOxPZC4GYydmPgcPr
 TH0w3QSVihaVR1fFs7pjsah4mUngg3sxe+DpafjeVRujWB+TNKTbOOETQwdOr5EYXE85mKgeFCo
 idTcZogpmlSa5p+f1ILe7Pgl1SVHCUpoJcGXuZ5tofk9xtX8Y7hpwCAnqE1YhWw2m33EtWYKP2w
 6QO9I3w5a95ZndQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: sdv9yFn214Z2Fzxva7jTJTsDrPDlQa8b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX8WcbQjHRlefs
 V3b7ml9DW8Hy0+LwhrEWqyX312HUcbFWMhagwPREEBIjMUOjfM71S1br6P3I9DcN5c9/5Yl7zot
 KHjUu0h5OzYZS+P5m06+fW823PkXlX60CaeQMbmKHWdKTTPL3NKU6SM+4mCGuxBxYkatg2KCB4G
 mJtLWh2u19HzXyOarZB/SAhOCR4evJWOBqryB56d7nc70IZ9NZBF0oUoyoEtmRSSkaAhiPaDSxe
 qhvjno89ZSmLASfYTjUSzvd5xqezMMWDK4E4urHuO6G9KuLWn/0aw4YbZirK7eiZKkxFzwlwtm8
 GFaAw9V93vUOGtRO1OWx41ij1fI06WHXtc/vz25wPVRc49g36p2ur1UulI0VuNi8ujoexTObTEM
 ftDjkbYsCtH4chyB9c4UjEtYc8LP9Gi69T3MMAJK+sN4ZkWFySavqjnVg24XNs1WFzg6ducHQOo
 2P+XBKVDydb6oBHAqdw==
X-Proofpoint-GUID: sdv9yFn214Z2Fzxva7jTJTsDrPDlQa8b
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfXyJF+r0lF4pRQ
 cNOI7HTYjDOJrV2cx5300K8KxQYtPLsfoK2SyPJyMOAaW4rBG9qBy+reoAMlm9y7xmgaF+GF9tB
 2zol0lUEHn0rFXMA9Q0HzWsOFvnUz6Q=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5f7551 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=rzIBUVXPi645tD0pnwUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210144

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

