Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491347;
	b=M4C/oriF7KC9EyUfi+LrpiaHL0ROZSNOR4RCFeAYAn9/Fdco1gmlH+5G6c20Cjw0YNRY
	 /Sp8ZrVUbp2DD1YXLmAtFL9WR7NYH7N87oZJgkwJtRqTYQjboddO5qF+q1RCxEh8RBSsK
	 rVXMoBiSpBI70uwUH007c1/MSVoXk932Vf8dpaB2kbk0Fxk6IhAgcpFLtqxDPgLFN7U/+
	 NX6DHnZBKl8hdG/kOR5wIoslAb2QzOZc0ohSrTxkrxcjuRC11+LR/lhp9n6Lv2wMw5j9R
	 euR0HBU51c1GxFY10pvIRRjUL7ifwwCrUrEjH/RySPGA5oLWdzmoRCD78QEqrA0NgPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491347;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3hXQZENuSxu9iFWGQOgWQMyHyL4PYXASjhi5T5DYXmo=;
	b=0w5F3FC98xc1wXIit8BThzxzLiPOlVEJ6xyAKP9zYrOT3iNRO12yKpEOIvN7UrwoRmey
	 aWTQkwo5bROOTrLGIfr3uWMGB9dT+jcPZD1mkfoawaBlIN5yzjrJYJtChT8pS7FvMzoKG
	 iTU+PVbOcjgx6xBI5aViuK7wrkXbxmBwzw4W6k9cKLIszD1k5GIZJZZkohHuWUUW5Ukpg
	 VsizpcNoYTDMuHDj5gM+qYtg1ex8MDXzPfvM4KL1V0q77OnZUx2waNIqrZixCxpt72BXL
	 NxaLxEMeZj1tlVAS1/BTACm3zTWohjQng3wzRcbm5smU1B6f5TgKAxaF+1SjdSuYPXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dS9ADkxb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="LB/XrMTV";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B44606A336
	for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 13:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03B44606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dS9ADkxb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LB/XrMTV
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC93xI52514179
	for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 13:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3hXQZENuSxu9iFWGQOgWQMyHyL4PYXASjhi5T5DYXmo=; b=dS9ADkxb/Kfrsqbq
	kcV7+R5mEVT1gMPTFpALmOlGY+TRXp0Y6aTe3royqRmSFs++2bvUIRJEfwho88sr
	P78psjoAlCnf2p6/FJwQ5p9/GZFRCAt3tz7rQvtbs1jlXaqd/EdhAKRoUM4Q7W+v
	ITiQ+3WrMPGFofw2UQtRSkWg1swqsBtkcGn2Qb2Yghny+OipKvvsaC7rsXotkAch
	9Joi6OWaY+kA55TfWUGDkExP1TAJm7yi2IfKIP5l4h8qLSnv5ruSl0iQR1RArp8i
	v+c3mUnhAlBzsqYWtuL/Ece7rVZFnJOAg0qh+w1mF8+lHe+5XYVvSfZvA9FWnFOq
	Co/2cQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1utfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 13:49:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so906694585a.0
        for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 05:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794491345; x=1795096145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3hXQZENuSxu9iFWGQOgWQMyHyL4PYXASjhi5T5DYXmo=;
        b=LB/XrMTVAom6eiU4jL+d6VIQK88Sd0mAAKGHBIbEb+L8PX0H4E2ahkdB6YuMLmKwlR
         SSRGEjGhC0AzfcWCy2YPKIfJakX15K85/YxKuq0GohCJA4PITS16QYbvGK1341tOApef
         m+GwpU3i1Q7h2HJAmaf7YyWXJ8CoM+BunMyEEYAwrCmrcFxf5OHC3HzJyJj0spL/dWmR
         T9hDrluoh1T9+d45jOH6pZXZ1AkR3/hkS/YFP4P9WF3GdLZ2Igmd0xOoCwONT11BAh+w
         nIEKRv00eRl6EQV2o3JLAusZrt4mjj6qjFnzDuQRdFSaKNSNN16AANDcu0VkaxiUC9yB
         fPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491345; x=1795096145;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3hXQZENuSxu9iFWGQOgWQMyHyL4PYXASjhi5T5DYXmo=;
        b=zyHaEUB8NDnBWVNVFXd7F/IRGEQ9o3v5QnFjXExkqmOZ9pis4fZC4GGCetLLCP/b5H
         22TNlHNCnW4OLDlFR9YXoBqAx77NIueL2SARVUm8WbMxYVvyEIUXZtRkgM6GH3gyyr25
         l5wRu+XV0H65cyERV6xDjN5jyPuR6yhiEq5+W8Bu3QtnBrOFr86HCa6yC1LZ8zi1X/DQ
         XpamI5XUPjiPFnjKZ5dD5JM/AFUhI1AGjC5HGZtQIwpA6JPiBiClzhOsFq6Sk7MhKC9e
         ehhE83NrX6VrgebNRiRqtafImwoivAXggKHRKoTkTi2Xr5cuiFjqQoDgJAvdzCbGoKUY
         RQ/w==
X-Forwarded-Encrypted: i=1; AL+hErGdYjj10neYTFXcizZFUzjeFwoGtDdqhiIfPbw2K9P8ysOh9zRIZipltnHWjDqLaJd5vpEwuXWXvco=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KCjemeJe3IRQRH/FtpPdssOsnxqZ2AzjWlCHdoShVEzRDFagv
	AS64RtorBllpKiQivHAMI52iFqTZC1ZNducNg+9sNbnLuQSEQiUKGhRBpoHr+4QIjrZEEi36VSL
	tGWfQ3TIP7ES8gEm+u1jb65lC/3AeT97qsUKp8dBImhQjtalv147Z2f2tmDw3HSDRq+x4pYk=
