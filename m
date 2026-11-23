Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795397293;
	b=x8dI+z31Ej3iHIaDORWVJwsi0+DMmmbs8md7WqXqepfpmLrUu4cosea3dyfOzv3cWidx
	 d6Ed7BTfhgeSFaahL1XCgKT32RJ92KTJ5nAfV5W/ESJRB54hgYa6ZGHsInPtfG3dR3s0F
	 tTlXhffD0uTUguMNCEoWtQUsqWaw51MsdoBPNMThuD1pkDLfdr7vV0eqge/8uiHBG1uj7
	 pwVm9FIBHflkX+f9ytTZr8acPZbQkzMaxvffvAK2RIfRprQEmNwKmVf/Ln19ryE5YvhQk
	 hnlLdTFDWKbjbviXb1HAFJlS0/rc88BtZZSW6JATSk2i6v1mUtLCuXEun10UPTIh9uA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397293;
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
	bh=k7Yr/NLdrhAQ9i2jMA15NTdUQCTGO7Ku1hWMY3lAsS4=;
	b=4ybDS7s8+RklaS9N3KTY4mPH27rc6WDkKujm5kHc1ViiPweSvNVc7LJ1f09b8S8FwDK2
	 I/LPxGKXi/qrh6J9hvUnCyYMigIG5Jo7OgVmb8WmtneiBkeOk+Gfvu7/fyG0QFdXm67nq
	 ucWiSKBJ5thIZReCFdpQ6SfkaRFCkphc4BBqkcHdFKFxIwHDYNIZXBsmN6UBzyZDmJupx
	 lXGBNpnt3lyHxgXVzXORiPgHbbFM+ZqKfxh3ReA3XszFQjYy17976PI1Tl43Lm248DB/P
	 SAAldW2zz/qf1uzN0qOUZEtAthdOTZ/kCmCXQoIF/NlsLhsH9pKzsZnXluKX6ZrliEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=I560nlPz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.8
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012008.outbound.protection.outlook.com [52.101.66.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB16606A31D
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 01:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FB16606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=I560nlPz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IndQGN1pqsyxKUwzYyMF935nt2QaHgePrmf4PcXWZsWVrFaBML9DgGofSi3cDSWz6cIEZmFOIySJUHKyGCC41N8x+rR0vTX631xTiIDGn2mfGVYMZvqeuPgRCacs+TAP5xHWgwruR9rbZDcoLY5YOQQlfEnwDsN0xD/+TS10nOL9e//b5E/4QLs2QDFiGF7JaeK6dqWqnQVGRauDseW/hgeSHep3J0F+oKoMkaglx5ySnJlFnU4QcApfcCoDNlVmsHBS2KVlPEuzko9c6A8GkYyGhy621PWGdDpAr6dbOoSEA32keLWY1rB42DSoXE4BnMw+l8+yehIXMlgk+PoRcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7Yr/NLdrhAQ9i2jMA15NTdUQCTGO7Ku1hWMY3lAsS4=;
 b=nFh2fIp11Qn0898qHgK1s1fAN2N+HQt/TmcX/gkuFIQp8uttRDm8n18ZaZfqDRFSrExeAtQj5IK7VGDZtbXCxBW4bZxf6tcX6b3gXHp/rPLMm1p1CzFek1/YjEqcCnQA1C+arktayToLBfdarnZskp/i/J4k/CJlr4ZtY86ECtjk5pIXTs2Ecd+c5PWAVxJpXcqqC/wBPFiQ8p0+M+di3Dx2y70jSuMz0QXEPqwInKJbJXUvXeWu+CzRLyHqa+fbNLavVDoOvDC9uYabITL5psGd/ff4eGVYnAhdZJ/s/Jnz9PtQb9c/pxPemEtWVi0S/jrxE6+nXa3JER/8OUaAjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7Yr/NLdrhAQ9i2jMA15NTdUQCTGO7Ku1hWMY3lAsS4=;
 b=I560nlPz6OrHYrTpm3qzjFD+ECzt7qp2ljlghfSXsggnj6dWWdJQW6XExjpniuD7fOy5oB+bAiQeRqO2whGKJnqT3Ef0PdJFk74NROhj5UThRmEJE6ZtNSwA8nYioAbNdcyyu7Fs9tzqaYQ5X8BxgTTz47Xec0ZEioRKtfWer5zNMovA7fmbujUkop/7JHuOFuDX+5CuAzj+8d1pHBnjOoB0VEj+f0ah//nQgnk/r6EWDl2BjVeeFev+ye2O4iebPA5j8IlnVyD5ITXU2rQzRhYKZs/oVLdA3r2TXAQst1nxIbmYA4Dg0c9b974+0Bqwrpvxqm6gYXghTP5cRlEkbw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MA9PR04MB148417.eurprd04.prod.outlook.com (2603:10a6:250:10a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 01:28:11 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 01:28:11 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 23 Nov 2026 09:32:55 +0800
Subject: [PATCH 3/3] dmaengine: fsl-edma: use dmaengine_get_dma_device()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-edma-fixes-v1-3-59d5da374a16@nxp.com>
References: <20261123-edma-fixes-v1-0-59d5da374a16@nxp.com>
In-Reply-To: <20261123-edma-fixes-v1-0-59d5da374a16@nxp.com>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SG2P153CA0053.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::22)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|MA9PR04MB148417:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e5b943-b8cc-4e88-9e78-08df4901091e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|366016|376014|261021123027099003|261021121427099003|261102123227099003|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7Feqp9CRsUpTjSDf+piFyRDxT1R/omofGR6bDPh7R4IxL0EOji2n9ubR+LmPfBVQ9obBEj/qGth9uqksaY5QWKDVdycOleV13EXy63gFsHliPiSvCg+uR7Gcghsi2QGbtTsrrQG/yU1orc11Z3mXd3r5G2eWngUBomdTkCnSsEepv5CXfba0/iKG6yvabOXSpGGfJr5/Uey+Uq2TsLka5++gIxNrvTh6hEHO0VbjMYFWChAzdVewXlhpJGATci2b194XHi+eY5cI7fy6P21jDZozT0kPZnzRkUhSSP6oO5SP5pVE4U4lT6g/uvzQNRvLTJ+ioGO1CBqn32yWnQQTAXCELjd5clWYS0Y85PXaRZgiQN2VyZNogmAvgVHG1zDObzLL+NhnATAqwfFOKXc9l7zsXQh0DvxPhLjwqnpeuilWAwEigJTBLi9DWR9LaKGF160b/dAv8MySDmIGj5DIPcR7e2EdwE7jyBX/wr928bi0nCtYTDeBsZdMcTYrcmvLiTpahRDMyzqDkLzWWUH91wvro5Sn9AuMZKjxegIy4a9zue+sY5uHSKHccfgFGeXxU+IQp16FfNfPsCgxMUGAkrqK8bcFyaMRKo41DJcq0PJSKpsTxUni/OoZefAZhkuB71oZXSReREd/DocK8rdxQsFoJ0hxQ3nyHvr2i+EsgGI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(366016)(376014)(261021123027099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ync5RGVJcXNIZUJFbmNqZEtSZElQVWw3VThMQ0cwd1NzQlJSQTM2SjhpTGZR?=
 =?utf-8?B?MFdBUWpkQzZRNXpDbjhLWTIzZG5haE5UYWdseHEvcEFBVjMvR0xPdlRFOTB6?=
 =?utf-8?B?Y09CVW1IRHJDTTdjNTVOWlRuTUdtMWdQNms0OG1kM2sxSUg2T29UUyt0SmQ0?=
 =?utf-8?B?Wk5UN0JWVXFsYk9vaUR2NzF4L1l1ZGZDR0hLajgyYTU3aEhabUlnQkdRSEtT?=
 =?utf-8?B?bmNnQzltWFhFNkxtNThxSlpHUE01bE1sT05tQ0hHYVRjM2lCVTNkYktwNmZs?=
 =?utf-8?B?LzY4N1JNNk81NWdrMTgyQ0UyVkY3U0VMUWFLeWxxd3JGdlRpMEt4SnJaSjdN?=
 =?utf-8?B?NCtsc1NkZEthRWp2UHNOL3lBbGVwWGNtR0lNSVJ3cnpJWXI2U2xScjU0Mi9Y?=
 =?utf-8?B?c09zdGpod2syUnRjaVVsK2U4bTF6OWNMNCtZTDFCWGdpenNjb3JTTXJBR01F?=
 =?utf-8?B?Wlc5Z3NVRVFEWGRVeDExVVI3S0toZ2dkZVplbkxIMldIWEU5SkM1NGRrRXN2?=
 =?utf-8?B?VzdxdG1kd0pVNnJBclBYd1V1Qm5jc0IwdFJGc2dvNXRIVnhlTTNRemluWVY2?=
 =?utf-8?B?S3REbk9QdlN6aVFFYXJ2d3NXellEK243OHV3d2JMSkYxd2VuY29MUVpPOEpE?=
 =?utf-8?B?NmRSVWx3aVdzVkFWUEdzVlNmNEFWNytwVmRXSjBOVytlVUQrMFo4ZVpqVTdC?=
 =?utf-8?B?a2pTR2xLQ1BjZlduRTNjejBOL2NQdTM0cXdTMitGM1BkNVd6OWd4SDlpM2dH?=
 =?utf-8?B?MmJlb3U4Rysra1hkeGQ5T3VMeTJ2NWI2Vlk3eUNzM2NpRisyb1h6TGE1N3hk?=
 =?utf-8?B?bHBqZm1QMjAvOTRtTlEvVVNZV0ZFUHgrOVBZV3FhWkVBMlJuNk96WTFsYktM?=
 =?utf-8?B?VTdTUWdrZHdEVkpOM3JnK0NWNCtYYnN1ZkVYS3NjMWY1TnlOcGhhbURGeEQ1?=
 =?utf-8?B?KzhNYVYwcEFZd2dyM2xJQnFLR29UNldzMGNGc0NRT1I0aWI5U3FFTDQzcnZs?=
 =?utf-8?B?WDBrdkNMbC9XK0g2WFV4MDlZMVl1ZFVvbXlxc2IvQjNDanJET1JQVmYxbHZh?=
 =?utf-8?B?TjV0dS9TKzB0MXVhaVdmcVlHdlBWcG9LeFRWYkg4TG9xQUhlYTc5dDZoTWNL?=
 =?utf-8?B?a2VVVWRocmVHV2prNHgrRmxrMkU5Z3JycjgzOVc0bTJHVUU2RXhFTDdDQVFO?=
 =?utf-8?B?bC93ZWtKOFIvcjNmS3IxQWoxYkNObFRBa1ZXaEkwd1dlWEhaRWVKbHgzYmRM?=
 =?utf-8?B?UHBmRVpIM2xDdGJhVDM0SGhzYWxVVm5Mc0xXSzBYUkQzMkVVRWFQeFdaYnMz?=
 =?utf-8?B?Nm5vSFBjOUZxeDFQNERKcmxWSWsrdm9EaGFDdi9pZzFFZ09UQ1VDdlR0NDNs?=
 =?utf-8?B?alVQanlWb0RtUnFOOGljWjFJUS9Od0VhK2RsRzQxZTNtNTdUbDZ4V3c4YVRI?=
 =?utf-8?B?enZNM0FGWUNQcFMwdXZyd2E3R0M0b1JzaDBhRjhFRmxMbnVkcTRiMzdsQy9J?=
 =?utf-8?B?WS9hRlpsWmVnc1EvOHVjRldBZy9RZkZTQUcwV29rblQybFlIZkZveXl6NlBh?=
 =?utf-8?B?Y1gzMVdhTGNmanVKM3hJNEdFMDBQb1FjbzdaOXovQ09mR3lDYlNhQ0tub0w4?=
 =?utf-8?B?L1F5MjJMTnJrVFg4bGFIaENhNWw0Rm5OUzNDb2hlUWJWRUYxa3REMW5SYVJX?=
 =?utf-8?B?RkxTdENEaGh1dS9ZdDhHbmdIQ3ZjbkZueS9XWDQ2cFlTTnh1K1JNVUJqV0d2?=
 =?utf-8?B?b0xvL29MbTYxT1Y3SERiY051QW9NemVsNE8zSHRBY0diL3FWN1U5NXRsbzRS?=
 =?utf-8?B?aXJ4cmo5Y3phdFBCNUJteGRyODNBSlRhREFvUisyVDhaWHF2Wnp3bW5WelFx?=
 =?utf-8?B?eXB1UkZCZngwQThobncyMXZHV2FMT05IUUl3S3FVc3A0Z3hyazRQS3Z6ZExC?=
 =?utf-8?B?MnMyQ0I1dXcyK2hRdWVUbW1sQUtQQUVwWGk1MHV1eHpMRndQZUpZNDd6aU9h?=
 =?utf-8?B?eitxeHFGaHlydjEzMVhsTFN2dExUbTNodlJlQVpGUnA4ZGowUE9FTVRFSjFB?=
 =?utf-8?B?SEtybUgzTHVFeGhpUjNvREoxajlNb3dlZitXZXFRNFQrc0JLa2VtTzNCckVq?=
 =?utf-8?B?ZWg2c2FHTkdrYjlBS0VKSzlwcVBkTzJFNXFCN3QrWU5ZZmdmZ3VtRlNOQ1ZB?=
 =?utf-8?B?emJrTHlsT3FKcG9xLzFKc3FaeHRQZmJnRlNySnlqTFlUZCtpSm83UUlFaTRJ?=
 =?utf-8?B?K1o4dStqWlNDQks1NDRXbzBEM295RWtYWXhwWlVLZGcyTW9GTWQzb0RhMVc2?=
 =?utf-8?B?M1VJa3Z1U3c5U2MzaUllSE5jZXNsMzF0K0ZZbkI2Z3l0VXBPeFA1bXYxaXRG?=
 =?utf-8?Q?EnDnCJcDfGqgdXGl3N8Ggq0q/yrheGrI6/0Da?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e5b943-b8cc-4e88-9e78-08df4901091e
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 01:28:10.9643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNDLb9CrZPWGNKzRdRd/TX++gAf39hijIUXS8/POlj+0+AVBdY01JeUJ7wo5KswXKZHDNRypw+2cD7dOB0hKyh/mIlr9JvfLLFuHcaBHuspWslvSZ3Sd77nKHdo2pPP9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA9PR04MB148417

From: Peng Fan <peng.fan@nxp.com>

Use dmaengine_get_dma_device() instead of chan->device->dev when creating
the TCD pool and when mapping the slave resource. This lets the driver use
the per-channel device once per-channel IOMMU support enables it, without
changing behaviour for existing users.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/dma/fsl-edma-common.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index 513b0f4e5be2..62cd60179bc6 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -310,10 +310,10 @@ int fsl_edma_resume(struct dma_chan *chan)
 
 static void fsl_edma_unprep_slave_dma(struct fsl_edma_chan *fsl_chan)
 {
+	struct device *dev = dmaengine_get_dma_device(&fsl_chan->vchan.chan);
+
 	if (fsl_chan->dma_dir != DMA_NONE)
-		dma_unmap_resource(fsl_chan->vchan.chan.device->dev,
-				   fsl_chan->dma_dev_addr,
-				   fsl_chan->dma_dev_size,
+		dma_unmap_resource(dev, fsl_chan->dma_dev_addr, fsl_chan->dma_dev_size,
 				   fsl_chan->dma_dir, 0);
 	fsl_chan->dma_dir = DMA_NONE;
 }
@@ -321,7 +321,7 @@ static void fsl_edma_unprep_slave_dma(struct fsl_edma_chan *fsl_chan)
 static bool fsl_edma_prep_slave_dma(struct fsl_edma_chan *fsl_chan,
 				    enum dma_transfer_direction dir)
 {
-	struct device *dev = fsl_chan->vchan.chan.device->dev;
+	struct device *dev = dmaengine_get_dma_device(&fsl_chan->vchan.chan);
 	enum dma_data_direction dma_dir;
 	phys_addr_t addr = 0;
 	u32 size = 0;
@@ -1090,7 +1090,7 @@ int fsl_edma_alloc_chan_resources(struct dma_chan *chan)
 	if (fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_HAS_CHCLK)
 		clk_prepare_enable(fsl_chan->clk);
 
-	fsl_chan->tcd_pool = dma_pool_create("tcd_pool", chan->device->dev,
+	fsl_chan->tcd_pool = dma_pool_create("tcd_pool", dmaengine_get_dma_device(chan),
 				fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_TCD64 ?
 				sizeof(struct fsl_edma_hw_tcd64) : sizeof(struct fsl_edma_hw_tcd),
 				32, 0);

-- 
2.34.1

