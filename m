Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013009.outbound.protection.outlook.com [40.107.159.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872CC3D565F;
	Wed, 19 Aug 2026 19:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787168006; cv=fail; b=A2uSqLP+KuqOykECZAKS3TjabcpqfYWvo68C79t7BwLod6ExE6HmUh+rV+4XWLBqoknCtBCwIenAINO6k08gk8AUuX5QnCeCgq/zNHxdH4cCiiCnPGM5KpKpDXlguLRY8WhAx0ElMzHfV/5VVUWuQBpRWa6xvqRzG2SkbMTjF7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787168006; c=relaxed/simple;
	bh=WlbQPpLgSUMT+QyFckLODYTt2By7nnC3ULdPrqMrNFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=N+AWBVGxdaJ5wQbc8gwGOqOs9vKgeKDcmF+wI9et9/oMqDj2ZUelsMv6rkR5DbX2Ls8lgX7TKPIwQY09oLmKQ5fhT2NV7OPcYS/ptaejz5nq8tob+SrDerfNTHPxn7fZeZeXwCJccUCBBuoA2GnYLJKNRCawBwyCzwTpVfDiALg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rbazO2Vh; arc=fail smtp.client-ip=40.107.159.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rbazO2Vh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7TtlpVdn4aq9+d61bZaKGwnKER7cy+MDOG2WNfBW3fg0F4nuW7zyiIXuLmuVmyb/OtucRQ2Rw5ZxAOpf2xbGTQPVxZzN+TCljy3d+BdVIOq2iYORL3UPmrPsyqHEjhzL4TcI0vF+27/j+aBJaVmDcWQFNBhwUi6OxlZehJY8fdDnCPkWOU70wpwFUNncnaiaTGaT67IvhDC1BycUg6QALvKonM7eWrA5NNIn3UgV5Zr01f7IpgFcyba39gdkfl1eW1N70dwvfqNT/rC1qEgQcxdoLEaAl0QPCyvSmineEgjptxr4lgYI8mvzLtfWU83gBxYqc1jOPecMyKhQX91gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7elMmiNYhW/VVx2hLVPWbikpjtPKcZOxrzi0mZ8XE4=;
 b=cJbWwapqlcCvKunyIsjotIYpgstVK5+vkb/gspLU1tgG1yKvVSCnmCYMKvf8vDq5zvnu6ied6EFttcYsE/9gfE56n4AK1cBX/N5I/xBfNNRvZhvhQPqi0R1arimCH2tERFogCvUe/stez6QsFpkDirK8ZOB/ElRT2PZebZkMl8t9DrFS7KMgaoVuqtaJxJu5FLef+3bjWgWKWzd7KV0jgmBceTiNBImOQ0DXD7gR+d46cn3kz6e627G7WlUDmC9SHYjiMP708JgVKy7tQSOvRFvIZw4PCUkSnEte4gGW9oQuiHZnhiSE0pcXgtEcLXXdWkYWThrVx0iz+moUY19qXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7elMmiNYhW/VVx2hLVPWbikpjtPKcZOxrzi0mZ8XE4=;
 b=rbazO2VhRCR/R5nd7qhL5NjJEiMFw5SjFAKD8uOfI48in/TOCp0Dvz9s7E5yD+QMjXuwIxEcnoZ/dhVUavKFCq46SrEEFELBNOXXZ/AHqNcbN2qM577CF7km0VTF7yGL4yAOSMGv0BXVNLqwu+SY01BRUv/Jbm4BVNt3sQ7DKMBY16MDdCbuAjx9i5m8m3MdJBNRHWEYFT8a0IsN9x9YXOhYjoH8frTMSko57m41VJnzoAXL6CuhY3t47EoqKlgem5+XUq/XKw5n/hPAf37DRb9NmV2ZIZMKA4QWLNE2ZJh9CqKGzdlD5INE4UijHXzLuOCw3WSCBf/1qB2koZc1ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB9271.eurprd04.prod.outlook.com (2603:10a6:102:2a6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 19:33:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 19:33:22 +0000
Date: Wed, 19 Aug 2026 15:33:15 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Jiawen Liu <1298662399@qq.com>
Cc: Vinod Koul <vkoul@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH] dmaengine: sprd-dma: handle runtime PM get failure
Message-ID: <aoYE-1fDYzS140nw@lizhi-Precision-Tower-5810>
References: <tencent_72CAD47A90A208C873DD65A726C0A15FC107@qq.com>
 <aoSKfDed29xf-nby@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoSKfDed29xf-nby@SMW015318>
X-ClientProxiedBy: SA0PR11CA0063.namprd11.prod.outlook.com
 (2603:10b6:806:d2::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB9271:EE_
X-MS-Office365-Filtering-Correlation-Id: d44e7fbf-e097-49d1-10d3-08defe28bb0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|19092799006|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	s86yZd7h6gWJmKkAy1FmjYu1ar4QyjeJkhZtCLkM9/xPVxW6xsBF5BifqMiFazpsdIqFJvAGvlXYD5JfP75SulgGSFjI53oVf1jJtZ0Mgb8kEh91t8oABh7F547JJaJBdt7tqHiDND+Y9kIWAKmNfmbu6AGVrhvPPT2Sapp0XCfWXNQtAbJo9BCRJuQYkVYz8txtcx9bPB2wLNby0X+jQDOv8y7OL1wTpqATtwz5nxmjl1C1M5dTEeTPmXslj1ejd3+5oBW0jV7h13R4kzBie07nStfWi6eMYnqOQUS+n3Gj+ivxA4KheX651M7NswhI8/sqGJh1FM7w1H0KKvN3DfOc9GQ2vDTdZX04uHHBJ2ssBz2Uk8FqVTqjrkYBU+knl/ACaeqLrFQWw6fszZS2lH+5C4U+bYTat5M7z9lb3RbRSy7e5cRakSp+537ZNwxPdAdQFcOUQUSmDMIOBnte9QuMyD50Q1YG/UZuy0XItVfAmvnoIXMZFGBTRaNgOycw4pDhdlOJzuDACoQ9IFg/ayAMa25gKhwGHJ2gvt6L1FOZJCo/9xKn8PBaBg/TiNVdNwXh5F1n+3SqOPCKZjJB4lUyVcBVrjJiGSwZADN6yLCwpkQ7W67mi94du64liVuscbzifMowwbbrkRkvWprp90q2UCKCfrtYiPk1lWTGwL0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(19092799006)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vR2kx9PiBEeEmy13ALagPqVhXFaeYVpXmeFcnONzVRgGcVRxPCwMrvqE02P/?=
 =?us-ascii?Q?xaVZskg/VdSZQFOMsqgrH9LvODyBQZ6apxF2Rbe013yR6IdHGtp3O0uAMV9i?=
 =?us-ascii?Q?Wu8pdiV6BEEQPw8Z9GkS5d2dQe965xWO/xLVn+zpeAhKsVxMfWYhm1D5OUgA?=
 =?us-ascii?Q?XVWLFyYeP8dG+pVpPMcy/70k+X5dnS8fYi8r6hoaPFQOJ9xeszytVwKQX3WE?=
 =?us-ascii?Q?0ffPW19UBzc0greADL/TSxkp/nnGcoBXsGaso40hviZQQhJs3KiHqNiNuV0w?=
 =?us-ascii?Q?BYkb1weW0AxPqG3GyAZ4uahTqSlA8z460iwnR9Q0BJ+8KHRwBW2vHWtnFDD0?=
 =?us-ascii?Q?wfl7q/YPs0DTmfb6z/wgbpY2zY1gs+Gliba8vOnTADeTiaIxmJHIEdgPGpZd?=
 =?us-ascii?Q?HEYsG+/rvVvFXQ6aeOElzTyikm4txAmgnBQ0MYWG3TOFzuZP3DUqS62YQpTT?=
 =?us-ascii?Q?/39cW39McA/XgLkVSV3FSGmS2BITnOQk9hCigYnPZ0PkmVVzJJ8/ftCAXZ8n?=
 =?us-ascii?Q?9XwjKHKgeLSi9SV1NgNDu/ErzXq7TOEvssDkom8SFUGj5CCCjmWtHV/BxYZP?=
 =?us-ascii?Q?jNXh1wNF3/6Lutt50UdQJyNIuclw1VrgJA8x4uHyHF2iaS+SNOB6cFAc5hSK?=
 =?us-ascii?Q?j3xiJBnBgp1HQHP1ZwqiXKzlUm3+BwogylV462TRDwXcg1sT74i64yAChROe?=
 =?us-ascii?Q?BSLOkBlX38Mt8bxs8vCTz35bDCa6Bwtqk1RrN4dN99vNZuYfds/Ij+oY1Rw4?=
 =?us-ascii?Q?NdjDji7lwoFbJufiawydEiTo/5nMm0b+qNJkyY03mnkDPOgqNtUE91/iP+kB?=
 =?us-ascii?Q?HsYZBn1fh3Gy17ZXGTstIbnNzyap4ARbufo2F9x6AdhyakB+TokPnFhoUuVy?=
 =?us-ascii?Q?x/764hvoL3Jr387MSy595fXKg/GGGOqQ/C5ypOSEOiWCIxK2CftxDayo736d?=
 =?us-ascii?Q?sx0Pta9ivLm8bwyHG1yeKvSbYiaYiVwUgkNUsyjTndippJI7sztATKSZD2SG?=
 =?us-ascii?Q?ntwDhRINoJ7NQpmQYE9YP6IqFbLIzaE8EYwhVFYtkpX2cvvFPsYZTvQ3zRIq?=
 =?us-ascii?Q?e1t5s9hDLy3uA3bjN47PZtB2/Us9gKayP5MTb9658vnt8o3s0N7ccQh0MmAK?=
 =?us-ascii?Q?gfjRve8iSkHInxJt1Ws9Lu3lX67KaHAlDZiKTo5W3oiR1jVbW2+bUJeRcklf?=
 =?us-ascii?Q?lHKh6Kus2ReB5xy8p+d9C0J7lTJIi2gaLMWtar/rNkuGihk7aRnP3vsFgk8j?=
 =?us-ascii?Q?NfB3jLrAqgKdW0RG+3BckBbRLIpIlDuFlsn8DvgzFSRkoUlqbifn53xSYGMn?=
 =?us-ascii?Q?DyEs1WNGPyb8RYNzos1ebOCYon5c1qOQUeFrbuipnO71p8/bEqga294+tPYB?=
 =?us-ascii?Q?6EBXotxv6y8zd3O5AMgFpI8YEBwpUEnvnsso0gX8qQlOzd2zG+52mwYfZhUG?=
 =?us-ascii?Q?5638tg9318TQroofqCWJTuLSC6gmLwGix3DQbKI1kC4UEEG2I74xCkWbRGbN?=
 =?us-ascii?Q?dWDtGJkMxEMvXCWs6g+3u9C65Cb6jXoIikJGGj/Lzz6hk6QgtOfAY3nJZ3e7?=
 =?us-ascii?Q?bJKlswiQX743rjiqyL+U24idHV32uu/e78+8/4leuaoisWvPmpqnf80B1ANP?=
 =?us-ascii?Q?L26ELv3J6E+rHi9nmSobnmrEmQIPbs0D+WVsG1xQrfaZ2SHXPvHx5UCjr5rV?=
 =?us-ascii?Q?6HzCJ+dk+P1RrWPMmzH0M9nFxQl5bMK0HLsvxM1MmJtOK/EcETbRhsoXzpN+?=
 =?us-ascii?Q?kjvbc4eAlXSPT0ZY7m/dWvcPkAAXAYxWna9pGPe9Vvcuq1bYyHx5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d44e7fbf-e097-49d1-10d3-08defe28bb0d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 19:33:22.4998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMW4xlRjpFJaI61sixS2wztG8J11/fuQm32jNBrfSY3OIMWKIU1wohZp0jzkZzNV2Xkvd5MnCwhxlXni6SWpfZkB9dT+22aWXcd+neHZ74alxSWUohbNL8Kakt6XJz/y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9271

On Tue, Aug 18, 2026 at 11:38:20AM -0500, Frank Li wrote:
> On Tue, Aug 18, 2026 at 04:41:24PM +0400, Jiawen Liu wrote:
> > From: jiawen <1298662399@qq.com>
> >
> > Route failed runtime-PM acquisition through its existing cleanup path.
> >
> > Release and disable runtime PM before continuing with the hardware
> > teardown, so an unsuccessful pm_runtime_get_sync() does not leave
> > runtime PM enabled.
> >
> > Signed-off-by: jiawen <1298662399@qq.com>
> > ---
> > diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
> > --- a/drivers/dma/sprd-dma.c
> > +++ b/drivers/dma/sprd-dma.c
> > @@ -1212,7 +1212,7 @@
> >
> >  	ret = pm_runtime_get_sync(&pdev->dev);
>
> Use cleanup
>
> 	PM_RUNTIME_ACQUIRE_IF_ENABLED(&pdev->dev, pm)
> 	ret = PM_RUNTIME_ACQUIRE_ERR(&pm)
> 	if (ret)
> 		...
>
> Frank

Rouyu wang already post the same fix

https://patchwork.kernel.org/project/linux-dmaengine/patch/20260813153149.3953497-1-ruoyuw560@gmail.com/

Frank
>
>
> >  	if (ret < 0)
> > -		goto err_rpm;
> > +		goto err_register;
> >
> >  	ret = dma_async_device_register(&sdev->dma_dev);
> >  	if (ret < 0) {
> > @@ -1234,7 +1234,6 @@
> >  err_register:
> >  	pm_runtime_put_noidle(&pdev->dev);
> >  	pm_runtime_disable(&pdev->dev);
> > -err_rpm:
> >  	sprd_dma_disable(sdev);
> >  	return ret;
> >  }
> >
