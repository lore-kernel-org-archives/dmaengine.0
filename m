Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F072339A070
	for <dmaengine@vger.kernel.org>; Tue, 13 Oct 2026 05:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791869254; cv=none; b=TqS3K9rQchpWCTmupK+72nbXebuXTWOL7h1k3kGJl2QjB9WwlYaxxxUTXNSnmoeDAfy5yQym/iI3GiUF9fa4U1cPahPaqTpTsmVmvmm8TnqOyAQDUusotYKS9/ycrxeLuctDUB5sV5z+HPHLLRrl0sPcbtexC8KTCBPLpLnT/Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791869254; c=relaxed/simple;
	bh=p8v7zGw+jnmOL9ic9pcmIw3cEU5hBsK/Ef+eTcjY3ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EySa6bDXdnqgL220qBtsc0vhPvMn7d5pPlShqkhFJf6OlLQiF0IbYofSH2HNig0HzavZv76Zve0GxfM6slIKJXYmF+OGwuVzhL2oG+1It6SpJBHqri0vKgi+c3Vi/UY89DH55oYfOf3WdvOeoDs05lwv/ieR+YsQ6nPS/gtBY/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WogzpvGK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbcMln+z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WogzpvGK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbcMln+z"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D215OE408886
	for <dmaengine@vger.kernel.org>; Tue, 13 Oct 2026 05:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W/6a4uSy+t25RmWcX0cupcRr5bplqRSqJY2Uj5L4mUs=; b=WogzpvGKwKg5qgPR
	tkI01liBHEkX2Ij0Uc3i0FNYsQw2ycg8nvf6h+TAGJh1gpMA1ZXaK41Rx1rJPV6G
	bhxffOnzK5UuZWcbdAxwyxVIvTo3iuOvZo2vNcNKXM/8mBb6orKxjgzlbkoqy74N
	k0jsmB9LxGb63/WMU1PdAAc/P9WZvCyxuzHQZ0Bw2alp8HO1x6/J4rNIuPTeM6cm
	ys5iLrrEfbjwU1Yneor8wvL0fnw4H6RItgHHy4MnLLqAxgoV3erFWofcKl+qMjsZ
	aTNFmgR4vcCL2TLjmlLFkBIeBeGTYu6X0mNJz1dNtEGOWqYlufSeLKj2cZ09f64r
	GrHRkg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffm9x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 13 Oct 2026 05:27:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3abb4c24125so2160441a91.3
        for <dmaengine@vger.kernel.org>; Mon, 12 Oct 2026 22:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791869251; x=1792474051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W/6a4uSy+t25RmWcX0cupcRr5bplqRSqJY2Uj5L4mUs=;
        b=ZbcMln+z0+ir7hEN7Xu6QnI9NhX1xfoYX2T4MN9MuYwPVrR3BOVWzGRuBQFCy9KxBy
         4LTpWwbmbzwvPAG/CkeNI38nUA8HUQz+G2ICJfulnQf++xYqfm+cE/6uGiB3vLttYBGa
         GbIS6M0I35dgJMHqIbe4Jk8L6s1pgdoOG8PDqxxhoo1pBotaGos9p0lD+TSXNpcVOWHD
         Iu1z0knADi+X/YEDdmBMJVjguIbyD6QRekmY9/Jw347opblqHGFazT+WsBRg1chGPL7k
         u/P0Kem2O5wXaZcb8C62RcTJ+YTUothhCTaikehUkSjwIRwKgJgR0BHac9STaLWE/vP3
         voYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791869251; x=1792474051;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/6a4uSy+t25RmWcX0cupcRr5bplqRSqJY2Uj5L4mUs=;
        b=fX6TGz4ma7iggKP2EjRDgvZmdaMc7YL7uDipcFH0ALs/ECcuhEqd8APYKgkPF+Ccq+
         gb4IteUfmy6WtOTKOz1pPrhLvjwnX/4F7QYldtCrfRlVhmcS5Mxzg9fPNT38RWwmUng8
         eXMVK6hhbOTkGN3/RpXbBjngA/H2+QHWXUBuQJNDz2CU31d9c5AYGOt9dC3wiRhStVaU
         zWm0AAGn4h19jR1+jKYYJ2d4bkTQ8VxDCzCGasqbDRll2WCt9q0UF6PaYjQBTGAwKsq8
         GehTQhwIQMpxBBmA+sPs/Pux0bscmslJaKO6brVSJatGYuUhefZI9i51TXkOPhJzQmdx
         10DQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdM++JKDJuEtzmn97L1MfAxk25uraS00+mOp6N5IOFULIfWoH1h2I2TEO+80jr369cNgXUq+q2vhQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVx5TBAkhIOQacStl86INA1J8ffhrtpcCDTqPtvcPoq+qdLqp5
	/ABgy3yEp1c6ceiTSEh+6ZhN3hweJLIhGZZaQ8Wz+xbJpZD40ErTqV52ebguHKHYvajR2JCCAQ+
	A4CjXjBmejkbhB5Z5FQEbO9CIHwmdPJlrBi8+Gpged6r+nsYrTq74pY1VRtCSu20=
