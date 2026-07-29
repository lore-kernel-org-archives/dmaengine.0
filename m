Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B8D4968EE
	for <dmaengine@vger.kernel.org>; Wed, 29 Jul 2026 14:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785334616; cv=none; b=ASN74RnZrC86WzWN6t4gpqMeOYWqJFrJvxyNjR5Vgb3ndcEweIlvbx7dNNiPTH3usY90HgG+cbacaieN7sYD5kTPeuwvt7bo+4Jlo4FIK2VmXhAwXxTzRdr/OGLW+3SH5PnIH0umn9zeoor0POxnYa3jYiqBmjQ3vDv5VfGHJ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785334616; c=relaxed/simple;
	bh=TCo+7EZlpnAIIC2RubbPgCZJQQ5uajJDR6V2OqJzx9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HqSmOs02JXzQU6DNnVeyEHDA1pF4zBy6XP7n5rrtdhViP4Aw1+t+/eSVesW/3QAhbu83KkLEdLCxf64jr78kZCN9VmS2g70xJYT0AY4qQ328bauylblZpFgN4ukrsVs7yJHdTiDx7MEa5ASwPEbHuRNHcZBovvIxGI4F49qkN9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FiGVIdc1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gc1zKDDZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FiGVIdc1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gc1zKDDZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TD8B5B2061996
	for <dmaengine@vger.kernel.org>; Wed, 29 Jul 2026 14:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rXVLhUTKhp0UB29cVlcqaoslIEpKghsTFjk1gXUO0lg=; b=FiGVIdc1wnrTOoRh
	wxjvlrMi4kVRQmW7NCV2TKR9VplRcVBcE3ey+MBnULmFWAF85ThsZjYFZbO6Dcr4
	0SXM+roainGSLUguOsDIedwwwJs5Irm1Jxlr5i9hcbYIGRsUwgxQahC4p9N2u1Ih
	g16TrYb8koMxX4LLGECnnXQl3BK0hFtVBKcQ/S8lWZjyyGphDhDYj4PxnUBCK2aX
	FLGxZLyBb4T2x/iMOx0ohp+XALzQfrcmzjTDoN5XQ12aN6abg3eAZwSCdiulMe4d
	OdPh9tav7yCkCmMCNm93zHaJADf4V10tEsA0/7gnrVSZf+4QPybZIRTbS0LjrW1V
	tLz2eA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrcgpbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Wed, 29 Jul 2026 14:16:54 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9e4a02796so225340a34.2
        for <dmaengine@vger.kernel.org>; Wed, 29 Jul 2026 07:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785334613; x=1785939413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rXVLhUTKhp0UB29cVlcqaoslIEpKghsTFjk1gXUO0lg=;
        b=gc1zKDDZ8K8TrlOh9t5Ix7KG26H5rm//8kmhIn40big4e+cQB/N54jTg+VwM+mpYYY
         vCLSUnBGjM8lxHYdoWrqEtp+YWgI/OE+TQcPIv7LIOQ1r+GvOZR1wk4BUYB7y1GpQvZf
         dIfZwEjDzCgxERil279s90vtiMHoq02U8eWUFvpPCL3ztM9zjwdpaQEoQcFzYpM8Cf+1
         u5UDmCEEvnAEBSWg4wBc4NTW6tnFT2IjYTWD6OFtcxgQBC7p8el5J951f6yOy40S4YQ3
         vEm4wMIqmggYXqq5CFweA9VJeLCcKfTXHwb7YZFSZcmnyL0wVDYtAgikdBzLI3XjXAl8
         NlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334613; x=1785939413;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rXVLhUTKhp0UB29cVlcqaoslIEpKghsTFjk1gXUO0lg=;
        b=KDCGu7J+S14hrF7U1OugGjOe1DnlmCKS8//k674P1FtqpS8fDY+Gm+nYhrWFm7FdIE
         L93YgYDQBztPgGcARvJ6t0REbddNw6NeRKYSwRCQbX7Qf5NvxAUkt8P4jgbTFuqDWdEn
         aq5LEBgHcVkJhcjQ3epw7FLkz0ZzNuwgO5bLzoQ27cO7R5rZlS/q+bYapNZyu93Z4B7T
         IVAYOtCPJncrmgyV9dRllEospShT5QqY7fkt+qfeDza0ucb1BqVHiwsooptUWh6QN/He
         yJsZkROjbVah+TYalCmXbIVcrEg2ndH8sGSxeg7ZSIwllOVECt4phalvyh0aclVUXnyI
         jvgA==
X-Forwarded-Encrypted: i=1; AHgh+Roch5B59DcdzgEIUbZTStO081IYIMUkgsrg+KddgzcK//phk+AJ3qGHfPNsH834KjXFE7Hqb2dHVCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPhpCu3Mu1/Z8klr7MjHWbnvY78TbEwOw5jQUIo9ow9FTe62db
	YOJz7MH7ZhXf3GAtO3Anpu+ojKgW8g7rcKNqxIU3YafUO/x957tuLxeRfQ9M4ef0fy+il6vY7+u
	wNbmAP+WyCsAHXWtgtKQ9slpO9Xt+mrkUHTzLMvV26ML8xybD/uF+IUf9Fot5Txo=
