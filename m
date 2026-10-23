Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792752912;
	b=xXHVIOJPw6tbae7Aj+O+wol4qhzxus6X6utJdnqd69I37M3AfV0zjrjeHX9VivA/dsNW
	 WF5n+DNgmXSHgO+65N70LXp25cgU6eXK6YcpZB/+WBwTSQfDpe1Kho2/gHpyM7JGCcJ2f
	 jDNtu4YXqo8E5KPWgFCsnnbfABkMs7mBCiKS/gSKKI8Qweo8TSTN5giPG6T3rEHKEddX8
	 gn39dhOsKIxxHLtR7gKry+1PtVUY/iTuqqLLpSHg/zAAjK4CiahuvmxyfLxPzQ4BS/iaB
	 NxAybblWxWdkLPzPjv3R87wCXu11kvipO2hVWosVWhf4Jjib4I6KahIu6yicqVYfG0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752912;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=zwEkspJ/i51x/wamK0BelFPQR/LMibfD6Q0e1bJXgzQ=;
	b=UhUGjrksqHuXuEzUmtieFqrxrps2GbOX/j5fq1GXtaC6VYvUTT3YSDLMQXTKZWkn7pa9
	 ig02C9Q4Fg5ysizkfRT2BlHN3K9EUb45p16NwxF4LXXUyXGbFwM1vPKxXGov6ZsWskrcQ
	 uGHfnHHMOGREZWpA4oxN251X+PuM+RDSDFMP4OtuPqdWRfN4WFTFDdy7yiMNzgDsSIJDc
	 7uMn9/Ax5JjoJntMCTJnBKzEjJWzBeI7Nrb+Vfzn7lp3Z3/XlFBcY9sdM1Zcs146j+BAu
	 3KloQBlPgFZO47tiIMYX1LQcL+GWvo4oCzVbjJtX0KCrHhqt7T8ZK8oESUX0FPehFvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="kpf6/WVD";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.10
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010010.outbound.protection.outlook.com [52.101.69.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2DB606A31F;
	Fri, 23 Oct 2026 10:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F2DB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kpf6/WVD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXAu79saVG2doC8axb1uxlxNGzCdMfO41Ti+pPdG90oobGy4CBsG4pOTdlq8NpC4qboupAhPJ63WZ9aEQ9hUuZq3P1MnMQ3MjXWcNqEIxwYFpvY2OohuQOqWRrtvdknXPwy07cZK/I+nS+yU4byIKopojgKo4dJlv42dVb6ddh1KNYgDpdSc0j7VvF0toq9zq56qDNP/D0wWnwXoIjiMsiKk5kf7lnbEQFagrQRpzLt2D3YDPkiS+77fK0sXNO1hbES0TptXKqoqnJ3tz6MM3hd7twgspLqyO3kfXrxvIyUn9ETRvIp/PxrKGJRPHZVqKR0pSFO7ezwvPvmnclWLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwEkspJ/i51x/wamK0BelFPQR/LMibfD6Q0e1bJXgzQ=;
 b=pWV1dxyO92HEtdLOadYJXYQweLkczc7GdEKZghhfxUS1mxuuOMMnGWvYO1qW9gBKXm1anqCSEggueaUWsEGl9TLSU5WuhgwyKySufncJkn4sHn7eQuHMX1yiv8GctPAzA3mgfPwQV05hZAj56vrDquwWyRfxmiDCy5MdQnOoPlkS64i1A5h646GF++vPzCaF+p6tXGt/agMgJiKf8k7XfWcihu7wVXjxRxInosAUUvX9Dqik6MJyG619xX1CIbNIIdlcMPJ6pZTm4HIBSk0X2myWX0Agc8Y1p3+ER0TOPLBQ44rziMcmDqlpyK/JvHXpvqDs/tsAE7Sv5/9ORKatrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwEkspJ/i51x/wamK0BelFPQR/LMibfD6Q0e1bJXgzQ=;
 b=kpf6/WVDheK7H1R9JLekYUzs1SAfuIk4b2oso/vBXJXfDNB0waGT6d/jB8OB0kHcSmSbwSkhGEat1v0M8ScfX6MXogsEKmiYr8goVu1Ggaj+fsm2KKIEWJcXZv2w/W9Ga+et2BjQBGdWEUD5oUqaDEc/RhT+kO4wbzRrKVZj/Mks+BaJoaEU8Zh9hbOk0EODAW6WoRcFPCW4PPMgbB9gaHTViqRbgBPaaWgWfpozj55I/rSmThXQ/PkJ5G8bKPhXoTKSljoeOQ0BsOIw6EkFBCoi9jaT44soySv3ILETjfn9JHWRioFKvb2ZHlJDWhcfrQcURMpHaLL9ca14pv1WvQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by GV4PR04MB955734.eurprd04.prod.outlook.com (2603:10a6:150:402::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 10:55:08 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 10:55:08 +0000
From: Joy Zou <joy.zou@oss.nxp.com>
Date: Fri, 23 Oct 2026 18:59:11 +0800
Subject: [PATCH v7 4/4] dmaengine: fsl-edma: add runtime suspend/resume
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-b4-edma-runtime-opt-mo-v7-4-418e53c5f9b7@oss.nxp.com>
References: <20261023-b4-edma-runtime-opt-mo-v7-0-418e53c5f9b7@oss.nxp.com>
In-Reply-To: <20261023-b4-edma-runtime-opt-mo-v7-0-418e53c5f9b7@oss.nxp.com>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: Joy Zou <joy.zou@oss.nxp.com>, Frank Li <Frank.Li@kernel.org>, 
 imx@lists.linux.dev, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5PR01CA0235.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::17) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|GV4PR04MB955734:EE_
X-MS-Office365-Filtering-Correlation-Id: cd8488e4-184c-4455-30df-08df30f41a64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|366016|1800799024|261021121427099003|6133799003|18002099003|10067099003|22082099003|261021123027099003|261009221227099003|261009221727099003|261009223327099003|11063799006|261009223027099003|261022105027099003|56012099006|261009220027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	npMChvRiPZoLeekBOZA9l+Tl6jt69qJX5qLxPRbY3xCQuRlHg3QlXFyTTpHarBvWDiA52ZTUlURKf4lXl72U1IVWfsfX4/31CqclBgyfSz5eVX6dFHOsa8q0ZFXgdLBJdsQvBxpxYtC+I4aMYWV03hMH54OjI/iGSdykS1BGMpwgqGYD6DlcrklpSf8jZ+zDzbbccyvN0/zyP06uF+4PK++mJQUpiBcyKNUpgasoywhqqLkNME8pAnorX6GqJkjAPc652QXLVNkQ+Zq14iBPriRv5B/BnPRbdxLZiJbH9jQDZ9oxgbGEGQiFvegoAnStnEilgpD+MI/RIAY34svUKYfTQoFx+/lhNN9CIetzcTKTdDy1M+6vLb7mvAbDCAih3Eng+7ciWSiAzepiQKi/FlUW3HGCgRMJaDB6AOb+3sy+i/nirOmykLYWu1He0cxm3q1hdWaZYR5eCOPsfviC42dx2Op01h1B7yLEeOp9MuH1Bbff6YUTJUtqg8v8YJ8UrcrYs/OSTzdc1eEZQ0chbSv/2jlFoN5hbvOPU+dIJG3swPfT+dCZEHA3s+9AlH+bt34M33qwi7snD0TXTWGdibCilo1vDPZLY+kxRrfg/c8TDGjWV6SWfI3+WwmmSprf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(366016)(1800799024)(261021121427099003)(6133799003)(18002099003)(10067099003)(22082099003)(261021123027099003)(261009221227099003)(261009221727099003)(261009223327099003)(11063799006)(261009223027099003)(261022105027099003)(56012099006)(261009220027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGxUODdQVXVJaUhrU0ZWano2bHEvWEFnNGRreXZldTF4cjlEQ0xYbnd3cUFR?=
 =?utf-8?B?SEI3TDdESW5ud2FZYmkwZUFadnJIM1Zsb3VpUmNSZFdmWm5XdGdYOUhsSkRj?=
 =?utf-8?B?b2l4d3pCQjZ2MWI0TlZCMmxja1N3VkdpOGU2OWwzY3kxUXhVSUJIcG1xNkNJ?=
 =?utf-8?B?STNrYlh3d1hZaVZkRS9yNzVDZDI4YnRyYWlRUGxWM1FidXBSZklnRk5mRzBL?=
 =?utf-8?B?Y09ZSGNTeWhmVUFrVm1uaU9RNzVCMFFKNEc4RjQ5WTZyNVNBdzBzZDJ6aDlm?=
 =?utf-8?B?ekJQVGRNVEpFNnlZb3pvN2g3S0YwZHpCOFRUL0dQU3RCOEFESWZST3VDWktN?=
 =?utf-8?B?QmZjYWg1M2FKYUhQWld4ZGJPTjFtdjZYcjZYWkl3ZzJvQ1VtWHVHUlU3a0pl?=
 =?utf-8?B?RzR2TUYvUlZiZS9PNDZ1MmR6endpOGF5QnBEZGZWbnNuclgySnFQYXljM1dH?=
 =?utf-8?B?ME1POFBSK010M0d1K1RtRmtjWEZHWlJxKzBqY0ppTmE2VHBxNFBNWEVoNmZC?=
 =?utf-8?B?ZG45MkxPZjE0WWNOOXlGTkp2b1Y2bU1ZZUxwNjk2cnZPVXFSWFovRXpwZ29F?=
 =?utf-8?B?SFUwYmlNcWRGNE5EU2Y5NEJkRVRkTzVCemJCU012OWFZUFZ5anRtN0kxZDNp?=
 =?utf-8?B?NG5EMDhCd3V6RUJwRXdITDg2cE96aFB4TDkxb0prRFBNWFY1MjNIVlJHb3hU?=
 =?utf-8?B?NWpRUjZUQzJKd2grVHE5M05kQ1NQYzR0a1AyczlxSWNSOTNsb2JkczVsNWow?=
 =?utf-8?B?a1ZrUmZ4Y3cvODZkcE9XYmJrQmdQWDMrODM3UkZqaXNDa2ZqRWVIZ1hlQmkx?=
 =?utf-8?B?QkZhby9IOTNRMEF0VXNGaGR5SjFCY3JLMXd3UDFNeDN6VGY1bXhoY0J6dGR1?=
 =?utf-8?B?M3kxSk9nUmZYZjY2eDJZTDdNYzVHNWdUVU43U1RydVZRcG5WemcvSlkzQW8y?=
 =?utf-8?B?Z2tRTUNzRGlpTFVoV00yeGFPUFRmOFJNQWdPeGVaekpYT0pEZWZ5TVA3WkxP?=
 =?utf-8?B?MXlEcHNlZ1R1SDlxaUhZQlZBdlc4WFI1eGdBbjdna21VYzRiQkhwUU9NaEdX?=
 =?utf-8?B?ZWtpWGt6ZUlXTUNQYVBEQllCYTRPK3hnU3RvQTErMCsrQVIvajBKbFZPcFB5?=
 =?utf-8?B?S0xGbVdTY2JWR29KWlkwWXNQaXhIejkxV0FCVS9pREp4OENXTEpZNGZxMURJ?=
 =?utf-8?B?K1dPbjJVRzJ4WVkzcnlZUndtRGJMazBZNGxtV0FHbGZoMWY2QTZGSXpRWnF2?=
 =?utf-8?B?ajdPbldaazIxbU1SVmRRRENyVXRtbmVmekc0MVArMGROOXNSTHY4WWVOdFRw?=
 =?utf-8?B?d1JWREFWSG9KVjZ6akdRUit1S2dGckxDSHh5T2MxWnVmYUF4ZDVETHhJUjBC?=
 =?utf-8?B?KzRLbEtDZ3VVTWtjUW9jNmJWZ3orNnUzZXNiNHBVd2ZuTjloRXRlWkllQWIw?=
 =?utf-8?B?ZEtVdlJhMWhaYWN3R3lrN0czbFNKR1I5c29vOUNLRmNnZWdvQ1AvZWFVOElD?=
 =?utf-8?B?ZGtJdGh1VlgzbmlXKzBPeHJPRE1XTUorSVJXSDJIUmZYWUpaWjhwUHlyd0Vw?=
 =?utf-8?B?cnF6ckRuUTlLRzNPSlJpSmcrd2NSMGtyWTROSjdhKzhVSjlJMjd2QzZMZ0hl?=
 =?utf-8?B?aXQ0MXlVYXJXbmRubFd0aGZkUzNEc1daRjREeHhCVEw5Qjh5cXZVdmNXaDMv?=
 =?utf-8?B?ZVU5WjJmRE11WEFqVWFZU3ArTnduQlRBaTArQzBEQ2Z5QzQ1aEdkR3VzVldF?=
 =?utf-8?B?UnhNQXd0cGJBaVA1S1FVSmxaNVFFR2dOTDFvRnlWQXNZZDBjT3lrYUhtbmhR?=
 =?utf-8?B?TkhwMHV5bElZbWJQVStJVnMrM1cxaW02RDZYVmh3dlJHWDY5WVVCY1JCNzIy?=
 =?utf-8?B?OTNlS1NaSEFwTnBOelVmMHpCVGI5NjY4OHFnRGFvV0REWGZLUm4zbGIzbE1E?=
 =?utf-8?B?SlIwY0FnVThtRjRhdm05YVJ4bWZPeG9Pb3dTazd6emlRTDFDem1HZUxQbnAx?=
 =?utf-8?B?Q2E0UjczOG9jbXN0RW13RjZhVTVmZ2JQUlk5VGZOb3VFZUkrS21McVVSNDRN?=
 =?utf-8?B?TU1Pbit2SXJmLy9idFpIckFZd0VLQWMzOVF2RVh4bFJEN2lCM2R1d0RaQVZj?=
 =?utf-8?B?QUxMNDVxMVFOakYvSjFoWXVwd2lPL2NOOVpIUXlpejFrMXBuRmNta3lkc1gr?=
 =?utf-8?B?T2FtVW5SeXMzbXpLVWhrNHZkbmZ3K05oNW93cnM0NnZjUXcrdWQ3KzU2ZEdx?=
 =?utf-8?B?MC9UaVYyMklKbE5FOHkycGVzdDk0ZW55VW1rbEVoNXJpSlNIWWwvQS9IQm5P?=
 =?utf-8?B?UHhJQmJjb3R5R3VMTGxKZndHSWIvTUxYWW5Fekl3Tkcxb2pPWjY3dWFCbjhO?=
 =?utf-8?Q?5L7bh3ryYGkTlQoZdGXy48V3CdjJkLq00Svmi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8488e4-184c-4455-30df-08df30f41a64
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 10:55:08.5775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfUUykEER7zOYLxAaykDxQc0Trup/oRS8Ib59gdGbgcON9/aYpZnB9AvKdk1QEQUYhtoJUb9te856QV9Iq80SyjDxWczTZR6DHkYrlyJGJA3JzcdYje8tNtCOAWJVowQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB955734

Introduce runtime suspend and resume support for FSL eDMA. Enable
per-channel power domain management to facilitate runtime suspend and
resume operations.

Implement runtime suspend and resume functions for the eDMA engine and
individual channels.

Link per-channel power domain device to eDMA per-channel device instead of
eDMA engine device. So Power Manage framework manage power state of linked
domain device when per-channel device request runtime resume/suspend.

Trigger the eDMA engine's runtime suspend when all channels are suspended,
disabling all common clocks through the runtime PM framework.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in V7:
- replace devm_clk_get_optional_enable() with devm_clk_get_optional().
- replace devm_clk_bulk_get_optional_enable() with devm_clk_bulk_get_optional().
- use PM_RUNTIME_ACQUIRE_IF_ENABLED()/PM_RUNTIME_ACQUIRE_ERR() guards to
  replace pm_runtime_resume_and_get() and the manual error handling for both
  the eDMA engine and per-channel devices.
- move dmaenginem_async_device_register() after runtime PM is enabled.
- move fsl_edma->drvdata->setup_irq() to the end of probe() and use
  dev_err_probe() on failure.
- check "irq > 0" instead of "irq" before synchronize_irq() in
  fsl_edma_chan_runtime_suspend().
- add fsl_chan txirq and errirq synchronize_irq() check in fsl_edma_chan_runtime_suspend().
- add comments explaining the pm_runtime_get_if_active() checks in the interrupt handlers.
- Link to v6: https://patch.msgid.link/20260701-b4-edma-runtime-opt-v6-0-354ff4229c00@oss.nxp.com

Changes in V6:
- add synchronize_irq() before disabling the channel clock in fsl_edma_chan_runtime_suspend()
per AI review comments.
- add pm_runtime_get_if_active() in interrupt handlers to ensure registers can be accessed
correctly per AI review comments.
- remove manual fsl_edma3_detach_pd() call when device_link_add() fails. The devres
framework will handle cleanup automatically on probe failure.
- clear fsl_chan->pd_dev_link after freeing the device link to prevent potential
use-after-free issues.
- move fsl_edma->drvdata->setup_irq() atfer edma engine pm_runtime_resume_and_get().
- Link to v5: https://lore.kernel.org/imx/20260513-b4-b4-edma-runtime-opt-v5-0-1e595bfb8423@nxp.com/

Changes in V5:
- remove unnecessary flags FSL_EDMA_DRV_HAS_CHCLK and FSL_EDMA_DRV_HAS_DMACLK.
- remove redundant clk_disable_unprepare() due to the pm_runtime_put_sync_suspend() added.
- use devm_pm_runtime_enable() to replace pm_runtime_enable() and add return value check.
- add return value check for pm_runtime_get_sync();
- replace pm_runtime_get_sync() with pm_runtime_resume_and_get().
- replace DMAMUX clock handling with bulk clock API for edma engine runtime suspend/resume.
- remove dev_pm_domain_detach() when device_link_add() fail because the fsl_edma3_detach_pd()
also call dev_pm_domain_detach().
- remove device_link_add() DL_FLAG_RPM_ACTIVE flag and pm_runtime_put_sync_suspend().
- add clk_bulk_disable_unprepare() for clk_prepare_enable() fail in fsl_edma_runtime_resume().
- remove the extra space before RUNTIME_PM_OPS.
- add skip channel comments for system suspend.
- add clk_disable_unprepare() for dmaclk at the end of probe function.
- add clk_bulk_disable_unprepare() for muxclk at the end of probe function.
- Link to v4: https://lore.kernel.org/imx/20251017-b4-edma-runtime-v4-1-87c64dd30229@nxp.com/

Changes for V4:
- fix a typo dmaegnine/dmaengine in the subject.
- Link to v3: https://lore.kernel.org/imx/20250912-b4-edma-runtime-v3-1-be22f7161745@nxp.com/

Changes for V3:
- rebased onto commit 8f21d9da4670 ("Add linux-next specific files for 20250911")
to align with latest changes.
- Remove pm_runtime_dont_use_autosuspend() from fsl_edma3_detach_pd().
because the autosuspend is not used.
- Move some edma channel registers initialization after the chan_dev
pm_runtime_enable().
- Add clk_prepare_enable() return check in fsl_edma_runtime_resume.
- Add flag FSL_EDMA_DRV_HAS_DMACLK check in fsl_edma_runtime_resume/suspend().
- Link to v2: https://lore.kernel.org/imx/20241226052643.1951886-1-joy.zou@nxp.com/

Changes for V2:
- drop ret from fsl_edma_chan_runtime_suspend().
- drop ret from fsl_edma_chan_runtime_resume() and return clk_prepare_enable().
- add review tag
- Link to v1: https://lore.kernel.org/imx/20241220021109.2102294-1-joy.zou@nxp.com/

Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
---
 drivers/dma/fsl-edma-common.c |  14 ++-
 drivers/dma/fsl-edma-main.c   | 264 ++++++++++++++++++++++++++++++++++++------
 2 files changed, 234 insertions(+), 44 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index 4f7a942673eb..4ab56294ac77 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -274,9 +274,6 @@ int fsl_edma_terminate_all(struct dma_chan *chan)
 	spin_unlock_irqrestore(&fsl_chan->vchan.lock, flags);
 	vchan_dma_desc_free_list(&fsl_chan->vchan, &head);
 
-	if (fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_HAS_PD)
-		pm_runtime_allow(fsl_chan->pd_dev);
-
 	return 0;
 }
 
@@ -1087,7 +1084,12 @@ int fsl_edma_alloc_chan_resources(struct dma_chan *chan)
 	struct fsl_edma_chan *fsl_chan = to_fsl_edma_chan(chan);
 	int ret = 0;
 
-	clk_prepare_enable(fsl_chan->clk);
+	ret = pm_runtime_resume_and_get(&fsl_chan->vchan.chan.dev->device);
+	if (ret < 0) {
+		dev_err(&fsl_chan->vchan.chan.dev->device, "Failed to resume device: %d\n", ret);
+		return ret;
+	}
+
 	fsl_chan->tcd_pool = dma_pool_create("tcd_pool", chan->device->dev,
 				fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_TCD64 ?
 				sizeof(struct fsl_edma_hw_tcd64) : sizeof(struct fsl_edma_hw_tcd),
@@ -1114,7 +1116,7 @@ int fsl_edma_alloc_chan_resources(struct dma_chan *chan)
 		free_irq(fsl_chan->txirq, fsl_chan);
 err_txirq:
 	dma_pool_destroy(fsl_chan->tcd_pool);
-	clk_disable_unprepare(fsl_chan->clk);
+	pm_runtime_put_sync_suspend(&fsl_chan->vchan.chan.dev->device);
 
 	return ret;
 }
@@ -1146,7 +1148,7 @@ void fsl_edma_free_chan_resources(struct dma_chan *chan)
 	fsl_chan->is_sw = false;
 	fsl_chan->srcid = 0;
 	fsl_chan->is_remote = false;
-	clk_disable_unprepare(fsl_chan->clk);
+	pm_runtime_put_sync_suspend(&fsl_chan->vchan.chan.dev->device);
 }
 
 void fsl_edma_cleanup_vchan(struct dma_device *dmadev)
diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index be9bd9cc6630..c16280b83656 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -37,15 +37,32 @@ static irqreturn_t fsl_edma_tx_handler(int irq, void *dev_id)
 	unsigned int intr, ch;
 	struct edma_regs *regs = &fsl_edma->regs;
 
+	/*
+	 * A racy or spurious interrupt for an already-suspended
+	 * controller or channel is an extremely rare corner case and
+	 * highly unlikely in practice.
+	 */
+	if (pm_runtime_get_if_active(fsl_edma->dma_dev.dev) <= 0)
+		return IRQ_NONE;
+
 	intr = edma_readl(fsl_edma, regs->intl);
-	if (!intr)
+	if (!intr) {
+		pm_runtime_put(fsl_edma->dma_dev.dev);
 		return IRQ_NONE;
+	}
 
+	pm_runtime_put(fsl_edma->dma_dev.dev);
 	for (ch = 0; ch < fsl_edma->n_chans; ch++) {
+		struct fsl_edma_chan *fsl_chan = &fsl_edma->chans[ch];
+
+		if (pm_runtime_get_if_active(&fsl_chan->vchan.chan.dev->device) <= 0)
+			continue;
+
 		if (intr & (0x1 << ch)) {
 			edma_writeb(fsl_edma, EDMA_CINT_CINT(ch), regs->cint);
 			fsl_edma_tx_chan_handler(&fsl_edma->chans[ch]);
 		}
+		pm_runtime_put(&fsl_chan->vchan.chan.dev->device);
 	}
 	return IRQ_HANDLED;
 }
