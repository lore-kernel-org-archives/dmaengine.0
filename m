Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6796481FCE
	for <dmaengine@vger.kernel.org>; Thu,  8 Oct 2026 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453292; cv=none; b=lDJSzpbuIkx5x9Ynz1TrM/1ouDeIj6dZ+rt+10s8t38kAt6Nm4d5dNJ5qNV6w9u6VYPF4j+H22KWm4Lf1X1RxNTCLx/CRLEdjDMdQX7cfAgQvB9oLa0wXZW+Bugqytor3Cr94FMj7WSowDIRhPNR48cp8pEL1yrryJ/nyxr+8DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453292; c=relaxed/simple;
	bh=WoIxhrr7f+wE733J5ZFZBWruoVf6T2QOwnYkQwuusp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eEA6sqWrQf8xXec0ELNLsDF6RKzA6ZCdyx0qw9nyhaR+MxRo81nVf2hv00BdKC02+byiMODCO6+bGIHAcayW0dO0hS9sH0Irm6edydsJMZaPlbJpR6qh2UTxJdL54tshcLsVkwZFbELBXheZkYettGonunDHv8ekPK90uZWHI90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cc7y8OT3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fKzfExx3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cc7y8OT3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fKzfExx3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KbRk730871
	for <dmaengine@vger.kernel.org>; Thu, 8 Oct 2026 09:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZrNv06wEwcn2dtBbCxQceU
	LrdDbvkly4cVLcPiK/6zs=; b=cc7y8OT37JOB+vFUanfUzuS6nhIk/b0RwDsw4c
	GytvRXYFAHA0QR3NiNFBrXyPggCMBNjZORcdnaF6xMBjAI0fFdTFpsFttRIylOgq
	kKKvZ2+RnbiCeLiHcidSlnINuSeHLK5CXe4TmOyD686Rd2bn4r2wQRwFPh0xUpxU
	n/Kn7pcE7/fu1VMWSZ3IdCH7z+AO9+rPkq0rEG2R7xO+uH23Cz8zrGh3DMODNPmG
	gPO8TFOW7W/5v5amDpJjWTVsWUC3p53/qAtD+DA3Ea2KvmN9V4QqTa5QRhMGhzG/
	HHGTTxDI86gw/7XFT6CDijIdzlAYoxdvB95g3Q1lyL3tFugA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe328ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 08 Oct 2026 09:54:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so888249685a.0
        for <dmaengine@vger.kernel.org>; Thu, 08 Oct 2026 02:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791453289; x=1792058089; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZrNv06wEwcn2dtBbCxQceULrdDbvkly4cVLcPiK/6zs=;
        b=fKzfExx3vavuYnsP7W5WS+aIHNS5si5ydjnA+1LUEnR3Rah0h+vJI0fGm+o3bQ8vcb
         fqG1sqGegDbzNcunOiHpVgkwfaRHF/zovsvm7qCnjG3FDbQcHrpyX8/Sz+T2FeE9dDbN
         wHNlbpaTgCtuopRX3qaZyBzTZiH6C0N1cR4HNEqFV190szUEHSdIGBC7KblsimSI2p6F
         kyoX/y58646r1R4L7iTMjTV/FJ6OGGVqeWzjYtWKDeG4OdEM56bQVvgMoJ1oYC4O0Gpm
         7pHEsqJlWiTo0LGBHCOlsIbKXHiEJ1j80OaP2xN6EYTOzWhrvjSplALoYYOGfUa1AO+Q
         J+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791453289; x=1792058089;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZrNv06wEwcn2dtBbCxQceULrdDbvkly4cVLcPiK/6zs=;
        b=gTRtHs120oX+c3R10VgWyb56FM+rbLGxdTVkvgQw+T5mDbYUXR0lQjFS76JAUIvE3X
         4VdDSfmSfxk+WDzzWp0RYKZKTYNos1MYOb1CzMWf21b+/1uv2fzq2eCludm+Xq3n46/c
         lc5UUAUjH0+VJ+QfpTuJSVg04iOWIC3TNoljSdhbpApWupg/gbbBZpScTChvksA52fsv
         gSz9fWOPxT5jz6DcOZ+gGgplMs1ZXlimg5Inay/4PElmHa+Z4tT/TDyqoE5fqmSFZqf0
         aCpUi04SxTeOSPvFNBUBdYOjzcI1STw0a/eHdpdBy60UlH2EuBBPe5Z+rDrrovluqdNE
         YYag==
X-Forwarded-Encrypted: i=1; AKwUvBwriUFZBkRlMmm3HMBe/BcDtDkoPc3Gq/8D9CW1toCtgY0PQYuibvA++fZj37Mrzul/R3ZBXBKi2lY=@vger.kernel.org
X-Gm-Message-State: AFuF++nUpt1tWXLnRHRDg8XDVf93uqDcHMIFXKC36Gy+7cwGySVQtb15
	P3JyHz6lZjbL1/tFsxLxjPz6VG9jXDcEZCaHmUff0hkGB4AXD3BEKPODQLvGCAQ7OjZOrJ3eLDZ
	bBrd50y0TjhAd7cPsNO+Or5QrPY5fGhUVNYGwA7RMzXOFxO4P4FT2bJbP9FgWwU7OUnskCDQ=
