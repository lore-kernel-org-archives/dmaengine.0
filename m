Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011060.outbound.protection.outlook.com [52.101.65.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C26143F08D;
	Wed, 15 Jul 2026 18:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784141656; cv=fail; b=p8wR0g9ElD2jJ6LTv5q4vyDRIG13KXsInkmQw5SDvCAx9CDvAUi9rwgpwMDnnUqZASXzsLHTqr76AguVoOGPSMUCqZRtnub+tKDgvOkypQzHrUcGxi4tqrdZBzdywKPsKqrilI4zNjDSvs53iNMcFBp6ERse4B2Ey6bLlLFYUqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784141656; c=relaxed/simple;
	bh=d6oLR3ojVb5MZGl7yCu3VrMV+3ssSHFShR0UkznYUHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hDoHokSRhb4AR90zbt8NztEsVmvv6Pgo6uEXjFpZAF2rZAAbdxdLvPAzmmJPY0mmwhq4QjbPkRHBfGRt/vU8SqZ+CtTYIanKzq+NWcq5O4ldLQgKukeLk5OV/1uIpavqX4YJKLq5kkoYFghG8DXOWfRjLsqpV1C1YJeTznNwS6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IKQV61VW; arc=fail smtp.client-ip=52.101.65.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IKQV61VW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K2Ch832MHtMa3tpk2hNpB//UMNrlz3wvE6sPPGxRbOPnty/KhLu9axA8dcl9+C3QsqHQoAQST5mndwtnc3kJe6aUHdGfjGSF2thrdtYaw60/tF0D3bHSKTUvgxNoTscqt6Pow62M/Krvj8qbt/Qx1sefDsQD5uCBXKTSRQYgDmAnV1tjHErbtZVHkal02cRPhn2N54iUapc1U5dusneQDoB7IFopmv6ELbDJlQByXHDetE7S7qlXQcyFB9r3ySbhQgDj67gnK1mhmssT4FlE9py7i+KRI2luEr1PqqPs6YekMUd0AlN/pr9YrBT1yZRnef2WAukkBSDMI6cKVwIW1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7c1CZ9IU4cVyewPc7oFatuWtoo5iS+D47OGFwYOk3E=;
 b=f9Em4/aV+F24sRqq+ACiN0ga4B664FRlopjyWTGDdNCf9tFgFmmK2JYSuIFELJ73thf6NO9lwgaYOWx39NM9BXftwtq7D59K9bmFI62iYrzg/fWqVZeH/odt3K0NJ6htRj+ulQ7VR8CD0lu3BO7jkbslU63sNAujmSVK21f1is48x8ykZdq/Ks0bOaYnoOKxnYpHRQ4256FhU9xRalfSMVeAPGOZO06d7Liwewthm+HuwnJrmLAEnYhGmp4xHLsevbCc+2mcDCWTInCVASeJXBLzHTdGZunyGN6ndOczr3Rim7+hOak3ybpe5yuIGgDPownF/G1Rj3G6gb7+auHuJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7c1CZ9IU4cVyewPc7oFatuWtoo5iS+D47OGFwYOk3E=;
 b=IKQV61VWWrpjOg8V68CFUxnZX6w6XrAW7gGPuVzJ3MrN4sj4xSE2hYVa6zc0RxqW0vtQY7OEf5IxFs3Ez9JsjIE5OSnt7F9dnZNkCjqIvpVhDVbGNs2n8UHAWgzle8lPmAcytE3WvL1//HgvCP5wGh12QyEd/UdEtEZ9oqvZNK0PwdLa5grDrrVPoKUY/BT+ypTZzEVGjGnpHn0ib9vx+I81WudcooYDYlUs19DVwCS6YFF4hMinxUctMj8KqStHwtlBuW2t9VE77c6COw6rDOZnH8ZHwGA6EW9Zu52HMVRJPbA5eMT6makhnVFm7udZOi8dPRrjknYx5L78QxU/cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB7822.eurprd04.prod.outlook.com (2603:10a6:102:b8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 18:54:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Wed, 15 Jul 2026
 18:54:10 +0000
Date: Wed, 15 Jul 2026 13:54:01 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Cai Huoqing <cai.huoqing@linux.dev>,
	Serge Semin <fancer.lancer@gmail.com>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/9] dmaengine: dw-edma: Terminate all descriptors
 without callbacks
Message-ID: <alfXSUuPoz9s7Rx2@SMW015318>
References: <20260715175740.1110404-1-den@valinux.co.jp>
 <20260715175740.1110404-3-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715175740.1110404-3-den@valinux.co.jp>
