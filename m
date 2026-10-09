Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8E84D17AF
	for <dmaengine@vger.kernel.org>; Fri,  9 Oct 2026 11:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545376; cv=none; b=g7Kebg7uURQbgDHKyPOfepJEpn2NW4fOaSYy/ncwq2LUW3jWND2hZ/ERKrH3FJoOZfeWtynKXvffwXozyNQAi+xPrfpJZPk8wy9g02GWQGurOG8oi/wqpuFpIQbNgwupJ1wVqQdT2qmUAOoUqXD5fV5v8MyvwOi/754ilrfXY3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545376; c=relaxed/simple;
	bh=EdixUANFHy2W/LiaSAuiS/Tx+42OwOUTMhGj/CqPQx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NUCLUBj/mbIeR1C/E+qFe6BG0csMFAKdcM81MV+GbGs8fA69lq7KYz9jheoz5t4ZQ55Cg0oOYTyDHTexs7v44ZkhKdjPRQp4/ucjQ85bxxhG7Z91YEsfC3USnjeJsA9dEpKTPdlOFLcHdzfYgYTLz5nkBKwLniRZrWiRYCqUCMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SUSg7DTW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=irZlwIX+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUSg7DTW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="irZlwIX+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KCeZ2257030
	for <dmaengine@vger.kernel.org>; Fri, 9 Oct 2026 11:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	haBBSODWucHm3mmfANsuSegkfg8lAA0orynM/G8N+1k=; b=SUSg7DTWdbMS5wrU
	TY0KL30fXocj8trQ5oSlOSkx3Sze/QVQEUmFZG0yzUFKJ8H7nlJmGFHjEwoY0g02
	X7BD3wjAMya4H202Xa09mDai+GN4NSJOcSZ1BKtQlvCjCmQT6gZC4vxQsA9uTcNv
	j3kuu2kKW9Dc8YSGcMqLPm44Ye2hElOV5gu/uk1tdW+3WSvylWUI2bIOvnGPnbFY
	LXs48Mr4Pq/yriK8w9dVrk5IH4TJFe6qbgCnp26TT1q0+LMWPN7WV7J86N1VU+uT
	ueMZEAHmj09DQoEd8Z2XWfxkqNZEyYO/y9dULU+2DuyvLL+Ia36DwETh6vM7Kn3Z
	zmSkLQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nuft3ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 09 Oct 2026 11:29:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34d49d8dee1so7470246eec.0
        for <dmaengine@vger.kernel.org>; Fri, 09 Oct 2026 04:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791545362; x=1792150162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=haBBSODWucHm3mmfANsuSegkfg8lAA0orynM/G8N+1k=;
        b=irZlwIX+VSPOrfDOu5BRox8EMuZ6tpfa8eF1nOt1qy/ymZ1oMXBMeabnUWBgbU5ftB
         8NAYWED/HTkU4d3aJ0KemgmsvyOyZ5Lr1A5eMw4S5RRkzz18kpBB5HutU3IHy5fwCMs9
         mPpuapg5w5TqJP755THlKnRoeq4KfZjK2UqfVD7G8zuupiqKSSG8/WCCToz8Oq0Ymhiz
         GzqoPWLRkMH9JHK00cHhW68TXTzfQ3a55FLws683/nelVo5ucM0l5U7HNo8MytSGtsty
         qxoQdEfvop0H0w0HHpGHewXuh+0B27yKuGmG+bwyLedPJ3SobAh9qWlTc0DoLL8d5Ji4
         pAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545362; x=1792150162;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=haBBSODWucHm3mmfANsuSegkfg8lAA0orynM/G8N+1k=;
        b=kTZAMu5zT1KgG1v8eIyALVIfnMbQ8I/GXxKLBUh7gse7+yR0pNGd4YyLOjfp535Wmc
         as5o0X00bWhsmXCquAPmLK+qC1W/DLB9A5RguG26W4Z5QKn4681Mgyg+CrFBNkhBbNZ8
         i3EHveA6jqjKYH+ipafs/rXoufgAV+8E38VBVjOas65/Z7gwwwpxNlZGKM0ogmg4u7Ex
         ZtGkSH8lLlY24pGZfX3rb6d3X4uq+IS1ShlNmiGlxlUvWt/GuLlXblNp2zRsZvPULyz0
         kuqMAIhlqkdOrpgWaa7VQN7MdXTp0EM3dkD5K024c2CPfrVtLyWSl0a4HBvGNYvWFe71
         ZSOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKTf/oK6iMbUpEHHY8r6C/kXPsV+jVpjssQmo7N98NYdEoNzdcCTlvdMECOE9JyxNLBV1uG71ns6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSxT+uUA0LQ9ti4RzOFaOXeGYl0sDlqntKxTScY4jURoNJPISC
	pj/t1A4JHwwGepzwCYpBt4z6/KvMu5tycAQnHqa74tLzIGxM6dWrTz2yI6WgsGVIWHdNT6H4tlN
	5Cg8PAQ3QDu9Il1zffyFV6BgVD16QOW10h25L84jVS6d44JDKwAAO1d7eqLrC3Js=
