Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013045.outbound.protection.outlook.com [52.101.83.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BAE50B8D4;
	Mon, 21 Sep 2026 22:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790028999; cv=fail; b=jDCK7qNM0LxI07ZM55Q0TRiGe4FkvxebMMDKZ98FK964Fy5LZonx7J6gEfGefkI92I3yPtkREWWkPsRznIA0ftwV7lNivv4AvFkK5i1FfJPbGiobrbvTrBMhlGO5whYVRmaYzVUUevuf9569+rOsLP2IOI/J31dco87UdQ4AXRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790028999; c=relaxed/simple;
	bh=oQJDh63vXDp08y7nkCxbAvNltodjbLGs+mSIur6OCzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BEfqYJFEC/aqCqYc9HD5jtpF/pXh7j+jAtpDHhy5puocnKzjgggaOhLmvdAv9mpQ92hglTY86BXKbRG9XkFlUvtZmHWTzl2sgb7RZTkwMrkES9LrLIu8I4vfP/VI5OHvLWbQq2CasSzlYk4HvQf/bAbeLRQDRwBV7cQqdld0zIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=K8vWmpn+; arc=fail smtp.client-ip=52.101.83.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="K8vWmpn+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/z3YWA7BqHyOSphLB9mFWDPkQikPtXsuM7Zmlt/4OxVcYj0nlVbx8TnPbH9HeGKXNGsTAE7SEKtfUXY6rKD3jvjedinm5f/IV42ZwihCpcpqzSyaBCSqNHVWA4HWMjKZX/hRfhzwJ14XLGzmCo3NnJyJFKPnAPl4QIj4EfrVOeUkUc1xpSWKQATJjlLr5UIO6jiI2rYWVR+V3fUtM9pnqhUkf+eQzF9ltIdAkDN22IsdJmPVcElPJ4k8HLxF0yPePjbYF9Ub7PRdDlOlBNy5F5/splrNY67p8oIc246gym8lyZnaxjCtu9UsurIq+bZVfHVjpi5NiGpVUr8aVN8/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6382TjiSlFGAlAhziK27oOzI5JyGJGLOHhq0rTn8snY=;
 b=gLxqkkuRXr6eNLuC83n3tPZaVcK65fSs7SxBpwusOBX8Geh4WBP69SCy0pXQBPgCZTne9urInWm747ecy9XMvYPsRjA+4wq4qJKxjGpnM0GcwKF5qxGVU7EQN32+jZm7w+JE9R+GEftRW88dQZdTeTovTkWY25oC3g/47KfxiWrgKSP77oweItkdKHiGydr3ZXsl2+FqLKcUweSEsdU7rrL6drsdMERyfnk+59uszHhHTlAGO6vijxkg6lp/FAr2jM0hc5UQe+9TuXhIMWtL7LZcGUcJ3fS0AkdPQWjFgFMxb5YDhIkJPNOHOfMGiy3350Bu9MODy9QPExaLy5Cdxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6382TjiSlFGAlAhziK27oOzI5JyGJGLOHhq0rTn8snY=;
 b=K8vWmpn+PEv7INtvdeDgkNmzDTrhHw5r0nmGNcXOrtXCk3dF4tiVJE9MIrbcglDM6P39Jk5xDmCx0rbKf3kYQ/kyU42uw8yTlBqahsAcQTEnltn/PYov1cCPd+BUDlUezjaEb2OL7YaGC27iZWjLac81jpZpaLBMB1kU+Aa7Yvg0mueuqXwrCsPeDMQAEfmS2HeDQwp98z21Mb8FMFVgKJOPfeYXNr/n4pQYhnRAh9YGtKP6mCtIaf9r5jvicsMG5EujbX+qHmfm8o+/RIB6eXWDuaN2+E0CujZcAPwwuAJZ8JDbNWC2GWGbKWFHL2A9TO12+vW+jz6VNWTFoyO6XA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11034.eurprd04.prod.outlook.com (2603:10a6:102:483::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 22:16:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 22:16:33 +0000
Date: Mon, 21 Sep 2026 17:16:25 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v5 05/23] dmaengine: ste_dma40: Fix probe runtime PM
 disable
Message-ID: <arGsuaGDffcdh6W2@SMW015318>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
 <20260920-dma40-fixes-v5-5-5c55cd7f92f9@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920-dma40-fixes-v5-5-5c55cd7f92f9@kernel.org>
X-ClientProxiedBy: CYZPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:930:89::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11034:EE_
X-MS-Office365-Filtering-Correlation-Id: 30feaf63-2458-4e28-cab1-08df182dfe45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|19092799006|376014|10067099003|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	USaOVnQpQGmP9HxVxTXn2yZM8aal7kBafbYvkO6E4xET2uVJeKKWuCRwBdnhmThmzJWhTioqst9hnxFEqk4XH6S+9VP3Awi0Wrn+X5x+4OKSWLoTLF/lUvo7s7dI2LsQbli44sdMcVRRcdm85wqyGTVNQ+fx+qxFePp56lxnRVmqjN0WkE4OJvUfYghh0diNyfziCtzjMDCvPhdakmwXiNmfbVe/txpxSTx50iYHEwZgxiqr4pDus9nTNhZfDszpGeAsxiqR7vgbnvjOswaWJYWMUDWoURqtBmJ5+U1+D+NVHS62q1vJQO31OlC0I4pPokemgOgwHjHHfP/0qJzlynQzSFtV1sgaaKJm0DSFhkedcMPDDeO6qUuWpMewPzksj7M3h0hitus9dNadjZegNHAsfYIb0/d30W8pgpmz3OsMiMSkzWGQjXHJwAR4D8YF4fYUUDQ4+VVTTKfToBJqc63O6M0HeoBYEvjEnOtoFfmJ8bRMMWBqqKTelsPiRHU7dCBFsQ2aJg5dnmj8CA4uHbpVLxhwVCWh3N7sa5b6M0YUJCvClCWmZyOXf/QWMQlbmUNo4ZZMX73+5BCjc70IDlCecp+gL8WV720TS7IXplJ15/4jmNDK9KrW1V0J4xeb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(19092799006)(376014)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eNGv1pSrFrcSSScyGTzypE/OpLvtMpDGfXmzRQwDhMs8eBUqWP1g3R+PVeTP?=
 =?us-ascii?Q?QP5mveNexfI3X1/1eP1S+sqjitYzuo049zHTyUsdUkm1mkUiYXN29mz0bIu3?=
 =?us-ascii?Q?jo1RfIms7OTe5xeJOu63xtMvRgZqXgNrakmNx5Numf2rn++8C9d3GP1mhdPb?=
 =?us-ascii?Q?YeBNr44hRwNe1mTbgrDV4jDTC3xynMzQpTa0YVhc0PDnWWXOXb02EIQA1LMU?=
 =?us-ascii?Q?g8UbTiSPiNz/iqnlItoAD05tPKm1jD1J/Ff+Tg7tbxXa9Vpou+4TjrMQy8sq?=
 =?us-ascii?Q?TlNbGOE8rAwKsGIFahvOgWFhOjZK9yHvvEzPF7rIwJyj+GGkNBQTDRORzHa4?=
 =?us-ascii?Q?0/pt3N6s+pEtjiIdOdJ8+mrffzrOFgLpKyEZHQhxQBWfm8H0/0ZQc8fyDw+Y?=
 =?us-ascii?Q?SFKyIZyIv6SPSVZm3mU/i2BYImRMZOlgL+QXm/wQiRiQvxJOi61qRr9E9dru?=
 =?us-ascii?Q?aFFS2iQL7MBv/SwZYfKhdD/OtUyYzL7CQnhmJlTBr0SYkWHXzRo3TVfxOqIE?=
 =?us-ascii?Q?J+3CTTxIz41tSC90kyaef8MsjJ0rAtXbpJUu/g1Bn23QWSkYeW6/6curiwav?=
 =?us-ascii?Q?4Wol9kNIPYLzsn0dzJ+uSskur+3klb33gO3t7HMZ9YdAqWD7PiXfkRZF+ugD?=
 =?us-ascii?Q?JUVYiWcier2HC+DyeiLC2t3kfn31hMMwxAes37C8jBRuw+ExMidgFgif1oiL?=
 =?us-ascii?Q?PUYcKVffbw+aUYqbCXLxSnsSwLAZPGf6GgvXVT3ccvu5vWX+YNjAK5mvF7ls?=
 =?us-ascii?Q?xoz6Yq7HfFdDe8wAkzaxN8LEPQYAIyqLDnTyfyJj6cLSFm9ZPWsk9OS6iHy6?=
 =?us-ascii?Q?Mfax3nrZWNb67zJo6qf3zmXaJzITCne3vrrGtSMSOoukPyuj3ORJrvXqxGWj?=
 =?us-ascii?Q?yHZwq3DMhcYbYkJwvlFVTCiwXfbLoC2yTk99kiN8Lu2m7rP1Wy5BbmNmJ13z?=
 =?us-ascii?Q?fczYha654jYyWg+0x7lFQ4KFmLWg6Qrmgk4qjnq99q/Ub9/JcG7JlBb7OJo4?=
 =?us-ascii?Q?KEy5gQaCdW0ZmqeyEJaxmqPU8Qg6lKhujm7LBGxtT7tpu8k2G3vgyE3/tUKC?=
 =?us-ascii?Q?vydc85ybIsYef9tK8aNdxVLfC7JzYXu2759Nn13JCARLRqsdB8juSGoi1biK?=
 =?us-ascii?Q?G2LmLDrNff9OTfgB6HE7Lzd3Tp+bwLQCfRi5ZZ0+H6BkvUD8BCtvzKAgFS68?=
 =?us-ascii?Q?I4Mvai9dCFZzMDiJIRp7VweqpFy3oV4CYBMcHJJsOyNlTkNBPC9oom32QvDQ?=
 =?us-ascii?Q?neF8H3MCWNgOdskxC3NTCvjJF+F4ju5olawb9c7jvymH0/W8SnY/rIK2sNHx?=
 =?us-ascii?Q?Evy3FoffE0kdIWrxhOIBQm1Y7+PumJ/D2Bf/lLuVkS79uxZMSjlFPAbZ3NSx?=
 =?us-ascii?Q?HD91ek7kk0JDJxPf41GV1JltrVadcX+9CcHdvRhAr0lac8IABXxjEl/1U4SQ?=
 =?us-ascii?Q?FFnku9qHd77KAYpl0ODOG4W+2V9PWhp2R9D5RO1tks464IpzRonJQ0FH+5Sf?=
 =?us-ascii?Q?K9sAs8CmwSPgzOhUa+vYCs2mJg28eFkzRL25kVwu74qYgseW+Msu4k11sJfs?=
 =?us-ascii?Q?0emWkKu+/JPNpHF3Qb0xjSTredeIdEu7KSuEbzc9vy670W19JJQ/mAJUjKcN?=
 =?us-ascii?Q?wQt9s5fXB/cdGuBAQiynGgNTgqRersFHdtpma4UkP0Tsfzd/I76mJKq89bU9?=
 =?us-ascii?Q?oGQEAu2mA0V8kAfUJr1KGGDZeOcTk+foICvFGYhZH2J1la54uXl6YwXNjzzn?=
 =?us-ascii?Q?pYDNZLBSrZu6O/L0P7ocynXNQA9CRMXxUoxkwXR40jp0jeiPb9Cg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30feaf63-2458-4e28-cab1-08df182dfe45
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 22:16:33.1927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+4vqAveOzSqbEWUgXqVCF/CeqRFDfiE7KPdZPjzHZQ2PX6lH7wZ/0AuWZB/x+YM9mLEfHwoMNubzx26kyh+a14XfZ9zN1/7E4BZgUFP+XR4i2llRLfUZEgNPw0pMugM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11034

On Sun, Sep 20, 2026 at 08:59:40PM +0200, Linus Walleij wrote:
> Some d40_probe() error paths jump to destroy_cache before runtime PM has
> been enabled for the DMA controller device. The label unconditionally
> calls pm_runtime_disable(), which increments disable_depth even though
> this probe attempt never enabled runtime PM.
>
> Track whether this probe attempt enabled runtime PM before disabling it on
> the error path. This is not about a later deferred-probe retry, since the
> driver is registered with platform_driver_probe(); it keeps the probe
> unwind balanced.
>
> The interrupt handler uses pm_runtime_get_if_active() and cannot
> acknowledge a pending interrupt while runtime PM is disabled. Request the
> IRQ only after enabling runtime PM so the handler cannot enter an
> unacknowledged interrupt loop during probe.
>
> Fixes: 0618c077a8c2 ("dmaengine: ste_dma40: Fix PM disable depth imbalance in d40_probe")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/dma/ste_dma40.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 280a0d2f16c5..1d02226ab5ff 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -3661,6 +3661,7 @@ static int __init d40_probe(struct platform_device *pdev)
>  	struct resource *res;
>  	struct resource res_lcpa;
>  	int num_reserved_chans;
> +	bool runtime_pm_enabled = false;
>  	u32 val;
>  	int ret;
>
> @@ -3748,12 +3749,6 @@ static int __init d40_probe(struct platform_device *pdev)
>  		goto destroy_cache;
>  	}
>
> -	ret = request_irq(base->irq, d40_handle_interrupt, 0, D40_NAME, base);
> -	if (ret) {
> -		d40_err(dev, "No IRQ defined\n");
> -		goto destroy_cache;
> -	}
> -
>  	if (base->plat_data->use_esram_lcla) {
>
>  		base->lcpa_regulator = regulator_get(base->dev, "lcla_esram");
> @@ -3782,6 +3777,13 @@ static int __init d40_probe(struct platform_device *pdev)
>  	pm_runtime_mark_last_busy(base->dev);
>  	pm_runtime_set_active(base->dev);
>  	pm_runtime_enable(base->dev);
> +	runtime_pm_enabled = true;

Does devm_pm_runtime_set_active_enabled() help your case? I have not other
driver need this kindle varible.

Frank

> +
> +	ret = request_irq(base->irq, d40_handle_interrupt, 0, D40_NAME, base);
> +	if (ret) {
> +		d40_err(dev, "No IRQ defined\n");
> +		goto destroy_cache;
> +	}
>
>  	ret = d40_dmaengine_init(base, num_reserved_chans);
>  	if (ret)
> @@ -3817,7 +3819,8 @@ static int __init d40_probe(struct platform_device *pdev)
>  		regulator_disable(base->lcpa_regulator);
>  		regulator_put(base->lcpa_regulator);
>  	}
> -	pm_runtime_disable(base->dev);
> +	if (runtime_pm_enabled)
> +		pm_runtime_disable(base->dev);
>
>   report_failure:
>  	d40_err(dev, "probe failed\n");
>
> --
> 2.55.0
>
