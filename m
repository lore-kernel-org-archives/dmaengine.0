Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B84D35837C
	for <dmaengine@vger.kernel.org>; Wed, 22 Jul 2026 16:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784736612; cv=none; b=NGcm2orx+vnbp0WtcUdjBdIiSBaLqun9bgRPFE9hNB9SLHA6C+nrwPKisNzV1WgslcDXUhDCjdG+UUq+RkloaHinZXnwWbNWRk4gdqAu1Ru6OsJSdtMkmSN2eEd4VGzWtmKWzlQJ/r+ztXCXRnmb1NUK4cxIu3eODcY6yuWLbe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784736612; c=relaxed/simple;
	bh=ygsI4zv/jW+3AX1zDcDFKyDT2frDw4My01kgEz4hjOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I9P+dGo0YBwwD7aP5zQauCT6nq82hc5x5YY2Lf5kzEMVMdW73YON6aYTL60t+KqzieoBdrAfMNwbmtEXlFJvfBnXO+Bc/OkFiPGav6zBRSa0R+hPN2jX9kC7w0glOzFNQwuJcR+i/hk6qASuWaKsr+jDwd1UaAlVcnbXnuKIVbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcVkMAgs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGMuTHk2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcVkMAgs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGMuTHk2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MFXvpK1176064
	for <dmaengine@vger.kernel.org>; Wed, 22 Jul 2026 16:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9UqeA08xtr2nYCM1EGeFESAXA0YISWIb/8TTe1aDw94=; b=pcVkMAgsaSsCHVhA
	uoc6RFvZ8ScHTvSEt+1cCYKdWiBxCh5gCx8RF5CjewSL9CJ587SBR1WV/sI5ozQl
	7VWLOK+T8QT8mfbbgYGYigw5cKaMimgjhPSbslZCpDLpUlr8E9EE/I5Z3iV9AOIa
	CDVndRxFhTgdS2J3ARS0iX8prYlxxEDn/BXOPphfJF6EOYF02hvCONtfKxSF1KNu
	NlK5AwB4qM6mSNVZeh6xaxjukqT0Qjf3Rp4VlF0qkIXcCzMMs1mMX7+bHEhia3JS
	CMx7mMzvwHdyRX5DNDgWvMwXgb8lpjjvr7LUuvTgxtlBIsygvoXGi6mkD1Rt12Ck
	s3DAvg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxm10sp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Wed, 22 Jul 2026 16:10:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-caf5fa127d4so13929442a12.0
        for <dmaengine@vger.kernel.org>; Wed, 22 Jul 2026 09:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784736562; x=1785341362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9UqeA08xtr2nYCM1EGeFESAXA0YISWIb/8TTe1aDw94=;
        b=ZGMuTHk2dpU/J5nUIXAEYdx5TAWyFKog0OQzfgaKktWoXiexiqjLHB/o63rlKRu1qQ
         WsqubdlEkdziYNIsyKchOUfXGXXY6jcfCMNcLJ7jobBGIV1XiAMOtHypuR0px9F3gIA0
         Chmruka4149+8gwj1ROiUDGNpAEi8ytsuvYP+W4Ho9f/y0JKTiaHbuWtF9dERMDCrMKC
         ozco8hc6/dcZ0AtAw4jQv/lRVzgXoLBliCz61rZfvOQ3Z/kh0yg1hyccmjmjmZCVvhao
         9N2wR+GIZ0MCVWfkVY26I5zAL2iuqy9y7RkKGgUy1yaU6dxuvqVnyWKAhVGZwppDqIo9
         rvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784736562; x=1785341362;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9UqeA08xtr2nYCM1EGeFESAXA0YISWIb/8TTe1aDw94=;
        b=mL2gHsyHebn/nvSIYHXMXSpM0dTFq/KJ4xI6kO0IIOHxKVq6VqRpeQ63ednvSv8HDl
         DK93618ruZNZQBpMeiUxnAtppYol+tRinZSzRQQhWfJjyOVH1wdYR2U5NoB5K6LQ9NLz
         2cqgGWuFUD4fimZE72H6pXId+bHzkJCCI+pSN8Sl6kELgFqB26Z/ziPfDFJy/shaVM8g
         w1LOgM/APPetQ+kurhr1sjl0Y7yHOGEFzn5R5hkenhlH96VB6SNFGbv8Iq+ppwbq2atD
         aaT3WMuVtvk8kyemnsFby+ulCwXTYBpjuozdBJNwQSZaNP5i8azzy/mBMaH9e06GU8+d
         dXgA==
X-Forwarded-Encrypted: i=1; AHgh+RoMfC4+XwayFwgHTB7m/LPhspeQVyzLR2rsYWWCev4JTKOpZ5lsEBBYzjBaNzq1UKGSiXBItc/xGp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQoTPNpnziEZLT0Erqn+aRQbG4VQSNyuoovtCYhIjNyiMcBb2h
	PLNY1uP6eFgYQE38oGAHHz8mlwPlVpKn7MuHaCuuTmxSyh4Qmj9Pxn0tzhhKEEJBB+WlvEi3B3M
	Ws7jS6kx+fSWYkW2fwPmveq/hEA9jIxlK4/5trEYlMKIqXOeD34merP5CyW90NSk=
