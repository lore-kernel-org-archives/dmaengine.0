Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020101.outbound.protection.outlook.com [52.101.229.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91828299A84
	for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 03:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784171069; cv=fail; b=mMGBAqHOz8UlZ7FdyedrArQRVK3fN72tfZ3/aGxpBPine0xlUaLSrWSjoUvwGoPWkrw4e73ZczalYG+s3aAW6rx+ZS5S+ciIgIXeNtb7gEjmu8E5g7B05Fv8jgyOTCc0fFh1pImHmVyQp7nx9UwfsyyOUdHbf3O5GnFCJqkrnqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784171069; c=relaxed/simple;
	bh=VpwpfDQie1zSO5bSSonm6P1pPD69XEqZuJXztH2fpAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UjeDTkcE5EqxkVz5B8xV3dCUIKQM5Wav+DHmENiuMifDWuNh+YeKFF9uTtZc8EfaocWHolW2aL/jtsYOZpwAyLdvTwvRtZ5cG6ifSL6nayHG47NYBjc9rSNxGmrRI7LcqaS5YLH6B8Q6F/kD442x3hV1+Ohudq+C1T2sbXTbBHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=fail (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=EQNESoL+ reason="signature verification failed"; arc=fail smtp.client-ip=52.101.229.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="EQNESoL+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnmlsFnhcl1VGqOaXteSAyA834F0sWW7Fazo14+vGPJPeSW0JZeQJXu4BRYd0yrSd7zS+mFmDsCx26NgUKQkVt/Emm8LX4EVXXac+96CDmwwAoCRQLX+054Rnj4o1VCZoD0kLjeVnilWFgPiLXgCd+dEg7L6W/hrxtK0R2Xb8HQGTMp22NUD+ieEviEH/n9P+wfevDvb4CKVNWHRxgQyXgAfsRjZTgU2NHzZE5fAPq1YIFzaOOyriCQIDYDSuZ8/5VPdNpnLh5wQvz7/Hg804NlYnVUcJARcLl1qI63N4ipjh3zGo8RYl0Gh44tuIkvYgs7ib6Uz+JrUOOfqbJp7Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uzj/SStfAPWSlQYAlhQD2oXWgUkSr7X+cBtX/P+HlyU=;
 b=C6JFVpIqwcZ5MLlYA3Ep9bgZgmE3LyDaIYBw7p2Y3P/mJ8D2blFo04VfVN29GbsBVArgvK5VNEznjsqipuGguS8/1fQjTzLXJRkYpXvV3hze4qWkZv4v6a4RS+vgpUuju+Ok8pqnCvR53vX+DcCM1BqJ0tSfaWtBvClueaNhOdnINeKaAsO1IDgL8qiuNZAvJo+2nw27AwDvKOXxMWuTVYLUHCv1lkGI0u+uQacJWVTQGJHmK/qHwujZKP9cXZjDz5bdKcdWC0SJgOKYBHI3wFVCnPQ+hsQ+GjtXVIC7VjyUVCSnN85Y0/DynWxuKVPUNDAGsKbJBwG1CleG08Al2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uzj/SStfAPWSlQYAlhQD2oXWgUkSr7X+cBtX/P+HlyU=;
 b=EQNESoL+x7cg+V8PX+gfRVmv6/6mGj7K1soKoFN4f9nVCeu5atQRaJw32B7ya4u4EDReCbkZqi0QSQKtz3j9ygCBmNikm+cLxQzyy1TF965Bc2ujWtNS2Ic9wOZWYfwMgLmk8paS8zgvx3OR4ZjgeSf3LK59VCaeou7kEaY/d1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6390.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:330::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 03:04:25 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 03:04:25 +0000
Date: Thu, 16 Jul 2026 12:04:24 +0900
From: Koichiro Den <den@valinux.co.jp>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH v3 6/9] dmaengine: dw-edma: Clear stale requests on
 termination
Message-ID: <mlp76yq345dymhznikyqege5c7zd2v5txwtd4o7vq6cxff2apw@gszk4auoeb2w>
References: <20260715175740.1110404-1-den@valinux.co.jp>
 <20260715175740.1110404-7-den@valinux.co.jp>
 <20260715181905.F02911F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715181905.F02911F000E9@smtp.kernel.org>
X-ClientProxiedBy: TYWPR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6390:EE_
X-MS-Office365-Filtering-Correlation-Id: ed1e714d-71a0-4cdf-d72b-08dee2e6f139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10070799003|10067099003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Xxsn2RSWCyJLyAwyYIkTObrUJ8PzBbp49n/2FqLqij9+aKI5JaM2ruwrDM9NZj1mkN12pr+NbONBs39aQMEwnzzAkgTMYXhuPKuvy5W7sm+R6WfOfilNWUsKroiuMG+vqVP1Ce+0QExM/ae/edLlboQXjV/QYJNJsJ6GUKMUrplQvvJNVXgVTDifM4JhJNQUByKFmXLAKpUg40K+zRxSDLVG2oBlZp/JElWnSe2s7EW2d3ZfAzfXD5xq5NIReCtvcSY0NG+1RTlqd82hVzI6h4p29H7uu+tR+t3UcHKn86u4fLTmsauqVYVrlwbRQJyaNGuJAaYaBimGDGK82Yh5t3lnIjcY8H+3FqG2CKJptmFQ4VspbOJykdcqPKwaEYTstftdfXkkLmsvS+Lv7NaGwi4kmNIpnD9QvGbqJk9Rwbh8mLpG4oD81hfMnrZwBfbjzW+6XaRB/KqBxMK0SeesDwmvHewrcuPZsRw+5ta7pSc/m6z+FLmAxS7Dy8HW9iz2nP7VkuHtRL6liIUlzw5LBW/yLm9qrJYKvDBIgUgD7gMvakFTVtuisyQ/AuwRMiJUj9ro5tpO7L6FgGyxsoRb1qFCuObbzMIuzm/J8r+vCtg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10070799003)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?RXWvd7+vYXVrUIakyCdt0rqqIthWlNBkQE8X1QKIDcoRtiD4VgvXrye6kf?=
 =?iso-8859-1?Q?5imS2iJbxZltRs9pp+1lHMFwRDcgWjNTEfekVRDrgfz7Oe6jJN3ra0r5g/?=
 =?iso-8859-1?Q?RP9EKwoAd9MAeiSQDvkXTkJ5jEzX6Y5OBP3nLpqk2iGnMkyWN+bIHe0AyU?=
 =?iso-8859-1?Q?IioPveCgqe9WQVNCxiU0O2ocMQ8gOubZYdsb5ATIlaxI+VHlNQZ0Pup13P?=
 =?iso-8859-1?Q?q97bsOkPgPpeU53NAz7EDyRqjWRxsh18RUkwtyoZTLuFuBSZEKwUDB76km?=
 =?iso-8859-1?Q?3lTfunPSuxDdLf1+O7zirVrI2me0oWJqA8fjKGPZ04rTdywvTc/EDuo/Qx?=
 =?iso-8859-1?Q?7WvGfHytmWrFZSoaulnROxTBW+uuS9BoQNI8JaILKccMf6Zia9Nq+KmMwK?=
 =?iso-8859-1?Q?PN7nHsCCxEnXWyO71DP8nSOmbeiGY8/M4gPHfNBm/TLzjWVCUw5zV2YBPK?=
 =?iso-8859-1?Q?TS08E+o96V6uwSFgTf4zs2hOqmL3+9vgRS1mqI3yiT6w16f21Yyxd88rtq?=
 =?iso-8859-1?Q?CGLQizjuTZwBx3xqB4dY8VRfrmqJoddd4FEO1uJ7C6oHRl4rIgJIdIOcph?=
 =?iso-8859-1?Q?GmC8g45noKD97Z+2lhtARDQb+FWnlOlZBb7w3eeBX51vrbqqsETyf3Pb5B?=
 =?iso-8859-1?Q?W0tt6cV/JCu9ZOXKZyiKbIVtWX/e6r9biSL20ptv6qVHMi5Vtfm3Q3f+xd?=
 =?iso-8859-1?Q?leG4diPUdcn8fPivr2lWSElMrRSn4/Y0sf0l+a4qUfZmkLqJLTBlspLeoa?=
 =?iso-8859-1?Q?2FYsq7OcZc6jqSrTL5Jd2N80syLuO9VJTcZFYlnx4Q9qolM+WPAtGQKe0g?=
 =?iso-8859-1?Q?BCRdig7Q2kZcOA6azyK6wJ1qNJXzVu7IGGTXwkvyEwJdortlXzjnsOAj7h?=
 =?iso-8859-1?Q?WDWahDsW2+RIVM6fYfqhYFRjmCm5ejIzz7wqnyeiZQt9Po1FcDGiPKt7vA?=
 =?iso-8859-1?Q?e+3ntzSGeZ8JNKAZZaHYRfOWJqS+oj+kiMfhKuJwdUxmg1aNJazvYwc1he?=
 =?iso-8859-1?Q?m01ntWeh0WrHftOtuxdX8iSI2gFQMqrKizU9bYpY/qgOOLyOeVzBAHYUGR?=
 =?iso-8859-1?Q?LCK4ExFen0GuXXyLaGDsjAPQyqPeV31dF/qabvTtm8+PMyZ3v0hi/ADbjx?=
 =?iso-8859-1?Q?/nEHnVktEUa0HoN3lkMnz68vqSMwBUCz8hwQ1EjGCuevKorDWnkdIfOLuZ?=
 =?iso-8859-1?Q?8j32yEyKW5L4Rt6aeC4vrtKz8nBGCCK+Um/7HS7svpg1DB5eJYXCxqfS+4?=
 =?iso-8859-1?Q?N/b+Q1N173zSXap8KiSSaxE7otGjR/FRKdAX5v+Ln+LXnhXhSziWsfci1V?=
 =?iso-8859-1?Q?sLKflGaqBb6Ng0qfNvQXkAywE2x4+4NZ+wz3Dqv7zY9PG1MXex/5vwop3h?=
 =?iso-8859-1?Q?OJyd4N2wXRXEnf+rO/jefqJtaLonr/lQhdtXGm1xwjSJEJOwr2XfpO0NJ0?=
 =?iso-8859-1?Q?BI2ZHy/Sr2g8uOH+5Kzf3i9aqmr8KDcT+ZcmKBWrvvbPNRTrIM65NUVuSU?=
 =?iso-8859-1?Q?OMB3ObMReEeSsgSJo3Owc8lYV4DAe8TCpSNcTfKmHpnxUmNnxsPhG675ak?=
 =?iso-8859-1?Q?EojtuNqVMD1ukKBZt8gXdKZCp+7w4zn2W9baYJQ2+Kl2XH1fnzdZU9rkhA?=
 =?iso-8859-1?Q?Nja2PYfwVopMC5zvhTwDRVhPrXflYmruFybVx+11pAbtM0EJ7LHbeOaCaJ?=
 =?iso-8859-1?Q?WSbVo9XqsX+t28oPtpNmnkiLGbZNd1I95uyb5lk0ew2thJ4mpJqohNYHX5?=
 =?iso-8859-1?Q?F7vRFTBZ902Rv1Opmf/ZY7BttdOGjJh5Sf7wqdbgihcVtA+Mly6OF1AbvU?=
 =?iso-8859-1?Q?63H5tdoQXFp3kRcMeE3GB7omBOe/l8lUofi1yaYTXWEijtb6qyFp?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ed1e714d-71a0-4cdf-d72b-08dee2e6f139
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 03:04:25.1489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: luXUYKSn7ymmIGSLP88p3pxbOtGs6/5OcF+341g+F2S/57UolnZCbs+SzMjbTn8o+Wt5pxeEhpu9rn6hEpQMvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6390

