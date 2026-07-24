Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020098.outbound.protection.outlook.com [52.101.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D93E314A8D;
	Fri, 24 Jul 2026 04:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784868789; cv=fail; b=oJ2VX7rstUzmCsW4oitoMTZyoIbzve9ViuyCkUawAaGAqbmMEBJliHz4f9qQI7E4y0Lc8ofG9K/eVOHMP9oppL7rElDdLhp7bZzPepeEGOdT/7Gok23PZ5w6I8728oELhizzamJEs3RVGIS/N2NHgu+8iPjhPhYBii3r1CdlQP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784868789; c=relaxed/simple;
	bh=FQnZJhjjuzgP7L326TElV7hklhqhgS68+84upS+2+X4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XKrcy/jGFarYFIKODAR9yzp1mGYEfx2ACGx+XrUNgaX+bPoT17f4LKpaHrE4eAMZNkC7KlHJ+ayh66JoQNhYtPuMQJ7NaVROadt6wBm3BtdRwLYHDifbAXbnCEJMXN+DTG3VTChtSumSzJQhK59iVa6AY0cM+QKsVqaHBCi+AUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=KAvD+I+8; arc=fail smtp.client-ip=52.101.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="KAvD+I+8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nV3xWC4B5wmRGZL/CSazXR6vBpCIZtmVG4x36URvly3YkemaZ4XEUOZkF++9G13cA1bqWNgbVVl0lieqIm5nKgkNj3DVkVY3/vXUVOWez6LAaQiD03EgtfMiNmLxPOjVYFV5PB+POy8hEg4/Z7rJVTdJXOmUR4cWa7i/+ZomD3cM5v4iskRmPP3Hs8mn+PpILgGGa00/d5t8m40rDZi8oAD2cgU12ax78KU2FJnhIFI01XUk9qpic9RMzXnAgalLAgBlWQUeKaDXLXAJ6Q1fP/AHIzdNq9UEL55yIEHxluUtb+wGAJu+f1OsQCa/OPvpu+OLUogm1O4XYt/27hOuDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbcrmgRaQJSyQHQZXMF/x6h5dl8aXtIwSK/2m5ric3w=;
 b=H0Xxvf1c7QOm29AYhWCEWgOXPlAZonngLSQPO0+ExZRHKrwk9B/avU0DFb26ti/KZDQNgtj1NAnGakt5q3L3W7zGEr3dyt9D5x4ospTSc0WpzTu88jb8MMG3/D96JDziPD78WGFGb3kmTVjT4IUIkJGM2zTMrMp2g9fh4zvFZvTzFLz0aKF10ZCLnZMbPxta+pDwhQbQKkteAhwscnT4fseb82gYgyKl/zLDNNPDD4sanE8uvNcpwt5ALD4y9TS9XjT1wA9dA5cUBcSwiQyVpG3CzUcEsA/MuYYUYN03zbBZecT0mTl9/cmEhzy3t6eGTxrIyZeg6shfzIG0otFvjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbcrmgRaQJSyQHQZXMF/x6h5dl8aXtIwSK/2m5ric3w=;
 b=KAvD+I+8q2+Z4Jl0ngNLVXSIF0JXZtmoJQ7geuNCufEZAw01l91xaRloWgxPMCzmFKKJE/k+aYY0L3FnUx9iq/fVoash2fgCh0Bc7C/7TViaUrVaT5H7JD4PhVwXFyaYn0QO99aHSukIdr1QYZFmHR2Sys5vBmEsPNJgIZIwiTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB2931.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:30d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 04:53:04 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 04:53:04 +0000
Date: Fri, 24 Jul 2026 13:53:03 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
	Kees Cook <kees@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Christoph Hellwig <hch@lst.de>, Serge Semin <fancer.lancer@gmail.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Niklas Cassel <cassel@kernel.org>, 
	Devendra K Verma <devendra.verma@amd.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/19] dmaengine: dw-edma: Centralize LL doorbell
 decisions
