Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195013;
	b=1lcBJP6m5fII4qAVEC3Cu3ETza/P4sEtITRlyTPIb8U9aDjrJb7r5SEYx+3CYRsGW8OG
	 aqAKGpvsNvrogpi0aCGMk1QTPQ3UGrfhdtj3j+cowgQEtc5BXUV6NsGP4uhywby5cHXKu
	 4fwce/e6MBdLCWf6uqA5Z0lGG2qcf6uFNajdyeqXG6N9QOcpNrKw6CCySSSxxGHUFKuXL
	 vtDMbHm49TqEl/ZBGOGtgGmJM4kbGlOE46IT4M11nDPbt2E+vFed5YazisqkI5pxQJVtD
	 RujMrVtcoz71o19U6d8ZwuRukF1JdNEOVxzxglPQScIQTAOgpNqc0W7a/9sz7XFOpJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195013;
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
	bh=HlRImIbPug9yEXe7C7o2UGRwu8RUuuv0c4xjU/Ep/CI=;
	b=eIqrYUUXg47vzDIuNKsmEoHqTdY/yEFqBm4HYq0bZqLlAOdRiMbIhQ04SciIvqYgrLVq
	 ADmo3NPskHs/vPkRi0kgg+HhHanwO8KPsR9y21uafFjPQ5GhL1G5bskwDk+fbVO+kLQbJ
	 NvJMQwgca0Za9eNZQfozhllPVDXRVdN16GSi+uyEtaTiXfrrs6grf4LIXh8d1aieTQwF3
	 NKI4PC3kwmdn2uE/V+qChYaeKbDuy8iEWV3ze5xNDrIbZq5vRhRku1sCaQ9dquk28dSOp
	 WocFvCA7Z6/94uLi3LCHMitKxLRaoE7qIVRXyXALp3hFJ1nYWQLoIQ9QOnI6qyhgh9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=L2F0HVww;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.54
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013054.outbound.protection.outlook.com [40.107.162.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ABD606A336;
	Fri, 20 Nov 2026 17:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25ABD606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=L2F0HVww
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1vZE2CsgWLwA5j3c/qP2aUGaELM+VOgs92BPbUgfntfgNefLG4LnCodOnytposijAnQGpzSaNSo4pgWBWnWHSnK3oGcBk/3S0iRP+8FLIXLr3OU/y/IuzsEn0R+px/UjzJai2GDg6lcjlvNBAvMMudPcyiN9p8Q/7fKT6T+wQ0xPUXyO4w+TC78FREINKIP/YYNzmT6TaTFSYwGFTa7Kg8KlYnzAGRWI+BTttD8KhTJ8WCQ20qAYXE5opJBL22UVh3XmqTJBPHbusMn/NQkTXn7kb4OvgvLRIphYjV8qjJ8oO9GVJoGboRiYd48WbnMwb6TuwOS48yId0JWvxXaMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlRImIbPug9yEXe7C7o2UGRwu8RUuuv0c4xjU/Ep/CI=;
 b=iGnCs7xeKuri1i8LMfZtVIscFQs3dqJJH85aHSM9KaJDZU8SVkIyAydjRhrz8fIXZKURz6Qw0XZryPEh+dqIS00uQZZHrvTm3Q6698wwA5PhB/+6hnvuf53YXYqA0xTtClpCcP5TZeKR+zXpoXm9vthbUU7jkqCGDZL9x+1JiMEzYeHpksi7sWvMW9m340uuh3ZpGFQXs65d1/qHfDSIVGR/ZBi4TCySaydSbPuKEJiDDTc3GC0tUhzU97uK3C2McL3qccPBkIMzlJl86/JOhYwA+dnnKVGq95EkmlUGHuolYj98QiRH+NmTCMQWJ41RgjTGRC2NjHcPUuim3whIPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HlRImIbPug9yEXe7C7o2UGRwu8RUuuv0c4xjU/Ep/CI=;
 b=L2F0HVwwzkgZ5JRJ01Px+bZDi7FRADX6iVd8c0fVxVfOLEDt6il0wCwATxl5/bzNdeRlky/LwPnVsRhgCEVzHqT2jmvNvNSg0viB9Y2ROZxw4c8vFhWF2xG58Q5tiNkwhlYvhv+k+KRyZSI0Ox0RBZOJAraKQwBvVRkaAsRVF9wOc72APkjZR3IIbuceEd+EZRsM19wFHNyXB5xdkivFWjL6gtiEFMfaUVOL1ojd+L78H8J06Kcwp9HjpmF7SdjH9dmkKSFr+97tya5BAQCHn3Ynv0ib4pj7m+9O2h4B0STNj2EfD90U2Y5ab8lzo7tBSv2zQ4x4V8UEZQuMJ9HIcw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB10565.eurprd04.prod.outlook.com (2603:10a6:800:25b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 17:16:46 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 17:16:46 +0000
Date: Fri, 20 Nov 2026 11:16:37 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: okaya@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org,
	andy.shevchenko@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2] dmaengine: qcom: hidma: avoid world-writable channel
 sysfs files
Message-ID: <awCAdT4JNICK5zsC@SMW015318>
References: <20261120103753.56194-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120103753.56194-1-dennylin0707@gmail.com>
X-ClientProxiedBy: PH7P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB10565:EE_
X-MS-Office365-Filtering-Correlation-Id: 3578631a-dd7b-4abf-c85a-08df472a0e2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|366016|376014|261028144727099003|261026121527099003|261026135527099003|261026140227099003|261102123227099003|261021123027099003|11063799006|261022105027099003|261021121427099003|56012099006|10067099003|22082099003|261009223027099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	2txR3NBuwFV2+h9AIePJErcxqAjKOhNYdx73bU2ab3Yz2CZC1GwakdnCh1Z21t4kTSOjjexAurqF3zozxegPJes0SF9QUOg9iyO9E4LT7W6jGDNbWidPWypzKkim5YqK9XEFEpcWXscqj6WoGGzOSXOx1XooP/Hte0QAjWpbB0BSdC5C+7bhoGzSShPRGDpPKG1qZZm1gJqbUyO2oH63L6vn4yhB9cbipB1hqDiMPecoBUBo3aNQiIfkIHMAQBW8KUt7SZa0F2aDi6bv7NPvaPFj2NzO03pAS+pbW4DaEL9P6nwfEIorG5p/shsEMQVpvVe52E8I39TUS1M/McExkzmGkP1qi1RmVZigoe0o/uIYeYyIlLtiK372GXHeQxboJ7p160PXE8j7ZfJZjWAp7PJAXQg/KAJkDQjYue71CB6kYDZgpuFJEBkFtg16nvyuC8v9wGJvRh6cBU62GYYthnQofOmKpeP1IApaE+mke78o11h6XB/nfLSuLWZJTr5LN15EJ7wiVJnGCsN8HEYqZkzTlMy8lEEicOueHqXtn6AdQVwN+poAHjPsBorEUHpk/j4A9ko8aodCIxefK/EXkXqJmsc35OSDXzo8fKaOFcsX8khpUlkOlM+uk6lWv6Ix
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(366016)(376014)(261028144727099003)(261026121527099003)(261026135527099003)(261026140227099003)(261102123227099003)(261021123027099003)(11063799006)(261022105027099003)(261021121427099003)(56012099006)(10067099003)(22082099003)(261009223027099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aEvoXvZBt4l8e+saRBz0Z5uML2e6QwraSMWYWTfslh/q4mHYDwPdvkuhpBni?=
 =?us-ascii?Q?UzOl89fS/v6dFMxF5X/Js9gat/Y2Ub+boGxGMF+/0/gRLZQLynxF1GAzooNR?=
 =?us-ascii?Q?hCLAR+v+ZJElABiM+NWLN4Npbp+aMLMeFi2EBlWTp17SJkor110ooe5DNkuf?=
 =?us-ascii?Q?JrVdiukPmano+3dOt9CSvLCQiFuuQ+9wt091VOyMA2tD5Uemv6GAyetmzVn0?=
 =?us-ascii?Q?tiqUCEdXRnyZp1s+7HhoKdCX9nVXPJWbSfLuigvjj9h3HWzc0kZFVfXhOfaS?=
 =?us-ascii?Q?yM4LlkZ2lQUedIqkOAOyhlmhRjzgNQAMYrZ/SwVO/DyXSEKJXuKgiILuuiV0?=
 =?us-ascii?Q?6sw82v+r14fp7+Qe1jhrzAWOB8yzUoi46edwGdDM0iH9DjenkhA7G4fWMqVR?=
 =?us-ascii?Q?+V4943KoS6l8r1s3SlxjA6zgIkpHlfxEa6K0AOwW3qPPIZtejnQxNAL9LuEU?=
 =?us-ascii?Q?Y7JSt493qvcHJ3aDYQQQWzF2dnjKjP4YidAYtQfeaoOxqgsFJBOjfKxUVnlZ?=
 =?us-ascii?Q?8Or/JGTYfYHq2pGkU/XHJCneDf9tJUNvYpAeIVqpraV2I6rXTwGWEayjydev?=
 =?us-ascii?Q?yqLBREVMJULtZsE6tyGEuA0xHHrkmvcRIENjNOWp/sgDBfgeal2JR0KdHnUy?=
 =?us-ascii?Q?D8k6dZ1WPrV1IsfpQeFdbKYN/ZQJDOzUOkifo0CEIXTBPe8HrlvPWMNvkzo6?=
 =?us-ascii?Q?/cYDHKGgv8hbiN6w5RRnN56JHCV/RImWa4oQGXtCezNypi6j+p40uw0rQo7G?=
 =?us-ascii?Q?IK/Wuxa7Xj5Z+iojXSiYNGD0wmJzEEi94H690P8qe5tN9GvciDiwH7UYS5Iv?=
 =?us-ascii?Q?rDQBAxFZ24IyEOgO8ElQcY0qy6RIGgcc5TobU7DR4pibS3JNHuoO5S6lXN+/?=
 =?us-ascii?Q?a4+ef1O8qs34MzhmHljDSCQeEOi/kquc756rM/MgkrDjz86d1buTxxsrFtd3?=
 =?us-ascii?Q?/I93sf6IWiddMO6q2izqf+qqhtMBYNHh0e2jJ0o91GmgGYXg2GF5cmI2DKWc?=
 =?us-ascii?Q?6mF7tGPaU4B5gqeyaOQYrjUUldWyk601C/wZlUtMnapa/USnzdIR1fGw4SW/?=
 =?us-ascii?Q?9YSiTWncs8opsDxI/mDqaGHny/TcmOIpDR7gVAWM7UhJy8+4iKCfQ5CcAk8g?=
 =?us-ascii?Q?qYi902p7SkjNJTnWP62SmKwXDoIduMoNtZagbXpY97qHLhAZG3h/0obb39V8?=
 =?us-ascii?Q?m5PlhdjWeJ8QBJO8wW4+Ba8YzUc8qxprk+epb/1RXQyEmuouoVEwgj33eQnm?=
 =?us-ascii?Q?Ibus+5AizdQvd76LUdUxPO8Jo53uyUwmlnXoJYMxoUU3WN7nioRv11+EVTBP?=
 =?us-ascii?Q?Ph/KPzb/H8qdSC3AqObOGEGV6Ldr5Lhn/ViK9POEakQlU2n4/ru7KsjqEfY+?=
 =?us-ascii?Q?riv/TKK0trIfwAu3a4eWGz3HcwhQOCfDqMSf/SPFQnJcX3Dh0aMnCWAQq9g0?=
 =?us-ascii?Q?V1SUUAXA/bHDs8mG96zr5DeHnP/lJWTO35XDxUev0jmWCWHXeN3KbwEmMr8H?=
 =?us-ascii?Q?AlCZYNz9X4Kg8RS8seXfUEVp3CXJ+MdmSqy+lCxC+IKD/ESx4mL5N0JdgPl0?=
 =?us-ascii?Q?P772Ltl/hhIRZywT1pKjMAuaOUoTb22ajDfN61c4uMLvheTaPGvfFAVOhTBG?=
 =?us-ascii?Q?cjoXHK7dmR8d8sg9t+DCfXNwbBOmBa/wNAcO/ysoaqt/zwd248hlxRcZWv92?=
 =?us-ascii?Q?dTq3UN4QiJll+7pj6XbpIeJP6hmOEsFRBWRWfbHjtKG+D2RKF0NKLnl1Eb0J?=
 =?us-ascii?Q?5JeB1O9swO4Z6TXcs+5k3P/QnLHEbLJjS3tsiEvcuenJLcRtzJRn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3578631a-dd7b-4abf-c85a-08df472a0e2d
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 17:16:46.4130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGupYgE4NgYPvlmBo5DKQ50N9/lK0OXedQv0AycHN3y2DcQfhZTPSbpFriRJmSvID2wsUieGbAAP6jHHDI8TUgc3lR/nUfPnW9mk4ychzL3loHYURmxQePGK/hDzb2IF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10565

On Fri, Nov 20, 2026 at 10:37:53AM +0000, Hungyu Lin wrote:
> hidma_mgmt_init_sys() creates the per-channel priority and weight
> attributes with S_IRUGO | S_IWUGO, so any local user can write them.
> A write stores the new value and calls hidma_mgmt_setup(), which
> programs it into the channel's QoS register.
>
> Attributes declared with __ATTR() are checked at build time by
> VERIFY_OCTAL_PERMISSIONS(), which rejects world-writable modes. These
> two are created at runtime with a mode passed to
> create_sysfs_entry_channel(), so the check does not reach them.
>
> Make them writable by the owner only, the 0644 that __ATTR_RW() uses.
>
> Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Cc: stable@vger.kernel.org
> ---
> v2: Collect Reviewed-by tag; no code change.

If only collect tags, needn't repost new version. B4 can auto do that when
apply patch. And repost it will cause I have to mark patchwork status twice.

Frank

> v1: https://lore.kernel.org/all/20261107221500.96825-1-dennylin0707@gmail.com/
>
>  drivers/dma/qcom/hidma_mgmt_sys.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/qcom/hidma_mgmt_sys.c b/drivers/dma/qcom/hidma_mgmt_sys.c
> index 9672ef9ee8fc..53b991752e80 100644
> --- a/drivers/dma/qcom/hidma_mgmt_sys.c
> +++ b/drivers/dma/qcom/hidma_mgmt_sys.c
> @@ -265,13 +265,13 @@ int hidma_mgmt_init_sys(struct hidma_mgmt_dev *mdev)
>  	/* populate parameters that are per channel */
>  	for (i = 0; i < mdev->dma_channels; i++) {
>  		rc = create_sysfs_entry_channel(mdev, "priority",
> -						(S_IRUGO | S_IWUGO), i,
> +						0644, i,
>  						mdev->chroots[i]);
>  		if (rc)
>  			return rc;
>
>  		rc = create_sysfs_entry_channel(mdev, "weight",
> -						(S_IRUGO | S_IWUGO), i,
> +						0644, i,
>  						mdev->chroots[i]);
>  		if (rc)
>  			return rc;
> --
> 2.43.0
