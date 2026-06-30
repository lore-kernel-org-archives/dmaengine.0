Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B882409100
	for <dmaengine@vger.kernel.org>; Tue, 30 Jun 2026 12:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782820972; cv=none; b=YmqJ5XX6vuiyJoB0TM1ZfvK9Rh2Q/KldtJxzKT6ZkKeGfzDxrLy/5feHY283OSuSGai9lLL+4Wpv4XBNTz0xd9iFIEvjCbK2rVdrgarr5l9DdkC4WVu0O5Ni1/+LWIXWr37Hvmgfjr3Brv8gviPQQbj6CGaq0eHLM1HrRRoKBzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782820972; c=relaxed/simple;
	bh=IkrrKblyFRnZ1byHDFmhe+JUsrlUq48bNUMknB/GoBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aCKMkXoOVFHnSdlFc4wRxTQlIwdLuIB1dZEojg0WiZ+nM4qtC8mAS3EWVVFpESnJOgXYquXdLMN91RROux41hrEckEAp92KPSghJfPdDM5kl17iSjCve8i0tuQS1R/roMFct4HqSi7iiUarxaCitAH76B6XmeP8AY66rZeeNjVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EuW3R+Zf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FkQp2VH1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EuW3R+Zf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FkQp2VH1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nCti1590607
	for <dmaengine@vger.kernel.org>; Tue, 30 Jun 2026 12:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ya5+g+B+at0U/7OO6VM6O0RD8/Spck0YHmmMx1X0tUM=; b=EuW3R+Zfx+vg36Is
	LMQL3/vMGSwPVGz7kxuWFew1GvWw4BbllhgInfnELAPhfsxcKZ0KwctnDnSZ6q6q
	kHxP8m2/jN1MlbLz06zT1OeXWTsXymlnAIyTh/GFd/aL3KlsfnvYVyRcXIts7RiH
	RIqH94hGAZt8zaozgb1Qjfn3GwANxQOYD60VxGRWWHCwZz4kqoFA6lt0GjCXdJMY
	kj3xZgJ6dgAmm9u3WiYQIZzXwdDM5DvVkMvW65IdmK36p0UMaiha7yYwBsTCsFKS
	sYE7adtSzzytESvXbVutHxJ0MSdyeu+of+YHc+2nYcQjMjGDVWcXvFVufWxZflb9
	e1DttA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k3dj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 30 Jun 2026 12:02:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37e5ef8299fso2864807a91.2
        for <dmaengine@vger.kernel.org>; Tue, 30 Jun 2026 05:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782820968; x=1783425768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ya5+g+B+at0U/7OO6VM6O0RD8/Spck0YHmmMx1X0tUM=;
        b=FkQp2VH1ajoSsqVleFU6YTbl5dottUE0PY3geUVErP9KxfIng395BCG7jzN/V1avoo
         tvI6i3sQ7uum4rfWycv2EoW2MS5A6lruXfs5dvdcL6O8kdFpzfkoggtSChVcnLPgT9zx
         dOIG3C9Jx3aChfkw3KmIcVdKbWfDbjLolgzl1dMjg7C2roakMSsDsaEUV5wl0OyB3JzX
         qZaH+nfcBh/F8pcqcv+D72jGGh+DTBzD5g+RBFqxyjUm5enhA8GNeRlWfALoeAg9i1g6
         1PZ5tigxOXeeXMd78XIjTjkhg7soMnIgroNP32hJSU8PKXX2RtmZ7rFKUOEs17eZ5f7M
         aB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782820968; x=1783425768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ya5+g+B+at0U/7OO6VM6O0RD8/Spck0YHmmMx1X0tUM=;
        b=oWNYzU5uywGRDwbhun0R6qeYakN33FOyhbZ8ilZIYq7aK33OijRhvJiE/3dAjN7keS
         kik2t0H8R6wmghKUGqcgEAmp23zxUACEqXZvFLWerJdPfltgJDMUChkzlDap56H6hG8a
         +ftTVZVj6Hq2ivDTvESEHGeZ+4laowdJXjuFJ/HL1TpqaOIqINNBsKS45togLzByy9lB
         H26dfA3WXJq3rnN6ut1Einmi2jnKFzpuv2sTBkK5bxjAskaQJpk69ssvEr+Psh4+QxNV
         LoEbIXyBpjMDXMmOLeCU10M6jW1TRcX8BQdKItAHnNbzZeEjCS9QiO8KoLphx6EuiSBw
         KZEw==
X-Forwarded-Encrypted: i=1; AHgh+RpAu26IL2fSsHxVSmIO7Dh5jsHQh9RGdNLBha91ysEp6nmMxGbTpJT2TlleraIVAOY7DpsSrT6DrHs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywey5xVJnAo0TC5CNl4p2/FuTFhV/mHMRyv+GCJNoWgJkUFMOX+
	aPQ2Xeq1R3Zp3Cf3HzT/S4Bhze/dfI+HEKIn83lEUldVH4y7+06oYzDBjwRBJufpN+OpCkZSHXk
	A5npTQ+QInlRvLFwaDmA88kNBxabMhONowIJZ5iUlU10EygRlrQiU5IJlnAiGO1U=
