Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013051.outbound.protection.outlook.com [52.101.83.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF0651D51E;
	Mon, 21 Sep 2026 22:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029182; cv=fail; b=uyrHI6KWP18nC1USrhshJlseiELtAOa0V6W1xf6PFXQfUQo5eMCSdUGubbBWnhaP3AJ0SR+qyTRfCk76LU+spZiaXnVrF0jdl94xkRSZbkVXFXYVBaQaUpU7AibOGVSw90j+wPiuJipj/4yo3A/dZo5z0AzRjZllhDHceRFTw98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029182; c=relaxed/simple;
	bh=LJUC4FJLtP1f1n4tOzTf08BIqBDZYVH4LkuPwWFQlpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SgyroXj73WPhXfbA2SJu4a6H3wDtGjTjHkSaNtPPNHEszrbKV52bdpErHxLSQNMMSi1W5vcgQspcsh1Ke6OmX+tHkNQ2C3aIToZ9eeDlF2QQKPZc8Q/46qOV34V/tP6zeE9XcS8S68B/zwqAwjgu0vDlogqME/qzl3qCkOKAPKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DWMQY9Wv; arc=fail smtp.client-ip=52.101.83.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DWMQY9Wv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cgq4MlbxjYx7ikZfz1T/gpeJnRHA0yP2IIBxRZlBJGMUhI8wUa7JjhDK37U1FXkjxnEUu+m83tjbJGz1sZs2OFM9QZlmVceUz+z2ju0pKqHNsgsQrxm5wfDIAF7N1GLklWGJwiSKzO/0s3P+2hBS5ffbBuFfsYEDNx/+i42Gr1b6Ctwvgkwz6u3RX0OE9eIyfAD0mAuqESUw3ymhDhEPj3tt3mvgI8rjNeTwBwVeHgWOF4E9L/hzsfK31xU+iwj/DdRUX7UOGIH6qDvngYrS9TLR+wSAWnMla7kczjmg5YLBfay7dJoVyfJ2H10Icl1VM9N0zrCSImQcmKIc2wiWBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sB9L4jZOpqhAlB0KfiInxhyB/5vy7ukKu2sbROpdZrk=;
 b=d3rV3ByJbcHlP8fnC1mP2QwVRT3nKLxoA1S5vS9Jt3LA3Xi95qmz1X8O9KTKZU3pkf7kvva5yCWeuVVlrhGwe7hmcV7ZwjKDVfaZGX0HAyd8gLDVSHHso+potXT7jtUVJymXkK4dTAPHGig/j2opg+mXbCawvX15M6QvxPb886a4f8J4Z4kd+TxJOjkIFcAiCZDR9sQB9uRskecPKId9+6X7HfYr3u3/zUS7vAQXnNzXUFOzcazxu8QUPHR1cjVdkRRMbHlDM4QEHOYi9DRBBFS0lJfo6DaVChZszSQj7eWc053CaHUksw/IrWZo3tkqhVdYUxvMUdBBqkU0AhKOLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sB9L4jZOpqhAlB0KfiInxhyB/5vy7ukKu2sbROpdZrk=;
 b=DWMQY9Wv5iUMzoZKV40zMviU4xcC1foAIQLbebGTw4lfPdqXOA/Eb7CN1kplKBD8b+fasgWvkKh9iADNBGJpF9eAINHJvZgXWdjotoKldWVNWRGEPk6q/1vTl6mRv4+0i+jdAzHwuPMpGekRTyap5CYfvi0UGevm4COd5WzDnSBKQp+CNF6iuS1PX1y06AgaPs+cu8pd6TcQlkdwY3Toj9FeBHEDCjvEe/RCdWQdCYJFLcywRY7BwAU6BLUUOIaQmxpg//26mu9Pdjm+fUV0hlmbJ5tQtwagbHTtAWL38DLY07uih4nfCFxdUHg7rVtU9UF/FPu+663P3fhj/bo36w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11034.eurprd04.prod.outlook.com (2603:10a6:102:483::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 22:19:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 22:19:34 +0000
Date: Mon, 21 Sep 2026 17:19:27 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/23] dmaengine: ste_dma40: Check runtime PM in IRQ
Message-ID: <arGtb2NK7orjJk0Z@SMW015318>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
 <20260920-dma40-fixes-v5-6-5c55cd7f92f9@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920-dma40-fixes-v5-6-5c55cd7f92f9@kernel.org>
