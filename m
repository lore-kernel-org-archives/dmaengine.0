Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013063.outbound.protection.outlook.com [52.101.83.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E565F4B2CBC;
	Mon, 31 Aug 2026 15:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191742; cv=fail; b=AYBzunMpHXxw1BohdB4o0u/mMqNorHwNbmLt1zBw4JuT0qLqbLF+64oRrz/4akl85iEXfSiG9bFLWBgTogvr2QTOc8yB3/Ei6aCCfD5GqYnyB297BGli1az9Y2Q/NyIxHbBqN3bwIvQXjduv8ewfvQFjO0DR5VVCv0EoyjAwLfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191742; c=relaxed/simple;
	bh=YZN9v9pSgp46yCtowYPjd32wragXt7u0IYCMWyQgaWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=G9Y4Q9UI7GsumUAShFS11l9CpzciLiR5vJdVkVwrYWiWUGTaOKJkvTjdnj/X/cgaVhgZEA/rxPBfhXSktc50U/DteRP8vz+U/vWtpyKBYyNPuCe4EuBFvlqNsX75xGJRdYZ+4EYoBq7KSssi378R1ZSbWaifEU4BhHf25VacuFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fmKc1xcp; arc=fail smtp.client-ip=52.101.83.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fmKc1xcp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqFnrbqi8NTXK9XD+llwiwtTNk4wteu/1GQBhkahHuqmXsa2CPoD1nrKYiEuhm8jhY/IdUN8NrcbQJG6UN+V06QzD15My9/myhgR2Q3rhu6b4Wp8BTb1+nA6dnwDT7C22N0iTZSLwLE5P3pyx3jD2wmozfvCAQc5gYLis5LBy9DnmfDYH18b8pXgRZr8srKuJBGRBsn+jyN+giM6tsx7FnLS+DdZkKpho6TOADBPsDRd4/89YY7RUsnLpJo1GVUl+8seikaJCbI12bkAE1BvjD70tnP5IKlGR9s29KnNb9Y7nmGfhizRB5fkHydsh+QvnC3TGDyZ6Xx+XiY8rVEmYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2zAh1/RM6E1AUzRWXnto+K0P81hu5UgkFQO9yoG6Dw=;
 b=YV1e4bghGr8xrWDM6V0zOJAZI3PvkHyDNhgEPOR4sYYiMPZ21Y2XFOeggEAmpqkybu1L5mPVvWW0xHgvTz787lcbwFJVkQADzHfnSJgvhKnyineTBj/QLX7srA79qS/prMbaPJsOBzQeCJMtiAFW7eeLkp/8Z+wfiuhuZXJZkT60crBLS0PIqs14VxOWXaXbTqZebwmWS7E1DleIAE+wjVWQmv8zrrxQqNLBmYyRiWg4b3xwXdwGXokuGCI7aGNNUDUH7Of7tavNIhKySkmcEyNASdDOsuR0+eatYJYQTlEPLDVqNyMEkF5WYTKb+tnu91K89GaK6KcYIp3KPAAZ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2zAh1/RM6E1AUzRWXnto+K0P81hu5UgkFQO9yoG6Dw=;
 b=fmKc1xcp5b286ZSR4E4+sWWn7rqa0Nwb6BCJGm++9WtdDPEU4GBKBBxbEduLScVbzwPP2zgiHnzYZvL/OSN+1w9f6MwDJaLKwqHbJarDCfPYdIPITIH9Np2iyWl5E3rWZQ84TUN+n6KWr9vSxw3i8howydZSUeO5g+Bx2alq5sh78pyZTtobIdFWUiB1WajWfgDtu/obXvleeP//0l8vEesZejIo3GhpurCNLNaNKsCJhDAwmYgbARLA6sSlikRkUbHFg94C9XuGE4QMxZ1t0dAUcs7Yq0gZylpgOs06FVdsDMzMsInzD2QyuyUpptXCvKBPqXa6kvoplVOTgYfKFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10635.eurprd04.prod.outlook.com (2603:10a6:150:21b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 15:55:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 15:55:35 +0000
Date: Mon, 31 Aug 2026 10:55:27 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dmaengine: dw-edma: Configure remote interrupt
 routing
Message-ID: <apWj7zzAw57U2r4F@SMW015318>
References: <20260828163611.2691264-1-den@valinux.co.jp>
 <20260828163611.2691264-3-den@valinux.co.jp>
 <apHWdSznP88op0i9@SMW015318>
 <kois53tr3imzynyynfyp2z4gk6tfxzryai5cxn3ji6oiehp6st@5vaacz2bwcgu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kois53tr3imzynyynfyp2z4gk6tfxzryai5cxn3ji6oiehp6st@5vaacz2bwcgu>
X-ClientProxiedBy: PH7P222CA0001.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10635:EE_
X-MS-Office365-Filtering-Correlation-Id: bda0e0b8-c2f8-470a-d264-08df07784b51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|11063799006|6133799003|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JsZSzFC7J1EooKI/EE8t7IA/oyZLjHu1j7CKnAgnadulbmFhu8hGNA91XCEPzDnYZrHedy/GsYIv43XwvqGVUQVnS106xexqyjnFyM8qp+dCPF/dDo28LftZv/p+4WenvL4l60xF7RWg147S+La4GLqQehOkeaBA3vKkrlewvCHIfOSfLHkmkMoLQf1ojS2l8oLDQFa8dQEOf1Fn65aZy1cTRW9S9AhzxvlvxLLjpMsGZ1fH00lP7JUU4DlMLs3waweDTCndk5z/aFMuN50tOTQyVTh6vUCLpQe7BMjSjLf+yiGSN4/4I0jxbhcTcL2keGhfIpFz4ZqVQyJHwYlx8xyj1EIrhheOVZSSPtDBSlqe+TCOVAZnoAp2G09jAbhkivmIiUttaQCgyzNDwyoXC9tTJiqf5PKtqZl8f/EEIlTK4WGLA7oHuCfHdJybYFag5gIYRaJ1nIi14/dtPyAlXZIPEJlgGy8Av8/OrCoXfZOqwaNZoGvMVDaW0c3Ku7KMnh11OJjm6hn9oo+I9hN0VUx7u9wB1PeyXD+IzrUOkFqDynloKCbRljsPrlILwXuKOVUH4joMIHZavqzxCNxpyKp+xm/2W6qkJlUEixwIeO7Aou566f7YozTQ0NVFzin0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(11063799006)(6133799003)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YLnGfKTQ0Ray7LJ7OHmuA74JYx9ZaYIizaGgWgaEXPeyJY8wsQlO7Ldcwpjt?=
 =?us-ascii?Q?Bi5rO9tU0JQ+0Fpjz7f9SGQTlKpq2MFF84f0p300ZdoKzV/zJOyQohcbhmwn?=
 =?us-ascii?Q?sU6Q2ia68dfTXIlztsAVMKQ5R15YanQYz4FbKKo4S13Wod+cVUWfyxOiQTUR?=
 =?us-ascii?Q?YJl4e7VLzq2dwdZum5qwPcBqVBU/iXGYwYYNyTmHaeQgQAL2BC59Z9wSPMNK?=
 =?us-ascii?Q?RMXEqc7Z25p85TXH2iBTkg5hV9eE4RBswPCl63ZxOKP3Uvqc7A/2TM4IlEVy?=
 =?us-ascii?Q?CfNXluJlz3yPWMsn4d8iNthCph4LYiRci6kEuTDVLgBIAHumhBLXD2ucFxcf?=
 =?us-ascii?Q?+Ke8lpd9q+cXrINqK2Rd5l4gM8XHpOCh78qYgYIkUWkI6TbLCodf3T/akENw?=
 =?us-ascii?Q?vny7GfweC26tXQh7mPlLT0lrJyYMCCGBJqYxWKGx91kjLlYfAzWna8APlpRj?=
 =?us-ascii?Q?5pm1I6bZnIgPLPhC517WniybonwH1R1lJM4rtpjQzkGSBpbazolk6P3Mv+6q?=
 =?us-ascii?Q?MQYUGZtFKI1gzD21u1rRLgQDB3uMGA767K0xxO+RVXSooR/tGM65xWRTploU?=
 =?us-ascii?Q?oDkrWfUtCLdjbeGmzLO/Y5I054sejd8YZCVBE6GAZbedsTuMe6Iq9ny5eHeH?=
 =?us-ascii?Q?Z6PNOW1pHojQso8lGgJ6ETSZhoB8nCHbJsQITWxHe/8nd4FyT20R6UpRgy5Z?=
 =?us-ascii?Q?zkk7Qn1fKukCrkLSEbYyri2lzOKETkYxc1El51M15WS/6922VOlD46wzX0Wr?=
 =?us-ascii?Q?HEn4sh3+ZLa8/u4DC8mv6y8WZzPyhdaSzNu67fiCKsVXA6+MjtPz4dYG6dwb?=
 =?us-ascii?Q?eqCaT7ocn6BfOhwI2niqW0ej55InNDZ+yWDAEkhonNNOI/3goXWJ7EH7/J3z?=
 =?us-ascii?Q?crL7uO+r3N8OyUorP+irp+CU9VOeIg6xAXDrqDbXBEAtPyR7a9Ey+TN2EmSl?=
 =?us-ascii?Q?S6KoCdtoSYjfOILJ5pFjDT3z0mtXLd/FJAnpdyQICrvir1EHc6V+bEgBCjfF?=
 =?us-ascii?Q?yQ/jCXLnGnt2av8zJhPZ7mAAOFkMqZsTsab0WXpC5yMLSXKjJqbjZY1BoyAD?=
 =?us-ascii?Q?iXpDyE9Ye2VvTbn2NlK9PGlSaPA3MePkQGACAyO/Z/GKn9kJKl+GVys78YvX?=
 =?us-ascii?Q?GJywA7xLdPDdDFHMVLFDDKKy7LDqAJDfdcQM3O4nDMGp+2df71NJSyrxs0zQ?=
 =?us-ascii?Q?ks/GAO5KT7jeUm2eYl4ICriTbQ+Y60FYJNvXSrXrO6YuaCZS/GBZsOm0k303?=
 =?us-ascii?Q?X6NE+fulYesKJ/5t3ZEDVqKEXftHMz+RNOSR47seXUCK4JW8y5mK9hj8zn4A?=
 =?us-ascii?Q?l6+MU+xtcvsaCWgEDQWAo4aJKOjXHKZisckjlexstHfeRwbE3obr6bXkN9n0?=
 =?us-ascii?Q?uojuayujoYYJIh2KeWN22T3AY78kg/V5QG7w6IYFv45DD14bOqZQ/88+oDPj?=
 =?us-ascii?Q?U/2Ezq/SRw/1If30y6OcdbCXBXY8EBPTL4voJdRugzTfqp3ATVfXaFypamf3?=
 =?us-ascii?Q?G1V6xFQYZnL3wyp/WjFsNERrtf7TwICEcgcPiarbL/HxV8x3wW2wGOaMooEr?=
 =?us-ascii?Q?MY93ZM9SgQ7E3hKFMEtnVdFR+bZJV3vgX9eXMEfQ5wEIshJpRTJWJAbq0QMW?=
 =?us-ascii?Q?imdLnE2eE2yALwnIcyMVF7v+xpmpoiyA9VBYOw0bbHVzpANDL+ITIEu8C6BI?=
 =?us-ascii?Q?K8tAEhkANjJ8J3SygxLJ1qd41+jxhspYZIynMok2URuAOX1z90WlpQteoanB?=
 =?us-ascii?Q?mgk6PzbSovH4TrqjygcfGuv8t7UUHqgiKbmj56sVvgOJ/51u32XF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda0e0b8-c2f8-470a-d264-08df07784b51
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 15:55:35.3779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9K++Vy7dc7soiX66ANoEYlkKjZAfY7ne1UfN/PBKiZUmx4GmmeaCpkuO8ezA9131MhnXpQLIME60l4fVxhfJSx5lriUK6UPE3A64A9HfIWuux8I4BH5U0nO8Pg/zrAv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10635

On Sun, Aug 30, 2026 at 03:13:23AM +0900, Koichiro Den wrote:
> On Fri, Aug 28, 2026 at 01:41:57PM -0500, Frank Li wrote:
> > On Sat, Aug 29, 2026 at 01:36:10AM +0900, Koichiro Den wrote:
> > > An endpoint function can reserve an endpoint-local channel while the RC
> > > programs it through an exposed register window. Such a channel must route
> > > interrupts remotely and ignore them on the endpoint.
> > >
> > > Use dma_slave_config to set enum dw_edma_ch_irq_mode on idle channels of a
> > > local eDMA-compatible instance. Synchronizing a remote-routed channel
> > > quiesces the hardware, after which the caller can restore its routing and
> > > release it.
> > >
> > > The eDMA quiesce may stop a complete direction. The caller must own every
> > > channel in that direction and stop remote programming first.
> > >
> > > Suggested-by: Frank Li <Frank.Li@nxp.com>
> > > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > > ---
> > > Changes in v2:
> > >   - Rework the channel routing from PCI DMA EPF v7 patches 5 and 6.
> > >     https://lore.kernel.org/r/20260813063757.3131865-6-den@valinux.co.jp/
> > >     https://lore.kernel.org/r/20260813063757.3131865-7-den@valinux.co.jp/
> > >   - Use dma_slave_config instead of private delegation helpers. (Frank)
> > >     https://lore.kernel.org/r/ao2nHoCwfTEEiFSr@SMW015318/
> > >
> > >  drivers/dma/dw-edma/dw-edma-core.c | 51 +++++++++++++++++++++++++++---
> > >  include/linux/dma/edma.h           |  6 ++++
> > >  2 files changed, 52 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > > index a678c70a78fe..a8c6bd508fcd 100644
> > > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > > @@ -177,6 +177,30 @@ dw_edma_get_default_irq_mode(struct dw_edma_chan *chan)
> > >  						  DW_EDMA_CH_IRQ_REMOTE;
> > >  }
> > >
> > > +static int dw_edma_device_config_irq_mode(struct dw_edma_chan *chan,
> > > +					  struct dma_slave_config *config)
> > > +{
> > > +	enum dw_edma_ch_irq_mode mode;
> > > +
> > > +	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) ||
> > > +	    config->peripheral_size != sizeof(mode))
> > > +		return -EINVAL;
> > > +
> > > +	mode = *(enum dw_edma_ch_irq_mode *)config->peripheral_config;
> >
> > existing code use peripheral_config indicate non_ll mode, is it compatible
> > with irq mode?
>
> Yes. dw_edma_device_config() currently distinguishes them by map format.
>
> As a small first step, the remote-channel use introduced by this prep series and
> used by the main vNTB series [1] does not cover HDMA. See the cover letter of
> [1].
>
> Would you prefer introducing a common config structure at this point?
> Requiring every caller to initialize both fields may not be ideal, so perhaps it
> could carry a bitmap indicating which fields are valid:
>
>   #define DW_EDMA_CH_CONFIG_NON_LL       BIT(0)
>   #define DW_EDMA_CH_CONFIG_IRQ_MODE     BIT(1)
>
>   struct dw_edma_chan_config {
>           u32 flags;
>           bool non_ll;
>           enum dw_edma_ch_irq_mode irq_mode;
>   };
>
> What do you think?

