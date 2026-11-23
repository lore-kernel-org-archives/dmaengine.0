Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795397276;
	b=bxt6di4s/EP3fMPYRetCidY64fXXOqPwU7o/LuypQVweLB2iHNtuqqQzZcZJLnHRH51h
	 eGU4QKig2sr3Brs6HslI26ERUAeouyPcvIieiGR4mGJbnAGpk1/sqUAipB612+9uEV0ye
	 cU6VZxD3Ky8DDTAqb5KjpVCY3ah7/KxlBApBPRfKAfJpziTGhCvOjeAs3egL2HtceiJuJ
	 N09DMefrX2Sgsd48cn3hfF80wCGjj46+IPfGblo4lyvy6LRCNu15OIPkczwSbfNOljYac
	 FkyZrGKn/3vWvTHO6mWcshyCo7LkDkUHuN4bQabAGlJe84f5ggE1f22WEnd4rEMxVlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397276;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=0baG+wnYLd6B+U/fsFnajJ/HD1K5XudUMtz1bCyvyEY=;
	b=BXOrHUo5cRzP5aA/Ihc8joScSzrmVsQEjmCwzYnDCrA58fI5AWh2vEX9NRMHI4Kn6yjO
	 c13H3hDT6PaLWTL/H2XWJ/nQY53imEyPKES8+0S0sw2h9jY1LipzZx3aWHMn3l//S/07c
	 444qFLtYUv5HqVn0FFbv4iV1ZUvk8iVgHLI+aNjXOspevgi7ckOZbVfGkPOXPfpaPzScQ
	 RlSvRS6s78GtYap+uo6ebr32y3/VmWFJvTp+G5ytnlLH1H67t5hz/cWUCdMlV05wFQ1+R
	 ooUGG9rrrNwXuQGC7QIt5PXAmRBKXIUYoWWxCz8ahjhNAj66PehmN0jSkfDwPHGwNsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ovpUooqJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.52
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012052.outbound.protection.outlook.com [52.101.66.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5286606A31A
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 01:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5286606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ovpUooqJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqhMLhN0kQTsq9mvkrCM1IZGbqGKTIgqjhwXUYxZCpGYrtJffGW1k2njXwSWBy0GQzU8NKdg6p2nCiQmEF7ZKqPvCb6JpNJu+ZzYaYavfsQmO/9TCCvE5L2TsRfeOpMQ04md3qj3kxRyA3H7yZ5HtfYINpupa0VqThq7AF/6Tq4PlZVn2crRbGvS0sZBrlgG8wl/7wjyCfGjapN64i969anqkMNltP4/PeKfmZAAbj56KlB3JHOHVr1QghaHk9K108qSDPQ8rqmEnb2WYhHzq/XEN6dQrjxRN0WJAsRW2KPjmPOPO2DmWAVRg3Ws9bO48luP4O/1Fm0cyLVziVdUag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0baG+wnYLd6B+U/fsFnajJ/HD1K5XudUMtz1bCyvyEY=;
 b=Ke1TP3XB92nR+zXl7itNcMt0BO6whY+uUdAei9Nt4Qt0dv+IqyEioGxns4hl0LaJV4ETf7/91ORqVkEZh5kQkjj6ay01FrCCLL11uft3XCDlzdJaTWdNMIsmfPdIGXjw4QyGMvZLKOD6Bp00SHVRcYMtyImmdz/WsqrJ5j4aXhE27ZNMZi5KGUn7BZWkksWEVNMoERlwSWAMCkNfMismJJ13ftGL3cq8TWhCG/9xJh9HDKUszNXN0lNRbNBxNLC5Dvkj+goIkMmWC229FOTrRI1DDUDjhGelgul9iknM99hrm6La9vSFdOnjnUgy+Twvptwr/LHFOzPQ2i/dISuSSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0baG+wnYLd6B+U/fsFnajJ/HD1K5XudUMtz1bCyvyEY=;
 b=ovpUooqJGE5WiFF9Yrfgwhk/DxZCmnP6CAFIEPV3/n2+A0j4gnkoxWERr4TKQfXGwQG4Pp1Pi6e2S2fh6NHcdYRzvgALOXt/sVLhFWHKI3TXQJHdno+cjLLCF8wUjb/QoiR/iE1XJdOk+5zIlAVzBAzFwzRErmcQIrRB3o9MljISrpJ5kzd1mXhdG/2a0PqskFg7S/EJUehipXxlWXNZNTd6HfiJvVNKzNwr+lOyU6YM0vCLfVlpPXcMjDomspkS72C/3Dx8L8ZJKdl3sdN6E5RPaejf7JpN6/MKVlxG3HCDwCHNM+k9/rLkGK+YZ+KkTt9QkdmtkzbZ5GT5PGCNuA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MA9PR04MB148417.eurprd04.prod.outlook.com (2603:10a6:250:10a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 01:27:53 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 01:27:52 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/3] dmaengine: edma: fix vchan cleanup and improvement
Date: Mon, 23 Nov 2026 09:32:52 +0800
Message-Id: <20261123-edma-fixes-v1-0-59d5da374a16@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMWXA2sC/yXMSw5AMBAG4KvIrDXRFsFVxKJqMBKPdBCJ9O6K5
 Zf/cQOjI2SoohscnsS0LgEyjsCOZhlQUBcMKlG5lEoL7GYjerqQRZGWWmU6l9oaCIPN4ReEft3
 85qOd0O7vA3j/AKY58qBuAAAA
X-Change-ID: 20261123-edma-fixes-8493253613ca
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI1PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|MA9PR04MB148417:EE_
X-MS-Office365-Filtering-Correlation-Id: 57660421-9b14-4670-734c-08df4900fe4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|366016|376014|261026140227099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|11063799006|56012099006|10067099003|260925022911599003|260925021911599003|260925021311599003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cPU76q+9TV22e+1LSyFbr+G5Gg+wMuMjfKcguOTcvqqs07kxormM+stH0l18Aaoi/0yGsSOxsxKJqZjXp8oAepxC0K3hkIE1/8yGgpEf2UHZUj5IAFY/5p5xnJRLdPd3xN0FYD93AXOPjrbdBf4T35bVJyb8x+c8Q9jPaI5vMn9tGRJ759W/8N44oaLFMTu0QOHf6jF0TtBlJfMAN0NMVYIzlWnVSOU3zTl+AjuVbGCYYWz6wWITtfL6H+Vr1d1sdA+6B+LHDkDKkdR7elK7KBEpaWjqV2Cu2Ej6ibt+WTM2nId47eVRgbSHVo3y3aZnVgL67N9/XRT+RJcoXS4E1uO+ZzWTIZ0L1FKUbGhgrIZmj8bW7VHZkuHJZ0dlbCj30d/q8hovcwQZhSGjwNw1lXya51mspG/0LhMIhk7oef7n4ukQpIaENsI2b79dvpPVLQ8C2hmQYj0BXlveXAwxLxA0zl1E15eNSD3sGN3NorgtxdBe5pAxGZV8rwhVS9+ZCICPrA7OszwisMWl2JCxxN3s3vEISQoJrilVgEU4d3E80AraApWeaEG60BcLs2cgrVMwIWoSlzBxTC3uO8YwhahntxVwOOpseuVRedEzlUk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(366016)(376014)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0VIdzc0TzJHR29IRWN2YTdnZGlWbGI0YmtYM0tYaXRQNmhWOEhReUErUkxr?=
 =?utf-8?B?Ukt0V3hkWVRkUTQxdFVONHNMWFlya0hkUGI5ek8vL1NKa0ExclFXNHRXR3dJ?=
 =?utf-8?B?WU5USnVxazBEL0ZYb1YyWTVjZ20xcVRPQ1UwQlNZQi95NGZlR092ak9SSENt?=
 =?utf-8?B?UHgzM3d4TkdJRG13UDBBZnhWTHF2WVFsTmNlWlIrSWxlaDdYdmpOSGZDaWJP?=
 =?utf-8?B?dVJEeUoydzlJZXpmbXducmJhOUdRUFN5US9PcU1YbURJdXF1L2t4ZEpQWG9Z?=
 =?utf-8?B?eFZCY21CR1g3TXRVVTRXOGVNN0xFNDVZZEYyTEMyRWVBT2hUTWJ2RTNSWE9Z?=
 =?utf-8?B?Y0NMQWZVOGpacWx6TTVPemFmZ3A4L0d4eklzbzBraFVMWUVMQ1NVblltMnht?=
 =?utf-8?B?TDZac0lBd3FyRE1Zd2lDRXpsaXBuT1h6ZFRFd0w1RG93V0pPSnBJYjFuaGRT?=
 =?utf-8?B?RFg4UThXUy8wdncwYnU1Mi9qT3NoVVJwZ0ZUeE0xaEE0Ry9lQ2c4YmFKaDNP?=
 =?utf-8?B?SEdTUFdGUmdrZzQ5SW9HYWVwOXI0ZHRhc21MQmp4clpVSFZmb2ZLUlp1ZTli?=
 =?utf-8?B?QitqTUhtb2JlREFqM0x4Mm0zWFp6Y3pKRTBWeEk3NXhvVGExb0R1YkxKYjFT?=
 =?utf-8?B?aWRGVXNEdFBjYWZMRklCSXROL2l6emR6WkdzMWNVdFZWVmliMVF3YnVGbE12?=
 =?utf-8?B?ZGRJczJndkczTVlLdmFlNlkzd1FkSUJJTUxOT21SblB5RHU3MzJRVEVyWHdC?=
 =?utf-8?B?ZFFTSUc5cndKWjdlOGt4YXZGWjlqL3F6Smcxd1Bjb1NmRytrczY1bHd3a2dE?=
 =?utf-8?B?d0V5SHRCcTdKR0VGL05JMi9kU0g0K1Vxa2hvRGdSMjQvM2hyMHRKR3dXK1Zu?=
 =?utf-8?B?TzV0L0pqS2NTdE54TnRaNWVPTnFzSXVET3RtcmhCcVdVaWpvWHRWanJzMmJW?=
 =?utf-8?B?aml4ZUoyNUMrWFQ1VTlFVWpXWXZENFduUFc4b3ZINUVmamorUDNBMnlid0Ir?=
 =?utf-8?B?eFBpbzBEMzBOMUg1NnRma2I5UG9MdVdxVWpsKzJmc2VVb2htNmhTLzZzQ3Rr?=
 =?utf-8?B?Q1kwYlRyUDdVZ3E5MmxoVWJJSE9xSjRCNzZUSW9Fa2gyeEU0L3hLZzVvaWFs?=
 =?utf-8?B?WFZTY3ZEbFllcjBWN3JpcGs3N2VDcjBtV0dZbGgxem1zdWRzUHBYNmEvRlRI?=
 =?utf-8?B?OFluRzY0bU51aXBXVnpjdnBLSjRqczI4TmI4dG85ejh4UFFsNCtBeWhmUGtL?=
 =?utf-8?B?QXpHRmF2OWtrR2NMNERrY1lEQXpob1lZWklpeFIza0p6b2MzN1RTQ25sNlFR?=
 =?utf-8?B?YmdrRmszWkx4bDlkVG9tbnhCSVQwQzBKU29ja1c1Vkk0KzV3WEU5eFl6WlhU?=
 =?utf-8?B?TnFMUHd3T1h4cEkySDNUenFwUWN6TkpIeVRVNllJVFlWRXFFbDh2WXJKd002?=
 =?utf-8?B?TVY1emhnYVBSaDlYdngzb2x5T25xaWVHdlNqd0hoekpJeXlmNW13V3U5UURB?=
 =?utf-8?B?Z0l2bGRnV2FVajkzZWxNclFoVlNlRTVEV1MvZk1TUkVWZXVkSjNLczlmV1VF?=
 =?utf-8?B?S3NVYUw3a05NUnpqQnNZdHFVQ2Vta0h2UUEwK2VMYUJISFU0Nmp1SFZqOU1F?=
 =?utf-8?B?Vk9OeFNtTHBqVGFUam9RUnpRMUdJUUdhVGV3c0JOdHN0VDlIZnVLWFg0eHZS?=
 =?utf-8?B?dExNTzBQVzhyZG9ZdC9rK3cxTlNSN2I2TDdZY0pIa1liZTNUMzJlVGpRVERE?=
 =?utf-8?B?VHlMeFRtN05Sdzg3MFVDYUp5RTA3cW1JMkZQVUd3N2lUQ0NZWmRibkNFNW9S?=
 =?utf-8?B?Mk5lMklvaWQvVEhNYUg1aW95Rkw1NGx6MWpPeUtpUy9CRDJqeFNOWnVHK2Vx?=
 =?utf-8?B?V0h6RXZxYkVVbVJWYlVMb0tLbVBNd3pjWVRCa1lVaWtRYXkvbEdUL2NTTkEz?=
 =?utf-8?B?QndvQ2hmWmNLdFJjM3Z4SkgxZFVWWDlYdjQxcnpZcG4xaEtJaWk1bTlneVgx?=
 =?utf-8?B?ZkRzTFA3aVU2VHJaYkdOekMrTVdVS0M2UHNkNE1Vc0N4Y0VHT3JsNFdWTlRI?=
 =?utf-8?B?WnNycmFyUXBGMlNKSzNNTklRRkxSOU9LczBjazlybXVhOGhLQ3dSMm9XTU9J?=
 =?utf-8?B?QjBCdnRrUXpCTHdPbzlkRnhTalpvMEdXNk1CZEZvNVQ4N0VOK2VPdVJVYll4?=
 =?utf-8?B?OG5RMXNaRFlYeFR5VHF2REcxYmphb2ZSbWJoWjhGU0w4WUdMM0JzU0JQa3lj?=
 =?utf-8?B?YW0vZk5yOXV3NGNPZVAyYnFPRFpzeENRMGNBbGRBRUJnSlVya2VySjQrM0h6?=
 =?utf-8?B?TElSWHlUQ3dlcGhETDlzQk95RURJUmZndHFtQ05VRjdwYTBHZUdPZEVCZ3h0?=
 =?utf-8?Q?MYVemDxQmUMkwE3U71aorrYPNL2m8z22z6EYZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57660421-9b14-4670-734c-08df4900fe4d
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 01:27:52.6465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s0y/hWCXXkV9fgtZN3yrzIR05WGctcKKrjo0J523gQGbTk/WqX/LWqNxASUEy19IvvccjF0NzPFGJCJ8V/VRjd4c8WZIxCRWtB/rhIa1WkURLuIj6ZQEguQz/yXf3M4V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA9PR04MB148417

To avoid delaying the fix because of the iommu discussion [1], I separate three
patches that not relavant to iommu from patchset [2].

Patch 1 is a fix, patch 2,3 are for cleanup.

All three patches have been reviewed by Frank Li. There might be a sashiko
warning about BIT_ULL in patch 2, that is false alarm, ignore it.

Detailed information could be found in each patch commit log.

[1] https://lore.kernel.org/all/20261117180945.GE2606445@ziepe.ca/
[2]https://lore.kernel.org/all/20261116-edma-iommu-v3-v7-0-32794ba8efbf@nxp.com/

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (3):
      dmaengine: fsl-edma: unregister channels before vchan cleanup
      dmaengine: fsl-edma: use BIT_ULL for 64-bit channel mask
      dmaengine: fsl-edma: use dmaengine_get_dma_device()

 drivers/dma/fsl-edma-common.c | 10 +++++-----
 drivers/dma/fsl-edma-main.c   | 26 ++++++++++++++++++--------
 2 files changed, 23 insertions(+), 13 deletions(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261123-edma-fixes-8493253613ca

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

