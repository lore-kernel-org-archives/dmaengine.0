Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690521;
	b=EcaqIUqOC9aQR+CMX4WIhOuVuF0uRfzIB48Etl7Sq2iOIp1yNxUPnsiHJPvbnT9DzKlB
	 3+QKEH57Noa63GWpruyqk58J/nJrEaw6k7C3WfFPRZnUkx8WiHFtfbiuyYIXOWXQjdZws
	 /IA+7WN5te8wowadRPLiCns3mf4S2Qg/VD9if17P/VfDoolcqClNQ2Mj/Q+GhB+/XJS7o
	 9GOF9MDDowPlBNA7uLql9BzXJhyjsdAv8/AMBlMAvWB6GolFIyQNoqc3Z4DHlENbpB2+L
	 5WcE1WEZWvNwzRH7yL8X3Obw9LrtBW06Dw+yRuNUHPq6nHMPwAEhi1Sl77O3nqV5y4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oNOQHJMVvx6lR/9lQldFO/azLOgEmsHBjYrpgr2OldY=;
	b=Z5LIEj48VrDT7sEfJNU7KC+gXZ5YFObpjuF6tJq/z6pSSuvudTeQaZc2DP7hi9PnownJ
	 KiWoXWscfFEb8M82sr3Zy3z94QBKwzD1LhwlYu2Az03hyEoQVska/AjgQEw2L+R8rLFXX
	 0FCnWDYAOKSY53uXSYg3Qi7IyonPvVaq7OJohTAAPEmqNPgieNStSLVxAC0cQ1texr1lq
	 cLgBcYppbF7J5dSg+6/kYM7rmUhzsIajpN7l/9IfXsoaYPuIsgApluVZ/sfsw7/EzMHFV
	 TR13HvIDK8G2pXe88pGKgiXDbIkuus6HaaRjLzHnUIJPXbA8EGzYHoYQVeQ+4nPPXTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ezMF53wN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BGtTIaBI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0F1606A32C
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 07:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD0F1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ezMF53wN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BGtTIaBI
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31eK35470776
	for <dmaengine@vger.kernel.org>; Tue, 3 Nov 2026 07:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oNOQHJMVvx6lR/9lQldFO/azLOgEmsHBjYrpgr2OldY=; b=ezMF53wNN1hAlzpQ
	zPBeT7TC/xSZHNmjdsSl2GQ6BmRxXFvF3LseH/sFoC3xmeQqk/6NIN1TekJ4maEL
	KS788+hJBxvPILfskRTPGdZNmGuZ/KG8/5nB6EOj/VyBqQsqv6Vq47Dd5KkBPw6J
	RyyvbT9ow8iG0IElFc+hEonEiK9JZDRMZnZpxb/5mqfLLhP+FlGE0Psp51EGg05x
	9llxfvRzhZDSStQFRFcM1hFbbSTKEiF5xn1IyDsl81n/9c83XJneypRyZxizAylD
	eQk5XEj96drXanlrr/bl0u/Kmdk0z+1MU8SSMHr0nmEKEh3Xsw7jgrag5sF7FVjv
	2Bzhyw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081tg4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 07:21:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad840053c7so3028932a91.1
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 23:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793690519; x=1794295319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oNOQHJMVvx6lR/9lQldFO/azLOgEmsHBjYrpgr2OldY=;
        b=BGtTIaBIMrrKnFSxyT/4pFlXPo/SdPLLEMgB+zfOxCcp+KH1PDewGJhYGrZCybwz6Q
         KAIZTGGGgzJQmxjJQc0BMwYbfey1e7zdqA1vyR2nuNrAHwkWZDVG6NwuuZv4HryuNPao
         Xz2bqjEwD3eWALRv6JavURbxtGjxLm+BkFP3sF/79xOh2tf4KrSxjrB5Y5G1Lyfq9xUR
         4a5IboolIfp2BQrGugwpw/iNnznq3XiJd/6U7xWoPkkyC+YwmXQbLGZYbSNcQhYJJFG9
         WDDI1CLFmpm6ExoYae0gp4z9Wd4cmRaStotTYk/wyXRyEjJlPOk1HzrkCJF/rxHWrZqn
         2b0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690519; x=1794295319;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oNOQHJMVvx6lR/9lQldFO/azLOgEmsHBjYrpgr2OldY=;
        b=ns/KzZTnrohdY489KKQTqCIcLIozZaHXZMoCtUkO0Mqky6S3AUyiJFdRD3KPQeTTil
         6dBkKLqCCFAf/CP9RWPMmN0FLiPpw9Y2I3VIordWcd6eZ0pdEVzGCypsAgmF7E46zMr+
         SBRHcge911YguxCu1PXaDdASiiw/bXOeravfiE3vw5cF5cFwwsmt7FSdkdGhzCWhJsNT
         zfVf7KKAt8xoJ23arKyJq8qvhKkVlJlj9raXZs3i6U4ol4dBULjdwmnuiJdJEX/y8kva
         08bcUeJkVOCvgNE65DmcpDxOuiAjjH04P2J7TlFAEDUUZ5t6MhBCm137/9lEQ69Wj2Im
         3igA==