X-Gm-Gg: AYBFou23gnvBz7pLnt1w3s9AtFyus8roDq53JpTRII1awn5HXKc06/VIH0RT4sNzX5B
	V0huNWRts7/WkKwuuU6izMJQdtK2XZzj0EnjbAQsy6ruN+guVXgFsY4fXGFCuVypXokgx2r91aD
	9SOPKAxUGA/ucrZL3sB/6PCbWzQM/kPqF7h9XecpLRJ5Lz5nAAzIZQ/6feAp+7h2sQkeUq7TuOr
	SoD4NPydzTNFjpcBtcxvUouAob+QZK4vguDXaPsynM9/7YuHIDXubLS67J+jVUTrVWNVJWTRSdM
	6Cv14xiZ8PBZx8GeAMdUQOFww1ct3Cxsai5NYaZOzbYN2hB5gitGUjbsD54YCW6dV+D5E7NWIK/
	YGVa2VK5bjgyfQBuhkH4P9BDMFyo6Q1Cu
X-Received: by 2002:a17:90b:1d48:b0:3a6:582e:5e17 with SMTP id 98e67ed59e1d1-3ab3ab25b70mr6161953a91.48.1791869250789;
        Mon, 12 Oct 2026 22:27:30 -0700 (PDT)
X-Received: by 2002:a17:90b:1d48:b0:3a6:582e:5e17 with SMTP id 98e67ed59e1d1-3ab3ab25b70mr6161933a91.48.1791869250307;
        Mon, 12 Oct 2026 22:27:30 -0700 (PDT)
Received: from [10.217.218.111] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed0daesm19468684a91.5.2026.10.12.22.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 22:27:29 -0700 (PDT)
Message-ID: <903bec3e-14a0-447a-8652-f57efa58cb68@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:57:24 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] i2c: qcom-geni: Add bus recovery support for GPI
 DMA mode
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260826-i2c_bus_recovery-v1-0-203f0ec76f84@oss.qualcomm.com>
 <20260826-i2c_bus_recovery-v1-3-203f0ec76f84@oss.qualcomm.com>
 <7cc05c51-811f-4949-9fe6-10580ff90eea@oss.qualcomm.com>
 <bcf5b148-d4d0-434d-a020-deca2381f5a3@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <bcf5b148-d4d0-434d-a020-deca2381f5a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMSBTYWx0ZWRfX8poxbjJVQXxj
 PBL6sIlVO8yN3+ZoyvRCemNtVUcdYZhGc+AoUWX0tPtmB4nkYjl8s+n/N/fP9VYY/SEGj0tI3A/
 tA4r7JOh/HtziXT6BtXH3ECxz9YldexkbrRdUZYu5SC9108Twz7TkMpYhC/vs3sLwwBEhpGMVT3
 y/BGYSx2uvuxrwdjahMTsoIQ5QxS45NYN9LHPhAyxlY6VTFSt4R6zRtdHjJXF/lvuyHOq5URoAH
 B4QiLOV1a59EaoccVNDcFyY6mVwKmkAQnFfh8pEIiGEXVg9zhKvTBTU28JOODQWu7jdWvdPf0+0
 5lJOAh+ve79QKvM+C717bja+adwyXRoP1mh0rSc/Y1ab6zwrQnAzh8yvZC3Ld3OG+z9TEEie6+m
 tHHbSEMCMF926G5ce46RG926tUUMz/WQxcDyCOG32KdYq89Q0OX5BELlNJUUZWwqp/GU4Fa+nal
 dF5tRgumhIfaNfY0IJg==
