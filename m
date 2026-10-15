Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013036.outbound.protection.outlook.com [52.101.83.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074EA531614;
	Thu, 15 Oct 2026 16:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083113; cv=fail; b=ZhYuKF0P9t1ZWWtPxUuD2lf66K55J1z3PvxNO8Jc6I6yThh638BgiBlQIJhJgT5NVzBqjn8H5x8GwgQCHHA4BWYlPWpl7hCxNp9n8PEW64ae//NNnF0cJXwHkztMIjF88B64m/NSNsKfXgWqAJOMdamQMKp5vICy4OQT5GfhzO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083113; c=relaxed/simple;
	bh=hyD5+s9fXVSWDSibI0EJt0j8/2Vtg9znM1cPZhzgefw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nmEVgmvwOi1kVTsRA96sz9Sw23M2hYjF5vWdS0cUWkhuxedfmT/QwmuzP7qg8Cr/0Y5gTJ5VFoINBnRz9uNmqCxrffXIPzLexU0QSg5i2CpOQwfxqDTRLUkVuhA66d/K/1958ZDV8/LYZMnSGC1PTSImTYz4fLAcRWrdXsexw6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=b5olMHoF; arc=fail smtp.client-ip=52.101.83.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="b5olMHoF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bP9iWcVD3RkaHPgFjtYLGFhp0sJNA/199e4Q+avW9GV79fWt1pK286pOSbM4C0nw0BMVB6gaV8Koo6zfC8dswUqg2ENu2n5t5U6PcOsJERd1sltl32OU5srHEfL21zzVNOhnadmF1WGp256rQliy0wYrJ2gvpDH7Yhd9usknTywwu4cIdmiN8jZ3D8D60vMnfFkCDsc2W2w8QTekzP+rYC7kSO18P1p4o75TvMtjcpbznZhqGZ8YkcW2mmbC46EgC8ejztPPugsJGLtV0abURZJOfDvLwmysdyOfLwBspQcGIzoeUa17NPkk+TNu5BE5+xWkWs5Pr/fxXQL2CieKcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5BXO0F6DGvkNh3BxJBTTwUUy8sY6MLt9a5etag1P20=;
 b=BreyFmLjPv4avtAMRSuuALkdL8kqLARzFOM9vWtRgnrogqNwtIykUDtnrPpepFMwmGQllIjMpYqvS+rzo4ERYr4ZL5YsokoYKo+8iB9VzpAebCDLqb2MceqmpvlaHO/2yD66mZSu6tlfNPDer9AttsKI2Kiw1PD3sHQVIWVQkvzNehPdRjIxTbBRrSURsvTTBJNvfhi0+cAXtj/IqrZHnS5tLb1yiBf3J9m29VX1ocpVlNQ4BrTXwo0nod5at3wWD2nwgjDDNQ6VoAvC/c8ylf3O5nOlsewGOtUyC/j9+hguOvhoRLe8YramgMCAkQpzzqsMmOqyqp/T+dTpSbfnow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5BXO0F6DGvkNh3BxJBTTwUUy8sY6MLt9a5etag1P20=;
 b=b5olMHoFFpOCxD39kFxwO6jlY6vLWOjtzrgb42EN0itFHTTJ6B3jHs2erR71UbUa+8+NOeMplGwFEzsDJgqJFDpmV23IfBkYEXUvD3TjeU4QYsz1siUMxkTXj3plFyVYDq5sdXbjL1MNXwuVAaKv5XoYeKMV5PpNWjKMJ32CiuRaxdtHAE3nzah1XI0fgno2i9rleBgdEykPloDcLEHtvqEIGj3J0Xvjm6mHGR2Bkeo8GnWVeIr97bP868enjMvkgm9IjqIHY/Z3m+6xOQuAGWV765GZ1AjAU69TGPT5O5s3tUEteQ/WkfPKoRGDVBHE1SXRBy+TU3BFVsNT38cZTQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB475645.eurprd04.prod.outlook.com (2603:10a6:150:39b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 16:51:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 16:51:31 +0000
Date: Thu, 15 Oct 2026 12:51:23 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Mizuno Miotsuki <founder@crepuse.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, krzk@kernel.org,
	ulfh@kernel.org, Frank.Li@kernel.org, m.szyprowski@samsung.com,
	huibin.hong@rock-chips.com, rmk+kernel@arm.linux.org.uk,
	sugar.zhang@rock-chips.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dmaengine: pl330: Fix unbalanced runtime PM
Message-ID: <atEEi7Uc7DI2pkg5@lizhi-Precision-Tower-5810>
References: <1650450456-34351-1-git-send-email-sugar.zhang@rock-chips.com>
 <20261015-review-pl330-pm-original-v3-v3-1-5be09f37df77@crepuse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-review-pl330-pm-original-v3-v3-1-5be09f37df77@crepuse.com>
X-ClientProxiedBy: DS7PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:5:3b8::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB475645:EE_
X-MS-Office365-Filtering-Correlation-Id: 3660f371-c988-479a-7b06-08df2adc905c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|366016|376014|23010399003|1800799024|22082099003|18002099003|10067099003|260925022911599003|260925021311599003|260925021911599003|4143699003|11063799006|261009223027099003|261009220027099003|261009221727099003|261009221227099003|261009223327099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	M7uqEy0Pkv/1cbZPjAA4M7N+JN5YfgKH1Shhq04Yz3OnBwPj2lbOFtIZ3fWH+zOgB3y3SlnR5SdEUJDve6kOzjVIzxWo+BuYoqV0OrBHBSkEBO1+heF/65jhJD85KWjTg85lpynvyMXDwW/2gDX3jUJaPbjHxjKbP8QXFYLX5NiogXshxIuFlmK0qjEM7dDGqeSkX7/+Z99ClLbrmr5F/77JMVXDaR5S81uaGsHEQCqTMpVgg67j1oMgLgWqt/+0xcE0dYmmqxENYjpot1/oHQ/PiOpdvrv/CO48ijsID4n3r7nOzW/15rQZ+S6PZCJjwAcPTOsCnDznQnUufngxrIWfWEtdgVjAcn/h9httYTFXT04PbIqOD+Au1wnv9VxX0xs+L1eIGc+aZpHyAep7sZAhidmKKfznHx7NxFxUtXoeQDiyUp4gkfFpF2P+ukwy88fNPDt/HfSsgG2xjJeGBC/QyPvyTnLGGI5jcSRD48SjSB7WyMI0f/FuP4RTtSNXXnS9NzrUMSUReU3sODeARXzti7udDOBqWEqUwDL+TCLk6BfSW4f8AXrJT74mBC1GAnjBMeFnRyL5O834vDMwIYcDB0R9KE6NFf4r1URJ7j0JVHNFbniHSeSzP6x1f9fV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(10067099003)(260925022911599003)(260925021311599003)(260925021911599003)(4143699003)(11063799006)(261009223027099003)(261009220027099003)(261009221727099003)(261009221227099003)(261009223327099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U1YZo1RciVk3+sXtnmrOSnRE73PUQdX1JU4sgWfrsl0xScz0dXkJ7tCsJzpw?=
 =?us-ascii?Q?i6OYaaEC9fRWikp56H3G0swctMZTx2HOd2fcNO5xBhREUKm7YfGUsmTou1Dj?=
 =?us-ascii?Q?TTvQGlzWbhxiqEl/DgQYXMAlFN35Waiz7hv5WU6sXPPh8p6QsZzr69gB8TJ/?=
 =?us-ascii?Q?H33BKjR2knHWCPBNYgi/Qr93LPzfGMZ9iYz6U5uEAxqoUZRK+kSeN1lZO47Z?=
 =?us-ascii?Q?1GyzBNJ3CnoN3b5hh51VVGklXZT/h6LGgFNMl9dhcuhmwc2YvKUImJlvXx4X?=
 =?us-ascii?Q?uCqq7aqI8paTNZSfaevbLlYnb0NlfYIycqcLwVdD8hVrMeiROXwP59aOQA/n?=
 =?us-ascii?Q?QYby/s9WED9bbxaoVfMQ8UfZ5c57ov6LpK9DkMxsQqzgjr1R9644L/Ryfc6N?=
 =?us-ascii?Q?v7fZhnxGPr1ktrv+KP56Q+ybO+8X3dVhDQMZVqaAe3KhwqBWDpiGufze1QwY?=
 =?us-ascii?Q?1CHnwgGraakKVZ4FJcEtQotrUHI9r2i/3WkhcGbMV6CyuV6o0Pz0g/YdMpb0?=
 =?us-ascii?Q?BlKpzvdoKGc6N+n2u8r10SbqDbLLg+TOvbsPvZfc4P62cwcUCNqfbIDu+Krb?=
 =?us-ascii?Q?4SW2pJMWwamEt2LQCS98m1Q3Fhun5HS78oU70lcYqGTcIJGbolbkh0GHOzmI?=
 =?us-ascii?Q?vVA15MLZD9sN/rySEm6F7fkU+e9TSoIa2dZsHqfDY+W1vJRq43EoMgLVbNJJ?=
 =?us-ascii?Q?tldnUWhMGMJKqGl+W8DxnjGRmBCj0WbSrVwxzfCxIPVXzXNLAIvICDptxW13?=
 =?us-ascii?Q?dcMqQ3rJHS42lpComFnH8YChbK+5l6lSwEXIfd0vzSK9Y0WHcfpE3Fz/eLHT?=
 =?us-ascii?Q?5oh/B5iN6zEgEV7nDyZgmqa5a/UsjVb+ObnjgiXPkOlOLrkfU/IgHSMIniFh?=
 =?us-ascii?Q?hEERDpxS6EAXJ1vGUogqtpZDMLM+9M0ovMFLzb5UtyMLdrh/clnRaWRwJMRR?=
 =?us-ascii?Q?/mFD5DLycmUPa960cbYl5ZrorD1lvpc3j2mRur+yCA035yxKaVWd+e6SpWJK?=
 =?us-ascii?Q?cciIKXEVCusgp25EG+PjUhfNAhnX1PJY9TImHykqeNH2QVBqrGwpjcdd3VFJ?=
 =?us-ascii?Q?Ptg01NUQZsq4dBOhGL7EGqyMfKb/WkkjbiAQJuQ6aWUvsS0Gt0VkK9UxfDpl?=
 =?us-ascii?Q?p6a8ZmsiuvGvtScTonO4eEoaWwR1fTHwV6z2e9FBUnZHxYfsiGUG8RU7zJfG?=
 =?us-ascii?Q?VA+CU8Iu+NvY80zTF5SJ8mt9n2uS+dbWWpHmCrFSKHhB+I9qGax63Ka+YHGb?=
 =?us-ascii?Q?VdQEBAD9S3aQqDInjLuCGn1Up2nhAsPOq1xhf12ahna86qJ4kWTvgLui82S2?=
 =?us-ascii?Q?RdeyprP0MZu7QZNpVJ+FWn/NqkGUH2R3FJ7ZMqivxk6Wk7nVWBio3ECVmrNR?=
 =?us-ascii?Q?TkdbIeYI1Rk/dfL3rwILRWsBk/JfPvdaAMvYJ53MQhJA9jbn9+eevU+wVbPl?=
 =?us-ascii?Q?McUI1cfcCDgMM9K8ruXIj5f7llgsRNe7RRCIfSArotaa1zmWObZ18NjdisHl?=
 =?us-ascii?Q?3wRVIhidUm/BdmmG4f9E7l9QMjVHclSNR4lkzMSV7on880EkoBOdAsp0AARM?=
 =?us-ascii?Q?JqXk0ciGipVTgWsSjH3A+GDPLpZqHNcEqWCWr2A65zc3+jKUZCi0mOZy8KB1?=
 =?us-ascii?Q?StsvmpQFaXvbLsaW+aO5sLW1RHnfX2j05YdOEjsJxM/CrAk3A1wDpYxpdxKK?=
 =?us-ascii?Q?kxPcIBzTUZJtSiV4E5Sppjtbebptu9evwzrLhWehpM+/xgHMJg0fuJUJN2k+?=
 =?us-ascii?Q?npXVXHnfdNwHfdAX38vFtO7bAd+wuCwpmVXBgS5yuPvaTxAUXaOt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3660f371-c988-479a-7b06-08df2adc905c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 16:51:31.4986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQA1LjS8EdX+5o5mWHOqDmnV75xAla4kEv8vpAdrc+euUrEE/UMBCCNYWzM+7M4ppX5FY0YIGSGOa6/6sQePIntNrALbJKwNQM1wnxCBb9w32eNjjyBpS9gj75DkL/hI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB475645

On Thu, Oct 15, 2026 at 07:58:08AM +0800, Mizuno Miotsuki wrote:
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

Look like need lock between terminate and issue_pendings. There are should
other problems if interfere each others.

terminate should wait issue_pending finish and block queue new request.

And

https://docs.kernel.org/driver-api/dmaengine/provider.html

device_issue_pending

Takes the first transaction descriptor in the pending queue, and starts the
transfer. Whenever that transfer is done, it should move to the next
transaction in the list.

This function can be called in an interrupt context

call pm_runtime_get() is risk, which may sleep.

Frank


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
>  		spin_lock(&pch->thread->dmac->lock);
>  		_stop(pch->thread);
>  		spin_unlock(&pch->thread->dmac->lock);
> -		power_down = true;
> +		power_down = pch->active;
>  		pch->active = false;
>  	} else {
>  		/* Make sure the PL330 Channel thread is active */
>
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> change-id: 20261015-review-pl330-pm-original-v3-be881d29c3bf
>
> Best regards,
> --
> Mizuno Miotsuki <founder@crepuse.com>
>
