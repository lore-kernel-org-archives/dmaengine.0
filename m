Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013056.outbound.protection.outlook.com [40.107.162.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E1348F824;
	Fri, 14 Aug 2026 17:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786727480; cv=fail; b=tBhQDcnTdpfwT823S4DzXGAu7HprTWPREGcbVA5h64qVSZUNWGba3GmYNxIpONcZoz9untvnSFGSAT3exEWVhckXFT5i7s1yEwpvGCI4nJlj9OV7hKbYRnFg13hOp+awxkEOeT8UVGu0y6XzeaJQ+UB/rz9OxzaUBsP2LJyQWgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786727480; c=relaxed/simple;
	bh=2guJQYCO4Wu2m1dJ9hU/qvWPHCWIYBFOMhwnBw2raZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W98NJtlVMbAbNSsx7A5gNr3DYvKbCLkW9YxVdi3gOGsRw3/twq4E6zRuwyBYrbfhF4p0ollyCTypTgkdcW+omTh+GVFvL9huGob0sgrxTqopfXF2KEUPKj9Y6EPhfmNsjpHrTKSVl5L43abbIHvsPJuDvEWjVTt8r7Xt5O4e2Xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=amf0ysVa; arc=fail smtp.client-ip=40.107.162.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="amf0ysVa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xy8KmMm1zknsns/sKl5bDuejwU7djkE/vUrF1L+V6wPfyMZ6LK51Yq7cfspQlANsgM8890hFbBzJiv1IIY7UylHZskC8yfXn2pLDwclfZF5WEAcLroVcY6CHS11tuKt47fPg+KusunGaMvlye2Im8CqRBTaPkATUNBbORj/MQB9XfI773JEGMcrnVxyKoxw8Xxx2VEzPfFwoOoJp2UPmk8JmSrGzGwC2KBSTQ03OsV9d2MEDGeNvAecRxri4qtVXWtcUIY+RLEjrQgkMwy98SYjgsZKfvbhMiz4vS5N9mRttvbsbQ1xo/FgEi7i1jzPdMOufWsUoZuPqYMen6Y+yGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVkLqKzviOiVF3iLOhfSIU78XgcB6lVBL+hDWXqt0HI=;
 b=OnAndz2aQMX0Q9gpGx4XyvpxRT+uCi/05GyUfogpA1i5mP+14FnCLNI3hfx1kJ5JXKVbpKis4teRVEX4wuGNJQC7EoYDcauXMRAlpNiX2dy9ifJZgLt5txV3TdWpGQK2e9M+KOoV6IGih9N/DMhaLcMP81W8+iZq7LlFYDuNhokJySxoAvLgfWTdQRzNjtWF2+GxDxAwA0swoW4D/e3D0yyNtLz5vYRSRdqfgHOur6aMg0lxcrpJ05Uoq/SRkQ9top2L0ouoOQ2T/kn+pCGsTb8ZjOgoCOrLNIVk62hwuQugIZe+AHd9y/ra9FuXbIvaUQGHSIcDcYw7hfnBp3PaYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVkLqKzviOiVF3iLOhfSIU78XgcB6lVBL+hDWXqt0HI=;
 b=amf0ysVa7NQEEvgF6hSfFZ32FEuqjweNzQOr0YZEHhfy+o2CXj7IccvpOg/h5235Ax4W3ZfqE19pq7lziqessBkNWqrkBE87f4OCQGV2f3SP1bpDEc1yWjUsSUaS8xBALrEEkUQath6IxqU6dsxEAVxbOmxpc1x3WLtLCUqUuRUgZd88QYrI8Q04CtIRoiw8NRAxmXkIpNvjUYxskELfUf9PTPglU0UCfjjaU+TssByA1E6m4y5PcDhJ87UopDkb50AR14UIov2BXSKFzyGGd/cqdeCZ9QqcSQyQg/YCJoJ6fnREPlfl9A+ZTPLOTK0qT2Bzcd0WW7M4qBDFj75KUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by GV2PR04MB11399.eurprd04.prod.outlook.com (2603:10a6:150:2b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 17:11:16 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 17:11:16 +0000
Date: Fri, 14 Aug 2026 12:11:10 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, michal.simek@amd.com,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH V2 6/8] dmaengine: zynqmp_dma: Use of_dma_is_coherent for
 dma-coherent
Message-ID: <an9MLmA5ndm-eYKL@SMW015318>
References: <20260814045616.1661199-1-nagendra.golla@amd.com>
 <20260814045616.1661199-7-nagendra.golla@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814045616.1661199-7-nagendra.golla@amd.com>
X-ClientProxiedBy: SN7PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:806:f2::21) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|GV2PR04MB11399:EE_
X-MS-Office365-Filtering-Correlation-Id: 8364f096-3118-4370-794e-08defa270ce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|11063799006|56012099006|10067099003|22082099003|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LtCkIdPonrmWo35aHSoz/T6MlsSK2GM4RdOLJm19RVmZ9Fncbu80d7QO4pmbZdBX4+QlpL8A0Qn8S4YyHn53lt9fRDVLjFMknwaaTUj9wD99FSKB32DW3xmWFS1pb6UnHCAhBadrtXemsUpBGCMMIemoRHnGMZDXdVlIYnN86t4ve4LyvZl8r/ran0Aub/X+M4mbL9iIF8CGrADJeGg0bbbOJ9R47FGPdoa8aAJvWlIRkfO4k94K2dh8LSqHvJQp3BjtGUGTh6z+cEzgzWHKTYlV4ox+JLeqbqNIoBD/L1iN7cx4pEGQz3h9DmchKp94WvDlrqvQ/jV6pYtZD7d3iVOi8/3fTUuRL54P6rSUBR7Tc4qpgZJCjzLgN7WbAgAlWQbvMdLd/LL1sQct115AhXGMdFklyVHUrJBXPvBgkJnraCoVDNqB/SVx6RCHGv+jpZs7hZfm8puztc1nN6157PQz8Yeurmc4riaBI53XcYcW3EaH9w6+yy2JEAwi3H14yFEU1832gaBfshzxmD7ApPYVwOkslTQADKwi0cUD4MJqlbTyb+LMwUBPJ+EyoI1NNQgJ22izj1xqlHO8lqnodC4yX7SkLkmUY+rvnUwkS7LL3gsljWfYTDelNtOmiecnL9hNOYSi+fjDId/iGea0fy/2mgli1FJD4btlwy7DvMo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ChqhVh1OH8L0iV1sMXlzK61OPujlnWmQ62ssCMhYZYxdw4vRXy75aETE5uVf?=
 =?us-ascii?Q?UbvvIkuluQv08XAVpzsX0zmQ/wsIRNuByjfOPwTu705xZEcUQ8HYgAz2Fkj4?=
 =?us-ascii?Q?EzPRnbQm4OnICw7Tq+FbFWVvXSgOLWRgZMiGGRklCAMVZUAE+wfj5hwiUwxp?=
 =?us-ascii?Q?fYZ1Q8V1yGfb8ULBrDqm8FEl0W7rRa4W2PiW5amcvE2wLsNjrPHi0UbK+rpw?=
 =?us-ascii?Q?ZsoeGIkasbbJHpuRkh2ZyI6+Qog8Ez/d0ohlVfZbBg5mHkeF4zg0jcrzZ1DS?=
 =?us-ascii?Q?xjZ+h3VnX5Z2UP+ATgXACVNSrC8iSTURH0dobuT8Bwr1zzGBjPbUC5mcA2aT?=
 =?us-ascii?Q?mfoG9nx83Cdw4tmmWIrAxTPB9iG07Bc08HpH4zEz8nlqrB3baWfCj5p0BBAW?=
 =?us-ascii?Q?kYzEJNS0xCT2Rfwx2H9JtjAhaiP+CW9s6MX9KbfnwR4bzzIfvMNGKdhpCU4C?=
 =?us-ascii?Q?1tkXQrVvPYNJ2s5YRjnMpr0hbzubb8Z2Cji02w6FFz8JK6DNdfMLmB7QI+iY?=
 =?us-ascii?Q?8aR5zfiN57wu9Sple1GvY7ryHxMTz0gfZVV1rhdAOc7xoAhPxl7bWsG/JMoP?=
 =?us-ascii?Q?TVMNwrU7HF+BVEy3IrPOFE66CzFg4r0U5rAg6L9aMC0ng2Bv5dg/jARb2PHt?=
 =?us-ascii?Q?wB7/uIidrWGfVtH3/7noW9L6SNwAUyFCQ4cJORZzvtxS3WZHBdyKWW4cgVvj?=
 =?us-ascii?Q?TW6+0vT5HBY01fCZtyP235Ackt5+03PyoSs3sXixZb51b2nKZc8KEbvRvxZ/?=
 =?us-ascii?Q?OqiPXgMZ6RmVqm9/+hojyaUIG6WFCRqAzD57s7x3RVyEEDZScQxqVShlH+T6?=
 =?us-ascii?Q?thEzWT2bsZPaBE81B+dztWum2uJh00PCi45aBf8WEtsoh6OkrE6l7Qb/PDjx?=
 =?us-ascii?Q?gGcBuHugBLjpo3jRCZes3cz0+8aCJl5vS3PMgBUDN9/lnol996KQjm5qKT15?=
 =?us-ascii?Q?bto3yLyDpentUBnYARqZ8FMQ0SkVwiuroGd9aLLC3BJlzw31wlLU9JFPJmBw?=
 =?us-ascii?Q?4FdiZMzbNn3IX6lGItxnn1yU5G5jD5jDPuAo57VbpNg4v3Bbw+Iilt42i9zd?=
 =?us-ascii?Q?JcAQ3T7wd4D4jK1VBOqqcrq8XM1ewXitmagr/ikOmNxRv3i4sUGliszRMPSQ?=
 =?us-ascii?Q?9j+NXkm1G4y6ERx4F1vt2d9LCu/+biMjNFkHh3NTnQYBRCA+SzsMcy8Iz+wk?=
 =?us-ascii?Q?33mfIc/VrVJahyWYC0xau/b+J8yINLqzJRpgtFlWmbcyj4MAfAitzRlIm8hc?=
 =?us-ascii?Q?vjBUGV5eb4kEFyzOc15J2CXmJQPFb8odaO5JPKGwpYrm1e0ZZL111UNflWGk?=
 =?us-ascii?Q?EAHRkcNAZ43JZe85yHWYAYOF2bauFVrw5QupPIGunbfCntY3rIZ2Nb9IUqxn?=
 =?us-ascii?Q?b0pt0afsZqM9Z3JgCo4/AzkdQ91Sg9ooyF0MJpgVZNpMGfxCyUX/vXaPI6dZ?=
 =?us-ascii?Q?XbBW+U5uJCGV0dNoDJ/pSiBp1nbQmJwmsZ0JZ8FNMtmN72C5DXqdv/yMjWYr?=
 =?us-ascii?Q?JFfPjtdKNwthKejY4RfGP8evAwc+lANNjxE8DZPaa0E5oIQEDwtHWMqWWqyK?=
 =?us-ascii?Q?vvlmoHCYFwK5/68aSfX2Irxfj6eDLJ0VM87mKt667JDIl63ruZMUunzPwzus?=
 =?us-ascii?Q?j7h9bXuuocKw8chesT5qcN+VD9Kz5PXxoeqtk0vvrYNXNgpaCmItU7UtAkb+?=
 =?us-ascii?Q?6E1/w84AFqAt/KLGAn72Gignk8mWfbQlriTCiVgiF0RWR+S7koP2CPgR+f3q?=
 =?us-ascii?Q?h+SioumlPxyCHa2VWYWuzRjYrAEihONln/BjM2C0PvxDK/TdvUC4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8364f096-3118-4370-794e-08defa270ce6
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 17:11:16.2121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aaBVD4u82ywrD5iOdwKY9N70basOYWIDgxKrw+IdBOhJSjD/nMiWKckHLNyDSODVUZmgrwYDiBE220aRIeRSm415cpLxjFOlrx1CRwP+rKNX3Rs+cKVXwH5t0JYFc96K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11399

On Fri, Aug 14, 2026 at 10:26:14AM +0530, Golla Nagendra wrote:
> Use of_dma_is_coherent() instead of parsing the common dma-coherent
> device-tree property directly.
>
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> changes in v2:
> - Added as a dedicated patch based on review feedback to use of_dma_is_coherent()
>   for the common dma-coherent property
> ---
>  drivers/dma/xilinx/zynqmp_dma.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
> index 5e81e0d950e8..194abfd6cb25 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -12,6 +12,7 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/of_dma.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> @@ -947,7 +948,7 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
>  	if (match_data)
>  		chan->irq_offset = match_data->offset;
>
> -	chan->is_dmacoherent =  of_property_read_bool(node, "dma-coherent");
> +	chan->is_dmacoherent = of_dma_is_coherent(node);
>  	zdev->chan = chan;
>  	tasklet_setup(&chan->tasklet, zynqmp_dma_do_tasklet);
>  	spin_lock_init(&chan->lock);
> --
> 2.44.4
>
