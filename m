Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795454976;
	b=hj5IeAldnzTIYGrxJLaYycF4meXxQpZYD4C58DQ7ZiNuIxikTdcFox3KYlA4913f7Tem
	 /1ERU/wl9vyFTfrPbN/kWQTwukF31pkShBb4tbpjTZrz3lVI6jdYYitvVO11CT2VQ4st6
	 AEI5+uHGTLVa9Pe0v7+hBgwVAkuFvIPajpCg3QtSmY/TtPN5LFDSjSGYWgUAQ3Iv2ilER
	 vqcZZT1rQuUZR9fmRG9gFRaHHEFHfR9KyLeD5YiP/HzFBsVGo2/EGVJCJxzpciQ0xuWyT
	 wjCd0nEw97zWlrBTnsS9Qtp2t2EKryt5jm37KUqje1/W/WNOUmRVe+5Xza//7wZk/7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454976;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=jx7Ph0eMdBzZ/8yol8Si1xkApW7Jgsz7SRod0EJRTaU=;
	b=MzEMvS8M6oT26pmEEPv2xxc7g7SywJBhZqyZ3SXh7FgndoMUU99iHPIIVzhl2yfi/Onn
	 vjHXvrc1nbDNYrp4cSHd31963Mu0roGalVsq6ANHI5OBS2pSLMIZ20H+TdcklMhJ03XwX
	 KmmIzVvV7tXaULVsN2NquTM6HHc2eoV3nUgaP28iumabKqyouSgLX5NoE48IS/RqMM1J3
	 KGXLz9NlYXs9FBJDIJqqNn7sw0ox3IGQgOBoaQgPcimsZI0w6lGpm26hYoTxsJpG+68KX
	 oMBRS2BPZG6MfsM9ierTqEo5k+8hTaXH6r0Qpn2dBHcjElOWj0cB1tmFoL04C8HnymA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=iekE68HP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.37
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013037.outbound.protection.outlook.com [40.107.159.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4759F606A321
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 17:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4759F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=iekE68HP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcMlXykLxv8MRwJLcsyDmXxlrzQrRt4PlcgIgOReGSWXV7FFWdjISfFFl2C3GT7It3i8U2v1sOD9ljXHFxoXXqToezJ/mukOzlOIg6Dsdzqbwmqxi/ZK3Wb2d19mlxVHtYyBQzFNGegK7kXj81ndv21qjI/9UEIftBrFVbnd0qWOsA0cVSM7ewA4BeZaGw1F7F/ztm60F68/hPou6q/PuDJr14ge+gyG06Hnr75YM8e7TKn8hk0JSaZnTYaCtuq3ZjfeY88GXesbYNgSXkWZYEG2twsodrqFnZk5VPyeb2gckIdAYeQVzKEmud46quHruKMD251jgyaSu34Ty0Joiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jx7Ph0eMdBzZ/8yol8Si1xkApW7Jgsz7SRod0EJRTaU=;
 b=xtCUOaU0malmWAaF/sA5ijOIAsGgLnPYkVe6XRd8tKDhtJUvgfOiw8qHcfh6va6HhgaokXINXBXfuZEHsFnRcUDOeX7Tyr25cB+gzVRefPi2RVZUe6fqeSh6acAvxj1l9vX/NE5wLaSBEVHI4LMdDaRdDF7qR7EzFcybSTa2UQYjaIF/p13Jl7iPjzangfc/kbLeJm+xPvc9PNeGIFQuI6XAfUu8VJPR4DWkbS2IKdHCslQykbmo3rOpB/a7e8VddDA1N/2eD7dJI/snf+iXPaGDZ8+4rUkdTBELHT6hBHYGjRXkdJC/8xOiC16NpiYf0BveK51IdSs52DhaWEuu4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jx7Ph0eMdBzZ/8yol8Si1xkApW7Jgsz7SRod0EJRTaU=;
 b=iekE68HPSF48Pj/p4iBiZv1/MCvFfq3jxcrqb4FUNij19atvG6nMosP3ANuVzNW/KguBf+p9fuP7N/zQ76S4Vll7V5w0sL02t0UL3gGNk+XmRA+x5U7z73I/n/S6d52V1Zeda2gA6oscOxqw4ihKPAFgH14hhWE+duxKlgvWeGowjbtAK5TxWPk8Og6zpA+D51roiFnMl/vBvSTXOUg3NvWtX/4m9TaTcmmwI8mAAiHqpCFvSm0i+/83Tjl63MOVvYuSu8K0o2OPNHq4DDOUM4m4aSyFLGvAqjyxTl/5srl+QW4AKdFEGut8BflaRQC7qD9NymHnw6aA2pU0YO/NFA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VE1PR04MB7472.eurprd04.prod.outlook.com (2603:10a6:800:1b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 17:29:30 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 17:29:30 +0000
Date: Mon, 23 Nov 2026 11:29:22 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Martin =?utf-8?B?VMWvbWE=?= <tumic@gpxsee.org>
Cc: Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Martin =?utf-8?B?VMWvbWE=?= <martin.tuma@digiteqautomotive.com>
Subject: Re: [PATCH v4 1/1] dmaengine: xilinx: xdma: Fix broken PM
 suspend/resume
Message-ID: <awR38q5pZk5DKHZf@SMW015318>
References: <20261123122236.5460-1-tumic@gpxsee.org>
 <20261123122236.5460-2-tumic@gpxsee.org>
 <awRlXmBFmE8R82qv@SMW015318>
 <7285f4da-c5c7-4077-b6cd-bc7921ab04a1@gpxsee.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7285f4da-c5c7-4077-b6cd-bc7921ab04a1@gpxsee.org>
X-ClientProxiedBy: PH8P220CA0052.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::6) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VE1PR04MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: 427e3059-823a-406c-1677-08df498754e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|366016|376014|7416014|261102123227099003|261102124227099003|261028144727099003|261021121427099003|261021123027099003|261022075727099003|261022105027099003|261026121527099003|11063799006|5023799004|261026140227099003|4143699003|56012099006|10067099003|22082099003|18002099003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	TohSRyLohd9dWeM/UHbD6TAZKftHzRWA5vvnXW1L4p6fcxwb8R8haWYtD9qvYQgQHpUtcpQ0yrjf+lSe5+6A73GxFxvHCyiYw+OH20FNK99Ou5wZn1NNZ1Mg0nEptcTu8p4pnA6f8VS+bO2xDaU2iNENxyyD8QeYjGL5LISv0FKh6vpX2uodzaJ1D6Rb7nIcQsiB/ICln34VGCZ7Lk+MitfCzlE9BQI4z+uJpthtzblnASXaQp/1V4dC+JVQ1RpySddoTaGAqX8hXqIepGi7wZvdBMLmb0QSnl5e/yOv2iMfdCRa8p/FsbVAvRUyzaejQbhfPtVF6oanPVmQ+G4hvjeG8/CKc7HVT8qx9bcK6vwN509I/Ppqdi3G3utBd1srcIieNKMO53/ORZzukfHBOALFC4dGTkjkOsMew97tq9Ds7GHD9ad1jUO1x9sDSaPvQgbfBHU5NY3uJVI0jTGv6eWvwf3XrWYKZLmNUhr7uIpz1tpQwl9ZGIRBmk8BlcO7ddDW9DbxxBo4U4YEvTz8VPSErXIf45J5eCrV6c6bRyiKqM/UnN0bTrqnCYJwi59sozZUvojAqsjzy/4ZZ7HygTY/8mgZ1j2cWivYpxJ3NLSsvC9/ghpgMVYYDm7rtKGFFZuzAvr1T9Oixf37bKodxNBWI/60RJlzfSG5Qw7ymQE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(366016)(376014)(7416014)(261102123227099003)(261102124227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(261026121527099003)(11063799006)(5023799004)(261026140227099003)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qk0xOWpUQ2UxVkxMZ0ZCR1FzTnpwVyswTHdjSjlHaml0dElpcElQckkyWEpk?=
 =?utf-8?B?VWF1QklKNitFVDdHMDd0NzlPcER0WnZvWGM3Z01MY3kzYkZJSUtZUkNYenND?=
 =?utf-8?B?TjFBOVBERk90Y1ZZdkdOQjIyOWZxdEhOem51bk5kRFo3N3pNMU8yakxsYU9W?=
 =?utf-8?B?MS9OV1ZPY3IydlVkWlRGU1M4R0l3bzJxSjIrVHMvaGRZMmo5S2JyUnkxSnRB?=
 =?utf-8?B?b204N2d2dUVUaXNPcEZxa3p5b09ZdWRTNFRwaURxOVdYeW0yWmpucEttWGpE?=
 =?utf-8?B?bk5IMmxGUGkrZ3AzdGVvRlpCTERTbjQyeFNVNU5GK0h2eTEzYUpBSElWODZK?=
 =?utf-8?B?UDBwVEFFTDEzTlVDWkVQNVBOcllSK3UreHhjNmdmR3dJRmk2aEgyMDN2K3BV?=
 =?utf-8?B?NVgwVE1NUzZNTmtHejJIcVZsdWZCcS9ONlJIcmkwQTVzVlZUN1M3akVtTXF6?=
 =?utf-8?B?MHdvSENzZWtodlk5aEtoZmlRZ1FCTTh6YzUrRDYzWWg5THhJZmEwRFFxd3R1?=
 =?utf-8?B?b2puQlR2YlhRend5WGVBaHZ6MWpyNmgwdVQ1MGpOaU9YQzlwdVA5dzJvTGVR?=
 =?utf-8?B?bG9EN2gvM2J4RW5PdE0wY2tSeEZleUE5Snh4bGZkTHYveDljSnNpT0RQL2Zu?=
 =?utf-8?B?OGpGVmQwN0MycnpWNERkUHkzQ25LbGZxaTcxUC9MdURqR3hDSDhySGZFMmcw?=
 =?utf-8?B?V3VpdnozWEJiV1B1OXh6dzVqRXRVUXdYMXpLaDNUK1l2UGVEcEhYZU5pU1JC?=
 =?utf-8?B?WGlQYzBNTFlyWU13Rmd0K2ZEQk9NSklDWHhrS2pqczR5dFA0T2t3R0hZczZZ?=
 =?utf-8?B?ZjlKMS9Vcnd3RXAwR213aU1tTTJOUU5LaG1SYUtsc3FlSlBSaGxCQTBnUDZ6?=
 =?utf-8?B?TC9DQjEyVG9kcUZ4T2dzWVlkTGlycWQyWC9lQ3lsQlZheStwKy9DVjZ1Q0h4?=
 =?utf-8?B?Mk9MMVJhWVc2TXR0TlBwNzZoa1g3V2hxN3lJRFFTK05icndmRnpEeFpXU3VI?=
 =?utf-8?B?MkVrWjgxelNUMUttb1ZvNUF3cnp0R3E4K1QzUEZWVU5iQ3ZmdkRXNXFNKzdv?=
 =?utf-8?B?OGQvdFh5RUxNRktqL1QxRGdDdzcvSlR3Wm5VcS9Jbnh6ME9uQUlHY1pDekgz?=
 =?utf-8?B?QVBpaTdjckcyZ1ZiTlF2RDN5V0RmYlhDSEQ0TTl2WG9LaTBmdDRjdkZ5bGZZ?=
 =?utf-8?B?SlBZSTNXOHB4ODZDNGl4N0ludkQ0NkZOMS9EcUliaDZiTWpnVWd2QnFVTmx2?=
 =?utf-8?B?WThHRytjQkZoTlFsTkFyS1RlRW45ZXE2akQ2NW8wNnJWWkVhdUZRZVhPQkZH?=
 =?utf-8?B?MWpZZ0RkVUdqV21NS2pZbHlNdUZxdEVXVVRzVGVyTjdoMTNScDE2WE41eXBy?=
 =?utf-8?B?UkpEdm9TVXlpYUdOSmlBYW45R1pHclFBVm82RlBSdHAwdDBNQ3hvWEVjT20r?=
 =?utf-8?B?SmZSTTh6ZVd5MGExMk9KZENNNzJOWnVCREpGckhaNXN3WTUxb0NyUXBJbjky?=
 =?utf-8?B?dUI5VmY1a1ZiLzFOYjBFazFGcHpRNGg3eW84WjhyMUc0QXBTVjJqaDl4U2Jk?=
 =?utf-8?B?WWF5WDB1U0pSWmxndWIwVVVpTkxVN2pjV051eU1sWTZOOWZuVWd2cDhHMy9P?=
 =?utf-8?B?TGRhUWxSRGZLZmZ1RUpWVzFSWURlb3dlSWluQjFOZjF2akF1aGtMU1FVbUpq?=
 =?utf-8?B?bkxObjhOYWJZQU5DaGt3ZlRwYXBlT2RXWkJxaHJhS0hObnVuSEd0V0l6ZXJN?=
 =?utf-8?B?N0lWTlp4R3ZxZCtBbWJYWWx1TUN2VWEvTlNRdG9ZdHN0TW9qaEtkejFBZDFm?=
 =?utf-8?B?a1BTU2FUVzRRSGNtdWw2Z2k5K0hQc0RUNlBxcUU1UUI2a0xkaGloeDQzM3Nj?=
 =?utf-8?B?VVV6OU1nMDJsSVBMY3NRTXlJQm9UWlMxMW9WNFlTRVd1aUVUT2RwTHA1TUFu?=
 =?utf-8?B?TUkrRGliZk9DTTNrZXJ4bjJ5cHdsNjRZanFWNi9kcGswTDIwdWZIKzlJQ2Vy?=
 =?utf-8?B?SndNMkEyQnNZeWtpSUVtUXBubXh2MTNCc1gyUkg2WFJkTXJJcjRyWi8rNUgr?=
 =?utf-8?B?Y1FxYXE3OGt0Q0p4OFZMWisvNnFYRjVJMEdFZkFVNVIzWUxLbnA4a2k3dEVT?=
 =?utf-8?B?bmVwMG1zN1h6Z0QyTUZiQi9rdkhOR0xpQllKVlROMmN2K2RBNjhESGpsMm1o?=
 =?utf-8?B?eVYwaW9NTGNZQkxCUTJsenNCOVZVOW53bXJURldKOUx6SUw3N1FhRWdMMVlG?=
 =?utf-8?B?cXNVcGE0a3FIMC9yak1TekNCY3VMMGZBZm9JSVN5a0o0YXlndFVzdnFud0FC?=
 =?utf-8?B?QThIbDc0MXhtSUVVR25tcXZBYVgwME54V3ExSFVQQWhvOWFiZXBvVVA5TytL?=
 =?utf-8?Q?PS5ddNzLD9JbNyNUxwpmxXIImDQHO0bQIWeAf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 427e3059-823a-406c-1677-08df498754e6
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:29:30.5633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Mk6emLH0rgLth8zrPigsFU2YjolpkSc/znxjy6dPzx6dVi+CzZacmnlkvWZBEnqUkklMLYti5lWgKJe5+S+6FTS3PEQs4GAKUGBwrHtthLL5k0h+DJipDC7wx1/7lFr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7472

On Mon, Nov 23, 2026 at 05:33:01PM +0100, Martin Tůma wrote:
> On 11/23/26 5:10 PM, Frank Li wrote:
> > On Mon, Nov 23, 2026 at 01:22:36PM +0100, tumic@gpxsee.org wrote:
> > > From: Martin Tůma <martin.tuma@digiteqautomotive.com>
> > >
> > > Add the missing PM suspend/resume callbacks that properly reconfigure
> > > the XDMA HW on PCIe suspend/resume.
> >
> >
> > Can you talk about more about why need reconfigure the XDMA HW? Does it
> > power lost?
> >
>
> Yes, XDMA is a DMA controller used on PCIe cards. When the OS goes to
> suspend, it powers off the complete PCIe bus and as a result the XDMA HW
> completely looses all the configuration set up in probe(). On resume, the HW
> must be reconfigured, otherwise you end up with a broken, iresponsible PCIe
> card when the system wakes up.

Add such information in commit message, not all PCIe card lost power during
suspend. Not all system support D3 Cold. You'd better check one register
to decide if really power off.

Frank

>
> M.
>
> > Frank
> >
> > >
> > > Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
> > > ---
> > >   drivers/dma/xilinx/xdma.c | 146 ++++++++++++++++++++++++++++++++------
> > >   1 file changed, 123 insertions(+), 23 deletions(-)
> > >
> > > diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
> > > index 9d827c9a1267..fade49eaf1a8 100644
> > > --- a/drivers/dma/xilinx/xdma.c
> > > +++ b/drivers/dma/xilinx/xdma.c
> > > @@ -123,6 +123,7 @@ struct xdma_desc {
> > >    * @irq_start: Start IRQ assigned to device
> > >    * @irq_num: Number of IRQ assigned to device
> > >    * @status: Initialization status
> > > + * @usr_irq_mask: User IRQ mask for PM suspend/resume
> > >    */
> > >   struct xdma_device {
> > >   	struct platform_device	*pdev;
> > > @@ -135,6 +136,7 @@ struct xdma_device {
> > >   	u32			irq_start;
> > >   	u32			irq_num;
> > >   	u32			status;
> > > +	u32			usr_irq_mask;
> > >   };
> > >
> > >   #define xdma_err(xdev, fmt, args...)					\
> > > @@ -398,6 +400,26 @@ static int xdma_xfer_stop(struct xdma_chan *xchan)
> > >   			    CHAN_CTRL_RUN_STOP);
> > >   }
> > >
> > > +/**
> > > + * xdma_reconfig_channels - Reconfigure DMA channels
> > > + * @chans: channels configuration
> > > + * @chan_num: number of channels
> > > + */
> > > +static int xdma_reconfig_channels(struct xdma_chan *chans,
> > > +				  u32 chan_num)
> > > +{
> > > +	int i, ret;
> > > +
> > > +	for (i = 0; i < chan_num; i++) {
> > > +		/* init channel hardware */
> > > +		ret = xdma_channel_init(&chans[i]);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   /**
> > >    * xdma_alloc_channels - Detect and allocate DMA channels
> > >    * @xdev: DMA device pointer
> > > @@ -1018,6 +1040,55 @@ static int xdma_set_vector_reg(struct xdma_device *xdev, u32 vec_tbl_start,
> > >   	return 0;
> > >   }
> > >
> > > +/**
> > > + * xdma_irq_config - Configure IRQs
> > > + * @xdev: DMA device pointer
> > > + */
> > > +static int xdma_irq_config(struct xdma_device *xdev)
> > > +{
> > > +	u32 user_irq_start;
> > > +	int ret;
> > > +
> > > +	/* configure hardware IRQ registers */
> > > +	ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
> > > +				  XDMA_CHAN_NUM(xdev));
> > > +	if (ret) {
> > > +		xdma_err(xdev, "failed to set channel vectors: %d", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	/* configure user IRQ registers if needed */
> > > +	user_irq_start = XDMA_CHAN_NUM(xdev);
> > > +	if (xdev->irq_num > user_irq_start) {
> > > +		ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
> > > +					  user_irq_start,
> > > +					  xdev->irq_num - user_irq_start);
> > > +		if (ret) {
> > > +			xdma_err(xdev, "failed to set user vectors: %d", ret);
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	/* enable channels interrupts */
> > > +	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
> > > +	if (ret) {
> > > +		xdma_err(xdev, "failed to enable channel IRQs: %d", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	/* enable user interrupts if needed */
> > > +	if (xdev->irq_num > user_irq_start) {
> > > +		ret = regmap_write(xdev->rmap, XDMA_IRQ_USER_INT_EN_W1S,
> > > +				   xdev->usr_irq_mask);
> > > +		if (ret) {
> > > +			xdma_err(xdev, "failed to enable user IRQs: %d", ret);
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   /**
> > >    * xdma_irq_init - initialize IRQs
> > >    * @xdev: DMA device pointer
> > > @@ -1025,7 +1096,6 @@ static int xdma_set_vector_reg(struct xdma_device *xdev, u32 vec_tbl_start,
> > >   static int xdma_irq_init(struct xdma_device *xdev)
> > >   {
> > >   	u32 irq = xdev->irq_start;
> > > -	u32 user_irq_start;
> > >   	int i, j, ret;
> > >
> > >   	/* return failure if there are not enough IRQs */
> > > @@ -1060,28 +1130,8 @@ static int xdma_irq_init(struct xdma_device *xdev)
> > >   		irq++;
> > >   	}
> > >
> > > -	/* config hardware IRQ registers */
> > > -	ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
> > > -				  XDMA_CHAN_NUM(xdev));
> > > -	if (ret) {
> > > -		xdma_err(xdev, "failed to set channel vectors: %d", ret);
> > > -		goto failed_init_c2h;
> > > -	}
> > > -
> > > -	/* config user IRQ registers if needed */
> > > -	user_irq_start = XDMA_CHAN_NUM(xdev);
> > > -	if (xdev->irq_num > user_irq_start) {
> > > -		ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
> > > -					  user_irq_start,
> > > -					  xdev->irq_num - user_irq_start);
> > > -		if (ret) {
> > > -			xdma_err(xdev, "failed to set user vectors: %d", ret);
> > > -			goto failed_init_c2h;
> > > -		}
> > > -	}
> > > -
> > > -	/* enable interrupt */
> > > -	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
> > > +	/* configure all HW IRQ registers */
> > > +	ret = xdma_irq_config(xdev);
> > >   	if (ret)
> > >   		goto failed_init_c2h;
> > >
> > > @@ -1297,15 +1347,65 @@ static int xdma_probe(struct platform_device *pdev)
> > >   	return ret;
> > >   }
> > >
> > > +/**
> > > + * xdma_suspend - PM suspend callback
> > > + * @dev: XDMA device pointer
> > > + */
> > > +static int xdma_suspend(struct device *dev)
> > > +{
> > > +	struct xdma_device *xdev = dev_get_drvdata(dev);
> > > +	int ret;
> > > +
> > > +	ret = regmap_read(xdev->rmap, XDMA_IRQ_USER_INT_EN,
> > > +			  &xdev->usr_irq_mask);
> > > +	if (ret) {
> > > +		xdma_err(xdev, "User IRQ vector backup failed: %d", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1C, ~0);
> > > +	if (ret)
> > > +		xdma_err(xdev, "DMA channels IRQ disable failed: %d", ret);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +/**
> > > + * xdma_resume - PM resume callback
> > > + * @dev: XDMA device pointer
> > > + */
> > > +static int xdma_resume(struct device *dev)
> > > +{
> > > +	struct xdma_device *xdev = dev_get_drvdata(dev);
> > > +	int ret;
> > > +
> > > +	ret = xdma_reconfig_channels(xdev->h2c_chans, xdev->h2c_chan_num);
> > > +	if (ret) {
> > > +		xdma_err(xdev, "H2C channels reconfiguration failed: %d", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = xdma_reconfig_channels(xdev->c2h_chans, xdev->c2h_chan_num);
> > > +	if (ret) {
> > > +		xdma_err(xdev, "C2H channels reconfiguration failed: %d", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	return xdma_irq_config(xdev);
> > > +}
> > > +
> > >   static const struct platform_device_id xdma_id_table[] = {
> > >   	{ "xdma", 0},
> > >   	{ },
> > >   };
> > >   MODULE_DEVICE_TABLE(platform, xdma_id_table);
> > >
> > > +static DEFINE_NOIRQ_DEV_PM_OPS(xdma_dev_pm_ops, xdma_suspend, xdma_resume);
> > > +
> > >   static struct platform_driver xdma_driver = {
> > >   	.driver		= {
> > >   		.name = "xdma",
> > > +		.pm = pm_sleep_ptr(&xdma_dev_pm_ops),
> > >   	},
> > >   	.id_table	= xdma_id_table,
> > >   	.probe		= xdma_probe,
> > > --
> > > 2.56.1
> > >
>
