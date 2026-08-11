Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011007.outbound.protection.outlook.com [40.107.208.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1109943C7C5;
	Tue, 11 Aug 2026 10:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786445418; cv=fail; b=sd7SZgDF+oGi2ZGnbcPoV18tsnABjHuqyw3CbjD/A5W8kfk59qvzFmbck+mFtsyVvez1Sc5njqSZofGjR1d2e3ohUFdyRcoy6+LryLlAMGtVKN4W95c5ygxo8nz3q0ZjRwkmKiPLNxCLsdgzyzs/7OvDmKOEsjdTr/wLX9faYgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786445418; c=relaxed/simple;
	bh=498v02C67087YVo5fpim7V6E0yVHEI4nvi/Eg/kokF8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A90tPg/89z1DblPFJ/kZM6v6+ulMnra6egqBoLowIiMWn++vgtw/kpSrs2CJHwCsf1iERyUMNpilO2y3Gm29IoVAA81BhqCauYZje+amrMMYhGRlY3FR7KUZbkT6SBxO/4ZRyEQAgsBCdtBwPwUWkeqnJKfKBC+VfNguqkJC6WM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MS1ODaL6; arc=fail smtp.client-ip=40.107.208.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MS1ODaL6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8raWHLTdunz/JQzV4cY/F1SvCn3DE13gFs8DIHzD9KJ+D/3NzwdyOUnymAsk+NfuhQXzHkAcG6WcYDSVSNBviyDKaSfS/A1TQMXe+8w1Gf8piqYYOT0haa/CUynn0WbYXraaZCIqlhWE9tcR7e6yUFwIYhAuaH+akFAD/iobIafkdg9wMFWfN+8dAUyvTRExZdJ+pD29oc/oI116RVoHLqeLemA9IznPR/979rIj2kaN7p+Y4ZHGM5tE3PaYkyT4zc7j36bCUpm4oGAKyESZn5tdhIcLSIEsA271bvun3QeyHza/T4HfqmasTRPCpZikH6oSmoiaOjiJCz9MmjrXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dHY9nrSulF+M0B/kZ6xc+J3CALuuMuZ4S3rDvsVDHc=;
 b=haJv/N8fuP3agf7/XPLylDDT4/suwYIwA4BJnv3Nf+8UKjz7R2vRh2MkkLDUZhHhc8sngKEkuTQ8ph0LDKy026YBIKhPB1MgvL6NqrkqP3ayhSZTPdb6wQ5q1EzeBdvrqQ52RbM43ASo65bwTRxMyeZ5Xjl9hqu0qN/pKAxp8edVkbShPn5q1gwz4Xjvm4e+pCwjRH1JUpHHQiBFHK+22XIzGkymmCOZ6xIL551o6G79scfs8QA1MmmnvltnXHVYTzC0pw1cabJ25FpZAez78lTHI/fE1hjV+tDQw+UbFAtT7UKNX1MPZjumn56QZxlInOxFyDEuRZi10VTci0PUJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dHY9nrSulF+M0B/kZ6xc+J3CALuuMuZ4S3rDvsVDHc=;
 b=MS1ODaL6Q3azkIXR15+1La8a7wlM1cTStKXi8rTh96lpyjYFK+AZW0VAUAtL2w2WRDmToielEWGepqf+5R7VMUNCScIHV1HfE7F2FJ1qPkF2gmfKQtpcR8Mje9LsplNE65yAsllvcqpPCkgPyE0vJie019xHSOuUXIYKFvQvy30=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS4PR12MB999075.namprd12.prod.outlook.com (2603:10b6:8:2fc::20)
 by SA3PR12MB8804.namprd12.prod.outlook.com (2603:10b6:806:31f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 10:50:09 +0000
Received: from DS4PR12MB999075.namprd12.prod.outlook.com
 ([fe80::4c9d:851d:3f44:800f]) by DS4PR12MB999075.namprd12.prod.outlook.com
 ([fe80::4c9d:851d:3f44:800f%6]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 10:50:09 +0000
Message-ID: <dbe65c0d-c969-4fc0-a30a-cfbb6d25069a@amd.com>
Date: Tue, 11 Aug 2026 16:20:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/6] dt-bindings: dma: xlnx,zynqmp-dma: Add Versal Net
 compatible support
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org,
 robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org
References: <20260810100452.426320-1-nagendra.golla@amd.com>
 <20260810100452.426320-5-nagendra.golla@amd.com>
 <20260810102010.215D71F00A3A@smtp.kernel.org>
Content-Language: en-US
From: "Golla, Nagendra" <Nagendra.Golla@amd.com>
In-Reply-To: <20260810102010.215D71F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0027.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::17) To DS4PR12MB999075.namprd12.prod.outlook.com
 (2603:10b6:8:2fc::20)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR12MB999075:EE_|SA3PR12MB8804:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b3f290b-f81e-4b02-a56a-08def7964fcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	vjkvJ0Qxnl8Fj213qQFTKun2uWpmmOjCmXcQB7MJ+sZiPZtjtHW2mIeOh6GYJF5lTo/7MfeXohMD0LSaeZ9X/ASrOzlZSnK7Kj1nZ5uzTYUIzNjhnFc6Q3mn4+odEdVjvQPC73uUS56/4175HFuoZcgODl6jqtStrizx146RSTS+GioLe3ExZo0UaNTCC0MJ2ujPDTxpBMSwFIRXGOFUpQu1mgp234GXyqI24tqYoac2mI0f1PBH6MgolcGsGonJepCUri9CjYyPDD7w55FTGQ3tHCAQ/VCWEYALmViE1zduETAPMEUNAkDzwz4LkzhcMxd1odr+mgNSIeeadHUPTaRCR6HpWwoqwYgkjNVYrOOtiywuvB3bDyzzAAkxhpaLAntKieSy7Ry+XJns3OtzoO1akOBDhl1xpZ0HXxropnwSo7+e8QmOoyV8Ij2bh2PQoN0PqRNnMI28B1CzWfy3xnnBhNx7ov/Blp19oVpYE/xqfSFNCLuvpqRf1+WaVU0b7TGWWvFaoXICwimwYCJLl9h62RQttafcLBnEKhChWFzGldNEglUesWu0lXKlgtZKXYzNxlXW3pXvcuhAbMuomUNwbhwChH19HzSmJ5jiu8y4K+qs/Hmcr8f9wDWWp6h08NlT+GPwdRXfMIWKTo7nAKctRlnv91X8G28AK3N3+I0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR12MB999075.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QndSYThHckIybnUwRWhnTGNNQ0R5cVVtMkJvdDNjQXJLby85U3FZY1Nxa0lm?=
 =?utf-8?B?Q09QaUFma3NXZjRuajRFdnlYOVowL1BxOVJDa3JnbU5tblNqcGpvWkRucTUx?=
 =?utf-8?B?dzh6VUE4blYrTFVhYVhqNGhZQlZXUFB6Ujg5U01DbTdlL2VnaTl3VjkwSlly?=
 =?utf-8?B?K1NqTUVRWHJTV0xvdjVPQXlJZzB4RENFMmxxOUxZZ3Q0Uk9NZnZjU0NvcXIw?=
 =?utf-8?B?T05Ybit3Mk5Mdkt0YmdzSkNpaWROWlVvMWc5MWxwMVBUSEJObjNjcUs1Mlhx?=
 =?utf-8?B?N2pmdlhGeUxrQjB5My9kM1YrK00rckpiajhKY2wxc3BJUDdJZnVldDdnaFdr?=
 =?utf-8?B?QXJDZFY4VE1RK0hIVVFqSFlndktxRktJeCszZGNLWExjM3JWbUdmM0h1cUIr?=
 =?utf-8?B?TXZ5WHJsSXpGcU40bHFiOVhPOXEyY2I4RXJxd28zd1ZKUiswMFoxZGpDNzJk?=
 =?utf-8?B?ODlyUFVJTlBGRTZtM2pRVWgxWFlzVTh5WHk0NmdhTVFNMlNrOTcweFNGUkxv?=
 =?utf-8?B?ekxKdnJhSENydFJsTFgzL0FzYXJJTzI3dGtUaGZlcjJJa3V6cnk3bVNaWUZ2?=
 =?utf-8?B?WTcvek5PdlVYc2wyVjYvODYwSCsvTnVqRWJ6RDliMHNpOTdjeGFiYXJQRmtG?=
 =?utf-8?B?bW0wd3h4Q1RJZFlkZVI1M2wyK0RJRGtia3d5aW1FSGEzUWpmMVc4SDFKNkJM?=
 =?utf-8?B?cG1EQTFrSXlhMDNWRHpsZWdQQjVPRjQwL0pkc1lOaXUxbEU4ckZzYkJLSCt5?=
 =?utf-8?B?TzBCcGc5L3NwZUUwUk13bFBkWVN6VXBPNDA0WG1YOU5LUXh5S1NVbGxremRx?=
 =?utf-8?B?VXB1M0EwRUlXV3NyZzR6UzQ4NmppeUFkUS9iZTlkOUl6NVc3c0UrZVY3RkFB?=
 =?utf-8?B?VzUxeVdUZCt2c05qRnJNYUlsMk94TU9zbm1lTkltcTFzZUtvU0NpcGJXY0Q1?=
 =?utf-8?B?aWhscnpCRFF1TG05Vi9wTEtGSnhuYmpHNmlTTDVDUXE0elZqTkpjaFB3eEoz?=
 =?utf-8?B?ZWpZS2J0ZDBNUGJSTmhOeWxlZXVIUmxGOUZKQnI5TUVHL2hnL25RcFN0eER1?=
 =?utf-8?B?NXd1ZCtyYXB5S3QxQ3BOcWpyR3ZqQ2FOVWwvNXEzMG1Ld0ljZDFzV2Zqd3Vu?=
 =?utf-8?B?am5WcmNCTzQxQ1RTSXFVa0hhSW12WFA0V1JKWVJVS0hZeGlDaFVVY2hUSzBC?=
 =?utf-8?B?K3h4T1N4QXMycVB4bHViUHppYy92V2lqUG9IYWcvajBkR0svR0RSREVyMDZ0?=
 =?utf-8?B?dCtZT0htNm9WS2FJMXBxMWpMaXprVnc3aUlkWjJWckc0dVF6cnpBalFYRzli?=
 =?utf-8?B?VElUdHpYRFhSdllZdTlMUzZ4cndxUnJjaVNxaFcxdDI0Qkw4bmJzZTBZWU8w?=
 =?utf-8?B?SGN2UWNnNGNJNzdyYjgzTHRqTkRwVlBCa3M3Z0dGK09tQWpNcTJZamxoM3NL?=
 =?utf-8?B?YUlteXRBN2NqRHIyakhtRnhvd0lQTUJaWnMzRnNDU3dPRklEckIyaVllVGt3?=
 =?utf-8?B?TldscVdKUW5TWGhGWFh3Nmd4NDcwaDZWQTl3Ync3bXMzaWZMUEpBeW54WlZB?=
 =?utf-8?B?VHo2TklDWGhXUUVXaEk0RVlCZ2g0LytGTHpzQnNzUkFKaG1nUTFWaFl5TEhl?=
 =?utf-8?B?ajVGSTJ2dlc3amFrZVVCNnFXeFc5WEZ1N3ZsL1VHb0NpYUprb1JFeUZPS3Zs?=
 =?utf-8?B?bGVkcFVmZGJBWjBBWktNYXd2dHJLcTJscy9hYW9nOHkyU29PVVhtTzFaQ0R6?=
 =?utf-8?B?RWVuWXd2S1JMcFk3d29UaUlnc2Z4eCtHazNUS1QrWGdjRnorWWVwNkppaUto?=
 =?utf-8?B?MlJ4MjdYYWVTY0p3aTVaYzZ4c2p2emJIOHlkcFpNNTBMeHFmS3JzRjdNL2xl?=
 =?utf-8?B?dm5ZNmJMaWtPeEFDSUhhN20ybmFONFVpK3BidGE4bDVrNkZ6VGJ6OWRwMjVV?=
 =?utf-8?B?SzM1cDJxOUZ4NkZDTDBPQ2tBRnBtM1lmUXIwL1Jlek9NTWlkMm1ySEhtY2xR?=
 =?utf-8?B?bXFldnZGUGM2Z2EyZmZJeVZpdnlpNnJ5dk5IL09oRlF3VWxoSCtDZG5mcGI2?=
 =?utf-8?B?TmZJWTZXYXgzYmNkaDBXMzUxWFowbHMvTWVaenJHc2NvMktjRW95cGs0TWtZ?=
 =?utf-8?B?WlgvdXNlNlFiNVJPZ2lDOGNNZ1dRVWVRMlV4RjJZL3B6TEpWd1IrK3hjSlV5?=
 =?utf-8?B?OVhMeTcxQVlGMTJqUFpkTGZJNGtBS2ttS2F1cldKL1lmOG90Zm05OEFiWWgw?=
 =?utf-8?B?b29RNG5NUnE5eTNnUXloNWh6dkVtaUprSTVkU0E0WWoyREw2Nnd0enNuVDRp?=
 =?utf-8?B?b1BsaXViWkJwZUFTcnBXTVVmUGF4aEZlUnB2MG1hQVozK0xxQVErUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b3f290b-f81e-4b02-a56a-08def7964fcb
X-MS-Exchange-CrossTenant-AuthSource: DS4PR12MB999075.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 10:50:08.9964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ReQbF2ZL1hurDHkgKoyGfj8ndtbhvl2eR1SZpE/0T42REbSPnMU2xqp1tEkDN1Y0TOSR9AvmwxRPU26LbczY/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8804

Hi,

On 8/10/2026 3:50 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Invalid fallback compatible string `xlnx,zynqmp-dma-1.0` for `amd,versal-net-dma-1.0`.
> --
> 
> --- Patch [4]: [PATCH V3 4/6] dt-bindings: dma: xlnx,zynqmp-dma: Add Versal Net compatible support ---
> commit c94f71cbb3b4d274afbe8968d6bb108158803292
> Author: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> 
> dt-bindings: dma: xlnx,zynqmp-dma: Add Versal Net compatible support
> 
> This commit introduces the amd,versal-net-dma-1.0 compatible string with a
> fallback to xlnx,zynqmp-dma-1.0. It also adds a required per-channel reset
> property for Versal Gen2 and Versal Net because the DMA channel must be
> reset to clear the state left by firmware.
> 
>> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
>> index 2da86037ad79e..87c65aef5c7d3 100644
>> --- a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
>> +++ b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
> 
> [ ... ]
> 
>> @@ -18,15 +18,31 @@ maintainers:
>>   properties:
>>     "#dma-cells":
>>       const: 1
>>   
>>     compatible:
>> -    enum:
>> -      - amd,versal2-dma-1.0
>> -      - xlnx,zynqmp-dma-1.0
>> +    oneOf:
>> +      - const: amd,versal2-dma-1.0
>> +      - const: xlnx,zynqmp-dma-1.0
>> +      - items:
>> +          - const: amd,versal-net-dma-1.0
>> +          - const: xlnx,zynqmp-dma-1.0
> 
> [Severity: Medium]
> Is this fallback compatible string appropriate here?
> 
> The commit message explicitly states that a DMA channel reset is essential
> because the device is left in a bad state by firmware, and DMA functionality
> fails without it.
> 
> If a device tree is parsed by an older OS using the fallback
> xlnx,zynqmp-dma-1.0 driver, it will attempt to operate the hardware without
> knowing about the new resets property. Since the older driver cannot perform
> the required channel reset, won't the DMA functionality fail just as
> described?
> 
> Should the fallback be removed if the older driver cannot reliably operate
> the device?
Thanks for the review

The fallback to xlnx,zynqmp-dma-1.0 is intentional. The reset is only 
needed when firmware has already used the DMA channel before Linux boots 
and left it in a bad state. If Linux is the first to use the channel 
after power-on, no reset is needed and the fallback driver works fine.

Removing the fallback would mean Versal Net cannot be probed at all on 
kernels that do not have this support yet, which would break existing 
users who do not have the firmware pre-use scenario.

Users who need the reset must use a kernel with this support, which will 
match amd,versal-net-dma-1.0 directly and perform the reset.

Thanks,
Nagendra
> 

