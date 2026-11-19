Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795107061;
	b=qCK2GfRgTucXSTgZODr1jIJ1Mwp97fvTODehKpPaBddABMZHkD3rN6gB8+NbOdb6XWUF
	 yNeIr05jygKdxJX+/5DHlx7vqB/dKdAEqDeOQO1C3CGlTKZMAkLgrRbscvRfiabjgiuKq
	 cR/Bf0N19a/sRu7j5qyy6BF1cpylajpNEDpjHNLKAdUXIVtixeDQOg62/n9sHD5S5T9IP
	 DLr0bV5ZLQZnS6iFjUCEir9Q9dOV45nYtDRcZgIDJOdVc7s8s/4KwbyPhvl0WYpdz5L4Q
	 uJTxEYUL5L1TKLva4MugR2Wbema/2tSw5ACKe43V/iTBvmgvtLYwCAxYnx2Hb799eEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107061;
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
	bh=BILK2JOxHUFvviZSrV3FNdSzKyJ/7lKFS2l9abcbzK0=;
	b=opEj9sRHq4txu2fOEDWHi4Fqhx4Sv5Q3R5nm0HLcwhPujBrO7c0cF0BREoHhIDh5VQ8o
	 XM+EaYzfuVFxp/kO1NCxhXTVVrPA6i9hXb1VI0WpoPNTu6gDHbTe82dY645KYpaSN89nX
	 66M+S+bOLPQwjdbxIXAJXcVUn2YcEzzGD+Wm23yC/R5qSlglKfbjkIO0wUQGd9lIzt/iH
	 N+Js2DjxpIRktfZqSchtlJ2AmzTd/4NO+SupebUKItyg28goMwRPvJ8SFvb12v/6OJiy+
	 Kyc+BNrOVvpe8yuY5RHeXy9pugmbfLag6WV+CnFSPrAY6qBe/oBFfD2fK3Mhi5GkxDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=HUiKCTjw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.30
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010030.outbound.protection.outlook.com [52.101.84.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C6D606A32C;
	Thu, 19 Nov 2026 16:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53C6D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=HUiKCTjw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=veLnHI+y8SuIfGhFvckkq9r+GSIi2ztQ0X+RC4RgDq3KVXacJXgKaXY7ZwaMl57/zi/L5BQp5ZnrAEF9lYiFiTHX1WAucKWZ8V6gsmACKb5u/LDiGtBdTAGUMJSr9X+uXtDMqOO+x5FzvHQ5bcD+0QGOAm5FukWOXbCktfYZ0UjJWpBLPf7OblJqTmiuxaTbCOzw3GcEhU46iOD2G5djYl1SJEAWT1owY/qEexLHmUdEAhVAfPVr3aZixdFGHzaz1HmLzXDjnXdGAfyCD0J1+sxLXfgHL9RrOaYVs9RrIF8huwFV7gqw+Bs2EpDc3Pwwz5oITGRv3WZaAa0Wmrl7uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BILK2JOxHUFvviZSrV3FNdSzKyJ/7lKFS2l9abcbzK0=;
 b=Fl3l21SYfxG4fLUuNyedYM6irtzZ271THel5oFIzSGQBzhpowyU6/4yk1XpOKLSXLF1j8x7W9UpytbmcWWJ9KuSqpZm50DugVfXeRGwpjmk3EXsMlvb1Q2HJ8dt4a54xk6LtkOjSlTV/VvX/dsRtgc5onkW5wDoyDD4fIaEigiKurAYJe5qmEWF2NRvIW3r9QD9Wg5wxetQKkFtdiI+YV5HJlKXqFENCmH+OXdRMhitZcjKVLf7Yl1z0OzW/ViUpZQ69QyrWxZDoFbggJwGHZrGxpLjusFVPX2lO0bFyH7AMTBWqQrE33tW6fkwd+yk1OhpJFRiAalYe5gsa130psA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BILK2JOxHUFvviZSrV3FNdSzKyJ/7lKFS2l9abcbzK0=;
 b=HUiKCTjwoLFUR+oFuQeQ/BAl+Q6c0Y2+w7s/EtXx+J1o6J6bI+LlxO2Uw2Zt7k4gh4vFnfsQIe5TjLkqQ+jrCIl1b4w+Kd1gerBmxh4ITHyHl436Mv392RJicASGO8UZEEAsNz9nYUqo8w4AP3aXb0KmGIU5zrw5YOhUmdDwRfxMnD9+2adEKdxx/vfq2oNd6riIg81LWF52T/jDE4AMnFazUnNB2XG7BBeWnHK3Vsa5TFzryTuuc5BIiHyHqyQmttrdUDQvbk5xgzd6zvDUtvKVS0WbRfnauyNZJAr4NKdiizpxOpyLKXSxNbBGV8SMvH3MsHy9MsUKXTWjioGbKg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB10009.eurprd04.prod.outlook.com (2603:10a6:10:4ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 16:50:56 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 16:50:56 +0000
Date: Thu, 19 Nov 2026 10:50:48 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Sergey Khimich <serghox@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sia Jee Heng <jee.heng.sia@intel.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 9/9] dmaengine: dw-axi-dmac: guard shared IRQs across
 the controller lifetime
Message-ID: <av8o6KrTcLH1JEvZ@SMW015318>
References: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
 <20261119-submit-dw-axi-dma-stop-pause-v1-v8-9-f8e7fe60594c@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-9-f8e7fe60594c@gmail.com>
X-ClientProxiedBy: PH1PEPF000132F6.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::3b) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB10009:EE_
X-MS-Office365-Filtering-Correlation-Id: 46821b2d-f554-4756-564f-08df465d47ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|19092799006|10067099003|261022075727099003|261026121527099003|4143699003|56012099006|11063799006|261026140227099003|261022105027099003|261022115727099003|261021130227099003|261009220027099003|261009223027099003|261021121427099003|261021123027099003|261021133027099003|261009223327099003|261009221227099003|261021135927099003|261009221727099003|261022113327099003|261026130827099003|261026135527099003|261028144727099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	9BQ/lt344Zfx+PSDj+Yj0KhdD4AhIO3nnhr16QuN2H+1SQboFk4ZSbQzb5N0pVZMlVQUR68xLB+trJZZBzb3HLiKdB7bfADixvDux7qDMWd3/lWoT9roXklJThIKJ/Q12C9kksCwIJ3mqxXd3hatLAi+Lvr0mcU+UyMeHmmmihQZjBJpzoA2n4koyCpnRXqir0Dbl6ziS6BUJXjpV6niksLrQSHHWR1gJejxIhsm5GsKTq1MCjkCbN2y3wNv7f7X/zvTwiWm6d4RMv4z6/wAljPjjeXHNgEsx92R6IWSiBstaLe3D4Eob//xdFpY5Bo1ISLwPpjSkXD2D8f2tg1dwk6UHZmKy+n06BFaaf+Q8kHSthxTKhRLYI1efdHPnkJvjAo786ivcbruP5PfkukQrmIJBjp6Fqydej3bUfRgFQp6HVwkg+NNrKF/n7TRVd53zzq2DRONYUcBTV0a9GgOJp85wmVaJYCNnQHKG91XG+mWGEau0EL6gIkKuvK+EQEGEHaR5UxoOQzD2YQC4lowraxFRV5ucYFZ0Sngb6YNyx/673x8PWg5nonhOlv78rz8h1KHn4t96LJG1rBjZ6Ddu4FJiFmDLfX3J8dF1WkVwg6w+MYbZMryUmib117U9FWD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(19092799006)(10067099003)(261022075727099003)(261026121527099003)(4143699003)(56012099006)(11063799006)(261026140227099003)(261022105027099003)(261022115727099003)(261021130227099003)(261009220027099003)(261009223027099003)(261021121427099003)(261021123027099003)(261021133027099003)(261009223327099003)(261009221227099003)(261021135927099003)(261009221727099003)(261022113327099003)(261026130827099003)(261026135527099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k+QF8gEsrejN9fqAgwYN6MlMM2NN9hSo8RPFx60qqda13hMF3gFMtXvmYPYM?=
 =?us-ascii?Q?rXeGWnHBXK98HHLmpqHg6DFGDLcF0STamrdNj3KWEnlbQjI1t0xOmYNL9diI?=
 =?us-ascii?Q?XPbESNqrD7EJXfNjafzCI3nkqe05o2MrtShQldEQZQhKd8/eGk29KssUAmIF?=
 =?us-ascii?Q?b3XfZrdJnYMj0Bx+JxWuejXM0m+MOw0T8We+44xQR8iTI1JVispKv4567iJt?=
 =?us-ascii?Q?SNGzKQNIWJHpjgqLapUCsddQij/GRkiq8+QQsiglOFWPToA+Ad/iMiVUcsS5?=
 =?us-ascii?Q?C+mC/XbX9Dspksj+3d70DdHOqM4R/mO4lu9VinbvzgZosQAnOUclkIGVwLTF?=
 =?us-ascii?Q?ypuWkWAfGIyVOVxKObz0S5PqbCNqtZmXTlwnVs6ZA+lLpdQNBPIDaNMhd1Iy?=
 =?us-ascii?Q?8pZIDtXkOqQ8HU+fZemnSW9HJK6FGCBd5GA8eDLY0wqBU2E2JPs4eWdOB0UB?=
 =?us-ascii?Q?65S6VRUangY8qjBuycO6tXKzDyQ7wj/bwv62nvW4j6TTCVdnYm0ZPgsBrndn?=
 =?us-ascii?Q?dQOPGU0ZwfMejKwQsWH5wRls8OVasmnIHktZVgz1nbczx2K3vnFYuKYPARkB?=
 =?us-ascii?Q?QgxfO6wb7Tx1FWl3w49fEe/pkWemhmeEEp9qFclhwoTnsqB2NewPdKHsrS5t?=
 =?us-ascii?Q?9wH9GaMgxJxD8vdm6VDLJIWQ1Ofqx5FBtfhshk3Mn4XLfLRjf2Qd96iQpAvm?=
 =?us-ascii?Q?TjEIKsMXOFTkbCiFrN9Q8z4GxuW4Vow12+dooU8DtFqGv3ztcOLfdZQHk1IH?=
 =?us-ascii?Q?Zbi2HHHZfIl3vL4HsuvZ9GU3rO9+S8QfERasSmbI4sKoFp+1SwuM5nZY/hsY?=
 =?us-ascii?Q?FCnI/LUJ9nT3qM5n5ujm64gMzckuPFU+/ZVKmwtMfM/3ESLR63DQTfS8ARyM?=
 =?us-ascii?Q?N8e69hcUtSC2MLvIzeT6ggBgmwvKka+VAxyy+OOyRzhfuB0lOoLkcCw+cbx+?=
 =?us-ascii?Q?1uDwQzydPjCQqmMg6NKXn1x4PUcL4VJ2eojfA7VlE0GaXo8ofSCaPJTaZAOU?=
 =?us-ascii?Q?D/ZMHkzaT2B7aLYYnoX70oDBwUwtV7Ap3Vu14dEeMjcr+4cYgksoogWDw2D6?=
 =?us-ascii?Q?KSZKBqrbD90h528l1KDS028I97DPJd9rFSBVfOVxbkUbWy5tTKbu5LYCQPvy?=
 =?us-ascii?Q?uybO+VCm2372hn3NC45fK07fK3KKaJSM8Z9Fw192mZzzuW5TsqF2wswCcwJt?=
 =?us-ascii?Q?EoTB3aCdpJi6OU24fb3wSJEcpQ0zYMQvLPZXYVlk+zhbabYBmQ3ybOBomDFU?=
 =?us-ascii?Q?BYqm2hx5nOIDXtdxy6UIPq3CbmJCSBcpZIAnk9RmOuk5hHjX0P+2W6nODvgp?=
 =?us-ascii?Q?y0Hnz7iKaWi2LgHKUy1xuF5drFW8lMBPl+m4tJS6kxkO6a5SdcqCr/LfwUlz?=
 =?us-ascii?Q?2vZwYvOPSgMvsiL+V14MXfcIfUpXGXEpJfXiRG+482j2RGiUsl7AzcPd0QWX?=
 =?us-ascii?Q?8Oi0jRDEMr2+WQH8SQVkcbDcHHDgWjQWfP0oNgPrG1qT3cAINa+slkIqIzMV?=
 =?us-ascii?Q?YhMTZjxS08z5WKRvWY2yGkc1nEXQ7cmhXjsCXSie9a+lkO3xn2x/wuNBNteL?=
 =?us-ascii?Q?uYlYc73TKQ4l2vc74F7aa85fmcwqU4PcIo6FqEb2f7/2fVKkE1D5DA2+t6Dn?=
 =?us-ascii?Q?AlYHqTrwtwJe+HSYvrZSDq4zMd4I5qbOP+eT97NO/PixhUfFQpX4fIIk+M1K?=
 =?us-ascii?Q?cKjFgPb1tdVWd5zDquyXPFtBU7Nw22gC6ro8+HiReZWVpFzYQsyLaA2l8920?=
 =?us-ascii?Q?t6bVPKY5YiojLtLppIUaH3RTeL143EadsRBgivnuyIDQotrkO2ya?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46821b2d-f554-4756-564f-08df465d47ea
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 16:50:56.4413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7UZvm2vSNr7lJHZ6GZq4jcG/Vb8WTO0qfVQ5RZLBD8f90/FeJN2jzwhXbhNAeaufaL1ECNdJU26nDZhpozQwwDJxgKHoTBQOpG/v/1OV4ztKD7vbpiGES3UwcTnT6CO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10009

