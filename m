Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795547547;
	b=JOcGE9besMdgtW3aGj3TWIUZ1owK1oy7CUVeL8drJqcPBK/dCgNGvDaqT5syLgYAuu0x
	 aS8qvr6gdqlIq24OC2vkEtk4GVEESzrQA5MQ9+jSUPuUGiW8SpMuVUD+C4+kmAeSL25hg
	 lIORNSU+OojdqRnWlIYPMVc9jqhDiVj4Udr/RuqrGggIiOJ3vHH/LkA521n4v2YYEg1Ki
	 spY6r0tJ6QfSEUwx2xy/xG+XzJtt13ju2KBCouU8uMcoEFnTVd1qK3tZDFzMBpYD1jv4W
	 9X1wEbdMSpajyItkGOmuwihBh5KUdLluMnw8zNwADkV2xTX4ShUMs28/EfbM9VfpvOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547547;
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
	bh=jh10sB/Rt7NE2HwpKuC9E8VL6nfPfz8HugsYl9cNc1o=;
	b=axeb8dPHif28LSOGHJI2VxuibbZ4HN8xUG1hRvDoUKgFIgHPWi6rJMoNsdrhGqtBllXK
	 Svj6PEb/fSTwhhHR2XD4XcNVmw8k1yRcnBOUaDUdokVWcaC3zGUI2RGeASghHZT9165yb
	 kH562Ek9AFPhYOMabB3TQFbTVJrtIqfGm3hVYS03rQwJWsNqUZn9dED8i1+QxLXR9HxuJ
	 EIzkhY4vaKNpAaod+FIlJOlD09abIBsBPCWMegQxyOkfQcGa4CyJTCts9DFwZb1XVyM3a
	 qaUaDkUC2QAjQ8CsIirmMD02e+YETf9eswhZJM/3LMMHoYOaYK411JICD9MUOunGoog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=nzMa+6Fo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.55
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010055.outbound.protection.outlook.com [52.101.69.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E7E606A31E;
	Tue, 24 Nov 2026 19:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9E7E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=nzMa+6Fo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8Lzb/6WezYweuCyCXAmd1pNon/cvPRjtPoIIuSLmFTgkkI8YXRO3/TlxRDDBiYgWEVen9Kwz69h7rQtZyIxwZutP1/Avsm3dkAq6GSEAdU2zAb9b0i+WQMle4dKvBeSJOmRix+9lbDQOD+iwGe0bezAzVx5I/8phZvZvEE1Vo9wZyCHiOq2/Gnz3dEbPj+MHseG21OrVEfCciW4Py0pqF1tAJLmN7PU8FcSpaNT8qnfmmPKw5GXyRXojIygwIFe4mvFFxaVzswyPBbPy8Y+LRu/BwKXqrK4Cp4QOZ7LFx9UQf4suRq3F9KJPqE35qccbvzD9QVmZLAcAT9mWH/3VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jh10sB/Rt7NE2HwpKuC9E8VL6nfPfz8HugsYl9cNc1o=;
 b=XDq4skOMN5hE+yFOrqTnC6Ee9URvNXpmdCP8qe52A5vIYnzShXIoyaNMdk7JmGLU8CjICuW1Dd8dS7QdOTGHZMmaRRHLkDM6pRZlYsOYz0KSuIRrSBAuXV81g+6mMwGNwjoL/cJSXvn95ataztkU7Z+sachLy933g1KOWs8mJVAY7s7+wsb2RAJuvPfFrGdHgWZ67e3+QdeHrM4iXY59Q2qMyJmfTPbYU8j5vv9/TcPL30V9IcLY1PikxYHz/a/w8b91EtKu21VylBQP6kmy2QI7dCVCtYLEfVn86y5R7yHSBujOw8lPAUzJgzpruKsSFmTUkuHPteyBnkTzWg3Ouw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jh10sB/Rt7NE2HwpKuC9E8VL6nfPfz8HugsYl9cNc1o=;
 b=nzMa+6Fo3+PpoF5by8W2+Sx72E7tteEXeISZVC4+uyf0saHENS43NpeTJP/jX6Q6uHUg4utnZuV9H7Ptfy56tR4gFHJ4mSKjZyvtp2jj/3JtSxU8HhbCsaiOPIKqFoQmItB8fabYSeJ0HzhWvQlYhRCtKChI5uS20902JB3QgiIfv2uZ4LcUt7QripeSuMKw3NfjKNv2TJj8uFVX2j1DHBEzkaSxy8u0fugYjIaxVrQb0Sv0YnqEwK3KDiCyogK7jBVayxfVAHo0P2z3cJQooBHo4tqbJf0YT2AkcF4MH0sTZdDni+WXU9LY1gGyXx/TESELujvbXogDAuC7bVzhXg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA1PR04MB11456.eurprd04.prod.outlook.com (2603:10a6:102:4f7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 19:12:24 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Tue, 24 Nov 2026
 19:12:23 +0000
Date: Tue, 24 Nov 2026 14:12:14 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/28] dmaengine: bcm2835: Fix coding style issues and
 a typo
Message-ID: <awXhjjB_9-N7RRBi@lizhi-Precision-Tower-5810>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-2-andrea.porta@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123145728.29082-2-andrea.porta@suse.com>
X-ClientProxiedBy: PH8PR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::27) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA1PR04MB11456:EE_
X-MS-Office365-Filtering-Correlation-Id: ae0d52ff-2fda-4af5-3c45-08df4a5edf01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|23010399003|366016|18002099003|22082099003|261009223027099003|261028144727099003|11063799006|56012099006|4143699003|261102123227099003|261021121427099003|261026140227099003|261021135927099003|261022105027099003|10067099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	aMmtfJoe7613zF+fL0BaULfTus+vAYAwzObF+zHLlDZS9wZmx/j+u6EFYjjeizs0hpwhawL2Mpp3ChoNOwBWemI8TeryeB9yN4VMdX77tjaCpBJyGiepDhuMcpXEsyhzpx6T5ZHGlGHRze2wsg3H1OlEDv/G9jJV2UJgUSxy2ntqjvlXNNmJgcPgTCFCxBTeErzc/yKhTW8Aeh2PJvIYXCbcD1NmZSARhdCFTwQhanjR//+KuyU1HgvNx4ZIsAcPR3oEfbFwp2zhuBn0qrA0FiVXugidFdF9gJ5KUWVRYt4rDe3+9tqvbMcMRZujfYrq/nq7J+B9g3FkBbI7qv4EFw0gfEVnvPt/1OKUqmTaDv1BEUATTBoHNpwoA7KMj4uspExF2CeTU1EgMBMyg1YswW7Xjp0xAimuEM6XeWLAER3xZxdtG625OKxV/V33ibmTHWt4F1QzCF9HWBtx8Z/1iZ4n05Gl1Ns6LmvzFr4MECk0cuFpNCNDET+SHrMF9oenIaQqk5ybwIurBbL7tud4GjbWXgJONYS4UpyKmZQ1ZLT7YrLA2gYc5FlLqQbm9qX7voFgwMtFUJqb3H7tKxpfOluppb7zBvzA+ttHxCIzcAS7AyvTK9FoPO0d473Kp9ZfOr3NpykwzpG2nd4GAIwsiN12MzLgWbeZaB3ERbnAD/4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(261028144727099003)(11063799006)(56012099006)(4143699003)(261102123227099003)(261021121427099003)(261026140227099003)(261021135927099003)(261022105027099003)(10067099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gNhETJEJLlYcJsAHIJfz9fsjdS8eSxCjRfmXMZjkBcSLc0UeLEHu1MMqJcA9?=
 =?us-ascii?Q?oMkRYW1sSVWHt7vK6OnSWFzbBGQY8FCTbT1uLlO0TSQM3XywW32PL4nOxOhI?=
 =?us-ascii?Q?Gpr5ZxvvH8mlBbWqnRSmY/U3wi2iFDD2VamqxJ0O9AsiRRDIikhFzM6PJ7cv?=
 =?us-ascii?Q?OhGrN25a776qrfeipkncEoivN3HXEYL6JrqFT7mkg+QI9bYVBllQE8R2ChlB?=
 =?us-ascii?Q?7CNjSV5ZNKaCO3vCyusXm20Lq6IXUkIlna60N3Zk5SXnsJUzbEvD1ixKFve5?=
 =?us-ascii?Q?emTgu3/nO2Jql0nXLtjD1kDIwlGyvIPdjlLRMy2zZxKip9AY35XIr8YTq/am?=
 =?us-ascii?Q?R6KnkFmtb0igi8beERcbafGZdzFOb7OrdERRXWN/1XeoFV2oXmtlO4uQtvNW?=
 =?us-ascii?Q?68AWHvG3wD/cGQB5vbs4xmMwyYQKGb2i4i9GIc6CBMXVR1NcM/8LLU9wwu2H?=
 =?us-ascii?Q?2mu6BJkcaowxAf+s8bdSQG8843RPT75EnkfFC26inpGtevtmcTN5/D9zLC5m?=
 =?us-ascii?Q?th7jZMPXP5aqrH77EDPUOVa14R4NnxsPj0rE1Oce/a8CbTK8EfVxoDu7DHK5?=
 =?us-ascii?Q?PScCr6ADjUzyGFhakZ1QLnCQziQhAtiOsIhBCDNCy1t+9UpcaIqapcDwQcFr?=
 =?us-ascii?Q?TeM/P8YW6ZpP2gmngck6iU1PZE7dthpcugjPglNM7zWIUPDnKXKc9iRBouil?=
 =?us-ascii?Q?V7/qmB7tjUo+AJQTUImNdxkORCfMcFSO10qWxu/D7NrEOy7o9ipv23G+mWFY?=
 =?us-ascii?Q?CsmTue8DmsdYkSG6inbqOk/3nSGcH6iStsjhcMah7IRbZ/6rOfeQZwHzbE4r?=
 =?us-ascii?Q?XNIrit4Ya6/Ea9J1Qck5/+KyurEsd9ltHz2NDAQEoqwCr+vmz6O0UYW/ZqmP?=
 =?us-ascii?Q?Z4mVfwt/wkwUnn3sStPbE+cDGOG32cseFUgpIhxSiaSjsZdHEyeXGg678QeM?=
 =?us-ascii?Q?zPQ4bXk38zvILeXw6epmG7UJdqOaa2Y62SQLbbx/UlxY2/Ujv7/LkzVgOd1b?=
 =?us-ascii?Q?0UNEgl89wHwCsQq/MR1i+ENgXxE+c0p2+7Br9yZJU3wLXz9S9OZyyWeZXHbf?=
 =?us-ascii?Q?IVlT2YUdvt7Uxfzo1T2l+PXUIfCLJU9pFmyBWMDvbRpmkv7rBJzcspwGdnhF?=
 =?us-ascii?Q?jWZCYsKHdX1uX6GxNP0hMgliBEUPle0xJozbmer+zOT2AYXM/TeodOeVvtza?=
 =?us-ascii?Q?2SECLQ1wE/6ml/f3YSHCsT/wztGn2nkpSkoZub4yh2y/7F6yzDxf/h7wtHQ5?=
 =?us-ascii?Q?obGGjSyu8RxE3P63yHFwUA1Rjtwz4p4QnjvJkboFhX36zi/QF3DuyfAnSB1g?=
 =?us-ascii?Q?MoLVb0bUcwQA1r0XPMI/MsR3EGdEGGpEmDkvS/oE+PEzrAssbPDX64e2egj5?=
 =?us-ascii?Q?GP0aTTO9cJE98M4nepeTqGNW55++YYLJqpmktZTsSIC8tRSNM1dxEZM/4RdX?=
 =?us-ascii?Q?20W8343po3q/tQ62wNtmjLue4nQniYtus8LusoeCKVozGjIp6aqkO52Iosm1?=
 =?us-ascii?Q?75PdPj2tEsyJTY6kmOlb0ZIgTx5TvQNOW7XFm9Qgbzen4xTz21fjDT4uf7I0?=
 =?us-ascii?Q?HoTchxcn0mnBGubQkSfah3AzLnOfRlgWrDHIBMVmAY/6IYkQBnKxhlcfiMTD?=
 =?us-ascii?Q?cPKjdYV4Fnk9jzXAAQ1twuUBhbHKqa0/ujUGXmUs4+v79ecuj6zTBEdvpg5b?=
 =?us-ascii?Q?DovaDq6pAwSsRBducyqOUOwT8ywuga91POp1A/JgANHkg2yXtJVJ5wTOBTzO?=
 =?us-ascii?Q?7M0ikBDVHRmj4COXGSK4DjJ4rEODAuwwNQyka/NlvJ9PU6bKLHIB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae0d52ff-2fda-4af5-3c45-08df4a5edf01
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 19:12:23.9356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6aKXSEYW3xJKXX/+5krNMS79etA/GKaA+kWeFzxtpkxXwjWLVtKtcldS+vhcZZsBWxCjH3Ex53UCv1n+MWS33CRl0Zs/2/058vsO41wiy/LTFIhZMkHvnhuE4Y8qaKji
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11456

