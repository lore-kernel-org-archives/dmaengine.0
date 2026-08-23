Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010035.outbound.protection.outlook.com [52.101.193.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C89F2D7398;
	Sun, 23 Aug 2026 11:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787483757; cv=fail; b=K9ifu5ojB1fDd/hi/7jVHX5qKZ57GnjvxbpzIc1XaNJBNNEeBC20yVjzgAca85UIbKftLdMrXlvyzrVfZT2huY4LqfFb56grKvFaWYXFO/+uuHlVF0l2Kc/Grj99sMcUXwth7vPGfExhkhCio6yZBl9iZHaegUzpc/YP1ib0L7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787483757; c=relaxed/simple;
	bh=+EdWVOBOgAbv1f1fqPR1ViyamAt8EFJIskb06IUdTYg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KK7su2+6y2mRdSdWcYPZC9yyk+L4JQmnrYqesqUl8nk0KYgDihO/bb6VIXsZD2sTOT2YGDv4HYiyx80AwCyz8YZQlDQ39GeP5GanKB/8jzadSD9/SNHRmB4Q1O6JToEj76BLt94Q7YlgTYE71ZBhsI4lZOanMndXFyBmS1MTyeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=o6cRBE5w; arc=fail smtp.client-ip=52.101.193.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="o6cRBE5w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZKa2mIGxHF9iyCzOd7qutwjVcV8sjFJvsZbCyutyFplWy+eqRo/RTp2sbXuW+gPvB/Gw2k5ra/j9rV4bVoAEoWRO5N6/5EphnRF52PZO2Lyx5+VlQkVu5qzNNkzncsJ+DqO3OfCfQhLI9dJ6B8v/BHIeFdJKmLJO+mjrVPlunZrZY1dEcVYa9fB9EOb7hfPuniU3yZ1TSqymYmC9UmLhUDoleYtMO2M+BCr5+vQcxbRP1bbo3aIkrl4pK/1ygTwXgxuUKnS58eLyRX46XomKIemZBc3ZFLzgxJ60OxFjfW1gPWu8xBuv8dSE6c3u2jhF23Uw5KkjqUhsS2ea/3hdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouuGFnsKjQNpuwoM6dF1Y+jtDqYejK1GOyVqd3Z99ks=;
 b=vFsILYgs/bR1eokhsOLLKBG04wNpcit7hwN6DvzUDi1j0r1HZeYm5SI68dFYAfP9ocVHRxe94ZEGAnnZtf09YoXT10H17PvDq/ZtDDc0H4eOt+vw8ye69GAmbxPaDs/oa2ZPICIyHzN3Mc9D8TrOKNY6cVVTpEJc87KEcOk2uQc+KaYxmEbCr/ZFL9H7DMnH6lTTnDJbKMzqKaD7Bojyb8YNhI/aYHjV4ZeZG2lKWsBue6s4EI/Yx9OAZ0Z24R6RhE+zMexegNs5j/ArSsgMfbKS6Q1ghEUSK7WKHqemR6/2c9ja8TZcjNNdItOyAsL3iSEDTXYjPIsifPgo2C7HBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouuGFnsKjQNpuwoM6dF1Y+jtDqYejK1GOyVqd3Z99ks=;
 b=o6cRBE5wsVxBkoTu09tG5m4TAEJHe1YQJFeNz/GYaEJDehsrP5d9PF0jQQqMfjbZ86aRUzjjQlDJ+FqzWzppcqJyvUuBTtVipzHzcglKypvbx9KlEYrUF6F0D3D48aEo2yGghqr2OmeI5p3ADL273gsupQ96XEbU4QAVrjL8Vrk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22)
 by LV2PR12MB6014.namprd12.prod.outlook.com (2603:10b6:408:170::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sun, 23 Aug
 2026 11:15:53 +0000
Received: from SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54]) by SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54%2]) with mapi id 15.21.0315.011; Sun, 23 Aug 2026
 11:15:53 +0000
Message-ID: <a0512e2e-f570-4b42-bd3c-0091bcfe1c04@amd.com>
Date: Sun, 23 Aug 2026 16:45:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: xilinx_dma: Fix hardware buffer descriptor
 reuse order
To: Alex Bereza <alex@bereza.email>, "Pandey, Radhey Shyam"
 <radheys@amd.com>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260817-fix-hw-buf-desc-reuse-v1-1-d79827a844c7@bereza.email>
 <QjUGg1to3KFvzKpfc2FoL0vjidDyRPAjT3cURLYpXEfdqk7LPzrRq6dCkhEROkPP47rIdqQYBa-BYKkdSV-oGQ==@protonmail.internalid>
 <e2877b7e-eb3f-4a4c-aa94-ed0907578e6f@amd.com>
 <DKS25RPXGPXB.2I0LD9EHK9GAP@bereza.email>
