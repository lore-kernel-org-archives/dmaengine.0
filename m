Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793963493;
	b=Zl22if+JfKHCPDoZv3sSxYTjN9yEydnh9z+cCEOd6b6iA/UJNXEvbBTKFFr7PnyUcqrV
	 +OTSsd/MaaU2ra4E52WdsK8UGEVKXPJhPZk6hF9LwXOnkPcyohuzfy1/xA1phEqideL7T
	 5B3q8gQUGbnQ/elVS1ouUYZqn2iYlszMmRU5ITve9nGAfhD9d2BH5V88v5iC3pP4zSwwc
	 t0rr8LYsKNQLYbTDDzBG+/MM42NkMtjLttiBhPSnL+TGwojJ6Yhj+vIzV0x5nUk6hi+dZ
	 qEZ3Ku1mVvGQnM531ovbM6uF4iVDLo+wIp4nK9Tcvst3DTrjk7jdF+yqoa7f0xhxV1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963493;
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
	bh=vfNLgDxY0TENY+AK5INZiV1XX6LOM8FhEAWX2GQsqL0=;
	b=xmQLZZLQ6kTRqzdIn9d76jhDP3R8pgaPXOnnpl9XKTyEGa3kk1KjJNn72mhJgsIScYBS
	 yasGIwqQZYTsKeZvGXRMa5CM2FYFVGaEiO6C99KGtRSZD8HB0ev+RILb5DuoBIa10amks
	 MQ4U+rcK+L7f+1ocywpkDNv3TUZNaewmim54DrdLXvcuiTvgzbULiMRNkSRlaOHW/LpCi
	 EtMfbO7u78IqxrwNonq3313Blcvq/wvgpy0B7Vg8XhAYBb3IqnaxKmTP+ySX6lQ5HA/j/
	 ICve+y8yDklbn87CYaN84bH/pkBkQ6iXqwRQ4IqCqYEQ8kwNQLO+fjiAxYgj3YvlilQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=a89AHA+c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.43
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013043.outbound.protection.outlook.com [40.93.196.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC02606A326;
	Fri,  6 Nov 2026 11:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CC02606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=a89AHA+c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t96Y6tjPSLVPOiuH1ZeCs8ymK/2sAoBbrZrAbN34S38gBQdDjG6Dcl4P2ORPok5bf8BeuLezvVi6IgtAPjzXB2807Oet35a7hFplxaIpKEQ4KxXV5hUiIdq1XBQ87g6CjMvTYxXPsqiICYpIH2i0GaLBlZxxfjX05FhP2CHEoFo27fpJHjUOS7co/twCAEOkLl7Ink7hhGqVR9hBVZfuVz9PR9FaKII0xxTZ5Kwr8yk93q2tS4NE7LdpMJ40EikW7G9+0OCcNofB6IzE4+XRPppi35HBagQIMMcTrD+Yt/K1X7BYjO2MRTvNX28XunWmU/JG/LPY/Xqvps0ZeNXK/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfNLgDxY0TENY+AK5INZiV1XX6LOM8FhEAWX2GQsqL0=;
 b=B8gXL7Rc9NLTNmYYc1u8HnS9apgGHsrFZ8LG0SHw7MppcqEg6IeUnnhRdv3Jvm5VJdK2sj6zRQ+Z0hVNV9SRMVQ9/x7II5Uw3S/KT+32GkVmYjJHCA++f0Tr5GDiEQOLlpNW+c5Ckk0Z+/7WHQph1RNYML1m+qgpwakP2PXXu7IS677zzwliJw6zOCrcnTDYtAoMfeUZDyoMwK01/FzWhPQVGo+XzZ8IIV3+aKfXxDe84qrMM6Lmor+eacUrXdmuntpV1djZF/fK3ANhF7K2myvr54qZlCxYCpZd9/TAq7ERhDASEF/UJpQD8kBTesqGpA5XkQuWx102owRCHvSRkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfNLgDxY0TENY+AK5INZiV1XX6LOM8FhEAWX2GQsqL0=;
 b=a89AHA+ciwB09HgSNoHNt0IK+B069p1qWo79lEpcnmlOPcPhp0OIRztsMTZn7raY56qSto6LFyfqkos4j6FW1lLIUzx7H8NcC8aEzbFA2kK/Ef+HGP7QzCGEidrDHCBVOWGOOhZoXT8jCNIZp3z5LqpS/COw3OkJcSlzX08qUKA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0SPRMB0124.namprd12.prod.outlook.com (2603:10b6:8:1fa::20) by
 CH4PR12MB590718.namprd12.prod.outlook.com (2603:10b6:610:50f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 11:11:29 +0000
Received: from DS0SPRMB0124.namprd12.prod.outlook.com
 ([fe80::24e7:97e0:923e:68d6]) by DS0SPRMB0124.namprd12.prod.outlook.com
 ([fe80::24e7:97e0:923e:68d6%6]) with mapi id 15.21.0592.007; Fri, 6 Nov 2026
 11:11:29 +0000
Message-ID: <be6bd8e6-27e4-4e9f-90a1-c8922846230f@amd.com>
Date: Fri, 6 Nov 2026 16:41:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] dmaengine: zynqmp_dma: Add per-channel reset
 support
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
 <20261106-adma_per_channel_reset_v5-v5-4-f9990669362f@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20261106-adma_per_channel_reset_v5-v5-4-f9990669362f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYPR01CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23f::24) To DS0SPRMB0124.namprd12.prod.outlook.com
 (2603:10b6:8:1fa::20)
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
X-MS-TrafficTypeDiagnostic: DS0SPRMB0124:EE_|CH4PR12MB590718:EE_
X-MS-Office365-Filtering-Correlation-Id: 962e7543-6257-4c00-3788-08df3bf6b500
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|921020|4143699003|11063799006|56012099006|261022105027099003|261021123027099003|261021121427099003|261009223027099003|261022075727099003|261102123227099003|261026140227099003|261028144727099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	YVT0fu2zU2j0ldZfe73uEM8DbJok560F6WmH0k/ZeVFfEFjG/bgtJ2cFJRSWk4zA4fnEG07a0Au2O1izM+Vb/xPB12cKGdevaUKhWqSi1PGxZJ+EIHGn+p+29XNxHqTqqywbAeOxiF1UxsVXwPDoY5ZcMGtdxbPDh11hsleiPVTbmKWeEi6b5usha9tZUwAXNkzdldPBwJe5yvJZtR1NyQLZD7GuOUANOyMxTa7thlemg982iRA1cIGpPdjOMhvAmAqDepBFoZIWEyLb6h2672Dfy15DlFcMPxo7FjkJscf8drInVMq+a/4uIiDw0UQuqFkMK0vy3XQubO/XrMlYqxonWP1gp/fw1mYT3CZqBw25q92GsIKjcY3+tWm5uIG21tz2fhElnTD9KrpPPfh9bpmIQ8MMQnIiz4AWBKPM7dRh+hLEenJyzdTWh3OSJPU4ESdVygxPUnTWOVkWd637hSW4NYZPhYh2HQeBOBzAyoUFLjnU6y6JxAJtfaxfA3381Db60JtCtvCNPH09+X+LJ9nUxe5prFAcO1vTaqSRbWuwnHlmB8E5xITIpzOkG7y3SPJqRw8/dt+7e3UbhUnjRO/ya7mqNI9Xa5cl054vTAcBcL1zYOAyPphlBvyc3xKrGT4SGQ0qPgS1eU1dLfauZuCql//QbpZ5xZAkxCnOFMwpF+rW+GiKGC+CUWb599tyuhnCthMjT+5FOwmkiqQxNg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0SPRMB0124.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(921020)(4143699003)(11063799006)(56012099006)(261022105027099003)(261021123027099003)(261021121427099003)(261009223027099003)(261022075727099003)(261102123227099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGtnYVdHSWRDRTVlSzZNOW1iUjRMdFlQMk9YN3lFUlRDUW1XSWFNemdqUzk5?=
 =?utf-8?B?ZjlzNGE3ckhCUDEyb3dZMGMwT01HT0ZsY0dvUTYzUVg0R0Y1c2pTeUlCNUtX?=
 =?utf-8?B?NTNhbjBueFVjdDZINkVLYzJLYk5zK3R0enFrMk42ZHRHbmlRV0FrRjBFUnFI?=
 =?utf-8?B?WndudVRzOC9HVFFDYUdmZitZOTBCWUc3QnpBSEVTTHoxTms1OWQ5b3FoR2sz?=
 =?utf-8?B?Si9zRVhraGFCZklhcjV1eHRyUUpob1dmVW5UWWRVTER4RzJYVnN4d1lqYXNj?=
 =?utf-8?B?bGxLVTNaN3AvRGJIMGpiNkJ6ZDlHZlJCUXFuYXo0bGZLdkhsWjFWU01YMHVz?=
 =?utf-8?B?cmJJb2FWNmUwN1dyeGhSbmM5a1JrRWtzRWhxcmRaWVZ2ZDRMSU8veW5BTWpW?=
 =?utf-8?B?RHhCQUxHLzNWOWlGWkFDLy9naU1sR01XZWFXdzNKZFd4Tm9CTHh1RzRGUExE?=
 =?utf-8?B?M1hFSTVDZlo0cnA5QWk4djZNVG1QL2ppdlNpRkp1QnRTZmJra3lqbUdOY1c2?=
 =?utf-8?B?YnllSVZZbFQxaVRvRzNvdlpMSzFhRFV2RTZFeHl2akZsY1hXdTBQbXoxL0RQ?=
 =?utf-8?B?dkZZMldod2w2Z0I1UWtXV0VrVXVlMjNPVklCVjJwNzYxeHpBWERkU2xoaW9G?=
 =?utf-8?B?SDliTWpBUUtzY0xPa0sxWUtBZi9CRS9OTFU5OUx2NFptVmk4T0lWU3pZa3NM?=
 =?utf-8?B?VXZVK0VuVFo5b3F2ekhJVzVFMTlrVk1SMTgwSEZUZjV2UzhvK3VndUphaG9U?=
 =?utf-8?B?Z0N6NEphUElmM1BWUmlXWGtVNVphSmhjR2dCT2kwSlZPZzhMV3pETjZsbkRQ?=
 =?utf-8?B?RHQwUDZid09ZVEtwWlNCbWZGY1REbDRBRU5PRk5ma0JnM2VPd1ZWM1lRN1Ny?=
 =?utf-8?B?czBLVm1kZWxnRjE5SG5LWjg2ajFFZkl0VWxEcTJFSENxKzNXSHYvQmdwMk5l?=
 =?utf-8?B?aytJc1JGdEh2ajVjK2lhaUNhT29obmMvbE5UdVVXZ3ZYVnpTZGVsS1Znbm1p?=
 =?utf-8?B?eTNWMGNYWGJ5d1NHU2l6K1Z4TGViclp5S3ZDbk9PQ1U4T1FEbHhQdXZTYlFI?=
 =?utf-8?B?cWVaYmQrYytMZ0JWaTUwMyt1OU9JWE4yaGlGb0p2MG10ZUttWEdiNGxpY280?=
 =?utf-8?B?L0U1M1A4bzlwM3ZncmI0OW0xUmZWWVlYVnBCOTNWU3VZQTQzL3A1VGlRQWZF?=
 =?utf-8?B?MllDYThMTThxUDM4ZlRCZmRDQmxvd3ZmaFMwTi9TejAvYVpNR3RQYUNYV2Fo?=
 =?utf-8?B?WlpYenVMcHdjY1dKM3NuWklMZjdXUlV4dlovRjBZQ3hTYXAxR3Rqd0lHSjc3?=
 =?utf-8?B?cDBNTWticjdSN0Nrc3Z1Tnl5aVVtMkgreWJOS0JqNEZVaG9RYzNRQXNHQzl2?=
 =?utf-8?B?YmxUN3pIK0t2b2RzNG1iL3ViKy9NYW9CR0NNcmRjOTZzOHFMaSt2U1d5VS9E?=
 =?utf-8?B?T0tzeEt5VHAyRjhSM3kxQ29LQ3lUMnloYnFZT1JHVnliK0hLdGlGNlFMYzVh?=
 =?utf-8?B?T1ZUc0U0M0dSZmFieUc0OE5RUU1NUzhMeHByY2FGeUplT3AwNklYMHFBT2V3?=
 =?utf-8?B?cDZ3ZnQ2dkVZcmp5TWpPc1hDd3FOWVl2Y2FyMmY1QzhqRllGWStWV3BhTXQ3?=
 =?utf-8?B?WjQrcmt2K01wZkozQ0ErZXVSODdldTZleDFjNWs2eFhDOEZZOWVzcUtkK052?=
 =?utf-8?B?OUdlekdvczJVRjJjdC9hd1ZtcmtUeGxqYVh0VXR0dk5XZmRhOHFPSmI3ajVz?=
 =?utf-8?B?R3gzYktyZlgvc0ZJZUc1MDdJZTV0SEtmNmcyeUdDd25VSktUMmRLSXJxSmlD?=
 =?utf-8?B?VU5KSEw2UWxPU1pzVzBNdUJBT21rdlBwdThjVG9UVnNvcXc4bDhOakNFTEEz?=
 =?utf-8?B?NzZHU0RPV3ZQT0JIMURCRmtNUlpkQnJ4bzNnNEduellvaEFIWmkyUytuMkZK?=
 =?utf-8?B?TmFhallmbCtOMGRRZEl0bU1xWWFENjh0U2NQTkhjSk0xZnBSSGRuMWtFNW5N?=
 =?utf-8?B?WHZkYTJYc0IwM1lEQ0pRc0YzSGRhZ2pRbEZGR2pEM2dvZkhvOU5hVk5QSG5l?=
 =?utf-8?B?Zk03ZmNVL2pTV0hQQXIwa09HUVBnM1c4Y2dQZmJYTnZXd3RPdXdyaEhiU3JB?=
 =?utf-8?B?alBLVGdNR2kwZWxlU3YydE5GQ0xjcWE0aGRuRE9JeS8ycnVKMFJqSWxsNjZ6?=
 =?utf-8?B?Vk1EZ1ZZL3d5SVFTSXRDNTZBWExFTjEwaCt2ZWhKRGVFZ3ppYzFjdThVdlJY?=
 =?utf-8?B?dDBycFNaVFNFamd3eXBDN1o4c2lCVm1HbkxuMmZwS3dMZm1OTGdMcElWWiti?=
 =?utf-8?Q?U/CWxWlJTgXIFyZYpB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 962e7543-6257-4c00-3788-08df3bf6b500