X-Gm-Gg: AYBFou3Hfm3atD4Y6BJXEfXSP1JWZnnng7AItR4LqJYocHffKdGyVPTMIV+8nq4Gt9M
	gW+KbLa8srx9to/dFHrSauCXZOlpT/Fl0/iCt1iKaOy/igd99J1puiZ6mzg6hrfZrglzDMzm8m3
	eXMHENWKydhdNibepsw7eeFgHbD1t1N1B6+GIqxuOldtbbwaf47rS46LG2XwETRNuB4Bpn6rIOg
	siWmirq1xvIoNbwXc6zJoBEpT9AdY085pg5jMuXVOjKVZ+HdUkfMaeUGcNbFI/RZj7mgNC+hsag
	sTaDRAdLWEFR42I8R+9nXxHVDBdidlFAkb/lMkP93s142ZNg+5h69OZE+enmS0/4TAlU91svRrr
	aorxnGU5820gYlogqHaQA7hFDehQRslefK4vHMzzbaCBx3w==
X-Received: by 2002:a05:620a:4614:b0:93d:92a9:1a5e with SMTP id af79cd13be357-93e9b7e1609mr922150985a.37.1791453288751;
        Thu, 08 Oct 2026 02:54:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4614:b0:93d:92a9:1a5e with SMTP id af79cd13be357-93e9b7e1609mr922148685a.37.1791453288270;
        Thu, 08 Oct 2026 02:54:48 -0700 (PDT)
