Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E9A40F747
	for <dmaengine@vger.kernel.org>; Wed, 14 Oct 2026 20:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792010742; cv=fail; b=pEXwW5fL3bRRDgRcE8t1FSesERKtfccOJlJz4fiw6BjjU9y2GHUyGgUSa45XdNQaA7+gyBji1dCBt8cCJ/nknTOXtp9grue0ODBnvSvzfOVoZmVZ6CWb83ElH8FwO4IlyUh6fE/now6TAOGIltLHboe3rgfQH26hj//dV8JNt/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792010742; c=relaxed/simple;
	bh=ZWepgVx/GARjSjnW8hstZRfri8juiEVyL4WfAqLyZUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AMCB0fI9pFCJZxpbVCh/1uyQpi2hB7C+dBIbrgxlND3ETxonxl89Ob5S2xfrRMgfq43vTcYeJT2JAiYdb98CCEjm/565vBQjw1VFhtMh9rkwwPbUiB60CEx+j4sq+yGoNCmXV0fOAgIN2awmaO93C2yH1znp+xoZUTcQAhpkl+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vOjqxXVM reason="signature verification failed"; arc=fail smtp.client-ip=40.107.130.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vOjqxXVM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1SVpLKStKLuVhB2uTDkfTpXcNX8ECkB9PqTMXwH3XTap3hU89gLbuCA+5vE6Jr6Fg5HWjA8iTxv5cEVESLetiAP9VYGf5KARBvAtsafYfyyvd3Tn7Nfi6jt5iKVyl6XDzYlwuTPT8qFqAvX6N1JtmrKbzxiFNZV3kI2kMyNxQWeoI7lylO635H7Cm0gV4iKoV88/zGH0r4UdJw9QDz7YN528eDbNG2NhrFiTdWXGnQV1YXKaqw9IRGPi4dOZnvtBacdd+U83oSzFJhQaBQ/eefzB6hAl8zUhOd9yEegLuh9uIZrH9BY0UAxpV74sof7DMAuMHTQ5g/jXBVQgXK2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3+fwEf9UuRce2zmqC+RsnEnpmC4PrwbvEQOEIW8XSs=;
 b=piMpPbbYxgDkcT9Xq878VhKRBOejVWepHLwd27mfMBk8/3t/RYwwVzhDQ305uEJrAsPRgazJqDtZaYJP+RO4cHu2627X8Py8/D8pVVuGgCjQBsegZCD82OY9qBMqKpSuMrFjmlQRBbPEK+u6FoWHHi1x4+3kW2y4VfC95qSdju7D9VibvTfmnvOwepVsTNTR0CJatPYfqmRPx7RU+kccjaD1bNlVpg0REz5lNPyk2ksAKjlYc7wOQoR4x8Q1NCRDUuQKbtCpVeNewcudK8fsRwSVRaaWexirxWy5obN2sekXLMzEI+enveLTfLG865ugZIbZCU7/2GuhK0BWEBlTVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3+fwEf9UuRce2zmqC+RsnEnpmC4PrwbvEQOEIW8XSs=;
 b=vOjqxXVMBdtBhc3xFVklikzAHhZ354GS6WBrh/gyReWYUcJhu+y8VaXqUPMQ5JZMSEPcwGj6B+Ydz41yictBbCa3U/NQKCC8msSnSVXOlIUmazE4StLHMHsX6e4w6+j6/l9luIby27/F0AfP88sG8k0FqVGK7sJGzet0AZH0sLGXM4gjuMCWpqnVc5g9wH/b91Y6F7PuCN+ajKHdpn+Y02VqEQPWP7KXkW9WoJ9QVz7fFerzXIN5PdXwSKr+hsSp77vUbxmdx3sn3s/RNP4XTgECCT5IOGlJwSDRwgnL9xe/69zBv4tmW600pLzijrEMUBIgQoKVX+1hrOV3wny0ag==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10179.eurprd04.prod.outlook.com (2603:10a6:102:460::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 20:45:37 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 20:45:37 +0000
Date: Wed, 14 Oct 2026 15:45:28 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
	imx@lists.linux.dev, vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH 1/1] dma: ppc4xx: adma: remove unused async_tx.h include
Message-ID: <as_p6Ee1u0wT1HXA@SMW015318>
References: <20261014201221.1806634-1-Frank.Li@oss.nxp.com>
 <sashiko-outbox-171853@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-171853@kernel.org>
