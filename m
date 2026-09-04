Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013016.outbound.protection.outlook.com [52.101.83.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D582E3A0E8B;
	Fri,  4 Sep 2026 14:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533048; cv=fail; b=Kr3Sg0qw2bwPfIcJF4Q9ZRlNIX2HRjuiOVr7P/OQSCl5Agi+0nurFx8vnrGwmXVCnDx7fI040WV0zdb9PDhKL/UgRSyndm1HQPUtKK/93cNZfIlXI5yNhoFO6IpND1op6PbI74ty3dk+Ap/7CWXRTnF7VgDDx08H7BvTcdFlUVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533048; c=relaxed/simple;
	bh=e5v5vIxjRgW0fpoecTz8YLTDV7YJGifAy2eEgfYIYG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fHK+/YGQlOscljMvSzhtJkHsE8LbflmtFmhWiME1F2cbj1iw+DyjKJFdNKDF2PIk3J9HZpPqYQj2v2uEjwdvGAAWsbT6CL7By5GW+sL+XXpaSbcwdaGXWVilL/X4xtWCzvy5lAMdk+xnWcWlIkqRriwlb/4KDokS4T3o8KUfSrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=w7J6pufB; arc=fail smtp.client-ip=52.101.83.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="w7J6pufB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdnsKdRQ4DVb2bISgZb1mKr5CIMU+MWQldTawtP++J0Oa5bnxQ6rh4YRAK4SuFe5Ymn6cp0/YOaxSjUOBr4/e/MMZEBgKa+FtPiXBM3MhcMbfh81vLF+KkIGzd/R8xQfxkvALCP2scWZK7pjq9UkuirSLleKNbo6H57BBPSkwU4p7Jzy6XU2fFVZFEbMJmq5he0549beBQ2XdSK7C1AFGXHBwH6k6uS6wl687ApfyxesV+dtH76oEMqfBPaOeR3OJ3mgDbouiR/ZxfhkST4g/9AIAQRMuwAAmZjKru8Oa4rGV2oFJQvSMiBuEMZXP7MO9eI/gvwf17GeVoXFZTX0Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPQRTEvEVd9Sha5go1NNcYESXsAIyFQLvFKvKHaGvEg=;
 b=xEksCiZDxtBxcmh7flzffJstJoDa43msD+au5wYyJA98JnnbRYrg301riijuWxtZrn5Vubxc8y7lXcBmIarDkxNsQ/P5ox6ll9v3Z8clfgMWkTPblepRmA1RN3OmFVybGpNUv9Y9aTpaN03imHHbBvdFEKCub3TZZsW1WDKodSqwqVmt/g4A2XsXXNBiRDtLwYmGdWf0i3mUG8517X6Dqxxv7JmMnibDggEPgf2RlFOwlxbjtzQt8ngl8Oz8FPI3+823oEkEESTFXIqILMMUcX5gXt4L54GwewKgbSI5iI+MJaC8U0GDx1+LGGh4fT2mSszPdUkrpP75f0wsu6idew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPQRTEvEVd9Sha5go1NNcYESXsAIyFQLvFKvKHaGvEg=;
 b=w7J6pufBeYrYj98EbmnXvPB3NOEbLvV/JZPD5vhg2OF2g6vbdL2Ujnbwy9JBb85ZkzAyx+ZWtE99vqQLUpNqCil/JpN4Z5dSm+vSpfyr6QNodg03e1Cmc/o6URloKGyS1FsRla317C/kzObWY0AOlTWmhwpBCGQbZa7jmy31OEF9lvbmAexwDOiw4XwT17lt8Df7tUmktb/reI7UD/YDNHyVc0qK0KlS+LscI9SYUt3SbLrAWP73KtszPV/5apppgl2z/qCKsgKwYCCs1kplYJUQbtV4ErWwSx0yAKQCNKiq9M/7PFfVtFT+F/Ww6lfSNEvUyOaDYA25QS7F4f9PqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VE1PR04MB7344.eurprd04.prod.outlook.com (2603:10a6:800:1a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 14:44:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 14:44:02 +0000
Date: Fri, 4 Sep 2026 09:43:53 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] dma: qcom: use named initializers for acpi_device_id
Message-ID: <aprZKXi7h1prHZft@SMW015318>
References: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
 <20260904-acpi-dma-v1-3-0fcc63d65d4b@thegoodpenguin.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-acpi-dma-v1-3-0fcc63d65d4b@thegoodpenguin.co.uk>
X-ClientProxiedBy: CY8P222CA0019.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:930:6b::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VE1PR04MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: ae609b91-d811-4049-f7b9-08df0a92f5fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|1800799024|7416014|366016|56012099006|4143699003|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QyY3Jt881BRnr44WSGAj2JN5nC+Bra7oY5+oWT4qr3vqw8K9CDTBOALw+dQVG5U9bCEFdXeqbqWj8w5KLQaaqVhkzpfrbz4gm4R8cWYT8sKLRQBykCNKOexqC8WmPWRhRmI57AqqoUMjHPaiR9rjqE3ZbXjfwGk2B6z1KKh2gCVHyCH3LjoXC5yICxbOTaiGQQcQiQtHBKakir29I5aMy0IfMvduZwTuuVZO9VJ/u5QD4oG4ptzf5foD30RLe9W4H/STa4fBarCU+JrLhLYqrlPgn7K3zl7DomA0Qe92L/55gxBeUz8UrNQACQW3iZWmpqbAobyqpkvSXreJcMK2N+Y1RV61x8HZIlmKwE4KSihF7VZN2IbBB9+WjEmlxOuPvrg7q/oqj0ezXjGvlNQ7fnq6DrBdbJXx75y/wyjHmwZuG0xNhCx7YfyhXIFy0UOCXBdukMAix9699Rl6eEeJw4rpUKuUvDRvEGpWslN3ha0ZvFZQ4t6kYFDLsrS61C8TyRIMVBr/nFlOEdjMEREh7Mjb+cJoWOR4SkCm4ETh0LUq4HkI85QC4/6aOs26Ki+pMN4dMqT5dt7p6x1MmqsAZezp2vEzSrJ5QeZmh4zncM8sKdZSV7WVwyhoSsDEVV2g8bhaIvARvQAfj8IynL+Ynn2VWDFKvVfbfxMI2u1s95A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(1800799024)(7416014)(366016)(56012099006)(4143699003)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7FWUtTODUGupdiwkyNDxmvPnp1h4vCQeQGH/c+SLL6TBb1i19diawNEOGIFI?=
 =?us-ascii?Q?LAyZjwS7TME/44BJTu5oRIwM1WxTmj6EBykWNrKu/5i91w1rUbNfIxNuaZIc?=
 =?us-ascii?Q?/wcwXn4z+C4mQK5CVoe8Y4HCSibz6lxjv2hmmM4/VcEe/XS2Vg5JNnHvaJk1?=
 =?us-ascii?Q?SKasglkg9y6ZA/eagak3DGHmH9fSSKg5BxooQEzisQ+xu623tafmZ46QxXUo?=
 =?us-ascii?Q?JuKDe5vjVyt0F/h6ke9yr1ds70h+4SCbyTi0ZPxzhhn8pcZi8lmunUHkM8Xx?=
 =?us-ascii?Q?rgaOXMCFocCjtAiz/Q2JW+UUfn6HltfHveQO4kcHGDFn0pORbW0EfI1uqA2Z?=
 =?us-ascii?Q?5t6KEkekWQUm6j/KC+38NSCzy71sl4885Q8h/kVjHoTL6h5/ESUoZ8oMQ48t?=
 =?us-ascii?Q?xP14HMtEwhS73EFkx0LFBGVwF1So9kXcXmlbbqvrIEg0pnhKoVE1WeZTr8EJ?=
 =?us-ascii?Q?35Xeo0p6z/UmSnmIGPilYKhsuIkRs6n2IeCGO8ppz3kRrold4c4HNzf1z6bi?=
 =?us-ascii?Q?5och0MZseJn2k6IhELvwyRDe4+395CBXPytoSCC+1ITXeMLGFttm4/XMTUx8?=
 =?us-ascii?Q?awtHXNYat8HnY4d6/2k0vkzQ/pBS9/YsFN5b/kTizp6n4bD29mo3qyStRnVM?=
 =?us-ascii?Q?WnkhW6wvXlN9DwwUoqdO/CBbZrzvX5ptwtqA5+Xsri59qn8m/EvDsF8iA9T3?=
 =?us-ascii?Q?B5n+Hj6KyrsNbav6rg2yLTELf6CtNTII3F5l7eDdK733DTLyZ0D+2p+KFoTV?=
 =?us-ascii?Q?+w7v07gJYzlZc6f3AjOb+s3UDtdhiOB+mKoWNJlXs6ODklcOIPqnL7GeX+Mt?=
 =?us-ascii?Q?2lkFQdJTMheo/9GdvQ5VLc/08TlCaDgETGFjNx52YCzaA4qc7sJd5otW9vL4?=
 =?us-ascii?Q?ctD8wPtvQlj96/mLNvt83O3qfgbQBD/TgRSKQfSOdUEJtKfB0w5efe9e6MR2?=
 =?us-ascii?Q?V3CaZVVW15YDxGMwkAkEk4jHeYShFxL0nEBMB9Hg5nKDQMuc+GBSmOHvm37u?=
 =?us-ascii?Q?W0HmNK7z1UVeCWMpgmx9M9g8v+QfXDL4gX4/I2KsM81omHFv4fmp9qM5cziW?=
 =?us-ascii?Q?Q1UjLBW+IPYuvYfm23nhb0BBNYx+4jYi+yHNkW3f3/4zyC3innv3odZsY+L3?=
 =?us-ascii?Q?jwdhgOGaf3LjRMbwbuxrpdXiHFQfutOB81QeJBEr4y9hkfkO06OL0jel4+Bd?=
 =?us-ascii?Q?O4L4ofWtMdmBtknFm97svfkz/uNZxZwIeI7XlA6J19ab+P0KbfwVkr+Xucl+?=
 =?us-ascii?Q?5HundEEfzbBIjJPBnAlAmM68O04x6a3tKXty8jqosXl47NoqndlRSdPeJHwk?=
 =?us-ascii?Q?8iuHb2Fjb5YQi2ObpvLyoLMxCmVehst+A4p2g93K3BOfmSYp17XfJttp7lCY?=
 =?us-ascii?Q?PXmUC382yHK36BVRkiVGS0djEPgQgGHNYEYXbLt7hrNKaC+XE0h/hYAbIk36?=
 =?us-ascii?Q?Qe6LshsOD6xrFJTUaCr+nM1Z1P4H3xF244OTyifTrPXXdDd9b9fRcqjz0HWC?=
 =?us-ascii?Q?4bT914AtJOM+o+aFvCFcQnkX5NwwoCA0Op5mg8wsgo5gkB1kSUHlvFnok35e?=
 =?us-ascii?Q?xI8o8fs3zzanZ9idStsBoqX30nXX51601348pch92YgekiBlgIyxa7jn+dAe?=
 =?us-ascii?Q?ysRZ9iGxbacLbM39mNxKrYAIONKSXUs6hCK1eOAMgxvUhQlMS39/XC/1nQAj?=
 =?us-ascii?Q?qU5M8R71eFaxwQ59kxNTcWcSnkyXf6fCEjpOiFfWjlPAhrgfulXxZaJvGNbT?=
 =?us-ascii?Q?baupSv7iAb3bJUTzLH3j8sQBRZ5w96/EEO+L+QbC1anTS9Ntl+Hr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae609b91-d811-4049-f7b9-08df0a92f5fb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 14:44:02.1179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPH/cw6WGHpdtU7HxpR3fIVrWoEMytRAQQRJHq9gynLglfA56LZ354Kw3izRrnbArFYisuIBhrNYFzB0eAD/zQtMjJkMihSfxxAWomr1HA78BD404L++I0+DllpdEOw/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7344

On Fri, Sep 04, 2026 at 03:10:42PM +0100, Pawel Zalewski wrote:
> [You don't often get email from pzalewski@thegoodpenguin.co.uk. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]


Subject:  dmaengine: qcom: ...

>
> Use a named initializer for the acpi_device_id fields which
> makes the code more readable and consistent with how lists
> are initialized in the rest of the kernel code base.
> Also drop explicitly setting fields to 0 where it is redundant.
>
> While we are at it - unify the list terminator to have
> a single space between the brackets and no trailing
> comma.

Remove "While we are at it".  Unify the list ...

and wrap at 75 char, check other patches

Frank

>
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> ---
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
> -       {"QCOM8061"},
> -       {"QCOM8062", HIDMA_MSI_CAP},
> -       {"QCOM8063", (HIDMA_MSI_CAP | HIDMA_IDENTITY_CAP)},
> -       {},
> +       { .id = "QCOM8061" },
> +       { .id = "QCOM8062", .driver_data = HIDMA_MSI_CAP },
> +       { .id = "QCOM8063", .driver_data = (HIDMA_MSI_CAP | HIDMA_IDENTITY_CAP) },
> +       { }
>  };
>  MODULE_DEVICE_TABLE(acpi, hidma_acpi_ids);
>  #endif
>
> --
> 2.43.0
>
