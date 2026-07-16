Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021136.outbound.protection.outlook.com [40.107.74.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D76D3BAD89;
	Thu, 16 Jul 2026 15:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784217148; cv=fail; b=BTXz/8rs2R1X5WbtMVW4uHzP0h47PLEgzh2tgeXJVjAZcCNKyhnxRxtG5GNXclbBAA/pgWWOgx4LOIHFUt9lqprw70NqvnretoSZNZYuuR8jDEDg4QPmFFS54Z1ReDab+NdlbdEmxpVByHbU8Yy4cjPGEbaKKGRz4W3nQB4tLUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784217148; c=relaxed/simple;
	bh=FIkWTsaziaX8sTkzAHPre9YpYpFr8RtmDU/7QIo6Drc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tergzcrFz55ePL5o+izPSkGd+uZUu6Xe7YQ8EDnid0J0Um5sIiNVXcbIGtM9f6jwC1v4gUOBWSCfO6AVL9VfmcURgeHbAVjQTfzsWJPf0yg/CFiCHgiLwiV6qlspGInEjxu+qZGNOhEPyVt/7+pHJnMmwyywwLufHhBCIbXphTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=YDKs+g7z; arc=fail smtp.client-ip=40.107.74.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="YDKs+g7z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHfmpIFEO3uwrBTe80MwK/of+pl641tPEozTuIadja9dFMxw2XD1f6T4tAdE+ZskWoSl/ea0rIe/2L7KFEuTbKQdT/qEdo4kvCX32OIGtoX30GGz5PQq5R6DRpbXqgVfNsv6jJfoLnfvLezfFT+EwuHrgC3NfqFI2zR3Mzf1Q0BlmEL5MzN9brO+oryrqVeItYxffw3xyQVm9tUPWUN30g6Orh4XUdjuXaofycU16C7DeT5jQt8HbCrO0vt4w4UgMJ6DoTRcC9G+BJkpao6DdRuYy3r3JaPIJTkr9X1urQq3iiklvAxMHbxhVjJDk0z30l35Y9RyFzdwn6NapMxXuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaYyoGyaCcjb5U5XRif/lloD0efuxWxKWapiJv2idmE=;
 b=EsFWU4LlYpESlKZDZ0MgehjYoSfmoE6LPB/KWRHfHUDxpQe1r8e5knfpi4iCpyvoR75om8XGwnOUlIGcC+TFiWESEx9O0PrUVug+m8Y2yFjrJtvmImIp4JmAzmpJKpTkGWUPFfry0K1DwHyzHwUBqYRZogyyzeewDs7t/Jmxs8vDG14v9mwymJ4xW1Q98S5lihXq076ZWQpgTpOSqKFl+ppQsMieHqeFuoV92KVieGfDi/Pry8lTxhcoUiBN2yq82FEfVFuz3T74CkFTkPEIPztVIPE3T8jTG+q03rMA4AoTvc4+PIwYerluObZkXv4Aivgf5SYavkL8xOcQaM6Epg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xaYyoGyaCcjb5U5XRif/lloD0efuxWxKWapiJv2idmE=;
 b=YDKs+g7zPCFESOdJWReBXdew+HrBD53jzxaLwU0SCDFyvj0ss/8zLY4Cto3e5O3WpQy4cjZBTPNnq9E+C0gos3fM8HYqVQzm7fDEC/fNlxa7Wb3Qm/V3lRJT2ICKTkiU8uuHJuE6nV1u0soLdRmzb87BHEwgtwAtEWAu7pAh4Js=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYTP286MB3553.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:39c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 15:52:22 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 15:52:22 +0000
Date: Fri, 17 Jul 2026 00:52:20 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/14] dmaengine: dw-edma: Add partial channel
 ownership mode
Message-ID: <tvm2plr7vl4btq7oznmsb2t6llg2racec4sh344ixpmdo7pwbp@cir727yeaqu4>
References: <20260710081518.2394357-1-den@valinux.co.jp>
 <20260710081518.2394357-6-den@valinux.co.jp>
 <alaODwnZQ7YDpUx4@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alaODwnZQ7YDpUx4@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: TY4P301CA0117.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::8) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYTP286MB3553:EE_
