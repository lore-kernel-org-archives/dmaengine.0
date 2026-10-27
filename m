Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082140;
	b=Go0WW3t0knGmOlv3M0yHZinMxq/kscaaXxNBva0MZZQZdktUMqyKJbrZfvKqy2gzwkNQ
	 jru6xDu6W3G9py/anzTRNzxZ4e8YCbyb8Y4ZD7nLtfPwyUtFft0Ug7tulZD30kren8BpT
	 tabmGQNBxaY0oN/P3kzTxgc1g5plhat3n+n7U1DG3GHTj3LB9ABuvvrKmu4w6o4Xr7apJ
	 AMJ+T7R8d1ZVgKjO3SAtQCK6K7upeGsvtsmL94/8arcJLurmvZCvvH2zwv1Q+NiJKni58
	 g0/ZNAUMJdPITVF4pC0p8AQ1j4GHtgOpmmvlvo7KOGP2o5xLoYQYbwCib16Tpom81bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082140;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3DEgTjuDhhuEXL4TE31CFFCK17KZAnBoVPM6KBDmacw=;
	b=k5fMptQuosUTSLTk9CScQAxZHEof6pDBNoQ7016tousKnOjW4i3U2+Hyr0F16CZzO1e1
	 EI/l8M+WsGGonM7UZaKU1wxV9m+8+308pWOOBgp8LKcm4y7BrPm1g2eTcDQRDN6l+I7Fq
	 1+43Ep8/6nmqq85fstGlR6hpHpbUlKbmfN7gxwi5WNevVmIGiKk5sf70J104+POx/ojwY
	 EqwIil8/0Bt23SWeGQUKg5RfdA4BPlaiQNI9lQrMuH91e8e9uiUFPrQRDN1QyYLiIwBGq
	 8T4bHv6cWM6f3lj9mMtzFxSAt2S4tBv0suySpAd1N4JSkrkaIbkpm10rZ7NhqsWhraA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fo7AZp6f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OIG68irW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C7D606A326
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 06:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56C7D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fo7AZp6f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OIG68irW
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5Z1a31244937
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 06:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3DEgTjuDhhuEXL4TE31CFFCK17KZAnBoVPM6KBDmacw=; b=fo7AZp6f3MxcfLqm
	cmr8GEfUPncYo4l+FTY1si0CTrFwIxCyAIujaHf5lhwiBJvJ81GX5rKkSLxVliOb
	c9DREBO2BLC7X15GM8aXZ0iGQ/m9VqEC+Tg7AxNdJXmewMFmvzKj0b9w66KI8Elp
	ou86K86hBNNMTnrVDd/NoMbAUrn6Rwi0h/A5+ez7xAi8IcqldGnQ/WeF5RzPXTyr
	uZTS0het8nc6cOgIonhhEJ4QxMx7U1Gx7KHb43mWKPqYGSizskB3b0qUVH0fwAW6
	u9VAFchs28V6oHADq9cdZZjq0Pp49xohXNa58S1AZXGJBvvQ6LUDRfDuZRviF2L9
	4C0ozg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y3wsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 06:22:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e987ec84afso38964415ad.3
        for <dmaengine@vger.kernel.org>; Mon, 26 Oct 2026 23:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793082138; x=1793686938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3DEgTjuDhhuEXL4TE31CFFCK17KZAnBoVPM6KBDmacw=;
        b=OIG68irWumdoQjVhk0a2wDNij88TpZiTY4EI/MU9tLqDvuS0I6/q43D7OXY4aUXCth
         GdZhwoWyARcBXIEodIdcEXuxbxgDTAjLYGBsGjp7BlfbjSYG6Au9PHa/blZXvz6MIhsH
         ViOOMJvQw5cM9CbPFyAtzSYOOw5bfBjDUiMvczu+WFguRIlkLdr7xAj1cxCCCv1Hq8WQ
         MrjlbKwi8ZUHo8anZqd7LuUSdr8YNALXZ2R2Ajn5vFlOx4iQ4jTqlTaYy8EnWYHivTd0
         jpjkrOOivGNyx3W2qDBTVUPieIpR0NChp/ZihVpC2MGAwHzvRaQQ8X59mpxRAUmyB7ug
         hkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082138; x=1793686938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3DEgTjuDhhuEXL4TE31CFFCK17KZAnBoVPM6KBDmacw=;
        b=pYPkI5rEwCyGRiWATUMnLPcsRKMIDcfSORY0Y46/wq8qDIFL0Nc6MDlRMTYcM/WN/G
         xtEKrPlaruE5rbArMfYZbKsTJ+U0ZclJVQeBGMP8wZUkvgPNP1ZOobNgwq0cufoJLPLb
         NfnTjMFVQDmttGu4u1AwP2HINHEd3ljs1fCcljNs89vN+UeIRqu9YHhuoRoYZ6t6NtKQ
         pjJEiO5fEKL/63P7oWbDYN0hO8BvlIA4RJ+oG4yGTek6QU1BIxGjOn9RNha5onMgrtxh
         W+E1Oj25L98QmYG/7P0CCnl54o301TUXd+ImcV2+S/m98wfCQIgRjvY2wdaGbgtuKDFg
         pUKQ==
