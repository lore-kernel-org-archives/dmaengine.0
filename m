Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AE023392B
	for <dmaengine@vger.kernel.org>; Tue, 30 Jun 2026 14:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828154; cv=none; b=KlWiVSmxedcPJIIgWccFNbEshV/I5d391uFgByMRPSpY5n/nsaQV3ryCijwIjdIfZN841EERkNnDtk9EgD8XWmD2TUoz8HesnGDXJ95UAnEykoJWwZ8eRFDPQ0VESyTQCN8TdyQj+Ys0gJzOTwqCaqdWwa+TAbpjfZh06zyp+1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828154; c=relaxed/simple;
	bh=wFepA8lChInmQE7Qa7ZSldjWP0jFQi119n1G5pjN/Vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rJEX/PUsCsKAWWdVwE/G5i89P0KiFTeV1h1z3FAHs42REzW+ML7MAziONnmEyVg8GMI6moarM6U8M35bPWnxshuBxmZ4HJxr9qZvzVjBKoaMmOTAVJeAljphZWh4lFz811etV4la9mGGbROwWeWwxs6AyL3JDgJi3YfUyx4CYJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OLJe1G8j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ipa9ZIEd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OLJe1G8j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ipa9ZIEd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mrN41611705
	for <dmaengine@vger.kernel.org>; Tue, 30 Jun 2026 14:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZfQLMMjSJHdOdQ3Jm1HrpHymvX/x4ed75IUzx+Y/Zk=; b=OLJe1G8j2+rLPLkq
	rGD2eZB0wnyPI4cG1+Bp3SkmU1h53hXnTcXSScYoiKToQMemTQjS9KjTv0HYqilP
	iU3fBWtusysB50/wrDCK5VeVr+BTpmP0evfcHxx0yVqavVpfBjECoQL759UDkxI2
	kNC9ldybFv43iTtkhrEj8SsiMeaxhvy7xcFbfc+zVvr9bW5uyaqrYD2ZNN4amMoW
	ctcqUCs5YpBmPkbBSK2RDs3yp9CXG+Mvw7XLLX0JuYqrCUufqE+7by/Vlo5ULAeG
	2O7bb0s/5v+NGmLlVFWtF2/udhoNaXyQiG3TS1J988D9wSWm1+qtlEteelDti9Mv
	2a5A/Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gtyf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 30 Jun 2026 14:02:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bea07880dso8321791cf.0
        for <dmaengine@vger.kernel.org>; Tue, 30 Jun 2026 07:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782828151; x=1783432951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZfQLMMjSJHdOdQ3Jm1HrpHymvX/x4ed75IUzx+Y/Zk=;
        b=ipa9ZIEdySE+7lAXnD/HrOu2C/cwGFRMspAE8/xAnFiYAID4cGzE4PfYZgBFkSxA9D
         PjePFpo7fg7sXTsV4IHZhJcv5oI8K4zKHbpCqKMeSq/LGCWQT2t0sg2Xuv3mMTYUojIl
         4+sywg05seaYJEEqjYTDr0kYAZAdM2EC89xZEE0hJhdzVdX0VDHmGYGPv/Fe8zbejI+5
         00sPRAldyw7OoRDAiEZMVsFavgaBcR+LZ79QIFQaYcdGzaQAxz+ZbfLARbY+q4UpxsRg
         ePTSEyQmMI2fNF8QFRSiChKjTQgby4x+8dOS8EeQZ6wNlRLupTHWwju0OE+YETjRvbXH
         eN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828151; x=1783432951;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZfQLMMjSJHdOdQ3Jm1HrpHymvX/x4ed75IUzx+Y/Zk=;
        b=L1QfXn638BYICtTCqLteBiARWuiVHKU+D4mVQHATQEqzyijw5m5fmGqugf/6dC0WYA
         IIWr2l3boGSbZd2tvGF6PuQuRokkD0reFSRkGCEyL/SmJpQdATylXjVIZq7LAhIfF4r7
         L+ECEh6X3sYzsRvAd/fvSvaXxtfHYXeIPUDzRS1t66P85Zfqghx4qNKWmgipXLelE0n+
         V5JFFHEawtrQtyn/wU2HbT8/7KMTH+Z/cbGNwt8tPdXptZsYJeNkORBknukHBfb1EKIC
         cgogEvsPGU5G6p21u48RCaP5eYSZGKg4PQTbqvw0ONPT29oRWm/8umsEylA1TCxYBBxc
         NWRg==
X-Forwarded-Encrypted: i=1; AFNElJ8zAgWtd+xoOYt0bvSEvydl7lDT3ESg+lZimzLUma6kqSkWQ0PolEE/RKxcfq42oO4qS2XibO2jIHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlpLNV7Oyildx5bfQld/iwpHNW18FEMI5NUNxgOU/CExZ9v7i+
	D5zNs28ECB15PZ8WPC6iI8IoWV6iLK1uwutOnvHWqBiIlc3M7SQ8ZsHBSxcPcB2VpKhfhERqR+0
	7vKeTs8TrCTvmftUOsULuiTxqcZdB+IUgKU1HEDiMQQvAgt5/KCo7h8rXYxpasCo=
