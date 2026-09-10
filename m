Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013014.outbound.protection.outlook.com [40.107.162.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4E33655FC;
	Thu, 10 Sep 2026 01:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789004867; cv=fail; b=PRqiYEct64W1kNx9fd22gZkAD1MwKQxGeaQ4SsrGrxNDcPoT1FPKhT4gbbIu7knUz5zqMAfxTGAdtHIq30CKUj2OOjbA2pLzrCHZC6p4pdVBKtgvXZxLXCrEv1cvPN3NjX9WytLyKHFj+5oUVw2FUiz5bAo31yBBjUFBxHCY5mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789004867; c=relaxed/simple;
	bh=8RDcaiA7LScr/PiM/fNg8h6LYVqUGHLsIdoz1LD+4IA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Sahhihomc3TT4BPQutz1f4zguFgNtkgoZw3S2TK0yRfD9YNShtZFCVnAqNWE11gGmtYXypYx6NOlj066laPS3hXAPiIV5/KmpN1l9yECvlrIizGEDO1gBVjGadD6DbKDKDB2RgM/1qMYd8BHLSk1zyzG7yLQ5DRT/EosX6WKld8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QY86Hwkw; arc=fail smtp.client-ip=40.107.162.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QY86Hwkw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BoA6/u3w63IFsMY6j5GWQqnUm/wNbGF/3XpieidSjSOE5ZbSNWxqUaqael+SWFd6nqmKz6cNCPPPu6Nb1+5YhXoagSEycHNCHQUsceHV/2LFQvwYD3M0cBDHPtzfyG43WXWD5oalGIA7xdLYsYWFF2+ykFc7hQvUaITfW1KOg+IFzQw3Qoyv1re1Dyv8q/4NBdxeoAENZaSpb6r/jPUkfAr7fNPWLUW1EMCmJDp0H8IJ4cNbFEmV3TwqgQjF8sPY461pZHLWRzrmMhyRvgEfC0CXX0yorxpdALVtwE5uWkXEwQswGF4A37vqUoh3IqUT8TL4doKbT8n+wOKOSCco9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGKlYdlrzvp3WTjLkdCO0gZWlgzBQcc+W33aWSIErdI=;
 b=aq9tsBreUXA2shG6TDRqozQ5SfWLqx1862yq8kAaqPFnPRXOVhxPQC93QtJuPziQXPDupbJwzswTJRDRmuP/wspAYsDLvGI+uXbdGBi8IWg4W0H+k1N/1FAm+UAfbN8ENCwLaLIYe7ecfgluWDmjynIYcUGx63YNloevN2rxwLKSTqDmlqXt310HFRSTIU9BLHvCuAm6yQHlmZPH9TSkqbjXh2pDXDf4bdgJKAbaLCzc82Okb8q4MU+fJhJEDxoBmkiTiwkWVdLiFotOlCUe8pSixok0CdBbAw28Pm/f2Q5sFTpD7vN3WDCdIZ1g5X4AVFzQkAp6dJ0uqB/8jPuq3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGKlYdlrzvp3WTjLkdCO0gZWlgzBQcc+W33aWSIErdI=;
 b=QY86Hwkw90zh9K1UIa4IeH1yfcCjXT1JAMGw4A/SjJMjOsDc4S/dGqOVsH0OItn5xlsjJTD7kj2ol1pKjsFFzZI9RGcbCQnt1bFNTCrP4OZ4djEL6xSHttatgCHmeI8PTDeWQpXnGnIMwGZlxPQYfa9ncjPQXekGw46gknBCO/GlwVyjsJKN/Cy6QSAkSJK9QVCjLS7aZVUry2+vsRBbVzVNbTPGWpPP9/w0J1BK5m0X4OcbSJsLt7IE17cy35py25GnclebLRyRKqv8tYTCogj3g9XE7Al6/DGoga7xCQAP6tnHeL9qVyEziSkrVatxf+Fpf0X8UUS1znwHSZ6sWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB7934.eurprd04.prod.outlook.com (2603:10a6:102:ca::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 01:47:36 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 01:47:36 +0000
Date: Wed, 9 Sep 2026 20:47:26 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: bestcomm: use
 devm_platform_get_and_ioremap_resource() to simplify code
Message-ID: <aqIMLkvCXOK4n-KK@SMW015318>
References: <20260909232623.89321-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909232623.89321-1-rosenp@gmail.com>
X-ClientProxiedBy: CY5PR19CA0118.namprd19.prod.outlook.com
 (2603:10b6:930:64::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB7934:EE_
X-MS-Office365-Filtering-Correlation-Id: b0d15225-1fa4-471b-5c12-08df0edd7d08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|376014|18002099003|56012099006|22082099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	mD3daIkHCuRvSpttmi3Cx9EjRj0sEzscv0N9AAfV4d1e1Re4k/1iVHwnWfo+mXJtAujJUbNPDlN6AHp6BPxrHZhP+//mhJytmGxPjzT16lvaN5XsJQpCGV0rLHX8Vw/4buUTDhKkdFDxJt0LHv1mJ11LkayKBTyzBDLQg6RpvLtmFb+ZJtWpO2I3059r8FdKKqnGuvotg58Eb4IJsfYB5Q3UqUwnrI64lmfCH63mpZ7sSVPWSrpbRlB338Ss+tSX+JJwzYmu9nw8H/ZtptasjzqHfVnTrT9AHKurGqW8ptUwhrKPYQlZYFTPDhavlE3KYcNgTO2U2XBRbzAQEdHZvfgF1ktGXjl+ltS/1V9tuY5X4enEGSdPAdJIYyrrgRIBm/4l8m+rIEHo5Nv+9UpBeGlUE55/Q/BCXjMR0zHzBEgYOx6VonPyVMmDaCBl8GlpxUsfITLg56ew19iJ1/DK990zKbO3qw17CSlOkmAdAI6yELgvs0DDKZjmjSZ+XJAC+7pVOKsO0en1Gw8/RGppQxMWLfRm+4VTBbskEx3uEjc9A9+RHmzczvIga1X8kUcIrOxhWAtw8sutQACptdInUpTaE8reE4F9EZdFbDqERnNbfuZeemu1/yuvvkpVgQnx5R7jdMQMyh+1N1WcSyz+5Mg/jTeRooilNDjtDumuVa8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(376014)(18002099003)(56012099006)(22082099003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iNH6diObcXAbTrFgrvgVGEekO4yO8hA+cfywA3+c7YqguEBNpHWjIAL7WyoY?=
 =?us-ascii?Q?i6I+nIPgL4/S+cZBgI91JSvffH+L85PmaPVyU47gzWOq9ElGx2WiZgkpykEA?=
 =?us-ascii?Q?xlj0MSihvuSXzEm+afKii31giSWKE/jpwiDrIBuPCwaWtfM27/sH1vdSLPse?=
 =?us-ascii?Q?IoEenZz5Nay8zwGGa0lr3Bv79XHMC2owl/VkY0BbKBhz8Drbm2sR5/dnIbj3?=
 =?us-ascii?Q?SXQySpSCeQZFQiV0HNNmKl9ntJcbDVdO8SJkgMpO3utABL6QVcxS+J6qi15W?=
 =?us-ascii?Q?kDzfuJO39CAtxxIC6Bc8NeOEX7ckdSwQRVTM2kg9v1PYzJJmuZSyOioUDWRa?=
 =?us-ascii?Q?LOm9uWvLD1VDkp2rabPb+3jWMOc2DsLXs8mW7brPqvucY5ipEx43H/Vnha2X?=
 =?us-ascii?Q?O44xRQUk27Fm2dM59R2v32IpnTAI8v0NswfPZ/unttJBX9bCKG/oPHwOBJYC?=
 =?us-ascii?Q?wbBPxuzIxPkoUTTm53Hpm74swLo5SLYqeyb9HeQcZL/F6BajlWiEuFSTDWth?=
 =?us-ascii?Q?UEuWxszWStq5TWCZnk4uATnyjQhCZGfe38beOAuSFPTdH92A4ubzbVnAu9xN?=
 =?us-ascii?Q?BYV5Ec+9fbOR44u26zM+QOVBCGV5DfEUbZvUOlOqGyEayDsR3n8D7P9LcL+9?=
 =?us-ascii?Q?Q3qf3XZ01DnV74T0E72vX6AG016f20/Bg/k15owBOTHpn73bdxHb4cexsYNL?=
 =?us-ascii?Q?bkpGa5YM7hKwVZoE2V6aEA322ndDtYGeieCDeDrR2B+iktGxWc+Iwz1JBCVK?=
 =?us-ascii?Q?COxNHe9jAS4rmRG4tWyTDKBFfCmEINaWdP2aCrscvPeA6qAlfkrq/2pdYedk?=
 =?us-ascii?Q?qt+CNWPlMdp4OlOOfabByKRzeILR8WqLj6WGK2B1zHlrhrTdEIs7ZxMRaK98?=
 =?us-ascii?Q?eP/it2MdJ1Q1soY0mWRTU1Ou95TKdw67oH6bWSgqlgX5Xfq224WfcUJoi5o4?=
 =?us-ascii?Q?9qynMf+MWtar7FRESr802ZEvvUdx29SSqHgrD32AsfJjmBuY0nhxLHl3P2rl?=
 =?us-ascii?Q?e7oe3+l006zz907soANcuxqtg6bqeGlXaYPyAOZK0CWN/vakpofS7rfuuu2u?=
 =?us-ascii?Q?RfmC+NSFqIlX716MiCRtacTtWJ8EKH/sLmo7UQJOdtmfH6HkaJrZCoAimR3W?=
 =?us-ascii?Q?/b5DzHRfR1Q7kl8hDlViF+jaKRuYlvwAIbEFRODJQ9rJD1tpZa6MBq///vvU?=
 =?us-ascii?Q?liiLj937E0W0WAUoa+coHuy1asuDNqgp3qw4XjIRAu5kYS9VMPvy1DHFOAo0?=
 =?us-ascii?Q?ShYQ+P+c53kPvI6hKlFtMGBSSYjBNqy0XY6Wu7h6zaezA6/FfgarfSRdWgnn?=
 =?us-ascii?Q?zbEFer+1WeaWz51nGdnyq8iXod6kKuJB60W2/D5Ji7D4+BkIp+Eovvv4yMSz?=
 =?us-ascii?Q?sl11qUUNu8bLgtflanE1IY2rx+LBwoKistGCHA8BU4izDXmTdDe5GY1AUtYa?=
 =?us-ascii?Q?a8/3reSJ3l30++GpseIFlrn3pyKz724ZL63JjK0vX9AxgVjBHImikXBvijkT?=
 =?us-ascii?Q?GCQP3xl64PjYA789lve7p4rs9VY4B1Igv1vBsB9E2CHxjBzJ+Dg39TEqSxd8?=
 =?us-ascii?Q?3YzRmNcQcs0BEVFaqIUO2Kh50Kj4zLL+iKMTeVrz6L2E5WfKiZ8+W++M0/Yz?=
 =?us-ascii?Q?A508HIMOZ1f5Y4L5pAdOcKtx33VlXPq0w1x9WA5RmBXYuoBjEdB8yprdQw82?=
 =?us-ascii?Q?gKPSHj87fLGWO4qRYjpNxh1RXZ8bMjguwWHyvcrmUgBNyISJgaO21I5nXSu/?=
 =?us-ascii?Q?BGR2KvW6e1FDHtT/ii0keNqux+RT9br2Z08OOLjpoS6noNQy0DOA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d15225-1fa4-471b-5c12-08df0edd7d08
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 01:47:36.0746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEe6/1bmm3N6a0KbtFp71sTyZ+rJBQwjNkgcSmm8KcAFwej2tQoxLdGLOLvlnPC+TS7P+yq9YsoEySW5Y+8BQ4ryVhCqvqPju/y/t+LqI/4we1mt5CRZeP8qW6qA8qIH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7934

On Wed, Sep 09, 2026 at 04:26:23PM -0700, Rosen Penev wrote:
> Replace the open-coded resource lookup, request_mem_region, ioremap and
> the manual iounmap/release_mem_region cleanup in probe/remove with the
> managed devm_platform_get_and_ioremap_resource() helper. This removes the
> now-unused error-unmap/release paths and simplifies probing.
>
> Fix a resource size mismatch between allocating and freeing where
> request_mem_region() and release_mem_region() hopefully use the same size
> but is not guarenteed.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Missed v4 at subject.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  v4: fix subject
>  v3: reword again
>  v2: remove Sashiko generated description. Reword description.
>  drivers/dma/bestcomm/bestcomm.c | 45 ++++++++-------------------------
>  1 file changed, 10 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
> index 432b43520ddc..44ff4a42376b 100644
> --- a/drivers/dma/bestcomm/bestcomm.c
> +++ b/drivers/dma/bestcomm/bestcomm.c
> @@ -13,7 +13,6 @@
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
>  #include <linux/of.h>
> -#include <linux/of_address.h>
>  #include <linux/of_irq.h>
>  #include <linux/platform_device.h>
>  #include <asm/io.h>
> @@ -365,13 +364,19 @@ bcom_engine_cleanup(void)
>  static int mpc52xx_bcom_probe(struct platform_device *op)
>  {
>  	struct device_node *ofn_sram;
> -	struct resource res_bcom;
> +	struct resource *res_bcom;
> +	void __iomem *regs;
>
>  	int rv;
>
>  	/* Inform user we're ok so far */
>  	printk(KERN_INFO "DMA: MPC52xx BestComm driver\n");
>
> +	/* Get, reserve & map io */
> +	regs = devm_platform_get_and_ioremap_resource(op, 0, &res_bcom);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
>  	/* Get the bestcomm node */
>  	of_node_get(op->dev.of_node);
>
> @@ -402,35 +407,13 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
>  	/* Save the node */
>  	bcom_eng->ofnode = op->dev.of_node;
>
> -	/* Get, reserve & map io */
> -	if (of_address_to_resource(op->dev.of_node, 0, &res_bcom)) {
> -		printk(KERN_ERR DRIVER_NAME ": "
> -			"Can't get resource\n");
> -		rv = -EINVAL;
> -		goto error_sramclean;
> -	}
> -
> -	if (!request_mem_region(res_bcom.start, resource_size(&res_bcom),
> -				DRIVER_NAME)) {
> -		printk(KERN_ERR DRIVER_NAME ": "
> -			"Can't request registers region\n");
> -		rv = -EBUSY;
> -		goto error_sramclean;
> -	}
> -
> -	bcom_eng->regs_base = res_bcom.start;
> -	bcom_eng->regs = ioremap(res_bcom.start, sizeof(struct mpc52xx_sdma));
> -	if (!bcom_eng->regs) {
> -		printk(KERN_ERR DRIVER_NAME ": "
> -			"Can't map registers\n");
> -		rv = -ENOMEM;
> -		goto error_release;
> -	}
> +	bcom_eng->regs = regs;
> +	bcom_eng->regs_base = res_bcom->start;
>
>  	/* Now, do the real init */
>  	rv = bcom_engine_init();
>  	if (rv)
> -		goto error_unmap;
> +		goto error_sramclean;
>
>  	/* Done ! */
>  	printk(KERN_INFO "DMA: MPC52xx BestComm engine @%08lx ok !\n",
> @@ -439,10 +422,6 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
>  	return 0;
>
>  	/* Error path */
> -error_unmap:
> -	iounmap(bcom_eng->regs);
> -error_release:
> -	release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
>  error_sramclean:
>  	kfree(bcom_eng);
>  	bcom_sram_cleanup();
> @@ -463,10 +442,6 @@ static void mpc52xx_bcom_remove(struct platform_device *op)
>  	/* Cleanup SRAM */
>  	bcom_sram_cleanup();
>
> -	/* Release regs */
> -	iounmap(bcom_eng->regs);
> -	release_mem_region(bcom_eng->regs_base, sizeof(struct mpc52xx_sdma));
> -
>  	/* Release the node */
>  	of_node_put(bcom_eng->ofnode);
>
> --
> 2.55.0
>
