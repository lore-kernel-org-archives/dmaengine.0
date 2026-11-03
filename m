Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690335;
	b=0FN8L+aZombgb551xEIZ5K5CEw3rwrb3RuXW5H+e1a2eMUvEeFe7nVd5Rcvc1k5HfKry
	 TF8zKFqh4DnclSuXIBB3sVym0L5PY7rL7uPwNQAOZfO2+zIqPU2ON0+v1I2XG0+XtBw6O
	 xaGI1UqL6Gsnwp5rybqiTFMrbCjQ6fnx+A3kFLCrA4HgWl7Vxk53sKYN2jAl/dbnCf+sw
	 zrv7du7rWZpD3UhOpAUHOM6ZhqySPdCpNGQ8jxC6c9FbcZPFUBeEGa7LMH5I8limUxDbc
	 VeG72Ud+023boIHMUHIaNek/fAKlfvHZTk7W0cOoRHAQctTwHqEYtu9ENxm10C6w5Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690335;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v8pOdlYxikwaLjp8OZvxPrNbyKTUCQqg7s1stn4Ba5s=;
	b=y0YasL0YsjTIh6lqWl+us03TZHqG3LJGCxHWhOBeOYucwldQ4qvCWr1n3CxVU5DcBT9+
	 ifpDMRRumMsoJ19vFHPYp5MnlC0SaycEuBlFGW/lDsv1pPNM/TIZWEfBGcwjk1dmAl7YE
	 MEWy+N8AjI5irtSQntxVhrvByzT3SNT0MJRxH+1P1229purV+dSgJzdQKhN8x99bVW/rN
	 40cBz9Uqz4wflWr8UXlo8QfNNKuVN7+m3soMuJ/vrqAXEIyoI/NVO+e46k42UWAUtJTrB
	 viecmi5Odi/rhq5lYE/wAPAKcheJKNpZ2pEk0qs7R2OJvd5V6Je/DouTb59yoG20fvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dqcF08tC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hVAO5Isf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55167606A331
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 07:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55167606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dqcF08tC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hVAO5Isf
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A352kjL2449012
	for <dmaengine@vger.kernel.org>; Tue, 3 Nov 2026 07:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v8pOdlYxikwaLjp8OZvxPrNbyKTUCQqg7s1stn4Ba5s=; b=dqcF08tCDFFe0kRN
	F3GsfZg4gjR1L2YUmj2gFaT8A63zPszurxFT8DOQi/rFb/5MYTochGkjFyynBrnp
	2RV8I2QSVGJxKLr6XxG0e1MdBrwkkoKnoDSBm6YUv6jIdhQyU+MYidhsYqo9PwWE
	ET7KTfPFhzWu9oC/14wa2P5dza9Av3E8iJ7CzqbCPIwyMsMD35YWj65VomHbF79d
	0+cDEz8AYMfbWmLigiSjLARaI30Hj+Yw2esO8gxrm9e0DujEhKMvUD/khNI29Ccy
	zLQDfwVok0RCHDtrBiTWyc2r3nfKJsuLijcXSZo2BkpncG/3qR1XcGj2gq9XU1TA
	Q2Mywg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94crfge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 07:18:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eb2437d752so56000685ad.0
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 23:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793690333; x=1794295133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v8pOdlYxikwaLjp8OZvxPrNbyKTUCQqg7s1stn4Ba5s=;
        b=hVAO5IsfdE/rzMifewHHAZbrqY55JGNRRe1yxZmh1Dm2jkAY8hvK4RHG9FveTcSKgN
         /9YBfCrv0olr9VqPnSq2O04LMBiUXasgP2tPl3fuCt5V5kWdN8M/7HeR5iJDPfLlBqTR
         pr06WL4ebIZYl5BTMENLuxfebQX0LwAaA48G7uWuJ9FSLWzSMYaHjal6Ihrdw3XuLb7O
         yjflHRBtyPESc7iRc5DssZANqW/teG7ecP5S9vK6OIGfEx/2CaCbet5+n5aC507/B+Ec
         iQs/eiOaLEBsTjGMXIZW4yupqQavxxdBWCrfrU/oKZn3KGoqszF69cOO5XnjxPWylHRf
         igvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690333; x=1794295133;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v8pOdlYxikwaLjp8OZvxPrNbyKTUCQqg7s1stn4Ba5s=;
        b=SBLHZkjFJNVgOY7ERHLBSapKHWgNemMzKOxkDtJp8SN7MyjT9S8zY+xAT0tMpkHctJ
         3wUoxlNMmsP4gcj2ZC3MNVqg+Ifm4MDUb3fd4ljsXfE+h866NW1XH1VJXGUpA37BfDR0
         ay39ectObAsBEH1WFu3TQNRIDnO+aUydtSeOYtlRqKytNWQ6aLvTuh6zssjOMI0QT+Cz
         BwWY9DGvzGtxmBeBTXBZ9QCoXJLphVA83wUfJGFuTqHH2Ih8FxIlKUjYo0EZ64FKnRuP
         eg/IMS6Erw4/RKV0LDcOJVnDWaTqzlemuLTc6uuP1MXC5X13asYffBpz2uyExVHI1H6l
         ntKg==
