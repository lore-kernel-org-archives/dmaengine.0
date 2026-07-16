Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD61932B11C
	for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 18:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226733; cv=none; b=eRLUuggnD6YK12KlAUQOzGfvVJ1wHbKZxMUQFX2EJ+Rk366aUL8qZb/hWvWLIUJnaNPI7iicXW4WLvohi3MxzMQcLSzPYHdorj2Mkx29zFiTP1c2r67AOPCQ/wrOxZCSIDlPjc1aSPEM+IHO0exRgUKy0eN7w4ETbb5JT4zPPc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226733; c=relaxed/simple;
	bh=/3bsUgW4JIhWwwr4l3m1rNpjICiTpzV83j1/DCQUvxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jRewGq3KKnISeKpacuNP3zNwfUpGKhXKcLk81q+68mrnoi+fwjTRNhmvmiPOZhtVXw19KwojkWyXOYgFfpTOFDoxmvH27vBvWf1Lb7Gk9MH49RolAAaLFNNgxdjaoA0WzjNy8SRVyo2p+HiZZ0AqyKL16xGHrob/Ja212OdbMUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADrAHbvo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kE3b0GD/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADrAHbvo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kE3b0GD/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GHZXDE385739
	for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 18:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iW2mkF4EyoOKElGESddOwINgN5E2BvggXwdyVkgiaWI=; b=ADrAHbvoEHAnawAZ
	lZeTMm8mREvOvHREmo+IIcGcQz+f+xDxiRa1bY9Pg+jTyVLi1scRMO8VWyRQpneo
	oQBAzvOwakxjSOsbRnRn498FMccwz7QaKqHzQIMp9LsuDi2QVFsK90qszsG9q8ml
	WcqxdOz8Cz/X3GSYYd4cFZ6DtNLcgGVRaEHthKKk5Xkx0YWTXAx/tB+7QSJZYopx
	S6jh0NUl4QdK2LN/Ji13SKZBN0mK9lq+kzvWuARpdA9ZgMbSW3ydsO3V+lqfaqV5
	GlhjWcm4i8kVjrh8+1sj+ULxI8ZRBUKUJXRxkRNYob1M/nLQ5qt6RNVwT74m9uiS
	PHqqZA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6g702-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 18:32:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51e9d892f0dso3741631cf.2
        for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 11:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784226730; x=1784831530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iW2mkF4EyoOKElGESddOwINgN5E2BvggXwdyVkgiaWI=;
        b=kE3b0GD/bXShVc4E9xNcV9ki6+UTnJMvFhGWZKrx7gfwOFYuxsXZxxpnkjmOw5skcH
         xHiIYAV6D+Hu1qTftrs1LUM/1ChpGAUUTcLtItCI7YfjKRFKHCnZ6m9f3tKqxUmVxj04
         Z4zG+juHNvg5xvk3IWFrUo54kzHFN9pgzUEmBMb8sIRM/86f8Cnmmcl6i6RgXZRYN9uJ
         E5KaYF0KHJFUKDf/OOlFJKXxRvOCbgKxgCvEa2E2JjKu0ruV42ptM5hUualDWJYYIBDH
         lYjMFwny+KXcghRakaQO0fcbZat/6KQYRUT5ARuf4GoAchVEj0xCqfD0mg5QA3grcnx0
         OsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784226730; x=1784831530;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iW2mkF4EyoOKElGESddOwINgN5E2BvggXwdyVkgiaWI=;
        b=hdVH0Ts3tD3cyJVK0T2UAB60bvV7thO61jVSojHAkwl2+bL7UsBtrqE6NGhSPsniFf
         OQK0CiZTZq6g009pbWb4f5kTesl7jGLgiT54hZkJU3NGrqpXDv6XPbGs3aQdBCJDA8wE
         sgETlFFbijfWSOgsXLOGtdaw7tQpyesHvmdhlAiHLxp40EYhYmiTx46tj96B4MRb6xW3
         edDR0hfoD8wC3KTxX+Cy/ooc4Dks5p7UfOchk/HFV99WzlDxbA2veycCWApK/urTglh2
         RiHhU+GN/Ag0Tmhjsk/IE/GOsD5ooULN6Xd30qrEqVa2frirtV585JWEEUdSk2J/vi7y
         cwjg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3UcHMsFbnOlkc95xVHkR4Iw74c40cQkj/7vCH1HvGL7w8XBVN8NBFoLl4q+Hb9k3DcV9y5vf+0sE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywaca9Pvp7fl+E/tefuWf5na6GU2SnF+gqhnSTXzyrKUSkPFRjg
	dbaLEYhxH/13CKCb4kv5RvP6IUKRM/ZzHE6IiLFh6Dt3R2PU6LrVkIirKLTEu9AvYHEW4guSaSV
	0kG+SfU5tXxzzhx7YFiHHrEv7Fvpn8K37zdoo9iSLmoio8qwkPgQrn/mwjjXWAOY=
