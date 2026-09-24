Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011056.outbound.protection.outlook.com [40.107.130.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A27E35E93B;
	Thu, 24 Sep 2026 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261756; cv=fail; b=PryRIbm3Z4p0SyqXEDWeVodcbwX4bGPpWmBXtGRjM9er4DEZn24LLHjDpZfAEt5NFZVyQ74p+6jxuDTcNGMBKxJCnw/AHVdmhuiXBPCLxU8FUgSeHwD2VwOe1vSdcSPW2TjgPKYy25Z2xdbya7nHnxIu7fvMJdgoY9dM1rr9UEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261756; c=relaxed/simple;
	bh=lOOpEnIRtQaEVNMZylC3oQXu0tr4cmCvFbB3qF9Aeoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OoZ6FYhTDnqQ19HcvhGzvISS5FCLI7CPpIqjl9V299ybSGqH66rv0/mfEWrKxtESryuPs9Ach76nTSkvD7PMuk+QxqWpLy4Uuxfz5q7UhgMZvhAeEBSMeDE5+6kKCD+aaATlC3midfsr4+jyirF9yuH8YzkJfwRNAQi44V5Rz9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=E9yiP+pE; arc=fail smtp.client-ip=40.107.130.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="E9yiP+pE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KgwyxDy+1aFjXY3QwEWpx2C/Z+bDN0Y6FIQ+6Sr9pb6g2OSRlawPYkEupMoASlYbn+5vDqmyMXWqsuDcKMvEv28EerP5jLmZKoCT6DJ/SKpqHA/ngkFPWw9+w7/5LK+4CbykPE6GXxc2TZ/Df7DrZdixLAfQC3GTCdTRtRbCkxJ9Vp3pFCKdBhEu8Hp7/T5JSmdj5V8t+1ekdYBoKayDRc2f0+O8zAFmeJdyf232syIrZZxp8eNy8kOLcHppbyDjFVIV+6IgxNeBm9fKyjH0tPixvNIRUPGuwPWE46bFcbadCdXZNjS3ULgRWvkd2TEk55YYiPFBpJrida3ShXSeIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wj0NId1LQxD+2/sSbSeIQ4nZA26kUyuUllpwJCaku78=;
 b=pyJhLm1LsHPrh5WLW31O582mhBrhinNpd188Yy3PVhQKzkvPlQcSH3/1DZXkrH9G75nDj5/SRdeoSnb6SbtX8nW3RqcX+ijgDePIXrSA1ELRF2gDWGSoL/mHIsx05uYh3v9fjzUy0hyn98jHOHmE1Zs5lsvwJsJUaJEKcl94uzIVZSlS7gyAJ43oJyU1sgpd4ZLdhEYbVqI9jktiPqEnW/noicGF1ZLN0JcE5d8A799KtGkiDKCrLdSoyxdX+9ZHc0bV+JoncgeEowLspUAZUZFRC6NiS8+J0YeL+j+QRMpT2sLc9ZF6gI0OJexmEseBdRU1XuI85AZd8aUUuZCgxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wj0NId1LQxD+2/sSbSeIQ4nZA26kUyuUllpwJCaku78=;
 b=E9yiP+pEtvgyHICTLTTi/eEXqnGjcFn7Td33ME3wAIPMoNXkGTy+DPYsPLtpSAfNgomIiQIzeZvGvjATCKXSce0jflcrb9VUwFqvm2UNgqVS8xrgZZ3v46WlcrJGtVvNbuXeTNx+I/s3Yiqdk9sEJcyOafKSCjsN4fUXj/rg5nDyKZ7UdDIOKjKTzxVd9EFzFVGfJvullVYw1UZo5k49jVxBvlayctF14qhXgh3jraX8PiDB75b8v/Ut8i+nBICJhsazhWKmQu3afOVSR5z8Voodx0lclz8zmWvq+mKnnXSzkIT3O+aNR74wfQNEiPMkin1GiO2bflYG18qvXmfegQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB10363.eurprd04.prod.outlook.com (2603:10a6:10:55f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 14:55:47 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 14:55:47 +0000
Date: Thu, 24 Sep 2026 09:55:40 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 08/23] dmaengine: ste_dma40: Return IRQ_NONE when no
 interrupt is pending
Message-ID: <arU57BPffCVmLTbd@SMW015318>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
 <20260924-dma40-fixes-v6-8-fdb6755020a2@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-dma40-fixes-v6-8-fdb6755020a2@kernel.org>
X-ClientProxiedBy: CYXPR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:930:d1::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB10363:EE_
X-MS-Office365-Filtering-Correlation-Id: 63b67461-95bc-4f20-ca27-08df1a4beacc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|23010399003|10067099003|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	PXVaMIEmULMp7LyTwGvrjCg2FgZWB3tsn2oU1oRXgTUPSTqDaP/Q3h+soM1onGw5KJ0JHVPN/UNLZGm6V5zqBomMkpdlo7b9iE7A2yTJfkX763Ud/knmfV/rd6H4owYOByxxISPGlUDY7HjVUMNJAUpXdImHJtT8j1sLpbmZuCYq51AtrbPYWBDVEZTDpVtpcH/gRRuTSWjA5h1gydM497qzRacim8WFhu1BZTaPMyiER9XCLaJNbwmF6c0YOur1Q6TRLUoOzK6TOE9zjrA2EKxnuW4Fur7HR6dx2g8YdvloWwre7VwudsBbslRHWe2HOSZ3AyfwD++t72fYP5Vg9lyXo4rEGe5vTIDYvSK8/M4J74qzeLU+lloq+FoyGT5kcx0pA010MJk0WDvxgcDvvBy0AgCghqin4NYD1vq8VRM7wGiQ3TttVaXhgH3dBAV9A4y2S6TfbG/5+uDRuhaDTdbPZD62g9ubdO85sqv8bUhl3GTLHGR6QNlonExdg0tUtbWrx6hwFr1drm4LZh6327HfdhyI/O5f8x5NGxBInUAWHw820xq+lqldSsJpWlkepGsxefgerJXshnb7UHHQ2WrWKJ5GcrxerXAmRwraywRPxlGSD1mcZjX2zuNSfyYQ7VFiUVuWO8qd4EwBUOc1Izv6YgIGascsu3XbMLX5HQw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(23010399003)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UjovE5FHI/K5yvZS2clmg/RYzpg2VyCNF7Cby2gQZmfKFvVTu4JRaCctvgjA?=
 =?us-ascii?Q?A5SyJtxmTHJwKjxO1HnoHcHfPndcAFmWBqsvLyKwMRN1XDsHLn7FZxKrxsGy?=
 =?us-ascii?Q?rpMNx/S+PeXWSI+PjrPPZCuORl2BKkQnhM6vzOk46J6Ip5nWfjSUa+zABS/N?=
 =?us-ascii?Q?qYxhT/RWdit3O/dWEWVWooZDApBvg5UTFKNQcFeVf2wtOqCzDNnXVjOCC57q?=
 =?us-ascii?Q?UMAhmQvQfCPbhmpy/PnauvsifYyHlG6Ip8yeDB0vafMyDRUHoKC0xXhnpjJo?=
 =?us-ascii?Q?oLWKA3+xBL7ufxfuWK1bGDk9uONKAnRjQCAos7GFFVMe+QYhBwK3rUXYDQ2+?=
 =?us-ascii?Q?XaDMpO81ZKAn/AZiSfPLmVC2RtNCyN32Q/ulO4i4Nzij57Jc0nRQFVUVPx4+?=
 =?us-ascii?Q?e/8rELdp3/11yFctelCsoPzUpjGbfnRDHmtg8OJlmuRaTYinG29W2ZjMXKfk?=
 =?us-ascii?Q?XtUXKvL/AJuy3CoUwkTY7WnvLfYamgP4LN/7da/FF2Agvr+1MI1smJ6ujMA1?=
 =?us-ascii?Q?rHb7WObV4dPdCslHjPFfJevWeQPyrAlqekxVwvKrXwMEjk+JvAXkeXDRvLsZ?=
 =?us-ascii?Q?4Hsy8dFn/ehFbtMpax+aHAwGJzpXbxfKjD1azX+reOn36X+C6PNjKZGzqwg5?=
 =?us-ascii?Q?BAqmoXHrY+u/ZaoyYP3ZHjrZtk38hcaCWJs/8GpDJ4kQ1PL4gXJja2Bk3FMY?=
 =?us-ascii?Q?CXOP2TvgrcOMq5oFau6t82ATdGxrKbbVKqAkK1tgJ7SWp+d60D7e0/uHOS7o?=
 =?us-ascii?Q?uc+00OIy1yF7DaRGfPT+kOBYAqhlez6JL95+PMu77CzI2YDcuAo72K+EKwNo?=
 =?us-ascii?Q?LUoCu30nukzWTqgl835sH7sjUtBwM+YsyYR8WI+ctEJppxw6SHKAEdZr9wjz?=
 =?us-ascii?Q?WrEz5KMT6iKZyUassUw0ZanYMUtvdQ1s3Rb/Hf75Z/DGm7QWreseoU7ZTYec?=
 =?us-ascii?Q?ShL0R41RHfIVJy2u6ROOXy3etAHCZjwTzVj/2sP1Abj268xBNfmItsSgaHBo?=
 =?us-ascii?Q?5WmYqHo+1nwvEO1uVIXJdorXsam2R4j5NFSGUJQ2ggdqKC9qMGGJNbd3H9sO?=
 =?us-ascii?Q?rwxaQkwGwup+C+/AVRZekkaYCnEpFDCFoZ1KAeAy2kOVqg/3qcbeB5OQm4Yr?=
 =?us-ascii?Q?1bnJkO3GfYnLo89qsc3QMc8VbiGhu5X5/FJxP7OUCKf2v/pMVmasJfgxZjZD?=
 =?us-ascii?Q?dVr7xMcBA5vTH6s3VhtKvJW8RvRirMqiLLsh2A8/4p9E6fcvF/ASeLM2uzpr?=
 =?us-ascii?Q?q0lJZbfgcT1Q5yEZfY95gKHkTjyeLq/1bMON+3QHxeWVcf6a84Pk0eswBa13?=
 =?us-ascii?Q?31Q96G29X0urDVlp3E3b7Xk6uNKUN2XfRc07uLPQxQU4W9TpDNyU2fRE/TSJ?=
 =?us-ascii?Q?fy4se8H9EEmRMxZnexniaQoWW9nygmZHtq9hOTZo3zvi9PfCui5WXW/2NVaD?=
 =?us-ascii?Q?J/gRmvz9ol22h0S6g6UiZBsiJjPeFI8QniLH6nT5/jPtzigHqd6pIIwkyo3e?=
 =?us-ascii?Q?stR9j3JvMEsK5MPouBoaTXIth2MDJ9xH4WZ7XTmlkbY0ufFk/aqrgXNxsDyY?=
 =?us-ascii?Q?IqvXG/5oKOqDwnwMYzPZykIA/632OxRcyiDUql1LDNnsLJSzAdIz+mMaROsV?=
 =?us-ascii?Q?IMU7X2dnfRRabmVlt5fd1PUHTWJvlPJz5Dp5A4ZHgrFCNP2yWhJ/6swxTNjn?=
 =?us-ascii?Q?vSYSLT7PSY3tnqZQ1+8yhGzIFbh8bQhxzaGYOWrEPpOQNLkz/ty9daE8QfLn?=
 =?us-ascii?Q?IxDo6xLLnQ/mZuhStUatNi7Wk1Ev8xkNGxOT+F3h61vjPzNYlrsP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b67461-95bc-4f20-ca27-08df1a4beacc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 14:55:47.6796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CdSUtbWiXe75G3oF7XV1bxdMp8asgr4zZlMjDU36smJ7+8WYzwek+2DMX5DF7bscwyXCjs/cn9FuJTSVlTIbhMpiCah6asSj6UA0aNWHCopcEcDXK7G8DJ1P/iG98mK7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10363

On Thu, Sep 24, 2026 at 10:35:20AM +0200, Linus Walleij wrote:
> d40_handle_interrupt() returns IRQ_HANDLED even when no terminal-count or
> error status bit is pending.
>
> IRQ_NONE is not only used to identify a device on a shared interrupt.
> The generic IRQ core also counts it as unhandled for spurious IRQ
> detection. DMA40 does not request this IRQ with IRQF_SHARED, so interrupt
> sharing is not the purpose of this change.
>
> If the line remains asserted without matching DMA40 status, returning
> IRQ_HANDLED hides the stuck interrupt and can leave the CPU servicing it
> indefinitely. Track whether any DMA40 status is pending and return IRQ_NONE
> when none is present, allowing the generic IRQ core to diagnose and
> eventually disable the faulty line.
>
> DMA40 channels can be owned by other SoC cores. Their status means that
> the interrupt is real, but Linux must not acknowledge it. Treat foreign
> status as handled and leave its acknowledgment to the owning core, while
> acknowledging and dispatching only registered Linux channels.
>
> Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 712719f0c4cf..271f653a15c4 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -1819,6 +1819,7 @@ static void dma_tasklet(struct tasklet_struct *t)
>
>  static irqreturn_t d40_handle_interrupt(int irq, void *data)
>  {
> +	irqreturn_t handled = IRQ_NONE;
>  	int i;
>  	u32 idx;
>  	u32 row;
> @@ -1852,6 +1853,12 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
>  		row = chan / BITS_PER_LONG;
>  		idx = chan & (BITS_PER_LONG - 1);
>
> +		/*
> +		 * Status for a channel owned by another core still explains
> +		 * the interrupt, but only ACK Linux-owned channels below.
> +		 */
> +		handled = IRQ_HANDLED;
> +
>  		if (il[row].offset == D40_PHY_CHAN)
>  			d40c = base->lookup_phy_chans[idx];
>  		else
> @@ -1884,7 +1891,7 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
>  	if (ret > 0)
>  		pm_runtime_put_autosuspend(base->dev);
>
> -	return IRQ_HANDLED;
> +	return handled;
>  }
>
>  static int d40_validate_conf(struct d40_chan *d40c,
>
> --
> 2.55.0
>
