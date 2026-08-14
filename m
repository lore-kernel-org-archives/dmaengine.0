Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013018.outbound.protection.outlook.com [40.107.159.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95733E49FF
	for <dmaengine@vger.kernel.org>; Fri, 14 Aug 2026 21:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786742117; cv=fail; b=kcxY1to+9mYXZXNntL1eSx9Y7RiFOteJu7G0J1G+WMz5yzpNF0XQOC4r7FQ9/rgrRFNnebrK73oUX4iVd3YltrZI9WvmMEI6QIG8l441gr3OdWREkH9A7oA1NETfJcDPrBW6iMoUtiX6NvN5lmtkhGzWhZ7Hl5JTTmZ0xXtzuTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786742117; c=relaxed/simple;
	bh=Ly0fHANiK98tjadsoU6jJVcsti803Jt6ATAMjl/2XcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qHfY83nXvMChBgfJDBY8gmgl9fC0RVBvnjX3bA6R0+4O4TwXwAbtNnBSU4iRpvTpWh0oVYcyhuEXr5+3epVqelIhJxw13eUtgYOyE6j3ZmkqiIJWmugQHu3gTtcfIIZp2y7HoMlgDL0etoMFL862r1wXzatcvM3lRWQ8RbvLxGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eyS+PwQ9; arc=fail smtp.client-ip=40.107.159.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eyS+PwQ9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzjyU2kCWdrWUezFBpQU0JzVWIYXR9Z+NA5TsYJULRvTYrf/oYSO95KdMHZ0Ax1uRhDFN5g05MSvjtVyhXpjAnMgpTPrmBcFCcujAJCrsZB5c5ZVIQEcxI0fcGrEMR9v7qbfo0h/eh9ED38FZ+Ulh7vELDeeVZ+bGvvXq9o+G4eZHVNvvh9SJKUdwOZwDCyDjkDmeXOgMhkzcyOVQIXHzgHyoXFTWN6iFpD4csVG5AdGCtGsPpx1BM4r99C2Np8YtR/Tfj6xrbC9sRKApspJt7ggyV8fQ6gtVnMnkAr5i4EB3Safc1z4K5TIQfhEps2XUiy2D3U/3ISbaRQudzfBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYPIhkaNtIxoCS7RHMum6WQP89PSgOoeOGlGwCeWCuw=;
 b=fh0Jj0iR5i9NwlQ9aakThzIrS2svxlq4Xji6t4bR5Kv/dgR1eivrvkFUK85lpoX50+p5hI7gltmlZP0l796EdOSQJ1dykYh0n8rwf2HN7Yl/oexEJn/91ScURlLtnWcREU5NerRLlKl3JKqoMsh+zXF2kb03QLP1Ru2xS1isbtvkRAq4ZotCYVGwJJlvD/E/rnVThWEqCHP4d9bmre5tcZl8730S7Sg0F6na7YmyMpUo85HSuC4tjAjO7Y60VOTeHBYFz2J0ZGrn2zIbsrBetKsGqsuDlp++f5zQxfST2q758zosKQEKFS6sQOI+ucl84pa+pi7vSLM/SXz8P6U64w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYPIhkaNtIxoCS7RHMum6WQP89PSgOoeOGlGwCeWCuw=;
 b=eyS+PwQ9Gl5OImQkjLCvAh/Bs8aQKOKEe0DvPnNG6WtXp5cIVmQrtSiqEuwtfNMaKWl3jr2ap2zkGANDU6w1yuQYSOnRoa7Qpw2pJ2f3bMQEDON7/C8of/v1VELKmAv9W29i2AYkz1HjXb4czoDMN7yJP2cYWMJcNwSAx+9/TBdSrdaGBTBzuBdtXR1r8YgYIRQcY6WIpC3vjUZResOvlu2gG1WiDQj2F2bgDgYa8eNY19Nf23op1Ug3r8eC+NAxj/3/qV5mBE8oioPKt1PkGDyeYN1yBXjjlbBMgNRsB35HPN0Iy8f/mGW2VZyIBGkUJvQoDgSby5U/pzyrcBAMbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB11654.eurprd04.prod.outlook.com (2603:10a6:150:2c3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 21:15:09 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 21:15:09 +0000
Date: Fri, 14 Aug 2026 17:15:03 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: pl08x: Create debugfs stats file under device
 folder
Message-ID: <an-FVzIRAGMj8hX_@lizhi-Precision-Tower-5810>
References: <20260723211739.289699-1-vz@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723211739.289699-1-vz@kernel.org>
X-ClientProxiedBy: SA0PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:806:130::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB11654:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ca1ef17-3e64-46e3-f5e1-08defa491efd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|19092799006|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qDtEZW0e7nQ2pP5+ru+wZtrHbIIm2qPEnHeeeMeGmtjL00JgbgYxUnbKtriBkkhXcH4LqyyTLoMIDF7oOJ2pE3D+IGAwHJR7PKWrHhRWJKlIH5gToNRqYaiNLbogf4tUc2GmpeIzueUfoddeNeZGJ16E6z90aSqZonUv/TSTHcZRynOlBWWelSFgOqn5gplFmerVmTZY3v4hShhUAd5mROZf3jBe4iChk7GRAE2om8WNrJ3KQ9vF1ZIue2vloVGDfctxh7gxyH9ONYxm0e4USqR3HtnYvyqTF9BrmEdE2Y1UTBqsS8dLlUzEhUQZ8NFd0oF+y1Uir6qcKCjJx4DGUxRUkxLVDqaf3JWVES9QDytehWIWA5tkTHq28YbT6kh+Sz5BNUE+CcEIavp4VJxnom87hffjTbj/OZDs5bTaUwHHrRdFk3pv27sjGkyaWFb8sWZxernJHUZx9A9NvMtnWiiCXfFhl0TmUfhZ2LFyHh9yX62ciykKssoJscZ8vNziq/7JPl9TPijThKPb0BDgzwvN2EngK5CWfHwUM/cjSLYhqwU/7qViP0xkWqXS0kbEeeXTDt+aT7bA7Vw9RxT2S7nxMNv+drq41YcZorrLdKUuCmeJkps716hvwwkGhyGkriwho1oaJcOPZ6ScudjeS0VxKlZNrhb0B1YSPtk0f9o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(19092799006)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x4MPxOToi4BFRXVqtRTE2K0w7WexNtzv7gcgcd34yMWor13mv/NB1RoIHHDH?=
 =?us-ascii?Q?qsZ/dLW/t1sSQn9wUq2RaHj8RuaXxEek+YjGwjgh0wOb6NVxhbaePLeimT46?=
 =?us-ascii?Q?8z0VSMKGheZRnp++1liu8p7s0zuuP7Qpn3X69Grr1NMU9M66h+RKFIzHJQoP?=
 =?us-ascii?Q?6fDBPf2leEBlOeQplXodN2a1jC2kB4ZTgLveO5tkYBV6QvKTl+LLAe36Fv5b?=
 =?us-ascii?Q?9iRWIZu7u0FEltt1J9JZ+W82uJnbvRCJQkJwmirUVFFf3/9KTiSb9r6ulfW0?=
 =?us-ascii?Q?GfW7kXb5xaV3nZ+j3AAYQlM4PjQm/wY9TZScmq3V/TfXfISXd8VVuTVmPziK?=
 =?us-ascii?Q?dOhySp9acMGGEfT1PQ46PLvZuY91VZMqmiaDmh4gTnyp35/vKMX55Pv5hAV0?=
 =?us-ascii?Q?ESOGgtJwCa6mSTvacfMU21GHw3u5X2QrOWW5HlqszL8DytSYYS9uXBsSHWty?=
 =?us-ascii?Q?baGC4nabotcfBu47eE2JmEihFyCWQpAT33NJXfnq+i5E4Vn/QL2+qWdyFsgz?=
 =?us-ascii?Q?GzX8fTejreou2UrQrndDgrrchxv6YWtxksekHuLmfOV4iPu8otbj4TERj9cU?=
 =?us-ascii?Q?/LiskbzN+WB711Q9uiSlmevvPDNVeYgX4HY1lxDVxoQOAO6exfGdvCmIz4L6?=
 =?us-ascii?Q?HTJYyAZ4gTMZSLVsloOoVL+HEmR1YX2o3obBEmOcQ10p15AzU18oGVW2bi1P?=
 =?us-ascii?Q?nH4L6rg0vQNGr+DCsu1+coLGWHtC4jzMGmOm/tkROF592svH9Y1Mnr6FQDUA?=
 =?us-ascii?Q?ZkHhy2xNBbzqURzEhHz4NUGIdfNn/broOB2Py72lONY+4fkt8wKjxdRB5xId?=
 =?us-ascii?Q?mUaCVa9rAeBcpZeHb9ivzctxy0sSQrEw+y9fuIP0sQpP0AOKJRRO7lmFeb1t?=
 =?us-ascii?Q?K+L4si0Gasn5BW9v5oDGbtWjs7qm8+KlDP5bZ9U7uHNmq4HU2AdybUxI8JWE?=
 =?us-ascii?Q?k+rpK65LLg/MSab/Jz15zNH73T0RK8hHlYAuDKwZuNgK6kCUiRXzOVowHF93?=
 =?us-ascii?Q?Cb3yIPuDrVD6nwZW6WgzJ5EA18Bl4LInq2zNQhdUEur+REt1b0+YrEOobeor?=
 =?us-ascii?Q?TZ9/vrWf1+yy7ADXWNS4V7HVyPUH549nHl2HIaBNIOjTgrH9AordsQJgWYWC?=
 =?us-ascii?Q?/VRDP353OFeznklSbe1xBfjNiImbYqY3/ry5oyX+yNip7nwZRp5UDFztBLBk?=
 =?us-ascii?Q?0ViXNxTJ4UGlAIX+oLc8vGthEF2nZOembAJ9BaPKnSt0NAd1eGrR9HNplU24?=
 =?us-ascii?Q?tsbCAUVpTKyMCPkHrtJFs3e6xrTwiSeL601sXRhvWHycp0T/j8MXZZDEmpy1?=
 =?us-ascii?Q?eLD4LpwkRnqDamKPr9aX0ynSHaIJMaxKzZRzhoL0xqjrAwWRUNW4sE5Jg1wz?=
 =?us-ascii?Q?pni5sseMb6NkhdCV2LKJ+Z0Kum/d5k67WasZsoHw01sHpqmv3QJRBPyqA2g4?=
 =?us-ascii?Q?K4eC5QUA6EnqY/6r7jqSjVVWkQDVUmIfWEfVo4AZ2wi7HLFiTk66a8rii+MA?=
 =?us-ascii?Q?NY4o5i8a8DmRMsjI4FLIaKI5r3z3P3mtJkwRq7W4ZKGXpJSl7V1fRjdVH/Yz?=
 =?us-ascii?Q?Zl+RWsBlBT1PWM/w0dTc0Z0a/KT//H845JSmrUf+8v50g7jO8E2fcW/SMRtx?=
 =?us-ascii?Q?qx8mbE0Q7ULhKdqa0ACfu9Rt8Dofj7ERxDto3LHVx7JVnrbA+JCRdrEHveUN?=
 =?us-ascii?Q?oi3B0jZ0ucEBiwPu2xtG6403avEA8mt/odOiEyErdfehiIF58VlX0mw2norG?=
 =?us-ascii?Q?pDhYH6uGwPFKs3O9xIP8H/HGL0gVkWzfREk9rugv8+UH+H37ydjm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca1ef17-3e64-46e3-f5e1-08defa491efd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 21:15:09.4673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRRozA/Vu2Hlkeo+OQ+s5J0IZI8DqP9Tc4DqjX/S2G8hbmINSijVbrdiqt2umYMDru/90VU4/4HT8Jc0rZNpzFGAE/qPaeu6aXYSTzXrIRa6VwiumQFVHV/XecSl/epf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11654

On Fri, Jul 24, 2026 at 12:17:39AM +0300, Vladimir Zapolskiy wrote:
> If parent folder for a debug file is not set, then this file is created
> right in top debugfs mountpoint directory, which is undesired. However
> for every DMA controller device its dedicated folder below 'dmaengine'
> is created by dma_async_device_register(), and this particular folder
> is expected to store all device specific debug files.
>
> The new name "stats" is selected as the most popular debugfs file name
> found in other DMA controller device drivers, and the macro constant
> for file mode is replaced by the octal value.
>
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/amba-pl08x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
> index 5e88fd44812d..543c2eb8cfa8 100644
> --- a/drivers/dma/amba-pl08x.c
> +++ b/drivers/dma/amba-pl08x.c
> @@ -2500,8 +2500,8 @@ DEFINE_SHOW_ATTRIBUTE(pl08x_debugfs);
>  static void init_pl08x_debugfs(struct pl08x_driver_data *pl08x)
>  {
>  	/* Expose a simple debugfs interface to view all clocks */
> -	debugfs_create_file(dev_name(&pl08x->adev->dev), S_IFREG | S_IRUGO,
> -			    NULL, pl08x, &pl08x_debugfs_fops);
> +	debugfs_create_file("stats", 0444, pl08x->memcpy.dbg_dev_root,
> +			    pl08x, &pl08x_debugfs_fops);
>  }
>
>  #else
> --
> 2.51.0
>
