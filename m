Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794512731;
	b=G6uXMmGdw7+E7ujs63QdTwqespMz+8bi5xs56nuW3MeQaAuHYNx3eeEOop8OWOCXOS8E
	 f5v2a/yNKyM/zd2aBPJ66O/MmAT4H2ZNw12Uz6s275/xBka3svIKVJzrBiHM0RoVJlVpN
	 PqIYbwljsUpaWOb8HkNan/Yg8CPH4qFNTjG/CnVpLUIaqfiCd77FNwNDeTOEb1n9G6NGh
	 n+bk7tivaEebqJb4kIgM34efO42HMZT6RTuUM1y47oKZpykSYYwdMka4pKHIoQND0oJB2
	 aIOZqu3uYpEgNZuMLZMLhVzZGre6ckMWRLa6DgD39aCiiO+LUG6VdAEGVcx/zfstyeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794512731;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=0NFlXnpRRPhnGMqAMkHCrdcok9303l9d7PbOKy+jxQ0=;
	b=AIGThQ1Dy2FwifpeR3MKnTjDppoAl4aAiUGrOUXmVUICX0h7diV5OybyIqWx0J3Mys0U
	 rSEDq1ujehJNLwpZWGiV8rca0Ac/L5fHTp/Jvjd8EtSv2Cc4Ic1x12GvyeuPI+3HcUueY
	 aDXfQKfKVfM6Pmh3C6ZZ9CWbwMTOQkRff7/doLwOVIdnuqOtW7xFv2fXVXwCPmqxwU2zs
	 mbwqvUBhGjvpZKJa3aojmDcD8pwSD3YMI4H6LB7YuX9OXJyn8MjNvmFEjaBUvPcVxJfeq
	 ZRGDlNtqjFQfA0OWrM5zAzhR/cfqybGZMjxdW91rhxfEUTZYv7iIzCnWf03yrC4XSug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=edIbcuam;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.62
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013062.outbound.protection.outlook.com [40.107.159.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0CA606A31C;
	Thu, 12 Nov 2026 19:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB0CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=edIbcuam
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMZSFYADnuX+vzn/LNC5fIHHcVSlPr3uEoPE1Lh0rNphUZtrz2MRwhg6uSqLESic18MgQWyeN0N/vGRsZb+o8NJHINlcNhmpHZd3JcZL724vL4LBb8CfAJ9D5rr2Kw9Xv0S7YqjD30W70q9B5lN1DwQIfMySWO/zO4l2p36Igonn8/v4UP25588luazOSBwwdSpksOZS9Wnr1lgZQTsOU6Ad1N/yK471Ckfc9BD83WP9WduCKVn2pY9BWp26OFrUUsQo0AO4icdktFvVm4NrvukHEa3Q5xWiqeAZWBCO51vAj9zQDB81hOxSBwh1mdngqQo+kGKBU/TXtBLF2nknWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NFlXnpRRPhnGMqAMkHCrdcok9303l9d7PbOKy+jxQ0=;
 b=Rdpu0dauv5h5ZwaMMAWm5cxQmvgFJC80dH2C2xWVUMpgm0TXjmQbyFYsXBR4AK+Jf5YsXeWV3E0Qd3z6FQ3l8jQINjl41e+d2cdvve56goU6PFIaycBYvek4DjmGkMFidftnK7LOjbYaa9Q8gwzIgbCnBWFJtzyka/kDQ/eMLd0yuyHdJQt/qUdh6QWbrgZqG/e5qyDiM0ekJySluUAQ6khfAtqbpgiWQHlMXlswYlX3SUoOR/3pU6g/Jcj++F1wj3rW+Xhx2xbiUB2M3Qc6tqPdNOMdJpXnRMXtL/2LmEshGVheogL5CXS8a9Nz/g2DTVbWIA973N774IIwNt/wFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NFlXnpRRPhnGMqAMkHCrdcok9303l9d7PbOKy+jxQ0=;
 b=edIbcuamepDqIA9wx2WTh8UedOpZKb2cNRdZIpK935sypyd9UnT/JyBPmc5wCCY7tOyyEQ5mLOsS/nfSQDjLkz4esms3tSNsv0CEYaE6sc7htLVh/Xi0UrzKGtrT7ZSS1bq6Hyush93fna+wjYzkUCIo1eX9ZSyOiij+AaiiD63DclaCr+MUiwFHN+RB7DzKmBUeAH2pojYs6Mg/M0V+LRJ1yOZn3+BeYYXw4CydFrOiQP62NZ+m2IzXn677CHWwmfx+Mj0twWRwGc/r9wtYvyXbbeJg+5jgyLoCZmTZ4a+yfo10Mkq0MNIad4KfeZNSQhwHBDrKlqhVbSdiv08fXg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AMDPR04MB11297.eurprd04.prod.outlook.com (2603:10a6:20b:6cb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 19:45:27 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 19:45:27 +0000
Date: Thu, 12 Nov 2026 14:45:14 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/5] dt-bindings: dma: arm,dma-350: Describe the CIX
 Sky1 integration
Message-ID: <avYXSo7X3lh60DiM@lizhi-Precision-Tower-5810>
References: <20261106013453.1134239-1-Jelly.Jia@cixtech.com>
 <20261106013453.1134239-4-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106013453.1134239-4-Jelly.Jia@cixtech.com>
X-ClientProxiedBy: AS9PR06CA0412.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::6) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AMDPR04MB11297:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a35e27b-ce26-49f2-230e-08df40f58043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|376014|23010399003|1800799024|18002099003|22082099003|6133799003|4143699003|11063799006|261102123227099003|261026140227099003|261028144727099003|261026121527099003|261022105027099003|261021121427099003|56012099006|261021123027099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	o93TvgAd8Ll0y+nIPpGkvTtOaW6tIpTFTsjIUPTLEwEqueqRjeyfXFhfSCbN2mTtpE2i37Jn7ROX5AJLBZ6WW4EiyjqqJ1qT79e9JKq5WkoEzC76Mm6L7ANxpMgJY3lLeDKaRIqQWyvKQ97msxN2KtPYMRQau4fWtB981v4r09xFl5rJy9QLPxFftwUfnzmmECFyfNfJDqLVLW4DOGSvhmQ3C8hn+1IvPnmFXE8XsGe2pjtWSgwD4N9K1PAWDsUbhMlOd9re6L9CqcWIhucgMKiEfH+JLS+BCdzgCq4FrDiQKFKZmqSddklegdloYdK02fDENiZwzM5PLFFgjdFZSC5CFkOMHJlImCIZhokAmdkjZn/G42zPV961NTKw+0AeBAxnsM4mZzLX86jvmEjuzkc5rzKOzD16nYN/G86SJXwFz+GWR8p2GmFIFBi3KQMSw97nP8Se5htwMZ/ZYcwvU1nrQpTQ0qG8xQXXyi34xu6jXECsxm1RC7YvzGjdFGbmyzckbU/0DmjQDlQZnxb2Crdy9BMpLjx1W+ay/tLlTMCrav/eTmMtwS4Qjit1cbuaB5yVcgHxoUudAl199g72SkmT+2v4exD7ogdUtkU9L9tSHi09C1xLQ6l16FA2KjStxbSvQsJNxcYURqrA17vIk6yGoQvqxjGH7X4d7xJXBdc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(4143699003)(11063799006)(261102123227099003)(261026140227099003)(261028144727099003)(261026121527099003)(261022105027099003)(261021121427099003)(56012099006)(261021123027099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+jJfmhBuS5Unrt5nnjM1s44Y+5tzStuK6ssxH/QzwHhInLFK2jefYz8bVIcT?=
 =?us-ascii?Q?D4Iv2sSQgRQ3wv+teLEfwX/liywMdN3QrfQAqBHzVF5WEj5JcrCDKIfQPbJH?=
 =?us-ascii?Q?hb4/Gs01iRYc28yoZTP3H4fAsIbME6qOabAI6WkelLD2ypJYNfrg2H0FxM/j?=
 =?us-ascii?Q?EJORYRMfCi0XFYvjJefTQ8nYlTb9x07cypmjZL5YLszC7w1csYPGJNK8jDp0?=
 =?us-ascii?Q?nYM/Jftw4vZ/SM7xO6/v8WF2O8/19dDDRaIRgSc/xkpf23OVWQu48LHJ9oZ4?=
 =?us-ascii?Q?8Q2Qq53I/IcTkTwLWDcu49iyJyLvixcCroG3GjSiRXnrqCyTUob/ugclzCqy?=
 =?us-ascii?Q?G02x617ChkcdiPZARCV8VajlF7C2zTIwgxUFefZToM3eBnb048Au41iae4SR?=
 =?us-ascii?Q?kwDSvWiErIMmA3JM31rD0DztmHBVuyhV+rZc5CkIUNgbOqOWhjCAJqLQL+se?=
 =?us-ascii?Q?yQ0NS6pr6upXHtv4BDZRlVEZ+dqvRGbIOVYGykwDGVM/ie2rb86uOf8rT0b8?=
 =?us-ascii?Q?2+i2R5Jo1tmrP6aB2Cc2qtshje1Ov0ULhtmSqsqLZOMntpAZAhK0HkFBREMl?=
 =?us-ascii?Q?4MWnq2b/JkYp0cfn4Pg26NPapnipjiYBwI4OZ2JeCgBQJCxK+c1WHLckD28V?=
 =?us-ascii?Q?2IJMb+EAhPlNn00C+aCxZWMxVJRv+DZGrIhrnScjX3WVlp9ptc/aK20P4c9M?=
 =?us-ascii?Q?e4wcDqFnic0+EQ8X0k0hUwqQtdT6ROUSYO6+9KIdAZJMFCTqH9PmaucB8gP4?=
 =?us-ascii?Q?KbAAzkE9wu0faYxfQQxyShPmOzDucEs8oay3PfGIO1qVlNCexkoZg9MAxx0f?=
 =?us-ascii?Q?1E7PCaIRKBdmBqMA9wB9WUKb0FYJdSkDY8/VvI5IvdrIlB/P7Jv5+ZICLARH?=
 =?us-ascii?Q?2wDjwqE/AK3ynTzlf43i6dCCZoawzhmOyGLf8OSCG8V1lm79lKuMmj6omhN6?=
 =?us-ascii?Q?IfAHVxZKeVJYmx0k7VeCxKNrsL6wB16xPbwiBPhuGyjeJykaE5kHyn4Qk+rT?=
 =?us-ascii?Q?TL4v/rNQU35fwfGPsUn9mgQBQMAukW89IXLcRqw2fyn+aa6KFHsBHn9avCyt?=
 =?us-ascii?Q?7sBe0ItvwS/X/4B04m20/WWnXyS2ZNSd76xEtYjEYYsnwQl2TaFBWCRjaV1D?=
 =?us-ascii?Q?iWx7BnOQzbWmPzjhnf5kLRNP3PXCrbL9agPpPXYmBJ4cW9aRF13B3tQ/EorM?=
 =?us-ascii?Q?N3N+eprtDD5jYx0uc4wLrb8qgnaR29SohVv3ESUGMoiKxwQ6CcKUQm6hAo+q?=
 =?us-ascii?Q?vjrAd/m4RGf0eBVVWeOMr1QmAeQMvJZGFKXKXnSMmbb2lcK3q3csVjIV63Jo?=
 =?us-ascii?Q?dUPthY93XztLUxTILvYU0Vo7WAwuUF1SGnH+L9tlRnL1aLjAOHm1Ahbvsked?=
 =?us-ascii?Q?e5aLL5rQjzfZva2XLemgtDklUfj8r1LJ1HyrOSLKb+jrMe6SAhgEh1oZZTak?=
 =?us-ascii?Q?IbtpJn351h7xn/YXahDKbxniujgx7OR7/ebJWU0jk4eBCs5GwBtmgEEdfaSg?=
 =?us-ascii?Q?w+EmNI4xlCFAKQIbuwUJ2hyST43nuUEIq9rRN8FmK3SAx7XHtjE4mRpc27iH?=
 =?us-ascii?Q?mSmNNUY1xV2CTwkA4q5A4hMaCVJW/abEyuGJX1QFUb4JhfTnEEh1IUHLL2A6?=
 =?us-ascii?Q?54wWqDYQbxoTrEuAfSsEr6gfPFCqTyuULI+RObLq9gfBs37YnphrHa9JpDoO?=
 =?us-ascii?Q?7HhPkkP2kaoPFj6fcSpGVDozSKZWlUCjikryKIF8irtI844v3f6oxZj637yD?=
 =?us-ascii?Q?XYyARagZoQD8RgZ9y1F/o3UqF+kGBsatRrJZb7v6y06RE00mYHu0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a35e27b-ce26-49f2-230e-08df40f58043
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 19:45:27.4576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ZNg/nrerLu4bFsUhmW/0loZKA1+3TbA/jwFiLT3ZD/wFpJ+2Tiqvd2nmcHN1pCqHE1SjFXYvN4zKQFA21Yjv3MJlwxjU195AgVe6sQZMcPzQ9ASDWvyZ6oCkuD60HhA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11297

On Fri, Nov 06, 2026 at 09:34:51AM +0800, Jelly Jia wrote:
> DMA-350 integrations may gate the controller with a bus clock or hold it
> in reset. Describe these standard resources on the DMA controller node.
>
> Add the CIX Sky1 compatible with an arm,dma-350 fallback. Sky1 requires
> a bus clock for both its FCH and AUDSS instances, while only the AUDSS
> instance provides a reset. Require clocks for the Sky1 compatible and
> keep resets optional.
>
> Both resources remain optional for the generic compatible alone, so
> existing device trees remain valid.
>
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../devicetree/bindings/dma/arm,dma-350.yaml  | 30 ++++++++++++++++---
>  1 file changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> index 429f682f15d8..eab3b31aeba7 100644
> --- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> +++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> @@ -9,12 +9,13 @@ title: Arm CoreLink DMA-350 Controller
>  maintainers:
>    - Robin Murphy <robin.murphy@arm.com>
>
> -allOf:
> -  - $ref: dma-controller.yaml#
> -
>  properties:
>    compatible:
> -    const: arm,dma-350
> +    oneOf:
> +      - const: arm,dma-350
> +      - items:
> +          - const: cix,sky1-dma350
> +          - const: arm,dma-350
>
>    reg:
>      items:
> @@ -36,9 +37,30 @@ properties:
>      const: 1
>      description: The cell is the trigger input number
>
> +  clocks:
> +    maxItems: 1
> +    description:
> +      Bus clock, where the integration gates the controller clock.
> +
> +  resets:
> +    maxItems: 1
> +    description:
> +      Optional reset line, where the integration exposes one.
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
>
> +allOf:
> +  - $ref: dma-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: cix,sky1-dma350
> +    then:
> +      required:
> +        - clocks
> +
>  unevaluatedProperties: false
> --
> 2.54.0
>
