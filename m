Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935100;
	b=onUn/m5MM7mGahva9FUHdNezKEe6dg5pfNR2e2h9YM3nM2YjPAGvuo3ofADgtr7pruyE
	 6wkO99vr8EDI+zznexEzejNPekc5P/db9devsBEIr3+VpZhZGXO03qFou0+53A2hGWPbh
	 CUc07Pbj4GLCgYhQyOvZliHB2/vhI3TuqfQGcV5vWyoYj3YDf+Etuc1Hrlfh0Li9zqiyt
	 eoQvi/Pg4A6oebPJ2EDRcuMA73w8nE8CI/CGw6Eqi1ryg7BQHWQe/0fTLamS18IYCw4Nw
	 I0Pxwdr8JmF8XZSLnO/Y8dLJ5ogjIqmzQeveT1+oNX4xlM3gZvwcdXpFBo3d7MOmLIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935100;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Yw5ELRHrebd6o1qt73LR6t8y7TmlfyCU3l58M6QwR7w=;
	b=odKyyCVrA5OYkcB3+HwBf5fIH/qIksenwrKNtDIple3MHd2GVumNiZXoOZxOp/SzvOY/
	 Le2DDvUU5S9nn0nbXLW0wvLO06Jj5DBc2WIIKbRHwlYFOHwPniBbWCI7j5VWHpEa6BHR6
	 7J2ylhvPeP7e76Y9QhbX3D1fc/AftBoJiz4VKjl5Wk3GEGet6JX6PqBTrve2bjuKj5zct
	 qFH6B+tbEPaq1wvQkdDkumGa6tznLQ6Mn0T6SWkPD9zzokE7sxMaNwd1N+JNnJhBQzLnA
	 beB5dbcImmOvdqsC28+frqTwz73eQxWJ0dXI3v7D6sR/t/23YSr33dPLf4gsjik/QfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nyuVXcGA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YaDkS1PN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC65606A32F
	for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 17:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BC65606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nyuVXcGA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YaDkS1PN
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQYPk4169635
	for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 17:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yw5ELRHrebd6o1qt73LR6t8y7TmlfyCU3l58M6QwR7w=; b=nyuVXcGAiDP4aVXO
	z1RgkoxOVW7+/sVv5pcO9u1QXiaM0TfbPBGuOpoBiYf/HVdKfdb26XyWX3wIsoIl
	jlKFzPn1P21p3H3Ste7ejwZg8h6TKBK7LfcvV+NJLv30w8x+cMMYSkjTahDXbz6x
	gU7epuiMJ68FJnLn2hbbxugCiULB4JFuwMn1CJhG/eExTI+pzcZthmS9yPuQ3/zQ
	I1Lh8605U5WXZ4Sge+fSxACNh4MJ+owCNwhegcJfgMUVo/l0FIhaMSsde2OFz/lm
	xN9I/Ja54llIy2W2q6HzDeD49C6h++iFl9iRp/0VyBLDBMJC9RRdoaC18ojsO7F/
	0WFJjw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve2m86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 17:04:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso132448eec.0
        for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 09:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794935098; x=1795539898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yw5ELRHrebd6o1qt73LR6t8y7TmlfyCU3l58M6QwR7w=;
        b=YaDkS1PNAfOO9tQ0ds7P9BjTcceoqIrc5Zx3VZo8zfzpR7yHO1X2NuDae18MNq+aO7
         MdByodqPsMvGISbmn3qNjJIpJI/BBSw/PtvaBSQ64TLSVH72JmOcgAW7U9NpnRvXlcza
         pbR5HDs+20lc/ypMsML1NHjM+fJgxIkJd0BPHwNE/OzajCzLilg8dRoJ17Vw3McJnutr
         HeCZjEH8a3ZKKzAJjcAmLU++oIeMKEP1DCidTElKcdr/8s88T66n8vBDrNJXoxale878
         sztx7IpNKc1QM7QyT2bpKvtCmsfp1lylEoDspZNw/a/2upB86DjHo5kfsDUJyzGfS+Qs
         t7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935098; x=1795539898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yw5ELRHrebd6o1qt73LR6t8y7TmlfyCU3l58M6QwR7w=;
        b=PDmxIUnyWFYujPBLgSd0gI2zEZ6ZnoRe0+WRJazCG0QRC9tkT8H6huTNfiiMuKjVxt
         SMSeyqXPNGFi29h88B0tjuU3HYOo3ztIPQVwmm1N3A6qSUliQsP72LFroYJFEqsZChs0
         Rqtxg1symohZY6Y3jjWZe82BFAu0i6tvLjwxGMF9Gya6F6leKB/Z/zq5FAUCZ0d6gR1D
         NLvncO/MFcUvRgUTX2YoVzlsRxLxJSCaXbUgDgYl6c6nSurKKMaGQFjH7psnRJMWWP5D
         wLt6cGhZsRlCevKiwTB0b0jHs7+zUCEPY8Ld7O15meTcFTI6YkREHQtIo3Qd7QYihQ6N
         CMbA==
