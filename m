Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013067.outbound.protection.outlook.com [52.101.83.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B66B36F415;
	Wed, 30 Sep 2026 06:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749730; cv=fail; b=dz8eqPrI0j7Qln0UK/YlHVzjo9/c7UW2/bgIhYpJYcUpJVQqLcGUkqhVW6GLFX0/+6mFwtoC8WJA90MZBP+RsZfUzctmh6dD4YSC62UDcsnQeoqV1ncydzKQj26Q4rJXv3GUYOqnxCcUcgh2W51DMA0NQjyU7sCI7CEsHQxOdBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749730; c=relaxed/simple;
	bh=ejtk8m5Ia7ydV0/haliXCrJwj2PKuLFLfjgFquPqpJI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=T3peCd8uCNDB52oFAN7pA1dFHTEhPYcWpbxZQhl1btIYiCzmhSDLTh8zbR8XRLU6BMYSDP1FP69U36EGnVGy2BZD203vWBF5QSvS6NSL9nMZ6GbboCG4Deu2TA96pmGMktziooHIDmwzqZ2Qu/GY15H7pg+tzoMgOfeXobC5H4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=G9d3iJ0R; arc=fail smtp.client-ip=52.101.83.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="G9d3iJ0R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tw9qwXd1zditU6N388m5Wqov3RLZ3DoV3YWCFIUZBd+rsF8km4cwT2V4QIcQp4wIUQr/9pehL8e9vDuWIA+1vDrVS+qdOTyvgu5Px+80itlrubowt3gji89ZGljT/nRcQ/2SmSrQ56pnP95rsS9onpuTugyi6IrTrO9BtqdUvZCAZ5tgiYtZ+Pjb2ltn3/+zAMiyKAlety/wPIHfN9BzMS7VgtD2D/fphUZpQAeFcvxKuC9ALKYc/hh6RL2PId8RuZCgnf1wjkk9sCg6HMocscQfCI9lXBN5vOKZPrYJatfii5Ye+ojzzkgAJFbCwNpC8XoHfUSwEzxhGvyy2NGjQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2KtjaJjiOHZ0oCymObNG9F/eAOnZxHqDaA1RRQARbc=;
 b=OKsrCMpOvSdoVD37ApoBfb4uFqf9KrQIdQ9QyrmFFvmRO1Z9iSvfu1ARA2xEjmnjl+9G8un9BwOt5dWgRKh3b7NY+Jpd0mrjmYxS1oIVVJ0rzgrgYFyuj6Cb8Us08pJc44cq2MdrxgrFGswlGAaypzLRMyyCrBcMSgSvBCjYmbCcNBihkb3ptMoXK90Pd4HiZH4Q3JqmKplQjrvzb+POK8C9kDrK38xA68GA5gTPizWnnqyjueUTqQ2BJmcNu1/6HwJFDgrkMKldVdHNPz7NCYzKprTR5+lX3ATXh8wSvquimS5UTgC/F4iYQSNDrhxoPD1alKycM+rXcOjyLKCYgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2KtjaJjiOHZ0oCymObNG9F/eAOnZxHqDaA1RRQARbc=;
 b=G9d3iJ0R2TRX1sW2mnHqTs7qCegi6eKG1zgI1J1GExK8aX/j/0xWqfO8zJXN3FMFdDjPYlRVOcuKWHOU+XVyp9S6dDriFbLC6b0gThYNw8565vAxwZHwhefuADKSQhARoJBjRbsglXGMgAf3dBhBOwfu+CEMUdHn/r3gCx9LnmwIjdpUFi8zk+ZIBPVOTmEMJULCYq0Zv3kyWOrrDDzwgvrBEeEfdDa8T0kdjH89RH1MYWMaoJqV3yp2tPIJIOXInax23erkM3Uh43UUmJESm+IjeAu5joFOxZELQqgScmcKGQB1wMMMjy11OO8v/MjZwto4uqRZRu976t4JhxRwxg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 06:28:43 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 06:28:43 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 0/3] dmaengine: fsl-edma: per-channel IOMMU support via
 DT child nodes
