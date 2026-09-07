Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A0B384243
	for <dmaengine@vger.kernel.org>; Mon,  7 Sep 2026 06:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761429; cv=none; b=hrQMrrDqFNjGtonRmAh9QPebIQhxrzGSiQywHINLsLFdO8zu2HxEkpQOK4mAGEF6MqTnrQFeVfspuEHZtlbP3aDR8kFP6aKy3h7eU94RPQn0Ux00i6kKZ8YTULuHBcQgskmHYA6UvN3rLrs7uEkSSMBsndIkeAzQnbHcr+u5hlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761429; c=relaxed/simple;
	bh=uKvph3KqsqlNSygkxaDcCyhZG/MLEECkqBgY3R9Y7J4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FnwL0deTkWZ5uFfhz4GzUf8hytfsYgnv/WOGyeFPwq3psxWRYIcBAubEY4KxpGI3w5pWz4gCeiQdbLjrEEnxY11Uszv4csDSv/cZEvE5CRVTGPAga9g1/zWusk10HpVJYnftkoF+qas5nvQtosvhhd/8dSNRt8ueGcgsz6T3ioE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l00060uw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b3sSLzaW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l00060uw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b3sSLzaW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873lCN61699989
	for <dmaengine@vger.kernel.org>; Mon, 7 Sep 2026 06:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0GwZTL/Tw3KjZE00/XVK1Lv54tHmA9eHgESSYMxmbQ8=; b=l00060uw5ekunLHl
	nU7YLFXfWbUtk5HhYXGStmy2vk7mdIyYF1DbFCGi1oRt7Hzm43n4Bk7taDZC9ks3
	dbJzY0bo6//RYJgtG9KOai0wJ2unDL06FWVOLAstDs9OFO0VIF4Oig/6jELSbdVu
	gNBIOLztbGP30rDmVD1YSvf8awrU49J30rmeCrJlxxKmr7J3+E3eFQUsK/fKGTDQ
	9FFX3IsJA5QP5iYpkCiz/0guZ0rhPtaETo1l44V/lN3W6TPWUQgCjsPv3ck3sDO7
	53sCooFtbXPKoMBf7vz7SX8v0UwfE99jcaWpu5sddOqJp+EH+LAg2Nr9GP70BNZN
	8CHf7g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8jd799-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 07 Sep 2026 06:10:27 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so3646351a12.3
        for <dmaengine@vger.kernel.org>; Sun, 06 Sep 2026 23:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788761427; x=1789366227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0GwZTL/Tw3KjZE00/XVK1Lv54tHmA9eHgESSYMxmbQ8=;
        b=b3sSLzaWDxSzJ47xx5XeMedR6pBPygADAKP+n2ublmn0800riorf9pcJXER0nm1na4
         iNeqjynvnV8mSy9bC9w8ZR3TpOwR5eMHuDsf/O0zn2QQQO55PgLz7CxGxUGHN8L6RBOT
         e1n194AP/3ehXCzfRjHHeGrrypl+/REsWTjUHjjRj0lckuMgugdpw/wKNazf0RWYJjPC
         icfKWa6s0dPBuSfyLfg54lGzZ4wWLktNh2SHlgyM9iW3SXEUIEnbpQzm++b4quU9uD82
         Ki7/jNWubW65jZL+9KuwzkdIfFq40A69Xry5e1dT5v8eH032Z9fIL0UpViRR2Hw8d4QD
         LxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761427; x=1789366227;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0GwZTL/Tw3KjZE00/XVK1Lv54tHmA9eHgESSYMxmbQ8=;
        b=VRLzt4UgrlrYXgOD4QlIRsGl23gfIM6QcHY0N7f4TLfPuBxCf5zUO2DhmzSN7TKjQy
         IFQHg1/pRLhlQE0vpeQ8tXpctgCFjEMDAPcRXBBSAlGgw+xTuvN3R8kw7cQ7OSe5Hcb/
         wd4/YeKjvcXZBjHJlxy1mZHb9K9VUMlur9RTJ5a6WMBSvpVsNLZNnchMgriGQ565OGbo
         I6lpV6Zcto5E/3fO71OeXVDK0gIXLREN6EgvaFbHlQCpPCAjUzTI3NKmGn/SgKfCzodZ
         fzRKzV9Mc4e4+v27bwaoY3ByBAlIxXeWQh54xx66iN30FFzyY67uXvVo+M8xRpr/Ycpu
         m2QA==
