Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011058.outbound.protection.outlook.com [40.107.130.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CFD535FC9
	for <dmaengine@vger.kernel.org>; Thu, 15 Oct 2026 19:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092645; cv=fail; b=s3UTalHNowRgU3UtUCOnaRtLbMb/V82/B3yDqcO0lEppbL4mTYN0KZAqdi6FYOFuf59gKmsJcQAgSEPgt4k2l/woYY5FD87ERfjtUM6Bq4LWq2M0lsE/SqjplVgQ6E9tEEV2daviCGalLqARPHY3KIUY54vwB3xoiM/vUyYtSMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092645; c=relaxed/simple;
	bh=NwsAVMzKBV5YbJf9rVVNtuNJ5NlEJ/Y3L6ThrRqv2no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ik6RqmkDrVVhoGaZ4/d5dc2g2ghBfWFkijC7eXngcacJH/4Lu2I2Z/sJOQUOffk/WOcZ5xmOPtNmFO19XWR2uJlXPGtsRy1Z/oCP9BUVUjwLVpV9tzgnCaOHksdm+U+Qlwm0QpeabLC7CqVR8tJRYXGNfJ/03exyuR5X8ACL9U8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Mw0nng6f reason="signature verification failed"; arc=fail smtp.client-ip=40.107.130.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Mw0nng6f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2eB4owz7gBR0P9SAvaICqD/aJSWH45V89u7Pe+oV7P0U4BOIerhY/rxlU0n3lwoRHp5fiYkK8sKYsTbjMlIeJimldTo/FcEapdPjmFYedTfSkoSQqS39E6awhsYoY7oaXcT02mH3MUKBGsVTxDMkWK3dUaQHbvS4yiJiKHnX+SXWf6e/IJfJhB/e3yAoyjEJNbCHKbhjIPcxZjhaiuq5ZasIcV5TDQzCZz7Q625MyookYWQ2/tlL5slzSRgYdFMYltGf19zTWb+hB0hR+XM7qLD29/yxPDjas0Q34+NElFvxYZFl/u+5VogQz9LnVvdycMLlO18yR/Dz3Bs/tJFdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCMzPoqm8a6vPnJubGKOOUUINFIWXJPWw93VDUGIgMA=;
 b=kux7ZRkYYV3J6oCU2ckHXeYdsX/eS9KthIzxsq7YvDRxTHLUldJriZRLJPfUt8nAZfR9imyHAISq9iITCpV7rsIlRQKW4/lP50KIrf98pH3ufbHr/JiwjpUhSe3ZKT4vpuCXLMeibf2Z0Bqo/dO9QxHM8/gds7VmSn7TowMupKwiYIb3EnDjsAZv9AXpcDDaevbFo15zajiru2urapupMUp2NVCbV7iAqrbDYrKS1b5RF23Kv+T+hr0hxjCgHGIL6oZaK4Aud+lVu//mWvpkvt3GtL5LpSz70oxaEbJVaLHaHOgEmvOPpQsUxu5Qyq1LfHZu/ttrSuz5d16/RLL6ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCMzPoqm8a6vPnJubGKOOUUINFIWXJPWw93VDUGIgMA=;
 b=Mw0nng6fHTGKVJNYJ1JVeueX1FS1jxzUpHB9p4mG0GYwqv1U86BzPKYSUFGOGVO9i48Fn2aUOeDsO/qtfcvLdJbnDfR0sKYv+VZVywuXu/oeFK0gc2hep5yOhRhiTtkWvT99NdGk5ZTnUdtehcfRj5Tb5tr+XA4xVP0GTR2FZBp83V8UKsBVmKeb9waT3AS8rCrSr0X2hRr8RgdIjDqKZkmraxIBq/ggAM0+dNme0OlaorF7ULiOhPO2sZLEMuVc6TYenZ5qx8/tNny/yg8P9Xxfj+EgXL7YyQm9jV2XVrML5SvKMpSjvxhwz6orvpOCAElMWAt5EAPSSk3NXpp3WA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS4PR04MB9457.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 19:30:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 19:30:39 +0000
Date: Thu, 15 Oct 2026 15:30:31 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
	imx@lists.linux.dev, vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v2 1/1] dmaengine: ppc4xx: adma: remove unused async_tx.h
 include
Message-ID: <atEp14MhfPgNybh5@lizhi-Precision-Tower-5810>
References: <20261015155616.3068503-1-Frank.Li@oss.nxp.com>
 <sashiko-outbox-173127@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-173127@kernel.org>