X-Forwarded-Encrypted: i=1; AKwUvBzNbNCCOzesQypsEYAM1kqLe03cezAaISWlgT+IgB9X5tou/Qf+j/NqBp5EOpHiUaLCyWJHqIKqsiM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CUxAVNwjvKsod+IyoQoW+6FsDXZurfYx+HRxBEGPxoQHFImGi
	GE/9bDqFLr4jg5T9cauD2TuOVYfp36YUYP7AUKdbZkypumbK2T9bZcVZShwbR7sJCD5WafETaoi
	E0AFFN+mTm4XFrIZW44w42EGJ60u43800MgGPB+vpHLtopSRcif3Zru5dzG0v9XM=
X-Gm-Gg: AYBFou3lNIpSypaeZDC7kO16Ut6hNqI+RMzDa9mwnoP3aDtOouRtglmaDeVkcK0xBIw
	Xzd1op1E9YMzho4nkDUAgI8IXWhWz1KkVkUZGs8NZiawr26R+y0ISJm2zKSo47kMmhxw/A+SrWG
	Wj5IEso5DtG15Xui0hKIvwKU/TZ7dG+ja/0FKvc3SF5qzsI06SQoSbOLjCgIQYylmLRoaz4qico
	sgEet8y6Yz4RnvZx1b7v9b6cOag9c/2/KdCzmqGfDVGFgOHsCSuKlXHBzpFYUXd5tyoZTPKwIoE
	ACV5op1aHmAFM+iVgqSnWeRGu8lqZSukHp6Iz0fEUqKPfo8fcoTXfj5OCx2dVJNH6PKv9WQwoe1
	GkmYQRH7zgTPeDTvv5DGzepYXuCJWBhmwWo0WJBFWsiF8pUcXrRhnc74Daj/artw74YjPMhqbiq
	JNNDc=
X-Received: by 2002:a17:903:37c7:b0:2e8:b5b2:a9f9 with SMTP id d9443c01a7336-2eb364e9f75mr109570975ad.37.1793690333076;
        Mon, 02 Nov 2026 23:18:53 -0800 (PST)
X-Received: by 2002:a17:903:37c7:b0:2e8:b5b2:a9f9 with SMTP id d9443c01a7336-2eb364e9f75mr109570835ad.37.1793690332620;
        Mon, 02 Nov 2026 23:18:52 -0800 (PST)
Received: from [10.217.218.73] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39298329sm35935305ad.61.2026.11.02.23.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:18:52 -0800 (PST)
Message-ID: <fc929696-92ad-460a-b097-40e66a264252@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:48:46 +0530
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
Subject: Re: [PATCH v3 3/3] i2c: qcom-geni: Add bus recovery support for GPI
 DMA mode
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-0-7f2a6e572de9@oss.qualcomm.com>
 <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-3-7f2a6e572de9@oss.qualcomm.com>
 <b88efeae-6041-4189-a559-a16be07450bc@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <b88efeae-6041-4189-a559-a16be07450bc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae98ade cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=SV6vjZuu5MrVPe49oagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: s3xjEpcMeoy8WryGFbhvRv866boeHOsO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyOCBTYWx0ZWRfX0pTfih79EZvw
 6YVNiRB1f+dcLX8wetUqDM34UelxBogL914A5OqsdqPa+ucIgNH+vQcNwtG2eH4PHh95WzxqNJu
 p3/VPubC8Z6zjenUmHqgsi+4wp8V/SkGTMwYH5toSfoWBv6kUtJaydBShBn3C5aQstU5UZaujkk
 HSOC2cP19nht2QJ+JVyX5lycKgWKCTSBIKZE3gvkK0TKMTxGTJrVyP6LJfxKfwQjen7pwprNYAe
 rIpJ/bbHPTKUJP4ewZtfmQ0BWp+9lqLEQPujDgXNFqEIDAgIYWtAoKKcK3GEPVL/u0r+twwwHgS
 gkdwHrnMsk1vgbY1RubBLd2w//ZNBYWoM3+RVqhENdhxDim7jsm/PbXVn8cf9PB3QMQB2jSwIbF
 0ptJas8BUV+p2TK6ZhJ9Ko4HcaOzRtaz2rmLNz+QdA1PedpHY/z+HJgQUwsdU+HSGm8nJaK/WPk
 nXBqn6yHm9iiwM4iJ8w==
