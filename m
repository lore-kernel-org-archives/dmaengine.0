Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010010.outbound.protection.outlook.com [52.101.84.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354FB3A874C;
	Wed, 30 Sep 2026 21:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804681; cv=fail; b=TrchAjPzi48EzoTQx7AuM6Boqh26t/ucSEvoDJFzFM3T2aAJ1JqNmCCVRdD5/UijoAXCKyCqXeZPTPh9FHOSUd7A5SZozNsAapwdgaFGPRKyfRsQJGnLeET43Zs8bAObvqgcTQc/6svB99DltESJQ5EUJ+rizzWiIH1ff8kl+h8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804681; c=relaxed/simple;
	bh=Ez5vsKsHHmrADJ0C8rilpHPlG1fcikmLN/+ADXp8C2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MH5KrWwe6HPZJ8VmL4ql5rwSWbq7fQ8TVpwYsEfJW59/PchnPz2LszuyZRqnJE4AdmPxQ8xi8JXKPRJZ+YM0+xNF+zFTpgZbYiC/p/bKEx7xQrquql5WmnuLexOl5+VkXcMCQWSsOnx/pNfMSxU43svURM5OoKYP0uZArF2Esn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=skxNTzDU; arc=fail smtp.client-ip=52.101.84.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="skxNTzDU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VNk9/QiLhZFUeaK7qKo9Dk3w5kxsPQC153aV8+K3srYMxLP02Rcuruk+sIaIcY6mDhGpfnuL7oOVUt1mwkS3xixqnZ/Pa/QPCd5qcqfmw2k9izrDbZ91DWXBRKfvoKT/k2TmKdzcY2gb4mJGDX4WRfan8G5ShcwVlrMnViYyX71GqTT3ZO0w87tjjCUl/CqpCaGn/O6SkJa7kP3vsn+tDTsoz8UyI/5N59MDoYaZFwDP8pJTu5PWKBOUux/n2iLymZW62Uk7ugtwyQXZosrOqrPXTtNVwHjADqplWvIPjsdJR36x0btO9JGuvuh6tHTzSMoUYkuvWKianimHw9EE2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+penqPnMtvNdUAiPG6sVz5w9eaRxQi4uXODyEGYtxk=;
 b=SxaX+z8CTyE/oFZs6INDfGflBXYzlnNPVV7AVfSFn19qO5n7GvqTtWPUV5IfNG4xqRTOFFUI/w7FvXNIQ4F5GsJjDKBr8w76nGGZqQn7yl9IcV5s4NYbRO4LZVWmyROfg+SZTyeO9opwEz+fRPeqiHrzWWWbE0R1e0+mDwRdg6xE2bJ+47PHXv0mBJWxzld04Sz/3HfW8mfBjmrOsoKt2DHubJaSY81PSMjtve1pcw6ZAQ68ko+Bcj7mie+rM34fLbwUINMFsEwrFboNjEvFftacyjoeJLovVDmd7ymtt1qIYI860tMTbsCguHFfFny5uyTVtS4CfvKDpHsbKd9Mlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+penqPnMtvNdUAiPG6sVz5w9eaRxQi4uXODyEGYtxk=;
 b=skxNTzDUlUcTwuzxrlo3RQ/IdZ9WOM6jE3eYJGkQrpetEKMOVt/wqcU0uLFYnfmLXI8BmUMpBG8+lPbD9NZcrInQvgC+o5rdZjVbGrfia2NNOqdMIFls7qHmgliat9NTh4itvN8vw4vaQ7GqVQb75FO96DEYJJX7lSSoq8SNAbUewtggfBmuQRZOPBUYpxV6+sd2mg1zWwpqnWBxmvfmy7Gp0YbzhamN7AwmGXANgdqk7iaoQdDt+Vc0qp/8BjnO8OkH2fSzE4RDF6mmVCnk15pXaKP6ixQSi401KeWF58A7McTIB/b8bofZfajoBMVKhegVdiyHkhCiqFJEpOLI3A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7708.eurprd04.prod.outlook.com (2603:10a6:10:20d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 21:44:36 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 21:44:36 +0000
Date: Wed, 30 Sep 2026 17:44:27 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: dma: loongson: Add Loongson-2K0300 DMA
 mux support
Message-ID: <ar2CuxAv9mRfiVsA@lizhi-Precision-Tower-5810>
References: <cover.1790068409.git.zhoubinbin@loongson.cn>
 <fdd9fa87058b75fda0dbb805de7989fcd279137c.1790068409.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdd9fa87058b75fda0dbb805de7989fcd279137c.1790068409.git.zhoubinbin@loongson.cn>
X-ClientProxiedBy: PH7P220CA0056.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7708:EE_
X-MS-Office365-Filtering-Correlation-Id: cc48b855-9e06-4363-73ee-08df1f3c05d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|19092799006|7416014|1800799024|18002099003|22082099003|4143699003|3023799007|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	xOrD2/7OOSe2lnC52TotDhvk+n7iYyOLzCXM74B8kKEPkhhRU/zFmFJoATme37Jzah9kJZm6epodXqaQOISnVmAjRq2xTh8X/3SJCgrtgO1YiRO0WuuBTnYasV7z+YtwPZ3DU/vV2I+FgZVaO9iXzjYC6iYyabspRt9yjeSQ0t26YBKxujN8xVWmg4eZRLeyeKl3NPAyVIW5eCgydSRHvcs/u28c9QLPP5n7oT0Sj+Y7Rn59I0l87rk0qccDIfTTIUdw/zwFsHaR4Ti65H4bsISo7bp6McudXtlLUPBaGoeMIPSULatJPdfdE0tJTb1wTZhoJisPAvpbX8hUbhPQahr9PCU4YTMtSJyOsTR+WLMncarqrE/uzxbSu8j2KwBSv4emsTwiDJ1zQ+GHfNVHZlfYE2nEPgjtJhTR822p3V39Evw0DrjdJrL8E9Q3HJxlsqp5S0OtKg8wtMYSJIl3wzGZuXHrkCarFYqvUwfqh5ZG+yvdrCc/77wG6lW34CNYC9vS+Z2fFSEvBlteBhp3cocebu1w0+Z75wsMhrUe5OxanN+m3CH/xmZEBCdAID9QpjRrvsbyFC2cAMmm53VtdfnbXU0YNzrdoyLiPVBywqE0Gg/PJQ8RtXKzuWsqlB6y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(19092799006)(7416014)(1800799024)(18002099003)(22082099003)(4143699003)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1DQOuoP/FlcQ2yiPi5K9stHyGyJTGTzR7lNwqU3XGm/wk3LV7EdOURI3DFzZ?=
 =?us-ascii?Q?bt5e51OwSJ7DhNuuW7OJCPCkWnn0F1cLvjMq8j1ipgPKo2XBJOJIJw5al+b2?=
 =?us-ascii?Q?Fp3OQIw64IuKekVE4++gUxbU7PHifO6TNzcsW+newXHLoBwzT4Ex2mCWrimU?=
 =?us-ascii?Q?W4tIgV4hzApgzHNSzFMbAus8TACpB9ri1qbvBUkY6WzPi3y5v6tdteNBvgzG?=
 =?us-ascii?Q?gN9l9N8LON9mfru4fooQusWpBq2LmjbVgvt5VwEqMHPfaVEgv2geVTHe0n/6?=
 =?us-ascii?Q?ERmrYeBQSJDC9wtFxKOX5FDBpKWWI5iIBQ5MKbs/+sdSzLJSV+jT9xaywH+3?=
 =?us-ascii?Q?tQ4LbZNpN4KZGcE51meKCtkbo84DAvrUIs57IkkaQoUxq/HTSJ5NwP9azVxi?=
 =?us-ascii?Q?8J6N+dp/edIrzdUXxfrA7d0m+YeznV2o8LfL99c8pZOUwG50VjFdDu7jf+2i?=
 =?us-ascii?Q?IYhX6vRHz/PzqEbgv/xFE87ZSICsOt8pQbAf5ij/FDU+ETTn9lAIZrTybvLL?=
 =?us-ascii?Q?5wjl9Wx/QV2uYNp3SJhiYIXo5+fcMGjRhacfamOCcGEsYw0kbwkcXcKAiaPM?=
 =?us-ascii?Q?ZPzA9jBc3v7O+pxasGnrc05PZdGJPCZnJBXOVUtpx3jKWRVOmK5YbENJdAya?=
 =?us-ascii?Q?EYE4AMt9XjNOtdCGOJas7f75CzfPck/5KAEoYF+W/JxdvOTQJT0Sal+oFsfM?=
 =?us-ascii?Q?rp8IdqSYcT7z5eqVdaDr7HEN48w06SlMjR6eq1oaU4TfNCfPl5nATVOWNcEn?=
 =?us-ascii?Q?DgG03HzwruiAjd6bVjiBTG/EY5UZNakeA/dxFGdgxt4OrmEgY3VuPwG0MzPr?=
 =?us-ascii?Q?CLJJKWwBnKR2IGy/ux7P21/ryUHuNPRXQdTXzXi9x7FVFMizWxy9niTK286J?=
 =?us-ascii?Q?K2BTm7Oo8er/lPKPHutN0fhUbLRXcxc2F6JBlFLeq+zKVPE5nA5B55MtNRtE?=
 =?us-ascii?Q?lpwIl2REaqf8jNjzfUxnmLlpCZow3u/I+V5ZZb01BzQuINWBVpuL6CiZ25Cs?=
 =?us-ascii?Q?T98LesmCrB6H+snMbZco5wkvtH+gNR3eBIUU/WTlmfKGspDPEh1W7MGatPiS?=
 =?us-ascii?Q?/hcLQoHHKdGe5az6S5Z+sDzlAdlECooH3++MSmTVBRQvnYZuopx4niGMBfVz?=
 =?us-ascii?Q?nwqaKYBoI+5ErQk8MvLWbix/yyUAJ5CYBbc42Yzc8s63iJIHcXFtIle0I0B3?=
 =?us-ascii?Q?+XQKsBoqGdbW+5xFs6A1TjwtpjQmMk2WcXcIzoCTIw2X/Uzv/iiVtyGseVQj?=
 =?us-ascii?Q?hxC0dpHd3560NCcAGP9nUQfE+W7ubmxCMdXBHCLzRFcgrIWvd9IEyawviD9c?=
 =?us-ascii?Q?csn69V1EKS+De+sfdKdFcICgvLqzTxzUYebSLgerj+w+jQ5qLs0O1ieh30gZ?=
 =?us-ascii?Q?WxeBoZMe+XpM+1HfBfBOKbRJiWfxA+Amt0JJ7MIizRxuRnMr68e0jTFf9R30?=
 =?us-ascii?Q?sTF6FbTUOSk4nMQK31zOS46uTz4q4bL3Q3XkoP05S6qD9gdiNvF2HSpxOiQV?=
 =?us-ascii?Q?9TFyhlaM8wll1EIx5NBiL30/90r1mdk1Oa4lpWrY1sRA6gZFC5ueVFCu47rx?=
 =?us-ascii?Q?YOSb0yFB4zNtAfGNyu01BXN/HZvsfLbyK70/KNljDvnVaJG2liH6H0kDDIu1?=
 =?us-ascii?Q?Kzx5JSJ5X/jHku6NrWZzJN8/rh4oaZrgeS6nAkjesTo/LJsMrrsE/0l6+AAd?=
 =?us-ascii?Q?5qhOwsBfMGO3zOZFWS6A/3uGOpH4oEyYQsU1EHciCjNmAHoy2C8oM+JIgoOB?=
 =?us-ascii?Q?mbKkNyUdt7La7VhoumyInXMc9eD2VVG6WWkF5ZhMAl0JEf9xEdTi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc48b855-9e06-4363-73ee-08df1f3c05d6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 21:44:36.7845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8vrgLC3NQ91zQayjcWfIJo5Cdk84Iob6rhYH5W5MnqA4c6rXXe/aUZ6zSePl//+Eg6svJM84ELlfSAegVLBpBhOGAA4+Rx/ZjwjddD6X7j26pxLzOUp2BejWOC/LteD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7708

On Tue, Sep 22, 2026 at 05:25:43PM +0800, Binbin Zhou wrote:
> The DMA mux on Loongson-2K0300 is not a standalone hardware block. It is
> implemented as part of the chip configuration registers CHIP_CTRL13/14/15,
> which route peripheral DMA requests to the physical channels of the CMC
> DMA controller.
>
> Document this as a DMA router. The #dma-cells = <3> specifier contains
> the peripheral request ID, the target CMC DMA channel, and channel
> configuration flags forwarded to the parent DMA controller.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../dma/loongson,ls2k0300-dmamux.yaml         | 49 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
>
> diff --git a/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
> new file mode 100644
> index 000000000000..12b8f8af51e9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/loongson,ls2k0300-dmamux.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson-2 APB DMA MUX (DMA request router)
> +
> +maintainers:
> +  - Binbin Zhou <zhoubinbin@loongson.cn>
> +
> +allOf:
> +  - $ref: /schemas/dma/dma-router.yaml#
> +
> +properties:
> +  compatible:
> +    const: loongson,ls2k0300-dmamux
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#dma-cells':
> +    const: 3
> +    description: |
> +      Each cell represents the following:
> +      1. The peripheral request id (see
> +         include/dt-bindings/dma/loongson,ls2k-dmamux.h)
> +      2. The physical CMC DMA channel (0-7) that is passed to the real
> +         DMA controller

Do you have restriction between request id and channel? Does any request id
route to any channel?

Frank
> +      3. Bitfield representing DMA channel configuration that is passed
> +         to the real DMA controller
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/dma/loongson,ls2k-dmamux.h>
> +    dma-router@16000134 {
> +        compatible = "loongson,ls2k0300-dmamux";
> +        reg = <0x16000134 0xc>;
> +        #dma-cells = <3>;
> +        dma-masters = <&dma>;
> +        dma-requests = <22>;
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b021fb623446..dc976938c58c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15344,6 +15344,7 @@ M:	Binbin Zhou <zhoubinbin@loongson.cn>
>  L:	dmaengine@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
> +F:	Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
>  F:	Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
>  F:	drivers/dma/loongson/loongson2-apb-cmc-dma.c
>  F:	drivers/dma/loongson/loongson2-apb-dma.c
> --
> 2.52.0
>
