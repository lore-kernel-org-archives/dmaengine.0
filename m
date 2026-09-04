Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021081.outbound.protection.outlook.com [52.101.125.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B195111A8;
	Fri,  4 Sep 2026 17:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542145; cv=fail; b=DLyF22rMgyv5xjvVkg6SqCl5PG9ZlyXYvH4i7vX+GjYeuEsLmeley2JkC+ZRmVDtKkp+Bd+3CRksQOp07IVrbycJw819JgfeZpe8WqiKGxQ2yRLtpp28T9ysqQrhnLe5Z1grq2rlizw/0p9jaIJQCEK7fh0Nt9KCz1l3S7zjd6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542145; c=relaxed/simple;
	bh=Lo34/ESmLVIdFffi+yxGVLIWdpXO7f9ZP1uG12MbF7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BEWWgSd1fS6SG+VJ6/iJhdgshGDVU7SoK0e8p0wyI8DfmBcRCKyz+NOqFqKoJ8xOQ2aD91MZ/UH/lOZmPK3hsQ4/vI0vENHKoX07X2Ko2BSXn/xvKuJpqsjuMpYYknYpaHg436Xyuak4BIYLcKEAGT7/T+0SeDnHwYk6eal/w5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=fWijuY6M; arc=fail smtp.client-ip=52.101.125.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="fWijuY6M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WuN8WRF+jWeBshuUi03Y0m2pSn4+PMN/sdgt7AmGKXRka7cwXJEfeYQZQTG3X3ZmFQI0hNSHD89p0SNf9qankwPhgMfVwdgSD8r5LI8igrjOLxxiZgmsW8FP1HVaBY3uUotI1NTThNX8TuckC9OBGyiJWWTA4h/T8A2l47W/4pFKRFKjAjW+y7FV/39jXEdNegndqmPMbk5WEUi5T0r1CkjEFidUHWnznyk0P4GkQuwPs1uuJVs5O42Cg+tjzE/8qQ3NcBRp560kkjRgvoX9NmA01ZGcwik1vqOnmZB/Jgj+miWVSNpHOhtcrgSsDRXsFqvgDWQayVY0yQnWVd6Rmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnFu2n368/wyL/h+A9uJmjbrffqV1I0VQzCVDT9JqaU=;
 b=DXtoCUG6qLR+q0DGup9LhNvtTrnrvtCGZ0bXntnS48LvZI4GcnSE4jBseF22HCxV28sN6aWbC8U3rzgiTLSitF9qMKYy+2YkNPil2WJ5474n2dWwaXEC+csCgSgY9j1d0N418JyqTVKckxK9uUs/skgyfIMlU6CURngxL1V6SdZVc9ako947omjr4HkivDqxBFMx8rIni0TO7nt6Pp72GGepgJcZzpnB2w0YVAVOvcMv6adUQUE4eMiwQ7SGcoO4m74mngyi0L5DxrwsRWtg8jFKP6+X5RRlj16nVg44Z/UW3wx6B+Q1xmoSuwBel1iPtXcE6EGM8SaOYaphREWRdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnFu2n368/wyL/h+A9uJmjbrffqV1I0VQzCVDT9JqaU=;
 b=fWijuY6M+J2vNrZhZac6htZF650dqYHW7Gg3QIuEHDRFUjXw0iQyMhYuSw7paIte5/GAaaRioYuAXOoBX3d5UcBlHrBgJWlUL8kHAE4yAiJqEYh+nJiQMX5JrdhItrwX8EcfrMNWb/X7waKrRssc+M0HjazLmhVPN5hfGtf+f9g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY1P286MB3422.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 17:15:40 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 17:15:39 +0000
Date: Sat, 5 Sep 2026 02:15:38 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Devendra K Verma <devverma@amd.com>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dmaengine: dw-edma: Configure remote interrupt
 routing
Message-ID: <75noofzi2u3gc4gyjgiiuprhth6zesufqtytbpun2ew45bewda@nhu24spu2cyw>
References: <20260903064533.2269557-1-den@valinux.co.jp>
 <20260903064533.2269557-3-den@valinux.co.jp>
 <aprmu6McROxJrDLW@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aprmu6McROxJrDLW@SMW015318>
X-ClientProxiedBy: TY4P286CA0048.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY1P286MB3422:EE_
X-MS-Office365-Filtering-Correlation-Id: aba4a628-fb9e-47bd-58b5-08df0aa824cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|10070799003|366016|6133799003|4143699003|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	uM7Mx3hTeaa9ykvH/5Gx2X/IarsNgggKj7QNLPDxidWk6pLSn+fqQMcSwguiOkoO84Exkk4rp/yqtx/WSx+5rwpeG+Qnl/Mzi4Vul1jFYfONox/D0z6WYv/0KE6d8d95k0lTWOYMrijA/TYOE+UaSYpU/0pT8qlhCwqJwF2esBE5OhBfzuPxQkCaUepfwlJCf1ud07+4yKeqD21a7NPXPR3argbDR9rtGagDhOIDLowOPHJXyTZzLbrAxMpW0kkZGPxcAje84vzjpI8alWugI2EdBvS8CdDqNda3/JiAt0ee/WQSTgsQHTP5ov6t5ZX5BVbQ2Hejm4+p9QU2EEGkc286fvoCTi2B1ovhirKM15L6sr7815fHWeYqMGcHhRkfzdtjechiEE0MAOBmob1/c6dluumzH7dxOo86wbEH+ZGk7guowEIb5UYaK0h4ZC8MA3Mf/tYb1bK6AJUeghnmHk3/AHaHwAWCtUFBGsmAEju4+SiTW9LKKTCcYwgweD208NuWBchHQPNWJrPszo6utkcGcfhcfQSOsbpH8K6niClblRpI4GbCHnAbtY9sonJgXA9IpBk21E54MfQiBX2rTcZFZMB5tTkF5KFhiXfPSgs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(10070799003)(366016)(6133799003)(4143699003)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8u4LYtQgYpizL3+I503PwXhQgbtDArJWOUy0I51/R+QP4NeWcoSda3df5FJH?=
 =?us-ascii?Q?G0itrd45X3N6wtT+v6Q33PDxr0mhonXdl7FqzEg/xnegcY05Qo1ZCi27sCfd?=
 =?us-ascii?Q?Ao3rZ01uaXTq7ZWIoq16d6pi18+z7zC/RTaSikusjFnH/bo2ZEi3IJ/gN08A?=
 =?us-ascii?Q?GKck5BY0vo4+Q+2dqqbnEc9egSael33pEZLM42WKatyMkKui6wYtojFMg4TL?=
 =?us-ascii?Q?DbWl6F+0qnJy+9+zciuh6kLRLFGukjAcnbmJSGWDYg29qbsZ4u5g3fQBzZPn?=
 =?us-ascii?Q?S+7NyU5xU7cEFlrJPO6jV4qQIA6boLfbQsaUXOpg1imIrrNlOIkdS4S5+dAw?=
 =?us-ascii?Q?Za/UOPd5/K95P4PNmVzaH9tDyUjBiJp7VH2oImFKZjH2y1NiIGG72z245dx4?=
 =?us-ascii?Q?uNCPvDWuZTWOLNJpRkQdIq3bxAtwbyfelD6pyB5eQEfdoO34KApkQjqypm8P?=
 =?us-ascii?Q?/KVZH982lDOBFV8t7llqxe4QnpXAPIgHicQbnOniMopCBWVKO+nkx7H9f8a+?=
 =?us-ascii?Q?8CXSP51IaLfQY0cTjMXeyKVVJ6EkhoBakMZ7q1R/h3JMy4ZwtsyflGcXGB+t?=
 =?us-ascii?Q?BxmJSSpi30f3Pf6LUtNjdgzpgEUbTPqnNy0C61qxU1xx1eyOPvR6xyRq9bQ3?=
 =?us-ascii?Q?CoSkNPTSX5TXSzNC/NULtmnxpk/CkyGifzt0+AspQK5FdUL5f4tqRvHqn9RE?=
 =?us-ascii?Q?Nb9dXM9Gi8BFtQ15CxdPcye1ZWoUr0xqDpXK68viYtfDtOq+6tZb51BTnvuI?=
 =?us-ascii?Q?Mwf5Vr+k8176XlX7CVY5nbmtuSBQvb3arKmaJcMre67KceWAaBL2omV6Puro?=
 =?us-ascii?Q?yadu2Q/T6WOei/O03yu3ODmmOPi4LCljakLcooXd1gaPSfbUt32TU6OYeQeK?=
 =?us-ascii?Q?R2Md/Ig6xpNdKdyEGRRAyVg9S5lBU6EjoQ7EZIE8kAPpFscwMEOP9nWNN6Qo?=
 =?us-ascii?Q?m6j2MJqiYinJdag+9tZcxss4AFWhHD9xsgyj/mcILYB99+F/1i9pv06KA0A0?=
 =?us-ascii?Q?4YWcP48AHODoAhbbVnObP1P4w7ceXH6iTVHc6yrHhqIsImB2xammL/XSJr/k?=
 =?us-ascii?Q?fexP/mcgrBPH5hyY7zTQkMxPWvaKt4fciYmurNDtcMmmRclN2U6olI3nrU2G?=
 =?us-ascii?Q?EbmMJVlN2r1TSupQOdKC2l8C5V65sXlbyv3MGw8JmOW7E+B/KPOxG3tCqpcc?=
 =?us-ascii?Q?kaB/UqMH58B+LN7Z+JmdVY1VtQmqRfMsn8uxoGps4GJn6fdVPRme6kVKoItJ?=
 =?us-ascii?Q?f7te9LwxX+qqnK+9ydKuCEJs5YrqhK6A8G9fZaaocgnYHPZwS9GoYqdSyD+w?=
 =?us-ascii?Q?czZPapqZGLHu4Dy1MTru+XwuPRzL1f4PGyXk7sCD9mAemQP0R4eU428t1XGD?=
 =?us-ascii?Q?W5N1Ia4UVKArB96ko+QGRh5cJxtl/TxTg7+aTfzCgAi9Z9v2s3UcEm3CTQSu?=
 =?us-ascii?Q?DaFLNyikQ0S4Fehmbq2dikh7mtblTA2qxXqQiw0sBQ05ka8W4r+nmd29sIQP?=
 =?us-ascii?Q?h8f7t5eX/TZ6jHyD2VH9jU2iXfO5rZPFtzAk9uGrQwQ/THiDDKAbIsxaeAdM?=
 =?us-ascii?Q?NlEzzHloyKfqTPfqjSeL44VNRgBkKx7A2b4FCVV8zKvogB0kjClKmMN+ao6C?=
 =?us-ascii?Q?L6KiApLc9tjhaM4lMPH+a53xsYrJBPeb6kJ+rzagQddG2VY4Ex58y8G0jymZ?=
 =?us-ascii?Q?21Ul//Xh9ZoEFgFRA4uCWIicrIJaU3RYRaK2M/UdrZxGBIIjcNiuZsTAQVGo?=
 =?us-ascii?Q?i1c91Q4zc1O+E4GwcH4NlFs4/d+I4pKAJnQ4mAiUD485hJaATb2H?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: aba4a628-fb9e-47bd-58b5-08df0aa824cc
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 17:15:39.8805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9DYnLnjE/LfxAf+HCnpmoqQDcdyReQdVkuNWcaDr0+mjnRTt4S7R2mx/dB7kKWFfLor6U31Ox9K+gkw7X6Q13A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P286MB3422

On Fri, Sep 04, 2026 at 10:41:47AM -0500, Frank Li wrote:
> On Thu, Sep 03, 2026 at 03:45:32PM +0900, Koichiro Den wrote:
> > An endpoint function can reserve an endpoint-local channel while the RC
> > programs it through an exposed register window. Such a channel must route
> > interrupts remotely and ignore them on the endpoint.
> >
> > Use dma_slave_config to set per-channel interrupt routing on idle channels
> > of a local eDMA-compatible instance. Releasing a remote-routed channel
> > quiesces the hardware and drains its local IRQ before restoring the default
> > routing.
> >
> > The eDMA quiesce may stop a complete direction. The caller must own every
> > channel in that direction and stop remote programming first.
> >
> > Suggested-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> > Changes in v3:
> >   - Add struct dw_edma_chan_config with validity flags for non-LL mode and
> >     interrupt routing. (Frank)
> >     https://lore.kernel.org/r/apWj7zzAw57U2r4F@SMW015318/
> >   - Do not skip generic dma_slave_config fields when private settings are
> >     supplied. (Sashiko)
> >     https://lore.kernel.org/r/20260828164950.61AE51F000E9@smtp.kernel.org/
> >   - Use READ_ONCE()/WRITE_ONCE() for IRQ mode accessed by shared handlers
> >     and drain the channel IRQ before restoring local routing. (Sashiko)
> >
> >  drivers/dma/dw-edma/dw-edma-core.c | 135 ++++++++++++++++++++++-------
> >  drivers/dma/dw-edma/dw-edma-core.h |   5 +-
> >  include/linux/dma/edma.h           |  19 ++++
> >  3 files changed, 126 insertions(+), 33 deletions(-)
> >
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > index a678c70a78fe..e3786d960a43 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > @@ -177,48 +177,79 @@ dw_edma_get_default_irq_mode(struct dw_edma_chan *chan)
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
> > +	if (chan->configured || chan->status != EDMA_ST_IDLE ||
> > +	    chan->request != EDMA_REQ_NONE)
> > +		return -EBUSY;
> > +
> > +	WRITE_ONCE(chan->irq_mode, mode);
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
> > +			return -EINVAL;
> > +		flags = dw_config->flags;
> > +	}
> > +
> > +	/*
> > +	 * When there is no valid LLP base address available then the
> > +	 * default DMA ops will use the non-LL mode.
> > +	 *
> > +	 * When LL mode is the default, clients can request non-LL mode
> > +	 * through DW_EDMA_CH_CONFIG_NON_LL.
> > +	 */
> > +	non_ll = chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE &&
> > +		 chan->dw->chip->cfg_non_ll;
> > +
> > +	if (flags & DW_EDMA_CH_CONFIG_NON_LL) {
> > +		if (chan->dw->chip->mf != EDMA_MF_HDMA_NATIVE)
> > +			return -EINVAL;
> > +
> > +		if (chan->dw->chip->cfg_non_ll && !dw_config->non_ll) {
> > +			dev_err(dchan->device->dev, "invalid configuration\n");
> >  			return -EINVAL;
> >  		}
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
> > +		non_ll = dw_config->non_ll;
> > +	}
> >
> > -			if (cfg_non_ll && !non_ll) {
> > -				dev_err(dchan->device->dev, "invalid configuration\n");
> > -				return -EINVAL;
> > -			}
> > +	if (flags & DW_EDMA_CH_CONFIG_IRQ_MODE) {
> > +		switch (chan->dw->chip->mf) {
> > +		case EDMA_MF_EDMA_LEGACY:
> > +		case EDMA_MF_EDMA_UNROLL:
> > +		case EDMA_MF_HDMA_COMPAT:
> > +			break;
> > +		default:
> > +			return -EINVAL;
> >  		}
> >
> > -		if (cfg_non_ll || non_ll)
> > -			chan->non_ll = true;
> > -	} else if (config->peripheral_config) {
> > -		dev_err(dchan->device->dev,
> > -			"peripheral config param applicable only for HDMA\n");
> > -		return -EINVAL;
> > +		ret = dw_edma_device_config_irq_mode(chan, dw_config->irq_mode);
> > +		if (ret)
> > +			return ret;
> >  	}
> >
> > +	chan->non_ll = non_ll;
> >  	memcpy(&chan->config, config, sizeof(*config));
> >  	chan->configured = true;
> >
> > @@ -890,11 +921,48 @@ static void dw_edma_wait_termination(struct dma_chan *dchan)
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
> > +	 * With nr_irqs == 1, the common handler can enter for the other direction
> > +	 * and retain a status snapshot for the remotely owned direction across
> > +	 * quiesce. With multiple IRQs, the handler covering this channel can likewise
> > +	 * enter for another IRQ sharer. Drain the IRQ whose mask contains the channel
> > +	 * before restoring local routing.
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
> > +	if (remote)
> > +		dw_edma_synchronize_chan_irq(chan);
> >  	cancel_work_sync(&chan->irq_work);
> >  	atomic_set(&chan->irq_pending, 0);
> >  	vchan_synchronize(&chan->vc);
> > @@ -903,12 +971,17 @@ static void dw_edma_device_synchronize(struct dma_chan *dchan)
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
> > +		if (chan->irq_mode != default_mode)
> > +			WRITE_ONCE(chan->irq_mode, default_mode);
> > +	}
> >
> >  	vchan_free_chan_resources(&chan->vc);
> >  }
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> > index f6a5ad317567..275d362d1805 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.h
> > +++ b/drivers/dma/dw-edma/dw-edma-core.h
> > @@ -280,11 +280,12 @@ static inline bool
> >  dw_edma_core_ch_ignore_irq(struct dw_edma_chan *chan)
> >  {
> >  	struct dw_edma *dw = chan->dw;
> > +	enum dw_edma_ch_irq_mode mode = READ_ONCE(chan->irq_mode);
> >
> >  	if (dw->chip->flags & DW_EDMA_CHIP_LOCAL)
> > -		return chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE;
> > +		return mode == DW_EDMA_CH_IRQ_REMOTE;
> >  	else
> > -		return chan->irq_mode == DW_EDMA_CH_IRQ_LOCAL;
> > +		return mode == DW_EDMA_CH_IRQ_LOCAL;
> >  }
> 
> does this tunk fix something, you make this change later.

