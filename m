Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C034A8A1F;
	Thu, 24 Sep 2026 16:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266330; cv=fail; b=O7v7ebFBsCM9tQXT4RTKlHQHCtUN61XQfecTx1FFBzdMYTot0wBR+8CN9tYdNTo51J+G41UGje7dDt+7n+YICpYOFpEytVB48Co09DJC7dhQ1FsVJZmHF3+99gpM3Umghu8r0Y7L78e1ChNPRX0eDC+zU1rUqVqZ82XNvP6mF9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266330; c=relaxed/simple;
	bh=9kr6cw73WOw4sG6/re01/HN6be9zuxonf+6S5/tajyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HDAwWTPc3gz5P8LTvk5/xmBOstFmGXJN8hPp8/RpdiOlGVGVwbGoOTYEGAJVdwKDC5uz+2DZzl145SUdAeoQfjmT2+xXJL7fxrmqszEIlomyIATXvKIDsPObYIPiRy14pD88TbFAEW2jgwXMAFv2/icEN+UvYe8fhaV74bG56aY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Q2ZCldq1; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Q2ZCldq1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qo/tYxuuBDMH+8WXJ0LKojLFYaijv3kW9AXYi2nFnd7edIewgUfPVmdpss0rSuLKJSVsSGzfWcSygX9L2ftl8VztVZ4qy0fdmlNE7ccIkUgbVfguw2O1JojJ2r3gei5wm7YPUG7aYVG54qbJN63PS84dUsW5FieGJctGFF+qYX1VyV/wz2I6dxyUSoNiJhBkWxJ13crhHebP6r71jxjQu2Q21hxyPH5MR3sbdmCXYTpQXJUitQ2sKtGZOEIcBYv+JCaO2YfvpX/DGXTzhvOZqTUfcq4Q9UK8jzvL69gmdGbjvDd2IDF25Girsy+wN9j4J21w+lNJkxzt/FNZYW3kUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lydz9WQnDSh5vVk4be4WLEvB2D5MuO0ETinQ9OmHCPI=;
 b=EPSLTTN4nlr6tjWyOc6ylClCnNEKYp4/b3u5hUSYz+1Nk8IJfMWC0OGBm8iPlYgO6qn2uNNjJuShnZpXl1HuWWKFHYUDxZi2tsvOjRVk+iAVC1PqDQdfZ+m82kFsyTDnmeaODcBX/hdyyV4pF2CinHRFE+oib/RwK/0jyfTPp3BzCKqOsA7Ac7Fd/sp7KGE4mKnYItqQ5piS+85cYqzCHqTR5XHZPiHCGhsJQcH9h6EsE3b1eYPe4jJokkr2Q6gdx5RYXnCVWstjX35SFNbO/sCsa3ifI21g2rACd/SKkrEV6L9FbOQsba4W9MV2jqKaU7g7xGxSOdoknsoRJ9a0sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lydz9WQnDSh5vVk4be4WLEvB2D5MuO0ETinQ9OmHCPI=;
 b=Q2ZCldq1P2Q/4Y3IJXJIrxXQ+sGy8W7gfc6dcvRMBBvM4UC/ZLL+hBLwpyCeQstpN0nQg1X08pTsf6XuSr/59PzhrMvMeiJ6VTG68R1cKkqrf00HPvLyTs/MbPYefEXRZBvf2sGot3CJHejB/HMH7sO/81DjqB39LOcvMwS81+9R7O9Rflv7asRc9pBKj9lKxveYy6Sqw6zx5BOufsctExl3nXFV6hlBuFngcrhA+MS+0c5W/3FWsfJJva6RJljlcyNOAZy1uw7c83zUU1h/JimdRpyNY2Si3/5bIxp0klmVRyB3+t1Ry06D1pj+RDbJq8a2DdaBubQrfrRe7wSg/g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7314.eurprd04.prod.outlook.com (2603:10a6:20b:1df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 16:12:05 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 16:12:05 +0000
Date: Thu, 24 Sep 2026 11:11:58 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v6 23/23] dmaengine: ste_dma40: Validate memcpy
 configuration
Message-ID: <arVLzqMcb3Imc7ZV@SMW015318>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
 <20260924-dma40-fixes-v6-23-fdb6755020a2@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-dma40-fixes-v6-23-fdb6755020a2@kernel.org>
