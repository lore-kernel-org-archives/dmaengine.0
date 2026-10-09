Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112913E2ADD
	for <dmaengine@vger.kernel.org>; Fri,  9 Oct 2026 06:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529109; cv=none; b=npReUMEUJL0G4++TWGI4YQOyHG0hrwNg0dwVUNFZ5i9u/AAUMG2id/A3xQtEUMoYa3VXBs9icX/QtXm+64U9ZdJhky0g0v8inu1ptI7mUBNpFDGvxa1vP/D6TR5UeOX6IlA99zJCGlpbFjem+pg/E+iMZZAQvqsUL31tiiyLAb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529109; c=relaxed/simple;
	bh=H+Y8RzC5TxgkfHxSQ2HlzL6P/br38TiXrp5S9KGg7FA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PVCZS2pqNifVNq6Ed36LCqFAiITExJ9rp0liKAXWaOFut+1jL7bmnDJESFBYs4tPFfrT5XFtiTmTrJ/IwhZOPAWz5uBtBn+q/d3A5el3HG0/74rE+b4flQijAujLO6n9W21u4jBvs84orHbN4VsxgRsMAaVjQ4EHbJD78Vv6bOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e0HdMmtg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I9dYdZTS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e0HdMmtg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I9dYdZTS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HAli3942629
	for <dmaengine@vger.kernel.org>; Fri, 9 Oct 2026 06:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pO/SYjnRWymyImdbVdnte2OOLQZK9DbHm07oHhmaBA4=; b=e0HdMmtgr5ye4DOd
	/xRt2syCWAD7jwdvV3EBT6eS2vBDPE+2UIWE7MZ1XEp7tmulBzfP01wnFgBF23vj
	mCrSEaUTSE2m6D89ZmKbaPlwpdRwVSacKLynqNpI1pVXSn8EgIF96UtSizro4QhG
	MwUl1f4hNEDALUZ36Aln9C8Sybrd6n+BOwGSUaAhTSwaqW/A1jvCnTH5YAJWAxBZ
	XJd7dqMXT88iWg10vtRR6pHxw2uDYuItCdJ7wAEuJm43KJ3Qq1jrqxBJCjPlAT8e
	BDqAg48yaUynj5TAzmbaPXeSTEtDvVRGWpqUXTOOVC98CxHRFMbK7V4dJQKPkeJq
	cVmmpg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk2ca5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 09 Oct 2026 06:58:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a47a81e70bso6226719a91.0
        for <dmaengine@vger.kernel.org>; Thu, 08 Oct 2026 23:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791529106; x=1792133906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pO/SYjnRWymyImdbVdnte2OOLQZK9DbHm07oHhmaBA4=;
        b=I9dYdZTSa3A7fayWcNwsmSxjTMSD9nuChoYtoE5dOdV1xfLhYVPuIMgqZbT6Zvwqec
         vpInt1uOv5vVZwvK8a5t3dtkzb9wkc2Lonv5E1T2G4uGo7sRMh6CQ2HCRZa6tRaFeLqG
         L6s2nebZitlQBFFsg72YD4YQ7qh6q1+Ytes9MtTREAeLClArmdSU2L+w7RQm7luSPplC
         FMBXR4o/N8wlxEoKnBhsTctD1Bmp87APurLLIrVN5wZhWnAagIZYk6hk/vwsW+/PgK4Z
         3Ed1cpNJSmo7pH0eAKQ+mwQFpnhF8chcINlXrpcwZeU85mmLNH0Vm2ZW5cZsTVRJ9Lhr
         S71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529106; x=1792133906;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pO/SYjnRWymyImdbVdnte2OOLQZK9DbHm07oHhmaBA4=;
        b=YwthAlpc3eNyrjBNaHU/XDbkY0tdkjccNbMucGprOVZZOrsHJhnpGaAdHS6bUG/NzA
         LFaIc4xJUssLL+q/L3evvOnpSmdARIM2w8D0AmQQm/rZmfA8wehqYJ7LLa6PZxWDPZbD
         cvwHjWWDofpwgI5XNy/ateKOe9aGrxFeyjkDXBdCcYJ13nFh2BYGwNl1neAJ+kE/+ehR
         rk417+rJC2rc13s9zW7Zkbyy+zh2EkZKARmPALLL7GZWNiyWHb6GtA+Wf3N8n4rUoVFE
         ixPo34I+Vya/t0FdQfrrxtJABPMxnpVWmZqDh6cTJI3b6wCT9HuAJIno+9zyj3yLBfXk
         7w/w==
