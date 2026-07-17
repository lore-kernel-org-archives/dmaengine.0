Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C176B2EEE89
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 05:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784264452; cv=none; b=tI+hrkX95S9dLBd0jInsB8Mpw8/vqv57Sk8S34lhdmst4fmBV2slrREInQfbG+zPLtV7vlASs9nweKKT3nT8e0TYhoy0X+0gHau3bUKsHdIutWAuObWuiHK86SDoS+bEvg8dnGKPQbuQLxMke307OT/5cxUvWk97AAQuhnNv9Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784264452; c=relaxed/simple;
	bh=FKd7t1HooXBzJUHJ85dSD8HNImwfOLliShQOJb3PVNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uM9/d0S/EEGtAvQL8o7fjRsKiYBVDtyUCwaycWrVpNnoA5NP2PQxktLmS/EO6Y6hWMHonr5MPYpyznBffueqOODK5GTWhk+DO2fePna9WlTt3oQa51XLRGS2cEhJ5grVD09bMLFDW6wwYw2fzf+nQKIY83aEWQo52B+djY01B30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKJHat0h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KhCsfNWK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKJHat0h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KhCsfNWK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33prh338157
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 05:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HWoRzm7upRQHHZ535jwi7q
	OmB3+33RqDl00cs92ra4U=; b=XKJHat0hLXUlR+eCikK3lhtXUZnGQ8YdhKjweV
	R1KdanyGKPKIdEsKLYXZMAjZo6FGeI9FmqO9X5s0sPlhnvQFvWONgFrx7FpoWXKP
	8g2PNEj0MMkLSeYnGkadT4vdfn3VPU2UdIjy1p2DaZq2cnM6UcqXwMiAtE3cFgR6
	qT4wpbisZWO7TGNo+eslExdy6rfWSIT7B/y0E8e6F0ZDo9uZehgT59umu0uoJh/1
	48XexBiP4JWYgxCmiIQZT7NbqM3CGzpsDmn8n74TZHRcXx8Zhac4AFHPX76giXWZ
	6r8Di63vf3r7AYnxyLGOQbcu8uKs/HLelaXpPAH1PB71VLgA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1weang9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 05:00:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8485d853b08so3180400b3a.1
        for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 22:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784264449; x=1784869249; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HWoRzm7upRQHHZ535jwi7qOmB3+33RqDl00cs92ra4U=;
        b=KhCsfNWKfjW7shrb5YGL0D6CH0YxJ/e7RyblvWYcaHdOSeT+4sR3wrBouiVmWT7MBu
         COdBFR2J18IgTv1mjs4asKN6aL1Up7oNFxob+rFRuNALz2oabIFCuBBuQe03HPzHeZAO
         qJuTuf/oNOkj1L/mZKwK3VVvSVGaGc5FuK8bOQJ5PxbEstLGhYw/DKeXexdVS6fevRk3
         IxdQ3afcT/XUiYz87RMYk1XaaeTr67p+OgfmL2H1YdGC+AzCRo6QGszBl+h3cSi40SB0
         xPhfSV95fl2VdrVhY8/EcWJzMzkV3sgrm/9OvdkmOTcF4KeYpSvvxKUrNtJFa894v9gG
         YCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784264449; x=1784869249;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HWoRzm7upRQHHZ535jwi7qOmB3+33RqDl00cs92ra4U=;
        b=eG9nAVgXnxvY3Ur4HN9oyTzWsOUT33Um0xfzq+6IQg2zkIVZZA4ono+ZYIjvW7GLTN
         41mPAG2r9vyY2ej3qa5gxA4S2FgqJejcI2r9g3TBi3WYWCH9cZmse8N2WzmcD1o+mRRp
         BO0PQkmMZgOWIWsT3Rqg5jFOGZtgHUB7Pe6VqCZp8iUmTlJmbZ3z7RpoN4nlqSbZoMNr
         C9+xLYWrl6QQGi7mN14NDf0PPEFiMP1SWMVUDXe2aZYmrQXzE0XNVqnRBzLYAzfPGmIr
         DksAbKCqr53RRGEf2rm0+kuzdyofq5YrabCKPREd+PE/7po+6WNMUjrDRdBqKdYAX0dB
         8ZTw==
X-Forwarded-Encrypted: i=1; AHgh+RpMiwOG9Y59CrW6NeEiEYyqVLVK+ZCDAtX1RTir/EwRqdXR0RBgqp3KWq67KUAmLCQjp0fkMUfftyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSQsNaBLqhcJKMVsMzqDkRd/Zx0IbqIWG3SQVSQ9YhLMEKGFge
	mlvE6e56uidD5CkFgpnh1wpr+9uTounmwULjAvBKVv8wJeAZYvBtamJiehFDZ6LlOCh83jgbUuY
	A9fVyOxkUD47mdH9IirDaLTi475Bav2Nw9kPREbFmz1GclqN8cnup+u259nOexMc=
