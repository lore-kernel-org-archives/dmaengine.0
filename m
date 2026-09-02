Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013065.outbound.protection.outlook.com [40.107.162.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EA04A64D8;
	Wed,  2 Sep 2026 15:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363139; cv=fail; b=eUOZ7puozMbzaAXpkPa/rgbhQzSDw5ziBDi292YY1b2IR29oZh6DGb/gwc15q02RzHoXL29wLkH05bQb77Mk2m5VHLz5KZr+rZD3xCQTCpc5T276S/Y49sdcY++fncNktHygxmKya5wqF2Vlvjmo3ehphwrUWu1U1s/uiEDy4XA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363139; c=relaxed/simple;
	bh=9iO56KH0B6WjROj/erPMV1EI0maWRN4uWxusLtCyMUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Abp3jwG4LHLKCblSyRdd1D976E65af8WgUetvP1tRO4MIcH4mFnbV1NLoZTPAE4B96rYWB8MufghEQNzDAUVoUIzHbEDUhfkHk994m6Ha7L6Tioh5eK7q0EAuFkBn7FoFDNwS0Xl+n1QXLKvaCKC43tssPz0Z9WfX97/TDzMt/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=A0jhYcA7; arc=fail smtp.client-ip=40.107.162.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="A0jhYcA7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdCViH2pz0QspSzWYz6mjTCoJJQOHK57pCHNMWRPZ4FycwpOSXFT5gsspbrBccqyGNVcWh1ugBc2EHm6mcGmYPrm46FQA1Gkxu/ElTjuu075ZgKmUDcRZecJVw2LonDyOTdi9uwpo5xRKb6zhLwdbTtdnPNIiMgaB63c94Nw9uZmHmbxS7/fOVFrjYuKFf3MEwKwA5jNLGkruVl00P8G8mCnZ7Hf9i4v0DXUBljcSwyYMBDx2rCJg/LXsI4l3Ld5qr3oCVQa9oknu5Bla/veAgm0w3mNKJrf+JDI6sDMj3QPcyG4qSM9GwUHC7852KeoF+PRBOsS8HyBDDU4xw4kaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keH8rNowhNTHL8/TNA/ktVGVupfgU8Wa76C5v8hCQNo=;
 b=TF8/873Z9uPw/8QdC9hgXAg14kL/e4csWRwwp5tM2EbLym8puq3pN0aTkf2c6ZBzlYC2oStt8PSULZp0+ZfehXVZD166CAoQx5UI3NPeYfbOCJOlKUQSa1CfyI/nTv4qHcvV09QbBFNMXYasK98ms79niulIcbSU5VJBedEfKW0tNKfK2LVAc36bivpIy/91IIqw+nmxUvebM6h5ChSZ+qRjYEkmzw3SxpGH3ZWlBKKRnmnGQrvyqZWqnSQqVN/biKBUvKceonBiZudtQSl6Xe5uNNXOnXvkrrr5dSOZJgEeKlIc1XWSGqfd92sH9XrP9+tnAwgEMDonfAYlkWj3YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=keH8rNowhNTHL8/TNA/ktVGVupfgU8Wa76C5v8hCQNo=;
 b=A0jhYcA7mUXnnJZLYwtvTl2rwU7V7UaYcSa0/MtDAUsuZdYxgiNFqa4jml5a4UALMsJaB6YTKxbAwojoXCkcCfxQywTtWit6Y/0Dscpd2lvn9U40rfdhPYbJb3letQrjcaQl49YLiRaE0N4xIp+FKPBipBmEkUB+IfmEm9e8U4TEhjKGQXIm/wav+jP+4UN5iXZKRxWluk6fJnIvnQNMGWVQavZU5LrSEegxtH2gMJCSV5Axsh/STD9ooaUzF+K2bWPvkOjFQosmkflrsvrfdwr1z7rnyyWK0/HwhQ92tRzUgptJv0xBdoeTV+JghPZErC5g0CT5ugnZRUk1EtE1Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10898.eurprd04.prod.outlook.com (2603:10a6:150:214::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 15:32:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 15:32:14 +0000
Date: Wed, 2 Sep 2026 11:32:07 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v3 25/34] dmaengine: mv_xor_v2: use channel BH helpers
Message-ID: <aphBd1LmqHYMg9mB@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <7503158dca9b831cd8efafd78de3124c3cc7202f.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7503158dca9b831cd8efafd78de3124c3cc7202f.1786384169.git.allen.lkml@gmail.com>
X-ClientProxiedBy: CY5PR17CA0037.namprd17.prod.outlook.com
 (2603:10b6:930:12::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10898:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d7bb308-7021-4d5d-450e-08df09075ce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|19092799006|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	d2fBWexls7A/x0i1rt1XHe3MOW26urGUMIxk+IbCkCRr+tkhucyZqin9rLFU1h6k7uDgC9KsxpeV9geNRbagkWr1x4HxAKlFgC2JxppkOmF3Xu6puUvBSKJEVgYXRPs4v0FZiX9gHwE4OMAqyynQHWivLdBj8/OvacJ/iiitd8oJt2xcJbwPx/Cj4JF79rDL/qTjqjojsWZFVfRGFX1/EFOMBpgE3YH/aPxSPBsOempbb5HK8iR29VLsm3Y2B3ss6yWkPn2MSIayuzUEi7TVGBt3r3b02pYSDrgVuykCqlR9A4+jPpV/JjF1iQWHN71BKhTl/1qhC3aBUrAqqkj6x7FJyYuk5hL6UVZ3hT+IdQd4iVuHEi+ztJHYmqU7uJi02V9l0odCRnGInR6yoWqdgB2FVG1R6gMHf/cbftF40roiOj8t2dj3xaG6z/L1tKqIl6G/KM+rTZryb68s6BXq+AoZgI9sPWV6AqScudGM3VxSz6FfC4bp2h/ZL7SKqeSbVgxSLu4hekQdFd9BBOWd0CXN2+HTRdnZQFi2a1nCAdZJQrdAMleoLKpXWqwtC0gXRIrn/+G+C27vNAzKHHdAoIvter9ZTxaL/Dd/X4HAT9ESN5zHLeLMmN4AgOgFph3ovdu76AgKFQkt4StTw+EyxCOQBQ2L5UFgs99kIha+N1o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(19092799006)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qPNhGn9cY9W1BJBWg9+1zJgl6gQOVyDmSwpchfg0paHZRb9klxENLtY+2uNy?=
 =?us-ascii?Q?4JBBbxWQu8VGrYLjDRjV/fEI5H29X61YUpp6tidmTfMeeMO3ouvd58SOP4t0?=
 =?us-ascii?Q?cQBfH+BAgDTMvlZHpUVpUhxLiSiEfr4Lttmh9DW8O9kC+nXnMEP6oRln4xUy?=
 =?us-ascii?Q?h0Yc6OXjZwpEfHisZhva9wqTJ9sTLWBUyIYqhiUUDkWaXS4AFPOl4N3OABqY?=
 =?us-ascii?Q?8Af2QbG/Vuv8b7ZQpA9ucmTW8BraAlb7p5b1O2VCkwaPCZiHMUo0W8WNTcsM?=
 =?us-ascii?Q?GWF5maQxO7fd6+zDq+53faEsmowqC95GJPd++3fHoijI3aF0YFVY7PskHO/e?=
 =?us-ascii?Q?VrCEKgYEmEr4dHTVlRRz3RdCoF1gNcayxI4iyrXWbmBlQOiWJfKZwYHebImd?=
 =?us-ascii?Q?nxKiA7TVQDun6NasSHOSoYLEp9jKzRTbOTUSfP7yuivXpeN1lMF/FOHeEPFl?=
 =?us-ascii?Q?7sIVMWaQGcUIa1OUK5+Hdt3uE6l6ln4Hii2nD6xhaFyrOA6sn4ZdRJifPb0U?=
 =?us-ascii?Q?LVyXfJS3MyXauA1RXPsi3EQCU1AvNrQCNdj3EQyX14oCR54XYVFufHykZDsj?=
 =?us-ascii?Q?Nz5y4bgwhmeQGyBRCRWq5JR7VCRnGoGkGxGEbqS33rYAO3BxSa+racQaDsev?=
 =?us-ascii?Q?XFv60qBfsjXvCiOxUniDkuYBz5n+87HyeTILwAqdebX4LV7qza5J0cbY+DU+?=
 =?us-ascii?Q?EdcOOBTjV69ewcDrYTXcZD0X1CxJA/RWscrwNiDEexPxlCnSTgSfYJF4PtdM?=
 =?us-ascii?Q?IUOo3QQvDE8CGzAT5BY29KyTcCzAp54C206GUribSVBUR3CQkQqwHEJ90076?=
 =?us-ascii?Q?/dS+MURIUjQU9Z17gL+lfJACln7JaN39qC4E1CYGWBuOub5wkuNesU1M9Dha?=
 =?us-ascii?Q?oKCr4bCk1KonH2oCvfahJ086VBQ0Dl/CUYmrBoMVeTmw0zpcTy6b04tbLR1q?=
 =?us-ascii?Q?QI6m2gz/v9HI6RlweqgwA1rs6CaP4EnEj9a+FFDnzjlJjlGJAMSy7k8S5yd0?=
 =?us-ascii?Q?cAwbKTwvHSMof3vdqn7UBi8DC9IaNbxFD1rkt5OgFzRo2Qhb3WdAliHP/MP7?=
 =?us-ascii?Q?X3LSu3SNNdMDhitDCBXbQYA03SxJ0T5wD8JPboH0prEL5DPeLiy+pmbCGxKJ?=
 =?us-ascii?Q?T9OutyEfp8TAzOESTWt9bm5ut68jUIesB+YRtCKYmVsqRGeN1HxhYLHE6ngh?=
 =?us-ascii?Q?mJWl8cxZy1g3VD27zzD068taw9mr3FwXx4X9EmTY1OWguTT07jx5gU/E4olA?=
 =?us-ascii?Q?ieSgY+P3ooriNXLuVxmxOIWDANi+/Ti0eY5qgzCkJ3fT5BBDEja1kvHlQdT7?=
 =?us-ascii?Q?Nx6QUDNfEaFjPpDWoy0F4uOi2rOzLXLomShaYRkBvGI+x5Zc2PAO3EaGouD7?=
 =?us-ascii?Q?gdfuT80pc2fGlOJbg6Sz/bzlFzJs/wy9J/Cw4gmZCZuC3TL22oZfYV/jDKgP?=
 =?us-ascii?Q?TVcQLJScnSj0gsf67aKHvpeheQ8l5xVC/JE4w2CRzbpwb37DMeVLscdT2nLi?=
 =?us-ascii?Q?WlpAIcigq1DKqA679ElK7iwMYJZslWOGtC11/O0VYAs9WVfeENSHhxVuVMBe?=
 =?us-ascii?Q?8zMhX6rvi/pDfRrRBGgAL3lhVU8KUq4pVdA6xW4B4Y+Y99Yi4epqiYffqCwE?=
 =?us-ascii?Q?bY2w3wXziXFNY/eXy2kL80Q709IMwwNmlRdqAm6hRgjA3iHGjx/NhTvF3kOB?=
 =?us-ascii?Q?QkaIGriDhltvVB5WAiriwXHqzzOsPGsA6q9lVStR4dTvbwkc6lkBaqYm136y?=
 =?us-ascii?Q?2HwLOmpDZ2REKcPSr/LcqW89VYwSGnxV0nz5tvlVlUKeRXe+Tx2M?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7bb308-7021-4d5d-450e-08df09075ce2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:32:13.9527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cW/xjUbxmkcnj32pny2O0GFLC0ljcNgOZuib/Ao0CnFAGGHlNW7M9pQnyPYxxv6oqDBWdTDzytFD/MrnbECeVr7TzcdG4cVOHKL2j6bRBBG4XsSMgsrCQWQcalJPsdDZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10898

On Mon, Aug 10, 2026 at 11:09:26AM -0700, Allen Pais wrote:
> Replace the device tasklet with the per-channel BH helper so descriptor
> callbacks run through dmaengine_*_bh.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/mv_xor_v2.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/dma/mv_xor_v2.c b/drivers/dma/mv_xor_v2.c
> index cad4d4fb51ac..14d563ec6bf0 100644
> --- a/drivers/dma/mv_xor_v2.c
> +++ b/drivers/dma/mv_xor_v2.c
> @@ -139,7 +139,6 @@ struct mv_xor_v2_descriptor {
>   * @reg_clk: reference to the 'reg' clock
>   * @dma_base: memory mapped DMA register base
>   * @glob_base: memory mapped global register base
> - * @irq_tasklet: tasklet used for IRQ handling call-backs
>   * @free_sw_desc: linked list of free SW descriptors
>   * @dmadev: dma device
>   * @dmachan: dma channel
> @@ -158,7 +157,6 @@ struct mv_xor_v2_device {
>  	void __iomem *glob_base;
>  	struct clk *clk;
>  	struct clk *reg_clk;
> -	struct tasklet_struct irq_tasklet;
>  	struct list_head free_sw_desc;
>  	struct dma_device dmadev;
>  	struct dma_chan	dmachan;
> @@ -290,8 +288,8 @@ static irqreturn_t mv_xor_v2_interrupt_handler(int irq, void *data)
>  	if (!ndescs)
>  		return IRQ_NONE;
>
> -	/* schedule a tasklet to handle descriptors callbacks */
> -	tasklet_schedule(&xor_dev->irq_tasklet);
> +	/* schedule a bottom half to handle descriptors callbacks */
> +	dmaengine_schedule_bh(&xor_dev->dmachan);
>
>  	return IRQ_HANDLED;
>  }
> @@ -346,8 +344,8 @@ mv_xor_v2_prep_sw_desc(struct mv_xor_v2_device *xor_dev)
>
>  	if (list_empty(&xor_dev->free_sw_desc)) {
>  		spin_unlock_bh(&xor_dev->lock);
> -		/* schedule tasklet to free some descriptors */
> -		tasklet_schedule(&xor_dev->irq_tasklet);
> +		/* schedule bottom half to free some descriptors */
> +		dmaengine_schedule_bh(&xor_dev->dmachan);
>  		return NULL;
>  	}
>
> @@ -553,10 +551,10 @@ int mv_xor_v2_get_pending_params(struct mv_xor_v2_device *xor_dev,
>  /*
>   * handle the descriptors after HW process
>   */
> -static void mv_xor_v2_tasklet(struct tasklet_struct *t)
> +static void mv_xor_v2_tasklet(struct dma_chan *chan)
>  {
> -	struct mv_xor_v2_device *xor_dev = from_tasklet(xor_dev, t,
> -							irq_tasklet);
> +	struct mv_xor_v2_device *xor_dev =
> +		container_of(chan, struct mv_xor_v2_device, dmachan);
>  	int pending_ptr, num_of_pending, i;
>  	struct mv_xor_v2_sw_desc *next_pending_sw_desc = NULL;
>
> @@ -760,7 +758,7 @@ static int mv_xor_v2_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto free_msi_irqs;
>
> -	tasklet_setup(&xor_dev->irq_tasklet, mv_xor_v2_tasklet);
> +	dmaengine_init_bh(&xor_dev->dmachan, mv_xor_v2_tasklet);
>
>  	xor_dev->desc_size = mv_xor_v2_set_desc_size(xor_dev);
>
> @@ -869,7 +867,7 @@ static void mv_xor_v2_remove(struct platform_device *pdev)
>
>  	platform_device_msi_free_irqs_all(&pdev->dev);
>
> -	tasklet_kill(&xor_dev->irq_tasklet);
> +	dmaengine_kill_bh(&xor_dev->dmachan);
>  }
>
>  #ifdef CONFIG_OF
> --
> 2.43.0
>
