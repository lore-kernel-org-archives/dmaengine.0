Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793048261;
	b=bwWXBR0CQ2pB3jwtzpzJiGD/9UUasUl93OBuvB+XI9rFDfvwzQZZWeXEigFu8hO/75zv
	 olgLnr7TSS+DHr9m2sE0tszdCOV/5Xnf1hRCWPY029LarvsTkCMgEp7DyMnM+PbU9+61z
	 vCXIirwTFWIZsRV89hdI+xWEfiIH9vOrYMTfKP4zwA5Mc83qgbWMcPoMNnANRe7BsNtgT
	 15MnpJzN+5vmI4uvamdxi2x/Op+61p0YdRgK22AkzXxG62vkTZxQK056UfxyNatRqeH1m
	 fkE8FqSUu6g72CPyym2xKiglV9R16QONRL7PflmRV4FreudAU7JkqLJNdw26sPDcM6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048261;
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
	bh=km1OpI4Zv17YP1h98ybMaJRCwACXZYfCRvEfBYFz/Pc=;
	b=5qsfL5MteG3ydoOn1md0mTjPHXoiUcfBSusFv2o9DNxlPdiILNw4M6qhIj82Wo1sCubT
	 LiQdz8BSBGvwfQLaOSNEfo1Rvi9oAfL5vn7ODSf7fNe3AafSds6d5Jncizb5hKdpQmSrM
	 GadPglgC4eayHJWRIfAjrPyGf4a88tQD2vKwd53SVYFb+GdS8hmDRZQMm66fIxCyN9nep
	 DhwI8vWS5EPUjKWGTmPGMMZ2vAV+zlZAgm5QwEfiZk1BlE9HOjzid1uqeYWFC1BHGGF+Q
	 5vTYpcggZsgcKy88c/SkXJxjnagLjB2FCiaYBb3fNRR/schNDKofVB9vrLmCJjJxW4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lD5Fd0d5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.5
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011005.outbound.protection.outlook.com [52.101.65.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D772606A31A;
	Mon, 26 Oct 2026 20:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D772606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lD5Fd0d5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dv6Y9RzxibMBDqUAm4RLvqGrEf/scWm6YnQUg1geS8q/kSJI4yseA44c9EHCjtu/NJwXo+3NVp4WP9iz5jvpm4hMecfWagWGSz3xFPyOktBJPPMCKWgoviFS/S7rjSYpcbEQ2o9BfBQNzA5sjFYXW6l7ip2Wzug2HHsdhYSjENvo1YYwceule2XiXx+MmVlOFFEAsSV4UOETENenAQsirlw/eKuSL5zUGLxSkbZmBYD9G74e7f8I9U/+NAkSkZEKQH49JGFurb1xpBR+tnVRkPNgG1gHi6//nWuXkXfrZWu9Ndti2jFAs2a1Y8g9KsMY7FM+0nZx8uH+qKtDYrZixA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=km1OpI4Zv17YP1h98ybMaJRCwACXZYfCRvEfBYFz/Pc=;
 b=cHhZGJ7qmx+vS3UJExhPm/qGk8iYC748TfPwIkVxaOQNAGDtMsSHPmlQnu80kJ7eq4lCx5RaYQEYf1c/LkaWbaXbEg9/kDZM4sMPzU+Ft3ZUjph9mxXEaFwxj2OoeiyP6yH4/65dJ4+BvK1xn1nByUX3JEqpqARttUobNYrjBz9QeXedbchVtxrqwRhvrKkFcos7vDOWc3Z165lG8GvfrUKRi35yvamob8abtSCRI86SlZZw4/Z6LYBKXyCnBXYH+Wy58Cenp2QPYdNkTih74sHBP8iMaSmqsMxX216AJqI+QuywIDh+B1O/KqETf9AK/8GMJZudEOSLHSkt3/7iJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=km1OpI4Zv17YP1h98ybMaJRCwACXZYfCRvEfBYFz/Pc=;
 b=lD5Fd0d5wbxQhKhLErSsWDlVHtxHDY9T6UN0TM67HYC4oEAOVSlekHFKiyclU5a4Nxpdx7zog0P7RuqVZWbe/5i/Dak6ErXQfHv6LWHjdsp3qnZfoVNYNYHLzdpAU8GQ4/PedqbYQm+Af8aonmoVsXBywrUirCURyKpuB5CrHGJVKiLsuJJno7JMdXs3aBnzw2gr7jh7h4nY7d0GcbQG9vMloHRGO0MhJrikxd9WP2nhSBanKCYGLPmE4lu2BOyXBxjIwdHZfaWaISVx1oGkJNMslJ6dxczxNoF+o3yFYnXMHTid6/GjWbXasMWjYMN9Fl3VzAOxwZsRNmuXZiUwMQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 20:57:28 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 20:57:28 +0000
Date: Mon, 26 Oct 2026 15:57:18 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>,
	Maxime Ripard <mripard@kernel.org>,
	Jens Kuske <jenskuske@gmail.com>,
	Jean-Francois Moine <moinejf@free.fr>,
	Hongling Zeng <zenghongling@kylinos.cn>,
	Chengfeng Ye <cyeaa@connect.ust.hk>,
	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v3 2/9] dmaengine: sun6i: handle the last partial
 interrupt bank
