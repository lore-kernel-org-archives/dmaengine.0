Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020108.outbound.protection.outlook.com [52.101.228.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637483750A9;
	Sat, 29 Aug 2026 18:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788027210; cv=fail; b=mXIQ9LiGJWGs3kU/0Ccn/jCmKDAF3Q1QhOtHfzCkUW1HKoqSOPrrCTuY0BDUWsZR4rsDhksr/4taBrndLF8gg08hB9zaQpUHqkHs/Ov8nKSegeT4k2P1dhb7xjM9wYiLddNFgxiDP5CS9zLA4I1m5/DYuv4H61aTKBa7NuphL3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788027210; c=relaxed/simple;
	bh=CAhG5PhV54EQRDwIMvlRwNwNyxee5yOT2SWXyIAUgpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DsGYScrUvfkPG0VloWK7FmRX/C80pDoG9kJ3mbNjb49jixjtoEdTg5aZ1IXpbdOjS3rU4s33IYBkLYyKpiRUsHBr48Z63BBQDdGG+z7d5xJGlvl2J5GBsDe0nUnKklPRJf9LEfIgq6ZyROXBh6fRbgUazg+d2mAuxmKKQqh1++s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=v+jhAcQ4; arc=fail smtp.client-ip=52.101.228.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="v+jhAcQ4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ejVOAYsprH0j8IYfuCPk8MPUvZwGk1PIZVFVp9uPpZPFPE5kOtA5ZRLYvmDqAZ6fi1wzdj1WukVvuLigk4QTLKSLMRVdbmuGu4u1Ybut35YxN8GLJ7by6XwwcVSWzSUNAqWbsfomadtV+R5emhnORoXPIjylbsTRkLu5p3/mtDv4QPQPd1PnbshG6xDU+ZpE/1aZazLrmvpYSiInKIRcxtH81OabdIjliML/rt2IcI9Gk4DO8nVnYttBGtc/rMDg89OSVSolOoH4xR2u0yUDsQbRsVXPtkLp7i8HV83zBA7WZh184PG2i0UktzMoE4OF6wJUsEo3gjM+DNfWJSvSVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oqp+xjE/DoWqbxilGU6fLlHpzJ09R3gBp17Hcvf5IDQ=;
 b=qp1zL/PNesKe+cBdQk22i3UgieAhd00Q4jaHIs/0LjBIZKcNHrOYbEOjAbS53BKsjoxkhimawgy/povOe5NTvcw9Zf9CuMOwhyYuekRjWsIIiM8tfHtNdcyhkJuH6bfPdlsmzFQHpUr9wgQuvPQCxdcfOVIGn3zIPTz4gqK3f6gTz9baHOyT+XziZcWWxzAYHFSOMfrKv0rq2e6s+L+YTjtYkPzL14ZQtSaytnukdXQH0V1vq070xrJnmGOAf2rbtiTZpD3sQaDyBgtNSfkav+f1l2FfKn16JiN59cSTs9ajmUcZogc/90fgn90xlPOYzSkybunYagVB5YwcPi7NVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oqp+xjE/DoWqbxilGU6fLlHpzJ09R3gBp17Hcvf5IDQ=;
 b=v+jhAcQ4cMjCSKr60YEMRobcIpLnSNrOjVa6BmAMH5X3xnjySQz/ejDAlZZf2W4r7g+NTi+4lMs0r7MOAKpuKZ3S9RW/6N26bdbvwpdByqiGw57ik7PJHJ/vpklXXRbdP6K+/6qhrmiKtcZnUOv0vWM2PXmLIIOVBKXsYT5nudo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB8102.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:3f2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Sat, 29 Aug
 2026 18:13:25 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 18:13:25 +0000
Date: Sun, 30 Aug 2026 03:13:23 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dmaengine: dw-edma: Configure remote interrupt
 routing
Message-ID: <kois53tr3imzynyynfyp2z4gk6tfxzryai5cxn3ji6oiehp6st@5vaacz2bwcgu>
References: <20260828163611.2691264-1-den@valinux.co.jp>
 <20260828163611.2691264-3-den@valinux.co.jp>
 <apHWdSznP88op0i9@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apHWdSznP88op0i9@SMW015318>
X-ClientProxiedBy: TYCP286CA0352.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB8102:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aafdb16-aaeb-4703-0cb3-08df05f937b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|376014|10067099003|4143699003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3ohussabw6hAscDVvlBqo77iasJSUMCvQBOfWPHDzRcKjsYFoLCd/4mLsm4BeubNt1eF3lOTpRZOoSYRa6GW8XyZAtqkCiZOmCmB5FOcK0kFxXyZ3rMI9XlAmYesGCqC6QRzmvkd3FWX9RSFGZ/SQTce20XBr79UC+1s3VqevAw1mIBIoCohO2ohnG2F6glZMys0c1cDymgKyD3Yuv32kUbthWdL1ofcIGVAE1fjk+oH8N1t8Zh5JH3txufWqhiH85S1s3nbBJjVZKklyKiQNf095ZGlWbgSYt3FPBdSMgUnvQ/Z66HnmLKoAA2duL4tGLW85PFJchey1FN2wnr44t8sdzloCR03PpwGNh2c9zTBItEFCy1ZeV8G1+zSuaUU2Uzk2w17ddxLXg6a5LsmyYH0UgBxKHROdSVLdidKaLBBS76/Kw26zUsD9Pn+LpI1E1Py1XDuzdByjjwOXS+q/24DAVi4bfm5aAPpNtImM3Q65dmAg2SPb1Zm02BFz1lKSw2WIl4ZC6zE2mdXLmYDxin6rg0wD5TrYt8lDYZsQISvfCyhS+kvzjmTN9/v8qck9R70lQcmtczpKhPRVlmPmZoQJJ9TMpHLHH4gC9LgkeLDVBQu21SsqRYZE+NIBfqs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(376014)(10067099003)(4143699003)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i3G1wIQE+Fmr9/WUg98YDKiMFBYqcKL75JnO4wklioXz0jnu875F2or3N+XH?=
 =?us-ascii?Q?Nq5MgxanfcBSU6pqCLpwQvxYvAwkyZqBAO5i6kKANM9BmJTTEhvVOQvoDtIM?=
 =?us-ascii?Q?DHkVZ77xrj7Bim+UD0S1ISJUBGJf+nsk8fwvs0hGjisx+w9vSiwsaSKFu0he?=
 =?us-ascii?Q?APkijb5QWb/8YQzrjK4uW31cvQ2dw4XeJRyrUqxjrwn0ww6C8BzQADIDoA5m?=
 =?us-ascii?Q?Vx38fApAH+5wrENoBGnXz83o1+Xlf9+7FEFpg2YqKp+0zKziAWHzD5CRYg+M?=
 =?us-ascii?Q?zXGehz18gJa2Lhrl+cLeJtpPUZ0vGR82UNR8V1ZEEmtfWb/hYzfAWO6UDBM6?=
 =?us-ascii?Q?SK/pINWEBiB3vLNpuWsFuLhG6cy0Nk67qZV7obRbnylsUk3CNzcKKSO4j66u?=
 =?us-ascii?Q?fHel/QRgWjlHMXR6ALRe/Uc+9Cio6Ztzt29GIP+KIaHdv+RLL+mvTGlUoqHY?=
 =?us-ascii?Q?hghB/4MSlC/HWMFs9FOP5DcnHhbn5qTK0Zd02w+40yyMo81ImIXA7L7NMpyM?=
 =?us-ascii?Q?MRQdlI0yEASVBMiyT8FmskRmAJqhKwsb3G3mukqKxtoGrQfHm+aCSxvSTJkI?=
 =?us-ascii?Q?MZWo1TgQbC0RLVEn4oTMZZWEW4RBmofwh3q9LNpqSzm5AwnFGvugrjAhYO0m?=
 =?us-ascii?Q?okUrQY+rpd4RMNwvCu9AwaMHM8jfe4ZpOHS5Uc9T5go9m+LxK8j1P0V2k0sn?=
 =?us-ascii?Q?IUOn2Bq0u+KC4brfePDE5BYasgHPyF/p40pBV3OtioBuGSrq6IUq9aEdm+Tu?=
 =?us-ascii?Q?7Zf4DQrk8gruOhO57WudhC+aqORWgAkubftmM9HOkdCq5cUlxmxo2BMMw0sO?=
 =?us-ascii?Q?ft5aI+1wH/Vp4wEk21O+TKWh8Hn+NUAIiPWKJ+YaWD4iG5/8uTFuo1j//MkC?=
 =?us-ascii?Q?7ZL39CSnV813VvMF+u46SUHRM8I/cMgSg5gWSjNBtL8IcObreyZzS6o6tToB?=
 =?us-ascii?Q?hdpFmAXHVllRVote3m20w6Yse/K70yYi0qbNKSEjU4f1en9Qup30lxmMs/4r?=
 =?us-ascii?Q?JwDauJ44tALbc2kXzCDuo3EPUcn5A74K0Q6kEcxqpyfOIXhQh270Ftm0597F?=
 =?us-ascii?Q?kkl6smFBztUe03bdlqUIFA2QIjXCZYYl0Bve2LHGRhoB8sJQCCws49OccSJs?=
 =?us-ascii?Q?nnMow8jicoIXU1OwpZaQpt8+0wAvC9mJOO1Z/OQF/lLAHSmdf7alrXUtWI5+?=
 =?us-ascii?Q?SVjfx3QIk4/W7XZ3E4G4q4oLtOOUgpsTwhu5NO07g9eNlyVL4Gey9kgnk4zi?=
 =?us-ascii?Q?F0XmKUaaTaoLQl9FEbauzrp1pdSQ7Auu01n+oRnmXwJAQ/sdAFM/RM1+kgZv?=
 =?us-ascii?Q?T5LgHPXF3H9SCYJUhm9umFO0uqs0E9vq/Sc33AV5gNsWMTXNs6onHcHe6Fdg?=
 =?us-ascii?Q?flxveCDnbhVDzgU+sZ+qJtcsjrMMWJlRMCfrdSudc40DHOIjv3xZWPr/TN3K?=
 =?us-ascii?Q?GhiWLNxYmVG3Jx509mfM7YyKCu6oP0fuRn79yrEn4g5ga5EnBIU4yn/V/kmA?=
 =?us-ascii?Q?pVbRtwcy6PXFR2czdfbBnQ5uoR8ozTtWzwLvfS6BNHn6Z1JdyTIkVkM4zLS0?=
 =?us-ascii?Q?J55rNJp7BtMpGLtR8/F5A1JJOzO3MbrhmfZfOVjrQ2uRtbr8PLahICTVKREq?=
 =?us-ascii?Q?8gMxgPp3vAjrGWCPq2W7iy8Okys/vcQivrbaSILJ2REI3FVwV87PGEDNe7Uj?=
 =?us-ascii?Q?CukLyArifQXa3+toXhJh9z51lRG/I7J53+jCT3UDmmRUya+Qhnj7zd/VSyIM?=
 =?us-ascii?Q?u0p+dHHzctiACo2ieGgpzacba22hTaUR6DlTOEZuoFrCi0H5GqFg?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aafdb16-aaeb-4703-0cb3-08df05f937b0
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 18:13:25.0378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPDRvUbxOtWktMsEZMIo4vNZ4dRRRkeG08iFiIPXEjjWUV0kCSh0Rrosje9CyaOzxDGbNEGuOgKK6IfwbbIcwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB8102

On Fri, Aug 28, 2026 at 01:41:57PM -0500, Frank Li wrote:
> On Sat, Aug 29, 2026 at 01:36:10AM +0900, Koichiro Den wrote:
> > An endpoint function can reserve an endpoint-local channel while the RC
> > programs it through an exposed register window. Such a channel must route
> > interrupts remotely and ignore them on the endpoint.
> >
> > Use dma_slave_config to set enum dw_edma_ch_irq_mode on idle channels of a
> > local eDMA-compatible instance. Synchronizing a remote-routed channel
> > quiesces the hardware, after which the caller can restore its routing and
> > release it.
> >
> > The eDMA quiesce may stop a complete direction. The caller must own every
> > channel in that direction and stop remote programming first.
> >
> > Suggested-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> > Changes in v2:
> >   - Rework the channel routing from PCI DMA EPF v7 patches 5 and 6.
> >     https://lore.kernel.org/r/20260813063757.3131865-6-den@valinux.co.jp/
> >     https://lore.kernel.org/r/20260813063757.3131865-7-den@valinux.co.jp/
> >   - Use dma_slave_config instead of private delegation helpers. (Frank)
> >     https://lore.kernel.org/r/ao2nHoCwfTEEiFSr@SMW015318/
> >
> >  drivers/dma/dw-edma/dw-edma-core.c | 51 +++++++++++++++++++++++++++---
> >  include/linux/dma/edma.h           |  6 ++++
> >  2 files changed, 52 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > index a678c70a78fe..a8c6bd508fcd 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > @@ -177,6 +177,30 @@ dw_edma_get_default_irq_mode(struct dw_edma_chan *chan)
> >  						  DW_EDMA_CH_IRQ_REMOTE;
> >  }
> >
> > +static int dw_edma_device_config_irq_mode(struct dw_edma_chan *chan,
> > +					  struct dma_slave_config *config)
> > +{
> > +	enum dw_edma_ch_irq_mode mode;
> > +
> > +	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) ||
> > +	    config->peripheral_size != sizeof(mode))
> > +		return -EINVAL;
> > +
> > +	mode = *(enum dw_edma_ch_irq_mode *)config->peripheral_config;
> 
> existing code use peripheral_config indicate non_ll mode, is it compatible
> with irq mode?

