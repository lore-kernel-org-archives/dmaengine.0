Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021133.outbound.protection.outlook.com [40.107.74.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1043DB620;
	Tue, 29 Sep 2026 04:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790655235; cv=fail; b=XkPtd+CA7e+Q1DgL9h+BiXqbLoxbdpYtL5/DOXKTqQJrzxa4kSoyPs4iOjQaCQu+JexwodK1ntUpmx9vYr0OPYBaZnNrkqHhtMRoR/KlmD7sEOs/JOqNyIc3Py9ZuQWKs0BKu3uX4Q72+A+di3o9+6O4UCbKxjLKGU8G+Td/Rvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790655235; c=relaxed/simple;
	bh=9RyPlxW22n8fBZ7VmrZ11wbrRIJHXG5YeE6fJcrp5ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aGAVJ12drxhKaNlFSJN9xk9DTxBr0tgXrOUYS2j93+J0t1xtOf2lUUxXpQxubRQf5rpkbbfvcXmkTfG/bpjdI/N4x/6FcrmqlInVcZs36AxtIdiBcnScbJMN9qbp+E+5jziOdQrqoIS5SBwhKoALGsMszMFkySJNwR8kmIuQCOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=wqsaJ4pK; arc=fail smtp.client-ip=40.107.74.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="wqsaJ4pK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yn0FX3Ju2Y7YfV1I5tvIHRhKUH0zTBm/3WckR3Eu7V+KKrKWVLyJqtTwHqV+jlNpEL4C0aGLfHyoPh9i3I5LCOLbjI4bkDYBBxyJ8Z6jnS56KhanloaKvMKrZtzFHBK4evnFZ9W2jCwSz3WN1naE+uUs1kFJ3y6iN85edpVOUU2Zi3Kb+Pnu90ADwzpBkR18nItuNzProhPgPvUwbKJmjsP3ZXSiPNpZPOQiOCkjCNPGV8G8dwIzU+TAmuY2mrS1pJj1D2VuLynmMOCZOwv8UCriNDZFCDRFI+xqD66D4jJBFFhPcdonEXHYxVxTzFt1wq9LiMpOwqFSXHCO/2PgFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3ofRl7p+TzJ1SumaZmPbmMZhVh7qzu8fP0Ht8uw2L4=;
 b=VA8e5cmYrwwW253QA9BFh18gTqSa70j6pA4XQy4B7RYoUgnfF4fVjyukPOYek0yGjXj5gQDvYovIguad57xehCHTkc68MUBb6mOnM/Zsr5OnhtrCcTTk2/msbUz1bJzwmz5cSwWOZZBS7vrVEBSze1LJIG0BAsGjx4HwZnH0GgnLGPA9siXgOyS/s15jrvHsxw9bu7AhYxQ90zGSzh9vOkwVBs3PSI43wFBc3OSp3Yrb49Y23z/WR3wBzKNQLNVdxgDZ/sXfGSUXzxEUcwYGVRZyENatw7HD3/PLUGfeNf+Qq90rgYV24rRn1dIy29pmib5t+Eyk0eATj73R9pCBhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3ofRl7p+TzJ1SumaZmPbmMZhVh7qzu8fP0Ht8uw2L4=;
 b=wqsaJ4pKgzYwewkcu8gexDII7aYelDnJrU7WI1YhvmfEldjP5ki52VrdbQd6EO9iEOVlne2o8XBQO699YI88dln76VevtaWs9knTE+xc17o6pm66z8nFBM3cPhNrRGpqOwiXnbseTVE8HWpNweLFphvCqFmdswGJIEWuDvnAwn8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:325::11)
 by OS9P286MB6568.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:418::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 04:13:49 +0000
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9]) by TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 04:13:49 +0000
Date: Tue, 29 Sep 2026 13:13:47 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, linux-renesas-soc@vger.kernel.org, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dmaengine@vger.kernel.org
Subject: Re: [PATCH 2/3] dmaengine: rcar-dmac: Add missing
 dma_descriptor_unmap()
Message-ID: <ezlwzpaq54573ewlofeep3zqqajj7ycpanv24ogujtm3alc23l@ehq5obt3bnfn>
References: <20260917071208.36888-1-wsa+renesas@sang-engineering.com>
 <20260917071208.36888-3-wsa+renesas@sang-engineering.com>
 <aqwXwOiPgRDUQfp_@SMW015318>
 <3odvtlxs62ulw4obrzfy3xlf74k4wltjkj6k4axsmdx3hnyo3a@rx2pm422eozp>
 <arkPcxePb1G1vyZt@shikoro>
 <arkV-ru3aNXDFawM@shikoro>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arkV-ru3aNXDFawM@shikoro>
