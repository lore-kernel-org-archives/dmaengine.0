Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9D447F2CC
	for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 10:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468415; cv=none; b=PB81TC7MIp6cNQO6wOdiU/J+Bz5mH2nsiPQmEXyAfwHwchlPWh0KWcgpB0PeCOGTgnFNbzbIvcjT72tGcDYga6B6jN0b/ccYohXEcgxQC3Alqt5KoOp4nO6JiyibPF8vfYgbjZiKI6MP+SfhGd6kRhRCXrjGDZSqYDo7u/oXy5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468415; c=relaxed/simple;
	bh=HdVbv25549gC96kYbLnDlO3NtEiaAkeg1ptsK3D4fGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K4USz81EuWin1/Iqv4Iu/6aUTBFZBGh/utUlac1MWnBpXm02cbh2m288dip3cZlr0SRLLMp7OEnS8SAVVTpit277RRG/uVKTAw/NhCjBym77nPIwQb21h35eQ4a4Zmevb4MRim07rENWoJgMO1ZgrPioxIiJZ6po07lgrZA28pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mrNPSel2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UX1JqKXM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mrNPSel2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UX1JqKXM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9gvHi2584523
	for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 10:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+nhcbIo13/RQhS94ysjC9Pcq9pCsuzSG3P5Q3HgXTjg=; b=mrNPSel2KMjzeUyZ
	5wv2ollHGKv8nD1sH5YNFiZtJ0kFNDaasquSN9wBlPg8u+yqcPQFf741XGnTGUxf
	ZCYqB1bEk0H5oQIoTyRYDArjTJjC4gia5HQJmSXOxTQqyy3uZCpUZb10/awjlc3t
	fkf1IRST4xJUVJ7N21tQxKodIF0u4jXxG/Xns7DSoNeFddwhHjFznDoHeQLFAP02
	HwK1MnJZySuPjjtTaPTYpN0KKBppj+H+ZZhRTbb/ObHCdeAxnSHv2Ll638N2AuTX
	BEzeWlTPv9e33+MmaXDvk0QXP1WNNTkwrOt95AOqaPEKEmNKwBc26SgxcrvKx6wl
	7AqPTQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s9jcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 10:33:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso8761952a91.3
        for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 03:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789468411; x=1790073211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+nhcbIo13/RQhS94ysjC9Pcq9pCsuzSG3P5Q3HgXTjg=;
        b=UX1JqKXMNFcxNtyYuId6vR/sqhGcNgE/1LxNQvc/Lf9tc0B3wCj8CKpbbT0dryxex7
         Aq7oBw9yjtsmUO6IHtChE33jmgiQB2SjtrY6RmUN3wYZMdOZGdWgDhQlBOy7GXSsN3RY
         szMjBOR0B9Slg0bXMdsLfmlUp8YMn84SM+/Zx/UpUC3BbI1wn42eyrOVWBMLaWs+F0Xm
         H4rveeCqkEzBBfln0G+n7ab5F4reI5Snc0M9SkIGAYt2u4M4HFDue+33H3m1gsiezwk0
         DiZF7//ntKIvIFQD8Hx8NwvY9OnZawWF1JlFgA5fvw0ZbrTjEtQNrZmtniv1mZJTmGfO
         BofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468411; x=1790073211;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+nhcbIo13/RQhS94ysjC9Pcq9pCsuzSG3P5Q3HgXTjg=;
        b=CPaUT+sWvUC/ZkTDeiGP66uIIlyKv1Ap/MvW8qOnrPSS/Rx8lE2UdSXyupvfjKkjcF
         1Xl6D2+30DRrXQuitxwJTgtI5vtQz4oMNEIw5KPBzQvf9L+IGOAJt/zMvgf+8mbmYZMK
         /h9fQleP/nucL49nRZFImlJBxw4yiiKuj4gb/+GSC/1sijA2N+NR+inNgL1ThL6NbX/F
         fgWB3v7G5BDhAH/Ix+/NP7zQK4jKUFU8y7gCD6U210nrLL93WVkrL6sly6rg3DMjyPPo
         joEPQk6VXV9FiyUMgEjzkrhdlOGzqAmf4NK7umaBHTqodFGabinWcjPC6YOO2vgQD8mm
         l+7w==
X-Forwarded-Encrypted: i=1; AKwUvBx8kql8vIRVrQYzAGfGUPrehhIarxuMH1IhDaz2E5WICFGfBAdq56UKF1xxP2m1zLInnyNksj01Csg=@vger.kernel.org
X-Gm-Message-State: AFuF++kHFAYgoDVyqL2CIGC9uBnZ1r58zCt6SxrqJbnbP3hMP+fbfPgQ
	EW0A9u6a7Fpqe/PIYjeLR68PFL5yuJu3QXhF9iz/ArVoVuIV1u6oW8m09xNilRiAZaE7EZ6TheK
	S+X5JLhgaxOoNJzwF14l5d026VPFlSU1FSdnCAPaR2aC6Q8awqGcYjqC7uHPBwSk=
