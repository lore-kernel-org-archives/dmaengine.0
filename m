Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705063;
	b=iqu5NDNYavbSKIIOxCn7GHVJLm1uACKh/OrJCWfhLFOc+Q5IFamYaysRICU0Hg5OvJC8
	 kXhF1oU4pJAylyrdn1w9CLjTOBd1hyhlDY30dSc9jFpFDrCuNIJUz/Hd9MNzpLbFE4658
	 f5CGxj56DD8mJdLvZcYik/bVa7ubpREMxbylZGkSyUq0dw8Wwul6v14TED64Cd+YTijIh
	 diDETna02TGbBjVMhZwahJCTtzoVcqLp7Ab6Ben46eGpJl3BzZfm7BnKRCPzUtkCYXRG9
	 xbh0lYaysX0jAavBbPTXPfyoWXx1B9JFYI29p8vlWdVWb19KDvmen6W4kk5CuGCTRyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705063;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8oAkjaXnaFfUyFpwVtYsA1E6QVQ2RETjVoO0Gm7QsyM=;
	b=4yTDYdfj+UP4jm12vLcBnMwKYGpXxHS3asN9rX5BtQ8ImMciGXFGwRFb72uBuTdNhzRm
	 XX1ibW4AKan79GyE4vC4sQn9AlKQEijufZdYVU9CKFfk9OTwBvlRtcE0tClInbll8ikHJ
	 zMqs7ZDJWne3PljZJr98Lo2NgXA1APc7UJn/a7WR6dFhjM7tU7R7F4ekkaR1BoqfrJ5mI
	 Wq9RXzxzzNmiVTo/RGWKrGA0osFFfenOanSvG5Tn909Bm0TlAs0VDwtuw+nG6WuUkbedK
	 jygXmLnJqKoT6vEanCYWXP/IejGIgwlIIP8gl5BPSuTGrHiufkCRKzFS+a6ttC4Fa1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPmaW5ke;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aFB13n1E;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC092606EEBF
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 11:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC092606EEBF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPmaW5ke;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aFB13n1E
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AApES928238
	for <dmaengine@vger.kernel.org>; Tue, 3 Nov 2026 11:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8oAkjaXnaFfUyFpwVtYsA1E6QVQ2RETjVoO0Gm7QsyM=; b=CPmaW5ke1IkeKpYk
	VXbUK5oTUJ5F5O1457dkRyQlMpaMe0BfRafH2gGGbDKEmNs1n0L0rqqN6BZleU5s
	BSi/bJ5Po7151VgvWgojQP7PDpfF6wGD6qmm4YR8BQ+omSCCoyGSu24cyRzlLtWv
	IeeZNjbYQrL/EewqjIt30Q/TvCGRsplw/ZByFjFUHDE6qjhDc/rOIxNcxeOzZY5B
	Cg2ERHssx48UZHCY3XHPwWP7ELYc9glfZUlTE5d5VVbbHzKrCAccWpIT/rv2CgKr
	zMAWfeRWo/sYrbp5rN+0cFv3Wx8F1fgQdNXFBhnhOGadodCmCZmXd/XPPNHnSRgo
	xqa6Jg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07ekfkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 11:24:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so3160794a91.0
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 03:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705061; x=1794309861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8oAkjaXnaFfUyFpwVtYsA1E6QVQ2RETjVoO0Gm7QsyM=;
        b=aFB13n1Ehtpq/w60bI11UFsymdM8pDW+9/8pFxWNiO4bSZeSqGVg4/yxOSfseupm/M
         ZXqh52TIcm/ApZtOrJC8pBZheKJ6Y9LzX0vUjzAj45zi5dvydpXcNkL7X4zqFRmQhUrV
         iuNwq5+OD3wh5Y5etUJ8yXZm8lh51+1XSc4qxkRJS3XKe9PddJmsZZyYbqAlAN1ZuFml
         TfPpxTlq2RVWJ+mWLRfb7v5r07KCqjAlTrqe8n8aBJaeJXsJwsyPvWPUsC0Dr5+HlF3k
         vdj7SxZ1zVPMFW26g2WyWuRLmIDTYoerhj9etkaeLiB7SMwcy1tYackyAcTPJ6yncvSl
         VfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705061; x=1794309861;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8oAkjaXnaFfUyFpwVtYsA1E6QVQ2RETjVoO0Gm7QsyM=;
        b=sphZwwE2rziRQkj3vLbu3pwPD138gjiJqC0Xksmjshf4P1PxIB10jGsNkn4MYR8GdZ
         5izVerBQ1b4DPTZ3+JqWqMVOccO0KgjpZW+1B9nVEmdyJIe8LUyyIWmbOywASs+gF4y1
         tnMyQdTQbynaic3hTTfYvoANlcziMAPWfxOX81R2lpUEI+XNWUCSxhUrbbFPDsi6ok4P
         J932afh1do04KnoJcmASJWo2omR14ZFC4CyAWQyKLK4ctSgfeerMxJ+dPIJe21J1NADK
         3z1OSm1uZzexNMwYXgsGbaSN2VGW+gj97nmv+a9okopxgZypRzXnGthF6Gpr9T5y/PcF
         0bsQ==
