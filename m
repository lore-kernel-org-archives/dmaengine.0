Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067331;
	b=mZnMqe6u3cSnWJjXk5bFRGvR3adcNBIy+zGM0dB0yGyPo6yXvOjJKIqula1NfBzYIX/4
	 WVwQgiwLxkdhOFetGn1PXiobJVlJ72UXaGbsOVVvKO5HF+7nH6Ozc/cALiHwk/GFD6U9f
	 vktQ/1jT6dM1ZLgmwzRUZti9bd6fgGvBh8JHxRQGjJbmxIEPgKwTZwO7KxszPNK82V4Mu
	 3dcl7XrADpydwoEKZR0Ix54p2GS/DlqG1/2zAbXHwZ9BVRlCWmK3wf7r5O7X3dr48dVZ+
	 YD/Uqg174cvnYU7KuqeYjXxp/m/KOzsc88UInAQ52wRrC+fi8TnpvvS3E929C91vwMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067331;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VdoLFRRCMbzsXoBB0jDNzo+q1T8getBoT9tEw7XizgA=;
	b=j4BTCnd2+ZBSTNIkrvQUkMjg+sDl94mHBELH8eIQJJMft7OwgNYDBOaK+LrJSKk2AiZ1
	 pv7ks8UuZeYixSy1KvSZ0h8X+WGzOFvk8B/IKdMVUm7ocwRzZne1RcqYCoYUBI9+8ynnW
	 2KJfsTvSliXfa6blulCp5BsEpTR8KAW+gc2UKsCELUNcxiWURU+mLKm3geadX6C52mReX
	 L5fmPDDAOE4vWipSi6mnHuVE0SA1jqAbckMc3/hKZDWUNPQeklKl+NjLA+9Duz7VKJuT5
	 zkrGPhpFn8tTrlJL6aASFdZNkSOqBIXdNTRF9zfasG5gL7dfhT9nl8+uAI5ANENaDpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="eMZy01O/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QGDi5e+3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB32D606A320
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 05:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB32D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eMZy01O/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QGDi5e+3
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1BE6K3490773
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 05:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VdoLFRRCMbzsXoBB0jDNzo+q1T8getBoT9tEw7XizgA=; b=eMZy01O/FU3lmkE3
	rEOy830X9WChu8LeDpAGd28jo+Q15N7GHhAKCCVsni9l+Z25K+luj5Fl1bBPIqxL
	3D2HjqTivizmvBtx5ESJSCw1zjYWj5BlLIb3yR0eJ33Ri20pY1SQnO2f++nvQ7p0
	hMb+OhUoTimDuAYL4tgq4r608yGokDiuo8LxWD6A7AGgC0gz/wjmlUV3WXCWaAXC
	nkJHbnA3JCiK3/XFlh2cpuGQcNuQnb5c4HrxYB027C5cY/bZ559aNm0G6bHZMaZd
	im9ApSuUpgO1fo3NNHEVvCvLq44gcDkKlWDDJzGBQT1/Tqz35wMrTdJgnbysd8Hq
	phOa2A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3batwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 05:48:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso1352608a91.1
        for <dmaengine@vger.kernel.org>; Wed, 18 Nov 2026 21:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795067329; x=1795672129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VdoLFRRCMbzsXoBB0jDNzo+q1T8getBoT9tEw7XizgA=;
        b=QGDi5e+3eGQzAXgWMQdQ94IeSkHJz0/MOKfclvmAMnyqyxb+fnBEzUF6gHT8CZAtDV
         a7VmEXLk2VNRZ7eNE7c77dBFiA7FDD+k7FrTOkPBDp42PFMONE9ayFs9ao0gIOX8HPCC
         bxsYaXo/5CJYcxVIfmuvG9mx3ve3nwgm+D+LB4bpaHBzGl/kLJ7dNdihE184JFVIM2UJ
         4gIIVJY4CsU/qslZBKezMlYIFAeO46sceSKHkvJ0QlC75U/i6I4E6hwvy7uv5tAq1feP
         xWKQjkytSUVQQN5UlxHyx0pI4z7GCWNlQq4ZadLOmdxySoTFeYIl4flM5femmlG1QiYB
         Th6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795067329; x=1795672129;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VdoLFRRCMbzsXoBB0jDNzo+q1T8getBoT9tEw7XizgA=;
        b=crnvbfNw1ZDALmcpr2toDZTOAcGhoBv/zL/KUQAaZo2+8/uW63zJwQda9qO34HKWNN
         MsVE+W4ia4QfXKQ5Jp6dmLHslWfURuRkqy1bhBFIqQvEvMW/pkALXF+tkH6zamiXWDKR
         5E+KFVm1yg4OHQVr174stCEi5ApOcI+cGkj4wplkomUctGir8mUTyyc3wLTzCw8uIwLn
         pkzcO5HG9w4PyvbZk801u4dXSNMPZUQ3Sly0Iw0Pp8tufJDSNJLXIVJWOoYENFasGuIg
         y0QHhf7SB9d1v0A3UZeAAErzXMCzIsBFlBG/KBkwcG3Ue8FVn/vM3S7CP3KbzcG+MCjl
         jT2Q==
