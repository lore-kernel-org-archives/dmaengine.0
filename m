Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012048.outbound.protection.outlook.com [52.101.66.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BB82F3C10
	for <dmaengine@vger.kernel.org>; Tue,  4 Aug 2026 22:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785881215; cv=fail; b=hhxU87mL03UKyaV7O3JXTj+nFIwQKz1SOxH9zXPmsaV+WR+M2DaAQP1DLuDzu+Z/wKBTOVru/l1BVoPBHoDRzm6QupyJAZGERxJJ539OWuUwyqOuSCqnn/RkE1kujmZkUawhbFKYilPppYdQ7PvpuGl2+HxIp2eJqntdfDao/GM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785881215; c=relaxed/simple;
	bh=RSPbifJbVl25vmyrx7EjIKkG+SN3rFgu2bsoZUmoSF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PE19RcfKaiacIiRPymlD1n9Ps6lVyVuh02Ss5FAwWD9ovKhYBsJSt+JgylXYCKBbh2DcRahc1ui08/835ggUntjDgloTwNSAQu9tbErHLPmsHykQ3oxWAL6LZFImSH7JGdLYagckSQ+hupHdayNwE2DiBqWAR6jTsnh9JS2YgIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fLjePC/9 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fLjePC/9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lp4XriHHoCgpKWul1XJ9U6pFSI3ttKlRjDdjN4iS0c/N74I6DyJnVc0QSsvE3DGxcaoKG4m7x5mUCsR9mkaI8SabjMqSPGMheSzdKpbpcD/KVmUKQ1IJQBo6XMU2TXJrUATepHa/cUx1mNYEbu6pn5xWjmYW8xCC8tW3W3AGbmXy3sKtEbZ3M+E5ZL2Uw4QbCZ7vj3RNqgTjx451BLPKZVG0px/lfhd9cN8ySPHNaT51Tlpy3gugZ9sH6w27wtlRD3Q4/Xs+IUIesMyRLi7CbgwdCvCZlOS176c93tsxqAalcscUMrBcQI+hvVl7OlFfg9scL40IPBRgfImrIFwfFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZAwz/n0dKGIFUUU9ovbIShIsOGKC4JZpL/4QKF/ENI=;
 b=dR/FKkHRj+Y83vYKfxKneOSbp+CNB6OTAHEEyHWuqwfznEJ7oCJWi+KFHsWHi4BX8RIVp5epnaELr/Z1asXikj5Ri5jV8g8c4aXTHJpEgsrSqdCdZhLfFy6tz0Fjpej5vudsNOCNqhWnOrmlnIQUq/JLoakou9rxo0kvywakvWPYBH0uSJtVvT0zkzYkBN25wSOkDQCrJisq1sT9qfTZdl+Fp5Zg/Xpfsjb+DswYeUSOXVStUn7RORjhrya1Tqu/nth2VfiENizZCLxRhJO1hgPEt5Yzw7RRZ75fkvbxv/03MAgUk38zyLIo9zATJzRNNeHAbgluiTHZf2u6xbsm5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZAwz/n0dKGIFUUU9ovbIShIsOGKC4JZpL/4QKF/ENI=;
 b=fLjePC/9ZPHnWN3/1qxE2ZKpXANUrPtE2Dp3dAGE58fHvgf20zGpdvuxUrYOW8kn6kGPaJfRLqVWqx+5QpeQ8tNY3ccqfWg/q1v30eGPstXVo/bJiNphb+7sNaNYRynuuvV36FcbKvVWPZ8ENdy1j6LWFf2Z3pfp+XQXPSCP0c6UgyPEPJWDpTt5uih943nq0R39AC1ZW2yR1L0OVeFKbxGfzAxE9Hksi+Br7x7vC/Mn5swOse7nW4ZTm927lIQbn2fmOETN0NXfgZAwcHnF86qYjEpvSNrwGGqD/UYwNSHGexLWLzOAvKgOt5yuyrEqwM70js2R7wCN7FTlIw3S/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8596.eurprd04.prod.outlook.com (2603:10a6:20b:427::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Tue, 4 Aug
 2026 22:06:51 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.015; Tue, 4 Aug 2026
 22:06:50 +0000
Date: Tue, 4 Aug 2026 17:06:42 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	Frank.Li@kernel.org, vkoul@kernel.org, imx@lists.linux.dev,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH v8 2/2] dmaengine: fsl-edma: Support dynamic
 scatter/gather chaining
Message-ID: <anJicljn3M1ARmkQ@SMW015318>
References: <20260803-fsl-edma-dyn-sg-v8-0-dc2b0317206d@bootlin.com>
 <20260803-fsl-edma-dyn-sg-v8-2-dc2b0317206d@bootlin.com>
 <20260803162821.70BF31F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260803162821.70BF31F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH8PR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8596:EE_
X-MS-Office365-Filtering-Correlation-Id: 0da32fcd-2501-412d-144d-08def274af47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mB7P+VxHO7Qjb8figQ7gvxJs142EwFYIQf91cbGUGNej+mT35oGoquj3qE9qnevHqadRSYL0FAr0NJWxYuTg3dC15hD/4Gcw9OqqVnM8ifIR7tZWqsEwD4cuQM4H8gkBIytrzSXSb9D9TWdFmlTzbC4lrye1sOMhIIdY+6z+4Rho555sl36CvoXMZtNHlXI9s/DmqP0zLWlKsrrEpKZaTGB+324iCD+swoYcaXVOUy5R/ZrlIZVtdIdL2tJ5GBdccu9OQktLeWphUeqr82TbCyPjeEEtHGopCYzRhgd9rUwpcxfDtn0TS3fandq41qNuyX2g7i2Kc8zAZnRQJTlrVWHIyHBAztIfdp04dEfdQ+hmEjLldhhiCkBu7NAzMEDchRJ9UfUNr7YGkAMNs/ruYNzTwdWJ9XV8R6zuAB96i9QsCx35i3F8GfjzlkNGADBOvqdXVSV+x4xqXP3HhzQTM2BogseWtU13HqRbdEg3cr2JC9EYXROzLovOSGRwSwn1tqJIYFSm/h+mTxgeto8H3p7pU3MMM/CEC7KuRcPx7rJEGVLy1J7l+pntRJcxqQv9oyZE9968lAiGDHEJTCUPlLaJggEf3DtdrnAuVPvbTFw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?BJ7UwV9rr9snflgK5TEfTYal+sE3axHyRQ+UfPbXNsiUiATlYmZdWBGGJc?=
 =?iso-8859-1?Q?QWhegYBiTM/IG3u6I8Pt5o0N3ouafMojnrFwdYjNBGMI6gebCjaL5EO9uY?=
 =?iso-8859-1?Q?3meexBZdSl4sgvi4flqYFSu9b0A/x672yw2smMcKGVtJNcXVnVfbfu8fsZ?=
 =?iso-8859-1?Q?iQLzHkdMZ+cJjusVqQP+HwclEX1x2uQzwuGUffedSSQDgwPOtpuyJWd2aw?=
 =?iso-8859-1?Q?Gi1DbzfakpUNbpKHPYzMcn26h+3A9N7qtfg9QKHpBxg9iqbMxHv3ZQLXXW?=
 =?iso-8859-1?Q?t7hiiz0rhMfsubFDE7mEorcUjUthWN7ck0jNl7VT75cOLEQ9SJK1fpwnfB?=
 =?iso-8859-1?Q?tCWMOS7WIW/Mo4cLZdy25h/PZsLnnp8/oCCKjgFApy3fQk+COLP9icludk?=
 =?iso-8859-1?Q?psyuubUiJbYXKYP5JG4nwlNaBxD1cywk9D2YE1VAnvmdjCF3cApUNI2vYF?=
 =?iso-8859-1?Q?giJNrrwoWH9YmxG1m8YXdf+ANhvdu58f4Ga7LQD2nb8X0zxROo/C97lT6I?=
 =?iso-8859-1?Q?JzONhN/A/zLqZPj2zxF3d1MbYxuL4gvyy/di1qlNZqLfGmlRaPUW9Vedo5?=
 =?iso-8859-1?Q?SkY8y2aohUxf9c2BaksZEei/o1HBdkU44Fh2Z0EcHBnErOntmlpHd2RJtt?=
 =?iso-8859-1?Q?jBN0TnFro9HakCb0KZDcdPyA4SmCNziHI0uYXPhegtgCZ56YXMCYu//mPl?=
 =?iso-8859-1?Q?NEwoKt77afuzcou2BajchwhBCcb3Hl2TPNE71gPFKULhN1f7rcEZmMRRjm?=
 =?iso-8859-1?Q?xLKzt1wwyr5pbLoR9gSvVWdPc7pjrcF0TCqaeP+BxeqPMARj2jKiRpkooC?=
 =?iso-8859-1?Q?Im7Acr3nRevz2ncKPVyFVUeNR6vnCaeDVrkjNoJn12s7Opcy/QxgUWqwTV?=
 =?iso-8859-1?Q?nd2mMFJ+AQ6tXMALrYQRDjnMDZrkilaYdDmuVM8dnljO95ZxVaa1xpqgaL?=
 =?iso-8859-1?Q?Xgfa9efxOFZ7m7RRRf/up+66wzP8mbn1dezn5WmYPgHBk+B8ArEjjBDtgk?=
 =?iso-8859-1?Q?H51blrMrsChiHlusHJLKCqjCimL9BbQxf7B0/xXPCcSIym10ARSoDNZCUQ?=
 =?iso-8859-1?Q?SkA6r/IPKQKXBvwJd8u7yw/GihWuZgHMrSWIDqD2idU4pcLRsAIsEmXTFb?=
 =?iso-8859-1?Q?LqU4H399gmZoPWM9spRmkcf2NtSEZqeexm/ltLL+y1U3JfYDWb+390yVFN?=
 =?iso-8859-1?Q?o8njhhOAkm3uJZ7urFY1OQ6vMWxhncQTFCsfmFxLr8/qYOm3YxNTWfurgh?=
 =?iso-8859-1?Q?txp4T6MtYU9/7CZPRlA1pBuRlxu+G1ZZPzDy2dTcGQvwEHyq/WevtVa21Q?=
 =?iso-8859-1?Q?RHUDvFfGD5LrJPcUqilbmFnPScbLTfEdfqlMORPfoWvYOXidzevLutx0OB?=
 =?iso-8859-1?Q?69qaJFTgc2RADf39RnSFpW03UjYbMvTZDH0cGxcqS4g5gULFJUe4hL4fsP?=
 =?iso-8859-1?Q?A+S0IZnwZNBfQGorTN+qnFe8HIEnmgneJxz8Wr6Y1qpLIOijBmMC5xA6k7?=
 =?iso-8859-1?Q?xFWCAceB5Uha6wT2glaAsFQgWUQ52sYiyDiKQBSZxCQ6euSa3afkYt7IeS?=
 =?iso-8859-1?Q?B8cj1bG2obVUevksLkWMtO6o2aRy2W966RkH9hn0kbEY6VekwToiQxDbLc?=
 =?iso-8859-1?Q?tNKocgZQjrYKYNjCqm59zMEFNZ7+TnJBk4e7a3TIgPhaHuzA3A0TWgdzmb?=
 =?iso-8859-1?Q?+NNohvjVe7TCDdeM6bcsfW0Kez21KkSg9e5QoojghdDnL5/K05VKZokXxc?=
 =?iso-8859-1?Q?Dnv6RqkkVMUbYpTGmQODvUbZMQY76eK25kJSXIoq+sX3dJWya6VCuvr7Fg?=
 =?iso-8859-1?Q?tfwJwIL8HByWgEVLKLXbXoA/WE5K9hR6G2q95Xh2IqU+mfQp1cKl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da32fcd-2501-412d-144d-08def274af47
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 22:06:50.7592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RgjRJM1idZYy0MSHIF5tL0fagzSFcE2928dKO8VATBkH62PVnH/xcQo/90okcGg/fw8UM1P5bkbgjZwQZTmI+zy+T2xC+B9nSmR/vaRfqH5PamxehEkYtFn6dYok1sGe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8596

On Mon, Aug 03, 2026 at 04:28:20PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] O(N^2) algorithmic complexity inside a spinlock during scatter-gather descriptor submission can cause severe IRQ latency.
> --
>
> --- Patch [2]: [PATCH v8 2/2] dmaengine: fsl-edma: Support dynamic scatter/gather chaining ---
> commit f4efa8f669813b67983a5bf98e40939bbc5e00b4
> Author: Benoît Monin <benoit.monin@bootlin.com>
>
> dmaengine: fsl-edma: Support dynamic scatter/gather chaining
>
> This commit implements dynamic linking of scatter/gather transfers to enable
> chaining multiple DMA descriptors without stopping the channel. It adds
> fsl_edma_link_sg() to dynamically link the last TCD of a previously issued
> descriptor to the first TCD of a new descriptor.
>
> > diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> > index c5f5951c988be..189eb9d1269ea 100644
> > --- a/drivers/dma/fsl-edma-common.c
> > +++ b/drivers/dma/fsl-edma-common.c
> [ ... ]
> > @@ -931,14 +958,93 @@ void fsl_edma_xfer_desc(struct fsl_edma_chan *fsl_chan)
> [ ... ]
> > +static void fsl_edma_link_sg(struct fsl_edma_chan *fsl_chan, struct fsl_edma_desc *fsl_desc)
> > +{
> [ ... ]
> > +	if (!(last_csr & EDMA_TCD_CSR_D_REQ) ||
> > +	    last_csr & EDMA_TCD_CSR_E_LINK ||
> > +	    list_count_nodes(&fsl_chan->vchan.desc_issued) >= FIELD_MAX(EDMA_TCD_CSR_LINKCH))
> > +		return;
>
> [Severity: High]
> Could this list_count_nodes() call cause severe IRQ latency spikes?
>
> list_count_nodes() unconditionally iterates over the entire list to compute
> its length. If the list contains hundreds or thousands of nodes, it will
> traverse all of them, well past the limit of 31 checked here.

Nice work, only left this issue by found AI.

>
> [ ... ]
> > @@ -949,7 +1055,12 @@ void fsl_edma_issue_pending(struct dma_chan *chan)
> [ ... ]
> > -	if (vchan_issue_pending(&fsl_chan->vchan) && !fsl_chan->edesc)
> > +	list_for_each_entry_safe(vdesc, tmp, &fsl_chan->vchan.desc_submitted, node) {
> > +		fsl_edma_link_sg(fsl_chan, to_fsl_edma_desc(vdesc));

You check return value, if > 31, use list_splice to whole submitted queue
to pending queue.

but this is small optimzation.

Frank

> > +		list_move_tail(&vdesc->node, &fsl_chan->vchan.desc_issued);
> > +	}
>
> Since fsl_edma_link_sg() is called here in a loop over desc_submitted, while
> holding the vchan.lock spinlock with interrupts disabled, submitting a large
> batch of N descriptors (e.g., from network or ALSA drivers) could result in
> O(N^2) list node traversals.
>
> Could this heavily stall the CPU and potentially cause soft lockups?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260803-fsl-edma-dyn-sg-v8-0-dc2b0317206d@bootlin.com?part=2
