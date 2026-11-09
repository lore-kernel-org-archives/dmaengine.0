Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235421;
	b=dVRmm41tpsuVppJcVHF5m2g/KfIQ7hgAQayE82nVL3Qejw0P9Wdkvc15/fAQk0N8FVvV
	 yWDk1yYfeWE8l5YWO2cPMyKbsVSkvp19tNhYrcZH5rJMF4cj14w9SB3zrEKqmx3LQ0msU
	 gVAnZOQ1Knj/rLzFaLqOfnRy9dy57UbuTFSXV0pMXwygWXoYUGplL1HwPRal5goPGK5l4
	 1XCZ6gKl00k69sw/+0hw8d5bhhYXLDgEfOkq46gh2hLX2g9yZ834KloU+9lSwRXa1LIV5
	 PJ8DQF7Zf5Xf2wbfjFQpm/bxD69eic8iAxu0owqzLIOLK5YWeByiDtKBzJIk+Habt4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235421;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=js3PUCSX9RGe+iWVpuwLPjnKS299ziJYM/TNs2sZ3KQ=;
	b=ZHXQOABoelwA1fbSHLFFS1k11OmimE0fzMNVU1i55byOCwWfw07f6DnZ7dzH+495MdgR
	 0isVMxArf3ChLtPa2V4F86+jGh0+vZfAoKrJAHc+BZ/WqSjFiqQvSDu2+IRVYrFuXedlk
	 9jD56HaXVbxwcpFy5JgZJ6EJ1TnvUM1oR8jj0/qxka3iPOhVA0P25DL7Vincol/1vPqAv
	 bXX/kLnOTDDSwgoxDVyXlf2cKJrW2VXtuNvC2nkrMn9Sc5AUiR0Y3usTKFmKIVk29qBfC
	 qAUl443e2fJdVYq9lfs2/CX7N+98W2DMl1ivY5kv7g7UdBqEIAR3UmMewuC20QqpuYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RA3bYcBw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kF1vO/0c";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30022606A326
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 14:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30022606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RA3bYcBw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kF1vO/0c
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFSc93589080
	for <dmaengine@vger.kernel.org>; Mon, 9 Nov 2026 14:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	js3PUCSX9RGe+iWVpuwLPjnKS299ziJYM/TNs2sZ3KQ=; b=RA3bYcBwND/tNCjZ
	cLdRZZiLcq9T4Tklbl+Dt6rOJWygToA2gxZOesvz87r8YJ5purBXw4hmnECJLmV8
	JNno1dtpA/shkpgHDlc0nPGYa2QnJ3eMkSd3uPTk6NA55ELLs2fu8GK9g6gZLpIX
	mia91lxuavmbHx3G+WBQXIpPXFOizggz8ZEqmvj1/2dB/xcO5gdF8tzSs8dp7i0E
	Otwdmouv2odcrSLJErRe5e901TkYItRjVrEH9Xo8/67C9qKwprXM8suGai1rEOwH
	xuW7/FbPLLoiln6bhPuywPK80bb5LRlwVaYzY9ljbx6O7ux/5/YvlTD2kAqxAILJ
	DtxdyQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcj8mxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 14:43:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so904457a91.2
        for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 06:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794235420; x=1794840220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=js3PUCSX9RGe+iWVpuwLPjnKS299ziJYM/TNs2sZ3KQ=;
        b=kF1vO/0c41w+oEce95lRzdSo/125zmTTbMBK/gEKuWnJ3AUUap2TrdhtvZzIwnWJNq
         +Bh0UI6BjZTqL1aINIuusS1WG9ScQb1bAgOt78eCox2a7Ee5tfgwAJ0r0GVoUxEQU8V9
         SdiS6pFKiu2oxxeDMwMed028B39dS3KbijljM3TSmCpvoY8XwzeTqZ6njpsM9zRuAF3P
         jbvDIlqm2RqEzy3igVzl6OyJkkEq9Upj6BjSEfA/0++X3BRUlnjPNDGMWhf7y03Gw/c1
         GR5DhKRrI+GrLT1N/+RlcAyPuDoQTsgjWJud3hm9c1bnmXID1T0hTXuCPDJYuXzlqSo6
         1A1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235420; x=1794840220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=js3PUCSX9RGe+iWVpuwLPjnKS299ziJYM/TNs2sZ3KQ=;
        b=Stsxf5qvbzqRCx+2NRp5vI4fHWGmPxQJwiVETMamMNvZs6wNIx3Z2mUge3oojq3B4L
         IKXb2HwVh0wIRmtxad83NBmD9UoLeaxsBN0PM8z/EtZKqWQG/JuhkOLoNdc4uSsO7v8S
         3q+cJX82Yj5WaWd+P0V0XxjcSS6OdaDml/6ypC+CcBts1d3m+sYLfVxBMaxduDyWUoDz
         1IQOKT/e+h/0NXPpG7IOt85fivo7l8HV6vQaLb9wjRr6VFqhWA+8mNcMXBaCNnFL+K/f
         juqA2uUFl3gfAqSviwbYknrWcGAF6N2rsOyGywpkh2lYXBkValf1zTKxwZ8cAKRwjPOJ
         Rq1w==
X-Forwarded-Encrypted: i=1; AL+hErGpi9vaIeL4G7vTRDB10JpcitMqTiZJgk99PqvhAY7WME34jSa+DkHCgLCXiWu8GhUFOGPmEWD8B/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9M/OHgo9FBUxOKuyiBH0WU9d20mxu4fRTJGcPk/CShUN/SDtDD
	ucJbCx5PBEPAPxdfLpjrLNDgh+HD8wx4Xdclz3JD9Sazoxb9Ph/weIMr/vMhO6uRz+FGQHfw/55
	FY9PVIBqqs5Ff92AT9GMy6Df5m83GsxVkxwvFDKg57lWRCJhA94rzjtVM4gvh9U8=
