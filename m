Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020087.outbound.protection.outlook.com [52.101.228.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9333BADA9;
	Mon, 14 Sep 2026 15:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401218; cv=fail; b=O293UA/ofP2dAsqsQR4mnyg6pF2O3cZ2LlvlOBUl1FNEK8mDEjiGpZRklFxTqfXlvkkvjmFz2s+TW8lBTyLOOOr7kQpqJ1GD8K2P0MkKtxFxvtStTOudmMIU4EVwDFnaLUZ6H+ILwhZLVL+/YfArLLlju0CJu4qwCWk67Gjd9/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401218; c=relaxed/simple;
	bh=GFYSQVzU1S5zSsJQprgaWti8c5n7CyChufzt0LmGi+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=U05h0V2zuiXAxOzsX6smDf0bHtk/oW//fcUgFhL1f0oT+I9CdeTq6aakOPI2dpFg2A6xKBbqX3XY/Ww+0ZWWvcCvBrOGcn6GC7JUNHTQ5B+M2FUVphj7/67+l2iwhUFQu1/zdV0wUVEM97SqyqgZP0NaCWbDiQViS04ZpvDEEeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=FcNUodWx; arc=fail smtp.client-ip=52.101.228.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="FcNUodWx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+VE5SzCU3pTHciS2UGs12eB7ytdhldW1u1Yzo0/4DEpf3NEFVEOwxgIlaxiSqJsUhngtgixNnKbxLRwYt8RIVscf+iYnbpUxBdxUe7yBhUnAo0ctlBB2+jPN8q7YDOftA0C8sIFakCCYz4+eKjtOn4v39S3Z3yYRn0X8kzq+pxNwoC4Gd/TdQV+jdA0LygxfE/9lsXzsTsEtTF/oBJ19kgCWOWGceEAkEts2WX5dzs5b901uBCf9rg97bfVOPJYGHfemrmVZsfJ4B+dAt4WgOV81t/MW9JJlbuIAlN4zqbQ3+SjQFB1xHyVjbw0YXVVAjkOSbC4F/IAcncUF4rGeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LC6faT/j8rjMZtQ65YgC2BrqNX/wUKEy2nYe5w3lcA=;
 b=HIhzTqUOqh2xQiCX1Yfsh3nSgMyL/uev/i3kwMrTkxg6sbDKkrjWqk6bX0xe7CsPel0kH+tWr0sCNUHcwK6mw1ElRrM6PBjm95LXPLY5YIpdSJ4rR6aYNMJTMF08J0t5lqfZKG5I03O4HAlYGcO74Qkd67tCW3JF9uuecGMkF+r7/D6QtI+TyvB+VeHbr0eCrdxVfHZeofp7kIGuiTTNHnFgxUZ8AvZOHdSxq/83491vqU6clD5MhfnQcW6Jm7iKmthTH3uraUoJqLOEjKq3EK7oI0Dhj632y+xoiQjq1UVX9Olzx1WWL8LkGdrhKutlKxxqIU3nBUJZPSMGpZTXvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LC6faT/j8rjMZtQ65YgC2BrqNX/wUKEy2nYe5w3lcA=;
 b=FcNUodWxR1cvIsC6hwxZ+DrW032tIWsZtxfMT30YyOWlTBdB7wFO1HqGQSEpKIQqijWTgS+kI9wwX+zeD5+0fNk/V0emC2K3H03KE/tOTl7D15ZtkeovEBpa7N2GjS0uGLhbm1xMeFhr6dhJOfcAduCRGXLa0wzmD4f0D07kuHU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:325::11)
 by TYYP286MB4160.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:14f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 15:53:34 +0000
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9]) by TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 15:53:34 +0000
Date: Tue, 15 Sep 2026 00:53:33 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>, Devendra K Verma <devverma@amd.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dmaengine: dw-edma: Configure remote interrupt
 routing