@@ -132,13 +149,23 @@ static irqreturn_t fsl_edma3_tx_handler(int irq, void *dev_id)
 	struct fsl_edma_chan *fsl_chan = dev_id;
 	unsigned int intr;
 
-	intr = edma_readl_chreg(fsl_chan, ch_int);
-	if (!intr)
+	/*
+	 * A racy or spurious interrupt for an already-suspended
+	 * channel is an extremely rare corner case and highly unlikely in
+	 * practice.
+	 */
+	if (pm_runtime_get_if_active(&fsl_chan->vchan.chan.dev->device) <= 0)
 		return IRQ_NONE;
 
+	intr = edma_readl_chreg(fsl_chan, ch_int);
+	if (!intr) {
+		pm_runtime_put(&fsl_chan->vchan.chan.dev->device);
+		return IRQ_NONE;
+	}
 	edma_writel_chreg(fsl_chan, 1, ch_int);
 
 	fsl_edma_tx_chan_handler(fsl_chan);
+	pm_runtime_put(&fsl_chan->vchan.chan.dev->device);
 
 	return IRQ_HANDLED;
 }
@@ -185,20 +212,37 @@ static irqreturn_t fsl_edma3_or_err_handler(int irq, void *dev_id)
 	unsigned int err, ch, ch_es;
 	struct fsl_edma_chan *chan;
 
