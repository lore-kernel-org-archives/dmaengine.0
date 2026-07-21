Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB9C3C6606
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 11:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784633196; cv=none; b=iwsMsQQkyhA2mbfQzBox87XEoiUHZf/Ytau0zynX9HaR0GIy9QuT2x1lqzz1eoDZNhZwj96vBGDaM47GEP1aYGFEWnC6Ij2+L7/N2LNl+YG5b20KHwguVgGvYFqHoy8cb0zV5EzYXloW12qs7Z/AIv8aYvsOo/y6uTVyIhn/x0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784633196; c=relaxed/simple;
	bh=InVu/xdm3HcombIpLOvuma9l79Xu7IXTNVw7xvdTTGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eTSTJ2fe6bhnHq9JoSaMqHv5xkSLsgRB2xnZyRfFQ2ELDU4IiKu+8uaErL49jflaaG8oMCDRCED1XHXtaXpaTc+2WlkpNrFV4Ks6MJyzn/rsSxd2ZbjD+NtDFTEuS7OtRdpSwnVoPTeVGX7L4cLWx3+IHWYYROunIP2DP/icnIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WFzr5U39; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=agzPm8Yo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WFzr5U39";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="agzPm8Yo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARMbL1482121
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 11:26:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z4EA1vIFZn2u8R1DO2ekCfXZ58M6JuYvASbE4xUk5ds=; b=WFzr5U39Mitdb9HW
	NuKz6SmfJ52fZW0gxc2vn7S6k+QkkR+ZyG7Ya2OYOWs0cZZOsr3rL6NW7n5+3mpB
	kIUJlyDSybYAEnpkZsUTT5itRHKTqjT4BbwyQmrS07bWjO2+sz9tC4Z/V+49M+zM
	KctcKE71ETKwAleXHRr7ovLTDwbiL6YJOoXZw1/iZ20qwm6wpbJ4BZNiGXU2AvIU
	mRbPJehkqq9jbK7mqHuFuLEbKCU2tLobZpsfuFkvbLmVcJFNT+9bbFoKKg03Hgd6
	w7TeWCwSidBx9U/GEcVl+Um8jYOYdIlNpi9vdQTK2LlyjWMkylvehsdA+XdVO1JV
	0UZyQg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqnaysw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 11:26:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930a312222dso70817785a.2
        for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 04:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784633189; x=1785237989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z4EA1vIFZn2u8R1DO2ekCfXZ58M6JuYvASbE4xUk5ds=;
        b=agzPm8Yob3VofzKYGftpYR0lEFnv2qE4L3NEEHrebD2k5AC/Kvvma8G12y/awR7VD7
         QkqFXhDaFTBndiFuf+kQE9CCUsfbp1dpYBcHaf3Iqbx5M8HoZm/UwZVW20SR7ssNC3X8
         APXPFMLQIVxx+djppjsHkkLr1Pxj4PFtPhSTMYHnch2fVbJwaYlnt5GhNgKdYsQO5ofD
         tjhOtqCJEGHgfTj4uiTYTiauZOje0ZoWonda8LYNnQujAGzZSh3Z+wr4b+wEft6JtSpB
         piRy4WkJoLA2zb0+UzsNKpKl1VwHsxUE7CSaldQjxO4VRZhjZF7ymU2E/FgylsfnYK6B
         unDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784633189; x=1785237989;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z4EA1vIFZn2u8R1DO2ekCfXZ58M6JuYvASbE4xUk5ds=;
        b=Zauv9vsHn56YrDJjFQ9WMun7Rt0uJJCTrxpSEUtsroMrWP/bR9Y1h2RgmIViFLgfHK
         IxxhelOW+7WEivVnNx/SoG8N79iU6kdbGKJpYagyX37ldcHk19TZJexTrYv4DuhNM50H
         xQpzCEnFFjInfCHu+qJa9I2T0IDDgx99UYbOOsOI0uksK25ZVAFIs2U62zZxbfSXAur6
         +rMgFmBmlwNUEHENu281pTUxSoe/mQ4oEHUCKUeO82MsewmNonk8qwWswIsl5TdtF0Ji
         X4K6JXa2E05EhSUn3SNBAo8pCF+M5DX44r5iR+lVIhwXJqxs7OohCvQxJ55sRodQcnXC
         Zs2g==
X-Forwarded-Encrypted: i=1; AHgh+Ro+F4Ov2tZBKF5qzq4kbqSp/PkJKsFIrYWWTA00S00Gan+tKxOm/cRPvJjO6YSjgWchNnoTUhYpm38=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHJxJpE05TdeHgrYw3IBfVpX6kw9TPKmZEQqfPYE+9GJfASGTw
	AJ2keWOGvbovBQQUmSIQeVs7XRcpWUzwLlCEujl5/gIXhNjtD7pzhIOg0sBZIFt7V8HYtFGEbUv
	s52n7mLXckgwhLU7wk8X1wdnfeY1J6MMcF43OWInpiTn8aoGXdAXLKhmFWPTXHoQ=
