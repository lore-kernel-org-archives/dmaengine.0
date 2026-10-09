Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26403A6B71
	for <dmaengine@vger.kernel.org>; Fri,  9 Oct 2026 05:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791524167; cv=none; b=aRkm0xR8hhPNrtaWcE7frnundOZ8MnF/fqJ8ax8Tr+WwhvN6jXHUKegE3aVigbQzd0GYmHQUHRnyLwJAN6W0oi73qKg7N/x8i35cjFOVdlfRtaNr32Bwv1Ml4oNMRIX4WFWAfQFBUeUUurf39qewzeVkrhOBeRnzzZdPqnox7Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791524167; c=relaxed/simple;
	bh=hW3l8GfPk5+AVO3+SBCpqzDjbSTq8rOQZaGT1QGKVJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kICh8mpCC9wUgMvW4qEIEYBYp79gmi1XHyKHvbfSYJz2/4n/stepGOmmyIy7YSRjVKFuGMBe/j5wIz1mm05FO87EOK8Dl2k5U6X5YuC5eI4cQ/zeD+aJl97zTJyaIbHsu5WgjU/40cTA8GiRKzRnBHr5pN/MZh/yUNcaRtqt/Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DqJAx2Bt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XF46ibCb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DqJAx2Bt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XF46ibCb"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HMbK1712779
	for <dmaengine@vger.kernel.org>; Fri, 9 Oct 2026 05:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UkPkJZQGSjO1Jl9dwfo0JAj+oneOfiIIp+RBNM/ltVU=; b=DqJAx2Btx+ZKaizy
	3+oN1NPzcSwFXuGku6ePj76mzer/OLnnrOvPdtw70fnu+2HryPPA8zGp6fg04dQT
	AK7chKxpfng+QnguH8ia1mUskmeJHueTpCu7lb+jrWFlSBnikBAtorbjRNsRqvmI
	4pGWHHvudvMdjuX+OboiZMh8KmJpOA0e/LRi1HBXEcBzsD2jVnXvdj5ex0Y2KLAc
	O3N5mEj4HPUCIM9Lp6HsJZLodmIICHYLRTeIt7A97DC2u7V16FV+g2Wo9y0RXm39
	5TvYvlc1/Qt+M6yg9YIu092OezntjH+FjEp5/HkNmtDC3aQ24noevy9NfD0b/dgk
	Zls8Fw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxwa37b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 09 Oct 2026 05:36:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34ef5fd7934so16391292eec.0
        for <dmaengine@vger.kernel.org>; Thu, 08 Oct 2026 22:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791524163; x=1792128963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UkPkJZQGSjO1Jl9dwfo0JAj+oneOfiIIp+RBNM/ltVU=;
        b=XF46ibCbVuvN6F8qxTQDUjJByZ1lXlzCXb0QMda0KQISNs+q2LttrtitOukqTTTppS
         3Dcr10v1Iuxmhh5iUZ8EzuahsKghN93Cx54Z0KfyCbw5/0FlDkcQWDaQlJiF6zfPR602
         JoYHNWZZT8Ri5zUkrgqLcYda0ayV+tDQBuXmBBdAQJIpaesXhmy8htOB9XaNiay2RnnM
         Fm0JBRQA+iLchEAHH6aNfmi8qM5Ri7e6mRNt/McK4emmnJzHu5o6ItC7K7e/OHS5U9Vm
         NCAAPY3uwrAcK7APsY216vXZvcpGwZYFz1IT6Am8brYeyPenHRdY25twRUUSXOzkuVtK
         YWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791524163; x=1792128963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UkPkJZQGSjO1Jl9dwfo0JAj+oneOfiIIp+RBNM/ltVU=;
        b=mkRYZ3dd2f93GlpiEFTHwxIF/xxRi8pOB42AxAOrl+7MN034ilAPPkfboaE6KcbqRR
         2z6B8eXopY/DNEP/Jz5fwnzzGwkQEq4gzv4VCgSpm6IptBJm+C3kTwx0pXgT3Y6iIeSU
         K+YeJZzzdaXrOBaysnQQIhi2/r8ykeTRS4MWnDY0aWbzq+G1hANrQXhEQoa89RXMQH9u
         lGaC35htMLTKnuB3EdB0ia9jcWvEQlO8K3Yc1V2b6GcyfMWFm8EiZeb9FVeU08AgfcjE
         TN4RzEEHSsUyhXUurcU1707o7UDm1lxypa+0U625fgSIJrenT3kBkDXFLajk+3CVYm5C
         kW+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxUfxoAuXkqWDx5wcHeKeM8BTSo+rh9Q3G1rNIF4ha2rcyHFz2PPmEHiptM+eIlM5vHKuLXhMWfNUU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIl2RyUynw+RphDdjOMfINULdkDLfJH/ZIK8KLLri7kmz+vYtDY
	dyi4Eh4JpjbjgkOQkWanXCBtZbcfY6LtkIqXO7RoZRdMgxLI+qwm5Zs4Q7wWt10kECSmZX/ygub
	hYR+gIfmQzaV8wcWC3lgqGAQNje+3irPBD9C/HeY8ZnO3gjs+pJo0CXehOxhzcL4=
