Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795604106;
	b=BMbPYgNbPg3IoUcfglRLGwK8mLvpyt3AT9pMi2Xw75V60LefnxY+WF10RzPMNg9iIyAF
	 vb9V1sgouoS0cdOVE/6hlNlB6YC29+HnI6JJKDRtna4o7Eu5nliJUzJxsY9fSw4MtgoXr
	 kUsiQZfFdvJcysyLuFC8/iQ0vrU3G1FLBfjFxzu6hjLSRBQWVt8FHfj0z2AwKyhJIsNOc
	 Khw4QJLiTevzFqWKVnFAZMV/mXfzN6d4cXBmJbKilT1OF31gACm2LtucWJpzxt0B7DuLt
	 sToh2zY2mk74HGEE2pkhq5YWKLoo/RZTWQwU25uf8JqMT4u/skfE0s6PeBCm7ZbYU7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604106;
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
	bh=URWUYJFbeYwN+9vFyMwHZGpNiywMG9St1ImMQzO+S6E=;
	b=IRhRBTajCxp0xNT3xPh1Hiiisn6hVk1hSY6KlWkd3cGv6v9YcPqBw4cnGMgMSnA9iBHO
	 AXED+jE0bLepdcITWokMwZyzA1ugVMM4Zaxs4picKjcj4CECR0Ab/elNrhe9030XdRMq2
	 vJKbxNC9h5ufOhqfCkhOyTLn2f7T8/Z2mfREdBVrloQewIzRXyKZMQCNFTSIfFjbb4cMo
	 9J21TSmfe4CBtPEsqtp740d0K/S2ezdFMWCh687dQer8wY7RdNGSDmKs6iCwEdvdD/YTn
	 j+KP/I8LQbAtQJmrO5c/HGjEhnBMmZLLZ5Qht+kURf+Q3bB0+bZYVa2aoIy4wTYGemQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xRz48Fx9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.61
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011061.outbound.protection.outlook.com [40.107.130.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAD7606A327;
	Wed, 25 Nov 2026 10:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEAD7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xRz48Fx9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLf3do4TRKK4Z4eOkRPWx/ycJ0r3+XURxZYooUT/QQxO+7QFgyigLF8hN/PwMC5PysND593tw/ASfz9UzBjr+FH91vH8qQPhj4bOSUOs8/g1w1j41991REVeBOieOxRaHqew4SZRhXOi6iNt77RsOflgMXWHtuyNbEhSzWlt4dtYYFxWIdCW6/ljx/K06zLRW9GIFZ5j+GTMJbep2PaRg6RxZPvoKvoy9seW4r10KqaoV12NelfRxdjmmOFJdd6NNmLEWaPrZXTUf8U99fJXXY1vSkxp1iEYEFJGCxKnqmlf1GJwqMRKnPMK/tOKrJucZmbyHofZp6xN094T6o97Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URWUYJFbeYwN+9vFyMwHZGpNiywMG9St1ImMQzO+S6E=;
 b=k7aZEFVA1d8dFSHmOos8+7drGn3yrquZkyZVIpohZzp5oRo4VWm7I1mgSOMo8SNb5yscgV5+BcmxBDW22f8CFhs7CFUJgNKUA2AcWkOYvba0vRibdM30trDkYPTR9XPspQwtxO6W6CiQV/8jrHlwQR3BPCKY2SWMq+KqemHVJDm25ZbYHQVICgI+qxNBYUtUm4VamEpo7hduxhnv9RNLM64y4rZsksFSezWA9vmZrQ6j3IvLCddEPy/WHCweXZjTIUu25XzA1IOg5U8hWyNSXMum8YskaLQvAYrEPRRNYTZhl5+9hkZSVKs6dlq6uaFQ8vJGv1ledOwA78H5IcSKJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URWUYJFbeYwN+9vFyMwHZGpNiywMG9St1ImMQzO+S6E=;
 b=xRz48Fx9HYrXlmP4jWw5uYod6XAXw3lRhmEJaod8mYTHN0wJWgLPklR2Zz/gcRJFAvZJCBJprxRbFA2e7HIZpjdYlEdDDZ2z2sH0HH9JrBYulnSdDFq8QoOYVjGU6CjbkWtC63608Jr/wDmUH5ofkP6vnuDArk2mMfets15tKda+IXO44AEXYpBq9kYzbsRxl4D5O/zVCQ50ZTmZupYbgvGPSnQtuH+73ua43tEDVvv3BCeEigUnmxvqGkZZ+Ai8XVE0WZOtMkiGyteUbFNoiI5So3FMXeVKaw5mBxuIe5097hS7tcvdYtDCGD6lGq1fNYo34sTarvqQ8cjxZM2IsQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by BR2PR04MB007356.eurprd04.prod.outlook.com (2603:10a6:2c8:6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 10:55:03 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%7]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 10:55:03 +0000
From: Joy Zou <joy.zou@oss.nxp.com>
Date: Wed, 25 Nov 2026 18:58:58 +0800
Subject: [PATCH v8 4/5] dmaengine: mcf-edma: enable runtime PM for eDMA
 engine and channel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-b4-edma-runtime-opt-mo-v8-4-81345a3bfb52@oss.nxp.com>
References: <20261125-b4-edma-runtime-opt-mo-v8-0-81345a3bfb52@oss.nxp.com>
In-Reply-To: <20261125-b4-edma-runtime-opt-mo-v8-0-81345a3bfb52@oss.nxp.com>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: Joy Zou <joy.zou@oss.nxp.com>, Frank Li <Frank.Li@kernel.org>, 
 imx@lists.linux.dev, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:194::21) To VI1PR04MB5807.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: fd3cdb12-165d-4077-7460-08df4ae28ea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|19092799006|366016|18002099003|22082099003|56012099006|11063799006|261009223027099003|261028144727099003|261021121427099003|261102123227099003|10067099003|261026140227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	zRtDPx5VgihPjmlBx5q1KXTis5RtLW9nsIL5stwhwSL4daag2rgEwhgDnieUHmOgav0MWBN3HY9rI2HV4B9U2ELCFwScU2cyWjh/TiU95Av8jJc+R6DPjHHw81DHPyIk2ZqzmzUg8bExIsDSM0DxgMNiOET+dzkYLzqiCQD9XdO37y6YIN24LK0Q4596SdQ5wx+YyYck/l6mMusXIQAzoDmNbVU8Nre7+zLktDwCLdwOWwVz9UfYBUXepBukBawq9sYOkO06U/v9tkSTNNmzHN6VwsAVP5w60BulDjMJgy6nzSWEqntaQd4PCkT9L5D/BAD6By/KEK4cKfvy4JAZEVvNz5qS1pVGJ6ggKuqnO08qNicMIPGlBmMptxbg+ZAACdPcd8WDVNIS593IOH1/dbhmNVGf+H2+9ZFrLRNnpWbgqMPoRWYV1hCHlOJ80rEMmj3EqE9K9ggU2S7PFubqghq3KaseVHelY+qhC183Eb3MWFzJaHs/6HCZmbWPbJb+PS0KKtVlmFLyikzlp9W6Wk1KYlxcLioy3we+qXWUoCiG3FYemZJ3OlM4YhyauaYErWCmQj/B1gg+OXcG5FOITX/Mzt/0ZIvDIhPa/qIKo6IUBbvKbKo+2M57QhlQ2HS0kO+yDi7LywZ2yaLh/VNjviAFfVZFby0mLvD0cBlfkU4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(19092799006)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(261009223027099003)(261028144727099003)(261021121427099003)(261102123227099003)(10067099003)(261026140227099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGg0emd6YnhMVVZWOWhHczNrTTZRcUp4OG5SWGs1Uk8raWlSM2txbDZWWHdF?=
 =?utf-8?B?TnNia2djUGRWbzBDelIyOVZ0TkIzL24wVEtOM3FxcjkyMmYxMVRJREEzbWNt?=
 =?utf-8?B?RnpuUHFHK3BaMzVTZnc5eEVRVVI5bHRKbm1YVW5iejlMdklZQUJBM3hKNGJa?=
 =?utf-8?B?RXVHUEo4OVFINTZ3VkxBeXkzVmhZYUJlNUFGcnVWTjBmeFMxZnFvUWpuZWh2?=
 =?utf-8?B?eGswQzFYZXlGaVJTUlF4TGs5WWMwTVVZU0FPUXlYOWZKVTRxc3pWMnRZK2la?=
 =?utf-8?B?ZjJXdVBqTDhhblJQMnlIcjl5N2YxS1Njbk5MbDNOV0tQWGljaGVDV0t1dU4x?=
 =?utf-8?B?OTZpUlZxNHRucXVkVm9yV01OVTZIWGVxVUZ2OUFVNnNBU0hDbGtKM1h0R2E3?=
 =?utf-8?B?QnFyc0tGbUgrV2lLUmtEUGZGdGFWbEpqMm9jREE5ZGVrYmgzMkVFWFFhMzgz?=
 =?utf-8?B?YjdTVHdZT2lNOElyMEdYNXR2YmN1YnVLR2Y3YmtKbkd4YTAzQ045SGJiNFR3?=
 =?utf-8?B?K0wrbW92akpjM0lBR0xZWGwrdlA1QThMY2pWWm5neWhxcGpqSkl3SmxvQ0NX?=
 =?utf-8?B?MWpPbCtSbzdVeDQ0eWpyQTEwTEhmWkJUblo4eG4vVGJuNEp2MWhnZyszU0M5?=
 =?utf-8?B?Z0JQVGFRb25zbDM0dWVwc25rYUR0b21qWjBzQS9pS0YvY3IxZ3V1WU5WUEw5?=
 =?utf-8?B?eHVXVEQyamt3NUIrbW9kT09LM3F3Q1VrUXQ2QWxzNmRRVDJVN1daWWFPY3JS?=
 =?utf-8?B?MlV6VlFVRGUzZk1xdDUxb2FmeDVoVzI1RHRsdGZnUmpjandGZVpyYm13bDcr?=
 =?utf-8?B?RFJJN1BNNHVxOWN6b1ZQcVNjKyt1MWlNaGFHREtxdWFTR2xDQmJiOGNhNmtY?=
 =?utf-8?B?ZXcxWXBNOUxkcThUODEyVjYzRjVIblVWaExROEltcFhnSWpLc0RHcDl4MytJ?=
 =?utf-8?B?NGliNVZBOE1pRUROR3p1cjZUcDk0ZUxvd2dnVDNReFBObFBnb05oVDJCUXpZ?=
 =?utf-8?B?cjN2cUdnZDZCSzFxYk9aQnZ0Q1ZtOWREWVd2ZXc3UlhyaXl0SVhpT3ZkZkRW?=
 =?utf-8?B?VzZkbDMxOHVIUWQweWRZYlc2eFYxTlQ3YWdwNEFWbWl2dk9jK2JpSHRZa3Aw?=
 =?utf-8?B?cFhIZEFZZFJaSzVCZ1ZBaXV4U1YzcGNKVWVvbEdaZ2IwSi9GeGYvU3dRRDRH?=
 =?utf-8?B?RW94ZWlrUmRtY0JBcTIxeDhLSFJSUU5kTG1vVys0a044MWoxSERWRHdGazkv?=
 =?utf-8?B?NktKUk1HY1pmcFUxNEdBNElKR2ZHaW1LWjNuS0VrVDgySXZ3cGtjQVUxb3Vw?=
 =?utf-8?B?V0VDQnN6ejVZNDdlWFhYQmJsWlQ2MkdWNCtFN3RWOXA4b3lDY0pvWjBQUEM2?=
 =?utf-8?B?TXdKZSs2eUZXUGswazZGLzlLVlRYY3FMNHBadVdFMDVZUnR2aG9BTm1IK1Ay?=
 =?utf-8?B?cjAva1EzN3VabWliN243RnJBMUFnaGNodlQ4elh1UXRoRFpJTktnc2VVclpq?=
 =?utf-8?B?aytQWVZxR2YwS3RpMTVFN3NEalRUaklNUWZRVXdPWG5yWWJ1M3FRaFlaVUh0?=
 =?utf-8?B?eWVhUHVkM1lRSlpobVByR3N0cWUweUdSdW1rVFJ6Y1ZrWnhLemhEcHZ1R0N4?=
 =?utf-8?B?emp2SmhPb2hNVjk3bVhuWDNJV2J0OHUxaUN0cnFmSGEwUlBUUWxTcnY3MDRw?=
 =?utf-8?B?QlpobUtUekVDdkM3T1F1TW50QzYyTHpjOEtUWlJnVnZnVmlyYlU4QldmcFRJ?=
 =?utf-8?B?cXhXSExGaWFSZ05jS01HL2VxTGc4RDdNU1RDS2o2SzZlVHpqMG0xYXNQTFhS?=
 =?utf-8?B?THR0cmk5Q0dzaXBLSmxQVTdHUXpQTjJBY1VQYktIQUZOSytvMmtwREZ0STBt?=
 =?utf-8?B?NURxN0M3T0RpcFVaMTdMY09zMk90M2xkeFhhczIxdXUzSHloWEdmS0ZpdnN3?=
 =?utf-8?B?bmpIZXgzWUJHRlNybUpWcFYwMlZQQkhsRlZsaXJDbjVRRlJLT3FhRHlpZ1RB?=
 =?utf-8?B?M25oa25LVjJmeTVRMjlLSklKVmtoUldmUkpZY1hYZ0F6aEVOZU1BdDFvQmZD?=
 =?utf-8?B?aEVVaUdzRTZsWXE0S2lhWmJZd3FGOWt1aVlpTFpNY0hzMllpcklKV1Exa2Zw?=
 =?utf-8?B?bzkvaTVxSlJ1OFI3NkVEYWZWTjJscG9sTm9RMUx4VnUzMU9kc3F0cFNLcSt6?=
 =?utf-8?B?bWVjR3psbUMwU3VROXdrQ0NpMkJ1MGtWOS8yVWtuUzBGaE4vc05ROW1pdUpJ?=
 =?utf-8?B?QmhFWDZuVzdXcjM2bGZ5QVRNbjNseWJqL0tmQlJDbVZHSDRCd004TE50Y2RO?=
 =?utf-8?B?RytnQ0MzK3lYai9meFR4QTFIWUt5SXJwaFBBWVVmY29nVWp5UWEzVFNwZTUr?=
 =?utf-8?Q?aQlsjvTivw2KtvOAK61SB0XutVmZOTwgwa91M?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3cdb12-165d-4077-7460-08df4ae28ea0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 10:55:02.9253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmuljdy0WfIBc7UM6+/zZvDCxI6PNU8S64gIfEtHP83FHibRrFw5DpXTdL4pT1DcDQ29r5uy8dVY849sLjCG2a9Kfr5kQjdRR/9YgAw0+NfmLsg2GOeTfQZuLANTtYAg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR04MB007356

The common fsl_edma_alloc_chan_resources() implementation
supports runtime PM and relies on it when allocating channel
resources.

Enable runtime PM for the eDMA engine and its channel devices
to ensure that runtime PM operations work correctly when
CONFIG_PM is enabled.

This patch has only been build-tested.

Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
---
Changes in v8:
- Add a new patch to prevent fsl_edma_alloc_chan_resources()
  from failing when CONFIG_PM is enabled.
---
 drivers/dma/mcf-edma-main.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/dma/mcf-edma-main.c b/drivers/dma/mcf-edma-main.c
index 9e1c6400c77b..b1b94639d4cc 100644
--- a/drivers/dma/mcf-edma-main.c
+++ b/drivers/dma/mcf-edma-main.c
@@ -8,6 +8,7 @@
 #include <linux/dmaengine.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/dma-mcf-edma.h>
+#include <linux/pm_runtime.h>
 
 #include "fsl-edma-common.h"
 
@@ -192,7 +193,9 @@ static int mcf_edma_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&mcf_edma->dma_dev.channels);
 	for (i = 0; i < mcf_edma->n_chans; i++) {
 		struct fsl_edma_chan *mcf_chan = &mcf_edma->chans[i];
+		struct device *chan_dev;
 
+		chan_dev = &mcf_chan->vchan.chan.dev->device;
 		mcf_chan->edma = mcf_edma;
 		mcf_chan->srcid = i;
 		mcf_chan->dma_dir = DMA_NONE;
@@ -201,6 +204,10 @@ static int mcf_edma_probe(struct platform_device *pdev)
 		mcf_chan->tcd = mcf_edma->membase + EDMA_TCD
 				+ i * sizeof(struct fsl_edma_hw_tcd);
 		edma_write_tcdreg(mcf_chan, cpu_to_le32(0), csr);
+		ret = devm_pm_runtime_enable(chan_dev);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Can't enable eDMA channel PM runtime!\n");
 	}
 
 	iowrite32(~0, regs->inth);
@@ -240,6 +247,10 @@ static int mcf_edma_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mcf_edma);
 
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Can't enable eDMA engine PM runtime!\n");
+
 	ret = dma_async_device_register(&mcf_edma->dma_dev);
 	if (ret) {
 		dev_err(&pdev->dev,

-- 
2.34.1

