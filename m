Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021143.outbound.protection.outlook.com [52.101.125.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9924315F
	for <dmaengine@vger.kernel.org>; Fri, 28 Aug 2026 04:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892835; cv=fail; b=h9YW2plT8yP1IIWjPnfOuh67FiakT5F8ST5Esr3BsbfF3ZSSCslhrZfV2BRUn2SkzQ+gaHmWBXjqBjCsQxjBOReslMKwoV7DiVMzfAs1l0rgORkDp3Kk6WTn7gWiS4SlqLMPARYBzUScM6CfMviY7uVujtOYnhRAmBrPTwjDer8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892835; c=relaxed/simple;
	bh=OOGbK2431j0ikl3p00VdyKxp4bHx9QTiGUS0PuAKztM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YqPoM9exHsMaknAQ9nHRzgRH/cjcuIMFts9tvGN27CzSLKSGjXN3HOpSyoLSPJwM59QAlNW+jul/UAe4gXSyfMEMMLbuOMTYGMI9bOpNYpJcFqXQcvyOiHlnK/zIhZhiEku+fX74DhrTwpDIhfLKu1xLhmFerJ/KcS8PuKttp8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=fail (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=GOrjA3ed reason="signature verification failed"; arc=fail smtp.client-ip=52.101.125.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="GOrjA3ed"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rHlvwhWyxEhl/JB3/3GWNFGZgxVskh0UROm1etiWWG5H1i3xqYhMc/nrI1f/c7GduZXDOYXSrqrIamhclWKNDN+mjggYQ9UuQV/vHGiYxGj57z8C9h/Pdd6duIeiH1WNGKDtwxKKOwb5MSPo0m4gU5vbcFVb+m1WcxPlfuP8RzDeWHMAlLPeUQCUbmU8ahUJeY2lJfwDxXEAF+4MqkWKlJOjRb/dmLVujipxWMFxf2vBUGmP1elCEG84RsNU1JUhi/R32WSFcBcFlsCd3K7q9buA1Fnx228kzWFdTc9HMNdWmeqRS5K5x/s1BYelXWI0PE67CAJelwW/fogTTaUE3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYqqSkJryzYxpzKAwFuTWqZdTWfTZUkDgx3QRr1miSg=;
 b=ncf08UiPiCCI3G0ncqnru79QBfz10DeL1hqufgKbzKFxbHwB9ZwBXpSKRb7zLjB2TdfG2ohTm47fR7A2V6tT7WcvC3xIZ5q9Gfe9XPxQAu4OEl20q9syNsJ0nBObGbI8OPQccxWWn82tT/ocKt8UewR0QL9HH//lTPLmtIuGV1VhAfd0gUKgcV3by74OB+FCLjwJsU2O5ygT9sVL/slaKAt/EokNXGWwp1MoiEbl2GgS3ZfaW1y/ovGD5xdj2NJa/s+U8fBHvxhMjav89cC6P8Zk5NdOW32eMvoA4E9jSUsRKU9enclRND1A0u4GyGQ+9tAlDgEhSLo/MwxFq1LGCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYqqSkJryzYxpzKAwFuTWqZdTWfTZUkDgx3QRr1miSg=;
 b=GOrjA3edBUM8OZPt3V0b30zyvI01PyYkavQR/29wBtjojtysSaMxuDPU86dNfVGL5LdqFbqoTxJ04RULrDxFMTl1iRyxYdO6rP7+2DqJjNb8sYOjsj02I1uKaIP81ZLAQa8mulBFs21fFeNS3npTgufNB7eswYKyZSCzBNIOlPA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYXP286MB6054.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:276::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 04:53:50 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 04:53:50 +0000
Date: Fri, 28 Aug 2026 13:53:49 +0900
From: Koichiro Den <den@valinux.co.jp>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
Subject: Re: [PATCH v6 01/10] dmaengine: dw-edma: Add
 dw_edma_core_ll_cur_idx() to get current LL entry index
Message-ID: <sqp3yjwu3q3b2vzgvnby72gxpspxvczi5jhq3ywsfpatmhkklj@foli4enjbcyp>
References: <20260820173439.2004068-1-den@valinux.co.jp>
 <20260820173439.2004068-2-den@valinux.co.jp>
 <20260820174459.BC1831F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260820174459.BC1831F000E9@smtp.kernel.org>
X-ClientProxiedBy: TYCPR01CA0131.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYXP286MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bec8c98-e428-41d8-0fe0-08df04c05a35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|23010399003|10067099003|22082099003|6133799003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	SpxwB55vN3MIaq7FsFWc78HhHDQfD7U7NhXmMv0Ua6TKcV//xD7puuH3gm4sJ8OdmfiGphVnSrFhZMi/MpoMKc9akRDGX4dgOUAuccVBs4HnnTwWwkR8v0VDZM0MeFAysB3GvKfxmkzA3ckPjgqxN/TBi/+Li60pfmoEURw6xT7xLXm/Kvl+wwCYuNxcWIuC/eoXfzyvceehuVCjGr5LvEoq8Wn7aSVfXw9/+/RCEBSn53VM9JgvIy4YJunj0RYcINxlNE8q9zlD1ZbSl+PnmTtp3vh6PCgeU8Ptuwtm4P5fvrc+eJhlMOxiM0fqh1MhlF3XA2xX26mJEl9M/r0mkVTuCqMBP38e1pYqA6AKNvYO2ajTI6mx1ir+EWquL/cHWAuiqAnHf4XiZNzFKOmlSeXmwZ3N6ooXNWwh86bbyRqsZUUFx/eIK9wd/95GSZ4g+bx5LJNBcb8R7LxVOndVv0fFhHEj+xcBBS3eavI3LsY9pI/UfTvFzU3Gc3Hs9jlNFqjdKyUY/DzFLxo0lvhkvzZRRWyITG/7D+feorL+DrdGofAv0rFpcyBWvUoqg2b6oBvkAPWHoRPBb7b2xrnzW63e5CCmcBuCKR0vlpJM060=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(23010399003)(10067099003)(22082099003)(6133799003)(18002099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?vqeSErc3fCE4sfM229y1M8GeDwh8A+Jo3HCyDzUNYr5M5VD8zTfA97M4bU?=
 =?iso-8859-1?Q?4CC3ioEwBsvCczaFd72kgkc9Ag5mP/zBWN9VOfpjNsCBBKaB57fb/zYABg?=
 =?iso-8859-1?Q?8M1r1qmL70/gu+tzKi+VbRjgoi3lZNKDR/1BCa7kBHMWIwO+3QJUQFUw+g?=
 =?iso-8859-1?Q?04LM3goPIZ/JyT6CYim2KTgsnpBWh+ZrhSd9vkmZ8ygnsvg44eWgkwA1ZP?=
 =?iso-8859-1?Q?VwotDjr3QBs99TniG5/M9kZiZwOjaiKvdFX4Bt/TTSSTWNNwuvulYbtgCE?=
 =?iso-8859-1?Q?n1nMaF2Ldesblh534hc0WmzY3su40UnLr7CfuXDK1YV5EufmFagYyGcfz5?=
 =?iso-8859-1?Q?bP9+CtLZZmRR76j4czbgkF5hG3lWujWImXQ/gkGYo/cA2xbaZtVGNskJUm?=
 =?iso-8859-1?Q?Ky7Dfdq38IC7eqj/Y2faLrr4QJ6KRmhYw1rO+7mWk/H0Pl4jp1wSTt3btT?=
 =?iso-8859-1?Q?0nIyqIs6l6vDlX2KTv/nqAB/4NRt3vQlCr5mZP/zNXCcIXRERzd+E0k2fl?=
 =?iso-8859-1?Q?5CMUH0W0KmjFWTH/HM0fGt8ubL9budxMDANDoqpzdMmRkQwQ1fVNb9ujET?=
 =?iso-8859-1?Q?dSgg2R72C9p3BeEZ5cxcq4EdKCCnBEswWatW4LGNwbQYzBc87YFzF73pHC?=
 =?iso-8859-1?Q?KgaW6l2dQ932+YdlWZArvmzeXKR2eMteGpTQ6TroMPeOf6yZiyYEQ5FML6?=
 =?iso-8859-1?Q?NeQs09MNw2QKihqVg/DSEPjy3FtO/I6KbWzGSrYyLuJE5wZq9lqzwaKvkS?=
 =?iso-8859-1?Q?QaWd6xpCVtKajpImx992QewTjX06s/lSEWIoc+E4RmBmQrgxoLQBNGBS/a?=
 =?iso-8859-1?Q?KFhL5T8QV5LgfW9eftOsFTypJP9qr3tb2VAxNcB164HCpYkII+zDq4ykuO?=
 =?iso-8859-1?Q?KqPvTV19BeMy2h9dIjJReTqmPgU0WRKEBIp2XOXCQcqqCGo1yw6XJ3Ko3F?=
 =?iso-8859-1?Q?+UOi5z2xnQosVnOE1OujHwWPtsYcH4yVT1k5nMrFcAuEtycEB6oGkY8WDv?=
 =?iso-8859-1?Q?bODaz7s/bOYB36wTzuSuedTgzJLVu9BzFrrwUnrYWyMYTdcqEEIGcMEAC2?=
 =?iso-8859-1?Q?HFeTAHJRUaMeFlmwtEEbhVM7oJqavOBJyKLxQUfBRS90rB9SOURLyV1m2e?=
 =?iso-8859-1?Q?Ae0WGmQhRn0BDiiUrUDqIaNBlE+OUxMY8Fts+znViOa7Ylz6lwNhA3z3iK?=
 =?iso-8859-1?Q?TBSfWTZhk7JEh8fpOfDdKRC224JBTY1Nn/jdn8Pz/ZU9MCrtdGLcW47r8M?=
 =?iso-8859-1?Q?TH34NftuALa1YT93pfB85Fh6+BrhJNCQhYspPYAiFaYFQnYVdt55MDGMaA?=
 =?iso-8859-1?Q?tzA3xtY/4N9uBxyD42jVt2l/FuRkue/OXQLVkazsKI9okW8U0yQBhDrljj?=
 =?iso-8859-1?Q?t2cRsSqgsXoU00jvIPc2Q/GDsg2+Hc1duAVqKtbnyRXXqKMd/PcJXmdNSE?=
 =?iso-8859-1?Q?/4scTp0jp2FJ8PJuZkRLReLMZ93/06W2X/jDGLYeDSGqFbc1lk/sNwP9an?=
 =?iso-8859-1?Q?pWwqals4wcW4kWCC/BxZS4MLIau9NrpuGmrToORM2eWsP/CFdCt3aCSWXk?=
 =?iso-8859-1?Q?kWo7zHZqoOB7GYMqoZ/CnSs9p82wjxrwURe0J4IRufvce6Iqw3OgWQmtJc?=
 =?iso-8859-1?Q?LLnK8ZGEUV432YwIblzVe0HBnG7O2lVw/aoyNnAB0uKy+83WzVU5AG8jTj?=
 =?iso-8859-1?Q?Xi0I56B80PUOhQVa+PKLQptnGvacl7NXVKAoJ2cnlmaHW/EZA6j9VE73r6?=
 =?iso-8859-1?Q?ocoabgIo4aWnr256RQmZf+uh4DqFZr4pj947fAUzpe1J5gvgmetH1vGo1S?=
 =?iso-8859-1?Q?qZ8GPxQmV7xN8MjwGuRVCBHXZQKflMYW+qW/6NvKcbIdnqOsS335?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bec8c98-e428-41d8-0fe0-08df04c05a35
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 04:53:50.5004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mc4p2aJ2W4FB7N3jhcBL+CjAG4rWfsRua0eITXF96Of35sKPZdOLyk9qZajjWToJu1a9/j1gr+rsj3ChNVzMfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXP286MB6054

On Thu, Aug 20, 2026 at 05:44:59PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Unsigned subtraction underflow causes out-of-bounds hardware pointer values to return a large positive index instead of a negative error code.
> --
> 
> --- Patch [1]: [PATCH v6 01/10] dmaengine: dw-edma: Add dw_edma_core_ll_cur_idx() to get current LL entry index ---
> commit a5cf77298fa28da8c44ef71a7e3da99c79085cf7
> Author: Frank Li <Frank.Li@nxp.com>
> 
> dmaengine: dw-edma: Add dw_edma_core_ll_cur_idx() to get current LL entry index
> 
> This commit introduces the dw_edma_core_ll_cur_idx() function to retrieve
> the current linked list entry index. This prepares the driver for the
> dynamic addition of DMA requests while the DMA engine is running.
> 
> > diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > index abc1bd4c0be2e..cc80591829403 100644
> > --- a/drivers/dma/dw-edma/dw-edma-v0-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
> > @@ -616,6 +616,25 @@ static void dw_edma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
> >  		  FIELD_PREP(EDMA_V0_DOORBELL_CH_MASK, chan->id));
> >  }
> >  
> > +static int dw_edma_v0_core_ll_cur_idx(struct dw_edma_chan *chan)
> > +{
> > +	u32 base, val;
> > +
> > +	val = GET_CH_32(chan->dw, chan->dir, chan->id, llp.lsb);
> > +	base = lower_32_bits(dw_edma_core_get_ll_paddr(chan));
> > +
> > +	/*
> > +	 * LL regions stay within one 4 GiB address window. Reject an all-ones
> > +	 * MMIO value. If the low word is zero, use the high word to distinguish
> > +	 * a nonzero boundary address from an unprogrammed all-zero context.
> > +	 */
> > +	if (val == U32_MAX ||
> > +	    (!val && !GET_CH_32(chan->dw, chan->dir, chan->id, llp.msb)))
> > +		return -EINVAL;
> > +
> > +	return (val - base) / EDMA_LL_SZ;
> 
> [Severity: Medium]
> Is it possible for val to be less than base if the channel context is
> uninitialized and holds a stale linked-list pointer from a previous
> allocation at a lower physical address?
> 
> Since val and base are unsigned 32-bit integers, if val < base, the operation
> val - base underflows to a large unsigned integer. Dividing this by
> EDMA_LL_SZ yields a massive positive index that fits into the signed int
> return type, rather than returning a negative error code as intended.
> 
> Would it make sense to verify that val is >= base, or to bounds check the
> resulting index against chan->ll_max to prevent potential out-of-bounds
> reads or writes?

I think the reported OOB access is a false positive in the current flow, unless
hardware reports an LLP outside the programmed LL region.

  - Once the LL context is initialized and the 'base' is written to LLP,
    hardware only moves LLP within that LL region.
  - Even if the dw-edma driver is remove()-ed and then probe()-ed again [1], a
    stale LLP cannot be consumed. Probe clears stale interrupt status before
    requesting IRQs, and the first LL transfer writes the new 'base' to LLP
    before any LLP sample is used.

That said, I can add a defensive range check if preferred. It's cheap and should
have no measurable performance impact.

[1] Frank previously suggested preventing dw-edma driver removal once the
    endpoint is live:
    https://lore.kernel.org/r/aiHe9UG3FwIACC8B@lizhi-Precision-Tower-5810/

Best regards,
Koichiro

> 
> > +}
> > +
> 
> [ ... ]
> 
> > diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > index 36ee72efcd317..19da1c8fd6159 100644
> > --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> > @@ -384,6 +384,25 @@ static void dw_hdma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
> >  	SET_CH_32(dw, chan->dir, chan->id, doorbell, HDMA_V0_DOORBELL_START);
> >  }
> >  
> > +static int dw_hdma_v0_core_ll_cur_idx(struct dw_edma_chan *chan)
> > +{
> > +	u32 base, val;
> > +
> > +	val = GET_CH_32(chan->dw, chan->dir, chan->id, llp.lsb);
> > +	base = lower_32_bits(dw_edma_core_get_ll_paddr(chan));
> > +
> > +	/*
> > +	 * LL regions stay within one 4 GiB address window. Reject an all-ones
> > +	 * MMIO value. If the low word is zero, use the high word to distinguish
> > +	 * a nonzero boundary address from an unprogrammed all-zero context.
> > +	 */
> > +	if (val == U32_MAX ||
> > +	    (!val && !GET_CH_32(chan->dw, chan->dir, chan->id, llp.msb)))
> > +		return -EINVAL;
> > +
> > +	return (val - base) / EDMA_LL_SZ;
> 
> [Severity: Medium]
> Could this suffer from the same underflow issue as the v0 core implementation
> if val is less than base?
> 
> > +}
> > +
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260820173439.2004068-1-den@valinux.co.jp?part=1