Message-ID: <6nmmbsu32ta6lh42grjqqx7mn3ht4x3dqlmcoud442yqyw3jzd@vjgw5xfd52uv>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-9-den@valinux.co.jp>
 <amJJOA_CFIJ5wyyd@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amJJOA_CFIJ5wyyd@SMW015318>
X-ClientProxiedBy: TYCP286CA0079.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB2931:EE_
X-MS-Office365-Filtering-Correlation-Id: f9af55f8-1b73-4b87-3e5e-08dee93f7280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|23010399003|1800799024|366016|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ajQ9/XgUdPnpUFRuSvQm+MlU02sN9HmAg4dbZeLfEcRAeivcMavUOLPScouqU5oKfSst0qZEs9Mm0DdhtFuyMiTk6dgwBeIO9yUWDtdACAyTMXMNy8ILAjgCf+6M5+1jkugB09UuYpCHua8ncN5xFpvrYH0unT+H70tN+J4OYX7E9T05vDmLzRwB0jEgitO3aOqpDJPNgbX/cQ+xXTMzO+VRbViA+Vfia+TDAQkp4T9kJ3oigYgEIShKzqVQW12NX7b6qnzY3eV7MNiXQez9C+zim84/qKHPjNrLOik6VTULCMuNOM0NuC79rNaacb+R5xYn8s/4nSBXtkNeQsG1UqXuS8XZSy7bWiwInu1pL+vBQlVtQhyKmyL2rJIIy+rLJtTLHeUmXWwrhbGLz082IX8DekgyLcssdEMtRCD0IlxdkzU+tGTFwifdNQgAKkaj25J9Z7OC6zzlbo2qQPvYG04KqYUqWrBEl5/Lu3HV/R1RwU0Zze12JrPFbCQTUuUVL4oosRQEph37ggS0tVQ3WTYST+ltK3ueCOXFLYNeXIubHiOU11OAbGZXm2cFw5QXGWpfiTPEe18sGLiazlfCGECwoodLN0Aw2j19wbolvoEeTS/GEEQvYzMxm6KsYx8Go3dtyqM3RjI4XACZUuIsjpW2D05+yWkKa7MnnJkezk4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(23010399003)(1800799024)(366016)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+c7LrYWGawFm4ZFeJFLX7OCHRIj5C5uxur7H29uEOQMGdtFySeiuRJIhbMYC?=
 =?us-ascii?Q?SLEp4YflAaz1GNSKY6xGTMTh8pEAJuk5TjBSm+g8Ok+arPGPxXBjtKaO/3lJ?=
 =?us-ascii?Q?CDt98D+yfJpXLESvys0P93GVJmrPUnly+gluW8V6pZuWITOGI/pMh6Y/I1gJ?=
 =?us-ascii?Q?dKuFhbdoHkON2yVKugURcoKONM2FIJjF72xrufaypX5GnR1OH9cOFHMb36ul?=
 =?us-ascii?Q?PnO1sLT+mP5F9O321m+UbvJqxFbItts+y3brvTaLo6jm6N7CcOVpnZsyk0Wf?=
 =?us-ascii?Q?Q0s7XbBMuA+A0JQnH75H6tBOjdceLgbnWrMIcmbzTZSh6V46AgNjTgkp5AXd?=
 =?us-ascii?Q?QXrVmlFM/WXWKF/nUZYQ05pNrCtMVai5lwulqFTpNuzeMRWUf7mXBvB88rF3?=
 =?us-ascii?Q?hyDRGar92om58yeC6oZop+PhUKDNnunNEkABNvrd585KRvms/VuZwHzEu0Yb?=
 =?us-ascii?Q?VIFFruKvnS/VsqCdGj7y4+zOvK/1xTuMZteby+ZW256exHAfm8I2mB3Ci3xK?=
 =?us-ascii?Q?SrouPt7ynQ9ym2Ma60s7KIpT3qTJFcM38vGXc8zFdjNBQvpvY0759/4HrQiX?=
 =?us-ascii?Q?2rN+SKQycxy9yy1C/W9Ld1Us2PKCrEzssojUUvkRXomcTtdxCI2zmXrklfZP?=
 =?us-ascii?Q?HQha6aWA19tOJ3WBW5xxqcF513KUqorN5kHUuVwSHoDY5a4UnDvg4mcSANvk?=
 =?us-ascii?Q?ywA5YVtocEUcSyilVmzjw5L1feyJgiZHYvJhL6DwIH1k99LgdtKybx+Yu0zs?=
 =?us-ascii?Q?n/6s9MhaEh9PuTA9+2OkVyiboFxgkW5yc/YKIWwaWyPorsFgWmiwrx+8JM2u?=
 =?us-ascii?Q?YoVUi0sCfmDjLUaj4TzGp7Q4jc+Cq4hcqTHy6TpHBzwcmCzS4yzv/yFc4Y1o?=
 =?us-ascii?Q?1M1UvFZeBdS0Ax7S7Ee0kDHTHyRDG3s3z7eETTHQzQMaHDsQs0VZFd5jSf2b?=
 =?us-ascii?Q?mXlxQdqtrEUcsN1K4vUCqmVSo+K0CaMLw7KORqK9Rv6F9Mgq9ltbNhrKfMXw?=
 =?us-ascii?Q?Dd8qTWoNq4nvj4o246ejiP0SErqCoZ/rmMr8a2CyxEaoCZ20Gd563RpTZD85?=
 =?us-ascii?Q?B9As+O/su8kafjOGaDbMD4J4T15LljNeX/xE7T1MPVDNhVpddeY1f+aFEIbz?=
 =?us-ascii?Q?Z6iRXndHpYocz72H9pWbh7HfVmB1ljK9xiAri35HVRgRU6SqTbdSf7WRHEj/?=
 =?us-ascii?Q?XI3SErH0aSsasxKO6YtpkwziDZAjqBnflvwiMBwyIO7toZOFky53kWJXXq2k?=
 =?us-ascii?Q?xIyiS5WZiIcgd8JQCazVQvY61mumGfUX3z7IKBdqWAmEDazSpYI8Jbj5kWP2?=
 =?us-ascii?Q?On8wonU8XF+ZzkMYYU4bMveoe7UNlWOGfHC6hTS4pTdmHsMBRvc34NR9pYz8?=
 =?us-ascii?Q?l467EjHHj/GaL8WVlW+1GJrf89WHeIE8jSB5OKNgicFbOaUO3SCrrZYuVN1U?=
 =?us-ascii?Q?/0V1k7rGmsBeKIkWN/N0cp/39zL87hpUfstgID8t4Wr7Yeg+dGGIx7CMP7E6?=
 =?us-ascii?Q?xlENspPk6J47njufn48izgYtB7KHIci5uDZBm4XfyeKky0Tl0fqey+ylA7ZW?=
 =?us-ascii?Q?fhazt7JX9V6cCwdyaDbEQORe3hsesjMxSfoa3pObsDCNgaRqIyUQR5vZzdPc?=
 =?us-ascii?Q?NRLsGYOzc+hJyGma4OxdLnCYha4JYtkbqa3M5TtHwudgyzM4lh/4MlOrTMq+?=
 =?us-ascii?Q?KDOBGeSdQ+sX/wjP5es3bAaZNQJ0sN/5QTIM8u7KD8GomUo+kiqODIYmySOO?=
 =?us-ascii?Q?65IK0ZRjkC16k+X6BK8vl43X566f/D0n8MI3f6g0kCKGRV/h3P63?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: f9af55f8-1b73-4b87-3e5e-08dee93f7280
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 04:53:04.7284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EDZRiWz1K67jclD8DqFsinRVAMKVeSABek6FM/BK+ujwxZfF7FTCPDZpYZbWup5noyv/vfiY7YDCCTFoczmGQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB2931

