Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34DF40587A
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 18:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658030; cv=none; b=cRGmWqgRYNSXZny/6dq0DnoLR57/4o0ByukelhkSjycghpOB7AgoP4wyTUd0XH+ANp7vOEm3mtnSV5qYZqh7aWG7TQRMBUg8owzmXm9imBqrvWJ3E2aTHxVh+QusPOxlHA1yCQvlkCGLGKchenCBYWOZPGNfXoP3klWUkE2mTuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658030; c=relaxed/simple;
	bh=9I8SuSEzPUmQkXgAoO8qB39k16yQ61FTlzIkj3Jiy8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=It6L2158sxQzhDTIjriemkHJiyDg5mu3qIxhfBLNlGzrmwzZffhDhWR1VDkeq06UzA67jrgKlnaifxXJfhihyPhwVRVEpk74T7En12ufv19HC+ImH6picNf7wzPudy41eaolD3xQL5VtRhf/NP5B2v7LCpbGxI6M+9fuJjMavcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJj05R2s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ixVQ+LGf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJj05R2s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ixVQ+LGf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2gaS2418309
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 18:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fc5hVouaXSdYpjHELQxCbl6GfmZ4wxwxC4HC57BPPkk=; b=FJj05R2svGpfrQnX
	c4tc7mBvFM9B4aQNDUteAR7It2s6TbFcwp6eeV+GQ+dxnRwu7id/oQFmugx1iFfs
	M96r+iZL1B8zDG38y5RvigS6wes1uF5nrMDq9xvpt9tClke6yOW2xFyw2WQEGowt
	2VBHXx74dRPKyUeIHBYPKWuhnxXVmob39F36XTu+qx8nS925V1A97i0O2jkILy9u
	Gikiv0FdE4LRx3Oj/+qL3AdcN4Zz+q7VdyxB+vXn/A0auBxFvkqYS3CIg15tk47q
	z4c23L3sCtCMvuDTX/KJOah7FDg4OHwR7jPQDJbTdhxPtoNYVPJYr0SgYzF5UXqQ
	OExG+w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bs9jav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 18:20:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cceabd70f5so226000575ad.1
        for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 11:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658027; x=1785262827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fc5hVouaXSdYpjHELQxCbl6GfmZ4wxwxC4HC57BPPkk=;
        b=ixVQ+LGf79jnpbalvltmVXMGOrue+8MyBtMECT3x1PUZdRmi76jQIVfUcaMTiDSNNc
         CC15tAq23v0hm5h6YTGXMKvYK5kGREM2UgRvY2QdtRS9k5VeSe0foGU7cXiByKHxa1xS
         V/hbh18HusKGMU0nYtQkinB4vl4xrwO7e28VB8kIiiyvCqBsBK51Enm06ygFA0TZYnap
         VGm8pUP2rhIR5m3x3ZER261rx+ZZpoyqvYjoGRKVzKg5kxL95BZQEHt0PPdfiipCkPPp
         Ijz2xaObR5CTd7tNK8c26FPNrrcmKKVrHqJJNoRfs/pc61j/MiuqnTQH6eGCCUvsa9zb
         0Ckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658027; x=1785262827;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fc5hVouaXSdYpjHELQxCbl6GfmZ4wxwxC4HC57BPPkk=;
        b=gq5LN9jukYYlzjn+AHVJSvu3ahG2PK4ij8SRJkw7XuGVFy33N87Jn09KGoxHULwto7
         tDF5c37MqtkpQOGo7O+1ihCIGUWX0cPdW9tUhw+dkF6dZTWL3Q52PVLnW6g3fEs4mx0K
         JMqzV9dW00Ewn0iOIYfktgGJL502lVHzgj5Oe/oqNUFXYRfPgKgrDdySs+jHTk9I4rdB
         e1JENVf67oVD8Nd/AYLxWgb0f42h73+0K6spkSrsj4L1OfIdVTlG/F4v6CCstE/++5VU
         3GH/iQWEmfT2LsU4yO5KTqkwY2EtuXPnKghiVQ77BuzX33dqfISlWIh9DnrjHGUe7SQ+
         YcFQ==
X-Gm-Message-State: AOJu0YzyvZVVfjTQ6bjZIuRbsdtfdLgN+L2dvVAZ1bScVj06AVuLrDkq
	yG4Dbx7Xd5RmxhKYdrbYG0l19CfK+SNIeEVKFf7TNlba07ZT9If2ZaRf+qtudowP4bvpeKBMxe6
	fAm4eOdOt37QJPdalMVRHUoJOKH7fglFZtbVH3gs0LngQuz5dXvZ6Z5/XyKlVMnE=
