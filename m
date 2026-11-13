Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794602478;
	b=2jxp1Q/mSiwNJ/aXmPJpEU7Zv8mNlq58roGetbk/Ew9/s9VHi8rBhNPsHehdAcyXwaiC
	 8CfyKhoVXNF6lvKL5Lvn5G43QyYkwVgcDyoe3v2IbP4aWQ77t/Y4UJopfLaOqwi47/07L
	 tvcn3zuE36tSg6OCKkfDqKSCCR18/3tZddkuUZQgE3qirnszhSJCsmZuymuqBJIIBea6C
	 ueIgweZ0QSKmYlTsYs3ActQOT0sqNxEuEMy5YnYVWLz2WIumjTA2jBcdT056ZmS/dEJiS
	 asDTxhYuAGYvve79tKR0z0xjyPIsj+HUvddSxMDS0+a3QaTypRUG57gDqKK1mRhsrQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602478;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=olmEdigEKH/l2IUt+7piWqLgJ9PX4qGgFUArIL1uMgk=;
	b=TPVNUGZ2Y1dAUyAU2F9jkWArOYgY2y/hIxv9j/OLCL8s3C+11J4GH5bviLYbUxV18g1Z
	 v5gTft/dC/fVFpeeesSTyRZY9+Qb2X3FW0n1KtKxdAErmxbutXWJz1HBNaCSpD13RV5dx
	 u/SH95OOHQe4Fd2g1tMdtjbQ8sSaZR+Bz34iHUyvuDHf5uJbRSFkUFVWctf538f6FYpAj
	 u9KxCvTs8T/+f+XE8+mfSJonrYCRMsYyfSzdEtcTS4/MNEtMmzcB2anNWgXwp/gHYJc9d
	 RJsr/7FFEkNK0r5sP3cgbM0hu5K2IwwR+c9E+VCJ0oDOHeQlXsyPYOo5PQQeoHfwjGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dr+22ew+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.48
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011048.outbound.protection.outlook.com [40.107.130.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98162606A323;
	Fri, 13 Nov 2026 20:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98162606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dr+22ew+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eI98TSQWtFDeBcoI9yQY3RE1v1xwAdJUCJ1Oy0uLxP+2AE/l5odVL9a9/mZNaG25/BKgwHLTA7rA1RT8ZcjmNcQlRWCJ4b/Gag6LdTxnWhJ+R5x3kgjFZvXqmlJxj2WwhViLIJRyAM6rTJjwrMFiUJz58DlKvfA+ZGhtJGDplA6JltAosOcAA33+8O+PtrWtcWvPRV9NMr2ic56uHbyGCFLmyX8CdOU4KIbs/G3ECMf+anjuUYolzXVNfHNWdnLQEXJP+FBru2idR6u5t8HlvWaoQuu7GjUEAwXYA1aRw5OEjbtq43bZkWwenWlFTEBHMQTF0/udi6KAaTl5N3OcZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olmEdigEKH/l2IUt+7piWqLgJ9PX4qGgFUArIL1uMgk=;
 b=AGGCgymYoh/Mr9M5Uapxh/bieZsCW1MAYYprETrxMGhRcYKrJTT7FnM1VC7OQsAdXlOb4UIUbd5mX9/yOyHIGgaK05HTi2Pzdmjtcml/bqdwJl0jiTxlKs/0XxtwsBH7ty5kLhg02zPH2myyGOUVhoKF5rjE4vdHm4XZNbwjuP6nZ28Ko2vqXMuzyc4eYBRd8bWdSbyTsddqNICBMnMnA/vBE9EFEsPlhoS9yiupzRee3ZXDA4ZvZq9G12xVo+ydjmgs1wnWb0L1Jv5Mh3mb0tVwiiPekOSV3DJknKSe+XWjnOfnFlcdA2UKLoXdhqWjHX2dhqdw/VF014yb2FAXsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olmEdigEKH/l2IUt+7piWqLgJ9PX4qGgFUArIL1uMgk=;
 b=dr+22ew+FIfB14/9UIqX8gCTMhs4d9j2hSe8ZYUzm9et6CoK0NSSQSwScDjsKn6VISgAl81mTtwUrpRmjgASI7mwlR+Jwkl//4A4gVyMxFC6SO4boD8ViYYTT2tA5AWG/LIX2eZft23FgqHsD9elL8b7HKkd48xfBtNXyPNU4C0xwuWFmZxWLAptaVD5NV52A2v0Wah6IZjmt/5k8UFqJI7HQfkgFPch0h/7fl26RCgXC3rq+SAVKYthE90+LhdMHEDcyAYmp2xzBHmU6XCHpohbj/KEVW24JY7Yx6mSOHf1yQ2pIIHVRLNCtgdBo93JiMIWo6YCthpx7EN+0UB/Gg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV2PR04MB11637.eurprd04.prod.outlook.com (2603:10a6:150:2ca::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 20:41:13 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 20:41:13 +0000
Date: Fri, 13 Nov 2026 15:41:06 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Jiale Yao <yaojiale02@163.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawn.guo@freescale.com>, dmaengine@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] dmaengine: mxs-dma: synchronize tasklet when freeing
 a channel
