Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013024.outbound.protection.outlook.com [52.101.83.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D193E535FDF;
	Tue, 13 Oct 2026 20:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924115; cv=fail; b=V5MYMqPRyv6yYPzWTe1U0iLx+MWWI1HwCLyAUo0tQcehWU1PSfMzOKOGNceQkqyU7mxMPZFvaxQo/UtJFZmH6VpJZ+Z9wnog2KPfzzW5K1NVPqza4IBYKPtU4BJGCCmspDU63XQv/7Vjp5khm+HneCfotKClbyNS7Poa9RZJkHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924115; c=relaxed/simple;
	bh=wXT8VYWx88OBmBxkGtESJhjCqwQhKuKgxVdy+wER4AE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SbD6u4Dl3OErcBHVQ1gUW+9dsjruqbuWEWX3GROR4/I0RYvRYR3efzq1RTRrsa4N8hdpkUQxfzdcG4U9fg9e14FVdI4D7rqeSiOHjc1SxALbxRnlUoHWHO5wf/h3leZpJ7EVFuTybUnNNKwuI2mIO6yHMmWZDiHT8WB3SvcVHp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lh0YWXs8; arc=fail smtp.client-ip=52.101.83.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lh0YWXs8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfnjP33t65nBwfainexLA/OXo3ayA5Xzb/phRY3zP1pgthekCnB2laFFh4Rqb1wK17iL6Qjh9GQTWV0MPA5gPM7HjqbtCe6d+odkE/62pMlnZSv5r9H5LyK6HDyTv7WuTqmrZx40RC4YfEJxqAE+fBtGrjrGEBGeginFhpnKfVPX2NVJUv8Z0ieCboS6dYg4mTGAM9sfYeSrHqMUWp6bXaB1Sdw7IKEHNV2of40nFkSbrXF7AuWQ7OP9VdbrKQ0Zbb+OZkLqVIjFNaScVXnSG7Cuhbkzr6xvYAiy5XM1Pn5ubWuWFZMoaQmIR93wiJ/app9Ftrb+pYpJjU3JDBJD5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tT4DRGt7zYL4oQ5PVLKpHMOZhB9NI9ev44KruZVL7xQ=;
 b=DXtdjtfB9KjU6kTBsYuNyb2UvNlx66cwav5o2IHEQp+534zUPCvu/Z7f1LRW1v6j2xQ8FtzGOHo0+Wq21BBGwVHcv1AGqPVgNwi7bfL6+4gaiutKqDIKkhjHyRDch6nj8Ik1RKngGFTD/abFrITaCzrbjnsgV/e8qPpkC+dF6lr+bdnarCTSz/bGbg7qIbTc9pOXws5yo5nBK8qPXkpIvSh5kFXm4XPis8zbxC8QolQRknZQqdrNPvdVd139QdBpX3ftV+SUwU2XUDx+nogwZGPvg3nxqEwTUavIeGdl8NAv6mB7N4SUCnxjCDOz+cfFNRwrh/9N/0mPb7qU4Uyrtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tT4DRGt7zYL4oQ5PVLKpHMOZhB9NI9ev44KruZVL7xQ=;
 b=lh0YWXs89ULzr8HfAYklUZKZ6uxe5RC6/dEn48Gnw/5CGvfMkLeUp3mj28QKymXp/8N3PTL7htHeUUdGooJVl7dBtjFnKk4APoCnZZe8ZpN81JiE2kJ30rwf5Rsd/ov3UhLIIfEa8Nvau4mLq3yzUOPKKS6aVDwYhnfpDIPgggsbPH/hwVdufsfjW2QgwfyvTbzdRTiDKzLfK5I9rvVw08gVZsmGKRB49hwENIPc5Jvxa5tmY+okyJR7R3J3Hvc8nwaDDRp2NBoLTK8RXUp9F/d2ZWrjT/jg5U1hRSiY14tEP7QMtW5QgntJEttlSYS2YndPUEBH0d8nt2opYA3Slw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMDPR04MB11555.eurprd04.prod.outlook.com (2603:10a6:20b:71d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 20:41:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 20:41:48 +0000
Date: Tue, 13 Oct 2026 16:41:42 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: bestcomm: drop unneeded sram exports
Message-ID: <as6Xhp7ldXkA0CFh@lizhi-Precision-Tower-5810>
References: <20260915180919.8899-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915180919.8899-1-rosenp@gmail.com>
X-ClientProxiedBy: CY5P221CA0149.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:6a::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMDPR04MB11555:EE_
X-MS-Office365-Filtering-Correlation-Id: 54859678-bf37-44e3-0156-08df296a6761
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|56012099006|11063799006|261009223027099003|22082099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Z3UhDOFxRIV3G1RJ4qo6eAotAAxNlTi7Q9UEA6RKhFy6fHy8EONk/jOy3SPOjBG8xjVJl+vAtH3MwOfSSLCcpUgUFpdPJx03Bhic/Snh/yCucjL/HYX0khlmD5Q5G13WqrVj/sVkvGyHG0rOcE+0krlkz8cPHtRvqQSTdZHNW33nwyfUerglig7AIjtcUMN405FjWMF0aYW6uyjFsz99Rr1/WwJBbI2+UZIC570sSR5X7UED9TtbeVKIzksfcuuWh/wxoZEFtScnfllzIsCnunKnoZVv+1bOnlp3MW2b2WNf28DlSo1t9ypsFa2zwN15D3OMlXyHwMou4zpdjZv3mxmMTiJzRMNRp+P6R3Kk2kbpt7uLFiuju2QaLKkVXZm+YIL/TTv423EvY/44vqp+PvFWCnedfVHtxWLmoabcD85s1uyPrSPNBAPRM7+IeA0uanjT6BOgeI2PofyTzixqROYqAFk/5PNotECWI5ue0kvPJD+g+SDkHsd9mhu1Iv6NgXZ1VmcYavmyx6y5b0n1xgKy3D7KGKukmrQEhaZfLwE0NKq9RKqv0hvXKoegpXkKRyW1+hQ0R0wu/lz+nAjL+w7H6Ne97kzGO+NBN/MstLou9Av1qvX/3Cg9VMu552MUJoBFRwK8V1XSBROCQO/zbNbyq2KhKZxzSk7hmMBBJcE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(56012099006)(11063799006)(261009223027099003)(22082099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SA9cu5Ec8XR06T4t+LLoCiW3/cUgBDXMKMitF90qZlsNndUOnO4g54q9wwYb?=
 =?us-ascii?Q?EgLVlPflkeJ8cuSj5GtgN9UaH34u3mELs5RrR2g/69yR8IWSyQtz6gVZOj+9?=
 =?us-ascii?Q?SMZ+5wqD36Vh3cAL0pc03g43B7+jM3IMHQBvzOZvwXnAFYPQKdvEwDCGu2/6?=
 =?us-ascii?Q?ePjUvLfZNSFODwd+E4lFQGE6jmiFg/ZLIFilcSVaWy2Osrck/L3CBHgO0lT1?=
 =?us-ascii?Q?WcBTBr/P5q/nbFokA8v53ar7NjhBdy9ZFIycLtz67UiDxGAh9O2P9fps50d8?=
 =?us-ascii?Q?P4DRQ1/z02GHwSTKoCCIJ2tj8qXZi7V/ZeACApuG0FmH6u/YIKraoTbnt/C1?=
 =?us-ascii?Q?sgGwGRGTuzqma6BODlwYSmKcHIetp6H8cRQY/DwdomJpbLev9ciSESqp8kot?=
 =?us-ascii?Q?BxSGSQn3ecOfsPpJMuzlbfdcbHJd+9isHrwk6XQv+kkGL3petEPbrCUdbhQ0?=
 =?us-ascii?Q?wvua5vaLIgomXF6aMYCjQQgmjBfTkdoPUA5vtgYWU34E0DATCUGb52dFFoph?=
 =?us-ascii?Q?XNSmT3LFkKG3xy47VW2B9XSTfRNPJH/I5a02XmMs9ekdQ0c+UbJqQxuzf6qt?=
 =?us-ascii?Q?8k2gqGVN1+KlwCHs/md6yFYIc3xRaaxlUEZ7+/fs8QTG22NOZiGJeo7kxNHq?=
 =?us-ascii?Q?J+hMMKr4xMpW7EEMWOq3VXPDB7gGKypTY37ufs90wlE6zG2JywFp8d3Lhn7c?=
 =?us-ascii?Q?V/wYDFAQP7huGlLbrls4dvAjjbzb0+bXYCg5Mn/jNYurLnE/pFcs2c2BLqjt?=
 =?us-ascii?Q?x1MMgViQc1rgMHY/igzR9CRI4g1eO0f5tfJV+xXveiVouOHp7llfuHtfhNQS?=
 =?us-ascii?Q?161kaWor59kL4Bz8UKK6JWSGC76sFI50abpTkgtZU2Brq/PM2rBBQm/jAS9W?=
 =?us-ascii?Q?2nsa7+0TQJFV2gwR8KCNM+0Bha0X6BFb5RE2a4l3JTY0nYm8L2NF9SluAAJn?=
 =?us-ascii?Q?hfXvfEH+FVeQF2TxoNKFIMkOYI12sYhk9pDHvrjx+rPnpgWmHhoF2Tu76b28?=
 =?us-ascii?Q?OixQgCUjFCC7oJD4IZ9A6Jq41RGpPI7v3LhfL1sLNqmStnBAqJu67RjSguYC?=
 =?us-ascii?Q?PCUzmWUlSNwnS2Em/Rq2rp4aOoopq7xXv5EVdvUSf8lPGmBY2EgciClZINLO?=
 =?us-ascii?Q?c80WhGiOYRBbpmxKEDVX1tH5dvBUk3mp3F/rCDGsTiNYa3pNDgLjnXy2fskw?=
 =?us-ascii?Q?txn/SseH90/PQJVZbEBb+vzVcv/N7WdhZmCF4wqtUKbqmYX1X5pplCuVe7Bo?=
 =?us-ascii?Q?Z0cvnb9sEuPppciVXiJOSUMzf5b383r0GgB2Px9zwACHQN7kBxYnluLg4ax5?=
 =?us-ascii?Q?0VkBmN9WowHLDPqznSY/fUxIPvd9zieQFjZrfRkKsI5rl5vNvOKA1kr5wmj1?=
 =?us-ascii?Q?opVugLP2gK37MUbtsNHdFucelp2IyV6HgK2FUKxq8d+nrkVfThBIcPi17icN?=
 =?us-ascii?Q?L2MiFg1c64ALCCLt+c4BAM687BFkwi2VvKANrX6sKwWBgB3unYUcokNj/Vog?=
 =?us-ascii?Q?eVsZpWsPpLbQsT6U0z4OeuGTq9cR4cO1JFMpBqIMJLzNef6USNFYbXdbGOcg?=
 =?us-ascii?Q?K/E3twInNHFLIlgAmcZ/0cDF/hYJjK7eyI6mJdVzULX87lNEQEEQslYhFf4Q?=
 =?us-ascii?Q?pmevfdiZCrCqSX05kLD6hr49AbseZrZ1qJ6ixSjYSxG08xXa09Ac6NFn+H5O?=
 =?us-ascii?Q?OCvSPWRpGjRj4cMlg46auoC6COJS3tHepQX/lyH1Tpx9SyiwiSm4rt31qHRv?=
 =?us-ascii?Q?1FxtFBhBctWrvBgdb/g+09uKqHTKYWFyEG5RTdp8cRd9Al4DQjCb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54859678-bf37-44e3-0156-08df296a6761
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 20:41:48.8877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +eLJlWeju16GmEsAtKTdW+Y9AXlBBnn0luiKhPUo2tX6C+njU6l0YSc9TVP3AfXUJmI4vg3rXS9amuIE1oqa03sj3HX8+awH0eNLZNcEiTURX9taf6AQJdZ2+W2jyN/1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11555

On Tue, Sep 15, 2026 at 11:09:19AM -0700, Rosen Penev wrote:
> bcom_sram_init(), bcom_sram_cleanup(), bcom_sram_alloc() and
> bcom_sram_free() are only called from bestcomm.c, which is part of
> the same bestcomm-core module as sram.c.  Remove the now-pointless
> EXPORT_SYMBOL_GPL() statements; the functions stay non-static because
> they cross compilation units within the module.  bcom_sram itself
> remains exported for the inline helpers in sram.h.
>
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/bestcomm/sram.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/dma/bestcomm/sram.c b/drivers/dma/bestcomm/sram.c
> index 09ef5142c26c..d33e0f931682 100644
> --- a/drivers/dma/bestcomm/sram.c
> +++ b/drivers/dma/bestcomm/sram.c
> @@ -119,7 +119,6 @@ int bcom_sram_init(struct device_node *sram_node, char *owner)
>
>  	return rv;
>  }
> -EXPORT_SYMBOL_GPL(bcom_sram_init);
>
>  void bcom_sram_cleanup(void)
>  {
> @@ -132,7 +131,6 @@ void bcom_sram_cleanup(void)
>  		bcom_sram = NULL;
>  	}
>  }
> -EXPORT_SYMBOL_GPL(bcom_sram_cleanup);
>
>  void* bcom_sram_alloc(int size, int align, phys_addr_t *phys)
>  {
> @@ -148,7 +146,6 @@ void* bcom_sram_alloc(int size, int align, phys_addr_t *phys)
>  	*phys = bcom_sram->base_phys + offset;
>  	return bcom_sram->base_virt + offset;
>  }
> -EXPORT_SYMBOL_GPL(bcom_sram_alloc);
>
>  void bcom_sram_free(void *ptr)
>  {
> @@ -163,4 +160,3 @@ void bcom_sram_free(void *ptr)
>  	rh_free(bcom_sram->rh, offset);
>  	spin_unlock(&bcom_sram->lock);
>  }
> -EXPORT_SYMBOL_GPL(bcom_sram_free);
> --
> 2.55.0
>
