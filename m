Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020075.outbound.protection.outlook.com [52.101.229.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9DD4B26FA;
	Fri,  4 Sep 2026 17:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788544018; cv=fail; b=OqHouw/pxnalcqPagO/60bAFGq/ZcXPhuMj5HxMw8+vXaKoOjFMwPTlYhwD4HC7CFejYVjRkw3PvwSo+gijQSR1OgAJvjmS2c2jIhsNJkcr+bF4/3E9Q1/oeUkqgMU+dsmUIGJKVpTndz3q3ulkFLBKGU+VRQDCM52nGuNUZKfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788544018; c=relaxed/simple;
	bh=K84mxxgC2T5Ye3Qx7PkTV2VyDUgA300w+f/4OYfYkQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pS/UcH+8downCqyIsOEMKrV6ohOg05PWKGd2Iy804wvR2ZDorEDSCMbDX8t0L4CQCO5Iqdn7vDpHCxBiwoeWXK1cUjMVkOY2yAww05k/DnndVb5T5vSL9tQlFcIJqEMuazjsLNgqlnnM4gm+KVOjEFKetnWeJ257LX62Jswp5JM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=I2Xwy/Xe; arc=fail smtp.client-ip=52.101.229.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="I2Xwy/Xe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dw2iIiyULmZosN4dvh4Gta01AyyGb9kSIwxiY61hj1mJl4ML74YAh/jkEF0+69r2+nHLmfLn3/s+S7y7DJKeH+grYmwU1YaVSCKZv20ahrbrcuQfwQsslb6ccKhk16Oh7OtmawqyUOCSHkDd/XInSNuejjpGYHcrEiIR0MTwrns8DZF01En0LeAw2Op6rwqbT6gZNQJhZkAoo+hGkP+RCbmHgVoL28Ao3tQdAyoAmAE9mOqR+mEoiH1E6kuDgToiSdoNtPbAAD1mMYgNbnIPSbhPtfXDPtk7gxQzel+3FW93Nvg6ryz0FKQqZ/iANO/LF20OZ1x7A572Vc3XsTC+Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHeYmyshb+GFuAQrLFb3HLBZCtIskjG0wPxpMWJbD6s=;
 b=WJmgfA4OZ8DF7GXE5dDnmnfH2kCpH6KyR5aqnQ4zLgZ9vWnMaZ8Zul3TwML2rACfVfYfvKJcaqNxLh80+/Ir04EFfesYvnL5Vp4RbcE+DhMCotbtEL4sM6eNYyETY98ljAbCsoVX3wA95OsXEYFV3OOYa2CDUov8hrDtRpVdf4G2/pFEQbv8KzXohdMP5IwDkDIqFupowAif5mHinodtv8OnYrOpSDtyBDh1h2uZYIr8NJAVjX5fNxni2Qdhyyh8AbfLplrWOitMs+zwMACUyy4EAf1dk6VxTc8eua93aMVdAOC6AviUyVKK1vMQ6+b6T/I3Jr/Rr5RmjVwV/nCClg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHeYmyshb+GFuAQrLFb3HLBZCtIskjG0wPxpMWJbD6s=;
 b=I2Xwy/XemM7BrQR4/yQJfR1d48Yjn/vgRjFudOPOeMMvr7w/cIa+LwcIEl+AKVq5grlSY452snbMNnkAzhLCwm172dYVUyLa2u8SZl1CCUxIEczhksyMqi6FuZ5/4XSjc2RGRqojdNLphQH54VqIelGTGPOVn7N/rjeJsHsTr1M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYTP286MB3579.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 17:46:53 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 17:46:53 +0000
Date: Sat, 5 Sep 2026 02:46:52 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Devendra K Verma <devverma@amd.com>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dmaengine: dw-edma: Configure remote interrupt
 routing
Message-ID: <5pbvoqpu3ww42x65q2v4ing2tcqyx2inlc2aqxx2npfirc26y6@nmxylqdvpow4>
References: <20260903064533.2269557-1-den@valinux.co.jp>
 <20260903064533.2269557-3-den@valinux.co.jp>
 <aprmu6McROxJrDLW@SMW015318>
 <75noofzi2u3gc4gyjgiiuprhth6zesufqtytbpun2ew45bewda@nhu24spu2cyw>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75noofzi2u3gc4gyjgiiuprhth6zesufqtytbpun2ew45bewda@nhu24spu2cyw>
X-ClientProxiedBy: TY4P286CA0081.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::13) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYTP286MB3579:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e515ffc-25b1-4a73-92af-08df0aac8179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|10070799003|366016|56012099006|4143699003|6133799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/dJwEQASPP7vVJYzeI3KSY5JM5dmraRpMT87YtLrCbQ+wJ8PRcz2tGRVbdANrjGY535HM361eow9vJihMtBgsBfme4P/j5jZE9UahFtUNaZeCc/Y1wA2fomMddJ2bfBr5RT09OAV0X685IHLctACOMZ42MswUnXXY0ttf9Db/nIfPk2xn5H1aPdRuXjz0Alh6YQQ3fgX/8/B01VHpsu0/LcohY5kfYXSJyvDfGqM9OCf6Yy3xYfBbshGLMLpTjv5oIhbWCVdEr77auO2UqHIpjRLdrfyZEqAR+Q2HUUYCrUPmR+yR+EhJcCcB2lqw1gsIh2z+A7CImU/40PGMp4fNnVT1depuq2dqjTkU6Io1HjAQOcJeG4+vd8ntOMnHuM6C/OdCjOMEpDxo24SOy3BnP9LhrHLqobO1w1lQcB4KgrcaUaUjDfVx8c/nAZPykCYJrKbYfvt7RTJtuJ4rK4XMo845ZZadhVSfiL2QTDrYJV8dVLi56fXJX413PKDpPd38fsdGyBOUNX55u2mqPqn2xPDbfa5MvfCwSfb9Ko6LCV0wq7qssMfxesh70iUN3oV2wJIDo9zAru7oLiqVVXXczzM8gCmymhd9jLuYBohtOs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(10070799003)(366016)(56012099006)(4143699003)(6133799003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tHjsldEBmau/XN5Yz2BHV/TNfYNOQoUlL0N5gu82KdmKdmRtF0H8iA5pHjz0?=
 =?us-ascii?Q?Cbrk0IheKuj/MMC7jJozlOHnVAzUZkDUjU5sRALzAJBWNR0heGq4/kAua74Z?=
 =?us-ascii?Q?oXWzKlahaD73P/Bee0WatwGV/eAnSnipTPIEIDN8DogGCN/mdXgo08Yqr9PU?=
 =?us-ascii?Q?WVr0YUxGcI8cPfsdbtcoT431u2CZrxDEKcchuGny6/f66tsfX6LuPg/BpW9J?=
 =?us-ascii?Q?Y61qV5wwDrU4V8wYzfSq0J2jVLt7Xl+zeRqRW21wgFs2fex0ZYubtTkgQvit?=
 =?us-ascii?Q?AXhzYK3c4ByKvJKJhd+x1thHSo22aWsIh5rrHhB41YsoXyQnSZbsZa0DGUyY?=
 =?us-ascii?Q?TOmu7fBAxSngLACzkFpg+No5nBOqQFBPOVAIyhXSAjdq78jTgyaQZgVHySu/?=
 =?us-ascii?Q?ycOd/PfQ/HJOdxDeLNUYJ5eGMEsg+mRGChe6dOSuKnEJJ3RJY6GTs6oFL+oH?=
 =?us-ascii?Q?9ohRqHuUpzxtfRPe7WVdeVuW92x593GAx7MioyTuZwfWLluOySgXe/BeENN6?=
 =?us-ascii?Q?QPMFRsuOeDLmqxkpkQqrM8RHY7frj7YeAxOGPahuSSRTAGeTpnHRShySwbmp?=
 =?us-ascii?Q?BZrd+S2/AfDwt1SVgGFk1B6h34Hk7p/nU+37ajyqhVkfalJRQw1H8VlzxkfQ?=
 =?us-ascii?Q?ddSKdKaNoStN3oP50gic2I7/t1Ekd3++z9hAqnOkmBMJViZcSUArq0lE2bQa?=
 =?us-ascii?Q?+klYx5R8Vh9qP8hMWdVYZLthbU1YCArU3+jWSodhtzYnUfrUmyzSMuZYfkaN?=
 =?us-ascii?Q?dJfBOoegmSIUCaXi1uOB226xwXmX29Jwdj8eWntMHiXNS0OWPCWeQ//PJMkS?=
 =?us-ascii?Q?OVxcaWl/ZtMX7IhXau4MLTPKw43/vljnOoNW6CkArI7MCNXqC/I3nxBLGjW2?=
 =?us-ascii?Q?Qwi0/NwABKtCNuqU6DthZ6edWrL3txh75UW2rgft2KHOktvUfs/eFdA9DAEB?=
 =?us-ascii?Q?kJmDAiDXf1nm4diC33dMOQ3gM2/LW4sYtKHl8PjHvtXQrbgGBN+v9cd2xUJO?=
 =?us-ascii?Q?tTnBr8P7NH66Z2FXalg6d8TTB9bOT+32rqyGVTgeDJAfNoFNm4xNygDV0o6e?=
 =?us-ascii?Q?mHlQ0vBu7RYHWvKOcPHX+rEjzmBNQDskPBzR42qQtWoni1zp81rLLDrZcQXb?=
 =?us-ascii?Q?p1TDY7Jg8M85UAbRqeSK4CA8NO0Qk/t2JiRJjmHZp03IUxTffLaCS/KQsaHT?=
 =?us-ascii?Q?+rf1ObC9dNDkahbRi2O89xYKIgMUzm3aWDzgaksm7c3nhHEqpVmm3d9YaqZc?=
 =?us-ascii?Q?woMx4zdommozufWROs/kUOAwKFYx6hS1S3fC3sJ3mlHKbbQlSSbVRwjniU08?=
 =?us-ascii?Q?dfOezKzHFHyFBHFFlpMzwQLMGxXMHRZW84VedFsvhrgfcPK81waJhEZrkYq7?=
 =?us-ascii?Q?VUnxsz/xvVcbzDCixKgxJ+WqKnbmD7NYSspwb48QPc589w9ecdebfYLUqOmx?=
 =?us-ascii?Q?kyntDIvAHWWuZTgyO49DhcxsKFR9t+EpaRLGjySlbYo/Y9aBbDdvPu3mIPTU?=
 =?us-ascii?Q?I5FP2bOd/nyyDJzqEROt6O4MYDJdE2lN3y2A8tA/7Lcx5SGe5cacnGzQIAjT?=
 =?us-ascii?Q?OstaAC+wafQ3Tc83Yby01pEzmEAyjjan6K5EA5wuLG5ZW+zNpW+TQAnnabPz?=
 =?us-ascii?Q?LxzlVcm8a3cqa25TyP217rKUlbPbNbgCrSQXeNqXiMGLbZYEwbUQKWq2kUSl?=
 =?us-ascii?Q?E/y0dMkap6xP5ZatNbfz47H78CWZ1JKALfYpYhYz/v8wMXqkm7D252Dd4mnx?=
 =?us-ascii?Q?j2poXu8Uy40QNJ8jGri2z1+YLDpcSGmxn8q0hzvknu6SrSqnRCqG?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e515ffc-25b1-4a73-92af-08df0aac8179
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 17:46:53.3313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2z6mp7L4OnxPBETv1YX0hQI35a9QTrhhPxvOsQya9rmLuBBquv27l2vb903bmXhIE9pZc/FQVSj4Dx72VPj6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTP286MB3579

On Sat, Sep 05, 2026 at 02:15:38AM +0900, Koichiro Den wrote:
> On Fri, Sep 04, 2026 at 10:41:47AM -0500, Frank Li wrote:
> > On Thu, Sep 03, 2026 at 03:45:32PM +0900, Koichiro Den wrote:
> > > An endpoint function can reserve an endpoint-local channel while the RC
> > > programs it through an exposed register window. Such a channel must route
> > > interrupts remotely and ignore them on the endpoint.
> > >
> > > Use dma_slave_config to set per-channel interrupt routing on idle channels
> > > of a local eDMA-compatible instance. Releasing a remote-routed channel
> > > quiesces the hardware and drains its local IRQ before restoring the default
> > > routing.
> > >
> > > The eDMA quiesce may stop a complete direction. The caller must own every
> > > channel in that direction and stop remote programming first.
> > >
> > > Suggested-by: Frank Li <Frank.Li@nxp.com>
> > > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > > ---
> > > Changes in v3:
> > >   - Add struct dw_edma_chan_config with validity flags for non-LL mode and
> > >     interrupt routing. (Frank)
> > >     https://lore.kernel.org/r/apWj7zzAw57U2r4F@SMW015318/
> > >   - Do not skip generic dma_slave_config fields when private settings are
> > >     supplied. (Sashiko)
> > >     https://lore.kernel.org/r/20260828164950.61AE51F000E9@smtp.kernel.org/
> > >   - Use READ_ONCE()/WRITE_ONCE() for IRQ mode accessed by shared handlers
> > >     and drain the channel IRQ before restoring local routing. (Sashiko)
> > >
> > >  drivers/dma/dw-edma/dw-edma-core.c | 135 ++++++++++++++++++++++-------
> > >  drivers/dma/dw-edma/dw-edma-core.h |   5 +-
> > >  include/linux/dma/edma.h           |  19 ++++
> > >  3 files changed, 126 insertions(+), 33 deletions(-)
> > >
> > > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > > index a678c70a78fe..e3786d960a43 100644
> > > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > > @@ -177,48 +177,79 @@ dw_edma_get_default_irq_mode(struct dw_edma_chan *chan)
> > >  						  DW_EDMA_CH_IRQ_REMOTE;
> > >  }
> > >
> > > +static int dw_edma_device_config_irq_mode(struct dw_edma_chan *chan,
> > > +					  enum dw_edma_ch_irq_mode mode)
> > > +{
> > > +	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) ||
> > > +	    (mode != DW_EDMA_CH_IRQ_LOCAL && mode != DW_EDMA_CH_IRQ_REMOTE))
> > > +		return -EINVAL;
> > > +
> > > +	guard(spinlock_irqsave)(&chan->vc.lock);
> > > +
> > > +	if (chan->configured || chan->status != EDMA_ST_IDLE ||
> > > +	    chan->request != EDMA_REQ_NONE)
> > > +		return -EBUSY;
> > > +
> > > +	WRITE_ONCE(chan->irq_mode, mode);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int dw_edma_device_config(struct dma_chan *dchan,
> > >  				 struct dma_slave_config *config)
> > >  {
> > > +	const struct dw_edma_chan_config *dw_config = config->peripheral_config;
> > >  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> > > -	bool cfg_non_ll;
> > > -	int non_ll = 0;
> > > -
> > > -	chan->non_ll = false;
> > > -	if (chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE) {
> > > -		if (config->peripheral_config &&
> > > -		    config->peripheral_size != sizeof(int)) {
> > > -			dev_err(dchan->device->dev,
> > > -				"config param peripheral size mismatch\n");
> > > +	bool non_ll = false;
> > > +	u32 flags = 0;
> > > +	int ret;
> > > +
> > > +	if (dw_config) {
> > > +		if (config->peripheral_size != sizeof(*dw_config) ||
> > > +		    dw_config->flags & ~(DW_EDMA_CH_CONFIG_NON_LL |
> > > +					 DW_EDMA_CH_CONFIG_IRQ_MODE))
> > > +			return -EINVAL;
> > > +		flags = dw_config->flags;
> > > +	}
> > > +
> > > +	/*
> > > +	 * When there is no valid LLP base address available then the
> > > +	 * default DMA ops will use the non-LL mode.
> > > +	 *
> > > +	 * When LL mode is the default, clients can request non-LL mode
> > > +	 * through DW_EDMA_CH_CONFIG_NON_LL.
> > > +	 */
> > > +	non_ll = chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE &&
> > > +		 chan->dw->chip->cfg_non_ll;
> > > +
> > > +	if (flags & DW_EDMA_CH_CONFIG_NON_LL) {
> > > +		if (chan->dw->chip->mf != EDMA_MF_HDMA_NATIVE)
> > > +			return -EINVAL;
> > > +
> > > +		if (chan->dw->chip->cfg_non_ll && !dw_config->non_ll) {
> > > +			dev_err(dchan->device->dev, "invalid configuration\n");
> > >  			return -EINVAL;
> > >  		}
> > >
> > > -		/*
> > > -		 * When there is no valid LLP base address available then the
> > > -		 * default DMA ops will use the non-LL mode.
> > > -		 *
> > > -		 * Cases where LL mode is enabled and client wants to use the
> > > -		 * non-LL mode then also client can do so via providing the
> > > -		 * peripheral_config param.
> > > -		 */
> > > -		cfg_non_ll = chan->dw->chip->cfg_non_ll;
> > > -		if (config->peripheral_config) {
> > > -			non_ll = *(int *)config->peripheral_config;
> > > +		non_ll = dw_config->non_ll;
> > > +	}
> > >
> > > -			if (cfg_non_ll && !non_ll) {
> > > -				dev_err(dchan->device->dev, "invalid configuration\n");
> > > -				return -EINVAL;
> > > -			}
> > > +	if (flags & DW_EDMA_CH_CONFIG_IRQ_MODE) {
> > > +		switch (chan->dw->chip->mf) {
> > > +		case EDMA_MF_EDMA_LEGACY:
> > > +		case EDMA_MF_EDMA_UNROLL:
> > > +		case EDMA_MF_HDMA_COMPAT:
> > > +			break;
> > > +		default:
> > > +			return -EINVAL;
> > >  		}
> > >
> > > -		if (cfg_non_ll || non_ll)
> > > -			chan->non_ll = true;
> > > -	} else if (config->peripheral_config) {
> > > -		dev_err(dchan->device->dev,
> > > -			"peripheral config param applicable only for HDMA\n");
> > > -		return -EINVAL;
> > > +		ret = dw_edma_device_config_irq_mode(chan, dw_config->irq_mode);
> > > +		if (ret)
> > > +			return ret;
> > >  	}
> > >
> > > +	chan->non_ll = non_ll;
> > >  	memcpy(&chan->config, config, sizeof(*config));
> > >  	chan->configured = true;
> > >
> > > @@ -890,11 +921,48 @@ static void dw_edma_wait_termination(struct dma_chan *dchan)
> > >  		 "timeout waiting for channel termination\n");
> > >  }
> > >
> > > +static void dw_edma_synchronize_chan_irq(struct dw_edma_chan *chan)
> > > +{
> > > +	struct dw_edma *dw = chan->dw;
> > > +	unsigned long *mask;
> > > +	int i;
> > > +
> > > +	/*
> > > +	 * With nr_irqs == 1, the common handler can enter for the other direction
> > > +	 * and retain a status snapshot for the remotely owned direction across
> > > +	 * quiesce. With multiple IRQs, the handler covering this channel can likewise
> > > +	 * enter for another IRQ sharer. Drain the IRQ whose mask contains the channel
> > > +	 * before restoring local routing.
> > > +	 */
> > > +	for (i = 0; i < dw->nr_irqs; i++) {
> > > +		mask = chan->dir == EDMA_DIR_WRITE ? dw->irq[i].wr_mask :
> > > +						     dw->irq[i].rd_mask;
> > > +		if (!test_bit(chan->id, mask))
> > > +			continue;
> > > +
> > > +		synchronize_irq(dw->chip->ops->irq_vector(dw->chip->dev, i));
> > > +		return;
> > > +	}
> > > +}
> > > +
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
> > > +	if (remote)
> > > +		dw_edma_synchronize_chan_irq(chan);
> > >  	cancel_work_sync(&chan->irq_work);
> > >  	atomic_set(&chan->irq_pending, 0);
> > >  	vchan_synchronize(&chan->vc);
> > > @@ -903,12 +971,17 @@ static void dw_edma_device_synchronize(struct dma_chan *dchan)
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
> > > +		if (chan->irq_mode != default_mode)
> > > +			WRITE_ONCE(chan->irq_mode, default_mode);
> > > +	}
> > >
> > >  	vchan_free_chan_resources(&chan->vc);
> > >  }
> > > diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> > > index f6a5ad317567..275d362d1805 100644
> > > --- a/drivers/dma/dw-edma/dw-edma-core.h
> > > +++ b/drivers/dma/dw-edma/dw-edma-core.h
> > > @@ -280,11 +280,12 @@ static inline bool
> > >  dw_edma_core_ch_ignore_irq(struct dw_edma_chan *chan)
> > >  {
> > >  	struct dw_edma *dw = chan->dw;
> > > +	enum dw_edma_ch_irq_mode mode = READ_ONCE(chan->irq_mode);
> > >
> > >  	if (dw->chip->flags & DW_EDMA_CHIP_LOCAL)
> > > -		return chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE;
> > > +		return mode == DW_EDMA_CH_IRQ_REMOTE;
> > >  	else
> > > -		return chan->irq_mode == DW_EDMA_CH_IRQ_LOCAL;
> > > +		return mode == DW_EDMA_CH_IRQ_LOCAL;
> > >  }
> > 
> > does this tunk fix something, you make this change later.
> 
> I added this for a possible race with the shared IRQ handler, especially when
> nr_irqs == 1.
> 
> ... but after carefully thinking about this again, the hunk seems unnecessary.
> 
> - Before undelegating (changing the irq_mode from REMOTE to LOCAL), the client
>   must stop remote programming, and the driver quiesces the direction and
>   synchronizes the local IRQ.
>   At that point, no-one is supposed to issue any transfer for the channel
> - Conversely, remote routing is configured while the channel is idle, before the
>   peer starts programming it.
> 
> If the peer continued programming during either transition, it just breaks
> things. READ_ONCE()/WRITE_ONCE() would not make the handoff safe.
> 
> I will drop this hunk and the corresponding WRITE_ONCE() use.
> 
> > 
> > >
> > >  #endif /* _DW_EDMA_CORE_H */
> > > diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
> > > index 3c8e2ef9dee0..93f866d57987 100644
> > > --- a/include/linux/dma/edma.h
> > > +++ b/include/linux/dma/edma.h
> > > @@ -101,6 +101,25 @@ enum dw_edma_ch_irq_mode {
> > >  	DW_EDMA_CH_IRQ_REMOTE,
> > >  };
> > >
> > > +#define DW_EDMA_CH_CONFIG_NON_LL	BIT(0)
> > 
> > you need update other non_ll user to set DW_EDMA_CH_CONFIG_NON_LL.
> 
> Ugh, I missed updating the existing non-LL user. I will respin.