X-Gm-Gg: AfdE7cm0BpI46hvWsDclZYz+G3P5YuFW7xDJfDQmX2kD45SP8jPZg4opfqP0VP7/uYk
	Z67gEImisYVmZxF0E7atu5gKAIzieGZDXhOdyMchKdIpXNrdXV808UtKVAI2ogh9hO1qkcpRlh/
	55Yso4KahtshjxH18PK+urla1CD5bhVKnZUhCseeTImJnk8txHo2RTJCT69eKuJoTF6FVLACnQJ
	AtXtz15+jwhZBe3LqIS+Pv8UYUHK1+GGdYUL8RJI8u7d0mAP+Y1KLdCIfpXZNsMeOza8mXWLVEe
	aCi5NA1CNjZyA1PNVhPgqu6XWU4i7Usfo6J0Wpb0waxs6YVFmr+0wGCgFsmVlI1c9k4Dsd62jlD
	0vt9b04qeY705T0/y6yUj8Akl
X-Received: by 2002:a05:622a:55:b0:517:6162:daf5 with SMTP id d75a77b69052e-51cbf0e6270mr190678481cf.3.1784226730087;
        Thu, 16 Jul 2026 11:32:10 -0700 (PDT)
X-Received: by 2002:a05:622a:55:b0:517:6162:daf5 with SMTP id d75a77b69052e-51cbf0e6270mr190678071cf.3.1784226729657;
        Thu, 16 Jul 2026 11:32:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1687171464sm258484566b.19.2026.07.16.11.32.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 11:32:08 -0700 (PDT)
Message-ID: <b169de67-585a-44f2-a7b0-7a923274849a@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 20:32:06 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/11] arm64: dts: qcom: shikra: Enable WiFi/BT on SoMs
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
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
 <20260714-shikra-dt-m1-v6-10-bee265d3499b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-shikra-dt-m1-v6-10-bee265d3499b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE4OSBTYWx0ZWRfX4/Dkg+dVtS7J
 24oUVEMDTyQwHH37M5I/UeXCSUn4tqz9tsI72Y7qNfUffjvTKm27WAv0ZWwKjGNrHAh6GroBgpS
 zAhyHIvkw9rikcf/2DTk0PduCLdpH9d1xd+VXjG3IJP9KIGPiv4VqqaLyfkyExBjWa8ksUIKeCT
 yaXyn/3MypKGK24ssTYBvrSYXcQzTR4UQ/nl7Fp4KpKU254ib88tSiIcWJkWD3m0aZyTX0R9GEl
 tk8DqhUV7frT/ixmJlbtOUAodST9RXc/2MotTTfSURFmHSg/pwGDXIbUE/4zpHyg9kvFQ7iW5CP
 MNKiCz/t70gMaCTGi+gmk7g+6MJYUDvQXgIzdxUWyqkbuzCj3m39zlHNaa8+ooa0vAoOXyP6wJe
 /rOliu2PgZsNbKm+oMxYJUHWp6G1jdP4yDuywIPxB2K+uNcRcW/faNQlxkZlvE6AIra8WYebAkS
 Ey//4PMauKmocbh8NmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE4OSBTYWx0ZWRfX9oEaGNC7uCwS
 uExzQzJpL70Gs863Fm82Xye5wJJ9Mc12YqvMG7KBcAYfJ+TMYyr+XisFqXuu8iKpXvn+RajuAwg
 gz9vutBnv3YhwFwbJFu+rCDWlQQDy80=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a5923ab cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=X6UgWjF2pf8hxxav09cA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 27w7AJ9MzQ8q-KA6vKaybJCf5lXbSiwj
X-Proofpoint-ORIG-GUID: 27w7AJ9MzQ8q-KA6vKaybJCf5lXbSiwj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160189

On 7/13/26 9:36 PM, Komal Bajaj wrote:
> Shikra SoM cards include WCN3988 WiFi/Bluetooth chip, with supplies
> provided by on-card PMICs. Enable both interfaces and provide the
> required supply and calibration data.
> 
> Co-developed-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> Co-developed-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

[...]

> +&tlmm {
> +	sw_ctrl_default: sw-ctrl-default-state {
> +	pins = "gpio88";
> +	function = "gpio";
> +	bias-pull-down;

Missing a \t

[...]

> +&tlmm {
> +	sw_ctrl_default: sw-ctrl-default-state {
> +	pins = "gpio88";
> +	function = "gpio";
> +	bias-pull-down;

In the other file, too

Otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
