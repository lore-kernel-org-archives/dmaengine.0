Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62F6383C93
	for <dmaengine@vger.kernel.org>; Mon,  3 Aug 2026 10:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753131; cv=none; b=Hlq24eM3hsTGBRzxlczoA5nLkFUUk0t8nM/Ux8k6s4MXMaTgtZ8s7Cj4LWAA1nhtQGV10we40NF9V1QQGhMzp7VuP/p8pTozInY1Ryubt4KCSeyRXqXthrwhLpdexb4Q4GBbxxu1KoFpLN1bTlidQAVjHRGCWXWfd4Avs9YqtW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753131; c=relaxed/simple;
	bh=YQodrxLZXGti3XmvW8nwU9lpi/9j4ifCS2HxijUaHDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pfUl6INCAFKvf1lVTOY3jYorpx4J8TtkAwCKFYoa70ebSTqA7RFFO2aX5tyNcDDVKXlg9pjn5iV8AIm/eTZ2wOsGAk+lFYWlc+vU2LaO6PNGbmH+JtGy2Cmr7cZwwqIg0mU47ulEZwclw7yf7X+VahyIRvqo2VLYP40bc83YFuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vu4Jb7gB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbIdnpCd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vu4Jb7gB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbIdnpCd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736kqQO4123749
	for <dmaengine@vger.kernel.org>; Mon, 3 Aug 2026 10:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhWKGvX0bNeNwHOozHVzgVNQHnYcAVFkH32Yo6rHh38=; b=Vu4Jb7gB3declPWK
	TI3ECB0a8FvuRnE+D/jzRkJmWnbzJac120CngS1IhSZayxc7b9m4tP74KA7HjzI0
	+Hr4EmydHJ/DbcOv5kOQ83iOgtoNvmG06zuFKdriQHYHbp1PSU3aENjow4ucZbmg
	DOidSr8lKRiL8ntegXqq0+5mO0vfXX6G+6pZvhhQQO/38cQ+JB8Kht/drncw1GGJ
	+kWFiQuNIvA0+o773xfVNWk3oNepwb9E151S+Ji/WULvobiHMp7evIdT5hIBn+sx
	4AjzSC2+A1KUEa0UKvSnu4sYplS7jMo07ulsrleYdoBQayosyJwfNMx8AlFfhFyo
	jHfApA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp168ya9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 03 Aug 2026 10:32:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so3756331a91.0
        for <dmaengine@vger.kernel.org>; Mon, 03 Aug 2026 03:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785753128; x=1786357928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhWKGvX0bNeNwHOozHVzgVNQHnYcAVFkH32Yo6rHh38=;
        b=cbIdnpCdJdN60W+wVZCuB0cFQzbgYAr1ZjxF7W2lJuF3RhmJWtipwTtFi5jE2HkKEK
         NNbZb4DGAKPnf0/PBRLNXi8KQ5XvDl0KlMq4J6Wo9x1dAqt6s3d5mB05e8ib3AzIE33s
         qLLoWTMOdWqDkZm7yrgwmsrWc8mj5COoP4zLQo4miVdp9Kby9147Jv7inAnYhZaiTqQ0
         iU+JJ/B7LorBsMw5W+4CU7XAvucxU4I843UlOBuzAOgMn/Z2amTX+LGTB8Lu2MtnTbOf
         MHlFYOzzsZn6xnW+itjyBt+PQkquoJtfywPbf+ALq9yueIr1DjWzWgvG2ijvZ4aNJf1K
         YmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753128; x=1786357928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhWKGvX0bNeNwHOozHVzgVNQHnYcAVFkH32Yo6rHh38=;
        b=iRlsKvu/QjE99+2DAQV7AR+B2X6IUk8urMfru3HqUkRnFN5t/BzywKCJ4FstgAj6Y0
         k9QWMg/D1x9Bp/YB8WbdxCMxrW7zDqXna6c9kYn6IRNf3bUQpi5v7eMgi/ILe6Y7xVMs
         u1n487sSQ8th3NLI8Y34nob84a9J0cPyeuOeO3dr7JLDZ4R8S3raGWAxRm3NuC6ZYvlt
         UuPpkLK0nBKcNcLDXSx7NDdS/hyJy+VMzwLpYRXNpVjDuwjEWrKBs6ktrtA9xeprTxeo
         ITu/11B5ZKhJfCC/GsN8S34rE7YuqOuM1k+ISxXiebeXdgVfyjH7qB2yNFmBYDLMadxM
         Sjiw==
X-Gm-Message-State: AOJu0YwBJpsuWKBwQK5xOi1lpUVZ4aQ0joIn/lsNg41GPr/XxVtUvb0/
	3qtH1ehBDD2xBhzPq0x4NmlQdMMP6HJPpsaItkt3ggOpRANRs8i3+TSz0ky6cIJj8enz/t6yTrc
	XG25bVLZcLBT7lcApFJZncVYWdFnFUNX4tYibnrxpf7KBsgfC3oln1fIV5nK3FPQ=
X-Gm-Gg: AR+sD10ur0x7xEOY0YUxEOyjBx4c+tsj2BDcthfpWH/YCTQQoAnxPh07a862dSKxFpj
	FzwjyRd47yaSXjg0/e6L7laTHDnw+d6MUA06DrdxuNWrahuAUrrLYzmSg5YnaxstC9qEwYuTor5
	TV/rqjiCQyu3cGtEiOK6vvCa1zrIjj/ETZJDui9sVN5j9cvEl/Y9wvaLtnsqXX+oyJI6LeMPvIT
	4AsNoDd5WAQ22HG6/NHaNlUnPsUGI0Q4VZJRM4SBl2JbukN4CmiAwN+8ud5KVZk20LRJr2H8FTr
	b/hd/USLlcqP5BGUdvf9HhjejO3nAvcvCji5gXiSUTGZcXPjeanJAjdo8xrhlG6Rb5cejmNZOXe
	w+MAD7cC4wQPmekJiF2BcqhzrmQ==
