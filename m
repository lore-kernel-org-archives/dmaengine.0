Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021102.outbound.protection.outlook.com [40.107.74.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C9A397944;
	Sat, 29 Aug 2026 17:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788025441; cv=fail; b=eAAimXFXrvbOlfAvo3bi/7aZKOMfxZMiOgC9ZbiEH/zdIUzx0MTcgYGdo7CsbqU2DKJZMxDzhz5oyPKmxXjzy+NmGO8q+8q/uBcMkyYmyjXYLnxn+EnqaZI8qLyfPoW7kgyHLvS1t/cD79KUyL6tc1UsRu9BO3RV6STvy5McmdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788025441; c=relaxed/simple;
	bh=Rny9gR1GkieSnE+8q7CQdgBgat+w6ACwTSCH54Hp+Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YtUR8kz5/ATmgZiD3/+aRRwRwOdbxFUEbLGe0WbbREDn4/qlYbRSoT0HtRP8DFhoNmJyqPX0liL36AslgvKt+RVfmrATVaq2pfCoZNq83L691fl9vXqt2e+Kx//Os2CcPYpmRB7jATwDdoZyLEKFwoGC9t5FrL+u5YPbALEYrCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=CRNRHZce; arc=fail smtp.client-ip=40.107.74.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="CRNRHZce"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDTAT7yXoQPeGm5bk1nd0god3h5xr8xGytcijQ82ixAbylBtkAIFuIBDq9I63E3CtVyct4A6U9EqUoXVXGka3gCr84ximPFmvzP3lq925NHrTvEPeY/O0e0crpFkXMfcIAY+nQ25er9vwm8LwV84sa4phNpsPRQ2RIJVH1FZ909Kb3GxaDj+3o1pbwX1apGrtMxL6F2CyVLQDmKOwjLRWYOt5acpMaBMAl0OyV3i36CbqFWZ4gCg9i/rzhNFHIvVeeI8hDtTc4jymyEfl299SaATtPRRJ6GW8PXbXyF2qF8UboAY/ui1BF0+EWkNZX3uu9pCtwAnpvMLhOdfZKzuRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcXpUZw9USVLAL9C6GgqX7wAcy3T0STS4ZMSob+rApY=;
 b=QOCUJ4TNPB9az1MVQAqnp92Ia5c4m7b2K55+WGuiXVgTMfj42J6tz9qGuXnVzf4WO1iihihTl/tnWQE1nRsq2BMNQJe9t4SwBxZHN3Nv95Kibm75iTgHKs6at8CqXqhKzhkX3hnMD/mHkofMheM2JwjRzv3cY4eh4LtTfohlnJZq2lWxG8ODQNf7+cydc0SJRqqoViHJBUrLAlN/xUo71VNZ/kGFdouN6R5Qg2801V2jDwiJ4W9hQa6zzTaBfCNMzZjy6PksRqeRA9S6Z3Z8yvxmG5zXHAi5WOPaEi5BHqbbyIfDXHgPPdZzeLfuoMck+RHg8YgVBQEU9DYDdh6Uyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcXpUZw9USVLAL9C6GgqX7wAcy3T0STS4ZMSob+rApY=;
 b=CRNRHZcemYg5rYexRInFOZ3s0YjGGpwa2kg6sEML8PBI9z4s/uw5x0lAXEcIJmaZNfu1FrDfRrJipeD01moZM364XpgqPkx2WD1AfcGQuCeUcHeJ2kjcvw+7QrnrKwuqkv1UxmjfYtzDeCaLVJ9KYUw1WS8EnH/2LunzfNFBVxk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3021.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:301::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Sat, 29 Aug
 2026 17:43:55 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 17:43:55 +0000
Date: Sun, 30 Aug 2026 02:43:54 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dmaengine: dw-edma: Account for the MSI vector
 offset
Message-ID: <7abrqclxjmop6ekuf6kubajiezzj25u5pxga5zyw5kl2wpkmwb@c7a33fb7iw6a>
References: <20260828163611.2691264-1-den@valinux.co.jp>
 <20260828163611.2691264-4-den@valinux.co.jp>
 <apHXefJ2o4IQBYsF@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apHXefJ2o4IQBYsF@SMW015318>
X-ClientProxiedBy: TYCP286CA0179.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::7) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3021:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c2275e3-893e-43c8-f802-08df05f51907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|376014|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	abK0zNAggjwIFPf64remCIOkmhmsNaXTBZb6caMGBn6VBd9tg0HxB7H4JgVxPPvicC3HVJG+NYjP+Z4hpbuJCjr94wMkLQMHHHRmiQBz0gqklc2HDkSiTG+J/V+GUFYwR+ILIPNS7Ubj6tQVRTVjCKEQjpfUl9F2q1WcJRVXsz6Gcj6wd+QBLwTPwGrvsRrUCkLcek2Ks1783ptBZHwUJRH8VWqBAStyNAKTdV5XP2hOD3kwu+ZvQGD3wVM/XjC4wGg7V35Qr9wQ1PK3Usiz/LaQsa7aimxRkKGOVzKAZieAtPv5CpHPtNEebxtWvluC5SR5BDpzSZMKu31sXG3TjUqvaSKf/BJtrvhADOXWjtDmLH4lmikaQ3XnOznk17x5Y0mMOmXjT92qAwAUNyE/vwrTNW0+whiB9apnDkGjGLeWShF3R3c+ZMWhlEjzr3XfBP58Zin4+pvNgqX4fEOQ4sc/xwFTvQDcx1OJVwqb3wr2R0jldUME4ynjr8zl9KgW59+oXPcG+Yovt7ebSpCeiJfjaFS0XJPFDTBtAvBU2ZRD6ZiDy/jVRRxXfKWLlFYMEz3ZLkacIEMvGrkoDr5tupe5fYrlJHjOvkXjJYDTvuI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(376014)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?26gGUdYnJ9F2N13GkgGCN3Vysvx4H84U8XAfKR6fx5YMVYdm18OBaj9WXaHh?=
 =?us-ascii?Q?7OFzl40WbLb7bIF00xamBsRLZCJbTGfeodIVpqgSjCyelpST/vdtzcWnbJ5H?=
 =?us-ascii?Q?Y1+lfJ2EDIwFvWUfyzYEaYkYBP1tQWAbV6k/1GxUjedq3g+rQDpLEvdfmluc?=
 =?us-ascii?Q?mWlR2HnJBjmpmLShZutdHYZpOsB1QzQ4f/ZO3KFQh3J54xpwfCdpAi6349JK?=
 =?us-ascii?Q?M6Te7JIRGEjLb1NUPZ7/KumUyTw1Qrdlml4Ev2S8jFe21YN0gYSVqLrq7Bpn?=
 =?us-ascii?Q?8l4HgbJjkKf+17XTME6mVbKDtfBPtR3ZH5bG6AC5THY/RhHpuDK6Y8QwRmgL?=
 =?us-ascii?Q?uMzsJit7PdoxleEAxIAxI6Ihu0YHWDGVVcV3DLyl9C6Rk2dY2rwwAExs5564?=
 =?us-ascii?Q?jtyx4ax1PTx8xpXUZkQxb5+S0fn4J4rWVWrbBX5JVs3qRnwF8L0otZFTnOEi?=
 =?us-ascii?Q?m+Eqj4+RFEok6h3IaYSw7rAU/e99OPmGfp1gt6JEdRiPEYFJ5Xh7Q/UbrR9R?=
 =?us-ascii?Q?7vzNk3cMVSI1yyy1CN6Z/vx8JOejUSM8ceKA1kfH6UyRZ037yu4/Z2KaqI19?=
 =?us-ascii?Q?hhy5soMsN5pX6B3lw7qd7+F++wN2z+CbNZ+judrDiSPyXm3yR+BX1V16MreS?=
 =?us-ascii?Q?7B/fhp5T8QRDoG6xNnREb6/5f4Dt62nNjr3FtOM6EGVaaCnkUOx9q97uU390?=
 =?us-ascii?Q?JKuhHbh9c4LfQzXVgjKG38xHtNZVjKOdMrVFlV9EmwfjHk2NSl6g+X6HFLMH?=
 =?us-ascii?Q?g6L0HgNLV6nlXuEOHl0g2XUv+iwlhNlRK3ihPo1erAjVTDWDd87rtUp+qJKT?=
 =?us-ascii?Q?CRKICiSLLSdfh2liBvyRRhyn08+hZsXDIECDleJKynUPl3rYNqL0BLXF7liD?=
 =?us-ascii?Q?Xl4EVV+5YzZu4IfsxTsn7H+3iTU1jh32Q1iwL2xh1MAj1xPIVtd6ZS0sfkZv?=
 =?us-ascii?Q?VRErXeH5th1XF1xUr+mqt4lV/8sjW0z211pkpEs+0FlDhSD08j0nsYS7slLt?=
 =?us-ascii?Q?bum2KFOSlhRkMU5yaroayG4s+HXoGC5SXGgL+JPkpJADIDR8Z0aevdiSNakr?=
 =?us-ascii?Q?jhde0hhR9Op1wpMprLdmUMcE9K1ixHcvWHaN1X8Zgb7mrFvEloW1oRm9hQLd?=
 =?us-ascii?Q?RQsJHFTMHdiDDymIzptU6/oCsl8WlSRkwE+bJlhcNhfghPvz9CZlywj0T3p7?=
 =?us-ascii?Q?a9G8s91VMrJnjXGdRy9lulpNeDvbFQOj7dQRCpctmvWZMBJac2lKc0nIEdiw?=
 =?us-ascii?Q?Oy4OBW69a/dLNZCTDrlMyDyr/Bt67PBylT3vlMY2SSRcF2tFYWYb4Osb+yE7?=
 =?us-ascii?Q?pYi8u3clve5NI2J8kpJaerKlw2Vo7BhnYSjQ2V7JSgn9XWQLEeFFUaFP9Qww?=
 =?us-ascii?Q?f6wdU9lJVJM0U6mpSMrT6rrqc9nktRA5sdRdefgSKOjUM4BxhE9bNI5V9SsY?=
 =?us-ascii?Q?5ST+2ECTCqavDOTLKWedzaihUuvG7kWwl3Lc5fUeswYzhJohn5qWc3LJ6IRb?=
 =?us-ascii?Q?tU50QOaZYLSMhVFpdl5PJGautcaq2cPHuklfh/NU7K1BeEzBn4jQmJ8DD/P1?=
 =?us-ascii?Q?A8BnO88/pykhXlD6gi3gjoCtlbJ6w6vvDr3IBejyOaPhRwZjmgi2kDRXuzlo?=
 =?us-ascii?Q?btnsZccHD2NNaEMozSUN5DyVVC704n22HTRYysPkBqeRaJxQILwvmL7i+kk8?=
 =?us-ascii?Q?yIMiXm+RLGMsiU2SxmzzSZE/PCyW1t3X/UNiYM3sZtJxyw0oEDskKON/mJD2?=
 =?us-ascii?Q?lWC+0PHsQ2L50lnwFW4jFARuMuwkIQfAyWBnoxWAHSWhsTQ+fuV4?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2275e3-893e-43c8-f802-08df05f51907
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 17:43:55.5838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HldviOmKd3xAiJYgKw/nZCXDSkDjxHb7uSdZwe13AY+x7w9u/w6M+m2XuJhjHokjQKND+5b/4LDHRJOlJwo0ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3021