X-Forwarded-Encrypted: i=1; AKwUvByhdwNAU38at4NlYsYNUvOArXB5VZPrtyvVMeJuN+63sEoyq1MFOrSn29Mtg27n+Zc9Sy+Sg+hbel4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/KMJzOppKpQktX4pBvbTcaDvGSVEb6OcQTFhj959S2ZtM6EvG
	7WWPS4A4FmszI768YF553O0SVzbt8weJUuPur3Z7qCpGaRSCfCN7BAjj4HNtxLmvfQwOoVAcUf/
	4yYaaPtda8efXo87/T4X/CjbppiweH3lTpqyW9jgQ9SEoa9EmdzYvK03NUCAMnsQ=
X-Gm-Gg: AYBFou1KrJ372m29Day/EvCqJetvNXqykF0CaG9c+ZcChu4L3PVQ2yv2G5y+mO6A0uI
	opdDScXMJIehIseH2U7rcGM5/RsfwI3ibMKPd/j67h2mryckh2jtQBD0byMJS0drLFhOk4oBpLc
	7uYVThSbyAJVUh4Cz3QNGbnD6Ri7jE4ok3ifIflqLMmkMGlQSyAyv96qG45MkDq/huC+GYq9XLW
	RR2nmQq21ePBc+RaeIekw+S5HbMtfVvnr79OFQTjI0LqicsdQ4Ib5Ntap4A38EvE8Kt5TAmh3PH
	+opK5NQ1Rz7JrtJ4oVw+XCClIUYECw2zXE5c8kiYMXuTilkAtsNKL+LEan53BTpQDvGbXtW1vid
	f/Y7KKKVVL+Z2a0UXN/3UVFPQaGS4RGp7
X-Received: by 2002:a17:902:f68d:b0:2e9:a090:dd80 with SMTP id d9443c01a7336-2ea9c69710dmr72075585ad.22.1793082137691;
        Mon, 26 Oct 2026 23:22:17 -0700 (PDT)
X-Received: by 2002:a17:902:f68d:b0:2e9:a090:dd80 with SMTP id d9443c01a7336-2ea9c69710dmr72075355ad.22.1793082137217;
        Mon, 26 Oct 2026 23:22:17 -0700 (PDT)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b768ffsm4003565ad.24.2026.10.26.23.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 23:22:16 -0700 (PDT)
