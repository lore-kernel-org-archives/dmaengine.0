Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794676156;
	b=McbCdr9pqYck1k5rvYUXXdkBpaaPOJCv2Wf+NcSPbfbePwM6KWxOTLbk8iTjTc6vyWyn
	 xnNgV3euFlljwF7djbwcmw90Urf2sZPLKLHdE73+Vg3NhJKeSPXEA2r5xRAD33QOlAT51
	 gRWy7vlD6/mU/QtHZMQdqPJpSbccEURqmpu4MVwNi2mqZkipxrUDQS26RYWZj37V4G9Qq
	 q0yyQ5SzZhH2VyNEFwLE5kL4wewpNqodaZYHAtaLzl3N1AHOop0kevSAjsr06kB1tokzR
	 S+cZe5Om0iGCCo3+n7xowLsnXoE9W7xzhXQ3gwjaNIy+US8GH414QwWqVo6kVwVCukQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676156;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
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
	bh=yfkDiG1L9UOVV+cVY8MEjVeaPPFvY7ZgjkvfZnK/Azc=;
	b=sYRfvEPQbjkYoYwhuo9KBpOFAnT4gb4sbFQIrFH20h6mJ8f5TJcOxsdB7VW3wKr1x20/
	 svzQjSInyEaulbS6CHleuyXMMCbOz94XAqf3nxX6U6HGX83HRk5gDvW4Z9U0Q+ggPhMyK
	 0bDd3yBW2Hgp9e5gpPGXmP5fmv1s6lkHEq6aeRsivTEjx1XTCYuXVTf8K4PeCGw0A/T6P
	 PyxdUzRjXMlTzcUFbgayuc/AyF9AOSOVRt6L63cVKk/edNxdM+XGyPi4C0Sd2edR5djQJ
	 WIkWVktNOXMLEI83Uc4WBc+mW49qEqdO7yBakiUyL851G+SCjk8jlFWQekjQqFd3qSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gIl90xRu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.27
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013027.outbound.protection.outlook.com [40.107.201.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C259606A331;
	Sat, 14 Nov 2026 17:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C259606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gIl90xRu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjm93BcycDwGDXI2ReboMk9Lz47FwtdOH+dFPz/m048vIecIoKbD1VUx7/MvS9SdsQOKEdTf5h4Qheda0QU5NJFTnZq1BlH1TY810yi6H2clQev4uySdKWasr2WKeA6zjbdqbf3q5eUS0CZkarN4kZB8QyKKRaXHemvdLXyZwY3Xi3xU33KQ2RGUSiFpHrkzl5aSJbjMIZzdYOVntHDBRVW1whsAtivoewjtvBnuBrAJtyj09Ttpq12pVeZGQpFSNQAnOBERaZIWqYVTh4MwFwjSI2+OK8dq+exT5LziCEGfghcThMD5WGfCBXFt8TkTlaSm+SRLpPUgELT4pgNC1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfkDiG1L9UOVV+cVY8MEjVeaPPFvY7ZgjkvfZnK/Azc=;
 b=R5xEjNxcgdbJfzMV2DMLpJorTRc97hkrTj4Ss0nqYfzEfyGNhxGqlNIydOPa5GN5UequREIFbAlseVSj/uzEuMJbOeZOqpXj8IypLsSLxQMBXQ8U3YJIej39U3WU45PqJpj9u7qXvvEtf9HA4jh+bMOuhfpjLCBNRhmG/Um9gsTahjPGN97M/Z/MabyOTnPr6QPho/q0paQobszK8UCP1Gygf1P1wFglgzxGJVij9rzvUnz3NNxF33q/ssPGp5z8F0AgrcPZFwyuJRFNgx98n8wTsqcLOJW37mogSHj+qVnZl8R0ha6coBxG0UpqOGO4xm7buldIQm9bvcRgvD3wZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfkDiG1L9UOVV+cVY8MEjVeaPPFvY7ZgjkvfZnK/Azc=;
 b=gIl90xRuBq74qboKo1/lTL+U6vf1HVSYzR9WO6qdZxuJtHMQbXzT0sswSfQ+5kqoKeVyoOOHpGWqk770EonPB5gArb+e5coFktQGq/sdD0ykQ9LboB8/NPkAF4sZc5fYyaP4xz1EtXZm2NJomkwIlNi4XrPSXMAaPOgxpku6lwY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB8156.namprd12.prod.outlook.com (2603:10b6:510:2b5::10)
 by MN2PR12MB4141.namprd12.prod.outlook.com (2603:10b6:208:1d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Sat, 14 Nov
 2026 17:08:03 +0000
Received: from PH7PR12MB8156.namprd12.prod.outlook.com
 ([fe80::770:345e:ed50:cb0d]) by PH7PR12MB8156.namprd12.prod.outlook.com
 ([fe80::770:345e:ed50:cb0d%6]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 17:08:03 +0000
Message-ID: <40e4f0dd-b688-4d45-a48f-13f96232f1e3@amd.com>
Date: Sat, 14 Nov 2026 22:37:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add entry for Xilinx AXI DMA driver
To: Suraj Gupta <suraj.gupta2@amd.com>, Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261112174613.2101876-1-suraj.gupta2@amd.com>
Content-Language: en-US
From: "Neeli, Srinivas" <srneeli@amd.com>
In-Reply-To: <20261112174613.2101876-1-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0132.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::15) To PH7PR12MB8156.namprd12.prod.outlook.com
 (2603:10b6:510:2b5::10)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB8156:EE_|MN2PR12MB4141:EE_
X-MS-Office365-Filtering-Correlation-Id: c447b5c2-a2bb-4439-3a6c-08df4271d7b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|261026140227099003|11063799006|261026121527099003|261009223027099003|261021121427099003|261022105027099003|261102123227099003|56012099006|261028144727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UO3k9dAj+3npvKqRKZd4aYlcr3sVonriuPFrXaRUHlpNbqKqjAIZ+w7TbVXcs1BJ+fREZAknGVaUsrQmcR4B3q6lU3y+g5ua0fUk3n+Xn6NY5hndHDUrEKPfpQQS3p7aDhLBCRu0RKRLNDZWbbQgogKXeaTn6Bnq6N+1o+x/1QXcgAq4kh7NIts1c4M8kDTJw5W8RkyowbpKiTUrps17bwvLVZ6GOkEeR32H8EfvChZPjrHHF5eA+RyilshTsBSNlEDyyw4Vg8vjuZ84vJtNjVfHRtoqKP6pOOAAFNotbDTOJic4UW1IB2EHAq7EoqOTdZiWrty6LWOPKnkdXhN2ebL+AHty54Lw5R/kZ7dg4XT0CZi7KHfQkYMYJ/UUQxRsU36km6U60mEoB6es7huUCO5hwjP29H/LDC7gbJbRZDacIaMh65rHkMOJz+1u4gcf4JANYtN7KEZTCQZCTOTBVCx6clMqGF/D+ofSBdMtCv4DZRTZE/+/bp+YTXMe1uGzN/kvzZpybYIkFLVIrQtYnbGpDoJgAlz4byNd2/RJWoFH+tpFtRUY575nAVgF3neu9MVZXuijPHEPCCxf0vX6r3txc1/8QkxvDwCwkiUSfpWaUiUjLBGcP7VtQqpiNapVRarRs/CPzYxfa6ZRjTMSdZDJ9Sp1P6pWnLimq0ymAZA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8156.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261026140227099003)(11063799006)(261026121527099003)(261009223027099003)(261021121427099003)(261022105027099003)(261102123227099003)(56012099006)(261028144727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmRucHY5ay9ZVW5PaGdjOVYxVGVhdnRsUmI2ME90QVVyU0Zxdk5vbzMzNzRl?=
 =?utf-8?B?SWlHK1I2TWJKdmVnK1pyNi9ibXhNa2IxVkJoWU1kUHg4amJ2UGpVVUlmQU16?=
 =?utf-8?B?Qis5SGlTeFFoK3p3RW9qMTlrZnhZQXRtNHdHemdiY1VmRSsycXJvcWRqbXJO?=
 =?utf-8?B?ektLYktMUFRicktmRFVCdkM0d0dHSlA3anpFRGREcTY2aDZnSlYvYkhzWmxP?=
 =?utf-8?B?TzBIdUtiekFDanNjdDkrbllHemhIQitENTRkYndQSnpjQmNEMG4vYWFtWFlJ?=
 =?utf-8?B?cWFuTDRQVFNQTFIzVmhjU0FVOHR2djQyTldaVk12UWhNa1hxRy93MVZuMjc2?=
 =?utf-8?B?SXNtWDZ5emFDSk8vVGtnZkJwK1ExNkc2a3pEbUMwSVYzdG5oMGJtdncwZk9j?=
 =?utf-8?B?TGExVFZBWkUzRDlnNk15V2tmVDJXOGtIcVZDa3N6aDYvbXBYNmlrVWh4bUNj?=
 =?utf-8?B?SFRTOGtMSTA5c1ZDUll3bW5PcnJrMkFZNUhJaEVtMVBrMi9oM0ppRlE3NGF1?=
 =?utf-8?B?dGpMUjdVVFhUb3UxM1JEalRyTlN3VDdmMXYzSHI2dm5iZG5mREVUcWNUQjhl?=
 =?utf-8?B?djdyaDc4Nlk2NitXajg1MmpWUFB0ZE5qUndjUHpiWXNKQVh1azVUNU5XMmR4?=
 =?utf-8?B?SmVkZlZwNVhjMGw2NkZyMVhUSDBoTXVjL2RuVExuVVNWc1FoK0RZYzNhMFVL?=
 =?utf-8?B?TnkvZ3RyOEFHRjVCSnJIMTEwNllta25tcDJjL3IwWGlPYTFvSTJrc0dkQkVx?=
 =?utf-8?B?dGNRRlRvYTJpZDZ4M0ZvV3pUZWJjblJpNHorQWM3TEY1VEg4enV6THgvK2lW?=
 =?utf-8?B?ZmtWNmsvRUZoc0Y0b2JJQ0l3RkVOZm9aSnhZVVg1K3RlM0dlMXV5T0dRbVhY?=
 =?utf-8?B?TGpVbjM0dzBoUTQ2TmNXR2RBTVZhd2FnNTN5UlhQQ0ZCMWhKOExlTE1KYzR3?=
 =?utf-8?B?QmJ1QVJEQXo1OU9HZ2JJa3JaY3JVdXg0anZzVitwWjZzWjRvbWMxS1BJcUI0?=
 =?utf-8?B?SnQ2Tkl2eHlmakZ1RFRuQjNSU0x3Q1dOak1pdCttV0JmV3JmdVR6YlJDaW1D?=
 =?utf-8?B?dVZEYW4rQlByRjNxL2hjdHhPZm51OXFLOUhSR0hUaDJWY1pMN3ZrRlZ4MHJ4?=
 =?utf-8?B?N0FQT3J4ZXEwaWp3OUNEUkFNWTY0cG5ZVWtGYVBscUNOSHlxL0RkaXNlMDRz?=
 =?utf-8?B?cDdVK25yd0M4OFRzN3hBVnQ1cTNRYytray9ScTlOR2dWcWNGWXR6ay9qZ0I3?=
 =?utf-8?B?Wkk3cVZacEpSalJuTlhINmxKK2gzSWdIWW9GMTNkclhIejRkNHlYK28vVDVi?=
 =?utf-8?B?NnFwVXZsTXdqVzYyMjR0MDVPK09MQ01Rc3RBbDdwTnd2d2k0THlLbDZlMmV4?=
 =?utf-8?B?eHl0RVc2a25BSWtCcktQZUs4WndEUllzR3R0MFVLbkhuOGpXb2VVK1hid0xI?=
 =?utf-8?B?aUZxMHVRNThDZGVnY2t2OEhsTTliWk8rUUZhUjFBcnl5bUg2cmNsYldmSVFq?=
 =?utf-8?B?MTRVc1JROGdWWWM2bUV2NldDTWhtdUtBZHh0UFJ0SlVXS2l3V2hBZEpVNXZB?=
 =?utf-8?B?eG5oLzRkUjltWWNXMXc2TU16Ukx4TGZ0QTRGSE5ra0tuODhTR2hib3VjWitu?=
 =?utf-8?B?cWZ5K001UHc4ZGNUdFJVT1lJNWVMM0pzRUNiOWtTVUpEU2kyL2FDYU5sZDZq?=
 =?utf-8?B?U2o4d3pxeGttOUY0eEdwdjVmdnZzOERrQ3hnNjM1eVFvVDRpenVHY2FVUVRx?=
 =?utf-8?B?ME5lWWkzNWFZYXNuL25wVDNVUFh3MWwyMXplcVhiOW1FdWQzZTVnRDJ0dko0?=
 =?utf-8?B?Sm4vUTVTN1A4RFF4SHdNRG5jWlFiZE5maXN6TkROa0ZVaWJUblhZVHZ0NWtI?=
 =?utf-8?B?ZzF2NXRYcmxmWEdLQ0VMS0VzNEJPSmI1VFA0YWNYMTlsVXJMK1dJMTgxRGtz?=
 =?utf-8?B?dXRrZDl2dlNhdVRQM2N2MUtFSlcvblpaWVJBMjZocTgwZlpMcGdVNUFPMGxy?=
 =?utf-8?B?ZVdzWlpDWUtud2Zwek4vbklOU3JnQzJMYUEvNVIxak5xMkFQWnhBOGNuOFJy?=
 =?utf-8?B?OHFOeTM5WVlOd0VmRlAwTS93YlN0Zkw5K09hVlBHcm1xRHVyUld2Um0ySmtv?=
 =?utf-8?B?dGk0QVkxVHFYcExmaGdJd05CT2Qyc1NoWVFONWZHTkNEbEVNc1ZHeW9WU2VO?=
 =?utf-8?B?SzdRaUlnbEZ3cFNuSyszUVlqS2ptSXIvZ3FPbGVrd0pNa1RpMlZMT2MvRnpp?=
 =?utf-8?B?aEttNSs5WHFuakQyUTBVVFE1WFBpaG1qNXFCcUZaemRSaXJWcExxWmtJdVBK?=
 =?utf-8?Q?0SrAj/sgCkuQGBxyNs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c447b5c2-a2bb-4439-3a6c-08df4271d7b3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8156.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 17:08:02.9262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6pgWu0N5/gvP9uqKg2sXHJK5Qb/x05/vk1TqNXLutKS+l4x/v6Llax3ZozdbPXT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4141

Hi,

On 11/12/2026 11:16 PM, Suraj Gupta wrote:
> The Xilinx AXI DMA driver, which supports the AXI DMA, AXI CDMA, AXI
> VDMA and AXI MCDMA IPs, has no MAINTAINERS entry, so patches touching it
> are only picked up by the dmaengine subsystem catch-all.
>
> Add an entry covering the driver, its binding and its header, with
> Srinivas Neeli and myself as maintainers.
>
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
Acked-by: Srinivas Neeli <srinivas.neeli@amd.com>

Thanks
Srinivas Neeli
> ---
>   MAINTAINERS | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..8f75c8cb6acf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -30611,6 +30611,15 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
>   F:	drivers/iio/adc/xilinx-ams.c
>   
> +XILINX AXI DMA DRIVER
> +M:	Suraj Gupta <suraj.gupta2@amd.com>
> +M:	Srinivas Neeli <srinivas.neeli@amd.com>
> +L:	dmaengine@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/dma/xilinx/xlnx,axi-dma.yaml
> +F:	drivers/dma/xilinx/xilinx_dma.c
> +F:	include/linux/dma/xilinx_dma.h
> +
>   XILINX AXI ETHERNET DRIVER
>   M:	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>   S:	Maintained

