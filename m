Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2823938DC52
	for <dmaengine@vger.kernel.org>; Mon,  7 Sep 2026 06:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761114; cv=none; b=tXwQlKZ3cEVZ9Ag5/g1yvsAKaGh/pskRsuFbx5VTH0doj4TWsoRJUxR4edxF3GoXFGquBL220SX+RAhmLfdClIY0DmeNtJ2hvknoEPkWq0q91ZjHc0bcHC8Rf8wIp+0tFYbbk5gFfpZYHOedNpTbdZ8PEnDfbD7ihpjX8YmerZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761114; c=relaxed/simple;
	bh=PeVF7rfbc1vL6HV1/pZH3WhjqloYpkjKYKlN73g3pcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PxJoJp2p8jtTqUhPDO49d791otWDg2cCOAx7nMnh84raVzlJWOvbBkFdN5JkiILMIYpi0Q+eTQaQF3sNwhQLhuVebLe+SVCFEhUIyAZ+SyN0zGDY0oIwXW6HWjrOeCviqhONQrHfYIuRt9QCxZTjysZp5D28xNEazfwHnKB/6Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XljyG4bv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cRg5bEFo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XljyG4bv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cRg5bEFo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873lQjR2391256
	for <dmaengine@vger.kernel.org>; Mon, 7 Sep 2026 06:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkyS4nCwMvydVoM0dGZ5wVM6t+b0Z+k7G6cMlo0p/XY=; b=XljyG4bv8BYyhBtW
	PsorMgjRIWQaRYAFt8JkxlwJdm6L5qmLNFW8+Q435hGiBIV0g+If09I/0xO+i/zD
	UvNOprL/EKCAbhWoQfYITAukKi7cwfi4pJT5lfILLr6HOVPodM3eG5ieO/Z+r6KR
	vysH5MBzf5MrZOyiD0jmkglXdxgeV1dGk2V5CLJ2WeBCWztNhuyHg1/eS81YkByx
	cd7Wk2ZxcIfmdWAL9Gal6/J1wr1veZIVLn9O2WHyQ5YjaBj+v1SMAKFqQh649Fsh
	sTJ6mSuBXbPawHU6r1Yz0ZdTDS8eY3+xaietlQQtlKH2+2LtlUceh0iLNPQtfxwv
	DiordQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbuena05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 07 Sep 2026 06:05:12 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b388f7989fso2202308b6e.2
        for <dmaengine@vger.kernel.org>; Sun, 06 Sep 2026 23:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788761111; x=1789365911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkyS4nCwMvydVoM0dGZ5wVM6t+b0Z+k7G6cMlo0p/XY=;
        b=cRg5bEFoBbi5jr8Ym5mPO4rSt4+UQ9zhZiukU0y4nKLeSvpKZwRVLev1QuPlEE+t+m
         jtmffjAa61QQ0KMQ4X6D7y2jPxAEFXq+GydcDmcM4eY+fitUFy249+I1PmCjaZ8KrBYS
         9NmYOksAINeAIpcjSDaQKKYnwpZ5p/sZJzfQyH8kJF5peGXu1g03yOfO4aGgu9wRHnmW
         YQafsJ9Fe5upHdwKoGIJTVhS4XDaUuTGm7dNaK5/AQKpY6IQbosTJe/UhrMTZvn0UNrS
         yQn2cE5lqYX29XstosOWE5vWsYLKWg/VPQnYAFdyV8R5irTTl7lWBXuHq7eF3rmMarGF
         VgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761111; x=1789365911;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkyS4nCwMvydVoM0dGZ5wVM6t+b0Z+k7G6cMlo0p/XY=;
        b=sSasYvVCSeEEUAOWtISNC2sMs/vj+WhRehsklqRMrllkWPv1BnD97D9kRjVfJ+t3FI
         h+mZyrbd3VCrCEfaYaEDfCIXuGwnSw+EjhoF0NztxhhxB3WBYIwd+rkFSsjf6bMHDw3V
         K1YhllEglBaFvUf7VCESr7cqxrJCa7PunggIwscoUY+kPMVNxZOp4uSDYmmc2lpgg+Bw
         luKYSaamy50BRe3mYVUFGgql8P4vt/PSwr4NwTgbbNd0Mpw5k8RozMeaOV5ZdCfntK/1
         FWOawQY/jdfPdm4g20N9z9bXe3CBGkhI2Di8dobaL5BXp22j2GjMj5W6ATozYwBFrWdK
         mDtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvdqBjg7H3x9IQ4OSd/qOYAuJ3JHLOS3LnjW4b2CReac92zPdOpOafoIvaHtCR/Q4uBIFpnB7Nd4g=@vger.kernel.org
