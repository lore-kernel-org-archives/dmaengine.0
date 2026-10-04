Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013033.outbound.protection.outlook.com [52.101.72.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A81374A0D;
	Sun,  4 Oct 2026 01:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791075703; cv=fail; b=uq1BEh1U4PuzlsrhjTUvfXEnKdo9QizE163Bk0kkkmK+XwTgjVgWXvjn6YOO5nxTJ/DSpK5bsJYzVFQzEZRMWpUm7md6hvTKd3eJXlgnlWZU7Odh6Ov8r3ACXz/ABkKr3eS6H17hCuHCq2zAeXaS7ZezgLCLi2nJKoStVGool5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791075703; c=relaxed/simple;
	bh=A6ruhLU733QqtSn7HNzg5j/mdO37JWqDRY8xU9g1iaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SKuHTcs+oJu5Tc+R1HvahHQmgUEN+bjCoPV3Ym4ciaXB0xnfw6gI3ehONe60LK4kNOr7xO4zNlVHh0zu0zpBNR+o17z6MghLOm2/nFOTUcEGVWXx+WbwNiAHCUwjHnfrkKDsHLozaZqpOQUk25BKM1K7pE/xBZrxftZhBHXeFB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=x5z2C9Rh; arc=fail smtp.client-ip=52.101.72.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="x5z2C9Rh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=if8GEnUaRD2pyC7rMYcv8Ecef9IOrxCTmadi67+anoqReQZF1YrM7nm0a+Rfgjt2VifHj4Khzrf/wFO/Xl3VvdxrZKQ+XvvIhMPvbzf8YN2GKJyuPRPuXjV1oCmQknJF439Kltag+jCFuBsmRKo806yRfPOZoEXZgesjnPOzzcMIe0YH0TLx49TldqVqeSnGA6qQkUk9Ua5UtuLoAR0w/tM5NQJnZYEO6UdSskWzI7JG+vohZ69wkbfWoYqaUXHMv3caFZXX+XIQnl4dvnECWmD2s5cw8C5dYpYN4z6h8RmRZ1XthqBL/ojTw/mDAAALLR+5byC3xc0F9ADaGkyw8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnOOrhu7fEHKSrpa2kIC12jMsdB869uudUKePSIAU3k=;
 b=RfAAs0Mvn1H7wd5qUz7ahu9NsgtBJpQwExju+7CrjDoBpH2bthzoLZIJtzqzd3vkaQyw8tZW2osPQc2bYHLsLTIkN1x/k1pgbG14Z18/yzcbqt/YW22gwhzX/FSSv0C0FyzyZS8BKhDJDM8GAm7N2AI3L2smRUd/bkYVE/IqRgkJdSJOw8Ntqo3nS6JJQQzu0m8rjeaUtkPhDABZtO/hjIT34uClVPTrtwSzTd1Ecu0Z4HDhIlTP9DM7vYRwats+tVuSnRFSS3VNj743lGhTXr8AFPWiGjB1dIX2hdS1CJDvZtdkEN8ZqAvMNevwBGtJj8viiuvUz1Oq9NI+eXlOTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnOOrhu7fEHKSrpa2kIC12jMsdB869uudUKePSIAU3k=;
 b=x5z2C9Rh9SocwGHAk/rl3G+zw4SoGRR+T1jMlunvKokA1GDsLado4XHTd1r5RVPxP1Eezyv8YtoieDeRu5opB2bs4iaLP8jmo+0Zpl2Ux5+EG1IE64fIARp242JmR6rsOS/i8gY5Cr4IrkyX3Le8dCPnIqLQOQ7tW8ZJ5I/M6HtEzAJ22LInQ0ShOGYxX7LmoNqoUalGmjcG4b3YcZlNFs4aRxTnfVBchW+9W++q5iPK/Zzg7bATff/ZdcAzWbeNzjXqKnT32h/MoSHCJoLrnY/+dQm6gqofTtpwYrbMGbO8ujDrrs/OksS39Jk5rhE9fTflcZDv71ur1TcGTO6t0Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MI7PR04MB118002.eurprd04.prod.outlook.com (2603:10a6:290:108::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 01:01:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 01:01:39 +0000
Date: Sat, 3 Oct 2026 20:01:29 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: jiale yao <19888972804@163.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Hyun Kwon <hyun.kwon@xilinx.com>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH 3/3] dmaengine: xilinx: dpdma: Reserve space for a
 string terminator
Message-ID: <asGlaZdAw_lsxrV2@SMW015318>
References: <20260926121250.3258285-1-yaojiale02@163.com>
 <20260926121250.3258285-4-yaojiale02@163.com>
 <20260926143415.GA764757@killaraus.ideasonboard.com>
 <ar7Hj-BQW7xPtjaC@lizhi-Precision-Tower-5810>
 <20261001210021.GQ944070@killaraus.ideasonboard.com>
 <7d6a7daa.140b.1a1013df0a8.Coremail.19888972804@163.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d6a7daa.140b.1a1013df0a8.Coremail.19888972804@163.com>
X-ClientProxiedBy: CY5PR15CA0162.namprd15.prod.outlook.com
 (2603:10b6:930:67::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MI7PR04MB118002:EE_
X-MS-Office365-Filtering-Correlation-Id: 23d6f477-4f68-494b-fce5-08df21b30b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|23010399003|10067099003|56012099006|11063799006|4143699003|260925021911599003|260925022911599003|260925021311599003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	c/Ekc0IxXvLkqOo/vw6UME4DlRjxWnaQG3kNh0Fc9i3SNKo3aMF2jkXP58USeAc40hbZp8DKOJy8QQtxq4Otpuh2IkP4DnA8SUdgKQ6mh6vN09PkgSN28ygMfuFEG9g5eTrkGG4r592mfFK2cUtObmfHhkXh2cKtVfksV1uukq6VNUA4OqBVm3Wyx4Q37/JXdAaU4pMD5aYYPSQQrqYiaLIboY0ERNsz8Gnjwt/Pm7RWWnlaJXhosb4LScAMp+Qpsy2aPhAwSUVKfLYRmrbGuU1HCng6MxMh50mCICJKywqM1vQRFw5hqHJ0WybE1P7TDCFPREN5UUQQ1cDxBLa//bQrG/ZRXNokTNlam0XUn3YZHmiBBe/7MvNo9b7VLV+NkTM6S7k6s6FGTeWz/4b9VtLceJFBuG4jgmBYqQ97KPfS9UQqI2DYC2YC3NULd/oslB6Cy4gM/WBSpwbUm8//0fLVb9YUnEp6FvPYx7E1KXw/TCAY2CwArsKIydrcLdnb3X9w1jzVzitU6wCTGY0yd/81b+sHDNQNsZYHJwWjfUr1H8MnUwM0ABqZQtTnyzPvEPkJq0c4J0ioocQVDtyAuvTJjHVBU/ezNt62f/Qao6WOUEJb/3BtFJMTs91+bUj6XFydH2z76IBUoCuQDW/1c90rGVAEVlf2YIgMtuPtHmY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(260925021911599003)(260925022911599003)(260925021311599003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1YJLCR/IJYHClUwmEVdGyWjJSkvJ06uiP0prygbVzQatBlWxc1i39xQ9nYop?=
 =?us-ascii?Q?ihSi5Q005R/VXaMLVlyZcdf7iR7hQU95GlyNCuvtdkpcl42U/BwYuFq9nN03?=
 =?us-ascii?Q?ZI2tef5KdxASkYg3nzvvnJsgUfvwIwtpy4J1ssjJZnIY3VXFp8q06ONqP1Wt?=
 =?us-ascii?Q?yqvjGO5N0Rq0CVKooJUfclm6kunLxKzQO9RhV67qYbeiuxc8R2f/K8bR5DMK?=
 =?us-ascii?Q?L1jCXCGjQV6dFj87vexjN5SFPUtSkiBl6yMsvdGswEC6oDlKc69AhopkkAMN?=
 =?us-ascii?Q?0CBlPtzSW1qY29zYTGEppUaCu9u9EKO6u5h3JgdJzYKSUS+dF+fc8yPpCZow?=
 =?us-ascii?Q?K+3hQ1fEt6SobUHbBfsGpZF1g4YbXPlHDgXZx/X4eYo9R2A7URkxY7BvU0c5?=
 =?us-ascii?Q?YdWwrPQ5qc8AeDLFnLcAYcn3oh9yws/X0/AtbZ/+0PFU3z3usr5gg+rTVW3K?=
 =?us-ascii?Q?9gtBIn+XWgsS+fIFT1sg72FiIhoRA9ZTJCML33FeuI6f+jq7WajNSL4yhPRU?=
 =?us-ascii?Q?unIOBYCLn7ofXwLQK1b+CHwWmBRETAUHC1miZVxy204e1bsPFL/MaR6Gdrxa?=
 =?us-ascii?Q?/69X4xWh4o9nbhzpbsfvrHG1+qsRnrLjYPJFccwBciyly39/GjYGIQgLPRJc?=
 =?us-ascii?Q?Y3O7OgfOj4DUaxe7tvxE5pywaoIiQ2npirDcyKXqUZhAMjgu8n3uuSdMke4c?=
 =?us-ascii?Q?Ncebv9Gzo0OMuQM8XGJuTLhBMKX/CyJShf/4u4B5i1zWIgitFeS0s8SWDiQU?=
 =?us-ascii?Q?qDHiCFfQPTUd69c0FHwZnHPrH00Kh2VqdNKxtdttvFrbqpfRq6DPlgGrXhln?=
 =?us-ascii?Q?7jzpuIz3q6hUHUAf6fp+IZQNrk/V1yZjQlpMM3keyVkzt18wbdM7IE1A0jmQ?=
 =?us-ascii?Q?2dMvZKxnQps5pY8QNy0GYEO2tiJWcCl+hEookOl4mFLURCU3DFqixjDF7TRI?=
 =?us-ascii?Q?pQ6OxRdoYADWn/IC0A2h+ViiZF9vdyWEpSXsV2crj+gtcuqYci30++gioCcL?=
 =?us-ascii?Q?tvWoEOjZHMJPXZAbW5LKXwmv61Xf4Jvo3f9AFNBAQGNYIqDeu0N36fULyfTp?=
 =?us-ascii?Q?tMmZivI/gxMjXUad6TUvG09wv9MNJJnDJMANV69koozQ34oyLZ4b8eSEdDBn?=
 =?us-ascii?Q?YhRekeIM2CxZiOM9GHRPzXDkdPJ2ee+HPOFcdsIUZBiYEiKX3lPcfQtsDS55?=
 =?us-ascii?Q?amMJrlgEXgT72T10++ts0yD3lwMfI/fXT7bYUZaS80dCLZslOEhs/6DkHfzz?=
 =?us-ascii?Q?HCHwQkDTy664sGb8YwcifoXCtx4Dl5Emu/4s4ZT3I9bTyqykSk2orsIltAqV?=
 =?us-ascii?Q?25dIv+1t5lKC84mckZxw9uDEhSNBXhZ0nAbKJbxvQPWDyAktJ0CA/HNi3B5T?=
 =?us-ascii?Q?57MnuHBoxrfLtSMDkZ9p0NeD3ivU3l0mSrlKcBeYLARxx1qnI8e7lyKM5Lm3?=
 =?us-ascii?Q?2wnSGbQXlNI2ZVBG1746P6kZOcAr6p554+8CgjsufqSXIdA+RVAzPxfuce1e?=
 =?us-ascii?Q?bGACjKCO6d3hgszna+On4Snrj9F1LErlKMRKuK8CalYArt0j7eKqc+dm0QNg?=
 =?us-ascii?Q?0zO69ZKrkksyORGVEJF+QVHTy6PrA3jcUByeRd0YOGs5CDgc7yKeSJ+XJdND?=
 =?us-ascii?Q?M4o3SA0DAuLbzjy0KKx80ppzOCVULq/Y9Xs01LLakREr3/9eXiERv7rFsqFd?=
 =?us-ascii?Q?WNGZccrS3LraDsiBW6h8LKABMdgiwc6UZXibNf4hrYj21LKzT2kExHBduACC?=
 =?us-ascii?Q?Rq+viugiQUkywTvN94SBuHoGstd8n2zB6oKDxMBmlkdbUHMZMTR6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d6f477-4f68-494b-fce5-08df21b30b90
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 01:01:38.9477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Xl4oRKwSFnEZ3CQlgEdISDIUxiQAaMiBTk5oT4SPaY/HUbjbZf2jLaT2Fg5UTdNXSOZa1XgRbGLW2KCULcWzj/dezh//C4vdjPt0dCVc0+LfcFWX3Sr2lnaRj/1ayMd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI7PR04MB118002

On Sat, Oct 03, 2026 at 06:09:58PM +0800, jiale yao wrote:
> [You don't often get email from 19888972804@163.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> At 2026-10-02 05:00:21, "Laurent Pinchart" <laurent.pinchart@ideasonboard.com> wrote:
> >On Thu, Oct 01, 2026 at 04:50:23PM -0400, Frank Li wrote:
> >> On Sat, Sep 26, 2026 at 05:34:15PM +0300, Laurent Pinchart wrote:
> >> > On Sat, Sep 26, 2026 at 08:12:50PM +0800, Jiale Yao wrote:
> >> > > xilinx_dpdma_debugfs_write() allocates a buffer of size bytes, and
> >> > > strncpy_from_user() can fill it without a terminating NUL when the input
> >> > > has no NUL in the copied range. strsep() and strcasecmp() then read
> >> > > beyond the buffer.
> >> >
> >> > strncpy() has long been considered unsafe, and has finally been removed
> >> > from the kernel in v7.2. A better fix would be to similarly replace
> >> > strncpy_from_user() with a safe equivalent.
> >>
> >> Do you means use strndup_user()?
> >
> >I was thinking about adding a strscpy_user(), but a dup version could
> >possibly be interesting too if there are enough users that call
> >k[zm]alloc + strncpy_from_user.
>
> Thanks for all reviews, how about this one?
> https://lore.kernel.org/all/20261003095922.575350-1-yaojiale02@163.com/

Looks good.

Frank

> >
> >> > > Allocate an extra byte and keep that byte zero-initialized, so the input
> >> > > copied remains unchanged and the buffer is always terminated.
> >> > >
> >> > > Fixes: 1d220435cab3 ("dmaengine: xilinx: dpdma: Add debugfs support")
> >> > > Signed-off-by: Jiale Yao <yaojiale02@163.com>
> >> > > ---
> >> > >  drivers/dma/xilinx/xilinx_dpdma.c | 2 +-
> >> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> > >
> >> > > diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
> >> > > index d9a3542c4531..b61ef3062d84 100644
> >> > > --- a/drivers/dma/xilinx/xilinx_dpdma.c
> >> > > +++ b/drivers/dma/xilinx/xilinx_dpdma.c
> >> > > @@ -410,7 +410,7 @@ static ssize_t xilinx_dpdma_debugfs_write(struct file *f,
> >> > >          if (dpdma_debugfs.testcase != DPDMA_TC_NONE)
> >> > >                  return -EBUSY;
> >> > >
> >> > > -        kern_buff = kzalloc(size, GFP_KERNEL);
> >> > > +        kern_buff = kzalloc(size + 1, GFP_KERNEL);
> >> > >          if (!kern_buff)
> >> > >                  return -ENOMEM;
> >> > >          kern_buff_start = kern_buff;
> >
> >--
> >Regards,
> >
> >Laurent Pinchart
