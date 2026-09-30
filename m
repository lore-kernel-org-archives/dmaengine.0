Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011054.outbound.protection.outlook.com [52.101.70.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AFB4E2F3D;
	Wed, 30 Sep 2026 20:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790799735; cv=fail; b=IIGgOlre+VIjIwHgXR2gzxa7Me0tw2il8xWOqytmTLAd8PVe+eP7tHvwyYUz8wZ6dBGSJc9c0SKJeRE9nPBfGM+zasmCu5Q7SFizWeoxb93KDU2EYEvWlgH/q2/a3visjupxNEM6MvPfTiAx6zLy5OmU9NPqj9RMmhTuapB7hcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790799735; c=relaxed/simple;
	bh=XP3ziJkqqOcM8FO1ACuIR+/Pl6NGS9oUIYF9xNkkmFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XDRctjYhmJJU2py+KgAS1H0BgFCFT7hiooSTJwdx9kQqy7q+U2Ve3qnyowl0SSdfWAJ7Nuqls5mZ27fySRhc42mZrQ1Q/EJcP4d62nyTshzr1lnbFxOgSD9XFx03d55mm/ZTYW2zBB3pXTfdZFnmB25AmTLeEoQRrFVwwbDSxGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XItv2Sbp; arc=fail smtp.client-ip=52.101.70.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XItv2Sbp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bEy3YS+dk8oyiHZORngNhvOffSp5jzHbE5ws3fBUr8zwSxeqxCh/eg5OBJuhBlKDHmlNofB8snLt/c5O9MmIu1muvziMsNLeM1AD5F349Djf4G8ogH3XNt0SZoc/qhv+ztqmzh/MaEpG/EwdXeBWfpaeaUecV9QaqzaVubsRv2fYNs1p2m8qdzWbrNLvr7GoytZpPETiwnJCK8f8y3Q2VE8MFE1s5paBcBXxn/gsmEK9nmBSBNU+lvQF2gonZPxeYo4q9S868zeVV1T3pdxeMnkGVTbAYPiBDyH9p0hAG1di1VpOWwh74PXwg9y93mAXkizPGaC6M55aF4tGtgCEWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ZArRK3F+d5RWPoAicLQfVH/bOn8TV6njzyBeaZMZiQ=;
 b=Hh6V7Ag4qMvfc7xp4vFtRip4SrD0akx8sKZsPgeoRzOPu4+DUani1v5i2DJM+QkURpQv0/yjs42MeMBQcBZnd305u04eEVfNwreamk2YPaFlHL2re7TzOy36r0cyBgjJ9e/AgPoUZIv6ZhxnRxWzwJpijMRlXi9TenjFZNqrsx/+63GDCN0COSyR6cIoLVAZXrLe0W3c37fJY2m62wgHIopu4jwxccO9Fd9owW/g9cFA55vFgGa0VQc06eD1IZ+LXydhwU6bYpSAmUabS/J3qK5Q9DbfuHHS4+OmnLY4k17GnkZ94HG82/HTP6Xb/HkhX2mfePW5gVsSZLL0qEB7OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ZArRK3F+d5RWPoAicLQfVH/bOn8TV6njzyBeaZMZiQ=;
 b=XItv2SbpBPUKuCxLRzyp1Z7SwfDKmyyo1YP2HQumUFGBoCQxOUjZRjymGhXPONM9eYUJECWMTwyIWG9yIugt3gbVTCkxAAA4sSwdXSXrNOqyCiAlQwI+TDOfWJoCqI5m1v18kWT7geye1BUv/G+9UWjd0C4GoC+q00P5vXmru9/OJjVP0c0vTOt11OULY8px3MFeA+zqz/pOdtMjkGRDjI+rtP+ldZwAWWAngxangAAXTM2JSXieTm8vO0i62tCkom7z8o3bPPY63gXMYLmDh2m8oE5rqRgGAhoAO8ekKI7E77EoxfjET+sJ+UWBizD+1/MWOkQrPKjWJ2uxjjhSNw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MRWPR04MB12096.eurprd04.prod.outlook.com (2603:10a6:501:98::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Wed, 30 Sep
 2026 20:22:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 20:22:10 +0000
Date: Wed, 30 Sep 2026 16:22:02 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dmaengine: fix typos in comments
Message-ID: <ar1vaosQSw5PFMrj@lizhi-Precision-Tower-5810>
References: <20260907063343.22255-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907063343.22255-1-hemanth.selam@gmail.com>
X-ClientProxiedBy: PH7PR10CA0023.namprd10.prod.outlook.com
 (2603:10b6:510:23d::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MRWPR04MB12096:EE_
X-MS-Office365-Filtering-Correlation-Id: 465c1923-2f32-4da7-0934-08df1f3081b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|376014|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	M+O0UIpZAsLNcpAHpG/xQHR10mb6vd7F/GsB4WsweTn4+l8pW0BaKjc0N8p+ixNfN1orUzVe4JJPBy0p06jwtGtF98A/RW5dk/riXShtNSyNzlrSwCx/5RVmQVV1t9zEb2rs/q22wOQqCFjw2VWHyIYIBDzb6vWy90816blsqXAWTJAFEPPzomrq5BnElT1bAVOptSNb/SLH/bP0ZHHTyjW6RO5Q/hYVKCuZ97gSzdbYYWwz2HsK1hcz1ex5pOErs3hlm/E3J925NfJJf6MPAmPQKqxkEPO181aKgZDgwx1D11wtSIiHo8nu6RxqLDR4TnelyrZ4cmBijrAMalDSeKXhrurQr0Lsajek+XFYNgqEGEVIt5AxAF1siq2R4v4MgsszHejzRiNy7I+yN78u/Xeg4Z6J6PRzN+fuKcvx+YBcsdGZPicKcsdckpY25IYv9MM2ChKGwdY4022veIT5NKQVaI7Hi6FRz4KmhxVTtMO2by5WgQH4JAxyZI7fo0hpYR5fVP6K+zzZxeSFxzczMcqN3CmWsIkHctcNvk7QMSuPYQYOXJAyjwf9MrTomSB9Tuq+UOrFOCklNX5mIshrPtDds8Hr+U7H+uSF3CHb+bZ+BIE5224TWACXQtFVXYWVaKiiVdayHPbJAoUpSM2AafUBJEaJrU1B8tVYenw7KGY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(376014)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xws8BufXdMaSqsM8ubDEzxv9dtBkFYBtowJhoT6R+7sSTLhitsU6EeQpByv+?=
 =?us-ascii?Q?pZ55MQ/xTf3FmDvPIld7QYg/+Kn0wcIQwTwOx0BEWsnIHr7n9NBSWrUic/fs?=
 =?us-ascii?Q?jiyhpOOc1DM/myqOwwhdzxCZSufJHBCXNBA0RM81XW7IBA3dFmms64uaqImj?=
 =?us-ascii?Q?KwJH46bXyVZm13oYE2kvaDV6xh8NEs1i6N3mfQ/G2Nl1QAA8iDSHZSFeMINX?=
 =?us-ascii?Q?WuJ/6zSoeOpu3LetQiQF6jJgZ30qom9s+Rdjw83RTPAh486sEXq8uQ0qBrwM?=
 =?us-ascii?Q?tU4Ko3uxk6P3lO7dzqjXwKZepgDdNm0FelEGkhdsq7NEQA88oUZppQKQGk98?=
 =?us-ascii?Q?BpcCME88ZEoFuUzt4xVkdNATN9tB+0QLHjrmIH3apznfZ/iW218Z1hXbDQHN?=
 =?us-ascii?Q?Emd2QDlPrvCQMEunstV3Y++DxOW85XARrDUb53VITWux1XkuUL+anQOHVu5e?=
 =?us-ascii?Q?w5Qfr+LX6vpFxxqPqRH9fcwF0mAuEYL3BMrOtKlPRxPjJITVyxHrUtXXQA1N?=
 =?us-ascii?Q?sjrbWHJvpMzUywY+NitsROJ9KuCT45fM254hf8hyUyLDDZbDQgZvjumjOAKI?=
 =?us-ascii?Q?3C0FQJZ6uXdAANqvPsInxmEIv68LW8o6fm1MIntJDGl3sTRHotf7LBObPbYY?=
 =?us-ascii?Q?5ZQhKQchubf9tGhBKMQKEY+jAS6+3zxsDhcLRbqqOI0Cxyj+qrHDYTGrD+QM?=
 =?us-ascii?Q?jluqoOZKOWQLCQq/ZeBuyuQdI13SG5Pj264Lu7xeGNKx+3TgSbPyINmiTXvv?=
 =?us-ascii?Q?wMHL+6oEUbpwV7rOUTjpY/UCtrwXvil/b10IwltaydIfBc4n7aUc62CYVuah?=
 =?us-ascii?Q?afRpBB42tIyjr0Tp8ZLghtYzBKjU/7NrdZRgHje/x/fIx9e2EwOEOEgTmJqY?=
 =?us-ascii?Q?D1BRuWttkM4SWA07UjLvPdzV2AOsoT/W2n9Rg7+bMEON2pHIkzkYnBLCzDKF?=
 =?us-ascii?Q?jBTeRjGuFkZHmT8fYHgYHur/n8xSJ6L3jUXAOsth4dL2uYwwO21mIs415/DR?=
 =?us-ascii?Q?QJgtCLAXUqIdsIbVfhn6VR/QYeWtIxIrkOXQTByQI62CdGPMOFLs8r2RYCr9?=
 =?us-ascii?Q?gztccuBvOWceaUPLnGIofQuH9u1q0u7QxJGuQ93ZKPLjAwUhdjLSK4FEwTPF?=
 =?us-ascii?Q?D3LGTUOscuyWrkE4OVC0AfXSVb3etqaNvcARmV/qrXEXAxyrKdYUlmvVpp2y?=
 =?us-ascii?Q?JYT7jMDk3ty9OL1b0YqqBtJn/VVJx8EG0DThfjQJyh8jwMu9/503zQ7N0vRA?=
 =?us-ascii?Q?9TieZwwOJkPdYYFMCelbUsqNN0fMdZK4+qY92H6EqZV5pVts5O4ap5dgCEEs?=
 =?us-ascii?Q?Px6SgB6xWXcnXxUgmnsm7BlLKkxt/tzfaLLyYIRn/OcEhAjIRXSe9kx/2iZG?=
 =?us-ascii?Q?yAsGhL+/4nwN4i4y/diPO6dpUmqajw0mB1NR/IssydmHq/ScNozDEGSZaUlq?=
 =?us-ascii?Q?uW4eDr2KNTJp6i4HuoU/WPrY8HXnXnm9XKj0DjtqJrHm3xWOMhZJc7qY2TtM?=
 =?us-ascii?Q?IPhNuN92pt5rdQLSKjs1/O2HJv5eizrwUh91iTkVbYYHPg5Hc69tWps9pr+P?=
 =?us-ascii?Q?rvHKlPEXclJlJgWhlnl/6cTDreJ7zwuOHjzADbT7NLX8gLNXVUAMUvTtsC4Z?=
 =?us-ascii?Q?O6r7KUdPBCgpZ81G0+01r708rJ5zOEPtV4uv22UyWzrUhIkZRAjtwdFaVSuF?=
 =?us-ascii?Q?RuFGvwJrL6jAU2U0U8h5HMRq9E6H0vSVSjO/hklrDZnSxq8Rk0ChEMqTpZPk?=
 =?us-ascii?Q?Xyr73zhZ7g47z/BotCkN/3PmcFQnoNSpdOPDt7ts2+bt6Z1u5Yyu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 465c1923-2f32-4da7-0934-08df1f3081b4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 20:22:10.7182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C0Yzf3wnqdZjlIezHC5s3EuzwJE/u1qFnCQOM9G2SA/UgOOnXG45mRnDIaw+l0x9ehPngG6RxlGXcSdDLlQR9OJGmQHVjUwGH/v/LxO7erWIUr7r0w1gjxFSnnsROq2l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12096

On Mon, Sep 07, 2026 at 12:03:43PM +0530, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/bcm-sba-raid.c        | 8 ++++----
>  drivers/dma/ppc4xx/xor.h          | 2 +-
>  drivers/dma/xilinx/xilinx_dpdma.c | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma/bcm-sba-raid.c b/drivers/dma/bcm-sba-raid.c
> index 0de03611252e..485fcde390dd 100644
> --- a/drivers/dma/bcm-sba-raid.c
> +++ b/drivers/dma/bcm-sba-raid.c
> @@ -734,7 +734,7 @@ sba_prep_dma_memcpy(struct dma_chan *dchan, dma_addr_t dst, dma_addr_t src,
>  	struct sba_device *sba = to_sba_device(dchan);
>  	struct sba_request *first = NULL, *req;
>
> -	/* Create chained requests where each request is upto hw_buf_size */
> +	/* Create chained requests where each request is up to hw_buf_size */
>  	while (len) {
>  		req_len = (len < sba->hw_buf_size) ? len : sba->hw_buf_size;
>
> @@ -877,7 +877,7 @@ sba_prep_dma_xor(struct dma_chan *dchan, dma_addr_t dst, dma_addr_t *src,
>  	if (unlikely(src_cnt > sba->max_xor_srcs))
>  		return NULL;
>
> -	/* Create chained requests where each request is upto hw_buf_size */
> +	/* Create chained requests where each request is up to hw_buf_size */
>  	while (len) {
>  		req_len = (len < sba->hw_buf_size) ? len : sba->hw_buf_size;
>
> @@ -1356,7 +1356,7 @@ sba_prep_dma_pq(struct dma_chan *dchan, dma_addr_t *dst, dma_addr_t *src,
>  	if (!(flags & DMA_PREP_PQ_DISABLE_Q))
>  		dst_q = &dst[1];
>
> -	/* Create chained requests where each request is upto hw_buf_size */
> +	/* Create chained requests where each request is up to hw_buf_size */
>  	while (len) {
>  		req_len = (len < sba->hw_buf_size) ? len : sba->hw_buf_size;
>
> @@ -1626,7 +1626,7 @@ static int sba_probe(struct platform_device *pdev)
>  	sba->dev = &pdev->dev;
>  	platform_set_drvdata(pdev, sba);
>
> -	/* Number of mailbox channels should be atleast 1 */
> +	/* Number of mailbox channels should be at least 1 */
>  	ret = of_count_phandle_with_args(pdev->dev.of_node,
>  					 "mboxes", "#mbox-cells");
>  	if (ret <= 0)
> diff --git a/drivers/dma/ppc4xx/xor.h b/drivers/dma/ppc4xx/xor.h
> index da1230df2817..0931e18cd0d3 100644
> --- a/drivers/dma/ppc4xx/xor.h
> +++ b/drivers/dma/ppc4xx/xor.h
> @@ -12,7 +12,7 @@
>
>  #include <linux/types.h>
>
> -/* Number of XOR engines available on the contoller */
> +/* Number of XOR engines available on the controller */
>  #define XOR_ENGINES_NUM		1
>
>  /* Number of operands supported in the h/w */
> diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
> index d9a3542c4531..bcc188e70441 100644
> --- a/drivers/dma/xilinx/xilinx_dpdma.c
> +++ b/drivers/dma/xilinx/xilinx_dpdma.c
> @@ -1032,7 +1032,7 @@ static int xilinx_dpdma_chan_wait_no_ostand(struct xilinx_dpdma_chan *chan)
>  {
>  	int ret;
>
> -	/* Wait for a no outstanding transaction interrupt upto 50msec */
> +	/* Wait for a no outstanding transaction interrupt up to 50msec */
>  	ret = wait_event_interruptible_timeout(chan->wait_to_stop,
>  					       !xilinx_dpdma_chan_ostand(chan),
>  					       msecs_to_jiffies(50));
> --
> 2.48.1
>
