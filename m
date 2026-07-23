Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011040.outbound.protection.outlook.com [52.101.65.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFB0343886;
	Thu, 23 Jul 2026 16:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784824301; cv=fail; b=WT9fZOk3ORSc82Cfdh1aeTlluLb3vlUrd+7ZfciuZrBIo3XZvz0VqIToyLS5gsr5sdhgbSS57g3tjLlKAi2pBW7NRrZP8al7TxFzHRL+bkyJc/ZN2S+x/J/QOcQkF/PXVzRXHjSep/LpWCYS1rZ1iXTIk0Ah89fYY1pHe/aJOdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784824301; c=relaxed/simple;
	bh=C7tQ/DlD91aEIuEGGGFspvtHbfRsQ7qMC4BbsCIbQsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u6OtsvByV3rn8ROdZOLed+kj9b3MkNPul1mqwbwOBkoy6Ec/k0g9iuaytXMi/LWGo7oO6YXKy5jZ5/foPiPXgJzFWHXgtz8XmlB48v7/VxNtIQiRoN3G5Z++5tx0JjIvbarhDfT0YPffL246mhaTtID2Aofd3FdpR1kqVmlC668=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=k7MVKWtj; arc=fail smtp.client-ip=52.101.65.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="k7MVKWtj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xh5ZLIgYeZgHJg/A5mkiVNvbuKiaRGTWlmnGtcizHuWWKb5WTAOjKNKGmvwU0MEG83O8aAhRYHXHAOHi0QDz2ZQ9L2rozceGUnaMQbEQichcVQGzg8jMSyKi5lNvg2dAykf6pcRsY/dyqkVr/zw1MRboQXjfV6ieByyA7cXDCQ2oHlyeIRL0TiHBoVVtfrLcwNRX/3F0Dy9PgG8dYTsyZHUncT21LK6VtCbrBeeLMVCRV/am14haiYlfrsJ2f9pnrr12TqIf4Pl1sFgfZlH4uIy4JAf0H/GS3vE9pKdtUDyJRWot03W3Y0MGHoHcTcd4i38o+iwVkpCtZU/i332zHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEdZxL0E94D27SYb7V1eaGl03f+WwoHT/NdisqsZo4A=;
 b=xy1yAo8kePXe5+gKwg59OpDkP7GRHdmARDx/VkSG6bMlHShmRJZDitME5g2jli4blVhUzhevqyj26Wi8RnM8tXYR5193NYOL3+Dj3XkirtFG5lEAPOGYAhu9jEAKf/WjNw+1I2EY7nWZW8M3G5zR9Hy22V5hQl/duIkuGFTOTj+qoIsysIIHMWxj79A03R7fp5HMxlpbpv4uNDknQsnJYZAOrygybGP5oIu4o4rGXVa+yokpyjUTt3ZN7iA+ElaWkl7y1Oq6ysHfStO8DvtWYO0D4iaeZjUswJWuM1WDady08RMrrmCPtrrgAJRW5gDl0Lnkpd3VXBEGAx6h070yXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEdZxL0E94D27SYb7V1eaGl03f+WwoHT/NdisqsZo4A=;
 b=k7MVKWtjOYkAdkXRYoH4DR7jgm48H9cQCK/A1naqKuSJhCWx1pVXWj39ThvSFk0ea/d8o5TWSaYCfLRtXc8vhOUcOK+7mi4SFMzGu3HEPgWnKHFDYUl9w8nzp4MkxWtc//U57P4bSqMOC6qZX2+xoJ7/AUo+Fu8RQV+iCuur6UWmjeJpF+LcsM0vbdc4PdurM9eZGxfSdZb5/+yQzat6X1LLy/GulejOfJ0FFAH4jFQSEuK40T9IpY/wLA6+10ZFufksKWk7N6rtIhiBrPd0AN7V/kAyjGOAK8CALz/6NsHlPKQrDLBbBVwBtQZHHPlZp8myYH12QhoLZzSflBT3yA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB11767.eurprd04.prod.outlook.com (2603:10a6:800:2e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 16:31:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 16:31:34 +0000
Date: Thu, 23 Jul 2026 11:31:22 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Kees Cook <kees@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Christoph Hellwig <hch@lst.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Niklas Cassel <cassel@kernel.org>,
	Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/19] dmaengine: dw-edma: Factor out linked-list
 transfer start
