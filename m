Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794283769;
	b=CnH/lTVGCTApu7NXI3BTeEZPXZlaFu+mz+zZLS5qT8XXqyBBa1TxTOkmU2Lzh/lNpmod
	 mPhXOJ4BKWRIpERRMNLej3QS/vVx/b3JxC1rmw/dKFh4aT8FhVDiWUSceOlgAt5uB3Cys
	 nPkpj+YFnymSSkTPE0ItJmaeabnYCzPT43tikBfx4MnHk7AkqPnFPkhDGuw+La1QMFiKC
	 8ymo6VHa+r+1MeQmKq3E7c80N6L6nbQWHOfO2t8q1IEes6ycU5ZDCei8LQrR2CibezQ9j
	 voaELeDGaYd3X4PYLAANPAH8tudvvfjBT/59tRqSZ/8YaPVEvg+ADbMlnfah/2vbh4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283769;
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
	bh=GHaRvOFqO5t6zE55sl155ofuDsWG3CQlOv9tkNhCBj8=;
	b=CNkAvYiljzCmZ/kYM0d+UjVMIU/0h7D2W+gsXZAmM3p4GOjrlg1Dq7TuTE/e76myLbzt
	 aOfSaaNfGoHwjn7yOpGM8PeAYD6L6UpaXoYhSVH0CR0odgtsHOxmoMIQloSx+LyVv6/Lk
	 RWiO+zChh/NQ6vmeTvZRqT9qMRWIevDCBurr8G3kqfuYCxPGxjq6TMzTUckCgcQik8LIf
	 XGeQThHOZvO60lW119csMoTqFFLUqF5/HjPSGN97i7QwdhLlDDQqwAJgxgOfuL0AWbu0/
	 n1KMViYOYff9rRAyaXeFxSAhS9WTMh3jzwSuuiNjXPIdbd/RO8ZHvIhutyJGIdeBC7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wbEtQZr8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.62
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011062.outbound.protection.outlook.com [52.101.52.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460DA606A31C;
	Tue, 10 Nov 2026 04:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 460DA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wbEtQZr8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wi5snCLLyoYgm3bRvT4vq5EHfYZElM90gMTXmz1NcBl6bswdM73nLpx1B15TEU05jkTMbzRoOQxBPPHbXVLyWdfnucwTTf+hUfOLMbuz2CSkWXyRTPLNJM17locijXMYVEqRO/tsxoasmpJQfxbFu6lz1mCGhok0ORvPLYrW6izETadMmqIjoYGJkXfWv+boqgPEzNlin7yQJ0Mi6WkDvX9rB6kufLhqFUaeIPg98kU3dGfoEd221Ecc3xJkrOgCxw1bmRIhhMnqb5z8tVJKqs90QsdPOhWnvVwdxvkF5kNY1ekQl0h91Mdrs1P0mcrwS2x79h+LKozfnC7AFlUZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHaRvOFqO5t6zE55sl155ofuDsWG3CQlOv9tkNhCBj8=;
 b=duCwDTK6TrpxweycyOUjDjyrSD5hBasgkyn5t7cZ4M4dldY1TXdfK6i59fRXtOo+X9Y48Sp5NDxvpM9crnN9j1f0/J9d6FYcwHekDOEJnq27TP13a4ocuf1BRSlfNURxXvQCgJTXcTwXjyrt7+aFAU6fY5+qXsHXTwEvECUdGdiZhQug0NGLyi0w/ehVL6R6WmJnZ33q5fVmGX7o+EAvDyCh7H8gT1fyxobTSCZ3xpWuDF5k/gvKYsamMP0f7EMY0QD/9rGrf3rF7nCG9aIYsufBxEO2w/0mo3OaNG1lWdxMFGAAR92kFM0ZobfZ2Jn/AxNnUS6NIq7TBqoh8TqMBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHaRvOFqO5t6zE55sl155ofuDsWG3CQlOv9tkNhCBj8=;
 b=wbEtQZr84/9vElKH3TjH8SpIgawd8uGgpHdVPz9RgXrgaPvnn0uXh4x1psIhdYRXVcLi1DPNA8R3SSoVlMtjYlTbJ+BtV8EMb8qorsrdaGFakXrLfzuQ116wcPnmsc+A5nBCcKjSB7Ojkc16KHoyNCmSDK+aZwowO4eNvHmqUUY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by MW4PR12MB7013.namprd12.prod.outlook.com (2603:10b6:303:218::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 04:09:24 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%4]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 04:09:23 +0000
Message-ID: <76691c90-ab1f-4d93-b568-43670c07473b@amd.com>
Date: Tue, 10 Nov 2026 09:39:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] dmaengine: zynqmp_dma: Add reset support for
 Versal Gen2 and Versal Net