Content-Language: en-US
From: "Gupta, Suraj" <suraj.gupta2@amd.com>
In-Reply-To: <DKS25RPXGPXB.2I0LD9EHK9GAP@bereza.email>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYP287CA0103.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2bb::10) To SA1PR12MB6798.namprd12.prod.outlook.com
 (2603:10b6:806:25a::22)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6798:EE_|LV2PR12MB6014:EE_
X-MS-Office365-Filtering-Correlation-Id: 426b62e8-3c5b-4d95-7f43-08df0107e55a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|18002099003|4143699003|11063799006|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	taAtzvOZbJpq9GleRaTLn08t9Mtup1iJbx2rGW78XbeVC4UPh47O5kGlChBkiL0V1O2rNd4XeSyCdw98kkIRJHvNCZMdxyvOzbH6yn2YA7Z2fHdNxmPGy0JxR3u1e5qQD1KdM84TI+7ZuceYym/i+Rpj8Ba6TkfJW5i88DH3igKY3BwJ1js4p/QQaOeJmpkUizT1zbhlzo7EyEyGtURi5mNDriXdYMQy+bx213opesBbFLgV/2EnWNCDjtPhE1U566mFIIqFZiwuvtqR7d0bfliO9E2NHl3LhFMKrp33jXRqCt7lF56FRDPa5gp5RNFfe4F9QYEsduyPK5pCGNB1aPOaUdlT7ipQzxkj6QDFQ/nUJ914IQc1MycjX1qYAfkz4LhuJa+RXR40DYb7QrD2BkY9d8YHL7Becwgi1utrw5WK8yJ35xqNu4fqO/Qxwm3B3lX4gF6HHeWJG3WaH7jLlSYkjrgdQMsZnmgbxL7H+OZUvPmWOlOFAmwvxAqsDglkmVhacy2+UtZX1Bsy7u7jCjTNfVkH5Ay1Hpu2SfDr1qSs6Oq5f4FhJBPF61fsN7OIiuy4lmGy1C9xNEbo2LVWQcqaaJiQlsoBJ0oximD7NIO5TJqE7Dv+DEEEU3qVCi9Wcz+A5NN5rvRr4YNOYmeBV+iNIvDcrNi5fSp9Xa6U80s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB6798.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(18002099003)(4143699003)(11063799006)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmNIdndZbEQ0YzlGT0tLcHNsRXZ4YjV0WU9McW5NczlTUW5LaTJMTFk5dzZm?=
 =?utf-8?B?V1lIT3IvOStmTC9oTUVnTzdRT3A5VGFxOFAvcUVjQVFYZUJDSmN6QkNyUFlh?=
 =?utf-8?B?clRHY2ZGSlR5bktENWtqRDZYc0lWQkhLbjFzd1FMakQzR3Z3cmIwQk5Zc1Uw?=
 =?utf-8?B?V05maGVxK1FHZjVwMlpjUnF6NVQ5eWdaM3QxSU1mWTRyN2ZvK01lVVloZnht?=
 =?utf-8?B?UkMvc1VxQ1VQRUFxd0JNRU00cVpKNTdnWFg0ZDEwME9ZY3BYcVVQNFdHYVhl?=
 =?utf-8?B?Um5CUnJFcUpBdVpxdmNJc1dMNnFnR1pEQytJZVNCM3hheGV0NVNHamt6OGR6?=
 =?utf-8?B?d1l2dFBlOHYxOENRb1NreTBCRmUwd1NDRm9WOFErdnlJN0Z6T0lCc2RwaktQ?=
 =?utf-8?B?dy82SytzZG9tMmE2eUVTRU1EQk5TT2loRjM0TFBlZHVYQ2F3VFpnY1E0V1VX?=
 =?utf-8?B?Z3krSnFJaWRjUUU2OW9yVHNSZm1iMHNiQ2ZJMndra1ROWG80ZHdkcmo0VjJC?=
 =?utf-8?B?dkpsYnpTZThzUndsV2pSTDVQcGRVaTBUaWJyNmJGOVpRUFNOTnpMR0lra3FY?=
 =?utf-8?B?U25sS3pldnMwSHFZZXQxakFENzRLMGFYSHFyV3FMVDNhb3FsaGlJQzcyVzNw?=
 =?utf-8?B?TlJHV0ZXak9aRWJVRTNlclZpT004QURVTTV1WG1rb2tSa1FZUEI1aVhObTFq?=
 =?utf-8?B?MGl3aHhjblExM0owRXJCWGhIQUxEcnh6TTlUZytrK0tDb3JwazJIVGxQZEx6?=
 =?utf-8?B?K2ZLZE9yYmFnalpHSS8wNENVK1RmdzJNczlydy9BdmdJb2IxT1FUWHl1Rk5S?=
 =?utf-8?B?ekFFS0M4ZUtmRUlYZkF2MEh3ZUppVFd6VnkrV2xZYnVYM05PbnU4eFZ6UDFz?=
 =?utf-8?B?cXhlU1JmeEhXU1RZek8rNG1LaVBnNi9RbXBuRVN5QXV0cjQzY3lSdVNvRkk2?=
 =?utf-8?B?L3YrYkVNVzJGSjR6KytyWmpha2RJeGMrS0pEZlR0ZVJqOW5xRUlhU0h6a1hO?=
 =?utf-8?B?eDBrQ3lCUTNwOGpXajcvWGdhSU5zNmd0SlFOMXZYMzhkM3hYd1ExcURsdXdj?=
 =?utf-8?B?aUFpZkpoQVJCbVZSUlYyZ2F5VTcyOWZLcXNNajdFeUtTanI1L3N4RjZLV2NN?=
 =?utf-8?B?aE1ZQjdDblRRVk1FWDJ6Vjh5aUhFZVdMam9pZjFlY3h4dmQ3dHE3RVJEckM2?=
 =?utf-8?B?SVpMNFc3SjdJWkNlRmtWRzNXT2d1N1FoOEFQMlJLR0VxUVJSUDRUVndlbVpl?=
 =?utf-8?B?QTc0dnAyTnZSbzFzMUFZYkNIVWMyV0orMTJMclVxamNTRVZxa05wZXl5WVNR?=
 =?utf-8?B?YTZWRFc3YkRxaUgyNUZhYlYyR0k1VXBGdkZTRllsaU1BYkpKeGdDWktYTmtr?=
 =?utf-8?B?YjVwTlhoL1lRVHYyaUFacEJqY2JVbzI0NEgwN0xCRGg3QThxYjRLUncwdWxa?=
 =?utf-8?B?Z3hIUUg3cDNhMHkwZENsMUJZbWxOVC90OVJqazlNTjhDVGtpT2xFQkVCNk5i?=
 =?utf-8?B?dHNCOTlXb0tUcytTZU95Uzh6ekp5cW91aURvUW5IOHdicjl5eVhZLy9wSlM0?=
 =?utf-8?B?ejM2SU1LaWtSbnk0T0VLN2g0dW9EMGZDbGZ6cS9YakRqaG9oNEdoSU04dE5X?=
 =?utf-8?B?aDBsV1NuRUNrM2UvRk1VS0VveXhKWWdpVGxBU3FJaGJNZVBoWlFqckhkdGpY?=
 =?utf-8?B?ZkszMTROdEc2ak80Y3FLWEt4REdyaEMxOEtteDRQb2JxUWtYUlc3V1BYUk41?=
 =?utf-8?B?THlLQUQyM2xsbGpTdXRDU1lOekMxSHkvUEJoYll3MlZVekZ0eHNib3pFeUUx?=
 =?utf-8?B?elU2MXE5OGwvMHBXY3RqRWlMMGtYSG1kb2haTUx0NXRFcGRCaVJ6Qk51d1FL?=
 =?utf-8?B?cmJjOG5PUHhQL1ZvRnNwcXU0RVVQeWRUWmhmZjZOLzlnVk85anVZTWpsSnBI?=
 =?utf-8?B?T1lUazBhZ1YyZ2pkMVZjVUNEN3pYaWM3RFJtb0ExTHhMVnFhalJKZWNodHRL?=
 =?utf-8?B?bktUd3BlbEJEbjRFeDlUWlM4NkJ1NUR4TW9VR0pQT2g0bUhrN3RXMmtwMWhT?=
 =?utf-8?B?b0FtQ1lzbTlzN0ExR3NQMjlrbDJrSHB1SFNjL3NoNDRra1FTNTNjeGJIVzly?=
 =?utf-8?B?d1VvUmdENzRlREVScjRyV0tPd1Y4d2R5TVRRcjJzamRrWXBKbnJ3VTNlTS9L?=
 =?utf-8?B?dUxCRjJTQUpEZXc1MS9NN0g1OW1zWlh0VkxJbVZjMTcrVERXeng0QTArM3pp?=
 =?utf-8?B?cWVndTZFQ2hGenQ4blJIc0tqVVVYMzBZYlgva29NT2FTSGhrbDdQbDZZeGtZ?=
 =?utf-8?B?RHZzdDZSMmhRNzB3dHc1cEprQ1FVK0tVSDRlNzdzc0JoUkJuRGZLZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 426b62e8-3c5b-4d95-7f43-08df0107e55a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6798.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 11:15:53.5211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sjkW51DlXrGLAxMQn2KSj0QELJ2gRQjP6+cWaNiZmArKCrcPAfYj+/kyBQSDEAh+XMkqGKaty0+vpxwB39KxbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6014



