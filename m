Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1730C355F5F;
	Thu, 30 Jul 2026 16:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785430264; cv=fail; b=r0T2Agb2mID0gRMROLuvxwbkBMnPGXFr7vkq6CQhWrk/1QJyDXLAEdsg78drmbCcLuWXaYKsAN7+tT+tSlR6f+K+QKvg0kkyjZZp+F5iBWJ+e33DbPbOMbDPkcC4kpekfIy/p39HLNmE4mQ1ZpAxf18Z4mhm47glmFcfDRoqpUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785430264; c=relaxed/simple;
	bh=EYKbRO86n0x9/A7gBnNvCyYx2ozAbpnp5eeXnGVuPOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d9BnmBjN61odpujcx1wRJcoN8oPr0wxytHy+h1JACseNlnTjo9w4K/YKiy0Ydzkl5rE5lGfRKCeqdl9YnSraq93+KTTQ1qfpqaOvDHorfyx+itEVnCI2dysurrGj0s/gmh0UUy1WdkTlOd91xy1MkEtOip1XhSXY0/Yu3OjXloE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rv7oDFm7; arc=fail smtp.client-ip=52.101.70.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rv7oDFm7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SpVeVa+u2eltAgyDFPe5wEbNRSHydKl3ySEmZVkfO6yoBNjAreEMQgpXdBdzzPmbcom2BGjh+eay88J/ewWk3oYbiz2BPPVmgD7z4ndMUrvZy57GjAsGup4h+z7kk+a/VlwpeXY5XX7u9xHgcYNKrSdkpIytUga2G4Za9YCgQI6P1zT7hTDX6IYClkcMFlY6qIBCyuzjI/RMO4gM2C+Prb5yKE27mvhVDnC8nl87Wa48VzGmzqkx5tnjsChww/Qfv3LeP+b7lYrviY+u3ac0D46hV1rAwg6XhWM+f7OABStfAtTcunrOZUIda5Y7RIf0FdJKzJhf3jDs690awbiXwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s26M+1LHDwg1rRWhogFuo6ScfZu158zAJJwIkUC++RY=;
 b=tbvJdMr3s/6Xaac567V616/tRdXvxp8OHdms6RO+MLxAoCrInjc7zQ88MqGSsmpsnpsNTMgyTdyLAjreLGNvzKYS7WjcfVSmDjiyQyl69d1JJYx9Sf3HM5ZciOSaKFFyYOoR1oRkUGo1oKgIwLaVom3S3xf4aQkthWTinslIxOrpWozQSs8yYelBppefKqnyKz6wHl8Kqsx6U8n0st4gs7IfT+YD6xsyQUvL59dlrhxHYwSBkv1ptoeQGOhc5ZfTB8gK55YnyGfjqGo63G6kBBULXGJxDqgbVAMnpeefWeNG2pQhCONjAfOnyjINF/8eA1GCwPM6DLP4syrF+k4BVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s26M+1LHDwg1rRWhogFuo6ScfZu158zAJJwIkUC++RY=;
 b=rv7oDFm73nzz/2iz9+uwm84ehQ8FI/7f/wALmv5lE4tCZO2SR0gv6lojOsg0fOFJsC/PLlNFg7728sVu+cF7DrhnacVBErur0eWPbhmQvwlG4aZ9HuBTKa1E8g/G5nnsujSLWbWa/f6MdhzWO6Z93E0MtyXtKvj4aIVf3m0M2CzMSgehhzZ3KyqDjmkLVv2RmwGJq45ffcIKWbSPW8cdjh04u5tzdVYJw5a6l7aL/EE28biEsOO8Ny5FmAQyoXNKCgoX5QNoqVFtCRSUf3ai67gtI27Y8SwMxApHN7ywfddp9DAkwEZkeKQcYiarZ4xtOo3XXcqpA80kBlIjTkQLgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB11586.eurprd04.prod.outlook.com (2603:10a6:150:2c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 16:51:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 16:50:59 +0000
Date: Thu, 30 Jul 2026 11:50:51 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: dw-edma: Mark emulated IRQ as level-triggered
Message-ID: <amuA6-VhESu9UzNh@SMW015318>
References: <20260730160701.3550710-1-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730160701.3550710-1-den@valinux.co.jp>
X-ClientProxiedBy: PH1PEPF000132F8.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB11586:EE_
X-MS-Office365-Filtering-Correlation-Id: e002ee80-df38-4b39-be47-08deee5abb81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|1800799024|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	x8y0HiRjFA3ZoZowujCgHGHMq/AzOUqsA4YrAoSm9q8ZPv7Ah3z1on0jq9a45aIOZgItf9mwcOY1hu8YGTPLIgjuvOmpXzyTm+hswd5z2ntgMO+OQojwMMrpuiioVPssygu089hWm8F1MovAY/iAVA2BVGnnvJrKPyrWz8rcC/kN+T40hCMoLRlTW/PHYZHqDOs5jlEIrk70vWzmEsAshm7chXTBfVLTTX0s9kF71lkEy3IM0AhEpVCWZEmGPtixG3JpqoNPH1sZRQTub1yIBzMrLTzYkz4hE2GZ94cQpQRzmo8XaNKgKuh90b3vkEcQY5yAiiClb/T6LflT5EYELUDM1lt3C7Xhtk0a6dhFoCcSoaHzspLtCE5b0jiaexCJfZ2DP2PmO6wNkX6MbuVYk9N8WWWEVS5pGyBIaXUMSDRu3QPjCTDPodWRPf6jzhxysr4u57RqdKvKScKWvxQIkvZQEq6zRYDX2w5m9unylSZNuU8BPp7ee9LQFuiwTyrwSuIOHYCAkxr/nrU1e4+FGK8bCW7I7qEnUp/O/MPW1IehbmFfNjV5PgWFhFsA7f6moZqQPJrivuThTF78cb9q1Uhas0AFNHLwfb+2gOP9kOUu9lCE7eYysNY/2Gp60ZNXtf40FuuGJjcwoNkbjUzS4tqOZ0h9/C8nxaw0MvxPUA4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XkAx1NIn3er6XGi9R/fM0i5GixgYW4AKMZfio/XDU/wXQ1IyQuLsFe8FgM4G?=
 =?us-ascii?Q?A8/tF/+2UlgBJJmFrZ7Hbl1MnAABkJpAhfNEwtlIVFswh5EXgzUUYSa7miUU?=
 =?us-ascii?Q?X0YES6lJK0JgfO4uYiok85qTijfAl+zJNVBIBHdddFHgEzO++Lzub5t0qJ6+?=
 =?us-ascii?Q?eD51pxA7zD6WtzvRGDaEYu4krbh32YDcNNmKnUgca6yFYkibPniKSk4HuTct?=
 =?us-ascii?Q?AdG9QeqhsQ1rbBVOZPexp5ZnStVHwLlNvTvapdCLET/Rio0MqEz3n8/sh5Z0?=
 =?us-ascii?Q?ymcIBbdyC0OHdylXG33ftlLw9vjl+3wMvtBYW+YG1gHa4Al1vdWDggmQS51l?=
 =?us-ascii?Q?84ozwlVP+gpM1sCde+V1sltrdvHqx7j8ocbHGgE7INYt8DYYcbr4rjLFaAyB?=
 =?us-ascii?Q?vaDuxkAKRvIXJnioH57Ri0sg9Nr1eY7rXs9zzhNZsYj+u7VdM9cRXyxXv4qK?=
 =?us-ascii?Q?M7/kqxBZoWg2Num+QvJ+wo1H72EFFy2PNZho0xNtiKcJv4188ZfLcmhDrl4a?=
 =?us-ascii?Q?ev01INX59qIvExLwAYswArn8uPz1pOapRsIU82js/qFcW0Siv4x6bJvjd5/9?=
 =?us-ascii?Q?d2qzLurjhWwFsi7/SzKL/j/H6lXmw2pPzqWRSEwoE9T74J5QRzplm+8AWnv4?=
 =?us-ascii?Q?jkhi8h8w4/dOoolyC3Sr7tpu+OvR8RawmcgDBVXX6OKU/1rJgXAK/ynOE4XR?=
 =?us-ascii?Q?/zYJlIKQEnJ44vtX+Hi5y9xdsiYHDvy+1ILSIQn1hOwqwScl3KsaOXBFZwf+?=
 =?us-ascii?Q?3+gWMfJL5FRqplgSPeQa+OspGLvV1s2VEV4U15pvdMc2269l0q9FG9znWZdC?=
 =?us-ascii?Q?fbV+48XMxv7JqwMUu+w6BuVrJ52J9zg9cvf/8WcOOtJbH2HKP3pLhxoWIcCn?=
 =?us-ascii?Q?V1IBxRXnA5m9Gl/7jay5zDGytu0PHaKptEOSgW1KD7NNrg1PGVhTDEaq/Tfn?=
 =?us-ascii?Q?iTk5xdPUoe4ZlCK5FOyLKpTTdtAFiUWcSHRp1Txu3Ak5/t7FW7BY05f3MrrB?=
 =?us-ascii?Q?7i/IDSYcJgoI5HdMofpejqHpY3CmjjG9AQVEFucHnDPVYKziQqMxBUTWEeLF?=
 =?us-ascii?Q?vTTXSOp/+X12GxGe3IRESWvbCgFfBizTkr/AN7HMVVUn57jxdJAbzklCYpi2?=
 =?us-ascii?Q?ezFg6+LVnU8jK1/vFkH8x12SXXgu4il709v7Q+xdCb32LHodEMXjW8i2cxLv?=
 =?us-ascii?Q?uQU8wENgUi5N4HQOBmUMIwEXQ99mfEOWJqFSkaN70qWxR7I8UBld0FWiXKlv?=
 =?us-ascii?Q?IN0y1/+NJIzsjrX+ZiTmIooIzPinxGfBqc6135W2bwA8se3w2l5LcoeIap92?=
 =?us-ascii?Q?Dj+cyeKtvdzmqSk7O13FFuez95yyXTb7sJkoLq+eLwJ/q/5koHNJ9fmCwTL2?=
 =?us-ascii?Q?uWFdOISd+spYCuJEm/hPk6GmYMJ1FY9Q1809onyWQnZoZ2gl0aJxyNlaGwhO?=
 =?us-ascii?Q?iJyruj0x0pmG0ztWUobMs0+H7USr8/Wb+LOwqeix8tPMJjPFqrsa572Cuxay?=
 =?us-ascii?Q?Go87vagdA5DFE0xVjGMAa9R5IOx6KjKkUDU5ylwt2c3BdQQQ0E2Vt9VwH789?=
 =?us-ascii?Q?dqH0udIBlZwOn4q4EtKEm7wrxkc8SNL/G2vJKgGXt33PWH0I0wclRulKsjkk?=
 =?us-ascii?Q?2L6VSkLxh+zfehiXnIIowhW90xCEi8vvK+N32B+/RejLBqUlfwE5xCSpBHEx?=
 =?us-ascii?Q?No+C0WxngPHGK0bbFkJ6ANB1Cu4qi+IEMMPH2QECyGZm/cwb5JoY7J+6Kwyr?=
 =?us-ascii?Q?7NkhvK+Xjmf1QwoMSi8eOC2DX16Ovp/+WsGVAEBavFLclxHMWQIn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e002ee80-df38-4b39-be47-08deee5abb81
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 16:50:59.7705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgans9HU2wyn3Iv3e4PGdYLrnu/1FMUr4Yy8IrIyRlsOR+h5e9lceKlhTmOhGvleXzSwbRPkHlsYQdsnYfc2CzKOD/8fWovox10OkXJOLHGP8nTi7pjQ6oV7uvV4s5Fc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11586

On Fri, Jul 31, 2026 at 01:07:01AM +0900, Koichiro Den wrote:
> The interrupt-emulation virtual IRQ uses handle_level_irq(), but the IRQ
> descriptor has not been marked with IRQ_LEVEL.
>
> The interrupt emulation is somewhat unusual: the eDMA interrupt handlers
> dispatch the virtual IRQ for every edma_int[] interrupt because software
> cannot reliably tell an interrupt-emulation event from one caused solely
> by DONE/ABORT status. If an interrupt arrives before the doorbell
> handler is registered for the virtual IRQ, the IRQ core marks it
> pending. When the IRQ is later started, check_irq_resend() treats it as
> non-level and replays the pending interrupt, causing the newly
> registered handler to run for a stale event.
>
> Mark the virtual IRQ with IRQ_LEVEL so the stale pending state is
> cleared without being replayed. This was observed in pci_endpoint_test
> as two doorbell handler calls when the DMA-variant test ran before
> DOORBELL_TEST.
>
> Fixes: d9d5e1bdd180 ("dmaengine: dw-edma: Add virtual IRQ for interrupt-emulation doorbells")
> Cc: stable@vger.kernel.org
> Reported-by: Niklas Cassel <cassel@kernel.org>
> Closes: https://lore.kernel.org/r/ampndLtU32ODmncX@ryzen
> Tested-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/dw-edma/dw-edma-core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index 89a4c498a17b..ec097c68cf5f 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -755,6 +755,7 @@ static int dw_edma_emul_irq_alloc(struct dw_edma *dw)
>  		return virq;
>
>  	irq_set_chip_and_handler(virq, &dw_edma_emul_irqchip, handle_level_irq);
> +	irq_set_status_flags(virq, IRQ_LEVEL);
>  	irq_set_chip_data(virq, dw);
>  	irq_set_noprobe(virq);
>
>
> base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
> --
> 2.51.0
>
