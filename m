Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012003.outbound.protection.outlook.com [52.101.66.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5392D4AA1F8;
	Wed, 16 Sep 2026 19:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789585994; cv=fail; b=jO9P+2VtaySMizF02P8inP67lb5h6cmJcphIvXRApuw11ItJXvXs8AEc1MKTO5rNuihtBuYdUoSfU7+GqdJnpg/g8so5vYt4Ly44xLibbfTJjYFQyxDix6mR8iOswuHtBXDUwDCOYy44/dOmHECpkXraLndA030sAq3nZQj0+d8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789585994; c=relaxed/simple;
	bh=LIVldgN7YrppCL6m1szJRg9Gd4MvEvOyFU4vv8PTjl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uUb2uNOMsHaU/Hhig6oSijuAACnpqzdB7AYXaZnTKQMcIFTf5uft8U9ZEz23LXAAPKBfmev8ge2+Yxyv4nR7qfFgnYi6nb42C0Ufo8yArUVhBxEocGhWPgovhfZAvw8dOzb9TUykOkevhHOmN6ZetIZj2NJGvfMw7Qykw8uEdd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=B8eaR9rt; arc=fail smtp.client-ip=52.101.66.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="B8eaR9rt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Li4UEg2XRCiIXEHmtyBAc8RxsyKLek2T7e8z4598a3/G8p8zOPnGyxYwai9kizu/mIJ065LW30gW/d20CRGbly53nfHs214eaTmG+mJPN237gze1v4E6c1bM47DUWKsZ51Mxv+Ad7tESe8CBUOKtCF5wrZiRdLV2f8dYrRORKsOZymUUY04JeFnId4BkvxiYFO7WPNHOqXjuVpWiHop5pTkM4NJB8hAK45KYoH5APVGpHF0MiNlFJ6GucFvffcZ5msbC4Yy4gZFibyYn60F3UM1a5DdDKDdmcfb5TFoPgiMx8uwizYWPS+OGAdUwnNuXb+y723tFjpNBe5QQ1c865g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLmZx5PiNJKmLyqF5sKa7phCIZaEzPf4kqitGDD0S+s=;
 b=YbL/EYvj4J4XT+YBHFYCc4j+NpivQPVSszsreaPAdR1FDqzyOIZ+l/Sy5trYPERW3/4Ryy2r8HDoJCJ57SWqIh73iM1gGbnctpn6e5BqyLuDmw4OuKMrvybTChyDoZHBBsyvTPGEeYn9U3gAfuWii77+nhPjbSxU0u0k/oPZIqnbIGa4Fsbe+pyRJS8x6l/Pb+NFGz2S10r32dHdjMwbT2X9JprRajxJ6vgb/BryORsolLMIwrpR06iBbwL1uvFd7R34KcxnjL3iF0zQ8S4UnMRchDTQzmDxbqQ0t9WwsYXMw0R4Qmzq39joVL9diZ3pB4CAfojzcYPfA8F58n2vfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLmZx5PiNJKmLyqF5sKa7phCIZaEzPf4kqitGDD0S+s=;
 b=B8eaR9rtLjmgtdluaCrDY7qcq6Yav0Epnxz+whEMhizfiyK4ouwyRMdVxq/DTO7lVDp+5RPNUjSHNQRKyEE/w6gp8a2W9QK5dbLGqNf/jxFIu/Cm+FvHdbNhhYrFuNQsTVSgQeDpkrV0DqEgfACm+CUGn7ezJBwfMvK1XX2weXZwku2LaUBy26jMrvgYNM8NfoXiEZgC14CxQZwb18Q6FSv1pqW5QAlwBarsArwLVGuaqVajGnRHMd9WFcPnYkXvp6ECzUiF2yyGqrDl6PTqzYSBeBTY1NLHPgPrqPHjkAxbUsUC+pqCokkEOOziRw2gP/b+GFtu8KR0s+2RFNTayQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10046.eurprd04.prod.outlook.com (2603:10a6:150:112::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 19:12:43 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 19:12:43 +0000
Date: Wed, 16 Sep 2026 14:12:33 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 3/4] dmaengine: qcom: use named initializers for
 acpi_device_id
Message-ID: <aqrqIfn-NMtsot64@SMW015318>
References: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
 <20260916-acpi-dma-v3-3-0dac05654967@thegoodpenguin.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-acpi-dma-v3-3-0dac05654967@thegoodpenguin.co.uk>
X-ClientProxiedBy: PH7P220CA0117.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::34) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10046:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f73a18-231e-45f8-0081-08df14267c39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|19092799006|376014|366016|23010399003|18002099003|22082099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	zYn3V7QvXMV4Zk6aOnphhjh88lgK4o8Vn/VygsZa7yzUFOvITQsonxFH5/975gTsZWGEGK/F/4WWiSMljv8A+N09R+qnStiDynwwD1s444gvfkUIa1k6JM0W+ZV/NhjilDw1hcbJBCZbifeL5x/GvEebskQZKH5rOTqJPQ2/b7VVZt2YM+CW7p2R0wDVKTe1FM6TFkOnNgB3f55I5Qf6eAZejsaSwvptd660Kv3Q9zhq5g3OrM98djFONvtmED4nUK3e4HpXZ+tsZMS6CEzsf6B4wH/Bm2nk+xuEaKkxksRRs4f+MolWhn4NEbiIEGpQDPVc/tiz4or6sEKElNUcYxUNAfGy5xwqDo0ohVXYbucBuBTWRBvkprkZFzyUDJ4nNvEomfhwXNfRngFGkhlr3COPQu6tFlhPMdoazA7fvgjtJThDZ5R+9dHK8cFbTSCWCTPr2mi0X2YmfUYgOgbl9BRa9IVBfjRJqCQvzYrOb9dOXW2GnHHxIcNT94+TVw6V2eCWiL+tzCfHYoEQ7XdI32iJg1NuE8GHtXVzclTUCoIun5iWX3Gui7PRNGaHITfmQ7z5isbAzr+O1fZ7o44x+yh72yAmA81GTa9ev4i5uMvz1HE+XRm6/OkdPsDdXFk1WNCOyE3zcMblmhOf18bt1Z56YIhxfu+zr79MaPFrHLE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(19092799006)(376014)(366016)(23010399003)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dxPMcxysQzEyys5wrd7dYG2vF/XM4BfQSvzqTbCC2uC1Y/BR/H8izvZArWS3?=
 =?us-ascii?Q?UkEiomO8uxnLTRetJAx+ON39jxFOwAHTLvQOP7XTlrmxZQrLgFWe5ayIuExW?=
 =?us-ascii?Q?CT/yDsaYgVb213j6BXzLKFEvz4Z1SCzVd9qj65AvgM6hAlE+ny2YnhkyANon?=
 =?us-ascii?Q?eIzxDL1sWU+FZugl/UurvuzAq9N5oKBY5Pv8Pl8QG80KwbjQxGXTwfliR+IY?=
 =?us-ascii?Q?DOaAovtnw7BwOCSPR52XSRVMm8yra2T+syh1JWSD7jlPhACSp5i/knF/4Ji3?=
 =?us-ascii?Q?tEOxyjcnJzaZHqhspZZQkkYwDop/0DktxglMIKajmgx1A6INixv76R+GEmzL?=
 =?us-ascii?Q?izBK1cx9Jd7h3/pbt2D/27zi2oHrEUffrL6FmuI34pjBzKMVkBnMF1xrz1Hp?=
 =?us-ascii?Q?nUZxwN+HqzJ9WHS7U5Xna2/HX5gtveqm04Shzt43A0pzQCtWZ1Ke5kw5pkBR?=
 =?us-ascii?Q?XWbaklhiPOX3nupQJJvCWJdo4p3U5lZgDOo66YCti0CFoyVsBH0SYAiozycI?=
 =?us-ascii?Q?xkAK9p6Ov7mFUFFmn/WGzCimEIHx6NcDZgichSwEAzu4LclR0E2pIVTfzK9C?=
 =?us-ascii?Q?I0kpkzjSkQKmhirRO1roIBfQ+2n+GQPuiyUGeCUO7Y6/9t5pk9K1kD9m1Nqe?=
 =?us-ascii?Q?AcFSqYFb1A1gszxdq5GFgQg3nI+ccZgFKZw/e/h2GSZmRTcMyXeaQZvF6RDe?=
 =?us-ascii?Q?rVS2NV1DpCMQbAaj42xFNwA8uUIwzewyr7ixlvxXfFZh1C68lUQp4bPOlQgE?=
 =?us-ascii?Q?92aJjmgPK7ByxeJfX1nahK/tn582sYHGZ66VVUphN5ypmm+MakOrjvVbEbtx?=
 =?us-ascii?Q?3dDdw1jRA6t4Wg4tM5B1hZ7S1SZFiPM7mVaTeAO/0UgRGDTFsrmmKQdSKK38?=
 =?us-ascii?Q?cAiHMpgrkMUwl8XwdSIf7BP2tM4SUz9dmQSpPR1eUADQAMynEn4Zf2EjuCcu?=
 =?us-ascii?Q?zz0J3P18rPFq8pfxlctkSBX9Ez3xURMuyw57lAfATc3Dr8G6M4bebxkAOiW0?=
 =?us-ascii?Q?03nenmTMmxYyyO9z4TuQd4fWE3QWRcMyhjubj5xFsAkI+C76HPKzjCiFAyfP?=
 =?us-ascii?Q?80hIM4ow7hhxU/2NneXQdKgzIPqOlPoFJav82yOKLZ3gx9QBKMDfg9OIBgEI?=
 =?us-ascii?Q?+R5nC2svgDi0K8UtzNF+aWaXgS+ubjYIfn6e6dz/ozUtAdxeD36KD3jIWQmm?=
 =?us-ascii?Q?vqXJB50id1CvVzZqsdbmR4RbLpxvo9kLs4C52omXviCg1gd2xI+pr8+mi4m6?=
 =?us-ascii?Q?90ZD8Hdof1EJsAGOixCm8qjJuCBwbRGbUJKCuN5RPFxRCrD8Wbqj1AjJdEiO?=
 =?us-ascii?Q?h1UyH4Tf0mv+UyKUm3L+fRhYhpHXKPwDoOm/1/JUXRm8K89agWgkKQEOmC+l?=
 =?us-ascii?Q?X0WECNNVlKml3GWk5Oszzyjdrlcz4y8Mn7ZDMFULxqdwUzxjssT2ejDKMx/g?=
 =?us-ascii?Q?gKCOj+IUHWwIuRXC1ptCovgloow03fFBcBk7e8izci94EsFMQfjIkBnQcMT8?=
 =?us-ascii?Q?clir6G/WOIH7KKgMuwqCuTpGOK00HqfrfMJ7I02Yu+AuHZ2gMFc1m32QXqH9?=
 =?us-ascii?Q?kvs2OSyw/hP7Eet/Y6uelyvVCOxR6jqsbzCZm4czSHoYKJ//41vtwq7AeOsW?=
 =?us-ascii?Q?+1Evkt/2r9xnUpm9YZBeMY1JfqhkCO34BNedVjdERJXtE3q7y64gdSpMc2dB?=
 =?us-ascii?Q?8xe2jfZM7cwFkZ24clEbt2B0G3yhHhAhOpGxdq1P6SaWHlzO8Ji/4pBJ9YS4?=
 =?us-ascii?Q?OP/8aWegpsv01OF9x0MLQWKOim/b/FytRR/7f5Xe9+MUESOqIJXg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f73a18-231e-45f8-0081-08df14267c39
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 19:12:43.6990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEkwC3z66hYPpjAYhxVvu7r2PsjHdMvhpyt4ZO8w5AlBg0lb/rwHJ/cVNzssIzghhwXH6376BDX1CwwohtP4yeKmJ/LkixVdLupK8ud4PB37k5R6tCqhDssdxIQfkwm4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10046

On Wed, Sep 16, 2026 at 04:27:56PM +0100, Pawel Zalewski wrote:
> Use a named initializer for the acpi_device_id fields which makes the code
> more readable and consistent with how lists are initialized in the rest of
> the kernel code base.
>
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
>
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/qcom/hidma.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
> index c939635be21d..1349066b1544 100644
> --- a/drivers/dma/qcom/hidma.c
> +++ b/drivers/dma/qcom/hidma.c
> @@ -935,10 +935,10 @@ static void hidma_remove(struct platform_device *pdev)
>
>  #if IS_ENABLED(CONFIG_ACPI)
>  static const struct acpi_device_id hidma_acpi_ids[] = {
> -	{"QCOM8061"},
> -	{"QCOM8062", HIDMA_MSI_CAP},
> -	{"QCOM8063", (HIDMA_MSI_CAP | HIDMA_IDENTITY_CAP)},
> -	{},
> +	{ .id = "QCOM8061" },
> +	{ .id = "QCOM8062", .driver_data = HIDMA_MSI_CAP },
> +	{ .id = "QCOM8063", .driver_data = (HIDMA_MSI_CAP | HIDMA_IDENTITY_CAP) },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, hidma_acpi_ids);
>  #endif
>
> --
> 2.43.0
>
