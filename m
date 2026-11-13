Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601602;
	b=e/Lla1h9LVGXOaldFgjiKal36nyLLqHBXy2F8lU39BC2ujGz+AsZsynCHZOTLnDI87sM
	 G99Omzfk4LzpYP7Rv1tH3apLw+KSLNmvl0winaiAek/uwhasSrgk39qeJx7nlGWyaC1jX
	 nOG/Nzs0Vb21OYQAgUgLNR3gU3N1TVDyx8VqbOjHkt49Nvb1O8q1jaXkTvkK3abSDTuKZ
	 PWFu7+CS5r+5ePdjvmHDQOSMkBSbNKSXvb/inlFNeuiaE/QLfrF6bNpwoFogo1LuaWBjt
	 AULDbpe0DP9POzwPoG8pKmHBWg/jbrESSGXM6eIYfGiJ6okAZcVoiJBNiVBIcQ6cQyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601602;
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
	bh=tlIkQpncnbBGeMcJy2AIlVGcKIUhGIxwUyEXyRTn0pU=;
	b=JjIzi/WiORFJ7xzyhuT0Qk1T9mhQHJwh4pJEQaQvluUBw+1F1QsIHO5EiPfAZyj3SB9d
	 gJg/UGtsgmNmvFfGiZ/yBUjosvOmuhEJHl5ePbVtROBHc2YSyoEE23h/qxYMP4EtdLbbu
	 NhGir1vRJSiXv4jSPSoCN0gkjs+J60mfpPiNw98oLV7HN7DrgB7aS5kMd/5LLoPlTt4B5
	 rVzoj5VeA91esJOyiHsHPYz5vhCk8GQSC0wdE0qk0ZpyJmzW8RxnepK548JH+CVsxl5os
	 X4S3s2Pbvu9ExIaLdw0TZs4S56TJj7kfirs7DRt5j9Vr+e9UY8iaBYWSvcgFFdt6SRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="HNS619i/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.66
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012066.outbound.protection.outlook.com [52.101.66.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7024B606A33B;
	Fri, 13 Nov 2026 20:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7024B606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=HNS619i/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCMkVmqPeJeJHaRkYvQruRDOqg9a3SUNaNDrtN4znS5+NOSeoLJjUQuL121/smH5/xqV6BomF7a1mSuHaqzSu2ptiRdrX06MIRs4oXkcz8cwYiaew6QS40GmPcGE5N6XRDuwWKHTebmQlSAvBFH/g6pyVWjrDvdo/ZvRIAdjmVwEugevm3qflTrHvzJUO7EuTKRDhv0/l2kMzb4uxGJrWwCacwscQzhf9SY64FL4YVa8IIeBSNppdAuRUXc6CO/2vNMq0A2i9Q5r6Ba22KC5X0+IS2DokqFO2sL7OcKn3Jnd3oFNpq40324lKmgn10BxHyRKEedx5w300/Kii9p9zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlIkQpncnbBGeMcJy2AIlVGcKIUhGIxwUyEXyRTn0pU=;
 b=BKLdDtZU3qEu8mWf9ZH1kTa5//w3Dc8n4YYTig10UaknbBk2K/9EbM7yHWU2j1vlhJyWSkmA+lceqW4rbLCKWIAUo63eKAE4VYR/SAgKMuQv+8CDYGpYXbBlFlhBcL4ianMWUGtAAZXM2SiwfhTsJRiKX25r+Q7phh4s9dJ/ZpKJa6xCFsIY6QCI8morzqVpJPZMqhmKaJWOhIBpWlEi/J6BOXPLDWm1ijaxsZr9X6dgWEQ2JFYZt0AQ896mE7rk99oE0xyaBurrDNW0xFk9u2oINwbSuSdzEbmiw3swkKQmDT1BNWU0EpzkYbX5/aUefx8IznX0ViYoV3tuLvhzmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlIkQpncnbBGeMcJy2AIlVGcKIUhGIxwUyEXyRTn0pU=;
 b=HNS619i/A2TQn4vHRILl+q4gh6xoHexKxHMDO45aRiPB960aNGa1NSf3iP9FS7FmSbfapC9puwXuxgI7+vg+racBjvzJ0DTwUUZa2tyfrJAJvwfFoO2EY7gAcl6bzYD5ukqsXeznHvbwDRE6p2jwbpEqDCnI8ebiyme42EmH3ap5OeL+ScHRadpb9izSasOD45E/fXJS0YyOb2+w4fo3fcrnVD3/t6iLCKmJ9lweOw4Wq/QHrIudrUZuEU4p4KRmOQNVHflVIhKRlXhyTui+nJe6n0K1ZUscxEzRUpnf4n75V9bi60AMr8OGrz5XIcrlVCPPMKemN669wMKRxDh22Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DBBPR04MB7612.eurprd04.prod.outlook.com (2603:10a6:10:202::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 20:26:37 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 20:26:37 +0000
Date: Fri, 13 Nov 2026 15:26:30 -0500
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
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 9/9] dmaengine: sun6i: keep cyclic state with the
 prepared descriptor
Message-ID: <avdydqA68HXljug8@lizhi-Precision-Tower-5810>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
 <20261023-submit-sun6i-dma-lifetime-next-v1-v3-9-ef1acb0be768@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-9-ef1acb0be768@gmail.com>
X-ClientProxiedBy: DS1P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:44c::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DBBPR04MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: a8a0e25f-34f7-43aa-fe5a-08df41c46b11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|261009223027099003|56012099006|11063799006|4143699003|261102123227099003|261021123027099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|261021121427099003|10067099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	gqvc9Ylhft2fjbVYCkRcyzw9e2W9SYL2Pc0kjDWRN6RFg5rEyy6nFj6UWeXprKBCeHWAgs4u9acJx0TlWBuhsox46jZgdbVEayCsKa15U3mAQIgjO/jR4j+vI/ZLSORljflZqDRNuPtnCAeVx7z47hukT2xyYP2XfK4A8gcMwy9XVk1kor+QYxI2s5TszsotdFywDzQNFpzhNxN5B96YCBweeYYn9dUFIrm8Hhc8eXjIEOMa6wyU3Cmh9ftGYQtI0LpYRK61t6WkaiN3mTe34GxT+6ER76G6ipZvFH+ZMwpHYzuNMQMCj2rGvdQ9GfTlv4UR45XU2NHfHt2qSGPb5koBPznJK3x3y90n+GAehDWwtXgAFdvbAW/3yjlpDDBs+zuOCdbFaVuHJIfg+PxiTwP9mcTZhMOvTUH/OhoBTMKidzn9nT6V+PiUDKmGIa4Gvbp/dVmRGv/+eOaqA4A5gmde4x/EYQnQPrgHtevLXCDcvMaV0zvCTN7ISMBuAkLEx1FjTSk5KZg73x0zCtx35Hj9OBUc9cP4Y9F2FkTID2Xw9Ema42+6WGHldXvebnugNWKMZFao6he9CPwGMGoPxjg7t4dTKWzRTSLcLLpAqVignn0MibktQ6wq7SFHi3ABvOIDzce250HBpYMwdr7SUjhd4wh3SGmEKnu/Tj5fuxeXPt65QnAs91w0YIXpv9PA2kbohUdVGZNzlIHIqQ+toLL2CHoVtBwkTSrFMvRJEAU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(261009223027099003)(56012099006)(11063799006)(4143699003)(261102123227099003)(261021123027099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261021121427099003)(10067099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bE7VLhhJvPc+o5DGXOLTKzScctyVOZgxf+cajzn3gch/ObNqTKhXhhCMATI0?=
 =?us-ascii?Q?EsbWGpI0IRD3kAnfcdH6kROCFq4+HPj1yBg98NFgaKftVAG68YRHLQfpQSGB?=
 =?us-ascii?Q?U25yZkriL5H02LOWEEFrftWimLyzCwPFGmClp4PMh3fwIpEsbO0Pr+S1p5/F?=
 =?us-ascii?Q?SY2Zn42DKgl7WxU9oJo8drQ3xZMWFzMSOE3FUWDyeEkvqtS+fB7s+hbcYoAC?=
 =?us-ascii?Q?QYnMdUdbLw2uPVnWEkhlD46mufjDiIMtkqDKJKWiOOIS0f5ySLw+4ynws843?=
 =?us-ascii?Q?6epMKVlQHwU79OKa9isM20r6uEu3rqBZtNNyU8Nd8pokm2AENQiiJl8hegao?=
 =?us-ascii?Q?hNnciVZTPv55GNdbxOA9ywF4igKL/dv/2jZVRLdY6H6vbzuQpO/gfntjKP0b?=
 =?us-ascii?Q?JP6OzYb7sEBe/PDID2qvWnWO7YpQyCUJfjDHhZ2v56gBbyNJSosKQj+MAgrz?=
 =?us-ascii?Q?yqMLYLdRjc++3Pzqgu+YvNTVixJlGiP1/XSA1SSRsLScCAIVkA/NBCHHwVM2?=
 =?us-ascii?Q?HcZFrhKMlChJevUs9y8IvAkzwbKN/5t0lsCI6+D8106+u6OJBsavOpw4iDz3?=
 =?us-ascii?Q?NPpK2AucxnwStQjIE5xUy+V1P/vNyeHH2Q/48pizd754A6I4zng8yQyHdci8?=
 =?us-ascii?Q?NiEMZKfWo5aCGUrJF0XNAOK1IrMd369cMtyp/vaXC32+GwbIGZtb9WsbzP42?=
 =?us-ascii?Q?jis8nscPeQYLxjx8DrzTq4/vK/LkYzGR9SC/0Anhf/Dca9fpRz9iafN/ldqA?=
 =?us-ascii?Q?HN6+JpuVEA1EGKi5cPLRmmKxmftMg9ODwa3N0wehr/2WavYlJiU3rCZIitSu?=
 =?us-ascii?Q?B1vv+s9vResbQ0rfePrCeeQvKTtQGdRIC8IxQv8WnC82GrZH5wsnJL1PDaKW?=
 =?us-ascii?Q?guzAk7nFdlmPEhy3GP3QyIHSx+H2GwDdvJZSF0miS0c72FYWTjU1UCtcUhYu?=
 =?us-ascii?Q?n7vcoHyrRlRCDZOABLpnWeEgIKHYrzprgjE9xcZ1fcorLAegRJL7h1WGR3gZ?=
 =?us-ascii?Q?UTIS0fb79uYT7BekmGViuBPppaMZl5KImxAWrzVVGLx0E/lOXjhB5AcikMZ3?=
 =?us-ascii?Q?JqVlwuU7AawHFVpV8Mkn4ZbxrK+QG5NJcWLtaQKlgI7HRmHGQWFx3i7YxaZ1?=
 =?us-ascii?Q?0Pw8oHkTwmSfM/HjIBIPMJg5mp93odqVabhha9zs74mzUyWX5Cw/BKzkDJV7?=
 =?us-ascii?Q?OZvGTmq37V6EVTo6UUqPIF5Gyz+hRv8tOopt+NiElPdNiKrYxwCYFzBZ1T7c?=
 =?us-ascii?Q?nmEphNVvIBtsn6neJaZL4ex5S/UgNfpoLdnH2DzSYf7ns9ckXyBbmyEGyQ5o?=
 =?us-ascii?Q?v07cFEhfEJAwnUl6jrpJvTDLWXm1C82VoTjoiCWzsQK8nGP5dgCzc+bQsKCP?=
 =?us-ascii?Q?TxSO/aUpohbi5RD2jASNTUfGDLLrdNZEtETwhvdOp4B6JREGg59xvwXPQsNB?=
 =?us-ascii?Q?ZAfmJxQQS64tSqxXMS0RWfk/9q/0AZ/dEnCdErdOwMWLJaEs7fWMoqC73SO5?=
 =?us-ascii?Q?zAeXPE5x9d/Gx+igJLxlXBvJNB3vPDeJ541vxQvFz0mhFbUCjeHNYUNOoV9N?=
 =?us-ascii?Q?F2D+B4ikyvmdy626WSoFMN/mZGguPWjuv62XCwz6WPw9wrj9RfTKVdb2CU6S?=
 =?us-ascii?Q?KeYF0QbaeGwVQVl+z+vILBvQpCuyA9PvzOHndMjHjUz0cgEZXaHS56Dzxjil?=
 =?us-ascii?Q?8EZ/FiT4mCMUQ+OZ+c1gnaVRJpSSRpGMKjLyZR/rkrzpFzHtzjaTWvsxGS3j?=
 =?us-ascii?Q?3dhEuLeCjVcaV9cWaDia0Yrt0ekLg4+Yt0uC6xH2nhjisy1XAbpF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a0e25f-34f7-43aa-fe5a-08df41c46b11
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 20:26:37.6274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2zh/wRR+2pX5k2GDyYDVtJe3zTx1HtvB26Rxpr/e+RidkQfblrsN8J4TVSmUtU0LuJ0KwW+qnXeg4IkDS1W5+m32t8/xidXYlSzWxrqXc/D/BqUGMjz0eNq8YxMp4/el
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7612

On Fri, Oct 23, 2026 at 05:38:28PM -0600, James Hilliard wrote:
> Preparing a cyclic transfer sets vchan->cyclic before the descriptor is
> submitted. A finite transfer on that channel can then select package
> interrupts and take the cyclic callback path instead of completing its
> cookie. Merely preparing an unrelated future transfer must not change
> the active transfer or the meaning of queued descriptors.
>
> Store the flag in sun6i_desc and consult the active descriptor when
> selecting interrupts, completing a transfer and terminating it. Finite
> descriptors retain their zero-initialized flag. This also makes callback
> retirement depend on the descriptor whose lifetime is being ended.
>
> The shared state was identified during the H616 cyclic UART RX review.
>
> Fixes: a90e173f3faf ("dmaengine: sun6i: Add cyclic capability")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/sun6i-dma.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index b83138745bd1..2152979f72f2 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -191,6 +191,7 @@ struct sun6i_desc {
>  	struct virt_dma_desc	vd;
>  	dma_addr_t		p_lli;
>  	struct sun6i_dma_lli	*v_lli;
> +	bool			cyclic;
>  };
>
>  struct sun6i_pchan {
> @@ -207,7 +208,6 @@ struct sun6i_vchan {
>  	struct sun6i_pchan	*phy;
>  	u8			port;
>  	u8			irq_type;
> -	bool			cyclic;
>  	bool			paused;
>  };
>
> @@ -507,7 +507,7 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
>  			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
>  			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
>
> -	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
> +	vchan->irq_type = pchan->desc->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
>
>  	irq_val = sun6i_read_irq_en(sdev, irq_reg);
>  	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
> @@ -610,7 +610,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
>  			desc = pchan->desc;
>  			if (vchan && desc && (status & vchan->irq_type)) {
>  				spin_lock(&vchan->vc.lock);
> -				if (vchan->cyclic) {
> +				if (desc->cyclic) {
>  					vchan_cyclic_callback(&desc->vd);
>  				} else {
>  					/* Completion transfers ownership to virt-dma. */
> @@ -911,7 +911,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
>
>  	prev->p_lli_next = txd->p_lli;		/* cyclic list */
>
> -	vchan->cyclic = true;
> +	txd->cyclic = true;
>
>  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
>
> @@ -1000,13 +1000,12 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
>  		struct virt_dma_desc *vd = &pchan->desc->vd;
>
>  		/* A cyclic callback may still hold this descriptor outside vc.lock. */
> -		if (vchan->cyclic)
> +		if (pchan->desc->cyclic)
>  			vchan_terminate_vdesc(vd);
>  		else
>  			list_add_tail(&vd->node, &head);
>  	}
>
> -	vchan->cyclic = false;
>  	vchan->paused = false;
>  	/* Leave terminated cyclic descriptors for the sleepable synchronize. */
>  	list_splice_tail_init(&vchan->vc.desc_allocated, &head);
>
> --
> 2.53.0
>
