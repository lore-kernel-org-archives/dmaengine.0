Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021103.outbound.protection.outlook.com [40.107.74.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF8F3A8734;
	Tue, 28 Jul 2026 06:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785218595; cv=fail; b=daTd4t06hEfLNHjU/mcrPidCcE2Fb6Yit+tJ8gfgmN8LwZbCLI3kaJzexqzZQjngPgdjFi1r+BudpZeBHle7ANYWgHOBhu4v6w6RyEu+fBLup8QM6nOIQ70LNXZLlDUtIvYDqZcO0Pfat3UVxcJZrpOEyFJ4nuI+ah3oEW6sk9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785218595; c=relaxed/simple;
	bh=iLXkBJ6APtUsNMsrUMxKqNwitAL1OFir+gZRW+oFFjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jxSrN4+za0RWiuN6NIx/FU0rqyhECLS6q7MeK6uc4Hy45+KN1AwnyIP2cQpeaKq7F0JfRZuG5cLo6SrtjKS8CVbPQ6DgbinH9QkkpabJ9rhI2Szybw4xlg6XnahSatXB16nvdtbFTnnyd17VBHUstbsfRfflGYp9VYtKZgCxd14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=JDsaU/wt; arc=fail smtp.client-ip=40.107.74.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="JDsaU/wt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ghp22TQXjH8lea6GDPq0QAK9xyuWh5+k2M9imwV+Gg3r0ZgXbBPiZpunUVsxKb/H5oxTzKiXCpnjYJukVUqCmYv+7JjgrY1kr+gt4iELBlsvmkfOHfD41+WqzhUSt7deKopUd4GqkzBSVqArHBG59RK6fSCHyuB6tLQRv/fTNkGfXfkfnQDC4E93Vc9OupMWlpYFX3w3OQorR72RnEGhBCNH5bqK0GaPw6p0iPI7C7qOLL5GeZu/wL5Kiechg415d3Mtsm4WwdA4z/TYLv0zmPwE+yYCiZSFyxtPvwrbOcPLwOrSsWOT2VRsWcaSz+qoWMESxvL9xspqi3PDxbLQQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FaDuWVzVpZCC1sfLc+b52nVhdK+c8LI6//fGpH8ku7M=;
 b=iX77RTj7ZlO8+1oBZdcuQi9ZUEjyec9ynemRF+IXoGD8T/3644z2jOFeA+b0x6jpmyvSNekSQwv3/B2uDFsmZDSzTDCbHjOJPjmxe/p5ysEOTqIXK50OFlzSbA5jQadIIaExQfITNbOgNeLD7sJ2d+5Z9pOX0eAJ53dqtrwJfFJEodoE5eahQ9lph7yJYoJvxZwHFI00Y2NZAUVc1Un/3QXE6/QUOBpop/i/Jcnry8/X3ov0NUUqKs1M3qYAO5p3e/K6REwPbJErMV0Jt8QUBajSuBXCidnndgfBNqSsHU3oKO1G6fAaCoQljCVmycaeV16Hqy5NXOeIFerCZ0U3Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FaDuWVzVpZCC1sfLc+b52nVhdK+c8LI6//fGpH8ku7M=;
 b=JDsaU/wtv83EKAoPFfbpwSO3zOMoTexA6W4KOSXtL+MH+hMsWaKr1Ylkrj08xTdWdzGAq1AIXOJga+ruCdNmauPirGECy9PWnsNUC6pop6EP6l4Cj2ItpRiqkeqhWIO+VLDgbma3m2yMBMMJnhtsyQS+HIhx5/WOhAIxKZZo20U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB6047.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:26b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:03:11 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 06:03:11 +0000
Date: Tue, 28 Jul 2026 15:03:10 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
	Kees Cook <kees@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Christoph Hellwig <hch@lst.de>, Serge Semin <fancer.lancer@gmail.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Niklas Cassel <cassel@kernel.org>, 
	Devendra K Verma <devendra.verma@amd.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/24] dmaengine: dw-edma: Prepare LL progress event
 handling
Message-ID: <xsz4yvjfawcgub7rou3azhyixc6cqfky2zwe4iorlyfofarnnb@6cnt2pgel6pm>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-9-den@valinux.co.jp>
 <ame14bGTfZUSMYUx@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ame14bGTfZUSMYUx@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: TYCP286CA0107.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB6047:EE_
