Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29B937AA8B
	for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 15:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570866; cv=none; b=smlOwx8XcK9hxy0/bYuICQ6hfKnltuEw5lqssRv2luN8vthiqdBsr5Sscj8zRQ1SpK+nD4L5la7YoFy4lneh0Ca5wefhbKtwNlmEsJRnujtJhNgMX0DBne6uZ27gJLs7KvaZBp6M12ZzAeWRsqMCEUJJKhzHspgSTFqzf/yjsLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570866; c=relaxed/simple;
	bh=bB/7vhXoE0ykCnHM97CE7sp1Ib7yxq2wNHywlTv0Aa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fH0SBDYAPY2inAVFbPGLItU6kZUMe9VoHuqVF8meIcPOz3tyat9JlYXZyEa1BC71V4qo83RgmTVrOJsTMLq53kAwpxXK8jfB8k8+PuRXTR03S8FJ3eh3OOd4YyFjQ+72+XB218wX8HXUE/feqAnV0DLtQ6vOiOgp5oUX78mDs1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vy/KB4PM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GR/ICxBB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vy/KB4PM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GR/ICxBB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEYlA03556163
	for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 15:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fJRqo4fa5r8K+BgNujQkH+UdzXPRZZmUzCKYh3BrEjM=; b=Vy/KB4PMrSnE4YBP
	uhs6xA+rnTaPv4eiMrIhJBSsNN4Eb7gDqLx56+cwHpnrYnFXKw4i4X50qfayKr+9
	GrcK/NoR56LaRU+jLnZNci+q28XlCssQUgo2umCirws3wKMinXfS3RtxGKXm8ab0
	QRQ+tKircg2puofY9y5V+G+On9bcEUnBoE42w4En1ywHl8Hfdr65kPdZwt3jLiTJ
	wl0BKn54B89Q9wJiNUJmwrve+8woMTmVLSN3tYvVZnxLUlEYRG8uavvGZNBZAd/4
	lQS3eHfkqMdMjI6Kdy//dQMEZ729UGXdhGg3LxlDyQAzlJSzB2TrU3TytJrbPbe0
	NPT5DQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfke3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 15:01:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86a43fc3527so3285771b3a.1
        for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 08:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789570863; x=1790175663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fJRqo4fa5r8K+BgNujQkH+UdzXPRZZmUzCKYh3BrEjM=;
        b=GR/ICxBBO8LsaS0CX6AyFq4tQiyNXtRQM6/AlNRGotF3wErZqFCFwYnTM1CfioeFpp
         fkp1nXFyt+fR5ggaakN/0tbxOIgPq7nzlnwgpBGz6AOORTN7vCxuRzc0fjd0BWUVte/c
         0EytlYtOBR6Gy7cwq9gkOGIlcuGzZLbdoMaqFmru0XUdUSjVUdFaX2TIcnlr6Nhh627z
         miTscoFvy8mYWWvDux2+SL8C8DLSij7SxbFPrdCWW1m7RBaAbgIk7sT/2HL4K28V6tEW
         6b0cm1BCq8atp+tC/jDCfx4oYoMWqhxpmts/7ySUamaZgRn5pZU1GpL9Kto9iSX0lx7A
         mruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570863; x=1790175663;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJRqo4fa5r8K+BgNujQkH+UdzXPRZZmUzCKYh3BrEjM=;
        b=uyCzgQ9EmFD3Q/gYoiaBDSRuGwU7UfYR95JNMd8sKnA2g7RQ8ofHHjBX2hnpIggytK
         hzKiJzsti8uo9x8e/HytDaP+d8yX567nRKaAuGg5OdkLxVRRZjN6c9K7FZADNHKCaQoa
         gEQTDtpLXFAGnX5c301bNWJVzp34w56KlLBnHzQY5y4SZ1ESdJ3ksE0batzDmlE/cHfX
         mG57lzfoyOMfL6hkAVtPoO+ILvKPwdoOAt+/doKByzAhiBCpsrG8vmNSurHj6Uca2Dtc
         M0blXskjhnSN0JhFi9LQVyaQ/KwZBKu7z3wr3ov46JEOkhtGH2GWCZC/yIWEe9dnufd4
         27fQ==
