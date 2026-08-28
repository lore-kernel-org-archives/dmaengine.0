Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021140.outbound.protection.outlook.com [52.101.125.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E313612F3
	for <dmaengine@vger.kernel.org>; Fri, 28 Aug 2026 05:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787893294; cv=fail; b=rym/h75Eh4+TrUJAT3BZ5bavhvSmC7grpMWesqgrI46/BjlGVCqSGkBdoaq+XZue7r1eBMIwQBGu12pSWCM36I4cazmZXMJUvAo6vPXjIoms1chCLQZ79V+eioUbvcWvAQUTc/vZQS2X1DdIMHg7Y05rNSu15G+/+heJ1UW4NT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787893294; c=relaxed/simple;
	bh=lvEf0NCEY20Buwg3qcZknI2czN8v3UOgUGnRnccFTsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Eo79Z7zHNghPkPFG1JrdvZvO02J/Mx1oGxiugzUZEMq2yfbYU+yf5dlrYyXrwYr8KM4IRkx6Foa8PTTJXXpsPVcvNZT67FUOtODa+sKnuzWsVELIpUKpsqKNyC5utyDVdp2vkbHNX5YxWcewdh3tMPxWvoXR3PshSek+z2cujqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=fail (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=hL7DbN2j reason="signature verification failed"; arc=fail smtp.client-ip=52.101.125.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="hL7DbN2j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rrlup5kSMK/hW/lS8lrdMhVjRuI5so6xsOdXpc+xuHJfiLml2dxpLIDIIp0+J7ohIdbpPzHQBdkCyi/4z9lIJbS6HWODo4ULQGji/77UfE3JUagnyL3pzu6UJvI0xzaL57gNjuRU/gnYxLWA3bHHDnze6eFbp8mCqnX6gm/hrfE1c4yXqiJ23HFOSBI6Mm+5jpoj0IV7JWQdD9nXgQOuIqRqEaRhNCXuQGS7g1oNBpy5yhblMFyD+tpk4lz4iJqqOw0zIrkLwvUM2aQ5cSMF8xDxfKumYB4+esK8Pac9MeeljPRAXOh3YU0HhY5vDv+JOszA2Qlc2Ejj2mgKqF0wwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9S4zyv3Kbz8S2Coy49tnxo1Fkqv4OnXOS2vNp2B8QQ=;
 b=bSs1+r+me4+nkjNylQtWy1hCo2hQMSB58rR+u+8mRKvVcp5XMXU2cxwTDNdNpcZOqMaiGfzxfFY2yA21YNjcu3+zd0W6cbu+zj5R1qT5gTSswhZn56f1w1Ko9u1ePVylTjRc/437VxqGB+Gjz92APDe9gqbsDdgB7t2O3O0tRLO2LIOgXo+4WsOJJXNT/cnchtimRmZeU9ec31w+gq38yd6Y44UY/TZ88sKO/aRYqf/rgswTbFcU9bk+TYmRmTLLD5sJgLE9bZsg0fO/pttyfwLZjz19L7y2/N7NwCsJ+6roUK19UiUEgP0mePvzLlzHIhswkSIvpoabpToN90uoLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9S4zyv3Kbz8S2Coy49tnxo1Fkqv4OnXOS2vNp2B8QQ=;
 b=hL7DbN2jrJG2DiWs05Gl6CHh7ItEQGvoE96Rf/IFC6Dy2Yd17WLX91V2+Bu86uZgffMaabLQzs1IU9CbBJRdALPzXjnQagCtXqiuXyp72PyAMx4zL0OE1Uk7BrU7SF2o9QDYfCfjalRP5F9RWiPJVzaRB5kNcVVOEWDlE7JHidM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS9P286MB4892.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 05:01:28 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 05:01:28 +0000
Date: Fri, 28 Aug 2026 14:01:27 +0900
From: Koichiro Den <den@valinux.co.jp>
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH v6 04/10] dmaengine: dw-edma: Make DMA link list work as
 a circular buffer
Message-ID: <whnxr5olpehmb5p6kfjx4d7cqbrllslisnbtr7zpameh4sn47k@ogtyagdpzat3>
References: <20260820173439.2004068-1-den@valinux.co.jp>
 <20260820173439.2004068-5-den@valinux.co.jp>
 <20260820175009.70ED01F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260820175009.70ED01F00A3A@smtp.kernel.org>
X-ClientProxiedBy: TY6PR01CA0006.jpnprd01.prod.outlook.com
 (2603:1096:405:3bc::10) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS9P286MB4892:EE_
X-MS-Office365-Filtering-Correlation-Id: 823b7a40-581c-4f93-dd9e-08df04c16b2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|23010399003|10067099003|22082099003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	IgRjSpMtgNN5FxMejhP/ttmg2KcCmXW0tqW8tm6LOEVn2nsbIqZmbqliPYHMOlvx+MvAq+he6LFNTvyVKQtQtUTZpEbG8vEJvolfEWnMYgnkpjGa9XxQ7P36RHj51BcBPB+nVCGs3wUS6su0tYkdvaHqZidiAhagkZc6ROMWQbfEuGbGIJ4OF/LmwXrjxnqpARiB7QAxzVtdEZXITzu9PQHPvFCfd+NQ3MD4FfKF6iAVR/KFLjO4oKost/FwQRemv5TdmYAWRc0EFXb48YePWVS0o2HrkvfCT3u9V8GyEBh6m3iDapg2bqUZhrDwIS7QNCGtPk694XnoA1bWCUODrnUiaXb25MmIzai+9KZM4+qnGCZihTa84LDwc+igbJCU0vssYbVUS7iXHYpkU7eun/omqn7OqTfHPsIqSKHCF2lPA1XsmMqjKkwMjZ4qpgmKPUqhcAkuZ/aN2E046hPHQkhPSllhgzPIZsMZ3EkPY2dToFUw0yT8L/kQSVgw3k6tF2QUGV0U4jEw2lQDL+ZpALn1BARDjIhd+rgZGZ9f5l3nVivfuLUzoO5Z4V2c+x7TqgB7v8m3xQ/ABj37/rKm6Wc9M0i3IrtJqzNZ0qCowKE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?fUqVsqYJxUIraB+7n6RyDKnFTfdEFKbJMCH82QDLxpmg2i3GwJMHhT+0nV?=
 =?iso-8859-1?Q?6alVdlXHDklQAtWQplnm608QxRID4QXHT7zarGKiR7nMlSCKecSRMtNzBE?=
 =?iso-8859-1?Q?NK0yKgjLkItxsQYHnp6AHv9XIhnSOmQMH0ZYHhgqX/te2IZe4LkTGEeM2L?=
 =?iso-8859-1?Q?k2chKyYBo4xqavLBVQY4ssZ9kHGjnlemI0YexK0ZTJDsbgmPrgf0iqogps?=
 =?iso-8859-1?Q?TR9I5vAqKx0BD6jOVLN9tkZNXFOwOH0lRUtgkmcX4Z28vU2YHzUdBWwPVB?=
 =?iso-8859-1?Q?3358ojleg6KFB4q1YdhEwJSac8/MFeNi/8qUVynX8ReaVBKHpYCwoHkwGf?=
 =?iso-8859-1?Q?k+aapX4uuNYCC/1+ilbrAJLQAeh0kTW8ntGXsQDHNeNgdLkNPKOohVxF5z?=
 =?iso-8859-1?Q?zcp3SSgfXai44Icqe9AlGpULGpScrLAmzyxQY5prWPOlJ0NrvJM/dFlxRX?=
 =?iso-8859-1?Q?SsTb5/WrR48NDVigsSAqAhr/41RWfT/lmmOp3FwLCX5dTl6HjHIqtAQ0H8?=
 =?iso-8859-1?Q?fraoAixGP/X6+uLKAbUqBsHD9Oy4xCRDkhCCB7j7x9apg/xtIOE8y92j5h?=
 =?iso-8859-1?Q?qaMoL4GiapEamKGGnkiq0d28bmD2TekRAt1ayuzkOtGjy69A8+79BGHruB?=
 =?iso-8859-1?Q?ZRpYHaShewO5KQcd/G08UwFLX/snqJMVRFkji9EaJ+LdnGzsCHMjSvjqSB?=
 =?iso-8859-1?Q?ReUdsRv5z1ViOielr9/u74DzcXiiicqV/8BXyXphfU91+L6sRW6ILgUMKc?=
 =?iso-8859-1?Q?Jq5U4fI/vKp94yJcg1j5YjkYqWcx/HOkcuV1Rj22SHidx4UrclbiOCjvpI?=
 =?iso-8859-1?Q?RZADsOno4lTaJzuBFX0tkF1LY4PYMLrYfytOLRCkx0jefG3Q3r5xL1tOLW?=
 =?iso-8859-1?Q?7X9BsGKp4cYQdG01dKmYqdyeisUH1lob98zacY4b2krXU8Vg9NgmRSVOX2?=
 =?iso-8859-1?Q?v2yykLSgokRvAyW2uCLeCIa/5m30fSq5AspKmrLWsEKMKQVjOWDJpzQpl6?=
 =?iso-8859-1?Q?pvS6DT/CFI9TJe3NlEIpiJEv4T0MkBAu2IZhv68JcGiGJhK5yE5zrtCIrY?=
 =?iso-8859-1?Q?zjIyqr5T/C29dAzU6mHZbN9dEARrJvjT74+jDP0mY1sg3aGMqAAeFDNb1t?=
 =?iso-8859-1?Q?13HQEGAjQsGpxv9HzY7YZKo5NaU6NDZXHh2/4SjlsMGIz31cKnFoUS412K?=
 =?iso-8859-1?Q?3XKAho7Y98uApfSzFGMbIyXLbPquQa6oC14QVyaSV++k8jEbAcy/bI9yvx?=
 =?iso-8859-1?Q?ltxkjuMrj9k4up22M+mpB4uOgu2cBPkulLeCVaHRtiAjsFWSFysLe4WNm2?=
 =?iso-8859-1?Q?03qyUOz9JNVpNeiAL1nFQzyKp1as/1WBlvuhClPsCkHkv/HyKFD3FUlVxU?=
 =?iso-8859-1?Q?ZRK/NlFQQdBHzmENRyMAlHP36y22KwIz5NbhnUpmCc1ISr6D0ClwTt2RXB?=
 =?iso-8859-1?Q?Jd+HDrtG6FLUn8FwTnLXS5nm9AlqPxGcD6zte5OuAxxX82DwOHG1uOIjVW?=
 =?iso-8859-1?Q?RAVMoO+/pFTUB4vVi5IUIj2iUAdPlTUncjEbNLCBm6JA3ZaDlYgaBuyQQj?=
 =?iso-8859-1?Q?NuD1gwSZWk9u5ncxMnsJj/ga9mWDEhwJUpKQHN7SgO/4j4xy7XcU5+0paF?=
 =?iso-8859-1?Q?gliIFcnmEoBggXvXpAnW6dmZSBgbXc6AaEty1khlhLfFTzDZZEtzVawK5p?=
 =?iso-8859-1?Q?dhBE7m+Bw0eqrnF+XkfCL02VSgeygrEOZlRvSfMIxM2HUt+fDmloLv1aVU?=
 =?iso-8859-1?Q?7d+GlU0zMMNfRzlcmu+cAeVHd65Y5otJ1tOdBmcyWkFl3w/aOMCzNBqhuV?=
 =?iso-8859-1?Q?4eTU1nz6ev32o25gcXcvFv7cplvRenlUiASbzVEUhPI4WsA9n7yo?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 823b7a40-581c-4f93-dd9e-08df04c16b2b
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 05:01:28.3873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2N2UALEw5iZTSosARRCzZhUFtWdYwiJaKKq2kYAVQyMv3PkLatGl9T9TPraYgK2qQtUqKhm1ETTxH7IS8FGCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4892

On Thu, Aug 20, 2026 at 05:50:09PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The driver explicitly rejects linked-list DMA descriptors larger than the ring size, breaking support for large DMA transfers.
> --
> 
> --- Patch [4]: [PATCH v6 04/10] dmaengine: dw-edma: Make DMA link list work as a circular buffer ---
> commit afa3e356ba74dbd5874af4d32f4fd3abdf7cbf7c
> Author: Frank Li <Frank.Li@nxp.com>
> 
> dmaengine: dw-edma: Make DMA link list work as a circular buffer
> 
> This patch converts the DMA link list into a circular buffer instead of
> rebuilding it for every transfer. It clears control words before first use,
> rejects descriptors that exceed the usable ring capacity, and resets the
> ring after termination or abort.
> 
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > index a6bb68ffdfe26..1af262b6e881e 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > @@ -51,13 +51,19 @@ dw_edma_alloc_desc(struct dw_edma_chan *chan, size_t nburst)
> >  {
> >  	struct dw_edma_desc *desc;
> >  
> > +	/*
> > +	 * For now, a descriptor that does not fit would stall the channel
> > +	 * forever: reject it up front.
> > +	 */
> > +	if (!chan->non_ll && nburst > chan->ll_max - 1)
> > +		return NULL;
> > +
> 
> [Severity: High]
> Does this change break support for large DMA transfers?

Yes, temporarily. This is the known intermediate restriction I wrote about in
the "Notes" section in the cover letter. Just in case, precisely speaking, it
affects a desc with more bursts than the usable ring can hold, rather than the
transfer simply being large in bytes.

The follow-up series removes that restriction once consumed LL entries can be
reclaimed before full descriptor completion.

Best regards,
Koichiro

> 
> By explicitly rejecting linked-list DMA descriptors larger than the ring
> size, any client driver (such as storage or networking) that submits a
> scatter-gather transfer larger than chan->ll_max - 1 will fail
> unconditionally.
> 
> While the commit message acknowledges this as a limitation "until reclaim
> support lands", that support appears to be completely missing from this
> patch series.
> 
> Could this cause functional regressions for subsystems relying on this DMA
> engine to submit moderately large transfers?
> 
> [ ... ]
> 
> > @@ -645,6 +708,8 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> >  							    DMA_TRANS_NOERROR);
> >  				list_del(&vd->node);
> >  				vchan_cookie_complete(vd);
> > +				if (!chan->non_ll)
> > +					chan->ll_done = chan->ll_head;
> >  			}
> >  
> >  			if (chan->request == EDMA_REQ_PAUSE) {
> 
> [Severity: High]
> Since ring space is only reclaimed here when an entire descriptor completes,
> does this structural change prevent incrementally chunking large descriptors?
> 
> Without the ability to reclaim space as partial transfers complete, this
> seems to be the reason why large transfers can no longer be supported.
> 
> Could partial completions be handled here to prevent the functional regression
> before the full reclaim support lands?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260820173439.2004068-1-den@valinux.co.jp?part=4