On Thu, Jul 23, 2026 at 12:02:48PM -0500, Frank Li wrote:
> On Thu, Jul 23, 2026 at 05:41:39PM +0900, Koichiro Den wrote:
> > LL fill currently rings the doorbell every time. A running eDMA or HDMA
> > channel follows entries whose CB matches CCS without another kick. A
> > channel stopped at a CB mismatch needs one.
> >
> > Move that decision to dw_edma_core_ch_maybe_doorbell(). It rings only for
> > a BUSY LL channel with pending entries, no EDMA_REQ_STOP or
> > EDMA_REQ_PAUSE, and hardware that is not running. The BUSY check prevents
> > EDMA_REQ_STOP completion from restarting terminated work.
> >
> > issue_pending() still publishes LL entries only from IDLE. A later patch
> > allows live appends. Non-LL channels are unchanged.
> >
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> > Changes in v2:
> >   - New patch.
> >
> >  drivers/dma/dw-edma/dw-edma-core.c | 28 ++++++++++++++++++++++++++--
> >  1 file changed, 26 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > index fa104af4146e..e88bfb417ad4 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > @@ -129,6 +129,11 @@ static bool dw_edma_core_enable_ll_irq(struct dw_edma_desc *desc, u32 i,
> >  	return desc->chan->dw->core->ll_irq(desc, i, free);
> >  }
> >
> > +static bool dw_edma_ll_pending(struct dw_edma_chan *chan)
> > +{
> > +	return chan->ll_head != chan->ll_end;
> > +}
> > +
> >  static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
> >  {
> >  	struct dw_edma_chan *chan = desc->chan;
> > @@ -163,8 +168,6 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
> >
> >  	desc->done_burst = desc->start_burst;
> >  	desc->start_burst = i;
> > -
> > -	dw_edma_core_ch_doorbell(chan);
> >  }
> >
> >  static void dw_edma_core_start(struct dw_edma_desc *desc)
> > @@ -232,6 +235,23 @@ static void dw_edma_terminate_all_descs(struct dw_edma_chan *chan)
> >  	dw_edma_terminate_vdesc_list(&chan->vc.desc_submitted);
> >  }
> >
> > +/* Must be called with vc.lock held. */
> > +static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
> 
> suggest this function call dw_edma_core_ch_doorbell()
> 
> old dw_edma_core_ch_doorbell() rename to dw_edma_core_do_ch_doorbell()

