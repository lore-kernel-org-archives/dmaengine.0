Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7864963B8
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826596; cv=none; b=N82LYL2uzCPMxsPjp9ofsHh2vud453INI75q0r5YNBLPKi8GiQEM3gxKVyjt0srXGq7NUjBtFaMXfJ151I1eSNwDq6j1rLOEjihEhVD2W8FZP58nJ6m2j8ocs+gv447abewLXhGC2VfEL7GeRBGhHYHw6FCgFiZYFY0iC/UeTN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826596; c=relaxed/simple;
	bh=4nbFs/xg8cCMPYrFtHWE96AOtkhXxC7yUgPXEapSLFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HxhKf2n4Cz+B/2EoxVLQgkzDGbALZieswKrsG/ZTcSChtrow/NV3hgELzx2LGU/uTBBobjHsQwfFfa+wIQTLmkbEHnLQsGHRDgyvUxzDWEwkdURTbPr5CbI+0uK8f7D9FfcMLh6GUMyf9IO7voSjIrydXEG4UEcpmbNhJ46ls8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=orvzQi1K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eSGHGfuF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="orvzQi1K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eSGHGfuF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvkvM021066
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=; b=orvzQi1KLIGbJqyb
	Uet/ZTdsuMVFNnP4RsH0E0ZTynZzpxphJfPAG3ufb0QjeYMyRLXRhTJGbfwAyKhQ
	SHJ97xycouzpcMWkVyR9on52d4S7Rhga+bFoLYvwYtKRjyg5jk+pN+nVrEIgvpZb
	+AetOHg5QQlOxTxkZ6lRAfzU/TLxEkHJv2qxZ2hptOVWcUGMO+2gtrNjMU9ZligW
	FfcjWT3GI4f2hQe22LaG/Hf0TcRRiUPOxLP48n5wbKOitqkQSB639PTk4Kfj/SqZ
	/DSyEMBrlMAbke1rr/aciOAH6cSoWqEgk8qkFlytq5DoKV5rCupDe3rVFFrUDFuE
	A6Gr1w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7mbd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:09:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1e6f602cso15097501cf.3
        for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 10:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826581; x=1785431381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=;
        b=eSGHGfuFWIrqr3ypIku98UyEXZso+9/xPgA7g55IBiywtyEsX89nRdp6XVg7jo5Awe
         XQYMc04RiZALKaRsjHvfBghJ9Ii7jJtD+RAgqrW0l2yFe+8pQKx+j+37wctrgH6aR88T
         XeEVLHboE2NY7cVBp2z8FNvaaY2KkbfmPgOIeI6WZKeXhXdC/gIkfaXZAiKZ2rWWLr3I
         tLRUpGbaEC/uTrQLDe2jsUijrrRVjdmIyDRWRb/QnH2SB0y34/ETUyPO+IQDegcTBTXI
         hlADv1iRc7NH72vw0Gg2oWF5hge1C50maHcef+iXRIh1obYdZl8Q5+9D0M0qn7nTwG62
         5jEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826581; x=1785431381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=;
        b=fEaiy+sDhLQ6iumKrGewfXEc3oCEVsWRRpeWSoYy+2Sj5ftGEDHiz3kYIaWBjSMj4f
         b+r3FkzUVvom6huOWCIu/Mbh0KRRCLnvUc1wybFnMop+gh4r0pHU42u6cDy1z5XQIajn
         TAylCF8PgJWugGkyMmF+1e03WJnfjMwCSUoQwMNAqbYkBWZuac13dykY2N6arPLJ5bsJ
         uayJtcmxS8UqRBb1S/z3cykr3nHZI1arvfUNplxM7cFt59YZ8pZ6j/xVULrmBeBEGuuo
         3xi/Mze+wyqTIe4WAQiUEZHt/dXLjZl95aa4qYNlbO5fyj8zPzB2nDWZY8o2HrzaXcJP
         jtRA==
