Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013057.outbound.protection.outlook.com [52.101.72.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6917834CFC5;
	Wed, 22 Jul 2026 00:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784678461; cv=fail; b=LiSIgWxewHvqnC+glytvsslJGAYZ5cxnUKwHow/s09ocOiNODDHoulUy2o909OArAYH58h4xKTLTy2aqR9WvpUpM3qWmEVn+q9VIgX+kwFzQ0x/3/nGI4RVOlAAywlypnAKPw1dZpOzf8c4Z3hSgoS71Dm6+X4q8k8fsApMDsXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784678461; c=relaxed/simple;
	bh=OaIqVzVFEh/tTZhKme+U3S19rdYsWXeIcjhs2mY4/hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=obl4r3jJlNTL64T2agTBpCZlH6ijlBPf73QYOjW2/6jKqFwPiDWctjwkfhOBi+coB0xVp9QOj2hUb8zceTNvNgCiMMJtJqnfJz1XoVkqX3rrsZBbFrkBWvTwgBapAcHxrxLd4dKuz9o2uNoegq3nQyh+5BU0whHG0gckfiq8f3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HHTik42R; arc=fail smtp.client-ip=52.101.72.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HHTik42R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eNp7pywB7jhS8Et2dw4uwtCGicgFORo8tDqTHk1n2Pa5YHnKxFM/kHYiVDJuQ4QWJDRm/DdjGfu74p2sbA85QtAqWVcSTzBLLqG9F6QtD3nuxJ05QBUfQPjaMfbOFYTCYmRG/awQMTtBOJu1Ax8YLnBQ8R4cs1zol1nX0rtop4SpaxaTJRoH1xpGtQsJhLr39hV5pVYKL/h4PrBokJ45sgW0wahHU+hwbiEEp4RCf/tzVeOIl+RftWpV/BVISg50QBd5fzjdWjqVDcSO7znI1WiPpOI8rqwHXr/fZxOwdnVkFNDLSPDLaxAZ5IpIG/O2OelDDoYH745r4hpYUgDx/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vr09HVmNO0hTEKH3t3mYEq2D1mn7ujKn1GLX5/vLWCo=;
 b=PCSIhLgJVrBXhDNjSe3vpGhGjE5GuCZmy92XEpGbTA5lL8sCzO95EeeFMr14K643bee4t27fytQuAl8JOtD6krw4pmCVH5mLo2SkJSolFTEm1rDPywX1XfkBy+OPoVg6RIvRRZA3WpXb4Ff5FcAZvnGtr/ONzfrwa48988iE5VI4rSFN+RVJm58Ehqgunug/j/fIhndcysLcEV5rQAIIwIRFNoxSISgYiJLOIKODKwwjZIZj2WbHrw6fuSOoru+CWKxQ4eYy9XvMmdCb97XEVxmAXKak4ZBcjApi3eQraFfAE/9oHFBT1KCUbJnlae5jRjBTjJqoU5IURLtqFeDKMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vr09HVmNO0hTEKH3t3mYEq2D1mn7ujKn1GLX5/vLWCo=;
 b=HHTik42RC4VWHnFRLDZEVYW6zmptR9BCkM0jP8kzpSv8Poxb0qulQZqKktE6zYfTBpadB5oTbQ7tsM8s3iQkiuhx7prbf8UnRV2F0aNmhbqXdtgnmU8RErEbZANizIEG7iOeSMVUCieiRTe9hMmhiAFY78pJx6QuqI8Hp4pXXWp0SYw8A7r4BWuFSNeeyTWiBnj1AxMyW+scQA1CAcl9XF1TJZvnXBKKxXk4QVLb9AUBfxXpbgnNLmOTs7ozntLfe4NrLESL4iNHZA/UnzfA7sH0XJ4Ww2hNJ6gML7F8F9hyd37AQHVtqcgPtz6820sI/+EDtOBQOLsaIsHmGzgMtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8417.eurprd04.prod.outlook.com (2603:10a6:20b:3f9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 00:00:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 00:00:53 +0000
Date: Tue, 21 Jul 2026 19:00:43 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	Harninder Rai <harninder.rai@freescale.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv3] dmaengine: fsl_raid: check fsl_re_chan_probe() return
 value
Message-ID: <amAIK9HrKUidNADC@SMW015318>
References: <20260721221807.664865-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721221807.664865-1-rosenp@gmail.com>
X-ClientProxiedBy: PH8PR20CA0018.namprd20.prod.outlook.com
 (2603:10b6:510:23c::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: 18c845e1-80cb-408a-1b88-08dee7844c36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|366016|1800799024|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QpR7sJRk8u89fF4l1hlIEUSZSt+4hV/h6R/GDcUdjwq+uhLN059gyqX2D9Fn744w2WERUZAntuIhCXDTFzLQZ4g6cV8RENMF1l8MXxzfc/bZ13EvgDIaoFcr2VhmDjSDeKjcrULXtzUDqdFE8QzQ+0wYJ+E2tF3kFqPgIAv9TyHI+QZ2hWnA0kG8zlgIBcl8DgsVo4SqYRffBreEaFGB2u0AFG2FdpB5xl4fPLH4CRoCGEkSf+WCnbbiOz0uuXfwljAmfa5385t3iFSD021KhTBceG8hMPhgsElFtkC8bGgaff4eMwy9Y/5sGIJDAqmM2HXPcgQ9K/cKZ/ZdRnagk88B0MDqi/WDBBV45a5jwv67PgDZSgHCJfI4VdUlzZykYn4hBAN6f1cf9o6wiKwq23cbOm8norqCZWOOOoSvKFBN0OD8w/PKekYq0/2N/o38oYiE+F3/Fj6xHDpRniupmARr3bIqbUJbqB6ubuR3eyfPHmZTESYn7w3rac8y7RpL2BGpRMezMEtFFJXxJgOdDuXG1Id1/hzqIFVbntHg3K65cK+EKhhc97li3u78wtQpN2+dsK3NAwyYkbdYjxAmFvzTOtgWktUPkL9hh65T+RjCvkpn9TQWnKflkDy04heqvGCI3pj5cyZRDuxqOsg48RORCxWau+Zj1smSajK+GiM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yoES7Vdt56JrmLOxPG1TM4l9XrBqyoUWm3mFDOwKOjYZ4g0W7p3bosvVAM8D?=
 =?us-ascii?Q?lkXNbq1EFFPy3oWF/KKf+py3Z4orFFmaffWnzBHcQ6NG0BOkiSQbDqXjZGr6?=
 =?us-ascii?Q?Eazsj2L6HakFtZSTfUjufnhvFaf/nJUKcQtTIDZePJAAHajfVzESVak0I1IQ?=
 =?us-ascii?Q?axPXGmF9lDo4Pn1VMrR9rdhQjBvVDkQ9xT4IMG73r6DXj+2Elym/cNjzgwHf?=
 =?us-ascii?Q?T8yQPyq1IP/CEc1O2pWKP+UYW2AOn6HyWtdGIpwWkzBKez1Q8xZuMhRpDKP4?=
 =?us-ascii?Q?nKsJ5S8tuvzIV5hXziBi8IrqDBGoZyL/2CzFIj5vt2a9vxcNJhJwP/oBsTnl?=
 =?us-ascii?Q?KcwG2QNnohlTugsb7qqXTEPSKXGfHfGpAKgZ0JQxT6SJesyAanRqb0WpeaDO?=
 =?us-ascii?Q?Jn25EFRS8okL0jSEAFLd7O4MfvQ7Lawpfcfe4aX4u1sXoH3JDTpgPOP58cyF?=
 =?us-ascii?Q?HgTkklqBwqoYi3UfVhqP2IyLGIOBR/l9bJt3s00wMjCw0DY9z56VaQ+6UNOP?=
 =?us-ascii?Q?HXqsJdFxIoXMRu3w2z+KeFzH5t8odVIMBpZSZFqUJF1mZUyEGXy2+SmMVx4C?=
 =?us-ascii?Q?mhQBOvrlfZ0R9w00nMFYdrkoAskB1nfi38VK8R/a7clc6EJQ57VOs+7pUzia?=
 =?us-ascii?Q?GRSjicqkzNBiJoZXKCNK8IsZx0wzzqNnB+6crL2LWWKuC9o8BuWDC7AdQuOq?=
 =?us-ascii?Q?9BkMuQ3tZuDDVV53g0Q1UerSZxfVXTf2fFL9WTKfENGb6lNnKrmT7z59auZ1?=
 =?us-ascii?Q?vsQpIHz4CSaE8ynTncn7IFJq/MPbx2w3tYTcvoruKbiy0aFBOtY9dkiyCrA+?=
 =?us-ascii?Q?uwh5Z3+bhensbhveyjTdr8UTsY3gGsMy3NBisHumPGqo1NClXXPRbPgFYiOA?=
 =?us-ascii?Q?82owex1psDU9XGsAmx5TJwyafb55ww2qTVQj8G/MPBDiuthtzKLsaBHx30hu?=
 =?us-ascii?Q?4pOM9NnbcOuba8/FIpwik412ZkN9R3GuEtnDR7NDBXsWiBwTHY9Er1ZqYOmv?=
 =?us-ascii?Q?Y9fdp+ULCGCdj8AqiFDD+Z9YV5JQLOiZDVRXf6hL215BxwQ8ZUgU1TUSMGbv?=
 =?us-ascii?Q?7TeUe0EzYLwmnwEmoySi1767UzSJ0poFEey8RKbcjF4uMJeM5R7PxNZivjl1?=
 =?us-ascii?Q?9dIQvaWARa2y3pzhfyd/9WCTKlpinJqT9p1q1SG5hsxU4V4YBeFD5emeCv2a?=
 =?us-ascii?Q?D2Il6knMjOcdocr7J8rVhlsXqFQRl9NpGodOo2L1thaPr97eYq7kabjWl1Wm?=
 =?us-ascii?Q?osXfLrbpVK0LAtGx+07wRkeoEIUkOO3RfC2y1htzXADxe3aWgZkdIhxow0zF?=
 =?us-ascii?Q?6Mz9HoNWvoYv9kapGhi5/VRH6BF4AKMVjP+en4pwNI/zV5nXEJApMy48ORcc?=
 =?us-ascii?Q?UabBaPqJQKd/6Sw67XZAiLSUgC3IOM7fWfVpEjbgxOz6uNvIQXms5GwHddHR?=
 =?us-ascii?Q?YOzxbozVcPawDLkZXRw+kXi4BsySD9SEZkHX4WyWBf002LhYUEFRFVKyVUFX?=
 =?us-ascii?Q?SlxGyhRzOp6GaDesH5p6rqO842WxW5I6wJVkRV1FWz2Kl4B+wXPOvN0ZNM/t?=
 =?us-ascii?Q?lceKNBoDnZ0k+WFwVVadf4WIYri9n34RjIimdw7SJjeAIx2ovyUcBbL2QUS8?=
 =?us-ascii?Q?L1PiurXTeYi60O1pQOHwj1gfo28nqExwWEnaBrOJ0bG13XPnfGTyQFznX3SD?=
 =?us-ascii?Q?uWN1L2QavZsoxkhrZpsNcYNinBjsErfMlXAvR1bTHly3brhAn/c1J5RFVIff?=
 =?us-ascii?Q?NAFtdvtiMtUSgLAQQD6ievZBW/0Z0HgJ/b6xAGjnwbYe491nElfU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c845e1-80cb-408a-1b88-08dee7844c36
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 00:00:53.6479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pm92vV6W/h5CPMKEzRSxTVMCd5YmKoqMtudqO/GuqZI2LmcbHyeRlrV26E45D+WQHtc0b+pQpo1Oxk2Y9+IXYL+uVwTgJd4qnHyZXRb4r7+tOZzVx+UkEqNjynTWDoW1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8417

On Tue, Jul 21, 2026 at 03:18:07PM -0700, Rosen Penev wrote:
> fsl_re_probe() ignores the return value of fsl_re_chan_probe() and
> unconditionally increments total_chans. When a channel fails to probe
> (for example, an IRQ mapping failure) its re_jrs[] slot is left NULL, yet
> total_chans still advances, so fsl_re_remove_chan() later dereferences the
> NULL pointer during device removal.
>
> Check return value and only count successfully probed channels, and guard
> fsl_re_remove() against NULL entries.
>
> Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v3: fix sashiko review
>  v2: fix description
>  drivers/dma/fsl_raid.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index bfaef6245695..66de27eb4365 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -841,13 +841,30 @@ static int fsl_re_probe(struct platform_device *ofdev)
>  		for_each_child_of_node(np, child) {
>  			rc = of_device_is_compatible(child,
>  					     "fsl,raideng-v1.0-job-ring");
> +			if (!rc)
> +				continue;
> +
> +			if (ridx >= FSL_RE_MAX_CHANS) {
> +				dev_warn(dev,
> +					"too many job rings, max %d\n",
> +					FSL_RE_MAX_CHANS);
> +				of_node_put(child);
> +				goto done;

does break work here?

Frank
> +			}
> +
> +			rc = fsl_re_chan_probe(ofdev, child, ridx, off);
>  			if (rc) {
> -				fsl_re_chan_probe(ofdev, child, ridx++, off);
> -				re_priv->total_chans++;
> +				dev_err(dev,
> +					"job ring %d probe failed: %d\n",
> +					ridx, rc);
> +				continue;
>  			}
> +			ridx++;
> +			re_priv->total_chans++;
>  		}
>  	}
>
> +done:
>  	dma_async_device_register(dma_dev);
>
>  	return 0;
> @@ -875,7 +892,8 @@ static void fsl_re_remove(struct platform_device *ofdev)
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
