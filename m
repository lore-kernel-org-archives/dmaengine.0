Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6803E7BCF
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 10:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784801838; cv=none; b=gK54EkbWrd0LJ33g9PO+2ogfFpHiwk7eGCcI7Ad4iwWCn2nRgUX3sl+Lw9Qzuy0B8cYzb1w3yR6bp9UJl14FhEJV8jvbLimDa9ZZ3dFVb1cvOnyofChaxtvOxVoQR1V/PqViSukuW6bZ/JAnc3K0waGKmbyovYSEvte58d8bx1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784801838; c=relaxed/simple;
	bh=mDyxfx/NZz9oNnZFCPreKorg39pfBefeKdll9onCsN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VPbcapZPFWTxremKs55py4+PuoRSayMIYWfwalxy5ZfpZevnTV0S9HLZMnoDgK/auhW5Y0j5bgAqgmrDiboaVjNQ09jMYJOpHujjE0xCJKMKiYBEweo/ebQRSR/uHQw6Dpq0t9AhvSjTevvaw/Pv1yKbeBF7q73VoWw7lhsibLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UdSRW8kq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MNzYJELU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UdSRW8kq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MNzYJELU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qxOu3789846
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 10:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IzqDP9svjE918lug8DfM2SuGbpL5ftEU4aAYCmv2ZJY=; b=UdSRW8kqefYachFF
	IV9dIp0qf3FYQToOala+OeCf+onFCRSUlJ5m/XLXYV5ewf7tJSnhJfq/y67tJXOF
	wa8YYhjuvkXW/xnvyVvSUrGA25N9s+RZXAjoQ8AVC1DQtI3I3PufosAMj/SXKlga
	p5cWJ8WTFYWjBTYlyWz1gcuhwYgtZnSmogzMy+h/RJS7U2V6fFWWicBHqKgaWBCc
	7S99MKBEB2/7vIUif2yqSTF2gKdBO3Sw7JIkocPzkKqqU1EBihIXwOpgsApXZ6I1
	g3rZx8/esa5F7bi/pfWiFcnoOJoamcfwyy7qYVQVbN91Nd4Gz1gIYBcvJpJK+lN2
	OIpq5Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b529vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 10:17:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf6acd760cso8006335ad.3
        for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 03:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784801836; x=1785406636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IzqDP9svjE918lug8DfM2SuGbpL5ftEU4aAYCmv2ZJY=;
        b=MNzYJELUZwVpTKje6CyyjK2TuQpT9fLyN7jgF4WuvxZG1ucSFbwqmQFdpaGazjXuaM
         A8wsj9zZMTtyP/gj2F88FmD2mabzhbSmC43AlI5+rZ5yUuPDyy5+VChYKkShoC8XLm/w
         Gr6ezY9KbUeoU09UKtvStMzRandlE9/2VbHFcmqyQ0jISj2eXlAO6ckzC9vYx9/rJUom
         rLsYSyvbX8lB3N5qP/bvLZaiBYHM0lwVKx0ZlGkstp+fxDGQq5iGYqx+VjN1MWyzRpyb
         i/7pkql+VYO5P0J012mh20UlEi2OfoRu1JlILwX8CbzL8vwzsY11MWT0kPBN4nXBRLd8
         kZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784801836; x=1785406636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IzqDP9svjE918lug8DfM2SuGbpL5ftEU4aAYCmv2ZJY=;
        b=YycD4C1s5Z34ynLrycOI5v8IxdCDa5aUuZkjDyRZzItcL10FcyVIc8APE1+kM6QX7R
         xLaMQ5xIZIJwpJ3RBGZEIa8r7Amxd10MHmx6JAUoDhuPfve5/8pDxnEkmBMCEDhww+4k
         vrxomb6w3CvCDC57FM09yFcPK73fZYI7YBhZgTuPXc0opvc/2iLSADqfNyqzSqkpTeRz
         jUt2jlMIGRkcmkFk55al7hBsqEcyhDTsp3nCRtyNyCWrR4IrQTMta0xbpHKn/JRQhsDD
         UiBCHKEGO77nC6e3k/gk6RicxrUG9kEXabIyMMLBuy++d1DLoCN/1DlHEPa7xuKeIevB
         nuhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpdf8LksbgXgfwMDvupZ6uwFV6QZVQOJK3pj2XaOz9AIzheTAyXbVsOlCtNhMjZ542P7DHnqnCEQ6M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxoj5gZ4TERpFgQWRZPwBEPd+Ttsw9KQGbSRS9QE8rZephhMiJp
	Bum1Qmt+HnF2pjJwg5wyXDv2gDr3AbRhqf4RtHbJr38ViSLcUpaTlgpg62Z0rxhBFxNKklryxD8
	yq5cg4V+NT8V5BFPiazqIMcf32m19i/zqx3iKYy9sV4xfscxRfVTU/qsO12ME6YA=
X-Gm-Gg: AR+sD11mvVo9aMmYpO7m3hFY4feAfGFX3T5XF1zXw6iBZn0zdq+1pWp9a/fTkBSRmJe
	RTTVTgBmgIIMDeP6p2uUiAOXkFbJcmx3k8aElilNvuJ7pNVCcmCHQBAPBIOsrQFvW7/8SbIW1yz
	B6D9dKDLpJf8rKIOS1tK1yswebE9unhc+9a5Pb2GDp+BDvw3IIPfS1QqJC393pOzqEWgKoNNFi7
	0U5mQnIOEcNMW7INrZcYRXbDDDBqOTHZHoRxOnw1FLbE6q6YylZX7sNZ+WO9WQ02utpgDhFhGgi
	J79yKBd2oCKd1wx/KvlvEXoIUtUII0l3/BVNOo54tHd80MPJhOompo/kOKiZcVFotCv+I9WPHoL
	xAD7AXoAAURK3eCOuZkgqGCMbdTsvG1u4rSU=