X-Forwarded-Encrypted: i=1; AKwUvBwotFOb/rUE0+eWQPIo0Ng5BOM3Gu8T/QTeuwDqdxZdsxhwEQO0Yvu82D9ZWXr5YmYDVRiIedNFMCk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pVUsCLX1IQ+HnNm78PcLMStxar85mfHtzCBEycGHVXjFog5Gu
	08rJZX78w1n8z4QgZ03Dgl0rWLdaL1KWHyRWvk4QVnQqxL+HR/NKrLVQsbQfEiWnRoj3VE7iX3b
	E59mlS49Y21rlk9mqKoka/fpexQ+ZeX6E03+uTLlPAYg0WOzdlzCbeYVDnH6eo5c=
X-Gm-Gg: AYBFou0th1ryUzcmG25CPwhFZ1t+yP07bwTAOIXBY6TiypyKc6bpdGzXlPFpnys7KCm
	IMfSz/maMb2GHXSnStPxqbbO3ptE7o3is97o505YrDhosXCw6ntgm44PYTxK0+HU6penByPyTKG
	F37NQtbFOXZPpOB5afpyxjkQNxrhRw5Yie4Hpre9uxGwrfbfvbJ5rRCGMgi0lKeecPoyUvmGPFo
	6npJ1jFYXbad40xo2ffNOzTTlXS7mwB2UmDFAAXKLcQrKSmMRLu9EXSohm8s0kJtl1Aa6+wz1Ly
	ds09W4Zqp4NxpousqHgn/23FW7st+3dWWJbzOMqw2HBdopYJ4mWU+dKtkR+GiiWoagYY3j2ap+T
	hAnOUM959grzEElNtc4Dif6Q6FNx6Q78bcB3Nhf+XdcBidEErV2fYGllJHQD+FyLuJHNsSfNmTi
	YzPlU=
X-Received: by 2002:a17:90a:c2cc:b0:3a8:f70f:2437 with SMTP id 98e67ed59e1d1-3ae8980bd04mr8855432a91.50.1793690519192;
        Mon, 02 Nov 2026 23:21:59 -0800 (PST)
X-Received: by 2002:a17:90a:c2cc:b0:3a8:f70f:2437 with SMTP id 98e67ed59e1d1-3ae8980bd04mr8855410a91.50.1793690518518;
        Mon, 02 Nov 2026 23:21:58 -0800 (PST)
Received: from [10.217.218.73] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c666cdcsm2799014a91.11.2026.11.02.23.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:21:57 -0800 (PST)
Message-ID: <cb63c8ad-abf2-41f3-a2c2-0b21196fe46e@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:51:52 +0530
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
Subject: Re: [PATCH v3 1/3] dmaengine: qcom: gpi: Add I2C bus recovery opcode
 support
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-0-7f2a6e572de9@oss.qualcomm.com>
 <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-1-7f2a6e572de9@oss.qualcomm.com>
 <197ed473-d259-4f1f-ace0-ce98ac0fd127@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <197ed473-d259-4f1f-ace0-ce98ac0fd127@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyOSBTYWx0ZWRfX0dW3Md002Mpo
 8vJZoTP0awNWK5VsyB882p0Vs4+hxdSrqCtKnNSH8yV+GQV5ZtUcTeU/iPXs1C6E+8q88OZNtft
 7FjoG3BTNmX9ZOzLizcbCGP5IDXUZeM=
