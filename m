Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013012.outbound.protection.outlook.com [52.101.72.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4FF4A99D4;
	Wed,  2 Sep 2026 15:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363619; cv=fail; b=tm7cLcfviZwRX8aG1Y5cAdwS7ko1JpGjU2pTZi6IhecLjRThJcQzQ2TvrW5/48xhCGYWZybgfiuaZRoMZiuHN1rusKF/qYbEhpeYSBKt8kOhcTj2A0IWCTXROsotqVqUtIeyt8Huw0PcF7SHQLT1+JtURQW3iE1aAt00jYPCbLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363619; c=relaxed/simple;
	bh=F+qpi8/Uotd46Nx7ScXTFwD/nTf3JYaLX//DN4EMNSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OlCKZEpGUpXUICzc1Xp8U5g4u7yYh+gxaloldB1zW71xh6P3pRfmNyRrxHcY+XBCzn9FhfvI1fs4Zbagh9gxDlL04L8bLSBJpm9hxh3oll7MubL1/E3MZmfs7panlZPtnlcw8LYP/LsIQ9wuI8KGOIIV6lhdFPITPFpR2V8vv0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JLKwiwNd; arc=fail smtp.client-ip=52.101.72.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JLKwiwNd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YFKBw+k9Dbm/nJb5fclhO0EvIbzEJfqBeXxC2C38kniLHDsCYKISAjY1TGBA3d67CxU96FY7Qko3Yx88lC8RW5VZJq7AcK3W8K1/BWmoEFMxmJRJjx0BHdjvtTYtEzeK4No7He4qfTxonsOnH3zUmPQIaZSEAbgl1ICRGJhMnscjHbm18rHQbI1QMoWjWWVQHp0+mNbp3IvVam3Mg3TFmHJV0A7hA3lFATVnB4yUsuNMFII38ec5fuW7/+m2232eokTY1nlHc83PC4fkQSmZtQiK2Yj0y/9HIfrYlP/vfDFzmcao300zMfSiDaPxrgKBAl65kwLSmEyaXQw3bsKIUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRLnrIhp0a7R1qazzvYVRwyXZFS0Evs1/yLFlr3A2JA=;
 b=EbBmq+R9m4uJg+EaxHTUtAu6Ii44O8lAgBTlbTOGOpLsxM+0Nyo2HCGlCsgpFW2lmktKeeUMRVMIbRJJCVNoqEDYxuAwNbiLqXdel1haemVBvkTrgVi9ZPrmlJ97YzfmLKX/iHVJOm3n8jNH+qVUGHTcQqBW6wW0xD/2W8pBdAM6Wv4hjSuMmTbZhbflxABbc1iywR4HZEm4UQ4sO1xdxvymuw1PUlMkEGi3f7FHPrKeDrqiVzPVCkKRovPqT/LU/cDLX1O5yeH+a0F5ycWutK3kV6tQsog6FrOSmRkkwtK8p60OMc2Eyt812NhRp4Hnkuj/ka/YgQwUHvfUTfK6Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRLnrIhp0a7R1qazzvYVRwyXZFS0Evs1/yLFlr3A2JA=;
 b=JLKwiwNd8moDuYuxkRC2Ot8SsXqMGx3UzSHwIs17hVBPKU0XYvnaXHypJ0VbpSBJVqa4/QiuwH49drJXCisWPRUypNympY/E/97UIxCOfwJrMXgttVVPlQ1H4zqlsNUqNiKVo8GFpEBTsOjJYAONJxboJ4qnyRcDULKeBwC/utmWR3cNdgpZpfsVoCTCwP/4JYwZkSEybtF/EajzIF2fmdv0lnUTshv6mPT3CWHouA7yOHABYORnJnv6iYOzCvid6poIsU0Xuzjtrmj+e2Jac5hEvzNQb0TBvAgCFEWy0Z2Rw7Go+B3hn0bbhcco0W3E0V7114AqreZPkAjsJNiuHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9474.eurprd04.prod.outlook.com (2603:10a6:10:368::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 15:40:11 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 15:40:10 +0000
Date: Wed, 2 Sep 2026 11:40:03 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v3 29/34] dmaengine: pl330: route callbacks via channel BH
Message-ID: <aphDU9mMTB5hOeNH@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <98b9e66a1ac9f866f36ecc60d287e479bae22f60.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98b9e66a1ac9f866f36ecc60d287e479bae22f60.1786384169.git.allen.lkml@gmail.com>
X-ClientProxiedBy: CY5PR15CA0216.namprd15.prod.outlook.com
 (2603:10b6:930:88::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9474:EE_
X-MS-Office365-Filtering-Correlation-Id: cbd57952-0188-4880-57e2-08df09087928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|23010399003|1800799024|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3hwKEbXzaor4wA1rUO7enti7eUFtDG+R2VR2cAAvAPum+PYJ855ow7z82RwbrFeqAfWWmdZvGtxAhyBM/CpM4j7lMdHa4zwzbKtyKnnQHtnF4V26NCU5n4LNAaI1y/JBobd82EaKbWDaFnpyb8TR/Ou60koVbY+xaWyJrRQOHPl3AUARNHqR7kzEXzrtgnc+d9u4V/+tCl/653VWzmzbsPOgZUvsFre7atBHq1oXG6t1Agi9InjVI/qInS3BpdELo7LYVru+kt/nOqYDpx2QF/2VvZciDcoovPe2R1t4OlXr/mVE/SEjsUjF4cIJc91/fvj6YVKSuOUf1UWpJycdknqZBq2zMfQz0giFi4QxKzlIkhk7QOZeDMnfVjOUy+xvZtNXWN23HwGHZqICc1aoaV6x61uNzLFw4E4PizYJZJJSezqtJWJ23Edj12sdl2Xv50JGgtw/3w1TbApG5pUAkstXmrFjlfn0FC9cO8mdALAZIJT1ZBNrnVWpwO5OCEeo8jeednDousa7eHfUpfRoQp0UWc+PXNusd3bLEwG+HM31ROYIHfCECc5SnXv+937fa5NV2oQzGS41c5SdVrxMWgQQW+t2TjiMgb3PRGjj0qz9biy2yVV0VF26KxBeJYgqx6sJ1UvKpaOEAhbi2DWai5ahXiITUkrbhE4li8PtXCc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(23010399003)(1800799024)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/2TTkEz0GgDZA/py0v/Wogao2B+8Die2mFk1F5kszHuhEG86s0W/9E2NmgBZ?=
 =?us-ascii?Q?2MbOU52AuzNOiw3m2QAT6n+vesqZGWffUfDqY6692JZg1UVSx9mE1dska1wh?=
 =?us-ascii?Q?sPfESjsli6XXIBjE3M508OpkWyzmKU18t2N10xmU8xxf/gkD7AyyFymgKvjt?=
 =?us-ascii?Q?/ZEm1QePp2+o30UsPlVzw+ENVnGvoaZzyGtFabEe2yaWWBx02OQV39+AWnbe?=
 =?us-ascii?Q?n65HvoatbzPN/f4XtkrPq16UWG/16SOE2YM0eSmP2mfX4OLqYV9X1yQ/3sL8?=
 =?us-ascii?Q?jcITRRQY1Fc7cQYeY9f77wJIfbrTEd8ALFkGOwmO7ByCa8xhxqgHNQwTYWoJ?=
 =?us-ascii?Q?z3j/A8fiQKvt/ZA0BOJHQn3aSwJJ65IpkMCRZ0jcHZDXSbzly0N+bEKH91XR?=
 =?us-ascii?Q?6XEOLFYmdX1EYoT0CSYrcTmPuUFv4HQl32LeyTOiWtFaePOAA43yb0yt7/z1?=
 =?us-ascii?Q?qlXpdb9gFqxiZZnTiv9SgrSfhkZt36Jqv3fUYdWhNf9udo1mjRrIgJddQ6EU?=
 =?us-ascii?Q?2FNFFQ+leYjj+k6LJZZF7ewR5P5I+PBistr8arS3qgR5fLuih6MujC2hVlKk?=
 =?us-ascii?Q?G5kTxue+GzWkSKbCFJJqGpvAatfI6KqNZVR3yghT/nf5BcwR8TTwbaU7VxGd?=
 =?us-ascii?Q?OX1YtOD5ZBLJeE7tzcqyoJ9fGfDgTG/URqJI5ZxG/b8Z1D1G0dAxIZwRnC9J?=
 =?us-ascii?Q?mllWmx4br3U1EpZ+3puER8xpaoElTBUJ2J4mGtZLDV2CFU1pA82LlU2GD5Z4?=
 =?us-ascii?Q?tbKgWcql1umUVLeKwjOMABcwrU+kHRbqniyIKFWb+5L38noTrIvoxgob7sGM?=
 =?us-ascii?Q?co3CbKe4s0RD/rYVKc2xuMuobesKRxv9qNdZF9nyBP8ylLR6bki52Hd3rhUW?=
 =?us-ascii?Q?q7bJuzXqfGqBkjvCXkogFtJjamPmVflbKrwps/iYfVigjgIv2y/ztET8Jln9?=
 =?us-ascii?Q?l0lydHaXoRiOTC/JoLF2E1Lm/NDTqnk30CK/KTIuB7GiFlCm9vC9NBSSg6Bt?=
 =?us-ascii?Q?DrJsku48uzW3t8akuNmUIPDnm4W8dbpo660VBAOmfaW4rrdi2E3OgZ7xVrkX?=
 =?us-ascii?Q?oO7o2N709blS1zzYIRnCdkFckOydFvMDJLaWa8LmI+XvQI0DZ91Q+dOBK+Rk?=
 =?us-ascii?Q?zKXD5r8t9jxPc6OSSIFamMJvn2cgQSxGOCKstf2bcOO/iqWDlw37AsmE50Pe?=
 =?us-ascii?Q?HHsAQO2o6kw4nDcrCJIPgDVfQ0rpO06Bxpo7d9ExXahhGvRYsD2tXgdJ+fG9?=
 =?us-ascii?Q?TZVUtuAtw0YsmyAfQZVCvrbPcv0c0c4zowd3/Zt9PjVCQhssZd5EyoY0dwx0?=
 =?us-ascii?Q?0ejJ/7IkQQKjHcTH5G71AwKgwgvUKu1iC7NSMFgIFuGsqfmdBSCNpF6EsIb1?=
 =?us-ascii?Q?jgrCumwCwCCmAKU2+0pXESmEgIk+NyY2QmkIdvZkK4k58wefTwVkdD/3hQ5Z?=
 =?us-ascii?Q?giKumkAJAlw4CukXQwNNhCG7a+htzNe5C/mEXlv0i+kVTQ48zmtUUeeW136R?=
 =?us-ascii?Q?V/CYQf3VZDP95EOXaH+W6iZbojA/nu8fXAsEWGQXlvc7BEkmT39phBFISvdR?=
 =?us-ascii?Q?gny5thDkpmC/NWZM+PquHn2eBz9LL2eCZp23bGaLdLWJSb1LNCcsxxz3e+Py?=
 =?us-ascii?Q?wza2b3Cg3AXkAaOY+Tpb2oBCSxiCXjCJCd6HR8kWXLOYARSXdHlSMVB70DAF?=
 =?us-ascii?Q?Iu0a9rCLfO0PblB4UM5gcORRywDuYDePVlNCW0x9T3ECuLJOBOQVgFuZCtW3?=
 =?us-ascii?Q?jf6po/3ZibUNYQuuWn3QQosrNmxCckMKcWNSNwkdA0y4rW5DWFAe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd57952-0188-4880-57e2-08df09087928
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:40:10.8853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PGan8/zOr7JCoWqXlekY/cTgSQq9m94hLd43yygFpvSO3Le8YeCRD1QE+H/Q+mhN0ZUFAU7Bt7JPh1uqkUmqI8nEVk1dG/jEdX6ENCNr2yeTXwHPbiw437Q27Py7xoKO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9474

On Mon, Aug 10, 2026 at 11:09:30AM -0700, Allen Pais wrote:
> Convert the per-channel tasklet to dmaengine_*_bh while keeping the
> controller tasklet for non-callback events.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/pl330.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index 25ba84b18704..1b6069ba0d5e 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -417,9 +417,6 @@ enum desc_status {
>  };
>
>  struct dma_pl330_chan {
> -	/* Schedule desc completion */
> -	struct tasklet_struct task;
> -
>  	/* DMA-Engine Channel */
>  	struct dma_chan chan;
>
> @@ -1574,7 +1571,7 @@ static void dma_pl330_rqcb(struct dma_pl330_desc *desc, enum pl330_op_err err)
>
>  	spin_unlock_irqrestore(&pch->lock, flags);
>
> -	tasklet_schedule(&pch->task);
> +	dmaengine_schedule_bh(&pch->chan);
>  }
>
>  static void pl330_dotask(struct tasklet_struct *t)
> @@ -2060,14 +2057,15 @@ static inline void fill_queue(struct dma_pl330_chan *pch)
>  			desc->status = DONE;
>  			dev_err(pch->dmac->ddma.dev, "%s:%d Bad Desc(%d)\n",
>  					__func__, __LINE__, desc->txd.cookie);
> -			tasklet_schedule(&pch->task);
> +			dmaengine_schedule_bh(&pch->chan);
>  		}
>  	}
>  }
>
> -static void pl330_tasklet(struct tasklet_struct *t)
> +static void pl330_tasklet(struct dma_chan *chan)
>  {
> -	struct dma_pl330_chan *pch = from_tasklet(pch, t, task);
> +	struct dma_pl330_chan *pch = container_of(chan, struct dma_pl330_chan,
> +						  chan);
>  	struct dma_pl330_desc *desc, *_dt;
>  	unsigned long flags;
>  	bool power_down = false;
> @@ -2173,7 +2171,7 @@ static int pl330_alloc_chan_resources(struct dma_chan *chan)
>  		return -ENOMEM;
>  	}
>
> -	tasklet_setup(&pch->task, pl330_tasklet);
> +	dmaengine_init_bh(&pch->chan, pl330_tasklet);
>
>  	spin_unlock_irqrestore(&pl330->lock, flags);
>
> @@ -2354,7 +2352,7 @@ static void pl330_free_chan_resources(struct dma_chan *chan)
>  	struct pl330_dmac *pl330 = pch->dmac;
>  	unsigned long flags;
>
> -	tasklet_kill(&pch->task);
> +	dmaengine_kill_bh(&pch->chan);
>
>  	pm_runtime_get_sync(pch->dmac->ddma.dev);
>  	spin_lock_irqsave(&pl330->lock, flags);
> @@ -2490,7 +2488,7 @@ static void pl330_issue_pending(struct dma_chan *chan)
>  	list_splice_tail_init(&pch->submitted_list, &pch->work_list);
>  	spin_unlock_irqrestore(&pch->lock, flags);
>
> -	pl330_tasklet(&pch->task);
> +	pl330_tasklet(&pch->chan);
>  }
>
>  /*
> --
> 2.43.0
>