TBH I'm not yet sure which is better, but I think either is fine.
Let me think about it again for v3.

Thanks for the review,
Koichiro

> 
> Frank
> 
> > +{
> > +	if (chan->non_ll || chan->request != EDMA_REQ_NONE ||
> > +	    chan->status != EDMA_ST_BUSY || !dw_edma_ll_pending(chan))
> > +		return;
> > +
> > +	/*
> > +	 * While running, both legacy eDMA and HDMA consume newly published
> > +	 * elements without another doorbell.
> > +	 */
> > +	if (dw_edma_core_ch_status(chan) == DMA_IN_PROGRESS)
> > +		return;
> > +
> > +	dw_edma_core_ch_doorbell(chan);
> > +}
> > +
> >  static void dw_edma_device_caps(struct dma_chan *dchan,
> >  				struct dma_slave_caps *caps)
> >  {
> > @@ -357,6 +377,7 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
> >  		chan->status = EDMA_ST_BUSY;
> >  		if (!dw_edma_start_transfer(chan))
> >  			chan->status = EDMA_ST_IDLE;
> > +		dw_edma_core_ch_maybe_doorbell(chan);
> >  	}
> >
> >  	return err;
> > @@ -405,6 +426,7 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
> >  	    chan->status == EDMA_ST_IDLE) {
> >  		chan->status = EDMA_ST_BUSY;
> >  		dw_edma_start_transfer(chan);
> > +		dw_edma_core_ch_maybe_doorbell(chan);
> >  	}
> >  	spin_unlock_irqrestore(&chan->vc.lock, flags);
> >  }
> > @@ -720,6 +742,8 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> >  	default:
> >  		break;
> >  	}
> > +	dw_edma_core_ch_maybe_doorbell(chan);
> > +
> >  	spin_unlock_irqrestore(&chan->vc.lock, flags);
> >  }
> >
> > --
> > 2.51.0
> >