X-Gm-Gg: AYBFou3/nySlnL0hWNhpV3lPAFOY3fUbd2+CJILUmMQXKDe+YPykv7DsPqS/kTlqoOi
	LPRa5PnUeVpvV5QLp9K52toWabcHuEuxiDXzhn2dklgz9TCGryftUSXfTCOee2qlchREIMvzFet
	IBznhT6CU4NyHPwUVhmyI5FRVPCeU1LkPVXlZQftqXS/UFX8kAvs4D43HKY7B7Zdp/7as2JRUus
	NxktKg3QkO4FfTarMf7LXYyWSUzBusP1SnGEjYJi8XZDMR2VgMtU9e7RQB8LuYuF5GhLZyjagzb
	488sjeJ4IAJsupZcM6zKmuzlihCo3B8Z3DWuqtTpFuF7JNFUeHm3/E2DzYCfHG3Pm8fAMEFLq9s
	5tHdVDCLlTViIMuzu2fGrGsZx+MpGGdAGoQ==
X-Received: by 2002:a17:90a:e188:b0:398:b88c:2b7b with SMTP id 98e67ed59e1d1-39debf93d89mr16403193a91.8.1789468410959;
        Tue, 15 Sep 2026 03:33:30 -0700 (PDT)
X-Received: by 2002:a17:90a:e188:b0:398:b88c:2b7b with SMTP id 98e67ed59e1d1-39debf93d89mr16403129a91.8.1789468410543;
        Tue, 15 Sep 2026 03:33:30 -0700 (PDT)
Received: from [10.217.222.20] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ee07f2sm30101513eec.18.2026.09.15.03.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 03:33:30 -0700 (PDT)
Message-ID: <9b8ed8b6-4fa2-49f6-8164-6c705b8cf975@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 16:03:25 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] dmaengine: qcom: bam_dma: Defer IRQ trigger type
 to device tree
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com,
        "chris.lew@oss.qualcomm.com" <chris.lew@oss.qualcomm.com>
References: <20260717-qcom-bam-dma-irq-trigger-v1-1-6405eac86f00@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-bam-dma-irq-trigger-v1-1-6405eac86f00@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE1MSBTYWx0ZWRfX83QAuuJTTTkB
 Z3Hts91mljs4aQaifDx8fFhMHztaTBQdYKRcRjWpeoMJw2nIH/dYyClFc5dPd8N8PTjnQTwjAh8
 65PTvAir8sj0qy5iCOfO/MBRWPjFQwQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE1MSBTYWx0ZWRfX4nee/Mla9Xkw
 AA7r9kYaKwJyshxr1p8Hct1grsAJC14ozO3WcaATJ/aoNWAFjCYvFzW7WqQhg8fKv1cHXMx/v6F
 c/gOH+wiwCa4Z6bhBEzU1wOoXvyP3L8LYM/qz2IIwIcpKilC7rFcVQKGsLF4zGH9UWbsj8fcETy
 WDSV/shF4xUdYekGrLSfITzPRilAHq8QsXq96KBZyoz3uIy/y/gjQTzXHTKdQ4tFEoPeKtNDuVd
 0PyK2/qzolLZ6D0PcxBod9qLddhtdfL3hvpe0TRemKfktMYIDqcsF5FRcxaiu0S0y8p8b8aYGgX
 R3F2/ZAfgSkQJUj+RYtJyZoMY5GneqT8SeyYSMMCaYISTU5dc/VY9f2qIo9JA1wGQTTPBFgbPJJ
 rmDr575LyQF8mUw+q/h17E09Ig4yEFC9/g68FxlOJYpc4ANUc4VK1T/YXG5tS387DcJTvW4rdwJ
 3A3cdrutJDcqiUgh7gA==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa91efb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=iP_vca1yj_mBCQa1ra0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: bLG7F4RlgfIL5wn1KwPGok5rHkL6vPBT
X-Proofpoint-ORIG-GUID: bLG7F4RlgfIL5wn1KwPGok5rHkL6vPBT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150151


On 17-07-2026 10:30 am, Vishnu Santhosh wrote:
> The driver hardcodes IRQF_TRIGGER_HIGH when registering the BAM
> interrupt, which overrides the trigger type specified in the device
> tree. On Qualcomm Shikra SoC, the A2 BAM signals an edge interrupt
> to the apps processor; registering it as level-high causes the
> interrupt to not fire, resulting in missed DMA completions.
>
> Use IRQF_TRIGGER_NONE instead, which causes the kernel to use the
> trigger type already configured by platform_get_irq() when it parsed
> the device tree interrupts property. This makes the driver
> platform-agnostic.
>
> Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---
>   drivers/dma/qcom/bam_dma.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 19116295f8325767a0d97a7848077885b118241c..6c3e2ca8a572fd04c925de0adbd5cc0616b361ef 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -1303,7 +1303,7 @@ static int bam_dma_probe(struct platform_device *pdev)
>   		bam_channel_init(bdev, &bdev->channels[i], i);
>   
>   	ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
> -			IRQF_TRIGGER_HIGH, "bam_dma", bdev);
> +			IRQF_TRIGGER_NONE, "bam_dma", bdev);
>   	if (ret)
>   		goto err_bam_channel_exit;
>   
>
> ---
> base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
> change-id: 20260601-qcom-bam-dma-irq-trigger-0366e7e86f17
>
> Best regards,

Gentle ping on this patch. Could you please review it and let me know if
there are any concerns with the approach?


Thanks,
Vishnu

