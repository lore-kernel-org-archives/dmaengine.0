Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010001.outbound.protection.outlook.com [52.101.84.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB4D4B826E;
	Wed, 16 Sep 2026 16:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577197; cv=fail; b=Q19MhEP7daWjpL23h4tbxW8PkQ9dD8WjjlDLDWOfgzUlpQ3pEyBkD9sLE8/HPgsx3LY7GmlFUBXtwJtQM2+8m469T7I3a9Glw7pBaIDy3m6SqWvjs0NLlDLa4Ad7SdZZAZWWgFeAFf0Orr4XfA7cbrGC0L2GyfZQTvQnrBNCVhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577197; c=relaxed/simple;
	bh=9oVDwQeyyEYBqxfF91rS1DPshtshLlC5HycrlpiNGT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rOSn30AvvtdPVlf18Xq+Af6NiCixcpNkCkBZ3pErsFSW0cheYrwC1/7KdcoGujde0+RkB62q9/hsoaNgCnJ8vxW5dOGv1RODSBmIhiFnJwT5hsFJnxTjmRkQZ4x4/y0wr64bOXOxkHLlZlQa6zMw10YdTdH/Dh7E6+1zXl37X7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mzvjRXRs; arc=fail smtp.client-ip=52.101.84.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mzvjRXRs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/+JiU8eIgAou5ROpObkZGH45PPJpTjCbuCsmfdsIqASYgrupacr+Y3a9+uYaFNAFusEa30YElCqssZoaHYGvRFrc1uwS2dqhyXLOl8bZVtSddyih8QdcnuyuX8PLiUSOyBs1qSGOnm/x10jAM3Qu7f3ZGiU0mdTubh2/rvVuL8Ne9NECBE2u/uk4asdfHQOi69uTp1kDstw+EM0h1hJW57fp0yWE1Hk1gNimsPQoQ2Iu4AB4dOojAZXzflDQDFzdV5NNWL1d1uyC4Og3NKU3c5S3rWILFvMO8s3ayEUqwn2gQTpC/dDNnBx+uFf5l5cfsxKoplBRETgjKjTjbX4og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UwmAhRLqbLnobohqK1Ph+p2J6buYETnBn5qbP/1yeY=;
 b=MOI/8X0DaHEVy87pAc3oXv9+47XBIkji3zYXffPv4gA77SS9egsNOwlOMZoEWwyYTH45nna3aNPBnEVjSNLddxk2aHnMAwyIrtjkozf5DzZhyxpNXSSEsjeHLEEMKf9ykAsZQpplduXPpWuEb5nf+cn8j73oJAWPRt3bMESWaYnEG/qvOsUsZXyLnp8WGWw3UzfrF1bYGRPN0fgI4w85+OTQ/x7mkIoEe6UB6IdSwVl8zmEV1iGe12jq3M4PH7PjPFgCmBjwp1NKdoqKePDuEoPH7gRVgQ+PtW6UPcQf6NfUddj/cTEUvCoaf9b5ysd4KAWDgWWy7G1O5ybdHu2LIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UwmAhRLqbLnobohqK1Ph+p2J6buYETnBn5qbP/1yeY=;
 b=mzvjRXRs33xVkJ2VRQaJRlHZDTw0eMBreu9xqsL69FSw296rw9flGxMRaGhEdrT794kYccpHfQ5x0uTGLHQ8tCKndYwCROnF8Gn9fVeOoD/nSvD+GallKoZ3pVOurDBTuPkXXT6Qn0i0WoTLVz5oOMdjQOnTGVH2KHYyqnklPIlLLyfTmVOt8lnNLN13IoZ7cS1A5XHSjX4qcKYSElbFtLudZX6V8nfSdwjZne9aYFuiVLr1G5YsmrHO5nlLapQ7dXea7JeQ88D/lVhtLmvW2dnKducK6UyjrrlCLQefYktBlZpFwn/kKWYHL7JWqWvQzvCtv8UKFC6efchmuqFt5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10879.eurprd04.prod.outlook.com (2603:10a6:800:25c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 16:46:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 16:46:16 +0000
Date: Wed, 16 Sep 2026 11:46:05 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	imx@lists.linux.dev, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: dma: fsl,edma: add iommu-map property
Message-ID: <aqrHzWp7joSs593p@SMW015318>
References: <20260916-edma-iommu-v1-0-e1731968081e@nxp.com>
 <20260916-edma-iommu-v1-1-e1731968081e@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-edma-iommu-v1-1-e1731968081e@nxp.com>
X-ClientProxiedBy: CY8PR19CA0012.namprd19.prod.outlook.com
 (2603:10b6:930:44::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10879:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d042421-1fc1-4da5-c98a-08df1412064f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|23010399003|366016|1800799024|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nbcHZGEvnepuhQ+wpslwlNcwjiHQSLsksku6vcRKGgkeOKsDSVo2j2inE1hyfRdXr78vkGSo6rCAiSLBfjU7n/B3L6IhTeZx8mpm4GmX+gxJRZQaiVVwLdKVN5BVts+u8mzXny0cKZBVw4+61bfm2AbruGc1MEPKWkKkVftjsUrQijQGYBoRTLkF48S8fq+nlZ9uWQlMutCiD2kI5Ea4ZtGiHUaxTlxGRFQfhcwp6U0K51ykrKcy8t56m2jPkThQDyfW1MZ7elN1EKGwzDjSnrP1iyPZBuevQviGxoWjISuxKQ7slPksXa5Qj7YdlD3m7/tr2JmAWTZXiFsEGaF0Roj3svEHi4vyY3ao1h0dxv25oPO8hWKcrZjHeZmww9vJpYDbiYPAfG1eLGNaezozqYc76wi0/i+87So3awi8wzqQdwbXMAfb6zTilsRyr0OqZtpdQkCzB9uU3UXuPA+FCTX55W1Qp10g5MncCudvdZMApBoGGG4g5kwqAVDfOrIiJ25A6qv/Nzx6E67xswZ0qCd8dBM5B7YrliHYrVH+o4cDUzbt4RUyIf5312bzP5O7Y4apHLNqWCpDE23PtZSKdUiOwNGAcBj7h57ERnvI8KIYSGQ+ntuahVOgc1C2wuxkAH4NH9jxPgoXOiTh5QQaCeC9cQ+bHVYU0q4PXyeCB60=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(23010399003)(366016)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sXO35uGTqSkb6FX9en250Sc+gFzE7YJk6CpJpdpoo5MlG0AZK1rIUogmx3DN?=
 =?us-ascii?Q?F8nU7cBsBxVV+SrgyrLk1XMtx/aSHdHWBWhyGFi22g2TEdzkieq+ZzWBek0u?=
 =?us-ascii?Q?0kbkCRtLH6WKbNsvbLZRVVbK2Kyc96rar+XK5ST0L2oo4ZRVNHyy4Hn9W4NC?=
 =?us-ascii?Q?IQ8znEHsWQXvzvY4Hr3hSUBayYR74CKG0QjexRxnX9dgepKhWI3wiK/+TJLy?=
 =?us-ascii?Q?POcU0xyW+oN+JLm1qXXCyQIG/2Q5ix/EK4+B1RZqfbySO2ATOWUnfEJhw21g?=
 =?us-ascii?Q?9FqyDofj/mQVolZtnH3TdDXh3aDrtNDbyhXyEonGKuZLJJOUA+jFGizMfqFr?=
 =?us-ascii?Q?U+B+PpHPj/Hwe7wsFpxVJnAOd/pKDyUi4P4oHBlgOmA6fPXHEdkh4/F6ros6?=
 =?us-ascii?Q?zD/VoMQZFP74wewxmizP1aQn3YH+fSvtnM8thWdsFvaPum+4jE7r4L0hKeHq?=
 =?us-ascii?Q?8CdFezrskvAM4I564d26fPsdLJm+owxfa+H/MgLi3lRNj6qfx1XbeAUnuE36?=
 =?us-ascii?Q?wQw1jr8eE7rT/F+dRODO77OgTGb4hSSEq9h7AzFqXZtZOtW77MfsJgiP1p3G?=
 =?us-ascii?Q?U5Cq0GozVghm4C9m8I4T6I5ulrf1rUk6nOOkomIUGG6/gdbFzIcBrlXheHCE?=
 =?us-ascii?Q?SiY9AjZY0byedpLhKOktdW3wCr46XE9DHBZsJlStgnmWb16FkAa/qOLieXis?=
 =?us-ascii?Q?Hmi71A9pvU/+KdIitfYp2RGDL/DO7HRSGvVs76Lh9T+nuAGGsT6d7xDteLlw?=
 =?us-ascii?Q?QcxukffH8mXYsoZs2fqRw+dqdnuc/CeBTqeuKw49mdFgkkrHle9WuWLogrt/?=
 =?us-ascii?Q?47WVTcNPpTJ1heGT2qDiFB6sq4p/XrZj4oDTXywNZ5vsdvvGfd3s3TwyQvan?=
 =?us-ascii?Q?578YGu+43FRJLMCE9PfIpjVg+YwWtHJHLPCHK4DLj4U/I/DzpXjtd+N1/C9W?=
 =?us-ascii?Q?nion5Hc3xdOqwBZOE8QdNmnOXmofMADTeJsNRchqAJzQq4ltFRJKLFEt5Ny0?=
 =?us-ascii?Q?gPg9qp78W3uNcBtqS85F6dCdChGAzGO4G63zI3lkaZeFU35GLBw97f7g44bq?=
 =?us-ascii?Q?5VRwI0k0JkuYRqzqjHVyevJVKXsOf5QC7AtJw2dIMyRIExB7TZj/2vM75p9I?=
 =?us-ascii?Q?ex3O/hSth6hMUoer0mQLU1DBgufwgU0hh61oX0fA72FlGz0tPqOblfsC+RIe?=
 =?us-ascii?Q?D6QJT0XHxwrK1sU4Z/ksJ0UMp934JQ9Gl1bRGSGeDG1WdxiMlnTqYlXJ0Tjv?=
 =?us-ascii?Q?wSZttTCe/Z3O6XUsMcCIpeBjA26faEc4orXUsX6WTCAVDwxrqvQKCLSUYFDd?=
 =?us-ascii?Q?a6LkwvW7NGoAjmIMx5hYGWp0cn65fUEfZhN0B+g8y2gIF7TYR1nfL6ONcWQv?=
 =?us-ascii?Q?QvlNoy4rrVMLimhxr3l+rOK3jR1BVRDsbyiLNrfujbISuMEF54IBONadJnIy?=
 =?us-ascii?Q?HHH5Js5/e3FW0AN63UOEjP9G70YCYiy4a85WVlVd0lUcxCcBH+9FjxNJWoIM?=
 =?us-ascii?Q?FSGkLXjRZhdSfSwrNJ+BvBvW6Hk0y3jz0C1EqKs4TPj8+wRcGN/zX2r4b3Eo?=
 =?us-ascii?Q?gz77ojO48bvvWRln1TZbvYLleRW7eSvFhGxCf5zV/2PyC8oYGaXhlp11bH5N?=
 =?us-ascii?Q?HdYw4cNotVK4Vv6fujxO7bLYfTvKUnbJcrjvncq0hBL+qdkHuGlJbrrcZ4it?=
 =?us-ascii?Q?0jC3lqPITeiOAALJW4/ETWWLhchguiQolIqtlFFeJqkk4nwDte90Jj8wNtkU?=
 =?us-ascii?Q?DBzNyA462tyFGlk2KpDpW/TT34tveZJOWg/CnW7xGSKTOSpelMAv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d042421-1fc1-4da5-c98a-08df1412064f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 16:46:16.1039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lPna5DyLrkMJXn1ymCjo1HRvNk8OVAhcE6x+uFtD2IJ76tN8LP052Axv4iVmJ1j35ce6sg6rWgyK5eWsLgDadl6zg8m5d0XorxtbC6x3WAP+tTuYjWEreBRLDPHJ9ubg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10879

On Wed, Sep 16, 2026 at 11:55:25PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Add the iommu-map property to the fsl,edma binding to allow per-channel
> IOMMU stream ID mapping. This enables IOMMU translation for individual
> eDMA channels, where paired channels can share the same stream ID and
> channels without an entry operate in bypass mode.
>
> Also add a new example using fsl,imx95-edma5 that demonstrates the
> iommu-map usage with per-channel mappings.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../devicetree/bindings/dma/fsl,edma.yaml          | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> index f609038e35ae1..cb8c650a5bb90 100644
> --- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> +++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> @@ -104,6 +104,15 @@ properties:
>        Bit semantics: 0 means channel available, 1 means channel unavailable
>      default: 0
>
> +  iommu-map:
> +    description:
> +      Maps DMA channel numbers to IOMMU stream IDs. Each entry maps one
> +      or more channels to a contiguous range of stream IDs. Paired channels
> +      may share the same stream ID. Channels without an entry operate in
> +      bypass mode.
> +    minItems: 1
> +    maxItems: 64
> +
>  required:
>    - "#dma-cells"
>    - compatible
> @@ -351,3 +360,83 @@ examples:
>                        <&pd IMX_SC_R_DMA_3_CH6>,
>                        <&pd IMX_SC_R_DMA_3_CH7>;
>      };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    dma-controller@42000000 {
> +      compatible = "fsl,imx95-edma5";
> +      reg = <0x42000000 0x210000>;
> +      #dma-cells = <3>;
> +      dma-channels = <64>;
> +      interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&clk 0>;
> +      clock-names = "dma";
> +      /*
> +       * Per-channel IOMMU mapping. Each channel
> +       * occupies one entry; paired channels share
> +       * the same SID. Channels without an entry
> +       * operate in bypass mode.
> +       */
> +      iommu-map = <2 &smmu 0x30 1>,
> +                  <3 &smmu 0x30 1>,
> +                  <4 &smmu 0x31 1>,
> +                  <5 &smmu 0x31 1>,
> +                  <6 &smmu 0x32 1>,
> +                  <7 &smmu 0x32 1>,
> +                  <8 &smmu 0x33 1>,
> +                  <9 &smmu 0x33 1>,
> +                  <10 &smmu 0x34 1>,
> +                  <11 &smmu 0x34 1>,
> +                  <12 &smmu 0x35 1>,
> +                  <13 &smmu 0x35 1>,
> +                  <14 &smmu 0x36 1>,
> +                  <15 &smmu 0x36 1>,
> +                  <16 &smmu 0x37 1>,
> +                  <17 &smmu 0x37 1>,
> +                  <18 &smmu 0x38 1>,
> +                  <19 &smmu 0x38 1>;
> +    };
>
> --
> 2.34.1
>
