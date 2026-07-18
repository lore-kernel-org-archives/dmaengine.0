Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6696B330D34;
	Sat, 18 Jul 2026 14:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784384303; cv=fail; b=Nv/ge3XGtPCgwwzJr9XBbhLfr2vw2M/Nt1inbORBzwT6GWeZ45e8PH/kj6wsAkeH5juMN9EqvlTkTEC3+LvBn3ZJTmJHx09fTWkAV/virTkGNJyybG+7myU0D+N1fc0Xd2rI9wLoHwzDsmxKFmkpPKR52CoJTsAC5DepKDyEuyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784384303; c=relaxed/simple;
	bh=gKGHV9tfdB0tQQzc581H8Yjzl3mDOQz7SaLBX7lkZ8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tBykb9buyx0JIoJgdcP1aZwmeqLToI+gIN23iyuOpx3KLXSQblckSBQhojAsCGXQGFGzm9DrFvw6gPvaTNElSpLAU13zGYKl64QPbeDSm91gkd6ZdRpSx9Xd3/6lPdDHhkMMcd5nkqG2DBC+i9+PsHvHGvgCvFGwbHIaa/sBeBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=d1ldkz+V; arc=fail smtp.client-ip=52.101.65.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="d1ldkz+V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxIo+PDkAxaWBuGamvRvQleza0FfKo4xSlngY7nfpBB2bm1lKa5awSdc4AZMZnJnfFPehcOoO8UsNVeVqSQVBnLetNjXf9dZBTGqJRRlUYp1TpDi2PqXqyIBpxDoMWVB9mBnaFua/Vrlg+nRWElxKgCMPTopaqbV28rCWWO+vIOIbRoODbSFqwqSQbOCdJWXxj18m6PRctA6HI+Fooy3VlM6maR3aO2eLbMaYzo9KFdf4QegXHodqF7etup2Kgt9t8eKpeSYzzonKbcQprjkwXpbB2fFdTzzk6hipw5HAFC+3O8vqgmJKczon+PHqCpA7He5iPW9b1EezMuUUGLtYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ootSh9cOD+hCXGxIjA8luJzO1ff9Wn0Q23ibw+Z+kE8=;
 b=U0oqAMiYkwFhcE7T9FQMx5t9kKnJDgNMpvPHNpimHj4J0CWA8O36w0n7XvXlVIveTlhs3hzod4g29jdVvPG3jgoCNdu06IerRSragGbgVAZEL0yVQdOXfOHdTEgm3AvQiddvIzlzMAe8hmZTkb3HfF3nPKpzNfqQOwMlg0sntVAs1zJmn0wkSwpTtHcONPtic7uPJm4hFpWph4a7zLANI362Hzo0vuK+ZEWDHozgvSHZitWrR2YcHSIKA0HNnNzhrXSDNhlyzCP+Vobxl41kCMjClXeT/+Oa7zf/BP4++GuAE+kiasMLSfnDXhTwWSs+OACCIERjSNThuqnA5D8j5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ootSh9cOD+hCXGxIjA8luJzO1ff9Wn0Q23ibw+Z+kE8=;
 b=d1ldkz+VCCGySLGvxkcoH6Kl6Rvh8TDG6dRjocxtlQs909OqCXX5CJkwPFhBJmNWerIiEqieOhUruC+saLBWOQNCDTPQZwj+TI0yB7i/TXS1pCsl3J+5VZsK/aFhMSMfP+c0HT5Zm7WSmkdU5gpImTqBfNywuFWK/pYcMzIpPBXdHVjwhyFPN1dniojkJgHx9AfLFqOlCnqt7irRs5E5IWhY+T+qwm6U5EZCVwqzp6gWUuuQpas/DPccNZaIbwajnqlZPZyTSGuP+fNM1evX+KgAcch6hVBoh+y+RggGawaG2Abu0D+mZ3w7tqwh7HsypxrU5BxPUIvPbWkLtA4w5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB6895.eurprd04.prod.outlook.com (2603:10a6:803:13b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.14; Sat, 18 Jul
 2026 14:18:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.012; Sat, 18 Jul 2026
 14:18:14 +0000
Date: Sat, 18 Jul 2026 09:18:05 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: fsl_raid: replace in_be32/out_be32 with
 ioread32be/iowrite32be
Message-ID: <aluLHfpFnH98akBc@SMW015318>
References: <20260718033122.2372985-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718033122.2372985-1-rosenp@gmail.com>
X-ClientProxiedBy: SA0PR11CA0003.namprd11.prod.outlook.com
 (2603:10b6:806:d3::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: 3696e8ca-cd44-455e-816c-08dee4d767a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|23010399003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HtsAjmOh1jDWs1RxSnKfSeB9alcy3r4qliQe/2mOyaIx44zv/kShqok7W5AKs+zp1+3KbVuS19pbaUiQ/DoACD+29YcEVyvnxjRhYRfvp5ZRcaqJmoNh/wZqlngwaxLAj0wnd/wKfoWThYC8FxIG9vtV3WhEshNh0p7sjc2wIteZUEGRuW632m7Fg99GETbxYE15SHNBXaXAUHbM196s0wUxa2xY9l/zPwoDXZ1JDTkL83X3RpCxYMdEL0hMehUmOpwYjOTWCHrwcgaZZIfHs8ea5dN4XsUvGPy6xknr1xOAYyIFQQxIKe/AVAEwEBT+2HWaXL3zNGa8VVZcr3adYcPF71vqWot19qetkWrZd7fedNkKtEMq8jbRzHDcRaBnMOQjDijUUrPjV6pLGjY9ogTI1D1rWB1QO0kSqVa/EDafy9Vb2RbmNDFdaonaj7hNNSmU7e/YEfw8ja4nZQ7nVEoG3BWA7ZDygQKAOkgXSeBIJk2KyNuk35ApV48wepgEoR+Zt/z/CqEM6QSYcUKegKFEgXkIqMptnLOZU27zo72p+W+YrQt1qj7a9eaM3nSJf3oui0XA9vnxl1C9Gg0tlpTkKaGkc3bmux3Rxj04rAU/bhdoukbEDj9IeRUpCYDt4bmjVGr7m55PNrLRAs5uQuKyV1XMhktaEX/YzjayNtA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(23010399003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TuIzB5n7oXeU+BL9uK4AHELG+1bjEJCq/NQmt7e6VO6iFohY5Iafksd595xr?=
 =?us-ascii?Q?j5WBC35iEQDfKvhu6x6v/Ex/Avu+WD2RLPma4WfAtl4UyJ7kOMA57p7NgiBs?=
 =?us-ascii?Q?DdmLAwMkfF67j8GulsfUwFZrcZ6iyFYMTStwsg499xNqPishulyUYyig/zH2?=
 =?us-ascii?Q?QuBdtMay63hn16FTeTfCBeNH0AoV/p11unr5Sx8N7ufIbE5oPalDDtFqV3VP?=
 =?us-ascii?Q?FtboWVJrdIfNkvVvwB6mXsRyUiIoACYQUrEOGRmawj3Fu5XjkGyKa9eyNskt?=
 =?us-ascii?Q?On+D6BsyNPwn6IKzYaQ2gLTsgbJocFttjHWkp4MDhBPJ5PXCVkRtf3SXdcFT?=
 =?us-ascii?Q?XxqVgkHGEAnbEivDv/JIF5X7sQJzkNOjazw3DUlfuXqtoPW2JrJ1GZrMWoHt?=
 =?us-ascii?Q?5iAgx8f5tIFeEOnKhVpVu2JawWEuiiJAfcT102xFZ5Rh6NqsXEdXHpJ2wqIe?=
 =?us-ascii?Q?LqLGYvqGlWcK8fvF+5fQQf17UMVP1e9sxc7aNOxSWmL5+PXvESKBLdqvzZdR?=
 =?us-ascii?Q?xN7oZmU8aVH0IihEFYcwuVAcEp9pubcMJhdDYMflBUKZUxPgZwoBtuduhZ/A?=
 =?us-ascii?Q?ysS15dgkPU/K6pTmJd57UmriKQGftovbVn90nzHdYcrz0QXdckg6GyPWv4aJ?=
 =?us-ascii?Q?EY9vaLX6m/EFzkG79a5z2LMb6uOXY+NWl08Bpmn/SWTgUIDAZL4bnamsko/2?=
 =?us-ascii?Q?4xztxWYayw8ZaJ1hli1P+MADhZ92YJsL6wbFKOaJ0OewQcWeJEMX4WyT3O+T?=
 =?us-ascii?Q?4hclQXN7mQeMRxwi6TJiweaZGHQURkv3qVp+kN4gaTvE3TUG8H2zp2PU0tvx?=
 =?us-ascii?Q?fev/LFox5WT11R08NjbZlD8i8HK9rf032Mx9YuI1XgWecaMWkT71FiSjjueA?=
 =?us-ascii?Q?xQ3wh8X4lIuo1L3vIQanNEKT9NKDXndsSGEAUbl3Ey8L/tIUkf6CeiOCwn91?=
 =?us-ascii?Q?cX5OzfdoAU+BOBt2LnIHDrpHvbBeA2U97X0L6cIqq5qbF4nApFIRmX+cotFv?=
 =?us-ascii?Q?vauZRLCc4fGDMcZRBr+LS4U6UqEO6qOGfty27DS6xYkxP8DJ/LwP6AEYyPpp?=
 =?us-ascii?Q?UnK3uInzVyH4IOrOt2uDicDKN61mXe4BvXFhvmMOusQWaS8as6uH3NpvcjG0?=
 =?us-ascii?Q?7t/StTfq7FIUqpSIX1S1zqSy/JFYeLeC1WuYL6YXhOXYLFgGn5C5FayhqQG3?=
 =?us-ascii?Q?VhQ1RkjyZCgTMLh0Uok3sHwwwF/Rwqxl+Ey22ZcaGAjFajN9nKnYGuIGuyfb?=
 =?us-ascii?Q?geZl7DgiHyU9htIhLDsmfcjvwYIf2zoKTt+pW/Ovrj4rmclSsKLpFEJYPb3L?=
 =?us-ascii?Q?M1wZ9Se0Iz7rwuicXgSK5VZ3xiUyE0nzqxzoUWavQD+cHZ2KlNKRqE3+14lf?=
 =?us-ascii?Q?mQY3asFC9q8xsuvndjAUYe+Hij5X/t3SbLEAR9JCbInFKF+sW22TUbdR5ln2?=
 =?us-ascii?Q?XGZ1pxjhUR3m21Cf7vaOcMrKSpg0x7us2iyIdP5OQc/u+nVcz0mq6opmcamc?=
 =?us-ascii?Q?O9Z3aR3mEpuKqDQ1kGYwW3EecuJV4DrQVBjwu0zBplJrBYGYqCb8ZPiUoNgh?=
 =?us-ascii?Q?buIlNWiNeueMv8g+DR/9XG+Tvfib0nau3/FKNAWopx0I9q/OLW3D+TfuhGDg?=
 =?us-ascii?Q?fUZuvqzePMy1cMvlBcQtQlkoOVPWmicVQGUJhozbXzKa4v1jEuvr4yyZbFbD?=
 =?us-ascii?Q?tnBr9Bl+UcvctT2sPOR38ZXeRp0rCOe2l7gsMgW1IquyHodp6H4eLDAiokbH?=
 =?us-ascii?Q?lYgSxo8JZUWShGovvWru/zUZh1klEi/hKMAz8vwUq/MopaG4lGn5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3696e8ca-cd44-455e-816c-08dee4d767a5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 14:18:14.3670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFu13QJTWu+6BiujMzmeeDPNbSeV1+ikDeWCxL1IsLMnwj8/W44JXqqOJnsaLMyRxR0A7YfJ1+wQRF3888diF0NEq2skQ4u6tsdObxLH786IwgPrzWrZJ/jaM7/TXgeQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6895

On Fri, Jul 17, 2026 at 08:31:22PM -0700, Rosen Penev wrote:
> Mechanical conversion of the ppc4xx-specific accessors to the generic
> portable helpers.
>
> As a result, enable COMPILE_TEST for extra compile coverage.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/Kconfig    |  2 +-
>  drivers/dma/fsl_raid.c | 50 ++++++++++++++++++------------------------
>  2 files changed, 22 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index cb92687294c3..dbdb35f6610a 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -242,7 +242,7 @@ config FSL_QDMA
>
>  config FSL_RAID
>  	tristate "Freescale RAID engine Support"
> -	depends on FSL_SOC && !ASYNC_TX_ENABLE_CHANNEL_SWITCH
> +	depends on (FSL_SOC && !ASYNC_TX_ENABLE_CHANNEL_SWITCH) || COMPILE_TEST
>  	select DMA_ENGINE
>  	select DMA_ENGINE_RAID
>  	help
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 2d86f61105e5..e559c636bf55 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -114,7 +114,7 @@ static void fsl_re_issue_pending(struct dma_chan *chan)
>
>  	spin_lock_irqsave(&re_chan->desc_lock, flags);
>  	avail = FSL_RE_SLOT_AVAIL(
> -		in_be32(&re_chan->jrregs->inbring_slot_avail));
> +		ioread32be(&re_chan->jrregs->inbring_slot_avail));
>
>  	list_for_each_entry_safe(desc, _desc, &re_chan->submit_q, node) {
>  		if (!avail)
> @@ -127,7 +127,7 @@ static void fsl_re_issue_pending(struct dma_chan *chan)
>
>  		re_chan->inb_count = (re_chan->inb_count + 1) &
>  						FSL_RE_RING_SIZE_MASK;
> -		out_be32(&re_chan->jrregs->inbring_add_job, FSL_RE_ADD_JOB(1));
> +		iowrite32be(FSL_RE_ADD_JOB(1), &re_chan->jrregs->inbring_add_job);
>  		avail--;
>  	}
>  	spin_unlock_irqrestore(&re_chan->desc_lock, flags);
> @@ -167,7 +167,7 @@ static void fsl_re_dequeue(struct tasklet_struct *t)
>  	fsl_re_cleanup_descs(re_chan);
>
>  	spin_lock_irqsave(&re_chan->desc_lock, flags);
> -	count =	FSL_RE_SLOT_FULL(in_be32(&re_chan->jrregs->oubring_slot_full));
> +	count = FSL_RE_SLOT_FULL(ioread32be(&re_chan->jrregs->oubring_slot_full));
>  	while (count--) {
>  		found = 0;
>  		hwdesc = &re_chan->oub_ring_virt_addr[re_chan->oub_count];
> @@ -192,8 +192,7 @@ static void fsl_re_dequeue(struct tasklet_struct *t)
>  		oub_count = (re_chan->oub_count + 1) & FSL_RE_RING_SIZE_MASK;
>  		re_chan->oub_count = oub_count;
>
> -		out_be32(&re_chan->jrregs->oubring_job_rmvd,
> -			 FSL_RE_RMVD_JOB(1));
> +		iowrite32be(FSL_RE_RMVD_JOB(1), &re_chan->jrregs->oubring_job_rmvd);
>  	}
>  	spin_unlock_irqrestore(&re_chan->desc_lock, flags);
>  }
> @@ -206,7 +205,7 @@ static irqreturn_t fsl_re_isr(int irq, void *data)
>
>  	re_chan = dev_get_drvdata((struct device *)data);
>
> -	irqstate = in_be32(&re_chan->jrregs->jr_interrupt_status);
> +	irqstate = ioread32be(&re_chan->jrregs->jr_interrupt_status);
>  	if (!irqstate)
>  		return IRQ_NONE;
>
> @@ -216,13 +215,13 @@ static irqreturn_t fsl_re_isr(int irq, void *data)
>  	 * need to do something more than just crashing
>  	 */
>  	if (irqstate & FSL_RE_ERROR) {
> -		status = in_be32(&re_chan->jrregs->jr_status);
> +		status = ioread32be(&re_chan->jrregs->jr_status);
>  		dev_err(re_chan->dev, "chan error irqstate: %x, status: %x\n",
>  			irqstate, status);
>  	}
>
>  	/* Clear interrupt */
> -	out_be32(&re_chan->jrregs->jr_interrupt_status, FSL_RE_CLR_INTR);
> +	iowrite32be(FSL_RE_CLR_INTR, &re_chan->jrregs->jr_interrupt_status);
>
>  	tasklet_schedule(&re_chan->irqtask);
>
> @@ -708,30 +707,23 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
>  	}
>
>  	/* Program the Inbound/Outbound ring base addresses and size */
> -	out_be32(&chan->jrregs->inbring_base_h,
> -		 chan->inb_phys_addr & FSL_RE_ADDR_BIT_MASK);
> -	out_be32(&chan->jrregs->oubring_base_h,
> -		 chan->oub_phys_addr & FSL_RE_ADDR_BIT_MASK);
> -	out_be32(&chan->jrregs->inbring_base_l,
> -		 chan->inb_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
> -	out_be32(&chan->jrregs->oubring_base_l,
> -		 chan->oub_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
> -	out_be32(&chan->jrregs->inbring_size,
> -		 FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT);
> -	out_be32(&chan->jrregs->oubring_size,
> -		 FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT);
> +	iowrite32be(chan->inb_phys_addr & FSL_RE_ADDR_BIT_MASK, &chan->jrregs->inbring_base_h);
> +	iowrite32be(chan->oub_phys_addr & FSL_RE_ADDR_BIT_MASK, &chan->jrregs->oubring_base_h);
> +	iowrite32be(chan->inb_phys_addr >> FSL_RE_ADDR_BIT_SHIFT, &chan->jrregs->inbring_base_l);
> +	iowrite32be(chan->oub_phys_addr >> FSL_RE_ADDR_BIT_SHIFT, &chan->jrregs->oubring_base_l);
> +	iowrite32be(FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT, &chan->jrregs->inbring_size);
> +	iowrite32be(FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT, &chan->jrregs->oubring_size);
>
>  	/* Read LIODN value from u-boot */
> -	status = in_be32(&chan->jrregs->jr_config_1) & FSL_RE_REG_LIODN_MASK;
> +	status = ioread32be(&chan->jrregs->jr_config_1) & FSL_RE_REG_LIODN_MASK;
>
>  	/* Program the CFG reg */
> -	out_be32(&chan->jrregs->jr_config_1,
> -		 FSL_RE_CFG1_CBSI | FSL_RE_CFG1_CBS0 | status);
> +	iowrite32be(FSL_RE_CFG1_CBSI | FSL_RE_CFG1_CBS0 | status, &chan->jrregs->jr_config_1);
>
>  	dev_set_drvdata(chandev, chan);
>
>  	/* Enable RE/CHAN */
> -	out_be32(&chan->jrregs->jr_command, FSL_RE_ENABLE);
> +	iowrite32be(FSL_RE_ENABLE, &chan->jrregs->jr_command);
>
>  	return 0;
>
> @@ -766,15 +758,15 @@ static int fsl_re_probe(struct platform_device *ofdev)
>  	re_priv->base = re_regs;
>
>  	/* Program the RE mode */
> -	out_be32(&re_regs->global_config, FSL_RE_NON_DPAA_MODE);
> +	iowrite32be(FSL_RE_NON_DPAA_MODE, &re_regs->global_config);
>
>  	/* Program Galois Field polynomial */
> -	out_be32(&re_regs->galois_field_config, FSL_RE_GFM_POLY);
> +	iowrite32be(FSL_RE_GFM_POLY, &re_regs->galois_field_config);
>
>  	dev_info(dev, "version %x, mode %x, gfp %x\n",
> -		 in_be32(&re_regs->re_version_id),
> -		 in_be32(&re_regs->global_config),
> -		 in_be32(&re_regs->galois_field_config));
> +		 ioread32be(&re_regs->re_version_id),
> +		 ioread32be(&re_regs->global_config),
> +		 ioread32be(&re_regs->galois_field_config));
>
>  	dma_dev = &re_priv->dma_dev;
>  	dma_dev->dev = dev;
> --
> 2.55.0
>