X-Forwarded-Encrypted: i=1; AL+hErElUuxyNy7SU4d4Qi20Tsnf1jB3Ut4orE0kH+/Bms9M57vcweRPFnjVeyaQdMSHFpQmyUsI2eivXm4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GJFf0+DEr/wtdFd3p+O+b/XEQRbHhK+QKVeSOBAwhVx0e3Tqc
	5cAaM1qaZA0lv6QSkntkKZp1/p/D0I0LLQtFojmmgE40JrelrvbRnQyfq/YjZiVR2UMNCccnV1j
	3ST7l9+Z4gJKMv4urZ9OfWGO2iShtxHVnXwT6KaH4pE4N2+SkNLD/blDA91SR51M=
X-Gm-Gg: AZFdTZeUumIJXFfn0iEpfiwKwqz6zXK10xiQBpeOJsW23pvBUDHEjPtatWoMc3HNJOQ
	5BNgY1SOv3CQKdmyoj7iCSOxt3mFdTos3/S923SAri7E57edxKWnRCSicfuzOMlgmSh+pSp3HtI
	J3ri/zdE9OLY8gPn21Ct3XJBfY1f+BvBSTts4l6eQ+G5Z9zcxpCdBoaS/hRHqMqb2YKE6kjqyOc
	6R25wl8E0GauE+2Kxovuc2LDZ1rktqWc9OWdhq6EQt4fVi+RL90L/1apFfJLXfnp2fwdAvdtexP
	m7xao5i9sOWbopGfBQ+eg5udBoHHPirmGH97LtadZJSRJXbUs0Bylws3HfV+/D0tsFX2mVscbGE
	P/+AQAsK5JWd+SOCK4Kf4HmsMYSFut/c1juUdJCCXaZfK2hB017AgO4Zw/5z/9kn+TYNFGk8uwJ
	lAgicW4g==
X-Received: by 2002:a17:90b:2507:b0:3b4:393:452b with SMTP id 98e67ed59e1d1-3b403934871mr471951a91.9.1795067328552;
        Wed, 18 Nov 2026 21:48:48 -0800 (PST)
X-Received: by 2002:a17:90b:2507:b0:3b4:393:452b with SMTP id 98e67ed59e1d1-3b403934871mr471922a91.9.1795067328077;
        Wed, 18 Nov 2026 21:48:48 -0800 (PST)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm824764a91.10.2026.11.18.21.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 21:48:47 -0800 (PST)
Message-ID: <d4a676a0-c508-45bd-a847-30179c9cc4bb@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 11:18:42 +0530
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
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
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
 <92dc14f4-edf3-4112-88d3-1b93aac677a8@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <92dc14f4-edf3-4112-88d3-1b93aac677a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4EMhQvsZw-i-SV2eWo26P3Iu8_8r-CtR
X-Proofpoint-GUID: 4EMhQvsZw-i-SV2eWo26P3Iu8_8r-CtR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMiBTYWx0ZWRfXwVhGJovqWv7l
 t2We0ghQk1F32VWGbnhAFJyl71TwdURJRhd5SXTGgEh7GZ9MJVL4wZujQ82lmtYO24qJKQsZn7M
 8OWhoVjHY2F1dt+kewtM1dtR62K/5F0=
