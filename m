Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011055.outbound.protection.outlook.com [52.101.65.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29523312814;
	Tue, 25 Aug 2026 15:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787672171; cv=fail; b=dzGbz7tDuLI4i+WpOkWBRjFwIO/bSoEGw2aqoQBwJ7MYoAFh0bzDj1YCl72rGvm8KqHFGAIyTkivDGzNXgCgT8jM8G8Mlo/uX6GQxdxrmAVMMV9MpdSEbjHauA/2VsQRTDZ96Rr4aHceZBTjmhoiNYsuv4i8QleY3D1N5OhHUh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787672171; c=relaxed/simple;
	bh=BIfgNIzttZ8ZozjEqL870eb/Obh/wMD90AbWDxHnDuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nw0OBRNDb3wVxDbOR1cJsRM+OfAnWdz2J9A1bLm0um0bRsnD7uBSyomsbSz39+zUfbuaE9tZKblTayJc54F54R6QW8fZBzsawIwYPoe4IIaFtDI4uxcF/UF8z3r5eQRlkW1MXwrnp6yBk4zGDXY4j6DRxCSXv0B74pLWIIlCmjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xJtc5q9O; arc=fail smtp.client-ip=52.101.65.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xJtc5q9O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzV/JLlqMZPdO334/f8y/In/v3d7ZTeTeR63fj2eHPVwD6KBQf0b4eIo7kucFqccz/nykBDeHaXYAfcfhSvesjX72aRWuOQd+zXtM+38TgquSWCuYmMntYrW6smDSWn7NTc9jFn9zDy1RntnDBJqJpHrCoHFBa3bx6ZWENEsXkBIX0t0nMA+93aaAJ+VBEvk5wEABPft0xuKt468fdiu+M3Ar/WBME9hzpDsgwthoNHcn/b3VfyWo5wCnCVvCh/siHg9dPV2w/h1dA6BRM3oL4WKW2bIhD3Xy2MdlkuKkvuI0Wzh5umNc/dU9QPbReTnJ1D14UH7xQq+saT71qCzkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BUxhdF+zqj3aS8crxoEWM09mHJ7yglTLeoIa0eHkHaE=;
 b=cY45noNKpp+1I/PV6yQ459twkWNpXAnZwW7izqWtFr7a+iTkBlRqtWgdFn4Jo9VudlIKVplSYRmcZUHeEF6i2JfFHnmgsY3rgz3IQa5GrpoIA93aAyfjfOQ3LVy4jOWGLNLPVpw6jnROOK5j5hfSFI+qo4bzyKk8khXjlu56aaqH1nxwgZDWXD9gfm93Z5GJUs//MxrLB5PinMupD8N+fmkdqIOZFDR5/f4aof7H+yqSqFRNHnREpt/b7BNes8JosInwsX93MqkC/5869mMkOf0dQe9j9Jb6hHgD3TbcDS5gDjgNZaaGkoVKfHLrK1gwpZpTBvAont+DomIZy0DYYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUxhdF+zqj3aS8crxoEWM09mHJ7yglTLeoIa0eHkHaE=;
 b=xJtc5q9Osz6SBITJExykwEPrD/rLvIjf1uewC2VLSGqkduwnvnJm1/1FbzEtZTkj9lc6XT7p9aMH9K7MpUHKkCeg3S33YyK2pq4BbGb/DSlUlFKP35DZbMeXCLY4AzAgdL4vqK+7Y710gPafbHwxds0rgdTFGZdPCB9Y6cfFQYYGXFWn4PyxrjOnuYo1OY9ZRaIdiqo/m6L/9zpztRB9p5NHnMOqeYE7NlWv3o97MTuYsypgTEQpgYdJzsVHIKhj/w8N4A9WGeNqM2tGXYf+PjOI8uV+L9P0+TI7U0FDBjU85+ocebNlLLRAg8W96Z6F9ReEu6bf9iWTsuShYBH0Ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB10744.eurprd04.prod.outlook.com (2603:10a6:10:590::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 15:36:07 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 15:36:06 +0000
Date: Tue, 25 Aug 2026 10:35:59 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, dmaengine@vger.kernel.org
Subject: Re: [PATCH 1/4] dmaengine: sh: rcar-dmac: fix style in struct
 initialization
Message-ID: <ao22X9RNzAWTYgGr@SMW015318>
References: <20260825141542.30901-6-wsa+renesas@sang-engineering.com>
 <20260825141542.30901-7-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825141542.30901-7-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: SA1PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB10744:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ab0b9e2-a382-46ae-21ab-08df02be945c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|376014|366016|1800799024|10067099003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ee0QvSMBffAF4oepP7dnotDamVIi5DuqcO/Qv81YpLWoiE3F9WqkVjTbaIo8imIYJTgQZKw9IngDZ6cCa1k3zndpicKIbuHpfErGitCEvA7KtLy5R5+AoNHAYw2REuhECMcYLcW3vrRLBKObd2P7pMkpBTE2d2gjEk9GG8MDabwwBTrHVkgKnRZ/yoOQvqF3A0zrnaV3MypIat7qRpx5In44nFXl8lqONVE81Fqd0zQ6Oxjosudn0vyW95J+HmDbnkB9b8Dnb8dJ9+2XpAJMNhhKOqBvgaLWQAs3eSm3Q/fgZhQqNSoQ9spjp08sjpnqjZHB8aNazQb/tDmyF3KhLinT08XCB9OKAYhH0bcWviqUm6cVQVLrf9nVdAcSLg2bvo27azlES4ZvuJe9HhTHzqO/JXfwa03WX9BeQHNY+VKsyzMcjZozhjLj2KXadurpg/8VSsRNfTGaFe1Qmu4ZykR9BhTHpQeatq4d281YQA73fNNGIji1ceEk5kOzIu9pQuMwSCZ/gafHBTGaiKIbs6/Kg9/fIrHdo8d30UTLnHfYjdO7xyUNC3LBFM3kgBE/fR185W4Z/bzlFVG+jqmd8FwVGKF0xHFxOAyVzSNNS4n2WE8CZSHo9n9tauec8G5v7PYu4inT8/QCBNscWQ4dYRVKgOwi+8HEzg2QQdkzH04=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(376014)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cD867d2RcNw4/Wi5rhpWbAgOChhaK11G7lgV70LPsMaMCVRMlAKB6L/+SaZK?=
 =?us-ascii?Q?3xyMpf39L1vFq0wXAWxACbxLPfCaoF4MISNgpx8T9SHYn9B7ZANWOYE7I6N9?=
 =?us-ascii?Q?J0dVtz+KBawqu8aaX9CmmUYl6umD+YwshytElpW3CiHWd1IKsoOI1SE2vBDv?=
 =?us-ascii?Q?Yg4xp1N/XavP3oKeouW1dVDV/Jkpa+dSnS5bO2D63y6OeALM7wbxgj8+3tXL?=
 =?us-ascii?Q?1iKCcSQf+gX66Iwf5stp27gi1m0m9i3dex1eRerorH8ougbkr1sACInaclmd?=
 =?us-ascii?Q?KFmN23kLeNqnhd6JmTlquYj/TpgcGjLE+WqR+aeaCvkFkEsUmEqVVCl5bIxW?=
 =?us-ascii?Q?DgMyX8EMGFf5Gw/1LYcxWD1yGDszv4KqWEXW4K9CLxD/l0HowgSXDBNR92WS?=
 =?us-ascii?Q?gkjE7PFGOUSc5NoCnNI19ht2zmOKwtfMs7SEQmxsdQWhys7La2IjlGjFtA6d?=
 =?us-ascii?Q?/ebjO1mFHq5r+NvBwxFcKE1luza1kHMvB4ETgwy0dDhVsSc8DrhT2pfL9ssQ?=
 =?us-ascii?Q?5R0D5oE2PrHZr0oCU5bX3yh8p0/xTqdR6hFGFH1Crytsin9Tz1vGJNpa6QFd?=
 =?us-ascii?Q?p4TyeEzmzQyCRX5oGq+gIuEw5jZ5K1zUunnCDJ0JGS1J6lY/wKY7HtadEWE+?=
 =?us-ascii?Q?5XsuzXqy521N4hKx20WuyN7UUsrao0FU6zWI4jCAJyZ11B/yJC2/lm4XztOk?=
 =?us-ascii?Q?Bi2vinq/wrSWnf8nms4+17AMoUmnf1RZgdQfrqd9Y19hE5HS4sMq+eBo48j8?=
 =?us-ascii?Q?izUqVCknnl6AeZCP6ngyFUiTXWJjC8HmvF+cgSYIbkWvMF7Lzj082VykiGvj?=
 =?us-ascii?Q?U+MKE4YxadD5zRNKObilxq2J9B8J3UiMLUATNnXOtz4sDb/EbuE5taWow0/L?=
 =?us-ascii?Q?VO3eBbw8gSTTMugWkm8fnj3MKyW+LXd6+wMO1Fomm+jkYlIUVF6DL18S6cAX?=
 =?us-ascii?Q?D3RijGktvfhJebYPG4sjlqZKyiPZLjNTdXxRX+ij4OXBIgoJMbd/2MYoDBQq?=
 =?us-ascii?Q?71pQl8763lmrnv/+xi/j1jLFNHeBOEVZipX22x7j3ZM763et2XHKqi6xfiaP?=
 =?us-ascii?Q?S54dtS/ENmrH3jKH3Znta1yROF2jg67hHOWNnym4nklFxs0ccbW8E99pAb54?=
 =?us-ascii?Q?wwAA4S6FMMdFjlzx5MuktKKuf5EAK6IIUBTZVbkXMzUiCnKmRvHsbkX+43ij?=
 =?us-ascii?Q?mBXJlbXhtJAcX5a9FEUjjaDbLcniI9sYbHJA8rLPlzVy0hckf33HFoPEffdF?=
 =?us-ascii?Q?1Ub5s5LhF8buKGtx+g4yHqIAGMWDH+tOBDM6oeXJiH6QYMcLfz/8c3zff785?=
 =?us-ascii?Q?RJfyEIOzCpDl9hdD8qjRCVvlumvyIF1X1PyVAYLt72spMrtO4uxtsKqXXTRU?=
 =?us-ascii?Q?kFvAHpZ7qcdAUwqyKVIWtfl0uhqHmAKLuBv2wPVap7Ht8rJsVMcC5WoClyEj?=
 =?us-ascii?Q?JO9LhbgtcNoJFi1Uf2teQZ9+gFQy2d8UpFbf7tsgQo+UXGO8T+BLdAkUJroq?=
 =?us-ascii?Q?r8ta0JGlT6PC28jZzV8THgYbj3hxuGYe2vHuPG4jO0rSOpCWvTYM9I7j/J7P?=
 =?us-ascii?Q?zoy1TC1AVoWWq9VnvEDcvAvpHKwjkNYAQ0LqfVrnDtKzxwGULYTrpVBFbnSg?=
 =?us-ascii?Q?zu2xwEg+sSbWgV4w4LmzF50WkENkzjOc2aZfsMGT7jBbETQqWMCyGJ5VB2Q2?=
 =?us-ascii?Q?BQAIIH5k+CGEHVlRN82lWIxxsnpRvJtlVEP+sYqov+VBiYCT3lq1ma9/OW4G?=
 =?us-ascii?Q?YcAIwpT5TgjszozvKEkHpAuZNFT+YulHeaQyscoNowLRXoXlwNzb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab0b9e2-a382-46ae-21ab-08df02be945c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 15:36:06.9223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+bozSRpjZxchPdBsYU2v5XTguNr7y51p5Qncj9OY0uaLr/uSJAVMkjFv0Cjp7Tl88Bq3Y7uoH/LH58kE9kUHIgLHXcXHIcZu/OGt1jMjkd2ADXqD8BQscCLtR4L2q1f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10744

On Tue, Aug 25, 2026 at 04:15:43PM +0200, Wolfram Sang wrote:
> A new member will be added to the struct. Before that, adhere to coding
> style by using a single space when assigning values.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/sh/rcar-dmac.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 44eab2d21d54..cf07c17847d0 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -1998,13 +1998,13 @@ static void rcar_dmac_shutdown(struct platform_device *pdev)
>  }
>
>  static const struct rcar_dmac_of_data rcar_dmac_data = {
> -	.chan_offset_base	= 0x8000,
> -	.chan_offset_stride	= 0x80,
> +	.chan_offset_base = 0x8000,
> +	.chan_offset_stride = 0x80,
>  };
>
>  static const struct rcar_dmac_of_data rcar_gen4_dmac_data = {
> -	.chan_offset_base	= 0x0,
> -	.chan_offset_stride	= 0x1000,
> +	.chan_offset_base = 0x0,
> +	.chan_offset_stride = 0x1000,
>  };
>
>  static const struct of_device_id rcar_dmac_of_ids[] = {
> --
> 2.47.3
>
