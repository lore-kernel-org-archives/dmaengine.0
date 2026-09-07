Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E57A5013B5
	for <dmaengine@vger.kernel.org>; Mon,  7 Sep 2026 16:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797685; cv=none; b=dzWmeRpjWqYIwUOstVm5TQQs07fg7kEkKUYIcH1q4Uv/Th5ywIaLb88Cvg2sZxe1HiWpoN6tjGjJodvn0yTuUtyoiEX8fppJfNoMevYaCuk3TOAVecK+5weiwlhr2HxTY9ngEc7cxKY7EzAXd4bjyYgEDjB2snhVAtxe4X6Tvl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797685; c=relaxed/simple;
	bh=R6zZ1GqdN8b2QI5b7GbD3I6ihYPn8pV1GBzdNaupzcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uEKtsDCEilOG1RtXT4Rd5YC9cA1jdmq5PZWJE77DA2++SZIThCgO7oYeraDTUfBCrVPxmdP3DHJL7D4dF2n+jOuPJ3rVzCGqVW1NesCkvuhYIpL5SYkQnFBMGJhVPlPHH2XU52HVvsCHqiEEZhwrxMUAo8j3/bVRFtR55Ga1hN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+H8o/WK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VSKtiUl3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+H8o/WK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VSKtiUl3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdQxE1183702
	for <dmaengine@vger.kernel.org>; Mon, 7 Sep 2026 16:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6uLcqK5uULEGQ4WGjSoAqBJ6fj93DmpH8MQ+/pNb2Rg=; b=S+H8o/WKI0ZDTrks
	uCwh5gCR8qKWvZy3K/SC7bqaDGgSFOzMw62kUahciVWtVnFbrrXOYp7SY8DQ0m/S
	xs/7c4VMM9aM03CGR81f3e/H3uL0eGooz6h5I6RBnmXDSIbdFoBGj22XAsiHldyl
	IBD1LCyeGGdqebthjCCidf86ZAzza6Rftr5nz/jRnn4LPx+oSK0zS4tSR3R0BI49
	BggvmhI17P73ErED+0U2uRWselHr9VYmYuxCNqtcWEQUyMthSKby8njN5smT5bEg
	IX5raYVSXzECSRePXK765fH6L6ClHauKrYIeTiNqPHHjc3evzovQOGP84Da+nbb2
	DyiJUg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghruaa6bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 07 Sep 2026 16:14:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6f73d0f89so47644985ad.0
        for <dmaengine@vger.kernel.org>; Mon, 07 Sep 2026 09:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788797682; x=1789402482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6uLcqK5uULEGQ4WGjSoAqBJ6fj93DmpH8MQ+/pNb2Rg=;
        b=VSKtiUl37JV6aIHuoWW+SALZvcLeH8pW483/3kiSx6ZGYEqFKW57nSp0ac2ILtxxOf
         e2miJn/gTx4bmUq81E4lyk3VY0etp+Dsj+DonpBrmEdqnVtb9g8Qf6u02RYeJLHTuAKz
         Cy1UvaFTaz0Tndjtb0UsQu5+972kn9cFe/bRYrAx7Dub9MLJNGfV+EXetvk6Z07MKDSN
         uzLjnD25UPHUnjwXTwMuXy1aCJjJ0j732AJRJh4AYBxcEpKhKG91cQBrGxbkm6P6iu9g
         PJal2CurOQFkxRoR5Qo6zVc6TOwbIAWUmAetgwxEVImdmQKXMakAnMd9setr2j8htg3i
         GKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788797682; x=1789402482;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6uLcqK5uULEGQ4WGjSoAqBJ6fj93DmpH8MQ+/pNb2Rg=;
        b=qmz3OBj/5yekiWJ+TtP9SgRtWapwEgHMmml858FqULE4QWOSJpITQ0wEkLttoX0ANm
         hbUgnXn/bwxX1MM+kVf0cJa4Qre+bCL9k3j10PONETNaC2hwdm2sK4F7AigfMJRPShuj
         Sb5OV7V2aoDV8d/CfilWEQl11iZ5sIZNF6Au3Nn5gu4Y2CYjno3KOhI1oYYT/GQjAkLM
         d7um5sWtvSJw7ue+RwlaDbCWHGTWm5t8/Cr+cYPgTrfqOB9BXya10wGAi9mGMmA7vquu
         z1qLxUTnbqzTym64O53fXSwFGGBsD/ZJR83fnJZ7G7m8akF9VGuKMfuEBCXY7/v2d20k
         LpEg==
