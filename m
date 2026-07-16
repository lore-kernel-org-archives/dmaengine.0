Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021126.outbound.protection.outlook.com [52.101.125.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91E728727D
	for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 03:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784171215; cv=fail; b=MfBe5N3n0QVEn46kIOvCEmYxfULjXycDZyxxfUzX2rz6IyLjDDbOuM5Nj5Vbg4dMgB4b5GlI3H8/HmJKyo8pqMaWivHDs3S855EjsEhLAC9AhNrm9nw7Zjj2HSfsF0uqHy6pERozbUnynZKxiUa/5+a1yg+t+TKBPyqa9h076LM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784171215; c=relaxed/simple;
	bh=S/HL3vfO20O7funZcEIKGnlHbkQio/VIZdizyFBYJCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SjyURxlYYTeapWmLkksEZampa93tMhvqMMtUJ4EXde9NOp+BsQAKEHlW+w7V1T/Q4L9cpdYVyQhzPZurnToXSvYOx4H4A4auEQfMMj8yDGdxLSi9u79hEEclce64PksHSsCqCqKolAX4tLTYOjCr8LJ7JUhiX+GW/BEt7cEYlDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=fail (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=TEvXFcUS reason="signature verification failed"; arc=fail smtp.client-ip=52.101.125.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="TEvXFcUS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2LTs2rBcl/X5gjwR8MmafQ+h9TyTZKp/Y7XRSMgXeGVGqsTp1qOzvYQk5FwWE52zGlIN6201nEvw28whwRchZozP6JE1SH6VMCKY48JcdMkc3I5Zx5pZAytjNjnbqgrXJNT56IQslUP8ef1+BPP64Yzw3GW/N1SGTKT3hPFk9Ll6noenll0CLa4/y0HHohx2ctNstJZcV2kb6c/UzAw4nw/75SlQhtEU6VWNModll9GEeYY1W1CzAyTjC//Uctm9DjIkYwBDfectQkR//3aKMCGWquXc9o7sCsjgpth5h7fxsLDwa/FJs+iRDO2MIpoYRKQGq9Wn7ws5Rnqz1rPcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzUCBK9WrDNCUT6pHCJiUFouVy4AAdULrmPSInIYpIc=;
 b=mOKwW84UZV3n2brpCu3mYAfbZfuLqylVEY1tlCpg2CtgOGjEU3Oefp0FT1CDILdxzjbJqrPBQ8mfGtGQIWKnL/ug5aVma5c3CWJAjgwuIfmabysVtPG/bw2aDg+dFra9rK0xJ3ZDOG86D8Sepi3Ghpcgp1m93HbYD2c1302duwqWZcVB/1PhxPtA+M+VytYWqDeDwvWNUqgaIiT43Uzp7+jO+zNw2l56CuuPIAJjJ0Cr8LpP/WFS3WLKBQTvBVQAdzECH0YuU/3VLDRHlBZrUaVeDolvGgWuldNAKqN4CwcHg6MIBcHh7SA6BF7Ur+QyQF65bxjQwHMGaf9/jvT2Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzUCBK9WrDNCUT6pHCJiUFouVy4AAdULrmPSInIYpIc=;
 b=TEvXFcUS7HacKaznBPUksh0OyBF3ExMK59mTGrtBCk08+vxwOgbTgVzRMA9m42ag/iQUdVi35E2mcPa6MOklx50S5AqCUtzkB0wVu7Q6F95KH+/Bc3pzwJpfgCy5JPNgH18TMkbd/pV9qGGH0ohjFY/cBcOseWswenvjUV3Ob6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS3P286MB1566.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:17a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 03:06:51 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 03:06:50 +0000
Date: Thu, 16 Jul 2026 12:06:50 +0900
From: Koichiro Den <den@valinux.co.jp>
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH v3 5/9] dmaengine: dw-edma: Serialize channel state checks
Message-ID: <tz52uqhz3bs5i4cn6nt2ewtjqghkgkygxayqumln6wdgxsm46d@zptn3yhdnvmq>
References: <20260715175740.1110404-1-den@valinux.co.jp>
 <20260715175740.1110404-6-den@valinux.co.jp>
 <20260715181921.CA6551F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715181921.CA6551F000E9@smtp.kernel.org>
X-ClientProxiedBy: TYCP286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::14) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS3P286MB1566:EE_
X-MS-Office365-Filtering-Correlation-Id: 120659db-1975-489a-c0e2-08dee2e7481c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10070799003|18002099003|22082099003|4143699003|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	q0EjauUPE7sRcNLpBfy/DUObyOqrY82htdlIUcdc9l39VaGtIvmMv/25J9XtBAMGrBvCtX+x7mdYDrxcXe4lQodzko39lSMtoOdXDs6+33sFDcmsqthTGe29TV9XR12Y/Il6BAKw62q5ZDqyZzZT5dfakAJAWPdGAt7I95fcYrTV6F3ohS7EGaZmg4YOH732hkcQ8DdFHUeAjRav03SxbHwASC5SrlXDjuz3+aYKXoe2imNZiM6EeI5YX04Cg9pm4nOw7+EJc7oe0KIyvHmwUqN1l84qnqnNS+L9eWnPe+beiWzpYOqnAwTXkmM3s/zSEgoV9ylLqUBrE0n/sTaJvVsdH3uMGf9iFmsT5yuffhe6QvhxqGFeP6SIEOvNHhuQkLy0tkk0GaAw4ai57uLy1sstre1tMTmmOWNQkuDC542rxQ0lxBaC84Awl709I6fXa0QZZkc8TlcbBAG6mBykqrBFwPbE6t2lksbL1xWJpt6JzjAoKPlyb9AgdtOUUXihjMe/z0WMo+LWXPoXjo1wM3T18QNpum4NrEqDKXilErvwRVySUn0zd57CHD1WnDRsbiFyqiBNNrhRGtdWo7WIzuXZxhddI1Oy7Zd1m5VVQk4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10070799003)(18002099003)(22082099003)(4143699003)(56012099006)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?OZnmqKT8HTx3WDkhytXArXq1fHjBGv9FoXzgqspytTNhAk+Mg+Nkp3KCSM?=
 =?iso-8859-1?Q?7/oxLUg8LSlWyYjhFZPUwSsbUEo/TG2Lgz0RbDe4SLdJHmM/17HDqQDfGU?=
 =?iso-8859-1?Q?1PaSyzwQemPOzTRxG+Hgwky0tRBCMv9QygIksuCkedSk+dG2Tn59Vt7/91?=
 =?iso-8859-1?Q?aU854niGinFzIA53hk518C/9ZH9IyWU8vHY9m0iwQ7Bbw9vI7jl7g1wJPf?=
 =?iso-8859-1?Q?EHPxEWTXHXjtvcWAjoV5Iv05y4PqekSVhdZ7tFyg6iO7ImfMqxCSgbZvKg?=
 =?iso-8859-1?Q?lSf4+EOelN9uCimc3Xn7QPKYpDBNr/PiVo3O7L0nYtIEzxRkSMf1j6iJCX?=
 =?iso-8859-1?Q?EmxPIneGKu3/cvb4FOxpeliskj1/WNtLzXAWZA9+AG8pIeiK8uBlpmkZM2?=
 =?iso-8859-1?Q?0sB7SAaHDhr2dTcc3TmEo+rKcfNkdkOX+cEI4vUqaw8BR7fuHgoqkf1VHm?=
 =?iso-8859-1?Q?DkdNH9XvZyUz13Te6mgLy0qUe9XF7V5CFU50gfjb+zl1EIvlGdPIyPG7k2?=
 =?iso-8859-1?Q?QiuNUI5P0XpZtfyeEsiQ/LPQDE8W33wLgb5Y4Kolp8KcA6vSZXM40SD0Hs?=
 =?iso-8859-1?Q?dT+12rrN/Vu9LGgwX/K7PMzBv5onErjz7zb459ptFDzcuidnAzkroPk4FV?=
 =?iso-8859-1?Q?41YeSM+bkGPEePMdAuacj3oFcq4HkKzMCa/5u0Qu6fSxforszwA864AWDU?=
 =?iso-8859-1?Q?B66LPibUaUr+pfaW4g/huELwbXM1PF2MJMQLZ/s/gQzoqTaz1zRxuUWCdB?=
 =?iso-8859-1?Q?Clz6ygpFuBUVEYkXAevdfuGvGZR7Nw8WOqHhI5ofjJnTKxF4Ugg6wDAQQZ?=
 =?iso-8859-1?Q?j8mV8ffpKadbTJUBzu2cnAaxwlI45gCqSODtQK65dE58b6YDIjqVa0Bn9D?=
 =?iso-8859-1?Q?QKdsUOXexhTST31znJIt01w8H9Z9igVPPVAGQHDPwL5SI2zNOX0VrpHUAK?=
 =?iso-8859-1?Q?6LArqFx4e2iDR0KOi+I9ogcmuvs8X3eOKDjL7ha9xLhoiuGI0YbZbwxjvt?=
 =?iso-8859-1?Q?Vqp4UOJC/XAoI6Y2xTdJRA+dwSFsUmFEwMCP29y8cN2jf2HUJYXhEyZQ7m?=
 =?iso-8859-1?Q?G9/xGkP/gAXz5Azqj0oydIV3p4lnWmoYgwsSwF0raofixNBr5AJeHlz0Qd?=
 =?iso-8859-1?Q?Oag0+rOss8yMNyeX3HvIWcjt+27ZQ2xdnXdylfPDRM1TP0zFY2J2H5MqHB?=
 =?iso-8859-1?Q?28xlfA/S/XsWpLKKV4gwbqwDKq42tv70FTLvHGmcnTwwqXv2AZ68tUhy6b?=
 =?iso-8859-1?Q?JR62KzfLhZiXQtT3SyqteGKycJy8s3Ad3GCABkyF004XZMB+6osIHYlxTj?=
 =?iso-8859-1?Q?GWPXaCxj+nd6XHvVgj3jEFMmaPVAFYIuB/XmwtLxQ435DnZsDBMTQT8IKf?=
 =?iso-8859-1?Q?ItjHxenTOI6MLCn5w7KX9l59m84P4uL9A4tpsx2dJS9weqIC08bYsk4nMH?=
 =?iso-8859-1?Q?AgmrmFzZ44ezQXQacLFIY7w2jHyDc+aoogK9mbZgejnXFxLkuHlVxruGw/?=
 =?iso-8859-1?Q?IoiSCTpd/l6h9Y5+Yi3MJJC0ANKsoHWrXXJAhCJFM1OhY8SWxbDodeYYCr?=
 =?iso-8859-1?Q?02xNunAVQtO6yEZFrgXIoiwY5gWTwXCfx0io77/lcs/+dQ4e87+BAyGnLq?=
 =?iso-8859-1?Q?YCTmG5RJC/ojltrFXzwAGlAWwI7nrbKA6EizQdgZNMMkTcXFMbCAx6xadW?=
 =?iso-8859-1?Q?WQZkYWEEfh07HmwzeVwMN7+B+foKT9GB6O9a/MEIQ7flRIG0Xb7iFP7M0i?=
 =?iso-8859-1?Q?2mIENwHLQOXdEUSl3MiieZTRItkeY0O+QKunEgKAST0qW8eiOaux8K7hip?=
 =?iso-8859-1?Q?xhMPl3YHgmO1Y8hfWeD5fRg944IszeiNX5kVHhilqGNxIcEHS9lz?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 120659db-1975-489a-c0e2-08dee2e7481c
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 03:06:50.9092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/ah0qYUmzcLlD+81ylwn/80QjNJZBoY6qOCtV3IMLw38Uw+GvjFV7oRj0ob7fzoyGA5NMq4/0ypP/S129DDgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB1566

