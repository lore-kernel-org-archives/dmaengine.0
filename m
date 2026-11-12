Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.130.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794476717;
	b=0FM19StFwKdP8ZCbyEP0th1FIpZy6izFIFCCPQkLMLdFBpnri3Z6hLev6oVPDdT3xEAY
	 VNx3Rb0ht0Ujzr0RwQHDcCzbpGtXkfvjAdF0io/IVEMDSOipHU49UJ2wwaqd6FeGXH/7O
	 dU3zpWL+K6G+eqn4ocuBUVipBE34VSNr+7Fd2kwV1h/WJ26KTqZTNISjAPbppiC53q30K
	 p2w13X/dQRfqyXCx740lgym1WFHjWDoFvjV2OwmDM3sxbxxyDX1vOt7kRYsAQ16ZCu4dB
	 ziBwiPtA23jwMu799ZVIxU3KGbTeScNnvhkpVyyvbLE6Y7ViPpwcoovTBPin8UheH+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476717;
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
	bh=nlBek0YpSlJeCencsaL7eewB05HXGYU+0WpSVYbg98E=;
	b=noJuBuvScmQA9VDNI3Ke2SgeImQ/CjkDvga2NsBKBiwu8N+XzY4iNkJVB+4iNSeGgVgm
	 nSDrAphUrSmgnthmfiWfemDxEFI0W2dxfv7z6P/7RLjSqFIVPodX3wxI+tF7RrWjK/CUC
	 k7AJJzpV8NDz9Axe9XiYu//rvrzeV7RGYan7cu2Exv7TA9KnpH8w/vrms5Floa9v1WAek
	 qCrBPIoqJa5gy5etW4DOrfO49njTBDm1VlascP83y7qWKnVuVmSTDVP7iwDwFsZBX3XAg
	 u/lY8lhq4bK4jrXVmudXIBW7BKHx5PuoStUagXiZqkdhiUi8Ev3/T725HApZ6od7XMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=eHxwap+B;
	arc=fail smtp.remote-ip=40.107.130.59
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011059.outbound.protection.outlook.com [40.107.130.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F303D606A327;
	Thu, 12 Nov 2026 09:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F303D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=eHxwap+B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gcYRgXPcp1LKtCXUCFvYWxcAnP5JD+s1d1ddG/nVz34BXi1EmFlTjV9LBrghPjBnxh+AxU+xtmYlzwbY2VMBg4oEHs0FDerKpG8FxbS4cCEf7DL+hCQRS/FyjaPKSuGZyweLz+eWorZWVsbw+6dwKkanJFy5/AHhlnOpJlslPq8HiJsLd1lUSJnO3GMYlHtSRvg5yO438/N6b+K3H1Wz3WZUTpBcMyarW63yuW2X3Y1p3kbWTVdPEupLsA10n/IUN3qpjfMrC5Vah80OgekqCS5Zc9hdOz8g+KZynR5OWeiXzT7lYSifsm+wt5hS3hLpPByyT4x4wY71/8ZXiK+zOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofzNk+6FLUOQUJq3Iy2soEfYXFxM2IPRlZACl1n81wU=;
 b=k2xu4yjR+R8QJ7fC4i2wyojiJYDadqDsrIbCKnXZS+JsiydMCcNYh+JRhaTR8srcyOG1YqihqEdTMNEx2hFw6DsDZKtX7aoY8FKp0a33hUIHS3YzFUm30CvPGnLZdsU3R9+V+z6TqdffT0n51HqH+gK88ByV5+hJyls06fFLqDttKDSntyF/u8AdTmGkcb+mtcmcQkQdh8+NPVk4LCXJc5+jBvipomf3G3bIimIzzUKg3GkGFj+apGKlio5CqcLRQfcJVtfoXU3/77GYvgt8AAGoX9/mQMFYTJiPdCMjY/AuSOeGMZiYqO6o+pPly8YdkEPOSNaX1oa+KLrPpB2+Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofzNk+6FLUOQUJq3Iy2soEfYXFxM2IPRlZACl1n81wU=;
 b=eHxwap+BmjfKSOGJSJv13bj41j70PtQmkrz4GUtuVDfgw0Mdv3f2G6LqTtjJFw++mjypTggKmbVW4hKEdy1gPxFNsKyJ+qxplc0JsL/5UiqWRZLlyKGVO8xvyWPdasi+jDNjVQmTPOBEIMcR4kakSMmUEOt25nLpoyN8qijm1lzuUMKdQCJybrdGOoT15YdttNHl+1JgLJDR+wpLbcJI3FqynwIsssw1AD7Hpq2c8029t1glGw5fJ/66FwDKg8E5icsp4VlFLkVLk+mOn7cDWNSjIbt8Kfwixq0z4mN2nbZLHEGCkAsLUPoaGa7u18CViKy5BvsEN2e8vAgm01QoTQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA1PR04MB10180.eurprd04.prod.outlook.com (2603:10a6:102:45d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 09:45:12 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%5]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 09:45:12 +0000
Date: Thu, 12 Nov 2026 17:50:08 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v6 6/9] dmaengine: fsl-edma: use BIT_ULL for 64-bit
 channel mask
