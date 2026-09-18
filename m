Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011026.outbound.protection.outlook.com [52.101.65.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB4E51CF4C
	for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 19:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789760708; cv=fail; b=Nm5jiBs05tVKnxKhFVvvvcgFb6QYGYIQyh+iYCzPs3V46FG3eWfnSFQ9oY+6tXDtWi9f9h+zlp47ADpX6r9YnFckONNwubBHFF8pMjMZdiCziqHVHMXCACP6vLZN3pPXZn6Tw/OD7tomhIMER96Q7PMqaRnY8FCFd/SYBa7aods=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789760708; c=relaxed/simple;
	bh=v+8HW+0Qpsgd4QOA/65pgY81SMa738s1i9Y72WuCL+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Mu5qwm9ihh8NuDmswOyMdCNSA3CX+FYqu0y9Y9YEQZLfpvW2rB4JRDl3G2VUfnRdIDXUEdoPlJBvD3KPnuVc3/6IqjJq3P9YDwIuKim0dMqKtnknMhD/nVpsE3Ujw5F3N+qRD78ON0cEFbry9CYO9uxgv1cR8GNXKCQeB839Ioo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XAV7sfQV; arc=fail smtp.client-ip=52.101.65.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XAV7sfQV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m3E9q4L7aDTbKCIbqjkl8jTZtZuLpBThcaR/nawJRZogh6TXY048jOgL+prva72XAjCVzHVhrl6273RB+DQch229h2bs0INfalSL7JjlU+EAXPMGwzPm4RsrvTuwkkbmibk4KLsMqXKSDvuYzgvS67ERE48wXXKqPBkjtaLCUDSlkEE1GCapqpWJZvsdIKhAuDlWZkzuA6c/o4tlBIa+yiwY2x3ljbXiRVnSBNYXCc+IWgpvbDoe9ocBSy/P5GS4Uf7lJQCya+zWPkNna1CKWtnFsmGBXmLCe4FNZXRWe6iJoH31S/PaYZdA+K4V6RLrp/JT2RTFbjg17pistnqSnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWMN/09dgw4mrIZHLidRKrExYU1kzHj4Gsoz7bBo4ys=;
 b=D9Ff+3+J8fP8/3NysVu+edq+2rVrCHJOVVeC47ph/sV0PUPXGVqO96SV8r+WyTog+Gm498Zrb7BXfLzEQdlfhSJZdn9prZn8Rg6UynNFyKnB/CUmwNlOQzIGx2nKxzDjDUSk2grXxGfyFruZ2tlSiHDcik9DIJHHs72pHbAs7RRPEvDr7a4E0i2fhYwQKSm6UP8abA8QlCn+WXMaWaZNJne7A7Mxkegt60kS2njg4jtdj/EgJu8xdEXWLSquXxc4AaQhhUANvJXL3HCOR/g4byoqvq4L8SMczGQAVtMenGkWPl5bmMSU/nF0aujrCeLMFiyAm9hv/6VntqEzVr0oog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWMN/09dgw4mrIZHLidRKrExYU1kzHj4Gsoz7bBo4ys=;
 b=XAV7sfQVXhFHomNQ7BAmShkktO4rTtPCAucQnMFRbCjBg5icKIiSMOziQGy3jFEieZV4xI7o1ZgiRJl06nEamaN3KqXnO/LPRaQFK3HaLPCNUCgpDWMOyoTtNmRfa2Z9s/XVDG7ZvSNx5K5LaV2osuskhUqOjrTV8KbDUMKEmYvJ790XuLj9g/u6yJItbGtJJeOenQTH3FMw9tPX6j5GseoQl+8Nkk8Ba2Bv2AkjcVh+wbpiJ79sCG+rV4VdKCrWQfmnFdOROdQaCYtWUCGCbMjDvwDdHxZ2Ep/FCksUiJ4Fmy0P5T8YJtAmPgziEC00lLYGX9F7w5fsy0hvSpCmiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8530.eurprd04.prod.outlook.com (2603:10a6:20b:421::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Fri, 18 Sep
 2026 19:45:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 19:45:03 +0000
Date: Fri, 18 Sep 2026 14:44:55 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: dmaengine@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Subject: Re: [PATCH] dmaengine: loongson: Use %p for pointer formatting
Message-ID: <aq2Ut0VGymVOZn6h@SMW015318>
References: <20260918103409.UV4g2ON7@linutronix.de>
 <aq1voagTv1oJ8FaA@SMW015318>
 <20260918171730.HoXci15y@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918171730.HoXci15y@linutronix.de>
X-ClientProxiedBy: PH7PR17CA0054.namprd17.prod.outlook.com
 (2603:10b6:510:325::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: e8f6f7ea-b554-4bd3-f92d-08df15bd54f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|1800799024|376014|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	+34Apw9DEk9ZHuuuPucF37hNQh4pedwHT/xdUQSg92028602tP9S8PESoRGbawqh0tm4tsVJkZGAYdHTHsyfh1LflkehVOhei6Y+SP0G1lKUNkrsPOfOa9K2g61WThnsW8XnwIBKihRMTtrPKcggTudBH+5vLF3rcP3f8ipTkNtNyBHkmy9HZgszGTvrd6KZhj4HsKZuy6aCJ9mhudqKLt03hPc0x5CIuqgJpm6eH3pDrJW+X26Bm4Vnss7hx+WLwtHii6DhEuLuALwvq5xNRvpstRAOwy+1IBzny2lrfEEBvpzXaCz/T87zmvBCLTgObhBxhOFKzZJkpNz6+0j3/YzTB/ipSGhTE2w1e94g6K8SkqweDDfBcIRMKqNt4u9e5qNGAK2m2QxOx3aykyr2Lv2P37d40+njj3p+N/lBmS+joDMyYKWI7LBB8Ytwk96X4aQQ5304b3R8Flx3huempuO0uZRr4TpQtBnbhN4I2pzNUiJHtmaSaACafNao4kbuv/2UbND2uSAJD2VyE88I0kPJiYR86e28NXi3nnzEmcBWK9bbYV1UB9iVuE2gXEGS5yof9yKZRKRO9h4I9rONjTjMEdr03Z9+KOG7D72AvOHdsxnZiVIySw+tRVn1fsJ+ujxajvZtQXCN6x/SOB17WVySHr/2gKUaz9EuB/82EiM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(1800799024)(376014)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QEo8bQZ02lhYKOlb8Amsc7d13WFyjTuTerW5c1OZ1pvoyVX27me9rta9jsPK?=
 =?us-ascii?Q?gk/R9+9c9TEDSi5AjstTk7ZEvjEH+BPcVuKo/U6+oQX2kHdMSnBouh/4lGAH?=
 =?us-ascii?Q?rRSmH/AyB0iqG2Dr64u14Du+Z+ca+QGWPrXTJeQp5xA4lJ/PDL0XFJrhTQ6J?=
 =?us-ascii?Q?r2Ca8LRfcthWzCV8exki8UTf6f20JqRqM8KZC+Dl4YMaHJwezEtvU6bVde47?=
 =?us-ascii?Q?qeCOVq0LZRhivjL1uexa+uAF4cvgt1Jk3wGuxCuGsk+KhsnDx6BpQietTyBt?=
 =?us-ascii?Q?s0oFMARH5hXASLdKWtNIumNZCI+IoSMLNvodGUSnLElg6981GnnvatQpC2to?=
 =?us-ascii?Q?AAw7YCwbuT40haFMqJr9kBFdP/oA/w2Qj3vXt8U7b276PDVrD2zLmChk2bw8?=
 =?us-ascii?Q?6yYTz2KU8yWfWeij94ym1PghPIfKDY8xIMXKd3ZjC/F5fpW+BiPu0eEGNDpd?=
 =?us-ascii?Q?1Viu+07rSHLwamS4IC39FmmyGccKYh1+PB3XG54oPeMm3muXRdAf0AJGHDbU?=
 =?us-ascii?Q?WqrFCx02dCM/EWQ0X/wUXFRgKIdabYz4Z7hSZblybiojDnbTPDAPYC4xAf9S?=
 =?us-ascii?Q?JE7I6alSYnvrdq0BoKLbABxdPpPGnv1gf7gIcMo4YyMrkKzI5AH4GMs3/E5L?=
 =?us-ascii?Q?m7eF1KwfghqWySXRoiszPvPp6Z4HaqZHlJRhxvXapVqG6o77R3OtVqCYWwI/?=
 =?us-ascii?Q?ZS1Eu97rWZf+MSbHAMFnp7+vMzJrtgRdtNC6h/wubJNQClDEMpivNnT5AW8e?=
 =?us-ascii?Q?e6n+YzAojBg9kjJ7+F5JtsPh27+3gPz+DXjv2DFegB/4+FHcMGOaBPYD/6n5?=
 =?us-ascii?Q?E/iFnAv/vRYEStKtH+Wq3GLYX7njNOSWE7s9J2J9hC+qartgZn4dKtEmPyn8?=
 =?us-ascii?Q?7ZDTXUz1kWSaO8H1i7YlhRJ1Vv1fEEORnrdAgdiqg7nqbckf4EXzHaFRuQCt?=
 =?us-ascii?Q?NAXenEVNtRNRPFnsT6SSLIRJEZn0QjFk9XbDcY1ksr1738aynMAMQBEpHDq3?=
 =?us-ascii?Q?XSsTTwYnbBqyuVtHAgyW0sRCUkgfOKsrl3vbUdma7pKhQay1yfOuf7R5Mz85?=
 =?us-ascii?Q?b+2mS1TxMCZfidZTygQ6B5SjYhkEFMJP13kUkDy9GjaE7eoKp7E5n1L8zUju?=
 =?us-ascii?Q?s2TCBwt8xva/6eWqUguuUGlAAM00TVqMg1pZQmt5N7EEV45LMkcLMFfjkmVP?=
 =?us-ascii?Q?YGDPtuk7iDhe4ELLtv26QdMHxm72ycAYx1gZOWquTF41VCj/2bcksmD2McPJ?=
 =?us-ascii?Q?sVmGimpr+dytpbx5bqpee0Dj6Le4sGjWST6sOdotzevNPPl12OVN52Nur9R9?=
 =?us-ascii?Q?iK1CD2paHTf1bUgGQguf6wN1ZcCHMWZODvfsqfQrmDKAot5FGT4XZRQJXMAN?=
 =?us-ascii?Q?chVi4wWTy8DT1GDHxVNotOobv7r91BQv527OB4RG3ApTTWjxxgIik2BM7qEt?=
 =?us-ascii?Q?rxetxyo4XNcZ2u7lxuGDc6YSMQFYgMsC4s6o84NgdPvUnBQj4xLdSjqm+6cn?=
 =?us-ascii?Q?+zpNOIfDzVpGmQVXl81ahD4PrASGcXTa3ez2rv47zC8Rfq7vq5TQVhZ9lCPT?=
 =?us-ascii?Q?op3gxu7aAOB5VVyEU43xEG2mUovioNR/DVq3LKMFwDYYSXhEw6aUQN7B2o2N?=
 =?us-ascii?Q?4AVP2eUVyLwzMxLVGUVhWlQxaoVS+dIaZPkr/Cf40BxygEhkrcTR4ZK61RIq?=
 =?us-ascii?Q?pmSO0bq5uwcPdJJlTqzZ/zrU2xBWZz9LC4hmeF11LKwR9A7otUFyA7AUdPHF?=
 =?us-ascii?Q?qJTclYkRNBe///+87/J5nE1pQuKWx3axLQV8+lwIFOOOVVnk6b9C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f6f7ea-b554-4bd3-f92d-08df15bd54f4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 19:45:03.1066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7r2Eooie8Z/xMl2QE8gRVI9nSL2qqCyRpH4/wpsmkMyCTnoCh6PAAMaqm+MINY0ikkOJlYFErOXV+up9B6rndsIdoCBqchhR10nwg6nHuUU8Meupn6xLpOsjbJlXzeg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8530

On Fri, Sep 18, 2026 at 07:17:30PM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-09-18 12:06:41 [-0500], Frank Li wrote:
> > On Fri, Sep 18, 2026 at 12:34:09PM +0200, Sebastian Andrzej Siewior wrote:
> > > The %pK format modifier was meant for /proc kind of output, not general
> > > printk output. Since commit ad67b74d2469d ("printk: hash addresses
> > > printed with %p") pointers are hashed by default and the behaviour can
> > > be controller by `hash_pointers' boot argument.
> > > The policy on %p is to not introduce new ones. This is the only pointer
> > > output in the driver.
> > >
> > > Remove the pointer formating from debug output.
> > >
> > > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > > ---
> > >  drivers/dma/loongson/loongson2-apb-cmc-dma.c | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > > index 1c9a542edc859..27f8f7a5738d9 100644
> > > --- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > > +++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > > @@ -337,7 +337,6 @@ static void loongson2_cmc_dma_issue_pending(struct dma_chan *chan)
> > >  	guard(spinlock_irqsave)(&lchan->vchan.lock);
> > >
> > >  	if (vchan_issue_pending(&lchan->vchan) && !lchan->desc) {
> > > -		dev_dbg(chan2dev(lchan), "vchan %pK: issued\n", &lchan->vchan);
> >
> > You remove whole dev_dbg(), but commit message said Use %p
>
> I redid based on feedback before submitting and forgot to update the
> subject. Are you fine with removing it?

I am fine to remove it.

Frank
>
> > Frank
> > >  		loongson2_cmc_dma_start_transfer(lchan);
> > >  	}
> > >  }
>
> Sebastian