Date: Wed, 30 Sep 2026 14:26:08 +0800
Message-Id: <20260930-edma-iommu-v2-0-72a62bf44c74@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAICrvGoC/yXMQQ5AMBBA0avIrDVpJkHqKmKBGYykrbSIRNxds
 XyL/y+IHIQj1NkFgQ+J4l0C5hkMc+cmVkLJgBpLbbBUTLZT4q3d1ViQJlOhKQghBWvgUc5v1rS
 /494vPGzvAe77ARYulNduAAAA
X-Change-ID: 20260926-edma-iommu-f5d0d97295d2
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, Joy Zou <joy.zou@nxp.com>, 
 imx@lists.linux.dev, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:196::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU2PR04MB9081:EE_
X-MS-Office365-Filtering-Correlation-Id: 02b3a2dc-1b4b-4de4-62c7-08df1ebc12fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|376014|1800799024|23010399003|11063799006|56012099006|10067099003|260925022911599003|260925021911599003|260925021311599003|18002099003;
X-Microsoft-Antispam-Message-Info:
	azdJ55KWXnebyExVo56goak7c5w6KWbjtbldPUVqd116PTupZEMGnbW5hjwMhvT8g6JicE8J9bBmg3InICiPuZW3gYGXWK6qas/IUn7/oisQdPOZHYr8fQa7I5L1DIQ0+YnTvEvPYsvfKdsddQ4ZRheEpOuKzRP8HHaZAuplcnUZ3k6adlFijlazXA9sSU0/ObQrO2Au+DcCiD2GwB009/VxXI1qm3FRPmNem6i7x8hsLt9ZLFuWJ9JISelmje2ypcT0bGllz8O2VIJAXf+4HMUACRCo23qBctYtm5wujO06ba6EcVkLtJatr+MwEfcNfUheGRxSRU4hZdZqPI0wXOIPy/vJFiU+enlSoYeWNvlNyxHAc5x/gUgTXluhzadQYE6mKiCMfJ/MTkzGMkSpvdi4R+wourFmREoMv1p0Ftq22tr5yK1W8VoM1Yf1lJxYyqKyprf2gK6rlXjO5i9YlBTYwbNSur+v2w7x9STEuUntz0JnkN+rY124Ao8XuQYinvj3gGr/JwDWws7mwCNWTokEv2CRhng+ef+aqtioTs3AY911Suvu+baCH1QaXvc/N9OlLi2FU6CPAzdzqYQt7sLDmoYxafWUu4ZjSekJ+CdziesqGE9P+u7cC1f1+s4j
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WSsvNUZGZnFiSWg1VXcvUTdCMXg1ZGVyNkdZTXRWVnllNWRhYisvYnFoY3lY?=
 =?utf-8?B?VFJMMVJOWHBLa0pwaE4vSExWRVFZSWxCelBnYmc3cmNoeVZMcmJsNThyZE9y?=
 =?utf-8?B?WTI4U1k2cHBERmo5SVBrQ2d1ZURqK0kveFllZGRxSFVkZGFYY0Y1K2JOMi9O?=
 =?utf-8?B?cGYrMDdHSVBVZzlVa2ovaE90djd0T0kxTm13Z1U5N3FvZ3ZJWGx2VEUxaHhK?=
 =?utf-8?B?RXUvUEZJcUVMSW5NMGMrUm1VdGloL0dNTkp1eWxoQ2JQd2xWKzl0QlRhZjdk?=
 =?utf-8?B?RlBKVlVldzltWndWNTZwcjJISlppVzNkVFhTSFBrUUg1eGpFZDFOM0owS3k1?=
 =?utf-8?B?UkVqdEJ1enFCTkNucE9XYVdqRnBPU2ROSjBvZUdmeGR1WFppdjFTZWxnczRi?=
 =?utf-8?B?LzM1UEE5OGNDbnArT3lNRTZEL3NKU291bGJNaEJoUUE3c2xSN3JaR0ZNdUxO?=
 =?utf-8?B?MmtrLzdHaitRcGNyZHhoUC81YWFzZ2JqUEl0ZnBTUTBHUk94VVZ1a1ZtTDk2?=
 =?utf-8?B?Tkd0NjJpWklvOUdFbWsyUmFsZjBMQUFtd1MxTWhQOGV3NUpOWENyWDIwODF4?=
 =?utf-8?B?YlVZdmQ4NzVvYnJDcFlBa0pXUkFEMVJuMTNOTG1pMUExOUNSeXdHa1kwY3B2?=
 =?utf-8?B?K05xbElsT0hlWjR6ZXY3bHduMlRkVG5XSVFPTVpOaDgvUmhHZXlZVTZxakhR?=
 =?utf-8?B?Y3ZMWnFrOER1L1VYbTE0c1Zoek0rQjFjalhGOVBrLyt3N216WVJBVzZUdE12?=
 =?utf-8?B?TC9tSkhvZUNIZGlCRjdRSzcyVkJkdG1nL2FmSWZwWEY3Tit1VmF1ZmFkRjYr?=
 =?utf-8?B?TUk3MDFLbzRBQ2N4dVZCRThWbEQvd1pHMlJsa2tnZGpnNDF3YncvVWswQWVD?=
 =?utf-8?B?WGlhM0I1VHlPcEFwNzBwWUN6NlJsS0QxZWNLUVFHcjM4a3JwOHQxcXBWR0Yv?=
 =?utf-8?B?Z0ovSktnN3pnOFBrbDRPM1N5aERTd09KNEUzMmhwUmpiamdUZFRLOXFHWVdi?=
 =?utf-8?B?RGxJYlBYUEU4Wis3Z2F6WTVHOW5FbmVVanJoTnhmZlNjZW85b1hxMVdZMmVF?=
 =?utf-8?B?U1Z3b1MxSmFPeE9ydURzTi9Td1JJd2RMK093UmJ6QzJHWmY0Vy8zeDl3bjhR?=
 =?utf-8?B?bkIrUVk3cG5oMk1YenFVRUVRWW4waVZmSDY3Um9yS1B4SE91dWhORm9DdGVj?=
 =?utf-8?B?cllyN2FwNW83RzI2VmxpekJvWjZ4WWRLellFK0wxTkdQb0xVbGJmSFhoaTJH?=
 =?utf-8?B?RTAxUEQvNjdEVEFrQ1REVkxYek0vYnVHK1lnZVkvZGg4V0IyYThZNFh0SXNq?=
 =?utf-8?B?U1dOS3hYY09sZE5GaVREbTRBajNRbXNnbGJ3VnFJYTBHazJaTElDNnladlNW?=
 =?utf-8?B?Y1d1NmgzNEVPTEJWTG9nTHR0QVpZZUtoVTduRWZNMFhoanN5STZYcDRpWTRK?=
 =?utf-8?B?cUFFN0NiL25YM3MzRllSVTVZMis3eTQ3Q0RxSGdzQmNmenpmaDJaQ3VMckxw?=
 =?utf-8?B?eWdpNHowR1U2VmxtMm1OcnJIMUV6dWJuVzh0a0lLNmd5MHVvWFh5NVpzTHo2?=
 =?utf-8?B?RWtoQm9VdXJvNFpFWk9wM0FHbFF6S0IrdzVmc2poVytLZStHc283bU4yeXZB?=
 =?utf-8?B?R2Vvd2ErNlhHNThCaVEvQk0zNGxHbkMwZGtwelRHUEx1K0swSzZPZUErajdp?=
 =?utf-8?B?YmhGWDJFN0JHMUVKeGlPMzRkcGZ3MHpXOGNUVWJ0aWw4ZVliVXhCUkVYOEZy?=
 =?utf-8?B?c2Fac3M2Q25rYTVwUEpPbko1czZxeGY5NVpRN3BzM29BYUZ4c20ybnAybVZG?=
 =?utf-8?B?K3pqMlBRSmpuVC9EMVZuSGtVMDlZN2lHMy9UZUhNaWZZS1FtRjA0M2VLL2kx?=
 =?utf-8?B?TFNST3ZzOXorS0lQQ0twNStFU0wvb3dpdTk5QlNHU1ZYeUR1UnBBL2txZFE0?=
 =?utf-8?B?MjVqUEc3VW1VQ0g5RkhsNCtqVUhQTDRWd3FhZ2VENWlaYjFWRk9lOTdpajB1?=
 =?utf-8?B?RW8ycDYyWlAydmo3SlB0SW4zTHJYeGdQRUt3TDlZSkd5TUd0VnJZY1p2L2ZY?=
 =?utf-8?B?THhwaFZXWUFuZGxKcGhER1dLSHl1YUlZemdieHVyUUZyaENLY20veHFEOEYw?=
 =?utf-8?B?SU9WcGFlMFdQbmdqUGt5ZmxlOGhUQWtPcThaVVBxd1NFQy9sam5RZEhaT0pO?=
 =?utf-8?B?ajZGNmN5OVNwSzU3blVCdkFzTkdqY2l4dEJDSTVMcFBSVjZRVm1TOXNJdC9M?=
 =?utf-8?B?RzRjUE1CM21HTm12Z3p5YWVySWlPK24wQlNiNGpOaWJ0UmR0Rll0ZHZuejNT?=
 =?utf-8?B?MEExNGoydGkwNXdRUytaS1JkRTdLSWo3ZlQzR2tjSnVqRkdOTGRPWEMyL1hB?=
 =?utf-8?Q?nMnA4qK3PpcDQV55vTGtlOxPB85JfrzSbso7P?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b3a2dc-1b4b-4de4-62c7-08df1ebc12fc
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 06:28:43.4505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PzL+/phKDfIUMYcBy1BfuTNddeL3oVzwelcGUu7wZL1Ninua7Dfc0hZvQVReTHwB3f/rqktmSwlWpHYsMkj+gZ02UNL+oNNWUNpqYpVP6DgtboCm7yYqCfyY9Cs3AeAR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9081

