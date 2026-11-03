Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690389;
	b=aDpO/g6If5tiOQm2IuZ9VhK2hdkvZipvA2DZ0WhUTuiwYC0SIihWqxfAYBLpS3ONOa5A
	 of0jiU/Ri68Oo/G3DVO4Csar4XAt9BEX5JEHrDkzN6Byp6TU0KKAnAT7tdnoZfbAHYaaL
	 ue1axCUOZy80DnmEbsz8w3VIrsTPW0L30OGs+c6Nmp7bkA+pr/AGoLWmIKH7FHdW7Tbg3
	 piDBvZzc6/O0T6pIA3DnrPlPc9UzPPAJYZNJij3YD0X7JL0++oWP0U13VaEPNbsPVenLH
	 0BrmZJFPsvjwIyWnFes3ynqFGYE5c/+e2DGZQIx9vcOxDc/4Xn5rBwDMKqHSWm+XLZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690389;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K2CG3b4t47yXaBdjLO2bPQOOsh8D5qOew3uLqFztY7I=;
	b=tBQSeAM3eAzacjfBC+91D/B6mc69jRIWgvzDZDabcbFQoMWZx4A6B19bz2+CSkh9EWqK
	 k7ZYaAUx9UhTCjMTG1VvQCJ8EI5v83S5uZr8BxipxVigi7woK+jVTzxtIewsZern/JffW
	 FIFupf9PyWmMkroL/EPSuQPNFGPqJbc5JfiCOHfuKxAsjUA0BkPZxLcq7kZaLDkAX2j2B
	 5YYQiZFlr737FU5oID5D0ydI/rhv9LD4rdUejqEKJ/hWE+VFzFdQ/qhFz1tMk9JG3iN0L
	 +cNR9ijAVU45qrG/zp2+o0ic61hSrN4F9vQFCdZYhPKTav4xN9OqalXcqOqWZGIGQhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XpHOIXNz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=feRmNSMU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680D5606A329
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 07:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 680D5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XpHOIXNz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=feRmNSMU
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A375dmr1180066
	for <dmaengine@vger.kernel.org>; Tue, 3 Nov 2026 07:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K2CG3b4t47yXaBdjLO2bPQOOsh8D5qOew3uLqFztY7I=; b=XpHOIXNzBBnR2/X2
	0b5XmdXW1XJNxAsPUuItnr/snKzhBS2jog5fhps12ehBR+pxFTfWYobk15L4Zg37
	6s4xGT93eIDOjB8Yb8gFc45sa5sMG4Zy9jUznTtNwCyB7UxY/XboUChTY516KLlg
	g+tmhYGfBlIS0HId1HY7F2Nd9Wk+UzCWX4etmk6ZZ6vioB0D50uN976PfR4jUjDk
	FZ/iYCxgFNXBmodZ1xbNkRoq8Yvh8wkAsXJjLoE0g07PDji/hS2bNiD4oX9uR3UI
	8/VZmekeLcQWhP2t+LvkGlacFlL1ZFKfKiACLAH/gTOsiLVbtd/KTxTGU2cSA9TR
	+NRRmg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081tfvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 07:19:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89ff475a0deso3432602b3a.2
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 23:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793690387; x=1794295187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2CG3b4t47yXaBdjLO2bPQOOsh8D5qOew3uLqFztY7I=;
        b=feRmNSMUJHeyYErxl9D2PeBg0cYtRqWnkkT5hJGcH3zfKFlek8t4SLbsdu6hLJ/gr1
         C/TCVMoJF05kpAp3d/jg5KPN+7zI9r9SSHBj7YomYWEKbfdME38YnI7JtPqTKXZcrOWN
         8EnHNN1Lw9U2/8/bqUOuWwKZzKrVsyqorelXeFE7wSm4yklfVNBL637pEpE9YZowvJWA
         e3E/MZTvaa0eiCPsDdrm+vy27EztIu9flcFNlYZkNAyGCDPvlfoGr+w1O09wCsQB83nU
         KO5qka6uSIkeOO3YPUaWIeKgY1WC/UMFBhsnxsVIuqzn5wJXwPoR0IH4l9lKnGYEFo9X
         Ia7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690387; x=1794295187;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2CG3b4t47yXaBdjLO2bPQOOsh8D5qOew3uLqFztY7I=;
        b=m7sVh9B/k3zkJjDP9q3LEmvCYHbvYg4IzE4FP6+6rrN+T50dGkGOGGF90Zr9SGw2Hb
         aQmniH30PP2UspQlDy6mewE06m3wiQ3zGL7CVYDc6YaMc+ETbi+kKId+3UFiWQM8mygQ
         tgMwyAJjrH9X8wjp+f8KFRipaQ3YuQCDedUeIjLLabjFztu0WY7Y5qCBm70aKSbuFN6a
         wiyBh83Iwxr9QUsBXVJ947XBdjsLtTR1L36A48LwhUBs/qittsRW/W4GxfUCdrb2ikU6
         GqmuznB5zq8RLKAtmNeMpfzCec8cfAJkARTe/fWgwFNYoW1FimKhMoznbvtMa+UkAnzb
         D7EQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzSgeBv4por/qnT9sKJqSQUzG+TlLGkAGxER72TsoDD1ETXrpCcqOQDeJBDu1Ai7ndWtX6tHVKb6U=@vger.kernel.org