X-Gm-Message-State: AFuF++mSAjyiFLI5bKuyHd3TTyg/xbVmRj9R5WXgfVeNARaOzSKcAgzL
	KXv5l/FhOOGyBGjlZpOvldkLfnU7A/WdKsKMi3a4CmAqNIye9J+BsPrGIWRN18z7LGS4tFtIXZh
	BU1T0H+rz8okSMnrRm72XrJ1NT3GqR7K21MDil6HEraqluLHORQc5O6N59PZY6PM=
X-Gm-Gg: AYBFou3GnIapIpq5RDGSu1cnTCSFaXy9f4g5MJxE8BqNdjs/U+bk7ZFJ2lD9vTwgkM2
	3py40BVzQzJUz96ijwI+eDDKf226X+kJqZCVz7Ix6fShrUp7wdQH8g2K7cbZ7YS4dsH7Xgd9pmU
	Qnwn3apIGDfgkVa5aWtidXfl40eqZuplG61WUDgWs84/sjcgfduPV9PPDMCPoKb2KDrWpRI+KBE
	wrlXUvGbX4flcVjGHBUvrkrKdn3tisOBLi7SRFxCvWnAqOTtrCIz7A51DF12+IKGPdDUcHJpnZz
	dVbt/Ll7lztPxRtBQh1DKisVr49lKBbIFcxgog72IvEcoMJTtAkYr181f46KsBddUkG6rw1upYP
	GhF1q1zUAVONtl6HvUSE0Sc8jbFKPAiSDvA==
X-Received: by 2002:a05:6820:4c86:b0:6b7:8396:f3d9 with SMTP id 006d021491bc7-6b78396f8c4mr8986135eaf.59.1788761111352;
        Sun, 06 Sep 2026 23:05:11 -0700 (PDT)
X-Received: by 2002:a05:6820:4c86:b0:6b7:8396:f3d9 with SMTP id 006d021491bc7-6b78396f8c4mr8986121eaf.59.1788761110920;
        Sun, 06 Sep 2026 23:05:10 -0700 (PDT)
Received: from [10.217.219.15] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm22142550c88.0.2026.09.06.23.05.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 23:05:10 -0700 (PDT)
Message-ID: <6c9f2a00-281f-4400-94b1-55034ca9d472@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 11:35:03 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] i2c: qcom-geni: Add bus recovery support for FIFO
 mode
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
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <990a4ab8-bd03-415c-ae95-008cee7740df@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA2MyBTYWx0ZWRfX1yeu55joOssC
 mJnsAQEzmO5rgVzoAMT3ekqzh7dfMvjulwC4IuEnU0DMuIfvWJ06SQ8sev/6qc1zHipMipKWWAk
 98pc+rbMOOZMRBEjS4I8KUrTrQ3c/1RmtsNmoKEO9x54UuW6t3dvNFoTcGyD42rdZ4JxOa6G+dB
 zw8WRPVngwKDKKbXFeAaOsXG7gZukZhvd3Nprcc4sCTYY4W9t5cOocWGbS3/Nmcoy55AYgMPf/+
 QookP/aAn/yILCdOh2O4n7KJW7fqa46/Y+qS0z1NuBfc3sF81LIjMgQfKEvO0vsszPJDTCySEsR
 Ax+E/BkExLxb8TaX5qH+n/fy9QAX+IUwCxZDVDnWQm3REquQis7th8EIiLUPMEmAp0BZqePydNQ
 Xw+nAPlcBvLhyNlct2P8NmSOjYSsokTPwGWkNxpjeKoTO3hC97rGyqyAPaLu0fM9NhGyIwtmgOg
 SZceNnz2Y1v9hMZo1RQ==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9e5418 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=feSLNv-d2_yk1Zcgl2UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: 05xeCluX-M3ycRloeN0BhQ72A4ZLuEGH
