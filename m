Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013055.outbound.protection.outlook.com [52.101.83.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787F4502795;
	Wed, 30 Sep 2026 16:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784075; cv=fail; b=iPMcAKZBxh91Qbc2yCBTQ5xIQ3CAPIHflym0FZ+3q8xSpPix0YDROLIUOc1dM+UzhckwN+qTJQ9TmxmuoszYYPyulfzIGu/kdKguDGfGj4Mju8bEfOQtLYMPDQxNiO5CdSfY6oPBnrIpFGkEnDgMOZJ7kjcibiiQsXF2KNF2Owk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784075; c=relaxed/simple;
	bh=YFf5Dp7DaQMitduxL3p6xcOSGXIw4p5AgVc+7o3SVes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f21sw31jTcWYP3sZlk97H/qqtv3Ej1Y7JYiqMdLEFIiowZ36DpZTnfB9j+2mmJ7R+F1kMyruKKQZw8fpPr72vky1VN78W9gTePqefuYsebe4+/xvGqirDao2zXRXhRc+t2LymFXfixdK9TWwLWC3n8TYAea2gy1H7N3TG4sg1Bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gxPuaO9x; arc=fail smtp.client-ip=52.101.83.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gxPuaO9x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wI8THOCSbVc13wggPWE+hTvFTUwcnrGMbuwKIj9M6lQSJzCWgjlnOdsr/3mG1ewmhvmA1QTYRVKusgnp0vLguXXGbweLfMlXmL404lk7DrCBwgw3BB4s5IOF7pBt7ljpTn4IXFfqpsU4MtaDZbMQmVOF+IxPMy12ubJ1K9kttNurYN/adCxyuPVrVGjD94VG614pKYxiDnwu/JpxR7Zg+HaZd/6cYIYEmZNsXAHJM8b9qZH2b7UPN7yKP1jdOcn+w/u/gQBsb6gN82xggTg4qTfqso1xEDUm5YhR7WFzl0RtQ/C6Gi0K4kXdx4WOlE4rRtaaYakgizt86qaxNGZyEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70rgODf39Wi7oXlL0Mj/v+OYU6yPl4YYch7vedm8QSE=;
 b=sc2ZNrpchMFK0jY2kSX44/YiO+7/9paTMCHY77HCtX01EVW9lSs7DyobLuNzm2qnYlgSEj3wbvm+PbM4E+bYn7LWRNI8c7RZbxnrIIdfCgzVuJ2joH1+Udy2vc4tdYwo+HEBwRjjaCp/jAKi+vE7LumFJRV5apwyA9EodWxXewr71cRMru6h2Sj0GQceTMTw+wSqAA3rgefWOmqKqrnguscofYrVnoZTB7md9Ukxkj5OmUWWRNIMlUpAxxiqQgFrRUlA8I3sHI8Nw0vGGdiuEPk9wp5W0Z0+J/+2+lWcqy3egCTh2dqL85aPck+5FOeegXDH95/duspbmmcYsFZ/9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70rgODf39Wi7oXlL0Mj/v+OYU6yPl4YYch7vedm8QSE=;
 b=gxPuaO9xlvrMh1Trd/rQl29a35trqU0e8J9oCo7NT/IqGeg1VFOcknPNjbScG0heIa81mtMYHanvMqrBOF4pxY9oRT199ULMjXePCZ2XgGcsyBMo10hIsvYe5bSN0WoEwFtpLh1oxnrRqCK/gpkfZ6UEBxns7jxzpVd/nELn5uT5xS6ZmC5OhQll7DBBOSTLdswZDD4zS5m4J/aYEj3Og1iIm8334PycpeWiWD0RwI2T4q6e7/SuGFRkfP8zH15EJPuA74EISdMHOvtP5Mma0lasY+9QGcgZdN+Kui5t/HRqc0PMHdMpMjKfZqbTpNl+IHpEJCXlugabNBCHpzVZAQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7459.eurprd04.prod.outlook.com (2603:10a6:20b:1dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 16:01:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 16:01:00 +0000
Date: Wed, 30 Sep 2026 11:00:48 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@kernel.org>,
	Joy Zou <joy.zou@nxp.com>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: dma: fsl,edma: add per-channel child
 node support
Message-ID: <ar0yME7JglvgP8Z4@SMW015318>
References: <20260930-edma-iommu-v2-0-72a62bf44c74@nxp.com>
 <20260930-edma-iommu-v2-1-72a62bf44c74@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-edma-iommu-v2-1-72a62bf44c74@nxp.com>
X-ClientProxiedBy: PH7PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:510:174::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: 013612a5-aab5-4356-b8b0-08df1f0c05a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|7416014|1800799024|366016|376014|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iZMzl4ZP5UnnIusyjpDYnGxqHb4hNktsm2+hapF+IMsKEllMz3n7PLYV3fuAvtYfdyjzQohHN4j54HkJp9I5B6tmEX+aRRHyE+2aqMsPCUcd6nwOOy/mkLHnAOCpEp1Cwu9WM/X909iTFtEIe5rB++HBHB11QrYeKin91YkHfls+SUZJerKmPehDGtkvTP5TrQ2lRonvepkjsxNcbYhcHsRpVT9Z99+/oZ9U6ckv/X96f65muf+1NM6OSH3atE72Fo6yFSIOKd1DNkdK+a+WG3zJuxkvEHvmSQ0k4wgaFiWdGbNNw3jS2lYk+U9PM3+84bis9+qVKu3MTbQ035GDhKxx/hAGe5MU2/6ZwPt4dsvCPp3sys5fDehQIdeAAeQeKkK8bx4zsz6GEKHw1JYeBbe5x+7CfeT4/CvFUxhNiLFW4SSNGW3jaFkPED8QdSI15HbSzQRsFOSOsi6IsIF7xrcFLiYnACPqQtCZI6opyY+YCEyM/bqZ1DiCE9gphZza1VXfbmhxFKMzf3wQUB5n/LdJTZ4GHW5mtgo6OoNHo/hdzcZQAqxPBpetA9DjTAV0auP9dlnlBvVaNqjuM2zAn5NDoe+xaZFTBxrVjbdWvSyGlTJTk1f82fxRnmJa6dMw7HVo2GHeO7raYiMUNMqFy1zAbVqF0QKNWv9vxQixSLg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(7416014)(1800799024)(366016)(376014)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZOoITvTpY7PioZvdqYJxU2p5YcI1Vkdwuy9E3EvYpaq75K1db8C+KFvtBm1B?=
 =?us-ascii?Q?ZP5bLq4y+oYxVRPsaATcHIrKG8mIYWeU5AINs3fEADHj5xYCToHfHQvxAf/r?=
 =?us-ascii?Q?m2KwVBX1cnUFX1qc0FRV5UGr+GXaoJmMigUGhJmB/xQSOEXrmVfzC3G1evP3?=
 =?us-ascii?Q?0qPPwMXXTXLEHm6ZwzpoeCCYziMwAcVy2jepFr7JcDGV3mdrzdbBftYPo7Pc?=
 =?us-ascii?Q?xTZZ47vdtLBsc0eAhtGuQsP2lVr4R0ZDgc8dMt0kV5bDCT95fghjROjpN0mX?=
 =?us-ascii?Q?LZ6BoUaW0znFiXsTa7XR0D6hTlINy/oLuERg5Y7KzrR8pVjb3ez95vvAj1Aq?=
 =?us-ascii?Q?B6FD6Urw98etHwtA7SSEuSf0EzLJN3S01LVLGiP3bGjI201gEQuHWMfaYred?=
 =?us-ascii?Q?jCEAN4VCfbI8kUE2xldWiEMkQ8h7dNXoSra8gaA/Hp13Fdrwh/Kfuc9evnM9?=
 =?us-ascii?Q?pYnW4PcMCA73+mJ/S8NIS9DHCSe7+UvSgbCk/IhKbi9wRsZd2eig9U2fUaul?=
 =?us-ascii?Q?mVEhjhbFtsNjiXffNCB3K99m6stInR1bMkPzvwVaMyLPhDRHavQJK33nT1Ep?=
 =?us-ascii?Q?wGmDPidKm9nqpJlvWrq8f1GM/qL29FgYm7GZVwFeIimd8c5k3P8E5MmGS+Kk?=
 =?us-ascii?Q?drrDbkj8Gg1CMD28v5uQ2OiGn6oVD6+A5vd2QitP1Le3Q9nJhlu82BQiMEcl?=
 =?us-ascii?Q?XvUfpXmk5GMfo6D+6443WM6ZWnYcm2V3i5RrrE2XeXsgRtJDihzfLL4qj8lQ?=
 =?us-ascii?Q?H4IcKmACnQZJ4vdaF8yDpc2d1XdUShNNVfq3awcOEBvjbnwoE9b2rXCZW1ih?=
 =?us-ascii?Q?BZN3ETgpIeFbyUQ9t0V0Zk3j3jnxuZDjz4kcRRDqqFStNhXwffW0zPAdaGAj?=
 =?us-ascii?Q?CL/3kDQdjygdwi1erLp8gZZeyfzpt0raCCuZLEg4uUuK3R63OXMuNeggiAEo?=
 =?us-ascii?Q?UR/U9pM0gNYrE8VsxKcx+h7zEXFKly99CNc7h+U4XHkNRy0QEVdTn5dFGCLs?=
 =?us-ascii?Q?GJ2OlwkP1MrUhsBIeempz9RipE20G811IX6EQJrTsofwW4+cY+z67YhnDB5z?=
 =?us-ascii?Q?dDeeX5I6dUWdnIHV7ryR9vgoUXfeCFjrDZFfrX1pbV82KQ/HaUrx1jfDnl/G?=
 =?us-ascii?Q?5jmhuzFb92YfS8eo0FLpp+OLK63AlbHoTFDS+NM5jkmryOme7mjS6C8aQkgW?=
 =?us-ascii?Q?d9KL9CfbmeLqefJWm+IcVfvt209rkW30Eg88NtXcgCQgGTFFB7+5kCYfYfOJ?=
 =?us-ascii?Q?AGD7Qe84zch6lsunk+NCXAnwSRRiQaOA15owMT4izU2PkxXPNIya8889o6q7?=
 =?us-ascii?Q?R//q4GvLMFEba2YX4y6PnEwp8IG8o/htD+YS5dhBNSqSTvVrA2DwHivf8MSi?=
 =?us-ascii?Q?P+YfF8DNO1dkjRk6fNg4mgkQmH9RECCphcHeH4WtQx6d1a4a8e7JS5RJTWCm?=
 =?us-ascii?Q?b7FMLAMpoTIPnX0M31hSVcnTHtC0HmgN1E1cMEt3ahiMqY0RAdV8xkQ7KiUD?=
 =?us-ascii?Q?jF8E6gxil1j2tpKPbm/QNjyDwkdnuhjC3D7SnvqpWGfOFF4928mSoZ41SXfk?=
 =?us-ascii?Q?BXCEWRo94Y0JMGgw9lwcOVy5xd0fNv0ibO195ZmD0ywVbq+9aAz9VNc4cCE6?=
 =?us-ascii?Q?Xkkg4arw5/gPc4FxOZq4urrpVo8NRU979Xgrm+qSrkoxjViJOL4FLIA9Idax?=
 =?us-ascii?Q?zJdKgJSwE/TcrLjt/Lgw8r3c34nAY5vcF6EYNnyAj8xTxXdouYvnW3FEYXz6?=
 =?us-ascii?Q?oSybP2KlhBPDSbLDrx1M8Es9zyzhugLFAY3CokmhZxQbrRx1vgJH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 013612a5-aab5-4356-b8b0-08df1f0c05a3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:01:00.8079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcmVY+ewjy1YFdwat9jP7wpt3BldI/he6k8LUNO0Lj2zzta4MfaBqcShAZ4fstgB5RUdcINAedieRB8nqSr/vLPwOmCNLx5XAGS4Z4nzU+1bY2WWs9RkH7fovvb7yPeC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7459

On Wed, Sep 30, 2026 at 02:26:09PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Add support for optional per-channel child nodes (dma-channel@<addr>)
> to the fsl,edma binding. Each child node can carry its own reg,
> interrupts, iommus, and power-domains properties, describing a real
> per-channel MMIO region.
>
> Enables per-channel IOMMU stream ID assignment via the standard
> iommus property on each child.
>
> The interrupts property is removed from the required list since
> channels with child nodes carry their own interrupts. Existing DTS
> without child nodes remains valid.
>
> Assisted-by: LLM
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/dma/fsl,edma.yaml          | 70 +++++++++++++++++++++-
>  1 file changed, 69 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> index f609038e35ae..19a103baccaf 100644
> --- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> +++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> @@ -104,11 +104,40 @@ properties:
>        Bit semantics: 0 means channel available, 1 means channel unavailable
>      default: 0
>
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^dma-channel@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description: Per-channel register region within the eDMA block.
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      iommus:
> +        maxItems: 1
> +
> +      power-domains:
> +        maxItems: 1
> +
> +    required:
> +      - reg
> +
>  required:
>    - "#dma-cells"
>    - compatible
>    - reg
> -  - interrupts
>    - dma-channels
>
>  allOf:
> @@ -351,3 +380,42 @@ examples:
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
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +      dma-channels = <64>;
> +      clocks = <&clk 0>;
> +      clock-names = "dma";
> +
> +      dma-channel@42020000 {
> +        reg = <0x42020000 0x8000>;
> +        interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
> +        iommus = <&smmu 0x30>;
> +      };
> +
> +      dma-channel@42028000 {
> +        reg = <0x42028000 0x8000>;
> +        interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
> +        iommus = <&smmu 0x30>;
> +      };
> +
> +      dma-channel@42030000 {
> +        reg = <0x42030000 0x8000>;
> +        interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
> +        iommus = <&smmu 0x31>;
> +      };
> +
> +      dma-channel@42038000 {
> +        reg = <0x42038000 0x8000>;
> +        interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
> +        iommus = <&smmu 0x31>;
> +      };

Nit: kept 2 dma-channel should be enough.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> +    };
>
> --
> 2.51.0
>