Received: from brgl-qcom.local (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a185d914fdsm83974655e9.7.2026.10.08.02.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:54:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 11:54:35 +0200
Subject: [PATCH v28] dmaengine: qcom: bam_dma: free interrupt before the
 clock in error path
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-bam-dma-free-irq-v28-1-5e5b10de441e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFpox2oC/33NSw6CMBAG4KuYri1pp1DAlfcwLkoZpIlQaZVoC
 Hd3YMUC3Uzyz+ObiUUMDiM7HSYWcHTR+Z4CFMcDs63pb8hdTQ0GArQUAnhlOl53hjcBaRYGbo1
 NK9CFTXXG6OwRsHHv1bxcKbcuPn34rC9GyJb2H402uOSNKlHIWpalFGcfYzK8zN36rkuosEUdQ
 W8lvSdpkhCbzOZS1YWSv6R8KxV7Uk6S1gJzAaBQ2R1pnucvkXhwmE4BAAA=
X-Change-ID: 20261002-bam-dma-free-irq-cac4b268c465
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org, stable@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3729;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WoIxhrr7f+wE733J5ZFZBWruoVf6T2QOwnYkQwuusp4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqx2hiO6lLY1E5ZIVelcc9HO02n3tNeJF4vUbMf
 o8L3eZcBMqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCasdoYgAKCRAFnS7L/zaE
 w1wYEACYD+TkQLeTpk583qpouhOP+tlVmU6vSqFbqLp/gpiVmwbKqwJMnOTtYJJYpfPh4Bb21fm
 UIKI9veN3yUyVp380JvWrGv4zJqYFwG8tvrpxweVbY8Dll8jpTL0ZyIG/NGVMFUggnQbzpndauF
 /TqCuLfPIrO3dwKWXgYtBGf6sZazpERwucq/xbG06nGlIBJBx5zoEwEF01BjPAfEzn9P/oYVVt/
 Xvi0MWiR6gpeSW8JpDj/HhLzGLvTBdQLTE6k/J6mKW0eg+SXo98s1Pc5V5p9abajlMKnAqKusc9
 gRDt5YoA7dt5KXxlH3M/BK64H08wj3LVJqjjYpj9FxuLI+jtiqToJF4Ms5z3bE/4seQPMdk31Pv
 pchP2I0Tt94tn0kj/K29ToJlyFAkCfsgDI3I+UohXBwar+SrQMHsbrhaZMwQtfT/CB9DvZRbMHF
 Q7MBuwNCy60DRReFG0A1lw/oSOAYtY5K/H/ymdwheIKlruOb7zivd24v7ecoySxGg40CjITq32p
 6DmHB1LGy250kWLYRlC0UvaG1NxaJbc2MpaxyUVf01IVCg0Nqdd4mVVa6unrINR+nlZOwG8No5j
 D0JKmXzPcCAMxaGi8RdP8r2cPVf787sxRtABBvn3+U+BS7hXJPbgzmDK74cgD7ZE18PAr9Uz7PF
 OcK9wQhdOdTCAsQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzOSBTYWx0ZWRfX7TwYSqemJKf7
 UO9JUHU/8HQJnLC7CTeijHlkg2aMUmskU1rvw0U8rHZZlJinSJSJsWn24OqrA5D13JgRmneGuPP
 Yh71WjmY+Dan2quXU5AFzYQEBQ4v5djpsrnb8IZTem8G2luDte80Pq8vGOB/ppmzuSBlU/+NIIW
 rM0+odvqQZuC84uyaDD4RmlTc9Y4K2PH/xCAlEzpnMPg+v+BeVQM+WCiAfqVvVTD/8YD5KPObLU
 wJqEkRsX7KC0jkkdKFoBc1iz9TB7B/9iN0KTLD+nCWCK+9XzyMgZvNmPvuLhIJlykFXyjPl5Vli
 eg+FlsOzGmvdTmUmZKVVVZPu5yhY+1sMVkp7gvcwwKSjmDWgs/M7DEGcGNap0VLDh5b+bqneBlH
 cQX4cd+DmDEaEj23cX98iSd/JxtVTRcS0ZL2xE6899nVn43NVIWgPqlnTzUjVuaYcGf8X9UUoLm
 N6qPTkbPsCaa+Ka2P0A==
X-Proofpoint-ORIG-GUID: tH7iXJtCW-ZiSq2NznKMyiDhZdYNKYJF
X-Proofpoint-GUID: tH7iXJtCW-ZiSq2NznKMyiDhZdYNKYJF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzOSBTYWx0ZWRfX8vchzqJ1Mg2F
 r06wqLk6P8cYUMkfMpYK6522bw8Mfijol9cc1rkldG0RJG+x1nZih3uRisbfVA1+aB2rzUixi0A
 VqX91HXzcgdd+5ep7L8UWQg8uJZkn2A=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac76869 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8
 a=sdHaY_b6le-me-Zt7agA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080039

The BAM interrupt is requested with a devres helper and so on error it's
freed after probe() returns. We disable the clock before freeing or
masking it so it may still fire and we may end up reading BAM registers
with clock disabled.

Stop using devres for interrupts as we free it in remove() manually
anyway. Add an appropriate label and free the interrupt before disabling
the clock in error path and in remove().

Cc: stable@vger.kernel.org
Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=2
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Sorry for the noise with v27, I didn't notice the change in dma/next.

This used to be part of the larger BAM DMA pipe locking series and never
got picked up despite months on the list. I'm resending it separately.
---
Changes in v28:
- Revert to using IRQF_TRIGGER_NONE when requesting the irq
- Link to v27: https://patch.msgid.link/20261008-bam-dma-free-irq-v27-1-660e70223e3c@oss.qualcomm.com

Changes in v27:
- Rabase on top of current dma/next
- Link to v26: https://patch.msgid.link/20261006-bam-dma-free-irq-v26-1-eef5c713d831@oss.qualcomm.com

Changes in v26:
- Rebased on top of current linux-next to address conflicts
- Link to v25: https://patch.msgid.link/20261002-bam-dma-free-irq-v25-1-f39e01d19910@oss.qualcomm.com

Changes in v25:
- Don't touch remove(), it's not wrong in its current version
- Link to v24: https://patch.msgid.link/20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com
---
 drivers/dma/qcom/bam_dma.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 94cb957d4b187704e207361d629fde00e3e090bf..f67a93a37d48cc23dcef04fb434d2613a1f22a77 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1332,8 +1332,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 	for (i = 0; i < bdev->num_channels; i++)
 		bam_channel_init(bdev, &bdev->channels[i], i);
 
-	ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
-			IRQF_TRIGGER_NONE, "bam_dma", bdev);
+	ret = request_irq(bdev->irq, bam_dma_irq, IRQF_TRIGGER_NONE,
+			  "bam_dma", bdev);
 	if (ret)
 		goto err_bam_channel_exit;
 
@@ -1366,7 +1366,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	ret = dma_async_device_register(&bdev->common);
 	if (ret) {
 		dev_err(bdev->dev, "failed to register dma async device\n");
-		goto err_bam_channel_exit;
+		goto err_free_irq;
 	}
 
 	ret = of_dma_controller_register(pdev->dev.of_node, bam_dma_xlate,
@@ -1385,6 +1385,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 
 err_unregister_dma:
 	dma_async_device_unregister(&bdev->common);
+err_free_irq:
+	free_irq(bdev->irq, bdev);
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
@@ -1410,7 +1412,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 	/* mask all interrupts for this execution environment */
 	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
-	devm_free_irq(bdev->dev, bdev->irq, bdev);
+	free_irq(bdev->irq, bdev);
 
 	for (i = 0; i < bdev->num_channels; i++) {
 		bam_dma_terminate_all(&bdev->channels[i].vc.chan);

---
base-commit: 53b32375c9caf793ff392f762236c90f2a062ae5
change-id: 20261002-bam-dma-free-irq-cac4b268c465

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

