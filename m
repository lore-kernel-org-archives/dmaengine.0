Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926346;
	b=mj3M3O1hhD5jfafBZKTx6DDd4cUZXHrGZGx4hmE7PoWgHyhkJjcTNh4biksD8qMSUhRc
	 0D9tgXnw87LZ2g9wj5kaYAGmKYcfHJ8wCqNQaOxndEHaWHLKu+rMMHLCzRCOnGSz5xRhl
	 pOibG/9O83yvffAMxgCfkYUItwrWUtmssltVW5aUOjHFwkw7Aj7jiWcSQqrdpJUoP6/WI
	 fLMDNDyrRyz/PHsXoJBrloZflb/ZXyW4VhrVtxwbZWyxe2XpvwwF3bWNkW5mPgvE9Miyc
	 U08UsS9Yhd+z1ATrXV/6aDBr2mD16BFjkFV9PNauh63T8nRoGr1OMPbJMXsVej15Wkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926346;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J/4vLvyNqeORXrBPoXGUzzn2IETQe9KRQ40Tt84ca5g=;
	b=r7d4IChRWRNbucEElPR1ROwgn07JiHTK+fr7vYK3DmX2rxgJ+bBSb+Anj/NyejGufJyD
	 +ZgxChA/vOhoeRldpeLFgzUPqWnEha2ziBFYSILjznFCInJw2VsR5Wj7JU0cARU00DVVP
	 vqP3p7Gv3t/gwYOPenIXVRPJBHNQIa9iNpgkUKCAMIHqFScuP42ICXmdYnr8sOmWug2fl
	 oyxyS64gqfN6PaB4JPhSnspHcRBwY88cKy796sZafgQneH7/uFdoFMOTaGdoKj2+1dOpF
	 t/sJMNA5Wi9iVT7Bi6YgNmObhW0tzkpDobnnsAqQ1jXEWZX2FFjT7e98SZHvf24z+AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RaZdnNrX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=buCILIDQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D17606AB95
	for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 14:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D17606AB95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RaZdnNrX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=buCILIDQ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1NNM541779
	for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 14:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J/4vLvyNqeORXrBPoXGUzzn2IETQe9KRQ40Tt84ca5g=; b=RaZdnNrXIXuujHIL
	b9gDY6DkKpfcXz3+RtJMNcSG2CBbjvyZvwfuE3SPA1MzNtWuWLPkv0xOk3corQGb
	9hnsSeU//oJ8Xfddv4H2/ry7020h+5yagaaVpQpSz7oxja90XPUrw1XDo/8PBigI
	CALjD9jco/hHbq+V9D9XRgpEh5T2P6iWO+x71wV/QuYtotFLUcispWkEaAg0pAqU
	7hmUtvgFJJtB/jnoLUIArmuG01TjjmN1fdT2x3Ak/n/0OvWhffI4K5jOktBNlKu8
	PPDe1XT16GpXB9ydVlfUIORhu1hKDnkSYLosgk+VlfZG4A3AUDfcz0iY11Kt/oO+
	py7HgA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd1x12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 14:39:04 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2c415bb8fso526574137.0
        for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 06:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794926343; x=1795531143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/4vLvyNqeORXrBPoXGUzzn2IETQe9KRQ40Tt84ca5g=;
        b=buCILIDQjb8/IScDUrYkvt9I59Ef1Dm86YhzIZOKuDbiWLwGLWnRuZiNBGOYE9evkk
         OQXhyG0g0BylSyzsV8qGnO0UHrs6HMYEBIXwqb6ra/t0AQt5FFH1PS1jSp84kSvrR1DM
         72xauloHPpO0rlxNKl13YfkqYoAzu6rS1zJGn+rjtrFyew8rYBeQOTh5dKS72fBqFGPD
         quP3bM0rPltqXo1B37qqbRyEjhnAlcj93I1apABeYAFGSaKnI7t9Zt9GvnEXrFbC2psn
         srPN6mkE+iCKg4ap/kY6bqrVrJBt4vGSaCrGDH9PxOS8lJ0e6cIOtzbcHIXyUdNQ+hLK
         Y1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926343; x=1795531143;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/4vLvyNqeORXrBPoXGUzzn2IETQe9KRQ40Tt84ca5g=;
        b=EpUEuCrsszaRVHIjQtiDQFT6i44ID3RQlXRxe5Yki2QC16IM59bNzujhAs+OB7vsT9
         CB4A2lmIyMYfMjKwXTlo8h3CviZMdCYTHxqH4ynsRkAeYnRW0NGtfxH4YmPVlFGXxAqO
         zHJ53KmFfrFC3dFbQH2USAAfOA0FCDEtPQVveHthl6163jpHzxkuzDS3AKQLo4XwX4Yw
         mbTurqagplBzVlp8enPHn3nC6LFsIoKcj/WRKE5GtrWHHOO5wIpofqbCPkC3wf0cBZBi
         EylBUCku0ajLqeLlLxb18tPCrv09aIGonkKtOz/FqG103okNe6a/4ekea03vlyPup6iS
         t+OQ==