+	/*
+	 * A racy or spurious interrupt for an already-suspended
+	 * controller or channel is an extremely rare corner case and
+	 * highly unlikely in practice.
+	 */
+	if (pm_runtime_get_if_active(fsl_edma->dma_dev.dev) <= 0)
+		return IRQ_NONE;
+
 	err = edma_readl(fsl_edma, regs->es);
-	if (!(err & EDMA_V3_MP_ES_VLD))
+	if (!(err & EDMA_V3_MP_ES_VLD)) {
+		pm_runtime_put(fsl_edma->dma_dev.dev);
 		return IRQ_NONE;
+	}
 
+	pm_runtime_put(fsl_edma->dma_dev.dev);
 	for (ch = 0; ch < fsl_edma->n_chans; ch++) {
 		chan = &fsl_edma->chans[ch];
 
+		if (pm_runtime_get_if_active(&chan->vchan.chan.dev->device) <= 0)
+			continue;
+
 		ch_es = edma_readl_chreg(chan, ch_es);
-		if (!(ch_es & EDMA_V3_CH_ES_ERR))
+		if (!(ch_es & EDMA_V3_CH_ES_ERR)) {
+			pm_runtime_put(&chan->vchan.chan.dev->device);
 			continue;
+		}
 
 		edma_writel_chreg(chan, EDMA_V3_CH_ES_ERR, ch_es);
 		fsl_edma_disable_request(chan);
 		fsl_edma->chans[ch].status = DMA_ERROR;
+		pm_runtime_put(&chan->vchan.chan.dev->device);
 	}
 
 	return IRQ_HANDLED;