X-Gm-Gg: AfdE7cnpYNUK3LiYUdKRDSWywVqVtYK8CVaGPnMTR6KQOANVE4/7+rsSjzynMXf+ddh
	hV3kR6nNeAbZa3xzAjnLA7EUX98n2Z/77p6sc6olsf6fHdfABHAmtieK71yTg14g54J+sbn2Q0J
	skca7lMubYpUZ8xExn22BKEQHg8iCeMVoPgbZNVPMjsH7jdcizRIG92bOr9TKODHmi2PZ1jKr3l
	8Ol4lknq08zVuFVvEAgt04H3YivGeFwnOQwdfcgTp96j1dwKbY5rFRcDp+CM7v2+JMIpxSkW7q/
	rOTM9Gt2mW680QFE6H7WMm3bG1OJLCtNPt0LiEudPfqF7PstiH4zlye6uAMSoXun/OXz4Qzjy0z
	hZMm5yg+ZZWbBwgyhVAiRklTC7XW79ATOUH4=
X-Received: by 2002:ac8:7dc4:0:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51c1078dae4mr31674031cf.4.1782828098337;
        Tue, 30 Jun 2026 07:01:38 -0700 (PDT)
X-Received: by 2002:ac8:7dc4:0:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51c1078dae4mr31616421cf.4.1782828044057;
        Tue, 30 Jun 2026 07:00:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe4b1046sm607897e87.81.2026.06.30.07.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 07:00:42 -0700 (PDT)
Message-ID: <37dd1dfd-a3b9-4dfd-86d6-20ec2c80630a@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:00:37 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/10] arm64: dts: qcom: shikra: Enable Bluetooth and
 WiFi on EVK boards
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
 <20260608-shikra-dt-m1-v4-10-2114300594a6@oss.qualcomm.com>
 <64691236-178a-4fc2-a9c0-f053b7944e66@oss.qualcomm.com>
 <e11f57f2-bf15-4c06-ab3a-ab2843818a41@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e11f57f2-bf15-4c06-ab3a-ab2843818a41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMSBTYWx0ZWRfX4GwsWOKzkNS/
 hre9sQxo+yF9JdI+mhKgi3kzn17K0sOdYQ7tkkuWgCkE05o1vWdKhMt/MSL/M/magHt3AF8Dz2m
 FOGurYkLf2pXGUsh7FCTtoiT1VDKoPE=
X-Proofpoint-ORIG-GUID: UrqiLLK937HdVllsAWX7VgSeoALu6O3G
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a43cc77 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hCizUYdsW4M4JRnaFA0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMSBTYWx0ZWRfX7ic+0nkeNFVA
 rxL3Je9K01/rWxP/R6ASw7hZ+Wl7zn66fPTCFeamLohoEFTPQM3aFmxbWDFCLfWrag/piPgePA8
 P6L9Tna+/eYIbGIGVIn0mqgiuk5aT/5YPGDnjwH3pV6638GeQjjxsuguL5AfLo0x3l19sotaGWX
 sR7So2yVt5o2/BshmZ+XSQyGrUs7NJkgUg3TGnTPrssbpruhhQIgk7fggKZzPLneLw7ceF4yDZX
 SVHL7z7+yaIXAreaagfzIofcOWhINtP5il/VwdyhBzc7LIFiItV+TpxNDjlb293UfFeBhnhrAgu
 V7W475ot/woKCP+GR28e0kBKTfvKZbWWLB0WgveLzewjoRLLQRo7nm3wqDeG+kKUe80lm9wFPc0
 vXX0aRa1icu0vHIavibNqYYGaTCdZ/aQr8P9jyI+y55JrH4t3MxaWjze7TWRa9PXMV9LMQ9pBhf
 ZmS1f+5L04KBB/9xrVQ==
X-Proofpoint-GUID: UrqiLLK937HdVllsAWX7VgSeoALu6O3G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300131

On 6/30/26 3:34 PM, Komal Bajaj wrote:
> On 6/29/2026 8:04 PM, Konrad Dybcio wrote:
>> On 6/8/26 3:10 PM, Komal Bajaj wrote:
>>> Enable Bluetooth and WiFi connectivity on Shikra CQM, CQS and IQS
>>> EVK boards using the WCN3988 combo chip.
>>>
>>> For Bluetooth, enable uart8 and add WCN3988 Bluetooth node with
>>> board-specific regulator supplies across CQM, CQS and IQS Shikra
>>> EVK boards.
>>>
>>> For WiFi, introduce the wcn3990-wifi hardware node in shikra.dtsi
>>> with register space, interrupts, IOMMU configuration and reserved
>>> memory. The node is kept disabled by default and enabled per-board
>>> with the appropriate PMIC supply connections and calibration variant
>>> selection.
>>>
>>> Co-developed-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>>> Co-developed-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>> --->  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 59 +++++++++++++++++++++++++
>>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 59 +++++++++++++++++++++++++
>>>   arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 15 +++++++
>>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 67 +++++++++++++++++++++++++++++
>>>   arch/arm64/boot/dts/qcom/shikra.dtsi        | 23 ++++++++++
>> Split the SoC and board changes
> 
> Sure, i will the changes.
> 
>>
>> Should most of the board-level changes go to evk.dtsi, since
>> they're almost identical across all boards? You can e.g. simply
>> override the supplies in the IQS EVK DTS
> 
> For wcn3988-pmu node, I can move it to shikra-evk.dtsi and add the supplies in the board DTS files. However, this approach will be subjective to per node, as other nodes (such as sound) have board-specific changes beyond just supplies.

I meant the board-level changes within the scope of this patch
specifically, yeah.

Konrad
