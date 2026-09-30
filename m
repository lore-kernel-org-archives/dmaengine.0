Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013022.outbound.protection.outlook.com [52.101.72.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED7F54705C;
	Wed, 30 Sep 2026 19:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790796665; cv=fail; b=hmPgXdDKnytPPAGgfY0uLzZwaQVxTTBFgxF9e0Pi3i6DO/HcxCF8FIrgGGKifMSS33OqCI5dTJchgo4R9c5QTLCt0/wedYiwDEdHAZaGGkkz0ugNbCBX0VxwqJXtXOA628ZnoYDbLE7MHT5E1pc1Pkx3uWm+KJMfY/v9iRH8WGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790796665; c=relaxed/simple;
	bh=MI7I6Z4u3T1GW7/LQwGRddp5xV93Z7qnRaWBuv2H9uI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q1kpCr38iafyQie03Sw/gRv+FBKRjT3CZYvAHCc74UDV7oUlFvUGKo/wFONhd2yuHWM11TNYrCkHUBXGb3/WcAe5MtCaFTgsXKbv7OJSdTtYAoGALbUINBVIYu62IWjCxvBWA9yV5W+sjKjMpixQNuhYG6pfUsQ7uVqPTaTcbUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qHlz4Y64; arc=fail smtp.client-ip=52.101.72.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qHlz4Y64"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1bIcN57ubhHosfZ//AHDvpzYtWHWJVAcafAbHOUI/MlX99prMQ80mQWEgZZ4DMAxGhylsyAWJOu0VLVPIm6fJ4SqJ3kCEqzGTyhModXZhlvk6bQuAIRGHkMFSwqKYj4yYamSxbNroFCh4G1wct3J0dnRsaGbhyYrn+4uxSZ/ftcKQnV/S4XQWPeTsj/HKfJWkR8UOb9Tc7YjBRb9Y2iqYIheO5UT2SnjcO0bIUwNpa5wpckxn1e0QujxXO+hyVHmiAu2/YWDReHnXdFdLqUnBa1bfX4D8rP4bYUx/T4TAdB4PdpII0I20NQUrwERjLZ5HEkVDbQiV5AtZicvVYdxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tq4NggqPawD9VL2gWYyi/f0nDcMiKba6/j4vAP+sCS4=;
 b=wfIQnjsf1H/uP5QpN/1zVOUGoJdfc4DMyGEIyL3gdakdh7Uj1/6SnNyY2yLkEnZF3Bb+TY85/WuDbMGNwiRAB6jPDBS4Ijgby01240lXYpjOpSZx5/9UBrQRMcesIj5ETIn8fEr/mXf8cDYpEEnqDCqZYpQutfzpd4UERVxzKHRrTTxDwdjft+jiOBTXJDtqnSt8G5EJr/DQvHDeZyHw3z0Z29QgirhE4C7+06pZLq+f30tqWuBuEQ+WG+3IToRvHAgnB2EfmoTxv2WcSN4oe5J3I4A6YReTxDgv9WyZnPcql01raScaPJohcOEeZ62EAviRfEhuDgrVVsWGFxE8UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tq4NggqPawD9VL2gWYyi/f0nDcMiKba6/j4vAP+sCS4=;
 b=qHlz4Y64tdQJqyXeEPd9Au53u52etZJvvk7xRBqG/vXBww/fk711p9xbIjlA1RTXb2T9+IuhvENqfti1Q2XvUN6VOv1Kuwzqc4xG+Co8V9BlsdCF6agDD+VJSvRTzxNp8IVxi+4daiDXBPo3A2HZ4kObrKHxHrsvp2jyNZITvk8OQV8aliYEeScDfPsOuP2mAQ9ss0eL23COkwK/42lGwFWZsevvnWI+vrA2PtlKCHqieiJz8TNEbYQ/aiFkHmwI53gjWHfymRTLvVN2mNOxJvSsweW7xkTU7Md+IAe4DvjyHBdvB8qFBvekcN19+Z5mvNt7lql4CQcbegEqnzPncw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10288.eurprd04.prod.outlook.com (2603:10a6:800:220::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 19:30:57 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 19:30:57 +0000
Date: Wed, 30 Sep 2026 15:30:50 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: dma: Convert hisilicon,k3-dma-1.0 to DT
 schema
Message-ID: <ar1jarw-WgVlq2_G@lizhi-Precision-Tower-5810>
References: <20260928124448.3754740-1-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928124448.3754740-1-robh@kernel.org>
X-ClientProxiedBy: CY5PR15CA0166.namprd15.prod.outlook.com
 (2603:10b6:930:81::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10288:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eaac759-3319-4aea-b045-08df1f2959c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|366016|1800799024|11063799006|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	AstdYg9BVhqBTlAH/u9zV6TI00jhFodhMsGFKnO+g5+AZQJvgfmZnS2XLdZH4MS50pgDwR2WH64XsiAJph24zuYNYREsBYM2DJxFpDGhc2cEYiYvo6gCmvO6hOnBgwQBBLMfTj0kUazmTdDZ3CJMOG4aIcgLDkVWYQJ3lvzUOaCePcexKNOqA+5YEZPdsVJv43orZzXk15rUY7Brv2z23fBl9TgCOKRAYXJbCeiDw+lT/DWc7vsNoPd3ARgaAoQ44eM6L+HvNTBBWWdIpOuCYQFVC8T4dBAhMGYHrQgs7c5PDH9VxRMpT4l2+h/61vtYF9uWfCTMd4IwQiKz1JsQ3k+YjkRsQ7Qni+gGNnpfSpAZLWVvsW27YOdzExByIWRbKs2ESq458sx/KbNINfbZJiL64ZdDAwbt7vuK5j2v0AHqCkSt8z3iVra55ktdevHwo4MIvkpvcY3pCivPMY15ciPFuOr8aG4//PxhrnIPQ80K2Q99q3ymVCZWQdmFzEUwSZkD8pCOhbiKAu1oHdn3nPbh5wE3pNnBPgE4yh2pfId53mxHIgmtRBSeaABMNay/n+iu4C3qBuWiUx2OkdIfBSormx0mFU4qR9R8WoKdCA5/9OUfOfm0SJbGYnlE+cR5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(366016)(1800799024)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y17kwWkWhD6/qcS7NIa9A4A16nrWFdlletduSP0UlPh9TDFHii3fKM27bEFw?=
 =?us-ascii?Q?YBlh6Bwck+o0SxMWZdmC8Q/E4PmRRuM0+snwKRCvkU5aAUox+t2CEwNDUB8Y?=
 =?us-ascii?Q?V2RtEmcgeaBws9yzglNAbmAzUmkyL2ptjEyjruJ+ygEUhTQ58JtMaCUPvQNS?=
 =?us-ascii?Q?KI6c5Ca+x9zLeAjhL5B3zdxAbi/3Ol4omNyHEKCFa9AKC6uUCmV1LDtkykRm?=
 =?us-ascii?Q?odU+WNDY1cFcOpCWNOPhhR0e673+UaZYUHkh69JzX5iSzsihErKq3Bgj9Oq2?=
 =?us-ascii?Q?o555ZCQf7kLfvZaPhrJVGelJpOvmMEr9CCXEDkJfOj3txVJRz2yxmrr+V6bX?=
 =?us-ascii?Q?gKnOk+rFsiXoM+IX+sILSMwSM5YJhOA++e+9whVxF2usI4+1O2fX3xP5FnMf?=
 =?us-ascii?Q?skIs2BGW3FOz2RtHR41UGzjiQqDZqkD9eafaKSmPdVrri/SkWvaIHnaxmVmO?=
 =?us-ascii?Q?9cZqFS5rXLw8zYvV/RH38yMp1K2tVUuW6QcWEK6Mxw5w1WX7Zc1H1+OdQzZ9?=
 =?us-ascii?Q?mNW8OOG+6l3i6u6psd4W/X8AVlhy3i8k6NCYRHpxrMXYUF8Yy63pC0r14QD+?=
 =?us-ascii?Q?pUOpGMJvQpt7eKlpOgRfLmOZcofLW1aKiRifDvPszRhDSvrZatCWb+oe2a3F?=
 =?us-ascii?Q?qUlge7zIa+FI+H2sBUcp0FkhXBqWjeLW7L9uGpXkPSEtXvN9+CNKOgOLjCP4?=
 =?us-ascii?Q?yzkrdCAk2zHvJlOR2QTE99AkeCs5spDJ/XTbAFN4yQbsf5XwEbXjsdks05oc?=
 =?us-ascii?Q?+dAtZF2TbbKNUELvGin31tudQEh1DSAov85hQY3R2mmP6zNLE3BGrKibi6fk?=
 =?us-ascii?Q?KK1dXxTB4DCS0MJsLIQMyq7rbJFKWhW6Cy3O4RdBK/YVxUW6huBNLgSR8QVj?=
 =?us-ascii?Q?Ccniath+oMGVk5iz7LiU4DGMEYAgW7nQomu4bc6qs6QW6Shx3DoQb4qEBXW/?=
 =?us-ascii?Q?+eUn5B92ESJXV7gizmE4UFDSWtWcBg2TE5wtcB6azVFjscZzaT3hbUSTOWLn?=
 =?us-ascii?Q?R1OIvalqJwvMVKfwNps2K0PSyv1ZDaVMk9WfgDA5Vbt+t8iMp5i5MdXU9Onj?=
 =?us-ascii?Q?Divrd+N++wjjrn9ac69cIUZWpljhChmCx09awkSsYg8BN1QmePoZaXg2c66K?=
 =?us-ascii?Q?s4GP+s2Xlb17zh9CbZH2JpdatKUyMCFng6l9UPcwG4OfFx8GiR+/uwHVIDfN?=
 =?us-ascii?Q?a5e724HesBP1cJmm3S3QC4oxrAGxKILaMC/c42j7BeKK7JjzbK4XDcu3lt7u?=
 =?us-ascii?Q?NSo+CDkpA18RTxTnOVTHWMwY5vAZzO7IneX6eUwc7kG+rtj6CFS0kz1YhROu?=
 =?us-ascii?Q?p3wwh4lBWW5Fr2grnqmi6zfAVNawwUc+8ggD2MlUyHy3jjifcHTiQhRazdj0?=
 =?us-ascii?Q?2ThbCGBbU7/mP2TvyMB7XUcpccMce5wlhnX8kYzI2bmsCI96X4upBJe9E8g+?=
 =?us-ascii?Q?08vyDhfqz0p9SutojYMroT7eFfqsSQ0r0LWjhQBEfyzb9+RwsbOL8xszEF6D?=
 =?us-ascii?Q?TXRyGThcWtq4p10eTWTSEB0ZpAva1nEE5+EtOdJPuUSgmU3m8606nhnGqD3a?=
 =?us-ascii?Q?pKlTNVefGDT5qvYO4ToSTXEEU336xgGz6qoiXICbzk1KYw6BIb1kS4uuEBdg?=
 =?us-ascii?Q?L2+aqb/2pA2I0KsY9/PPBewyxGn9gAnVm7v6iz7W2FdkicoBZtuFIHpkVlDZ?=
 =?us-ascii?Q?2US095OH8i9NUIbeVk+LFifSvKc/rrew2Vsgpkwk7WFACxYTAaSjW0+buNPJ?=
 =?us-ascii?Q?oED88mEXw/xEtUo8roBoAWbNpozmx2S3I+6V76JhY5Qcb6UB/sEx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eaac759-3319-4aea-b045-08df1f2959c0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 19:30:57.2108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +FfE24JH0z3XpU8sgtxgvr6md6P02PSUQeld40Lrhfz6kO7yctLENj5HgI1XM6G+PBJx/gqAgHz4iLh6BFAHHNJuxLDA2ZxxEOGJIFFZyrLUK4tROxuuSB4fJ/bpoPnH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10288

On Mon, Sep 28, 2026 at 07:44:46AM -0500, Rob Herring (Arm) wrote:
> Convert the hisilicon,k3-dma-1.0 binding to DT schema format.
>
> Add dma-channel-mask, dma-no-cci, dma-type and interrupt-names
> properties which were not documented.
>
> The "hisilicon,hisi-pcm-asp-dma-1.0" doesn't have clocks, so make it
> optional.
>
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Fix example node name to 'dma-controller'
> ---
>  .../bindings/dma/hisilicon,k3-dma-1.0.yaml    | 87 +++++++++++++++++++
>  .../devicetree/bindings/dma/k3dma.txt         | 47 ----------
>  2 files changed, 87 insertions(+), 47 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/hisilicon,k3-dma-1.0.yaml
>  delete mode 100644 Documentation/devicetree/bindings/dma/k3dma.txt
>
> diff --git a/Documentation/devicetree/bindings/dma/hisilicon,k3-dma-1.0.yaml b/Documentation/devicetree/bindings/dma/hisilicon,k3-dma-1.0.yaml
> new file mode 100644
> index 000000000000..e60f2a572272
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/hisilicon,k3-dma-1.0.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/hisilicon,k3-dma-1.0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Hisilicon K3 DMA controller
> +
> +maintainers:
> +  - Wei Xu <xuwei5@hisilicon.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - hisilicon,k3-dma-1.0
> +          - hisilicon,hisi-pcm-asp-dma-1.0
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  '#dma-cells':
> +    const: 1
> +
> +  dma-channels:
> +    description: Number of physical DMA channels supported.
> +    maximum: 32
> +
> +  dma-requests:
> +    description: Number of virtual DMA request lines supported.
> +    maximum: 32
> +
> +  dma-channel-mask:
> +    description: Bitmask of usable DMA channels.
> +
> +  dma-no-cci:
> +    type: boolean
> +    description: DMA is not coherent with the CCI.
> +
> +  dma-type:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: SoC-specific DMA type name.
> +    enum:
> +      - hi3660_dma
> +      - hi6220_dma
> +
> +  interrupt-names:
> +    maxItems: 1

It'd better move interrupt-names after interrupts property.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - '#dma-cells'
> +  - dma-channels
> +  - dma-requests
> +
> +allOf:
> +  - $ref: dma-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: hisilicon,k3-dma-1.0
> +    then:
> +      required:
> +        - clocks
> +
> +additionalProperties: false

there are $ref, should be unevaluatedProperties?

Frank

> +
> +examples:
> +  - |
> +    dma-controller@fcd02000 {
> +        compatible = "hisilicon,k3-dma-1.0";
> +        reg = <0xfcd02000 0x1000>;
> +        #dma-cells = <1>;
> +        dma-channels = <16>;
> +        dma-requests = <27>;
> +        interrupts = <0 12 4>;
> +        clocks = <&pclk>;
> +    };
> diff --git a/Documentation/devicetree/bindings/dma/k3dma.txt b/Documentation/devicetree/bindings/dma/k3dma.txt
> deleted file mode 100644
> index 10a2f15b08a3..000000000000
> --- a/Documentation/devicetree/bindings/dma/k3dma.txt
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -* Hisilicon K3 DMA controller
> -
> -See dma.txt first
> -
> -Required properties:
> -- compatible: Must be one of
> --              "hisilicon,k3-dma-1.0"
> --              "hisilicon,hisi-pcm-asp-dma-1.0"
> -- reg: Should contain DMA registers location and length.
> -- interrupts: Should contain one interrupt shared by all channel
> -- #dma-cells: see dma.txt, should be 1, para number
> -- dma-channels: physical channels supported
> -- dma-requests: virtual channels supported, each virtual channel
> -		have specific request line
> -- clocks: clock required
> -
> -Example:
> -
> -Controller:
> -		dma0: dma@fcd02000 {
> -			compatible = "hisilicon,k3-dma-1.0";
> -			reg = <0xfcd02000 0x1000>;
> -			#dma-cells = <1>;
> -			dma-channels = <16>;
> -			dma-requests = <27>;
> -			interrupts = <0 12 4>;
> -			clocks = <&pclk>;
> -		};
> -
> -Client:
> -Use specific request line passing from dmax
> -For example, i2c0 read channel request line is 18, while write channel use 19
> -
> -		i2c0: i2c@fcb08000 {
> -			compatible = "snps,designware-i2c";
> -			dmas =	<&dma0 18          /* read channel */
> -				 &dma0 19>;        /* write channel */
> -			dma-names = "rx", "tx";
> -		};
> -
> -		i2c1: i2c@fcb09000 {
> -			compatible = "snps,designware-i2c";
> -			dmas =	<&dma0 20          /* read channel */
> -				 &dma0 21>;        /* write channel */
> -			dma-names = "rx", "tx";
> -		};
> -
> --
> 2.53.0
>
