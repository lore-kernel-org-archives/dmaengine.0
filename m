Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012023.outbound.protection.outlook.com [40.93.195.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093DA3A5E71
	for <dmaengine@vger.kernel.org>; Tue, 28 Jul 2026 19:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785268137; cv=fail; b=qeUcX8WZXzdAWQMMNvH/yRXURzsSEr9nQWlMriaLUpAz2GnlAr/9Aq2VPRX9Wg4j0HF1OryG4YH2XmQsw3L7vzOrVicseMsCE179aLeSrBX+Zp5koymnXY/io5VYNFFThggq/sSGEOGrcedJd3YfHaJGWJcR4uXJ/mSd9JrsRes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785268137; c=relaxed/simple;
	bh=4UboG8sQIX22m7KYmJOp7b3y9J2W57x/DatjNapc7hc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=V5TPFJQEfi39RJedkuEDT1v2ufEYaH65pn891E258l5orRH/YlxRPpOyEBrMojNYMQNhciN4ZPV4wyD9zJb6Rx85PGGRueFpaPmfBiETsCCY6hVKs4UB5KJDHS/HyX04ao/oqT1M1PSUOwyK1dfdI6jleAzNOvfc7llH2wBgZ/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CReT8Eib; arc=fail smtp.client-ip=40.93.195.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CReT8Eib"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=afVtG0Yc/27Jwr1FN0rV6Ws0LoiDcyKAuDv7pknc/39nVzc7YexCRqsRpC2JzHofZgyOrCyYBPEtS9EUh7WVLf4V7vE/Ohr8OFwRBmMJr4qY/51f06OMVMb0o5D6pbpcAMOG0AjYnecnOvdvUyNN7P3ny22kIt4W1Ssx1GPzTuOFmKp83themTbjqgtbdSaKzX3bLeN4i0vHERW3q0g+srqhXCrBakpuXYGRUWr/2ftLl4sco/KBpmNY9eZscj7BS74892hXaZMZ52GWxizMw7As/1FaXJBfv1XoX9lqXLbY0e1I7KW64oJTjY9lehTBbMGEvkxw6NSL7k34Dx8tPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWPWzQvvjAim4zPnRQNeBDhsXFXMEDsCdEmlxbdTfj8=;
 b=fM5ySNCfafmLyMseeFuMXIu/+3oK7H7uOPugKFyCLFD41OD/JU4Eg0eiPqPKDSAerfoyguIK2ZIgJ60wX1qWfAOZicZurhhna7uLEZca/Gyc6I3aKZ78662KK2rATyWmssbwe1XtCaP4boxU7i70UZFkAfF6W7EL4iUNpve7PAZtCXYPztoLhhEYo79j1OYSFbRqcWhflfv15p0uh/5loFyxI5AP2jlRjb9a3Kik2xH/YTjh5rkClN1ZjPKvRTLUlSIQ0Mwh7Jq5jNI9mYvVWEkOtC9efzdys2U8oa6dyz/+sqRZFynx9Tu1OHg8baEkZb2RE2OlGgiN4KgqkvjUkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWPWzQvvjAim4zPnRQNeBDhsXFXMEDsCdEmlxbdTfj8=;
 b=CReT8Eibfg6uwvwCOx6KHw5dHsfxw2XokaVt5hl4Jq4/3vDFNHHBWUdtbzoB60BfUjIo4ByhpnXaTwgKjBU6IbMFgJEqSWWtUwesREK9tahmlp7WB6e75+gKLboTRIMtEXumsMsmgL6TCYWTCYU+OI4IVTvze2uUHTdHps1pX6A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB9020.namprd12.prod.outlook.com (2603:10b6:303:240::6)
 by SJ0PR12MB7460.namprd12.prod.outlook.com (2603:10b6:a03:48d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 19:48:52 +0000
Received: from MW6PR12MB9020.namprd12.prod.outlook.com
 ([fe80::879c:bf22:f7a0:e8c8]) by MW6PR12MB9020.namprd12.prod.outlook.com
 ([fe80::879c:bf22:f7a0:e8c8%5]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 19:48:52 +0000
Message-ID: <00d8a82c-2b9c-4ff0-a67e-738349d6f02e@amd.com>
Date: Tue, 28 Jul 2026 14:48:27 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] dmaengine: dmatest: Optionally make test errors fatal
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
References: <20260722-dmatest-fixes-and-fatal-errors-v1-0-8287709987ea@amd.com>
 <20260722-dmatest-fixes-and-fatal-errors-v1-4-8287709987ea@amd.com>
 <20260722163327.20F1F1F00A3A@smtp.kernel.org>
Content-Language: en-US
From: "Lynch, Nathan" <nathan.lynch@amd.com>
In-Reply-To: <20260722163327.20F1F1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH5PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:610:1f4::29) To MW6PR12MB9020.namprd12.prod.outlook.com
 (2603:10b6:303:240::6)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB9020:EE_|SJ0PR12MB7460:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c05e11a-aeed-494d-2f8b-08deece14001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|4143699003|18002099003|10067099003|22082099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	lqCmIIuS8n9xDawz46CJv49rR1TqWM5uaRofDRowuifzCOjiuEAMnQMHTnKjVHZbhpCluVv0vH0yILa3CsETXJ6+Dg2LFH9wLXUr07Z8sl/6RJ34K+Y21nuv4Qj+JbFHz06t2QqWnzujXQDaMp1GuoFBAfuk1TYDqDrLi+HJubeAL9gIlnw3YP6Bo+RTs+AWWOLyaopeG0FmqVIuq1xwFgwD8/9lnpMm696fFqrkSVXG2Yq5dUCwY2KF4o4j5B9mCbMoFrZ07vJbhh8v4gx4EuWcUsBGsjmin5T4qksUjPDyTOHEE6JZ2C/7TbtxxMBowqQZQ4E281UIKMTybmtWskX3aDJXJ+ssBMr7Ud3+3qYqziXIiYdlCCuPDUT/q6BBuZ3z188+HUNUG+6CKKVbIfLX/zzhXBHI+p8eP0b4Ua05u/UTWv9lgj6K9xjit58LzIVVqs6nVy1rzZUFNiyQi8mfZ/oJOD8IGTrYOW6zDh68DYRdjKhgXMEGP2Mn3lsGka9t8mEDYwe8jqQpQh/lDieQwVJt3d2fjc6SEgslucZZO6nfjTXqNQ6r2BBemPVSTdAXI7kp/ZIOOUifY3pNwKjwNavN04z9DBp2uZVtEHM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW6PR12MB9020.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(4143699003)(18002099003)(10067099003)(22082099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUZjK09mRlZCelYzUFZaYXY5Wk5pamxVVlFTTXFkMU9ZVGhIdmtKSkk1NnFZ?=
 =?utf-8?B?UE9OeStLbFJsOGU3TkRDK3ZoeEZrWjl4WGtLNDJNaWtTN0ZWd0E4djc4dHU3?=
 =?utf-8?B?bTNBN24yMnRwUW1DSFQ3TTRKcjM3T2h1ckt0Rm50d1JNQUJNOTRrRUF5Qk84?=
 =?utf-8?B?Z0ozRzNvWG52M1BvYXIzLzhuYStlUG91TnBXUHhWa0UzVVlFTmIwY2NuVVRo?=
 =?utf-8?B?TmcyZ3VRcFFNSStydXhCa1VzNWNlandQOEpzU1c1dG9iSStzYXVVOG41dUZ5?=
 =?utf-8?B?cGxOTXF6Wkt1NnJBUUtBWG9HcHRNMmY0NkkzNHRLek9QcTFjdkk1ZFlPUkZV?=
 =?utf-8?B?Qnk3a0xONGFidU56Z3hqYzlxRU01eGVTMmZoRXp6eDRDV05XNW1zUE9JbkxN?=
 =?utf-8?B?eG9HUWthd3JXaGwySldIMUxKbloySHNveEg0aGs0bjFtZmJOWWRleVN6bDVm?=
 =?utf-8?B?TnpESGFaT1VUUWl3VzluNFBvZjZVT1hHbm42SzFUWWprOXk5N2t3ZEJqbHpH?=
 =?utf-8?B?enU5aFJweHczbHpVWks2MER5OWRXRVpwV3M5aGxSb2VTdmh1WUgybFJ5VFR0?=
 =?utf-8?B?QXNvZEtIRVhhR3BLK3FWazVvWUllcW43MGVhSURrN2RIQnF5WnJqR2ljT1dR?=
 =?utf-8?B?ZWVHZ20yNkJmaDBpS1N1S2laOWZjd2EyVkpWREt1MlN2anpHSmk4emFrektq?=
 =?utf-8?B?ODAzZ0xmaUN6SnF4aVQrUW5ES1JMZ0ViYzZaUGFTdHhGWUNXSll3SVdUTDJ1?=
 =?utf-8?B?WHlsaHMwdHBxeUNsREphTkdTY2NUVFJQYktDZjhuZ0h0dExEVWM0L1AxNHVw?=
 =?utf-8?B?b0IzWkIzZW5uQmlJT2piKytOUlhZeElxMTFISEVnSzJMcEFuNVVjQSs4Snkv?=
 =?utf-8?B?RUp3WU5tRmtBN2grRjRtekZYOEF6Nko0WUROWDhOT1JubmFraUpDcHlhRUx4?=
 =?utf-8?B?TldybDJOSC9QTTZTNXgzS0dMQ1VMU3QvaW8xd2pjL29mTFp4TDdUSjNXN0ds?=
 =?utf-8?B?czJhMmx0UlcxNk9vM1hSUitscXN0aEVpdFhYM3NadFdpMmdzZnFRTTgwNlkz?=
 =?utf-8?B?WUsveWNDTHA4RHU5TnZnUXRxVG4rdzZ0bjF5d0JsbGxyZHpBUHIwLzNpM0R5?=
 =?utf-8?B?ZVJsQi8zOVVmUXc4U3dyNVh5OGdQbDNuay9wdXVpWTFLcVVUNTRyVjZFcjU5?=
 =?utf-8?B?SG14MjhWZGh6VThLcWlGMzNERUU0NXNBWXlraFlkOUVkOGN2cmMxenE4bVhP?=
 =?utf-8?B?T3J3L2xVdDdFczlhTTdHbWJvUHNTZVNFY3hXYnVlNWxZbUUveW5vYW1wMWVj?=
 =?utf-8?B?RnFUckFidjZFSjdlRzZueGx6MERXZGdXSTROa0paVkwyYWkwMFdxTlp0MUs2?=
 =?utf-8?B?cjVDWGlVVURld29sUnVkanQ0ODd5a3phUmFlVXMzMjNldG82VEpMOWNGVkp4?=
 =?utf-8?B?L2tWOEFRNFdqcmEyam02ajNrcWVlanJJUkpiS3ZQaDFYUmdiV3ZqZDVxOXdV?=
 =?utf-8?B?bHc2THFzam5SQXluZ2hHRlByY1NRRlZIa29MNHgvcE9jQ216S1prUEVGOFdj?=
 =?utf-8?B?UURYeUhoamFhaEw4OVh5ajJWKzZNNnVBUjlDejNTK0pETUFLTEt1U2FpbkhH?=
 =?utf-8?B?NU9yb0MrT2Vvais1V3VEUVA3YmtYeTdGQURsZ1huU3JYdEE1Z3ROUGlqeXIy?=
 =?utf-8?B?Tkt3SHZZU2J0Rnp5dXVTTDVwS0t4cVVyQWZwZTJ6TWhNTHdXYklyWkpRZWVn?=
 =?utf-8?B?MjBmNHdqQ3V5QmhsQkhENWNrV2U4QjFnWjY3STlBdDhja0p0MWlXeFVpSTdz?=
 =?utf-8?B?bmVvcFlEQ1FtQzBUdi9nY3EyYWxRTWU3cEZEV3BKRk8yS0o2TlJ3K2UrVHFa?=
 =?utf-8?B?bElPMFlXbUkyOVJ3dFNxZjQvQ1VUNWlYR24xLzdjUnpNeGptNHBuaURMUS8r?=
 =?utf-8?B?R21QUEMxdDRJZDNJR3NGajVablBVVUV6cTBSNlF2bm4yQUcvMXN5REloVGg1?=
 =?utf-8?B?ZmRrYlBBN0REVE91Y3k5aEFnYmZyamZTaDFDQlZlYzhjaU5PWUpoV1lpZ2Zs?=
 =?utf-8?B?dHJkeDlRKzFqSStVYmlJMWtCSnlIQWpvb2RYOHhwNlhuRnpmbGw4djB1aVZY?=
 =?utf-8?B?azRqZkdGVE1UeWp1blVjT3JneE1UajJwc3V2ZVUycjdSbzhTYW5sbEpJdWp2?=
 =?utf-8?B?b3VXbllKM0NwbUprb2ZQcHZMODJFT0ltNkxRZ0U2R3V3eGhEWXB4SUdkaXRu?=
 =?utf-8?B?bm04SlpoaEd3QzRTOTZDdEZyUlhPdlduckNzNGZkMytNWEVpd01qQmVVc25N?=
 =?utf-8?Q?CTrOkMD9Bn61SknRUT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c05e11a-aeed-494d-2f8b-08deece14001
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB9020.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 19:48:52.1588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrK/cC3kgDPW/MFX8fk/X6+P4bDQLZ1SOj8uDVX4cwgEjOrttF+XMT6jXp3HeJfyJeY9JQUdnXTs3nvw9Kmdog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7460

On 7/22/2026 11:33 AM, sashiko-bot@kernel.org wrote:
>> +/*
>> + * Record a test error whose details were just logged via result(). When
>> + * fatal_errors is set, panic once that many errors have accumulated in the
>> + * current run.
>> + */
>> +static void dmatest_note_error(struct dmatest_info *info)
>> +{
>> +     unsigned int errors;
>> +
>> +     if (!info->params.fatal_errors)
>> +             return;
>> +
>> +     errors = atomic_inc_return(&info->error_count);
>> +     if (errors >= info->params.fatal_errors)
>> +             panic("dmatest: fatal_errors=%u and %u error(s) encountered\n",
>> +                   info->params.fatal_errors, errors);
> 
> [Severity: High]
> Can a concurrent modification of the fatal_errors parameter cause a spurious
> kernel panic here?
> 
> If a user modifies the fatal_errors parameter to 0 (meaning 'never panic') via
> sysfs while test threads are executing, info->params.fatal_errors could be
> concurrently overwritten with 0 via add_threaded_test().
> 
> If this happens between the initial check and the second read:
> 
> CPU1 in dmatest_note_error()
>     if (!info->params.fatal_errors) // reads > 0
>         return;
> 
>     errors = atomic_inc_return(&info->error_count); // acts as a barrier
> 
> CPU2 modifying sysfs
>     info->params.fatal_errors = 0;

No I don't think writing to the module parameters in sysfs immediately
updates the parameters of a running test. The module parameters are
propagated to the test parameter block only in add_threaded_test(). I
think this is a false positive.
> 
> CPU1 in dmatest_note_error()
>     if (errors >= info->params.fatal_errors) // reads 0
> 
> Will the condition errors >= 0 evaluate to true and inadvertently trigger the
> panic? Could we read info->params.fatal_errors into a local variable once to
> prevent this race?
> 
>> +}
> 
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260722-dmatest-fixes-and-fatal-errors-v1-0-8287709987ea@amd.com?part=4

