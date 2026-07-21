Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB329376BD6
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640856; cv=none; b=BVGaIbXYOMBBZYS1DCEZrF2HPMrZE6FPpoUKhJPcxksfO8y/6Py2LbZU+onvluV2QhXZ8Gfs+ldND1R8N21Ax/jXwgWuqtn7FR6Vqn2dAXT0s82RE/PlBmHIgrJ1O4fXvlf0V0WfVIwqNaWBQp7IzaEc5e/+qaufeHzy+yWqDhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640856; c=relaxed/simple;
	bh=I6qozPBGCCC+qW2tSIhDtPr1pqACnLdSRJYO6Q/jVhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ELCEmP3bUaR2su8+VBJnCJ6dthI3c+y5131TRApzO5AefJDvKQ4kksxhjtB8hO0YsmFQAHHlLKvkK6x10piKThkvsldwDjnRstLvweJUpMh4eWvHEFTr+gnvTgacP4zQnMIEoBZneYU54Y1nmBlc33T5PoiyLz1uglpU936Enzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jPc/FU+0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QjAQ4hVg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jPc/FU+0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QjAQ4hVg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMSpO1864681
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=; b=jPc/FU+0Xwyr6zU7
	bUGyesMx57JquvsPFvaYb/49hZZ+ZcMywVRqpik+BsQxZxEz+WZwA/MosIxhuz3b
	19RJiWjFvPidQv4YpNLf7PJr0mH5WKnjDADRSPY89vxvgHHXWZVoApmjRsYUaL16
	xJkSbdRIrJKbcD5p6isfNMoYXaM3YTK1c1HPp1+22U5l8LpQ6JDw6aaQItOxI6n9
	pH/x/ED1DpbCTpMfjI2iM9nbEYuVNjAJqm6+/uhPhKsx4hhuAqxZIvBfkJiEopoT
	MEy8yS3qorgm7iXyF81GauyZrDuHykK2rZjmejKtUwFPgthgn2OqwpF1BCewRKwT
	iI7zQA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1dujke1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:34:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5276aa86d00so2517011cf.2
        for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 06:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640853; x=1785245653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=;
        b=QjAQ4hVgQxogBkFt/U1Z7eROmWfRYka+dIi7ktr7xEwrh0RYpT3I1Dm83ARw/YnxCi
         aiLjJzRYHz4fyLFOfqdvkBaV398CSRu6B88hJcW9JRIC4/+h7mOhEbIw/xUUK+Cq58k4
         t9xZq/KxPX4yZ4sqBq+tl3k9HMVoR9iq8Db/iwuyalhqF3PcdVyhiKDVa3eFZ5np86H4
         59YOP6l9oKDpohgPPm5yspAsVv+y3pJCuBacUKRNOGICavLjUiTx9k3xivfgAwsTaB1X
         aJIoFF2gea34+QOoKuVEr5/P1u5krYjU1JR5x68aFyQ0QuYRbLQHCXyUe8Q8RhdswEc2
         rKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640853; x=1785245653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=;
        b=CWhr3FCom00vtPz+ZSE6ouQD/8OTDJqXdse9LPMkHuFF6+uos1GIibXJaEEozMgfKj
         TGAUo1hWxMj1LKxVVkusS1FhhsXHNRTgJicwf0bBCpD25Su8R1oiC0RH/6Fl5y6U4e0Q
         3yLNc15EsXIQQjUwv/OZWTkD8gySWAEF8DsiBzaH6i7IQQnDgHb1e01rxFRSLJclCK3T
         Bkqhd6s5HdQjjfj7w9JJsI8d5epnebRvr7nozPHZLAqXcsOddNid5UqafqAwlmmh8lGL
         2UmrVQRfn4bQ2CSMgzLJ71FTwCFMhhOPPIBbv0sc0elny7+Y2OiReEmdTsW5gnandKaB
         8hEg==
