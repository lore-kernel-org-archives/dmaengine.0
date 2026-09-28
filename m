Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C8B48488C;
	Mon, 28 Sep 2026 08:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584842; cv=fail; b=U+xwdALfxlCwwk17sKOap3jDQrovTNnXLhs7iGX0qP91Yo9ZCWdrCWyvwq8QYQqeLYRXRaCFxiqVQFKpz7cvFDOCNhmjq7tk/EAQbarvFvrMqyApxGniiwRmlV2iw4u3As+Fp1ZleRzzu7RaSigM7VHa5dGLPj7T5+PEeCJx5zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584842; c=relaxed/simple;
	bh=w9RjpFGe8xzyDtLL2ylZ4HK7fqkKxzbaezQ0FN+6+Ew=;
	h=MIME-Version:Content-Type:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID; b=vDN0vv3zrC6Xkjs0bGNk+eYYImzfTwmZLUQGgT/sRuhlxj7zZIi0zgRmZ/tAFur60a7DIlVQWNleASsW4wwiOvEdYDw7LDpR7RC1w/unpwprS8YDMrcmZAZfwOtjh0FUlPUNqlFVX/74gF6KUMrMWA+5TZhV2dzyrYd8Yb6fLhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=WyZ3z70+; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZeRyzU4v; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="WyZ3z70+";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZeRyzU4v"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68S80qrJ1237671;
	Mon, 28 Sep 2026 03:40:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=bR1dljbd/216GjLRsP66QsTaxHqTqPpXpJe0VUTI7
	MQ=; b=WyZ3z70+9f6E58YBXROLKiLbBwyIOHLtiHDDXmTxD3jyM7EGUTakpyKVT
	iqjxeHq4pk4rGfFf+wNNgo1sipgI7c2f2jhLLBM03j1bf1UWNSzRVJGflZrO3VeV
	oKnO9StAscRPv0EaRmHFwzo4m74Vr79HNn2HwwMDZKi24DQt37a9POwkykKXjbaE
	eIqT44BLKUChs40eP+GbQCIspOLmIRcJ/mCgQc5hfGomXCvJbd/ZKcifveZind4P
	7kPuf4YNRvDbLr/bDosGCtDGaIMMSMNazJK5sXdP37c5q3ot22plzKHneD0gq9eP
	pVDN8GiMElv1G55BBAViiYkX0Eg8Q==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011021.outbound.protection.outlook.com [52.101.62.21])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gxy2nmnwy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 03:40:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kw0f/GtZGd0KRE+FZ5YzIuYX3PERweQueikS+GAM3Zvgo7JOVG45WyUQUEFYpH3ldv/jInhOx97NEYO2957w8naBIymXjm8Ulio/p2j+CriRnlP3qie2aIUPhahj2jQ+T7/lhzCq3cTXV8WlaeBAtxOtlkZN2X9qCJ/Eqh3FKtlRlAU7+L/BC4mpj7MS1jQ2LHzDh+y+fgHgkBaV9tBUt3jw/anCd6HLiRTRVaQy4kxesigtEI+C5rWffBHzzOWQfxD4it5hvdDFCYBv3YQGa8D7S75ZEzhBjJVWzAy2DQ/EUvdJWOdxJlAvfnluI1I/v7R2b0EQhjbfmiFQtXc2HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bR1dljbd/216GjLRsP66QsTaxHqTqPpXpJe0VUTI7MQ=;
 b=vEObfFIS4qePgzgN3gwQp+pBp9s1yZmzWInAvo9O0ZV9JmMm/qRN24H0aoRX/DwAQNp+iR2JMe+O0kU0HPJgDK9I5fp4o37l+wJMwbfZLq2xQoxwrcGTkhfu+Fuk5+KBaigGBs1/q0ula0QvN8XCHqS22Uhx7yR3SKG5SL+FSpMjwh/B+C3VUGcP0mF1TYgy43ZAOTGNmkDvnSNAUfqdNA1IEErvP8DLtyK25YLb8oLPnIznOLS34oXfixcjWtbyKO0b/po85A9375qoCP/69eaweamHyTzAG9LYbOguTufY7N057simbuIQUmIM8Gy1IA2kOp0q9QIrgs9DEf52QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bR1dljbd/216GjLRsP66QsTaxHqTqPpXpJe0VUTI7MQ=;
 b=ZeRyzU4vRA0NZdbLdbdGhRZQqx+RTuNpX4UrW2P8Gx3qKwoN7z/2j4yTlOKzt+mLoiyqYW99Nthb9l65J3MbjSTWDmk+2ijiExNg8M3ldOZ9C1kQBBMOpjBWksv/3WNEU9mW/JkhAUWvtGn4iTiLsEzhxDAafk1DV0oilDzMpZc=
