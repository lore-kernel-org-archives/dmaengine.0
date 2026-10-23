Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792752898;
	b=xS9iYD6kRhbSPCeaDB5VLdOTexWuhOG/GKoLtdHPeNS5cWylXZjncFsxCzrjjllClynC
	 K+NmndxFjcSNfY2l3/gbEuG0U9CBvPqzd9LWEj6gF/PVljp3aPsUGobDtoJnJIWZVeAHF
	 swqYddf+ZOi/6q6Mpxo633BawFPf+ZsWMvl346Hn7W33GOTdD1aCVxqJCd1xIs3hffJdD
	 nTsrXicYHSVuak3cOkI0ixBDdmMRBEEbpncBR4NePs7DK7RPte5Dt6ypvBZekZXV6FAH7
	 DU5xHrFMJliNufCcEHy52l3mnHbNcMRYWMHLhFh0MvYa59xMvs1LTYaCrMRDKrzVBGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752898;
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
	bh=KKMumHJ0lVmD1N6XXsp9mU0iE9mmu4Rnlb2VgbfiUtU=;
	b=DYHG/h3ns6pm9DQVIT+lP2OZ+Lp374qsUDYdPapgLluRg8uOg/x92jc9bmKgdViCfxB0
	 kRTEDbvlzGN6PDv6eooVQaiwEln8goY9WZ+CjxUkdCT2l5vDwR185o+nqNHE8BoN5Jydb
	 2PDH6g/dDhnHzdHIo/Embht4WkWRdFrAd9Fr5A5uyEL8EgRq7QUHkylSB9ixIeLLOSCA2
	 GdBIpTC5xn6MsxM65goDGIY5AUpaDMcIQEeFw15V18fvT5ZolgTtwEkYg/tiA70NdtvbQ
	 FBx2H3NLnh7fheIb/+0wZ/DLAtbVcEBi8SVmOqnx0wiX4TjDb3rzL9Yn7N+/U6viUeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=XXDao3KH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.70
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012070.outbound.protection.outlook.com [52.101.66.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED926606A31A;
	Fri, 23 Oct 2026 10:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED926606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=XXDao3KH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrTZ88t0HivRbnEP9qQQ1QmWxZzk3LRZJKcImtn/jCqZ//mHSXmutTBPt0YqCVH71S+XbtDc6fdhgHQOIwLr57uxzdrT0HslJMe1pZKJldWsVL2JazFc3h/mC268daIAODdtSuiGsZislErSOoJCJ6cn9FnBsutZqNATu47w0/AZXj/VaPOgFm+38eLqcpmDeGxLeM0l4svPmtlYdfVyHbQjW6ceYzdAkJkLhEufypS/hiuWra/ALiQ4Cj4ra0A/4bRxYWUCi3EpfdKwULItyYx9DjCHJpawAIHHGwq+eIkIugJJjXffi9Ys293Grdg7M7A/YqH9BPaQWBNkj+QAug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKMumHJ0lVmD1N6XXsp9mU0iE9mmu4Rnlb2VgbfiUtU=;
 b=WuxM70I1fInR8IngyGXL30uJq4qnmRVohITq7Ay9hd2BlXAJqRR1V7q6f9AJFPME4dtUnWgPDpVoeZhsX79/+CsGCfJENzvbFmifqt06YnMdsuciH2ZtxdrPVkDsuuG0BFEgaMHBMj1aIBl1lvwBk8I9AgfVTn324/c8lZ+wLd9UBCM8VKscR7gpxWiRjbHanQlq36+0VqeQj6F3LeZgPRlkMUj4SIG/sO53OL4yYOprkxpt5U/VOEijfFJ1Z1JFKEziSlf+7r1KTq1N+Wjma5mXwOuQLLiRBJC78n4qLkCWuA0S7t1uZITnzFvmm9L1+VvA8Nz2i7GkOodui8Kc7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKMumHJ0lVmD1N6XXsp9mU0iE9mmu4Rnlb2VgbfiUtU=;
 b=XXDao3KHBDp1c505CaEhmVlaT8CYhpEY6s2Udy8vF7IrlH6a9O6Kj/kN323Yqg89AHu0j4fBfGdBwEZz6ZOQQ+rkEmzG908QatpKCB7Dzy7huSep+tbxqUmajiDI2sbcsfTv0XbtO1rfZOLafPCk8nru09c//2rOHjNR2wpQadtHyw8QRPk0wZHGVbyn1oGkfZ1DFq7khb9Sq2GJowV37qPhV+gB0ZfPr55pMKw7Bmv7oxlWeyS31HlSVpnETC4VYMjnuDcH+1c5oFGnO5GQs6NGNErIrUbEYLV2f4E95FOQMfyuZHt1PAG42eeTgDcOsoUCOV43T+asooF0gYDbEg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by GV4PR04MB955734.eurprd04.prod.outlook.com (2603:10a6:150:402::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 10:54:55 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 10:54:55 +0000
From: joy.zou@oss.nxp.com
Date: Fri, 23 Oct 2026 18:59:09 +0800
Subject: [PATCH v7 2/4] dmaengine: fsl-edma: use devm_clk_get_optional()
 for DMA engine clock
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-b4-edma-runtime-opt-mo-v7-2-418e53c5f9b7@oss.nxp.com>
References: <20261023-b4-edma-runtime-opt-mo-v7-0-418e53c5f9b7@oss.nxp.com>
In-Reply-To: <20261023-b4-edma-runtime-opt-mo-v7-0-418e53c5f9b7@oss.nxp.com>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: Joy Zou <joy.zou@oss.nxp.com>, Frank Li <Frank.Li@kernel.org>, 
 imx@lists.linux.dev, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI3PR03CA0014.apcprd03.prod.outlook.com
 (2603:1096:4:297::15) To VI1PR04MB5807.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 5010dbc3-4ed7-4b52-d73f-08df30f41290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|366016|1800799024|261021121427099003|18002099003|10067099003|22082099003|261021123027099003|11063799006|261009223027099003|261022105027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ob4U8AaJdkEPlZ9pYqdErOJnxO5G9J7iIEfcTyXPb2iIt60B8qGvdju4sc/2LFpgPmjh5Slan9gv0CdjjTn5pkXFPFYlYyd5zFgU7PV0+nB/dllWohJkWjRECjNo/XXpzyp+JAm+DmV26qJMLI8necs/UGYvbYH61SI+i2w8Ljr/LsDoZ9dq+ECsu+e5qNV7H2hVyrq9cgy1GQuhZCpOWgXv5OqAQoIoi7A+LvQc0T8eN2G9Y0j1FpKnAqlRmEY3r0X838mMHyqSK+hfMjI25GUWihNL6VaNfccceoKRkH4NnLmFuRgvQY14JiEG1JkcPqDKHwesp/rsiho75Y6rsO7/E5UbDm/gHA4BtVKoWBCjIPOo8qsrs6U0pGAPDLrXOkaTIQ7GTWxMbyXOTT9oLwwvAdH1UsHqXdqQefMAspJXjeAI5r40P/28q86XJAsvGJ5WjbOlGwbDoaoN8QHPcXvVXFIcb2sVDwBQKevYOMd2YJPYIxw6WBoTQr+HrYMjMG907hFmCd+PYmUWLCdzyYI2mITNfLobJrZNP/ZsSsFwOkX5nRgDi6hkSNQvCqgNMTndruYRG2LRuK/YBNKctTGcI27xWDsNzClnsTi1Xr097s0QPPhacUEukviy7qXB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(366016)(1800799024)(261021121427099003)(18002099003)(10067099003)(22082099003)(261021123027099003)(11063799006)(261009223027099003)(261022105027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1hIRm9TcTBGekRYcUdMb25LQ0w3aDBYZHdMaCttcndoditlT3RjL3RRUlV0?=
 =?utf-8?B?OUNsL2REZjNPVW1OZlV3M2s1L3U4MzJ3NHJrL1NLWURkTnczSlZ5dkVZdDQ0?=
 =?utf-8?B?L3dCb2pvREgzZkVUZml5Y1JKU0RkSmRKT2RGYnEzck0xTXpnZjVWMXJpRWRV?=
 =?utf-8?B?YXNFbGlXdzhvekhxTkZGK25jeFg4TEhVb2JzZDBrQVhJK2xwa0tMTkxnTUVl?=
 =?utf-8?B?aGJKYVF0eTMrWEEzQU1GMmFLWnJicGZyU3MxajRVU1NYRGN2bjNHbWZJcE9a?=
 =?utf-8?B?ODYrcGhzODd0VW41NVlzV0Q4dnBEUTAzRVNXclo3dHFoZTM4K0xwS0FMbkJS?=
 =?utf-8?B?MVV0QU9jTEtqbFJGMUpHZlMzWnFMYzl3K1JwcGdHNjh1QlpPVisxL3ZEQjFR?=
 =?utf-8?B?cndoVVlKM3dFM1NHVllmQmxPVHo2MzNoR2JOUUdYSzQ1ZUx4c1pLb1gxTzdS?=
 =?utf-8?B?QVVGcGFzSzBvNEdBUHlVMWJUWlluQWdqWVZQbW5XR2ZpcXVvMGp5T3UwMFFq?=
 =?utf-8?B?SlBsWktnNFZUSm1aNGwrWUFmdW4yQld2ZEczam1ETmdBOXNFQVZWKzVvQk5v?=
 =?utf-8?B?SkZpaWxjeTE5aS81SjZzRk9zZzNWRGhHZWFJT3FtSllkYllDNzk0R2czQUNZ?=
 =?utf-8?B?NlVNQkRzUkh5U091TDhjaEpYSERSR2RFTHhReUVUZXB0MERjQ1pCVjkzRG1P?=
 =?utf-8?B?VC9LdnVzcTBkWVRNcVgvUmNpN21aU1R4Y081ZGFVL3kwbExxZG80R2hBWHIv?=
 =?utf-8?B?KzUvdEk0cjlUMDExSDh4bHBDd3lOMmR4OTVQcEM2aGlxOWh3TVh6LzF6QjJ3?=
 =?utf-8?B?cVJsUHhUYUFlMnovZFNYRlI1Mm9DLzZqTjBIaWFEbkRYdlkrd1JFTjBHNEQr?=
 =?utf-8?B?eEphci9BVWQ4Q1JFeTF3aU1mc1Nsd3NYaXJBVEpkZjJFZkR5dGZENHQ2Y2ZQ?=
 =?utf-8?B?NG1ySjl1TjZMcEpSd0d1WnZxUFoybVRPSVpYMlB5a2k3R29nZ2xkUEZJcGF6?=
 =?utf-8?B?NjVrQ29yMWlzTVNlb2IzN1g2Z1ZoTnVlZW5zVGxYd3pKUUpQL0pyV1cwR1NO?=
 =?utf-8?B?REU0RkVwNlZrNUVTSUhGUlRlbHhDZ1J4dmFGbHFSRnZORHVjVjFIN3p4dVNv?=
 =?utf-8?B?MlRnQWVKRFRwaUVxREh4MTU4dU4vQVpTRnJjL3A1eEdOR3FWdTJQU2tseGhs?=
 =?utf-8?B?THJNZU1SUHQ2VFJnS1lZL0dTcVoyc3Y0UnNLQ3FUQnlmb2tJSnhyVnFpTngw?=
 =?utf-8?B?bUhmUHNKNDFobDZ2SnR1WEYyZ2pHWkVJUkhBYUFyS2JRSFBEY0dnRndjVFNv?=
 =?utf-8?B?OVNoQzQyZTNBenNGWnRvWXJWYmtuWGNJUDRNbG0wMTJkZ1IwMTgyVGNaRGJY?=
 =?utf-8?B?b1RUM0tKdmY1NW1NNTRkeWNCaEN0TzJYNktRMExxTktlUXNOWjNoVkxxNGgw?=
 =?utf-8?B?cGIyZS82Z3VTMzc3YXVRN2Z2RHFaQlFqbzE2bm5PZWFxWlBUNDBqSERGMnV0?=
 =?utf-8?B?bk51VG1IS0tDN2RDMUNoMnVITHg0SW9mTkRmc2pZVjNwY0R1UEVOZE01K0di?=
 =?utf-8?B?d0xXWmVzWXhQbnoydE4xQ3BMTlJhNGRXQXlxcWwvc3ExaVlaalZaRmoxUjBJ?=
 =?utf-8?B?UHhNbXQvUXVLNks1UnJQN1RQcjdNY3QrbHQxeUk2eFk0UnFyRFVLSk1ZNDRo?=
 =?utf-8?B?ZU52ZGZTcFJmSnZQUHYwM09jYnpVUitJTkE0R1VxVC96RTdpR3Q2dDVXQzlW?=
 =?utf-8?B?aDhYS1Q0RjZUSFpzNzc0U016NGlzNXBnZnc3bDMyRDBGcFM5NzlUMUkxUExa?=
 =?utf-8?B?UVNHL0FCTTBYK05wY1U1L1REQmU4TVhic2FmbTEvZlYvczAwQ3UyNjJuSjFr?=
 =?utf-8?B?cnlKYnFTVFhsc01NekFSRmQ1K3VLT0hHNWQ3RWx3ZHhTQkVqVE1EMWFVRDM4?=
 =?utf-8?B?SFRkbG1icy9JUUY0MUNsZmMzY0NRbDJjZmhrbGNILzh0RVB0ZjJqa1ppdC9Z?=
 =?utf-8?B?a2tpSmdydnArMzhwT1c2cDd2YkZkQ2NzYXVaVE1DeVhpNGNqSG9xTzJrbnBq?=
 =?utf-8?B?RUN2RE5FV3Y4TUI2RVN6elZ2cG5KMzRVTDc3blBNbTlKNi81MEMzSjJtZEZ1?=
 =?utf-8?B?SnY5blRPVHEwTHNGUEhsZHJLZGFWMWtrdllDVE01NFF3bUN6TnVyQ1pLUzk2?=
 =?utf-8?B?NG14QmxNaVBBUUowWTU4RXpWNTJ1WEg4Y25ENndlZGY2N3JFQy9IU3hRaElP?=
 =?utf-8?B?YjdiV2NUSC9majdTanNlU0x4NmFYTHZWak5oUGpXTi9NZ0J0YU1wKytPTzk5?=
 =?utf-8?B?OUJldGNFbHdZRktnbi8vT1UyVGU4dkFSR2Q0bmdXK3c0T09LRVNMaFhua0Zh?=
 =?utf-8?Q?mzYC5ar0UmwgczPHL9w1X6IskFJzsA+8a3SMD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5010dbc3-4ed7-4b52-d73f-08df30f41290
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 10:54:55.3442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h2thb7gXJiR66Im/BvdRUZcxGddr34/JMtMjPGlrStrNR1RU2PxBcw/laT3cSnI2NHoMN8U5BE09IKHO3zZaMmplI3LpM4/ZMlugXc/TiX2zPw19Uk90aIAfhCsrDT9I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB955734

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
index a85bebc25217..bc94554bc36c 100644
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