Message-ID: <amJB2oLCzFNaifIt@SMW015318>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-4-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723084150.521366-4-den@valinux.co.jp>
X-ClientProxiedBy: PH0P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB11767:EE_
X-MS-Office365-Filtering-Correlation-Id: 3259f2fe-a83f-4c6c-d486-08dee8d7dc53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|19092799006|23010399003|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	CdTvWMggM6QfM06K+iDa6JNYEhimiAiQvGsj4ZyS0uWJ9+jJ/+V3LIJ9HgzMpGMcyBD64BD9HygujODI56co9/ozc2etvRtB0qNxR2jhyZ3A8wNydnfyvtYD/fwMEN5h7SXmmDwJuVV5qvO9nMwvGrltRImazVnB/tUevmXCCl2vVg2rmhBZgxg2vHfNXMgrLCnxjubGmjct62qZ8Fmkrw5JiQ0ur1hdxTHhcDQguqrDN803yeGL0qquXobpna9LwLhy99dNzIuiP0ejoOlpmvLtddrV3IUl05RH1Srcz2QtQufNceUuQj7sKx1U8jBGjOfRqt2Odt2UWzvvAfb2VyR+B/IkiG/VDrPgRZ96Dz4qhRSMVL2liSlOKYiJXf0eTzwggE07XJtOT485PfMBe2g1xOGNSJjKkvzimyAADQ8IM1CEcbhFGZCVLRwtYeiq3Ph6TpLEBBgUsCYlLkziTmIZP/W5xXC/PG14R/2IK4uUPgO0OYcN42r4v9RqGDVrvzVVw/xjQI52M4nSEAUvdlWinbcD1fm0AVXYSYuqSPFrFdijY6TiO0DGdIrDeMcMaiQ0DetySe9mHmZdsbb7njFgxfjyp5K5KfSUq5qqt7nM7qR2VcDguAlXFveGbvdVr+LeXDdDi+TsgzlJjKyE1jgm9MU8Aaw8pQBqOS1NuCc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(23010399003)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RQg3HYkjH37MdIYbODFsVF77iLNDyW5kAJ/j0vyUs1m0W+/Aj9EzCW5pGrR4?=
 =?us-ascii?Q?APzD5sd4ESptmJJ8sqwXnoAI4zyjfswvmtit2mEgm8Fm5PzhK0nwLCu44Jxk?=
 =?us-ascii?Q?ZY6MYGGcCyVNX6Ri7D7ev1evjjPWEJNuo0RGshNdD8PaK7HQhCz0CcjTCgWJ?=
 =?us-ascii?Q?GjSs0glhFMKkUndSNAN9mLD49gBb7aXUFR5Vx8uXUdJuBXq/LG1pfvLgqmtV?=
 =?us-ascii?Q?5o5RMiA1+KVbiRfk7/YKxtcxYZI7ardvkvk8uicw9F/I01asf+bm3QStvK6V?=
 =?us-ascii?Q?bcQpsPORZbRdAMkOae1x5bx5N9kNXxMXx2oCoOJUeN0IsiwFrS+5zRN0r9dE?=
 =?us-ascii?Q?OfpWPk+Sy178C02qfBLQQ58IuFF3015pz/Dxxxt0gggA/YBSagg3mSB0nXd5?=
 =?us-ascii?Q?AsPv0ljDDk6K1Yn9hi5gRlpVszJOrAwULUKcf2di6f/FmbvsKpM6xIjDWeBq?=
 =?us-ascii?Q?XfadDX9Bs8ZIIeqz62lFSw8GCTPD9uwr9FEBt6TIBr/LgCwaTDGthwp6COgh?=
 =?us-ascii?Q?DczrR/JxgtcEQGyalDqjlo7B9ehu/g8OedkJB5syJAokO+lW2Ncjdu2QWwUn?=
 =?us-ascii?Q?no5j+WXvm8+9drVr43aaWHGi34xV2PNTgVIInd+6DzwNeT9WX5kdb4dHOCxL?=
 =?us-ascii?Q?MdncTllnbKwLHbLABl/PypJ3McXAWs3Oe0sMEuaViqu937X5zT6FxETCXydG?=
 =?us-ascii?Q?ZH/N7x/EYvQwbwpLXswrHAPc3jV4IWGrXCt/BjoMhQgPaUNMdLPAehFyikXh?=
 =?us-ascii?Q?Gxbl5jykZ17qZ0vs9vZjw79u5OTn92hDdG6OcYJwITPR2lEvjDrXqhcRvqdQ?=
 =?us-ascii?Q?0wHnFyj4Uj09v06H83ORul5s3mJ7UKJiClIk5aCxRj3RKoULW/lZDGedrN9q?=
 =?us-ascii?Q?8SBef8ma3ehtB+OhPfjkgZjWF0mVoewPi3vWNLLmJcs9VoIH9/kljkt3TK2J?=
 =?us-ascii?Q?naWCDiqYnROx9mVAkvTNkxP9jJveQbnrKgJzV8zcg5P/FROtC2WT+7UqRqFb?=
 =?us-ascii?Q?X96faydxS+LE319PXK/QA5hmFOdX8OjRepuf95q0g6wZ9vTyK/a839vYWtYD?=
 =?us-ascii?Q?jCh8yYIsYIidV2XVz9JxJHENns+ttCBODuPF0VwssyZ4EGQS3Pd8xfMhf7b2?=
 =?us-ascii?Q?RA26et57DAZqZgq9RUJrsffT3EQL4Kg934KZUK5pcEHn++NAcwZZJkbAZ4IM?=
 =?us-ascii?Q?UnzNRoB2g1zn1tG9IOzMFNi3H3F2hSuvRmsiKs9JDpBBtFoI0eQA9cYxDOf7?=
 =?us-ascii?Q?S0m+GJoV9MQ18AnLFBNW+jFpDUsDnFRATC8Qs0jtYqnOAi3FC5zRD0Pae4sD?=
 =?us-ascii?Q?3JKHe7cfLFqZgrF/ha0UEC8u6+h55z+PEwxkEt05wc8Y3ruW/0DAGrI3mFr/?=
 =?us-ascii?Q?jM8b18ceyr4VQ2AQYEVPJcMKsNsULvvWNjHejIRfVrZwchmU7LfiNrKmw1Ty?=
 =?us-ascii?Q?+G9W+Z3n0OW8K7ZE+32X/cUq5hoK+eJRHMrIHDkI7Yg4lX1PfZ5Yo/uBEJQS?=
 =?us-ascii?Q?pv3h11rLtuLmOBGmmbdQR0mIJPymnOmz8liwTrhzZOuTTpHU+F7+TDsKvZLb?=
 =?us-ascii?Q?52fjnXMoFGjLGfffh0mdFdrua1MfLm/hLkbfA35H9P9flzIHmc6aoZKWMo8r?=
 =?us-ascii?Q?HQRtMZ/lwaMd72lH9QNODe0Bj/vLOustJgk5pZBMMsld58nXIWEC0zgVMEta?=
 =?us-ascii?Q?SdBzEZOMZ7fKCF6YAMYF85DReG0LwwuDWuTYTPWTeAV9DxXjBoxLpZrdlRfQ?=
 =?us-ascii?Q?w3m15/sxkEcS0mmsJA/qeu/CZqnPT2VAEVlK0M9fZ5ad5pz+WKkv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3259f2fe-a83f-4c6c-d486-08dee8d7dc53
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 16:31:34.8970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mbiZrx61b01G/+pUUfNqA2UoBVtf9M62CHeDAg0SstyHfrCXYYH0EKOar3UsfAQJ6125Fyl17HZIRVPiDwgtSoP+NLCIqbXLdL3mnEYgeuvmB7N1G2mS0ZHCwiTIiMVe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11767