X-Gm-Message-State: APuU4Z82wPedMU6AuD+zLgJbbl5gcotYi528E8E0FSew6tCKPdMQic10
	g6IQKNeYb5Dq5NWo8G3MzmBcu1cHlYv9Xtvx1xEr1WqkAm8S3CvANftHMHdMn6jMsfIgY4FSdD4
	6yYEpxbUcIoGTspT/HKpDr/kinJGNPHYpTGUgGg62bS0BqpWUjiZ/Y63bjhbsMV8=
X-Gm-Gg: AYBFou1JODQm2ahXgLuD2HlIW3eq6kDUfYEN6FaToXQz5h6nzWPhzIoW3DSaxtyK5ut
	QPxf55XKmMtnyH4stiw/AHiFvJE+mktn8lFddHMwYyNLNRtW1T3i2DXypJGCq4Y4pGVSudHejeh
	s2MQA6ZsK1vfw6I4io5s/3yifiFSvGkxhsQzR+npZ8v8Fzm6EMM6Yr91r0xNa3foJSEAfWcqDKL
	SL244GyBdjrYvMSs81Wn/KZNul5YIjaKuK5AVTH4lrp+Xy/cqkmrsNxBGvkI/teFLCjOE2jZxem
	aTh1wy2qV+MDK0Zi9MWMkpMSdfRjWMC7JNAFHGFmeXQ5vlp60bzBC1o+oXhGmoc9M2OPhJVraZT
	pxJwK0tqRp2HfctcD+/dyV1S7CAIcjLN45EVFPUQDHcSqGGWDZlWloQ3/IfaZJGaPRC1Po4yTjj
	dhc/M=
X-Received: by 2002:a05:6a00:181d:b0:89f:63f9:b6c4 with SMTP id d2e1a72fcca58-8a9bd9d6ff3mr8752585b3a.32.1793690386928;
        Mon, 02 Nov 2026 23:19:46 -0800 (PST)
X-Received: by 2002:a05:6a00:181d:b0:89f:63f9:b6c4 with SMTP id d2e1a72fcca58-8a9bd9d6ff3mr8752561b3a.32.1793690386349;
        Mon, 02 Nov 2026 23:19:46 -0800 (PST)
Received: from [10.217.218.73] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9c09086sm2768904b3a.23.2026.11.02.23.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:19:45 -0800 (PST)
Message-ID: <8b83c220-4dfd-433d-ae8f-8b65a4865c78@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:49:40 +0530
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] i2c: qcom-geni: Add bus recovery support for FIFO
 mode
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-0-7f2a6e572de9@oss.qualcomm.com>
 <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-2-7f2a6e572de9@oss.qualcomm.com>
 <acac5cec-6fa2-4465-9f66-a5e533404978@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <acac5cec-6fa2-4465-9f66-a5e533404978@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyOCBTYWx0ZWRfX8fhniXDnDi2S
 sjP+qLJ3pftCd0l4Kdy3f+2VVkOv/O2LH0BCii9W96VYP3s+rrE/PYkK2TWgIaHvimm+y8zBjOy
 cT91rGggW4nf0fwnltuga28XUHH/f6k=
