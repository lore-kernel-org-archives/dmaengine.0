Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AAB242D89
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826607; cv=none; b=aJYrzjCOD8wc+MMPZFF5ibjmr6qah9zGaNkrP2A6+IB3LmAe1MBc0m0aTihx0K1IyHw8/1pw0oX99vkqUCfdk6Tw/Iv80+wn/OU5dZql2P8I4Sl9eVFzdN9NhO33kf84sfSuOeCoS7eT8pkkHm5RtIGaBO3KPh3XiQXFYgliZmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826607; c=relaxed/simple;
	bh=wCpLSEqzl6yoBDde9p+VABZfQUJK0dP0DnJmF5kRzKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oKHqQ/AX6D2r53OfSinwYwjlgvJr8hkh77fgy/7CmVoXbhTMUS7ppfPxZmf0YKOgEuqgsmvGoj0NVEorZ5usHgqBE0VCmiuRF8pevnfccAguRJcOwwv3zbz/zzfi//3noG8HDKhus5V01czsoDXXVjcP/f8BAo7dCMZrXjvt3dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kn1hPOoe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TwSNWX46; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kn1hPOoe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TwSNWX46"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvn5e011757
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=; b=kn1hPOoe0KcUbjHa
	+wIOfkQ+gSJv2FonGs3nvAeM9E0OnBoX38UvSiqErEhF3Pi6rZathVDxUyNXgZbU
	XoabpBtiQI3+nn9a6RcrZ4BcZGpgkRMZ1MqwdHtRaEid+oemJ7/j/mr+zFLdYQER
	ZwV8FPJSPFVMt4CSyzOSXmX0KXjK2dj8gbd+1PtEEAnGrmc/NNrWWb3WQ/RjPmUv
	ACIm2bBW7iw9KcdgutioXB0rpuFfDkNvhcKW4zt4XMuZSYsNRFlzC00RFgEE2/jR
	zYp2pxcHk6BdJUqsYSSHpkkJcoOaQAykrQQB7pjzBjd6A2nRRPwyZRXNbO4tTNf+
	eaQajg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkayhbcsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:09:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-520a00c7a03so21465391cf.1
        for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 10:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826583; x=1785431383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=TwSNWX461TrbHkYVV2sw8hCtA/xCxqQ+ZrjAZSWWAvfTEUAMhgxhwN4am0ED2fluVE
         CUTruDFftS/Ll6LLUpz6htrhrkjwgzNl5QkXfhh3vobt/zetqgCmxaXE8U8HClxCkq52
         a9DhG42XC8JhXx/gbMXKlYrWHSP0k0UpArAk8cnveBd8eHdRombQppt1aPKi+qaESKPu
         sHY9hm1Rwjmo7oqADT8oBYySSPYvWM8JTsMtY6BG/pNayFV/oBLCQrx+HBE2+CZBzd0C
         mCOcKz3qM1Am8BqvgU0lAMso167+bCrGW9CIGnPOnRamIVbg7PnBn9KyBj4jWpVtH2c7
         cMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826583; x=1785431383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=peZLiMAo2HaId8+1H5wCLCb48SJI+JyALNgZP9Isb+mZwTbEeXiAx4qT3WuVDu6slT
         0wlaWgPcMwsXHajbAXX8n+mh4Y02VSjs37xybc55+wUX1tDEnT81za2CNOHnzhoW2iSS
         L2g4rqgwnGhTGYJ1qxIdrRygX9h72PfuMZAVSIPnR2SXcX5E5/HARNuJgA7zOhuEVKj1
         o1thLIXkg2eFUuJhhGshwSc37TSHhRchfxOHfogylUaPeCpWhKDlQtA5CBuXTs+g1PW9
         v2693IU4M63cJ15IeldiY6GRirI/7Vw6kapfsy5LQBT2/VNZoi6iSX5IaPAJ5cQJK2oy
         +2nQ==
X-Gm-Message-State: AOJu0Yw6bMXonl2yu1sqnhWdc0cJjbIfUSx3rYPm9b+BEWJ+KIWRnsxJ
	WJ9kkdfJE8QccqDIuMgBjiIiJUIASRzZaxtOZUaeBK/2H8hr166A4LVCKCpvuLGcHdk0Goz8XgM
	rDm4qUeuaR2IkUzpMBnQe7Dam71mcXnMvtCm+yFJ+eUWsGbQl/wcKpO8MokDaLLo=
