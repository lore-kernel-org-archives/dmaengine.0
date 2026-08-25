Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013017.outbound.protection.outlook.com [52.101.72.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A95F484256;
	Tue, 25 Aug 2026 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787672444; cv=fail; b=SFhDkqQDxgNbFVmPB+gDiu/yU4zzqcM8a95BbQuDQKLlShmpPEpuq3zWbhg/+EuVIT0tUtiffNrGS5HSBCKoe8l8daSPMQYR72kGZw0CrbNsOtFSmkFY2/ztmS98R/LMwpDH1wqqCREreJpxhgaUCvQLep3dnIdue7gz3vMXOto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787672444; c=relaxed/simple;
	bh=zJe5g7wAa4ISoFy0UOjWzeU+ISqGdi4Oszi4QIHgwk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EwNdIrEgKc8m9IjRzhzYY/vfvnNbZRi0+15XhGMwcvmcJpQMMvXgr2Z/umZ6mCi4+huUhpwoR9FnGuxtbzOrvhz7x98PPy8DrVwU+ypC1TJdPTLnP7qF7VpQxhdM6dZnMgXSU8LS8qZ/0Ac1/On3YCfW2TJl+Q/cXOB1opP3wKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LilWFH7V; arc=fail smtp.client-ip=52.101.72.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LilWFH7V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmX0vd6hLf1tiNMapgeZYPorRxO2L09znZcZIt87PwCfSUhifvOgHa31L8o4s5AzaGq6ZKBsnjcSNyWHt1/DOVcAyPRIIGQ19ZS1wXoSiFhFieqNO9wqUICg3YblR1u77qRg9Y+u/KEOPrFkOddQ+AN3XhI1ywYpO7brF4yH37hsxkM0kXlaw66sb2MNWlZEmwrqJePjYVn14WmJzFzjGXL1vLb5WPgBOJ4BmnjUubpw4qtDpbbY5qV9qqZ/5anGhplQr/eUyo0e7WrwotQNdLL8CH137CfXKKaFlL73jacDV+ugLYdF87v9blcXTVITkBSDNs+LuhRFoYBLYI4PDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwiGM2sevGbOU9vBx8hdxZteq5LnGYrZxCbM1h4Jt6s=;
 b=GmKiuxz1b1SuWtdh9Escx2li4tUOCB629Xm3ikOqXMQDjxZQKmjiP0N1rmP47wxMjFmYRegWx1F+M/vHsiDyqnjUf7DGXJaDYxCj96BCoi3C2QaeN76oeJNla/Ve5t9+vdRoD9NZVIWdEl3ZD0xJ+KGtsfyvQzwR3B7HHsUbLvQw6gEmwl6mDPfwegvfAtEcUDcMu9/U1USsf1TU0NuZEz3wi2RGOTeOoorNH78su8+pPNQeIntqSzr0egD5YKKnO5BE6lkXwPjqVNdpSnmnf7ppy0E+Pi9EbypNJSxWmMvu6bxOXnRfIC2TdXXPLhEjwm1pDcn8Q+xspaqhSu+NTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwiGM2sevGbOU9vBx8hdxZteq5LnGYrZxCbM1h4Jt6s=;
 b=LilWFH7VyPgQo10iQSa/95JrC+s1qz8osE0kqsp9KpyfADbyp4AiD8/4CALNWFMtKA46r0/dJ89yAPGWMdET08UBkopaJPdZ2xU527BFWcFk3zIUE6rJgBqeI7sn+vaZ4Fr+ujhIQ58Z4KHs8qBh29phWYlTN0P+5ThOMOOOjdH3EJPfpVJAvobb2f1iitf7ffwbky9EoM1pLgrcKqZCf7rSPnKVm1nedkhg04kTp2cKlU/XxAKJ9tZKtZqqACCoDh44eHiNgJFWs3FziJgqAN0FtwyHvRUBT00+Fa1bCP+1TBiEnM7yjY6hBz/BUGzYoC/sNzUx1fYovrhbFc/REg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8228.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 15:40:40 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 15:40:39 +0000
Date: Tue, 25 Aug 2026 10:40:31 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, dmaengine@vger.kernel.org
Subject: Re: [PATCH 4/4] dmaengine: sh: rcar-dmac: Add support for R-Car Gen5
 SoCs
Message-ID: <ao23b5sx-YAlii4y@SMW015318>
References: <20260825141542.30901-6-wsa+renesas@sang-engineering.com>
 <20260825141542.30901-10-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825141542.30901-10-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: PH3PEPF000040A8.namprd05.prod.outlook.com
 (2603:10b6:518:1::4a) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8228:EE_
X-MS-Office365-Filtering-Correlation-Id: ae47344b-44fe-4142-ec7c-08df02bf3714
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|366016|1800799024|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YeskZGbtfhFL1kusPNVVmaP+/dtPupdaXrLFLT9UlYTm0Jg1s9pIyRS+t5JVMs+pmnymmy91fgtGrylgun71CWIOvL3LdmRBOmH65kJfQ2OecA4Vk5JcYcrWE0xWzHzJ6bXhKqHpO7JpHm6yq6rTEfKn3mBam9KyE6navtaTh4i8w19cyzq19rikggzOmJ6maJ9dCh4G9029SF9W14EtgSMfyYhWsbh8L/28UZVEoa6dD/yh2h7TMgd6Kl8tiQOu69FhfCQ+qY9DEK1xatBxDDw6qLQv49V1YgpAfod0ljRcxeRNG/GeG/OTVnaDU2/MmPYY2REiiFp/xB1L1YU99BwfQLm4QpnII+iWwYkk60NEcPd61pKhIHN2xl4J0eq1UFbh0i2Is5waXwCxx5zyde3vIRBj2CJjB/nHAYulTNkCp4SgqH0V73RmG7f015JV3d3saa+yB898PydJhVuRuMNOkb1t/dRsJF7oxQf0qspEY4IZyG5IhTR3II/veIrcQwKl4x2XkB+JtI3F9p+pUsSiGTWG+kdEb0B1II1ndCchaKquqSjKx09pDOOyQW0On7+eDqtGxfvzHbUXDS+Bk2lfZtOJMh4W2yYSoREvvVoS/YQV995FNaCQs4ViqjvBsuI63LnapZKcx2GbeMt4IELXimRW7MLJAGkplpSiwHA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ma/gwvlKI2FPMI4ALYEM8mNYvAxR41a4bH34YOMTP9lBJUjtpI4/WJUuIytl?=
 =?us-ascii?Q?llD6MNM5QnXzxJY/zx98cs8FN6mZe6ehoEIlIkgMzly3cEw++4oqZwecylxH?=
 =?us-ascii?Q?RkQmdEvgIdlELX0FcLuJq7OEiqu6tKz/oy5AtRYg7Vn/UdRL32dH+ZCMZr1c?=
 =?us-ascii?Q?iNNirTDRWdxcmjwLqLKJc93RrTepRQyFlktASzXFw7SY4OSrkGH3NF6Drwng?=
 =?us-ascii?Q?LOl7dCO5IBFgG574I6mInhkxiK0+wGvg1ZDnDTgE1bgD12lKMr1njtZClcJW?=
 =?us-ascii?Q?P2q7EAVE8tlJg6L1E70HmbIaDEhqZV+jqLOEpciprVA5OQJOhxlQV4F8IU43?=
 =?us-ascii?Q?wZHEkBQCXgEoEkAzRiq7o46j/JZKdU8cqjjdyRvk2zqpdpMCitHYW9EQqkx3?=
 =?us-ascii?Q?nktEMTY/b+Gmaxk3XdcOr+5aaG2BXb3DMAdpR5OCnUeDekf1Q8xC91r8Ffb5?=
 =?us-ascii?Q?evwx97IrJXjUPGUBG9f4tVnYuu6P+hlaBHckyowbRGOUpFzRRTNc1J7VYT37?=
 =?us-ascii?Q?fQqG6KELkeMIG7ulHwUTIqkvkQjGCJpwGi0MtqALQ0qWZlMrSSulxFwfuGZl?=
 =?us-ascii?Q?gVwB6WQEepZCfopNOikOKD45xzjVhjk+mrmGbAoX9lcaDEfeZHJCuR7I3Fxe?=
 =?us-ascii?Q?i/xWbGD1V0K+jtJsxkzuiNv7hVa4EwWLGqek9HXJZPSiSaPBih1tEmWrTCHZ?=
 =?us-ascii?Q?81GtmLh9WoHBcxulgpACtHlGodW6nrXL68IdcBUEspzCB9rOVyQLgNwJzLWZ?=
 =?us-ascii?Q?83epD9vQ4hx7xJN73AvaWPKwflP3iCg/LKm3zIEO8HqKbK0jzv1vCJdklFyZ?=
 =?us-ascii?Q?/dPYWh1rxTE3CtsMniMZ5YaSKm1DWdOoB7KRb5JZCwEFbGXKDTPA7YiXTT6n?=
 =?us-ascii?Q?pYOF//2YfLPdaMqUD1RU+mjhLquQ7jHKS++GYYQLvv7dDWhNLpESTh+dvaqv?=
 =?us-ascii?Q?3LK33yht0iNG4nRc5u+Wpe7EjldTU6IlCsPA6+7oAgQLfu6ZLrJmTcYNvjUf?=
 =?us-ascii?Q?SaTwFL27lCZcCG2ordfZPAInYB6jfBhgRZNM/U0ouQxpeTXTaKGMXAvYnoVT?=
 =?us-ascii?Q?fwoPfbA8NMU2TvH9OOgNekrN/FXWangI5ejUq2KIJm/mz3MohCd95BnbRyOT?=
 =?us-ascii?Q?zJS8jwbwMKztG7OCSv9ZW07QC4YiuA1iymoHs9OEzNAuW+OaOmhMO413RkHX?=
 =?us-ascii?Q?uAoy9lCM24JLANMVwjIXcO+NSNSPcQJhEqzJvq+b6sKbfykMUPuJrW51N1I1?=
 =?us-ascii?Q?sDBM/v0kLw8J2s2Uai5UR7j+NxLsPFO1rDV72EsMX05U6BpwZ6jbxPIcg7eg?=
 =?us-ascii?Q?EP3BCEy6jAywhHUeSaDvJsG92DWh22jXGtjnFUOkC56X6wM72moSRsghHwvo?=
 =?us-ascii?Q?jv6Cj0Y6dc0Aw6t9g8OlTpPze0Yq3RKPMYHVgu7RuW6oCnN37tyspgc4GfzI?=
 =?us-ascii?Q?lKdFQ9DYEk4oUiQjg5lTHb3K2vUHBCBz33c73yXzRRlOq8424YTapPcdQbY8?=
 =?us-ascii?Q?TVjpKZQcAe+HyMTobo3uoXL32zW2R0iQCmKhpbMc5St7vrU8prqxtHJe+cVU?=
 =?us-ascii?Q?V87lUtOUjWE6RsgnwDSSYSY9OH0FQASQtWsW/6m8YUNoRcvhbJpAxui4Fomn?=
 =?us-ascii?Q?DhiQvpFKCtVkQYLDcrWih5OZqz2FvOyPpNdDQ48Rbnmw1z++0xETJwndf+Zn?=
 =?us-ascii?Q?izB4XhKBoB1m/G7Sz/Z6H9AiqmbYSuzLDx+tHzSaZlGrJjOGPMWSano0yE46?=
 =?us-ascii?Q?VfrYh6joFLAIahdhoqnuiSW4hVfT2IYrEd+mt0sVrXZ/Ftai2PAD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae47344b-44fe-4142-ec7c-08df02bf3714
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 15:40:39.8776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHjs7IyUmFLlK7PP9OLc6Srha2lJZ7k0t9yPqqZGhLpd9iSEaBr88cSrILm0rT+xe0FDRI4bthX/+uSC1CK3giCrV6aRiAq3s8GkgoXclWFgteMDzD3/yZC3gcOxkeX+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8228

On Tue, Aug 25, 2026 at 04:15:46PM +0200, Wolfram Sang wrote:
> Gen5 is very similar to Gen4. Of interest here is that it has a SMMU
> instead of an IPMMU, so we don't need to set the flag for a workaround.

Generally, needn't "we",  simple said

needn't to set ...

Frank

> Make the module description more generic while here.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/dma/sh/rcar-dmac.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 9c5210257097..06f691f5f3fb 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -2012,6 +2012,11 @@ static const struct rcar_dmac_of_data rcar_gen4_dmac_data = {
>  	.has_ipmmu = 1,
>  };
>
> +static const struct rcar_dmac_of_data rcar_gen5_dmac_data = {
> +	.chan_offset_base = 0x0,
> +	.chan_offset_stride = 0x1000,
> +};
> +
>  static const struct of_device_id rcar_dmac_of_ids[] = {
>  	{
>  		.compatible = "renesas,rcar-dmac",
> @@ -2019,6 +2024,9 @@ static const struct of_device_id rcar_dmac_of_ids[] = {
>  	}, {
>  		.compatible = "renesas,rcar-gen4-dmac",
>  		.data = &rcar_gen4_dmac_data,
> +	}, {
> +		.compatible = "renesas,rcar-gen5-dmac",
> +		.data = &rcar_gen5_dmac_data,
>  	}, {
>  		/*
>  		 * Backward compatibility for between v5.12 - v5.19
> @@ -2044,6 +2052,6 @@ static struct platform_driver rcar_dmac_driver = {
>
>  module_platform_driver(rcar_dmac_driver);
>
> -MODULE_DESCRIPTION("R-Car Gen2 DMA Controller Driver");
> +MODULE_DESCRIPTION("R-Car DMA Controller Driver");
>  MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
>  MODULE_LICENSE("GPL v2");
> --
> 2.47.3
>
