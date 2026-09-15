Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013070.outbound.protection.outlook.com [40.107.162.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE194AA1C9;
	Tue, 15 Sep 2026 16:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789489821; cv=fail; b=HdKJC6Zha2VcW+fGSbbm1dCQxbTweyjRt/4ztlTNjjulXMPei07W9i96FzsH5lfEGctRsnHRKj+pMrhWHOB5X//ogTsbatiY9hRfw35zeVQzWk8QhDtMAMJMMounoSQ7xQEU2vVOmFN+q2XpufGdE/vTC89LZJ1Y/gbuUa6xsN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789489821; c=relaxed/simple;
	bh=DLVy9x0TRE8IuPgNWrVipPEcX4Wy75h4DA7Hd3dvKuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L8W8MTjFi6nFJjDaaQwtZEURat0W3z8UZN7yvP/jP1y74oH8puOPha5G2vH51QW0uhTDKVgNeoO6DfRrFqggVCVHryEuyA4VBvmvfvFi4blfMR4k79GDT2HYx/KqFZ4ilm7tUVs/QKP8HH9gz1WzoQh/qEv0LKArpuWM7L36ERc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VnO+yCMJ; arc=fail smtp.client-ip=40.107.162.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VnO+yCMJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJGwUCZnFxMURRPeIDtkl5gFchJNg1MvWkxfkpp38oHXEgY0za1Ho/HzQJTuIySYZJAKWHgxW2R/ZyWa7ifZAhPc0loYWLqgpz0VxB0+TSTTFTghR9MvyGxFF+NmQ6WPo8UxGoIzo3YTi92KUbCErrq3wU82CL1Ad+42wpwJfyrXObOfnOGf7STQ/qPe6u1edas9nO4S3COGMsOoItA4EMUBwXMvoOkxnid5oY9916vuCLbTwKaOWU1mr5Fxpn+wmCwenhW2fqegA4XqrWVHM6yF29bNBjfwiKIpO9+wpYkwsqAG+qjaiOm+RWFeKsFaCRQpM6XU3U+5YmIfcGG+hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ra35/ioPq20XYZ6jYG21lbMU26rA2cY+5ssUdG/Osk=;
 b=FkESUwmkHJfYFESHAvOlVqKdvCGLLQBoIdP5HJ4PhZtaBZZGqPCmecAhiSthLmzEGj47n3bqTq9vkXRyc7OtArpPDsXYbcPMOcj/h9zWYu8mSsVkv8+kdmkLLUxwsT9RqafHYGUXk9Bw5JtomidFgJVaj67AOgMlymUoHj/X6gmVKKJW7IKjpMSeNWltQBITLTgM6mtZsCeyN3Ihe/EsZzxIeVJRR0URpq84M6/oNClmcbyc+U5kzGv5lpPCq5wB+XDgWCaKFq/QZ301HdEEQOhbc/QbNAE/Ql3/IguUitQzsWv9ZchAhVtnPeb2S1kgM9VTXQ8Dx3BI2YYBlpbh1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ra35/ioPq20XYZ6jYG21lbMU26rA2cY+5ssUdG/Osk=;
 b=VnO+yCMJoloq+TUMaLajTjeapjb9kuwVSdvT0O/CUxajrMmAfnO+RnnGBE/ghAhBj/JF0oBl2vg0vx1QkfzgSe/ymSjBOSVDkJS/B20c2mnbjlgGfw0XO+6s6DAS8M+x90ib7ulVkzKftUFANU1DnBTZWL7e4usBt0J3KXV8on92E2WEvHrCGyQBuOVOaEqL1Z6PhUoChZhsSs5UqKrCS6GoxViyi1P1mL00Yfgx2UZ5JB++eZenM2vwiDLZYCG4/1oaFQHayKfANbyO1s35o6BcZay4KlkApfidNrDciXEEVa4H9bO1tcZI4guOM2pap0R0ePeuCuO1Fiyq9K8NUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB9232.eurprd04.prod.outlook.com (2603:10a6:102:2ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 16:30:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 16:30:15 +0000
Date: Tue, 15 Sep 2026 12:30:08 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, dmaengine@vger.kernel.org
Subject: Re: [PATCH v2 4/4] dmaengine: sh: rcar-dmac: Add support for R-Car
 Gen5 SoCs
Message-ID: <aqlykF0OjfJXamhU@lizhi-Precision-Tower-5810>
References: <20260909094009.2167-6-wsa+renesas@sang-engineering.com>
 <20260909094009.2167-10-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909094009.2167-10-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: CYXPR02CA0044.namprd02.prod.outlook.com
 (2603:10b6:930:cc::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB9232:EE_
X-MS-Office365-Filtering-Correlation-Id: 5397c4cf-c918-4b6f-7607-08df13469f67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|19092799006|376014|22082099003|18002099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Dhn5C9V8CJvAW7Kzd8zQpaDSZeOYdx0U7kn3qQLUch/hK0Sg80m3/FS9G9joASssBAoDQ3qy9DR/bFETyZdc0nsIOtq8ycFMmh/LBmrAtY3GC+TYamWs2YnygG16GBNPDV2apXVUw/Rv6Kpn+S1ePqoPDLMzaqOvjg4bqAHqzRFD+NjDGmQKSRW9THlML66+UlHTax05o0Mh+dRSawuh8k9yTfahM4qncu28GfWaX7nWqUMydH6HBOxH/wxq1j+GaJLy1+oEWLcTIQ//ivfkRTy7xS/lA2/U9TN3ZmKm9tr3QCdqHc/3XrVs/NU/tlXWp68OUXAT1j5TWlkNQ5uvAvpyoPwkM8ge8ge3gaHyYPZ4VwEWIo9c7H/Mu4uqVaKJh3EhH+VQyX9aZf0xMRNeOoFFaqDwrAa0bPFrAYnnQu7crSmxt/2SJE7oyqsQibA2/N1jWSODkLsr6XNgZW5aF8su+vmhMmCWhNaF/BTejDnelYcBQarswzxuZnLnvX5ye2HIE6eW3xv7dr+t1zcAKy4SdGBlDI09PDlPrF5qIwqQk5fKf4ITvPS3/sKXfs6voI/cJ3jMoqHVNtukV//bND0ps3md6BZVkx7Ec0hDM9lzNcVnvMHW4HkwEPmGX//4074pl26BvrvY7U1xfnVuWORIsJbPjSqvl3pUChfOrjE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(19092799006)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?auO2dXWpsBWgAazk8mHOa3gyR5uQtruEw2cAm8m0IdQdjRhOcOmhPtXjt+Bf?=
 =?us-ascii?Q?fO/HLXh3pQ9qqvmOTb6S0YDlyajrCdqd4aY8wKJnlTH6pyQ6Ui28BZ66OMfe?=
 =?us-ascii?Q?oLTAPd+ViNhRY3AIuS/O+DTf0HyNa7SzRIaOxQEH7b0mtkaL8YbepvoDX2rA?=
 =?us-ascii?Q?z6ucUu/U7aabyxqXIBMVxOheb6HLVDDauCslPLqIcdXSKXEGBBcQ4Ot+Jywa?=
 =?us-ascii?Q?s/7iOYWr/R4IBxaj4E9PpeNc5USL++9Ed67jcs4ULLmfQxmdtATJoX3L/9ap?=
 =?us-ascii?Q?02BacyitTVQle2SfZBP2sTEsSjRkVcVTfyea+KFIM5SylOAoUpwukuCT8zb4?=
 =?us-ascii?Q?sewBtKfwCo+Y+DHiJpsvExWTaB2sRAY2Yy+7iR+333yO/i8XdemKhlTAJnVU?=
 =?us-ascii?Q?GqxzP7bjV2ITxtCIqY+oj+/PVuPYCtlnZvJsJyDjW2ctgW3WyohRLK8I5wr8?=
 =?us-ascii?Q?H+4RNZawhOHICzOw8F6mTV2/V9NI5Fr1KN8Nt2yGjnwr0sdLs1UJ+tyyjPJB?=
 =?us-ascii?Q?zrawyyUgmhPBG2jSJCLxnMtxDw3+E6O6WJahfJUEdIFpXblHc5Mfz3ZgQeXf?=
 =?us-ascii?Q?libee1B/vBt2V7SUGYy9wxEG7Jym5izv1GzTd7k9zooooWY9xksdmZYxvbQ6?=
 =?us-ascii?Q?qCwK8klKG9nv8/bFotLDUlUhoZPdKcaJNh2jgQsi9Xg0Dci6dWb5RwEsvg/5?=
 =?us-ascii?Q?xKNjhlfh94I3YhM6mFmt2Di6fzrZUHPjRs2YJ2/URswCUAaLhaM32MTU6mIl?=
 =?us-ascii?Q?mJgcOD529RvqiW+EzH9dRoYtBbo5ns0H8OGLcO8QoAjd9AlSQyX/ohX+PTVd?=
 =?us-ascii?Q?Koj5Q2Tx1ArJLXSq3fS6mu/3RvpaqMJyu2evok8NYojwjZwTEGx/D8u/68zX?=
 =?us-ascii?Q?1ztEkXuJDxhRHNctTP1FYN7V1jfjdOlNXmEpNi4GkkCusWSltNcEnrnjWQiZ?=
 =?us-ascii?Q?aCkKWNEMLvanpWEiH4Nc5oMdNkpbe8WDPgH8wmihCjh33KokPZ6VZ55eaRjQ?=
 =?us-ascii?Q?hxF7+EprA1lYhA4wazpFyk53EfuQG/tVrbLLpCfOXVaHNqzeeb7CQ4nfJjRS?=
 =?us-ascii?Q?Z0AyWcdiFzdNqdNDpbtNd7te/5EI+lsmp66K24oM4PzCTeVBnjAOMvHDTtWY?=
 =?us-ascii?Q?EWJZn0cpWv80WtDSbKQGGiId/27A7Iv1XE5vnXtPTtu3j+8TREwWDOSweUIt?=
 =?us-ascii?Q?w4/fh7Tk6oNj/W1fbOrvSKGKrhTVye+kuFrJJCVfbfrTfwSLrigAJvnM4LIb?=
 =?us-ascii?Q?Tqv7IdqC0Xco7nkbDzta3g6a9bZVruWWnXAb42fdwdRfAOT3pKpzBBELwMSt?=
 =?us-ascii?Q?ni/nwvl54ucUUEL4tTe9umfd5V34DS26ly2XyTcWYl/dmqPhjZXhTGrgBgQd?=
 =?us-ascii?Q?DlKbDsQ/NOuFsCoBcHZfWWc45v6m7viV7MI2RrZ+GyuRlWhPSVblIgVZ70r8?=
 =?us-ascii?Q?AATQbKQGBgaZolyVnEDpKp1T/wQFcdMjJ4iO0r7dVQ9VaYcKJ6YLWbzfmiTa?=
 =?us-ascii?Q?jEoLp78BG4cfe5C60T4s1k7gLHNtif+Sqcl6s4W9QFA6k3AHr1dHtzRlAski?=
 =?us-ascii?Q?oDTgR4BFo1jQCB/eEAKCrwjFT+8hfjuZh2RBvWXl30vufbaI+2eRsOFX1ODb?=
 =?us-ascii?Q?OIGsM+p6pXwqB8ADTvqH1vLuENmJrgQ0W4GBqLFz0FcJCXeEKZ7fdaQQA/YU?=
 =?us-ascii?Q?UYN4D0gCFza24ur08CDHESZRQAzZqZvMPgSLuDYQcnvCEostYc78iTv3OWVI?=
 =?us-ascii?Q?AxFylzQxqV7ZIRsk2cVC+4GtlEPm94+eh2kFy4wecrpkDKAktyCf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5397c4cf-c918-4b6f-7607-08df13469f67
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 16:30:15.4998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zFlgU9TRjMtUnpEij50JfBBHY6wxI6ua0yuWBaW+Q8zvJVE82zQf97wnMN2jexdf04Y69EKqPsqRFjTNySXwUEVNJDUO3iSh5JNP3+n3kTemUlkXZWAh4G79Gq3uB6k1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9232

On Wed, Sep 09, 2026 at 11:40:13AM +0200, Wolfram Sang wrote:
> Gen5 is very similar to Gen4. Of interest here is that it has a SMMU
> instead of an IPMMU, so there is no need to set the flag for a
> workaround. Make the module description more generic while here.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Changes since v1:
> * reworded commit message to not include "we" (Frank)
> * tags added (Thanks Geert)
>
>  drivers/dma/sh/rcar-dmac.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 4eca52aeec02..3ad8aba5dcd4 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -2013,6 +2013,11 @@ static const struct rcar_dmac_of_data rcar_gen4_dmac_data = {
>  	.broken_ipmmu_microTLB0 = 1,
>  };
>
> +static const struct rcar_dmac_of_data rcar_gen5_dmac_data = {
> +	.chan_offset_base = 0x0,
> +	.chan_offset_stride = 0x1000,
> +};
> +
>  static const struct of_device_id rcar_dmac_of_ids[] = {
>  	{
>  		.compatible = "renesas,rcar-dmac",
> @@ -2020,6 +2025,9 @@ static const struct of_device_id rcar_dmac_of_ids[] = {
>  	}, {
>  		.compatible = "renesas,rcar-gen4-dmac",
>  		.data = &rcar_gen4_dmac_data,
> +	}, {
> +		.compatible = "renesas,rcar-gen5-dmac",
> +		.data = &rcar_gen5_dmac_data,
>  	}, {
>  		/*
>  		 * Backward compatibility for between v5.12 - v5.19
> @@ -2045,6 +2053,6 @@ static struct platform_driver rcar_dmac_driver = {
>
>  module_platform_driver(rcar_dmac_driver);
>
> -MODULE_DESCRIPTION("R-Car Gen2 DMA Controller Driver");
> +MODULE_DESCRIPTION("R-Car DMA Controller Driver");
>  MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
>  MODULE_LICENSE("GPL v2");
> --
> 2.53.0
>
