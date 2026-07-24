Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5646A429CEC
	for <dmaengine@vger.kernel.org>; Fri, 24 Jul 2026 11:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784891399; cv=none; b=n1E00rYI8ianWyzL7fjUytpQcEBKX38qFOwJQ4Ti/0elkSdLqLJzdCL9eCRWQOsnORG5djDUIOdO/qdXNR5nNDW+PLk8cdnHbG4m90fnXrbWkABv+KhG9NRK6N59WTgPHJ549r+32wdchhCezhHxZ5PRXBwvPAl4D6xwGuWRCxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784891399; c=relaxed/simple;
	bh=SjaRgO11ZVAa77PForVsP04f24YEfRy+ox6Gs+mujQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OpgEo2lMF6IPTd8nAfCgaFNQUghhFcLW39fHfD6lZlvN8drei96eBxVJ6y7ff6X9s/BufqGNS5FP68MHDyiFVmqHpJD6TOh1jNmFOHKYUQofyFU97LTI8zbwArnEz2bmHNZun/t+++8Fvbcl28ChdxiQrRgrcd1M5xEL4lOun7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eB8r8vo9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KREWTtQw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eB8r8vo9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KREWTtQw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADsfH2742648
	for <dmaengine@vger.kernel.org>; Fri, 24 Jul 2026 11:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ux5qS+vam7s/34MW3MovvdC6Je/WYT0RC4mrKVIhqVw=; b=eB8r8vo9xIJzqacz
	WEYbI7oxZo5zmIrFDlHvDtivC2+DNlAkgpf6tip+nzVX2H28i6IT5vKndueJTxVl
	3FEvMdJWFmEnyt+XM32lXDNC8LxwqUvE2aNOSZ4PyN1k4Wv/pB6EfRoDanpBkgmu
	mPRK+FkHQ/Bg1zgeDJxJTMukjbxGk9OYy7v19hS2v2lhCmbzZyEpJeyw8c+2UWha
	iNRRl19KlINckWJm03OZnSr/Z/9OxIUfS9otptHbX45MIbPjJ0KcCQz5xM7tWrnb
	ciov2cO/RaeXUbEbS40+pvQhjNj/R0mPjKc0ADHmG9Y9rJavvIOwEqNDxRnbQW4b
	5JbfSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p51g21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 24 Jul 2026 11:09:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93105103d06so5734585a.2
        for <dmaengine@vger.kernel.org>; Fri, 24 Jul 2026 04:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784891396; x=1785496196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ux5qS+vam7s/34MW3MovvdC6Je/WYT0RC4mrKVIhqVw=;
        b=KREWTtQwkwiziMFVPkX5PfIpif8CpkHgvDBqopCZHm+NKgHZYpgIwceh8r4Q2B8Nhx
         p6izjQfBFTrdiUWSAu8Vgc5kHiEouXaWQacx55XQ8+ZdvaqIanmBh6r+U0E2Ig0YAb5d
         pKSwlFnoes4fWQ87OaeV/BsBnC8LKq4LoeVPk0GT8UYPSVgxXGIBuVjTBc8711lWHRXn
         S5ez5qilAgLyba1dULvQ7RTll3+5y3aEogLloJyOjwEK9cS5TEYDEfTqaA53OYd6gQBp
         AhSYEseFKAFUM9nw3JfJyRSkDF7UU7xdHmNuzihwagVOmiFf9XGaNrMTUddkcY5h1CDw
         rTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784891396; x=1785496196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ux5qS+vam7s/34MW3MovvdC6Je/WYT0RC4mrKVIhqVw=;
        b=gezjMlCIfuTt6C3aoil17ahxHaj05XTwpW9l9PSNfm6eiy+Ujq51GOaOz00BxHX0Ym
         3MNRV0EKB4nVJh7mSEJUATkuzQ0pZaCTNBbVCFWvl28Ey6g2ObR1uAMkXbt/Xy9CRDMY
         YxGoiHn8Dg5eJV9m31VZl6LoV79ultDOoJAOdZkRED8/ciwjhnjEeVVIQtFtdejO6QkM
         OR+UsMFw3tTVSVXmh9WFdd4fEzcdDzlZ2hn7Bx9ZCFjs5t+gxu/PZatVdpaWdcJ7vbjQ
         8zoUi+hGmikgzegAzC31Es7w1W1KqYO8wQAnHas6KFJ7419lgawTQ55dd5KyHjgwE9/P
         DA5g==
