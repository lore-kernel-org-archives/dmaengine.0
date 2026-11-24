Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795548858;
	b=2UxkJ81mXXhREOfeoVrQbigGFBsqJQz/5cFeNaYxisHR49cSV3ntqEtvAmmpkGcOWrCD
	 nImo0G28n/hck9hYWUgltrPzWMrunOphzWuAh0bmdRlZqXo0sZqobZoWR3IboW8u4/ueD
	 y8JNUsMqVGGkIf4YxaD+UPdmvA3quyFAzT0FggPPPwlR2z+iLOOGYlvvY6Q3wGwRzIE1v
	 WuUD3vxgAi3WJxEKdsXf85jMVJ8QhuR/EEG5wipSVNusERz0F5XM0PjqGfaNe2JVGssQE
	 houjlJKHqlHivw2DRdXGIgjIFFxKQTbJKkmauuvu1FXmwbanRcEDpsdwfVumep/7W4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795548858;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=a4+XPlAsWtwLNGycx/wmLMsKAEZJztTlCuzn4AaQPGg=;
	b=1tBZ/rIUQ6UDoZ7J6IraOrAcydhp8geI+kboRUag+GGAOh6uXOjhiDyBNnfSSZgFuTxU
	 1yNx25iJ6kzohFcRLFqqNOo3BQkTpx/4FVd3lBCHq5DzfSw63mOIl857vXE9ws5uq27vk
	 Rr7CTAue8b2Je47FZGgTMQ2P4ev6GXxLVFifqkSyb9ezAfikAaz9XDMihhbvcTbXS1MAP
	 h4BWc0CR+jOACI2PoqysYPCqvGgFrT5UUCeRA/F689Ab4ScYV4zPP3RD+MICHvgiXkh4J
	 8wrOgIMCGzfHDJa28k9Lmjzw2v4BCA8PxXSCMUWN4BewgEVdO1N1Sh/3BgB4i+D1yHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=cJm78fmr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.0
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013000.outbound.protection.outlook.com [40.107.162.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9050E606A31E;
	Tue, 24 Nov 2026 19:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9050E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=cJm78fmr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBiBlN6oxge8RlhmLqlD0f1OKWd1wtljXzHzYnUv4MASLa67uJ1/vIsufmNdPSGucuSQpldo1aoAxZcdAfDYrxXkuOeUmzldcNBKA0Vj7MvdUtor9KLoTAhnyVlQ8My7UGMhd7FZQNPBRBq+0RmfWeDxYoVY34qf6FFHu2Y6yTMz42p0zAraS7Cy9dpH0qt5DuL/T+xwQEXQ/zD5M6oTeS1yXweHj62mreYlG+BCSxnBwd/edyiT4XXc6wGb0on3CMv4LXTSoNU3jP0Si1HBuG4Wo88Rgtwq3Xnuo3WFftvEHMo40EzO6F555uJ6k7W9BJJqU3mQNZMrpKci5iORZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4+XPlAsWtwLNGycx/wmLMsKAEZJztTlCuzn4AaQPGg=;
 b=eOvRjHSPnrYOJeiG2z+wZAa6zCWjaE7BNrclAPdycWJL4IdZTOogLk51hOb3JW9YoxR8HjXMtM84uCqQzyUnEVXxh/yfzcqMUgYSe/wSiebKfTltAs7cEzbnt7bcRBCwCX5y4kj3bd69na22Eg/lOJjg1Ry9Wl4cq3SCEjXvHBKj8EhmwsSP+s7zMsVgDe5uqn1ntJmuvCddB1A8lA8WGhwSFAgsdol6VqqDBFbGrSwrFMhDbxBBiXaYr/3F+88mHgc3RskIAuS/RsTB+FbSaHVBr9iCkD4FE5c0gRn3IiMN4I233AxyRdT+3Fk1URoey+ptilu65fwlgsMtpjkyQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4+XPlAsWtwLNGycx/wmLMsKAEZJztTlCuzn4AaQPGg=;
 b=cJm78fmr/pUODsjgfDj6mqCtOuYAjfACasVhdYG/sssAVUepKwGW7M5aQJNawy65yIVqBqkjHtbtzHJCqI+RV1Vxf98o+HHBPmM4+Tm4IoRWRXZRsGYpj8jWs7+zlEKN3bmiHt44YSr8Rz9SN0YSdIThy2p2PLyLn/OhIYkmcRQojhQwiE84vqMreK1yTmPeYkSq/3L0Ra5Dei1lNOpNHRi01GTXkmFUm04by1WXbla9zi224LCN49xXYxwK37gYq2dndvaUBd7yLBCT60FJFxCNXNojlkRsoXCCza7dFchT9cnqZNsHlg9ljWsz5fZpvYNWATWfJCxaTNcPErU5FA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS4PR04MB9363.eurprd04.prod.outlook.com (2603:10a6:20b:4e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 19:34:13 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Tue, 24 Nov 2026
 19:34:13 +0000
Date: Tue, 24 Nov 2026 14:34:06 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/28] dmaengine: bcm2835: Fixes for dma_abort
Message-ID: <awXmrhJ4HToyCxOD@lizhi-Precision-Tower-5810>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-6-andrea.porta@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123145728.29082-6-andrea.porta@suse.com>
X-ClientProxiedBy: CPBP307CA0005.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:1::8)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS4PR04MB9363:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f4bb637-b7df-4e0a-470c-08df4a61ebb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|376014|23010399003|1800799024|18002099003|22082099003|6133799003|56012099006|11063799006|4143699003|261102123227099003|261026140227099003|261009223027099003|261022105027099003|261026121527099003|261021123027099003|261028144727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	JF5ky2EV5AEFAo3ZYN5lBH0xZrQDCcPF5oaRuAKoeig73IqsttxjcbSQVnHWNPBcYGd+XGpZeKGoNcb/RiHoXcdkcQY88dN+Zi2uvkymodCmrLGRMLnBDVoY3qHoy2RByqpoyPNz7gnNasnq4ddtd5C7UQ5zvHxN5dN26+fBkbzVBq60oMp/JWiGtV0EZ+lr8voMmGxks/A0dJ9a78/8GEjzPZ6j4RHZbaCL9ueG8j/99beorKIIcIG/BTPadfXv8NyskkYeCSD4+G1LYvA81+R8Md5nonVSK37M7kaksG1KL3z8SNyuqq2zHfGIpvF9iU3Wm71h8W8O8JXRY+8e8II0oYyt2wYJNTrEpBpdYyBKX7U5cvweuXUPlVFsUEv+LJynuiUp2LlbXb+rICTsGUwPqw5FF2PFFZCAdK/ro1oaWjav44/8whya6cruhWX7mEsp2f52ZKPb/Za2e5MhQ7kOB1xrv0HrOARQ212pAv3RwGMdEePTFl88saZctUggwmk25N/fOGsQEaNP6PUiXSbQXJTCEPgHmu73mgEFu1DWiwZLYKfYf+XZ4GWcmVDdTB5SqZLUJ/uNhw/eUusRM6dOWwciMMp6rvCK05HlpSzsmbtV3n559yXhnAo3BWcn/HcLecZFz8NGhG671DO2sDpLRxmUlypxGShRTzSS0ig=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006)(4143699003)(261102123227099003)(261026140227099003)(261009223027099003)(261022105027099003)(261026121527099003)(261021123027099003)(261028144727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ICZlBBbmnvcciCbCF/mIPXJFiKFtP0xaGtwyfyi0AyNXKsqy2oA4C6ahrqpg?=
 =?us-ascii?Q?AMMncsqrGnvPfO9XfkArXd0u/sXoUtPortYTKSYg+ZshIS9QaUhlLkBPO/sP?=
 =?us-ascii?Q?JbXfHt33pLlT2HoyiIwPJwfsLrwUQlnqRRdNlbLbOtYgDZalRLuhIPKDTyum?=
 =?us-ascii?Q?fAtqDVBwyLPz626ELbk570tRfrrpmL6vcaUNd1GHHkMsDks+rWvoYfZVT53X?=
 =?us-ascii?Q?RvYM+AqgAsVoIxiPC4MZi8gfSFJ/AT5/vVwzGDolR6Vd6QkCYUIlbLKqALLe?=
 =?us-ascii?Q?SIm4h+I8rB1pkDu5RYOK/fTaiKgBVqNZS5X/3gpZ975LULAthWN/pUNuXJh7?=
 =?us-ascii?Q?FrJD44VDCCgL2gtv9BoY9ytLFkViPy5jTALK70wYzku7PGpddSEaZTmyOGSJ?=
 =?us-ascii?Q?4V0R0GjiiCT/88lDay0VnxLhRz6XZ5UphU9Ty7HZahYF/9CVFa4dvDQFJTqp?=
 =?us-ascii?Q?KaYuRq5iYCVUGCfhsXw7huhbVRMZ1UZISx+6q/in0pyWg1fYTYtE0B0NMbx5?=
 =?us-ascii?Q?C1+Bn+M4P4lUA1oZtWnPf9rX6Yx8PGCrOgKTbX78O3/prnyZkM1r5v6Jp0Dy?=
 =?us-ascii?Q?jXHZSRw9+xzBsgxPp/L3H7KkPdD58kbulm06lrPO+8Mbo7ZhfstXiGAbkA7F?=
 =?us-ascii?Q?edj4eQDTXyeM8+1QEcM32dTtJNmz3edK6+4v6vNhPrFbT5vEVuSo3KH9jIjg?=
 =?us-ascii?Q?Qfrsuy6+O8anTfrRJxBgbUQn3/y7/dfxX31U/stBmOBTZcu9BcC6BFrV8hLl?=
 =?us-ascii?Q?Yqbig7V2Ygm+bIkPWfrGZ5EtqndQnZ9VUbovwi+IypYboAXJUoewy5/vAJy9?=
 =?us-ascii?Q?dIYIwr0ZIXsNDwcpaRr1hY3SVanh0KX28v24qXH1CFaE4AWAtC0zo0xoTpAO?=
 =?us-ascii?Q?4Q6n0wv5iRzOLV5/BpWx7EvNXoO3UoaNNyinda+pspQw+v/LORlq9LxbkgH/?=
 =?us-ascii?Q?h7sHptvQDNo1HeWVbbSp6TqDByXk/tUGb5sw8AId9l0yBNSwzOM58tmASO5S?=
 =?us-ascii?Q?cRV84JAbjDpj5TVJpC5VeGJkici0eha4O6qKOzTQWS9//kaFJzrrGQKpFTJ9?=
 =?us-ascii?Q?+BaxjrSZ+b7T8htZhPRESUjFrkcH+6AFOTPGk0tOjbfU00LYc127HiGZ8Lpw?=
 =?us-ascii?Q?lOMRkiIgq83L+Mkb9wLoGYq8/L8z1++55AsblJ5u01aqo1XbELjpnsUJPQiw?=
 =?us-ascii?Q?X0nSZFV+6ejqUpXIahCFqefDU07evV4vEu+JWOxpXqj1WPS9cSr1zEJszbIj?=
 =?us-ascii?Q?s6McJ+NjXvmvwjNdD9goBrlq4r0M8722dqVE1dDH0YUtTtgnAUfWAfKZeHD+?=
 =?us-ascii?Q?mdZ+Y+NVsBb/ZxmHzAGsCVzAqp/sdUhu0ztdQaZJT8vhMyTEt5PHVa7joYGb?=
 =?us-ascii?Q?75SUfEW1/JEJEa25U4D34uzyXgEHv/GFc17+lZPU3bERHWPlmvBlx2dHguj7?=
 =?us-ascii?Q?VzOBlXPb3iw22K2itfaMlGngJxlORaXnaI929iVi52UEjdD84A437p8wiwyR?=
 =?us-ascii?Q?06rPQy4Q0UYsKEz8ujGihra1dCvUsFqOpkP/hQ+oEv0vBpgwvgDkRTKNntDH?=
 =?us-ascii?Q?S20R4RYeKVOqtTiwE4diRPI3ZSMXISVPg8JBairXEZGFyCMRdC9Yl3qvB0Ef?=
 =?us-ascii?Q?7sOifI+20ZWVFM9yazRlkjkfH6yB4VhaVi9BSdgj7zCpa6eTjKT8ZJJQHUt8?=
 =?us-ascii?Q?Sf0UczlbSkR0UmA3H/2oIauPUcW6AgSCYMy+g3RYjv1Re3olLNi6OACOkvaK?=
 =?us-ascii?Q?0qjrYKy/AJcfEYe6A9GN2eTNtOh+Mg95cnZdudVyH37gxRCbu8Fp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4bb637-b7df-4e0a-470c-08df4a61ebb1
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 19:34:13.7106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRWlKIpUDKn5UJpspmWzdAEfqOvWPTJi0ZDGbok/TnDweAGeI7rIJIJoeJOpV5EmJrMbQBgOGBRU2/V3P2Omq5OkaMH8aF0XzzxVY9k+olrT/t6Xv+YU04EQ5gtRkBY2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9363

On Mon, Nov 23, 2026 at 03:56:43PM +0100, Andrea della Porta wrote:
> From: Dom Cobley <popcornmix@gmail.com>
>
> There is a problem with the current abort scheme
> when dma is blocked on a DREQ which prevents halting.
>
> This is triggered by SPI driver which aborts dma
> in this state and so leads to a halt timeout.
>
> We attempt to abort the channel, which will work
> if there is no blocked DREQ.

use imperative mood descript the problem

>
> It it times out, we can assume there is no AXI
> transfer in progress and reset anyway.
>
> The length of the timeout is observed at ~20us.

wrap at 75 char

>
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  drivers/dma/bcm2835-dma.c | 32 +++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index 063e1b2aabe3..51e3a40dbaec 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -419,7 +419,7 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
>  static void bcm2835_dma_abort(struct bcm2835_chan *c)
>  {
>  	void __iomem *chan_base = c->chan_base;
> -	long timeout = 10000;
> +	long timeout = 100;
>
>  	/*
>  	 * A zero control block address means the channel is idle.
> @@ -428,19 +428,33 @@ static void bcm2835_dma_abort(struct bcm2835_chan *c)
>  	if (!readl(chan_base + BCM2835_DMA_ADDR))
>  		return;
>
> -	/* Write 0 to the active bit - Pause the DMA */
> -	writel(0, chan_base + BCM2835_DMA_CS);
> +	/* We need to clear the next DMA block pending */
> +	writel(0, chan_base + BCM2835_DMA_NEXTCB);
> +
> +	/* Abort the DMA, which needs to be enabled to complete */
> +	writel(readl(chan_base + BCM2835_DMA_CS) | BCM2835_DMA_ABORT | BCM2835_DMA_ACTIVE,
> +	       chan_base + BCM2835_DMA_CS);
>
> -	/* Wait for any current AXI transfer to complete */
> -	while ((readl(chan_base + BCM2835_DMA_CS) &
> -		BCM2835_DMA_WAITING_FOR_WRITES) && --timeout)
> +	/* wait for DMA to be aborted */
> +	while ((readl(chan_base + BCM2835_DMA_CS) & BCM2835_DMA_ABORT) && --timeout)
>  		cpu_relax();

use read_poll_timeout()

Frank
>
> -	/* Peripheral might be stuck and fail to signal AXI write responses */
> -	if (!timeout)
> +	/* Write 0 to the active bit - Pause the DMA */
> +	writel(readl(chan_base + BCM2835_DMA_CS) & ~BCM2835_DMA_ACTIVE,
> +	       chan_base + BCM2835_DMA_CS);
> +
> +	/*
> +	 * Peripheral might be stuck and fail to complete
> +	 * This is expected when dreqs are enabled but not asserted
> +	 * so only report error in non dreq case
> +	 */
> +	if (!timeout && !(readl(chan_base + BCM2835_DMA_TI) &
> +	   (BCM2835_DMA_S_DREQ | BCM2835_DMA_D_DREQ)))
>  		dev_err(c->vc.chan.device->dev,
> -			"failed to complete outstanding writes\n");
> +			"failed to complete pause on dma %d (CS:%08x)\n", c->ch,
> +			readl(chan_base + BCM2835_DMA_CS));
>
> +	/* Set CS back to default state and reset the DMA */
>  	writel(BCM2835_DMA_RESET, chan_base + BCM2835_DMA_CS);
>  }
>
> --
> 2.51.0
>
