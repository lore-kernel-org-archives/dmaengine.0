Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012054.outbound.protection.outlook.com [52.101.66.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C2B441625;
	Wed,  2 Sep 2026 14:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360298; cv=fail; b=tYbbTf3sqVpe1gbz9Qvizh1kvhhv98oBwaLEoe/E/Y4Se6Zrz1csMmwGqxNOQrNRLVugUced00WX4DXtu3c17sNDo4BuThjdkln58LHba1oXrkqKINtxdcyjjHOYzVEx5fSS7tovwtgY1WR69hvLeIMyfJ7N4cQImVCCo3OtwkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360298; c=relaxed/simple;
	bh=OCeMu39qs3rrz3r3A6n4bv44UgfmxCziINBAKX0Bc6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a5LjTtc5o2uKNkekFruOJr2ySfJiZErJV+qRkMOcV6WB0jj8LO3OCQ7LUAJr/bWxsYurGS84Qp6S15fTQCqn+pPC+dObH/oj3S0NhW/oudx6L5/Bq5qZhGZKQ7wB7wt0Irx1w14vmnyrgp23V7GtonLVHacsvmVi6N0ECDPU8W4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YkShTA2t; arc=fail smtp.client-ip=52.101.66.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YkShTA2t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gkG73uEuXMDPdiUIT51drOVFSFYhx7d5ZXDkr165tx8K7sTj9SBxhAUF6SbLMilX3YW6sjRyWfOdNNuAxwtiuN4Uu69uVnsbmwPPYK7ZklcDNC1fna/JhqN1fIpeajscX2N96/Q2HolH2lMWr70vFEhnB82KFajZTk+wtOKdT1KghVDWDxhWefvvc7S39Gj0KHJMkGpDT+kjNdLUXbwuro9u2vmRRtRtXc2JRudOu7J8sMpSbbf6iNwY22l7u8pzLtsXrrBGOFsSd3pA2ES6C0TglodI3rMOks9UyjNaf74aqh2ui7WRbH/FrhamOVjtYGTer/rVk50Zu4EaDlSIFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYQdR2TvZ86uouDjdBjv9SfrXcfb2eOzhigrCE0dXyA=;
 b=wf8LOtJyVJVpjqP0yHrdziS1h4zhiVq6W7K2+2gn2PJLaDROyoJH4/cclVdEt3pl0+MlPXsCIKeMEjInGfeS2a+//kVaHj018vfZ7+k/f5k7qm21QyL+qeuNkfhUAcCOaqsYXqZj/7NTrLpP7hvrUtggS0l8ey3Vu+sIsDew/3pl0+H7JOewvr2GM3+o2JLRyqC0V9OeogzMrdonlB0sw+/zocO6jmUmj0ABj1sau0p2rR+ktVmMi39n5JB5u2soQlutzxiNgStufZv4VFCkxGKVsAJAk4Bs125OWvcAFSM8HoWl+pArnLp/lAV0I0xoRtLVDXa7OJZjlrh32uR8jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYQdR2TvZ86uouDjdBjv9SfrXcfb2eOzhigrCE0dXyA=;
 b=YkShTA2trlx+I4XH7bZeHf8d6NXOwwW1v8ZF62StSdy6edblRdAbXTemONQB3c/SgwPxrs6Mhj2BH+gIS9jTIbqxIc9xB7v6hM6iBE7Kihal+9u4J1weEtLmvMNGvkkAaGIJLFlU0lzTJD6ywt0SN4q3GFv76AnhGvdlAZ+Wv4PrCeuwQMNn49gdG77Vf2wrv+0BdDYk90LiXAYim4v5E0VN7ny3NAFvzfIDeC/msVxdK5Abn8XDtGgD8wKVJ0eF6NiKxIJz4UwXkn5sFPnnuLH3VEkmpnWEnrGb6PE2ZGowpWZUk3I+mZHf1ENLl6Tr3EN3PP2qmUl82GvjKYza0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMZPR04MB527544.eurprd04.prod.outlook.com (2603:10a6:20b:7c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 14:44:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 14:44:54 +0000
Date: Wed, 2 Sep 2026 10:44:47 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH v3 27/34] dmaengine: plx_dma: use channel BH helpers
Message-ID: <apg2Xxqbvo0A_ZZO@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <9b931c21648cdee0e5db08642861b532b6b040d5.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b931c21648cdee0e5db08642861b532b6b040d5.1786384169.git.allen.lkml@gmail.com>
X-ClientProxiedBy: CY5PR20CA0005.namprd20.prod.outlook.com
 (2603:10b6:930:3::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMZPR04MB527544:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d6b19c3-f6f9-456a-228a-08df0900c090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|23010399003|366016|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sM0JS3Q0yPOHwRLSsLsdbpH2NjFi42W7l8WIQxVecLjff60nd9RMpAooCMHI4WmRhaIeij5svUwvsj32CzGwhD699KlUgPmbiNyoh2TvGb4jZxihE4yQ+Hws2/aHc68BcLlYZDSkIUFzX2ILLRYYWryie2F36TKIWH5tnSKFEp5dvorVqc0wCzolysAh/Xla3QruLiMRZBS4IlACW6DIyQKtLtRNsJUfHoFpFCH2DxMY6GRLsytgEd8XSfGes5l3SCPKZvuF+r623+DJ0+9Kd7Gkfqmhs4o+3c28yycMoT/Bk6+7rcw/fPPzV0OHNrkjadfl/zZ4idpLpxUHxHNnP5OFrzJ3xLXGQTsUBRhJ1uzNI3cg1kx1EJC+GhfYRnZRDYfkjx6ol1eBLQ18TB3tSN6c595AtLCL41Wlrq04bgP5XGHN7h8E468sC6mdw/Q/Op7PStVJzIw1X8DnJetp0LP+OpTX8t+QIeurVBcxEgny6wQOs6DZODBmzkNHfnN3uoDVoz3zcHO2WcPiXipBVQHaDIDoHWRQKUVGgPoVEV1mJ9ybpsd6N0VkyVw0TWVS43BCwxVU2z7bxxeQg6hc3CW85AgdEL3URtPn2GGtsEMbJyOPNHQ8rAQgtFhSk/HDIi6cihGhlSCpFvZQRcreiE806/+N2JG+dlrQOG1EJ78=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(23010399003)(366016)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UtdhzomT/PLevkgnISCTis+Ivbly59kHxs9CNbvaV7wOn9jn+h4Qb9wg0omK?=
 =?us-ascii?Q?1STTKgLc927cx5jRb6a0KwP1ySM90Gvy3sC2ezxeX7V78EutxLO5cL9/HW6f?=
 =?us-ascii?Q?K1sM+mAsBCOhKoJkDmKIT7xf3xp01IzA4kzuS935MTDs4TFlOSIiX2BjSHzs?=
 =?us-ascii?Q?mjeGgyo9D2qG/smKlGCMsy/1RdQamoyI4zBBwsigEvCe1rJmxoNkCiGh/ngt?=
 =?us-ascii?Q?XtNM7YWoE94FFbs0Zc/2jyhxEdKWsa3ScRBJQ5yJcbbT9Sfvw0oXzhBldz+0?=
 =?us-ascii?Q?Bv6p8nWT7PE1pBtVZNe0iGBlinvcBFpxxXf4CZyZjEQZ27EQxfCyNUooaNsP?=
 =?us-ascii?Q?N2PhW5kYw+ztyNeNMsdzATsnACdNs5Ww4aJLiLIzKlz7GCsmAR/1uHlu3ZAh?=
 =?us-ascii?Q?okDmxKAxZQ3edWg6kuhONhpvjxADdwG9SPp3Pb6Ijtq4SeYz8Gu7+uXlbwB7?=
 =?us-ascii?Q?NQkSuiGXwRtjZwDtn9owchsPHRah6TGcgEX3LAKrA4C/ZHCxIGMr9t3VOXbk?=
 =?us-ascii?Q?xk+E0J+hcsXmOIPLEPOvxN6g347tSSi+ZaKHI7715Gbatdtza7cpzs8K7nHb?=
 =?us-ascii?Q?jwzrcVi6UCSJCiFYMKuYZOMED37aTxcXoWlM1JiGH5Jqa6f2dLczkcgzUi4X?=
 =?us-ascii?Q?ZuN7ZFTQpUh2DLqwgF0v0e3bYUGGHasVNficV/zhBzcFSnXw8PHSVFqy/e3K?=
 =?us-ascii?Q?UTKRu5IoQVFY2FVG9+o5jRjoDM3YMW6zqpwxRlVvX8q8f65AVYLGg0tLDybJ?=
 =?us-ascii?Q?PJo2Z1pFe2YIIa04S5JYhbNfwCBFplO1kHmQ+xtPCYxj63NO2wBE3necQ7j3?=
 =?us-ascii?Q?Y2R11uLDMgtxCb2J2BbXPnWSNCXe8kcyzxY2XG1Cjg3FHhz5IsvFHTqcaDgL?=
 =?us-ascii?Q?mpRfp336LhK8pWSRFnmU9W/Rm3HJG/KWQqLotKfESy2Eqs4d3THgbwAEvHrt?=
 =?us-ascii?Q?H2BwP5MNBmG7GE7l61De0JlDyETj2okNBmiCliJnWNBEWxn4zpUHWvnpG35U?=
 =?us-ascii?Q?7icuOauSe1IZKlZdDMWNxoosomkaDOK41q4h8vcLgdCQTjKIyWNBBiTyktCD?=
 =?us-ascii?Q?6pLZgNmawl3jXY/Yc+4gYEPTX+N+Arrv/HdTBAc4TsOHjUKlhN4Vq11DPv40?=
 =?us-ascii?Q?8sNpkuaUkZ2UvQq8e/9CChWTNEnhK7xi/Za4IN8Hx4qbV4TM20EiNDqTPWLm?=
 =?us-ascii?Q?NXvVSL0IEcFkw+t0zITVBomsf093V2x0oux5xGMYjdmQ2CKUi41WvGhyhBbb?=
 =?us-ascii?Q?hqVE0TpZZSeq1lIJclf2FK5i+lxS2YWLYW4w609h9UH3eefyzOSDUnYwPYcN?=
 =?us-ascii?Q?QVmvFTJNrGl0ycbrsCXvVvjebhbSouH/A8AziUHQi/thVfG+cRiauzxThG0R?=
 =?us-ascii?Q?vGXzGTL3sEa+MrmlX4CxNwSc70+VixqrVKsiTsTCApF47Ka7pnUPt+x2LnpC?=
 =?us-ascii?Q?xeZJs6O5X/Kp9G7TOGQ5BnkvRQfjwJR7+piQWF8ooP/tEgUN7gJap/RI8M2g?=
 =?us-ascii?Q?uwwKrhqnHgMBvnlF4SojeZcr7Nk/YQ9k9FPgo7U9+2Dr92PScH5TNMr4h8WX?=
 =?us-ascii?Q?ch2zRTuxCmY3JRN2wl+OsZ2DM+EsntPTCKlsPJaQKZAywEiOE6mn4uGBH2w3?=
 =?us-ascii?Q?IKsxfegu3KQlTzJr0crAZqFmfs3CdEFjXGSRAbFtcuTB3wdZwBnMuaYXgxIK?=
 =?us-ascii?Q?Zi8Lw4k+NW47WbpELmP0GJzrxADy/tdjDRo9GoQFfTMXX43jH/FFGi04P4KY?=
 =?us-ascii?Q?oxxNhiO8f4oTOgLftMniL3DAVdMqKWu41ms0WQ2FxSK52xiVxUrj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6b19c3-f6f9-456a-228a-08df0900c090
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 14:44:54.8174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UsDffVMoLoVM0r8zbsUb/yAydjnLAntep+o/MLgY5BToIr5nYWXdzcowKkgOsrlGMSWufVD2rMNKL5PbOLm0OOjD6vLluA8G1pZfGX90W+n/Vp2722V9Kp1GNsH8lAEx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMZPR04MB527544

On Mon, Aug 10, 2026 at 11:09:28AM -0700, Allen Pais wrote:
> Replace the device tasklet with the per-channel BH helper so completion
> callbacks run via dmaengine_*_bh.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/plx_dma.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
> index 84941a918b01..a9a798c54ef1 100644
> --- a/drivers/dma/plx_dma.c
> +++ b/drivers/dma/plx_dma.c
> @@ -105,7 +105,6 @@ struct plx_dma_dev {
>  	struct dma_chan dma_chan;
>  	struct pci_dev __rcu *pdev;
>  	void __iomem *bar;
> -	struct tasklet_struct desc_task;
>
>  	spinlock_t ring_lock;
>  	bool ring_active;
> @@ -241,9 +240,10 @@ static void plx_dma_stop(struct plx_dma_dev *plxdev)
>  	rcu_read_unlock();
>  }
>
> -static void plx_dma_desc_task(struct tasklet_struct *t)
> +static void plx_dma_desc_task(struct dma_chan *chan)
>  {
> -	struct plx_dma_dev *plxdev = from_tasklet(plxdev, t, desc_task);
> +	struct plx_dma_dev *plxdev = container_of(chan, struct plx_dma_dev,
> +						  dma_chan);
>
>  	plx_dma_process_desc(plxdev);
>  }
> @@ -366,7 +366,7 @@ static irqreturn_t plx_dma_isr(int irq, void *devid)
>  		return IRQ_NONE;
>
>  	if (status & PLX_REG_INTR_STATUS_DESC_DONE && plxdev->ring_active)
> -		tasklet_schedule(&plxdev->desc_task);
> +		dmaengine_schedule_bh(&plxdev->dma_chan);
>
>  	writew(status, plxdev->bar + PLX_REG_INTR_STATUS);
>
> @@ -471,7 +471,7 @@ static void plx_dma_free_chan_resources(struct dma_chan *chan)
>  	if (irq > 0)
>  		synchronize_irq(irq);
>
> -	tasklet_kill(&plxdev->desc_task);
> +	dmaengine_kill_bh(&plxdev->dma_chan);
>
>  	plx_dma_abort_desc(plxdev);
>
> @@ -510,7 +510,7 @@ static int plx_dma_create(struct pci_dev *pdev)
>  		goto free_plx;
>
>  	spin_lock_init(&plxdev->ring_lock);
> -	tasklet_setup(&plxdev->desc_task, plx_dma_desc_task);
> +	dmaengine_init_bh(&plxdev->dma_chan, plx_dma_desc_task);
>
>  	RCU_INIT_POINTER(plxdev->pdev, pdev);
>  	plxdev->bar = pcim_iomap_table(pdev)[0];
> --
> 2.43.0
>
