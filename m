Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010033.outbound.protection.outlook.com [52.101.84.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0613BBFD3;
	Tue, 22 Sep 2026 16:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790095554; cv=fail; b=oNy2d1szfd7Y0Boa4qqzkya2WJWNqzdpqi0zSISzbguG9P+LdiZiVZMWr5lZ8ytQyufC3doWnwF7XeCwzA8XF++M8ZNN12TaKX62RjM2oQ/X2baU2Gcc394VuwcA2lBkBVU3Tqq6NSTW7iEaKueA72W+jK6H4ANHZyB8kIen6AM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790095554; c=relaxed/simple;
	bh=szd8ofb2jx9YeDA+yerNSstIpA7MMdigckM95/0V2wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NeP+tQS0jaqS2l1p3/d+T/z31w7BEyUuTN/JS655qsHuBEPsM1luUZkJyp3v51DLyAD1UFmaJMpqIMEnJvqBqVWqLBvPUULKQ9XvP7dj9nsyoS1AxHaQcVVRNy2+PgBiXgyFn/wwXiG4qG/yL1P65+J1HNwmjfbaYl/jZ/+/CCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fV+6l8G5; arc=fail smtp.client-ip=52.101.84.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fV+6l8G5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJz8hdu9uFgzfFBNGy2E9qi2QtnmoFrRg0qdN8SeIG+lQ7j6u7NcuLIgJ6C8ihs2jBbmQtXcqnSrMvsEzqcVYCKjNPdPAAIs0eAWfB4ru397ajot2QMBFXeCX0zCi1D91wyosJ8X7uDdbpD89Kp5tLuusJ6G52cIvRzpb2/EFOZk17ZEfJ15MBydQwCpork5L0lBL/PtOIID4O+4lJwoj89mxXFPDI21hDb5R16TXS6iNoSuKv1Fc7yEjEmpZO12AEQLsIBU/FFKO3StrvL05X3aASoBnNYqVGrDQwWGLllMJeJBljBoUX3bEH39MKD7i0/earSVkqN4aV/6JFY8Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ItuEIo40rzHR+IRqoxwqkl2+4UufdhbZ3kz9kiMt8eU=;
 b=wzCIWItuEWBsb0cnocUw24/KKeisjtn4YOQOXvJBtIsvHUvY7vAh/ESmlEYFDpG7rHrYlJR2oeevEbqXo/cRa7sJ4fSvnQixHygUJtVs4yzhu5nPVlb3Yicjl/2nECRPiJeW8kgRk/pvPCpNz5RD2JLw6KKDabVrfXn6MHrq+5EMi922T8VcrAB6S6fgTNADMjKXQNXHOe9/V2/VlTQTnUNcFFldnZJhuV6QTH55G9ERYJHnO/M9jfpcjZMmvjSHUTEqDAbvTK7HjI7q1cVIV5apNQ4jeG1WoKjUKaasgN/3XCiDQczB2wjTnAEipnsK3dbVSr9s6ASlz80Cotm9Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ItuEIo40rzHR+IRqoxwqkl2+4UufdhbZ3kz9kiMt8eU=;
 b=fV+6l8G5Dm0B5pcO8murVSbv8hzlgCYvF4E8u9bv1lYz+L+DrxgAxMu/s7DIDdVBLcktBrUikNJdXnRGECfWVmvhbqK7hSQlttn+RcCCKH+XY5XOahn+VwP17pK5s/Mi/4yaq7NA96UxuDU/9pnbKk8RXmrlm8bl3ZAhnxuJae3HF5xJUv4emCGsnoLVI8zDc0lORMgwutebBMRY/AHE/zOsWMqDMi+xkWaPftA5ciw9pCEcC0fIemzGMgYNwnBuRaq6zHfGyVsh79Ddn1tYFIKoEMIbtc5ezBhUeO/PDYYgGNS/tRe/j5KtfKMdjitb05JwGQ6nDYwrmLNd61dtdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB10032.eurprd04.prod.outlook.com (2603:10a6:102:38d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 16:45:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 16:45:49 +0000
Date: Tue, 22 Sep 2026 11:45:39 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>
Subject: Re: [PATCH 0/3] Add Loongson-2K0300 APB DMA mux support
Message-ID: <arKwsyDwkCsIPjWk@SMW015318>
References: <cover.1790068409.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1790068409.git.zhoubinbin@loongson.cn>
X-ClientProxiedBy: PH8P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: b60b67f5-20ea-4c97-fd7e-08df18c8f4bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|19092799006|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	40WRnzUDdBlvqNaU/Ev0aVRHKcOV6WTOFkXoKABIk60BVxi1sloNkUW5Mm7zsYlti2FBUGZA6vCpf6KvPLoqaWycqYyjckokm8Asg7csHanJaIaIGHyIwWRI2gNXx1PIYGkFfqRuAILA4Vs0Y+2usiEOpasuf5AyO241aIB0nuGHigF3hQKuUNPefmG7zI6LgiuW+g7STcHBPn6ZSNSJSLxVZmqG0/QMPvZUdBGGt6pdEoIj/A32y2BVoUMrnoONeu87uLrXQkfwv6zx7gHjlb6bbylx8IkeVq7lnpguEaKpvD3hU5CwS0FVtIp9VHdu510tC3fHVHO6ty5SEL8MtJClviwVhc51MikTC1vJJwPqgntwK4kuEhOmWdglo3OkGMKIEwgqERNgjCt9qVAGAtzx1n0Jlq9oywv1uwhAqpZLS0gHzjQfjcZxoO6kAPc4bK4fYBtHgtbjLh4Rvt9lcsuyRS7K0xE737HEJwbYGeA3N5nC0ZMfLgEoh5Iuqo3KoID01svGF3l/dNhPw2Yc/unXLqJVn6n/9mosDIio+4OumXFeRq53QnKwQ00p08NBYkvGXHk9pHH1o8PCAxOGyEfHXiWIzGzipLdlDUvqys5iPQYIO6huZkEN8FGg4hC/dS6czQ/7ULSaJ73uc5newRMGfUnync4V7x0W5sjjF60=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(19092799006)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yIcmhxe6qJdCdKE6IgxIVoMDA4Udypopa5Ai31DCOfWTQVoM+5NaJ925o+1N?=
 =?us-ascii?Q?P+mrmNzX35JeJwNCho+orIhsPfkLmQml+o+EAIn9nbedMgyrLSkXB+VBEYV6?=
 =?us-ascii?Q?6RXIDskY3IkOMRfn9KGDh/RKxR+U55DBQETAeaT/lI/cXNN1u3+ZGvSgNlvp?=
 =?us-ascii?Q?OXLdsNdDKEvL9qvE85Zfqo6XCnw/BAjGwbJiG1ZOOQ9hejNsvmXYgyBI9HIe?=
 =?us-ascii?Q?NvdQmyHqKWa8OXz7Gn3M0ydn4zxlX0Q/3eButLuqHAzCnGDc5bQH5+YVZsZD?=
 =?us-ascii?Q?uYbCYWKKBBgMGUi/ANn0pRtNJoGlhUUJyOYXYOvODAa509IXRSCP0D5wVmUI?=
 =?us-ascii?Q?xyeCWo2fanCE8v5Y9fro98JWsgQFhghmOs2LoXoydgJTer1+ID632PsGkF5U?=
 =?us-ascii?Q?9inxXMwkOnElnUF60x2v+aJfrAyMEuon20tYeqrEQNRGQNypWx7bIES8fFwe?=
 =?us-ascii?Q?F0j36UrieHfl1W7K8wySMDLRfn6qdbc3KEk/jgt/1JWr9YEUnspGoVLNdH6M?=
 =?us-ascii?Q?qFZOvaP/qwSC1TiI2JMhA+Kmy9lrRhicoO97OXJhTBckxoqxsTOuG4k8blkV?=
 =?us-ascii?Q?ammh+l6v4bWaa09mKUenlg+exDWW+lbZysJjAS1M36SA2Yv8+HKBKKa7oZKH?=
 =?us-ascii?Q?omA6F7u+5az0W05/B+qV+2zpkSFRNkz3U2YkvwIXcZ/wiV3t3g7ezkpw2nUR?=
 =?us-ascii?Q?gRdjOQ0jXd9rF856TDi5ovJKmb65gg+cnhwOQroIXmU/WhM3OgT3otJVPAQb?=
 =?us-ascii?Q?4U+lWpkjFNJDd1sZjyj7EiU6ka1GXfcJfJMeBu17o6K1QEcTavs3x2TPYzYT?=
 =?us-ascii?Q?YwYVlkDz7JFk12FrpCN04MqFm23vmv8FRwJDNVne63h+BBxj+vm8oGtLuo2d?=
 =?us-ascii?Q?wATGkyX5oZavjURhuTYRFnzlMNmcKU0D1JCoO1TR9aBM9QtUjrE6xB9yZYJV?=
 =?us-ascii?Q?SV+kQZUhCXmcSm+t1KEaGHOKBbVvWpWUwaqza7e6XJp6La/IWxpThwgoxbdr?=
 =?us-ascii?Q?3p3YoIfCzDbtZy2x2/XAoeqmKleF7guqHjtogiPUbpjeZ3LAB1KgP7bVb3HC?=
 =?us-ascii?Q?l40di73XuZtTQpMSJqzwOqkFAECih3rMGI5PquByPsyHHPet6G5gEcbMK016?=
 =?us-ascii?Q?uRu7a9lS0qafVl8OlmFljHUyRQPT31FUfHtXzfEw1y7W+JQ3wcIOqJcYrqm+?=
 =?us-ascii?Q?erRaeYY4nZGTQ23nYVeNpWbXA3vry+pTE5lXab1lx04+PFVn20KBt//bz0+Z?=
 =?us-ascii?Q?LA0mWT2pMMuGS5bw3tasWildpdG5MfFayLOssAcmh+CeaZd4nzSqZX1P8obv?=
 =?us-ascii?Q?o6PFxRRylNal6bDfxRqkqgouIOgkyXiJFYjCvHXoN6zSZ9Qcz9i+HD8C7Zi8?=
 =?us-ascii?Q?jj/KacT36pC5ntnka0aleHhYbLmI51seWMAehyAWLJH5xP4pJuAhGJmnh5T9?=
 =?us-ascii?Q?+abCGlh1hF6JrMd5ZWNpQ4Z6gFaH38MgU/VzpurINccRDujETQX7mvq1A/Ur?=
 =?us-ascii?Q?I0kZ2+dPtDZpRbANX5XiHSZrVwy7twUPQRKPlgbVVNLcZyM8LGvbCz9jxcFF?=
 =?us-ascii?Q?+O+XVFMSzgxkeWDWnZtLdbN1HT/70+7FgkjytZdFtgpfrrMeKFyS6ylvvtL8?=
 =?us-ascii?Q?t0tifqXrdllautWPMF6UC/RxmWDdm7S7e9WdjK9XsDe3QzGKXgL5Y5WPQ3DW?=
 =?us-ascii?Q?WriHkdTs9Xo+L/Qyc4u81gZQMNlYbXjPb4tvgvWWRle3ohzWzmt+466Lz357?=
 =?us-ascii?Q?pP6CTtgqwDP1sJeeSOjbkUNHvHKr7a6ZX87RxFjs1940tdmQtY1p?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b60b67f5-20ea-4c97-fd7e-08df18c8f4bf
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 16:45:49.1627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NuxLPF94pkrPkX7fadbpNUoo24f4Z9GYLW3BWI+UZmC0zy/SQ/UVXhHcTXiCbV60nHxvWlER/0bnAiCvRwoIAlyxQ21EaVPNhKVYTo/F4R8CdMWKAxgEsERJBC3l7eNE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10032

On Tue, Sep 22, 2026 at 05:25:41PM +0800, Binbin Zhou wrote:
> Hi all:
>
> Loongson-2K0300 integrates a CMC DMA controller with 8 physical
> channels. Peripheral DMA requests are not hard-wired to these channels;
> they are routed through the CHIP_CTRL13/14/15 DMA_MAP fields.
>
> This series adds support for that DMA request router.
>
> Patch 1 adds the DT binding constants for the peripheral request IDs.
> Patch 2 adds the DT binding documentation for the DMA mux.
> Patch 3 adds the driver, Kconfig symbol and Makefile entry.
>
> The driver registers with of_dma_router_register(). In the route
> allocation callback it validates the <request> <channel> <flags>
> specifier, programs the SoC-specific route register, and forwards
> <channel> <flags> to the parent CMC DMA controller.

Is it possible use standard mux interface?

drivers/mux/mmio.c

Frank

>
> Thanks.
> Binbin.
>
> Binbin Zhou (3):
>   dt-bindings: dma: loongson: Add Loongson-2 DMA mux request IDs
>   dt-bindings: dma: loongson: Add Loongson-2K0300 DMA mux support
>   dmaengine: loongson: Add Loongson-2K0300 APB DMA mux driver
>
>  .../dma/loongson,ls2k0300-dmamux.yaml         |  49 +++
>  MAINTAINERS                                   |   3 +
>  drivers/dma/loongson/Kconfig                  |  13 +
>  drivers/dma/loongson/Makefile                 |   1 +
>  drivers/dma/loongson/loongson2-apb-dmamux.c   | 380 ++++++++++++++++++
>  .../dt-bindings/dma/loongson,ls2k-dmamux.h    |  56 +++
>  6 files changed, 502 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
>  create mode 100644 drivers/dma/loongson/loongson2-apb-dmamux.c
>  create mode 100644 include/dt-bindings/dma/loongson,ls2k-dmamux.h
>
>
> base-commit: 0a8dda0a15d3926422d286567f945a05328a4ac6
> --
> 2.52.0
>
