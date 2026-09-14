Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021075.outbound.protection.outlook.com [40.107.74.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BEF4399E0;
	Mon, 14 Sep 2026 15:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789400947; cv=fail; b=g1hvH+fPx0uQd5gMULJ0jGDc40zsEiWeJoysKiPkIv46pHIL1L4naHXAtWS7f+nZzhVjCHL4Jb+JDxRJzxyr3ORQXNsq89rbnylw9wIk7FN/2GHYcVxca69liqGqqOJ4e9W6KAsjfap/ge4EAR3RAwvBOVEqNmoaBLnsWS/j9nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789400947; c=relaxed/simple;
	bh=sPHO56ENs4E7Vqwe/z57gQ07IH5lg8QWfxgbWOg/8/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o61imSCMfZKAvDnQRrWif4R6SHyFC7DPtQp4+C+Wgz02yqMWi3xg2qH9n9RKpTW98Q8W7W5hk9SJWwQVU5eDUErRu9VzTJA5T2wQVoiPcfHNQ2J9GZ3GtsXRtkUeRyTMYXxZ7+1dRjLhowCscjAQl5yKkeVBe5K+qiiNzo3oLPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=hilOUVrI; arc=fail smtp.client-ip=40.107.74.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="hilOUVrI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQ4taVllIeuY8IPzZxZVjHIbscMdzW0FPyKZam/eDljygZQA3zpcqfJKaQnLTfiB2+7658CHc8ZMrxTSebjCA1rPinI0zkTY5GPqNz46RgyOOz58Sq2m1iM9n+3ss1JzVX4XcnyY12Nt7XzyYRWLjVOeLk4wlcctO6mvP8STb8t5BE8rjxP17+1KtVo3fI6MLrVICecl71zmthsZFRecOb9JqXq2jg8YDO+iQ4Ifdk7HKBbP7qu2xyOIQWYAlkd7Tr5tf1QzMLQ/pHS/ITEJHhdnN2n6q7CH3QYEIfgXOvAQPX3QjYEgwf2QPjvCj1I0di/ujW0SXpPHHpvAk1ce3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+y0IAcGBJZ8H6blibMiA4qENsJbsTkkasC9V39wvqWg=;
 b=m3vjvAB9lKA8rlXyfYNUGlRFx1o0PkCWtDePshUT02m4BXvJzM92EqmOKz0yyvAd5sdfhwbWYbcfcTtjm7qnfLX8/xnOCiQ0G+3oZNzJFu36zskoMxEwXgjwc++Xe1azlip8oc/96k3kyMyPq4rdCboxr9GNQJ1vHUTy7MRsz80dcmsjG7sMo2sUtyrbzCb4Afy2GtCmpkDIOYn9YVmo8gYg6sM0g7zd6wDgcktehnDBwdhBMIRzJyD//mXOWjPj8EDpotRvynnsWvGD4wEJ1sAnTYMzRYKc/XTboXJUa9YpAM8btXQjL9yzYY2hBYZwgE4fWKRJG6Gh9Hh33Q5AIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+y0IAcGBJZ8H6blibMiA4qENsJbsTkkasC9V39wvqWg=;
 b=hilOUVrIZgJg5XtAnrlOZnjZ6A3TMqJZ/kNmzU9+7walvtESQ1lYDFEz3pgIXLHJTBP7aOt6A0tGQ08M0XFraP8eZZeyTyaklqlQk2UmoGMEA51xPqgVqgG88VyXdrAy8FZNQjr7HGEX4HHT4TOOSYUzsF//OWbkcfxn6Nf95tk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:325::11)
 by TYYP286MB4160.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:14f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 15:49:01 +0000
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9]) by TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 15:49:01 +0000
Date: Tue, 15 Sep 2026 00:49:00 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Devendra K Verma <devverma@amd.com>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dmaengine: dw-edma: Configure remote interrupt
 routing
Message-ID: <muwficrvayllrqlgfrgn5rqjvwo4dxghriqzhrh6fqeu3gjrst@rla66stbftvg>
References: <20260912174023.1227397-1-den@valinux.co.jp>
 <20260912174023.1227397-3-den@valinux.co.jp>
 <aqgRSbIFDuMOKkzF@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqgRSbIFDuMOKkzF@SMW015318>