X-ClientProxiedBy: PH7P221CA0090.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::25) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: 486b4216-9cf2-4528-3671-08dee2a27401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|23010399003|7416014|376014|366016|6133799003|18002099003|22082099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ts2Sigcod5hFStcEvWAermt7K4UchSyZVmzAJns1ZmvE8ptfBUhCKF7EG8QBI9DXjOXthfJJdRZiuAWAbn6/dZKLrnJVcHIeIkQxM8fVYoSztUJyhI3EYM64AQzDH1JCFzkF1C0rvWiTINt3wTUtX4+kII5YCcnntW5TqBQKNmjQ4ZL62I6+AjNzAGslOpi3o/U7dk/CimGqq5H/dfIobOVjislhW1JkYNTVKimFwl4Lh8m0eKinMZdHl3pqSZSy8AzkJ3i69UbXJtRU0pOfm7ibnU4SHczUyhkx0XRJFrgx/hgvGfH43t8oYv36eijjfptUON1mC/ds+DfyJW9eYTltMr1leLEYvR+X5MSe19p74e7i0gmPEzR5nLZZkRwVfGGaYUxduyoC0vkdzzHl4oYWSN1lx+2KCWs7nIEaVaONZKy7qRW9MaM+AP1PfJtWND0IjFqLe0J9UCqMOlXPEQC6pzWk5gjPUwOb8leKaY5fl1BS2+bBWY7aG2Risr8ita8PE0Jlf4q/aA/iu6sb2wG9Nz0VJC2Zuo2BlCFb+vbCshplJX4JvqH96noEioxrvpypD0Iy0TLSrfhbonyTLLhgRXULSuiVdw+xfQcMMHXQDAZiyUcTA85o5HdswmuuIRWi+F19Jl06YpcQA0M7QZZ83iOv98B9t2RBP75+i+0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(7416014)(376014)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?84mtt5qlruDE0Jk5zOdM9vpSjt3EiiLtgg4A/lnBC9kzj0l+7yNAZXtt0+Oj?=
 =?us-ascii?Q?qrIXJOO6bp+Bu8mITHbd1evVI600+JAAq46BJ+hS5+XWsNZnMowEHAGlT7tC?=
 =?us-ascii?Q?TS5rTUkjDKGO/w59DklstBdrEh91PLPepPDERdocOzyyYGVu9NyP7YpF2NDb?=
 =?us-ascii?Q?rR+4FVoLrZpU2nP9ubI3CQF2ju/xzDacHuqz3PtD3numm2asNiV5CZV+2gWF?=
 =?us-ascii?Q?g18fdqecqGkO5Ij3r7LcXf5cH2mmjUFYN0+pqKc1f8ynXDhO6JUZGzDFKKVG?=
 =?us-ascii?Q?7QSSvmM9TuT2dYdxXBdzeHSjQIEnLR9gVVb18U0LTqNCdPPsV4Q6Ip2DF5Gi?=
 =?us-ascii?Q?Igh/KAk8hg3oxl/hjc2Bs5oCCBSNJIlA4h2XIID7iEVavp6Qizzbzq82zKiv?=
 =?us-ascii?Q?Ha9d9ZSEyqRhEaCRF0qc3LH8ItD+BP4Mdg4xgXk7uqHMkH1hnWA+KzJcYbv+?=
 =?us-ascii?Q?0NMj5B41CpyIP9tBqweAtGArVgX6RfEoufyXdWUdAUd8o0c6F7dtY6Y8jcmC?=
 =?us-ascii?Q?SVZ76bY+aSLdLTLckFl8JPc3z/0a+Bxa1nPhBat93tm/ey9pSI5CpmadkOlJ?=
 =?us-ascii?Q?eH5aJXsIpX1kxYX7In+TvYTNaN3OMCP5gecnSrps2SXQBEh9XffQUlWJcOBc?=
 =?us-ascii?Q?TwJKv8v5FNFt4lkpeAmec0TP16oivhsIiUdwUHv+7bGfRC/ZTMJi/jrA50lg?=
 =?us-ascii?Q?itFPkIJr0w36CyM+SzutMjchh9cyVCBS6kwjz2+lTXX3h2MfCzZOScTRzhma?=
 =?us-ascii?Q?w0MEtCAmyOoKhIIViJtS0nDh1Ks3IXyqZJwkktJGj5NiTHyHYoImoc1IqNPb?=
 =?us-ascii?Q?SBQ69tWyUVMgqfbcuolR3yZ+igW5XvKdZeF83Ijovy867PlUbeSaDofj21dV?=
 =?us-ascii?Q?ivZV4EBmW/T8TSHtz++QoVPsr0pZizs92EWD1D/le904Fdu0gtsnXnakEdUK?=
 =?us-ascii?Q?OKEdxfSyMvktoVsxi7JnBYOojGEu+ZkOqnmGi3LRImMPUwXzCCAla/Dn2f0C?=
 =?us-ascii?Q?DDYQU49KbnEAoSPvkGLTWT2hd38ZcTN7yLQ8xknpxyWrCwXLfeRAYMezg7n8?=
 =?us-ascii?Q?QccK+RMT1cpw4id1LvS7LCH6a+CAXBxAWvpf/vjfY0GQ9rEzLsXGZ5dlHnzV?=
 =?us-ascii?Q?kXHp98JBTIgph6uW1b5XkG1rhpGRpgWe0MnyP5y55ylx1CgE187pz/sPs4Gk?=
 =?us-ascii?Q?lv9VSuEzf5mz1Os1PvNWFsDYvvPGJlIyYhwZCF2lJNuV3sWC7Ob3LlVy/Vlk?=
 =?us-ascii?Q?/s2+b8FivV1IHDUO7pW8oo/vK5rSaQ6B1wfNrUToXIHgaBdeUbOaH/dua4nP?=
 =?us-ascii?Q?FfNcMWlt5AijWo8ahuljWVl/1UMiE/4AENQpCxEau6QnXBv+NBRJKLCJjLw+?=
 =?us-ascii?Q?JNIxQOjiZYPBitEr5ZtD8jXW8i16dzvv6Z7wf5aV6VhFZQnZgjUQlXtaauoC?=
 =?us-ascii?Q?OTJs7JGkvL+y6jdOYpBP+Tn9pKoknfaielLSNSLbeAIpVVcZdrRhAsHo4SWg?=
 =?us-ascii?Q?94EBfxVlyNX4ECS/T17HP0dziGPATraiiJND8vwtM+gskLsImP7ovWz8X5XP?=
 =?us-ascii?Q?BRCiOOxEbKIHaeH9HNPuHhNE8eoe/s0JJemKYwLboYS4vPQeFFQc6vxlwvj/?=
 =?us-ascii?Q?t9R12q4TA084PczlDnXCUWftCsTjd9f3RghwjLJLtu8x4Vyvxv8QNbfgTfkI?=
 =?us-ascii?Q?xtmgOKqYw53N4mnHAnJ1KKNMK/OtBaDwDILtB3wFU9Cj36P4gcDKrILSEFfA?=
 =?us-ascii?Q?GYAMN1NQNN68JDLF5mQBPUfQPXBeGXFQMklOLd6OOTC01voKG8W4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 486b4216-9cf2-4528-3671-08dee2a27401
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 18:54:10.0166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3dY3nzv3CEcJzihWGBusn2/lpy5128NgKY9muLoxgqgIWZzmhNBMbaDhrsXaN7RIfB8m9iv71Xr5iPOG/IhfMsAFzKPW+YlMds+uBka6ndDISy8Pu+S9GbMbe+KUb38
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7822

