Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795032216;
	b=tYlwnq1yMy5c9Gb0z6BEAbJDFfgMesS+Vaane8G7vikYD4BsxDacHBoBFCWl/yWubsEQ
	 LAuob4qn3f00/iLDASGwbI8kXo+LX2+rG1xLrvYvh6G05V0ZnNdb6NwEX9rLZIeAVDsUY
	 m4h4nAv9vizyfcSI+JcG3x9cXKnLHIdQAG/bbp2OmRo2u6To5j5v07OJzlQyt8MCqTYKL
	 E4scEsVjO+P4giBvbQOSUCc9LNR04BGym+ZPx4OcJuqcf1MBM55s5gvf/KtebkL9pLDMS
	 VOVdk3aasE4yXG0H2N/8G9zlcwFCY+lAuwVNndqDoVVZwHPlCAT++dC+y+CO7eVOEhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032216;
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
	bh=qbPNbVU2BIkPX9A6bZeUI6LHQoHnYAzExOCQqgAWqnA=;
	b=D9YrX/kUbwF+BO+sLs8Cnv+bL7dUqqe4reBDS9SMjldzqSBEjaiz8BIL2GdxKPAt/puc
	 iee5+EyZd8mo/C/Kyb7tATGpJb7MzYsNospPF+fUoIjLFPEiUM2EZ2AFWuRxCLju/YqFD
	 KOMl4Uqz3fKDe2Lh0iIawuNzxDV1ahg/2St+D0nMYiBs0tCZ73Ns6RyYrdrL/1sfZO8O1
	 Cm+hVa2wsVxUO2xHCIG86kbYUMgJiFJIxiT6iauzK0aigUIVYRmd2o149tUwkSvUSmzHX
	 DRpEC7J480hkKUgBC+ddNkL6DemzVQgUN9cFkL5ZaHR7B3V9XcamdN+WVlPZJX4fV7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kMYKg4co;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.1
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013001.outbound.protection.outlook.com [52.101.72.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9690E606A31C;
	Wed, 18 Nov 2026 20:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9690E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kMYKg4co
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNroMiJXhN4m/BsULCSGQzVir8IyyWqa1HEUvA1dhcPSEvIfBG+FmQ9oqo/jU5jtoAjCJEH8P0qQNx39YbJ1BVWczrXPnBS5TmJKwJAP/YACDs3C+Z9y5/NF3rsp0GctJI8v0A0mwicVxU7wBrVyM4Qs6ozB0ch7gxSaNXNRlRn0mJ6wFFVfX0T7h4TETNaU7jOVt9xyI9NQ1ioS1fOpGSuzR2J+2wFwHFIPKUwEMrbj+pGai3lRgm7ye8qe5HsjTP5hjBmCW2ZgXU7h/JWWcDxTOctgNUxJmBrQFdiEdur3mQwlImCrnJuQw/l6GHnmoE3pBVG2l0yIdyifMeIaXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbPNbVU2BIkPX9A6bZeUI6LHQoHnYAzExOCQqgAWqnA=;
 b=Rq2kkRVhCDsvEnu2aulfO6MImnG4KTwqc+pf2IfUkoe13m3d+Iwm5+GDFfO4yE5GHRkz+FDveBubJRiJaChxf00EzuCUiVT+c1rojNNAaWjklOenNbXKWJhx+hKTe3fO3sW4Pk9+siQVLLyGBWIgPnOKQJOS/gGT+qKsFOpNlENX/T9zGkq9Ck0CGaMWrDIxUHZilwhzw3Xb0DA1zIOjlIrnUJwAhD6kMXE9tpxrgAQF0TaxO/h37i8bnFLrucQGR1Xj0nWKVna8L84oFHgeToXuB/P9UUGGQKYV/6A8f8KVJsgxgbc2DRjOp4xGyseWER0PzbW1XZe05u059T+9GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbPNbVU2BIkPX9A6bZeUI6LHQoHnYAzExOCQqgAWqnA=;
 b=kMYKg4co6sAhSc0i4ARZv+JydfCVvfUCmllzPm12NSock6I9mn/mlOKDZxGKdXOXHq34GtSxRs40pIf5IvwD8EfD6U8E2+TuI5K3HTFRWNuFM8Cfdk4lrkJxsImDQyaPdkV+PK7NWznWT6LQmGCPTBJoNKgJNW0u7ezpuMhzGbYfzj7sXC8/XM+DjrkflVzaNblyK0jQVLEvyU70TBHwPO77kKyGPnq0Xq8m4C476C0XIfGHEF57vuz5IiLCUbwUfeC9dk3rB5IznycTPMhUgZ0sNnusHHHZCkC08jsSDP4zZrycdAoENkoMxme/DAXs8xCRa3RRQtZ2LFOGYvuBTw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB7893.eurprd04.prod.outlook.com (2603:10a6:20b:2ab::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 20:03:31 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 20:03:31 +0000
Date: Wed, 18 Nov 2026 14:03:22 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, dmaengine@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Sireesh Kodali <sireeshkodali1@gmail.com>
Subject: Re: [PATCH 2/3] dmaengine: Add support for immediate commands in the
 client API
Message-ID: <av4Eis87C7QBxkd4@SMW015318>
References: <20261115-qcom-bam-dma-immediate-v1-0-9a0df4ca3be1@mainlining.org>
 <20261115-qcom-bam-dma-immediate-v1-2-9a0df4ca3be1@mainlining.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115-qcom-bam-dma-immediate-v1-2-9a0df4ca3be1@mainlining.org>
X-ClientProxiedBy: PH7P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::7) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: 207f5d0e-9f3d-4257-d0ac-08df45af04a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|19092799006|23010399003|366016|22082099003|18002099003|261009223027099003|3023799007|4143699003|56012099006|11063799006|261026121527099003|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|261021135927099003|261022113327099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	lo90tM4YyXjtOYYzIE09d1NPhxqeApsdX5IMpxF1MoigY0nkd1bVGEg0nMpdbtZHuV1An7+qnIt7tkSR0yTeNNsV9820Is68aNd3jYLEJ7TtaSqwFCVTbKyz1kJgXGEnAw7kG6nGlVH6K7HVL+ofdUA9Logl9ERwoU5Tik4hdARln8+msOgkv1AsKfM+WBYsvraCpgBPQua8UNdq1EBZvqYdL+L99Q9bOKGBFogai+ZfhppWB1riWgaub+t5mcdazeST+pREp1ysx+ZGb7C7aTPaipUtjC+Xw8gD/BOQ3Ln7h45utu4k/9+C1uebpiITdbPc59S79cIg3vdmcSOejCPLsIPUktCkLzWGklr3qjaMliQHPDTo2Okfa6WBiGRPMsQFqbnoadMcXQXJWi3dfXUOl/9wP1IusZVvwN2SGX2iWapjLGZf6Eock+srOtvk8Fm+ZRk80lW77hRZokrv0k3DD2rLxeCSSu51JcVsAkRCdwEDnALUnHWmY3HxQR27VTzntHLFWXmq+xnh5Ei0uv0KufJalm1WcU1Fu3HkdXnHGxP62qMyCrx8/xvcjvvef9xU7cuclqLJaJ2vig6/0uVCgDBwz+OpimIg07XxxuLfckbasKwnDgNJjN659P+ENtZ9al928wWFQjLEys7rVtFOc9Viv+8heep2VoX6Lss=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(19092799006)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(3023799007)(4143699003)(56012099006)(11063799006)(261026121527099003)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(261021135927099003)(261022113327099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HfNgRWWQ7GRmTKiSYGISqiPe/zy3K9iK0rCptpoM4eFyzDclhalCQt1E6yp4?=
 =?us-ascii?Q?ggchrd5rG500tu1dzPKWbQdTyqWvbalaCvfBqOSEEkN/fB+mFnc41wAMTPnY?=
 =?us-ascii?Q?umgUckP+nYgxs3j0zZPHJxvaM0JoNO1QTj0vayZuYWQNEpTiWmBlIpEJld97?=
 =?us-ascii?Q?mZ77DYzDRRjVO16ipbOlK8vB1CBmOyxBqj3Z6isjmjD5PiE0/zs1WrhxVIrk?=
 =?us-ascii?Q?brJxXn9GE+uHms2BW+XuTZYEPsSf8Kut39F8+oWYx3jz5O7NvF2gmQ5Idbc+?=
 =?us-ascii?Q?QZ6dSBNg59bdPqEpZjN0MbGNzj0uVyeroZSZ/y+6GA8rpOeRy01NiAMriBsM?=
 =?us-ascii?Q?ej1QVMlTicdBiH00lbQ5ZnIjMHK2fyHKbdjrk+vXNeeQsm4X5t3trd6zNmf3?=
 =?us-ascii?Q?3HL5N2RJInfeB9+HSg8Gr597N1EzKrpnMWOkpB0MvGzy0nGttLXbT3Zzl135?=
 =?us-ascii?Q?NIfv/SaETQOkexicm+/Lnr6+XIbZwSywhT7m5edjoaSm/qfB6VoPCo3L/mS4?=
 =?us-ascii?Q?74yY2qzFL3bYG+3mWc0JgRzOCe8L6ttF9rpU7s4dAeTdYDKH6SZuY/hHhx4m?=
 =?us-ascii?Q?bDt+CJHHaUHC1dGL7y7KHWSwqDUh6nweJZ0uGq/PwkKltxTSLSnCPRf+6YeB?=
 =?us-ascii?Q?Y4TVeYBuAR7n/GZK5DvlzP66Vti5XyoVKkw8Q3thTswlMhBRnID+wRta05Fa?=
 =?us-ascii?Q?JO+o2lynHL5+Rf6XmXGnCFPx3jBVQ2g1hN6XU4CrMApzeNaQaD3EOVUL2EN6?=
 =?us-ascii?Q?/jtS5e461t8KkLJI67sWcXfwedrvdxDVt/82ziUaSGZ0bWtBJD/5Q554Z3ja?=
 =?us-ascii?Q?n/zTM1bNygxhF/9ZZ7rPnyS2Ph9Lz5x6RaBAe/2dX8czW4sgaMcklK6hAu8R?=
 =?us-ascii?Q?wFTkNxMP+IMe7R4Fwq6C2U2GhNDDGjywKy0nisfNhEM32AtUKyJ65c+7EtqW?=
 =?us-ascii?Q?j9+iXoHNLbdqA06m6J8mDqQdbQcLt3EgZNicar+v8cDAyPMBMT/avmwkQ2yB?=
 =?us-ascii?Q?j7CJo59P6a1x6C8Cq2RQjGvR6BxzWs4ExxI+WNSZ8KuJS1Bo/f27VaP13MBe?=
 =?us-ascii?Q?id1c6I8inuzuEdWZD3aqvv3zqEbZKznjBwVirtE6qwm9Dtgj8QXkgfDMeVxS?=
 =?us-ascii?Q?yDwudgOdywH+diynJme9qEOFh6jyCfAoAVlTuffwmPCl55dDVikNbNO54FV1?=
 =?us-ascii?Q?wie2LaHOgsDgLMqCu1r6pdk85WFbR25amhknjPRwEC+tl1F76CPRyh/agIa0?=
 =?us-ascii?Q?Zt28YsRh9u3HGmApRLr/wWbcbVjImFpggpLfPHFsllMz7XJt0KNu+/HoYXhp?=
 =?us-ascii?Q?+fPFPNQ5KPRjnqA5e0Uwn2euKPg18lQyzaiy8+O591JNytnN/qZCKMFd/dAP?=
 =?us-ascii?Q?wphVSat5+63tqP7GXXMpuVII6zg8+DoyopmFOA5xL/ime+aXJXRIA0XLX/kM?=
 =?us-ascii?Q?hu9eyUYcfvQ+FhzNZO/PHB+FTDXqopaKh2HiDtvD8XDQ05VK5Ro5nyitImj+?=
 =?us-ascii?Q?Pfr5FPLWJW+c18LM8xQeiQiSpNj93/AaxjPTvk9oa8F4n+SUSV/QSEdpOa8K?=
 =?us-ascii?Q?Xx49NT0aQg58/AXkxQKWr3vG1qUYP143VCqIpddQRH4ZxbsH9IFCs+wzKGtR?=
 =?us-ascii?Q?NMk57IbUovpOTJ5blZ/o9C7L5TAuqCGtbOMizynQxtbjAJN9N5xCMaGGuVtv?=
 =?us-ascii?Q?/zbw/bTrurgwWCrlHxELSHb78RGwA+ZWCwaKm8gGGQJFLFlEe6nmrLM83ocd?=
 =?us-ascii?Q?Scu1PnX+40y871OS8ZocSAl93Dt3OQ/Fuvye0XewlFf22XeNTM4H?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 207f5d0e-9f3d-4257-d0ac-08df45af04a9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 20:03:31.1820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gngHv4g/2evvjMyFFwpaHNW68fyHjYaaVPU93YchWhvt7m04f5xFb5UuKgqS/EnXXdNXS8F3Gr41pugAwdNLi2pQRqQIoscmXTdeR9+XPw1VN7WFSMjDCE7l6px+Nft
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7893

On Sun, Nov 15, 2026 at 05:02:44PM +0300, Nickolay Goppen wrote:
> [You don't often get email from setotau@mainlining.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Sireesh Kodali <sireeshkodali1@gmail.com>
>
> Immediate commands are needed by the IPA network driver, so that it can
> send commands via BAM to the IPA microcontroller.
>
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  include/linux/dmaengine.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index 805668fbe437..56c49254ed04 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -200,6 +200,9 @@ struct dma_vec {
>   *  transaction is marked with DMA_PREP_REPEAT will cause the new transaction
>   *  to never be processed and stay in the issued queue forever. The flag is
>   *  ignored if the previous transaction is not a repeated transaction.
> + *  @DMA_PREP_IMM_CMD: tell the driver that the data passed to the DMA API is
> + *  immediate command data and the descriptor should be in a different format
> + *  from the normal data and descriptor

does dmaengine_desc_attach_metadata() work for your case?

Frank

>   */
>  enum dma_ctrl_flags {
>         DMA_PREP_INTERRUPT = (1 << 0),
> @@ -212,6 +215,7 @@ enum dma_ctrl_flags {
>         DMA_PREP_CMD = (1 << 7),
>         DMA_PREP_REPEAT = (1 << 8),
>         DMA_PREP_LOAD_EOT = (1 << 9),
> +       DMA_PREP_IMM_CMD = (1 << 10),
>  };
>
>  /**
>
> --
> 2.56.1