To: Golla Nagendra <nagendra.golla@amd.com>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Harini Katakam <harini.katakam@amd.com>,
 Shyam Pandey <radhey.shyam.pandey@amd.com>, Abin Joseph <abin.joseph@amd.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, git@amd.com
References: <20261106-adma_per_channel_reset_v5-v5-0-f9990669362f@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20261106-adma_per_channel_reset_v5-v5-0-f9990669362f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::6) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
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
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|MW4PR12MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: a8c8a14e-26a2-4924-6785-08df3ee06748
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|921020|11063799006|56012099006|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261028144727099003|261009223327099003|261102123227099003|261009223027099003|261026140227099003|10067099003|261009220027099003|261009221727099003|261009221227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FtMPVrN5/mzvvURuzz9Rfy3sHkWsn+7O8aftZvGmFVtuFXsqq9WjP9JgU9lpSkLzgk7BwvGkGhNZ2pCFQOFVFpv3joppETFkBXMGJ0mtXrwO3gcLUz9IyNvxtOMr8nEWDuaG3zvtRG8h6QpeR+qz44XHLN1174HkZMtpy+dumEbdtuOt52EDjRmULVzYCegsB2he7fS1TFI1GGnaWDgaHZdsK1lM/JTsKyR++v0MrzYvq5mwQ2Hd+/jEfFLzJ0YTkfg3CLzVIehCNArq50oc9oWA35l4QaZM+bnXQc90/QQa78yskgCxiKiDJpFaXrggg4LhlNA530GKxkooth5yaxpB57Xc7oA2GFljwJXfC1MY3+H2VXCAZ5VY3aGztSTWr++F8TjORAEp5+z5a/UThsazjgOsnSGfL+/EljJ9X0ZWQsYineqo/BvlJvrAIMx3EZsA0kwwRhm6N809whwEncFhRYME94vd1lGlqQJARyL4UDsYxzDKbivaENuqrqbbHCyYTu+x6jqNPDZGKARtQquss6hnAmcF/ETNXgIE8XO9ZG05aIJzUjJmv6m5wjvohdUMhNMOR6QyVo1HVDmxlOfaxIQVPMx2rAt2qKw4510Rr3HqGrV8nFn2NNbcoiO6ieLU/u+1/jy+7nrQzyeJybR4isPm5i+tKuCkd+y2xSY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(921020)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261028144727099003)(261009223327099003)(261102123227099003)(261009223027099003)(261026140227099003)(10067099003)(261009220027099003)(261009221727099003)(261009221227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGV6WkwzYzhlZzhEWFFIcnZ5dnV5ZXh1ZW5KWHBDMFJxdHFLUjlKQTFtU0dO?=
 =?utf-8?B?MzdOT1ErSnhOTXlidzQvazdDWHcvWFBNYkZwUkgrbW9aMnc2R2pqU0pZN2Zx?=
 =?utf-8?B?UWtIL3plbzhCMHczNS9OU3BDR0N2b3NjM0NpS2RVQmV5UzZsSkIxRUhGTFlj?=
 =?utf-8?B?elJ2WjM1K2RQTHhWK3drSnBxazBodjNkTi9MUmNsSmpIWTVHSWowVEtnbnk0?=
 =?utf-8?B?Y1ZqdE9OU2hJUWRhWlZUZVErOXZlRWMraFJwaXZwbVllTTNjQW1laVZJMjBs?=
 =?utf-8?B?WnlCY3pIVUpXYm5DcHZXNjhpcXRtQjVlYW5vcHp3ZDNpU0FCbG85bnFiM09O?=
 =?utf-8?B?VWRHRjIzYmNrUGRJQ3ZIaXBPeDlKcXN1RnJKZ0RUT2gramhmWFVJMzRVOW0z?=
 =?utf-8?B?Wkt3cm0vblc4YjlaeHY0bTdTQ04vTnljVjNTT2JhQkViS2RiSVFVa000M2Qy?=
 =?utf-8?B?TStYUEJxMnJsQ0RIc0R0WVZDZE1YMk43eWxMaTdWYTBtVnVaYmF1TzFxa2VV?=
 =?utf-8?B?Y3hJK2hhVmNZV0x5OXQ1bGFYeDVYUmFsT0IwbURWZkRBaW5lblVqUFYxM1M1?=
 =?utf-8?B?R3BRN2pSVE8vcHBIU0N6aUJUSDFKSkxNd2o2VzRqZUVjL3BaTjluNms5dU5W?=
 =?utf-8?B?TTFOaUsyWEdSa0NycmlzNWsxT3N3bkk3YnJqS3hFL1Y2TGRBYmlnSXlNc251?=
 =?utf-8?B?Ynd6OHNlTnRaamdiUnJ6ZEJJMTQ0S0Jxd0JMcW41SXJDTHY3Z1FRVlBMUE56?=
 =?utf-8?B?cnhRcXMrZ2J4TnhQMno0dDVUZzNUbUlwU0thNFNKOWZmRDZKWldyWE5NVnVK?=
 =?utf-8?B?Z05lN2M1UkMzNVBzSlBzM09OZmxnM1djSndiNXE0N3ROSkMrSlNCeXI3ZFQ1?=
 =?utf-8?B?NENFem43VWhpOUlVMnhIVjVnT0FRelhieE5xQ2xkQUZxcGFES2laSmZFUG9G?=
 =?utf-8?B?SWJCZWJJTWNqaXQyTVRTMi9tbUoyUHRSQ2ppbUljTVBjQXMyKzhGR1NISjJC?=
 =?utf-8?B?VGNBekx4anVlT3NhcE1EdFJwWjBiaXVQdWVXYkUyd25sSDg0MXB6dTRmZkc0?=
 =?utf-8?B?RXVwRkx1TG9hUk5TUjc0RFFONG5ydDdwOFY2M20vSUEvM2pRSyswWVVSUlAr?=
 =?utf-8?B?MzFHb1JJWjZNeFdLUTV4Sm43NjBiY1B2aHJ1ei9XaFFiVDdSaW9FNnNuck42?=
 =?utf-8?B?VWdOaGtQcElUcFkwOVBLL0J1cTMyYWxEMUdZYmc2UitjYWdrZ1RZRHpoLzRH?=
 =?utf-8?B?ejFKNGVwR1hPd1RkNXdOUXlWZFVOOENPOG5Fa3Vnbis0WVhpclZUUUdBZnBH?=
 =?utf-8?B?NjQ4bXFnV2V3YkNJTGQ0QU4rS1BRcEFnU0tXWjhkUi91OHl3RzRiUHlxbnlJ?=
 =?utf-8?B?eVJ1K2tEMVY2NkpEbFkyUlhSM2V5MG11bWJnbG9xdVR4b2dnSzU3MStSb3N6?=
 =?utf-8?B?ZS9yZGExNW9JSFNRNVBzV1EydmtGREVDNUxzcjVzU2xkRS94U253N0V5TW85?=
 =?utf-8?B?WDU0RDBEL1dvMDArMWx0R05acHNMdDBTSDYrcSt6OEp5SnhRM0ZlSEQ2dFYy?=
 =?utf-8?B?dzRhR2xwbXQ5Vm4wZ0dET2U0ZUVYL3JaZ2hEclI5MHYvZ1FUWUFQaUdyallz?=
 =?utf-8?B?LzFUTStPRUJiSjUrZWxneFh6OFhubVdObExDbXdFU09DZ2x2NUt4dENmRTdH?=
 =?utf-8?B?aXFJSWtGN09rbkpiMTJST2RheG9GTDB5bmxMazNiKzBFdjZtemxqMGEwZXNt?=
 =?utf-8?B?SHFhYWFqNXN3RjhYaTlrZTVVYVhCeVJqbGJPbVhTcXpaZy9CS2pqOEJRSGdi?=
 =?utf-8?B?c1NWRHIyWmhJSFl2VFNQZjBIRngzR2VYQ3IvUWYyVGUrTWt1Vmk2L1pZYVlG?=
 =?utf-8?B?TU1Vd05VcXNIb2ZUREFQcG5QVWZLR0ovT1B4ZWRsU2UyNE1mWWFNWFptRmlo?=
 =?utf-8?B?cUZ1MTF5N1l3dVRSVkFtZndJbm02MzNzdFZLQmpPQ3FSS25XdEd6TEUzbGFU?=
 =?utf-8?B?bjF3Ky93V0ZHWHVmVVc0S2pOaW84N3c3M1M0OGdXaEI3MzlWSDlVdkp3YmtQ?=
 =?utf-8?B?M3B2U3FtT244WlcreHFlekN4UXN0cmhUU3E4NmRwY2VORDQ2UGYwR1BnelVz?=
 =?utf-8?B?YWxzOCtYKzRlZG5XZzN2bUQxdGp6OUFsNWYzZmJlVE9FYVNJNVBDN29iNzNM?=
 =?utf-8?B?Q1BWZlc2a2hhZXFCRU1NRk5rOWxpRUVLK0dJSWY2TTRUaXZuVGorNnVtQ0JT?=
 =?utf-8?B?Q1l4V3NobXAvVnVmVzZhMlo4Sit2OTZPN3lSWHBhYzZzVkdMbG41S2FaSFJs?=
 =?utf-8?Q?rxddZ0Vq4Y4XcJWM2z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c8a14e-26a2-4924-6785-08df3ee06748
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 04:09:23.7252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6m3z60bfzAAp+QX53S7iK+1ffFcXCgMJuICwY3RPYDO6hw8h9nsZLVDa+ZBwAYl9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7013

On 11/6/2026 3:40 PM, Golla Nagendra wrote:
> This series adds per-channel reset support for Versal Gen2 and Versal Net
> DMA channels.
>   
> Patch 1 requires the resets property for Versal Gen2 DMA devices.
>   
> Patch 2 adds the amd,versal-net-dma-1.0 compatible with
> xlnx,zynqmp-dma-1.0 as its fallback and requires the resets property for
> Versal Net devices.
>   
> Patch 3 adds the Versal Net compatible to the driver match table and
> introduces match data to identify devices that support per-channel reset.
>   
> Patch 4 resets each Versal Gen2 and Versal Net DMA channel during probe.
> Probe fails if the required reset property is missing or the reset fails.
> Legacy SoCs skip the per-channel reset path.
>   
> Changes in V5:
> - Drop the probe-time PM and unrelated IRQ-guard patches; retain only the
>    patches required for reset support
> - Split the Versal Gen2 reset requirement and Versal Net compatible into
>    separate binding patches

Frank: Please review this v5 series. FYI DT bindings are acked by Rob.

>   
> Changes in V4:
> - Patch 1: Use PM_RUNTIME_ACQUIRE_AUTOSUSPEND() instead of
>    pm_runtime_resume_and_get(), and fail probe immediately if the guard
>    acquire fails. Add zynqmp_dma_probe_pm_put()/_fail()
>    helpers so every error path releases the reference and gates the
>    clocks without goto-based cleanup, and pair every direct
>    zynqmp_dma_runtime_suspend() call with pm_runtime_set_suspended() to
>    keep the runtime PM status in sync with the clocks
> - Patch 2: Bypass the guard when pm_runtime_get_if_active() returns
>    -EINVAL, covering disabled runtime PM and CONFIG_PM=n, so interrupt
>    handlers keep servicing interrupts instead of bailing out
> - Patch 3: Remove the IS_ENABLED(CONFIG_PM) condition from the guard
>    error check, since patch 2 already handles disabled runtime PM and
>    CONFIG_PM=n inside the guard itself
> - Patch 4: Move the allOf block under the required field
>    Add the new compatible string and the resets property in the example
> - Patch 5: No change
> - Patch 6: No change
>   
> Changes in V3:
> - Patch 1: New patch - split PM usage count fix into a separate patch as
> - Patch 2: New patch - add PM_RUNTIME_ACQUIRE_IF_ACTIVE() guard and its
>    backing infrastructure to pm_runtime.h
> - Patch 3: Use PM_RUNTIME_ACQUIRE_IF_ACTIVE() guard instead of the manual
>    pm_runtime_get_if_active()/pm_runtime_put() pair from V2
> - Patch 4: Use allOf:if:then: to restrict the resets property per-
>    compatible with resets: false for non-matching platforms
>    also expand to include amd,versal-net-dma-1.0
> - Patch 5: New patch - add amd,versal-net-dma-1.0 compatible to driver
> - Patch 6: Introduce has_reset flag in zynqmp_dma_config to gate the
>    reset path; PM usage count fix split into patch 1/6
> 
> Link to V4:
> -----------
> https://lore.kernel.org/all/20261009-adma-pm-fix-and-per-channel-reset-v4-0-55f5fe409c55@amd.com/
> 
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---
> Golla Nagendra (4):
>        dt-bindings: dma: xlnx,zynqmp-dma: Require resets for Versal Gen2
>        dt-bindings: dma: xlnx,zynqmp-dma: Add Versal Net compatible
>        dmaengine: zynqmp_dma: Add new compatible string for Versal Net
>        dmaengine: zynqmp_dma: Add per-channel reset support
> 
>   .../bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml   | 35 +++++++++++++++++-----
>   drivers/dma/xilinx/zynqmp_dma.c                    | 18 ++++++++++-
>   2 files changed, 45 insertions(+), 8 deletions(-)
> ---
> base-commit: 2576c937f7b442df7de8e39332ff585f08b666b8
> change-id: 20261106-adma_per_channel_reset_v5-f826adb1314b
> 
> Best regards,