X-ClientProxiedBy: PH8PR02CA0054.namprd02.prod.outlook.com
 (2603:10b6:510:2da::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10179:EE_
X-MS-Office365-Filtering-Correlation-Id: e2df5141-6913-4483-5497-08df2a3419a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|19092799006|1800799024|56012099006|11063799006|4143699003|261009223027099003|18002099003|10067099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ZJjAgitacHb/mLONOPyBMIawmy+CFfCa6pGyrlrln7Byj8V84+ZNCeNYQHydnMXR67o0JRvVP09ZlGY+3ivWPHpsi2mFhDZlQbzE7wF7FOPaooQGNIQ3su0enQYw7mx57XnDop88dxDZ1NO8x+gRYHxpfTNAHkahtIEAN2KANBgN5shlHaw+jGtqYz1p6SbgytGL1Fpj+g7oIrs9Uqtq9rVdPqBDoG6BtxsfDxjHkIZ3kLU1q3i6gLR4R+qDmbAClIUEtc8OavGP3qHEzvn7KLwDiaLQIK7WAV1D73QlGJFDwKa5Ug0IQCWzCEn+QHEpYvscG50tAhs8xib0E/Pc1kzqMJtMVCrDOEf2kBiHmV9tFd+1Wha982Z1WWan21jpDp2hG6QhBKyTw5SIbC6105Se5srdcHh1r9cAxeUnALytm10b8j85wyh7tmArdq7A1wpNi1EITdhV4D9PVYlmeI6ZjHybfRQ9PLKHYkiMLgbgErxZYAhxEVMjcDeGS2GxhZp3uj+OcyIvKHhM2mim0hv1IHHdwKKFXmTgX/V7ClhMFTnxi8h5jfw5jA/HiCx8KkFClawI8pohZQDEeQc0Val/IkCfgtM5Irjli8iGyKk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(19092799006)(1800799024)(56012099006)(11063799006)(4143699003)(261009223027099003)(18002099003)(10067099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?2mlHUC9QcPp8ajr0F+71/xObiYVfGucY7R44JuALaqy4CQEJIpmCC8RO3K?=
 =?iso-8859-1?Q?Wf0sRvYO6Ma8dFx/Ik/6TooqWSWUGtb0OV9DhmvBZKR8OWssQijoct+nfU?=
 =?iso-8859-1?Q?3ac9vr+ao5oQQibT+X97zTcLYA+jrwrAcecRCrBNCjDr6MPlhsz60aFM+O?=
 =?iso-8859-1?Q?HEwl3WuoRUf5mEWGZn39BhrG70EknGlJCCs547W627aMWUS0jAzKzBncDo?=
 =?iso-8859-1?Q?2Zxq9athGbw1kw9YJHM/n6yfxz4oGlMFxhtX6Hd5CTfyaOoH/rOLwGZ4u2?=
 =?iso-8859-1?Q?+bfChIFJDaewcKtA/2VmfIGM+1/5rJAla2VXZ+S5BNp7XeHpJ3DI1Uyj2k?=
 =?iso-8859-1?Q?rYyBnbz/HJiGbIRB19DQQCAZXbU4WX2uDpXxYTSqJJQmXIiPj9QVdLduqS?=
 =?iso-8859-1?Q?JOOxUrzzxu+FMe1SEKla4lGkw16bmFXL0Znx4zKL0SHfofIn4CzXHANkCk?=
 =?iso-8859-1?Q?y94EgMjr+lEPvBYgv5YB49aDXIC7UUj2P/bhjPk/uvT/OFLwJiJojT7Tzk?=
 =?iso-8859-1?Q?KJeoZpXhtFZdHra9twXJmgrTir6pggH20nLN0OLvNidLgZCbBS6V+EvN5m?=
 =?iso-8859-1?Q?pVFhxSJCSYepD0MTjdV40ZtTPOOND3I5mmInTy1/IV9FDWutJeDTtr/FO8?=
 =?iso-8859-1?Q?SfABtjYMNEM5lxj/MBsfmXQeDyz40HvXS6p9BropmxwV+zO9XoPra/YSJs?=
 =?iso-8859-1?Q?UTVkMhJpUy3J6FvBzp1DIgT6EVWii/gzuAV6F5D7bqdmC0L6lo46D2z06r?=
 =?iso-8859-1?Q?50NkZu/IipSwuTZwajjmkmjNhPiNvcZNCjYw1kbaAmOOhHtppXdMD4LFzo?=
 =?iso-8859-1?Q?GnbxmIrFaIJs6h8XO8xclckx/E+GdxKnHWZeCELuWk5hnrTrFWtCQ9DSJr?=
 =?iso-8859-1?Q?uRAs/pa7Ows6B6WwGGeQ6oIRh9CBq9yqc1q6hRfvA9rtwtaprbl5ETFgPW?=
 =?iso-8859-1?Q?XxDRNEGruSYk3zNWRKdOia6gAJ9IYdz4XWucR0Jl6xJKIxgMXr42fei3qO?=
 =?iso-8859-1?Q?tpN9lLzGZhhgwrQeSxgO0pkA10/PzvXfTcaqdBWMbgfyFnlNKM+7Ebo5Pq?=
 =?iso-8859-1?Q?aTojxwOq/SqNFA7rvSd92kjj6HvnVIbKVzlTw+W31jyh8Kzozq7Iaul0ia?=
 =?iso-8859-1?Q?nrNcD047++2Kg7WE0x4R5NadFbPx+l045pJlEx5fRzGfEBGL+G7qZnAqtu?=
 =?iso-8859-1?Q?vOYh6+l2vERRbnJD8mznP3fCOmanisBtR5SsPk3yBmr1Dx+oNVQhKnUL+/?=
 =?iso-8859-1?Q?rSazp2plV4JAh5MPTMA1gwKe0CkqmrvLe4mHJk/47GmTpIRi0URI3Y6TDJ?=
 =?iso-8859-1?Q?b0XDp4LFOPuBZN7dUTU8aIF6c22W+S4XLLvoiZaJvw7D6TBHM8sRCo1Wzf?=
 =?iso-8859-1?Q?WjYnlqiwu86fw8Ex4548f/DS/dfkNl6Jsgg5sNHrL9OVhBhboO5mkmZXom?=
 =?iso-8859-1?Q?NzF2acTXrCEUo7lEv936k3rSU7JAq6RcrynuVuzgqO+u4+vy9SQyfoZdin?=
 =?iso-8859-1?Q?DLUBmDV2E3nfr5OTjkmgPDrz4I2kdLnPtRVrYxYNiU1TVBjciXOvOsd9BX?=
 =?iso-8859-1?Q?IiSAxi0huXYxcbvBO26r1COriGYfvj3nuOZoMwzJZFwJOWiwaI03X/20QY?=
 =?iso-8859-1?Q?PQHGLCVJtKYnSYGQP7eJ8AOle5vlR2yy11Scn//nr2Q3CS3vTU9RaDnVcR?=
 =?iso-8859-1?Q?fnmJQL/RaFGk1+SlXC6AhDbzbZ+KZI568id5hH65pxXmIQUqIvRyk7GhDD?=
 =?iso-8859-1?Q?Z2Bj0NZ6ydOQO0/L+VULREe+Duk2Odl+hZ51jtYcplqT9GWA/alVJQniVB?=
 =?iso-8859-1?Q?26Hddi1uxFpRWldZYvKQZL4Fs9G9bZs2WchdQOc71h5KDdn//Y6h?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2df5141-6913-4483-5497-08df2a3419a6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 20:45:36.9709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: st00KAmW7Zcew++w3mIb2JCkGlnyXbXsF0HrEvdta0vyVmz4zLzTIL1r5VKV2rkYFdC3fgr3Vkmyb3tQy0CWQF4LEYsKgZ6JYgfrqfYXuNjRvflENL0mz36c7GFlkrAC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10179

On Wed, Oct 14, 2026 at 08:18:18PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dma: ppc4xx: missing prototype for ppc440spe_async_tx_find_best_channel()
> --
>
> commit 9b901f64606c940ade9457f8242fc8c04d2f5fa6
> Author: Frank Li <Frank.Li@nxp.com>
>
> dma: ppc4xx: adma: remove unused async_tx.h include
>
> The async_tx.h header is not directly used in adma.c; all required
> types and functions come from dmaengine.h which is already included.
> Remove the redundant include.
>
> > Reduce async_tx.h user to prepare deprecate aysnc_tx framework.
>
> This isn't a bug, but there is a typo (aysnc_tx) in the commit message.
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
> Does removing this include cause a missing prototype warning for
> ppc440spe_async_tx_find_best_channel()?

This is exiting problem. include/asm/async_tx.h is not included in previous
code at all.

Frank

>
> This function is globally defined and exported via EXPORT_SYMBOL_GPL() later
> in this file, but its only prototype declaration appears to be in
> arch/powerpc/include/asm/async_tx.h, which was previously pulled in by this
> include.
>
> Without a matching prior prototype declaration, this could trigger a build
> warning (-Wmissing-prototypes) when compiling drivers/dma/ppc4xx/adma.c.
>
> >  #include <linux/delay.h>
> >  #include <linux/dma-mapping.h>
> >  #include <linux/spinlock.h>
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261014201221.1806634-1-Frank.Li@oss.nxp.com?part=1
