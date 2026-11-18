Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795033391;
	b=ZxV5tEx6SUIxhPd7gu5EH1Bg/S3EysBTMiMOsDHRlf+EliM8/Y3B7+DGxzsTtcUEEWev
	 EnksktCoQzgSzkpGIlUTPUDQGIXQEqJUxf0/xnk4+Qk7KVXAoyD8QXaWhrXck5m8r5luj
	 0o90EzGfF2UboJ2nYO/sukp2r9/ex5XkeaoLtxvE2tVmw5cBL1A/2Wt+pDxiZEnUsXG7+
	 DQctDK3VS5ndy4qjMvoBGtF6LCVxjHt9D/A0ZeL8PHZH7DhTtlraeW9z1IBFmlwKEx2XZ
	 Ih9+/sdblAmtv7Q+4UPDWRzOJhiB5ZziTxWHfCaq6uyYNp5CvxI3QhrySk9gdj4nhkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033391;
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
	bh=c5Wd/mbiuhSd7Q59d1xY3xfL46fGNSd68N6oAbY/qEo=;
	b=OfixHuwhXQVitJrlKr23zVRJrtGf7Z2cRJaKlA+C9yzeNqcSrqkyS//x2+QDO+66PUW6
	 TFrIL4sRbP1gH8bvrKEJMV27jQ2lK0whpCG4sXvj1dsCdbPnXQPtLr3+I3z7z08kmBpYA
	 C7+yR19EbO2j1t+WGmlYswSM9hsWrQTTfE5PZDV9xWUtXPdjx/ZGX9/6dyp4nfuBfT/Jm
	 sspPXLnNNxXPRo1FsUhSYevfy9XLCfTQvTVT0mu2ASTdigdiRPx1ifm7X+8wGm136Xq9W
	 I58hq3CiChSIGO8/T0Fdw0+fbxMz8tArPfDmoj06YMVZsqrAy0QvwaAXoh65pcieOVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AW3uqCH6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.15
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013015.outbound.protection.outlook.com [40.107.159.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A8560A260C;
	Wed, 18 Nov 2026 20:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8A8560A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AW3uqCH6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oC0dXNe7MRlEQxGPGMmWHwZZpeYioyoHeFHbQH6bbvWAsOMxr58GDPB6A+r1FPUZD1FSfo67RBG4AIll5VEEoDO1hOSg26QomatjnJE7MZfQtS3aSD77naFpuludHngbVrddE2//WFGXc6GzKgKu7Dk+4Jvu9nWKAKXmxNY+LL6PPtjBUP0iM1HuRTP6dKHK19HyyZujxrjLbIvMLNeXJfOqhT8kHmspo1uBgUBPQxc7R2/qhXSfCoVBparzCghYQ26I9RK195M9k4v4l/0GlZBilsJS8lDX16l3hW0JHXX9MIKr/c6k++9+6PNS8xTnDo9lb3RejAHLw/KO637XNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5Wd/mbiuhSd7Q59d1xY3xfL46fGNSd68N6oAbY/qEo=;
 b=LjwMo8XnYevJUCiyyHJMcrfP+0SJ7OMnv6+zlAN8XWqCAcf3TKZLASQv4879QPoC5abUwZQmLHa11O3AqLmF0oOTU4cOBkY1/zFQxRH3vOKyLaw7FeMZ2+qdzIANiakeoBFE57LZYG3IrzOO0EqzDqxkhpTiSD0PC5Ws57kXgYcPbhqijbcYh1cAZv60zO9aKwpriI1px771bu2Bct4MtgMcekAokDVDmfK1QuUNnrENWzG5ZoDZI/rTQK8YUP9v75BMJSEtSBcHMQ7kwSuueqNsk98GYU7g2aZkjUDB5xLc0Cla2FItmY7mxA8wHnFYJHEVEGkgdkn2CNw516Vtaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5Wd/mbiuhSd7Q59d1xY3xfL46fGNSd68N6oAbY/qEo=;
 b=AW3uqCH6JWqzB8S3bMRsnTtKM11n59JnjAfArEGJtUZxtexvROyIODqVZIH6pxWmxhjaQKs8C+9QvPzSZqILDPVmf1QYD3jTPp3/xJ1gqxCgaQC1BqV5iAw8dvR6hFdft5EMf4lM0y1Fl+N+ODfGc2zDIGJfXX1gCK8MSKehd2k7OM9R7aRPX9wkuvwMN60OGVINzI0qtGAyFWqIFWi323ebSP3i+BTrljwrqrKoUlDtbcgFpEfF+AVymP8sJEMMAyfCDhSildjcTd+ORjk9hb3L+h3dCm4LvZxqzTM+7VoOrjbzv83gslKWmVUploKZA9okXP9AsIIyvmUgMzxmew==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM8PR04MB7938.eurprd04.prod.outlook.com (2603:10a6:20b:24e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 20:23:07 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 20:23:07 +0000
Date: Wed, 18 Nov 2026 15:23:00 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.li@nxp.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Dave Jiang <dave.jiang@intel.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Kelvin Cao <kelvin.cao@microchip.com>
Subject: Re: [PATCH v4 1/4] dmaengine: add per-channel sysfs attribute groups
 via chan_groups
Message-ID: <av4JJDXTJ1FZtDpe@lizhi-Precision-Tower-5810>
References: <20261110173137.623764-1-logang@deltatee.com>
 <20261110173137.623764-2-logang@deltatee.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110173137.623764-2-logang@deltatee.com>
X-ClientProxiedBy: PH3PEPF0000409C.namprd05.prod.outlook.com
 (2603:10b6:518:1::48) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 1a7d8451-cf5f-435a-9822-08df45b1c1d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|366016|23010399003|1800799024|18002099003|22082099003|6133799003|261026140227099003|5023799004|56012099006|261009223027099003|261102123227099003|261022115727099003|4143699003|11063799006|261021133027099003|261028144727099003|261102130727099003|261022105027099003|261021130227099003|261021121427099003|261021123027099003|261026130827099003|261021135927099003|261026121527099003|261022075727099003|261026135527099003|261022113327099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	lIE3Uu59U7UlxGUE0PM+DMfAA3LZPysbg3j2rH1de13zPOZ/nUphmTHSM8PCC4fdBNF2ZCSDI1kfmLj8cmWkIcjWK1qaAmLKpGx6t+IyamKNJlFiQLsUOFYIFrXAcP0BpDnOp5k+OF3Q5v9RLmGsJGDv3yFyHUw68YXRKtUxxQ9Rv5CmRmzlGpLhkt9gTfyVSAm/x6nlyFX1kvH6xCG8hRAsjokX2qvMhtx0i8CTNq8rqtwJPW4x22zl9lNW0vDCxHGTsiJMeQVHbXSxveU0EjAe4su6ytMfy1968ZWe7s2uSnYhXMGMMKFRsPW5j9em1jnNBKpT3MLWZP7fnT90ACyi4EiD4xm052fUMjzALMuwg/t/IqmDmluWphDnmOFdHMlpYeJ/JgY1fskWCe35r4EJbYzImeiU8BPE4xw4H9C6Mu7eDoJWobkwpxbXaBqAQ+9bUew5YRbrO7HE1uYooK+4qgT2Ui2vQvZkNJZWxvxnieeXJ6lWRCO/+RsRCcLq4JcPSug0ym/ynkFZWGNPdGsB38QC6JZySZrZYxzT1Mq8uk+/P47i2wgfUvwjN909W7nqozqyEziuJHlUtdwaYvsGEbfVkb7c+TGLAScnpum60QoZeVTWLH6viHpy7v9aHo1OrvhtHCkrW4CJ58dagI4n0CWXAZns8nHzFmSL3cQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(261026140227099003)(5023799004)(56012099006)(261009223027099003)(261102123227099003)(261022115727099003)(4143699003)(11063799006)(261021133027099003)(261028144727099003)(261102130727099003)(261022105027099003)(261021130227099003)(261021121427099003)(261021123027099003)(261026130827099003)(261021135927099003)(261026121527099003)(261022075727099003)(261026135527099003)(261022113327099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4ABNk8txP2gywWNoSnFZ32WPENSljcqj4WftlRITeUC0H+pwD4dAjy/NAveJ?=
 =?us-ascii?Q?2+unQehH2Ljp6OdrUV7R6smXxu/89UWm7D+NdeMphEsCIR3ab73Nbk/IOyWO?=
 =?us-ascii?Q?kcXoVyqxL8YlAnqfbAKOV+WJ0NFlfwkHGDTVFYL7c97fyXmVdfDk5gF3nrE9?=
 =?us-ascii?Q?JWIm0v9zhsvkzpMdTN/XsFo32XFvyvxNiV4Iql8/a2h3ynbvqN//6UjAkHt9?=
 =?us-ascii?Q?oK4gQXbQq15jtAbTYG/8J0RXGfjxgeKGZRC97sHUUimRA5CwMY06t+rLgZdU?=
 =?us-ascii?Q?/vAWCgkNCKhM67Jl8y91o/WIu78fAj3Y5BwZReev/KJsehD7R8AZuDSznBME?=
 =?us-ascii?Q?gPSRgmYKDgU7tEA+6sJfUvtysXFqnvRqNS5t+kvgEmmJaG1sUh/nSrkJUt4X?=
 =?us-ascii?Q?kAhfRr09y0irNIZgpit9U1vor2IbAnvjoa5koYU+wqEFhYz+/S6ZMzM9og9/?=
 =?us-ascii?Q?L5bFIGSvUFv4en8PriyRZdNqVjR2NpW6Abu6x8wc8UTcTixsav70H/Y53bI+?=
 =?us-ascii?Q?h/tUBTNfLX7QaOTI/gw0tkuujrTtQYAG6F2/pOlvy2Zh8717KTCumWRZabV9?=
 =?us-ascii?Q?g0YXpmeL+lG8VSs7rjVZ8hlp+0q0avYvw2d8Wy1IBUjcyM12XUdImnHxHAjj?=
 =?us-ascii?Q?IdOy7DKqEmf9hllILw2AtEpEpZV+pCjgtDP2JXCNGqn8SSDM+JKuhTRv8igh?=
 =?us-ascii?Q?AlcOMGJ/Y+J8dC2h69sNL5Zq9QmlZq/I0kKWqYvsQcGM+9FBxKtkIQutpyxU?=
 =?us-ascii?Q?wwR7TLXbvVdX2QmpGDoL8gYXFRUUOPgTZZwPIKzaFNQ7bsqdrg4yrYGK6HvY?=
 =?us-ascii?Q?jHeg0nZ8B+jnB/xZDXaTwPjAKuHWl33QaFB9J0k3NnObLhWxsDRGMKuThxJD?=
 =?us-ascii?Q?9TgIOKRTRbNp9NwSYkH3pWAMiA1LM2eSmvbWDXlBvYVHORrEdtZyeyo6Z9Vk?=
 =?us-ascii?Q?Zn3d+km1snJJRX9WUgYg+QD4aKw6qwh7GGJWi7bc+hJleFdWWuwXcobewCUd?=
 =?us-ascii?Q?wqS3vySqglxeXjAvc1NDNaJw5VrJiFd01lD1j9fRGvhc/ewAlL/G8sAP2Zhl?=
 =?us-ascii?Q?w1tr8CHO7ctQdOowv0Zxrl15WlPCoUSNDmpHiVSAaP3NFdTWX/hOnKqBS7/0?=
 =?us-ascii?Q?rPiAdQwKZ3IrKPOoEJPsBmlDgo7GyfzqrEGQ/DxEKAF1P67UfElz8ec731zc?=
 =?us-ascii?Q?ivQkLNsGTxnMhZ7pqt8OpFmViSFWkz5MaEWA0pQPMUnRD52Bj/3+g2lRWSzA?=
 =?us-ascii?Q?XtKe0TOJVd3dCmwbyByuoTXJ13w923YELIwKMDcljiOkfI+LdnW2cZNpoFgw?=
 =?us-ascii?Q?HTCEFlltwfOl+liSqK29qRnbCu5aCkdyPuHLIi1xJVl7ipSyfcPodAK408dv?=
 =?us-ascii?Q?cxPp2NcCeBMnWlo2OPRMctK77OxOSS+JeUuxJtCU/raVFaxOMz59bRYiwWb5?=
 =?us-ascii?Q?Gr80eYmtOkiheT+C9ZvtoXz/4LR0HUams0p7z9ZfGnvi3jXUNvsiuI20Mrge?=
 =?us-ascii?Q?dZeo2W/7JexAn+LTP1AjZ2yBKPi8AQZRMH7tNiRgWv0xQBvEXgeYpBrOrhV/?=
 =?us-ascii?Q?9PA/4EukHwbBzmkD5DQ2veZA6l4N45P7SCs9SYssTeTMxctaFzySKyPWxkRc?=
 =?us-ascii?Q?pqwLNIDia4Y/tp3RuRrphbd+y9x6WoczP6x3WkW+ymAxojjo1NODfrC8aILu?=
 =?us-ascii?Q?Qo2sIgiv56wRqXFRwrP1RieAnhr8pRNlzHZPNf39jVedoDZPh4AcJWr/xaim?=
 =?us-ascii?Q?zjSZ51tXmpSiWLbLRj3/OhjGv+tvwHwyIbC6DvApMzl2IDMY4vR6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a7d8451-cf5f-435a-9822-08df45b1c1d5
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 20:23:07.4995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okCgZUplA48Yfv7lPbLmU4FEOxrUjj8VdA0mxGp8eeKxRk5UkCqnYRukhKrZo6ZD9mYuZiFWHV79+bu6UU49ZzTZ0c5X4hN0wSvFrrIrJt/fA6Tp4kUG7+Nq/GsCCuyb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7938

On Tue, Nov 10, 2026 at 11:31:33AM -0600, Logan Gunthorpe wrote:
> Each channel already gets its own struct device (dma_chan_dev),
> registered with device_register()/device_unregister() and torn down
> correctly by chan_dev_release(). Let drivers add their own sysfs
> attributes to that device directly, via a new dma_device.chan_groups
> field.
>
> This avoids drivers needing a second, separately-managed kobject to
> expose driver-specific attributes. That's a use-after-free issue:
> kobject_put() can invoke the ktype's release() and free the structure
> embedding dma_chan while the core (or the driver) still expects to
> reference it afterward, so avoiding it requires careful ordering and
> bookkeeping that's easy to get wrong. The channel's struct device
> already has the correct lifetime, and sysfs_create_group() supports
> the same named-subdirectory layout (attribute_group.name) that a bare
> kobject would provide.
>
> To let show()/store() callbacks safely recover the struct dma_chan from
> the struct device they're attached to without exposing dma_list_mutex
> itself to drivers, add a small dmaengine_chan_from_dev_lock() /
> dmaengine_chan_from_dev_unlock() pair that take / release the lock, and
> wrap them in a dmaengine_chan_from_dev CLASS so callers can write:
>
> 	CLASS(dmaengine_chan_from_dev, c)(dev);
> 	if (!c)
> 		return -ENODEV;
>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>


>  drivers/dma/dmaengine.c   | 27 +++++++++++++++++++++++++++
>  drivers/dma/dmaengine.h   | 19 +++++++++++++++++++
>  include/linux/dmaengine.h |  4 ++++
>  3 files changed, 50 insertions(+)
>
> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 34be53487a21..38f601bf41e1 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -161,6 +161,32 @@ static struct dma_chan *dev_to_dma_chan(struct device *dev)
>  	return chan_dev->chan;
>  }
>
> +/**
> + * dmaengine_chan_from_dev_lock - take dma_list_mutex and convert a channel's
> + *	struct device to its dma_chan
> + * @dev: the channel's struct device, embedded in struct dma_chan_dev
> + *
> + * Returns NULL if the channel has already been unregistered. Pairs with
> + * dmaengine_chan_from_dev_unlock(); see the dmaengine_chan_from_dev CLASS in
> + * drivers/dma/dmaengine.h.
> + */
> +struct dma_chan *dmaengine_chan_from_dev_lock(struct device *dev)
> +{
> +	mutex_lock(&dma_list_mutex);
> +	return dev_to_dma_chan(dev);
> +}
> +EXPORT_SYMBOL_GPL(dmaengine_chan_from_dev_lock);
> +
> +/**
> + * dmaengine_chan_from_dev_unlock - release the channel lookup lock
> + * @chan: unused; matches the value produced by dmaengine_chan_from_dev_lock()
> + */
> +void dmaengine_chan_from_dev_unlock(struct dma_chan *chan)
> +{
> +	mutex_unlock(&dma_list_mutex);
> +}
> +EXPORT_SYMBOL_GPL(dmaengine_chan_from_dev_unlock);
> +
>  static ssize_t memcpy_count_show(struct device *dev,
>  				 struct device_attribute *attr, char *buf)
>  {
> @@ -1117,6 +1143,7 @@ static int __dma_async_device_channel_register(struct dma_device *device,
>
>  	dmaengine_chan_dev(chan)->class = &dma_devclass;
>  	dmaengine_chan_dev(chan)->parent = device->dev;
> +	dmaengine_chan_dev(chan)->groups = device->chan_groups;
>  	chan->chan_dev->chan = chan;
>  	chan->chan_dev->dev_id = device->dev_id;
>  	spin_lock_init(&chan->lock);
> diff --git a/drivers/dma/dmaengine.h b/drivers/dma/dmaengine.h
> index 42a3cfa7e597..f03248a091df 100644
> --- a/drivers/dma/dmaengine.h
> +++ b/drivers/dma/dmaengine.h
> @@ -214,6 +214,25 @@ int dma_async_device_channel_register(struct dma_device *device,
>  void dma_async_device_channel_unregister(struct dma_device *device,
>  					 struct dma_chan *chan);
>
> +/*
> + * dmaengine_chan_from_dev_lock() / dmaengine_chan_from_dev_unlock() bracket
> + * a critical section across which a channel's struct device can be safely
> + * converted back to its struct dma_chan: dmaengine_chan_from_dev_lock()
> + * returns NULL if the channel has already been unregistered, and the lock
> + * it takes must be held for as long as the returned channel (or anything
> + * derived from it) is accessed.
> + *
> + * Use these through the dmaengine_chan_from_dev CLASS below rather than calling
> + * them directly.
> + */
> +struct dma_chan *dmaengine_chan_from_dev_lock(struct device *dev);
> +void dmaengine_chan_from_dev_unlock(struct dma_chan *chan);
> +
> +DEFINE_CLASS(dmaengine_chan_from_dev, struct dma_chan *,
> +	     dmaengine_chan_from_dev_unlock(_T),
> +	     dmaengine_chan_from_dev_lock(dev),
> +	     struct device *dev)
> +
>  #ifdef CONFIG_DEBUG_FS
>  #include <linux/debugfs.h>
>
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index 805668fbe437..944c8b0f5848 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -839,6 +839,9 @@ struct dma_filter {
>   * @dev: struct device reference for dma mapping api
>   * @owner: owner module (automatically set based on the provided dev)
>   * @chan_ida: unique channel ID
> + * @chan_groups: optional NULL-terminated array of sysfs attribute groups
> + *	added to each channel's struct device, for driver-specific per-channel
> + *	attributes
>   * @src_addr_widths: bit mask of src addr widths the device supports
>   *	Width is specified in bytes, e.g. for a device supporting
>   *	a width of 4 the mask should have BIT(4) set.
> @@ -923,6 +926,7 @@ struct dma_device {
>  	struct device *dev;
>  	struct module *owner;
>  	struct ida chan_ida;
> +	const struct attribute_group **chan_groups;
>
>  	u32 src_addr_widths;
>  	u32 dst_addr_widths;
> --
> 2.47.3
>
