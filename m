Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793700020;
	b=VbFZXWkXnTU454ScUxQgIbsoDgp6UDnRcP1kyfWHbfno4YPkVss9bZ561zjRWvBVcKX4
	 PLMt3UJKaawRkzAziL3PGRFVAUq+YaXBKVjF+sEb9zojR7Ad8aLMgFpeiozK/ZwdeSW3B
	 qazbnqDrrPuRIPHs+C/kRBLyAo4osowgyyeqeQMWGhX2dDya/2rnySlPiTf4hh1R4UlXO
	 IUcLptC8M1IY0hedAUXOlOpgiDFkEAB5pMtYDjPrNXX5mPdvO9oiv/8KQASuWEwFj11wf
	 QMRhg+BWNdiyXrcZRfrj9s9F5eHHL311ugvktXHSiCIIQbbq495I3mhPsu/0ig+ulug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793700020;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Q5oZvAe4yZHBD19Azg/eQm0Ntd5kMepBMsrszjKcomw=;
	b=15k6Pd+2UFpoeYL1dCJ7CD5t1LIhkDX1urtQ8Z7v/dwD44wLRUQ5Cbt8t7OcS0G81tCw
	 9sWqnivCdXVDgV9HVVG5rG3HyGAVDjL9QFbHjpJ3CY0UIRhSq7n35+RRpS+UxYDPqpgIJ
	 NFfuuiyYa9A8dHCBlXFCEefv2w3RSOE0/hJgNBI0jwk6bjdkGHyiOOBhMjxFbgK0qu23K
	 doYbHsANWR9NJHNbPBQjTw85XjzHT66FUY4/1pwRjMNZSRZTnn8KHiAu2eOA/3IAbtVKE
	 ToCY8FSy04ewsBr8mp4Y9r2ZrNxt0y1pNEE7r4a15rfNfOGLL+R7oXg0hVjdXQZiuGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Yf0zCZx/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kgo4t1Mg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6937606A820
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 10:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6937606A820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yf0zCZx/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kgo4t1Mg
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37tZKg1434036
	for <dmaengine@vger.kernel.org>; Tue, 3 Nov 2026 10:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q5oZvAe4yZHBD19Azg/eQm0Ntd5kMepBMsrszjKcomw=; b=Yf0zCZx/Ypb+hlgh
	oaZfNlIE0bWMGtX/K+RLPUHTz0Wwg/Buyj+nq/CiMKiOLobuqXVPSEKKkgjppctY
	qFvHKLboD8JqKHbUSFywllFzuktxr2yAn2aJ1LS6H0cg5g+JACskUXKgyPeMiwbW
	y1dL2Fleg7n+ikBv7AhgY7haz0RQEBiqkkaURO1CsTS7IWCm/VTgGK9MS1RqAX17
	QcM6/373sgRPWF1I41CQNHKa3K+qK7JbxIMjOr9Plw26WNmDbuqZzc5nxO5jQzw/
	mPygQQVxCxqT1WSHg7xvxIuMUJ2HABq+05dLyER6M9qfGA+sq7Dv7uEL1hDaIKTG
	WQuVzA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2acjjgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 10:00:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eac6e96bd4so58883635ad.2
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 02:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793700018; x=1794304818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5oZvAe4yZHBD19Azg/eQm0Ntd5kMepBMsrszjKcomw=;
        b=Kgo4t1MgZdHFTe2f0gNT3fsqi45/asbIrbnMvwpNfAzEeSyDZiDPgcI9uFd6ThXLdd
         vrpB2MSuQe8BvQedzS129x+1fB1JX79nAKWItQk8PHCIelC8edu5cQlurqOYJKPe7dL9
         UT8X1Aa4SDhnhmBD9pH1udE+zGXOTcEUUK4IqPbS2Ibq3me4V4AHrnr3NAUefaW1fQmr
         yLTux3XtvP9VdRQ6/hE/E8NlEqygTsHp46B6cvi3pTAec97gOOvPpAyaVSWAGWw+hVg9
         0cLLmBHWye5gJy7Js0i3BVdC8CgBTry78wN/KlgNRhNjcAGWueT5Hd5O63YoMaWi35gp
         APHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793700018; x=1794304818;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5oZvAe4yZHBD19Azg/eQm0Ntd5kMepBMsrszjKcomw=;
        b=bN7jKDcEZTULkFHIc0F4DexMA+6a1k2ydO7MGJC3Qejv2q53MFRSE1kgfpTP0OYsdt
         PB5200jfFhAR/0lOQ79XVFv+EpSvKMhvVQ40gTI0S8/WWZIs2MztzWO/CVPz4wUFdVuG
         sFwipKHNUfrM9Ygeg9XOJiM6h6CwYH45e58pCQbC0bwXPToW16v3Z8TxHtngSQcg9weX
         RlveKgHdq48eZGAIvEvVYTh1zvfBuUsvFtNj8LSxYc+Hj2iXQJfqdp2ZOuLkbSUAwR/8
         h0nNnggO1xC/o/WLe5815/p0k6yrGY7DqE3eT38k5/nTgktOeB+/HM+2geHT7a9m2zsU
         1LTQ==
