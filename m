Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013028.outbound.protection.outlook.com [52.101.72.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB7238A71F;
	Wed, 16 Sep 2026 19:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789587988; cv=fail; b=K7Ka88agO/wWXiN5bC5Ygby9z27IqUDVeLyQreaiPzz1Xwq30da3L72wu6PSv3YosqdgjSnBxcFGdTN2VE1inNCMK35ghsBXzpcFi8tEuKcry7aHnxSTzOy/LHtfkitgnpym4QgQciMLB2iKqPD9RJ9iy8Jt032qLfPeBN1Ga/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789587988; c=relaxed/simple;
	bh=evWK+Tm8Th1Kg4yYzoXfJ/+IXuaNNpOgTTbzzu+pjFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dp2yDY8urBItNMIGeB72UlsDodOwPQ2PKFOOJp9Dnz2beLkRmAXRkUPWoK6gifWzChHpAg2gX1ReX7SpEpoDzVq+NS1w8s6t88/3a9q9NRTbEYp47PDc1LYtJd/ZaBvO/MI8c0e584s5GOCnKtBobUMyomtHa2/L/tPVWUrrws8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=B2A2cBMN; arc=fail smtp.client-ip=52.101.72.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="B2A2cBMN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnAslSjELaA4WLL2rNnvtA94PAjJ61U8/Gs6ZMoaiPiocAsE0qKGa/qgAQHvbLrRS2Qjhd0fvr3slh5m3S4UNvkzC2AxQM6D7hFBywGwyQxGGwofoaT5Dnurw4pgwrxNCw/uqzv5xBQCVQxd7l08lkCpdjc6IHJVa1M6s7QSAHTZocIXZv3La8dqrRfT0vWOisirxu9pOulKEsmitvQVPjb+k8HlFzZD1IgLfBaR8KnjZ4eORN5FOmN8XzvSkv5NXalW6QXdWdF864MEQVGu0EOkSJe/DMCyjrijFwqYP2SJ5rkPyfKTsWzlG/mq8D3cOAMRRstKJsmmfV3Lx0EepQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjx6Mg51qgZtXvFdh5AljiBdvY197XRe+WqWPScRvyQ=;
 b=JSDcx8Klae6iZRmbUulGpIlnEZnxVcRCqjaS7MlaTPIR5RmrBTlrDav4RQKYjov4CP7kLpYiGiUTT0EHO2IaCFReD5x+MCdZnZCHGNiuzoFIZzteb2PD2o6NJdgkWa8r25aNqHGwr8V60bVAKQVkW/gP9gy+m09uSh3q1Xq0i/De6I1cDYL8ogddUGyNO/8SpgtsdXXN8/jX14EthBcgJplb5LKwyzAkpY8285cg2kTY1gofOJCTiMpv4LfwUZmeNUw25qU/gsJ7TecqseNlOHaalJr7TWUTxljiefvW+pz14e2j0DdAzB+JVkNw1dnQ9EPN3citSfeIYLuelZpZuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjx6Mg51qgZtXvFdh5AljiBdvY197XRe+WqWPScRvyQ=;
 b=B2A2cBMN8h7Hkteh7q3qymJAp7HbYf+9hih79B+IxPCeEO9Tv5X/rEymJ6Uk5Q7VkZREbRkaJK8rKmTCuhUNsu2RZqm3PEpauAJ36q0hYC6o8csRCX3wQWthE0Ruixh0VYQkGt4wTNR+J2QaqndGdtUJ/jrty6edT6Q85jP7gmwkxHKcdfAe5Ehq3Tzzqw6+EQ81/ClPja2Cu4yiB7biM+/1PlFIERlRa69sc8MIA1akH8WYEoLVunUHePxW7bTSDw+jX2T/RpR1zBSfHBexxB0CkY+OfaUYyhXDT3qWeaEH/GDq5HHkIK+cxic/+dX0m9oF827WCjAYZIF2YQh8Og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB9927.eurprd04.prod.outlook.com (2603:10a6:150:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 19:46:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 19:46:15 +0000
Date: Wed, 16 Sep 2026 14:46:06 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Stefan Roese <sr@denx.de>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: mv_xor: protect MBUS window access with a
 spinlock
Message-ID: <aqrx_qKwUCCNxRda@SMW015318>
References: <20260916182608.13523-1-rosenp@gmail.com>
 <aqrpAlpvHWTi9eGI@SMW015318>
 <CAKxU2N_bJJijZ7QLx=ubaVWA6Mn=q7tswKj=mE8NFJXz=Uf6RQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N_bJJijZ7QLx=ubaVWA6Mn=q7tswKj=mE8NFJXz=Uf6RQ@mail.gmail.com>
X-ClientProxiedBy: CYZPR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:930:a1::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB9927:EE_
X-MS-Office365-Filtering-Correlation-Id: 171f66a4-c5a9-4974-da17-08df142b2b2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|19092799006|10067099003|6133799003|18002099003|22082099003|56012099006|5023799004|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	12KFEubFWJ/ZzceglBk3/v+30SsK80M6aOJ9FSYEe+8j2B97lJcJhe49bZkcO3KSwtmLj3C7k7DHFxesTEVnTdPVXW98aRx7f2ypr3s0KGmhv+MBT8sdfucDgoCzB4R0pehHxuPRv0r4kQ7AvLB8pHaJhBgfdQ9UX2EdodKZk+Yuw6XgR+YzFuTVdRBZWTAmuie/2TkEhErkVNzxtxbj0JTp5n1uCwxCsO8H0omKLcT651UivHi5BLF3Sic3V7zq4v4WSPmFP6t+j8QhEruCCuwAdurEA1FE3qY4Rtq7WS9oV/xmxkBvLz7Jvk9TfvV1Qo1ukMeRhVIuYejMV6Ah/DrVgLHVRl12/ORndR+pMVKlaIB8KAUta+5NC0qlAxYj6S9EAgkGYXjxnnlmKZmbqblspxDeQPXpja4rqykrQbnH3JXSQQOa0GEpuFoe7k4edOHgxfPOeec29QZk1MQABsh2hVcWskdRTi2GYiPp0BrGCyRm8TEsJoGH9CpMNJtbCK448t0Jc82LZ0p0uOYSGnNESWI669toqULLOjMzrgsSNVihNfzU2xtLkyFP+zPgO0S5y6cqAvQcSc3MTmVURiX5VJk1B2kAN8CPjWYT0bOBabxn/phXFVvrQGp0mOdngxxb9eS5il7UG/e7yvuArRvgdvqMhz7xNmv8sQcbnBk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(19092799006)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(5023799004)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUhaZng2b2xQZjBmN2dKa0xZL0RpYWx3bk5UclNhZUllM21VMFRGTVNEY0pM?=
 =?utf-8?B?TG5nUjc5SkU3TTU4K1c3MGdCUWFyMlZ5UlRUbmR6TGg3cVZUci9KcUFrNkU2?=
 =?utf-8?B?VjJzS3BmdVRkdWxpTnpaRFJyTTl2cmlFR051NVY3dTgwTi9yRkRlbVZXM3kw?=
 =?utf-8?B?U1JPbkhxekN2andpK3BaRkVoUEp0U3NyMm5qdGZsbmRNZXFrbWhuWDROT0JY?=
 =?utf-8?B?S2NnQjlPajYyVllVNGtBR2E4K25vK3Vvbmd5WURKSlQ4VDdRdUlkK1lnbEs1?=
 =?utf-8?B?V2ZxL0JvWDU1Z2VjZjNHcldqd3QvblNDVWxmT0JWZFc4VGZ5RGo3QnpGYmdw?=
 =?utf-8?B?RWhPcElhZ2I1NGNIOFByTStuQzNvSmExMllXZG9zdVFWQTJ6RlM5T1ljV0dt?=
 =?utf-8?B?NjdmV1ppcEZtNWIzOXVKbjZWQ0plZ3QwSDMwQnZLVnN1YnpmQjEyVk1YNXpu?=
 =?utf-8?B?bEs2OXBadTR6WEhWRWQ5bW1IM1pKamwvNmVZRHhQM2ZNSXhIT3orNmI3SW1h?=
 =?utf-8?B?VTVNNEF5Q2pjN3MzUkdNbG9nZzRoWFYrTi9IVHVvdEtSbUtuSEhUSnRvNHl5?=
 =?utf-8?B?cVdRMm0xS2NTUE9EVWxUZmZOMmFjRkN3Z2crdjA1YjFYRkg1c2MyVUVncjcv?=
 =?utf-8?B?eFR4ejA2KzBJUmQyWE1oc283NjhGVFFvRHY3cEx4ZVVIcS9rNFZXQU5EWHdG?=
 =?utf-8?B?bStURzZ2aWhpeUhJamlwZkhJSnFra3pxZzNtMy80L2tXZzhlYk90Vktjc0I0?=
 =?utf-8?B?UjV6Y0x5R1RoMjhGdk91Zk0zTzNuN04raGpPMVhGUUdhMTlUUkRwVG1obUJU?=
 =?utf-8?B?U1NDQlQ0ZmpicmlIdzZwb2FZUHRCWXpWNWtGZ3pNaXBnbXNoek5qci9OWXRl?=
 =?utf-8?B?cDdxK3pxbFo0bmRWQng3ZytPN0FJdGRBOFhHd3NLRkY1NjcxNERxVnE0R0dz?=
 =?utf-8?B?U2FQd2NVR1Y0L2tmZ2NXM010UDRZeW5NMFZHa1lyV212WGtaQVhySGJPMHVC?=
 =?utf-8?B?NVlxT2dCWDF2MER1UmVaT0tVbHE4WHlnRllwcTdTWEhFZmg3RkhrQmZUeUh0?=
 =?utf-8?B?VkJxMzY5ZlBJQ2h1Z0JNbEZURnhTeXhzRHdYUm9qd0ZRTWgvZFMyTnp5dHRD?=
 =?utf-8?B?OGp1SWpLYVhGSHlwUW0vWEhIVDVKbURnamR1eHE0VEdrVTVMYlAyZWN2SFJY?=
 =?utf-8?B?OHlENmlyWXpvaFJWcXkrU0JPdlYxcCtaK0lnZGRFODBZK2dZeVQ5NEFycG5r?=
 =?utf-8?B?Zm5yMG9PUUd3U0t3cjd0bFNmYWs5U3VOVFpFa3JJNUp4ZUdYYTZGenpvSE9m?=
 =?utf-8?B?OXhhVEpYaHljSkFRVDdTUGRRR2F1aTYyeGtWdHFCSjcwQjVMaW05aFk1WGxr?=
 =?utf-8?B?a0dxNmtmTTBCUTU0emNoTVYrNFVPL3lPVVFMSnU2OFRqWVNvUzRmVHJWRXdk?=
 =?utf-8?B?QWFEaS9IQVJWdE1oVVpCTlBGMStKZ0lJb28rbTgyY3dIcFhTWTFvaCt5akhP?=
 =?utf-8?B?MUNUYnhFcHJzYjMzam0rcjd2MURRenZ3SVJyem9xNXFkNStxd2F1VnJjRUFm?=
 =?utf-8?B?d2R3eGErbzN6VUpXSzFaSkN0ZlVFeFRnaGxmVnNxQUtYSlZ4ak5nbEFVUUd0?=
 =?utf-8?B?TEhkcFZhRDVlWTFGS0NuMWFtR3RtdXF4bFBNZTIzazdDa0pELzk0M1MrRzE3?=
 =?utf-8?B?d05jazl1MmdtL3dwdlpzTFZGRWdIZkNvT2xhNi9ybFNoK21yT0J4a01Hbk1W?=
 =?utf-8?B?MGFYMnRBdXdkUmFnVHVNdXhrQWIvMGZUcE4zZ2MyVFVRRjEvdGM5UkEzS2h3?=
 =?utf-8?B?V2xTYkVoMityQ3k1bk5QaHdiQ3hGaWpKNXlJQjlDYlJDSnVSYUhoSVpDOFhV?=
 =?utf-8?B?cWRsc1RKUUU5WmR5K1RMeVBvSWRVQUlFdlRJcVFpYWttL3pLSW91TVFNN0U2?=
 =?utf-8?B?M1JlazR1a21ncGgyWFk0TTZ5dTdJdC9Ba2NYeXZiMVhwbmM3T3htYnJ4bVN2?=
 =?utf-8?B?N24ySnl3SG1mc04xTm1TTkUzVUJ1L084RHQyWU1xQVBxK2YrQVFSVzVpOXo3?=
 =?utf-8?B?RDJ4NFBoTitKNWxpREZHQzU4TUdRY2VTU0tXdUIzOS9kQTNYMVhmaUx1cVBj?=
 =?utf-8?B?bGhWQW43QngzU3RVa1h2citXZnpxZkJDL0xxemxwdTc2OXo1TURnTDlJeVBY?=
 =?utf-8?B?SExZR1VGU1kvamxUV2JKcWEwRFVZR2VacmJTQTdmT09vN2J6MUgxd013SGFq?=
 =?utf-8?B?SHVDSThCakRMeENhemNBUm9MeVRSTmhmSmxHQ2ZWUTJVbEMyS0l2S0JWdEFB?=
 =?utf-8?B?N2N1V0pzVWJjZWxWaUVCOWJ4cHgyZFd6ak52OHF5WDJTeHB5aksxRUYvbmx2?=
 =?utf-8?Q?jCGh4MIXuUdHSHUPeCvYZKfWS1hudgITx4AT4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 171f66a4-c5a9-4974-da17-08df142b2b2d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 19:46:15.3335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xRM9KkdBSUBqPYM1K4pgpp9tlnZOOedWfly3m2MUhpiQPxiYlvPsGfeNm+jBcZHpT0hMijJ40dDewxPnLvoUIWGynwWVX13LpEOumOWSfQU+ASxsccaeMzQ3m3d8vsma
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9927

On Wed, Sep 16, 2026 at 12:34:31PM -0700, Rosen Penev wrote:
> On Wed, Sep 16, 2026 at 12:07 PM Frank Li <Frank.li@oss.nxp.com> wrote:
> >
> > On Wed, Sep 16, 2026 at 11:26:08AM -0700, Rosen Penev wrote:
> > > mv_xor_add_io_win() reads and writes shared MBUS window registers
> > > and updates the shared win_start/win_end arrays in mv_xor_device.
> > > Multiple DMA channels can call this function concurrently via
> > > mv_xor_prep_dma_xor(), leading to races where two threads can
> > > select the same free window slot, corrupt the registers, or produce
> > > inconsistent cached state.
> > >
> > > Add a spinlock to struct mv_xor_device and hold it across the
> > > register read-modify-write and cache update in mv_xor_add_io_win().
> > >
> > > Fixes: 77ff7a706f01 ("mv_xor: Add support for IO (PCIe) src/dst areas")
> > > Assisted-by: LLM
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  drivers/dma/mv_xor.c | 15 +++++++++++++--
> > >  drivers/dma/mv_xor.h |  1 +
> > >  2 files changed, 14 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> > > index 0de2b1ad5c30..e7c6ec54ce25 100644
> > > --- a/drivers/dma/mv_xor.c
> > > +++ b/drivers/dma/mv_xor.c
> > > @@ -497,11 +497,14 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv_chan, u32 addr)
> > >       u8 target, attr;
> > >       int ret;
> > >       int i;
> > > +     unsigned long flags;
> > >
> > >       /* Nothing needs to get done for the Armada 3700 */
> > >       if (xordev->xor_type == XOR_ARMADA_37XX)
> > >               return 0;
> > >
> > > +     spin_lock_irqsave(&xordev->win_lock, flags);
> > > +
> >
> > use auto clean up guard()
> Could that be backported though?

I think it should be fine now. guard() already use quick popular.

Frank

> >
> > Frank
> > >       /*
> > >        * Loop over the cached windows to check, if the requested area
> > >        * is already mapped. If this the case, nothing needs to be done
> > > @@ -511,6 +514,7 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv_chan, u32 addr)
> > >               if (addr >= xordev->win_start[i] &&
> > >                   addr <= xordev->win_end[i]) {
> > >                       /* Window is already mapped */
> > > +                     spin_unlock_irqrestore(&xordev->win_lock, flags);
> > >                       return 0;
> > >               }
> > >       }
> > > @@ -521,8 +525,10 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv_chan, u32 addr)
> > >
> > >       /* If no IO window is found that addr has to be located in SDRAM */
> > >       ret = mvebu_mbus_get_io_win_info(addr, &size, &target, &attr);
> > > -     if (ret < 0)
> > > +     if (ret < 0) {
> > > +             spin_unlock_irqrestore(&xordev->win_lock, flags);
> > >               return 0;
> > > +     }
> > >
> > >       /*
> > >        * Mask the base addr 'addr' according to 'size' read back from the
> > > @@ -540,8 +546,10 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv_chan, u32 addr)
> > >
> > >       /* Set 'i' to the first free window to write the new values to */
> > >       i = ffs(~win_enable) - 1;
> > > -     if (i >= WINDOW_COUNT)
> > > +     if (i >= WINDOW_COUNT) {
> > > +             spin_unlock_irqrestore(&xordev->win_lock, flags);
> > >               return -ENOMEM;
> > > +     }
> > >
> > >       writel((addr & 0xffff0000) | (attr << 8) | target,
> > >              base + WINDOW_BASE(i));
> > > @@ -556,6 +564,8 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv_chan, u32 addr)
> > >       writel(win_enable, base + WINDOW_BAR_ENABLE(0));
> > >       writel(win_enable, base + WINDOW_BAR_ENABLE(1));
> > >
> > > +     spin_unlock_irqrestore(&xordev->win_lock, flags);
> > > +
> > >       return 0;
> > >  }
> > >
> > > @@ -1353,6 +1363,7 @@ static int mv_xor_probe(struct platform_device *pdev)
> > >
> > >       platform_set_drvdata(pdev, xordev);
> > >
> > > +     spin_lock_init(&xordev->win_lock);
> > >
> > >       /*
> > >        * We need to know which type of XOR device we use before
> > > diff --git a/drivers/dma/mv_xor.h b/drivers/dma/mv_xor.h
> > > index c87cefd38a07..034db4d0bfb1 100644
> > > --- a/drivers/dma/mv_xor.h
> > > +++ b/drivers/dma/mv_xor.h
> > > @@ -80,6 +80,7 @@ struct mv_xor_device {
> > >       struct clk           *clk;
> > >       struct mv_xor_chan   *channels[MV_XOR_MAX_CHANNELS];
> > >       int                  xor_type;
> > > +     spinlock_t           win_lock;
> > >
> > >       u32                  win_start[WINDOW_COUNT];
> > >       u32                  win_end[WINDOW_COUNT];
> > > --
> > > 2.55.0
> > >
