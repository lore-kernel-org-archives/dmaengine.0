Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A174582C5
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 11:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784807081; cv=none; b=sFWokhOWNIIVyixatFCMKO3vHsfxuXGGnz/R5ra4qsKotcmV/JbSxvV/CACwDClz09WVD0J/M/+wLZ8th3acvsuF7hBJMwUIE3pl0kXjASoS2T2xvyNaxkvA2JU94eMAi8+hA51QIjxYwm8HFBJ5eMp40B+WgPNlBc5tiE6TYVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784807081; c=relaxed/simple;
	bh=yNk5ayV+sOFk5lN+oWzOgeSWPGYcPRXYNiFi5ZzWQ/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Br9GB8R0P3viV8tWjCOTa0LBy7RqAFJ9eLdt6+j09r2THgKpTKBOC0DeoDIkc+d9eexsmkOhjVKaglhWDeHFse87BvaMCoGlKQjzlXoAz70U53gUbulWqk3Raq97XGG/9UmHHVNZ5hPNSp4koBZVXPzLj6shQXKZ09vSfz9mlco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JeZaRZi6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aUb4hEob; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JeZaRZi6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aUb4hEob"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qbAR3606119
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 11:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w0BzviMLtfRALGN+wRIhQVvryB1XDCPgSTyAMutH4w4=; b=JeZaRZi6gegkPELU
	+9dhHDIlhooz/rvluMEpkl+J2S8Mar7sFubdswm0PMngSvnOisI2EPNOCE27ohJ4
	y0sbK8+jBsaD9iMVVW63bXqW6B8IwYmqfqQeKUeNaE5laK8WVzwxkplgEphQLgi9
	ggH3h8GZOkue0A7GfVGVc+R0o09nC7pYeVv3YpxC9Q2Ev1rnWNVEKPevRumNtSsh
	G6Mccb1WaQr7LS1qLTDgJuBUDjBXWnNe2ItwDDL3+FF1SELMG9aZjVThRvbEKgEy
	wjDhIcYVDknPIe6cE4a1XcNu3AtNdCn3Sexf6sHurQihQi5puQxxJPB04OvxJtCq
	LFuq4Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke7qh3c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 11:44:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so6398095ad.1
        for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 04:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784807074; x=1785411874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w0BzviMLtfRALGN+wRIhQVvryB1XDCPgSTyAMutH4w4=;
        b=aUb4hEobqfXV+m3O5DrYUEutC1UatM9TpZka2s9Hvh+/kpa+9a3noUJbeyzOqzUnjA
         J4xGGklcwqYbtPgl9wSWTFS90XJMgtmqK5iiGYmJbkXQaUu0CUS0y3JJWVbRbzj+Xbxw
         BVJaHHZvgb/J5z03tKIb30TU2MBlvKU+M4gQJiEgvYg9wreGGmMG3ORmfk4dWZfdWXcI
         rVzKPXRLRryimWSnLtLs/ZRgjHaevwEBWUaU+TOGfGzT0KYIQJoVpdkoexAVpaE0buFQ
         ZH1wprvM3EJHRophjS7oDuJ3h3ygSNKLeP84T5/+Usc1+HSoLF0xzxrE4dvZWCQ5RAwW
         gmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784807074; x=1785411874;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w0BzviMLtfRALGN+wRIhQVvryB1XDCPgSTyAMutH4w4=;
        b=Nv1UNGWoOn6r83w4/0RvTinRJybYQ7qvlXVNX3DHA0lvg3e5bEk0akIzboygJq/3cN
         L6LNF/2Lnu8ri/DNv/WorJUrFyLymdg/W6neqaskXVgbX9qGghipoKlc0PrEu5jImZS9
         PZT9lsK5aMg05m1t7aQPPbxGZB6vWiljhQkf9c2XgL6SSj+SR3kQGFmpW0wnDIjfszNE
         3QrImFdAkPkmfLqK7QzcvBxCE9dv6cCQhRTxxrP8KaBBsPVe2uC4DGeKZ0bGP08Uy53V
         ELLz+P8RtxYIYkIv4Bpv3Y85OOGEvhE3OGHy4SN8YNJVrl2CcW7NE6dscfWBd/twsp42
         t3Ww==
