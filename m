Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013047.outbound.protection.outlook.com [40.93.201.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328853E4500;
	Tue, 18 Aug 2026 10:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787050722; cv=fail; b=Y6XoEwGq52Eumi7tJ+55SNvHM3RPe37Ideqpe9gQiQwSnqYrCpZnnuswP5pDbKVE1yrYzU/Dwu2ZlEut8eXbvJv4e9JfmCXP5k0XNDr3Aa565ezl1gg42CR7sc1mtmfoZvFlAS4l03TQ6uL0A6mL+Tawvl4cZLSL0+T6dGDdmaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787050722; c=relaxed/simple;
	bh=52R1UFbu+sU3Cb/qBI3lufXcbjaVcHTObn2gEG1+qbI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ww9i6YVdnrr/YXJaNTOj2ok9w4M1WalFvj6E9Gi08YYT6LefRX7QhEf+diGbPo7OtOsCkDLuEztdcTdFvqN2mf0URP7KzJQFoO5N7sOPAa2QpO+vdWAqY8tm9iELkVNKT/vVScCnyOtL2WLw3rAku5a0iOvvwIAsADg3j3Fw02M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3tnF5vpK; arc=fail smtp.client-ip=40.93.201.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3tnF5vpK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icyVZOshtUcYG3rptReNToEYJXEHc7MqCzZKMsRe6ZKvA7IUekh9KMQrz2FcbHUbvGSIx9otzmuTufedmWxc79bGFsMP30OW5Gf5SqGd9gzff0q/ulT4XMJ8IgRMLjeLVFQOj1hai39DalN0COVl6SvPreGoszCiQhgx1veb4Pn3hsCconzMU8SJmtDTh4eDsFWIVH/14T+aLgIwAjifjdOXtRVpB2R9U4zI6PJqdL/te4+EJ4iKIyQp44G+oVk6SMe8FR2lLoH9kZ0MYpAStCZgzBBRrL2iFHmUNbGJ6qjoAJC2V35cEOb5vGnHyLIH53JiL8GAzwX/FtTpUSGM1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9P1KmBOSI0Cnpz6RomarMMXJG7bETLxu5bKrCpo4e8=;
 b=W+6EBvXYjpSQQGVFu3yqgDZ5bLYPFVa7v4KmHLwqb3lQ5QmzWepJzZavlvhCsJltLHe4APcnX9L+su2iqoOvTGiaY7x4OqUSIWhixdcocFj7+jranYGPp+WiDvUWCd6RJDjG9n/8IRV3AKNymQSYk9RGtbMiJzd/q2UxxAC0asczelAR+WF3vVxFNCF5wemjoMeoHBlM+YqtEoLoc6Rkmke8/XIHmOu0X1nVl7VwNjguyrgfN2kJ6yNTgdzlOHwG/JKA7sEQ9tXfnWQK/xmb4cyXhQ/akVgSapGiNQ/fUk4JwPa08hWjaKNTcquZia+iWU/FUWiQWYYxobb2argvPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9P1KmBOSI0Cnpz6RomarMMXJG7bETLxu5bKrCpo4e8=;
 b=3tnF5vpKp28F+FELQA6g/3KesTKi4WrS/7qww1TwyAr/jpvGNc2pVeF1x9wUzhyKIG0ClCRVSQEBASfWJ4ppVpQ1NB/RuF48drRsakX37sYdgBJJLOsp9ZFMl2UFgXanoprK25sJQCQh5votx+J1bMFNnpOeZK7xuNrZQcrXlOs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by SA1PR12MB8643.namprd12.prod.outlook.com (2603:10b6:806:387::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 10:58:33 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 10:58:32 +0000
Message-ID: <e2877b7e-eb3f-4a4c-aa94-ed0907578e6f@amd.com>
Date: Tue, 18 Aug 2026 16:28:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: xilinx_dma: Fix hardware buffer descriptor
 reuse order
To: Alex Bereza <alex@bereza.email>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Suraj Gupta <Suraj.Gupta2@amd.com>
References: <20260817-fix-hw-buf-desc-reuse-v1-1-d79827a844c7@bereza.email>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260817-fix-hw-buf-desc-reuse-v1-1-d79827a844c7@bereza.email>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::17) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|SA1PR12MB8643:EE_
X-MS-Office365-Filtering-Correlation-Id: d63e225f-f74d-4ccd-319a-08defd17a502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	ZrFl/n/ZRqgUBMru/c4uvg5AsylcvJJXdRpK1bgAqkMlmy6JwEnpWASRWWZX4FH+dzasYKCM9AlyHGtElmvWxhO3V/t5CQ7JTC53RByatHTaQyTGtavUNnLqaSsKu41KXNcTIRqn8nPE89nkLrjP0fHgzaGWqn6737BLhz5PkQfifptMTCDdY0zmTutvRHqcnjBwn1W8O1BR/L4XqVLVg3a1css1SiDUXSLdYdPHh3FzZerLDxAJGIBv+DYfTOWkD2ElJk7HOJKIOPTnQRFEBGcYqZV0q8rvXUbHJ74dXQ5uCt90aYYgVkBuDHuZ/AlsyOl1o16Upx+UoW7UZjE30Bxc9cddTP1pSsjIcThTHHE/sWkKaRvXlKTJ6S7f8VScUaPgeA138UDUaCZWx6RsS9TKNIUWS3bfElvPvJ7Y9fweyqkMZ6eeVJy/q58wGAfd8uI/4B6l6o0ZjybhsUDgwsg8qfHkcmBXeVGZYm5ga3ffYoRSLTpA6SfYbszwsZZtYuifroh+C/lK6vCEROyxD6r1iWM4zx3VZ+UcHU3/UyvXkVaNGxB1PT84ZxNNd73MG91vS6wS81zf+JEVe3w9YabAg+p2G2GSCVzoR6XNPmNlo/mGsnfsBTgJb23C450uxHDjLETWX2Mc9OUmvx90lgIYbEayXZBwkuf0dW3QZIs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGh1ZFFRclJLS1ZjYnUvakZSNmtxcnVYM3pHQUJsQUxmZndmYlg5ek9PTlI1?=
 =?utf-8?B?VXYrNEtDdGw5L0FKUVJ4VUEzWE9PU3NNK3paMXQ2MUdwTWRsSis4Nk9jU09m?=
 =?utf-8?B?STY5Qi9BZVNtS0VVbVc3SUx5bUZtTGZicEIrdHppUlNBNU9NZnpFRzJUT0I4?=
 =?utf-8?B?NG5EVXNjZkNsYVFzWUVKdHNRbUtBZ3Y1WmE3UzYvb2hpS0tSdURLR3dVYzFF?=
 =?utf-8?B?cU13T0FEb2ZkdjY5U0VtQWZpYzEyV2tQcUdJa2RmQ0hxRmRYYkRobk1yeVI1?=
 =?utf-8?B?UHJnZlRoeTRPMXhpeXZzejZacElMQXI5SHNmUXRlZFl6cGk3Z1lDM0loRFla?=
 =?utf-8?B?cGtYcVlxZUt3STBsMTFScjZVNWJIU0dDeWdHUFlPL0tpTDRFR3M2YTRxV2w1?=
 =?utf-8?B?TC9EbFZ4c2pNZVgrdVlLVzVzMjduZmdMVkN1bzVqTUJlNVBScTRQeXhuNndP?=
 =?utf-8?B?N3htYmY0M3kvMjJYQ3RyeEU4eHVsRy95NzBJVkRSVFlFbHNtc05XNjBIQ09r?=
 =?utf-8?B?amwvTHkrN3BwQVRDay9NNEd1Y0NRTmI0NXNRTjJGMWZXZkphMUo0U0c4Rnlk?=
 =?utf-8?B?cHVEc21KT25UNVdUQjVoa2ZlQ2kzVm1qeDdxU0w5blBUeGQwMmkvcG9JV2hm?=
 =?utf-8?B?QXhIbGNYTjNLUCtNenVaaWdLcVVtUk5TRk0xdXRhNE1RdythQnBTbDhtaXdV?=
 =?utf-8?B?bGgvRm5kajdVd1JzeFJ6SVIyOEE2S3ZYYm5yZjNBa09OcnRQcXBNNjFLL0h0?=
 =?utf-8?B?TnZoL21ESEhxMkJKN0JTUXkxQkVKTWUrTmNOOHNvK0tZZ1JaaVJoOEVBb2Rh?=
 =?utf-8?B?SlRGaXcvdVI3OE42SVlCdXQ0VnpHV0p0ZXRnMDRNVjRZMFR3VWtYaVBjamNL?=
 =?utf-8?B?NjRMQ3Z6UmdVcEFNN0hjMVBsYjNRclBGRlhSbDRSMmJzaEJCZ010U29obU8w?=
 =?utf-8?B?T1RNTGtnV3pmSlFQN0dVN1BiVk1ZQ04wRDBERnhEWGxpYlV2SHU0ZktUZWs0?=
 =?utf-8?B?bXBMZTRrcjVySlhVRUNrUEVNVkVPdzRJdGIrRkROWXhDTElUOHE2ODhiWEtZ?=
 =?utf-8?B?T2h4Vnh0MHcwaitsSDRQaElGK1M2NFhCZVhTQkNVNGhkYUcrd29wdGh5WDlZ?=
 =?utf-8?B?TnNJNGE4Uy94dk1rRm9mSVh2eEEydEg2NUw5V1hYUnNkZzJDdFdDUGFGR2JS?=
 =?utf-8?B?NjFtRlUwUElROFREdy8ydHVQeU5aNUlyUHZnOVRFaHVkZy9YUTZhNjVPbldX?=
 =?utf-8?B?OXd3dUhtY3FraHQ5THpJMFFqVGozQnJnQm0xRjIybHFqRmQ0NGpCUzVDQ3A0?=
 =?utf-8?B?NFdiTWJBNE1xd013SlI1R0ZRSzJINDRQeGs0UkFFSTJ6Q0o4OGh0L1RGcG51?=
 =?utf-8?B?bGFCSXRDclI1bCtFL0paNERHRUY2M05IWStxRnZXWWU2U2pZMzEwNVJXcVE5?=
 =?utf-8?B?bzZjNEM5ZkxKcnorTzVYQTR5S0JGb3hNWExOSjhtMXFsdnVsUkJETE90ZnhX?=
 =?utf-8?B?RFczRVErSXdUVUFsbjdBa25vYkxWZ1NmS0h0QWJVQyttUEJGRFRaK3Naa1V5?=
 =?utf-8?B?eTlZdkM4eG8yWnRFMEx1RkQ0eXd1MWdYWiszdFEzK3YxQ2RQa3ZNMHR6c1Zx?=
 =?utf-8?B?SkphMFZRUDVVMW8wRWU0dDFpOFZIaDkxaVVKZ1lYMGlNdVFlWkxadExwUllQ?=
 =?utf-8?B?aExrTExaR01aV2VVNEpCQUhtTTdsSjNaNDVGNmcrMVpGUEZUTURpMURsbGhn?=
 =?utf-8?B?Wmt3b3Q5Z3F1Tm5jZ1pWUmlRcEpnT1QrRHBXdTVQRUdydGM3NzNaSUFjeHBz?=
 =?utf-8?B?eDhhZWpsUmU3OExMNkhybGZPRnJ6OGdudVNOcERtdzNlZEMwbWh3b2t2SXBE?=
 =?utf-8?B?V3JBY2I3QlgwbUFFMjBpQ1FwZjNYaW9rYlVkRVoySVdsR0RIcHZFMzBBV3Ba?=
 =?utf-8?B?RkQzaXBhQXhqV2txVWVDOG1JV3hLc2oyVTFXRVFDQTRWQzhuL0VId09JMFdW?=
 =?utf-8?B?MTIxNnhiZW16VzFaR2xhLyt4aHRVT3FZNkQ0WGU3bCtyWVV6WVMxMnlSc2F4?=
 =?utf-8?B?MGxaWGZ6UzZpTXNURUJYZExpaEtPNDBzcHpIMXo4ZzYvdGc3eE1YZVdzZlRX?=
 =?utf-8?B?WUovZmtjNzFzdTU1amc3NVloTjlBcXQreGVzTWNtUE8zVmdrUEpuNlZwUXVt?=
 =?utf-8?B?c3dva1ZWR3c4cGM4WVJpUnVzUy9KVXc2S0svZGhGTHdGb2VaZGZMcU04YmY1?=
 =?utf-8?B?Ykk5SzlXL0o1bEgwV3dQdjRaeTNEaDBWT20rY2dzclpHUE9sTEIvS0hwK2dE?=
 =?utf-8?B?RDAvSm1jUzZJa2ZCTUhKV2w5dGJtY0Y2TSs5V01xck5URk9Fa3hodz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d63e225f-f74d-4ccd-319a-08defd17a502
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 10:58:32.8388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T82scCeuLBn8+f/Iqo1syp1zo6SXU/RB39EtMRZn1x1obVvo2gUUDobrJmupEfW+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8643


+ Suraj

On 8/17/2026 2:53 PM, Alex Bereza wrote:
> xilinx_dma_alloc_chan_resources() builds a static ring of hardware
> buffer descriptors once and the driver uses this ring throughout the
> lifetime of a channel. This requires the allocation order of hardware
> buffer descriptors from chan->free_seg_list to stay in sync with the
> hardware buffer descriptor ring built at channel allocation time by
> returning oldest descriptors to chan->free_seg_list first.
> 
> When chan->pending_list is not empty e.g. during
> xilinx_dma_terminate_all() the chan->free_seg_list and the order of the
> static hardware buffer descriptor ring get out of sync. Descriptors age
> in this order: pending -> active -> done. So freeing pending_list first
> returns the newest buffer descriptors to the chan->free_seg_list first
> and thus breaks the order required by the static hardware buffer
> descriptor ring. Then when the channel is reused, after a wrap around of
> the free_seg_list the DMA will find a hardware buffer descriptor with a
> length field that is still zeroed and stop with something like this:
> 
>    xilinx-vdma 86000000.dma: Channel 000000003a21d7b8 has errors 10, cdr 6de4c000 tdr 6de4c000
> 

Just to understand - can you share steps on how are seeing this issue ? 
During terminate_all hw is in reset so how is free ordering matter?
Want to ensure that change of order in not masking a real corruption.

> After this no more descriptors are completed and a consumer potentially
> blocks and waits forever. The only way to get out of this error state is
> to rebuild the static hardware buffer descriptor ring and the
> free_seg_list by releasing and re-acquiring the channel.
> 
> Fix the order in which hardware buffer descriptors are returned to
> free_seg_list to ensure the mentioned requirement holds.
> 
> Fixes: 23059408b6a3 ("dmaengine: xilinx_dma: Fix race condition in the driver for multiple descriptor scenario")
> Signed-off-by: Alex Bereza <alex@bereza.email>
> ---
>   drivers/dma/xilinx/xilinx_dma.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index bef2b031dba1..0817b74f7450 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -920,9 +920,9 @@ static void xilinx_dma_free_descriptors(struct xilinx_dma_chan *chan)
>   
>   	spin_lock_irqsave(&chan->lock, flags);
>   
> -	xilinx_dma_free_desc_list(chan, &chan->pending_list);
>   	xilinx_dma_free_desc_list(chan, &chan->done_list);
>   	xilinx_dma_free_desc_list(chan, &chan->active_list);
> +	xilinx_dma_free_desc_list(chan, &chan->pending_list);
>   
>   	spin_unlock_irqrestore(&chan->lock, flags);
>   }
> 
> ---
> base-commit: 0d995da5fb97e8c312834575604d4423eb6225b7
> change-id: 20260817-fix-hw-buf-desc-reuse-b730e9e02185
> 
> Best regards,
> --
> Alex Bereza <alex@bereza.email>
> 
> 