X-Gm-Gg: AR+sD12S/HXafoa7YBv+cwIPbfs6+//7AajMDDoC7IsUvllHiAdtAcYBqmWcUHIc2pv
	OHN3YGR+6nNIHY0lwm1F4TKZeeOCQZr7tep/LLsvbTdGFCtoWqlkiSKzKCYON5oci9IksRfZ1BZ
	p1+XtJaUplnPd4/nAHuyesfKhBMyDfk1NquIKGDx6ZM09xKslkmv53XuCqpdRtS1hBBFdsStilV
	uPUqUYlnTiSGwJSJs94mk5kOvoRqEEx/+qUfqBqqMh7jHD0+xxwEBn19EKFO9r67or0qzDS09aD
	PFp4lMQS06xR4wkIPtD0gcR7LzO6lKHsMfGSdbaZQ5MkyzUFMxuHnnQ23icMiufE73k5Jbf6yO0
	m/Bxzzh972kr92Pil2w2rqYATVuAUvgg=
X-Received: by 2002:a05:6300:6702:b0:3c4:302e:803c with SMTP id adf61e73a8af0-3c4302e81c8mr4231483637.61.1784736561810;
        Wed, 22 Jul 2026 09:09:21 -0700 (PDT)
X-Received: by 2002:a05:6300:6702:b0:3c4:302e:803c with SMTP id adf61e73a8af0-3c4302e81c8mr4231428637.61.1784736561391;
        Wed, 22 Jul 2026 09:09:21 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.203.111])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a6adsm10322604eec.6.2026.07.22.09.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 09:09:20 -0700 (PDT)
Message-ID: <b99f7d35-c54e-49bb-a477-577ef61ef553@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 21:39:11 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/10] arm64: dts: qcom: shikra: Add
 gpio-reserved-ranges to tlmm
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Anurag Pateriya <apateriy@qti.qualcomm.com>
References: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
 <20260720-shikra-dt-m1-v7-10-7dc99100c6dd@oss.qualcomm.com>
 <5houmyc3fu3grxqajn6ivucct25yz34p66lwha3icmcuj2fb7f@ypz3r3mqwzwe>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <5houmyc3fu3grxqajn6ivucct25yz34p66lwha3icmcuj2fb7f@ypz3r3mqwzwe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE1OSBTYWx0ZWRfXwcwIAsFy/OR/
 +jAC7fRHGSGLkVXbsKBreFO+LKIMIFLDeCSseWeby3DAYGTh0XUY9exMVxiTnEhDjCCvXanAnDo
 SM7y7qohDJsyPBUi55MK8awAHaEKN0o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE1OSBTYWx0ZWRfX0MwJq6qWDeSV
 r9iqiv5puc0nShbCMrmw1Slbx9ZoMcMVjNHaWPxXLsPOrrdExjqElEV/O3sgDUZCwMQ+aMRUfkR
 3/k8xGYUX3XyhwmsXiAsSWL9DdoK6yG8otSxVA0xFj137S+FGOKdhpLpFzeLNhRIALhJcc90uIr
 IAOoIsJS9Ml1yjx0HVHJoaTM3qXK8VzVQOTR3Vi4MpPhJXb2vlnmPM1UvFAFFOsTaGwLq7+F1HI
 SiajHmbnvRJg8bSJSpD/fuSGGOVxB7qD3JUVFyVI60HwU/W7afcmcLamkZHeqAHhc6NVtl/NcCY
 bw2VB9EpMU4qPGlJPtsjigCSNI4PtaBJ15+XG+M4AP4YZu1s+B+qdsCyexHjVNrnbaXOKXenN2f
 CiT5zxn2OEXX0EdsUt3VikZR5ITqx5+7HQ9ZLsQDY6UTguV8qH5//rWz1U9qlvobvPwC0x8kKHK
 quJYrNueb+syxWssPWg==
X-Authority-Analysis: v=2.4 cv=Rsv16imK c=1 sm=1 tr=0 ts=6a60eb61 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=WGt2SA6sb8UO62j07QM/GQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=aBxXs6P8EyRdFk8ceQ8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: CbxRXvockh3HF2avOwRD9NwKUlUVPFhR
X-Proofpoint-ORIG-GUID: CbxRXvockh3HF2avOwRD9NwKUlUVPFhR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220159

On 7/21/2026 3:49 AM, Dmitry Baryshkov wrote:
> On Mon, Jul 20, 2026 at 04:19:26PM +0530, Komal Bajaj wrote:
>> Add gpio-reserved-ranges property to the TLMM node for both Shikra
>> SoM variants (CQM and IQS). These reserved GPIOs are inaccessible
>> from the non-secure world and dedicated to fixed functions.
>>
>> Signed-off-by: Anurag Pateriya <apateriy@qti.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Who is the author of the patch? Why does it have two SoBs? Should there
> be a Co-developed-by?
>
> Other than that:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

You're right, I missed the Co-developed-by attribution for Anurag.

Please add:

Co-developed-by: Anurag Pateriya <apateriy@qti.qualcomm.com>

Thanks for catching that.

---
Komal

>
>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 6 ++++++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 6 ++++++
>>   2 files changed, 12 insertions(+)