X-Gm-Message-State: AOJu0Yz0zXjBXiozmsf42Ja6pQZIkoDfexJT+TjPlQtTRkRI2y3/yNLG
	dIGOzfeGbZBPay89mQbWlEAz4T2VdqsTkHxg1nN6hwemzL1bfkIK09xeg6bOfcXD+NtRNKvR6aW
	zpQ8oPhPvNjCSD4aC9cQ1btOiUWE0GjkQQwdSBLrbk8E3rxXBs0aDIx+DD7dYFczKLkJLNSw=
X-Gm-Gg: AR+sD12dlP6jnh8KRQlqs5oXxy/V86iN2y6+hm6aizX0UIc4qP0/c1Xqk/5b2jqpTBJ
	NnEyVhSl+W49x+czL2ua9gq+8MHnBjfVng/s0xyzQ+Oy+tqOjPJITyBRYGM5o7/N/nIn2dWV0ml
	rQHdd31Z82RizhGg0Xzb1Hy6zeUxWqaZsvvFA2TbAsCh5a+zfZTphHF5FrX0M/Ixta0bw465MBn
	zi7bHr99HWw0Y1N60JG3tqh6i+Ndv/PQmtw4BiT+61Y8YeTTWE8ujNGacumCQXfnjV2/FEApRUu
	uL9RgM70ZqSVHgggJqVtmKhluIoNzSTkPWkBQAQWtVauMPDf4RnCoMd7yeqSce68nq5ckPW4TbE
	gmB7F84J2KoUCUyLz6vwBji6aMa3n
X-Received: by 2002:ac8:5fd5:0:b0:51c:c29:d4c7 with SMTP id d75a77b69052e-5283dfc878fmr34791411cf.62.1784826581110;
        Thu, 23 Jul 2026 10:09:41 -0700 (PDT)
X-Received: by 2002:ac8:5fd5:0:b0:51c:c29:d4c7 with SMTP id d75a77b69052e-5283dfc878fmr34790841cf.62.1784826580251;
        Thu, 23 Jul 2026 10:09:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:09:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:08 +0200
Subject: [PATCH v24 02/14] dmaengine: qcom: bam_dma: free interrupt before
 the clock in error path
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-2-4f87bb4d9938@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4nbFs/xg8cCMPYrFtHWE96AOtkhXxC7yUgPXEapSLFc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkq/WBUoWLjOzExA79z7UMdsm0HF5JKxlXZxt
 tTjR80KQnOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKvwAKCRAFnS7L/zaE
 w31CEAC5obaMMhHtPfFZmXXLzrCNZlzYHp/1Y7abX0djXAm3vL4YOq7s6EXKNbKEGjg9uW7MYbk
 btwotFetGoy6sfEuM5e4PMxHWHiZgWqE1vuWcnnE68ugoHN1nE4L1cOurCeFcjNNpdz+48v7qcA
 ykOLqNuTJNIduqr8zgFTv6oTWswf9y8Z1So7gfh6+IMCsLZCYNipYtJqNKpMNFT/Ai3a/6jgh1N
 B8VwOSgLmfSSvfscDAJhx38ZpZERlZMF4vYFvLmOjA8ann1WjGimov1TbDwbiswXTIiypqRuRsb
 0zXSUTWQ2FN24NVH3vnekWVQVZEC8AwRsq10h0dtkPwFR0ivFZEypRbP3p/TAZJIdpkIeDLWd/S
 gBvVCBGSZkpJzHGGQ0edBPO0P/NO7qYnW/ETpiaeO3URS/Ag1Kv8JWcwboZyGGKO1KKX08OGPU0
 a0uSXrqveSC9S1PVv5WXvSJjGfYf5xNq5W6rTgGc1vwJEJquNWjBTzHSxACzPKu2ushNcna5X31
 Di27HDYFOe2GUpzSpSfyNwgxehROjGBPOFsdozayswtBqfRfOl3g9rrD4vmmJgNmOCp9blU4iZM
 JlSgH1heKvX7U3peoeh1GLQOfef5MY3a2/xlYNvDt6RqeNbczORhD7Q/25BkIkl6TiYUhAXGt2b
 R5JExTs/jzzLuoA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 5ELpYPmZGI7hVynOx7URIX27NkErpGvW