X-ClientProxiedBy: CY5PR16CA0001.namprd16.prod.outlook.com
 (2603:10b6:930:10::31) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: b28d2442-9f7f-44a7-71e3-08df1a569367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|23010399003|6133799003|10067099003|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	tLJFb41a0z+ZdsiD/Va29CXn6/zNKXwAzxWcJuttGJQxzRytKnd9bBkJgf12DeoQ1Yohi/FxWrQ5mra4HTjZxqroBBoX0Cjf57dHBGTj3wsEQekvveIku9z2kfhEdUUdEc2KN/vSW1mLKRYiZEYItifeiRkuXH172yXHX6vtUM65Ww2PceEzzYB+28WNRuab9b3BE1kPibu1yURoR8dlmapG6jgLVz4z6BEXrQRn7yX1N8TBSnvCqT1vBvGWCJM/1Bub2njRAXEOxQT4JSDuqp9a5/lUmYJQGkPsJWkbTdP0iUH3wwAvgkabUg0M8XcuFlWSlCkaaV4+HLaJkaMcBnqcpoiSa11r5jgwP/Yg2TiU517WA6kgWMp84za9ZMCw5pKFLTiLgzV3nkVAQKi1H7MRitjSmoTd7CB6nLyz7SxLzAeW2eamrS2eCS1iwunXZUsUC2fpWyF15y1/UcWp/3PBJTSBiwwrceR3wZtci5aE2AUUamP9Eren2qGzNGDjHiwkrQW0lt4u3QT2vtKY32VSf4t5x3g+BfSIPE8vlOrGkHL4jNt88ijzIiDQtnD4G2ILpJ7/PkXw5Q2O+QX8h3HuXpYFdC/NPvyCsT0i5U8Ic0FMfAUKUSOgrzaUxprL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(23010399003)(6133799003)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/v8hmaQ3dqYSTQaqPrFPEGBZRFvJNuUeNKJ1V3F8cBSkQwufIAa9atMSMYCM?=
 =?us-ascii?Q?mZVl1CTWrSAYWwzc65AnE0c5XP1gt2VZOGraBcLlbAFOXKwiAMdAx1oSpPt4?=
 =?us-ascii?Q?LkvAKqfiqCOuAAaA6+JY5i9Vb7MG0CkfYgAdmMFPCmI9QeTl+WIlByzyAK/o?=
 =?us-ascii?Q?RDR+9XcCs0gkHbHgFZK2VDLannKxP/e93Vq1QWZHgeXWcujIUD27zSuKJG5y?=
 =?us-ascii?Q?0EjwxiOR9L29qC1nTLStF5c75OnPfJxbFh55fbvHX1hiQsMnvYCkOTLTpY6b?=
 =?us-ascii?Q?WA8kwlW/mByTI6oD1ySVaLDJ0qQbRUidI831lJvzmOPlxeCZ1DvF5QVmwoQT?=
 =?us-ascii?Q?coV8ZpHidL0VaRPNLBvKMul9Wr4vrESj7nmoe0XlrQ3bwdXc0I304urLWfMy?=
 =?us-ascii?Q?/OclN/QsxvjVprzV0Cz59xNNuZSiAvODHY8ZxS387cQzhQ8QDay4p3A1D0Of?=
 =?us-ascii?Q?WTjKAqf8at6IJDIcv63B1w/y3eblTm7tMXfpN1hbX4weo/SQL6fGOzy6dRMx?=
 =?us-ascii?Q?ENXdLkwwhOVJv9ZdOpVEWvZf79ayb6Or1ADlCtr6Q6gb18eZsRB9mS1sU2Yr?=
 =?us-ascii?Q?sz3RwW2y1xywzyitFH56oQeDXZ4nsa1rZNCu8U2CSyTYReDoCmiuKZsNWoIo?=
 =?us-ascii?Q?i0kB6KNaoLcEvQ+5igHPRpS9c6neUAy7E2BESygE5bBWEd2PukY1WI3ULWjd?=
 =?us-ascii?Q?BGvBpe8/4q4HpV+uqfsJsDbuaAetkgpEm2UUvvWRCvgNMWorgnVkm6Hr17IX?=
 =?us-ascii?Q?pcol4FzKtsjg0OElWxdy5NRJOwWhjnPVZzfLI3ALJAk/InOfK2kwj6ZLHDNf?=
 =?us-ascii?Q?15gnbls3ZK0Dy4xQLzYt6QAbqhpYgggo9EfM3zgazT5kSZKP83BMdSBpvY8y?=
 =?us-ascii?Q?pagmIxBVQmHrKI75evF3rd+iNOiFHZNvlTgLhzcEqqkJGtcJXCuQIL+b6Rjt?=
 =?us-ascii?Q?aZC2wiN8ycOqzSUjCh37HJvr27WvjcdaOk16VRMwJMoLxLnpw+Bgt/Bie2HO?=
 =?us-ascii?Q?DSk0sVyxMC85P8bXWwbuwDlr01aXBUT3LWvEX/gK16C8RPwi97SdvriiNsWM?=
 =?us-ascii?Q?H3aiy6NLfs+7Tfr7yE/QVL4oZF4M70P7KayF4d+6a6Qr0M6O1RUbBGE9XnAs?=
 =?us-ascii?Q?/X4DaDrgRGbEg96qlbwupPniAfrxD5//ZlDIO49Hh4mFtX/PWJo/LIUp0JaV?=
 =?us-ascii?Q?MZUgM/mqEHEW4v5e09rarkUIFe/OC8nmJmNtH39fB1IlJldQkORLGccpfkD3?=
 =?us-ascii?Q?StUqAi2tPnBbCaeufUXsCOEbVvCJJ1DMBYHnAzQxsG04bEeqS0YX3VfEAMhl?=
 =?us-ascii?Q?BR7YGlT8iTaaR1PhutjM7tZdBRoaGXnpWpgLB2EnyQtKcywbfOzExTQhz83t?=
 =?us-ascii?Q?Qdoy9SfkhlUsf3XWqmuVvV6coRtXwVuxaQRQMLjQtWQxLrHmupIHb7AZiRiu?=
 =?us-ascii?Q?6NxOmAmM+3CDvzt8PTUBNzNDfBOFVZ1Dh1GQfWnUQGr9u98mJy7TWw9qbvD5?=
 =?us-ascii?Q?7EHwKddiosmbUcjw0JZi7TdKqZpOF0cbsFL3LfDZhS6w9kVesIjhuex4Ro28?=
 =?us-ascii?Q?qC29ZaAk61t7jNe07QwoEz8v+r5hVcFqmrbf8SsSwaDPgCwaP36G2S/D140d?=
 =?us-ascii?Q?jnlBgphl37y7qZxKxCIdN9W2bY/piRfd+lKpW7llfNH8J2pVOi8Pme7eAs9L?=
 =?us-ascii?Q?yzQD+9E6wIabckOQwOxlpOiCKJ82USyKFn8M9G30sKHTVArnH2nJ8qxXfQPf?=
 =?us-ascii?Q?g1sazOBFweWOnnAITsKrzqdYs7zYxwqOhm2RdZN/tZxHMfuk6nOX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b28d2442-9f7f-44a7-71e3-08df1a569367
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 16:12:05.5110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wXTP1X12TaVkYgebaKGi+jSOGJr0bVEevxj0Es8SxZyaxYEAUBUGjmDcdrsJjFCZJVTvx+Y0LVZgLVMlM5wUAbr+HUd3OaJyA5e/AnYKW/aELLBWXJyUzWW41BrjA8C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7314