X-Forwarded-Encrypted: i=1; AL+hErH5dMbs7bl6svFehZ9k8/wIm1wcJzstBBh04RXZoCJbsmQd63b/8zMBGW9nXNcok8jwBnho6cy1XII=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aLOaac1+F/ADBNyE1EpdQI2mLmO3F5HA1V+OY+L3IyQPJ9Kl6
	4XtYHyhPBCbi8HCSfaveN6bpvpyWwxSP1DE/V2al6JNg1cxcUs6wGemf4k7rNVjKSyAaz2nqYRq
	6rsM6+3Xy94Uc3dlLDwqVCOuyb0VkxS6yAXDyVslojCCaD4LYkmUXMXFhhFfxf2nAq7yg3wI=
X-Gm-Gg: AYBFou36MvE+3szhGI/Z/3mx/G5RcIGL/GVGZ4fpoKmywhz+ntnDSzIjl+tdHHcTVDQ
	saSXjW6WTxhOlEtB2TInjKd4AjC7O3/6CQzvcSa0JhN0wgmxibb9hR0p+fZ7GpZyySu9CWiiJny
	GgLVxHvGVoXf2VLmeesV/+Fgb3Kb5GF+WKeBUKFHA7vU2U1qgkKlYKOfZvv/75X2A/cn0SZRjGU
	MrHTCUsxHyxklHk6S1P1tVojdp6EQAujVf2yiRzl9ah/iwT9JfLw0m0sgE7QGwAbJ+Z9cFPg+Kk
	ayvzbvH7510kToesXul8VLkl+8zNxl7bGLY9Fyz6Ud0BM03ffxn96lM5M7RIVcY37tgyto75nui
	QDGevLiHvSOW6XO3obST9qNKyifEMftdQl+hATE1pvLWqomHCpAIC9uZL//BKaDOD4JWkaC2b1b
	HGi4Tc
X-Received: by 2002:a05:6102:6050:b0:7d6:48c4:ed56 with SMTP id ada2fe7eead31-7d64d69dbf2mr3523229137.6.1794926343430;
        Tue, 17 Nov 2026 06:39:03 -0800 (PST)
X-Received: by 2002:a05:6102:6050:b0:7d6:48c4:ed56 with SMTP id ada2fe7eead31-7d64d69dbf2mr3523224137.6.1794926342900;
        Tue, 17 Nov 2026 06:39:02 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d69e02d340sm2636416137.8.2026.11.17.06.38.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 06:39:02 -0800 (PST)
Message-ID: <d55bbf0a-3556-420f-852d-7a15ed8d5aac@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 20:08:54 +0530
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
Subject: Re: [PATCH 2/6] dt-bindings: dma: qcom-gpi: Add QSPI protocol
 identifier
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-2-21f43042dd60@oss.qualcomm.com>
 <20261109-wandering-miraculous-mamba-0cf21a@quoll>
 <2fc8f7ea-651e-466e-9346-c47e0a38c5bb@oss.qualcomm.com>
 <20261111-daring-salamander-from-tartarus-4c72bd@quoll>
 <c9427a03-8b45-4e35-a29d-7ebe30f07ed7@oss.qualcomm.com>
 <5b6e4031-4c52-4b67-82c2-0033d13b15d6@kernel.org>
 <0d4fa5af-e406-4761-aa58-534c3c6a043a@oss.qualcomm.com>
 <4c3bf92c-2434-46e8-8a3a-ab34cc50c72d@kernel.org>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <4c3bf92c-2434-46e8-8a3a-ab34cc50c72d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc6708 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=fQRhRBuJyxsiCmdI730A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1OCBTYWx0ZWRfX/AIQnNe4faLP
 NOYDw4G16FhtuaPunh2VEQTl90mId0+F3XRpq3OQ9IYnWJdijqVUGjxNLipG/dvcRGKApNqmKzd
 lhEg7pjGFsDIHkTm7YSWHVhp0Bpsofw=