X-Gm-Gg: AR+sD12w3TcReUhiRtppsWQISW326oX/AJCGSVz9FBHOnSia4Se/dvuXiefIhHqc2/A
	fyQsavqicGJMHsUJ2NGRb7wqI8hXGpx8012XtooeCwXLaMnmFD4yuoKr9fOxOAYeyRXUrr01OEy
	0nWi4LpFm1IS9gD10Defc3yaRVurb5m0m2OHJGoi/u6wFLPLnCLn2rU/MuwSZGTps4KqeYx1cdE
	C6hRuOqE2XtcpoBWuLbszPW6DPpGlRWC6kyX/MEXA1Gv49/K+nyBbz8nJwIfRV8HyoB6V+NzFc9
	/Ezx0FLZkbWhB/rK/8R/pFIrLAv5r6DmjkHo5WCKEm95w/WdQeFHCPWTkgSef3wM9rUEcLsOtAP
	5Cz8S+mMB2rvND3pVHlOvlU91RS3S
X-Received: by 2002:a05:622a:5c17:b0:51b:7af7:77de with SMTP id d75a77b69052e-5283dda3ebfmr39083041cf.14.1784826583022;
        Thu, 23 Jul 2026 10:09:43 -0700 (PDT)
X-Received: by 2002:a05:622a:5c17:b0:51b:7af7:77de with SMTP id d75a77b69052e-5283dda3ebfmr39082491cf.14.1784826582431;
        Thu, 23 Jul 2026 10:09:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:09:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:09 +0200
Subject: [PATCH v24 03/14] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-3-4f87bb4d9938@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wCpLSEqzl6yoBDde9p+VABZfQUJK0dP0DnJmF5kRzKI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkrBvXqR9TZC1tbg8D3QSJWkpFx+AucHs4s7N
 H/zFMiPLRqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKwQAKCRAFnS7L/zaE
 w+cxD/9Vc4yJMbV+XbQUTP6CYYzcaJyhYB+RJkFnIEGSb3RFNPchjtx3OR4fq44eQ68G7WP2/CT
 Yo1PXNdApTIEiJ6wuRcSYmqUHzNGgUg+KiRbdfdkag89Wma1+/pvLtYJ3GMM2nURtrFR5h0MsE0
 p8BZLw93ejhP+gL8rSjEqjmdH1ayehxewGh9QKAneLyk6225eFvO+qu7Dmdj4FLWjxyXN7q7WCp
 nLNxnFhf/t+JH+yInWkzzxIAySxRB0g61mWbkFIxCmlU6HYnek8lOGfh7dIdQnAWaFWTny7QFKr
 yjSzS2Wh6dxxXN4IvXYo55kV+yUpMdERa5z0+zw2Jm7OfZFXrnISL5evJepkVxTEg18/9G8mN2f
 sCrGEXbkmkZo8wrhwtCVBCTRn2MIFDLG7EkqvHZpop2+OidVsTKv3KFxwAVztLJ6T3x7N+obVMc
 uY+bhBU685gyJGijKrwpDxrbao7AU5h3tqJ/T+qjQ3oHEOsW+qb7O5E+txRz9RTYwl1MgMdIRbd
 qF06NvEq9aKoPhge7B/gfmVK4CjoDYMb9w39TJOS+OGVKgHHIw6toyew0X+nGeSM17qoR7GPDrn
 cLlWTfWqwWtcx+h0mjG0WXm4FUVWPYy0UagXxeCaFTdyzXLAPwlxa5WCi6uPU91be5aD0sQy15p
 8BxnhIrzqhRUSaw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a624ad7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: KauKBxVX0vkFM5yaQnbc-oiyNbqfIFwP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfXwNAeo/xrkeFB
 2Hi51nR5cUvvS5YkbQX2DBQiXz6FOubDLtxzE0pUI5Vjpm9qdqox032zhFGeowSgUwfvBGYFTgy
 6C2MWwKshi4TXUxZSWPe39/ZCZ4TUMt5lMM/02CDUnQYRewIr4SATIoveTTMZIwgf8SOTuOYyN0
 Orh+jKCo2OZ/4jkrccSd/3bxYtCRXipv3aJ9HYkc5keIXpba9SrepKFnaODsIkc8vokak79sscG
 bQzSTYqJL0OnT5YxeWauwhZKQQlWARf6HEaoHUWmqWCqsmSlfNmthHaw1KTf1x8HPkTl9U6pb71
 WTL3+7yI6cuf2G5k6GMkSn5CUE6l4Q0Ijsw+oUpU4jQisd4L32dpQmhwwjaxqRBLQVC30vJwxvy
 TQpxZQJ1UHBTnab7uheVo2Or5Ic2NCo+Fio2cC2WoZtus1vg8ABj1fR8IduLpmlaAfhc2KUueIi
 42XC0aa2i8m/QrsKEeg==
