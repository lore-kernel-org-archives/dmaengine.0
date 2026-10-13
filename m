Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022119.outbound.protection.outlook.com [40.107.75.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAFE35C6B9;
	Tue, 13 Oct 2026 02:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791860036; cv=fail; b=VT/Ju4wtP/UwzA99k85chDt15nodaW/JBqj1spyguVaW4snY8udqESJoYkcCBzrV7gZvb5zFK3UE6yDBldVYgig0h11N3smmAon2IhUhoq3HEwSOvFl4pgIZlicgEWF6Qqzts99CKsRUOVA0+uoxXFkhxKm3SJtw+iHgZCkmL0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791860036; c=relaxed/simple;
	bh=5GQS0hgVIB58yCk/VAwNP+YrHjx3Dp8JewskkuwySBg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cpAHc/WXvT8Yc1zg5JEzxOdSFSY/0ribsYpwfZWTAv8ZuXzNd0mJtnaXZIfKZJXfEt/p+BkSSokHoApFtrE6IvpU6Tryx/Nydwl4YJWehWtpObEaON9VAAI+i6ne3VUwaipYqrJvh4HuRZrNP/85IBNrgGuIvJEMWuXbXa77XTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=VZxKA98N; arc=fail smtp.client-ip=40.107.75.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="VZxKA98N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V81qtx1tKa5gMex7Jj6O3FBzQ00QfLQiJfNOM2hR77V0s85F1prJdaxlEbq2QbDE30U50/NnFWgQF1YYJnxA0EUNA6Xl83vZqpodT15JhbcxALtMZKRwybn0WxIuBgcFrH3TkSrU6AI5IUEkyErWtS7VdNq39GIo4o/u/Dtc1ETghSAh0I4Etkao8IeYazJLaiZIwrYdcdWENkkPLG+CL7ATddfcWPcau06I9R30lnPmWLHRi1sRlZimjON7nwoQu8+pZF8nWFkCZszqV/eYdIAvUcyEqVVuJTXpMrH318RNj+VXGwzfgrM8MnyzDvEI+UzU2DpaPTT6pF6vxdQSwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6k4HfIY+V2kRYdYXGuSYZ3r7LQJcbHBrxkCL2toEBgY=;
 b=JGeK8IirH3lIpMsOkor616/vfH/mYIpKpJAoaWE2Y0xqeaoZzUOto4BP6Bz/WkHmnccVrY7k4D/79TXP8MChsOIb5AoOeqPBYfmy+ap5lD8py1MgWx2yNP1kh70Pw396LltNl3Tlj2BKSuhYadLEYL/PkMIgqdJLV2lnolBh1/AsbxgyRJ8on4X4lbTiv+p4rtJec6km6iyXEngL3Kep1GUNioEXiVG88dSwCzTYE3YxZ6KLfV17S2a1KigRfuR9rxqiQlhyN9Awqf3hqFkiaokasUMyX3+FOPaQOk4yhZP1HMSkucDFQ43A9Cw6EIHRtVyEv5NcrJe+IiSpSpwFqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6k4HfIY+V2kRYdYXGuSYZ3r7LQJcbHBrxkCL2toEBgY=;
 b=VZxKA98N7pQQfPIv3XmUEyBR1peFiA3lQnJmVoEiLvFhbjDb7nboP/9hw8TMpPKwLeBBdKe75+yZxTnfqNH2TFNTuOqwD/shO+Luu5h6V0+1aneFyClnaXgAqYoYyqUk0PHBk3ec6j1uuPavDX1vfOkDYrRkOm41TTSgLX3xYehmv+13EdKixdskZcVKV06q+G6ZmBmYZ5ibtn5pHApJNVaQCYCn5wbrS5a5zYrcV6rsiTA5pBL7T2Fyle4ColH5gSAMe/0AHkhnz4USaQoWPdee97CSZGQdQW6wRLyjOHgVNHA4LwES2H3fPBwf2ITciKZz0zxVhJ1ICPBHc0Fs9g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KUXPR03MB9440.apcprd03.prod.outlook.com (2603:1096:d10:50::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 02:53:51 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 02:53:51 +0000
Message-ID: <38e15e7b-9986-43c0-bbc7-7ce78203b78e@amlogic.com>
Date: Tue, 13 Oct 2026 10:53:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma: amlogic: Fix little-endian variable operations issue
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20261012-fix-a9-dma-v1-1-2d83008f3e32@amlogic.com>
 <as0JRBU01QWrpwnj@SMW015318>
Content-Language: en-US
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <as0JRBU01QWrpwnj@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KUXPR03MB9440:EE_
X-MS-Office365-Filtering-Correlation-Id: 390adf28-274d-4c12-4827-08df28d53601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|6133799003|10067099003|22082099003|18002099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	WWvcNSqpEZlJHm9ytNtRTYy73l1XHTOkGi/NPFXKuTy8x5OgqntsdK8GMq1qVRy7CYBSfJFH0BZ+CqLoJzgLMd1vGAy35+YHboPbpr5NUqhGLoI3wCMw8pF6UmbaL3vy4xxaJOxKwbqPYBh5Q4cnwoVX4rQhnEEdTd1uJVZiurADqTofl+B+D/Zquchzba8/QD0Vb9gGvCIbfISo4QxzwY9mQTPBCEf3SfKuP4irBsy+rslxZPQQG/shzr9bp27rNwMDbpp4IWAgSbvUE/HO7hbpY2PPFhGxmCj1bo5MfsRlbYuOv84FDHmBRrxZpngdjMWhLytwjiOggNwYfT+xC2BkPYKVzuJT3FQP77hP1PNhRfc/j+4ryQtxMzr26unwZTG+IVdIsXEqO/6ddWGibGIjT4JqEzYIu8wCuXMdAHXpc89rL75tD0sBK9xEmTeiSiXHvOuZQD0I3eNHNn/ZqXc4B33KA1qG2QiGPwA1QifkzRPntRJKJZqUu4Eu0aEqn2HsPFYrp6b+ZFm0h6wcsQrFL5g1pHnp5S23Y5+20QjFuyqOU03VI+9a8QotX/UrGPpGLokmi8W51sImCZ710ixv/dVnTfVfh9hJPP5IROmmy54WiOdHLdWFSinbrpkg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zk5oT2ZmeDE3MjJIL1grNG14QUJ0MkhzaHNsV3JOZmI2SndhMnNoQ2pmQ2I3?=
 =?utf-8?B?K2VkOXVBcjJHbWJQSjlhMGc1dHc4NkIyL3BTa0tEUkVaUk0xSk1NTmYvcVMx?=
 =?utf-8?B?ZWhhTzFhVG9jdDVBZVlJcjFrdUJ5bDgzbHQ5Rmtuak9UdnRKb3dobm4xeGhp?=
 =?utf-8?B?VmVkdUVRM1FxL1Exa2ZOZWZWZjFIWXpoRGxtaTNGRWRUUkdmTHVUUVpOYW9p?=
 =?utf-8?B?bE9jdzRsaVdSWmpiNTN6YmNwSVNZeHhyOG9ZbUVWS1ZvbitQaWE2dkZtOXRq?=
 =?utf-8?B?bldsZXN4TTl4QldvM0phSi9LUFRKUXV1cmU3NmdLV0owcW90K2xDY3hqdkQy?=
 =?utf-8?B?Qy9Ib0VwbXpmZlVZaEQvcVJNMk9QblFQSFhXTDVyRUF4TVhkU2M2OXVjbmRQ?=
 =?utf-8?B?d0haYnMyd0lSd1oyVEpTZHZXRFRhLy8yQmxEelJ3QlpINEZIaVU1dXdhM1pV?=
 =?utf-8?B?N2FvV2Nldno1MFZzem1WMExUdW93L0VtZzgyRGJLUkw4YnpmSU55eEtWZUV6?=
 =?utf-8?B?TzFGWjBQUzZZZUpnWlpYVUZwQWRMK1M5c1VMS25nbG9wMFhJb1MyT01iaHlx?=
 =?utf-8?B?SHloOCs3SXpxYjlsanQ1dzZNbXNaUnU0N1kwWFpTVkRiVHVCdzJWSTdmUkRQ?=
 =?utf-8?B?SzVIMldjcWV4UXFJUlBBL2JSOTJLdWhQQTlLQlpyUWZYbmZuUlpDVmVVWXQr?=
 =?utf-8?B?VkJEU0toaDVzMXo1SUlEbUNITFJEMXk2Z0hSc1JLd0dyOG9JVzdvQ1ZrcXlK?=
 =?utf-8?B?aHVUa3pyQkVLRnRkTlFiRHdPbTFlZllUREdLMTFSbFRqUmtFcC9TZCtaeFlQ?=
 =?utf-8?B?OGpQdzl2MU1MM2F0ZnBJcHlZOG40S0VkWnk3Z1FnRDZlZTVNMHhjeXpsbUg2?=
 =?utf-8?B?OW8xOXpEMWZGait5ZGlkdjFYeFV6ZnRtbGo5Nk14bzdRdUZOOUlyb3JCbDhs?=
 =?utf-8?B?VHhwUUZHZ0JmUGFBdWZQYWxDL1VRejgwTlhvVituVStsdE1wSnd6UlFsQXFp?=
 =?utf-8?B?VU9HTkRBTXdiakpJeFhONFkxZzVVSWxQbVRKQ3IyU2hFejdzZGo0N0ZYZEdB?=
 =?utf-8?B?QnlBcFJ1WUN3eTFrb2lFa3pxV2dadjE1eXRPQUIyK3poV2hydGZVak9UUVBu?=
 =?utf-8?B?dUpvRkFHY2EyT2ttMDh4ZWZrUERFelpLVDBTOGpodldiTFgxWWhQSCt0T0ZW?=
 =?utf-8?B?ZHVNSXNwL0VHdzdkTnZpZ1dZcis5K1hsMGJnTXp4M0tCS2haK0xaU3dDbmVr?=
 =?utf-8?B?SmZOZlZOSzh6eFVqc3RVOXlVU0x1ZEVTZ01uR2pzNEZOUjNJVTk0SklBZDNv?=
 =?utf-8?B?QjlyaHF4dC90am5iSUVTL281Rkt1SkJ4ZGZxWFdacFdlMjczdkY4TFM3V0Js?=
 =?utf-8?B?TmhMeGZFb1dJSDlFaWRiM3dyUTZuTGpnOStqNjFzazQzMGJlOUdBRmtGbzNo?=
 =?utf-8?B?THBSNWJ4VjNXdEJZMDRJcnlHM05RLzZoeGw2dDBpb0c2TUxlSWRocG90ejY0?=
 =?utf-8?B?ZFUxd1poNllrNFBoeWRNYlFRQmcwNW9RT3ZZek0vZjY3OXZZbCs4MjJRMmg2?=
 =?utf-8?B?SnRvRGtIcnNGay82YmxjQzZPSGl5bWs0SlFVMU5xWTVUSDViSHFFNXpjZ254?=
 =?utf-8?B?SzBQOHlHSmFtK2VONFNwZTcrQjVQWFFYREpYTjBJME8rek1QS0NaNS9ycGU0?=
 =?utf-8?B?aTNnOHJsUTJmc0ovaDcvK2szZnFXaW1GcFJ5SmNsM3Rsd2FIUmE0MkxVb0N0?=
 =?utf-8?B?M0V4MHZia3dabW82V3lKT3M1cHFJV0FOM3FSVEVBY1lVS3I0ZWFlZVBIQXQ2?=
 =?utf-8?B?QWtHTzZWWVNHaXdSdVJjRnhQWnZROEQzUzh6MUlpZVpiWnJKQjN3anZPNEtX?=
 =?utf-8?B?b0VZeHp6eXJxSExnQnVkSmxGZDhYb0xZd3JyQ3pGZ1piYm5ieGVObzAxRjVD?=
 =?utf-8?B?MzhpdzA5SjZ2My9ENE5FU1NzNFY3b2tDN0hlV3E0MkZ0NjJJWUYxTFUrM2JX?=
 =?utf-8?B?cHA3S05DRGViM0VycU5TbFN1QTAweFVuMUlvYzN5MUthV3VSM3hrNENON3ZX?=
 =?utf-8?B?UUZTSmlFeDBHcHA5S2h4bHZ1NHpnM1lHZGtOMkVyMGpqWVhjZHAxWFVDMU9U?=
 =?utf-8?B?dEdQejVxWlZlOXdFR1I2QUE5cUlXWDkwRlE3UnlmbjdFUGJOSXdOY3lkUUMx?=
 =?utf-8?B?OWdBeC9QNFY1UjhrN3VWZXRGL2hUK3QycGZpY3RaVWMzU1R4cmNEYmJmUTlL?=
 =?utf-8?B?QmpGdE9XWjBMa2tHVW02V3dsMksyN29lTGZQRnJrOVVwWElPVGxhM2p0N3A3?=
 =?utf-8?B?N0NLNmFyU3hWYUFtb3BKUk15SnhUalBFNmtERDRNRFFuUFpKR0Vidz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 390adf28-274d-4c12-4827-08df28d53601
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 02:53:51.0845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sj3b2X7zpyR5EuF2mi2nDdRFlv4kh8S0pxkkmHPN5I6MO9J7N1Dj0tHtnbMRzuRTIeCFiK9SysQQX6N5N0Tz1T1fYyYhiTbg6oP8X3WevJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR03MB9440

Hi Frank,
    Thanks for your review.

On 2026/10/13 00:22, Frank Li wrote:
> [????????? frank.li@oss.nxp.com ????????? https://aka.ms/LearnAboutSenderIdentification?????????????]
> 
> [ EXTERNAL EMAIL ]
> 
> On Mon, Oct 12, 2026 at 08:00:20AM +0000, Xianwei Zhao via B4 Relay wrote:
>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>
> 
> Subject:
>          s/dma/dmaengine
> 
> 

Will do, I forgot it.

>> In dma_async_tx_descriptor function,fix the situation where the operation
>> processing of the little-endian variable requires corresponding conversion.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202610060235.PuCxWQdk-lkp@intel.com/
>> Fixes: b84b5197e344 ("dmaengine: amlogic: Add general DMA driver for A9")
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>> Fix the operation little-endian variable issue.
>> ---
>>   drivers/dma/amlogic-dma.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma/amlogic-dma.c b/drivers/dma/amlogic-dma.c
>> index 78ee2337ae71..bbf5ae5ac705 100644
>> --- a/drivers/dma/amlogic-dma.c
>> +++ b/drivers/dma/amlogic-dma.c
>> @@ -321,7 +321,7 @@ static struct dma_async_tx_descriptor *aml_dma_prep_slave_sg
>>
>>        /* the last sg set eoc flag */
>>        sg_link--;
>> -     sg_link->ctl |= LINK_EOC;
>> +     sg_link->ctl = cpu_to_le32(le32_to_cpu(sg_link->ctl) | LINK_EOC);
> 
> Does it works
> 
>          sg_link->ctl |= cpu_to_le32(LINK_EOC);
> 

Here it is equivalent. Will do.

> Frank
>>
>>        return vchan_tx_prep(&aml_chan->vchan, &aml_desc->vd, flags);
>>   }
>>
>> ---
>> base-commit: 42c31fec1ca76b8b5f7759def122d418dff2cd4b
>> change-id: 20261012-fix-a9-dma-4be7e61ba653
>>
>> Best regards,
>> --
>> Xianwei Zhao <xianwei.zhao@amlogic.com>
>>
>>
