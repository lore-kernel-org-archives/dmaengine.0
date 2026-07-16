Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020082.outbound.protection.outlook.com [52.101.229.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ED82DA759;
	Thu, 16 Jul 2026 02:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784169869; cv=fail; b=jp8GdqX8IWOPlqBotkSDOn/PWCkS4hqsgW+Z41dpfDh6Ak2yj9aKicSpyKdLSt7/KfSyAUhkG3Dw+FwmPkXBBT3e0GX2oHLflQwtJhBtwNSMrIbZVGEzdvBQpAVqwtS4NoULloLHOsylwWGHJWuufwTjnfznvD7YFLhbcRlOh9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784169869; c=relaxed/simple;
	bh=RjS0nMbR6Txy78/y77UHAylZBLt9Q9GN6l7qwfAU7tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BQjKfWat/zmKTek66hHeHxb61eyGfnrEjtO6ii1U7qNv2+6Bw4hfB+iQZhVW+Vdf6jiK+eg2ogR6ftPcNHDPdHS/zlvDvi6nukWHK23aIHtF7s4vEs7MwqqF1tFMFVlaWdRnOXNTx3aUlFv8moN9+iXSImXGgi9wE3Im+thBbyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=qP+2ppDj; arc=fail smtp.client-ip=52.101.229.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="qP+2ppDj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVzZhrk0D4boV6nV/CxSwpjLzsSKq62rhwFehXq9zNfuC0tw5D/7MjQ3LzHdwZfI3pVvOs8elKLTwA1bf6WRuImQt/CbRgP0Oh5m+8BNzzLpa08LVj0LTkpLo63L4Qn1N0SzA+x63RJXiadApF95jcL5ZN1pLDUPbTdfqjiHzubVI/ZeFfA95ZsI5sWYfnyz+p6POJPgqZr1liv+9mikbP9cQ2C+X92YNZM7Zw1x+7MOCaLNgboc+zIK/v3XyqgwEqgeXy5/X84IEaNMJyY7ZVP+F1KWrtHHj/CHz2ZuyWbUX+DXdUpaWHZeEQ9JhJb0vvwdCrFHtcgWG33ZZCN6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsdqFRAGC5/FIVlMeeVfECmcD5srHTqc3Kzbzgz2/AE=;
 b=WC6mMc8z33kGRWSS4zJ72ZWWk3VTRjMnO1p1CS06TlWySKEOUI3eC+7C4YyJfzpgU44DTfvc+dV3WW3ZJBYP7zS3AoupVqoKi2Y2BN2LUQtHTPLLFt+VMs/fr905IaB7S9iuTKzEIyTnLbbg6TeOHTb6EtJT3FxcJrDF4HZRdtRbfA9imzNsyu3st44wUwoxAs4nYhkGzuKrB8UPvv9koFzar/SXr/mvY8khsGhdQxX4+dFDlRNuz1d0sHV8mMkpxRQL9iK4X029/bLoINTbV+xmJeDnsaX2O9unuA4d5M8qgqZQ/L+USFlDjMF0vNYXcVJvpN9vjSqTzxptb1AFhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsdqFRAGC5/FIVlMeeVfECmcD5srHTqc3Kzbzgz2/AE=;
 b=qP+2ppDjTybrarVui5Oy8AQTW32WYKDmEPYGMYnwvPu12wJFipD6d6JsobgC1GJyLhdaqxo6ODD6OqePblEz71Os44dNyyK8DwWvkqwxhuCDJNUTHAn7S78OEgVfSnMMFBdfITJHchhbTeM/f7Ucocude4Q2NAOS5f10HaXJ1W0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB7461.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:356::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 02:44:25 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 02:44:25 +0000
Date: Thu, 16 Jul 2026 11:44:22 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Cai Huoqing <cai.huoqing@linux.dev>, 
	Serge Semin <fancer.lancer@gmail.com>, Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
	Devendra K Verma <devendra.verma@amd.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/9] dmaengine: dw-edma: Terminate all descriptors
 without callbacks
Message-ID: <2wutlnctay3vtmvb6jlowjmlhzrjlgursq4p55qegyqmllrj6f@7yhhrfemlypg>
References: <20260715175740.1110404-1-den@valinux.co.jp>
 <20260715175740.1110404-3-den@valinux.co.jp>
 <alfXSUuPoz9s7Rx2@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alfXSUuPoz9s7Rx2@SMW015318>
