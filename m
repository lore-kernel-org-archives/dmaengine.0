Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795110126;
	b=EWzOpcCxJ0W1J1c3xkLn92cv7OJsGFEd107xIQbIgpeYnTF1EAQhYUHIKPTvHWiSp2vC
	 K5U2b8a5d8rxR0H/G+v5/eCMHkJ81TfVjE0zODpveWCoZr1ep6ldG9CM8xtLFRT9ldJEL
	 V37VcknN+onOmMjhVhlG1V3xW5dJtdo5RmPWiH89JvRbQpPXATK7hf6dFyqJe9ecPhXRd
	 BS/cB5TveCFtv7HKWc/pL79JsIYEfo0RP2EmCuYKVLwSHupyjGqCbK2whp4ImjXX5vVx4
	 HZis48vvIaieQKwVgrDe7k7lykm4maiXs2HBnW3gyMGRGfbWoe2SX8AjtgN9Rw1y8SA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110126;
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
	bh=AEt30m13Ox9m8ti/jwBGwvNu5fQB7D0OdkHhsfKiSe0=;
	b=mwnrOPsCEloJeo8WKaGTl9MTUtg8A0EXoldZObh2srGPUI/WtKEJ0W1jodx3Hya825Qv
	 5VLMvGF5K2qC8it+XDe/wq4G6gPckp8dPXPHABGuRW+xVE7AfAYvR4piLiaOyX7USatLE
	 9YDYsyBMoIZ/dcYuQuny0VSYuiPFGGK5hMMvm6Yva4MfgSs31rDU9fT7r1VH7/Lez0jd5
	 51FXTctxQ3DQb/RDcyIzMdN7r5tKHO6LR2pBPehapZgYIbFyz+ggVAV0o18dfdPbP5pSV
	 k4dKy1N4/8bxjq6ih1EjPI0uPjNHZiU9X7CV2Iea0fLmNhyphLJ3qIPVfvOPIE+jAyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dmnLCHck;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.62
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012062.outbound.protection.outlook.com [52.101.66.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DD2606A325;
	Thu, 19 Nov 2026 17:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06DD2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dmnLCHck
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGo/wR/AmeV4bGm/NmdHOKmo/na8LxdJaK4l7TfGxbusiBTWxv5D0m3kRfCofBQ6h0HV0Ej4mWfdB0Nn+vFl3g/XFUaaDDpj9eMI4DLubKNF4mo6s2o0A7OTvV3N/yElnx+M3mRYY2cS01FcFncBk4gpEfcXynMSMLGY9EjjIZeQNwzCpxLDOt/GApRHumuhGRzLeHycP/i6QzpTmiZY5IKqj9R3xbhNxcRGneWDPhPZtucBowannie9B+VaP1shudmNVDLnBdF296ajkHXHJLnRSZlugZJpeYHOHEsQ+IaAsBWInWZCCifxiqQEPfakggEytvrYCWnVLZ5tMxYb6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEt30m13Ox9m8ti/jwBGwvNu5fQB7D0OdkHhsfKiSe0=;
 b=Lf3+F4zqmb0mFJ6nX0c5U2MK9OI0zLKN7d2wzLMDVCaC8Sry3HAoUAPCLWuLvo2gVcVOm6HozKog6jz2R7tdp5BNIwd7+G9q39vr0+fgPLNJqeMO6ZtDJi5KPL4oshl1wjo2b2jvqC4IxLeGkS0KA3/MPaVYdcVZBjFUdf0zC6wSuL2BaShCTeoNOxTAmPDbXTgw4a6zhhSM5G/Dt17h0qtpVuKMRgWXeLBfaKAVoeS+DcYEfsCKmF4pQ2xOJdaIKfHO7yYqBRjqBdt6YuakZOBmCPI5nRN3ux+8H49IeBrNQUY+2bwboBYFQNw24x42pcdd6b4o2DYk78jpJGykMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEt30m13Ox9m8ti/jwBGwvNu5fQB7D0OdkHhsfKiSe0=;
 b=dmnLCHckoPtg6E6bq7ABFTycx/irTKtM9qBWbBAGwzXgT1dQOVjLRW0oQ9mRbM6dfzK0EzUbjOJGTaOlRb/3twxK0/l0PkDOyIVG1uXyQWBbK020HGVPOoHJvy9xQSdbYGgo0LUSneCyq4Of2+C0BbG+aPDlJwHz3GvctSD+PNVQN3SIQW13gQwANyQKuZ0yTb1sg51qTzvVKMQiA7jqW7BDwQXs5PUKdyN791M+I2jxkF/vNEQAlySUlxJvbZaR67VO39oOG9yKcVkxOJX5/HyYnBljF4EISDHq8ztxMNtrl+CkNlVaxL5Hr0ZlJss49sizzSVLV4/9o28jBRlkJA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB10542.eurprd04.prod.outlook.com (2603:10a6:800:265::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 17:42:02 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 17:42:01 +0000
Date: Thu, 19 Nov 2026 11:41:54 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: sashiko-reviews@lists.linux.dev, dmaengine@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] dmaengine: dw: Use devm_clk_get_optional_enabled() in
 dw_probe()
Message-ID: <av804gPG5A8_8UkG@SMW015318>
References: <8e3534b7-ae64-4c1f-819d-0ba390737b84@web.de>
 <sashiko-outbox-223487@kernel.org>
 <av8pd_aQFFSSMkDg@SMW015318>
 <216e7cd0-10b9-45a0-9eba-b53cbc6fda4f@web.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <216e7cd0-10b9-45a0-9eba-b53cbc6fda4f@web.de>
X-ClientProxiedBy: PH8P221CA0056.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::11) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB10542:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca76983-8ccf-4580-25a5-08df46646b0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|366016|376014|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261022105027099003|261021121427099003|4143699003|10067099003|56012099006|11063799006|260925021911599003|260925021311599003|18002099003|261009223027099003|260925022911599003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Hn8I8qtamtH4bnu8HA9S4DG4K+Rgx4OrMtUEmVg2VeWlcWPTA2liRTucfNvuoQ+q0kpZ8iUFk5L2PW+2SsT3fZwA55EPy//sMno3lzfNXyCNgI0OCoqksVq0DtuRDvYr150ddoSdUqEfeA/NevvN2AWK9rc4LY0fUc/VmNQKTQ2wKkwLlzYj1V3AB1RoPxj1WFppu57cRtf4ba7hkbmZiq0BrTLgeGC6LK/MpWeUI8xSHDKIRTxKWO5qntyh7HpnA5ZQFBx+wdP+DGQ0TM8kI+fnzJ/3EIAWPrab6Ok8rW8WXSth/0XdRLaQWBWuqocP6PYYFdCRuqrWMKhUw1B5DWLvpeKPk644I5ve0p7N3JK/54Q+qmIMUuKMxACbeOg/fFlGFKRrXY59OHgiAE+w4HwALGS5p2boJm0m0aWuWOkxJiziS5u5YUkGM+1kXVi9rm8GUrBHd2XfFG59CaY6ciR6AyQE/V77eEtXa7Bsos4WtkYiIwIXNc1MI9OGQeANqTI3wULUaKe7KpeGT88Hnyng+Pht7g9wpa2M53a6BKfBepKUkDuoxFCf2ZKHIivqP2wYRWImUmnOxJntGNh4XiHsIZljyV7wOhiOkTCbr+Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(366016)(376014)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261022105027099003)(261021121427099003)(4143699003)(10067099003)(56012099006)(11063799006)(260925021911599003)(260925021311599003)(18002099003)(261009223027099003)(260925022911599003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmFodThjK1FXSkRMbzdYa1pWRGhtUEVDTTd5dTBGeEJadjAveFRtWjRmajRC?=
 =?utf-8?B?U2pFUk1iZ0JLZEdJVU9PTmFML28wUlpkK1FtTnUyYi9oeDl2S1RlTjVPRDZC?=
 =?utf-8?B?UmlSWjVlZ1VmRzB4WXRDK1dodjg0V1hyKy9JTGVsOVJkSmZkc09HVHhFbzdN?=
 =?utf-8?B?d1VmdDd6Nkx3Y1cxbWlidkwvZjZzcHJ2VHBZMXFQMkRxV3FwUmsvZzVSRTNM?=
 =?utf-8?B?V01ORWRHcHR1OGhUcW5jTFI4OGpIVFdmUlR2R0pIRUNiZm9EMEdMVFNUdWhv?=
 =?utf-8?B?Z3JGdHpVYjB5YlpuTWlzOGZySmFNWHNmcmJKeTNYaWNyVlZ2aXM4alJkSFN6?=
 =?utf-8?B?S1dXUVpkNjlFQTJINTNqaE95NklPMFBDRU1nblV0R3JBbG1TQTN2UXAwOTVo?=
 =?utf-8?B?ZFMxWUozVktmTkJDaldCYU5hdXg5eThrWVozQjlpY0pwaWN3VVZPUUJnWFRa?=
 =?utf-8?B?bWpJRjZQeDNidk9FdkVzYUtpUC9aR1BmRUxuRHFpYmQxNitiM0VlUEJPZFhn?=
 =?utf-8?B?aVpwUTZidUI5MUc1Z2ZjdWZvOElyak9hYlJTR0IxTXVlSW4rQnBJN2tZbTlm?=
 =?utf-8?B?dWNjZGVIREtFTlBwejI3Zy9OQTBRcmVXTEM3emRRelZacjUwQkxEZy95NHBj?=
 =?utf-8?B?OGlBTWhxRW5LSDJza3UvSTliblNxczZDbEYyRmx6aGxvbWxnWXNCZEpoK3Iw?=
 =?utf-8?B?bFltYmxCeXBJMmhsRkF5TW5qeFU0UVlKQTRPMC9GOUVzUkRMWC9rcmlXc3Y5?=
 =?utf-8?B?VXFJc3BhOGE5ZVVvRm5vNUxpWlowZnloNStsbTIvU005TjhNdFRKaFBuWmU4?=
 =?utf-8?B?anY2MVNDeC8rU2lnc0hJTmZUakpZbnlrYk53NndYRUxoVE9NTGZ4YmIyZWJm?=
 =?utf-8?B?dEhvY0VJc3FpUzN2Mk1wOEVaVk9ud0FmUkZENG5BMGpjZkxoY0NqbjNYMHpk?=
 =?utf-8?B?NmJvVE9ub3lvblRRL1JSQmVrckU0MGVGdVVwc3l2cTJDaDhxeldwVFdkSEJU?=
 =?utf-8?B?YlRaVHJLdHdYNmV6aVBEZTRVVGVqN2t3NERORWREWERwRW9xbEorNUUwc2xr?=
 =?utf-8?B?U2tXU3lURU51TTNldzZSY09KZDlYRXBvNHNweWJRbXJreVI3VjBxZHhFQVM1?=
 =?utf-8?B?NlByNEVLZUtjZi9OTXN2VmpqVkE4RzFGM3ZjZG8yRHc3ejR1MTRDc00waWo0?=
 =?utf-8?B?ai9jY3ExMm55dTQ1aWFSb0lXa0s4d2RoTWJXOWlhcDVLWGFLemJzTndTcXUr?=
 =?utf-8?B?T3QrZDA0dkR4K0Ixbnl2QUlINjVJVkVmTlovejBrY0Zhc0d5R2t0Y0NZTDJ6?=
 =?utf-8?B?YS9FZXdTVC9rTFNycXhHR1o3ZFBLWmJraDdOZ3N1dVNXZUpOYXp5WVMvVzFl?=
 =?utf-8?B?T1RweS9sQ2M2YkFhR1FTbnhqcDdaTUtxcHVpbnVGVDFiTis0UVJVSkZkcWhz?=
 =?utf-8?B?ZExNSnBwdHA5Ukk3azF6dkNNbm1vWGpkWEQxWUx0M1BpREVMSU5zakhtN1o4?=
 =?utf-8?B?cXNvWlBDTnViM3V5THk0a2dGR0FCclBVTllieDZ1blBqTC9NL3d3M3hQN3FV?=
 =?utf-8?B?OEVKMEF2aTBXV05WczJMWTNHZ0N3TnVQaWU2THZZY2pKL2VlWVdNc3JTNmhQ?=
 =?utf-8?B?d1AyWjkvNFdSWXpibDhFVkpLTE1KbkVxeXVNcjYyWmh1emgvTjg4UzR4OHBW?=
 =?utf-8?B?czJIUzVaN2tmaVZlbnZyc2dHU2pZcFpSdzdKOGN2aDNadVJRRExTeVpHWkwy?=
 =?utf-8?B?T2doUGY0TGNPMWwyOFhUL2FVekN4Qjk4OWs4SXQyUXNVZVNSV0oxQ1JTR08x?=
 =?utf-8?B?bDFteHppcjhNVG9JM3dGV01sN1JWVjE3WGRCNDNsT09hcHIzUDlGeDc0OGJN?=
 =?utf-8?B?cjdBbTdxQS8rQmo5ZGs5eHA1SVJvM1pHVkZza05NM294a2E4ekw0b2s4a0JS?=
 =?utf-8?B?TE94Sml4czdicG9LY0xCWWpqRXZMYTdYSmprWFpBK1lMMUZzdmlRSFo1OXox?=
 =?utf-8?B?Qi9adG5PQi9IWHNSZnhSaW1lbzNjelRtSFpsZ1IxTisvNkpWVk1ieU9LQ2Fu?=
 =?utf-8?B?SUpqUjhmb2R5eUVML2VHRm5tclR0TitsNkI3MkszYUw1d2JiSGI1Y3ZjNWE0?=
 =?utf-8?B?RFo1WmRXcm5Ed2JST3FST3hrY0k3YnNNZmU0V1N0NjM3ZVZwMTF0aEZWQnBZ?=
 =?utf-8?B?UHMrWlJ0THlTU1NCNElVb2IwZUNqd3N0UU5mTTZLcEZGZGhMV0hIRnpFcmlm?=
 =?utf-8?B?YkFwWWthYlJ2dUVaSVFJSUxBTEw0YmdxRTc4cXBHVzVKOHZTeWpYcytWVUhN?=
 =?utf-8?B?RTUyRmhEM0c5TE94MFA4akZXZVFMNEsreU5obEcwOTArU1Q3U0ExK3dLdjhS?=
 =?utf-8?Q?oG8z+8/Zt9zEhPOnlsADV2Y8FCXZTpeQ6AoC4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca76983-8ccf-4580-25a5-08df46646b0a
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:42:01.7744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WVzt8MhjiodCcn+i5Mj8h5y4+GHC+5KLakw0AOJgjfg6W9YSqWWlGU2YFITuAAJUGIglrJQL/MceEyDNVezKSnGINnV/p3EPM8SkOq0i/K3CIIscSHK5lFFIsQl0+I7v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10542

