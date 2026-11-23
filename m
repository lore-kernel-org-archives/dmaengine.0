Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795397287;
	b=Lru13WCkNRGPN+GwZnKcfbFpUhzYmcP5OlARsSfeR6jxlqwrybDspcoDLjqsivC6sv0r
	 doGRhULINjLY9TJj/mgqj8d/waFZelS4fN97+xJSmrSkhzq/JWTlI0cs/BTo9qw+mkMoS
	 qW2ho1LtOJ75TwJCLM+9+Z4gplUpIvAKyTkjJOFd+M9z3zC1pa43SQdS5F9wHDBDA+75D
	 dAEBUalvBh2wTP4e68AYP2bRYoLVukfzyvE5iZLXIlnGswTiuuThSfkOuUOAVt5GGXgaS
	 VO5NphcsU02VnIUf6LOglf/aEN56T+t+cmE+t5wL5/hunDSfDc5H5OJUBTnGsEMG3YA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397287;
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
	bh=9IhLr1hXEvbJe+Xv7uk56CHmRZUq7/a3htAJDzaYa60=;
	b=kPF/HPiopfc9KaAIMhOFeFdZmkcpiztGzewRH/av8KRhyD7n2PSBjtsRXERchPpwJcpU
	 jwea6J3eW1pOtsbTbTV8yhimiiqkmrv+t4VOG9eemUe5EFB3Xae0FdAvkhjxsyV67d8lK
	 TC9jO5ERVwNkMEPjHd0qBB9ueKmX9yz8NBXT+1YHvR6wzGFHVVcH4lKbqt5V6I36JU1dh
	 4rHdsjFuDCe/TRO0ss73o1jdes5eE/K+8zS0o1hfxdp4ray7FjtXDZeiqNReCr9Ld3wfG
	 028jCDYaEgkAIJ8CdS+5w9CbJFamlcrly15+tBQQcnED+0HHM+q2AR0rMYV5x4x2C9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Bb8Gw0S3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.19
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011019.outbound.protection.outlook.com [52.101.65.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E95606A31D
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 01:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E95606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Bb8Gw0S3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPr+adPFmWzmhK7lyC6ulJ6Q5Ji+RLbJa1Ld2efEJwtcx9nxh8kylUytdQ+89teFDaV4Syfo+RZhI6wPzz6OCScjZKqBNG4K2sx3nmAp+lHyiWFwuMgIxD62lbpEVMg2PnGQ3gbZEm+t5aIPWHT3Ns6KLFIG5gbux0w1TL0mZKsZ/HWL4/OgFH3MrinH7rWdEwR8K0QIn2zGQO0vK5L4t942nFaZWJACNeHRZWzgz4zJgGUL1oQSUPQPTbBjjEmlaGZo/B+CGNwhkF8RmT1EDJeFU5pAXcA/rd6UyMeCTX2ZAawhBh/Rd6GAfYvF+c+ApEIXnbvPAME05b3umbqx1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9IhLr1hXEvbJe+Xv7uk56CHmRZUq7/a3htAJDzaYa60=;
 b=Ebp0OYo7DqejuSZrpvLSdjDGvJY+9OSrGDe/GCUVKorTxtaKHgSv+bTaN6Vs21RWi8FVTkZhqJXAIL2f6dVrxLXsShXNaa9hQlsVkSuKDBwxWBv42w7uo1wr9AEB6lnTZ+vIEEDLzrPdVla51E9BvGAfPZ3oSN/ruZU9HNAvrXDfu8cppOCs9K3Ez/fJBdz6AKmAWuYIee6HZ1aUkmtumzrsZsPOXcmS6KpvKY12lAdBIaQSRVjLRkdLtRwmhHsnW0uoDU6HsucMIeNCuN+cmNzA5emo0uPVkRBm9DyGkyBvCKT1GA4j4vlr6VOiuTBHLI/rdwOKww6eSLbnakyo8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IhLr1hXEvbJe+Xv7uk56CHmRZUq7/a3htAJDzaYa60=;
 b=Bb8Gw0S3dgeGNPt87RL7iujQdQuw/BIHdQUCKw1UM8r4DJVucrkFkIvQi3YB5xNHi6Xub6vLRLUKwSYWft0qgZYgzYfHCib/r4+lo3AhlKQmSoTGftGFOzgcM6OwDRJQtfNPt49WctSsr38A2D9zuMj/koLebqEaeS1ZNU4FNIKxO7OLeAS7V07jUtlLjOF6408uee71yciu48agWJCa1JStPXxHSVvYG0weRuYBlpDKP8T4DjWz1m6rLtl7nNdMiEyHX94rQfNxgUpyMSnuVJAbs9iExdW2eOSUBJESACNeGYXV1D0vdaDrXluYwViAQsHxUPJbC+kPCmtLNKeGUg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MA9PR04MB148417.eurprd04.prod.outlook.com (2603:10a6:250:10a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 01:28:04 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 01:28:04 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 23 Nov 2026 09:32:54 +0800
Subject: [PATCH 2/3] dmaengine: fsl-edma: use BIT_ULL for 64-bit channel
 mask
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-edma-fixes-v1-2-59d5da374a16@nxp.com>
References: <20261123-edma-fixes-v1-0-59d5da374a16@nxp.com>
In-Reply-To: <20261123-edma-fixes-v1-0-59d5da374a16@nxp.com>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: acefe8bf-fa6c-481f-4cdd-08df49010557
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|366016|376014|261026140227099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+Tu7donOwY5me1e3O/UeCexo9X8CgrcCU2MFqQp7JyPu6ZmYNaT7dViFraVwpVoD7SyNxqZtS2+PUKKxGamliaz1ulKL3K2c66yfCaqLauxt9iAy1GLw1MlKiCuQ4Uzn82cEJMvxXux6IHTqB04fjL8+CzJNGhO0fCcV8RGA+av7SnQVhBfB+FEjVI0klEWfwhlC/+lgsSfznrDjDygHHqcKu0xeqQ8Qucz8epugYkXkTnj6rK0EQ7bCJmpAGZ51KTBHMM/7WOO6L9I+Ac7aXbMWRniqUL11s1WJtu7mApI+hWOoKF17gWgtC5exYEkoc0KrqbdLhlzoYTAdFjTetx/JDhYVJmnDedNCf7Y45PEWbEZQKpD98SFSL0Ith2l5wzWMS9bVJKNHOcTdA4QKKBckwvBUe3sn6q++7tAya03X0NBRYyPE/SJ1pztNsFcPsSzFD3PfDt7fpa3mlEbXQbcY5eBvXbKIILVv8c5UX1JmmJ6fnnURdexVcj4O/ihdVKm9H4GsoDR64f0dLO+dT0z4EqcINga5sGaV5ZpGu4yvyE6v7tppJcd6OM+RYoaujgUiDqS+XpZi3z7yzdNY9SwTZLHAtirP0vtnbpCIlDIqsu115aNnazlQhhV7nH/4R1oZee7cGC5TD1UiqTUsJEmmp37y0Ao2mDgZuygfx8M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(366016)(376014)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1N0V0RVcXFwWkp0cTg4dUFYd2dQcFdDWmZNenFic1ZKdmdLWnlpaWxvQng3?=
 =?utf-8?B?VlcwRXdPOWdGYXlRZUNocXREeUlvZ3M2UmJYUmRKMGxzMWZpMTRSR3VXQ3hH?=
 =?utf-8?B?eGxRcDF3ZVNHTTZzWnliQzViTWxXMiszMnZzTVhodVFTQkQyS0g0d0FQYVNV?=
 =?utf-8?B?RGhJeEJLTFI5VW5RWFcraFRSUzU2MUpCRVBScDc5YjdlaDFuTFBJMzhvYjU0?=
 =?utf-8?B?UnBBZHpPZC9nVUtsZWk0dS92MEJQVE1GYmg2aHI2MnBHdW9xR3BSc2Fmbms1?=
 =?utf-8?B?NFZRSkgzd2tKeXVjeHhoUkQ5MFN6OWozOHpaSXVvc1pKYUdrczdtZXdldnVu?=
 =?utf-8?B?Q2h0Y21JUm83TlVEd2RmbzlYVmFmS0FjcnE1d0M1OGYvOVIvVnlWdkl6a0N0?=
 =?utf-8?B?WFdYWFpGajd5a2U4MGtSYnlkU0lkNHQ3VFJLVUxoVGt5d0I1WUV2NUlqcFlw?=
 =?utf-8?B?VnZrZ2VreXJvZS9qK0FPQnBoWkxRVUkrMUxFemJRemxHSm0vUzFOUzZUMkg1?=
 =?utf-8?B?U093bVdTZnNTRUJFRmdzbCtBMi9lSTloQzRXY2Z0UWo2SnFnWm5OUXNtcEdG?=
 =?utf-8?B?WUpHT3FFZnRpeEJ5K0NNajI2WmhkdTN5TzVHMHhkWUlxSkZESE1JU0ZuUTdv?=
 =?utf-8?B?Y0xseUpOdDFYOVZvcmRnbW44Z2VNSDNLUk5Ub2tOaGdIQjBMdzBJdUNyWkdu?=
 =?utf-8?B?MjlYZGo4MmRSLzFKcXJUdWxBaHYrTkl6OTBCNFVRVmRZUTk4KzIxa01talRl?=
 =?utf-8?B?dUp0Q05NODRkZVJFcnpLQUhvblhkZXpkTSsvZ0xZR2pVRXhRbGVvaFVYR1gy?=
 =?utf-8?B?WjRZaElZWVBTSzNETlZoYmNSemtVQ1FUQmoyclpsRVhrMmcyVUQ0eHMrZTN0?=
 =?utf-8?B?cXVBZmM5dUdBaU9nSEgwMnM1d3ltS2xuamZ4UnpCc3QzaFY5Vnh2eGdYejFj?=
 =?utf-8?B?TTdJRkhhbUErbzJxcEZpcjkrQkp1L01QeER5VzVEOG5nd1FPU0RvcVgyb080?=
 =?utf-8?B?RS9YUWUraDVNOGRJaGlSdkNIb3R2Sjd3b2hqMExlcmpManhodkF3ZytiS01G?=
 =?utf-8?B?WUxNMUFoK3J6YVlmWCtQUWNjSDM2dkpMTFdlYXAveFVQZjFnRUt6ckpMYUpS?=
 =?utf-8?B?a3FWQk1FZHA0SmtkRnVNb3lFTms2OWp3Q1hBMU9zandjOUdka01hZFVpc0dL?=
 =?utf-8?B?K2s2eEJaYW1ORkxwWDhSeDdDcVkyWEJoL2xVMjdWNngwMlAzMHFpL2x4YTFP?=
 =?utf-8?B?c1c4ZFB5N3JNR3FpZ3FKM05EL3IyRlN2WGZaTFp0SXc1ZFpTUUdnVWloYmg3?=
 =?utf-8?B?Qk9WUmVyaUUrd1h6QmQvVyt5Wk1kSWxjRml5NUduRHlFVGx6M1B2RktISm1Z?=
 =?utf-8?B?RDRLUW5sWmxFRThNZHo3RlVpbUJuWGNLUFhTbkJSRFlEZVhhZzZycEtKYzFs?=
 =?utf-8?B?QU1xaWpNcFU2QUdKVG5RUWJiVURmZ2hyejhIVVBWTi8wK0x4dmtKSkJqUDR4?=
 =?utf-8?B?NW5NdWhzbUhFRGw3czFlNmZSeU9zVlA5UXRCWityd2lTWXk5Rk41QjFmODFa?=
 =?utf-8?B?ZEtEdS9iUkZXQ3d1WC9QR1FFYks4bTFaZHljQWJjc1FRNUIyQnc3aEtkeTNh?=
 =?utf-8?B?TUVzc3FmVTZJc0dEblZ5Rjl2Y0Z5Uk1oUFA1aHg2SHNTa1NiNm5yU1RuOG5r?=
 =?utf-8?B?Q1JOcFhGSUhjU1VVL0pvaDY1TE5HUzVaYnc3Y1Raa1JzMERId2IrZGROclBV?=
 =?utf-8?B?RTZic0U2ZjB2RzFzZ09tQnFIKzBtOWVwZ0x0UVVkaVRRRmR5UFAySDZVOE5S?=
 =?utf-8?B?RFhRNWZwTU9mVnJqS2h0V1dmRkx4V1JHeHQxNFhtaytIczh4bE1GWTEycC9i?=
 =?utf-8?B?WUtKWFg3aEZZUEh4OWZJS0l2c2cxT3grcHY3Ukw5NE9TcFljbnlGU2ljMXU4?=
 =?utf-8?B?ZDFYWWhXRXJWS0tMQmNPTFFuN1lyb29EaVVRTDl3dTVTbEl0NERPZlM1ZHJM?=
 =?utf-8?B?TEVNZ2FDSnNSRnpzU2RRTmllWkZIbUZreS9tUlNkMXc4TmlNNWVSQzVBcGhW?=
 =?utf-8?B?Ylkzblp5Mjc1MURoWE5kb2ZrNlovTWNGSExxc3B4aXJPMEhnaGdIbnRBdEFx?=
 =?utf-8?B?czlLcEdCbmJHSkl2NUE5bW5XYjJWQXVFUEhyYUhlTVczS2FBMjRpNW5XVjJu?=
 =?utf-8?B?SHRNODJJQ0k0L2gvT2VWUWhOd0phRUFqWTBMVlE4MG94dnphaEI4dVRUQjJH?=
 =?utf-8?B?dXllcW4zZU01YWRLRWU2UnZtM0JSRWtIZWtHeXhISzhHOC9rdXhoOU0rTkJJ?=
 =?utf-8?B?OVpZVlVZMDZoUnFxRkRlZEVUVG0xSnZzZ3Y3VTY1K0p4MldST1pVU09Gcll5?=
 =?utf-8?Q?4R+CDlF7vKJVezshgHHpI+xSmCkImEKZyK68M?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acefe8bf-fa6c-481f-4cdd-08df49010557
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 01:28:04.4787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYIdfIXUQzhcOZwUjGCPhuinhCDp/LOTy0BYCHRWDESkaC3gQDrgoFxhUGR6e8mmfFl5sAVC8oAVyojswKHSKGMdxETTziC/Vw+++asj3gAX3SziUAPrEstvIG1Tm+no
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA9PR04MB148417

From: Peng Fan <peng.fan@nxp.com>

chan_masked is a u64 bitmap, but several checks use BIT(), which uses
unsigned long and overflows on 32-bit architectures for channels >= 32.
Use BIT_ULL() so the upper channels are tested correctly.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/dma/fsl-edma-main.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index 7f82dcb7831d..818b9b986f13 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -123,7 +123,7 @@ static irqreturn_t fsl_edma3_err_handler_shared(int irq, void *dev_id)
 	unsigned int ch;
 
 	for (ch = 0; ch < fsl_edma->n_chans; ch++) {
-		if (fsl_edma->chan_masked & BIT(ch))
+		if (fsl_edma->chan_masked & BIT_ULL(ch))
 			continue;
 
 		fsl_edma3_err_check(&fsl_edma->chans[ch]);
@@ -397,7 +397,7 @@ static int fsl_edma3_irq_init(struct platform_device *pdev, struct fsl_edma_engi
 
 		struct fsl_edma_chan *fsl_chan = &fsl_edma->chans[i];
 
-		if (fsl_edma->chan_masked & BIT(i))
+		if (fsl_edma->chan_masked & BIT_ULL(i))
 			continue;
 
 		/* request channel irq */
@@ -641,7 +641,7 @@ static void fsl_edma3_detach_pd(struct fsl_edma_engine *fsl_edma)
 	int i;
 
 	for (i = 0; i < fsl_edma->n_chans; i++) {
-		if (fsl_edma->chan_masked & BIT(i))
+		if (fsl_edma->chan_masked & BIT_ULL(i))
 			continue;
 		fsl_chan = &fsl_edma->chans[i];
 		if (fsl_chan->pd_dev_link)
@@ -669,7 +669,7 @@ static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_eng
 	dev = &pdev->dev;
 
 	for (i = 0; i < fsl_edma->n_chans; i++) {
-		if (fsl_edma->chan_masked & BIT(i))
+		if (fsl_edma->chan_masked & BIT_ULL(i))
 			continue;
 
 		fsl_chan = &fsl_edma->chans[i];
@@ -797,7 +797,7 @@ static int fsl_edma_probe(struct platform_device *pdev)
 		struct fsl_edma_chan *fsl_chan = &fsl_edma->chans[i];
 		int len;
 
-		if (fsl_edma->chan_masked & BIT(i))
+		if (fsl_edma->chan_masked & BIT_ULL(i))
 			continue;
 
 		snprintf(fsl_chan->chan_name, sizeof(fsl_chan->chan_name), "%s-CH%02d",
@@ -927,7 +927,7 @@ static int fsl_edma_suspend_late(struct device *dev)
 
 	for (i = 0; i < fsl_edma->n_chans; i++) {
 		fsl_chan = &fsl_edma->chans[i];
-		if (fsl_edma->chan_masked & BIT(i))
+		if (fsl_edma->chan_masked & BIT_ULL(i))
 			continue;
 		spin_lock_irqsave(&fsl_chan->vchan.lock, flags);
 		/* Make sure chan is idle or will force disable. */
@@ -953,7 +953,7 @@ static int fsl_edma_resume_early(struct device *dev)
 
 	for (i = 0; i < fsl_edma->n_chans; i++) {
 		fsl_chan = &fsl_edma->chans[i];
-		if (fsl_edma->chan_masked & BIT(i))
+		if (fsl_edma->chan_masked & BIT_ULL(i))
 			continue;
 		fsl_chan->pm_state = RUNNING;
 		edma_write_tcdreg(fsl_chan, 0, csr);

-- 
2.34.1

