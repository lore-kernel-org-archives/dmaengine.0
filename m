Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013019.outbound.protection.outlook.com [40.107.162.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCAE2737F9;
	Mon, 28 Sep 2026 16:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613936; cv=fail; b=K3TSdz4Sl/mL+FrouCgvLMER54GzMB+HxjG0spSKolrB4EKZjVnh7+F9rcBEjmtr+6/jnTj9VQQTeAbP8bqNeuZ/3f6Y/0JhkV5O71R7ucp2Cxm72ebUBJDbxxDFZwnXKx2i1Pl/yhxzRWwYZzo+QabRAtSvbbKdPMnxnhg8eNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613936; c=relaxed/simple;
	bh=u/EyKTLLRB8uud6q/U3K3+jW9474MjsD4xCt8CbYZT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sj/qRFM93U+v/eBM1xN3aT5umCBY/0rRxg+OqJOgBfXfZdNT9CKPDNkTUzYNAyrJyq4ZO2AT4Z+UkLUB7hqijiE+a1u4iUJYpdldhRZS4+vvc4J4iBewV6+x1UnbUWgrpOtbVibBNzhfY6prd7cuk+TATmgEQQtf+J0+W1WZLX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DTnRMPed; arc=fail smtp.client-ip=40.107.162.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DTnRMPed"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+e+ghWfEJVl6cS+G60txWOu9/Br/zmpfcwKT3cZj2KK1Eb1NIknXDY3xDP7GMop0PJa6/kWov1g8aXZyu0KaZZ7SKVDV3dVg2LB9b4FdsuUMdMi2ZYzIzMmXAyovf0ksz8OLwHChdlq79eqL9YInOR+c8YEIrcGLfoba+28A3ASthT3qEADot4f2b6zTTwgGqMQ8Y+tO/7A4XbvViXNGwTUI9Dz+nsNgeStsxb1gsgzsoK5cPpRxPSbHHy4mJCupMxWnJUqP53OkFoKXgKNWvc0N0GILsK70vzvQZp42oKI8IfuynHy16Pqtedi5CgnvpgvlkoIkaMq/j+IlMw0pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9YYfwB/mXubYU6JQyI+Uhktf4MjCTgVwyS2I62ReBE=;
 b=Um36RqJq947vG9CAWczLr5o6ZzCnwv7KQpFRJZfhwActDAJSTWxOM/IRso9wDwqYcCZg8d2SjrlUf2txkpgEbmpFfEwKj2V5jPZCdLa0pxtXX3nwB3KQE9Ooa6Nm6n1Q27dR9py1J8+oUYaamBJ3CnVCzZUe7erqdjbiD/Zzkls+/4p0mCzelHoo/Raai1fQl0DFlUedNE5XH7++iS8wnzKImovCEnMhVG3tUohL0rFWAa2W9lEqOPbAZ7e6O2NzCYosjDNtEMfe9xZv4KhQXQF4eQYtHNxLc3APzO2iY9TfpbwpInJbkNu6mfTv0fQiTtS56qWdNQOFe3pzumoWuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9YYfwB/mXubYU6JQyI+Uhktf4MjCTgVwyS2I62ReBE=;
 b=DTnRMPedhHbDHQ0zUMqWfGA68Lyn7lpMQJZGp65Zr9GAtbSj/k27RavAzJbYrrA0DBXh6RVXirRg01lapECy9DATRiHAS8+XkNiNJR6JWM6LNYLj1vBQhkYF/G34JdkahlK7YbnQVzFFS9gNPNgj29VkqdjEqEA09k75cDakeFxjB30AxAJxfCO9Q5cQ0HL75tcmgNeQCgvZCN+KrioCnMzkpZmW5uN0vorCv4L6LOO93I/b9Us+Z8rAL5PLx7jBM+eu6wj3ysKq6nqsWucn1DRtRRspWjhaCq7qhrBG40m76uQmvo387ReWaxHjkjE5x/f5obWvSqbLnEtXZhCzwg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8452.eurprd04.prod.outlook.com (2603:10a6:20b:348::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 16:45:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 16:45:27 +0000
Date: Mon, 28 Sep 2026 11:45:19 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: fsl_raid: use !desc for NULL check
Message-ID: <arqZn04xRO3L4dxE@SMW015318>
References: <20260927205224.29640-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927205224.29640-1-rosenp@gmail.com>
X-ClientProxiedBy: CY5PR18CA0040.namprd18.prod.outlook.com
 (2603:10b6:930:13::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: 239ee9fb-9439-4f03-4599-08df1d7fe681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|19092799006|1800799024|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Vl5gvCmUSy51gtQ9CDgz39gXX7LzvDUkSNg7lO0veZlsDN3uP50tqAaZ0vdYXrD7y/qC1HVKif5y8D45A3UvJeHtw6GwsothEGhGNnIyfS4hpFe8lXvZf5yB6aI3dELrAUjFslYtxC/OxcDD+1mPaU/+GY2zvEfcvRNogRCGg1ybBW4XzUVmmmXBYvmXIKWXvodDmCE8Y6waL5Dl5CPIfpwe0YHjD3VBcyMy9H6G0JTJl4hIViB0hWhs1N360f28mPBnjQSY/84pue0NY3MVmh7bWwTUEWc1dx1BJfQOfNDADxW/CwPFFFsZmXbmWYIm4Kk7O0ploPgErF8CrtlpnYzs0XLgQDyd072DQ1R2yJdtY54zQ9ZzXT4ibFucEDJjFEdEg45rd7/qUQd9HnLICP3fkjxpXX94+9WwV88Z9XmX2qB9OSn8pVYFI3wiJtzu6ImaeVNjHK/2TP22HadaJXq3+7xvMsXq+z3GlGqQOvbjPIKgTpwzZh/BHshowF+29rs6138msOLvTzAMYS+LNWNRCm4Wq7v/+J12jpxwM2JkeVn+NVPd/fWZbMzhhATvBwG7Xip1FhX7gwsXxVZESrluq9pvvi6tkPlv9nnL9rsiO63kKZOXIrgHAPs3jtLRGLU8c/xwxd4TjmTI6ph9rYQ+kjMWwb39hMAwgEAgDT8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(19092799006)(1800799024)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QtHQNznxbd/DVOQ3EGVxkzpF5fNr/pbCx7SGLb0m9ewlj2z2VTF2qGv61pkr?=
 =?us-ascii?Q?+g/DcJ7s04v8mmbU4cSYOvIk25E9LTk1pYj+I8Io7alnLuqWJsHevpOd+50o?=
 =?us-ascii?Q?XOqAnPWl+rJBVbuGw7jwAb0xJmtHVyA1vbGzuhYNG/LItZS6cVXuO287GCyn?=
 =?us-ascii?Q?uJQK2vfqmLHKaxAe/aPGoR3JUEc0hUUpbPT6sVvUIbRR1lLYOsDooO3KuGnH?=
 =?us-ascii?Q?Cm809hqeC/Hu1d9LrTnHukQlwttsN9qW1F1KajX48cDQR/4yoxvTPaQZkElC?=
 =?us-ascii?Q?7xmemFKX2z8n0J4KFRVUYPmHe4TPRjnxsYiTPqU82Z/AjXczQdk6dmG94EC/?=
 =?us-ascii?Q?8MzjkRrjhDFzJgATN63lCA3/sS4lDH6Fq9BxV+YrKIU/NZ94u5z9BnS8YV/7?=
 =?us-ascii?Q?tM5NE2pojoDfD+/S9U5z5dO8JrZod1mu1uvod/FRdD+P6UujYGEDUK8i+F2X?=
 =?us-ascii?Q?bBTA4iX4MPgnLQLK53u5k+BOtoBj5k7dGmXvcpk4uLZ13F00c3X144WPRF0v?=
 =?us-ascii?Q?Z3lmLGo4kBb8SHSBdZuVzyHXwv7dB5WgIbjO3PylEIZXP2qG+eh/OazQDKQC?=
 =?us-ascii?Q?Q33PW2imYhIfjoZbc7UygIJhnDxsVvz+iQN5hO6GodOW95PA8qCEytUfAMhY?=
 =?us-ascii?Q?3PiCGFt3rYCEUv6wNVidkuVBhXS24mX06/bZhWqPVxzJx8tBXIGoO0qMywNS?=
 =?us-ascii?Q?WaixLpjhgNTF8W/PZaMM36hp/Q3+fFWcUL7z4dGRllgU6AgFfkftIspQmk6v?=
 =?us-ascii?Q?r/sLQT8OZj1H8mL5iC+oS/l8WC702Jk32up72xDoppBjXJ50PfurkA7xOLdw?=
 =?us-ascii?Q?/TH0yp43Av7l7VFGs6f/enhUQ6WOJdE2dpMEQ1dh8N5prHLEwXHEbKcSA5n1?=
 =?us-ascii?Q?rJ7NGRNITfXFx5Q0cAz8C6IW2R6WI26TMtSbRpoK3CS++/BdTrhOPGPpWJUI?=
 =?us-ascii?Q?NwLL/A5HqgxrtyLDn0dMJF8BZrSApbQ6vMGJixNajk8cq5O0/rD+xJE0B4u6?=
 =?us-ascii?Q?uheHRN1YkCM6fJeWV2eitqMbhf06enJtBDT4oZ/EmdjrCmMmYeXzCW4+bGQG?=
 =?us-ascii?Q?bDC5Xu9sgpbyPaD4AREl3i5E8wclqAUR7wVuB/SCc8MLzCu3/VbfSZI4980i?=
 =?us-ascii?Q?1z3ee1N5c+xxMHgTo9Zt6KIHWWtWkcTD43HoloVwWPLNZ80qobDiD8jtN570?=
 =?us-ascii?Q?H2UBXUKoQMrSKJaIiqumGiiaW34ywoo1YY+3u0ykTys/7ikgkqyGitI6yrqm?=
 =?us-ascii?Q?57E5EkIYthuDLCTZpfqCHjmCS5mKMMM8UHZepuzcLmr6kf5WGSHekKKH6dq6?=
 =?us-ascii?Q?AXNAl7g1Z14xRah6gZaJFohdUPDf85i0vuuFC5hkNVkyNdisBZQJw/o5POcz?=
 =?us-ascii?Q?MYQIpxNJd9zbSeQLOx0FIxVuC8C8DL54rceLwBJqXtvfZoD/YwA7Ft/72Xeo?=
 =?us-ascii?Q?saTu16q71meZu6qyHfHxiJwjuKWNDuPaeD0/J8DgaZ32sq+Jf+ipeFUcFZi0?=
 =?us-ascii?Q?WnhkJCFeQXLCV9TIaD7DYhveREDvE9jwd6e1OzZ+1HeWIRm7mSVbwDoKMkdc?=
 =?us-ascii?Q?I1LclghdIjWAzV5EEIL6n+BZV9KDIrtcM0OO+hTVlb5OJqibNEZ/zMKhna5H?=
 =?us-ascii?Q?aWcPWt6DOh0+8vcXQC/yLStoQwZG2L3rPS13fhL3ew4wmDFzofF8R2YmdIo2?=
 =?us-ascii?Q?Zimn/I7/wccyTikhNLLenH1OQwxrlYe2vd8fnAq7iQTYamFtfL0Xlo4o+2I2?=
 =?us-ascii?Q?uckruJJU2C7Dzudm2pTpLAF33szGKgpjnuwk5tQ+ORs/z1x6AjtL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 239ee9fb-9439-4f03-4599-08df1d7fe681
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:45:27.8331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gn9hTPEF/7QU7K8ddHL41iqTcJM0WdQtRXS6nz9ysWBB00QAq+3vhzf6TUYU8/vJzDDTpAvzlvBO+vEr2AUz4i97laraqzqpNbVxXT1f27CK7Kz7SyIzdO1mR+3PAxJR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8452

On Sun, Sep 27, 2026 at 01:52:24PM -0700, Rosen Penev wrote:
> <= 0 is flagged by sparse as being used for integer, not pointer
> comparison. Fix the warning.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/fsl_raid.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 9cc289f7129e..8e7026682d0a 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -346,7 +346,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_genq(
>  	}
>
>  	desc = fsl_re_chan_alloc_desc(re_chan, flags);
> -	if (desc <= 0)
> +	if (!desc)
>  		return NULL;
>
>  	if (scf && (flags & DMA_PREP_CONTINUE)) {
> @@ -470,7 +470,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_pq(
>  		src_cnt += 3;
>
>  	desc = fsl_re_chan_alloc_desc(re_chan, flags);
> -	if (desc <= 0)
> +	if (!desc)
>  		return NULL;
>
>  	/* Filling GenQQ CDB */
> @@ -554,7 +554,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_memcpy(
>  	}
>
>  	desc = fsl_re_chan_alloc_desc(re_chan, flags);
> -	if (desc <= 0)
> +	if (!desc)
>  		return NULL;
>
>  	/* Filling move CDB */
> --
> 2.55.0
>
