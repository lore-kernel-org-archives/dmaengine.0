Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234820;
	b=NHQH62dOcHA9k2ke1UzJTtCFBUO8GHsCMo4SSCnIoK9i9gmUZP5EWGg9XN5ORpZlc58s
	 5wiUpafvbY7PXRSlIO/DsEPkPuKE2cnEpFkHdQYs2H5G4uaW/eTvdw630vQW3vPsHVu52
	 Ne0Gy+9U1IVYMFwZhJsQj33+i8XR8sas5af18Bk0MtCMLgHOsTTz9SxZVc7CKBWQjb6cX
	 o9vtBtA3msrBbpfp5TSSYMjIrfWZDZeg1vVLdPJtF79afseAfl3X6Q3qXdjsRKNCX4/M8
	 B+xjc5y85DQLabT21Vu4E/NA54J2R4brt5efEd3JwFu5yHcYCc3ukT1RJk8yuM07RBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234820;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LzdcUGnHa1JcIxlDEp+JQ+iXSi5nkLn3zmwF0wQSnvc=;
	b=ViGnQS71+Ao+FPM48YwupLhyQvZQ40PQRd3/FIBas4UOKwRbLb7MAMBuaVWuEZGgmJQr
	 7h4lZTbAe0yOmJuqaA40HzqjdPycJdSnBQ9c4l6QkretxvoX03/oOLGb1rbkbBJDTEc5b
	 ivMwkndoypLHrPigA8OQnUT4g4zJOsqLHtoed1j1+Jwme3QDMskvK8CrbAh+FGjcRpBIk
	 4bkk8EAoP/bqJT4fYrOP7VMsilniOo9OO8JCMQrW3Eu7YhKmM1Is7L0nPpwsT40j7k9kP
	 Gmhhq5R1Dncq6rX2rgguc5yRLf8FJECxJPdQzg+sz11TXUndlhinYtt6SajIF7+VKUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LA+1xtTA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RdLsQJ0Q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4603606A33F
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 14:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4603606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LA+1xtTA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RdLsQJ0Q
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF6Mp359175
	for <dmaengine@vger.kernel.org>; Mon, 9 Nov 2026 14:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LzdcUGnHa1JcIxlDEp+JQ+iXSi5nkLn3zmwF0wQSnvc=; b=LA+1xtTAJJxIVMht
	l/U6UzdQc712+X62A61o2OXNbrxt9nseabB8UoVTwbxmp2DMA+narMHLKqgv21S3
	H+GcaS+du0uQSGd8cprO9d+g/ncMNIl00x6a/XuBgWAZUKFNBB+HOeMuHJ7l0vQm
	FIr5Ow9i+7mPHkze15zhbAlB8QX9ayArzdnIvv74RZXkGSuPi1cVA2vI6woR8Et2
	jC7ZcbY4VR5TfD0Kx6obAkKlNWa15YSvRHVOHS8HSNLcTMctoNhtiL4jK38usNQo
	VRJIkytT3TCG5ndGKreTXgrY7CzyBubG/EUeRN9lH9RpYfhYaOYRiI0XiVdWHKf6
	j6oppQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2j2vx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 14:33:38 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb990c283aso613624a12.1
        for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 06:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234817; x=1794839617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LzdcUGnHa1JcIxlDEp+JQ+iXSi5nkLn3zmwF0wQSnvc=;
        b=RdLsQJ0QoD5g47jXPNlzrBbjVFvMAJvOADAZFfzcVMPhJFP3b8cI2kHPgYhsw1jJFM
         cMbhLXOsQ+ISJSW/anFsHuJUecH65Nqc8VQXKV3SRZzxemL4Nzdb7bqbrM3LJJYk6P6U
         Jdn+2omj5m1/oXANbr+vBgUK/Mw//3Wa3dKzKeGiHc0HDAqap52fTlelsLVOF5ezb1q2
         5hA1hPIb9smPO1Th73O8CXFVjg/mB/7LdOrH+TqLwyg3vwH3Xq1JSeATHmkI8YozfCQK
         9oBc8gXjJCpJN3oRYwl0Cy54nR1lHOyn/KslANgq8oIq62besZOfKrq0j/Ztst+KVvtn
         E7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234817; x=1794839617;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LzdcUGnHa1JcIxlDEp+JQ+iXSi5nkLn3zmwF0wQSnvc=;
        b=NWSTvPukg/nsRBmzvHS04PPyx4cOVrkRYzn06jsZb8svgjVbjbSjxXmH5OWfig8V7x
         ZwS8nbcPOgR4vWsSSs0FmJzhzGLQ4WG64eY4aqlLgLa49EKO9CEoWxX3uS7ugVSvYCA0
         /BIDJAegf1eqJMvjFtLAc2Z0ppiq4VSg7G+GOCV7/5s/Cki/Gmlkz2NVBOdNCffHkhTT
         WL0xG3JV4Wp1RQX8eVDDfBoQL8p0OIn3veueQsy+GzYjVkyUWkVdcttwIWb62t49zQnZ
         Qxozo+vqrXClGa0K4IdPTPDXjPjDTLOMsdW1lXD33mPimTNCt24iRFVMbeCY103p1jWP
         OUoQ==