X-Forwarded-Encrypted: i=1; AL+hErGhO3iLNYqnHrIruTXDlb5WU6wl0gc1qz36K2z2dXq4At0hBwAGcFK3wGXzTVLHRwkrW/7kCQARcxA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HuWZaNa5g+bC/ZSTnJ0uQ6FX4M/Ic6lLWOn8K6qlLK5q3a8PS
	bQBUUZ7z0AEiykviLQoXAyjsxE0w0QUxZUpb+ZSVViymA+R7BW3Hp2jzqYUUNYvhfaNAkkZ/0xx
	PmxpJ0jrHhS72uFbnVBo8GnnDTcICNF3r/G+T2GHK17VxHGLmxBHLaWbDlVq6HRM=
X-Gm-Gg: AZFdTZcuCSoxC0dHQpwyPv+oeHqW32+hn2TB7un77HbAAufB0wFCAlDkWR0hd8lqBdT
	7Qbfjfe1UpoFN3YXUWkomRIiTPkNUlN1tHAAkH2lGm1gg6n6dbSkn7n8rwnvluSOcxGjrfk9ScH
	00Qu9KDePSVRjaZ3FZ5IRn/1xi8LKddKYn5Isyh07J5YWbpHcV8h98IvpP2fUwvMs7+caJ65yYb
	ICgJzOJ+LyLBZuuHvQRaiswrc5ZvdlfUD/Thr/gGLXRskhHbfD1TbA+J2nvhV4JOoPiufslOqtJ
	r1o53rByMtVvY/ArZnnD32LczapxOgepBGruW08vBKzKcEzmUcK2Q+PkUSQA6FDx5FOWv2bIzlN
	ojVp8JCgv857TEf+Yg9OERsrnck3pgehuHi1Kt88+5ouMdYLqZIrBERe09GygOi5skLC2IdZNCi
	2TQgMP9rugJ37RtOR8
X-Received: by 2002:a05:693c:6011:b0:366:9f06:3c4c with SMTP id 5a478bee46e88-3828190b173mr37203eec.32.1794935098078;
        Tue, 17 Nov 2026 09:04:58 -0800 (PST)
X-Received: by 2002:a05:693c:6011:b0:366:9f06:3c4c with SMTP id 5a478bee46e88-3828190b173mr37163eec.32.1794935097390;
        Tue, 17 Nov 2026 09:04:57 -0800 (PST)
Received: from [192.168.1.66] ([103.172.4.28])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm68957328eec.8.2026.11.17.09.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 09:04:56 -0800 (PST)
Message-ID: <427ecaf2-9a09-4829-a598-11298e507614@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 22:34:50 +0530
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
 <d55bbf0a-3556-420f-852d-7a15ed8d5aac@oss.qualcomm.com>
 <276f1579-6a5f-4093-a0f9-53c6808df32e@kernel.org>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <276f1579-6a5f-4093-a0f9-53c6808df32e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2NyBTYWx0ZWRfX3I+VSyVPUKHB
 Vpuhac7h+zCXpAx3eU4uKmxlHQ2cjve8LuGFArckKqIMDQx+QzygxKl4D2k/6UDLTiVfwOX3KBK
 lnp7BNn3qv21THJqTAY/v2Malm7Cfho=
X-Proofpoint-GUID: -Wx1savWZmnPQ9YANdS5dmbc70UAIc1p
X-Proofpoint-ORIG-GUID: -Wx1savWZmnPQ9YANdS5dmbc70UAIc1p
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc893a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=kYVgg70FI5gtGbgwxQSixA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=9IG9TpRuJpbhppyfOHcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2NyBTYWx0ZWRfXyTD4Lwnr1XIX
 cCl54q7qpD3IfTDeUudj2l/NXje7cNeIo9DuISQ528X3kc4ti9D4ZqwT/ywUoMHVlI/Ulq7xlrT
 jfX21rvNvsJknfXR8VRUP/Bl8E/k+JwFbsoEx2V5HgxB3tULFxYyfYTBgMr3sLXxgrWG4B6rodm
 sJqpWl2kGCTckr37sPV9dsllLe0wdF5D8hvwsPyzKOufSuY26K+ruZ/k4eNDRjS4yM2yDxCKp3e
 P2DGFrxpoQ/mvCPeVGd8U0hRt/25DPuHjZP5Eg7BD7AfAE+cuNMq9V7VUYHQ0eSXaPkEH3ebD+9
 76LMSq6HWCA79XrYSdRUnAp1RV/BamU6Sm7bNrC6N+/yg9IYpKXqzj9Wu7sSUUhmSWH8fN+VqhV
 ra2B68uLgw/EBBQCpHuI7zz87393To+XwuPTpeF6hQLAtNIs/+aKTAfLLBICfKWZ8MdLjgdV0i/
 /LFj2zo96Y7/rtWjmqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170067