X-Forwarded-Encrypted: i=1; AKwUvByyIowJjZ/a2vBnO5tyt2olWUOMTtPfyGld9MTviYRn2T0s80ZOvBjNj825NPKYyItE5err77C2Oys=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AwPnAPfS+ks8UnQDz3jK5r86PBDXMogDXw5Rgw7j2Bcd9KcIp
	iKLZFbRuakuDPsfuprAMzfOjUMHYyTtCxeXXin0+KFo+yJOLVb8VhSoWPjIHvziL9RmjOPov7TO
	dpxE6mN2mvOiwYIhG7wf/Hjiw0cVizgzYJ3gtxYUNf7jYg5HYDxRbvUXBwIHqttU=
X-Gm-Gg: AYBFou3/zv8oTkK5lCM8YIzEiEg2rkifM1wGTGw8W6FmZyv6iJ4njGZBsQs25qxgBtB
	yA7C8N/GVVx2iOhvLivm2eYvvE/TGkoGAYqb6TsTlqt/kxGs9RZnCkz9LxNbshipdy8er+nOk8b
	86Nk2wO7wlcfOeYwVHzzslrh0yW/6IWq1KBLqWkSM+uivf+rrtrvI5IuxYR5YfJj0kbXfhXSdWh
	QXWinjqV4gcjB8ArrCxSdR2LFNqVp5pMSuPAY82WstZNYPXBOOAHgDxUi877d+94rOnr6StoJeD
	PViLCX+OwTU8k+I3rPKGNvigaTL2xHzzZsaPIYULcfzv6cLFg67Ql9FzjCfnEfRITWiE+O1LD//
	dnzlzMilOAREB4l9PvRFhtV7CqO61uddgk5FEH/SrOqVTur4wxMAMEvlUfQ6DJ38HuOOJOrvM1K
	7i7sVHoA==
X-Received: by 2002:a17:90b:4483:b0:3ac:9259:1234 with SMTP id 98e67ed59e1d1-3ae8979ba8emr10442377a91.39.1793705061218;
        Tue, 03 Nov 2026 03:24:21 -0800 (PST)
X-Received: by 2002:a17:90b:4483:b0:3ac:9259:1234 with SMTP id 98e67ed59e1d1-3ae8979ba8emr10442352a91.39.1793705060753;
        Tue, 03 Nov 2026 03:24:20 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8329afsm3974716a91.8.2026.11.03.03.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:24:20 -0800 (PST)
Message-ID: <62363ca8-366b-46d4-9287-674ced93ddfe@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 16:54:15 +0530
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
Subject: Re: [PATCH v4 3/3] i2c: qcom-geni: Add bus recovery support for GPI
 DMA mode