Message-ID: <at--rvTAj-yM5I2a@SMW015318>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
 <20261023-submit-sun6i-dma-lifetime-next-v1-v3-2-ef1acb0be768@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-2-ef1acb0be768@gmail.com>
X-ClientProxiedBy: PH7PR17CA0050.namprd17.prod.outlook.com
 (2603:10b6:510:325::22) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PR04MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: 765baa9a-9f11-416a-fe43-08df33a3be75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|19092799006|1800799024|366016|18002099003|22082099003|261026140227099003|4143699003|261021121427099003|56012099006|11063799006|261021123027099003|10067099003|261022105027099003|261026121527099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	4Gc6FUny7sNy05KahJDzYQPVAjxejp5q43xGff3+0hYciisgqIVWxn8IElKugJgSN2optUbihcVC9Ke1vOPshomTj7Pxn58Y/nVmdJ4OlPobrEd3l0hxnoI7axz7/V1M2rAJD8HkQ4IISNsNW85DBvk0o8A+XdHt2XU7OEG2NNaGcU4MBKTVrpv04jmqwLDVvYyvVDPgoi57V7bXTHVVE2vn2Wdkc2AvdVNeMzZRgk1FYl/1Zl0sljTXh6ZlD7ZZab5UDKQP8NSg72bE8+H8ltPTOcm00PEnhoatP5NKBJ0RaUhoEVX0RkhKOzdhlCiA4gvOMYHtF6QmzXpsBFUxnYPLZt/puU6m/9VFaYmxDo0iUsPi84pLKIAKmfr7ytAgCXgoPtEXfSGHm4xMDAx6avaHupg6uszF0mU/4xMgONHhvs3/eEuVEOp40Or3FjlIuHQvP8o/RxwQHYmiSDOqx1WEF2jWVyneaFmvUcYmSEn77QwyUjPmK9e8QyQ3+aHRPNgRwFmGTqh0OuPGkgXUP8GTk1LKxnfse3F1NBCh3+uVgnkSs5a+k4E04RiisMq2CdzLV6YELLUonNCLBCJ/j7E+HbPCYdSQg+nw9v6WraZz9RbzY7Jpvv99OPsXMp2jIOAWH5p1rQHx0tkzG8mnk7FbffxJg3HQ04vlwGVfWRk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(19092799006)(1800799024)(366016)(18002099003)(22082099003)(261026140227099003)(4143699003)(261021121427099003)(56012099006)(11063799006)(261021123027099003)(10067099003)(261022105027099003)(261026121527099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s2gvPpokhUNd7nniPTvMjBfMa6kLgvflPG+l+/3E15Oo67IotJ35VTV1N8TK?=
 =?us-ascii?Q?j2ACRjsAT328qgRHqpPEAqWGqCLug049nKbhOGF2+iyrvYN7uY5YcefMCvgZ?=
 =?us-ascii?Q?O/qzF8fuP7Osc3HKtbjsbWqAgo7ZgoiobaP6ivtx10pEkFGbpsAvC2aOFF5k?=
 =?us-ascii?Q?C5/mhoaJFM6XF2vvdMX3qrN2RRXsKCmVOOrIne/v/vG71fuQoKa2DfyXPZZf?=
 =?us-ascii?Q?VbBeUlQM8ef0GTOnkDkGe58eXwl92liNQf2ycNjJJElFHdB+ZXtZDT5InF0O?=
 =?us-ascii?Q?clN2wyUPnZ5CQTgW6zWOf9FdZz2QQj3UrMu3pvRDpFlDfvrH/ODicj9ohFCH?=
 =?us-ascii?Q?ZdLPcmVzUBbtUwZWnTxGuTdTMzYkZ3DfBd/9/7NM7hsJkWPbjx3QG5PA+XTG?=
 =?us-ascii?Q?48pfIpIfYayfB34kI8/jn1YmNQ/gEpKwTGqK+b1Xc12HGi+iSczESH8Lx4yK?=
 =?us-ascii?Q?NnxxC/qypmqOy6hL4l3UhO3JajYNYg1mVkhsC6HfMY/4dj0jwlFtu5xkq6/Y?=
 =?us-ascii?Q?AMz1l2tddkkTN/FWPOr/k75K8dA6xG5hEtQEDEqJLSuL8d/sk0lNy1xqC9hi?=
 =?us-ascii?Q?1hreBnxC3MjRKKKDMQF9rQWcY/gD8l9WqGfAoFB/usEHu/yCClf6+LnxcWCi?=
 =?us-ascii?Q?JwgL4f2dSiJYrnZaK8d+YM+K3K27m/YpY0AW5t32iCvn6dnRSimpwZ7JVYd8?=
 =?us-ascii?Q?U3xMNOPPa3cWWbfq0HjUOhc/QAmTMTQemh/FBcQtq/tqGjn6pr9CZzttSVkl?=
 =?us-ascii?Q?DD3tB+U4r7aLPuf4U1CR2gmSrG33dfmylcoevoAoCzjVQsgDYX04XJCtvXGb?=
 =?us-ascii?Q?ld45oXp9T4ysQP6JPXLP3J8kbXAn6Qkncq4FkE1O0GyAYaEtZ+oTxI7611j3?=
 =?us-ascii?Q?/jwWRMcg8MmvRuo4C07tQoKQhkFObEMcy+Gi1pENHxh7StFV4hZ82lHgsBvv?=
 =?us-ascii?Q?YTk0s5P+zTfvCU4EzJV6zbeu8ZXa65TjDg0n+FVMOmprUUm3RCscpu72xIdb?=
 =?us-ascii?Q?y+XfAZjV9nL52bY6KkTgnk+CYUfpRG/28M1EhpKQpi6y1Kxz3JNXBgMZNN5x?=
 =?us-ascii?Q?Y4EdXUrv6jmoIa103CddqXOQMY4rzG6pEJjw24s/z535i/+uRSA111CM53Se?=
 =?us-ascii?Q?/sLvephMr290ePjWyHxh6gIXMlWNTJidFDC/5173lGB59VJaw6IGN81gEYS7?=
 =?us-ascii?Q?J4s/OYhSPS7ZlWiJCSe4lA6yQ0e9sMM3ybAH/Shl1nOVduOD7LFVytFwd0CN?=
 =?us-ascii?Q?OPrAWm1QJLXShF6eQXE2z3q8VyCZOlaEdSGiyVnxySwzwnDJgI8mwNqhtM35?=
 =?us-ascii?Q?HgWCMJl13ocvXAgmSvaairyDHqBofrOGgXCEVchFsbHh4Lu6nMyz3mx9+yTu?=
 =?us-ascii?Q?Q9xzImFtZTH3MDPP3gSYHWgzrny2tj22s3XAw9ND4XSWHV9gJJcW0lh6k6cC?=
 =?us-ascii?Q?PL089mh8aQoXdp5yL73GfjIqfTplseKweq6iJiLIUoVnfWM3YfJ4gfIWAvo4?=
 =?us-ascii?Q?14j7kbxc4XvjTs/+xU2MCtw1G+u7KKzhdmAQsiGefGdy6fh2+5lT1Li2mWZh?=
 =?us-ascii?Q?bonMESyKJCC40fMjXlBFQ8yr5HRiQXydeUIZtBXkfqwaN5CjCu7yQ5zhJEPF?=
 =?us-ascii?Q?oCMUuONg3pY6jMeiIsUCG1OHWoqxzLmIFx/uiJgyeyyfYPRg7Jc2wKs0e4Kt?=
 =?us-ascii?Q?ldQDF/VZk9JIRokg3QBcNDw1HxbB+Yb8kWZj4aEGhUpT8xy74E9z6Ee7ffSu?=
 =?us-ascii?Q?U7G2R3jPxqlJFvdhe85RjVpxFjnlbRTeRlRCp6Xu8KqmBu1sfoVl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 765baa9a-9f11-416a-fe43-08df33a3be75
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 20:57:27.9903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9W4O6b54EyaxyYvkMN1MT+uSb3jAT+lHe2DiaEm9s6vE+NMNfbzWNIXq8YlZBKI19nsV6jLHovuzb2enjF00EYkiNMVTWVAgOpuN2NJvwrt+nrwECrsMRELCBb5sF11j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8825

On Fri, Oct 23, 2026 at 05:38:21PM -0600, James Hilliard wrote:
> The number of physical channels need not be a multiple of the number
> covered by an interrupt-status register. H3 has twelve channels and
> eight channels per bank. Rounding down the number of banks leaves its
> channels 8 through 11 without completion handling.
>
> Round up the number of banks to visit, and stop processing the last bank
> at num_pchans so unused status bits cannot index past the physical-channel
> array. Use the controller's configured bank size for both limits and
> the physical-channel index.
>
> Fixes: f008db8c00c1 ("dmaengine: sun6i: Add support for Allwinner H3 (sun8i) variant")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/sun6i-dma.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 9d94a37fcf10..3a6525dd3d32 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -587,12 +587,13 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
>  static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
>  {
>  	struct sun6i_dma_dev *sdev = dev_id;
> +	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
>  	struct sun6i_vchan *vchan;
>  	struct sun6i_pchan *pchan;
>  	int i, j, ret = IRQ_NONE;
>  	u32 status;
>
> -	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
> +	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
>  		status = sun6i_read_irq_stat(sdev, i);
>  		if (!status)
>  			continue;
> @@ -602,8 +603,9 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
>
>  		sun6i_write_irq_stat(sdev, i, status);
>
> -		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
> -			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
> +		for (j = 0; status && j < channels_per_reg &&
> +		     i * channels_per_reg + j < sdev->num_pchans; j++) {
> +			pchan = sdev->pchans + i * channels_per_reg + j;
>  			vchan = pchan->vchan;
>  			if (vchan && (status & vchan->irq_type)) {
>  				if (vchan->cyclic) {
>
> --
> 2.53.0
>