Sorry, I spoke too soon here. I now remember checking this while preparing v3
and finding no existing in-tree non-LL peripheral_config user.

I just rechecked the dmaengine remote branches (and also Devendra's recent
submissions just in case), but still could not find one.
Did you have a particular user in mind?

Best regards,
Koichiro

> 
> Thanks for the review.
> 
> Best regards,
> Koichiro
> 
> > 
> > Frank
> > 
> > > +#define DW_EDMA_CH_CONFIG_IRQ_MODE	BIT(1)
> > > +
> > > +/**
> > > + * struct dw_edma_chan_config - dw-edma channel configuration
> > > + * @flags: fields selected by DW_EDMA_CH_CONFIG_*
> > > + * @non_ll: use HDMA non-linked-list mode
> > > + * @irq_mode: interrupt routing mode
> > > + *
> > > + * Pass this structure through dma_slave_config.peripheral_config. Before
> > > + * synchronizing a remote-routed channel, the client must stop remote
> > > + * programming and own every channel affected by the hardware quiesce.
> > > + */
> > > +struct dw_edma_chan_config {
> > > +	u32 flags;
> > > +	bool non_ll;
> > > +	enum dw_edma_ch_irq_mode irq_mode;
> > > +};
> > > +
> > >  /**
> > >   * struct dw_edma_chip - representation of DesignWare eDMA controller hardware
> > >   * @dev:		 struct device of the eDMA controller
> > > --
> > > 2.51.0
> > >
