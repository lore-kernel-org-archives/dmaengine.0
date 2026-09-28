Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013068.outbound.protection.outlook.com [40.107.159.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632BF37B010;
	Mon, 28 Sep 2026 16:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614747; cv=fail; b=A4a5Za9wXWZG4ZMmE+m29YQMfQe1Zqnn191HIghVr1tPxrzbXQ+emYIrFkW6KrWjT55NkMUhE1W82YKO+yBPIku9POkOrSmbML1wt42y9Sh8oO5oXRBLZwNMG6mUhHvhHaF4/cw7jYXBqZxANPaG6Zs9VzUoLF46WZUDbZ3np0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614747; c=relaxed/simple;
	bh=AsFZE6rlKLD+PRQUMH3W08JNYa7CjF60hBdFOVwtigk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dcFSc8Hu1iHGHjbzN3CKH5hADO4ra9ih4Dh6SDy9QB7pfeBUWEcUgRkUlLMR86fQjRXx7fnziXMja2cakgAla7EZMwuFP0BJ13NSH5FnTBIQfU3uRl+uRmP9s9BzaqPVj/SiYAF4lIcq4DlN9N2zCGEiUMi78nU5t0fMzcUzv/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XwfEiuWZ; arc=fail smtp.client-ip=40.107.159.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XwfEiuWZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ur+2qPtwF9lVA009y/VLSjOwxv/CkQ4K3GGrBVOZWrRuVX8erwHFTDyqiIMQdV063FXpaC8IruYAssbwOBhY6iSXczzvHuNjOhC7MstAjZyP7V71ErTkTazAqEPQA/x5erxXewWOub10Ul3K4AlNlkNLIO4glTjlLtoF4DxOT2jZluyBl5LAraO9eZzj2sxbCytKH75h851npFZ3yXYcPhIrae0ZfXCAZsWJ7ih2MTWZnOcZIbO4QPE+mgE/2iJGPWqnARrsZb1+8iVoU5HFD34t/51twAqHr6xPrPrZ+8mlGqrNDPYPEiT2MYh7zFuDZyCRGvS9nZpVK98KneffTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCh5ssnZeaYQsobJzHQqIFO+ABNxsnYhHejrS9jmqec=;
 b=dHzbJEz7p4iYIym6zN9Y7g9L2CYUrKwCylqoPrx0Xh/3ktGPUcLykqETdRgzjqhFqGqZbUoQP6gblAtV5/WRlwPU+YAFKxtutaGV6Bi0XXRidtV0QGQ/kY/urXGjRxaD9De++Jw33RN0StCbB0JNxRnF1HrYU5dbg+6oWsCnCXIi388HRu76eLtPa50v5WsBdklWBQZMY28GJCnPA8fIMC098GhDP8RJ+R4PJ9cE8FRn70JL2y0qA/KvttCEf1h5MTpTDukxBJn1QItm9/WwO7YDV8Qk8gaXZ7UQZKZHeqEPz5vj7LVXkkgMeHVqh5aXrEAwP4L2UHAsuaHgcUiFBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCh5ssnZeaYQsobJzHQqIFO+ABNxsnYhHejrS9jmqec=;
 b=XwfEiuWZo3Areh1HMAsOaJJt/F5ejXU9yV4x7MuVmq+4CvLZFGNS/HKF3Rq3EL2ZWLIhO4TyHWH8PgLmxGLJx4eGll1Zej3bQZqOv0loRj/Q+i2gfUAwoKK2drfZ2SuvKypjHoGuMufCDfLeNKoZpOmj4Ib3zMdr4K26muMaXaIgw6n6DTY7/DMaru8NSjeQCZjSM26wyeZ8GUH/la5Te4T7Z4IVb+mq7jTeFWcnWo7n5FnR7dmNoRPh5IuEiNLNoy4lwxEJb5LAkqAwsqeLnXLJ91vY/tdK+hJODaa7+J0CCXKJo4ryUP+0kp+k7dJrMdBj9y9N+ISGt1P/s9iClQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11096.eurprd04.prod.outlook.com (2603:10a6:150:27b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 16:58:58 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 16:58:58 +0000
Date: Mon, 28 Sep 2026 11:58:49 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v7 19/24] dmaengine: ste_dma40: Fix logical channel
 bounds check
Message-ID: <arqcyWpTTSBgAXzv@SMW015318>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
 <20260927-dma40-fixes-v7-19-89f595e8851d@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927-dma40-fixes-v7-19-89f595e8851d@kernel.org>
X-ClientProxiedBy: PH8P220CA0035.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11096:EE_
X-MS-Office365-Filtering-Correlation-Id: c06605fe-285a-4787-adf7-08df1d81c973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|19092799006|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GWCDmISQ6FFWc2iP/0bxtTtZ+DliOX0wEmiXlHCO5xVFFVE/gksnS2vtkFnK0txE/AGXCJAzpxm9fD2ZAIcrrwcNvMamOb6Ib5VQFlsilvG4/q0A59BxvJVhydckrP9rDX0O2Iqei+b69hOKjrKWIQn3CFUFRgNNSimF32xSatkRQUIgESd/Mobt71xDm3FemsW07HqZsC5phl5boXVPIZfSqnm2jkFDFK/vTUthBNJh0ED9b/+ih38BQiapaM/T5eTjVmDoUcVVpP+ICi44fN13HMFUp3cOKXwIq6fMhfNPaIcaIYa+ChgaSsfdQ5I64TDscnAUQsvzT3I0owxEOQbYdQm+k03HRtPLwa2icPic+M35Gqdq8VKzKCN6lC01f2j2QujhoUTSKrJ3d0s0eGBzjitNaa3GkR4mM/lGi8Ry7JwDWTGksqnVKIBZJqjzY4CzLV+fKZA+0o489t7eMastsdvJbU8CFnq91MM+3tXoeH2qmNvMZSphUH8McyMT4rMHvF/85wB3WGFnIjB2kLlON/BYPaHc1hIXwpVFjgQTIavck3sCvIpkzTr393qTwqO+R1O8hwn3ncw1yTmE7TvLiroJu1Jwvj5DAqH1NGn1xRvnQVwhWZIaibjxsYpc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(19092799006)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cOWMX0TZeM0XuLGLLG8M7fK5P3ZKek0YvT2auF8I+DF4RJVwpRsMu2RBzZCP?=
 =?us-ascii?Q?fBGndBF7faNExo4UABJ/9SVQYEH/kQ1CcdeGk++LI2Tm6D6yuEhgeP5J+9Mn?=
 =?us-ascii?Q?aQY8wIYu073xZyz495EvghAD7NPCqjGlSaZugeCMwRlHuI3mrtJXsgmiHxUD?=
 =?us-ascii?Q?+vLkIlxYhZsJp2/wE4w2l668AD4mJG62oikGCXm172hKPAmgubQM+LEnLv5k?=
 =?us-ascii?Q?g73bwSgvH4RbnJWUFgbyTe2xa4fRP4NAlyGvKmIQhyK4Sj8AWnOzao6yv+zx?=
 =?us-ascii?Q?u+ekaZe2I9Y2Onu/Rw+DIdoSLCzYyephtcKPpLoRZ5cyo8gDVGyLC5YZ3ek6?=
 =?us-ascii?Q?HuYO2Lt9gFNTsebFcFC1SyRqsyQyTNiIuvUl1ATEXeJMZkZSmPNu907smdcZ?=
 =?us-ascii?Q?jwOqY7yXglwj7NmkZ4CscDHU1VrUXA3J/cKjyg34Ik/s+zp6H7fYs/kSHn4E?=
 =?us-ascii?Q?DH0/0Di65vzCyP2K2bRWovksX9a2aPPbHlWSUZOSaNTrCXKPE/vbDS6Njg0/?=
 =?us-ascii?Q?QYKyz4FUVdqLlWCACg50diEPtJz5cxrb+T4r98M0nSs9WJrhVB52Z2usbNkw?=
 =?us-ascii?Q?VEYO3oieDGEpAd6rmR+fEnOWvqrVK4azVToMYyYbzN+oucjkBSDe8JPNLN0r?=
 =?us-ascii?Q?k1Zun2SYe2EIwZ+5guA0s55o7asQGJcXdOePjLZbHTdc9jnAyQAdvK90e042?=
 =?us-ascii?Q?sXcgohTEZT7Q1mxAWi/cFsi3/PENkQ8WxygH4IfXKPN8Vq2PGg+1889PkHxr?=
 =?us-ascii?Q?vPU+WpVKZ/g1KwZPB49BosTrPj+DOojvAEtBDHsVxtdFABebPKHaXNz/Tox3?=
 =?us-ascii?Q?MeBcUmMF45ITxUYuOUT465yfbd+T7ReR+A/jOUYrf7Z2Y1kmURshgPHQ0Fv5?=
 =?us-ascii?Q?xI414X+iJ76gWNHaKbDuMHaJWwK6ivz64lmUDTG0VDQ+m/qz2CtuqScnSRdr?=
 =?us-ascii?Q?XGN5lobs5lIxuurQEOAvPBcAh7OpDV+nXSkyPuZCeDMqHawq364obi0AF1KI?=
 =?us-ascii?Q?VG7VxxmeXalrKqCXlBdLYzA5QaR7LiYEy1DyuMwWlBpIZSlcRO8HGXGVXwOk?=
 =?us-ascii?Q?0qgPERRps0lQW3F0R52RNDrSQJAnyHGQnOQSqzpO4H0RoNVqZC2bF9wwO/vP?=
 =?us-ascii?Q?0Vva70TgZ8BqiGayMl/8bZLNZ3ijgX+r3Qx9EyI6LnW5pPJfXO7lhGzxq/24?=
 =?us-ascii?Q?0H0ms/7vgmn3uSucC1qAy+JBAlbBI6+gEYw7zILeBnbCir/FEuZ89CS5JANu?=
 =?us-ascii?Q?Owu/aACqIwEZVVHZRuJwEXxkWVS1G0FWdzmtxcTWA8QUP7haxBX0ugljeAAg?=
 =?us-ascii?Q?5oG632t4+50Df33rVD4QZecG38NWuKbPYNvQVVCSH4b0B6QEl4Dv+apvVZbG?=
 =?us-ascii?Q?Gynm3n6yx1g9ajEyKJawo3Z6IUFwj3nBwcbvMD9HysEH4Gg4qtozohYiXxQU?=
 =?us-ascii?Q?2lhRIcHCDE3z9F4M+Hhf43YVeXHajEXl721ySTI7eiDKR8t0ZNqKllLXFfU3?=
 =?us-ascii?Q?tJYjSB47OexDtrf7u0gROoCw0aNI+/WTr3PFcJrZnm17O/EZGxSP9a6Vd5fM?=
 =?us-ascii?Q?LEFRTfzc6VHe+W19DEmOnEzco7pokROoeStjFn4VUPkNn0F3Q+FLZfKYdQka?=
 =?us-ascii?Q?qYlB7lSBqdQJnuw3AAnCFvrbW3f0zsprAZL0kE9fHworsfL4KEIMPg/niJ1I?=
 =?us-ascii?Q?BJjUEt9cp7nzgqoMBLXxt07E3rJqKSihLv2uZgA6bsoqgBes+KEU7Coskrap?=
 =?us-ascii?Q?6NDZDnoIGompbCUeso9KSWANdmRsfQUIoq0vW4mVDJAKSC7gWxnK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c06605fe-285a-4787-adf7-08df1d81c973
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:58:58.1148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVu/Hkqb9gamwOtt86L+zqUvEftEeWFeXI3kZpHY3+qqX8SlDWo3ptidT8QZQSb9z+/cPi6R+/wJZkvQz/8v18zKvjH7oYmviUpF3Bg1aWvQY3wgFVeQBEcXiGHRudLO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11096

On Sun, Sep 27, 2026 at 11:03:32AM +0200, Linus Walleij wrote:
> d40_validate_conf() checks the raw dev_type against num_log_chans,
> but d40_allocate_channel() derives the lookup_log_chans index as either
> 2 * dev_type or 2 * dev_type + 1.
>
> Validate the dev_type against the derived logical channel index limit so
> channel allocation cannot write past lookup_log_chans.
>
> Fixes: 26955c07dcf3 ("dmaengine: ste_dma40: Amalgamate DMA source and destination channel numbers")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 1b1edcb72480..fcb074928675 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -1881,15 +1881,26 @@ static int d40_validate_conf(struct d40_chan *d40c,
>  {
>  	int res = 0;
>  	bool is_log = conf->mode == STEDMA40_MODE_LOGICAL;
> +	bool invalid_dev_type = conf->dev_type < 0;
>
>  	if (!conf->dir) {
>  		chan_err(d40c, "Invalid direction.\n");
>  		res = -EINVAL;
>  	}
>
> -	if ((is_log && conf->dev_type > d40c->base->num_log_chans)  ||
> -	    (!is_log && conf->dev_type > d40c->base->num_phy_chans) ||
> -	    (conf->dev_type < 0)) {
> +	if (!invalid_dev_type && is_log) {
> +		int max_dev_type;
> +
> +		if (conf->dir == DMA_DEV_TO_MEM)
> +			max_dev_type = DIV_ROUND_UP(d40c->base->num_log_chans, 2);
> +		else
> +			max_dev_type = d40c->base->num_log_chans / 2;
> +
> +		invalid_dev_type = conf->dev_type >= max_dev_type;
> +	}
> +
> +	if (invalid_dev_type ||
> +	    (!is_log && conf->dev_type > d40c->base->num_phy_chans)) {
>  		chan_err(d40c, "Invalid device type (%d)\n", conf->dev_type);
>  		res = -EINVAL;
>  	}
>
> --
> 2.55.0
>