X-Forwarded-Encrypted: i=1; AHgh+Ro4Agcgi7p4uRV0lIv/BaCBH05rM5DQujsWFfBHi081TxaKP9PfeFnUmLGlH67IoL2idGym1y/Mbdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YySib0JYo/GPw8EXqBDNtBFM7rya3+gsi4UDX6po6ufYO1ortu0
	1FAlHCN4PJejlZ1Oxl6YaHysOFdPOnBxdNAzNRSoeSPFEILH++PrWOv8w0L3qls1WE+xBVBkCyt
	cKsh3depwkuuVqdbKFjeeli5ulFjLXYssPFvS0hDgifHq6KD4rMY98NDCgKF78TUZxMK9G40=
X-Gm-Gg: AR+sD134eXF1wwo55ivgeeacXO2elHLafCBHSlKBQzwnnk6Yo/pLVvsazE1LcXsK9h6
	AXRX6Tc+3ARDK2Fk7haUNlY6jkHc4fEVIQE82bJMcNNBKH8NIKPKfkApUujgooKUZk42j7rdo0Y
	vatJ/0YsmiRJO7j5mhCWfwEj4kt+bqRRj3u6z52EfZU+2bQ0bH217rYBjjhCP17skRsXZYZndeS
	MhSw3kDcqefVEKJOgrfd+Q4fD8A9J0ByGy941hly9TZskOkqm5lklFZm+u6M03E3R4F68KBvW4k
	XHRlHD4AmD8q4ZeKW8z8/UfIbF6efdYicN3YNkqzAcnPtp5xnaPSzhmJ228lvPyPHsnZ7xcpI/3
	WvhzRVAR/1U/MzRajZJD8LVDrkmDpYcc3d/Y=
X-Received: by 2002:a17:903:22cc:b0:2c1:ee75:56bb with SMTP id d9443c01a7336-2cfa6b9aefdmr34135095ad.20.1784807073890;
        Thu, 23 Jul 2026 04:44:33 -0700 (PDT)
X-Received: by 2002:a17:903:22cc:b0:2c1:ee75:56bb with SMTP id d9443c01a7336-2cfa6b9aefdmr34134805ad.20.1784807073412;
        Thu, 23 Jul 2026 04:44:33 -0700 (PDT)
Received: from [10.217.219.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f350560sm32340755ad.68.2026.07.23.04.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 04:44:32 -0700 (PDT)
Message-ID: <86828cb8-0e96-48ce-aff4-0f7e59438ad7@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 17:14:26 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] i2c: qcom-geni: Handle runtime PM disabled state
 during early resume
To: Praveen Talari <praveen.talari@oss.qualcomm.com>, Frank.Li@kernel.org,
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
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <4133bbcb-22e7-41e0-b9f4-affd63df0e38@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDExNCBTYWx0ZWRfXxdE8yAY7ZTuP
 0ku5Zf5aEzj8MB2ik0BBfAwfJExV3oxetzREAHrRjkpgryWO59q6gjX2kU06ahWeVhO2bGFFKqb
 Oq9mhPqvQR36SRCmN6LBK2cnt2+WisU=
X-Authority-Analysis: v=2.4 cv=aYxRWxot c=1 sm=1 tr=0 ts=6a61fea2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7mBe-9PINDt9wbQolioA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: hiQMyYtDtBXbe1tB_FE50Ri3pnAgRd0R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDExNCBTYWx0ZWRfX++swZyGAioZ1
 P69uvBMwZ1tEyr3uZxw+dO1fJdf5ysoO3Y6GYSS6lzDiz8tkbdu2tOPQPiudgoklOmOXP4FgiZ3
 O0i3K3nY7D+STjQn+9Hh8AWJAXdBSI9wKxPj0e0r3mlNWDDBZd035VHYg39NB8Ufm01+HNXCSlA
 MMkQ6WF9ySfEammGAlL8WU8Uw9pPuS4aqfyqCtKkeo/A2RxwONPUdpou+ja2zKTvQwbXEVqLoQK
 oX0+7prjsOIPEMopJUQrzJODgHLoEHFv4l5yFpr22SSW9n2AS6n0z75pYZHbQWZ8vu56bu4k47Y
 lJQIkuMOkM5hYW8RKsHiczdZRbyz9kS4Q13SyUYkLTEu+UW38ZS8ERQb0jRLepN0ipTvR9vtgxB
 tecdqu9bhXjGealw+J8ogKyPusR1Br+B9+VfonLEpM7eHi5a/5yZI4Dw76wz3GFwBWlA+x1GwGn
 zPqoU3womoZeKc1kQjQ==