X-Gm-Gg: AYBFou0uFmd19BrrkYc04+nhIaB96srEW8qaEBP13dWbzteSxYbUG7POkyD8j8OTZem
	8CMTVO5hEHfP7tjMsXwcMhd2yaDKts3ip0EneYxY8UCYObNnX96UduwG/o05AKqyJ2Orw3QuAHT
	ZoAQADKxQ8OnrbzBPbYWXACWXdeiPex8G9G2W+SUxnOMWW6eBa+FIXJ8OJisOgzsZ0zSSm3dBeN
	RQxp1qUMF6dSMZ90S6vFwgXf2RKVUFRMi9FuIyyR7IEu8DiPqg48FsbYfVrjwlm7LdaFRtNC/Mi
	iZ+HfLVAfPcSiOkxO76Hn1XCDBeRFDkdKMu2iGO7A7Gr5q/4V8dk9Msdpst/wgABo+IPlI7Zbdx
	DOZpkLp5aAAMLsHWSFeWdLRG+5ngRMqtl
X-Received: by 2002:a05:7301:db14:b0:351:757d:71bd with SMTP id 5a478bee46e88-3537e05b78dmr2342395eec.24.1791545362009;
        Fri, 09 Oct 2026 04:29:22 -0700 (PDT)
X-Received: by 2002:a05:7301:db14:b0:351:757d:71bd with SMTP id 5a478bee46e88-3537e05b78dmr2342354eec.24.1791545361310;
        Fri, 09 Oct 2026 04:29:21 -0700 (PDT)
Received: from [10.217.218.111] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1cc25sm8169040eec.8.2026.10.09.04.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 04:29:20 -0700 (PDT)
Message-ID: <c8d61771-1eb5-435f-a4df-9b585e4ef620@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:59:16 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] i2c: qcom-geni: Add bus recovery support for GPI
 DMA mode
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260826-i2c_bus_recovery-v1-0-203f0ec76f84@oss.qualcomm.com>
 <20260826-i2c_bus_recovery-v1-3-203f0ec76f84@oss.qualcomm.com>
 <7cc05c51-811f-4949-9fe6-10580ff90eea@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <7cc05c51-811f-4949-9fe6-10580ff90eea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac8d012 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RhFRd_MFMwiQnDz1XkEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0NSBTYWx0ZWRfX3vIqei2ZLyzm
 PnWPqtUn6jJS8YzpU4tcoGNT79wYfOEomZ8EdkUU7d5cpbmb067BRddx2UFvmDyv3KL9IdYvtUJ
 1xytknwasgMlQW93c8V5w7l3LdYvX3s=
