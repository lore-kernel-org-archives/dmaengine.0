Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011013.outbound.protection.outlook.com [40.107.130.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4FE48CD55;
	Mon, 12 Oct 2026 14:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815013; cv=fail; b=amrbWtEQ2x/1UFRPTqbXD6whxl+rZSfFoZgiJfZw43k+xkfBAOjOrj4icJx9Yfwmw9XKjK6ToGiTlhtrIVWRtMgf6+wbd5dajYYDu50y5897+eFJS5zFMoNeY8Shfz0Zi0RKW0GlaiLr15WW1oPgcncjco1QrRiDWsTwi0OVu4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815013; c=relaxed/simple;
	bh=ZHr2gh7Zqf26wr5IRWv7E3IIOXL94S4rSV2WeVuIBMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IxCVx/Lw4u1lxFmBLVBP8dmFQN7r1JMhl6vVqr77qaQqpfMBKppOCfJUItGL1x5ZQemienWHQ0Elw0OaCF9IOMn5BhwWakkICWPz2BH84dwHGo3jA50ef+8LBRrsxjtRkI7xlvl6miOmHvWHuAUZ/XNf114fB+pJlOnOgLtHobA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NuL/Q192; arc=fail smtp.client-ip=40.107.130.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NuL/Q192"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwDBwoomh5B+5MjVHWlIB0XwxvHxl4+F5Efjz4/FF0ijS/gfm0exnpl8jYSepMXJnHUe2+7sgEAsFKr7lKigndIDnSvjGZ0/g0wjxniJCmhdoS7p7j17eRStZbuBvVga6FYuIawCqauXmBSCP5Z5lrnudPwGY8v1QE7fj//RsFuNa6cgOnPVeLf7YDsFJIiFFrmnGLGxoiTViRbT+713zLYCfOtcQeLyikL6eFGn9klBWDOVMluPFsT3mf/34Gr87t/wr2DkmHY+bs8rqyCW7Tt/PtX+pyhpUMi0J66blKgaNcHPCkHb6mo47PJBrf+PJm6itQKxhwxV5UupivHYLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAQb2pr42+c2PApkbWxiCgxBfpdztWmOY765o/b9aKE=;
 b=zDuuhafqEl92DwHoOa8gWCqzc5m86k4umUXqx4aTMDt9kJeymAf+Ywx1xcuZfBl8P0eAC17OXyTEXsT11PL6q/k2zekeWU5RpWwrZeoG08s5BqAiu+yVaiMWz6uQGuDIzVwpmcIKzfcX/lmxDQncIy950rrG/DOWRjSzA4twN8psVfdktdAjHhDNk/vTahKsJrxVvTh3uUyXwgpe2S6cMIeNch37qomq5XNtRhbePH81ACUNPwE5ixvBjcck7f0ybg8747FNxNl5vcpHk86OVc/iZ5jYPqsz60nanMNhfdNZco58p1yYaSWCiphK2NKRapWGxVpLuMp60T92xwp1YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAQb2pr42+c2PApkbWxiCgxBfpdztWmOY765o/b9aKE=;
 b=NuL/Q192WfdHlyBqqf+kUNLhuBi4R0XE3kOmLSZd2niLUwjx1p1DDU2B5zRRx2EDYE4NhuOMDjcZiCinuamLEgqWcB28Q7V3KVhtIb+zrOTYw1DQ7tTa6EpeBgniVNkjWK9rNNfngN5vJKh9xB/8TjwKTU9JiGrm1jXIfDCOeesgqr1dmxILIMJpxRlBX5saGxu2BpFSxrxb8401IGSz6QymTJtylVhkwkH6uh/1+102nm3hKCW9VbCkxXWqcZWFCA8i7msGtQjoVlzxy095cyJ5M+OQrBqmcrqDR4Q9rnqhZv+MviBufEAmHP2hc88BKnL27xhhvYG+36imor+lUg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7473.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Mon, 12 Oct
 2026 14:23:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 14:23:27 +0000
Date: Mon, 12 Oct 2026 09:23:19 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Koichiro Den <den@valinux.co.jp>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dmaengine: rcar-dmac: Add missing
 dma_descriptor_unmap()
Message-ID: <asztV3LhVU6OOdLn@SMW015318>
References: <20261012123020.11320-5-wsa+renesas@sang-engineering.com>
 <20261012123020.11320-7-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012123020.11320-7-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: CYZPR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:930:a3::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7473:EE_
X-MS-Office365-Filtering-Correlation-Id: e8e1f4ca-bd18-420a-ab72-08df286c61f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|366016|1800799024|22082099003|18002099003|261009223027099003|10067099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	AF5/i9rua2ayOS2dHn3/8Fe0iSkmld7Oqw+I4QdQdPNftq+2djZRQD6Xd5hifbOPOkliBC7mGToO2g6ARZKqufJ8Vj53nlw3vubPzc04xPwRHew6Pm3h1qKPyVEkLgw0ux5qvvgGwU4rSf5YeIYMyb3+PBlsEgM0UW4XJaulhU7Nxi90AxnqdOgGO+nL8JOt6IRTakie/vtI1PaitmTgeGpNXiL/tnYWCMQrWH3WAuNHeZ3982KGefQNB8Ig/4lURF6gRYXz3LwMh+SKtQBiDoxcNi5BNniIiuvR2906EvhzF09loQcY4X59pIAk+DR+5CFLcUsxh40Zjk7BKSRNU6zC0NVfBZb4CqP3yalRV9vVju4WxYFPytE2dU6OHGfr+BPqZtN+WgZq+G1ZXz1Pq70f2fOoAoAAyFrU0ZNBdqKTajY55baEkzJ5cWKeoknihoyYqc2Ya3Cm3Tlv2bRQUu8qjlGJ/4LTLRRhZr8OqS/MhjeZgV9dUpbKl6iAwY6etaOazktGZ3w+XvgbyCRyfqX48b2kY0kMFjiAiQE+MxmAoMIyqk6RQSyEt2Fj9le5zHzB3xFdorpkDlWjI0G8L+AbWzklEUdoN27jKMQgszPEkInK4rjvmBo5zUpKqjLBf7PGvNx6sc01MZqhkuzpUnefs26ErFAdzkC3DeWbCY4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(261009223027099003)(10067099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WPNXRaF0f14VW9S+O3348sok+lp9EvTxaEPGDUx1ChTYGXgk6rwKONXl2D++?=
 =?us-ascii?Q?nA2puPNdQeiE7OlIQYKE8Tyg6U5xuIy4P+lzIx+MRY2XUQkEWzo6wbica12u?=
 =?us-ascii?Q?oTQU1i06Jlfmp2vWF3LqoiODNjWudq9OoCIBaY3PI3k7QsNaVoL+ficowf/K?=
 =?us-ascii?Q?JhI+QnSmLmYCbhMqSRD5MG619oSDQNX0G08ylknpt8cHvCG9p0sbYiiVv/lG?=
 =?us-ascii?Q?v8OVP0NNa/7ai2HMyhGVnkJRVEByomfYKPK3UW7234nN/Gj0S0CTEVpq0Lxe?=
 =?us-ascii?Q?tvj+nLX98Vdx9q11spLVGSJ4jKGekVAuyYoe2FtgfdE7c80dhX7ocVe6wHb2?=
 =?us-ascii?Q?h4et3CJD+AZIVOxsoOn2rZ+G51+nOzV+AFEYciI9Potp+6D1rwaspJp8gepp?=
 =?us-ascii?Q?i9Z1ILZWVnbtysmFlEHlkQjXdS/idZD14n8VhBc46rUoSXsgiQ59E29DGCaA?=
 =?us-ascii?Q?C08e6W82ShBzoMYfuSaEVciAla2GGxY1m8B9uHbhf3+QNBxmAtVaOW3xc5Zw?=
 =?us-ascii?Q?HpnhaI3ahpflrDpsMYaCq92WaFhlCiAP3M/UvpMksN8fo/n126lsrlmMvEAX?=
 =?us-ascii?Q?YcrMsHEeV51zg022vCE9dXcu09Ch1JwVafhXzqcd0IWcZZsyMDJ/23vhn1tV?=
 =?us-ascii?Q?q8PLjlYVmUqLtQmMp3t7/oBtYPMiO7bNPSl6MemlGVT8TcvWibwR3ErWLTst?=
 =?us-ascii?Q?xyqONKF7jw2Gz91w4DhCjLnxkixl/H1iDbGTIufpd3WYL2rmdajbvXn2/4/f?=
 =?us-ascii?Q?XaCzPEQ28Tfz2J/84ro54djEw8kc0/Htda+kf8dZnt5YAaNKobgELzi04LqA?=
 =?us-ascii?Q?kaF0cZpGUWu/uiBM+aDrs7guiCloxXu867KUcRUUbvDtnwyF5ZfbZ4RL6rk2?=
 =?us-ascii?Q?VuJV5XCURfsikfMoHRshfMHcA9oyn7pKzlJCrsLQpgoDuCjBhnBDHOdzKJSV?=
 =?us-ascii?Q?aEpgXRGFx/t5KHmYkiNb3fstq2XVcAwGzXCc6O8zuXAWU7QTTC79lbYSvu25?=
 =?us-ascii?Q?b6vmatWebE725nHcIFEl5rvdgQAF/gwOfl+C4bguAt00mZq1PBYuZIX1MW8A?=
 =?us-ascii?Q?EQmXBLSx7s4N6QkA8xOBP0ArjAJ+HAviYZtezuXUMSPmOOOP5qr7N8G8aa3H?=
 =?us-ascii?Q?X+8NZwHuvEBECaBojo2aoNjTcLx1Po2Bg819Bsv7yW7Ywbw8eMeStSK6X5+4?=
 =?us-ascii?Q?aHfPpLHdsieUC3apKbuPSBDMaXppRnZ1n1ohyjmVXbHB9OUZNAWJO3pTfbGk?=
 =?us-ascii?Q?yyOoLEZ2pZS6BFTH8CXQud4do5I6GjlEbnMRlU9w6KCGiSPzprnKQ4nHHmJ6?=
 =?us-ascii?Q?tWRKulcCeWoclndAEWrsMkKX8z/KeQs6hR2Cx/mnAgAxBCuTzBaPdcZpAEGs?=
 =?us-ascii?Q?PfMfCKZdvCehmQLRG+nk856cOs3TzMB9i+V2EPYj/gVdD/2w9I6jm23+U5kM?=
 =?us-ascii?Q?UmV4L9VK/MlexqsGhZBrMTKFRaWuAylbVbwCcxUhCeCWdIxGn5YymPJOU8qT?=
 =?us-ascii?Q?aouTLsXyTA6idN+idlLghZTRg/Can4kZhSNLeg7BL0dmTXr/a9P4HZwHo7EC?=
 =?us-ascii?Q?srgGD2+VSjdTOtte7wlg1dqjdNmRx4WxT2q9XHqMBj0jb+O75t5Jd6e73BKw?=
 =?us-ascii?Q?j/HV0B2gR6ipX2bY0h6W/e0fVsv7iKLJ+wpgI0AKJmxwhK+jFhEwmPR87miZ?=
 =?us-ascii?Q?YgF3Eju7WUm2ztHH1/IZoSOmUvl85PY5Nn9imFMTcyAJb/fqNYRTgbWerG9G?=
 =?us-ascii?Q?n+AY1nT8qSL9qp7/lpTR8++PA2nLUyhOYwyQpv2o4S61P780NhY9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e1f4ca-bd18-420a-ab72-08df286c61f0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 14:23:27.8736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6UpN8DA6ANJ6edTlhnnmEhLuis/Hu6RSjMuoIOK2ccrAdXVXbCK8m/gEqHAHYA6PwXYFvaEvrkxNR5Q0BY0MDXJZnoKMHjifFFA8aFjEI7j1dEfgPmyUbcW3i9cv7JN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7473

On Mon, Oct 12, 2026 at 02:30:22PM +0200, Wolfram Sang wrote:
> From: Koichiro Den <den@valinux.co.jp>
>
> Call dma_descriptor_unmap() right before dma_cookie_complete() in the
> threaded IRQ completion path. Without this, streaming DMA mappings
> attached to the descriptor are never released and may eventually exhaust
> DMA mapping resources (e.g. IOVA with an IOMMU or bounce-buffer slots
> with SWIOTLB), leading to dma_map_* failures.
>
> Also ensure dma_descriptor_unmap() is called in rcar_dmac_chan_reinit()
> (error/terminate path) to avoid the same type of leaks.
>
> Fixes: 87244fe5abdf ("dmaengine: rcar-dmac: Add Renesas R-Car Gen2 DMA Controller (DMAC) driver")
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> [wsa: moved unmap before cookie completion, added Fixes tag]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Change since v1:
> * moved unmap before cookie_complete (Sashiko + humans)
> * adjusted commit message
>
>  drivers/dma/sh/rcar-dmac.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 5b54f1c4ce15..78a913c4c0d8 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -844,6 +844,7 @@ static void rcar_dmac_chan_reinit(struct rcar_dmac_chan *chan)
>
>  	list_for_each_entry_safe(desc, _desc, &descs, node) {
>  		list_del(&desc->node);
> +		dma_descriptor_unmap(&desc->async_tx);
>  		rcar_dmac_desc_put(chan, desc);
>  	}
>  }
> @@ -1653,6 +1654,7 @@ static irqreturn_t rcar_dmac_isr_channel_thread(int irq, void *dev)
>  	while (!list_empty(&chan->desc.done)) {
>  		desc = list_first_entry(&chan->desc.done, struct rcar_dmac_desc,
>  					node);
> +		dma_descriptor_unmap(&desc->async_tx);
>  		dma_cookie_complete(&desc->async_tx);
>  		list_del(&desc->node);
>
> --
> 2.53.0
>
