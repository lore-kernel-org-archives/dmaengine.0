Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793720208;
	b=ollrAUCFgMxNYhY4u0k1yLBeHSMPifREr5bjPNdoRlWG9SCm8mQLlQ27DHoyguacEHQ9
	 Bwpn4uzQOt+L4py4kPYGZd8I5LqstdQAxFwmLlgrMmdRV13Y2UFESqys6wMjITM6q+mP9
	 SrCI8M4B6oEsl74qEJxfD6ezrGr0+WXyhT3HEPJ43gIZP59DLlvw4foQoB/hCEcqV1OCF
	 NE8uiBFF5n7W18ZddJZ893rD7hnwxrtg0mQuC/UVAxl/fSGVm0BQGsd/0vsG5r4FjvENc
	 uZqse1FZfGzDyinWAFNDRIaEB9+eOKjrHc3EwDrvLhRhEVPf9ptIPYSZ313GaH9JRdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720208;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
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
	bh=M2TOYAgVPcQP1tHS8sPfB7XjhVltAH+BQDf9BUxk0wI=;
	b=nYI1uxwGMSn4Xyy7HyHY8fbdFVqfIQsFIzGBL23UH81nWH8I0EglvbEIgYnqnp7b1xdL
	 zDLAQdsJ9XxQNLf2WDNqPPYuPwF6U0xgtzR157PE1CfJJSI8rNEGzQ1MITwa5I0BAyQMV
	 MKkUy0pPWkO0OJWy2AzHziCykiNjhiqG0T8mtN9RMLaZY0gv1jcCCp18W2kA49S+roudv
	 nxauqL1xxnKKSpef3CbZx3s0wBv8/3J9Y39CHX2EBvrTEemVbbV/mKkdvNkeFqdmU2aCC
	 lZ3FyAt4Jjb4VaJhM9TUBBsNV0NmO2UH5lNdDp/n80YpU+uJ8drGFUJLSPZVw9D9lWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SWY3vu+M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.66
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010066.outbound.protection.outlook.com [52.101.69.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B890606A327;
	Tue,  3 Nov 2026 15:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B890606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SWY3vu+M
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YOzvN1jyBNM31Scsd8PBNTHp4yFmOJnck+a+2+QwN9mEi7WKYNT6gkACpRSxnxqKS5wp1BxPzSWdRds8VEDBk8nrluyEFDQwSiXA6VMgf/4B0aMkSwafkwWCzbjcp6qmpty9JyguiVTDVoJQrc0dsp8o+AzHdxBjmjFurimjC+MSwnqh9POjKJjMGgyZHMFhayWK2H0H3/KkxDlRAv5lXLGKij7OYIDgQ8e76ZpPG+kkRhNjaKAUyQbCf1A4+rToFC5Mz5K+faCjcGv4Pc/k9eehv07UEcO4ftmT1QLWHZ1Fjx5K+sF4ztp2tk8PPtAOyAvCtuU1B01Gl7KcMZf0kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2TOYAgVPcQP1tHS8sPfB7XjhVltAH+BQDf9BUxk0wI=;
 b=Odoo9Pm4p3PZk+sEpReLBTLNIOn6jdX+ceB/YVjewTuHzD0GEs2cfMa7zp6figje/WoyAi/Vg1MWN3SNDjKF2g7xBgvTWKU+htLvXhR5GBEi+xKMpQ2cF0t0uW+yShPC57l/YFSFVqn7D4D+z0GYvyx9kTjT7Ovk4QVFjByLjjZ6wSWNMX+FQGaZ167WlhB9NyFmsJGTzvHv++p6+AiLBaPjuqRql1MVq7nHLwIE4hW/UyNDWkri6kEEjicda4sOgPjzLWU6HB/1evo/FBxsAEYu669RDPeKvUAOqXvlL5sKqnFyqu5yfLlXV136kJhcEMqAaVxOaILJNWJgCZ1pQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2TOYAgVPcQP1tHS8sPfB7XjhVltAH+BQDf9BUxk0wI=;
 b=SWY3vu+MNy9w6oj1YAbiKI7Ud5NZ3h6xzm7LaTRrZHFI7A2cIF9N8EC6XH7RAFfOHPFhbkAlTvesM2fTJmlXxZdrqtwXi1l8dOFKU6wqIQI6uTvhKtuGH4NPBiFI54VkXgR9mr+rSBpYz2A2jN1dK+Bky+ZQeQ876Ck3+Ktx6D/Y+T1+Ue8x2m5pRpfy3G1fACrycYqG+uP+3Tc6bFvATMvVuNe78XXMaXt05FxRko/uGc/8Gl3ZqwB2qJawS8HE9kIYPUxOoFDL2tf7PLHZX6ys5booflX2dDsJa1MXGyfUQYoRModRoZvjINomDs6/MpJVFxGxE1GBDRM1sSLXKg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GVXPR04MB12266.eurprd04.prod.outlook.com (2603:10a6:150:311::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 15:36:43 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 15:36:43 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Nov 2026 23:33:24 +0800
Subject: [PATCH] dmaengine: mcf-edma: unregister DMA device before vchan
 cleanup
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-mcf-edma-v1-1-f6acbc569fc1@nxp.com>
X-B4-Tracking: v=1; b=H4sIAMP+6WoC/yXMywqAIBCF4VeJWSdogVGvEi3UGWuCLmhFEL17V
 ssP/nMuiBSYIjTZBYEOjrzMCSrPwA1m7kkwJkMhC62ULMXkvCCcjHCVkRq9rtEipHwN5Pn8rtr
 ud9ztSG5793DfDwyRoHpsAAAA
X-Change-ID: 20261103-mcf-edma-c7a06df69dbd
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Angelo Dureghello <angelo@sysam.it>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:195::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GVXPR04MB12266:EE_
X-MS-Office365-Filtering-Correlation-Id: 60030cb4-2a0c-4dc1-6f19-08df39c04343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|19092799006|261102123227099003|261021121427099003|260925022911599003|260925021311599003|260925021911599003|11063799006|56012099006|261021123027099003|261009223027099003|261028144727099003|261022105027099003|261026140227099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	siT8CYBqN5OJfCsaDwYsxJoTWkaGoe0Qb4GoPJZThIf50lv8VRRIwZ8/MUO1yK24yeJqBI4Mo0WpPv6FkhpX71Aye4NlJTUCYqSo0kLIVN0QJf7Zz6df7hMVwVtZ7Rm6ko3njWa3/gWD4Qy5y2cmeCOuKsnm+RdE5krhHS2H8CoXbn0fmL5bZFgxO41b3qhkPlCyhGQm6WiUjc36NDkNp50wd59w74FMz4tCGEdVEa7Z90Q74UKumnUw2283yt+d9IF0dDkUcuv+LPv1EVnYQoDVt1NXPUzEislxWPED2N9qQBhft+f+0o7jO9ibccekLid5CY2WfleUYozKzgxErGYu4AIIS1E+FWFJk3gOnFYdwRlsJqZYDe2nww3NSZmi4VB2m6UrpA/kcy4SrgXz+tk720wjdKkA71m5ASEcE+vaWt66W5wrlMkmkvERFH3afNORe9rEzUpL5SSe7HcuGI4QkLiBeO00t/CsbsCh0xIwjKIhAeq7P549ztOGMs/Ayc8vWStv7A6T6ioDyG5eoycnF+COMLMD7k7+vWrTjFo2pBplw+bXlPFuXyZj2XfNCuS0/MCksmfkYwAh9uypyTSS2k4qA7kvSp+JZgpHovZwMxlkIdiOACjmklxRshYanYpJDvhyirFuwHdXgEILI1RS9Ha1MM4dKVSderIF2K0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(19092799006)(261102123227099003)(261021121427099003)(260925022911599003)(260925021311599003)(260925021911599003)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(261028144727099003)(261022105027099003)(261026140227099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzN1MCtvQ3lFRDdkb1p4dGlVbnVkNjA0TlJOam9GcjNCcnZtcFU4NktkTG1F?=
 =?utf-8?B?TEVxcUhIbVdpUTlFUXMxTkFCMkpYNFpvRlBUUldpeTd0UEJMUk9UVGZYdnFZ?=
 =?utf-8?B?UVBaK1NZZi8xUG5vVkFUMkxkK2hHMWZ4NFJEV052YmFEUlV1aTkya0NVQ3dH?=
 =?utf-8?B?emd5cVhwQm1xV0hzMFNJcVdxYjdxbWxjVjlVYXk2UGhyWjBwMnlBZzBSZFlI?=
 =?utf-8?B?bFIvaGl4Nm5kSWNRWmFOY1N4cTNxWUdrb20wZVR6SFJiSEc2Q1dHeTE3WWI3?=
 =?utf-8?B?NWFYR2xGc2dTSFUrZnVLUHM1dzZyYVRPcVBsSDlMK2pVaS8zREZUcm1NNDU5?=
 =?utf-8?B?RjJqWlAzU3J6L1VxNisrUi9jWEE5Z2grRkdqOUtoeWJBZzVGUll2Nk1GRTJr?=
 =?utf-8?B?TWREK2tlRUdsNHpxN0c4OVd6Uzg4SlNPd3dwUFRCb2dlMEx3akZTeW1ZYzZB?=
 =?utf-8?B?SFdJalRGSCtBODlycUpwREdueXpTQ09jV0ZXWDZRUUhlZ3VpY291VDF2ZnM0?=
 =?utf-8?B?V0VBVXhGTE5LejRuaUhnUXNybDZac1RtWVc5Nmd0NmhNdURPNzRsSTJtOHdK?=
 =?utf-8?B?ZGY3ek0rZU5LNFpkTGk0eHUweXJDN3pKOG5XY1MzUE1tUGthT2VlaDdxZ2tM?=
 =?utf-8?B?aklZa1hRZ3hOOXAvc0RQbTE2QjdnczFTK0FLUUVXcXNxejRka0JDRHlSSTgw?=
 =?utf-8?B?WldtOE5sZG9PN1NJQzlQbFV2b3haRlBoMkNhWnhyWER5bm1Za0FBRzRUam9z?=
 =?utf-8?B?ci9mOVNEN3ZtWkVHb3lRYUFPbWRpOEhtaFJkajZPVENsZVBlbURQOXRNNnJO?=
 =?utf-8?B?VkFqTnFWamVKMFlMZlFGNEJPbnVkL0NrUjlQaVlJZ21NYlVmaUtreGpsUTRv?=
 =?utf-8?B?cTV1QUhZVTUxaXpYWWxndXUxbStPbUk1aDJQclV3OHlLbkZ1NkpxcWVNSEww?=
 =?utf-8?B?amo1NmQxU0tjeGNLY1NFWUhsdkxmZUpUOUthSUI2T3JzZXQzeEIvd0poNFlw?=
 =?utf-8?B?S3BLVkhWdVlYVGZQYkFEYzUvdDBPeC9CK25zUG9reXhoWEpPNHkxdUZSYWZY?=
 =?utf-8?B?ckN0M0R0aWxXY2dXOHo3WTAyenl5K0V4eFFRTVRtT2RRTmhpTjFqYzB4cXdD?=
 =?utf-8?B?RGVPTWJEWXpuVjBWUWxNd2hUeitFcFBDd2h0bjdla2hGdFZ4S3l1ek5zdmNl?=
 =?utf-8?B?M2liREpuWWZXL1luZ1cvTnk5ZVdlUWZtTWVDVFg5ZEIxUlQ3ZitLK21aVDZk?=
 =?utf-8?B?SnBoa0tkK1E1ZlE5b2haOE9yZ2o0dDdmQThUYWEvQ20xWmhrL0ZVOEZ3TlVN?=
 =?utf-8?B?Mkd3YzJ4NnkybUEvZzNPWlFCSG1sMVpGTmwxYkFqSUwvbGJ4MGF0WEZ2ajda?=
 =?utf-8?B?WDdnZ0plUlpUZFNBeVVLT0FKU05seU9aTFNEL09RNFZGL3hlbjUzRm04c1JO?=
 =?utf-8?B?NG5nN0hMZ0xUaFZyck4xNGQ3NlVQZ0NOb1N2cW1UOTdHYVpITTRNU1ZWaURY?=
 =?utf-8?B?bGU4V21QS3pIU0ROSi9yUnZUWG9tTGJNVHJHalJBVnhOSGlJcGNrMkN2cFM1?=
 =?utf-8?B?cmd1Q1BOaFErbzBGL1B0b1dTWDZnbmhjK1FKTzVvQkdiWFVobUtwM2k4TUg2?=
 =?utf-8?B?RWxLWlo4REdjdGZmaXQySFNBUkNabGZPMHFrY01mU0lXREV5RmRDa2twaVI1?=
 =?utf-8?B?ZVpSWExkNTAxaTJXdHI4ZUVmaEgrZmorb0c0eDNYWE95RmlNNmRTWVlPUXAz?=
 =?utf-8?B?aUxnVUtrZmZKZXJNNnAyajAyTHdUdnJlaUhRalljdWxXQitjdStnaGlaZjRJ?=
 =?utf-8?B?NmRWMTdaMXViUUZpZkVBWmYxTjdWelQ3cWl4RkZOWlVSNWZ5ODJLc3BYU0hE?=
 =?utf-8?B?SzBrWTAxWEZ4akltUGVYdGtTRTQxMjRjaGs2NUh3OThqZU9QaGVpczJZdFE2?=
 =?utf-8?B?eGg1Uk4wMTM4dEgxQktSaUZ6eGRZNmVLTzExOFJIRStEajZKMFdrNGVzVFU0?=
 =?utf-8?B?VG5PSExHY3VVM0p4U0doemhtSGZCUWxReHNNRTJSNnMrVWdhQVF0QlpzYks4?=
 =?utf-8?B?bm12emRKWGxtaVJaTjVORlNDbmRidjBVa2NkRHhDNWN5ZU9UdGlHOElhTmhl?=
 =?utf-8?B?dmhsZGJWRVo4SUpQcUc4MXFSM2FUcGtvSjBYNmkvY3NxRkgrR2tQb0VLMTgr?=
 =?utf-8?B?R2NhU3lqNkVjQWJUWEZoWm12cFRKdnNJR2pVa3VlSkdKbW16REYyMDR2c083?=
 =?utf-8?B?S0VaSmIzTXRmWGJ5MjhoZXFLZEs4N2UxS24vTy9tN211TVJmRFRBRG8xLzV2?=
 =?utf-8?B?cFpMekpjMnBMbFREc1BCS2FiT201M2lqMDdwOG5PczBNY1JxUTZ6ejNGU29h?=
 =?utf-8?Q?ASkjuISVPi8nkBRZD35jaJ7sr1GDYNSQwvG3S?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60030cb4-2a0c-4dc1-6f19-08df39c04343
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 15:36:43.7002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4dCpkrnEbZA5QarlVAA2T2TUGr5ZSYcLUz7Hpw7zkNCSSkRCdjCwnJ3vE2W9rGByDEde68zpaZOrC8BEvI6bbPptg84THBZLlUSR7c9SqJsaLj37ioM+wIsWTvWCMORY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12266

From: Peng Fan <peng.fan@nxp.com>

mcf_edma_remove() calls fsl_edma_cleanup_vchan() before
dma_async_device_unregister().  The cleanup helper removes every
channel from dma_dev.channels, so dma_async_device_unregister() later
sees an empty list and never unregisters the channel devices.

This leaves dmaNchanM devices in sysfs, keeps their IOMMU groups alive
and skips freeing the channel IDs and per-channel state when the
controller is unbound or the driver is removed.

Unregister the DMA device first, then run the vchan cleanup so the
channel list is still intact when dma_async_device_unregister()
iterates it.

Fixes: e7a3ff92eaf19eab14e8149758428e680c61706b ("dmaengine: fsl-edma: add ColdFire mcf5441x edma support")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/dma/mcf-edma-main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mcf-edma-main.c b/drivers/dma/mcf-edma-main.c
index 9e1c6400c77b..2efd5f0b4f87 100644
--- a/drivers/dma/mcf-edma-main.c
+++ b/drivers/dma/mcf-edma-main.c
@@ -258,8 +258,8 @@ static void mcf_edma_remove(struct platform_device *pdev)
 	struct fsl_edma_engine *mcf_edma = platform_get_drvdata(pdev);
 
 	mcf_edma_irq_free(pdev, mcf_edma);
-	fsl_edma_cleanup_vchan(&mcf_edma->dma_dev);
 	dma_async_device_unregister(&mcf_edma->dma_dev);
+	fsl_edma_cleanup_vchan(&mcf_edma->dma_dev);
 }
 
 static struct platform_driver mcf_edma_driver = {

---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261103-mcf-edma-c7a06df69dbd

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