X-Received: by 2002:a17:903:46c6:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2cfa6a51b56mr29011795ad.2.1784801835680;
        Thu, 23 Jul 2026 03:17:15 -0700 (PDT)
X-Received: by 2002:a17:903:46c6:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2cfa6a51b56mr29011245ad.2.1784801835131;
        Thu, 23 Jul 2026 03:17:15 -0700 (PDT)
Received: from [10.217.219.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f3b7c9dsm30151915ad.83.2026.07.23.03.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 03:17:14 -0700 (PDT)
Message-ID: <933d864d-f0c2-4727-a01d-f564eb854d23@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:47:08 +0530
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
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <9cf5b5ab-c418-4b0d-8b2f-b888a64db0f0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwMSBTYWx0ZWRfX+0PCP6oPtJgD
 h8Jlmj3gZT63okrkifPzf1W4ptxMkxlEU0Sugo7vE+p/Nao0qc+fEYalabrzsjydZeeDuLYwNkp
 64Opc+Dn2iL/dHL4Up19Hpp72G3qY8AJAYfe3p2QlXPISkzqSBXM/74RPMuafxWoCfuvGamCE14
 eJNgXIm3/5Z6pz0PzAYuBYhdyt7Gve3ZRlUTbQDFpAgFJbI1oYNGTJEolAtkE1EnebxPJI9K2fF
 hNHs9xfYecmjELW0IjKjDlqRfNl1NQE4nfXbSXcGsarbyebc/q85Xtr/jdNwQeFV4g4fKfC/q8S
 D1wYrXvl4tiAVbR0Gyz4+POMrVpyQy4sCarZ6NDthIdTPtSckyXxvn0Kkx+RWTnHbrzyLqYE9y7
 DfmgMyVPVG8Eyi2LZSo/B2L42dkm6u2ZUQmbxLh+4OLZHnUYM/Li2G7fa1isA8fEdvq/GPizATw
 bjLA+kik9TaheqvisqA==
X-Proofpoint-GUID: 7T_pSBcYN7ifOXcH50dfHR4axh0b_Zy6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwMSBTYWx0ZWRfX2NtzK+UPI+yi
 AZESyuTfL5rZgPaXTDjz1s6A2HNJOjBLWikgZxn98rTeHZnukUbqV5K6+4liboULo6lQxxwdIcy
 vPBfouGeTpH0Mow5aSEpWFkh/dK88yI=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a61ea2c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7hCvE-jUh320BGmwNlAA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 7T_pSBcYN7ifOXcH50dfHR4axh0b_Zy6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230101

Hi Praveen,

On 7/23/2026 3:32 PM, Praveen Talari wrote:
> Hi Mukesh
> 
[...]

>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 96dbf04138be..4bc00922cd97 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -917,6 +917,10 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>>   	gi2c->err = 0;
>>   	reinit_completion(&gi2c->done);
>>   	ret = pm_runtime_get_sync(gi2c->se.dev);
>> +	if (ret == -EACCES) {
>> +		dev_warn(gi2c->se.dev, "Runtime PM is disabled:%d\n", ret);
>> +		ret = 0;
> 
> Here it is clear that pm_runtime_get_sync() is returning -EACCES from 
> the runtime PM framework,
> 
> which indicates that the request was rejected before the runtime resume 
> path could enable any resources.
> 
>  From the rpm_resume() implementation:
> 
> static int rpm_resume(struct device *dev, int rpmflags) __releases(&dev- 
>  >power.lock) __acquires(&dev->power.lock) { [...] repeat: if (dev- 
>  >power.runtime_error) { retval = -EINVAL; } else if (dev- 
>  >power.disable_depth > 0) { [...] else retval = -EACCES; } if (retval) 
> goto out; [...] out: if (parent && !dev->power.irq_safe) 
> { spin_unlock_irq(&dev->power.lock); pm_runtime_put(parent); 
> spin_lock_irq(&dev->power.lock); } trace_rpm_return_int(dev, _THIS_IP_, 
> retval); return retval; }
> 
> The -EACCES error is returned when runtime PM is disabled (disable_depth 
>  > 0),
> 
> causing the function to exit without invoking the device's runtime 
> resume callback.
> 
> As a result, no resource enablement is performed by the PM framework.
> 
> 
> In your change, the error is effectively converted to ret = 0 and 
> execution continues.
> 
> How can we guarantee that the required resources have been enabled in 
> this scenario?
> 
> More importantly, where are those resources expected to be enabled if 
> the runtime PM resume path was never executed?
> 

This was answered in V6 already on 7/3 exactly at same place.
Pasting below.

==
 > Why we are checking specific error code here? Why can't we use the 
below error check directly?
 > if get sync itself is failed with pm runtime disabled then why we are 
going ahead by making ret = 0 here? How you will make sure resources are 
enabled?

This reason is also mentioned in the commit log. we surely get -EACCESS 
as runtime PM is disabled during no_irq resume phase. We still need to 
serve the transfer, hence we need to override it.

Review geni_i2c_resume_noirq() to know what all we do to enable 
resources. That's guaranteed and tested with system suspend/resume test 
back to back and PCIe could do i2c transfer successfully.
==
> 
> Thanks,
> 
> Praveen Talari
> 
Do not keep this thanks/regards here. only leave the comments.

>> +	}
[...]