X-Forwarded-Encrypted: i=1; AKwUvByw3g17DO+3R/0v3MuryPYjyyeTF8WtGSfJVHcs1l4XAeZ83yCNV2wVk4LufRI5h33BErjzqX5bBjI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Feptl+DffUZO0sjoCuvqU10wCwuJNQKq9bDLCEx6u709hP/AC
	0Oelr0dKW6Hczf1TGYWWHDRE/ttXdlf9sA2gUMAPaJjEUNwWwISS/I5tH1uRVCObCgnLz97SZjs
	lbI/uT6STvq9DvFBNiShPhpRdfarswHjIDLVICdTdPRuOCj3DIn1zrWwJ0X0oCbo=
X-Gm-Gg: AYBFou1n6awz5URsif5VqzU/HpsXrT99hVRhlP33WccwbcDxLkBMUN80vmWZow8myZd
	VLYYCxvXJg6dXYZkQZqUJ1c+7TWXR0dec7jNhNdZsKOsXhD7VfIx0WiGAAbu6TxDgZIhiyuGwml
	msrlVt4vuCgFfG15KlB5Stn9Vdzx+nW9+pQXvZu0yD7K9R4wMcN9l1tL6aZIMnbDk4bGemh1xX3
	51D+SC1rdoZtIQ4XQQASAALRiwQYspddnQtNnDJCSutYU+xXTH0qmPMp3uJaHFIxls0K/+f7E1O
	0AOaajmKzRvrISzMnb6Tun0A6Vb5/UCxTUDx0IillZaG9QuzvsRPc73pSCJc9VhDww/u1Iep3vV
	VTzV55ygNv1M3NXpxnN85j+s/rtH85DwguQ+ebfRT6ZX56/dY9dRmlta4nhz1/srnKd8Zd1Qlnr
	h3WEyB
X-Received: by 2002:a17:903:190:b0:2e9:460e:ca4e with SMTP id d9443c01a7336-2eb36401dcemr127984725ad.1.1793700017373;
        Tue, 03 Nov 2026 02:00:17 -0800 (PST)
X-Received: by 2002:a17:903:190:b0:2e9:460e:ca4e with SMTP id d9443c01a7336-2eb36401dcemr127984395ad.1.1793700016823;
        Tue, 03 Nov 2026 02:00:16 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eced9d14c5sm7467525ad.74.2026.11.03.02.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 02:00:16 -0800 (PST)
Message-ID: <08bb4de0-dc94-4c4f-8d1a-ad3a4fce86bb@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 15:30:12 +0530
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
Subject: Re: [PATCH v4 1/3] dmaengine: qcom: gpi: Add I2C bus recovery opcode
 support
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-0-59b3ce96dc4b@oss.qualcomm.com>
 <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-1-59b3ce96dc4b@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-1-59b3ce96dc4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae9b0b2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ue_Pd434T0zeNjF84AEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfXwE4ZW7wB+g27
 w7/FEfRKc/9c9q/UOznZAJmhXJdA70rMfyfC5trTbIrnxd70gqJogKJT+vc9VV2jxqNffr7jpLD
 3gIcoAA2rCr4qmkz/yJK537T/SV5gSemrGo7N12ARNPuqOvMTpq7T7YGJhesuw4KQGJay6yIjT6
 MW3vSXniOsOWRFNgMJlq8VKy8SGD6VMR8ktNx3rgiFlp0OQCZ6IZV7kWKKsFbQLsmur03Ob2ldP
 GwTbVJSVcJlQgDsSHMK+eEJxHz7px0Ph9+pbFZmrLZgDDlXWX4lpZ8MTVqaecKbiz0kA6dS5EzQ
 Qtk+2ZQUQlAqn9ObgYZa7z6StaR9/8ddcHtoGD6v2xLGL9gxlNfu7dPlGNmBKjJlK1WvN1q+fE2
 awAeob1ms1hzJu5Ed4Ewc9U09Bd8hd0/x+7oVcxKLCGuufK35Aj7WrDO+XGG6QrosfmkOreiH9T
 cCTS1xzzTo8euUK6LkA==
X-Proofpoint-GUID: -__0nDFjQkn0-rBnzvWS09PJmUzfDffL
X-Proofpoint-ORIG-GUID: -__0nDFjQkn0-rBnzvWS09PJmUzfDffL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX853TJ38CwG9z
 opKiDV5GliRh/3cCFMPocss6L9eQXvuNMMM/luc3FXMPXOwyX+nFqt7QCrjnWESQuaG1qH7NHZf
 Tfzv0DLbYm4mWAYjWRru17Fu2lNACig=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039



On 11/3/2026 2:26 PM, Aniket Randive wrote:
> The I2C_BUS_CLEAR and I2C_STOP_ON_BUS GENI sequencer opcodes release a
> stuck I2C bus, but the GPI DMA driver has no way to emit these
> zero-payload control commands, so an I2C controller using GPI DMA
> cannot recover the bus.
> 
> Add I2C_BUS_CLEAR and I2C_STOP_ON_BUS to enum i2c_op so I2C drivers can
> request them through gpi_i2c_config.op. Handle them in
> gpi_create_i2c_tre() by emitting a CONFIG TRE (when set_config is set)
> followed by a GO TRE with IEOT set and no DMA TRE, and reserve the
> matching number of ring entries in gpi_prep_slave_sg().
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