X-Gm-Gg: AYBFou2D0LF/Koj8yxVa5H5hC6S2sItZmlkl9gdLIa3M1dbkGKDp+51CrBNtcpfEmB2
	lr3HdTgZdr34w1mGB05NzWHdLI8fzq/rJ/5Krokc7I+/1ZsoObxAt/iAsdO5a2RJ70cJf3mV1R5
	8dIPNc0/y4g2g6By9w8dTpaMohpS2jfhcAWvMXneU6ToET1AudiIapv0Swj1wtlx03OPRYlZKbN
	dFuhMzl+BeCIgDGxcno51F21T1JQR4FaXdKSQxAPa4j8EcibMMjjH0pqRVcKfE7t2dmN+h8ytRm
	SzJtL/86eD4ovwLFGytGfZHg5WlzgfbJLWW3FQAIEcuaE884rc6CGFwcBTSk3ITVhf4ztjEPi6U
	g/nkmWhvr+vaQpWwlSuyI1cKgRNk6B3JZMP7igE0RvhHypzTZhMnDQbf66ZFWxzTdK5xg8v7ogz
	0ne3c=
X-Received: by 2002:a05:620a:450c:b0:93e:623d:99ec with SMTP id af79cd13be357-947affe663fmr964783385a.13.1794491344736;
        Thu, 12 Nov 2026 05:49:04 -0800 (PST)
X-Received: by 2002:a05:620a:450c:b0:93e:623d:99ec with SMTP id af79cd13be357-947affe663fmr964779285a.13.1794491344206;
        Thu, 12 Nov 2026 05:49:04 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae196cc72fsm10673721fa.13.2026.11.12.05.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:49:03 -0800 (PST)
Message-ID: <b1b753ac-cb74-4b9c-8fd0-31777a020878@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 19:18:53 +0530
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
Subject: Re: [PATCH 4/6] soc: qcom: geni-se: Define the QSPI firmware protocol
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
 <20261106-qspi_upstream_series-v1-4-21f43042dd60@oss.qualcomm.com>
 <20261109-stimulating-oyster-of-respect-620b7b@quoll>
 <61646f06-87f1-48da-9b88-8898bb488af7@oss.qualcomm.com>
 <20261111-prudent-polite-shoebill-add35c@quoll>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <20261111-prudent-polite-shoebill-add35c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af5c3d2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=DN1OgqIxCIglqtzaC5MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: XddFdDLgEzRd0dfFXf0XSE83CpxQ07uT
X-Proofpoint-ORIG-GUID: XddFdDLgEzRd0dfFXf0XSE83CpxQ07uT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX2rXDL79MN/g9
 MiJS6LPwDvPHjYYGLmAjpSxZh5Nj7x5+E5jsTHmrerAVJs7IH6Ba5hnYecVR7hSQ/iQ96QJP82c
 ptCcXNGUgb6oBROzh7j6wyAU2kzzVjxEFMWfB2m44p/3Gpnm+qqgAx3is9PfyBNxW/LY7Y+TO+Z
 mhdwyT/zoQVvtPJ0Plko7Pfu7zXABRY3qIAv/GSvtn0LM8/KiKlQ4n8g8CC4fQsDw1/ODAx0PEl
 h7pRm2ZOusx5V0rQIrvTh4TFMnEOOmZ5TgZZTXoCAwn98PARGFyYZ/Apsgp+vI1HLot3OgO6cJN
 EfRaqiomNX4zN0Tvbm0M+vnH+ALQfhvL+HoGxl4+6JzMDKLnzUDZugSCL9ylHXMExQi2M1E+Nfa
 JvuPZdD0PwMhrwPVaYNItLYjzxtdMOKq6cyEvi4Ih+42gJIKcPxnPv4YVWZXCETeSFOsLblkQR7
 UJxRQ4u39+OzQbCTgqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX0nqNCNqpozaP
 niqg2HkKOGWxX8WvTb2m6qBNB1dRyQ046JyCwHgoHQEc6LNURT3q5NLOsIk3C1e4Z1jnKrYvG+9
 vuAXyMX14G47+qvfibohZQHfPKgvG3k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120054



On 11/11/2026 6:10 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 08:13:33PM +0530, Jyothi Kumar Seerapu wrote:
>>>> -static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
>>>> +static const char * const protocol_name[] = {
>>>> +	"None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE",
>>>> +	[GENI_SE_QSPI] = "QSPI",
>>>
>>> Why are you creating holes in this array?
>>
>> Hi Krzysztof,
>> The array is indexed by the GENI protocol ID. QSPI uses ID 9, while the
>> existing entries cover IDs 0–5, so the designated initializer leaves entries
>> 6–8 empty.
>> The added NULL check rejects these unused entries before accessing the
>> protocol name. Appending "QSPI" directly would incorrectly associate it with
>> ID 6.
> 
> And it should be 6. Just look at uses of this.

Hi Krzysztof,

The QUP Hardware Programming Guide assigns protocol ID 9 to QSPI.
This enum represents the serial engine's protocol IDs,
rather than consecutive indices for the name table.

The SPI/QSPI driver uses this ID to request the appropriate firmware
and validate the protocol read from GENI_FW_REVISION_RO. The firmware
loader also matches this ID against the firmware header's protocol
field. Changing QSPI to 6 would make these checks expect a different
protocol ID.

The name table therefore needs the QSPI entry at index 9. I will
clarify this requirement in the commit description.

Thanks,
JyothiKumar>
> Best regards,
> Krzysztof

