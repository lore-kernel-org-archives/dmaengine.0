Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010023.outbound.protection.outlook.com [52.101.69.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07CF4C10DD;
	Wed, 30 Sep 2026 20:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790799970; cv=fail; b=frHseOp+R/sOJfsa+qUhBMT0gT+gEKl42Q9Nuik8IysruG/zoa2NuPe+QjwMAx/bzLOumFM8ORD+79IzQC/4lE9WC4X7IZyDugVF3VllvrzrPqjEDg6sqEYmaVd1j4etGSmkYX3bnQNM0F/ae2f20DzKgQYx83EvLCs+TAHYKFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790799970; c=relaxed/simple;
	bh=m79ABT5jUG7nSJb3kN6/T1m60lAGtKg3miDaS3c2t1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YkSnfUB4kg+jic4DGRzXUtTIHENaeEpSjKLg3O4J2RfpzFD3mS6pgslKD3CTsb3PKCtxpU0QEwH0L/Ms66qDZeNn7gTsxFowD3raCif80z70hXZEYcCbTj/QsmnRJS4PwDydZegYZ1k0wCfNn/1X9Fv/kzGEhJVzrRN2KN2ky18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FCCGXqjk; arc=fail smtp.client-ip=52.101.69.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FCCGXqjk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNNNcGjARaIT2zxATsbM8NlslzfH6yMgFk0XfK4/8FSo8bhgmJ+A4s5/caUKnkhOZMfVLdnXpAr0ASZJMkZaVZv3n5B1/q/0rJt/QdFQvg0IJNoNkhNrM3yuXsGMUGrJUR71n3qKzd1nVbMYRezFk5CnOuz8Zx3XPy6pln7LVNFm3nceBMv4rUH6M/OHSICrFQICrQjuDo3IyxRUe494FcP+s0LQScSxchAEUb3cdUGB4XM6hO6Q1RoCt6gZFKVZHtP1xbqPNvmqIS93QTWbubyev4FRx7PPWDWa49cPKZmKCgCCIklWCkm0sd392Ehgx0T/HXMIAc+nRu/ENQBt0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIG+lWRLB4ukMyBWDT5xL6r4FB/kroMtbcehg6MLNww=;
 b=mODPtvCgi7SsKOMM1/JmYXcUdDdvp4FRh95PNohcGO0C5wOmTsYlGVsTYgc/mkG7Zt8ByrzAa8mcchOxfBcy9AEzToLoyRLvf7XdlJH+qp2fU7pDjJ1KnR/QcDJ0FaErYe4PJ/PWSiIX8VbHSFL4iQtsGe0SxeAl+2bPjR1D0mK5Q9cdyUkU4kXcjjImjSbeyQ/QZccRNuQrZC3XkNt+pOm/KdhkBWNUQHt5NGjYcKRNUycAioIeOapWqHug9HqNuMnaQSRwyamScVwKYC4zPM97z0yBycXN3R6L7ooj55S+UL4+AYNYY0x2ArE/Ci+zcyT/o/GnwT9l8ASgr8D6RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIG+lWRLB4ukMyBWDT5xL6r4FB/kroMtbcehg6MLNww=;
 b=FCCGXqjkMTWw6zcc4lw5rLWCCU7Lv1dM7hTgb+IeSMP6wgepzoWHqE0+fRBiBK+KtpCNLlW80iOwTUKKhKGhpH6FOaBRximN/nQnU7Wyx1nvH/esuDvg1oxhMBWvYES+dezeytO3D5zfxvjE+puZZSX0bQ5xpzOMMD22Y4QlqPndW6fMUCM/8WmsPDZnV5HqHpJwexGwJwBuOerjgKz6omGx3wwO4Oq6Q1ck9UG+RgH6Z8pHu1Qo6WPQvHUcokacMD1MMb+l6tcAdA6O7l2NGPfgdzsH+wrQO8zeO05hOnJgvgbw8VRjXgwCbPEMMSJCVVXkB9IK3P8msUCBecSpYQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by ZR6PR04MB587880.eurprd04.prod.outlook.com (2603:10a6:910:e5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 20:26:06 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 20:26:05 +0000
Date: Wed, 30 Sep 2026 16:25:58 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Devendra K Verma <devverma@amd.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dmaengine: dw-edma: Configure remote interrupt
 routing
Message-ID: <ar1wViPPc6LYi5po@lizhi-Precision-Tower-5810>
References: <20260912174023.1227397-1-den@valinux.co.jp>
 <20260912174023.1227397-3-den@valinux.co.jp>
 <aqgRSbIFDuMOKkzF@SMW015318>
 <muwficrvayllrqlgfrgn5rqjvwo4dxghriqzhrh6fqeu3gjrst@rla66stbftvg>
 <l4ujqwjxdolhfkqvgyxgoh4yf6c73ddpew2flyeqszpshwbox3@y7vuhyurodo7>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <l4ujqwjxdolhfkqvgyxgoh4yf6c73ddpew2flyeqszpshwbox3@y7vuhyurodo7>
X-ClientProxiedBy: CY5PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:930:11::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|ZR6PR04MB587880:EE_
X-MS-Office365-Filtering-Correlation-Id: f89588b1-ed6c-43f1-c5d6-08df1f310dc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|376014|366016|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	o3UjkFGKz3+Ik1MMUaOIlCdsQEh8s2ET2nzf48rNCVmfzm3Wh/54fDL40Zlp1HXavd5krNlNPGaqbFLC3x2qynDB5jYlc/zfzypD4+3ua62srX7agxpbb5MDT58isrmbCrBG2sNNeicBPyPdw9bP+lWXg92FVYF+OKwSKC1md8X0rmXmL9+DoSAMspbrLVmjB/LJ/5RnHNG0Vo1oI8I7ZMCfXjoWHXBe5svkyuN5ElEGD0Gf3i9KpbH4ksEg1vye8Zge6mue6cufUPzlq6JOZiibi/jHhpA/azF08zr7klD6SygnuQkIej/pDxbUmidvYAgYNqPSgj2omyJM7AfAn2zQKjeh2K8WaI0IMZh6fdDqj2f/AW2ljWZzdYDP1/w2E9oxXzNZlaae50PxsdGg0gqaOdqUXL064EQsrVXEQPGrF6flD8zrhbnAsrUjicBZi7TcO146wA6jBjjm9aUhW8n7otIEERHENjgcthWPmoNAKKUt8H1VgV/WzKntnEsbA1xgj46I2ekm3+OOpXHABDnv5lj0aH9rUpGYsmBA/U+1skChclkgUfhMPoDpmzue7Czwu/NjsaTUMikZNwM2XljNwHkbMCh0RGlNhvM3T/7DHMMYMndklvYF4nb9ou6a
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(376014)(366016)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sR1Rn9P2Rf7LA/pXpi2qNIum6y2NZXwquiFqgLoZrdyIKyI7AaZqmzNAZuyf?=
 =?us-ascii?Q?/+bImO2E76SwXKFZnP/JCQwyMBXhDMHHyWLsyAFdyZRSWnjRQrYnCqqiw5a6?=
 =?us-ascii?Q?H4siHAP+ZMe0+rYYr3TkNrBgKFkMNwNSvCWbszhoFErCU3XL40J6cbgxK4f/?=
 =?us-ascii?Q?UZnkwXTbG+StNB/yH7q+E5fmrKj7PJGZ2YsCO6l1sFryyZxyqgI2/GV7Nqa4?=
 =?us-ascii?Q?FcCMkWg4BOrsmxaYMY73PSHMdOec0OCu6F7nqN5O3lt/0n6bregE0GJF3c9V?=
 =?us-ascii?Q?KccdyiNsd8RfP1WVFXOSGtdQUr1T13Lj6/FwBBST5Fa0UXjnndyy4kYg6Moy?=
 =?us-ascii?Q?9xqnul8GQtqEnmNMyPQWiLgqwwqb1f75wSsjxnLF99jVviabeWPYnSWUunvF?=
 =?us-ascii?Q?H1sNwZtVTB6mR+Mej6daRdKGO2617jtC4Jo6wyphOi12OXQwchmbB4VdUtZF?=
 =?us-ascii?Q?3lSLwWrH2zUHWJjp+6qE42+WmO25vSMhpmbAuolctnqmbo+MnBYtuPdH+e9/?=
 =?us-ascii?Q?5q5F4Z9Vn3caB52AUsjRb/S8KtzBRSbSt0Nihh3rlavlbfwkR4jN413fTYyV?=
 =?us-ascii?Q?OLcotMQebAFI9Nf5gvPKT3sn+hxN9uUFYIgnqu8fIPC2KC2jwWdvoogLNGrB?=
 =?us-ascii?Q?I8DnbY+Pjt99EhttO8ho4iknczuQZriEOHDyTSE/g21Zy0LcUxnuFWMot6wY?=
 =?us-ascii?Q?4PAHrWNcOVo8tXNOM3gUiSprkW//JhNy0uvkMOgULngNsWry6oCdQ4FP/sSV?=
 =?us-ascii?Q?H5AOVTpDjkbQKcsiOUuU+2Sr21nJEgFmxecwhu+sidGZdtB8ENK8t4S/Q2ta?=
 =?us-ascii?Q?4Okr+suv9/37B18s3E+kB+v7uhP0m0o0eh6XmftbPyg0u6suHdX/MPcMCyJJ?=
 =?us-ascii?Q?X0F8lYZg/7xH+VJfiXVFOsX3eoFyqAdRRVRG70uLPX+VU4fsGGo6q+pOeLo7?=
 =?us-ascii?Q?E/MWRDihtmw2efWftxsMIYg1ZlYD0XhCG5YDdTRd/JlH5Zj9AM5c/iUYsMyT?=
 =?us-ascii?Q?hHOaGADZnfdvCrxatqB8QZ2q+KRTSJCxjqWRWc/3q87igy2VDADGqJQajc7w?=
 =?us-ascii?Q?3Uk//So5SB1r/uuJBmyKFHVzxl5KfP3fUM/BODb1JMyfWWrvRlo7FOOdwUM6?=
 =?us-ascii?Q?d+enhFIFQPoqs3Or4WkfsP6QcxfWMtC+DYP1E/6qfj1lOEfQYUgjKBawvLvv?=
 =?us-ascii?Q?bopw9qjVUYIPhlQNLgK+FsXyIJLXPnss2v/U7egrYrnquvs7b+CgCeslieaw?=
 =?us-ascii?Q?TdnS99Shlld9xZ01UFmX7YM1HXrvTv1krdiVySZqSjl6BsvqpWFyh4wgcF+H?=
 =?us-ascii?Q?eDxGgePwViOBP+0ncWYEvbseDWT9qHaRMFbyJgBw3Kac7UNvkqwE6ofdLlRY?=
 =?us-ascii?Q?A+aqREd+bzVrxA7bfR1lyAyzJ0hwteOkG1Ghc38Br0G8EJ85bRURC4ZUZEIe?=
 =?us-ascii?Q?wvQLQCQgxug1qm6BKxoYLUJIdDNiFQ+a6m3vxQU+NvAfnhaF0GjdxKZzZAaw?=
 =?us-ascii?Q?9Hekzp60JSzq8qmjsq2A0c8cVgYriedyok5j+6RZKe/wtB4+bwLobdjYAg0x?=
 =?us-ascii?Q?QEWoWbq0e+22RgUZvGjt9TuaiV2aopMOHPlutmk/7aRG7d7uSOMS1r9yr2Ns?=
 =?us-ascii?Q?+K7UWz8hB+osIRYfIvTB9jL3mTswMZk5sxWIKpTVUFsfUsi2649ZCp+pO4vS?=
 =?us-ascii?Q?b82Jh7sBrMQ149ItjlHX+0EjFr20K3EaNWFuhxK4hHciLJPhNt4cBtqea0zv?=
 =?us-ascii?Q?IjYZWPcUcglG5UdrCsdc+5CP7UWz/Z4eWp3+r5GwmlAnlDVY1ywh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f89588b1-ed6c-43f1-c5d6-08df1f310dc6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 20:26:05.7959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzE6G5UWK+RQ9eIxqgfvBaWv2RX0vMhgY/dwroV5TiU7y0zaVBrcIJqEKHl50xKrSn7Ddgray5ynapMVI2wY0ZUf6Qehvw/3QVtd7yoUMFNVrRU2jMZrad7MxFaIvAze
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB587880

On Tue, Sep 15, 2026 at 12:53:33AM +0900, Koichiro Den wrote:
> On Tue, Sep 15, 2026 at 12:49:01AM +0900, Koichiro Den wrote:
> > On Mon, Sep 14, 2026 at 10:22:49AM -0500, Frank Li wrote:
> > > On Sun, Sep 13, 2026 at 02:40:22AM +0900, Koichiro Den wrote:
> > > > An endpoint function can reserve an endpoint-local channel while the RC
> > > > programs it through an exposed register window. Such a channel must route
> > > > interrupts remotely and ignore them on the endpoint.
> > > >
> > > > Use dma_slave_config to set per-channel interrupt routing on idle channels
> > > > of a local eDMA or HDMA instance. Releasing a remote-routed channel
> > > > quiesces the hardware and drains its local IRQ before restoring default
> > > > routing.
> > > >
> > > > The eDMA quiesce may stop a complete direction. The caller must own every
> > > > channel in that direction and stop remote programming first.
> > > >
> > > > Suggested-by: Frank Li <Frank.Li@nxp.com>
> > > > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > > > ---
> > > > Changes in v4:
> > > >   - Drop unnecessary READ_ONCE()/WRITE_ONCE() for irq_mode. (Frank)
> > > >   - Allow repeated dmaengine_slave_config() calls on idle channels
> > > >     when the IRQ mode is unchanged. (Sashiko)
> > > >   - Simplify IRQ mode handling, assuming the channel has no pending
> > > >     interrupt status when its mode changes. Treat racing reads by
> > > >     shared IRQ handlers and same-value stores on release as harmless.
> > > >   - Support native HDMA.
> > > >
> > > >  drivers/dma/dw-edma/dw-edma-core.c | 136 ++++++++++++++++++++++-------
> > > >  include/linux/dma/edma.h           |  21 +++++
> > > >  2 files changed, 125 insertions(+), 32 deletions(-)
> > > >
> > > > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > > > index a678c70a78fe..c978da30bac5 100644
> > > > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > > > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > > > @@ -177,48 +177,76 @@ dw_edma_get_default_irq_mode(struct dw_edma_chan *chan)
> > > >  						  DW_EDMA_CH_IRQ_REMOTE;
> > > >  }
> > > >
> > > > +static int dw_edma_device_config_irq_mode(struct dw_edma_chan *chan,
> > > > +					  enum dw_edma_ch_irq_mode mode)
> > > > +{
> > > > +	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) ||
> > > > +	    (mode != DW_EDMA_CH_IRQ_LOCAL && mode != DW_EDMA_CH_IRQ_REMOTE))
> > > > +		return -EINVAL;
> > > > +
> > > > +	guard(spinlock_irqsave)(&chan->vc.lock);
> > > > +
> > > > +	if (chan->status != EDMA_ST_IDLE || chan->request != EDMA_REQ_NONE)
> > > > +		return -EBUSY;
> > > > +
> > > > +	/* IRQ routing cannot change after the initial configuration. */
> > > > +	if (chan->irq_mode == mode)
> > > > +		return 0;
> > > > +
> > > > +	if (chan->configured)
> > > > +		return -EBUSY;
> > > > +
> > > > +	chan->irq_mode = mode;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > >  static int dw_edma_device_config(struct dma_chan *dchan,
> > > >  				 struct dma_slave_config *config)
> > > >  {
> > > > +	const struct dw_edma_chan_config *dw_config = config->peripheral_config;
> > > >  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> > > > -	bool cfg_non_ll;
> > > > -	int non_ll = 0;
> > > > -
> > > > -	chan->non_ll = false;
> > > > -	if (chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE) {
> > > > -		if (config->peripheral_config &&
> > > > -		    config->peripheral_size != sizeof(int)) {
> > > > -			dev_err(dchan->device->dev,
> > > > -				"config param peripheral size mismatch\n");
> > > > +	bool non_ll = false;
> > > > +	u32 flags = 0;
> > > > +	int ret;
> > > > +
> > > > +	if (dw_config) {
> > > > +		if (config->peripheral_size != sizeof(*dw_config) ||
> > > > +		    dw_config->flags & ~(DW_EDMA_CH_CONFIG_NON_LL |
> > > > +					 DW_EDMA_CH_CONFIG_IRQ_MODE))
> > > >  			return -EINVAL;
> > > > -		}
> > > > +		flags = dw_config->flags;
> > > > +	}
> > > >
> > > > -		/*
> > > > -		 * When there is no valid LLP base address available then the
> > > > -		 * default DMA ops will use the non-LL mode.
> > > > -		 *
> > > > -		 * Cases where LL mode is enabled and client wants to use the
> > > > -		 * non-LL mode then also client can do so via providing the
> > > > -		 * peripheral_config param.
> > > > -		 */
> > > > -		cfg_non_ll = chan->dw->chip->cfg_non_ll;
> > > > -		if (config->peripheral_config) {
> > > > -			non_ll = *(int *)config->peripheral_config;
> > > > +	/*
> > > > +	 * When there is no valid LLP base address available then the
> > > > +	 * default DMA ops will use the non-LL mode.
> > > > +	 *
> > > > +	 * When LL mode is the default, clients can request non-LL mode
> > > > +	 * through DW_EDMA_CH_CONFIG_NON_LL.
> > > > +	 */
> > > > +	non_ll = chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE &&
> > > > +		 chan->dw->chip->cfg_non_ll;
> > > >
> > > > -			if (cfg_non_ll && !non_ll) {
> > > > -				dev_err(dchan->device->dev, "invalid configuration\n");
> > > > -				return -EINVAL;
> > > > -			}
> > > > +	if (flags & DW_EDMA_CH_CONFIG_NON_LL) {
> > > > +		if (chan->dw->chip->mf != EDMA_MF_HDMA_NATIVE)
> > > > +			return -EINVAL;
> > > > +
> > > > +		if (chan->dw->chip->cfg_non_ll && !dw_config->non_ll) {
> > > > +			dev_err(dchan->device->dev, "invalid configuration\n");
> > > > +			return -EINVAL;
> > > >  		}
> > > >
> > > > -		if (cfg_non_ll || non_ll)
> > > > -			chan->non_ll = true;
> > > > -	} else if (config->peripheral_config) {
> > > > -		dev_err(dchan->device->dev,
> > > > -			"peripheral config param applicable only for HDMA\n");
> > > > -		return -EINVAL;
> > > > +		non_ll = dw_config->non_ll;
> > > > +	}
> > > > +
> > > > +	if (flags & DW_EDMA_CH_CONFIG_IRQ_MODE) {
> > > > +		ret = dw_edma_device_config_irq_mode(chan, dw_config->irq_mode);
> > > > +		if (ret)
> > > > +			return ret;
> > > >  	}
> > > >
> > > > +	chan->non_ll = non_ll;
> > > >  	memcpy(&chan->config, config, sizeof(*config));
> > > >  	chan->configured = true;
> > > >
> > > > @@ -890,11 +918,53 @@ static void dw_edma_wait_termination(struct dma_chan *dchan)
> > > >  		 "timeout waiting for channel termination\n");
> > > >  }
> > > >
> > > > +static void dw_edma_synchronize_chan_irq(struct dw_edma_chan *chan)
> > > > +{
> > > > +	struct dw_edma *dw = chan->dw;
> > > > +	unsigned long *mask;
> > > > +	int i;
> > > > +
> > > > +	/*
> > > > +	 * A shared handler may retain this channel's status across quiesce.
> > > > +	 * With nr_irqs == 1, it scans both directions even if routing and
> > > > +	 * delegation are direction-wide. Drain it before allowing a routing change.
> > > > +	 */
> > > > +	for (i = 0; i < dw->nr_irqs; i++) {
> > > > +		mask = chan->dir == EDMA_DIR_WRITE ? dw->irq[i].wr_mask :
> > > > +						     dw->irq[i].rd_mask;
> > > > +		if (!test_bit(chan->id, mask))
> > > > +			continue;
> > > > +
> > > > +		synchronize_irq(dw->chip->ops->irq_vector(dw->chip->dev, i));
> > > > +		return;
> > > > +	}
> > > > +}
> > > > +
> > > >  static void dw_edma_device_synchronize(struct dma_chan *dchan)
> > > >  {
> > > >  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> > > > +	bool remote;
> > > > +
> > > > +	/*
> > > > +	 * irq_mode is fixed after initial configuration. The free path
> > > > +	 * restores it only after synchronization.
> > > > +	 */
> > > > +	remote = chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL &&
> > > > +		 chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE;
> > > > +
> > > > +	/*
> > > > +	 * Peer-driven transfers bypass local descriptor tracking, so quiesce
> > > > +	 * the hardware explicitly.
> > > > +	 */
> > > > +	if (remote && dw_edma_core_ch_quiesce(chan))
> > > > +		dev_warn(chan->dw->chip->dev,
> > > > +			 "failed to quiesce remote-routed %s channel %u\n",
> > > > +			 chan->dir == EDMA_DIR_WRITE ? "write" : "read",
> > > > +			 chan->id);
> > > >
> > > >  	dw_edma_wait_termination(dchan);
> > > > +	if (remote)
> > > > +		dw_edma_synchronize_chan_irq(chan);
> > > >  	cancel_work_sync(&chan->irq_work);
> > > >  	atomic_set(&chan->irq_pending, 0);
> > > >  	vchan_synchronize(&chan->vc);
> > > > @@ -907,8 +977,10 @@ static void dw_edma_free_chan_resources(struct dma_chan *dchan)
> > > >  	dw_edma_device_terminate_all(dchan);
> > > >  	dw_edma_device_synchronize(dchan);
> > > >
> > > > -	scoped_guard(spinlock_irqsave, &chan->vc.lock)
> > > > +	scoped_guard(spinlock_irqsave, &chan->vc.lock) {
> > > >  		chan->configured = false;
> > > > +		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
> > > > +	}
> > > >
> > > >  	vchan_free_chan_resources(&chan->vc);
> > > >  }
> > > > diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
> > > > index 3c8e2ef9dee0..43831fa57357 100644
> > > > --- a/include/linux/dma/edma.h
> > > > +++ b/include/linux/dma/edma.h
> > > > @@ -101,6 +101,27 @@ enum dw_edma_ch_irq_mode {
> > > >  	DW_EDMA_CH_IRQ_REMOTE,
> > > >  };
> > > >
> > > > +#define DW_EDMA_CH_CONFIG_NON_LL	BIT(0)
> > > > +#define DW_EDMA_CH_CONFIG_IRQ_MODE	BIT(1)
> > > > +
> > > > +/**
> > > > + * struct dw_edma_chan_config - dw-edma channel configuration
> > > > + * @flags: fields selected by DW_EDMA_CH_CONFIG_*
> > > > + * @non_ll: use HDMA non-linked-list mode
> > > > + * @irq_mode: interrupt routing mode
> > > > + *
> > > > + * Pass this structure through dma_slave_config.peripheral_config. Before
> > > > + * synchronizing a remote-routed channel, the client must stop remote
> > > > + * programming and own every channel affected by the hardware quiesce: the
> > > > + * entire direction for eDMA-compatible layouts, or the individual channel for
> > > > + * native HDMA.
> > > > + */
> > > > +struct dw_edma_chan_config {
> > > > +	u32 flags;
> > > > +	bool non_ll;
> > > > +	enum dw_edma_ch_irq_mode irq_mode;
> > > > +};
> > > > +
> > >
> > > Do you have any user in kernel tree use non_ll?
> >
> > I don't think so.
> >
> > Devendra, I would appreciate your input here, if you have any thoughts on
> > Frank's question, or the new dw_edma_chan_config. I haven't found any in-tree
> > user of the non-LL peripheral_config interface introduced here:
> > https://lore.kernel.org/r/20260318070403.1634706-3-devendra.verma@amd.com/
> > so I guess any users would be out-of-tree at least as of now, unless I'm missing
> > something.
>
> Ouch, I meant to put Devendra in To, not Cc. Sorry for the noise.

Consider not in-tree non-ll consumer. It should be fine to change API.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Best regards,
> Koichiro
>
> >
> > Best regards,
> > Koichiro
> >
> > >
> > > Frank
> > >
> > > >  /**
> > > >   * struct dw_edma_chip - representation of DesignWare eDMA controller hardware
> > > >   * @dev:		 struct device of the eDMA controller
> > > > --
> > > > 2.51.0
> > > >
