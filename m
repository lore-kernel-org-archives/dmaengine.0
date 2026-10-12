Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011063.outbound.protection.outlook.com [52.101.70.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FFD48EC68
	for <dmaengine@vger.kernel.org>; Mon, 12 Oct 2026 14:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816724; cv=fail; b=RR4cSw0c+48wFj038IDROl4LCAq5qH80a/E9GiVlm3fO70g3ZXJmeQ0Z+c2+2k8dQ1SyJe1wpRvp2TSUAgm2RjjpZ9I5psZQFDizt4UGLtrNG+sWXQcrjElZPm/5sdvcq2EStv+GRN0uLTkc4VP6o0Hmep2ToddYEFiJndr3nrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816724; c=relaxed/simple;
	bh=sgOeYnzAO3cm31eLhHUaYDaUS9+lVmoGL3Pf0mageqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WxWBswIbEeWxQ88TA+h1X8Cl2A1XuEQfxsLx1zEii3yjnu2n9nU0CjAehiEGkbbvD+WaISLPDZbRTdh2WhnxEHiSe24MppYnqskXC8NW9SCKzYdR0slu+hmfpBDgPb4IYZARwiBQK4Z3IDx2eLU0Lxr30bvfLWWC6NHhjw2jNSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MmyqPMq5; arc=fail smtp.client-ip=52.101.70.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MmyqPMq5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0Nt+0UQLCghyEk8X1ajpIcR6OXraoG5EPzZda6+Uu/v290LcdZvQ29LU42Bq8ukah7jHfU8J2Zf3bVItItIQFyns8/e579ZThprYr08QqbnIa5wxTswaS9YOOd6ozKRkwO/X4zT+QUzWWzhepxSjwTxRWFA/G1CjhtV+uYq4s6RErOuwwty+N5YLN/CPPji4w+iGyPMyh3MpqQfS4GqenKAgnyYxL2Ven2vYgVN+GRPQKb7EkWZt50ZELb1Xt+XkZSmg+bxC4bBf1EXSHYnvCt6lkMsEi5AgWg4JRz8mJf3MCAVnGY62Gf8bqrlGnc35l85xmRleWf2ZGxvgFBKzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1bVl2xGK67cU4TQ7eGGTs4cBJmYHsnfo0HLCzw8yEQ=;
 b=yGq58NSo0DRQvPvqDiBq2EHCPuZAQEFcwjv1R7VxOST0I+2e6Li0tuQ/Ik9Roo5PgZLRwCyEBNL3ZHLbJ9Hs63iLIw9iLMMkq3DMUGLk8XwdzMZPQs1h+6xBK3GtdsL6HUUhwGOF2sHM3EhoZBgvbVamolBpp9Hzi+lLAhdUaLe/VzAmTcK1hFHkO6Zi3Jiw365cv3pFSnZDxcvMzPspTmV7kHzoyN9B4Q2adDZrP67EjubQgl4lrcK5ctioFhAB/0NhbABxl+etxNjitp2VYrajQkLN8DjpngoPCJX/jpHzq620yxL727y2apSnRvV2SdBnQvgLfSgGhvknUp4w8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1bVl2xGK67cU4TQ7eGGTs4cBJmYHsnfo0HLCzw8yEQ=;
 b=MmyqPMq578HQwL3GkdkzBB1YFdm0tUg6nUCvz6/p6cU90Efc5dxuaOikMz4bMhheCPP2dSC5LhgEBtHnNbG5yJsruci2m8uWtGcz8u05UrvnJ3KIOd3/sccV7M7ei5Zy1ntrynOwHX9zs3CSNARp3Az90zhEhEqEbXDU3txcsiBdAhW5UTEtuZRUah1q5UwAAxA8ZvTdQStvgdkZ2tZmO7u/XQpNt4YWI3g6Gk3VrDygNlPWA79NBUjiyZo6HjbxYAbgtiAZ7H8heRhOhAI1j/AwIv58hQu7u+MJbOMFwXO1M5iQ5H9y0RTqCllnbfQGrw7eb3trq/XZw0HePb7EGw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB642219.eurprd04.prod.outlook.com (2603:10a6:20b:799::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 14:52:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 14:52:00 +0000
Date: Mon, 12 Oct 2026 09:51:53 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: dmaengine@vger.kernel.org,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Subject: Re: [PATCH 1/8] dmaengine: ptdma: unmap descriptor before completing
 cookie
Message-ID: <asz0CTIrzSgAq5zO@SMW015318>
References: <20261010124348.19055-1-wsa+renesas@sang-engineering.com>
 <20261010124348.19055-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010124348.19055-2-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: PH7P220CA0105.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB642219:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c27072b-acd4-41db-3584-08df28705f02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|23010399003|1800799024|6133799003|10067099003|18002099003|22082099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	6kVxZrBgnz0s10m3cbdcRcVV0/V5optPdPoniXFwmRwavjvRuxa4c5SZzvwlqEbL1Vj+aq/4lSrFvvbf+ZL/0wLc2jFGCnhflFof6Mi+qRQ9fH9bQ81gYfflzHoCK/Vi/hiTGoC7WwbP/krFSaPUMDkCWkFFmveUQmGp+G/pD/uWzrJTvm9Fd8kjHG7L/6DNU0OuQ3G+T4rXkW/pnmwHNKR4RtWi+Juz8DyapDOGzCpvZQJSA5A35SpqpXL9g2OgG4q9pcEgDsaqUoDmBrf4kjtRl56sBE6brtR2ytx0RI6OZn2UotUZEeMv7I55wvZV8/eb0p5UXVjOfF2lgdktNKGqJczMIu2o3ULE3+uBx70pd32MJcA9y8fEg2aJtLCvRF+vqxPCh7nfsFvkTiiGakVDNyWvkCPVdFPcfGO7eraLdzWi8Cu7SVZ6zlVD4t8E4nUZuinGqV1nDOVd+PPktwJ114E0LxFypddgv5ouB2xU1NCfXTDg5bz3WWcOks3lokADAWv8D/d5QP7TFjEhLLVA2Y/ZJH7J6cJngGlty/rz4tlivY/IcA1CwJu5DYVyNNJfGXvJGjZuy8DqFFQdQ1d40BZZ95olvTtm8JQFg3ZwrtU5J3DrR5faWIyvpJs3C/4UvtkySI/OOGkG60KjP2iUgvARxbvml1yZfGoxkrc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(23010399003)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JYVcyGBofayeEGhzDEJKvIWCxlVS2Ztlm0b5/ZdtXT2sIsPAtCNq0nqfATFU?=
 =?us-ascii?Q?yMrf/HeN9Rx5+RUasLKmM8BEj7F2SnqbwNjG2nTS3jiWsw54K5OJsL9sMf8J?=
 =?us-ascii?Q?wD9cnb1thzJRK5+JegMmXoz7p89ADoWcrTlAzzCZyBCzXItTWr45mmNr1dKe?=
 =?us-ascii?Q?7hupH8adB6TNozE8fMThV4yRAz/7X5AKywuy8Y2shXrIM6d9dTi2OOX+/4h/?=
 =?us-ascii?Q?wnPJs/nkIETz67ZP5cTzYyu7Juvgq8qxrpFZlixFWcD6VKrFrPoV5aZb9DCg?=
 =?us-ascii?Q?IcBw5Sus2kloaTAhjog9PXEfVtLxNcGS1DwnTS3u0Pp56X5vNenxDPGWHJ5N?=
 =?us-ascii?Q?Gq8kRcuElDdSuu0JqLa131JudXk7I5YJxPQFpdMKyJxgBn+uWVAEWoRKrEGu?=
 =?us-ascii?Q?twf7B2sN50ZVCOLYI73OIbKQ0GkTbL2IaGh1qUCf3wQ5RYZEj+8cwN3R+Q/n?=
 =?us-ascii?Q?pK7s5fH8++k+Tg0xrjA71GbLgT5Ga67b3NR6Ix9z7PnDPV6+0oyAjwgLF0SH?=
 =?us-ascii?Q?EInpeCG3tbIYETlbaA4c5tz6Ai17ZFvkErZopHR0naRvw6SZo9hq2nUOjIZ7?=
 =?us-ascii?Q?Ft7KZl5W1cyD0Gm/abu9nkeMjidTxtrrOyMBb1EOEKhrsXyTld1on4BAEQTr?=
 =?us-ascii?Q?I1OBfhG7v+yeVti4kZfS4KFKxRNHOwDM0h7C98ACiF8c+LMZSTEWJyFWI0NM?=
 =?us-ascii?Q?hgRSrARFjtNzEGg+y9QUAKibOMpUMrGBqqBB8/kOLCyLfRAuu6ra89MYHgjF?=
 =?us-ascii?Q?HxHrSqOw9haFaKu28dkQHLiTjIOT8u3nOM4owd1iEFZItHs8Ttks9IcScZLA?=
 =?us-ascii?Q?ljJ/kPdNDdNGCtoRPDl1CF89uhz2NAs8eT7uQK53nFbWZxcWlm22oadbC75X?=
 =?us-ascii?Q?oF4dbePIpH2geW4WTkhZDX/n7eCSz579f8xRgIxvZwbAfnmUO6Vs2aeYMltj?=
 =?us-ascii?Q?NS9MvxIe1wfLcjHz9Ylm11LbDNx5aIbnSkXgBMb5qGRbA5AVXccsFaghxUMN?=
 =?us-ascii?Q?a5n6tBdP7YUB3oF4SdkUjUchCj+oANU4tIj7rnYg4rSAhxKmCo+HUlDwgf75?=
 =?us-ascii?Q?xYBHbHvfjnwF4Pzft8EFWFZlamBPERqtL/pBJbMv052yy6iH9extsFDezHUx?=
 =?us-ascii?Q?pLqtuX0CiBm95jlPBp+cxYZ0JqOTIC1QvuwnchnBvHr9f7CxB1LmBNTKzQiQ?=
 =?us-ascii?Q?lj+TQM8Ur6hsJDbcYNhvEkxcHEQdmXIThCf/kLm7V8QtS4MMw2asjc5UFAdV?=
 =?us-ascii?Q?Pntb4tj55coKHz/s8/TFlBly21XnbysRKOcUQKT5rBfSNv7fP6ZC9XCiFJIy?=
 =?us-ascii?Q?+C2aT28ixWJqXQzL2oJ6J9Ao+fEdnwa3ThZQKInj492/+YJ4lAwhXvhfVHoB?=
 =?us-ascii?Q?U6wXPtnVjJ+deeiPr4R9YtQjotbWRWWPqC2YjqZNu4rqR1LTEUMC/oLI5xLA?=
 =?us-ascii?Q?4mCIbjx+C+vkv4NrhOdOXUGoAz3of9q7BX6w3DP4fzhm0r2NLkNDKWkOJlJ3?=
 =?us-ascii?Q?oYYOy9IKJ/so8FRc1I8ONPROGq5ySe71m5xGOjvAcbWXK55BNRCFyYb0fIFK?=
 =?us-ascii?Q?xd0A9YuxKps0ldsMa0r2AZ3rX3EYeqInx31V02DJCKU+3DkBX8NLOFqGQknL?=
 =?us-ascii?Q?w4WraySNDNb1S9AO+mxeRr37oauI3cjpCaPFBsiWIPAlmBnPEggVMYPImf9h?=
 =?us-ascii?Q?dOGcDqLx2LWLe9C1BIIgHWY5FFaWaxUUeG1x1waCOQiw3xxfzhs+BtYHdPlC?=
 =?us-ascii?Q?TYfa8yB1aKcO8Do5/QnpnP4k3C1RXSA+YtmcQcSsO2sHJSMkFFSP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c27072b-acd4-41db-3584-08df28705f02
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 14:52:00.9127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9cdQ2hbMFDWb0NG4eT+KG9zo3hVSWFY0hDKXI1Q2t3qTZD5EgXLRv5UCS1yHK9dFRWW9NcVZcpTnz4KjOXVs5ZzOMLCRyMpLoP+xz+6mA7tyBfhmtMdEHALzPSPUcqqd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB642219

On Sat, Oct 10, 2026 at 02:43:39PM +0200, Wolfram Sang wrote:
> To ensure that buffers are flushed, make sure that the descriptor gets
> unmapped before completing the cookie.
>
> Link: https://lore.kernel.org/r/20261009093745.539924-1-vkoul@kernel.org
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/dma/amd/ptdma/ptdma-dmaengine.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/amd/ptdma/ptdma-dmaengine.c b/drivers/dma/amd/ptdma/ptdma-dmaengine.c
> index 628c49ce5de9..7f51d1e6c727 100644
> --- a/drivers/dma/amd/ptdma/ptdma-dmaengine.c
> +++ b/drivers/dma/amd/ptdma/ptdma-dmaengine.c
> @@ -224,8 +224,8 @@ static struct pt_dma_desc *pt_handle_active_desc(struct pt_dma_chan *chan,
>  				if (desc->status != DMA_ERROR)
>  					desc->status = DMA_COMPLETE;
>
> -				dma_cookie_complete(tx_desc);
>  				dma_descriptor_unmap(tx_desc);
> +				dma_cookie_complete(tx_desc);

I think we should consider add new APIs/Helper, such as

dmaengine_unmap_and_cookie_complete(), which do both works.

Frank

>  				list_del(&desc->vd.node);
>  			} else {
>  				/* Don't handle it twice */
> @@ -362,8 +362,8 @@ static void pt_cmd_callback_work(void *data, int err)
>  		if (desc->status != DMA_ERROR)
>  			desc->status = DMA_COMPLETE;
>
> -		dma_cookie_complete(tx_desc);
>  		dma_descriptor_unmap(tx_desc);
> +		dma_cookie_complete(tx_desc);
>  	} else {
>  		tx_desc = NULL;
>  	}
> --
> 2.53.0
>
