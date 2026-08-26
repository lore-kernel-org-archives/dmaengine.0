Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BF726CE05
	for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 06:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787725387; cv=none; b=dTgNJITM0h/wccw/4+i0Mm5/8d4p0JntqVN7MLbS3thCUbg9uN1Rc/FVrU9OQCn4MTn3Iq1CbpovdolUlQ6QazOzF1aQxAc+0GLGTiv/pd8L6QHiwBFSshxckoq7HccEZaW965z7Ih/d/hv90AOzahMqq59+Rq00QHhh4v8zUqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787725387; c=relaxed/simple;
	bh=3QXEOD1U0Uh36+JdrBhCR7dYz6qdtWtA1IGp7Le5Eoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qIsiLTFglPLp4oiJnXKag+KerRGTkbEWj78oaZ4onKe8iPJsJ7uBTAbmFrZkYzIhOuZUf78rIBz8nAIVsX50Vmyu/rdfqYvHoxSm0zOc1008PiHnCYIXiOVkKqxVLM6qNWb0WRJI57Tjv7JQe8qy18TVYxTpVfVsGgOoZGWbbrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=esGKyVSN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fK06YOCD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="esGKyVSN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fK06YOCD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q3HDWS2795228
	for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 06:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fSehP9pZmD6wqvYGE1qE9kdYqMW6BBNpVtJye0hLCEE=; b=esGKyVSN8q/2O83j
	6R84fIT6T1X0bT1SHeSAvXe5GWsvvvtzlpigYTSWCXYSVYcAVEkSZlh4KDJ/ylTU
	SStGXchTjIpaLjW8Q/KUMSiJ2cPFPH6iSI/ZJzWgKWthHTn7Wsez1Q7vw5l6jUb2
	7Dr9HkPLHSqMEVWteHEJNCdEO5j3DGhsJCtBdTYmyQhbTRDAHLeBnmqghSL0sAuA
	Y3q7Qj8pAVOVlacYCS3oUZzJWxS1Bk0pcD/gWYqP3KnAX7eZpHcYN8RRlPEaZUxV
	DitantqsECNbccyvKFt256fxi4BmQcuOUBQImsHeVSlR5OVrUCe7+OfOeua7xUU/
	0+xZBA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgrabv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 06:23:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-396638f9a18so1225153a91.2
        for <dmaengine@vger.kernel.org>; Tue, 25 Aug 2026 23:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787725385; x=1788330185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSehP9pZmD6wqvYGE1qE9kdYqMW6BBNpVtJye0hLCEE=;
        b=fK06YOCDMssTBoH4z0zFjhoHyUaEA3JFNs+czwuPMyI5z3PNI2yhkMHG9166oHCw8G
         NQQP4dF43nHTLOin8GZwgy4NyHulglzDuu9sEs4UJ5hw2qpvQmozLC6PcLLBxXrUnOsf
         B66GhNhbXSReaa4CKIzKCSCAA/GhG4D7+eGMHEwyLBtaYCxoiMMCjHQPCPalz20yGNFo
         oQPI+bllXwvJ6B8bo4ZxCTY9+zZtw6Ghdip6IjUzqdcM/P21Ti5XFZFeUYv2NZnKT4cl
         sXJ2g/DqtJdOcWkPApNLl7CEYAN2Syu3SOgfYlYGo7Ag7henSFHwwQDRBR/5DDZjerVk
         jyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787725385; x=1788330185;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fSehP9pZmD6wqvYGE1qE9kdYqMW6BBNpVtJye0hLCEE=;
        b=bi7xd6juNoSkulTagd5IAtiHE2Ru2DL3Hu/8ps0RqiU72/dJE3LyGqpCDqx7xfAiHI
         oL5eeaUnm2GyqI04gQz731qFrRvOnitAJ9AJ/PVVS68Hv2cfH1CdKAd06HJjxsKwi6Qw
         PYWWqXWm+JL/TNmwpXClEfdEuPDNkszTO1uNpeFwfeKpkWl/Yp5Y0s46OduBUcpwrr61
         katWIz87eC+dYUMO0UkScAdlJK0GdHleGAmi1V1WCfiEtAryIR/gcG824Kc4fwcTacYE
         Tw5lxvFj8gtEBRY3KrieaX1TC/6+4/+RtDHUHHtvbi+6tcmDyGURZLii9HNN5hlEakqf
         Kdug==
X-Forwarded-Encrypted: i=1; AHgh+Ro0SbDIShDClOo2n7N4q+wUtX1WQYCezcP7XQLUL1EsmNrs1vUVsL41a+0xk3e4gbNIjJQAMJTfvoM=@vger.kernel.org
X-Gm-Message-State: AFuF++nIvx2iY+LXmML/NYkEEiKHVckqGkXdkf7JdGSkY/X7RRrIn5Th
	251I4toZLXQpuapXvn2IaKd7AvEaV5YN/ZZqJbUhhNhqr3tdWGIe5LBiZtzS9DfxyCfv0dxb862
	Igc8Qm174BRIiwzJ1hs035paE3L25GBJJFaXgxj/dyAq3sZ6tkUZn9f72ahcxUSk=