On Thu, Jul 16, 2026 at 02:57:33AM +0900, Koichiro Den wrote:
> The DMA Engine client documentation says in the "Terminate APIs" section
> of Documentation/driver-api/dmaengine/client.rst:
>
> "No callback functions will be called for any incomplete transfers."
>
> dw-edma instead calls vchan_cookie_complete() when a deferred STOP reaches
> the interrupt handler. This schedules a callback for the active descriptor
> and leaves other issued or submitted descriptors queued. A late callback
> after dmaengine_terminate_sync() can dereference client state that has
> already been freed, while leftover descriptors may later restart into
> reused buffers or leak.
>
> Move all issued and submitted descriptors to the terminated list whenever
> termination completes. For a pending STOP, do this from both the DONE and
> ABORT paths. Complete their cookies in order without scheduling callbacks.
>
> A STOP can remain pending until the running transfer raises an interrupt.
> Make device_synchronize() wait until the channel has stopped and
> terminate_all() deconfigures it before releasing terminated descriptors.
> Reuse it from free_chan_resources(), then release the remaining virt-dma
> resources. Sleep instead of busy-polling while waiting, and warn if the
> existing timeout expires.
>
> Fixes: e63d79d1ffcd ("dmaengine: Add Synopsys eDMA IP core driver")
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v3:
>   - Merge the descriptor cleanup patch so device_synchronize() is safe
>     when introduced. (Sashiko)
>   - Handle pending STOP requests from the ABORT path as well.
>   - Drop a redundant cond_resched() after usleep_range().
>   - Drop Frank's Reviewed-by tag due to these changes.
>   - Polish a source comment.
>
>  drivers/dma/dw-edma/dw-edma-core.c | 87 ++++++++++++++++++++++++++----
>  1 file changed, 76 insertions(+), 11 deletions(-)
>
...
> +static void dw_edma_wait_termination(struct dma_chan *dchan)
>  {
> +	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
>  	unsigned long timeout = jiffies + msecs_to_jiffies(5000);
> -	int ret;
> +	unsigned long flags;
> +	bool configured = true;
>
> +	/*
> +	 * dw_edma_device_terminate_all() may defer cleanup to a later interrupt
> +	 * while the channel is still running. Retry until the channel is
> +	 * deconfigured, which means termination is complete.
> +	 */
>  	while (time_before(jiffies, timeout)) {
> -		ret = dw_edma_device_terminate_all(dchan);
> -		if (!ret)
> -			break;
> +		dw_edma_device_terminate_all(dchan);
>
> -		if (time_after_eq(jiffies, timeout))
> +		spin_lock_irqsave(&chan->vc.lock, flags);
> +		configured = chan->configured;
> +		spin_unlock_irqrestore(&chan->vc.lock, flags);
> +		if (!configured)
>  			return;
>
> -		cpu_relax();
> +		usleep_range(1000, 2000);

now use fsleep()

Frank