X-Proofpoint-GUID: puExv5FtVPFftmfcEo8vxRLqkMctkIpB
X-Proofpoint-ORIG-GUID: puExv5FtVPFftmfcEo8vxRLqkMctkIpB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0NSBTYWx0ZWRfXzvTrrtdd2/Yz
 /O39lUtnLMi0DoybIuS6FArdewqhx6BtOqMNjF1o1LzWxJbfx8sZpEYgPGpjFNe5ivAbD1Kxkqc
 iM+VuL44gu/VX/uooAz3/vQTFCJH0uIUtbRJR2JRKxBeRnWMRDL4sSKzxPr14R4OG8MhU+zKvfd
 XtrNBpZ6ooc1hhZliGbhRmNKm0NhMs0bw/k7e9KJ3uUJwExSflq9g1i6YAMgxr3MQY3WLOQQnVH
 WOMekWdt35peGjrLNlXGzxOxVJEa7xmv8X004WK/vhG0KKTOvqyV0kTbS6rra9LEBGBGRrHN1tQ
 b5kdKyDA6GXPSNl4B5tPQZKmjmThxFvembgzVpuXUK5oPkOSYjYXgHf0RR7gQlQG+ZOTx/LvLi7
 RYSZGlzWXssaxHW7lHkq6lLvk+RFBxky7AoWGCt7XZNQVOg9M371ceAzvVfq5wXhsBiJswNcLqp
 DNSYqFtPiBEUJF26msQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090045



