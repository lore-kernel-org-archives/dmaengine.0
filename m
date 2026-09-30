Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010025.outbound.protection.outlook.com [52.101.69.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F063C3C16;
	Wed, 30 Sep 2026 06:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749735; cv=fail; b=czT/Do1CJr/LIHaS156x7rJxIxKTROLQbZ0qqPAgIXsp6Y0Bx301FGLqgILInU6nBAQE/cpHVlFXm03SsK3gHtegjjlDTk99zmCj2oycnd5uiGDUitCVXqqBYyGVme2U7aRY6YDgSK+U+mlkHkh8/Gaph+Mg9zJvGszGl9kc/eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749735; c=relaxed/simple;
	bh=FHfav5ycvOA/dqijbv3jj4Gtffg0hKZToNWGAL17AG0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=L5Kkw7JkScW+tg32V0oNk1MI74Go5Wm1FiTIivQzePQ8uI6pb5h7l2VlYPp4nUC2mOvhb5U6Mf4JQHsdwXR20IgeKV6TJGhLZSeBYz3frBWgA/BE5gYIGD6Owuv+iZQiXHq3vWfWcE28BH9Te+ptkMIh1LlvZQxOB1dFfh29x40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=igULt/YW; arc=fail smtp.client-ip=52.101.69.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="igULt/YW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzO8SOnawaVEb041KFA60qFv59pBKHz+h+PoMv8qxMpClgSL7xtWGL2ydU63n4pXLgVI+KUPW9+9Irl0fc/Cr5vfHSzMfraZelPG/GGRoK2NihuraoEcPfBizT8BmN1pN9uc2rpeBquE9F/qMhqwj+hsDftBF1DQhOdE3qg241PxlIO3tZ4g3gHGZlCj5TGL04dGpoCDaB6iJzP1wZkeIW8HO2YssgjdjJSzhWd6NSUYaPnoqibks0dP3ZH7YEyWVtG7P9fgwOtRvMLGhkfhw1QcO+T09BxVsbL9oSt3NmKh3OsOWAJdhUmKGT0ZUGJmsqk1T7NbnU7UE7D3vzRHfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaHovml+f4IOc7ueA2bCzwWTEK1IP+octLk70ch+HYU=;
 b=sBt+TpFXSFCdmGQDYwocEYN19a4+S5mrCLVs4RvrTwoAm6KR7qA4I62Mvig3ZqrGQyo71szs5RG/j0vWZiDiXKlVhfikcSvchvGhsGmeRtuSf8BiEde+MyF4m8S3yFj5nxCF995b+rjjKkpOgApnczPbtmmbnMw/bJQYHxeGrV9+WdnfAzUOCPHMkJM263ZcsRF9i7VxoHdmWLjIi1p/Z9UqTbPCkvrexThT4+86GGvWFWiFDVdbW+Bzbw5aHNf8pYnBWkcXEm7N8b9ibgIZ1MwFl526VFV1rfIlv6HOwH0a4YLOeI38HV/GKfQAh4gqdOBmXkRjKRlD5NBSD/+D0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JaHovml+f4IOc7ueA2bCzwWTEK1IP+octLk70ch+HYU=;
 b=igULt/YWhp0zENXKxqItZu3OzkEPmBzDMMxaelSUL9/9jXopQqnB8cz3cENygPrqFprrCGQpA1exgnBni1dyzsOlhf6g8qCiJAwIM99APmZOQXk8/nGL3DKh4+ym0zpwDq8EX5piP3OSBbY6XkBBekW8IgcANG9CTa4yoD00T8CXFp0fjQRSVJKSWPOidmgAMMljVGuVFmIWG+HT4yxTrOb6Cs73/9EN/v/SRT/8h4iMZ5QrMjw2n9OuqfL+DoJIt8zqKX3U5l5nvtuISiC8aZsVtsnermVQDPkNwSAQ0czddtBX4hxe372FoTulCd0+ymm2yzwgBe392XZ+FoedQg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 06:28:50 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 06:28:50 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 30 Sep 2026 14:26:09 +0800
Subject: [PATCH v2 1/3] dt-bindings: dma: fsl,edma: add per-channel child
 node support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-edma-iommu-v2-1-72a62bf44c74@nxp.com>
References: <20260930-edma-iommu-v2-0-72a62bf44c74@nxp.com>
In-Reply-To: <20260930-edma-iommu-v2-0-72a62bf44c74@nxp.com>
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
X-ClientProxiedBy: SG2PR01CA0197.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU2PR04MB9081:EE_
X-MS-Office365-Filtering-Correlation-Id: 12cf7ce0-ce29-4b2e-4584-08df1ebc1722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|376014|1800799024|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	i82LPlWKHfGB3HqNkts9dI1HrDuUJCPn3u0mHTs5XwWr4/zuxgSxPxtBkb7rpn9YBDEi3PkMNUoQ+SUQ7UxDWyeRI+7m6XvsviWsku4p7mhuenVpnK9/tBq0GzOcKVyQMxRsQTnsLSsWaSTF3FJlvoZpFendxwhg6VCH2vrgYtVMPqRHVgYAE6udKQl5Caiyfm7qiOpXmni4wy96brj5wTa5UIm9aHnzOl+E0LK4yqcAFDj3k+iorC+afKi6KuQDpGJu3IJ3RwdFoeCDF3h5oHW2gSCSJ+VWuxZkv/61Q+F9dwem7hbm1GY9X7ox9J77Jmz6raAJbJISmqy0C5lwzwP4SCl2hk7XCBmGLCDp9ZvoegZwS+n3OmxF4vLyxhesaZGH6H1st7UANIysDX3wfbmcKHtPjNOI/QsDR1UX8As4zBF2guFwQCbYYrccNZm0y6q6iU7DPYVFJThaNcdXekzMckRiHxrrk00bh9jn9gHOm4tShrTBl4nW8s5HPvo4PObdCyEISIESIJwR6StCwAzMdjJxy5PejU2Qx+TgfQ3kP/uQJxXLU1IWVetiIozWA8szbrEpE6XkSsgcsFnip9DJtFFAPA6Arcmj616IRZcl6i5dR0M51HznaHAZ9Y4AuIqO+nkfWr4mXPlz5gQT6Duyk/S9xueBdJalzLD7hDE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTFvQjFwOWdvaXVFK2RPRmdwR3dRenlucWc0Yi9JbjlCK1grbmpzUHA1N1R3?=
 =?utf-8?B?bXNnaU5ObndYeTVIYys0V2EvT05uOTB3bFBEaElxRWNMNUZXUUJ2YXRValVM?=
 =?utf-8?B?TFFsNUw5bmhjTFVZZG5LYnlqZHVEdU9SczZNRFRXa3ZJT2RZT3FYd2d6T0NT?=
 =?utf-8?B?a2pMTytQKzlMWTFvang2MldZUCtpaTV2TmUwN2IwSnJ1ZGZMOEcvWWd3VDVz?=
 =?utf-8?B?cW5IQVFycU5lVlNSSE5HMElGeWlYei9hdlpPUkVydGNnQnQ0RGpiRVBIQkNa?=
 =?utf-8?B?NC9WRkRiYktsekNGR3cxSTE4SzVjc0Q1RU04UWZFanNHZ25pNnk0K3BvOWlQ?=
 =?utf-8?B?dll3K2Evdzk4QjNXYmJGVW5hRmo0cDVsVG52Zys5MlVGKzg1RDVuc3lLeGFo?=
 =?utf-8?B?aGRIcXRORHUxK09TQlVpU3RYYXJoZ0lVWlE3TEtxNlVQN1JRUUc2S3BSb1hw?=
 =?utf-8?B?cW1LOFpjNnlsTUVxektZd3d2UTUwNm9XNlI3WHJIUnd3UzhPd1F4SzFhcUo0?=
 =?utf-8?B?K01qRkFneXdmNXkvYXpkeVZHaDVXdXpNVVR2OW5GeS90S0lPTzVUbXk3eU5M?=
 =?utf-8?B?MnhFWHE0OUdaN21JdDhOZzlhOFpoMDBsQ0wzQVl5SElJbXZ6MTJyYnJQK1kw?=
 =?utf-8?B?MmkrM2kwZW9TNTJreUttakNwWEd0K2V4eXVUUjhILzRVYVVKZlRYY2d4UkNW?=
 =?utf-8?B?eGN0WXYwTzNqOFRIekljMHRycnZOb2JQeFZpaVlZYmYwK2xrSkIwcGFqeTlV?=
 =?utf-8?B?bnBaMDJkYjNodS9lbzJKVzRiTTNJV0J6VVhQY0l3ekdWRXpNL0VEMW9UeXJS?=
 =?utf-8?B?dXV3V0xUVFUwc0JrQmJYZXNBQXMwM1l6R1llS2xWU1N1dmVEbUlvM0dWOFY1?=
 =?utf-8?B?V0w0K25CbXI4WnE4SEs2a2J6Uys0OTVlcU9TL0xBUERiT0NnM2xIZVFmRjNW?=
 =?utf-8?B?aFJNa3Q3L01tVEp0RWdyK1NJVUhVbXZOU2w5MS9CV2VpMEI5Q3h0MFpBeGZP?=
 =?utf-8?B?WEk3ZkV4Z0l6QVA4eHZlbW0rNFA3SVVxSnRYNjFzdDdvRWdYZUc0b1oySVdq?=
 =?utf-8?B?M0p3djZKK04zZmg4S0xlV2p5TFF6UVdUR2dMNFFHRnJYdFRLRmJQaUh1ZnMx?=
 =?utf-8?B?QTRZNzlSdldsWXRSTzVYbGZjL0VSQ2hTTjZCY1E4eEZ0MDRvaW1zQ3pNMnJI?=
 =?utf-8?B?bVFGeDVYZ04vMGR1cFVnV3NVM1dVNjBpbitUUXZrby80MVdXT05yc285ek9v?=
 =?utf-8?B?RGpPTHhEOG5LNklucHM4NEpNUWRBcmJqOUpEb3pwZzlXaVZrVTJ2RXZOUHNp?=
 =?utf-8?B?K29qajdMdXNmd05JRCtjNGdMSzExVURHSkprWmdBN0NiOVJFTjNKRXBoWmtj?=
 =?utf-8?B?ZWVLTkNnSVdya2VhVFhtZk1hYk15Ly9pMnhPMmNmRjhpeEVSYVhxZ2hNR1Uv?=
 =?utf-8?B?QXpnNkNnU3QvMlRaQjYzQ1UxRmlIMllFVzZwZllRQXlJRTkxV0VDb0R5VHZv?=
 =?utf-8?B?YTlqRmhIRkpGWXlyUWQrbjdJNFY3a0lCRHlKaTF4eW9rak1pbjh1dlFEa29o?=
 =?utf-8?B?RWRRUCtUNG1DOHAwSVhRM2dUenhqMzVUY0QwSWJLdWxxaUtMVmd3TURMc1dl?=
 =?utf-8?B?S3Y3T2tjb3d4Q0NIWCt5bldoMmNhckovRzdSV3FFSjdMbHhWa2ZqNG9hWTBy?=
 =?utf-8?B?NktkN3ZhaXd3Uk9pWXYwWS9rR3hxRlh4ZHdkNFN0SFpZT2xndGtsVEpFTmZZ?=
 =?utf-8?B?WlZoM1BtVGVnL1dwQURHOCtyWHp3djJHb0J4eW5MNkhQUmVETU1JTXR6Yzkr?=
 =?utf-8?B?dXpNUkRrbE5IclM3RmxaSzI1TVpBMVJmOC8rcFl5KzJhTzJkWkRPOERlbjhr?=
 =?utf-8?B?aUZlQzltWWt4SHArMlN2SHN1L1RTVk01U25qamRYU0FXbUdvbGlPd1NYb1ZX?=
 =?utf-8?B?aEtlMEhvcUt0eWQzNHhyYUVmVlRMZ0t6Wjc4S3U4OUJzYk9CR2IrUFpuSjdk?=
 =?utf-8?B?bWRsY2ppUmtGRFEzZy9LNlUyUWg4a0hKelZ2N2t3U3ZGQlRRZlR0VnRqOEMx?=
 =?utf-8?B?MTBKQUZqbWZRTDM0RDFnT2paZGJNWGhZdnhYbXdETHpaaXNvRENIYXFmNGg3?=
 =?utf-8?B?Y0hzTHJVRzBZVU9nYldadVppR1BpLzUyRXdzdWRkQkkzR1lSWGZxZmRvOERW?=
 =?utf-8?B?U3lPT3VValdzV3lwV3o1WGZrUVpHVWRzSjBkR0c3Q25KcFFXZmVZd2JQdFNy?=
 =?utf-8?B?UDEzSjVmTjhwSGg5VFhPejZjbk9PTDNEWFJDU2o3SHNNbkJWMVJIYzM3OHV3?=
 =?utf-8?B?MnNYV2lURjdCV0g4NkszNVRYVVRVRWZiSmtMYlZzaG9JYk8xT3FhT2xlMkxX?=
 =?utf-8?Q?/sVvfzJes/1Gw79G+ubwn2Pw1j4x+qkiM+IT+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12cf7ce0-ce29-4b2e-4584-08df1ebc1722
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 06:28:50.2512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKxUtBbl2waI2WRzMeBu2tWWi/IkRSMIcTlx6KRdDKgBQn680AsKIB3bjHAe5PKkNaRlUek0izoSMSBJedaTvLNIVxJ+7lsVCjUYziNmEjAYBy5VaB8sbuQ/Bp2s2nCC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9081

From: Peng Fan <peng.fan@nxp.com>

Add support for optional per-channel child nodes (dma-channel@<addr>)
to the fsl,edma binding. Each child node can carry its own reg,
interrupts, iommus, and power-domains properties, describing a real
per-channel MMIO region.

Enables per-channel IOMMU stream ID assignment via the standard
iommus property on each child.

The interrupts property is removed from the required list since
channels with child nodes carry their own interrupts. Existing DTS
without child nodes remains valid.

Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/dma/fsl,edma.yaml          | 70 +++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
index f609038e35ae..19a103baccaf 100644
--- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
+++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
@@ -104,11 +104,40 @@ properties:
       Bit semantics: 0 means channel available, 1 means channel unavailable
     default: 0
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^dma-channel@[0-9a-f]+$":
+    type: object
+    additionalProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+        description: Per-channel register region within the eDMA block.
+
+      interrupts:
+        maxItems: 1
+
+      iommus:
+        maxItems: 1
+
+      power-domains:
+        maxItems: 1
+
+    required:
+      - reg
+
 required:
   - "#dma-cells"
   - compatible
   - reg
-  - interrupts
   - dma-channels
 
 allOf:
@@ -351,3 +380,42 @@ examples:
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
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+      dma-channels = <64>;
+      clocks = <&clk 0>;
+      clock-names = "dma";
+
+      dma-channel@42020000 {
+        reg = <0x42020000 0x8000>;
+        interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+        iommus = <&smmu 0x30>;
+      };
+
+      dma-channel@42028000 {
+        reg = <0x42028000 0x8000>;
+        interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+        iommus = <&smmu 0x30>;
+      };
+
+      dma-channel@42030000 {
+        reg = <0x42030000 0x8000>;
+        interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+        iommus = <&smmu 0x31>;
+      };
+
+      dma-channel@42038000 {
+        reg = <0x42038000 0x8000>;
+        interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+        iommus = <&smmu 0x31>;
+      };
+    };

-- 
2.51.0

