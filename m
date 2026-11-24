Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795550571;
	b=Rhva6CuWB29J6ABA+AosxCeNP8RuZgXGAhKWogJYWabLZivhQeYZc4hWeSLUOtHlpwIx
	 ImFkVEeBlQ9KSYVGgUUlCoN/yr2ZPlt9ZgWcXBYEnPNrmvcAKqyJ6TWbTckAtsKY4WyBQ
	 AyQVC97AuOYB2AgFhsc4Qoo0LAmrEZ3NP3kh6m5+leXTQ/hrMlmqP5uD/45XBimDqsdu2
	 WElzA+VG4w1AeIvQMSX1IItYEbz2iJdwqvNkIizTK/QT00audMvgVwR6GQpUuD+qWyIGC
	 ba7h8h+Bva21LsNp2lX6j7qTsh0WVpKdYx0XigE+UNsj+paRqOyyFuz6B4DNT/L8gDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550571;
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
	bh=TOdFJ0Y0VoEYXHvR3+vq+I9ekp5syys3haJVv0ZoZX8=;
	b=36QGoOHSiY/mniQAMsSYde4kFYA4x13sfQ4tJlLHYhAkpmhFrGgpYfEHah2VyM0fJfTA
	 fQ3z9tT5+tl6LDWevGR0oUU1ZPffODp/f982EqzEFU1Df2S3h+FpTMO5m1iPdOggbPfcY
	 JN6PFPNZXpmeMuy2baGYzJTCuV5SrriamFzWmZPFEAiW7eyrbmdpo/GAI1d+cvFGquIbn
	 2Zd/kFrcj3MfstrPybCiTvIHZ5SCRFS5GZ8+0SZH5ANLgcbKRSPUGUYputxCdXEZiOVS6
	 Nc09/ZP+Oa1b3nqgjOJ4+x7o/xBRJhCf5GAEByerESZ5+6uAbF22OYXWC5BGh1zB8ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Vti0qYt9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.55
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013055.outbound.protection.outlook.com [52.101.83.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A222E606A31E;
	Tue, 24 Nov 2026 20:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A222E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Vti0qYt9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5yIGbAG/yi9icm+OUj6GD29gCFxgleMHnQG6N3BNKrDeBG3U2QJHidMgsJD5EERMSnFC7/QGfiFqQOMOd6JLaAYpck0KpZ19mpeITkwM2IBljlPgE8X1mIi4y2+h/gwnGrqAAyzX6q2HYSi6NNWWTSZhWblNGcY4RUeJv2/izoit2G9V7A8IAi6ZEyeHSV/pN+DsXvzlzHsE8sSKClikE3JrIEu55cX21iM5ie4idVwxQc7Zcj3oycpWQpouJmGCmkEBAFLyIyOEG+slXz/wX4fmOQNXw1Dz8UbPhNEEKEH7mB2nDVY0lT0KWX5luTzqFTemJCFqv/SPQuxS829eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOdFJ0Y0VoEYXHvR3+vq+I9ekp5syys3haJVv0ZoZX8=;
 b=fDiTMc4vYsPL0XlT1kM7o72d2/Qe6koHDJDeiswPY0CQETXuFugrp2GkID0cmhLGPk4FB8JpM8cJR1ELoCG5yYD5yARbL0tEg6tAbqqM74DGMZAKDRqfSe7GVljzPz38sZLMSmHctOeeQuUU5KgQSZ6OriE3nT2WcAC5o1KzO1yi5rjQA/Hiuc7Qa7X8KsUkgo4cKGsZKExZy13MlGi3y/27lX6Mv2QIzw6p1VC5PbNi/HsYML8l8xmZVf3dWnlJMj85H2pEz7MVOfq9jomWKe4fwDev2eaL8Xq96sxoCjza4YL6CVtU+V+dbddGIzCo52TIW1pvRLJrELxtEMfQLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOdFJ0Y0VoEYXHvR3+vq+I9ekp5syys3haJVv0ZoZX8=;
 b=Vti0qYt9O3D6MNNJNraQXFWHPWWvsqwG7wevs/vlaBNral5Qt/gzxtfJLNZ8Y9BLLogxNgNemQZeRLMP6Vtt7Re3LqhCOC2Y3S32mBg4DspRovO9mI3zas0cfZrr3yqI50YbFqlaDCKstY8dLct1534OckeDEaBZYxIaHbbhGt0k20Tf9UX9lckC33SG30Fr+asx8IJ5v8XK8izFv8SLtjEJLyhZ1dKKKvex2pigKQe3/nLzaFLuxIUxq6GPiCW9mMaarz5VdWlF+5l4k5bFIrNhxGndm3XibHfmA8Xfj3MyBD49rusWloH3ZZPpdcXQ3ESc+QwLuk9R7OZbiuetkQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by BR2PR04MB047874.eurprd04.prod.outlook.com (2603:10a6:2c8:2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 20:02:47 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Tue, 24 Nov 2026
 20:02:47 +0000
Date: Tue, 24 Nov 2026 15:02:42 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Vinod Koul <vkoul@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Frank Li <Frank.Li@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	dmaengine@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dmaengine: bcm2835-dma: Convert to managed
 resources
Message-ID: <awXtYopcyh3YvxlP@lizhi-Precision-Tower-5810>
References: <20261119-bcm2835-dma-of-dma-free-v2-0-ebde4846d206@yahoo.pl>
 <20261119-bcm2835-dma-of-dma-free-v2-2-ebde4846d206@yahoo.pl>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119-bcm2835-dma-of-dma-free-v2-2-ebde4846d206@yahoo.pl>
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|BR2PR04MB047874:EE_
X-MS-Office365-Filtering-Correlation-Id: 251235db-75c0-43fe-8471-08df4a65e936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|19092799006|261102123227099003|10067099003|11063799006|261009223027099003|5023799004|4143699003|56012099006|261028144727099003|261021121427099003|261022075727099003|261026140227099003|261021123027099003|261026121527099003|261022105027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Zp9pq+Tv0SE0CNyslxz1xlIWFwXO6PhRkQn2NqllrdmqStp0DmSKy83nXGnhR33pZdt1WILuByRA/feADRu2peje8GQH7dslsyRitlRTIC7BDxjIvgyS5VnD4v8w4XCv18O4IG2g3cmIIwmqobVCLcGSsYhdVxQgGNLfXw5CMcJHYNRtxYhhWXb26TnI5GaJx1/hNOrK8n4b7BKEpyq1z6QFS6n34qnCHy6LX8YQGGp61n1bDD8SCp5Mc9orAPH/Hg/1SEXkLEObS302vUqGGojhQi0ZBiHSIK4tvdJGSQOaqpywgAx4VjpFb6SYzV//SmdTcQwMq9+LiIcdVkE5DDhxsGUoPo8dlnKLgHpIKdoJViURd6rXfNkJdHdCX1joehhC/7msE/YrIKaMkmsbt3wN0QID4m3k3iSjquvXwEkFV6ocnsuc5gBB+dVmssfIPsZyo0OKzrGiMLFMjIQ/qoR6PMAuIHhi4Vcm03+FU8fKnLvMjr8J8pURs4eE8nMiA7r+/h5X3I97IR+8YvzWG7qgmAgbHRhyzW6vqcgRABR7mWL4E0VLLsy4DPp5XsVohn3Cn20oOMBAagyBjyZjqocyZnLr3GiM4GQ0ifbN4MkXRaLE8ff0GD/YSeiOsx+n9oxugrhkiNz4g9498RPXIfcoJUAPg8wgqCYNDXs/E9w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(19092799006)(261102123227099003)(10067099003)(11063799006)(261009223027099003)(5023799004)(4143699003)(56012099006)(261028144727099003)(261021121427099003)(261022075727099003)(261026140227099003)(261021123027099003)(261026121527099003)(261022105027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vMffN6TYKVeq2MxewzafEqGWxQaLfngDDGxq7VILqM2VAPlsbaYt9xmRFC86?=
 =?us-ascii?Q?7JCSF9k5du/efF90qumMoaGsDzYAd3JuraK9Vv1oeUXqx6wnfyvZbFRZFxwy?=
 =?us-ascii?Q?pu2/0i1CZ+ND0vnVXyH/tqPuNSneGe1FF4csn19abXx+Z8YPJHBRcWk7+JPH?=
 =?us-ascii?Q?X22a7z5EICyA3DlgBKABmWUm73wdqit/fh4eosA96sQu6og1Ok0CY7MZtk+U?=
 =?us-ascii?Q?kANEb1TzQae8lESgB6o90xgL0atEqZ9eO1iL+dOOSVhO8AYsvD7/QXNhpH4V?=
 =?us-ascii?Q?wtQ+kzsH0jyF3NsBM1Q18BCH4qTqboEWmgnhVTyOezGlsBOlH9cwf/X6IMhk?=
 =?us-ascii?Q?dMDISpL1jzwsH/nTBB4vVYhVD6USJodqDRuRtGCntqU9M6VN2w4agO8UZjbM?=
 =?us-ascii?Q?Pbb9+fxKv6LTOcs916LH4xQVfQi1/PNEKs0JdUmsaqh+xclMhzrBaqFu3JXE?=
 =?us-ascii?Q?ZQsIT/LWjk7NiW9xEjA9uxA5SALMg0+XwdMjgaBWVWKRDWDsm/liAGh1mMUO?=
 =?us-ascii?Q?3PwQC6W5YXYyf8ZoSb2IAH1RBn0Q1KEvUV8jevhsuIrWVPhMdMmFwaBRlkmS?=
 =?us-ascii?Q?TOG24w4w8CWZkZRHaKuYuD1pL7ujuAGEFtQsO1sQ+RV/MEz2s7NOm20dcpwR?=
 =?us-ascii?Q?a5D1o7Rg4/3FQXx0Ur8hTo95xbwRRdgRMK8n6mIescsi2PeMsouCtxcVhfWg?=
 =?us-ascii?Q?waCheUeYIjhMnWYMJ3PK0CV30gr8CskOLlyefL5ZHunvKm1reCluAwGb+80P?=
 =?us-ascii?Q?ZcIlz0oBCJyenqyroB4CuLTOctZNWVSQg32maig3v1Lzc5YjEAohik8ugjsD?=
 =?us-ascii?Q?GeYztOMZtSKT5fJ6r3OzfytS329MOBgj18KaO6mRKiOxco49O914Xy7w/gAX?=
 =?us-ascii?Q?DTXF2hmdPFsIUeZ1h/sNBZydDdJ+1dNE3rgK93HuWrJKnmG7jy7HmHnfU5jU?=
 =?us-ascii?Q?AW0eyiNMRUXwvZSHAT+zZ7TF9ERBePqT4CID2QyBRMnQYnJ+36zk8dqGgJHc?=
 =?us-ascii?Q?ZUo7HSlPfXEuhXxciSoQe5y121PX5CEkchGJ6Zc4F0ll0ADWo8JRRF3KlKsE?=
 =?us-ascii?Q?7IaDsNquUqdHv+WaSDlPaCEA/Rt9RTv1ajecotGVjWiCDKDvjxCIvaetuSEe?=
 =?us-ascii?Q?8FsGnYFXrOpmRvg7EokkAJdgWUjRHZaybYG9jnZJZqRPE6e2xshthF0hZHbf?=
 =?us-ascii?Q?IkPZYkq/iDx3c3TUszJbg0RgG7AnmhTqHfG2MEKq3gVP2GR3BYd3q1CrOaZ1?=
 =?us-ascii?Q?en0WIqjX1qh8sJyerWt14g+d8VJw/7ks4VtyufmNiOC+ZbP3R9uFBNhs4+NZ?=
 =?us-ascii?Q?0JPlk6RY7c5WOCep6g6oDwgR6Q6L+YvjhLTBxVXRfElzjMKUinsIn/mUJDle?=
 =?us-ascii?Q?zbOBS13Ah9SyxNjNb9Oy72mDHein+CBQ9iiLnQYpYkb94cWlGEd5y5dQWzg8?=
 =?us-ascii?Q?rbmeJKKBVP9oe9sS+uT9JhkRzaB1mkzCeX0Y+VfQCOwB6PAH8XdrjSBZWNSW?=
 =?us-ascii?Q?d6S40S9bWOZR8n7gDfS+gbcCf6sU1PtIsMdnqvSJcSIPZw0DpjCj8IcUgegR?=
 =?us-ascii?Q?hzoiiDsxfCQwDe0ApeU8TeaMOW8LmdCocqTw3Y6Gf/YTkt24cibTV1NdwvMY?=
 =?us-ascii?Q?rWCCchlttzyDbxxln+ZHPWPB8E/km6tp9kTe/02mV4vQ47Gruj7cuulSeQGL?=
 =?us-ascii?Q?X7HZKKP9vhXS129jBx0kMSnSQmmg87/D8So3qwOkK1OsK2B4YSNJs7VRuApp?=
 =?us-ascii?Q?shCEJqtGTD+lSyoyxFL6/aiUw0Q5qklKsBUZ9ytTnSvnCeuaMYLN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 251235db-75c0-43fe-8471-08df4a65e936
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 20:02:47.6713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njHJyzVoPSJNq3FQqE3Riqn70LBZBHRlL9BhPQIO8z2z1G7NsqWuqPfNobr/Xin+9UVw4L5J8KoA2P2SC5B0jV9xOjhno3RgUvg/plAF86gen52cDBOb8G0KHcjRscDe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR04MB047874

On Thu, Nov 19, 2026 at 09:38:30PM +0100, Tomasz Unger wrote:
> bcm2835_dma_probe() registers the OF DMA controller before the DMA
> device. A client probing on another CPU can therefore reach
> bcm2835_dma_xlate() and dma_get_any_slave_channel() while the device
> is not registered yet, and if dma_async_device_register() then fails,
> the driver data is freed while that client may still hold a channel.
>
> Convert the driver to managed resources and register the OF controller
> last, after the DMA device. As devres releases resources in reverse
> order, the OF controller is now also freed first, before the DMA
> device is unregistered, both on remove and on the probe error path.
> This makes bcm2835_dma_remove() and the error labels unnecessary.
>
> Channel teardown and the zero page unmap become two separate devres
> actions. The channels are devm-allocated after the zero page is
> mapped, so a single action registered at that point would run after
> the channel memory has already been freed and walk freed list entries.
> The tasklet teardown is therefore registered after the channels are
> initialized.

Can you keep commit message simple? AI create commit message is redundant.

>
> The bug was found and the fix drafted with the help of an AI coding
> assistant (Claude).
>
> Suggested-by: Frank Li <Frank.Li@kernel.org>
> Assisted-by: Claude:claude-opus-5-5

remove Assisted-by

> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
>  drivers/dma/bcm2835-dma.c | 56 +++++++++++++++++++++++------------------------
>  1 file changed, 27 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index cf29d897450e..b2da706d2e16 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -822,8 +822,9 @@ static int bcm2835_dma_chan_init(struct bcm2835_dmadev *d, int chan_id,
>  	return 0;
>  }
>
> -static void bcm2835_dma_free(struct bcm2835_dmadev *od)
> +static void bcm2835_dma_free(void *data)
>  {
> +	struct bcm2835_dmadev *od = data;
>  	struct bcm2835_chan *c, *next;
>
>  	list_for_each_entry_safe(c, next, &od->ddev.channels,
> @@ -831,6 +832,11 @@ static void bcm2835_dma_free(struct bcm2835_dmadev *od)
>  		list_del(&c->vc.chan.device_node);
>  		tasklet_kill(&c->vc.task);
>  	}
> +}
> +
> +static void bcm2835_dma_unmap_zero_page(void *data)
> +{
> +	struct bcm2835_dmadev *od = data;
>
>  	dma_unmap_page_attrs(od->ddev.dev, od->zero_page, PAGE_SIZE,
>  			     DMA_TO_DEVICE, DMA_ATTR_SKIP_CPU_SYNC);
> @@ -944,13 +950,17 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	}
>
> +	rc = devm_add_action_or_reset(&pdev->dev, bcm2835_dma_unmap_zero_page,
> +				      od);
> +	if (rc)
> +		return rc;
> +
>  	/* Request DMA channel mask from device tree */
>  	if (of_property_read_u32(pdev->dev.of_node,
>  			"brcm,dma-channel-mask",
>  			&chans_available)) {
>  		dev_err(&pdev->dev, "Failed to get channel mask\n");
> -		rc = -EINVAL;
> -		goto err_no_dma;
> +		return -EINVAL;

return dev_err_probe(), check below

Frank