X-Proofpoint-ORIG-GUID: 05xeCluX-M3ycRloeN0BhQ72A4ZLuEGH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA2MyBTYWx0ZWRfX/hyZkFTIcIYT
 fg9zOHL8AYSC0fxKVjMR41ElThennHY+SW/1SSyEphdAqZ/REql++LQUZ5vXhQv6p0ABFKEuY79
 gDYUMAQRWKrOAGnUHZadWt9bx4uV4vc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070063



On 9/3/2026 9:47 PM, Jyothi Kumar Seerapu wrote:
> 
> 
> On 8/26/2026 3:21 PM, Aniket Randive wrote:

[...]

>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/ 
>> i2c-qcom-geni.c
>> index 658636c1ee0e..9fa1a8ac400c 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -138,6 +138,7 @@ struct geni_i2c_dev {
>>       u32 num_msgs;
>>       struct geni_i2c_gpi_multi_desc_xfer i2c_multi_desc_config;
>>       const struct geni_i2c_desc *dev_data;
>> +    struct i2c_bus_recovery_info rinfo;
I could not find this structure being utilized in generic way for gpi 
mode. So is this specific to non gpi mode ?>>   };
>>   struct geni_i2c_err_log {
>> @@ -956,6 +957,90 @@ static int geni_i2c_fifo_xfer(struct geni_i2c_dev 
>> *gi2c,
>>       return num;
>>   }

[...]

>> +
>>   static int geni_i2c_xfer(struct i2c_adapter *adap,
>>                struct i2c_msg msgs[],
>>                int num)
>> @@ -981,6 +1066,25 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>>       else
>>           ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
>> +    if (!gi2c->gpi_mode &&
>> +        (ret == -EPROTO || ret == -ETIMEDOUT || ret == -EAGAIN)) {
Could not see similar call after gpi_xfer failure which invokes recovery 
mode. Thinking if design can be symmetrical here for both the modes.>> 
+        /*
>> +         * Only attempt recovery if SDA is stuck low. -EPROTO and
>> +         * -ETIMEDOUT indicate bus errors where the target may be
>> +         * holding SDA low. ARB_LOST (-EAGAIN) on a single-controller
>> +         * bus indicates a stuck target, not a real arbitration loss.
>> +         * GPI DMA mode extends this trigger separately.
>> +         */

[...]

>> @@ -1188,6 +1292,11 @@ static int geni_i2c_probe(struct 
>> platform_device *pdev)
>>       if (ret < 0)
>>           return ret;

one  line Comment here how gpi mode handles ?
I would suggest to keep geni_i2c_recover_bus() as common for both.
Review how we can invoke this in generic way for any mode.
else geni_i2c_recover_bus() should  have _fifo.

>> +    if (!gi2c->gpi_mode) {
>> +        gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
>> +        gi2c->adap.bus_recovery_info = &gi2c->rinfo;
>> +    }


> In geni_i2c_xfer(), geni_i2c_recover_bus() is invoked directly, then why 
> do we need this ?> +
>>       ret = i2c_add_adapter(&gi2c->adap);
>>       if (ret)
>>           return dev_err_probe(dev, ret, "Error adding i2c adapter\n");
>>
> 