On Wed, Jul 15, 2026 at 06:19:21PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] `dw_edma_device_terminate_all()` fails to actually stop the DMA hardware engine, leaving it vulnerable to permanent hangs if the hardware stalls.

This requires a larger change, so I would prefer to address it in a separate
series.

> - [High] The driver advertises `DMA_CYCLIC` support and accepts cyclic transfers, but fails to implement true infinite looping or fire the required period completion callbacks.

The same goes here.

> --
> 
> --- Patch [5]: [PATCH v3 5/9] dmaengine: dw-edma: Serialize channel state checks ---
> commit 1467b5248fd39f737e5901d6f209dccdfffd622e
> Author: Koichiro Den <den@valinux.co.jp>
> 
> dmaengine: dw-edma: Serialize channel state checks
> 
> The commit fixes a race condition between pause()/resume() and interrupt 
> handlers by extending vc.lock coverage to include channel state checks. 
> This prevents the channel from becoming permanently wedged due to missed state 
> updates, and ensures issue_pending() uses the correct configuration state.
> 
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > index b06b299661c02..8b0e2af734da9 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> 
> [ ... ]
> 
> [Severity: High]
> This is a pre-existing issue, but does dw_edma_device_terminate_all() fail to
> actually stop the DMA hardware engine?
> 
> If the hardware stalls (e.g., due to an unresponsive peripheral or AXI bus 
> hang), it looks like the DMA channel could become permanently wedged. When a
> client calls dmaengine_terminate_all() to abort a transfer, the code sets a
> software flag:
> 
> drivers/dma/dw-edma/dw-edma-core.c:dw_edma_device_terminate_all() {
>     ...
>     } else if (chan->request > EDMA_REQ_PAUSE) {
>         err = -EPERM;
>     } else {
>         chan->request = EDMA_REQ_STOP;
>     }
>     ...
> }
> 
> Will this cause the polling loop in dw_edma_wait_termination() to time out 
> if the hardware is stalled and the interrupt never fires? Should the hardware 
> be explicitly stopped rather than relying exclusively on natural completion?
> 
> [Severity: High]
> This is a pre-existing issue, but does the driver fail to implement true 
> infinite looping for DMA_CYCLIC transfers?
> 
> When a client submits a cyclic transfer via device_prep_dma_cyclic(), it is 
> unrolled into a finite list of bursts based on xfer.cyclic.cnt. However, in 
> dw_edma_done_interrupt(), the descriptor appears to be completely finished 
> without calling vchan_cyclic_callback(vd):
> 
> drivers/dma/dw-edma/dw-edma-core.c:dw_edma_done_interrupt() {
>     ...
>     case EDMA_REQ_PAUSE:
>         desc = vd2dw_edma_desc(vd);
>         if (!desc->chunks_alloc) {
>             dw_hdma_set_callback_result(vd,
>                                         DMA_TRANS_NOERROR);
>             list_del(&vd->node);
>             vchan_cookie_complete(vd);
>         }
>     ...
> }
> 
> Will this cause subsystems relying on cyclic DMA (like ALSA for audio) to hang 
> indefinitely while waiting for period completion events?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260715175740.1110404-1-den@valinux.co.jp?part=5
