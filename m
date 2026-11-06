Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793986054;
	b=DyUYhQD/R+aB2YTPSe+UMHgmDOn5aelTrwllyfB8crYX+gnXLAHYpgKKj3KprEBEcYIW
	 TNZSyqNsLEmTpLKmVWLhhvNyZx0Jv5KTaojZHKZZY2fgJDN0ISw5O0Gq3f5wyLAgja/Rn
	 /vBlumPPtZQwE2svdl4CXgv5tBMB1iIQm7oKN1QWeVdcFALNSckzdVxT5xrpX3QTscGZc
	 J2HcTm0wPG71Dn14hrrKxXJz8qQ0EfMySdVGPcMZtyGWzg6nmulK6bAk/14C9IugdPZn1
	 YdnKfOIhqVFaGjd6KnJNRL3NK3y7A4eh7BGtOstlPzldNWDZUjSwX6hm8nPsfklaTvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986054;
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
	bh=x0ejG487qUTuA78GSNocB0RuEBVLkVUibDGkWqGsYz0=;
	b=j1xskYhKTQbB/LK1m9AM5zUFBSWCOxKFk/6mhJCzQ0b3/15WBEKtc5o+aGCVNGndB5A4
	 BQnFxhTdoyGI98Jb54PGCfvbt0DMTEWdpMWffO0ypJ0NInTTAfgajq6cysJAL/gHbfRvD
	 /qzrn1nfC03waG9GOYcwQm22wuaCQkXdIVxWYXnx9De3XP+qXqvse3J0typh8Ufaq/2Sa
	 aSrBEFgXIWSA/6xEG2b6nesjSLWpxfD2w/DIlnTUiee18ne620jcpmOzUdbSENw4lq/gi
	 O4DLSrYEnvTbzWt9jav9lDGmulaK5qw/OWban7fnE5Wo0sY4kUAaWZmVVt/i4dnuakg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=DVWaCmO6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.2
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010002.outbound.protection.outlook.com [52.101.69.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2199606A326;
	Fri,  6 Nov 2026 17:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2199606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=DVWaCmO6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INwm6hT6K34tFkREbauSbpz04FGS3ijJJMmJKaxzsMCi8IMQeShFe9F4GQhRjIvOXnxh02XSXXwXdFJlmxSP/emCo6EV1fda+AoxY6rc1R6juoBuJ9GiT1+s86QfI7qpiFkOhYx3+QpLfd1YBu5f2uSAPyLczZIJdw9FFL1ip7izCzHaYwi+bkxN6cHA8I54MPIb/EUl7ft3Q6G8YrDmDhwzsHnV6HU+6GWTFBZqxynuDX3PDQasZu0BW8svSEd+lCyF+h0/kZ+krowlYVDteOLy4FuI1uwftypfRmCqquzs0v63ldtz8IeZrh9lGrwyhK1IBOtYysflRjGD2IA8zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0ejG487qUTuA78GSNocB0RuEBVLkVUibDGkWqGsYz0=;
 b=JR59nuEdiuy97MLezcDt2K03ObMCcOs5HllSMsJm5qq5odvTAYOJA+v/2R43rkCeMWIB8pwBBLOX4Qt1sThOVVju3EI9t0L5pMPq1M3fyGMFpGOZFFbtSM06rDkfURG5tqjxY5MMzzrjW2ytxER9xn5Y/JoLtFc35KXTtbQzLCGNDbBpS2G7Ajdd/TijMifaQiGRN7wKm+FTgOvGteJXyWKtM4ywycwouj54s4GzG2jOt647y3lQxm+kpIlHgJKC5Fd6tVHj1gZfHINx07uVwm8ln+RDzCm631FyO9IXtt6DVR4XW74K9YUQVrq0o4mNvERKd344w8JDLo8nWLZpSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0ejG487qUTuA78GSNocB0RuEBVLkVUibDGkWqGsYz0=;
 b=DVWaCmO68pAmN9Y96EqPtI6r8YKnulIvSpOU4bQ9BN6ekb+AHG7e4Xy+UDC+pgMFIb/iwS9LScinNCpF3hwC4D5TEFKY52TiLFjZgVhWvN7RVle04YflVVfs9VgS+yctRToEfLgz3zHQxVSchBtoFG4EK2vCZnrTpf4JDRwNVdz+5ZVThAn8oJZkDCnr6cSo3yZpmsBC1GAnVtoOmpef+kJ/77cYg+tgEtJqozO3i7ZkbC6kQOtv1pmuI9ycRXv9tUbDZyc8K+EZAkjPENeKuWpp6Y6ONq1Uf4rwgE5ZIIN54vu0yQUnSL7dfoh+Zlypo8PkwkcCuhTsfYtDPMgoJg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB12076.eurprd04.prod.outlook.com (2603:10a6:20b:743::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 17:27:31 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 17:27:31 +0000
Date: Fri, 6 Nov 2026 12:27:23 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH 1/6] dmaengine: plx_dma: don't call pci_irq_vector()
 under rcu_read_lock()
Message-ID: <au4N-1KtYx4QuQ0p@lizhi-Precision-Tower-5810>
References: <20261103155202.461725-1-logang@deltatee.com>
 <20261103155202.461725-2-logang@deltatee.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103155202.461725-2-logang@deltatee.com>
X-ClientProxiedBy: PH0PR07CA0070.namprd07.prod.outlook.com
 (2603:10b6:510:f::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB12076:EE_
X-MS-Office365-Filtering-Correlation-Id: 21fc8b6c-a0f1-489c-3689-08df3c2b3c99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|19092799006|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261102123227099003|261026121527099003|261028144727099003|261026140227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	idk5PqxFctT9vCK5THwfDBc3oVK1+OxxhKnho4qOgm4ig+JUsQxxjTlOaDTE2dp04/vKZUkZ8bLWtOUtbuN7orEJBxzEsIfOsrYbCxR3CCoYxPgG3+zUckvCSIkl+dM+da3wwZJrVKiR9DiGidzBDeyHqTLhLHRWVvxpq06q/mP2AcJySDv0zg9Dr99kj7xPFqF7LZaV14+H6Bu1NuUCoxXSSCcdgrwrM5Dj36RqExaY77MM10JFM8xCXja7yLuUh2dXvDhRPdSMUAtJYwydIEiMSpcwyifQrmuUI0BkRCh4YbUD/4lqaMNKOHBqNziuJl67ToyCNzEA9SwAeBZ25KWf9wtMoY8/82nmCUerQE1QdHPpvRGVcLLsqeWyXwejqPltYWF4ETg5jeusj6Pn8mWsxBcFhsRMwk/4ZPlENUOHeKe4LhEYKFy+xldXkJMznaAxm/L5Zo1msWXlILK3b2iMH1Fc9Ic8oksgENUaLcxMhTDpb98lYDL1kPt9SwibLjrsvTSeY7oes4THDY3cEoVB+WVz251IZ+abOYe86I5Ox7hVG2BjIDJ2ml2vUyHpaUuQvCse/P/Lad9h7tW4YZ23My0t6m6mGedfqoojCz+979eTo1q3deRMizV2+3eNeBlFM1RKcqxjT5OHGD4IckEYph3LpbrN+6nVv4o7HzE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(19092799006)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261102123227099003)(261026121527099003)(261028144727099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hgd3ZXFxKnjEvK2XeGronj+2xyXIgoy8xIXVomUg5MX/Fmyl/SQOyzS8jEVi?=
 =?us-ascii?Q?TUHhfEBg8lb7xvj5JxIHA+MLK1cymd885ATVE73smKy9bSIgiYg5lcJTdq+u?=
 =?us-ascii?Q?IYl7rz/3OCNBydnKTIW4T5kHWBAFyr8r8vl0MSsWlkPvyBs7XfmTOtgn3sk7?=
 =?us-ascii?Q?TR8ywydOhdwqrKUVYWKgP/kUWhI30NeO85DJhIO5Df/56Ti8FshOlxn6+NjJ?=
 =?us-ascii?Q?/u9Xagay23lu1XFvRIIRKAdT8Fn52E2yTF/FVdMti6NyJqxEK5R8z4ITWvQA?=
 =?us-ascii?Q?22nojODtsEhRi7zAxshWFYy+gYuXnRbtb8GqU46XkLWi4dJL7EiqrM8Damcq?=
 =?us-ascii?Q?WTrjnWY0SFP15bRkGeiW19yYwQdaL00pZan8PkbzpSohW5UigzgiOJGeWyGK?=
 =?us-ascii?Q?5VuRDmymOyUbneV1b86G23NcGr/TtDzsy2eDssfBmhYzaRN4R3Dr3UkSQGsS?=
 =?us-ascii?Q?7RVcpELcBwDTTBAjkh+9Ip01zQqX8tjk360E66Mcl5vtSkhv7mU7mqRpUGhR?=
 =?us-ascii?Q?S8YVOcnCV6bQScVAprgB8PhEHkw062MymoLGoli4RjGX/pAOq9qJ+3RgTMmG?=
 =?us-ascii?Q?JZaRZ3kZIADQUc3zwKOfpQ1dsFyLZm4KmURjIwVZ5GupmUCUp0wGynd4PTrM?=
 =?us-ascii?Q?8rn+XLL8X4SzFtabJZsOPM7FvaV2U2IMF3bOH/0IQM/rdLj9bSAPOnNPEumE?=
 =?us-ascii?Q?YRybwdX6ueGkk9z0v7wGkw2JsGKcSWJ9KR6RiwkHOW9XmJx2AkEiX0CJkmnm?=
 =?us-ascii?Q?/IiOxYxjsPaR3pFU5inoI2HmOd1h8ONDFBAWbdVsWQIapaBScrN+5V+QZgXl?=
 =?us-ascii?Q?r4YQ7BuJv3Q7bipA987nbfdKMEabKB8GQdnL71FzvsQJAYEOWX5KO2k58YKJ?=
 =?us-ascii?Q?dvS5BIkk/+G/FLrxxV3FpKZvxFEnbXpmW7Y11Hl+lmZRkpYFjY2rZYSWhCmv?=
 =?us-ascii?Q?panTvQ5pQpijxSn+bvtau8oGGkROt7Y0nqQLBr31dVT9eJvZd0QiuyUNljHR?=
 =?us-ascii?Q?ycmta+WjNN7uI42I8W2mECnG/u7QJzTjbT4DNj+dDNimX1IPDwMbZMOYLYso?=
 =?us-ascii?Q?PCXPOb8BP4NEZiOZo1wZKa/SOjLv4dmrr/8qUVBUbmlXEgp2FeocZVX4L/ci?=
 =?us-ascii?Q?cO7oXy6Wal9T31qNlF1oTfcMW7oKwkOSsMLJx0kad2UFcocg18zWX+B35YeE?=
 =?us-ascii?Q?w0pmGxcLH2/XXzIhRufqKsBp0XutzqCVOiuoWit0wZmtVU/n3miuegouLDqS?=
 =?us-ascii?Q?zf6RZyKMDb9j+zb/RNhsgmCv1nIuvSsSHqSuWhnivnNjG464x0hGdbsDF4pO?=
 =?us-ascii?Q?mDDdcOoMpME0H9/09XMu/59CwebHYL4AuYaTI7LFd0myywbtOOsgHiUsFpZk?=
 =?us-ascii?Q?YiwKvD+Wn4eXJyAVNuzg8awq7C/eGg+boQVnICKiw0aF1pXBZR3FM6lAu0XI?=
 =?us-ascii?Q?ETi8Ck2fMjSaQWvJoP8pED+vT59+cL1q8lznlGXkyDFhxXs2S8AwHQZ2LBrn?=
 =?us-ascii?Q?XJmedyoaqhIfnHDK3mpiNeyjzJEtAB7TiTsiBa0WIgajqwIwC4I+65JZ1rba?=
 =?us-ascii?Q?ISR9V19Qi/w9mc6NX75Osk+SGcZvl3KWn1k2G9jlVYayg2NuxBpySrDyr65Q?=
 =?us-ascii?Q?uuxDOOMQgEYKB0TGB/F70bFUyZEMidbX49eADENtxkHkXQaAShtKqGUurfZx?=
 =?us-ascii?Q?HVhKp1aDzxOdk6QuDLGwqb/PdBShe8iX1ZZuq3kC3gaWs9pHWkhLf/gYcYUF?=
 =?us-ascii?Q?2jyRH8+SOzVz9hWkabb/j/gdBAZ+KWMoyiDn6JhA7GHSOXLejdly?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21fc8b6c-a0f1-489c-3689-08df3c2b3c99
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 17:27:31.0182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cALjmNOjZKU7sII3120OTAUjAIVcNzB0IeXYD49mRJbF488M4IlrT/fFkwFJNoRHSUQAkgfRFXbq91TDHkzX8G3VNkoBmKtXwtMI2dp/66HOyxN3IY+fJJ3lTD5cA2Kw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12076

On Tue, Nov 03, 2026 at 09:51:56AM -0600, Logan Gunthorpe wrote:
> plx_dma_free_chan_resources() calls pci_irq_vector() inside an RCU
> read-side section, but msi_domain_get_virq() takes the mutex that
> protects the device's MSI descriptors. Releasing a channel, for example
> at the end of a dmatest run, triggers:
>
>   BUG: sleeping function called from invalid context at kernel/locking/mutex.c:623
>   ...
>   RCU nest depth: 1, expected: 0
>   Call Trace:
>    __mutex_lock+0x113/0x2350
>    msi_domain_get_virq+0x227/0x2f0
>    pci_irq_vector+0x9a/0xc0
>    plx_dma_free_chan_resources+0x178/0x58f [plx_dma]
>    dma_chan_put+0x157/0x380
>    dma_release_channel+0xac/0x2e0
>
> Store the IRQ number at probe time and use it everywhere
> pci_irq_vector() was called, so the teardown path no longer needs to
> look it up.
>
> Fixes: c2dbcaa8c672 ("dmaengine: plx-dma: Implement hardware initialization and cleanup")
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/plx_dma.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
> index 409898e92c32..0a7ad2473cb1 100644
> --- a/drivers/dma/plx_dma.c
> +++ b/drivers/dma/plx_dma.c
> @@ -104,6 +104,7 @@ struct plx_dma_dev {
>  	struct dma_device dma_dev;
>  	struct dma_chan dma_chan;
>  	struct pci_dev __rcu *pdev;
> +	int irq;
>  	void __iomem *bar;
>  	struct tasklet_struct desc_task;
>
> @@ -452,7 +453,6 @@ static void plx_dma_free_chan_resources(struct dma_chan *chan)
>  {
>  	struct plx_dma_dev *plxdev = chan_to_plx_dma_dev(chan);
>  	size_t ring_sz = PLX_DMA_RING_COUNT * sizeof(*plxdev->hw_ring);
> -	struct pci_dev *pdev;
>  	int irq = -1;
>  	int i;
>
> @@ -463,9 +463,8 @@ static void plx_dma_free_chan_resources(struct dma_chan *chan)
>  	plx_dma_stop(plxdev);
>
>  	rcu_read_lock();
> -	pdev = rcu_dereference(plxdev->pdev);
> -	if (pdev)
> -		irq = pci_irq_vector(pdev, 0);
> +	if (rcu_dereference(plxdev->pdev))
> +		irq = plxdev->irq;
>  	rcu_read_unlock();
>
>  	if (irq > 0)
> @@ -510,8 +509,9 @@ static int plx_dma_create(struct pci_dev *pdev)
>  	RCU_INIT_POINTER(plxdev->pdev, pdev);
>  	plxdev->bar = pcim_iomap_table(pdev)[0];
>
> -	rc = request_irq(pci_irq_vector(pdev, 0), plx_dma_isr, 0,
> -			 KBUILD_MODNAME, plxdev);
> +	plxdev->irq = pci_irq_vector(pdev, 0);
> +
> +	rc = request_irq(plxdev->irq, plx_dma_isr, 0, KBUILD_MODNAME, plxdev);
>  	if (rc)
>  		goto free_plx;
>
> @@ -545,7 +545,7 @@ static int plx_dma_create(struct pci_dev *pdev)
>
>  put_device:
>  	put_device(&pdev->dev);
> -	free_irq(pci_irq_vector(pdev, 0),  plxdev);
> +	free_irq(plxdev->irq, plxdev);
>  free_plx:
>  	kfree(plxdev);
>
> @@ -594,7 +594,7 @@ static void plx_dma_remove(struct pci_dev *pdev)
>  {
>  	struct plx_dma_dev *plxdev = pci_get_drvdata(pdev);
>
> -	free_irq(pci_irq_vector(pdev, 0),  plxdev);
> +	free_irq(plxdev->irq, plxdev);
>
>  	rcu_assign_pointer(plxdev->pdev, NULL);
>  	synchronize_rcu();
> --
> 2.47.3
>
