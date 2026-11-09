Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208212;
	b=qWk+epEjNBwxiNSb46PmwITXKn0gaNuQHEiTI0u+LRTTbCiFD36A1Cnd58nsLAEM/m7r
	 MeoOZQ0tsGdcvXemdbQS2KPfxckmPJ8gJgrZP9URwur2hZzr1sHxIJJdu0FxbF+NzYBc6
	 7lZPhCHgCINZBteUB4+67fi+VP8k0ufzbpixpXLh9oiA4rgCVtnZSyvwrOObB8wf60v5K
	 v9SW0xRbU5M9bs+yD/Ggjfkf1TRph6VIA5vQDy/jlfR5q7W3p0OgsKEp6Zy2tbypbVgsu
	 iR5aYOAPktszG7Z/Wpd63+WgYCZiqLxDGDihoy2+TC7Ztonv1RNuLChbSqKfCZLJORQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208212;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=np7bEj6m0lRUiyUr1l1RlC0cc90sTu683s4JN4gPYMU=;
	b=xOiRdUhE4bpB/wg+CTjwvWUxBisnyhiY3EKsWM373pjU1LlVavvnalpyiF/I0XDdcQQw
	 1s4gG56TCnImheW5AFbReLynDQTmbDYLVABuj0hjlC/iOjy6EZgFrqzOhe9mVpFcJi2q0
	 oOAbMnHJLv5h40hYI0EOwz9mOmLSrBvxpkZan7rMCgDz/XtS7I258MCPtJn4NJh7O7P70
	 7Sqx030p1zV0hPSfCTKbPTSHPnLQgsXMZNuLdviRtmIIn+iBrsnIQpA7LAgbUVbtC+gYz
	 +yQ3A9vXNBiAlIaniQ/CdH2HroJcHP54DsXKBweeVyNbhKjmlO7/6jddlxQQpsbW1Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ejBy6W1k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGIcPeD4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9703606D806
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 07:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9703606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ejBy6W1k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGIcPeD4
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A6ZU056071
	for <dmaengine@vger.kernel.org>; Mon, 9 Nov 2026 07:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	np7bEj6m0lRUiyUr1l1RlC0cc90sTu683s4JN4gPYMU=; b=ejBy6W1kN3yns1U2
	17zJeRDHK4VWzF15HXswJ5WLq+++LvoYsgJZz45PV2ySKkNzW12sgxZAdZkZb7vk
	FiGzT9m0wxaQw9Yq6Vpn9THhsAaZnBxkS43MFA2hqsbW+n0Ri+ojzPQOKDILzzhP
	474tX/AZztr6UGYNcFnmuKFK/hKBn6XV/CqLMgZgG2oswRkw0zlchhrxZFKPIihv
	PBaqkzVUQSjJe/Q3D6cTwrRC88OPOytzqKbeg+rBWJ06mDMm+RhxxLjh27/7nhOF
	+X5GK5luwYrkpBaGAeLNZYtrXvOJvFUbOIa+/Hpfj4J2Ayio0ZtAWA81JI/zZuN4
	ML5Tyg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm20wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 07:10:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3724667bc16so642896eec.1
        for <dmaengine@vger.kernel.org>; Sun, 08 Nov 2026 23:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794208210; x=1794813010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=np7bEj6m0lRUiyUr1l1RlC0cc90sTu683s4JN4gPYMU=;
        b=gGIcPeD4+YT3mxAvVzH1WR+UR1gtJZuBkSGwlwYkIn1tZWNt4bC0+wZz3bh7znik4T
         chdgs/bvEkwBPwZU0aXP6DhDSYXIB5L0sCot7XcJCLmmMLimhMV5vxU6c8h9xcZ8xX4M
         Ne4n1BAr7oQ/zJQ1GEo2hX81UhyLaPUpTlUo7HHuXOG2rz197sDc62kSymZYA0NarDf8
         qspTrBIMl50tbJ3U7cPvm4lWhb/JRMCn1DvWw9evQAzLWX4D1HnuHLOUxNasdvOrDZYg
         sQ8znDHAghb2Up2ktRT6wzti+puqNXXo2VrIm1KD3KPifVvsDW6j4dNhVzgTR31vQgQS
         /72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208210; x=1794813010;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=np7bEj6m0lRUiyUr1l1RlC0cc90sTu683s4JN4gPYMU=;
        b=xJQQCXincXSaCCg21+KTV42SfClEeowVEBm+PA7p2m9HCxcPnEVeKSkzEZhKhVKgBF
         oW2Lo+jAk543HXoaCvy+7INs+W3PIwyy2zRZ0uvkZ8hSDLwfsr/hjofrwv8CydpV0X0w
         /r+v9X6WBVThpgSGiyqxxWaSI0oXKk8kSG3WRjalQSZYKd/j2GYsgLpHX3ccvX9uR5Wi
         oT5RmgpkAcZix6vGiHOalJx8BUdmAnv9guPJXK4uzT3xlfJVM3DyFtlodGEEop98zLJK
         qGj3gET7mcmuHDr+VE+WlHUQtOo9qy8GDP1QcVmbAQHuduFVboMDh+E9Dj2gVUiVdC1s
         HFgw==