X-ClientProxiedBy: BY3PR10CA0003.namprd10.prod.outlook.com
 (2603:10b6:a03:255::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS4PR04MB9457:EE_
X-MS-Office365-Filtering-Correlation-Id: 61b16b21-880e-4dd2-153e-08df2af2cb21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|6133799003|18002099003|22082099003|10067099003|4143699003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	dY77YnWyOPFrlMn4A2EAVITTui9240gLag4LEcHcbk7MsGyUnS6mPKGDjiBK8l8/ZbLciFDYdnSVj7EjMt/pnbd3VLn6esbccQ383Kh3iWl7tJkXgY6lI+A7mcZilBj9XdbAH2f/nnLHgh5WSyS7E7mAh9yzSY5s4NKcRksMx8A866bn/BAu1iuOVu4W7AIZk50HgHb6E2cgKBKUCf/ZWFzvQi+aXEcCeElqtWlF5wB0qXLOiHfUSM71ypwSURaAn3agg9nk+xYs1+SdXvThTiGIQVzWT3HvowsoUaBxx+deMbISt+wWDv2XLdCda+Dtk5Fjb6PBNR6gh+hEJgn+xeRIys+CWgrV5YK29SDtlnAGLJBe0w0EI6MIT/S3CQixSxrswcGxXjgC7C11ZyPqWU9hztUslTFoI5rfyJJCgnAoMcV2V6NpcRfETugi1PsuEboiuo3OBgm8WAyn6lv+rYxXGhOJpBsobAa0F1NBbgfXTfrPKmgVcJqBbZICd99WVAdv/SWC8aDVoiaQilPUDLw+3qiWouv8+93tKIb3I/eztZYhWerlSZWDmurXqYRGcbSzcyUQAkfGikUTAZpJrn2x2RqQK/VNAl2k9J41ws8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?tNDjzoXA4r7rjPRCPoLpCC/D+Im/cqUBfXAgWRACmUvFTTvOofR4D5LwVk?=
 =?iso-8859-1?Q?b6qDTG1EQu6OY8D0h+L7YZsYiX6vVaCgxc+UCUkWh60YAmwu69AQzl+thj?=
 =?iso-8859-1?Q?jZiMYJi2l7HsPtIxsfEROQUgN1NgB31BcH+sIrqQvS2+QPg5LdEDDaObpU?=
 =?iso-8859-1?Q?gtIWJCrN/522koeMbY/mewCAkAwdl1MWqXSf6hoGy6Rav9kDsafGJ57rzf?=
 =?iso-8859-1?Q?5ZmINI/H2hJvUVhc9wKDN0W5mAb5sQPIYPqU8UPK7vrC3HLU3OWICpMr3E?=
 =?iso-8859-1?Q?LkNHFCPoqBXfll4HJ95ZLmQyYY+D2xtRKIfIf7J4kAoAHfZIGTgEG7YER3?=
 =?iso-8859-1?Q?C3W6xIEn9XcJirqzf6jdcaDYXp6kXRQm8KyOYOBDInFTBZhub1VkLVWu+R?=
 =?iso-8859-1?Q?UGo7jCLGQdCMfuSnttN2DxHpFMeFdt212vd6MxQ5rGzi38A0SKPukHFZpc?=
 =?iso-8859-1?Q?q3r7yETl67RW0eB+BBpi0YWtyILnremSWAt4PxwOrXFApU51Q3SIFpyt7p?=
 =?iso-8859-1?Q?qr163HvpP+vgBsUqGiJLrnmyet5Voz3CR/iXDbbN/0RQvHacsfmQlVWYRz?=
 =?iso-8859-1?Q?nbjy8OHZbMUvzoNf8om0VwDGMzannbt6dH4O63/FKkP26dZo9FNbFAwc7y?=
 =?iso-8859-1?Q?zC8e/hVWQYiCL6WPOCeTVl1Qzkvfwy/ntS6pWtrzxXAcgppV8oCxxjntmR?=
 =?iso-8859-1?Q?w8LzLVb/ISBtzh8xw9OLrkY0hlHxAP7u3MpBD7OsAPaosmIZpHLzPd4byH?=
 =?iso-8859-1?Q?m/aG6VF1dDfeCY+nnrbib/IJ/XrSBCYgu/kcJWGDyhPyZNIWN1dQmYIUTr?=
 =?iso-8859-1?Q?qVv5JwBY7Nkoxghmybe9L2fYbQDeMXhMBn9Rhr3D6WP9SDzCTjPTtDHfxh?=
 =?iso-8859-1?Q?dh5hjMs3t57mMxF/wyNGR5x65vvKv6L00Z5OjJ6DMu37WhcqnXgT4Svyga?=
 =?iso-8859-1?Q?b22yvb4ECFeJB6rT1MtpSmQMAMFwzF9XBYIjw9fMen0brSu4tftSSHYCvn?=
 =?iso-8859-1?Q?TkbPIpqtrAjWIvALRIVyDpOyv1ffBrtdGYsA/CUOlYM3DKMvJoTFzIuIRd?=
 =?iso-8859-1?Q?hfw4AgMRSj/gzqftqKnED1xW+ISD3M29kXmYfO/UYpUTtTAl898yrroc+4?=
 =?iso-8859-1?Q?0f1qAqawaiizwwCJ7wR0grm45VWmHS6iiUn5oVEVOpxHC7uyeuUfL15f6s?=
 =?iso-8859-1?Q?7iYq+FjRgL2aml6ZDao/HruVtwFY2vaHMKleKQJ1/V2v20l922H9qlQDvN?=
 =?iso-8859-1?Q?b+UlSp8wcZ3zbLlU3okytyL+5x13BwPOEt2m79lt5DufRbfmEzD6kxFpDY?=
 =?iso-8859-1?Q?kyv4FdcUADtvWl2k0j3ZiEiSdAErn414QGtuzDSK5IKjUTbLluJ68znmn9?=
 =?iso-8859-1?Q?/CqUaZuwmBoFKqWG5Bm0t0Lb6VMY6N70+iUsKom+C3u3Vf3sHxznKQ6j/n?=
 =?iso-8859-1?Q?E8R8+uiFE6V9erl0CG1+RKv9wp9kiLtUx1hJllx64ETZzYUzh5qH16e14v?=
 =?iso-8859-1?Q?BSepH1CwLjH6Xw+z/prppQXyml3aF2qVB3TVzmFtSLpoGLiZf71mlWVfzr?=
 =?iso-8859-1?Q?JnYyc5XZr8baZTFpBNCzr5l8kfZSniULt/Ot7WuO+wMK/5+ysbB+OI6zzx?=
 =?iso-8859-1?Q?fP0Wb+ZqVPQWl+IQBVT/nbiZWQpLRdkJWjCMIzk3lT6pT9566dXLjpUmxq?=
 =?iso-8859-1?Q?rjQ4ibnlvRdkUWXpYpVD/vxzW8iFrJkWQMKociXApDx07zYkyNmnqOLl3v?=
 =?iso-8859-1?Q?EDRSAT4/iA3S5SmLhZB4I5yEEGfR0jlzabARp4d8IBT4nhH49fE4cpIjdy?=
 =?iso-8859-1?Q?09yVCf2XTj8qWJdwOrVKZcexfUNDa7fjjnOmnL7OvHpjhRKl47W2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b16b21-880e-4dd2-153e-08df2af2cb21
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 19:30:39.0754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZQLtCMkdQ9hOL62i8cvax5C9wlc4vVSi9UPJz//6zSjhQn/JdT2DFB3ffrT9rtHGVEbrQSeNvDZ1qJBBWNZ55z0v/Z3wdlM56/3a57BhgCnSr8k5DqhGIcBYoFFzugz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9457

On Thu, Oct 15, 2026 at 04:03:32PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dmaengine: missing prototype for ppc440spe_async_tx_find_best_channel()
> --
>
> commit 7df6c7a27c8059b2cc2b7731da8108aa6dffb69a
> Author: Frank Li <Frank.Li@nxp.com>
>
> dmaengine: ppc4xx: adma: remove unused async_tx.h include
>
> This commit removes the async_tx.h include from adma.c to prepare for
> deprecating the async_tx framework. The commit message states the include
> is no longer needed and its functions come from dmaengine.h.
>
> > diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> > index bcc54d584e2bf..05041b99581a1 100644
> > --- a/drivers/dma/ppc4xx/adma.c
> > +++ b/drivers/dma/ppc4xx/adma.c
> > @@ -17,7 +17,6 @@
> >
> >  #include <linux/init.h>
> >  #include <linux/module.h>
> > -#include <linux/async_tx.h>
>
> [Severity: Low]
> Does removing this include cause a missing prototype regression for
> ppc440spe_async_tx_find_best_channel()?
>
> The prototype for this globally exported function is defined in
> arch/powerpc/include/asm/async_tx.h, which is included via

This is existing problem. warning is existing even without this patch.

Frank

> linux/async_tx.h:
>
> include/linux/async_tx.h:
> #ifdef CONFIG_ARCH_HAS_ASYNC_TX_FIND_CHANNEL
> #include <asm/async_tx.h>
> #else
>
> Removing linux/async_tx.h leaves the function without a visible prototype
> in adma.c, causing a build warning.
>
> >  #include <linux/delay.h>
> >  #include <linux/dma-mapping.h>
> >  #include <linux/spinlock.h>
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261015155616.3068503-1-Frank.Li@oss.nxp.com?part=1
