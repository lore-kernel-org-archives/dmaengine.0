Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795604081;
	b=47m9UDkKugsfLI894ps+W1HNxiSMJxDZXnttrMlLHbeAJCT6XAormJdfFqwH9I7wAurz
	 AWQU0+OdbJLl0P5MBkhI74qp+Hnnydh4ndpR/9kuJc5cAuU6x12xQIE9M0rgz5pz9eAdB
	 CIi5YqyTE1QkD8u5JRDmm2JMi+lldg9pfIgqxYRwFyiXt4k9V+wQ5t11JTeKJZq/JzsGg
	 BH8M6IT6FDowWiFQhDAHrOz8a77oYh9an1qadfwc5/EKB0MZSXwSBbmP2sLabq6rQ+68Q
	 eAXjW71KWbg/AD0ZXvrGmVTE6LdducR2tOCYlYUgXUcc3vwMc1Qdfr0JDOewJvOIavQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604081;
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
	bh=RWMWzgggKVVIw7LnGCrPHYuHofGJ8Z2Ux3McvWL/Xnw=;
	b=acOZBvXQkLUHkYDo02Jbham6pXEJIr0o5wVbfiIQ/fhGEvwHpOhcIe0tzhPmfgB+PHAQ
	 Low4TamACiVCgevlan88iz1yMJAG8BlVBcjtTxk7iPw4z/HyzoJRbSRZWriUFm+rp4ieK
	 GFAhAWDYwkwwFsr5u7vpdRHxYbCJi5UZFxzoX4IappllOF63kgta8WXsxCU+hssmBQZTQ
	 yWr97G9Ze36e1xG9ZJ/9ZbVw0MyCGlR1a4SMKpsXaZT53hKkVJTzfeU4tTbIFNjRXMO7R
	 cVroo95HlFJGMXPtTa5vTEDwX9ESmtth9OJTp0GpmqTkKx+u2vTY972ky2bsP9I49zQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="mPyR/r0j";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.52
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010052.outbound.protection.outlook.com [52.101.84.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E75A606A31E;
	Wed, 25 Nov 2026 10:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E75A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mPyR/r0j
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmK6GqFg8Ik3KLNBzwb3OwOz2+9HC1fvPtDMEV+lukGv94hWOAPQHCkwJJsUAzIZqQaKz4dY/Fo8Gv60Rx6A1IWgi/ODHls5ymY5tWNq85SOBaO2Xq+bYnj/Is5WF/7+ORzbDkv4KxyiLFWc+9QaNuDO81SLpw/p4mIDGEZ2OoHhzneqVZuKWcG3+owesOqOkTnQRxYSSVtlfh58Oi+90/QDV5cik9vZU+wuEpxJkFkBuU9ww7q1WzJmEEBps3ZkBcdLM3zO/bYLxs7Wz1RFvEnCh7pekY8ATEtdJHsHftTl49Z82APtzqRx2y0gd/v5nzknmEp/L/G52Xjb+C5EkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWMWzgggKVVIw7LnGCrPHYuHofGJ8Z2Ux3McvWL/Xnw=;
 b=mXzC+Upi9zMsk8Veit0jwlPKKtHOwULPLEl0lVtzSmfDcA3bHUhCP4QJvLd0QA0WO+ANNScOEpctYlEMf0t/vPjAbtHym3Iq4zbK3VO8ClVrRigSkpOaIOySxBoby/EVMUurzwB2IqYnL35q33oOt06zSQAN4h9OoPbn/+447c/nXIcU3xBHxwvV58E+b1BiK6LtsEfdokr1+VslpYGzGx9AvDc+8X+TiikQFy9xhOkzssXOccAcXt9mD7aTlaMtuTslNOF0z0tNdARUxxpsNjp8wyoWT99CWLQbmB87w3wDEu5iOvHI3gRfWvFSQMxPDT2B9+XlpYuhLxrpIeqc1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWMWzgggKVVIw7LnGCrPHYuHofGJ8Z2Ux3McvWL/Xnw=;
 b=mPyR/r0jGXSFnUHGMdaD87GfxQqvQfI39rHuWCuRuZKpiQAgL2xlmv+b0CCT4BK8rOhVuWGHHcpjyP1HYjXQhb3RGrvBTBOeBX9ZetvXHZezs8WleZFm52cvpRoDfrX59n3IUTATKlSCOkek+HKvkvD4vEj/QOObv+uLAaHNz+JcNDZtoER7e1wWzZvn4cgBV/19hrp1BQlNVyybmiP4RB1LG9BqyU5WFgHlbprv7rTQEuUt9v64gIKac+oHNGinHbznDfdNrk+kkC4s2ryaOEcUWaQA8wja3Tg2Td2jRrjHxkRMWS9PbiUJRmki677NCAKY5qx30kkNeQq2Dwc6Ew==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by BR2PR04MB007356.eurprd04.prod.outlook.com (2603:10a6:2c8:6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 10:54:37 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%7]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 10:54:37 +0000
From: joy.zou@oss.nxp.com
Subject: [PATCH v8 0/5] add runtime suspend/resume support
Date: Wed, 25 Nov 2026 18:58:54 +0800
Message-Id: <20261125-b4-edma-runtime-opt-mo-v8-0-81345a3bfb52@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG6/BmsC/3WNyw6DIBBFf8Ww7hjwUR+r/kfjQmCsNAEMg8bG+
 O9Vu+7yJPeeszHCYJBYm2ws4GLIeHdAfUuYGnv3QjD6YJbx7M5rIUAWgNr2EGYXjUXwUwTrgWv
 R9Iiy1BLZcZ4CDma9xM/uxzTLN6p42s7FaCj68LnKS3XurojgWf4vslTAoRA1lrkqh0ZWD0+Uu
 nVKlbes2/f9C3ABWN/QAAAA
X-Change-ID: 20260811-b4-edma-runtime-opt-mo-0d19aeeb5dbe
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: Joy Zou <joy.zou@oss.nxp.com>, Frank Li <Frank.Li@kernel.org>, 
 imx@lists.linux.dev, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI1PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::17) To VI1PR04MB5807.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 0c4cde6a-d7ef-47cf-14bb-08df4ae27ef5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|19092799006|366016|18002099003|56012099006|11063799006|261009221227099003|261009223027099003|261028144727099003|261021121427099003|261102123227099003|261021123027099003|261026121527099003|10067099003|261026140227099003|261022105027099003|261022075727099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	iqGmPCNXPBn53V468yJkq74AxlxaN1WlHp1kGss+UgE0TGM08YRv26PJTrPVAtZ50qRwVCHSILh0/ESmMKlmrhc0LKElWxzrBbWLwqFhp4D5yZcV1DRFyFQ3VoLLZLGp0qMaFLBIl//euv22RfgsroX9pb0N9V+ESuhf3fA6zfKXboPP815M5xtEfhDg7NkacMQFSLDP3hngxpC8E2hOQuEDcxV/jNupUQlHgc9dVP/G6F8rm7xrovz/RSBVp9MyB7s0DfqwkZQ3qspErfG6zmKJgONGFNV2+GTV2ygmlmuI+1b0rVsRDVARXIwFa/rCE+fvgwMN9JE0hKU00w9AztBxXYXqtltLqX9Y8WsesZZinzmI5tLsNeucpdPehkpq5GmIWGPe4VQvTinHTP/w9kTQJErUylRizt62T0RGbIn+xJcHpgcMggxcj7An3wUqGNgI9HRN0oy29Jne1noJfFYx4fDl5+/e2kAhMwwgf9vUwl77VdxPHIyDU2gET51AHl2lFFyA7CBKn5370nxDsdy28Yegf7FEW2INUsJ5KmKbpGQ5i7TdRp5KfJ/Qm217R5Bs5+OFRoP/ZFkYXCmvwZjx1RPwMUx3bRQ+YjDEEa13J9y4pEoG6J/eaP46IVGS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(19092799006)(366016)(18002099003)(56012099006)(11063799006)(261009221227099003)(261009223027099003)(261028144727099003)(261021121427099003)(261102123227099003)(261021123027099003)(261026121527099003)(10067099003)(261026140227099003)(261022105027099003)(261022075727099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ky8yS3puYis4cm42eUpCQzNXRnVSLzhLVGsxc3BBRWNBKy9YYU4wVEdFNTEw?=
 =?utf-8?B?RUNoRXhyUC9ZREJpdjYyUER0MnovdVo1TGJGUkRPSGFzQ3ZKN0FTRlZ4MWd2?=
 =?utf-8?B?ZHBSQlZBclc3NkdnMHBwcVEvVTljenU3Zk9kTnBCb0dDL0E2OEdHd2xNU0tt?=
 =?utf-8?B?T2hQV01WWXdXRTdaMytNUXQwbVpkNXpoUm9iSG1vVmZoK1RNMlJOWDhwOTBT?=
 =?utf-8?B?Z0pKc2VRbU5uZ1NWZnBiSCthT0x3WFFvWW5BU25QYU8xMU0vNVpXcFJqZlpn?=
 =?utf-8?B?VG13N1dEVWp0dll0V1NFQVMxMHpEdSt6OExlalRKbE05bDFGQVEwdVV1VWlX?=
 =?utf-8?B?MFFqUTZJMHRIbTVJQWswUWpsMzhxQWNrMWZtZFEvNUYveEQrL1J4VmJKVXJY?=
 =?utf-8?B?ZkxVWWViUm81M3J4TzFwbm9LemFoYmpPVE80SGVNZ3NxSzV4dlZSK1V3aVhF?=
 =?utf-8?B?ODFmdUFhNmZzSndGaUNaekw5dE10bXdWM05YYUVrUlJYbXEvVFJlb2JOQmYr?=
 =?utf-8?B?bE94WDF6bnBYY045b3MrdHlRY2JHR1l0NWFyK3huSXJJQ29HSDFtQ21PNkNL?=
 =?utf-8?B?ZFhkMlZXQzVja1Q3enZxQjJ5cS9OcWx5MUFzcWp0TUFzZ2NjbllhQzhSWHUr?=
 =?utf-8?B?MllQN2NORE1sZ043aEdkei9IRTFWeDlFdmxOUUtGRW9zd0FSYmV6MEhySmli?=
 =?utf-8?B?Wmt1c1N6QTdwUkNQVC9rMnNMbGhIUmFtcDVicGdHQ3pTaWZydFg1TVpnSUhV?=
 =?utf-8?B?U0pRYVY2cW9GY1dYY2NiSUk2NnNFcWJtcUp1Wm1XZml6WHR2dlJwc2tvQnZj?=
 =?utf-8?B?VnZxVFBoT0ZQb1JJaUx4QTdIb2RXRXEzc3Q4cXpLSDBkbDl1M3RlOWlicUNH?=
 =?utf-8?B?aXg3d3lZL0RpdXNRcnFFSUwyZk96a243OWxsMWlJNG9oblZxZ0lSamYzMnpa?=
 =?utf-8?B?RW0zREpFV2E0RGVUeFdjZGVoaTFNU01ZbTF4TllLZVkwcXU2cUpyTm9wQXht?=
 =?utf-8?B?NithQ2NYOHpPTkViV3lFV2dUY21qVzdYUnIwclVBRWovdThoNk52ODh5ajEx?=
 =?utf-8?B?M3BYNzRlQ25LZXg3dGxNNjQxMXpDTVV4WHZxR01vcHZ4TkFDWjFMYno0eCsx?=
 =?utf-8?B?YXF3bGdNaHdVODNodDIxVVIyRmpVLzhTaGM3MU8wRmUrbUJwSEhldFhRckdj?=
 =?utf-8?B?bE9SZGRvUjZZbDJhVUZINWFkNGlZb3lNbHp3WW5wQlZZRWdSZGFCMmVkUk01?=
 =?utf-8?B?N2ZmRXc5SGJjbnp0YUpRTDd5Z0lNc0ZpeGhoV1Q0TS9JL0JWYkJ3NStiZW5j?=
 =?utf-8?B?ZlpyNnRFMDZxV3dJa28rRHQyQ1o4YVp6dU9VVitmRWIvekNJN2JJQlM3VnBL?=
 =?utf-8?B?QjVVeURrcE0vTU1aMGlkRHNQM1ZQdjRjN2dSYzhRQzFUd2x4a0hEck9hTVJt?=
 =?utf-8?B?YllxRk1Yd2t6NEp6TWlwcWd5T3lVMDMzTEprdVFETnE3QXZXWXNFcEhzM215?=
 =?utf-8?B?U0dHTXFZVEZ0c0owVnF1Q2RnK3o4RjVCeWhnR3hzRW1iTFJjbko3a2dmTE9W?=
 =?utf-8?B?aVIyZWFvMjFmZzVyb2xndWFkYU9QenM0V0VKdTVqUzdlL1V3K0pSNUpNYjE4?=
 =?utf-8?B?TjNEZUROT053ME9TTlJLbVB6S0RseW1odm51N0R1dWVzanUvdkI5djRGWjNH?=
 =?utf-8?B?aDVua291R0VBR3A5dC9RSTRRMkUxdE56OXF3dDgvdXQvOXdwdlo4UlJuUlFk?=
 =?utf-8?B?b29zYlhoeG50Si9kdWt1a0VhMWZFUklOdVlaY0kxaGV4bWJoYWR4aDQ5UHlw?=
 =?utf-8?B?cFFsKytxUG1xYTUyd1RwVHhkc0JQUUhFbGVpQ2IvVTg3MFJBTlZDYjNicGox?=
 =?utf-8?B?UlBzYVhSbXkzK1p1NGFKZUVkdmlpUWc3azFNb2dzYUo4aXlFWnFYS0lSRnJS?=
 =?utf-8?B?Y1dhZElMN2xCclkwNGxsalJjUW01VTIyLzdOM0ZheTVpSUJrQjNPMWdkTmk1?=
 =?utf-8?B?VkNpbmxKRjVYR1RsM3p5azB0MnNNSG8rUzM0bnRqNHEvRnpRbmR5Zi9uVXFm?=
 =?utf-8?B?MVdEaXNXNUhMQm03SFNWY2htbUw1eCttWGxWMlVzQmFnWStTT1RyNXFBdTdY?=
 =?utf-8?B?d3J5NWFaRGwrem9YUklJWVJwc3BBY2pUdjZvR0hENkVJMWd2L2VLTGV2T2RS?=
 =?utf-8?B?S1ZqQTRQYmxxdmM3TFVNaUtKTGtJOGR6N3hoZ0VRMTFtWUdGdG9xb0lpa3lU?=
 =?utf-8?B?UEMyQS9uSDZvWkhvWnc1cjdndkxyQkpUWE9XRTVLQWxHdGdHVEw5cm9ja2J1?=
 =?utf-8?B?L1lJYTdjL2FmMzIrai85VTBqTjFVKzI4dWtBRFhObCt0aHY0TGg5V1FxVjl2?=
 =?utf-8?Q?TUG8c57cJp5+PQsKQZ2YAFb2luKJFKtI3R2Zn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4cde6a-d7ef-47cf-14bb-08df4ae27ef5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 10:54:36.9545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yf9zqX9nBF7MX9JfKxlR6uxoyikv9MEGRTDUhTKAcTJZMtTHPnfPOKNBmP9jYajgisSfDPZ9CKTrzsKs1WVRXDp5kQs9HxbqCGx25GuhCKqTQQck/5exAnFJsYUR8Ut3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR04MB007356