Message-ID: <avWL0JFfzDYlsnAT@shlinux89>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261112-edma-iommu-v3-v6-6-b038edb8ce6f@nxp.com>
 <sashiko-outbox-210649@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-210649@kernel.org>
X-ClientProxiedBy: SG2P153CA0026.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::13)
 To AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA1PR04MB10180:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f051fee-1d7a-4317-cd15-08df40a1a574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|10067099003|11063799006|4143699003|56012099006|261022105027099003|261022075727099003|261009223027099003|261028144727099003|261026121527099003|261026140227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	F6Yh/YemcpvDgX5yT4j8W1TVvlPpo3BfRxSro9K0vVee5l0+CTEjnDTA4dftYWBJUFV/yCf54PQCMDkQL9Wn8j/UQfRDSloVgYGKyBes5FjIyF/JOkJ1uRpIZn31pn4/kSVgQ8yRc2MjZmZ39oWx1jpl1Aqcxna/yrhdGe1YqjBbnorU9zFvy74mtFJA1JIR+F44w1eIGvER0VGKTLQR24Qc3ox/rqmbB6JC9mLyXNfbr//4Zr0VuLGhWo/wPTxP0HElicd2poulJlT3/Cd6wxcpDbUd1c/NPH8a8VSkK/bxZL14tzSOwg1YrMVCbtexdr7rJ7R4b+DuaMYTdoD7IwEj4gogHU7P1FilYCEni+G6vGOvVFvwgwqrSKcoA8q3wRM/bPeT6OqIrq2B+diWZnwCOdZP/y3dZVZw6AxqU5YrL6svDIip78CWNpNQWIBy+G1hXWDbT7m/cEieQwvyyCg7JjUEnktpO53gpfjw+1dJwAzhyDzO2//g1jrOgUWBx8fJG+kbG6zm4rQPh+9ma3/u7P1AqItVyUTfMSgKFfqyV3VRtKB4AE9FlBSTKhZRv2I13OKHgVuiyt+4X36F869aohBTZLlRsf9eqcrkJwQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(10067099003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261022075727099003)(261009223027099003)(261028144727099003)(261026121527099003)(261026140227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?cZtWhOr0QRrcbK+3zU2Q9wgRS2gPFF8J1XVXqQwVzToZLZx4MmbudQ7ymu?=
 =?iso-8859-1?Q?7sQWKucwbxH/HJDxoPJGm3g7DiHcqidEAlybEjBjy1g7XZkI7nGVNSvUGm?=
 =?iso-8859-1?Q?YzirhHocLmDOn1WhIH0aA1KHuuFzF7564v31Enel4WxIMFlzum3n6vkyGL?=
 =?iso-8859-1?Q?1/iK3VuzL6WA1S5MnCo/k4M5uTy371p+oQbariPY5zcpIU8tsEjHb4Mi4o?=
 =?iso-8859-1?Q?KOctjsEOnCCp1JEaHlvnajjjviuZOhlJQ+Cm9X462WMYknaAd1Hh5gYrtv?=
 =?iso-8859-1?Q?uXhaAji/4BHdO0OaJ4beVwQgl80ZBAHq6x1kzpyjMuCSBcB7e76w78Qjzn?=
 =?iso-8859-1?Q?HOIgdsxXhZtLa3Tsc/uYtjzjlIEYXr8mQ11nWOVvJlG5ugGs2ngX3dKU1C?=
 =?iso-8859-1?Q?Mo7XUzq/i0oHAwwxKBF9cbierGXldXMq/cdITZ745e8wNbB5LLW8sfSD9P?=
 =?iso-8859-1?Q?+L02kgEyQD7VrN7/m1Y7QxolE/Qb0sk+TSKtq1ieswu4pB+9pQYTIQw6RV?=
 =?iso-8859-1?Q?r43eKkv02pgaDJVmFTyRVQ9ca/0UlWbhMjz3ZNExhbLo2FFlbYM3KmX7Ay?=
 =?iso-8859-1?Q?TVzJsudOh+h0fxwGP+O22Vh/QUc8yoOom/YFMQhOx9mcg6qcmLX6DzUF5Y?=
 =?iso-8859-1?Q?htUNvR95a6DfSwYvHnpb0tBK1lBv3JG4yRf8TL7aUVXZU8i/imaufmbgbl?=
 =?iso-8859-1?Q?kqCk8YJi7aGpjyeUl1bhdLe3YlWr/3vpI+tGl9nwLlV+deHFYJfIz/tcjs?=
 =?iso-8859-1?Q?snx1LkWcMj7NmQ8OFdWw0+L+slOKpgxIQ2fw2YhRXHCRLdquGNIRWUWwAm?=
 =?iso-8859-1?Q?zJyOs3NiYKZNVXVc1HN2Fpk0YIDkXvDTIAq3obHENryl3QF0X7ThsPABbk?=
 =?iso-8859-1?Q?OsT92yqMmfegIZ2rm+EnAcM8Ch01ezKeY/zSpMSt4eQ/9yTn4revJlGfvC?=
 =?iso-8859-1?Q?3zhg1wPs8kVGsazLsen2KRfpytVqjINMhklXe+8Ls2xiU9fVVGj7E/7u/z?=
 =?iso-8859-1?Q?30RNQGR0dvZQbHx0EZRpzHkhYe28nOddrDkfI5JFMTLpOrXL9dyYdpWitj?=
 =?iso-8859-1?Q?KQI21LMQOYaD+zhUKxm24sCx9SANN4hb7TI1iFII2QTgv3h6H6cr2QhFHv?=
 =?iso-8859-1?Q?rReUugHjPot/m6HDJmbipa5yeA+cUTGnzUcUqoYvF9K44Q/iZPZTtHSiNv?=
 =?iso-8859-1?Q?3LXFI6IwLtrnsXhHEli+10ATY7yWmlaUwAsmEf/+gw2d1+6/CLwJd74url?=
 =?iso-8859-1?Q?MJAfVBuLDPlBp7xTBibSYf7wOlx7gXfCJLj7Df37movMpeQ8flBkEq9Bd1?=
 =?iso-8859-1?Q?WDNQnTVpyv+MTCsPC+88nPQ4yNct/E01zBgLv5hI89583v8Egegu3tVozY?=
 =?iso-8859-1?Q?Kj8cORn4yK+cnDNdw52iPH0UQflWCH7IaT+fN1lPxVEmwxQ4Zmysy1nCmB?=
 =?iso-8859-1?Q?92vO3fo1Ov7LHQ6VM7UXrSSRvYs2Zr0eDKPCXurQ2cqnOkTVxMn0PHUqMv?=
 =?iso-8859-1?Q?LQA8MXluLbnqMQwBFOMXuivOI8xPRHZU29AAbg4Wmlqf4hS48u2OfjNtr/?=
 =?iso-8859-1?Q?G4FzFU3+HnJ6HErrrlgYVB7Y+QRtFUxx/TYYXqzHP5q2sgsXI+cmfTNvfu?=
 =?iso-8859-1?Q?fq67+GwMJCQmWKsxvniL6gttCLp/dnBT7XGJQoXO4pdnnDCh12VKJgh6WL?=
 =?iso-8859-1?Q?dlTRvIpXqjHnm4rPpaKo0CF19+CiVpsDWVfDRl4pAodet8qesisy4j/oI4?=
 =?iso-8859-1?Q?O4oC7W4cPxmxc6hYLlt/AaKMa5EAogy6KhqrSHVVynnv0H7QseK2FTRoDQ?=
 =?iso-8859-1?Q?gH2TSaxh2KR8Bd2FhWd7dG9+t7H+gPVUs/XXJxtPU3lQHH4D2qnH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f051fee-1d7a-4317-cd15-08df40a1a574
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 09:45:12.2090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0nJGIRx7gMV2qxcDrAA98dAUO1PNQKUZeHriAiDCRf0hLYnHXiKOsRy5jFvpBSb+4jSo8gXpWphCfhOyU08ybjYv6pESICopx63+TKYft/nbzujZhCqCYmfaEL10eOZX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10180