X-Forwarded-Encrypted: i=1; AKwUvBwjgAhlsMge3htx0d/pGWLjx/k7ShBHjNB4UOjPJxYEmxiMAVatFhCxsDgU1izkKzUbCA2zKQUUOCc=@vger.kernel.org
X-Gm-Message-State: AFuF++lc/QFYq488SD5JUji37AvQQ3Tk2viQSu3Sh+vmNi5+mFF84jj/
	PgcNmVFWcMw12WN/+LTaPf+9/m8Zryvq3BW+zIJKtKnHDGFn7VzmM9OKJAJ1bbJTAQY1SwGNhEN
	iIatDucYABWD+1XZYjKjey9na2x+kmezIh+3IP1bieafTsD/kUqqThqg9KWx2t5w=
X-Gm-Gg: AYBFou1rqoIo/6B8IDKZygVI+rxohodsnvb2jzTXWm/quNdNGaawn1lD80Xb+lrIYkB
	J4eu5tV70o0iBMSzR8vr+vDOkJp8rbFchl8aW83V+rit9axfkQlgt3LRnu82i0COj+q8yKJjlB2
	jrlyrIo+CNPKQ0VizU2jlXb6Frz6qcAlC9ymcAyyP8KPv6C4iVCx64exw6WQ7LwoyunvEwRdb8t
	JlGzoxBCXuMHM/KO+y8hnNajuJcIWWWz/T7Bd3WeLM/UJ3HNhc5lH8oPUm7rAZ1bDozEZ7iIScD
	ZuychX6CbZoghBm6kFzS/+YuwjZcesw3bd4/j8kdIkdAxmhZU2mlpBOKmOxoZAkIAMJX7V+mWJi
	PTJOmwhtrOdjD67dNC9A/6k5P5MKYk1zY0A==
X-Received: by 2002:a05:6a20:e607:b0:3d3:ae51:181e with SMTP id adf61e73a8af0-3da3a16ab56mr32340410637.26.1788761426852;
        Sun, 06 Sep 2026 23:10:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:e607:b0:3d3:ae51:181e with SMTP id adf61e73a8af0-3da3a16ab56mr32340353637.26.1788761426368;
        Sun, 06 Sep 2026 23:10:26 -0700 (PDT)
Received: from [10.217.219.15] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333959d5f69sm23683829eec.0.2026.09.06.23.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 23:10:26 -0700 (PDT)
Message-ID: <c2bea75f-786b-4bf7-bc15-0509609663cc@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 11:40:20 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] i2c: qcom-geni: Add bus recovery support for FIFO
 mode
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260826-i2c_bus_recovery-v1-0-203f0ec76f84@oss.qualcomm.com>
 <20260826-i2c_bus_recovery-v1-2-203f0ec76f84@oss.qualcomm.com>
 <990a4ab8-bd03-415c-ae95-008cee7740df@oss.qualcomm.com>
 <6c9f2a00-281f-4400-94b1-55034ca9d472@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <6c9f2a00-281f-4400-94b1-55034ca9d472@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8x43AILoz3ujQV4yB2Zr1GZ8aOea2Dur
