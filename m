Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013021.outbound.protection.outlook.com [52.101.83.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6967329E7E
	for <dmaengine@vger.kernel.org>; Mon, 21 Sep 2026 16:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006708; cv=fail; b=P9VhncBO7kFykQoIhgnRKbVyqJiXCjln6VaSQvB9xdDdMuXQQRKDt+0Gmznycj8IZB7qYyVc6rKeGyANSSIy6HHUe01VGQL8RKI8mPiY8dD7xMJPOrh0nKxLMjfQFEs1ejOT83hft3a+6NAgI1zMGCLfCqk20+FF3VH9jCPDG2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006708; c=relaxed/simple;
	bh=ksomvJe9LMtV9wcMPodWzwTSYrg2TnRBRvnQLAQVOnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sjJ7s6gWk5z/JgCV4R8L07+WmZfOba+BtVyi0h/DVrawa4n4bbyqfEtcuKt18Mh70LgOD8MEuZhiDTEIsGdiJ7+M7ko0QCyJ4KgbXDj+W8hX3yIN9x0iBIYqJLbltJKXQGOGEUQS2uHXNWZoPFi4wt71ibTXhO1WcYJoT8CNiNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rm1UnpK2 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.83.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rm1UnpK2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPyrN3yGqoOIbwIEZZAhsKtftd+Xu47hYDn5+IofmfD7c181nZ1re3Wc0H5EXkgA/x/SojtqzpFusRUztLCgxaIQYO/VLZdEDjO2qFiMmj0U97tQQNLFgw8AX0mQRM6Oo+R89JSujpSgCIW6JuUcsvslBGS6jveerr9Jd69AO4CvrZye+0PoPGNnvTtXSQ7/MVSYbwJdVZFOi8RzhgmhpKFXWmh7MRL0bp9yLwcWuZiIhhQWCaeeKdNF/1tJK+3i9Zh8N09NE7d43WgFISBidVVaXQy4bxilHWusbnRosJGybZDl5pKtkdFntTlhcU+5ixhrLlqoJUnjMdHsWr1Dyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gn72YvgKZGzpl3F2xP+DbqlKbr6nTifrrFed6lxSr2o=;
 b=LAZIFWV7Y11Z+BMgtHTuztfLO4vqV0bj1D2RZueFG6zemTphKJcFE0zssbKvBuNSdropits4rl6KbHzCLm4fnNANZjg4IJi8KTT8Ay0rjO2DlFaRLsDib4XxWMjSqKGISCjsvynNzAuHr8GwY6e7ueP2z2xTnPkCoQPigUoC1Wk3XNH6fguAisFFRPGO47nxdJ4Aj1Laguap0b7WEhiESL9Yikg5GXqd7KbV+eTh0Pe3jWUKg/2gAxkIvjJXFPiTk2s+f0+JG9Cmz+Tad7SDBqT1R4om9r8bM8l7lKLIaFn7bVXkw6vVvxDD7alQi/k48JAIgIvXEXyPRyHM6U4zUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gn72YvgKZGzpl3F2xP+DbqlKbr6nTifrrFed6lxSr2o=;
 b=rm1UnpK2giIkjdnmVJWkHraTiYQq4EGyGhnmnCtIvM0t75gkOc/nwWXgbJmoH1wpl9Xt/BoaXXOdaykIn3a82dkVustdwI5LXbM9hMFRacGRqNqucmzR1AyBcXXgx2aEvkLn/+stH+zFZpYGEcC6036iSIxubmQqMF6cFBQwV7azwI5zFVh+j0xxUod14+CxXVutAhOc9fw6UWi5qRjU3GqCTjUMG+aUBAULRXPopRGPBLbiuip+le4TMwt+Mau2eXyeyMUHF0OijaE+dHbeRXZOEQLeU4h0pw+5+4OPSp//GvuN+vwVwfreJVouaj4Y5iADe+b8nGtMHNruZRfpfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10870.eurprd04.prod.outlook.com (2603:10a6:150:20a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 16:05:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 16:05:03 +0000
Date: Mon, 21 Sep 2026 11:04:56 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v3] dmaengine: loongson: Remove the dev_dbg() output
Message-ID: <arFVqH7p_plaxaqe@SMW015318>
References: <20260921151312.I8Q8NLnx@linutronix.de>
 <20260921151614.B460D1F0089A@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260921151614.B460D1F0089A@smtp.kernel.org>