X-Gm-Gg: AR+sD12TCWyNdjirdy0yqKkv8AT/B0eliBpm6GdN1yHkvJkybDYH/ClCF7y2qYu1CdG
	9OwItlYBd8uXFTSJA2UK4S7zY1f0BXHhI6F1kISS44xaYW7msGMZ1APTnDp/q4E9ax21bdMoyja
	t1JHZdXJh6Zq5aghiS/aNUMuNYqn+/X9mXtE94THn2FMBZzzpFjH++tkiSznvbrgBue1nNduRbp
	0GoHr70G4i4VZ+UHAGjumjkp37vTiilNEtnZl3qDXnUljEqfSUKsh/EhxsynYnoS+zCsJoCm8/O
	O+sPd7IKZjYKoJsk8/UUNsfJ7hiyYN9frWjWFo8AKPf1XJzZRu3Ztadxmm8FJtUBsX24vQXC+gy
	MKkIANvXzrvczjGMfARV40zujBxGdfl0=
X-Received: by 2002:a17:90b:43:b0:393:1cf4:d972 with SMTP id 98e67ed59e1d1-3966d160f58mr10170212a91.3.1787725384735;
        Tue, 25 Aug 2026 23:23:04 -0700 (PDT)
X-Received: by 2002:a17:90b:43:b0:393:1cf4:d972 with SMTP id 98e67ed59e1d1-3966d160f58mr10170110a91.3.1787725384241;
        Tue, 25 Aug 2026 23:23:04 -0700 (PDT)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eefd98sm8837621c88.3.2026.08.25.23.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 23:23:03 -0700 (PDT)
Message-ID: <cb9a4cbb-b90b-4575-a08f-9695ed4c3461@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 11:52:59 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dmaengine: qcom-gpi: Add I2C High-Speed mode
 configuration support
To: Frank Li <Frank.li@oss.nxp.com>, sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
References: <20260824-i2c-hs-v1-0-8dd94e5c6113@oss.qualcomm.com>
 <20260824-i2c-hs-v1-1-8dd94e5c6113@oss.qualcomm.com>
 <20260824113653.402771F000E9@smtp.kernel.org>
 <ao37oOa-EkMe5qXH@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <ao37oOa-EkMe5qXH@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TKtrwNjQT-iTJC8v2y6qheq2n28vHW9n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA1MSBTYWx0ZWRfX5eA8CWUm0Suu
 HT/eVkSoKM7NDbIOpPmPmX7XzVEjgfZC9HROH/ZmO+62l8qWWlvIDTZzkkcyuCDdTK8XVuS9yPu
 qpJPZ4KA9eIazMh3PFvY3F15+7vHuAMXHJviHa0vSUJO5X/jSy20g2isIxXH/E97bpket3ShDK/
 61OaoliDGP1v+a4bBrVTzrnr2x1aDd87mGFfCe2V1DvkMCY+Zg7eItmBP6T5bWK+hYx//hLpWDq
 aehgc6H0+6bZhDeIU45duPYZj0Srrnb4fddIzyhHWywuTAa6MDNSX3XBol9+kbS9I+TahpCsKBp
 Zl57mjge+JDEhK4d8R5cU0H9wcDwde4YmscHXqB9k7PQPD2prtJY4hsto4r6mfXdd1JRX/+HYgf
 YN/PbMZ71WXQq1kC8hbRU6w/9evSfpOj/lB+3xHzUUs9X6pPK+jmxITS0ySkygMJpqteALHYwBB
 x4J5+4Fzb5oG5HBPY0Q==
X-Authority-Analysis: v=2.4 cv=d8LFDxjE c=1 sm=1 tr=0 ts=6a8e8649 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=sfN08KZEuhO3BiQOocAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: TKtrwNjQT-iTJC8v2y6qheq2n28vHW9n
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA1MSBTYWx0ZWRfX8+JhtVUj6Ti2
 iswpOzY2lXN1cNtuIbg6sm79VpcKI+lOmKVdtJT11MBM/heYpOoyqF7kg/YCBI7kTowrGQGHOi9
 uxNB23NeX5Yt9/NjVeKrDO5jTfas6Tw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260051



On 8/26/2026 2:01 AM, Frank Li wrote:
> [Severity: High]
> When I2C High-Speed mode is used with both set_config and set_config1,
> can this cause an out-of-bounds write to the tre array?
> 
> Looking at struct gpi_desc, the tre array is statically sized by MAX_TRE,
> which is defined as 3:
> 
> #define MAX_TRE 3
> 
> struct gpi_desc {
>          ...
>          struct gpi_tre tre[MAX_TRE];
>          u32 num_tre;
> };
> 
> If we generate CONFIG0, CONFIG1, GO, and DMA TREs, tre_idx will reach 3
> here. Writing to desc->tre[3] would overflow the array and overwrite the
> adjacent num_tre field.
> 
> Later, gpi_prep_slave_sg() sets gpi_desc->num_tre = 4, which would
> overwrite the first 4 bytes of the newly written DMA TRE, potentially
> causing an IOMMU fault or bus error when the hardware attempts the transfer.
> 
> Should MAX_TRE be increased to accommodate the new CONFIG1 TRE?

Thanks Frank Li, you're right — with both set_config and set_config1 
set, we generate 4 TREs (CONFIG0 + CONFIG1 + GO + DMA), which overflows 
the 3-slot tre[] array. Will bump MAX_TRE to 4 in v2.