X-Proofpoint-GUID: KauKBxVX0vkFM5yaQnbc-oiyNbqfIFwP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX+WqpokRPp0Ek
 ZFQVwK2y+ftOnFuTQ8xyKPWrCmbbVCV+Csf+NGhi6BVz6hzIXXpCXfjS5BWGt83OZOpBqbw2Dn3
 ln6PoRGcAldLQ17gOGc/EkHxnbvZLiA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230167

BH workqueues are a modern mechanism, aiming to replace legacy tasklets.
Let's convert the BAM DMA driver to using the high-priority variant of
the BH workqueue.

[Vinod: suggested using the BG workqueue instead of the regular one
running in process context]

Suggested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index fc155e0d1870cbb7e099a2c4280f9f8fbdf6cf15..ea3df28e777f99c0532761b6aee6807ab23ab4ca 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -42,6 +42,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/workqueue.h>
 
 #include "../dmaengine.h"
 #include "../virt-dma.h"
@@ -426,8 +427,8 @@ struct bam_device {
 	struct clk *bamclk;
 	int irq;
 
-	/* dma start transaction tasklet */
-	struct tasklet_struct task;
+	/* dma start transaction workqueue */
+	struct work_struct work;
 };
 
 /**
@@ -892,7 +893,7 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 			/*
 			 * if complete, process cookie. Otherwise
 			 * push back to front of desc_issued so that
-			 * it gets restarted by the tasklet
+			 * it gets restarted by the work queue.
 			 */
 			if (!async_desc->num_desc) {
 				vchan_cookie_complete(&async_desc->vd);
@@ -922,9 +923,9 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
 
 	srcs |= process_channel_irqs(bdev);
 
-	/* kick off tasklet to start next dma transfer */
+	/* kick off the work queue to start next dma transfer */
 	if (srcs & P_IRQ)
-		tasklet_schedule(&bdev->task);
+		queue_work(system_bh_highpri_wq, &bdev->work);
 
 	ret = pm_runtime_get_sync(bdev->dev);
 	if (ret < 0)
@@ -1120,14 +1121,14 @@ static void bam_start_dma(struct bam_chan *bchan)
 }
 
 /**
- * dma_tasklet - DMA IRQ tasklet
- * @t: tasklet argument (bam controller structure)
+ * bam_dma_work() - DMA interrupt work queue callback
+ * @work: work queue struct embedded in the BAM controller device struct
  *
  * Sets up next DMA operation and then processes all completed transactions
  */
-static void dma_tasklet(struct tasklet_struct *t)
+static void bam_dma_work(struct work_struct *work)
 {
-	struct bam_device *bdev = from_tasklet(bdev, t, task);
+	struct bam_device *bdev = from_work(bdev, work, work);
 	struct bam_chan *bchan;
 	unsigned int i;
 
@@ -1140,14 +1141,13 @@ static void dma_tasklet(struct tasklet_struct *t)
 		if (!list_empty(&bchan->vc.desc_issued) && !IS_BUSY(bchan))
 			bam_start_dma(bchan);
 	}
-
 }
 
 /**
  * bam_issue_pending - starts pending transactions
  * @chan: dma channel
  *
- * Calls tasklet directly which in turn starts any pending transactions
+ * Calls work queue directly which in turn starts any pending transactions
  */
 static void bam_issue_pending(struct dma_chan *chan)
 {
@@ -1316,14 +1316,14 @@ static int bam_dma_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_clk;
 
-	tasklet_setup(&bdev->task, dma_tasklet);
+	INIT_WORK(&bdev->work, bam_dma_work);
 
 	bdev->channels = devm_kcalloc(bdev->dev, bdev->num_channels,
 				sizeof(*bdev->channels), GFP_KERNEL);
 
 	if (!bdev->channels) {
 		ret = -ENOMEM;
-		goto err_tasklet_kill;
+		goto err_workqueue_cancel;
 	}
 
 	/* allocate and initialize channels */
@@ -1389,8 +1389,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
-err_tasklet_kill:
-	tasklet_kill(&bdev->task);
+err_workqueue_cancel:
+	cancel_work_sync(&bdev->work);
 err_disable_clk:
 	clk_disable_unprepare(bdev->bamclk);
 
@@ -1424,7 +1424,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 			    bdev->channels[i].fifo_phys);
 	}
 
-	tasklet_kill(&bdev->task);
+	cancel_work_sync(&bdev->work);
 
 	clk_disable_unprepare(bdev->bamclk);
 }

-- 
2.47.3