On Thu, Sep 24, 2026 at 10:35:35AM +0200, Linus Walleij wrote:
> d40_config_memcpy() builds a default memcpy configuration without passing
> it through d40_validate_conf(). A dev_type supplied through the
> memcpy-channels device tree property can therefore bypass the bounds
> checks added for client configurations.
>
> The generic DMA direction enum assigns zero to DMA_MEM_TO_MEM, unlike
> DMA40's old private enum. Allow memory-to-memory directions in the
> validator so checking the generated configuration does not reject all
> memcpy channels.
>
> Validate the generated memcpy configuration before deriving logical
> channel registers or allocating the channel.
>
> Fixes: 2c2b62d5d911 ("dmaengine: ste_dma40: Replace ST-E's home-brew DMA direction defs with generic ones")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/dmaengine/20260819225008.5F9651F000E9@smtp.kernel.org/
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index d65bf6cfea53..c10012026ea0 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -1897,7 +1897,8 @@ static int d40_validate_conf(struct d40_chan *d40c,
>  	    d40c->base->gen_dmac.num_event_groups)
>  		invalid_dev_type = true;
>
> -	if (!conf->dir) {
> +	if (conf->dir != DMA_MEM_TO_MEM &&
> +	    !is_slave_direction(conf->dir)) {
>  		chan_err(d40c, "Invalid direction.\n");
>  		res = -EINVAL;
>  	}
> @@ -2171,12 +2172,17 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
>  static int d40_config_memcpy(struct d40_chan *d40c)
>  {
>  	dma_cap_mask_t cap = d40c->chan.device->cap_mask;
> +	int ret;
>
>  	if (dma_has_cap(DMA_MEMCPY, cap) && !dma_has_cap(DMA_SLAVE, cap)) {
>  		d40c->dma_cfg = dma40_memcpy_conf_log;
>  		d40c->dma_cfg.dev_type =
>  			d40c->base->plat_data->memcpy_channels[d40c->chan.chan_id];
>
> +		ret = d40_validate_conf(d40c, &d40c->dma_cfg);
> +		if (ret)
> +			return ret;
> +
>  		d40_log_cfg(&d40c->dma_cfg,
>  			    &d40c->log_def.lcsp1, &d40c->log_def.lcsp3);
>
> @@ -2184,6 +2190,10 @@ static int d40_config_memcpy(struct d40_chan *d40c)
>  		   dma_has_cap(DMA_SLAVE, cap)) {
>  		d40c->dma_cfg = dma40_memcpy_conf_phy;
>
> +		ret = d40_validate_conf(d40c, &d40c->dma_cfg);
> +		if (ret)
> +			return ret;
> +
>  		/* Generate interrupt at end of transfer or relink. */
>  		d40c->dst_def_cfg |= BIT(D40_SREG_CFG_TIM_POS);
>
>
> --
> 2.55.0
>