On Mon, Nov 23, 2026 at 03:56:39PM +0100, Andrea della Porta wrote:
> Fix the coding style issues reported by checkpatch: use u32 instead of
> uint32_t, add the missing parentheses around macro arguments, which
> could lead to operator precedence issues, drop superfluous parentheses
> and long int, and align the function arguments. Also fix a typo in a
> comment ('missmatch').
>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  drivers/dma/bcm2835-dma.c | 83 ++++++++++++++++++++-------------------
>  1 file changed, 42 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index 06d830d36882..b19182c6e3df 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -51,13 +51,13 @@ struct bcm2835_dmadev {
>  };
>
>  struct bcm2835_dma_cb {
> -	uint32_t info;
> -	uint32_t src;
> -	uint32_t dst;
> -	uint32_t length;
> -	uint32_t stride;
> -	uint32_t next;
> -	uint32_t pad[2];
> +	u32 info;
> +	u32 src;
> +	u32 dst;
> +	u32 length;
> +	u32 stride;
> +	u32 next;
> +	u32 pad[2];
>  };
>
>  struct bcm2835_cb_entry {
> @@ -116,8 +116,8 @@ struct bcm2835_desc {
>  					       * AXI-write to ack
>  					       */
>  #define BCM2835_DMA_ERR		BIT(8)
> -#define BCM2835_DMA_PRIORITY(x) ((x & 15) << 16) /* AXI priority */
> -#define BCM2835_DMA_PANIC_PRIORITY(x) ((x & 15) << 20) /* panic priority */
> +#define BCM2835_DMA_PRIORITY(x) (((x) & 15) << 16) /* AXI priority */
> +#define BCM2835_DMA_PANIC_PRIORITY(x) (((x) & 15) << 20) /* panic priority */
>  /* current value of TI.BCM2835_DMA_WAIT_RESP */
>  #define BCM2835_DMA_WAIT_FOR_WRITES BIT(28)
>  #define BCM2835_DMA_DIS_DEBUG	BIT(29) /* disable debug pause signal */
> @@ -136,9 +136,9 @@ struct bcm2835_desc {
>  #define BCM2835_DMA_S_WIDTH	BIT(9) /* 128bit writes if set */
>  #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
>  #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
> -#define BCM2835_DMA_BURST_LENGTH(x) ((x & 15) << 12)
> -#define BCM2835_DMA_PER_MAP(x)	((x & 31) << 16) /* REQ source */
> -#define BCM2835_DMA_WAIT(x)	((x & 31) << 21) /* add DMA-wait cycles */
> +#define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
> +#define BCM2835_DMA_PER_MAP(x)	(((x) & 31) << 16) /* REQ source */
> +#define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */

You touch these code, can you shift to use FIELD_PREP() macro ?

Frank
