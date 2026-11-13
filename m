Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601326;
	b=LTYuCuCgE2eBsuUSCigcTu8/PUDnX2OUX13se1OPdBIweg1jEL3MLpagdUz/82usoF/Q
	 06O0eg+7dzAeYLTl4XDthOI+s77FMfHxvq6v4g2ZOLSLcANFTXqQdCmlr82HQc9gqJGNs
	 pi5dilOB1h8xgjj4zUbRcMJJR773HtfTaly9LYcnkT0s2VpkdRdNXTAvpQV+3Sv66MRvk
	 1rBiPBaxzcflUsLOAJVZIVgleosiWPNZfYcOsHN/4skrSQuXf4OPS1Oo2lOz7DU2SNUMZ
	 xHx4Utzbs3Jo9Bk5hIGPdA7+5c824c5g3Hh7DIW7xpWhDvN6+ZbhnWGhb2mOESaW5OQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601326;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Ax/kdWLwCm0fp4U9iXoyMs7cEsqioQpKuIsWZIA9kDc=;
	b=NUTxr8vhiAEIDkkAgE9Jg4ikA5dl1SR3d920cwADiR7fWLylTkNzKtIe2Y4UxyYTabUi
	 t3MwfOsKtaDd+QvkDeFKHNLKh7547Ogw6IfbQ8oTbzZRPj/W3SY3EH2T2a45ssqCTmAye
	 EIDWC4d5+JZ8q0XHICY3vQXexNtum8ZY6T2/KUPc57E6aAn+89nGirOqT5kUBwofQvB3C
	 Omqr289ofGleKDOQYhHo6PK2EDqcWhbPp/1MPUCFvHBXLGRrOnZ82f+uiRaaFFbEXwJH/
	 StXQih0GBFNfGhwlyuslhe8rM4YTdWlrgNdItcaIUxaZuXKOScPGoaG7UfWbrDK1ewQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=C+3Hv5W1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.69
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011069.outbound.protection.outlook.com [52.101.65.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C6E606A331;
	Fri, 13 Nov 2026 20:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6C6E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=C+3Hv5W1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfxqcKfwjKiQFtMVedDmvnkGN1HTd/axtKTVYky43fymyO8FoYp/j6nr0NIvI6eZ48HGixgfxFhFHrqbuZSgC8KXaksnwssq9l/D5OVBZAI+4yapBCaKvTbaULf7nYi/GfPGf5CsA6OnnSo/OOjWMqx87ApRWRANC2XatLt5kX5UC2+HT1oak8gdQG2921ZQHxu04dw3iZDsg8oS1U5MrhQ6z656gDCv+QMSm77HhCGN87QlNS+i1fh8CTjpV4lEzuW2/wvvHOzyGXN4LwCG0pgZYTKRR/ti7+x1p2OWSV9tVeui9j0nr6/FH8Uc9QJ+8cpyoPIJSmMCCLzRykd66g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ax/kdWLwCm0fp4U9iXoyMs7cEsqioQpKuIsWZIA9kDc=;
 b=V6NFVGkvwcZdxy6qMsWnjtuPbBjYZ7/5BxGe6uyuHUbhAj5F8oWYiPPwS60Od9vVboyccKUqxJdM6zrgQOdRap9wP8w3nqnQRa0Data4stI8HclW9hSVCs9kwSrgH/1u8wABDhhcBs8KqtjRU9yF2nUdQbITId4tlVwT/RNdcm/ZxFjN7EiSH1WoAwPeU+ciHAGevlPEll6oJqZuAFK7a70VVJerVLi2pbnLFXTMsKAeQqelQ2yY21V1Cll8Dnw033rRHJFxbX9BYsiDLKovV1GRor8jUwIAnvJXI0N98bOrK/u4efx0Dw5bdTDhyZGFid0iufhClAwiWuKB9JfH3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ax/kdWLwCm0fp4U9iXoyMs7cEsqioQpKuIsWZIA9kDc=;
 b=C+3Hv5W17smnPpnB7lwiVptjSYjtLGO9UvNNfDwahgPy8YbOu+aIfLhrKZ+pBNtxoT8P2vGADW/+ZIn+XAW6daji5fwfzZVPc0PShCEJbBRiwwtRQwjzay6OmaibP3yUxySm/61W32ooQZKBENcqXtAhGxSnYE7+SGevJ/NutDpLh3ioBvZBxbZOJIsqA+FVvmasCHTBkEWRnmLzPtA9Ax/ksaWLpza8NDcJVIKZjXJhUSzaGnnG4p0QGZYcrqu2P5z0ZfLeZ6UnM9ceHIcvhRiPRQ3yz+GXrde3L8YVFoXj6eL5+DHtSozFuKyysQA5kGnJOmInnO57tXX8rmw1XA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV2PR04MB11589.eurprd04.prod.outlook.com (2603:10a6:150:2b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 20:22:02 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 20:22:02 +0000
Date: Fri, 13 Nov 2026 15:21:55 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>,
	Maxime Ripard <mripard@kernel.org>,
	Jens Kuske <jenskuske@gmail.com>,
	Jean-Francois Moine <moinejf@free.fr>,
	Hongling Zeng <zenghongling@kylinos.cn>,
	Chengfeng Ye <cyeaa@connect.ust.hk>,
	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/9] dmaengine: sun6i: track paused virtual channels
Message-ID: <avdxY6a10_SOLJUB@lizhi-Precision-Tower-5810>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
 <20261023-submit-sun6i-dma-lifetime-next-v1-v3-7-ef1acb0be768@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-7-ef1acb0be768@gmail.com>
X-ClientProxiedBy: DS1P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:44c::14) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV2PR04MB11589:EE_
X-MS-Office365-Filtering-Correlation-Id: f1a76066-fd85-422d-60a1-08df41c3c729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|19092799006|23010399003|10067099003|11063799006|4143699003|5023799004|56012099006|261021123027099003|261021121427099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|261009223027099003|261026121527099003|261102123227099003|22082099003|18002099003|6133799003|3023799007|41080700001;
X-Microsoft-Antispam-Message-Info:
	Wf+KKPlixOMRDaMQKY4VfrrLtelSHHC10BOi7FLs+5+tkuJeoxIbA8E6G4VNXlkE6Z4rJd649Er2U2NvG+hrjEXfVdlBWaVptyMoenjDfN1Yiar5+xOBo8i9zOWZSTy0RK8bXilbqORYlOLsQbihSVQDOsGoV3Y2EtjYDKh4aUxT4NF2KpSWslDzPJNha36W5qX83v0dlERO4fFZSa8M+SDHhV078mbujUHg1zyrMNrnGABgdL0v/lMxStw4prrunFzQWuI9dQ3I8zE/8hZ2tvmUTp1CGFOTw02maqGSYq39eTicW2pM7RNXmMvpBfM9y6lcLRFOVgK7dJcv++rrqxvtEivIk3Vba5KbpqA8lV4Ktg16UHbEsyOVcGrYPXkiJaShJJ/aP3d9MVdxlVBTDxsYPvCW1uJOdCUAUbqIY0+7Ym4ZdcWG1IZ0Yu1It4qJ0GxvsAzLXHlNlUHUiURlsrQgLZ84y5j1OMiXPe51JVy4b9DYbKfjIfMNWQwVC5SMGpRcG2CzGZL6IIJS6NPAar2T4AZ/ooFcvjWaVgofEfD9mtS1AHONBjidGbYrJq5+8TjfbMQhGU1h3Am5vkhoI8CztfEYFIJiod2PoLs+Y+MFrE0DbQ/OVmThRXwrW1rFAjZSLDQ04ioyGdRjryk4VI5yV5XRfRVgtrAry3OmOPgAT+M49FwU17AHMl5bjAYy1OM1P6bK+rxGozh66NcytlAzLHQ3fPhX5tjsT/Zw9cM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(19092799006)(23010399003)(10067099003)(11063799006)(4143699003)(5023799004)(56012099006)(261021123027099003)(261021121427099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261009223027099003)(261026121527099003)(261102123227099003)(22082099003)(18002099003)(6133799003)(3023799007)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bbctJTn2Y3abGNmZpt6cRCdxh6tTMU1urLMY68QTHU5RAfHE2cXPjPak6n6H?=
 =?us-ascii?Q?YSl18MmL7Ht9KBBBtVjS59br55wdt7uFeqHWz8aPwVZjOxTaqiZ3QTNYdhtF?=
 =?us-ascii?Q?iZZljBK4O0vYTn6QTjZ0hRy+MBXz+PB4W7zy4m9fr99PPUCLy61DZDDu3ach?=
 =?us-ascii?Q?EPvbKNsCcaRNqzoHoTwJuJIX9D1Olsbto+s0AeJK+k6BznL4K0/AjOKcyfPM?=
 =?us-ascii?Q?40XiyE84ormmvvcao1B6Qts7GaPaz2J0Prx8BvlZvY2srJkJARkJ1L4Uwn2z?=
 =?us-ascii?Q?3oUmk0nM0Ql9BB6VoihOOB1fr4ICC+Z1B4BXDP35SX1Fwgu/vjQZtmmZVHdV?=
 =?us-ascii?Q?H6ZhiBLiDeBtuLG+i2VmE5vvreJU9xy02qAn0wdzaF97wN7xB1GTOWymymIZ?=
 =?us-ascii?Q?jSDrp0jAzTjCzAH4f45OkNPKAWw4sUwcz58/xoC0/e2uS4TNUqM87+vcz03X?=
 =?us-ascii?Q?bod2uh5wkiQdPoor7UoiWYzjiIgO65z+pR2ujHRXt+j9Lej4ZFLDHp9NBnVI?=
 =?us-ascii?Q?Mg5SnjQSelW6ALj8PDs0PL61N9GLip5EtFb01PmLOY3Fs2MiTFyjSbAOxz2h?=
 =?us-ascii?Q?yO74dCrDkKafq/WAztjhFH5cBQhfM2U7DZVa7qa9maoJoeBenYxZahjTL/78?=
 =?us-ascii?Q?jRh2Tki+niJXMz3EQ66iCa0eP20vkDBFVMs3A2jQWjQGwHBpCNC5RT2q464U?=
 =?us-ascii?Q?xuULsNWvzDk4D2JH/NgyItpDKMLNQXKaI7l+JG1dgVA271gkB/a3ulxXRGBc?=
 =?us-ascii?Q?Ol+GYRRMiZacLXtrWvmXOAGI6adSS5xQoQhm9xBBbhaoh1VJqnHZjhaPxekw?=
 =?us-ascii?Q?VtNI8a9QYvh6w9rxf2s4U9Yjd0FQ2N4NxPNy9o2FGJd4rvdU4YIwk22KEdGn?=
 =?us-ascii?Q?igixw6SS3kkeN+NQ7br5jez1r9NwaOyq/7AiyRsWgph3cJOx/6OQL+45bZTD?=
 =?us-ascii?Q?2ffbMb4fDgLaE2seAZtBlmc680bc0kX4g1ri9GQeAaJwJt3s9gEyS5bamqnZ?=
 =?us-ascii?Q?s4PvNIBWx8A2OkWUjAo6DlVGUHaKZiybPK6cDx91rUzAxMf47GXw+lE8WVqZ?=
 =?us-ascii?Q?mBWBmHhjjDA+Y99PUWeIywR7tjLHm9aB04d41D9V9XbwJTbOAh1x+6i9WyVD?=
 =?us-ascii?Q?xB/6kCK10N4uy17A/lSLP240Tb0WrJxcw24/hR2kGpjWxIttLCAT+0Kxbs7l?=
 =?us-ascii?Q?CfnuvsgPzPXvnwkW2jn5anGHPbu3OrzFQfZr/TBHroZVXz9KrbzNr6Fa8swx?=
 =?us-ascii?Q?GmSs2z5X4NFaa8mEaOf+X7ixLUEfU/mxKeap8CMtImxArrBgu83xmmfZTfTu?=
 =?us-ascii?Q?fy00visYBKuQRH8yhRpFmp3K7kg6DBMd1clYkCFP+c2MeLSea7+l/zK5Z34C?=
 =?us-ascii?Q?F15hjmecoTBEwJ8PlCnRFmkqKe91r5VfmUAhRDunCUAt49b742Kv0VBpCET6?=
 =?us-ascii?Q?Clc2xUZWDky55AVbNSmBVbdou1LykV49lnRSOPC32uZGWFPuzoQwCtd9MtnB?=
 =?us-ascii?Q?i/Mp8oYQY7ZOOkXYLRolq5DpANm+Y5RuhlyNhveDTSBnXWbBxFktUWv9qAnX?=
 =?us-ascii?Q?faAmQi810I1V33prDBu5k479Lx8s1naiTVVhSrP+vEX7oTg4oOX6qz9HcUrV?=
 =?us-ascii?Q?5JQAs1muD3fE6y1ifEdo88DUpcQ9sY9lxzvPcsV4vTbP4TqaaEwbdBJfk2oy?=
 =?us-ascii?Q?On8zT6BxI5reN7MaRQl211wPIjetMHM5gOumolZjuYoetWhf5kpGFDvt6bBc?=
 =?us-ascii?Q?f+2wzL9u2PsJ+AUx5dlV26u3iSCNMajDV7bdWAusravW0U1JgsSE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a76066-fd85-422d-60a1-08df41c3c729
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 20:22:02.6376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 185sm5J/IMexWHK3Pi8NuvmcCyZgbFRKEZddE1WqxOdnEmFIPwcbmOohnpp3j26sGjwTCBZCIhtzaknC8bMXzZi66qCMpSeXLFeIs6RSg9lsT7bq1XikAzC1J8osKRkc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11589