X-Forwarded-Encrypted: i=1; AKwUvBw76Zr6kz3L8855/nRpzzkyz26FtyRphiiBqvV4PjS85Tf79yNhtRhjdQzq6trde0KOjDXDc+mvHd0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwqZxoaUHtX5USSluCzpYkNvaPCJKqjNViT3UOFHROob9ZhZL2
	RshivBOLgNdWZVThlEoKoSWZEHx9FW+Sdf1JR4vlgoIsYDPHcIvvom/LXN0977Dc3MoP0LGeUZ1
	qQxrs+L4YXl+kYdMO9BT3g8U/YAHptO7YPW7LclvOvC+iDfeidJ5SDvBwsDdMABbMrx4NxQE=
X-Gm-Gg: AYBFou1bYzjGxXRxk+MGMORSv+bomwO1cJ7jfa48I7blxMqCHPbIVv1PBGVucSpdXr2
	LjnbX3P5aGyFRHHw9HI7A+hvxerC3gW3GCDCSONVekGyIUsl08V/CvmdwN6GIB8ViHKLE/TvRie
	ZzO6y/6qX2nIH6D6LFsmudOdQEYgpAgG4+uVI8jE32tc2Dso+re4YUjfSTcfhCG07vR2IZ++E4b
	aouJaTJ0U2F9lSOxrNTHU9DNEDjgToOrQ5j2kgIvRpt1NQ5nDc/4U2W/iROFzXSaP8khxpEf7W7
	ZP4LGQNfYCspsTEqr7bbQIP0CZkdESGEZIhQPYOdH8blwgyRo5zU/Nm6JRhUYiIvFJk0qBX0BLx
	mbMwOTijfSILL6CKSnTCBEFd7sLsiiKJx
X-Received: by 2002:a17:90b:1850:b0:3a2:b4bb:91ca with SMTP id 98e67ed59e1d1-3ab3a239cb0mr1023919a91.1.1791529106402;
        Thu, 08 Oct 2026 23:58:26 -0700 (PDT)
X-Received: by 2002:a17:90b:1850:b0:3a2:b4bb:91ca with SMTP id 98e67ed59e1d1-3ab3a239cb0mr1023895a91.1.1791529105801;
        Thu, 08 Oct 2026 23:58:25 -0700 (PDT)
Received: from [10.217.218.111] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e2570sm4345245ad.79.2026.10.08.23.58.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 23:58:25 -0700 (PDT)
Message-ID: <7155c933-b300-4d3d-9e7d-84c58e8d53c5@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 12:28:20 +0530
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
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260826-i2c_bus_recovery-v1-0-203f0ec76f84@oss.qualcomm.com>
 <20260826-i2c_bus_recovery-v1-2-203f0ec76f84@oss.qualcomm.com>
 <990a4ab8-bd03-415c-ae95-008cee7740df@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <990a4ab8-bd03-415c-ae95-008cee7740df@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac89093 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=m4qPSjg0qbgqw-UF5zgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: s5mGSGjoEBPnViBFSOvWsIh32yHJ3IBC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyNyBTYWx0ZWRfXxrkRXdNxhb2Z
 hWsHR/KWGaKZLwx0HWlBdreLhnuoKxibmViHR5+sUBptAAHJFfKf7WOKSqYB5TjWM7M5dVowDwu
 p0D1WWCPDCt0U1LX9zBjl1mfHuLbpp4=
