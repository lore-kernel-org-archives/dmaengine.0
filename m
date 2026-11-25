Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795604092;
	b=ZHKECLz5QVE9jtqXID7vC2fnEO8t5d6gXOru/YNXKHD6MdemxxnV9vQVDTZbpZXLeSaw
	 1XOnAdlxtCjLiN+8HKdrJk++7MRzafJT9nf0tGL9w7kH4M4zpI6YdVTQyLeTb4ZKWgyY4
	 zv9rStovbl6aSb5qGZFwE0QCahTxxqiAc+ogpT2uvfsM7OKMs/XzSBuEZ8VQprKtrwpHP
	 9HeCHsbF1O0wHHpvRs46RhOW/uD5p1Z7q33V2qlbDY19d7/uvCBdP7rIIK1nIZa+OYHLT
	 rwyIEOGpZo7OJOa5V/2VlwI1a5GzBVZfX1oiDqHG8PWn0E/WA7p7hnNICVp+i/jfYSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604092;
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
	bh=1L7iAensd8Yoad3Q+/ZGX3MiWc3bcgByphLViq+aIlk=;
	b=mEcSLJkl6tmmXl2oPjmFxomRijLSaR4qEtTBclsf6rLonQPf4STCYvtlfy/S2uui1Y5W
	 sSrnoKBMhvNTnP4TDOp6aiT6MG7hVyVcPMXO5BjPhuZMwey/1dkgjJ8+sQxaZihhdWNoL
	 gSYaxemZmx2cjRE0fjKkldF2blmZ1Y3QiPJyE43Eo2LIFIpasD2yWxi09WEJzf7j0yNzB
	 7V9+FglrqYtZ1S/CF8/dkkA+lcsLS9iYnJEe57xcxfauWTuIox/wpGi7ry01Ds5fLuKgs
	 R6DJqrkGcgYD0GiYzy9y0Dv0tLmU5e+7Me/ijeuMVSv2L7QwEm5yfUemWFMXMPFtplQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=NTabR9ke;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.54
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012054.outbound.protection.outlook.com [52.101.66.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED051606A31E;
	Wed, 25 Nov 2026 10:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED051606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=NTabR9ke
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRthIPo8nOIvvMon7haTk+dHi/Zhxpz2yxnn1v065EH1rillJVW9a0Md/rQboIJN8bOOQy1rZp/16DWFT/TUBmO+doLySdVBhUN0hgtJDINm4lYu2KeLTTqs+3bhUm/pPyDjR2cTBy/TaOwuU+dCIE13CQfavP+SyX0c+UV6lrctbrpLyQ80X4v2vAUxU0T7tD1RTPETZH+M3w2n8bo6oasFVC6OwKym4EV11gQftxX2FkYDTxn4xCA2RcbtEeSLpOZ5Skw3PwMPQsJd+jMU+JwxPN+A/JY72ICJCr1C5d2C5pMRfXr6t/gPquQqneOgUSV3smNGBYRKFOxSnHQUhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1L7iAensd8Yoad3Q+/ZGX3MiWc3bcgByphLViq+aIlk=;
 b=tDIFMUFUDwVUrUOI6UM3ysaLcFAQQCqEPTCBXV/2sfo4jEK0xWx893cMb3HEh+3f/b0j/4yc/catZesFdoG6K0Zp9z+rHptYR9BoaOxEyJxTnP73v7u3EXm42gc2b4jp1+5w5fvb28SmPKA6sH2RWS2FU3mEVJCurvWjlfXAi8CZ38O4vjzI7nKdcKPU0akzUJ1dbF0/i4U1XBWxz8z3nfIdamFI4yIbF2QM5CbAT4/BoT8JD1+0V9BXiRS1kaVqrdL9ZTaWYy3Czqx+Z+pIcQToRDh3zBtQINT5B/fSBAjWppsANYRnufZHG7F5vnk3v33HvaFX4N7HPIn1QBYTlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1L7iAensd8Yoad3Q+/ZGX3MiWc3bcgByphLViq+aIlk=;
 b=NTabR9keECVjP1GhfgU9Vp8kD/jQngiXBpGuOd9FTH77Gduo/qe0OcRctDLlQ74Z9eB3dpCLgrlQF4PJXEJG0qI0om2+HydzfCoIbNfEN2Th6qJuO6UF3Xipckd9Buu72cY3rBKf22vblqjPJ89DWKrdUft/KwxaSh1SDBvb639pURuTIDU3qkSY81TbxDfy0mF9kiBTcPtijIrhG7Q3gGrMLLMHNvYY24pRyhD685gL+/CB7DMTCfXJY71j0lIpmecAWWXlQVpF9bIIJaoh5YHFXnJeIhdjY/i89KQ5uGa6+ZQJ95F1IqE+x4VNDTGUFI0+9oHoFEMfPqpK7rg37g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by BR2PR04MB007356.eurprd04.prod.outlook.com (2603:10a6:2c8:6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 10:54:49 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%7]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 10:54:49 +0000
From: joy.zou@oss.nxp.com
Date: Wed, 25 Nov 2026 18:58:56 +0800
Subject: [PATCH v8 2/5] dmaengine: fsl-edma: use devm_clk_get_optional()
 for DMA engine clock
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-b4-edma-runtime-opt-mo-v8-2-81345a3bfb52@oss.nxp.com>
References: <20261125-b4-edma-runtime-opt-mo-v8-0-81345a3bfb52@oss.nxp.com>
In-Reply-To: <20261125-b4-edma-runtime-opt-mo-v8-0-81345a3bfb52@oss.nxp.com>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: Joy Zou <joy.zou@oss.nxp.com>, Frank Li <Frank.Li@kernel.org>, 
 imx@lists.linux.dev, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI3PR03CA0010.apcprd03.prod.outlook.com
 (2603:1096:4:297::7) To VI1PR04MB5807.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: fa91e253-5dca-481c-dcc4-08df4ae286cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|19092799006|366016|18002099003|22082099003|56012099006|11063799006|261009223027099003|261028144727099003|261021121427099003|261102123227099003|261021123027099003|10067099003|261026140227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	UL95vuV480+RboLb+dkZIVicyxlZ/CZ0Pu08s1g/Vf3IbK3uq8Qss5SYA5WqtdZeNHQ6zbdQTOmhCzKWHA3Uj3QJND3AACQDJzXq/f8oLNcvr/TTuV/j/UBWYv98Jv4Mj6fLSBJUgNtds7H5Y0sn4L22hhevHTLRKs3paxUU9KSPKMLRRzzzyoj6zEpcq1s7VbIviCOohAzDsCGA2/dDBe2/IH+CG1pyOdgxTOlq2s06Zrtj+6mr9yHHeYYaFYIsrJDoQD1yt/RQW7dPwtZgZWvgSc+BouImfr1BlJCmtPO786ShC45Wd6xY0kFF9dW96gmCI3dfhBOwGoUC54TE3fixcfC0ml3/Pn3/GmZ6mKt/8GjR2bk6obsXqgK9JRsZeNhY6REDB8Wg/QpgamUfbiqYWmgb6gy2ieBKI59CEwTvVfRI5MJFcq3+toKA58+IDI4Z/FhH0CbCVqGbIQVqmnZ3VDiMlnUD6QtNCtvPmoTcPwgxj96OZ4+68tyLSdxtM3X0S1+9Mqg/y9KpKTo0VBDV3DphD78RHd9VbcndL+Kr2t8lDTgLRTS6ienCXiBizURyONlHrV5ZmMrssjtesegcOmFOoWJPhtGcoQ7WGWnT0wt8qouHCnPq0bA7NITp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(19092799006)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(261009223027099003)(261028144727099003)(261021121427099003)(261102123227099003)(261021123027099003)(10067099003)(261026140227099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWw3SXNRTk55Z0w5a1BiSFdVNFN6bTNSc2k4Ui85eW1JNGxUYk9rSUpaUjlL?=
 =?utf-8?B?OEVFcTU0K3FVbmJrRTZ5YSswd1dKUlF1YUtyU0IwS3UwRWpuNElueEYxTnZu?=
 =?utf-8?B?eFFYYzhmY3BUelFNVy82MGZLVE45RjhULysraC9yZnZld0VDTGp3ZUY2WFRv?=
 =?utf-8?B?d2QxbkgvQ0dpMG04QmRNTWJlelVXY2VWeUJ1ekFRVXUyZFVWRmhlRGlpTGQv?=
 =?utf-8?B?bW9kZ1JSYmxHM1lNeUhSb3RQNXVGak53c1pCOEMyMEoxellGNnZ1a2wvd1Q0?=
 =?utf-8?B?S2pzVkxCa3VkRFlISFozeUQ3R0hkZVBiMk5BNHVHb1RydVoxU1lySmZsa2FW?=
 =?utf-8?B?bkg4OVVWdnduYVF0dVlKbitRYTNqV2RjTlBYbm9uQXoyRDRCUFB3cU0wUjBr?=
 =?utf-8?B?d1hsczF1WlE0RHA1Qlp4SDVPVWttTDJVUlFTRk5kOG5TSlp5eHI4Tk44eTA3?=
 =?utf-8?B?eVcvaTF5WG1Rd05MT05HSEt5bTE1azJpbEdaMFRBSzZkTlo2NEhSVDhvajZz?=
 =?utf-8?B?bktDRUtiRXc4WXAwRmlNdVQybGhzMmZ1NXpJZ05JTG5OenVRdW9OOXJKaGQ5?=
 =?utf-8?B?TkpKc08rL1R1SUNNOFlHT3dKMk1oZWJIbnNMS05VbmxHU0lSNlN5djhtd3Z6?=
 =?utf-8?B?WElHYWUrcHFZQ3VjRW9ZRHlaenpxdXdGTUdBV2ZadVlVR0tUdE5iQ1g4eHJa?=
 =?utf-8?B?U0IwdHVsY0ovODErR0NSNkIwNXNXQjUraEQ4eHRYbHduTGFwck9rMWVlckFF?=
 =?utf-8?B?cmQxcWRqUEI4bXVsSi9jNXRKWmtYQkJMN25CVER0WW1DQ1A2ZURCaWNzYTQr?=
 =?utf-8?B?REozWFdYSGNpenRjVDgwLy9uK0l5Q3o0RVM0QVkxclZVcXkvLzN6QzZWRVFD?=
 =?utf-8?B?OGhIV2pnckd1K0hUdkdpSkM4MWNDRlZ0bDdIQlIvWVkxYWRQODZ3RmhOS3Js?=
 =?utf-8?B?R2QyR2UxOWgwQlV5U3R4WjVJV0Z0Wk5kbldxYW53Uk1ZTGI4S2VpR2N4dnpB?=
 =?utf-8?B?VTBsN0FBd0Q3bmg3M0FqSTVMMGxWWHJ1dDRSMVlFNXlybmlva1Biem52L20x?=
 =?utf-8?B?d3kwVUQzU21Xc1FDSFRlU3ZYVlRpVVMyeVg0WGZTa3VWa0d3aG9YdDZxSHhv?=
 =?utf-8?B?a0xQS09KMGwwd3ljejd4NW9uaXFFM002NmRhWDJKdjRVaEhQaWFZMFpSSnpr?=
 =?utf-8?B?SmhmdFBBcGEwREpjUWRHUGtyNDVtMTBxeHdlV0kwUWpVeTVQa1JuYnduTTBv?=
 =?utf-8?B?UkZXZGdUMEprRlpVWTZFSm1ESGhLb1lDbjg4SHc0b3ZhUVIwRVcwSWp4UzE4?=
 =?utf-8?B?NTFORThneDAvNk84OGZqWTZOL0VkSml2NDhtSW5Hek53OTRQQVdzZlo3OGkr?=
 =?utf-8?B?MmVTcWZMMmtwTWRVTm9SSVVJYVYwd0I5VktYc2kwaGkzS2VJRHlVbUlLb1p2?=
 =?utf-8?B?YmVLbG02ZFNCVWpxT003L21VbUJkRnNaTE1McE9SZXRZMkI2U293YndDSDhh?=
 =?utf-8?B?dTF3NDV3bStLbmNVOWVWckxUZkZ1ZVRFbjdveW1xMGZZeVB3WmE1aGR1b2hG?=
 =?utf-8?B?VWRRU1FxUDA5TnBiVmhueXhkRFdmVExQaDYwSXNFUFZkcXdKZHFQVkEycXRS?=
 =?utf-8?B?eG5SbUVsRHl5cXJpdWtWalpOSmVjTFlCWVhTT2FaUjBaYzIvdjY4UDhWYTVm?=
 =?utf-8?B?TzU1SUZxOTNva0NBclhNMHU0bmJPd3ZsOFltT254eHZ6Z2hVcy9SSnJuQTMr?=
 =?utf-8?B?b0NLRHJ0dWp3OThMUUJ0MUFFNkRPWllxZXRUWGZ5cmZ6dkg3YmNQN0ZSd0RD?=
 =?utf-8?B?OGNLS0Q0OUFIVSt0Y0xTbVViek91aFpTU1lZSG9Ta1g0WkdRNFZ3L1VGcjZR?=
 =?utf-8?B?Vk13M2hiTkxUbGgwd1F3bWxzSEpwcEEySnkrVXpSU2F3UlE5SnFQYThRYU5o?=
 =?utf-8?B?eFBDTW56enZ6Q2pKWncxM0dxc1JNVzhMRFF1M2NtRjhEK3RQNXdGSEUvL2t5?=
 =?utf-8?B?ZUNlQkZKeXV5MWVVbUozMXkxOUpwUHV5SE1TdGlqcmxIS3Y0NUlJUXhCT0pm?=
 =?utf-8?B?SVozK1JoU0ozN3M3aEhBQ1NvNVlsN21IQVlkejRxSlVlZW1sb1BzL3N2bXgr?=
 =?utf-8?B?NDQzalFuNnZnY0w3V0RRT1pQREZmcGU3aE5JOFhGTmc4L201ckRsQWlkRExo?=
 =?utf-8?B?NmZnQTZjLzlIaGhHVHJ0S3c2dUk2QXpPN2lEbWNRdmNUSnhLSUJxS3BzYjJu?=
 =?utf-8?B?Skk1UExxNFE4dnlSajU4eldRV2tDa00wekRDWFhOSWVRc0xzdW1sVDBNT29w?=
 =?utf-8?B?dFJnOVdhaXJwV0tlV1dqTUpCTloycW1DbmloYTlpUDRTOWxPb0ViREhLZWI4?=
 =?utf-8?Q?RY/netH0nnIB6xVo7xjJhygCOT4JqkNXX0Sq/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa91e253-5dca-481c-dcc4-08df4ae286cd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 10:54:49.6106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6yev7109Spew4xrwOI+SlwPyay2hOBGmmoHtpzg7iD/gponLB7qo+XJn8k9wDpHdDnGaB77194YCJyETwR5WCrp5jxAogBLYmg8PsjzXD6U50upYC7vxmCnQqFZ5u30j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR04MB007356

From: Joy Zou <joy.zou@nxp.com>

The eDMA engine clock is optional and not present on all platforms.
Replace devm_clk_get_enabled() with devm_clk_get_optional_enabled(),
and remove FSL_EDMA_DRV_HAS_DMACLK flag to simplify clock handling.

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
 drivers/dma/fsl-edma-common.h |  1 -
 drivers/dma/fsl-edma-main.c   | 22 ++++++++++------------
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
index 4332b2b2e1df..97b3a9872e90 100644
--- a/drivers/dma/fsl-edma-common.h
+++ b/drivers/dma/fsl-edma-common.h
@@ -207,7 +207,6 @@ struct fsl_edma_desc {
 	struct fsl_edma_sw_tcd		tcd[];
 };
 
-#define FSL_EDMA_DRV_HAS_DMACLK		BIT(0)
 #define FSL_EDMA_DRV_MUX_SWAP		BIT(1)
 #define FSL_EDMA_DRV_CONFIG32		BIT(2)
 #define FSL_EDMA_DRV_WRAP_IO		BIT(3)
diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index f0930895d7e0..6a296fffb837 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -559,7 +559,7 @@ static struct fsl_edma_drvdata imx7ulp_data = {
 	.dmamuxs = 1,
 	.chreg_off = EDMA_TCD,
 	.chreg_space_sz = sizeof(struct fsl_edma_hw_tcd),
-	.flags = FSL_EDMA_DRV_HAS_DMACLK | FSL_EDMA_DRV_CONFIG32,
+	.flags = FSL_EDMA_DRV_CONFIG32,
 	.setup_irq = fsl_edma2_irq_init,
 };
 
@@ -572,7 +572,7 @@ static struct fsl_edma_drvdata imx8qm_data = {
 };
 
 static struct fsl_edma_drvdata imx8ulp_data = {
-	.flags = FSL_EDMA_DRV_HAS_CHMUX | FSL_EDMA_DRV_HAS_DMACLK | FSL_EDMA_DRV_EDMA3,
+	.flags = FSL_EDMA_DRV_HAS_CHMUX | FSL_EDMA_DRV_EDMA3,
 	.chreg_space_sz = 0x10000,
 	.chreg_off = 0x10000,
 	.mux_off = 0x10000 + offsetof(struct fsl_edma3_ch_reg, ch_mux),
@@ -581,14 +581,14 @@ static struct fsl_edma_drvdata imx8ulp_data = {
 };
 
 static struct fsl_edma_drvdata imx93_data3 = {
-	.flags = FSL_EDMA_DRV_HAS_DMACLK | FSL_EDMA_DRV_EDMA3 | FSL_EDMA_DRV_ERRIRQ_SHARE,
+	.flags = FSL_EDMA_DRV_EDMA3 | FSL_EDMA_DRV_ERRIRQ_SHARE,
 	.chreg_space_sz = 0x10000,
 	.chreg_off = 0x10000,
 	.setup_irq = fsl_edma3_irq_init,
 };
 
 static struct fsl_edma_drvdata imx93_data4 = {
-	.flags = FSL_EDMA_DRV_HAS_CHMUX | FSL_EDMA_DRV_HAS_DMACLK | FSL_EDMA_DRV_EDMA4
+	.flags = FSL_EDMA_DRV_HAS_CHMUX | FSL_EDMA_DRV_EDMA4
 		 | FSL_EDMA_DRV_ERRIRQ_SHARE,
 	.chreg_space_sz = 0x8000,
 	.chreg_off = 0x10000,
@@ -598,7 +598,7 @@ static struct fsl_edma_drvdata imx93_data4 = {
 };
 
 static struct fsl_edma_drvdata imx95_data5 = {
-	.flags = FSL_EDMA_DRV_HAS_CHMUX | FSL_EDMA_DRV_HAS_DMACLK | FSL_EDMA_DRV_EDMA4 |
+	.flags = FSL_EDMA_DRV_HAS_CHMUX | FSL_EDMA_DRV_EDMA4 |
 		 FSL_EDMA_DRV_TCD64 | FSL_EDMA_DRV_ERRIRQ_SHARE,
 	.chreg_space_sz = 0x8000,
 	.chreg_off = 0x10000,
@@ -738,13 +738,11 @@ static int fsl_edma_probe(struct platform_device *pdev)
 		regs = &fsl_edma->regs;
 	}
 
-	if (drvdata->flags & FSL_EDMA_DRV_HAS_DMACLK) {
-		fsl_edma->dmaclk = devm_clk_get_enabled(&pdev->dev, "dma");
-		if (IS_ERR(fsl_edma->dmaclk))
-			return dev_err_probe(&pdev->dev,
-					     PTR_ERR(fsl_edma->dmaclk),
-					     "Missing DMA block clock.\n");
-	}
+	fsl_edma->dmaclk = devm_clk_get_optional_enabled(&pdev->dev, "dma");
+	if (IS_ERR(fsl_edma->dmaclk))
+		return dev_err_probe(&pdev->dev,
+				     PTR_ERR(fsl_edma->dmaclk),
+				     "Failed to get/enable DMA clock.\n");
 
 	ret = of_property_read_variable_u32_array(np, "dma-channel-mask", chan_mask, 1, 2);
 

-- 
2.34.1

