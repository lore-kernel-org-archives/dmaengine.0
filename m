Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215F141A51D
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 09:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784798459; cv=none; b=KxyhdAQyTM+lHnQjW/T6Zkq0i6fT70qm+dbZDO6Z8OmDvd/0mb0xxpOmEYT2ed0aMuylnsVMoRYKWGBLU2bMTXzYDKOyQf0Ajg3r71o7j03H6w12u1457QWkAcYr8YK1G82eQ6DrQC4lLpVfcPyGoU097fMc7z7TN2rm7tSBv5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784798459; c=relaxed/simple;
	bh=Ua5UAJT40e/0GEzjCwqx4EwOBnaqa4Dvcx7XveV6T1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sn3cbqYxRTxB9UXaQtopDPXpeJO9N2ZVFPv8ug95HxL1ws+QTAcZrx1e3kBRX0zo7r7zxs2rvthDQkPLKGtP9iX5FGNHqpNAiCaycGOecNEbOzPWgyqBKHe21bj1K9UDL/opJ/ISQWvZ3tOLKCpbULlvP8O2FSGMshvBUbT98l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RDocfRy2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBNnoh1O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RDocfRy2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBNnoh1O"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qnua3388121
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 09:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lz7QXf+iBwT8QlIH9Oun8AGxaHA1wq8IUAehzHZTWo0=; b=RDocfRy2yCHEjccW
	RZsU+gVIqtmV1JA9knlL2qUoDyjx1MFmf4ZpdDgtcCPjCkD41+MaINpGGNqlssH2
	+RmCqQkCtNsfKC32m93P87q3wDV+LDgGF+Z0o4QaWHMltGFdL21fLRpZDlzauFXC
	ITws8oIBPGRDOjpHlJXTDMGYhCkRRLnR7REkcGMvmQ5r3mayMxGo9gP2+fL8cgmV
	Z1dSeukTeYYt02iGWv623uus3oOA3IZwhBqSbmORWl0Fu2ucPZ/owlrRo6jRBkjz
	Kv/Qggw2S/sze037UCDDCVLHPys0Bk3UshoaJP5hWMv2/77YZzunLT9ZY95mpTCD
	vFMC6g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk275kby6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 09:20:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf1c86963bso2976325ad.0
        for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 02:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784798453; x=1785403253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lz7QXf+iBwT8QlIH9Oun8AGxaHA1wq8IUAehzHZTWo0=;
        b=KBNnoh1OepJ51gFeGzV51v3Pm/20EQBNNXnaRe2943hktt0R3cCRamdx+NyAWOtQTl
         tWAYg8esJmpjT3A6DPmaIANM6lUKfp8ebgF4clA/PqI7L/H9f+duBDYyuDtn+N4L20MN
         BPseUD1D+KLZ8BiOecbyBq5lu/nvfo5VNjKbKeuQPFV0n5/HpSw0jGjB6uB0K5Dh1oGd
         tyd1mM+1Rj3WkzKDmihsSt8qW0HKhSOf1xfTsouX7Px7gny4dXVx3/bRq0WpjxNJpY8+
         0TVZ908NhxMqfve/xqY+yAcdmx21jOuZet+B7YmLg4t9p9Mt5LQbP/ANtjf20aKiZJuo
         3Ofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798453; x=1785403253;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lz7QXf+iBwT8QlIH9Oun8AGxaHA1wq8IUAehzHZTWo0=;
        b=nTwGMF1ZAY7rdYk+wpjGyxDps4p3rnorLXIdYSUTDvvBGKRyoFoH58vSjG2fHW6h4J
         L2Y76OvwAiIS7+gHMYCL6mJyaQBsKNJGGXeCAEwtfLx/pxutXqHRu2rF/Nzir/De/3PA
         44PdeaiBnWB11yiCT7hGapWK1BRcevAyzu+oCMt/fOr+wZHJcLYG/vNGUwHhUGwi6r3E
         3xuq46j8K1SKnFT6JHLQHw7utN9IeDWu8uvaq+UFpybIcelCh6IdG2wZPTZXGV8LgpW2
         taSJG/tf8tFV6RiCud1hWc1JpxN5/hpAN/rzjEI6rjIIKhGXU1y5dgviPPetWebRc8NS
         iZNg==
X-Gm-Message-State: AOJu0YzpLadUWIYEi0anxo09EK2DRu5vfrS+ZjAWsWc7Tqj5EpP+qnPs
	eNM9VaJL96TVDHVoFm25c3iK0Ig/GiiHKh8KQPhuvd5iRtWFufeKgL01WXUa689q0yH6YRHl6I2
	Ak5xI7s9+0p49PPW7T2Q3CGqFLh80Sg2ZFysy6Qmh79opLBJ6phGb/eVYpkvB5EmKbT0G0DE=
X-Gm-Gg: AR+sD130JYFhYfMhMzYwy/TUal3agZSry5Vz6zW7s4TiA6Ys7Wv73B29fc/QuRyyhbz
	cAs2shGCnmo1DYB7U30dG7KGMQ56JQuZIeTHU5DuE/fJLqxsUfKJ8MJnfcAZSDlJJeKAAPZ9GVG
	KAFGhbcFYPVb+IESeEF2pULwsnVBe3ovlrQGdPQYPoIMIn39gd2UW4Tl50k1E60UdKf70ygNP0W
	vRzUQD9K0zS6rOR/8F6yycB0nsPB/ayD8zFO/Y3T5SrCsZDlLcHAOJYxq/w1SR/bjICmurX6Ych
	PmlNlWXQRNwM3IHjAFEBHIoYEG/oZkckDpei/+x3P+tZ6b2tgEcaxat/hnbzHeJJTm00/rzFeRj
	K2dgADApjrr9EO5j3jTQGOloDNDBLCuc+ZPE=