On 11/17/2026 8:34 PM, Krzysztof Kozlowski wrote:
> On 17/11/2026 15:38, Jyothi Kumar Seerapu wrote:
>>
>>
>> On 11/16/2026 6:56 PM, Krzysztof Kozlowski wrote:
>>> On 16/11/2026 11:36, Jyothi Kumar Seerapu wrote:
>>>>
>>>>
>>>> On 11/12/2026 7:27 PM, Krzysztof Kozlowski wrote:
>>>>> On 12/11/2026 14:47, Jyothi Kumar Seerapu wrote:
>>>>>>
>>>>>>
>>>>>> On 11/11/2026 6:07 PM, Krzysztof Kozlowski wrote:
>>>>>>> On Mon, Nov 09, 2026 at 08:03:29PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 11/9/2026 7:12 PM, Krzysztof Kozlowski wrote:
>>>>>>>>> On Fri, Nov 06, 2026 at 08:31:20PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>>>>>> Add QCOM_GPI_QSPI to identify QSPI (Quad SPI) channels in GPI DMA
>>>>>>>>>> specifiers. Its value, 9, matches the GENI serial engine firmware
>>>>>>>>>> protocol ID for QSPI.
>>>>>>>>>
>>>>>>>>> What is GENI serial engine firmware? How does the Linux rely on it that
>>>>>>>>> we add bindings for it?
>>>>>>>>
>>>>>>>> Hi Krzysztof,
>>>>>>>> GENI firmware runs on the serial engine’s programmable sequencers and
>>>>>>>> implements protocols such as SPI and QSPI. Linux configures the engine and
>>>>>>>> submits transfers to it.
>>>>>>>> The existing GPI DMA specifier includes a client protocol ID. Linux programs
>>>>>>>> this ID into the DMA channel and selects the corresponding descriptor
>>>>>>>> format. QCOM_GPI_QSPI adds the QSPI protocol encoding 9 to that interface.
>>>>>>>> I will clarify this in the commit description in V2.
>>>>>>>
>>>>>>> Does not really answer. I see no reason why GENI firmware needs ABI for
>>>>>>> Linux.
>>>>>>>
>>>>>> This extends the existing GPI DMA binding, not a GENI firmware ABI.
>>>>>
>>>>> OK, so it is not ABI for the firmware. Period. Let's stop discussing this.
>>>>>
>>>>>>
>>>>>> The third argument of the DMA specifier in the dmas property selects
>>>>>> the peripheral protocol. The GPI driver programs this value into the
>>>>>
>>>>> Yes, so the third argument can be value of 6 because it has no meaning
>>>>> for the firmware.
>>>>>
>>>>> Again, follow standard DT bindings ABI rules, you don't get an exception.
>>>>
>>>> The existing GPI DMA driver and binding uses its third cell to identify
>>>> the client protocol. The driver takes that value from DT and programs it
>>>> directly into the channel's SCRATCH_0 protocol field.
>>>
>>> So register value? Not a binding...
>>>
>>>> Its mandatory to maintain protocol ID-9 for QSPI.
>>>
>>> How can it be mandatory if we did not define in the bindings so far...
>>>
>> Hi Krzysztof,
>>
>> Existing SPI, UART and I2C use the same number for the DT identifier
>> and hardware encoding. gpi_of_dma_xlate() stores the third DMA
>> argument in gchan->protocol, and gpi_alloc_chan() writes it directly
>> into SCRATCH_0 without translation.
>>
>> Neither 6 nor 9 has been defined in the upstream binding yet.
>> Would it be acceptable to follow the existing SPI, UART and I2C
>> approach and use 9 for both the DT identifier and hardware encoding?
> 
> Not 9. The next identifier for new constant used in ABI, as expressed
> many times on the lists, is the next free number. "Next" means
> incremented by 1. That would be probably 6.
> 
>> Or should I use 6 for QCOM_GPI_QSPI and explicitly translate it to
>> hardware protocol ID 9 when programming SCRATCH_0?
> 
> The ABI is between drivers and DTS. Whatever your hardware needs, it
> needs to be programmed by the driver.
> 
Sure, i will update the changes in V2 patch.
> Best regards,
> Krzysztof

