Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011030.outbound.protection.outlook.com [52.101.70.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4DE37CD22;
	Thu,  1 Oct 2026 19:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790884706; cv=fail; b=VGv7KCuS+BE0o8i6lArHcF2ZUaqtiu72G0/Tot4oJTKnShNk66MIy4uQivkvsx4dhV5MOtL+w4t3ISzj7AzPVsZ/+4gF2knB7waro9mgvBnQSwWyUfkx1qb0IY0BuYKbG5JijOjkqOE3vnyX/fQiOR8nXkfxTzbY2rAl5ZZPwUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790884706; c=relaxed/simple;
	bh=nmQgKEBXzRkNtVrDTBxXxgb3oEkQxfvI7IanARxgcpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lP0/+xYQPIvbj5Xt23xBjDRygs4AlkFYaMAJc7GPHC+D8kK17U74dMT2m/K1Db1aQheZ9pcLsODkvSUFYf3frw9E+dtU2JEhjzurby4Avdgk2U48PGVQRt8hGkG+ZAY/VbZ+qI6NbWpUbKNlLqTSp9WLnK2czFXqfApSPwtWHsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Tn6F1hD0 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.70.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Tn6F1hD0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jRTFePFRkJ3+PJVGGyNr5wb3YscWxD39dmMB2Iz8r1M281XhvbZP1vvwOXQUVcTcKs12MhQGkX0FML6ErNPCrGHnXA2JVeCv9Kep8uTJly3bTMrAjhaFjIT1walD+N4dYRraod3vdK/NMkS0hOruGqhieHpTX6X0y6F56CntMi+mD4HVeOJbTJHxXJXSecvEFVDQg6Ir1BtNropUraEoES5ujpYpC2PhuaO0QNnioFwS3T3Q3ld3s8nwHWMknZMjWzaLYApwFnvrmo/z77gzygRL4h4XLHWYw1xsUVrIZ30rguqiJnp4AVE3rdUwz1f5CjP4N3K7bJhJglGC3aRbFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k99kRPkbSaWHIozVOrf/9kpG85zxPbtB5UeBFmv7IPY=;
 b=MNXKd+7QlXozicJRxQzYxR7kr3UHOXVzXBhBjWXd0JV6w6y+uooohFm6gOdF8rYqEsdcWOUi8XAfWVY6yrIo0WAzLrumLokFwi6d1ChUDDxTKvdyC5RvCaKP70KZUAYFJt5wD2qZrjRl06HPYP2ArWDv8VKDfdGsHMnojhRT5kaObsHkzO3eeRGfHetsnnRcgdFj0e9iii2+0mSI1w02+I8sAi+2cWD4hQQ/LFyp8rBkjRWft3cNKyz8qy5zv+RLJNrO8fS2jRYoLiXHtrhvu59cJkLLtzdaBGEKzJVBh2RfPqOn1jayDUIJpIBM5UDFjWexMIu+vpiTPFTm7pHBZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k99kRPkbSaWHIozVOrf/9kpG85zxPbtB5UeBFmv7IPY=;
 b=Tn6F1hD0sNDwzVNKQ80W1/9gY/VcYbR/Esyn6+urpdUkMrhlS6jp9CpNkTJBgDEQHbHzNbPnAIiGomg3tEhiFRIkojJ2iLQ9yYWeT7kq9/kamJJFJSPi6ZiUdy+1pj0SN/nq4Ixm4L3e0l52aGzcTQfaCbzYZwhg3iQ+eUSJZzVIMgCkRWofy5YK4HGRKaAMeDEpne+4krA+jxUaUb4F2j2E1cKTkifZfyrcDTY3XnPMxANFDmYhy9nnLRBlmKhlxxy7Sw/M1VgSPXWOSUCYQgZUIA82ZvHbBp3i3P2QV4pUcqANSxDP5yErDlyKuA7OG+lYRqIsuNYRjkF0+F3wFw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB9095.eurprd04.prod.outlook.com (2603:10a6:20b:446::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Thu, 1 Oct
 2026 19:58:21 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 19:58:20 +0000
Date: Thu, 1 Oct 2026 15:58:13 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: CL Wang <cl634@andestech.com>, conor+dt@kernel.org,
	devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
	robh@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v8 2/2] dmaengine: atcdmac300: Add driver for Andes
 ATCDMAC300 DMA controller
Message-ID: <ar67VelbKVtiiCo6@lizhi-Precision-Tower-5810>
References: <20261001014503.786490-1-cl634@andestech.com>
 <20261001014503.786490-3-cl634@andestech.com>
 <20261001022703.73EFF1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261001022703.73EFF1F000FF@smtp.kernel.org>
X-ClientProxiedBy: PH8P221CA0035.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB9095:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e1e905a-e283-4fdc-4842-08df1ff657e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|1800799024|376014|18002099003|22082099003|11063799006|6133799003|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	K7ezrgX1tMRwGJw0zbbGlwsCeyQunazVnyf6MA4PYdapLimC/o+aGyRbHQYXx+JmvdGcqAw0wg852JHSuRKa2fT6YlGghZwn4eFmQGmAYs9jO41vdty88FjvCvgYryxgQFhWWcxkvShgIHeqrYBuyls3H0A8fvLDNrf2vm+dU91N1TTCllJ4tWZWClbGJGNz4MnogA+v7hZYbP3UqzL4LKnfF6E6z1UF1aOelyCMJ4ZzxUORuNIkhfFQtd4W2hMc8G97DJIvbNz/dlYYEILQ9UXgALrMtINjUCaQ236TTNsjF/DMH6cH8rx6HU2CsDtdd1//s7hRPwTECPzUM/BQxfjLlbIOD6sbfcIdWkLlONbWlLiVY/J+Umjzv+OG/k2pA1L1eU9RJjF5UPG/F5kCyOR5GL39txE5ZjHa7sYHfyszzk0JzXTdezXpJhS7UmA01c3BiDz9QPXJbiOBZJFsOcOzKJaEcdKi4uHYD/ZdTA69Tk+7kBtnaFAEXge4RFnql95loakwJuv9UVhKwS2hchalXFVOCpMI+93Q+0QPyUTdTtiEYkEOWeTkMcJbN5PKt7EARnpU+HEm9H1qDwqCSXCLE4Kk0t8WhhHaPcmOhcA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(6133799003)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?2Bj2KTdMbedhnF8rr1FG+SU6kbyaekygqpU1vDq7zFLbL0PhCTMlWYdffL?=
 =?iso-8859-1?Q?fwNOdKXHu/dZiru4OT/A2mHybjcoNIQFrGdlsfNSZB3+TZTMo7Dt0jTBwl?=
 =?iso-8859-1?Q?Z2b29t5zdkRLoflzS5eYxnl0aqvjRsgJOwwkdAgEM7xG02sfgD4HsfKecS?=
 =?iso-8859-1?Q?VKTUkmx6+B0OfhQwUBV0IwlId5DfeC/FJmizckqQlNARPDCt6xvs8KVYCB?=
 =?iso-8859-1?Q?9rXVxkypcwqsHYCIO1Azw0oSuzkpg5OhoRYiQrbFdb9i7p+mBLYtrpCIoA?=
 =?iso-8859-1?Q?5zLO/OatVdY3I4VyfLSrk4Fb6LuE3Ra6WZvFJdDWYI5tItnATVhCXZCN9N?=
 =?iso-8859-1?Q?Vjufg1HV06J53wKfNrwS5tf68A7DXVUR+rayNpVGwGA52LlxA0XOCPCI7w?=
 =?iso-8859-1?Q?UNZ69KQxh7BXxZB/xyjFXXnif0GHAN2aM+1vwpjJgrEKxNlygcDlhSvQ38?=
 =?iso-8859-1?Q?z8M30qViaTvx8Z717exvUEDGCXgBqdDfTa5/ACzug2JFLnLN4eMvkhA0kP?=
 =?iso-8859-1?Q?9OCBHT1sER84AJNUbBaIy2BSnu/yOakkfgqZwg1BmtMQGl+ql9sASFuUpR?=
 =?iso-8859-1?Q?qGuPFocyHYYBmrFt6K7aOdZZ7EJTZXczLVGw39w9qND2gwTEjqk+xyY5cz?=
 =?iso-8859-1?Q?QyByWJpKsovS1aE54qePzFjniB579qqS7kD0mqJd0flB20pG23Ke8vAxQI?=
 =?iso-8859-1?Q?2Qyj4sqiJouIlwJTB97np1t30+hkOAuMg/UcPHd07j1y5Ccevde5Jqb76Q?=
 =?iso-8859-1?Q?WqEA67f0LnbH98YIptDDg43qydR6lm+Rx3+qX0bBF10YHY+BA8SlC+z8gd?=
 =?iso-8859-1?Q?ewOd/7FP67Gqi3L5KZ9aUUhDNBy1dhnZNGYbF4kMesBmSKhdrRUsAMK4jR?=
 =?iso-8859-1?Q?/avUAWGbomnl+XRKs3NUOrm5DD2B6sqNs6I7YIdO15Tyf6ZdC/OXmJedTL?=
 =?iso-8859-1?Q?ZhyvbsaLPR7dB17mkqK1jSgTKlAXQceKKoEEqtx4dl45UyTVCJiEfg880R?=
 =?iso-8859-1?Q?ghjXUm9AT+I0DqtBDb/eDm3qRqiCaAUsDnERcG9YRiKnY62UvRa3Fw1Jx8?=
 =?iso-8859-1?Q?sfI/+efJRT5l2wSFzC9I+0CycK9wTnSEDZet/uy1gpy0k44NVxm7JR2nTM?=
 =?iso-8859-1?Q?AG/Ibjjbt4kQO39hSvxj6nNMCoqdldB0SHkT0lA2NXGYOCDF74K9natQiN?=
 =?iso-8859-1?Q?e6dAWQ1NAOFpy3+jXaDdmR4Xt0GloljI/+jzWJwrO5IFBjaSxGD2TBb84M?=
 =?iso-8859-1?Q?OyeYOUq99EECbiAcLlnZn71I0gd7U8wv/3X5d+38ZxqNvMFupbDsaCVQ67?=
 =?iso-8859-1?Q?eRtORAiRSifPHAPRmNYvkc+vI9/0IJve7ZUA737FnTPvGUK2a4+RpdOk/T?=
 =?iso-8859-1?Q?UrzIWNkQvjzOIuft0EN+tw4HfukmygrU4A0xNKE7oYegfDEx0qf5cFXYYE?=
 =?iso-8859-1?Q?UdRF0PgQ4F0T4f7Dt+PyGEfO04Q0+9vlufMtjl/X9A0J4aREdEp/0avgvw?=
 =?iso-8859-1?Q?xnxlW+rW4iC1KpJ5Eaahk6GeDf47h3QezmHfLOFDGgITtn1KiZWeZ99Y4I?=
 =?iso-8859-1?Q?/ynvQ572vjggYGU9CvtST8mtBtf1qtwmaF0o+LJdL1uCLnh+X68R6NZUNa?=
 =?iso-8859-1?Q?UrZwaXGWw16gmQGwEeJVVuXyFRFhBYwIi1eD33uEU3NY5acSXkxdn5H6kR?=
 =?iso-8859-1?Q?GfXi7lNqQWKuWr4bTTJSBgOOf2Hi5OH/PQymPCtF16raBgNgU1rTOxkq05?=
 =?iso-8859-1?Q?19TAtI3Eb+taoI1/aQRAAQ755bf2OK7erFQyrKIRIchGYSTMIroPa6npGb?=
 =?iso-8859-1?Q?FjoJQZ9gcL29qg8BJmhwLE40MP/4IVbaLg+p+TRa+oUjb/SPRjEr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e1e905a-e283-4fdc-4842-08df1ff657e8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 19:58:20.9146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGvcCRXlh7f2K+EsYDg3ilfl84hX4eHS0++CmryWLBvDsPaeMyHBWO8xC9PtHksbPzKBdceM9D3nZ0Hcp2rbVlbhr3A++uKkDr/5/4PPeVycZ9kbL2Ac6SeowkxHfOJr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9095

On Thu, Oct 01, 2026 at 02:27:02AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 11 potential issue(s) to consider:
> - [High] dmaengine: atcdmac300: missing interrupt enable flags in channel control
> - [High] dmaengine: atcdmac300: start unissued pending transfers in atcdmac_resume()
> - [High] dmaengine: atcdmac300: integer overflow of cyclic period variable
> - [High] dmaengine: atcdmac300: missing status clearing in atcdmac_terminate_all()
> - [High] dmaengine: atcdmac300: fail to reset chan_used flag during suspend
> - [High] dmaengine: atcdmac300: unhandled pending interrupt causes IRQ storm
> - [Medium] dmaengine: atcdmac300: ignore client transfer flags in atcdmac_prep_dma_memcpy()
> - [Medium] dmaengine: atcdmac300: memory leak of unsubmitted descriptors
> - [Medium] dmaengine: atcdmac300: integer truncation of len in atcdmac_prep_dma_memcpy()
> - [Medium] dmaengine: atcdmac300: integer truncation of sizes in atcdmac_prep_dma_cyclic()
> - [Medium] dmaengine: atcdmac300: missing args_count check in atcdmac_dma_xlate_handler()
> --

You should fix these issues for new drivers.

Frank
>
> commit 0b5c5b75d701997e0656ae1d35e0499a595165ad
> Author: CL Wang <cl634@andestech.com>
>
> dmaengine: atcdmac300: Add driver for Andes ATCDMAC300 DMA controller
>
> This patch adds support for the Andes ATCDMAC300 DMA controller.
> The ATCDMAC300 is a memory-to-memory and peripheral DMA controller
> that provides scatter-gather, cyclic, and slave transfer capabilities.
>
> > --- /dev/null
> > +++ b/drivers/dma/atcdmac300.c
> > @@ -0,0 +1,1759 @@
> [ ... ]
> > +static void atcdmac_start_transfer(struct atcdmac_chan *dmac_chan,
> > +				   struct atcdmac_desc *first_desc)
> > +{
> > +	struct atcdmac_dmac *dmac = dmac_chan->dma_dev;
> > +	struct regmap *reg = dmac_chan->regmap;
> > +	unsigned long flags;
> > +
> > +	raw_spin_lock_irqsave(&dmac->lock, flags);
> > +	dmac->owned_chan |= BIT(dmac_chan->chan_id);
> > +	raw_spin_unlock_irqrestore(&dmac->lock, flags);
> > +
> > +	regmap_write(reg, REG_CH_CTL_OFF, first_desc->regs.ctrl);
>
> [Severity: High]
> Since INT_TC_MASK, INT_ERR_MASK, and INT_ABT_MASK are missing from the ctrl
> bitmask written here (and constructed in functions like
> atcdmac_build_slave_desc()), won't the hardware fail to assert interrupts
> upon completion, error, or abort? This appears to cause silent transfer
> timeouts.
>
> [ ... ]
> > +static void atcdmac_advance_work(struct atcdmac_chan *dmac_chan)
> > +{
> [ ... ]
> > +	if (dma_desc->cyclic) {
> > +		if (!stop)
> > +			atcdmac_start_next_trans(dmac_chan);
> [ ... ]
> > +	} else {
> > +		if (list_is_singular(&dmac_chan->active_list)) {
> [ ... ]
> > +		if (!stop)
> > +			atcdmac_start_next_trans(dmac_chan);
>
> [Severity: High]
> If stop_mask is active during atcdmac_suspend(), this code skips calling
> atcdmac_start_next_trans(), which bypasses the internal reset of chan_used
> back to 0. Does this leave chan_used permanently stuck at 1?
>
> [ ... ]
> > +static int atcdmac_terminate_all(struct dma_chan *chan)
> > +{
> [ ... ]
> > +	spin_lock_irqsave(&dmac_chan->lock, flags);
> > +	atcdmac_abort_chan(dmac_chan);
> > +	atcdmac_enable_chan(dmac_chan, 0);
> > +	list_splice_init(&dmac_chan->queue_list,  &list);
> > +	list_splice_init(&dmac_chan->active_list, &list);
> > +	dmac_chan->chan_used = 0;
> > +	spin_unlock_irqrestore(&dmac_chan->lock, flags);
>
> [Severity: High]
> Does this code fail to clear the software state dmac_chan->status before
> dropping the lock? If an asynchronous abort interrupt fires as the channel
> is terminated, the threaded handler may process a stale ATCDMAC_STA_TC bit.
> If a client immediately queues and issues a new transfer, could
> atcdmac_advance_work() prematurely complete it?
>
> [ ... ]
> > +static void atcdmac_free_chan_resources(struct dma_chan *chan)
> > +{
> [ ... ]
> > +	atcdmac_terminate_all(chan);
> > +
> > +	/*
> > +	 * Give up ownership only after the abort raised by the termination
> > +	 * above has been serviced.  Dropping the bit first would mask that
> > +	 * status out of the acknowledge and leave the interrupt asserted.
> > +	 */
> > +	atcdmac_synchronize(chan);
> > +
> > +	raw_spin_lock_irq(&dmac->lock);
> > +	dmac->owned_chan &= ~BIT(dmac_chan->chan_id);
> > +	raw_spin_unlock_irq(&dmac->lock);
>
> [Severity: High]
> Since atcdmac_synchronize() only flushes executing handlers and not pending
> hardware interrupts, does clearing owned_chan immediately afterward mask
> out a pending ABORT interrupt in the top-half handler? It seems this would
> leave the level-triggered interrupt line permanently asserted, causing an
> IRQ storm.
>
> > +
> > +	spin_lock_irqsave(&dmac_chan->lock, flags);
> > +	list_for_each_entry_safe(desc,
> > +				 desc_next,
> > +				 &dmac_chan->free_list,
> > +				 desc_node) {
> > +		list_del(&desc->desc_node);
> > +		dma_pool_free(dmac->dma_desc_pool, desc, desc->txd.phys);
> > +	}
>
> [Severity: Medium]
> In the cleanup loop above, unsubmitted descriptors that were allocated but
> never submitted via dmaengine_submit() are unlinked from tracking lists.
> Will these unsubmitted descriptors leak since this loop only reclaims from
> free_list?
>
> [ ... ]
> > +static struct dma_async_tx_descriptor *
> > +atcdmac_prep_dma_memcpy(struct dma_chan *chan,
> > +			dma_addr_t dst,
> > +			dma_addr_t src,
> > +			size_t len,
> > +			unsigned long flags)
> > +{
> [ ... ]
> > +	desc = atcdmac_build_desc(dmac_chan, src, dst, ctrl,
> > +				  len >> src_width);
>
> [Severity: Medium]
> When len is a 64-bit size_t value exceeding 4GB, does shifting it by
> src_width and passing it as a 32-bit unsigned int to atcdmac_build_desc()
> cause silent integer truncation, resulting in a partial transfer?
>
> > +	if (!desc)
> > +		goto err_desc_get;
> > +
> > +	return &desc->txd;
>
> [Severity: Medium]
> Is there a missing assignment for the client transfer flags? The flags
> parameter is never assigned to desc->txd.flags, which ignores client
> intents like DMA_PREP_INTERRUPT or DMA_CTRL_REUSE.
>
> [ ... ]
> > +static struct dma_async_tx_descriptor *
> > +atcdmac_prep_dma_cyclic(struct dma_chan *chan,
> > +			dma_addr_t buf_addr,
> > +			size_t buf_len,
> > +			size_t period_len,
> > +			enum dma_transfer_direction direction,
> > +			unsigned long flags)
> > +{
> [ ... ]
> > +	unsigned int period;
> [ ... ]
> > +	for (period = 0; period < buf_len; period += period_len) {
> > +		struct atcdmac_desc *desc;
> > +		dma_addr_t mem = buf_addr + period;
> > +		unsigned int len = min_t(unsigned int, period_len,
> > +					 buf_len - period);
>
> [Severity: High]
> Since buf_len is a 64-bit size_t, does using a 32-bit unsigned int period
> cause an integer overflow for buffer lengths exceeding 4GB? This appears
> to create an infinite loop of descriptor allocations until the pool is
> exhausted.
>
> [Severity: Medium]
> Does the use of min_t(unsigned int, period_len, buf_len - period) silently
> truncate 64-bit size_t sizes over 4GB, programming a malformed transfer
> size?
>
> [ ... ]
> > +static struct dma_chan *atcdmac_dma_xlate_handler(struct of_phandle_args *dmac,
> > +						  struct of_dma *of_dma)
> > +{
> > +	struct platform_device *dmac_pdev;
> > +	struct atcdmac_chan *dmac_chan;
> > +	struct dma_chan *chan;
> > +	dma_cap_mask_t mask;
> > +
> > +	if (dmac->args[0] > FIELD_MAX(SRC_REQ_SEL_MASK)) {
>
> [Severity: Medium]
> Does this code access dmac->args[0] without first verifying
> dmac->args_count? If #dma-cells = <0>, this may read uninitialized or
> out-of-bounds memory.
>
> [ ... ]
> > +static int atcdmac_resume(struct device *dev)
> > +{
> [ ... ]
> > +	list_for_each_entry_safe(chan,
> > +				 chan_next,
> > +				 &dmac->dma_device.channels,
> > +				 device_node) {
> > +		dmac_chan = atcdmac_chan_to_dmac_chan(chan);
> > +		spin_lock_irqsave(&dmac_chan->lock, flags);
> > +		if (!list_empty(&dmac_chan->active_list) ||
> > +		    !list_empty(&dmac_chan->queue_list))
> > +			atcdmac_start_next_trans(dmac_chan);
> > +		spin_unlock_irqrestore(&dmac_chan->lock, flags);
> > +	}
>
> [Severity: High]
> If a client has queued descriptors but not yet called
> dma_async_issue_pending() (leaving chan_used == 0), does unconditionally
> starting the next transaction from queue_list violate the API contract by
> starting pending transfers prematurely?
>
> [Severity: High]
> Additionally, if both active_list and queue_list are empty, this bypasses
> atcdmac_start_next_trans(). Coupled with the issue in
> atcdmac_advance_work() above, does this solidify the leaked chan_used == 1
> state from suspend, permanently locking out the channel?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261001014503.786490-1-cl634@andestech.com?part=2
