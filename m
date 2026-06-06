Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D257B2FC01B
	for <dmaengine@vger.kernel.org>; Sat,  6 Jun 2026 20:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780779576; cv=none; b=il8rJi/5pu1R10LUWSbuGVox+GxulbhHzkeJXpVcBkr7TpESQQXn1ONmORM/IhmyGpTbaoBlXyRlEq7pKNf0vwQUZxI80aMCJ5aKi3Gz82ABpC9nXm9jCvtdbUNht2v4pplxpnc2o0T3CRlbiRRRhAHnqoj3SLP3TzcFj3YjNaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780779576; c=relaxed/simple;
	bh=arhEzyLmfNvArxErmFJXcle+VH0Ew1YYMMZrQmaMspg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KNiNfSGcqYB06V5L5JUyiT7MZidlhV88731Vn/xQMAym//78gk1Gnse0vVGboeoRHFvkSK4ky79pVlElT9oJiWYBP1Jg+J6Pvg+ZZaHbW/VUHijIrnzUh2XKcbcslT9MoPSl7m0HFrAAG70cPBZ6kyz8yjfhyAC0+RBM3tH6mbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRmcpg67; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QrNpQvdl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRmcpg67";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QrNpQvdl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656Ii9mG2658484
	for <dmaengine@vger.kernel.org>; Sat, 6 Jun 2026 20:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fdjzngtrv13KXGZ9M/pUsJxJulidxzwkCLaGZt9cbdM=; b=nRmcpg67b5vBJrol
	vOsUdeY7t7RFsETTXM7Wmy6Y0vCE2gWZbK/+xXFlzil/dSB5bH0Om7zbcuwlFJHA
	3LNT5386CzxTb4wqTvd13UrRIwxMwFiPCKM9yc1TIjSGNz+daiv93v0srcigvPLi
	ZwxeFZYdBw720Xa1oNFdqv5SHvtW4IjINTGSDqnzPVxwDM3pGq3PloTarmcaKB7/
	7EgxEgLfkFzGM0iTMl70ZVvVXWl5E0xO3mzBA97JSDaPwHqa0hYj65TIqVywhg88
	F/Tjkq6lXeJYmRcqBL/38rnrIkp2RBmb0IfWhgdUPL312r3yTOrrWmUKA9TotCW9
	jXdKLg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w29t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Sat, 06 Jun 2026 20:59:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf160f7191so17749445ad.3
        for <dmaengine@vger.kernel.org>; Sat, 06 Jun 2026 13:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780779574; x=1781384374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fdjzngtrv13KXGZ9M/pUsJxJulidxzwkCLaGZt9cbdM=;
        b=QrNpQvdlIVE3vlKzam55+X1wO0KwanVKu6r1Dk6MrUUwM61yrDUDA7hglE+hu5KxcL
         2RychWRXBgqZCgIMUNlPon+LE+eciPGWbe6xavAsfXq0jaNHgk8EUEAZaQDC2NtfX5hL
         HBG0dqrFMdtJeiV+3UcGuMTYQWROkiEpN+SMmusj8qZEmwkxE38nwekObGxrSVa1xYL6
         zP2ybUUyzirMPDCBcvbnyH65D8YOWLZaYxnAhLKIgFhSVV1nwjmVfz28uqxj4J9zRA/E
         TRvp8tdvIQnQpJqgfytHKGUN4aolD3zb3G76tBJTUIyZHFTYHqLDm/hM8whIJHYCJGS7
         NJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780779574; x=1781384374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fdjzngtrv13KXGZ9M/pUsJxJulidxzwkCLaGZt9cbdM=;
        b=MMjYDjLKhtLsuxyCNRQX7i9nMXzn/KOt7jB/6wPRsqLt9AZYEnzM/LpF+P2o3GC1NV
         tayHQyaAymYeH28MLbX7pUUnixkFtyNNwLo/OA0U1RGW3ZdtmhrQeOjtQMiM6IVlwV6u
         3J6VBmNJOKyH2DV96IbFamXcikciOGqGk7MHTfkPhkEhAElEQkYE+x4BAXsZdPhbfTCf
         URuTimqWq+BPKdDxcHQjAHP2ms7jGSF9Wz1mZNw8AXhKwylSMEi4YyGZnXwyelDR4WWk
         mBrxX6Df0heRngp3cD60v4qL22k66BpSPSRL/1dAsAIeas3pr6aptwmEpi6pEZZJfOwh
         zzog==
