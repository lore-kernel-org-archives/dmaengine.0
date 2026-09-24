Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013071.outbound.protection.outlook.com [40.107.162.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93D8486656;
	Thu, 24 Sep 2026 20:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280380; cv=fail; b=YXgfBTl0gI/o37BEZKvNV0D45ot3D+GaNE4JGn+yHFhnjzF90PF7TMzEldXmUg/STqnEOjarnqiQL46+0SWEsuU8HdEvFsztsAu6udD8GnMPgSQaIPniV3vm0hIYhXB8UZ+7Q3IO3C1R8RzVbrsijd2Bq4nUkzaU4DOAtxIbVaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280380; c=relaxed/simple;
	bh=M6vJ33kKKcz1YbQ9pcbaA0WJr19yC/nujz2SQ4hbkN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pE4LwbxiqyMyrvfwb4LQHe07ma+cGBoHdJuvnIq3Jw8cMFp2ENXEJlh2uiq5q6bwGpi/8xoFRBIQfIlwBO6URz735SIM80Of13EjoxysMt913uGgC6sD+FVLNB63PWcJmp0uQWRuvkP6Agp8GuNFhqTl6ZR6ZHf/m3q0K9+4uKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TX1wqMPX; arc=fail smtp.client-ip=40.107.162.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TX1wqMPX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e//8IwiKhRQM3XLX/fPg2njPG9skeDHC+sxajbPwjWO/w5ysIdajIuLdb/08CNfjRJu81nou7YRmKGTRlpSieHRpDVOUzqigU3sQUWUmioX1jy/Xrg7Ymy0SnWOfoErin9AFqbZO8N4Hna7806qjojPS1psWvfwHxaGRmMO9HRNNioJieH8G4S10bWa/q/9/KG7PTYHt30gltedMhgssQ3V0dV9uOi3jP9lAUNFXufMmedaqiC6918oVBZRBGTFE0r0/sDfcw3qUtPVufn11OY/2ArHNYoxsKmNvk4XnkJcPQTEC1vuiYLwV+l46N4oIMjKVxIZWVKQLuVJ5qHrIFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owvF+RVwuDsjAABzbq8f4SJDxOj8LHcK8ueo8yKku4I=;
 b=UxXqfPieNLgr9S++nIJ3RTJkADUP2iWyIgWtNQGoqufZH/HWPUjsQ8SGvo/DZn/nzo94ATzKe4XuPBWd5knTiMx98Za6znO8VBX82YAVxBDQ1UldJMO2eTH1JxYEM6brbe3YEat9KF9rHrGf/I7uKAheNl6Le7RdoWB31qQdteiDo3akO7kqN095cslxK5p6ZkT4hDCDSSvKYA3OD0pyaBD7coj3rUxD0EVf67QBhgaCsNZXwBzroTZMGeLKSULcZ7FfzHwzIzKZu2QLdJN87Yl58bcGHo3uAV/B1OkhIRFuTUghB7dtl1USC/6WSCRuc8pRoHu3HXqKvNiPSx6aEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owvF+RVwuDsjAABzbq8f4SJDxOj8LHcK8ueo8yKku4I=;
 b=TX1wqMPXAI/dfoQEVDasVROx4Sd4W0i9wlevLKXubBRPxXypxgINURv2DupyKF9p4CxnpyvuO8S12NrYuaEWssbbrWr0Bwm6wmvdZ21mXxgisl5o/Q7a2J/b1pQ9EqQYHFRiMbE4tQQR/7m7ji0IDUyk7ZvsjTKYNpBI5zbvPoFpcY34LWY4+EjyLjB5CeJGGMLoxzswfxNCb+2VnS1nPCoLCT2rVEHEhA4/PkVkef79iPIl6Y5tYDs1AeUMQO39dIc3kFAw2UPr6kLuYSa+cC4jfrPKOhdpMvw+7lbMIiu/VnsqtX7cUZsg+uU1j9hTr+8vbIbl2W+TQuZyvL3RHg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7922.eurprd04.prod.outlook.com (2603:10a6:20b:249::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 20:06:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 20:06:14 +0000
Date: Thu, 24 Sep 2026 16:06:08 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] dmaengine: ppc4xx: change to %zu format specifiers for
 size_t arguments
Message-ID: <arWCsBeMh5HmT_z4@lizhi-Precision-Tower-5810>
References: <20260911220308.176962-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911220308.176962-1-rosenp@gmail.com>
X-ClientProxiedBy: CYXPR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:930:d0::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: ae4dfd02-9462-4ae3-9296-08df1a774986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|23010399003|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jiFfj/gCz2s5sdVS4DI6+VvCkX/eE3UuTMyVECbowTyZurNxsHTE31+ZlXkB8lxrsGNwKiv/MiyVoQyDlzfP2k+LNh1l8UzchLSV6YQkDU5oGrSAFLnIJE0XPehmindbDtGtwp8N9cFKmoXwQSgyT6Nc52/7qvCk3m7zMHSk5G9qhQ4xj+iu4gby4Vd5hHr2ehmpMbA9SFDt/8/LQdXlkF7I820mGWQFgdtDj2zRj/XZ3pLKCOMsl9hJepWPT+jYPvULopTd5R45UCoKfyAJ2KXuMCN+wAuEcqBkzTegEffoGnpWjN5W3Vc0l4wTC5m8drQ4EI2mhmxusR9mGir88Zllp4KP04MVZM24few3TrAiDkht3fOB93dsa8TIDdAPw7zUr8P2uxeXS4opxJPu7DWBdcbbxEcEOvSFoQX551SV6Fpk0D8bFAPa8z8xYxybaa1V58Hx3ud0GYcL5bDBspE5/Lr57IzAnzO7N/+/pj9/yn4z1HNzBnTggnWb7fEiotUrkCvRFWzkfoRIlpHP3JSGi1CeiazrrXlPXf3ZqM5q7Ox51KKFtuNP+/1Fv9Ty9zhi7+TMUMDXaQpq92zvaZDlYi9d7fllICGFHx97ZW/KJkwfHItr8S9+WpoxW1TrcQlAqhIdy800zTJqbSsKevW3IIUlbtkusOQEF3pErR4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(23010399003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k0Z17mX98dnXmqOo8TNKL7gZbkiAlxizgShDtsE2D1b4K4dyCejrVyecZZUL?=
 =?us-ascii?Q?XAeCseB/oj5b0h8/62lx0UVA4bZqBidRK8df+IyBdhXS1LWqdvft+Cn8qkYB?=
 =?us-ascii?Q?QB90BgFicetj0gAIZd2BUEDl3+WorZXzNIICtLCLtxtNL1kkOQD0wwveE0OE?=
 =?us-ascii?Q?wGwbYdL8fkPzXP/BD8WkGjniK0R0TZk9BCrvxlteMgoyX5i+uzJHWfroV8ni?=
 =?us-ascii?Q?4kff9hU8mwsbp6Q7r3jr9uSO/G2/NHGK5yAlrPv0gV65Ij/T34kaJxpl2iQ0?=
 =?us-ascii?Q?nMxqVtY3x4GkS+Oz8MutecyCB/lEwK4a5YdTNPUCXQawjumDJBtUQmsGfIT1?=
 =?us-ascii?Q?GHZdN8JsdxeBgysXfT9hbO8hW+Kxa1xTs6wMCYaoqpVjsnKOuf7b1EEaU1L0?=
 =?us-ascii?Q?D2hHsyXhEKzUlNG+sF+YiMMddMXi+IynPdzrVfy4Q5KhJFfxtJOKxLBV6Cif?=
 =?us-ascii?Q?iAa4XDSXmaFqLLa6zv/4AAZr1UrJXcpk0SjTZDxE3RwVkIHCYyHH5cvJmp3C?=
 =?us-ascii?Q?x1ycceSTDHGPPFRAZBc25aZgwZfmpovXe9UktbbGjrPq+sZ9BnJl/37K7nLP?=
 =?us-ascii?Q?0ueRLKtydCDNr5EBNllwlaUtqJqTxCTZcnVTsfcEWyJHdagNK8BkdToVAnfb?=
 =?us-ascii?Q?11T7IqQn42oI5hq4hgzmuGP3i8WHHFdxncMb12ivLjBPSzRUoSy8S6dHnFvx?=
 =?us-ascii?Q?jgyFsy4dNN6CIVWMq8XaR7nreirm61P8CZBbrhwnxurz1NV1HH0gDwZKkXWe?=
 =?us-ascii?Q?3MMDzaZx+pkfJwoUUJsnM+s5xV1NykoU+pb5QTHa2n2zuZ/IyGnplonO7aqD?=
 =?us-ascii?Q?eBeAtgiwKKl3+m8S/ynXCRAUUKXHwnzbqP0hToZ0KKjPWDsQUd2SwudZ1umP?=
 =?us-ascii?Q?kahBy8LhtXO1a7ZI1FH6c5kuFBicudwF7sBFZKdd3iNtgOQ7wh43dnQNursK?=
 =?us-ascii?Q?gkxwWU9cKfuRe+mlXCLcfWhe9GcNG3HeNMa2SHPjnF+vbCDnHhNqjieFCseU?=
 =?us-ascii?Q?Tmpnls+3u+RJBWwIXOwGr9eL5PYe/3GdJ4aLUePwhrtZH3IITCVG5x75SpDV?=
 =?us-ascii?Q?3PuWnV1AUQ4bqjRgH4HbAdevU80CAFDnkQGTKR2HVwp34J02D0uOYoIaAn7O?=
 =?us-ascii?Q?2WhnGsG5ci2uo6tp8O6xGIItA6A2WU7Ck/3nXSymxbcxJvZTxLGRb0l+hWZ5?=
 =?us-ascii?Q?B4pcLlSA3nWlmm97gMmWJoJEwgL0V7Tlo/MsmFsagV+Zv1ALHDTd6csQkkV6?=
 =?us-ascii?Q?2bSN9fhETHweLpDvRoRM5jw2GPcZuaseb8Td/tXHWQ6rIL375ecMaGs3Lk2z?=
 =?us-ascii?Q?1+i/tQxfnbUaN3AYQlVm9IBFFCR5Mui0cCBv1mWqQ3tLkGyf99x2n4x6tqib?=
 =?us-ascii?Q?ubqh97h1AOoz0fvkSVD1JpLlIikw28tKPHcP8Ijq3q7F+5RVt90BwB/48ml6?=
 =?us-ascii?Q?ZUOYxzvyO9Xy9i4Yhy1hryc4msf1wMrmH0h/EDSQqFVqFf335/67sTAke9At?=
 =?us-ascii?Q?CNJvcjJC5MYl7MGPaGirTtKscR6tde7EdRNA1uZHwIwKkxgHNCwVT3sdMknI?=
 =?us-ascii?Q?bFRDyc4TKrCGz5SWiX22bJ8KV+8Eh0agmOfBxRBn8nzZKds0Y9UeAcjxd8zK?=
 =?us-ascii?Q?AfZN6WRddztUBwQkwVIuSdsuxn1BLIpWPAf1jkHaLaaF3a+uQdDbqLwXDY38?=
 =?us-ascii?Q?00KngweJHUCnnxyw5Rof6pXgBUfZ41dniuEP3FG+uCufqBAEn4RO4d2sg4hf?=
 =?us-ascii?Q?BdEb15xdfUAzJlsLr2uvcx+PK8gDDcwsxNu0+geCgAu0U8SmtWFs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae4dfd02-9462-4ae3-9296-08df1a774986
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 20:06:14.8879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8jJL7oTTrAWgS+fy1Ma0vtxDpTSOoxt0mM0PEFflXhu+5K7dXHvrpez9q+zoHg+4mkK3BE/Z1I18I2k9TzL3maqkKqykyN96rfJx5HknXBv01pxOuDr16VgJ/69UlZL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7922

On Fri, Sep 11, 2026 at 03:03:08PM -0700, Rosen Penev wrote:
> Several dev_err, dev_dbg, pr_debug, and printk calls use %d or %u
> format specifiers for size_t arguments (len, pool_size).  Fix them
> to use %zu to avoid warnings on 64-bit builds.
>
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  v2: fix subject
>  drivers/dma/ppc4xx/adma.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> index 1bdc781efbb5..39498779e241 100644
> --- a/drivers/dma/ppc4xx/adma.c
> +++ b/drivers/dma/ppc4xx/adma.c
> @@ -799,7 +799,7 @@ static int ppc440spe_chan_xor_slot_count(size_t len, int src_cnt,
>  	if (likely(len <= PPC440SPE_ADMA_XOR_MAX_BYTE_COUNT))
>  		return slot_cnt;
>
> -	printk(KERN_ERR "%s: len %d > max %d !!\n",
> +	printk(KERN_ERR "%s: len %zu > max %d !!\n",
>  		__func__, len, PPC440SPE_ADMA_XOR_MAX_BYTE_COUNT);
>  	BUG();
>  	return slot_cnt;
> @@ -1989,7 +1989,7 @@ static struct dma_async_tx_descriptor *ppc440spe_adma_prep_dma_memcpy(
>  	spin_lock_bh(&ppc440spe_chan->lock);
>
>  	dev_dbg(ppc440spe_chan->device->common.dev,
> -		"ppc440spe adma%d: %s len: %u int_en %d\n",
> +		"ppc440spe adma%d: %s len: %zu int_en %d\n",
>  		ppc440spe_chan->device->id, __func__, len,
>  		flags & DMA_PREP_INTERRUPT ? 1 : 0);
>  	slot_cnt = slots_per_op = 1;
> @@ -2030,7 +2030,7 @@ static struct dma_async_tx_descriptor *ppc440spe_adma_prep_dma_xor(
>  	BUG_ON(len > PPC440SPE_ADMA_XOR_MAX_BYTE_COUNT);
>
>  	dev_dbg(ppc440spe_chan->device->common.dev,
> -		"ppc440spe adma%d: %s src_cnt: %d len: %u int_en: %d\n",
> +		"ppc440spe adma%d: %s src_cnt: %d len: %zu int_en: %d\n",
>  		ppc440spe_chan->device->id, __func__, src_cnt, len,
>  		flags & DMA_PREP_INTERRUPT ? 1 : 0);
>
> @@ -2279,7 +2279,7 @@ static struct ppc440spe_adma_desc_slot *ppc440spe_dma01_prep_pq(
>  	unsigned long op = 0;
>  	unsigned char mult = 1;
>
> -	pr_debug("%s: dst_cnt %d, src_cnt %d, len %d\n",
> +	pr_debug("%s: dst_cnt %d, src_cnt %d, len %zu\n",
>  		 __func__, dst_cnt, src_cnt, len);
>  	/*  select operations WXOR/RXOR depending on the
>  	 * source addresses of operators and the number
> @@ -2553,7 +2553,7 @@ static struct dma_async_tx_descriptor *ppc440spe_adma_prep_dma_pq(
>  	BUG_ON(!dst_cnt);
>
>  	dev_dbg(ppc440spe_chan->device->common.dev,
> -		"ppc440spe adma%d: %s src_cnt: %d len: %u int_en: %d\n",
> +		"ppc440spe adma%d: %s src_cnt: %d len: %zu int_en: %d\n",
>  		ppc440spe_chan->device->id, __func__, src_cnt, len,
>  		flags & DMA_PREP_INTERRUPT ? 1 : 0);
>
> @@ -4071,7 +4071,7 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
>  					adev->pool_size, &adev->dma_desc_pool,
>  					GFP_KERNEL);
>  	if (adev->dma_desc_pool_virt == NULL) {
> -		dev_err(&ofdev->dev, "failed to allocate %d bytes of coherent "
> +		dev_err(&ofdev->dev, "failed to allocate %zu bytes of coherent "
>  			"memory for hardware descriptors\n",
>  			adev->pool_size);
>  		initcode = PPC_ADMA_INIT_COHERENT;
> --
> 2.55.0
>
