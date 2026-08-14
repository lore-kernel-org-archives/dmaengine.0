Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013012.outbound.protection.outlook.com [40.107.162.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF9C34A791;
	Fri, 14 Aug 2026 19:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786734403; cv=fail; b=gmoYzew4yCuQHDmjQP7Bzu9iMgc9Yelvuwe9QueFu8BNUHAzoP7oqEO5i47V1k//I7D3xQYfM+ePokQIE2b/odTtUEjvzX3yF/xiR0mLm5OyXv8DMPM7eAu/T2YSq0iYC0Qvy0NEwCsJb684lJ2KxsrGnpiylzZPisMmT7Ox3QM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786734403; c=relaxed/simple;
	bh=+hZZM7l5wLB+qHD7L2QZFEFSmMWjK5UDrpRYE1qprk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QQGyEdsdQP0Ir+4RnGxTasUiUTCDX41TXG+x7tXfYHwExq1FKxxpybSjM/QOXxu/1izp/X2S3j1RbA3zjKhxg0wNO7kvKbwSS/w6ErC/tjJXI48I0LkGoNQWJOdkXFE56i1MOAXhCCR6mEZTegAat4spvcztOU3pxV2DbQgBxmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VVtuxO4r; arc=fail smtp.client-ip=40.107.162.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VVtuxO4r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qOVLd8Dj6aL3CfYrYj8ReMIczjHXO3qjvXwNBLesXLeeGigPLcSt1+kygC5kWFTeWrdDPnWqFU5fHahZp6ubc8vAI2Q5h/M8LHZ8aKPsZhuSq/6l/feR3iCXAw5KeOxYm6U+0XasiiYk1vlhvgpm/eyTKqduV/ThkPOJC6tRQ/EaZBvpKPMCetN/xhMOFTveTUe046pLYl9IL7jY5Z8QWpXzjiSvl5QqpeQiE95jb2ecq1cUznnxHJFtoJXCvs6UG85aS92CcNS8GwMszA6OhGimKc/zsDl3P7MNdxaT0jaWOxe99Ta3I1oIPypKo+uCLsXNTuVVj/XiyFgw3mL6gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtK/RWs3yFSqZ70xYzGAPnDJzdpXuja1IFe7aLf+eZw=;
 b=KeWMDbVmvWuG0GkRxJwTBVv4mIOXohmKJY9jnvG8/JxI6ELLxAlgc6pTgxfoEn+194VLYUlhdMVJTv2w1Jo0mI4exn8BY4o6rAn3pL3+WlBKdvLoMbng/puN5gvEUtWb0ngdTOmvWAg2/7msNuwzgsJn5dcBNyItbZSbOCEAAQbm5hVL4AzoOExyQOF35x9xPGCD3wKKC3vv/Jv1tr1EkL1sx+0ihghgxl9OVKRUS66k89IDItsZC+zziaCoJ9xTbm+auNmTJPW5i3JOYZMBLz1eoLw7k/A5/yoPfym0Y2htLEaGjqbFrNhR+Fowm7U3SiI66yZT6/Q9sJrhX9HP/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtK/RWs3yFSqZ70xYzGAPnDJzdpXuja1IFe7aLf+eZw=;
 b=VVtuxO4rokCJbosJ93AqSgi81uQ10xosePXYlZD/16+4F8b+bJUxBWOz3SL2hlu6QwftvHz+qai9QcurJg608aVc7djSOn+6MXE8ZFoBCJjDlZ/309KiFHw0IQ3+RW5MZtqhIcq8vjS60drdFS6jtOO04CNr8V7Wt6yhMKSiRmp3Odb6fQoRUJmCAmuxB6W1lEtk6dwOukVuUj+zp7tN1Hv9zbX2jsMz6WQndY6kv8BKzim2nBRMA5tS+ww7GJioH+dXDou0jYDsjNFHFAAnmOhhTShwjGLUC35b8qN/xMBj/JrGI3P0ducHNLo+t8fIBgiPfXkYt1F+NOXpTMrs/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MRWPR04MB11489.eurprd04.prod.outlook.com (2603:10a6:501:78::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 19:06:38 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 19:06:38 +0000
Date: Fri, 14 Aug 2026 15:06:30 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: sun6i: fix use-after-free in descriptor error
 path
Message-ID: <an9nNnRMAzhHcjlS@lizhi-Precision-Tower-5810>
References: <20260810102044.1725649-1-nagachaithanya9911@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810102044.1725649-1-nagachaithanya9911@gmail.com>
X-ClientProxiedBy: SA1P222CA0089.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MRWPR04MB11489:EE_
X-MS-Office365-Filtering-Correlation-Id: a538f101-0b35-4a52-0f0b-08defa372a91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|23010399003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ViGPnyQhH9rYmX4vNalKsEqo24WXg1B2mb9IyEGdnYN/ZfBeYaEamSCIBRjsLugjGwqFSG3is0xINCGXQrzzu3wq5qUxqIhRn0mKENATqGoiEz2zNpeeN5HIODPGyl4pJjemVDg7DsUNAlOavSat0A8Fw9js7+1GtCJaacHKvH9GmSuRXcamYyXdZ2R+wsOeheKU4j6aB5LwXhCZ27q+zx6UAHnr+WntL6bIN8POwZTBaHspl40y8l4aALr9gEws9E3bSHj0pI3//TvGhppzur6f1hzMz2/5jOz+ekpHHTWbK0TbGn+JpMQnFWUOBCTwWNgLE1+ZAt0DHQ5GqDb1l199koIoUiZpmqLm5ER0rv997y8Yam4gCiuUbq4i4kpJsGNWYgiaDm2H9IrjKKuQY+LhZUk/j94/eLDv/YhoJ4B4g7E10chZWrpbzrjGmokdtKMDgsCfAjrscLS9ty+Nqd8/5cO6uUxPsg64llKeHDofD9FA/GQaMTL9XXrbb0t2F/pHmkdtrqM0YbGfYqZk7eG22VlIIMdsrd3YdugYyYEkrkYNbVuK95wJuFM/7IpAKgi/KzeQwEmZP8FlaX/nS5iMUNY7YpiNqHeT/CA1aZAYx3NcJqybpnVADQ1nzO2V8FBfq+XWnWSetg8t1R2em5R+zV1tOlhkvxjeLbTuoNw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(23010399003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3zrEVKgTco+LdYj1gfG0jEqzBo1vF7NYGAhUdUcr0T9UdLsjb5G8fTpqUEWb?=
 =?us-ascii?Q?7HvB92ZG4cYVusKK9NGm0icphZ53YmElutScbto20OENFkPBV7PeUQOnC59i?=
 =?us-ascii?Q?iqKcSAFvjyofooq4M7bC53z3ha0YDU/FAjN8RyLyNzo8tqTH10+d4oTtzss/?=
 =?us-ascii?Q?Z7OaGuFpDqz+GPX/6F6pBwlofXJx7ouA2F86wezvEt+hzntFzbJIar9IY5yX?=
 =?us-ascii?Q?FUzODti1AVR5IfWIvKA/I50PCugxWQiQ3pZvHEH/GfVDgUGwazna34mTBy9d?=
 =?us-ascii?Q?io7lQqKtAlnu4i67/9x6xrhl+HdMKvlVsMlj3ighe25TSc6WJGvFeI4PDQIy?=
 =?us-ascii?Q?3BG6x9MKdXEHgjdvIGLBVL4yj8AfB1A7LmOXQ1YoZblPZlQ8eQ6dvKZ5UMYq?=
 =?us-ascii?Q?ran8K+9kk57L/HHR/wbzBjg09b/Nxoky4ckzQuEUcrDau5CFB9YUe4sxjuMu?=
 =?us-ascii?Q?2mh7E6BHqFjxaiY+VQpzalsGibj+dj9dJ8Fg9NkKSRGAhMvvumQ76uTae19q?=
 =?us-ascii?Q?jbOs4lJSwuOwkmj+sqFLGLr1MU9rqWaiQzQrKIqShvYKaOiZaP6uvSSHSFU8?=
 =?us-ascii?Q?Pilgb2YHqvuRpeZGVkKXyevG/OOBgvzn6IX4zOyHBrzMDCMr9jXIKw4juHET?=
 =?us-ascii?Q?zqge0Jcw3j8yb16fRDZ1GDl940X6Xw8xLzkI9kTNbQvJxRAAVM9hpJJpJIjv?=
 =?us-ascii?Q?eo8KBh+B+c7iS4cPUEFGuofXldfQRBS7alaonaffQcXHn2cyrqfO9fhvoYry?=
 =?us-ascii?Q?ZwyJ+9452yAGp2ad4LRP7/ehtkncXf2WUivYK10AXN6agG9L3KgPWqktBGfc?=
 =?us-ascii?Q?xPavBh7gbS1jsASYbbUUd8GaXDVTO7oSnUNDkheGCyGX0PxqrB+m1M+ooaY0?=
 =?us-ascii?Q?pXFy+IoCqMisW4kOk+96EpSkcWtvkykWQyMZAZ8keFU7sLYpntqOiGD8TACu?=
 =?us-ascii?Q?9nOWv9+Kuco7uVKdNfi5eaiYBM8CieS+ORYXEHIXfX0/j/mSqqXAie2nyR/5?=
 =?us-ascii?Q?G6VNzOJbGByUGZoojC7Ri+xjkBq+flnjDfZtJxXSq2WiEAuJnPhv9Gy0roo9?=
 =?us-ascii?Q?Cm7WCzkS4mji8PaODEYo08QnQqLNDfGBmxtFBfxkzr3mU/3PJTbofbaSolzj?=
 =?us-ascii?Q?77jKAdSiX28kI+FHSWz5Y8W7pmqMyohE2S/rSMICetCucwxp1MHwP3g5d4Ns?=
 =?us-ascii?Q?ugY2aYHfudjWTsG7LWg5rQK27Pw+gjS97PM2b8htxSBUHOPIy/XGTvlu0k5J?=
 =?us-ascii?Q?ExaVwtLWfcdEO7yXyGQ84C4W4SewMXgszdcff+K1gY67bPG8WoOzq5V+Y7KC?=
 =?us-ascii?Q?4HZRKl7ZQfttmPtK7K2fXgR+k7sbKPlHauI0GkHtvxfDO6oMi86BPKow2a4s?=
 =?us-ascii?Q?FJ1aJfraYYkC1MPYjW0LNcwFnYVNSxj1/i3JIsVRDbxr2bJCQ43YR9uoIafL?=
 =?us-ascii?Q?hg2oqkTHq5x+7PszgC6OHRPcA7e70Gfi/zfsZK2vDd6NGNOXZnpiP7GBFa7Z?=
 =?us-ascii?Q?rpt3iFBKEdqQW9q8GhXxZoCDFEIfvxUtVIaPzreVHUMn1lyBihKowj8oonod?=
 =?us-ascii?Q?JTnbuvgfePueiPpPDxmO+h/WbvffBybxFunW5rDCl14/bjP9fofrbEI+HPRs?=
 =?us-ascii?Q?FdEkvoAOrFeSmzt7f75y1eEF/hRDuWXnNTt+W6uJc0yWWetBYCEyJ19ovq8j?=
 =?us-ascii?Q?W0jcmEaSiuYz7rm/C6ZqjCnjLhjsGSSoQH35sbUwQRrCaV2bMw6MlUnK6OsY?=
 =?us-ascii?Q?eadXHKPsbvkk0giov1jDvgQAV6he4N4dua12JzIHrPVbpH+ka1E1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a538f101-0b35-4a52-0f0b-08defa372a91
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 19:06:37.9522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BF1iYdEK57p82AmE4O7bmNttdtw0+eIxJ4/xPYzQwfMfR00MK2MbU61Wu61FkrAO5q5yU+FOdhB0YoldlWd8hNzXvceHa/y8wi0LteVbQTfGtDtQZ5WhPUxWjRae1gN2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11489

On Mon, Aug 10, 2026 at 10:20:44AM +0000, Chaithanya Lagisetty wrote:
> The err_lli_free cleanup loops in sun6i_dma_prep_slave_sg() and
> sun6i_dma_prep_dma_cyclic() free each LLI node with dma_pool_free()
> and then dereference the freed node to obtain v_lli_next and
> p_lli_next for the next loop iteration.
>
> Save the next pointers before freeing, matching the pattern already used
> in sun6i_dma_free_desc().
>
> Fixes: 9aa48806edb8 ("dmaengine: sun6i: Do not use virt_to_phys")
> Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/sun6i-dma.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index f47a326dd7ff..2439fa6564f2 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -720,10 +720,10 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
>  	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
>  	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
>  	struct dma_slave_config *sconfig = &vchan->cfg;
> -	struct sun6i_dma_lli *v_lli, *prev = NULL;
> +	struct sun6i_dma_lli *v_lli, *v_next, *prev = NULL;
>  	struct sun6i_desc *txd;
>  	struct scatterlist *sg;
> -	dma_addr_t p_lli;
> +	dma_addr_t p_lli, p_next;
>  	u32 lli_cfg;
>  	int i, ret;
>
> @@ -789,8 +789,11 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
>
>  err_lli_free:
>  	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
> -	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
> +	     p_lli = p_next, v_lli = v_next) {
> +		v_next = v_lli->v_lli_next;
> +		p_next = v_lli->p_lli_next;
>  		dma_pool_free(sdev->pool, v_lli, p_lli);
> +	}
>  	kfree(txd);
>  	return NULL;
>  }
> @@ -806,9 +809,9 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
>  	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
>  	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
>  	struct dma_slave_config *sconfig = &vchan->cfg;
> -	struct sun6i_dma_lli *v_lli, *prev = NULL;
> +	struct sun6i_dma_lli *v_lli, *v_next, *prev = NULL;
>  	struct sun6i_desc *txd;
> -	dma_addr_t p_lli;
> +	dma_addr_t p_lli, p_next;
>  	u32 lli_cfg;
>  	unsigned int i, periods = buf_len / period_len;
>  	int ret;
> @@ -870,8 +873,11 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
>
>  err_lli_free:
>  	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
> -	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
> +	     p_lli = p_next, v_lli = v_next) {
> +		v_next = v_lli->v_lli_next;
> +		p_next = v_lli->p_lli_next;
>  		dma_pool_free(sdev->pool, v_lli, p_lli);
> +	}
>  	kfree(txd);
>  	return NULL;
>  }
> --
> 2.43.0
>
