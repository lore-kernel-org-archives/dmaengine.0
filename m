Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D799E4EA383
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826599; cv=none; b=giZZlolt4oQvnpUihC0NhbRXtBQyBFkV0Y+R0PfNb7C6/QD4kHEb6V5lsEMJao0ILUJU2AGI3oTGcubEKYp+jAmoMka/7br1N9lBhWZdIGJOrnV8bPiUpSQt7JzCjd1t1ccAtVDKGMcKwtNBh/c5B0b8Zaxy2FSkuRihZQ4yVFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826599; c=relaxed/simple;
	bh=T0ZAEoPGlcD+MBsHOs7IR7iXvbxs2FRnDbpOdt9CWCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bn0ogAPAUhnd8cDxMJlaE7MdXvlEyklyyCoGr9Ili192ueJ3zaIgJSWinxWdoKS6zhnFP2GlZzfG/IeDC+nWETGdvcaL/Hz+fO6PrxTovV7Uhx9pcZxbs9DOVaaqBx5L0EYpfzC3DUvAdDGAO++2l2iN/2t1VJwI7/shFU/WoyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BRIiYJkT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AhDJg/wg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BRIiYJkT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AhDJg/wg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvH953951271
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=; b=BRIiYJkTaFfnRKez
	9LFca34yN9Nfj3m5sF2P56gkbbN9oknSm/E0BbCk9VnxVaFm+K3wQnLChMUqlpBa
	Ow/htXbwIqbth/AzJJJhRtn3x/oQg1pJKGPHhP+JWtmsc4mT2XpO66TLkKhI1MOr
	3g/SfVK8Eals9YmUrtalyfaDqBh17pxmMi4o5QeBT1Hi6+t4L/2XR+LSRFT08ZUc
	yOOaNJBxDcKBxhgJTsVuDeHXkDoIp+i9GVceMifFMS2/rsIeCFwzB5pPluWRr1Dv
	1H50PyMV5PD+1DAhJr6lf4K2342VuUWQoAii7Q8fLCy8QSQXA8avikpjL2U43+F7
	4ojt5A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkjnu9f0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:09:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5283fa0656dso13105141cf.1
        for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 10:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826578; x=1785431378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=;
        b=AhDJg/wgu8C4WPTLao861GdWzS0trNwUnMfbq2K5y8NHEalBJ9RxaxfFSca157kXTZ
         mh0S6RTi7JJlDBLYL7g1C2hUdE9PszzN1RMbW+DXKwAS12t+Axm0fwa0ezzWxO45brrA
         QKyKcc1NNNqfPpACZqDu5ier5LZqgWXPqXbeDPUK8Qcvv57K+XKENETbMkp3d8tuOu7V
         Ul8ruH+jqpo5Lni7+7hUCBbk6c/AyrPU7NER03qh5/SaPDNYI6aH0A65QceY0e+uBBzg
         8CucUIn9nXUs2xwL/tN9kWsW2KKWj8wRqexjpbs5yiSvWssLKQSBBeRJ6DEFfBYzrLDz
         Nguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826578; x=1785431378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=;
        b=skOqoMzCiO5T6cEL0mMXRktT2IqpWrfIo6Ajm59fGT+wSp/lUV08hwwwi3QqgePyol
         AsZwHwaiGnAUVA0iXxSYbbdz3oNtXIQ664X8ZhDbZAP+YdfrBb3scB8I9J2yHVSvm3hs
         t6lM6y4r350Q/Ne9xB7u/FmCelPz544dAMHAa9cpdo2EHTenMr37An3OXRuBHfald5qY
         bxgkQx5MbS/x2vzeQZ6N7ErPYhCPmFjRZNokTYdtxXiJYcRabrlDVOcPzHol3vYOX4Rh
         ANpAHx5w8t34u/HQJpGM0b/ulNktQcseRy7v8WIreo/eg7j5RdML9cX1+pU3Ww5w0a0U
         TQHQ==
