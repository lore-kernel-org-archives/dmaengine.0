Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011008.outbound.protection.outlook.com [52.101.65.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE9E3E008A;
	Fri,  4 Sep 2026 16:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537683; cv=fail; b=J8hZmsmgQkO3CuEXEMTAE1b2x8sDEsvMEeYoNV3JuYEZ7uw3KGP84nhDdNwCFFj+kLHtnkWZtsFzq1+jGS9tMjstmX7llJDSEi+rjjnYzVVak6l6R8x/all9IdJtrNE8/C5JdinTxljPKmm/ya/H6v+5weq5UViau8m5clz1b9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537683; c=relaxed/simple;
	bh=58e3fxoyb/xxF/7qS8mtjqafAukOF+QKPXkoSDClGPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mfNfGJ1k+8kEu4NvtqISt6vdUKGoiOc/OgDY4/+xtLFQdRWYFeG33HR5AxIDVtOYvIiqcFjxtB7gFXA7ayF7ME8oo1Jdy+3fD8FftWJg6yR3yi+hbfNWOeH4ssfGQIVTkJ1EkStTZlYT6iFW5vRR6RyVmc+imW+h8SJvqihMVRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Z+TGWUzn; arc=fail smtp.client-ip=52.101.65.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Z+TGWUzn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlpd7RpJZMBr6aJgSKFqFn6M7RhEjDd9W50ojP3u0zFNn/DwpZ0fNkdTWGrwO4uNPXpHnElkPxBrY4l8fUkizqwxPGujhbCmqVd4RdHLuSzzPcnnk5ME3V3wTefAoOISziH+NukM6fAj44TJVFznsu5F8d8M7rnRRjMgisr7LwYwOkC2Jt1KU2J3uD2Ca2+fnsMegQACzyXDKGPBHhJE10Ml2Df6Z6E/PLGHzZE17X7wnINiJQBIhcl+oww4w5kMOgpW08f29TIfhKoxW6WeUdEHy8ihjqCklZJm9V5jmEybRp6EMB7430Y8BUm9Cl6s2vZgDGpu2x557VNeZz3iRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5hJynYPpHQDNmMm4OXy2iLZNSIeAfURS7sAyMu0ISE=;
 b=tYfOpnH8Eu7h9+4LUOUKuZr+eBYTur4d4EAlCvckNMRxINBSLtcGL9KWMOIlozY/V96E0Gh1JVBk5cRUeyNjr1gv73JI41bkbslecbPQMhUjGBLIoFHfhAQOEK6oABmKdkSy3j/LEjk7UQj4K09CGlioyMOTgdZBGNKo2rNsswMqnOpG7ojmM0PGvPE3IiVd5xNBHomxy8ewvZxKN2nOhXMtl3eVNuvGDpLvA5YMKDcNWYvbOgInTNo/pPlyqxeKQH0pruMbY6Z7GqPn1TtSfrGLwqb2FHnVvYWEgBKuEd4SwMGKhglYLINewxZZ55lMHCOZhUMef/AfzngG3EMfqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5hJynYPpHQDNmMm4OXy2iLZNSIeAfURS7sAyMu0ISE=;
 b=Z+TGWUznu8Prp0pq0aKyoOFOhw8mRSXFYdQ+GdM/ORIvMfW/RHpvPCegnwpZfL4idCDgWpy3INzrE1IuiqiiIhUN1zAYthGI2dwQPYXDQjbfwlUyG4MSddXiRqD2d6S/DOD6zfl+lY1FqAbslEG3pB01eA3SvnzQZvqU+ue+peZrCntvB9jzIqtXnZS1LY/G5nzddw3eckmlR/st9wQfkU/FhM2GuvdFQFdZlFjKk2sdMaUAMPm5JcS7BI/vEzOpDutFPs1N5BBEG6EzCuTJ/dA/lwR2cbRgUi+jTV7LieA5NxbFnnAMqHJJddxE01o6T/DnR9RblAmnrMwKKX/qRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA6PR04MB11714.eurprd04.prod.outlook.com (2603:10a6:102:526::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 16:01:19 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 16:01:19 +0000
Date: Fri, 4 Sep 2026 12:01:11 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Pan Chuang <panchuang@vivo.com>
Cc: Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	"open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
	"open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 11/26] dmaengine: sf-pdma-sf-pdma: Remove redundant
 dev_err()/dev_err_probe()
Message-ID: <aprrRyCXBUpHf7Tn@lizhi-Precision-Tower-5810>
References: <20260709135846.97972-1-panchuang@vivo.com>
 <20260709135846.97972-12-panchuang@vivo.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709135846.97972-12-panchuang@vivo.com>
X-ClientProxiedBy: CY5PR15CA0063.namprd15.prod.outlook.com
 (2603:10b6:930:18::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA6PR04MB11714:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ecd23e1-6bd8-4100-6332-08df0a9dc1d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|1800799024|366016|10067099003|4143699003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	xS5HgTuBeHl8hf19uT5ztx5CVlxDqZ30+vw9ACERWkj/2PCGJ1zciMRqAMh7Dn9NaAMr3u30vvTI237qbrUO4kW3fa3UcR0oxeRHXhIQzqXi+h8GbBvXlhTByeDmWJyEpt+YPX6oFW6A85jnUIhkaacJa6k+0lFozD8mmMjG6rl7XIjoOKuLHo1wSZg3IkgCsTxOekVNB8wkEji7cvkwybaVXI/UUkUHq4ArtGviQOBMUSwbBOA8J19X1xWA2LHUUHdvEyKqF0x5EEipKr/gMKJZYZZnYo6fyXJqokQ7q0MBLN4Tvk8rt0gEEgRd2iOECU9GXUDBgaO2SARJgpTz7vB9CuZGZqjliNR+JtjuLuTtNM4p3gMTx+NgXTZ2QbfodalyhNEmuyl0UoJvByaePk/tSAQ4wLl1qfrHJyPLdoh9tuKLrZLUgUzzbYlzeXm1HLXD8sIQvYDjXFZ8ZJ6E4qJTvkcBRkdTC2TCQT6bw+D4HfNr1WP3N0uu6E8Urow0cQz/W8c6kZkSUs+HG3qgDpXBXRLX2YCdOnA7WO301/kIwNmkN0bo8H1hAGnqOdWWcwgLb+u37Zs8rEd1uuY54KJlIXThzSSWcXf++7X0m7wYbvMJYrEvPA5qjTXsoIhZNaqOitXly/fLZVnPuK71VqccNb08pOJL1oYHHr4f/mI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6I2EA3xcxFQxgMrkPzk5ylnhpg+EW1Z92AdNGwXTATKV5afJlbrrMJSIGniM?=
 =?us-ascii?Q?neKcFwmbUMzne3HnCS48+n04ynSn1v+b4MBFjpEwGpLQXM2jQgByHTWA3Jok?=
 =?us-ascii?Q?NmFk1jgvVQ4yc2iqvf4ANgfRdlmZmgFSG5sTw53yMDUCyem7H3d0IXaVgicT?=
 =?us-ascii?Q?VEynPpM049j8CuC7cn8o/m57U0Oha1nbfEes+73R4LStH1+fzgAiO0pYSSRH?=
 =?us-ascii?Q?hGWY8wqo/pcQWsLfT2eFRt2Kjk1YbL0X1yPU7cuUpG8xqZdVfJCLTa94+5dj?=
 =?us-ascii?Q?pUxbNEKKJY5jYdGwMLRlLGOfFjZeX3kQxlFJGWdMHsDJZ3WuOPeHwoqolmG0?=
 =?us-ascii?Q?whytmL5vWpatRqi1tEvS1ZOpWAUD6s9r0So6AX1XJPOp358jzclq0RDNTfGk?=
 =?us-ascii?Q?99a7VH+fQe3duijQQj/hCci4+e5AJEInhxqxS0Ly5yZ9e0l+abOQjDZVVREO?=
 =?us-ascii?Q?p4ol5bEuhWKmfcyRVtW+Kya3SDEB5G0fOOxrZDig0+O8hg/ekpEwbwTIsxZA?=
 =?us-ascii?Q?nEOhV3LOhIYPrUFB/jWBB64oHlFgPPGP0lgZwxJ6obMswLOsIH13bqIGkLZf?=
 =?us-ascii?Q?sX+HDjmmjBaL1JH9EMsTXN1a3CeC0hXXsGoSs/aGXw7bhZ0a3pSqZOrIv4Q9?=
 =?us-ascii?Q?nmmucjGy4abjsthrmkWcEeKAMZNNXqRS4X4QdzReNRHkSNompLQfu0ssAcTB?=
 =?us-ascii?Q?iJ/TbHBvVdRh8DGFXv4F3c5pAgjJPBJ4RsJsITgzSuFSOOmvZBNeA5+In0gF?=
 =?us-ascii?Q?0ySFDHZOIbEEAeU0Ert2ywHBHM6BasZJ01qYJG3ZeGL+R7cItQVSrYGvvVO4?=
 =?us-ascii?Q?zZckpEupFJd+IC0US0ApNNc/k9btTHaYVvBOhtaRRevxnHIDLbE19nJflOeI?=
 =?us-ascii?Q?3lc8kGGI3SyvGnieWSvvX+Ga1m5gS6hCCw0DvStcuyS9X4pCa5QZqxuZ95ek?=
 =?us-ascii?Q?Gjt+sIEBEI1fxC4cfYtRWWF1xUe9IqN1JXNR3NJgHqdU4h8BZban/4AyrGNH?=
 =?us-ascii?Q?o+CwnWCdi/er+w5ddLYrmIEcd3xqiGrsX7UGK4CVWHqcmChah2vLUYCGvlqL?=
 =?us-ascii?Q?RsmkUGFhnEOvWeBL59Kz3b9PghcbmW7o7P/1S7JbyXA+Fsh+x52Flxg4NiCD?=
 =?us-ascii?Q?yoURVKA2+e3+yUqeH4jxu0YnydkkFC/SStuswwz3uZs8EbIcJUkC8NRdI3Q+?=
 =?us-ascii?Q?tK0RhapsPBRIZQt9buMSDPRayFj8Nx9dON/eE83LaODglqNxypVuP1+2B1Us?=
 =?us-ascii?Q?EbH/jfLtTyM6nUGzyUfeTttRNlhSfzwu4jSjXr8svV1NzvjsV3CAHD66mWz/?=
 =?us-ascii?Q?V4zIIycZ4efZjkBiFcXclolB+HkXl5K1dN3AOdwbjC1N/dViWrrCvz2BfeU/?=
 =?us-ascii?Q?mdwkaqNpOaugOzDbO70DnCn91OzsJpKAVJDDlQhvSAY6UOfEJJqfVJ+7o/O3?=
 =?us-ascii?Q?KtfURgd1MMpmbmlV6XLBH/cGeqVQTyuY9PIa+CJF+sAnW3ECZfHyPr7vw2cu?=
 =?us-ascii?Q?2DyYdhea6d9Xd3UW+V/LCKpd66VVzgD5/lwWfsuXauKjTYWg8PuJ0nQND9Cp?=
 =?us-ascii?Q?WKWnZRJxQDW0lvy0nfQXgccNrhnGVIeM4mMOZsClquAYNj7Chz+OSDN3KAIz?=
 =?us-ascii?Q?UUA7Py/8CyCsP1kvSJaqrLZuroGjVBF4smhPMS3Y2yVaA/L7S0ouLkcFFsdM?=
 =?us-ascii?Q?DLPLo7CXc9eG8A/jzHIFlrE/7n0/7GLAActLsKQp5Cd9Fn9KCyZMoq6fftjV?=
 =?us-ascii?Q?mULZxE5WvlLfoVZ+Fk7UE9kMQnYNj8nTYi55SLwApYTZC+gEUcbH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ecd23e1-6bd8-4100-6332-08df0a9dc1d3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 16:01:18.9508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOXtqIWFvj7fkYQ4K+sIAIA/JV3Rcgsg1i9LFuYzlLgWqWGisLWPyZycOh9YgZ3Bvjh7gRv29CbYT+8RgF5uFHnvUv4U7ZmlYOZgapxBoMGk+Mp/Lh0KDGY5AQInYcNb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11714

On Thu, Jul 09, 2026 at 09:58:15PM +0800, Pan Chuang wrote:
> The devm_request_irq() now automatically logs detailed error messages on
> failure. This eliminates the need for driver-specific dev_err() and
> dev_err_probe() calls that previously printed generic messages.
>
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>  drivers/dma/sf-pdma/sf-pdma.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
> index 6f79cc28703e..5e5694750c57 100644
> --- a/drivers/dma/sf-pdma/sf-pdma.c
> +++ b/drivers/dma/sf-pdma/sf-pdma.c
> @@ -411,10 +411,8 @@ static int sf_pdma_irq_init(struct platform_device *pdev, struct sf_pdma *pdma)
>
>  		r = devm_request_irq(&pdev->dev, irq, sf_pdma_done_isr, 0,
>  				     dev_name(&pdev->dev), (void *)chan);
> -		if (r) {
> -			dev_err(&pdev->dev, "Fail to attach done ISR: %d\n", r);
> +		if (r)
>  			return -EINVAL;

should return r, like other patch

Frank
> -		}
>
>  		chan->txirq = irq;
>
> @@ -424,10 +422,8 @@ static int sf_pdma_irq_init(struct platform_device *pdev, struct sf_pdma *pdma)
>
>  		r = devm_request_irq(&pdev->dev, irq, sf_pdma_err_isr, 0,
>  				     dev_name(&pdev->dev), (void *)chan);
> -		if (r) {
> -			dev_err(&pdev->dev, "Fail to attach err ISR: %d\n", r);
> +		if (r)
>  			return -EINVAL;
> -		}
>
>  		chan->errirq = irq;
>  	}
> --
> 2.34.1
>
