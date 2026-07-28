Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021096.outbound.protection.outlook.com [52.101.125.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE1A31F996;
	Tue, 28 Jul 2026 05:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785217104; cv=fail; b=swraUJui7RyoQp+z7OS3/SkytzFjqAgRHPmPCjPNUzVf023lMLd5b1o7olGAFrZv+slWe9PqlAyetg5QQCBihrLggHmGvVOOCdBJjjtMYiE9olfjSi5KcPpWr0s/m5lyrLubT2/HcP1IjWGd7OxY3ut6ASAL2qWLNn5cgPGbPxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785217104; c=relaxed/simple;
	bh=NA8e/WEJfuY5V4hRSNT6xQ6Fard4GnA2s9R8RGKzUoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=K6OssogdyvJXTY+qhDIyOsWhjeiegHh+MWm05KXSC20HV1GXBpvhATLUTCyoUDf2gqknE/d68W4b/EI+8Jv4aNcjA3NIvCr6OGIKdaowd2dgUAgYFj6VHlVTCTkQJIhfa3M6tuDrN5LnWDd1MuDSSPqpxGrNFhqVKp9NPQpVep8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=DTCBLa+K; arc=fail smtp.client-ip=52.101.125.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="DTCBLa+K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aq51LE5VH5GgJmb5w7c85RkIY/7E70dxWtWK3GuG2yx90NDKhtdBs19dxtV5rCP9/oBLA2cXua/QhtkBEupnyHewumFcnBpkNcXBsyVh2hukGksiQoIO9fQVbUL9ixiTvrMQ90r1eEl8rMD5DBCyFENrIyc3pyxJ4ctZGNw9uUe8eUGZHbfLzQ4KvWE04ep0dVqS9shOKBTVd4HH4no1Q59RU0SRc/mdsPHPKj5qTjCIKduvJwKU5CoI/pah4mnVTd9XfxXZIc/mJxNn4zpRIdqThEqY8qxmumTL1dFpreI/WVZ7rJ7Ou3PozBgQPWRKOZbNd5Qms6bAebEXaZWk4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYkF38M8QvjXVSwtYw/34OvIpJv5mFomjt4yAAE5bVE=;
 b=e9sCdCuqVIsNj925hnkttomtrky9hiBjSBu5sYhj+8gzPshL494FYbR++VSnOAz5lqQwRvVdU75udii+CWLIxm6nN1R3fc/iIC5x4XxLW4RFKSDfMXTkVJbYjwi2Yjygs16JsNMVkM88erYd9rHmV0eIF7pvoXXIrkBeIO80xNfLQjs3V67YHbmyHXhS09LyYWv9uLEf8QlXW19k5UKyX+1Bw56EhBZWBHoM4FIg1OyMW7/sx2eV5tw59ggOlyhdDe20q9oIAuW6cs1QW7C0Y9x8Ta2TMGl2s3vORfUclnRQIsCl/Si5hXanfFG7u4uzrRJY3gW5SDXEzw2z4/J1CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYkF38M8QvjXVSwtYw/34OvIpJv5mFomjt4yAAE5bVE=;
 b=DTCBLa+KowqxQ/UVQmcdQ7yXM84LWL+iXQa2ujnp3bzcqIr3IVFF4DUCMJE/oPsXCyFyeBQZwGhP4nGEXmFevBK6rkAv6nCHBcM5+EBbwhOHVuZIZgEAnpDTOx8B0rcPzTvtdQ7P9XmQOGiHsUgFMZMT40wOH2tspEKWt8JtNV0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3635.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 05:38:18 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 05:38:18 +0000
Date: Tue, 28 Jul 2026 14:38:16 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
	Kees Cook <kees@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Christoph Hellwig <hch@lst.de>, Serge Semin <fancer.lancer@gmail.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Niklas Cassel <cassel@kernel.org>, 
	Devendra K Verma <devendra.verma@amd.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/24] dmaengine: dw-edma: Prepare LL kicks for event
 serialization
Message-ID: <uq7qe5ptxr4uekuxouqlir2ijusfxq66zffad7k7ypflfn2ezk@vxs2jonoc3hl>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-11-den@valinux.co.jp>
 <ame8-QU4siDSPzaS@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment
