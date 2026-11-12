Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491285;
	b=5s5jyAOmPT8Rqrbudf3+stpTZl53DytrMiDtWr8bqQ0uy723hro29WJmD8SS7Kx/TIIl
	 /hz2JWxlIp1WtqXXxCHpLZOvm1u2aOirpPnsoQ35pitiJiRdSTgGOvki2fAsSmwIA2p+A
	 HJkFnf1QpIev/2UdfytaM9YHVQkqXa4sSXeXuW0QbeGNI4dHFqawIYaULYKtjvq+A18Br
	 d8G0coZADMI/V5J3peRdViyHN+KBQTVO7TTWoNpAVOpjMRGZclIRzbPaGoPlsMLyfVnIH
	 ALdldXDHNUyYEAtkQqwWMz/EZnOkd9xNO8EoIhCRn2EbnOCMMhNAL90cZc/CL91AwPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491285;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=U+W2nYGry4hKMV2JuVK3PdNvH+FLPLTAkEAHuaqJzqE=;
	b=kxjz7Z6xjhkYebVZ+js7kkYD0Cf8gtpsAa1ERa9HlEe8w4A3Xb5SikivDadSB9sFg82N
	 tFsVCG5MaRJ0o7+GbOcp/9CXSMxFqmCyh9o15AFlLpT9gkPNnHzarS6eIoxoCwdKvS9t/
	 yLvtleM3VIadCWt94SfVp1YeMsyjPbGffjg8uIH9IamnoRdN6bkwyYjpLAhahytaug544
	 JObo3oX0ZamdLU69UwgI755UI14v9RMMUI6q7Q0eVIH8HWaElfEG/azO7C4zLGJfapH+v
	 Ueqq10+73NhEpZAATL8GGHuRaxvEDpl6vn+v9BmzcO1ju5W2uFeD5X6se8yEymxhtVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hq5ed0vU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=be2W0OH3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FB4606A337
	for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 13:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50FB4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hq5ed0vU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=be2W0OH3
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC8vWUi4149282
	for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 13:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U+W2nYGry4hKMV2JuVK3PdNvH+FLPLTAkEAHuaqJzqE=; b=hq5ed0vUkzkNuUs5
	mXglYr6PA/HYKeuC7/0cQzccV4zjo16sbgqlY0VQr/p4uTGzmXQdsEwYrpzn+b29
	rfs7sSQ85pKLLtRqrz0CJMMbwNPKz2UyHLJDT7dJlM289/k5AJTzDmTiXkaRSFVb
	Yb9UANoH7spvuqsMktXYVVGUaZAxSIGUdU71683lmatlu5MwA4MlYWsC2IDG3+hW
	jAPq/lRftHqp+nGO83WwxRognk073p3HuVJoxPVA+PkI3aUsVs0OtGYRMzKg9FYJ
	goECocsSKnSekf4xYWc5aqavga5TAqBN/I4WpOWq0fWd8ffby2UC44wNZOnjq8p1
	43J/cw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc63n89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 13:48:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91f03ea17f4so35104706d6.1
        for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 05:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794491283; x=1795096083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+W2nYGry4hKMV2JuVK3PdNvH+FLPLTAkEAHuaqJzqE=;
        b=be2W0OH36Sr+oIDxYJx9kEhbnPGhKxIqWsB5jS4QhwS0lAoiYWw2XSrh2t7gNR0sz5
         ETd36Vw80LM5r5AzM9Gf+HMzho12nbd/qXEaFN0bBP2FMwzCD8t8wga9vqWHGhQV/Vm0
         INAch9nBPIjJ54YDdn6XXIzLxvZMBodMca4OmWB8Ua34YE6ZlCqZn8M8nftisYGHlFEi
         5kWu3uXZzNJp8rOhjzuD790Bua5X3pSmLQfv6kYspUiWXdx2E9dsF1tMB/pUN3/R34yk
         bxk0Xq63VaR7KHcXe7Ro0mFW28crTtCJQQ6VMNkZUzxxwWEYLz6oZQPCiv3YdA7z9vOE
         Y1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491283; x=1795096083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+W2nYGry4hKMV2JuVK3PdNvH+FLPLTAkEAHuaqJzqE=;
        b=YjewynVIdP7U5l7q8GCm80i7CMKsKY949AVSxNIdVUzpGWdzZXQlcRt7zWjfOfE5k9
         p/es7EaGN81kKlAcK9eE1p0OKGfABSAf4w9AK0zSlv0sZYXgSKk9lDfjOmn422YEjk0U
         z5FRCLixbOiptsNIfvfz97bXmbFUaZIjL7ggzfcl5yxg9jVyODqLKeQyXWul0It4zZ2O
         FebxD9rbOYPXaAUWYbu1LCJ8BFt+Mz8Ug+wAU3Pk+IID4aweVp9Z9qBwJ9nSBrhkWgG6
         +MFt7nDAICeVp4yG4iYZ3FLFKTF/kOlyLJP+th50IxSr9pZJ1/Ia+ZcMnZzn0ySfExWg
         ViOw==
X-Forwarded-Encrypted: i=1; AL+hErElUuhNe0Mz2EYolBMpmLoo4IjccZgn8aFHTFHiWp7KO5W2H/X1naEiFFWfR4XDugUVrAIXC/IyLuc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8i9oJmTh+2lvaah/vKHmjFZnEcTOWAgWCpfdbS8vuDFbQMOsAH
	qW/Zbvmxt5B+aAR8QsT+b+qGEgwlOTMXQEKEQ+yAo4jjh6aKZafWkXAlvFRnnisTIL0WkgBk9n1
	31NM4JUUQIHu5ypEaPxMwIhCdKejayXSrz38HwpvCpP4tTyn6ZlCVsf6hjIBRlQo=
