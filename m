Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010027.outbound.protection.outlook.com [52.101.84.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D68382374;
	Fri, 28 Aug 2026 18:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942790; cv=fail; b=PDUTr10mNm2TARDTvBbVdscGAAEGWpvrw7Bkx1PyYr/6QQ42c7tDRbhVTPll8BQbE5KbBBPa8J2/08GWqEZG4rZAPZcSH3fRcVZ91532aeAmpUZrebfFiMtGwP2+bduV7a9KUzoFdS+xkw4lFnqCP/i4ooElPQ9JMxI4xtYUKPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942790; c=relaxed/simple;
	bh=bryNHNkpqDuuBT8YayYZ7nyHCmXg+BsiDbEQ00064PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=euyDGXmNhwKvLsxtFZX9xK56IwiLTT1l2+GO8Gg7sGOoIkImYcHMsfYOanjhLkNFJxC4Iu5KLteX1IZVlVexo5+j9W53ejQExsMBVqWx48GnvnwwVIuIJK7k8F4GcBbK0/ef+rR+w8Yo/3TUjpZujHR1ZyLdk/MXqm7XENDFT9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lt9Hgox4; arc=fail smtp.client-ip=52.101.84.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lt9Hgox4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXFkZssjd2GDvg4loG8nQNADT09xq2xliPdXm7I/3K/EwKGY6Xkj4VI2rCZo2H1G7+IqHvB+eczaQ8MCWKS+6A+5G/Kbp0Wm5ibOPHZ9EQJoiAcDdTrLrZ9PAM/LIHOiJdYLtZlz8G19u4QscmY/08nWCWEq8VsqIqFaSf3OhCAdwGFQxT3ht+Ao26Lmht6sxUiWqQw64x1WnTzuuyH/sXXhY2J1ejKy2OjZE8z9g37weHrFkMe0kdx8wYgVmM8U8t8TYZQfUu2w8/WQpdrgfviVMfM6LX/R+N2PEp/fhvedpCAX/9s6XqAv32xDMEbiUyaa5ldHflTxtwM2ZB/Iuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPF2Pz+HmZKQcv+Rej0o42m+/7TAskc3QKwkkC6YtYg=;
 b=R+qSNvH6p62WykwyVEylXLfPUyEKdAgjtiU+DlA6/RsEK18kbbdw/mMzRC6lOt/wxgiADUb4HGSQeYuXvanaFIshC7VXwiEsaxeKki9CknRDqeJRaCFeDWa0eiNJmflSMJLGBUNBJt8ub3oz16CrWsuZgIhxuMpC9C44L0pjazORVAB0KkM6Ye9iz6bfEw8VDUiLBIlNFRzhFqTq5P4MenQ/G6Jtc9FPUjmda8QNi0xI7v65t6xp05MbdfNmoKulLhKdaci7cSVihgSmtiouA99mkR4Bc+egGpSxlUWCvIf5IoUx8gmf8Oaz681MIBwlyEMNK8s/tG+Jd9WUUbRJMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPF2Pz+HmZKQcv+Rej0o42m+/7TAskc3QKwkkC6YtYg=;
 b=lt9Hgox4aUTLKcHHJkI/KWeBKz0sb4TnStrGW1Zc3FtZ4E7/P3OYRMdcoppmEz0aEEWpHtKC3t/cAfW5ABDo+9cnoxIfFHpVvIp6LddXTj/gIzsq37WQxCiK2FmHkRJn6Ivor6lUAL7dfiHVXCo5ulO11rYYyQ6WLrNO+ZcE1iqEB+WIiMOFlmdLWzylyNl0BNva0rshkH2Nchsu/yB+VVyY9kjfhw1RmWLlacNwfinhKxX+Ws6/7VVMPOqUlojv6isNcDgvhRgvYfVPk+ylbqFYj+jnAuSH/Q45toSXtxuKRHZ26Udga19PPZQwAHfGjhoLlM/4oNcdFP/Mqb+FXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8147.eurprd04.prod.outlook.com (2603:10a6:20b:3e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 18:46:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 18:46:25 +0000
Date: Fri, 28 Aug 2026 13:46:17 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dmaengine: dw-edma: Account for the MSI vector
 offset
Message-ID: <apHXefJ2o4IQBYsF@SMW015318>
References: <20260828163611.2691264-1-den@valinux.co.jp>
 <20260828163611.2691264-4-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828163611.2691264-4-den@valinux.co.jp>
X-ClientProxiedBy: PH7P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: 18786164-a878-47d4-e643-08df0534a9d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|19092799006|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	l/bKVip+Oj3kpL1WxIMKbTfmyvrk+SMMGF8AoVl72laUmI/kkfrsh2efSbPnBrAtKVQSGyQUzknZPlJxn0GcicVQiYK1Mcvy8KuYMJqPW7Ix70WqxvnKx7mMHKLwC5DREMtmAajIN8pWEEEVM+riJ/EajKq+x5rNhL2xUjJYzjtfWtO6MFrBNenzscpDc1fgLtJiuNknmbCzKMpsSDXFrFc2wC0iCVxJ38LeHXJClLTlPnrCSCJ3b6FS3b/c89igBOBjdBLKhiTRCRve1j3tUVZIfzC5ownzUPaPWdpKT4CpVajWLBdjX7A0qGBqKUIGBVVh9SG+mvmBiD3PBq0jdDZw7m5b+gNTxjZsBhxPB6gm+eb0iFQYV1s5rMbmHDoRANvS2F9VcU4c8uSSiAOeNdH5MuGrzsjSp0jbahF03RMJCb8Rtb24QRLt6cmBG9gcmx39J/IdR98HMrHRch+xx9Zj/LyBuYsVCXgaLU3jmZbNtmuJXvGLuFvsyH3uqMyxsKc5tS5i4Po1Q/ctXkeev67xRRcTTPVnl4pHQ9XDSBfWUiclzz6++9Ct9WhX3sVaJubvugjSqF6zC/K2nFsUDfBQkrPxf8ft6ExuXzdX9jE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(19092799006)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wwa10mGLO0razg3ugiUS7xma7fhPho++hXgz34R7TrndLeQ6xK68AVcN3hrS?=
 =?us-ascii?Q?HC+EcTlAqVs0F7puZ/2FKQYrQDnKDPnAMBffvfGENbC7zdC/uZSJn3+lBaQ6?=
 =?us-ascii?Q?tQbWWFrhhLLM9YltuwPEOlxYeFoLLkOVCSJs0E+PfWCpxGuiwZa93RQGHo/7?=
 =?us-ascii?Q?kG19P3Q3Sm9Rw6c8PomprXuN5WRk68npDzEsAwk4vfoxrr/jRKgtPuqf5l6H?=
 =?us-ascii?Q?MYvu9m61VQ/oC9tVe1VabrDwVFrW4eaji66/ImPiPJMrOP3kUwKzp/kjGPB/?=
 =?us-ascii?Q?eBQQlu+73WfwKhGWEvYya6oKzNzWxewm9JPcLh42o4K8tfsm6oBoE8fKKvDy?=
 =?us-ascii?Q?aRCjeClZuEFBv9NGviLTFU8yw7FC2m/BbuxBs9gYyPhmpvt7vU5ehO5d2u+7?=
 =?us-ascii?Q?htZPk2LrQYxhzNzG+e4axIlhSXchlUZoB0w2oluEidRGTTzKZ3BrPhA8tbQQ?=
 =?us-ascii?Q?fXy1N8oSiCtPpHxgDMGfFlSsLgVPKOkbSJRJJZ6YOr+KRyfAQJkD1VDt+HCC?=
 =?us-ascii?Q?gRmo4qrYneGYnUh8BD47bZHw1Lq3rtmJJ2pLYhSPbABvg87ItmQQNDAbmDdY?=
 =?us-ascii?Q?CZFmzexZHiL+EZ98CspgxGncb5MT8do852mT7r40KTNGy8bmYakGfXm+IMyG?=
 =?us-ascii?Q?ee0UKZgb+Qv3QJ/A/dvm6n11JwxidCGrze2RdKgbETLAzOJW59lL1G2J45cs?=
 =?us-ascii?Q?xR6BdBKEz5NUeAYMdz1zB3JWIqDfBaj7WAXZNgmn8oBMQB9J2xXXJ3AjcRua?=
 =?us-ascii?Q?8ZcY92P1anjdfyZCLL68IXN/hUqJArIY6lCFz9+QRcRMKwarFFkuKXpMUZqD?=
 =?us-ascii?Q?JqAShtf8h3ePHzju+uP10+cqaRhUT7uJs9hREJdJOmovxuyh0p+CCPS76Xvp?=
 =?us-ascii?Q?NAbNsh2Mk2tUhTpoPV/ipQRHRtOkh6iUCTDEaxEsCJuBDw97f+1g0/7O8TSf?=
 =?us-ascii?Q?Rrr23i1U2/2Eq2WzOnhXZskTpi9ERebCPcOylC83mnEg2GQSS/KD6fWYZKs/?=
 =?us-ascii?Q?4dtHyqnXaZZRKd0I7GJ7g2hlkc8pRqGgAKDP7vBQzI4aaJN9FTiT4NtS1haX?=
 =?us-ascii?Q?FDQRF/AgX0nCE/leUPOBaIs7zfWws/NysfjPksZR6tOqFQ0qJKUCiUyuOIqB?=
 =?us-ascii?Q?RrCr5kRkauig2B6eDeODT7hQJrNV9k5Di2UC0CXrYcELaGc3hrDjnK7OxFLO?=
 =?us-ascii?Q?Lx019CxodmrvX8jYld2shJdyotatUkhiNGrkZXnXqjPC39rAofhXCsqzdMkd?=
 =?us-ascii?Q?+9ZhuJ7O5qEsMGcyGzTrgIdA5x9wgUSZ+SnFD8+Q+hjwIDmOq2jvhfrq+/et?=
 =?us-ascii?Q?Rq3gbml6Hd49kNJRbTydHpovlcqwYUPgp1O3FSvg3FW0nqGrebIue8HzK+Il?=
 =?us-ascii?Q?1+SEi559hD4A219WMPkKOSbRWxt8OA19rESXmkC3Wat3LrDng5lqlOeFjLBT?=
 =?us-ascii?Q?/VfCTI4uu3fHNdDHXxk4ZLimfBisDMWgPR2GLaKJC/A/1Dc+yOCynkqMCnJV?=
 =?us-ascii?Q?hrEDMk1wkeBv3i2FRqdsIXxI3wg08TvSN9WokPxIZojwWtYcY4vQTxlyjQg1?=
 =?us-ascii?Q?8RNhrw1KX7Xo7ONNQs45KHnLhymn1qmGawSU/ILCZyjZuX7ZxklFbAsWrDxo?=
 =?us-ascii?Q?fhE4hOVty9fj6rJAhdPJm3oAGKZWAeAltXwbGs/Q0b+o3OjPD3NsKPtfWPMb?=
 =?us-ascii?Q?oTopZ9VnxHJKTf23zftjnpFue0D8bcynwGWMx8U2x56LMlhZsFXEph7ZCCmE?=
 =?us-ascii?Q?Beh7WItavB6V7ebWS2HABeA+6N6WUXM05lU5nDIrwhYHVsE+UKe/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18786164-a878-47d4-e643-08df0534a9d9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 18:46:25.8893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZ7a4kIGpf7rYAKpOXe/6GsmEYapD4XOBjij49ZauTve9iStdJQr+5GHgrqlxLx3QBI5K5ZTwv9tc3+fIpk/ZH1ETGQmm0mTkTanlZjh1R91LXZfK4JNx+zOSCJ9vzxv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8147

On Sat, Aug 29, 2026 at 01:36:11AM +0900, Koichiro Den wrote:
> get_cached_msi_msg() returns the base message shared by a multi-MSI
> descriptor. dw-edma currently derives per-channel data from its local IRQ
> index and does not adjust a common IRQ at all. Both assume eDMA starts at
> the descriptor's first vector.
>
> That is not true when eDMA receives a tail subset. Compose each message
> from the IRQ offset relative to the descriptor base in both paths.
>
> While at it, avoid reading PCI MSI attributes from descriptors owned by
> non-PCI devices.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v2:
>   - Rework v1 patch 5 for an MSI allocation shared with vNTB.
>     https://lore.kernel.org/r/20260312165005.1148676-6-den@valinux.co.jp/
>
>  drivers/dma/dw-edma/dw-edma-core.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index a8c6bd508fcd..6af8a414e4a2 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -7,6 +7,7 @@
>   */
>
>  #include <linux/module.h>
> +#include <linux/pci.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/kernel.h>
> @@ -1075,12 +1076,23 @@ static inline void dw_edma_dec_irq_alloc(int *nr_irqs, u32 *alloc, u16 cnt)
>  	}
>  }
>
> +static void dw_edma_compose_msi(int irq, struct msi_msg *msi)
> +{
> +	struct msi_desc *desc = irq_get_msi_desc(irq);
> +
> +	if (!desc)
> +		return;
> +
> +	get_cached_msi_msg(irq, msi);
> +	if (dev_is_pci(desc->dev) && !desc->pci.msi_attrib.is_msix)
> +		msi->data += irq - desc->irq;
> +}
> +
>  static int dw_edma_irq_request(struct dw_edma *dw,
>  			       u32 *wr_alloc, u32 *rd_alloc)
>  {
>  	struct dw_edma_chip *chip = dw->chip;
>  	struct device *dev = dw->chip->dev;
> -	struct msi_desc *msi_desc;
>  	int i, err = 0;
>  	u32 ch_cnt;
>  	int irq;
> @@ -1105,8 +1117,7 @@ static int dw_edma_irq_request(struct dw_edma *dw,
>  			return err;
>  		}
>
> -		if (irq_get_msi_desc(irq))
> -			get_cached_msi_msg(irq, &dw->irq[0].msi);
> +		dw_edma_compose_msi(irq, &dw->irq[0].msi);

where this function? I missed dependence?

Frank
>
>  		dw->nr_irqs = 1;
>  	} else {
> @@ -1129,12 +1140,7 @@ static int dw_edma_irq_request(struct dw_edma *dw,
>  					  &dw->irq[i]);
>  			if (err)
>  				goto err_irq_free;
> -			msi_desc = irq_get_msi_desc(irq);
> -			if (msi_desc) {
> -				get_cached_msi_msg(irq, &dw->irq[i].msi);
> -				if (!msi_desc->pci.msi_attrib.is_msix)
> -					dw->irq[i].msi.data = dw->irq[0].msi.data + i;
> -			}
> +			dw_edma_compose_msi(irq, &dw->irq[i].msi);
>  		}
>
>  		dw->nr_irqs = i;
> --
> 2.51.0
>
