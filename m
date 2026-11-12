Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794517190;
	b=KvDVpiX/5jlC9XWGwo1rMoyFfQltjZMEOuRXgTNj0wMHlCdpkAnWfnu0PNa5lQIybNhW
	 N6dFsuKpSvzErq97g2vY7Km77B1H702JO+Uxf2bklm1nDz78MZcuPZcZ7a7op6U3kMhmn
	 dEK5ghad6t5zt6JbtBMIIP0GG7VjIYPUrWncy3+0aJMiXEtslWhszHzptTTOqw1Oqzu8g
	 LWWKQyAWN92E9BB1ydddkerUlYCkzPAA+aUPEusJRyE96/s54sCnnVxBRj4IzEE8P1l60
	 GZZcVMN2qA7lFnxLtlGld3hAYhMA5ctgjbGMkAhf1iU+ZLZh4xKuKQF0cJhHbKfI3Sw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794517190;
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
	bh=UeEvwuSAwthSZKNq51SmSLW4aPKTZSf8lvtSSEqJ6Eg=;
	b=aGvvcEqBePYx58AjxH6hTXWk9ldy+TbS8Oro/oLNfKBID6KY+ecqBL9cEYgcpldCcLu9
	 hRbtXWRzLoMQ6yJ1M30TTWyDdmgWzK5Dw9vvKm0DhtZfmbhUwSKgHZq09ZM8DPai7UBPb
	 RQNBxWTrM25q5SCHMVJczECajoR0CNSNzts/YFrimquvQmHCjquadLfkp/qBpVV3Nl2ka
	 LsLmfYuHNQbMa2OhZmWWNj0IAxZ9WYAvjXn47RUQLGW1mPJyt+RRgwkY2SJC/PLAZn0Vy
	 Clgpd+0c6nKCuSCL9ewaCUCmpWUmLPEEPmmu/jvMl8DOTc5iMv5Lh1zyRBquv1o8ObQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kozjveYq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.3
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011003.outbound.protection.outlook.com [52.101.70.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB034606A31C
	for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 20:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB034606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kozjveYq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dVdC6eDjDMDs2x/dpsxCG1zTdljG6dbUgjoNGaKNyjbzI2DNiwf2VWeC4l7hDBCKvKs1e0zo+6IBA7l9GoQ1YjgkhfcONehDAoXpEaa2QqV4FDNdKZ91dDO9qVL5zLDKTYnbtYtxWAakTgzYlVftYg910ZqDeaNXB7x0rn8blLcGCR1lhdW5kBhuEX7PwNMTHRch4Di+Ciq6nQqQlRaVMGiRJddgjWyBNWVyJnq09pFGZQPBRHOddit6aRIVPls6K7BggnT1Nynkfhlgd8GjiK77hzqya8yWoBoU+CzBix1JOBsq53sgT55QyoL3dDdhjY9kyeM1by4FQp3K5PIC5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UeEvwuSAwthSZKNq51SmSLW4aPKTZSf8lvtSSEqJ6Eg=;
 b=YEIzCXPtme8EVE45h2z4+w6ZHFSX+49YBePmRUwkU33h0pE5ulcDW4BnsdOlknobJzyNLe9jlB40Y6rpj3by6kcb9WvAbyXCJF7/d2bcwte7IFvgstE9paVwzWexKXJw5dvb4ndwgasTB9ZvBIE+0TGnXgqGeQ20Tzct2vcec/+3py/LLEtYNDreTIh4Brm8d2Ibj5A+VAwymzAAuDOEuvD7ZaCqF/aUDGaQwNYqg41A8DP5ecHBGkk85GME72wbnky5Gfi2xZIB2I1Xs8MWdBdxvC2/1rErF8OfG4ELfvl3MFuVPLpDidUITZQvNFJ7Dzr0RE/umGjcZ94ZTy/jbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeEvwuSAwthSZKNq51SmSLW4aPKTZSf8lvtSSEqJ6Eg=;
 b=kozjveYq9H2OvpPom20zL6O59S9WNmok+AXk/NlA5ERTY5heARSP7v+rQy8fm8GZ0qF58Zlt6Qsj2SNidzmIK43CdGUmpQ7OBXP0uxcE6PppngJg+z2fDPWeDVegChOl2G8BoRMIaTdyTRieuZiYJ4mmrrAhyYaSRteJHRiL4gzsEBHnhGuhrzuZGVZf+GezZIrJlY6dJXzvsNXLsdMitrlX3jipq7luipnFrsqhIw0l65maNX6fFNtvEwYsJ1o8Tb8kCckhdMqnXXUJwxInjxoOj8+S3twvzx6gAMPzXAYLXRHFFXJqu4UoMG+vY8kBKCF3rs2r4697j3PWXsi55Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by BR0PR04MB715228.eurprd04.prod.outlook.com (2603:10a6:2c8:44::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 20:59:47 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 20:59:47 +0000
Date: Thu, 12 Nov 2026 14:59:38 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Subject: Re: [PATCH] dmaengine: ste_dma40: Keep prepared descriptors across
 termination
Message-ID: <avYourwIh_YGRjcH@SMW015318>
References: <20261104-dma40-fixes-v1-1-48c5180f5210@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-dma40-fixes-v1-1-48c5180f5210@kernel.org>
X-ClientProxiedBy: PA7P264CA0322.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:395::6) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|BR0PR04MB715228:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ccf3605-1565-4f56-2395-08df40ffe248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|376014|22082099003|18002099003|17002099007|6133799003|56012099006|10067099003|11063799006|261028144727099003|261026121527099003|261026135527099003|261026140227099003|261022105027099003|261026130827099003|261022113327099003|261021123027099003|261021135927099003|261021133027099003|261021130227099003|261009223027099003|261022075727099003|261021121427099003|261102123227099003|261022115727099003;
X-Microsoft-Antispam-Message-Info:
	AtCnQUvfIb65X9gtuJHhgql6HKIIIOXO11hcFXOq+YE/Z35mfENksoHkt4UxRg9Dsx2UsHfBRYIHavuAGzm4bB4CcepF01UzgJMF9kjIZ9XwzBxhe1+P/FyJm7QVh771Icn90P8bGZNGCtSyEFZq2fKSeqMlXsPh+wtWPLLO1fZs21O3nfm56x73075HEzBfJct3ZKeZWBfm0gUGfVdmtx0MGSJJ9Yh34ibZGWGZEjWOejTxr283eV+MpspYrILcGL19CDxoihebTJr1F6qHL+N6auFiYwPBBpbhTdOwk3z5VWSLy0Y09bBb+UGP2V5q6JDII4RqGveNEJiZeWVXKdy7pZJJKMlS8dAok5pLhIw0Iipq5H6BsMZW0naRsBVrosFMtaNLjey4NxveFddVUP0qMpYBlM0YRkIgB2lhU0Bg3gXef/iy6QnR9LON2KUnPBNF0jKT7D9nd5cWJnMF+BlZ0msCEYLQ77G8G6wuLIjRUEhe0qNXEEbXSUxW4zYmlYUUkvU+CxNXQiQO4/VohCHoY6omg1oPm+rzKcOskWp3TmTCxOnYTGkCF0d2AFIwE68mmydqY5FXLEIWmZzjKxeNSGaLXbY67Ssy4Xm+AT9tQpnSj4RFuKQX/zafqvK+7TRZfo5VavdU/PZgx3lavoXh5tso3MBcQV4OYoBKdL0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(376014)(22082099003)(18002099003)(17002099007)(6133799003)(56012099006)(10067099003)(11063799006)(261028144727099003)(261026121527099003)(261026135527099003)(261026140227099003)(261022105027099003)(261026130827099003)(261022113327099003)(261021123027099003)(261021135927099003)(261021133027099003)(261021130227099003)(261009223027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261022115727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GglzoUM3Er09ajQJHfj8O3dEjmpZelS8HrgJOmZiyli7CQWdUXyoAyNjdvO/?=
 =?us-ascii?Q?nSqYg861RivdBbZW8d7IcV/oj1CIWsTe/cKGpZktlnlP02guNaQiPDe1re7K?=
 =?us-ascii?Q?3Vp8sO115C7viDMNoW6ZhPQvXdXtmh6pIHMNDXACZIW42ybzoqaelTuUTefL?=
 =?us-ascii?Q?YO51zFtLNK0Sh+rt9kMWGIiHpGRIjk4r33eUGM8ZWE5r0ZqtDPYYvyC85JvJ?=
 =?us-ascii?Q?YT3GYT5yYhshpFrH8Tort/vcF5Ix5+qDAUcRMFz9trkY+wKbCS2IyTTAE2pL?=
 =?us-ascii?Q?pgywmGsFCbvzrPZ6Pzeahpk2qkOZV1EQ5LfGpG4JGV73zH68LI2DuXNPaiB6?=
 =?us-ascii?Q?ZV1yaQ48C5G/TufoTwshNJpBWrv234wudRddp9gj09Th5sqDURItsCA8s7IO?=
 =?us-ascii?Q?55+KHnWeYhLAFTim8zDHybmtLRRgI8eJRsOAtQ/A+fZH9k1Ex2MPrITWZduB?=
 =?us-ascii?Q?rQ58CvW9YOF0u6yFc1gtxO3i0MvFHXTzaKF5GLjfMGw1BBbknpTwvsbtNJ0E?=
 =?us-ascii?Q?TwZGkSNswvxlHluaRMV0d4//VzImcf3WrucQYw/BskVudpwFxRCvvTKBJe23?=
 =?us-ascii?Q?DoMz5+ksLts+KjblhT5X0XVW0UMcA6T9E4/LZBRpdTnKGGIoPVPsmglNhC5P?=
 =?us-ascii?Q?u1AopNwjavn2W623zoeziTXEpuhyIGpKZSO+BNzIwbfGSyG2Y0S2SiBag0Zx?=
 =?us-ascii?Q?u8seyAi5VNFuEWAQoF8Q6GNDWCRYJ49NMjsbmPcfE94kPfiKqMmrDsdJHRIC?=
 =?us-ascii?Q?Zq26z7BRcApZeNeC/RY9dml94LD7l82jhi7uZWhVUM71PWSQBZRi60OJNPXD?=
 =?us-ascii?Q?fgJG38YBSIihSWnzo+TCZvMcJa/WQFRNo6/rCwSvkf/15F6B6q939zstZK2l?=
 =?us-ascii?Q?qbifKJLTiiLNXEtifSExQHSf3eYUol8sirCiRaBILE9tRpuEaPS33S/Mkd3F?=
 =?us-ascii?Q?3mTlRCtBfCT3zaOWzklRRO4ffrWymLgvioY6VXYF29+ZhcqQOGI6iJdTIvNS?=
 =?us-ascii?Q?jMSyIpty6gs8SDcilzeiUI+emsSAUbjDWgEZkLaTsnVAq4m7WVGO/bfn2g/y?=
 =?us-ascii?Q?22Fc2T5nH5w7KJGLSbWsiLNavPqL2oHDvveEUfyF+aCLxsvZAM1EhAZlSKn9?=
 =?us-ascii?Q?7nbxEW1ViTCTeaIBenuuoENnM959xRVKMuP6zSIvEz2fcoYCFAcNRJiUel+Z?=
 =?us-ascii?Q?mIZBRMH0zzz79xtz4wCN9fN8c140v6Iv+hdSIprHXuUwgVFAhAK5lXcJtoc4?=
 =?us-ascii?Q?AocwTaNqNUoUpN0/VwdutzQEVb16wlskKWeLYgOzmc1w20zPCmDZxFZ8gC5V?=
 =?us-ascii?Q?aduqGt1IbxgV4DSzrwMY/f09HPBwUXbFLAEnzJBK5uqQcfOMIiEcPIokJYxE?=
 =?us-ascii?Q?J0oCitO4CGE7wEQpGKmau9tyMUbRusi4uvPjE/nPaz00JXpagg0WqoBxsD14?=
 =?us-ascii?Q?mbfG+tRowl4LYW3B/CR855kN4CsgagOWBH7UVK2YedB4Fe7kPaCQs7vKKe64?=
 =?us-ascii?Q?BjfDE3CglaflFjTkk3fahvWvfz/YAcNwol1rlb8YcQF8yfF3iOh0dYUNFJzB?=
 =?us-ascii?Q?ZYUUbpDlPe3qXrV3/wyh+mitt9Ey/zEgpNh8E0BzrzKilzrE3X4pBoV/jawu?=
 =?us-ascii?Q?MN06L22PXwtdD1u2iz4P2g8WY04DzLub1uJAjkp0Ai7i24AWr3iDtzXrhsEW?=
 =?us-ascii?Q?bUAhwz57YQ8oiSycROvzPu9eROE82tn37cFOqdsykSaQKklpsFN107LRdsW1?=
 =?us-ascii?Q?SK4DsunLBDAv/g5llSGjhmJHalMOkt2MooQ6O7ev9Ipcu/PjGWqz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ccf3605-1565-4f56-2395-08df40ffe248
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 20:59:46.9723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5RzY8dYTF0NVkSoAMQFa96o2hppsCw/Lm+aNEj9sXyaJh4ZQukc02r5WmDL9ZsNptYqmpqB3RDT9b9vXXaX+rqriqHFzZWFakDKnwuCUyvPdQKZDCD0WGRRhn9cWAXa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB715228

On Wed, Nov 04, 2026 at 10:28:02PM +0100, Linus Walleij wrote:
> MMCI can prepare the next request while the current DMA transfer is
> running. If the current request fails, its error handler terminates the
> channel before the next descriptor has been submitted.
>
> d40_term_all() frees that descriptor from prepare_queue, although MMCI
> still holds its pointer. Submitting it later accesses freed memory in
> d40_tx_submit(). A reported crash writes to 0x104 through a list pointer
> containing LIST_POISON1, which is consistent with this sequence.
>
> Termination only cancels transfers that have been submitted. Leave
> prepared descriptors on prepare_queue so the client can still submit
> them, and release any remaining prepared descriptors when the channel
> resources are freed. Keep tracking them so abandoned descriptors are
> reclaimed at channel teardown.
>
> Fixes: 82babbb361f2 ("dmaengine/ste_dma40: fix memory leak due to prepared descriptors")
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 74dd4cbdc3c0..f1cbc719c4f0 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -1166,14 +1166,6 @@ static void d40_term_all(struct d40_chan *d40c)
>  			d40_desc_free(d40c, d40d);
>  		}
>
> -	/* Release descriptors in prepare queue */
> -	if (!list_empty(&d40c->prepare_queue))
> -		list_for_each_entry_safe(d40d, _d,
> -					 &d40c->prepare_queue, node) {
> -			d40_desc_remove(d40d);
> -			d40_desc_free(d40c, d40d);
> -		}
> -
>  	d40c->pending_tx = 0;
>  }
>
> @@ -2222,7 +2214,8 @@ static int d40_config_memcpy(struct d40_chan *d40c)
>
>  static int d40_free_dma(struct d40_chan *d40c)
>  {
> -
> +	struct d40_desc *d40d;
> +	struct d40_desc *_d;
>  	int res = 0;
>  	u32 event = D40_TYPE_TO_EVENT(d40c->dma_cfg.dev_type);
>  	struct d40_phy_res *phy = d40c->phy_chan;
> @@ -2252,6 +2245,12 @@ static int d40_free_dma(struct d40_chan *d40c)
>  	/* Release descriptor state; this does not access DMA40 registers. */
>  	d40_term_all(d40c);
>
> +	/* Release any prepared descriptors the client did not submit. */
> +	list_for_each_entry_safe(d40d, _d, &d40c->prepare_queue, node) {
> +		d40_desc_remove(d40d);
> +		d40_desc_free(d40c, d40d);
> +	}
> +
>  	res = pm_runtime_resume_and_get(d40c->base->dev);
>  	if (res >= 0) {
>  		res = d40_channel_execute_command(d40c, D40_DMA_STOP);
> @@ -2508,10 +2507,7 @@ d40_prep_sg(struct dma_chan *dchan, struct scatterlist *sg_src,
>  		goto free_desc;
>  	}
>
> -	/*
> -	 * add descriptor to the prepare queue in order to be able
> -	 * to free them later in terminate_all
> -	 */
> +	/* Track prepared descriptors until submission or channel release. */
>  	list_add_tail(&desc->node, &chan->prepare_queue);
>
>  	spin_unlock_irqrestore(&chan->lock, flags);
>
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261104-dma40-fixes-d9db6094b7d9
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>
