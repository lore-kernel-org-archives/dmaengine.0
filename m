Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794600777;
	b=Raqx7FAZ5ZEv7HTbNWpOOfx5A9KIfqN5jokZcp2fpXcHMjILpbIe1RQpb5CbqAC2Fji4
	 V9g1SsiutkMZxtvRi9jhb3x6Nqs23onsNEGtbhEJYrvf27h9hASS0pkrtokBD3Sq/9fU/
	 DnwU8mSRrPwPSEb5RY2v4xDtukq7kf8UWs4ydAPxlhB0IbV3/jioOZTrEFs2FYBVp2cch
	 yKDDMZKRosrfhAMhtW8m9l0o0LwKA2AGFuultwwPL5O4AIpGO41DgPPn7pUyMqDShLMTa
	 YoXpAogP6cKvfEOXarlZbakTWEfjDX39Dzqkr8i3+cejrUyx1oSlc2LOyRPMtRh4zwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600777;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Wy9/0MnmDtimUt7oWx+bQcIqKKlyrTf838TqAszUCYg=;
	b=1LPsXSSij76EFOIccnlVDilz9G57VckkYeEb3/DLn4o0e2cpICopDfXpsjOUJXQfdieQ
	 j1wKJZ/CkI2UMtohcJ4WqD2zmVlNEOrknpGqtcc9vTX5hUb7MRGXuOJaaS3mfMoZDmVf9
	 /B4FAF/FmqC7k7e55eGz8jxqLorIWLlIQD4b+bJ3Lnh99PIYawO13tMEDAsNZhc9o6mcL
	 oiq2KKSSZdGrP3PizhNdjka1uyx8KYJbY27YTvmPSTyfzc+XZbdXS7fJAXVrxD7f2i/u2
	 w1SeYLbLuMQWZbvJ1bpEDRwt0kgELNEYgBZNKTNYEGY2blYP1Rbfj82xWH1cUy7bOPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dzy1gJrg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.31
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010031.outbound.protection.outlook.com [52.101.69.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C326606A323;
	Fri, 13 Nov 2026 20:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C326606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dzy1gJrg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MwKAmT74kOF08Y/gk4FF02U1P8gFpSESTqLoQK/qRgLPR8nJi+SJQEgd50QgvXyRKqhXZX5/tlTO9WkrN/krrneP1/F+aLK887MncoARwChMG8rN0rD7WLD2GkXwIr7sIQuyoGIC7MUYRf53MXiCsF+sJ4OM4MBHKWgpwySu50xJkO4fKltVV8azbvOkIxBk9BfA02YXfJjuBzD+m4DL8DL/PUQQA81NMre4ZkxN+cweBS6OBGTrl++tiVYK+S08uWJPdx7jYfAtkRGPaVQUrHeyujX3CayKZkbv3Do2hknuiHjLsi7/AdK0R1NZosyBgkHfYv2GIF51bFFxP1ZJjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wy9/0MnmDtimUt7oWx+bQcIqKKlyrTf838TqAszUCYg=;
 b=zFWGOZs0YkgsS31T1Lr64hiZdFNYZoJievfeX2Allq9LP1sruexCPOi9CRUbGMJf7h1BOB4eUbZLtvuKGkCg6PGQfjdsSIf2rxljL+SLRekv7fj9ZL2FyBp+wL32DFIfu/hTX7MtPX4l6VlJZrPjgtGrSQuiSRcr0zjxSYoMCn2l7MhKle+WWK27ZUnKRsxdFsDdrpdFTZiOs96z1bHGud3PqOrE6G/KbsUw4f/4FUvhc2uUIptcvn/Mgoi6yvqPXrpdTYvVP+jwzLZUEU6FC4Oir9V9w/e/IoYuPDCBbSlaqX2RI9uQNuzL4VkWWOM1TYsEXch889aTWaM22o12mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wy9/0MnmDtimUt7oWx+bQcIqKKlyrTf838TqAszUCYg=;
 b=dzy1gJrgfbVRi3OeYVgxOHrafP4rF3dqDiShuaM9p5w/APmGH+tYtj6sZbXAB9HrvY2Qns4EgHH17T4FFGLiMPtv/ol9Np7izwSxE4Vwuy7jn3XtCQy0w0XS2Z8XSKnJpbwhBoN8PTDPeUGCHRCu1BIbphZToqOKWOVBZRuhq/lqr7jLM7cNAiG7qArtBuRf3MvT3adoZJyE62k0x4fzBllazwwvvYn7NIB+6lvLD5cjyRstjmpSvaXstsXZXbiXH++kxAU7xQsDgTJ26ltAPqZvpp79hNilLVnWZKXwjgtaJaqCq/aB/STl0ywaG5JT9Y9OCTOo0MoWcTBBDM5qPA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB6866.eurprd04.prod.outlook.com (2603:10a6:208:183::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Fri, 13 Nov
 2026 20:12:53 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 20:12:53 +0000
Date: Fri, 13 Nov 2026 15:12:44 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>,
	Maxime Ripard <mripard@kernel.org>,
	Jens Kuske <jenskuske@gmail.com>,
	Jean-Francois Moine <moinejf@free.fr>,
	Hongling Zeng <zenghongling@kylinos.cn>,
	Chengfeng Ye <cyeaa@connect.ust.hk>,
	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v3 4/9] dmaengine: sun6i: serialize physical channel
 ownership
Message-ID: <avdvPDEeQtFHZLWL@lizhi-Precision-Tower-5810>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
 <20261023-submit-sun6i-dma-lifetime-next-v1-v3-4-ef1acb0be768@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-4-ef1acb0be768@gmail.com>
X-ClientProxiedBy: DS7PR03CA0154.namprd03.prod.outlook.com
 (2603:10b6:5:3b2::9) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f3cae6-b0b0-480d-2770-08df41c28003
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|19092799006|18002099003|22082099003|4143699003|56012099006|261102123227099003|261028144727099003|261009223027099003|261021121427099003|261026121527099003|261022075727099003|261021123027099003|261022105027099003|261026140227099003|10067099003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	J51UpPzi6074PmTe1TpS57XDcyf8OdG/e4EgMmiKV6YJvM3uv21Eo7MqxO2vvpIV33mmOsQ61Sm/Tqd+yK5cqkDfp6Fm7BilZU3VIIGcjucphcDp0dAML8ZGXR88CQhXgRIrcutwKKzeU1pFynNcLS80qqcStYG+XuwQ5Q2FvbHEOTleMlsGgRdFNWIWK+glwzaloKa2u1r+V68sFwkZzhAtQrgpWuj5gz130lvv2O2HDOH3g5L7HmTsgJ496KZxFJy11sLW+1feE9eQdX+7PEMRSooWreAq6XHe59KkvGXAid7UEpMevxhwAvSCN3cl2bP6nEDF+RH4no9czpk38f/a125EXi3hf/8Q3DGothBmtXmhSADA8SsNpyWbitYrwfd8TjqxYoA1f7Me+G9jo99nMKopQkQhw5Yc9BjsdEHiVbgrU7ncv/zZUbaiD6VdPTcItx63BAaSLc0WjEdb+ETpE1ZW5AHY5FYqbdeYmFkmKv5l3StJ98CAozH6MXWopQGbxuKB2v1nxewLRywSbcH0hoyEdF6mEr07ibEBqVUY45MIQ1pkIbCgc4j3tX7ALM4/RkhEg4ipO1GTnMwnhLj19kGyztxGTngkgTkJNuGiy6QfSPaK3c0Lom/bL4Ze+5TDfFkt0DfhrYlwBrzVDDAWkhbkCZTd4Js6REegArU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(19092799006)(18002099003)(22082099003)(4143699003)(56012099006)(261102123227099003)(261028144727099003)(261009223027099003)(261021121427099003)(261026121527099003)(261022075727099003)(261021123027099003)(261022105027099003)(261026140227099003)(10067099003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fjFICgYuSGAyN5OpSyidYZ05NjArkFAZzSegs9b3B+j2MFBFZtvJIKFIN3mp?=
 =?us-ascii?Q?aoP6Ej6Am/Cm5Y5rQMoZl3ts24R5PRrMTGcDZYApJv+1wSBVUk+CtjL15THq?=
 =?us-ascii?Q?JUdNvDK7ugYBX0tbs0HdkgkqB5ppKJjirrNJRgUaCBvClwYazs1OQpaqJeZt?=
 =?us-ascii?Q?mxwyO5DG3kuNSgGugGgxPWnrQKn0+oW505w+3eDja+6pPeTqMloYbHj+qdxH?=
 =?us-ascii?Q?1jMiEN93u8QL6QBT9OJ2Ml69Z4gyzjBc1h3wMgbCO33jZUTlZZ4X0cqcr2CP?=
 =?us-ascii?Q?nNSChLSHQ1Hs8wGLYmw5Y/BBqXMT2Z/MZYryIFx7IWhUvc0rvI9XGopwuOVg?=
 =?us-ascii?Q?Joei4tJjzm+u0KqnFcXFHxiFDRbHx/Fs4ScLhvQ/iQ+CzMORYfmZNjbG1IwT?=
 =?us-ascii?Q?BAAmp6toPSYcooojNuYU6bfp3agt2Gq2U//Myf7aC0T50CPejPhvA3+ugo6R?=
 =?us-ascii?Q?2dXrv6RntNvDLRe5LXQ1qNNa6YEqamnyroqdQ/qpVbhd/YYtNVGJ2fANdFwQ?=
 =?us-ascii?Q?Gat9kea1l9X7P892Mz7/kDNNe9Jo3KWCLzF9c0oJFHJyfKL7Z9CfjNsTHLdB?=
 =?us-ascii?Q?PAWn5JLCtjCY2V2hoP5/lGFNPtM2pBaZsDvDyDveXdROwHdXU3nYZdahpI/g?=
 =?us-ascii?Q?es5TIdfMMd2lvK3RJ+AvxF1VHMwM4w6CPxzBWKw+uItNCW07ZQ/QBiOQ2bLi?=
 =?us-ascii?Q?4NFpbG7plYrIci4uxTL2zwUqClI+wo+ZPDreDV/ElwMvzpaA0WLAJOBQko7L?=
 =?us-ascii?Q?GuZKKjFlyPYGU14St+9N0ha1dTWgQ+QJml8fL3Fr1Y2ujI4J/cvXKVEkm+3L?=
 =?us-ascii?Q?k2PHhGdrlTm68aPtKi1Z0O0FdynyKvVcc3A0b+Tl9X31Lc9QpMUSEIOOYhiH?=
 =?us-ascii?Q?rMB44FK9JVlLdy8q4JwtllZcpMgnr449/lw3bcoALkcOSPgIs7diK3pSdYtd?=
 =?us-ascii?Q?7gkeZVPMLpePBA7MBDX5ir813b2gomD1fJrx2T4GID9xtVRWPCmbrXgQF/LH?=
 =?us-ascii?Q?s3KeZwnQ8eChj71Pv+rAJ+4oWIAfavPw7HA520yqxTM33mSbmkhTEw8BGgM1?=
 =?us-ascii?Q?PV1ANdxeNeZd8vf00Poit1iAJ61FB6Bcd6Lo7TJUuuxK1TVHg4Sh3nvRDx7f?=
 =?us-ascii?Q?42LrieUWpuvCmcZrSMZK4D5hZR64qpNfk0iUOD4gCWUgQ7723BWjD1/RYTw5?=
 =?us-ascii?Q?DQPWQ1yKXIW6cqIphDAWdGyOWVMOhWTgQih72tE6NyHsbR3jTHtrWGQxmVkv?=
 =?us-ascii?Q?65UAUoGpSGoAS1sMaMXH1mafiaeI1sZ/3SO59s6//bhzJIwmNFw3x413v2O4?=
 =?us-ascii?Q?VmD5zzmRP5zUGM+IpO/R3pt8JyMXlBUsq4zAfAvSx1IfpPI/2/8dZq2+Gyde?=
 =?us-ascii?Q?UcR9nH/e0PczSgVpAfdgZ9+8yZ9xU+qJ2QVL1FLP4jAtvNGQMPM8xNLsfsqw?=
 =?us-ascii?Q?+Kp7vrr6G9aRv77Sa09EDYl8yUOmi1bOI/7N2+nsuC0Cwal4MfOABEjRdHGF?=
 =?us-ascii?Q?opkcUznNZWlV1ac2XiRHTeBB78drycjQV2qeZuaq4IStnotS2RCkztDlB2ou?=
 =?us-ascii?Q?RfCg1j7JfyhAm/Yf5Vvr9P0p6H0Jykg002JNn/ttsCxNYHutIYgPHO0F4BaU?=
 =?us-ascii?Q?5ARgDU+STUHMoqS6YCd0NwKwAZuLex39xk9kik4z3RwaoqUkP4XlSTJ33rcx?=
 =?us-ascii?Q?7JR64u30r3/TD9vTH1B8JDZAeDVWAiZT+WFWFPFzSrSxO+Zs7V7isvqpoFY0?=
 =?us-ascii?Q?1n0ad8UaAJnTq0/yXJA/ofHmsGJW7MvacPQe9b/OTYrvLj1K9yFR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f3cae6-b0b0-480d-2770-08df41c28003
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 20:12:53.8026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++U/AruOMPqm0/Uw6OanABBwSYBJue9KBlCdE7q1r5iquBpHTmrYm8AuOEbu1+G8ROyZ3P/WxUUastVX5rPB97oUVRtWJIM08lM9t3Lh3t0RK39cpx+3Od4faGHUYwqs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6866

On Fri, Oct 23, 2026 at 05:38:23PM -0600, James Hilliard wrote:
> The allocator changes vchan->phy and pchan->vchan under sdev->lock, but
> termination reads the physical channel before taking either lock. The IRQ
> handler also takes an unprotected owner snapshot. Termination can miss a
> new assignment or detach an owner while an interrupt is about to complete
> its descriptor. A sampled IRQ can also be applied after reassignment.
>
> Protect physical-channel ownership with sdev->lock across allocation,
> interrupt handling, pause, termination and residue queries. Read and
> acknowledge IRQ status under that lock, and allocate and start each pending
> channel in the same critical section. This also serializes updates to the
> shared interrupt-enable registers.
>
> Nest vc.lock inside the device lock when accessing descriptor lists or
> updating cookies, including cyclic notifications. virt-dma takes vc.lock
> independently when preparing, submitting and completing descriptors, so
> the device lock does not replace it. Client callbacks run outside both
> locks in the virtual-channel tasklet.
>
> Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/sun6i-dma.c | 67 ++++++++++++++++++++++++-------------------------
>  1 file changed, 33 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 435d7daa1c0f..d3a63c866645 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -217,6 +217,10 @@ struct sun6i_dma_dev {
>  	struct clk		*clk;
>  	struct clk		*clk_mbus;
>  	int			irq;
> +	/*
> +	 * Physical channels, pending list and registers; nests outside vc.lock.
> +	 * virt-dma also takes vc.lock independently for its lists and cookies.
> +	 */
>  	spinlock_t		lock;
>  	struct reset_control	*rstc;
>  	struct tasklet_struct	task;
> @@ -524,11 +528,11 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
>  	struct sun6i_dma_dev *sdev = from_tasklet(sdev, t, task);
>  	struct sun6i_vchan *vchan;
>  	struct sun6i_pchan *pchan;
> -	unsigned int pchan_alloc = 0;
>  	unsigned int pchan_idx;
>
> +	spin_lock_irq(&sdev->lock);
>  	list_for_each_entry(vchan, &sdev->slave.channels, vc.chan.device_node) {
> -		spin_lock_irq(&vchan->vc.lock);
> +		spin_lock(&vchan->vc.lock);
>
>  		pchan = vchan->phy;
>
> @@ -545,10 +549,9 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
>  				pchan->vchan = NULL;
>  			}
>  		}
> -		spin_unlock_irq(&vchan->vc.lock);
> +		spin_unlock(&vchan->vc.lock);
>  	}
>
> -	spin_lock_irq(&sdev->lock);
>  	for (pchan_idx = 0; pchan_idx < sdev->num_pchans; pchan_idx++) {
>  		pchan = &sdev->pchans[pchan_idx];
>
> @@ -557,31 +560,20 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
>
>  		vchan = list_first_entry(&sdev->pending,
>  					 struct sun6i_vchan, node);
> +		spin_lock(&vchan->vc.lock);
>
>  		/* Remove from pending channels */
>  		list_del_init(&vchan->node);
> -		pchan_alloc |= BIT(pchan_idx);
>
>  		/* Mark this channel allocated */
>  		pchan->vchan = vchan;
>  		vchan->phy = pchan;
>  		dev_dbg(sdev->slave.dev, "pchan %u: alloc vchan %p\n",
>  			pchan->idx, &vchan->vc);
> +		sun6i_dma_start_desc(vchan);
> +		spin_unlock(&vchan->vc.lock);
>  	}
>  	spin_unlock_irq(&sdev->lock);
> -
> -	for (pchan_idx = 0; pchan_idx < sdev->num_pchans; pchan_idx++) {
> -		if (!(pchan_alloc & BIT(pchan_idx)))
> -			continue;
> -
> -		pchan = sdev->pchans + pchan_idx;
> -		vchan = pchan->vchan;
> -		if (vchan) {
> -			spin_lock_irq(&vchan->vc.lock);
> -			sun6i_dma_start_desc(vchan);
> -			spin_unlock_irq(&vchan->vc.lock);
> -		}
> -	}
>  }
>
>  static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
> @@ -590,9 +582,11 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
>  	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
>  	struct sun6i_vchan *vchan;
>  	struct sun6i_pchan *pchan;
> +	unsigned long flags;
>  	int i, j, ret = IRQ_NONE;
>  	u32 status;
>
> +	spin_lock_irqsave(&sdev->lock, flags);
>  	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
>  		status = sun6i_read_irq_stat(sdev, i);
>  		if (!status)
> @@ -608,14 +602,14 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
>  			pchan = sdev->pchans + i * channels_per_reg + j;
>  			vchan = pchan->vchan;
>  			if (vchan && (status & vchan->irq_type)) {
> +				spin_lock(&vchan->vc.lock);
>  				if (vchan->cyclic) {
>  					vchan_cyclic_callback(&pchan->desc->vd);
>  				} else {
> -					spin_lock(&vchan->vc.lock);
>  					vchan_cookie_complete(&pchan->desc->vd);
>  					pchan->done = pchan->desc;
> -					spin_unlock(&vchan->vc.lock);
>  				}
> +				spin_unlock(&vchan->vc.lock);
>  			}
>
>  			status = status >> DMA_IRQ_CHAN_WIDTH;
> @@ -625,6 +619,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
>  			tasklet_schedule(&sdev->task);
>  		ret = IRQ_HANDLED;
>  	}
> +	spin_unlock_irqrestore(&sdev->lock, flags);
>
>  	return ret;
>  }
> @@ -931,19 +926,20 @@ static int sun6i_dma_pause(struct dma_chan *chan)
>  {
>  	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
>  	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
> -	struct sun6i_pchan *pchan = vchan->phy;
> +	struct sun6i_pchan *pchan;
>  	unsigned long flags;
>
>  	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc);
>
> +	spin_lock_irqsave(&sdev->lock, flags);
> +	pchan = vchan->phy;
>  	if (pchan) {
>  		writel(DMA_CHAN_PAUSE_PAUSE,
>  		       pchan->base + DMA_CHAN_PAUSE);
>  	} else {
> -		spin_lock_irqsave(&sdev->lock, flags);
>  		list_del_init(&vchan->node);
> -		spin_unlock_irqrestore(&sdev->lock, flags);
>  	}
> +	spin_unlock_irqrestore(&sdev->lock, flags);
>
>  	return 0;
>  }
> @@ -978,15 +974,14 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
>  {
>  	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
>  	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
> -	struct sun6i_pchan *pchan = vchan->phy;
> +	struct sun6i_pchan *pchan;
>  	unsigned long flags;
>  	LIST_HEAD(head);
>
>  	spin_lock_irqsave(&sdev->lock, flags);
> +	spin_lock(&vchan->vc.lock);
> +	pchan = vchan->phy;
>  	list_del_init(&vchan->node);
> -	spin_unlock_irqrestore(&sdev->lock, flags);
> -
> -	spin_lock_irqsave(&vchan->vc.lock, flags);
>
>  	if (pchan && pchan->desc && pchan->desc != pchan->done) {
>  		struct virt_dma_desc *vd = &pchan->desc->vd;
> @@ -1007,7 +1002,8 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
>  		pchan->done = NULL;
>  	}
>
> -	spin_unlock_irqrestore(&vchan->vc.lock, flags);
> +	spin_unlock(&vchan->vc.lock);
> +	spin_unlock_irqrestore(&sdev->lock, flags);
>
>  	vchan_dma_desc_free_list(&vchan->vc, &head);
>
> @@ -1018,8 +1014,9 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
>  					   dma_cookie_t cookie,
>  					   struct dma_tx_state *state)
>  {
> +	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
>  	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
> -	struct sun6i_pchan *pchan = vchan->phy;
> +	struct sun6i_pchan *pchan;
>  	struct sun6i_dma_lli *lli;
>  	struct virt_dma_desc *vd;
>  	struct sun6i_desc *txd;
> @@ -1027,11 +1024,12 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
>  	unsigned long flags;
>  	size_t bytes = 0;
>
> +	spin_lock_irqsave(&sdev->lock, flags);
> +	spin_lock(&vchan->vc.lock);
>  	ret = dma_cookie_status(chan, cookie, state);
>  	if (ret == DMA_COMPLETE || !state)
> -		return ret;
> -
> -	spin_lock_irqsave(&vchan->vc.lock, flags);
> +		goto out;
> +	pchan = vchan->phy;
>
>  	vd = vchan_find_desc(&vchan->vc, cookie);
>  	txd = to_sun6i_desc(&vd->tx);
> @@ -1045,9 +1043,10 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
>  		bytes = sun6i_get_chan_size(pchan);
>  	}
>
> -	spin_unlock_irqrestore(&vchan->vc.lock, flags);
> -
>  	dma_set_residue(state, bytes);
> +out:
> +	spin_unlock(&vchan->vc.lock);
> +	spin_unlock_irqrestore(&sdev->lock, flags);
>
>  	return ret;
>  }
>
> --
> 2.53.0
>