In-Reply-To: <ame8-QU4siDSPzaS@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: TY6PR01CA0008.jpnprd01.prod.outlook.com
 (2603:1096:405:3bc::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3635:EE_
X-MS-Office365-Filtering-Correlation-Id: f57bf6d9-8323-45aa-7b9c-08deec6a6d7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|6049299003|376014|23010399003|7416014|366016|56012099006|4143699003|10067099003|22082099003|18002099003|4053099003;
X-Microsoft-Antispam-Message-Info:
	4KmQrgBEMCdJFywxrQiX68KEsEuNloxh2hF29HIp1REJAAYhSEI8u+yToSN3kEDpxjWzAKObY5SVRN9PyT8776B1sMmJTlXt99TLZVrVDO00dPRUAFMvIHOTSDD17+kiclsbiYDEgQviJg0PdwraJ7n64oYkqBK1/71ZNVINHsxfqurYCME6AI+YDKZQcJ9xx6rflm17PXeXm6R2wwFlzuXAvNhhxnRmQRgg/3BQhcEMYVUigfAy3F6IV0Zmgo/HyO3Y0nOhSsqsX0hIY2QDvtuXvizZAdPN3Q+kk+tNQZM6fQvHkKItVtNy83dxSN8WjJ2rCzH1PXtVPtJSJc1FLkkvGkk9yw2uiettPuDFUEJ7yfNtapSx1yjfHOwsHplRXs8bTLjGX+UwV2ZT0t3xig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(6049299003)(376014)(23010399003)(7416014)(366016)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(4053099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fWz5Iadmat7WHepyStdnQ0g+QkNebPXdXvICWWqxmjzsl1HsszOHGmXGvLbD?=
 =?us-ascii?Q?xqR/wafLfvoM0Ju0WEu32jRZT5N+Qjt4VGRUEJRqnVhtKamggf0/4DzyJVl5?=
 =?us-ascii?Q?HAHOXBANpp3jhp5vTQ10/r6Vd3reFBjjbeJfQWsHR+svXanabIZUg63iot1S?=
 =?us-ascii?Q?MS0S2TdXi5HRQ8UuJYEiSHQ3+vZTFwDfVuFIhH4nDQolpOhr2gaGFYia1XXI?=
 =?us-ascii?Q?fqYJyh+KFK2/KI91bxq0E4dat00ZgCXjws/fmNWctjwJ7S6zCSYZl7dQacEg?=
 =?us-ascii?Q?20M5KDRjPAH/ysVSad9BQafAO0MGvR0uFSKKd/IMW8wSFehkXQog/FobZmKP?=
 =?us-ascii?Q?ru/RK28dtHFQ+W6/f6hLrQRxH5XVGarHwHdd+bZrdzlZ2rOgaCxabYxVPI1R?=
 =?us-ascii?Q?5u/0q9BzRMv/ASjwYKVxL6gFQO7s7ngq68n/JLfRJhlT0qtEOQ7zRVPGWuY9?=
 =?us-ascii?Q?DxddG72XziO1PbzRikqwYwqcSrhbAwlXbOxxd0gkOzTVVhzkdp+YuKbckmMr?=
 =?us-ascii?Q?RMYRBwPUxNS+y0Y4q3f95zW/6X0TJzPuRjjKeZGLn7Q4vm8NPBstkeXflpTO?=
 =?us-ascii?Q?4TgPsXY02dXSXZhTU/7h/AMv1lYRQlPKRBZvWms09Gb2BtFsGGIxUBCYb0gE?=
 =?us-ascii?Q?O2UjG74Ruuko/m54AfYxkCFnKvu2H6A6BuYhuYNBC2La1SERCNjs9uBN7ekt?=
 =?us-ascii?Q?8ktcQCmGIREqR7mSpMm5MS/PnEkrBX0MnPhBrEAJ41r9YAZMRV8iADQOIKaj?=
 =?us-ascii?Q?31pCr6TcCYCEUUKKvIkiRE2EkLr/8mg3jGZByj1ORTgDVZqX+WRw9StmcOON?=
 =?us-ascii?Q?Ii7aSrpLroN3DdyL7+JfJOyi4mtqOZAXiETxIO5NBxpYGwSuBneFVB9JeUsS?=
 =?us-ascii?Q?g7n7MOqX2JuR47rruaedn390l34p6aci587EeRnJdwjsXcmO/Dr2W2AWs+0r?=
 =?us-ascii?Q?T9tF5lzTAFn4pApWC03CScKnksj/WOR5DVmiUTcoIrmqWZdZrPuTXRYeKLUW?=
 =?us-ascii?Q?zB5hsUq37WOvsTVmHRfXFNXXzJOZNknHxqxKWoRfXIxeeGxB496P7jczhyKi?=
 =?us-ascii?Q?j+aTbe/e55g/aRcv/GLL17u/QGrgykqpTiYW8wuvGO+vG1lGkhLDUPYkEbGc?=
 =?us-ascii?Q?Q7HvMjz35kFL8SbXjx5KvvTUO5QqMSgF6kN66qJcVHMCMZCaArKth7QDyeiD?=
 =?us-ascii?Q?v+obyq/ON/pVOTlwWGaV//FgFOm2G/ZdSFrxyN2GJ3ownkpYG7VOy1wJ7Qzk?=
 =?us-ascii?Q?J7zlYq9JTFKIhY0P06hGBdeGgIXiX0+SnN9x3AkWPEoBl+yEx/oo/HBHq96K?=
 =?us-ascii?Q?JjwaS9MI3chMJaFN8dwrsLyAr3w4ZYY3eH9k4j6Tk6xt3L2V3XeDjyCARTGF?=
 =?us-ascii?Q?y3PznmZd1c7zTmZHilKh+bI8cynevEwgZ1NoRaxFdPp7g6ei3Uyod1KVLi4E?=
 =?us-ascii?Q?GOX8/Pv7tTn1hrCYnnN6nCk3VTieHXzQY4SXly+up1O56AT1YZX79C8g7EO/?=
 =?us-ascii?Q?WEHhb0EvMolvW0hPB+TXidP9GNi00IG+XnwHfCpH/Nn0//IOZLRsF3io4Rl7?=
 =?us-ascii?Q?i7cQieDHHiJcVMJ5x3HHi1MyzRuKNrZyh/jWWKTTqttljebHWKJ7sEd++uzy?=
 =?us-ascii?Q?Oohiykhj9xwcg+EMjPz1VUHwynjexWEe8oJfjAFZ4gI/jE4bn0+rPM7LTPZg?=
 =?us-ascii?Q?nqTW2n7QpPIQoaBsPH4YcpjNgvhalDHhHL6YG6I3yk7zWwX//8Uw8dWVakVa?=
 =?us-ascii?Q?8lK5PUVO0tQgGCdldEv1aL3LV3Qwq2i8erC5B4+VBwptLU2FPwJr?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: f57bf6d9-8323-45aa-7b9c-08deec6a6d7c
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 05:38:18.1868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IsSMp6kLvaQ7CjUEtsxwWiai3SBT6U42jUYHOjNJeCSwDgEKiornvfoWnjkJ7QL6QQ/hXD+maEMeydm1QgD3jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3635

On Mon, Jul 27, 2026 at 04:18:01PM -0400, Frank Li wrote:
> On Tue, Jul 28, 2026 at 02:03:09AM +0900, Koichiro Den wrote:
> > Both eDMA and HDMA perform the same remote LL read-back immediately
> > before writing the doorbell register.
> >
> > A later patch serializes each LL doorbell write against IRQ event
> > capture with a raw spinlock. Keeping the read-back in the provider
> > callback would hold that lock across a remote read. Move the common
> > read-back into a core kick helper, where it can run before the
> > serialized section, and leave dw_edma_core_ch_maybe_doorbell() to decide
> > whether a kick is needed.
> >
> > No functional change.
> >
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> > Changes in v3:
> >   - New prep patch split from "Centralize LL doorbell decisions" to keep
> >     that policy change focused and the remote LL read-back outside the
> >     event lock added later. (Sashiko)
> >
> >  drivers/dma/dw-edma/dw-edma-core.c    | 20 +++++++++++++++++++-
> >  drivers/dma/dw-edma/dw-edma-v0-core.c | 16 ----------------
> >  drivers/dma/dw-edma/dw-hdma-v0-core.c | 16 ----------------
> >  3 files changed, 19 insertions(+), 33 deletions(-)
> >
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > index bb57f2d39d1c..e3d0559206d8 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/dmaengine.h>
> >  #include <linux/err.h>
> >  #include <linux/interrupt.h>
> > +#include <linux/io.h>
> >  #include <linux/irq.h>
> >  #include <linux/dma/edma.h>
> >  #include <linux/dma-mapping.h>
> > @@ -254,6 +255,23 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
> >  	chan->status = EDMA_ST_IDLE;
> >  }
> >
> > +static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
> > +{
> > +	/*
> > +	 * Remote controller registers and LL memory may be reached through
> > +	 * different paths. Complete posted LL writes before the doorbell.
> > +	 */
> > +	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
> > +		readl(chan->ll_region.vaddr.io);
> > +}
> > +
> > +/* Must be called with vc.lock held for an LL channel. */
> > +static void dw_edma_core_ch_kick(struct dw_edma_chan *chan)
> > +{
> > +	dw_edma_core_ll_sync(chan);
> > +	dw_edma_core_ch_doorbell(chan);
> > +}
> > +
> 
> Can you move
> 
> 	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
> 		readl(chan->ll_region.vaddr.io);
> 
> into funciton dw_edma_core_ch_doorbell().

Could you elaborate a bit more on the concern?

I'm guessing that one or both of the following changes look unnecessary to you:

  (a). add the common dw_edma_core_ll_sync() helper
  (b). move it outside of dw_edma_core_ch_doorbell()

Regarding (a), the helper is also used in patch 22, where the LL writes must be
completed before re-enabling the direction, without issuing a doorbell at that
point. So I think (a) is useful on its own.

Regarding (b), this patch 11 puts the raw doorbell write under event_lock.
Simply keeping the sync in dw_edma_core_ch_doorbell would therefor also put the
remote non-posted MRd under that lock. I tried to avoid it for two reasons:

  1. It would otherwise increase event_lock contention, especially for eDMA,
     where the lock granularity is a direction rather than a channel. The IRQ
     path also runs dw_edma_record_irq() while holding the same lock.

  2. If the non-posted MRd completion is delayed, event_lock would remain held
     for the full delay, which can easily be avoided by this patch.

Or is your concern more of the API design, that every doorbell call via
dw_edma_core_ch_doorbell() should include the LL publication barrier?

Thanks for reviewing,
Koichiro

> 
> Frank
> >  /* Must be called with vc.lock held. */
> >  static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
> >  {
> > @@ -261,7 +279,7 @@ static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
> >  	    chan->status != EDMA_ST_BUSY || !dw_edma_ll_pending(chan))
> >  		return;
> >
> > -	dw_edma_core_ch_doorbell(chan);
> > +	dw_edma_core_ch_kick(chan);
> >  }
> >
> >  static void dw_edma_device_caps(struct dma_chan *dchan,
> > diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > index d883ca446f5a..b3098eb83442 100644
> > --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > @@ -480,20 +480,6 @@ static void dw_edma_v0_core_ch_enable(struct dw_edma_chan *chan)
> >  		  upper_32_bits(chan->ll_region.paddr));
> >  }
> >
> > -static void dw_edma_v0_sync_ll_data(struct dw_edma_chan *chan)
> > -{
> > -	/*
> > -	 * In case of remote eDMA engine setup, the DW PCIe RP/EP internal
> > -	 * configuration registers and application memory are normally accessed
> > -	 * over different buses. Ensure LL-data reaches the memory before the
> > -	 * doorbell register is toggled by issuing the dummy-read from the remote
> > -	 * LL memory in a hope that the MRd TLP will return only after the
> > -	 * last MWr TLP is completed
> > -	 */
> > -	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
> > -		readl(chan->ll_region.vaddr.io);
> > -}
> > -
> >  static void dw_edma_v0_core_ch_config(struct dw_edma_chan *chan)
> >  {
> >  	struct dw_edma *dw = chan->dw;
> > @@ -624,8 +610,6 @@ static void dw_edma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
> >  {
> >  	struct dw_edma *dw = chan->dw;
> >
> > -	dw_edma_v0_sync_ll_data(chan);
> > -
> >  	/* Doorbell */
> >  	SET_RW_32(dw, chan->dir, doorbell,
> >  		  FIELD_PREP(EDMA_V0_DOORBELL_CH_MASK, chan->id));
> > diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > index afc2f24fecd3..64a07fbc5be3 100644
> > --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > @@ -282,20 +282,6 @@ static void dw_hdma_v0_core_ch_enable(struct dw_edma_chan *chan)
> >  		  HDMA_V0_CONSUMER_CYCLE_STAT | HDMA_V0_CONSUMER_CYCLE_BIT);
> >  }
> >
> > -static void dw_hdma_v0_sync_ll_data(struct dw_edma_chan *chan)
> > -{
> > -	/*
> > -	 * In case of remote HDMA engine setup, the DW PCIe RP/EP internal
> > -	 * configuration registers and application memory are normally accessed
> > -	 * over different buses. Ensure LL-data reaches the memory before the
> > -	 * doorbell register is toggled by issuing the dummy-read from the remote
> > -	 * LL memory in a hope that the MRd TLP will return only after the
> > -	 * last MWr TLP is completed
> > -	 */
> > -	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
> > -		readl(chan->ll_region.vaddr.io);
> > -}
> > -
> >  static void dw_hdma_v0_core_non_ll_start(struct dw_edma_chan *chan,
> >  					 struct dw_edma_burst *child)
> >  {
> > @@ -393,8 +379,6 @@ static void dw_hdma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
> >  {
> >  	struct dw_edma *dw = chan->dw;
> >
> > -	dw_hdma_v0_sync_ll_data(chan);
> > -
> >  	/* Doorbell */
> >  	SET_CH_32(dw, chan->dir, chan->id, doorbell, HDMA_V0_DOORBELL_START);
> >  }
> > --
> > 2.51.0
> >
