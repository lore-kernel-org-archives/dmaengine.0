Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792752892;
	b=dUqbcYpZmUH7c2EiD3r11+y2w6QqaobxFvfN16QZt4ZglaLttYHbkz0q8MQgao6yBlNT
	 96NNfz4MUZfb4Rm9Z7RgWxoteRk0ZXDBOq2k3ZLmqR5+Hx0oWR/df0QMsoyeX9PNoflkw
	 aVRt+hj7+NW+KwUuBpFxj5pdhZIzHP2q+4XNYoCbgpoDEQHRDYXTGSvb/tZ32wsAaLYWz
	 Bw41NXlyCcUlsC7qUEu3wYd/rliHbJSnBBQZ/2zR+7gzAhkeyJ3GJbOVEylBSDGkVauSc
	 JWNk4q3rKSHrELazNzmZKlmNeszOTVIWMv71xe8ltHAstq5mxJkNWyFhugan+DhNWYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752892;
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
	bh=rRIiG2ye47MXNB90dIhjZXHN01qhtyfWhEZ/tgKmdMQ=;
	b=vabbTyC3ipRNHUbE4mS4AlKGejOqdluAkSQXi0mCArQqalcHNlCUVy6NaIXmGcbRmKmU
	 K27mxlRWVZ+2zZ9Fwv0aRa7cvCxBMWFxNHO3jU095qf6xrkQqzu5/nLDFMta7lQx4YHI0
	 MDwh3rheyCcWHB1OB58w7LtPJE6r8PkqvJt63OOLB5nKZnL/4Hz0R1oYAsAJ53YCBumpC
	 hFOp794SjWJ27RK192sxu3R2o+WflUhrzgoNrqt1MWaqDPdEM9aTD4XtvOx0d11bJLFVp
	 brLfZWk19EgS5NrHZ0kNUzbsYy+UH/kCLd1Q8IEvXS90nSoWFyPUwmhZYp6LrdOqnkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=aV3GmPtu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.66
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013066.outbound.protection.outlook.com [52.101.72.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA897606A321;
	Fri, 23 Oct 2026 10:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA897606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=aV3GmPtu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhCXpMDyObM2ODjNfScaD1EI+vbe12dbg/6sldmEQyg4F7WWOIpnaxAf3pMBKp0DXzfJNf2itnlifqyUYxtcC1kQZiuXfIAX7wPxgNpsITfLFeJ9FIuP04n8JLxQPHbSObXE32GiUeRwkpBQx5S9vpZ5/Gyfb0OcQOSRU9B+ukUhoEi7omgr7xopEDkTeXyJbIDwCe9jSR0B25Fq3UW1pV2P53ZHU637zd1wkjMVwKe3vwDsxTZGVXKbntEra94mPdt4ko49R7481IJVD86mz54RFq5wfsVOr3DN54C04lEUmaAGtUg8zRVxEkKSjR3yg9xI+mmXSsthyO26DzTFmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRIiG2ye47MXNB90dIhjZXHN01qhtyfWhEZ/tgKmdMQ=;
 b=CddWN6eZlI6cuSjZ1C+pyyo1Lo554GwHLqsz9Vx/sVgHdlCqh0HCozcr0J+4bqvGTCJEvFlpEEGbe9pyLA8YIIiwlHavAR+12jj+waQjnCWCwshMGjCTMwufzOhp3qfsth1ByKoV7hKHOiHvOfk7k0q4znEPpVYNOmOL08T7wtt6S8Xad/1/52SV/p7IgniNBXkboYBOhDGooJTBGjSgCFXtQcL4miZsbv+jfYN0MqcM3FVZpM5CyKuXukLiELucOHYM1rBIhFHwouP3ajJSD4ahicfrDZZ9+KYFEljZSeBcFjGYpr4qRySHOcXDPQxM9wC3s+zHkQmtFhIrI3lL7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRIiG2ye47MXNB90dIhjZXHN01qhtyfWhEZ/tgKmdMQ=;
 b=aV3GmPtuQOfiXb861n/3iKHbv4Zc7lJaHD2K7CzfwUHNisK7NMddLLnYSIHRPyyT5Mpwf+d/YiHDLi1lzdNbC25DBxOiutetRuqrYGaQlpE5VuCSEpb1I6jeBLhEmxH+GlsDpzsBIusfDool6+sdUyB2oeLVsIUMFB2Cpjl0S437h11FNqJBnM38WQ+y+Ha7pdaJlasPBsnKtZq9fvGjd/fEA2jbigEt2Jx6oOInWm5Wmx7VpUMzr1S5GbUwmWL8Cv+p8t3wLUSacDZfq5du4HcMjtGBaZToc6bVe8nTgq/KdjG3VCXlry3entz5bt6znXumoEB7RBOqnpLEiwpCqA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by GV4PR04MB955734.eurprd04.prod.outlook.com (2603:10a6:150:402::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 10:54:48 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 10:54:48 +0000
From: joy.zou@oss.nxp.com
Date: Fri, 23 Oct 2026 18:59:08 +0800
Subject: [PATCH v7 1/4] dmaengine: fsl-edma: use
 devm_clk_get_optional_enabled() for channel clock
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-b4-edma-runtime-opt-mo-v7-1-418e53c5f9b7@oss.nxp.com>
References: <20261023-b4-edma-runtime-opt-mo-v7-0-418e53c5f9b7@oss.nxp.com>
In-Reply-To: <20261023-b4-edma-runtime-opt-mo-v7-0-418e53c5f9b7@oss.nxp.com>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: Joy Zou <joy.zou@oss.nxp.com>, Frank Li <Frank.Li@kernel.org>, 
 imx@lists.linux.dev, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:194::14) To VI1PR04MB5807.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: fbc1ba90-e1ea-44a6-430d-08df30f40e61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|366016|1800799024|261021121427099003|18002099003|10067099003|22082099003|261021123027099003|11063799006|261009223027099003|261022105027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	EGjPYaBS7GSZiY8o0SrEeBTVfnvZLrFIxOc3MsmemrLN4DXOCQPMRlzYccug0AySKuWyFw5DF+ld2RubWOFz0+LnH2yPgIY/d9G8AOsN4kT2c7Hw+WJITvKVRR1FRP9lKrsVCiYlLS5w9NBwCoVau6HskUQguCr11Ztqo5ZnghdtBCG87hRpcvZ6TBCZD7JZOAwXGvvEU/4g597bocJHUYeqUWfFq20KPNuUlx2YWEscAvn+vQYXL5dTReBTmOw7g4E44zeHHpaV2HGnskvoYyn2xWeo38u5koNKK8FxMnqv6LwFsdlYxSiZWDaROUSHQYbTro33vre6ZaB857ANrWeftDN8To2orVESuWLM0VRShIKv3MLEwMi2RsSWl0TKhy9prrqoPZ9O0I+IHemCk0aJaFw8JRDyADYKqJRdueVZdRyVA0gF1Sa1eWItK+yFYUfzDybNeAIWBPs6enQK/vbYgaBSqck0scew4RNbgGoHCGIRJw+LZxnzdqSFyAmTI5fCIiK7k/8HFYfiVsK6PC2GWg7pF5sG9y74s6PQE6pYCYqTdfzyr/ZMT+agQviv3fhx0c5l4dvDhuSRNIvQDBlt33+K5Fx4L9ZRUABc1Bex2J+yf+5XaV2eaZ89xHbT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(366016)(1800799024)(261021121427099003)(18002099003)(10067099003)(22082099003)(261021123027099003)(11063799006)(261009223027099003)(261022105027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTlHMkx3c1hxNXdDZWNiZWlNZksvdWg2S29LcWF6T3ZQYkZ0RUpsd21uUFpQ?=
 =?utf-8?B?enYxeEZ3T1NwNGdhWUYrZE9rYVlxWUFXd1JwTWsyZHlwRHc5d2M1Qjc5bVRF?=
 =?utf-8?B?dG44T1k5Nnc3NTh6Qjl1R1RZYWJTOWZXREp5a1BLNVhBaGV6dy9zRnZDQjVt?=
 =?utf-8?B?aXpxNno4OEtZYVZRekEzWm9CbUhneHlycFU5Q21NZEVTZDJIR01SU1k2blhI?=
 =?utf-8?B?eTRUZlpqUFBCSHVSRWZWLzdvSTZRdnhDRmpRbFp2YWZFcW9qSHVTYjBZcmdH?=
 =?utf-8?B?MU5hR3F6cGxvOTVBOVlsQjBIZ1l3aWhnSFA2WFNxMlkxZW1vS05iUjRoaGJU?=
 =?utf-8?B?eGtPc3l3RUtqS0twRUtDN2VoUFEyTFcrbjlTRUJ0a3h2WGI2bHVUNlFEc09F?=
 =?utf-8?B?YklQRWpoR3Y0dVQvNUVKWG5ZYnpiakRyY0FMSDVMalVJbzcvbGUwWS80dzFG?=
 =?utf-8?B?RjdkOEkreGFVZWE1MmlZVkgyazlkV1p3RGdJdUtyS0VQNG9UdUo3Y1A1dmtJ?=
 =?utf-8?B?M1BQS3Fla3JLdVpvWUhyV2VSMWtheUw3YmdlV0liQzN1S25GS0pDcW9jY2o1?=
 =?utf-8?B?V1RnVlNrOTRjM1VzVWVWbDRwR0daNDRvM3pmUE9ENGtkdFJ6YVBVSDdUQTBY?=
 =?utf-8?B?WG95eW1ISlRGTytjemNiS0xwUHNTUDdJNXVWdWhIc2M1M283SzB5d2ttUVRw?=
 =?utf-8?B?aHN5UTdPVk1lRjlxV0FLL3ZoVURIRDE5YmxkZlJKZTlraXQ3UnpNZ1BaWFNI?=
 =?utf-8?B?YlR4NWtkTW5YR0FSN0pKK2RkWmhTcnRzdGJkTitCMXYvTGQ3ZCt0ZWpBdnVP?=
 =?utf-8?B?dmt6TTBiNTlDREpDQUFGVGZJUWE3Q3BtL28zbFlxOTdFNGk1ZVRBZVdpTFU5?=
 =?utf-8?B?ZU5DLzZ0QlV4ZWNhMExsZ01KRlowOHdTWEdlT21aYmdBOC9RakFGYjNhcStJ?=
 =?utf-8?B?c2E1QTEraUFvdjJvYnA2N3JURGRXcmkzMUNVdzFtbnZKZjM4YlQveXNlSVdj?=
 =?utf-8?B?WWFJaTQzK1dzUXpQcGd6Vmg3TitaU1pheDFOSlR3NThYMUF2WGRrb0dKL1dt?=
 =?utf-8?B?K1VZbjVhV201TzNVOFJQRXlDN0tvZGpjaFBBNlcvOTBWY1RvYWJsdko0VzZG?=
 =?utf-8?B?MWlKZzd6ZmNYSmpyUDFDV2FTd0JiekF0Ty9adlJqZFFubWd5Q29PY3JkMzc0?=
 =?utf-8?B?ZFBSZXM0ekpBblZENnNiNXdlejd2UldJLzgrVjVKZEpFRlVxcDBueGU5clB6?=
 =?utf-8?B?MFN0eHV0dk83VDluR0hnbWpwMk5kUFlMTDRaMHkwVnl0bU9XWlRtaU9FNFE1?=
 =?utf-8?B?QXExcUFEOWkrVHUzellrR24xRUJBWDFZOGRRYjQyWGZXSGl4ZnE2RHIvSTJV?=
 =?utf-8?B?R0JYM0gvenF1SDBCU1M4ZHJJTjJsQ1gxRjFleWZrb3NnY0F6aDJTU0lRM1lI?=
 =?utf-8?B?MTFtWHFzVTl5UHRFcjdzYVptdmlSSXFpKzJGZ0d3bDVMd3Fqd0dCWldyYkNK?=
 =?utf-8?B?L2JBU3ZPckZlWUxWUzUyTzRrZ0RWTFlaWVZKL0tTQ1hkZStUWGV3b09kQXNU?=
 =?utf-8?B?NGd1Yms5Q3JVQVhRUWUzc0szMkFWK3FocFRjZkFHSUVqUEVEVlhzT3JsZFly?=
 =?utf-8?B?M1ZsOWRqdEEzenJTdHcrZ1hXTzM3azNkSDdSdjl6cmN5aE00WFoxbGd2akt5?=
 =?utf-8?B?MWVXWWVTK2I0czcvTFlmUnRoVjVPdmwxTEs1L01Zd0RHdlNUUmNLd1RLUlEv?=
 =?utf-8?B?UGpUOWdkekJwanZ1bDVTakVKc2Vic24rQUREVUdrN3hpQ25JajduQzRWMkZW?=
 =?utf-8?B?L3dwVWY5RE9CbHpncXhXVjU3Q2diUjVOWjg0MXJXTklJMmthZnRpdDRUMXQw?=
 =?utf-8?B?RU92Rm5RQ0J3ZGxQQUZ2Y3lGQklwOXowWW9vL0tnbHRDeHdGK0ZRZUl3dFhF?=
 =?utf-8?B?U1JmbnlMak4rR2FlamUzSjd4bStZOXBYMkRKZG9ZZnVVUzhJOVZ5WDN0Z3ZS?=
 =?utf-8?B?SnhBam9PK2dMT0tKcWhEWi9oSlpqaFhxeUlQejU1RU1aV25iTkJkR2pmL1g4?=
 =?utf-8?B?U2NWU3BjdGQ4WVhId0NWQmpkOGNMaktnejVSQjBIZSszQTNHSzFtaTJWb1cx?=
 =?utf-8?B?M3M2RXB6aWg3UEFOcVgvQjRNbkZCVWl6ZVFWZ2U5VTczanVoTWlKc0drbnZD?=
 =?utf-8?B?ZmVueXJkdE5ScjRobVFFbE9sYXdIb2hVaWcrRjV1WkkyNjJPaDA3TVp5QVly?=
 =?utf-8?B?NURuWGw5VVZIb3dDVFByMFN6L0NoZ1lvUzZ6ZUM5R0hFTFU0b3BSbGNYR2hz?=
 =?utf-8?B?NW5CMk83aDFRZkZJd3cwbmFvcTdRbnpZQ3RJUW1seCtnSUIwMEh6SU5lWE9M?=
 =?utf-8?Q?4VpoI/fupBNN31D9ykISI0Lr23RHc8Yicfdd1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc1ba90-e1ea-44a6-430d-08df30f40e61
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 10:54:48.2689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6rcIUQGXpURqTCrwzCWhnuxLFvPugIu2XPQwjMoZLpX0n4lORxsKi/oRYq+HgDIiUeXU3SCUT4KIm14k6/zA8PjbileR05uF+jccw9XGH5WO1zPmuNOAZ3JUqNs5HJWj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB955734

From: Joy Zou <joy.zou@nxp.com>

The channel clock is optional and not present on all platforms.
Replace devm_clk_get_enabled() with devm_clk_get_optional_enabled(),
and remove FSL_EDMA_DRV_HAS_CHCLK flag to simplify clock handling.

Prepare to add channel runtime pm support.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
Changes for v7:
- Replace devm_clk_get_optional() with devm_clk_get_optional_enable().

Changes for v6:
- Replace devm_clk_get_optional_enable() with devm_clk_get_optional()
   and devm_clk_prepare_enable() in order to use runtime PM for power
   management later.
- Modify the commit message.
- Add Reviewed-by tag.
- Link to v5: https://lore.kernel.org/imx/20260513-b4-b4-edma-runtime-opt-v5-0-1e595bfb8423@nxp.com/
---
 drivers/dma/fsl-edma-common.c |  4 +---
 drivers/dma/fsl-edma-common.h |  1 -
 drivers/dma/fsl-edma-main.c   | 19 ++++++-------------
 3 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index 513b0f4e5be2..4f7a942673eb 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -1087,9 +1087,7 @@ int fsl_edma_alloc_chan_resources(struct dma_chan *chan)
 	struct fsl_edma_chan *fsl_chan = to_fsl_edma_chan(chan);
 	int ret = 0;
 
-	if (fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_HAS_CHCLK)
-		clk_prepare_enable(fsl_chan->clk);
-
+	clk_prepare_enable(fsl_chan->clk);
 	fsl_chan->tcd_pool = dma_pool_create("tcd_pool", chan->device->dev,
 				fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_TCD64 ?
 				sizeof(struct fsl_edma_hw_tcd64) : sizeof(struct fsl_edma_hw_tcd),
diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
index cbb077e98f55..4332b2b2e1df 100644
--- a/drivers/dma/fsl-edma-common.h
+++ b/drivers/dma/fsl-edma-common.h
@@ -213,7 +213,6 @@ struct fsl_edma_desc {
 #define FSL_EDMA_DRV_WRAP_IO		BIT(3)
 #define FSL_EDMA_DRV_EDMA64		BIT(4)
 #define FSL_EDMA_DRV_HAS_PD		BIT(5)
-#define FSL_EDMA_DRV_HAS_CHCLK		BIT(6)
 #define FSL_EDMA_DRV_HAS_CHMUX		BIT(7)
 #define FSL_EDMA_DRV_MEM_REMOTE		BIT(8)
 /* control and status register is in tcd address space, edma3 reg layout */
diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index 630285c85482..a85bebc25217 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -572,8 +572,7 @@ static struct fsl_edma_drvdata imx8qm_data = {
 };
 
 static struct fsl_edma_drvdata imx8ulp_data = {
-	.flags = FSL_EDMA_DRV_HAS_CHMUX | FSL_EDMA_DRV_HAS_CHCLK | FSL_EDMA_DRV_HAS_DMACLK |
-		 FSL_EDMA_DRV_EDMA3,
+	.flags = FSL_EDMA_DRV_HAS_CHMUX | FSL_EDMA_DRV_HAS_DMACLK | FSL_EDMA_DRV_EDMA3,
 	.chreg_space_sz = 0x10000,
 	.chreg_off = 0x10000,
 	.mux_off = 0x10000 + offsetof(struct fsl_edma3_ch_reg, ch_mux),
@@ -813,22 +812,16 @@ static int fsl_edma_probe(struct platform_device *pdev)
 		fsl_chan->tcd = fsl_edma->membase
 				+ i * drvdata->chreg_space_sz + drvdata->chreg_off + len;
 		fsl_chan->mux_addr = fsl_edma->membase + drvdata->mux_off + i * drvdata->mux_skip;
-
-		if (drvdata->flags & FSL_EDMA_DRV_HAS_CHCLK) {
-			snprintf(clk_name, sizeof(clk_name), "ch%02d", i);
-			fsl_chan->clk = devm_clk_get_enabled(&pdev->dev,
-							     (const char *)clk_name);
-
-			if (IS_ERR(fsl_chan->clk))
-				return PTR_ERR(fsl_chan->clk);
-		}
+		snprintf(clk_name, sizeof(clk_name), "ch%02d", i);
+		fsl_chan->clk = devm_clk_get_optional_enabled(&pdev->dev, (const char *)clk_name);
+		if (IS_ERR(fsl_chan->clk))
+			return PTR_ERR(fsl_chan->clk);
 		fsl_chan->pdev = pdev;
 		vchan_init(&fsl_chan->vchan, &fsl_edma->dma_dev);
 
 		edma_write_tcdreg(fsl_chan, cpu_to_le32(0), csr);
 		fsl_edma_chan_mux(fsl_chan, 0, false);
-		if (fsl_chan->edma->drvdata->flags & FSL_EDMA_DRV_HAS_CHCLK)
-			clk_disable_unprepare(fsl_chan->clk);
+		clk_disable_unprepare(fsl_chan->clk);
 	}
 
 	ret = fsl_edma->drvdata->setup_irq(pdev, fsl_edma);

-- 
2.34.1