I used iommu-map for eDMA, but iommu experts rejected it:
"Using iommu-map to describe synthetic dma_chan_dev devices that the
kernel creates is the same kind of DT abuse from over here:"
More info: https://lore.kernel.org/all/20260917144804.GI3196566@ziepe.ca/

So I followed here [2] as Krzysztof wrote for QCOM VPU:
"Thanks Jason for context and detailed arguments. Robin did not chime in
yet, but from what I understood the DT-child-node approach will be the
way we should go here.

I accept above point of view and I am fine with this, thus Vishnu and
Vikash - please go ahead with DT-child-node solution we had some time ago."
[2] https://lore.kernel.org/linux-iommu/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The fsl,edma controller on i.MX95 has per-channel SMMU stream IDs,
where paired TX/RX channels share the same stream ID. The previous
approach used iommu-map at the controller node, but this is
architecturally wrong for platform devices - platform_dma_configure()
passes id=NULL to of_dma_configure_id(), so the iommu-map property is
never consulted by the kernel.

This series adds per-channel child nodes to the eDMA binding and
driver. Each child node (dma-channel@<addr>) describes a real
per-channel MMIO region and can carry its own interrupts, iommus, and
power-domains properties. This approach:

 - Uses the standard iommus property for per-channel stream ID
   assignment, which works through the existing of_dma_configure() ->
   of_iommu_configure() -> iommu_probe_device() path.

 - Provides real MMIO addresses in child reg properties, enabling
   Xen dom0less device passthrough where the hypervisor needs physical
   address information for channel-level granularity.

 - Maintains full backward compatibility - existing DTS without child
   nodes works unchanged.

