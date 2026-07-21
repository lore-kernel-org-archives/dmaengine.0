Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD81369970
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640824; cv=none; b=LwAYkYvDM8BAc6lngH6nIOQc9Y4tkmrKm8OSlGmSH7hMcBBE2nGkd/hC2njEGh8EUQgVoru5ecwG0oZ4NXTmYQvybaDCritztKr54gai58s/XiyIQL7IDhh69TfSwWPc9F1jrV00b3/DjKirSnldx7zVHl2IFOdOEZrdDN8JT4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640824; c=relaxed/simple;
	bh=4nbFs/xg8cCMPYrFtHWE96AOtkhXxC7yUgPXEapSLFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=arJEUmDct/+soiCTM/wpAgn3SwREGZLdVPjWGLZR0i71oaZS+mVen5kgX471XaIy3N8fSy4VHbzFpl0vN5o8Bh8yHRsT7Z/ZwZfmMCiHgZh0xToIV7Io2mjDkoXxAPr68jEFzDb6eizp3OsIL58yJMBxgtWubn3wE/vxNXB3g/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jR6dkYVo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9vHQGz1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jR6dkYVo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N9vHQGz1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMH8f1923327
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=; b=jR6dkYVoqTYQpyCE
	0yE0q2kSI2nvymCD72OM8tj2J6T48uLz3VOzK9bHGlZ99XLqbN5n53IDRh7cf5Gq
	vNpPTIRre2FXTAYYttkzM9mQy7BtMGgpSwGPj5CZbPAd3maYF2Zhg2pofBdOT9T3
	824YjCybS9cSFPjQEgqCMwv2ih305ybtc9fmwJR0jdNhJ2VV8GugieCNeD+YgJeB
	07jGDuPJ7V2MkWg6jmbFAmaHeP+HqN+alEJEiofWHS6ueXSkhFOFglJTvoc4Jfep
	IKAmAUTR5er859lQxXaMQBu9wv85DInsBgcP/5UGks+dur/WOoxIuSiiFVgrWE7P
	9q10oQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj68611mc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:33:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c01ff996dso89448021cf.2
        for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 06:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640821; x=1785245621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=;
        b=N9vHQGz1fml1LrTqYPTCwT3moNaTO5nNao07dxAfqVj94Y67JTSPuMrBFkbN5Nvai1
         e9OuHf0lnF89yc7gJCo01y1a9i/ZmssC4AbBbcOKDAXtqakKZ5oSX/f9wBUw84HKX64k
         2gxm1eATT+puPTmXXrIp+PARp8PV/cVRTIbwZGq8hWMdgY0P6JgfEsogvEz0zyqqnekl
         iPc+kRgm4YIgaBPbdus1zZB8O0hfH7R6gq7Jcqv7WFpr1tQH6VBgX3YBNzNbczlJeMmT
         ho/twv3MaE+4YlMCzKA5hgOuQ+gBoAXGSlFwzL6jrh90S5hbzg82Vq9cPM3mRh5lV+Br
         SW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640821; x=1785245621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=;
        b=Q9DVBEKuYYx2u/ROKr4Sujul1vt0xyMHBznPVKXsaPfJPJyhPkIimlVMom8m1qQEZu
         pzDBu6b8YjvbnEMf4kcGx7GXhhNuIYM09Yyq59zYvJbPV60CSKfaBY2Vq0V6orWZp3P+
         qT6aX0twldHt1E8BBWBmXRog7QiTSqnsAa7sUt5EhNbIpSvlWIIdsxneUDmoOV8Y2kzL
         tdqzNqfkTOLiXi/SPRux3NTyGKN6+1XhjHDRTvjIULP1MbC6FJwMQD2h9G41l+DwBVk2
         yhNsdgH50D4w8rVXoXiSQt4ts0a/2du12MjBfE8SCqnMN2UspshA7hWrcyh7Q9ZjPleP
         C/bA==
X-Gm-Message-State: AOJu0YyPr7VQ5UCXGeiDFT9WCaRpfLzQKEuvker00CbB3jFc6Mqn02bB
	ew9h5LE9qbuJe13FwRV0cCU4RQ6ZaeFyXn6BQTTkRW5Z2VqUjf2NxJT0am1y9RNasQRVj/0YkC/
	2HpbNmjIdykRviHXSGs6m8QH7m2+bcXsuHBM816L0jN1eJWOrP2NspZr5yLCv80E=
X-Gm-Gg: AfdE7clVVAWYRo2aN/8bho7ncz/rhoID0YbB/sF4sbfekoVx/ykPt0Q7nxSQsj4PuU+
	7qfCpiZ9u4H0UjobD8XhbaDacMchmsndi1AMW1zMLsACTvUfBc/vWf/r+jkdeGkISIAnOWP4MOa
	J3F+PZ6upWDhqqw1Vw2VXydQtMuqqHKzFQIFMm87BHPymZHZVHUb7eDfT7Kp4UlpICoGHgIJNt5
	k00oiElCyPIWmBseiFesjX0M0RZS8/6uHQv9T2MzCOgoeaUWKGiCzpfbxf5EsKphbPFMAKeH8Xe
	uE9Zhb9PeNcdjMmxi4FW+ny+1dLaby0tnb3STBT1tU4OEFO4qtBIyNtiquqG+mcm9wkgJo8Ta6y
	BN6gGvO+bMALRC+80rCJqW7z/PE+Pew==
