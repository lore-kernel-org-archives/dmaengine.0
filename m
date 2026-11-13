Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794598809;
	b=BKug3h6PvsuWMnsk8yOKctJ5Q8Z0ePwOqrLGqBtPY9p+wGWVnhNt3UYWkFiIhud06qXy
	 8ylgoYh30M0MLnoWozIJZkYlffYmouP3iAM9RY0gRw3MfU19fqDeVg2/PkkOzyD18X6WV
	 njGXimOl/lrIeIheyy429roRuKclEa3K3bxRxAP1BVG2QQX4Uc8DigAkchZBkn+6j04mo
	 iY3XvmtqB8gFH4kqcnobeC88e/rwQe5IVxkiMpm1DFnIOzNigFlz87/lSZ0AymQ7nPJyj
	 B9XHAnDYE3INLdG1g8WlJhQaNEDayzhkDwdyvt+3Xs+zZDI4t97EjpiP+NTvkkyki3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794598809;
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
	bh=re3Qc+FQe2pKoQQf/GWgtsPWyebTqZ+Ky2CAuVeLR0s=;
	b=HRQZ5oAcO4oS+o44PGZYh5apv0Juzmoyf+f5mYgJ5o5o90Qhrn9/PmIM8gaRCKW9210z
	 m8ILwKopu5JoZPr++emUNrKH/gHrz1JOR+swS4SW0VTqsg3/E9Kos9T24ZamVTyco0X19
	 0fmO4ff+pTvuQuOUbfCIaZjKlJ8izUvnNxIhLXAbFZx+3c5CWeUOYEOHuY2UUJKSX02gu
	 E8LOj1xpVXI39XTW04zcOOeJPogrZXC1zwuZ8Z+CNEg6K+slNtkSqYsGJMrm52znUReVF
	 1mD3uOCn0TyTJxhDnPskjjppC0umEwPYCG+2vF4uwSoIJMXcjZhIccOaKkDZDGdeCoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rV1oVvJ3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.62
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010062.outbound.protection.outlook.com [52.101.84.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A24606A32D;
	Fri, 13 Nov 2026 19:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6A24606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rV1oVvJ3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfoYmrBFkcKybCY2gtbUSMHfz/JrsC5qHDXWpgxWxa1Sfaj/wHsasL1a3gjTpELhOciJWJS+b3lnAvSyFZng8p+abT/mN0L/M+4rnbfGhgkvJkoFFnlewkjlYZ248H4Ll6YusOR+eb1Cx+BT/e4hnrRWDokJy/j60XwkP/YyIEvgsourQWssaKMckynSMxOcY/TYhkuA5cdjB/zOgLnCt4jB+cWfBdBHOyqHcJiigg8gDFAhJx/mgxRXxlSgUiU9as69iCDDg/GoMPvj8y9q55J3C8O2UFvQoKoiBFpVY8kiOB5u/cO6GBrnjRalvOOpwjQBv23gupL6J6jeHPG7GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=re3Qc+FQe2pKoQQf/GWgtsPWyebTqZ+Ky2CAuVeLR0s=;
 b=crUCmX/5pWiTqjQzBrfrvr4HoXuXvdW7XHQjQQYo3aiZti3HwA6dnETnvUfgGJNy2gJdN2/6SD7IbQzXzta1b2fSYMCj1ONoteiGMwDtkX0pwXB9ZvnOGKgZqN3gh3kU8AmQA8zUMe1SGxz2tx9eMCuSmmjS2T2H8SCcdjW1kwAJ8mAVfny18YjQJGK8L9QSFwvJmdBgDje+U+2N0b45xcBdbKsLBReH170DwAPPj0+EdVpt+pF27Vq0IfLU2wx7jyFqEJCT73bbQY/5/uLfXfDoScqim5oH8gI6x+yajS1Cg+GK1KpB7dIShhmbGiK+GQ1dWznvhp33yPbcDcuzxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=re3Qc+FQe2pKoQQf/GWgtsPWyebTqZ+Ky2CAuVeLR0s=;
 b=rV1oVvJ3Do64TUy5DfbEYC5phA6AWi/7ELS3ffDghO6yylZMGhLmNqUctY5K5HcNSDNcKQO9KN/nShSvVT8l2lRkNMA7w2Vpk7UY6BO/Qu9rttr8WoWmkzqfsyqgeSMUrFgtXMBQrwXuajVmsPXx+xp9+aXmMXIuTidUJrPB3bnpiCqvjXyR+DsKMtShecQcVg4LuhbmNytviGDhvV1JFfI+2ewQ34VSObS3xfwKEHpuiOTblmtuRw7ijdvpF5KJNbz5FYj0E9tI+3aDIOqE4IlC/BbomvjhWNKybYX5B6/C/SE/L+dEiUlsGxlyy0D8eepADhSDvbUY3f34McDkuQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB9281.eurprd04.prod.outlook.com (2603:10a6:10:36f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Fri, 13 Nov
 2026 19:40:01 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 19:40:01 +0000
Date: Fri, 13 Nov 2026 14:39:55 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Li Ximo <lixicaicai@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>
Subject: Re: [PATCH v2] dmaengine: xilinx: Fix wild pointer dereference on
 empty segment list
Message-ID: <avdni52GEjf_B3vE@lizhi-Precision-Tower-5810>
References: <20261103083239.2033556-1-lixicaicai@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103083239.2033556-1-lixicaicai@gmail.com>
X-ClientProxiedBy: DS1PR06CA0017.namprd06.prod.outlook.com
 (2603:10b6:8:23e::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB9281:EE_
X-MS-Office365-Filtering-Correlation-Id: 30ae4c85-0e9c-4157-99ed-08df41bde89a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|23010399003|5023799004|11063799006|261022105027099003|261028144727099003|261102123227099003|261021121427099003|261026121527099003|56012099006|261021123027099003|261026140227099003|261009223027099003|22082099003|18002099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	yAWNcL5gd6/vLNKLSlJGJxk6szM+4QuLaVllkK83G3ch1Mdl+YFLGmBsjxWby3pJUZvMct0Q2fQzl624EeZayL3TlBIAvhTSZQrjkKh/gMUNNAzLUbET7Fzs5CoJj050oTmPBXQkhJeuFlNXCPLW3SWq3I3cmyqh/VsO2fC1/GXd0aUlUFHXwWSKck58y2fCvN2DUKgximdvsllotGe7hRGuRuyvMTyPm9FaCgVW4fzS/gSSH5pqC9cbZyPtup+k7bTQD5WgNDEwD9MgiP8QRG/ZPsa/ncjWQtjEvU/MrjLrBkzGEgtlcn30SpYbARN2hlStKZmnWJ7w5Ub7m78iBb1LrdEHmfogdKh66P8mFoPO8kSmqy7aslLGZHkK7d1CslSbrWagA29OT+M9hu97bhTh+QazgGh5MiaL2RgeHuP16uhAMHByt31yDRD0R2rrR8NBEP4Z1AeH7tES7O3smyC9NNHuKlobJrOFTn8Rn9q7z3ASB5MnELarcfjGVNC9sORactKiJ4HEjWtAUN1wDDwasGm/oHkAZp6SpN5wOMkSP5mCwXe39UC4MHk7vblb7Tzy4+As7edi9x310sjLLFBrje36wi4zq4ZR6tgLmuX1gYQMtZ+ruafhpND0hGt5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(23010399003)(5023799004)(11063799006)(261022105027099003)(261028144727099003)(261102123227099003)(261021121427099003)(261026121527099003)(56012099006)(261021123027099003)(261026140227099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JdebZmqYjFQHWNenlrEH6Ir/RhnuPRXDNqr3KFj+Mg6/pURYBi/p4nyG922w?=
 =?us-ascii?Q?BUA0GRZWWKu55V6yq3WFL+2FAMr6SbnfNEMYxxANzkPUpZ5OtvHRKe99hfAC?=
 =?us-ascii?Q?Y4yrC116ImSkFd401jUx3jD50QhkOLxoJRJ+cjpo9ms5a2EMuCLB1KUB+hVK?=
 =?us-ascii?Q?doKKhWUYZLgMAcCaO0mDQ5HpnaPi+z/AhnUQWptd7LEMuI/N7GAtujDDCsRS?=
 =?us-ascii?Q?noTS48m5cGz248bTBsRu1tfauehkA1YWM57mBcT84IS1n+inF4bsi6ToFEHH?=
 =?us-ascii?Q?iwsISj9B/aYY4eDSp1rCxjVGoidYi5ilB1rcHGEKi+9m2zRjzKagvSb9fXfG?=
 =?us-ascii?Q?FQpO3hoNnYqOkPX+r4x5O1Z2NdFZMuxM9uSGC6PsyUiELQ4/yZwAJQFfbYWZ?=
 =?us-ascii?Q?IqofK3x5q5LKWhvZByH/U2L40xMAgLW3/fo6l4EC9eRyvWFfG7ixz1WZIwxg?=
 =?us-ascii?Q?PjjFxhi8s7KMj7Mj7MYYDKgGwmEQNrWpWseu8pzLWAL+rt2JMsFQRlecuMnf?=
 =?us-ascii?Q?kpVi13X9wsTNFzeiwvWXkNuHhtQcasV7L4qr+ARc6GfAgDFaW4jIk4ywF9AD?=
 =?us-ascii?Q?xunJQb5JQp2pYfjReWhuv2N2UoAHq2fjLKgpmywtz5pHT9W3msbFJ6EjYUrF?=
 =?us-ascii?Q?0J1odgcMWlbvZnma5jB/PzF7xWOlApM3/OeM03I5+SqyjKjl4TsRF1sdHD0G?=
 =?us-ascii?Q?i8hIFEbuXlruJeEIZuDuDnTMcyHu3SrfxhWabiT6hf5MMEmbyi3KNg7h0k/p?=
 =?us-ascii?Q?Pzw5l3XRJ4TCMu1jDXHJCdT1hoShep9O42Yo9x4Lq8nSYQd8XTX7aVM7wqsv?=
 =?us-ascii?Q?o40MSOQwppvFLm03kGq12w5sz3rIoj5iZ5mWx6+iHRYwJv6J1FXEuP2tOSSo?=
 =?us-ascii?Q?Ro6raRmLp27FAq3o4xjSCS60oLcBq5JqIxaa52OtZi/JSBPBwODquwJ4X8Wy?=
 =?us-ascii?Q?lpUsMCTvLWbrhdxAy86psvqaTU9/d/tI5iPj7Pec9/Wo3B8iZ8TbvVt5IZ0I?=
 =?us-ascii?Q?C6JdJ1Xz1sXwQRVX1ZOPqA8aMKVS/1ihHn3zgTN+NOEQyVZGcj8rob9gjJFW?=
 =?us-ascii?Q?Ovi2nQIj2cNAykv+3f83L5z4krffySLV/Cx/MgikT7Dxzk4XKJflUy7JOc2d?=
 =?us-ascii?Q?BVaJsnzE+Wc2KLrI9sg6D9PdsTEQDJ1BhLGxLmuF5YogbD/Ky/JYHe9wseUU?=
 =?us-ascii?Q?w8Nl6yEJY9EswVZB5+tPWJWb/TQzWi7J5mTcZmIh6Gyikyg6/3K1T9Q6HSfF?=
 =?us-ascii?Q?tnHL4nS3WDFmWs0ejOckQHaQ/xzICgpO/aCTL4DIkwyr/6on25Pm/5YhjpS7?=
 =?us-ascii?Q?6gLrdf9GMXLekYOwNjM9WQKvYtYzLzBy1r7EKopexgnyv5uVyn3y16ikqqed?=
 =?us-ascii?Q?nZ/2Q+yEGSxf8FUX5aK6gJoc+pKs6P1Fs0veF8olGLpGP9tS3/88rAqamvM+?=
 =?us-ascii?Q?wFV5f+R/YQ9REfLgCIiaKXohviChC77ygLVHW6J0sVmDK6Xcg06MhrZ3zW/K?=
 =?us-ascii?Q?llTjcpgBDSLRit0NdRH/73rcv6bg6aBc08mHues0nVA/a+reSgph/QChb1WT?=
 =?us-ascii?Q?AdPKLbFrOrWHBLvtQiutmif5VqVkFiCjf3g/dhpu4bO8ROrvKAZJ25gkaABd?=
 =?us-ascii?Q?CJ1UpbGIvzqdadHLAP/4SQxBdwNP3Thj4iogrLi67fAum7kM6joZybFVNqwq?=
 =?us-ascii?Q?nS2H0AoBV/fSuST9gpU7TK54IFwrzRn1NkErcz8qVyel+klZf5LHfvblEwCe?=
 =?us-ascii?Q?7Vb/khaR4ZqEZW7PgjKbUNzCQcd4yYaCSvOhPo53wZDiEW/du8sh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ae4c85-0e9c-4157-99ed-08df41bde89a
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 19:40:01.8909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7JboWY4njPooMnlrlBoghaWtUT7AaLQ/EkUx8xjvvzsL/fIFBwLgm9TqTM9gEgh9+ZTiVe6SORXx8C1exOCrK/DDkkYU7fB48/N7a3o1Erh6VfjGncfDtz+LyKQSp+V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9281

On Tue, Nov 03, 2026 at 04:32:39PM +0800, Li Ximo wrote:
> From: Wang Haoran <haoranwangsec@gmail.com>
>
> list_first_entry() does not return NULL on an empty list; it returns the
> result of container_of() on the list head, i.e. a wild pointer. In the
> Xilinx DMA driver, the prep functions xilinx_dma_prep_peripheral_dma_vec(),
> xilinx_dma_prep_slave_sg() and xilinx_mcdma_prep_slave_sg() can build zero
> segments while still returning a descriptor, and both they and
> xilinx_dma_get_metadata_ptr() then take list_first_entry() of the empty
> segment list, yielding a wild pointer that is dereferenced for
> desc->async_tx.phys or the metadata app words.
>
> Guard the three prep functions against an empty segment list by going
> through the existing error path (which frees the descriptor and returns
> NULL), and make xilinx_dma_get_metadata_ptr() return ERR_PTR(-ENODATA)
> in that case without touching the length outputs, matching the ERR_PTR()
> convention that dmaengine_desc_get_metadata_ptr() and its callers (e.g.
> axienet) check with IS_ERR().
>
> This issue was found by static analysis.
>
> Reported-by: Wang Haoran <haoranwangsec@gmail.com>
> Reported-by: Li Ximo <lixicaicai@gmail.com>
> Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> v1: https://lore.kernel.org/r/20261023065806.3175584-1-lixicaicai@gmail.com
> v2: xilinx_dma_get_metadata_ptr() now returns ERR_PTR(-ENODATA) instead
> of NULL and no longer modifies *max_len/*payload_len on failure, per
> Frank Li's review; the prep function guards are unchanged.
>
>  drivers/dma/xilinx/xilinx_dma.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index cffe7c6fa..8b9e3a13e 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -649,9 +649,12 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
>  	struct xilinx_dma_tx_descriptor *desc = to_dma_tx_descriptor(tx);
>  	struct xilinx_axidma_tx_segment *seg;
>
> +	seg = list_first_entry_or_null(&desc->segments,
> +				       struct xilinx_axidma_tx_segment, node);
> +	if (!seg)
> +		return ERR_PTR(-ENODATA);
> +
>  	*max_len = *payload_len = sizeof(u32) * XILINX_DMA_NUM_APP_WORDS;
> -	seg = list_first_entry(&desc->segments,
> -			       struct xilinx_axidma_tx_segment, node);
>  	return seg->hw.app;
>  }
>
> @@ -2305,6 +2308,9 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_peripheral_dma_vec(
>  		}
>  	}
>
> +	if (list_empty(&desc->segments))
> +		goto error;
> +
>  	head = list_first_entry(&desc->segments, struct xilinx_axidma_tx_segment, node);
>  	desc->async_tx.phys = head->phys;
>
> @@ -2406,6 +2412,9 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_slave_sg(
>  		}
>  	}
>
> +	if (list_empty(&desc->segments))
> +		goto error;
> +
>  	segment = list_first_entry(&desc->segments,
>  				   struct xilinx_axidma_tx_segment, node);
>  	desc->async_tx.phys = segment->phys;
> @@ -2613,6 +2622,9 @@ xilinx_mcdma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
>  		}
>  	}
>
> +	if (list_empty(&desc->segments))
> +		goto error;
> +
>  	segment = list_first_entry(&desc->segments,
>  				   struct xilinx_aximcdma_tx_segment, node);
>  	desc->async_tx.phys = segment->phys;
> --
> 2.30.2