X-Gm-Gg: AYBFou0N1DuClRuFsDmMUSuv0NQUbzTqhIu+2GJln1vPhc55IIppDKgXUwIUFT33BFJ
	C0hVTtqFY0xoPGzLRIt6aehoGgCfZI/bltMng5tmG56fVzX5TMkHJM2v62pP5Jp+kVsXE/wDGR/
	+ObmqCpRBvWv0jiai8OVrB9TS0ixSa/v+rHkZpuabWGbPLVoTBryVKHLI81EqjhxduQTU4XdD3v
	GFovABSIJ0VSp7vxRZOm/oIB8od+Vm/0xYmkvAPB5JUXQKKxMOp3dA2cWxRufYlH7f3tEyLl202
	JF4Q58cfBiNhJ5lYo/5eQpaMU7LPUQ/FBwYNYs4vue1xMBXhLQEdVre1vJUJDGb6NKIMUsW2yKa
	3Dnsm6WVZxy5B0+W8HASAMjStk4AkrAwx
X-Received: by 2002:a05:7300:1343:b0:351:727d:b9c2 with SMTP id 5a478bee46e88-3537e05bd1bmr1914471eec.17.1791524163387;
        Thu, 08 Oct 2026 22:36:03 -0700 (PDT)
X-Received: by 2002:a05:7300:1343:b0:351:727d:b9c2 with SMTP id 5a478bee46e88-3537e05bd1bmr1914418eec.17.1791524162729;
        Thu, 08 Oct 2026 22:36:02 -0700 (PDT)
Received: from [10.217.218.111] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca76e5asm3674061eec.15.2026.10.08.22.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 22:36:02 -0700 (PDT)
Message-ID: <9fc86230-772c-44db-92bd-8ed842969c16@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 11:05:57 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dmaengine: qcom: gpi: Add I2C bus recovery opcode
 support
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260826-i2c_bus_recovery-v1-0-203f0ec76f84@oss.qualcomm.com>
 <20260826-i2c_bus_recovery-v1-1-203f0ec76f84@oss.qualcomm.com>
 <fa7e7439-6f17-4dad-9c9b-6793ac7cfdf3@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <fa7e7439-6f17-4dad-9c9b-6793ac7cfdf3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyMiBTYWx0ZWRfXxgyy9h0vvzXH
 Q38wK8gBkorEN6LMoRL8jCJWswtBQRVxHZ6JPRrLCso1wu+pAsMOneYJkF/oaaoU7sqR/cf/zOS
 zeluKBIdtGYFD7KcgWgiQ67E4xsBGDtXgRqRbUpF1XqETmDnuqQTPHFWJ4O5tw/Q8XOIo8uSOdH
 PmkP5h1eOPvnK1vKJbcLFWHc5gHbQqdTrvO6uTz+EhAtVymQi3gw9M0mAioo2SExbSfjoo4p3ki
 mKmj6fkHX5xuJFK/Fu4gmQ/w7xxSbPghhXLS37neDOFLHxXkAkVTfhspI1HFbdUdaVKVea2a0Ax
 5H8PZ3UCXufm4doqXbqN8o5uZNEwALutki1+ih/Kc20/bEkaSwOc/mipTAgekcqT9+hfVKztbIA
 6l+5Vh+fDKmwaMI3j2YNdZb+f3eFghwXaN32L37hV4ixtxfqWy/+LcCu41eD/sI7kFVdzq4Y96s
 2P1GAKRNt5BOSEtq4fQ==