Yes. dw_edma_device_config() currently distinguishes them by map format.

As a small first step, the remote-channel use introduced by this prep series and
used by the main vNTB series [1] does not cover HDMA. See the cover letter of
[1].

Would you prefer introducing a common config structure at this point?
Requiring every caller to initialize both fields may not be ideal, so perhaps it
could carry a bitmap indicating which fields are valid:

  #define DW_EDMA_CH_CONFIG_NON_LL       BIT(0)
  #define DW_EDMA_CH_CONFIG_IRQ_MODE     BIT(1)

  struct dw_edma_chan_config {
          u32 flags;
          bool non_ll;
          enum dw_edma_ch_irq_mode irq_mode;
  };

What do you think?

[1] https://lore.kernel.org/r/20260828170932.2735807-1-den@valinux.co.jp/

Thanks,
Koichiro

> 
> Frank
> 
> > +	if (mode != DW_EDMA_CH_IRQ_LOCAL && mode != DW_EDMA_CH_IRQ_REMOTE)
> > +		return -EINVAL;
> > +
> > +	guard(spinlock_irqsave)(&chan->vc.lock);
> > +
> > +	if (chan->configured || chan->status != EDMA_ST_IDLE ||
> > +	    chan->request != EDMA_REQ_NONE)
> > +		return -EBUSY;
> > +
> > +	chan->irq_mode = mode;
> > +
> > +	return 0;
> > +}
> > +
> >  static int dw_edma_device_config(struct dma_chan *dchan,
> >  				 struct dma_slave_config *config)
> >  {
> > @@ -184,6 +208,10 @@ static int dw_edma_device_config(struct dma_chan *dchan,
> >  	bool cfg_non_ll;
> >  	int non_ll = 0;
> >
> > +	if (chan->dw->chip->mf != EDMA_MF_HDMA_NATIVE &&
> > +	    config->peripheral_config)
> > +		return dw_edma_device_config_irq_mode(chan, config);
> > +
> >  	chan->non_ll = false;
> >  	if (chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE) {
> >  		if (config->peripheral_config &&
> > @@ -213,10 +241,6 @@ static int dw_edma_device_config(struct dma_chan *dchan,
> >
> >  		if (cfg_non_ll || non_ll)
> >  			chan->non_ll = true;
> > -	} else if (config->peripheral_config) {
> > -		dev_err(dchan->device->dev,
> > -			"peripheral config param applicable only for HDMA\n");
> > -		return -EINVAL;
> >  	}
> >
> >  	memcpy(&chan->config, config, sizeof(*config));
> > @@ -893,6 +917,17 @@ static void dw_edma_wait_termination(struct dma_chan *dchan)
> >  static void dw_edma_device_synchronize(struct dma_chan *dchan)
> >  {
> >  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> > +	bool remote;
> > +
> > +	scoped_guard(spinlock_irqsave, &chan->vc.lock)
> > +		remote = chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL &&
> > +			 chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE;
> > +
> > +	if (remote && dw_edma_core_ch_quiesce(chan))
> > +		dev_warn(chan->dw->chip->dev,
> > +			 "failed to quiesce remote-routed %s channel %u\n",
> > +			 chan->dir == EDMA_DIR_WRITE ? "write" : "read",
> > +			 chan->id);
> >
> >  	dw_edma_wait_termination(dchan);
> >  	cancel_work_sync(&chan->irq_work);
> > @@ -903,12 +938,18 @@ static void dw_edma_device_synchronize(struct dma_chan *dchan)
> >  static void dw_edma_free_chan_resources(struct dma_chan *dchan)
> >  {
> >  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> > +	enum dw_edma_ch_irq_mode default_mode =
> > +			dw_edma_get_default_irq_mode(chan);
> >
> >  	dw_edma_device_terminate_all(dchan);
> >  	dw_edma_device_synchronize(dchan);
> >
> > -	scoped_guard(spinlock_irqsave, &chan->vc.lock)
> > +	scoped_guard(spinlock_irqsave, &chan->vc.lock) {
> >  		chan->configured = false;
> > +		/* Avoid a redundant write racing with shared-IRQ readers. */
> > +		if (chan->irq_mode != default_mode)
> > +			chan->irq_mode = default_mode;
> > +	}
> >
> >  	vchan_free_chan_resources(&chan->vc);
> >  }
> > diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
> > index 3c8e2ef9dee0..54491c9e4b5e 100644
> > --- a/include/linux/dma/edma.h
> > +++ b/include/linux/dma/edma.h
> > @@ -92,6 +92,12 @@ enum dw_edma_chip_flags {
> >   * handed over to and driven by the remote side, and the recipe above is
> >   * applied by the driving instance.
> >   *
> > + * On a local eDMA-compatible instance, clients may pass this enum through
> > + * dma_slave_config.peripheral_config to switch an idle, unconfigured channel
> > + * between LOCAL and REMOTE routing. Before synchronizing a REMOTE channel,
> > + * the client must stop remote programming and own every channel affected by
> > + * the hardware quiesce.
> > + *
> >   * HDMA linked-list watermark interrupts have the same LWIE/RWIE guidance. HDMA
> >   * non-linked-list mode has dedicated local and remote stop/abort interrupt
> >   * enables.
> > --
> > 2.51.0
> >