Received: from BN9P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::34)
 by IA3PR10MB110994.namprd10.prod.outlook.com (2603:10b6:208:70e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 28 Sep
 2026 08:40:17 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:13e:cafe::49) by BN9P220CA0029.outlook.office365.com
 (2603:10b6:408:13e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.22 via Frontend Transport; Mon,
 28 Sep 2026 08:40:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 08:40:17 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 03:40:08 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 03:40:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 28 Sep 2026 03:40:08 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S8dedi3686893;
	Mon, 28 Sep 2026 03:40:04 -0500
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 12/19] drivers: soc: ti: k3-ringacc: handle absence
 of tisci
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
CC: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <r-sharma3@ti.com>, <gehariprasath@ti.com>
In-Reply-To: <20260928025749.1055383-13-s-adivi@ti.com>
References: <20260928025749.1055383-1-s-adivi@ti.com>
 <20260928025749.1055383-13-s-adivi@ti.com>
Date: Mon, 28 Sep 2026 14:09:34 +0530
Message-ID: <179058477460.77164.10391157869979931047.b4-review@b4>
X-Mailer: b4 0.16-dev
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|IA3PR10MB110994:EE_
X-MS-Office365-Filtering-Correlation-Id: eba537ea-c8e7-49f8-56a0-08df1d3c1f7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|23010399003|36860700016|4143699003|6133799003|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	lx9W27/g7V54UNGIpgfre8vZXrbfRfAb7noN+s578gT9P9De78rkg1tMfIk0jAiuf22yGPodaeOf3Oad5bXI0EKFpRWWnu2/x52AXC8/YRk1g/npdfbRNSbhtdbd587llLGuDkC9DoVG2VrtUwV33/jSvFNHYXUWE6erEy5Bo4BAYAzowwwhCPKo64IWXXYfBvbsQIjftiAHaqkx+n9k5UXGY4DOLolLsEhiiEZzG8udtwLaStRhL78LOekl/13qzSHLyhY4w24jRKpKGCAToqksvqH4TW/WHq/XOf61VRIMRUDccacECY7V1ewoyOoCYOFbgtLT+3JlnLhmYfZkY8PFbFY8e9Ikdtb+SmfEWCHgatsew741jNxxx3hMv1Tuv+gTXjf01+Qq7USQlo3dZnhueeCPQdOvkgkDCfkGrpL/uIDGPdl6sVM74NQlFLPoZrzXoxGlp2VO4rK6dOOtZQv8eokACvW5kXv0Ts1QwzEd81Z76+V8S0RSI63EMkWhp7W0I8/A6D/sJ3A8R3wwcy5LZLI8d/6El1VByMzbqHG8CWe4kAitf6SFxem3gcFI/kLZ9rApLC5Ff59ZF7a8Ask113zaaRoW86JxiReyKTQQ5uhioHgWj89kREz2NsejAwcT2tlIk4myGAIq0mHK7rEjUMh/rMP9exHi3kJCHsqoHZIREPBIeqVqErwsqbeN
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(23010399003)(36860700016)(4143699003)(6133799003)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yJix20Hrhp9jx8uygPl5PIiXfNwXBpzFpQ2FnbIbuLfs1b/O6vuBznr7gtEpxTyY7FhSlK8ClWGFB/cldJY7QPPhkdAGunC9pOhX+GJKkGyP/H2jtbPmK2++dTXrp8eYl/nMNW+ObEZ5vOBFiYC48sx15I/Hv6wlRqVgyYxoiyHAw6RyQA+9fd2W/xVqmTtKJKXN48DNUvPFfgEewCBf/LwY6lVur3cmAGc/7wAckGvXfYbamA/Sz1v41Cz4H/MIF/fkMh2TbsYyIz71SVduGF3chd9pDYRIh4uYlTvdfwm2hNl954GpegDX38mGo3aTLKmY97qKA3a7I2cEsVJ3SdiHoZIgWj5N9Dbo9Cb3tNmRQE1SslSTJErvPsWtk+PKh32djKfheln1d/CtJHR34GpedHmSPnil8CsTxNwMnkf2LCuGz27Ec5KEZIR08uVI
X-Exchange-RoutingPolicyChecked:
	1v+RJOyDUeraJBhETbkEVl25IRlR6O+/zq4zM/8hr7oKCwK5VtQ9NAamVL7sI+xPyrjqWDMppSzNnmzMTrDLGfns39RBY3+Z7DPVxiTyEIEjSzU07KmVhBG29OTKSq1S11SgGdU1o3mIZZsHYYRGd0xsRX1S4hw7hybRgIAfCFC9J62FcEX0jHK1nDQW58Z8Vac8IFLCCITU7+Z1bsVFwF1Hg20KYV6b+Db/8uxmyh3nt2LMIaTALtSt2+AI5+X8tbyZLc5iFLkQybJAlhv8/59S+ZXD3Fq4Ykdd9mLGnXwDVUI9DuE3zSVPk8G03VxXandt0naIAQ51TpHsezO5hA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:40:17.2214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eba537ea-c8e7-49f8-56a0-08df1d3c1f7d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB110994
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfXwWGlGf9mLWZb
 ONeTB9bXxkoMxM17NE6vrKoqR+lMSR+tWSp94M+Ok2nBTZZHB2JuglyfR98kXm9L4V1Ee9PvJor
 1y3/okXCTWDjR0ldzckiA5yYJVaPcFA=
