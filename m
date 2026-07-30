Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020102.outbound.protection.outlook.com [52.101.228.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D11DF6C;
	Thu, 30 Jul 2026 01:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785374838; cv=fail; b=QAGiCZcAt22Ap7uUECWUXWuHF9TeUwzo6HzJsTacywH+OFJDDldwXVlD3V3z0JrLt01+MS6Y03kZSFeAvRIG7Q/0wJZQjXifEzCncdc9niQTNwKO4VoIAJY2wltTAVJreWlQTYyR3iXE/tEHHrRcG+S66Xzc71qm+lAyQBxoDgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785374838; c=relaxed/simple;
	bh=fY4x5x5QYaRc2fxWOkfKoNf9LbP5AJI1F25pJr/g+pE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M6AU10YcTMyGuGCsxTLHy4ci33rICanjnrm6TtCmbhR55yfjIQXyWbeyfZ/DrNnQ5QYcbZ4xb9XJ0R7v16kbOHna505zc2waLdSLLqDUv6mR/Mg9vt60scUBrlQxQ4heWVHdBqyaZ4erPlJNyFuwBIGPjebQqtpWenYsQ2Hz0JQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=V/7ZvhaD; arc=fail smtp.client-ip=52.101.228.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="V/7ZvhaD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UfQ4Rz2lt1UUfC3SC/mOwL4IZyxyYR/7rxAj3JN1i0YbVNp0LGzoC4nHzRsoy5WKkEIxlK3EnMcA8mdxNl6aby2sPHTmQ/aGHSupZ2mAqh+blzDzOaapZYXSesoC28Dd2RqKKp3y+hglWrpb1QRo1BdvzXDWM9X5mkeWWymFl4KB1VHwc0yrNVHFY3w1Im28c8LtgffpVTtlO4ypZ1OJWQmlU23h0u9fBMECmP/aa4n9+R41ZUyNt4YDw1myYfc3bSEz/zutWovO+9wLoA3UrpNTkG6901gijYwEXX0aUkmsE4TX++86gjLJ3U66UWYJHR9XO4R3AqEMDDMbJN0tSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqPr6TbmfrBEA+7F6yBRxuQnpcrtZxmgXJS9wSIc3EE=;
 b=aUASJlBNbciBgnMJGOTbz31Df4XrjnzLGKA/dJHriMy0I+1or+0f25j5pZBbwceZt0KhpKUA+VeMKorg6b7r+oKbVwdr4EJ7qGbcTVJ6JfJC5HwS0/rUS6K6Q7UnlizowFqvXSjrBh+9wl7qoyKKkb2nRzRJ8QF42A40J1OCuvok1pAd8FfL+Vs7zr4qUAtcBY0+r6HyuiVqX0WxT1YZn2A8M0/URf+YeTh5kxNH2UrjKOTqNgLNsnY1Wmv7tTRYohE0BjI2q+UwqRM+5+eQuT0uy8ViDDNNGSwzf+961bTz0rhrqDlg36cFSzOVYFDEne0IV/ZotJYFTK/J07XZFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqPr6TbmfrBEA+7F6yBRxuQnpcrtZxmgXJS9wSIc3EE=;
 b=V/7ZvhaDl0l1WeAZw47IVV3B7240o3T6qfO3IwqcI8Jrdt7HxifOni6Dm0uE2zRbhLw+syTJtVsgaAlpfcTZ4OQhWU1JJY+z7DuFOqmW+OwjWOUfkaLaLXG3kL9K6ClYB9vNuoo5GxDq0nUjTV+LJmu2CjBMaScsxiBMr5kDbYk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OSZP286MB2331.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1c4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 01:27:12 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 01:27:12 +0000
Date: Thu, 30 Jul 2026 10:27:11 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
	Kees Cook <kees@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Christoph Hellwig <hch@lst.de>, Serge Semin <fancer.lancer@gmail.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Niklas Cassel <cassel@kernel.org>, 
	Devendra K Verma <devendra.verma@amd.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/24] dmaengine: dw-edma: Prepare LL progress event
 handling
