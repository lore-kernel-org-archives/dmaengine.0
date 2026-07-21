Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC95367F21
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640821; cv=none; b=pVdxMfQ1kenvVVLmlw83xs0siIcgfajTsqakp0xoMraSxbECyMcgeoSxXWJ+Y5mdMYFOz2C0kOcnmfm0G4KUeYWueWGmTq/486Uofgp0r847sP9C3HDueetQTeVp1GbjtAIZelPvcHUKvXusMRY9yr+XQUZVFcGmUo7ashDOOW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640821; c=relaxed/simple;
	bh=T0ZAEoPGlcD+MBsHOs7IR7iXvbxs2FRnDbpOdt9CWCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TsLDA+aLjXkX2cf9Oq4ZklLL5KD5qi1IBof0rgUJnECG9VA4AST3crrNx+meKcHTIYHavnqFnqEI0jmFOO64FnqanXUjbyOTDRT91Xa5lgY72m//c+/i0+M/0zLxAOsNNMK4sGmkhYfI06C1CNJOigKdmx8a05iRzCq5dacxQpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LKSOAghC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jc6OlpvC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LKSOAghC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jc6OlpvC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDM3001660333
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=; b=LKSOAghC2HImilNA
	Lf96SOlBGnNH3Eadxcr1JMPYg82Osus+TgkjqKIhp41d3SfA6/igmFKOuqmG+oEz
	Kn/7QPM+V2m2qpvkOIkxVWEFcae0YGAkuKYlAWk5/C76lXqMpZcv/8w+6KK8hHzt
	KRPb04jo6MOfFdIB9ujmDbbAEHJEIQ7JCqVxpccYRlrlUwdLHgfX8rQfQNGC8+7Z
	tNXtaiaelSEPIEvGN6Zm7YUKm3ROFrjEEIhc/r7YDnXdGyCxLx5IAsgzQbKKWxZx
	JKgpljcxBjbUbYY+uylULjaxIA/HJwbZ7ALNrvTPpL99kbIc5NXLCReJPypMDuKf
	+npuwQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9ae84n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:33:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c083f1818so150157261cf.0
        for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 06:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640818; x=1785245618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=;
        b=jc6OlpvCv/9s7cxjbZtRkWX9HCOcg+xkvPgh6cMns3N1zKPmVmVcMCvqBii8+ffs8I
         yRmUjQYY9EYxpazmcYN5inOm1aSKhgkCqNa4uuqV4IALt9pTbKDck7ybRNuy8PZk9KRS
         OPskE28KWH8THPl+Pr4ucJh3vgx0FjF08Y1zUoXbhqcHUCX+JrmSXdYv+54si9uR0pXw
         M+HcppE7eClreVZfcQn19w9lmZ8P+uPDvc9GQFFkSgN8dnQVUQ7uWdYqfUxEd3Y/KMp6
         OuQQNnczE+vuCLlJftxTMGH9QlRN5G1YemcRLgDWi3jOL2r3xcRYayALRq8pLF4I//Fy
         YqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640818; x=1785245618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=;
        b=JN4biqQV1fv5Vwy8NFr/8C0ZWeb1I89rlvGlDrTh9mt90O37IVeMgfNYmADJNND3RM
         xi/Dz0P8tc44sdwMoIbsRPjYl9L7vPC4OWBOcoN6BwdDmW6JZLi+Em0WGkVskTVza7s0
         eHiNeRBFJVajMGPLvcKYWNddw6aKwuyFC7P592th1LpnfLPg2DA1UJW6pzftYSqPnWCR
         Y69n/tbzW22a5od2JEfRm2hpTcVOU/bZVhp+mKCmfaOxPrXzb1YwYq666FQttQodvG1g
         OnxJC0N8V3wUAhbxcbiK01M7LKWvanW/C3ZRHCz9oG0P/5U8uYrBLDgt1bGrhiwpqmjF
         7g7Q==
X-Gm-Message-State: AOJu0YyBUt11Mr6M6cb9abrCHd9uyIVZsWDaO48AIid+i4Hfx+LdBX3W
	IFmqRCheSH1xIgIU3sNeRF8ty3TP5aSsZzaTb8JAM47IszWl7o/zeY2z93D+JzluB9wVDFM08ib
	kke6t9G72L+4H6tytsUukLfTzL0+xn8kSR44KL4QFCR2g/f3IOMc+9hOyjW2oCRo=
X-Gm-Gg: AfdE7cmUixfjwViR4z6wDo17rXr4jF5L+2ddJnWWcD8Z8UIU83Ls91Ik+BDPYLySbft
	oCcM8b7Ze03JO4YNczCvxVPFNkiFW5ceMHPuP9ZrYHv7uCxJF6hqUHr1vz5syLr1fscIT0Ymbuw
	8UtMgkrErAl6RLRVtRP23UtD2MIzUcQ178TSR3eJtH0DqQ1/vIBCXvSK/r7o5IUt+K3EDdmDBfo
	i0zOtANK4h14BXHylxVGFzMLU9aJRrJYEaWl3Xit4doHj9HHMaihVvvadpv11dYtqdBfHJfRMLu
	mpREqQ+EktzSE3IexoniS3UMwgWj/5SIo4Ql0zAj7mnDkQctKTCCjLkVuO073QbdsfpvVkxKPnf
	/FdR1WALu8PoWqfbCQvQ/VIHYakZuaw==