X-Gm-Gg: AfdE7cmgNV5zDbZB3fgr9Smhx3/Ptcxeug9Dcsb8zfNQdEHfxyiznM3W9V+4D+F/rrm
	IaixcIpyySANdc6dLVDuu74JoaC3MpPPkNbGzyNpk9aUlwsdt3wFrpH2rZqTBVom4yTpMrb6Iyk
	8H+RmKQsGK6JNNV7OmpuTFJMldLNqjjXQSepGOsyHfvD0rYfobzgG8sVd+zEPebbKVHXkyA1nqn
	HLhq1tNT15fQLyJqFlCk6Hm5I/HzqY9R2wRppAiPe0FAfWlsAN0NgQdu2LTvFYVMy6zVSU+em7o
	GKEwuo/DTQEHkS2nU7GdKICJidAetBA71oJP2EpoV1xzbtAHqbCXQW+T9yY0IpvU2hv6dZsUcYA
	6N9TNed9y7DFQk22ZgWqhN341klQmLZGvnmxOwtw=
X-Received: by 2002:a17:90b:4a10:b0:37f:9cdf:f037 with SMTP id 98e67ed59e1d1-380527a8cf7mr2310644a91.26.1782820968318;
        Tue, 30 Jun 2026 05:02:48 -0700 (PDT)
X-Received: by 2002:a17:90b:4a10:b0:37f:9cdf:f037 with SMTP id 98e67ed59e1d1-380527a8cf7mr2310580a91.26.1782820967833;
        Tue, 30 Jun 2026 05:02:47 -0700 (PDT)
Received: from [10.219.57.117] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38052f47a3dsm1635979a91.13.2026.06.30.05.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:02:47 -0700 (PDT)
Message-ID: <c039d004-4f13-4e23-be6b-1eba18fd0251@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 17:32:40 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/10] arm64: dts: qcom: shikra: Enable CDSP, LPAICP
 and MPSS on EVK boards
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
 <20260608-shikra-dt-m1-v4-8-2114300594a6@oss.qualcomm.com>
 <021fa1fb-7033-41d9-927a-5322be71768a@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <021fa1fb-7033-41d9-927a-5322be71768a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExMCBTYWx0ZWRfX/dMxrmuCtiKg
 nmYELopU4qZsKumixOI1MhpQnVA3UaqLZaLGnTPEXZytJpa35f+0Nztae/erbrbADPb9dTWhjnV
 eWJsFktYiLAKCHeHSYQA6U4nT1Ygvi4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExMCBTYWx0ZWRfX08v156m+WNNo
 CTcNQE638MrwX+tvl3Zl3p7fnnYXD2wttzZxeVw8UbgMYzFiS7FMYU54Czmi/dWinpPhYQ0TO3t
 TccZnErHGSrLLwrBQNtbz2ZD7f6LERCxhktQXNfr0YL5ro4kvqN8401Pf0w4dzMWYKxxWh4lcNE
 HNgXDCnhs1EA2PjO5gvXGzhFhffuNJe/p7wBekTsLEqqGW1tLRnHx42SAiTT4zlzuu7EutK5aZu
 eNflYMsuqF7lD8lYKrNlVucrkl+AgRMDOA/SFHFl//K+iO7+fr7vW9UM18nRhtDDh3sH3wwBYyD
 R7+NfxP7OWFLXR/Hj8lF03gSbHv3yK7zrarOyrhHKSGM/YlUzOduOb64rn/CZVgjP+3DGXLgsox
 ts+7RljwDmhnTCtRYDHNm3ShxW7+vx+bwgfxdTSRfV88SWB2WW1pkH5w+XIXppE0UIm1N/fsl3r
 Ms2zPTtMBjjbQx/sSAg==
X-Proofpoint-ORIG-GUID: LaExFKl7biyQFrKo43yQzZmvX2aMFm_I
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a43b069 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=kvEoWwmIO5TvxaCarFoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: LaExFKl7biyQFrKo43yQzZmvX2aMFm_I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300110

On 6/29/2026 8:09 PM, Konrad Dybcio wrote:
> On 6/8/26 3:10 PM, Komal Bajaj wrote:
>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>
>> Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM, CQS and
>> IQS EVK board.
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
> [...]
>
>> +&remoteproc_mpss {
>> +	firmware-name = "qcom/shikra/cqm/qdsp6sw.mbn";
> I think cqm-evk etc. could make more sense but I guess this
> is already shipped, so might as well

Yes, it's already shipped, so we'd prefer to keep it as-is.

Thanks
Komal

>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