Message-ID: <ht246xrqutzbpu7ptp52sinawemeo5dobjwaze2omixo6yroee@jn4pvtios53n>
References: <20260729143036.3087722-1-den@valinux.co.jp>
 <20260729143036.3087722-9-den@valinux.co.jp>
 <amoumkWEpqF6yx8w@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amoumkWEpqF6yx8w@SMW015318>
X-ClientProxiedBy: TY6P301CA0010.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::10) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OSZP286MB2331:EE_
X-MS-Office365-Filtering-Correlation-Id: 54c37c29-de69-42e3-dea6-08deedd9ae26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|23010399003|1800799024|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BNZ36SBIgR7vSPIvZZcnUVSGZpfKI59B5UhSxy/BnvFDO9rjq0+syJWuqE7b/YXNKM5XJwIlVhAZ6J0TUDjwZGw+MZ/u+cN2Ol8EfyIxw/jdiPLHIAgO3ES+Wosa720yYDH69Pzk28dKThDjqiTwMUQZYChBDOG/up6LjbYCBdghuBdYD7A2ov46KPtFAbBsyH5b7R1xaDXYdo7bSDl09/m/9Vp0gx+qv/c1GFW4e9PesCzSAHMpyK+h5RYnvoZAxRgYbCPqQZRmcL4siCF/KSsJ3YnBr3UGMBcMJ8UMn94DLNrnyNHgf77+LHL2vrX6ijVPCCCijFao/vYIlRiOT91cEWV3fPmbcmTuTej1HGGDZNDO0cLECQpT0u53l/rcGnw7xCVf7QTfG480fc1ApSbG4JYDT2yXR4lxBlA+MnrJZBfVMxRGdsotQfW5XtMniKWT18ImxtP6u4OQGBU9OCVR3VAjFXsU/XFWkP7vffmWZJoF8rOPtZhE4h8xO6LjysDVtUOO1E6pCwctET8QQLH7ViLGK6fiooSZUCQzdckVale/JTdTxe7GaaSEjkFjgpy8GTKIBAoON9ihkuFKiLNF58v3Sn7ypJzuG3FwMJJi0B0d5DRP5hKRw9BAvr9xHNBc/OZ2fri4jvrxL06X92jD4fjvdiFQU7/VRMXzUNM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(23010399003)(1800799024)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yK855kzsULefcw60uwedeHfTImYled7fuqRKryxeMleV/YzIWSGYkFJmzPHo?=
 =?us-ascii?Q?EM5bFUFpJYsa5cpcpDDpe9bDPxUgIiRrrwYmbLVs6OZJ6Xt4JKntfl8CNS1B?=
 =?us-ascii?Q?q7H9J6FJGueLBMxLzZtR1qE5sLHMHsLWWssP7RX0fOqTlK3xr65oyFJKUtB1?=
 =?us-ascii?Q?Av0vuxnc5DjgcmAJQ2tSHv8e9MQzp7QzplnGI+Gh8qlI+rcEL1w/SCuTnY5k?=
 =?us-ascii?Q?6D4udOFqyjfq4Okt3gyS2rUhuO9aepTpZwQoD30K2WvyPBiQtmdgp4gF3ldL?=
 =?us-ascii?Q?azmAKAMBp2yjfPeBKpZaFCIy8PkkyaSIPxs9TzfZKz+TLGyCW/pEc03Z/zGk?=
 =?us-ascii?Q?WVARFOzDSPFNLspHzHWjpfYgyvOiB0ryOs/0sw+3qGyaxJOnKyw5LbEcBDYs?=
 =?us-ascii?Q?StdhesFBPktQdm4bLXEOhbC6CY1b2+HNXo5WBp0CjVmowEQ2AgSR+fK/r4P7?=
 =?us-ascii?Q?ZHPwr6KXXOpfEFSaQZsXRaQptt/lzVUKDjAFPEKILu2uAmvV1ezzHGIWl86d?=
 =?us-ascii?Q?uAXWwf2WREpesgjdtwiRt7Pz90K6rr/O5NWSWlx4naZc1tLhUebzodDTYKJq?=
 =?us-ascii?Q?RzaHqdoHrzfP124bzGR7C4SzaetQPe1oMJwyAqAKTzZQAR7JDiuZYpH6EZyY?=
 =?us-ascii?Q?nZ8C70kzdEW/2PK2sfNMI4O5neML9adTS1d179uUZxwy7OGzBU+QLexCOp2C?=
 =?us-ascii?Q?01LeDjMIyvIwjUQw3CAeTN//GnPAFrHF1Et9w+c9Hqndtx4eqLpQZXmEakug?=
 =?us-ascii?Q?0ZwaxIljEBNfWwCtRZO6ZRuHIOxha01DwjKtdD10wNj0ZEtmFNEB4H6pVGig?=
 =?us-ascii?Q?9bbyIAMO7xssjqkLt2ASOEGY5mOpnGhvWKHGo86rgcUrg8Jx7BFs6mE1Ht+O?=
 =?us-ascii?Q?hQXjOv5BmaQK6qftzqN/lomTrz2R2WO43U+/lg55JIPnFcF3SMS32fGO09Ms?=
 =?us-ascii?Q?310hyRiokHHrL3haTqEpzYNesPnKXC8RyRWPd/Iddvc9YftwaEfPU9z3HaTv?=
 =?us-ascii?Q?rUSFjNcyuYMviF4p8x9/pAIYYijsWZXnTUgRWHvi1zTm4xFj8Q5abGxDRYkQ?=
 =?us-ascii?Q?JLGc2EbGxnqPuUP2hJCfoFK6xabVlIvdvwKHnXNmVSjUfOVLuklkC8vpynbS?=
 =?us-ascii?Q?Fnqid5LczbDVwS7h5WfrUzaNuoiMU/JZLHGFiHFOC4jaqN02xmE+VRInYuRd?=
 =?us-ascii?Q?dY+hUJjAAQku+Re9uTQs2/WdZctowfN0dMIzCPIejOlX+ea6H5Wh/ROa+JQO?=
 =?us-ascii?Q?7ondr5BzYUWjDitTuXanNpLn0/w6Zm/LWjYzv2VQqHA1iCrf7J8W9/J5AkUU?=
 =?us-ascii?Q?sgH9jN1Vv8r1Td+XRUbU0YfPHIrrgw+Ex8gab1TXe9CojGGt2yA511b7TrTE?=
 =?us-ascii?Q?86W1Xy66PsePhWXfFDkzyDpY/nuMNam9P1zilDWhHpiATl2CyG0ioE6Y1zJk?=
 =?us-ascii?Q?vPqI6piWsZ2W/Q2zNxC/lnyC8Wlugt5CaCmoYzKJd4P1BWh+EIfMHbDFjtqz?=
 =?us-ascii?Q?7jchvfYhuAFM5ezWS/Rb+ozziiprSzJuPsZhLjO7qvL/AHoPbLIe+de53uce?=
 =?us-ascii?Q?Dh25mW/UBnGrDoCKdEYI04/FW1dgTBmhvoHgjRNPGxRyzz8kd2n3/wR5HIEV?=
 =?us-ascii?Q?po7c94orQhPh1mGnRh9nJL0UAYVWfX7gxBk73Yocd+Gdu8abLcnb9RMtKFgC?=
 =?us-ascii?Q?yoRiNQ9oZwqz1+f4WV6l1g3mOWMKy6+BJnyyHVNflkg/Zbd4bd3Z2LUSVkdo?=
 =?us-ascii?Q?r5dS9qnVEyfS/nyj4wxpgEsBroYewgMRNZbHk6kyEb97MaLAMOY8?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c37c29-de69-42e3-dea6-08deedd9ae26
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 01:27:11.9913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H2eNKN3ihHhEPh7vXi6+/jg1aGzbkxCrfOIlqlOQV+02DSNR44874DrIppE16hAZPxSK4RTniBnK0AIvypslrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB2331