X-Gm-Gg: AfdE7cllU5LyCFPhMpUjzGUUnMTQhJw3tr9xFzxyEw0gEStQCIZlDXwtIgqUeQV9Smc
	HoKlUMf9moakKwliKHs77BMX9KmUMy7e4Uj+CId8uPZpcgoHhVdFX5rgdUYe0kn37k5z46zkHia
	FwdbJ8QgmrauCSabTuR2VnNPZs6s63mArjacs+p744o4zsDfs2jfZmXHWW0e2h/bRCDN7pm4cbB
	k+X7It7E6MBIQlHz41wVp3GBFyJL/2n2CcOwaCtX9U28ElF9YS7xgJA0Wxoso8WfXQgD/K5YMZg
	3PPYXiQhXlkCdNh0+FdtNNhkn3pawXF5Nih+B+jmZptqrzO/Z6HXuQNJzL9u4TTZaB5i6VNilqw
	kN+sIWIpaP4eJ8VcEt2xVXgFqBy1gT+/TFEzV
X-Received: by 2002:a05:6a00:76a8:b0:84c:2d22:730d with SMTP id d2e1a72fcca58-84c2d227e71mr230654b3a.29.1784264449227;
        Thu, 16 Jul 2026 22:00:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:76a8:b0:84c:2d22:730d with SMTP id d2e1a72fcca58-84c2d227e71mr230622b3a.29.1784264448749;
        Thu, 16 Jul 2026 22:00:48 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6e9a3sm244609b3a.41.2026.07.16.22.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 22:00:45 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:30:28 +0530
Subject: [PATCH RESEND] dmaengine: qcom: bam_dma: Defer IRQ trigger type to
 device tree
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-bam-dma-irq-trigger-v1-1-6405eac86f00@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784264442; l=1659;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=FKd7t1HooXBzJUHJ85dSD8HNImwfOLliShQOJb3PVNM=;
 b=tE8VbsxxjQ29/3M4t8rEtFvuMsat8ifrogQZXxtK+xgiqln8sPdO5sAHK+YqYBbZJ4XIdarK3
 jci/wLBWpfHAEnE+oJJTIM3XXjU5B4abGV8nDD5ulUbc/7y3sSK8iTF
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA0NiBTYWx0ZWRfXxnwsNx5ebGkN
 7MBLUApPgLl5yyZ1Ms3RncJp8N/fWpPt4Za6rhvs2US9+GL0viAMD6Z6HH9+H8VhDLm6gFTQ5mZ
 MlkFYZVac3Rw4Xv4QfveH57Q7JTwmZfC8dHu6q/m7KCAsXyGC+Dn7HfmTrNJHoQzf8elx8chIp8
 X5pBSaLcknziYvAQqO8jpCjJNYjEDTef9I2NA/fRhft9EP0haY9L8SZBzwmhHf16ViL9GzzPQsY
 K2Idpck9TERuvULEgr8uCzLR7/Iz0VAizDInVNGoVOYB43OUdhNisVIlPEK7yfinjcJKR3ikpsY
 LAIo52wHAXx5MtVRJJyOCrh30kSJv2zGEIrCBtMgcLGNfb/IUhYle8j9IQ8IL8PuhmEzasUmzI+
 Ec0JYBtUr0qXDcyVO/Qrh8Z3NLDME9WQLA+MHrKmdUbyIBB6IuC4ao2C5k6DIXvmGVjYZGl+2Zm
 5mMxDWP0KJO96sqXvJA==
X-Authority-Analysis: v=2.4 cv=JJ8LdcKb c=1 sm=1 tr=0 ts=6a59b701 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=l1n8trSoVLBZuIMzfdEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA0NiBTYWx0ZWRfX6YvDOyJVQQXh
 PqqKDbvRvjJ8HhTKQm+qAwN/ztqL10/AoTm9YhVF0g5F5/rcPSV7PUkC5W/JgoigRd1bTR/bmQN
 gEM8dUy842Lshag3PElsNWBwG+KiYfs=
X-Proofpoint-ORIG-GUID: xu2KHtk3Njc1O5HAT64u8ES8Uiy2f-0x
X-Proofpoint-GUID: xu2KHtk3Njc1O5HAT64u8ES8Uiy2f-0x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170046

The driver hardcodes IRQF_TRIGGER_HIGH when registering the BAM
interrupt, which overrides the trigger type specified in the device
tree. On Qualcomm Shikra SoC, the A2 BAM signals an edge interrupt
to the apps processor; registering it as level-high causes the
interrupt to not fire, resulting in missed DMA completions.

Use IRQF_TRIGGER_NONE instead, which causes the kernel to use the
trigger type already configured by platform_get_irq() when it parsed
the device tree interrupts property. This makes the driver
platform-agnostic.

Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 19116295f8325767a0d97a7848077885b118241c..6c3e2ca8a572fd04c925de0adbd5cc0616b361ef 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1303,7 +1303,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 		bam_channel_init(bdev, &bdev->channels[i], i);
 
 	ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
-			IRQF_TRIGGER_HIGH, "bam_dma", bdev);
+			IRQF_TRIGGER_NONE, "bam_dma", bdev);
 	if (ret)
 		goto err_bam_channel_exit;
 

---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260601-qcom-bam-dma-irq-trigger-0366e7e86f17

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