On Thu, Nov 19, 2026 at 09:01:04AM -0700, James Hilliard wrote:
> An interrupt from another device on the shared line can run the handler
> before the DMA channel devices exist or while the register clocks are
> off. Checking the runtime PM status in the handler is not sufficient:
> the controller can already signal an interrupt in the resume callback,
> before the PM core marks the device active.
>
> Mask the controller and clear stale channel status before requesting
> the IRQs. Keep the global mask in place until DMA registration returns.
> A transfer that completes during registration leaves its channel status
> pending and is serviced when the controller interrupts are enabled.
>
> Serialize the hardware mask and handler readiness under a chip lock.
> Mask the source before withdrawing the handler and prevent a handler
> already processing channels from re-enabling it on exit. Drain each IRQ
> before disabling the clocks. This also covers forced system suspend and
> lets removal leave an already suspended controller powered down.
>
> Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
> Closes: https://lore.kernel.org/r/sashiko-outbox-216269@kernel.org/
> Link: https://lore.kernel.org/r/sashiko-outbox-219846@kernel.org/
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 119 ++++++++++++++++---------
>  drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |   3 +
>  2 files changed, 81 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> index 531705f8f89b..eab3c31f77df 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -277,6 +277,7 @@ static void axi_dma_hw_init(struct axi_dma_chip *chip)
>  	for (i = 0; i < chip->dw->hdata->nr_channels; i++) {
>  		axi_chan_irq_disable(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
>  		axi_chan_disable(&chip->dw->chan[i]);
> +		axi_chan_irq_clear(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
>  	}
>  	ret = dma_set_mask_and_coherent(chip->dev, DMA_BIT_MASK(64));
>  	if (ret)
> @@ -1167,8 +1168,11 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
>
>  	u32 status, i;
>
> -	/* Disable DMAC interrupts. We'll enable them after processing channels */
> -	axi_dma_irq_disable(chip);
> +	scoped_guard(spinlock_irqsave, &chip->irq_lock) {
> +		if (!chip->irq_ready)

Does pm_runtime_get_if_active() can resolve your problem?

Frank

> +			return IRQ_NONE;
> +		axi_dma_irq_disable(chip);
> +	}
>
>  	/* Poll, clear and process every channel interrupt status */
>  	for (i = 0; i < dw->hdata->nr_channels; i++) {
> @@ -1189,8 +1193,10 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
>  		spin_unlock_irqrestore(&chan->vc.lock, flags);
>  	}
>
> -	/* Re-enable interrupts */
> -	axi_dma_irq_enable(chip);
> +	scoped_guard(spinlock_irqsave, &chip->irq_lock) {
> +		if (chip->irq_ready)
> +			axi_dma_irq_enable(chip);
> +	}
>
>  	return IRQ_HANDLED;
>  }
> @@ -1378,17 +1384,39 @@ static int dma_chan_resume(struct dma_chan *dchan)
>  	return ret;
>  }
>
> -static int axi_dma_suspend(struct axi_dma_chip *chip)
> +static void axi_dma_start_irqs(struct axi_dma_chip *chip)
>  {
> -	axi_dma_irq_disable(chip);
> -	axi_dma_disable(chip);
> +	guard(spinlock_irqsave)(&chip->irq_lock);
>
> -	clk_bulk_disable_unprepare(ARRAY_SIZE(chip->clks), chip->clks);
> +	chip->irq_ready = true;
> +	axi_dma_irq_enable(chip);
> +}
>
> -	return 0;
> +static bool axi_dma_quiesce_irqs(struct axi_dma_chip *chip)
> +{
> +	scoped_guard(spinlock_irqsave, &chip->irq_lock) {
> +		if (!chip->irq_ready)
> +			return false;
> +		axi_dma_irq_disable(chip);
> +		/* Flush the mask before withdrawing the handler. */
> +		axi_dma_ioread32(chip, DMAC_CFG);
> +		chip->irq_ready = false;
> +	}
> +
> +	for (unsigned int i = 0; i < DMAC_MAX_CHANNELS; i++)
> +		if (chip->irq[i] > 0)
> +			synchronize_irq(chip->irq[i]);
> +
> +	return true;
> +}
> +
> +static void axi_dma_power_off(struct axi_dma_chip *chip)
> +{
> +	axi_dma_disable(chip);
> +	clk_bulk_disable_unprepare(ARRAY_SIZE(chip->clks), chip->clks);
>  }
>
> -static int axi_dma_resume(struct axi_dma_chip *chip)
> +static int axi_dma_power_on(struct axi_dma_chip *chip)
>  {
>  	int ret;
>
> @@ -1396,8 +1424,8 @@ static int axi_dma_resume(struct axi_dma_chip *chip)
>  	if (ret < 0)
>  		return ret;
>
> +	axi_dma_irq_disable(chip);
>  	axi_dma_enable(chip);
> -	axi_dma_irq_enable(chip);
>
>  	return 0;
>  }
> @@ -1406,14 +1434,23 @@ static int __maybe_unused axi_dma_runtime_suspend(struct device *dev)
>  {
>  	struct axi_dma_chip *chip = dev_get_drvdata(dev);
>
> -	return axi_dma_suspend(chip);
> +	if (axi_dma_quiesce_irqs(chip))
> +		axi_dma_power_off(chip);
> +
> +	return 0;
>  }
>
>  static int __maybe_unused axi_dma_runtime_resume(struct device *dev)
>  {
>  	struct axi_dma_chip *chip = dev_get_drvdata(dev);
> +	int ret;
>
> -	return axi_dma_resume(chip);
> +	ret = axi_dma_power_on(chip);
> +	if (ret)
> +		return ret;
> +
> +	axi_dma_start_irqs(chip);
> +	return 0;
>  }
>
>  static struct dma_chan *dw_axi_dma_of_xlate(struct of_phandle_args *dma_spec,
> @@ -1560,6 +1597,7 @@ static int dw_probe(struct platform_device *pdev)
>  	chip->dw = dw;
>  	chip->dev = &pdev->dev;
>  	chip->dw->hdata = hdata;
> +	spin_lock_init(&chip->irq_lock);
>
>  	chip->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(chip->regs))
> @@ -1614,10 +1652,6 @@ static int dw_probe(struct platform_device *pdev)
>  		vchan_init(&chan->vc, &dw->dma);
>  	}
>
> -	ret = axi_req_irqs(pdev, chip);
> -	if (ret)
> -		return ret;
> -
>  	/* Set capabilities */
>  	dma_cap_set(DMA_MEMCPY, dw->dma.cap_mask);
>  	dma_cap_set(DMA_SLAVE, dw->dma.cap_mask);
> @@ -1656,26 +1690,30 @@ static int dw_probe(struct platform_device *pdev)
>  	dma_set_max_seg_size(&pdev->dev, MAX_BLOCK_SIZE);
>  	platform_set_drvdata(pdev, chip);
>
> -	pm_runtime_enable(chip->dev);
> -
> -	/*
> -	 * We can't just call pm_runtime_get here instead of
> -	 * pm_runtime_get_noresume + axi_dma_resume because we need
> -	 * driver to work also without Runtime PM.
> -	 */
> +	/* Power up explicitly so probe also works without runtime PM. */
>  	pm_runtime_get_noresume(chip->dev);
> -	ret = axi_dma_resume(chip);
> +	ret = axi_dma_power_on(chip);
>  	if (ret < 0)
> -		goto err_pm_disable;
> +		goto err_pm_put;
>
>  	axi_dma_hw_init(chip);
>
> -	pm_runtime_put(chip->dev);
> +	ret = axi_req_irqs(pdev, chip);
> +	if (ret)
> +		goto err_power_off;
> +
> +	ret = pm_runtime_set_active(chip->dev);
> +	if (ret)
> +		goto err_power_off;
> +	pm_runtime_enable(chip->dev);
>
>  	ret = dmaenginem_async_device_register(&dw->dma);
>  	if (ret)
>  		goto err_pm_disable;
>
> +	axi_dma_start_irqs(chip);
> +	pm_runtime_put(chip->dev);
> +
>  	/* Register with OF helpers for DMA lookups */
>  	ret = of_dma_controller_register(pdev->dev.of_node,
>  					 dw_axi_dma_of_xlate, dw);
> @@ -1690,6 +1728,11 @@ static int dw_probe(struct platform_device *pdev)
>
>  err_pm_disable:
>  	pm_runtime_disable(chip->dev);
> +err_power_off:
> +	axi_dma_power_off(chip);
> +	pm_runtime_set_suspended(chip->dev);
> +err_pm_put:
> +	pm_runtime_put_noidle(chip->dev);
>
>  	return ret;
>  }
> @@ -1700,22 +1743,16 @@ static void dw_remove(struct platform_device *pdev)
>  	struct dw_axi_dma *dw = chip->dw;
>  	struct axi_dma_chan *chan, *_chan;
>  	u32 i;
> -	int ret;
> -
> -	/* Enable clk before accessing to registers */
> -	ret = clk_bulk_prepare_enable(ARRAY_SIZE(chip->clks), chip->clks);
> -	if (ret)
> -		dev_warn(chip->dev, "failed to enable clocks before remove: %d\n",
> -			 ret);
> -	axi_dma_irq_disable(chip);
> -	for (i = 0; i < dw->hdata->nr_channels; i++) {
> -		axi_chan_disable(&chip->dw->chan[i]);
> -		axi_chan_irq_disable(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
> -	}
> -	axi_dma_disable(chip);
>
>  	pm_runtime_disable(chip->dev);
> -	axi_dma_suspend(chip);
> +	if (axi_dma_quiesce_irqs(chip)) {
> +		for (i = 0; i < dw->hdata->nr_channels; i++) {
> +			axi_chan_disable(&dw->chan[i]);
> +			axi_chan_irq_disable(&dw->chan[i], DWAXIDMAC_IRQ_ALL);
> +		}
> +		axi_dma_power_off(chip);
> +	}
> +	pm_runtime_set_suspended(chip->dev);
>
>  	for (i = 0; i < DMAC_MAX_CHANNELS; i++)
>  		if (chip->irq[i] > 0)
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> index b18c9880711a..80e4632c0d55 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> @@ -14,6 +14,7 @@
>  #include <linux/clk.h>
>  #include <linux/device.h>
>  #include <linux/dmaengine.h>
> +#include <linux/spinlock.h>
>  #include <linux/types.h>
>
>  #include "../virt-dma.h"
> @@ -70,6 +71,8 @@ struct dw_axi_dma {
>  struct axi_dma_chip {
>  	struct device		*dev;
>  	int			irq[DMAC_MAX_CHANNELS];
> +	spinlock_t		irq_lock; /* Protects irq_ready and the global IRQ mask. */
> +	bool			irq_ready;
>  	void __iomem		*regs;
>  	void __iomem		*apb_regs;
>  	struct clk_bulk_data	clks[2];
>
> --
> 2.53.0
>