X-Proofpoint-ORIG-GUID: 6AHA6M42FR0bLPhk9l_pfvCqQsubalXs
X-Authority-Analysis: v=2.4 cv=RLgmjIi+ c=1 sm=1 tr=0 ts=6aba27f3 cx=c_pps
 a=k+Wq2vL5ZRQmlAOTCyP+eQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=xUSTrGpbsec0VNCNIEYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 6AHA6M42FR0bLPhk9l_pfvCqQsubalXs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfX1+CGFqK9qepj
 iFTcbrl5iVjHH3efnKnd/SHUnrCJ1KUqBn10M0f4NyCNBhDwNfLN1UZeZfT2DLgEgVduCq7iZ5C
 jhW5usaMs/xeM4PpUw4YadB71M2VZQ4WmUKtpJjXah72BPlRnvGfeUjZ4Y5zni2jIaVP32kZkOG
 NAnfmaIchWLBiRI3a9C7PCvGnEKXr9mocl4bvmGPV+fnBXnqKv61x00HC6yR2cDbyFfV06mGp4k
 WYxZeF2I3L9OYya7yVBlZl+x3oI12YP9sXfUx5OkxD7VImzvilgYKjJ7m48qXsUaai7gjRUa3f8
 ml9yXHfkE0ghf20/sIFycthRK8cbxMUjIOcJxhd5qYw22CXProT3hsdsQuj4iYrWMbma+1iyIc1
 MvjnOA2r70BbWFuQ5U9utXCHGeVtOh0/uX9TdjbniVqYibaYlXBnfFKxPBCgM18tEJ7MtCb15qK
 88Ex2h9oTf0GXLx5J+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280034