On Thu, Nov 12, 2026 at 07:55:21AM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential
>issue to consider:
>- [Low] dmaengine: fsl-edma: missing Fixes trailer for chan_masked
>  BIT_ULL() fix
>--
>
>commit 8e06ee65c51430e49223083e2d47b18afdf396c8
>Author: Peng Fan <peng.fan@nxp.com>
>
>> dmaengine: fsl-edma: use BIT_ULL for 64-bit channel mask
>>
>> chan_masked is a u64 bitmap, but several checks use BIT(), which uses
>> unsigned long and overflows on 32-bit architectures for channels >= 32.
>> Use BIT_ULL() so the upper channels are tested correctly.
>>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>
>[Severity: Low]
>Should this commit include a Fixes: tag for the commit that introduced the
>64-bit chan_masked bitmap and the initial BIT() checks (and optionally the
>follow-up commits that added the remaining checks)?

No need fix tag. Until now, we not have 32-architecture with more than 32
channels. There might be cases to run ARM64 platform in ARM32 mode as we
ever did for i.MX8MM, but we have not seen the case for i.MX8ULP/9, so no
need a fix tag.

Regards
Peng

>
>  Fixes: 72f5801a4e2b ("dmaengine: fsl-edma: integrate v3 support")
>  Fixes: 2838a897654c ("dmaengine: fsl-edma: Do not suspend and resume the masked dma channel when the system is sleeping")
>  Fixes: ccfa3131d4a0 ("dmaengine: fsl-edma: implement the cleanup path of fsl_edma3_attach_pd()")
>  Fixes: d175222f5e90 ("dmaegnine: fsl-edma: add edma error interrupt handler")
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com?part=6
>
>