X-Forwarded-Encrypted: i=1; AFNElJ9o8kkgqKRbO04DzFs1QNjwQ+p3HH/Eb2odd8hff7ZKnopC7V8JU2qDaRoEK6M08F1ml2YPS+gde/U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9gfXZ9dM4uC8qzMVF3axmZ1pd0VBqyU0/AesyXrAdd5SBJIrZ
	u3LaJitySGk+moHJYWU0c2/uM397PyAUeZWyLOX+GhIWc7FdqxPo63Lvssu7aFb3DFi+mcaI7JD
	e0pm/pT04HiYZ9XRL3yu3VwTXjtBWH+1mgNoenSxUrInqbn0+xCJnOTcIFMDhmYo=
X-Gm-Gg: Acq92OFXwJV3LiciGXKFOfXmFUneoDT4W/esNGEmbJrFTqL+Af6+LvlAQEqrnO971y/
	6LTSetbQvgvEaKe+a/K7911isJVwSknkQfXta6vW8eNezsdsG0dMUq+yhxTZEJGrXfHa2Bbhfi5
	krXafmPKUyl1N0gLAHJsWA1zXZHBxR9667wQhjpcEK0zwG3ajUFtVDGROxZLJbZvWmAJ8aLlGqx
	0IXPbXVSh9DgcDAKpo8Kvi3pCHKDIcXa3vxZFsmAlT/KoZFYbQe3N8w+u8PBJxocE55ADud4rNg
	mNEdx32BnEIBejPVfNoyTy01Vq53LbU6WOF4zO8WPOXrfhbXvSP8cji3dsMXzytIFLTllWLvgHK
	1NA6D5Dgw4Ja6GmgRX5ood403Mog8tXtXO4U3U4NxPHEDemGm5MyciRpekLBzPQk=
X-Received: by 2002:a17:903:1245:b0:2c0:bcb3:86f with SMTP id d9443c01a7336-2c1e78e431dmr97381955ad.6.1780779573744;
        Sat, 06 Jun 2026 13:59:33 -0700 (PDT)
X-Received: by 2002:a17:903:1245:b0:2c0:bcb3:86f with SMTP id d9443c01a7336-2c1e78e431dmr97381835ad.6.1780779573318;
        Sat, 06 Jun 2026 13:59:33 -0700 (PDT)
Received: from [192.168.1.8] ([223.190.87.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm134635495ad.52.2026.06.06.13.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jun 2026 13:59:32 -0700 (PDT)
Message-ID: <289a5bca-5491-4fc2-92d9-1102aa664021@oss.qualcomm.com>
Date: Sun, 7 Jun 2026 02:29:24 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] dt-bindings: dma: qcom,bam-dma: Increase iommus
 maxItems to seven
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
 <20260521-shikra_crypto_changse-v1-4-0154cc9cc0de@oss.qualcomm.com>
 <20260530-spiffy-glittering-quail-dff199@quoll>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260530-spiffy-glittering-quail-dff199@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PEYbjr7zDCqInF9THd-8ZU2UeSuuetEb
X-Proofpoint-GUID: PEYbjr7zDCqInF9THd-8ZU2UeSuuetEb
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a248a36 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=hwwt4TTrG29xD97kRhuzDQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=UrYlmxekfit7Iro2dVEA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDIxNiBTYWx0ZWRfX167GAoBeWrB3
 5Eq5WKosCmEwKFigmiE3o9I+IJp4cVJtjW76ylBFpYh/nIlJhU3fIspQ49hF+shXYP/B7LIVzQj
 WTTx+tbf2EbqWp9Z9DOv1qpLablxZv8IwQlDPH/UB8TUdg4HzLk943VTOJz74yJoQaJhcmOflsn
 rZ0KKUSDPu5zfamo8pZzwQVtxHo8BqsboMOp4EoC/CS2lqMIaBtS5akl2sHP3n+BGcLHDudPJmJ
 m1nmubQEmge9qyiaaisoC9ytjtccFjO8ZbrL4fQyD4HohpqjUw2u8wkMh2dAOWecC8yCq2dhbUo
 k47FKql7MAkUUQ/T6riwXIzk6WacofEFlOgMWG+cqEZ/e/UmQ8AsycbT+sBiTQDvdzonJU5N2xi
 2TosnuBOVDn6XAdWCCCLrxoJ8rMgGcRthpjy1DZd8l5nEXtyNs/0JElQhJg2ccelIF71yDnKNla
 JYBqL95+NEX/v0Qd3nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060216

On 30-05-2026 16:09, Krzysztof Kozlowski wrote:
> On Thu, May 21, 2026 at 06:47:11PM +0530, Kuldeep Singh wrote:
>> Shikra bam dma engine support 7 iommu entries and not 6.
>> Increase maxItems property for iommus to pass dtbs_check errors.
> 
> What errors? There is no Shikra in upstream so how could we have errors?
dt-bindings updates are prerequisites for the DT changes of ice,rng, qce
and hence updated bindings in patch [1-4]/5.
Also, the commit message mention about shikra and DT change is also in
same series.

I hope this clarifies.

-- 
Regards
Kuldeep