X-Proofpoint-GUID: ENjShA9UIoU0K3ciP8MBPN1zPfBj5Wnw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMSBTYWx0ZWRfX2yWj7+BbKV91
 xfl7HybGMtdvldyB6sZzYMqueuUKShwXFmA0EvsRkNeo3Lclzk8VcgKDh0M1bmizQssXUJBBp7h
 I38ELHsB2zPmv5cthtJU/gf6ogDK5qQ=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6acdc143 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=jt_ap3qWCKZ60gYu8XkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ENjShA9UIoU0K3ciP8MBPN1zPfBj5Wnw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130021



On 9/7/2026 12:16 PM, Mukesh Savaliya wrote:
> 
> 
> On 9/3/2026 9:44 PM, Jyothi Kumar Seerapu wrote:
> [...]
> 
>>> +static int geni_i2c_gpi_bus_cmd(struct geni_i2c_dev *gi2c, enum 
>>> i2c_op cmd)
>>> +{
>>> +    const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>>> +    struct dma_async_tx_descriptor *desc;
>>> +    struct gpi_i2c_config peripheral = {};
>>> +    struct dma_slave_config config = {};
>>> +    unsigned long time_left;
>>> +    unsigned long flags;
>>> +    dma_cookie_t cookie;
>>> +
>>> +    config.peripheral_config = &peripheral;
>>> +    config.peripheral_size = sizeof(peripheral);
>>> +
>>> +    peripheral.set_config  = 1;
>>> +    peripheral.pack_enable = I2C_PACK_TX | I2C_PACK_RX;
>>> +    peripheral.cycle_count = itr->t_cycle_cnt;
>>> +    peripheral.high_count  = itr->t_high_cnt;
>>> +    peripheral.low_count   = itr->t_low_cnt;
>>> +    peripheral.clk_div     = itr->clk_div;
>>> +    peripheral.op          = cmd;
>>> +
>>> +    if (dmaengine_slave_config(gi2c->tx_c, &config)) {
> should capture the return value and print, as it returns specific error 
> code.>> +        dev_err(gi2c->se.dev, "dma config error for bus cmd 
> %u\n", cmd);

Yes we can capture it. I will update it in v2 patch.

>>> +        return -EIO;
>>> +    }
>>> +
> 
> [...]
> 
>>> @@ -1066,14 +1136,18 @@ static int geni_i2c_xfer(struct i2c_adapter 
>>> *adap,
>>>       else
>>>           ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
>>> -    if (!gi2c->gpi_mode &&
>>> -        (ret == -EPROTO || ret == -ETIMEDOUT || ret == -EAGAIN)) {
>>> +    if (ret == -EPROTO || ret == -ETIMEDOUT || ret == -EAGAIN ||
>>> +        (gi2c->gpi_mode && ret == -EIO)) {
>>>           /*
>>>            * Only attempt recovery if SDA is stuck low. -EPROTO and
>>>            * -ETIMEDOUT indicate bus errors where the target may be
>>>            * holding SDA low. ARB_LOST (-EAGAIN) on a single-controller
>>>            * bus indicates a stuck target, not a real arbitration loss.
>>> -         * GPI DMA mode extends this trigger separately.
>>> +         * In GPI DMA mode the completion callback reports NACK,
>>> +         * BUS_PROTO and ARB_LOST alike as -EIO, so the SE_GENI_IOS
>>> +         * RX_DATA_IN check below is what distinguishes a genuinely
>>> +         * stuck bus from a benign NACK: a NACK leaves SDA released
>>> +         * (high) after the STOP, so recovery is skipped.
> after the STOP, indicating i2c bus is in idle state, so.....>> 

Sure. Will update the comment.

>             */
>>>           if (!(readl_relaxed(gi2c->se.base + SE_GENI_IOS) & 
>>> RX_DATA_IN)) {
>>>               int recovery_ret = i2c_recover_bus(adap);
>> This does not appear to handle scenarios such as an I2C multi-message 
>> transfer where the stretch bit is set during the first message, but an 
>> error occurs while preparing the second message (for example, during 
>> memory allocation or DMA descriptor preparation). In such cases, the 
>> SCL line may remain asserted low and impact subsequent transfers.
>>   > @@ -1292,10 +1366,8 @@ static int geni_i2c_probe(struct 
>> platform_device *pdev)
>>>       if (ret < 0)
>>>           return ret;
>>> -    if (!gi2c->gpi_mode) {
>>> -        gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
>>> -        gi2c->adap.bus_recovery_info = &gi2c->rinfo;
>>> -    }
>>> +    gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
>>> +    gi2c->adap.bus_recovery_info = &gi2c->rinfo;
>>>       ret = i2c_add_adapter(&gi2c->adap);
>>>       if (ret)
>>>
>>
> 