On 8/18/2026 5:41 PM, Alex Bereza wrote:
> On Tue Aug 18, 2026 at 12:58 PM CEST, Radhey Shyam Pandey wrote:
>>
>> + Suraj
>>
>> On 8/17/2026 2:53 PM, Alex Bereza wrote:
>>> xilinx_dma_alloc_chan_resources() builds a static ring of hardware
>>> buffer descriptors once and the driver uses this ring throughout the
>>> lifetime of a channel. This requires the allocation order of hardware
>>> buffer descriptors from chan->free_seg_list to stay in sync with the
>>> hardware buffer descriptor ring built at channel allocation time by
>>> returning oldest descriptors to chan->free_seg_list first.
>>>
>>> When chan->pending_list is not empty e.g. during
>>> xilinx_dma_terminate_all() the chan->free_seg_list and the order of the
>>> static hardware buffer descriptor ring get out of sync. Descriptors age
>>> in this order: pending -> active -> done. So freeing pending_list first
>>> returns the newest buffer descriptors to the chan->free_seg_list first
>>> and thus breaks the order required by the static hardware buffer
>>> descriptor ring. Then when the channel is reused, after a wrap around of
>>> the free_seg_list the DMA will find a hardware buffer descriptor with a
>>> length field that is still zeroed and stop with something like this:
>>>
>>>     xilinx-vdma 86000000.dma: Channel 000000003a21d7b8 has errors 10, cdr 6de4c000 tdr 6de4c000
>>>
>>
>> Just to understand - can you share steps on how are seeing this issue ?
>> During terminate_all hw is in reset so how is free ordering matter?
>> Want to ensure that change of order in not masking a real corruption.
> 
> To reproduce, pending_list must not be empty when
> xilinx_dma_terminate_all() is called. For example by calling
> dmaengine_submit without calling dma_async_issue_pending and then
> terminating.
> 
> Since pending_list was freed first, the newest descriptors were appended
> to the tail of the free_seg_list. Then when you continue to use the
> channel and allocate new descriptors from free_seg_list you will
> eventually cause the hardware to walk into a buffer descriptor with
> length 0. This happens after a lap of free_seg_list, when you get the
> descriptor freed from the pending_list previously. The hardware buffer
> descriptor ring reads a different descriptor than what you "allocated"
> from free_seg_list and fails, since the read descriptor's length field
> is still 0. This is because the hardware ring order is different from
> the order in free_seg_list, caused by the wrong freeing order.
> 
> The reset does not help to prevent this, because the hardware advances
> along the hardware buffer descriptor ring via the next pointer. But the
> driver hands out the descriptors in free_seg_list order, which no longer
> matches hardware buffer descriptor ring order. The reset only re-syncs
> the starting point, but not the order of the two.
> 

