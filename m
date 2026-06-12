Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B56360ED8
	for <dmaengine@vger.kernel.org>; Fri, 12 Jun 2026 07:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249785; cv=none; b=rTR7t4hMvMAXCp/bLUYie1YkjehWe/Bj37SCcvaoHgu91NJcPp2mbbNa9D4regcwMOjDOJlW/8yox6zYVkhFax6jtkBIoKJhhOkRd/toDOWd/2TtXgrRdfNEWZtVcKyjbAwfqbb2CfJN9yMkiqS92rDh3uZpFKrB4LKV50hTuqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249785; c=relaxed/simple;
	bh=zLK4vIyTb3zMOVVwi7tnFCAnefQmy3O8FM2Pd2Atd9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mulKQUQxJexHPZ3xzCJYoFnUnpMbeTZj2Xo/VlBpJRFrUUIU3xOlKtr9yOTPSCNO2ZFQrOx8Wnli5R0Yx30enACbU40LiONiculQNyGGZcu/dwCzGUx1YRYKPlGeJiO6EPgGfEFE801H9N+vcSjAs/kf3uMK402oSaMvSgYOPbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOy52U6R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iykEZ8Jn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOy52U6R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iykEZ8Jn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3CDd12534915
	for <dmaengine@vger.kernel.org>; Fri, 12 Jun 2026 07:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VhQvvEvPrV2tiBkj3D1VCX5F
	7ZfwSyik/UAuMqqP/wo=; b=hOy52U6Rknnj6KWDgEH+fipzM/AK3PE5HIn1WVLD
	vyp6lzOf3GkQ5JYszrhxTCIccxLGdD2exOx1TmIEMYgl9R1VI1KEuXWCaFTZZY79
	ctg+Jthoi2byUvLs7qvn+qDi+uQ39EKNV5Bsx86tZ/sreO1sWrtjni5fsjRrtJLr
	WRpPNsKcV7avOxHLrNf80uiSaOAPlC1IrjDcbQWHwIS7Myh97Vd/+PqHX8N8c9+L
	HsHRCHOqN4+mokB2r+qLMH9GDEAv+7y4bP0UsDpaLKMxIXUQ6fAiFMiM8yRA8OyS
	vPzp1nh2p6lZLr1BSPd3/Aala06EDQ5g8wwPFBt6Ma3atQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er76eh327-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Fri, 12 Jun 2026 07:36:23 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6798c46f723so280130137.1
        for <dmaengine@vger.kernel.org>; Fri, 12 Jun 2026 00:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781249782; x=1781854582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VhQvvEvPrV2tiBkj3D1VCX5F7ZfwSyik/UAuMqqP/wo=;
        b=iykEZ8JnneOrh2rkivFsPm9iU78+6H5u9bGHBuUdRH6G/5epDIpZ0BmLNT+bGxEfLc
         eO77qzhMZB1BnKsio2kDYgfjvBXur+iDuV1lyHOTZBCWpoJcqaWBPiODKjBJFVY1ZLnN
         3vJwukXwOBWGGSymSaJeLltIZW7ploxc7pb9kO82bDjvCdWI9KBvs0yaPWTzP6hm9/bD
         03byQ87lDFlVT/H5rK8cDbF0TVTufk5ij8PYMdYoym02bmSD25Fg2Yev3hstKkKcxFdE
         uwOySYQBbUGhbXXIqfIEEPJQaJ9tieZRN1/34cAgY7d/xlV8Z0k+qe/H0tEhTiZQDP9T
         WR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249782; x=1781854582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VhQvvEvPrV2tiBkj3D1VCX5F7ZfwSyik/UAuMqqP/wo=;
        b=eDbmSJ5UE+03rJsi55T+/9bPR4C7Dj7D5j9ujfhDaUAZ85XDtRFtiQrPU0tiKIBqHz
         um+CSVtGIJBwhuKLBeE4SaXg1JMC/M9XgTmqrTZYF2uP0fisFlegnFZS3mEIyaAfRaEj
         c6cC0T9iJYGZ0REKbhddDJOtrlc3a98CppVStGqH7HSZW6zw/LL3XlnzcnpQe18kBbkE
         /wHm8hrSp+1ezjdurov5wuBgP0MjRVagO/8sWlgi8lNKVVfhA/es8rpVcAcmqG5dfHId
         PWdHiCb8rCHGwKRADemGChQ5dpLcSRZCYPWJVnVEpG57qJU61TGJiGJUFlph2VX+qYTt
         MNNg==
X-Forwarded-Encrypted: i=1; AFNElJ98z0M+/PA9WfonDIepxVEO/o5VKWlLvF4GOzVhM/8QfR3OPRRTjIKwkzT56cGdklNku60QW3JSESg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Mo2EQp806HN/gcTR+UtNmrU+IlvHRUTHX9AiauipWkm6jJKi
	yR40Z2swFiEc88eDzBdhaQiepm+pTAvo49/HUfBK5V5XrM+noTyVlxBfQXpesyvsFck0aIW5W51
	YO8Z3TD7vio9brbAq6+Bm9myGn8v6gbrX2uBFR9ZsDACKK0Sq2XYte5++i3EaEyM=
