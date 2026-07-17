Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9E238D3E0
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 08:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277422; cv=none; b=awBiuzaa13SuQwKk1PhwdDhUgku92qfn1+mkXtXdk7dH5QK3TDgHai9AvGOr+i5Pd7FnsVRCjx+qdYX9aQ31OQVAXqk9GqxvKqrzIMmslzScfKYg0lM1A0bo+jLZ+Yt2OJafLCb1cFP+J980ufITRWN1yWhT90Ze6/p9tE38+vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277422; c=relaxed/simple;
	bh=4nbFs/xg8cCMPYrFtHWE96AOtkhXxC7yUgPXEapSLFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=spLKz0scc8Jt37ftGMxAkgUuoLPAWTjIg1VStFEBm2voMkL5QynwYFgKk/ZIzibKiOZ7QV152F28yDUMqDjol6M2siTs148/PyYihEELcjJ876aKvI/aPqJWKBv3Vbo9RkVGtxBeymRKGLM4gWyKR9E8xMifjT4EOKKxMckrizI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jar3QkZ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ESen5vjU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jar3QkZ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ESen5vjU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cIP52098568
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 08:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=; b=Jar3QkZ642Thg/ni
	2NYxT2TzIA++eGcOPp3LWns2k7/oz4CmfgDt/xTWYV5FPjuUD8/d4vxyJDvthc4M
	gbDo0BzPqMLeDnN6QirxE/2xa2obVBhu6RyRcyC/r1JZjCez2O2Z5MgwB3JaM5hw
	kMWQoZpNIa9M0JjBAj6LY3fyz2oMrylTQRmZloKSdenEldcn2yzOWNN7V3a3GpYD
	KpD7ONIkQOLEDdQjSEJuFnxhEskmcJYkprLfzf/SCLgivtF2aXprvQn884ubZplk
	ibT+P16I5hkm5Z3SgacXNswXr/WaLIldbKxZUdyjEfSd0sdZAyxYWiksn0Ij/DLK
	nG8wkw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6ju27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 08:36:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21c01cf3so91767511cf.2
        for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 01:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277416; x=1784882216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=;
        b=ESen5vjUUswAEKEGpsnymlJs3fGlQSQRsZgg7dgjXCKpuVAzaehuncahY1+JMJY02Q
         DDX++Cyj+shtBFF9svvfEkPeEZLCeba+2b8cnZFXKT7uo9f45t5/WcwCH/UZNbZOyFyd
         y+uD2KZQ5K1GSu1KBGNiGej5yVTUqy0nrx4RxRadLBGawU/+Z9a6CXh2NUInIbdrp5NL
         u/wR+gusoP29KSmlAh+5DDJzaT9CdbLDYY0lMIiEAsZqdxlehQMkjdH/jEbB4Ii7d2Ft
         CZIX92fqOA8QzUy26CYHzufVa6kW5WPWgg0S6SFYhUPhurigbDtUs85hZtFB2b3a4JvN
         AjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277416; x=1784882216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=;
        b=qGPoJ3drzq/ycTLKCeCH0RMSL+4iscZlOovAVCH0SQRuEkYXua2/CAH8AqH4KsB7W7
         j2c0VBFXyplDsQCRGNr/LSTs7nN7tRwhRUDz9eeXNGqJB2hgcGlMulG+QlZR1Xl8vRwg
         5UaU8VP6JRs18LKCz/2nfZznN924PU7yEmnUHi+1ib/MbLbvNArdiSKjeVinOMc3DaZD
         6h+3JAnuPtmtMNudZf6/nHDRAWg8FWpLGz9kjcNFrsmhYzlOQ/66c5Pf/Snt+/iKXOc+
         OEyHStc6Wb9MzMnIgb5ADs2pwJwRk0Vtks18AH6jotuyh+CkOlnGvOkFqm5jifZhvkXy
         5Jlg==
X-Gm-Message-State: AOJu0YxIJUhv5fygwnxOz/HUllAM0i3sCBbkrLq9c/M/5cMGLULYaOd7
	chXDHfloRTxqe7rBZBBv5DIUUa7PKO8rZeafVyyodmCX+n7luq9hxiw8l9ZhboBVVDiLw6s1ME0
	WZUSSsEJPbYM6VK3q1JD4s9GjjxHMZ4LCu3DaSFwPT9luyMSs8A7pW47At0MNXbs=
X-Gm-Gg: AfdE7ckyf604F2K/Cebl4h+xoRULcAqy1zaC7LrPk8PM6vruuVtHF73yhB5rcobCiR1
	UTwfZJnn68WccqF6cJ08RZXIpdYkxP1O3GHPniN7T19OFBaiPCF7hCkans/OIs/Ntrx/mp/XA68
	mX4Y+xWBEJ8A+orTOBPFnTgqsd4WrP0DDTkuB8EdYWpf0ZnNftOY7wQ5TsTk/eixOozdjSGzZAl
	6R3VMfTlmh+J2+VyBI8NhbGPlJ4c/SbL35rLVsHn+BPBwl22dnnWjr4MFmkZx2V7rL1nydtesIb
	UvsI4EOV6aSf5/H9U/o/ceIauvgZgogliVuWavLhBFIxN1EYq8UriEvju6BPy9mbCrE4USLtb6l
	+FXzrqlPXeJMvZ59hoQJ6bzJ6I89JaQ==
