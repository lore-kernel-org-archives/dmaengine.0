Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20FE3DA5B8
	for <dmaengine@vger.kernel.org>; Fri, 24 Jul 2026 08:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784881801; cv=none; b=DL0fHAZ25Iwr2OmQ0owrrTXLtCYfdxi87YcGG9espJ8D6TYTWmTAZA7Q7dfrBJ3WeiXEL4b4PcFxoXgWLsqxhXjpGQOULbLrYkm6cpyEqLqzl47r/UsMGKA2k5q+D597NdJbKqFm+Vf/bdVTqSOtCiX72uPzhec/8JUl39edn7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784881801; c=relaxed/simple;
	bh=Y0gUFXRlmr7qKhzm6aX4Ehj1rU5kzHdP91EvhU+Z33A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A1lq44tUjPjecmnUdK5HlRosWWtnH9IUBEbZDFqO0ZEOINugym4BWTJudaT4HwLszl1kpRuVunquDOS1js9ALIiYUVXe8koKlSrzrYdup7yaZZCElf0mcdrEMZ3tjWm6jmxAc3+aKBwmWTap03xCkRu24vL3DWJ6Qgi+EehsPWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/ayBkih; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EmxBdKFn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/ayBkih";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EmxBdKFn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4leT81992550
	for <dmaengine@vger.kernel.org>; Fri, 24 Jul 2026 08:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pdZVJG0sSU8HI/R/mxVTzICyO0P9v16DXWqFRs5EjE4=; b=a/ayBkihou6SdUOT
	w8q0fk54Po+i8+CFTk0Bm9aUkCRciI0mCP+knmVgPA/IdSYvzCV9mCaHNX0XlDqI
	963KN01K7QHO04LNf2lhLWwkp+B6NMDz6dUavjNRPbPRC/mCU4clou+s1MXkgj4r
	jQjPy7NDuhexFTXXeREADKIzhmvgWwPCnW+KindpVAdKMlAKZ3X8zZgopPJBZ1Z+
	02pwJJ5T4DkbVKF5hxRW+zCsXvD4WSvRvq316GZktLCKzLB5YaVrlvAy5TEiEUAC
	RL3top6+hGYNOS81/FOCNRlKR2jeTknRgYcohzvXKBs3tkrZeS41AQcJKiI/9jTd
	uShjCQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p50vj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 24 Jul 2026 08:29:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e04598adeso175837b3a.2
        for <dmaengine@vger.kernel.org>; Fri, 24 Jul 2026 01:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784881794; x=1785486594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pdZVJG0sSU8HI/R/mxVTzICyO0P9v16DXWqFRs5EjE4=;
        b=EmxBdKFnL7qI9hCmnv5I1glwEGwFuXKoDQnJEswddTI2osXQRlIpXxKjCEeCC90G2m
         R8hKHMO1MXPdffazfP7f41RxscKWoH5D0xCZaM72OmtTWKtTqdIKlyh/qTDk75eqbz8M
         yD55TpEacYAwOGRjQsfn5abklsO7H0JYSHHXtnQ3UNErQWEkRUoHEfHmHAyhRYfF51KD
         rH9kXuWDunQKkl86FYCc/tk9qMpCwkiQpAhlUiBv+qLn/UWVa4ODnEQhhs04c9pHSsAX
         vN7oJwSiWbR2ok2G+v3Ky014soYvvtBnBr73NDT9BkaQI7o8s+4U+Nbo9ZgGvd9MvBUT
         WQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784881794; x=1785486594;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdZVJG0sSU8HI/R/mxVTzICyO0P9v16DXWqFRs5EjE4=;
        b=mpNo0ubirGcxkuIFClcALaWLTs77i2/aF5otizUEW6yMOaqMaQMrMRwcgndceY5UWK
         R7DNokh22SPhD8cWr7LZoON3yRfVt85MKOvyoxw7wzCYcmu3D/oYI9gAGy2DfSKXufZv
         B8G6zWZ+yQN2ise0VsfMm/uuky5PinKWodqj6zpTWw47LifKreRaZIUqGadFQY+FrQmU
         EjxTIrHqBdIMsCN6IvJl9KOEYoVWOGeDmA4LH/0tIDaHipJqLQpXhPZnyT8qYpH0WXgy
         Qy3bwitEkYz3dvJ1xH1neLFZgLtmGCPL5S0knXK/yh7gI2LVT32LtWQHK26I4ET+SD5A
         ndxg==
