Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012018.outbound.protection.outlook.com [52.101.66.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA7740929B;
	Mon, 20 Jul 2026 16:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784563775; cv=fail; b=jg6mkV8Qna/2d0aGxzJxmveq9M+hbrD1YPHmtT8fsictilVtTH6vdPNr+nMJbBBheOFW4Yrc9otLNCFK3It0pIGK7sf31afoB9TbHHRJdZDMWhV6URltp/hZ3V7qA9nHUbBFe57CXO+PduPGd3xAvXdprZALNJupix3mRf5T/Pc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784563775; c=relaxed/simple;
	bh=phIy1F/4stgT5xpqGh1BodO9Xn1O0YnKhwA2U5dI8nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IXI6NT3fsM1pVhSB5pmPJhwRtwCMiplQiFU8IZavZoq8Q7wrKaFnk/vCHuqcbPHHRzoC3lYj4HYEMHsASqZeONry8XAgaJz1mBh2ZGCOu3FAb/gOKDlbvI8peXl7xDzg+mLUhRNQK+dZqv4iGbUx8LutBXBaUvTZVU94lszKJ2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pIHvc5Qy; arc=fail smtp.client-ip=52.101.66.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pIHvc5Qy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9M3XBh+NOmcmBUOT8cmislY7vj9LL/aNddjpprYAQdjjcoiHSoW/qTdgGxqVAjDjA7pPYijkYlBB3cJ5Ak+q1ItjY78DbUPUv4KAR/rSla/iMydma6DniAoJNfVbzHPw7vsV79yZ/TXT9yIGrs90QtcQ92w4A/LPpCJ3QuCWLEqlMegeItHEIPAI/+OK4wHRwD63k2ziNvS9M80u3oKjBjoIKPfSUfFJYtNJ4QD+KDI1YP8lCXzGS21K5RJhS9n9rPepxqqZ27pwRk53CF/lIv3B4VLkbbmidIrPpMA2f7YJMR2C5VtpHOCoLdvkFaSG+tE83LOc78j0zVUH8We1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d35zit1GJDQcMKiLRqQxmdr08tx5RWBmEiZNtxUkbMk=;
 b=Qh2NefIPMRAabMo+gyryueJSCWxN7I33MXE1xeJPyr+i7NGpHFnwdtzFToS2WfE+yvtuEfo2GA6UCgcJgV0ZZyzMzRU6f6tfC+716ptrFCog/WsbETwNmjZurh1zUrBMqRsDi/Yxuctl09XYfNa9f+C31a/DUfE0GhGNg1R3BMTZ4R2JAfe1Q+YxsTIQB/KhH8f/mQAHHZABEQ96wcr6CnhD1TbdE1p0KlQAbsBDCi+9GlYxZS/CLmx2hB41aMHZTh6hhHZgQl4R/AKy//vc/lThvEu/bAztlky+SNzSqLDXylxIBxo4r9NZEyq4fftI4fHU4GRVogTSn87+0sQnMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d35zit1GJDQcMKiLRqQxmdr08tx5RWBmEiZNtxUkbMk=;
 b=pIHvc5QyXIUvb64hdWxab4C5RPnUnK9MelsaApZlH0OPbvQfvQ8AXcUAoDjifz9gtqtV5DlTTTVSluQ/Nf0JmsKrkd73hPxDoKeOaceNBiSL138qAvKqprkhJF+MezZNapr+MWkSU6P3m+YbHgm6ezxQfWouYgHdM5bDTOAx0bfjc9PHRIWlWx2yein/xq7ozIFcTcUbN3geevdikTvFOX9e895woi7/UKUAHlXVI61C5J7AnFXX13a1EVkrJBvlnpsIOgG7ZwKpDsh66GL2pNNtPToAYgqhWu8dWwIj+oiOathBCw8JmL+s7YWKpKR5FOenLGFUkJ4BrlUsAzNuCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8993.eurprd04.prod.outlook.com (2603:10a6:20b:42c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 16:09:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.012; Mon, 20 Jul 2026
 16:09:27 +0000
Date: Mon, 20 Jul 2026 12:09:20 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Harninder Rai <harninder.rai@freescale.com>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: fsl_raid: check fsl_re_chan_probe() return
 value
Message-ID: <al5IMHWdYsDZmczp@lizhi-Precision-Tower-5810>
References: <20260718231521.222456-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718231521.222456-1-rosenp@gmail.com>
X-ClientProxiedBy: SN7P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8993:EE_
X-MS-Office365-Filtering-Correlation-Id: 95d32e5e-a79a-456e-cd7c-08dee6794628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|1800799024|366016|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xrEnnopgdn9bBhyL7/UHqu9fS4znHl5KX2Tp+y8Vd0WL0MmclETu0kBwlqVyxTbWqlynbAiw84Wb2hLK+KHRk4cWhf2aWmUGMohxZaRh88WvHQp6s9Io8cea9JZZ/GrlKBQMXCLKkvb0nswMlKphPE7YhdqdKXaET2jF645CZK0xgjfpo7mVePoZp8oRIp24WzFiMj9ZgARaE5Fb/QC8ZhZuGY7SVdMv61MNbU27SdS9CUXUjOgzqes0sVVXenGcAUDI62mA9a3CBpJkf9Kso5Yhu8b182egq6V00AlOWUEFC9fRM+bK1fFsb7NjY+ttAxfkag8be/0kKd0/erBXhR7khHnndYhYoq/SsZGQnPOO4HrrzNH9X6s/CHRrBNLevSOT/SG0sVBy62M29tvSNYPTDvn5KQ9kEmCZgxiclYZ61BIerTN/g+zR56or9MR0Vza/44KDZQU0F74PJ4BW9SVo8GY66u3G3NRfhw40Hv+/vS2qT6dQpuo9a7erN40imxpY4P9ngsRc8K3svZTgdmF2lk0CXQA7dvlXUDEWoefw6/5kYQMfldFNUyne/Yy3pcTfD/vkPXC8KaUFGM4vuAfY9X5VMz9hA3AglLTkjozG0eWR6zgtr8tfJDlyqQ4Z0gtz5i5nHB0ZVpogvuzwnvn3bUx/mW/ByM+2DBpDUdw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VpI/NXbQTD5U4DhFAMh/B/yEG2EiOGYrQW0iAOsbJwMcXUci7rhVS6V64dbG?=
 =?us-ascii?Q?ASTz9Tfsr0eSoMFQAYRCsdZ/X879+QSF3+bALhxKcKyPTGImYInKvhqERRCO?=
 =?us-ascii?Q?NDPdItVEVbNVFO2T1nODJ/X2IAt0M2fFDibbGJbC6QV/1lTSb7zPcH6PX+ph?=
 =?us-ascii?Q?dFXS12PDLRUdWGChjjEQi5P5x7XKgdWnVDPWlQVhacwYLCcwDpnKLxeP/HCj?=
 =?us-ascii?Q?4ATqSOCPaFFuVfr249RatHvdHDVXPkWSpoksASKnznPASHQu/m2I4gJjuL0N?=
 =?us-ascii?Q?m4SWoxNTrzgDBo+g/0tFtwlKlz5d/NSdpEssd18xavQME09vD1Z5+6oBHS/T?=
 =?us-ascii?Q?1qKU8W9IMXt5GevFPv7zQuA0n6DSWi9YD3m/07ypo4n7LzeKzPOwswDyhAAm?=
 =?us-ascii?Q?QbJBvUD6qTCzJ1s2Fl2ufuvoVnbe+Rvuwi5PbDqU3OpLhz4Y2OWmPnFV9U90?=
 =?us-ascii?Q?iTZyMzoAnQvFp0WGDylxtA7QnLmBOMnBOTSm8OWH/vvgc7V/wf9qXsCRgQRf?=
 =?us-ascii?Q?KT+9s5xJRegXstcz8orIokcIUaSWRUIiW4AqS4YbYHV4XS49fsqn1a9V0/zu?=
 =?us-ascii?Q?wvk1XUTPZRvCXXYjXxplHCP3CuFB60u9omT0N2pgxVVaLBQNZAJy+ekIUrWz?=
 =?us-ascii?Q?qYN2umIbKijz8IfYIiJ+M0EiVCrFtAEy0RaEe4ihUQ1QZilITtENMO/sD+dv?=
 =?us-ascii?Q?BNkN/XzEcYBHHZhMRguLIEyzNeFxHYbBmbfLa1qchFIVCu2ApQAzkXBGS1lm?=
 =?us-ascii?Q?ajzp6fLEWfeHgCsp0nwpo90vgazjofS8/T49Gyf/RhXwh8oLSGk266RGDk2f?=
 =?us-ascii?Q?qgsfDFs3Ts+RKt513GzYc8qe4RZRi7CJN1p5XsEX28kVZvAA46ZqrthLemNS?=
 =?us-ascii?Q?KryK9+xGXkn0kIuMUGx4uap8xn4SzsBwaf4PxXA/tsP8bJn6ON2SMvjxUCCb?=
 =?us-ascii?Q?b8RSehnR15j1RcJeN0Sv2IP31xOmA0DKLsu+5wLF9X5P/zgyPHPn+jN5+47b?=
 =?us-ascii?Q?yQdfeIJZ3YpFH+DJS+iyY1+pyeMatmFEr1kDvv1LS+UMCTlcg7Kq48/nA85o?=
 =?us-ascii?Q?v4jcyFYedpkbmaCNLTrR0cfICytuQvfB9Zzk3S6+RGglVe3vzlSCLcHXZ0Sg?=
 =?us-ascii?Q?gig5Zxtgy0O402g52lQ6eWuU+TeITylKj4EWxvTyyML7HAo2WiQcEwU1lX8G?=
 =?us-ascii?Q?TTCG8cvX+dU5eEoHXENhKbQ1XnKRRUVVcmZSvvC3a5q2sZjQvviR62b5o6Cn?=
 =?us-ascii?Q?B/rI7I9XLVSi6+Azwj2bmXDh7uYKIEutDYUMGI3z5/bL2ZoB23s5pyViZGOT?=
 =?us-ascii?Q?860FmJJ0aqvfRmYMsuYdODK97LoYQx/FSzZ5gg6l8NwWw4kVAz2zYNL2Su8D?=
 =?us-ascii?Q?e24b6WBDJF9Ar6gNcr+mf/j1Wj++W8rHTKwZ1NtW+0nhsAc5lA9TWcnXEY3c?=
 =?us-ascii?Q?mcexnkgDI+Ps2QDmo66C1N/pHeSxiS5dY2I1OmTRgJ1Tgql186Or1cgOPENA?=
 =?us-ascii?Q?am797IN3+nPTR1ySgEwNQiLouQpjFZWNdsAv0gvjXLy5GPinieKJnWKr/hEz?=
 =?us-ascii?Q?nieHM4S1TijPigexx3C11kZtN6rVZCLCkumQbLbbjbxlI3/+O13pSxzsNces?=
 =?us-ascii?Q?AigxN6k8vq7hvnC+EpgiVwYCw0rgh41PQsKnIw+N1cqf39sv2apzIqMZZamw?=
 =?us-ascii?Q?miAF1I/nV4mmtYEcZAqhd1NnWNnQ+MIpeS7eL46G1QIeLSD+zZcFBURR2GxS?=
 =?us-ascii?Q?V/0FIuKFXogxIJXsXxpP9Osdva8MMFMltcNujcTgUM590VEV7Cda?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d32e5e-a79a-456e-cd7c-08dee6794628
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 16:09:27.7486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDY9bse7Ail2FbfTWvTI6taZyImUxQBAZWm5NW0ieBFj5jZAscd3kniK6YWNBwEHB5vjHRLE8dHw+gA0TWBSmVOQjmVNa7rxoD6m/ce2h2qXRfIELkCpv+eJ3Lvv45p0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8993

On Sat, Jul 18, 2026 at 04:15:21PM -0700, Rosen Penev wrote:
> fsl_re_probe() ignores the return value of fsl_re_chan_probe() and
> unconditionally increments total_chans. When a channel fails to probe
> (for example, an IRQ mapping failure) its re_jrs[] slot is left NULL, yet
> total_chans still advances, so fsl_re_remove_chan() later dereferences the
> NULL pointer during device removal.
>
> Propagate the error, only count successfully probed channels, and guard

It is not Propagate the error to caller.

Check return value and only count ....

Frank


> fsl_re_remove() against NULL entries.
>
> Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/dma/fsl_raid.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index bfaef6245695..0b0b4e8fc821 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -842,7 +842,14 @@ static int fsl_re_probe(struct platform_device *ofdev)
>  			rc = of_device_is_compatible(child,
>  					     "fsl,raideng-v1.0-job-ring");
>  			if (rc) {
> -				fsl_re_chan_probe(ofdev, child, ridx++, off);
> +				rc = fsl_re_chan_probe(ofdev, child, ridx, off);
> +				if (rc) {
> +					dev_err(dev,
> +						"job ring %d probe failed: %d\n",
> +						ridx, rc);
> +					continue;
> +				}
> +				ridx++;
>  				re_priv->total_chans++;
>  			}
>  		}
> @@ -875,7 +882,8 @@ static void fsl_re_remove(struct platform_device *ofdev)
>
>  	/* Cleanup chan related memory areas */
>  	for (i = 0; i < re_priv->total_chans; i++)
> -		fsl_re_remove_chan(re_priv->re_jrs[i]);
> +		if (re_priv->re_jrs[i])
> +			fsl_re_remove_chan(re_priv->re_jrs[i]);
>
>  	/* Unregister the driver */
>  	dma_async_device_unregister(&re_priv->dma_dev);
> --
> 2.55.0
>