On Fri, Oct 23, 2026 at 05:38:26PM -0600, James Hilliard wrote:
> sun6i_dma_tx_status() only returns the cookie state, so a paused but
> incomplete transfer is reported as DMA_IN_PROGRESS. The 8250 RX flush
> path pauses the channel and calls its completion helper before terminating
> it. That helper ignores an in-progress transfer to avoid consuming a new
> RX operation. With sun6i it consequently drops the partial buffer and
> leaves rx_running set, preventing another receive from being submitted.
>
> Track pause state under the channel-assignment lock and report DMA_PAUSED
> for incomplete cookies, including status queries without a residue output.
> Flush the hardware pause request before returning. Completed cookies
> remain DMA_COMPLETE.
>
> Keep paused channels out of the pending queue and do not start a queued
> descriptor when a paused channel's previous descriptor completes. Release
> the completed physical channel so other virtual channels can use it, and
> clear its hardware pause request before reassignment. The paused virtual
> channel retains its queued descriptors until resume.
>
> Resume requeues an unassigned channel only once and schedules the
> allocator, so an idle controller does not require an unrelated completion
> to resume it. Clear the pause state when terminating the channel.
>
> Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/dma/sun6i-dma.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index dab17b3863fc..25987f550707 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -208,6 +208,7 @@ struct sun6i_vchan {
>  	u8			port;
>  	u8			irq_type;
>  	bool			cyclic;
> +	bool			paused;
>  };
>
>  struct sun6i_dma_dev {
> @@ -537,13 +538,17 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
>  		pchan = vchan->phy;
>
>  		if (pchan && !pchan->desc) {
> -			if (sun6i_dma_start_desc(vchan)) {
> +			if (vchan->paused || sun6i_dma_start_desc(vchan)) {
>  				/*
>  				 * No current txd associated with this channel
>  				 */
>  				dev_dbg(sdev->slave.dev, "pchan %u: free\n",
>  					pchan->idx);
>
> +				/* The next owner must not inherit the pause request. */
> +				writel(DMA_CHAN_PAUSE_RESUME,
> +				       pchan->base + DMA_CHAN_PAUSE);
> +
>  				/* Mark this channel free */
>  				vchan->phy = NULL;
>  				pchan->vchan = NULL;
> @@ -935,10 +940,12 @@ static int sun6i_dma_pause(struct dma_chan *chan)
>  	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc);
>
>  	spin_lock_irqsave(&sdev->lock, flags);
> +	vchan->paused = true;
>  	pchan = vchan->phy;
>  	if (pchan) {
>  		writel(DMA_CHAN_PAUSE_PAUSE,
>  		       pchan->base + DMA_CHAN_PAUSE);
> +		readl(pchan->base + DMA_CHAN_PAUSE);

why need read back here?

Frank
>  	} else {
>  		list_del_init(&vchan->node);
>  	}
> @@ -960,12 +967,14 @@ static int sun6i_dma_resume(struct dma_chan *chan)
>  	spin_lock(&vchan->vc.lock);
>  	pchan = vchan->phy;
>
> +	vchan->paused = false;
>  	if (pchan) {
>  		writel(DMA_CHAN_PAUSE_RESUME,
>  		       pchan->base + DMA_CHAN_PAUSE);
> -	} else if (!list_empty(&vchan->vc.desc_issued)) {
> +	} else if (!list_empty(&vchan->vc.desc_issued) && list_empty(&vchan->node)) {
>  		list_add_tail(&vchan->node, &sdev->pending);
>  	}
> +	tasklet_schedule(&sdev->task);
>
>  	spin_unlock(&vchan->vc.lock);
>  	spin_unlock_irqrestore(&sdev->lock, flags);
> @@ -994,6 +1003,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
>  	}
>
>  	vchan->cyclic = false;
> +	vchan->paused = false;
>  	vchan_get_all_descriptors(&vchan->vc, &head);
>
>  	if (pchan) {
> @@ -1040,6 +1050,8 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
>  	spin_lock_irqsave(&sdev->lock, flags);
>  	spin_lock(&vchan->vc.lock);
>  	ret = dma_cookie_status(chan, cookie, state);
> +	if (ret == DMA_IN_PROGRESS && vchan->paused)
> +		ret = DMA_PAUSED;
>  	if (ret == DMA_COMPLETE || !state)
>  		goto out;
>  	pchan = vchan->phy;
> @@ -1074,7 +1086,7 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
>  	spin_lock(&vchan->vc.lock);
>
>  	if (vchan_issue_pending(&vchan->vc)) {
> -		if (!vchan->phy && list_empty(&vchan->node)) {
> +		if (!vchan->paused && !vchan->phy && list_empty(&vchan->node)) {
>  			list_add_tail(&vchan->node, &sdev->pending);
>  			tasklet_schedule(&sdev->task);
>  			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",
>
> --
> 2.53.0
>