Looks fine to me.

Reviewed-by: Suraj Gupta <suraj.gupta2@amd.com>

Thanks,
Suraj
>>
>>> After this no more descriptors are completed and a consumer potentially
>>> blocks and waits forever. The only way to get out of this error state is
>>> to rebuild the static hardware buffer descriptor ring and the
>>> free_seg_list by releasing and re-acquiring the channel.
>>>
>>> Fix the order in which hardware buffer descriptors are returned to
>>> free_seg_list to ensure the mentioned requirement holds.
>>>
>>> Fixes: 23059408b6a3 ("dmaengine: xilinx_dma: Fix race condition in the driver for multiple descriptor scenario")
>>> Signed-off-by: Alex Bereza <alex@bereza.email>
>>> ---
>>>    drivers/dma/xilinx/xilinx_dma.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
>>> index bef2b031dba1..0817b74f7450 100644
>>> --- a/drivers/dma/xilinx/xilinx_dma.c
>>> +++ b/drivers/dma/xilinx/xilinx_dma.c
>>> @@ -920,9 +920,9 @@ static void xilinx_dma_free_descriptors(struct xilinx_dma_chan *chan)
>>>
>>>    	spin_lock_irqsave(&chan->lock, flags);
>>>
>>> -	xilinx_dma_free_desc_list(chan, &chan->pending_list);
>>>    	xilinx_dma_free_desc_list(chan, &chan->done_list);
>>>    	xilinx_dma_free_desc_list(chan, &chan->active_list);
>>> +	xilinx_dma_free_desc_list(chan, &chan->pending_list);
>>>
>>>    	spin_unlock_irqrestore(&chan->lock, flags);
>>>    }
>>>
>>> ---
>>> base-commit: 0d995da5fb97e8c312834575604d4423eb6225b7
>>> change-id: 20260817-fix-hw-buf-desc-reuse-b730e9e02185
>>>
>>> Best regards,
>>> --
>>> Alex Bereza <alex@bereza.email>
>>>
>>>

