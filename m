Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012043.outbound.protection.outlook.com [52.101.66.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0DC477298;
	Mon, 14 Sep 2026 15:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401142; cv=fail; b=GNjSVMizesV1m5j7OoqTznO6Xm0Fea+lEMgUUwiXaDoskujeO0B+h4Ykbzy9pTRCsGpPcK5tMIpF66m6ZjHiGx/lpQJw0+UN5iZyMUo/bIxMU3Ag2758XAbBtbIJEv+mB0++RsbPQQWQ41yLRgL8VFAmI+h3aSlL1RdYmRktjd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401142; c=relaxed/simple;
	bh=ghz8s0YMRDWcUcX9hC2jRvzSmJcceu1+oM7c1hnzNGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jsT7EZ8n68TJC8M2zBly4EI1tkvab63Y166ENV+/1Q+IZsr5xPZx5SmFze2JR4BXF6MXZ82dfdaCuuC2K+RU7Y0SSh8IXNG1KUhIwy/uQJ5MQYjX8hxs9mMgK7dXwYuNJUeQ4ftd5I4MGT9V8n+ZPkQnwNAPtoDwPCKE5ZUg56M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=E3XQ/LZn; arc=fail smtp.client-ip=52.101.66.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="E3XQ/LZn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Obcb4s9UucIv6DdsJLL6LncYio/9VfaXPhoOx8Vg7CnQSFIXM6kC8t0WF4sZ64dyCc1UDnI6ZaV6GTOMJbVu1V/CZmE2+1lbbP2oTlmAIPEIBu9jUkFRT1DO/Ty362Vd3XXsvvTb3sivzKQ2Yb/8uYQD4iG0TFbfAOF4aA6k+wIcJxfsmTVI0cd5UPT0OIWEj2oAvxT3cjLEY7NUAmCAF1fbnq4sww5Lx8ekoww6p8fj0voecVQxA+auhXOS2imrruDvUWRs/g+ueqBnfoSReigN1CN94CP0+jTIlfYe3KQnWVfQlIFr7ET/hdUICYr1k6vFFR5snKjp7c3zo7UNDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nELR4hq8sKD7uNoJlfQeik8UIf+0AKwjw/d/HTlf2ak=;
 b=XlHvCISyzw+oJlqgycgcpQtQZlTRGPsrruXyYbxM4piBu/Tls1KagkRfQC7mnFsrQOBRdpEhwPLtScquAA08RthozsyL9TkZwULsGQ8ovRSJ4beKmk68qkuOC1jzXeFE/4U6OaZDOCPs0Z7E8xTMCM0vFcxqivAsiN+7iMkhilYszTAsD28kLv1RkLD8KbTrFzbl76IR7wGPtH5wwlr61gJqvQS6oGTabNgE4gqdl3ld7vZAznD5i6aBDcR8khj8Sv+MLQAysMfSjTN6dApfMiB8CfSbeHWUE+tvPR+MQfMgLpruFeGcy5Kbb4Plkk4yXZmnEJ5A/YFfqokxKSiVLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nELR4hq8sKD7uNoJlfQeik8UIf+0AKwjw/d/HTlf2ak=;
 b=E3XQ/LZnk9a47O6/E0WGoP5TqSe+p2Upp33nq/oim5k+twkOY36cnFi4zo+fzxbKB2FwAGgPcMJpgvcUZBlFz8zQbttfTBGU2wd176341ifqkbvXFbb6NxnvA9OMwazgOxqN9Iy2ANidRmfy9H+vWBjw4GjqteExwUmaY/kyCp/sz7b0zvciBkZvrJw9LORlfC1sryVilM5IsUzSGOa3K1fC79MNVcWJfGOWSh3lbWhaKM28ZaLUsBxpJZtqXwAhgoQOFnT2gRBkSZMQlLjGh/Gj+zl8MAHkClBdKRV/G2Wln5UHoK63NVS0GFw1gG/r/FbeS5fETZhE5klAJSzToQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBAPR04MB7303.eurprd04.prod.outlook.com (2603:10a6:10:1af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 15:52:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 15:52:17 +0000
Date: Mon, 14 Sep 2026 10:52:09 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] dmaengine: ppc4xx: use devm_platform_ioremap_resource()
Message-ID: <aqgYKc5ViiWynzqS@SMW015318>
References: <20260911220640.178074-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911220640.178074-1-rosenp@gmail.com>
X-ClientProxiedBy: CY8P220CA0038.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:47::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBAPR04MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: d7839299-4528-4cca-3e2c-08df12782743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|19092799006|366016|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ld1pEhYmsB92fXiVXzf70+3/nY5rkVWkZ/9aoHGkvowYfiWdizv3rlT4Ad8rm5N8z3ycKIwS6OeKSgf7PIR1SsHCk7e0i6dwwEWTRNnUM0iiaQuuxW/axdnnWsyUUPyMivbtofJgchZrbrbg/rcI45wPzZ6XyETRE5AszpQLM+fIIWOsZC7o6YfM0dBRD4DNqahg39HT+57583esKXctWPhelqrfqc0FKSrS0nCFatqoN6eVfSl8zFI4f0fNMDIPoC0khi71nYht3rWDmb9OZ8MU1Df0MpvFzBD9rVti+RTkcsbA6Yq26v+Wl5ENuYmbIqREO6jCLBb5yB302jEeezcgG9hmJYFceHLhNih6iptB4wp0bqg4/Iu2W+k/dPN0GWxRTcNRBB9ANes4dGZiz5YFPWSLSnoeiGPfg0cep/8zh6r+YhiR2YQeaWw5Nony7vka9ascHq0dBb8bT0TBSWL3HgSkKHLZGLoV2A4aGOo2gkNHJpihru58ftA81gepm1qBOyFPIFE6YDvzADnfGbGSmKabSp64wAkktFz3raPSkd781CmBV5xO2YaH0oCxVM3gvnirrAd9dCoNjTo89VkOTNh81xzg/NDUC+wok5BbOP1H2sCbhF01uSo7hXlOL8zKyj76Ix4hH/NmMhJEARD5gykKXWQj9O+52Tp961w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(19092799006)(366016)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K1dqFdKM5sDFtiYzVTP6rTr9zLivTW1P4FN4RjUFWREEdma2NXzT2Fj4es93?=
 =?us-ascii?Q?Lhl6M26bCbOkgi/3Fp1hMK8C4549kcJhpaGiRUc4Lf70km9Fjf67rqR+BiHi?=
 =?us-ascii?Q?s83l8H+bVuaY2jxNcTgisNj2lPMLT7raSENW0w5Ls8uF1Kl/N+5o/2Ls17s3?=
 =?us-ascii?Q?VGV3t6uVOEv9DlfOVCKTeB+UVkTchc8MCTNDvgzQa7EQs12TXON+5zx5NgbI?=
 =?us-ascii?Q?SdQ78OcTZA8QWvP25YnMgj60cbk5i/lC0JSaxLhuj7TdSqEnbrloqVebM4S8?=
 =?us-ascii?Q?VHnOIgzAUBJN3EPWejISPt4vufF68ij4i4MZPkKsxDwUubrGOS5A8RVxJee4?=
 =?us-ascii?Q?2kuFsN4eGL0AATM3/FItt1RdkuwacgsoBrp6hbocGBB91CEteqJDTT9vgqku?=
 =?us-ascii?Q?/KqII+E9IfwfVywnZefwczRqpIgaEvImSvc1dpqlHz7iiMC6whh50ybJQkfK?=
 =?us-ascii?Q?lBzKMXf8dIv0bHFIaDR5G/NZIdhcjYHMBgcdbjLEXv4S0kpjYatnO32MUqxN?=
 =?us-ascii?Q?zlSd2B3NkSLP+Gp4cvph8BXni1IPI1NanEnPWZ1hkKFw4m4RizWQ8TbYA6T6?=
 =?us-ascii?Q?tUpqbYnXys/wc2atDJcjaTiFDjjt6pa1A1OEPtkCkviOQU1OfZYCKkrWwkas?=
 =?us-ascii?Q?lOe5Uz6KDwnlqBxvvcCRneBfmNu8ysXph0f66iOHidTYABySK5YpM8EQ+J5Z?=
 =?us-ascii?Q?nvcsnZlFt/JQhvm1tV+3nUuXhtXAIHblljq/XqkvtdX0QmD+l7BLPwIeAInz?=
 =?us-ascii?Q?I0LNYTufzJtACiXF1FsJ7NwPRdXZXQnTvHUMdLCZkLfN7EFDixEr2OaeIAgC?=
 =?us-ascii?Q?Qqm4Plc81bf/BIJ2/i6VHKDKpAQQR9h/0T5e24C6+hedI2ZZGdJoG5Eg7U21?=
 =?us-ascii?Q?VWT8RqfNgIy7pEIVWIsadFNhkj048IAKYS7Ei6GFM/uYNQD4D0iBUu9sT3g2?=
 =?us-ascii?Q?LjLQdQJrnWEeWX+fwH6G7+8Ony6rEurq3WiIb3XZNtR2jfCdGRn2H5AzFpMr?=
 =?us-ascii?Q?tVoME0mlIim/eNU6OhVYXBp+l+2w2Qw6WfkRpPm3jZwUUPc3/bGYxSRCzOXa?=
 =?us-ascii?Q?vigR8YN38h/Duq/gqoTo2XifqyfRVuJhxKAE9s73c8Gn4KLJPTEWXxKzslyh?=
 =?us-ascii?Q?olZTNnn5pwvAzWQR0Zlvw/QROSxwczKhpKGwRKyahRwUrGenRwoE6v3XUS4y?=
 =?us-ascii?Q?4j3nWjhIaoaZ+xFID1UV0ABVfkP1sNy3nCYIHnQuobOoZy5qmiMR4UIxIVNe?=
 =?us-ascii?Q?o2kfCrjmlPr5ezw9x+COwlK9y0yWN8J8o+Sn/TllZUACBMu8dcpm1UOL0CyM?=
 =?us-ascii?Q?1r5DWdzX+zBUvOuKntvax5gcz5iMcSXos2UltW2o94g3zdD1ScHbRbEzh77S?=
 =?us-ascii?Q?D0IBsUS1zXipiEFNZN070whCHKbeMqcNvIBOKh+3mxPJ31vPqp7upbrFJnl8?=
 =?us-ascii?Q?kLJKLaAbRUl6kubShLJxWTnxiUKgava8wlxv+BUJ6ZeLVi1Vqe0oHduU6PUA?=
 =?us-ascii?Q?7rQ5MlCgwxou0ymoc0AQdyhi5YAh1kxGxHpJSaRJKfi8kDIlFfmSQ0X8WJy0?=
 =?us-ascii?Q?k7ueDtOLo7AzmmDUcJmDlw7QPoI+DpWJMOJAKmUOrCjvLR+AzAo+LhtRSD2c?=
 =?us-ascii?Q?4md/tplNUpaAyvWv2yChjCHT9MT8aZGpSwmRgOZtvVd1aa96nk347EpRILjT?=
 =?us-ascii?Q?7H5D+KWPLS0A+0XOK2HwkT4ADzcUcPnkEjWcN8XRZi37h8DXt9WNzT1+fsNi?=
 =?us-ascii?Q?EvNLovfEvO/iPJlB2eG9X18JWp3c2LPQQpWcDKWRs7FoZt0DLMt4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7839299-4528-4cca-3e2c-08df12782743
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 15:52:17.7979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KPaYNl3laXHFyDPK8uBMuVCxusGc1z2xfXnl+XNOlagN4PCm/LkXB8OWk+Xz1J735VCZytHx4bVKIG+EyzwoBY4uEonG4Aio2GstBlh1EjA3uzE7mgA9fLVxBza7HmQh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7303

On Fri, Sep 11, 2026 at 03:06:40PM -0700, Rosen Penev wrote:
> Replace the open-coded sequence of of_address_to_resource(),
> request_mem_region(), and ioremap() with devm_platform_ioremap_resource().
> This eliminates error-path cleanup for both the memory region and the
> ioremap.
>
> The two separate initcodes PPC_ADMA_INIT_MEMRES and PPC_ADMA_INIT_MEMREG
> are collapsed into PPC_ADMA_INIT_MEMRES since the combined call covers
> both steps.
>
> Also emove unused PPC_ADMA_INIT_MEMREG enum value

emove?  can you bound all ppc4xx patches to one patch serial to avoid
pick up conflict between these patches.

Frank

>
> The PPC_ADMA_INIT_MEMREG error code is no longer used after converting
> to devm_platform_ioremap_resource().  Remove it from the enum and the
> corresponding error string.
>
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: cut some stuff from description
>  drivers/dma/ppc4xx/adma.c | 46 +++++----------------------------------
>  1 file changed, 6 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> index 39498779e241..17b60704a702 100644
> --- a/drivers/dma/ppc4xx/adma.c
> +++ b/drivers/dma/ppc4xx/adma.c
> @@ -37,7 +37,6 @@
>  enum ppc_adma_init_code {
>  	PPC_ADMA_INIT_OK = 0,
>  	PPC_ADMA_INIT_MEMRES,
> -	PPC_ADMA_INIT_MEMREG,
>  	PPC_ADMA_INIT_ALLOC,
>  	PPC_ADMA_INIT_COHERENT,
>  	PPC_ADMA_INIT_CHANNEL,
> @@ -49,7 +48,6 @@ enum ppc_adma_init_code {
>  static char *ppc_adma_errors[] = {
>  	[PPC_ADMA_INIT_OK] = "ok",
>  	[PPC_ADMA_INIT_MEMRES] = "failed to get memory resource",
> -	[PPC_ADMA_INIT_MEMREG] = "failed to request memory region",
>  	[PPC_ADMA_INIT_ALLOC] = "failed to allocate memory for adev "
>  				"structure",
>  	[PPC_ADMA_INIT_COHERENT] = "failed to allocate coherent memory for "
> @@ -3997,7 +3995,6 @@ static void ppc440spe_adma_release_irqs(struct ppc440spe_adma_device *adev,
>  static int ppc440spe_adma_probe(struct platform_device *ofdev)
>  {
>  	struct device_node *np = ofdev->dev.of_node;
> -	struct resource res;
>  	struct ppc440spe_adma_device *adev;
>  	struct ppc440spe_adma_chan *chan;
>  	struct ppc_dma_chan_ref *ref, *_ref;
> @@ -4040,28 +4037,12 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
>  		pool_size <<= 2;
>  	}
>
> -	if (of_address_to_resource(np, 0, &res)) {
> -		dev_err(&ofdev->dev, "failed to get memory resource\n");
> -		initcode = PPC_ADMA_INIT_MEMRES;
> -		ret = -ENODEV;
> -		goto out;
> -	}
> -
> -	if (!request_mem_region(res.start, resource_size(&res),
> -				dev_driver_string(&ofdev->dev))) {
> -		dev_err(&ofdev->dev, "failed to request memory region %pR\n",
> -			&res);
> -		initcode = PPC_ADMA_INIT_MEMREG;
> -		ret = -EBUSY;
> -		goto out;
> -	}
> -
>  	/* create a device */
>  	adev = kzalloc_obj(*adev);
>  	if (!adev) {
>  		initcode = PPC_ADMA_INIT_ALLOC;
>  		ret = -ENOMEM;
> -		goto err_adev_alloc;
> +		goto out;
>  	}
>
>  	adev->id = id;
> @@ -4081,10 +4062,10 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
>  	dev_dbg(&ofdev->dev, "allocated descriptor pool virt 0x%p phys 0x%llx\n",
>  		adev->dma_desc_pool_virt, (u64)adev->dma_desc_pool);
>
> -	regs = ioremap(res.start, resource_size(&res));
> -	if (!regs) {
> -		dev_err(&ofdev->dev, "failed to ioremap regs!\n");
> -		ret = -ENOMEM;
> +	regs = devm_platform_ioremap_resource(ofdev, 0);
> +	if (IS_ERR(regs)) {
> +		ret = PTR_ERR(regs);
> +		initcode = PPC_ADMA_INIT_MEMRES;
>  		goto err_regs_alloc;
>  	}
>
> @@ -4121,7 +4102,7 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
>  	if (!chan) {
>  		initcode = PPC_ADMA_INIT_CHANNEL;
>  		ret = -ENOMEM;
> -		goto err_chan_alloc;
> +		goto err_regs_alloc;
>  	}
>
>  	spin_lock_init(&chan->lock);
> @@ -4214,19 +4195,12 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
>  	}
>  err_page_alloc:
>  	kfree(chan);
> -err_chan_alloc:
> -	if (adev->id == PPC440SPE_XOR_ID)
> -		iounmap(adev->xor_reg);
> -	else
> -		iounmap(adev->dma_reg);
>  err_regs_alloc:
>  	dma_free_coherent(&ofdev->dev, adev->pool_size,
>  			  adev->dma_desc_pool_virt,
>  			  adev->dma_desc_pool);
>  err_dma_alloc:
>  	kfree(adev);
> -err_adev_alloc:
> -	release_mem_region(res.start, resource_size(&res));
>  out:
>  	if (id < PPC440SPE_ADMA_ENGINES_NUM)
>  		ppc440spe_adma_devices[id] = initcode;
> @@ -4240,8 +4214,6 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
>  static void ppc440spe_adma_remove(struct platform_device *ofdev)
>  {
>  	struct ppc440spe_adma_device *adev = platform_get_drvdata(ofdev);
> -	struct device_node *np = ofdev->dev.of_node;
> -	struct resource res;
>  	struct dma_chan *chan, *_chan;
>  	struct ppc_dma_chan_ref *ref, *_ref;
>  	struct ppc440spe_adma_chan *ppc440spe_chan;
> @@ -4278,12 +4250,6 @@ static void ppc440spe_adma_remove(struct platform_device *ofdev)
>
>  	dma_free_coherent(adev->dev, adev->pool_size,
>  			  adev->dma_desc_pool_virt, adev->dma_desc_pool);
> -	if (adev->id == PPC440SPE_XOR_ID)
> -		iounmap(adev->xor_reg);
> -	else
> -		iounmap(adev->dma_reg);
> -	of_address_to_resource(np, 0, &res);
> -	release_mem_region(res.start, resource_size(&res));
>  	kfree(adev);
>  }
>
> --
> 2.55.0
>
