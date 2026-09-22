Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013057.outbound.protection.outlook.com [52.101.72.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831FE4A2A61;
	Tue, 22 Sep 2026 19:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790105880; cv=fail; b=J9R4ER7N2Wgv9t+kuBNceTRAf3rpb8umGrv11cZU2793oyMhbriPpkeRwOex/5Y6b2TcDiKi433fhrcPx5Rz1V91ybKXstUA9lRrYBWMTrq1EZesqhbsPuZdtu4k3pBP+00f8/wwmdmabDVFpjOItos8sXdh9z9CmZmC5QOFgNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790105880; c=relaxed/simple;
	bh=HiMGYWndUDy/kxmWszKu31SllzNZjrm28CUshMuoO38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=F/I5P+aPiRnMZoSiMxgrpUBo6JE5QmJAeRWcjNSqZlRNXTEXKh5qoGViS85eudNxW3J8B8BWasti9h/UAIX3srLYql1Wk/FLLiy5IloAPcYYqQR2Q9BB2OML5enA/UGxGGlMrFZb3dvJetakPPnQ6m0z3eydhv18A+nNppFjTBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XtnOe6Ez; arc=fail smtp.client-ip=52.101.72.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XtnOe6Ez"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fswpOGe6M3ham0ZDb0QQk36/Tuwf5VLV3ZauOdcJT2cvfDm/WIdSJ+butI4bXB2EN4b0TqLu/aTSHUyNkf/+RLQke/ufbmW/QfYjWE6KIuQspZb3/n1GjC/Mju0jiHstgDza0xTp1lzO32KqNVvL8sYHLlzpYAQtk+4Hu8FBgH+7gHVjKZCbTnE72qdFKDXKHm3SYbbW043f+i31f66+d0ZuulG/Ez7h7W8EG36CMJLqnDAokYHHYTUtVBJf4Vnz1Hil/4381WdJRk1dtTh8AJ+9z0Ij/qCv1bK2MilsGkHE1lV87Bo2bJrA/nCqLedYGbic6Y1sm6Xe2Wa6mfJC5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UeJdX+rnPqxXJ8i19Ts9Sknpyx1rXfqHBEvKc+2jwo=;
 b=t1xe+Xa33/nTbQAn3LheoC8D8aqUarhKnMN/GXkEboAUO/i0m0vgrsUILDd2yEYGYlweUvNe9tUvX4uJhuBHR6Y5oVQB1Ox5JczwU9YIZCuMq/zg4MEMO2B498ew9THNODaO/Sqm0oB4qV5CohP2iFeS025j6Gw8nfOf9tZoZd1ZOCdc8oMFTptdOhQfU7tlU8weswsHB8CaxJPb+x3NkDuvXjmcoEiWhs2fi9ntc7Vo95MnQQ7dNQa5Rc1wVNgk7LrS5jKwSYJLP4u0UUuZmXjFsKOmTQKm8uPhvuOyysq4SFrc1YknagW7M2R1ZvPubh7Hm6UozmURoay+JihE+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UeJdX+rnPqxXJ8i19Ts9Sknpyx1rXfqHBEvKc+2jwo=;
 b=XtnOe6EztwKZVbbfhSdu4q9DxGxyuwtm0IvScNUzGRRbl+J9vB5n+FwiujBi9rByO8V0ZqysD5E30kzMTz9jNAZY+X6cEz0P5VdLn9XFNx0HvdDAVt17MpuQySY40t0rZggiIh6YZQSfmOJWbUjpTzD/aTwcj9e0MKsoQCg2fvhZQIgaH2LjsicjWRdwGHKL7eqzwVn0kv69CAzF7k1jUG+oMARC9dNatUux1QbxfZLH4BN5XKMT7XVtbCt/CJLvHnRucR8I9CsmA0rwricfUm7cHhuRLWTQIDyRoHIemhp6sqUK0gy39Pkd3+cQvFNbaWySgmUGQSMl0IgLMue2ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB6883.eurprd04.prod.outlook.com (2603:10a6:208:17f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 19:37:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 19:37:53 +0000
Date: Tue, 22 Sep 2026 14:37:43 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v5 08/23] dmaengine: ste_dma40: Return IRQ_NONE without
 interrupt status
Message-ID: <arLZBzE25DrDC6jg@SMW015318>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
 <20260920-dma40-fixes-v5-8-5c55cd7f92f9@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920-dma40-fixes-v5-8-5c55cd7f92f9@kernel.org>
X-ClientProxiedBy: CY8PR11CA0039.namprd11.prod.outlook.com
 (2603:10b6:930:4a::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e99007a-e86d-4803-0376-08df18e0fe42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|23010399003|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pInttY8QEoU6jkeCfY1V9xE7SZ0zA/8l7lbFuvWO4j9ewCzJKBlb6/qzalvUX9c6Hm91xrUzvOyEhZ55muF1+XzFSQwoM4jaGY20mb8VJmnugERa5eC5q9AVOB/c5nBX9zBby77K2vWVCN/6ijNWqrxoXG3TdmtE4/wtm6QNdDpz810RGTgGkvGn0wtk7OrgbcjmPCtd6Izs6G/YXy1gHOHMMNfPRodkXz7eV83VkuyJJO/5EW/fr28EWFjELunLfJI26zSicK80MgPJu1H2oiT6fOBEbNHnwN987MoFtIvVaCRq35lxyfefGANCmz5UVMtrx12fBq/KFpCtvrXX1gvKH03QWZXwHyhSHSpJpkHZRV0fiO73YXbP2PppXInqjk3+KRkPomZteQfbSvk86Ulxa+cgfel4r1DmRkCP8h2dnBnHutXuNdmNGDj0FItmkyPcBlahI7pTTAo/ownfg5TCXK2eoXQWKiIHYJwdnaptDZnri5ZP3/H88utsuU9PlQOsWgjT4xMjwGlh70QCAXAgu7gEWXd7/Bb1ScsEOE/Ni8yWyMjNC/9rcRR+rjvs5EB9WG0KoqREwVT1NBTuagarCw3OpO8fJ97RLz/RjAEf6G3KWJwnR8rbFGzwouhQW2uosF2W85pRgdqS3KIjI9qnFifVpoYvHf7IVVV/AZ0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(23010399003)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ohkcYH/I8DbkJ+xVtq5+udCbOPQpH9D3Tu7sF+pE7GpwjZ8UB4232JDJTWAo?=
 =?us-ascii?Q?EZcz7HOC3hMkT/ndiQAJw950HTM8vqt/re2zmUNPlJKqnHv7dchjJRzVjwsm?=
 =?us-ascii?Q?im4WGKInO9jfusO3RpZpwA8MdSw2h6uwduAMG2l7AkHNFmoqpxJW7HV5xaKA?=
 =?us-ascii?Q?Bv4+BdwwJ6f+ODpexV00eONT5CtMI1AuNgKXF6uYzi6rJLBexPHokw1m3pEd?=
 =?us-ascii?Q?gWHLXqZdBucs2gkwZndPxdiZJEbXgiBjDicUfY5+c7K1bNhtlgbSJAZvnUwt?=
 =?us-ascii?Q?ohBYwQbAaOed2sM7dS4rz1dMB7tzTUtD3wOglDiKxU3xS7afWLwP8oMSxvWF?=
 =?us-ascii?Q?+cexQuw//IXJGjh0Nl2YDdS80q25m2sEVpDx6bhPtEiS55E9wgBfLgwpEads?=
 =?us-ascii?Q?7Zd78PzszU3pINRADUPZKMK/se8eapqASAJIZmxBDNIc0XTcq0DxDhBMG06j?=
 =?us-ascii?Q?3KQAuv65F/KsGzbwfAipwjWDvHV/fAPnFMdAXpAsVC7rCXlh16p/RhVEgVI9?=
 =?us-ascii?Q?tD1O9tFyGTlWRieRUa7sreE9pfTZTReJ6a5L1bWNhUYSgOIsRp004BLln9IN?=
 =?us-ascii?Q?36xSa9YZl5/OCdo2gVMtIkESgJ5yC50SYzMXNhO1MLcmTue8EY12AH41HGKV?=
 =?us-ascii?Q?AGOO+762qkVo7QhJhe5IdcZJoZnIUJPq7nEY0whqYwa5+dMu5ekgnUyVEwrt?=
 =?us-ascii?Q?IPWLldBg+MJXc4Z516kd+MmjgXvT3Qb8jSM0cCkAVhRdGLNsveM7YPuhtVWe?=
 =?us-ascii?Q?m4oCq4HejGF0Q18MWbBw5BjNxqodiUMDY/sjn03HRK9yP+kUlS0svs0ijdxe?=
 =?us-ascii?Q?ibAvMcWsIz91HK+HAhmten0k/p5O/kxMR+opnqpsCuin7WwCZja2nFRKmsqm?=
 =?us-ascii?Q?+WiGBKLwHxZhRB9jLt8rhJcEGZWfRzkLUjV4Yo8iCM3Ipi6IlCZNvrjVs5/m?=
 =?us-ascii?Q?Qp+9ujTVTUTmLcNaDSjvdM1TduHjte4vdNtOA1XbFjMfZVc7gErJ0lSX7LyT?=
 =?us-ascii?Q?6DANXOJafOTWYMI2BpCEgbQlm4yxWAZ7h+5MMCzsDvguy7YmeoNEyWnlF7K8?=
 =?us-ascii?Q?woUQ4micSidpyG0KncVTdxq7CmL2PI6EiFa1c11cUNtN4QUepXlmsPJJXgCI?=
 =?us-ascii?Q?MmwsC4OBxGX3+vlruNRS0nkSRlyY2mABIh+vwpIgR+ad68yNaw2isR6gSo2E?=
 =?us-ascii?Q?IN5GHarepRdDtKQt5QNN9GvLxJURnXqyVXdXaattguAIe6xg0D2URxSMG59v?=
 =?us-ascii?Q?OehzNhWD8ttsSv5ipszFwtmrSjUFgzdbmEzApXGomr5a/Gt9SyWSTut6MgBm?=
 =?us-ascii?Q?r4o7TAx5QxT/GynKWrQTN1HTbcCvljdRvxVPSOz0a/HpVXjzxu8NbtFJCNbF?=
 =?us-ascii?Q?hGEjZ6ip3GjVCaup5l3UeIOy5EYRzuRCWx2oSE2iXcXyA2YcLeB9wdoVC8cz?=
 =?us-ascii?Q?AcJCnTXDLWXZOisPt+ztnUp+ceocPqyhcOCHgigsnHVJ4EwcP4Nm4nuQ6NBM?=
 =?us-ascii?Q?1EE4xg/Cw248iYyOe5gYuRu3nOF9ejA00zFp8uI969uZQtO7cWqX9WHA8Vu5?=
 =?us-ascii?Q?tuoINWXQd4nUirH5MXj6bFyYhk8Fb5XutV9WrkZ+R6bGOJXLG9xHB4vqCGid?=
 =?us-ascii?Q?X5mQmBPuBnNWjDIOaQr/Ex1yWI/HCoPMmMQSbEzqk13HzVHbDSAJsGfq6jCz?=
 =?us-ascii?Q?+lQtLykgDFrenPt7eQxfuWgYrJQT2LWsMPQoFpE6W0OKGW2wAd9MCOjGu3gA?=
 =?us-ascii?Q?GZMOQzWTeVtmcCXcLv0KM16HDWXW1K+97B6nHzF5nfBsY05yirhN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e99007a-e86d-4803-0376-08df18e0fe42
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 19:37:53.1067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Aq3foa3qAfIupRHyE03kmW+9UvV9ZMieDqfvk5u+4ROxJkP94jrrR8YTQY3OqmDcZpSYx58Zj8GTluSbre2dBDgTDck6jjeZThbngb+UPL2tTOFwXGvkH+oxr7/7NKh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6883

On Sun, Sep 20, 2026 at 08:59:43PM +0200, Linus Walleij wrote:

suggested subject:

return IRQ_NONE when no interrupt is pending

> d40_handle_interrupt() returns IRQ_HANDLED even when no terminal-count or
> error status bit is set. If the line remains asserted without matching
> status, reporting it as handled prevents the generic interrupt code from
> detecting the stuck interrupt.

Looks like it is debug function. The major purpose is return IRQ_NONE should
be for irq sharing?

Frank
>
> Track whether the handler observes any DMA40 status. Return IRQ_NONE only
> when none is present, allowing the generic spurious interrupt detector to
> disable a faulty status-less interrupt line.
>
> DMA40 channels can be owned by other SoC cores. Their status still explains
> why the interrupt fired, but Linux must not acknowledge it. Treat foreign
> status as handled and leave its acknowledgment to the owning core, while
> acknowledging and dispatching only registered Linux channels.
>
> Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/dma/ste_dma40.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index bb052d3028cc..4380f9a1b035 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -1807,6 +1807,7 @@ static void dma_tasklet(struct tasklet_struct *t)
>
>  static irqreturn_t d40_handle_interrupt(int irq, void *data)
>  {
> +	irqreturn_t handled = IRQ_NONE;
>  	int i;
>  	u32 idx;
>  	u32 row;
> @@ -1840,6 +1841,12 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
>  		row = chan / BITS_PER_LONG;
>  		idx = chan & (BITS_PER_LONG - 1);
>
> +		/*
> +		 * Status for a channel owned by another core still explains
> +		 * the interrupt, but only ACK Linux-owned channels below.
> +		 */
> +		handled = IRQ_HANDLED;
> +
>  		if (il[row].offset == D40_PHY_CHAN)
>  			d40c = base->lookup_phy_chans[idx];
>  		else
> @@ -1872,7 +1879,7 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
>  	if (ret > 0)
>  		pm_runtime_put_autosuspend(base->dev);
>
> -	return IRQ_HANDLED;
> +	return handled;
>  }
>
>  static int d40_validate_conf(struct d40_chan *d40c,
>
> --
> 2.55.0
>