On Fri, Aug 28, 2026 at 01:46:17PM -0500, Frank Li wrote:
> On Sat, Aug 29, 2026 at 01:36:11AM +0900, Koichiro Den wrote:
> > get_cached_msi_msg() returns the base message shared by a multi-MSI
> > descriptor. dw-edma currently derives per-channel data from its local IRQ
> > index and does not adjust a common IRQ at all. Both assume eDMA starts at
> > the descriptor's first vector.
> >
> > That is not true when eDMA receives a tail subset. Compose each message
> > from the IRQ offset relative to the descriptor base in both paths.
> >
> > While at it, avoid reading PCI MSI attributes from descriptors owned by
> > non-PCI devices.
> >
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> > Changes in v2:
> >   - Rework v1 patch 5 for an MSI allocation shared with vNTB.
> >     https://lore.kernel.org/r/20260312165005.1148676-6-den@valinux.co.jp/
> >
> >  drivers/dma/dw-edma/dw-edma-core.c | 24 +++++++++++++++---------
> >  1 file changed, 15 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > index a8c6bd508fcd..6af8a414e4a2 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > @@ -7,6 +7,7 @@
> >   */
> >
> >  #include <linux/module.h>
> > +#include <linux/pci.h>
> >  #include <linux/delay.h>
> >  #include <linux/device.h>
> >  #include <linux/kernel.h>
> > @@ -1075,12 +1076,23 @@ static inline void dw_edma_dec_irq_alloc(int *nr_irqs, u32 *alloc, u16 cnt)
> >  	}
> >  }
> >
> > +static void dw_edma_compose_msi(int irq, struct msi_msg *msi)

