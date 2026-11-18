Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795033501;
	b=k/nXBiYUpCEelg33OyKUiqSy3khCA7FBzgSJMB+ldqnESpY4+F+SeNIWWp/A6NNDc7ad
	 HAGEhWk5w+xN5pCRIfnY6xk5CWJeCTFkTe0aLVftsPOt806XQVzO+xON+feclE1m7ZqC2
	 T7ldyG0S0rA9KpASIXnaX57QUgO5nUfOYmdl/yV4/iqosxl/eBPndjWwVF6Ksi4LIOOfp
	 pxy1YeaoOBu+OMbRbaznI5Iu1N6TUUD0v3mZkAa9+pfbfmbX9r5Sa3WR1POLcpy8wMfDP
	 bQ/AZw4Jo1DN8Y19cKBHnDyylKrbmk+Ey6J2KvU4WcvCpmwdhOGYyNEOo8NgepYu9hg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033501;
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
	bh=QDQbkgDsPUmrMqm3wnA2LGE5x2uQgQtfVSQ8ckhzdGE=;
	b=ZMOIPL7pTe1Mc0FrG1eQfEGqFTZ3LFxHrUYwhfwxSp9dAq7Hml80czumUVHMc4BEfwpR
	 B7K8JFDy1hGjqxi7Gxn0Q2AHJhsCtZZdKzsRvImCF5xTTHRZHsHikLoziE1bxZaQv2rBE
	 ETNiomibS7Sb3jjV9cySBd/QzAuTb7N6KfTqwwQuVaB1+9LBbHh+kwX6pBO1LYwvwRfVl
	 6AqByWu0cXESJtnt8Rv2sbl5d2R3/FTVPzdT4GZUXb4YTzYxInpbzS4B/8tbK87CGo6Iy
	 n9wm8yK+BvTWt2tjDwAoFYGS4twmvSOMkq+JedsEhjwe3++DdQaZOsp0itl+Z310mmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kPuHMuIA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.66
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010066.outbound.protection.outlook.com [52.101.69.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B28606A31C;
	Wed, 18 Nov 2026 20:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37B28606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kPuHMuIA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u22+oMrdsZ7/A9M02W/QcwDA2gBM7f50NWkW8apFeFHhf9Myyet5lFXFbU4igWX4OHrzZieXQJMHmJ/mRjR/t7d+AbQaQzHodxmqbOZD53E/K36dZupolgcBjcRRHTBmL6Cb+57yFnCnAYq3Vge93LHF8DoLdljaitEEmf6c7Z3CkfcNvBYDknHWgf+PxxgujwzRiztzs+9quSxqA9coDjhc7PZCqxwLS/lHI6VcvM5/iscN8o95aeLvm8djh3HXsAOTJpSbDeFx7jTcqmkbYMcndVVlWgLmS3IsAYfKY32V8TT5n946Qa2CjuQs2xTNySuk5d//UEXRYR+hUW2eQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDQbkgDsPUmrMqm3wnA2LGE5x2uQgQtfVSQ8ckhzdGE=;
 b=At4MgxCK4fqRDvrZbTEUJcqz1AvzajwMAtkx5QXThEjhr77yYYtrUIcHiS/hQ5VxcAUNPQ+FKLRSmKLEIxF6j8Z2Ct/nLGT5+iG11RC7kLhDyqJmnLVX3xVcFMI/UDRSD9BNverwi9FEcNM0pe+gYui6ppluSnWTZeTrzEaoFfwiIDpKhcFvRtJ3SFxTz1MpKf5k/bjKIjHTKDJWsFNyUgzLi7YVE1Gfmehao5FhTD6nh24APxNWjmCLoLfT9z+hczOyqiYuXcf7PwdljPV7tdgK297d9vtPjX8b93N7xy/GUy3TJAE7ga4+4FtJpV64mUwqfb5BPctjmSn3EZXilA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDQbkgDsPUmrMqm3wnA2LGE5x2uQgQtfVSQ8ckhzdGE=;
 b=kPuHMuIAi0WImfi12bo07QFKhXzcnTyTUY9I5UNwTzz2K+wiFVFaTPYaRPYUZTbFnQqDbdDeSduttWtPyFjxxliTgZG9gZvxyNGdZWboMPhP+92kS4hvv/YNJXfXN1OSm5pyJA8282BNI/qc3+ltfxz3RmoWHU3iu3jG5MtZjvi1PhGYSK5iWZXx/kXnf/oTeRg0kvbM3ykjVro9Nkid/TaDvNqMXJauw/N4UESX8RP9yXkPyMSXfIfaYOqkDVZ8YkCKnRZ9C3TJU/8D8GfV0PNYaKHagg7WvzFdCMT0wuoGuaK9YNnZrqcg6mK2i5L/NrXHkNDhWASiMDo+22rHBg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM8PR04MB7938.eurprd04.prod.outlook.com (2603:10a6:20b:24e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 20:24:58 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 20:24:58 +0000
Date: Wed, 18 Nov 2026 15:24:50 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.li@nxp.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Dave Jiang <dave.jiang@intel.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Kelvin Cao <kelvin.cao@microchip.com>
Subject: Re: [PATCH v4 3/4] dmaengine: switchtec-dma: add config sysfs
 attributes
Message-ID: <av4JkptRWXXG5wul@lizhi-Precision-Tower-5810>
References: <20261110173137.623764-1-logang@deltatee.com>
 <20261110173137.623764-4-logang@deltatee.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110173137.623764-4-logang@deltatee.com>
X-ClientProxiedBy: PH8PR02CA0040.namprd02.prod.outlook.com
 (2603:10b6:510:2da::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM8PR04MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: d64c1e4e-900f-4263-cb69-08df45b20435
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|366016|23010399003|1800799024|18002099003|22082099003|6133799003|261026140227099003|56012099006|261009223027099003|261102123227099003|4143699003|11063799006|261028144727099003|261022105027099003|261021121427099003|261021123027099003|261026121527099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	yY2AYVmHOYB3B/CONpnisyGi9/LQbAqj4s9SdNu37i8ubp9EDgtFQzKTrQGu9KlXzl5NyK+bI1Ewk5V0u1FLArTEy6PyzwlmVK7GMplGDQJ0APRWimR0bYdgjCe9DZf7cqghsQ6HWjvugtMiT/V92zZzE0lCQeEC4OQGAW4toxDiM6ys8wY39cngFhU1fXLgJfeeuvSSHVSkP73f02QwAMyRDIuwNQC7nOI4EZjeL4Clou1YDD173Imja3Hg3wbdre0nNl3pxHfqiMo2lJr77yLP1WPgic+Pk4tFUboARqoLtqx8XVDg4KuDJBJmMz4RzyK521ktLNgY+p2heICn0/AdDNcHCZcpjxCgxBQPz6+8Yc1qPSQUOgy7V0XF85N8c4M18YWSx5qq1kFdtpcnjv0EN4DqrHB3qMJDJrBfHZJG2w0Cu46VCnMIOkyBjgAryVARjlW2JjdpXTGE/HfZewY1rM/+GHa618F/+2O5Qpm2FenHZhu0PVO9MtH1EOrQAWZ/xZjHwD2NEFQo3ZaO+jZUuiZTcQO/hdsryL/7GcpaUcRfrkkmbpQIlf4Gi1bpj/pVewToUwk+9WGEP+e6iTXQs2gAm3uen3MR7JaKWZ4VmcmfPJXo4edQa7vFPvwf0sm/xK9dd+VXZ6OY7cJ2V+gD2FGimNUBR4rFmtsJVyw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(261026140227099003)(56012099006)(261009223027099003)(261102123227099003)(4143699003)(11063799006)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026121527099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qbh44vDhdED3T/LbWWxMNLmpK7rKNFRsJUAD3FfqVv4SsrfqerGuPGv7NPVB?=
 =?us-ascii?Q?XHdXTwgwM0cPa3QaTLYhPV24g9tz/ikOZqWKHr73P9EuDRd/Z/gdjJwplfEA?=
 =?us-ascii?Q?r0tBE1ywAvMAyaQN6m43d5jVSDcVDaY3buNKmnAnx6Tv6yQm+CHE3WRrc1Q9?=
 =?us-ascii?Q?On1rL/68hNlfLi+a2oeGJWt4NNVOC+3z9wyMdDaDHjW0NthuqyWKTsmnOdTu?=
 =?us-ascii?Q?uR0J9sM5RDdOqbu8DZ6u4sntCNeszpBSirZcfMJcC89ZnEkTS4NMIBRxg7bA?=
 =?us-ascii?Q?nmY88U8hgIo2Wn3RNVQfxH0T0SuOko+X2x+trYCtQvdKeeYP9CbUdIlHpuHD?=
 =?us-ascii?Q?L62mhqf9f0B3moOABr4b+UiWoqBz5XW47hcYoinXn4OSbBAxf5aoXwfr6ljX?=
 =?us-ascii?Q?nuzjSw/KpshS6xE4gmH6N9s9SyS+vql5g8GMB5daxcrlgImyRr9vMTUA+B7/?=
 =?us-ascii?Q?wuLwYbXbeCAooFeZGtumLRwFPhstXn1b008fqfLmi827I7eb3qJksmWf9nVy?=
 =?us-ascii?Q?NhEhH5WEp7qkjTQG6N2LXHqHms3iPpcArNAG54KdurLFC8MlKtr5ubxQCR3+?=
 =?us-ascii?Q?58AWr+wn57Vfp81wIhv4PcCILQOu1pb/tfi3n9DVg+HWC3JtJJoG24+FLzy+?=
 =?us-ascii?Q?Y9PUOIjwvdS9l8pZVS8dJL2PZxS+W3YjN6btEspBtNnOywNKYIi5sA/jjXq7?=
 =?us-ascii?Q?wuu2aDP/hscZBTFVyRlb6TnQfCXwTTiouqhVChj0ki/glU4+BK5v+653DGEf?=
 =?us-ascii?Q?JzJfMJh+i5TBh0S4hTvXoWg4d/HhxVJRqdh8qFt//aqLhXGyQbnv9RgW5BOi?=
 =?us-ascii?Q?W9d/UX/Kkb4MZvjU2TqPHFGlHRGi/sDwzNlH+EvA2kJkQBDBN1/Ff6FbOH9w?=
 =?us-ascii?Q?Gk2Rszk025Haqa0PjKKfYF2Qf3pZO6ZVli7d49+tyms385zcf0Nc86xxEyAl?=
 =?us-ascii?Q?U2aIcaBH+P9OgxYXC9EApYf0q00QhdD2jZg49d0geyD9L7CwB3NPaqVQ/9wz?=
 =?us-ascii?Q?QP1s+De+YEdvk740jTA5/y6E+gITd9dkQUzpU3tpvg3zb/MxOzaAHvVbnIDE?=
 =?us-ascii?Q?5lEjZKwYqBXhMHKrxLSjVtHGHja6nbynY76KMMcJ2metAJF6hq1jQTcwzGSb?=
 =?us-ascii?Q?KWUYzz+v6TtVFmAXMO7bwqQtUoygwOGeQS6W6EyZOUmCNizenP6FLCZ7WN0+?=
 =?us-ascii?Q?LWaWrS6N2DZB7ZJo3gndpatcxF43LA5nDuVQEd3uAVnxlZD2c+KAeQX0PK/m?=
 =?us-ascii?Q?hHM5QLae0UBzxP9B+fKozxRf3GqpRvcviVxvB4vTLa7lEnNHd9HHDYUkds+0?=
 =?us-ascii?Q?nsXQFMfQ9OXSa5Xh3HNFOQGaTGrKQVHFhfUKZebDK+5g3pa/0OugvSrG4aQi?=
 =?us-ascii?Q?mgOAaZt47YgWgaxxciBRGkjUorr5DVAMhI4IjkXuqZXuXVCu4nAn/BI2RpY6?=
 =?us-ascii?Q?jMZsPOhhr5PvpoQhzya/RoO2mD4JeyT4dTvS8Gd3oMdiCckfXzv4I1d+QlDB?=
 =?us-ascii?Q?MVBjFX3yYvLyEBrlfpE49yzbWGxOfMgDjzTMd8JZAp+iC7qgsLlPOz8q641/?=
 =?us-ascii?Q?tpOUpalcwkTzebjco9gzv2WupHsIW6Q27gZ5wY+8lxmZwQGYAuqbFAqi95Fr?=
 =?us-ascii?Q?EM3YJFLn0zr5ZnysW+4bUKbkfLY+s1XqhqflDxnhxcXVr7mYiZAZkMJtsBV6?=
 =?us-ascii?Q?3crdrreSiWAZsMbyweB914P0timRg/VmWFQG+WxP37CmFIOaIItHb2hgR2KZ?=
 =?us-ascii?Q?ynI1Gz4KT9xgtHxegEGLUknIW01GDxf09w6YhCNT2xJwiCEvRxfA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d64c1e4e-900f-4263-cb69-08df45b20435
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 20:24:58.8038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3iOUEIRUIDSvmToxCMBkes1igInbivevlzu1DCBRwOFW59Nq8IKh8K/JbYefXh0lEhK8xaZgJeTkJrqlLk/ekjge85eaQplZfDT94ve2Oa6qtoe0oCh9K0+DmojR9Vr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7938

On Tue, Nov 10, 2026 at 11:31:35AM -0600, Logan Gunthorpe wrote:
> Add sysfs configuration options for switchtec-dma channels, using
> dma_device.chan_groups the same way the ioatdma conversion does:
> attach a "switchtec-config" attribute group directly to the channel's
> existing struct device, with each show()/store() recovering the
> struct dma_chan via the dmaengine_chan_from_dev CLASS.
>
> The read-modify-write of the shared perf_cfg register is protected by
> hw_ctrl_lock, and writes are rejected with -EBUSY while the channel is
> allocated to a client (hw_cfg_locked), instead of a TOCTOU-prone
> chan->client_count check.
>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/switchtec_dma.c | 179 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 179 insertions(+)
>
> diff --git a/drivers/dma/switchtec_dma.c b/drivers/dma/switchtec_dma.c
> index a386c3a284e6..1ebe17095c61 100644
> --- a/drivers/dma/switchtec_dma.c
> +++ b/drivers/dma/switchtec_dma.c
> @@ -132,6 +132,11 @@ struct switchtec_dma_chan {
>
>  	/* Serialize hardware control register access */
>  	spinlock_t hw_ctrl_lock;
> +	/*
> +	 * Set while the channel is allocated to a client; blocks sysfs
> +	 * hw config changes
> +	 */
> +	bool hw_cfg_locked;
>
>  	struct tasklet_struct desc_task;
>
> @@ -1029,6 +1034,10 @@ static int switchtec_dma_alloc_chan_resources(struct dma_chan *chan)
>  	dev_dbg(dmaengine_chan_dev(chan), "MRRS:        0x%x\n",
>  		FIELD_GET(PERF_MRRS_MASK, perf_cfg));
>
> +	spin_lock(&swdma_chan->hw_ctrl_lock);
> +	swdma_chan->hw_cfg_locked = true;
> +	spin_unlock(&swdma_chan->hw_ctrl_lock);
> +
>  	return SWITCHTEC_DMA_SQ_SIZE;
>
>  err_ring_inactive:
> @@ -1046,11 +1055,180 @@ static int switchtec_dma_alloc_chan_resources(struct dma_chan *chan)
>  	return rc;
>  }
>
> +static __always_inline ssize_t perf_cfg_show(struct device *dev, char *page,
> +					     unsigned int mask)
> +{
> +	struct switchtec_dma_chan *swdma_chan;
> +	struct chan_fw_regs __iomem *chan_fw;
> +	u32 perf_cfg;
> +	int value;
> +
> +	CLASS(dmaengine_chan_from_dev, c)(dev);
> +
> +	if (!c)
> +		return -ENODEV;
> +
> +	swdma_chan = container_of(c, struct switchtec_dma_chan, dma_chan);
> +	chan_fw = swdma_chan->mmio_chan_fw;
> +
> +	rcu_read_lock();
> +	if (!rcu_dereference(swdma_chan->swdma_dev->pdev)) {
> +		rcu_read_unlock();
> +		return -ENODEV;
> +	}
> +
> +	perf_cfg = readl(&chan_fw->perf_cfg);
> +	value = field_get(mask, perf_cfg);
> +
> +	rcu_read_unlock();
> +	return sysfs_emit(page, "0x%x\n", value);
> +}
> +
> +static __always_inline ssize_t perf_cfg_store(struct device *dev,
> +					      const char *page, size_t count,
> +					      unsigned int mask)
> +{
> +	struct switchtec_dma_chan *swdma_chan;
> +	struct chan_fw_regs __iomem *chan_fw;
> +	ssize_t ret = count;
> +	u32 perf_cfg;
> +	int value;
> +
> +	CLASS(dmaengine_chan_from_dev, c)(dev);
> +
> +	if (!c)
> +		return -ENODEV;
> +
> +	swdma_chan = container_of(c, struct switchtec_dma_chan, dma_chan);
> +	chan_fw = swdma_chan->mmio_chan_fw;
> +
> +	if (kstrtoint(page, 0, &value) < 0)
> +		return -EINVAL;
> +
> +	if (value < 0 || value > field_max(mask))
> +		return -EINVAL;
> +
> +	rcu_read_lock();
> +	if (!rcu_dereference(swdma_chan->swdma_dev->pdev)) {
> +		ret = -ENODEV;
> +		goto err_unlock;
> +	}
> +
> +	spin_lock(&swdma_chan->hw_ctrl_lock);
> +	if (swdma_chan->hw_cfg_locked) {
> +		spin_unlock(&swdma_chan->hw_ctrl_lock);
> +		ret = -EBUSY;
> +		goto err_unlock;
> +	}
> +
> +	perf_cfg = readl(&chan_fw->perf_cfg);
> +	perf_cfg = (perf_cfg & ~mask) | field_prep(mask, value);
> +	writel(perf_cfg, &chan_fw->perf_cfg);
> +	spin_unlock(&swdma_chan->hw_ctrl_lock);
> +
> +err_unlock:
> +	rcu_read_unlock();
> +	return ret;
> +}
> +
> +static ssize_t burst_scale_show(struct device *dev,
> +				struct device_attribute *attr, char *page)
> +{
> +	return perf_cfg_show(dev, page, PERF_BURST_SCALE_MASK);
> +}
> +
> +static ssize_t burst_scale_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *page, size_t count)
> +{
> +	return perf_cfg_store(dev, page, count, PERF_BURST_SCALE_MASK);
> +}
> +static DEVICE_ATTR_RW(burst_scale);
> +
> +static ssize_t mrrs_show(struct device *dev,
> +			 struct device_attribute *attr, char *page)
> +{
> +	return perf_cfg_show(dev, page, PERF_MRRS_MASK);
> +}
> +
> +static ssize_t mrrs_store(struct device *dev,
> +			  struct device_attribute *attr,
> +			  const char *page, size_t count)
> +{
> +	return perf_cfg_store(dev, page, count, PERF_MRRS_MASK);
> +}
> +static DEVICE_ATTR_RW(mrrs);
> +
> +static ssize_t interval_show(struct device *dev,
> +			     struct device_attribute *attr, char *page)
> +{
> +	return perf_cfg_show(dev, page, PERF_INTERVAL_MASK);
> +}
> +
> +static ssize_t interval_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *page, size_t count)
> +{
> +	return perf_cfg_store(dev, page, count, PERF_INTERVAL_MASK);
> +}
> +static DEVICE_ATTR_RW(interval);
> +
> +static ssize_t burst_size_show(struct device *dev,
> +			       struct device_attribute *attr, char *page)
> +{
> +	return perf_cfg_show(dev, page, PERF_BURST_SIZE_MASK);
> +}
> +
> +static ssize_t burst_size_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *page, size_t count)
> +{
> +	return perf_cfg_store(dev, page, count, PERF_BURST_SIZE_MASK);
> +}
> +static DEVICE_ATTR_RW(burst_size);
> +
> +static ssize_t arb_weight_show(struct device *dev,
> +			       struct device_attribute *attr, char *page)
> +{
> +	return perf_cfg_show(dev, page, PERF_ARB_WEIGHT_MASK);
> +}
> +
> +static ssize_t arb_weight_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *page, size_t count)
> +{
> +	return perf_cfg_store(dev, page, count, PERF_ARB_WEIGHT_MASK);
> +}
> +static DEVICE_ATTR_RW(arb_weight);
> +
> +static struct attribute *switchtec_config_attrs[] = {
> +	&dev_attr_burst_scale.attr,
> +	&dev_attr_mrrs.attr,
> +	&dev_attr_interval.attr,
> +	&dev_attr_burst_size.attr,
> +	&dev_attr_arb_weight.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group switchtec_config_group = {
> +	.name = "switchtec-config",
> +	.attrs = switchtec_config_attrs,
> +};
> +
> +static const struct attribute_group *switchtec_groups[] = {
> +	&switchtec_config_group,
> +	NULL,
> +};
> +
>  static void switchtec_dma_free_chan_resources(struct dma_chan *chan)
>  {
>  	struct switchtec_dma_chan *swdma_chan =
>  		container_of(chan, struct switchtec_dma_chan, dma_chan);
>
> +	spin_lock(&swdma_chan->hw_ctrl_lock);
> +	swdma_chan->hw_cfg_locked = false;
> +	spin_unlock(&swdma_chan->hw_ctrl_lock);
> +
>  	spin_lock_bh(&swdma_chan->submit_lock);
>  	swdma_chan->ring_active = false;
>  	spin_unlock_bh(&swdma_chan->submit_lock);
> @@ -1313,6 +1491,7 @@ static int switchtec_dma_create(struct pci_dev *pdev)
>  	dma->device_terminate_all = switchtec_dma_terminate_all;
>  	dma->device_synchronize = switchtec_dma_synchronize;
>  	dma->device_release = switchtec_dma_release;
> +	dma->chan_groups = switchtec_groups;
>
>  	rc = dma_async_device_register(dma);
>  	if (rc) {
> --
> 2.47.3
>