Message-ID: <l4ujqwjxdolhfkqvgyxgoh4yf6c73ddpew2flyeqszpshwbox3@y7vuhyurodo7>
References: <20260912174023.1227397-1-den@valinux.co.jp>
 <20260912174023.1227397-3-den@valinux.co.jp>
 <aqgRSbIFDuMOKkzF@SMW015318>
 <muwficrvayllrqlgfrgn5rqjvwo4dxghriqzhrh6fqeu3gjrst@rla66stbftvg>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <muwficrvayllrqlgfrgn5rqjvwo4dxghriqzhrh6fqeu3gjrst@rla66stbftvg>
X-ClientProxiedBy: TY4P286CA0037.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::11) To TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:325::11)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB6866:EE_|TYYP286MB4160:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df2a524-15ef-4b89-5696-08df127854dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10070799003|6133799003|22082099003|18002099003|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	OvPyjeSCQ9QH3Ywq7aHRGsxFpEzOi2IPpW0t/Qii49It8zcnQDZUElkN2BnL8naCl8TqOq5vVByCMFaCYHlXypm/NwcaFS0AgP8rqFma9IsQdwLJDCvUax+UsO2/OfJ6pag4EnpwW1KR0eEJBlQKt55GO4QJPmRX4+fCbclDrdP1Z/kTHNJCLPnNAKZnaNgwP0VvQVOE0mtjLww388ON7eNM3AJazr8kDTfiZgtr0hZRKgOt1fljRedt0KITTEZHALosw9lg27XdorH/GoJtbMltAcdaT8Bpvykn2Vz0TMiKsCPceDg2ijI9oRiy2vj3NDeZKU42c55JqaWk6ogXCHZngxOpbZphIiV8rTGFd5NQYLf741kZ44avfMlsbB236xWamvIqmIt4fJic+Ptmwk/LoIk0kB4Q4g6owl+OWPa2bQ1aeQwrXP4vF3nrUqiwtJaxLOSyZR8vDkpbImLG/14xgM/pbE6RIX1pyYc7bqvS8RfwoPIMAtDsIrIiBNeul9Zuof1At/+vkrbZ/cBXEXEaHDr3ix6FovpQum7m7eHtpxsuArOWfReIVy5VpTqe4+96QoVZ4ru2XswXeosCy5GFQItKyfTsYBW970LREreNoC9UOfy/F0apbu7mj7gX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10070799003)(6133799003)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?opolO48XcA/XpwZOoNc7u/+TqfuY70e1aMYWr0NoBkky3cUXyNmmiaA3bDfA?=
 =?us-ascii?Q?0dG9M/5NYr2Zq7YqrQ9k/2tUyXqSB8mP0Ux/8BrYOjAxizbYOlQTePp9QQiM?=
 =?us-ascii?Q?Y1n5TCuMVFMuT0WuIZnuZtIzlzYBBlkZg12+5Okon58pQf6uVAU+S59UU/zs?=
 =?us-ascii?Q?8XBUGuh2D78xfI//hXvB6MXFJKcnP9rJrpC7yJwD9V4vlCnZ6pcIGOF9U6iH?=
 =?us-ascii?Q?qyefxh9S2BmkeLSDOhbEI2oTdGoH7v7aV/epfqPgArwL1qLbZ1u0CctQnHk3?=
 =?us-ascii?Q?N/3dMdm8rx4MkUlOQsyVA+c7Gv/OT62nZ9FOCjvGWym3bTHetZqUFJNOb62Z?=
 =?us-ascii?Q?m15iPFm+5a0uhPfEbFwg95dkc8LHWbOcKcQaWObfBIFtWpj9ynjhMnPYu3xT?=
 =?us-ascii?Q?oG4y3WAEPCSCM5wD6EjeZ4dNxYMz1kDGjfAVEef4vLkNEaRWkHoxmTnQwIlA?=
 =?us-ascii?Q?/KpVCRSGkOV8m3jxZD8XzULaH+/83It5cqcX6vlE2bDfv1tP14W/nefK0PFe?=
 =?us-ascii?Q?g5mQyOmcUyNECzxhwQX/bkYHDXj/jMaWYHNz+zEanHI5q1Vr6kvArdErkagY?=
 =?us-ascii?Q?9RSRul/FGQvHoRGzOhn2nxZXw4ElqLpeM1hdcnfrWwPj+Ra9kPgsgC1EtURg?=
 =?us-ascii?Q?6jH4wzp5GqGuKDE9Ohwp7/ljkblf3ag/Kf2Q3oPGi6nvqH/KdoGs4ewHTnqi?=
 =?us-ascii?Q?xBS+TrRPZiEfPIcOfXn7aoYAk6HoWsyVLLQnMgAvhuwyFd+GTYf9uUb1ZiAl?=
 =?us-ascii?Q?UQGV4aUjKD7/2KItFPxfHBZN/RfgK2gPC2M8/ZQvZuHWZbM3KvU0t55lc4+Y?=
 =?us-ascii?Q?DQN9gs/lOpumlugbnQRhXv8Olcm2G5DQgXGjRTfwgs4stMyyT8E4qC5yBqaA?=
 =?us-ascii?Q?y++2zXOfslpbHdRnNtO9al+y/LreJi8hZ88H88QwJQuw/jWxl0IRBQrEM9tR?=
 =?us-ascii?Q?Jzw9THTEa6GeTSUO+Cw8t1ssU37KviwECbfLgG19Q7SK9sbx7YSoRcjn9BgM?=
 =?us-ascii?Q?aDcedIFvhh/JxHX9iJvfQT4luD2cigBluV8jQ6ekZuODBtpTBjviHcfHDsUF?=
 =?us-ascii?Q?dqfMJgVP8/RaOeqfUn229fCMVSyk0jGyNuYvOlDBb8uBfkHLGxyzFZzltntj?=
 =?us-ascii?Q?+yMRfEwcdYGRhYSjC/Ov9pk4WlVRtHUBx8C3GvDy59jEx2D/JAhOAUZxxw4p?=
 =?us-ascii?Q?s9k1acE09mkoJz2k8HnlczvU9JrtDtm9OR+AxmdXFt6qAYztlenWI3C1v5TA?=
 =?us-ascii?Q?eUVBd6ZhS0QLlYr62+litIx5vZ9nNIKbKMQ/5a4BafF2T+uOUHdialMxL2GK?=
 =?us-ascii?Q?jt7oFgLRjrbUuwRCofxjV6OvQmX9lW/VrM+nuSYrpkKSTfNa/afWRH8sZ3Mk?=
 =?us-ascii?Q?qX/dEKEGepMIB0Av51KISlWPGsFtiOvIdEihWyGnGFI8694vFfjd0T+pKqLe?=
 =?us-ascii?Q?1Kg6qsWvKOP91EFLdHIE0Zds9p/QwdescHhONuJBQ4NDv8LjJOOJeJo7miSi?=
 =?us-ascii?Q?uAR1lWogO/T9gyoPr+3+b2CTSonHI5TYdanZngtAmppvtZfmYUTCWWBKLl61?=
 =?us-ascii?Q?MmM152GJZh2FjSqg/FbjRPiFBlfcHzYurzLHRaPd/obCa1pLOqtEYo5IXXXU?=
 =?us-ascii?Q?jFbWFeHa1CSz5OLqtlCbMRnTs8837ETJMKGJyfAkAW61a+m4Era4nAdeScMx?=
 =?us-ascii?Q?aoQ8yzxJ902My8IPvXNIrnyxRScT6fp9+JlmRZxmi7rM4GnSGuYXRL8iq4sh?=
 =?us-ascii?Q?dOTqbT8gBSje5UtaE0+oe15TqPiZTTsipj9YgGcUl3SeCsigklEp?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df2a524-15ef-4b89-5696-08df127854dc
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 15:53:33.9689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +idClWxM5OszJYhglsvWO3w1czOfy37mlZzGc3TqBbacazod6IPlAIOSoTauAcZBhCSzALaZnQDj2bT1hrQWHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4160