X-ClientProxiedBy: CY5PR15CA0025.namprd15.prod.outlook.com
 (2603:10b6:930:14::34) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11034:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ce786f-9201-43bb-6604-08df182e6a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|19092799006|376014|10067099003|6133799003|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	pGzcLTMhJO5HfCAAoEJm23fmiA/JHY+jvDmWU4AkuQe2KtrmEJOuGOI+0ny07hFmZhpU7Vz7tAOEh2MQA4yxmPABbcGR89M9JJopATqDmQQbZlBgC//RlZnE511lqqzVYnO9eGOJsiTYjxE9qErITKp98C0sW/mNSK5GHw1yBtG65+wwiTUdUvPMycVOtQJqhAGbaT4Uc+Jpe8F2lPi4SMmsbXEl8r360aTHXrqqgvaSAenPDJ4jZzKPb+EZTljqDTb4KymUxGHHKJSub9mnrT+SHhdoGJ8JBmyKy/mb3SqR4hIh2nsTnGbsBz/FtDoSVc+qa2ecUboCGAeBLqcleljECHAlLYjjtWZaLuajFEmwU7M7AOwQK8aqLM3iQayPoTVfbg0kpnTjyT8YqT0V5PAhuRLP4xeazI1dU6YTaWuXAUBUmcsoWxx8wVL9VbEOFfi5pVZLzk8kuenx8kRb3pGkzV9aM4iAjs25LCURAKtNf+UKbcMR1FAKCw2gszIRed43+jwoAj12Inqb9NSVSRZ5KBykk/OxjExWE8BmGudRcsrn68Wi6G+7tp2YIkvxreYlBldvCO7MvWH2rwetbJHrj9fq0dIPyZBesGBZpvC/G4g7VGAAQjeHsDsFF8Ul
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(19092799006)(376014)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CjMbJotWoSvS7J2LRSKPZfrSjQ8r2KBl+sT8G3KoNLuSomJTKXXTsakWOfc4?=
 =?us-ascii?Q?hBUc8tboZqSIeHkDsrsStmM/JRVlDxFU5vyHuOmaFPG8zH/IQkED2Jd50rTf?=
 =?us-ascii?Q?2UL5VAFMjSq/OPb+3PD4gMA71Wvf6A+GfLfKGEs6iBb2L3FlozBRJXZIyJjk?=
 =?us-ascii?Q?BvGRQMIw/Mjsv1ej5x6zLgu18w37LYtqTAEr6mW2TGE/BQgQzRsxbC7L8Sso?=
 =?us-ascii?Q?8cDvPnem5MVwMzKLqvFcC2hRw68/akX7ESV3qLnCqeJJCMxO4oi1tb0yj1q+?=
 =?us-ascii?Q?PPTPJC9ImDAqPKzMmyXdm1lr1bpcsz9lAxYMhYUDpROWfvtmcvMSMm4RFTN5?=
 =?us-ascii?Q?iyGa8eN+qkJaFY5ycLub7wZYA1vzV0rjwWatu/jHaiaHHidXXAv59TlJDJJh?=
 =?us-ascii?Q?WzJb0+eWSKO+PbNmtkIWXuFZQAzpdKocmKrVxe0GNFjGh090p5jmaiM6uz8Z?=
 =?us-ascii?Q?oZOXfKpu9P/LcymL+x9jARd4ZvDw8La/86ThtUiMAM8BoiN4BDTc6XF+UTEM?=
 =?us-ascii?Q?E5JTNOCj6TR+49TM1vLhtdFc+/ildItCvwsz8m5RthCqZVbhpieRJ4z5SSIa?=
 =?us-ascii?Q?4b1gJ4tXKoa8pHlIpjkqDEDVOMRlGqRj3qlMAWshtvleAwahl3hHno/85qa6?=
 =?us-ascii?Q?PMINp2HqZFuZOeS7HdmWgyE5KGFKTCmUH5EjYTJBwPYm4x3mfOlN2rrxT5Fb?=
 =?us-ascii?Q?5TFZJaOS9ZivWVdmvzd11r1GuFM9IO++gbZeDNEPpEXe+6REMB9ueD+MfsFw?=
 =?us-ascii?Q?Pw2NmTXAjddRUMjMr24L0cq7DGCetra98e4O/xbvAgXz9xyT2KIZajv55ku9?=
 =?us-ascii?Q?XFGM4yy8G8nOagnmRslfA0ZWmGvxN8fPUyqoB41cG2R2YSIFVRZnoqMPRtke?=
 =?us-ascii?Q?FsqE2TXWDKDjtFOGT3DEdVsvpJ4q8XZ5RQUaIJ/0yRdHo+0wZSoWJ6T2A9BO?=
 =?us-ascii?Q?NrYAcdfFYt4blyDqw70gjAprr2gcrh55aRlsyaExzmIanalrd5oWo424Lo5U?=
 =?us-ascii?Q?IybWHRu/+I0dWXYJccZbvZdRjVu9YDWx/vOxW1k/5aA4jvsBuJC5fk8kRwEs?=
 =?us-ascii?Q?uQbdrUDjebk/MaTM4zdQBBZy8xttQkz9VdEJK3zI7RsnAhpBNyZyiPvkXIYM?=
 =?us-ascii?Q?BIXFe6AmvipF8VhWlfOiLC8/JOwV7uK0v5N3AN5pqyLa7GVvNKWormYoFyG7?=
 =?us-ascii?Q?UUddxn15Cm/nZhupYXpw2na5KLoKxX4fYiFhit1c8JP1kGa/YwJxtPP/8FcB?=
 =?us-ascii?Q?JOH5ji+5ao0KUNHAN+5MsVhGWetPprOOYwiv4BrlS+8CoBfcI7wiQ8xdmiaR?=
 =?us-ascii?Q?BXGO3BlbdjmGJK9ce2GH1hRdWj/hptdSD7hD8n63/N6hcprcEdQpgbJ/0ww4?=
 =?us-ascii?Q?tElxRDdLqOtxp+2KvkSRSXj6XZU8IA/eeK3ZCCBEUo5er4D3VRp2Er2WwGfe?=
 =?us-ascii?Q?HmAl7Dym8UEpFmy8R/AIU9wjxOFDm+UrnmyYk6PTpFfmAvaXrp1ZKHIiHXQq?=
 =?us-ascii?Q?La/RdO9YxMs6PYhAUgtBjgMssdt4e1zkU9FCtiuieTzA+Sa/THlX2Vwgbpni?=
 =?us-ascii?Q?CmT6OwWznjfyc4mzxLDD61LDUIFxugn+pOQoTZUFJltz2e4/tAAprRnRhZ5V?=
 =?us-ascii?Q?XixZhh0S+72qkkkM94thYImMYl73+6veqrIzlb+Z8qTq2dsX7M7c54FsEE/J?=
 =?us-ascii?Q?u+FmsDHDxQQNix2OQOTlQ58GbUk7SVHWI1CMeYm/8Iq/MculEt3sGqdVicJ0?=
 =?us-ascii?Q?Bmkrfvn5NlDhHCFeAC1s5EubAXS0hKDmh9ZzOUlJW1rflLbSzJb7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ce786f-9201-43bb-6604-08df182e6a7d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 22:19:34.6664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rIo0gOPk08HwAmJOIzIN4z2gtiT0GHM9zkuP3RhyOap5rSL2iySD2KDd6x4QbT/MLoelHLx+aV+6th5HKrEPJm7sg0sn07XkSv2rUufNDB/eXFukkXwlKzqzpKd8ZCRQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11034