X-ClientProxiedBy: CY5PR19CA0007.namprd19.prod.outlook.com
 (2603:10b6:930:15::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10870:EE_
X-MS-Office365-Filtering-Correlation-Id: b9033d30-0d1f-40a4-4d81-08df17fa1896
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|19092799006|11063799006|10067099003|5023799004|3023799007|6133799003|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	NBlkqQ0Z3tR1/hGvPaFCj+jOqe0jRBQLTSsadiMhO7MR+bfzANWYO4g4Wyzb37Xar9nuKbvgKDSxKN8pI7/bdHNovfLtlfIrdVUukwTtd4iGyiNLEBRkY+sV/frj6uUs1U7RTq+NpbsLP6ThpCl5+4FnWjQqRefKYxIGazADi7sqcQd9MDXqI6Iostjcv6DR7prPUyB+wXarm1teISJiRL/CBpfmkzRO3ZGzkpOlMYAyRcKYXGfp5gb4CrPy2ZY5sMKZcwypycwscEjEsxiof7bbyfaviwIMP1qLH3p1oId6gNu3XEXyTf0MbEUulx6aVnf6ggjqdpbYqpB+fNSjMlMWY3oy6gKAKHPVf2DoO0QucxBoU8T+ZN1fUe6nudmeT2KMjmpUhXo6BV5Jp4msHm+FP4utUuOjYxCBf+DjpmKmxaDGOfeRJjhq3N57WUHBcaSvhpiXdA3fIAXD8dOR6i8VBM9Kp+q6AXiXxueNM7xrJo5vPf7uxGTaLb2NJbXjDXF1/P7it5tj62DsIzy64kzXeGbXP6UmpJePIY96jqqUKSKeZHL7olTM+Bhu1vqQ8nukxvkKJCdFSVMP2BkLqkHjTpH894g8cqNtlJPnsto=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(19092799006)(11063799006)(10067099003)(5023799004)(3023799007)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?pWUvviQXb6xiZEigcuunCE/lYgRMTaqnHRshCk4yTUEiZaQXH6byC7rU+E?=
 =?iso-8859-1?Q?0aAb1y3nvbl2E0OT6S97dNBcUMaNXfSiTSnYZYNc4ph0ziEzAN0aekCKB9?=
 =?iso-8859-1?Q?gv885WPRo4ygfiMjncAZYoFH0nSwX9J+Qybm3HdDkyDwHLc1OmPcppHJHN?=
 =?iso-8859-1?Q?mK5ZresEnH9KcodwiYpPU/ynI22U/tNuOu3v84NudJsAx/4u8+n+0oc5Z1?=
 =?iso-8859-1?Q?NAkQZKfyzzIxoReSccQAHg3sNOwMpNbn9xzSAXxTNeh8naR/Ivi8zdTy35?=
 =?iso-8859-1?Q?w97BOR5DJEzOdORG7SaaeLQ/s5yVSEd4HXviZMGRZtBp+LtjIqdzBctfuR?=
 =?iso-8859-1?Q?CNHO1y6J+Iv8owM6kh63jgVVTyleDmcfp7yxI2Uy/tc/q8GBzmNoHJQhNd?=
 =?iso-8859-1?Q?0uycmv9yWCrHMN+pH1j5ZG7o8PLO94l+uWMsiGzW41fhtML9NdLcYYpuNi?=
 =?iso-8859-1?Q?/Uj61kWzPdYV0xNd6oV5pnQn62xXZQMNrZdPRk0oV1cwJUC0nGmaVWJOhb?=
 =?iso-8859-1?Q?N0Zl4OK2f++FHjOoJjgKzmY1ttlgBVJczShKyuwb6B0WBz60ybRjKuyKNr?=
 =?iso-8859-1?Q?LCot/3laAzTH3owmHMKdD2PTyaMCoMEsEyPuPoxWeUa2hhqjR2l7C+8jMv?=
 =?iso-8859-1?Q?NQV4ZizP9YQRUG3scLsNRsXuGhiXRuEopK8tQzw4TegyEXU6XdFb+7Ddc3?=
 =?iso-8859-1?Q?5ksVhN9qchLJEC+TBv1ge6Qsf8TkY4naWSHmu60x+bOyKbE7/GAMxEhX5g?=
 =?iso-8859-1?Q?cab7fTp5ni4NtmQaSbKw+6kdoImLdn4w3MQ7ACWhxchQLFYHnTEW/PnOf7?=
 =?iso-8859-1?Q?wys8/pMAQe4QWElt7uE8kXCqdJ0PoyUXnI44pCWtlLm1WWQPzxhdUcGKgN?=
 =?iso-8859-1?Q?dqlvIoTul3IRYdu4Dwx4A6L39YwEhZBNcMmHaYpQQt0wAXPQobOPvY6wF+?=
 =?iso-8859-1?Q?M8pi3GUbPUe336fn+krhuaDU4HjHa0TFU/d3RjIQ00aVH53J/KsEvYMVHo?=
 =?iso-8859-1?Q?W9uaKbmkdZHqZrWl4dozrwB249ylMo4WhVfoDINOWjFL0rNmzIr7HEO95H?=
 =?iso-8859-1?Q?v7CA6SJj6S3BJP5VQrPV0mvvMoKFVK+4k3sI1GDnl9U+eOS/k1QobiyEsb?=
 =?iso-8859-1?Q?WtBqTltIu9HXbXiCxUUVih6iTrlErhVyAR7fvko8vUpcMuBJT6Zg1SUK+Y?=
 =?iso-8859-1?Q?UjPAUkbrl8+TO0KDREfyfAvGcpzoqP7yFYFT8RtqDZ6roybVredH/S+kG9?=
 =?iso-8859-1?Q?g3ktlgcMFXRefCTqttdF78rsUVqeA6lYEwNk8NNqV+Gsb/x6SVMMJ10qrJ?=
 =?iso-8859-1?Q?dsgg4/asktdMgBVdfy9IlRdABYwD2YUZr3E+RJqH9AWurwde7AlQ8Kg6Y+?=
 =?iso-8859-1?Q?4D8ZW/9InErpwkVf7dgabInWCSOfO7nf3wgqvIY1ecKuNorJagI9V4LYRK?=
 =?iso-8859-1?Q?ZO6f7D1ODORYXzQW8i65VKkAPIBS7E/VuiGnmIXAUzVUQvR69GalP9wf3T?=
 =?iso-8859-1?Q?Xg5W91myZtlLqq1uKd7imBabP+5ujGqgwxdmK+n6C4nKRB+3R3eeUaqXmU?=
 =?iso-8859-1?Q?aQ3GzMnCgGsN5EzGskm7YP37XMpivlm+POk9bu+ObGnnOqlVTtAO55nobx?=
 =?iso-8859-1?Q?iOTjVJWjy6KGS1auAHDQLCne0slAKIvO+0DtDUD5LLSCxOXfShHIxWwVbI?=
 =?iso-8859-1?Q?Szg8TDHT7g6oIh7/RNmkJpGD3etY+z8r5M9s9AWPKuhisYA+Nycke03Lag?=
 =?iso-8859-1?Q?wqWrwfZKWR0Cf9R10FNDWfb64uyp9qtLFvMxo7mc3L0hOWyEI7bJcxcFS8?=
 =?iso-8859-1?Q?O6jxDtki5qkrOBLRLGHL1li3ozsqNRg0lvW72y9UXmA4oYCMZyzM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9033d30-0d1f-40a4-4d81-08df17fa1896
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 16:05:03.3549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ejg5xRX1vySsfkMO73LNAbVPPX7Q/r563UKzHPAY2i0EzQs3foXGm1H/wE2owugJ6AMURVpVjCVoDi+h/mZ96zDmVQmVQtBWHPzG8pQW+sgl7NW34icCELGXznIqep7L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10870

On Mon, Sep 21, 2026 at 03:16:14PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dmaengine: loongson: unnecessary curly braces around single statement
> --
>
> commit 800bb056df0405c03d12921052d730f7cccef7be
> Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>
> dmaengine: loongson: Remove the dev_dbg() output
>
> This commit removes the dev_dbg() output from
> loongson2_cmc_dma_issue_pending() since the %pK format modifier is not
> appropriate for general printk output. The debug statement was deemed
> non-essential and is completely removed.
>
> > diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > index 1c9a542edc859..27f8f7a5738d9 100644
> > --- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > +++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > @@ -337,7 +337,6 @@ static void loongson2_cmc_dma_issue_pending(struct dma_chan *chan)
> >  	guard(spinlock_irqsave)(&lchan->vchan.lock);
> >
> >  	if (vchan_issue_pending(&lchan->vchan) && !lchan->desc) {
> > -		dev_dbg(chan2dev(lchan), "vchan %pK: issued\n", &lchan->vchan);
> >  		loongson2_cmc_dma_start_transfer(lchan);
> >  	}
>
> [Severity: Low]
> This isn't a bug, but with the removal of the dev_dbg() statement, this if
> block now contains only a single statement. Should the curly braces be
> removed to adhere to the kernel coding style guidelines?

Please fix this also.

Frank

>
> >  }
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260921151312.I8Q8NLnx@linutronix.de?part=1
