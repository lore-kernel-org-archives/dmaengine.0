Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA473D3486
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 10:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804084; cv=none; b=e5KIjSgZc3eXb6NJMnsbPNAITDRxPxeXm2UQX9k6kN0bo2oZjezbN6MuQqT4+RVoPgwYwCo3TpNyYSFM9kndmWF16nrRSpllY+EykDCLz4Icx+cXKiwJ5fH7yGY9Jo/9WA7v02FnqRgUlg33DFWMLxul/j62TIfvzVT0onljEbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804084; c=relaxed/simple;
	bh=7bPVFROIqjuLQSAM7RyTDXhIogkJo+mGvCdFs7fGT6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXfcaGKEOsnaIIK6KUQhFmEH5l9OhZHdyIR9tAF907N2z1jQoZt04kGEfMzo82zrmrMR/uvMkShor9rQ9EzXrlACtg+wYOSi4LFNcaAPUtfgzLt6fMgxGMmeaEIY1jWu0XJWRz4DFetIdZqZ7+nxSxePZvmHUJtOPx0b2mQDDbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dC+QH+LT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jyb5Pn+V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dC+QH+LT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jyb5Pn+V"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qkhW3642784
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 10:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wNG7Bb8DBT2b56LvpJ/oDJNSiuHjzgZKwZfV3mCfivg=; b=dC+QH+LTYYkQL2Su
	6x7s+vo2ZIxDN5DuWn7ucyTQaN6GQekF1rMIilHHZamPTNotUXCJx35Dlg9r5+tr
	vgc45cHTjC7h/xGCdYbZX4COFB6C0UBSYXnK0nB0yB8aJ1sk5wTiTgXeMsZVCZAH
	vrX32rvkuX7DD04HsDbueCIEOS7HzGlPKJa3ThIKGhy4ucmlqo1fQrSisWs84wFM
	ii1rKnLrVDHKsylcTJQlTPbGSIi9qLoSpl6Ta5nThv6UPCHzuaLDgBQdHhZCADAY
	uJgjhnT6rz0boaDP93AhnAOHos10evytYXDXvdPMN8ZnpWPPv3URtt/n+w5RM3mA
	X14L2A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkayh9nse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 10:54:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84842381150so1025895b3a.3
        for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 03:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784804073; x=1785408873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNG7Bb8DBT2b56LvpJ/oDJNSiuHjzgZKwZfV3mCfivg=;
        b=Jyb5Pn+VDcu/FVnI70SNUmuYQgBvE5D0mhLaa35DLxPFYRASbBw+EZ22zQwdAPDPmz
         X4Kcl+V7on9pM2tA4Q2gVuPhIxr2Q6/cxy/UOwiFh1fMbjZDCQp3TTpPVo9NiMmeLz74
         9KbNIq+xxpkYdxFc+8zco6s7H9m2/Okq7Qju/MwfsHAu2icdmKCabz1kU15o44mmjaI5
         7b/ExvF/JP5DxEuhOE7AKs6MNDBo8Q7JFRMdVZ228pgQ6dKADq/wB9AKWs6K5egsRI7D
         Rn2whb1uSTdYXOIuxtzl5b8ZyeqAz6wi2gJ00N/uniuxa0GjGqDwDpw2VYbDtvEhJNY1
         5yXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784804073; x=1785408873;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNG7Bb8DBT2b56LvpJ/oDJNSiuHjzgZKwZfV3mCfivg=;
        b=IZ5Mqqk3gPuRj5tKP7vH9BgNpX+JHKPLJ1eTx2g3p5Y573xCv9cW8uzeZZPOXnuk/m
         CsdW+/JDMBHtKYdUF1775byQD0gSepH4curdP8yrjicnxdkh/gCi5hC+DIj2srk/JNQ+
         XtyTnVlPJajimsDGTgJPPmCWePXHhARIhNsO8yxFkGaE7SCAgejizSl5iqWqjsIMdY6X
         ZAdflmz9n4T9Aj6KoSIlw9POBL+lY+p7dN6PU9eNI1HLB0GcVLyJg9WdfYYPec9BXF9C
         l6NqDv8oA74RhFVcAAPMajtVCE7wW6yoDw5KlHpnFo7w63CQxiJb1x0CAc67h3q1QDRg
         G6ww==