X-ClientProxiedBy: TYCP286CA0085.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::8) To TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:325::11)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB6866:EE_|OS9P286MB6568:EE_
X-MS-Office365-Filtering-Correlation-Id: 552271bc-9f99-4f96-6bfd-08df1de01012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|23010399003|376014|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0r0FEFCYSpfnLZ/TnCpBhNSQj3XmSAEhD3wTxaBDtf0FWBJgLBcw93SkTDI6U/BflwhaG/Gbwf5KV09IAwjaYm4ihpcPZX29NW6EpQcyvRhrxtVx3DhYAZIWUS7CIuc3J6iu7sIfMahEe3sfPtWZM18qE5dSCB0YGoouoKRKKzIcqODO5sDw2x1A8MgAEBEhBJZjsBH6E5sfOb3+/3Dh0EkSOdsYkVPrruQO2W3itcyo1kr34fbwe4ihSYNZsC6HcyAkkPPHe7G2cNKo8jFF4oAnDSOf1oKVmRV23JkP+foz1Y4MuFJ2WvtnLlvi98YoRye9Iv88qctOaIWmmxERFgoTiEVIcFH6uWGaEcCsLv6O1vgOvAZRfQUZUylhPI42d7b7gEZvqXJutlbRMwkSeI53XHJaE2rDdTYfeU9ii5VHzWs3+OSe6UQrBvEyP4St6Sbsz5HgdacZ9yTYY83cPOyQB2ccc4EHMuJCYhWnkaeDJwv0ptIXKVzW8eoM2waAr/cM32kHjsC+6SlDU7f8u3E52gCxytGrpw9ISYyjk5HEkIAGcMmFHrZz5a9kwiIs14xMnedfmjzpLcICWUZ76dbZLk9ENEvv8wgRmOcGcV1HvHnFNtAA09hvT59vywGP+70RaA8WQq2o/6fisZCqIlfDbTJwFqPKCXIyMqV3CcM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(23010399003)(376014)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4uYYAxnWFKg4SouscuGd7Falai2/JRcVi0vESVr6HiPK1QafzZfcbT2sue7n?=
 =?us-ascii?Q?GtOSNbtYUeIlxJth2s7VQKXglBCEAIDNGWihpcKwP4C+i7OOBkdafc9s8O0d?=
 =?us-ascii?Q?U3ehrwELMgGFo0ELBTV8mmJqF9yUSpyi83Sc5PShIto3I7G1aWrZynE3oJmR?=
 =?us-ascii?Q?z2d+RsorDxgn/UeRjsBCWZXRQzJnAjIRGx3qgLmo/TOlYPJR6rLG4/3IEOfY?=
 =?us-ascii?Q?c4t5p2CWw2YpcBdIC5nt/5f0F6LcbcdyVR+P5DB4iit9DzndADDo4YbhoRE4?=
 =?us-ascii?Q?yGAh/ySRmByDl+WcInB4fiQgXsRgWBaHQbmP5e+t09sZsqzk8dwFWPg768sN?=
 =?us-ascii?Q?Cw/mj3RRMbEP064Zbiv8mjKpw27SY7lXRqS00/Ir6ZdGnD08J3lwlzFcukNl?=
 =?us-ascii?Q?oIQv/S/rt8UTZO9+L7vv+4jE8nf5OXrTPQykjZCCigCzJSXKVDT6dyW/k92k?=
 =?us-ascii?Q?w6sPCXG4XtCXogCGssFpGhnMNAcv9Y2l9zBWfNBGNQgfEkz4I/Nsia5u+81M?=
 =?us-ascii?Q?FLJkff0LRWvpSPmaSIBvPgR5jS7+zlHcfC1GNla0ZbSNTgVOfcxB7YvVIF16?=
 =?us-ascii?Q?SyhMoHaw2hq+Fob8DRtyaC2Xqs1Ca407fhB2GQrH1Xk7tERgOVavZ2ZxBT76?=
 =?us-ascii?Q?ih5918eeu8EOQzrlyYFbpQs6jBgHOARP1i1u7LE+fLkJR1RGG4++tDTQF5JR?=
 =?us-ascii?Q?xmh+0KK/pb+xfjUuUml9Gkcxhi+XSWDS9JiHhJTiFyPzTZ5XxHKVYXZ5Mexl?=
 =?us-ascii?Q?mdu+8Z/TYWRmGcPYiTplTRroj+2XTGY33dtYrRB2+d9maIcI8zCiTHI0X0uN?=
 =?us-ascii?Q?sqDi3gyOcaa5MDRg8iecUrsi4DR81zL/w6FaRA/cfbmh80dbh4Xc2XF2Rl7E?=
 =?us-ascii?Q?bRHu+mxRPsysW0ZG8jWestOSUz+Do+v8ajNJyrS2MlEDK8W7x3cg8A9y3i/J?=
 =?us-ascii?Q?2YxnUeY4SWVGfb8J56DhzWPkvXxZO7Ea7DDITPYx5I3QBv/NHg1xRB9Mn5zc?=
 =?us-ascii?Q?xiGek/v6Ox8Vj0zUKoJXzgaZm/bT6mBMjYVfiSylZX9DYxhRNwMS7Cs6vOMX?=
 =?us-ascii?Q?Vrgi297mt0VWY8DpoPyv3LEgCGrkcdZCVLHnbYcMMM0wOYShxdrfUjkDTf6H?=
 =?us-ascii?Q?x/6Ok9y4rRQqgYKT3kjHzT2aP3AxgBxSNpxsMAXWo8Q4B4QQkWkgPTLFTQei?=
 =?us-ascii?Q?sZdeMFnhfezDmDHFCxB/PsIfYu55F5BQnFGWP28OaapUTxMRawEj9PAokID+?=
 =?us-ascii?Q?u3Ptrl29NWcHo6OEjsZojuRIJ0r9DLIpUMMBbFyIFuO+hfowDhc3umm46UKv?=
 =?us-ascii?Q?Pq662DTan5+qmFtcDzRmyOKBdWjqcc+M/o9KE27tJSWYtrXqx8v+zdxmzP9b?=
 =?us-ascii?Q?uMmMf0mEI8D20ctnyCWwS3tsA1P/j9HtJKhN5j4QoX3WK4yb0wrH0Bwc9imF?=
 =?us-ascii?Q?EKqIPUsVpisn2G87b8IK8br6VmKlG6h1kTGb+bFPPCtfHnc1o91mRmFd7L9E?=
 =?us-ascii?Q?FNS9tSnVYkOsuumUVLj/N1/VR5CpkQWjSTofzC+apDYwraMqDJABJ5mgAGSj?=
 =?us-ascii?Q?/dtMpHZxlZfRessQW3zvsmT3tn+3nWIoHbTLbOBngXLCJdZxh4JKdde4PLvP?=
 =?us-ascii?Q?YVYKW+e/E4Fr3ePlXY8nLA2mFPgbBE89pkDTTVZzsp2astUh7itUurhxYxww?=
 =?us-ascii?Q?K7eKGgPC6kAbgdeI5aCQg4Wn0+uxqEa61+dvHEtUe8tMNecBb7KpZLdD19lW?=
 =?us-ascii?Q?2wgBtv15hR/J+vY0rdQECig15/hGnCmQ7j9rcQsdY0X8cNiRdHB5?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 552271bc-9f99-4f96-6bfd-08df1de01012
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 04:13:49.2652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWVnlOJae43PgZk0DZa/rjI0qB58a7BsTq9itldSUAR7ao10AevCDQiwFDgAwWiJfYyo81oNCxurnBEU2JUPzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB6568

On Sun, Sep 27, 2026 at 03:11:26PM +0200, Wolfram Sang wrote:
> 
> > I share this thought, and I guess, Laurent expressed this, too. This is
> > a separate task to tackle, though. I still think your original patch
> > here makes the situation better by making sure the cache gets
> > invalidated and should be applied. Or am I missing something?
> 
> Okay, I got now that Sashiko's comment was related to cookie-completion
> and not the callback. For me, its comment also makes sense because it is
> basically the same argument which the commits I quoted to Frank used:
> ensure cache completion. This is not only good before the callback but
> also before cookie completion. Or am I missing something?
> 
> This is easy to fix. If we can agree on switching unmapping before
> cookie completion, I can update this patch and then send a series to fix
> other drivers, too.

I agree with changing {cookie -> unmap}** to {unmap -> cookie} in this patch.
It looks like an improvement, I don't see any obvious downside to doing so.

Many drivers do {cookie -> unmap}, so it may be worth making the same change
there too. I haven't found a specific reason for that order in the history I
checked, but I'd also like to hear Frank's thoughts.

Thanks for handling this!

** cookie = dma_cookie_complete()
   unmap  = dma_descriptor_unmap()

Best regards,
Koichiro

> 
> Opinions?
> 