X-Received: by 2002:ac8:7dca:0:b0:51c:167a:a48f with SMTP id d75a77b69052e-5213fc5832emr13493831cf.64.1784277416305;
        Fri, 17 Jul 2026 01:36:56 -0700 (PDT)
X-Received: by 2002:ac8:7dca:0:b0:51c:167a:a48f with SMTP id d75a77b69052e-5213fc5832emr13493671cf.64.1784277415952;
        Fri, 17 Jul 2026 01:36:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:36:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:28 +0200
Subject: [PATCH v22 02/14] dmaengine: qcom: bam_dma: free interrupt before
 the clock in error path
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-2-ff0d18b27246@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4nbFs/xg8cCMPYrFtHWE96AOtkhXxC7yUgPXEapSLFc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemWN2S795vbkqcG4ij9ubJGy6SuJf50F4bC0
 66Pb4j22VCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnplgAKCRAFnS7L/zaE
 wwlZD/9W2iUVIF4KIbsenZB6fCtyq8ib4S/4/NNNBCMD2PAWlLahOYax8bse8uRXEz1ZknDBOiL
 iYjW3QFER/8p0U4ICp8muOjyORmpmsEDXiFd/yMhhIfCFR+jTBP/u3AAH7+yoqvcLKY9L/kDlyo
 wRs9iTwffQQxCN+HGOJCvJLo470e2fWfX98dW9P3GJLw76PO8KbkpYzfxcvx3ElEoluN9Z+vKLA
 ts8htozQxwhlFGVbCENUmySIcjgtMgFMMJtOO/pHd5OKQ35aAwbUMrUeTdp7TNRagDB3tbVXXWH
 A7Oo9PQ8YHO66ZAX/ARmyggobbu9YrjQTpyBAUjRG71jumBMZc+3Xp4yh+5LnXEN64gfo6wjyW8
 JJnVYc5lNNdjNKktdcWzqPyy5SscTarSXGcHlUJ+TJ96rfFWDCFRyt+we3KAOrqsI845PtBdS12
 5qnA3Jz3sADowcuWtuo5e15JNFOya2U9Isyyd3grMFJ9MGNVvTlKPrrh0pcOczeCXczEre2OEhj
 q25/4hhDlMoCbtdvM40W+na07KmOLF4TAPA8h2mTcGRuro/sEr3XbiRaJDgWDBhIQ26zVD6xZAg
 yJQYF22aJJ1qK8m04YAUjkWKcaPpO1w0PIqPyt8DpsPJL6KRtCKA7gxpO3/WABq3khr3YH6Uqal
 6jZpVQVr3Wnsb8w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX5wrdwNG9mML/
 pDqFWX36VzKesrndOeWCT01thgaIHKnTqk+IcaSc8Jy/QXza7MzHvYvByLGs3vvQUjnTVEDiIIh
 a5Qa7cLVfiFUYpYWz5K5ueCr7Dbm9xK5HMiLih72CaPKAjzuLYmlie5UNNdz30c76+EtvlT5xsV
 aNOrwDYtYwW1Kej9xj8K9tErta28X9n9MRN/wj5E4N9pUEJXJD1BLoBQ44POSKX5iaYiKX8nFPR
 H9ZGM5609+qWdqyNAswX1mbuqu4gfNa2Bci8guS2bAkiDxqAwXgAPFI0dND/Lj39VT5SDI8ZDwx
 +z45JZDznLFub//5fy6DuUWnYc6a9RH/iiGCXiQEyLAxO7JNLuINCdOJASUM+JoqDhwvSRVV20q
 Y2k1XRH02ii9Gz++0KMtC1ReSRPrYa1NtJNGJhI0ZeIdO8F+F9JOG/himkkxhwuxtPrtmBjGtrz
 rl+tuZnED+jNnXDPJig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX+GyUxyzg41t+
 C0LVHte790yYv4vqpN2cnyMrxDlfiMagfeeg1jgIDRtFsiwhVargShweTnjDYD47JiQSdwHSgbb
 gUBElE/NPC3FeSKVwcneb0ET7CSwSEs=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59e9a9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=n8zAjjMAgf0wD31B80cA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: Uq3I_3SqYWLz5eTQdqg23Ux-MeWv-SrS
X-Proofpoint-ORIG-GUID: Uq3I_3SqYWLz5eTQdqg23Ux-MeWv-SrS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170084

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