Clean up driver FLAGs and introduce runtime suspend and resume support for
FSL eDMA.

Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
---
Changes in v8:
- deleting clk_disable_unprepare(fsl_chan->clk) avoids a double-disable
  warning, However, the clock stays on and won't be turned off until
  driver removed, which increases power consumption for patch #1.
- add a new patch to prevent fsl_edma_alloc_chan_resources() from failing
  when CONFIG_PM is enabled for patch #4.
- changed the pm_runtime_get_if_active() return value check from <= 0 to == 0
  to account for the CONFIG_PM=n case for patch #5.
- remove reduntant pd_dev pm_runtime handler due to bind the dma channel
  for patch #5.
- add the pm_runtime_get_if_active() check for fsl_edma3_err_check() for patch #5.
- add chan_masked check for fsl_edma3_or_err_handler, fsl_edma_tx_handler
  and fsl_edma_err_handler for patch #5.
- add synchronize_irq() for txirq_16_3 for patch #5.
- remove the manual device_link_del() call to avoid use-after-free for patch #5.
- Link to v7: https://patch.msgid.link/20261023-b4-edma-runtime-opt-mo-v7-0-418e53c5f9b7@oss.nxp.com

Changes in V7:
- replace devm_clk_get_optional() with devm_clk_get_optional_enable() for
  patch #1 and #2.
