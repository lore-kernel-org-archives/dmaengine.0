Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011016.outbound.protection.outlook.com [52.101.70.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433594D7940;
	Wed, 16 Sep 2026 15:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573880; cv=fail; b=jiDD+HxCUYBl5jz+wMJ5zNnnEZQrfMw1r1jOmQ1K7evIboXy7n+EtLI3QK28Os1zxyyRo7xLdHMmrYpwxkG4V4i9Go3Dk66ELSdn3ty/NDvOVvMeowRB4dBfALEXfGIMhLciNJlbQGb6myScVeXKPNTYvhLtI12KVHd4CLsUGlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573880; c=relaxed/simple;
	bh=IvFt3R1x0mmobz0tTguIXSuyHo1dKDWrpD1xu1G7b5s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Oa0qYKWscZvROBbSpJgAHkxsZnPQHiBTec19CWltDUDKcQg7DGHiAwMKLmfDElTzy92bo1NOsLswalLOIKS+nB5h1POBi9bErqizlJasd7abMI4+fnd4LKymaqppKXkXz/F3GFZSQplkoAYPdDTVwAy50cAE2FB6yk7OyFgmnkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=c3O53bup; arc=fail smtp.client-ip=52.101.70.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="c3O53bup"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVumq4XhIIM/+cGJ+14ZeIesplBI7sIQBQIx2nOUY//e7y9pyLRESeNTTYYEFQgo/tIz+4glzxC9QWTPPVa2s9FVW1XfI6G3YI18YG2MYbZq7nRCPNAKxme6AjtqLDbkeBrDEGI9Ifm2vvM+RXeCIoVAtfMUHb3nXcbYP6PJmqQFHCSaWzzxBOFnydD7Wpv0DBqbQZwhc2QlhCW8dEFqPx9U9uBqgP57xKjyC13BVaBna0BhGTozQm2dBDJXBtsyFZR1fS+3cHAX6q/ybFMAcvlRgdMM/XFCINYlFWkq8Uwfe0lOyHSd3bjvHEum+BH5XQLR+F7OTfBrgS/Ro7UXYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMEGIseJO2H7S6pE8ijsEi8U+D8X6uUS1cHCt9HQKOY=;
 b=eZnnDpRjOdUWoN44uiYs2xjQjPwdMt+0vZj1btN8w9GKYOPrRJ/WtvroyZqhYcpMZGrmcgLFVhm0sMum5hLVpM+iL5RG3L9pLWbNkFjB3kg32QMBZyd2SGEH8yeWXHNxTL/vQSaNGudm6cQ3fqIne/xi9zdR796uqg663VNJ1aVtzCZ46pJdD+kC8KQq2Xbu3v4oLy/SOTSHfmnnmaCD6CmRnK4ljYuID5b6Hh6xdr6B75EZcOONE0pMKx7HOGdX6ou9bUPK8V1pB55ElcA7K/q2N2KXgLfi6TztZOGGHG0oa51Kem4ZoZXLWIhTKlWSReVh+pPawDPC8OlwQI5bwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMEGIseJO2H7S6pE8ijsEi8U+D8X6uUS1cHCt9HQKOY=;
 b=c3O53bupyUPrfL65ESIQWyJdMvBi8avqg/Ke41tnMhXR3nMTtYOQwBEBVD4/thnhTATuMTvT8vrX/fLnDB8aUAWkwliXUhs/iEAAFYPJELIGBC+faB2MKWzcybjt48CvOTnMGle6tzELIxCHIrz/qLuuMNAlP+ympQMmsicSynFgLFSaat6dFnTp2xvQsZDn4XgoAEFMTBYRuOoE1fnemDw3w17SR9Uni1APOfQpgruP6WlJWcS1U+Z6umxDm3a3ZiPqd/BSq2ysaZer1P2VrQVLN4nmzhgmRmisa7cWNuqdOhWlarbXEJqlT8xC01Mo2NKix4FH0q2j2V14FqcBdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM8PR04MB8017.eurprd04.prod.outlook.com (2603:10a6:20b:249::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 15:51:15 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 15:51:14 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 16 Sep 2026 23:55:25 +0800
Subject: [PATCH 1/2] dt-bindings: dma: fsl,edma: add iommu-map property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-edma-iommu-v1-1-e1731968081e@nxp.com>
References: <20260916-edma-iommu-v1-0-e1731968081e@nxp.com>
In-Reply-To: <20260916-edma-iommu-v1-0-e1731968081e@nxp.com>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM8PR04MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: adb7d83e-8c6c-42a2-e9bf-08df140a56a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|19092799006|1800799024|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZC2bhzLrXcy8I7w7XJyj9WNdTXtXJy3cayNDZXJom4iCJ8Jkq9L1RoRxEMzUk6XWN85onSt9yix+sjw5Km/bqXfhHiCkHH3sM1sev2xDnkL/GiTH9u3Zm62rvP1vKFrXtzrhoV7PMepwJp2woDknpvEEBsdwDfcMJGvZTL9feomFVoNuIhDgDQFzS35FP0PDulEq2HFjojPMLfeRT33/wrnOt3c727Gadc1N1oDEiTnQqwPVGXLtFRaAArL5ubnUiRAXGLHWvBb9XbLKiy/xBNKcO/SVHDcFJMW2TVQrO44KAX4L3Wfwr+1V08806rzPpFf+ZwVIaYlh7qZUKk+25o09iiAo/GMy85v6xIXmzgkbccxKSIp1uOR1p1Gx2ISsFF6Tk+rXRfZZBzhyVOYSJpdaKC0TRyt4KuZicI05ri9ucPXW1GumEEQORtgqTjOllcmJQOlZ9uQkaychaayKI0a8lqo0IKaz33LRWIeQiv6amwrpJgRy66YHtYq2IHYFq9otUV5vQbE5wWG8JFgGD5CiOuHAsC8T/29KfrFwU3Oh65IJ4lF0w4vo8TUm/o9kEA9Ftn4OLaVIr8a7ZGrBwvnr+4SnKTO7haFF9eEvvMVAAHXkIwH5PL9LfWUlqiJMJgi0YvHeQpjvfTJ3EEEthPJKVHVqWpBbmBlZQXyBlNw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(19092799006)(1800799024)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N04vQ3NsOHlDWkc1T0hlM1pHZWhuVWpjbmQxZTZ4N2Z1cG1SRjJhZ3JvMnNS?=
 =?utf-8?B?RkhycjNVKzZjSzZCY1duS2xBNXRzaWRWL2RpM3BuWGRraGU5K2tVVVZSdCtT?=
 =?utf-8?B?bGtwcVByaDg1RzdWOVBkQmR5Mldjd2MrUkRoUXdmUEJHczJZRXdTMVdTckQ2?=
 =?utf-8?B?RzVQWCtUbFg1aTFQRk9DU2VyOE0vaXp1TWdTTEhIMHMyRllmRWhhcWVrNDN5?=
 =?utf-8?B?ZUIxMDh0d1EzWUVWL1JjVEtTOHZjM244TEFGMU1JY0FRcFZhWkJZdjI2Yjg0?=
 =?utf-8?B?MmxhUERyb1crR1lyOXZiYTdkV1dhYnJ2TnV5RGNGYkdUaGR5RU9ncHZvZjRO?=
 =?utf-8?B?TVpaSkt3MEZ0eHl6WTRuWlR4d3U4TE5La25uWGpySG1QeWQxS3hrWmVNSDNI?=
 =?utf-8?B?YUU5bStWWXlneG1pQmJUYnlvcHRUMytqdk1naU4xQzg4OUZhU09lOWlsTC9R?=
 =?utf-8?B?dVN4NEN3RUdZcGFVTzZkcHl6ZHZtd2tQUXhscnRKU2l3UDVkUzJGb3JRWkhC?=
 =?utf-8?B?ZGlUQSt4cVowV2s5ak5HNjI5Mmk0STRLNlBESThma0F5K1ZPR0dQTHlHcG43?=
 =?utf-8?B?MzBVcWI4Vkl5ejh1dytlRWQ4QysvR0JJdndpYWNMeXBCQkoxK2NHNDh1WjUw?=
 =?utf-8?B?R0xqaFk3OHl5U2xibkUvQVVlRGRWaGZmREJqUkttV0hGVlVGa0ZvOVhnbm4x?=
 =?utf-8?B?N05YQnJwdXRib1l0NWtoNnpRYWtGWHBhWlpIRFZ3Z0JNaWM2SUNBbXJWb05j?=
 =?utf-8?B?dmZySHVuSEZRTjFvMktJRUVXSnovTkJTdmRBUDV6cThoRm96WXI1SitySGVT?=
 =?utf-8?B?VmlCZ2NLVGl1a3JQc1RVejZ6eDQ3c2Y3clhlcjJkdHBZOURIWEYwYkxnQ3pO?=
 =?utf-8?B?VlhKbHBiT1ZObVA0ZjhLalJ2Z1gxcjNPUVUwOTRYK1djRlREVlhIVkRCRDBO?=
 =?utf-8?B?UWloQnRMblFjWDYwVFV3Q3ZOUUczOE53YjNIeUxKaHVSbzhvYVJ0eWpiTS82?=
 =?utf-8?B?SWFvMXNEOGNtdXd5YmtWbHBkekU2QWVoU3hoWE54RTRTY3psQzQrcjFnVXF5?=
 =?utf-8?B?U3VkMDhvTWV6eWVpK1E0NUZ0cUU1cktYaG5IQ21SQWE4SGFCVEMybHdqYllw?=
 =?utf-8?B?bGZOMGhJS2JhRldvUWViRytpemx6djI2TG1pV1M2NU9qNG5NS0lhMktUb0p3?=
 =?utf-8?B?Ykk0QVBjdGIxRk5OMzFBaUpuZTQ1RlJmWm1HZnRRNEo4R2VxWmVYazRmN2xj?=
 =?utf-8?B?Tk1NVXJZaGxvbDZ2V0t1S0JGb2lOSE51dmNGM2p1ZUlkaXVNUFBGeUR6Mm9F?=
 =?utf-8?B?R1lyRXZuSHk1VTEyZUllcm0reEFjRm53dVZYUWg2R3haQndsQmRDbUMxbXFD?=
 =?utf-8?B?bWc1eks5OUdjVWdrRUNSZk1yaW4wSlAzNi83Z1lyN1FFU2RlMkoyazBvZGo4?=
 =?utf-8?B?aHQyQXJYV1BVcFJqT0xGSDg1RHNYa0lQUmFyZkZxaHRxeHk5a2REVkZkRDhN?=
 =?utf-8?B?ekV3Z0d2UkgzYW5pR1RkTEppMUhZL1pxbE8zcW4zVWRrZDllajQrT0ZjV1dB?=
 =?utf-8?B?OE91V1R6azRPUXFrT1NxS3diOGZxWWpudTBrbTdEVXBYL3hKekY4MDg2bHFh?=
 =?utf-8?B?RTNBVDAvaW5LSEZFRUZGb1Q0OTkveURaRCtJQ0R1YVdlSUkxNnRJRXhtNzdO?=
 =?utf-8?B?S3dMWU5yRVZlWkFCYlMrZndMWjBRZXdZTHA2R0FtNjN0dXVNaXhaZHZ6QUhq?=
 =?utf-8?B?akRMZUI5ZFFTL283cTZQYWlybnBTQUYwc0Eva3dRUEdjZTRsVitMQzdxTUxk?=
 =?utf-8?B?NkoySnFIdm9hOE54N3l5RDZPbDdacHdrRXhzVytvQlRES3FTcWV0dk5ZMy9w?=
 =?utf-8?B?MDBLWmFqQ01IeFdFa21jNXAydVpxMVQwN2xnYldyMGc3WGZqUUJaYjk0c3VK?=
 =?utf-8?B?RFcxWUcxWVhQWDdDeGdZTXVwaG8zaTFsRXhGaHU3U24xdlJTd3JpaTBYWE1C?=
 =?utf-8?B?WldKYkNWb25UNWsreDVadmthSzJJZTVYeHlBb0VqUE42dFI2RDRMNm5uUVpT?=
 =?utf-8?B?U1hCM0U1M1lnZVZBekJvM29JQUtIM3hyaExORWtUM0NueXRQZWFIYmIzdmdx?=
 =?utf-8?B?MDRONTB2QkU0WTdGYUtGcTFCNTZYeGoxbjNENnFPbitqd1ErTDBnMmVxVjJP?=
 =?utf-8?B?bW0rUXlCOGQ5Z1dXK0wyQUp0MVVYUzNkZFlFeVlFdm5rcnVTUVBkUUhFbGNF?=
 =?utf-8?B?anBRNEN6eWtNZVpCNDY2a0VvWjJvWXNWWThWQkxTNFFDRlV6dVF5QWhNTk41?=
 =?utf-8?B?QlpsNmxwdVJLK1J2NjByWENJbERIT2pob3F5c09iQXVZK1h1N0s3MXZwOEc5?=
 =?utf-8?Q?regS6QvTqwzk3cV6DRrABMbWAePf405iMR353?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adb7d83e-8c6c-42a2-e9bf-08df140a56a6
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 15:51:14.8746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVYgsLrh9O8kefsSj1NuiOPI06TkZpe2BK2f/BRvLS7rTGHKvI0dGXiwP4HifT6Rmf9jPz5EEKRU3JSKeRAY+ynxqjl2LdS2H/taQ0/68lrixZ/s7BYWkKyZE1nONs1S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8017

From: Peng Fan <peng.fan@nxp.com>

Add the iommu-map property to the fsl,edma binding to allow per-channel
IOMMU stream ID mapping. This enables IOMMU translation for individual
eDMA channels, where paired channels can share the same stream ID and
channels without an entry operate in bypass mode.

Also add a new example using fsl,imx95-edma5 that demonstrates the
iommu-map usage with per-channel mappings.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/dma/fsl,edma.yaml          | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
index f609038e35ae1..cb8c650a5bb90 100644
--- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
+++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
@@ -104,6 +104,15 @@ properties:
       Bit semantics: 0 means channel available, 1 means channel unavailable
     default: 0
 
+  iommu-map:
+    description:
+      Maps DMA channel numbers to IOMMU stream IDs. Each entry maps one
+      or more channels to a contiguous range of stream IDs. Paired channels
+      may share the same stream ID. Channels without an entry operate in
+      bypass mode.
+    minItems: 1
+    maxItems: 64
+
 required:
   - "#dma-cells"
   - compatible
@@ -351,3 +360,83 @@ examples:
                       <&pd IMX_SC_R_DMA_3_CH6>,
                       <&pd IMX_SC_R_DMA_3_CH7>;
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    dma-controller@42000000 {
+      compatible = "fsl,imx95-edma5";
+      reg = <0x42000000 0x210000>;
+      #dma-cells = <3>;
+      dma-channels = <64>;
+      interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clk 0>;
+      clock-names = "dma";
+      /*
+       * Per-channel IOMMU mapping. Each channel
+       * occupies one entry; paired channels share
+       * the same SID. Channels without an entry
+       * operate in bypass mode.
+       */
+      iommu-map = <2 &smmu 0x30 1>,
+                  <3 &smmu 0x30 1>,
+                  <4 &smmu 0x31 1>,
+                  <5 &smmu 0x31 1>,
+                  <6 &smmu 0x32 1>,
+                  <7 &smmu 0x32 1>,
+                  <8 &smmu 0x33 1>,
+                  <9 &smmu 0x33 1>,
+                  <10 &smmu 0x34 1>,
+                  <11 &smmu 0x34 1>,
+                  <12 &smmu 0x35 1>,
+                  <13 &smmu 0x35 1>,
+                  <14 &smmu 0x36 1>,
+                  <15 &smmu 0x36 1>,
+                  <16 &smmu 0x37 1>,
+                  <17 &smmu 0x37 1>,
+                  <18 &smmu 0x38 1>,
+                  <19 &smmu 0x38 1>;
+    };

-- 
2.34.1