X-Proofpoint-ORIG-GUID: 5ELpYPmZGI7hVynOx7URIX27NkErpGvW
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a624ad6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=n8zAjjMAgf0wD31B80cA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX9vNsOxsebeSV
 txJgeWSJ7bEPVH0GdLmJ4Rq2dFCw96GKKUAEdDnXYGTbX9d/meVfK+xP2XmxYxpfPy/UMFFNISt
 RnTHkIp06ry8y/NfB64vZKGvC4f+dXU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX/J2lIZ2N6Kjo
 b4yObyAnkGSV89c3X0OUCiVrpSRQ6llr7pmNIc+ejC2iQThIN5IGaOq0L5InULMI+G8vF3Ub8Ni
 BzH7O6WvaYP+4vrBJKIX5vw6IGWcbIFnQAjnxRhiKGO+xF/Y/LQIUPyWOkH60Te/4VbUXoX+d1N
 Vg+Z5cRAR6GPPGptxSQ3Z6fxtnGCeLXa3ZofhDSCDsjZLkRS8/41ivnJjmDNSTiPPC6QgL/5xMP
 LjCx3X8wqKDceq8GKW99JJerK212+pm0oTf168reeLfxdhNwZuOgX1PIjxND4BKs5/fLatmdPhP
 Q0LDyg8DCEiS5Si7eP72D506XRSXn2ULNeDKwRnlNC6VEhEFDkjgzYWM7yRwNqGuCH0gDdSsAg+
 G4qjJOcF35Iu5UoDMh/R8eM/X2Xbwlyltz2vCQLp3i2MHYa/8Cu31p3QVnR3nSMC+ijLKQPxuVl
 IAs4xCcFN/aN0Jl7DdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230167

The BAM interrupt is requested with a devres helper and so on error it's
freed after probe() returns. We disable the clock before freeing or
masking it so it may still fire and we may end up reading BAM registers
with clock disabled.

Stop using devres for interrupts as we free it in remove() manually
anyway. Add an appropriate label and free the interrupt before disabling
the clock in error path and in remove().

Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=2
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 1bb26af0405f3a16f97e0d4b86c945c252d97f57..fc155e0d1870cbb7e099a2c4280f9f8fbdf6cf15 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1332,8 +1332,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	for (i = 0; i < bdev->num_channels; i++)
 		bam_channel_init(bdev, &bdev->channels[i], i);
 
-	ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
-			IRQF_TRIGGER_HIGH, "bam_dma", bdev);
+	ret = request_irq(bdev->irq, bam_dma_irq, IRQF_TRIGGER_HIGH, "bam_dma", bdev);
 	if (ret)
 		goto err_bam_channel_exit;
 
@@ -1366,7 +1365,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	ret = dma_async_device_register(&bdev->common);
 	if (ret) {
 		dev_err(bdev->dev, "failed to register dma async device\n");
-		goto err_bam_channel_exit;
+		goto err_free_irq;
 	}
 
 	ret = of_dma_controller_register(pdev->dev.of_node, bam_dma_xlate,
@@ -1385,6 +1384,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 
 err_unregister_dma:
 	dma_async_device_unregister(&bdev->common);
+err_free_irq:
+	free_irq(bdev->irq, bdev);
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
@@ -1401,6 +1402,8 @@ static void bam_dma_remove(struct platform_device *pdev)
 	struct bam_device *bdev = platform_get_drvdata(pdev);
 	u32 i;
 
+	free_irq(bdev->irq, bdev);
+
 	pm_runtime_force_suspend(&pdev->dev);
 
 	of_dma_controller_free(pdev->dev.of_node);
@@ -1409,8 +1412,6 @@ static void bam_dma_remove(struct platform_device *pdev)
 	/* mask all interrupts for this execution environment */
 	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
-	devm_free_irq(bdev->dev, bdev->irq, bdev);
-
 	for (i = 0; i < bdev->num_channels; i++) {
 		bam_dma_terminate_all(&bdev->channels[i].vc.chan);
 		tasklet_kill(&bdev->channels[i].vc.task);

-- 
2.47.3