X-Gm-Message-State: AOJu0Yx9eXskiXhNaW5av1bAb+ZlUBedX8O0y07P7+rnkS4mDrU9UfOA
	zYpxTBRh1vVyMkWGMHCCr+3F5b9TI3T0TNY2kWqWIP2zKCf2NMfMc8JAV+WwB1lzMxWL7kaQzsJ
	7+ogbmy+45pg4aQW8zgqxZE6rr/RofWSu/MV0OFskZF7f/SQEWJoPHj9Z1uEcaIo=
X-Gm-Gg: AfdE7cm1u4GBAWI/OBjoV7gOidn7eJB6p0Ns98ChnV532P8rvlAiyg3XmAVwK8PA40T
	wQk/fQzTQWEw724ShOhT5nI2x1bi5myO805O2bE0WhPZ5I0/SXLwhLUvuUPJ8VaHpVLWU5V+bT/
	vq+2u5WIffBVgH8yOqC2eDbeWE1311Z6HCGhtqMktBr7stTDU+872q1jq4xpHM6fws/yDXbXXX6
	CMcDRhfS10+oGs1vB7r7V/fGeW+A4YmmOWueCUCvY2XikcuxNEOIfD6P5BXlMyNeGGYJDg1/O3e
	rUUOSUQ5MXtLoVJm2MZlKFCIZ9bVcC3QwoqBHQU+uT05ynqjr/ZXy0pTEpKL+9qIJyvyX6ZHFkN
	9Pb8reXtxp2MAHUROBW0lfw4w0168wQ==
X-Received: by 2002:a05:622a:1b12:b0:51c:167d:b345 with SMTP id d75a77b69052e-5213b146ffemr155608571cf.24.1784640853078;
        Tue, 21 Jul 2026 06:34:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1b12:b0:51c:167d:b345 with SMTP id d75a77b69052e-5213b146ffemr155608001cf.24.1784640852362;
        Tue, 21 Jul 2026 06:34:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:34:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:17 +0200
