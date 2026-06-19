Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013061.outbound.protection.outlook.com [40.107.159.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D0B3B42FF;
	Fri, 19 Jun 2026 15:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781884450; cv=fail; b=cPtgaTtp5gFRiu5kBhtRDxVT6qXRP1FD67NxYB+GwJ0yb3oSaTk4XrCqwUVXwDp7z9WlBZQd8q14PK0yuHlreXS9BUXM5aBQXGEEUMUYnUWWV7kaecwdAAYOKk8z3zS8lpDicRoCK+f2AdwnBEQGLlQm6uPrlxSkSpHx0324DZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781884450; c=relaxed/simple;
	bh=LKJDaEpoQaw7uVnfADEpF8WeZOiBUebtla/iiC4Smu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=h8N31k0YIp+Aac/n6Jbyz25sUQC0h/8WTSo2W1VXVkBgUfJMJRp093zF26LWyVNgoW1zSKrIfnPMPfJb5/SWnHwN6nmabceEDzG6HHl68HBsBWFhpw/zVRcl3mqYuSfT8weg4ZOjtOUMsykpOly0mp06/nb9JS9UMN8iDTc4ky4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HXQS/s45; arc=fail smtp.client-ip=40.107.159.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HXQS/s45"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sr+OeNdJLOoVJyhwSgls//vSxJMKF/erJSK6uCGKl2tbACqfj3Qk7daO+BpLgdKYuXVQgvCNt/miEw+o1LAE6+9I80I9HcPjAYzWgydxF08Us3IzuJbUr95CCWGELEFjtsOUcniuUsr7HzHwSf1fdRciTfhW6vTywIXqO5Z4T5GiZuHxSEKBI7YP1AUtC6x+BtXlnmnOY2BSyo9CwhEUquOrFn//MR3QujwutJmJqyRUQ7rHTVcxDSf4meJX590BPqHX6F8gKt21P/S1dfrfMYKZ6BUBTSnNfiqbaVFSw/3BS4TOPKPdUG9WZPJmXZslUIvpvbVrlgK8QolXXc2EBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgF9AashnHuzUk/JMxMjTbCL+cw5W+tJK5pwXckFz00=;
 b=O5p33OOWOw4XcK7VGnH0NBNyOiQwxic5AuUOXyxkj/4MLfSUVbDQENSQphVH1qs04Lbq0nKQSat58eiXBTx8Nc+XrLBV0xIjsqJWW4VU+mu4f+LCaFXqh5LGq0KcsjNqE8TEf6krTmCGeihr5NzPcuz/GZHIqI3odFB9BxaMVsZPwpF13jsfZqjfxubhRyU3vmgoTsqnNdlmicJbhkmT+JjLY0u8ZCXeTP8/gZAeBAEFKCh4tcZi0rFNjqEoSkH7aBOdTXFaVZNMAm1a867TnE98T5X3uWfjcbSDzmGNg9M/hO5k66fH1tYQnmro0dBt4cYBxNRrCvT1wOFfYgHYpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgF9AashnHuzUk/JMxMjTbCL+cw5W+tJK5pwXckFz00=;
 b=HXQS/s45zUaVfZdvA5V8vt9t9VGZabJPdGOo4HNaAd9AMMwUMqC3S/g5OlWPuNFr+7NjBuihpEVMGpfdM4h3ya+CtnufQKMO8LRwqzjomXketBobylq9EVZBpgKWdR8GIEjKWYV6eCXGMKXFYArnhm2VLnWvMOuPR37QctWCZAqt3lT+hVo0kkKVDUS04/3iRgT2TE0DwlCGzNHDz432XLmLCfG5x6jqGZDs5m7uewZKcup7Cr9INIMEt/XFnI4yjTHaMMGZuhPzHqwIK3OQ6nPwo/FW86zrPdrc30nM10ndZFMEEHj+5ACvDcbcAIH8M8pJPWNOAxNrDM+FvE5tGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB9223.eurprd04.prod.outlook.com (2603:10a6:102:2a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 15:54:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 15:54:00 +0000
Date: Fri, 19 Jun 2026 10:53:50 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Yuanshen Cao <alex.caoys@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 5/5] dt-bindings: dma: sun50i-a64-dma: Update device tree
 bindings documentation for A733
Message-ID: <ajVmDiWqk_5MXTdL@SMW015318>
References: <20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com>
 <20260619-sun60i-a733-dma-v1-5-da4b649fc72a@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619-sun60i-a733-dma-v1-5-da4b649fc72a@gmail.com>
X-ClientProxiedBy: SA9PR10CA0024.namprd10.prod.outlook.com
 (2603:10b6:806:a7::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB9223:EE_
X-MS-Office365-Filtering-Correlation-Id: 02507baf-e201-46f2-9f7c-08dece1afa56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|19092799006|56012099006|11063799006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	kQJgjsWDRZIm4++wFcbmcMt604MtRMjE17M7T17xUKcv/KK/lhaFzukCkMjKoC5NZVfLk1TOfKQZQUQW74zVEiKsTj3EYUH3RT0feNdpvbLsAFQc+PRQDh7Gv3eBbJDMgds1enEt29a9dqRabhIFW+4S/rkAWS/jzAhGoqn3JVgNUiATZ+y2doeqrQwOAKmTVDMJPorZQPhjpKwjOdHzwsqani5CwW3EYT/B94f2gTJZTTEu6taqGVw+7ZirAvJAd3ScXjS61GmzHrWQmwU5QcBldZw4Vol8kz5+ylMuXF4a9JRT1/vnf7qbqHWKBR+QbVE5O7IVIviLCwIJauzvuIqXKz7nozXkpM3MDgSsqbBTV0/zn7mgc01NlWAOkI/pIiyde7GMpAgsUN2cuVYrh3swrUrudFbgDSBQo5DXVFjO2dVQTxDXzWAt4YcauyaTzltsoaDBk45fr92eOBOT9x706BMO9Jqb0L/6oErW8biZikLa6lLNeouYDEp3Z2pcTPoB5kCI3dJ0IerAY4rOO0KOg6MTrpxQEG8PVr8Z37C3rFKPUqeZ7AScTXTKue1MFMvZzdgOggNcNE0L44vB5cfEOJDnAMqzoKrKSoljxAao08gZZe1aezkNuWHlO+2UuymZsIL6lkBqpMZhqQ57ghHFHLdUsGbdIsBkDHmrtI4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(19092799006)(56012099006)(11063799006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZrpIGPvUFMH2v6S/cw8RMtYNrm8cdGNOgAYf4QQfCFEFOImnCJlEtzEdjS57?=
 =?us-ascii?Q?Xg42xZcvnTeE0LhRbV0qyrweYaDcTPtKVz8Rwj4MCXMIKp5BT6/5aVwzxpbo?=
 =?us-ascii?Q?sQJHszwz+8RkSr1rsrlNgzFI75VOlb9g6WVTT5bXF13JjWKBDMdFufUzHspj?=
 =?us-ascii?Q?c1f+5QpqhSSirX0EBMvpMt6QlvS3LS8bUgYhRfX8yXC3gxSVkDNTIKRO04He?=
 =?us-ascii?Q?jxLY2XV77QXQfq5L6ZBvOako5nQYOd8eUgMyaRUHLoSZk1CmZhM0tI/X43y8?=
 =?us-ascii?Q?jDa9V93qrAgAyU1zaD38N6Rm0xkYmTCE2RYSR2Sx43i/IXkuf2bOAp61Irue?=
 =?us-ascii?Q?UJl835loM9Wyp5KrzxBcak+aCX0mEuVBZ1/fSsfHEgtjVDUVqRiH1MJITsEC?=
 =?us-ascii?Q?4sxq/GIvAv8act+LxTNq6Xkve5tvCxqBd3n/TwtZSrJEQzN+fmTU8ltwEypb?=
 =?us-ascii?Q?uLsoAsjMaV3x98E5Vob/zqEeDfZ8gE8gcAgu9OG/1Ku1fKr9gBtub081z9CO?=
 =?us-ascii?Q?Iz1QQ1TjFFoZEwtnUXPIWjDnW6cdh4P9BM7N06E7vSi4arhKmDT7AN+jdgix?=
 =?us-ascii?Q?ByX1n93cG2imeck0FSeA0ztHJL1ratdO4escU7RNS+wflq3oD7TnLtlgGdfo?=
 =?us-ascii?Q?MLUnw2L6ORXVFSGHiqo3YnYgNwQiI7mzo3IltTwlVgzw5si+zjLSHGO7PCc1?=
 =?us-ascii?Q?YYDwriskfj+2QLKb7PDDMx/dkpijCzawcKFOvZbPK8eepywTcGF58LuIezFA?=
 =?us-ascii?Q?F9BBAbQB+48xXxEOahA9JNpFqSRW/GWGyBtpSqLbNCmFJysG7RAUjdNIEcN7?=
 =?us-ascii?Q?B1zmAF2bXR63gF5/FLCxpz4rP6HrMQTRFi6KzHYwMeaBkt0Mhb2GOSbQzSiK?=
 =?us-ascii?Q?FdG3yt/2G3iJZRcHBEsddqVltavxjZEAsk2m6whXQZCu1mN4TmJlWORy29Fy?=
 =?us-ascii?Q?O0stMcFxFRzVUjR/QfxnunRRUbyuhgOIanTzEjhE+UHR519WssKVthPiMd1H?=
 =?us-ascii?Q?pXzzvcBhSCSRtcoKC0ZpoHPxMsLkj4y/u8qGJTnksCRb6iGEILYvqClaJ4cf?=
 =?us-ascii?Q?sgz4vgAy/gWgyJ8DFVQaWF8nkaPG2djUa17f3465rviQwAk+85l+8241v4Vv?=
 =?us-ascii?Q?6og/5o57rnZlEPJH5oTcs9MQSr7DYmp0PEM6xFE5Ou2HgtSI37l6LO3sESFh?=
 =?us-ascii?Q?1tfMOOoWW9k98RYrJTMVa6Jp7KBg/v984iziQXnVBD+FOVj7LmA9qPQUBYrz?=
 =?us-ascii?Q?GaivjSF+58sL4JdPD+y4YLRGUkMs0LM6nb89Lfm3Q7uBDyvymHAkkAMtSZrV?=
 =?us-ascii?Q?yRkAXClyxZGNPWgxMMoMPEkn5c5xtHy2M3fvSXwH3Q2QZ2JOt+6527lgD2cR?=
 =?us-ascii?Q?YnuRjMsklp160c+T5xnwh1LVMZR76SLF7IuEBv4f0a2l5oS2VyyUo4cBadpq?=
 =?us-ascii?Q?SSK4/KzVkVoKHfJejFmH2BJwVfZ40SdS+pyztkJFyxtMuI/zzjReLvBLZ41N?=
 =?us-ascii?Q?psxf67Ripx7Pzr+TeGIwk8zU+1qNzNiFP/em/sYdmKSVyZCmYBz2YJp9WTxJ?=
 =?us-ascii?Q?xpDW8U0ZfxomkDzmzubHLVANEUAs21KY3YTq+H77LdNJaPMUilKEhLrNNM9A?=
 =?us-ascii?Q?qOBEtTdfWfj+7V1NeDBvK5uEuTeKK+fh65KgtQ1DxTalxz469UP/9z2alSUo?=
 =?us-ascii?Q?Fj/HkjMEDSVM9Mw/SWX1ef7Rm9HniV5EPMOZtd/+K7184qT4sbK95yHVUSNS?=
 =?us-ascii?Q?euxyEJEiqN7eEddQYRM14adqg00Sc9VMey+pQ5jOYGFSxD/hruYD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02507baf-e201-46f2-9f7c-08dece1afa56
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 15:54:00.0162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wh98tBuo+MRV9Hl96mrzdrV9a2cOf8ZCwSM7yMHzeOgld5gm4Iv0EKlIIZ7+1hZ9lxrRoqYfkf4CfhWr4el9uGpX6zl5BygRO25oDyU5uDn9FI9a48Bl0vG7kbd7bFjS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9223

On Fri, Jun 19, 2026 at 04:53:34AM +0000, Yuanshen Cao wrote:

Subject needn't talk about binding twice

dma: sun50i-a64-dma: Add a733 support

>
> To complete the support for the A733 DMA controller, added
> `allwinner,sun60i-a733-dma` to the list of compatible strings for
> `allwinner,sun50i-a64-dma` dt-binding documentations..

Add allwinner,sun60i-a733-dma compatible string.  And list some differene
here to show why need it.

Frank

>
> Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
> ---
>  Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
> index c3e14eb6cfff..1cc3304b7414 100644
> --- a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
> @@ -25,6 +25,7 @@ properties:
>            - allwinner,sun50i-a64-dma
>            - allwinner,sun50i-a100-dma
>            - allwinner,sun50i-h6-dma
> +          - allwinner,sun60i-a733-dma
>        - items:
>            - const: allwinner,sun8i-r40-dma
>            - const: allwinner,sun50i-a64-dma
> @@ -70,6 +71,7 @@ if:
>            - allwinner,sun20i-d1-dma
>            - allwinner,sun50i-a100-dma
>            - allwinner,sun50i-h6-dma
> +          - allwinner,sun60i-a733-dma
>
>  then:
>    properties:
>
> --
> 2.54.0
>