X-Proofpoint-GUID: rNipgCJbHr6nZB-3Z0A1_kM9EJMQHdQL
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac87d44 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=S-CjDK4xD3VWIf0aO8QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyMiBTYWx0ZWRfXwVZvEa0LmqXj
 XNnEdk7P/CKk3iCeJhVqiD+ZTuAALu4oOaY9y6CuNxCQ3H7kiF1sdn2AkMZjBRvQAA725Hr9uIM
 RgYJUPLqO5hQ1KfoOKppzEOGHbosnOE=
X-Proofpoint-ORIG-GUID: rNipgCJbHr6nZB-3Z0A1_kM9EJMQHdQL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090022



On 9/7/2026 10:44 AM, Mukesh Savaliya wrote:
> 
> 
> On 8/26/2026 3:21 PM, Aniket Randive wrote:
>> The I2C_BUS_CLEAR and I2C_STOP_ON_BUS GENI sequencer opcodes release a
>> stuck I2C bus, but the GPI DMA driver has no way to emit these
>> zero-payload control commands, so an I2C controller using GPI DMA
>> cannot recover the bus.
>>
>> Add I2C_BUS_CLEAR and I2C_STOP_ON_BUS to enum i2c_op so I2C drivers can
>> request them through gpi_i2c_config.op. Handle them in
>> gpi_create_i2c_tre() by emitting a CONFIG TRE (when set_config is set)
>> followed by a GO TRE with IEOT set and no DMA TRE, and reserve the
>> matching number of ring entries in gpi_prep_slave_sg().
>>
> 
> start with problem statement which is being fixed by the respective patch.
> 
> Rest of the message can be simplified as below - more you can add.
> 
> Allow GPI DMA clients to issue the GENI I2C_BUS_CLEAR and
> I2C_STOP_ON_BUS commands used for I2C bus recovery.
> 
> Add the new opcodes to the GPI I2C interface and generate the
> corresponding CONFIG/GO TRE sequence without data DMA transfers.
> Adjust TRE reservation logic to account for these commands.
> 

I will update the commit message.

>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>> ---
>>   drivers/dma/qcom/gpi.c           | 30 ++++++++++++++++++++++++++++++
>>   include/linux/dma/qcom-gpi-dma.h |  2 ++
>>   2 files changed, 32 insertions(+)
>>
>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> 
> [...]
> 
>> @@ -1825,6 +1843,18 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct 
>> scatterlist *sgl,
>>           nr_tre = 2;
>>       if (direction == DMA_DEV_TO_MEM) /* rx */
>>           nr_tre = 1;
>> +    /*
>> +     * Recovery opcodes do not require DMA data TREs, only CONFIG
>> +     * (for set_config) and GO TREs. Since gpi_prep_slave_sg() is
>> +     * shared with SPI, verify the channel is I2C before accessing
> Not only SPI, its for all GENI protocols. Can say common function for 
> all protocols.
> 

sure. I will make it generic instead of single protocol.
> May be once such conditions are rising, we need to think of better way 
> in design to handle such cases.
>> +     * the configuration data.
>> +     */
>> +    if (gchan->protocol == QCOM_GPI_I2C) {
>> +        struct gpi_i2c_config *i2c = gchan->config;
>> +
>> +        if (i2c->op == I2C_BUS_CLEAR || i2c->op == I2C_STOP_ON_BUS)
>> +            nr_tre = set_config ? 2 : 1;
>> +    }
> 
> [...]
> 