Message-ID: <avd14upbJZWruggH@lizhi-Precision-Tower-5810>
References: <20261018040724.534641-1-yaojiale02@163.com>
 <20261018040724.534641-7-yaojiale02@163.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018040724.534641-7-yaojiale02@163.com>
X-ClientProxiedBy: DS2PEPF00004559.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::512) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV2PR04MB11637:EE_
X-MS-Office365-Filtering-Correlation-Id: 44c2190e-316b-4241-f068-08df41c674d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|6133799003|261009223027099003|56012099006|11063799006|5023799004|4143699003|261102123227099003|261026140227099003|261026121527099003|261022105027099003|261022075727099003|261028144727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	4q0Fm1mnrh3rTPpufmf9nsnVpxNuPR/woC/K11iXVtpRjtb2/gImnE9aKttQ52mxfa9feqeX2mLTV+28ebJVsh1b5Fk7pi9GdVsHoxUgvQ4bshfNT2HlmsYwwMkmPof0tPD0h4XeIihYaCSpJQgheqFz+hxgfbpa/CerQfKTQ5YKJ6w/JePn/PfQ/uWzY6RL9HSR20K38J8tyEF6u/PPSc2dgXizFzIoiL9Q/d87Aq3ucBcCdkYLzKBbrhEs/Kftw1WCtl4saPQg3JWFwyFiRZF3cj1K6ud/0p2N5zcPqczmSlStXqhF4KmsQT0FTUoRH3YY7tyzhnq/6M9psYlMcHFlYJm9kuUfDSgdc6+FHP0MSqueqzwc2MfCLlSYkfHzdrZvcUjTJvZIuLvbAGRmXmxKqngXuya73FJxc94ImkoM1FRR9cMb+zZVqAkBpn2e7Ab+hPXnSp82YPvc5cLNKE0zKHezd3eacus0dZP5T4IwX5l0P2z7AIlKp67uysntNl3Z7kNxxLC7+D+SqeaT/d3MKxq0CmVzpJsTGDkGfIeNWBudD+agTboaVRFMMo/F58wm7zi2PyBZ+EESy0oDz5F7AKywiQNBSr9Qv2rQxBLz/gxSzJw25Zul1JngiSy7pfIg0WxlB8gUOV4DzAbrm0w+waYHIeFt66jt96F2JvQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(6133799003)(261009223027099003)(56012099006)(11063799006)(5023799004)(4143699003)(261102123227099003)(261026140227099003)(261026121527099003)(261022105027099003)(261022075727099003)(261028144727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jvLzQjO2uUKfSWUpLXyyVudF8N4iyDoSf8xJ8fH+o7ppSLE0xssyp/JJNXtY?=
 =?us-ascii?Q?V5nbNotV9w/k2gV6z447Moifo3SgC4IpY0fHwuklvK/ZLUivDkJOX+VWt5yz?=
 =?us-ascii?Q?+b9CXHDSWLdWEbS4S5vPPzznXqvVy+Pml6FVfvIrXeBylVtlNOW5Dz0q+pyb?=
 =?us-ascii?Q?esKqHhK4YvseszxAEUr39fmUSFr7uuyaPBro2LSoc1nvrawNkbxMQH+n4VPz?=
 =?us-ascii?Q?13QK1yJ4GWjcpznNFnRPzeD+/KfMvtXmXS8dznV8vRWUU8CpRrfB9K9RFKRx?=
 =?us-ascii?Q?eu6PG9jflcseiEoaVlnWMkkziyhVhtjj1KjOSmMU1jBVaZ7Iog6ZVeckuqjo?=
 =?us-ascii?Q?iTHHWrnLDQ71G0HRUo6Vj5JQr5y7TwZUY1KCtphYaF44VJaLCYlNeIkai4BE?=
 =?us-ascii?Q?4jACeNQ/fYQcbXGOLfcb7Ykr6vJ9DqtTITQNVtBMH/KZg1CIjMlCg8BGuUuE?=
 =?us-ascii?Q?1PFgIiI0uQfYfjMmMEjhziM595mTf50c/AMjPF/s3oaNTEVF+QGJUlrdkhcG?=
 =?us-ascii?Q?ocMjhIAxvXfaPEDzN89DnmvjQhALCfidhgY5YBNXC1SG9Y3siyWciP/L83k5?=
 =?us-ascii?Q?6+7/CL6zFjwmNzV+LXWeWhp9rUKWu0v3y0IW5D/aQCMPk/od8wqKIzO4yXQW?=
 =?us-ascii?Q?XPDUp4hXsvhOXqBe4pYkdJSN609LatAXiisYyUuT1ZtE4uuV+j/nKLB8HE5h?=
 =?us-ascii?Q?fckRIWiHGPxUMTN9avklX4RbcDiZA5KKs0httI8Cdyse2Q8dR3RAdYvihEqM?=
 =?us-ascii?Q?AxzaRri24LzV3er0NYoziCNYqF7a/qQwuJcLBLiEond0hc86YJzWynpHqQI0?=
 =?us-ascii?Q?SY5ckArvfJwZo6ZjPsCrmK59nQ1IqfKRaSCrb4dOeiZytMYkuBNZdvVba9TZ?=
 =?us-ascii?Q?lpxtlmd6u92LSVyJmYGFpWZYGB9LjRq1+gfa6cMjt3gammC+CDFmw+OiCZUO?=
 =?us-ascii?Q?lTS72KXKUNqGVvSXyEeYOFq2rse74FjG49TZMo5vgY8UGJgdzP0mGsyPL3Bd?=
 =?us-ascii?Q?zIvhYJ9of0KJ8Qe9wD07v0JUjmYrWlibqw9lYuk0+cxgltxvH6HpT+HJDXTS?=
 =?us-ascii?Q?T+dh0KLdkJnMO8J7gxhB7wzn/bX4FnibWNRTVhanbYGXat2CbKM3duBJ4Gw+?=
 =?us-ascii?Q?e/fddCgP6d5N82XsYZU/Av1sIL51qLK6JvUNzD8BJw8bgwZVNogJhu1xYVLw?=
 =?us-ascii?Q?jAO9eTy5f5+pOF/58lEKf+Zd3GctVN5Wyy5z2hcgBxwz+4Dkd1gCvcm4e/CZ?=
 =?us-ascii?Q?Du6Hwq0oBo3Hk/HTDhr6D70X70GLPXDGlx0Gi45cnZavk7CqEkoDC5DA9dhP?=
 =?us-ascii?Q?OInPkWc9gPL25qUDDzfUqaKTz8P5yj+m65XYZ//Hjrh468HupI/Bmr4GK1Yc?=
 =?us-ascii?Q?ZINjrE62rmSzAb7c6xEpDXIetFkSROdrdXIhBU6QAgltS/0cbTepetf4lIQ4?=
 =?us-ascii?Q?OEf1H4JnGyRVmSveLOkrM+ZcSOatWeRquL60XrP7SxsdC1fhPkmWHM0zrN2R?=
 =?us-ascii?Q?1GPg2Wbkl8PGvj16TdWWq7UycZ0I/Zi57D+joLV0Qsue1qSjffR/bShrsJPb?=
 =?us-ascii?Q?gIPo8+qDU9zkXWAhj4MOMJBi+qO7stDod7vXhO1L06fH4meBGD91bIzWAAXp?=
 =?us-ascii?Q?7VTrPZ95Omcpg55Hg4GxB6oV3L72w0752nL2GEXfZh7++07FIhOlJM9fOsYK?=
 =?us-ascii?Q?SeaJ0Uei9dyxwKwG2eSG4qvKhy3b+rqCWkASPIlUG9znyGS6ng8W2UpxW+vk?=
 =?us-ascii?Q?4lzLyTeYWKYppiL1AyIQBWOXs6ofPDBf2Siz7zhVjbhxRrEdAzBD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c2190e-316b-4241-f068-08df41c674d4
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 20:41:12.9911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11oxR5HeF/giSAhCOzR0MMSzd6b8a+BZ4PGx5kwEzfoh+wszIoR0cVR4B8oIRNmPUhiOwX3SKplLbIMj/QbVwf0Li4Y9Gg9U2Y9lGDNE4nC/vtIJGpBGlmWlhahtCcvz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11637

On Sun, Oct 18, 2026 at 12:07:22PM +0800, Jiale Yao wrote:
> The DMA interrupt handler schedules a per-channel tasklet to invoke the
> completion callback. Releasing the IRQ does not drain a tasklet that was
> already queued, so the callback can run after its client state has been
> released.
>
> Kill the tasklet after freeing the IRQ and before releasing the channel
> command storage and clock.
>
> Fixes: a580b8c5429a ("dmaengine: mxs-dma: add dma support for i.MX23/28")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/mxs-dma.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
> index 7acb3d29dad3..9e85ba45f0fa 100644
> --- a/drivers/dma/mxs-dma.c
> +++ b/drivers/dma/mxs-dma.c
> @@ -442,6 +442,7 @@ static void mxs_dma_free_chan_resources(struct dma_chan *chan)
>  	mxs_dma_disable_chan(chan);
>
>  	free_irq(mxs_chan->chan_irq, mxs_dma);
> +	tasklet_kill(&mxs_chan->tasklet);
>
>  	dma_free_coherent(mxs_dma->dma_device.dev, CCW_BLOCK_SIZE,
>  			mxs_chan->ccw, mxs_chan->ccw_phys);
> --
> 2.34.1
>
