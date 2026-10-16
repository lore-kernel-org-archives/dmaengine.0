Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013004.outbound.protection.outlook.com [52.101.83.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CE436A352;
	Fri, 16 Oct 2026 14:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160754; cv=fail; b=CRj8GcxuAGQdoo3e+5OJHbkkunCi+SyXtUnTYIIIFnB6NJKYzDHkhigNZrhloogZ6E38odVGyXb28ReqFGApN81ztGjha9fovv3/NwaWuuDMbCE2+OfZB+3yYCNxZv0Z+Aww5BsYYj1InjKJFMUJxcaXlOtoEOvqxdHfwnI4ZsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160754; c=relaxed/simple;
	bh=Dcqi3Bg446Wu/NbJKWL1VPuvYoP5pj+ztIFKoYU4ks8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UZbpLenaRsA/37VxtH2Zrd0/0jAT8DRzG5nxQn0UfjCte8Nvr45VoSE9btEFK3OlRGnZQgQu1QN5g4dnLcfQYBZwZO7tKZayDqJIMiVD8qVqACm/uDiqswhoENDPhp3Z5v1d06TW/YQf/Djdg7Wb+lvurWUeU/U7KF8hpglG/gs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=i8FJ4Exa; arc=fail smtp.client-ip=52.101.83.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="i8FJ4Exa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytAJWVQR5i1+FFsDRphfr3dJSUimmmOGq5a9HanDEo79AriPr7Ly8i48y8HrydNmLUQeyLIYOLVpKdDz0zEJu/qaS+ZS8BRQzPosIkaiZvLN7VNAk4mDoLS3XdQwadhYy4LDLF78kBgzH9VEpJE8cC24PWcUINf5UMuEhafbIsQ2gSGP7iqtPWmHGd5LqAeYyD0yvSfh4fTVVyLc9X+u+jlplAnnIs9IPrJKkDZ4CLzIxL9FklQD6dO9puCzEtbtVvpBqpk9xHjX6l1NunAIPHioQxZYm/cUaQ1Cw3f8xt7s9tUJ6Heze8yJEnRZa05YAdO9aC6uRgEjYHxqF5Rt/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/CpUGFNHnRtQhZdz8eu6+WLRq1ugqgqW5aUjKNdWMY=;
 b=JOx3Ysa9nwaczz4MXNgyHh8MjQsQE5gHbTJAiwwYR7lhFBhqpcfYBlkRKIZz5aSshIgD0YZ0SVjWH1d1HOOuh9OqP4N3w6Ajyaph9y+/uqyVmUyItW7iPAoKuSTB6Wl1VKtD6Fq6X8o6W6FR5RrpvV25LyNZVAvEZxL/o2OOa3e+h/4NhVYnYqMnxnGgVjk+5umn2TFupWbyoFdT8vaNFeNZ4NCCdiQsHSeympdvSmT2iNqRu1Y54m5aE8o+TiHyMmqL7l9BkM54aJmj8XIGlkxR4Sg6DfzLOhynQkMsGoNIDoI3+NgGpATujvdwKEP9+01quzuNSyzmfNfr5NrJDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/CpUGFNHnRtQhZdz8eu6+WLRq1ugqgqW5aUjKNdWMY=;
 b=i8FJ4ExaOrU1geTz3KHARg7qykrZYExfHNeAClCW1NTiz9p+VBliKCTCNBrqQg9fFNUWBhK1czmfg43JSY3If05PAs89oU0oQiDFofy93EFaeLalsjSbSd0OOfkmMXvMA2WWwB604u43O5gF/2z36bK8k7yXsfd3U5i+TixGvOyaOEY2IzSWp1E0gU6skqXJ5gP/aF1pc1Apzkknyt2POJJx39eLNjLEkfyarfSGPW378vnIGR46JQNOWxpUP6Nti5CME9NFmIM3yWcib0p246AdkYkJA58tqUICbu0sqe7NBrZJP7Bedhy5RSkHVHRjAFAy3Usj0xv9PXz2HjPJQw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB473359.eurprd04.prod.outlook.com (2603:10a6:20b:7db::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 14:25:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 14:25:49 +0000
Date: Fri, 16 Oct 2026 09:25:41 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: founder@crepuse.com
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, krzk@kernel.org,
	ulfh@kernel.org, Frank.Li@kernel.org, m.szyprowski@samsung.com,
	huibin.hong@rock-chips.com, rmk+kernel@arm.linux.org.uk,
	sugar.zhang@rock-chips.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dmaengine: pl330: Fix unbalanced runtime PM
Message-ID: <atIz5ZsJNUZ1ocE7@SMW015318>
References: <1650450456-34351-1-git-send-email-sugar.zhang@rock-chips.com>
 <20261015-review-pl330-pm-original-v3-v3-1-5be09f37df77@crepuse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-review-pl330-pm-original-v3-v3-1-5be09f37df77@crepuse.com>
X-ClientProxiedBy: PH7PR17CA0060.namprd17.prod.outlook.com
 (2603:10b6:510:325::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB473359:EE_
X-MS-Office365-Filtering-Correlation-Id: af26b43e-71f0-45b4-cfe2-08df2b916052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|7416014|376014|366016|6133799003|18002099003|22082099003|10067099003|260925021911599003|260925022911599003|260925021311599003|4143699003|261009223027099003|261009221227099003|261009223327099003|261009220027099003|261009221727099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ApajqXrbSvF6BGzXuVGGGCT5FGDva5G6zvvwNvvK3SZIf0hKqCB6KNUzSPdt2U+9VwdlPQT5hHyl8+F+9FIO5CYfHToDh0RTFujffEWVJBap2Gj3vlxOcD5VvYlYCRnIXl1c3LXSdmf+Bvpf6/14tVml6XRubtD2Dg1WTS9n7gyhz76oHrKFIYjWoTBLmMWSRGb3RiMtcsdtS638i52lrk1AEP4cyRngmxjaYJ1qVQl7tZp/MxlehEvp8nUADV9ZbLZh9+h5Zjj4RrEPN+Mm2apxnPldlTA046ARSk+59OjF9jjGhxs5RVkHrUC4/gtCpGaOa0RBJJYVNddu4XPZYGHpN5BOLfkF1HyysnRIilof0psVMptmkKLTl88hui7ENBa3pjOpvCFmlvAPomjhV50yQ7ynoCLZ50J7ommMqKXAy9s9gkBczU8dgrSX8C0jb/6wmjpaxEZdUj5Xgu9f6NJwYLFQDICjs1ugT0X91ulF5i63RX88Fyz0sHatsxFGwkmevWdJ6zyF3Cw8haYz/sB+YNrlK/dcdeFfMcSnRTxgNzVB1prk1z4lZ56HHyb/JIpkCUCbO5P7gFo8obCet0MlcmCq7sG76L4rBUV1m+IfM/jXzTo+mG+siZExu+CQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(7416014)(376014)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(260925021911599003)(260925022911599003)(260925021311599003)(4143699003)(261009223027099003)(261009221227099003)(261009223327099003)(261009220027099003)(261009221727099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FI8ehN1fOPKfWUCGjAkRjh472brTSREw7B3+5hY7UcT8eKekMyzR16EJKZ/v?=
 =?us-ascii?Q?r6xrbdmZT/pvZ9uFLphvGOt0FrDUlRi+eHJC5/MxTsJgtme+883pWp6oypJX?=
 =?us-ascii?Q?7AS08FerHQ5PnKyQMb5ktkebCETgIbjal5jzA3JKHji0VbT4YOHh6KujAdYw?=
 =?us-ascii?Q?jO/jOyutok+SzsjD+B13+m5Y7s8OEyJVnMAa5Lpezo3s3O7a9iI99S02b40R?=
 =?us-ascii?Q?3RLw8njmfgRQoKG0MZiq87xm50pEU5Iw/lXjyPOjEI43enHR3fN/Kb27HKbo?=
 =?us-ascii?Q?PRK7Jw2y1MR91/1JGOBjwzd7jyvKxa5ygY9HUv/hm0hKzla5xKFKDwjcySdg?=
 =?us-ascii?Q?dULmiTzVfSvpGILD9D1u2D6sx9iTy9p8r51csiijtsB7KfSmEN3lXIEhWtDk?=
 =?us-ascii?Q?UrI8XYcTgwCXvcGrbHQgMa1R5pAryfV3CmdEgyRHdSyI1pyvs3ATpQcd8wnV?=
 =?us-ascii?Q?FbbzuX28qvLZdE+fGDyRWP932A6uitEYrvFxkOjUZGMz9sDwK971/trEwKbv?=
 =?us-ascii?Q?9YZJ9+ex6lgZPt4hDmAiKmWpaCJEgiRvbJxG3XC9bcwUzq2s1ZCHIHMtXHSX?=
 =?us-ascii?Q?lj89JXSa7yRfCVWOfQycT1NNTk8RUONUz2MWEK/QzMeeBAf4Iq6n2co8Vn+O?=
 =?us-ascii?Q?N630nvnDqODxvQVd8arSi3FAycq3uFXpGoXy5aOZrec+iE7yDV03M6fum3jS?=
 =?us-ascii?Q?gPqgO5zGwceE9ld3gmxV2ahJwGsYkm22AC0Bpb3BlLYZdYw90ZgswGF0eqJY?=
 =?us-ascii?Q?c/y54eVsmUnQgMZTwPNfK1Xf8M0ps4+PAtgR7NaXaR+je9U/qe14e364HA3E?=
 =?us-ascii?Q?uN8YbIUZWNN1ssqsUGgbbz0AOlDjN4Qc+Wwyl6JQ6s4/oy6jGjFjckUXt3LL?=
 =?us-ascii?Q?i77gqG5m4p5fzt+EABIJtvNIjlVHHJuORdfPxzvvaml/BtwqCe2RtV43LDvC?=
 =?us-ascii?Q?wRXok3yIHucE2l5sfvXGXsGAz/8nC3qUjlWMrWL2f5FIA6A7XaZKqppozmyb?=
 =?us-ascii?Q?3IAEOFVq0VOtBHpE5RUSmAJGG5XN31Xew/fqoc1pqQzjhzrT36PmFpICB4w6?=
 =?us-ascii?Q?DxHOA7BHEJAxoLjkBqpHg0oVSd9UrHc4/NtdblQ6dN5feJcHK7nPbSvdZCwt?=
 =?us-ascii?Q?70by2JqBCT0j4ZWVM2bVTlV4mXc3KabLqcmG/2dQBiDPXYYYjbA+12eSyY+S?=
 =?us-ascii?Q?wlJWO2aFE34HEFwPtjWlCartdP03WgfAq9UMc/D/vvZjUJtEE4EgdI+H2hic?=
 =?us-ascii?Q?cw0cT4n4uUgzU9ZCh/86/vEhlLnQX7AFr6DDxqA77OjvrqXJmlW2jl7vdBya?=
 =?us-ascii?Q?qVYqiqzpzUfp7NrWyDowKY49BPCt2AAbLi30jACdQoSDl5uNnCvvz6wws0X+?=
 =?us-ascii?Q?lIzugL471v/bQzBHg0HmvQhd2LYJ9M88MsAC9YtVVKumca4JiManNKqMc0F2?=
 =?us-ascii?Q?RwBXAPnhjQRe9MOyWk3SVnPlVnJWRzwrIBFYUN0XmP8asEjlkP73RBcnntxq?=
 =?us-ascii?Q?QJ6fQyYWak6eHiMzSIEbaFngF0+LCFVut8fIj1OS8j1UzlzTrvIaENb2Slyy?=
 =?us-ascii?Q?UgoRJDBnQDNc20nvhG0wbCHTx5uSv5KLKNJ9n4vJSj5dQpuko/4zJKiQu4wE?=
 =?us-ascii?Q?VQYRa+S0GAEIFz/+n/A0vpMxnBRW9uCZdS8OnbEFS+w6muY9goZApDrduvdB?=
 =?us-ascii?Q?e0d0OUadTZlykZdvAY4Te0Mt7I0aniVDA5peyEAdgcicl1CG7GiwsbReBTWp?=
 =?us-ascii?Q?QI00rDz+VJCArZ0HSN4LLAE8Ul56oSqReQkyV4RmRtz52upBxLU2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af26b43e-71f0-45b4-cfe2-08df2b916052
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 14:25:49.9168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CelwtAndIAwyL4wQIl6IlmqfqFg/8V3XC+4kuH1IC692Mfn3ktJm0u0qDmW4zv61LeS3YfHJZcenlTWJnCKmxM3XlTYCLaJZJVSSxOfehQKn9aY4OFiPsAnC/SF5BRq/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB473359

On Thu, Oct 15, 2026 at 07:58:08AM +0800, Mizuno Miotsuki via B4 Relay wrote:
> [You don't often get email from devnull+founder.crepuse.com@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Sugar Zhang <sugar.zhang@rock-chips.com>
>
> This driver use runtime PM autosuspend mechanism to manager clk.
>
>   pm_runtime_use_autosuspend(&adev->dev);
>   pm_runtime_set_autosuspend_delay(&adev->dev, PL330_AUTOSUSPEND_DELAY);
>
> So, after ref count reached to zero, it will enter suspend
> after the delay time elapsed.
>
> The unbalanced PM:
>
> * May cause dmac the next start failed.
> * May cause dmac read unexpected state.
> * May cause dmac stall if power down happen at the middle of the transfer.
>   e.g. may lose ack from AXI bus and stall.
>
> Considering the following situation:
>
>       DMA TERMINATE               TASKLET ROUTINE
>             |                            |
>             |                       issue_pending
>             |                            |
>             |                     pch->active = true
>             |                       pm_runtime_get
>   pm_runtime_put(if active)              |
>     pch->active = false                  |
>             |                      work_list empty
>             |                            |
>             |                     pm_runtime_put(unconditional)
>             |                            |
>
> At this point, it's unbalanced(1 get / 2 put).
>
> After this patch:
>
>       DMA TERMINATE               TASKLET ROUTINE
>             |                            |
>             |                       issue_pending
>             |                            |
>             |                     pch->active = true
>             |                       pm_runtime_get
>   pm_runtime_put(if active)              |
>     pch->active = false                  |
>             |                      work_list empty
>             |                            |
>             |                   pm_runtime_put(if active)
>             |                            |

But if without lock, sequency May

             |                     pch->active = true
             |                       pm_runtime_get
             |                            |
                                          |
             |                      work_list empty
             |                            |
             |                   pm_runtime_put(if active)
             |                            |
   pm_runtime_put(if active)
        pch->active = false

so put will call twice.

Without resolve thread DMA TERMINATE and TASKLET ROUTINE's sync problem,
it is hard to fix it.

Frank

>
> Now, it's balanced(1 get / 1 put).
>
> Fixes: 5c9e6c2b2ba3 ("dmaengine: pl330: Fix runtime PM support for terminated transfers")
> Fixes: ae43b3289186 ("ARM: 8202/1: dmaengine: pl330: Add runtime Power Management support v12")
>
> Link: https://lore.kernel.org/r/1650450456-34351-1-git-send-email-sugar.zhang@rock-chips.com
> Signed-off-by: Huibin Hong <huibin.hong@rock-chips.com>
> Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
> Signed-off-by: Mizuno Miotsuki <founder@crepuse.com>
> ---
> Hi Vinod, Sugar and Huibin,
>
> I am forwarding Sugar's April 2022 v2 as v3, with the same one-line
> change, original authorship and original Signed-off-by chain. The
> original submission is linked in the commit message. I found no mainline
> merge or revert of this change; current dmaengine fixes, next and master
> still use the unconditional assignment.
>
> Our SaneBSP investigation on an RK3308B UNIHIKER M10 independently
> rediscovered the same accounting issue. The experimental G-only kernel
> logged:
>
>   dma-pl330 ff2c0000.dma-controller: Runtime PM usage count underflow!
>
> The subsequent H kernel, which included this gate, did not report the
> warning during a four-rate 62.625 MiB qualification and a bounded serdev
> regression. H also contains other changes, and G/H were experimental
> kernels. This is additional runtime evidence, not an isolated hardware
> proof of this one-line fix on upstream. None of the experimental cyclic
> DMA modifications is included here.
>
> A source-anchored reference-count model reproduces the extra put after
> termination in the old path and balances the active-gated path, including
> cyclic requeue. That is a model, not a compiled-kernel race reproducer.
>
> Validation of this rebased patch:
> - ARM64 W=1 drivers/dma/pl330.o build on dmaengine/fixes.
> - Strict checkpatch, including the two historical Fixes IDs.
> - Clean application on current dmaengine fixes/next/master and mainline.
>
> Would you reconsider the outstanding patch? Please let us know if there
> was an objection or an alternative fix outside the archived discussion.
>
> Changes in v3:
> - Rebase the unchanged code change onto dmaengine/fixes, Linux 7.3-rc4.
> - Add an archival Link to the original v2.
> - Preserve the original author, commit explanation, Fixes and DCO trailers.
> - Add the bounded new evidence and validation here, outside the commit.
>
> Changes in v2 (Sugar, 2022):
> - Update the commit message following Vinod's suggestions.
>
> Regards,
> Mizuno Miotsuki
> ---
>  drivers/dma/pl330.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index 6214d9000..17264a05d 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -2090,7 +2090,7 @@ static void pl330_tasklet(struct tasklet_struct *t)
>                 spin_lock(&pch->thread->dmac->lock);
>                 _stop(pch->thread);
>                 spin_unlock(&pch->thread->dmac->lock);
> -               power_down = true;
> +               power_down = pch->active;
>                 pch->active = false;
>         } else {
>                 /* Make sure the PL330 Channel thread is active */
>
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> change-id: 20261015-review-pl330-pm-original-v3-be881d29c3bf
>
> Best regards,
> --
> Mizuno Miotsuki <founder@crepuse.com>
>
>
