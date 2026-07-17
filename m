Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7789638D3E3
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 08:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277424; cv=none; b=P47qPXUt4YohiBAJRsF5hzE6M+eH7wCJwmsoQAH3+HNypN9gK0NIvmaWo65SxZhIAz4RZx1HOXFmxcfddoViFa8X37rDCXUzDJVslYdjSHMQOD1hTMlKv41ojR+EQMAMptJnUiKpWjr8EMiWxbbj+AyzkP0y0u91kOUV+GsAon4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277424; c=relaxed/simple;
	bh=wCpLSEqzl6yoBDde9p+VABZfQUJK0dP0DnJmF5kRzKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RiEh6Hk2Se5Q95JgDKEY+ajRqTZh4Jis3bqRmgYoID3mZN2mQzaoO1sGNdhMTtrIOrsbMON/kU3vQGujvxY4jX/yhNd+TWunguihKWRkvudvypklhHRtrTDpLbLMI3hYAoN3J0fwstFdBHsmtr3GkupN448vwtFY+5MGe66SLN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gg2fIu34; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jDSGykyt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gg2fIu34";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jDSGykyt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cHUO2098532
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 08:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=; b=Gg2fIu34xbbfj8OA
	dt19v0TaKmCyNsqs1YXGX7b6eNdZXjJpyQTH3J+wxRO0uaqueezvw2w+9RN66Hv6
	W0l5WJiq4/+Fc/Gw0EeECDxVVZgNAfn9qlvmITGH1WSo1zC/V8KGQZePH7QP+Euc
	PoQDNM+uejTuTxKAutrzpDyZv6hp5x+3VipDRd+ZtPDOa3GFHhTGE2OHu8jNSBcz
	JqqY9Q4b/HSpOXmyilpPDlLW/H1jKCMSPKi3hOjhBoYcJTFISAqnXQYKCzpR1apb
	pc23HN9Z0je2WjjX8uoaCCthsOwq2yUPfD70OOcnE188xLMx2j9bhgIUTNbjHo9w
	7x4KhQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6ju2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 08:36:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe3fa93bso155106981cf.2
        for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 01:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277418; x=1784882218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=jDSGykytLuGsQOWbcfKmiAqj6/98uZJixcJTQQ4+iECwUfxvDL72Zjpli9wb6P6m20
         XI0j9PtcNK7XyigxmtCMr2jWQkk3SVHCxH3+9dMCS66MLkmm8IL2YG01jK4wDGg2Nqm1
         85OdDAPdgQBTkA/a1n2mOoOz/UDgrpiv84iQv/Mn4Dhn/eJT9KcfAIb3nRPBtJV8raMp
         PpAAyxFDBYhctpbinWrNbEgygohUyszTDF7nSMPYqcjflZgvcsg/5YcgRbT/28Z/zftA
         cmZO8na94nq9T7S27waBo8JLs73h7AJJwhMlCwAJEGZlthBkWw7suPIstwrqWWwh0mEo
         k5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277418; x=1784882218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=q1LWd4OAX/77MEKsgE81SOHhJBk8dVcbA7CE7MZ8xO5DMo8I/HqA4MuRq1NmrYvVEj
         NCyzs7hAX0VqwWYOCDrNuxcuBhqP+ZOFNYa375YFmX2inAxcJ6OOpvWT/ZjC3Md+KnNy
         wvP6FB+0qsKBkSazV3P77qyAf7LNbIHBPTsVjvIA962cTCeHfye4ta0NbQmQ10nydr8z
         4ob1ingtw7+mLa3hyNVRYReowFEQNpQdeRX/qtfqKBeRsjcnQf9/A4k7t0FfKlEm8OuG
         sWhJTX4JbOosVHbxG0WbQYHZLTIkDIb96zQnrkXTbeK0Cupm7E3hCom+z3MscLEJ5VYC
         3EQQ==
X-Gm-Message-State: AOJu0YxZZ+1nncbiA0NzCq1+4lJYpgTJFiQfx8xFGsCgHgXLwoHIrGaa
	oJOMzJrP5qggHVyMFaUduewFYFDSH+MaK3aHCQdD1wdd26yjCs/Dh7VX1bLI/0KWC+t9q4lMbzu
	dQfssQdqK/yc+9IvDNejgxMhsW22PMcqfSBXY8Xo2QVe/TiiLec8REbEUFsiGH7Y=