X-Forwarded-Encrypted: i=1; AL+hErFxVVMj8yLttRH9rVv7g8wJSh/tgn3ofIyNWbtFoHjbCLWQMt/tqHcytEWHvRa/Ubv5CUG+Vg/0tek=@vger.kernel.org
X-Gm-Message-State: APuU4Z845c+Y76jGGzQqWI2puRZwZn2DwxqZ70wfctQ7RWfwJ+r/J8MY
	4FDXS8t9iCL9Yqa/e7/rX8ALWGnrimta+hfc3HSIIhw3txJldWdcJRWVukvpLiJSn1of26uCdcW
	pNHQbhxg4Br91smmJZ0CzISord+JRzRSImPwlVxvc719IH8iSP7VJaMsYG21jQv0=
X-Gm-Gg: AYBFou2wGtrBTkkyeJrHRVdD9KrJTj9vUtym8lO0OH099hotAkzj9hwalFNeRvSBIm4
	MKHXDEGSqPvnN6gZgKglpfl/HMofodMDRYDEm/Bu+bNkoi6Px/kx5S8B8fbOTbqPizEr0ppUswr
	4P0UDbPX9Mjw0NMx2BlkFVrVSxVxaUTNj6zfmnS0zdPWSPttxLX+If3dk+k9OhhULIR/+lSbJZ+
	b7zpotWcakc6+AGTBQG38+9XhKjMWqhwxpxXQE/KBmnj5tC6b//ThaB/Cl8FKFCKGmO8UOBDzsL
	fuH2l9uq5WaVjCHpTtmpfzg3gcKub+OpCBOksk+2bQ/LP0ZHNg0Jt61vSPMllmIiR/Xy2X37Hpn
	9maIFr2Mv1Ih80qUTsFpwe65DAv1o0+mHD7Zltmk+fI5mcSeaujALPgfBJ2XNgQSCYcja1ESwhu
	ERmA==
X-Received: by 2002:a05:7301:4b0d:b0:36d:bcd7:2347 with SMTP id 5a478bee46e88-370f6115d79mr10703995eec.4.1794208209534;
        Sun, 08 Nov 2026 23:10:09 -0800 (PST)
X-Received: by 2002:a05:7301:4b0d:b0:36d:bcd7:2347 with SMTP id 5a478bee46e88-370f6115d79mr10703958eec.4.1794208208772;
        Sun, 08 Nov 2026 23:10:08 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372660f385bsm11423638eec.20.2026.11.08.23.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 23:10:08 -0800 (PST)
Message-ID: <20300428-94fb-4ae1-8096-e6851f5483a1@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 12:40:02 +0530
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
Subject: Re: [PATCH 0/6] spi: qcom-geni: Add QSPI support over GPI DMA
To: Mark Brown <broonie@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <179415109036.3711751.6859082995940422062.b4-review@b4>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <179415109036.3711751.6859082995940422062.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyOCBTYWx0ZWRfX0KlDlUvZVtd8
 VFXwg5CqRu7PzjSNuGnJYzyorf765pgslcZN/0e8mkKnbADnLQXsWT6Dc9h4NIO9y7zD5zOraR9
 CGxMGoUUZa3u5oqBNQbsNSM3xR2ckOU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyOCBTYWx0ZWRfX2Qrj1eyCc45W
 Bi/oxeEvgqv7KAenleBwev9Znan6cXB270XCiMy3R9ROqo/GLTZjXmrMAFINyB3CLqGgqYEnmWu
 FFwZ03YYErZTnLdq/jdM8/pd6x8oKuEZ0dcL4WDZ9eGQdLYXda5IZp2xQRgmlN7fjW4sjPV/FX9
 EN6vSAvxd94yun5no7VTYKUFJIVwEx3zem0RRDvsJG6YpwN8+SOJDQ774EEaIITH1/WHTR0IFaA
 eziEn99FADXVu5US3WtDp35tQDihtFO+0wKh1DVL2hi8H32/NVp48fWmUAx46ptplyIUhGy0X6V
 SVGW/387Liy+5PJpBPfGtW1Y/cjPCJkfNnQdqtGg5dySujsUqcBGnaD26zER0X1onOzJ2W18ZLS
 T6DTyrTZbS5tWng+OYNXB0Jjay9Z4xWMYcHEmtJVi93Hs/naFlgRDNCHiLqOY46UGiC/hNMOKjv
 UOG4c1h5sZmjTJbtidg==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af171d2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=r2-LxIRbSL4R5ck5jzsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 72xX-Ozg0XcBfnsTk9ogVpCt80ucFcB7
X-Proofpoint-ORIG-GUID: 72xX-Ozg0XcBfnsTk9ogVpCt80ucFcB7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090028



On 11/8/2026 8:48 PM, Mark Brown wrote:
>> This series adds QSPI support to the Qualcomm GENI SPI driver using
>> GPI DMA. It supports single, dual and quad SDR transfers in controller
>> mode.
> 
> This doesn't apply against current code, please check and resend.
Hi Mark,
Thanks for pointing this out. The series was based on a slightly older 
linux-next snapshot. I’ll rebase it onto the current SPI for next 
branch, check for any missing dependencies, and resend the series as v2.

Thanks,
JyothiKumar>
>> ---
>> base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
>> change-id: 20261021-qspi_upstream_series-850249e432f5
> 
> That's a random -next commit...
> 

