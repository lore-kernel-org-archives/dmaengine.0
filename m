Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013030.outbound.protection.outlook.com [52.101.83.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61424494821;
	Fri, 14 Aug 2026 18:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786731700; cv=fail; b=B62anQOjVQOjq99qTvMdcelvMPpYyDQ7OhlsZvHROYyfukOvZKwMYbsBY2QQukGH26jUNNb3kYG/9g+a1ipkDn7ZCegjJCknCRpmgHtumPVLWR3x7nSAwA1WaPl6E2jSzbB0Q1vm/19Adw+r+E4a1mVk50qExzACoQJgEV1TJTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786731700; c=relaxed/simple;
	bh=VALo5J/grQiTXAzLu05M5o4EANGqBmOQwgYkXeGLEY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BtZ3OHutpWndflmN08sfjgUiCCxqjP/Teg1anm+E8vFXhN7tD3X7t/M9cH1Ykroyx6Yn8Fq3QuNc8G3lXKllM/aKnJ0AwsCXZIZb3I1RhMOPDS61lYpGsPQeAzeKDyIVIoX9zJMWLSTHH5yK1lKA2i+kbAgnJ+0Uo7ipi1/1Rv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=URz9bRkc; arc=fail smtp.client-ip=52.101.83.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="URz9bRkc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e0UiCebbYbW1WJIyQe0Q9Yy7Ai+jKgJywejFkJC+Tg0DOVjAa0KMtD76yBpoZm6KVAol4beCVRFhQDjQEUfG7gpjWqbYdnRsLI8XWvfZoHHrLgCs6YdwWtyFTwOX6vYgByC6PeyzVEGksW6HKRgTfAgav5ZyqHTPowyuOBXmwPhhDC2d09B+7Lm4ZSVE3SC12/aJ6oLbkU1etBSRIv0aKv/rXnNoSsDp5EsW8qLZCPtGDF0SX0oHJF/3nnmUngBjlzK/+h1QlgXlAX2FkkHfSqH4GSIRknWJ782rhlGwdCPLKzZgFLr2zER8Uqahjd4eQx/LKHs5BethKEV/UNrl6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TccS7vtFjF83ovJqvdhyn56FhL/Sf2imqI8U2Bv3hq4=;
 b=XoR+I+YFjdKXUztTxVaw8HRxlLnpdFRXqun8MheO1KUemBKp0tObOdnootKkbVM2P1rwhHoLgCXybVccFyJx1M/MC3AxvS4deurCcf7Dqtq5C7hJ/1TLoV/6QvD5Y1vLdVb7NwKWFcqJnowDdfMkA2qRWNR/xVQLD/2lxoKE1a7NhwLm/oj4dB9vm8xtXBS/zNSLhKPdURsScFO9Af7FGHHEyrOSZVQyxjzv6Z9jss/zHVlF2jqfKC7+xYMfSdoz0QPBVDeYXavQNjbiMBJY+2QRXTst8gDkUkDMkYIMoDJMno/GHcUqvUd9F26LDJZ951zUbKM4cc4dB7AIxmSi1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TccS7vtFjF83ovJqvdhyn56FhL/Sf2imqI8U2Bv3hq4=;
 b=URz9bRkcTILYwrXqMW2/OwX8qcXroOkSehTn9xrA6QKES8FyOpYKv4yE6coz2DHG4wZKIv6AOe/w/gd4uArjd4GTzNm3BfI6Nf0VmCo88QPuCGQeoLRH4pQjZe41cAir6IdSx1Q7HeWbdcRhNYvNEanRQdAdBQNv4sgL0lQi2KYr0KVYV3f6jHcbZmvBLM2hu/EJ518pIGHDo0i8g1XD9WCYr4J2j871gH5z5Sd5ApZwGV+Xs8qxPx6dmDUNrMKv5AjWzJLXRf79uisMpFLXoY0fMOUVDcQVvN0IW7PRsKByXSFdCBTys6juYSuh3C9VYUq1qqDVA7aWMlMisNu5dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB7186.eurprd04.prod.outlook.com (2603:10a6:208:193::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Fri, 14 Aug
 2026 18:21:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 18:21:35 +0000
Date: Fri, 14 Aug 2026 13:21:26 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, michal.simek@amd.com,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH V2 3/8] dmaengine: zynqmp_dma: Fix chan probe/remove
 error handling
Message-ID: <an9cphTED65aN5u_@SMW015318>
References: <20260814045616.1661199-1-nagendra.golla@amd.com>
 <20260814045616.1661199-4-nagendra.golla@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814045616.1661199-4-nagendra.golla@amd.com>
X-ClientProxiedBy: PH2PEPF0000384F.namprd17.prod.outlook.com
 (2603:10b6:518:1::71) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB7186:EE_
X-MS-Office365-Filtering-Correlation-Id: fd90d50d-995f-4de4-21e9-08defa30df09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|23010399003|18002099003|22082099003|56012099006|4143699003|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	w3ECw5mzDK4FVWt92MFJdZPZNdnXsydF/DGb3iADRO9BHxdXwgzJ4jzY80+tlC/zUgnWT/4N+5efpH2mO8kh9YwnN+tF269U/QeQ60/ykHhcb4ewd+Od//hUc3+pju+lwfqxtDncLBvVl2ZAVSkdNK4CCORahm4JYCFKpS1/++ZfGPAkilZUl0UqdMt6vlQ6ij1QstTphe5G6RtQR+DqDoe+CpC7f7dAkejgeUYsSrP0AVsHR/1v+CSM0oPe3mwpcWCF/Gr9wByRqc10GRj0mIA5cO0gLgL7jzo8jYXWR1sp9qBqAsI0tWkxKnXmJGYQQf2OroowXlEo58ed9JK3A8lnJBDs/D4ySxJfJP9iHw7XTIxefoTfkux4omrw5yyyud/VSuwlRdZC5FhS3vajJVg6qc4A8cL2BPZLrZb03c91d37eRJX7Uq+xCALMUktDth5F5luefDgnhybv8N1qaVOSL+CfQ7xsVK4/NW85THHemisB6FEUkX9wWRpCcw3GWjM25qqKFBNwKLjeamrhu77R5xasZ0PIINCiP31o45YCdAzt9RBotL8z6AtxldGnX9ymnVCFqGIgHb+bPjN7/hX+XBPMP28JqUw+ALhQlIyGwntc4ElHe3/VXrOSqCsngvXTvFlLm7Z1hWbEaQvb8kpBVG5oMLawaBauq8QKtEM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(10067099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cciWLBTnwHhXiMXqyzWnKAv4yML3x4v0uQHZU88IENVrCs8eQDfQDg9qWCMP?=
 =?us-ascii?Q?Ms4ObTbLLneEkD1YPShi3GO+/dC9ZGY2WJveMguFjZ5vPfSz0BDfY4CZ1M5k?=
 =?us-ascii?Q?kms0SsDvwg/QjS/SJW+Z1wMBC6UBDN7pjC/xOLAhAGtSba4mXk362lvNBIph?=
 =?us-ascii?Q?hZxCZWtGTSkl2WeOt4CLPqXN3rQ+32T8NwIBfeRAsAjl5ZT++uGlqfwRxNZa?=
 =?us-ascii?Q?4hUO4+9sZk6EII6U9p7RiLULTcJvoiax5k370Vfpo0PzsnfJGKB5dD/U96qS?=
 =?us-ascii?Q?DtCRTvw9vVg+PHu0JEWoy1zygP78mcT/zd6pzXOKDFgWjKG7T3bJXA8r6hiz?=
 =?us-ascii?Q?8zDcGqYPDsDeLIqs4u7RH2m/kiqPlK/qeg1ku5wbVYExmSPUoUzJq6RMaVKc?=
 =?us-ascii?Q?dG0YDqDubLtBWoESU01B6t1nErzeXFUNK8QqLr8aOJRkDUipaFdYKHRcK1i3?=
 =?us-ascii?Q?0m38J10GBeoGp+n9uDimGNGTfYdy4mXJb/w/r7YP7iJu4s6H+Spf8KJC+gQB?=
 =?us-ascii?Q?jCLa2ljjAzjBGcgKKBc10EUk61tR+I08MiSMfxjOm+ZZpur+PviSP+nRVXTM?=
 =?us-ascii?Q?HdLmLLV/CemOUlwX5UhvYkTDJJQn1CBn7pwNoBeWrhgenZfaI3KFmE9oMYiX?=
 =?us-ascii?Q?A4npkMjnlZA2wNcT0w8tWS+Z9tcZlNuTz0E2iWwTrJrUyXFKTXc3c2CoaXJv?=
 =?us-ascii?Q?4EdLOxgJ/lv4kArUkkt1qeXSHir0LboBsoi+ryRZnxppN0NtCMUGRcxLvKcN?=
 =?us-ascii?Q?+EscbBusu3mRdmYm3tz5ZunfWMsui3Q2SqqCahCEpdWYhWMgto1Q7RE0uz/f?=
 =?us-ascii?Q?ZBk0jN8C9fnKS5kNiTlN9+ZbOnlwTUermiBeWAlQfbjRAUTa6ovKCy92Tu8l?=
 =?us-ascii?Q?81GtaTxSE5RxcWAu3pwjaL+c2HS2Bkzjp223g9wI33xGvdAQRJYsroFCPKam?=
 =?us-ascii?Q?vAi7QYVlyS0UxqSBWymIcQImcjF/0ehT9iT0Icpy1gAEiKGcT+sjOF+Ub+Fd?=
 =?us-ascii?Q?QT/ZNv9ZjjwcMI12rjSRjMhXHjzkKVnkZnozQzTNAeg6/V3z16IcGj3nzf8f?=
 =?us-ascii?Q?4zVpcym16smW2DWqe1FLe5jiQWXi0kHDWnxiL8fNryzcIdaSvuevGnx1mjhk?=
 =?us-ascii?Q?FUC+0X5IKfgyvai7I7avlWz8CxQneh8AWddwI0tYKPbblyFWfnAZdm/MeZ8Q?=
 =?us-ascii?Q?kvWDTRwYsk8IgldI51A6vG4GhpWyTuW62y/pNn/e22PhqThEa5pu039sn3Ce?=
 =?us-ascii?Q?w9rur51Zknz2lp9x7/HJMbhe+tRwCqBJCeUsL8CqljbYOBeZWJa3veKmc1RB?=
 =?us-ascii?Q?2FRmAJnuxA9BN64/6K3qqEyw/Dx15BxjCzWnuFaItthWfs+hx/fh4KPllOd9?=
 =?us-ascii?Q?7GUSmxdGJOT57VP36EhUhdCi9KBzD4DAs4ivK0TXGLHoKbQ/Wjq7xxMl+mbu?=
 =?us-ascii?Q?UHCyI2akAU8n4XHAv0l4auHi4nTxnzSLNdPBywe/nX7U6rV5UzTQnV55Ju0h?=
 =?us-ascii?Q?Dna4WAz6Dxu+PhJwI5VNnCVY1FxvJdKzJ9Ed8upor53nDoLutbyIguJbNKKt?=
 =?us-ascii?Q?HWuuTB/28xdgE8gRs515piLsv4fhtH3Qn8JhFxYzsW7jfCszS5J0O/z/OZDJ?=
 =?us-ascii?Q?KIkSSjILGelxtarnoTMmUHsj2cpEaySxCOwqFkbBbSvBIvbUgtcwgT2bE0Ri?=
 =?us-ascii?Q?m1KWCAzgASsZIcvOkTq786gQ71MQ/IVTmuBDuYLhlXVz0xjUhjF9ZDkLSeFf?=
 =?us-ascii?Q?qwRo2TclydFV7LPH+IGRgbhreB+mpTHelyew3GdyMcncGwgaDNGP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd90d50d-995f-4de4-21e9-08defa30df09
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 18:21:35.0919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNS5miciUj/ZpEHPjP8lRd/hQQ3pUriPPvL7W/DhnUia/hrNc18uw99GDYiAwA2IcZRRAA5FbH2YFvyzOPsbbH0iH6yal5oTQpV0AldD0JLAv6yYfsCZnQnv8FMg8cPO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7186

On Fri, Aug 14, 2026 at 10:26:11AM +0530, Golla Nagendra wrote:
> Keep the real platform_get_irq() error by returning ret directly, stage
> IRQ setup via a local ret variable, and assign chan->irq only after
> devm_request_irq() succeeds.
>
> Initialize chan->irq to -1 and initialize chan->common.device_node
> before it may be touched by teardown. In channel remove, free IRQ only
> for valid IRQ numbers and delete the channel node only when it is linked.
>
> Register the channel node only after successful IRQ setup. On channel
> probe failure in zynqmp_dma_probe(), route cleanup through the existing
> free_chan_resources teardown path.
>
> Fixes: b0cc417c1637 ("dmaengine: Add Xilinx zynqmp dma engine driver support")
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> changes in v2:
> - Reworked probe failure cleanup to use the existing free_chan_resources teardown path instead of adding direct tasklet kill in the outer probe failure block
> - Kept IRQ/list initialization and channel registration ordering fixes in this patch
> ---
>  drivers/dma/xilinx/zynqmp_dma.c | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
> index b7c561280694..22b517c57003 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -205,7 +205,7 @@ struct zynqmp_dma_desc_sw {
>   * @desc_pool_p: Physical allocated descriptor base
>   * @desc_free_cnt: Descriptor available count
>   * @dev: The dma device
> - * @irq: Channel IRQ
> + * @irq: Linux IRQ number, or -1 when not registered
>   * @is_dmacoherent: Tells whether dma operations are coherent or not
>   * @tasklet: Cleanup work after irq
>   * @idle : Channel status;
> @@ -896,10 +896,11 @@ static void zynqmp_dma_chan_remove(struct zynqmp_dma_chan *chan)
>  	if (!chan)
>  		return;
>
> -	if (chan->irq)
> +	if (chan->irq >= 0)
>  		devm_free_irq(chan->zdev->dev, chan->irq, chan);
>  	tasklet_kill(&chan->tasklet);
> -	list_del(&chan->common.device_node);
> +	if (!list_empty(&chan->common.device_node))
> +		list_del(&chan->common.device_node);
>  }
>
>  /**
> @@ -915,13 +916,14 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
>  	struct zynqmp_dma_chan *chan;
>  	struct device_node *node = pdev->dev.of_node;
>  	const struct zynqmp_dma_config *match_data;
> -	int err;
> +	int err, ret;
>
>  	chan = devm_kzalloc(zdev->dev, sizeof(*chan), GFP_KERNEL);
>  	if (!chan)
>  		return -ENOMEM;
>  	chan->dev = zdev->dev;
>  	chan->zdev = zdev;
> +	chan->irq = -1;
>
>  	chan->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(chan->regs))
> @@ -954,22 +956,26 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
>  	INIT_LIST_HEAD(&chan->pending_list);
>  	INIT_LIST_HEAD(&chan->done_list);
>  	INIT_LIST_HEAD(&chan->free_list);
> +	INIT_LIST_HEAD(&chan->common.device_node);
>
>  	dma_cookie_init(&chan->common);
>  	chan->common.device = &zdev->common;
> -	list_add_tail(&chan->common.device_node, &zdev->common.channels);
> -
>  	zynqmp_dma_init(chan);
> -	chan->irq = platform_get_irq(pdev, 0);
> -	if (chan->irq < 0)
> -		return -ENXIO;
> -	err = devm_request_irq(&pdev->dev, chan->irq, zynqmp_dma_irq_handler, 0,
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	err = devm_request_irq(&pdev->dev, ret, zynqmp_dma_irq_handler, 0,
>  			       "zynqmp-dma", chan);
>  	if (err)
>  		return err;
>
> +	chan->irq = ret;
> +
>  	chan->desc_size = sizeof(struct zynqmp_dma_desc_ll);
>  	chan->idle = true;
> +	list_add_tail(&chan->common.device_node, &zdev->common.channels);
> +
>  	return 0;
>  }
>
> @@ -1134,7 +1140,7 @@ static int zynqmp_dma_probe(struct platform_device *pdev)
>  	ret = zynqmp_dma_chan_probe(zdev, pdev);
>  	if (ret) {
>  		dev_err_probe(&pdev->dev, ret, "Probing channel failed\n");
> -		goto err_disable_pm;
> +		goto free_chan_resources;
>  	}
>
>  	p->dst_addr_widths = BIT(zdev->chan->bus_width / 8);
> --
> 2.44.4
>