X-ClientProxiedBy: TY4PR01CA0106.jpnprd01.prod.outlook.com
 (2603:1096:405:378::13) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: c9802b0f-62fd-4ce8-3488-08dee2e42521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016|23010399003|4143699003|56012099006|6133799003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	U/2DYpAFKIAvNfEJsS06GgSCbkoGaH7/GrxW0y1/te6jYgBuAKVPpDsTKyJ3VXF+mWJcHpeKhZIqoc3watEbyVnTZrKXn1KmAfOsnbGzYmqwfDKzYWK5ef7ZOrzXst0oNxOXm/3csReZyUe0GYHmj0rByJ41iQeYFCSNlDXOkil+iKXsYolOXDGtoFepri8h7M2BkBltv5WsTO/4k3oof8SXwCw7U+J0ifeN5l+Hv12I8XT1kt/GEhLhvb82WLr0zIGRiABcJL1BtgkANhcavJjl0n7wrsq7iogJmMxrtZml+a835PZeXLyyHQUiZe4kHStMjc8Mi7VquJCeAzH4ND+Oyxz2z38NqMGVsGH3OwcW+XenbZEeiVO5w9zSIdrDIsMP+TrdeDAmYmfqpWbV5bIkoWcPuZlME669ZC/zNhDLR6sT0qH6yH1NG/afgE4UM4EupHVFlqpcl4Rf7hktUj0ECL0Le3bB/TkmqyH3BPC8tfgLX55AAIf0SgmY7hVRWSzVb8ALF5BKaX/QoMVhziCgRSQlsVqAZVwcWQ1ySP0wOQ+ntbLy1B67hVvG6VmARkJ1i5JWeKK8OimsYQuU5Om3JkmmGDU0yXs0wFYc1ujgS45HcTBcML9mH1RbR/plD2Fiq6OPhlXgJPMTj9NneQHoykRsFfO3ZxGXCUl95w0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(23010399003)(4143699003)(56012099006)(6133799003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R00JDabFAPlpqVFBH7Jzq9o+L2IJ9UNxgjAjKSdXzYGVH4XxOylFcnQvqUUD?=
 =?us-ascii?Q?MR6JpUUynZ9kbuFIetvfZB7NZqJrXz6JRxuKRqz8n2KswXW44fXzkLAlUr4R?=
 =?us-ascii?Q?1OiZF3n/chmeo5IMAVRf1Vh9IkqNe9df1/Eu5rM1+btEJAXTwUPf8bKAY/Fc?=
 =?us-ascii?Q?WgXv+RxvMyeUDS91eWv5TQU2keRDihIw0tEPO6HccrxtWy1VI+CLWVJ0m5v5?=
 =?us-ascii?Q?Ls5QEeJmdnK7zdAiUccroKkvjpNtMiFmy7tOhixEN9iulJ5aJQ+HUlGN28Ul?=
 =?us-ascii?Q?niDuNq8k6v0tjRfcHy8QTTswPdVQpl+NQN0TRn7IutaBLx275Tys0Bnm+fVG?=
 =?us-ascii?Q?+Kk5UUgwoX5QxZicdWq4urDURB5O0BL1o00z/VejuZdPqNOb8GdWN4P12qLj?=
 =?us-ascii?Q?7sScxGb4+KCqKptmLMblwQ80DS4cO5n1O0jGFPWJHH7Q/YWMJ1oKJEaNKTY7?=
 =?us-ascii?Q?pal+XnEuWCGDz4BrItGREgmcd8MHyB+mXcZ9Dodgg+ftryOabBgPy3K/iKqA?=
 =?us-ascii?Q?2wS26lb4oGRfkrEN162xJXYLFV9XEb+1qhPJlm7mXqp52fjPdgqCvwb9PZuu?=
 =?us-ascii?Q?kCQ0O7RvVhOjYOpFGhLp2bBS4XphhzoapgmyZIf0lI2yvqRZYV5AQKp19P7Z?=
 =?us-ascii?Q?haLg2sjAj37vHfE6uq2ysh7N7xnncZ+Pav56pfJve6nXkx0nZNTOHvbD16pY?=
 =?us-ascii?Q?9yI63lM50DJOE4xTI6nGB+3AGKSIHhd3lsi012vO4UF45OMeRtqZgekksnDe?=
 =?us-ascii?Q?o7a7+WEBj2NIkXkZnVASwEiAFSmVXpvnMSIACH1CAbmGyWyyq/jkMCpjVR56?=
 =?us-ascii?Q?DWRFGvmi7bPQVDqxx25mKfG4IOudSrD7T38/dDgrcVs/ydB4msEe5zuB9ORo?=
 =?us-ascii?Q?H6qCefScvYN/a4B3g1CUkA37ghm1Hfc6ljIikWcdK+wpOlQxzraFrLjA49fP?=
 =?us-ascii?Q?6YulBdBwMLn2lNBmragADnQY0oxxLMIJoUcDLr4suHj20dou53HleYygpPpe?=
 =?us-ascii?Q?mN2wuQPntQlaoVNgztmAgYIJCLdD3z3uIDizchzG/yAcei8ZrKxpB8HpcV89?=
 =?us-ascii?Q?buPP/DHLM7RfMiHP6hvITamDExMFYGrPeBlg6Zf6Nk8n1FnPQvocV5f3ubL+?=
 =?us-ascii?Q?+eof9qZLaAH+1HvFyM5z60HnDWQSf0FAmsml3ncFdau1C8VaKcqx3NljhR/m?=
 =?us-ascii?Q?EiZDZtF7E2yjLB1GgPy29OHELusC1v17vxjdAZrbSfJky4V6Z2EiPldYR3ua?=
 =?us-ascii?Q?/0gdao/Sem8idt7yPsrkgEv6YGDFg9EebkoZkHa3NcC96+NkXlk/20odWIAS?=
 =?us-ascii?Q?qtoSHxXMvzq9tEDpcduF61//BIL+Vr6YMgOTXbJVmzNWkm76FDdnoI7hC5B4?=
 =?us-ascii?Q?ujjeum1lVz6hXtwbtzLfg/NbGdaIpw87TuLCGFB7GgzpF8ZjEx4QcelP5D2P?=
 =?us-ascii?Q?RRULZDBy2Tf/tsgF7MGGO3hWtSFe1Dn4Ykp9oPU9O0+2DhkmvJlMxVagPJ3z?=
 =?us-ascii?Q?IScq1ygotKq7x9qDertwp65CazWm6fYzNxUFfJTWablOOXjOU0IEfzCJIHIO?=
 =?us-ascii?Q?u7uF9j1WTivWcsCPsopWfPZCO+MV//wftOtbRlH7MsXCogdN0t0c2IkBD5mK?=
 =?us-ascii?Q?ypLMvEWWKBmc1pgxQHFq0wY74jTxZMY4O9AJyeBGo0Ic99ojdJUAzr04l1fq?=
 =?us-ascii?Q?EJwDpxxAwjF/liBmWa+sOfFuTwqcaUr7lVf+JDRnUkKpf1LnWLjInr53zJhA?=
 =?us-ascii?Q?gNyKdCv92dSSh8S7wpP2DVb09VVhwOUKbEJqjMFdTaKgWKjAbI2F?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: c9802b0f-62fd-4ce8-3488-08dee2e42521
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 02:44:23.7540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZiC76FrkeEE6jYJfCLi+6ZCG9EjR8fHMQ4s1tO1jsiM4w4A4plpnQuSuwzApIbvH6Xfdu0aULPekZYbh2aXFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7461

On Wed, Jul 15, 2026 at 01:54:01PM -0500, Frank Li wrote:
> On Thu, Jul 16, 2026 at 02:57:33AM +0900, Koichiro Den wrote:
> > The DMA Engine client documentation says in the "Terminate APIs" section
> > of Documentation/driver-api/dmaengine/client.rst:
> >
> > "No callback functions will be called for any incomplete transfers."
> >
> > dw-edma instead calls vchan_cookie_complete() when a deferred STOP reaches
> > the interrupt handler. This schedules a callback for the active descriptor
> > and leaves other issued or submitted descriptors queued. A late callback
> > after dmaengine_terminate_sync() can dereference client state that has
> > already been freed, while leftover descriptors may later restart into
> > reused buffers or leak.
> >
> > Move all issued and submitted descriptors to the terminated list whenever
> > termination completes. For a pending STOP, do this from both the DONE and
> > ABORT paths. Complete their cookies in order without scheduling callbacks.
> >
> > A STOP can remain pending until the running transfer raises an interrupt.
> > Make device_synchronize() wait until the channel has stopped and
> > terminate_all() deconfigures it before releasing terminated descriptors.
> > Reuse it from free_chan_resources(), then release the remaining virt-dma
> > resources. Sleep instead of busy-polling while waiting, and warn if the
> > existing timeout expires.
> >
> > Fixes: e63d79d1ffcd ("dmaengine: Add Synopsys eDMA IP core driver")
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> > Changes in v3:
> >   - Merge the descriptor cleanup patch so device_synchronize() is safe
> >     when introduced. (Sashiko)
> >   - Handle pending STOP requests from the ABORT path as well.
> >   - Drop a redundant cond_resched() after usleep_range().
> >   - Drop Frank's Reviewed-by tag due to these changes.
> >   - Polish a source comment.
> >
> >  drivers/dma/dw-edma/dw-edma-core.c | 87 ++++++++++++++++++++++++++----
> >  1 file changed, 76 insertions(+), 11 deletions(-)
> >
> ...
> > +static void dw_edma_wait_termination(struct dma_chan *dchan)
> >  {
> > +	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> >  	unsigned long timeout = jiffies + msecs_to_jiffies(5000);
> > -	int ret;
> > +	unsigned long flags;
> > +	bool configured = true;
> >
> > +	/*
> > +	 * dw_edma_device_terminate_all() may defer cleanup to a later interrupt
> > +	 * while the channel is still running. Retry until the channel is
> > +	 * deconfigured, which means termination is complete.
> > +	 */
> >  	while (time_before(jiffies, timeout)) {
> > -		ret = dw_edma_device_terminate_all(dchan);
> > -		if (!ret)
> > -			break;
> > +		dw_edma_device_terminate_all(dchan);
> >
> > -		if (time_after_eq(jiffies, timeout))
> > +		spin_lock_irqsave(&chan->vc.lock, flags);
> > +		configured = chan->configured;
> > +		spin_unlock_irqrestore(&chan->vc.lock, flags);
> > +		if (!configured)
> >  			return;
> >
> > -		cpu_relax();
> > +		usleep_range(1000, 2000);
> 
> now use fsleep()

Thanks for the suggestion. Will update this in v4.

Best regards,
Koichiro

> 
> Frank