Subject: [PATCH v23 12/14] crypto: qce - Map crypto memory for DMA
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-12-1be02deffda9@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3111;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zV1OR5DiqlcnDzl6TeLEQ0wLAWkLclKWK2ow4Gd4Hb0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3Un/B4sUi+B/dVJaFznHoX10XA1vghqMVsur
 E5foyX/j3aJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91JwAKCRAFnS7L/zaE
 w3PdD/4yYJmvx3O/tU4TNPLja9G//Czlr3VKIyZcL/gBiQ15z/nZiwZVJZE2b5cn6VQ3MFdHhLh
 F52K/+T0ic9z/uRZogZX49SeTr/lUq7JdXkDEMssyLdpfU2dNmRBaGzTUqzB2AaSFf4QWZ6guOY
 UclVrcQCrx+QeQ+BjvcvUNs3/18XjiMNCxThtSou+9yxEPGbwgVUAqMa38fM3jowTf3MztAUPh8
 VdJb6U0/Zsv1avF9LMguUVyvnwQVcTiph03Z7eOZnyzmi6ER5PHLodsNx9FSgQ1Sin+iDnAMvXC
 DQFsEyo6IpuZEp52pzHc0jdFrxEDMBn1QrRqN/5L4+mRJbdBxYBPZaGliHvrhXxGRWl4vVcrDlG
 +fcYSJ14DbVFHyEq+h0EzJHDRxu/UVevpK4zcKiP376myKw5lhkUoa/WZmQbqb3cdoC1Cd53Dgj
 zm9us7ZAKgaaecK6kXjnDHzMRqgfabcWbnaszl/M9Po7whdH6EMNYP5fQ0R8UVQbFZzFeEzDfAr
 1Hg+DVBGZvTDaN6jr3PurtcEcDwQS+RvMb3Zz+epLeQhNaViTarv2BLRdS03Bo4O3sKWUnIjvdS
 LarnQBYMmNBZQvqi+t/Wls1J7kRBflE+NdGj341EqLWcT3zwFOON0oDPpo32KFbFn0HoLUorCh4
 MwEYNV6TRQONrXQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: gZzF2J4iq2yaLZODZI0HD4TT5BP9rNMh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX7DZI4eu2UoY0
 K2EV7CNIc/fK4OcFJR+OQIXlg4JagehZELcSlMvTGPZUoeBbM/PLSVjoped43D/Mxf82U4FcZEo
 aO2ZIU4mD0oaAf+dkIAzAfQG4JZgEDhwaRDFwuT2v5oOsfMYvDAoQeI7V6osB1LHKT7WAIy9VLz
 vbVmGGSjX7hbyGsK1yGyZc/UPILhw1yo9N+x1fnY7NFZWCB944eOLd61KkvygoqZKXyj8ZTXa4m
 R7SCG05xNG3hNK5NFRjSy3xCInH8K45K7YrzObRhMcXLYSVyryj4G/HCadPew/FByOmMVPsJmSP
 mRS8svIr6mfOz5YDYHgJdpTvkrWZcLHfgiVX8iTvlHnzG26VdMwz/oJd6R30y7lov8m8vl2iMLA
 Y9AH+o1A+dsh7N1oO+wLDqTDFZtA/UhTc693gMcMLfLdSYUlSESIaPWDUYzRHP2vAWtM0wGWNuo
 Es8yvmk5WDdEqqNdLbA==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f7555 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tNk7rGwWxUH_P3zroIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: gZzF2J4iq2yaLZODZI0HD4TT5BP9rNMh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX3wez36RKgWmV
 uQ3FlWUObzDV9ACsuQ1d2nIyLyJ0gJu0Kki+fq4p9NMR9Z+Se144zCaOb44fStG6umPNjQ0bup1
 vLA1JUNyhAdyhWgc0Hp+KHymXpiDZN8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210144

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in converting the driver to using DMA for register
I/O, let's map the crypto memory range.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 23 ++++++++++++++++++++++-
 drivers/crypto/qce/core.h |  6 ++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index aa4a0b17749081f1ad653424bc265ee81e348e15..4031b4516d6519fc5024bbbcc439500a7b3314b2 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -191,10 +191,19 @@ static void qce_cancel_work(void *data)
 	cancel_work_sync(work);
 }
 
+static void qce_crypto_unmap_dma(void *data)
+{
+	struct qce_device *qce = data;
+
+	dma_unmap_resource(qce->dev, qce->base_dma, qce->dma_size,
+			   DMA_BIDIRECTIONAL, 0);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qce_device *qce;
+	struct resource *res;
 	int ret;
 
 	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
@@ -204,7 +213,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
@@ -254,6 +263,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
+	qce->dma_size = resource_size(res);
+	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
+					 DMA_BIDIRECTIONAL, 0);
+	qce->base_phys = res->start;
+	ret = dma_mapping_error(dev, qce->base_dma);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
+	if (ret)
+		return ret;
+
 	return devm_qce_register_algs(qce);
 }
 
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index f092ce2d3b04a936a37805c20ac5ba78d8fdd2df..a80e12eac6c87e5321cce16c56a4bf5003474ef0 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -27,6 +27,9 @@
  * @dma: pointer to dma data
  * @burst_size: the crypto burst size
  * @pipe_pair_id: which pipe pair id the device using
+ * @base_dma: base DMA address
+ * @base_phys: base physical address
+ * @dma_size: size of memory mapped for DMA
  * @async_req_enqueue: invoked by every algorithm to enqueue a request
  * @async_req_done: invoked by every algorithm to finish its request
  */
@@ -43,6 +46,9 @@ struct qce_device {
 	struct qce_dma_data dma;
 	int burst_size;
 	unsigned int pipe_pair_id;
+	dma_addr_t base_dma;
+	phys_addr_t base_phys;
+	size_t dma_size;
 	int (*async_req_enqueue)(struct qce_device *qce,
 				 struct crypto_async_request *req);
 	void (*async_req_done)(struct qce_device *qce, int ret);

-- 
2.47.3