@@ -210,16 +254,33 @@ static irqreturn_t fsl_edma_err_handler(int irq, void *dev_id)
 	unsigned int err, ch;
 	struct edma_regs *regs = &fsl_edma->regs;
 
+	/*
+	 * A racy or spurious interrupt for an already-suspended
+	 * controller or channel is an extremely rare corner case and
+	 * highly unlikely in practice.
+	 */
+	if (pm_runtime_get_if_active(fsl_edma->dma_dev.dev) <= 0)
+		return IRQ_NONE;
+
 	err = edma_readl(fsl_edma, regs->errl);
-	if (!err)
+	if (!err) {
+		pm_runtime_put(fsl_edma->dma_dev.dev);
 		return IRQ_NONE;
+	}
 
+	pm_runtime_put(fsl_edma->dma_dev.dev);
 	for (ch = 0; ch < fsl_edma->n_chans; ch++) {
+		struct fsl_edma_chan *fsl_chan = &fsl_edma->chans[ch];
+
+		if (pm_runtime_get_if_active(&fsl_chan->vchan.chan.dev->device) <= 0)
+			continue;
+
 		if (err & (0x1 << ch)) {
 			fsl_edma_disable_request(&fsl_edma->chans[ch]);
 			edma_writeb(fsl_edma, EDMA_CERR_CERR(ch), regs->cerr);
 			fsl_edma_err_chan_handler(&fsl_edma->chans[ch]);
 		}
+		pm_runtime_put(&fsl_chan->vchan.chan.dev->device);
 	}
 	return IRQ_HANDLED;
 }
