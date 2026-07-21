Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25CF27E1DC
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 11:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784632324; cv=none; b=XNunm+gwSZ1mW5aqebTxh2WP51cHvRE6OkpChZLGE1Yz6x8q6DpFpGybv5rhSXlJG6LmgCOFDtD/X3hvvTRYh1p8iJXF1CyvNEP00fBOXTwN748ttx0qKQzfwaoQUKsOHV8ys+GkSfJiUISFuEkCJbjq4o0isNPu0iZl+w5DxhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784632324; c=relaxed/simple;
	bh=Yatm9ZxnOj/ym6CjLLtiZlAqlYcNBFpdb3IRAxm4+Mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i2vMsPsl9Y45Wge5lSEFEx3ZyigNkAlIqj/OZajl6lHoUrSqTOTSngo5eqoxvuO/1KEfk5Ty7iU1B61hkYiplnvvX8EOaJjVj494f4s9xs7fnlr0QFnYNVO3DGiS24vhGC8HabtI5zK7lZ0Iyj71JjWzN/Hd0/AfZBCxMy0CbdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnhOE2cj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MgTo4g5z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnhOE2cj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MgTo4g5z"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARACX2503041
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 11:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qlTRXKprfy8H5Qp0s1PDGixTI63RzoUst5XmEPyz0Fk=; b=JnhOE2cjuVkrNNV9
	bT7H5zhtfoPr2dwS8x4fOLarH6mUm7Ve5wTexfIoayC0J696pD4ex6Be7TeobJWl
	0dw8T2CUaCMx06yS2lcY2gwevJB0ly3ORehZFUyZPKTtskjtvEGDxYgEzZrrcoSO
	itEvpzR4Xw/71OANgCJWN45TKiKH+LaYTX2A2jc0i+7cXUclWeuGMBX3jT5ZYYrb
	d7Gl29raXd/sLzs0v8ICMpXFwi4P5GX7osoVuMfpjQm8RVqblqLHEo7TyvRAr6bl
	4gVnFjTzEizADurp8JPNjp6rI+NIBLm5oA33dxMWd6OtlnZgGzZ99U5QiUBvNoa0
	ebnJxQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nsr8wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 11:12:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so17066358a12.3
        for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 04:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784632321; x=1785237121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qlTRXKprfy8H5Qp0s1PDGixTI63RzoUst5XmEPyz0Fk=;
        b=MgTo4g5zdPtim0RcGxTCD6NJwwVmZi+wDyTHGL8856nLY9voznJZGhSYuU+G0/ZX3L
         kTknJ+W7EFT9UrPo36sCn4KMra/nuTB2o9psFP5qr/baGvHkofKy0kpprm6xb/oGpDjC
         3oTno5WPlV8Tk2vV7L+0vvlgi41vE7Dx4umXVbJLTESt/QM7MBXzQMpwB3iZ9LXfFz8H
         1QaSCd0uESTaZOq5jgg+N1nIZumUTN0usbRIjBMBCM6eZYfXU7bYMrVnn7XlhKRkk0yf
         14s0ppTwbsuKW4V9mEsSIEmoSMwxsInegYwXi0RvVMW4U7eLZAW8Ekv63X5MLn0a7YJO
         FUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784632321; x=1785237121;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qlTRXKprfy8H5Qp0s1PDGixTI63RzoUst5XmEPyz0Fk=;
        b=RTQ3EukIeDQY58+Z8JxJ1lChgfz306YStuisMGNVUH0cR1WNSIfVyGSMC67X4zKygS
         6u1BneNeG+srbwX/N/SgohVTfBAkGp6z7GmNoq/ap5jVhh3Xo6Xqsl/1fKwTKCcFXn7M
         KJVi5IhfdRrFxf0S5diw5MrStkVnNanf4PffXk77lOh2mvzSmgNBIt8I4GyOZ96V/ZSq
         2ukZgXRP3MfKkLAuUKY0QLg0cDrFxQ+kzocUkMjCiZKdAwSRPFVhAeqV0WTtQQzQrH7g
         x6hVb1Xl/Sa0FBd66jHPllv/ErUFS/zfvyggBzJEBCqTLH6Jl7hjcqCMYoPEEndsiwRw
         20UA==