X-Proofpoint-GUID: s3xjEpcMeoy8WryGFbhvRv866boeHOsO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyOCBTYWx0ZWRfX3Cny84ePseuE
 cRwjx5/oHeYYmUSO/U6eZKWASAEuCaQzgQBUzDxy5vn5T9nixYCFN6rxsIUP4z3GRiKcOcuRrmU
 sN/okKn06UzYLMVO9fKZuZhIpWN/UmY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030028



On 10/27/2026 8:01 PM, Mukesh Savaliya wrote:
> 
> 
> On 10/27/2026 10:43 AM, Aniket Randive wrote:
> [...]
> 
>> +static int geni_i2c_gpi_bus_cmd(struct geni_i2c_dev *gi2c, enum 
>> i2c_op cmd)
>> +{
>> +    const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>> +    struct dma_async_tx_descriptor *desc;
>> +    struct gpi_i2c_config peripheral = {};
>> +    struct dma_slave_config config = {};
>> +    unsigned long time_left;
>> +    unsigned long flags;
>> +    dma_cookie_t cookie;
>> +    int ret;
>> +
>> +    config.peripheral_config = &peripheral;
>> +    config.peripheral_size = sizeof(peripheral);
>> +
>> +    peripheral.set_config  = 1;
>> +    peripheral.pack_enable = I2C_PACK_TX | I2C_PACK_RX;
>> +    peripheral.cycle_count = itr->t_cycle_cnt;
>> +    peripheral.high_count  = itr->t_high_cnt;
>> +    peripheral.low_count   = itr->t_low_cnt;
>> +    peripheral.clk_div     = itr->clk_div;
>> +    peripheral.op          = cmd;
>> +
>> +    ret = dmaengine_slave_config(gi2c->tx_c, &config);
>> +    if (ret) {
>> +        dev_err(gi2c->se.dev, "dma config error %d for bus cmd %u\n", 
>> ret, cmd);
>> +        return ret;
>> +    }
>> +
>> +    desc = dmaengine_prep_slave_single(gi2c->tx_c, 0, 0, DMA_MEM_TO_DEV,
>> +                       DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>> +    if (!desc)
>> +        return -EIO;
>> +
>> +    desc->callback_result = i2c_gpi_cb_result;
>> +    desc->callback_param = gi2c;
>> +
>> +    cookie = dmaengine_submit(desc);
>> +    if (dma_submit_error(cookie))
>> +        return -EIO;
> 
> Rather capture ret and return it if it's an error ?

sure. I will make the change in next patch.
> 
>> +
>> +    /*
>> +     * cur and err are shared with geni_i2c_irq() and the GPI callback
>> +     * i2c_gpi_cb_result(); both write err (the IRQ handler under
>> +     * gi2c->lock). Reset them under the lock before issuing the 
>> transfer.
>> +     */
>> +    spin_lock_irqsave(&gi2c->lock, flags);
>> +    gi2c->cur = NULL;
>> +    gi2c->err = 0;
>> +    spin_unlock_irqrestore(&gi2c->lock, flags);
>> +    reinit_completion(&gi2c->done);
> Safe to init before dmaengine_submit().> + dma_async_issue_pending(gi2c- 
>  >tx_c);

Agree. I will make the change in next patch.

>> +
>> +    time_left = wait_for_completion_timeout(&gi2c->done, gi2c- 
>> >adap.timeout);
>> +    if (!time_left) {
>> +        dev_err(gi2c->se.dev, "timeout waiting for GPI bus cmd %u\n", 
>> cmd);
>> +        ret = dmaengine_terminate_sync(gi2c->tx_c);
>> +        if (ret)
>> +            dev_err(gi2c->se.dev, "DMA termination failed for bus cmd 
>> %u: %d\n",
>> +                cmd, ret);
>> +        return -ETIMEDOUT;
>> +    }
>> +
>> +    return gi2c->err;
>> +}
>> +[...]

