Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793128571;
	b=5Byajbi8TD/arAtdNo3bZj8TL0uOHlKIUnk8C6Vy+TAWgwSObKlt8V1OGFJ2iPE6xV1/
	 bNfu8hZ7BpkDpAhAq//wKNUEw1Sf9BK0uVeIy8Sy3SEsbqGP1Utg1FphYNDwJ3gkGMR8P
	 IhSWI5O/3LcX8cmEaoIBs6qgi7CxO34B5zKVjfkm0bX2j9ywApV5qy2MB12FJAaCsaSOs
	 cOrYHNGrp5IlMSCUu4vnXSsCQUNDjI0K6ikOBdPWtUr7mIFq2+MFqruZiOX9tLZ6NCmA5
	 pYewmd7xeaQB1NtF1rw2iaaVnawbS3+0jUjKJTFciXbupwWlCcYA15MEOyoT2zENBWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793128571;
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
	bh=+eBhFZLyoSc6n/KFTvDjErkOO89yNulCjeo1ukLR0Zc=;
	b=Q4DxlZ/CHmbdRVmngXaCzc7I23Gv+r6te9PRADX4AqGah2lhuQkCai2qY00ANY00C56V
	 sxR17sgnGm6rwymRVgsBA1TT571BPr5LXUnB+JIWzgq2UKEmSMj+bXUDTbo9eOHfFAlVa
	 9EsijpnJM1zzdqUYKtRko7IVm7O4vUh+xT2QkZjhKB69Vh3dxsf0kQx8jag4O03yTq9RA
	 uBsqFjfVThn/2K0jwy9rQYHFduHolo+Y+CNn5cluapSKVeoHnE2qW4UkcX4a5SF1pLJrH
	 Fos/r2nQ3mAkOcXtWYdavGPomXSVg0dvTVY311EpWwIz+QXlF58JhOgFo4cn+HDiGxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=reZFWiep;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.19
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011019.outbound.protection.outlook.com [40.107.130.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B0F606A31A;
	Tue, 27 Oct 2026 19:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3B0F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=reZFWiep
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNU463jl0IajdpYAxu0BUl2FSHQf8JJeLv/vLN5KtGAJ7R2zDTfzxXMIK6JjEmstoh/7NbUP7cKw+YuU6tvevwdT/F/dt0mz6A7iIoyTsnXphR+spMJR+1pqs5WckDKlJon6P/s0YoYFaEusY+nsqQPemC3mK4KTPKZ1GlsTJmbtSrQKzm18hRta/RUpUUCwucNtj/0BXyIDCjmzHktOT4Jc40jSjGNUvq9nIm4TNkXj+P76tppZAIY/i9yCqTQ7ep9faKVLVTkoIT2DKZZ9x1iVjy0k7bgzqLb8C9Uq9x4v9sjlTK3PVQ6FnRVM3v21PqGjO+Gvpnfcl9yeXtnZ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eBhFZLyoSc6n/KFTvDjErkOO89yNulCjeo1ukLR0Zc=;
 b=EmP9WHmIv+coSkT3YzXpPLDYhyzxVE2/qi8mizwMT8+dh1WWfRkLRoTWeI7QrCgezDHB2IgsdBkoHcQKu1cMMCGEFzVsSpExIGTw7Hn68PEEGPIezMLnLg4btqMrkaONUeahzDrXa3MQS9fuTHIBpi1aNa/eFI8OI5qVKi7e9nf80Z/WXO93VIETfZ0s9uBSTuNdRiJFuKPGx8SMzQnSS4v5N6HgJyprsK9HiXQJ9QVxyvsBOrf8RleGGjXXIn3ANIiWXEoH96Ipx7fD8Eegl2BCUoTsSPFRxJbhYkgOd7kYHtrM50hNet3+eXohmig1F5tKiorYN1eXzzO+jKvqfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eBhFZLyoSc6n/KFTvDjErkOO89yNulCjeo1ukLR0Zc=;
 b=reZFWiepdhCZS/xnLfEjzp6Kledum+PZ0rnVTw91x9VQYDfj7kSLN0xKt3MNDY8KkkJddltu8WH1fOfrq6uC7IowsIjkFcbLhDlFQwFqoR4deWrV4v9alNiWtKMroogcz4rCFiXNjS4HG9RLLNOER5LbgVwrKxiTgP2oKIvbkBsR1shS5qfqKcF3HnATItSK4UoPjgPcBiDG5cegMeG5iqN8e6DcrbJOIPoV16/5xyy3K5gzMLOCbagSskmxEEK1jKF4UyXmyQYSa1+9k5eB/MNld+N0UKE8OFWM/PdBIBHCIhTUtnqKq52TBhMSCeVwqd+psGgp76PN2nuU4JCZpg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB11545.eurprd04.prod.outlook.com (2603:10a6:800:2fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 19:16:06 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 19:16:05 +0000
Date: Tue, 27 Oct 2026 15:15:57 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: "Jeff C. Jensen" <kernel@nullptr.com>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Suraj Gupta <suraj.gupta2@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Alex Bereza <alex@bereza.email>,
	Folker Schwesinger <dev@folker-schwesinger.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dmaengine: xilinx_dma: Allocate AXI DMA segments in
 ring order
Message-ID: <auD4bYzlqSBdR7hP@lizhi-Precision-Tower-5810>
References: <20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com>
 <20261022-xilinx-dma-work-v1-3-20faea2e7a80@nullptr.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-xilinx-dma-work-v1-3-20faea2e7a80@nullptr.com>
X-ClientProxiedBy: PH8P222CA0011.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::35) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB11545:EE_
X-MS-Office365-Filtering-Correlation-Id: 771cfc1b-552c-444c-e496-08df345ebf9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|19092799006|366016|376014|1800799024|23010399003|261026121527099003|11063799006|4143699003|56012099006|261021121427099003|261022105027099003|261021123027099003|261009223027099003|10067099003|22082099003|18002099003|6133799003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	hg2B0ji8A00qpt+uAJZ322tqWRwBpQ3dV4YT8Y6/UPp7sMRP7s9HjmPmnxCXXD1QjRxc2+ofR4HaPp7yttW+14xyQVDZK1jbOc0CX7T2JXlynPpUNP4XGjLuEX6K0VFq6+tdIPT3O7LG/OH5dXnOJtxzE3PJPgfmF+WzzdhCfjCcE7jufCHE0zM/QKDvRqDfNu4hlhVCZridTGKrCeCwevCgDNW/rRt88uzGRUAA9XfWmhxXg65ajHBtnPWxHRSeUNaEks2WocV8HcWHH6bLfKkVT3rJyiRYW7KqjBMgKQGTSb+6NSBY9OrJ82kNQ/xpngxWR0yjY0WcGvFOXzvQDotKWLDMxv5mJ05Zqjkr0SLJwGLqG96Ld/wd3qZPGluZmIq5BPwx0i+lidMrpg6Gu9Jwrsy0hxVmjkmmO6dhMMnDAuo/4i3Nd4TCjPicPTqYS7fFPYBqeuP/sPoItJCazr0YDOeNMA84TgJH5I3Xm09YTIO5nGxLJTVug+QfrfBhlIJSMNxFyJQ0JN9Jo+ZCKUlgVaDaW9Njbb6QOaLYpj1ZEEPpVX2Gsjy4kXF2VRCvwhiFGYCaF9UoklYTmpx5vltNC+Fi6oxROG9Uj68Q+7f0cDwncCJWhQB7XACvPtt8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(366016)(376014)(1800799024)(23010399003)(261026121527099003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261022105027099003)(261021123027099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kRlGp2sWoHPGMtN0vc18wU7XuTtwtwmfTu3ephsk9WYelIH5DetDZWax2t4j?=
 =?us-ascii?Q?XckvMA0pvBcVL7bV5eHOeeroACE5ddpfbi4aZL20WPAaQTgXUncFRX/bBPZA?=
 =?us-ascii?Q?BSBquaOPticq5Kbcgf+P28mTYYre8cpmvt91hZl7ffcmFKTu5oxZQk04c5F6?=
 =?us-ascii?Q?kF20pveU4/CMQWUSF//FonQ4XAgb2vVJoNjjp1PrBrlqmDeXTkF8pkTVJJ6m?=
 =?us-ascii?Q?R5oaMww9kagDKAlFika+JiQM+iR0DL+NbsrUcMR2+iONM2NIaTeDiEX+21Xy?=
 =?us-ascii?Q?WBHwk2iVOXXoq/G07UmaooZUCjIwuwwA51C3sf5KF+SnJk2KltInkaUmaiCJ?=
 =?us-ascii?Q?yx8PPCWIRvcW6Bfoz8+Z/LVGsnR1SVQ6amLjlDsYO5g2vw1bBFwXZ4xEnb/S?=
 =?us-ascii?Q?jbM4/FmnH2vEtRa4bQw6yVYeLfyxJGtrkLL0shjj5P+SgDpOXmByhqDk1kMz?=
 =?us-ascii?Q?FP3XlZwEoJGY+aEx/u2XDHtvWKXO85x9PpShVjdn8oz0jR8zoPvh8vR8Q/8+?=
 =?us-ascii?Q?EoWQRXv19lWAPsaMddF1EgN1ZoQx6BzkZlRzZNAnfh93yxWRNExAHUMS2F/+?=
 =?us-ascii?Q?KJzBdZFqRqIctaMZDggsWhUSRPPdyPFchs/1w9DmKyZJ/e5RCDLjhBgHwvHt?=
 =?us-ascii?Q?Qoj1IqZo09HUDNLjOQBsb4TD4pFG28dKbDvvFEQTxItiqZkWQbhSP5kugGHi?=
 =?us-ascii?Q?o/TdwvAvgQt/d8aBXE2hO62Tycjid/DyokDjNdmHeDmh4+PzF+VkkP51Ye64?=
 =?us-ascii?Q?wD9eG0JjG5THsgoA1+lSD6IQnNNGdWikLpq4VbUBURoaLuVoNwUsuANFzpSb?=
 =?us-ascii?Q?BpDy8lG7S2fnJaI5GzpxaZNZmHfBgbNZ0yHi4vl+APRptb6y9tHFKdXq3D1i?=
 =?us-ascii?Q?LZ9XGcNOdbbd/u9XPidR53boUK2untyWUQNLNtQBw2Pca4Tg6NwBOw2ZX6cW?=
 =?us-ascii?Q?0isgqvhO9INz2Nisiesp2PvPxv790TYhnaFgZ1Lw8y9mbOUfbOY/UPbJFIpR?=
 =?us-ascii?Q?ViMFaVWpc2o7/AlobJKMLRyXSz/f2z4vBgc46x5LujnCKz0U292gj9yp9Mga?=
 =?us-ascii?Q?f/lNdjL6PjyMxzjZx7en3FvW7XDgtgl7kXUfTgXENTDWN+x3l5pBX5fcVF8q?=
 =?us-ascii?Q?CkuwdJf0OiDED4y8+JG8uG/pAgYrtw29QJyV4L1SIEnTgDo17+YhhEAk1Qz6?=
 =?us-ascii?Q?p2/JlOryPo1bkQWoA/zEUZmI0bJMLrqF3yGxBN9rNoWlrZP54GBG18nN65cv?=
 =?us-ascii?Q?qEE9mT1hI0Nu/5M1rTVu7BaDTDwGUZV046UbfTEUdDb9Gb66cWdJ97jtcsoS?=
 =?us-ascii?Q?kGzYT08OtNe51v/QE6QfBmyv5y46cOrMlTKFJOvHK2JJNdrctKMZBfm8NrwZ?=
 =?us-ascii?Q?Lwx6Ih+9Cw5GMFplraLTl3pCvesGUNL4v2Jbcoev/AeZgfxcW0FwLWSJ/i4x?=
 =?us-ascii?Q?Ooznt9j3aTOVcT9t69TGKdb2mu2WweI8HFKqvKm3SbF3mv83TuKiFSp1GHTX?=
 =?us-ascii?Q?ZSt1YoaI0cGh49JI1n/mq8G5vn3JBCsglkEjKZhmV5/aEeGuqQKxjHtIbITW?=
 =?us-ascii?Q?hvBHXNfSlvVLU4D6P+d2Usk3ahALPEdBdbWJnNOnVwMoAHcowNgo+h1No5J8?=
 =?us-ascii?Q?spKhoAKH8zDv0/6eIS2/RROE1hRZAzKZzYIylPUkrZ+BlIB8dzPatIzaEfXf?=
 =?us-ascii?Q?bO3j7iDNy6Ffq9+0cxeJdLyva/0vKakkzSv+tE/91a6s7DVYxYhOkQgrVKkz?=
 =?us-ascii?Q?MbwbjDEb9J+HweTILNI0FulEHHA73b6ux/l50Fn3hO8VYaqft2c9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 771cfc1b-552c-444c-e496-08df345ebf9d
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 19:16:05.7960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Rpm6P0X74KeFfNSjkYmJAZtUYpVcU6yyF4ZPEdg+6ljhnai31HnNx023sQ4BgW304lRnhQKegkVQFNoI83GufBL9ib/n0DdptM9L2tIs5kv4D25MvW1uXqU4l6n3cPo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11545

On Thu, Oct 22, 2026 at 03:11:32PM -0700, Jeff C. Jensen wrote:
> The AXI DMA driver builds a static ring of hardware descriptors
> (segments) when the channel is allocated, each linked to the next in
> pool order, and the engine follows those links.
> xilinx_dma_prep_slave_sg() writes no next pointers within a descriptor,
> and a descriptor appended while the engine is running is reached through
> the next pointer of the previous tail. Segments are handed out from
> free_seg_list, so this only works while the free list stays in pool
> order.
>
> Commit cee9c863ee68 ("dmaengine: xilinx_dma: Fix hardware buffer
> descriptor reuse order") fixed one way the free list falls out of that
> order. As the Sashiko review of that patch pointed out [1], others
> remain:
>
>  - xilinx_dma_chan_desc_cleanup() drops chan->lock while it runs a
>    completion callback, and frees the descriptor afterwards. If the
>    channel is terminated in that window, the newer segments are returned
>    first and the oldest descriptor's segments end up at the tail of the
>    free list.
>
>  - A preparation that runs out of segments returns its partial
>    allocation to the tail of the free list, possibly after a completion
>    on another CPU has freed newer ones. It does so without taking
>    chan->lock, so it can also corrupt the list.
>
>  - A submission rejected because a cyclic transfer is running frees its
>    segments while older ones are still in use.
>
> Once the free list and the ring disagree, a later descriptor gets
> segments that are not adjacent in the ring, and the engine follows a
> next pointer into a cleaned segment with a zero length field. With a
> delay added to widen the first window, a receive stream fails right
> after a terminate:
>
>   xilinx-vdma 40400000.dma: Channel 7a90d35b has errors 10, cdr 3f053780 tdr 3f059a00
>
> Rather than keeping the free list in order on every path, allocate by
> ring position. Count the segments a transaction needs, then reserve that
> many consecutive positions, starting at a cursor, under chan->lock: all
> of them or none. A bitmap tracks the positions in use. Allocation no
> longer depends on the order in which segments are freed, so neither the
> terminate path nor the completion path can disturb it. The count uses
> xilinx_dma_calc_copysize(), like the preparation loops, so the two
> always agree.
>
> The slave-sg, cyclic and dma_vec paths all count and reserve before
> building a descriptor, so a failed preparation leaves the channel
> unchanged. A submission rejected on a busy cyclic channel cancels its
> reservation and rewinds the cursor under the same lock.
>
> This relies on commit 7ed1e3070c9b ("dmaengine: xilinx_dma: Fix hardware
> buffer descriptor chain after cyclic DMA") to restore the segment links
> after a cyclic transfer. The AXI MCDMA pool keeps its free list and is
> not changed.
>
> Link: https://lore.kernel.org/all/20260817094004.A74621F000E9@smtp.kernel.org/ [1]
> Fixes: 23059408b6a3 ("dmaengine: xilinx_dma: Fix race condition in the driver for multiple descriptor scenario")
> Fixes: c0bba3a99f07 ("dmaengine: vdma: Add Support for Xilinx AXI Direct Memory Access Engine")
> Fixes: 92d794dfb699 ("dmaengine: vdma: Add support for cyclic dma mode")
> Assisted-by: Claude:claude-fable-5-1
> Signed-off-by: Jeff C. Jensen <kernel@nullptr.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/xilinx/xilinx_dma.c | 279 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 224 insertions(+), 55 deletions(-)
>
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index aa714effd10d..805cd3e2bc27 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -33,6 +33,7 @@
>   *
>   */
>
> +#include <linux/bitmap.h>
>  #include <linux/bitops.h>
>  #include <linux/dmapool.h>
>  #include <linux/dma/xilinx_dma.h>
> @@ -390,7 +391,9 @@ struct xilinx_dma_tx_descriptor {
>   * @pending_list: Descriptors waiting
>   * @active_list: Descriptors ready to submit
>   * @done_list: Complete descriptors
> - * @free_seg_list: Free descriptors
> + * @free_seg_list: Free AXI MCDMA descriptors
> + * @seg_used: AXI DMA segments in use, indexed by ring position
> + * @seg_next: Ring position the next AXI DMA reservation starts at
>   * @common: DMA common channel
>   * @desc_pool: Descriptors pool
>   * @dev: The dma device
> @@ -430,6 +433,8 @@ struct xilinx_dma_chan {
>  	struct list_head active_list;
>  	struct list_head done_list;
>  	struct list_head free_seg_list;
> +	DECLARE_BITMAP(seg_used, XILINX_DMA_NUM_DESCS);
> +	u32 seg_next;
>  	struct dma_chan common;
>  	struct dma_pool *desc_pool;
>  	struct device *dev;
> @@ -706,30 +711,53 @@ xilinx_cdma_alloc_tx_segment(struct xilinx_dma_chan *chan)
>  }
>
>  /**
> - * xilinx_axidma_alloc_tx_segment - Allocate transaction segment
> + * xilinx_axidma_reserve_segments - Reserve a run of AXI DMA segments
>   * @chan: Driver specific DMA channel
> + * @count: Segments needed, at most XILINX_DMA_NUM_DESCS
> + * @start: Ring position of the first reserved segment, set on success
>   *
> - * Return: The allocated segment on success and NULL on failure.
> + * Reserves @count consecutive ring positions starting at @chan->seg_next,
> + * wrapping at the pool end. The engine fetches descriptors in ring order, so
> + * the run cannot be placed anywhere else.
> + *
> + * Return: 0 on success, -ENOMEM when the run is not free. A failure leaves the
> + * ownership bitmap and @chan->seg_next unchanged.
>   */
> -static struct xilinx_axidma_tx_segment *
> -xilinx_axidma_alloc_tx_segment(struct xilinx_dma_chan *chan)
> +static int xilinx_axidma_reserve_segments(struct xilinx_dma_chan *chan,
> +					  u32 count, u32 *start)
>  {
> -	struct xilinx_axidma_tx_segment *segment = NULL;
>  	unsigned long flags;
> +	int ret = -ENOMEM;
> +	u32 i;
>
>  	spin_lock_irqsave(&chan->lock, flags);
> -	if (!list_empty(&chan->free_seg_list)) {
> -		segment = list_first_entry(&chan->free_seg_list,
> -					   struct xilinx_axidma_tx_segment,
> -					   node);
> -		list_del(&segment->node);
> +
> +	for (i = 0; i < count; i++) {
> +		if (test_bit((chan->seg_next + i) % XILINX_DMA_NUM_DESCS,
> +			     chan->seg_used))
> +			goto out;
>  	}
> +
> +	*start = chan->seg_next;
> +	for (i = 0; i < count; i++)
> +		__set_bit((chan->seg_next + i) % XILINX_DMA_NUM_DESCS,
> +			  chan->seg_used);
> +	chan->seg_next = (chan->seg_next + count) % XILINX_DMA_NUM_DESCS;
> +	ret = 0;
> +
> +out:
>  	spin_unlock_irqrestore(&chan->lock, flags);
>
> -	if (!segment)
> -		dev_dbg(chan->dev, "Could not find free tx segment\n");
> +	if (ret)
> +		dev_dbg(chan->dev, "no run of %u free tx segments\n", count);
>
> -	return segment;
> +	return ret;
> +}
> +
> +static struct xilinx_axidma_tx_segment *
> +xilinx_axidma_run_segment(struct xilinx_dma_chan *chan, u32 start, u32 i)
> +{
> +	return &chan->seg_v[(start + i) % XILINX_DMA_NUM_DESCS];
>  }
>
>  /**
> @@ -792,13 +820,18 @@ static void xilinx_mcdma_clean_hw_desc(struct xilinx_aximcdma_desc_hw *hw)
>   * xilinx_dma_free_tx_segment - Free transaction segment
>   * @chan: Driver specific DMA channel
>   * @segment: DMA transaction segment
> + *
> + * Called with chan->lock held, so no reservation sees the segment between its
> + * links being restored and its ownership being released.
>   */
>  static void xilinx_dma_free_tx_segment(struct xilinx_dma_chan *chan,
>  				struct xilinx_axidma_tx_segment *segment)
>  {
> +	lockdep_assert_held(&chan->lock);
> +
>  	xilinx_dma_clean_hw_desc(chan, segment);
>
> -	list_add_tail(&segment->node, &chan->free_seg_list);
> +	__clear_bit(segment - chan->seg_v, chan->seg_used);
>  }
>
>  /**
> @@ -902,6 +935,34 @@ xilinx_dma_free_tx_descriptor(struct xilinx_dma_chan *chan,
>  	kfree(desc);
>  }
>
> +/**
> + * xilinx_dma_cancel_tx_descriptor - Discard a descriptor before submission
> + * @chan: Driver specific DMA channel
> + * @desc: Prepared descriptor
> + *
> + * Called with chan->lock held. On an AXI DMA channel, releases the reservation
> + * of @desc and rewinds @chan->seg_next to its first segment, so that no
> + * cleaned segment is left between two live descriptors. @desc must hold the
> + * most recent reservation on the channel.
> + */
> +static void xilinx_dma_cancel_tx_descriptor(struct xilinx_dma_chan *chan,
> +					    struct xilinx_dma_tx_descriptor *desc)
> +{
> +	struct xilinx_axidma_tx_segment *first;
> +
> +	lockdep_assert_held(&chan->lock);
> +
> +	if (chan->xdev->dma_config->dmatype == XDMA_TYPE_AXIDMA) {
> +		first = list_first_entry_or_null(&desc->segments,
> +						 struct xilinx_axidma_tx_segment,
> +						 node);
> +		if (first)
> +			chan->seg_next = first - chan->seg_v;
> +	}
> +
> +	xilinx_dma_free_tx_descriptor(chan, desc);
> +}
> +
>  /* Required functions */
>
>  /**
> @@ -951,10 +1012,6 @@ static void xilinx_dma_free_chan_resources(struct dma_chan *dchan)
>  	xilinx_dma_free_descriptors(chan);
>
>  	if (chan->xdev->dma_config->dmatype == XDMA_TYPE_AXIDMA) {
> -		spin_lock_irqsave(&chan->lock, flags);
> -		INIT_LIST_HEAD(&chan->free_seg_list);
> -		spin_unlock_irqrestore(&chan->lock, flags);
> -
>  		/* Free memory that is allocated for BD */
>  		dma_free_coherent(chan->dev, sizeof(*chan->seg_v) *
>  				  XILINX_DMA_NUM_DESCS, chan->seg_v,
> @@ -1195,9 +1252,9 @@ static int xilinx_dma_alloc_chan_resources(struct dma_chan *dchan)
>  				((i + 1) % XILINX_DMA_NUM_DESCS));
>  			chan->seg_v[i].phys = chan->seg_p +
>  				sizeof(*chan->seg_v) * i;
> -			list_add_tail(&chan->seg_v[i].node,
> -				      &chan->free_seg_list);
>  		}
> +		bitmap_zero(chan->seg_used, XILINX_DMA_NUM_DESCS);
> +		chan->seg_next = 0;
>  	} else if (chan->xdev->dma_config->dmatype == XDMA_TYPE_AXIMCDMA) {
>  		/* Allocate the buffer descriptors. */
>  		chan->seg_mv = dma_alloc_coherent(chan->dev,
> @@ -1282,6 +1339,98 @@ static int xilinx_dma_calc_copysize(struct xilinx_dma_chan *chan,
>  	return copy;
>  }
>
> +/**
> + * xilinx_axidma_count_split - Count the descriptors a length splits into
> + * @chan: Driver specific DMA channel
> + * @len: Length in bytes
> + *
> + * Splits @len with xilinx_dma_calc_copysize(), so the count equals the number
> + * of segments a preparation builds for @len. Intermediate chunks are rounded
> + * down for alignment, so the count depends on the channel alignment as well as
> + * on @len.
> + *
> + * Return: The descriptor count, which is zero for a zero length, or -EINVAL if
> + * a split makes no progress or @len needs more descriptors than the pool holds.
> + */
> +static int xilinx_axidma_count_split(struct xilinx_dma_chan *chan, size_t len)
> +{
> +	size_t used = 0;
> +	int count = 0;
> +
> +	while (used < len) {
> +		size_t copy = xilinx_dma_calc_copysize(chan, len, used);
> +
> +		if (!copy || count == XILINX_DMA_NUM_DESCS)
> +			return -EINVAL;
> +
> +		used += copy;
> +		count++;
> +	}
> +
> +	return count;
> +}
> +
> +/**
> + * xilinx_axidma_count_sg - Count the descriptors a mapped scatterlist needs
> + * @chan: Driver specific DMA channel
> + * @sgl: Mapped scatterlist
> + * @sg_len: Number of mapped entries in @sgl
> + *
> + * Return: The descriptor count, or -EINVAL if the list splits into no
> + * descriptors at all or into more than the pool holds.
> + */
> +static int xilinx_axidma_count_sg(struct xilinx_dma_chan *chan,
> +				  struct scatterlist *sgl, unsigned int sg_len)
> +{
> +	struct scatterlist *sg;
> +	unsigned int i;
> +	int total = 0;
> +
> +	for_each_sg(sgl, sg, sg_len, i) {
> +		int count = xilinx_axidma_count_split(chan, sg_dma_len(sg));
> +
> +		if (count < 0 || count > XILINX_DMA_NUM_DESCS - total)
> +			return -EINVAL;
> +
> +		total += count;
> +	}
> +
> +	if (!total)
> +		return -EINVAL;
> +
> +	return total;
> +}
> +
> +/**
> + * xilinx_axidma_count_vecs - Count the descriptors an array of DMA vectors needs
> + * @chan: Driver specific DMA channel
> + * @vecs: DMA vectors
> + * @nb: Entry count
> + *
> + * Return: The descriptor count, or -EINVAL if the vectors split into no
> + * descriptors at all or into more than the pool holds.
> + */
> +static int xilinx_axidma_count_vecs(struct xilinx_dma_chan *chan,
> +				    const struct dma_vec *vecs, size_t nb)
> +{
> +	size_t i;
> +	int total = 0;
> +
> +	for (i = 0; i < nb; i++) {
> +		int count = xilinx_axidma_count_split(chan, vecs[i].len);
> +
> +		if (count < 0 || count > XILINX_DMA_NUM_DESCS - total)
> +			return -EINVAL;
> +
> +		total += count;
> +	}
> +
> +	if (!total)
> +		return -EINVAL;
> +
> +	return total;
> +}
> +
>  /**
>   * xilinx_dma_tx_status - Get DMA transaction status
>   * @dchan: DMA channel
> @@ -2050,6 +2199,10 @@ static void append_desc_queue(struct xilinx_dma_chan *chan,
>   * xilinx_dma_tx_submit - Submit DMA transaction
>   * @tx: Async transaction descriptor
>   *
> + * An AXI DMA channel reserves segment runs in ring order, so a transaction must
> + * be submitted, or its rejection handled, before the next one is prepared on
> + * the same channel.
> + *
>   * Return: cookie value on success and failure value on error
>   */
>  static dma_cookie_t xilinx_dma_tx_submit(struct dma_async_tx_descriptor *tx)
> @@ -2060,8 +2213,11 @@ static dma_cookie_t xilinx_dma_tx_submit(struct dma_async_tx_descriptor *tx)
>  	unsigned long flags;
>  	int err;
>
> +	spin_lock_irqsave(&chan->lock, flags);
> +
>  	if (chan->cyclic) {
> -		xilinx_dma_free_tx_descriptor(chan, desc);
> +		xilinx_dma_cancel_tx_descriptor(chan, desc);
> +		spin_unlock_irqrestore(&chan->lock, flags);
>  		return -EBUSY;
>  	}
>
> @@ -2070,13 +2226,13 @@ static dma_cookie_t xilinx_dma_tx_submit(struct dma_async_tx_descriptor *tx)
>  		 * If reset fails, need to hard reset the system.
>  		 * Channel is no longer functional
>  		 */
> +		spin_unlock_irqrestore(&chan->lock, flags);
>  		err = xilinx_dma_chan_reset(chan);
>  		if (err < 0)
>  			return err;
> +		spin_lock_irqsave(&chan->lock, flags);
>  	}
>
> -	spin_lock_irqsave(&chan->lock, flags);
> -
>  	cookie = dma_cookie_assign(tx);
>
>  	/* Put this transaction onto the tail of the pending queue */
> @@ -2254,15 +2410,26 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_peripheral_dma_vec(
>  	struct xilinx_axidma_tx_segment *segment, *head, *prev = NULL;
>  	size_t copy;
>  	size_t sg_used;
> +	u32 start = 0, taken = 0;
>  	unsigned int i;
> +	int needed;
>
>  	if (!is_slave_direction(direction) || direction != chan->direction)
>  		return NULL;
>
> +	needed = xilinx_axidma_count_vecs(chan, vecs, nb);
> +	if (needed < 0)
> +		return NULL;
> +
>  	desc = xilinx_dma_alloc_tx_descriptor(chan);
>  	if (!desc)
>  		return NULL;
>
> +	if (xilinx_axidma_reserve_segments(chan, needed, &start)) {
> +		xilinx_dma_free_tx_descriptor(chan, desc);
> +		return NULL;
> +	}
> +
>  	dma_async_tx_descriptor_init(&desc->async_tx, &chan->common);
>  	desc->async_tx.tx_submit = xilinx_dma_tx_submit;
>
> @@ -2274,10 +2441,8 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_peripheral_dma_vec(
>  		while (sg_used < vecs[i].len) {
>  			struct xilinx_axidma_desc_hw *hw;
>
> -			/* Get a free segment */
> -			segment = xilinx_axidma_alloc_tx_segment(chan);
> -			if (!segment)
> -				goto error;
> +			segment = xilinx_axidma_run_segment(chan, start,
> +							    taken++);
>
>  			/*
>  			 * Calculate the maximum number of bytes to transfer,
> @@ -2305,9 +2470,6 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_peripheral_dma_vec(
>  		}
>  	}
>
> -	if (list_empty(&desc->segments))
> -		goto error;
> -
>  	head = list_first_entry(&desc->segments, struct xilinx_axidma_tx_segment, node);
>  	desc->async_tx.phys = head->phys;
>
> @@ -2324,10 +2486,6 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_peripheral_dma_vec(
>  		desc->async_tx.metadata_ops = &xilinx_dma_metadata_ops;
>
>  	return &desc->async_tx;
> -
> -error:
> -	xilinx_dma_free_tx_descriptor(chan, desc);
> -	return NULL;
>  }
>
>  /**
> @@ -2353,16 +2511,28 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_slave_sg(
>  	struct scatterlist *sg;
>  	size_t copy;
>  	size_t sg_used;
> +	u32 start = 0, taken = 0;
>  	unsigned int i;
> +	int needed;
>
>  	if (!is_slave_direction(direction))
>  		return NULL;
>
> +	/* reserve exactly the segments the loop below builds */
> +	needed = xilinx_axidma_count_sg(chan, sgl, sg_len);
> +	if (needed < 0)
> +		return NULL;
> +
>  	/* Allocate a transaction descriptor. */
>  	desc = xilinx_dma_alloc_tx_descriptor(chan);
>  	if (!desc)
>  		return NULL;
>
> +	if (xilinx_axidma_reserve_segments(chan, needed, &start)) {
> +		xilinx_dma_free_tx_descriptor(chan, desc);
> +		return NULL;
> +	}
> +
>  	dma_async_tx_descriptor_init(&desc->async_tx, &chan->common);
>  	desc->async_tx.tx_submit = xilinx_dma_tx_submit;
>
> @@ -2374,10 +2544,8 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_slave_sg(
>  		while (sg_used < sg_dma_len(sg)) {
>  			struct xilinx_axidma_desc_hw *hw;
>
> -			/* Get a free segment */
> -			segment = xilinx_axidma_alloc_tx_segment(chan);
> -			if (!segment)
> -				goto error;
> +			segment = xilinx_axidma_run_segment(chan, start,
> +							    taken++);
>
>  			/*
>  			 * Calculate the maximum number of bytes to transfer,
> @@ -2409,9 +2577,6 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_slave_sg(
>  		}
>  	}
>
> -	if (list_empty(&desc->segments))
> -		goto error;
> -
>  	segment = list_first_entry(&desc->segments,
>  				   struct xilinx_axidma_tx_segment, node);
>  	desc->async_tx.phys = segment->phys;
> @@ -2429,10 +2594,6 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_slave_sg(
>  		desc->async_tx.metadata_ops = &xilinx_dma_metadata_ops;
>
>  	return &desc->async_tx;
> -
> -error:
> -	xilinx_dma_free_tx_descriptor(chan, desc);
> -	return NULL;
>  }
>
>  /**
> @@ -2456,7 +2617,8 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_dma_cyclic(
>  	struct xilinx_axidma_tx_segment *segment, *head_segment, *prev = NULL;
>  	size_t copy, sg_used, periods;
>  	unsigned int num_periods;
> -	int i;
> +	u32 start = 0, taken = 0;
> +	int i, per_period;
>  	u32 reg;
>
>  	if (!period_len)
> @@ -2471,11 +2633,24 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_dma_cyclic(
>  	if (!is_slave_direction(direction))
>  		return NULL;
>
> +	/* the division bounds per_period * num_periods without overflow */
> +	per_period = xilinx_axidma_count_split(chan, period_len);
> +	if (per_period <= 0)
> +		return NULL;
> +	if ((u32)per_period > XILINX_DMA_NUM_DESCS / num_periods)
> +		return NULL;
> +
>  	/* Allocate a transaction descriptor. */
>  	desc = xilinx_dma_alloc_tx_descriptor(chan);
>  	if (!desc)
>  		return NULL;
>
> +	if (xilinx_axidma_reserve_segments(chan, per_period * num_periods,
> +					   &start)) {
> +		xilinx_dma_free_tx_descriptor(chan, desc);
> +		return NULL;
> +	}
> +
>  	chan->direction = direction;
>  	dma_async_tx_descriptor_init(&desc->async_tx, &chan->common);
>  	desc->async_tx.tx_submit = xilinx_dma_tx_submit;
> @@ -2486,10 +2661,8 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_dma_cyclic(
>  		while (sg_used < period_len) {
>  			struct xilinx_axidma_desc_hw *hw;
>
> -			/* Get a free segment */
> -			segment = xilinx_axidma_alloc_tx_segment(chan);
> -			if (!segment)
> -				goto error;
> +			segment = xilinx_axidma_run_segment(chan, start,
> +							    taken++);
>
>  			/*
>  			 * Calculate the maximum number of bytes to transfer,
> @@ -2537,10 +2710,6 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_dma_cyclic(
>  	}
>
>  	return &desc->async_tx;
> -
> -error:
> -	xilinx_dma_free_tx_descriptor(chan, desc);
> -	return NULL;
>  }
>
>  /**
>
> --
> 2.43.0
>