X-Forwarded-Encrypted: i=1; AKwUvBwknFkTZ0Vbt+Mtpcx0SVmanXndgFuCF8HNP0wQTIFrj5SUd0D0cgbwMofd4+dpZnFp3tsQQ/g0DP0=@vger.kernel.org
X-Gm-Message-State: AFuF++nnI0hvGjMTB223c93bHjKAspJAoWFUDDv3k740Fj3L3qZ/qG4s
	slkLdw8C4j5HQ5UGxYdf595r76fiP7Uq3erA0We5uIt5rPSMnp+Ew0yQFjaxO9f/HWYbRkcZMKN
	z2AEHa9YV5PHDeHzK7aUiCuwftMjR1vnUx7JRgod/05HxSHMa1GkcTxdeBsnn+a+0CJDNb5g=
X-Gm-Gg: AYBFou2K14E12HwSAo8GXyMXP1pXKyz8ssClLIPXyGFkoR12B1CuNp4FyTtZU8OXDr+
	nV9xH0A2VbxH+tB6U6H6eWcoNO3+P5C/wwepDfqdR+mjuxWSBTyG0/DUJQP7WFrsjrC5z7vQU/m
	cAj3zC5gJt01wChtSNhCcw+Hyf9dT3DIVL2ViMTqVoIuYk/2NZVkXn+JN1DKI31lo+wSYZk2gLZ
	27lq89fPKWc6cz+upFoyZryDSOxK/WEMNM68DHEcSVtHxOUArCVDD689BZOD99eAvLPg3JMtS/O
	TNJP8zTS8cgBYy3PmqXVklECIJZ675/ZbE18oZ7fXmbffOEg25yZiQLHNwJFdKJPecxbhYR6L7k
	P90fVda1sFhovo9wlCd7/g6qZHuRdlVBuahGOeFZzqGTU
X-Received: by 2002:a17:903:1a28:b0:2db:31d5:1448 with SMTP id d9443c01a7336-2db31d514ebmr203964405ad.22.1788797682649;
        Mon, 07 Sep 2026 09:14:42 -0700 (PDT)
X-Received: by 2002:a17:903:1a28:b0:2db:31d5:1448 with SMTP id d9443c01a7336-2db31d514ebmr203963655ad.22.1788797682186;
        Mon, 07 Sep 2026 09:14:42 -0700 (PDT)
Received: from [192.168.1.66] ([103.172.5.17])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bbf1feesm29345580eec.26.2026.09.07.09.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 09:14:41 -0700 (PDT)
Message-ID: <dd66d593-2601-4749-a21c-5347a8f1b6eb@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 21:44:38 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] i2c: Add I2C High-Speed mode support for qcom-geni
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260824-i2c-hs-v1-0-8dd94e5c6113@oss.qualcomm.com>
 <613960df-3d3d-445f-9533-57257eb5099b@oss.qualcomm.com>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <613960df-3d3d-445f-9533-57257eb5099b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 24g1BilCVqV3lXwj9Y0SQiVgxNJaiJBn
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9ee2f3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=tPI8lZtLbYv5uT6OEmdSlg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=PAEdTZexspgVwDamPmIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 24g1BilCVqV3lXwj9Y0SQiVgxNJaiJBn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE4MCBTYWx0ZWRfX+i/eLlIB1x3y
 O85MfoNged9r9x3GO8h6kCR21DRZBQAYUuDFgyxj6uoSazaqIiIHme1X6VR1fmOwjKSp81yrFIb
 q/hQoPLv5SIzNsx6K3vtX3LxMg26Fi0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE4MCBTYWx0ZWRfXyjiDbbSv9fU6
 ngdeh7kkOX3SZzYBdjy/H1myzODkagBn/UYhalEfGcFSjH0Rg0KOpzJc8GXTVkrhRyLo2Q6cDeX
 tfkP6Jv85BzdLS2HQ8ewfznjnIDAHbjMHVRBpzFnHd2DQksulduIUNeMgZuciz6stBwRYgu33O6
 FuaeCdE21exu7UFpLy9ivLS89YO83mWR0ul7vRFyKqU8OnFoAAKIT3KRhGvh/t3FJypL+ljykzJ
 n7+ExJEl7dxuqGKhdjUhpC+PVMWDuOvQTdNaKfXDXz8YcgEDBcIC+142VW5975qZcXpS1pXYofB
 eBHlLHYoIFSsrzKmrPdmsLx4Ce6Cv9Uoiv3acActcQqmXKYFxUWjl3y+GifR2PsYHmuI5pKdvme
 CF5mNxNvMUee1uLnmFNGYGq2x3Nskblp8sBOIPEgIoiKVfoywtlMNnkSQhPamaQG7DmKk3krI86
 HCY3SqLywXkOi/ORxZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070180