On Wed, Jul 15, 2026 at 06:19:05PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The PCIe driver fails to validate that the PCI BAR size is large enough to contain the hardcoded offsets and sizes for the DMA linked-list and data regions. A malicious PCIe device can present an artificially small BAR, causing the computed iomem pointers to fall outside the mapped region.

I think such hardening should be handled in a separate series, even if we decide
to do so.

> --
> 
> --- Patch [6]: [PATCH v3 6/9] dmaengine: dw-edma: Clear stale requests on termination ---
> commit c7a703de13f7d742a92f8673efc6a54e5f2e9c63
> Author: Koichiro Den <den@valinux.co.jp>
> 
> dmaengine: dw-edma: Clear stale requests on termination
> 
> This commit fixes a stale request issue where a pending PAUSE request
> could survive paths that deconfigure a channel. It ensures that the
> request state is cleared whenever termination leaves the channel
> deconfigured.
> 
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > index 8b0e2af734da9..2369b4c4630b9 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> 
> [ ... ]
> 
> [Severity: High]
> This is a pre-existing issue and was not introduced by this patch, but does
> dw_edma_pcie_probe() lack validation against the actual PCI BAR length
> before computing I/O memory pointers?
> 
> Looking at dw_edma_pcie_probe() in drivers/dma/dw-edma/dw-edma-pcie.c:
> 
> drivers/dma/dw-edma/dw-edma-pcie.c:dw_edma_pcie_probe() {
> [ ... ]
> 	for (i = 0; i < chip->ll_wr_cnt && !non_ll; i++) {
> 		struct dw_edma_region *ll_region = &chip->ll_region_wr[i];
> 		struct dw_edma_region *dt_region = &chip->dt_region_wr[i];
> 		struct dw_edma_block *ll_block = &vsec_data->ll_wr[i];
> 		struct dw_edma_block *dt_block = &vsec_data->dt_wr[i];
> 
> 		ll_region->vaddr.io = pcim_iomap_table(pdev)[ll_block->bar];
> 		if (!ll_region->vaddr.io)
> 			return -ENOMEM;
> 
> 		ll_region->vaddr.io += ll_block->off;
> 		ll_region->paddr = dw_edma_get_phys_addr(pdev, vsec_data,
> 							 ll_block->bar);
> 		ll_region->paddr += ll_block->off;
> 		ll_region->sz = ll_block->sz;
> [ ... ]
> }
> 
> If a malicious PCIe or Thunderbolt device presents a spoofed vendor/device
> ID with an artificially small BAR, couldn't the computed iomem pointers
> fall outside the mapped region?
> 
> Should the driver verify that the hardcoded offsets and sizes fit within
> the BAR by checking if ll_block->off + ll_block->sz <=
> pci_resource_len(pdev, ll_block->bar) prior to pointer arithmetic?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260715175740.1110404-1-den@valinux.co.jp?part=6