Okay, it avoid need init all field.

Frank

>
> [1] https://lore.kernel.org/r/20260828170932.2735807-1-den@valinux.co.jp/
>
> Thanks,
> Koichiro
>
> >
> > Frank
> >
> > > +	if (mode != DW_EDMA_CH_IRQ_LOCAL && mode != DW_EDMA_CH_IRQ_REMOTE)
> > > +		return -EINVAL;
> > > +
> > > +	guard(spinlock_irqsave)(&chan->vc.lock);
> > > +
> > > +	if (chan->configured || chan->status != EDMA_ST_IDLE ||
> > > +	    chan->request != EDMA_REQ_NONE)
> > > +		return -EBUSY;
> > > +
> > > +	chan->irq_mode = mode;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int dw_edma_device_config(struct dma_chan *dchan,
> > >  				 struct dma_slave_config *config)
> > >  {
> > > @@ -184,6 +208,10 @@ static int dw_edma_device_config(struct dma_chan *dchan,
> > >  	bool cfg_non_ll;
> > >  	int non_ll = 0;
> > >
> > > +	if (chan->dw->chip->mf != EDMA_MF_HDMA_NATIVE &&
> > > +	    config->peripheral_config)
> > > +		return dw_edma_device_config_irq_mode(chan, config);
> > > +
> > >  	chan->non_ll = false;
> > >  	if (chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE) {
> > >  		if (config->peripheral_config &&
> > > @@ -213,10 +241,6 @@ static int dw_edma_device_config(struct dma_chan *dchan,
> > >
> > >  		if (cfg_non_ll || non_ll)
> > >  			chan->non_ll = true;
> > > -	} else if (config->peripheral_config) {
> > > -		dev_err(dchan->device->dev,
> > > -			"peripheral config param applicable only for HDMA\n");
> > > -		return -EINVAL;
> > >  	}
> > >
> > >  	memcpy(&chan->config, config, sizeof(*config));
> > > @@ -893,6 +917,17 @@ static void dw_edma_wait_termination(struct dma_chan *dchan)
> > >  static void dw_edma_device_synchronize(struct dma_chan *dchan)
> > >  {
> > >  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> > > +	bool remote;
> > > +
> > > +	scoped_guard(spinlock_irqsave, &chan->vc.lock)
> > > +		remote = chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL &&
> > > +			 chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE;
> > > +
> > > +	if (remote && dw_edma_core_ch_quiesce(chan))
> > > +		dev_warn(chan->dw->chip->dev,
> > > +			 "failed to quiesce remote-routed %s channel %u\n",
> > > +			 chan->dir == EDMA_DIR_WRITE ? "write" : "read",
> > > +			 chan->id);
> > >
> > >  	dw_edma_wait_termination(dchan);
> > >  	cancel_work_sync(&chan->irq_work);
> > > @@ -903,12 +938,18 @@ static void dw_edma_device_synchronize(struct dma_chan *dchan)
> > >  static void dw_edma_free_chan_resources(struct dma_chan *dchan)
> > >  {
> > >  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> > > +	enum dw_edma_ch_irq_mode default_mode =
> > > +			dw_edma_get_default_irq_mode(chan);
> > >
> > >  	dw_edma_device_terminate_all(dchan);
> > >  	dw_edma_device_synchronize(dchan);
> > >
> > > -	scoped_guard(spinlock_irqsave, &chan->vc.lock)
> > > +	scoped_guard(spinlock_irqsave, &chan->vc.lock) {
> > >  		chan->configured = false;
> > > +		/* Avoid a redundant write racing with shared-IRQ readers. */
> > > +		if (chan->irq_mode != default_mode)
> > > +			chan->irq_mode = default_mode;
> > > +	}
> > >
> > >  	vchan_free_chan_resources(&chan->vc);
> > >  }
> > > diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
> > > index 3c8e2ef9dee0..54491c9e4b5e 100644
> > > --- a/include/linux/dma/edma.h
> > > +++ b/include/linux/dma/edma.h
> > > @@ -92,6 +92,12 @@ enum dw_edma_chip_flags {
> > >   * handed over to and driven by the remote side, and the recipe above is
> > >   * applied by the driving instance.
> > >   *
> > > + * On a local eDMA-compatible instance, clients may pass this enum through
> > > + * dma_slave_config.peripheral_config to switch an idle, unconfigured channel
> > > + * between LOCAL and REMOTE routing. Before synchronizing a REMOTE channel,
> > > + * the client must stop remote programming and own every channel affected by
> > > + * the hardware quiesce.
> > > + *
> > >   * HDMA linked-list watermark interrupts have the same LWIE/RWIE guidance. HDMA
> > >   * non-linked-list mode has dedicated local and remote stop/abort interrupt
> > >   * enables.
> > > --
> > > 2.51.0
> > >