X-Proofpoint-ORIG-GUID: 3sbB0LhQTd7dFDoIWx-d55dO_S7gbGoC
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae98b13 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NaWF0_NUFfviP6yxQe4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 3sbB0LhQTd7dFDoIWx-d55dO_S7gbGoC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyOCBTYWx0ZWRfX6sjnndkwI6tS
 ZWBbINyvvqoN8MzVbaLq8XK9aaobYG1YYedcPSJkt2C5djNEfeqIfHPAIEz//4+UA3VDQ6x8Wic
 XLWwoJT/xc6Hfxz9tucmGBRs2zRn1ekhWtKOZqGj0KhwgHZRHm5/2ki4PINqUQuPvlYwuaxpe8u
 OfnqkRrWZfHy4EmbbVniAm97P2IiWt9BntTXaAL6eWG04Uy9yatpNuT14K5BRWhc3eOnUQwaJHG
 CW1ded18VP/OiyIBBwDM9RxT0plSa1BdAHQqE/saMF2o6m+RxLtQoi00U2kDrckM1MgXzYy2Qm9
 1Hat48fEQH1f47Gj22aXT83ez2yRjp/ma9uj6rHOdbfnIGlLMIgpUmQM57Z92nNg83UHmxDTt0o
 waJj3O+vpZi9NZxNFjGYyuX6x+FC3IQEnkcj15SGmcJcan501oIH15I7ZFCK+w2XUtZ+F5xbVDD
 fVBg+yEz3iypm7M+VAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030028



On 10/27/2026 7:37 PM, Mukesh Savaliya wrote:
> 
> 
> On 10/27/2026 10:43 AM, Aniket Randive wrote:
> [...]> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 127 +++++++++++++++++++++++++++ 
>> +++++++++-
>>   1 file changed, 126 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/ 
>> i2c-qcom-geni.c
>> index 60b6273f538c..d9e86f110ae9 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> 
> [...]> +static int geni_i2c_recover_bus(struct i2c_adapter *adap)
>> +{
>> +    struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
>> +    u32 ios;
>> +    int ret;
>> +
>> +    ret = pm_runtime_get_sync(gi2c->se.dev);
>> +    if (ret < 0) {
>> +        dev_err(gi2c->se.dev, "bus recovery failed, error turning SE 
>> resources:%d\n", ret);
>> +        pm_runtime_put_noidle(gi2c->se.dev);
>> +        return ret;
>> +    }
>> +
>> +    ret = gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out);
>> +    if (ret) {
>> +        dev_err(gi2c->se.dev, "bus recovery failed, error setting 
>> clock rate: %d\n",
>> +            ret);
>> +        pm_runtime_put_autosuspend(gi2c->se.dev);
> can use goto , jump there at exit with ret updated.
> As 4 times i see pm_runtime_put_autosuspend().> +        return ret;

Agree. I will make the change in next patch.

>> +    }
>> +
>> +    if (geni_i2c_bus_is_free(gi2c)) {
>> +        pm_runtime_put_autosuspend(gi2c->se.dev);
>> +        return 0;
>> +    }
>> +
>> +    /* Bus clear cannot recover a target holding SCL low. */
>> +    ios = readl_relaxed(gi2c->se.base + SE_GENI_IOS);
>> +    if (!(ios & IO2_DATA_IN)) {
>> +        pm_runtime_put_autosuspend(gi2c->se.dev);
>> +        return -EBUSY;
>> +    }
>> +
>> +    ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR);
>> +    if (!ret)
>> +        ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_STOP_ON_BUS);
>> +
>> +    /*
>> +     * Recovery succeeds only once both bus lines are released. The bus
>> +     * state is the authority, while a clean opcode status with either
>> +     * line low is a failed recovery.
>> +     */
>> +    if (geni_i2c_bus_is_free(gi2c))
>> +        ret = 0;
>> +    else if (!ret)
>> +        ret = -EBUSY;
>> +
> 
> Please simplify with ternary condition ?
> 

Sure. I will do the change.

>> +    pm_runtime_put_autosuspend(gi2c->se.dev);
>> +
>> +    return ret;
>> +}
>> +[...]