X-Gm-Gg: AR+sD12kkCFD8QPlvpZvh/k/1KKegP5Fy3h7vfnNXY0hzpu4KB7szHyEKbuiooDiSo8
	rFG/jSfbTPB7GHVZ3A6ueGKRJ4LB9dit/OXFnBIq3/fVTi4euZCBL4IrKF+DhfgQuiBofNUfYhP
	BHIDzV3Mqry3ibj6QNt5lYNr8tlYTWIX+z0rlic1Mr+cmVp4yMNhpisjFz7EZh4qZEYHIkwBFRF
	ZB8I1xA89EdZfgDr1g/um1bWllpaEkoEz3bo7OeKf+qdKz3cGngG0t3NYQ1RCGwPNFBxA6fiGhQ
	Za11vWB1DegxQXgUXby3RQXzWr9NFTLLCnINWDr3kzOMQlJfTW5rUs4ebuZaodDksbzYZKkqTp1
	mHnOR6IUVdtyUccQ0Ug7LeD8W
X-Received: by 2002:a05:6830:3814:b0:7dc:d6b1:48b7 with SMTP id 46e09a7af769-7efff0855ffmr3035927a34.1.1785334613428;
        Wed, 29 Jul 2026 07:16:53 -0700 (PDT)
X-Received: by 2002:a05:6830:3814:b0:7dc:d6b1:48b7 with SMTP id 46e09a7af769-7efff0855ffmr3035854a34.1.1785334612957;
        Wed, 29 Jul 2026 07:16:52 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2d76aa130sm435235e87.27.2026.07.29.07.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 07:16:51 -0700 (PDT)
Message-ID: <d7ef81ac-423b-4033-9e73-bb6926eb072f@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 16:16:48 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: shikra: Add ICE, TRNG and QCE
 nodes
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260714-b4-shikra_crypto_changse-v4-0-06a4ea97c209@oss.qualcomm.com>
 <20260714-b4-shikra_crypto_changse-v4-6-06a4ea97c209@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-b4-shikra_crypto_changse-v4-6-06a4ea97c209@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P3gwYWiH_DQf9XosbZX30bbltMJKA9tz
X-Authority-Analysis: v=2.4 cv=Id+3n2qa c=1 sm=1 tr=0 ts=6a6a0b56 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=MtsRB-tFAxrkV9Z_vvIA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: P3gwYWiH_DQf9XosbZX30bbltMJKA9tz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDExNiBTYWx0ZWRfX0RZXRYcZ7X8R
 l6uEA1eiPohfayZ6WBl+7aveVJQjA0sUa3rbkGIKR8aYta0qrlZG7ruK/XJ3GgD6L6gzCSqFUmN
 wJSjBd1cNN2asCYgJia6hkUv5V+vMnY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDExNiBTYWx0ZWRfX4kevf+edA+IN
 NjSkSBlzl94HnKYxKt5Dt09lCXYFYlZzPgEonIilidWxsp59F748QjcokKuUKHbw/+9ak4e1CA4
 xxDiPoreyqe2mMiNlZPBG8PWkik+Qe0chAdsyBgor7hbU/mEstjzoxitkZQZbXzi+c/JLdAujQd
 MJALWSIOT5XiOC5wMuvkP/cnllPJPoA5FA99coViq8i/fBOwRaZtKtcYVT5OiAjSEvY+b/mvVT3
 ANgc7/dveN7XUlq7NW3womA+J+Q/xXrPfCny4+/0kSR+3Ybs2h1sCKXkkZjEgfkOqFIbGwVAK0h
 v4RItQ3PfRz3kFeOW3ybkiDBUAynLQaKdOeybKzjYYSfAPk8eWycmvJMVL/vLcXZijaK2PSqS2c
 U+IrVCLHNyAaLQ9b+ZGPiYx2HspzMm3gxpqCSnZwdzg6acWQjrtyFDk4GLP84TDz/VjlqboZSYx
 9uy9p6uCk2PCiiwiLuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290116

On 7/14/26 12:05 PM, Kuldeep Singh wrote:
> Add device tree nodes describing the crypto hardware blocks present
> on the Qualcomm Shikra platform:
> 
> - BAM DMA controller used by the Qualcomm crypto engine
> - QCE (crypto) engine with DMA support
> - TRNG hardware random number generator
> - Inline crypto engine (ICE)
> 
> Also connect the SDHC controller to ICE via "qcom,ice" property to
> support inline encryption.
> 
> On Shikra, different BAM pipe pairs (for example 0x84/0x94 and
> 0x86/0x96) may still resolve to the same resulting SID due SMMU-side
> optimization. They are still distinct pipe pairs and therefore require
> separate DT IOMMU entries.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