- replace devm_clk_get_optional() with devm_clk_bulk_get_optional_enable()
  for patch #3.
- replace devm_clk_get_optional_enable() with devm_clk_get_optional() for patch #4.
- replace devm_clk_bulk_get_optional_enable() with devm_clk_bulk_get_optional()
  for patch #4.
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
- dropped patch #5 since this is a pre-existing issue that will be fixed in a separate patch.
- Link to v6: https://lore.kernel.org/r/20260701-b4-edma-runtime-opt-v6-0-354ff4229c00@oss.nxp.com

Changes in V6:
- add synchronize_irq() before disabling the channel clock in fsl_edma_chan_runtime_suspend()
  per AI review comments.
- add pm_runtime_get_if_active() in interrupt handlers to ensure registers can be accessed
  correctly per AI review comments.
- remove manual fsl_edma3_detach_pd() call when device_link_add() fails. The devres
  framework will handle cleanup automatically on probe failure per AI review comments.
- clear fsl_chan->pd_dev_link after freeing the device link to prevent potential
  use-after-free issues per AI review comments..
- move fsl_edma->drvdata->setup_irq() atfer edma engine pm_runtime_resume_and_get().
- replace devm_clk_bulk_get_optional_enable() with devm_clk_get_optional()
  and clk_bulk_prepare_enable() in order to use runtime PM for power
  management later.