X-MS-Office365-Filtering-Correlation-Id: 1393cc6d-aac9-449f-2d8b-08dee3523938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|23010399003|1800799024|366016|6133799003|3023799007|22082099003|18002099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	xt+AGSeOCghyQ+JWWoqV3O3f39SxhSSvvDncfTS/0uC7C+xxIV4CaLDfurlxd+FUU8lnm5VOYp/t6/+IKL+vM36a8Ljtv7Z1WpcgsvuHFuaRddu7zJRuhzC/6oTGcHVEztIVJu8a1kWwlQirj2OO98l5wIGNsMSlGkIlavqzKgwij+V4DkGALD/MMVbGE3qKgjGQ61PGzZwlkedrCXbz4jWKAWQ07DpBL9XKD9apCC7Hdi/BZaNyMMDkZzdj6UGCf3nUBkj3+9aSnvU4BebDh6rEa3SoCeUfV21PM9PMzl12ZE9kh4BTqe5uIk+3QPN5ezi3JPe9zWeoAkZ2osPkyooRbudMOTfsboSb5KqBTwjju4bxLM6Q5tNsf+tRVgrI+5Vub6B3JXxMIdk4XOt9iZI1l2PKgH2z3M5FU0jiql0jQwRL5xyunEZL7gkwOOnyhv9E2iw5XdVc6voqsttxuqF5ehvzF4gOVrqFhhV/ZzJaDhM8C36ZYkFLrtOgoaxqiQMNhhfLJ70vk4vq02p54G1AZAHhPni8gn0KSkVNE9zeaXBn8yQJqQzhISBQldavvNszbi4YhNePB5XaUbC/qfopHriI6CDsU2e8HfTvBqeHVK3oHxF/lkoMzTWxOWm/QWLR93CSw6pXUiQ4c/Yo+Ecd5i3NSyKPg59cTLeD3C8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(23010399003)(1800799024)(366016)(6133799003)(3023799007)(22082099003)(18002099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xtXwl9b+2DmFUkFJOOGCFDgcWwhpoBmypB8xQ/xO3QhAhzn5ONMV5yYyZCaA?=
 =?us-ascii?Q?XRf9PyZ98dJQRB1PdS4a86xMWDhzoDzAxI8PIweqyri9IFaLT41kFy5oG0IF?=
 =?us-ascii?Q?CtXEmexpnUpUewHcvAY2f4p5c6hCZYxRTRNCAAQIxuACCR5DTLCt4qe2NHMJ?=
 =?us-ascii?Q?R1+HtPJQVA3Jgv5Swh04+SyuTCOSmvOSQ/KqHRlgRjQXeZXw7vRH00owJDdd?=
 =?us-ascii?Q?cy+FHku1+Zqset1dGyV8pVaB70c84vnGZpc1YKu5/1lq6hdOh7+WgyAJO0kl?=
 =?us-ascii?Q?jRTR0T8I6AQs+LCE3jlCgPbrfTsGUnKrgCphWOUEnXfTsmnH31YFSD7mZPMe?=
 =?us-ascii?Q?ZxhEzJkOd/6ZCz/2ejELHY5Uigit9YLPIuANs/l9jtzugeRiZmkFThvDvNhj?=
 =?us-ascii?Q?Tv4xnkp5TLlUWZM7z23+cai5hCLpCPLBMcsWJIU9Zg9dxrN/ThVZ2hS8vIp1?=
 =?us-ascii?Q?x9Z98eCiYeud+pWOJ9YtC6wKujTh82rdh0ym2MNOuOG3J76YKW2d+trrvNd7?=
 =?us-ascii?Q?m5F3H2nZpm6XF8fwvSDhJJXWz0lH3rrri5W/5LYG35qGyhYaCMTphF4jxVeo?=
 =?us-ascii?Q?fcD8hyGHOEW9zQYiQvk3a9HywqZ07mgfEmhdrIb5u32lcnufC1NGWqY45sRE?=
 =?us-ascii?Q?fO8nXA1+hL4XZNd9uXHANKEsLqDs1cP6BlIfN46edl3XixghgKis6xoIv+6Z?=
 =?us-ascii?Q?rseZLZxRNZ9I+qW948ThOe9x9vrCDwxudFhoBVjAa263Klfa5/ClNIAigVpf?=
 =?us-ascii?Q?MEF1IJDu3TG15h+RnbxeOVQ70RMF71ywUc0xURLKAqWEIcStkKLfKWjqOEJO?=
 =?us-ascii?Q?+5JSaNy1sorCQD63LBVpnwwNWzw7j7M7w0VMXRAKlQGyZDFLmzd73kdptNO7?=
 =?us-ascii?Q?PZq47b+GCInUSmr4KDTL80xpK+0QbwTzUs+zjYNTO7zR4K6O9/oevFtIA94O?=
 =?us-ascii?Q?5BPMim3cB+84Y729/AoaUb/6wm8GFO0jMlueVX/HMnrRng+lxko1V2PzHnhr?=
 =?us-ascii?Q?cIV/2zPaP3Rxxbl0vwc0QxJc15eIHUY8GaFnveJA7cehWqjWPgglTFaM7w/b?=
 =?us-ascii?Q?UUNV9WfgQDo1aYWjFuHQULevQwUp/Vpmi7LwphOe4s7v1iissho2KblB2vCu?=
 =?us-ascii?Q?lWgT1zHWlarWqPq6t36LBnVHiaRDZR3jYesEW09zjR4wGCq6qfBa46nn0pmU?=
 =?us-ascii?Q?IOEAH1XPjxjma2Cn9eUIIlduZ7wTltZexoohauqvnSz9taw7Im8VWgIcziim?=
 =?us-ascii?Q?egOVs3yYM3ixMj2EDCLupeOD+8R/Xs44MAE1ktmnqXB09Mcl7SnqYqmLwnOI?=
 =?us-ascii?Q?4qmai7zDT3+WARGyfmZDzo9fFl0O9iGE4N5o421FIZByd/towUUUtOIHKMN1?=
 =?us-ascii?Q?iauo0/W0HbUG9bfxxtJzuyrpOLlBrW2TjWQ3nQdyfaTFGzJH/rt2yRVvHwDt?=
 =?us-ascii?Q?uSOa/8K1hhq/NXIpBp8wTzV1WwWQktfWIWjVnpRL5dapy/OdZzYz8404QwtC?=
 =?us-ascii?Q?2KgkKKFBtDQzi/1qRSdDU+KrJrzSLMSiOUTlhucPnzCDv3K7z64SxGYi0m55?=
 =?us-ascii?Q?orWilGFZxRr9jDBXzoexOyRy3z4lQAge1QbFbqySmHCbjsPKw6G73tnStW+d?=
 =?us-ascii?Q?iFnRjV9AkptBYONFDz+QmgBuW2MvLBP7so5PvLCFo2+VcqSRckZVLRLTEKr8?=
 =?us-ascii?Q?hJvdBTuXeYWiNTWAAJzsXNOmgLW3j2V4+ZLIKcqRJkPdwbMk1KlpgHLVMX34?=
 =?us-ascii?Q?2QgU6+0OOSPXQLCGnao3jCJdWhppNWHQTHG/rzjSVtk/gGe3Blwj?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 1393cc6d-aac9-449f-2d8b-08dee3523938
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 15:52:22.0660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jrpp4zVjOiIPReB1uqYQr+M8iiG84/NbUezjJNIGiv5IuUp9aMf8VdJ8doL/qXy6oUDzvT2+JAApmkoKuEGv8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTP286MB3553

On Tue, Jul 14, 2026 at 03:29:19PM -0400, Frank Li wrote:
> On Fri, Jul 10, 2026 at 05:15:09PM +0900, Koichiro Den wrote:
> > A DesignWare eDMA instance may represent only a subset of channels that
> > is also initialized by another OS instance, such as an endpoint-side OS.
> > Add a partial ownership flag for instances that must preserve
> > controller-wide state owned by that peer.
> >
> > In partial ownership mode, dw-edma skips the initial core reset and uses
> > the limited quiesce path in probe() and remove() instead of the full
> > core-off path. The flag also makes the driver validate the ownership
> > granularity required by each register layout before registering
> > channels.
> >
> > Partial instances also skip interrupt-emulation doorbell allocation: the
> > emulated doorbell is a controller-level resource, and a partial owner
> > must not claim it on behalf of the whole block.
> >
> > For EDMA_MF_EDMA_UNROLL and EDMA_MF_HDMA_COMPAT, the driver programs
> > per-direction registers, such as DMA_{WRITE,READ}_INT_MASK_OFF and
> > DMA_{WRITE,READ}_INT_CLEAR_OFF. These register layouts have at most
> > EDMA_MAX_{WR,RD}_CH channels per direction, so the capped hardware
> > channel count still represents the whole direction. A partial instance
> > can therefore expose write or read channels only if it owns every
> > channel in that direction; otherwise two OS instances could update the
> > same direction-wide registers without a shared locking protocol.
> >
> > In contrast, HDMA native uses per-channel registers, so it can be owned
> > at channel granularity.
> >
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> > Changes in v4:
> >   - Fix and revise commit message. (Frank)
> >   - Move partial-ownership validation into dw_edma_check_partial().
> >     (Frank)
> >   - While at it, add a small source comment that explains why local
> >     variables hw_{wr,rd}_ch_cnt are introduced separately.
> >   - Quiesce represented resources during partial probe as well as
> >     remove, draining stale channel state from a previous owner without
> >     resetting controller-wide state.
> >
> >  drivers/dma/dw-edma/dw-edma-core.c | 75 ++++++++++++++++++++++++++----
> >  include/linux/dma/edma.h           |  7 +++
> >  2 files changed, 72 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > index fb17074917df..0d38de4480a0 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > @@ -831,6 +831,9 @@ static int dw_edma_emul_irq_alloc(struct dw_edma *dw)
> >  	chip->db_irq = 0;
> >  	chip->db_offset = ~0;
> >
> > +	if (chip->flags & DW_EDMA_CHIP_PARTIAL)
> > +		return 0;
> > +
> >  	/*
> >  	 * Only meaningful when the core provides the deassert sequence
> >  	 * for interrupt emulation.
> > @@ -1188,10 +1191,33 @@ static int dw_edma_irq_request(struct dw_edma *dw,
> >  	return err;
> >  }
> >
> > +static int dw_edma_check_partial(struct dw_edma_chip *chip,
> > +				 u16 hw_wr_ch_cnt, u16 hw_rd_ch_cnt)
> > +{
> > +	if (!(chip->flags & DW_EDMA_CHIP_PARTIAL))
> > +		return 0;
> > +
> > +	if (chip->mf != EDMA_MF_EDMA_UNROLL &&
> > +	    chip->mf != EDMA_MF_HDMA_COMPAT)
> > +		return 0;
> > +
> > +	/*
> > +	 * Direction-wide registers are shared by all channels in that
> > +	 * direction, so a direction must have a single owner.
> > +	 */
> > +	if ((chip->ll_wr_cnt && chip->ll_wr_cnt != hw_wr_ch_cnt) ||
> > +	    (chip->ll_rd_cnt && chip->ll_rd_cnt != hw_rd_ch_cnt))
> > +		return -EOPNOTSUPP;
> > +
> > +	return 0;
> > +}
> > +
> >  int dw_edma_probe(struct dw_edma_chip *chip)
> >  {
> >  	struct device *dev;
> >  	struct dw_edma *dw;
> > +	u16 hw_wr_ch_cnt;
> > +	u16 hw_rd_ch_cnt;
> >  	u32 wr_alloc = 0;
> >  	u32 rd_alloc = 0;
> >  	int i, err;
> > @@ -1203,6 +1229,17 @@ int dw_edma_probe(struct dw_edma_chip *chip)
> >  	if (!dev || !chip->ops)
> >  		return -EINVAL;
> >
> > +	if (chip->flags & DW_EDMA_CHIP_PARTIAL) {
> > +		switch (chip->mf) {
> > +		case EDMA_MF_EDMA_UNROLL:
> > +		case EDMA_MF_HDMA_COMPAT:
> > +		case EDMA_MF_HDMA_NATIVE:
> > +			break;
> > +		default:
> > +			return -EOPNOTSUPP;
> > +		}
> > +	}
> > +
> >  	dw = devm_kzalloc(dev, sizeof(*dw), GFP_KERNEL);
> >  	if (!dw)
> >  		return -ENOMEM;
> > @@ -1216,13 +1253,21 @@ int dw_edma_probe(struct dw_edma_chip *chip)
> >
> >  	raw_spin_lock_init(&dw->lock);
> >
> > -	dw->wr_ch_cnt = min_t(u16, chip->ll_wr_cnt,
> > -			      dw_edma_core_ch_count(dw, EDMA_DIR_WRITE));
> > -	dw->wr_ch_cnt = min_t(u16, dw->wr_ch_cnt, EDMA_MAX_WR_CH);
> > +	/*
> > +	 * chip->ll_*_cnt describes the channels exposed by this instance. Keep
> > +	 * the usable hardware counts separate for partial ownership checks.
> > +	 */
> > +	hw_wr_ch_cnt = min_t(u16, dw_edma_core_ch_count(dw, EDMA_DIR_WRITE),
> > +			     EDMA_MAX_WR_CH);
> > +	hw_rd_ch_cnt = min_t(u16, dw_edma_core_ch_count(dw, EDMA_DIR_READ),
> > +			     EDMA_MAX_RD_CH);
> 
> If need respin patch,  now it is safe to use min()

Thanks for pointing this out. I'll use min() in v5.

I need to respin part 1 anyway, mainly because v4 still mishandles HDMA compat
mode: ENGINE_EN is not implemented there, and CHi_PWR_EN should be used instead.
I'll send v5.

Best regards,
Koichiro

> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> > +
> > +	err = dw_edma_check_partial(chip, hw_wr_ch_cnt, hw_rd_ch_cnt);
> > +	if (err)
> > +		return err;
> >
> > -	dw->rd_ch_cnt = min_t(u16, chip->ll_rd_cnt,
> > -			      dw_edma_core_ch_count(dw, EDMA_DIR_READ));
> > -	dw->rd_ch_cnt = min_t(u16, dw->rd_ch_cnt, EDMA_MAX_RD_CH);
> > +	dw->wr_ch_cnt = min_t(u16, chip->ll_wr_cnt, hw_wr_ch_cnt);
> > +	dw->rd_ch_cnt = min_t(u16, chip->ll_rd_cnt, hw_rd_ch_cnt);
> >
> >  	if (!dw->wr_ch_cnt && !dw->rd_ch_cnt)
> >  		return -EINVAL;
> > @@ -1239,8 +1284,16 @@ int dw_edma_probe(struct dw_edma_chip *chip)
> >  	snprintf(dw->name, sizeof(dw->name), "dw-edma-core:%s",
> >  		 dev_name(chip->dev));
> >
> > -	/* Disable eDMA, only to establish the ideal initial conditions */
> > -	dw_edma_core_off(dw);
> > +	if (chip->flags & DW_EDMA_CHIP_PARTIAL) {
> > +		/*
> > +		 * Do not reset the shared controller, but drain stale state
> > +		 * from resources represented by this instance.
> > +		 */
> > +		dw_edma_core_quiesce(dw);
> > +	} else {
> > +		/* Disable eDMA only when this instance owns the controller. */
> > +		dw_edma_core_off(dw);
> > +	}
> >
> >  	/*
> >  	 * Deferred IRQ works are queued from the hard IRQ handlers, so the
> > @@ -1296,8 +1349,10 @@ int dw_edma_remove(struct dw_edma_chip *chip)
> >  	if (!dw)
> >  		return -ENODEV;
> >
> > -	/* Disable eDMA */
> > -	dw_edma_core_off(dw);
> > +	if (chip->flags & DW_EDMA_CHIP_PARTIAL)
> > +		dw_edma_core_quiesce(dw);
> > +	else
> > +		dw_edma_core_off(dw);
> >
> >  	/* Free irqs */
> >  	for (i = (dw->nr_irqs - 1); i >= 0; i--)
> > diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
> > index 1007122d4123..3c33d12d1cdb 100644
> > --- a/include/linux/dma/edma.h
> > +++ b/include/linux/dma/edma.h
> > @@ -55,9 +55,16 @@ enum dw_edma_map_format {
> >  /**
> >   * enum dw_edma_chip_flags - Flags specific to an eDMA chip
> >   * @DW_EDMA_CHIP_LOCAL:		eDMA is used locally by an endpoint
> > + * @DW_EDMA_CHIP_PARTIAL:	Only channels described by this instance are
> > + *				owned by this driver. Controller-wide state
> > + *				must be preserved, and layouts with shared
> > + *				direction-wide registers must only be shared at
> > + *				direction granularity. Layouts with per-channel
> > + *				registers may be shared at channel granularity.
> >   */
> >  enum dw_edma_chip_flags {
> >  	DW_EDMA_CHIP_LOCAL	= BIT(0),
> > +	DW_EDMA_CHIP_PARTIAL	= BIT(1),
> >  };
> >
> >  /**
> > --
> > 2.51.0
> >
