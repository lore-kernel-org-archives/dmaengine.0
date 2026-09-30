Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013002.outbound.protection.outlook.com [52.101.72.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5AE511E80;
	Wed, 30 Sep 2026 20:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790801025; cv=fail; b=V4REEwne1zE7VthwGHPsdwxeTpTLyYh/Yjy6wy40EIdzroq5UDXajzwVNb7qLExckBBLTZH6FoIaFmDbKnJKIPGXJpx6H5Xb5BPWmZOGTXdExf8cVjSjTKn/4DnBaI6HwiglOTQS3zrX7+EHQV6SL8zksK+Pgfxzaiz2MYKIZEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790801025; c=relaxed/simple;
	bh=MWO6hWKDxgR7O64Dx25xGW2zoKMnSJj9BYFy6nUh9m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KCPr+Z6rWxqUQTcNY1V2tNvZ/QtNClP8qe2UoKEQ09UwAEvercolALrO6GcOm8lBRSbWEj7fzwiO2KjT30zAC7MLHjicmtKFNKURpwlNlP+yxDjWSwHvjXAy//EdWmxMzBH7bdm82mrdomPHWEL68kUCa2HIF3YQMabfrR9Dv0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=L4vIIANg; arc=fail smtp.client-ip=52.101.72.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="L4vIIANg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5y0gDXsWDkdcSrpB7a/TLfhHsjCs41Dspw9Z8SCdCS8I7X0+dNez04UVcmyNNJQWmAF7PyBdHCnBYGI7YZv/gDXPY6+0jbRAE6P+OPd0R9lEGbSeARuIB87w4iJ5KqN5CcGkTycxM0EZqj/0eM0g0Alxtc053mUF7oaaX6zsYxGwY4RVJhwD9yy72riRi+PJjXsKNTZ17lCC9lDBKz+uNNNCEbLo/yLHriCLBnPhPCK5+RTr6+kFf1Dq086OVQXb5Z3PNf5OnqHyIykw2DCyUY7H7cH7YRNltM67IheGeFpJxFmheX3ibHe0C42tdhgD4gf8wtkWC+AJdenTP38lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yY8CK2fvYrZ6RX+g6xJSGJqv7hsfrvxDt5deOCSs9n0=;
 b=S0gDnXc1w/yIMGmerJaQ9le3wn4X/sTect7FaP1OevJPeVrP+MT2HwWJ92ou6fQDT9RtVkLUn11FkTaqhwOLRRIuciR1FsQIwYcNOnjDKGCXSJXFzLslv35jCfaRYxYkiItEw2J7GOZkVKuVcFwEii2vhEZ3y6DEhzOhWuKQauFxsvSI/Z4qkk8GhxNlVSgxCEyUupggM8JAukwAgrnjmKDYf+OTN6PVj8e55kIH+QXdKSD1IF+rU6SvxTgdyfjD4dyGPoNJKASs7vGPDlmX1lJ+eUcmiPIAOP0/MbVx/jlAXGk51ZRdz6/RA9zURTItfV79UUpFVoYDZK+m6ASC6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yY8CK2fvYrZ6RX+g6xJSGJqv7hsfrvxDt5deOCSs9n0=;
 b=L4vIIANgZLTQIzlfYfafvEgXVnuVecSXlolm4RQClPBK21X1Y0UXZBXqgbtOsT3XJ85tsJQUBlL8MFZLzL/59pywZl+IfqitZHzCYoBpNJzRha5zraqD7kjRuv9TxgU/PuU0XFIs4jHK37oYXrJtX4r0nwmOqsAqdgugXc9DJJVZQCzHH9WdD+M50qbvFX2WqezlE7zR41jbyVTl2D1kezd8VRTBz5GBcH7Cczcv/hY2rJeMT6pg8fGCH4Z3C7oPqb8YOKxwbY49AeyzUpbYc617MGgKS8q0jzx+bMVA0Ba2C+opO/itmRluPyavMf5R0PIJQnu3cgG74nu9s4YiMg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA6PR04MB11716.eurprd04.prod.outlook.com (2603:10a6:102:520::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 20:43:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 20:43:38 +0000
Date: Wed, 30 Sep 2026 16:43:30 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Dan Williams <djbw@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	"moderated list:MICROCHIP AT91 DMA DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: at_hdmac: fix memory leak in atc_prep_slave_sg
Message-ID: <ar10cvJ5DF4uvtAV@lizhi-Precision-Tower-5810>
References: <20260723050402.272606-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723050402.272606-1-rosenp@gmail.com>
X-ClientProxiedBy: CYXPR02CA0071.namprd02.prod.outlook.com
 (2603:10b6:930:cd::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA6PR04MB11716:EE_
X-MS-Office365-Filtering-Correlation-Id: 1979c138-826d-4ce1-9ac0-08df1f338180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|376014|1800799024|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	IIEoQj7h9jn22zeLhdNyIDbjEcahIMvcrkYpRDoMaRTTpI7mOWG8wytUgaX+JuxGcGUNEYU9srXwV18EFD4CHvzsk2zjbm/IcZfjFoawD4+L8VoIo8TXnA1iPYvzfw+3EfP9sHQvRUudk3iKrTQxgQfW91Ky9zIWi9Aw603Mx2iUfRqeKx8z6hJ1A/JbdGk0NxTrAu96BofjyJoEsjisf6ONfW2S+4jGnbeajqmPrZzyKyMR+qdjPwdHWBWNhcsevRSg+BCfKOgH9BRV/yKz4XN+y3h5mYi8jW7KTVkGG3Kee/lgj7+m9xglMyiByRNQUlHeCHdGT7kjoHQe5b1tR0pyfflLoWwO8Byqsy8+8dJRSB4zvUtxGlbDWsYbz4BhbqshjVKD0XEcYnOz0cw/A8BOqi6acLUOlLgZy3IamN1vO/1M3B/Z9o7dxUdWloWlAns1uV0L3u5xzFLMv6AUl4NtAtWa7WTIR8jpSyWQ9H2fqGeC3b7DUPhuUbqKUcHSWDM0jJTH8k53dN/Ve6sMDFP84lwbPoG4ZKXoNMvszDm03qaJIsvhU2gT+Bnv8H+yS1bNYnucUtmeVUrlUocTWBzmvltdAtMZ5yVGeiM5+OxZEqe8fL9I/7zw1Lj7Y5NL/6+CnPWfDG+1xLmeP8pqpOo3PgvyxWbIXGQ41V1VakE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W5yCxDb/sfvp9BiGthqz0QTJkHHYNwXCdvK0ciFGq3qTG/mBRJG6iF5YaUX7?=
 =?us-ascii?Q?8Gy+AGa28jzhIiLWYpzRuHzaZHwfaeNZ+baadwNyCivE7B40dHs9IVV1IqJ2?=
 =?us-ascii?Q?IwH4FyuzpsV8Zvt31I8LWn06QZfVX6co4mv+pnAibgV//gS0lbe721XnJUma?=
 =?us-ascii?Q?nn60M4LgRTRvRf/A0sLcZ/ZFcZKiguu0KvPvWu7wMQCSYdpouSI5wwFk2Y7S?=
 =?us-ascii?Q?ZxmdaTvXfkG/XWO9B1OsMQBnrEZ82yt7WDuuqRp6L8cIUJo17TNroQmiSaxo?=
 =?us-ascii?Q?F62GJejCNCahgSSuI86utBoJIlHUd/VVHqVo5TKwPtt8isjdXf68SIseGd68?=
 =?us-ascii?Q?2BLtpUpb7OsSkfSqEHm4b2wKSPPv6AZ1HIDg0eHASPx+VlovgeoS1kvgeb+m?=
 =?us-ascii?Q?3+ae4R5JY0QX0HoAPzNKZrTwKsXu8gAwIqm4dr8USs4oWIb3LOu/7/nejWuY?=
 =?us-ascii?Q?mgcugsl3Drq7KfmG4Q46lxQ56QEBpIBbHzYzsvboSnKKCiCLFBiB6s7OQinx?=
 =?us-ascii?Q?kKlamwwaRnz1R5nCUonAtKTPjPpRTDvEBSWje5lhEVMQ8uCp/diMOeJCbAdR?=
 =?us-ascii?Q?vMmGCkOfkxDvGsco+bFTQ6hf8cGuky7odTzxNPW7fTOPa8Kk1rKcGT0p4BJ1?=
 =?us-ascii?Q?8kG1ObFhin+nyKeuhGtZuhUzrITJmZSHudTUWIHObks7dk6dHFuTrcmvv8b2?=
 =?us-ascii?Q?FPNoM5uOdamZvkrKqe+enjy9nNblFJBygTYKcrNt8n59/CT9sWoiCbe8Hz1R?=
 =?us-ascii?Q?ndYy6X/r18Rb69AUKR+40Hj9eAKOPMNGvMehU8uKnqsicDIwB5hqi+Xv5Jtd?=
 =?us-ascii?Q?GQL/Cw/iAE82es88VWNXSMqijw7zjBENH5EcMriZyI+sRG3ygxP75Uso9dUa?=
 =?us-ascii?Q?UVedV4FaryJqP7Gh0jzYwQM4ogRl2Hig2wc0oPhqn4sgvcr/zfcM2AGpnqLb?=
 =?us-ascii?Q?yTLciDOrGC/4yHnnv5j+QBjW2sA6/Lg576uWR+dpp5P6ee5edP9ITSP3uBAu?=
 =?us-ascii?Q?LvuKp181AWpxt5hS4wYC8hwfOOZIJxVq+KN1rOn02PUMZi9o2Ab5SSwfb7oY?=
 =?us-ascii?Q?DPj6+WY2PMGLzQSwIeLxDDN/EJZcyeo0ctsQY7+q1JYcJdaZKLE498FTn5Ai?=
 =?us-ascii?Q?uHyvVf1IY+D3FPU9N7odNblXgv10ohvVjzytlJSJmFKUDT4zAvsw+gUPYTEt?=
 =?us-ascii?Q?7dijQf96oIVPKRJkUTykcT2o9O8DSSoE0v2l0Bh2+nCq7aNZxvf+qVOEW7bP?=
 =?us-ascii?Q?9HxxkSJ/V2KsZuYVmKb1yH9BVWV1NIoOPPdCOMmGk6DDsJ3jQI3bE9F0LEBV?=
 =?us-ascii?Q?GKwWvJBhC2+NDB1awIUrmq97OxZb7mQym55YOlEj7gb7aKBr16keYa8QVNdo?=
 =?us-ascii?Q?aEKA4gh+k4xwe2v9X7cYQ21TPdneuClwbfqeSoBTztxULokD1KZFGuNIyOJk?=
 =?us-ascii?Q?ebtvncRIQx38HczP6Y76vupyFra/W5oI9iptMcZvunzYO6UsXiAtG9u69Uqa?=
 =?us-ascii?Q?HLkqcLnw0wjXg1efttJ6AsvjFGNpDiLLxVsv2rkfURLovoeDoelwjv+wwEGh?=
 =?us-ascii?Q?w/mBwFBP+hCgGzFX13k/s/ZIrb/LEEoogDfOLD8AWgSh5viT+Wy/j6MxbYqm?=
 =?us-ascii?Q?L/U1ApyRiPHU/r37JXq4y8e5JivXSrRU3ywZ4/tZZNjE/aQJUsJi4Y+TJ5JA?=
 =?us-ascii?Q?92ofYrO8Ry1YAkpb1M0U5/xLqhdnCymeZMtWoP3cMOYLdAHm5uU1VwqqQVSP?=
 =?us-ascii?Q?Sn5NED36DP1gZklTjtuRssm+6STn0nzcAsrjGCaA9J139heWOQHe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1979c138-826d-4ce1-9ac0-08df1f338180
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 20:43:38.8524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2P3uHX+Ys8nMIxACXgYf0rlKLShLHooEv1TwnijzwIYgsfrMxQ8ZCfSgLExJAN9TCZx2jwcl2BjqnT4RhrFLBzKHMTnQ+L4Bl1oAz/xd3MWJhyOsORLZtQkYE5kRyDft
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11716

On Wed, Jul 22, 2026 at 10:04:02PM -0700, Rosen Penev wrote:
> The default case in the direction switch returns NULL without freeing
> the descriptor allocated earlier via kzalloc_flex(). Add the missing
> kfree(desc) before returning.
>
> Fixes: 808347f6a317 ("dmaengine: at_hdmac: add DMA slave transfers")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/at_hdmac.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index f9c336630fa2..c06f70dbc4c5 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c
> @@ -1381,6 +1381,7 @@ atc_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
>  		}
>  		break;
>  	default:
> +		kfree(desc);
>  		return NULL;
>  	}
>
> --
> 2.55.0
>
