Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E286D483819;
	Thu,  6 Aug 2026 15:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786031630; cv=fail; b=SqbguEGcXQByCOztvGIsJBb10eayAQw3gGxrLRTgDrpENT/4PjllfOj4YACXggpLpkkEvXDtMBSlE/DPWAQ7e940C1/FI8b7SY1SFXdoU4ibytCXxSYkfOhbe8upjMH06r4HalXw+JcaGRiPeLRlQilnNu7cF28WX9uDlnJddO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786031630; c=relaxed/simple;
	bh=2FyInvN7qqNiEMGC12WsIG5A4M9zToX+qgI+hxZ0Hfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jvhBw9ncsPlamTDb9gIcQsA0BK/zyxwE2Lp4n0NndVJBPgO1HPO5SucEAEosfOdyuHWLk285JyM1lhCsvY9Qa2wuH8bvHkBHI5PWcnJs9T0uhato5xPj2Zv/n5ObpTPb7T+dbeOWugT0f5OorebVpj9BntiZWFK8CSjCBUTXEPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jBqBAknD; arc=fail smtp.client-ip=52.101.65.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jBqBAknD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UUj4XW6wvGOA/uHuCLZRDC2Z60i5Sd4QCLpp9ze+C32QMDWBi0HNb4XnvLOUp08gg2B1O6byze/ZIHirXgfxei7YMVNB7oqmD47nNuVuOm5E4YYl59uw5/o5suWg9RrehjW+t0aHxiCztcU9bYN8UuamiU2WFEsAa2qneZjYYCstB1Fuy3bky1q6JAX37p4oV/hYC0V/EtZZ2Xpk91biu3onsBaJL20tCR25ituQCANQx70z+5DV8Vrmn4RbZ0jk5KrgEzOY7boB1mBhbxAr4HwJadjF4UyK8q5ozB21fPGOx0+H/Fg8Dp7t1uDQFpUiGt5IGW06LDyj1VqjuaS2mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLZVvWnmVYEOZ60GUJzWl+4H/vxFacK0X3tmmC3tbT8=;
 b=QpL01XGGWJ5OPpM3MTYNVnElTLD02qEg+uBWa9J+X2INTrh0SLbiC/oMifNI+t8Yb2tPeCv18H8GjpAOg3td5mAxKvccQp+z4qZaC4Gqe7lo17zGuyTRUkvUZy0APIAz/SifpDsrUbCab5yv3WbnG7W0n3aB9rvS/kngaV7YUYls4LN3/hcJYzzcS7WavxmCPMGLy+wGq8/J8+6hA33JH7JJA1sYixNdseDgxvVHpB0GAbCB/pvZqNHRCxUskJFCx4lukMlsEw7pSp/iiXJrjnO1dxHH7UweFIzvXOrqXqHZTY+kuuyYpT8oswirZHrp/z+Xgjh5wZLzSnvB2X8ACA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLZVvWnmVYEOZ60GUJzWl+4H/vxFacK0X3tmmC3tbT8=;
 b=jBqBAknDzDKJJ9TeeG6RUzrpZvjI+gW6Dm12AJwK21qVbE9f9R7amEPdlACOkvxRkLnEXQVyRqI7go0LefkbindB2XxWkHo6nLcUaft82ySwDfslao0wam52EOFdOyDjN8AQ2P7Z8MExxaohE0FiNHEFjdoAap2X4/yY90GjxIaYRNZEfw6r1uH3O9obnpain0OHQrQCPgCvznNd6hZ4FW5jckWJmUO71UN9mBI9IbnNZhjNlPtvW3JjMhIj9QUYOv//auLVRjWuvCra+dmkgh5uWxmxRKu1JEt1uPBkiR2Klkx5My7plSxXmyb8Zbf/qs4WBKzJknGh3It74pFg7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB9083.eurprd04.prod.outlook.com (2603:10a6:10:2f2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 15:53:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 15:53:35 +0000
Date: Thu, 6 Aug 2026 10:53:26 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, michal.simek@amd.com,
	robh@kernel.org, krzk+dt@kernel.org, radhey.shyam.pandey@amd.com,
	kees@kernel.org, sakari.ailus@linux.intel.com, yukuai3@huawei.com,
	git@amd.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] dmaengine: zynqmp_dma: Fix minor whitespace
Message-ID: <anSt9mL_Ttla4Wnn@SMW015318>
References: <20260806123014.2120447-1-nagendra.golla@amd.com>
 <20260806123014.2120447-5-nagendra.golla@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806123014.2120447-5-nagendra.golla@amd.com>