On Wed, Jul 29, 2026 at 11:47:22AM -0500, Frank Li wrote:
> On Wed, Jul 29, 2026 at 11:30:20PM +0900, Koichiro Den wrote:
> > A later patch records each observed LL event (STOP or PROGRESS) together
> > with the LLP sample taken in the same interrupt-handler pass. Serializing
> > that capture with a channel restart needs to know whether interrupt status
> > is shared per channel or per direction. It also needs a provider operation
> > to clear stale LL interrupt status before a channel restart. Add both.
> >
> > Centralize runtime request updates in dw_edma_set_request(). A later
> > patch uses it to cancel a pending LL recheck when STOP or PAUSE changes
> > the channel policy. Rename the existing workqueue event bits to
> > distinguish them from provider IRQ events.
> >
> > No functional change.
> >
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> > Changes in v4:
> >   - Explain that the LL event and LLP sample are recorded in the same
> >     interrupt-handler pass. (Frank)
> >
> >  drivers/dma/dw-edma/dw-edma-core.c    | 35 ++++++++++++++++-----------
> >  drivers/dma/dw-edma/dw-edma-core.h    | 12 +++++++++
> >  drivers/dma/dw-edma/dw-edma-v0-core.c |  2 ++
> >  drivers/dma/dw-edma/dw-hdma-v0-core.c |  2 ++
> >  4 files changed, 37 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > index c036510dabcb..b84aed59bf77 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > @@ -30,9 +30,9 @@ struct dw_edma_desc *vd2dw_edma_desc(struct virt_dma_desc *vd)
> >  	return container_of(vd, struct dw_edma_desc, vd);
> >  }
> >
> > -enum dw_edma_irq_event {
> > -	DW_EDMA_IRQ_DONE	= BIT(0),
> > -	DW_EDMA_IRQ_ABORT	= BIT(1),
> > +enum dw_edma_deferred_event {
> > +	DW_EDMA_DEFERRED_DONE	= BIT(0),
> > +	DW_EDMA_DEFERRED_ABORT	= BIT(1),
> >  };
> >
> >  static inline
> > @@ -73,6 +73,13 @@ static void vchan_free_desc(struct virt_dma_desc *vdesc)
> >  	kfree(vd2dw_edma_desc(vdesc));
> >  }
> >
> > +/* Must be called with vc.lock held. */
> > +static void
> > +dw_edma_set_request(struct dw_edma_chan *chan, enum dw_edma_request request)
> > +{
> > +	chan->request = request;
> > +}
> > +
> >  static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
> >  					enum dmaengine_tx_result result)
> >  {
> > @@ -243,7 +250,7 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
> >  	if (!chan->non_ll && dw_edma_ll_pending(chan))
> >  		dw_edma_core_reset_ll(chan);
> >
> > -	chan->request = EDMA_REQ_NONE;
> > +	dw_edma_set_request(chan, EDMA_REQ_NONE);
> >  	chan->status = EDMA_ST_IDLE;
> >  }
> >
> > @@ -360,7 +367,7 @@ static int dw_edma_device_pause(struct dma_chan *dchan)
> >  	else if (chan->request != EDMA_REQ_NONE)
> >  		err = -EPERM;
> >  	else
> > -		chan->request = EDMA_REQ_PAUSE;
> > +		dw_edma_set_request(chan, EDMA_REQ_PAUSE);
> >
> >  	return err;
> >  }
> > @@ -410,10 +417,10 @@ static int dw_edma_device_terminate_all(struct dma_chan *dchan)
> >  	} else if (chan->request > EDMA_REQ_PAUSE) {
> >  		err = -EPERM;
> >  	} else {
> > -		chan->request = EDMA_REQ_STOP;
> > +		dw_edma_set_request(chan, EDMA_REQ_STOP);
> >  	}
> >  	if (chan->status == EDMA_ST_IDLE)
> > -		chan->request = EDMA_REQ_NONE;
> > +		dw_edma_set_request(chan, EDMA_REQ_NONE);
> >
> >  	return err;
> >  }
> > @@ -724,7 +731,7 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> >  		}
> >
> >  		if (chan->request == EDMA_REQ_PAUSE) {
> > -			chan->request = EDMA_REQ_NONE;
> > +			dw_edma_set_request(chan, EDMA_REQ_NONE);
> >  			chan->status = EDMA_ST_PAUSE;
> >  			break;
> >  		}
> > @@ -764,7 +771,7 @@ static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
> >  	}
> >  	if (!chan->non_ll)
> >  		dw_edma_core_reset_ll(chan);
> > -	chan->request = EDMA_REQ_NONE;
> > +	dw_edma_set_request(chan, EDMA_REQ_NONE);
> >  	chan->status = EDMA_ST_IDLE;
> >  	spin_unlock_irqrestore(&chan->vc.lock, flags);
> >  }
> > @@ -778,15 +785,15 @@ static void dw_edma_irq_work(struct work_struct *work)
> >  	do {
> >  		events = atomic_xchg(&chan->irq_pending, 0);
> >
> > -		if (events & DW_EDMA_IRQ_DONE)
> > +		if (events & DW_EDMA_DEFERRED_DONE)
> >  			dw_edma_done_interrupt(chan);
> > -		if (events & DW_EDMA_IRQ_ABORT)
> > +		if (events & DW_EDMA_DEFERRED_ABORT)
> >  			dw_edma_abort_interrupt(chan);
> >  	} while (atomic_read(&chan->irq_pending));
> >  }
> >
> >  static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
> > -				   enum dw_edma_irq_event event)
> > +				   enum dw_edma_deferred_event event)
> >  {
> >  	atomic_or(event, &chan->irq_pending);
> >  	queue_work(chan->dw->wq, &chan->irq_work);
> > @@ -794,12 +801,12 @@ static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
> >
> >  static void dw_edma_done_interrupt_deferred(struct dw_edma_chan *chan)
> >  {
> > -	dw_edma_queue_irq_work(chan, DW_EDMA_IRQ_DONE);
> > +	dw_edma_queue_irq_work(chan, DW_EDMA_DEFERRED_DONE);
> >  }
> >
> >  static void dw_edma_abort_interrupt_deferred(struct dw_edma_chan *chan)
> >  {
> > -	dw_edma_queue_irq_work(chan, DW_EDMA_IRQ_ABORT);
> > +	dw_edma_queue_irq_work(chan, DW_EDMA_DEFERRED_ABORT);
> >  }
> >
> >  static void dw_edma_emul_irq_ack(struct irq_data *d)
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
> > index 761a5ab4bbb5..95bd4bf47ea2 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.h
> > +++ b/drivers/dma/dw-edma/dw-edma-core.h
> > @@ -41,6 +41,11 @@ enum dw_edma_xfer_type {
> >  	EDMA_XFER_INTERLEAVED
> >  };
> >
> > +enum dw_edma_event_scope {
> > +	DW_EDMA_EVENT_PER_CHAN,
> > +	DW_EDMA_EVENT_PER_DIR,
> > +};
> > +
> >  struct dw_edma_chan;
> >  struct dw_edma_chunk;
> >
> > @@ -155,6 +160,7 @@ struct dw_edma_core_ops {
> >  	int (*ch_quiesce)(struct dw_edma_chan *chan);
> >  	u16 (*ch_count)(struct dw_edma *dw, enum dw_edma_dir dir);
> >  	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
> > +	enum dw_edma_event_scope event_scope;
> 
> I remember needn't event_scope at all.

Ugh, what a stupid mistake. Sorry about that.
I'll sort it out and make sure to double-check this kind of last-minute edit
next time.

Thanks for the review,
Koichiro

> 
> Frank
> 
> >  	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
> >  				  dw_edma_handler_t done, dw_edma_handler_t abort);
> >  	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
> > @@ -163,6 +169,7 @@ struct dw_edma_core_ops {
> >  	void (*ll_link)(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr);
> >  	void (*ll_clear)(struct dw_edma_chan *chan, u32 idx);
> >  	int (*ll_cur_idx)(struct dw_edma_chan *chan);
> > +	void (*ll_irq_clear)(struct dw_edma_chan *chan);
> >  	void (*ch_doorbell)(struct dw_edma_chan *chan);
> >  	void (*ch_enable)(struct dw_edma_chan *chan);
> >  	void (*ch_config)(struct dw_edma_chan *chan);
> > @@ -284,6 +291,11 @@ static inline void dw_edma_core_ll_clear(struct dw_edma_chan *chan, u32 idx)
> >  	chan->dw->core->ll_clear(chan, idx);
> >  }
> >
> > +static inline void dw_edma_core_ll_irq_clear(struct dw_edma_chan *chan)
> > +{
> > +	chan->dw->core->ll_irq_clear(chan);
> > +}
> > +
> >  static inline void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
> >  {
> >  	chan->dw->core->ch_doorbell(chan);
> > diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > index 7ca4b6823ece..27c57f755d83 100644
> > --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > @@ -680,11 +680,13 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
> >  	.ch_quiesce = dw_edma_v0_core_ch_quiesce,
> >  	.ch_count = dw_edma_v0_core_ch_count,
> >  	.ch_status = dw_edma_v0_core_ch_status,
> > +	.event_scope = DW_EDMA_EVENT_PER_DIR,
> >  	.handle_int = dw_edma_v0_core_handle_int,
> >  	.ll_data = dw_edma_v0_core_ll_data,
> >  	.ll_link = dw_edma_v0_core_ll_link,
> >  	.ll_clear = dw_edma_v0_core_ll_clear,
> >  	.ll_cur_idx = dw_edma_v0_core_ll_cur_idx,
> > +	.ll_irq_clear = dw_edma_v0_core_clear_done_int,
> >  	.ch_doorbell = dw_edma_v0_core_ch_doorbell,
> >  	.ch_enable = dw_edma_v0_core_ch_enable,
> >  	.ch_config = dw_edma_v0_core_ch_config,
> > diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > index 67a3a7778280..c8b9f6c42494 100644
> > --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > @@ -435,12 +435,14 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
> >  	.ch_quiesce = dw_hdma_v0_core_ch_quiesce,
> >  	.ch_count = dw_hdma_v0_core_ch_count,
> >  	.ch_status = dw_hdma_v0_core_ch_status,
> > +	.event_scope = DW_EDMA_EVENT_PER_CHAN,
> >  	.handle_int = dw_hdma_v0_core_handle_int,
> >  	.non_ll_start = dw_hdma_v0_core_non_ll_start,
> >  	.ll_data = dw_hdma_v0_core_ll_data,
> >  	.ll_link = dw_hdma_v0_core_ll_link,
> >  	.ll_clear = dw_hdma_v0_core_ll_clear,
> >  	.ll_cur_idx = dw_hdma_v0_core_ll_cur_idx,
> > +	.ll_irq_clear = dw_hdma_v0_core_clear_done_int,
> >  	.ch_doorbell = dw_hdma_v0_core_ch_doorbell,
> >  	.ch_enable = dw_hdma_v0_core_ch_enable,
> >  	.ch_config = dw_hdma_v0_core_ch_config,
> > --
> > 2.51.0
> >