X-Forwarded-Encrypted: i=1; AKwUvByk7C3AnQdiLZTLwBqjXCtQwsXZNvtcCuidKciAwTI/FI2jgNWA6xMhVoaSfpKSk+5GFuYZhz89OVM=@vger.kernel.org
X-Gm-Message-State: AFuF++lfvuQ247YiVGi1BUDFMmB7MCVoQzNGBAUOkJ9Aa1p4EM7sy5Nn
	R8tZ8VRgS4jpMo8SnJ9jBbYHMsVTG4qULaiU9dMeEfdeyywhOs9mAnL2Gdxl9DZeVW8Hw2YgdCR
	9CNKA/9c9IK4yqtTOx2uL3fwr8esV8faBo9QXiPIRaS4LPO8jX/pgdfs/E/76bS0=
X-Gm-Gg: AYBFou3TmHocR6KUEMHHdxnlzR5ASj0qDu85kmbtGf86W5+OR9u3M4Ov4Raz6zYJ22/
	LHIKqp4Y+x9sCyV5ryTgcfvRHRxQH7frBHfb0Mv52zGzNXf1cw/ecqKsvuebVNSwwCCIth6qtOD
	PYQAAR/e0wuzasJrlW+FE9pWTu8np5MOtNp+YGV3AXgtEPd5if+dz1dTnyyB1URljH8CFTSgbxf
	DIUDF/dT2CmPfXAiCFWJXf42t2m2+Yjcme84V9yT/uT4uEywHXqRKWY66iwKOszzf/4GOv81sah
	PbSuyjQNp6+LL4K14Lo9S9f8+X9yxu6lIf6TxH8QnWpeZsNDn+b2mRJF6UGYmd6rsp1UgKohTeF
	yVfqtb/OQuIjRz5gFDc8YHYN18NTJIfwwq/b4TA==
X-Received: by 2002:a05:6a00:8089:b0:84f:6f7e:493 with SMTP id d2e1a72fcca58-8723208dcb6mr4375231b3a.3.1789570862324;
        Wed, 16 Sep 2026 08:01:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:8089:b0:84f:6f7e:493 with SMTP id d2e1a72fcca58-8723208dcb6mr4375119b3a.3.1789570861619;
        Wed, 16 Sep 2026 08:01:01 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.146.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8720172b13esm1419604b3a.33.2026.09.16.08.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 08:01:01 -0700 (PDT)
Message-ID: <64fc0855-3dd5-4668-9d4d-bd82be246de8@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 20:30:55 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] dmaengine: qcom: bam_dma: Defer IRQ trigger type
 to device tree
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260717-qcom-bam-dma-irq-trigger-v1-1-6405eac86f00@oss.qualcomm.com>
 <aqlQ_y-um0yqo6jj@SMW015318>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <aqlQ_y-um0yqo6jj@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaaaf2f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=K/78aEDNEn2Q/Yuv7mVN5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=8k-RipbJOExq7qeMm_4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwMyBTYWx0ZWRfX2a0PuQzWTjJ2
 YLIc4/T70WrJy1oslXSNmbNpffsadmU3BvlUaQMl0ygf1WLLmIfvBdpVwldvm/+zVJzhdFp6nc9
 oBa4Jq9Dany8Xqf2fe5D5YzMuq4VmqwBtSwcQTqJQYUeiCCLZyXcrM/Iv/AGzcy24yBw7Jnu+j1
 Veahy2zivYGvJZeFDUL0fWNFK4PB4J7rEbs/ax/ARQkf9sDA9uZT/hoC8QL4rvKrPUhDKpRlG3K
 jx9uOhYCB3iV9P5FhG3WDOcENFsAmuNxgKm03Mt/pjOjHE3Oqkq8OJChvWO/9um8bWT9YJvhjtg
 x2xOFoIISyMNDO7HnB4/kqmQbF0t2Slt0vzYb3qUCA1e7BueI2S9U+VGm1wzs1zz/CYYgVb+Vnp
 ARjEqHGHxi7Qu0WB/3NNFj89vI1np3o2ilWYPA0971MgnZ4SHMIt7L5hlPM17iG1dy1W39OpfKD
 TW+ndsMtjegdfO0d3ZQ==