X-MS-Exchange-CrossTenant-AuthSource: DS0SPRMB0124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 11:11:29.5437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aR6oB0vV1PIFOLRoysQtqtdoYwuw4gp9EnqsDE71GTdMgS6y7U9AyHkX5HF2xC9A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR12MB590718

On 11/6/2026 3:40 PM, Golla Nagendra wrote:
> Versal Gen2 and Versal Net expose a dedicated reset line per ZDMA
> channel. Trigger a reset pulse during probe using device_reset().
> 
> For Versal Net and Versal Gen2, reset is a required DT property, so
> probe returns an error if the reset property is missing. For legacy
> SoCs, the reset path is skipped.
> 
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!

> ---
>   drivers/dma/xilinx/zynqmp_dma.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
> index cb0eb13f9b05..12696fa44c66 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -19,6 +19,7 @@
>   #include <linux/clk.h>
>   #include <linux/io-64-nonatomic-lo-hi.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>   
>   #include "../dmaengine.h"
>   
> @@ -937,6 +938,14 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
>   	if (IS_ERR(chan->regs))
>   		return PTR_ERR(chan->regs);
>   
> +	match_data = of_device_get_match_data(&pdev->dev);
> +	if (match_data && match_data->has_reset) {
> +		err = device_reset(&pdev->dev);
> +		if (err)
> +			return dev_err_probe(&pdev->dev, err,
> +					     "failed to reset channel\n");
> +	}
> +
>   	chan->bus_width = ZYNQMP_DMA_BUS_WIDTH_64;
>   	chan->dst_burst_len = ZYNQMP_DMA_MAX_DST_BURST_LEN;
>   	chan->src_burst_len = ZYNQMP_DMA_MAX_SRC_BURST_LEN;
> @@ -952,7 +961,6 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
>   		return -EINVAL;
>   	}
>   
> -	match_data = of_device_get_match_data(&pdev->dev);
>   	if (match_data)
>   		chan->irq_offset = match_data->offset;
>   
> 