X-Forwarded-Encrypted: i=1; AHgh+RoRFPdstN0KtYEmFPjHvOQdtaFVV51qW/CSNFNb2okNSwe4ejqXqZGxwjWGeDdq6UAlY9oiWfooRsc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1QQtoH/+bcvVQ79W6YcFpN31k4i5o+SPwR4btcq/XxxIrxvIv
	Qakea716t+7brlnKOBaCBWhGjhoyhYo6VpgGwnjUdvMRCTcOZidzQQGVkJv7sFhG9xUQa6JiqWP
	px4WqsNAe1UJnH0kUMNzRdH5il6fCSXY71LjX35H78TOwpzE+58P658fdxox7aU8=
X-Gm-Gg: AfdE7cmRhXt9f/IkeJdv/8T5ZCYDVYJ2rEl6jAnmfrytr3EejX92S7+j7UiCaIs1xaC
	oRH2GsOShqTU5J/HrRVfbJqTtK9njKEmvaC4A+YCUnZEmQjmzbdB9dNMjXnjTCldxClDhP9PoEf
	hRzrgHGD8jjTvBR3uiptiy/T6X/gUAza+D6XjNE6p4NlVibpj7n2P75gyvNKZsqrak895q0oK3Y
	fvEzCkXWy7i5xrf599LWP4ss+FPpJeoq4FbXhdAp+L0xIpba1peHXWBXZ5LToekxTHJIAQ1t5o9
	FvmQEtZz3Vpt1qNVPRRIv8mGqIDTII2hIRwX0YVGY7iEiinrNVYIHJDkilA9oZQof3xcYABXdZ6
	Q7m0I7GDiPk2tLWHfFWPxdMuxLgLRyOKN2hmpC97WzSki
X-Received: by 2002:a05:6a20:310a:b0:3bf:6c08:fb88 with SMTP id adf61e73a8af0-3c3ad9bb494mr12815162637.56.1784632321131;
        Tue, 21 Jul 2026 04:12:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:310a:b0:3bf:6c08:fb88 with SMTP id adf61e73a8af0-3c3ad9bb494mr12815141637.56.1784632320698;
        Tue, 21 Jul 2026 04:12:00 -0700 (PDT)
Received: from [10.81.89.22] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de21asm47287844eec.23.2026.07.21.04.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 04:12:00 -0700 (PDT)
Message-ID: <94b10cea-7541-43e7-bdca-ab79e5729d55@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 04:11:59 -0700
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: qcom: gpi: Fix SE ID and SE Protocol fields
 widths in SCRATCH_0
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        bjorn.andersson@oss.qualcomm.com
Cc: praveen.talari@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com
References: <20260720-fix_se_id_and_se_protocol_fields-v1-1-e41dbb107d97@oss.qualcomm.com>
 <34b0bb3b-d756-4cd6-806d-75b1124f4397@oss.qualcomm.com>
