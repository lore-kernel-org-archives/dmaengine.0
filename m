Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013027.outbound.protection.outlook.com [40.107.159.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A31448551B
	for <dmaengine@vger.kernel.org>; Thu, 24 Sep 2026 18:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790275127; cv=fail; b=J4gFF64jeZy7u84Fz5cgRVjzCPUN3DVAHtvFoBnVf7z/M3D+rnB11y7eDG6gk61toLSgn20fAmZxcwA9Lpuy8ZO9uI7XTULVGZf3uM0uacsRTSpfWas6kOSKupmpiePYnxAc4DDbDXpyBzCIygrJb97M0jEwAmUOclIF7XA8Ob0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790275127; c=relaxed/simple;
	bh=nOZgBFUUf5EOM6sHgt4jYsdSjV6591anUpEbxP591zA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Vid+zbfLkOka+yz2ynMXS8jpJuaV+C4tEcWH8Azih3ifG/0ujlzSms6L47VsYBB3YRW2B7KcWz++kQS0alwhZeBNLY8EzLziiKYwLxEaE/RejBjojrlndpZucz90UfXV8dhwn1ivzR5Nd5PoqtMi85WlIWWFvgQ66YwU54zFx20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Pc/4Kehg reason="signature verification failed"; arc=fail smtp.client-ip=40.107.159.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Pc/4Kehg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpXZcF5PHS9FIK41np5XtaX6amKptW+OmsWX1M3ualXR8enNhtQn0w24VJ0QeFus3FzzLykBMEjf3QrkjIuUDKA3pmhOrIFxkXYw+ma5DTEZRrcDNxR5ETwbAViEfPcA8lVbq+DBeOdAkE3yFz7s/VdLSFDJVuU3yFhs0RdQ2P/pVvEQLkWyZC/IdNSCSZ5Ew1kYhvjwCJTqOYt7rkwHDrHFA3xj+ffZtb49lxDo74yX6N7XrgJs2QxF7OXI1hJO/CaHAdTi9p24ctdpl/vDWy5nmcskmm5XT0J8zEcoHu27VHfgNF/sFpyKcXNcXEOBbog/EbwptHeZLf+HlsfYag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rMvbHIoZ4D2gfQNEVSaB/5qhO32oNoDJ0x1fsSzXJA=;
 b=i1aucnv/tP3I6OzwNZg8UElpIYB5T25ybacoNOzV1NaVWM/0y8QcOKMFhyVxa8tuAhv3bbswlOAS2EXInt+TbUkxv6Esjt+S4eeud6TC0ZBNMmmrqJVpjhtKKrGY3w6bTZUv/VsaY5+a8arZNKqbzdBOm41/sUhTFy1T46+aOmZeX5UFPz7zU4w+JBNS66OIu4079nNcJUIAZq4B9JxFQ2BLm7lreRngChhzLj20dM3RO0fl5L5OqbmLa5WVKoqRJJvvg0Mqm2ga1fsA4XNnlBZ/1+XBpAomEo/rJu/5IoZkXxmXJm24RW6H3paowrDgbmqfwsLXC8VfBt10rhZsjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rMvbHIoZ4D2gfQNEVSaB/5qhO32oNoDJ0x1fsSzXJA=;
 b=Pc/4KehgHi6BPbmPbLbNhxQpTHEVpINmmlK7pOIPJoeumj3bwFHQbKZIfxbMUcRxSV0KEUfE+JDxlC7fpAxkflQY9B7MtZ7xNsnhsPion6Hw8++5LXylAxu2UZgErLENw3oYzWcdMKLeilIqzvg9yih+fbISPL8wm4HBhT6G483u2DFyQMGrczRHwnlRxacmB3oHgC6DzjPeaK8ICS84kjcvc4EevlpsI6PaTwkelsvbrykmz5sogPipTriqjNAr1Gp37PUpeTYYxeyhOSBsheFrDfVg/RHyKiYY+bUrGLvLO09QKaWhccdzxuEFTyRgRgEyls5qevYcRQsYdkD99w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10746.eurprd04.prod.outlook.com (2603:10a6:102:484::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 18:38:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 18:38:41 +0000
Date: Thu, 24 Sep 2026 13:38:34 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Rui Wang <wr574332525@163.com>, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org, vkoul@kernel.org
Subject: Re: [PATCH v5] dmaengine: dw-axi-dmac: report paused state and
 residue in tx_status
Message-ID: <arVuKmKc8XE46R9B@SMW015318>
References: <20260924025739.844-1-wr574332525@163.com>
 <20260924031827.DC6351F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924031827.DC6351F000FF@smtp.kernel.org>
X-ClientProxiedBy: CY5PR20CA0004.namprd20.prod.outlook.com
 (2603:10b6:930:3::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10746:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c9fd0f-2a29-4a4e-c0f0-08df1a6b0e05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	pTrgAhpRtCqQMHphmfgOr5PfSIkNVdrBG964Z5zsDdpDiPa0TzvajpIrQerZDnzE6wDestD4KDdvjlabPxzgWYQ9j3thdpPuhmpZhiN2VMtjwQy6OiNf8cr9+IawF2mTaLJYZke5OZux7vvT/u2gKGQUsI7xRrCiIbWeSgAK8tjaEHoiV7FBX6YVHEVflFDh5f+29RnvkCoibfsIWln3UnFLY2Y+AOrRbN1M5J1S5R8EdnX3nMerBApKYomkcxDuMBc65gL/muahAfmN1IutsprKPSGqJ5nvvQV5YNllaMw0bsTr6je9XLfyBorAWvbECHc2zXJZ1uHeIGPFcFMnH7FVujT/6SeMDWzYxugnyc07j+Gv21++7XkwFAcMVNXLgJmRlxutZGeyNWB5KuwfwjB8qCdELFdP6dGFdVD6xZuJh/GmoIt6U6+ZOXrprg+qVoDcLRnS0z1a1PQjoMAqj1xbtcto0yEUM1UGE/z0rHY9/okPGNxgS6xdHDlxKOhiiVaO5j4nNUuh7jwH4s1pNCzeqMhIrLWtmUAsXuPX5r55oCyKbImi4/QHr0aXl8lQZI2S9WGbI7JCeJHoBaVeL0rEZblHZuZbP+FrlNB8n+8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?pjGVUn4YWxN1X3On2ToK3tcs48gJzeGDdG8OYM0P4FJeE6Ly/MzWdw3bTk?=
 =?iso-8859-1?Q?veAc8lLXpwLxHqP+HpTK8JdyIvecwrqvltbg3WYLXroQFfpPYm7tIwMoCH?=
 =?iso-8859-1?Q?NAZAFm4ddItf91fVXRtDoIezZ/ZxeAeUCsF1+P1qZ/ePgJk07fpzM7tin8?=
 =?iso-8859-1?Q?ZmhH7DAlM0NEcHCq5cB0s/4BojZTxHQcX2DWr34o3wbrLStyzVlMSLXHXE?=
 =?iso-8859-1?Q?twHOv2LmuiGM6bMnxm0lAFqqeNy3b+c9jZJIk0xDRCsXZo1aOVMMoa6mVG?=
 =?iso-8859-1?Q?6hjsOXBnBKByCQkrRIu5zLPzYMpWN4gnqbdRkQRcvZajh2WZSjpEhiTDMi?=
 =?iso-8859-1?Q?r2QfcymlN1rDbFquu0MUS1HCsZftbLnWOM3kUMk0sluQ7sx507FY2ltDx2?=
 =?iso-8859-1?Q?8Uq4STHmw+7rzhmTiWFtkN5jEt9Tf0u2xc2SgrM0BpythCsX460qey84iP?=
 =?iso-8859-1?Q?xV+dHa6Ta4Ls99FBO0HBV5TqKfMYtRs3dnHJMls0U83Ox/075vEt2vt4vM?=
 =?iso-8859-1?Q?a5Qekef3HOlGI3Agk99fW0Z0HpMkWgzDKV8ffpBl3OD6DbQ0A0OMMYbZvx?=
 =?iso-8859-1?Q?dfQM72QVeN/UKWGwxRqIyzlYkTgbcULf5PeB53DjmfIYyXtuSv+GfZg8Ru?=
 =?iso-8859-1?Q?FKwSgmNl8u+lk/RttYBRybeoOSSvtNJHdd2VAri8c7241NHjst2AaKaOd1?=
 =?iso-8859-1?Q?p6+Fjf9HK0cb/8YTcwrMcoSjOqyUnCDkitD/hSFXlRtINy31EShFpFXoA6?=
 =?iso-8859-1?Q?7y2E5VRlZ/AvAmbXDwB/zj29lBgkK4Lpg24JT8MqVwXmheh/Bp9rdAXjMi?=
 =?iso-8859-1?Q?0SLwCbMsWsem+JGF45bMq1YKwrCldtJ+S7Mi5CnQvhv6mTUzGG6Q4jC9Ap?=
 =?iso-8859-1?Q?hdbkoc3mS2/YMTjHxslD1fm1XrTCK3ED1pe2Jveh2erEmiK10VovEcrYOE?=
 =?iso-8859-1?Q?oms88Y+dT+K2vIA1STv84n01wYgS3KpYfuSMcKdg1755nh6ttXsrCCaQ3M?=
 =?iso-8859-1?Q?GscYyBGXEhIXPgkwU0CNyO3tkBxkHn7X7r94I2hgJgiLak2sK+rqZrR1lc?=
 =?iso-8859-1?Q?/29HqfhI9UhTkEtGUtf/v2tZ08Uu4VZl8DV1re1fx6roSaIZGFPcURKE1o?=
 =?iso-8859-1?Q?FyT0XsFU672qb7K+exfZXJLoxqbl3rXpEOjpYcarVKlRDD8DElw24dovaW?=
 =?iso-8859-1?Q?mt93mWE7OYkAfLMBp4dLfPiGgeXgJSKlsmqgclkkkFD78wuyBl8tOqFMAC?=
 =?iso-8859-1?Q?nY4+c8TmJVnUiNj/nWU4knC2DEx0HMdfW3PP3bSeLtQLCPYEMOvkB76eQF?=
 =?iso-8859-1?Q?hhWudCkPnuWs2n1O/25iVYhZVmm/ghVT6S0HlPwYII4TvX4r2MHB2U5FLG?=
 =?iso-8859-1?Q?kwFTB3OBD6Y07ls6REmJSM2XalUsNa9NBhFKoqumlbYKC6FU9qumePS/6K?=
 =?iso-8859-1?Q?2ZIFhProkS1wlZyFaOpWfLGT7rzx1jSyPZ9+WVQ/Nyvv5ZXy8u+QLoN9vX?=
 =?iso-8859-1?Q?5C5T9EBCzOVRTrNHA9PpzbomrfXkcECYtDIgkWE1xCtewNSCSpRnNaUNDg?=
 =?iso-8859-1?Q?EnwlVkgrIGEa1R+jwTXyOeYO+sMQguegD3w7sctnNgu/1LqpRYzjKB/kre?=
 =?iso-8859-1?Q?9osP2NMXYt1j8wh6hicE/ZfdPkC5W2uIB9INboYPvb8RDYNhSNooEbsUfM?=
 =?iso-8859-1?Q?hBTRLhOHmi8RwDNLrU6Hh1wEnALjKg28xpYPNUPMVMTuFDgQ1376iFJZp9?=
 =?iso-8859-1?Q?VR9q6fMz1tffrepSjRL/QwI1ZuTzu2rn9VWGi/geScOJCOYoQOWVigVqr2?=
 =?iso-8859-1?Q?VJWyFeos2WgVR91fBg2xppDYRgN3657eIa6XPu5DKBltzwSFuhYP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c9fd0f-2a29-4a4e-c0f0-08df1a6b0e05
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 18:38:41.2763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPskn/4BcQEiNRRTGr4kAUh0AatNkClwVep7kSl5Eu9ms2xeWGIPSjjYaQK5ssEDqFAdjzrgk2hmMhHZjVNuDuZL1RkMOKIJQfbY+XgC9xaoVHcn/tkCaNYuNyIXGCWR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10746

On Thu, Sep 24, 2026 at 03:18:27AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] dmaengine: dw-axi-dmac: stale hardware pointer race on buffer reuse
> - [Medium] dmaengine: dw-axi-dmac: incorrect residue for overlapping SG regions
> --
>
> commit 51268a3a8963bcf17968d0065986bd47e9b6a2a8
> Author: Rui Wang <wr574332525@163.com>
> dmaengine: dw-axi-dmac: report paused state and residue in tx_status
>
> The driver implements device_pause/device_resume, but device_tx_status
> keeps reporting DMA_IN_PROGRESS for a paused channel. This commit updates
> the reporting to handle paused state and calculates actual byte residue.
>
> > diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > index eebed2474210d..f0cb3c7956629 100644
> > --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
>
> [ ... ]
>
> > @@ -352,33 +352,110 @@ static void vchan_desc_put(struct virt_dma_desc *vdesc)
> >  	axi_desc_put(vd_to_axi_desc(vdesc));
> >  }
> >
> > +/*
> > + * Read a 64-bit channel address register while the transfer may be
> > + * running. The two 32-bit halves cannot be read atomically on all
>
> [ ... ]
>
> > +static u32 axi_chan_get_xferred(struct axi_dma_chan *chan,
> > +				struct axi_dma_desc *desc)
> > +{
> > +	struct axi_dma_hw_desc *hw_desc;
> > +	bool dst = chan->direction == DMA_DEV_TO_MEM;
> > +	u64 pos, start;
> > +	u32 xferred = 0;
> > +	int i;
> > +
> > +	pos = axi_chan_readq(chan, dst ? CH_DAR : CH_SAR);
> > +
> > +	for (i = 0; i < desc->nr_hw_descs; i++) {
> > +		hw_desc = &desc->hw_desc[i];
> > +		start = le64_to_cpu(dst ? hw_desc->lli->dar : hw_desc->lli->sar);
> > +
> > +		/* Current position is inside this block: partial progress */
> > +		if (pos >= start && pos <= start + hw_desc->len)
> > +			return xferred + (u32)(pos - start);
>
> [Severity: Medium]
> Will this logic correctly handle scatter-gather lists that contain
> overlapping or repeating physical memory addresses?
>
> If a DMA client submits an SG list using a common memory region for padding
> across multiple elements, pos could match an earlier block while the DMA
> engine is actually processing a subsequent block reusing the same physical
> address.
>
> Could this cause the residue to jump backwards and report an artificially
> high remaining byte count to clients that rely on a monotonically
> decreasing residue?
>
> > +
> > +		xferred += hw_desc->len;
> > +	}
> > +
> > +	/* Position doesn't match any block, be conservative */
> > +	return 0;
> > +}
>
> [ ... ]
>
> > @@ -468,6 +545,9 @@ static void axi_chan_block_xfer_start(struct axi_dma_chan *chan,
> >  	}
> >  	axi_chan_config_write(chan, &config);
> >
> > +	/* The hardware pointer registers now belong to this descriptor */
> > +	chan->desc = first;
> > +
> >  	write_chan_llp(chan, first->hw_desc[0].llp | lms);
> >
> >  	irq_mask = DWAXIDMAC_IRQ_DMA_TRF | DWAXIDMAC_IRQ_ALL_ERR;
> >  	axi_chan_irq_sig_set(chan, irq_mask);
> >
> >  	/* Generate 'suspend' status but don't generate interrupt */
> >  	irq_mask |= DWAXIDMAC_IRQ_SUSPENDED;
> >  	axi_chan_irq_set(chan, irq_mask);
> >
> >  	axi_chan_enable(chan);
> >  }
>
> [Severity: High]
> Is there a race condition between setting the descriptor as active and the
> hardware actually updating its pointer registers?
>
> If a client reuses a previously completed buffer for a new transfer,
> axi_chan_block_xfer_start() assigns chan->desc = first and enables the
> channel.
>
> If dma_chan_tx_status() is called to check the status before the DMA engine
> fetches the first LLI, it might evaluate a stale hardware pointer.
>
> Since the buffer is identical to the previous run, could the stale pointer
> match the end of the new transfer's memory range, causing
> axi_chan_get_xferred() to erroneously return the full block length and
> report a 0 residue for a newly started transfer?

Look like possible. Caller may reuse prevous DMA buffer. But I don't know
how to resolve it.

Frank

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260924025739.844-1-wr574332525@163.com?part=1
