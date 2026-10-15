Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013001.outbound.protection.outlook.com [40.107.159.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0E255C1D4;
	Thu, 15 Oct 2026 17:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792084173; cv=fail; b=rXs7urISV0i3eaVbcsT+/NpX1YejRT8Jw6dKqCjZhqUEEG+HxvD3cn/RAO7yHeStTZ+WEeQZ3w3o3uOk1F6pvIMxfhbSTocQB8iUxrIH/DHgG6WkbLiO8CemntisEOD2ZUqQ05gMSjGc5PXaVkyapgWuCZTpNf8CElQWvTCZZLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792084173; c=relaxed/simple;
	bh=/YxKUDbOMMqampgUrvW6Ds02GAi9GWVMnWr2aCug/UU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RmSeCGrg0QfAQFrK8k6+CosgcHPCGMWrvQfzHzE38/An+Q2i7ikc6JUfmFF6MG4HqoxnZ2jLCqZMEAoyfuH4MRq6kiC4oz4AcW/DHdsQTroy1y/NzT4CfYhhkjexZeCYYu2Qj/+pZukNP//oyFwXhL6ALXuh6DqS6aENhkhY8pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MkIMYDQo; arc=fail smtp.client-ip=40.107.159.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MkIMYDQo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GDzXMxyVXJ7TV2UPqrHtqiGc5zfwyvwvUxNIxBU3QB4LIEijo5v80zJCX0CYaYgwnJJOWb9O6Di8A6XEj3+RKtUPVsWMX2pYtUa4TzhPnDQtUJORECtseanp6XXVZbVbZntYaBMsyMGZ+YuwwSW9D3hle0gBLOvvpv3AjMQzTAQcj5FtMDEUxoDDo5gdXhhs86R/WxqAmyJ8nQjlIe7a5G9JhpuGSh/me91GPgsJnKy2KvVrTu4slAKbY88MOqpaZTf4MnPd/sJC0EFYm6eo62X+cLhdUq7qGwygGUeoQmJ4RbUIl+IB34dR+ScN1kbz28V56KgJptlNPCVQ1T3N6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i77E9CSWvHt2iFSUF90siwSEpwIOX9T8ZYMc2a3d0D4=;
 b=D3KiaxGJNXd00yOkiqfj9oLoGT3t3SHq2o9HlNp8Z1GfalEiessR4kGFCkAZfJMJQ4zThZVLt66ED1JeCqA0INpKNl2YPgGdrcHhk8PtyNQ7AuN0cQIzn06VEMVPOK7TfZxUCrjA7NuTLyLHUMl2j94CmvURxsBGb/wUaW/n5OJ/M7jrYzf4DhypHaUgLleKZLS+0241b+R6ZaK8Cyy9ODzRl1Ti2BhWMAOhbWh2A/T6fx515ROazinKARDa+zZ/rS79zVyzUljV9g7v5bnN7LIR9N1RfqVnDAYX9iiTvXmuNt3e9MKHtKPdx5YuXBQhTeWq0E5W6OVeWb12CEL/Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i77E9CSWvHt2iFSUF90siwSEpwIOX9T8ZYMc2a3d0D4=;
 b=MkIMYDQoXj60nBf4iuHxepVxh7SNEczCTXidLW1h9eRR4mcxdkXpjkbFdW0vohDuIEXaiWMkUPMOyjZPLCSUOSXHYB3n8BfALj4ELGfVinJXsgVQ9csGAB00kVRuuMWzjTPZJ/gDfsmkLJYPYiSh4j9ZzumAZWjI4mQoFtZPhYHj5TrsHZhBZlndIff82FIF1CkpYrWNF7e60QaQQaXIB9RKUKmqNLS6H5ol07yFXBECbbJJMxYipPwUSD5CqB4PpepESP05O1sWU3ivo+9RZrLfagIBKWIHDRx8gC7eRrGmKS4kWaVe4Al2qmIrGJw5hmQXM6dMrz9UUC/RAQhKAw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10579.eurprd04.prod.outlook.com (2603:10a6:102:48c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 17:09:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 17:09:16 +0000
Date: Thu, 15 Oct 2026 13:09:06 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Cc: peter.ujfalusi@gmail.com, vkoul@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
	ssantosh@kernel.org, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, vigneshr@ti.com,
	Frank.li@nxp.com, r-sharma3@ti.com, gehariprasath@ti.com
Subject: Re: [PATCH v12 01/20] dmaengine: ti: k3-udma: Fix sporadic crash on
 AM62x
Message-ID: <atEIsi5IPAtg17FL@lizhi-Precision-Tower-5810>
References: <20261007102936.2402427-1-s-adivi@ti.com>
 <20261007102936.2402427-2-s-adivi@ti.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007102936.2402427-2-s-adivi@ti.com>
X-ClientProxiedBy: SJ0PR03CA0058.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10579:EE_
X-MS-Office365-Filtering-Correlation-Id: b2325cf7-8c1c-4a36-cc8e-08df2adf0b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|23010399003|366016|10067099003|18002099003|22082099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	GZ7BU0G79AQPD8TwGbifd9UTAJuSzOEX84UYks37+mC0p1MQ11dHM4NZsj8e3NjlGWifxkkpdZab9z2444U71vV1ovllfHBaXv+MPObZacqdMx76a+aeTptTZstlmM2wl3I8sSZAHqJyRFLmpC/lpONv0bjorwrdfIePSYH+tui5HSRnsNyPGJQbFDzq4DqCQ4evpmbmTlHLk4pAXaGW7l7+Lng7maZoeoAQRnph5OvkdOQB5C4/l/eV4iJ1BEN8R6UFOFX10AF5kyiF5s/zTa8dNfeCUWqEYKSVQ6aHe0smj71RkZMgqqA1IrCUyfuJKcNgD03hBwbe5jfu+JZhOXCmuPkxg18Cke3EaeLYBVhl08Bn+172spdrJtzGWqMQIiKT37bXAtohzYJoHy0LsDjvJmUKdAOXCcRsgYXA3JgRYpdJpXB/OdjvEE0Rt5mzGvocRKneclRuVzD+FkAD3Rq91a1VPRvs9CITySeUk1mD3B7fKP73rOwHfiiMV72NzLAn81hooBvVlTLMmmtaw3IisPKaFQjxu3a2iXRzvy+7raVtXlZsbXSyQuI9CQsJzu25absIUxffGB/WMwCQoFPhL97xqwRF51hoOsfVC70AmTuIfCubHFJbGE+UB46WYP8aWJxnGyTvgBPaKWAqxy/ce1DHqUtIn766Uo/tV4A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(23010399003)(366016)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5u2YbGMDbOfg4sZWGf2GyFi0YuNWWPZb71fJOVk1AkFsbB9R6mfLle7iD22E?=
 =?us-ascii?Q?AJ2pSeqyr8bgiP7f7SYddQVHlYClQn8leWwclPbAoj80uQJk1+dCuBgBX/7U?=
 =?us-ascii?Q?JTGIV3W/taV4MoASTeVKdV9YlIVUFx4W+7CpNJjpmgQaaHySSTTQIQGzcdq1?=
 =?us-ascii?Q?qfkBh0fnSLKg82gBZWbwK9ZeGi24kkObC0zYV3SwzthnzAqezvum2Y0wHz8Y?=
 =?us-ascii?Q?ape/JwePKfkoZD0DUEhz6rCEeD874w9RATDywVU7gLxC6EelEJlJu4isWnz8?=
 =?us-ascii?Q?C6CeYWM3xvuHjlbepqoicy8EjJyDt1Hg0vDSlwWCJh71co4kqUQ1iaJx2s6W?=
 =?us-ascii?Q?HQ1y2EubrPaHAUyEbCn90Lxq57VTLTZAgA6Z/F61mjW4gbMGe3RG4hC8Wiet?=
 =?us-ascii?Q?i4LytJyN+8LhOMjT912x3QyxEZR4DdDB89v2o9Ia4tFEiYrf2iIqvxHE8D05?=
 =?us-ascii?Q?h5qUD7C9HAFAKy9bkGDACXA7AdW7RN55F9JLuizH0JihCLpS3CfudKa0hQ6U?=
 =?us-ascii?Q?OoeJtwJW/dsOp+KI6T76EUW5zIs6A+9OYlr1wxszNC1WjPenA7KQ6YEg5bpa?=
 =?us-ascii?Q?uSBTd+sVIv8YUOWoiV7Y1Ugyi55ah5VCp5HiYROC1a/ZcaG0JX+AsGnyL1lN?=
 =?us-ascii?Q?OotGPjaFwG5shYCNUTpebp56HhoOL4Q9vB6WhJ0uVHvCKz0PhGCh5ztx3u0+?=
 =?us-ascii?Q?wwvBr1fxDHLn87rtsiLPEflX7xEric7jNYV5DoJfrHMGTGK18rECy2GHXTiM?=
 =?us-ascii?Q?HMgDCLLT4p8HJEk4mUQwHTyUF3FaO3YYMjItJ/zgazC6hboth8xYGjm9toSo?=
 =?us-ascii?Q?fjhqIWRBGwOf3DXg29coDxuwJrOLHwYIdq4gI6TvrhiuWs3h1MIp2N6EKXPu?=
 =?us-ascii?Q?ep79JP/jKsBRwC2XZx4z5i+GD/SU5AvD9xM4nl6aGqUaMLyuLuXkAkpVcToh?=
 =?us-ascii?Q?BhpJwGQxsoeUIUkOqJuXUKYnJe8oj1Ix7q6+qr+u2c7qfe5GgdyA7xGtfD7k?=
 =?us-ascii?Q?gNMapDrEm1nnFofUTxSp7f5eD0Z8pzKi88MFzyTQ35I+QEYGu79ld+AOYG94?=
 =?us-ascii?Q?NjUYv+RbuBxZF6LqlQVTaR3Ua5ndQY3EdqapnPecz6HsRG5HPM+AL/LMLuHZ?=
 =?us-ascii?Q?L4cZLPtD8fOkZoytyUv673A58+4v1bMVw6h/w3odDvQxokKwCFLoyz4d6HN5?=
 =?us-ascii?Q?hNYMp8VCPR6SFGNyMIbMSDbIctpza3edNkrAqxW7Z8GRXGO4x0xWPosffi48?=
 =?us-ascii?Q?6fIfT2rsk2QlUMLMKI4aUyKLPFlrvShWtidzySThvWwMqJukpysxkgURzlrK?=
 =?us-ascii?Q?9zKCXdPs9bQDGpOnzsPtmpzyzYI34lxdA8gxlBL2IEAZt9tGqFnF0+XXQbuP?=
 =?us-ascii?Q?xO8glICYXbh+i4kY6eEMJEuPDMfpFCXmsjJFue5PsOvFolpAnbHTj6CuQLHW?=
 =?us-ascii?Q?pxHpYVMfqukgTnaU7lA//xYbXfBttIkJ1W0iIlpG9wLNcA3g8eutSwb02pzx?=
 =?us-ascii?Q?s18Py5CYxpeJXLs+gMvRZdElwazqnVNC0WK2LeNqE73nSfFIduvoyPNdXT6s?=
 =?us-ascii?Q?55olM6jeaX8OOY8Umo2b34lYOZDNek6BPjKpuzo2ZoKc6VBi/PQDIsoe35A5?=
 =?us-ascii?Q?32Bmoupa/KVJbP/yPZFvMfuYlG3lBdC50nUdV7Ev1RpL7sqID6KeoaHBKxT6?=
 =?us-ascii?Q?deaIzBU4iecC7h+aEQ/C4GgsMFk51KL1/bgoTSdGGHeYO3wOPPG07cAT/FrO?=
 =?us-ascii?Q?rcCrsd55g72kxcc7ZbtW0p9tEJzUujhS3tYpVLFkhXY7+YllsDSI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2325cf7-8c1c-4a36-cc8e-08df2adf0b45
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 17:09:16.7310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: clFVq8NCJ5x300+RwrpYU48XtkitzQ4lmE01ok+jYIg1nK5PN2BQ2TQwWBsIkyZDGds/JwkCMuLG1LuyboId/WI26vU2sgwmJ38C/FvZ453YUBnUlzenu+2B/bGbm7LT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10579

On Wed, Oct 07, 2026 at 03:58:42PM +0530, Sai Sree Kartheek Adivi wrote:
> From: Vignesh Raghavendra <vigneshr@ti.com>
>
> ring_init_data is declared on stack and left uninitialized, so any
> field not explicitly assigned afterwards carries garbage. Every field
> that exists on struct k3_ringacc_init_data today (tisci, tisci_dev_id,
> num_rings) is set immediately below, so this is currently a no-op, but
> a later patch in this series adds a base_rt field to the same struct
> that is not set by this call site. Without this fix, that field would
> carry stack garbage here, and k3_ringacc_dmarings_init() could use a
> junk address for the ringrt base, causing a crash during ring pop:
>
> [    1.998239] cadence-qspi fc40000.spi: couldn't determine phase-detect-selector
> [    2.532106] Unable to handle kernel paging request at virtual address ffff800081a84b98
> [    2.540051] Mem abort info:
> [...]
> [    2.629987] Workqueue: events_unbound deferred_probe_work_func
> [    2.635832] pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    2.642787] pc : k3_ringacc_ring_pop+0x48/0x94
> [    2.647234] lr : udma_pop_from_ring+0x7c/0xb4
> [...]
> [    2.726250] Call trace:
> [    2.728691]  k3_ringacc_ring_pop+0x48/0x94
> [    2.732786]  udma_ring_irq_handler+0x34/0x218
> [    2.737141]  __handle_irq_event_percpu+0x60/0x14c
> [    2.741846]  handle_irq_event+0x4c/0xa8
>
> Fix this proactively by explicitly initializing the variable to 0,
> before the base_rt field is introduced.
>
> Fixes: 017794739702 ("dmaengine: ti: k3-udma: Initial support for K3 BCDMA")
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ti/k3-udma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index 78a67cb9d6e00..8457644cb9132 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c
> @@ -5484,7 +5484,7 @@ static int udma_probe(struct platform_device *pdev)
>  	if (ud->match_data->type == DMA_TYPE_UDMA) {
>  		ud->ringacc = of_k3_ringacc_get_by_phandle(dev->of_node, "ti,ringacc");
>  	} else {
> -		struct k3_ringacc_init_data ring_init_data;
> +		struct k3_ringacc_init_data ring_init_data = { 0 };
>
>  		ring_init_data.tisci = ud->tisci_rm.tisci;
>  		ring_init_data.tisci_dev_id = ud->tisci_rm.tisci_dev_id;
> --
> 2.55.0
>
