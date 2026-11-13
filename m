Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601150;
	b=e10qsuTexMK7qM74hVy7w/X4l22b6hxIewxb9LgCw3atmKfe4fZ/1pOGBiN6X/cT5wzX
	 WgpivhaJAmWbj+09UjNYE9iFcIJrBp5DmmTY4nl+Ap2G8SyKL7x2yJaSgwzzmv1xEEX14
	 19an3jBTDKu9SIrzrO5nZTGuOXwPZA/2UiLQvpCpX9Q6b/Uu3QZPJGH6XxHHWBzGckRGu
	 /D0eOyqdOjz/Zyo5xePDj286eJkykC+sBNEnZ7TQU96P50xr2/JGesBdE+E8J9zYoE09Q
	 iq2Xv8StrtB7ibaUWlTd7dDpXbNaJjF1VPJaz2mB5dDIGBDZe1NSCZGxwmYPn6l6jdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601150;
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
	bh=yEkKIWE9scLfnkFWuN228FfBYIJU+kf051m6ibPvm+Y=;
	b=v2IV7Na8nCnTReuf4l1+GN4lZfPVSo85oTDdHb+Sz4/9rJlHwbHEvYVwmeGVcJsF4zxb
	 y2ygD6rBrJGicLEzJaqFh/7UGoPvXBG58mvVUgOhhsADuPsm5oaBMs0LutPd2i4qIzAYE
	 d3s8rWEiMWciOCDsJvfFk7/5G1vMPd+KB1qODzKpJp0yBKtXs9VJvry+ZRm9uh3cW5zwe
	 wq+pkakR6EL9VbHwQqpGg9Oym5RnxXfVuCSAKxfJNpdME/ZvL3SpkaaClZw4lQXRpfr4I
	 q5dOIe17/HUXwgAjJZQILqjjzeouDGyJZ6NyLLfnbd0hmXa/OPRvI31WHvhQZ05CPfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=f016oQMs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.39
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011039.outbound.protection.outlook.com [40.107.130.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3A7606A335;
	Fri, 13 Nov 2026 20:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C3A7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=f016oQMs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9X6zBLtxK6TGifalUC3YjFKMEbVY+J9KJLoog7cnFjo9pvDvllq7pEfBW6RW2Dn/lL0hAJwlPl8tF3HY4ANt8QlKprCEJ8Au9T517zeDq2q2GQSVPWS/RmrW5M1dwpZXDxOCN2Fm+hYpK7pjy1BKo06RWqzfPMwG5DKxIhIoioCqC/6Q3gg9wsQYQE4gXzZlkVAvTKWO8ZzSHS5XvByW23WKu19TyGk+7u7y0MgObw+QfMhiv/NzABeEse749y+ae4Ka7QrzPDu6AVr+56mysQYnfaD1e+FUODromzgvHykXmhsAKgRHWqn+I7VfdiUMU/Pg4LVnGExsE6SyPKkrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEkKIWE9scLfnkFWuN228FfBYIJU+kf051m6ibPvm+Y=;
 b=F7EOysfXV7RUN6P0gkCOHQdjQR0EDfyDTSBlU/kgs7oTRqbcl21sCz6fuZDkKqZ2aKgbCH4R6L9LpHkG1vAXVWesuMKc5QYSYvK1G5LPpHAySJN6rQzdOfx5qIBwP47NVI88A+7iPWpGsziXJnRouQqN0bO4juZMy+452Qd+WLvyMiO6no1yD7OvPGNyqGyR67bfyQ8X1EhWH3fke2ZwXOdLDkvy8k2tZh712DkWOHYQpn9De2x8+fG5/W3GlmuICmdpELdhxAeBswtw20S3CJyAS2KPCKb/Xc7FR4JRyd9HMHtbFgkBvgYYTEBSXWYRpzKTjdJh+hypqwxxw3gEmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEkKIWE9scLfnkFWuN228FfBYIJU+kf051m6ibPvm+Y=;
 b=f016oQMsYPOrqUL68umSUG8Np2ztifefTNAXm9FvqFh6JEpfWL2B1sf6iZVVx44E0acBoyMNmQQYcdmEDoDR0743cuhi29TCzHLqHb7f6gEBOpM1c9VN9w8Xov7UJCqO3JAQ0vFXn1wtN9/JK2qDexQ6ZcQzt+L5JkiVNxcplTTmc1Z76NyuqUFvS/YRgBDpWj5fbCrtsvaMpPsjMt7DhMtHkBCpcqbKvjpJj4ClWBYhowW2zoXbIuGvh2vONYC87e56pROQ7ZTohIg4DtM7klrqsZW0N2tDjp9omgTX9op021/Pqtp5KcFaS51fU73UNidCEnwbWdUURAwf0ztLyg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV2PR04MB11589.eurprd04.prod.outlook.com (2603:10a6:150:2b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 20:19:04 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 20:19:04 +0000
Date: Fri, 13 Nov 2026 15:18:56 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>,
	Maxime Ripard <mripard@kernel.org>,
	Jens Kuske <jenskuske@gmail.com>,
	Jean-Francois Moine <moinejf@free.fr>,
	Hongling Zeng <zenghongling@kylinos.cn>,
	Chengfeng Ye <cyeaa@connect.ust.hk>,
	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/9] dmaengine: sun6i: retire interrupt state before
 reusing physical channels
Message-ID: <avdwsLngQ1zBP7pH@lizhi-Precision-Tower-5810>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
 <20261023-submit-sun6i-dma-lifetime-next-v1-v3-6-ef1acb0be768@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-6-ef1acb0be768@gmail.com>
X-ClientProxiedBy: DS7PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:5:3b4::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV2PR04MB11589:EE_
X-MS-Office365-Filtering-Correlation-Id: 60028740-394e-4d4b-cd38-08df41c35d0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|19092799006|23010399003|10067099003|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|261009223027099003|261026121527099003|261102123227099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	sMCaFcm+CY+MDzi2iWFnTHhk2G29aJVm1eHLjTWyqc//tcsbye8a/mu7LOKRBsIcJ8SmgCZWf/MgrAaih0J91Y9G6IZ1oD/NTt247i8giVCJ7mvy4lQYCrfeXZOWU6WVZtYQuQwHIvIZb3LrHS4NNdvn8GTAkHHQODO9QNNJZWRQ1JQuRPpRISMnRzlV11qDvfZBSBDzoBrDMBZhLPCJ+ke62Jvfk8/Z5CycRQWfbBXUuO1Vy7/qDJGK23FUvCqM9DJ2Bqckpcd/uZ7TSMrjcoslek99cinf9Yl/KbcslfHvr2Gv4QN7DTPpyVyJylCcvx1ONkdSayNYzojmit4Ks94ldRHav3kdfLXc4r0qSUPYzR9zEl0IgD+pKjTe9lsLJ8sxibair8dp0dhoVa6pzrDZpKsvIHaJMRRwvlLDmGN+JWV3lwA/zrk/+UXObHIBAqKxquIt9aiTHv/d+El7nAD4gExWYlSebU9qzJOEljPOt+o6FwDiO6C6rLklaHjYtZbYPn1SADk9h70wR9LVr2qGnvYs/QFnk+l/+YRaq3sNQ1g/kj5yO/Ju9XSjNT+GiCE0Ced/6bdzInW+aj3kZlWH/H92p6ROdrgcf+pLqwD3NJDffr5ZzdXP6PUfBYonDxYOVOHxNnxvzCZZLPoEx843RLLbGTgFKGmMqr3kpbsg7Rh9ssFoihrj6xS+LcGLKj5ugKbwEFrnpx3lf5QKdX+p9LZ8PfynWdI2utdsQEI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(19092799006)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261009223027099003)(261026121527099003)(261102123227099003)(22082099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rS3aLpjcHYi9EjWiGFwxnbEAU9D0Jz3JNbthlN3cgFQaEqTvuvncJj9N42T3?=
 =?us-ascii?Q?A758tbP8D2tQh0ubDutNKfHC8Z8kRAMEhgpE7CO9Cq1P8OzG7xMFJe8eC0fL?=
 =?us-ascii?Q?9tNwFrPwFBSkQXRV1WCyWy93vZAW8g+h8IrhhTAFXp04ZDAMejAUkXzAJFPT?=
 =?us-ascii?Q?U1vpvaUA1Y9JxNoBn7ncRPFEkSmO0B5GsfUcdMpb1TpVT+v5Kgcy9YWek9Og?=
 =?us-ascii?Q?eHiquNFE+c6m5yn1RJLidCZetv5Av4Fve/YtKP5uwXQ7VxDrm48XTT6HTIfn?=
 =?us-ascii?Q?ibBKHMJGjvVehArQXA1xv9v6bqovcaWXzzhhUIzYfoCVjB66FtutRaIgXJhj?=
 =?us-ascii?Q?DG6Mm6qS7YHaeRNDiyoCk/08u+D5W27+8W7LQcpQcthn49lNI5v7QjaG4izX?=
 =?us-ascii?Q?3HD84pvtPzwWIlbQ7sCbj1BAmparPaH+we+htciO8PAru4sLXOG7yvKrD1/R?=
 =?us-ascii?Q?Y9FyJDQ0nCxZxrszS0tsk+/BjWwbcn5jUh3Topy9eEgF49q3DT9txFnqEl6+?=
 =?us-ascii?Q?J9WENuRQ13zju6rTVUlyMWZsXDnvs7bmcomTGevMGYV0AVxQ7YqZFFz8lFxB?=
 =?us-ascii?Q?TwucmxhfRbm8tKjXU6k/95xh+qfv1hkvd8DYM7S6jMXBB1y+3MT4TedB8PPX?=
 =?us-ascii?Q?J42s5I2a1I2y2XWC70eJZXx6XCRGPqRbr17xRvXxVKi2Rg0pnys+AJVhT/Ne?=
 =?us-ascii?Q?3Tv8uT+15Qsvc48VrK0r3xohOSxJgUBELj1CPvHUwxVEznDDMc5JsXSKTWH3?=
 =?us-ascii?Q?fqnQr2jK9YvAJut/hiIuhjOePx9GGTIQd9nOWpM1wLxLStVpfe532CIY8TcZ?=
 =?us-ascii?Q?S1YqEVOGx+OMXjb1cWyvEzfE3/0cMRV/rnxUHuizCeRbSTub5wcINacCl4UP?=
 =?us-ascii?Q?NhZhvOlVVL6Cnt5xBUs+xaEjtkP1NiWUWhnDvQzZp/Fy43ryf5RyxzsleVHl?=
 =?us-ascii?Q?TguQq88Hij+unm8SrVLGl7lyEkcwE5FFcv/YU3X0+7PQou44RrLWHwHVfxzi?=
 =?us-ascii?Q?chUsnAqCnd1diFEdSL/ibYH5K+jMfwC+CwarhJ2pjoP/m66wsIeqDyp4RyWY?=
 =?us-ascii?Q?BfJM2lO7HDGPKgpsH2cDqO6ywd/tjGdzxlah+CI6JMDvjf6Q/iP3GMfOLZRh?=
 =?us-ascii?Q?t2BsBUt2JsMt14YlG3WX5TkES2Sj5q4wQLj3dwXXi3g0OJhKPqVN/FCHIp/3?=
 =?us-ascii?Q?/Xlut4L0WSSslkPaQHf3H3QQWr0rXMyn4cRBn31MBASaDcnqnNOT+zVUrhyA?=
 =?us-ascii?Q?fD7Z0olBJ7+rmIlvt4ijVap/HRalpuO+vJDAyFMId1aNx8NY6X4P0n174HR1?=
 =?us-ascii?Q?dstK2QWwM4meN13tJ1qMZX/N+hVOgLWHUU4kDJvxJVvlkTxf+GuRb2wI5mXf?=
 =?us-ascii?Q?nKwNvgDMfCxObQxVgEnkvuspDwyr4VkDhe3MTrztuHGdRD6c35CEFs7flsKb?=
 =?us-ascii?Q?9HDLoluTBTzDyukAC72KcpiVNG2ROL/b2G3C0EXFv7yGB4X1aKe6oRULhg6R?=
 =?us-ascii?Q?mMkFnmhlom22hlfwUhMOuy4ifQN8Nng1AJalpfKxtI347CyY7PKK0Wn+r6eq?=
 =?us-ascii?Q?O6mhSlzZhLhDl0u+vTva7zhnCkW6k9cqr/n+LMzd7xqR/n3CcPVLyBCcxCRM?=
 =?us-ascii?Q?OD4AtmTNhjB+yiKiJODlV4i1eeT++fBtal3pZeSCkwRw+ZYf6ii+WImiqtqm?=
 =?us-ascii?Q?HQPAZ+I9SVrTEZTligqzm5Z/AHixtpWSo/l9nycSzXXsutJlnicfmKgFF9jA?=
 =?us-ascii?Q?l5pHVGnAQUbxiJEkTw7NbTid6/qAOQb5Nv7P3T8RZXanfFOcW2ph?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60028740-394e-4d4b-cd38-08df41c35d0d
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 20:19:04.6596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/kvxHGXw4OwOSMQBaTmoFSNJbd+tyIGQyTml2GQ5qStLkV/xxq0fBxFBwy2p5nR5dpIKcq8rYXHfMoL5H0mfxImF8tvW27QmoOfR0qHidlHNZ5qn/xdQq4nwBdofVMI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11589

On Fri, Oct 23, 2026 at 05:38:25PM -0600, James Hilliard wrote:
> Termination stops a physical channel and drops its owner without masking
> or clearing its interrupt state. A completion latched by the old transfer
> can therefore be delivered to a descriptor installed after reassignment.
>
> Mask and acknowledge the stopped channel's interrupts before releasing
> its ownership, and clear pending status before starting a new descriptor.
> Keep these register updates under the same device lock used to sample and
> acknowledge interrupts in the handler.
>
> Schedule the allocator after termination so pending virtual channels can
> use the released physical channel even when no further interrupt occurs.
>
> Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/sun6i-dma.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 900bb629ba3b..dab17b3863fc 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -501,6 +501,11 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
>  	irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
>  	irq_offset = pchan->idx % sdev->cfg->num_channels_per_reg;
>
> +	/* Do not deliver a previous transfer's interrupt to this descriptor. */
> +	sun6i_write_irq_stat(sdev, irq_reg,
> +			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
> +			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
> +
>  	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
>
>  	irq_val = sun6i_read_irq_en(sdev, irq_reg);
> @@ -973,6 +978,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
>  	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
>  	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
>  	struct sun6i_pchan *pchan;
> +	u32 irq_reg, irq_shift, irq_mask;
>  	unsigned long flags;
>  	LIST_HEAD(head);
>
> @@ -994,6 +1000,14 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
>  		writel(DMA_CHAN_ENABLE_STOP, pchan->base + DMA_CHAN_ENABLE);
>  		writel(DMA_CHAN_PAUSE_RESUME, pchan->base + DMA_CHAN_PAUSE);
>
> +		irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
> +		irq_shift = (pchan->idx % sdev->cfg->num_channels_per_reg) *
> +			    DMA_IRQ_CHAN_WIDTH;
> +		irq_mask = (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) << irq_shift;
> +		sun6i_write_irq_en(sdev, irq_reg,
> +				   sun6i_read_irq_en(sdev, irq_reg) & ~irq_mask);
> +		sun6i_write_irq_stat(sdev, irq_reg, irq_mask);
> +
>  		vchan->phy = NULL;
>  		pchan->vchan = NULL;
>  		pchan->desc = NULL;
> @@ -1003,6 +1017,8 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
>  	spin_unlock_irqrestore(&sdev->lock, flags);
>
>  	vchan_dma_desc_free_list(&vchan->vc, &head);
> +	if (!atomic_read(&sdev->tasklet_shutdown))
> +		tasklet_schedule(&sdev->task);
>
>  	return 0;
>  }
>
> --
> 2.53.0
>