X-MS-Office365-Filtering-Correlation-Id: 9075c0b5-df4f-4305-555a-08deec6de762
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|1800799024|7416014|366016|376014|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Yf9L8sibgFxBuatNWoU73h9JQnBSQFgpSrovNcsYXIAJsHObExqzXZ1QErVDM5hUEuahq45XYZgzHOewZEVwk15Gajz+fNUv+dkbAgIYhstup/iBXWd12dYOBc+mdhPAw6tQC1k+I5mjMD4rH5BhW70OFzn0EgYhNW6yjJwb1mcdkPtKKqdT7M4l0JWwSeUUbxU7XGZg7rrOXKQXZkmGTjtqpyRA0vkn9YzZQVRtezNRaRio6sz3U7JEv6asf1cnWU/WSwsHhsdV8T7TViLfO9Elujs9LGgr9fPFBwyUd1IiSEhsNCUnl8A4NDaCPEwOHQqqcGb1xvxLMZfKNdpQlC2xSLjmQ8sVc9bQu5zQLJQH2qp0F6d9/r4bKB3IOXMVxtfAFZs17/q+PyTQhX5S3b4dpfVpWJsjAYcoDmdyZ96HB3LgdYknC7pTVTTFmPrlOj3WPTpyb4boDA0++B1YpLb36zWgxW2EOr+ojPZXrc/AuVm4DhcylT631Bww4lxqPCcogFOa8pCgWzGL82YwfdUvbMWvusTgkhZFhG7OI1Pi/NVyi2PVX2JE7v9Zo8OqHGHJBs/7HJ/DZFYblhqFJebcxMatVXXWp552aX9TUPoXmnSh9bjJ6fmRBgvdz0+Afr7ByYD03GxR5xOI2d+xsKE+6S3v98uolxBK/T/NiMk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(7416014)(366016)(376014)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aD5zPEw4u/UPKCI8dh5Y8Fovu5FfsYvS4BvPwvvf0MlTQFDOG8uOQezyeVm0?=
 =?us-ascii?Q?GxO5WGGfhrP3rkWRd7as0cXVLGnqR8S1qB7UNcvdUrNr8OZ7LV6SD4Z9J7VI?=
 =?us-ascii?Q?etevZQ2UP1kS+rSS0dUqfHpdKpKCg77S09n9KjQlWMBLZfwrvj5pGCOBCmnE?=
 =?us-ascii?Q?KL9T9D5bexauroGS1wi4RjYP0fq/d4AqXenva4in/UKGalrd7/ID127whZJ/?=
 =?us-ascii?Q?EFaV1WTSAOYTL5REY/OFXKea9/v7Vs32lxScImnMQnFXiVy5YuBl8Wz4Sdkp?=
 =?us-ascii?Q?lGboCG2VWhs/IxUacnLgEy5irane0UoZ/gMYrkpKUmEbNYQu7xgxXHUeHoFp?=
 =?us-ascii?Q?V0QNshhLD1imznPrTu1AhvYFPmPmlgTDjUf16hULkql9/ZbqqeNVWOvS3goh?=
 =?us-ascii?Q?f+ktwSvKrSwOQsw+V26PqlaEpm2+u8h73ureLTZmdNtSE17H9mx6wv8AvPYi?=
 =?us-ascii?Q?fQ5r3x06QBXuDkuKKgeVO0yBEbNN5yRA0CxpjilWe0IBB81mOce3JNugo5h3?=
 =?us-ascii?Q?SyiKFQcqhfMst6tl9Fu5uZPQjeeCAmJDc5475wFYC4xbVEj/Fnr2qF1G9GQC?=
 =?us-ascii?Q?GKL59iofSmEB3XRnNvExNnNc0GA3c+TgfJAcAMSZtKqdljFj8rRMUblIJ//s?=
 =?us-ascii?Q?OL7mAFYRoLZG49g7ATKGr6dkRLMMYAKwp2C7cg2/4pR4+goEw02TDbLou1U+?=
 =?us-ascii?Q?xrykUwGXxZPAinRsdka5hCmbtt1fgn3cUUuWNPNwVh3pRuO2EC6eoAGUBKmX?=
 =?us-ascii?Q?k2FcADHRA+LGagUSPZWxOVqD9bjZdb+S81oZcha3Fe8aNk2wkCJ6KhTZ8tvM?=
 =?us-ascii?Q?ujS0b1jlYQPYvGCucLRJCiEryiY2tP2tfRbN5O3zz+1S6BsIqTnH27cGm6lS?=
 =?us-ascii?Q?9go8oc6qd4Lsmio7Uv7IZWgZRQXwXFFD08IZSuRjSZCrCNQr8R9xr0C48tq5?=
 =?us-ascii?Q?AwXJAwSVGIKOzLKgaKwj35Zb41SWrBCcnDpfHoj2fZg5718vj07Cl2NNs5Pb?=
 =?us-ascii?Q?ienD8e9/1oqVsCWMgafvPvz7vquPxERPh0ANpe2K0VNSvionRZcwINjNyKep?=
 =?us-ascii?Q?6n+eyIcle39YoVp/A4C7j+S4p3HzFKZZLoiMO51q1hShhxR3XNm+Xi4mTYqr?=
 =?us-ascii?Q?UuVd/DPk1mFeVZnf+dmdkNwiu4eWqzUpjjRS7Tra4LP1yNShpU2s1GwViFFv?=
 =?us-ascii?Q?mgpzM5wC1FlrPHNO4wEeMJ3yPm6Ya0Aq3b/NHFClf4RuDM1R48q97PzLlfWf?=
 =?us-ascii?Q?UlmLwSkIiXstI+oY8IyqfjZc101CQ8axfXMPeUG8LMuKGDjx3+JH5Lh8IUOy?=
 =?us-ascii?Q?zfqPRp0A+Lh8pSPbMGqKW4xfW0fYB6+b2HJCCPwETFDVb0F4SgGsikPL4eKS?=
 =?us-ascii?Q?HFTefEf21aJbnG+sPwaZPzyZhfLIUf068g/cgpU3jdo6I58Umyvr6N6kK8O/?=
 =?us-ascii?Q?r1XO/QBDORw00xcWVZoZRAdgP5LYRdeIEm2GtUoS8VSolacA4uPCzDCHhfRZ?=
 =?us-ascii?Q?62kk8YcQp4PmL4PgflqyHAgTmJ4RyeWMZIZewmz3fLAMMmYGLmAJ5A7EQgNz?=
 =?us-ascii?Q?SrAP9XtCO+DEqRnUDmOl4QH21cmXY0/vFJHm+yv4FOIljeajOC5Tku39lGoO?=
 =?us-ascii?Q?I0+C3FzRegih0fXIKI2JVy39Surq6I6kN9dSIFE556CxxoHvGvKLV1SjlFSP?=
 =?us-ascii?Q?DQT5B5tmg7xbS85oWgJsWiwAFiq533+QYOnZNKssBm0rCsnVPCi8sVz1qEN+?=
 =?us-ascii?Q?aWF2OV/ubUuIA5jujOwFhJeiszWHQ0esCFPxK225o3uJJMWZVnZr?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 9075c0b5-df4f-4305-555a-08deec6de762
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:03:11.2331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJlgTbAkDhmPm0Db0RjkCVs6rfQ+mdi9atKVadgEguxNZoqkoOkA8msNYIWrP+RcQl5XKakZE6Z4/KcePjGP3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6047

On Mon, Jul 27, 2026 at 03:47:45PM -0400, Frank Li wrote:
> On Tue, Jul 28, 2026 at 02:03:07AM +0900, Koichiro Den wrote:
> > LL event pairing needs to know whether event registers are shared per
> 
> what's means pairing here?

Sorry that was unclear. By "pairing", I mean recording whether the LL event is
STOPPED or PROGRESS together with the LLP sample taken in the same
interrupt-handler pass.

Best regards,
Koichiro

> 
> Frank
> 
> > channel or per direction. It also needs a provider operation to clear
> > stale LL interrupt status before a channel restart. Add both.
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
> > Changes in v3:
> >   - New prep patch split from the event/restart serialization and
> >     stopped-tail recheck changes. (Sashiko)
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
> > index c31fff095b4f..d497d36f5b28 100644
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
> > index b2d35f0b7b6d..b181603bf2c7 100644
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