X-Proofpoint-GUID: xjXopzReJriTXnge2dEC0knUOojZEKW8
X-Proofpoint-ORIG-GUID: xjXopzReJriTXnge2dEC0knUOojZEKW8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwMyBTYWx0ZWRfX4xE85Qf3O9Mi
 iaUuAPXhCF8y1Mn8TeccbHn/RhfldiJpf4icoMu/rHiffqG3l8VWE5omtTYSkMRlENdukR74V7N
 eSRvuq3S8HGMtt+cd2PtZRpe84u06dM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160203


On 15-09-2026 07:36 pm, Frank Li wrote:
> On Fri, Jul 17, 2026 at 10:30:28AM +0530, Vishnu Santhosh wrote:
>> The driver hardcodes IRQF_TRIGGER_HIGH when registering the BAM
>> interrupt, which overrides the trigger type specified in the device
>> tree. On Qualcomm Shikra SoC, the A2 BAM signals an edge interrupt
>> to the apps processor; registering it as level-high causes the
>> interrupt to not fire, resulting in missed DMA completions.
>>
>> Use IRQF_TRIGGER_NONE instead, which causes the kernel to use the
>> trigger type already configured by platform_get_irq() when it parsed
>> the device tree interrupts property. This makes the driver
>> platform-agnostic.
> where show this? can you point me doc or code?
>
> Frank

Hi Frank,

The BAM driver obtains the IRQ through platform_get_irq():

bdev->irq = platform_get_irq(pdev, 0);

in https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/dma/qcom/bam_dma.c#L1270

It then registers the same IRQ with:

ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
                          IRQF_TRIGGER_HIGH, "bam_dma", bdev);

in https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/dma/qcom/bam_dma.c#L1335

The comment above IRQF_TRIGGER_NONE in include/linux/interrupt.h
states that when no trigger flag is specified, the interrupt uses the trigger type already
configured by the machine or firmware.

https://elixir.bootlin.com/linux/v7.3-rc3/source/include/linux/interrupt.h#L25

Therefore, IRQF_TRIGGER_HIGH overrides the trigger type associated with the IRQ during
DT/IRQ-domain mapping, while IRQF_TRIGGER_NONE preserves it.

The Shikra DTS which is still under review describes the BAM interrupt as edge-triggered:

interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING 0>;

This driver change is needed so that the DT-specified trigger type remains effective once
the Shikra DTS change is accepted.


Thanks,
Vishnu


>
>> Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
>> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> ---
>>   drivers/dma/qcom/bam_dma.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
>> index 19116295f8325767a0d97a7848077885b118241c..6c3e2ca8a572fd04c925de0adbd5cc0616b361ef 100644
>> --- a/drivers/dma/qcom/bam_dma.c
>> +++ b/drivers/dma/qcom/bam_dma.c
>> @@ -1303,7 +1303,7 @@ static int bam_dma_probe(struct platform_device *pdev)
>>   		bam_channel_init(bdev, &bdev->channels[i], i);
>>
>>   	ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
>> -			IRQF_TRIGGER_HIGH, "bam_dma", bdev);
>> +			IRQF_TRIGGER_NONE, "bam_dma", bdev);
>>   	if (ret)
>>   		goto err_bam_channel_exit;
>>
>>
>> ---
>> base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
>> change-id: 20260601-qcom-bam-dma-irq-trigger-0366e7e86f17
>>
>> Best regards,
>> --
>> Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>
