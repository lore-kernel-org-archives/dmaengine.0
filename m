Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013058.outbound.protection.outlook.com [40.107.162.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED914EFFB6;
	Mon, 28 Sep 2026 16:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614124; cv=fail; b=Fms9bevEFVhR6UuaYJDo90PbkXnGgCxE1NwsXwiRmPFiNU4ODnVAenap/Lt8wC8xVDupVV3sMaQ/Hs7i8YOVT1Vzj/FP4z9FoME2+B6YaMlIfY+EBdAktySB76X8glv156Z4GXnzf4LwQSUFg+ZDmXZG+4gFtjoZHJpwAzkvrGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614124; c=relaxed/simple;
	bh=gSz++pfsXQMyEnqXwADGc6dWOSHTOVzM1wQ0IB8WIR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=C0LujQRz3CpUezZDjtUwNyne9VtztH1U9DUAaaAx3A/ximTdApW//px1SDUQRG+QmhpZy4qhMs1UNnJWHl9a2HJKaqf5exdhUNHj+P2new1SBS6vrmbgooWFt/BR3Ur6YaGgOwnzMDe8YRBXp1tr7sbXPPXFLjsUcKB4IUDuYj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jToOu0Yo; arc=fail smtp.client-ip=40.107.162.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jToOu0Yo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMaqQiXrEZ39s2hqY06kd9wGX+DG2SGgSrwcBnDJ2GY0rc3z1ttZgNurTtRuAIspEC8y353LmedkNOjUpY/NXaqnuQXJXVa3Pwa/KnNrsU7mWb5WL9j9owfJq+iBeyltZ8gF7kivaT+pffxADPkdxr2RhiIpa3zZHkB8UBWqmX5tG0xiPiwKKBNEvFqYpSriFHGfVb19E2V6q5oxnDDGqCux6sJtZ+rHK43/1yIkIaoxGzZaiGmIAne2HNdoW5JeWm8MauDGsLA/kALQuhvMwBKz19xv2kW0kz9IHqkRQcvOWasJHtop63a9knfuPMlsJS0WiLnviF92DE07KlGgRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIFGBS3istuDrFjNIQ2qL25LeVdgIEzB79hrVAoqmHw=;
 b=M6Is6woTiVKUUTfuQzLWABoludBlpiu9CMPZiCYasr2BXHvzLiW9fWYR4UM3Qd15Bol3p4HvGdX7uRD1DCx9sgcuD5nZKHVO91E0cgm6Cme6qgpUIYL3Mu8Fza6Rie15LhyUrEG0b1+Nfd/6eqDfBbpexOvYiaDTtno4uDVLxYv5PR/qup9yQfG5gF00oUCblsHAKSODkoYAZ7KUnrJ5lwfqThZFBH4e7oEcdluDdnEYIRDFOBUzBiNcp/8PGQjCNcIUD7CrJgpVdmYS1JsSS7wiqd5ytfXm766AgSamzeV3G4KjQcUAQLxQ4nnXfbcovt8tpSr7eyjnb3EkBNTJrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIFGBS3istuDrFjNIQ2qL25LeVdgIEzB79hrVAoqmHw=;
 b=jToOu0YoPbj1AZTLrJIzIn+CzoEwhVXhb6tcWw2/bRAI2q4kP0+UgLg3np9T7CsPqbXdURFXzgR09SFiJiKKw0/rgewiDwliOYQlyyg9DnciXM6CB9ylV9H1XutmrBc4Lqr6x2TUi3ZDoHiAOa0fL4evHAjOIebQA2lA1fznwhO1V0eOlL7VXlI/TaTXEfpLFZmC7VsCqiIqFuHkjkuueWIPsr1BdKeqorUoXmVlR7E0GB/oZsHLObfmJsmlHnPF3PTn2nCUSRSRU0PxJ6tsB9wenNZeShhC2ZqG9Ku/jsTRuMQi9orcc9jT0QEi+cB6JwbcmV4w+KUMMroORTRP+A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8452.eurprd04.prod.outlook.com (2603:10a6:20b:348::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 16:48:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 16:48:39 +0000
Date: Mon, 28 Sep 2026 11:48:30 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 03/24] dmaengine: ste_dma40: Recover coalesced cyclic
 callbacks
Message-ID: <arqaXibAtx9ULqu-@SMW015318>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
 <20260927-dma40-fixes-v7-3-89f595e8851d@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927-dma40-fixes-v7-3-89f595e8851d@kernel.org>
X-ClientProxiedBy: CYXPR02CA0044.namprd02.prod.outlook.com
 (2603:10b6:930:cc::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: e1534a88-f580-44cf-a3d2-08df1d8058c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|23010399003|1800799024|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Ykl4GZTJ5WIleKqgz7gaFp5lREI9sQCFirPA2pSMZ5ptqS+0XshdRz1suVD8YXEsynuuGXR8kpOnnEP5Y64fe9Kp05gouft4GduDYM2fMlC7oxGTBoYbi67/mKVfUW4jXjuvTETVvwgMUITiQ8dBrctR6AfgVd5cbbG4hoDhOBEKb90oMey2hYF12JWn6NWkLq6NRQY2zGdA/uCBy4O5AnhWR4Pb0Qy4NmVYd39RqoSBZj8N1HmY7Zh99tZrKYdXBlL6oqqFYxFvokcxT5jYCQFpwdRhB6IYYKe0gx1AD/525mbjhz74RYqc/DlalcVwmHPC1mzuuYEtKOpWzBajPQirjvjDv7xcTBio8u+WrBwBxq9fIjh0uOUkw/FokcFEOrp1zdSY/g2jW9BDgp6XGFB/Paah3iwjLcvIVoyFj8Jw05+U3TOBo9aI3k1ld6udMIn5akubK+7K7N3/tP4mAm1Vzss822bHFzq93vh6wN4nQXHQVycKvvg6tMv1tgBUyhcnpj4T77pvPkiGfvW86pCIdkHBXfTceezDOO4PvWMP+nsDjYme2hTOUWuqevuHtWneKQ2oPlayDP8VMD3WYaoekaXdgTQZIyngumPQtSZjklLPPMfzePWfpZHruc5IWyZSSatXK0mE9gtZa9tGMztVult2bTArt2ufut3ACg8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(23010399003)(1800799024)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GBwZTsja5QReo3f+M+13MXlES6mf5UZWnslQpRnetBhHVarbypKyNGm341Jt?=
 =?us-ascii?Q?3h+gJVh9dsqNHR3tD0XaKZlQReEI1k5g4YKjRjy8ss7krA2ZkAxvFi8DBOwL?=
 =?us-ascii?Q?CDuVKTna6lpP18A7no5H0n3GxWtaGSBzLxzSc44B7e7qL3arZ2BZozzsiEU6?=
 =?us-ascii?Q?ZOL7i7HCVr11xnUPjFHOto0x+xe1XyTPVpfM13JJp0AMHpWudo49BmHmCWHe?=
 =?us-ascii?Q?0H/sYyrEH9+kBmmfQpPZ0aG9ednfdcP7+aVylXt7VQG4DB5r4laeYHW2K1gE?=
 =?us-ascii?Q?JVw+U9CCJXmxq6aGXZlrfWUQW7io8a8bw1NOdcjB/xn2+gBSGOjVcrBWRRZa?=
 =?us-ascii?Q?JI8aqwviAFa+I4h2hh9NZjaRjwQtJoyNPOV6/sbim1nIwVdk4QQkh4HLXEC3?=
 =?us-ascii?Q?4Ct0t8KUPFUwevKXVKboRf1vhNWyyhfSWPgTzcDGuf38pOHT/COPSmK3Ym2r?=
 =?us-ascii?Q?nLTMHNNfLf74dLTqnI1et5rhIGzyJuDfeKzHpNWJ2uLtLTQnykduHv5jbHIX?=
 =?us-ascii?Q?zFRT+jqonpjPsOtfKMEOjbmFMuwipUIJlzcLszt9KFuLCY21K/RqQzVDMfHP?=
 =?us-ascii?Q?nFmhzxlwgsTemzg0o7tE9cv/fdz78XBVe+3GbNHimbN77NT/D8Fx8ocn6xLX?=
 =?us-ascii?Q?UOWcuCDWzwSpEZiUdhc+oewyouAycQu5YBytBAkcAKfC1RrUIxWRCYatA/RK?=
 =?us-ascii?Q?KTk6KVNqa6mtTm3yaFTwDUBdIn03mAquT0hLqYSaPVIMmedzk/Aby3a+VqQc?=
 =?us-ascii?Q?kDxz0NULGe7kJedxL8IXmfWVae0ZDMYmZA1rteQK2DU93o/vIJJDU9rfKnlX?=
 =?us-ascii?Q?Q3ZLrQj8F8q3qEq/ohBZZ4YHCNbLeCVBkZfgjaT4R/u09Nd/M5nMiRCOlWKL?=
 =?us-ascii?Q?mkPpPkuqtbU2APNMkRR8a78UFfD6lp2/CcqGG8zMQxVPB85bEjeAQEzosXhH?=
 =?us-ascii?Q?GiuW/K7OGsKMI1zcX4lv2S+pqYXREbf/XRIrmenaJEZdLOI+sW0tqfwFWzHD?=
 =?us-ascii?Q?/8XNUufFLANoUaXIZzZ6x/NyHdHezS9pMtKV9k90tbqvJb37e29yDvwvsDRT?=
 =?us-ascii?Q?y+o+BlJdQjbMrNrw16oLae5TqFmT23LBt99/ozJ+OxNnb9CbGkk3mk+pWLW6?=
 =?us-ascii?Q?0sfnJwu7gnWBJj0wcNBsYeX4YjMSI/h03eGWg2w3FePHrGTPI3RGljb6Ky19?=
 =?us-ascii?Q?bTM0sVXdq7yajbTivZAZ5t2unyaHXS3lzZnDqy1gOchdtl0q8sTdrwKvgl8s?=
 =?us-ascii?Q?tGP0cmlXwnz8/wk4zPdnAOqzR7ZaJTt6G5Zfh7JNDnxSldPeHmVK6ML4mTkc?=
 =?us-ascii?Q?ibjXzwhuvSdKDZXeppoeovmbf6pJFgxvEX3oE9M07nwzvnfhxkyczLCAzLUU?=
 =?us-ascii?Q?OCVivp6UxB7pMbWlZwh2Jiajw6MzOXM/9C+x+ijSYQZ8oKLSEvNyexqFZ+QM?=
 =?us-ascii?Q?pBU4lChdIyNkqN23Q4fXqaOWnO/sH9DwpOvFb2J1zZM60YGYPUJfo/R4AG24?=
 =?us-ascii?Q?k/JeBk8VweLRDAd5y8GsAzf52ptnEZj1BC5qERmYVuSFLydwykfEAPJ/p7jX?=
 =?us-ascii?Q?C8loRasM8IW4TL94TawLSDMIakdbhgmexZ88/4rtHQzTh3ywn/zCw+ik61++?=
 =?us-ascii?Q?K84SSi1HD7gex4S+AB/mUGmOEO9P+jMSzrcoL95VSdq3ZLYNK/hqYP8stjTz?=
 =?us-ascii?Q?bCU967ZG9ELr/TjIny30+9eaI6mX5wynW+PZE71d9ExaWFOcMBUHKwWPauP0?=
 =?us-ascii?Q?4tE1xsm+sY4TYv34BlK1HNqPUQi1sovUBC6sCqbvn9pM9gIj9JP4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1534a88-f580-44cf-a3d2-08df1d8058c6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:48:39.5367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5wEJtk/AX9YWSTyAVAZnmd+HvjtTiw+kLdpRakn+/9nTDzvOFNEb7bob+OUsmihF63qa9KZLQ42aACQ1mDqq62W40vY8RlP24HUeJkAxF+wjVt0U+6UXI2riCqkd8iD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8452

On Sun, Sep 27, 2026 at 11:03:16AM +0200, Linus Walleij wrote:
> DMA40 has one terminal-count status bit per channel, so cyclic period
> interrupts can coalesce.
>
> Use the memory-side pointer displacement to queue the minimum observable
> number of callbacks. If sampling fails, queue one callback and invalidate
> the saved position; the next successful sample resynchronizes without
> recounting it.
>
> The pointer is modulo the cyclic buffer: a displacement of d periods can
> mean d plus n complete iterations of the buffer. Report d, so the driver
> could have missed n iterations of the buffer; DMA40 has no counter to
> recover them. For an unchanged pointer, report one callback rather than
> risk a spurious full-buffer burst.
>
> This condition has not been seen in practice and is only a product of
> review comments that the buffer can miss interrupts.
>
> The preceding cyclic-residue fix ensures that every cyclic period fits in
> one LLI, so each boundary corresponds to one client callback.
>
> Fixes: 0c842b551063 ("dma40: cyclic xfer support")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 68 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index eab9c09b4bfe..4b138aa313c8 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -384,11 +384,14 @@ struct d40_lli_pool {
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
> @@ -405,12 +408,15 @@ struct d40_desc {
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
> @@ -1487,6 +1493,61 @@ static bool d40_cyclic_offset(struct d40_chan *d40c, struct d40_desc *d40d,
>  	return false;
>  }
>
> +static unsigned int d40_cyclic_periods_elapsed(struct d40_chan *d40c,
> +					       struct d40_desc *d40d)
> +{
> +	size_t current_pos;
> +	size_t delta;
> +	size_t offset;
> +	unsigned int periods;
> +
> +	if (!d40d->cyclic_period_len)
> +		return 1;
> +
> +	if (!d40_cyclic_offset(d40c, d40d, &offset)) {
> +		d40d->cyclic_callback_pos_valid = false;
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
> +		 * The previous interrupt was reported without a pointer
> +		 * sample. Resynchronize without using the stale position,
> +		 * which would count that callback again.
> +		 */
> +		d40d->cyclic_callback_pos = current_pos;
> +		d40d->cyclic_callback_pos_valid = true;
> +		return 1;
> +	}
> +
> +	/*
> +	 * The pointer wraps with the cyclic buffer, so its displacement is
> +	 * only the minimum number of elapsed periods. Complete buffer laps
> +	 * are not observable.
> +	 */
> +	delta = (current_pos + d40d->cyclic_buf_len -
> +		 d40d->cyclic_callback_pos) % d40d->cyclic_buf_len;
> +	periods = delta / d40d->cyclic_period_len;
> +	if (!periods) {
> +		/*
> +		 * The TC status is a single latched bit. An unchanged pointer
> +		 * cannot distinguish a complete lap from a repeated interrupt,
> +		 * so do not amplify it into a buffer's worth of callbacks.
> +		 */
> +		periods = 1;
> +	}
> +
> +	d40d->cyclic_callback_pos = current_pos;
> +
> +	return periods;
> +}
> +
>  static bool d40_tx_is_linked(struct d40_chan *d40c)
>  {
>  	bool is_link;
> @@ -1609,6 +1670,7 @@ static struct d40_desc *d40_queue_start(struct d40_chan *d40c)
>  static void dma_tc_handle(struct d40_chan *d40c)
>  {
>  	struct d40_desc *d40d;
> +	unsigned int callbacks = 1;
>
>  	/* Get first active entry from list */
>  	d40d = d40_first_active_get(d40c);
> @@ -1633,6 +1695,8 @@ static void dma_tc_handle(struct d40_chan *d40c)
>  			if (d40d->lli_current == d40d->lli_len)
>  				d40d->lli_current = 0;
>  		}
> +
> +		callbacks = d40_cyclic_periods_elapsed(d40c, d40d);
>  	} else {
>  		d40_lcla_free_all(d40c, d40d);
>
> @@ -1653,7 +1717,7 @@ static void dma_tc_handle(struct d40_chan *d40c)
>  		d40_desc_done(d40c, d40d);
>  	}
>
> -	d40c->pending_tx++;
> +	d40c->pending_tx += callbacks;
>  	tasklet_schedule(&d40c->tasklet);
>
>  }
> @@ -2638,6 +2702,9 @@ dma40_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t dma_addr,
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
