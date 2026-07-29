Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021113.outbound.protection.outlook.com [52.101.125.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2614924E4A1
	for <dmaengine@vger.kernel.org>; Wed, 29 Jul 2026 06:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785306270; cv=fail; b=QeZmPaEYzGr5Z6mM7Uhe3DUKatpkaTFR6iCzjvHx4QvklAYtsvsH4BDaXNQrp8o6YdYSiuBKcsIVXRDdcNBTyl0aNhmbT24a2bTj1IG48Z5CL8PDMFgHFq9lIRI/kO3jdi1XquVtIYhkPn6UL5/s7sW20Q0iNlcVL0Hf3qXFjdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785306270; c=relaxed/simple;
	bh=QKwXcFmEOsJJVDRV8tGzrVzDr1O3a6qZFDu5So1Er2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BAdI7rxvVGi5KqahqGQs9tbJ7SpYJTzQa46EwIF9SScRDZomISwM2dtW6cy0zwkKU8MvRSJPKJIKCoWHEouH+GzctOlTPmUsnT3XJzZOuJMx59f9xH2lJJbmKPEV5MtM25lPISxkLYyIzZqzFx/usApNQYPkhZxyg09fJYtl8L4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=fail (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=q2lFGwSa reason="signature verification failed"; arc=fail smtp.client-ip=52.101.125.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="q2lFGwSa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWQp8JFOI21PpW+C4iOOCgiNcwTby6/cubEayyBwxJYM65zuAf5iPrbK/aE+ENfGAqrXWsNpxie3crmpJ/JEeGn6g3N2bE86e1Txz4ToeiGm8yfo5qoae8F94/NHS1JRmRniGaGLuzEj6aTKYRmxJkFGQqhoyIZVe/e/KlCfjTXvGcrJjxVkXSlISa+Hp4frjgf+PvWVdnErG5C7Noa5fn+4R4heo1FC4BDVEoh9OLuey2dxcxPgaYVMyJzgJk1CxZDZTNbhz/99KNM0KIeAeP2B7/Uvhp//DsQlCj+1wK3fzYg9juQ9SooiKT8BF+vzg7wWHyVb5GYN+/kY9TIk+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTk5/nSor6csHd8UANGwemu7FGjAG+zxVJTvP51NCuM=;
 b=Ug804SWVrjinCCp6ICob5Am8uIv9GHMA935HFXuApGGRZjHJiTQSJ6a669BGLxLmvtnSFLd8BDCQNB1m7MhXHvBVLXtwyfIN3mLCFaaq3lCMAO6BaJdNajktculg0uclUAA9rjB/j0kmEwEA/5pJ7mjgUyzr5jeBuB8/ZstslWirT6/p0dNxME2oGds1U2y9dYlIRbn6Taaud3GOYyBiR5r53vYLrxjH6Zd4x87HLafcibYDNE80DxWI8awaPHM2Wfoo2k//8iHjlC5KJgCTsgcaNzIttcuY/25Pv1DOmp16DEDpZIa2M4JjvR7I0gRo7/XydaMPp0UaIXT7WvTZhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTk5/nSor6csHd8UANGwemu7FGjAG+zxVJTvP51NCuM=;
 b=q2lFGwSaolrYiQi65sEbfRB8a2+83jB0GbXjhJcdRBSNsUBLH/QfrzIdaPdJqR/K578mls12RQ5ic7OOr4m7RCjePlY84gwu2hdOFqFt3OjLhU7ZSJbWGVuQ/8DvU3HvoDXKr1oBXxWCXbwfIGAs5DDlEg08xSqgeAIOlCncgD8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS9P286MB4189.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2c6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Wed, 29 Jul
 2026 06:24:24 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 06:24:24 +0000
Date: Wed, 29 Jul 2026 15:24:23 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, vkoul@kernel.org, Frank.Li@kernel.org, 
	dmaengine@vger.kernel.org
Subject: Re: [PATCH v3 07/24] dmaengine: dw-edma: Centralize LL doorbell
 decisions
Message-ID: <n3khjzubqdowh5sjkkdb67aoulkrnausmcchv2ksnzzbfefrdo@zqieb4a2caq6>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-8-den@valinux.co.jp>
 <20260727172326.2C5C81F000E9@smtp.kernel.org>
 <ameuMbdF6wSvDunJ@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ameuMbdF6wSvDunJ@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: TY6P301CA0039.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3ba::18) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS9P286MB4189:EE_
X-MS-Office365-Filtering-Correlation-Id: af2343f4-a2e8-45e9-e4bf-08deed3a08a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|366016|23010399003|1800799024|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ziGlj3K/vYTi4a3yV5onglEfHcTu63e9HGuq7Od6kBzSdKPBeUjdMwgg3bmBTek0DVXQhbT1Dil5K9nmf5sxCpg+SzLQHLize/tCrBAfjIm2Jn1edyzz/qHzqNmN5D7jouNHywTPQasEscX5p5E3P/NuK2yy5JL+EkpP6Ssf5cWHXf+5f1/051fF2F1BKci1q2/dZeNyxzNq41mqq4Okfo65pYlbz1SPNpSPB1XxvUNgiW3GAAk1ueqUAWQOdcYs/7Jrmh5KFAhKolINomXNsWplsW25A04iU2/Q+u80zBcf0OmZUQwCJ8+sRkj7NBfo2XHhGzi3ajYWKQ4iFm4TY8NtX0C80rEn8V4/sKAoRhI0p/xMOG27LA5b/hClmQbfnUcHk5zjDS86/yaPvc0yavubS9UJwx8F47z8kl7Vc428bdZjq15XbDy95r5hQnv1D71gsXgBSTKjyQyPKvawsUQxx3CltSoZISzgtKeBsnLc9axfWuLtWfiGZDNVXc+apqALTdkn8SN/CJSdowW2+Ji9m2syvFyFUiZu1CQG5iF8I1eRWVE9mRgm897Mxi4etGkLH/klfr+06+1gBWflwgvUR9LLjwntzWmuuPGHzTo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(23010399003)(1800799024)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?qn6lWMkeXhOMkJ8OQ8IzWNFuP7Ii35M5bUbleJmDmeEVK/CJg8P80M336H?=
 =?iso-8859-1?Q?jq2aShVajJlXTFYFdPeHsHGA9jIqbiHOFSgPTw0JDIFoLyLmoCyT9uHaQG?=
 =?iso-8859-1?Q?voEbLt++1GZodI4kR+frThx0Z4UAejGUq+uzGnYfGffkV9SXXME9EzVC3r?=
 =?iso-8859-1?Q?9CoJBDIgwt4BJKBnTGgyjb6Xva7CtDcJcbPTZ1MmRrDubu7jVU//eTkddE?=
 =?iso-8859-1?Q?Itv3JVQn9kE0FeMB4ElOIQ2D2smUUTeTjbiycdkTbVb0WUSow1CNoreMhT?=
 =?iso-8859-1?Q?ypCAN4hdxqoQaNF6J8NOjiJWruo40Foy0tHxx5OkB/IMq0HpPhfykMo+pd?=
 =?iso-8859-1?Q?sJDe4Q1tIJ54plC0Jqq7IyvWFk6918jiHR2KRMO5dUDquZAemVgrPNKnIX?=
 =?iso-8859-1?Q?n6GqCqEOZhq51/6FSugealmQNTdcS7ta9bPremmDrw0fWK3K1i/DI8mtCu?=
 =?iso-8859-1?Q?ZJgCtRB+OhpQiKJHbp3zpXcYRbKq37hxZ2UJT/uBje6IqcizYpZv9ygGUb?=
 =?iso-8859-1?Q?GUvFXG3erITYUpxW75kfYnYg76zLvBymtx2c7EP7I2Y+8HiKpiLe5tfbUo?=
 =?iso-8859-1?Q?64RzlV1v7EtZnFN2s/C62YVp84hW0ktKgv2UXrDB1r9gql9o1137UrhrsY?=
 =?iso-8859-1?Q?6q0CnawyEuK/xjDVikYfXZ3miN/kN55ra5FWGRf5ZR7+WM8mpRJGmfBesj?=
 =?iso-8859-1?Q?eP6Srv6fhYr5VxMuq2oCjYqIgozmaYV5KSywm9W/cTXPsm8IZErjB0V/Gm?=
 =?iso-8859-1?Q?JmSmgzvum7GVGp29Ppe3J37EFgAs658KF1eNEpNgXb94zswP2JKkkkZvfI?=
 =?iso-8859-1?Q?FP/0qXsja3JlfCsHvMSqwq4HzF791I4P53v+mmx24d6fz/DYENfh25L0j4?=
 =?iso-8859-1?Q?MPnyGr6kmq5IsoWZiwQIjNM+7L18rmzf/VvvqtXNB4BaWgxY1cOazTzba9?=
 =?iso-8859-1?Q?xJVqexckWB20FlXcbHniyKJZ7gYNmFpuTfLz4rEXFZHn2Hrl6zGu7Q26Eo?=
 =?iso-8859-1?Q?o+V+hzcEDre6Rsbe2jKosBBl4qCD8ukFHPwOsnZ7w6Q3Qc7WnUmFXVS9Z1?=
 =?iso-8859-1?Q?DtG/4ugn1YAPBA/D4kbTujcIffL3WJ9EcPQghRaIuVzZSJZYJXLCyrYTL7?=
 =?iso-8859-1?Q?/PzekGUEgL8pnNvSuudU8HhHPxu4+jbAs8eR8NfacYVMaDJzP+eglwKW2P?=
 =?iso-8859-1?Q?yQW9o8/Uf7XSQlBTvpyarChmrjXOtOjSz67cIb/n8LlNhQ5P+GodlfmvtJ?=
 =?iso-8859-1?Q?abCzaHBmVT9YBDIIZD5Yj/54fKI6o1W1SQLELhLPnbCM/gbyBUKwXfAKpe?=
 =?iso-8859-1?Q?VzXSbXWUhTHcahZJaB/1RCCkCK1kAc6K+t0XkO1tENU5V+1AN6KM+f2doR?=
 =?iso-8859-1?Q?MFHG2RtZOF00ry+4F7vecijl7qM7B964xtfXPENJNzWbjpx5g3rIwsxe6e?=
 =?iso-8859-1?Q?y6IZxpF+jMUXSAcYJhCpUInFH5WWPHwViui7A3lUa8N2P/eTWwUbmc5ZyZ?=
 =?iso-8859-1?Q?nmgW7voldodZWwghXIafIJrf6SBD5LjmAftEpbAlYZvPd8poYFfukG3teE?=
 =?iso-8859-1?Q?jKqtjJDJaUAJHCp50rY9zXMYdm99/5E3QQGyi03JGRD0lf0nKV2VUYuRRB?=
 =?iso-8859-1?Q?e6AeU/c9kP1v8je+LcNNt0MBkndzMs/50CvBENrQh124MEJPca94mwQ7tm?=
 =?iso-8859-1?Q?vqzoku9nGlQEcKn/9HQZ362i8jGqiUtvcse20U5EHMSIfHVfDj4MApMJuA?=
 =?iso-8859-1?Q?vvVuMGwdVS2Mnpr9C2LcCbWklr7me0VnjPO5mGEo+OIqx19Q59aBHsjZCF?=
 =?iso-8859-1?Q?+p042SnOXeC4rYGpGc3qUGh9KOjo4JaEc66tFU6Iug0gQYZcGFsk?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: af2343f4-a2e8-45e9-e4bf-08deed3a08a5
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 06:24:24.3700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2TCRuugV32ipxnhkA6y/uzMC6DPv9/aBofnK9Pm9BoYlLZM+66eBmTdKkux1kUjcQwOD9Cv9X+a/kN96sXdgKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4189

On Mon, Jul 27, 2026 at 03:14:57PM -0400, Frank Li wrote:
> On Mon, Jul 27, 2026 at 05:23:25PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] The DONE interrupt handler fails to clear EDMA_REQ_STOP and EDMA_REQ_PAUSE if the descriptor list is empty, contradicting the commit message's stated intent to prepare for LL progress reclamation.
> > --
> >
> > --- Patch [7]: [PATCH v3 07/24] dmaengine: dw-edma: Centralize LL doorbell decisions ---
> > commit ee61354242533ea66a01a91592b3314e404a95eb
> > Author: Koichiro Den <den@valinux.co.jp>
> >
> > dmaengine: dw-edma: Centralize LL doorbell decisions
> >
> > LL fill currently rings the doorbell every time. This patch moves that decision
> > to dw_edma_core_ch_maybe_doorbell(), which rings only for a BUSY LL channel with
> > pending entries. This centralization prevents EDMA_REQ_STOP completion from
> > restarting terminated work.
> >
> > > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > > index b419ff2becf9e..c036510dabcb3 100644
> > > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> >
> > [ ... ]
> >
> > > @@ -733,6 +743,8 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> > >  	default:
> > >  		break;
> > >  	}
> >
> > [Severity: Medium]
> > Will this lead to a permanent channel hang when LL progress reclamation is
> > introduced?
> >
> > Looking at dw_edma_done_interrupt() just above this change, the DONE interrupt
> > handler fails to clear EDMA_REQ_STOP and EDMA_REQ_PAUSE if the descriptor list
> > is empty:
> >
> > drivers/dma/dw-edma/dw-edma-core.c:dw_edma_done_interrupt()
> > 	case EDMA_REQ_STOP:
> > 		vd = vchan_next_desc(&chan->vc);
> > 		if (!vd)
> > 			break;
> >
> > 		dw_edma_finish_termination(chan);
> > 		break;
> >
> > The commit "Dispatch DONE interrupts by channel request" explicitly claims to
> > restructure the code so that STOP and PAUSE still have state to update even
> > when no descriptor remains.
> >
> > However, the implementation adds if (!vd) break; which completely skips the
> > state updates when no descriptor remains.
> >
> > If a future patch asynchronously removes the last descriptor before the DONE
> > interrupt handles an EDMA_REQ_STOP, won't the channel remain permanently
> > stuck in EDMA_REQ_STOP without completing termination, leading to an infinite
> > loop in dw_edma_wait_termination?
> 
> Is it true?

Sorry, I missed replying to this.

I don't think so.

The preceding patch 6 has a misleading commit message, which seems to have led
to this false positive. This is not a bisectability issue either. The later
patch adds both progress reclamation and vd-independent STOP/PAUSE handling. At
this point, patch 6 is just a non-functional change. I likely forgot to update
the message while rearranging the series for bisectability issue which Sashiko
had pointed out on the previous revision.

In short, I think the code is fine, but patch 6's commit message needs fixing.

Best regards,
Koichiro

> 
> Frank
> >
> > > +	dw_edma_core_ch_maybe_doorbell(chan);
> > > +
> > >  	spin_unlock_irqrestore(&chan->vc.lock, flags);
> > >  }
> >
> > --
> > Sashiko AI review · https://sashiko.dev/#/patchset/20260727170323.2321369-1-den@valinux.co.jp?part=7