On Thu, Nov 19, 2026 at 06:22:41PM +0100, Markus Elfring wrote:
> >> Thank you for your contribution! Sashiko AI review found 1 potential
> >> issue to consider:
> >> - [High] dmaengine: dw: double clk_disable_unprepare() in dw_probe() and
> >>   dw_remove()
> >> --
> >>
> >> commit ff07f5838666895fdb235cca7d9f7155e7085b00
> >> Author: Markus Elfring <elfring@users.sourceforge.net>
> >>
> >> dmaengine: dw: Use devm_clk_get_optional_enabled() in dw_probe()
> >>
> >> This commit replaces devm_clk_get_optional() and clk_prepare_enable() in
> >> dw_probe() with devm_clk_get_optional_enabled().
> >>
> >>> diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
> >>> index 7e76391475ac1..9bb3c2cd08570 100644
> >>> --- a/drivers/dma/dw/platform.c
> >>> +++ b/drivers/dma/dw/platform.c
> >>> @@ -64,12 +64,9 @@ static int dw_probe(struct platform_device *pdev)
> >>>
> >>>  	data->chip = chip;
> >>>
> >>> -	chip->clk = devm_clk_get_optional(chip->dev, "hclk");
> >>> +	chip->clk = devm_clk_get_optional_enabled(chip->dev, "hclk");
> >>>  	if (IS_ERR(chip->clk))
> >>>  		return PTR_ERR(chip->clk);
> >>> -	ret = clk_prepare_enable(chip->clk);
> >>> -	if (ret)
> >>> -		return ret;
> >>>
> >>>  	pm_runtime_enable(&pdev->dev);
> >>>
> >>
> >> [Severity: High]
> >> Does this cause a double clk_disable_unprepare() on chip->clk?
> >>
> >> devm_clk_get_optional_enabled() registers a devres cleanup that disables
> >> and unprepares chip->clk automatically, but both the err_dw_dma_probe
> >> error path in dw_probe() and dw_remove() still call
> >> clk_disable_unprepare(chip->clk) manually.  When data->probe() fails or
> >> the device is unbound, chip->clk is disabled and unprepared twice,
> >> underflowing the clock reference counts and triggering WARN() splats in
> >> the clock core.
> >
> > Please fix this problem
>
> Do you find these two function calls really not equivalent to another known function call?
> https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/clk.h#L680-L699

What's your point? Sashiko just remind you need remove
clk unprepare at error path and remove() function

Frank
>
> Regards,
> Markus
>
>
> …
> >> --
> >> Sashiko AI review · https://sashiko.dev/#/patchset/8e3534b7-ae64-4c1f-819d-0ba390737b84@web.de?part=1
>