X-Gm-Gg: AYBFou2VrFOnitaA0Cyv/hPZNiHxRd0UTUVAf7q6E6WH8is8EbDwLm7jJWAQT3W+QCE
	rmQhTNKcIlJvHFuQLn4DQxcnQoLgkEjhCF2QNgMGrm2LeeCBKyV3H3BFu0WZ+ZSF1Czh6WNWdj+
	MLCdn9NfjSzw8yn4DLqjh00qfnAgiKp1SGZ/Lh97Nr4/B28mpX3wiaGFPTZmS+hAXtD6HkWL0H6
	DMx1yQ/ouKwL6zjBT061W0NPAyRJCcOh0kRKZwh3zsdl+6tbcURsuZ17e3TTnLV5vbHxrQOB9Ke
	mb744L16bGqceNgHMPSXjHdg9cBYmh+ssBp7P09LAN1/zFoJh9L4x94feQdRLw4fHu3nSaVFGbC
	OoxIV9sLVxl0XjG6NGtdHZzkpT/UOvnSeqaJV9lQQ1CMs/u2MtIAGyFJvZHTLeWQnWHD5ljLI2s
	/pfFk=
X-Received: by 2002:a05:620a:1b96:b0:93c:9c0b:3898 with SMTP id af79cd13be357-947affc1c3bmr930694685a.59.1794491283023;
        Thu, 12 Nov 2026 05:48:03 -0800 (PST)
X-Received: by 2002:a05:620a:1b96:b0:93c:9c0b:3898 with SMTP id af79cd13be357-947affc1c3bmr930691485a.59.1794491282604;
        Thu, 12 Nov 2026 05:48:02 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c16be05ba1sm325697e87.50.2026.11.12.05.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:48:01 -0800 (PST)
Message-ID: <c9427a03-8b45-4e35-a29d-7ebe30f07ed7@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 19:17:50 +0530
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
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <20261111-daring-salamander-from-tartarus-4c72bd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ypKopIfRxppV-ZL8rSQrDOkwhPwvOIos
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfXxgStVE41fLVd
 yknITUuWzoCrPwtWcOsIiQfQtaJqc3WGejv78me2RUlq7nBCuDz531RDeOZRiHdjlf6bAnp/yh5
 ifVDAKQCqvVytokjKzzw01HRe5MnPNOFwX3qHVe95GDdw1IsPbT8rTJmlXLFyg2/Rb/YdecfD/x
 FhACX5Y/NH2IcJblKMS324FQd4mQVBKeq96SQ/z79AGxUMqCcef0tjciEu6+PyApTTxzd7Kp9u4
 t34tUR47UGf+2sorFLyslRaQHTHNPC+b5bqxfxjzyw3hz2EOWjHCTZClDcetjD6N/SLZNLM39kw
 M3uw/xI5HjdMdLLw69eiHbEnGOCif7ZhCbNLq1WoWh357TC975GftMIUlusCfqNJaarpJDlKGtI
 Z5lmfA5/d+H2jQ5hE2gETMtlJ/3YNuI43xFu06V/pEVkCi0XbedKoRB4AA0ZU/ZeaQyWiyliGzF
 Z2S1s62GV9WYh8adFEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfXx/ohPi7h5AVE
 KvfRScq3wtcSyfO9kncbYog5lRfqAnJ5r93z4DV1zzgXObAR0NA1CWAFjpZ5S+Fsq0+x+FeMc86
 PHBezCf1B/sj1aUpMvBdx6VYUVtzeqo=
X-Proofpoint-GUID: ypKopIfRxppV-ZL8rSQrDOkwhPwvOIos
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af5c393 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=dNOB8qFnOFInGeeiHp8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120054



On 11/11/2026 6:07 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 08:03:29PM +0530, Jyothi Kumar Seerapu wrote:
>>
>>
>> On 11/9/2026 7:12 PM, Krzysztof Kozlowski wrote:
>>> On Fri, Nov 06, 2026 at 08:31:20PM +0530, Jyothi Kumar Seerapu wrote:
>>>> Add QCOM_GPI_QSPI to identify QSPI (Quad SPI) channels in GPI DMA
>>>> specifiers. Its value, 9, matches the GENI serial engine firmware
>>>> protocol ID for QSPI.
>>>
>>> What is GENI serial engine firmware? How does the Linux rely on it that
>>> we add bindings for it?
>>
>> Hi Krzysztof,
>> GENI firmware runs on the serial engine’s programmable sequencers and
>> implements protocols such as SPI and QSPI. Linux configures the engine and
>> submits transfers to it.
>> The existing GPI DMA specifier includes a client protocol ID. Linux programs
>> this ID into the DMA channel and selects the corresponding descriptor
>> format. QCOM_GPI_QSPI adds the QSPI protocol encoding 9 to that interface.
>> I will clarify this in the commit description in V2.
> 
> Does not really answer. I see no reason why GENI firmware needs ABI for
> Linux.
> 
This extends the existing GPI DMA binding, not a GENI firmware ABI.

The third argument of the DMA specifier in the dmas property selects
the peripheral protocol. The GPI driver programs this value into the
channel's SCRATCH_0 PROTO field and selects the corresponding transfer
descriptor format. QCOM_GPI_QSPI adds the QSPI selector to this interface.

My reference to the GENI firmware ID was misleading. I will clarify
the GPI channel requirement in v2.

> Best regards,
> Krzysztof

