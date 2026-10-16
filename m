Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013017.outbound.protection.outlook.com [52.101.72.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB93B4CCDE9;
	Fri, 16 Oct 2026 15:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164619; cv=fail; b=lBjEy6FCzdZ/vTPod/OjOfnyXjzuvsDces0QAFaGrRh+COVCBdoSXafmWowi5mybKPBhg66AzwAGoiYtMfzRzDYygGVT3Nr9jthBNIjMle689eINmUKI1j1ew0d8cuEjBA/EFJIko5YR8FPEFUntRMCrF+US8dlXJZb0i1SulZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164619; c=relaxed/simple;
	bh=ujasRA8DbEZtcucKMnd4Ap5vi9pPN7BBD/8QiqgJGVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oDP69UWzwiMngRW6bwyC9MLEPUSUDoGpFjV9Vfxlv3PyNkG+lHFOGvvfWqHuffuQ/Ij4mRwz/mABAyIuPxpUcj71KJokiKk4IDs2hpoIdmhD/URWz0jOOXPrV1JcUSGXIP+K5eW10N3jmjCWQrX5DhJLX8/RraTIUhSSD0yplmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Tgpd+G34; arc=fail smtp.client-ip=52.101.72.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Tgpd+G34"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0F3s76ZvhajfpbgjL4Fb1jsK31WTqGb0vghAERtbU2uJ4fsOveeYPw7jXjLqiOu2E44js4GcPyUJivwSvGhUBlTNf6Bj+rR6XifJ8nT3tTbXIbQQK9sntvXw6Io2yUG4eUDDGZeTeBBmUD6ktRox9/CrMHyqyYuR50+ChZ5MFFktpPeazsrIhbo4GcO4PZbJpuplg6fd7SNvuztGZxexo5ihWzcWEBlEWgPZDEkEL915X6GEp0gq2F5hPhwM/fq0hFOnYKd08TUnGTIry7PUizY1WcNyzl8Hv30OowXQEa+6k8s/FODX0LD8XJM5F+ugRGBz35PU/tJmt2x8yuGAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQ7uTMeijXCxDdY/1yllz9RDgrjIqiu5NYCZiY6kAhA=;
 b=Acz5LOVkqRFMuUY+dSA0Rz7KiuJj0zfl5WSIRtyhWQFZ8tAAXYR+foZKh1zjsafUvFemOEtWGTOuwt5z1HT0NMB3O56d4EEYv7oQWyGxKTELfjzkyVAIy1bezfTTF1H1bjHp9Jk48ny/ty+jAPepENmHb1hKeeZ9y5u8F3GeECQsd1y/IomOPc6+XNoNe5AakJV/nA7LnMNj8o5TzjskhR6qpDH2K+S1xBFaqmD5Fk9UCTUfMxWtA/Zp/vizuLVKGvvlnLM/7KPci4NtXpgZ91MjpRNCf5UMu5Pf4yfa4Imz1B3rt/fvXNG8mZUV3cpGJqdUYNTBB/U9hA1Koj7emQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQ7uTMeijXCxDdY/1yllz9RDgrjIqiu5NYCZiY6kAhA=;
 b=Tgpd+G34DeOlhSyoQVb3TW/Ni7gpzKtrHB5LIHx+fPksG84akBs4Kx/uO2ImwxzTGCnAnbTQzFRen6C+p93rdCirlqhRZqMTe+vVrJq1RSMQoY2B0yv07AZgo63S0cs9jFrUfM9oOXhvRbT3cd5QmQ8u2YHm8/mfs9FhihExWZ08To3r+JbeOYsrO/GecnCSxgqPlydGkyONnGwj6748zWsehObLKbblvwPbOsaHzFVf4Pfk9IOhQ1Ai1AjX39KBWQLq6Bo1Xr3mbJW/dTuzXR3ySp5W5UMA8Eyusep1HjRXOEreHOaEyc96Yg3zX2ihs9tpJrYNozDwBIFfFgl5iQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB7061.eurprd04.prod.outlook.com (2603:10a6:20b:114::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Fri, 16 Oct
 2026 15:30:11 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 15:30:10 +0000
Date: Fri, 16 Oct 2026 11:30:02 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Subject: Re: [PATCH v1 1/1] dmaengine: acpi: Free resource list at
 appropriate time
Message-ID: <atJC-sD9Kk2N3e8l@lizhi-Precision-Tower-5810>
References: <20260617091421.2649071-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617091421.2649071-1-andriy.shevchenko@linux.intel.com>
X-ClientProxiedBy: PH7P222CA0028.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB7061:EE_
X-MS-Office365-Filtering-Correlation-Id: ddb23c17-b8f7-4a9e-c368-08df2b9a5d46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|56012099006|261009223027099003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AMV7rfBe8WM6n02i/Ul8xL84hUTUzAiB5qr7rHzbdl46H7mlytbxDncP2qI9STs68oe7rbg21tvUqSa2d5d8dxLcF/hsDGQFk4Qr/JST85iRdwbDdjOdlNBnnijmgEk2huxG+ZA17BT4+KuM17fLAY31KhJNmx45tCXt3rk1uvAgfWeBXTRoNuMfnnDm2mfNQ9GzSdQggzaCFyOUQUTEDhVB5wMMLI3YS+rMXoD9JHjT/o2cAz+5prlmmnv2nmfQlW86Eqyuoza2qb92le9mCxUrwEL2PQFm6TiEV68DnScNZgXxN3jV6gOVFnRa6TGW2XYxwgMlgjzrtbCxbbJnlGQ2sOeckMKR3N1fI0PkOZtt8AoMgxIGCeeo7+kQ3H+gQXy6ckagVgnnqyG+YwN56kS5hUbCNIcHcck/O0S2Lta+kdH/DGcHVz79tO9UTCkyS5MRiWY3IBAIzQBwr5/wbgZWPDMWV2Vqcz48H5PblAwExV3ZRjFREwoTEA2KE2x/C/NYCyFCxnSwJtZ1y0Bc/4FsiZyTFlTvQ2LwheIue9Nj2xBnq2avKR1li3v/3uvr2I1TyYGxIpMVGxUD0WpLT745BaCkajH00EAnXfz9uHlQLu4x/a0aEQOCMH6rXya+tHZrF4AkyV3FYvvtNOrdgZ46B3ONRYNENl3Zn1Q7hPg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(56012099006)(261009223027099003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M7oDImNTrvL6AaLCRII8G5F7TghHRTOOdEQy10wyNRYtpoBMO9iKDD+baSYB?=
 =?us-ascii?Q?vxdBzZIE36MmLl6Q96jSs9gHJsdJ8Tal6UNYJQ+AxnyOhPdVCzjv0ilgTXaS?=
 =?us-ascii?Q?znD81UvrEAoheJOYaDauHEOpnLl/xIOxjUHAObXOjNCYq5rk4h6VOYKwz3Mw?=
 =?us-ascii?Q?XAjH0IlHg05BCScfvyDJYGLoPFhUryXkTPjUX3Ss6DJrybzRGRBZe1KTBg95?=
 =?us-ascii?Q?U+pD04bi5OC0ywd6mHYq4DVYoi2M8FNk04pN+PJ964oR7KZXgY09oKdFTrIb?=
 =?us-ascii?Q?m6fcrZIz9YwU4gf2abDdn2FQknCjZwrpX7Y4rQV069VeC9g5Rsr+h92BgBUM?=
 =?us-ascii?Q?fPHJ9mzC9zW+ztXoloI7t8teDLobes9pfOORVuclns9ZhXUiXK/HBksPaYAg?=
 =?us-ascii?Q?nZS9H+GhfG+BfwvBaGsmgaGosWvUArxsfJOha+N3lmTbxkmsvZpCEWrIeWbf?=
 =?us-ascii?Q?dYnP1W50n79ZjAwxcTaBYlPRsWa+sDrFZThpW5r2qRDGuBJaYY+1CPUnCS0Q?=
 =?us-ascii?Q?m5Z6TAsfNt+iYLfqC5p13oFhhascPeOA4Q2agzuS4bcrpvGn0cggacir/CGX?=
 =?us-ascii?Q?GWzG4QMsQFAdn9bhPpyAMffdXxG0iZIXPNbwGZT07TF5lCAxnACl79SA696o?=
 =?us-ascii?Q?Eg4EpCOmSYyuh3O7byfhtPrF0hdvYsBQ0SJ794qFRlYR10EgtIhrMZJbYL5D?=
 =?us-ascii?Q?hKoa2gOySQDKH+JHguHY3iHgUlBre7ogL2ZXgbzLSqdrn0rRKPqXOq+LrQHs?=
 =?us-ascii?Q?6KPcJWXeKdrJ54jyMRlMJ457ZgtsA2d8yJjPllUKjnRSicuZsY3H19lVUGXg?=
 =?us-ascii?Q?YkLwvc8ultMDQRM3ZFuFPNGpvm6Iaqjblugtkf3EJ1T0jGim0i3gJcc4Gbz7?=
 =?us-ascii?Q?3txZGu0G5YIFdBtwfDxOrcOqWTg/vvk7dSPNmx6nvN5ET/THCcjJo9qFgFgG?=
 =?us-ascii?Q?N6iOcgXq2ikTZVuCcMaoCc6k8hVxk1JA3xYUIkLGji1TOAcWTUSqsrGH9h7Y?=
 =?us-ascii?Q?/Q/U4as3aKfVjn//KoKWcutIZQNXcimSyIj4o7N/vUdXHbQ18Lp8wxKTVxC3?=
 =?us-ascii?Q?oIClv+F2Z6LdXY+4Yc2Ddk/9dk3ESexa1SBX2DgNDVDFCr1KKZti7Qjzbiqs?=
 =?us-ascii?Q?OdXz+vZIEQG0YMdJcCyPyEYflcv/iBBh3IX0DkDGZjaIaeh37OEewOJay4if?=
 =?us-ascii?Q?VsdqZWbcsbDlZ9h+9OxQsGYM7XlWLHRUBVTbzWbUJ1CngN4Eosw6SR04Pjt5?=
 =?us-ascii?Q?a7ZmuIijXoLxBxzt0ihM1nJrbt42pZp+n0TWR7VfF1xHszuzDiJpKNmKUBkI?=
 =?us-ascii?Q?qE8Ec5Qz+DAltS+AMcmUNBzMWMr/Y3vGG/+pII8YZPfD1cfPKBzWgr/V6Iw5?=
 =?us-ascii?Q?/Et6adpE+jn0SNcfEf8jveDJMktYHFWwkdTCbkiyYX/cCZS28bNZC1382wUJ?=
 =?us-ascii?Q?yvyFu8Xrf50YqeF9Am9MB+q3oMfU06dBYw7x5H9wcf/QcU7t0qzgBuYAxXm7?=
 =?us-ascii?Q?UWgaHRX/RKmpeY7g800EtsfKkpFSGWBHoeCOltEUWcBgBrvrqxkIDVHl7JXH?=
 =?us-ascii?Q?VzWQTrItia/FcAo1bSmJI2qloxoX18c/10Sm/Stjg5LPFRN9zDmRuJQsQhEp?=
 =?us-ascii?Q?QTwQ0ebeFMRrVHWnt3n3vz0zFZBauGs962NlEpB9M90TjJlgIILJNPfmt3Qt?=
 =?us-ascii?Q?hXqEWwMQM283AQaDNYWTrRS9+WXXASMWpJSyssUKSwKlGKFLpA/uuczsStua?=
 =?us-ascii?Q?qP3JS1venR9Jq6h0zIMS0XhtQ/tZH1xjyKY9ISulIOPXd5NYh8AF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddb23c17-b8f7-4a9e-c368-08df2b9a5d46
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 15:30:10.1446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K6/fFXEDu0pi/nskiqdcLsf9GoAVx4UXjl4A7vux8QPf5TlcbqSCYrGcaf1g81Y2CHQkINsCJZDFv2apD1FPfKD7UFxaU7tt4hJTH9j0yDDDNTL35PK67Ewy5TrTeSlq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7061

On Wed, Jun 17, 2026 at 11:14:21AM +0200, Andy Shevchenko wrote:
> In one case we don't free resources when formally should, and
> in the other we do unneeded "double free" (emptying an empty
> list).
>
> Both are not critical issues at all, they just make code robust
> against any possible future changes in the flow.

Can you rephrase commit message

In acpi_dma_parse_resource_group(), change the return condition from
"ret <= 0" to "ret < 0" so that when acpi_dev_get_resources() returns 0
(no resources), acpi_dev_free_resource_list() is still called to free
the empty list instead of returning early.

In acpi_dma_request_slave_chan_by_index(), move acpi_dev_free_resource_list()
to after the error check so that on the error return path the resource
list is properly freed.

Frank
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/dma/acpi-dma.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/acpi-dma.c b/drivers/dma/acpi-dma.c
> index be73021ecbd6..b053a7f96f85 100644
> --- a/drivers/dma/acpi-dma.c
> +++ b/drivers/dma/acpi-dma.c
> @@ -55,7 +55,7 @@ static int acpi_dma_parse_resource_group(const struct acpi_csrt_group *grp,
>
>  	INIT_LIST_HEAD(&resource_list);
>  	ret = acpi_dev_get_resources(adev, &resource_list, NULL, NULL);
> -	if (ret <= 0)
> +	if (ret < 0)
>  		return 0;
>
>  	list_for_each_entry(rentry, &resource_list, node) {
> @@ -370,10 +370,11 @@ struct dma_chan *acpi_dma_request_slave_chan_by_index(struct device *dev,
>  	INIT_LIST_HEAD(&resource_list);
>  	ret = acpi_dev_get_resources(adev, &resource_list,
>  				     acpi_dma_parse_fixed_dma, &pdata);
> -	acpi_dev_free_resource_list(&resource_list);
>  	if (ret < 0)
>  		return ERR_PTR(ret);
>
> +	acpi_dev_free_resource_list(&resource_list);
> +
>  	if (dma_spec->slave_id < 0 || dma_spec->chan_id < 0)
>  		return ERR_PTR(-ENODEV);
>
> --
> 2.50.1
>