X-Forwarded-Encrypted: i=1; AL+hErHsEd8xbaQrboQqH3RQ6Pa7yT/v/G0ztiUP+RAmo9hXCLXEUTq+43C/ozZ46CNQhjRnVEn3WPz+HIM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pyZLreuLbf/8J8QUQ2P9jbMmWJNeYLeHk2j/EHOu9uMldyA7w
	4kmBle0ppoRy4DYWNWIGjZqp3hHEaUYhU/BFIITFLcZsX52AbrUU96CafW/SO5q1l14PJbOJxhD
	OM/uMxQGRfSLNtoPY8T+/kscVQdyfDBC7zGq2HyNuEqsdLzPnNAkBxTja8oNTlX4=
X-Gm-Gg: AYBFou3ol8+bHfZl0zFw/Ax+cESk36ZmyQoxVM2vPmU85RR4h0yqzHNJ/fbLmf3joFt
	2KFSCN0Na4LUw0h0SY95Nm68VHw2jJjjrcoYR8Ca+4z+DxOckjOLgeKIa2FL9qP6qAARURxl3x2
	y0qzbK5voO5sellAgCCqukUZHJv31F3q1oUrkjHoajVSclKrBffuKvrDwS/GoBLnDuzHvOxmh+J
	B/Ge8EiMMJY/vNKB1CPtz9P5ARUN/mAinLPbb5Y8fQJapFzcQK1+/ag6Ck2900ntVT8vTzX7ryO
	uSG0XmZI61MU5CcCzWcJJ1fRKnLBZDL439o3FEDtLQ35NN1lzGqFvykMIKSGfyVzgxy+Pdzzk2o
	Vq/cM00iPtPJL5OETsqAudaCJNXngQoopS7R+skS/Rtc7sC+RpJ9tMnuZkN7wCbJ4WYiHaooZyb
	Nwlw==
X-Received: by 2002:a05:6a21:71cb:b0:3eb:b2fc:bed7 with SMTP id adf61e73a8af0-3eed2024dbemr2536981637.16.1794234817535;
        Mon, 09 Nov 2026 06:33:37 -0800 (PST)
X-Received: by 2002:a05:6a21:71cb:b0:3eb:b2fc:bed7 with SMTP id adf61e73a8af0-3eed2024dbemr2536968637.16.1794234817107;
        Mon, 09 Nov 2026 06:33:37 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b648e54de9sm1408883b3a.14.2026.11.09.06.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:33:36 -0800 (PST)
Message-ID: <2fc8f7ea-651e-466e-9346-c47e0a38c5bb@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 20:03:29 +0530
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
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <20261109-wandering-miraculous-mamba-0cf21a@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af1d9c2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=lXLgDm0nUj_2s8HzTMgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfXyj1SbyumD2Sg
 1wzIPPnfnsGL+arVDJwoasiQlP/LpDf8WYp70Q2YUp0AQVedaqg23eVfs9dr6lv1EW4cHbqb0fB
 TDPutKHkZfIQdPie7mcSkMZ7Uclp97Z1MB/EzyhSGhytkHk1hpXlHFGBipmP5awP+r02yKFFdBy
 UprGxm3ojK4LcIyofytZvqcpU1NOCL4+6DGaqOfnnDCODpLkZnKznr9hshGcsdD3BmXuts1KGvi
 DfmEYbjD/hJAP3WRQmj/7Fa/mihOtc5b9qkU4eglZhGSwPh+GF0dXOU6IT6k7M940QQ1MneWG3v
 3n+xyGECNFxmXtoXMdSA04gLEDBvuYA2KyomFkIzzQYUnc+HdOL2ACvn34/96K/B4HNyHTQrzDj
 3vAMfLY3/y0JVbYPZ8FFNOHPttIdv4GDEV2pp2+2lHlbH9l47IhZC6UqeHRPLaDOvKtXyhitDbO
 W+TqX8SK7aXYAisjeZA==
X-Proofpoint-GUID: IJac4JLNWw6hugXsf5l1K3LkPCSIo6RY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX56FsuhoCbGRI
 UuGKkCBQ4VMokBz2FYrUKCFjfFYPyMoVTvAQl/1ZEt4/eqPJWNk1L3XjG8Wwu+6DLCoD/E1cGQx
 5Bq7qpSAw4zM+jSpGnDhBghAbI6S4Pg=
X-Proofpoint-ORIG-GUID: IJac4JLNWw6hugXsf5l1K3LkPCSIo6RY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090057



On 11/9/2026 7:12 PM, Krzysztof Kozlowski wrote:
> On Fri, Nov 06, 2026 at 08:31:20PM +0530, Jyothi Kumar Seerapu wrote:
>> Add QCOM_GPI_QSPI to identify QSPI (Quad SPI) channels in GPI DMA
>> specifiers. Its value, 9, matches the GENI serial engine firmware
>> protocol ID for QSPI.
> 
> What is GENI serial engine firmware? How does the Linux rely on it that
> we add bindings for it?

Hi Krzysztof,
GENI firmware runs on the serial engine’s programmable sequencers and 
implements protocols such as SPI and QSPI. Linux configures the engine 
and submits transfers to it.
The existing GPI DMA specifier includes a client protocol ID. Linux 
programs this ID into the DMA channel and selects the corresponding 
descriptor format. QCOM_GPI_QSPI adds the QSPI protocol encoding 9 to 
that interface.
I will clarify this in the commit description in V2.

Thanks,
JyothiKumar>
> Best regards,
> Krzysztof

