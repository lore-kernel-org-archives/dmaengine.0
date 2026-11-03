Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793719138;
	b=2Xc3pptKivqt7kxBXPy4kXdbIbs8wg+c0KEmk6GsN/t7fegMrphkjTQUoqDW2q1BZNjl
	 ewtz6H000XXgGzRknneuP0mM2Hw8m15khXja9OhhYEdQzExeVaCe+yNav40JJvygR4ez/
	 z9+lM5R5+NUttBgdDQih+IG6nHGBHhCUFBIatnLXQUGxHiwFAIna9psQS1j/ZIhUcL8EM
	 5F9wzEbHwmFlEBT4k3mFA42WZ5S8+KO5PbMy6mmrtHjrZM9UT9/kmOFjg5H8Ww2dUnp75
	 I9/1vkcKjB/4TnOJvfHkxp7hLAbN8/hMBbS+564BF8slfmGcFXBX4vAyL3ZO1CthMag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719138;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=xD1MitQ/D4Vo4PVLmkGOjTmPz8zSeneDpQm7lh8UnF0=;
	b=ewnuJnVZuMMt2UBpniQzWIeTDGTw+DWo03Ds7BRA2SvMf/T4XwDQZWeVioiLhG/elRea
	 ya464qMIdsb/zmjTtuQSNh5PUiXfzocQMJedvLzYbgzpdelHQ30ce0KIoxVh/HUyMe5/f
	 eYn6XasoCdQf8pZ8065C+Pi5erTwZTYUpTFbQcn28V0rgaozVUUqGTYcJjRhrg8XCseYx
	 OifXrY1jYr0naMsVoFvdoB06HrfGJVwiGGiJpa28CJPM9oYQuj3gMh6ef8Ry3qz0a9T5w
	 Gd1j32heRz+xvFjwcgfEuoeeCgF0kNWn15SNu6s41hbj+bU3FEnstSKMG3TYqtrshZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=o6MuNIEc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.62
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010062.outbound.protection.outlook.com [52.101.69.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B0C6071A18;
	Tue,  3 Nov 2026 15:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7B0C6071A18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=o6MuNIEc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=efgms1/Iwr/UFjVk521X+wKUJR+KtJPsglTut6jnkgNDVllzaahOW5zTMZi+LiBvZvszPg3PFSC1RtK8KSKfxlwj2AQ/1+Bmg/Wqj6A4an5KwFoq74xi6iWkylveVrjO97GXwmhTxmXbi30dmX+7F2Jj/x5GtcN4UhbCg2PocLY334GRxclAGX8OGkMGD7z+rDxG1BmY+G6slrpDO2N0YYpQa3phIMePRAgpkdR5YAo4P1qZpo9y1Ipe09axwj4oc2/wKyoc98+pVGnJBUO7XQwmecwhO7hsfe+A5YfUStXM/qc8X3nokoNG8kd9vnWq5mHX9X2/dyhSOUHsLLH1gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xD1MitQ/D4Vo4PVLmkGOjTmPz8zSeneDpQm7lh8UnF0=;
 b=l2j8EKSbAKVg+wtMXt8nQLIrsVBiyhqomgVLpxCpVw07j6SaRFFawXMEN0YUCzevLG2NO+a1ZI8N4RGTu8mCmClZUdiwUJD9Z5tGZkH2b7Tvo8k2NvNE5lYIvVHK3chzBplz2xWopoA2udEhJ045u2pfRYDB2K6XXZjdEwPH3V60is/dg1yNw5EvmyO5F6NXIThGYcAutNgcQk+2r4W1vFgIvBnJIIXbsYX5vBpuYDR6K2rygA9UDhx9V7bLDU/YnI3ri4UgCeVJAuWxaTEK8v2ahxPLTdkGpyYwmN40mONHa93iMUScsiCp4xqKjGtPxTsmOGA0RPW8wurdSGzcXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xD1MitQ/D4Vo4PVLmkGOjTmPz8zSeneDpQm7lh8UnF0=;
 b=o6MuNIEcYt/5FHMDOXxFniKEyCk05g/+H7gExn2cXtqLdEmJ7d0QJCAf11ipW3Av4hFv3G8thc8XhVBmdRWTOs/edhRf7epbv6EiYpvnflgNkvg/InkFzsk7ijM8B6yrmXxqXQZpjJxInyl4vwC4hzPtBE/zXHJN/X/xUYa5Qlv9pGtCZpxJxbB6DlTD+dtMGRjwe7RVOj92GHDfw55PZ+q7+4rrvxHFP7rfi10eN0RNYplUHgwSHbBFt4gD93GOd4AsV/YVzPGt3j8uiotyBRsiUwFr6uGvPjYlmBMhs6r5F5EkMwv1X2CQNS2b9uWc/5VTknwGQX/0eNW0+CNvGw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA6PR04MB11808.eurprd04.prod.outlook.com (2603:10a6:102:523::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 15:18:53 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 15:18:51 +0000
Date: Tue, 3 Nov 2026 09:18:43 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Li Ximo <lixicaicai@gmail.com>
Cc: Sinan Kaya <okaya@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Wang Haoran <haoranwangsec@gmail.com>
Subject: Re: [PATCH v2] dmaengine: qcom: hidma: fix memory corruption when
 active list is empty
Message-ID: <aun7UyTzIOyJjUbL@SMW015318>
References: <20261103083214.1682930-1-lixicaicai@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103083214.1682930-1-lixicaicai@gmail.com>
X-ClientProxiedBy: DS1PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:8:233::8) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA6PR04MB11808:EE_
X-MS-Office365-Filtering-Correlation-Id: a6c7ff3c-b5e6-45f8-e5f4-08df39bdc3e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|1800799024|376014|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261028144727099003|261026121527099003|261026140227099003|11063799006|10067099003|56012099006|22082099003|261102123227099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nHbkl3DxfSuLvgv6Pgypbad3tImUt4k6Vy4tXwl73dB8wYONIn0JQTKdVQSmid4tyExhfN2i/R4wOXJxPhLfJkOKmDKxh9mdQR3GtW5ocPZDktY3pRlYikw5hXgNXS1XYBJZYxkgjXGh42sX0zByupzphVgeLLS9icvqzChsxESXdFPtsOn/Gw4VZ3jRWCm2MqAWG/r1sN5tNvSNWOEOI8js4m22p05cJu7JppuGly76/XA61KhIG94zZrHMEdRk7px4HnIWBhyZEHaL2xpTJpp9HNfQOof9qSIZ1tOdKm+rndOIdoyFLt+NIK9BVCKfBcolcuc3aDgJfILbTW3ttNci6dMs39YhcBzBllh5gBgWcKtQNwo9lOpcKEiNceSZXJq5k6o4HLN5Wo7Bzyuuf0mdh2b5BwMubBRRcQ9ULjbb8OLu3Asx9AZPjjscuDXF+Nt+55dFx1GGZxkPN/vAIJa74sOVtsp/74iaJmGKceiPiHzSAu1i6C9foJnl57Lc689S8r7nw4C3EgsWxNKl+Id2VrQeezsrU0bLoI9yeio80POHuVGQQCYmTMuBzP4IfYlKddnn1X3OdwkDzHfOhY8pvwX/BplXvmm8ven4kFzjdJ2CxcQvKRcTgj0XCfow
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(1800799024)(376014)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261028144727099003)(261026121527099003)(261026140227099003)(11063799006)(10067099003)(56012099006)(22082099003)(261102123227099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o0xaREhcI8ZelhTsCqA5Fgln7lXY6ghPyotxT+HdVv3T4QFByKzEcgjPcl5c?=
 =?us-ascii?Q?HWhE16/cd+md2m6eXx3ueNS3+nUcpGSU92S3y6aeM3IeNCzzUvFYB+3437+W?=
 =?us-ascii?Q?WZD/aGKymoJog44eROP9UQ1LizRt8XdI472Xu/soXLaTEENQCgocX2aEbg0r?=
 =?us-ascii?Q?jwWVo73Odj3wSIlNoAS6r7p2JJkoiQL48psczeXjRkesme+54m9FnU02AP4y?=
 =?us-ascii?Q?1uh1EQjcXZdvc0P9PDCGdMGzOg5B2odga23BFCFNblfin2awigwNGUHKqc3H?=
 =?us-ascii?Q?yzERc9FdMTvgmtGFwBR6WeNF+u8G6STqsh8AHn9P73MauOAO6UcYCyJeCQ8P?=
 =?us-ascii?Q?mJJsTzV/hB5Z+AICi8abrT9Hj/Q6uNhGB5wWoyhPD88mohWv1J3MzsoYrpBe?=
 =?us-ascii?Q?v0KWinuAwpgpPUuWwm/L568lEn4uVYiPw6ACgJMPMUb0JxoGYBM7TjTSYCk+?=
 =?us-ascii?Q?F6c7vUGZSiT6Vv6ssFMLLWfCZRxFpgEvkQCIvD/sp98Hf5B910dvGB6Mu88I?=
 =?us-ascii?Q?xVkOugUnn58bVOS1HG6AZakb0l4uZw11L4HTaeZAFMxLD6I1i7sssK+rb78x?=
 =?us-ascii?Q?6UvoKDlZMG0rAnR5SnJ3tpqtTdnkeyMpm6WqrIWGDGYTiMVtfrLgJ++KLnhq?=
 =?us-ascii?Q?0J4kbqj5glWPfiFkLlbNAix+9vEbyPnR9bDnAQb+TlTON5p2P3aG2zOkNxol?=
 =?us-ascii?Q?IzeCaq1Qkh7o7oO1yNdYLMf+8+GcY6VhSkPqtm3tQJkYEJkUCvH1DN4ULIRv?=
 =?us-ascii?Q?qGUGt9IjOE5yfSQdjfFlB4xHOhPGBOPGP8SZar2AtTZy2cv7RUmGMqy9Y7/U?=
 =?us-ascii?Q?dpo2wg+n808Kxifflv/VwBwbIzCAThkbx4fOwwJQZc9V2GLMawzgN9jRLisV?=
 =?us-ascii?Q?jcKlOYLsitG1BLlx+F4rXazk28IQqPjlK4nmfIxYWajfwFkAHgsMnMh5aUeL?=
 =?us-ascii?Q?Ye9hC6bbB7W1s3PHUbp/U/KxE54Dzxg+y6BbBx0cbwdN3t/en8z5kg2xRXpb?=
 =?us-ascii?Q?PT3MNW/SxOw+aw8KxHw6Vwt76rMfN0huvDrlORQHQtoYiiGgvtCvIYTRRr7U?=
 =?us-ascii?Q?kW1+WbccZCVTrJc2771i0JcZd1lrvQsyPy1wtcpywAv8HnW3uUTyp/xiOX5a?=
 =?us-ascii?Q?br3YaeROTI9TUgMz3DrmWaplKqV9uak5IXjRgDLYDMyHS6IXd9BesTE75w3Z?=
 =?us-ascii?Q?IrpP12HOYl5uMjsytFYswQShLFAMWv5dz3HzJEG9PmhL4yr5/GklmFPeeSoc?=
 =?us-ascii?Q?TBEbGrkEG0+UCuwKz3Qwv4HlliveM5a8SufugVrpgO3cwIssBx19oS6Y6ytt?=
 =?us-ascii?Q?2N+OrIAx7BG9mFD1mccAzJvahctg8KC554UoLq5uCQA1vwJ8IeulVdiKq47k?=
 =?us-ascii?Q?uCpjUofhl2VEb5UNHvd4Ikkngt9/1JlSyCczTZf3G3qefduS+bUC6jbThSeK?=
 =?us-ascii?Q?oSm0r/7L+FOAvaU/Q/1DhEVWjchO4xniHJcQEsODERvTrWDUFV6x1XnErHnP?=
 =?us-ascii?Q?RX49MTb0UWsZTh6NYmvSz+iLOGyUAY3OjUxTbmc2TNr8g3JC/1PXEioPk+V/?=
 =?us-ascii?Q?Xu+llai5pn8ZEoYKKbYvLlGf2N6jQ00Tmw4nlkDSzsx+UkLmwPvuKlE9cfYS?=
 =?us-ascii?Q?8vefMAVKJTJaVggK1C3nXLbn1dtzcet4KY9GJYUAjdf7XHnKj0z5JgCnljIO?=
 =?us-ascii?Q?XkEUjE8+Vvxwkiatn4c2k/1yPA3C+ubEf2XYXDSPmC6mEE80k2RaDkSQw59q?=
 =?us-ascii?Q?IXs2U6ySNJDa8+neJ69sgZtgDwCnZhSbFb3FKWRF6rSCMeZK9n+s?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c7ff3c-b5e6-45f8-e5f4-08df39bdc3e0
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 15:18:50.9648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDJegh+TjyIDay6LKWHvn188G8wB+fYgFBwI+KaO8yjpUPxftnoLa3FVoLZH9JpVqzKMJGkhkmOaKZQ6dbeAVBjE9nsRferNSR0+Ed2G7w2aZN1BRyfaF99SgQ7DXggj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11808

On Tue, Nov 03, 2026 at 04:32:14PM +0800, Li Ximo wrote:
> From: Wang Haoran <haoranwangsec@gmail.com>
>
> list_first_entry() does not check if the list is empty. When mchan->active
> is empty it returns a bogus pointer, which causes memory corruption.
>
> Use list_first_entry_or_null() instead.
>
> This issue was found by static analysis.
>
> Reported-by: Wang Haoran <haoranwangsec@gmail.com>
> Reported-by: Li Ximo <lixicaicai@gmail.com>
> Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> v1: https://lore.kernel.org/r/20261023073154.744365-1-lixicaicai@gmail.com
> v2: rewrite the commit message in simpler words as suggested by Frank
> Li; no code change.
>
>  drivers/dma/qcom/hidma.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
> index c939635be..925c912e0 100644
> --- a/drivers/dma/qcom/hidma.c
> +++ b/drivers/dma/qcom/hidma.c
> @@ -176,8 +176,9 @@ static void hidma_callback(void *data)
>  		queued = true;
>
>  		/* calculate the next running descriptor */
> -		mchan->running = list_first_entry(&mchan->active,
> -						  struct hidma_desc, node);
> +		mchan->running = list_first_entry_or_null(&mchan->active,
> +							  struct hidma_desc,
> +							  node);
>  	}
>  	spin_unlock_irqrestore(&mchan->lock, irqflags);
>
> @@ -238,9 +239,10 @@ static void hidma_issue_pending(struct dma_chan *dmach)
>  	}
>
>  	if (!mchan->running) {
> -		struct hidma_desc *desc = list_first_entry(&mchan->active,
> -							   struct hidma_desc,
> -							   node);
> +		struct hidma_desc *desc;
> +
> +		desc = list_first_entry_or_null(&mchan->active,
> +						struct hidma_desc, node);
>  		mchan->running = desc;
>  	}
>  	spin_unlock_irqrestore(&mchan->lock, flags);
> --
> 2.30.2