^(A)

> > +{
> > +	struct msi_desc *desc = irq_get_msi_desc(irq);
> > +
> > +	if (!desc)
> > +		return;
> > +
> > +	get_cached_msi_msg(irq, msi);
> > +	if (dev_is_pci(desc->dev) && !desc->pci.msi_attrib.is_msix)
> > +		msi->data += irq - desc->irq;
> > +}
> > +
> >  static int dw_edma_irq_request(struct dw_edma *dw,
> >  			       u32 *wr_alloc, u32 *rd_alloc)
> >  {
> >  	struct dw_edma_chip *chip = dw->chip;
> >  	struct device *dev = dw->chip->dev;
> > -	struct msi_desc *msi_desc;
> >  	int i, err = 0;
> >  	u32 ch_cnt;
> >  	int irq;
> > @@ -1105,8 +1117,7 @@ static int dw_edma_irq_request(struct dw_edma *dw,
> >  			return err;
> >  		}
> >
> > -		if (irq_get_msi_desc(irq))
> > -			get_cached_msi_msg(irq, &dw->irq[0].msi);
> > +		dw_edma_compose_msi(irq, &dw->irq[0].msi);
> 
> where this function? I missed dependence?

It's defined just above in this patch, as shown in (A).

Best regards,
Koichiro

> 
> Frank
> >
> >  		dw->nr_irqs = 1;
> >  	} else {
> > @@ -1129,12 +1140,7 @@ static int dw_edma_irq_request(struct dw_edma *dw,
> >  					  &dw->irq[i]);
> >  			if (err)
> >  				goto err_irq_free;
> > -			msi_desc = irq_get_msi_desc(irq);
> > -			if (msi_desc) {
> > -				get_cached_msi_msg(irq, &dw->irq[i].msi);
> > -				if (!msi_desc->pci.msi_attrib.is_msix)
> > -					dw->irq[i].msi.data = dw->irq[0].msi.data + i;
> > -			}
> > +			dw_edma_compose_msi(irq, &dw->irq[i].msi);
> >  		}
> >
> >  		dw->nr_irqs = i;
> > --
> > 2.51.0
> >