X-Forwarded-Encrypted: i=1; AHgh+Ros9UqrhdK49k+uDN6LjIW5ueNQ05+5G9lTYft7ZbRKcw0Mr7YiyokKzsoXxaFJOgoMlfEXjQ3Z624=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMzp44YGuxE6FWk1oeww+SfWsayFlqSZG8rM6WYqJMhQRMVXps
	74ZW2ozMdtoAM2v3azTE9+u790zwAxAG+Cyqkihmjq39p7NFJqe6pF2OQmoS/QWtWIlrG+H9+Uk
	i48msUtPMvCFF1xOxsHqoQ/NsShL+SQLuWj8IoD5lESUrNRxWXqUgVcENVsO79Rg=
X-Gm-Gg: AR+sD10jWgbPuWk7qzSwaU6eB0rG7wWDuEPUbZNErP9D50P+U7d7K1ttDeQDpC2Ki3h
	KgmSZsqouasSL8kj5ZuAWD70WRir2v44KWeBtqT/bce4vnH9Fi7VrAzz3gIoGOLXJdWFSTn5yus
	Ixy5avWxIqeBcU6I9KoehaNfzQ8gIyJ/LPJSnkkKtrI9yGlJpfBYTLoqEOspFG0tRyw5wNScI95
	9Vxy3qXI4/+a4Zk195WZVtbpnZhXX1iT6CST6M4IKyMP5UdVmageF2/tpNaX9A2eo2QQXxnSYoh
	aF/vycdVGNDiM4G9V5Iwemy4Lfi16iofTAHzkTMb4UH3AZD++a9m06f9Xmqqk9It3e0GsSFepau
	yerxekaSb2H9HYQlKKJXbA5O1xoqeCOs=
X-Received: by 2002:a05:6a00:950e:b0:848:67ca:bfd with SMTP id d2e1a72fcca58-84e2b7f83f6mr3146207b3a.16.1784804072767;
        Thu, 23 Jul 2026 03:54:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:950e:b0:848:67ca:bfd with SMTP id d2e1a72fcca58-84e2b7f83f6mr3146161b3a.16.1784804072036;
        Thu, 23 Jul 2026 03:54:32 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17262e33sm2906433b3a.14.2026.07.23.03.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 03:54:31 -0700 (PDT)
Message-ID: <4133bbcb-22e7-41e0-b9f4-affd63df0e38@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:24:26 +0530
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
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <933d864d-f0c2-4727-a01d-f564eb854d23@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a61f2e9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=hKlI1_g4CyTrXuPfMs4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: fEMiECDCbaU5QDWzA6ljs6pOY9SC23Rs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwNyBTYWx0ZWRfX1qcZwdebATFw
 Qvf7SFXNPcjwhLzhj4gg2JEJVMR/s3ajsNSquxjTEsIah++zy4unzGx4iRLXDhhKLsWYXkEWl9k
 AZTorkHKAnFAMaCSBHLpWZEwJdwUKmhetbAo6ZVHFlVwRHAWFssZ2mXBIPBpxF6enQwtIRnYtw9
 dRvPajc8KxBtF6erMKjLDR9KfbeEcscEa+xajGBNBro4M8ZKx1iXyWWK65UEoHPmN9/6JKAhzio
 xybBGkEN/2BQxcfo4VSyoBg2SUiQT9v/U/YCmoXcuQfmgwNlF3EkX6mYScIAPM2s0bg67U8Jld0
 zD01yiIY1KSUJAXxNiPRCYumvrRFZ7JjaII+ccndgA3VvYCsovIWS5J8mdrGq4mf/t6bOI9Zk3o
 jM3pYCkXlCMzNbvus08aigHFbO5/hdQj95cLBbXaLamWcg6l0xNK7qdtpWdsMw/oESayPuF24En
 6oPKKxxKn+7+9u4cp9g==
