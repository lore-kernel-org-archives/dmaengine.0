Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011053.outbound.protection.outlook.com [40.107.130.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458DE3A7590;
	Thu, 17 Sep 2026 03:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789615068; cv=fail; b=Jkcv+fweD3U2SIUiQsZMSVtheloRwJaUZDQM9Gp2sit1pN8Mkqjs/1gEw9hLei8OtrggtrwRbu4T0hXQzUQbL5RJBmbd+SFO7l3Hdf/NqEiLsH+O2zfQaVD99vTrCXq7PRpGNcb2vM68z8eDkN4+b2k7qnUI49TJsejQiTbCaZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789615068; c=relaxed/simple;
	bh=sZBO1on4Uqkt2N23Gu0/6otXQQvXOPq8VNYCWs+p9nM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=B7WcoV3JBpgCcJCBRxzwmaPDpx+zb8YZR/shwewE1VSyJ6bhzj4t+flofD/nAzGtCfw3tiJVKgCXGlBhR/M6clp0XB/JTT1wcJ1pvdzW1XOo++LaDWnkaKy7wRfVt6Ab5G+88Y6WLp3mKr6aEeL4ml+LjcqMtrYalpc7zEVNjfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=noVSyU07; arc=fail smtp.client-ip=40.107.130.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="noVSyU07"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLADT1/Bx6IaqiH3VOZwwqRB/5rRub5Ou8WZnbNTvQsL2d/597aXzO4lS1cTQ/KLFSBYuo76Vn/6w/5SN/1JPaO1GpzQncBRebbXQBg627Mlzi4OxV2t5LbuPbDZrVFjaEX9lgAdgds/XgrG2xHxXs+/H7339MdW3UiAqj3mZ1X23z7zjuPPsHMhgLX0CBE1kMrU4CEEldJQLF52XHyo9x9WXolWb8mQFc3hH3hYt9nkbqYcTnI3YZEMC6Yb1dLjC2w9zMjvqwlLH+7gFIO+8UWeqRD9Emx6ENQ5fDScUEWckh3I8UEm0fS+1qzpSk+Ec1eVX3+n6EOndatJQOv6ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VV52AUVb2CjiP9kSBddnQmV4qU/gnjoeASiDhOzlDQ=;
 b=zCwaXoJ4U51I0KFRRrhKZvj4qp08Va01UTA6I18QjpU8TAk2RKBgrtRbSajOkDU56NXnHjX8d2KWqjY5rQWG1EJmq4gh0dHL8SGeaiF6eDzuUOOZCq9+l/JJvz3FAVVeTS8mwxQZcOL10789w5m++peoxBvSy6G6C4Ex7dRfgx9HfKcsDNyx0rus5VxWzWW+3DtTbbtIcNdcyfty7k/DKRXMKuHlB160vWXs2LS8n/HFA+CxiqiqKRC48WDc2o+pE12OtjxGUhFTDLE0uNemG8RKYUYvo4dien0YNnQaqvOdAogcTwkE3Iv5jYSd5b/7h8mNe9RLlegAtShmglcFYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VV52AUVb2CjiP9kSBddnQmV4qU/gnjoeASiDhOzlDQ=;
 b=noVSyU07g0GuRABwMT9vt7WsMFAfRAYOd4SGGgVc0hkfGsYtp/964uvJo/3eP2tdNl7U5S83T/1/vWfdz0lvCALJtcSMTba3n8a2iyqfWSS3BKhF51wZWY4kPBZSQY9O/n41EKOB91z/IMxXcTuRXx2I+S85xvSmZt2KOZezWmgMMVeAn/Jja3QabAZ5BgKGz6XePhKeiyo6T12PIn6XgusKBYWp5Uf799M0MnlzALJPNokaOZwYz5y0C3ETmyLjss303PProBhZ6/lCTfUqF6czlZB/nh64kXelg7q9JBb05KhvOcRv2aIlAZPwcT3lzhT1Es/9oyTpbd37rChjnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8577.eurprd04.prod.outlook.com (2603:10a6:20b:424::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 03:17:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Thu, 17 Sep 2026
 03:17:42 +0000
Date: Wed, 16 Sep 2026 22:17:31 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: ste_dma40: allow COMPILE_TEST
Message-ID: <aqtbyyHvS2y6xzoq@SMW015318>
References: <20260916225241.280606-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916225241.280606-1-rosenp@gmail.com>
X-ClientProxiedBy: PH8PR22CA0024.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b3cf829-05dd-420c-a15d-08df146a3c6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|376014|6133799003|56012099006|11063799006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	RCWQaZ3nojZoiYpyaA3+7UhAjGUJ6/9u1tPRW7X6n/nzeyRUN3ApxWgwBp+PjI8qNY766GcxxkWCal6jC4XFr1RvKgEtqsW69YfdnlNXPQijLvrIWUgjV0fOsRUkHDQ7W8ALhSR99oi0FIWl33A9ledq9xXLShzP620ioUWNhoXNCKVkuy3CUvRBs3h6kX/v2oZT+a7PRRVe6ifvNM23h+4VK6PEwu1P38WxAHFkX7Kac49FZ3m2Ze5403Atw73SKguFuDAY8XGRCF4OL8VCqSVip2YwbVmbzWksEHGdKPUVAhTShBYoH9d5sikTKsCgMfxh9Bzcj/qDfR8Hfb0Qwse8fNyUmPeXfylkgLICVnwUBBTBGg9sYp6AYg79inKmxvcWUSeHHF8VfgFJzUYZUKLA1z6ybynHBqFNbIeBO5OcFnFwCzA9SWmpDh0Qm2Sk9arQarSy66YlIyh1x6NWEIo9HMTHmmHd5wi1+XZc5GLK85bv2wCEc4R57wTmyUsRKgYhYglfN12HVGj6hsnH4njC8aGbYhZ0dYtlMOODiJoVIPsC+VusPRfslzuvQDtEYB8VO2UlIZ8C65qj16aczDq0/3by6qM0u+QCtpJaqW1xt1qim5U677krudifdJz3GT76xX4GQsbTCba0da4PlYc/2V/K4iPb6F/LfDcCFJU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(376014)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t3sYelItplZzohQESEVqoIa6CWplFSpE5i9hnizcCWNR/9gVqd6VH50U+WR+?=
 =?us-ascii?Q?7BLnY3Z9uXa2l1aTB37wpAFAkP3cdtg0K0QL+s72EPC71JnhwcAd4QE8AP0O?=
 =?us-ascii?Q?hnfP+ay4iKJLIlSxb2Dx+Y5L86ZW2OOcEgPeG/Omkl6Tc0+3kY79+wjMokGc?=
 =?us-ascii?Q?vz6yk+si+24J2c2dDhxS7Sxyr5G0SQOu+Dkxn9N3HqV8RUK5yeWHsVIb2VRI?=
 =?us-ascii?Q?qTsNWIp8PjjUX5vtqeNNn6ihVGerCSQ09eMlYz8F5y+9lenT2mZdK2ls4rob?=
 =?us-ascii?Q?tArtGYyLvX+psM+EfPwkjdoUejKio5d35YuGf81L1RPIrRYTVQLCqounCWC7?=
 =?us-ascii?Q?v840b2o8yIdqjoaO63x8ix6NxcJ7mxJympcDxGv7w6eLlmr5uqXiCQ38P4Jm?=
 =?us-ascii?Q?6mY5HMHoTaWFuejtlJ+IMbifstKsdPEOjHS/pG5BgiaOs1eFUHvnthfheOlN?=
 =?us-ascii?Q?MLizHkyWwEP2fRoDWOinLxrBA+UAIcYnV1GhwU9s1d2grb8IwJ2tb3fphk5F?=
 =?us-ascii?Q?WNrdnESsxMlBtcrs5FM5QoSuKVD4QdIP/tgyaVqda1wms05GQvsTl2371EgP?=
 =?us-ascii?Q?Mrg8G2wRv5puy+nDY049pPpkaIL3aBhcpLyzSOFPycoYI+uSKP+tVWRtcAxk?=
 =?us-ascii?Q?cHFBL/xFmva8fpMfXPAJ09givppfCzZlN2nelQwzb4Xw53fyXGI6kB0I6n9Q?=
 =?us-ascii?Q?v4NP9k4aSC1ZgOpMV3EDBni8zyewaojp7jVylNICi752m5YXTV+EOOidm8pk?=
 =?us-ascii?Q?/fQs4BYrSgVHrcGNIo3qpO9n0IPOZ1hqeeG6iE4vdbgLiRD46MYeAkJxCpfw?=
 =?us-ascii?Q?1dscBGeT5bmkwV2FBxbxcfBZ3r5rl9mpUeVPEO11ccMU8pX/EgNVY/fvUnXo?=
 =?us-ascii?Q?HzxA/TuNZ3YhqCse7le9z/XFcKBTowecVSVJ22cGLtBy2ZT65BoWAF4dVeki?=
 =?us-ascii?Q?XLMqtzHe0h2LjTuRD7663sWvohEV4gk+Gkd75BZDnMc/bKZWRYjNCwSV2ykn?=
 =?us-ascii?Q?mk+OgnIAYDt1OJYVcWbxdqmwJFe2TsoghtJvaF7zeM08YTyFbLzZRll9MYol?=
 =?us-ascii?Q?QQXWsaZAv6NF6sjbUkcOllv+sS0Gi0wks66mc9hBGqsdgW4Q3F74fmwzHB5k?=
 =?us-ascii?Q?UHu9zpcXrpQe+7zu+acwqaS3YNNFEt3Q4pzplfydG3XPm/AQUl5TCXzBPKlo?=
 =?us-ascii?Q?fznXs53Hc7XjEAYpc0zmxWWPIp75VU7LtxymQe99WHmufp9BXjO1KTpabo1H?=
 =?us-ascii?Q?XtGNXsoxIuZuy7jHTTLD37hXMhNGZnHSiM/iFG8S5lm9DVwOts1SwidjMajc?=
 =?us-ascii?Q?Rfy8L4W7sbWSowk8NF2wUSRnK4TuzJrGilh0u29N81Pee40AoqvpkQ3FWLlb?=
 =?us-ascii?Q?2rVAbXduAd/HHSXP/YX3VoipxGljNSzRItGmvfNe3guylpvW8WF05b/Mb3IW?=
 =?us-ascii?Q?HE+GvUdg3kRas0Q7eyO5vlsTByBsZSEl8ShVMpSzzBv6cVcSCiuKGbEO3P90?=
 =?us-ascii?Q?04DPQ/LlXzjsNLbsWnnfEjR/zBuGmHyki3+wyrc4ZPElYylcuR/W4bxHlmCM?=
 =?us-ascii?Q?0HDmzPt3ngAnVEOmmfrICgN5cNoXjtBpd/4o5l48vRJpFVV6Nm0XkQN/3j5g?=
 =?us-ascii?Q?EzvHcKX1Cf+ybL3tOjabH+faNUbFV7Q/qpf/woeewi55nqFE6gd2kRolBZ0+?=
 =?us-ascii?Q?xHMyM/hsSHKdJPh53KhQN6HilISWHlFRu1eILa2T7M982m/i+joZKlRnP8mp?=
 =?us-ascii?Q?ew1dQ0PnL0yqsNwXJhWwG5jJMb1GreqpZX/cpLY9hHm2TqQkdMX+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3cf829-05dd-420c-a15d-08df146a3c6c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 03:17:42.4150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FzGdkVrb0GB865rZH7y04G06/4gcdzCalSUtEi1Y2tjCyeSKR9335zkMPow2VhDIGCdjf/JWc7C5CnLz3TJAy5a5aKa+aWVGIMtQCXhcRi90F4uQK5j7DcxvTu0iK+bk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8577

On Wed, Sep 16, 2026 at 03:52:41PM -0700, Rosen Penev wrote:
> The driver only uses portable kernel APIs and AMBA bit-field macros from
> <linux/amba/bus.h>. Allow building on other architectures via
> COMPILE_TEST for wider compile coverage.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index ae6a682c9f76..f16bd4059d84 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -559,7 +559,7 @@ config SOPHGO_CV1800B_DMAMUX
>
>  config STE_DMA40
>  	bool "ST-Ericsson DMA40 support"
> -	depends on ARCH_U8500
> +	depends on ARCH_U8500 || COMPILE_TEST
>  	select DMA_ENGINE
>  	select SRAM
>  	help
> --
> 2.55.0
>
