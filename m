Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013010.outbound.protection.outlook.com [52.101.83.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034C24B1CEB;
	Wed, 16 Sep 2026 19:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789585955; cv=fail; b=RUuxZsXq5KS4h+AlhIc0hTvKvaHn4UKwKDce2j7Ba8j1GHrjgKmiqlpjORcfXyFNUyYXiyXhZYlDrdziV2MRSotZalbbxm0ll0sfOziQY86jO/QK9VjqBpcOwqldZLRury0B7gOSY+yQbt2AMefLTvvNLe3piSN5DR7XKGKIg1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789585955; c=relaxed/simple;
	bh=StgcjpUklLXKy/HF1fyKkty37iMSOi1rHdPBsBUJiSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ul77NiT2Rk2ZBaC1pyoj5FHV7m5KnUC1TMfsUd8NAPYzNKEkIwkemcwpkkHJfcEVbY3mVokAtZiihH9XTVZwiWr2bM0e8jIlkb8T3xSj6zWULh+VuD6y0lpQs1TKiJL8inHr3JBFzxlUHAXecRod3hFXsZq37mkKgFL6mBNrSkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NjlNzZd2; arc=fail smtp.client-ip=52.101.83.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NjlNzZd2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jNbeql0Vbld4U6780Mat9tR6Ny5I/JzFoPB07OVLlrRucEVbiDdHDXtqzzG8LXWf6tQ1o2FOA3GCUQj9rncsnvie3l83cztZMdqqk0exzHQqIwIydxPYAxQSqbXQRjmdTDmZkv1cTPPDVgfe7t0FYVNVjc5+YvjtRBadnLKEPdr9xSX572WLpfYqC26L8b581ri2SWcDV1w4aEe37Bzf9/RQBPju478e/Uldd93wFbiBSGUlRxRJ9t0dNkmD29WMUoOqUWgvF+u9zgGT3W/C9hrW1tupzp2up0eTgoZPzuHkEoxjgP4PXi+FhuIK8XYeR9S0KFUJt6YkWbmj9H7XeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQFzhs3tKfqG9WNrCKJ9cLQJzZDcra+mMfrgNaFnc+U=;
 b=ce94PRKF8LAaWzwr1EHDPuemjL9TyPJbFFwSxw4u95/CvqveL9kvgWh5TraIU4+BUcjP9Wrr1PPkoneStKUpdxybjy1icJrbLA2caIQPtIxfJRyFaGma9fxPRhtYcY9xngRjR5lRC3ISms72OzuKCCniKslJIE2KSCSiRM+KbSDhCZdPC8k+tYu9IYmsL8bcYWMkQi1Dc10exy/Bq09plVzdqZNKPWmCuLNdrnKxJUWKra5kTFW25VpKo/+55Cn8qs5V1Lr9JXDOdF27ZsVHwcKxFcBlH67bKHX/1SJgY6AvV24MHIHFCsx6T/CjekdLwpzcEasgEJZfQE0SEsGB8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQFzhs3tKfqG9WNrCKJ9cLQJzZDcra+mMfrgNaFnc+U=;
 b=NjlNzZd2SnhOwm22gBg1R1arp44VVu0mgAGw69oIhhzvbk7+rTpFRlZwgwzM9nxdcRUZbiwLHauvjhc1NhK5bhmcxtxLGeovkJyuXgAnkVljsa/LDePZfmmYS7Etbe+FAN/5nU7N01g0jNxj4GVjxr6r2GRTONJhizLA4jetaHwfTd4AFstGg7uud6fedynBwMO/FQUCKeXgTd3sQnr24UmmtzAfrlzP01ciiK+dktoFv2YBifFndOBIWRpdPMKDtNFyuKD1AX7T4+ueAYnWSaSANwoiEAEb7KZ1Ngy07xKekjssgd2KoyQSKSNAM7ear9tGoOZMHdUNf+IlrckL5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10046.eurprd04.prod.outlook.com (2603:10a6:150:112::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 19:12:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 19:12:14 +0000
Date: Wed, 16 Sep 2026 14:12:03 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dmaengine: loongson: use named initializers for
 acpi_device_id
Message-ID: <aqrqA7NZR5SIvYXO@SMW015318>
References: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
 <20260916-acpi-dma-v3-2-0dac05654967@thegoodpenguin.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-acpi-dma-v3-2-0dac05654967@thegoodpenguin.co.uk>
X-ClientProxiedBy: PH0PR07CA0073.namprd07.prod.outlook.com
 (2603:10b6:510:f::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10046:EE_
X-MS-Office365-Filtering-Correlation-Id: 49d5d677-4f57-4852-4600-08df14266a89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|19092799006|376014|366016|23010399003|18002099003|22082099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	dY6vQGNRirXj7lwW0+iaSrU9XzRa9XmH0/hwi/99qHtWMNGDH91I+vmzhdrl/DYBL9gwGRg2FmTS5siFwsReb7QRPL6oTJIdGFCXlRcf/nD1sZFhpa3WOPfwLq5eCXsCwL0X/EBCeSkFbp6oot/9CbkdsnUtsgy+dRNIKbCmSxTvEjQwVUll9kb6Kz4OGNKP20NB2RWQFC3FQ/ZNwaKR8K77DIq5L9V2jnkKURjjPLlt3Oj3UXF2TQ96yuOn1B+64vOPXSOORSDaSZXjubX42OH6D8b+v6oP22DEwGFtatx4ak9kCjOMNs/Qm8mFHeTQK44fEUNSzn2hEau8VKNTLE6n8Ey16od4rjBlPHKPwMm0CeTNYuUb7HZb8zrBjPI3xSO2C35HRFgxmA/+tolOqbq5QRNHa2qpDeu5AScT6C05TZ44POK1qSCy6++na57VSf2NLJjVS9tSMiFFNF5QJdtxE6Fn5oPIOoKVKcW9tqIcuMrhKg04BmofPMccj8/ul/Vc1fTSiDQOjhXyboD6jg76Gt0sHyIDwNVrB+0owEJvXBcDX9OeMm/kEz4A+GaYH08wK7ZK5mBno4k+9iJGt9FCc3jEaEQ3CI++ChmX78wJQPH0+7fKqJODBQJqqGHSPShbUWipruP2pm4J4+dB0xlfkDh1HOK36/nqx9IVouk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(19092799006)(376014)(366016)(23010399003)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?axrrpIB5nOup3jLr5cti90tfkAazef8AVY+VAodZZu5t0udxmKk+06ExfqXi?=
 =?us-ascii?Q?D7LEgRb+RhRHrI2+dlAhk+I9hI9+TjcgzhEf1Tm3PuNP9zhdb/9mAWVKGMu4?=
 =?us-ascii?Q?cDGAwhjDjR5msxKrGXGHDMyzta+Wyx4Sg90DPytKg63T9yiif71Fi/BabqCJ?=
 =?us-ascii?Q?ci5pBHbqjx1kXEbXldCsBpUIT9nR/5ZWsh20Eqou7ou2/E4Qo7UduFVcYuOk?=
 =?us-ascii?Q?zh1kaMcnlHIffkb+sL6+ujcYebNvsw/YddZKDwQHPxfHdIWAbyDCatiXpEVs?=
 =?us-ascii?Q?/+WFc6i43UxA+8kkCeZBRmhfBCA04eGh2HhMOzcAtFDhxkGd9e/j8NkdE8M6?=
 =?us-ascii?Q?Quh/UH4bL/x9rp43eIVNZq3NjUgn3sYVR3ycxlEvRlcAaT7WO+18cV5ZmuW7?=
 =?us-ascii?Q?6gEmm4J7MXU6txlEacTwsETmr0zF2HN098CX1xOv4jESWdm8LoSkxh7MchEj?=
 =?us-ascii?Q?IvpL14Lme+dg/npEdNbCxYGNo+rrq4NJNGJsdGSg2JeU8Y3lWJ2SzR/ESL1N?=
 =?us-ascii?Q?BeXp1SlHU9+FAnYv1s46uVLQr1ERqkDI+cT+BrpOQFub4OmyeywPBRRVVXQ6?=
 =?us-ascii?Q?IbhCoX8EHDLPfLX5PBqB8Udh1RgRbzfivbc+io95YJQ8BAJ8FRpiAEsugJcp?=
 =?us-ascii?Q?kE8BJrEFFHUnVe/+ZjCnRJYY/sST+y1/THJJPDCRJy5LdG71qNJOyAREmD+Y?=
 =?us-ascii?Q?RxGut4ZCSgO6aL3N3nyvFw8C2R2EA9v953Sj7VjEyPZvqnec3Z5ixPOqw/WO?=
 =?us-ascii?Q?qIbcE1uO4TqTf4vBPq7mvniq3z344FdY4oqQarJ3u4Da8OjmrYClJDd9txIf?=
 =?us-ascii?Q?YaF6sVCG+KI6pW6Dtrv9Ye/W+Dr2C4UbOCYgzHgh0aqMPFcIgZcem+3m6OAx?=
 =?us-ascii?Q?9/YxyS3NF8+sDhrfMVG4XOHFU7CKUPTkqh0ToOk1f+Gv8qs+os3g4wXgjtNc?=
 =?us-ascii?Q?2oAOnyyKrxOWA+jwQsQm6bAhdQ/FcPJl3xFtByRpgGowMGv8/A89wgWS0m9U?=
 =?us-ascii?Q?rqr7o7tQc6c+iPI1xg0443LsSrzNQisPg6pFlMAvBQWI9T6ta0lJmpOraF8I?=
 =?us-ascii?Q?AeFSPCz0MzVK2g/06xVym/gTR2simYEsU5SzSITtbc9s460vkeLy/oorl5iR?=
 =?us-ascii?Q?1YLFBwqU7vSBuAS9+eaEcYmIxZsMntiiIpYnyMU5nElsE00RXyNpKQGjVFev?=
 =?us-ascii?Q?zSbyLWU6K5T0artpaj9oG+DFWyrPB9azwAtVfWimL4NBVphsOVnxZb3LvtXN?=
 =?us-ascii?Q?xobe1efZF6TNOX22MDYv1MiAXARZ3Adu2lbGJqA3+khQD1u5lK41HSTrwXBw?=
 =?us-ascii?Q?UMSN99Eazrt0hOx7sxCMihShZ2/oBXrdf2lA3H++K0D2e+IUC1JRMHmG6MeI?=
 =?us-ascii?Q?SlrFS+t2uUW9Qt1NR2UogAa3W/ybwWEQ3Dn2nzvTDHnG9qnbLG8Z08TV7eMy?=
 =?us-ascii?Q?grgWaRJQatCxEsX+4pbyl0v96oB3uwG46Sb8B1Dti/kcymTEi+UE8tUF8fRV?=
 =?us-ascii?Q?TVl82mQrSdEfTYItXoy1osUSpAL5WzOgaHMMioqzO5JRItajq9NAr/IX0kkD?=
 =?us-ascii?Q?wLTm+rixlAc97CyTH99OtECoP2j+VinbD9BE9Yp4tleIVSuqpzOv83Xq9xNR?=
 =?us-ascii?Q?t0P9jhAwzmPBys1PBZuYkV193GYymALt2xrbQLyt6Ja5fe/k+m8X7Mj+K+6o?=
 =?us-ascii?Q?NQdgKAUUcGf62gY1a7gUs6nJ2v9EfSXJ2bF4Gfs8B0hNqdo6hp2Gr4yyE3Yn?=
 =?us-ascii?Q?bu4WptfiyzjD+HBScCY/hNipefxUEtcVKd6pYECNk1p/lAKcWUtD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d5d677-4f57-4852-4600-08df14266a89
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 19:12:14.1488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /K5Wu2b+pMmLKz7KCOy+Q1f8jzWVEdO8Nwyc3mC9Umx+XwCEZcogWvV1Nw/CJpBxlW1EQu2qwZBcLTzNYA+qDFQg7Up6LKgm5n056TF5zZo0ChaM4EP8gQ5NUQkkDqO4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10046

On Wed, Sep 16, 2026 at 04:27:55PM +0100, Pawel Zalewski wrote:
> Use a named initializer for the acpi_device_id fields which makes the code
> more readable and consistent with how lists are initialized in the rest of
> the kernel code base.
>
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
>
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> Reviewed-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/loongson/loongson2-apb-cmc-dma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> index 1c9a542edc859..70880625c6e92 100644
> --- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> +++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> @@ -709,8 +709,8 @@ static const struct of_device_id loongson2_cmc_dma_of_match[] = {
>  MODULE_DEVICE_TABLE(of, loongson2_cmc_dma_of_match);
>
>  static const struct acpi_device_id loongson2_cmc_dma_acpi_match[] = {
> -	{ "LOON0014", .driver_data = (kernel_ulong_t)&ls2k3000_cmc_dma_config },
> -	{ /* sentinel */ }
> +	{ .id = "LOON0014", .driver_data = (kernel_ulong_t)&ls2k3000_cmc_dma_config },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, loongson2_cmc_dma_acpi_match);
>
>
> --
> 2.43.0
>