X-Proofpoint-ORIG-GUID: d7ozMgoSo4UyNoxL9dNvE1ZcMi0fMRoA
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae98b97 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Dft2pwwzc1VQXl6WdfMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: d7ozMgoSo4UyNoxL9dNvE1ZcMi0fMRoA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyOSBTYWx0ZWRfX/BbAqaur6ASC
 9cFSKs5/rtA4w3po+jSd+5cZnncCYE7H1Nk4ilfFuhwDQacP6e3/BmIwIFaZneKLntXe/j2DvZq
 fiB2QptklWvPhK+0thPERi31ehPNvC3XUpymiXJCemXaAz0sDebOeifaB3Sv7lgiqZLvjuz4O3o
 XFQSUwTDkeUwBo6AqV4B11KiluBnhWhhGpVZ9jUR+T9/I+yswGXh7QPEjLZloCoU/buAsgKBv0a
 SFgvYtrNUGJC7dfplCtaIQMKKraeDsxnnayFIhdTAseuFtiGISpc8axWNtn4D4A1BWtP0pB5gi2
 9OBnZcKvsW2YEYkCy08/fbUIxlBYEEs+JdFMVC7Bjd7QNwe5psgfVAfhrZtih7+xYilewS/9Hzk
 m8s4eYP7VW1+bMaDjrOMWFZ+cIYgv2aXkclbMpbvICc6pcK3H2CiyK/Qn0g5f79wCXlWhsEFJGh
 HU/r+sHUb0UBhy5NqSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030029



On 10/27/2026 7:04 PM, Mukesh Savaliya wrote:
> 
> 
> On 10/27/2026 10:43 AM, Aniket Randive wrote:
> [...]
>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
>> index c41bfac65ddf..394e7287f6e9 100644
>> --- a/drivers/dma/qcom/gpi.c
>> +++ b/drivers/dma/qcom/gpi.c
> 
> [...]
> 
>> @@ -1692,6 +1709,7 @@ static int gpi_create_i2c_tre(struct gchan 
>> *chan, struct gpi_desc *desc,
>>               tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
>>       }
>> +log_tre:
>>       for (i = 0; i < tre_idx; i++)
>>           dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
>>               desc->tre[i].dword[1], desc->tre[i].dword[2], desc- 
>> >tre[i].dword[3]);
>> @@ -1825,6 +1843,18 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct 
>> scatterlist *sgl,
>>           nr_tre = 2;
>>       if (direction == DMA_DEV_TO_MEM) /* rx */
>>           nr_tre = 1;
>> +    /*
>> +     * Recovery opcodes do not require DMA data TREs, only CONFIG
>> +     * (for set_config) and GO TREs. Since gpi_prep_slave_sg() is
>> +     * shared with SPI, verify the channel is I2C before accessing
>> +     * the configuration data.
> I think i have mentioned earlier also. gpi_prep_slave_sg() Not only 
> shared with spi but rather say, is a common function for all protocols.> 
> +     */

Currently, the GPI driver has only I2C and SPI clients, so I mentioned 
SPI specifically. However, UART may also use GSI mode in the future. 
I’ll update the comment to state that gpi_prep_slave_sg() is common to 
all protocols.

>> +    if (gchan->protocol == QCOM_GPI_I2C) {
>> +        struct gpi_i2c_config *i2c = gchan->config;
>> +
>> +        if (i2c->op == I2C_BUS_CLEAR || i2c->op == I2C_STOP_ON_BUS)
>> +            nr_tre = set_config ? 2 : 1;
>> +    }
>>       /* calculate # of elements required & available */
>>       nr = gpi_ring_num_elements_avail(ch_ring);
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/ 
>> i2c-qcom-geni.c
> [...]