On 8/28/2026 12:56 AM, Mukesh Savaliya wrote:
> 
> 
> On 8/24/2026 4:55 PM, Jyothi Kumar Seerapu wrote:
>> Add I2C High-Speed (HS) mode support for the Qualcomm GENI I2C
>> controller, detecting HS mode requests based on a 3.4 MHz bus
>> frequency.
> 
> what's the detecting here ? HS mode itself is 3.4 MHz freq.
> may be you be you can start with current support freq modes and not 
> supported.>
>> I2C HS mode is supported by the underlying QUP hardware starting with
>> QUPv3 core version 4.3 (per the GENI/QUP Hardware Programming Guide).
>> This series adds the driver support to detect that capability and
> is this detect things repeating ?> enable HS-mode transfers on SoCs 
> whose QUP core version meets that
>> requirement, rather than tying HS mode to any specific peripheral.
>>
>> Patch 1 (dmaengine: qcom-gpi) is for GPI DMA transfers and adds
>> a CONFIG1 TRE to the GPI DMA engine to convey HS-specific timing
>> parameters (tcycle_cnt/tlow_cnt) to the hardware.
>>
> Patch 1 is to convey config parameters for HS mode in GPI DMA tranfser.
> 
>> Patch 2 (i2c: qcom-geni) handles FIFO/SE-DMA transfers; It configures
>> the GENI controller's source clock and timing accordingly, and adds
>> the HS-specific FIFO/SE-DMA opcodes and master-code preamble needed
>> to switch the bus from Fast Mode Plus to HS speed.
>>
> 
> Like above just say high level in short, individual patch will add more 
> details in its commit log.
>
  Okay, i will add the below commit description.

The GENI I2C driver currently supports Standard (100 KHz), Fast
(400 KHz), and Fast Mode Plus (1 MHz) speeds, but not High-Speed
(HS) mode (3.4 MHz).

The underlying QUP hardware supports I2C HS mode starting with QUPv3
core version 4.3, per the GENI/QUP Hardware Programming Guide. Add
driver support to enable HS-mode transfers based on that QUP core
version.

Patch 1 (dmaengine: qcom-gpi) adds a CONFIG1 TRE to convey HS-mode
timing parameters (tcycle_cnt/tlow_cnt) for GPI DMA transfers.

Patch 2 (i2c: qcom-geni) adds HS-mode support for FIFO/SE-DMA
transfers, including the required clock/timing configuration and
master-code preamble.

>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>> ---
>> Jyothi Kumar Seerapu (2):
>>        dmaengine: qcom-gpi: Add I2C High-Speed mode configuration support
>>        i2c: qcom-geni: Add support for I2C High-Speed mode
>>
>>   drivers/dma/qcom/gpi.c             |  54 +++++++++++++--
>>   drivers/i2c/busses/i2c-qcom-geni.c | 133 +++++++++++++++++++++++++++ 
>> ++++++----
>>   include/linux/dma/qcom-gpi-dma.h   |  28 +++++++-
>>   3 files changed, 196 insertions(+), 19 deletions(-)
>> ---
>> base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
>> change-id: 20260821-i2c-hs-408768509865
>>
>> Best regards,
>> -- 
>> Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>>
> 

