Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.114
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792981835;
	b=SvOmurF99QpwdPQL1IQeSTFjgcXVJWsONjxlNzmhyMNQkb3xIK3fF1qc+yF7fYaYKwTi
	 605UJ0nwm327oIO6boh5uAzWqGCf7lw1MOSOtpqpmLaIVIQ4LEeuv+yrQnI4rFLnhGTLg
	 tgoQmvvNA2Kuo2I6FVqHb0xIrRXDw2T+f4m9OkugkjJUoFop6r1kyRQU+DHiHNYtvYlCc
	 P69snSWCoJ9fmxg22wK+NwZzSycr3ZlzbqR3Qoe2BP7lIfuYi5xbc09gkQYDuHc+ngwvj
	 TVpjjFRhzP9jQwBl8Xf/U/1iitk/ex1vrqMhDyqpd77+3TDQRF6uI/2kcSbXYWWmWEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792981835;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=FH3Ct+2X3mVcCvl6jnlW9a400G8Re7jAmkrGWWNI0Dg=;
	b=huTYxQHsTo4Yr2YQ+uU37V8emWoakdiefEgHRFV7V7xD4wEr0Tl7UgeU0yupNhIgy/tn
	 3Zo1fFFW1K7/h3KL2DI/NNraoX4ODOXZC/9BGRRjO0oaza4W78zrYhqfipD3xY8maeYWJ
	 m1cgY2nHfyveHu/W649bjESpRZvlN5tB8hewSXzTRQgxG+9eIhDFFHXn/oX975foXOB5J
	 bSotufQ5KPkf6BElaKLJrSbr9E29oO2tMyhxnfIqpdnW2oJyoUK+McxCSPmoleCnx7ukt
	 0al8PY4aSVw3veeBW5uHmkf55cFFf2GCJhytmCoowey9iWIjhfypAUayzvPvuD2Al7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=XKsSOn5A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.114
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022114.outbound.protection.outlook.com [52.101.126.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AE1606A31A;
	Mon, 26 Oct 2026 02:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80AE1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=XKsSOn5A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=msbvIrc6YLv6RaZ11yKHdkSO26wn8/tc4e9VlFTgRPhYYVmKnIEjPB6XlBXrQaYKszV6Z/aU+Q6diSRgErzortmXqdD2V7jRXEubAp6bczKtbamB287evpUe0AEVKKRICrbsnhuwsDbWVwO3kv6hCfLCeQbUz5m/OKGLHlA3CV7HOGN7GMNDpkVb0mIRtkiK9jMsb5ixis1aK2k9UKSWORgAdkk0Jx1aUmFz8k6fccFvJfvbBwmEj0ARDvzf0E/E9FG8hSgQYMAIDHmjzSA9sQoMovKKtjZU3gVhVYduVoqDjHt81YAuDH9OYi8uuE6rZYaDsNg1Y66TJyxNNLAZiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FH3Ct+2X3mVcCvl6jnlW9a400G8Re7jAmkrGWWNI0Dg=;
 b=PFl0m42xyGXF4SjNFARPNttbDTGx02XfxC3kZkiU3vXpO8kEIgnr5wWYvAWlzEfCsAwLPI200MjTuYHnozaDvTiRIPwlzUEjvExXWc9wEycOUhgUqgGUWU2RsGvzlnMyLIf4gMiTAt5YvLjOzEXWme/E0ujPEi20dTBb0P5d3KcKKBIQpQa2ZCWZUJEY9aF4DiLYL/NiuGHDMxEOmMpWhgIQ11A7PiD4ZwEj0rHY6p2nIiff9v46VMtb6cIU7V2vWrOwQc92lmsl7Ppd3q2TJlr8kZ+9xJ9Z0dMvOTfX+Ewjc7zuIz8x9gcmi69mJqk/PI4YcmWnLauBcsFtjjLcZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FH3Ct+2X3mVcCvl6jnlW9a400G8Re7jAmkrGWWNI0Dg=;
 b=XKsSOn5AsAnObR0MCjnLPVccHNhYcTpN4mJnx3NhzVz/xy4PSN/yxqWlqVAN2il6c6nzVgFHAYnIVZQ4MSZH2wJ2WwCMkmxY3bYcmD1vUjHkzoN2ma6U/Ofl6OLj9yyBS10T4bv36/0vVKkjZYqK/Dsff/EmThzsWjEFjfYHayUADtWNgloBT9xBojKDzq1aEEj56nL66YZXLb9HtN3VCOlp5FzywVW5N+qBbtA8Pq4hqJ3CyidVDQDzAa6kQhY4qg5/uo/AWqFClHfWsKgJNIUFG8SwN/j64Gt6lCj89fVSJXTa35UOBCpTvcok/NvVOOUCjetHj146XxfHXmGxJw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KUZPR03MB9443.apcprd03.prod.outlook.com (2603:1096:d10:44::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 02:30:31 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 02:30:30 +0000
Message-ID: <d12ba4c2-cf68-4710-a9e7-42abeabb601d@amlogic.com>
Date: Mon, 26 Oct 2026 10:30:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: amlogic: fix workqueque not free when probe
 failed
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, dmaengine@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Frank Li <Frank.Li@kernel.org>,
 Vinod Koul <vkoul@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>
References: <20261023-fix-a9-dma-wq-v1-1-b414de837e6e@amlogic.com>
 <ad468ad8-c7d2-4737-ac43-827fe02aec04@web.de>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <ad468ad8-c7d2-4737-ac43-827fe02aec04@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KUZPR03MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: 62012e57-5d19-4c27-fff9-08df33091aaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261009223027099003|261022105027099003|260925022911599003|260925021911599003|260925021311599003|10067099003|56012099006|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Zof6T3DQ5iKIa/5FvVKv06JeZ2BLRnFXPURr9n5iwTHPoqAgYWJ4Nk+Sq3ke0fj0k2nHFZEZXnT9Xefd/iB+1YgKnjbRxRgdnguFM6Kpd+dZlwrjD0AKHTts+oj6J6Fd4FsaLYuK+Qu+AVDlOWve1Cft/t5FCNf3iRrurUygls7iaPCOPypgDkb/IXRdsc2uE4h/NN001WKTDw4Qx53FPpP7M6+lLT+sld4q3n9DrDd8jdVdqY9bKVfRWohtN57P4FRvUBuPn9gYNUA2sLlb84F6CluLjhLsCfPUjriv8WHj3wTR8/Nkwww0g/pilpy5o65NicQUop2nb5dQazSYx6x1N5soCXxFk5zjtQW9IAjWOdUSa0Ih43bNPxuXMX6J/RPRP5WLepI7uiO3IR2LtRvSk8t6bQWj1QxuV8B+ah2Ucca3cn3EecvCzaawkm1DtTT87ZGE/eo+ryg3R3C3deABwso9SagWSJyv56koMzs7mWDEeCJo1Mp0AFKZHuIhPq/RoucI69JO5nLOiLV6ZoJsbbYN79XKRmJ9jOR1H4ecTbyY2VxSxEd++Gk+m8wZ8qYOk9+aYajNh1PAPXBKrd6uqE2+7h1OTlkvT3C4HyLHAQpocV5jJSfjDS0euQz0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261009223027099003)(261022105027099003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDBkcXVicFZESlp2WG90NlpjRTE5WnU0bzBQRy9oZ3BLMHc5VGVYSlBRdXRv?=
 =?utf-8?B?aDVDdHVyL1djQVJ2QnBLMGI5akhnZjd5TUpkUlVVcXhWNWl6ZzdMMXhEaHRw?=
 =?utf-8?B?MklCVm4yTnJPWkJTZ3RYRy9ySWlWWVI1cG93Yms5b2FXTEdhbStZUnJoalNW?=
 =?utf-8?B?cUVxVEhQbXdEZ1FObmhJdTY5cTJjelk5ZmMwQ3p5SC9hd1c5RldHWFBQblhl?=
 =?utf-8?B?cDVQNlk1UC8zcjZSVzhUbEMvTU1BQUFUTytuVzhUZ3lNaHFUanE5TlU5Q0Fq?=
 =?utf-8?B?L2RMOVRBWnZhWXk0L2tsL0QzbTYyR1JPREhvM1g2cmJZaVhTVVBxS1JmR0ND?=
 =?utf-8?B?QVYyY0JITGFhdEZhelhXMnlaVEVNZ0h1WUN5b2JicHdRV0MvbUVESEEvalJt?=
 =?utf-8?B?YkxRQ0NaWWNuK0Y5SG8xd0FPRnlubFlFMTBxcHZTMWVqcU00bE9qb1VaQlpD?=
 =?utf-8?B?ckc1aUFhU3U2WkJ4NUhoWVU1WmVrSXgvVG13TGpsTEg1bEdNcXBlbjZLZzZr?=
 =?utf-8?B?QUFmRFliS0Q0eGExaDl6cmYvL2RaaDR6ZXNRSWwvcG9NQzBTUTYxbTBBOEhi?=
 =?utf-8?B?L1hXWDdNaHd4Qm5xaXY5SUZhRXFIeGwvQ3FpenkvM1ZiSUNoazRON2J2Yzln?=
 =?utf-8?B?TTV6aWJNeEt0S0FyTEFNZmJUMlYrdUtTemg3clBLV0hqUW9IUGFTY3hRWXM5?=
 =?utf-8?B?Z2FJRjBpbFpBRmN4VU5qMlV1cjNJODlHcW5NNS9uYkVNQ2tsZGh2MWVvRjhx?=
 =?utf-8?B?T29jYUJsZitkMDFobWFEZktmU3BWY1MwRHMyQjVYQXV0M01GQnd5NFhYeXQv?=
 =?utf-8?B?UTFWSTQzRGtvYmhVSDVpaUtXR0k2U3pXbEc0NTZMa1RtTTBaOHc0NnNJZnE2?=
 =?utf-8?B?S05IRWRQZVloYXZjUHNDS3V2TFJJdWlJdWFjTXUrZHg2eW9aOFc2TE5LWDN6?=
 =?utf-8?B?bjNmNjcxMWE1UTFLQi9GRnR1Qm0xR3V2U1Jhb1pIamQ3ZUtKZU9wRzYrVEJM?=
 =?utf-8?B?MVA1anV0bFd0R1c1M3RaV3A2clJ4SG9lUitqdGxBZXJKdFY3dlhiTkoxYlRv?=
 =?utf-8?B?aDR0L2Vyem1yam83b29McVUyZ0JNSHBibjlEaG9JZEdSd3NRLzdOSkNQek1H?=
 =?utf-8?B?blZiSHNROWR2RmIyMU16aTRiN2lGcWRiOFU2bFVWcnBCdDZtOHd4Mnllcm1v?=
 =?utf-8?B?czVZeDA0TUVveWlLSW4wZVU3UXJ6bWErWXd3dTVxdVZ6aytwYWtaMU9tT21Z?=
 =?utf-8?B?OENNOWdxWWgxOVBOcFZmZzYwVk9ORjNVQTJnR1U3VHhReVUyMU1tcXRUb1Vp?=
 =?utf-8?B?RXB3bkxKR3FwSGFqNEIxV1dka1BDRTN0UDBqd09GTGg3OFdZSDBsZDJqazhM?=
 =?utf-8?B?VDBNN0pYNUFKVFFIcFRCbXBqK01EaEZJcG1QWThRSkI1SGlsenR5WTFDMVE0?=
 =?utf-8?B?N1MzMFZrNEhBcGgvVnByWjJkbU5YMjlCSEFpQzJKNlJNcmR6Q2d3YmV5cFd6?=
 =?utf-8?B?Mk56aUs0eWZ2b1JGMFB5TnhEcTUvenpSc1JiRGw4d0pVSW9HTEVqenl5aWJ4?=
 =?utf-8?B?Z2lLUWwvSSs5anVHUVd3aGludkcydlhhd1dSZUliTm1RWWN2SVVQUWlSYWV4?=
 =?utf-8?B?bmpXbWRYb0todThNWldxZVJUV2VzVGJxcHplNHZxUjdEVWw3QXVnOGVVN1ZE?=
 =?utf-8?B?blptczZtVFlUaGpzYTFHVE5XYnFlM2FkejgxKzBuZVBFR0llTWxIOUV2TmF2?=
 =?utf-8?B?MC9ldzEwOVgwS1ZYUDZ4NlpLckpnaWlSZnZaZTl0K1RiUE4rWFI4VTk4VU9W?=
 =?utf-8?B?b3haUG9tWUduWGhEdXZyWDNCVDJpNkE2Tms2WTFvWlBGejlrbjNKcjZjOUgw?=
 =?utf-8?B?OEM5MUd1N0pBb0R4Q2dJZTJ2YnFUYWtDaVZ1VlArdnByOEpmc0d6NzRoWEtO?=
 =?utf-8?B?NUphdXVld1A0NkhnbE0wR1RtaEJJcmpUMXZ0L21SZnB4VFZPeEV2eEtoM0Jq?=
 =?utf-8?B?dTZYZjRpUGFjT0hFbFZoRFRNS0w1d0EyeUd0Y0lybGVEM3YzZGZtTzF5ZlFE?=
 =?utf-8?B?L2g3N21GWFhwc3pGc1ZQa1c0NmZ1WVBhVjVvVnZtSVZqcGZGaDhYLzVtTW5F?=
 =?utf-8?B?VEtyUmRQWHVlYzN4dkwwdFJQSVU5azkySHRkNlBwbmFFdkVMTlFlRXhqWkxY?=
 =?utf-8?B?Q3N1Q0VKRE51UTBDRTBqMytHdDhjR1RDbEVPa2p6NjZscWVVNUJ2akdOMElF?=
 =?utf-8?B?dFluejI5MHFycTN1ZDh5RUtGbEx4ckV4c2hyYW9EbnlVdlVldjZ3bml2TkNN?=
 =?utf-8?B?QXJJVVcveW4wMnhoZmR3ZXhrQkxOdEhWSWRkOTlCUkZMbUUzdEV1QT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62012e57-5d19-4c27-fff9-08df33091aaa
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 02:30:30.8038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zqNf60Ck3XznW7ip5ep4EcJpilXqAwE3VoiHI1OzqKka4m+s2uZebtA5XXOVc+8rvXNajiwp+U4QqzPYGhOWeEeoHuLaKdQglg4yhuKGPok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9443

Hi Markus,
    Sorry, I didn't notice the submission you sent. I will drop my 
submission.

On 2026/10/25 15:05, Markus Elfring wrote:
>> when probe failed, workqueue not free. Convert the driver to use
> …
> 
> I find this wording approach improvable.
> 
> See also:
> [PATCH v2] dmaengine: amlogic: Fix missing destroy_workqueue() at error path in aml_dma_probe()
> https://lore.kernel.org/dmaengine/13a835b1770e360af7991bb4c91ce52a8d01e331.1792785154.git.christophe.jaillet@wanadoo.fr/
> 
> Regards,
> Markus
