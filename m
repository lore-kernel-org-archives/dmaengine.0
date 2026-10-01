Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010057.outbound.protection.outlook.com [52.101.84.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DB4489FB3;
	Thu,  1 Oct 2026 20:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790888186; cv=fail; b=GhjGGAPwnaMlvhipFXfTz+P4U+KqVvdJnFqRMgiw+q2cKfAtVe0cPhiBg2kbLvH7OPvVUf2kd0cGS0FoAg4Do/0JkXCLwPw/oCvAsD9Gd4cNxEBisc5aaWOAxpj9lsaaHtMcHSSKnBu1UGoNKqhP1/urogY/OIk1hqMe0uZliRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790888186; c=relaxed/simple;
	bh=4dlAmCtR/CuVYVIhpff3Z9jD/o4nbiyknNxj3LV2smo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=C3AVeqX/bJIPKZAKSIo3oDm0ZN02JfYZyXRki72JKdFXn6B6GD3f3JQmKwV15Zy3WLnTbI7bO3jJf7YBrRko52dPPkt8umufXvy9KQ07WVPylfs9qUxC5DISAGj8QlLrriZ7HvJiC+jX3QnrYjsI8gkAYNNLw0yDWOioz5A843o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uPrh6TYH; arc=fail smtp.client-ip=52.101.84.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uPrh6TYH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/3rw2zUjNf7pKj08MdoUckWpLZYN/ULNut6PLh1sCDLD5Ch9nU6xucN72Ea+Zf26tEnmeRFbQhJOBMwPoAmML9Pfpn5S0ovDgebGoPoqe2aVvZrYtST1EWxJ24uXC+vpr+S4BddFkECJ8uUq3Qg5jFD6hfD/YcqftbR7Hyk8JKGcc1UsrRByPbM4ig2Nflbmdx5SFHACDuDRKathlIdrxeR67LJ2F1jhWoVgT5vVlaqJWg0rmOJhHatvPrsFz1Q/5omf2GClyJa9vqz+jOz1YSjzWPfs1kktZUsLK13qyxEeIalGpl6oT5tprg1tdqCLWgJoaSO53d1MC4LbUsP5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7cbiUqbmCmbowSzbXuI7mfcpFXuDVSTQvVCXoBgbH/A=;
 b=Q3eAQc8ZEahO+IcPJITQNLqZOPpQ0vUKMsYK6sKdnM4U9Jxo6MPq9nCxF6eTAIX9k7OHRV/gIM8Eoh7knjeBXV2itZcikem+vnEZOenyeFdc7rvDverU0TgpBkO6rcjBRKxc2ea2/zO4ub0ZAANt5+DoheOoR6kbCXztES05EG92VoYAHf7pZ8YU+1X+hiIm2i6uxP2CbywZYp8R1VVCOApF30EEm2HaWdvAQehAjDf8a5otTCG9RqqPzwdFmihGEOncayFTG2xoyB8rz94mfwWDM9SSXBEd3PE0SF8VS3ApzqVApzgrqXP4YTUVR58JN0lEgt6zj7hrX6dWV3azHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cbiUqbmCmbowSzbXuI7mfcpFXuDVSTQvVCXoBgbH/A=;
 b=uPrh6TYHfwnHDzJGloUk/f3FA4xWQebONSROg4oqck1VLVt0GW2m4xjm46AQANK0e6dAu3OOQTsseZrFpdR+7bN+iSNZd65xJPPF2LDa+clGaz60+46tWev8Nc/TQ40H4A4uALxPWzogDFKA1mGMGq+rO7pbAAI/DNYXTa8zfxKxFSvynrJMrbRDptivaL1lDxQAHcqQD/nDsN/cuf9m0OsPFefEJxS+vBaCJQvA+Y1/YjhKEgsATrkmfShi+sPsV7ktBcxpYlf5yBU/9xZptnqnmrpqerJ8L2igBkUSatiNwfcDu0DFh4bDRzfiZzkvc6aYAD9hIv0Nfrju7yxhFg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10794.eurprd04.prod.outlook.com (2603:10a6:102:482::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 20:56:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 20:56:18 +0000
Date: Thu, 1 Oct 2026 16:56:11 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: SeungUk Nam <tmddnr49449@gmail.com>
Cc: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Vinod Koul <vkoul@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: idxd: Free the minor number when cdev setup
 fails
Message-ID: <ar7I66RYnxUokeNS@lizhi-Precision-Tower-5810>
References: <20260910074832.15729-1-tmddnr49449@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910074832.15729-1-tmddnr49449@gmail.com>
X-ClientProxiedBy: CYXPR02CA0030.namprd02.prod.outlook.com
 (2603:10b6:930:cc::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10794:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a207a0d-b509-4eeb-4142-08df1ffe70d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|366016|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BNpdGDRvy5AediR8trEWtCQvHsRm9/zH+ogagNGdQE53rmntKYlEfKZDxN8zR22XTLzMulxeIbZuVnVffJFfFWDbxs5Z4GursEFL+IewsrGr4GXHWNlukZ++fKdVmJR/wQZ8KLR4q2itDp0SEQSr2pVwDy+7nhpVlirQ9BK/yJbOWA7zxJ753ludduDk9D/X4vkqqhpSx9aCpahPPeLsaKPZDo/7FCYLn3uyqfaW0xUlaHFuvcQ/hgnXNg8sLr20gEMgIKoDhKmbV5pK5YfJT6QESk2HmqbBaVwwArlyaE3vV3iA51KafV1pXdYHDZm/BlQXHL5mAtgIn0tBiZ8Llllg3YLK6ShIjNo5VHRhXCddxa0rdx7ZAvNXqw2v6Hp2fMzw9P2ivn5yYWPyXr65Ru5+47McPATPddsYe1aQbMhx4aejle9h3YlqgOs4KeWAsFFBWqRLCym7TUQhmQ8XxlWLgj7qC8YLFAU4ta9LDoMqT+QuF2UoliUVQjYT2Z6hkTT5J0Rkc7rX5By7XOy8MkMSR3M2CUKCyWDOdIVduyBjOe5AQ78P094r2WKD6p+2Ha+W3hZjwNwPu1Un85mwJivdB9xExiOZkOrWdJdNwn5hKDGV4tU6lQ39TrVQY+lk6yixTeN1h1mgU+iW81fFd5K+vEDRmrAp61YOIIzhyP8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FMURLw2B0LNh/kAnU+Se0hCgYEcQGh6bfkA2XCDFOCVUrOCrhhBudAFLmdxE?=
 =?us-ascii?Q?ErCImSSlEcoFwXmXGf8jGGZuDXS2d6y9YVcN8T5xkxDfBSgpr6yXMXkOjczg?=
 =?us-ascii?Q?NjD0uH4lHBBbtlpDU/jOmzJ/PAQHsX1VdGoXfMyEtMxKKkUM6FZVhLPTBJ1r?=
 =?us-ascii?Q?Cqo+TDrR2pLcz3n0eV7AGnjk4CcjQSe2Jqc8cCzjcM9kELtufpVP9BAdaqgf?=
 =?us-ascii?Q?UslY25HaT0goAMK8kO7wR/zzIXjGCj8Yao2RhsSPeittbpYyySVZMrx3nvHF?=
 =?us-ascii?Q?vZ5g/1N8D0yXmjlN6BUUhGmOh2qa8DE05EFV+rT01IL5Dd/DUFnXlwoFWelW?=
 =?us-ascii?Q?daI32C/wg2lzoW8wS1h4ES5/Au48liG2rUqTXuYEArqKBT+I67p8qpSVN8An?=
 =?us-ascii?Q?dvYGTDrPQ5btDFUg0wyllifR4/evhYZyWCXuBTgKJ+o/l+UCJjRAa4VwVjWP?=
 =?us-ascii?Q?03xwi0iC2FTSRw1WsyiBO0E3U657zmFgEG6p2V5v/DfUYnsog3viE9EmJ/Yk?=
 =?us-ascii?Q?ptqiDgbOfy/OBxPsduSTWmth+Q7OpmJaYMq+9jd/hqTNJdSCYH13Ch/bf0nm?=
 =?us-ascii?Q?iJ/CoL9B9EApNDStLVGNvM9gbEAehiIXTmUydUmia0mhHitYw7+PQP9VP23w?=
 =?us-ascii?Q?/YRRrpDcwpLazfM5TYWtYyYPc8CjmhRoV+ysjZ657hr+cVN0oJl7vbt/Nu7W?=
 =?us-ascii?Q?Vn0n/Qx8AS0/9ierFrIkStXPCbtidD90gvbhmImP+zi1jONbMwhTwEF1KCsq?=
 =?us-ascii?Q?7NA3aBmHyJSkqUS17xkbw9xGAzMXpE9Cd4FG3chXrEPGRNqvwjev/81MVzjs?=
 =?us-ascii?Q?JCMcsznTU0unif2T5/rLeo2bMaqEPJVmQPpOUNLcu8R+yAE2z0X3SzjbEB5J?=
 =?us-ascii?Q?IeSlfQq/y5fWqKsjNBFe1TJ6DgAM2UBX/EWre/WAUkQsUicXllZSRhyZeKIT?=
 =?us-ascii?Q?d9jgZMWhMmhmeO2Oj7/r0L7NLUIbl9Hk0Bfj4ok93nk42QlgbhsfYBmWpgg7?=
 =?us-ascii?Q?Sw1ODwuCrwHu/jj9PP4Gg6v7FsOvgW5zGfjAy+kGN4/odcHllAUrqn1FVAqk?=
 =?us-ascii?Q?4PRyPMSeB/jWvoLIoizES1mgu2yedUqBywh5VU8KoUdZ83tPeGoWI74NUvh+?=
 =?us-ascii?Q?D0++59s4VJtSWixb42ODckwS9bU3PzK+7zZq4nuMk3ci19BTIaNfNd8sxhpJ?=
 =?us-ascii?Q?+if/AqKKOogahvCEtnB6FK5jV1FabR8SQnjU/w0D3Uh0H0ZegwRVso0KKXdZ?=
 =?us-ascii?Q?0IrZZpZn1yXcSBkFycXhBqznXP4pDyKwCoZi9BD6G27RAgbsFkKgyhDy3ank?=
 =?us-ascii?Q?rfxCOmmrXrky/Wlkdrmmj1y7lue6lcf05PZElqewvwXc+hkF17H0+PgyKG0n?=
 =?us-ascii?Q?E0DQ6rttGeTeeapszPX2sUewFmGxnsNj04KI/DMTN3g4gt+czrNq3FsvsPJn?=
 =?us-ascii?Q?FuaGIyLXUg4z4KRYLbLWTZQfuYcvK93fyk84G1E3itxVfZXtoXCwZY8/MwKE?=
 =?us-ascii?Q?QO3IQ/4W8FME32ENzSs9tYl8R4NnvZHciilo34kv5nBm4bDlL7MalerM2vWB?=
 =?us-ascii?Q?Jxy3/nM2Nx6c8XxeZezgdL3S0JFJBp6X7a0K3ObUNuyqVdkf5f8K09Q4+Pzd?=
 =?us-ascii?Q?1KCbJdAFPRD0w9T0T3CWaEqHDqkEUO7m79QKRn5afTcgJUrmMv4loFwYPgDM?=
 =?us-ascii?Q?31SbRP/ZcBU/wXlw5qu3n2p/9Xi7B9IAKx0KHTktxuw7X5+t141VYMOtjjfo?=
 =?us-ascii?Q?Fu0z1rVRWSxhqyuOWv61R676/fzmzsLfp6rbvRfJgn4qEPLmesV7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a207a0d-b509-4eeb-4142-08df1ffe70d3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 20:56:18.7178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8tzyMc/WBxGGixk0S1IJ6t1S9aLYJNsbvLhD6hlrZO2XEZmJr6Atbn5w/+fU9zed/W4ynHKNiJDg9OcCf7+Hka21Lk9XAQHYZcP8rv0ZwXrFElSMLnptWk2FVyQkBkz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10794

On Thu, Sep 10, 2026 at 04:48:32PM +0900, SeungUk Nam wrote:
> idxd_wq_add_cdev() allocates a minor number from cdev_ctx->minor_ida for
> the new struct idxd_cdev. When dev_set_name() or cdev_device_add()
> fails, the error path calls put_device(), and the release callback
> idxd_cdev_dev_release() only frees idxd_cdev, so the minor number is
> never returned to the ida. Leaked numbers accumulate across bind/unbind
> cycles, up to MINORMASK, for as long as the module stays loaded.
>
> Free the minor number before put_device() drops the last reference on
> that path.
>
> Fixes: c311f5e92484 ("dmaengine: idxd: Fix freeing the allocated ida too late")
> Signed-off-by: SeungUk Nam <tmddnr49449@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Found by code inspection; the error path was not exercised at runtime.
>
>  drivers/dma/idxd/cdev.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma/idxd/cdev.c b/drivers/dma/idxd/cdev.c
> index 82b07cf942ef..f1af7f0d25d3 100644
> --- a/drivers/dma/idxd/cdev.c
> +++ b/drivers/dma/idxd/cdev.c
> @@ -573,6 +573,7 @@ int idxd_wq_add_cdev(struct idxd_wq *wq)
>  	return 0;
>
>   err:
> +	ida_free(&cdev_ctx->minor_ida, minor);
>  	put_device(dev);
>  	wq->idxd_cdev = NULL;
>  	return rc;
> --
> 2.34.1
>