X-ClientProxiedBy: TY6P301CA0034.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3ba::7) To TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:325::11)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB6866:EE_|TYYP286MB4160:EE_
X-MS-Office365-Filtering-Correlation-Id: d793f813-f926-425c-7db8-08df1277b279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10070799003|6133799003|22082099003|18002099003|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	4aUwl2/60M6Yp58xG6WcC1+lRmp2EZHnp1XpHFiRPDh44nc6q2msOcI4/Jr0//opmJVaf+FV6h8n02ouHdWuJC+SR0Z8hgOhbvzP7QWB0C4lPejIMRSi9070dPGbUkhQFRWVeSwjQbAAxTxU8Tpe4FeO+rHkWJ9iGHL4CAj/nDUqvXKir+djclC995uhhmkrKsDDIS391OcoJrJ9MIKyYxwhGyKTckTmUl8/8RFw7GWoJCnTNjlniFO+E9BYPBJj0DOE5esS4UnAaGP6U7wQXvs99xm51GhcOueyLhKQY5q9WT/enwe92+8KtXol6smcDrtdyjR3gfS5igHd6ukvja8+0Kpn5wP0WeYNnSfPcYet6RUlMLa2SR4jFCx6Ii+HzmcEdPBtV7P+E6PTFh4aQKvftmasnji3/9yM9tHbMzAR1+FrsCuOLg58TQFAt0JuVGAbh+5OMIXtRJSTMdprV2mso7Vn4NQd5iN79QGJv7sHBJERyEo2uNAMrD7L7/eKs+9hXHKzZ2t10RD4Xd0p3ggSgX2zL48KHTLBIXX55GweoInXNAJlHf3+OSeXyRU5t4OMVmn166lyOUITVuAFZyL6YE7FmOTFRxJTadwwuUk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10070799003)(6133799003)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UHNipb1bpXIA7Zf8kGf90Z7mZcS2zc0ypxKLIuLIbdP2nf7tvFluU4JIbJEU?=
 =?us-ascii?Q?9pwFSVlLA21ci4nGsQ2D+7Lp6yIUfPJz1DokMN3ObqVylRejf19Dw8KDx0N5?=
 =?us-ascii?Q?LqY98nuCTSeJVjA0rTYghlwaWLys/QetGe4PhvloCLU+jG+7jNpBssHX+tCJ?=
 =?us-ascii?Q?zkvKLhAV+e+Bb+G5YIvphXcUOo4mQuiohQp4mmu+bpHp8dUvgT+fZAXxOKSq?=
 =?us-ascii?Q?bsZf6o9It9YeiTzqSg5ie4JcUslv0yHNyyC3GKHZOhSA+sQyVkMefltnHn5q?=
 =?us-ascii?Q?dTG2HCY7oVQzpoWSA1srz0sWlAWbp4pG9TqWnN0M8yK/StasYqa1Hj2hpodd?=
 =?us-ascii?Q?j4vvZMbBr5squAC8lI6+n2RBBqm36bsft/fFaMc+9wpelQTFWTyq5GY/D2Mr?=
 =?us-ascii?Q?IgcGQ6GQfpymA3sa/xZlwGwysCHGsaFiJe3KEQzLLfk1OB2Be/wB3fG3+R+z?=
 =?us-ascii?Q?l72HOaXxQl2TbWR0S3DfNEtN+GuNn/GzutQ2cR1hiSu1XAKLlwhJ0UI0n40U?=
 =?us-ascii?Q?TJgP0J8DbVgAISEVsOCPYGnTbW7MYb4RZ1OWb5KmYYL+EaimlE7lWXe/OSo+?=
 =?us-ascii?Q?C5U+hqjxEH0+u90O3xiLHEG6LDmuwt8Df7hwDc1xj6sEDbokFGsHEWEapGjO?=
 =?us-ascii?Q?2/z30Go7+9av/JKnaLN0fNOB4/sQX3CUPGnGorv6jiIZyMD9JWlva8AM8uaJ?=
 =?us-ascii?Q?26LIWLplPRVEf1mvJCHwUXaStnWGaBiPYmUfXjlKoU2NMhiB+kIdWjOEBvuT?=
 =?us-ascii?Q?Qt42aZo12pjDL5GtNML4ZfcwRgiGWU359FBKyP4Ib5F5PCgggX047iMAeuPw?=
 =?us-ascii?Q?5DUe5Me9+hfwdWEkw6LHcQ6KHK87Jkb1gklvAGAC2KNcnyvxrxcxHupDNY5u?=
 =?us-ascii?Q?BLDirhnOZtr8Z4SnleB64kTwVzggFM2qwUc2okdK1yhJRSYaej0X8sm7pLCL?=
 =?us-ascii?Q?NHxV3jp97BOKtNdjJsfFm1XOwp8gPIQhzK3Xwt+3sj85NOzWjrcUTHm35qRZ?=
 =?us-ascii?Q?WlPBkM2I0bMgyuqpVBno8zWJbXYDMvr4yxsdOPWY6YsUdRoPa6dd5m1LT+B4?=
 =?us-ascii?Q?OC8iGUGtCzrsexJxa2USLVDfpcKOzqJytvSzIoqH9MiZtXZ53XSxCWLYZoV2?=
 =?us-ascii?Q?ZzKbanukgvEjmzvUNmQzGEfwxg1fUBdBpNad/YR07uGS9KgjbqlAUk/2DBr3?=
 =?us-ascii?Q?wkPGk8rS0GCPY1wgrEmzKXm/yeGifgVGJLDRc9iS9Bt2FDp1XQWAFkXpIasw?=
 =?us-ascii?Q?gNlpJ8p6LWfXw9pnDrq4MiNzPwljq7kd1MRjqyT1VPkzmjxMfwWAgmvXg+PT?=
 =?us-ascii?Q?ZYyQnPbLp2LJRpLx2efKDbxQgT/qM1qbdeim7GBU/YF3SB+6e6AVVVlREdZF?=
 =?us-ascii?Q?rJTysaa1K20VMAp099A+mX323FnitoZviCsCg3g5ZvCAHT/0y3qLTpSmfXfy?=
 =?us-ascii?Q?e156w2p+S/0r3FlhG97XpdoCrPmavFZ7VM9J2L9pv6qsycGjRNqKwNvajAlM?=
 =?us-ascii?Q?ZNa+mWD7g5Q5tLJAjU6C5WWtt2mMQ14tCb0u1brUzZvdbAJbKG1PHFizS0k8?=
 =?us-ascii?Q?54i78UYfttQJjQGzk2B8MCW6YNgkVdZgVswOJFXdC6e1uC2+2g5nOuaRW8Yh?=
 =?us-ascii?Q?SodrczWrJGoUZlj6FkZr0bvdPnSyoALpU2p6om32MzesBL1fxY3VNqcdy+5Q?=
 =?us-ascii?Q?JeSh8TGSdPqFneYt9VNmNkaJTXMCIGUucrGSffa5eXos6MrSeqX66ckQD9tG?=
 =?us-ascii?Q?UXp0GJLvdbHLMZowSwd+QDc7od9ir8HIApXPBFZJ/bmPEFtwpGVH?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: d793f813-f926-425c-7db8-08df1277b279
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 15:49:01.5512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QcSosKP4hZ879guNLwCwck1HSxABV8bv41D5X4QswNpDK64PSSXfrVM0d63hH2WxuMi3ZXKelU6i4zY1wbDYmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4160

