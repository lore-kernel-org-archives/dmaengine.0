Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013068.outbound.protection.outlook.com [40.93.196.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8FD43CEF9;
	Tue, 11 Aug 2026 10:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786445738; cv=fail; b=NrYhr33IkULcc3N0p+hMBQLtkOBPlIw0Xsa4kqWwPRBMmyjg9Cc72BExe03K0ArOulAtKHOW5qXs58k+Wzu6DqO7KcaZLlFf3YVqeH0uMesc00AtswpMII67Nkh3i7vq5esHXr+LT3u6gSm9ZR6qXltFPH2VvoL+9HAdg/4O/HM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786445738; c=relaxed/simple;
	bh=WAEAhq9VgCAoyyoaH37p3vgLrQP8iopT/rpow/bhhPQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gTH0K3oDtJrEvSWIQpDrf5ZwzHJC4SgKojQe8x/xCptzRkspIOIRgBDI3PF0Wg+D70rFRsMzBvYUW4AV2/El7OobxL2VBsASanC6tZCrb0iFsAPCIR58EVSltbb8KQ2Ie+urAoO14AIq9BBvbc6Q/c2YzMFWzNXLXxoL/Q9Bxsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pl042mE8; arc=fail smtp.client-ip=40.93.196.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pl042mE8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=psTbK7rid6R22tjwCrE4JAKT3UMTHD0077uTTcSd41NheqwKjiVnP+hH4AXFaYxw+qfR551U1iutMnietrJkzacoyWkVcjUZrpv4hBOyr4vFv/7O4yTD8YOoZSTYD4Owa7+XUUvRoAQP/hUB3dmqXZmvR0L0ukqo4o8/2EIU6/WgTk8+MbK3urPv/CksuPL1Pec/x6y2bmCE8doqLLZ0R9vradhiDxHUFDrQB4zBvN1sxrMbTYkGy7M9MeDgcxK3ZlK9+csrMVM4Yl6ZDS3EUZEiTGsk4JFaQcnUy9s+5m2GG5AVBzt7+mEyV+0e99ENU7wqlBP9IXltCOjoue6s/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIZUU+Ar4SaRbWfNbeYjJC2zIHFW013NMXwsAFzLNUk=;
 b=QiHapZ/lWyclj1RwVGmnR6tokkh15H/GVXbGfoaz2qlwi+dtEBtjU+HWi8YryaEMkC5ZQw/VOrMBDzNqT8MPPBd0lmfew+40lBUpm41wfcMhMiXY7X2latseSl2zawK0NJGTSrktY7EU67VsTm06ucBAk4YYIw4g9pjJIPMndvxAWmyKudbcMntoz+knle5+AVkq2OrW1ENp1U7QMw1ZiXUwQ0WaoVNTKkvgkGYpAsS5LJGoRhheWrjNAm0uIa9hCEgHlcP1QACwjcFTlm9k/BpcIDBDLLMitrXcaGIX0T6HaK/hFEIjc6Jc1pkU8FpkdC/w+1Z6FSa0lI1DQIpz/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIZUU+Ar4SaRbWfNbeYjJC2zIHFW013NMXwsAFzLNUk=;
 b=pl042mE85EetTQfanWeiXgoGruk/yTKpg5+ypX7KkXmBVTh80aSVx1jgL6AZc28JxpLci7gacn6evzcGUGEm8Teyenz3jtFQz6/ezr7n3jYNExmA6PXOg2hCtVXPL3OWKcT2W5/MeJPAnWELVC1uluOjqf5p6iUkyswkr+GJDCw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS4PR12MB999075.namprd12.prod.outlook.com (2603:10b6:8:2fc::20)
 by SA3PR12MB8804.namprd12.prod.outlook.com (2603:10b6:806:31f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 10:55:32 +0000
Received: from DS4PR12MB999075.namprd12.prod.outlook.com
 ([fe80::4c9d:851d:3f44:800f]) by DS4PR12MB999075.namprd12.prod.outlook.com
 ([fe80::4c9d:851d:3f44:800f%6]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 10:55:32 +0000
Message-ID: <322931c5-dfbc-4441-b992-8608231f9fb7@amd.com>
Date: Tue, 11 Aug 2026 16:25:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/6] dmaengine: zynqmp_dma: Fix PM usage count handling
 in probe error path
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, Frank.Li@kernel.org, vkoul@kernel.org,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260810100452.426320-1-nagendra.golla@amd.com>
 <20260810100452.426320-2-nagendra.golla@amd.com>
 <20260810102814.4A6981F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Golla, Nagendra" <Nagendra.Golla@amd.com>
In-Reply-To: <20260810102814.4A6981F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0119.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b0::9) To DS4PR12MB999075.namprd12.prod.outlook.com
 (2603:10b6:8:2fc::20)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR12MB999075:EE_|SA3PR12MB8804:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d6ad69f-d5c7-4a74-87dc-08def7971051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ReG3rzMNZC11P/YmaRWeHErJr9jNSwAZq/g8fx+UjdnXX3esugbRnnhIlFXVstzpNO/hwunKWVz+06312Q8PfunZofAzwhfEIdpp3sFRVwfVtosmXEpDhfBuzX0+9/WpCQeI4YW5zYvZrcvDSJHjyT2nw5aD0IeLecBSHGfYHsHnffgx6GoFnItFTlR6v71XRA0qzOa/F7C8dVCL7vCCFiXpDfmBAxWilfKqxavuj3LnUq/tC/iGcZsT7m2hfakK6eG1/vUqaFf57nAsd68u/OXFeMfoKjZLLlp8tVXinyCtEN51PgrKwFWEbT7n+UYqj37j5DqOoazpLn1z3NpjyX8MewORGTQI48cF3cDg5qcXMLavSiwTsMYeahrnC/EPk+1tmNti0qCXn34XWy648yoCraumQRBtzyJpa/cn0bpqQfez84L4IXUAYRodh0icj/ooA0uUAQhiksf6wmlgurdCK7nA5NqMdrq7EzlbzOsG6U2JogOBI/T4vOBpUCVqNVX5b9owlprHvse1mMxXEhn//LrTyKPSQhzKHOXKMjQHwKu1QE88Y8d4i8dTBuowHmFq3TlaQLgmmbVZBx2pFRDq9nzcKpv2qSXnChPKv2uboXfFWiBhffwfviaBXxrjpzxo9Ltnh2C0frUrZ+4JNKBxFNtjlG1jgSdv6vfEhDs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR12MB999075.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVErN1phVTZKTUx1MW9idWtkbFU2aEpGSWFMN0Fhbkw1Zll0SEcyMW1jRUc0?=
 =?utf-8?B?VkhhSk4wVmNyd1hPZUR2YmtrYkVzOElveEp5L1dqZTh3TDRvdGViMHBUdlli?=
 =?utf-8?B?N3pSSG0yeXBraFVpM0laRVlHV01rQzlQRTJHbnNlS2hFZGxwdjU2UUx2TXNj?=
 =?utf-8?B?M2JQWFhjTUlyZHI2dE4vaTc0MnlneHFyMlpnanRubjUwbWlMVHEwZUl0akNM?=
 =?utf-8?B?aUowVUMwZk8yWUJSU2YrTi9vSzRKKzFFZDJOZWozM1JFK0l1UTc1b2FsU1d1?=
 =?utf-8?B?dHA3TFFmZVF3QXUwN2RjMGM1WEoweDg4Uk43OHUraHNjd0tFZS9Db1VDR2Rh?=
 =?utf-8?B?T1dJR2xDTjVMVHBUZTJVYkt5UGRJdm9Kd09qNG5lMm5zRDNBcEFEeXdzaEdr?=
 =?utf-8?B?L2RmWHRFTnBtNlpSR09nSnB2T1ZPUTd6bVk1RkluVDRrdDVDNjIwWFZYdjNU?=
 =?utf-8?B?VzY4bXNnQkRNNFBRcUZqMk5hV1lQUVVTbkxxYjE2WWJRT1ZQdU0wRUhueGQz?=
 =?utf-8?B?dGpQWndrS0lSMlBNNThvSTcyajdpalExK0tWdEl6MmZQS0JMNzg0ZmNzWTFi?=
 =?utf-8?B?MWlxUG1PdGRlMVhaMDlWL0ZISkZDeUFSMjc5V0NRL2kwUlFpQkt6bCtVbEdv?=
 =?utf-8?B?YTh4OFZBZkpQU3F0QWpXeElJSVlzbUlqRHNsRmx4bW1FazQ4ODNIU1oyRVNT?=
 =?utf-8?B?dlV6bVpNQ0ZNV1hBcHJ0TGhYN0k2ZTE1N0pHWkVhREtVTG9Od2xKdWE4YWd3?=
 =?utf-8?B?MXRpdnRoT0h4NzhCWnFwblRjenJkU3QrY1dGWFZPZ3VIK0lVQXNwbDNISzJ4?=
 =?utf-8?B?clROYmhtZkgzNFdTdXp5WmxtUFlLU1REN0N5K1BwRjRXRkJXSGZQMzVBbTc1?=
 =?utf-8?B?bnVjTkpweEp6amxEM3ExUE0xS3QzdlRaQnUwOEZ1LzBmWTRMMVo4Ymxvdlcw?=
 =?utf-8?B?K25ZNHM3YkRvdWtiYTZIY25NNklWcHpQdkZ0UmtnaDl2b01rNXMzWUcveVpl?=
 =?utf-8?B?VjZDOUlacHZHK2pKeTlYd0JoOE12Z3o5am5YeHB6RkZxdCt1UnhOZEdEdUll?=
 =?utf-8?B?RllibU9sODNHL1g5cXdFd29HRFpXMVZkTjJGRUJ6ai8rbm9kdGduQ3c2TWJW?=
 =?utf-8?B?cGxvcXhOUnV4aXlDR08wN2lRM2VVYlNtdG9jbUozUXpJL2JJQ3lSU1NmVE9h?=
 =?utf-8?B?WUczeGF4ckpHM2Z3NTM0d2Z4TWlFbkdzSlFDMGpJWkJES3dPR0xQd1BkK2RR?=
 =?utf-8?B?MWdYWnFNTTZNTEUxTmNBUGZkNXYzSTY0azBla3ZCS0Uybzl5Wk5xRHI4Z0NE?=
 =?utf-8?B?b3FNS0RwdFpMVW5ORis0WWlnbkxabGRvU0hqemNCNHJPWHd0U0NZUitXcTZS?=
 =?utf-8?B?alIvYW5ibnJySWtPSU9Va2lva2hvbyt3c3RwR1J2MzZlNjJJVnlEVlo1a0J3?=
 =?utf-8?B?YUlSdDdUczNoRjBEdzFLLzU0OUJDaHdmZ2VraURCUzArVThWRGtEQjZBY29y?=
 =?utf-8?B?eWpOMHk3N3Y5aitWZ3dDV0J3dnFmS2hUbXJjR0gyTHV4ODh1cmRDNkVST1ZK?=
 =?utf-8?B?ZzkvTGdPK1U1YmlXTjFYejM1VExqSDJENTA1cGRkMkE1WTFxQ1ZTenVTY2I3?=
 =?utf-8?B?djdxVll4WUozUnFtNDMrelR1S2hBcHdrNGVjejhRUkswVTBWZXVUWFBHZmlJ?=
 =?utf-8?B?bWhuRTVSUk5zeHlib3AzNDlwN3hzNFA3U0trb2pGditlNkR5cHlSZlM4NEs0?=
 =?utf-8?B?VU9qNkVoVlhKbkY2RlVLdm1HUFRWbVJKMzFuQmhPTDYveW85OE4wTm1oWGd1?=
 =?utf-8?B?WHMrUGZTR2p3a2pHMDNTaWcyZ1hoUjlDQi85UDU1aDM4VzJpQ3ZyM2x3ZVhp?=
 =?utf-8?B?N2dOOEtPa1ljajhrT0grNWxIZE5zRE1vbzNBZmNzWGVYMkQydm02Rm42QjIz?=
 =?utf-8?B?dFZNekN6Q0Nvb00rT3ljNlZEN1Y0OVBxRlk5QktWNStYNkQ2MW5TUW5RTHVp?=
 =?utf-8?B?dWVTVnBBWHBEVEQvdEpOMTZhSHUwY3ZjUmNNSG9EYWhzR2YxcFhGMmlnS2Fm?=
 =?utf-8?B?WFVxb0NhTEljdy9KM0pQRWluVkttdW8wazFZM01TYm5OWGRxd1FjR1JuTzR0?=
 =?utf-8?B?NDhxdXkxdVN2NlMzWHp1QVR5VGNBWS9UOTBRRDN3RUdueEdLWFg4cVpidWpx?=
 =?utf-8?B?SUtMTVgrMURncjBCdEpwcDlZZzhsQlp6UDJ5Q1o5YlhMdkMyU3JiQytYQWQw?=
 =?utf-8?B?YnJZRzRzQ0RnSEVGVGludndYRmFwZkdoMlo3QWlyVEh6d3UrYWtlRWh3UW5Q?=
 =?utf-8?B?R1RuZHQxeSs1UDgvWHZQeS80czdRRlJuczlsOEs2d25heGRxR0hwUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6ad69f-d5c7-4a74-87dc-08def7971051
X-MS-Exchange-CrossTenant-AuthSource: DS4PR12MB999075.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 10:55:31.9808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7izcKXN2bSqPK0vIDIiES/ogd1l75JdOSaq39emKCn+0/kZ/V/lk+cFET7GSZZT624mGbJHkjt7HWzk6q+HBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8804

Hi,

On 8/10/2026 3:58 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The introduced pm_runtime_put_sync() fails to synchronously suspend the device because autosuspend is enabled, leaving clocks active.
> --
> 
> --- Patch [1]: [PATCH V3 1/6] dmaengine: zynqmp_dma: Fix PM usage count handling in probe error path ---
> commit 8bb5754b8f17c08d0144740ac308428274806a68
> Author: Golla Nagendra <nagendra.golla@amd.com>
> 
> dmaengine: zynqmp_dma: Fix PM usage count handling in probe error path
> 
> This commit attempts to fix a reference leak on the probe error path. When
> probe fails after successfully waking up the device, it adds a missing
> runtime PM put call to drop the usage count and allow the device to suspend.
> 
>> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
>> --- a/drivers/dma/xilinx/zynqmp_dma.c
>> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> 
> [ ... ]
> 
>> @@ -1152,6 +1152,8 @@ static int zynqmp_dma_probe(struct platform_device *pdev)
>>   err_disable_pm:
>>   	if (!pm_runtime_enabled(zdev->dev))
>>   		zynqmp_dma_runtime_suspend(zdev->dev);
>> +	else
>> +		pm_runtime_put_sync(zdev->dev);
>>   	pm_runtime_disable(zdev->dev);
> 
> [Severity: Medium]
> Does this actually suspend the device and disable the clocks?
> 
> Since autosuspend is enabled for this device earlier in zynqmp_dma_probe():
> pm_runtime_use_autosuspend(zdev->dev);
> 
> Calling pm_runtime_put_sync() will only schedule an asynchronous suspend
> timer. The immediately following pm_runtime_disable() will cancel this
> pending timer before the suspend callback ever runs, leaving the clocks
> permanently enabled.
> 
> Should this use pm_runtime_put_sync_suspend() instead to force a synchronous
> suspend and bypass the autosuspend delay before disabling runtime PM?

Thanks for catching this
Agreed will fix this in the next version

Thanks,
Nagendra
> 
>>   	return ret;
>>   }
> 