X-Forwarded-Encrypted: i=1; AHgh+RpfqrikliJeW5pKh2oRcckfXeApUmhLcnmwINqhYsPDjqtgV+FbDcNsMrGFYyX2UKKTJaAeyeigR5c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6y2Ag6rYaF48hVI0Vczg7fm27Z6JIe3n2tvIcgBuVJ/SDjfHL
	Q18eG51Q4VeT5wGzBxIi3TuMYZm3MEhod0KHQTGZHd4KRDAarq+eBC7zQh+a1+qg5Y3btmRAdm5
	hrZNlpopl5DSQ+YceXI78TXh5S9oU3Vp3RbMeTKddnxuOiKYBVK21X8E7N6hDD4CHYS9469U=
X-Gm-Gg: AR+sD110cpOFPVJnKSEhqbVhOlZyJSU9HcT4cHmbsMueagdq0BNqpxPQJiIADmrXOb3
	Q2PCCL3JX/5ol3hJP+qmewQ/Hm+psCaS5aSWCbuyxGMMOrfOMxofDxW1vbt01MNeUxDgtky1W38
	yDIdiUrqGGnv45Ff3QZ0LqmilGp6hpK5OQz1BXKkxF9zEnVgdkuElmeysC2UELbJYaJy+NuHUyQ
	tdxpxQoK7hTlX29F9XxUHqa3l2KNnifghQoLX8Oydh0GsZzeV2G3CfU/enjMLf1KnpNt2b+9xmN
	lGLWP+uKwuoE2LQm/C28YCO5oy0NfAvZHIlvi8oRe4r8PaN1skFwhfvTR0i1H4rGPpwsGPeji58
	hOVJABmS+w2ssTT+i+NwhU1rqUoUMCuM=
X-Received: by 2002:a05:6a00:9288:b0:845:3fe5:cddd with SMTP id d2e1a72fcca58-84e2bb1c4eemr7500211b3a.36.1784881794501;
        Fri, 24 Jul 2026 01:29:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:9288:b0:845:3fe5:cddd with SMTP id d2e1a72fcca58-84e2bb1c4eemr7500178b3a.36.1784881793986;
        Fri, 24 Jul 2026 01:29:53 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237721sm4437218b3a.10.2026.07.24.01.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 01:29:53 -0700 (PDT)
Message-ID: <64bed353-9597-42b5-8fd3-a86b35781ccc@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 13:59:47 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] i2c: qcom-geni: Handle runtime PM disabled state
 during early resume
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>, Frank.Li@kernel.org,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, zhengxingda@iscas.ac.cn,
        kees@kernel.org, quic_jseerapu@quicinc.com,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        Aniket Randive <aniketrandive@oss.qualcomm.com>
References: <20260709134623.1724212-1-mukesh.savaliya@oss.qualcomm.com>
 <20260709134623.1724212-2-mukesh.savaliya@oss.qualcomm.com>
 <9cf5b5ab-c418-4b0d-8b2f-b888a64db0f0@oss.qualcomm.com>
 <933d864d-f0c2-4727-a01d-f564eb854d23@oss.qualcomm.com>
 <4133bbcb-22e7-41e0-b9f4-affd63df0e38@oss.qualcomm.com>
 <86828cb8-0e96-48ce-aff4-0f7e59438ad7@oss.qualcomm.com>
 <d8e2519c-4fe8-4db8-94e1-3231000bf51f@oss.qualcomm.com>
 <510c0d23-f2ef-4f1b-aaae-a7f3c90c24c9@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <510c0d23-f2ef-4f1b-aaae-a7f3c90c24c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a632283 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=QiQ5yfMOK301Ztg6guMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: C20q1ifInNvf6tTn87-5KSYs00AqA4Id