X-Gm-Message-State: AOJu0YysyR7Qo2WGH4HviwPG5zDY5idQZF2GP2WwWPYfEXLZH+y85Z8A
	XFRONr3jhdPqfX5SyJ1c8HiHCUIpBe/4BVvXOd7ItCIgMAwFw/59UXupvnhq4XS9ExMnIUpqTXU
	BvFbs+TMiJs+sSOf8NqcbXnw9W5NoBD+sj+PDDM42FIpC8FggwEGb2X6aOCHMYUI=
X-Gm-Gg: AR+sD10RRWgjSViHYTWbxJN3jYUGI1Rz+dxAbEnhDi9aEkkY+lcKtPlLoFmzsS/ijEd
	wyna+d9spUV+e35lU+IMeHIzcBoHsmj/bBvF7IfIpIq7WWxsJDgHHeyvoZm0sgEC8FR9Zcr6xRd
	UOLZwU54nkyOUi0qFrxJM5TGyssT7xocKg9K5ZZ4SH6zKPaK8FqU80IvQycKrigs5BrYiE+QYgx
	BJpqO0x4FuXbp8wzuHZaj55TPmIl40iDQXYrupc8cABHh95qzX85ZfxlrroWdmeo+fXjgbfsT/R
	R+Ot4IlKWhxAoiF8XaLna2CnqDoaWgZbnqkqO4frYUg6XeNvypl0bTCCnhcVtUEYlOX7QC0KAM0
	2vcj5gVFJFHfO86QD7F2FCn8fBc/S
X-Received: by 2002:a05:622a:2307:b0:517:146d:2cb5 with SMTP id d75a77b69052e-5283edcea45mr34172391cf.20.1784826578440;
        Thu, 23 Jul 2026 10:09:38 -0700 (PDT)
X-Received: by 2002:a05:622a:2307:b0:517:146d:2cb5 with SMTP id d75a77b69052e-5283edcea45mr34171681cf.20.1784826577854;
        Thu, 23 Jul 2026 10:09:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:09:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:07 +0200
Subject: [PATCH v24 01/14] dmaengine: constify struct
 dma_descriptor_metadata_ops
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-1-4f87bb4d9938@oss.qualcomm.com>
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
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T0ZAEoPGlcD+MBsHOs7IR7iXvbxs2FRnDbpOdt9CWCM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkq+c6LBTlXt4m7neMwOdfL7vsgLIh7+nkKfc
 DNZ04kVDdKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKvgAKCRAFnS7L/zaE
 w76vD/4mgzkaYL3ZdWpQAtPUlCh/fnXkz4jgHg7jckJ1RsVEWNsBm23V5l3kePvG4QcjSJBhzXi
 GXtJIILk97K5O2f4GQLSAm4UFpNqY7TsCxsx9W7RSb+DeuzrKtmV9me1dezD879KziHuazLJJrQ
 FNm5zBJ8CRuHQKgiXgtciq0FnbV6vTsOqZtStN3VFaTkZNFQOjHecJxdl5ZpaDFNyaff3+juM2g
 QCvAIjcFhtGBqQb7YAion5P0AUKVs3r0/NX0J7XiPjH3tNKY56z+q3zT3shmLrbfyOPLhyKeGS/
 Ecpr9wENWIYKvJK2DRDtFE3MCLV8FuZYUqvDvxIpNvOTpMbzYdmBtYhoVFSPQQBPo2OvJ5dyOIS
 K5GmTrghS0ayU3SxKmWAe23fHFpoEUrJ/8N2dSFAfA9tHGC/B/MUv7qdhcQ7EK2Gxpuumfy3Xgi
 dJ5nka/napQyt//M+9enVm4uPqgrgHpcpt4A6r0Asa0XRybzgGowPMKkgDZzKgHMKKg4TgIzKs7
 p4lt18eMBbr6BrsirF8z4vO763JZUynWVZEvfh6eMwUp4smDmZj5p4EQuQBFFntRvEkRMFtbkDM
 wYWSCTH9IW8ws3sAAL6Dd0JVz+eEdwolFK2LOktJjfWgqX2XAICL86pWHXLBIl0xtK0AZw5i41V
 5EcSVG74U6om5iA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: oOwhQ6DNFEeTG4EmyqOQvRIRqrw74IJd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX6CbQv1sSNpol
 dKFV2x6VhUKTl1HnKqirYxvNnrbKFwnL0hykde3ndRiYgLfCg6zerXL6y9nOcI7j+cp2zt7YTEE
 AgvPJwYujZQpJ5IsFviCRSRfkL1ZV3/WIbEON40bLLZtuYWuz0Laj+Dzpj26HIpn2ehGudsoikT
 2fpsLokZYXCiV3hGpQJFE4LsWJSGDZVLildr/bcATXeWJRoXU2cHUgOPuYlli7wBPmIdlKqK+yO
 AgVKR3gi8828ORYJjtMJvrCSrxLzJBjUpidQZQ6bqVwGG4rEcDD3aaMQdXp9MWvWgP4ieimXP+y
 pcBTig3sfgCcAOw1BcAJMUWC6YelZJRLlIZ/Wk8LUFWySiJnl/uHtJRMMPQwni+SYHkj7mSxLHA
 DajcGFnTrCI2P4rkT0pbGW64nhGn0rNenyjLs8dTL8SrOw91GEaWj+OY+WqqFrm9un297ySSSe8
 TMZlWjBwzoLqUykSdKQ==
