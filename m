Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793049268;
	b=0Bd5eI7OlGqzarh0OhN0vvqYk/OE3zRJY7Szjkj7/nVRMrRYC5DXMhsiKZKPCaWII2db
	 gVKNwHsenPBLt0Rr3wZi5ge+jLBKIfaBRxdr8epbsBM7R+VofwZPmY3PoYNKNH5E2wKdf
	 eEVekPgdEu6GPdGMOV8UVYU4GOMyy63YD7Dc5UznHqHLAPa7kYhPy4v1fhYl/YheDlF3e
	 kGn/WVDeOU46KshgOFZNLLmvZIrHMN156GvyEb7CtvKZ/FJ/yFLKPMgDRn4nTuoEDFVNJ
	 XaCfvq0yhQBlXexQUESrJjCtU9iFdRSNzHAm5gZXZWeGScKF3ihZ49Hr2AwVpTMu8wg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049268;
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
	bh=FVcFupJ3gCaVL3WbrcDhbaSxLIWmycak8xddDSnFPNY=;
	b=k1AZ3PpkfxBMt5feKBIoxqSNpKhV98D2gfW02J/UHqRP3jKLnGRvCROKT+FglQRvbBcf
	 coY8acAj3XvBZFTdLrByAbd4RxWOn5CC+RPv093Qitzcjxmojp/FNHCBdZASursPgihry
	 TY/zAV73JAE14TvQWbuYZrGCkkdiyTKfBeE6rAbyeZkLOSyD5aXPWafW3Y6kCayO2zu5b
	 BQ0Q3pTeNBFExrpssL193AVFz/x6MXMLbiZX+KkxO09woyZa1JNX8Mmp+1OjEjpdZtF0w
	 WWXmttriCJRzyELyMGDS15Cq0jhd3uFbyz4o8myRVLjXxZZtOkp/aP7974cZvbv6/IA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uTKTAuzz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.4
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013004.outbound.protection.outlook.com [52.101.83.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4489D606A324;
	Mon, 26 Oct 2026 21:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4489D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uTKTAuzz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jC7f5nMOdRgjmv6zB+Txwtw0+9/BPHF9zKqBgXGTGr0Mx5GWNhThV45xpBEjuolkEgu1gX0hFV/6Bvo6bXH+fERX7JXWZJgjCbAMGAvuJpf63JAgZ7fBJ9xA2V77eYmlS7Z1Q9y9SZPHfgpGZVyEsVam4ibzDOe6vuVbocw0MO2+wOAdCFjkBR/mY86Lq5k3f1TaTW255A82hfxujvIgBhMZa1n0x18W81h1TD6y/DhFAjBK4TfNNncvj+jOL+VHqClz5VB3gQHCgRYSFFc7QsMi6ggC/z/JxFBqKDKcAgMZ6Fz10AdzZYKgGdeWO2gLb3cz6AsNi9wFDVF2JBSpdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVcFupJ3gCaVL3WbrcDhbaSxLIWmycak8xddDSnFPNY=;
 b=nvGgQg/dr7q7YIl+mPnl1srKp8BNkUw8XoR6J77tzGTizYM/8BxAkf+575o/GbQiJU8dkjE50Kg1Ls+Wdh7fhzyr5WwetT+DXLPp8sjSMp09SYYD/k4np5wYzHhTwj3UlzT79ngdmw9r+pQBpGINtqRTOCq33ZPn6U4mt8x0gSxUqGoiHF0WH5QX2llOQbQpm/SMGV/XUNTB2tV3XLfNPU/rwfrikdLm30FdnP0ZKRbUh2gLWejHzpCd7hoqDgEOpBlnuIF18jntYVGo7oGkU7CiyjHQHhPV824WAKteX/Yl0G8n9weOcliNM/rUrPGqPO37pqtQuLgGcbB8FlQ/2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVcFupJ3gCaVL3WbrcDhbaSxLIWmycak8xddDSnFPNY=;
 b=uTKTAuzz5825VTx5ATlXrfH3HCMQFr6rsf6sekXWsMzhiWYx54oshCZXe9EAwToZOr7a1z8C4tDB1TTDYl3x/h7Y1Uc8D2OOtGG+5IQxx/noae+5KywX35PI420WMqOE0w3lL+o5fuiWREpqpPSSTA8jX/5K3duf3SfxWPCgPaBSUZqfuHrR8KCtZ5XtMN4WEff18ME5P0MOlQ2za33MG9OHibxJpJ8n2l3meH0FT6dFGLhBdFWKjtPg4G2ucerBgVuIDjSJdt1b8qhX7Fb+DD4OaIibGGBuEvvEQOXpKax3+Yz/oLRPZJYvXo5trJbGTQUoAZ5m0w5fkZMyjJXoqQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DBBPR04MB7756.eurprd04.prod.outlook.com (2603:10a6:10:1e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 21:14:23 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 21:14:23 +0000
Date: Mon, 26 Oct 2026 16:14:13 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>,
	Maxime Ripard <mripard@kernel.org>,
	Jens Kuske <jenskuske@gmail.com>,
	Jean-Francois Moine <moinejf@free.fr>,
	Hongling Zeng <zenghongling@kylinos.cn>,
	Chengfeng Ye <cyeaa@connect.ust.hk>,
	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v3 4/9] dmaengine: sun6i: serialize physical channel
 ownership
Message-ID: <at_CpZrmQ986UEqv@SMW015318>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
 <20261023-submit-sun6i-dma-lifetime-next-v1-v3-4-ef1acb0be768@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-4-ef1acb0be768@gmail.com>
X-ClientProxiedBy: PH0PR07CA0075.namprd07.prod.outlook.com
 (2603:10b6:510:f::20) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DBBPR04MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: 09bba54f-fb47-48f1-56f1-08df33a61bfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|19092799006|366016|261026140227099003|4143699003|11063799006|56012099006|261022105027099003|261022075727099003|261021121427099003|261021123027099003|10067099003|261009223027099003|22082099003|18002099003|261026121527099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	sZ2vjTQ5Z7t+nu1jn1ar06jWNSTRhzFl38VZtavnMcoO3W731vCzXNb6ZSYgLKI5c9ZpB/g1Nn6NljVQmKGdiZrnovJR+dfrzLZaTOiYqAxo38AJZ5UW1JxDLo9P5TBhD4EQ0HM5GWKud5y4q8Mf9o8rW0d9A2b7qufdstFHWPITvfJCABwCrXXYdjx7zI/mYd5r4QLhCKmgVfYu9A1yQYirf0mFyVP6Jmiv/ZYUdqC1L8owDBp9ZigZg9hqTqa/+oafczxIGwnEXuBFvX3vGsHp3+gx16cypOaqjhMpH/f+kvImG+RljkteU98WtESPmLekNbMYUVp5qyexKWLsS2cGiWHsiupaT4NKTomgM4BYOqY9kII1zYS60qdjXmZnQMrdKB2kgJarMPN7rvYZfstwLRm2sV9N3yD11R1mNqMxMutBgwriws3lGWylFV/ImnyIpoWcw+6VVCNfAZv/21KcENKj6X+q0BOjuKqiKjzPsJUBmRDdcMK0FI+ix9Mqva2GqZVklidhEsEMEepP7AEotKixNbaHE+8h/WDgEoHQsH5Q7nX2EDhh0jPXtd6maO1goKngjsHomrNCHSXuhVCUT6gqJRRK8VuEtwS+Z4fM4zZSBSoP14ayJKkQ8tzSH/OuxAK2tLA6Q1wVG/FcQWLM3HH2+/1oXDfd5G7y5FM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(19092799006)(366016)(261026140227099003)(4143699003)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(10067099003)(261009223027099003)(22082099003)(18002099003)(261026121527099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cMQ88zaQpIcWU9Y0XLx409XMhAWACkaA0D8A1NNea44S6L4xOcZG5zBt2zXq?=
 =?us-ascii?Q?ZryIx5Oo1EgkUuLKsk8hrau+/R2wNGTJM3iM7JAKsdbbHKE1L4BaKeg1/wGd?=
 =?us-ascii?Q?9tRuwffrfa9LG/IhXWxdYEP7AyuSMBx5y/gsapYPQ5b9HX9k+5bG3i/vuAj8?=
 =?us-ascii?Q?JY++cf4/OtyGBpdXQdi+Q1bfk0XsGX0yABwX8EZ10cbqpxDeTcAhJsS/b+33?=
 =?us-ascii?Q?JIr4NcfQ4EfHsD5KlPBlfxEAcX1O3QJUQ0TbJZkIBvrqd7FWTJYscVGitNmr?=
 =?us-ascii?Q?tCJKOiQf+4x5eigsu4PuezWskbz08VbCnvsvkJXFIBuRMVodMRpwIp4VJPJP?=
 =?us-ascii?Q?55MZApa3TEpeDgH5gZ+lh+QnIYHBfomtwAsrxoHS2leOoAGY/nTu7pvM2G/S?=
 =?us-ascii?Q?g2VmYo9byfcu3YrDYphfj44th4R2r/hkmRjtATutRPCdYNYTfAO9lGH3kk6I?=
 =?us-ascii?Q?3ylNUE30Dl8Z0tysyv4AAyBJj1PLlZ0VFWi/Xz8Y565wN9dUUUpPWMr18EgQ?=
 =?us-ascii?Q?MC5mogwg7/jEmDXQsA4amxlwSkpASpvACcIH83ZbZduwDKCS4KLzmBTxbgkA?=
 =?us-ascii?Q?ZbDHV8Q8+/y9nkJYBxJ2WqOIW9k5AHaJHweCrVKOZ8p9EudZaIOQ/D+0TBhs?=
 =?us-ascii?Q?zzzUor3H5ZLBvgel4B6+M14ShFusx6uMsoZNnSRWjxFS+TSOAtM7IEEE8JVb?=
 =?us-ascii?Q?WgYD3IwohDNVxQpzm2JGMB+PjMAYioe9eL85bAgfIFKnWs/E1mscyeqqWlnH?=
 =?us-ascii?Q?g8RL/oaxNfRemQ8YCyQOMjtfuh6pxupH7Z4a/eqqr2ApdOPT6hNTzPic6BMf?=
 =?us-ascii?Q?OkiyaS+DnIyZpXjtA2xwwB9ci2yXASHCX6ueD3w85uKcfHIoaXA+RXGyMOPx?=
 =?us-ascii?Q?uSjHlLddusDO50nC6cZ0TrNXi710WAWpME/z3/hQYQtkri/9UsNl1K+0zwAN?=
 =?us-ascii?Q?JmZYc1Sfr0G3vMpfWh48lqbpDkSpVMxpNClgN/UBGSSuZuMzwN1HbXShCXH7?=
 =?us-ascii?Q?g5Ja+7SKZ6wDEeN77hq5OQ7X3IYoyLZ/3tB7IsmEv9x2xmxywCsp4YwYip3V?=
 =?us-ascii?Q?Lx9Pp7KyVEulaIrrXDSSP9W2q8Weoss+EvXP5GHcoaZYutGd5O9RpihHI9LW?=
 =?us-ascii?Q?URP7lA5fn+u4DtSXLwGELFAgWfEE3f012lRChw5cdRHhHoeTxA7JKV/bnGcS?=
 =?us-ascii?Q?1UaU3OedcQzVGiVaRwgXPgfnYmUVVyAJOMxVdZC2GS8JFC4mntUtZijcnF4t?=
 =?us-ascii?Q?tXBoucGQ+Ln3eYke7XY0ZExhG6/p0j/iDOAvEcQJUMBAQj7fd3IbTfTnV37o?=
 =?us-ascii?Q?S8u+OnQfAm7a2qR1txZPY26YTkhe4TgBZIO5vKkU4NtgUVj+HmML8io1UO1D?=
 =?us-ascii?Q?Z7AIWUnbjmohv8xxS1GXds7CqiaYTBbDcEpcO7Vse3MYb636Eru5emlPfXx2?=
 =?us-ascii?Q?FxDsc/vskM8oPMMPVGrtbPrmwG+GBU8xAK9iiVtn4RAfblxEt7wynOiGSpNZ?=
 =?us-ascii?Q?wVfvSQ3RW0DJOfJL1oDbZUn7iMgNplYReXmyzy+Sa19Wvm45yuuM5qJu5kVV?=
 =?us-ascii?Q?mUuZcE+DAtq0E7L/iPkx6mdkxplHGY0JK15HCvXV5GO5Zq5iF1SMHZuxqlfh?=
 =?us-ascii?Q?3XlRc+h9e45epUSfOuBYoaA5LwpIXtWuYiJH0SRSXpoTHjRKXUrecNbZ7nW5?=
 =?us-ascii?Q?XXx/ogmkrV4esxeiLjTFn41BVLRuU3ne6p01gh7N2W9D7y3m3pC7aF3KFX1H?=
 =?us-ascii?Q?GDBlBfrrUCx9/517CHNx21iAdTbpDdF0c1RRZnEFj7TmBhBo22fE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09bba54f-fb47-48f1-56f1-08df33a61bfd
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 21:14:23.9176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: onrRbK8+MM4tpjGqkxiPGUGHRmHJj8COc9+8vBTVVfhetg2t8HqQ2lmAnfU2fJ9Z+rEc6Ay2hY3XMIvydsGYQjoQShJ0PdtsU0qEdYZyp5AsV0/Zlt5bsKDXyD+6aXal
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7756

On Fri, Oct 23, 2026 at 05:38:23PM -0600, James Hilliard wrote:
> The allocator changes vchan->phy and pchan->vchan under sdev->lock, but
> termination reads the physical channel before taking either lock. The IRQ
> handler also takes an unprotected owner snapshot. Termination can miss a
> new assignment or detach an owner while an interrupt is about to complete
> its descriptor. A sampled IRQ can also be applied after reassignment.
>
> Protect physical-channel ownership with sdev->lock across allocation,
> interrupt handling, pause, termination and residue queries. Read and
> acknowledge IRQ status under that lock, and allocate and start each pending
> channel in the same critical section. This also serializes updates to the
> shared interrupt-enable registers.
>
> Nest vc.lock inside the device lock when accessing descriptor lists or
> updating cookies, including cyclic notifications. virt-dma takes vc.lock
> independently when preparing, submitting and completing descriptors, so
> the device lock does not replace it. Client callbacks run outside both
> locks in the virtual-channel tasklet.
>
> Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/dma/sun6i-dma.c | 67 ++++++++++++++++++++++++-------------------------
>  1 file changed, 33 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 435d7daa1c0f..d3a63c866645 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -217,6 +217,10 @@ struct sun6i_dma_dev {
>  	struct clk		*clk;
>  	struct clk		*clk_mbus;
>  	int			irq;
> +	/*
> +	 * Physical channels, pending list and registers; nests outside vc.lock.
> +	 * virt-dma also takes vc.lock independently for its lists and cookies.
> +	 */
>  	spinlock_t		lock;
>  	struct reset_control	*rstc;
>  	struct tasklet_struct	task;
> @@ -524,11 +528,11 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
>  	struct sun6i_dma_dev *sdev = from_tasklet(sdev, t, task);
>  	struct sun6i_vchan *vchan;
>  	struct sun6i_pchan *pchan;
> -	unsigned int pchan_alloc = 0;
>  	unsigned int pchan_idx;
>
> +	spin_lock_irq(&sdev->lock);
>  	list_for_each_entry(vchan, &sdev->slave.channels, vc.chan.device_node) {
> -		spin_lock_irq(&vchan->vc.lock);
> +		spin_lock(&vchan->vc.lock);
>
>  		pchan = vchan->phy;
>
> @@ -545,10 +549,9 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
>  				pchan->vchan = NULL;
>  			}
>  		}
> -		spin_unlock_irq(&vchan->vc.lock);
> +		spin_unlock(&vchan->vc.lock);
>  	}
>
> -	spin_lock_irq(&sdev->lock);
>  	for (pchan_idx = 0; pchan_idx < sdev->num_pchans; pchan_idx++) {
>  		pchan = &sdev->pchans[pchan_idx];
>
> @@ -557,31 +560,20 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
>
>  		vchan = list_first_entry(&sdev->pending,
>  					 struct sun6i_vchan, node);
> +		spin_lock(&vchan->vc.lock);
>
>  		/* Remove from pending channels */
>  		list_del_init(&vchan->node);
> -		pchan_alloc |= BIT(pchan_idx);
>
>  		/* Mark this channel allocated */
>  		pchan->vchan = vchan;
>  		vchan->phy = pchan;
>  		dev_dbg(sdev->slave.dev, "pchan %u: alloc vchan %p\n",
>  			pchan->idx, &vchan->vc);
> +		sun6i_dma_start_desc(vchan);
> +		spin_unlock(&vchan->vc.lock);
>  	}
>  	spin_unlock_irq(&sdev->lock);
> -
> -	for (pchan_idx = 0; pchan_idx < sdev->num_pchans; pchan_idx++) {
> -		if (!(pchan_alloc & BIT(pchan_idx)))
> -			continue;
> -
> -		pchan = sdev->pchans + pchan_idx;
> -		vchan = pchan->vchan;
> -		if (vchan) {
> -			spin_lock_irq(&vchan->vc.lock);
> -			sun6i_dma_start_desc(vchan);
> -			spin_unlock_irq(&vchan->vc.lock);
> -		}
> -	}
>  }
>
>  static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
> @@ -590,9 +582,11 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
>  	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
>  	struct sun6i_vchan *vchan;
>  	struct sun6i_pchan *pchan;
> +	unsigned long flags;
>  	int i, j, ret = IRQ_NONE;
>  	u32 status;
>
> +	spin_lock_irqsave(&sdev->lock, flags);
>  	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
>  		status = sun6i_read_irq_stat(sdev, i);
>  		if (!status)
> @@ -608,14 +602,14 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
>  			pchan = sdev->pchans + i * channels_per_reg + j;
>  			vchan = pchan->vchan;
>  			if (vchan && (status & vchan->irq_type)) {
> +				spin_lock(&vchan->vc.lock);
>  				if (vchan->cyclic) {
>  					vchan_cyclic_callback(&pchan->desc->vd);
>  				} else {
> -					spin_lock(&vchan->vc.lock);
>  					vchan_cookie_complete(&pchan->desc->vd);
>  					pchan->done = pchan->desc;
> -					spin_unlock(&vchan->vc.lock);
>  				}
> +				spin_unlock(&vchan->vc.lock);
>  			}
>
>  			status = status >> DMA_IRQ_CHAN_WIDTH;
> @@ -625,6 +619,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
>  			tasklet_schedule(&sdev->task);
>  		ret = IRQ_HANDLED;
>  	}
> +	spin_unlock_irqrestore(&sdev->lock, flags);
>
>  	return ret;
>  }
> @@ -931,19 +926,20 @@ static int sun6i_dma_pause(struct dma_chan *chan)
>  {
>  	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
>  	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
> -	struct sun6i_pchan *pchan = vchan->phy;
> +	struct sun6i_pchan *pchan;
>  	unsigned long flags;
>
>  	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc);
>
> +	spin_lock_irqsave(&sdev->lock, flags);
> +	pchan = vchan->phy;
>  	if (pchan) {
>  		writel(DMA_CHAN_PAUSE_PAUSE,
>  		       pchan->base + DMA_CHAN_PAUSE);
>  	} else {
> -		spin_lock_irqsave(&sdev->lock, flags);
>  		list_del_init(&vchan->node);

suppose need vchan lock here?

Frank
> -		spin_unlock_irqrestore(&sdev->lock, flags);
>  	}
> +	spin_unlock_irqrestore(&sdev->lock, flags);
>
>  	return 0;
>  }
> @@ -978,15 +974,14 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
>  {
>  	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
>  	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
> -	struct sun6i_pchan *pchan = vchan->phy;
> +	struct sun6i_pchan *pchan;
>  	unsigned long flags;
>  	LIST_HEAD(head);
>
>  	spin_lock_irqsave(&sdev->lock, flags);
> +	spin_lock(&vchan->vc.lock);
> +	pchan = vchan->phy;
>  	list_del_init(&vchan->node);
> -	spin_unlock_irqrestore(&sdev->lock, flags);
> -
> -	spin_lock_irqsave(&vchan->vc.lock, flags);
>
>  	if (pchan && pchan->desc && pchan->desc != pchan->done) {
>  		struct virt_dma_desc *vd = &pchan->desc->vd;
> @@ -1007,7 +1002,8 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
>  		pchan->done = NULL;
>  	}
>
> -	spin_unlock_irqrestore(&vchan->vc.lock, flags);
> +	spin_unlock(&vchan->vc.lock);
> +	spin_unlock_irqrestore(&sdev->lock, flags);
>
>  	vchan_dma_desc_free_list(&vchan->vc, &head);
>
> @@ -1018,8 +1014,9 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
>  					   dma_cookie_t cookie,
>  					   struct dma_tx_state *state)
>  {
> +	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
>  	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
> -	struct sun6i_pchan *pchan = vchan->phy;
> +	struct sun6i_pchan *pchan;
>  	struct sun6i_dma_lli *lli;
>  	struct virt_dma_desc *vd;
>  	struct sun6i_desc *txd;
> @@ -1027,11 +1024,12 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
>  	unsigned long flags;
>  	size_t bytes = 0;
>
> +	spin_lock_irqsave(&sdev->lock, flags);
> +	spin_lock(&vchan->vc.lock);
>  	ret = dma_cookie_status(chan, cookie, state);
>  	if (ret == DMA_COMPLETE || !state)
> -		return ret;
> -
> -	spin_lock_irqsave(&vchan->vc.lock, flags);
> +		goto out;
> +	pchan = vchan->phy;
>
>  	vd = vchan_find_desc(&vchan->vc, cookie);
>  	txd = to_sun6i_desc(&vd->tx);
> @@ -1045,9 +1043,10 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
>  		bytes = sun6i_get_chan_size(pchan);
>  	}
>
> -	spin_unlock_irqrestore(&vchan->vc.lock, flags);
> -
>  	dma_set_residue(state, bytes);
> +out:
> +	spin_unlock(&vchan->vc.lock);
> +	spin_unlock_irqrestore(&sdev->lock, flags);
>
>  	return ret;
>  }
>
> --
> 2.53.0
>