@@ -630,11 +691,12 @@ static void fsl_edma3_detach_pd(struct fsl_edma_engine *fsl_edma)
 		if (fsl_edma->chan_masked & BIT(i))
 			continue;
 		fsl_chan = &fsl_edma->chans[i];
-		if (fsl_chan->pd_dev_link)
+		if (fsl_chan->pd_dev_link) {
 			device_link_del(fsl_chan->pd_dev_link);
+			fsl_chan->pd_dev_link = NULL;
+		}
 		if (fsl_chan->pd_dev) {
 			dev_pm_domain_detach(fsl_chan->pd_dev, false);
-			pm_runtime_dont_use_autosuspend(fsl_chan->pd_dev);
 			pm_runtime_set_suspended(fsl_chan->pd_dev);
 		}
 	}
@@ -665,23 +727,8 @@ static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_eng
 			dev_err(dev, "Failed attach pd %d\n", i);
 			goto detach;
 		}
-
-		fsl_chan->pd_dev_link = device_link_add(dev, pd_chan, DL_FLAG_STATELESS |
-					     DL_FLAG_PM_RUNTIME |
-					     DL_FLAG_RPM_ACTIVE);
-		if (!fsl_chan->pd_dev_link) {
-			dev_err(dev, "Failed to add device_link to %d\n", i);
-			dev_pm_domain_detach(pd_chan, false);
-			goto detach;
-		}
-
 		fsl_chan->pd_dev = pd_chan;
-
-		pm_runtime_use_autosuspend(fsl_chan->pd_dev);
-		pm_runtime_set_autosuspend_delay(fsl_chan->pd_dev, 200);
-		pm_runtime_set_active(fsl_chan->pd_dev);
 	}
-
 	return 0;
 
 detach:
@@ -689,6 +736,42 @@ static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_eng
 	return -EINVAL;
 }
 
+/* Per channel dma power domain */
+static int fsl_edma_chan_runtime_suspend(struct device *dev)
+{
+	struct fsl_edma_chan *fsl_chan = dev_get_drvdata(dev);
+	struct fsl_edma_engine *fsl_edma = fsl_chan->edma;
+
+	if (fsl_edma->txirq > 0)
+		synchronize_irq(fsl_edma->txirq);
+
+	if (fsl_edma->errirq > 0)
+		synchronize_irq(fsl_edma->errirq);
+
+	if (fsl_chan->txirq > 0)
+		synchronize_irq(fsl_chan->txirq);
+
+	if (fsl_chan->errirq > 0)
+		synchronize_irq(fsl_chan->errirq);
+
+	clk_disable_unprepare(fsl_chan->clk);
+
+	return 0;
+}
+
+static int fsl_edma_chan_runtime_resume(struct device *dev)
+{
+	struct fsl_edma_chan *fsl_chan = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(fsl_chan->clk);
+}
+
+static struct dev_pm_domain fsl_edma_chan_pm_domain = {
+	.ops = {
+	       RUNTIME_PM_OPS(fsl_edma_chan_runtime_suspend, fsl_edma_chan_runtime_resume, NULL)
+	}
+};
+
 static int fsl_edma_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -730,11 +813,11 @@ static int fsl_edma_probe(struct platform_device *pdev)
 		regs = &fsl_edma->regs;
 	}
 
