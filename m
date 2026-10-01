Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011051.outbound.protection.outlook.com [40.107.130.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD1F2F7EF3;
	Thu,  1 Oct 2026 21:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790890374; cv=fail; b=pluYh7dpXmKiCczKeP/FzBdotzNGzBmSkzPicY7MfCXb95EXtIAVePOj/B80eyEs3+zlMEzguUjjpTSSF7UKMjZFufYd8780ImXNYR3Z8CsZP4jqr83c6Y/Y03zPOcDQpPPMQZXqr5Z5Q1cPVRupvP+wJ8Ej5FPb4YsicKk7ThM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790890374; c=relaxed/simple;
	bh=/Lk9yYlRGIoNtaqt558eWlNLl+HqwfVUiqyyUzYG1dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bKDtJ8ZzzuC5oBhB2aU2sB9PqNSvwMAzVtT2fMTlGb6/11sdnw80SbDuJWK2T2bzH4mVX7Z/FbHVyT6IAC0pZ+KFu0nO5jxScyVAvxYgIZI++8mLsqaFQhV+f9KTDcZ2l3l++C1pqHbbQLZhBGJR3JjZsH6lgJnzYzzXalaQM/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=P5fWITa9; arc=fail smtp.client-ip=40.107.130.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="P5fWITa9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/stRuz1cSxmXgEj0Lly2t1PxXiyDSpTovwRym1n3Qgj/3yhM0RPLwwkG0bj4Pc24lT24VWtd8gPONfT41uo9mxAGZIY+hkDGjk6FxYrc3CC8GemF0iWkekhiEQr+RK0ztSwZZ5oFW7QriSsdZGPBk6TH5IXLK3SAN2VyOrXVg5k6Rc+myJPZ83MibMBTGIWONA+zN2N38iGNKAcWUz2ENztmE6eB69bd/G/XpvP+CP2AAQOdvCsWhGXRDexQF1wKu5C/JevpfLaxpXil22DXPNBGIOUJE6cFKgD2pVTjcslB6+CxMkmLq2x0u3RaCXipfCXdD+qMoN72PlGn6XSJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqYi2Ywqacz1lPo3sN+mb15pjuzpUwBVBaqe2UDQyKE=;
 b=L18ORRZmpxCghS00QW8PPamcc+2e8wZYFgMtuIB0z3Ld/NULt0OM5Viz5QbLnGGpQEV9oNWjJUORI+bSHlj/qjEaOdIM+SfTTRFncl3v3PhCsIxPfoFyCffbdSsd1RAiIN/ht50vn2RXv0kke3TlA6UGFrzvbiT5Q2xkKnXPStVwOoF69JlMErlCo3BXMhE26UZbjh2rWvIO6RyhL0j1QlXjbf295qatXC/SW2w95T89bbdusZm5lPQuEo8GpBjG3MesXaPFcE8YI/Gm0kJhXyNsbPEurtGCd6Wd8XuJBndVJDzhR+SunaBIMAZvjJdFM13jl/g6Li0HXkWceqq6iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqYi2Ywqacz1lPo3sN+mb15pjuzpUwBVBaqe2UDQyKE=;
 b=P5fWITa9iFDLxVpLeZ/BlGtcU7Tutt065Ut/AHBvIHySIi71igUpbd/YRGxOeCi1hW8E3fG8J51hoK6VQVYFkoAsLfj6jrjpuN/TOeX5j+WfvussdBUWIbIYlB4fYXlCCc1ueXeFMNlm9A4gEdwpapfb4eWgeaYqKYU8NeUeZliDRSKLP3NwI0O76ZJIuCaGPbtRqfOxKHpw9ViKTKCJMaiWNyNEaRXFvIRUujiT6QVTmCHTbf5vojSs14l2WnTD0NhuM25xUyvNamRQ8eUuI3vke03NVDnRAdHHuRwUI9/Hvki6Ilr4MwgDRM4XnimT8i7LfJKXabu/OvftdxYZug==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BESPR04MB126829.eurprd04.prod.outlook.com (2603:10a6:b10:111::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 21:32:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 21:32:50 +0000
Date: Thu, 1 Oct 2026 17:32:42 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Bogdan Mahomet <bogdan.mahomet.dev@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Frank Li <Frank.Li@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, dmaengine@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: dmaengine: document ownership of the descriptor
 flags field
Message-ID: <ar7Rer6oHGzn9Zf7@lizhi-Precision-Tower-5810>
References: <20260822001536.29269-1-bogdan.mahomet.dev@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822001536.29269-1-bogdan.mahomet.dev@gmail.com>
X-ClientProxiedBy: CYXPR03CA0070.namprd03.prod.outlook.com
 (2603:10b6:930:d1::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BESPR04MB126829:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f241b0-bcce-4b74-f27a-08df20038af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|19092799006|1800799024|10067099003|56012099006|3023799007|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xZGzVHWzKRSGAWpZW7ATbJyRAgS1RbbHin54aFFccidjbK72XeCoTF3fMYQE/sh9jDHE8HzeursddbqK+Xi5DKCqOtOKlRD+cMoUMed8BzYGnqMuz4VUseWtC2hfMYzwLDm0H2cOXuvIsWBUCEU4TEgVD4oDjfMUH53yoIlN1RP4Pd6BaiBvDm57yntu/yRbOF4zXDrUqZZzsLRktj3bA9TXkphozl5BsaFAFV0l3aTrgsRSs8mlG8qKaAT6kYSQervb70030Zq+aZra00xDEf7huBoqqYqANJMEojy4lyd4NkgKSuVFc6SHev7/CEHZ85NsQf+jPPd63YfcttrVAX/B/vBDqSLfbFtbwBxMw2DxCELCWJLgxzIo+gMqJ9zeIAvk2KTLOMd4PWLdp09Xxin2in5H6GjkSAYrltzFoWmbGqHPhYauRaQcdWeaHE4y6cabkIXPdrm5AJR3qkuMgC4TFtAy6KQz0LhKp1FE62mKj9fyjAcNFohhgESvuUB1CS54Ag1zejia9DyANQ2cOY8MgeNt9v6mn9FeTNbHnWHlHA1BL23qLaSivsUnmaa6Fd1wlX35Qz3D1bHcdM2B8Z1dBzb+xvgE7CZrxWMprnNYgppKcH15sL4hMe0B7vffXHylZoAheL/I9PB5X53RvSvQiFKxeJF9LUfuMX47ldw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(19092799006)(1800799024)(10067099003)(56012099006)(3023799007)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8tBHK42KiaBoRwiZcGHH9DzPJtHJMUddi580l6a2DR0Q23oEN0YNuvZDQ5f2?=
 =?us-ascii?Q?sVidtPI5aPOTRPgjyLvWqGPntsKPg5KDlb1UGy6mkcKa8JQdUxHQ8ow06NxC?=
 =?us-ascii?Q?9ucHV+crHjwfFG7P5VcfyRM+5AfrKh5JdX/PWMe8D9GBMxsc8zNUUEq5yyOe?=
 =?us-ascii?Q?e6D8nPWkHi82EipehceGy4Nbo/S7qrh5RIYeRNkr9FFXUDlSMF6ZWElZ2OVn?=
 =?us-ascii?Q?RxqhKGNMe4YCxXnc+zhHQ+uhfHeDGqRF7pHNzcuTF1l6uw024zQnjIsA5dDC?=
 =?us-ascii?Q?91PwWolmP3kMfJ6NuT1xgEsKHJO86+N3sFPbu9ezaWt/kNsni/SAkSKWbQm0?=
 =?us-ascii?Q?2zfnkXUSKrS0fSWOHYauTtqwdW4/mlYiDO3RqPFe9o9Uhf9nl2ufzaMyImY4?=
 =?us-ascii?Q?2wta/y7MQ0EMUHJLse/yrCPzI+xE9nTRODtGofPAYvpNZoS3OFAZL6m2sBer?=
 =?us-ascii?Q?7tzMHZeFvTwZgq2hYFsqVfvsakCzwOyBt0DJ5nO2PVntwWPWBLRORdy21ZqB?=
 =?us-ascii?Q?oWofJxjO8lej2IwxpO+Y3Yb1+GYsk+XvKGvs26AvZFtzPNOfE1RAZg/4MSj6?=
 =?us-ascii?Q?4lg1leb4RuABWkrNAC7peGiD+8GCqF6GlRltB97Z0tMre6Ub9TM3TfLYmps0?=
 =?us-ascii?Q?6xwFiNSjT1c/2mcp5tTWR0IkKipgEULB9IUT6TQ+D3sEbMgGJYLOVLs8thFN?=
 =?us-ascii?Q?lo05BxbD9jCoQ/gxfjwQhI0/Nn+jn7yI4HzUErRhlhmFufVAmQdB/+jhH142?=
 =?us-ascii?Q?UqhfBYSDjxWxTePL+xH23J7qGuHhBFSQU5GRIGKnAovkdn2XkAOoAtkoh5sD?=
 =?us-ascii?Q?Li0yJ8q5btkz79VN65Z/Mf6XKFVKfSy2uBVFn4aBv6QgI524GnitGHig9c9p?=
 =?us-ascii?Q?XCnPn7SfV6f5+xoy45LUd0VraX4Z+ezqjboyN8FckGBW70jc/jvLagOuPgtb?=
 =?us-ascii?Q?/cFJ8AcVC73Ca/EjMsfK4u72VmZJjaZu/HkZaV1tUFSQAJ6+FbKzSEnvjCGU?=
 =?us-ascii?Q?iKnF5gYtp0lBtWvPIZZz6LQRBp2j8grGXj/p+JxvwH4yb3UM/rIBKFEWka2+?=
 =?us-ascii?Q?7rMNlxlTCpU4iYg5K73uIptTgYg51SrmoTXDte0J03JYldH2Z+cNir6QBDKv?=
 =?us-ascii?Q?X9XwUGFfKZAxSMo/RR1y0qAPJ3irARSEz9p7/XwsI4yfoZQZe0v9RIbeo2TI?=
 =?us-ascii?Q?ol3Us7UiCyGSY4ct5LTQ2ZMR/Qe+ZKur0hFINw9vxM8iE+gogL7tX5lmG/tR?=
 =?us-ascii?Q?FLpJ6FQA7cXaeM4iTxVG3cuMQ9dYNFUHy19hq9SzY+tI9n41XrnVSz7X5q2H?=
 =?us-ascii?Q?LPo+iTCViZvzr1omgjBqjJYB8sKfYhOm+JBNWOxggIlfMEByiMttU/8IWNuZ?=
 =?us-ascii?Q?hsC1o7+PU8aAat066g+5yroWYf8lHaMG88KFKLg+mUZ9A2jB3jIXtSCPSICQ?=
 =?us-ascii?Q?8u6wnKQMo8PC4/xKX2LKGvoqa1d4egr89REbIO2gT/NSZwFsixa4UYtgXJw8?=
 =?us-ascii?Q?WStzNSKckch59zlqs72HU19y0ezB+u+nKepCHm9bceQYNmI1S9gCmo1C1e0C?=
 =?us-ascii?Q?omKHuMQluypDbM/RHKTKG2vo116G4G8R90gszvQyYGMIRz9myRhOFhAaZYMR?=
 =?us-ascii?Q?LRHoYMPl46Pjbtm3nWbAlPv8mJHKp7FFSrNhhd2mruNBUqoMjwu8P9jljdJp?=
 =?us-ascii?Q?xJp4cfIJq9dwSFSIAZ3DG7DfeS3ZPpnUaFWz7RCk4AHoJvVMJSVvrkdBnbhB?=
 =?us-ascii?Q?7p6K7mzYqEpa7emPE9+rZiaywypZo1cNeUvqNdkMlmKv7E802PbY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f241b0-bcce-4b74-f27a-08df20038af2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 21:32:50.1398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6f9Pt+NVZJ+2hybgH53JEUsH5AhI8rkFUvDjeces0zIy7tlKR6c7JR2Qi723CjYAwNj65sU0PNcsQASMjiYpo9bG1rM+WhHu/dz9GzFCTkA+vwZfMhA1oQsMQuxCIXl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB126829

On Sat, Aug 22, 2026 at 03:15:30AM +0300, Bogdan Mahomet wrote:
> The flags field of struct dma_async_tx_descriptor has carried a TODO
> since the provider documentation was added in 2014, asking whether a
> driver may modify the field itself or whether it must always hold the
> flags passed in the arguments.
>
> The field belongs to the client. dma_async_tx_descriptor_init() does
> not touch it, so the provider has to set it, and providers store the
> flags they were given verbatim; vchan_tx_prep() does this for every
> driver built on top of virt-dma. Afterwards providers only read the
> field: the DMA_PREP_* bits are consumed while the descriptor is being
> prepared, and DMA_CTRL_ACK and DMA_CTRL_REUSE are tested with
> async_tx_test_ack() and dmaengine_desc_test_reuse() before a
> descriptor is recycled or freed.
>
> Once a descriptor has been prepared, nothing in the tree changes the
> field except the client helpers in include/linux/dmaengine.h:
> async_tx_ack(), async_tx_clear_ack(), dmaengine_desc_set_reuse() and
> dmaengine_desc_clear_reuse().
>
> Document that rule in place of the TODO.
>
> Signed-off-by: Bogdan Mahomet <bogdan.mahomet.dev@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  Documentation/driver-api/dmaengine/provider.rst | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentation/driver-api/dmaengine/provider.rst
> index f4ed98f701c9..c10d8ab8fdbd 100644
> --- a/Documentation/driver-api/dmaengine/provider.rst
> +++ b/Documentation/driver-api/dmaengine/provider.rst
> @@ -413,9 +413,11 @@ supported.
>
>    - You'll also need to set following fields in this structure:
>
> -    - flags:
> -      TODO: Can it be modified by the driver itself, or
> -      should it be always the flags passed in the arguments
> +    - flags: this field belongs to the client. The driver stores the
> +      flags passed in the arguments and must not modify them. It reads
> +      the DMA_PREP_* bits while preparing the descriptor, and must only
> +      test DMA_CTRL_ACK and DMA_CTRL_REUSE, which the client may change
> +      after the descriptor has been prepared.
>
>      - tx_submit: A pointer to a function you have to implement,
>        that is supposed to push the current transaction descriptor to a
> --
> 2.55.0
>
