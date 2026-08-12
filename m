Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012038.outbound.protection.outlook.com [52.101.66.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881623264E7;
	Wed, 12 Aug 2026 21:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786568774; cv=fail; b=YPTijCVKSQGqdBbjR2gmknHSzkDG5bHY8+9nBkgSENWSXj18tOq4HSs1QiKjLpPO83LRw0ehX9FSjpsQWLtcuULp1MBiu9yb6e6jEaQNEHYzXM0FmpgF17tDED333FxZhotiioLHfP4t5YJMeL16JG+FQUbeV4RGN27upBQTV5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786568774; c=relaxed/simple;
	bh=yC5ae8/WCQ5rVB9NmpsouucYKcKTwxtr9j4SG67iesU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rVzCDVRi5ILyMXxCkss/W2Eu0lBrp8A0KNI72WP3j1Wclc+JpzAYPg/6bjk/gK/z5EKEThCxBq/m0TvfEHtUtnzs6i/rCu1hN9llC9+1nFXR1WDRHEz40irfYGYmm1AZbhS4OIYmawmeQ+Dt+RBM9yZ2ZuXvnZRTnuV9RqyGv1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gtlhe8QO; arc=fail smtp.client-ip=52.101.66.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gtlhe8QO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xLOSSh65Wa28GXSWpZ91nQvCakF8GxabEJG8i3C4FUw7NU62FYxmCghDzzPajmMeGyn5ksp1qolOGRTiLSMTwKVjeaouhqx6b4GjnFXNzhLJngEUjh/h/eHLyUMu7sNJanN1+DvimZjxPVlKrquZeG5I742NZyKLdbD9b4QI8qlzwQx4K8nrMEqduftheYf+2CzZIGwtv8qbHsviGuTFvzm9le3GQVzvZ0BmJ4vjfVdxXbDg9+CzKy352DLzH/mJYEmQc/kDrRo6Wtp9TXJ4rR4XaFuzFyIT4e59VP9n75GejjR8lyMj+PlBNCshpulePw2rP/KR6xFFKdYemzNRdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1lyVuACMhRjSIou50G3M9BsLO/i/gZzfsCcYYgurtY=;
 b=aBPqeVcZvylSltVOf2TU1Rts3EbwTsPMADhMTm9pcZmjj6xC//BkZ+RxbFG1mlwxxjr0EUE1BoSZVvsS9jnxHVwP7uo3VZmYLc6zk1hL0GERcsd1fg92lobTXNbAS7+69k3Ul//LO4sUo+aa4dBu6EHGa1y19jZUPDuX+oXWGWmr2rHBmUnMF2h10g63UXxtzUXhDYK87XoLuFmQ5zA/PAQ0xZzlMArIhRQDGmKqKbQb6ODRoIgR7tL/yaovvsgJUWk758RX6BKSLfMLgQyH7zSdzOoz1HQWJ3SnI48WijbLbK4RK5mtAzlRUt5pnxEafCfy6S+0NS8cG0H5iNI3Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1lyVuACMhRjSIou50G3M9BsLO/i/gZzfsCcYYgurtY=;
 b=gtlhe8QOpqmneXPCE0ze0Zesw26iMjg7KRx9bEc+6rsGmnjS4wI84dhLK27uj/5gbb/uA0S5rQcmuuYjXoJ/LpxkeuBMMKeZaW2MsPgaycWrWg2PueLl03edLNdqkBdI3MYxgb6QrU4NGOwk9DiT5M6q69ZbQ6Is9s0B2sXl5lN95HFrhwWGZTQEuokqbN1O3yfWawNDoVE6c4oHpXnluOMKy3MiDIfUudI7yK0XaM5GGtvROa2y5h+ZcDQXMK16iA1nWp4iPI0ZFLjqumfJVf1o61kuuuZ5ZgcMsXCpEcYXNmbEJtl1U9dX2o3OW5KHuSqas8EI9C8+xE0qwSPzRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB9994.eurprd04.prod.outlook.com (2603:10a6:150:11a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 21:06:06 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 21:06:06 +0000
Date: Wed, 12 Aug 2026 17:05:58 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Kees Cook <kees@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Christoph Hellwig <hch@lst.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Niklas Cassel <cassel@kernel.org>,
	Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/24] dmaengine: dw-edma: Support dynamic LL appends
Message-ID: <anzgNmxSV2vf1w1X@lizhi-Precision-Tower-5810>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
X-ClientProxiedBy: SA1P222CA0166.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB9994:EE_
X-MS-Office365-Filtering-Correlation-Id: f32ca30b-0013-4794-cdec-08def8b5868c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|19092799006|1800799024|23010399003|56012099006|10067099003|6133799003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	OHCbwWR8pX21BnzjM1wF9rXsyjIv+VLLknFgAihATFAu7twOTH+uDlJNAoNrSjUmtNYKiowPC24ir1M+Ts3pA2CLF8OeoYMHC6fPa40JOLJMaYHLwiAxDDLghVzkT3HL8nWpK6/661Z6URRh7LHH1+XaV/Z8wb2lBCrImJb8tgk03HItkVoGJGWxii1yBM1q70PqGYPbZfxbL9CtIWxS3Y/Qv2Xfhjp/p70JrwHkvX6zdGcTEyXtsc9WfZyO914CQ9yiL4jnsRhZhw5v1VRKjmmOK68UwyqcQTbEg5Jf6Vz0V92Zp4US/INOn+RmmPn5g7uv9X+ea4eP5H9/E8X6t2LjXTxZzDU+OaC64kODqIsrmKJ++oVekgZv72Lc4FCLDIharoKOBUoziItb3BiWfP3ON1c/hYZIjsAu+jnvU4H0hLYBpFthsiqydg7bbCFPQKcxsqs6M3zXfEYebOVkaSvGCuc+vjJ8nTrHhgDtnGYYvUyzvrN1/CFUdnm6cNfjAKF6WRbOlWiQavK2kuZDTtUGho2+UF75AvX3draVdTT35Lh79Xt0BtkARk1V5zQgV7tpr+/TyxGXZOvJty3naU5i4GrhFM10C87fiLqSXRhIxB7tcdOnqLl+fDSFEYK6fK38iimTdwwoXaYcM+wgWNBN5jpZcTDSG0fdtNnR+98=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(19092799006)(1800799024)(23010399003)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HSKcxdSK5ZR+JHM/IWUfltV6uz5UIJUm4jSjMa2QJVzQU3C8scRadTUNd4pW?=
 =?us-ascii?Q?En1R3KyhKUDjifH/igRDycACucr69Nodb/9VRT7BbZLYUFvCsBG+Z5wlHvkQ?=
 =?us-ascii?Q?v0+o8IJNTXvgRuUY92gTIhyE7yxtfg3pyhDn2RMdztz2wxrlNRSZVaiR9lsY?=
 =?us-ascii?Q?ScA0RbBgoHSv9S3CXcU5uhctHro4x0z0vSzRr31ZpXkeaIyWORPvZpXJKqgl?=
 =?us-ascii?Q?KJtZ7Z5BOLA45itg3tOo9xr9XysNIvUskFIZG3P6I6XYwHU2tFajobdXYV6F?=
 =?us-ascii?Q?QreRZOPIOk1dr1vx6TZDSU+wcXW/Palq2XkXPh13huSr7hrIndYEbuNlCHQ2?=
 =?us-ascii?Q?tEGx11HpYsvsngqXW2l7u3mnRmIIC7CVgdwndHUd+2oczS7NaiJotxQmWuhd?=
 =?us-ascii?Q?Ielh2oDlhC5JUVs+F0+kv/4oynqvVFwKxMwP3TBCl7jPxzMfPsk/LMuRPjNB?=
 =?us-ascii?Q?9G1713shqqqY/ZDbuELfcBnuFUN6op/fDV3VHR1Qrl2RAqOhSyVjohcwq5dp?=
 =?us-ascii?Q?SNYPA/vlWPkhAEPn3FLp/+lVlErOixZ3VgvAYo9NWwd0CR6Ggnns0mwZNzUZ?=
 =?us-ascii?Q?PVREVL6gze1BjakkYK5CiN2buN5jTqnn3zJbh3DxQ1o6c552F/ZUl/VXzoF9?=
 =?us-ascii?Q?YSPm0CT7esn8q1X4Srhyr0QIbo1dw7PJbhVLRtaUQBMvpU7Q3s/bDtVljnY9?=
 =?us-ascii?Q?nF/lSUb30J4CFl4/uiuZj84DwHTqF2/1mnTknjwwc16bqYZW+9ZYpPy5hK8A?=
 =?us-ascii?Q?KXDQl4r/pvbMCqjXdasKAn11oxa4h5QdcV2iPOjZ1NuFkycmZYAe6Ca3OCe/?=
 =?us-ascii?Q?+Sy+YO1gS8PWcFfbW99amYyqP+1KcfmEZiql/w6sdOvnJEmDRJdADY/igmiV?=
 =?us-ascii?Q?4qbT2UcW1XngDW9F+tGEG65RSCeRfuvt2pPqdktoD1Q2cB89a6TVn/YYbWBQ?=
 =?us-ascii?Q?GydUyusHDVI/Z3onFg7llSeleNqsiUUzPkQBl0B//+RnoolHnSd8Dm/lXE9r?=
 =?us-ascii?Q?KbApN5ZV0bhB9IlO6HKQ4gNLDW6woYhqj1WYA1R684YU3f2huSsGVr+lxOK8?=
 =?us-ascii?Q?g2InC9vg1PJvUIHPEqXDBhyvoA10YNcmKSy9zPq0vukD3qpG9gzDJvWXiMmh?=
 =?us-ascii?Q?WsW0nU5WxNuNN5cHEt8SeB22L4ThQjx8noiHrXfv5U4uCGLQoJcH9GcMbHg6?=
 =?us-ascii?Q?qEcxfuc0YasAAsmEJm4KQJkn/UBdJFHZQLwz86H/9LN4RFvBdv3dGn+Ok8Uk?=
 =?us-ascii?Q?n5mlGuDItDMZvB8pwK7yKlr6AhURqyXlKVScDRiA3TMoFcDF5sK9SKl3jV5N?=
 =?us-ascii?Q?d2X9uqfnpEq1W4GjOykOap1bDARnAerwrqDZfS8xhL5T/vBMdRszTV4xEIZM?=
 =?us-ascii?Q?OFGnH/ViR966sqbe8EJpg/QIXOfvgjlPBeUv2ojvI9HKCA09BQ1F6q+luBi0?=
 =?us-ascii?Q?NQhSnvTk8/VVhIrGKsTLCI8Dqj9hJzEb17zXfgn1jyVI2vB8+MDkq0cZhmg7?=
 =?us-ascii?Q?0qWycEilLnXWwy0IvxgHH904QsYWaxlUai7Nhoe6NgXt05/WBfSXjOwarCIn?=
 =?us-ascii?Q?UIwM20RYmnA6KcYvdaHoP5z54QtcgZTTFS7WCqpdvnE2E/faSUSIoGyzvo57?=
 =?us-ascii?Q?AyeJ3hDSIcz4Kr1X4P+qFi17FgvHr/GwF9J/bxXYUqLqmKDl7wzcFwXnmAkQ?=
 =?us-ascii?Q?VeEWqytrQENTL27hRbYuK8V7yXfMQLDcWzP4lX2/Cs/491eLMSThvq2RfqYE?=
 =?us-ascii?Q?gEzMX9Xw/M2vWD1nOWHnRczRCx0SR2Y=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f32ca30b-0013-4794-cdec-08def8b5868c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 21:06:06.6411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3y9DQiWyBpxBTv2HkoHWpUUlryk9s+b+Ho3ufpHo8tr3SjMQa1fVplGYEMf0RYWAueEOT0RT4lJCKh/8/J2zvqqroMc+S5FELG4dZyDGsSRr1xnQM3e0IKkmDIIuCgN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9994

On Thu, Aug 13, 2026 at 12:56:57AM +0900, Koichiro Den wrote:
> Hi,
>
> This is v5 of the dw-edma dynamic-append work originally proposed by
> Frank Li in his RFT:
>
>   https://lore.kernel.org/r/20260109-edma_dymatic-v1-0-9a98c9c98536@nxp.com/
>

Can you post first 10 patches, which I already reviewed. So vinod may pick
up early.

So I can continue review left patches. Otherwise, I need go though it to
find start point.

Frank

> The driver currently treats each linked list as a finite transfer and
> waits for completion before publishing more work. This series turns the
> list into a circular producer/consumer ring and lets LL channels accept
> new requests while running.
>
> The motivation and hardware observations are unchanged since v2, linked
> below. v5 mainly addresses feedback from Frank and Sashiko. It adds no
> new patches.
>
> With multiple dmaengine descriptors in one ring, entry reclamation and
> descriptor completion need separate boundaries. The series records
> IRQ-paired LLP samples, uses a conservative running boundary for both
> eDMA and HDMA, and centralizes when a stopped channel needs another
> doorbell.
>
> The recovery patches add an opt-in safeguard for eDMA with direction
> reset operations. On one integration, sustained multi-channel traffic
> [1] could leave a channel stopped with pending entries. Repeated
> doorbells did not restart it, while toggling ENGINE_EN did. Doorbell
> timing remains the leading suspect: under heavy multi-channel load,
> channel-status updates visible to software appear to lag internal
> start/stop transitions. That said, the exact trigger is still unknown.
> Any insight from Synopsys would be greatly appreciated. Recovery was not
> entered in the fio/nvmet_pci_epf tests below.
>
>
> Base
> ====
>
> This series is based on dmaengine/next:
> commit 0d995da5fb97 ("dmaengine: dw-edma: Mark emulated IRQ as level-triggered")
>
>
> Re-testing with v5
> ==================
>
> I re-tested v5 on the following three testbeds:
>
> - eDMA: RK3588 Rock 5B, DWC PCIe v5.60a
>         R-Car S4, DWC PCIe v5.20a
> - HDMA: SpacemiT K3, DWC PCIe v6.30a [2]
>
> 1. fio
>
>    The fio setup uses nvmet_pci_epf with a null_blk-backed namespace,
>    runtime=30s, ramp_time=5s. The "Before" values reuse the baseline
>    measurements reported with v2. The "After" values are three
>    consecutive v5 runs.
>
>    NOTE: The fio tests use nvmet_pci_epf, which does not keep the DMA
>          engine continuously busy. A workload that rarely lets the
>          engine stop would show the benefit of dynamic appends more
>          directly.
>
>    - eDMA (RK3588)
>
>      NOTE: The eDMA Before results include the separate regression
>            described in [3].
>
>      Summary by group (BW delta %)
>        all          n=26 mean=+1132.8 median=+114.1 min= +50.8 max=+5383.5
>        read         n=14 mean=+2001.7 median=+864.8 min= +56.7 max=+5383.5
>        write        n=11 mean=+103.2 median= +95.4 min= +50.8 max=+180.0
>        qd32         n=16 mean=+1783.5 median=+178.5 min= +82.4 max=+5383.5
>        q1           n= 9 mean= +69.3 median= +60.7 min= +50.8 max=+133.2
>        small 4K     n= 6 mean=+110.7 median= +91.7 min= +60.7 max=+180.0
>        large >=128K n=20 mean=+1439.4 median=+120.4 min= +50.8 max=+5383.5
>
>      Before mean -> After mean (MiB/s)
>        Case                        Before             After              Delta
>        --------------------------  -----------------  -----------------  -------
>        Rnd read     4KB q1  1j         19.2 (sd 7.5)     30.9 (sd 14.0)   +60.7%
>        Rnd read     4KB q32 1j         88.7 (sd 2.1)    164.7 (sd 45.3)   +85.6%
>        Rnd read     4KB q32 4j         88.7 (sd 1.3)    175.3 (sd 65.5)   +97.7%
>        Rnd read   128KB q1  1j      420.0 (sd 134.6)   658.0 (sd 122.6)   +56.7%
>        Rnd read   128KB q32 1j       142.0 (sd 37.7)   2550.0 (sd 49.1) +1695.8%
>        Rnd read   128KB q32 4j        63.7 (sd 10.6)   3028.3 (sd 28.5) +4656.5%
>        Rnd read   512KB q1  1j       572.0 (sd 35.8)    933.0 (sd 23.6)   +63.1%
>        Rnd read   512KB q32 1j        66.8 (sd 10.8)   3011.0 (sd 28.0) +4407.5%
>        Rnd read   512KB q32 4j        55.4 (sd 12.0)   3039.7 (sd 42.3) +5383.5%
>        Rnd write    4KB q1  1j         20.7 (sd 7.0)     33.8 (sd 11.6)   +62.9%
>        Rnd write    4KB q32 1j         42.5 (sd 0.9)    117.7 (sd 11.0)  +177.1%
>        Rnd write    4KB q32 4j         41.7 (sd 1.6)    116.7 (sd 12.4)  +180.0%
>        Rnd write  128KB q1  1j       330.0 (sd 90.1)    512.7 (sd 79.5)   +55.4%
>        Rnd write  128KB q32 1j      624.0 (sd 111.5)   1306.0 (sd 58.9)  +109.3%
>        Rnd write  128KB q32 4j       659.3 (sd 61.8)   1288.3 (sd 67.4)   +95.4%
>        Seq read   128KB q1  1j       260.7 (sd 25.8)    608.0 (sd 48.0)  +133.2%
>        Seq read   128KB q32 1j       149.7 (sd 30.9)   2539.0 (sd 62.2) +1596.4%
>        Seq read   512KB q1  1j       578.0 (sd 32.2)    923.7 (sd 21.0)   +59.8%
>        Seq read   512KB q32 1j        65.0 (sd 10.6)   3012.7 (sd 32.6) +4534.9%
>        Seq read     1MB q32 1j        57.3 (sd 18.8)   3032.7 (sd 44.3) +5192.6%
>        Seq write  128KB q1  1j       272.3 (sd 62.0)    493.7 (sd 95.6)   +81.3%
>        Seq write  128KB q32 1j      597.0 (sd 105.7)   1306.3 (sd 57.7)  +118.8%
>        Seq write  512KB q1  1j       476.7 (sd 26.7)    719.0 (sd 40.1)   +50.8%
>        Seq write  512KB q32 1j       710.7 (sd 44.0)   1296.3 (sd 60.6)   +82.4%
>        Seq write    1MB q32 1j      546.0 (sd 100.4)   1212.3 (sd 53.4)  +122.0%
>        Rnd rdwr  4K..1MB q8  4j      247.3 (sd 16.3)    971.7 (sd 50.5)  +292.9%
>
>    - HDMA (SpacemiT K3)
>
>      Summary by group (BW delta %)
>        all          n=26 mean= +90.2 median=+104.2 min= -23.5 max=+177.6
>        read         n=14 mean= +80.8 median= +79.3 min= -23.5 max=+177.6
>        write        n=11 mean= +97.7 median=+137.0 min= -21.0 max=+152.1
>        qd32         n=16 mean=+115.9 median=+113.7 min= +68.0 max=+177.6
>        q1           n= 9 mean= +39.1 median= +10.0 min= -23.5 max=+152.1
>        small 4K     n= 6 mean= +99.2 median=+113.7 min= +10.0 max=+177.6
>        large >=128K n=20 mean= +87.5 median=+102.6 min= -23.5 max=+152.1
>
>      Before mean -> After mean (MiB/s)
>        Case                        Before             After              Delta
>        --------------------------  -----------------  -----------------  -------
>        Rnd read     4KB q1  1j         52.5 (sd 3.5)      64.0 (sd 9.3)   +21.9%
>        Rnd read     4KB q32 1j       108.1 (sd 90.9)    300.0 (sd 30.3)  +177.6%
>        Rnd read     4KB q32 4j       117.0 (sd 84.9)    302.7 (sd 30.0)  +158.6%
>        Rnd read   128KB q1  1j      835.7 (sd 139.6)   639.0 (sd 122.0)   -23.5%
>        Rnd read   128KB q32 1j       802.7 (sd 67.7)   1620.7 (sd 28.0)  +101.9%
>        Rnd read   128KB q32 4j      931.3 (sd 262.1)   1630.3 (sd 43.9)   +75.1%
>        Rnd read   512KB q1  1j      411.0 (sd 144.0)   867.0 (sd 132.9)  +110.9%
>        Rnd read   512KB q32 1j      969.0 (sd 210.7)   1628.3 (sd 42.2)   +68.0%
>        Rnd read   512KB q32 4j      889.7 (sd 298.0)   1633.7 (sd 51.4)   +83.6%
>        Rnd write    4KB q1  1j        46.0 (sd 15.5)      50.6 (sd 7.3)   +10.0%
>        Rnd write    4KB q32 1j        117.7 (sd 4.0)     246.3 (sd 0.6)  +109.3%
>        Rnd write    4KB q32 4j        113.0 (sd 5.3)     246.3 (sd 0.6)  +118.0%
>        Rnd write  128KB q1  1j      606.7 (sd 149.0)    479.3 (sd 38.8)   -21.0%
>        Rnd write  128KB q32 1j      533.6 (sd 512.3)    1264.3 (sd 0.6)  +137.0%
>        Rnd write  128KB q32 4j      526.0 (sd 514.9)    1265.3 (sd 0.6)  +140.6%
>        Seq read   128KB q1  1j      626.3 (sd 247.5)   624.7 (sd 118.7)    -0.3%
>        Seq read   128KB q32 1j       783.3 (sd 51.1)    1605.7 (sd 6.0)  +105.0%
>        Seq read   512KB q1  1j      464.0 (sd 191.5)    943.7 (sd 47.5)  +103.4%
>        Seq read   512KB q32 1j      918.3 (sd 241.8)    1602.7 (sd 2.5)   +74.5%
>        Seq read     1MB q32 1j      918.7 (sd 290.5)    1604.7 (sd 0.6)   +74.7%
>        Seq write  128KB q1  1j       611.0 (sd 79.8)   600.7 (sd 125.5)    -1.7%
>        Seq write  128KB q32 1j      521.8 (sd 515.3)    1264.0 (sd 1.0)  +142.2%
>        Seq write  512KB q1  1j      328.3 (sd 268.7)     827.7 (sd 7.4)  +152.1%
>        Seq write  512KB q32 1j      519.6 (sd 516.6)    1263.3 (sd 2.9)  +143.1%
>        Seq write    1MB q32 1j      515.1 (sd 517.8)    1264.7 (sd 0.6)  +145.5%
>        Rnd rdwr  4K..1MB q8  4j      355.3 (sd 64.7)     851.3 (sd 9.2)  +139.6%
>
> 2. pci_endpoint_test
>
>    READ_TEST and WRITE_TEST passed with v5 on all three testbeds.
>
> 3. R-Car S4 (PCIe Gen4 x2, DWC PCIe controller v5.20a, eDMA) stress
>
>    The non-upstream NTB transport/netdev saturated four HW channels in
>    each direction concurrently from multiple QPs. With v5, it still
>    reached EP->RC 19.5 Gbit/s and RC->EP 17.3 Gbit/s with iperf3 -ub0,
>    while keeping the DMA controller almost continuously busy.
>
>
> [1] The patch set posted at:
>     https://lore.kernel.org/r/20260810165136.2292436-1-den@valinux.co.jp/
>     makes it possible to impose such a heavy load on multiple hardware
>     channels, keeping one or more channels busy almost continuously.
>     Under this load, the odd stall can be observed roughly once every
>     ten to several tens of seconds. The recovery mechanism in this
>     series detects and resolves the situation automatically. The upper
>     layer sees only a brief but unavoidable performance hiccup.
>
> [2] K3 was tested on an Ubuntu kernel with the prerequisite patches
>     backported (+ some tweaks on top), not directly on the upstream
>     base. The "Before" and "After" kernels differ only by this series.
>
> [3] The current base includes commit 35de39e4511f ("dmaengine: dw-edma:
>     Defer channel IRQ handling to workqueue"), which defers channel IRQ
>     handling to an unbound workqueue. Under CPU pressure, some workloads
>     can see delayed completion processing and idle gaps between
>     descriptors. Dynamic appends largely hide those gaps by keeping the
>     engine fed.
>
>     A BH workqueue would improve the nvmet_pci_epf workload, but it is
>     not a complete replacement because BH workqueues are per-CPU.
>     Retaining cross-channel CPU distribution would require the driver to
>     choose target CPUs and account for housekeeping masks and CPU
>     hotplug. That is too much complexity for a quick fix, so I have not
>     posted a separate change.
>
>     This partly explains the unusually large eDMA gain in these tests.
>
>
> Best regards,
> Koichiro
> ---
> Changes in v5:
>   - Drop the unused event_scope, which should've been dropped in v4.
>     (Frank)
>   - Permit one eDMA restart after each software-confirmed STOP boundary,
>     avoiding a race between a STOP transition and software clearing its
>     interrupt status. (Sashiko)
>   - Keep direction recovery active after a reset timeout until the
>     engine is rebuilt and re-enabled. (Sashiko)
>   - Fix the delayed-recheck deadline calculation, reject an all-1's
>     DMA_LLP value, and export LL event enum values to the trace format.
>     (Sashiko)
>
> Changes in v4:
>   - Use spinlock_t for LL event serialization, select the event lock
>     through a per-channel pointer, and use the common accessor in both
>     interrupt providers. (Frank)
>   - Put the remote LL publication read-back back in the high-level
>     doorbell helper, while keeping the provider callback as a raw
>     doorbell write. (Frank)
>   - Arm the stopped-tail recheck after a stopped channel is kicked,
>     reserve its zero sentinel across jiffies wrap, and keep the recheck
>     available without optional direction recovery. (Sashiko)
>   - Keep retrying failed direction resets with cancelable delayed work
>     instead of giving up after a fixed number of attempts. (Sashiko)
>   - Other smaller fixes, patch-ordering changes, and wording updates are
>     listed in the per-patch changelogs. (Frank, Sashiko)
>
> Changes in v3:
>   - Main changes:
>     * Serialize IRQ event capture and ABORT handling with channel restart,
>       so deferred events cannot cross into a later hardware run. (Sashiko)
>     * Record each descriptor's physical LL range and validate it before
>       consuming IRQ-paired progress. Keep ring accounting valid across
>       termination, abort, and full resynchronization. (Frank, Sashiko)
>     * Rework stopped-tail and STOP/PAUSE handling: re-sample LLP before
>       restart, add one bounded eDMA recheck, and drain published entries
>       before completing a request. (Frank, Sashiko)
>     * Move LL interrupt placement into the common core and use the same
>       four-entry interval for eDMA and HDMA. (Frank)
>     * Restrict recovery to providers with usable direction-reset
>       operations and serialize it with IRQ/ABORT handling and teardown.
>       Rebuild all exposed LL contexts and flush remote LL writes before
>       re-enabling the engine. (Sashiko)
>   - Many other smaller fixes, refinements, and patch reorganizations
>     came from the v2 review, especially Sashiko's feedback. Each patch
>     has its own changelog below the --- separator, so the details are
>     not repeated here.
>
> Changes in v2:
>   - v2 is a substantial rework; per-patch changelogs contain the details:
>     * Rebased onto dmaengine/next.
>     * Moved the remaining v1 fixes and state serialization changes into
>       the independent groundwork series, now merged in the base.
>     * Reworked ring progress around IRQ-paired LLP samples, conservative
>       running boundaries, and stopped-tail reconciliation.
>     * Reworked STOP/PAUSE handling and added full ring resynchronization
>       plus optional direction recovery before enabling dynamic
>       submission.
>     * Updated trace support for the reworked paths and added engine
>       recovery tracing.
>
> v4: https://lore.kernel.org/r/20260729143036.3087722-1-den@valinux.co.jp/
> v3: https://lore.kernel.org/r/20260727170323.2321369-1-den@valinux.co.jp/
> v2: https://lore.kernel.org/r/20260723084150.521366-1-den@valinux.co.jp/
> v1: https://lore.kernel.org/r/20260615154111.2174161-1-den@valinux.co.jp/
>
>
> Frank Li (5):
>   dmaengine: dw-edma: Add dw_edma_core_ll_cur_idx() to get current LL
>     entry index
>   dmaengine: dw-edma: Make DMA link list work as a circular buffer
>   dmaengine: dw-edma: Move callback result helper before LL helpers
>   dmaengine: dw-edma: Dynamically append requests while running
>   dmaengine: dw-edma: Add trace support
>
> Koichiro Den (19):
>   dmaengine: dw-edma: Add dw_edma_core_ll_clear() to clear LL
>     control-word
>   dmaengine: dw-edma: Factor out linked-list transfer start
>   dmaengine: dw-edma: Dispatch DONE interrupts by channel request
>   dmaengine: dw-edma: Centralize LL doorbell decisions
>   dmaengine: dw-edma: Prepare LL progress event handling
>   dmaengine: dw-edma: Prepare deferred IRQ reporting for LL events
>   dmaengine: dw-edma: Prepare LL kicks for event serialization
>   dmaengine: dw-edma: Serialize LL event capture with channel kicks
>   dmaengine: dw-edma: Keep channels stopped while ABORT is pending
>   dmaengine: dw-edma: Reclaim issued descriptors from IRQ-paired LL
>     progress
>   dmaengine: dw-edma: Add LL interrupt placement policy
>   dmaengine: dw-edma: Recheck stopped LL channels before restart
>   dmaengine: dw-edma: Use HDMA watermarks as progress events
>   dmaengine: dw-edma: Recover stopped channels from tx_status()
>   dmaengine: dw-edma: Make the LL ring reset a full channel resync
>   dmaengine: dw-edma: Drain LL entries for STOP and PAUSE
>   dmaengine: dw-edma: Add engine reset and enable operations
>   dmaengine: dw-edma: Add engine recovery infrastructure
>   dmaengine: dw-edma: Detect and recover a stalled eDMA engine
>
>  drivers/dma/dw-edma/Makefile          |    2 +
>  drivers/dma/dw-edma/dw-edma-core.c    | 1610 ++++++++++++++++++++++---
>  drivers/dma/dw-edma/dw-edma-core.h    |  161 ++-
>  drivers/dma/dw-edma/dw-edma-trace.c   |    4 +
>  drivers/dma/dw-edma/dw-edma-trace.h   |  176 +++
>  drivers/dma/dw-edma/dw-edma-v0-core.c |  202 +++-
>  drivers/dma/dw-edma/dw-hdma-v0-core.c |  164 ++-
>  drivers/dma/dw-edma/dw-hdma-v0-regs.h |    1 +
>  include/linux/dma/edma.h              |    2 +-
>  9 files changed, 2050 insertions(+), 272 deletions(-)
>  create mode 100644 drivers/dma/dw-edma/dw-edma-trace.c
>  create mode 100644 drivers/dma/dw-edma/dw-edma-trace.h
>
> base-commit: 0d995da5fb97e8c312834575604d4423eb6225b7
> --
> 2.51.0
>