X-Proofpoint-GUID: PdxoacVNnk1Vh_LgyV5o-XwFsoF70oOW
X-Proofpoint-ORIG-GUID: PdxoacVNnk1Vh_LgyV5o-XwFsoF70oOW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1OCBTYWx0ZWRfXwNRxfNvoMFxJ
 Gyb77pgahn/q+B4hRJG9vIwe/qTmEvVadxcEUmYuS7FqMF15b1C8Lb9d3jB5PTCfl/fx+izAjzM
 IYCWLLfYOVlg1ZIOksVpdPqAHKZ1tV9/MdhFvx4tzt8+/+C+wkE/Omr+xuN6gMTirbKEdq4vgQv
 UDvVoHQ3jLCvP0kO08WouaS9nSqnMApmNb+fjRi0zbNDrvZpEpyKUFJu25+6JZ9mOkosWJW7fA7
 Q9IOegYWzSL+vDDNRg6vV2qg8wqRk3muMfr/BDCq/ChvNWBRZvUnm+B73Dr/AAqV4/7UUOfnrc9
 XpRSig/DuhB1Up5KQt57RyMjAe5Lh5X8qsB/D+W6W3mV10qHTldwAUktNJIhFgJ8EKQ6Y1o/ABz
 IiOB2tH8FVwPkY88izliqgHsYoeSXACHXUIqpA6jIuXq7mEpqW7V4XsF9Ev9pQ3tUyTrAzcqWUu
 lFfTDn9GLcX+77Wvg/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170058



On 11/16/2026 6:56 PM, Krzysztof Kozlowski wrote:
> On 16/11/2026 11:36, Jyothi Kumar Seerapu wrote:
>>
>>
>> On 11/12/2026 7:27 PM, Krzysztof Kozlowski wrote:
>>> On 12/11/2026 14:47, Jyothi Kumar Seerapu wrote:
>>>>
>>>>
>>>> On 11/11/2026 6:07 PM, Krzysztof Kozlowski wrote:
>>>>> On Mon, Nov 09, 2026 at 08:03:29PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>>
>>>>>>
>>>>>> On 11/9/2026 7:12 PM, Krzysztof Kozlowski wrote:
>>>>>>> On Fri, Nov 06, 2026 at 08:31:20PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>>>> Add QCOM_GPI_QSPI to identify QSPI (Quad SPI) channels in GPI DMA
>>>>>>>> specifiers. Its value, 9, matches the GENI serial engine firmware
>>>>>>>> protocol ID for QSPI.
>>>>>>>
>>>>>>> What is GENI serial engine firmware? How does the Linux rely on it that
>>>>>>> we add bindings for it?
>>>>>>
>>>>>> Hi Krzysztof,
>>>>>> GENI firmware runs on the serial engine’s programmable sequencers and
>>>>>> implements protocols such as SPI and QSPI. Linux configures the engine and
>>>>>> submits transfers to it.
>>>>>> The existing GPI DMA specifier includes a client protocol ID. Linux programs
>>>>>> this ID into the DMA channel and selects the corresponding descriptor
>>>>>> format. QCOM_GPI_QSPI adds the QSPI protocol encoding 9 to that interface.
>>>>>> I will clarify this in the commit description in V2.
>>>>>
>>>>> Does not really answer. I see no reason why GENI firmware needs ABI for
>>>>> Linux.
>>>>>
>>>> This extends the existing GPI DMA binding, not a GENI firmware ABI.
>>>
>>> OK, so it is not ABI for the firmware. Period. Let's stop discussing this.
>>>
>>>>
>>>> The third argument of the DMA specifier in the dmas property selects
>>>> the peripheral protocol. The GPI driver programs this value into the
>>>
>>> Yes, so the third argument can be value of 6 because it has no meaning
>>> for the firmware.
>>>
>>> Again, follow standard DT bindings ABI rules, you don't get an exception.
>>
>> The existing GPI DMA driver and binding uses its third cell to identify
>> the client protocol. The driver takes that value from DT and programs it
>> directly into the channel's SCRATCH_0 protocol field.
> 
> So register value? Not a binding...
> 
>> Its mandatory to maintain protocol ID-9 for QSPI.
> 
> How can it be mandatory if we did not define in the bindings so far...
> 
Hi Krzysztof,

Existing SPI, UART and I2C use the same number for the DT identifier
and hardware encoding. gpi_of_dma_xlate() stores the third DMA
argument in gchan->protocol, and gpi_alloc_chan() writes it directly
into SCRATCH_0 without translation.

Neither 6 nor 9 has been defined in the upstream binding yet.
Would it be acceptable to follow the existing SPI, UART and I2C
approach and use 9 for both the DT identifier and hardware encoding?
Or should I use 6 for QCOM_GPI_QSPI and explicitly translate it to
hardware protocol ID 9 when programming SCRATCH_0?

Regards,
JyothiKumar

>>
>> Other protocol IDs which are not part of upstream are for AFC (6), SPMI
>> (7), HID_QSPI (8).
> 
> 
> 
> Best regards,
> Krzysztof