-	fsl_edma->dmaclk = devm_clk_get_optional_enabled(&pdev->dev, "dma");
+	fsl_edma->dmaclk = devm_clk_get_optional(&pdev->dev, "dma");
 	if (IS_ERR(fsl_edma->dmaclk))
 		return dev_err_probe(&pdev->dev,
 				     PTR_ERR(fsl_edma->dmaclk),
-				     "Failed to get/enable DMA clock.\n");
+				     "Failed to get DMA clock.\n");
 
 	ret = of_property_read_variable_u32_array(np, "dma-channel-mask", chan_mask, 1, 2);
 
@@ -761,11 +844,11 @@ static int fsl_edma_probe(struct platform_device *pdev)
 				return -ENOMEM;
 		}
 
-		ret = devm_clk_bulk_get_optional_enable(&pdev->dev, fsl_edma->drvdata->dmamuxs,
-							fsl_edma->muxclk);
+		ret = devm_clk_bulk_get_optional(&pdev->dev, fsl_edma->drvdata->dmamuxs,
+						 fsl_edma->muxclk);
 		if (ret)
 			return dev_err_probe(&pdev->dev, ret,
-					     "Failed to get/enable DMAMUX block clock.\n");
+					     "Failed to get DMAMUX block clock.\n");
 	}
 
 	fsl_edma->big_endian = of_property_read_bool(np, "big-endian");
@@ -808,21 +891,13 @@ static int fsl_edma_probe(struct platform_device *pdev)
 				+ i * drvdata->chreg_space_sz + drvdata->chreg_off + len;
 		fsl_chan->mux_addr = fsl_edma->membase + drvdata->mux_off + i * drvdata->mux_skip;
 		snprintf(clk_name, sizeof(clk_name), "ch%02d", i);
-		fsl_chan->clk = devm_clk_get_optional_enabled(&pdev->dev, (const char *)clk_name);
+		fsl_chan->clk = devm_clk_get_optional(&pdev->dev, (const char *)clk_name);
 		if (IS_ERR(fsl_chan->clk))
 			return PTR_ERR(fsl_chan->clk);
 		fsl_chan->pdev = pdev;
 		vchan_init(&fsl_chan->vchan, &fsl_edma->dma_dev);
-
-		edma_write_tcdreg(fsl_chan, cpu_to_le32(0), csr);
-		fsl_edma_chan_mux(fsl_chan, 0, false);
-		clk_disable_unprepare(fsl_chan->clk);
 	}
 
-	ret = fsl_edma->drvdata->setup_irq(pdev, fsl_edma);
-	if (ret)
-		return ret;
-
 	dma_cap_set(DMA_PRIVATE, fsl_edma->dma_dev.cap_mask);
 	dma_cap_set(DMA_SLAVE, fsl_edma->dma_dev.cap_mask);
 	dma_cap_set(DMA_CYCLIC, fsl_edma->dma_dev.cap_mask);
@@ -870,11 +945,69 @@ static int fsl_edma_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, fsl_edma);
 
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Can't enable eDMA engine PM runtime!\n");
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(&pdev->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to resume eDMA engine!\n");
+
 	ret = dmaenginem_async_device_register(&fsl_edma->dma_dev);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
 				     "Can't register Freescale eDMA engine.\n");
 
+	for (i = 0; i < fsl_edma->n_chans; i++) {
+		struct fsl_edma_chan *fsl_chan = &fsl_edma->chans[i];
+		struct device *chan_dev;
+
+		if (fsl_edma->chan_masked & BIT(i))
+			continue;
+
+		chan_dev = &fsl_chan->vchan.chan.dev->device;
+		dev_set_drvdata(chan_dev, fsl_chan);
+		dev_pm_domain_set(chan_dev, &fsl_edma_chan_pm_domain);
+
+		if (fsl_chan->pd_dev) {
+			fsl_chan->pd_dev_link = device_link_add(chan_dev, fsl_chan->pd_dev,
+								DL_FLAG_STATELESS |
+								DL_FLAG_PM_RUNTIME);
+			if (!fsl_chan->pd_dev_link) {
+				return dev_err_probe(&pdev->dev, -EINVAL,
+						     "Failed to add device_link to %d!\n", i);
+			}
+		}
+		ret = devm_pm_runtime_enable(chan_dev);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Can't enable eDMA channel PM runtime!\n");
+
+		if (fsl_chan->pd_dev) {
+			ret = pm_runtime_resume_and_get(fsl_chan->pd_dev);
+			if (ret)
+				return dev_err_probe(&pdev->dev, ret,
+						     "Failed to power on eDMA channel %d!\n",
+						     fsl_chan->vchan.chan.chan_id);
+		}
+
+		PM_RUNTIME_ACQUIRE_IF_ENABLED(chan_dev, pm);
+		ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+		if (ret) {
+			if (fsl_chan->pd_dev)
+				pm_runtime_put_sync_suspend(fsl_chan->pd_dev);
+
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to resume eDMA channel %d!\n",
+					     fsl_chan->vchan.chan.chan_id);
+		}
+		edma_write_tcdreg(fsl_chan, cpu_to_le32(0), csr);
+		fsl_edma_chan_mux(fsl_chan, 0, false);
+		if (fsl_chan->pd_dev)
+			pm_runtime_put_sync_suspend(fsl_chan->pd_dev);
+	}
+
 	ret = devm_of_dma_controller_register(&pdev->dev, np,
 			drvdata->dmamuxs ? fsl_edma_xlate : fsl_edma3_xlate,
 			fsl_edma);