X-Proofpoint-ORIG-GUID: hiQMyYtDtBXbe1tB_FE50Ri3pnAgRd0R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230114



On 7/23/2026 4:24 PM, Praveen Talari wrote:
> Hi mukesh
> 
> On 23-07-2026 15:47, Mukesh Savaliya wrote:
>> Hi Praveen,
>>
>> On 7/23/2026 3:32 PM, Praveen Talari wrote:
>>> Hi Mukesh
>>>
>> [...]
>>
>>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/ 
>>>> busses/i2c-qcom-geni.c
>>>> index 96dbf04138be..4bc00922cd97 100644
>>>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>>>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>>> @@ -917,6 +917,10 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>>>>       gi2c->err = 0;
>>>>       reinit_completion(&gi2c->done);
>>>>       ret = pm_runtime_get_sync(gi2c->se.dev);
>>>> +    if (ret == -EACCES) {
>>>> +        dev_warn(gi2c->se.dev, "Runtime PM is disabled:%d\n", ret);
>>>> +        ret = 0;
>>>
>>> Here it is clear that pm_runtime_get_sync() is returning -EACCES from 
>>> the runtime PM framework,
>>>
>>> which indicates that the request was rejected before the runtime 
>>> resume path could enable any resources.
>>>
>>>  From the rpm_resume() implementation:
>>>
>>> static int rpm_resume(struct device *dev, int rpmflags) 
>>> __releases(&dev-  >power.lock) __acquires(&dev->power.lock) { [...] 
>>> repeat: if (dev-  >power.runtime_error) { retval = -EINVAL; } else if 
>>> (dev-  >power.disable_depth > 0) { [...] else retval = -EACCES; } if 
>>> (retval) goto out; [...] out: if (parent && !dev->power.irq_safe) 
>>> { spin_unlock_irq(&dev->power.lock); pm_runtime_put(parent); 
>>> spin_lock_irq(&dev->power.lock); } trace_rpm_return_int(dev, 
>>> _THIS_IP_, retval); return retval; }
>>>
>>> The -EACCES error is returned when runtime PM is disabled 
>>> (disable_depth  > 0),
>>>
>>> causing the function to exit without invoking the device's runtime 
>>> resume callback.
>>>
>>> As a result, no resource enablement is performed by the PM framework.
>>>
>>>
>>> In your change, the error is effectively converted to ret = 0 and 
>>> execution continues.
>>>
>>> How can we guarantee that the required resources have been enabled in 
>>> this scenario?
>>>
>>> More importantly, where are those resources expected to be enabled if 
>>> the runtime PM resume path was never executed?
>>>
>>
>> This was answered in V6 already on 7/3 exactly at same place.
>> Pasting below.
>>
>> ==
>> > Why we are checking specific error code here? Why can't we use the 
>> below error check directly?
>> > if get sync itself is failed with pm runtime disabled then why we 
>> are going ahead by making ret = 0 here? How you will make sure 
>> resources are enabled?
>>
>> This reason is also mentioned in the commit log. we surely get - 
>> EACCESS as runtime PM is disabled during no_irq resume phase. We still 
>> need to serve the transfer, hence we need to override it.
> 
> We should not get it and not go further since you are already enabled in 
> system_resume_no_irq().
> 
> I just need to understand why we need to proceed when we get -EACCESS as 
> runtime PM .
> 

ret = 0 was added because during early system resume, -EACCES from 
pm_runtime_get_sync() indicates runtime PM is disabled, not that the 
controller is unusable; treating it as an error would incorrectly reject 
valid I2C transfers occurring during resume.

Other than early PM time, we are not going to get -EACESS. So i don't 
see any case where this will be a problem.
>>
>> Review geni_i2c_resume_noirq() to know what all we do to enable 
>> resources. That's guaranteed and tested with system suspend/resume 
>> test back to back and PCIe could do i2c transfer successfully.
>> ==
>>>
>>> Thanks,
>>>
>>> Praveen Talari
>>>
>> Do not keep this thanks/regards here. only leave the comments.
>>
>>>> +    }
>> [...]