X-Received: by 2002:ac8:7f13:0:b0:51a:8c99:1f17 with SMTP id d75a77b69052e-5213eb8266cmr168099961cf.70.1784640821004;
        Tue, 21 Jul 2026 06:33:41 -0700 (PDT)
X-Received: by 2002:ac8:7f13:0:b0:51a:8c99:1f17 with SMTP id d75a77b69052e-5213eb8266cmr168099441cf.70.1784640820325;
        Tue, 21 Jul 2026 06:33:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:33:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:07 +0200
Subject: [PATCH v23 02/14] dmaengine: qcom: bam_dma: free interrupt before
 the clock in error path
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-2-1be02deffda9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4nbFs/xg8cCMPYrFtHWE96AOtkhXxC7yUgPXEapSLFc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3UeTf5yPkR71GYC9HakPsyBmOns0Ff6OXLZW
 KKH3mvzMz6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91HgAKCRAFnS7L/zaE
 w1qJD/4vuV9Fj22we4zA4r2X2pev1SmEHY/SdBxLsKFopJ77s01KnqiicTUPULuJ1DJ0ju+ITYE
 Sr8a8HpraTM+koiOJ277s5Ma3PySt+/raldHmeoH8DgvFT2ybAuGGjcUnTEqjupk69BStbTqvPK
 PGisrWeh53ehwPJV9Nx/8EROv73Rq22KmMIlQo2qQmFDnY6kLxpXUDcK/Z3DUtBZr+zse5lQME8
 c6a3SYxx9lV4aSXgp/rOOJTVlxDu+jtNYmI+NNsKLczXxFL+EBtY4cLMvqVGBNUZs6JaaZAtwqC
 Y0r1k2l8txUqORKpZfNLDnDRWrvvYHq0pZqMUu5daBpN207cKVp9jgkM1lFnDjWFCt4YJgf4FHZ
 ZTCpaRMvjWj8i/tgdvX22I84e+N4xShzIBlPe+O1VxIwKwCeS6Q1QYM6SdGtE9OHVdrswwUgZDJ
 3YeaG1mYZmzzDdxtqKOEAwAx03wpc7xg+EjvDWTNaob3gBxLWiGduc/S37gJjIWWYNdg1cnB0Zz
 a7sE9oGUrIJy0N/xU+qIVue0ErYS6xFduavN0DBuu/6XqzrHbdQ52SaxQUUPyaHw0dZvVG54CUX
 xg1x5STbAno4Tb26snx57KMcE5huCqlfvySuirjbAzpWwB9dUrsVLS+4jTDdYu9ouB9SPzIB7Kx
 mZhnaJ5btSxq51g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX8Ppcyc1uaMre
 Bftz4uJbTAW+7zQyK37FBGEW8fWvEFdEYQy+RMMsNRzNNNOD0AuzaCzvfh2LhVAOcaY0Lyzh7ac
 GZtoqO65w6akz07qqGNFuLX4ztNYmkA=
X-Proofpoint-ORIG-GUID: ZMJsVEio2_kbt0ewllT2oZlJOsGy5j47
X-Proofpoint-GUID: ZMJsVEio2_kbt0ewllT2oZlJOsGy5j47
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5f7535 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=n8zAjjMAgf0wD31B80cA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfXz3QUOK3VtUDg
 E5m0MoJd1ubxElApZZXHHRkRcXTQGghmldV8XHjDQDaRIwSFf9CQzHjDU0ICtGA89xbGPfxEj7m
 CwjQtJTyEKXi6jGjOzd+2u4Jj9ytmmgor35cPmSKvttFgrBjNXeOR0VtpDvToM4o0RWmbtnyaYx
 QYjDL14Q2csHrYSEC2gN+d8ixc1spB18YY4d17u+ID7OFx3AbZZsVOrIM2Iw+PZi4kRkbvYVQh4
 EfTdzdFlgomK4kCw+TuKlUeWlt/d6OFHr3dgMI80AhFVBa1SmoucsGGL5gFvSXvLWYObXV1rDnC
 cYzrkZ6O2pScEih7wKeSgD9NkXP5hZzJ+jK+0SUwlTNLB7XE42N6/JlGYPM4KQ8OMx3TnKfynXM
 4QNfN4jgPJjrpRcWI0K0jXtxDzCikfMLMFVLbKm1vbzmN3pWzmITnvVlDEoyjS1ZDS2O7ipmT5w
 mV82jQS46h0zBywx5Kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210144

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