X-Authority-Analysis: v=2.4 cv=Een4hvmC c=1 sm=1 tr=0 ts=6a624ad3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfXwFV7dfHPCMt2
 erDf/6sFTtizuV/ehu7mM0TsaMogBAqF/yie5oHfHFDEuUrs8DfUznT1JiEEBuEOC3WV5ha/cPL
 WYKLpSLlim/8nHjAgijh2FjToOVj4XA=
X-Proofpoint-GUID: oOwhQ6DNFEeTG4EmyqOQvRIRqrw74IJd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230167

There's no reason for the instances of this struct to be modifiable.
Constify the pointer in struct dma_async_tx_descriptor and all drivers
currently using it.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/ti/k3-udma.c        | 2 +-
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 include/linux/dmaengine.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 1cf158eb7bdb541c4e7f4f79f65ab70be4311fad..fb21e0df5ab7b20e4e16777b5ff7f61d2ae67b2b 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -3408,7 +3408,7 @@ static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
 	return 0;
 }
 
-static struct dma_descriptor_metadata_ops metadata_ops = {
+static const struct dma_descriptor_metadata_ops metadata_ops = {
 	.attach = udma_attach_metadata,
 	.get_ptr = udma_get_metadata_ptr,
 	.set_len = udma_set_metadata_len,
diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 404235c1735384635597e88edc25c67c7d250647..165b11a7c776abc6a8d66d631e19da669644577d 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -653,7 +653,7 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 	return seg->hw.app;
 }
 
-static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
+static const struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
 	.get_ptr = xilinx_dma_get_metadata_ptr,
 };
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index b3d251c9734e95e1b75cf6763d4d2c3a1c6a9910..5244edb90e7e7510bf4460b6a74ee2a7f91c1ccc 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -623,7 +623,7 @@ struct dma_async_tx_descriptor {
 	void *callback_param;
 	struct dmaengine_unmap_data *unmap;
 	enum dma_desc_metadata_mode desc_metadata_mode;
-	struct dma_descriptor_metadata_ops *metadata_ops;
+	const struct dma_descriptor_metadata_ops *metadata_ops;
 #ifdef CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH
 	struct dma_async_tx_descriptor *next;
 	struct dma_async_tx_descriptor *parent;

-- 
2.47.3