X-Gm-Gg: Acq92OEicyHwXkbJqeJTsY7mmaqMJY5RtXoU42J+GlueWe+QJYBQJNU5bwxdRLPMSYK
	sK+pftIrxthmCcFU4a4wTnFT3uonEfgZoXWZuaM2SpGqALIEo5pnAjtUXBCCEAT70z9LPZjtIwM
	WHH0vy6U+ZOlrhBb5RmTULU9o3v80/TjbmRDQ+Nb+I90sT7V9f4jyP2uEetTHoVf/cqeZyo+Il/
	TsJTRqZibojkGdLoEzqKosuEZFfTYWLAiHtLkUpNwO8Nbu6zJi1AOP0FjTMqALzQPJ7AasO531l
	/W31XA/XAHl9MqR3GYY1frOznh87XlUEIj5dU41oHLZK/u7nvN5G/qMbBugLDkzYOXh/sXjBqkT
	SUbazY+3EtjWm1jE90FT1XB/sh+MaFFAFcQxjuYAdeUVG6rMotKQ007sNzZKKzjibKvIYSbZJ+V
	iQ+wkuZV+EqbCTnh5Fc30mXaSYSLbjxDOsQTE=
X-Received: by 2002:a05:6102:2c13:b0:6a2:cf9a:9221 with SMTP id ada2fe7eead31-71e88d98c20mr535054137.20.1781249782481;
        Fri, 12 Jun 2026 00:36:22 -0700 (PDT)
X-Received: by 2002:a05:6102:2c13:b0:6a2:cf9a:9221 with SMTP id ada2fe7eead31-71e88d98c20mr535041137.20.1781249782059;
        Fri, 12 Jun 2026 00:36:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190f5sm3858341fa.25.2026.06.12.00.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:36:19 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:36:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH v4 10/10] arm64: dts: qcom: shikra: Enable Bluetooth and
 WiFi on EVK boards
Message-ID: <tiu6vzvcs3bjuctj66pznsforbz2um72nikxpzfe4dhssjn3jj@7rvevlne2htt>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
 <20260608-shikra-dt-m1-v4-10-2114300594a6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-shikra-dt-m1-v4-10-2114300594a6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=O94Jeh9W c=1 sm=1 tr=0 ts=6a2bb6f7 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=bA5z4lzVfraiEpfBxBMA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: TgMqKmjrpFB3_Tkzm1bUlhpjt_5rZu3k
X-Proofpoint-GUID: TgMqKmjrpFB3_Tkzm1bUlhpjt_5rZu3k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2NyBTYWx0ZWRfX/WH1kgWmpKrm
 /mgc+o419mq4LJY2Pprwro0T9NLmPO4ZazTM/7xv48nuL5hO1AdnuCJgAk86AB2n6sKp82pMp+4
 y5KBWtKGk7jAQtcBqRfMkV6pHta1MF+UUxDze1y6/NFeGe06rRxo5YDYdCDCjGTNLNdIjcxidgx
 LlX0QF7fO+xAn5Fzsw/QLauGXwH312nrjljLUNl6ytZ5hFfHNvGVi1UGBXwkn/NRawZA8IeXs+L
 jcr1WcpQg5zBOBj8LdDPQ1HD1hWit+Wnu6Ovqv1p/Ipt46GFnsEltfmC58NUHUGAUKroVq/BSAJ
 jTvqOVEqUZ8F4xV33J4Zq8s/28d/iq5j60QM3okM8KF0uxGllz+Z3+9Dw1NyXJ5ZDir1G0p8dFx
 27ztxIYlWe+v/4UdWk9rjOTOXEaMVdc4QR+gQ+Wa3w6zLZVRb+w/uu9Mp4YnYaTRbzqqHuLZkqr
 8IsokWyzySS5g6xil9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2NyBTYWx0ZWRfX5E98Okmb9hCZ
 q6A5l/C66AIn+VU4xqZs+k1paZqbDGETbJk64CamgU6gkzad5zz7RCRbrVAgskPFBFWdq+OXHRo
 Foq8gtNeGLmnnbT1Mfw13+AvP/BoC1g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120067

On Mon, Jun 08, 2026 at 06:40:30PM +0530, Komal Bajaj wrote:
> Enable Bluetooth and WiFi connectivity on Shikra CQM, CQS and IQS
> EVK boards using the WCN3988 combo chip.
> 
> For Bluetooth, enable uart8 and add WCN3988 Bluetooth node with
> board-specific regulator supplies across CQM, CQS and IQS Shikra
> EVK boards.
> 
> For WiFi, introduce the wcn3990-wifi hardware node in shikra.dtsi
> with register space, interrupts, IOMMU configuration and reserved
> memory. The node is kept disabled by default and enabled per-board
> with the appropriate PMIC supply connections and calibration variant
> selection.
> 
> Co-developed-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> Co-developed-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 59 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 59 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 15 +++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 67 +++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra.dtsi        | 23 ++++++++++
>  5 files changed, 223 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
