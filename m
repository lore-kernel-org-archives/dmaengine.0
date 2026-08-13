Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013061.outbound.protection.outlook.com [52.101.83.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9425495510;
	Thu, 13 Aug 2026 16:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786639086; cv=fail; b=CqDR/sW443zrLrthnYeQSNjzVyp71O6ZO9OMmcX614YKK2Yb8/ako2eAmQDy0G0j/caCMQVepGKTougIx6fW+Tg6gOVB+oEzaQFuyTzlfVmM4D3RqnjjeoUHkXpzbXvJpnS37s7mATmmYO5csIk7RbXZxfnmETMqA0gI3r+PqH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786639086; c=relaxed/simple;
	bh=x4z1ThHvcOgcmw9lYI75vljb0/uzsIrLou8KIXL59x4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DAKxC5ke1nh/vvzBfdSwJ5vfH8X2PnJuTbww41+if8II8pq84uS9TyyqY1EMqecHbaWyKd1yar4huS/Y3q6ifUsjy99c4L0WxcUeuqISxC8UVEGTC+2oWL9ulLqChG3CVcuBzZK7ryUNDGkEIwU71PCsOAvedxItAvJlLZclkn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Behdt4js; arc=fail smtp.client-ip=52.101.83.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Behdt4js"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RU0PRq+l5Kuh9m3AG4DWncO4XvyWtmPsC4cIt+3fYvJUVCFZgHezD55bw6Lb23a3zJobheSoAP0zrFmTVhxb7ZDQnu8pX1Fx2C3G9eqFVZDpW1Mxm74LzwP41OIxSE5ZDQXGW+cPly6qucZngOY0KBWp8Riannup0dvIpkDCnHWuSXXBQ/sf+YiYWmwN0OqWKpzBi5IvF9bm6BTOloLEusfGFqJqk2Y2k2Fw57r0j6RtLwoBypPLe/xRPmjG1ssbRbslV2dlLljjvXEdFoiVECRwgknMHCNORYloXJ4qmosHroxDmwD2IDgOhcyYJMs+ZWDak47hKa17w+iVVn38GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5wDM1cM/MDvIax2cGtS+NUwO+OSuu38SsTzferot/k=;
 b=rt0EEGuI75ACRu3I5hCq8rVYilwqoyFDOXAm7V69ixc/6JS+7SXN5a0JN0KdNpiWca2NtuTO6dpCtTOk5t4obVt8rxRgc3pySiaNrExCVQ43jPFSDng8/fOhN7brw+lQXmEyr5kYOz8kNW3IvtKFJsijj3mBiI96Tf+mCFS6b8rkeNdYSG44Qx9yYpa1DWHk6JOTudKH5TtCmmYuYrS6OeOVArI8lR/JtWf6Uuf5GzkUweX60Y1jQ12PfMBFwtEs6xZfr7AU9uq4FqEla/UPtqEcqeoF0IE/VTlWA5APFH5+1//AZOXcNNSCb+63otO82IZSPdwd9xwr+gKa2wqGew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5wDM1cM/MDvIax2cGtS+NUwO+OSuu38SsTzferot/k=;
 b=Behdt4jsH5evPTyqLc5YLCcbpLQHrRurpcUL/4fSX+RgvCidrdaf7cKMSH7liEAt+OeTrKV4GS0VuSl/e5ywCSkolcN3Z2EDQN/nKC8X9yh/zYAj5nV4f2Gl6fqLuj+HT5S44MQQjTI5chYk4DiBKanRCLeLRtGpdS3eTMl0ThEl/ghdsMs3+6G0fwkwVpn3UIbX68dxX53SAkkPnNceRluXXvcIItmdowoDlo5TjLkf0ktwcNO7BU+nV3zPNTZ4UmzkvZWfJBqYoUPTvgBhLIP7Ms8QzJ4DZLkZNX9TZBo2mXz8UpE9AtwGKWacU85vlBbJSM+rWBvAsNvEvnu3oQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by AS4PR04MB9458.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 16:38:00 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 16:38:00 +0000
Date: Thu, 13 Aug 2026 11:37:54 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: dw-axi-dmac: fix clock imbalance in resume
 error path
Message-ID: <an3y4lS-ZE4CdJ7R@SMW015318>
References: <20260813105432.2577322-1-nagachaithanya9911@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813105432.2577322-1-nagachaithanya9911@gmail.com>
X-ClientProxiedBy: SJ0PR05CA0104.namprd05.prod.outlook.com
 (2603:10b6:a03:334::19) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|AS4PR04MB9458:EE_
X-MS-Office365-Filtering-Correlation-Id: 79766caf-35ed-4280-11e1-08def9593cad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|19092799006|366016|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	G4+cq3mG1v6GEMDWTQJHna4L+86wRLw136pzZtzYGPB+73cxSOMJ1cysVGCRAzEcI4t+l0P2uiKfJU1zqAovLDq+2NlE02QybKbmpa/sbCyO+29GjdLMmsWbxhsgVUJLvhepKdpioTAX0zAz+WgwWvTJF/SaKY1AyHruq82sQjYAR61SWkUr4OOhZMxFkKONc9JJOdjS5Z46Kow/HqJSJVCzNcsmHF8wbJ42QIAb54EQG5GD9yqRCOHqq9L64qlhyC6OnbBSlGORiMyAtetXsYB3PHe1rxhQtFXmtfthAcPNFhBnjB1MccueWwBCNFdCzVyVi5jkUzpct6Z+9dh3tmn5H1YCs8U0LGQH8AX4ijT0UkMw3WNAUfuWVAzFBaSR6lh9Tm8Wp8YdXiUALcgjtAc0UYgBC3UjdMnBSzA39uWBUEGtO6ogV9EGy+c9vQZOVPsSeHfwi9lZq5oYF9+K1wAeii8L9+pNLI2VY5Mn7PK1A4poDoMNC/Xv6k3hqQQHnWyU8goTV8iDjixHMvwgJ6Hbwqakw8DVmLA6WumRMpmEw+Sr9xSm+VLG4Fn7Av8eprS8KlNWRXD43bgbfHv3t1vHAePQAh0jMnW/Y6Nz4OrfEq8dQ/QzS80dY1mRJtwS+PCGGb6e8uxe93aoLm1O7of00p/T/hPIBNPUFKaEu8I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(19092799006)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3ii7KELnlZnqEcRk1mjyltTOf9mjPnHfAsWJAKpnOdL7bGHAk/P9GS0u7dKW?=
 =?us-ascii?Q?v0T+9osPlks3Revgf2V01KMLPnCwP6q6t+9jiYfU1FCSTJBNfzrivar9oTs5?=
 =?us-ascii?Q?UO30xfD7Exs1Fic5035TRmbeRjwcL91EIB/AiqUL8Pmva1Ir143iqkyRry3U?=
 =?us-ascii?Q?KBleW2XBhTPCXLaSqW3hbtXAr0U4M04HhwHKRxV+2zyUvFVe1FE2FX4eJPU3?=
 =?us-ascii?Q?3K7XxFcvCIoZWw7Be9Z7z+QvmxFMIrLkfxUSWaSpPmEySVgCX1lMYFneResh?=
 =?us-ascii?Q?qvdTyQXgjLH+hNleAsrHHWEHtXNx0IFgC17i7BWhr2ivCZOBwbbmsZPPrc79?=
 =?us-ascii?Q?yr+FHwndms8/E/oMfMaboni4hT47xuiKU8HMsWXOyxtOFoHJewUNJtV5f09r?=
 =?us-ascii?Q?215SwiB0r45NEc7IsxQ96bMQV+lZtF0ycpKJ19znr43ZUhOxHQWfav6AgLBS?=
 =?us-ascii?Q?f1sbtBcUeofngCNVGMYlXIAw28unhgs8H94jO75OvYVvIE4vu4WiS5dkDAfc?=
 =?us-ascii?Q?dTZwtQ4feEwd4KCifx90AUpD/8EKm8HDenl7bK2Xh2CPhQHZpXj2GQXSYeRj?=
 =?us-ascii?Q?YR4LOy+amL1/pF1XkMVeF5/Hc86h0LY39Q1Cj5NeZoBSUfbwjRAELIzmPlsb?=
 =?us-ascii?Q?upIH9LHMfC6HV+7EQy4w1DQgM0TX7FsTutNM6uVuUw6oTEuXd1wlSt7QbXCY?=
 =?us-ascii?Q?dJC9cFWwetjE+080tqmXNbDBZEflrzoXTaFWUozeVk/QUfW3exqcWp6vilKm?=
 =?us-ascii?Q?Y0UUAdOIlYpaIXHWjj77pGdtUNV7wBM6Iuhk91jl6rdPxjOneJGg3qEaca6Z?=
 =?us-ascii?Q?bgFnqCYyS0wfvT0XpY3r+InYnv0qHluKTEESigeacasdLR+dnXTgEEHZisIL?=
 =?us-ascii?Q?+oI9/aFyZ0k8nv5skz7UUdXagFwrQvKNK+N5xKFDbSbm9cKq/fV5/COzWDAy?=
 =?us-ascii?Q?0rkfGp2sf09+8Aiwf7iIxRZx0qD787IrLRGRiSaQx0wYFibGLdo+bvzHjwfa?=
 =?us-ascii?Q?6LSg6AqVUsxK9BM43AKPp9i8aa07a8lnVe4xg5npSUeOHztsuqmJxfqpUs5V?=
 =?us-ascii?Q?kfkDxPwIB2VrsXBDTAFhnEo6ipzchMgWN79sbYHEnHmScdbmJoPJJcFsbiLp?=
 =?us-ascii?Q?anZrLUTKM1ZO4WKPgrNtd401kfDB1n/Fu1nryQeN9T4wfXhlx/lZCu1TE9ZQ?=
 =?us-ascii?Q?7hv3IE+yNSoCg3HU/yN/sliHkpWu/EIP/AYjBziqET2CW/GC86GkwvTCwLps?=
 =?us-ascii?Q?nqJ5VSuU6ZEeHo50AJTn5FI23M7x3eQztbsWns1euyMx9f0eyKyC1WFGmg9b?=
 =?us-ascii?Q?jtvO6vPaBYnolyV0SG51+HndRZ4WCZ2/0DPpIBBKz03t4xzWGuWc6t8/UqcK?=
 =?us-ascii?Q?/I4vvJkLRmaMEoMfmxHggLxmqzhGUMW/x8dbDYwy+eAHZjkr5EDf0+DE+xLM?=
 =?us-ascii?Q?B7HYqNGfq/yjgSM2Iw4/Xon2ucVMl5hJQha9TaNPQJO7vH9oPIcrupKLTBoU?=
 =?us-ascii?Q?PpmXkLfU83E/AP9hcrlD+/7NFzk2ll21e0JeImvR3ui+xuVtQweCgflwDPb5?=
 =?us-ascii?Q?bp8yuJN7g5+Qdm/ACmXJGUIEBX2fdwah6ZiAy4EVj9DxZ3Zm71O/Wdyxg6KX?=
 =?us-ascii?Q?shSufWU19VxFOsztQnr9lzD7gwEqYKV5OHOPTdJfy32emaF2FRedCZSCGWF7?=
 =?us-ascii?Q?jiPd52MhxJA1nD+b7oWqc+6kWLOuXZDip5hpN4e+HJd92u65AKo/UX8WtupA?=
 =?us-ascii?Q?S1Jo0pQemQg2PIIJoG7WOsHMwu1c077ZpqKd0p8NgoVx/0h9tf+5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79766caf-35ed-4280-11e1-08def9593cad
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 16:38:00.1565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8VIhN91NMIpV5IAP1jCc/ktGkbng4MFgXtU3Mw5rEU2ci/3shZP5tDHBIyUMS8bByiBNEbXNpa4Yyfyydco9SuC/wrz2VOD53BhzCbMq1vZ/W+lBHp5mhR5V5LgUnUxu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9458

On Thu, Aug 13, 2026 at 10:54:32AM +0000, Chaithanya Lagisetty wrote:
> [You don't often get email from nagachaithanya9911@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> axi_dma_resume() enables cfgr_clk and then core_clk. If enabling
> core_clk fails, the function returns the error without disabling
> cfgr_clk, which was already enabled, leaving the clock refcount
> unbalanced.
>
> Disable cfgr_clk on the core_clk enable failure path.
>
> Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
> Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
> ---
>  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> index bcefaff03b5c..9db8993e0bc6 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -1335,8 +1335,10 @@ static int axi_dma_resume(struct axi_dma_chip *chip)
>                 return ret;
>
>         ret = clk_prepare_enable(chip->core_clk);
> -       if (ret < 0)
> +       if (ret < 0) {
> +               clk_disable_unprepare(chip->cfgr_clk);
>                 return ret;
> +       }

convert driver by use clk bulk API.

Frank

>
>         axi_dma_enable(chip);
>         axi_dma_irq_enable(chip);
> --
> 2.43.0
>
