Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011063.outbound.protection.outlook.com [40.107.130.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F228E3C3F4E;
	Wed, 16 Sep 2026 22:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789598030; cv=fail; b=BGrO37jr4s1dQEzlDHc3+WR2wXyzyQ/muhfTDF9DZ9zyGP0ICl5LhTxQrExESAsg24PIi6NfPokYtXC4vA0xZX7iwHN12NZbWFEX+N3Zxc9PYBPYkMtCSbVgfMA8YPQGW86QnkXQUTCx5qqqCB+px4hDdyQsJoWvhTpl4L14rOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789598030; c=relaxed/simple;
	bh=GTRyfWtIlDexhOoQLVm1erDuF8RvwBKDMr2UnMqnsv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oiA3e/6v11WKZGbHDMRfG5QWemm1dXxa2pVAeIIrYz6tlxKTb15c87o/uqOoDHqo0NgmvfIXOxp1oGScraOSnI9+sLuwlw/d0uCkop3tU3lVZRYXtzFVwz5T0AzJAah0K9PzYZIge1GNWNg3sGKZ8obCTsevVeCZUwDCj4s9OUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=U/zllTc0; arc=fail smtp.client-ip=40.107.130.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="U/zllTc0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IfK0u6DhTvVmcSYVn9Tv0J8RiKyVdvkAmoc3FK4lfwH+kCIGbQcThLvXkvz11A5cYCrkUqoaVj1M+aJGCLcx8WijUFgqEMrHGEZpYpihrxNxiufo+zyf7feemAWS1gfxYgGS8gR6fcEq9gWr0t1lSAXYUo+3IOCcJ3fU8lhDV8BU+04VDDY9VWBkIJxv297WxRLxaVkoEdxChT9to6p9SHsP/O4gtjTbC62HGUOnTN3vHakKI8uiEFG5lhcDuGIMotTzAZpVofWFLj962PGF3pe+n+SMwD3i+meOvRhkpdbfLvDc/NfZAPMFS7fdVW7aAXatxDM8L1GPlSFjAS8vtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+NfPLCGMHH0pgMn59ElsgFjwQjX8vE3FA5Iv/ailpw=;
 b=xL0nOfV209CXe4sKgUwO3vbn95+PdCg+yxAvS5yEP4cRl/ZJmc/K0ZreGKyQlUIdllG7f+PHr/oM2L+jv3o60WfmsVpPsgoobUv3zAALd43SfMAuBosQNHn0b+l9lwlryzalRPkII1LTjbuGCp+2NQZzLWhSui1oayYYhR7BkgBOdw5f4U46BoGhkljAzDbdxvar/UoXA8PwNlEwE/FDthshD25C/io9qMJyWOgHLVAQbHzqWiBagGO/L07sPJtpULH+FIFSsrS40+N44WGm1q+SYFlW7aO2WHSzSk7jd0w8I68IOTJu4fZbhJ2R78CtkRFYkdI1Yc73HVtY/jvrXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+NfPLCGMHH0pgMn59ElsgFjwQjX8vE3FA5Iv/ailpw=;
 b=U/zllTc0kiKtgOOXrxi2PSAE/PPQMVSooz01Ydgvd8j6UFRItjXm2In3NVRE0dRZYomM+3Elqzc0wJgsqKezN8LJH74is5RcsJQ9fDRmfBozqyqlWpZS5x0OGNozVK30jHHUgAvnIFLCLKEwNhdPgUSDVEORCYy4r9fy95ejUhDOQoV3nrVUbTUgmEUEmxCVFeUI4Z30SFG8VH2TuhwD9c/6BwrUOoBGqnLRdl2AYUZOPc/vuGtg+mfr40lv3Ondv1q9j2I2kMu1JKF0ho1hJNMQRkzqNlU5PCOITymUrDeux5ZwDHc5JKFFhEtygFnO2IffTw0WbS1oqBIKWaODyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8390.eurprd04.prod.outlook.com (2603:10a6:102:1c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 22:33:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 22:33:31 +0000
Date: Wed, 16 Sep 2026 17:33:21 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Saeed Bishara <saeed@marvell.com>,
	Lennert Buytenhek <buytenh@marvell.com>,
	Maciej Sosnowski <maciej.sosnowski@intel.com>,
	Dan Williams <djbw@kernel.org>, Nicolas Pitre <nico@marvell.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: mv_xor: use writel() instead of relaxed
 variant
Message-ID: <aqsZMeDZShMpCVj_@SMW015318>
References: <20260916182405.12985-1-rosenp@gmail.com>
 <aqrowa1TFhIDA-17@SMW015318>
 <CAKxU2N-zLp3612KRsdmWKjm2hMBOikBZDBEqvpLOxpg44J4Fwg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N-zLp3612KRsdmWKjm2hMBOikBZDBEqvpLOxpg44J4Fwg@mail.gmail.com>
X-ClientProxiedBy: PH2PEPF0000385D.namprd17.prod.outlook.com
 (2603:10b6:518:1::6b) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8390:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb94eaa-5036-405a-aed9-08df14428943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|19092799006|7416014|376014|10067099003|4143699003|6133799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Il7lb7Fz/Xveo5Iyq8ViDoK2gVypfI3Ew3xQ8gUKG6boYQ2P/V6PqQ6PJIEWyFQFJ8QwkIN0bev1rLV5O449DAy2gc0xxpwBNdcVOSz9Fvv5G690hj5wSze7fnQMpxW+NMA2agVHA+k5z1wbel7LUGkkt2EwlrW/xaj8Obw2EOSrZPJbDk4uCdFJyz8PMOA9T212cSQBW9/dcOZ9ymbCa6VK8bm42sen6w653AVdoiz+7ReQLYtgK9qDmSpdAS0W7zTW4+Yp6VPVmOtFqDyUEY+4CXxrJVEFJQ0uPJVX+tVhC5PlkV4Thtv/CVuxVuy0O15RqJML6/cZ7QJcICvg160iZTlFNDoYbtoz2j3xORh1ZnF1eOEfYr45uHBglVmPP8ddhrRKpp2HutsYM/Pr3EL/byXu5BRZSDFNA/bIGOo9iPvQLqgSOAyx/zePefSfy0C3TvABgJ8o7U/Oj4AFvoR8fahaAZYfyXEdXns653sqFCvtWKbUIXdaIIg+dikAU/eSb1PXjNoFEpptTHiDuEPP4hapXLDIesyEUoCOPCMSLdBwaOyOv9MJrZvEfFJfRLmERrPZPW+I03ky4J4J0+SYgGQPSfpaOddiAa+phMUCL0be+6XHl/L0SwNuYHM7RY9gv6X9ol+tU3K6uPwsBd+/ip6QRTEqc9w32aWT/wo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(19092799006)(7416014)(376014)(10067099003)(4143699003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFRMWEdjcGx0ditkMnU2M0ZxSzJhZVViZSs5L1hoQTJza1FYV1VrV0NpZjJN?=
 =?utf-8?B?T2d6dVZJR09FVDkycW9Dc0hoNmgwU1FVL0EzQnhwbEIrSkVnSGFmdk12Wmll?=
 =?utf-8?B?VUxKZEpYRlFhcU9ISGtmd3B3Q0ovUSthUEcwMjZ4QjNDNTVyN2J3Y3pHTGlt?=
 =?utf-8?B?bklvcDlGMjhpSCtJQUE5Tks0eUcrYXJ4ZU52Sk1GWVNRM2FkeFVwSVQzYXlS?=
 =?utf-8?B?R1QxMUY5TjB0MjNQWDBtTmZjSnlxcE1Rb2c3S0FBLzJLYzJBRjZ3NnRIS0Ra?=
 =?utf-8?B?cGVld0k3c1pxUEVoZmxVdytzbDhQSkJrbVBDdVdHd01oRlcvb3MzZjFkRllD?=
 =?utf-8?B?NjNzYnFHZmRreENVa0JZeURZR0JETlNydzdYT3NmdE5QMDgyRlEybjR4dGtt?=
 =?utf-8?B?Rk5SRVEzMWZuWTIrZ25YVDUzVWNwQ2VWYzZvRXlNVzBzSWFISTdRL3V3WE4y?=
 =?utf-8?B?cDhVbHM2TE5LcmM4Q2l6RGpSSXQ0Tit1NUR6dHorZlVLYVVzaHlOQ1daK3RF?=
 =?utf-8?B?bERIT0pJMDQ1d09TL2ZCY3V6Y3FySWV5dlVjSTQwL3RVeEc1QU8vcE1vcmU1?=
 =?utf-8?B?UkppWmV5R2xsNmllVHJrZDl1Y0lIdXYvcjNXRXNFT1dpenNPQVQ0Sm5HenZP?=
 =?utf-8?B?TnR0c0VFWEg5QXpJS3FCdUczcmF2cytacnREMUNmRE1qeFpmeERtSUdKVmZU?=
 =?utf-8?B?NStUK1Rnc2I1UHRrRWdFamNnMHVEQzVGVXFRMVpvQ05Qcm9uRm1YMEs2MWF4?=
 =?utf-8?B?ckw0SWVPSWhCTHMvc1lOUlJFOVd2TDVrRDZoNFA5ZDFGSlFWUHN2RlFqcUdX?=
 =?utf-8?B?bkwzVC9BV3E3R01UcmFVWWNwWGpTdDJFT0tzNE16WUNkRXhXTVNRSzRsV005?=
 =?utf-8?B?S2s0WGtwWE9zcnZmaUhYMU1qSzN1c1kyVyt1d2dXdmRoMXJ3WDd2SDUzTWlP?=
 =?utf-8?B?TnVBRndBZFpoOU5TS084TU1NQTdJeldOS2huaWVtVTl0UXRHSFh0TE9ORElB?=
 =?utf-8?B?Zm1KTmlJRC9NMnlPdXZqNnl1N3FWRk9ySVBncmEzRmtIRUFMQ0lybmhRRW5K?=
 =?utf-8?B?TzBvc0FqWDVpVzNQUTd4N0w0TndpV3RWZXVvQmU1NG5FT0gxd2pQNDRCMEJI?=
 =?utf-8?B?dUExeTk2Z2txWUZEcGI4UktMbm9Ebmw1eVdDdmpuSit6ZWFRTmNBRzg1bXZB?=
 =?utf-8?B?anJSZ29TcHZ3MENsQUtJMzNNNmhrQ05sb0dJNTl5elVyRnk3b1JoaGZjeTlH?=
 =?utf-8?B?d3l2S2tBbDJCRkdPM2dnY01FMW5MVVd6dzd3WjlxRkxwYlhvSndLWGFaakMx?=
 =?utf-8?B?bWZzL3pqSisxMzN6Yjh5a1hHMGRyVTN3NkZZRHd2elIvbUpzbEhNNC9UUnB2?=
 =?utf-8?B?L24yNTYyS2ZGZnRmMHBGek54ak5tbU5kazRhVDBjcVBHZThYZkROWHgvTFNn?=
 =?utf-8?B?bU5qMTdNWEhjZnMrOGJRL2ZXbDVsaEdYc1doM3Y1WlBydThmWUJWRFFxbldG?=
 =?utf-8?B?b0RZV01lR3pBQStJMmU1K0I5NkFxV3pSWTVaUzl2WHZyUTJNeCtRTDRBcllm?=
 =?utf-8?B?NkI1RkZXKys5bTB1SEFqbDV5T0c5MXZjR3lGU2s5QUVDN3RQRzRydzcwTFBF?=
 =?utf-8?B?dU1Zdkd1Vk0wWnAyYUR0OE1zUDJNUzNTNWdZZmRpRlZRYmo3L0RSTmNPWjYw?=
 =?utf-8?B?VHhjUEdoQ3VUZzhjWDBFT3JHS2ZwVlh2YVUxZnVGaTVweXNCaExQd0Q5WGhF?=
 =?utf-8?B?WkJkbEl1QkJ5WlZHYVhEeHo0SDdjeUhBMjhoTzg1cVU0QWZmbDdBMFFBSE4z?=
 =?utf-8?B?ZGtqYm9zai9FN1NQRzM0bEhESXZUTHN6WW8vdDlJNXJKS0pWdnhaVjZZMGpJ?=
 =?utf-8?B?UUREOXJKTURCWnF6TStxdXA5ekhUenFLUjdvMTdDRG1GL09zZTRCeVJaTkFx?=
 =?utf-8?B?cVF4a015OElaVjR0R1FBbmViUW03dUxuWWFRdnk5TC9JTDZ3U0dHMVdobXh2?=
 =?utf-8?B?b2RVMExsTUFoRTY4S0sxNk9yT3NoU2xWa0pPS3BLWmpDSDVXMEwyYUtSMkVG?=
 =?utf-8?B?NGtOWlNQZzRFMUdJWGk2ejE4UGtTQUJOZFZZUUxRZXJEQWtoL1FncWM2aVVG?=
 =?utf-8?B?RXhqSXBYbW1UUmd2ZGpaNExiaHRxVHdVMXdIdXFqblFsZ1BXVERnVk03cU5J?=
 =?utf-8?B?Y3dKYnp3eEVOU2MrbHcyZGhQVi9PK3pHWEVHZjZESU1nZGh0SVZHNGhBU2xx?=
 =?utf-8?B?VVRrSkFPRWVLOWNjRE1xQnltcmVkdStIckZyOEYweDJjb0tBREVkSTZmeGFi?=
 =?utf-8?B?U2UzVmF2d0VCTkVFM1M4OWFvbDhDeXBxUkJmWjFyV0pOb1p2TUVVT3dpMk9y?=
 =?utf-8?Q?yhg4H51zUWr57tjBa0n7xuY6v+AmzwGIrrN2l?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb94eaa-5036-405a-aed9-08df14428943
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 22:33:31.6765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQoBNXWKdgaZaXhiZVJr3Bpdp7uEQSUGgdtqT3+IcCAfIMW7p5NS6i4z9MjWl7q24tqQmCFRbdPCnCSsBQkNI3vi2V7Y0zLiY301PzVOmdfjkERhLbwYhmyzuuarRO0f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8390

On Wed, Sep 16, 2026 at 02:46:34PM -0700, Rosen Penev wrote:
> On Wed, Sep 16, 2026 at 12:06 PM Frank Li <Frank.li@oss.nxp.com> wrote:
> >
> > On Wed, Sep 16, 2026 at 11:24:05AM -0700, Rosen Penev wrote:
> > > Fix the ordering guarantees between descriptor memory writes and the
> > > MMIO accesses that expose them to the engine. The descriptor pool is
> > > allocated with dma_alloc_wc(), so writes sit in the CPU write buffers
> > > and must be drained before the engine is allowed to read them.
> > >
> > > Program the next-descriptor pointer with writel() instead of
> > > writel_relaxed(); the full accessor drains prior memory writes before
> > > the MMIO write.
> > >
> > > In mv_xor_tx_submit() the appended chain link must be visible before the
> > > busy-status register is read. Use a full mb() so the engine cannot fetch a
> > > stale chain link and stall the channel after the CPU decides it is still
> > > busy.
> > >
> > > Fixes: ff7b04796d98 ("dmaengine: DMA engine driver for Marvell XOR engine")
> > > Assisted-by: LLM
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  drivers/dma/mv_xor.c | 10 +++++++++-
> > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> > > index c4e0dce3ca64..0de2b1ad5c30 100644
> > > --- a/drivers/dma/mv_xor.c
> > > +++ b/drivers/dma/mv_xor.c
> > > @@ -103,7 +103,10 @@ static u32 mv_chan_get_current_desc(struct mv_xor_chan *chan)
> > >  static void mv_chan_set_next_descriptor(struct mv_xor_chan *chan,
> > >                                       u32 next_desc_addr)
> > >  {
> > > -     writel_relaxed(next_desc_addr, XOR_NEXT_DESC(chan));
> > > +     /* writel drains descriptor writes to DRAM before the engine
> > > +      * is pointed at them
> > > +      */
> > > +     writel(next_desc_addr, XOR_NEXT_DESC(chan));
> >
> > I remember this my comments before, should be v2 version?
> >
> > >  }
> > >
> > >  static void mv_chan_unmask_interrupts(struct mv_xor_chan *chan)
> > > @@ -410,6 +413,11 @@ mv_xor_tx_submit(struct dma_async_tx_descriptor *tx)
> > >               /* fix up the hardware chain */
> > >               mv_desc_set_next_desc(old_chain_tail, sw_desc->async_tx.phys);
> > >
> > > +             /* make the new link visible to the engine before we read
> > > +              * the channel state, the device may fetch it at any point
> > > +              */
> > > +             mb();
> > > +
> >
> > The first is readl_relaxed() in mv_chan_is_busy(), all io readl and writel
> > is ordered.
> >
> > which part need mb() here?
> It's to deal with readl_relaxed in mv_chan_is_busy. I'll change to
> regular readl in v2.

I just want to know which variable need read barrier() ?

Frank

> >
> > Frank
> >
> > >               /* if the channel is not busy */
> > >               if (!mv_chan_is_busy(mv_chan)) {
> > >                       u32 current_desc = mv_chan_get_current_desc(mv_chan);
> > > --
> > > 2.55.0
> > >