On Tue, Sep 15, 2026 at 12:49:01AM +0900, Koichiro Den wrote:
> On Mon, Sep 14, 2026 at 10:22:49AM -0500, Frank Li wrote:
> > On Sun, Sep 13, 2026 at 02:40:22AM +0900, Koichiro Den wrote:
> > > An endpoint function can reserve an endpoint-local channel while the RC
> > > programs it through an exposed register window. Such a channel must route
> > > interrupts remotely and ignore them on the endpoint.
> > >
> > > Use dma_slave_config to set per-channel interrupt routing on idle channels
> > > of a local eDMA or HDMA instance. Releasing a remote-routed channel
> > > quiesces the hardware and drains its local IRQ before restoring default
> > > routing.
> > >
> > > The eDMA quiesce may stop a complete direction. The caller must own every
> > > channel in that direction and stop remote programming first.
> > >
> > > Suggested-by: Frank Li <Frank.Li@nxp.com>
> > > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > > ---
> > > Changes in v4:
> > >   - Drop unnecessary READ_ONCE()/WRITE_ONCE() for irq_mode. (Frank)
> > >   - Allow repeated dmaengine_slave_config() calls on idle channels
> > >     when the IRQ mode is unchanged. (Sashiko)
> > >   - Simplify IRQ mode handling, assuming the channel has no pending
> > >     interrupt status when its mode changes. Treat racing reads by
> > >     shared IRQ handlers and same-value stores on release as harmless.
> > >   - Support native HDMA.
> > >
> > >  drivers/dma/dw-edma/dw-edma-core.c | 136 ++++++++++++++++++++++-------
> > >  include/linux/dma/edma.h           |  21 +++++
> > >  2 files changed, 125 insertions(+), 32 deletions(-)
> > >
> > > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > > index a678c70a78fe..c978da30bac5 100644
> > > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > > @@ -177,48 +177,76 @@ dw_edma_get_default_irq_mode(struct dw_edma_chan *chan)
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
> > > +	if (chan->status != EDMA_ST_IDLE || chan->request != EDMA_REQ_NONE)
> > > +		return -EBUSY;
> > > +
> > > +	/* IRQ routing cannot change after the initial configuration. */
> > > +	if (chan->irq_mode == mode)
> > > +		return 0;
> > > +
> > > +	if (chan->configured)
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
> > >  			return -EINVAL;
> > > -		}
> > > +		flags = dw_config->flags;
> > > +	}
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
> > > +	/*
> > > +	 * When there is no valid LLP base address available then the
> > > +	 * default DMA ops will use the non-LL mode.
> > > +	 *
> > > +	 * When LL mode is the default, clients can request non-LL mode
> > > +	 * through DW_EDMA_CH_CONFIG_NON_LL.
> > > +	 */
> > > +	non_ll = chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE &&
> > > +		 chan->dw->chip->cfg_non_ll;
> > >
> > > -			if (cfg_non_ll && !non_ll) {
> > > -				dev_err(dchan->device->dev, "invalid configuration\n");
> > > -				return -EINVAL;
> > > -			}
> > > +	if (flags & DW_EDMA_CH_CONFIG_NON_LL) {
> > > +		if (chan->dw->chip->mf != EDMA_MF_HDMA_NATIVE)
> > > +			return -EINVAL;
> > > +
> > > +		if (chan->dw->chip->cfg_non_ll && !dw_config->non_ll) {
> > > +			dev_err(dchan->device->dev, "invalid configuration\n");
> > > +			return -EINVAL;
> > >  		}
> > >
> > > -		if (cfg_non_ll || non_ll)
> > > -			chan->non_ll = true;
> > > -	} else if (config->peripheral_config) {
> > > -		dev_err(dchan->device->dev,
> > > -			"peripheral config param applicable only for HDMA\n");
> > > -		return -EINVAL;
> > > +		non_ll = dw_config->non_ll;
> > > +	}
> > > +
> > > +	if (flags & DW_EDMA_CH_CONFIG_IRQ_MODE) {
> > > +		ret = dw_edma_device_config_irq_mode(chan, dw_config->irq_mode);
> > > +		if (ret)
> > > +			return ret;
> > >  	}
> > >
> > > +	chan->non_ll = non_ll;
> > >  	memcpy(&chan->config, config, sizeof(*config));
> > >  	chan->configured = true;
> > >
> > > @@ -890,11 +918,53 @@ static void dw_edma_wait_termination(struct dma_chan *dchan)
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
> > > +	 * A shared handler may retain this channel's status across quiesce.
> > > +	 * With nr_irqs == 1, it scans both directions even if routing and
> > > +	 * delegation are direction-wide. Drain it before allowing a routing change.
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
> > > +	/*
> > > +	 * irq_mode is fixed after initial configuration. The free path
> > > +	 * restores it only after synchronization.
> > > +	 */
> > > +	remote = chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL &&
> > > +		 chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE;
> > > +
> > > +	/*
> > > +	 * Peer-driven transfers bypass local descriptor tracking, so quiesce
> > > +	 * the hardware explicitly.
> > > +	 */
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
> > > @@ -907,8 +977,10 @@ static void dw_edma_free_chan_resources(struct dma_chan *dchan)
> > >  	dw_edma_device_terminate_all(dchan);
> > >  	dw_edma_device_synchronize(dchan);
> > >
> > > -	scoped_guard(spinlock_irqsave, &chan->vc.lock)
> > > +	scoped_guard(spinlock_irqsave, &chan->vc.lock) {
> > >  		chan->configured = false;
> > > +		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
> > > +	}
> > >
> > >  	vchan_free_chan_resources(&chan->vc);
> > >  }
> > > diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
> > > index 3c8e2ef9dee0..43831fa57357 100644
> > > --- a/include/linux/dma/edma.h
> > > +++ b/include/linux/dma/edma.h
> > > @@ -101,6 +101,27 @@ enum dw_edma_ch_irq_mode {
> > >  	DW_EDMA_CH_IRQ_REMOTE,
> > >  };
> > >
> > > +#define DW_EDMA_CH_CONFIG_NON_LL	BIT(0)
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
> > > + * programming and own every channel affected by the hardware quiesce: the
> > > + * entire direction for eDMA-compatible layouts, or the individual channel for
> > > + * native HDMA.
> > > + */
> > > +struct dw_edma_chan_config {
> > > +	u32 flags;
> > > +	bool non_ll;
> > > +	enum dw_edma_ch_irq_mode irq_mode;
> > > +};
> > > +
> > 
> > Do you have any user in kernel tree use non_ll?
> 
> I don't think so.
> 
> Devendra, I would appreciate your input here, if you have any thoughts on
> Frank's question, or the new dw_edma_chan_config. I haven't found any in-tree
> user of the non-LL peripheral_config interface introduced here:
> https://lore.kernel.org/r/20260318070403.1634706-3-devendra.verma@amd.com/
> so I guess any users would be out-of-tree at least as of now, unless I'm missing
> something.

Ouch, I meant to put Devendra in To, not Cc. Sorry for the noise.

Best regards,
Koichiro

> 
> Best regards,
> Koichiro
> 
> > 
> > Frank
> > 
> > >  /**
> > >   * struct dw_edma_chip - representation of DesignWare eDMA controller hardware
> > >   * @dev:		 struct device of the eDMA controller
> > > --
> > > 2.51.0
> > >