On Mon, Sep 14, 2026 at 10:22:49AM -0500, Frank Li wrote:
> On Sun, Sep 13, 2026 at 02:40:22AM +0900, Koichiro Den wrote:
> > An endpoint function can reserve an endpoint-local channel while the RC
> > programs it through an exposed register window. Such a channel must route
> > interrupts remotely and ignore them on the endpoint.
> >
> > Use dma_slave_config to set per-channel interrupt routing on idle channels
> > of a local eDMA or HDMA instance. Releasing a remote-routed channel
> > quiesces the hardware and drains its local IRQ before restoring default
> > routing.
> >
> > The eDMA quiesce may stop a complete direction. The caller must own every
> > channel in that direction and stop remote programming first.
> >
> > Suggested-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> > Changes in v4:
> >   - Drop unnecessary READ_ONCE()/WRITE_ONCE() for irq_mode. (Frank)
> >   - Allow repeated dmaengine_slave_config() calls on idle channels
> >     when the IRQ mode is unchanged. (Sashiko)
> >   - Simplify IRQ mode handling, assuming the channel has no pending
> >     interrupt status when its mode changes. Treat racing reads by
> >     shared IRQ handlers and same-value stores on release as harmless.
> >   - Support native HDMA.
> >
> >  drivers/dma/dw-edma/dw-edma-core.c | 136 ++++++++++++++++++++++-------
> >  include/linux/dma/edma.h           |  21 +++++
> >  2 files changed, 125 insertions(+), 32 deletions(-)
> >
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > index a678c70a78fe..c978da30bac5 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > @@ -177,48 +177,76 @@ dw_edma_get_default_irq_mode(struct dw_edma_chan *chan)
> >  						  DW_EDMA_CH_IRQ_REMOTE;
> >  }
> >
> > +static int dw_edma_device_config_irq_mode(struct dw_edma_chan *chan,
> > +					  enum dw_edma_ch_irq_mode mode)
> > +{
> > +	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) ||
> > +	    (mode != DW_EDMA_CH_IRQ_LOCAL && mode != DW_EDMA_CH_IRQ_REMOTE))
> > +		return -EINVAL;
> > +
> > +	guard(spinlock_irqsave)(&chan->vc.lock);
> > +
> > +	if (chan->status != EDMA_ST_IDLE || chan->request != EDMA_REQ_NONE)
> > +		return -EBUSY;
> > +
> > +	/* IRQ routing cannot change after the initial configuration. */
> > +	if (chan->irq_mode == mode)
> > +		return 0;
> > +
> > +	if (chan->configured)
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
> > +	const struct dw_edma_chan_config *dw_config = config->peripheral_config;
> >  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> > -	bool cfg_non_ll;
> > -	int non_ll = 0;
> > -
> > -	chan->non_ll = false;
> > -	if (chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE) {
> > -		if (config->peripheral_config &&
> > -		    config->peripheral_size != sizeof(int)) {
> > -			dev_err(dchan->device->dev,
> > -				"config param peripheral size mismatch\n");
> > +	bool non_ll = false;
> > +	u32 flags = 0;
> > +	int ret;
> > +
> > +	if (dw_config) {
> > +		if (config->peripheral_size != sizeof(*dw_config) ||
> > +		    dw_config->flags & ~(DW_EDMA_CH_CONFIG_NON_LL |
> > +					 DW_EDMA_CH_CONFIG_IRQ_MODE))
> >  			return -EINVAL;
> > -		}
> > +		flags = dw_config->flags;
> > +	}
> >
> > -		/*
> > -		 * When there is no valid LLP base address available then the
> > -		 * default DMA ops will use the non-LL mode.
> > -		 *
> > -		 * Cases where LL mode is enabled and client wants to use the
> > -		 * non-LL mode then also client can do so via providing the
> > -		 * peripheral_config param.
> > -		 */
> > -		cfg_non_ll = chan->dw->chip->cfg_non_ll;
> > -		if (config->peripheral_config) {
> > -			non_ll = *(int *)config->peripheral_config;
> > +	/*
> > +	 * When there is no valid LLP base address available then the
> > +	 * default DMA ops will use the non-LL mode.
> > +	 *
> > +	 * When LL mode is the default, clients can request non-LL mode
> > +	 * through DW_EDMA_CH_CONFIG_NON_LL.
> > +	 */
> > +	non_ll = chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE &&
> > +		 chan->dw->chip->cfg_non_ll;
> >
> > -			if (cfg_non_ll && !non_ll) {
> > -				dev_err(dchan->device->dev, "invalid configuration\n");
> > -				return -EINVAL;
> > -			}
> > +	if (flags & DW_EDMA_CH_CONFIG_NON_LL) {
> > +		if (chan->dw->chip->mf != EDMA_MF_HDMA_NATIVE)
> > +			return -EINVAL;
> > +
> > +		if (chan->dw->chip->cfg_non_ll && !dw_config->non_ll) {
> > +			dev_err(dchan->device->dev, "invalid configuration\n");
> > +			return -EINVAL;
> >  		}
> >
> > -		if (cfg_non_ll || non_ll)
> > -			chan->non_ll = true;
> > -	} else if (config->peripheral_config) {
> > -		dev_err(dchan->device->dev,
> > -			"peripheral config param applicable only for HDMA\n");
> > -		return -EINVAL;
> > +		non_ll = dw_config->non_ll;
> > +	}
> > +
> > +	if (flags & DW_EDMA_CH_CONFIG_IRQ_MODE) {
> > +		ret = dw_edma_device_config_irq_mode(chan, dw_config->irq_mode);
> > +		if (ret)
> > +			return ret;
> >  	}
> >
> > +	chan->non_ll = non_ll;
> >  	memcpy(&chan->config, config, sizeof(*config));
> >  	chan->configured = true;
> >
> > @@ -890,11 +918,53 @@ static void dw_edma_wait_termination(struct dma_chan *dchan)
> >  		 "timeout waiting for channel termination\n");
> >  }
> >
> > +static void dw_edma_synchronize_chan_irq(struct dw_edma_chan *chan)
> > +{
> > +	struct dw_edma *dw = chan->dw;
> > +	unsigned long *mask;
> > +	int i;
> > +
> > +	/*
> > +	 * A shared handler may retain this channel's status across quiesce.
> > +	 * With nr_irqs == 1, it scans both directions even if routing and
> > +	 * delegation are direction-wide. Drain it before allowing a routing change.
> > +	 */
> > +	for (i = 0; i < dw->nr_irqs; i++) {
> > +		mask = chan->dir == EDMA_DIR_WRITE ? dw->irq[i].wr_mask :
> > +						     dw->irq[i].rd_mask;
> > +		if (!test_bit(chan->id, mask))
> > +			continue;
> > +
> > +		synchronize_irq(dw->chip->ops->irq_vector(dw->chip->dev, i));
> > +		return;
> > +	}
> > +}
> > +
> >  static void dw_edma_device_synchronize(struct dma_chan *dchan)
> >  {
> >  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> > +	bool remote;
> > +
> > +	/*
> > +	 * irq_mode is fixed after initial configuration. The free path
> > +	 * restores it only after synchronization.
> > +	 */
> > +	remote = chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL &&
> > +		 chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE;
> > +
> > +	/*
> > +	 * Peer-driven transfers bypass local descriptor tracking, so quiesce
> > +	 * the hardware explicitly.
> > +	 */
> > +	if (remote && dw_edma_core_ch_quiesce(chan))
> > +		dev_warn(chan->dw->chip->dev,
> > +			 "failed to quiesce remote-routed %s channel %u\n",
> > +			 chan->dir == EDMA_DIR_WRITE ? "write" : "read",
> > +			 chan->id);
> >
> >  	dw_edma_wait_termination(dchan);
> > +	if (remote)
> > +		dw_edma_synchronize_chan_irq(chan);
> >  	cancel_work_sync(&chan->irq_work);
> >  	atomic_set(&chan->irq_pending, 0);
> >  	vchan_synchronize(&chan->vc);
> > @@ -907,8 +977,10 @@ static void dw_edma_free_chan_resources(struct dma_chan *dchan)
> >  	dw_edma_device_terminate_all(dchan);
> >  	dw_edma_device_synchronize(dchan);
> >
> > -	scoped_guard(spinlock_irqsave, &chan->vc.lock)
> > +	scoped_guard(spinlock_irqsave, &chan->vc.lock) {
> >  		chan->configured = false;
> > +		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
> > +	}
> >
> >  	vchan_free_chan_resources(&chan->vc);
> >  }
> > diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
> > index 3c8e2ef9dee0..43831fa57357 100644
> > --- a/include/linux/dma/edma.h
> > +++ b/include/linux/dma/edma.h
> > @@ -101,6 +101,27 @@ enum dw_edma_ch_irq_mode {
> >  	DW_EDMA_CH_IRQ_REMOTE,
> >  };
> >
> > +#define DW_EDMA_CH_CONFIG_NON_LL	BIT(0)
> > +#define DW_EDMA_CH_CONFIG_IRQ_MODE	BIT(1)
> > +
> > +/**
> > + * struct dw_edma_chan_config - dw-edma channel configuration
> > + * @flags: fields selected by DW_EDMA_CH_CONFIG_*
> > + * @non_ll: use HDMA non-linked-list mode
> > + * @irq_mode: interrupt routing mode
> > + *
> > + * Pass this structure through dma_slave_config.peripheral_config. Before
> > + * synchronizing a remote-routed channel, the client must stop remote
> > + * programming and own every channel affected by the hardware quiesce: the
> > + * entire direction for eDMA-compatible layouts, or the individual channel for
> > + * native HDMA.
> > + */
> > +struct dw_edma_chan_config {
> > +	u32 flags;
> > +	bool non_ll;
> > +	enum dw_edma_ch_irq_mode irq_mode;
> > +};
> > +
> 
> Do you have any user in kernel tree use non_ll?

I don't think so.

Devendra, I would appreciate your input here, if you have any thoughts on
Frank's question, or the new dw_edma_chan_config. I haven't found any in-tree
user of the non-LL peripheral_config interface introduced here:
https://lore.kernel.org/r/20260318070403.1634706-3-devendra.verma@amd.com/
so I guess any users would be out-of-tree at least as of now, unless I'm missing
something.

Best regards,
Koichiro

> 
> Frank
> 
> >  /**
> >   * struct dw_edma_chip - representation of DesignWare eDMA controller hardware
> >   * @dev:		 struct device of the eDMA controller
> > --
> > 2.51.0
> >
