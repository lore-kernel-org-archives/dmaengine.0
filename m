Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012017.outbound.protection.outlook.com [52.101.66.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BC94A8A31;
	Wed,  2 Sep 2026 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362961; cv=fail; b=BTtmq8lxylm4f0a2qQo13DrCP5StixrTlvj5u31KO0x8oTr8G8tkPcepCUVsDBD5HrcVyxaat+Ao60zzV8AqET6Tn8PhEDDcfZ998vo2gcRnsCEFLsN/d67JW4F+0Fv442YF09x1fA4xWnOPomONuKeL3cjo/gTL7DY6vM1//0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362961; c=relaxed/simple;
	bh=WSzTl2MUsDGdQ5P0sYaWitBexdNV12GNejxDbRaBOAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qmB17enpKr+6Wmfnks/kjkbAjrFca/fD37ppH3uOHZJinNOKy2tDJvW6Hbe7rYybViFwPHUmVcU7jtOLyneEcdtHPvuyulsDVpke1DT47wZf+nOTaLGzSj26AYr+uqHyVB90fZf8WkxhuGewFJgt0kJcJG0yw8BRUisGYUOiajc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZiAIqIzP; arc=fail smtp.client-ip=52.101.66.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZiAIqIzP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEsVWQkEjaGINTJiMxVqmvcgEq7XnpbQpUkxlLlTyvu99KJ/OxUKvcPgfRDGgm2FJ9LTJazHGEeMJX8VHxQZ4i4Yavd6RbufxKYnUloqKzcUmuwWH0Hdc9LH67yUMRxmUfzoG43Cffq0iNGx9Ewx4yjI9+ATeQP0SQVuicm0RgeddxqLEGvVGI7MIt09F1PI6fkUadCap6lI4qZ5Vm7ffoioBk2aVLrmM5n6QQRhF2Ib+pB8h3E3ivziBZoSysjBzkWuwRz//8oDs1KI+POdN+yhLvufuqOQejKCbPuurE2h2cdJSpn/XW1u8i9dLMDrCMl6vGovL8617bMtE+R25A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWfsK9b0WkmXsxiDww7TVunK3VNgRR5yendJitm8tig=;
 b=Uj2rpUPwsEODl1iJw5WRMyB7Sted6Mg9NHtJGozT+ipEe0Vok4VyA9pe/Zy7hGh9dLJ/JYvm/98ter3eenktcYIBAhHeuZsOMZUxFlDhiynSGtGkNg0wCwoQ399xl62Lqz8rTJW89mJgII9q6xq8MD4G9vt/PE6MMUOneQrkCfBQvASrn4F57KzfywlHpJf+SoZbgha0kArqeK76i5ckJH5JvUhDN7F07qECFRW4OuepFnB20lR5VIJYSyVHmsFEZbfRz9wGf9Jehu0QgzwSzrPD6B2JTfrr/Pa+LK01nYobvKXL0h4iNYoYUbUrxmwroUkkyYV/sJA6J0439KZ4gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWfsK9b0WkmXsxiDww7TVunK3VNgRR5yendJitm8tig=;
 b=ZiAIqIzPygDZYRDoGLcOUN8iJXE7/I8gRsLEAKh3wbNEbxxo8xj98tGPwMrCVtt/6lLkAJ0JsDzxZ34riuNEdgUDMzOtzDifR0KPKJC/IjFmOagJCp22XE+3MGo0UjZ7HFt3sAMdR+TZ73j7pWmNMS9dWaLFcRmu8V46vogbsBwvhFiNQGjXofanb35wKIAxlWFb+RoblbPiEqSoVgRGwL8MAXqjwT1r93ooYbWvFHD+xicdFghhv4GloDeZS8z7F7i7Yh08TDW4c4gFkWjoSkIu4CrR68fbhg0nkqZH214DyeYQrYUFhuRJr4TbSedqOjyIDxFE0EUgDWATf6aWWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by ZR6PR04MB910871.eurprd04.prod.outlook.com (2603:10a6:910:dc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 15:29:17 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 15:29:17 +0000
Date: Wed, 2 Sep 2026 11:29:09 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Colin Ian King <colin.i.king@gmail.com>
Subject: Re: [PATCH v3 16/34] dmaengine: ppc4xx: replace irq tasklet with
 dmaengine BH
Message-ID: <aphAxXqxOLaz5hr_@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <476a24b72cd4aa6bf62b120fc80965830616331c.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <476a24b72cd4aa6bf62b120fc80965830616331c.1786384168.git.allen.lkml@gmail.com>
X-ClientProxiedBy: CYZPR11CA0004.namprd11.prod.outlook.com
 (2603:10b6:930:8d::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|ZR6PR04MB910871:EE_
X-MS-Office365-Filtering-Correlation-Id: 14861b95-fcbf-4ad8-7509-08df0906f373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|6133799003|10067099003|4143699003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	BDC8LUjJ+7Qu8e9udZaXJaPVO9KxInjDzU0Cy2KGdF8pgl+/zf+ji9ns1PoMQP3mj2z42q3M7hXolMaDw7MsTYwy/Y+sI49BRD/tFEgr2VaOd+sWbC5dstQczBRsKh1Gz8/Zf2NTazTwFaNDA8qCIJSr/dmRykxt+U1OEFco7UcJZvP0olHL1bzxkS6wmMRvSl/sKZTWms07NmpFrr53iyCmDyfx45h4jKLl+4qPv/Yi4I4mmX/0DsAfQYlLU5agd0ssm14yTDlw6hib1pa7zCUjMIIOnEFrioafmfS/xWoq85bKQ0dMvhb90g51oDyX+/i4wMwU6SCEkYZHdIrAbmaZkcUpB5OZYwMMivFTVEsP0HjWBd5fagwvYY9QQ1zCJgjPNqKhcyDWLk3On64P7bpyv68iz5UudgtcndfaFI6lrbDlxTUVmiX8OMpG1b6ofRAH+viOFIqjaetynYLSKyTSZw0Fe5jpcjDV52ETI7E2W13ypakUCplx1Eea8XzdNL3VFQe1QjwPJPZk6LDP2p/zEjuV1zMvpZPD1qXCmkHem9+Bah3anD4+auaiXSqCdMUo9IV9h12IOqtvQlAQW+anhCY2tkjVoOxTEnVg9FeDUw7eF/54F0rNIfWK/1bYe1A4qhvcTpNdlEyjqQUuiHyEV2wKSj9uYmmTZO2R+XE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eSY5AJ3d9GCQxjG3zOxtiWKc9wEP6Z3rYR+HMN0gTLhQ20BGs7nNc1HSvUrI?=
 =?us-ascii?Q?Z4LauBKwytV9zY6QmnGR0vZad5PRkXDoThiJ4M0a9Gr+FZY1URY6tt0RtEtV?=
 =?us-ascii?Q?q++8gQE9jTVvAQILMVfqSTiG95T8TXcZ0Oha3LYB3jIa0Plba46WzUKlbij9?=
 =?us-ascii?Q?vBwe+mvPWif6fOERLmjyeAR0+YzsUAyiXgpF2EtBZH63G91Si2CnqQ20oVRS?=
 =?us-ascii?Q?HBUdpPOuInWZYpHloQUGR1koIpPY87L9CwH/J+w5JH1p98pPACg5awG3Ga3t?=
 =?us-ascii?Q?6vYGJrJY0lodcFv4cx/PnfwsWoHYILQ7v5agRdEDwYaGfFLdAqAIkaMo+6+v?=
 =?us-ascii?Q?wcdm/t2G22Vgyh201bbUIsVArxTG0PWePChaAmf+OppUMA0+GfzA1lpqxoTx?=
 =?us-ascii?Q?iBL6SmsjN/B3w0cJUYP6KaMFXvTqXvMbMPre49LLiXnuIs2HRhlzYrqIFcQ7?=
 =?us-ascii?Q?j6gK1FaO00d0SEIAEJT7jH3hvFReKNPpRQ75wN31K38TSMW/JvGni+AMcMsk?=
 =?us-ascii?Q?1pVytUKxjN7IGd4qmAFzGUIuQzvXdAo0f/2Yk5iyWGHiJK3BAonmDaZe2ob3?=
 =?us-ascii?Q?FNhFdPECrHSJr+pW6Kme/Jh7FNNDd9NmMEuL4wF5+BzyAbPlSJA4tVGVPQfK?=
 =?us-ascii?Q?kHLj17KXF+Tt8ToV0Vc4cIlUwjhzo/CoW46XXNN+nsQMHRgtdBuZCG7C6qLJ?=
 =?us-ascii?Q?xFGSy2lWfNgfnkEgHIOlev9qJMe5rHkV3NMh4HJ0xizh3iGxpfz49SUj03oS?=
 =?us-ascii?Q?XmmfL09dgSI7gn4pj9snN1GKEsGJGrwk54ALBa5EVj7DUA/2rRIl/arc96ZM?=
 =?us-ascii?Q?YnjZKsBxNwSwj+HmZe+CvPhNmxsx5wKk5qTZDKaKN8A11qHheVBk2cX1jXSW?=
 =?us-ascii?Q?8R4OB0ioBHqydTKtldAVfCM+6UbCgkfEDHRQAWSXMkhq9eSmo8mRHmphpu8A?=
 =?us-ascii?Q?qk8Hgm51FsT51ZBu0Jahw8bar/VmHQsoytLrlNW2Ki+JYSV3amedlPskhusP?=
 =?us-ascii?Q?XOewimqGs3YBXGjhm/xqSjqXoQSdJL8ZJ5ZuXwXvvKqSnn5b3UIh8gtr4mmc?=
 =?us-ascii?Q?DPuO0PJ1fuuZUNEuSpQy2ifxPTy31mjOB1u3Js1UxD5d2zKYypIbG2pAORDR?=
 =?us-ascii?Q?n048ScoJ4ODXGMprHCHvUffbdz5i6rhPnl2dKuOWdi96b1mkl58A4luqDDgl?=
 =?us-ascii?Q?CLxHl68w7DOtYqhKgVz9HjAhiuDa+YZ7xEHmwwMU6/eN3BI59ftNLG9lXkW5?=
 =?us-ascii?Q?S4j96+4ZEsHP4unpKn3F6/1EzzePNdE2e0p6834aq1c33xZPf38WXuBsIvDS?=
 =?us-ascii?Q?faFtoEWPrttK0Cv00aJNQY65jsS7xGbkNLCaySOrSttp7vm+jOqYmZq2HGSM?=
 =?us-ascii?Q?SQrrQstmoiN6rDUQqADb8dBihS4FYyk2misgsPE2fWz52gdYQrjiNQJLTpRO?=
 =?us-ascii?Q?N/YdYj70VIdwvZqUVEUdP4kdwwr1OhwCVYbDIRzbJ7/O6dcoow/v9IB8RNdj?=
 =?us-ascii?Q?3YyCC53gVNnSg57D6JRctzjTPc3UEvP5lpBQk2nV1ytSGP5N1ohF1JxagsHs?=
 =?us-ascii?Q?G/OwaqJZkpFkuNp0+eqc0iguASU4u3Y+dyVftaxU/ONCqw1++sh4Zzm6PKie?=
 =?us-ascii?Q?04x+kmzr1ZCH0kZ2c6ZKxbxxlRY28yg2A1+FKJQTJi2PdxBdM7yUOSKRrVZe?=
 =?us-ascii?Q?d2FZOXJvbNCImIG/zTepBBKvV0N1udTnqR35XttPiun9RG0w6vsQoq0MD1+T?=
 =?us-ascii?Q?KXSbh24Dh/nFOvsMw6mFvtUGOvfhL2OhBhO8UqyIEjbWtEhB0b45?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14861b95-fcbf-4ad8-7509-08df0906f373
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:29:17.0306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4NVmq7jHaj+JyCplr9eSpNxaJ3Fi21rK7Y4wR+wT1fDw8OrnUe7ZfXtU+qTaKf9oVHorRx4TVkwvKTusqi3kcZyflPoF1LSaSfq7BNKLf6hztIRFtEP7RHsLDTIBZEWU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB910871

On Mon, Aug 10, 2026 at 11:09:17AM -0700, Allen Pais wrote:
> Replace the per-channel tasklet with the shared dmaengine BH helper.
> The handler continues to run in softirq context while dmaengine owns
> the common scheduling and teardown mechanism.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ppc4xx/adma.c | 14 +++++++-------
>  drivers/dma/ppc4xx/adma.h |  2 --
>  2 files changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> index 279a431ccae3..bc10c2b5dd12 100644
> --- a/drivers/dma/ppc4xx/adma.c
> +++ b/drivers/dma/ppc4xx/adma.c
> @@ -1658,9 +1658,9 @@ static void __ppc440spe_adma_slot_cleanup(struct ppc440spe_adma_chan *chan)
>  /**
>   * ppc440spe_adma_tasklet - clean up watch-dog initiator
>   */
> -static void ppc440spe_adma_tasklet(struct tasklet_struct *t)
> +static void ppc440spe_adma_tasklet(struct dma_chan *c)
>  {
> -	struct ppc440spe_adma_chan *chan = from_tasklet(chan, t, irq_tasklet);
> +	struct ppc440spe_adma_chan *chan = to_ppc440spe_adma_chan(c);
>
>  	spin_lock_nested(&chan->lock, SINGLE_DEPTH_NESTING);
>  	__ppc440spe_adma_slot_cleanup(chan);
> @@ -1754,7 +1754,7 @@ static struct ppc440spe_adma_desc_slot *ppc440spe_adma_alloc_slots(
>  		goto retry;
>
>  	/* try to free some slots if the allocation fails */
> -	tasklet_schedule(&chan->irq_tasklet);
> +	dmaengine_schedule_bh(&chan->common);
>  	return NULL;
>  }
>
> @@ -3595,7 +3595,7 @@ static irqreturn_t ppc440spe_adma_eot_handler(int irq, void *data)
>  	dev_dbg(chan->device->common.dev,
>  		"ppc440spe adma%d: %s\n", chan->device->id, __func__);
>
> -	tasklet_schedule(&chan->irq_tasklet);
> +	dmaengine_schedule_bh(&chan->common);
>  	ppc440spe_adma_device_clear_eot_status(chan);
>
>  	return IRQ_HANDLED;
> @@ -3612,7 +3612,7 @@ static irqreturn_t ppc440spe_adma_err_handler(int irq, void *data)
>  	dev_dbg(chan->device->common.dev,
>  		"ppc440spe adma%d: %s\n", chan->device->id, __func__);
>
> -	tasklet_schedule(&chan->irq_tasklet);
> +	dmaengine_schedule_bh(&chan->common);
>  	ppc440spe_adma_device_clear_eot_status(chan);
>
>  	return IRQ_HANDLED;
> @@ -4137,7 +4137,7 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
>  	chan->common.device = &adev->common;
>  	dma_cookie_init(&chan->common);
>  	list_add_tail(&chan->common.device_node, &adev->common.channels);
> -	tasklet_setup(&chan->irq_tasklet, ppc440spe_adma_tasklet);
> +	dmaengine_init_bh(&chan->common, ppc440spe_adma_tasklet);
>
>  	/* allocate and map helper pages for async validation or
>  	 * async_mult/async_sum_product operations on DMA0/1.
> @@ -4247,7 +4247,7 @@ static void ppc440spe_adma_remove(struct platform_device *ofdev)
>  				 device_node) {
>  		ppc440spe_chan = to_ppc440spe_adma_chan(chan);
>  		ppc440spe_adma_release_irqs(adev, ppc440spe_chan);
> -		tasklet_kill(&ppc440spe_chan->irq_tasklet);
> +		dmaengine_kill_bh(&ppc440spe_chan->common);
>  		if (adev->id != PPC440SPE_XOR_ID) {
>  			dma_unmap_page(&ofdev->dev, ppc440spe_chan->pdest,
>  					PAGE_SIZE, DMA_BIDIRECTIONAL);
> diff --git a/drivers/dma/ppc4xx/adma.h b/drivers/dma/ppc4xx/adma.h
> index f8a5d7c1fb40..9af1feaf0b9a 100644
> --- a/drivers/dma/ppc4xx/adma.h
> +++ b/drivers/dma/ppc4xx/adma.h
> @@ -80,7 +80,6 @@ struct ppc440spe_adma_device {
>   * @pending: allows batching of hardware operations
>   * @slots_allocated: records the actual size of the descriptor slot pool
>   * @hw_chain_inited: h/w descriptor chain initialization flag
> - * @irq_tasklet: bottom half where ppc440spe_adma_slot_cleanup runs
>   * @needs_unmap: if buffers should not be unmapped upon final processing
>   * @pdest_page: P destination page for async validate operation
>   * @qdest_page: Q destination page for async validate operation
> @@ -97,7 +96,6 @@ struct ppc440spe_adma_chan {
>  	int pending;
>  	int slots_allocated;
>  	int hw_chain_inited;
> -	struct tasklet_struct irq_tasklet;
>  	u8 needs_unmap;
>  	struct page *pdest_page;
>  	struct page *qdest_page;
> --
> 2.43.0
>
