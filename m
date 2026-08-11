Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011055.outbound.protection.outlook.com [40.107.208.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AF3434E29;
	Tue, 11 Aug 2026 10:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786445666; cv=fail; b=FjPep23HVveHT7nDXJmXkcoeGz4O7qkXNoB5qN0QeNXHn1vtyG565jX5Ixx7DVVBW34nbW4uh7GW1W52d8DzgmzLp4z2vvAvDLpvCg2hdxlDGmW3G+1T9ptGEJAAAkG55kjgMs/2Wp6oMewmZRJ6z7BpU1G7bDAfxfq5x8onHg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786445666; c=relaxed/simple;
	bh=pXdnIFUj9Wh3WKDHQ1+VoobQuymR8nQVyCARSB4MwdE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hFVddXbCsUTMQR+DeYmFdwFIESBOkKcK3rqWA1CdRxRWjMPi8ljeZR0zwbutPlZoFSRVha0segPVUJQTp9UjIQl5Zmpi1YOnGfFdXfyE/ZajSSZwnrV88EWGlxoqlmI0Gllsh6fLXokbGJdGISYidc3uRhDpDvVP+1vyOz7QeGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=B6B+F/DH; arc=fail smtp.client-ip=40.107.208.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="B6B+F/DH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuQz1gXoPMZI+MvBPoDazRhL9+sqXfmo2E71d7yk59mOWzfjHpDHbPtwb6HrFmnXrblTd/vNAmRDksAee5bTLA/4kRy2Wg5IB+hGMhCHjXD9VCDcF66U4OXGa8qsSDXdlfHN0dQShwSRWVQESn1F7H7uZVwVb82SLwm9CjorSgYdim3R6LCRDX7HrQTb49ExDEdVY+7iFc9dET4L/055nBYQ5ci4NzAb+3v22WhfPC+mDS1XxkuRLWcbSELbh4QiQeMs/r9uunK3RFy2TAjpTdPeZgdyxsjvWURktYiAbi8BiXez6DSMrG+QyKbAC3BKdAIcItxdf4sCSpBvrvqkCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Abz5yyYB0xJ5ger/2+lgXt3ETFWpBjGAzeslwxGjY4w=;
 b=yh5Rkjr7KXjbqgJY9zYXA12N3QYektVgI98kTT6ej5BIBfcxEl7yPeYH2y0n3qkZcbYbIWH3cl74iiloIf1kL2u0jkASvL7D62IeJeobuLqp5+VHKrNUvLLtZF1par/mC+QTYn0YMq5Ou8mNmvWIHCGhC6DOFOFnMP0kfIbJvciKhK5IRU83pEatpk8hooImXxzjoiUEuOM/0yk9Pcg6K46wUzWnpDSVommFnBriGo8JsQYDzPDuub7qrrIfMVqsd6oNOf8v6rZ2aZZZopfvXaiQ8UWfW57jNWbVlb66QW2EajcuAZmbioFPSh1EiQ2qZ0T6IkNaBICVPCa0wPLznQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Abz5yyYB0xJ5ger/2+lgXt3ETFWpBjGAzeslwxGjY4w=;
 b=B6B+F/DHWL2q7ZgB0jFEn23Sxe386Z2wy7w+NbGkRfP62V4/VsAf+eeAetxsBowtdp9qEUUdGUbZb47yaC2ttJRDW3+XcZV9tmZ/CaQZcughaWQ9eXEI/50rRnE2a+rcvwFCo/VTgNjuSTva+WnwTEI5dDSCJ72u186oSMfK5qA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS4PR12MB999075.namprd12.prod.outlook.com (2603:10b6:8:2fc::20)
 by SA3PR12MB8804.namprd12.prod.outlook.com (2603:10b6:806:31f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 10:54:22 +0000
Received: from DS4PR12MB999075.namprd12.prod.outlook.com
 ([fe80::4c9d:851d:3f44:800f]) by DS4PR12MB999075.namprd12.prod.outlook.com
 ([fe80::4c9d:851d:3f44:800f%6]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 10:54:22 +0000
Message-ID: <7e2a3899-b44b-4c04-af6d-b4299938f76e@amd.com>
Date: Tue, 11 Aug 2026 16:24:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/6] PM: runtime: Add pm_runtime_if_active guard and
 conditional variant
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, dmaengine@vger.kernel.org, robh@kernel.org,
 vkoul@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
References: <20260810100452.426320-1-nagendra.golla@amd.com>
 <20260810100452.426320-3-nagendra.golla@amd.com>
 <20260810102501.9F8321F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Golla, Nagendra" <Nagendra.Golla@amd.com>
In-Reply-To: <20260810102501.9F8321F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::11) To DS4PR12MB999075.namprd12.prod.outlook.com
 (2603:10b6:8:2fc::20)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR12MB999075:EE_|SA3PR12MB8804:EE_
X-MS-Office365-Filtering-Correlation-Id: e710de63-5c0c-4ed6-2a6f-08def796e6ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GPPWTU1HHVCz1tlQlanN4xgZFe9S2BZKLpl4xbPl1/nLYArFBeRlt4rDwsKP7EBh0PQg96nSSgCKw6r315HHug1R/z4h/9sXsdeJRxsFFTtcsnWjiRAp1sMkLcf4AeqV0fQE6PnpnTVLMiU0yJgsmtBhukcHgocgXPAAeyTl0fH+K7l+XC13ss1etj/k2kPyLmvZgAiY8aXEr4mItgihYd6r3bEBl0RGtmkZbKkDeYaQzmYDqFvQ5CGfF73cw3SI0ybgUNvtAqoqn1vb8UCHKEFRfSr1jMuXx1E1nQbcStlRMp8BtXzMLpvv/ziW2GTP+RFtMupEN1XtgmIobrg+GV2cR97qhdr5VYszWO49lVE0yquMMBNeySfnxBHPvb+moZ18O+nfzO2eAwcjh8G0wgD75cSw/ISKDOi2yitpoTZjS/DXfxrVrFb6VOZ+AQD9jxc2nP3lE/FJ1r5feo0/niPKiUqrhUzaaWOO6blWlIiAjBheoLrgGvqv3Jgd8IFmOOQQaFii8qyuFrYsoGDZ1JZ5w8wzdsCqy7ggeQxso80ylUmmraqx4zfh8WQP81ZpZzHJ0O6XQdXrb3XbKGyFQBXzc5P38l6R5bUZtkyYYiGWeR5dveeRfLPQWGz7QZGBJDqg6CMY/UVBy8NzoxMHsPMpm5RLQUCaB1vw1O2Q18M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR12MB999075.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWRoc3p3TFl1SG82ZmJvRklqdUtDVEZWbHFkRFZBTS9BaWdnSmV0NjQ3NFps?=
 =?utf-8?B?dGYvYTcrZ1FKUExCZEN3eEpHMi92OFpFUjROK1lSSE1jQzR0dUtYZldpNWd2?=
 =?utf-8?B?dE5QSmxVWTZJQVQ4ZnFMOWV6Ky9pQlVCTlNrWlFBNjRNVGxOd0IyUFFjUFB4?=
 =?utf-8?B?RmFXTWh4Z0E3RUxwZnVXU0xTU0c1V05PUVZ5Ym5TZUZPU0R1Zlp5ZytMN0Y3?=
 =?utf-8?B?NkplV01lMXBHbWtVVHlBbUxWNnNmTGlKRmlpSkJGTC9vdWU0LzErZDA4MGZk?=
 =?utf-8?B?NTRoQy9iRW1EVVpZUEpvQlVGRk9OM0FIVFU4WXBRVFpDUVRER3ZqK3JJOFhR?=
 =?utf-8?B?SkRXWkR0STlyYkJ1bnYxRkE2WUI3L2VFMTRKVzBqNThqNU1GcmZ1UWJ6ZS9C?=
 =?utf-8?B?blBQakk5MklrOE8ydllyUFNNbGJMRzdjQ1ZNaDRDQWV4WmxYUG5kT29MUHZI?=
 =?utf-8?B?eG1ydTIwWFhXVDhZR09jUWZUNHdqaGlwWU9mWFBQRm96ZlBDYW1ZaXI2Y0ZY?=
 =?utf-8?B?aFJyK3JmSUFWWTBGOGJEYnM4Uml5cGdVQkdQU3hIb2plSEsyeTdwaTJhNmR0?=
 =?utf-8?B?OU1Yb09BWHRMT0dmNk9LR2lZMCtpNk5tbjcxTkVUTHA1a29NZEc2K1BWMDBL?=
 =?utf-8?B?MnUrVGNISks3QlJKMUlpM3RHUEVvSXJqWjFJMGM0MTZJMTFpelJ5OUlaQkZC?=
 =?utf-8?B?RHRlWmFjcG9OWHhkWER3VnlQOThub3cxN2V1TjllTXgxb0Z0dERJT3MrczVh?=
 =?utf-8?B?a0xDRVM5U0xnYU5NalVwVEI0dHRIeUI0TGorNm9nWlhqVWVSd0tzQnVkRXRF?=
 =?utf-8?B?YW5GdFI4TTBFYThkSzVoRzRhblNIb0F0MWpyS0UrS1YxUlEyYk13OG52Sngx?=
 =?utf-8?B?bk9STDk4TE9TODgzbEJiMnYvUU5BZ25uT3R6dHNrVWFWQ2hkMHB4UlNRRWlL?=
 =?utf-8?B?QUVSd1oxWTJIVW5pRnVvMXhjMDFYVGxFRFFHaEhaZ0lrdnh1TVI0VVU2Z2Qy?=
 =?utf-8?B?T2dGcEpHNzlIRmNHbFYrM3VmZVNEd0k3cElJaCtNY1ByK1JBWHVrNGZGMC9m?=
 =?utf-8?B?Q05RbkxZWHdTV1pDVkZXclgzNXNwSDMvVXE2WU1QU3J2UEppWGlkdjdiZHI1?=
 =?utf-8?B?REc3SmtMc2NqZnZXN20yRGxLeHNnbTVXK0tyUS9UVDV0VVBZYkh6RUFlV3p1?=
 =?utf-8?B?cHVjMHRFeDBXdGgvK1RoamY4N0VGdDVUaWRWRnMzUGpiNVBKQUZiQ0hsemNT?=
 =?utf-8?B?SnY2ZUVuS1gyb0x3LzhsR2ljMzNQNEVmdzNqbzZsbTBld0d2VmJHWWMzM1Bx?=
 =?utf-8?B?clFBdlVZODdRYWlFQ1c2RE1lZDRwVjA2V3ZzMzk0MkFDWnVrL0VuV2gwTHhD?=
 =?utf-8?B?MWlwYUlvNGdEWlY1dGtBekNGcnMrTkVzc09zZU5vTTF1WFJPUWlISHR4WEkw?=
 =?utf-8?B?VXBVd011Y3pLTGpUcGdiZkY0TnBPS1AvNmpsTUpZTDA4Z2FkSjcrQ1lpRnlV?=
 =?utf-8?B?Q2JSL0ZtSnVyenRMWEdMdUxoV0tXM0xSNEtNQVhzcDNobjRkUCtPUVRNWFNN?=
 =?utf-8?B?QjJGMUhwa09jcnd0U21hSXM3blhkR1JPb3FCUldZdEJncDZpMSs3WEVqcnVB?=
 =?utf-8?B?dWxzYjdWeFNaMUtkaUhxZS9IWlZTMS9RdmNWS25lNTNCOFNrbFIyeVVtUDR0?=
 =?utf-8?B?UzF5ZzNPYmFac1BkVjBEMmJISVZvam1pWWdPaWswQTg0a2UxTCtnTml4WUtm?=
 =?utf-8?B?UVN4MUNPQnB4S2RJazNmRFFsMmZZTjZxc1o4b04yV2puc1UydndBSDBQUGtO?=
 =?utf-8?B?UDZhSDBXb2d5dmwyOVFOd1hFWGpIYnlFTjAzdnNoY2FhcDRhcFI1ZTVnVzJS?=
 =?utf-8?B?a3Z2eU4xVTVzci9Ia29namsrRGxOQ2hxVkE0U0U3L1k3NU9reE1qS1hKN09x?=
 =?utf-8?B?RjNoeFZuUmg0d3ZYbnRnUDVkcFpLMElXWUo5UmRwTUd1MXJjd2loZHVLbGJM?=
 =?utf-8?B?NlhNdmJnTEtrYk1GKzhmTThDRXVLOUJselNybjZyR3Q2b0h3SVNhZ2JMWmtz?=
 =?utf-8?B?TWZEZmZYZ2MzM0Y3b0ZINWNJb1ZMNTNqWElpNzFtNlpIRDlkUEo0WXhaNWNM?=
 =?utf-8?B?azlJRGtYd2dEVDFTSU9odERlUGpBM0VZTUNGMlNMR3hrOUNNUUpKMGJzbXR1?=
 =?utf-8?B?V25Ub01HOGl1cWZCMUw2UXNwUXEvdTlFTzRtT1JJa2MzNjBzSHFUSldHU1U2?=
 =?utf-8?B?YUxHQnlLQ2JJUFdkUjhWZlR3YktaNDREWU1WVmRvaVMwYUlBOUtwc29wL0lJ?=
 =?utf-8?B?cmF5Zy8zYVZEWVBuOSthZXVXYXJrWTllQStwTjN6WWtBLzBjTFVaZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e710de63-5c0c-4ed6-2a6f-08def796e6ef
X-MS-Exchange-CrossTenant-AuthSource: DS4PR12MB999075.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 10:54:22.5400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DnysJQuvxxlNdruCLJZ0JYoMTz5/cwvP2MZVgDskPB7KUzBvuvPlVhxRDCWfE6jKkyOe31RwnU3tdAB5iD6emA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8804


Hi,
On 8/10/2026 3:55 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The `pm_runtime_if_active_try` guard evaluates to an error when runtime PM is disabled, violating the API contract and breaking IRQ handlers.
> - [Medium] The conditionally defined base guard `guard(pm_runtime_if_active)` silently corrupts the runtime PM usage counter if used directly.
> --
> 
> --- Patch [2]: [PATCH V3 2/6] PM: runtime: Add pm_runtime_if_active guard and conditional variant ---
> commit 57173006d8cc8596d1863023936dfd41e4325af1
> Author: Golla Nagendra <nagendra.golla@amd.com>
> 
> PM: runtime: Add pm_runtime_if_active guard and conditional variant
> 
> Add a pm_runtime_if_active base guard and its _try conditional variant
> to pm_runtime.h for drivers that need to conditionally acquire a runtime
> PM reference only when the device is already active.
> 
>> diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
>> --- a/include/linux/pm_runtime.h
>> +++ b/include/linux/pm_runtime.h
>> @@ -609,6 +609,13 @@ DEFINE_GUARD(pm_runtime_active, struct device *,
>>   	     pm_runtime_get_sync(_T), pm_runtime_put(_T));
>>   DEFINE_GUARD(pm_runtime_active_auto, struct device *,
>>   	     pm_runtime_get_sync(_T), pm_runtime_put_autosuspend(_T));
>> +/*
>> + * Do not use directly -- the destructor calls pm_runtime_put()
>> + * unconditionally, which underflows if no reference was acquired.
>> + * Use only via the _try variant below.
>> + */
>> +DEFINE_GUARD(pm_runtime_if_active, struct device *,
>> +	     pm_runtime_get_if_active(_T), pm_runtime_put(_T));
> 
> [Severity: Medium]
> While the comment warns against direct usage, does exposing this base
> guard via DEFINE_GUARD in include/linux/pm_runtime.h create a risky API
> footgun?
> 
> If a developer uses guard(pm_runtime_if_active)(&dev) directly and the
> device is not active, pm_runtime_get_if_active() returns 0 without
> incrementing the usage counter. At scope exit, the destructor
> unconditionally calls pm_runtime_put(), which would underflow the usage
> counter and could prevent the device from suspending.
> 
> Could a lock-tracking guard like DEFINE_LOCK_GUARD_1 be used instead to
> avoid defining an unsafe base guard?
> 
>>   /*
>>    * Use the following guards with ACQUIRE()/ACQUIRE_ERR().
>>    *
>> @@ -624,6 +631,8 @@ DEFINE_GUARD_COND(pm_runtime_active_auto, _try,
>>   		  pm_runtime_get_active(_T, RPM_TRANSPARENT), _RET == 0)
>>   DEFINE_GUARD_COND(pm_runtime_active_auto, _try_enabled,
>>   		  pm_runtime_resume_and_get(_T), _RET == 0)
>> +DEFINE_GUARD_COND(pm_runtime_if_active, _try,
>> +		  pm_runtime_get_if_active(_T) ?: -EAGAIN, _RET == 1)
> 
> [Severity: High]
> Does this strict condition break interrupt handlers when runtime PM is
> disabled?
> 
> If CONFIG_PM is disabled (or runtime PM is not enabled for the device),
> pm_runtime_get_if_active() returns -EINVAL. With the _RET == 1 check
> in DEFINE_GUARD_COND, the guard condition fails and evaluates to
> ERR_PTR(-EINVAL).
> 
> If a driver uses PM_RUNTIME_ACQUIRE_IF_ACTIVE() in an interrupt handler
> on such a system, the handler will bail out instead of servicing the valid
> interrupt. This can lead to an unhandled IRQ storm that permanently
> disables the device's interrupt line.
> 
> The documented API contract for _try guards states they do not produce
> an error when runtime PM is disabled. Should this handle the -EINVAL
> case to safely bypass the guard when PM is disabled?

Thanks for catching this
Will address this in the next version.

Thanks,
Nagendra

> 