Content-Language: en-US
From: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>
In-Reply-To: <34b0bb3b-d756-4cd6-806d-75b1124f4397@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: J3_LVYG64-q0hsmeFlUFJOfaKZunDDYB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDExOCBTYWx0ZWRfX77uEBATRxNVZ
 VOkHIOb1NLOvMTg2tcyMd/gISCkqnW7TIRU4Ca5TQUOufIfRfzlwhRroI+o61bvEdbuVesJ8THb
 DpySI4PIpVB6lHw+0XH/HlZi2GfcrXA=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5f5401 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-nvh27Yv-2H1FMEgutIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: J3_LVYG64-q0hsmeFlUFJOfaKZunDDYB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDExOCBTYWx0ZWRfX9A0dhtDJyVzU
 PSFDWvyqVX4SVWFhEo3XSc6D8zkzGWNtJFaVQnegDYKsoP8p9T3TaMYu2bGr73JCUYw0noYRf1f
 mExQnZ9oyXsSYXxSEXJ8C9T/4+6OaRjEz2IuXHdAgbt1AFRmEsazzKgAEmqjdhHToja6LQ5+k0f
 ou7pB0c52eKzzhgbAUC5fDUDRUJEtKCS1llEy6Og26rdbOxOOrVFNkl0s5BUJ9WQogZcw/h7C7/
 2yV+IYDcrGvFQ8x7IM8I+4MLe2NuB0tZmBAFYNEiXuOajpfbZO9HeXBvmkZ5vd5Wk69KVfu+l4M
 E2GL1CPLzAa4PYRm76J+7+Ih77Xp7e+/sUc8iW1qaKMCVV+XEjT9HomEihsIBGg8h2qF+2u+FNC
 HGRx12xwvM2/G/Kqu7vAK+g7W1xZbZCuMJ7Jfa+rIjWq//dDOL0RCO9d+oelagSrXLg+n/hnDI8
 qlKr9m55plo0A2aEzvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210118

HI Konrad

On 7/20/26 08:47, Konrad Dybcio wrote:
> On 7/20/26 5:27 PM, Chandana Kishori Chiluveru wrote:
>> GPII_n_CH_k_SCRATCH_0_SEID is currently defined as GENMASK(2, 0), only
>> 3 bits wide. Serial engine indices >= 8 get silently truncated by
>> FIELD_PREP()/u32_encode_bits() when written into the scratch register,
>> causing the GPI channel to bind to the wrong serial engine. The
>> channel allocate command still succeeds (it doesn't require the
>> target SE to respond), but the subsequent channel start command times
>> out waiting for hardware to complete the handoff to the (incorrectly
>> bound) SE, and gpi_send_cmd() returns -EIO leading to GSI usecase failures
>> for SE8 and SE9 serial engines.
>>
>> Older documentation, such as the SDM845 hardware programming guide,
>> describes the SE ID field as bits [2:0]. More recent QUP hardware
>> documentation defines the field as bits [3:0]. Use the wider definition
>> to match current hardware documentation while remaining compatible with
>> existing platforms and enabling serial engine IDs greater than 7.
>>
>> Also update the SE Protocol field definition to match the documented
>> register layout and keep both fields correctly packed.
>>
>> Fixes: 5d0c3533a19f ("dmaengine: qcom: Add GPI dma driver")
>> Signed-off-by: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>
>> ---
>>   drivers/dma/qcom/gpi.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
>> index a5055a6273af..8f09eaf4e714 100644
>> --- a/drivers/dma/qcom/gpi.c
>> +++ b/drivers/dma/qcom/gpi.c
>> @@ -207,8 +207,8 @@ enum CNTXT_OFFS {
>>   
>>   /* Scratch registers */
>>   #define GPII_n_CH_k_SCRATCH_0_OFFS(n, k)	(0x20060 + (0x4000 * (n)) + (0x80 * (k)))
>> -#define GPII_n_CH_k_SCRATCH_0_SEID		GENMASK(2, 0)
>> -#define GPII_n_CH_k_SCRATCH_0_PROTO		GENMASK(7, 4)
>> +#define GPII_n_CH_k_SCRATCH_0_SEID		GENMASK(3, 0)
>> +#define GPII_n_CH_k_SCRATCH_0_PROTO		GENMASK(6, 4)
> There exist protocols, such as QSPI with id=9, so this surely can't

Its my bad, The PROTO field should be [8:4]. I will correct this in the 
next patch

> be right (unless there's another bitfield for that?)
>
> Konrad
>