X-ClientProxiedBy: PH7P221CA0049.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::32) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB9083:EE_
X-MS-Office365-Filtering-Correlation-Id: 60330683-c1b9-4153-1df4-08def3d2dfa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|7416014|376014|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	okBypb8O9aMHbyCvb1KcGcI1KAHg+TQnn+CP8QK4vA2LEe9kqBsM8GsSCUBKjidGdsc9EwgF9dXkiadrh1/OCgD4uh5uffE4wiyl7G0uQ1wVnJCyk9TLBHeZwTmCfUQGiEk49M+VKBjf6NHQEiy0hpX+b/UgrIidulqG0uZ+frDCr5WYjawQDdlwaIptV4dsIoYxm3VVzhtuVG5u3aTaW17/NceQalsQSDAqKEOdeWfOcBjF9OInLHzrxcnwjHJi551/jDqK4PX0jyK+xGJxvWTuLGUk18yQs9SYfDEmtXD/tdaJv0pKoFVChUSmLpsx/YYhMR6KyZiMyewYh/XV+2aBSr2sDSvChefVCOdaMrbeIZ9Ex85aV1842RQA+XgO4sMxYk5mWEMETCmmnFoLCezuqPvXEglFmntXjoCdQHWyeGOgCMEULW3eVkVO9ad3pN2smW8qursEus6UkpOEIO6Fkom2NIrKZY4z9MrET2qnY0UDO2Z7baoFhBUurAYGZ62C8jnSiKMmLyjrhBuaUCbonnB3yq48G/lCeBBz7oZgO2PuuhV92tcGOFq5PqfFE/siGrxKQ9HpkUL8JYJfqW1OFHh7xu4tdBLDiuNN0FQHM5T/3+Z+8lg3VfcQT3NbTJMKY602G/xYGvsiwSZdyPvc3iylLLGekW4chF/3Cz0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(7416014)(376014)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w/l69q4/wq01AU+Ef+J6jcBDzgriDWhiWM71xAKGCQpB3fY5WTTTZTJMY7cp?=
 =?us-ascii?Q?IOctCG1wvqjODqtYXTrh+PECPKSFUjN+V4rE++OiNNRtxjrGPDoauoXJs0ii?=
 =?us-ascii?Q?vaG55IMK1b+hVrVP648BDFflhgIz1ojCnGAkQqb06fWAeYEYG1uwZ1AdMjM1?=
 =?us-ascii?Q?XcWNgTf9MKZUQnopjmwcid7V5/uUhtQrfLl2rBGSFbaoMRpMLswx4CC8Ii4M?=
 =?us-ascii?Q?EP6QP30xsY1xXoUd3OE4kyqoONT4UdtGx2rUJZyOvQEE+A+33EmbErIs2ztr?=
 =?us-ascii?Q?bbtYpg//FRY2e/V7HfmL1wGcGQbGM1H4ys7HeJ6x0csqCmuL74ZRRP6qe/i/?=
 =?us-ascii?Q?IyeMrYMKjLKmElY/muo72FCJOM0/V3unX62jZL4KUAfCXiMGmuVDBAwl9vaX?=
 =?us-ascii?Q?7nbIKLu8cn/MHwcC3ashyylJCTil+h33cgqvuCpBi/Gup3bOo6CfAPH4ROW9?=
 =?us-ascii?Q?7zxMb78OQCen9TBaJk4g9CXOcFSaMwXqOhVQVUsnOJNYX8jkObnEMqio8zui?=
 =?us-ascii?Q?4NwIYqtB9h6BGIJKjb6veT4ada1vUNCgPZS0AeMflf2R6UrYS7fIpnll2G9v?=
 =?us-ascii?Q?IDMOmLBLz74ft8dsjIRwspA2eumbbhzPzU82Amqor9SQfoxlDZwMWT0tC8Fq?=
 =?us-ascii?Q?REnNO1dYwDLYaqZJ+JFHuxldnSdxRJ4TaaBFlzcjqfmZLy3+0QzUhK9JiE7B?=
 =?us-ascii?Q?6Lx5b5jkkTYgmpiHkWfoKPM5tAG5dZ+vVg+0PIuqP0lADsxpLviM31e6WdJT?=
 =?us-ascii?Q?G980n1q5vsVm1jXyA1BnlPMTkoTp1+OW+ZHdwdnT+cwl+3kqCeWPRaPaI2li?=
 =?us-ascii?Q?tLsMAREID6b8430hCleJDxOpujbzbdhofIKmS5IJdOqlLl3NYWLPtKqb5Puz?=
 =?us-ascii?Q?79regFEJugADC9UOhQxaioINBGBMzhPk2+iN2TD8FPpzcLwPomXYQ/hHd94q?=
 =?us-ascii?Q?6WgVFWi/AMLCUywW/csAfT6x0nmZ9DtfX+QCZCCqJG9ntMFplOwjC6O9J8Gr?=
 =?us-ascii?Q?pX+xcSPq3WuIlgQcZq/2FUM+EouqgBRTIZYGGqbYR8Do3OwFMfs7fIUP25KF?=
 =?us-ascii?Q?NO8BqlFtsUz59GQZaJBDpgvpNBavDTv3pfsES3toEUtyWWGDAcqIBIWj0flq?=
 =?us-ascii?Q?v0nK9bxZJFmcaGNY+JP66gl/iViqDvoVBTmhdMU6U3P+pnrH7s5LwGw9+Egw?=
 =?us-ascii?Q?iu+pJDyq4X3w9iJOSStnTCr6JS27JAep/XN/c3cABWVaVWWM7BW61tIehWCp?=
 =?us-ascii?Q?PfPgcIZaiLneJIFXWne0G7TQed+Sr6LTnKU+zZSGORScF5Cr3HXUDPDSbMJ3?=
 =?us-ascii?Q?V1IRoPLeInSO8+ybahPa7pEwbNH2uvKYkqzh1s8kwBTpzjulMkAh9tmnoH7q?=
 =?us-ascii?Q?GuntzLQcOVdtBrlvHgbEbI2usHSzhBMA7KtXtldy//gMVrn0vjfyrSDZqZWP?=
 =?us-ascii?Q?HAKc8m0QQe/Z9qRjs/DhRRdV+Tyfgp4zCcK9Plh5u08IR4+SEw9iO9PI7v+1?=
 =?us-ascii?Q?KMC5UQcF0DytyS7vc26W6AT1mj7aa6sxQHGt2aRqNIKl+PjPEgC25BzmUSPG?=
 =?us-ascii?Q?Ie5biqowb5fpA9hoa90MPmsCHZWu/lurSHczg6ErWYmPORr3dV06IKmUvTW3?=
 =?us-ascii?Q?hnfEH1EZWy65me6SDJUjaVbjSbmNQYzBNuNw82/9FvMkuCeZoaFFJDmPb1gN?=
 =?us-ascii?Q?uL/vNnvTRaSTd7Pf6yYLmDUdJKEphgE5Iy4Q1AHt02V3+t+Jz43tf2b0PxfH?=
 =?us-ascii?Q?CyQr3aTiu03x4EST3Oo0lKQyaHWOHr1XPmwy0uYdlMXCCqI15okN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60330683-c1b9-4153-1df4-08def3d2dfa1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 15:53:35.6925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7SVfub/nZcyiqh4o5mS4Knrf/7nZh3GoRnTQ/fv6LZ8RaB1nmGihKrUCEufx/3XFsiT1SEhM0Jaj7vYHsoh6D5BomSFIKogIUF5blMil7iBUq0uf1DXOaLX/PWuhVMf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9083

On Thu, Aug 06, 2026 at 06:00:12PM +0530, Golla Nagendra wrote:
> Fix minor whitespace formatting in zynqmp_dma_chan_probe().
>
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---
>  drivers/dma/xilinx/zynqmp_dma.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
> index c5b05fd52e9d..2d56ea08ce45 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -947,7 +947,7 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
>  	if (match_data)
>  		chan->irq_offset = match_data->offset;
>
> -	chan->is_dmacoherent =  of_property_read_bool(node, "dma-coherent");
> +	chan->is_dmacoherent = of_property_read_bool(node, "dma-coherent");

You should not parse this common property, call of_dma_is_coherent() ?

Frank

>  	zdev->chan = chan;
>  	tasklet_setup(&chan->tasklet, zynqmp_dma_do_tasklet);
>  	spin_lock_init(&chan->lock);
> @@ -959,6 +959,7 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
>
>  	dma_cookie_init(&chan->common);
>  	chan->common.device = &zdev->common;
> +
>  	zynqmp_dma_init(chan);
>  	ret = platform_get_irq(pdev, 0);
>  	if (ret < 0)
> --
> 2.43.7
>