Message-ID: <92dc14f4-edf3-4112-88d3-1b93aac677a8@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:52:11 +0530
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
Subject: Re: [PATCH v3] dt-bindings: dma: qcom,bam-dma: Allow memory-region
 property
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20261021-qcom-bam-dma-vmid-ext-v3-1-299355e8dd3b@oss.qualcomm.com>
 <20261022140139.GA952798-robh@kernel.org>
 <adffece9-165b-4576-b111-6aa40a443734@oss.qualcomm.com>
 <20261026130559.GB3598537-robh@kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20261026130559.GB3598537-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyNSBTYWx0ZWRfX5vWlKSW9beVQ
 3ULZiDZmOldXKYrnfykocrCayNor/Q2qUJquTIvkHQ2/hguL8GzbceultH9GHexRuzp4oHoqOnW
 oc/LMEZ1xK4/ej4Bngxq37XTBPmbGho=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6ae0431a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=zuAiZn09hdMMTQJ27doA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyNSBTYWx0ZWRfXzXrgIxbXZbFh
 4/E0RNimk+mgE0eQnbuyx+qLY8K7PnOSg7K7+jZ1u/uDsxclzQmTj8vMKrjee8WI3UO9AmZyjh/
 IjeBmzxGywQBkgU+e821Hwa5yHFuF5rs93T1BY1DBjdubo/QE9CE//sCOq6saVg3ufssnDHUrI7
 WTd/axhJHj0n9dKZnuj3VoJtaEdO1Nr26/xQATl2KLuwYiiYMo8gDAhtaOUFIAx9weebfwrI3Nt
 qoMJdBPYneayI/YV76zNUYwl+EJ+a3Rc9hVgyuJtCw8xM2ymVojW0ZUAD3qXLJK//dkGuJqLFhO
 nEzFh0LvUHfQ0SPl97xr8kaEIAyWk1IFdkfqVQXLjZg1eTB1DB8LcgOMo2l3SusHhyEFDFau5Aw
 izOZFgpvvyhAH1CR4k7mqphvaEtonXP56yiBp2f5XVCmxc+ZtRBgIvJjH1xTKf+ELjlAKbxiuAO
 hS6EH5WHeq0PMRl0DVw==
X-Proofpoint-GUID: oYl_WLE3Jud1lHdTKW0tVMd4utWpHGpT
X-Proofpoint-ORIG-GUID: oYl_WLE3Jud1lHdTKW0tVMd4utWpHGpT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270025


On 26-10-2026 06:35 pm, Rob Herring wrote:
> On Fri, Oct 23, 2026 at 12:05:50PM +0530, Vishnu Santhosh wrote:
>> On 22-10-2026 07:31 pm, Rob Herring wrote:
>>> On Wed, Oct 21, 2026 at 11:22:35AM +0530, Vishnu Santhosh wrote:
>>>> Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
>>>> domain, preventing it from accessing BAM descriptor FIFOs allocated from
>>>> arbitrary host memory.
>>>>
>>>> Add an optional memory-region property to constrain DMA allocations made
>>>> by the BAM DMA controller to a restricted DMA pool. Access permissions
>>>> for the remote execution environment are managed separately.
>>> dma-ranges is normally how address restrictions for a device are
>>> defined. Why can't that be used here?
>>>
>>> Rob
>> The constraint here is access permission, not addressing. The modem can
>> only access a carve-out that is assigned to it through SCM.
> The reason for the constraint doesn't really matter.

Ok, understood.

>
>> The soc bus on Shikra already has an identity dma-ranges covering
>> 64GB [1], so there is no addressing limitation to describe. dma-ranges
>> does not reserve memory, so allocations would still come from the
>> general page allocator, outside the assigned carve-out, and modem
>> accesses to them trigger an XPU violation. It also applies to every
>> device on the bus.
> It's a bit awkward that dma-ranges needs to be in a parent node. So you
> would need to put the device in its own bus node. But if dma-ranges is
> in place, DMA allocations will only come from within that range.

Thanks for the correction.

>
>
>> The A2 BAM on Shikra is not behind an IOMMU. restricted-dma-pool
>> provides a dedicated, per-device region, which is the setup it was
>> introduced for no IOMMU, with firmware restricting device accesses to
>> specific regions [2]. Stephan suggested this approach on v1 of the
>> BAM-DMUX series [3]. The BAM DMA controller and BAM-DMUX reference the
>> same pool, so a single assignment covers both the descriptor FIFOs and
>> the data buffers.
> I suppose that since the memory region is dynamic, 'memory-region' makes
> sense here. If firmware determined the address of the region, I'd
> probably feel differently.

Yes, the region is dynamic. Thanks for the review.

Vishnu

