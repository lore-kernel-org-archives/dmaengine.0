Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011001.outbound.protection.outlook.com [40.107.130.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3828246D566
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 18:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658647; cv=fail; b=bNjoHmvm4Y5FSUi0H/TwzjYJsibKD2ckfvEDbEsaDHXtMRc8HWE6bCaRa8GVHqrWaRfwGp0HAU2CKnK+UP+VK95Z2C5OrMvd3rkk88+0ytLk7jDWUahNB2G8KZR7VfQktU7Lk3hIfexBmzI2TqpuRLTw8JipYbrzu5Yg2X42VdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658647; c=relaxed/simple;
	bh=GvK9TRvmVsRfVzT+d3J6HIVHTTrDttrbDm7hccvRBFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f5HiQJ5JpbG4R8pLPmdxofwLqvV9b3zoUa1Wr6eSLqfDOHHIqlNLI0YgGUTMDOOyzdq/v9XMBuOEmnxUj0GZSPFjrExTrh3buU2hNMR6gzs8HoAQjvJUZrdfyEabtMlPnEA5o6+Bl8hVTttoNfAXs5xTzjC1053gc6piVWpQBns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XfVSfyVN reason="signature verification failed"; arc=fail smtp.client-ip=40.107.130.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XfVSfyVN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZ34MqSjRZTQ9Y1HGuQOThRK9x6kFzX4OUqRBmzaV1baHElylyRme71Hp9TwLEv1naOZAqbEtpb8KliL0gClmDXeQmHMRfgACoOJPKYc4DMU3QS29WrWMH3/9dOKDD5OAKBynME7Bz/ty+XsdWJtXlmhmWVDy5RAY+Q7ZamxiUN5f4+pDuEJ7BwPFLZLuj7Ppu03YsmcLPZjU5rCKznPz6xcoH3V1eqDNCapeEwcn/FvPmH28PPml9shAgTu5EY8R9TArribIaHmqo5id+3V+0aP8ads6brKbZjfsltHCXC0ZJM5agMwRaIW7WMklqpWUbWGLrYL48tsuaUrhrcsRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPB5IIKRKUf1KfytrtXqYNVXhu6OwzVAwsbt0soAMes=;
 b=Mlou4M019BqRkycu2WEUP52PC/Z1vqxwT1j/NOhpO/LheRFSk7t0i6Grgqa7Cp7GbucV9cLMfwGV2SZ0i3PXDtPDAzAAOHgcQ6YCSFAkhp6e1KakG3l2jCCLjq/hqCrHWnFZDrhgA7L2B5phU3ggDxIGDNjSxB+Dmd90plh1lkSVTYx7kFTjY3XyLKVrRHlWRUGeaUcopRsfaSKNX9s2hqzhDg3EO1AbsDGINfPTxxaxZ3jahXTtg6k8Ztmy4Tj1IIBe6Xtnrz6MSYphigHAFifbqkINMPwisM8P3W34mNsEWfPhmlYi/Di2o+rp33xTcoFvJbduqfvS3JjNpx865A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPB5IIKRKUf1KfytrtXqYNVXhu6OwzVAwsbt0soAMes=;
 b=XfVSfyVN5La8jTQkZL7OZ8r01PppXmIAv9ti5rgKSkxY7G0c5BMRBVvxDFKLLpwhENYiE9df2mt0WO1KJWXi3hbc61o39ciSzMpwnw4j66bHqm0Bsu9OAgdieX2U89NIpMotYyQcCD6XmKUaTDX4kqh4HBW1/x7fgfewalXzfPDKnuQp/XtQYgWY6ZR+UDh28l6GxI20hCQwUjLEVQp2G0dWS385xnbAlNlfmleEIfg1GnWP6ysY7YjT+5A4sQ3pl/zqXT/Yk+F+O7gNDTXAeLtYsG+2O0fQ3PATgeabVv8DUR0hfREw/rY7H9/dQ75OFQjvLn16O9zo6u3/MITddA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by VI2PR04MB10115.eurprd04.prod.outlook.com (2603:10a6:800:21d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 18:30:41 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 18:30:40 +0000
Date: Tue, 21 Jul 2026 14:30:31 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Rosen Penev <rosenp@gmail.com>, vkoul@kernel.org, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org
Subject: Re: [PATCHv2] dmaengine: fsl_raid: check fsl_re_chan_probe() return
 value
Message-ID: <al-6x_o7rmsjsFtA@lizhi-Precision-Tower-5810>
References: <20260720202040.2531311-1-rosenp@gmail.com>
 <20260720203338.C783C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260720203338.C783C1F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH8P222CA0023.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|VI2PR04MB10115:EE_
X-MS-Office365-Filtering-Correlation-Id: 824ac3d3-c448-4457-c326-08dee75629c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XEiuvTMKaHHQlw3jy85nSxruvXIk8B+s6mc6LJ5IhcJcRzevxWkAdVNW9nMOsZjhDYNrHl6uTJ3o5gpfGAXsF8MXkmkIa/jRpuRaXgqquNt1fbgcDjkdosvmIHMn7xFYQV1eKFmpRUEr43JDFhZ37dLOhsC+iDjilpshkIxdmh96tyMEKe6Deoy0rR9P6Yb2AkpJt1rpp9Ig9UuAZICzrd5fDStK3nI2Rh+0uhpzMpSxihH/WtM1Bheit/OuMDR0xPapCa4Zl8nI1coV9OlQR5Hl++3mrYgntS1oDp8mJXMZG5xBfNRGw5gDHHN01ZuvOHkFO0V6cjyIXC2fXVMYEJB69hmqhq0s4CTzQYV18AC/5ml9A+8yVUMclG9FNzyzaN7d+dn6cx3FAMunm6ysNS5BT9qHCUyKm1oNlQM67FAWLQRtRD6b9IPkhbrpI8Z7s3wcUGtuZ1UdlWKvrww1cZUrwsoXXgj7CWb4DcxKePmUsixuHHUy3K2lisXg3vSNByeMnL4vz8i/GbTx3HSl6e+hRhReIdA/NrbINR+xT55Swle4IOo1lDs4vXQb9yowFI3sdVtwqbuRSf2sGh7o6hUE1f6t/RIhD2EY+0+LQfw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?qQx22cNaXzTXHLwTqbY4NJkuCE7MHDZArx5LsimL7ujbm2qykUjlP07nmm?=
 =?iso-8859-1?Q?HDTg6fc4qv+WNDKwgvLEfYCLKxlUIth7imCW4ZKaEh+4lyZQPcd8ikswF9?=
 =?iso-8859-1?Q?teVfBgiJoJN3vs07Vx5//wYGbNbJYcUCisoPgmHJtcY+hD4IdwVmsFy05b?=
 =?iso-8859-1?Q?NvZdm3CiPf/UmEJMQ6I5tU2Bj1dlzM4OA6Bfv0LGorwps+ydP4Fl1irHpk?=
 =?iso-8859-1?Q?won8yKEfWxlBBs8EVLwvan9VqG3VdW6i1sUmzSKTuCwKQra6syjgdwK66B?=
 =?iso-8859-1?Q?82igI6inSIBz8Qr048z36cPz+14Pl4fPPPoKI4u7JbKTxbmscJio7EP8xu?=
 =?iso-8859-1?Q?Jz/u2wnZLd659jwcXOz532f0M87eiPwftSBLl4Jb5zJTCVC7kfv3RRUcSM?=
 =?iso-8859-1?Q?mPO51Y1edgfj57kn5g8TGdMUUPCaRtPLbjwL1jKu1XU8imf1oFJOECJ/kH?=
 =?iso-8859-1?Q?pGHV+spfvHfrt1nPb5NRM1kxfpsYX8am+jRPAKPiWGmOi1MTyA6vjANVhL?=
 =?iso-8859-1?Q?LW15o1THq6o/DBqMOrGTS1VP/D/n0ojaVY6wdGHv/lmHHfOmUc9SKMazCX?=
 =?iso-8859-1?Q?I4orZozVWYBXUf4+kGq4YpvsBJpRtbU75e3ZfStwlbZ/QWkSsvi87YCs0Z?=
 =?iso-8859-1?Q?Dgz9QwjWT9+tFTUDQefiWTiT26tLp6x8LXNjvZc1UtOPdU5wlbEz5RTq/E?=
 =?iso-8859-1?Q?eb4RmYTm/lKFGI1n7WU7GdWVFARoAa0NVtuoSUsPjOSQmJUtyYbzf9D+mo?=
 =?iso-8859-1?Q?qFWh1F6kS8VbxwqaqiE7QAX0b8NOgftTuoSreTuqMXmBHsbLBCC9uwpHns?=
 =?iso-8859-1?Q?zrFU3JkfZq6Y1Efl1hf5P77lo31CoYbKPLsupHIWxbx2XeiWXXWwQsz+pk?=
 =?iso-8859-1?Q?TMxF3dBG8MkDaaG52Rw++EzDQoKI2Dmq1tWYWWYIsMQN90b5yNKtOCV0FX?=
 =?iso-8859-1?Q?S9c3wW+8gSD5nDr8avfsYDl59LERyFiuNR28WyF6IFGvsMn7q9sHGegsAS?=
 =?iso-8859-1?Q?ntLQPov4MrNi//WyPrn8um/nF6+DG++ns4TZ3Q7xak4k59ADTTUwNdw8Wj?=
 =?iso-8859-1?Q?nObUPK6Xa8Bx0HHmITE/u2NFf0xV1pnNN9poYbOgFgJtYOf5tRxCctg2yA?=
 =?iso-8859-1?Q?RDPSUHXp+A6yNsQiAxWnzm1zlwbR48/wU63qsA6vIvIN7fahxxqeX2Ojfw?=
 =?iso-8859-1?Q?TjD0K5nW9B89YUBCnUkCFwFmKRyVFE78lDFODnKdLur6yc4SqNlXG8iOuE?=
 =?iso-8859-1?Q?g/JsuYttXsxcnTaAwIv+nLhn35ocvNgFigrKkbVxwzxqSSuM+F7gAZQiyW?=
 =?iso-8859-1?Q?h6RfaVlFq4iP6gqeSNXbdfiUlzsmLekv2OlFVUVEl5Km5ZH+qtWDrsW4nt?=
 =?iso-8859-1?Q?Pe1qgxnUtyPElHOoZFb93NjzhPImdsC87bDKKJeq5LQyVWnaqNrg6YELv0?=
 =?iso-8859-1?Q?TWKADnv+4MC8xq0n2f69m9vjgTLe7yMlN5vqIsYmB9eCu8iHkBimEJlpfQ?=
 =?iso-8859-1?Q?jHrJOJ2XOMQj0aNDzpdPFnuP2IyGmO6MXYqdjAEfex+gF6/go6fU1Vs82M?=
 =?iso-8859-1?Q?qxXFYu356wicKEqqxXHzAMSnI+5JqOHwZwuk0nc0C4raeQ5CWzKNwjolnd?=
 =?iso-8859-1?Q?QR5Bx4xAZHL4ezlcb2nX3BK/6j2L5rwBQGrMl1DepXLhHr6T2poWb+DD+U?=
 =?iso-8859-1?Q?RVZPAMlJlq+bOz4ACNtRCMQcHsPgspN6UnBFlo8/HR52w3/JeEaj4nHHlZ?=
 =?iso-8859-1?Q?bkRfD7M404K9iirDoFb2d67VuQE0WgLGZGkkVBhGoI9gMEfPtedWiVGZsB?=
 =?iso-8859-1?Q?CQWXiD8Nk39hFtBr5SYzmRvfg2fVqT4uiTAuoXiQEmlGSiJD6syK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 824ac3d3-c448-4457-c326-08dee75629c5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 18:30:40.7900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WoSaANM/QXECT9uFlCkJHRCsFhPPstYe89nleEpkp7JsZ8Hm0B0qzjRFDY71tZrLwqighiO0ixiIwj84gntIVf4m0alQcFTn2ViVUwG82/FF2/Z9sj/je+JgRGMMaEam
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10115

On Mon, Jul 20, 2026 at 08:33:38PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
>
> New issues:
> - [High] The newly added FSL_RE_MAX_CHANS check aborts probe directly, leaking previously probed channels and causing a Use-After-Free.
>
> Pre-existing issues:
> - [High] The driver requests unmanaged IRQs but never frees them, leading to a permanent leak and Use-After-Free on module unload.
> - [High] The driver never registers its DMA channels with the DMA engine framework, rendering it completely non-functional.
> - [High] Channel resources are torn down before unregistering the DMA device, introducing a Use-After-Free race condition.
> - [High] The interrupt handler is registered before its private data is fully initialized, causing a potential NULL pointer dereference.
> - [High] The physical addresses for inbound and outbound rings are incorrectly shifted and masked, truncating 40-bit DMA addresses.
> --
>
> --- Patch [1]: [PATCHv2] dmaengine: fsl_raid: check fsl_re_chan_probe() return value ---
> commit 12f631d0fec9947222a58ad5b976eca2ba2a47f9
> Author: Rosen Penev <rosenp@gmail.com>
>
> dmaengine: fsl_raid: check fsl_re_chan_probe() return value
>
> This patch updates fsl_re_probe() to check the return value of
> fsl_re_chan_probe(). It ensures that the driver only increments the
> channel count for successfully probed channels and avoids dereferencing
> NULL pointers during device removal.
>
> > diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> > index 99945845d8b5e..052218b224943 100644
> > --- a/drivers/dma/fsl_raid.c
> > +++ b/drivers/dma/fsl_raid.c
> > @@ -832,10 +832,26 @@ static int fsl_re_probe(struct platform_device *ofdev)
> >  		for_each_child_of_node(np, child) {
> >  			rc = of_device_is_compatible(child,
> >  					     "fsl,raideng-v1.0-job-ring");
> > +			if (!rc)
> > +				continue;
> > +
> > +			if (ridx >= FSL_RE_MAX_CHANS) {
> > +				dev_err(dev,
> > +					"too many job rings, max %d\n",
> > +					FSL_RE_MAX_CHANS);
> > +				of_node_put(child);
> > +				return -EINVAL;
>
> [Severity: High]
> Does returning directly here leak previously probed channels?
>
> If the device tree contains more than FSL_RE_MAX_CHANS (4) job rings, this
> aborts the probe and frees devm-managed memory. However, successfully probed
> channels leave behind unmanaged resources (like dma_pool_alloc() and
> request_irq()), and the hardware remains enabled.
>
> Could this lead to a use-after-free if an interrupt fires and the ISR
> dereferences the freed channel structure?

make sense,

break loop instead of return error here should be good solution, you can
print warning to said dts provide too much job rings.

So previous scaned ring should work.

Frank
>
> > +			}
> > +
> > +			rc = fsl_re_chan_probe(ofdev, child, ridx, off);
>
> [Severity: High]
> This is a pre-existing issue, but does the driver ever register its DMA
> channels with the DMA engine framework?
>
> Looking at fsl_re_chan_probe(), the channel is configured but is never added
> to dma_dev->channels (e.g., via vchan_init() or list_add_tail()). Because
> dma_async_device_register() iterates over an empty list, it registers a DMA
> device with zero channels, rendering the driver unusable.
>
> [Severity: High]
> This is a pre-existing issue, but does fsl_re_chan_probe() register the
> interrupt handler before its private data is fully initialized?
>
> drivers/dma/fsl_raid.c:fsl_re_chan_probe() {
>     ...
>     ret = request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
>     ...
>     dev_set_drvdata(chandev, chan);
>     ...
> }
>
> If an interrupt fires between request_irq() and dev_set_drvdata(), wouldn't
> fsl_re_isr() receive NULL when calling dev_get_drvdata(chandev) and crash
> when dereferencing it?
>
> [Severity: High]
> This is a pre-existing issue, but are the physical addresses for inbound and
> outbound rings incorrectly shifted in fsl_re_chan_probe()?
>
> drivers/dma/fsl_raid.c:fsl_re_chan_probe() {
>     ...
>     out_be32(&chan->jrregs->inbring_base_h,
>              chan->inb_phys_addr & FSL_RE_ADDR_BIT_MASK);
>     ...
>     out_be32(&chan->jrregs->inbring_base_l,
>              chan->inb_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
>     ...
> }
>
> Assuming FSL_RE_ADDR_BIT_MASK is a lower-bit mask and FSL_RE_ADDR_BIT_SHIFT
> is 4, inbring_base_h receives the lowest 4 bits instead of the upper bits,
> and inbring_base_l receives the address shifted right by 4.
>
> Doesn't this truncate 40-bit DMA addresses and cause IOMMU faults or memory
> corruption?
>
> >  			if (rc) {
> > -				fsl_re_chan_probe(ofdev, child, ridx++, off);
> > -				re_priv->total_chans++;
> > +				dev_err(dev,
> > +					"job ring %d probe failed: %d\n",
> > +					ridx, rc);
> > +				continue;
> >  			}
> > +			ridx++;
> > +			re_priv->total_chans++;
> >  		}
> >  	}
>
> [ ... ]
>
> > @@ -866,7 +882,8 @@ static void fsl_re_remove(struct platform_device *ofdev)
> >
> >  	/* Cleanup chan related memory areas */
> >  	for (i = 0; i < re_priv->total_chans; i++)
> > -		fsl_re_remove_chan(re_priv->re_jrs[i]);
> > +		if (re_priv->re_jrs[i])
> > +			fsl_re_remove_chan(re_priv->re_jrs[i]);
>
> [Severity: High]
> This is a pre-existing issue, but does fsl_re_remove_chan() leak the
> unmanaged IRQ?
>
> The interrupt is allocated with request_irq() during probe, but neither the
> probe error path nor fsl_re_remove_chan() ever calls free_irq().
>
> Could this cause a use-after-free on module unload if the hardware asserts
> an interrupt after the devm structures are freed?
>
> >
> >  	/* Unregister the driver */
> >  	dma_async_device_unregister(&re_priv->dma_dev);
>
> [Severity: High]
> This is a pre-existing issue, but does fsl_re_remove() tear down channel
> resources before unregistering the DMA device?
>
> By freeing the DMA pools and killing tasklets before calling
> dma_async_device_unregister(), couldn't concurrent DMA clients or core
> subsystems access already-freed DMA pools?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260720202040.2531311-1-rosenp@gmail.com?part=1