> Handle absence of tisci with direct register writes. This will support
> platforms that do not have tisci firmware like AM62L.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
>
> diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
> index 5966db4327b1..15fab94e8cad 100644
> --- a/drivers/soc/ti/k3-ringacc.c
> +++ b/drivers/soc/ti/k3-ringacc.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> @@ -46,6 +47,53 @@ struct k3_ring_rt_regs {
>  	u32	hwindx;
>  };
>  
> +#define K3_RINGACC_RT_CFG_REGS_OFS	0x40
> +#define K3_DMARING_CFG_ADDR_HI_MASK	GENMASK(3, 0)
> +#define K3_DMARING_CFG_ASEL_SHIFT	16
> +#define K3_DMARING_CFG_SIZE_MASK	GENMASK(15, 0)
> +
> +/**
> + * struct k3_ring_cfg_regs - The RA Configuration Registers region
> + *
> + * @ba_lo: Ring Base Address Low Register
> + * @ba_hi: Ring Base Address High Register
> + * @size: Ring Size Register
> + */
> +struct k3_ring_cfg_regs {
> +	u32	ba_lo;
> +	u32	ba_hi;
> +	u32	size;
> +};
> +
> +#define K3_RINGACC_RT_INT_REGS_OFS		0x140
> +#define K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE	BIT(0)
> +#define K3_RINGACC_RT_INT_ENABLE_SET_TR			BIT(2)
> +
> +/**
> + * struct k3_ring_intr_regs {
> + *
> + * @enable_set: Ring Interrupt Enable Register
> + * @resv_1: Reserved
> + * @clr: Ring Interrupt Clear Register
> + * @resv_2: Reserved
> + * @status_set: Ring Interrupt Status Set Register
> + * @resv_3: Reserved
> + * @status: Ring Interrupt Status Register
> + * @resv_4: Reserved
> + * @status_masked: Ring Interrupt Status Masked Register
> + */
> +struct k3_ring_intr_regs {
> +	u32	enable_set;
> +	u32	resv_1;
> +	u32	clr;
> +	u32	resv_2;
> +	u32	status_set;
> +	u32	resv_3;
> +	u32	status;
> +	u32	resv_4;
> +	u32	status_masked;
> +};
> +
>  #define K3_RINGACC_RT_REGS_STEP			0x1000
>  #define K3_DMARING_RT_REGS_STEP			0x2000
>  #define K3_DMARING_RT_REGS_REVERSE_OFS		0x1000
> @@ -139,6 +187,8 @@ struct k3_ring_state {
>   * struct k3_ring - RA Ring descriptor
>   *
>   * @rt: Ring control/status registers
> + * @cfg: Ring config registers
> + * @intr: Ring interrupt registers
>   * @fifos: Ring queues registers
>   * @proxy: Ring Proxy Datapath registers
>   * @ring_mem_dma: Ring buffer dma address
> @@ -158,6 +208,8 @@ struct k3_ring_state {
>   */
>  struct k3_ring {
>  	struct k3_ring_rt_regs __iomem *rt;
> +	struct k3_ring_cfg_regs __iomem *cfg;
> +	struct k3_ring_intr_regs __iomem *intr;
>  	struct k3_ring_fifo_regs __iomem *fifos;
>  	struct k3_ringacc_proxy_target_regs  __iomem *proxy;
>  	dma_addr_t	ring_mem_dma;
> @@ -467,15 +519,37 @@ static void k3_ringacc_ring_reset_sci(struct k3_ring *ring)
>  	struct k3_ringacc *ringacc = ring->parent;
>  	int ret;
>  
> -	ring_cfg.nav_id = ringacc->tisci_dev_id;
> -	ring_cfg.index = ring->ring_id;
> -	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_COUNT_VALID;
> -	ring_cfg.count = ring->size;
> +	if (!ringacc->tisci) {
> +		u32 reg;
>  
> -	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> -	if (ret)
> -		dev_err(ringacc->dev, "TISCI reset ring fail (%d) ring_idx %d\n",
> -			ret, ring->ring_id);
> +		if (!ring->cfg)
> +			return;
> +
> +		reg = readl(&ring->cfg->size);
> +		reg &= ~K3_DMARING_CFG_SIZE_MASK;
> +		writel(reg, &ring->cfg->size);
> +
> +		ret = readl_poll_timeout(&ring->cfg->size, reg,
> +					  !(reg & K3_DMARING_CFG_SIZE_MASK),
> +					  1, 100);
> +		if (ret)
> +			dev_err(ringacc->dev, "ring %d size clear timeout\n",
> +				ring->ring_id);
> +

Should we error out instead of continue to set the size below?

-- 
Vignesh