I added this for a possible race with the shared IRQ handler, especially when
nr_irqs == 1.

... but after carefully thinking about this again, the hunk seems unnecessary.

- Before undelegating (changing the irq_mode from REMOTE to LOCAL), the client
  must stop remote programming, and the driver quiesces the direction and
  synchronizes the local IRQ.
  At that point, no-one is supposed to issue any transfer for the channel
- Conversely, remote routing is configured while the channel is idle, before the
  peer starts programming it.

If the peer continued programming during either transition, it just breaks
things. READ_ONCE()/WRITE_ONCE() would not make the handoff safe.

I will drop this hunk and the corresponding WRITE_ONCE() use.

> 
> >
> >  #endif /* _DW_EDMA_CORE_H */
> > diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
> > index 3c8e2ef9dee0..93f866d57987 100644
> > --- a/include/linux/dma/edma.h
> > +++ b/include/linux/dma/edma.h
> > @@ -101,6 +101,25 @@ enum dw_edma_ch_irq_mode {
> >  	DW_EDMA_CH_IRQ_REMOTE,
> >  };
> >
> > +#define DW_EDMA_CH_CONFIG_NON_LL	BIT(0)
> 
> you need update other non_ll user to set DW_EDMA_CH_CONFIG_NON_LL.

Ugh, I missed updating the existing non-LL user. I will respin.

Thanks for the review.

Best regards,
Koichiro

> 
> Frank
> 
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
> > + * programming and own every channel affected by the hardware quiesce.
> > + */
> > +struct dw_edma_chan_config {
> > +	u32 flags;
> > +	bool non_ll;
> > +	enum dw_edma_ch_irq_mode irq_mode;
> > +};
> > +
> >  /**
> >   * struct dw_edma_chip - representation of DesignWare eDMA controller hardware
> >   * @dev:		 struct device of the eDMA controller
> > --
> > 2.51.0
> >