X-Gm-Gg: AfdE7cnfk20PFDCcnRPJ4VTlQ484A/wrRhHq5FrJz/7p2Q6gGOvPymgo8zCTCREp0bx
	8xD4xpSFfsBt2ILFO7GL46dE0k93gtBi4fJcIQp4N9/H/ZaWkqwYBqSXH9D10dCsAdfI2cO5fwn
	TnY1I/Ri2wONnQ4WiTSKgRKyy75VyMpJl5GrBGXrVeJiku3E+oK3JULcYaWbO5QVoQqs2w9D+as
	LN639gPIRDDfBBtfobSZdOKQ8Y+UychKEoeRrm2kFAZFApdadVY6qI3v+Q6a4q124qFfqf3q7Ic
	K/t6U8Qi84BnmOgLNMCyWKgXYhHZsrsgRdKmwwNTpzxRdEyuZMKvg7+eRl8e3SCXd5frXY/SfMC
	Xwubhu6x3rJpkzQXu7kDqEp+WL1PhUw==
X-Received: by 2002:ac8:5895:0:b0:51c:7b13:62ff with SMTP id d75a77b69052e-5213f07a839mr12223731cf.85.1784277418437;
        Fri, 17 Jul 2026 01:36:58 -0700 (PDT)
X-Received: by 2002:ac8:5895:0:b0:51c:7b13:62ff with SMTP id d75a77b69052e-5213f07a839mr12223541cf.85.1784277418071;
        Fri, 17 Jul 2026 01:36:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:36:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:29 +0200
Subject: [PATCH v22 03/14] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-3-ff0d18b27246@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wCpLSEqzl6yoBDde9p+VABZfQUJK0dP0DnJmF5kRzKI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemXqINjgp7q9Ps4aTCpU63x396zfX76ER0nL
 PEUXHbq54yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnplwAKCRAFnS7L/zaE
 w4BYEACodtihodcjAOmf4SQNdnKJj1MDtzmr8CduDo0LVP5xpzBN4cW+Iryn04rrnH/7NLN7Dnc
 THDrA9/smhqXo3ox4l7Sp3oqC4KiMfPnwM/SkUsLtAmc4l96ePvFCy9VecYiEUjDIvcJ41wNSPV
 e56uyXLkW1JFg9xhYlmjehYbNr2eIYdC3VE9IlbCaqAjL7QkFiJQEmMQwCzQ3SlaN3l/k/s4t4K
 xAhwMLFuZUyF8Xljr7e/f2PUzgVeW0iY6mfvSB2w76fAzAsIS+L5pqfg7uTM4N3wV5DaOAXldVY
 ch9TkWQEau4Enf/FhO8Y+ZDA88mCgKa84UPTwPhtYDruA9jyEcOLJyrf0z1xWPSKSDvhyxq6q1P
 tdBbDWh/zNVJ1ug7/WdopaVLyYI8dihiP5SQpXLwRcaNVonJPPB+QP/INL6Ov+yXqTyZ3iVOclX
 a4fSVoqeUgShbEWjqTLIZMD3V+YpQJ7b9gkXjV9izBrjaXkpVljZzC174JGiAszUqWPMST7fT5A
 1CXdtM2l+1MiOBlMUFjYLXm2f2Jse3/jFpQ/deP+gji2eqJsqlSYJopJFGmX9B9KrS692ZTs4gi
 mv1HBdmH+Fl1lV8BZhUbxZJ3gwyDuoA4CkNIY9zbtOABg4YD3XSP0JVCGB5/v7VesiSU+ph/tzR
 x5FsRWwlnTOMvBQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX7+USCgXpB7vd
 AaktNBzXJLHP9f6bRzQV2ZDiYq9U0w1EVCMQLrKDXsdvoJu26L5BpkXtVgBc6LIqD80uo9avH/Y
 tKhK642Gg4SeSP0zQtGX2K6vr3vkf38Zx7e0DPx8G77pdE6JdGhfqVsYIJ+JEe5NFCaS/xnuHsz
 ScwoYy9wQI5kUWBpcncp5ZltcTp5OcziVS+2zzGDBoml/Vn66w2Ig4dQfRYDktpopNpVCaGalWy
 AG0uyupnyMI2wNPlgF379nkwwNTe0ZM29/CPh1v7MFkUjT8ZjEF8XEohtDaiyveoCDrvvfLNrGJ
 KkgINJFbiqzJQDarZphYYdRA1wOYAPuxOnYLxgsKAvuaHtD/Wvmf5UPsJ34t3R1rcxrTbt8Wg1L
 SVkukbegB5Pn2JnAk+afgWPV9P1acqGl2q0MwhUESrrWfrLLRwTENq5L2tNx1Hqpad6Js7CY7ku
 xWo2caqR6SBvknS4xmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfXypbKFxuvZ5MH
 v4bKaIXPFzI23NUOZ8BIOwaRWJHYXErIzGwR2HzOT/pDIw4GPJRWqnz2eaw7Efx74SBLm21yFyv
 YBNXMpCxIO/p2SDvBomR1cIdC/vAMZ8=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59e9ab cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: bJgpycVVQIU2CLbfQB4igW4Qe47ED4y6
X-Proofpoint-ORIG-GUID: bJgpycVVQIU2CLbfQB4igW4Qe47ED4y6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170084

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

