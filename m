Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795089276;
	b=vDwlEwBaE6hJJRS/f43mgyBUnHbowk5j+N2GKPqnbZcnHxMYngK7/HG1Ue5/NDESsB6o
	 q0wNfv1LHnl/i04COIj0rqvPb9I1wdSeQaX6uBUb/bjXCv6WGS0WmJhJCANL5r5kRhmT9
	 pvLneKTtm+D0ti0JABBczjrlKlxj9/PCwYBmWoRjqs8gkzyZZEQYd70uaf3fk8Ozx7s07
	 beGXRHsjW4Pe5oY+mbV0BEGbzbhPI70W8dgsGuzrY7w4vwCXMvMj1uIy4qS6EZntdlqLh
	 3CudytJ7FBbjl0DGUXV8bPob50JWdH/7cxJbTGX+YxCR1spDxyoPKtXrfLCy7Zt84Xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089276;
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
	bh=X31RQDPfJw1M0A3JVrABOgu4pGlaf3xM42nl6NhWXOg=;
	b=udFGXAN1QSI0ST7qVudGWh1K9RdkvKrL5s7hALzp8YMqNKuVxkR+8WgmQbLxJ42SoHlU
	 sJroWaipBXOaUk5lMDFnS98PL9qEpNKjriglpvVJgqfno342CNlPhUrJgvp+ser70boME
	 RnkUBqj88S/aszD//qF5hMxePMsFnRU1zRySSiVYVzBJHjfQP6wy75vJWhyPUmi495TtN
	 FT6v5PGSDz1TH2PC28HbLYZaeLEBrWNJI7oPz1zbOpM+GXD/iOVTA/G99mBNJHZrJv4el
	 fqWtHyHykIdJaDHEfgCalMQHNsskV7dv8uqDedpAu6DjV8Kl/hvoZjrh48BFZG1AQUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="QDS/DzJ7";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.13
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010013.outbound.protection.outlook.com [52.101.193.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43637606A320;
	Thu, 19 Nov 2026 11:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43637606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QDS/DzJ7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghvuxpjwr1rDxhmQceeoye+D+WuJoKRMeykxa5xKpPqcG49BTozFRdukrxy7BeUgKRz4+mH5n/MKfO0hNs1N5NWezaRDEwNIHcYqtnwst1HWZcjtXaKblfL/siCYbI0lrXPJF8pHY8dKOkHNwped7vpD55v0jTQDI5OwAeS3yGQZnd1l5z/RseQ6cWM3BHi23nZFSKxwqmJciwwLOumQdBp18E31vYVHBNXHXh2Q0ygYZBdMLBG8aADCMhDLKCKatwboWYdzqsVYIMBq6UyLPLnU6dEg++IlyjAsUbejs4LBoDfjYQCdB8Rip8zWLBE7Tk6w+6LfRA7q8wr+0QyuGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X31RQDPfJw1M0A3JVrABOgu4pGlaf3xM42nl6NhWXOg=;
 b=sMTws/Xutmbr+LJQMfJorLktCCTtylpLLBwsWy96kOL4sbRiGamLig6Jz1dGal7AEzBK1FIE9UBE0HmAuadx/BIShBc6sPD8Y1c5TfPwTDpyiK3Z83ZQRyJoT223qIKvUrUcDU9peyfBqzKxCn1uOLGQTHuOVjj+nxfEB78lD38/71t0CCHmRnyM2FXN+cDlCztm70ckA68QmgEWXdQJpUz2WqGRxffUCT0Zumrb1gQiZ8nU7HgMhHMrGdia+VETpYQQYsawD8JVx1Yri/XC4oDi2fcULV7YMcrxDMrzsgYimJoZpZGwrNsOVsnU5BL1YdjXK0DA3LCRx6ml6HjQWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X31RQDPfJw1M0A3JVrABOgu4pGlaf3xM42nl6NhWXOg=;
 b=QDS/DzJ7HN9YWVHaxX4PIQI8L/QVRcZf1j32Q7sKMmC+klWGnj8CXloVRdyJnN4dSrGha8kj5yDdWTm4hzXkTZzJzQuWYJlEaRR0BID4l51sdnfsEbNZk0vix6udoogG0F35E1/ohb8mPVs5xLnOiXSnW8iEKdgNSHP2dLCgf6A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY8PR12MB7516.namprd12.prod.outlook.com (2603:10b6:930:94::9)
 by SA1PR12MB8597.namprd12.prod.outlook.com (2603:10b6:806:251::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 11:54:28 +0000
Received: from CY8PR12MB7516.namprd12.prod.outlook.com
 ([fe80::b6cb:7a8c:fe0f:b9cd]) by CY8PR12MB7516.namprd12.prod.outlook.com
 ([fe80::b6cb:7a8c:fe0f:b9cd%6]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 11:54:27 +0000
Message-ID: <fd4bcca5-b775-43a8-a7da-5edf6df91a5e@amd.com>
Date: Thu, 19 Nov 2026 17:24:18 +0530
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
 <avtpSXEdyeWpghqd@SMW015318> <5cbd17e2-f3ee-44a7-9a6d-bde4380520d7@amd.com>
 <av3dLAxz5TvMf1J6@SMW015318>
Content-Language: en-US
From: "Golla, Nagendra" <Nagendra.Golla@amd.com>
In-Reply-To: <av3dLAxz5TvMf1J6@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::7) To CY8PR12MB7516.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY8PR12MB7516:EE_|SA1PR12MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ae6aeea-93d9-42e1-e0fb-08df4633dce4
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|22082099003|18002099003|6133799003|261009223027099003|3023799007|56012099006|4143699003|11063799006|261021121427099003|261102123227099003|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	pgqazjOZ2g6+xhwcAUd0sC9Uk7mRHKG1X4A12GGHG4gxG4zWd8aDu35QocsJFW1yCOyYLen6IhEcxumVOMmHz4H/5BSf1F290TPYnIQbmA/JLOAZuXOey8RduntGwcx+GhGebQsIJRXtsZZHIGa/48HDamzTUOn3RgssxqaiJreqr6FZGoE18/j0loGPgOpRV8bLLDVcASwDqqg1L1lFWUYcniiyQI5CDCgtlOnN7pVhDfrl/xVLeS/29oYK0wziwislkanSiJkxLF+fbSKtgOIiVWpLIbe1qodv4UMTbSm2l2bvczqvvsB+o8Gkr4iRWTHoIORMUpX2lXNfCQlW4DboKSXl+vRLQYv1gAeH+Clu/Nk20nyC/vqAfAAEmWfIcovOeCOc5usP3hzY7edkEHMAJLPp4ul/HgoJFBJ2M5B7yonzZ7NQxgO+Fp6c0pcDT6jQ5DX7WbErt/KU+WZWfraMUdscQQTorBHuvehAuhyxGTLA9Ls3QFUx9DPv3Sy7ZTgQdLu0UQ+rkstiGKG8GgbxhKHfDS73S9j2U8Nk8TJfkk1/HMvT1DE1eKoz4TFBoRYhYVfrFuoi+/w0zt6LFUfODNhNz8gl+l6cMpT4uXxRNtyI4BLdBjiWDICo5TPD/ys4hcq+ZSb0KUaLBSQOx7/Coa725xDtzZ6XDfgwpDo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7516.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(22082099003)(18002099003)(6133799003)(261009223027099003)(3023799007)(56012099006)(4143699003)(11063799006)(261021121427099003)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHMzZ2ZSVmFUMVR6M09Hblhic3Mxc1U4QXdmUTRpNU5mQlJpcDJ0WDNlWTJZ?=
 =?utf-8?B?MmVOb3JuRGp1V3hoVXhadW9USHFNQVJlWHFSeTZGSytDZ2dpWVM2QTY1ditJ?=
 =?utf-8?B?Mm9mbHZsTHlnTnZmS0JLNGlZeWl3MU5oQ25YbkRhRFphcU1mRWpPQVFJUjB0?=
 =?utf-8?B?ZWIrR0RiK1F4WVR1RktweGJ6T3VTTzFqQWdCSHZ4ckNEVEU5cXpVam0zSWlv?=
 =?utf-8?B?cVRpYklHZ1BjVU9MZ2VSbWJqOVEvMFB1eUppaUtURUZBV2p0YUtoOWt6cEZL?=
 =?utf-8?B?dnlTOThaVFdQcGs2QXFGQStJUDh0OUl0UFFsNzdoMk5QM3lhUGRXL2tMZ2o0?=
 =?utf-8?B?L20zUkpjWkorQnpFZjdCVEVlZUFLU25wUUhvdFhZbXpoTHhNM2NPTW52eUt5?=
 =?utf-8?B?Wm5hRTNZaTlENEx5Z25iWGsybFJWN0swY1k5TmU0RkFya1VPTVRMRGRHTDEr?=
 =?utf-8?B?QWZxZG9XR1BUbW91YWZjc3NBRCtCSUU3UkgraTdYellUdUdDREl6U1RNUVBF?=
 =?utf-8?B?U0Fmbmh1cWNXcVF0STJxRGN3bUVmTUkyZUFBenYxdnhsUDZ5VEwrV1d1STlE?=
 =?utf-8?B?Q0lvMU5nejZqTWR2MWJ2TzlBL2c1Z1E4bnh0OVpqbGlNbEV6NzJqM3pubVdy?=
 =?utf-8?B?MVd4SWxkYmVyTHp4ZHhCVUt3RkhDNk5tSFNWVWZ1NGlxMkxrbjhhdFFnbk9l?=
 =?utf-8?B?a1NqRjJKTU5XN3FTTlFMTVY4OXZ4NnNRWUNZZURscUdxSktVTmZZQ1F6QTdp?=
 =?utf-8?B?SDZYa2h3UlRYdGR0RW9ZWWhQL1VmVjRnWHFRSVBqaG44ZzJxd2RrVVZjRXJV?=
 =?utf-8?B?Qld6MHk0cUk1N1RnZy9ZbXorOU1nNVN2c2k5VU1IbnhDU1hiZmU1SFh0TjRk?=
 =?utf-8?B?MmUybVhSZVdnT0FMWXFDOC9WRThqZERXQnVjTXljK2FEd3dqZTUzbnE2NGJk?=
 =?utf-8?B?M3lVeGN1YzFLWkNGY3JnQ0Q5STc3c1Z0WWtHNEJxVDFGMjZtNlk3RTdabnhi?=
 =?utf-8?B?ZS9SM1pwYmZRV0ttVC9UNHNzdDJqUlJLZFdKb3Era0VIOEo5Y0dlQnZpenJG?=
 =?utf-8?B?a2NySWEwQ01ZTEkzdWMya29yUVVmMElybzlhZSsxT0NuM0dCdXl5VFdWeU5H?=
 =?utf-8?B?SlRqOUN2ekYwdzRkcElaQXRUU1MrSDA5SXRxa2ZIbDJUTVVjMkJwaXVjRUpT?=
 =?utf-8?B?VG1HSFhjK3hHUG1WVW5hU0x3Q2hsRUoxM3ZhdTJIL3JSNlMvdjRHV2lxckJl?=
 =?utf-8?B?Vi9SNnluY1JCYlRTY1RYeVJZTHVoK3hjWlhRV0ZSWU9oNWdmWUMxZEFBb0g4?=
 =?utf-8?B?VGg5bVM4QUlwbWhFa0czbkd6aHlod21mOE1RQ2lYUTF6NWw3UUw0c3VYVFJQ?=
 =?utf-8?B?a1kvZWMvbDcwRVMrY29SODVBaHpsREhPUHIyL3ZpcmowU3dwcDhpKzc5OEVq?=
 =?utf-8?B?Ri9URzA4eUVleDVPalZ5SzltMk5KNEh3QS9LOHQ1cnJKeVQ5K3pGZjFTQVNr?=
 =?utf-8?B?L1h5Y0wwcTJZcXg1MDExNXp5bTMzTjUzS0ZtaU1kTFRwZlMxVjl2UElHMFI4?=
 =?utf-8?B?b0k0TkRnekpqbmk5VjlSM0tEalMvZ29SMlNWazRKMGl6cVJkUGZYL0dOMk5U?=
 =?utf-8?B?Y21WeGxESktJSjFuOEhhTWVnM3pEdkt3Z2F6cXBtakk5YXBhdHo4UkFaNmNq?=
 =?utf-8?B?eW82MWpRM2ZlNlNxNjVubGVTL2lSRkpQVG01VDNIY09tVG42Umh5NDJ0RWV2?=
 =?utf-8?B?ZGZySmFkWW5yWEZLMGxBcWc4MFI3bVhUV2RXT3F2ZHFsQlRDQURuMzlVVnJO?=
 =?utf-8?B?SnVvK0hmSkt6S2k5bzBSNVRJYmZxVTVGL2tyNk83di9PR214SFJuVHVwWWll?=
 =?utf-8?B?NzEzZWwwY0t6dUQwZytWMklvRXl0UjdZSVR3YU5MeFl6YzMvTWdPWElUMVVI?=
 =?utf-8?B?ekY1YVgvQnRxOExYT1d4a1NzbHVuajFCYUJLcnMxQzd1Q2tmS21GSzJlUWN0?=
 =?utf-8?B?bG5XZlBlbENXZjNYb1JSZTJNZ1RPeTVyOW80ajJ2RUQwR3dlTGxlODVzdTdj?=
 =?utf-8?B?NVlud3FJdG96djVKM2xGVDFhbEMzcU83bm5IQTJzMmcrUkx6QjRQQ2NaV0Ur?=
 =?utf-8?B?a25TWVBKeEdqN0hHUDMweUZRLzJLNkIvUFlqUEpjb2xqMG5aWG05d3A5M1Nt?=
 =?utf-8?B?SVVHbW5KR3FNSzMySmJYaWJEbmhNMk9uL0drY2t5U3RqQ2ZWbnVQaHBkbmFY?=
 =?utf-8?B?anM5Tm1vc2ZHWllMRWRURWR5VTBob05LVXpvMzIrWjV0SjNFVUlxTi9PS3dM?=
 =?utf-8?B?aXlJendwSjA0bzB1Zm55NDZtNDg5bXNKNFc2cnA4bU1jSlZ2cEkxUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae6aeea-93d9-42e1-e0fb-08df4633dce4
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7516.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 11:54:27.5660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fx8ULyHu7Gep2tp0ZXaa0HKvwQIoVQDM5JiQlWd35OkrnwtVl6UfpxFOshwpbjd/iuk7ASnwrX8bGiWZ1XHJQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8597

Hi Frank,

On 11/18/2026 10:45 PM, Frank Li wrote:
> On Wed, Nov 18, 2026 at 11:54:30AM +0530, Golla, Nagendra wrote:
>> Hi Frank,
>>
>> On 11/17/2026 2:06 AM, Frank Li wrote:
>>> On Fri, Nov 06, 2026 at 03:40:26PM +0530, Golla Nagendra wrote:
>>>> Versal Gen2 and Versal Net expose a dedicated reset line per ZDMA
>>>> channel. Trigger a reset pulse during probe using device_reset().
>>>>
>>>> For Versal Net and Versal Gen2, reset is a required DT property, so
>>>> probe returns an error if the reset property is missing. For legacy
>>>> SoCs, the reset path is skipped.
>>>>
>>>> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
>>>> ---
>>>>    drivers/dma/xilinx/zynqmp_dma.c | 10 +++++++++-
>>>>    1 file changed, 9 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
>>>> index cb0eb13f9b05..12696fa44c66 100644
>>>> --- a/drivers/dma/xilinx/zynqmp_dma.c
>>>> +++ b/drivers/dma/xilinx/zynqmp_dma.c
>>>> @@ -19,6 +19,7 @@
>>>>    #include <linux/clk.h>
>>>>    #include <linux/io-64-nonatomic-lo-hi.h>
>>>>    #include <linux/pm_runtime.h>
>>>> +#include <linux/reset.h>
>>>>
>>>>    #include "../dmaengine.h"
>>>>
>>>> @@ -937,6 +938,14 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
>>>>    	if (IS_ERR(chan->regs))
>>>>    		return PTR_ERR(chan->regs);
>>>>
>>>> +	match_data = of_device_get_match_data(&pdev->dev);
>>>> +	if (match_data && match_data->has_reset) {
>>>> +		err = device_reset(&pdev->dev);
>>>> +		if (err)
>>>> +			return dev_err_probe(&pdev->dev, err,
>>>> +					     "failed to reset channel\n");
>>>> +	}
>>>> +
>>>
>>> Use device_reset_optional() will simple code. Your binding already verify
>>> dts, needn't check again.
>>
>> Thanks for the review
>>
>> The binding schema restricts the resets property to Versal Gen2 and Versal
>> Net, where it is required.
>>
>> An unconditional device_reset_optional() does not enforce this required
>> property for Versal Gen2 and Versal Net devices in alignment with the DT
>> binding schema. If the required reset is missing, device_reset_optional()
>> would allow the driver to continue probing.
> 
> Yes, but I suppose function doesn't work without reset at dts, which is
> same as that driver is not probed. And new dts require pass CHECK_DTBS.

Thanks for the response

However, if a DTB without the reset property is used, 
device_reset_optional() would allow probe to succeed. Without the reset, 
we cannot ensure the channel is in a known state, and a subsequent DMA 
transfer could fail.

Since the reset is required for Versal Gen 2 and Versal Net, we think it 
would be clearer to detect the missing reset and fail in the probe, 
rather than allow a possible failure during a later transfer.


> 
>>
>> Whereas, in the current approach, the match-data check limits reset handling
>> to Versal Gen2 and Versal Net. Calling device_reset() for those compatibles
>> enforces the required reset property and ensures that probe fails if the
>> required reset is missing or cannot be applied, in alignment with the DT
>> binding schema.
>>
>> For legacy compatibles, the driver skips reset handling even if an old or
>> unvalidated DTB contains an unexpected resets property.
> 
> Fixes these dts.


Agreed, we are taking care of this as well. The invalid DTB case was an 
auxiliary point.
> 
>>
>> Hence, we prefer the current approach. Could you please advise if you see
>> any concerns?
> 
> Similar case is about clk_get_optional(). Only check critical problem, like
> out of ranges.

Using optional does check critical problem, when the reset is present. 
But doesn't enforce the reset as required.

Thanks,
Nagendra
> 
> Frank
> 
>>
>> Thanks,
>> Nagendra
>>>
>>> Frank
>>>
>>>>    	chan->bus_width = ZYNQMP_DMA_BUS_WIDTH_64;
>>>>    	chan->dst_burst_len = ZYNQMP_DMA_MAX_DST_BURST_LEN;
>>>>    	chan->src_burst_len = ZYNQMP_DMA_MAX_SRC_BURST_LEN;
>>>> @@ -952,7 +961,6 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
>>>>    		return -EINVAL;
>>>>    	}
>>>>
>>>> -	match_data = of_device_get_match_data(&pdev->dev);
>>>>    	if (match_data)
>>>>    		chan->irq_offset = match_data->offset;
>>>>
>>>>
>>>> --
>>>> 2.43.7
>>>>
>>