@@ -886,6 +1019,10 @@ static int fsl_edma_probe(struct platform_device *pdev)
 	if (!(drvdata->flags & FSL_EDMA_DRV_SPLIT_REG))
 		edma_writel(fsl_edma, EDMA_CR_ERGA | EDMA_CR_ERCA, regs->cr);
 
+	ret = fsl_edma->drvdata->setup_irq(pdev, fsl_edma);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to setup IRQ!\n");
+
 	return 0;
 }
 
@@ -908,6 +1045,19 @@ static int fsl_edma_suspend_late(struct device *dev)
 		fsl_chan = &fsl_edma->chans[i];
 		if (fsl_edma->chan_masked & BIT(i))
 			continue;
+
+		/*
+		 * Skip channel if:
+		 * 1. Runtime PM already suspended.
+		 * 2. Channel without power domain, and the channel source ID is zero,
+		 * so the channel isn't assigned.
+		 */
+		if (pm_runtime_status_suspended(&fsl_chan->vchan.chan.dev->device) ||
+		    (!(fsl_edma->drvdata->flags & FSL_EDMA_DRV_HAS_PD) &&
+		     (fsl_edma->drvdata->flags & FSL_EDMA_DRV_SPLIT_REG) &&
+		     !fsl_chan->srcid))
+			continue;
+
 		spin_lock_irqsave(&fsl_chan->vchan.lock, flags);
 		/* Make sure chan is idle or will force disable. */
 		if (unlikely(fsl_chan->status == DMA_IN_PROGRESS)) {
@@ -927,19 +1077,56 @@ static int fsl_edma_resume_early(struct device *dev)
 {
 	struct fsl_edma_engine *fsl_edma = dev_get_drvdata(dev);
 	struct fsl_edma_chan *fsl_chan;
-	struct edma_regs *regs = &fsl_edma->regs;
 	int i;
 
 	for (i = 0; i < fsl_edma->n_chans; i++) {
 		fsl_chan = &fsl_edma->chans[i];
 		if (fsl_edma->chan_masked & BIT(i))
 			continue;
+
+		if (pm_runtime_status_suspended(&fsl_chan->vchan.chan.dev->device) ||
+		    (!(fsl_edma->drvdata->flags & FSL_EDMA_DRV_HAS_PD) &&
+		     (fsl_edma->drvdata->flags & FSL_EDMA_DRV_SPLIT_REG) &&
+		     !fsl_chan->srcid))
+			continue;
+
 		fsl_chan->pm_state = RUNNING;
 		edma_write_tcdreg(fsl_chan, 0, csr);
 		if (fsl_chan->srcid != 0)
 			fsl_edma_chan_mux(fsl_chan, fsl_chan->srcid, true);
 	}
 
+	return 0;
+}
+
+/* edma engine runtime system/resume */
+static int fsl_edma_runtime_suspend(struct device *dev)
+{
+	struct fsl_edma_engine *fsl_edma = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(fsl_edma->drvdata->dmamuxs, fsl_edma->muxclk);
+
+	clk_disable_unprepare(fsl_edma->dmaclk);
+
+	return 0;
+}
+
+static int fsl_edma_runtime_resume(struct device *dev)
+{
+	struct fsl_edma_engine *fsl_edma = dev_get_drvdata(dev);
+	struct edma_regs *regs = &fsl_edma->regs;
+	int ret;
+
+	ret = clk_bulk_prepare_enable(fsl_edma->drvdata->dmamuxs, fsl_edma->muxclk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(fsl_edma->dmaclk);
+	if (ret) {
+		clk_bulk_disable_unprepare(fsl_edma->drvdata->dmamuxs, fsl_edma->muxclk);
+		return ret;
+	}
+
 	if (!(fsl_edma->drvdata->flags & FSL_EDMA_DRV_SPLIT_REG))
 		edma_writel(fsl_edma, EDMA_CR_ERGA | EDMA_CR_ERCA, regs->cr);
 
@@ -954,6 +1141,7 @@ static int fsl_edma_resume_early(struct device *dev)
 static const struct dev_pm_ops fsl_edma_pm_ops = {
 	.suspend_late   = fsl_edma_suspend_late,
 	.resume_early   = fsl_edma_resume_early,
+	RUNTIME_PM_OPS(fsl_edma_runtime_suspend, fsl_edma_runtime_resume, NULL)
 };
 
 static struct platform_driver fsl_edma_driver = {

-- 
2.34.1

