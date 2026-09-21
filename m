Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013022.outbound.protection.outlook.com [52.101.83.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42B14AEBF5
	for <dmaengine@vger.kernel.org>; Mon, 21 Sep 2026 16:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006629; cv=fail; b=pB4AALQEw5qwfgEA2UIs/ESOXUZakE1ICnNr0v9TzP7MffZeG9mDeojwFJT3tVRh+tmgLu3tyv77BFIcKiV1T3lfqhEKHy6szDMYoE/P7lfvbTYvh7VWBUQ/YHvai/MeUCLITVxBXd5nydWPEP0cIrN2WtFg9xtYmMCsZvteXpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006629; c=relaxed/simple;
	bh=DeNncnhA3OxWfB9058vsRJmFknqjQX1DXEWjRtgNjVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RNjlPMQ0OjIvFYePHPuzU6+h5BMgPHNH+Y5t+1cgBlA4E7ZQxN3x76pNG+5QZgdH1NvZfy1e4vaPlBDyR+1U+YrAv/CQvA0M7jDcROF/2d8C2rO6CgAFhBp4GOwuJf/lNdThnMDDvMXpi0WULuJLAqD0HS2SWSQvKuP2OfVnjqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SVEsoAki; arc=fail smtp.client-ip=52.101.83.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SVEsoAki"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGX2zhgmUn9fJjXpZFPey6IzCq2ZIswDQEIRmQhHTb1Djxr6Qhp7SDJzoIhpnwrkLNVxdwxd30sH64OoN+4aru+cz8yBKVC6H+DhXGi/bE6c7KrdNEIhDyXtGNjmcwl0EcXTzqgch0RFckRfziNbkiehoVvpawLL/zB89CXbDIMCfor5c8r1f3SuCasjRUXDI/Dpsy4UVX32ba0sxHCF3Na6+o1QcqSGEdGX6w00rj1byDmRKCWmdEQu/fci7BkFyYzgrkS/cED1GihR+eRlArKSPiGZIJbw2H8UXf2lYWU7n9dh0kwhfEzPKscaiVndlML3+jVnLl1D6kyEB15NWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nxgy7g2s54dUBpl6Mqw1l4CfDMQSAazl7ERrf5T3to4=;
 b=txscSXrEcrWOahjMR2ixwysdFwBD/+XeKQp+jELivQpA3fQn4UMvUL2nd+Km+bRorFulJYuWv/AlTgKzdE4MK1MsJLEXZKmPVqVjpJzu7s+U6/aDPNuTTdLq93XHephn6l9anLSSu7gq+bEEilaSWjwDi1Ds6Q9vR6utBCKLAKpKKx2JkDI3zrOOS1tK+gLMWh9Mout+LYOIlBTwqTnunArd9m1KRztIhOXlbofU9d5KFq4NCRHToGgSgJ6eX5dhNFc+sdI3szh5XlxCyyDkPzGjDkUB4Eis8O0mOsJhBKpEjiEeh/j/CJJqYMvmSpWJHbdxqN2gb0kWOjrCvOlR9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nxgy7g2s54dUBpl6Mqw1l4CfDMQSAazl7ERrf5T3to4=;
 b=SVEsoAkicQ56WO8PRzj32f9QYHjvxCbmG0kDPI/CiGbq2KZeF6Lgc2/s5pNQTU8UJedDReahDgSUGBHXIm69qxrDTET2HkoTTz+tLdb8bAP7k562ZG2dmN/w+MuXCplzyHTp3bU/UUgwrhzqK39Jedt3XAEc1j0eru8CQD0U3XklNe7His8VPmF0itskdzNp6Fc0UswvaY/75FZRzCYX8jtXWSqIIKwOcGnhqEhrD20+HKt3km29ll/SIGs9TdYA6I1yXTJ6iyHJ6jo2EI82Gq/NiMxj+MONrdbVJCF/LfU0SKRuIpWOgV+UWgkEnWwKjS27Mp1jJv9OSnoeyHqxAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10870.eurprd04.prod.outlook.com (2603:10a6:150:20a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 16:03:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 16:03:41 +0000
Date: Mon, 21 Sep 2026 11:03:33 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: dmaengine@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Subject: Re: [PATCH v3] dmaengine: loongson: Remove the dev_dbg() output
Message-ID: <arFVVcxZVvIZM-pE@SMW015318>
References: <20260921151312.I8Q8NLnx@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260921151312.I8Q8NLnx@linutronix.de>
X-ClientProxiedBy: CY8PR10CA0037.namprd10.prod.outlook.com
 (2603:10b6:930:4b::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10870:EE_
X-MS-Office365-Filtering-Correlation-Id: 71033ca9-e87e-41c8-1d14-08df17f9e789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|19092799006|11063799006|10067099003|5023799004|3023799007|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	T7ot38j4RhsWwv1Padh/3A3p4UKFGres/UH6LGQDRnEyOMkUQX/YNvR/TcS8BEAFG1b3zOEz6Akn4EoEy1yGkYNbtm3L3UYzAbj1EamkSEGmNkQw4y5rrqHhTXPhlkXFsrf0zX++XNxUjJmZfhIX2xc9vEFbjncg/Zp9qPOAQa8zindOuGDUlxM/tWKOodcP6SLEMRfQ5p7OV8tP4cNs4vqReN40no7u05EkpTF4AmZb2EL4Azc0ZweXGe6tGmfaBoovVz6yMZKkOUDnGQwyye3FYLDIpKB0tsEiyGZ/M/a02/0joX1TjMwuFa81Er/7lY2U/qT5bgmmXBQdsCMmoNnizp16CnETJpJSl6BhurXD30lLdsHNT52Xzs7kdPlMgRmWwln++ahzYg+zVyTLZAti5+9P4YyO+9x885AeMecx/Xn2FVyDB08ZQDTcLAMHdNzhka8xY62MlMTxdvLBn+KImqZXkOAzBtORC6FapZr1SK8J86ozlljiPUg4VW6A7FkLHb5bfG2VYwPjJNO9eL9KOxzCYNH+n9Tn/Bau5HEyOYT1Z124w8LYGDsZEla/0JTa7hlXRrLI0j1pVl18hw8IaAHZarhr1jrNjAe/Px4bky2G/aRA1MNPJffzs86B
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(19092799006)(11063799006)(10067099003)(5023799004)(3023799007)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTUzVHNVbVBDdVlRR2hUTlh0OUNGdFd5RDhVVURtMUoveXF3YUw5dDdaMnlC?=
 =?utf-8?B?bXdtTjlEbEJBNHVzUDgzTFNlbVJSb3BLYU40Qmtkb3F4UzJBYXBacUg3RS9M?=
 =?utf-8?B?b0ZQNy9WVnNiV0VHOUwvYkRTLzhGdlh0YmJJckdjQnIvRVpRUXJmZThhVFZ0?=
 =?utf-8?B?MnlrTUZUeDc1cWdpNXc2RUg2ZDJ3RmxxNVF3UDVBL2poQ01abFJsRzFXM3Bl?=
 =?utf-8?B?QlEvemdQeXYxVXlmVzJhVWh5UWxlcmJNa3U2Vkg1b0hFY3kydUZCNUtjUG85?=
 =?utf-8?B?dVBPUk5FYjgrc3Q0Yy9pWmRIUzUxQmVZU3RtS0U2U0svQlhaVXVJRXVQN2JI?=
 =?utf-8?B?UTdUWUhORGM3WStvR0xFNlFpTEVFalNLK2RrYVI4WHRFSXM2dVBjeGsxWmk0?=
 =?utf-8?B?dlRBajdaVDJXOHczbkFEaGtnbHQwcVJQMGduWW9kSGFkbGYxa0JvQjhyVmZu?=
 =?utf-8?B?SWk0dGtHSnJKd29ESUNFLzUyNmt6MmhZUGtqSjNEaHl0KzNHT3gvemxXUVdi?=
 =?utf-8?B?enE4M3JWdGRLcVQzUTJCWXVGUW1BSXpDR1ptZ0V5T1FTcS9ZMDFXY1g5dnNv?=
 =?utf-8?B?VEh5MVkvUTk1N0JSbU1pRTVoTzByMnNVNXhjUk1VK2lNSGhxTzNYQzAvVSt1?=
 =?utf-8?B?YWIxcHlaYVhseE5ycDEraUdNYXNieVhPVHZDM2hwaEQyaXNsdktWd3NlQjQw?=
 =?utf-8?B?U3ZWOVo0SVNRYU9CU0hGNVVRaWhPNVhyOVNqNm9kZ29YTi9BbjhBRC9BSFB0?=
 =?utf-8?B?N2ZCZThiSUNqNldMaW54ekpoZXlLSSs4RW55NDI2dGZ3NldIQ0p5R0xLUnVM?=
 =?utf-8?B?TDJLS0gzT0xOdkFSNE1PODFCUkpFK0E4bGRCQWZFN2tBd3RJVFRtczBJc1Ex?=
 =?utf-8?B?WGFFOWpieDl2ZWwxMVdMOXJjUVI5Wm5nWTZ2U3htczJlVHVHVm5GbnB4emY3?=
 =?utf-8?B?R0h1NXpsY01CTnlDajJzbGZUdkQyM2ZCd0NibVN1QUI5UmtXUGhHTFFUQ09H?=
 =?utf-8?B?eXI4YklkYVdZbU1yTmd4RWJDcGlMSldCY1RzNndyUVMvRmQ1bGJtN1kxZ3pQ?=
 =?utf-8?B?QmhUcTBHRm9iVXYrTWNIZXhmU1k4YUYxdjBjeElBQUhVMDBaUE81SldsVXF4?=
 =?utf-8?B?UG51dDJuQk1Bc1VxQ25tdmVNa2lIOGx6dXhTdXhIME5ZVzhtdkFKTmhJbzBo?=
 =?utf-8?B?WkVqcm5KS2Vnby9nV0phRXN4QWJreWFBeFJaZ3JEWElUVmZVTkVuMSszMDBE?=
 =?utf-8?B?YWZ1SkdnaVlaT0phL1Z0QTgwNDdqZkFwS1ZMWGtrRUdqcHlDOXlvMUc1REkw?=
 =?utf-8?B?a0h6cXd3Tk53aWpmbjRSeTVLcnpTUjU4VUFuMzgzcHpkb2IxQjBQT25KZXVJ?=
 =?utf-8?B?Y0lrYi9hUVR6TGRZelVQcFU1TWxTL0FzaVFvVXVXTUtLVE5DeHlyMlJtaUdk?=
 =?utf-8?B?NmxGZUNYN3BaWHd4UW5YS0Fia0FKQTREMVRqTEpSUnFBNGkwZGVlaTVPR2Uv?=
 =?utf-8?B?YmE1NmZCVnpsVFBMOWdrV3duVXM4T1N5ckVEOVA5ellSYlVua0ZLVWVqSERw?=
 =?utf-8?B?VElwME1lWHdxWkRKTDVZR1dyeDU5Y2ppVVdXY2p6dFdMdklpL0N1dGJOa3ha?=
 =?utf-8?B?d0dMN1lUb1NsQ09FMlZ5Qzk4a2UxRkYwTG14UlltdjdMYVNrY1VWZ214eVhF?=
 =?utf-8?B?WFFXeDJFUTQ5azBVQ3RwSk9aZUEycVo4ZzZDTkhzMG9TbXNsMXowTTFDM0xv?=
 =?utf-8?B?MEhjOW1mOE5UclRTWnY0NTUvc0lZcldBc2JabHpFNHhXQXRmZ0lQUkZpTWlK?=
 =?utf-8?B?ZHA4MndYSGZ0VUc3M0dDMmpkd2FoVVd3UXBJVmphSGJKK2cxeFVMRnpja0hN?=
 =?utf-8?B?aXROWXlIYVFJSXlvMm5FdHNrTVM2SEphT2ZHWXcwbkJPR2JvZHZTUUV4VklK?=
 =?utf-8?B?NFVocEFYdWJyN01mTmZOV3pDMG9SMXJsbUpObitFbkdaTTMyamxENkZBZk1h?=
 =?utf-8?B?ZG5VVHQvTHN0WnQ0WTZKYVJqM3JDbmx2cUpYbUV0SWM3Y01aSllPQ2tnMHFu?=
 =?utf-8?B?WnZnUVpvalFkTGsvQ1RkWGVMSXZ3c1ZMV3g2L2I1SFBVdFJxSVBpWW1ZZTdR?=
 =?utf-8?B?d3ZuaGFRNEg3bHRidUt2bDlEWDdqd3lKbnFFUGlRNy9ESTRtTWVuZysvYjRO?=
 =?utf-8?B?dERQYzYxMzlrbVZDRkhjOHZFNEJIZitFOWRTekQvbm5HYTNlcGxPWndrS1dq?=
 =?utf-8?B?UHFRTjJDNGRqSlF1L3pFdHpsbzE0aEVzei9RamNWdXd4YzNhNk40akE3R3Jm?=
 =?utf-8?B?Tk5LdmJIM1h2eDNlUmxCdnFKTlV5dGRibGlvcmFXQTdGSllxYzYrYm5jVUZH?=
 =?utf-8?Q?SVlb15Q22MmnHtUhjq8LwJEdZ+CNRKdY2AXXY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71033ca9-e87e-41c8-1d14-08df17f9e789
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 16:03:41.2405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ApsadC2W0O4gZgzhjI8Fs2hDJHcCyKbB3VulPyZCr0QPKMRDSr4xa/kRW/xOwTo67tNAv4vpDpt3IIID5Sp5KvROqpDQeNh/POqaxQccUmK4HXwwC8UNNg0sNx5qdkyw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10870

On Mon, Sep 21, 2026 at 05:13:12PM +0200, Sebastian Andrzej Siewior wrote:
> The %pK format modifier was meant for /proc kind of output, not general
> printk output. Since commit ad67b74d2469d ("printk: hash addresses
> printed with %p") pointers are hashed by default and the behaviour can
> be controller by `hash_pointers' boot argument.
> The policy on %p is to not introduce new ones.
>
> The output in loongson2_cmc_dma_issue_pending() is the only dev_dbg()
> output in the driver and is only output once the transfer is started.
> There is no output issued by the driver if the transfer is completed, if
> a follow-up transfer is started or if any of the other callbacks (such
> as loongson2_cmc_dma_tx_status()) are invoked. This output does not look
> essential.
>
> Instead removing just the %pK output, remove the complete dev_dbg()
> output from the driver.
>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>


> On 2026-09-18 16:44:59 [-0500], Frank Li wrote:
> >
> > please careful,
> >
> > remove whole dev_dbg() when vchan_issue_pending() failure.
> >
> > commit messesge should show why it is okay to remove dev_dbg() here.
>
> Is the arguing now reasonable?
>
> > Frank
>
> v2…v3: https://lore.kernel.org/all/20260918201714.eFNI3VMq@linutronix.de/
>   - Reword part of the commit message.
>
> v1…v2: https://lore.kernel.org/all/20260918103409.UV4g2ON7@linutronix.de/
>   - Update subject line (it is removed, not replaced).
>
>  drivers/dma/loongson/loongson2-apb-cmc-dma.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> index 1c9a542edc859..27f8f7a5738d9 100644
> --- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> +++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> @@ -337,7 +337,6 @@ static void loongson2_cmc_dma_issue_pending(struct dma_chan *chan)
>  	guard(spinlock_irqsave)(&lchan->vchan.lock);
>
>  	if (vchan_issue_pending(&lchan->vchan) && !lchan->desc) {
> -		dev_dbg(chan2dev(lchan), "vchan %pK: issued\n", &lchan->vchan);
>  		loongson2_cmc_dma_start_transfer(lchan);
>  	}
>  }
> --
> 2.55.0
>
