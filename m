Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010019.outbound.protection.outlook.com [52.101.69.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8D343F0A2;
	Wed, 15 Jul 2026 18:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784141830; cv=fail; b=pm4PN//PhltVyfoU7Ooz3tec5kLl0JuN4pF53rYRmgKRJew2rIEIYyAYGTHkxFTW0gjYQREDr58HRuP3GkG+Vgj0MCKldU4Kuw09AUc7AbPji+WNLzSXyXumG+Oa/Uakn+DTRtDbUjloakzoXRk7SfMEhLKpynixsbTSLCbaYng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784141830; c=relaxed/simple;
	bh=cGNVBT7/gt58PS3d/X0UReJkfoNq213kPEDtkhU+KvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=D6bvQntt0gXYMEiyVDUUB527HzhrCj9FXXV6TGdBUCZn7+UAMdjUCgS9zzkCILmkLMnwdW1SI7RIMfbXSTh1EHa5mhtU0M9zIVlnJuqG0pOMjzSPJaxpYQX9TeUJ3IEtQe/vCRWxjMJtI+ukQWlncS9sFm0WWCtVtPy+uxWHxF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oFPbllj4; arc=fail smtp.client-ip=52.101.69.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oFPbllj4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWkwHC96EsVZTH5ISsYrNZkDdCfoOdnHBucOcKb3YVzCU0cBr7Y0RvwGjGEDyay9einBQ9kG73YrBFztVWyEQA5y5SX2bSSj6ehvsh8oIQYjGFBY2LWElJ5Bk5cjDZzbt5RSk/kqdcazqSb+EKmjGSXpd7i24XLayjjJokTuRzvVgXkky47h7Awr54WtTDAyTXYJQiOvn8sBakUAZy1BbLr/8fbjmJHSc4mtnMqNyf3wPYQOFEo35VagxDJ+6SvscemLROMM7VvwrFmQJBqQ0+f960blg9rCyxNEithG1pFvKjbUiLn+YXhKd9iv3720L9OYAMbmL4pqKhWeFbDD/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2eeYqaTP0s6zvWRCRznJIYu5JBP4oT1UtbT0/nKJcQ=;
 b=Vwng8DAMuQON7vS6BIJHt2yyaejbfF6KjxmPrv9AqapSCzYOshFmYCQCBVI90xwrxpiIWipRgG6qcmp6YV8TWTZVBFONH5Or+RNFAhLyjz0oTYRM7j4ek4dookxA9N4I6jAIZyhbh3T1iTMRBgWMRqkgAK0aVgVa2hHd9RxJJOxui09fo0GPr3SF97RERDEuE2OLrm8Qupto2n92nXNgC5G2MImrgTkPq3hZgkGoyA5snXDoF6FHlQgtwxHSqQot6zJkRVssqwLiPijnVDysUfXrPG38WWtVta84//PgxVWayHy8vl13G/Sc5M0KoybmDVV/tt60QGR3zxbCBBo3uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2eeYqaTP0s6zvWRCRznJIYu5JBP4oT1UtbT0/nKJcQ=;
 b=oFPbllj4Zbm4lrL45N0oEjuiBqDdZZjXl77+uYfVpi40WuHzIuhrPKj53ZZOhPps5fMW1NnYCwnJJ4L2I9u3DJnSSDqxzBbrKCfWSjjdU9cj6vHxAgpsA8KFjQO+K7oKaSWJ0TAkMhTGtdIUALWuczPTBAMDrJFqanq4A0ZtRdl4uML1WyjksiNDDVtpRbLLUKD89olvQoEyGmzBnu1rE8NeenA/1ALyQSmuu+9q+gSS6blcHfR/h8Q8sM5NY4cRZ63z09SitzLVwyd5t9rdmIuXjFTBHOb9ym1oATykcJd0eb/DNWK/lSkHy0s3Lerkj4HkllPlzcfmVFn9xdMrfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB7822.eurprd04.prod.outlook.com (2603:10a6:102:b8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 18:57:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Wed, 15 Jul 2026
 18:57:02 +0000
Date: Wed, 15 Jul 2026 13:56:55 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Cai Huoqing <cai.huoqing@linux.dev>,
	Serge Semin <fancer.lancer@gmail.com>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/9] dmaengine: dw-edma: Complete descriptors before
 pausing
Message-ID: <alfX957qgxB08Ohd@SMW015318>
References: <20260715175740.1110404-1-den@valinux.co.jp>
 <20260715175740.1110404-5-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715175740.1110404-5-den@valinux.co.jp>
X-ClientProxiedBy: SA9PR10CA0006.namprd10.prod.outlook.com
 (2603:10b6:806:a7::11) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: 36fd5525-d61d-4acf-08f7-08dee2a2db0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|23010399003|7416014|376014|366016|18002099003|22082099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	SdU5aWbLODcFW28pT/gI7wdNhV3ktZqDeEXtPnXU71sX0szzLm/IFxstfi4DALuSl6TkV8kKtz74Erm3P15CjWvDrG5Q9ersQxRF8ZhWr8vbQgS5/TRs/RHZ3IQ0fz9kZfbuDM9lesfgx/z64F0aBDLUVRwhpbzuJXvqtIDm3TKhVrFoa5vwVQlY89jSbtYxzlIAcyOU2RuGZdbngkLYhiO5egCDK8E6eWUiv1N+n30nCBObm5LJUjfCZoycDnommja2E3AQUDR4wgZe7CayxPeCWqr+QLiE4ynD4uXyUHGpmc6DgMXeygf9pgbI2D7NFvJnkaZHUHRgVhBn+wpmdS04+4vBjVC5XD40YyZSsbyEdjk8fkJ5GVj+343svz+Q744bignTR8qWU4ONQWTzfi9KbHju6vAjiuEHiY2ThCHLWZVWWajV8WvUbJ3bVZn/mzDbZGkTQ/Le437VUnW4DXSsSKvuvm1PsLwlZydhi8GWtMIV5oEB1VYHLTR96xYutra5mbcTIL/LmKozkkNII4rfze5TpoySFh+RQU/OFaWMIy0iR1+/nK6EZyyQ/hSm4jWnXujovdZ1lnOXArc+RWmONDu7vcT3FEcg+ymuY8W4yo+qQxahVRiUyBapqyDFFR4lwBpg8GmhOAQIFy+NdbqBwZLmyr/EwlSuKoBE3ZY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(7416014)(376014)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HzRa7Pytg+8zqHkp96oiZZ9Bf3la6yN3BJg0cj1mCsrm34YcQixKKX+eqKTq?=
 =?us-ascii?Q?3d8CcjcbJGE+AImJO1DRT0sZTzkGorHQr/i3EI6vH5KQ3XTMd+aEPt8amhFO?=
 =?us-ascii?Q?+KLVcuqTHsIjELJKXSHblwT5rgcvjoKHG3LQcsu7pY4NvGV+N0yjYxP2KsWt?=
 =?us-ascii?Q?BLs0UdTJM4ORDf0MlrlUlFp+3LZic/XpPlaG0I8FUIAL4UnHKRsWX+PZJi7J?=
 =?us-ascii?Q?bCQlp5W0PaJnxiebaspf9r6t92+Ur3x6th8HbnlDiCYKZQFU6oVJaiiQQCDZ?=
 =?us-ascii?Q?JhhnWDvDIK72nCLoZ9EOFxaPvWg/mqJ8mDA8xEC3euOY4eNlGnCmsrye4so6?=
 =?us-ascii?Q?6HS8Pjrva/ZAfVKc5JOw6PL8pKJrs2nDi4gj1C+JbD0dHpi3UuPpG85A2TmA?=
 =?us-ascii?Q?BzEm5jivwScHmivyUZh9KDH/5NKN1fVdmkFg6FRuxmfJ9L4Dp6ho4ry/S1xw?=
 =?us-ascii?Q?5wyKpfFl0vt5p91vVmEAs7tuQAbwIHDrWBdEjMSJ9qd/KgNTBp24TsXLFZIE?=
 =?us-ascii?Q?9uLak+r5KiWeum6zk4pNIxg8Aco7JvRFN60T4t3nljdLRlPydIulFXzCALbR?=
 =?us-ascii?Q?r38g7pILrTKjL+3qNTeZyx5B7BxnVYJ6+i0gbhi6mskteEHXjwfsb4j4M0a5?=
 =?us-ascii?Q?ZhSk7T0mZvjEvdpI1SxoHRMIheHbbp0coOdxXl3Per0qMuxKLwsJJHesbFGo?=
 =?us-ascii?Q?PZz+trmYP9ISAUWXP3hZvFLnH+GBz4S87RRfzGbrl8vE11KIL5Zq9fF4XwTZ?=
 =?us-ascii?Q?lz+xHm4QUhLgyx2HvuZdr/8n5z/aPPRoYygY+MvRAiYokEFSuBFPDiOQJ6vX?=
 =?us-ascii?Q?dMc15iZa4vL6TVZdCAMZ97hV2/ivS63UcHdJvj3FQ0/eMRWuM6RECmTyRWcC?=
 =?us-ascii?Q?nM5QXSS2pJk7ORuwVCXd/y5JC9nWLRkA2mp5nBc/0T28MK/LyZc+O1zrD9t6?=
 =?us-ascii?Q?42kl5mw6mj5AAX7YI/7gXY1xWVKa+rviwkapVI5E4QzI7IExm1yS8xzWTsdH?=
 =?us-ascii?Q?tak4qJV22DPX/RMpUF2srKUCgfUkJl1SQA7uw9NRFOnav032K+JZ/uVoifAZ?=
 =?us-ascii?Q?qMcXCTplnnVWBILTzZLYApsZ2nhum0aCAoBmkmRfwneR8GxDy8sPLgOiJZNm?=
 =?us-ascii?Q?9GU8DnybqkTG567mAeM7OX374l09qInb70+ioWYa2OX0sRVJ41YzktUx5wQU?=
 =?us-ascii?Q?JNqKN6aejXbG7sfG14nbhPJyovdw7G0+Rup8LGzS46SlacmHx20w/egLnQoL?=
 =?us-ascii?Q?/UC1ZiiJ8sn0Gwu7Iene1SywVsQnqyKZAuaCgmz9rOuYpRhXGPys+xcJa8tX?=
 =?us-ascii?Q?TNpIVhpXhY9XcsO9Y9K0A8wO3CEdzmH2OiEwORgOIZOW4mBBId29QhRXVASm?=
 =?us-ascii?Q?8Fsb1ex6ox8NWTyGV08CTXsR7M4qyZbE4yCs2GirmilPB/UuGRoB4PFcslJd?=
 =?us-ascii?Q?P0ZTuHAKYgnRgATJ/uTqGyF2lZulYKpIOchrKv+KEAHT8TYuSErP4t7F9DlF?=
 =?us-ascii?Q?Hj3Pf5m8YcP25gG6csIUuk0hiqQDuyk/SmEEmvVkpzKdAwGjbhCYr8+wU9PF?=
 =?us-ascii?Q?B+haWjxj5YO3XBnAxvbmNlfIXnZeCkg/tHiMwdLPbZPGh10fAU+Rfon97hNa?=
 =?us-ascii?Q?EP9Hmm+VURFvs+m2l43FEkdW1YlkkyU6ydo/IqV0mCi+hinaK28koTvxH0vh?=
 =?us-ascii?Q?DmK3LxRQfkkbpl7HNMHA3tnehMR9nHZ5wsIJCwWqx8TqOVaBVFrqCMgMqkam?=
 =?us-ascii?Q?bFlHNirPQZbrERYzzz/ERm9/dc8hyNwH0KsdLwkrqY0xrYGBSgSY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36fd5525-d61d-4acf-08f7-08dee2a2db0c
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 18:57:02.6771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jKzkz8GUhXQw2UjQ4U7TB8mkLhuTSPSPU1I+fvhj/lB9/rYWA+Ql7LHsuSziibne2M43d5OwDTBuOZmfjjCGc5x9c86HEM28+KNTCpZOqDKVAnQ1KHb8oeCeAE3JZIh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7822

On Thu, Jul 16, 2026 at 02:57:35AM +0900, Koichiro Den wrote:
> If PAUSE is requested while the final chunk of a descriptor is in
> flight, the DONE interrupt takes the PAUSE path without checking whether
> the descriptor has been depleted. The depleted descriptor remains on the
> issued list and the channel enters EDMA_ST_PAUSE.
>
> On resume, dw_edma_start_transfer() finds the descriptor but no chunk to
> start and returns 0. The caller ignores that result and leaves the
> channel stuck in EDMA_ST_BUSY with no transfer running.
>
> Check for descriptor completion before acknowledging PAUSE. If there is
> no work to start on resume, leave the channel idle. Also ignore DONE
> interrupts while the channel is paused so a stale or repeated interrupt
> cannot change its state or start queued work.
>
> Fixes: e63d79d1ffcd ("dmaengine: Add Synopsys eDMA IP core driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v3:
>   - New patch for a pre-existing PAUSE completion issue. (Sashiko)
>
>  drivers/dma/dw-edma/dw-edma-core.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index 272b03405746..b06b299661c0 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -327,7 +327,8 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
>  		err = -EPERM;
>  	} else {
>  		chan->status = EDMA_ST_BUSY;
> -		dw_edma_start_transfer(chan);
> +		if (!dw_edma_start_transfer(chan))
> +			chan->status = EDMA_ST_IDLE;
>  	}
>
>  	return err;
> @@ -691,10 +692,16 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
>  	unsigned long flags;
>
>  	spin_lock_irqsave(&chan->vc.lock, flags);
> +	if (chan->status == EDMA_ST_PAUSE) {
> +		spin_unlock_irqrestore(&chan->vc.lock, flags);
> +		return;
> +	}
> +
>  	vd = vchan_next_desc(&chan->vc);
>  	if (vd) {
>  		switch (chan->request) {
>  		case EDMA_REQ_NONE:
> +		case EDMA_REQ_PAUSE:
>  			desc = vd2dw_edma_desc(vd);
>  			if (!desc->chunks_alloc) {
>  				dw_hdma_set_callback_result(vd,
> @@ -703,6 +710,12 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
>  				vchan_cookie_complete(vd);
>  			}
>
> +			if (chan->request == EDMA_REQ_PAUSE) {
> +				chan->request = EDMA_REQ_NONE;
> +				chan->status = EDMA_ST_PAUSE;
> +				break;
> +			}
> +
>  			/* Continue transferring if there are remaining chunks or issued requests.
>  			 */
>  			chan->status = dw_edma_start_transfer(chan) ? EDMA_ST_BUSY : EDMA_ST_IDLE;
> @@ -714,11 +727,6 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
>  			chan->status = EDMA_ST_IDLE;
>  			break;
>
> -		case EDMA_REQ_PAUSE:
> -			chan->request = EDMA_REQ_NONE;
> -			chan->status = EDMA_ST_PAUSE;
> -			break;
> -
>  		default:
>  			break;
>  		}
> --
> 2.51.0
>