- replace devm_clk_get_optional_enable() with devm_clk_get_optional()
  and devm_clk_prepare_enable() in order to use runtime PM for power
  management later for patch #1 and #2.
- add new patch #5 fix use-after-free issue per AI review comments.
- modify the commit message for patch #1,#2 and #3.
- add Reviewed-by tag for patch #1,#2 and #3.
- Link to v5: https://lore.kernel.org/r/20260513-b4-b4-edma-runtime-opt-v5-0-1e595bfb8423@nxp.com

Changes in V5:
- add three new patches, two of which replace devm_clk_get_enabled() with devm_clk_get_optional_enabled(),
  and the other convert to clk bulk API.
- remove unnecessary flags FSL_EDMA_DRV_HAS_CHCLK and FSL_EDMA_DRV_HAS_DMACLK.
- remove redundant clk_disable_unprepare() due to the pm_runtime_put_sync_suspend() added.
- use devm_pm_runtime_enable() to replace pm_runtime_enable() and add return value check.
- add return value check for pm_runtime_get_sync().
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

To: Frank Li <Frank.Li@nxp.com>
To: Vinod Koul <vkoul@kernel.org>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: Frank Li <Frank.Li@kernel.org>
Cc: imx@lists.linux.dev
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Joy Zou (5):
      dmaengine: fsl-edma: use devm_clk_get_optional_enabled() for channel clock
      dmaengine: fsl-edma: use devm_clk_get_optional() for DMA engine clock
      dmaengine: fsl-edma: convert DMAMUX clock handling to bulk clock API
      dmaengine: mcf-edma: enable runtime PM for eDMA engine and channel
      dmaengine: fsl-edma: add runtime suspend/resume support

 drivers/dma/fsl-edma-common.c |  14 +-
 drivers/dma/fsl-edma-common.h |   4 +-
 drivers/dma/fsl-edma-main.c   | 340 ++++++++++++++++++++++++++++++++----------
 drivers/dma/mcf-edma-main.c   |  11 ++
 4 files changed, 278 insertions(+), 91 deletions(-)
---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20260811-b4-edma-runtime-opt-mo-0d19aeeb5dbe

Best regards,
--  
Joy Zou <joy.zou@oss.nxp.com>