X-Proofpoint-ORIG-GUID: s5mGSGjoEBPnViBFSOvWsIh32yHJ3IBC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyNyBTYWx0ZWRfX12WVnv2fWt9t
 J/DWr9gek1HH6saG9C5DXFvL5LLv8agXdeu671SD/bKH4mGI4yXxb04muXwIwr84ov/3jahncIP
 Cq+7/abv9qbyM6SHTgdAGMybOK3oJ+XpVDpeD3p4qMJV7q4AUO7uq3oPABQ4ouSnuXzmLOh+xo3
 u7z7yMJhhVGkOESKittgxlTrpNlcvD/KOliIXyUsVDzH8nuGeyp0EFh4H9bTkJ4Ma3+n8JF/dFa
 zLUhMnzu8zo2T0n0+2nSVIKS9btBkmLQTx6SJFHkWJaSVsCoRIhh+0C31ezqv8iXqGzmfetcUgM
 Ghhhzr83nGY+7IUgT2zMJ+VSAFTqQHeyBO0BnJ2S+eWddBpDeEtYhSHz5m1bPlNJT1iCMnMdFle
 O2Sl5CEtzYqsofWpg4KeD4B0t5Zg2AkRawR1V2XYc1aTPYHlGOi7nGCXVmBP/MabKB00G4tCTzz
 CKhvvfdL5V5WCYWDAaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090027



