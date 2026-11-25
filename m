Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795604111;
	b=4R9G8nq6tK71Vodt1afYliySOWKKCZBc45LaF878l3hJZrAgIeX6P75arYEREtyqTosG
	 ZzNFJvg6Rm/k8g1ki+mM4FJ+6bBb0k2KSwpTq4+wm53ve+S9KEAqIToDoGgdBQyrhZUq9
	 7cCCilky2uGV6HtYjp79deGxjNTrCOTsZdbedIelNQUwwkybAOHE1O2DQRvNnTQrZcrus
	 12YstnANgj65qXAghdfLvWjE2UnACPJCRMPqP56CtoHioq4GvZ1Cc8JgxRSRGNWyMPBbB
	 3vVjZrq9SkiAuo0nmxDxoqLpIEFHhNCGWB/B8X9xeIDZ1/ag4NfslyACD4LwocweQIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604111;
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
	bh=PhBfFLNSokRVdxYBhgRzWtxnyTnkt0FgkfiGyVyePLk=;
	b=PhwxIN/P2CMHow3+3CFCV7/uEos2IRh0uDEhEdesUISiat7N/8WdSugbXFOfVnXb3ncC
	 C8n9ff5J/ItGtn6q66LT/SDf81keofdgBcCujso+OjOyhV+LuOsUHAO80AuAxDJNFaLox
	 zlygD6UuTcDoloBsozcUgNz6caiz3DeMwVN5+YWJllHjSi9WTBKIuk5vEOZQYYALlucVH
	 i7nEhTQNphZ5GCEAYkDdQS23Xfz3QWn7nXSDnb5I9sdiaNYW3knukk46fTn2TZNFqxvzQ
	 w1Et01o7yX6qYOsba4wsK+RFh8/doP7klisvcl0ZI1fL6DG2povz0OF8/8cAzLZldbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=N7xYrMkN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.45
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012045.outbound.protection.outlook.com [52.101.66.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60519606A326;
	Wed, 25 Nov 2026 10:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60519606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=N7xYrMkN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzJWddrkgcOLrmgYRo2esX4TwZ0ymnthaZdqNmX0G3zW21j9RuqLtKZcYzCYFmUPWJz9llkxXaNnvcNVnMJH2J+KCrVgsmqhxkaHzGJrfV6tx3PVxvHikm60ostYWJYsQgB3/a6ERwntv5kfJ9u2EKEbUNpbk0er88IQIp0yMOeszRwo71F9MBU3P+zME9l9Z73r8nUr1K5pg+O/8WEnSlETgYjAj0AYFFG4v2NbFBA0lDZ1Q5T3c90CJmkClymutxzy9YhEnBeLMHO8mCxdY71N4oMqZYEESy+hUGuWuOvQT04MRPrFKUjpBqtCzum84NibDhzROvdyHKT/GqmX0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhBfFLNSokRVdxYBhgRzWtxnyTnkt0FgkfiGyVyePLk=;
 b=iwRHtRRt89G/7670TXSvOvmSYMJ428Xuq9szzuFwFGXYs96Mmf89oSBsbahSw3U9tPiGJjW3ub36fLAzPWO3fd72Ayxqjd5t167+Y4zGRy8AZmBnL3REfeSs8GftPZFmQqzlMAkvoLtpzLaSzOufPNrW1ltEiE5J4ZFQu2GeNs+687yOXw5UQVF49to4e2S5S2iiIayqkartwA8lHml5gYFDl3YDxNDdvt7wlDJjBA19nanzMnSwh1BUPWze97B9VdVgr2nGqOYy86+zMPHyq1TPgPCNu5A+wzBXDVzn8hcNo6ygp0ChMbwGQJes7Hl56HezOEH0I15xc1a1oSnasg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhBfFLNSokRVdxYBhgRzWtxnyTnkt0FgkfiGyVyePLk=;
 b=N7xYrMkNyUKdHqBTCMAlYB8i1rKJ3cyvVOg2m7gBDhajp7nyoXhM5kqs1GqWVecKSa1E34rstFVH7YbPMxR0PnVBerq62wJcBbOwQfNyRj985sGUwRGPE8kqPzht/zkP6pNPiJl7uXptRwNhe1Un/kEYztvAAM0c/MFlSH6i8nN1M5fpdHiGhty553Tp2W6IT3gqtptLQLzfsRDLKj5JECWTAjQZdzEoyLi0hb/HTvJkoBN7G+NlCZ1AYtC1S3WyhteqQJKdE3o2dENZixEkDgvY5zbh76yDGTlaL0a6gRW+MaSrslylq3Xk0v94ERRobfiL3gR7VzDoQzMhP7hUFg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by BR2PR04MB007356.eurprd04.prod.outlook.com (2603:10a6:2c8:6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 10:55:08 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%7]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 10:55:08 +0000
From: Joy Zou <joy.zou@oss.nxp.com>
Date: Wed, 25 Nov 2026 18:58:59 +0800
Subject: [PATCH v8 5/5] dmaengine: fsl-edma: add runtime suspend/resume
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-b4-edma-runtime-opt-mo-v8-5-81345a3bfb52@oss.nxp.com>
References: <20261125-b4-edma-runtime-opt-mo-v8-0-81345a3bfb52@oss.nxp.com>
In-Reply-To: <20261125-b4-edma-runtime-opt-mo-v8-0-81345a3bfb52@oss.nxp.com>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: Joy Zou <joy.zou@oss.nxp.com>, Frank Li <Frank.Li@kernel.org>, 
 imx@lists.linux.dev, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI3PR03CA0007.apcprd03.prod.outlook.com
 (2603:1096:4:297::18) To VI1PR04MB5807.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|BR2PR04MB007356:EE_
X-MS-Office365-Filtering-Correlation-Id: c151faab-f390-4f73-bda6-08df4ae291b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|19092799006|366016|18002099003|22082099003|56012099006|11063799006|261009220027099003|261009221727099003|261009221227099003|261009223327099003|261009223027099003|261028144727099003|261021121427099003|261102123227099003|261021123027099003|261026121527099003|10067099003|261026140227099003|261022105027099003|261022075727099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	2bvWmKFw3SvtWChW7Y5JGkan/yMdu3bK2mDHVeLlUZkGt2SakWlroU35yLySjXcDbazCcxBC9lJIMtpO7EHjX33Y0gBiqfEMkYd9WMgqZbCwhKJHXJMZJBrPGktQC78apsqph2BX7YJ0z8htaHxGBTddzaWO3OkES71ZxiWmIIJ4HtX1nhfrB5I43gI+ZKA1rKiuoMYVBzeX54aK4T+i+y9iizK7kYaS0UPq+a5ZDUBQZDYPzwZRln5rN4XmF1fCJuR6k16re/bjU6KoRFUej+qZaF6eEhm9TXfRH1sXupKO5wfeMsfumvMTy47ca49eW8lvoStsdOFiUU6263uF7kr2GGXAjtvHHEp265p5vIzyaqcFoAWoLXpa1YzUBTAJluzXNaPx3dNZadrZjWZp8aEcEfG95Yr+Wxcfx+8vZFfcPft/W0OlQk07r7iWna8HeQ+PxXaxba9jumxDg5b2VRVi9SCk/rujbXqsS+xXUJFMVKE4ZodnPBiZlPek3QLNlrLSlcgo7qBs4ZueQluDBV4kfq2yHkTtevidU0mu9eTQR7LAxa7fb8pbz7Zrs7qLFn3wrPCX6bceSvBHW3uOaQM1s8N2wBV0nFaQJW60aB4Z0VN0rNC9k3NCzVaDfgMN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(19092799006)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(261009220027099003)(261009221727099003)(261009221227099003)(261009223327099003)(261009223027099003)(261028144727099003)(261021121427099003)(261102123227099003)(261021123027099003)(261026121527099003)(10067099003)(261026140227099003)(261022105027099003)(261022075727099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3IwY2s2cXZRY3JmcE9LaTU2MXE1ay9INUtrSmRRSmk2YTdyYWpYUisva3By?=
 =?utf-8?B?YVB4VnRqK0tUYmV1K0FDTFBZc0o0YWUrYkQ0UENiOWJUbXUrTTlpWnl4M1kw?=
 =?utf-8?B?cllwVEx2elBIMWdoaXRoeTNINXVMWEZIRFU0ai9mVFpwcmgzWld6c1p4aXJp?=
 =?utf-8?B?SlB2SGI0ZlhIRFA4N3Q0TDFlVjlFYzJtM0VpWkNmSnVEK2IvaXdReTdGLys0?=
 =?utf-8?B?V1VRQVdleDdDNHlFYjFYWjJNaW9qNkY5WFNRa1FEMUQ3VlhiRkdtK045TTEx?=
 =?utf-8?B?M01IalhHTmEwNUYrUTFPWkNNZ292aGYxYkJVM3orWjBnVzJqL2lMbUJwUlRY?=
 =?utf-8?B?SzhmQTFNRHZKS1NlYjdLMGhvNi9naWhmMUsrVG9DQUZ6dG82SW5kNmxVeGNG?=
 =?utf-8?B?UU16L1EvVHAzZkdXdzVoRmdRQU9CZkdRODBKcTZnREZPTjRtQWR5TWFNSUNZ?=
 =?utf-8?B?dzJSRDRIZUtiMUtRSmtrUHNVTGdLaWtSdkZxYW5nN3cvcjNNQ0wyd1dsUnBn?=
 =?utf-8?B?dW15VzkweFJpaS9jaTlwWlRYSTJmRmtMU1I2MEZWNHdCUTBnMHA0d1M0ZXQw?=
 =?utf-8?B?aDU5bHZ5Z2xsa0xGdmRnQkx4d1AzSTV1UmdqTERNMXMrUHhCY3FPZ3dXaDRU?=
 =?utf-8?B?RjZTaW9YS3FFYU1rU3cyT2lXRXR0ZldBV01lQXplb0VWSmJvREVuM3FlZFhw?=
 =?utf-8?B?TkppWlZ5bnBFMHBDdml1clFOcHlaSThYVXJ1a1hpTFFPQzFuOE5CMHFNQWVy?=
 =?utf-8?B?QURteXdLVXkxZlFaTUp4aE9yQWFuT2VoYmpwYitVbzZIS082U2swdlp2ZlNa?=
 =?utf-8?B?Y1E1V0J3a2VDRjRzbnllRVE0c2VFYm1yeVozWnh2T1ltVFhlVEo3RTE5eE5F?=
 =?utf-8?B?OE8zK01LaDNuV3NTT2E4UkNxeE1GK0ZiRUI1b2ZiY3VuRDhhTDdidkllQ3hh?=
 =?utf-8?B?b0xOTlZWZVRaWTNWUHk4WmhGc2xPcWVub0dPVXZyMWhPcnFUN3ZFRU9DdXpZ?=
 =?utf-8?B?R2YwVUdOQVl6WGljOHJmM244QURsMStkSi9DUi9hM01NQUNRT1Zpb1NMRHZw?=
 =?utf-8?B?Z21qSlkyM2lRb2JoK0hCMkZ0MDdGRm5wYnYrOTRLVGIwZllUbnR1UDVLLy9U?=
 =?utf-8?B?VjczWDNvV1hlaWdpa29RNlE0U2xBWEtFUEU1WWJLRHNvRzFPVThqUXZCbFR3?=
 =?utf-8?B?OFMzNnZrdEZZSjdrVlpUeng5R3VyK0JUMitkN0w0SFp4NUFaOUlSTy9uUUxD?=
 =?utf-8?B?VHVWaVVOWDB5TkI2aHIvR09makVBUG9mMjNWN1RrenhZTkxoVWpCS1ZBOHpa?=
 =?utf-8?B?eUVodDV1cmYzdGNCY1IzSy84WjQ1TlA3aW1NY3JnQnB5YUpLT3Uvanhlc296?=
 =?utf-8?B?UGxzZGdIUTJBa3k2blFzZm5XZEh4WXY2NW1LcE9UM1VLVUI5TFdHcXQvMUpN?=
 =?utf-8?B?YkpuMHVDKytRdG9zbEZYUStGUzkreWJTRXhtak5IWS8yN3g2UWVvZDMyT2Js?=
 =?utf-8?B?QytqV1dUVjVTVWdZWVpHL0dDMVUyK0JXR1o5ZXU2a2ZnVU9kL0Fma0Z1Uzk3?=
 =?utf-8?B?eTJnenh1cXVSUnJ2Z3hFdWw5TnU1ZmFtdnozVjU0MEFPeFFWZHhFSXJ1Ry8r?=
 =?utf-8?B?U1JPVERIODMveit1Z3JsTi82ZlhUcUYrZEFrVlZOZjVRQzJTNHo1WU43NE0v?=
 =?utf-8?B?Tk1SSjdORTFRM2o4QjN0T0J4ejhFblFjb1B6MWdnQ1M4VUppeUZTSWZlVnlY?=
 =?utf-8?B?MVBBZXI0RFNkd1RHVDhCVFZUVmYzTCs1MUlOcC82cnlXTk8yN2pHZ3IyNHYx?=
 =?utf-8?B?SWRKaEFFVk1QTUdKeXlzZ0ZiRjRxbWNxZyttNE9iQ2VJbFMzWmkxV0Z2QWs4?=
 =?utf-8?B?S2hqRjNzSlhwY2h0c3Z5K1FpcE9RWUFMVXc0enBNVkdLcXlKUUc0bC9hcXFk?=
 =?utf-8?B?SnFyY0xQWE53YUJaSTh4ZTZ6QWZMNG5ubENHc2dON0hjRUgzQUNKY2p1a0lu?=
 =?utf-8?B?dTBMbzZQQjFzbHRnTU9VWE5hSnVPOTJXeVlqTXZqZzJVYTdDV2RXN3laRmJP?=
 =?utf-8?B?ZUlwYWkxWEJmUys0Z1lERXkyb211emlyQWhtdGpzc2dLSmgxeEFNalJkMWV6?=
 =?utf-8?B?UCtiWFR3Wm04Um9LcnJ1cEhNcmhvaTJaVkxWMGhmd2dGN2hQSWJHcUxqblAz?=
 =?utf-8?B?ZEZ1b3VhMzFXU0JuUzRsSVhJaHJNSmU0aTdHcTBEcC9ac1h4UXZML1lvbDcy?=
 =?utf-8?B?NUNPb1h4MDN1YTBsS01RM1FPR0t4NkJLL29yS3J0dEs4cUF3aXNaV1haWGxy?=
 =?utf-8?B?Sm5tS3lvNUNPQkdvbU1GdklFYmxWcWZGY1dpcGkwNm9CZHdZb3ZXRUhLZ05y?=
 =?utf-8?Q?qXXNjVn+s1AsjsW5m6QuBPMS7WHEuyabegSlZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c151faab-f390-4f73-bda6-08df4ae291b6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 10:55:07.9232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9W9aokjyl8qlt138cyp0Thn5+3MvVGjM1VTajiMFO4kx+TkdukIQsv/lxWJ9kB57UamfatjqtCI7EZPq6qbHypOvniDs0KvXrGoTz6wxLiM4JXJ6aefeV6ELISOpAFrK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR04MB007356

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

ARCH_MXC selects CONFIG_PM, so CONFIG_PM=n is not a valid configuration on
i.MX platforms. Clock handling for the CONFIG_PM=n case is not implemented.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in V8:
- changed the pm_runtime_get_if_active() return value check from <= 0 to == 0
  to account for the CONFIG_PM=n case.
- remove reduntant pd_dev pm_runtime handler due to bind the dma channel.
- add the pm_runtime_get_if_active() check for fsl_edma3_err_check().
- add chan_masked check for fsl_edma3_or_err_handler, fsl_edma_tx_handler
  and fsl_edma_err_handler.
- add synchronize_irq() for txirq_16_3.
- remove the manual device_link_del() call to avoid use-after-free.

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
 drivers/dma/fsl-edma-main.c   | 273 +++++++++++++++++++++++++++++++++++-------
 2 files changed, 240 insertions(+), 47 deletions(-)

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
index fdb2577d1ccb..5500eb17f579 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -37,15 +37,35 @@ static irqreturn_t fsl_edma_tx_handler(int irq, void *dev_id)
 	unsigned int intr, ch;
 	struct edma_regs *regs = &fsl_edma->regs;
 
+	/*
+	 * A racy or spurious interrupt for an already-suspended
+	 * controller or channel is an extremely rare corner case and
+	 * highly unlikely in practice.
+	 */
+	if (pm_runtime_get_if_active(fsl_edma->dma_dev.dev) == 0)
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
+		if (fsl_edma->chan_masked & BIT(ch))
+			continue;
+
+		if (pm_runtime_get_if_active(&fsl_chan->vchan.chan.dev->device) == 0)
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
@@ -55,10 +75,15 @@ static void fsl_edma3_err_check(struct fsl_edma_chan *fsl_chan)
 	unsigned int ch_err;
 	u32 val;
 
+	if (pm_runtime_get_if_active(&fsl_chan->vchan.chan.dev->device) == 0)
+		return;
+
 	scoped_guard(spinlock, &fsl_chan->vchan.lock) {
 		ch_err = edma_readl_chreg(fsl_chan, ch_es);
-		if (!(ch_err & EDMA_V3_CH_ERR))
+		if (!(ch_err & EDMA_V3_CH_ERR)) {
+			pm_runtime_put(&fsl_chan->vchan.chan.dev->device);
 			return;
+		}
 
 		edma_writel_chreg(fsl_chan, EDMA_V3_CH_ERR, ch_es);
 		val = edma_readl_chreg(fsl_chan, ch_csr);
@@ -66,6 +91,7 @@ static void fsl_edma3_err_check(struct fsl_edma_chan *fsl_chan)
 		edma_writel_chreg(fsl_chan, val, ch_csr);
 	}
 
+	pm_runtime_put(&fsl_chan->vchan.chan.dev->device);
 	/* Ignore this interrupt since channel has been disabled already */
 	if (!fsl_chan->edesc)
 		return;
@@ -132,13 +158,23 @@ static irqreturn_t fsl_edma3_tx_handler(int irq, void *dev_id)
 	struct fsl_edma_chan *fsl_chan = dev_id;
 	unsigned int intr;
 
-	intr = edma_readl_chreg(fsl_chan, ch_int);
-	if (!intr)
+	/*
+	 * A racy or spurious interrupt for an already-suspended
+	 * channel is an extremely rare corner case and highly unlikely in
+	 * practice.
+	 */
+	if (pm_runtime_get_if_active(&fsl_chan->vchan.chan.dev->device) == 0)
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
@@ -185,20 +221,40 @@ static irqreturn_t fsl_edma3_or_err_handler(int irq, void *dev_id)
 	unsigned int err, ch, ch_es;
 	struct fsl_edma_chan *chan;
 
+	/*
+	 * A racy or spurious interrupt for an already-suspended
+	 * controller or channel is an extremely rare corner case and
+	 * highly unlikely in practice.
+	 */
+	if (pm_runtime_get_if_active(fsl_edma->dma_dev.dev) == 0)
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
 
+		if (fsl_edma->chan_masked & BIT(ch))
+			continue;
+
+		if (pm_runtime_get_if_active(&chan->vchan.chan.dev->device) == 0)
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
@@ -210,16 +266,36 @@ static irqreturn_t fsl_edma_err_handler(int irq, void *dev_id)
 	unsigned int err, ch;
 	struct edma_regs *regs = &fsl_edma->regs;
 
+	/*
+	 * A racy or spurious interrupt for an already-suspended
+	 * controller or channel is an extremely rare corner case and
+	 * highly unlikely in practice.
+	 */
+	if (pm_runtime_get_if_active(fsl_edma->dma_dev.dev) == 0)
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
+		if (fsl_edma->chan_masked & BIT(ch))
+			continue;
+
+		if (pm_runtime_get_if_active(&fsl_chan->vchan.chan.dev->device) == 0)
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
@@ -631,12 +707,10 @@ static void fsl_edma3_detach_pd(struct fsl_edma_engine *fsl_edma)
 			continue;
 		fsl_chan = &fsl_edma->chans[i];
 		if (fsl_chan->pd_dev_link)
-			device_link_del(fsl_chan->pd_dev_link);
-		if (fsl_chan->pd_dev) {
+			fsl_chan->pd_dev_link = NULL;
+
+		if (fsl_chan->pd_dev)
 			dev_pm_domain_detach(fsl_chan->pd_dev, false);
-			pm_runtime_dont_use_autosuspend(fsl_chan->pd_dev);
-			pm_runtime_set_suspended(fsl_chan->pd_dev);
-		}
 	}
 }
 