X-Received: by 2002:a05:622a:5812:b0:51c:ecf:4eb3 with SMTP id d75a77b69052e-5213c9e3801mr151088271cf.44.1784640818305;
        Tue, 21 Jul 2026 06:33:38 -0700 (PDT)
X-Received: by 2002:a05:622a:5812:b0:51c:ecf:4eb3 with SMTP id d75a77b69052e-5213c9e3801mr151087911cf.44.1784640817721;
        Tue, 21 Jul 2026 06:33:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:33:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:06 +0200
Subject: [PATCH v23 01/14] dmaengine: constify struct
 dma_descriptor_metadata_ops
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-1-1be02deffda9@oss.qualcomm.com>
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
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T0ZAEoPGlcD+MBsHOs7IR7iXvbxs2FRnDbpOdt9CWCM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3UdE56w2Il7jRT6FRLwWC7FQ2qm1Nq+0Av+/
 2hf/Q9hzPyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91HQAKCRAFnS7L/zaE
 wwHdEAC2F3MLYx0wjHZ8HaEGIrCSvI/zuYuUmsa2XRVR0dQHmGhJr0dBsit8yKEB9ukD2zh4FHb
 1VBJ2G79OlRyID2BNCTe113ahVUOymmJ7xRPMqS8d5vwCR9G3S0RLeiFzG+4RITX8ZnrQr/643b
 rsoyuf9H1PsagPrwJiOyw/WBWiP7wISuEXD+VhhglJQHrctc1aOAX65HZHEi6DZhJgwXDC9/wRO
 xttNtToOx7K76Dxv+PWpSoeSynRBsXkhgzE/FuCetUJt+OV2snZu2tgkrPbCNL16dfujQe7W0D2
 lqV92UnR0FSusawVaMDisWWEEsAU0828NP22C6mQkRZbBTbcJDV/rF1ZKuVMdlOK6ZDth6h1C2m
 gOSY3sV198Bb4A2ObPkzJ6nMh+92WsJp8crOzpnKE8p1ii6ijhEdvOA4FY8RBbeAzQqYjfirB02
 Rlzg3fEbrcgmiza/j9SaPBaIm8Ib60Il7hzaby9ho6VRdifwrSjukCwUmazyYY+5DUZeBvYhyy0
 7k7rrCAlSA2Bmy4p+6eNkUoGWk/fLa17MuG0vAe4rrLXdqm0Ei4wD3zwTgAQBCOaBvpThKpuqiu
 dY2fSoF2YvD0PiNi3T/uKql2eq9J7KRrk1CDlvSkDp5p9hmBTr1roP2iTeqzSqr4W6SMZpuVgSY
 BmrWspmX3eRNM3g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: RKgI49ifpB28sG5wx2NZbra9nxh1QDn5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX4Wr4vuNqtbmc
 cIPywuX+75NP1lEvKRl80/E6MoPGLeXeoLY0gp406fxBPslpAgy7K4xCJi5k7QobVJQ3e8ESP2Z
 cqpPL9xjuLTTgnjqOx9L2cE4xFm4y9I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfXx8UTsc7uyJze
 MmNC4/fsaGd67let34Of2fmIu7XbRpjxUAGdiJJjv+94ymA7xHuHtmmg2UtJ8+2l43bzSpAhPTH
 XdXCDfOzQZqvd/lm2WZE8PXUSjlmAJnzkUmGXIDN6EW8M0JWToPMr8lzUZxuWM1P2/yRINqS01a
 x3KV6X8MWmWlBf098/A4V76VvPkYj9KIl2ya7LHurOV7hXsQ5I9ySKO+N6xL/OG1RtKYXlI/9bM
 upThHQAseWSXoPlamVWZZocnwgtW2ld1rZeTjAMgmwp/ggEFSzQ8b2zvy4RrNpJkjh6ARjdR5dG
 vy8XWyrYN8IFQBkDZjtESzDgyu2ouDIPCS4fn64pYWv+ZNUUC+IOyP++oApX8j9+wrpKrY+iI+A
 h2JhtzZ/UhdGJMoB7t/mZJpLXnIHeYxywwZw6mr6XI7Zl8oXPWW7svyBWQb7dwr3YMseNFcAAFE
 Is4hoktn5CPXtHvTVCg==
X-Proofpoint-GUID: RKgI49ifpB28sG5wx2NZbra9nxh1QDn5
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a5f7532 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210144

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