X-Gm-Gg: AYBFou0Cr2v2jUbAQOJB1WX4ornJi67TeG1MYOssXz++VGOzU6oqou7T5ltabCh/jiF
	0gCO6Fg3wMF5UVuMS/vJ/vZky0Q9jW+/AXqZghVr+QJSPqZ+ZjUMYuFjx5lrDgx/Bzt57payOSS
	ELYwBsY1k13FW96ThglV88rEPkRK/yBLqA8ZkxaIaWPhMTqMgvlDcSkPyNhgRG7i5EDz8Zy+jBV
	LY3YpxPATX2kHfcrlDOHYmwb0Owtl89PyJR61WUW9QF4z95HvCCNK9M8y1N8aCnP1FXTcpV8wBS
	+/r/Fp5CsPJqIHqcjdWyie8/77Lnw/omMK0uRFFYpx4VdhQ3ttrzG8b1eXDyOl7dXYeWLFfhldJ
	ZZBL+YasSeuxrx8T1r0hTuH/22u5PVt2HFsOHEvXdWQihzurITxdcKOZ8xULOg4tOkrE43MN1ts
	AroQ==
X-Received: by 2002:a17:90b:5807:b0:3ac:c98e:345e with SMTP id 98e67ed59e1d1-3b12d3d2aa5mr3285289a91.45.1794235419751;
        Mon, 09 Nov 2026 06:43:39 -0800 (PST)
X-Received: by 2002:a17:90b:5807:b0:3ac:c98e:345e with SMTP id 98e67ed59e1d1-3b12d3d2aa5mr3285256a91.45.1794235419245;
        Mon, 09 Nov 2026 06:43:39 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b12790befasm7129841a91.13.2026.11.09.06.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:43:38 -0800 (PST)
Message-ID: <61646f06-87f1-48da-9b88-8898bb488af7@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 20:13:33 +0530
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
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <20261109-stimulating-oyster-of-respect-620b7b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zxvo7Vln_5fv-DD8GzEP2jxlsdqWaVZ2
X-Proofpoint-ORIG-GUID: zxvo7Vln_5fv-DD8GzEP2jxlsdqWaVZ2
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af1dc1c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=rLV7qYPEkEEFJh5gh6kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1OCBTYWx0ZWRfX5PWvses2IFJi
 h1omuBN3D0m5o0BrKWSR8KELk3SL1BAvg7Sh6g7zdLSIyrQxiBwPO1EI8SU8rzM1DS+6BBXI2ku
 nE6O2pq7gJqMwTPMAiA54Kl584PExj4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1OCBTYWx0ZWRfXzAa+K3u3nYPO
 m5GH7jAxiHYQ+TfSFj3GNOPUlwMLwQ655xUpQKo+cioqmnhmDAxf7DP1XSMBFL/KjXE0dCXklKk
 evQ0inuc8Sa5nUhxQ90L8n77G7122At83a4e4AX09MTd+/ngAOGL0vvgGBErE5ydzI3aux0hp+k
 SLR2woWOeJOf0u2zrqkQEXPe8naJNmQr1ZcmxITSQue3ep3vUMWRvamucjNDnCJiA5bShb6XyA9
 Adcqb/CqPpiwbuciFxppi+0R5pBK0J32BZ/gfmI2K/dOljiRkmERlVaf8YtWoRSpcHuvZzP/qsm
 /iBCSX56idE6q5wBEcuufuCgv5I0d4bdyHSN5XzYbTICQkBLcAdBhPLqE1ly2RtofVTfQjIIQeG
 Wj46Pkg0OpzyNjTtUW87OYFxJsvlQJPWtsZTSwOMePWSkNoUooooSROJSjxgI39EjCiY24YAxSJ
 i1zQMxuKNZWzXaaZwMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090058



On 11/9/2026 7:14 PM, Krzysztof Kozlowski wrote:
> On Fri, Nov 06, 2026 at 08:31:22PM +0530, Jyothi Kumar Seerapu wrote:
>> Add GENI_SE_QSPI with firmware protocol ID 9. The GENI SPI driver uses
>> this value to request QSPI firmware and validate the protocol running
>> on a serial engine.
>>
>> Extend the firmware loader's protocol-name table to accept QSPI.
>> Reject unused protocol IDs in the sparse table before looking up
>> firmware.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/qcom-geni-se.c  | 7 +++++--
>>   include/linux/soc/qcom/geni-se.h | 1 +
>>   2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index 873bfbd6b2b7..396f3d81d292 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -122,7 +122,10 @@ struct geni_se_desc {
>>   static const char * const icc_path_names[] = {"qup-core", "qup-config",
>>   						"qup-memory"};
>>   
>> -static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
>> +static const char * const protocol_name[] = {
>> +	"None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE",
>> +	[GENI_SE_QSPI] = "QSPI",
> 
> Why are you creating holes in this array?

Hi Krzysztof,
The array is indexed by the GENI protocol ID. QSPI uses ID 9, while the 
existing entries cover IDs 0–5, so the designated initializer leaves 
entries 6–8 empty.
The added NULL check rejects these unused entries before accessing the 
protocol name. Appending "QSPI" directly would incorrectly associate it 
with ID 6.
> 
> Best regards,
> Krzysztof

