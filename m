Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794983085;
	b=PQXlSw9JcWcieOKLriE/hnESI+FjT18vSeLSR8l+49BQGSLzqFJBNT+M2VlKDnibSdMa
	 FHJTnVgwlnBaEUk6tASshNzN6YiRhdJU/VtYSyilj8p/A3uLnPgOn84qsOFhRUWROEAWa
	 +uVYDpZG7tlvYHm+ILiEZXg5Nk29BbPnmj5BY+/OaQxYXC3qK++0Ke8riJNU7o62yrMEp
	 87HX3g6UEqrANUWHNG95F4hTCJanfH0RODXHzg5+e6YOkAWyxoHY4oCDQogQD8lM7eGyx
	 LfkXWGW0oqilY3OhhyL1jSr9u6/fQh1nQB3Fd1iF8twBNvCXF18iKuQeiQrR0g/SWJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983085;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Kk3Hn3DHlz1cPajRvCKocWJn+LgcjZzQ+PdSVfcHk+M=;
	b=P4mReBPRz5h6+rntYQtMc/+/FVjj5nlXcyamHO7IERQEbwrl7iOSHfN6hcKU4OsoT6fR
	 EJGp8FKuJp7gA3qjzJelP35vQPaZKoUpGnYFXTW8A2WB3aoBdgZYAP6mNpH3KK+j4lLND
	 9yTTwOSjdMQPnn+G9tRhdxzh0i+6nZdConT5j2YJwFrJdvswLOXZsCQhrSDqdq6ZoGiIV
	 qX7G03P4kgfJcT9axupUATXg70Rwp7Bz3xAxAebjroKI4s1Da88JBa92qIBFIdGYRycZH
	 g6htxHbVM9hQogQ2HPmZzNpD5rr+PAnOKfQZk/4zJfB4lGhIDHsuCNqAxVGTMfgAdxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XDsMkXyp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.17
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012017.outbound.protection.outlook.com [52.101.53.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E841606A32A;
	Wed, 18 Nov 2026 06:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E841606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XDsMkXyp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4cfJ8RDXsLlVeN47cgpPIr1MvyTCMGAnFawzypmRCkx5A+vnyHRMcW/SJlbcww+xjquqd6REs55KY0CQXyF5lYGUE0+sssdg2XWTygBy4pR7vKdfoZT7xzNzKHEH0KQZ2eBzht/LK7Gs7CkyonPKQlKnIvDoTA/bXe3mEnh/ABJ5sDZwlz9nHQ4q1Rt9sEkgoq2cFiF4HgL9i8O/h5eygwP6KkpLK6ixLuIBtnfGeNVii/u9kw0kPGHxl4DT2RjfsEmGdHvXeyYNf0q0bC9OdrZeXxL1d6sQI2gouZntVKTqGXpchNOvisNwmbgjIpte0B0tusZEyGZVwxUTG5kig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kk3Hn3DHlz1cPajRvCKocWJn+LgcjZzQ+PdSVfcHk+M=;
 b=N2kUXHQpVhXvvjgtZXiBomB1m1U1wbGmwvO62q3AdrCkM5ljq7KAO4YHe+Cm869GDpKQKwLSPBljl1XhdFwTobMz0vObDQaruc8tcrGCfdvPwkLmOwlPs6bzRHN09z8L+1MIz0liPPbj8VKl01JSFSMCKDz0NI3xMZp6JlQTfp/eyjCTgDew/sjAKUkpv0p7NAuSHKwArFn1fVXz6h/sRHaihEqDb9StYD0XZv1/v1N5kmsXEm9hjzCPEDwcOItBn3g9sQ4riizuLfX1urIRlfTN8ULwGDKOmRmXbwfDt6mnAsaHknKx4+y1Qw6dIDsSxhLBIyoizGwFNAi1JxrUew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kk3Hn3DHlz1cPajRvCKocWJn+LgcjZzQ+PdSVfcHk+M=;
 b=XDsMkXyp/2+MDb3jHaFxLoWosB6UWPOoFti9pxCvs7rqu0oLiIrMl04Z8xQzgU+lpe6eeZ7jb8D3LjfyODSHwkAp64b3Ux0Fc9QqbMOYR1aZBPoHD7B4QzM42SqNS66MoVNTV4mxwrhn4U4OS8GZ+NjVDOUz5nN3yQFMQU11Lv8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY8PR12MB7516.namprd12.prod.outlook.com (2603:10b6:930:94::9)
 by IA0PR12MB8862.namprd12.prod.outlook.com (2603:10b6:208:48e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 06:24:39 +0000
Received: from CY8PR12MB7516.namprd12.prod.outlook.com
 ([fe80::b6cb:7a8c:fe0f:b9cd]) by CY8PR12MB7516.namprd12.prod.outlook.com
 ([fe80::b6cb:7a8c:fe0f:b9cd%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 06:24:39 +0000
Message-ID: <5cbd17e2-f3ee-44a7-9a6d-bde4380520d7@amd.com>
Date: Wed, 18 Nov 2026 11:54:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] dmaengine: zynqmp_dma: Add per-channel reset
 support
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Harini Katakam <harini.katakam@amd.com>,
 Shyam Pandey <radhey.shyam.pandey@amd.com>, Abin Joseph
 <abin.joseph@amd.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 git@amd.com
References: <20261106-adma_per_channel_reset_v5-v5-0-f9990669362f@amd.com>
 <20261106-adma_per_channel_reset_v5-v5-4-f9990669362f@amd.com>
 <avtpSXEdyeWpghqd@SMW015318>
Content-Language: en-US
From: "Golla, Nagendra" <Nagendra.Golla@amd.com>
In-Reply-To: <avtpSXEdyeWpghqd@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::20) To CY8PR12MB7516.namprd12.prod.outlook.com
 (2603:10b6:930:94::9)
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
X-MS-TrafficTypeDiagnostic: CY8PR12MB7516:EE_|IA0PR12MB8862:EE_
X-MS-Office365-Filtering-Correlation-Id: 433f1427-1e49-40be-2b92-08df453c9f8a
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|10067099003|4143699003|56012099006|11063799006|261026140227099003|261026121527099003|261022075727099003|261021121427099003|261021123027099003|261022105027099003|261102123227099003|261028144727099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	3VoWxfLvAvBIKb2ft/J9msZDdC0jv4umbBvFDjkCOk+kws3uZ7cGc9iEEb8xGwBbLJKDIERRgg0gLyFqds9WH5jYc75BxjlKNxmuISJVlhuxsq51x1ySO9VgkgGwn1+OSgf7DygZBxkWmuk0csxVzVQEqCCvH1DoQYueKJaOfqAaoETuvrsWusBjxyWp6mSWxv0EHEd8QQfgv2XmcdC3yQpQB2DwHC/m9OKXenhmsuyvBfadQOUeHRrj5l0HGbVfODbWasYvgcB6aCMqyFqVQ9wuVQKLSQ3RPHD6Oq8FeP2HPhY9+MAVntdHYgaxJfxjL1T2btTGsK+IA5U7ZGFiB01fcJCD1KOUOYvSHOvnSctNRza6MW9iwCztc5VdFyvVYl7mXQnc6BAoqCP6DxWmJf6IKfbO314qgsYYTkYlXMKV75Ma4N81OcAs+mAUyLNTcemrOBqw5yaZ5Wpiaa2woh3/6EMK4m77KPI8EWZntczccn0QMJ5dbKqt+PtTwAVvVzZmHp4q6xud2Cr+nkCZ/irHNLc3RdKKHolTWQRBa9EFRRrLL/8jqwjGL0+eZt36xnoM11rMnUfJjI4IsSJiIg9iPlwK9lZPF/K6NsmPihO1tEHltVVumhPDRLkmFL8ZP333fvhBtroy99YhhHOISfKZAl0dK6kRRtHJdwSR8ig=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7516.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(261026140227099003)(261026121527099003)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261102123227099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q29pSy9PV21rTVJDM3E3SXFZUGNEcXRLZENtQi9LcndrVWM2Z2JINWVwdld2?=
 =?utf-8?B?MHJvd0pySVMvUktpM05aQjFrYUgxeUFySzFDRmlTWVg0dUc2K0ZxeEx2a2Vl?=
 =?utf-8?B?aWNKUUdmbkFnWFdTS21GdTdiZjhOVDNjUmN5aGRBeUMzaXozZTB2MVg3bUl0?=
 =?utf-8?B?dEU0Z3RFbm9ZRjlSUVZxaEkvcWhiVENMc3FNeGZaaEdWWmRjM2R3TUxTRnNp?=
 =?utf-8?B?ZVA3VHBwdVJ6TW9pdENBa0JFN1VZYStmK3NhNHVOcXJVMkx1bGtiSVVadXlt?=
 =?utf-8?B?aVFNazVTUXhFdnpiNlJDZjNGRWd2ZkVYamNuL3BFOGRBMGZFLzhaR2RSc3Bq?=
 =?utf-8?B?Mi8zS2pjWW1RZGxIVHFvcnRNV1h2eStiKzlMM2NFeHJ5dVdUeUJwSGxjTVFi?=
 =?utf-8?B?bTFJeUg0YVZMa3l6TzBsRFE5d3FkWUxBVHcwcFZtMHd2cGphM2RIUXh2allC?=
 =?utf-8?B?d3BkWXQxMXBMTmhqS3FQWVMwc2tOSnFQTlhXUWtYS0ZTN1dSVzgza01jbFI5?=
 =?utf-8?B?Q2RhcmRSU0FNT29iYW1xNm52clYrMDZ2dFFoOUcxK3ErZGtPRlpYQmg3OWlo?=
 =?utf-8?B?N2FHU2pkMjE2d29hSVNoWUs0c3QxMGJ6cWNUSTZiV2hsb1hwUGhlUldPak9I?=
 =?utf-8?B?TldiYUt6SkV0TFFpYjN0UGtjQS9SQkFzamU1Y0tOTlVMUmNWZHY3VDRoU0Ft?=
 =?utf-8?B?dHNKbWduSnBDZVg3Z2tsNVZ3QW4yeGNWcXg3c1Y4STFubjc4dW1HamNaaEU4?=
 =?utf-8?B?Qk1PL0F0SHlqRzRjaEdUejVreStSR1RtV0FnQzAvNzNIaWNmdFFvYWc0enNi?=
 =?utf-8?B?N0s5eU43bmsrcTlDdmsrNmQ2Vy82YUV0a0JNQkxRaENUV2xRNUhJYWdKcG41?=
 =?utf-8?B?TGtNNktxSWJRZzlrYk83ZUFsR3ZBQ09zcWp0bGc3MHdLTEEwU0hqZXZPVTZs?=
 =?utf-8?B?ZjJpeXJHc0JhOHJiTDU2a21SUGVtMHUyejVpOW44ZmhKa0hqMzZWcTRWekkz?=
 =?utf-8?B?VytxbGIwMzBydlZUSFlxUmVPV1dKNG9KVEFHQnNHQVZFbWZGZEV0KzhIOWU0?=
 =?utf-8?B?WGVFV3Y5Vm5jclR1YjZlbFI4ZnROOGNQL0h5a3EzOFZaakUzMGQyRTRJQ1ZC?=
 =?utf-8?B?Y1FDSGg3cFBYR0FXV3J3UVhMNXFGYXVsbXBZYXhlTkVFNVpCd2FJa0JQTzVC?=
 =?utf-8?B?Y3l6WFVuUnBzN1BUaUx1UEdkd09yUzRvcCttUU9HVVhXbTNBZzM3MjlTWDZz?=
 =?utf-8?B?VkFSeTNRT1NVT1MrUGNMdUt0VFl2T2dLSFgydklEYnMxd3pkTUJmcmxxMmVN?=
 =?utf-8?B?WkJneWw3S2cyUFJENnJySkFqcTlsNDNXcStKQWJ2SUlTYWxCWUVlZkN6L1Ri?=
 =?utf-8?B?TU9IeFdRUXZYajhHdTdFKzBlV3VTTTczL1lPNy9NQ0lldnF5bkNNcDBCRi82?=
 =?utf-8?B?YVY0ZWN1dlp3RnBNUUJBRWlWMWw4aHVCbXl1NjhFZGF2RlN2M1FVd3Zyeitn?=
 =?utf-8?B?c2R5dUlXVWd4OUFWN0hvVHVsNTh2eVlxSGRlK2tUUVVGalNzZGJOZis0WWo5?=
 =?utf-8?B?UGo4andReFNJZC9DMmh6MjhLemZCTHVPZDh5ZmhLSmgwZEdpS0NGcGJZeStB?=
 =?utf-8?B?RnF0ZkFwcWptUHR2NmVXMGhkNEtzRjdDdTd6dFFrMHhYY0FudW55MWNmQ29z?=
 =?utf-8?B?TVdYMi9NdnZVOVlWQ3lUV1ZuWHlsaE81dWxyZEprWnJYV2xuVkhrOE8wTC9Z?=
 =?utf-8?B?N3QzQW5FdGNYTXRHRHpldlUwUFM3STZuV05YbjFjUnFIOXpSdHRHYUZvaE5p?=
 =?utf-8?B?ei91ekFNNGJMTEpoR2VZODFhdkNJNHBaNE9veENmQXQ2Mk9qclFZeUZOZUJj?=
 =?utf-8?B?aWxrclV5WHJjZ0ZHR1hEUlBsdldJS3RMdlQ4bVBpSDNad1lOU1FETmROV1Vo?=
 =?utf-8?B?UmhKRG5UY0pYYzFlT3YrTmh1RTNxSkcwZXdBeDhJMlU4KzRBc0hCdGRCREpx?=
 =?utf-8?B?TGFPNWpEQkZmaC9qOEl3ZVVXd2F2bitrTFY3M29Qc2p6dVJCbldvYlVhYzM1?=
 =?utf-8?B?VWtPbU1abGRybkRCeFJ1bXRqbTBzeWhRanBvRnpwM1RIUktTbm9JR1BKU1NK?=
 =?utf-8?B?dmlFcmZ5bkd1VGx5QmJRbS9UU0dHci9zOHJCb0FMYndUQUd3Vkg1UllQaHhK?=
 =?utf-8?B?b0krRzBUNlhWcnBWYjFxU05yYXRqUEhKc092dzhtbDQ4aWlrWUxISzRxbDBz?=
 =?utf-8?B?Qzh2S0pBNnkyNS9DZjdLQXNQUWxNaU05NWVSWWhTc0F0SkxkVnNsMWh1bjE2?=
 =?utf-8?B?bGJDU2V6cW9ncXhxWlFxSHZKY0pXUTQ3M3ZSMFVJcjM3VW1FZ1F3UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 433f1427-1e49-40be-2b92-08df453c9f8a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7516.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 06:24:39.0866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gcbg9GcT7ssuQ8RJQwuVJMCiEFg0V27Kl7iOxiGWSmxblq21/RztUJznkDrQ5khtdsjZPwGcb704xfz8ylRIgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8862

Hi Frank,

On 11/17/2026 2:06 AM, Frank Li wrote:
> On Fri, Nov 06, 2026 at 03:40:26PM +0530, Golla Nagendra wrote:
>> Versal Gen2 and Versal Net expose a dedicated reset line per ZDMA
>> channel. Trigger a reset pulse during probe using device_reset().
>>
>> For Versal Net and Versal Gen2, reset is a required DT property, so
>> probe returns an error if the reset property is missing. For legacy
>> SoCs, the reset path is skipped.
>>
>> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
>> ---
>>   drivers/dma/xilinx/zynqmp_dma.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
>> index cb0eb13f9b05..12696fa44c66 100644
>> --- a/drivers/dma/xilinx/zynqmp_dma.c
>> +++ b/drivers/dma/xilinx/zynqmp_dma.c
>> @@ -19,6 +19,7 @@
>>   #include <linux/clk.h>
>>   #include <linux/io-64-nonatomic-lo-hi.h>
>>   #include <linux/pm_runtime.h>
>> +#include <linux/reset.h>
>>
>>   #include "../dmaengine.h"
>>
>> @@ -937,6 +938,14 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
>>   	if (IS_ERR(chan->regs))
>>   		return PTR_ERR(chan->regs);
>>
>> +	match_data = of_device_get_match_data(&pdev->dev);
>> +	if (match_data && match_data->has_reset) {
>> +		err = device_reset(&pdev->dev);
>> +		if (err)
>> +			return dev_err_probe(&pdev->dev, err,
>> +					     "failed to reset channel\n");
>> +	}
>> +
> 
> Use device_reset_optional() will simple code. Your binding already verify
> dts, needn't check again.

Thanks for the review

The binding schema restricts the resets property to Versal Gen2 and 
Versal Net, where it is required.

An unconditional device_reset_optional() does not enforce this required 
property for Versal Gen2 and Versal Net devices in alignment with the DT 
binding schema. If the required reset is missing, 
device_reset_optional() would allow the driver to continue probing.

Whereas, in the current approach, the match-data check limits reset 
handling to Versal Gen2 and Versal Net. Calling device_reset() for those 
compatibles enforces the required reset property and ensures that probe 
fails if the required reset is missing or cannot be applied, in 
alignment with the DT binding schema.

For legacy compatibles, the driver skips reset handling even if an old 
or unvalidated DTB contains an unexpected resets property.

Hence, we prefer the current approach. Could you please advise if you 
see any concerns?

Thanks,
Nagendra
> 
> Frank
> 
>>   	chan->bus_width = ZYNQMP_DMA_BUS_WIDTH_64;
>>   	chan->dst_burst_len = ZYNQMP_DMA_MAX_DST_BURST_LEN;
>>   	chan->src_burst_len = ZYNQMP_DMA_MAX_SRC_BURST_LEN;
>> @@ -952,7 +961,6 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
>>   		return -EINVAL;
>>   	}
>>
>> -	match_data = of_device_get_match_data(&pdev->dev);
>>   	if (match_data)
>>   		chan->irq_offset = match_data->offset;
>>
>>
>> --
>> 2.43.7
>>