X-Gm-Gg: AfdE7clPxYPJZ/pihXIv2NNdTdR3LrZASzVw0OS2mrpfet+c6JKUEEW7P3Tfjtfs8xy
	aq9LQTEIfxTNWYbkHI1eFospaBSMl3wwB1keVAPhpjlXl9R6FRYC27qesja2iOmbTgH1ykNlVfE
	n2C4CzlQJ+lFSgUkE4YMelZWoCMUGSNqIwcH2uxIplPxeRUyTSZwhLjyaBv3r45o1cVauQ8skjF
	k85Xgbey0xR8HnK/kCesDp87vywL62mU1lO48Bi6sNCts3oLHUXPE7ZoANp5AhNW6HpIz3B8CLX
	C8uQPgAODXqW3DbLHrdVIXdvOSQ+w2F5j4v9PehqbW4e1vFEC/yAUTaBvdpnBzkpcCELFA+4790
	PnsuuL7TgaV0mUalM2RcqLuT7
X-Received: by 2002:a05:622a:5d3:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52672beaa74mr21320341cf.1.1784633189110;
        Tue, 21 Jul 2026 04:26:29 -0700 (PDT)
X-Received: by 2002:a05:622a:5d3:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52672beaa74mr21320201cf.1.1784633188754;
        Tue, 21 Jul 2026 04:26:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f837sm589872566b.32.2026.07.21.04.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 04:26:27 -0700 (PDT)
Message-ID: <7ca03680-165c-4ce3-bce1-77c0262ce7a5@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 13:26:25 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dmaengine: qcom: gpi: Fix SE ID and SE Protocol fields
 widths in SCRATCH_0
To: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        bjorn.andersson@oss.qualcomm.com
Cc: praveen.talari@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com
References: <20260721-fix_se_id_and_se_protocol_fields-v2-1-ee1d63d6c549@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-fix_se_id_and_se_protocol_fields-v2-1-ee1d63d6c549@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEyMSBTYWx0ZWRfX6ZxllDQtzP55
 Iyx5w6fo3b92ofOw3Ns5N7OKtdAXG8bQXvDe0SbA4iSI2x2GArUY9gQa4X/PlI3XcIS/3MRWhrk
 T2JVd2vOi+qaLaKqgkAEDtFie2tCvoFPQj7SMz+8esR455cccOM2IETH6CK1n1HcEPMrx90WT8y
 0WLyFmD+8TlmXrJdgksGGlG2x+6+FjhNv82KgzY4LhaMP+3LehcKnB+Pe7UD2XKT6FSfoNUaGoh
 4hLoq9FzW7JOAVj8U3dT3Jr1VgF7sraVxCF3y5Y3KEEmXucOOBZ7BvUNzpvi744jTIifh16kInh
 W4ym11WBkupmadhooZkj5ciepJN0am62cc4J63+A8NC5Io9566ijgD3A4wjZL8XBjoz2qHB1Rsn
 GQ0gfFLo73eopDSWP0IDm1xLVrakV27KH+nBZI7r5V5c6O/HCE07mi7cm62NHCnP0iIXpldPEsD
 c0BlMIk6Qv+Zqok0dBw==
X-Proofpoint-ORIG-GUID: oh8-ukFJpAEBBjtCiKnr3YvtSx7nRZbT
X-Proofpoint-GUID: oh8-ukFJpAEBBjtCiKnr3YvtSx7nRZbT
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5f5766 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=k8JVevEbTmNoh4gevwMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEyMSBTYWx0ZWRfX0paVXee4kFwa
 1NFZbjHHxUufkR95+a3m5aAigSW01TFkkKxTlPnGttaSLLRVIYAe9DBYIqYogch17nWOuDobqzJ
 7rVZYbHDhZGdSe/oKJhLNLykvT01Vpg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210121

On 7/21/26 1:15 PM, Chandana Kishori Chiluveru wrote:
> GPII_n_CH_k_SCRATCH_0_SEID is currently defined as GENMASK(2, 0), only
> 3 bits wide. Serial engine indices >= 8 get silently truncated by
> FIELD_PREP()/u32_encode_bits() when written into the scratch register,
> causing the GPI channel to bind to the wrong serial engine. The
> channel allocate command still succeeds (it doesn't require the
> target SE to respond), but the subsequent channel start command times
> out waiting for hardware to complete the handoff to the (incorrectly
> bound) SE, and gpi_send_cmd() returns -EIO leading to GSI usecase failures
> for SE8 and SE9 serial engines.
> 
> Older documentation, such as the SDM845 hardware programming guide,
> describes the SE ID field as bits [2:0]. More recent QUP hardware
> documentation defines the field as bits [3:0]. Use the wider definition
> to match current hardware documentation while remaining compatible with
> existing platforms and enabling serial engine IDs greater than 7.
> 
> Also update the SE Protocol field definition to match the documented
> register layout and keep both fields correctly packed.
> 
> Fixes: 5d0c3533a19f ("dmaengine: qcom: Add GPI dma driver")
> Signed-off-by: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
