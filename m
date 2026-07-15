Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010060.outbound.protection.outlook.com [52.101.84.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C5D400966;
	Wed, 15 Jul 2026 18:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784141720; cv=fail; b=dyZ111lHlDOGVIemsFBpP2YjTq545uIxQBp5IUbsI7LmRz3H8/qdO4AYEolwfHa9x6RStPsykvSDkUf+OG3gk+V+pY3cN/BjPFrt3Gjx95Y2SEUS/x9mwcOrI3g2jDa290sK70nv+gTmbvH/VIJqZKlV/qQAVobwBQPwdiP52Ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784141720; c=relaxed/simple;
	bh=Q14m8qKaZq66BPT6CQuvpzAYnOltkaoF24n5i3upb/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YnLSKpK7dBNCHhymSsMVfro/6iZFQ4dKy9cSyWh/GTWg4MVDWPgvnhElPcgFvjy8GQT7OI/Zp94oy3/gtgB5fyXSxgdGy2LogSfLfiumi9YS3GzfzHNBhtU7PIQx65CHVqssGs0dV0Uq2vz+o5IpcnLdqBhpv6l3/ZaFVrx3NNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ys7/Sh7J; arc=fail smtp.client-ip=52.101.84.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ys7/Sh7J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xffji+8nstA0dqXp0FbQEasSZu4EFc9OplgU8D56cmBFP6WyqvsnFIeJo7GeDeHboygdGgZs4GmDEmJkzKE5fXeRyaD8NkZCI/78oOdEvNHQeqHoNFYfxhYfWinm9CkMaddPTl3WzZhwFJkVB56R3Tk40Yk0RB0jgFU5b5qRM3aWRFmM2j/nQVDPpVEiLb2TuvCEEE4yBKHjFHhUgR6egoijt/mCYx0uz3OfatdmCFFLpcdT+GtqCLMbNWDmdgn44BeSyw1/2dlGIrS3TF3yk/qzTCulMoHD2mNPW7F25yckCebRC5/+ljBI4z/EAu0lTZbBJxhbpSOO5X/sKZ7ncQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTWUahy9Zau6cl4hy1BO3wtKOEceIc9oZf13k5+UYck=;
 b=CoV2m/+q8WHDy27L6b2frmXT2FBeBFMzlhs69H2PAlBKK2cMNWbZbc09gkg7MElUizTPBQK6WmUEA//+viZ6EL3GmkS/GukVX7peAp5CWBYWd6ywtpqIeLIuh/Bg7K24a7dCKOO5DnajXoHVGMsyxFWIKZWiw2NuUCMfoZD9PhbtPLn8vScdkJEmn9X5Go7q6K5gQ9B1zYoYiLlVPTTVgz9NXNAWRoY+QOBBxRgwA9BHu0rvLPwMtLhAp7QGDdqpi4xfue4y3DyglwfeGSmW+FZPAhG7KQxgsojIOoO5tnMGSlOsWLCGxsCbr6d2aJmnrfzDM1Vk6EGe382Fi9vhow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTWUahy9Zau6cl4hy1BO3wtKOEceIc9oZf13k5+UYck=;
 b=Ys7/Sh7J0oZMM64PcuTAhp3jrV15Qy0rxfoCGNHUKAxsn4TdL1JjuG+8sIM0XpolehtkGQDgErNTH14rVn7T2tm7ofwpkOT9s8VzAJAwLwT72URuXf38uLu9I2aSdayvkua0tyo2VxjMGF7r6aoa7JY6y46irsW3kbzp4e/wj1oLY6W8kR0e2e2w1EnpLvPjpLr6kXySfW1keXTufknpoZCjIGog/5Ji4hdNvqSF50oZELZqHIcyY1Je6ZsrYJIusnp1k+89ujIZgBRma1G5qH1BifC+JXn/Aq12e5759HvEyKuI5AvJL9tUwkAt1isuOhuscSlLmGcYrUDysWiY6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB7822.eurprd04.prod.outlook.com (2603:10a6:102:b8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 18:55:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Wed, 15 Jul 2026
 18:55:15 +0000
Date: Wed, 15 Jul 2026 13:55:07 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Cai Huoqing <cai.huoqing@linux.dev>,
	Serge Semin <fancer.lancer@gmail.com>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/9] dmaengine: dw-edma: Serialize abort state updates
Message-ID: <alfXi_z2lSy7ET4L@SMW015318>
References: <20260715175740.1110404-1-den@valinux.co.jp>
 <20260715175740.1110404-4-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715175740.1110404-4-den@valinux.co.jp>
X-ClientProxiedBy: SA9PR13CA0039.namprd13.prod.outlook.com
 (2603:10b6:806:22::14) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a065ca-93a2-4923-28ce-08dee2a29b42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|23010399003|7416014|376014|366016|18002099003|22082099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	q9hH1M9Q9D4geO2+zDvkHze1gAuvAhNY4/pkJ08mGbeaUVaNx7WODlIJh41K9n3+y7DPPoNl7nOQxFkETAT2xGfCc4xir+UMVcL81ZMcXbDyp/EwuOQb/95HLLV3ErLAO0VL6psRXZqd1oQlYwaysxZ4t9TMrxYLnPhDpVMleqfBPIwVYOSztmttTSMGghsrrNrIkgNZLctIWcRNCk66cVaPNKdPzqpMceTKot7eofrfM/+gNRhtBUuBf3CMR5k0eons6/2hEL0fJjwDZBIjw62H9Wghj2aFPGzmNE68X+/pD2nd13J+RtNr0pYVWu5K2wdtj5YvL0fBEvjuxdqZC6OET6BT2kkNg2oUXmndo0Y3QwRUCAHsDF3QfiXtef6vlYhL3QxgfVhzItSACgxSGYhXx2F6jtllT2BMmlQ7PCuQSI8K7+6FGXSfZTH0Mue3eHN5cTpmEbChaExqAY8RE2Ogz3QI6bePlYFxtPtJlunb1yVODlR7DCtTzgG17wCVOyF3Y6ABcGScn7+vXeceKRJHKR6I5adaX2g7Rkw8lPRcGB3gRKqeLWbnlbp+2G1l0dbOKKc5SI7KXJMqU5jqv8uJeHGg2ONJ3OndE7mMYevEVQY8OhgpjMm2nQEtYN7pQDaJv8eDLih6vNZ7eTh+yaBz6JJfpKTiBLcRIzpcPkI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(7416014)(376014)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gODJbdbkhsA1bcvqxa9JzL72R/FcK1hFtZPt9Y7sqt5jQXt3SoCN6k+NUNT9?=
 =?us-ascii?Q?FE8jWmju3iGz+vt8X9y6RG64BDxZ9Z5GiQJW7GGPKZXDz97/nUTltcU0SyRw?=
 =?us-ascii?Q?qnpWQKFzaH3k3fHyAB9+mZUyVs+vAYDVlMCBThTsegUL2Pnx6Kvb2/I3P4Qu?=
 =?us-ascii?Q?R5ppzSAYVUHyXG1JlX5uFkoQ4FLViTBY2tKTIQ+pxS5W2vLhL6+hbbKmaNqr?=
 =?us-ascii?Q?Kb+yG/85gmFYAAA/RJQJfnvtHxBS9Gy5bB/Rk3sWkb0rZ0PPmSeuHzjYEPlB?=
 =?us-ascii?Q?Smgtlt6aqvt9wlTeKNcCe/l29QctKdjS6qYkUVhy9ImIz+WLXYzrJ4l20//4?=
 =?us-ascii?Q?kgVpiIqm7hTIsnLW0ivbCmHBVwVqcyk5AV0XEUY6hHaSNDRmUHcjquhGN+XP?=
 =?us-ascii?Q?xxTc3X10v/BYuwvi5ZIJDehUffWG21nN/UjixLClWbF3CZD9ONQeVoPc2VHQ?=
 =?us-ascii?Q?2N0iBQvJTYfxqaW5IV9PIUG9Q2kQciQjQGC7mkD2u/fmmU4ZeEs1kbhpFkpx?=
 =?us-ascii?Q?CtbJkTOOrTg2yPdNfEHEoVdz16zOUTRP0xuLb25Rw7b7u621nwUp8vXuVI5Y?=
 =?us-ascii?Q?QfKfaALvUYHJZHgI/2Zp/2/D+XJ9cJyKw3z5T/ph1gwsTp1TLe7xC0jLBpyr?=
 =?us-ascii?Q?GMky8fo0vJ4pSLQ7w4yKZgpcsQ1G630C/8qHJHOsbasma6STvihULdFX19k6?=
 =?us-ascii?Q?SUb2AaS7Kvr5rPaawuUAwTPrS8E7Lx50pvBfphkLGeC/lGfKkZ5QC6GxsbzY?=
 =?us-ascii?Q?OGwPgNHlGLTc6Xdi9pGiOSFH/RT+5oNsqiUXjZoo1yn1On3RUnv94okZfKZ5?=
 =?us-ascii?Q?jqpubMAh/2r+vn919Fh3KhO4h4OK8QANSdBay0/6YTbc8xoxG044Kzcj6eCz?=
 =?us-ascii?Q?Altxv49P3L/SJ/4jnS8jX7Tra31SeVFbBGzLmbv8jHUvQrSLzi6Wv9lpnuti?=
 =?us-ascii?Q?HpYvqWptR3xdyROJa4sFFFBMyl9y2OaghcSlc17YryCmptbcPbV129jdhkHj?=
 =?us-ascii?Q?a4BbRTGL/LYSvapo4XACVj4t/O3TAKNfDZZbAZdmFV7xeBiILHJY8OhyWTzp?=
 =?us-ascii?Q?aeSaPQ16bIyHxyEMbgmpV7wX++5F76I5m4IsoUc/CvzN2+EfNgeSLVg4tpCM?=
 =?us-ascii?Q?tMm3xVdSI1rh+1GhAiItBvVHRPmsYViQc4XFfpGdi8O8ba91KaoyNoMW75r6?=
 =?us-ascii?Q?rO4WWzHm1tUATPHqXUIKP8LGRPPZCPvmuQP035w0FwK3pWTriTmOrrFDLTq7?=
 =?us-ascii?Q?+zypa+Pm21rUeLW2fC6ufoErzOmft2xiOp6STgbRtiG6YXzftxkIBBAJ/DfF?=
 =?us-ascii?Q?WHJvWawkpc/FNMglqL8KseGF/WrwKbl/otUqY0Z2XVeJErblCpRjXNH7OT8S?=
 =?us-ascii?Q?lXdu6WcCELBztn5eX+d0W8Pl7CoCBjwNHaAlhOiXqV5ZWzNaZYlWKLYzVzmO?=
 =?us-ascii?Q?lrpv6BCKcwDyyY0MTbHvS2C9qIld6CASqCGoiT2FcraDbChemgqD+Xmo5JTp?=
 =?us-ascii?Q?bEJDjRipasb8iiUOMLFPg+qmqb+9ExvNx+9fgYjJyIU7+xqevRtBlkG7AeSq?=
 =?us-ascii?Q?lTfmkdg48wiz1cBR/MbZmu2vN3b9jtgc6zsbRIBidw9BSp0Q/dj8TxgfhwdM?=
 =?us-ascii?Q?nVfZOtjvoMlwl8PoN94Ij6KVhjphv9c51FSxf8NNOJHo/02RbVPwRzeJ7RCf?=
 =?us-ascii?Q?cHMNjYzF/dnindvhjxIF4QXG/kjGREiI3xsd7NepRzfUuHTiS4Omw6KW7YMk?=
 =?us-ascii?Q?Uum4dIrjDIP7rC5ooQilaKXqc6p/ZiIPg3sMyszFjpzz8CCm+YQQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a065ca-93a2-4923-28ce-08dee2a29b42
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 18:55:15.6668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Id84WRgEOMz5Okm/Beb6XrCDULIj8E8RK1v1O4ZALFavIy1XppjnzjFnnSLkQuqp6SxTsHIuOdiOTGP8kSKXe/9J6vKo+LQaFs6VSP3ZJu8m93bM1bywckCL6ILtdZ5D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7822

On Thu, Jul 16, 2026 at 02:57:34AM +0900, Koichiro Den wrote:
> dw_edma_abort_interrupt() drops vc.lock before changing request and
> status. issue_pending() can acquire the lock in that small window,
> observe the old busy state, and skip starting queued descriptors. Then
> the abort handler overwrites the channel status as idle, leaving the new
> descriptors stranded for good.
>
> Keep descriptor completion and the state transition in the same critical
> section.
>
> Fixes: e63d79d1ffcd ("dmaengine: Add Synopsys eDMA IP core driver")
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v3:
>   - New patch for a pre-existing abort state race. (Sashiko)
>
>  drivers/dma/dw-edma/dw-edma-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index 44ef5fbe3fd4..272b03405746 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -740,9 +740,9 @@ static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
>  		list_del(&vd->node);
>  		vchan_cookie_complete(vd);
>  	}
> -	spin_unlock_irqrestore(&chan->vc.lock, flags);
>  	chan->request = EDMA_REQ_NONE;
>  	chan->status = EDMA_ST_IDLE;
> +	spin_unlock_irqrestore(&chan->vc.lock, flags);
>  }
>
>  static void dw_edma_emul_irq_ack(struct irq_data *d)
> --
> 2.51.0
>
