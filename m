Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013057.outbound.protection.outlook.com [52.101.72.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877923451CE
	for <dmaengine@vger.kernel.org>; Fri,  9 Oct 2026 19:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791572747; cv=fail; b=ixMOe2VScmvxR70w6ffCDiCehxgx3w/zU91cpjp53ETv4fN1YrHO+rC0SCdct2hmvSpiyatELZzAoANknjRa7KyExA7nFc2yB9eWPo7ALBpzflO75PzMxxXE7/a6mUdMMF5LonTdG82/k/T0kQ+dPTX8KYpMfrGxtRL/IQgVo8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791572747; c=relaxed/simple;
	bh=4I6SoZrgWkr5GK2ARkAw+XPo1fyuVTn04H0o6tYfsb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cxSBGoAaziZQRrrmaYlawips4hi0H2tzuA4ktm+o9mYqM52Bxgyon42MNlsbRxWFPI3q7crrCwBa1j07G/ddec4KeHcav2dVDaE/lFw6Tc1oueLlcD1gh/XmiYC2RdOQ+sC0ipxNsLfGI/ExpOG4PvBvs4NGNqae7XpgnjYEy14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NzPgqZ9g; arc=fail smtp.client-ip=52.101.72.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NzPgqZ9g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upD+HPk2RWNnx5gblDjp/x1epNp13HAmS9FJ0LyEKHUvYeN8jtaAFNpLkp1G3UYqat6TcEaSC1nsh1GI0Vf9dRV6N3lJ4Ad3Uh2/8tI3Wbdw8qoaAU5SiU6hF2N3b6yubzMeD1b5BV7+oO5KLKBV2ZJ9kuqUCiGry31GjVjYmxoUWszoHw3XfPCmJ/Lgzoybi5ukEFEEAPUBt611KPAw792gpqZNLyReIYlG5hM8htVqk0WwhIb3N8Et0XuKLYT9K28uI+Wsr/NF+/ES5OcGFZ0On0xAXyCMtJsVE5EIdaacmE7NC5lE2LE99+840SbFqnKrZ80qoTO9dpJc1LDchw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMKrFAc/px0ugz/iF/uM3WyIt1zb1XADSxIT+zFjTH4=;
 b=b5eKoZDf0McFULr4kfO0PHCsiGQWJcnpTqBsGduOE7zbsnw/i8qFacojHxipuuvR4kVbeT8InY75gIxbEmnQbw73YPGqedixQTLCAb76+cOSNFHKn1SFjjQ2AY7JV08EeMUeYErufVAY640gt0w+cUUsk8WlFMGbCXVoewavCntA/MY/mZlR2KneTgH3QpRgwFUVxCb1YzKDsS8709e74m9elHvSdVrwQYEBF5TlPfFMRc4oYJDiafnnGC79/PoxBf9i3YPjyRjiowBZlQOssXwnYOnSnauWAe+fKbsCXVT7RjtE6DUiWYUYkY7Dufj7xkCHmJr/4ccgcRFNZlPhuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMKrFAc/px0ugz/iF/uM3WyIt1zb1XADSxIT+zFjTH4=;
 b=NzPgqZ9giRpxy+hUrk2mFCXxFd13TFAy23IgtV3Zr7NP6exShgy5iZT/ZDL/sHeErbtN/Ji5Cu9MaBby7LLEC6+1iME73tS3X1WKkd605ElOyvrRIn0D3+qzigE1Eb431yjRbZQDgciEeIQw+9H+9QXuTVhWYy1BWxps9BQwSaww+/U/P1u7KgiNaiGD++OBrgFVoNt9LpcE6gkfmfBULZWXbOKqwvJJMCo7cmL8EAoV+2m6GoWKtN1wZK7tFX5+4Hc0pC8vz0GFyxVuPduqeumSJlDMQ00TZRPJEw/CKKriJyA6ukPmTohmt+PMg3NttMD40HbYR8VmzaeC679/Ow==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB11907.eurprd04.prod.outlook.com (2603:10a6:10:617::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 19:05:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 19:05:42 +0000
Date: Fri, 9 Oct 2026 14:05:38 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org, Frank Li <Frank.Li@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Koichiro Den <den@valinux.co.jp>
Subject: Re: [PATCH] docs: dmaengine: clarify ordering rules around cookie
 completion
Message-ID: <ask7AujGmE7Ks6Xb@SMW015318>
References: <20261009093745.539924-1-vkoul@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009093745.539924-1-vkoul@kernel.org>
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB11907:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aadbb28-5e8d-4472-6dfb-08df2638509f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|23010399003|6133799003|18002099003|22082099003|10067099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	vVBCJaMiZ34GeI3DLN4YUotg4rhSb4QfnFpbu/+WgHTnpoPrlPNyuWh3NIBc/NfgQRpss1SsogOGDTJvxCKXni3NPBi3rTXhud11JM3sFe0zspZGtDB9zSHb+tG6yJL2DP4S7/HhUoD6lOowHoODaNXwJHZX950S9MWck0mZSMafUbWkKRxBBT/EowaI2RZyflcSCa+0jveXTzrBU1oczI5Asi/viyqEe2bTRNrUkPTTXWUAsttB30XD/GvY+V/2Izxldg1McpJuUg8ToCTZ6b8+aXmrrc+9/rGJVtl049mrAi4HsBvXnQz7foaHjJUg1FkkCO2hWQ3QiknQmGLrvMAbOGBfm5Mi4JdwXmSfXOutiW9PRCSD8+YKz71pZK5BtQtZH7zYKJ6qiEgk8k4SSPSrOuQ1Enooa1XmwSVn3eMsCJcO9nWwLYoprHBcc3G7syHqYPhkKJaPoy6cz2avehPCKBGljOqFrFAYR/GToClErG5//sAQOH9+abAyTwQl0O8ZqAxep7kdEbeqCNCAKpCrXEZ0v822vJIF2EyFEMLi9g6xGHnD3MH/92dgrVGqk3hhFcHcFdq1mQl9LsYCkSpx7NmTe+d/BcjUnNDha1sb5yWDBh2Fy0YUfubZWxzI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fxw+gw8HaI2oA8FVTqGVQbiJ/EyKx2BG8zj/2AE8uD/rvZq03IFcGm1BCp3x?=
 =?us-ascii?Q?jCcj2e6gnHE2YYC9OT7IE7VvDB3nrTWwG6a1/3ny2pnoKGLmYZpb9GS/TbQ5?=
 =?us-ascii?Q?7DVBGe8gGvjEEacWINcYRnjcZQl7az/ISDdcbCd4mvqhu5pk5tmQWQDPxTG2?=
 =?us-ascii?Q?vuCUGtwfOIZXirSFaJUSrREpkG2U02oyXaCYMo4QRgj5Elb2XmYWxaIuYBpu?=
 =?us-ascii?Q?oWHKaaPOyKP79CI2jc17SyjCe+XMY3Ge708R0MtlZAXEe71gbNiMVxjMJsJt?=
 =?us-ascii?Q?oltDbw47mH398hdgJKncv2cnn/q9jWxxBOyTOmMRWwF89xypVSigIyaE588A?=
 =?us-ascii?Q?DZasff9EV4UbTQ4XzSM3nLfM9GEMkieYf7+zmuWoyLGqjRalAEU0jMUs6l+3?=
 =?us-ascii?Q?fOt5+NZHT6QFrCD2YhspuytGyhUhusP5FYAh/PYFJLL0mU1NdWLU8VN9L5/h?=
 =?us-ascii?Q?kBs80TQ/JtS6ZJMpnXGv0gLKdkyBb+t9f9fGGW09ElTgGdit+36Nxh0frW//?=
 =?us-ascii?Q?73Xnc+2IpvFQZ1/SSLL7ELckmpC4almB5NBsBaYmBE/fQUZUrlBXzBhBEOXe?=
 =?us-ascii?Q?Wja+OQ92GlIus+qIri3jBnEGbi6vPFZJc0fpwiQc06eN5MbkBSgaMNh0+/KJ?=
 =?us-ascii?Q?0rbEdd4bd1MnOxv/e4vrzAnvy66lw4bhfBe940Lamvc+xzV7MASz2HpOKdof?=
 =?us-ascii?Q?opsus7YAKM8TNnUGOowRWpoP58LLEqLfsVBFcmrZQjPpahn+qe01vZ5z9+da?=
 =?us-ascii?Q?HADOVsmo+6pDafqPo7Z3iOc7E3zp6Rqlxv3XCyoyGOaYIbiSObRICq5jlIqM?=
 =?us-ascii?Q?8XHoR8D8XcX8lNKvvN6aX9il+4c1wFjTJuwfibg3OPMwi+qSUKjcN0REVSGd?=
 =?us-ascii?Q?9wkF8bWlzMKyStZzy68k7ec7v0JsyRonI1vK03X4uVKekF+aqU88CbPYNZFJ?=
 =?us-ascii?Q?8eTacv75jcqj3XpDRXiW0fgPcORUoWACxmOqso+vENbIOrZqPZyWuekFuAq9?=
 =?us-ascii?Q?Wm8+62Dwua2mNsyljS09x/Duf9jFxrgiCBkUmWOl16Gr1skkiZlXLAtY+GQy?=
 =?us-ascii?Q?uWrYUFpH3o5U5QKHc/Q+a1zkF3QSr89zgoyed/HkLGrWE5yyvpV+Euau+na5?=
 =?us-ascii?Q?3eNzwOzGXXx5y9phiedrEm78zhMNA/eSmSvWO5gBW18JQi7aSoyX2UfE2rcu?=
 =?us-ascii?Q?tAa/XQhQ71oBuhCDmeTfJd/0zp1TO1T5sPaHvWMGdrz8EGn+09ZwOTU/QTnm?=
 =?us-ascii?Q?+tSs8hA184rM/PSHnrMBWEfiOFVScAJgYvyX7mK+FdA7cuXQJqefjSHSmWUG?=
 =?us-ascii?Q?rxRh5DjLiiHrh8v8S4M9vQe/CK/Dk6wVs6lqdT3WGXINuhkr3u9jk0yHEMU8?=
 =?us-ascii?Q?HBmgMXcibLjRYyToN3fFhNWQXjHYyB2LskafA5RkPacQy7rDGHhukirdqfXu?=
 =?us-ascii?Q?VoVx96LRyt7rlu+GMloULYDnywTQCXtO3reF3VGs+Grmj7lTVR6MtvERvAYO?=
 =?us-ascii?Q?hukd7heCljheecYTqLr1Ti9R01M0zwWNmGneY3JOJq4XHyzN+B1kGKWmWLxa?=
 =?us-ascii?Q?dNDXhasEdKjfIe5RwaWACzS9RUCdI7sNVEZSLIxO+mP1Lsez50eOh/5u6xGh?=
 =?us-ascii?Q?9luk9jtXdf83DZEDmWjHVFVf9Tr/ZuYyRD6ei4QA9+uVTCkJVwWiQDIl6nWw?=
 =?us-ascii?Q?KzhfUwZDnNLON9qwVfThlDeoeYAtMYeyW9eDu12d2egfLNhPSaIVMx64lsBw?=
 =?us-ascii?Q?yKbZu9nOv3PMYVgJFqXSNKbg6ovPYneTvAZ4Drb/d8PaYs3GCHbC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aadbb28-5e8d-4472-6dfb-08df2638509f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 19:05:42.4823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPM9G80z9nLxP0p65VId2UnbAu01QgGfD6i8KRHlk1sW8q/aVGZTZBfFZadMIm5D9si3kOfuIuPGvrg2SKdaj+NSz6L+gSB1z3wrdLIhbcPz83Ni6mZntIaGMeahJfoN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11907

On Fri, Oct 09, 2026 at 11:37:44AM +0200, Vinod Koul wrote:
> Sashiko pointed in [1] about the cookie completion order. It is good to
> Document that for ensuring that dma buffer is flushed and no stale data
> is seeing by consumer, we need to make sure such action is taken before
> drivers invoke dma cookie completion.
>
> [1]: https://lore.kernel.org/r/20260917072507.5BDB61F000FF@smtp.kernel.org
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/driver-api/dmaengine/provider.rst | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentation/driver-api/dmaengine/provider.rst
> index 2897ade67b39..1bcbce705659 100644
> --- a/Documentation/driver-api/dmaengine/provider.rst
> +++ b/Documentation/driver-api/dmaengine/provider.rst
> @@ -557,6 +557,11 @@ dma_cookie_t
>  - Not really relevant any more since the introduction of ``virt-dma``
>    that abstracts it away.
>
> +- dmaengine drivers need to ensure buffers are flushed before invoking
> +  vchan_cookie_complete() or dma_cookie_complete(). This would imply a call
> +  to unmapping buffers or any such architcure calls to ensure caller seeing

Sashiko report a typo architcure

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> +  buffers are flushed is done before invoking these calls.
> +
>  dma_vec
>
>  - A small structure that contains a DMA address and length.
> --
> 2.53.0
>
