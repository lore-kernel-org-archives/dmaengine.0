Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010053.outbound.protection.outlook.com [52.101.46.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266722F39B5
	for <dmaengine@vger.kernel.org>; Sun,  6 Sep 2026 11:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788693592; cv=fail; b=Wc2JwB/Ncaw+gybQYu5aqEK6Qpjq0GqorVLsM4X01gDA63LR5wE4hNuMhQNuFGsNpg8uTB/M93Zj+2Be+pWRwHL0zlllHXCh/ff4tGuMb5tC7LpHjF/RMBkiO1isddEgNjiBXaz5sd3kuR2LBN7aWBRIBrCNUhqarGYyC6yI3hQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788693592; c=relaxed/simple;
	bh=tBSYXUblneUPl0XvxuUNx0miwjwb4TKCH9OaSyWSdwU=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iW7T3wp6SiU9PmYZKT9MNFMjeq+j2dC/YFpQy+eYUIFGZSBdqMmf+V+P2IbbSDX1opO/wUrgzhGvB44MEeAX+4VSh66/Ec9HwDxvPX+ANhlw/8LVxIL9SiM4g7/ukb4k26NbOd665K0cXxfCoxTxekp3Rr8760rIxyfzO9RlNWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yx7Tv8R1; arc=fail smtp.client-ip=52.101.46.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yx7Tv8R1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lakA+o861sol+acgqxt/Huu7UL86Iejc8b6iRErKceGymZVl9egJCT6kI3+c7c30mP7vsTFN9GgDqUfcGSKL+Cw3sOg9v8OyOL3vpTbRPkGODlaNiuMQ0H6d461XJgZPNn5G9hSCsY9ZXmNk0KiCp7NYbmr5T/FcF31YlrumfJYugz9zbbup2rgGMuq0ZdRx7q1ARltjQLP1vH7ozJ9n17FSJUfrCUZmufkYq5j/gPYKg5pO5A1GqyffFpeMpFb3QoPwMaGKIcOlnsVj9P2nOUSyGRyX7WNu2nKGh7uqeoyFO1EpvWa7SPexzVqophOuDqMk/g1Lc27cF7mSoJEr/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14Z59FNojOrNOYiyHvBdLaAAhfnqlQRpgfX0ebXBTN4=;
 b=BRqc8nsbXi+IadPk4Zcaq4EO8Z//oImNgTpHEHyAtcdkOrEWliD2jktmZvw5/S6gjejw62uC03sxsYlFZI2BPoJTUvmO3/yQysxael+AtbSKtPqgfmFqpYWHUcrykzVtW+xe9N1hemLuU6ONonvl94VD2btl8lDSWDaBXPAxTXmFau2yIq6duQYpxyIUcU3sLgEv5AOLbB/0OJufIUWoCbKU2PSv4DDAtSlm3JdJJwkv27lFimllvxEMmGlPuydtxPhY8e617YOh8jxNH9MeOLSPnB6wC78O7Y+Qcs/JagdXPAVtjiW+42xwDvyjPaJoBzQmOhSkFyRkC16qbfrK9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14Z59FNojOrNOYiyHvBdLaAAhfnqlQRpgfX0ebXBTN4=;
 b=yx7Tv8R1EqOjF34hZQQTPChdXVl4yw0Z2PRd6i5i5TtEFTuL0k0o/mjIFNFa+WB87BKXPrD0dpe2f/S/kcF6cUF0urW/SsfS+bvPrXRR00DPq42kpdZ5ZwabNZsMDJp1kxQ4wAaGIE7gIsbBrtTqMPniHm1bhqtE2wtSslFz2dI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by DS7PR12MB8371.namprd12.prod.outlook.com (2603:10b6:8:e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Sun, 6 Sep
 2026 11:19:47 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0382.012; Sun, 6 Sep 2026
 11:19:47 +0000
Message-ID: <ac8ea7c9-2c6f-422a-a741-7829c77d7c00@amd.com>
Date: Sun, 6 Sep 2026 16:49:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: zynqmp_dma: drop redundant label
From: "Pandey, Radhey Shyam" <radheys@amd.com>
To: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>
References: <20260903170357.1711462-1-vkoul@kernel.org>
 <fe1ff210-3a77-44e9-b092-76995ff3469c@amd.com>
Content-Language: en-US
In-Reply-To: <fe1ff210-3a77-44e9-b092-76995ff3469c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::12) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|DS7PR12MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: e4952be7-8203-43e2-2a5f-08df0c08c272
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0sJxhhzkyZnXUc87EsA25t9RjkQ6Nu6zOM98wUqPNxdXFEYfnJyfXsHLB7E/DrtSmo90dm53ZhFTJEd0bH/T9DaNK0D3rHU2Eju2hvHhx6bes3+G/zgPmDVXS/gHpyFFHawXCMKEeiJ+IkxWKRGDJMJxGD5yXKMOPfukGes5WN7Pqdi9mLfXo61DF5jotXn1mlh9KfR1U5isU6wDOm2YffJef+mlHuJhH3FPQcjCJdu4PLB804z8Gg2jlctqwa2XaPSUFsj9ck2LsdA3ATWbDa+OyeAeuGdWmKY5jk/Bn+VW5jjgiSKKw5wDW8uSX0GTB28KZUcKD+cAjweXEMn3Ut4MwJJHUoO0t776kV0FEwGn1ZteKgrGYXbu3imevNNHjlcjMYz/4hTCSm9ynKEG9yplx/bIxVCUGxeGRarTyFgBziGtzDFlJRCt9i6vib+d3DZf9DsJMso2V/VWNQbGsxRv19Kg0m2ondzytyMUqh8AuSOO88XieqgyHNLLCK/P15Dk1m8OP2/3iwEnz6EUbHCPtknmT1QNbQbebI6JqxPRW1lhTjwNFjjDACL0u1XvUN7P6nQGtxJaN+3jMcg6GYWcjttmgbeoOlPUgT6QDWkn2vTma0JnYwVjMfGS6kkXLS7IqH7vsUKFgyFTZEJQi4vbrO4r8W3cbEJr82dtVU8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDF0MXF6dk0vU1liRW9kR2w3anlLd2duVG4zczZTWVIwRWswN0pCcEZrWFlm?=
 =?utf-8?B?bTNFWVhhSmRObFNPcVlNVzVOT3p0K2NvSm5TL0NpampiSlh6dXlZSVdCS2li?=
 =?utf-8?B?VXR4bDQ4VlRKTWFMY3N5QVVDckF1TEJ1SjljODJlZjVNblloSit2bHZsZ2JH?=
 =?utf-8?B?cklQUk9TdXhRTm5rZXdONFlHVmllRlFFUnZlRVBDSUZveFdrQkxlelpoejU3?=
 =?utf-8?B?TUFIQ1QxV3dqR2lnVkR0MHhaallQclgxc2JyQ3RpNTBrK05KQXlqTjhJVGZG?=
 =?utf-8?B?a2RNTmlUWFJNZDJiallIZFpYS3hsN1RCN3pzRmpUMjRqcjk4N1dYMGgydlRQ?=
 =?utf-8?B?OFkyRVoyT1dqL3FwQmZ3S29wVGdoUVlRRmJYbjhlRHBsUWVWUlFEK1pLRDQy?=
 =?utf-8?B?OW5makhPVEhrNmRlcW1BaTRPY2t4Z1ZTZ2RTOXUxYzczdnlpa2Z4WEJBK0U3?=
 =?utf-8?B?bDgyL2EvVG9KQkJrZmUyTWNZRkZWMkV2K0o4Nmw0UnAwTDNiTnhBeHB0ajhw?=
 =?utf-8?B?a1B3b2FtamlabXpIWVRKcFpiTGtVSDhZZTNhZ0tFSTBBZGR1N3JDU2dWdWdJ?=
 =?utf-8?B?Z3dmNzFENmlYUExJc2YzUEcvZjdYWHN1SmtMZktIME1DOWwrbkVCVXlreUEy?=
 =?utf-8?B?bUpUbm1XelBKbjNadzFhVW0wTm5LVW50ZjlIVmMwcG1ySU1KcGdESWJKOGVU?=
 =?utf-8?B?Wk1oSHhobDNadUZnUzcwZDlGRG9uZ2VZWWdjWUJWT2pDV1JoL291TzZ2eFdj?=
 =?utf-8?B?M1NCZ0VaZ2J6K3QySnhHUjRselJTNjFaNGpZNk9pTzJDMUdtV0M5NHAxWllN?=
 =?utf-8?B?SGoxeFBaTTFSaExRV3JFYjRMUXk3L1h3N1I5QzRCdjNjNVBDN1RiZmtGaU0r?=
 =?utf-8?B?Y1ZwK0JNNmtoOUNrV0NHYllJVDJuOTBOMHNzbWEyMERIaWx6MlZwUTY5VXJF?=
 =?utf-8?B?OTdmU0hCdzVGcjdSVVcvM1BMVlYvV25BUDNFazdabG1CSlUzTFZ0cnNUNlNK?=
 =?utf-8?B?NzNYTE5IYTFFbjNxS1puRVpHdjFiL3VnbGZCRUNqNGxEdnkzNVVLUGhXMmZ2?=
 =?utf-8?B?aG5mbFdzVVlJamlNdFBUSFBCV01xSjJ2d0hSclpOK2ZBMzhFMXUvdXZVTkZ3?=
 =?utf-8?B?UFJJQW10SWZPYy9QY2lYZEw5RU1xYnJIa1hGUHNaYUdOMEZPeWY3eG1CZDIx?=
 =?utf-8?B?eWo2Z3lLaWVDK3RjUUhRZkhFV3EzZWM2UUlqaFB6YUdRNWREbk5vU3ExUFJt?=
 =?utf-8?B?TEhKVkM5WXp5K1hyS0dGYWlNMjRyMitoODcwcFhOV21XZE9UaU1oWExyMTlG?=
 =?utf-8?B?WElnYlIrYkdJZnFkeHhSTHRZalhVZTUvQ2kvMU4xZXRUK1BqOUlzbDl4MGF1?=
 =?utf-8?B?b09UbkVCQ1l1YkUvYVh4aXdWK3lyc0w2NGFwTEFxV2tqMkRic1JrSUdONVBL?=
 =?utf-8?B?Z1NpZ0RSdHZ1Rm1xTUtOOVAzck9vdm5lTThibVh3VUFnTjczdHFmaVZlL3dY?=
 =?utf-8?B?VW9FTDJUNUVyZEM1eGpEL3o0R3NzNWt0cTllVGVWNllVKzhnN1ZPSDlhQW5r?=
 =?utf-8?B?enh1RFh6SmR1MUF0S29yaFJzaVMrNWZZY0J6K1YzaVFaMFVGU0hTVVVlaWlF?=
 =?utf-8?B?Y0JGYW1oUW5IYU41M0NXc2poSTlMeGhVa0RZSFhhNFhWdW1aMXZxcm9pazZr?=
 =?utf-8?B?UU11NnJGM1BGcmhWaWZ5SldibVdCQ0hOMFg4dVV2L1VjRExocHNWbDFHNmhj?=
 =?utf-8?B?cTkwOXdDazdwNWlyMjBxSjdWb1JXNmFsWkduOXNZbVl4QVZjczFIM3ZUMk14?=
 =?utf-8?B?eXBhb01ZU3Y5VnM0VFJFait3T00vVmtPOHRuR1AxZ1VqdUQreGlkL0tjY1hI?=
 =?utf-8?B?Mm5nRlVkY0dvV1lvcFM3ZHM0UkttR2tleXJGQloxbHlSeE1ETTZlR2Y3UnZO?=
 =?utf-8?B?RFpSVk5lOHpQcFhFdkg5cVpabnNLVmRBaFk0cHdhUnhxS2VaMkV0S01NWFJN?=
 =?utf-8?B?R0hPNjdldktPSHYxYmtRaTZRUzdqcTdWWTBmbkc0RjFxQnF5cVhkSEx4b05k?=
 =?utf-8?B?N1QzQnNkRXJ6alQyRnU0WEJySDl6YWJXOTc0cmkxalFxdjV1Q2Q1TFRMT2Zx?=
 =?utf-8?B?RHBOUCtMNkdwVnQrbnZPeDNzM2VvNVF1NExKUElPcllZYlcrSW5pTDB0Q2Vu?=
 =?utf-8?B?VWVUSW9ibjk1S1dJbHQxRThKbGU4Qm0rRzNJWDRKSCs3WGxxWFllVU15L0I0?=
 =?utf-8?B?ZEg4cW92WVFiYk5TSzhOMWQvY200V2RwN01RaUpNMklHdGJTSlEzQ2JCOHZm?=
 =?utf-8?Q?usP5Cdz5btDNZ7TVdk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4952be7-8203-43e2-2a5f-08df0c08c272
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 11:19:47.2171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6bAHbK2LdKX/EnTvTwImp2Syoogf4qP59KBef3SRrTbGBJcZvZeGpPmVKvb5UnS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8371

On 9/5/2026 9:01 PM, Pandey, Radhey Shyam wrote:
> On 9/3/2026 10:33 PM, Vinod Koul wrote:
>> Commit 64c6f7da8c2c ("dmaengine: zynqmp_dma: Add runtime pm support")
>> dropped the use of err_disable_pm label causing warning:
>>
>> drivers/dma/xilinx/zynqmp_dma.c: In function ‘zynqmp_dma_probe’:
>> drivers/dma/xilinx/zynqmp_dma.c:1171:1: error: label ‘err_disable_pm’ 
>> defined but not used [-Werror=unused-label]
>>   1171 | err_disable_pm:
>>
>> Drop it
>>
>> Fixes: 64c6f7da8c2c ("dmaengine: zynqmp_dma: Add runtime pm support")
> 
> Seems Fixes tag is incorrect.
> Fixes: 3f30db282c28 ("dmaengine: zynqmp_dma: Fix chan probe/remove error 
> handling")
> 
> Rest looks fine to me.
> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> Thanks!

Just a thought - this bug is present in dmaengine/next and if it isn't 
pushed to external we can squash this patch to fixes commit itself (if
rebase on next is possible)?

>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>> ---
>>   drivers/dma/xilinx/zynqmp_dma.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/ 
>> zynqmp_dma.c
>> index d1ee51dde3d1..3b7dfa53f972 100644
>> --- a/drivers/dma/xilinx/zynqmp_dma.c
>> +++ b/drivers/dma/xilinx/zynqmp_dma.c
>> @@ -1168,7 +1168,6 @@ static int zynqmp_dma_probe(struct 
>> platform_device *pdev)
>>   free_chan_resources:
>>       zynqmp_dma_chan_remove(zdev->chan);
>> -err_disable_pm:
>>       if (!pm_runtime_enabled(zdev->dev))
>>           zynqmp_dma_runtime_suspend(zdev->dev);
>>       pm_runtime_disable(zdev->dev);
> 

