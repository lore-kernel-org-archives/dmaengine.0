Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013029.outbound.protection.outlook.com [52.101.72.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE5B5172C6;
	Mon, 21 Sep 2026 21:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790027525; cv=fail; b=N+VrKxEbYt4rc4o9twbsYmfy2rnPOMzA5QdTC4bEKI+rotCrb0kktbM2xTOT1VCi9DxmnSb45QyXh2LL74VompwnA9sy0Lx/s3iExtEOE8YTuLXgeROC1gFFuv/7tHGb1dZ2MyzgvlaF8ga0+i30GbG6NPzvlPM7V+AUM3H7xL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790027525; c=relaxed/simple;
	bh=HDjGK5oPJBpWOexgAYfqx6YN843Plbqc0Qza+mhrGLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pX7AgoHDTmgxPk6y+Ll78xFhUZ1x/wkuFmwdi0xlv3vIthO1Teuop1pLDOqVRzjjKlJvMFJt+KrDY8MqO7MYlSNuKLHAPSlOgZJKPhK8NOXyU0XS7JnCK1LRWXh2Xh8rbRP/XURMALuyTJW7YNmW/+V/SCoktV7liXgTvjvu7g4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bGNWOD1Z; arc=fail smtp.client-ip=52.101.72.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bGNWOD1Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xl6yax0bGHqTe38ggaac9jGEip83OQ7TEhdRnnPplxY2n+HezEMuduLCN/VIZXTIMdXTw3Ohs8fDYzKHdA9jg8Yq4iWbWHQeOjfQxsa4fuEW41VwGNIdWGQEjvd04rtDM4Lki3IBKm5EyHFG5zuAXCjsmnUo3mvb4B8553L3UIy2a/rJpBpzeSeminZzZy5lHptjFe27575kWv7KnLAdQ2Yd8VZBzLU+aJy1ltSNFLEAF574mtfwappxuKnRjNwltyIOMFeGs304fAIp9qK0jWPexbZ7P8QdHOg0ATTh37hoqyss4clN1aRjLpfqbbBir/EDEog/PHuZ//SX7B5lBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBDs31lYXSC4IrCuODE1TKNnzOgeHKSKhK1ikqMgFl4=;
 b=fGrhwCGAdjlB0rhJr5Yl/xo6qidkwIYV6kWNdJvBPQY085PHMwHKYA2v7kswJrCtwtvWRHOAmw9ReQf5Q7yiswPp0vbEo/d9ei57xIik3IvdseaFXmf/ciCledk97wK6UdscK8/ePJ9+AlM9wIpM0Qm6d3Vbib+gsxsruTdyboZT9rlFygpyrDcrlz5G+bl4ookvJUHvs614RbRraFgLmEZplXrUffTqegVKP436wMtkDduiG7ev593j+SGt9kCvrvsIgd5dqUN5a0dufnS94q7xM71H1B808OGmOXge6XSDICKLJj4NmqDP5CrLAkBZGiF4vnW/E3LEpGlIUkUtvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBDs31lYXSC4IrCuODE1TKNnzOgeHKSKhK1ikqMgFl4=;
 b=bGNWOD1Zbg3OQt3H79lp/nSSiR627rHqASMDy1cemqgy5DfljKNHwO7JEwFr7t9s1pX4NyL+f2YejPzKl/C76/G0aoPcEPjdIVxw4/TFpoYWljTHyXOmByIwYiulGnN4UEAIjfoBIverDd/xF8LuFn/4RYsiR8PxMiYGuIsZKc5VjLadDDWVfYhIc/S/NXjtw0WbFHxIZu7vOD/TdhR3wSqVR44FFv2j1+Okqo9KnL84PugkIxXv0cSyMU9G8I2+fGwpqBvtYb0sCk+fjimDeTJNI1GTShuVy2qSTLzi8nm+3JrYB6E8wiheL9I5qCTOHW+w5mEIziTV6oyrcioFiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB529741.eurprd04.prod.outlook.com (2603:10a6:20b:789::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 21:52:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 21:52:00 +0000
Date: Mon, 21 Sep 2026 16:51:53 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v5 03/23] dmaengine: ste_dma40: Recover coalesced cyclic
 callbacks
Message-ID: <arGm-Wivy4MXb5if@SMW015318>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
 <20260920-dma40-fixes-v5-3-5c55cd7f92f9@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920-dma40-fixes-v5-3-5c55cd7f92f9@kernel.org>
X-ClientProxiedBy: PH8PR20CA0020.namprd20.prod.outlook.com
 (2603:10b6:510:23c::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB529741:EE_
X-MS-Office365-Filtering-Correlation-Id: e9ce3add-a391-4664-f134-08df182a90af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|376014|1800799024|6133799003|10067099003|11063799006|5023799004|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Wn5wFblqLxLLtuEjf/B/8rypl28H1AltQkJ+CUd/mxmMtS5oFBZEM1tCMsl6vfaTzG1xUbLLh9DyYSEauFe1DvEmqdkT+fN5gvKiajmavvVmY7UT0nQtaV5raH0COzV3/+xqqAN+QNuAJZGBXzL7Uvwygee8E8UM40fZo+q6hgh+uOR9fJ15hzNjnRy5P1FqXE4UG3Tml7ccMlEAUJtBjlBnBGfTTKpvCL0tU+SVbJMoYlRhJl3cRLk+iY668gkvEkRF3p1FZnV2iE/LXh8wfXkEtaf2Hn+mZF2BAsM+twCicdk1CBRe7gJn2jGDtrCf64376BOmAHvFvm+04N8RIE2xihp+F28W7GFlXh63EFvzdrC9BVu3nID10DNsHbtLsNT3SoTkfhgNaTGCfqQhTaMwjec9roXDeCIvC9ruffhClRQLImZTw6iTw2kSmnBhDtDmTsbqKBFisawf5DbsAMNwimzwCTY/xPcAwpeU47CLOztxOL9nPMjbTFvjZ6dpPsvAxyuNDh3EXOkJhyv35PV0VT0u+tuqTAK5IMaRLYkbHZ61Ob9h9bnrg4fQZK1rDxIbA7V6+cOYRqGSGenSoxUuFakmS3MYL63y2DvpcDDVDH7GxlOZ2e78zJA4I9UchkMkukkClcbRUn4Lq6aXdR2NzPJFW+M6hLXaqKpTrmE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(376014)(1800799024)(6133799003)(10067099003)(11063799006)(5023799004)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tgVt0FCJd+6YI1UqI8xvpNQ2YU8vR4HkUK2LOSuwuhDryzb8Lukuclb2rR91?=
 =?us-ascii?Q?E+bQOp3mMTNwEmP7GICdJ8KQho2XRJSajXWaOS2DKMqGMDceh7ItL8dbKsII?=
 =?us-ascii?Q?G8aTdzY8KXQJ3ac/QAv7eZ6OqF9m9lyICXX8wc04gKBoO2eG+MAxlgcrALfS?=
 =?us-ascii?Q?DmSsUyn+Df1hUPTv9UB2nclmlnqAI+7L/O3o63/cAQeK/N+UaAxpVF6HQLoG?=
 =?us-ascii?Q?cC0QQQnjqqZ3ALgYIbHUXnAWODr65Mjt5Rb2MwPLC2rg+tAsIiKIVPSyF6sw?=
 =?us-ascii?Q?n58OTzUt9FZWWgpVPqHKXye7sK8fRUqRpoHkX0S0nsZ1+FfzQhX9s+ieB/BL?=
 =?us-ascii?Q?17Mxrm94V9XvmGkZVbSfZUmN7ckbcU0UIodwBwmYIHJX6FhxfgMqmdc5WF13?=
 =?us-ascii?Q?EPnI97+JpqNcXg0wHyhAMqLIzetKTvoOhNhiB2lJb6UqHjDB8UEh+mPdvzL9?=
 =?us-ascii?Q?d/YEGaLhf+YeYi0JXmIAkMg2j5nkzYjTAYQxzuhRsYZtmLYFKUeRFtSjHMdG?=
 =?us-ascii?Q?iiRdY4CvxHY5oNVSdcFqVdSbf1t6j5HQN4QUnul9PV6k2nhIMxdOQbvZ84Dl?=
 =?us-ascii?Q?D0JnZFOwDQMei3OLQn/U++d/b2nIebCoI5W769fDc50yumCnvBo+GV1O8giO?=
 =?us-ascii?Q?fgiO8XJKfpjm7+dUn55ABxhz9P2OjbiJe4CsMbvdsUrR8zGTdANMRRYEP683?=
 =?us-ascii?Q?nqYm6+1DVJMnCDXiKcLHnace7EoFItESOrBw61LUyc7l8xni/ozqS3mwDRaU?=
 =?us-ascii?Q?RSWH0AsowS1eOz+p9MxnYLYr/+qtPKTkcjQDK5cnbKC1D+1oQ39nKw0ii91M?=
 =?us-ascii?Q?ThvjoDJMM/vog9A27ZnXWskWA0uBi5K1g1ou4OrX8hNswfwESWmY8M2qgBm2?=
 =?us-ascii?Q?LoDrRHzuwim5qGreMavNa0F9oc/ElATOir+SLvJI8PuoF4/0VAk+qs4yFQVt?=
 =?us-ascii?Q?ClqC20IQo5ZmIPh2GzcrmEMycjC+vOlNb30knsQUNax99B8sbx/URANMWFr9?=
 =?us-ascii?Q?FjWf2X8u/xZ+ZvQvN1VOp9mgbqnY9OA+XJItQep72fLHd+rRa5nfR+Fc4N0w?=
 =?us-ascii?Q?l344G2o5ioTeTFCUfNDcewLA/6olA8p2TArtT9b/q5OgnTZlBxwAQUCRHMk8?=
 =?us-ascii?Q?Sv1OnMoqVK+cqqxX+++7jFB7oRSvfnC7OWUdnKJ2Q2PmpiP+WpasDBmSZuqJ?=
 =?us-ascii?Q?T5E8oKzyLk5Jk/XEB9ihbdO+R6QYX5FOIVG7S4U4GPZLg4oJCTZ2LuBdJVXu?=
 =?us-ascii?Q?P9x7mm4XU3fPjSvZ6pg7xh6E6XSrcqvodNft3C2eQA7qEkiMEabMWIsVnMeY?=
 =?us-ascii?Q?pPkVs2Sk4uVI+HD5M9Li88sxe44KK/Kbq5BU2Mo+7DKzfIBOjCn//o7ObIuy?=
 =?us-ascii?Q?pr/hp4Y0yYgceWFJk8YvsSMUKITNvHb9SBElrDHTZ8lKNEyLefn3FqBJB0gi?=
 =?us-ascii?Q?KfIqSWop9moDhZNhb7QIaxHbBpH3SQR3kLpVysxKWyWoQycca7dbCdq4gcOa?=
 =?us-ascii?Q?4UuRg5nczcq1p+b798ueGQB5KzG/VRS6AAf38F8uG/pyxGr4+pQWs/gOjI+K?=
 =?us-ascii?Q?1/G+Uvzd1sPsDp3qzlXqkFx34TzB1fXjeepiRmAezxPeTF7VhBJ7ZDPHSRX6?=
 =?us-ascii?Q?G7zKxQbhkgYJzhk9J6NBeeey3DB66aMVRZmXUIiKDgbqaND7lA/9REA0U/6G?=
 =?us-ascii?Q?cZv2+WoMCbAMJ+a8YBbFp85W//+jLB6wBl5JfqSemK8iCnhskcIzHx0olL5V?=
 =?us-ascii?Q?gcxd00/ESpHjKEeqr5SvYTAiFJeR6d3zPg00BJS1G1i9510PrnTx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ce3add-a391-4664-f134-08df182a90af
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 21:52:00.8052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUAiirwydzQiXSIj1UL0vvs1vyEgV52RU1usCWUOoyh3MqUO8QtqyU5uA9EbvY1K6KKQc4smLD4IuREZgsne4Qyy2NQWkjwYVPCJbrbPVuvIaMoxqfvR9U2OAvwMFJ1r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB529741

On Sun, Sep 20, 2026 at 08:59:38PM +0200, Linus Walleij wrote:
> DMA40 exposes one terminal-count status bit per channel. If more than one
> cyclic period completes before the interrupt handler clears the bit, the
> events coalesce and the driver schedules only one callback. Short audio
> periods can consequently lose period notifications.
>
> Use the current memory-side pointer to find the period boundary reached
> since callbacks were last queued. Add every elapsed period to pending_tx
> so the tasklet invokes one callback for each of them.
>
> If the pointer cannot be sampled, report one callback and mark the callback
> position invalid. At the next successful sample, resynchronize instead of
> deriving a count from stale state. Any additional periods coalesced while
> the pointer is unavailable cannot be recovered reliably.
>
> DMA40 exposes one latched terminal-count status bit, not an event counter.
> If the pointer remains at the same boundary, hardware cannot distinguish a
> repeated status from an exact full-buffer lap. In this ambiguous case,
> report one callback rather than potentially enqueueing a whole buffer of
> spurious callbacks. Exact full laps, including multiple laps, therefore
> cannot be recovered by software.
>
> The preceding cyclic-residue fix ensures that every cyclic period fits in
> one LLI, so each boundary corresponds to one client callback.
>
> Fixes: 0c842b551063 ("dma40: cyclic xfer support")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/dma/ste_dma40.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 61 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index c9983e600daf..1f9e8c7249b1 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -381,11 +381,14 @@ struct d40_lli_pool {
>   * @cyclic_dma_addr: Start address of the cyclic buffer.
>   * @cyclic_buf_len: Length of the cyclic buffer.
>   * @cyclic_residue: Last valid cyclic residue sample.
> + * @cyclic_period_len: Length of one cyclic period.
> + * @cyclic_callback_pos: Position after the callbacks already queued.
>   * @txd: DMA engine struct. Used for among other things for communication
>   * during a transfer.
>   * @node: List entry.
>   * @is_in_client_list: true if the client owns this descriptor.
>   * @cyclic: true if this is a cyclic job
> + * @cyclic_callback_pos_valid: Whether cyclic_callback_pos is reliable.
>   *
>   * This descriptor is used for both logical and physical transfers.
>   */
> @@ -402,12 +405,15 @@ struct d40_desc {
>  	dma_addr_t			 cyclic_dma_addr;
>  	size_t				 cyclic_buf_len;
>  	size_t				 cyclic_residue;
> +	size_t				 cyclic_period_len;
> +	size_t				 cyclic_callback_pos;
>
>  	struct dma_async_tx_descriptor	 txd;
>  	struct list_head		 node;
>
>  	bool				 is_in_client_list;
>  	bool				 cyclic;
> +	bool				 cyclic_callback_pos_valid;
>  };
>
>  /**
> @@ -1484,6 +1490,55 @@ static bool d40_cyclic_offset(struct d40_chan *d40c, struct d40_desc *d40d,
>  	return false;
>  }
>
> +static unsigned int d40_cyclic_periods_elapsed(struct d40_chan *d40c,
> +					       struct d40_desc *d40d)
> +{
> +	size_t current_pos;
> +	size_t offset;
> +	unsigned int periods;
> +
> +	if (!d40d->cyclic_period_len)
> +		return 1;
> +
> +	if (!d40_cyclic_offset(d40c, d40d, &offset)) {
> +		d40d->cyclic_callback_pos_valid = false;

looks like cyclic_callback_pos_valid is not useful. if d40_cyclic_offset()
failure, always return 1.

Logically, can't reconfigized n*period_len.  assume period is 4.
if there are not additional register to recorder counter, you can't
distringiush, 1, 5, 9, ... irq elapsed.

So we have to assume never elapse more than peroid.

Frank

> +		return 1;
> +	}
> +
> +	current_pos = rounddown(offset, d40d->cyclic_period_len);
> +	if (!d40_residue(d40c) && current_pos != offset)
> +		current_pos += d40d->cyclic_period_len;
> +	if (current_pos == d40d->cyclic_buf_len)
> +		current_pos = 0;
> +
> +	if (!d40d->cyclic_callback_pos_valid) {
> +		/*
> +		 * One callback was reported without a reliable pointer.
> +		 * Resynchronize instead of deriving periods from stale state.
> +		 */
> +		periods = 1;
> +	} else if (current_pos > d40d->cyclic_callback_pos) {
> +		periods = (current_pos - d40d->cyclic_callback_pos) /
> +			d40d->cyclic_period_len;
> +	} else if (current_pos < d40d->cyclic_callback_pos) {
> +		periods = (d40d->cyclic_buf_len -
> +			d40d->cyclic_callback_pos + current_pos) /
> +			d40d->cyclic_period_len;
> +	} else {
> +		/*
> +		 * The TC status is a single latched bit. An unchanged pointer
> +		 * cannot distinguish a complete lap from a repeated interrupt,
> +		 * so do not amplify it into a buffer's worth of callbacks.
> +		 */
> +		periods = 1;
> +	}
> +
> +	d40d->cyclic_callback_pos = current_pos;
> +	d40d->cyclic_callback_pos_valid = true;
> +
> +	return periods;
> +}
> +
>  static bool d40_tx_is_linked(struct d40_chan *d40c)
>  {
>  	bool is_link;
> @@ -1606,6 +1661,7 @@ static struct d40_desc *d40_queue_start(struct d40_chan *d40c)
>  static void dma_tc_handle(struct d40_chan *d40c)
>  {
>  	struct d40_desc *d40d;
> +	unsigned int callbacks = 1;
>
>  	/* Get first active entry from list */
>  	d40d = d40_first_active_get(d40c);
> @@ -1631,6 +1687,7 @@ static void dma_tc_handle(struct d40_chan *d40c)
>  				d40d->lli_current = 0;
>  		}
>
> +		callbacks = d40_cyclic_periods_elapsed(d40c, d40d);
>  	} else {
>  		d40_lcla_free_all(d40c, d40d);
>
> @@ -1651,7 +1708,7 @@ static void dma_tc_handle(struct d40_chan *d40c)
>  		d40_desc_done(d40c, d40d);
>  	}
>
> -	d40c->pending_tx++;
> +	d40c->pending_tx += callbacks;
>  	tasklet_schedule(&d40c->tasklet);
>
>  }
> @@ -2636,6 +2693,9 @@ dma40_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t dma_addr,
>  		desc->cyclic_dma_addr = buf_addr;
>  		desc->cyclic_buf_len = buf_len;
>  		desc->cyclic_residue = buf_len;
> +		desc->cyclic_period_len = period_len;
> +		desc->cyclic_callback_pos = 0;
> +		desc->cyclic_callback_pos_valid = true;
>  	}
>
>  	kfree(sg);
>
> --
> 2.55.0
>