X-Forwarded-Encrypted: i=1; AHgh+RqldBUvlUAAbgp0gXE89WNLJl65tNRJX/AIjSC4vqag4otlrYekyLKRIJ2Ol2AxSMSU97FJG09V2Pc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRddwGUep7wVks1Xx/3rK2pAepHxFCMwFwWSCAuDDwm2yrwqVP
	CQl8drStLC/AatkFBZ4Ul5UNkl6vwU8TW33MZ26jsdZ89n5PXQYjcHtPvy+as+Qj/dTJ2gR9VMM
	+BfpkdonbbmNFiZO5aown4ZQAmOMicEZBLh9GgMCiaDBffXQBfmnXsxz9hoO3eDM=
X-Gm-Gg: AR+sD11Gm7Qv5P6EpETeFbrzjJ0u7z0mDvPfHYQ9Vuw5I70xb2+vyXRmF6Iavq6CAub
	64Qoi12u5oGCtoXxiOUqDpmdB+QrDD68n/THzvl+9mNyI8mHZ7G6yg7qWp3S2pBL4VpdhKs+aa3
	kgRODU1xVYUY7h1zz9q4cMXMqtm1GnM+/YkOWctyV8lID4gNZSs9j+6OjfRWtrJyJwOfkQFa9jq
	gBEoxXlgJPIBOGcO7U/0Tn4Px285T95YWiUfKouJySSb3NqnqzTOKbLtepcAxuh06W2PAM0GZjm
	gZ+PJuiBa+QfDbwYicN4xn7eCOm8J03ZvcfznvssadWPDOWOs/bffuWwxF2ZiInL0cTHM9FdSqD
	cOn9n5ScmxaBCKllIuFmF6aLe
X-Received: by 2002:a05:620a:4804:b0:92e:9cb3:3f67 with SMTP id af79cd13be357-9310365429amr571676385a.2.1784891396593;
        Fri, 24 Jul 2026 04:09:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4804:b0:92e:9cb3:3f67 with SMTP id af79cd13be357-9310365429amr571673785a.2.1784891396117;
        Fri, 24 Jul 2026 04:09:56 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34b92a98sm3034189a12.10.2026.07.24.04.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 04:09:55 -0700 (PDT)
Message-ID: <36ec6823-8792-4015-8693-ff6937dca771@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 13:09:52 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/10] arm64: dts: qcom: shikra: Add
 gpio-reserved-ranges to tlmm
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
        linux-pm@vger.kernel.org, Anurag Pateriya <apateriy@qti.qualcomm.com>
References: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
 <20260720-shikra-dt-m1-v7-10-7dc99100c6dd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260720-shikra-dt-m1-v7-10-7dc99100c6dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a634805 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VaiqnSBy5ELP4sQjxKAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: YPKTddc22gugaD5HYJbRNOP_FBqzqfhA
X-Proofpoint-ORIG-GUID: YPKTddc22gugaD5HYJbRNOP_FBqzqfhA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwMSBTYWx0ZWRfX22GOTo/4OgZT
 D80J57Hz4f8U4orouqkIOHw3Kc0XtXVZQ7FqU7Bx4wiq1l268UGw8gCv2YRpN+XFvRRZ8/JdyCN
 oiVSb9CTeuuuYEWo5dVPORI/UnDcZew=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwMSBTYWx0ZWRfX3QXG1fntOwTn
 DfNGTtvPg5m843rGoqJ1sKmGsUfKOCzR5UiB/qA7/DlvusWObpprcBqmaIBO5CDPzWm73N6mLb7
 JPuUctRjmZ96/FrF3L4s7MODCjOxeZ+rZ6hy9+YoHUCBlqaF+fDkEwJNVz0nqhMZvdorX9r3RIv
 fYlv3pDXLI9GRyxKL6gmGFEaJ9Ah3BjFcy3RrZw34jejmg+0gdAldZ/PPYI2mABgIjn87Wmduo9
 +vYiEOXbdyPVDMXwjvx6EPZFsfDfaEjHVAMSSmT9yWwU83DCIYjWbXEvbVyg73PmIgXFlN+Xw6Z
 io1F/UVOOY2jBZvcbe+NsDe4bswGFfu32GRLxwVs7TK6K8QJ71RPYe/SArg5ZTTd9NtruIHFZl+
 EG4F5jEM+4u1LxJTbhmFqHjlaJQGzc0QL6ddM52d6NeL1zMJy7IcyXEmlh6+6JtbWvH/bbbJTS+
 dSp/oepOfgRPWdWL/SQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240101

On 7/20/26 12:49 PM, Komal Bajaj wrote:
> Add gpio-reserved-ranges property to the TLMM node for both Shikra
> SoM variants (CQM and IQS). These reserved GPIOs are inaccessible
> from the non-secure world and dedicated to fixed functions.
> 
> Signed-off-by: Anurag Pateriya <apateriy@qti.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