X-Received: by 2002:a17:903:1c1:b0:2cf:18e5:1d18 with SMTP id d9443c01a7336-2cfa958568amr21289765ad.29.1784798453092;
        Thu, 23 Jul 2026 02:20:53 -0700 (PDT)
X-Received: by 2002:a17:903:1c1:b0:2cf:18e5:1d18 with SMTP id d9443c01a7336-2cfa958568amr21289495ad.29.1784798452670;
        Thu, 23 Jul 2026 02:20:52 -0700 (PDT)
Received: from [10.217.219.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f011570sm29930365ad.35.2026.07.23.02.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 02:20:52 -0700 (PDT)
Message-ID: <eb99f98a-db4b-40a6-9c5b-9f9eb6986d28@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:50:43 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 12/14] crypto: qce - Map crypto memory for DMA
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
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
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-12-1be02deffda9@oss.qualcomm.com>
 <773715fd-823f-4564-ba42-c60bc8284b45@oss.qualcomm.com>
 <CAMRc=MdLMQgJsxAMXLBkZNWUiz9fYh0j=C5ErbFoDLV=VfPUzg@mail.gmail.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdLMQgJsxAMXLBkZNWUiz9fYh0j=C5ErbFoDLV=VfPUzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q53iJY2a c=1 sm=1 tr=0 ts=6a61dcf5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=JVr4EG2OP6aRYF85f9oA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5MiBTYWx0ZWRfX091OXfhS/awa
 JkdYBxjs+E7/JUxdVN/YadZ94dMIqtTuDlP6ES1HiiBP9URoPOjl9iaMZq9LMX6STHxdqY93ZI5
 mr9s/UllGDVXacbcxNVqVjvH3vFA+aE=
X-Proofpoint-GUID: XcDaqUlBZleodQXrwFIksbYfGF1YXZuV
X-Proofpoint-ORIG-GUID: XcDaqUlBZleodQXrwFIksbYfGF1YXZuV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5MiBTYWx0ZWRfX2Qn3ChfhVsC0
 uuizcazkuKG1i529IoUJJ1UXakkFcFucsnX3WddpKHMeBFVnHWfrsdRiWMsTkqomgGA3rXPE1r/
 VgPSKAJm3y7ELdc62qZ6M2XEiQ6sTmwiOhkiK1a1v9Ws4NyNyIs00PML3jBGbZ1Q1XDqTiXRxSn
 WrKaqwxp7+uB0pTNHwUSXH93kS4oNf8DQhXRYV7/Ao6v+jX8ExWWOl4n0o44eKu0d7iXGolqPKm
 /Hj6TeUGj+Mssb8ya1ABe1TItiqPhTdRoDJJh2wuYLD9BmytBOzBJ2m0mzQ/nzZr3DZk+HdfcmO
 f5+9jPXik57AXr/q+jEPTlXCF+m59zHP428T70Q72NHmZ2YGxfWVSkrdIA+WhwPQc1bxOv3ndIY
 K3BvnRp2jG5V7+c1XXiW40LusAusZqktVBAkpuiV51xMaw/35C8CZWaHRCNqOwpgvtE1CAZTf5t
 Wb0kKP0dDB36k6oMx9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230092



On 7/22/2026 2:47 PM, Bartosz Golaszewski wrote:
> On Tue, 21 Jul 2026 20:20:05 +0200, Mukesh Savaliya
> <mukesh.savaliya@oss.qualcomm.com> said:
>>
>>
>> On 7/21/2026 7:03 PM, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> [...]
>>
>>>    static int qce_crypto_probe(struct platform_device *pdev)
>>>    {
>>>    	struct device *dev = &pdev->dev;
>>>    	struct qce_device *qce;
>>> +	struct resource *res;
>>>    	int ret;
>>>
>>>    	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
>>> @@ -204,7 +213,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
>>>    	qce->dev = dev;
>>>    	platform_set_drvdata(pdev, qce);
>>>
>>> -	qce->base = devm_platform_ioremap_resource(pdev, 0);
>>> +	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>>>    	if (IS_ERR(qce->base))
>> Would you like to add any debug/error log ?
>>>    		return PTR_ERR(qce->base);
>>>
>>> @@ -254,6 +263,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
>>>    	qce->async_req_enqueue = qce_async_request_enqueue;
>>>    	qce->async_req_done = qce_async_request_done;
>>>
>>> +	qce->dma_size = resource_size(res);
>>> +	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
>>> +					 DMA_BIDIRECTIONAL, 0);
>>> +	qce->base_phys = res->start;
>>> +	ret = dma_mapping_error(dev, qce->base_dma);
>>> +	if (ret)
>> Would you like to add any debug/error log ?
> 
> No, I don't think this is needed and at v23 this really is useless bikeshedding
> and doesn't add anything to the discussion and only delays getting
> this upstream.
> 
Okay, got it. Thanks !

> Bartosz
> 
>>> +		return ret;
>>> +
>>> +	ret = devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
>>> +	if (ret)
>> same here
>>> +		return ret;
>>> +
>>>    	return devm_qce_register_algs(qce);
>>>    }
>>>
>>
>> [...]
>>
>>