X-Authority-Analysis: v=2.4 cv=dZQVTnXe c=1 sm=1 tr=0 ts=6afe8dc1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=IjLffXyxeTO6yLCIuWUA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMiBTYWx0ZWRfX12DOga2Vcp7y
 NtYl+/MhT7CknVa//vJWV+utXuAjLflOFv4OBztTYMTGDiaNGFVARispwY9jKM2UL2gWdfb1PdS
 XgqFYgXu19cqkNLANMGdPmNk3kgpLzkl+n2TVP7A9C+jif14Sv3cp5o1aheK0k3m87wA2q6PO+n
 Yn5a2kVXAnnbk4K2xDWCKWrcRzjRsBANbFOaRUDH8irMl9e4LMvcNalNjm0cEs9Skwqxzf7wAky
 NRnwldqElFECz0J/NrAo8W46WDsLlUwmBRiN52wkPoiwruwYPBrB2kAIu8Rwjt1JW87E5jUIjeG
 7yqbHFDYvyM427ux5J/0hVh8xYIBuyYYEl89BqPBNwrFnxDTcNn2klJZ2fFRCmtwlYny8XVlNNa
 eeS/T2IztsqP4lVSOW3yEA6AiRVsNFZjNHUsMXaO/nE19exMLLiQjGcfamTVlKtvgNXmHQ0sZAz
 +rVuBoDhaFxxRHuGE5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190022

Hi Rob,

On 27-10-2026 11:52 am, Vishnu Santhosh wrote:
>
> On 26-10-2026 06:35 pm, Rob Herring wrote:
>> On Fri, Oct 23, 2026 at 12:05:50PM +0530, Vishnu Santhosh wrote:
>>> On 22-10-2026 07:31 pm, Rob Herring wrote:
>>>> On Wed, Oct 21, 2026 at 11:22:35AM +0530, Vishnu Santhosh wrote:
>>>>> Some Qualcomm SoCs, such as Shikra, run the modem in a separate 
>>>>> security
>>>>> domain, preventing it from accessing BAM descriptor FIFOs 
>>>>> allocated from
>>>>> arbitrary host memory.
>>>>>
>>>>> Add an optional memory-region property to constrain DMA 
>>>>> allocations made
>>>>> by the BAM DMA controller to a restricted DMA pool. Access 
>>>>> permissions
>>>>> for the remote execution environment are managed separately.
>>>> dma-ranges is normally how address restrictions for a device are
>>>> defined. Why can't that be used here?
>>>>
>>>> Rob
>>> The constraint here is access permission, not addressing. The modem can
>>> only access a carve-out that is assigned to it through SCM.
>> The reason for the constraint doesn't really matter.
>
> Ok, understood.
>
>>
>>> The soc bus on Shikra already has an identity dma-ranges covering
>>> 64GB [1], so there is no addressing limitation to describe. dma-ranges
>>> does not reserve memory, so allocations would still come from the
>>> general page allocator, outside the assigned carve-out, and modem
>>> accesses to them trigger an XPU violation. It also applies to every
>>> device on the bus.
>> It's a bit awkward that dma-ranges needs to be in a parent node. So you
>> would need to put the device in its own bus node. But if dma-ranges is
>> in place, DMA allocations will only come from within that range.
>
> Thanks for the correction.
>
>>
>>
>>> The A2 BAM on Shikra is not behind an IOMMU. restricted-dma-pool
>>> provides a dedicated, per-device region, which is the setup it was
>>> introduced for no IOMMU, with firmware restricting device accesses to
>>> specific regions [2]. Stephan suggested this approach on v1 of the
>>> BAM-DMUX series [3]. The BAM DMA controller and BAM-DMUX reference the
>>> same pool, so a single assignment covers both the descriptor FIFOs and
>>> the data buffers.
>> I suppose that since the memory region is dynamic, 'memory-region' makes
>> sense here. If firmware determined the address of the region, I'd
>> probably feel differently.
>
> Yes, the region is dynamic. Thanks for the review.
>
>
Gentle ping. Are you fine with this binding going in as is, or would you
like any changes?

Thanks,
Vishnu

