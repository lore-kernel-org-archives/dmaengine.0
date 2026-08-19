Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010041.outbound.protection.outlook.com [52.101.84.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99933AB48F;
	Wed, 19 Aug 2026 15:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787154514; cv=fail; b=JpPEITPQGrxQDFHsmhWyy9380spejSHqkwNRA33RqOaI+mdsv76H2euCG9bqkF9IujPCoqZ97GJtIWrd3vnyOoIle/e1aFea+3STQZ7TFlQc31CxbMXJmGOhbLc0BPuSpVR9on7uAZVSd3il2wp2PYdZZTbm9kVHqVWNcdTXVRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787154514; c=relaxed/simple;
	bh=pYCm4M6/HEDFCHSFyVoYbh1p9kQVT55b4D0RNh5dWbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eRnVYvyVgkrGa5vvhqFU68Gxv103FOAslh4dDXaWSRL6VqFxqkjSDTns+AkzQnANgRIZ/QVGjz2yRyOJI+L5BbnDem28JxQ0Nh9Xx6x9uZ+bLHFtMFWn8rYrl8i3N5sKmhTFT8N1m0/6wZA48J3qjOouS8BnslByZw5EosoUXlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PNNjtvPF; arc=fail smtp.client-ip=52.101.84.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PNNjtvPF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRor+ywPVPAgcyLl0vT6Jf9oOMIQFad2yqD1jQ/ubIATdUDLH3U0o8YVgan2QUAtBreGGETayZrFnDeU2bvK9qkkwXAFDjXZEuueZ7EZFv0uGLfcEvqY9YBsCFDtnmGlVbQFoKHpkWBGTUhT8MOpn/dVfYeFuGbGG87bCL8g8zeuhIYXLBixqMgWheAg68JScOmir0aWrPQaLLUaYj6dp31jkW3rgI2lNh1qcIQLsjWiYUiyojzA7l/nHCUKuyxLJHslLkwvWPTOQKFwcC0FbZTpmNUfv4Vx0cSMa80hE9jDw5MGyA1k6sKWCfX6E5UBMpnN9+0QU9ic5k4ERZItuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EvsPOs/wbFwMOPTFTFSTxh3rUucdafH7P8vpe+Vcwc=;
 b=suDWMcRDYEOyRheQGUvu58btJK+TqaQ/MvE/559HiLuTmXRdawal0Oa9l7+/ntyX0eFKsuKKjLdT3DaN0yo5mSw0R4tn4QuW8kUSgqcgEASD4YCVQFpruKGzxVmfTp6cTDzF3FcrGhliOXnCRc01T5dCudiz+gBaWtsML4c4BR8zs6d9cwhH5viIzhSXLT4KUiXuv+7EwJKorvEWt9uN0XlvNLEQeCz0qGG86PeZanUaZ8QL/GeGYjOisen/aItatcFIa7rPckhUl3DGbkVHtsQHQ26xVkkPovySAV3mRSAfKrUHpB4+7rmv1j5tc9M8Uj/eewtH/3Ryo9DZIF4wnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EvsPOs/wbFwMOPTFTFSTxh3rUucdafH7P8vpe+Vcwc=;
 b=PNNjtvPFrB/S3M1nj/DNKcFkMfjM7aqAHCV1LtOAC9QKSx/+uMp/A3FnqzyEJqLusikTnITwQlUysiRRlNQEm4HcE3tz7STBy7uBxZjRCaZ2601B8F5ZvBnLXSHv/NadTa8NHsPk6jlDtT4wV26TbtBi3Qt67jpbeTeUrHMj0E5J21BW5ln6GJWlqMoeMCCSHZFb9UjMTDNMkUqO38Ml53r3LL3rde1VZII5fhBFNVap60tLKUf3bfkc/xXuB31Mfybcvu0cPWdigVXcPpLfZ7ac7yW8Dh7Vho7UZ2hRolPgpkIMz69++othqJV9egtpL0uU7gNI86BhG/sXsYbnUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10078.eurprd04.prod.outlook.com (2603:10a6:150:1af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 15:48:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 15:48:27 +0000
Date: Wed, 19 Aug 2026 10:48:20 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.li@nxp.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Dave Jiang <dave.jiang@intel.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Kelvin Cao <kelvin.cao@microchip.com>
Subject: Re: [PATCH v2 1/4] dmaengine: add per-channel sysfs attribute groups
 via chan_groups
Message-ID: <aoXQRK4lLm2Ypp5v@SMW015318>
References: <20260727184844.12647-1-logang@deltatee.com>
 <20260727184844.12647-2-logang@deltatee.com>
 <aoTHCw30mgaLymfY@lizhi-Precision-Tower-5810>
 <40941ade-2522-4afd-9b4f-510547833db8@deltatee.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40941ade-2522-4afd-9b4f-510547833db8@deltatee.com>
X-ClientProxiedBy: SA0PR11CA0004.namprd11.prod.outlook.com
 (2603:10b6:806:d3::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10078:EE_
X-MS-Office365-Filtering-Correlation-Id: 44dae5da-81ae-4ccb-9ade-08defe094f92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|23010399003|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ob1ZNLiFbM0Xn1VnLk64HLfDJexo7jen+I/5KTyz/4T1kuBCDbLLksrXqZWUp+hETyLmnhQQ3JOGmwpFj0O7ekOutq8iFJBzjgFRSU9IEIAUgbb6ftz05z672JCmQRo40hIh9o+xKBgOseNTTALgyaRwDuW+LSWbvC6XX8NXsjkCQG16IpwrdPVR8CD88VArIH5LJuIJr2JPHQfd/M2egVsQRtdllr9lTEZ6rse6WHbr8seefUO6NelqtyJcC5CnnxHjZ2olpSghye/gbNz8wOyvq6f2inOi3LKnWhedjcZmGzhsf+x/rGeYZs2Yx2GLJ45FoeUIEgQ5St/L0Th4naNcXGnMAa//BJ1v3Vl65LD05g168XUB+jk0Em9AEfDAvvk+ReXaCXNDN7iGsNy6VQ4CPzxDXS1rHrHVYRc4arcs2dazlTg6dOMw7kTTJD6Rg1OtCQy3QSbm4u289dN67MmFEDCP7l9pSMJF2S9dPhOPjz08nzeWiYChoO9KEXXMu/5tbxlXoUzonNpYisbyRvUPiYVNifCRsQZ16E3Qe2UulMNkaf96G19Odx5QY+dqS7W4n0nVgrC/waoqe/2YsH2BW95/Or6MTk3yMXYvlj0pI/Aj58/pzrdXlU/DO6A8e6bZxdNS7E7MZ+SCBvKCxpamXbZuno59xjrgoK5sMnM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jJQYsSO/bBmLLsmVfoOJ1VsD/pa8MiVxfYUKPv+3sGNJ59d3hB51mAFv4i8k?=
 =?us-ascii?Q?TFnE31diZC9rRDk9+WfsKqxl/yQsTKxrnUHZqea7fusa92Jxfonu/Go/4fY8?=
 =?us-ascii?Q?cCObBZWHv2QC6M8eSIr6pVOZUdZHI9yoVT9pOcgMFD+hKIiN8n89Htk2aq4T?=
 =?us-ascii?Q?kuUIBIdEHHHSzMcervUi+T+QWLKUC0e5R4vxuHaAz/IIHyKKNUeA8cKTcOPZ?=
 =?us-ascii?Q?HEUxasZV7X4EHGNFvUsUuSudmfP1JpGDMupi3nb+1RexNga/cHvsmSKAXEJx?=
 =?us-ascii?Q?CWs/+dunjdK5OrPxG66TO4ODJvjinRgw/FWCmnboa+cbS55+LxzxVwYmKFYo?=
 =?us-ascii?Q?zb7MHG+Piae0wJDx/7Gn1HDFh69fTwMlEXHdbTr9lhfI+V6FKqkGc7Dlb23X?=
 =?us-ascii?Q?vQE5Q7ujMw3yZ0uc08FAb1XENIHq+XwKJhlp4go2SPLPtyuZ5b6O2tgja0FG?=
 =?us-ascii?Q?ZPBum3T5RMRaGl2K/14klxiH8CD4YkDQXR5vgBNCb44/pZ7c8pR5yp8JaDd1?=
 =?us-ascii?Q?WrjrYiApICIY/OJ708Z3jitTzNUNueXLIRJCVtAQSEf74p2HvO8Dxr0nhx4Y?=
 =?us-ascii?Q?bDuicD/Dyd5hcVrKUZs8UV9M4E9MZ5z5l3FGWOREUypyxjHtM3V7+EfLSMWD?=
 =?us-ascii?Q?2O+JAqkTt5y2o3tCZC8xGso/HHTWkrC4PiTOJGoOvJMeeJKp0fwCZFqi5h0g?=
 =?us-ascii?Q?dD7+Wm3H6qGOsLdHuEMtn1iM4vr68JbnGbDGQZADELqCMVrsaZ166VogEgcf?=
 =?us-ascii?Q?jaGYGPuhtck20ry/G5aZmgmCaBZU4WnE6pmZp1QOMaXLS9Nvk20unvvsMZH+?=
 =?us-ascii?Q?HKXOifafmRTHn2XUKoBKv0vbFp0x1SFot+Ky7T2PTlpaoMqcGgGIxihAl9A1?=
 =?us-ascii?Q?IB45Q8PuC3isI/sd6SHl3Es5M/gUjd1NYGeW2sCpd7y0obsdmnbmvCosCuJ6?=
 =?us-ascii?Q?sdWX4svg8em9FWLi7huvxJ7F8+U/0m711YVfYs1IgVWX8X7mu8g6DRqPkHGg?=
 =?us-ascii?Q?SV2prT+Z8H4FfDRoDTJ7Fqn4idxbUj8G844xDjI7K24JUQF2iIP+AB9HLjh6?=
 =?us-ascii?Q?pIzIBWNmhRmx2YSLIqAslJgVdzSzexp6PT7bek/lhUdCryGV5qIIVJ32+1OB?=
 =?us-ascii?Q?9hKi+ENJQj+b5w0he4z+8p6AdgJMGVO7Vik5EYt52JAwVr0XUzG8Td5ADHCG?=
 =?us-ascii?Q?H+zof92DiXrOSDOuqEI8noVYZgjM6p2iWWGPBvYipqBLIJs2w/jEXFBv/sy0?=
 =?us-ascii?Q?6+G2ptI7rdpACptR+5+YvF8+HEhrsEYF99rwtS+FGydl8ah2jU1fxfkJWxVP?=
 =?us-ascii?Q?35aAR6TLDjey8jtSrtJ2rCaYxfEg959aCMCHkc+ChtHC6mNquCMO4/cVEXvv?=
 =?us-ascii?Q?aCayCExbK6EuGU9e05ZOUdm4rIjdJOP8Zs11jqTT88EqpL0jJBfuQOrD6W6s?=
 =?us-ascii?Q?vzxpTfz5qiE25BQYumrCheX5OUaBwlHG8tUxkyBZ5kkngprAZBOdP4kxoEvQ?=
 =?us-ascii?Q?csGnpdoXpkOLhOhbFebewNVv+HteYm1OCq1uj/QrsrRVgkFg4sV0b5eLPoSI?=
 =?us-ascii?Q?58wRtU/QI/7YViLRzqKJW49s8zz29onfIyviHkEAeTFl/0zoz2s8yBbXy5lK?=
 =?us-ascii?Q?EQEqeY3ywwt0J704xlPN2uYK6FwfZfZYxnkg6Qu6lHmzzMdFYANv6K9CULrw?=
 =?us-ascii?Q?ivwTBOk7Fj0BjUVtoN5bFM3Nlc0aEabyJpcQRJ9Rpytiu+bJgu0/H9g3UN8k?=
 =?us-ascii?Q?PGJ+fDY/r02J2cvT/ev4tHPmJIe0crvjx/cj/DUzGsE81SfurUoi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44dae5da-81ae-4ccb-9ade-08defe094f92
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 15:48:27.9443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6W1yIM73KewZZw5go68kF3vx0BEmK56qWYoB9hI06NQpGL996wT0PYBX/8tEz+rvsmmEsN6FdSOHirsjqk675HncAV1G0VZ5JgrIpo4IqrUYIPP7Noem8eILTlimcDLb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10078

On Tue, Aug 18, 2026 at 04:44:30PM -0600, Logan Gunthorpe wrote:
>
>
> On 2026-08-18 14:56, Frank Li wrote:
> > On Mon, Jul 27, 2026 at 12:48:41PM -0600, Logan Gunthorpe wrote:
> >> @@ -1098,6 +1124,7 @@ static int __dma_async_device_channel_register(struct dma_device *device,
> >>
> >>  	chan->dev->device.class = &dma_devclass;
> >>  	chan->dev->device.parent = device->dev;
> >> +	chan->dev->device.groups = device->chan_groups;
> >
> > why not call device_add_groups() with const groups, so needn't save
> > "device->chan_groups" at all.
> That would mean each driver looping over dma->channels calling
> device_add_groups() itself, which is what I was pushing back against in
> my previous response, only a bit worse:
>
> Letting the core set dev->groups is also better than adding the groups
> after registration: device_add() applies dev->groups before signalling
> to userspace that the group has been created. If the driver is
> responsible for calling dma_add_groups() after registration, then
> userspace can be signalled before all the groups are added and ready,
> causing subtle issues with udev rules, etc. I'm not sure it can all be
> done correctly without introducing complicated race issues.
>
> I really think setting device.groups before calling device_add() is by
> far the better solution here.
>
> I had to go digging for this, but I was reminded of a (older than I had
> thought) blog post that GKH wrote more than a decade ago to describe
> this exact issue:
>
> http://kroah.com/log/blog/2013/06/26/how-to-create-a-sysfs-file-correctly/
>
> The recommendation: just set the groups field in the device object.

Thanks, let me think to how to handle it better.  This field just use once
when register.

Frank

>
> Logan