X-Gm-Gg: AR+sD12tObZXRBS9ANVlL2tx0kKmQbewByUyTiJTkFQ/eaTudQDUD/UOICYD0zSYEl/
	i4k33IIh007z//Z5hAvcTXPDfjP1KGr6jvvkhoQ4XjpDC92/zEcbVvau6nOW/H28cL4MoL6bNj+
	Lf4tDzi3sCw+kvG/ajTZ9FQGx+CcrhJaY3Y7WC+MepKxUQYAXhbbahfzkulhAx/IBbQ9KKTw18Z
	7v7TuVv7+q579ecQJIVYpEGYakobQsDQp2ax+F4K4ou4eRh7Gan7d7f4ALJhhKvFkhxQDvNAf4P
	A7qHM66o5OxtGwdWmNT5NO5nLI7WrWmZts0074VbFOPx39nRb0gY5ZOhOY/wQ5x8xrm8gdzKSX7
	qiC4BraFVZJGBF5WGYdZRjv+IMf72e3IG6YQ=
X-Received: by 2002:a05:6a21:7008:b0:3c0:9c1b:d0b5 with SMTP id adf61e73a8af0-3c3ad9a4de9mr22508048637.64.1784658027482;
        Tue, 21 Jul 2026 11:20:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:7008:b0:3c0:9c1b:d0b5 with SMTP id adf61e73a8af0-3c3ad9a4de9mr22508005637.64.1784658026958;
        Tue, 21 Jul 2026 11:20:26 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.235.145])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e07000fsm2341770eec.21.2026.07.21.11.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 11:20:26 -0700 (PDT)
Message-ID: <773715fd-823f-4564-ba42-c60bc8284b45@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 23:50:05 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 12/14] crypto: qce - Map crypto memory for DMA
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-12-1be02deffda9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-12-1be02deffda9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1OuecV-Bvg84s1HE9pKydex2hMSrIvtt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MiBTYWx0ZWRfX4iEJFBf+M3WT
 YG45bGalGcseStgEgjaSmiIkntNhGg/8LGZhy1V8t2sQG/peKFgFlBHh5U+lMdwb4Eo3SekMqYI
 i+A54njhN2OMNm9BjwmTsafL2CcIOz4dY+1ptNB7y4mIisKDNHyv3CAi1EBFpUJDtiHFwCeSTnI
 eyRk+nHzWXObtdLyDEEPhS2OQ2n5DlKg3LsDfwUifg6qYJZ7lXhoY5LEXk8KxYTUUbWcJ6ZNSnH
 B6RTbzSyiJlVV2KOxJyi08aVDgOV/3gjRFmN2vLzey2QFCU4XFBxJ/f8AQLuk27G2XG/ujzMmKA
 obL6XKUsqlMX/axE/AhswoRsONf+2NgotSFOC9pDYMnx/137JpMy5zDgeuNHiFI9iQpMglxDw4u
 FMU9lvlF1RVpaS7ukrPSZHWwA0B4qhm/qmZjz+tyJxveQHK1AobItyBSQ5vITCfero4LNovalM+
 sIuaOLYnF3pbL5Rk4AQ==
X-Proofpoint-GUID: 1OuecV-Bvg84s1HE9pKydex2hMSrIvtt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MiBTYWx0ZWRfX7FcRxPx97Tov
 72Lgqey80mT8Hkxe7a1HxfTZR3P80gmpYNaGlYU+TDPfaoI9ZnVekcYl11xjX0dLRtEJBrRn/ob
 HMLxHnnCN2OqgOQp1V1Uu3Mba+ozRGo=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5fb86c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nYgDJefOb7ZtON2RxEtQrg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=DV7x2YVLp9Y0dp68W6cA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210192



On 7/21/2026 7:03 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

[...]

>   static int qce_crypto_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct qce_device *qce;
> +	struct resource *res;
>   	int ret;
>   
>   	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
> @@ -204,7 +213,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
>   	qce->dev = dev;
>   	platform_set_drvdata(pdev, qce);
>   
> -	qce->base = devm_platform_ioremap_resource(pdev, 0);
> +	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>   	if (IS_ERR(qce->base))
Would you like to add any debug/error log ?
>   		return PTR_ERR(qce->base);
>   
> @@ -254,6 +263,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
>   	qce->async_req_enqueue = qce_async_request_enqueue;
>   	qce->async_req_done = qce_async_request_done;
>   
> +	qce->dma_size = resource_size(res);
> +	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
> +					 DMA_BIDIRECTIONAL, 0);
> +	qce->base_phys = res->start;
> +	ret = dma_mapping_error(dev, qce->base_dma);
> +	if (ret)
Would you like to add any debug/error log ?
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
> +	if (ret)
same here
> +		return ret;
> +
>   	return devm_qce_register_algs(qce);
>   }
>   

[...]