@@ -665,23 +739,8 @@ static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_eng
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
@@ -689,6 +748,45 @@ static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_eng
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
+	if (fsl_edma->txirq_16_31 > 0)
+		synchronize_irq(fsl_edma->txirq_16_31);
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
@@ -730,11 +828,11 @@ static int fsl_edma_probe(struct platform_device *pdev)
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
 
@@ -761,11 +859,11 @@ static int fsl_edma_probe(struct platform_device *pdev)
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
@@ -808,20 +906,13 @@ static int fsl_edma_probe(struct platform_device *pdev)
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
 	}
 
-	ret = fsl_edma->drvdata->setup_irq(pdev, fsl_edma);
-	if (ret)
-		return ret;
-
 	dma_cap_set(DMA_PRIVATE, fsl_edma->dma_dev.cap_mask);
 	dma_cap_set(DMA_SLAVE, fsl_edma->dma_dev.cap_mask);
 	dma_cap_set(DMA_CYCLIC, fsl_edma->dma_dev.cap_mask);
@@ -869,11 +960,56 @@ static int fsl_edma_probe(struct platform_device *pdev)
 
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
+		PM_RUNTIME_ACQUIRE_IF_ENABLED(chan_dev, pm);
+		ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to resume eDMA channel %d!\n",
+					     fsl_chan->vchan.chan.chan_id);
+
+		edma_write_tcdreg(fsl_chan, cpu_to_le32(0), csr);
+		fsl_edma_chan_mux(fsl_chan, 0, false);
+	}
+
 	ret = devm_of_dma_controller_register(&pdev->dev, np,
 			drvdata->dmamuxs ? fsl_edma_xlate : fsl_edma3_xlate,
 			fsl_edma);
@@ -885,6 +1021,10 @@ static int fsl_edma_probe(struct platform_device *pdev)
 	if (!(drvdata->flags & FSL_EDMA_DRV_SPLIT_REG))
 		edma_writel(fsl_edma, EDMA_CR_ERGA | EDMA_CR_ERCA, regs->cr);
 
+	ret = fsl_edma->drvdata->setup_irq(pdev, fsl_edma);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to setup IRQ!\n");
+
 	return 0;
 }
 
@@ -907,6 +1047,19 @@ static int fsl_edma_suspend_late(struct device *dev)
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
@@ -926,19 +1079,56 @@ static int fsl_edma_resume_early(struct device *dev)
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
 
@@ -953,6 +1143,7 @@ static int fsl_edma_resume_early(struct device *dev)
 static const struct dev_pm_ops fsl_edma_pm_ops = {
 	.suspend_late   = fsl_edma_suspend_late,
 	.resume_early   = fsl_edma_resume_early,
+	RUNTIME_PM_OPS(fsl_edma_runtime_suspend, fsl_edma_runtime_resume, NULL)
 };
 
 static struct platform_driver fsl_edma_driver = {

-- 
2.34.1