On Sun, Sep 20, 2026 at 08:59:41PM +0200, Linus Walleij wrote:
> d40_handle_interrupt() reads DMA40 interrupt registers unconditionally. A
> spurious interrupt can arrive while the device is runtime suspended, after
> dma40_runtime_suspend() has disabled the GCC clock.
>
> Avoid touching the registers unless the device is runtime active by taking
> a conditional runtime PM reference. Return IRQ_NONE when the device is
> suspended, and drop the reference after handling an active interrupt.
>
> When CONFIG_PM is disabled, pm_runtime_get_if_active() returns -EINVAL even
> though the registers remain accessible. Keep handling interrupts in that
> configuration and only drop the runtime PM reference when one was acquired.
>
> Fixes: 7fb3e75e1833 ("dmaengine/ste_dma40: support pm in dma40")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/dmaengine/20260819225114.AE1511F000E9@smtp.kernel.org/
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 1d02226ab5ff..58128a980847 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -1798,6 +1798,11 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
>  	u32 *regs = base->regs_interrupt;
>  	struct d40_interrupt_lookup *il = base->gen_dmac.il;
>  	u32 il_size = base->gen_dmac.il_size;
> +	int ret;
> +
> +	ret = pm_runtime_get_if_active(base->dev);
> +	if (IS_ENABLED(CONFIG_PM) && ret <= 0)
> +		return IRQ_NONE;
>
>  	spin_lock(&base->interrupt_lock);
>
> @@ -1846,6 +1851,9 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
>
>  	spin_unlock(&base->interrupt_lock);
>
> +	if (ret > 0)
> +		pm_runtime_put_autosuspend(base->dev);
> +
>  	return IRQ_HANDLED;
>  }
>
>
> --
> 2.55.0
>
