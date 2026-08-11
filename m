Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010006.outbound.protection.outlook.com [52.101.46.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C1334A3BF;
	Tue, 11 Aug 2026 10:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786445550; cv=fail; b=tNuJxuLsHO5RW4RoDuZ5npS8FrY43pyTXspIbwWaCDRk8Em6yszNcDX5kEnuE0ClqBQ6Cj9f1ikrrgKByRCFhuvkzH6R3Dg3VKSGWAGIqAG8MRwOj4+gGf07WV9J3C/kNIgXoJ5or6SDbj5Xg67aUgQpDZrsBCLCFmMfyKGrahA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786445550; c=relaxed/simple;
	bh=TOWBhrYxurpSbS9+MhHU5Lvx2BL3SXlr9i2bLGl+Ck0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LpoaRG2eOvEH/0/9k+Kea3wLx9f3G5uRmrSkttMlGIOqVJGB+D8sUA/wiXXlc7gmI5UMtdLHbYvWCWQbA5ylugOcxgArroGRwL5NOvWLBigeQLaPciM6blYKeOZIpmTvPpKw6VLH9Vhsmk3Yb3VDpDgTDsMmj87nyJwFaoHGBp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UsqFGLBA; arc=fail smtp.client-ip=52.101.46.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UsqFGLBA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PaRE8rFz9zZ1NIZ8FhZBRz1y7+Xm4dl30VN8+2T4vdg564SHUOL8m/+pSCWGfSaSQLyUSGeVUWTnVm7mBrULnXl2yNUod9yjJDeKBwFLcJIc9ooKTYfCSbchcfXJin9e3rRtf5jiMnxndtn+fY4rEnZY1G0khbWfUxkG437RrHGBlzjZ7vbVsp4LipMMPX7NNZ/+5vSqhodlgn4WM/C3mcD0yVWcyhDhPpuGqbz/chNN1lavbSw3JVWg5DMoqUgovrIUCQuGGrUYuyK3GSAgL07ZFMtBNISw6woGJ5TMLkMhX2/pyLBFkx7wvHD8qOcQYu8HjpgKfTsJuWWkeLzGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egm12ggNbji2234OGWMCdd2CEdoJI3XapLLz5Hjzbns=;
 b=dEpMWD2ftT9bZCzqwpx0XKvgxi4hkBTxuxZrEHBqinYEMl+SgI4rLw91HqviXOG+bfSMcqATdsowNwqCyjbv3G2SoDkJ0XvMPqig1ub5PtVdDGwz3aM1I87jgAgBOtjs2NJtW7OeDGEjfK7/y9ruoCWJw3giFmFuH99YSqxlek70GA9MYvCtLpRQLwwaXIxMYXlPs8rMzCEsB14yGG2sZsxT015AFA9oztErtybcVCp7WvMTrViLciAQ2MP40HgRuKUdLhAKKCFYNcieUIQheDbRzV9wTlIGR7hdbx4arv0xFuvCHHkF2m+hIRGmHPfjyu0GlMMtFkUAFrqrFTO0gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egm12ggNbji2234OGWMCdd2CEdoJI3XapLLz5Hjzbns=;
 b=UsqFGLBA6Y0hQLdVJ+cNsZuU0uhicD4fc888WrYgeYGxiCDDr+zV57XHcSBKI9kwBuW6iTawRwpzNlIZIixx0wL6GmP/HSLYffU6LWKn0vKToK2s3acO8Fl3mKFo1jAIWMkMZz+42u+MUIaMiva/jA/lUKzQkxuOKioODnWzF8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS4PR12MB999075.namprd12.prod.outlook.com (2603:10b6:8:2fc::20)
 by SA3PR12MB8804.namprd12.prod.outlook.com (2603:10b6:806:31f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 10:52:25 +0000
Received: from DS4PR12MB999075.namprd12.prod.outlook.com
 ([fe80::4c9d:851d:3f44:800f]) by DS4PR12MB999075.namprd12.prod.outlook.com
 ([fe80::4c9d:851d:3f44:800f%6]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 10:52:25 +0000
Message-ID: <67bb1e42-c202-415c-9f04-15a5eddfa5f3@amd.com>
Date: Tue, 11 Aug 2026 16:22:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 5/6] dmaengine: zynqmp_dma: Add new compatible string
 for Versal Net
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
References: <20260810100452.426320-1-nagendra.golla@amd.com>
 <20260810100452.426320-6-nagendra.golla@amd.com>
 <20260810102009.39B501F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Golla, Nagendra" <Nagendra.Golla@amd.com>
In-Reply-To: <20260810102009.39B501F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0075.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26b::14) To DS4PR12MB999075.namprd12.prod.outlook.com
 (2603:10b6:8:2fc::20)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR12MB999075:EE_|SA3PR12MB8804:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b80034b-d625-4742-9f2b-08def796a0d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|56012099006|11063799006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bcb/Lwunz/ga2sllfYKpjGHqLMWO+QwpMEumW/55PqxCtsfgb4+t5Yz+c5nAQLlk5qkwR94NcTOSW4LHVIvUI/LHCySrFuYZvNklz5MTLBgf/wTx7RzAyaLdK16lMe6XuaU24ctzSog6mJTMQmqzsnBXv/vO3dItwht2rLQQPvxxi+ejsouWZqUFjUyxlkSkMJXTSRAQp9hkXV+1ZYVEABTlsgYM02++nqvTBiQVXSIX+tJ92ZqxkkKWov/0rbne6lsDBry9zRxyMo4/b5iLwneXElKk1TLDHtfr5t2p+dNdnG8VPn+O8I+Tpb1MWr9I5w0xlephTcKu9WESMjaqnBBMqP53p1jWg6yz7qyIDpdxcpYh7pnbBRa6JnWi4qtkjELXyq1omd5JHF7KsMTVP2J0fFXCvRvinXrMgSTDYdgtiz2mlD2pardE2twNrJc/XINrCo1slMdRfjS6+QlnROvXtbXddPgVMtNHnQBaO4KEOKa8qqMDH+qL+rBJIyxuh6XTxTjadH03qJ4DyVG/4yVcNYPcFRKY9KtQg4w9LXklnzleW/CSFZYIELuTHmr6FW9RhVEDqw4/EnAifzy3zHH0RO0xuDeLkuIPAr6uPgpiSDrpJjnpfFEmfsNl2lbQPD3JmoabaeagZTuM0KxRBD8YadbJaV3pu4q9dFxHSXk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR12MB999075.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkliRkVYdUNvRmFUZGVidDY0VUdpNmhxUWp6SGZXMnIzeGxVNVp2NzkyNUNV?=
 =?utf-8?B?MUtEQTFSSENML1lOOEdmbFpZZW50ejA0TGJOL2czcDVXNktPMWpqTXJSMWJW?=
 =?utf-8?B?Z0I5RTBJQUhyTWR4bVhVQnY3cHJHNHBtck0vWjhPMlJpS0IrYmc0emhhWVN6?=
 =?utf-8?B?ZS94UThrT2MwdzA1bFNWbWJvTTE4TmtrcFlpMEptRURsdnd1U2FZUzhpQzBj?=
 =?utf-8?B?QlBKZVJlNXErRi9lTXlwWVY2Nko2bnBXVnRhbFZXSTI3VUVpNkJ0Mm4xN1NN?=
 =?utf-8?B?QTdqQWUveG1LcFJDL2xObEM2NUpTaExUM3FpMHZ5c29oQmtuaWZ2U0tDN0FX?=
 =?utf-8?B?VWpSazRxdzk4QWRiaCtkWVd2WVlhSDZJeERYYmhoZWRxWXBRVHdNbVRnVFpX?=
 =?utf-8?B?c2prRDREMWxOSkgyeWpaaHVoZjdTbjh3a2JvOUtUNUZrWGVUelZ3c1RMMGFp?=
 =?utf-8?B?dGpXUTdCY1FNVVZ0NzdFZDN6T3hGcmVUVENKNVZiTDJZMXRCQkRtNnVuYU5P?=
 =?utf-8?B?M3JoWDRNcTgwTlhqOTZvZGRnbXlNeWZnRCtwb3FWeUJ4WTJyRnhDUjNOWGRL?=
 =?utf-8?B?M09oaFRZR2hDVjdYNmQrQWVtaDlYRmQ2dnhJV2hTdmo2dW1YZmMzRUNsbEh5?=
 =?utf-8?B?a0NLbi9iRys1OUpFUG5PQ3Y1VVR0TUdTQ0lXTEF1SnRkUnFwRGRBRXo0ZDJ6?=
 =?utf-8?B?VzBicmZxckM4VmRWZE91RmpnNXBwZWpiTkh3L1lvbWcwVE1TaGpGTHRObEJX?=
 =?utf-8?B?TnlUMzd6Q0JGcTluRFZHdkFBNFFhVlFLQm1OSHFTTUNsTHFPL1pyajhjWnRw?=
 =?utf-8?B?ei9Oa1liU3c3M3hoT3h2K3hLdm9hakppU295S0FGKzRLVStZU0QycjVaMUhs?=
 =?utf-8?B?dURuTHUrYTBoNEI4eUY5WEpGbCttL2hDbkphOEhaeGhjK1Zmcms5OUQvMU00?=
 =?utf-8?B?U2l0S0lWZ2NWcnlPR0I4allTenhPUkVObk9sZHVubjJIR2FQdml5L0F3Mm5o?=
 =?utf-8?B?WGN1azYrU0F0cGdxeHhRV2pQSEJUZ1R5cUhVV2ppWUl4T3E4NUVUczFreGRs?=
 =?utf-8?B?UW5FV3lUenhtRU41SVdhWE5taXVBd0orR3hVVExGTnl6OStvNmhZcFhLcjhN?=
 =?utf-8?B?RU1aWmJrcm1tV3VCcUw2UWU1cG9SMjN3WUdGbVFscGtubG41a21MV1pOL0pF?=
 =?utf-8?B?cldYR0lrMVBaQTRXdnIyaDVYNjFOMEdvL3NITlJ3d0plVlZGQ2pibGVGZkFn?=
 =?utf-8?B?NjFKNCtRbVVrSGhvMGdTd3hjQlNWaStjUSs4NUFQNEoySE9INjExZTV0MzRs?=
 =?utf-8?B?SURubEN5UXZtUW94cHV2Q0xUYVBGdktrZzY0T2dvME5XeUE4TW9BU213U1pI?=
 =?utf-8?B?RHpJNTdQa0VUMVRZeVg2NVpxSWp5R0drRFgwYjB6eHFtRzVmZEtPNFpsY2dY?=
 =?utf-8?B?aCtlRHcvNHkreHNFM21nVkszTk93Ylg4WUlhVnZyV21PTTkzSzFmcVl0b1U1?=
 =?utf-8?B?dE1RK0FJa2N0dkRKa1dzTGNTKzYybDVUTnBzVmFYMytLdUgvOFRNa0wyYU9Q?=
 =?utf-8?B?emM5V09maVRtMDNUL0FYMlVQL2VvZVAwOHFWZHZFMlZ6UFFIQ01qVm5aOUda?=
 =?utf-8?B?Z1QwN0I4UjhsdzBGTDVQTjhUUEZ3SFQrdlBMVGVxMFRudUJycFRmVFVlNkhO?=
 =?utf-8?B?bHJkaC96WUhiSEMvYS9xNHZuZUJFeFpzR1hWTE5uSUsvdCtZUjAvQVJ0SUQ5?=
 =?utf-8?B?MnlWWGpZZnZDLzJTVkpjRmxwS3oxK1R3UDNscmFudFYvRzdidUpCZFlWWHVG?=
 =?utf-8?B?Sk5sMFhxR2FKQVBDQldHbEVibGlWREhrRjgycHlHeWM0MysrcnlHYmZuOGt4?=
 =?utf-8?B?RnNkNjB5dnZYNFoxcmE2cVJnV2ZqTUdJZ2VpMlhKWm1HZlV3dk1CNGVXdFZx?=
 =?utf-8?B?VStkdTlkdWZnMllOMGw2VGVhTmVhZGdLZ2hWVkRuQTFMRitpd21Zb3FMZHdS?=
 =?utf-8?B?aXB4Q0diSkdjSXZoY1NINzh5V1o2WDMzY1pSL00rYi9rRkxTRUMwT0E0a051?=
 =?utf-8?B?Vk5ndk9ac2NnTnpWdnN2ZlEwVXlNOEFZWDYwR2FrUFloVTJreEsyZVU4SnpB?=
 =?utf-8?B?RmVpSUNvZmsvcVhqbWxzMjhHd0dqU0xtSXR3dSsrYmo4UDhPbjFIUi9XVUJm?=
 =?utf-8?B?Zy9sM1hyQTluNnRmMTk2T0lwaCtLMGc0TVBEYUREM2lwcVNmUEFMdWZYWmlV?=
 =?utf-8?B?T1ZtbW1rL0psNnVuZ3E3RUgvK3VhdytESlU3dmZKTU5kbngxcXlzdEI5YU1j?=
 =?utf-8?B?TkhEaUZoZ0c5Wjk2YnFiOUxrczFKajMwa3J2czRCNTNSazczdHI5Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b80034b-d625-4742-9f2b-08def796a0d5
X-MS-Exchange-CrossTenant-AuthSource: DS4PR12MB999075.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 10:52:24.9696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EK4/yT4MajxKTqSZ0oFyVzxbBs+X8T7N19T/am7MHLQsOsh72zvjkIbDSAg4DRz+YHobWtIea3LBctNvPr/2XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8804


Hi,
On 8/10/2026 3:50 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> New issues:
> - [High] The `has_reset` field is introduced but completely unused, missing the required hardware reset logic.

Thanks for the review

The has_reset field is intentionally introduced in this patch without 
usage. It is consumed in the next patch (6/6) where 
zynqmp_dma_chan_probe() checks match_data->has_reset and conditionally 
calls device_reset(). The series is split this way to keep the data 
structure change separate from the reset logic.

Thanks,
Nagendra
> 
> Pre-existing issues:
> - [High] `zynqmp_dma_chan_probe()` hardcodes the `platform_get_irq()` error return to `-ENXIO`, breaking probe deferral.
> - [High] `zynqmp_dma_reset()` silently drops active and pending DMA descriptors without invoking their callbacks, causing deadlocks for client drivers.
> - [High] `zynqmp_dma_device_terminate_all()` does not command the hardware to stop, leading to potential memory corruption.
> --
> 
> --- Patch [5]: [PATCH V3 5/6] dmaengine: zynqmp_dma: Add new compatible string for Versal Net ---
> commit 93c6838fba5eee0dddf024579d8474fed6b7dee5
> Author: Golla Nagendra <nagendra.golla@amd.com>
> 
> dmaengine: zynqmp_dma: Add new compatible string for Versal Net
> 
> This patch introduces the amd,versal-net-dma-1.0 compatible string and its
> SoC-specific match data. It also adds a has_reset field to zynqmp_dma_config
> to indicate whether the compatible requires a per-channel reset during probe.
> 
>> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
>> index b03171e37e278..7561416b8e626 100644
>> --- a/drivers/dma/xilinx/zynqmp_dma.c
>> +++ b/drivers/dma/xilinx/zynqmp_dma.c
>> @@ -259,13 +259,20 @@ struct zynqmp_dma_device {
>>   };
>>   
>>   struct zynqmp_dma_config {
>> +	bool has_reset;
>>   	u32 offset;
>>   };
>>   
>>   static const struct zynqmp_dma_config versal2_dma_config = {
>> +	.has_reset = true,
>>   	.offset = IRQ_REG_OFFSET,
>>   };
>>   
>> +/* offset = 0: Versal Net uses base IRQ register address */
>> +static const struct zynqmp_dma_config versal_net_dma_config = {
>> +	.has_reset = true,
>> +};
>> +
> 
> [Severity: High]
> Does this configuration actually perform a hardware reset?
> 
> The patch introduces the has_reset flag and sets it to true for versal2 and
> versal-net, but looking at zynqmp_dma_chan_probe(), the match data is
> retrieved without ever checking this flag or invoking any reset functions:
> 
> drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_chan_probe() {
>      ...
> 	match_data = of_device_get_match_data(&pdev->dev);
> 	if (match_data)
> 		chan->irq_offset = match_data->offset;
>      ...
> }
> 
> Does the omission of the reset implementation leave the DMA hardware in an
> uninitialized state during probe, potentially causing back-to-back usage
> failures?
> 
> While reviewing this patch, I also noticed a few pre-existing issues in the
> same file:
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but zynqmp_dma_chan_probe()
> hardcodes the platform_get_irq() error return to -ENXIO, which discards
> probe deferral errors like -EPROBE_DEFER:
> 
> drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_chan_probe() {
>      ...
> 	chan->irq = platform_get_irq(pdev, 0);
> 	if (chan->irq < 0)
> 		return -ENXIO;
>      ...
> }
> 
> Does this permanent probe failure prevent the DMA controller from working when
> the interrupt controller is not yet ready during boot?
> 
> [Severity: High]
> This is a pre-existing issue, but zynqmp_dma_reset() silently drops active and
> pending DMA descriptors without invoking their callbacks:
> 
> drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_reset() {
>      ...
> 	spin_lock_irqsave(&chan->lock, irqflags);
> 	zynqmp_dma_complete_descriptor(chan);
> 	spin_unlock_irqrestore(&chan->lock, irqflags);
> 	zynqmp_dma_chan_desc_cleanup(chan);
> 	zynqmp_dma_free_descriptors(chan);
>      ...
> }
> 
> Because zynqmp_dma_complete_descriptor() only completes the first descriptor in
> the active_list, the remaining active and pending descriptors are silently
> recycled by zynqmp_dma_free_descriptors(). Could this strand waiting client
> drivers and cause deadlocks when a hardware error occurs?
> 
> [Severity: High]
> This is a pre-existing issue, but zynqmp_dma_device_terminate_all() does not
> command the hardware to stop:
> 
> drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_device_terminate_all() {
>      ...
> 	writel(ZYNQMP_DMA_IDS_DEFAULT_MASK, chan->regs + ZYNQMP_DMA_IDS);
> 	zynqmp_dma_free_descriptors(chan);
> 
> 	return 0;
> }
> 
> The function merely masks interrupts and frees software descriptors, but never
> clears the ZYNQMP_DMA_ENABLE bit or issues a hardware stop command. If a client
> driver calls dmaengine_terminate_all() and frees the DMA buffers, could the DMA
> controller continue to read/write the in-flight physical memory in the
> background and corrupt memory?
> 