To: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-0-59b3ce96dc4b@oss.qualcomm.com>
 <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-3-59b3ce96dc4b@oss.qualcomm.com>
 <2ed54730-75bf-4368-9391-5452d0a31fa9@oss.qualcomm.com>
 <c96a6c5e-45d8-47ba-83df-d956bd2e06fc@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <c96a6c5e-45d8-47ba-83df-d956bd2e06fc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX/BaKYCGnIpU0
 tcMAPXwvL37n5skAnTNn0To2AZEMGE/bXPKHLTpCcv3v6adyaC2BPUBBSl4AaAs0qCzgmnBglwi
 lROoWQWx36QAjTC5nKtzGGFt9tmdXfLRIXsJhuxmsnx44XM9RBJnStEGQq3Hv4ahtYN5UUaOFqa
 WWl5dmDIR0GKo8PbgqIp9pgbF20G6Opz+xdUiwIhw1JGxJ2BfakpQdxOze0Q5GwxUBhJoG5XQhi
 dDxyvblh/PPQThNALGadB1QQunfedMYgPhzITrzzE9p7bZbAPdO2BElOJOqrEWyDdsC3WhRuRb0
 J0tvsYDho1XlrLDAUrRrdDDsB6MfQ+6W80mF2dbv9JJjMZTA8DTJT9nyFxSmn4yrhL/3TU9HjBb
 Q+P7HxfdKaOKao/redI0kEo//2JbBqVe83OndrAnou2cKtYjQ+kp1EH+pC6sGqcGBB258/iBEwP
 zdha+NdxnKUkNOJ1fvQ==
X-Proofpoint-ORIG-GUID: O5sjSx9LnfAnuphHRFkGhWJ_64UBC01H
X-Proofpoint-GUID: O5sjSx9LnfAnuphHRFkGhWJ_64UBC01H
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae9c466 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ymETMnJNZYboT2KzijcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX9EA7RptJYbGR
 zj8chYTHJQWI97F7z3fWLvuRAp3r8wtboLpmM/LQzNOCunvT2NrOgEIuZqtDGNdiuo7KhKLjdj5
 CGeot+O7SIaUfRMqEp1Qjv+Kcti+YuI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030045



On 11/3/2026 4:46 PM, Aniket RANDIVE wrote:
> 
> 
> On 11/3/2026 4:14 PM, Mukesh Savaliya wrote:
>>
>>
>> On 11/3/2026 2:26 PM, Aniket Randive wrote:
>>> I2C transfers in GPI DMA mode can fail with -EIO when a target holds
>>> SDA low, leaving the bus stuck and preventing subsequent transactions.
>>> The GPI completion callback reports a NACK and a genuine bus error
>>> alike as -EIO, and the existing recovery path switches the SE to FIFO
>>> mode which is not valid in GPI DMA mode.
>>>
>>> Add bus recovery support using the I2C_BUS_CLEAR and I2C_STOP_ON_BUS
>>> opcodes issued via the GPI TX DMA channel. Guard the -EIO recovery
>>> trigger with a SE_GENI_IOS I2C_BUS_FREE check to skip recovery when both
>>> SDA and SCL are already released. Extend the recovery callback to 
>>> dispatch
>>> through the GPI DMA path when gi2c->gpi_mode is set.
>>>
>>> Use the adapter timeout for GPI recovery commands, and preserve the DMA
>>> configuration error code when GPI setup fails.
>>>
>>> Stop recovery on a GPI command timeout and report DMA termination
>>> failures. Do not issue another command or override the timeout with a
>>> bus-idle result, since DMA cleanup may not have completed successfully.
>>>
>>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>>> ---
>>>   drivers/i2c/busses/i2c-qcom-geni.c | 107 ++++++++++++++++++++++++++ 
>>> + +++++-----
>>>   1 file changed, 94 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/ 
>>> i2c-qcom-geni.c
>>
>> [...]
>>
>>> @@ -1356,10 +1439,8 @@ static int geni_i2c_probe(struct 
>>> platform_device *pdev)
>>>       if (ret < 0)
>>>           return ret;
>>> -    if (!gi2c->gpi_mode) {
>>> -        gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
>>> -        gi2c->adap.bus_recovery_info = &gi2c->rinfo;
>>> -    }
>>> +    gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
>>> +    gi2c->adap.bus_recovery_info = &gi2c->rinfo;
>>
>> I guess one more time this. Why patch 2 is adding and patch 3 is 
>> removing the change ? keep it clean way.
> 
> This is intentional. In patch 2, bus recovery is supported only in FIFO 
> mode, so we guard the registration with !gi2c->gpi_mode. Patch 3 adds 
> the corresponding bus recovery support for GPI mode, after which the 
> mode check is no longer needed and is removed.
> 

You are right, i saw that as complete logical block removal.
>>>       ret = i2c_add_adapter(&gi2c->adap);
>>>       if (ret) {
>>>
>>
> 

