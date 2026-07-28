Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012050.outbound.protection.outlook.com [52.101.48.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4963B95EB
	for <dmaengine@vger.kernel.org>; Tue, 28 Jul 2026 20:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785268820; cv=fail; b=BGnDPxPV/jGWyBmkOT1my0IMQ1EuIS+wpqerQEuZGzSiVckVnKV2PYDeP6dYEdhwPHSs2UEdUexQ234vz14w9RWcqgFd8uAgcyKh4PDFdatfft5/92xnLjn+sCycXcqERCu0W1xeILykeNhCu2XO3/4o9wABqDXJNhGADXpOOrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785268820; c=relaxed/simple;
	bh=UL0PCXAdK4Ihxval4BGk/16aNHXa3FntNDvJLYqs5Tg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NkehBzvtprUSDTWOC/9S/AlI3kxdu28L9atfhOFTQdLyFFNjamLV1wvkueLuugdBRi8OmL3nNsV9GOPM+HHKOsPBHO8f9/Cqw/pvjKzYMbQWWpuhktcXCk/B06GWX7bfQJ6BcHRbSoGOsbeg3TeAhT3139MMlZ6R0uJM2jI/ALs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0TkEkcE1; arc=fail smtp.client-ip=52.101.48.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0TkEkcE1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ReC0JNVI5ndj0NDLgh2dD6K+hdnafPlBdLzwjsKix4WGrlbOOQqrB9kBuH74UisncEivpqD3SM+LpL3/mjTJk/oRKC21++pbnc4zMLmt2Bxm1BugOB65WTcj4M49ig555N+HqdAovWFXRuT8TFB9T+znbAhRIKBdkD2gL1WX9Is8z2513HmxMXv+UQ50lBHOfX7/dkN5F9ZtdUTtdNWmuJrfJSr3gAOvDtUJzX4Wr/erhQQxeWMad7QLGubZYXj7CfLTw7SGi5YGrnRT4U647j/OeLCESGfc68GAovla2Y0tCVSttDTUPmlM0QEkFNY50qVI4DRJ6W2OlgHzwqieZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67ORwT0+c+C50AdVCnZBRk+0DvFJAmkZ5fDn7lGSrtk=;
 b=FSVSHndd7MJQldYMhmKCmVWGFW+N74cUdQWOHuyVvvWBZNzmeifkweN4DTkfjB5fCOMv2Nynr1Q5dKT/nqIubYcOi3gVHm+Z5YZHY6uzSM8D2ciSG1ZElvdbol72JLQ5iVEcARUpw5WaJS+8m1p1NRkwGQYGiu+lzTMTOUianlf/aWVeHA4vz5MKOC/+VLEniRFOdfEB3Hao/EZnuk72mE4/OLdlc58R+KU2DrS7cN6YeQaG68zvapzqTlFWSZe7k3SE1X08ifG4bp+J8hXddrKaYuPO3/VEoJUEYv1OKsdY5oOZBgS8wxNqtLq0vkt5i+Bdt5cmR3pASsY8NyVvJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67ORwT0+c+C50AdVCnZBRk+0DvFJAmkZ5fDn7lGSrtk=;
 b=0TkEkcE1o3QZpDBVu3agyCLPX1Hz4Yt71lq6MQcD5XskWSXND953epZ4S7zBDA6fmJ6PqEl1spfJYZohZqHv8+TBI/W3gohRwoHQsajy5yO5Qx/0z01/NP6d5FQNIgAUa2ckURS6xHPKrKuLg7jrF0yZyEx18r5XoY263wexMPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB9020.namprd12.prod.outlook.com (2603:10b6:303:240::6)
 by CH1PPF9C964DBFE.namprd12.prod.outlook.com (2603:10b6:61f:fc00::61e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 20:00:13 +0000
Received: from MW6PR12MB9020.namprd12.prod.outlook.com
 ([fe80::879c:bf22:f7a0:e8c8]) by MW6PR12MB9020.namprd12.prod.outlook.com
 ([fe80::879c:bf22:f7a0:e8c8%5]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 20:00:11 +0000
Message-ID: <6efbe8c2-4c90-432a-9cf8-4b9d1498d2e1@amd.com>
Date: Tue, 28 Jul 2026 15:00:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dmaengine: dmatest: Don't forcibly terminate channel
 in polled mode
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
References: <20260722-dmatest-fixes-and-fatal-errors-v1-0-8287709987ea@amd.com>
 <20260722-dmatest-fixes-and-fatal-errors-v1-1-8287709987ea@amd.com>
 <20260722155751.289771F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Lynch, Nathan" <nathan.lynch@amd.com>
In-Reply-To: <20260722155751.289771F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:116::26) To MW6PR12MB9020.namprd12.prod.outlook.com
 (2603:10b6:303:240::6)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB9020:EE_|CH1PPF9C964DBFE:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a6354c0-1d6d-44e9-394e-08deece2d512
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|6133799003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BVwny2hrIVaypdTtP3MBeA8w3Id5pa/KitknczgR4A/Y46LQ+TfPC9Ds4rFByEm2cjsOPo+59yf+HDzORb2MXU3GxlpWJvFz/GohrmzHBZHGyE3XtCoWj9/Lp0t48hzli+WZ6R68LSb4+21TmhoqUOnDEjzTM3J3J5fyc0/sd6Q+f22A3jK/54K0F0v58k7RKO7YFywVvkRRKLIIdTFjDCk/fnYjuUIpRkuZT/8mHqpP/5TGixomS5xLcyRTVjVKxpDivRQYw17TjDB1/9/erQlpoZBezlDOGLC1He0KikoMWXFEuu5vasMKNJEouO16q4r/yAUFHzzIQpFAo9SbJeYaX9bwWNod9H3XK7IBWCbCeBGVcYWb58/ipVBgwJ+k+E4Jc65kL2p/gGGmFQroLom+VPyQ4yRkhoqejttliQ72PQgPPHl4aUkVnyeU0Le44WrkWEGacwYEJsrNuUNKkMqKFNdJAjNT0L9g9FpRSkl2LbJrOibOiVTa2o4CevmVrtL1bLGAYfzhcolKHbPopj0pE+9kSZe7LB2WiWo8NmyVYeaiUwvDw6+D5+4VcoHwwSEhDQHEHIzuipJFg6CyFhC9BNR0FThU7gnnHCzw0mc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW6PR12MB9020.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0pvaVI4OC9HVEJwQWJzcGhCQXBJM2EwRHovcC9hZGkydzl2cEZaVGFRTE1i?=
 =?utf-8?B?YktWYTJKdFY4dDJ6c2lKaFJOc3hnaklVVU02RUtMdkhzd2JMdkxseWxSb01n?=
 =?utf-8?B?K2hjWEZOZEYrYmtId1VLU2JlQjkyQ3YrQ3ZiN0ZkaVhEVk9FUmlqcnRSZDFy?=
 =?utf-8?B?TUFZSjFDOEEwWldRN1lBYmJwY1JsYXZsQ1p1dTVld1ZMZ3dRMlhoNW5XTGNm?=
 =?utf-8?B?R0E1MWdTL29GbjEyWDRidTdMQ005Z0NBUXloNGd4RnFzRXBSRzdLQkhGVlVO?=
 =?utf-8?B?TlRHZFVReFVNTmRoVlU0L0Z0RFI3SXBnWENwcW90Q3RVSmdiUy9TR1pGUy9O?=
 =?utf-8?B?WG9uODdQcSt3c0U3dkZFaWxRU2ZEMy9BWGtBVWVkN2d6QkRCa25jc2NJbGdS?=
 =?utf-8?B?V1Jwc28rWnF0c3hrQ3MzQmh5NG40YTdHYnNpbkZKRDVpRGE2b0o1dUFWeFZY?=
 =?utf-8?B?OHFvM1k0WVJGMnlhUUwvRGhjR0xzVTNOK3M1M3dEdCtPNkhWdTNmM0JIWGVs?=
 =?utf-8?B?TUJ5Sy93ajhCeTFZdUxPSVBSU1VsWnpiZCtya3RvUTEyZjErSGIvOXN6U1dj?=
 =?utf-8?B?NUdHUUtHU1BQRWh3TE13RzlRaGtsN21wZzIzNkhLeGpaZ3YxcUowTkxrSjVa?=
 =?utf-8?B?V2RYVDBadkFHcDdkWGtpWEJSMEpMekliM0poWlVvTk4wMkVKLzBlN3JPU04w?=
 =?utf-8?B?V1BjNWpxT05YZjRGbGFCemo2N0owOFIydnluWnhvSWRYNkRnU2VLZHhpWWdX?=
 =?utf-8?B?NCtFanVTKzlSTEZkeHNGUHdwUWZuaFVsZmFqY0toVEJvYWMzbFNvSE44a20x?=
 =?utf-8?B?NGFHeGFFUUk4ZkdGQklhM0NpWXFzY05TeWNFQkFGWkFISmd2L05lenZmUE1l?=
 =?utf-8?B?NnVuRmJZSGdKS0JtUHh3TlBmZDFXNFRJanBpaDFydjlDZGJvd2xzY1pRRmFR?=
 =?utf-8?B?K2hoZ2FZblF0b2N0RzZCY3ZqeTlvVUd4MURQT0RHZTYrN3Zuby9EWkhJMVFt?=
 =?utf-8?B?L1B6VmhCWTRybG1VRHNyWXJ4WjA4UG1CZEZwN1lNdDdSZCtBUkFuQkFUNnZO?=
 =?utf-8?B?UzhUTmlUUFN6cXBDbjY5K3JJR2tBNWo5bCtSbHNjNFV3Y216MWhvZ2xuMlMr?=
 =?utf-8?B?U05KRGhRemhtR1BBejNKd2lRTFRqcXIrcWhabEpDbmdiVGNaS1NPZm5ISUJO?=
 =?utf-8?B?V243VEo3eHZ4dkwzQWZ4N3pjM1pLRFY5eE9oc20xdy9mQTRTUXhpN28rTWx0?=
 =?utf-8?B?T09IZkVSRmdGZG81QkpQMlRvSEpZSnFVdDRuZm1rZC83K29QaTMvWWR1dk1I?=
 =?utf-8?B?S0hiMDc2YjZORHh2UDVqVXdrVjdlVmM0M2NrV1ZQMmV0NkE5RW1DZ0dGZHp2?=
 =?utf-8?B?V1lhU2g4NzE1UUZSMndqRmdaVjk0ejAwbEtUNTRIaVdmTE5nVlhGbHh1S1Ew?=
 =?utf-8?B?eUhQUGg4Yll4ZXRmQU9DM3VUSXltcStVdVJPdUhORk1Jd2NFUzBsTnE1YVll?=
 =?utf-8?B?M2NaSk5walkrUk82OFFtc2pkVXlQcTVJckFyT1FrVFIrbll3OUpzU0puUnRJ?=
 =?utf-8?B?Rm5YM3B3WjI2YnR4U1V2K0ZJWFpNSEIrZ09kM3l2UG1xMS84dDlwUW1yeEJ2?=
 =?utf-8?B?RlUza2JZaVZmempPaXExQlROcnVzNTZ2OU9HMnhGcTVEa256c2E5RWQ4aDFx?=
 =?utf-8?B?bDF5NGIyTGE4Sm9PaHlIdGxSdlRvYVVBaGtQNUE2cDVEVmpmTXhPNFhLTTNB?=
 =?utf-8?B?RlV3dmpIdFkyWURLSSsrMWdQUE45bzJFdXhkOG9ocHNmMVhFTVVaZEFxa3VP?=
 =?utf-8?B?bkRIYm9PbnJWTzhoU0RuU0JGQklubGlna2ZoVlNNMHZJRFlYaEhEMkdqNDBC?=
 =?utf-8?B?dEF0STB0TkdZTXJmY3RIeEFDckFFRmxUWFBsVllvMnRjVW5iVGN0ZEVJMFEr?=
 =?utf-8?B?ditZVTZud1NOZGJDR1doUkZPZXN0UjYybmIwVFRMS2d0OVBBMld2ZGo1RU5I?=
 =?utf-8?B?bDgrNGFGMm5DWTZZRUVUQTd1ZzIvQndoL2ZtQ0tTN0FZRUJPOXBrUXVCZ1Nq?=
 =?utf-8?B?NTRrWDdYQXh2RndUYVVYVlIvQld1aTl0M0lYZHVsQk04YVlyRHV4YU13MkZi?=
 =?utf-8?B?WVk0ODcxaVNYLzU0cmRiREoyRjQwK1lHcmgrc0M4Yk9kaGNuWWVQNTk3R09O?=
 =?utf-8?B?TE5oNlJxR25lTlpjZ0RiRUsxRFNOQnhPYzFyNGd1OVg0RFltWjkrS05tTmIr?=
 =?utf-8?B?OVJHVkFqNGp6ZkNrd1dBNm4wQ29VZWFnS0YzWUpqUXR5R2MyNUdxQllISGtZ?=
 =?utf-8?Q?WMcfmn6PCKQETg59lz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6354c0-1d6d-44e9-394e-08deece2d512
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB9020.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 20:00:11.6076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hQmK04mZZhTGy8J/cq+r4IAVY/bpKQqvhXImiajOw5x87ETl8jQ5CssaWrasyKuXpKCZGNs4myh+/ZmVET8GKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF9C964DBFE

On 7/22/2026 10:57 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] Removing dmaengine_terminate_sync(chan) from the polled mode path causes the test to unmap DMA buffers while the hardware might still be actively processing the queued descriptor.
> 
> Pre-existing issues:
> - [High] Test data buffers are freed before pending DMA transfers are terminated at the end of the test thread, creating a race window where active DMA hardware can corrupt freed slab memory.
> --
> 
> --- Patch [1]: [PATCH 1/4] dmaengine: dmatest: Don't forcibly terminate channel in polled mode ---
> commit ff3488aa5c4eb22b5aa3631448708f7560e37c84
> Author: Nathan Lynch <nathan.lynch@amd.com>
> 
> dmaengine: dmatest: Don't forcibly terminate channel in polled mode
> 
> This commit removes the call to dmaengine_terminate_sync() from the
> main thread loop for polled transfers. This prevents disruptive
> terminations when multiple threads are concurrently submitting descriptors.
> 
>> diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
>> index 2ae3469397f37..60bc448f42eeb 100644
>> --- a/drivers/dma/dmatest.c
>> +++ b/drivers/dma/dmatest.c
>> @@ -837,7 +837,6 @@ static int dmatest_func(void *data)
>>
>>               if (params->polled) {
>>                       status = dma_sync_wait(chan, cookie);
>> -                     dmaengine_terminate_sync(chan);
>>                       if (status == DMA_COMPLETE)
> 
> [Severity: High]
> By removing the termination here, does this code leave the hardware running
> if dma_sync_wait() times out?
> 
> If dma_sync_wait() returns DMA_ERROR on a timeout, done->done remains false.
> The loop then eventually branches to error_unmap_continue without terminating
> the pending transfer.
> 
> This error path calls dmaengine_unmap_put(), unmapping the buffers while the
> hardware might still be actively processing the queued descriptor. Could this
> lead to active DMA memory corruption?

Yes, but this change simply makes the synchronous path through the test
loop consistent with the async path. dmatest treats the buffers
associated with timed-out transactions as safe to release. Perhaps that
should change, but it's out of scope.


> [Severity: High]
> This is a pre-existing issue, but does dmatest_func() free test buffers
> before terminating pending DMA transfers during thread cleanup?
> 
> Looking at the error handling and exit path at the end of the test thread:
> 
> dmatest_func() {
>     ...
>     err_dst:
>         dmatest_free_test_data(dst);
>     err_src:
>         dmatest_free_test_data(src);
>     ...
>     err_thread_type:
>         dmaengine_terminate_sync(chan);
>     ...
> }
> 
> If a transfer had timed out and was left running, could the DMA hardware
> execute the pending descriptor in the window between freeing the slab
> memory and terminating the channel?

Yes, but see above.

> 
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260722-dmatest-fixes-and-fatal-errors-v1-0-8287709987ea@amd.com?part=1

