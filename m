Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011055.outbound.protection.outlook.com [52.101.65.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09D54BD790;
	Tue, 15 Sep 2026 18:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495893; cv=fail; b=uCwwTS2E4UnZg5OIKnjvJle/d//f6CMkQYwQXD1MGUDcBjcPFAcr2IRy0bFXcDLT4ZJ4GKcGrCI7oxE18I2p6ouP5dZZUby4Q7ovSjn7pAffq9c8cXwsKBy00PyVeZyAtj4QUkS9tqxJYJFSA7RGXPoVGq1UMAOXIQ15IDTcWtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495893; c=relaxed/simple;
	bh=Po2VeTwml92/qEI7CBHRRN9Wbcm+n7mXZ6/J7l1NWbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z0OF9E22tXaCswnX+b4fU+9aJWSw4o83ABJ/rW3anxbldd1DRQkOXSx801cSNnEKAVnnINKn/CgOrRKQ40Yg95jqHyBZBPe3Ko9ct50lthysuKhzknldMaba5uH6By7ARJpvJb31kn2cieJdeGFPOBkCU6Kw1HpSPcZEieLlwR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VdKEqr2F; arc=fail smtp.client-ip=52.101.65.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VdKEqr2F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWLO4iY53OmyzWWBuUDvEscuvC7n6mfiNCpvKhQuSR2lmQ81HpHC5r5ZUajNEyp98yrloCxC7YVyd6juu+WHN4OHhGHcLQCOLcJ/yyyaMxr+6tylj4RA0BRRxQlR2NVztQoXdHwThy0tLzT966v7X7m1wf4Kk9DmkOzkMfC/A7diIQZA6h49d7XXgc+Iacxwjvf3lz8SPRultrLhaDHhjZQvEeDU48cK2jZhCAejBsBabovEmDwCqbaZhFo7vYSIMAyL1OG7tmhSUgWvLDWkGd08pb6zkdH1U97mUhj3zC4iRPj7KOalVMb50MiiPjvhYluKjcq7wRND+uHSZ4RNEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtTVuGj7PL2kbhy4HP3sJuupOgX8YHYiiyM+VIriB5s=;
 b=A/7vGyr5QzpxMPI1hf9jkccEj4P7qpbHVIW+nWiN0mb3oeGbE2Zvnb6junBOjuxaA94TOrfdDM5wh4XVcWGItkBD0R+bZRjLqYRydLtrcnoXs2bLQp0M16p1OaCCnzEyZcVknULjjFFTtkCJ+PaMFZ2RvpiPYFiwnibCjA0gLAfEpw70RiNPXY+DaF0CjlEsn1Y0ZVSvwBVIh/2x6s7Ha2BkFlyNODDATzRWp3LHWnhdMr85UVBOX6wnEdQQP3X/ZmckxJrWmlegogQjdtOkDutMsHRZqwuWlHqPM/fdSByKb5bOtLbkxud2sSQI3ylZFj82Sh39HIAPsg4EBeTxdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtTVuGj7PL2kbhy4HP3sJuupOgX8YHYiiyM+VIriB5s=;
 b=VdKEqr2FuKlTjfkF67K/wwIVj40lff1wdFMYvxDN9tWPD4X+I0nU4SmzK7RVL9ZsHRb9lOaX7HQmaAldGk7zdzXy8TWQs3MPI9aLU5nYF+KoIejEoacZb9QlTsFrTfMeT6hgI2vZdA03xrM6AMAzVzXTtIR+Df01UUxjREkl/+JVLy0EEOiDjgXLeBtDLI/VRlIeocryqfNtKHEiqXgQbplPcAO3anT0pys+IM+NY/89lGeKik6GmtF7ehhpBs+RFISGN2Bwq9QegCmsHTfDEjK2zwAwfGNvxKmdraCT2vyUL+NH00XXv3Y02jJoIkxkWc+gh56VRORvucrfCQp9Jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB12002.eurprd04.prod.outlook.com (2603:10a6:20b:742::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 15 Sep
 2026 18:11:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 18:11:27 +0000
Date: Tue, 15 Sep 2026 14:11:18 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Yuanshen Cao <alex.caoys@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/5] dmaengine: sun6i-dma: Refactor to support A733
 interrupt and register handling
Message-ID: <aqmKRt4R7Tvr9WDV@lizhi-Precision-Tower-5810>
References: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
 <20260826-sun60i-a733-dma-v5-1-abc5229b441e@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826-sun60i-a733-dma-v5-1-abc5229b441e@gmail.com>
X-ClientProxiedBy: CY5PR15CA0182.namprd15.prod.outlook.com
 (2603:10b6:930:81::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB12002:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f04999-6040-45c8-46d7-08df1354c278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|23010399003|19092799006|10067099003|11063799006|4143699003|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	VjtOD6fqVPqazSF0GMudmx484WpVpCHJatRObUgJrn7p2r5kseM5nnKaNo3YnxuGUyU/fYGWyT4vXmUUAllib5vHZX58vt3qbwxxGMnMAmJ+v20ZWveqY/CUY1N6mA2KlUS9cOcKytrGpJY4ZkJlXt334qucpDnmvaYmQZZ1SeGKQOU5DRN5nxNvp2J8FoCXUIVBu5hu9/eYVOtNS8UWjMKFmy6B8sl0viebvX00nt0g60tHGXqSz4jVJZGF3+uQ6E7c+jMbyl+ulWslAyvXFlN8/LAaXKwS5/eSdnCj8r9UB/sU8G4Fed7ZKwIvbdRWVexk+DEpS2cCfFu0w7lkjIRBxjuircRat/6f+1sGamwLMQJd0SCel0Am1hVHJYJSKhgV7bn4rQfnev961QfTJFHuqsE80T1RXnhx7f7Wvy8XyLrHUEn9tF3rtvdDOj22TX4IhtSDmUhpkxQ3RU2azrNj905JX4HClaU9vPo3x1eWUY1Iq9ybzaUdbEgo9kZm7qwCc6eS1ElMt3H7t1AkBsWktKV5jnsT1+pzfJmP1ygojQt7efDAtHEwxv3P0+YU46oRvqV+13HDpn9TouSX/aaUJeDXoV3xth0m0aAg1zwijUEv13ehOfSMfeC3/mB5wwHXUiR+holprBd3IeiV3R/g1W5fXcS90B8Co0HAaD8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(23010399003)(19092799006)(10067099003)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7dSTf8tCJo3o9YLuQjqhe7Ixez4pH2R0NcF60mazVpauWHROIIMH9NVatQ6q?=
 =?us-ascii?Q?U6Q+btvtICw6DpJ+kRqRMTpk2LjaBhw/k4aIWuVN0VgtN+uuyu8ewVfQAcwd?=
 =?us-ascii?Q?B/pVDazTDVAk6ZHWolA6g63t9JZuLL+D6wZVyWQkR/eDINgO/FHdx2laynqA?=
 =?us-ascii?Q?FN2XyF0xSqV29dsTh+LdmVzhWlA3ei7MMDA/Uisub4obM4RBWOHliW65k/M3?=
 =?us-ascii?Q?/f9ej7YstZwr4Q9hT7ZFQcPiCmLpF9mF/aNneb15oaOm9a4Hm4F3XTN+mfqn?=
 =?us-ascii?Q?6JQ8toUr+gJIIGS0GK1047ixIRMvFXMQUjvqgBEr01ss4nIisW7K3g8Hllr+?=
 =?us-ascii?Q?O4qZYmMV0Qsz8JWsDY219xwHkuWHVJ94p3PZIXL5kYffUMQgjXIpsqXYQqf1?=
 =?us-ascii?Q?Bgp2AxmBJY1LroKtQDslR+7Q3t4F89MiUBWJeDGuYLJsw8KVg1bvmatcPtNn?=
 =?us-ascii?Q?440AWnNFg5V4CoAoJjR0mrFTwjtUixmz9yibN4t/Bcn/M37D3Sr6+oOHvmdG?=
 =?us-ascii?Q?yuOsjfjyLjtUUOCkvAGIRjAmQcKg4LJEo7AylgcacI94MTobrFGz0VHIje6n?=
 =?us-ascii?Q?o3SDpcNIyAZ9KvPOYanynLf55+VMi0EN4IOmNqi4yIKHWnb2naP3Ol/6dLLz?=
 =?us-ascii?Q?vw8wnaniqoM8RbjkenGiiogzSHKJ/k+AV/ecSzrcW7V/JNOsVLgZCBPwV+TI?=
 =?us-ascii?Q?NrtFoJLpRz9Sp/2qHlp69nlhw+iwPJk84Dtpc141d1+RSTreuNiSGTLO6MIS?=
 =?us-ascii?Q?YDNInlsgHmB2rrg7p2watKIdW8Abz4CW8m1acTrel49PA9kfoKzN5eQ2CnyX?=
 =?us-ascii?Q?SC71q21DOXR+52/kGxFnSLP7YReRuTiNMiSNvol9Jf5U0gMAQuAYJNql5bKc?=
 =?us-ascii?Q?m7k2yXZaHty9zmOkcy79Zyj7xATTGyW2DKl7xIwhxcQ369Phvyt4NjZGwl9r?=
 =?us-ascii?Q?yzz7kge8yG5xaMopgBrxfL2PrvUjKmYcERik7wTyLjsMtV2tD2NkNJCOhRMm?=
 =?us-ascii?Q?N0AQiQmhzWbYFgaLu/xrKSJ4EPzCkJcks+4EY4euUx0J1OqdFZgujQWrd4a/?=
 =?us-ascii?Q?RsxKX+BQdXE+7zVmsYDvmxxlsPOXqM/1BChRXFOuLpM8n1ONfQ5de4nLLynE?=
 =?us-ascii?Q?JpVUela8hmKDvIFvxEWPwN2HAy0oS1iw9gD4BkDN5TZn6BbNhR6ezIrmykFp?=
 =?us-ascii?Q?GdmvTN/h384no6K8OCCizEzFBY4F4SQlGTB+cbP6KwdEy1Cezh/Ss5E2AoTf?=
 =?us-ascii?Q?midnfgfv8jlHTNZXL7SU6TPvd/uPxEipDgFiTTnxq6FrqDfysoHZi6WXHfWw?=
 =?us-ascii?Q?bNVC88UU7FYIBuHSJVEBygqFp39usmrfJHS5X62WWBkigWbCPWgBxd6W0c1E?=
 =?us-ascii?Q?uEsmSfObcMmZrJV7UM5HHWatZLe9Lwg8Gi1AKXL79SIOOkDLFWaxAV+zPuZ5?=
 =?us-ascii?Q?pfZos5CvwdHM383C1wRuFE5kEpdV/SeR3Wg64bhJDjdm+O0ZZEW3gbaak09j?=
 =?us-ascii?Q?EsSK3vQo8pEpIB/dZ0/5Olc1XHw1g4MRcbt3nPbDFnrP5vZI93VGygR9xeYO?=
 =?us-ascii?Q?Wv2lHoPkWRM6v6v7+wHkLbEPv68x2jhRAOm9UaHC7F8hzX/3TR2/XFQZRsmR?=
 =?us-ascii?Q?WckftZLVSXRFtNvheTVk8cUDlwTtDHiRdhRiS6TTmVvNX7SJd15Nhh/Mg6kT?=
 =?us-ascii?Q?Z+d++v8Idw49xKVa+bwcG+7osjUHQsDBqfcOSlX/eQGBByuAHePw+df3CF1t?=
 =?us-ascii?Q?vE62ifKuXm6Sc1l7S4nzAnAOuAuCM7sybNKXOslv9nKpHxyArImN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f04999-6040-45c8-46d7-08df1354c278
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 18:11:27.3318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tvy4ycAhehO09hycnmRndaWnQ60cWYjX1Em5Nt9q+zWpbGOTa7L0PY+wMGno2ysqaCLel8tbTlBmvqQ48iK037LoowebcSLVKgNW28eupVaKI8AHBQD4UVWGQSq3rtOL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12002

On Wed, Aug 26, 2026 at 02:40:27AM +0000, Yuanshen Cao wrote:
> The `sun6i-dma` driver currently uses hardcoded logic for interrupt
> handling (reading/writing interrupt enable and status registers) and
> register dumping.
>
> To support the Allwinner A733, which has a different register layout and
> interrupt handling logic, add `irq_stride`, `irq_en_offset`, and
> `irq_stat_offset` to `struct sun6i_dma_config`. Implement generic
> `sun6i_read/write_irq_*` functions using these new configuration fields
> to accommodate different hardware revisions.
>
> Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/sun6i-dma.c | 87 +++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 67 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index f47a326dd7ff..f305fbfb3545 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -27,7 +27,6 @@
>  /*
>   * Common registers
>   */
> -#define DMA_IRQ_EN(x)		((x) * 0x04)
>  #define DMA_IRQ_HALF			BIT(0)
>  #define DMA_IRQ_PKG			BIT(1)
>  #define DMA_IRQ_QUEUE			BIT(2)
> @@ -36,8 +35,6 @@
>  #define DMA_IRQ_CHAN_WIDTH		4
>
>
> -#define DMA_IRQ_STAT(x)		((x) * 0x04 + 0x10)
> -
>  #define DMA_STAT		0x30
>
>  /* Offset between DMA_IRQ_EN and DMA_IRQ_STAT limits number of channels */
> @@ -52,6 +49,14 @@
>  #define SUNXI_H3_SECURE_REG		0x20
>  #define SUNXI_H3_DMA_GATE		0x28
>  #define SUNXI_H3_DMA_GATE_ENABLE	0x4
> +
> +/*
> + * Interrupts specific registers
> + */
> +#define DMA_IRQ_STRIDE_A31		0x04
> +#define DMA_IRQ_EN_OFFSET_A31		0x00
> +#define DMA_IRQ_STAT_OFFSET_A31		0x10
> +
>  /*
>   * Channels specific registers
>   */
> @@ -144,6 +149,9 @@ struct sun6i_dma_config {
>  	u32 dst_addr_widths;
>  	bool has_high_addr;
>  	bool has_mbus_clk;
> +	u32 irq_stride;
> +	u32 irq_en_offset;
> +	u32 irq_stat_offset;
>  };
>
>  /*
> @@ -234,19 +242,43 @@ to_sun6i_desc(struct dma_async_tx_descriptor *tx)
>  	return container_of(tx, struct sun6i_desc, vd.tx);
>  }
>
> +static u32 sun6i_read_irq_en(struct sun6i_dma_dev *sdev, u32 irq_reg)
> +{
> +	return readl(sdev->base + irq_reg * sdev->cfg->irq_stride + sdev->cfg->irq_en_offset);
> +}
> +
> +static void sun6i_write_irq_en(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 irq_val)
> +{
> +	writel(irq_val, sdev->base + irq_reg * sdev->cfg->irq_stride + sdev->cfg->irq_en_offset);
> +}
> +
> +static u32 sun6i_read_irq_stat(struct sun6i_dma_dev *sdev, u32 irq_reg)
> +{
> +	return readl(sdev->base + irq_reg * sdev->cfg->irq_stride + sdev->cfg->irq_stat_offset);
> +}
> +
> +static void sun6i_write_irq_stat(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 status)
> +{
> +	writel(status, sdev->base + irq_reg * sdev->cfg->irq_stride + sdev->cfg->irq_stat_offset);
> +}
> +
>  static inline void sun6i_dma_dump_com_regs(struct sun6i_dma_dev *sdev)
>  {
> -	dev_dbg(sdev->slave.dev, "Common register:\n"
> -		"\tmask0(%04x): 0x%08x\n"
> -		"\tmask1(%04x): 0x%08x\n"
> -		"\tpend0(%04x): 0x%08x\n"
> -		"\tpend1(%04x): 0x%08x\n"
> -		"\tstats(%04x): 0x%08x\n",
> -		DMA_IRQ_EN(0), readl(sdev->base + DMA_IRQ_EN(0)),
> -		DMA_IRQ_EN(1), readl(sdev->base + DMA_IRQ_EN(1)),
> -		DMA_IRQ_STAT(0), readl(sdev->base + DMA_IRQ_STAT(0)),
> -		DMA_IRQ_STAT(1), readl(sdev->base + DMA_IRQ_STAT(1)),
> -		DMA_STAT, readl(sdev->base + DMA_STAT));
> +	int i;
> +
> +	for (i = 0; i < 2; i++) {
> +		dev_dbg(sdev->slave.dev, "Common register:\n"
> +			"chan num %d\n"
> +			"\tmask(%04x): 0x%08x\n"
> +			"\tpend(%04x): 0x%08x\n"
> +			"\tstats(%04x): 0x%08x\n",
> +			i,
> +			i * sdev->cfg->irq_stride + sdev->cfg->irq_en_offset,
> +			sun6i_read_irq_en(sdev, i),
> +			i * sdev->cfg->irq_stride + sdev->cfg->irq_stat_offset,
> +			sun6i_read_irq_stat(sdev, i),
> +			DMA_STAT, readl(sdev->base + DMA_STAT));
> +	}
>  }
>
>  static inline void sun6i_dma_dump_chan_regs(struct sun6i_dma_dev *sdev,
> @@ -460,11 +492,11 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
>
>  	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
>
> -	irq_val = readl(sdev->base + DMA_IRQ_EN(irq_reg));
> +	irq_val = sun6i_read_irq_en(sdev, irq_reg);
>  	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
>  			(irq_offset * DMA_IRQ_CHAN_WIDTH));
>  	irq_val |= vchan->irq_type << (irq_offset * DMA_IRQ_CHAN_WIDTH);
> -	writel(irq_val, sdev->base + DMA_IRQ_EN(irq_reg));
> +	sun6i_write_irq_en(sdev, irq_reg, irq_val);
>
>  	writel(pchan->desc->p_lli, pchan->base + DMA_CHAN_LLI_ADDR);
>  	writel(DMA_CHAN_ENABLE_START, pchan->base + DMA_CHAN_ENABLE);
> @@ -549,14 +581,14 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
>  	u32 status;
>
>  	for (i = 0; i < sdev->num_pchans / DMA_IRQ_CHAN_NR; i++) {
> -		status = readl(sdev->base + DMA_IRQ_STAT(i));
> +		status = sun6i_read_irq_stat(sdev, i);
>  		if (!status)
>  			continue;
>
>  		dev_dbg(sdev->slave.dev, "DMA irq status %s: 0x%x\n",
>  			str_high_low(i), status);
>
> -		writel(status, sdev->base + DMA_IRQ_STAT(i));
> +		sun6i_write_irq_stat(sdev, i, status);
>
>  		for (j = 0; (j < DMA_IRQ_CHAN_NR) && status; j++) {
>  			pchan = sdev->pchans + j;
> @@ -1072,9 +1104,11 @@ static struct dma_chan *sun6i_dma_of_xlate(struct of_phandle_args *dma_spec,
>
>  static inline void sun6i_kill_tasklet(struct sun6i_dma_dev *sdev)
>  {
> +	int i;
> +
>  	/* Disable all interrupts from DMA */
> -	writel(0, sdev->base + DMA_IRQ_EN(0));
> -	writel(0, sdev->base + DMA_IRQ_EN(1));
> +	for (i = 0; i < 2; i++)
> +		sun6i_write_irq_en(sdev, i, 0);
>
>  	/* Prevent spurious interrupts from scheduling the tasklet */
>  	atomic_inc(&sdev->tasklet_shutdown);
> @@ -1098,6 +1132,11 @@ static inline void sun6i_dma_free(struct sun6i_dma_dev *sdev)
>  	}
>  }
>
> +#define SUN6I_DMA_IRQ_A31_COMMON_CFG	\
> +	.irq_stride      = DMA_IRQ_STRIDE_A31,	\
> +	.irq_en_offset   = DMA_IRQ_EN_OFFSET_A31,	\
> +	.irq_stat_offset = DMA_IRQ_STAT_OFFSET_A31,
> +
>  /*
>   * For A31:
>   *
> @@ -1129,6 +1168,7 @@ static struct sun6i_dma_config sun6i_a31_dma_cfg = {
>  	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
>  			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
>  			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
> +	SUN6I_DMA_IRQ_A31_COMMON_CFG
>  };
>
>  /*
> @@ -1152,6 +1192,7 @@ static struct sun6i_dma_config sun8i_a23_dma_cfg = {
>  	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
>  			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
>  			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
> +	SUN6I_DMA_IRQ_A31_COMMON_CFG
>  };
>
>  static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
> @@ -1170,6 +1211,7 @@ static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
>  	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
>  			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
>  			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
> +	SUN6I_DMA_IRQ_A31_COMMON_CFG
>  };
>
>  /*
> @@ -1197,6 +1239,7 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg = {
>  			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
>  			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
>  			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
> +	SUN6I_DMA_IRQ_A31_COMMON_CFG
>  };
>
>  /*
> @@ -1218,6 +1261,7 @@ static struct sun6i_dma_config sun50i_a64_dma_cfg = {
>  			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
>  			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
>  			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
> +	SUN6I_DMA_IRQ_A31_COMMON_CFG
>  };
>
>  /*
> @@ -1241,6 +1285,7 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
>  			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
>  	.has_high_addr = true,
>  	.has_mbus_clk = true,
> +	SUN6I_DMA_IRQ_A31_COMMON_CFG
>  };
>
>  /*
> @@ -1263,6 +1308,7 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
>  			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
>  			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
>  	.has_mbus_clk = true,
> +	SUN6I_DMA_IRQ_A31_COMMON_CFG
>  };
>
>  /*
> @@ -1286,6 +1332,7 @@ static struct sun6i_dma_config sun8i_v3s_dma_cfg = {
>  	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
>  			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
>  			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
> +	SUN6I_DMA_IRQ_A31_COMMON_CFG
>  };
>
>  static const struct of_device_id sun6i_dma_match[] = {
>
> --
> 2.55.0
>