On Thu, Jul 23, 2026 at 05:41:34PM +0900, Koichiro Den wrote:
> Move linked-list programming into dw_edma_core_ll_start(). It can derive
> the first-batch state from desc->start_burst, so dw_edma_core_start() no
> longer needs a pass-through argument.
>
> No functional change intended.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
>   - New patch.
>
>  drivers/dma/dw-edma/dw-edma-core.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index 1f893dc54c79..6a25a050b89c 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -67,17 +67,11 @@ static void vchan_free_desc(struct virt_dma_desc *vdesc)
>  	kfree(vd2dw_edma_desc(vdesc));
>  }
>
> -static void dw_edma_core_start(struct dw_edma_desc *desc, bool first)
> +static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
>  {
>  	struct dw_edma_chan *chan = desc->chan;
> -	size_t i = 0;
> -
> -	if (chan->non_ll) {
> -		chan->dw->core->non_ll_start(chan, &desc->burst[desc->start_burst]);
> -		desc->done_burst = desc->start_burst;
> -		desc->start_burst += 1;
> -		return;
> -	}
> +	size_t i;
> +	bool first = !desc->start_burst;
>
>  	for (i = 0; i + desc->start_burst < desc->nburst; i++) {
>  		u32 idx = i + desc->start_burst;
> @@ -101,6 +95,21 @@ static void dw_edma_core_start(struct dw_edma_desc *desc, bool first)
>  	dw_edma_core_ch_doorbell(chan);
>  }
>
> +static void dw_edma_core_start(struct dw_edma_desc *desc)
> +{
> +	struct dw_edma_chan *chan = desc->chan;
> +
> +	if (chan->non_ll) {
> +		chan->dw->core->non_ll_start(chan,
> +					     &desc->burst[desc->start_burst]);
> +		desc->done_burst = desc->start_burst;
> +		desc->start_burst += 1;
> +		return;
> +	}
> +
> +	dw_edma_core_ll_start(desc);
> +}
> +
>  static int dw_edma_start_transfer(struct dw_edma_chan *chan)
>  {
>  	struct dw_edma_desc *desc;
> @@ -114,7 +123,7 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
>  	if (!desc)
>  		return 0;
>
> -	dw_edma_core_start(desc, !desc->start_burst);
> +	dw_edma_core_start(desc);
>
>  	desc->cb = !desc->cb;
>
> --
> 2.51.0
>