The driver configures per-channel IOMMU following the same pattern as
tegra186-gpc-dma: set bus type on the dma_chan_dev, coerce the DMA
mask, call of_dma_configure() with the child node, and set
chan_dma_dev=true so dmaengine_get_dma_device() returns the per-channel
device for DMA API calls.

Tested on i.MX95 EVK with SMMUv3 enabled for edma2 channels 2-19
(stream IDs 0x30-0x38, paired). Channels without iommus (used by SPI,
I2C, etc.) continue to work in bypass mode.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in V2:
- Switch to add child node for dma channel.
- Link to V1: https://lore.kernel.org/dmaengine/20260916-edma-iommu-v1-0-e1731968081e@nxp.com/

---
Peng Fan (3):
      dt-bindings: dma: fsl,edma: add per-channel child node support
      dmaengine: fsl-edma: support per-channel DT child nodes
      arm64: dts: imx95: convert eDMA to per-channel child nodes

 .../devicetree/bindings/dma/fsl,edma.yaml          |  70 +-
 arch/arm64/boot/dts/freescale/imx95.dtsi           | 774 +++++++++++++++++----
 drivers/dma/fsl-edma-common.c                      |  10 +-
 drivers/dma/fsl-edma-main.c                        | 149 +++-
 4 files changed, 864 insertions(+), 139 deletions(-)
---
base-commit: 38cc189d30504989ed32704c9b87992de304d0fc
change-id: 20260926-edma-iommu-f5d0d97295d2

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