On 9/3/2026 9:47 PM, Jyothi Kumar Seerapu wrote:
> 
> 
> On 8/26/2026 3:21 PM, Aniket Randive wrote:
>> I2C transfers in FIFO mode can fail with -EPROTO, -ETIMEDOUT or
>> -EAGAIN when a target holds SDA low, leaving the bus stuck and
>> preventing subsequent transactions.
>>
>> Add bus recovery support using the I2C_BUS_CLEAR and I2C_STOP_ON_BUS
>> hardware opcodes to restore the bus to an idle state. Check the SDA
>> line state through SE_GENI_IOS.RX_DATA_IN and skip recovery when the
>> bus is already free. Trigger recovery automatically from
>> geni_i2c_xfer() on -EPROTO, -ETIMEDOUT and -EAGAIN (arbitration-lost)
>> errors, and register the recovery callback through i2c_bus_recovery_info
>> to allow recovery via i2c_recover_bus().
>>
>> This adds bus recovery support for FIFO mode only.
>>
>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 109 +++++++++++++++++++++++++++ 
>> ++++++++++
>>   1 file changed, 109 insertions(+)
>>
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
>>   };
>>   struct geni_i2c_err_log {
>> @@ -956,6 +957,90 @@ static int geni_i2c_fifo_xfer(struct geni_i2c_dev 
>> *gi2c,
>>       return num;
>>   }
>> +static int geni_i2c_fifo_bus_cmd(struct geni_i2c_dev *gi2c, u32 cmd)
>> +{
>> +    unsigned long time_left;
>> +    unsigned long flags;
>> +
>> +    /*
>> +     * Clear cur so the IRQ handler does not attempt FIFO watermark
>> +     * filling or draining while the recovery opcode is in flight.
>> +     * cur and err are shared with geni_i2c_irq(), which reads cur and
>> +     * writes err under gi2c->lock, so take the lock around this reset.
>> +     */
>> +    spin_lock_irqsave(&gi2c->lock, flags);
>> +    gi2c->cur = NULL;
>> +    gi2c->err = 0;
>> +    spin_unlock_irqrestore(&gi2c->lock, flags);
>> +    geni_se_select_mode(&gi2c->se, GENI_SE_FIFO);
>> +    reinit_completion(&gi2c->done);
>> +
>> +    geni_se_setup_m_cmd(&gi2c->se, cmd, 0);
>> +    time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>> +    if (!time_left) {
>> +        dev_err(gi2c->se.dev, "timeout waiting for bus cmd %u\n", cmd);
>> +        gi2c->abort_done = false;
>> +        geni_se_abort_m_cmd(&gi2c->se);
>> +        time_left = ABORT_TIMEOUT;
>> +        do {
>> +            time_left = wait_for_completion_timeout(&gi2c->done, 
>> time_left);
>> +        } while (!gi2c->abort_done && time_left);
>> +
>> +        if (!time_left)
>> +            dev_err(gi2c->se.dev, "abort timed out for bus cmd %u\n", 
>> cmd);
>> +
>> +        return -ETIMEDOUT;
>> +    }
>> +
>> +    /*
>> +     * ARB_LOST and BUS_PROTO interrupts may be reported while the bus
>> +     * transitions from stuck to idle during the recovery sequence.
>> +     * The opcode completed successfully so treat these as success.
>> +     */
>> +    if (gi2c->err == -EAGAIN || gi2c->err == -EPROTO)
>> +        return 0;
>> +
>> +    return gi2c->err;
>> +}
>> +
>> +static int geni_i2c_recover_bus(struct i2c_adapter *adap)
>> +{
>> +    struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
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
>> +    /* SDA is high means bus is free */
> What about SCL line ?> +    if (readl_relaxed(gi2c->se.base + 
> SE_GENI_IOS) & RX_DATA_IN) {

Yes. I will add a check for SCL Line as well.

>> +        pm_runtime_put_autosuspend(gi2c->se.dev);
>> +        return 0;
>> +    }
>> +
>> +    ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR);
>> +    if (!ret)
>> +        ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_STOP_ON_BUS);
>> +
>> +    /*
>> +     * Recovery succeeds only once the slave releases SDA, so the bus
>> +     * state is the authority: RX_DATA_IN high means the bus is free,
>> +     * while a clean opcode status with SDA still low is a failed
>> +     * recovery.
>> +     */
>> +    if (readl_relaxed(gi2c->se.base + SE_GENI_IOS) & RX_DATA_IN)
>> +        ret = 0;
>> +    else if (!ret)
>> +        ret = -EBUSY;
>> +
>> +    pm_runtime_put_autosuspend(gi2c->se.dev);
>> +
>> +    return ret;
>> +}
>> +
>>   static int geni_i2c_xfer(struct i2c_adapter *adap,
>>                struct i2c_msg msgs[],
>>                int num)
>> @@ -981,6 +1066,25 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>>       else
>>           ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
>> +    if (!gi2c->gpi_mode &&
>> +        (ret == -EPROTO || ret == -ETIMEDOUT || ret == -EAGAIN)) {
>> +        /*
>> +         * Only attempt recovery if SDA is stuck low. -EPROTO and
>> +         * -ETIMEDOUT indicate bus errors where the target may be
>> +         * holding SDA low. ARB_LOST (-EAGAIN) on a single-controller
>> +         * bus indicates a stuck target, not a real arbitration loss.
>> +         * GPI DMA mode extends this trigger separately.
>> +         */
>> +        if (!(readl_relaxed(gi2c->se.base + SE_GENI_IOS) & 
>> RX_DATA_IN)) {
>> +            int recovery_ret = i2c_recover_bus(adap);
>> +
>> +            if (recovery_ret)
>> +                dev_err(gi2c->se.dev,
>> +                    "bus recovery failed: %d (xfer error: %d)\n",
>> +                    recovery_ret, ret);
>> +        }
> Can we move this to a helper function like 
> "geni_i2c_need_bus_recovery" ?> +    }

Yes. I will add helper function here.
>> +
>>       pm_runtime_put_autosuspend(gi2c->se.dev);
>>       gi2c->cur = NULL;
>>       gi2c->err = 0;
>> @@ -1188,6 +1292,11 @@ static int geni_i2c_probe(struct 
>> platform_device *pdev)
>>       if (ret < 0)
>>           return ret;
>> +    if (!gi2c->gpi_mode) {
>> +        gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
>> +        gi2c->adap.bus_recovery_info = &gi2c->rinfo;
>> +    }
> In geni_i2c_xfer(), geni_i2c_recover_bus() is invoked directly, then why 
> do we need this ?> +

It exposes recovery through the standard I²C core API for any future 
caller, rather than relying on a driver-private direct call. The 
registration tells the I²C core that “this adapter supports recovery. 
call geni_i2c_recover_bus() for it.”

>>       ret = i2c_add_adapter(&gi2c->adap);
>>       if (ret)
>>           return dev_err_probe(dev, ret, "Error adding i2c adapter\n");
>>
> 

