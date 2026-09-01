Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010015.outbound.protection.outlook.com [52.101.84.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A55389107;
	Tue,  1 Sep 2026 22:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301890; cv=fail; b=CcU5PZQ7nb/s3Dr9YxQXJ3kC+7kW2o7r6LX3EhBSSUjxRlnnz1yWotNIzC6Ao3VUWsHwxz8iXqizOOhGWaqheIF8ohh20kY5v4atoxj6C5Hj401vkt70JmlN+uRucFPdQnmRZa4CG7tG1PuO4thZmOuhCQfU53UbJybSsVC0MGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301890; c=relaxed/simple;
	bh=XAdT8ZqULpG1uUpcp8w/DjvwDCkSA81sTKmuYYrKnQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DNCC97+Zs2adhjipSUFO4LZpxSSaHMnP6SW/DuTOnnNIwqFGyHqV54Q28loReIU4j6CtlXEc5clXb8vxTNJgA8Un5jdpyNvTvqCLblGi7d2NZaIwHAlHvWDjQBVfVTw21CKhlXLax2vpvG4j8i6CBwBXm2FK8n2S4/QkM8i/AqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eLARq1Pb; arc=fail smtp.client-ip=52.101.84.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eLARq1Pb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UA8ZB8Ql1BXet9oG9wwZQ8B/0ZvStgMNc5wTmuqjNijNTGfivSx/6yDVUzYICqtmU33i4W5+BvwFEsT87ef5FM90Irxcl8sgqmlQGrVPPqhge5pZRvoROd/xREngSot70u2QETzQJMRYhXzW+UraehvwVR6IMQfVRkDym8TqkTBpAX/O527F8CCBhgvP3tyl+gcIBZBJpTPimqnxszPj6R7EonjyCZI2nNHRNc35ZuURzqTFSrrbNju56xXJuAVXacO9GIhk+dcRIXuSWMp97R4zclHu7B1vVcZX6EXjwBudBaRizJVPtdGB92sZKLJZE0Mm+2rLpAyPjoDw07kElQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZreOuAjxaR783bB1O9ixrcTsN6gOsMbnUR8BZpfbig=;
 b=wIlBUK2rhY8Di21Ef8IaavqXGasVwe78kIUhMFuQ5lIRNTdXFwDIzVCazfJN7oCSg2dpl3I+kPJ0+rf3oyNGwuq0anwu85RI3xvmZCAaWTLvgmDBq2ajITuUz7XKmFTJEcLeeTM5lu4Fg0po2m6tqcrtwfCH6C29euUFGtJVK/dMhCbyfVNH+y/kBXVyW7kl9Gua0SxBOkv826u+f/S5Cmv7k3JV/VqjA2nGxgOSgf/8fs56WClfVM2r+s5sK/QLqmyzqN399t+d4NHkYPx52iJAyPPU8jjWRvS6hCqeS7QwEk5+fDlV4NewWfsLluLSKVpSNhyQMWMO6QRPoiP/zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZreOuAjxaR783bB1O9ixrcTsN6gOsMbnUR8BZpfbig=;
 b=eLARq1PbafLCYqR3eE/okhoOYWk5j+krFrFT9anlQslBHSHjEznwcyxksmgCrsKCxWBuvq8reqmyyKubWxICJXuqCMU6rlRmblld6QLvNZtFKJ4vv3qNkyUdnzCa1EwQv0amZnNIpzva7XAxYNxMPRVUWSE1epdfYUh/QeNLcETWc8N/iFgnoJEt9NsXy9EeUsdS7g4YZWFqfWEjk5exdtxpxx9cCoRh3uKIeK2LRH7Fvlj6PHQmCFyOmprD+v8adUVunf4nj9RcN4nzdWSgmjPeOqnn6nyT5MCKQC1l5hFqcr88Qo2wywz4GDNrVdTDjna2x3hJ2aX3iDQSCltZDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11861.eurprd04.prod.outlook.com (2603:10a6:150:2f7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 22:31:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 22:31:21 +0000
Date: Tue, 1 Sep 2026 18:31:14 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Olivier Dautricourt <olivierdautricourt@gmail.com>,
	Stefan Roese <sr@denx.de>
Subject: Re: [PATCH v3 30/34] dmaengine: altera-msgdma: use channel BH helpers
Message-ID: <apdSMkd3R5azjO5F@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <21c92aefc28557597024ee450f1690761ba6d452.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21c92aefc28557597024ee450f1690761ba6d452.1786384169.git.allen.lkml@gmail.com>
X-ClientProxiedBy: PH8P220CA0034.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11861:EE_
X-MS-Office365-Filtering-Correlation-Id: f08b5362-6bbd-4d12-9b79-08df0878bfd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jNyT+d/E6EYWEioEbhFlbfTMUIxyo9je9A+Ig03fbHy3EJSyXy61ESryBqDRdyZ8U7zZR4yiXn820ehT9Jyo5WHFMjeIXNHXdbNv/5Wj6P2w7lz8U/Q36nQnnzX4CWL8bSezSNo7zWKnF+Um13mJTsKAkMtYCwdyOXqkS1H1+5nSmcN+RmquxKtjHHQpeKLMy/J+0OS2y2ltwhARryNcZk696CQvHHsmuBuueq8KY7ga87JjVaaWtCfrfWpjqKdvfiQ6D/ymXMUhvGyo7nIks1Z+uA3nSQFesok/HGgKhVEou0yZXihHE7cpYqj89F8AMsl5TitDy/7m+UPSlzuOyUU4MbZQD0dp2NftfUt67EbJXN4XfKxu4BPg5WrVVQtK6wDKY9ZVf14SGlqjdlvqMZ2Vy003xr+1eArll7+tfTlHGrqidQo7HKhsXYYQ5jaG14f0nfIK3qVb3jAuX4Bl1sForc8gZRklFh/H0Vu0WwvkYPXvAT+WT9XtaYTkiAjxFkgKHLU+loLFeSEIIN+0StliTJHqaCZcnQeqN7V+CEzzblF4iZp6ZhMmGqhmXjg6lGKR4phoPwbi3MV00wQMg0vIZuwQ6yGgbPIeBFLF7dfIR33Y0brmW4bkR1X0LTBdUcI50Ph6/dssJs8nWTvCMTooqKYtMmoSPGZeAZJVxfc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bboM671Nfa0LbYZoGNLzsxtXTEWDrC6v4De1GATRNgBJ/5OrAL1PLL5YsqEI?=
 =?us-ascii?Q?9wBWbVrucyCZqcoaKwSvvEDaRZU8PQzm+9pYK9tDHhUGRjGTNL8jCF/V1B9b?=
 =?us-ascii?Q?+M7X/mE1qa/yjxFOAuGMv7d3LcwS1nmTd+wVCdohviJeKD5SwbOW3ouTJaeO?=
 =?us-ascii?Q?skdu5uMmvmEwX7LZ0B0ZCwdHuPYRdT6sSp/d7ew3Ecq2ijfOCW1jO7pPu29g?=
 =?us-ascii?Q?WXWoc2JMXZCPLo7nu2Pb0kVCGvigYLOVQTfpUIof+8xadWSQqd1FdSejnL8Y?=
 =?us-ascii?Q?QlPO3/KCDXptckp+Zl+j3XuQGIFHxp2JyCGDu9Y0R1viGlf499qwSqqcV1ZE?=
 =?us-ascii?Q?bEvHawcRwGH61OhhGfouObho3I3RTY+IZtl4dzEXWmuMmFCIFmH7vG9o65Q/?=
 =?us-ascii?Q?pMszvWF3UG7pg/HnkgsNaN5wlj65dhptxEmr2/z97kysnr2m/nhJO1sY+AUK?=
 =?us-ascii?Q?dDxacAfvbhc7SFeJ3zzGamqTRppTffkKMhPsWwGD2xu9cxL98YMZO6/4NowV?=
 =?us-ascii?Q?4Xp7DYq7AZQPpi9tyq6CBUraGVqdqkSD+GUkkwOkoqyZgeuTKwzvYL5ck88Y?=
 =?us-ascii?Q?5bwACZfUMlc6VmynnT7j6eAoq2jgsRo9/vxDy7/FqIUUHnPn0CA3JC79Dzb3?=
 =?us-ascii?Q?Z6FWwK4A0Gu49Zt+GCIsW2nMxQbvZul2MvBVLFcgme9qf+GQ6jIOC7m+bATz?=
 =?us-ascii?Q?4N4o5pB2i6zl/ZWSOSpDfHQ4cibr9VjFLtqN5m9skA176/C2fLlnj1nosDBI?=
 =?us-ascii?Q?fMOu1jLjfgG/smFpZB+9ZI097AhQYmYcXzkwUlh4amKDQjyDPKguSNiSisai?=
 =?us-ascii?Q?6ObdMGqieRPTlVJcvRqfdAz9sh/xpdOAKaANSB+2IFgruCrPShx3tMi16aX0?=
 =?us-ascii?Q?qIPkPvecAiiwcIIL6JehcAqtsfACL4kr34FDuL6O91y8t5zLgkIuDiEYBUhP?=
 =?us-ascii?Q?h1aai9BvjthuDQ9aQxeqPMbJOoLg/asZr4FFHkee7drTWVr1xn+kD1m0xcDo?=
 =?us-ascii?Q?tUz1UwsSOLYT3soUi2eb4YagnlyNhaogTOza0wNUA9r/lhSIJbEycUIbIqXh?=
 =?us-ascii?Q?Yh+zuW7vzon+Up7itDe6AwQEEWd5C7OXXeT8o7uBLX6EoDGz+7nXw9CJfPw7?=
 =?us-ascii?Q?Eu6IV/kt666pCb6+LA4uFaKFpHP4XL5psJuevuMdnMJYWzUZ3S2HZFYbmxrz?=
 =?us-ascii?Q?FmmHFYivJk1O3xewhsgrqAg2RtXlHAbohIIQS/qNe88lpYHWazChI8jBoCYx?=
 =?us-ascii?Q?Xf7zXCbeCWGw/N7Qxt7NErR+HzCzceET4Rf+xmRm3bU5idaMQDMe7C93Luq1?=
 =?us-ascii?Q?pcubeHrH0HTNMmw0oRzPOBo4Fhmwv2hLqfG3HkeO4h626AOZlcJIEGPiV+7p?=
 =?us-ascii?Q?DPeWxhSIBJ3zqrvB3Lg0jWGF3lcUk///Yn8eszvDadfaJaRX8ldzvfgcjWKE?=
 =?us-ascii?Q?KkRjDE6dkRMyaUKDfatoWH0CDVmv8uqASSdX6+ktk/Ro8XrSrenjqTej/5XU?=
 =?us-ascii?Q?poKlZTZF8He5W/des97yk6hoLLoodSew2MggXbMGeQcb9aAxr/5RPe4kfJ/m?=
 =?us-ascii?Q?5pwMKPeId978kK4NcfdiZ3uDfwKw6vIAFIdjyjTdQknVJwln2rdYxDOue55Y?=
 =?us-ascii?Q?p49e7XBO3WqyNIcDJk+Pxr1kpzYDCIX6K8myYNo8tJM20wUI0evolQEUsrAn?=
 =?us-ascii?Q?JD0E4ZUGVXVKTYwzpkQb9mCdsr4leqkbBHGW6NJeC3jzJ8v+ksS1a38XVdsE?=
 =?us-ascii?Q?vJY0Upq4pvrCvQkWt1Z3bFSyNUcTbH6K6Iqmn4YjWE/UwMHXxPd/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f08b5362-6bbd-4d12-9b79-08df0878bfd9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 22:31:21.9015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgSU/eO3Pr2RzSt4eWGWfzASbTrj5ir0Lc3slj7KVkxGKBBUC2ILHzPnku4GsuYwRs0B3XlSvNWpfRm54yEaVkWQ55CLJ1oqEC6bYAB5Z67uaYeA7oaTTsTsFDWLjhtj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11861

On Mon, Aug 10, 2026 at 11:09:31AM -0700, Allen Pais wrote:
> Replace the device tasklet with the per-channel BH helper so completion
> handling runs via dmaengine_*_bh.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/altera-msgdma.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma/altera-msgdma.c b/drivers/dma/altera-msgdma.c
> index e23e5b441a24..c8e145cea6d2 100644
> --- a/drivers/dma/altera-msgdma.c
> +++ b/drivers/dma/altera-msgdma.c
> @@ -170,7 +170,6 @@ struct msgdma_sw_desc {
>  struct msgdma_device {
>  	spinlock_t lock;
>  	struct device *dev;
> -	struct tasklet_struct irq_tasklet;
>  	struct list_head pending_list;
>  	struct list_head free_list;
>  	struct list_head active_list;
> @@ -684,11 +683,12 @@ static int msgdma_alloc_chan_resources(struct dma_chan *dchan)
>
>  /**
>   * msgdma_tasklet - Schedule completion tasklet
> - * @t: Pointer to the Altera sSGDMA channel structure
> + * @chan: Pointer to the Altera sSGDMA channel structure
>   */
> -static void msgdma_tasklet(struct tasklet_struct *t)
> +static void msgdma_tasklet(struct dma_chan *chan)
>  {
> -	struct msgdma_device *mdev = from_tasklet(mdev, t, irq_tasklet);
> +	struct msgdma_device *mdev = container_of(chan, struct msgdma_device,
> +						  dmachan);
>  	u32 count;
>  	u32 __maybe_unused size;
>  	u32 __maybe_unused status;
> @@ -748,7 +748,7 @@ static irqreturn_t msgdma_irq_handler(int irq, void *data)
>  		spin_unlock(&mdev->lock);
>  	}
>
> -	tasklet_schedule(&mdev->irq_tasklet);
> +	dmaengine_schedule_bh(&mdev->dmachan);
>
>  	/* Clear interrupt in mSGDMA controller */
>  	iowrite32(MSGDMA_CSR_STAT_IRQ, mdev->csr + MSGDMA_CSR_STATUS);
> @@ -766,7 +766,7 @@ static void msgdma_dev_remove(struct msgdma_device *mdev)
>  		return;
>
>  	devm_free_irq(mdev->dev, mdev->irq, mdev);
> -	tasklet_kill(&mdev->irq_tasklet);
> +	dmaengine_kill_bh(&mdev->dmachan);
>  	list_del(&mdev->dmachan.device_node);
>  }
>
> @@ -852,7 +852,7 @@ static int msgdma_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>
> -	tasklet_setup(&mdev->irq_tasklet, msgdma_tasklet);
> +	dmaengine_init_bh(&mdev->dmachan, msgdma_tasklet);
>
>  	dma_cookie_init(&mdev->dmachan);
>
> --
> 2.43.0
>