X-Proofpoint-ORIG-GUID: C20q1ifInNvf6tTn87-5KSYs00AqA4Id
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3NiBTYWx0ZWRfX/enNswhIYFGI
 RwPBN1M9TyW5Sfh9nggKupypDQ+5oOv4DBMryrPxD0mtNReuFZVOaP547p4tFU2tZK5zKZVhxyy
 y8RnBaVK5DWgv+JRbWmuMW+K+l8v7sM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3NiBTYWx0ZWRfX/of7PWTzursk
 Md6nM4gXs4ORY9iL50DImwfP4bn7pSWPYOyLyU/OJCTzbByB6LYadMHJ0MRRE6Axrfydmy3yOWr
 GtyguUTT5pPVEwCKlgXmG+3HMe1BjzeF1RhZW2HcmaEwdw2YSPsmgIEIXde6thcJHwEwwigfnra
 KXg38C+CKI3DPF7eRPwkHQjJ998BXyqqHz40KBuVeA+CHSisBKszOKs1QqNO41pX2eJx0PaoLX/
 heKtrzNr6IUCEaVYFbsaVsh9JG+SPJZXoxVTVIyFTqnKPU2oUplgZZP9B19rnn6/fiFQDbRfx/N
 DovrxCAdmZw0ZrA+gukufwxmeDgfAxsDcryn67sLiiqUMA1zjcwQUQi2wlN9mUWBsuWSCbLUEab
 98FKK5uWR21AkT2sJA4OtuuYVHadr7kvG5dk4vaMPieeOd66CG+PmUOIej+WbaimdxY1BBIO2ex
 9XJgirPiB49tBAaFi7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240076

Hi Mukesh