On 9/3/2026 9:44 PM, Jyothi Kumar Seerapu wrote:
> 
> 
> On 8/26/2026 3:21 PM, Aniket Randive wrote:
>> I2C transfers in GPI DMA mode can fail with -EIO when a target holds
>> SDA low, leaving the bus stuck and preventing subsequent transactions.
>> The GPI completion callback reports a NACK and a genuine bus error
>> alike as -EIO, and the existing recovery path switches the SE to FIFO
>> mode which is not valid in GPI DMA mode.
>>
>> Add bus recovery support using the I2C_BUS_CLEAR and I2C_STOP_ON_BUS
>> opcodes issued via the GPI TX DMA channel. Guard the -EIO recovery
>> trigger with a SE_GENI_IOS RX_DATA_IN check to skip recovery when SDA
>> is already released. Extend the recovery callback to dispatch through
>> the GPI DMA path when gi2c->gpi_mode is set.
>>
>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 104 +++++++++++++++++++++++++++ 
>> ++++------
>>   1 file changed, 88 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/ 
>> i2c-qcom-geni.c
>> index 9fa1a8ac400c..85cb1367958c 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -34,8 +34,6 @@
>>   #define I2C_READ        0x2
>>   #define I2C_WRITE_READ        0x3
>>   #define I2C_ADDR_ONLY        0x4
>> -#define I2C_BUS_CLEAR        0x6
>> -#define I2C_STOP_ON_BUS        0x7
>>   /* M_CMD params for I2C */
>>   #define PRE_CMD_DELAY        BIT(0)
>>   #define TIMESTAMP_BEFORE    BIT(1)
>> @@ -1003,6 +1001,70 @@ static int geni_i2c_fifo_bus_cmd(struct 
>> geni_i2c_dev *gi2c, u32 cmd)
>>       return gi2c->err;
>>   }
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
>> +    if (dmaengine_slave_config(gi2c->tx_c, &config)) {
>> +        dev_err(gi2c->se.dev, "dma config error for bus cmd %u\n", cmd);
>> +        return -EIO;
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
>> +    dma_async_issue_pending(gi2c->tx_c);
>> +
>> +    time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>> +    if (!time_left) {
>> +        dev_err(gi2c->se.dev, "timeout waiting for GPI bus cmd %u\n", 
>> cmd);
>> +        dmaengine_terminate_sync(gi2c->tx_c);
>> +        return -ETIMEDOUT;
>> +    }
>> +
>> +    /* ARB_LOST and BUS_PROTO may be expected during recovery; treat 
>> as success */
>> +    if (gi2c->err == -EAGAIN || gi2c->err == -EPROTO)
>> +        return 0;
>> +
>> +    return gi2c->err;
>> +}
>> +
>>   static int geni_i2c_recover_bus(struct i2c_adapter *adap)
>>   {
>>       struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
>> @@ -1021,15 +1083,23 @@ static int geni_i2c_recover_bus(struct 
>> i2c_adapter *adap)
>>           return 0;
>>       }
>> -    ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR);
>> -    if (!ret)
>> -        ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_STOP_ON_BUS);
>> +    if (gi2c->gpi_mode) {
>> +        ret = geni_i2c_gpi_bus_cmd(gi2c, I2C_BUS_CLEAR);
>> +        if (ret)
>> +            dev_dbg(gi2c->se.dev, "GPI bus clear returned %d, issuing 
>> stop anyway\n",
>> +                ret);
>> +
>> +        ret = geni_i2c_gpi_bus_cmd(gi2c, I2C_STOP_ON_BUS);
>> +    } else {
>> +        ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR);
>> +        if (!ret)
>> +            ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_STOP_ON_BUS);
>> +    }
>>       /*
>> -     * Recovery succeeds only once the slave releases SDA, so the bus
>> -     * state is the authority: RX_DATA_IN high means the bus is free,
>> -     * while a clean opcode status with SDA still low is a failed
>> -     * recovery.
>> +     * Recovery succeeds when SDA is released. RX_DATA_IN high means the
>> +     * bus is free; trust this over the opcode return path, which cannot
>> +     * flag a benign recovery event in GPI mode.
>>        */
>>       if (readl_relaxed(gi2c->se.base + SE_GENI_IOS) & RX_DATA_IN)
>>           ret = 0;
>> @@ -1066,14 +1136,18 @@ static int geni_i2c_xfer(struct i2c_adapter 
>> *adap,
>>       else
>>           ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
>> -    if (!gi2c->gpi_mode &&
>> -        (ret == -EPROTO || ret == -ETIMEDOUT || ret == -EAGAIN)) {
>> +    if (ret == -EPROTO || ret == -ETIMEDOUT || ret == -EAGAIN ||
>> +        (gi2c->gpi_mode && ret == -EIO)) {
>>           /*
>>            * Only attempt recovery if SDA is stuck low. -EPROTO and
>>            * -ETIMEDOUT indicate bus errors where the target may be
>>            * holding SDA low. ARB_LOST (-EAGAIN) on a single-controller
>>            * bus indicates a stuck target, not a real arbitration loss.
>> -         * GPI DMA mode extends this trigger separately.
>> +         * In GPI DMA mode the completion callback reports NACK,
>> +         * BUS_PROTO and ARB_LOST alike as -EIO, so the SE_GENI_IOS
>> +         * RX_DATA_IN check below is what distinguishes a genuinely
>> +         * stuck bus from a benign NACK: a NACK leaves SDA released
>> +         * (high) after the STOP, so recovery is skipped.
>>            */
>>           if (!(readl_relaxed(gi2c->se.base + SE_GENI_IOS) & 
>> RX_DATA_IN)) {
>>               int recovery_ret = i2c_recover_bus(adap);
> This does not appear to handle scenarios such as an I2C multi-message 
> transfer where the stretch bit is set during the first message, but an 
> error occurs while preparing the second message (for example, during 
> memory allocation or DMA descriptor preparation). In such cases, the SCL 
> line may remain asserted low and impact subsequent transfers.
>   > @@ -1292,10 +1366,8 @@ static int geni_i2c_probe(struct 
> platform_device *pdev)

Thank you for pointing this out.
The GPI completion callback reports transfer failures as -EIO, but 
failures while preparing a later descriptor may return other errors such 
as -ENOMEM or -EINVAL. If a preceding stretched transfer has left SCL 
low, this requires separate consideration.
However, the bus-clear sequence is only applicable when SCL is high and 
SDA is held low, since it recovers the bus by generating SCL pulses. It 
cannot recover a bus where SCL itself is held low. The recovery callback 
therefore detects SCL-low and returns -EBUSY without issuing 
I2C_BUS_CLEAR or I2C_STOP_ON_BUS.
The GPI error path already calls dmaengine_terminate_sync() for both 
channels. I will verify whether this releases a controller-owned stretch 
before extending the recovery trigger to descriptor-preparation 
failures. If termination does not release SCL, the appropriate fix is a 
GPI/GENI abort or reset path, rather than invoking bus-clear.

- Aniket

>>       if (ret < 0)
>>           return ret;
>> -    if (!gi2c->gpi_mode) {
>> -        gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
>> -        gi2c->adap.bus_recovery_info = &gi2c->rinfo;
>> -    }
>> +    gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
>> +    gi2c->adap.bus_recovery_info = &gi2c->rinfo;
>>       ret = i2c_add_adapter(&gi2c->adap);
>>       if (ret)
>>
> 

