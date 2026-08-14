Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010061.outbound.protection.outlook.com [52.101.69.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC403DD875;
	Fri, 14 Aug 2026 20:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786741104; cv=fail; b=WlAH9WVwZfCHqYjVbiwRrzY1CT28tmUwHs13r9WgpsI7GYwC4LgFQ1ImEUHdJNjaMEVnCzc7o5PKTK+ETIIGi9nKfJvAINVDQBhWmMMk7J2lWslspg9uiWzfhOPU5Sfb090ccQn/Ny1T7+5clnjdjvyIJlFiOklVb8mRhqMF8i8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786741104; c=relaxed/simple;
	bh=LYbZVuMGV4sSqzPKxxhqTAqT2JiI4TGltfCMENidzww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jRSFgqWLU9X3syqjeiABpJBwy+vEIWlb5r8Q45lZWsrEPL2zqjp/6/VVHVK3W6gAy2WH1SSfs6ECL3/+SDfvdRG0dj6FnE93DcRGk3pMZIcvb9ZEuqFJE5UIUxnARk0SSDBuqQ7jQDlg0jC00qNoTe+Rk0jWYzVv5hCz3GoR8gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hQlYuOi9; arc=fail smtp.client-ip=52.101.69.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hQlYuOi9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPS02JIvOdwKBJxFvTXdDVipLmHfdBQ+Vojtay5cyJJH8iM8iYn/VX+NGKqZqtCZsw+w6wu/kgJbxn/njteX1ah4QeCzKoJMOLNAcHZWQBDAHXJE7sV0MWiDN0dgSj988aPiIpGapN3Ycv3kz6fsHn2eh/qyMN+MhkoRix2zk6ZP5n5w07MlPtac0aSjXYVZ22W9gOQj13UgsgJMztSw22aEcGK2Wg+xcy6GmLf0nk334jCaR3bKkVKr2e5J5EEVQYzgC6ZJYoOuClCs5SkJKnwwHToXTMbdbEjwGzL6pQCezlaclsJHZNz5jLr+Dl1GEeZgq27obSPzp0pSeheg9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nejWJJSwgUn5FuKocqMlb1muH15P4D83SnnahQ5L1E=;
 b=SF8xVnLIFIGhn3EP6bMjD5REK1KIu5xl5dUODgx0oEEyidVB0N+GttEAFFYLjdMe/01/PLiUoiKlIBrR5V/4s1Hk0TwA1mekGmt+UbOkQIl7w/8d3VxQA39b8eN+a1FbM+GAOWoXjxmYyFDfvD3+inB6wNZDkXOBadOXj+sDhYPa2HVK39ooCTD+ysqBcnMdtpeBli3JH20DSYe/yUXDqFI7snJVMXshe+XoJch+3lYZiepRkF4eK64r6D0KL0bERW6z+9DuErivQ/+jF7es69+nAlpqjRMD29SD1pH2hudsgYMlEB9Lm5/9DWb93aixcSno0YsgllxhLgHrSTfXZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nejWJJSwgUn5FuKocqMlb1muH15P4D83SnnahQ5L1E=;
 b=hQlYuOi9Y4ih/rgquE12eXaW+ncmcZZ37M+c4lVNGqjdrwfhPCx8p2MbzgvqDau49KRD61uOAHn/vr3m9/jTXgfl/WopB6BvBzqKsunlhnMOXfQCgndi/hMqfvFTJIMUP6Yec0JIJ2e1NG9F5mYNZpLQtbUt2fboyq+AzITpF99DwhCk3qi9od4KByxeb59Q4IoO1u6kE+rcF7AaZuNGnK8bs+gRnPe5Tsm1snj9xoCjSjDzAmALKBOyb11aOP42cx0bbnZeecRE11t1B89Ul14+x+KzOGQG43ePL9o3Q2OStoSQ0ckoEVoqkiq5s+SkSohWVkkGjCb3n1KwPAmGUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB9936.eurprd04.prod.outlook.com (2603:10a6:102:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 20:58:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 20:58:18 +0000
Date: Fri, 14 Aug 2026 16:58:10 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, wens@kernel.org,
	jernej.skrabec@gmail.com, samuel@sholland.org, mripard@kernel.org,
	arnd@arndb.de, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH RESEND v5] dmaengine: sun6i-dma: Fix use-after-free in
 error handling  paths
Message-ID: <an-BYtReSbWBGvcH@lizhi-Precision-Tower-5810>
References: <20260727061142.44195-1-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727061142.44195-1-zenghongling@kylinos.cn>
X-ClientProxiedBy: PH8P221CA0029.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::34) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: 37710516-81e8-4bea-e684-08defa46c463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|19092799006|10067099003|56012099006|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Tu2LLuZshF+VYb9qFYmseSnQEirYMAwDGn/38s9WJ33kN1LDKsLU0+oroF4DAHnP9+VCxVTUYo+hFiWrMMSEvLaKIXpuT/nfp0xwJrJbhykqLthQqhnWJ2Mj3kpYCg6E/c65pBJnbYRpzl78oSvUCsX45vNGB2EGHlopzAgwqYY8VOtlmODlLdi0/V4XUu245Q0406VglL1oL6CzFxYabJya/hNOx2XFoD7vZWmI5h5LnmoPNqV87O6ujFfpvsb+akkOWky74eeOpRtoGh9dJp9U6llpNLhc9B6cKByEaOHxN+D72C5OF9fi9mQLrU03p3dc/4dHPiLKlxixrYwnFNxjErJb7f35juIBR5RUdM+kZ8hU8LbRva2YUhUiLLz9KPYHvGyUjTnjFkkQ7jv+Iou22BertpKmbGUizcwxYH2Ut3wviPYc+6IijKZQrFYO6K6rMXwtvMcbyf4QKU1lLrd7EODaB3kNaVO5WdUCpvxVfj9C7auzX2prHUABGjKA6D3iZJwEqV1r/7xQAKx7bMicxhYfKWSJTMH8AqEBbC0ZnQPE69PnacuCErIC2XwpNuI50NsSKN/g7pKZwIGJAVNKPdpi6G3AZPy1tpT0cAzIXW2tGTTTVR3VfdY7h8vY4caknB4uPOWjfqhhe3uTcil0TN/ZnoWRDrCW05pGfdo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(19092799006)(10067099003)(56012099006)(6133799003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5GIUP8o3q/1RDN7nNQ6DgArkG81p24fKzkW8QFrAhSqiWFkv1SA26XXrBc7T?=
 =?us-ascii?Q?eF/D9KJesRQI6bRJBkkZLqPKUW5xTxOcb60EPpZwbxtylUEXg6dVbjWGvtZF?=
 =?us-ascii?Q?X4VsgLWFfDmKdbBTgf19pZXALhlUwdjZ1moynNNLLZ2VauTlJOpWY/H76CSL?=
 =?us-ascii?Q?vSG2bGoFoaYu1JHvyD68DrTkbG6LahL1GBRrRngBh3eYfQ7ZOQ/AX2LI23GU?=
 =?us-ascii?Q?HoxBifW7+yIxYc7UTCJMRz8yOMqXsjncFnl6i3f625452W01fsmRAHEittaC?=
 =?us-ascii?Q?sO6AMSLFQSrg/k/FfP1Op7RB7Rq7doRO5BYK2lZVKfzHyXf4/HCXWNDIS7gf?=
 =?us-ascii?Q?vBqGYus1BaAEaAkowbfRMdtbAO9zzgCQka90YTg2TU2fqYOTmm/JTY2ll3vX?=
 =?us-ascii?Q?AaJmx7SxpJT4BKc+wv1qHv883Qi974ae/erkyFkj5hfa7XlwovOPUzYFH07m?=
 =?us-ascii?Q?xoTS5K86siEHHjSaPONMHzSxC+gFbY/5xae5KMhZj5At2bN/GQUYKwVW9ccO?=
 =?us-ascii?Q?2YCTuU2W+2tUhlxo6F5uWkFadHs71pKpN1kQKidjuGX2jHWLCzWa7QS+cZbC?=
 =?us-ascii?Q?R0FD0+KC9bYJdql+zyi4Ry7l1edAftKhdXOOYC3S2Tww3bGzzJpxHGneR5na?=
 =?us-ascii?Q?/bwzrrsTBuKHl4haSkzRxoRltU2Ah+p+woyBgI5tene6qAnMwzN52GkiFcXS?=
 =?us-ascii?Q?l6GJioB3U0Xy8f0hZ3yjzHtCxzzXzRg50zTMfUq+LZiPRzOaK0tjGmloRrxX?=
 =?us-ascii?Q?0afPaNPKiO5U2ujWsP0OF6mOKWl/T/68O0Xb0FlxJB+geS1xNTD2p7Pu+3bE?=
 =?us-ascii?Q?SuMPylXx9N49d+U7hHIuewSQRb5p54y6/pMj8A5CXTCFeh8bVs8do1ml6lOZ?=
 =?us-ascii?Q?+acVGa6lLmlx9/lyN0CYR17zh1xCwuynVqhmaGwGwLlIVw0wAj3ZeqrN+l/B?=
 =?us-ascii?Q?3Ni9TnSbPdxaWFwkH4ko0MgiFJdOMF2fMbOI/hpMoCUlf5TqxzdSEWicRKri?=
 =?us-ascii?Q?2NgrfkLAwiID0MNsbw2slYaKHR9PwuHEh7uO1l69XywOoYOWZxJ9kN2A8UZe?=
 =?us-ascii?Q?LYF4zL9XB9pfn6Tox1egoy+Otlkahe95x40hkMT3/e/geNIYRBpgJlqNG7ZC?=
 =?us-ascii?Q?cZyf+D3/PHLzi0/7N0ECyEjoPAGKRFNguE+HkLYXQsh+nyVnB4TcqtzmFL/f?=
 =?us-ascii?Q?Diwuj3PSficQJqfI31N1eFZXnKq8IwB1BQiM5KT8SH2GYOZLVnKMhmrGGoEm?=
 =?us-ascii?Q?BwxBL4nQhahZHLw0C/2NX5MuW5JKRXVSCtMND3u8D9BqNJwqpou3PjXy8RDW?=
 =?us-ascii?Q?ZK3221mMv/b6DBZdOjkpZDqn9K76tzstyEHlb4od2bUoLdloTTEi1WtYGK8m?=
 =?us-ascii?Q?4AUxwdwsY7mxDwQQpt53pHPJJpvjpYiuyNdHg1Jjlq+VNxuIV8iBgc3m/Chs?=
 =?us-ascii?Q?OmHZrKVakccJcsQhD6tBqcWm8y8QInj7Dz9OlLjt4wdzoD2GipW6zpNHYutQ?=
 =?us-ascii?Q?5bHpbwflLo9IN2e7FkTTtlJdsGy0vZvGlIcOU3wFKoOoxjX2QbqO96WoIknW?=
 =?us-ascii?Q?vag2Q+ZDvgKsMsoCcDaqlm2LZeMz9GMvnd53COb6kOCNscX960gDHrdG93nn?=
 =?us-ascii?Q?60x95U/vvfvGKCmLLjJ99UxCC/c3uONdMr3cbakYbPrcBEZz5gayMptXRzYL?=
 =?us-ascii?Q?ySTHmbemdoh/fD455Y4Q4A6DJcrPp4dp+YAA47CPQtMfh26tScSW0irmgyY7?=
 =?us-ascii?Q?9dHz6BiwMVAnuJa122jQsWTc8/ks+vXAuBA42XGjmIYTsrSB1vaf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37710516-81e8-4bea-e684-08defa46c463
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 20:58:18.4282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uMlbLV6yJXglVHyUrVf/aVDEps4E4q2XTWOFYnYB28lf09iZOFLZPWaMY5oje873bW8U5ROXUoOAKwLwjG/Tvsud8K9/RoC9nnY2XTS2g0GoAk5uFOairCnHFA9uY3mj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9936

On Mon, Jul 27, 2026 at 02:11:42PM +0800, Hongling Zeng wrote:
> In error handling paths, the for loop frees v_lli in the loop body,
> then accesses v_lli->v_lli_next and v_lli->p_lli_next in the
> increment expression, which is use-after-free.
>
> Fix by refactoring the cleanup into a helper function sun6i_dma_free_desc()
> that saves both the next virtual and physical pointers before freeing the
> current node, preventing the use-after-free.
>
> Fixes: 555859308723 ("dmaengine: Add driver for Allwinner sun6i DMA")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> Suggested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> ---
> Changes in v2:
>  -Refactored the fix to avoid code duplication by creating a helper function
>   sun6i_dma_free_lli_list() that handles LLI list cleanup
>  -Add Suggested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
> Change in v3:
>  -Further refactoring to move txd handling into the helper function
>   as suggested by Jernej
> ---
> Change in v4:
>  -Add reviewed-by
> ---
> Change in v5:
>  -Correct the commit message.
> ---
>  drivers/dma/sun6i-dma.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index fcc88a74d821..e161fc298b86 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -406,16 +406,12 @@ static inline void sun6i_dma_dump_lli(struct sun6i_vchan *vchan,
>  		v_lli->len, v_lli->para, v_lli->p_lli_next);
>  }
>
> -static void sun6i_dma_free_desc(struct virt_dma_desc *vd)
> +static void sun6i_dma_free_desc(struct sun6i_dma_dev *sdev,
> +				struct sun6i_desc *txd)
>  {
> -	struct sun6i_desc *txd = to_sun6i_desc(&vd->tx);
> -	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(vd->tx.chan->device);
>  	struct sun6i_dma_lli *v_lli, *v_next;
>  	dma_addr_t p_lli, p_next;
>
> -	if (unlikely(!txd))
> -		return;
> -
>  	p_lli = txd->p_lli;
>  	v_lli = txd->v_lli;
>
> @@ -432,6 +428,17 @@ static void sun6i_dma_free_desc(struct virt_dma_desc *vd)
>  	kfree(txd);
>  }
>
> +static void sun6i_dma_free_desc_virt(struct virt_dma_desc *vd)
> +{
> +	struct sun6i_desc *txd = to_sun6i_desc(&vd->tx);
> +	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(vd->tx.chan->device);
> +
> +	if (unlikely(!txd))
> +		return;
> +
> +	sun6i_dma_free_desc(sdev, txd);
> +}
> +
>  static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
>  {
>  	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(vchan->vc.chan.device);
> @@ -788,10 +795,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
>  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
>
>  err_lli_free:
> -	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
> -	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
> -		dma_pool_free(sdev->pool, v_lli, p_lli);
> -	kfree(txd);
> +	sun6i_dma_free_desc(sdev, txd);
>  	return NULL;
>  }
>
> @@ -869,10 +873,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
>  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
>
>  err_lli_free:
> -	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
> -	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
> -		dma_pool_free(sdev->pool, v_lli, p_lli);
> -	kfree(txd);
> +	sun6i_dma_free_desc(sdev, txd);
>  	return NULL;
>  }
>
> @@ -1432,7 +1433,7 @@ static int sun6i_dma_probe(struct platform_device *pdev)
>  		struct sun6i_vchan *vchan = &sdc->vchans[i];
>
>  		INIT_LIST_HEAD(&vchan->node);
> -		vchan->vc.desc_free = sun6i_dma_free_desc;
> +		vchan->vc.desc_free = sun6i_dma_free_desc_virt;
>  		vchan_init(&vchan->vc, &sdc->slave);
>  	}
>
> --
> 2.25.1
>