On 24-07-2026 12:05, Mukesh Savaliya wrote:
>
>
> On 7/24/2026 10:12 AM, Praveen Talari wrote:
>> Hi
>>
>> On 23-07-2026 17:14, Mukesh Savaliya wrote:
>>>
>>>
>>> On 7/23/2026 4:24 PM, Praveen Talari wrote:
>>>> Hi mukesh
>>>>
>>>> On 23-07-2026 15:47, Mukesh Savaliya wrote:
>>>>> Hi Praveen,
>>>>>
>>>>> On 7/23/2026 3:32 PM, Praveen Talari wrote:
>>>>>> Hi Mukesh
>>>>>>
>>>>> [...]
>>>>>
>>>>>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/ 
>>>>>>> busses/i2c-qcom-geni.c
>>>>>>> index 96dbf04138be..4bc00922cd97 100644
>>>>>>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>>>>>>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>>>>>> @@ -917,6 +917,10 @@ static int geni_i2c_xfer(struct i2c_adapter 
>>>>>>> *adap,
>>>>>>>       gi2c->err = 0;
>>>>>>>       reinit_completion(&gi2c->done);
>>>>>>>       ret = pm_runtime_get_sync(gi2c->se.dev);
>>>>>>> +    if (ret == -EACCES) {
>>>>>>> +        dev_warn(gi2c->se.dev, "Runtime PM is disabled:%d\n", 
>>>>>>> ret);
>>>>>>> +        ret = 0;
>>>>>>
>>>>>> Here it is clear that pm_runtime_get_sync() is returning -EACCES 
>>>>>> from the runtime PM framework,
>>>>>>
>>>>>> which indicates that the request was rejected before the runtime 
>>>>>> resume path could enable any resources.
>>>>>>
>>>>>>  From the rpm_resume() implementation:
>>>>>>
>>>>>> static int rpm_resume(struct device *dev, int rpmflags) 
>>>>>> __releases(&dev-  >power.lock) __acquires(&dev->power.lock) { 
>>>>>> [...] repeat: if (dev-  >power.runtime_error) { retval = -EINVAL; 
>>>>>> } else if (dev-  >power.disable_depth > 0) { [...] else retval = 
>>>>>> - EACCES; } if (retval) goto out; [...] out: if (parent && !dev- 
>>>>>> >power.irq_safe) { spin_unlock_irq(&dev->power.lock); 
>>>>>> pm_runtime_put(parent); spin_lock_irq(&dev->power.lock); } 
>>>>>> trace_rpm_return_int(dev, _THIS_IP_, retval); return retval; }
>>>>>>
>>>>>> The -EACCES error is returned when runtime PM is disabled 
>>>>>> (disable_depth  > 0),
>>>>>>
>>>>>> causing the function to exit without invoking the device's 
>>>>>> runtime resume callback.
>>>>>>
>>>>>> As a result, no resource enablement is performed by the PM 
>>>>>> framework.
>>>>>>
>>>>>>
>>>>>> In your change, the error is effectively converted to ret = 0 and 
>>>>>> execution continues.
>>>>>>
>>>>>> How can we guarantee that the required resources have been 
>>>>>> enabled in this scenario?
>>>>>>
>>>>>> More importantly, where are those resources expected to be 
>>>>>> enabled if the runtime PM resume path was never executed?
>>>>>>
>>>>>
>>>>> This was answered in V6 already on 7/3 exactly at same place.
>>>>> Pasting below.
>>>>>
>>>>> ==
>>>>> > Why we are checking specific error code here? Why can't we use 
>>>>> the below error check directly?
>>>>> > if get sync itself is failed with pm runtime disabled then why 
>>>>> we are going ahead by making ret = 0 here? How you will make sure 
>>>>> resources are enabled?
>>>>>
>>>>> This reason is also mentioned in the commit log. we surely get - 
>>>>> EACCESS as runtime PM is disabled during no_irq resume phase. We 
>>>>> still need to serve the transfer, hence we need to override it.
>>>>
>>>> We should not get it and not go further since you are already 
>>>> enabled in system_resume_no_irq().
>>>>
>>>> I just need to understand why we need to proceed when we 
>>>> get -EACCESS as runtime PM .
>>>>
>>>
>>> ret = 0 was added because during early system resume, -EACCES from 
>>> pm_runtime_get_sync() indicates runtime PM is disabled, not that the 
>>> controller is unusable; treating it as an error would incorrectly 
>>> reject valid I2C transfers occurring during resume.
>>
>>
>> What is the purpose of enabling runtime PM during system resume? It 
>> is not clear how this helps, given that -EACCES can still be returned.
>>
>
> I think you didn't get noirq_resume() change. if you review code, we 
> do force_resume(), but that doesn't invoke transfer time 
> runtime_resume() via pm_*_get_sync() call because device has runtime 
> PM disabled.
>
> Hence we need to call pm_runtime_enable(). In my testing, have seen 
> that driver returning with -EACCESS if not overridden with ret = 0. 
> That's the whole point. We need force resume and transfer to serve 
> early resume transfer. Usecase demands this transfer without failure.
I have gone through  noirq_resume() change.

force_resume will be executed only if force_suspend executed otherwise 
it won't execute.

IMO, If PM runtime enabled for device, it won't return -EACCESS.

What is the purpose of enabling runtime PM in the system resume 
callback? We still appear to encounter -EACCES despite runtime PM being 
enabled there.

>
>>
>>>
>>> Other than early PM time, we are not going to get -EACESS. So i 
>>> don't see any case where this will be a problem.
>>>>>
>>>>> Review geni_i2c_resume_noirq() to know what all we do to enable 
>>>>> resources. That's guaranteed and tested with system suspend/resume 
>>>>> test back to back and PCIe could do i2c transfer successfully.
>>>>> ==
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> Praveen Talari
>>>>>>
>>>>> Do not keep this thanks/regards here. only leave the comments.
>>>>>
>>>>>>> +    }
>>>>> [...]
>>>
>