X-Received: by 2002:a17:90b:58c3:b0:389:8f6c:4d59 with SMTP id 98e67ed59e1d1-38fbc4bc3cbmr8623155a91.24.1785753128250;
        Mon, 03 Aug 2026 03:32:08 -0700 (PDT)
X-Received: by 2002:a17:90b:58c3:b0:389:8f6c:4d59 with SMTP id 98e67ed59e1d1-38fbc4bc3cbmr8623122a91.24.1785753127669;
        Mon, 03 Aug 2026 03:32:07 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2b1244bsm3693427a91.0.2026.08.03.03.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:32:07 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:01:45 +0530
Subject: [PATCH v2 3/5] PCI: epf-mhi: Use a define for the DMA transfer
 timeout
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-dma_multi_sg-v2-3-c12bb05e42d6@oss.qualcomm.com>
References: <20260803-dma_multi_sg-v2-0-c12bb05e42d6@oss.qualcomm.com>
In-Reply-To: <20260803-dma_multi_sg-v2-0-c12bb05e42d6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785753106; l=1737;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=YQodrxLZXGti3XmvW8nwU9lpi/9j4ifCS2HxijUaHDk=;
 b=rcBxb1zUyIP4s50AcsJ6tkSwDs7jalf+WtVec3AVWiM+5ZsHiNUzXBYpOlzh8jiw2Jacuj4Ec
 tl6wkE1qXPxBIdwVaF+mpN3ZJYM4JlQEETY7EYgWiO8hxuAAq1WXNMf
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfXxL+R5JJ3e0kg
 gr/zXe8l+RMr6cIdPg/iGdinx8FymfNmoNXDuXtr/VIuKKsSJT3gpL63kyxUAadFXs5in6gepA+
 +wfssUXinF6qr02OMHlTob2pAzqOGpw//QI7snNup+mV1fjqaFINK/7EsZe6CwaQCRzIEVprRzX
 DWAz7YtcLxqO6Lz7e2FhxTsB98zajyHG2h+26gnLUmAmRa4xpOSVOhSUcEENvP41SA1c8xTM/E0
 Y+vQ4Zuvw6ZIz7PZq+1QhHRwuB0dybROAXZvCTe8ga4YeQz5mVkuOnmtwMl0dOfj7YNf8Ouid5N
 yFue33nZoRuuvkajL4RU6JafFwWLFqHRIHjmrlG7H61JfcZIGC2FlIjdZ1qqVJ4L2w1tIqu9odQ
 2Wk/KP1l0OKQ+YLZZ5mYt3SkU75ozPWPvMqx/LrLXphrIBn2KSWRnzthoC2izI9TYs1nqm9RSM4
 A/t57ihGdr5GbazFocA==
X-Authority-Analysis: v=2.4 cv=Wpob99fv c=1 sm=1 tr=0 ts=6a706e28 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=K2uzCxK3BSS_9ZXfCP0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfX62yrqm+UjCa1
 +Y+/Y2JfoLMECHdaCKOeYgGPfI2dX0ndldrwbT+ybJ5soeKbPpGlrreqtrsVMXFg62d8SlrH6LR
 ygVPh1yBLurI3EQbISxKi2jq0Q3zpbM=
X-Proofpoint-ORIG-GUID: C-VIbz6A4FNFQXtfc3APfg7Amgm22fQg
X-Proofpoint-GUID: C-VIbz6A4FNFQXtfc3APfg7Amgm22fQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030094

The eDMA read and write paths open-code a 1000 ms completion timeout as a
msecs_to_jiffies(1000) literal. Replace both with a
PCI_EPF_MHI_DMA_TIMEOUT_MS define so the value is named and shared. No
functional change.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index c3e3b58fb86cd75e175b69ca45530610c500b99e..6bac69fc84b472c5f1abbeede2b441b5db73c784 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -21,6 +21,8 @@
 /* Platform specific flags */
 #define MHI_EPF_USE_DMA BIT(0)
 
+#define PCI_EPF_MHI_DMA_TIMEOUT_MS 1000
+
 struct pci_epf_mhi_dma_transfer {
 	struct pci_epf_mhi *epf_mhi;
 	struct mhi_ep_buf_info buf_info;
@@ -357,7 +359,7 @@ static int pci_epf_mhi_edma_read(struct mhi_ep_cntrl *mhi_cntrl,
 	}
 
 	dma_async_issue_pending(chan);
-	ret = wait_for_completion_timeout(&complete, msecs_to_jiffies(1000));
+	ret = wait_for_completion_timeout(&complete, msecs_to_jiffies(PCI_EPF_MHI_DMA_TIMEOUT_MS));
 	if (!ret) {
 		dev_err(dev, "DMA transfer timeout\n");
 		dmaengine_terminate_sync(chan);
@@ -425,7 +427,7 @@ static int pci_epf_mhi_edma_write(struct mhi_ep_cntrl *mhi_cntrl,
 	}
 
 	dma_async_issue_pending(chan);
-	ret = wait_for_completion_timeout(&complete, msecs_to_jiffies(1000));
+	ret = wait_for_completion_timeout(&complete, msecs_to_jiffies(PCI_EPF_MHI_DMA_TIMEOUT_MS));
 	if (!ret) {
 		dev_err(dev, "DMA transfer timeout\n");
 		dmaengine_terminate_sync(chan);

-- 
2.34.1