X-Proofpoint-GUID: fEMiECDCbaU5QDWzA6ljs6pOY9SC23Rs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwNyBTYWx0ZWRfXzprsYZmns7AZ
 rDhJYA0pRVBEivom01QK0uJgFKJHl2AqYZqwVQpyx08HA4DoFKN9z9i3ufJ5Yv14jIxAGC6nfcS
 xY1BRG8ce0pUNFNrBigZtGN2YJz+Erw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230107

Hi mukesh

On 23-07-2026 15:47, Mukesh Savaliya wrote:
> Hi Praveen,
>
> On 7/23/2026 3:32 PM, Praveen Talari wrote:
>> Hi Mukesh
>>
> [...]
>
>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>>> b/drivers/i2c/busses/i2c-qcom-geni.c
>>> index 96dbf04138be..4bc00922cd97 100644
>>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>> @@ -917,6 +917,10 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>>>       gi2c->err = 0;
>>>       reinit_completion(&gi2c->done);
>>>       ret = pm_runtime_get_sync(gi2c->se.dev);
>>> +    if (ret == -EACCES) {
>>> +        dev_warn(gi2c->se.dev, "Runtime PM is disabled:%d\n", ret);
>>> +        ret = 0;
>>
>> Here it is clear that pm_runtime_get_sync() is returning -EACCES from 
>> the runtime PM framework,
>>
>> which indicates that the request was rejected before the runtime 
>> resume path could enable any resources.
>>
>>  From the rpm_resume() implementation:
>>
>> static int rpm_resume(struct device *dev, int rpmflags) 
>> __releases(&dev-  >power.lock) __acquires(&dev->power.lock) { [...] 
>> repeat: if (dev-  >power.runtime_error) { retval = -EINVAL; } else if 
>> (dev-  >power.disable_depth > 0) { [...] else retval = -EACCES; } if 
>> (retval) goto out; [...] out: if (parent && !dev->power.irq_safe) { 
>> spin_unlock_irq(&dev->power.lock); pm_runtime_put(parent); 
>> spin_lock_irq(&dev->power.lock); } trace_rpm_return_int(dev, 
>> _THIS_IP_, retval); return retval; }
>>
>> The -EACCES error is returned when runtime PM is disabled 
>> (disable_depth  > 0),
>>
>> causing the function to exit without invoking the device's runtime 
>> resume callback.
>>
>> As a result, no resource enablement is performed by the PM framework.
>>
>>
>> In your change, the error is effectively converted to ret = 0 and 
>> execution continues.
>>
>> How can we guarantee that the required resources have been enabled in 
>> this scenario?
>>
>> More importantly, where are those resources expected to be enabled if 
>> the runtime PM resume path was never executed?
>>
>
> This was answered in V6 already on 7/3 exactly at same place.
> Pasting below.
>
> ==
> > Why we are checking specific error code here? Why can't we use the 
> below error check directly?
> > if get sync itself is failed with pm runtime disabled then why we 
> are going ahead by making ret = 0 here? How you will make sure 
> resources are enabled?
>
> This reason is also mentioned in the commit log. we surely get 
> -EACCESS as runtime PM is disabled during no_irq resume phase. We 
> still need to serve the transfer, hence we need to override it.

We should not get it and not go further since you are already enabled in 
system_resume_no_irq().

I just need to understand why we need to proceed when we get -EACCESS as 
runtime PM .

>
> Review geni_i2c_resume_noirq() to know what all we do to enable 
> resources. That's guaranteed and tested with system suspend/resume 
> test back to back and PCIe could do i2c transfer successfully.
> ==
>>
>> Thanks,
>>
>> Praveen Talari
>>
> Do not keep this thanks/regards here. only leave the comments.
>
>>> +    }
> [...]