X-Proofpoint-ORIG-GUID: 8x43AILoz3ujQV4yB2Zr1GZ8aOea2Dur
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA2NCBTYWx0ZWRfXxLanuz/Cf//J
 Mo64cdhTVqsNgg5mVnDVAAeaXvkmMJ45YcHRFlsMilXqsjhSREN+cfgT7n146cu9FQ4lI0oX6ln
 fb/VD0Qk5LxMfXcMdgLWEjMmAMe4HWiizeIrsT//GUbt2WlqztKq1qjZxdpliZchZ2o7tdDvri6
 rqacJFSgndAa5lHXfpBgfMrgB0P+ZRUVXnZRapGtQztY3fUnbxWbkIBi1VSf+yQMDD1WEERMfKd
 ZpSy17cwZON+IZ+nsVehXnriRP4ARcJAp6NTLHid1LQljKWC0xbTw3hPOJ+8TYDsW8MBkGadD3g
 4qoVAFrfhVJqAfO4O3OD8ENhXoEgZsylvhJqvtlliOnHPS1f2B8efePDdZDY0mpLXdiQXk85oED
 kgreZHT+gJbW3LskGlyByxamCxYJXdRMvgoINiWEGSHxLwWT9bC6FyZNawtOBWe1kknJf1UurAj
 edi9P761bFvvPeht4hA==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9e5553 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=b-BypBxLjBlfuzumYdYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA2NCBTYWx0ZWRfX4KaalWpw7PEJ
 lGuQOfD3zbtcxOyFE9SlW3PODBha+7QYHNxhL1zoJYXLB151mqFF1p86WxQAo2ha8g82iWPwA+C
 Ve+GNzK376XewlUAkiRjKFDIc5O8fDU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070064



On 9/7/2026 11:35 AM, Mukesh Savaliya wrote:
> 
> 
> On 9/3/2026 9:47 PM, Jyothi Kumar Seerapu wrote:
>>
>>
>> On 8/26/2026 3:21 PM, Aniket Randive wrote:
> 
> [...]
> 
>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/ 
>>> i2c-qcom-geni.c
>>> index 658636c1ee0e..9fa1a8ac400c 100644
>>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>> @@ -138,6 +138,7 @@ struct geni_i2c_dev {
>>>       u32 num_msgs;
>>>       struct geni_i2c_gpi_multi_desc_xfer i2c_multi_desc_config;
>>>       const struct geni_i2c_desc *dev_data;
>>> +    struct i2c_bus_recovery_info rinfo;
> I could not find this structure being utilized in generic way for gpi 
> mode. So is this specific to non gpi mode ?>>   };
>>>   struct geni_i2c_err_log {
>>> @@ -956,6 +957,90 @@ static int geni_i2c_fifo_xfer(struct 
>>> geni_i2c_dev *gi2c,
>>>       return num;
>>>   }
> 
> [...]
> 
>>> +
>>>   static int geni_i2c_xfer(struct i2c_adapter *adap,
>>>                struct i2c_msg msgs[],
>>>                int num)
>>> @@ -981,6 +1066,25 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>>>       else
>>>           ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
>>> +    if (!gi2c->gpi_mode &&
>>> +        (ret == -EPROTO || ret == -ETIMEDOUT || ret == -EAGAIN)) {
> Could not see similar call after gpi_xfer failure which invokes recovery 
> mode. Thinking if design can be symmetrical here for both the modes.>> 
> +        /*
>>> +         * Only attempt recovery if SDA is stuck low. -EPROTO and
>>> +         * -ETIMEDOUT indicate bus errors where the target may be
>>> +         * holding SDA low. ARB_LOST (-EAGAIN) on a single-controller
>>> +         * bus indicates a stuck target, not a real arbitration loss.
>>> +         * GPI DMA mode extends this trigger separately.
>>> +         */
> 
> [...]
> 
>>> @@ -1188,6 +1292,11 @@ static int geni_i2c_probe(struct 
>>> platform_device *pdev)
>>>       if (ret < 0)
>>>           return ret;
> 
> one  line Comment here how gpi mode handles ?
> I would suggest to keep geni_i2c_recover_bus() as common for both.
> Review how we can invoke this in generic way for any mode.
> else geni_i2c_recover_bus() should  have _fifo.
> 
Sorry, please ignore this comment, as i could see patch#3 is handling 
same way.

>>> +    if (!gi2c->gpi_mode) {
>>> +        gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
>>> +        gi2c->adap.bus_recovery_info = &gi2c->rinfo;
>>> +    }
> 
> 
>> In geni_i2c_xfer(), geni_i2c_recover_bus() is invoked directly, then 
>> why do we need this ?> +
>>>       ret = i2c_add_adapter(&gi2c->adap);
>>>       if (ret)
>>>           return dev_err_probe(dev, ret, "Error adding i2c adapter\n");
>>>
>>
> 

