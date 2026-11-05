Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793898978;
	b=OGgozxUN9EeVTsKXJuKVvUsrUtfkE8oTTw7y514Vxoh9bOS9GUp1MfM7VwU6CPBYE0lY
	 19y9OKV94F291zawiqUGZ7gQXUs8l6sdSw3qBH2oGQ3AJUKAK9CQvRp3IEVopBVnEtppC
	 k0d+9gs13nTYyf5FdHZOreRMNedV8j67Yt1Y34LjAJ8ARc59Vmjjjp7wx9Xd1VS6r6kg/
	 upOPcibyUzlVPqRO9KKU9Zk33IokCt3wBPDoVwbX0fd6wn293xCZAWuB2kmSsX6BSrsM9
	 0/TblXT5gM29lE5rooMM64hRSUTqKhz4rQcneC4fV+bpoBpUFNdRQaIQqLoKVLSiV4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898978;
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
	bh=c1oaV50r0BSd667/ZSOu25B4lQvIuX/athwm5rSTjpo=;
	b=J2EQ8Wjx9oDKNW2WmzSpDCaaql9T1W4uG5zz1hoW/yfUfaPlREvvyOXLlZ61F4JoXASa
	 Y/hm3lQVG+v/+6ezFJTAV27CQdOEpClS6Fif4f0VSv118/mqVNKGrxbp/SOpEojfG2rk1
	 hk/8KP2O0ANOCLZoZ4knXh2FIMu5SBl3pcc8YgxNZjxOw4K/gEZGouhZjG/PEo156A5mq
	 cnxc8wSsFPpuwhlG006JKyQR4FVfYYH6QkY8FiejqoBqANSMjx/VNTtST19TyjGNR7EfG
	 yvZ22AIoNQPbSZH+hnr46ER6+Tif/t4F85mQBVxBxh70SchShdjca8PqJ4fbfgO5zCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="fH42CU/x";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.1
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011001.outbound.protection.outlook.com [52.101.70.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0675606A326;
	Thu,  5 Nov 2026 17:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0675606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=fH42CU/x
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfqKPtJoRsQM26bi+UGzJ6iD6ouz0X7iMJPv76VXI4J9bCOwlitHqcOuAdD7XVYPWEhBrfpT8u7/Cg8lmVoyfpUStBppj1Iq1uN++xpJwLWVZDKAKzGTCR7YJbbbaZlG404TONv4FitQv+nW6DP5uaqYHBobD1gtVfSt+lS0xjqBwYcgmj8iI6e40UyzPa0NRB1yxvWcFKIDN6N/nJB9vUoSbOJTpciO1K/dBn41Gq6zUi97tDstyAOSyL1caJc18HyNyerhVgmi08+GY3k/8bcMBP81MkIsg2PQ0acFv0e07TWtnUvslKEs9XmlQMStF7hQhce9wnzMmZppWRDjZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1oaV50r0BSd667/ZSOu25B4lQvIuX/athwm5rSTjpo=;
 b=Drd6h5XVddY+nWRKf0rtX66B646N1h+RAAJaYI/aBS+K/828LTziiw3M6sG1TWIIdMwaHMWBhqutTJ2U/7UH+DEV2getMIjKR0xbp8bcWnUNo0yYUOxnVt5HFZXryzjItNzggXLnaJFq1oD3A3+8aBLUyapfl0VBO8M+mD630EMvq//d4sne5MXLzmTZ0x3lrQQeEuln8TqlzrRWdJs0pKU1nW0aCO/wBjKf62o/t9ccjtQjrdC3PtOLV7faxSSR389Ks8T8BNouZd7XT7z17T5BEbwC9EDrljwgLZhuW+86aYsQeGazhSDngnfBXLZwZF2nYER4FIYYtD2Q1chEnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1oaV50r0BSd667/ZSOu25B4lQvIuX/athwm5rSTjpo=;
 b=fH42CU/x7yOmEzARlSDY0HY8SGpTG/8glc1i+IqKCdywr6hVwHKSQAQ17+33pcuirXxO9cH6Mjt7jTgp3cFzKa3wH5pDh+StHS9Hg0P5O5a7KVn9PdCAMRmP7NRzBnb89JIRkly7brCy81RG+00Ej1hJCNlLc648UoNwtkiYYOmpYqn7Zpt0oK71jtaRQFTurbLaBs5fAh6vN7LnevJw1PtdRCHfi5lPMbkykOw+jeI/kDG9uXyIO8US8fjlEfLLt2NX1sqNQAiNQhcFVi9Xnu9G7gQQfiPScjv6tIk66SGw8mVhLI3dfHjmYrbY7zF0DG7iYA4XqclZjzQrhGLauA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI1PR04MB6926.eurprd04.prod.outlook.com (2603:10a6:803:133::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 17:16:14 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 17:16:14 +0000
Date: Thu, 5 Nov 2026 11:16:04 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Sergey Matsievskiy <matsievskiysv@gmail.com>
Cc: dmaengine@vger.kernel.org, lars@metafoo.de, vkoul@kernel.org,
	Frank.Li@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: axi-dmac: fix incorrect segment size
 calculation
Message-ID: <auy51OzXH3VKZk8a@SMW015318>
References: <20261105131547.305510-1-matsievskiysv@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105131547.305510-1-matsievskiysv@gmail.com>
X-ClientProxiedBy: SA1P222CA0107.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::28) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI1PR04MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ff9f2a7-1fbc-40f4-cec2-08df3b607ec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|19092799006|11063799006|56012099006|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261026121527099003|261102123227099003|261009223027099003|261026140227099003|261028144727099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	c5Rc3PX2cSbxhbuBLyInS2xnvpPvU5fh5fk7rUzp1f+D70xIfx3wZ5+9kZsLHYsYkn+m2urVhSHwE92bwyM/R7qE5RIBO2yjlCWU6kfgOB21q8Kc0ujLnNk723ASb2FT5mDhwLYFKdSf5JGrCXKhfpx3x5RokhIJufZTM1HAqZoksN1gqSMlN6n/UApU4VBFu3gkXE1n7NVuQNPhth1uGmPMdkkRF77yqKb96hh9zkibrQj5frTTSA+Hrp/XSb4h8c/KLxlWhXyOABMI5az7gojtiwARA07juI7XAbSV3GqcS/EeoNfFP28ZgNctd6a9gXMjcBIw7iHR52JizZAbWlqctv4BmucEI69ez+9JIyQDbTJjAPAyWVJJXA95RGp7Myl9+k+pigyhgJ40rvRA9fnnzTVNN2T3EALZ6CC0qz21hUXYf2PuqMKePovKxtTj3IvFGY7G1enGVrXeC9xoEszPT0dPpDH/yiSgiM8so5OdQf1utm/H027GOtTbcJZ4rPkiw6EH3RaR7NKzI3GOb+bIY7Cc0Rqw2MKNMli0iWGwPKhEoPzUFY27pdsPbk3qBP+XD+U+Osl+QavCOQuFGBsyFO5nMBIsgY/kydQOUgKFdILxkx3nYxPbUl3NZdKHRZAG2ZpTk89bGG1PbSORWVAvxwGEy1ci0rmwlSP0Z/0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(19092799006)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261026121527099003)(261102123227099003)(261009223027099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I/RLKXPqVHXXak7NlZABzfEkoyyqSMOX7Tnfg3F86tHm9hqJpx+ZUwWOL1Z2?=
 =?us-ascii?Q?MA00utwQlC7KyoapcCZ3b4jk3LhF7+33QcL9CvvTGd3XUYOzF/gLAH5dRcSB?=
 =?us-ascii?Q?l6ypJltUe4NYozRAmBUPELlnRW95DLAVrl5Ya/4rWxrsISl/Z86T0yv4rTdL?=
 =?us-ascii?Q?42FNVzsLBa89SD4nO8bnwRWWuf18RTlwx2W5GADL+prOleUprsD23+f1x8m9?=
 =?us-ascii?Q?aljTteqmDaDGcjgbL83qh8VECHFO2CFokvAggEm0X4W/rRZ32B0OqKhg+TGP?=
 =?us-ascii?Q?9h1naYv04FdzZ6A3scG3ufeTOTRhGilN4AoV2H8zP0ddCYkasQVqBsJBsf+H?=
 =?us-ascii?Q?vyeT2tHIL5Fayywcs7y14xkdEwk/fY8jo0QvzXqF6jOOz8xuo6y1I9R0ufHV?=
 =?us-ascii?Q?on61XPNmwSo+IBH1dX1CLK+tk/lz2PxjzWvsmqeBe/JNKGcx7BghAoJcbrHQ?=
 =?us-ascii?Q?Dq1o7mBexPXwzx5u7NM2D94gRe5rCf95sInnzhkz5NBZkaJnmA7X40hMHrur?=
 =?us-ascii?Q?MgUB+HHCf7a/P5/UEcQcx09W3QRyuv1vneyeFF/A3VwjJYqqiazPD4ZU5s6E?=
 =?us-ascii?Q?KZFNiLLzQ4oZiobkWY4+gmmJsZLr2O04s5oNtWJPKXPcJtUkAltZ+wSczbOu?=
 =?us-ascii?Q?87fTzW+W5TnpxZBD9ah/nJvbWkd+0Eug9jfdW8D170z28R4A5OYeHif8OhPT?=
 =?us-ascii?Q?XmSOa16Ca5qNkwX0IQ7RPfkXpoCABgVU4+2GUeHJ4EXHSctAmaeEUIJaNVQ6?=
 =?us-ascii?Q?GUmi6z741XtUF03W/OT9HnPASBldwfElYuE3dyKzf7ZDGa0GJzFetpI1Lilo?=
 =?us-ascii?Q?zwqIA+Q3sd31xs9sQAb2QD4K9Fmvuq4BIvRtbFZAKnE4zh/HNxEtKQArPe9k?=
 =?us-ascii?Q?l8gcwrBhUT3vV5d624YCyxbBpcmzlRgADaqKHa/Clpup7wATLNLGYO5QJAlt?=
 =?us-ascii?Q?mH4i5uxJA9G5NgmZ2h56Sg1+RcWGRn5KMGrrke1+JG6RSV8kueCC21eU20xT?=
 =?us-ascii?Q?cFlN6/TDC9HtfUC8vMDFOvh4xQGBRL4bPThNEr/6f09KK1p4NbWDDKnkwuPd?=
 =?us-ascii?Q?apOF9NHcbc/XEvSGwpeAztew63/IsSIWlO+CadiDDCvpv/7oMXaOvuyPlewB?=
 =?us-ascii?Q?rHv4QaV0iglHVwSw1qVAUhr5EYVbJSz5yWeGdgCP9R9Cy8yXB3vUDAD3f6wG?=
 =?us-ascii?Q?477TE4/HMSQjgSrVHN7KCnIiImMmkc7a+sLfaoifEhc3boSWetFauhzBdn/T?=
 =?us-ascii?Q?6W89VJZ4CzZDlZ+QtBDjLf5c+n9vfE8fVRLid5wjyJdFJuL6h15tmnO7Hoku?=
 =?us-ascii?Q?zftglmbdstZmwKxx63eSEowLx+H4FNuNR11jBU43Ji+VkY8kGWmLqV6gPRcV?=
 =?us-ascii?Q?S+YashvOiziKEWSP8A4wEwkhIEqxnP79vPXYNvKLDrfL4/yXXqxO/O7tnpiG?=
 =?us-ascii?Q?cWS3ZnRVtjjUw/7x0nUFKUK/bRsirbrfGkPEEeJ5bUx7a7FgdMORl97m6fgI?=
 =?us-ascii?Q?Sc8YKgfd6Vx8VdtghyTXSEt6KAw+la53DSogc/OC5vcy0fbmpEEmR8Vq8ptm?=
 =?us-ascii?Q?CAEgXi8nomqyBXIQu+UsJ69aWKYHWp5RCykAoyoKK05vj9YXT6U1vNs3KqeJ?=
 =?us-ascii?Q?8rfeKFO2Iyyiz665kxActLqIToTEd2PbcDqKkVS/LhxO2+bGbsDfGs2oqri4?=
 =?us-ascii?Q?DvAoVLFc6AUThgesXjk2XZdjGbc/JPbrkEhIZQEq54xkMqj4eHAJj+l7C0Y3?=
 =?us-ascii?Q?Hx3gRu6jh9SQI5YqmhmVCKMFgEN1sF1w3LIMlq/VZEq/bfado1PM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ff9f2a7-1fbc-40f4-cec2-08df3b607ec1
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:16:14.1364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qr4bhaakRIv4NCN0721IPfbx2CbWUqbSdls+2/337wc/Iq/koa7sAiqBJNjXB6zL2AuyPmCmXN0Qw2ozQJR6OLKilXCE/9VYFblVHfcI4RbzhJLDc3iYVof4JEMfeQLu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6926

On Thu, Nov 05, 2026 at 04:15:47PM +0300, Sergey Matsievskiy wrote:
> [You don't often get email from matsievskiysv@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> When chan->max_length has a value of 0xffffffff (which is a possible IP
> configuration), DIV_ROUND_UP returns 0, resulting in incorrect number of
> segments calculation. Fix this by using DIV_ROUND_UP_ULL division
> function.
>
> Signed-off-by: Sergey Matsievskiy <matsievskiysv@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/dma-axi-dmac.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
> index 02acde918117..0a308630e542 100644
> --- a/drivers/dma/dma-axi-dmac.c
> +++ b/drivers/dma/dma-axi-dmac.c
> @@ -707,7 +707,7 @@ static struct axi_dmac_sg *axi_dmac_fill_linear_sg(struct axi_dmac_chan *chan,
>         unsigned int len;
>
>         /* Split into multiple equally sized segments if necessary */
> -       num_segments = DIV_ROUND_UP(period_len, chan->max_length);
> +       num_segments = DIV_ROUND_UP_ULL(period_len, chan->max_length);
>         segment_size = DIV_ROUND_UP(period_len, num_segments);
>         /* Take care of alignment */
>         segment_size = ((segment_size - 1) | chan->length_align_mask) + 1;
> @@ -753,7 +753,7 @@ axi_dmac_prep_peripheral_dma_vec(struct dma_chan *c, const struct dma_vec *vecs,
>                 return NULL;
>
>         for (i = 0; i < nb; i++)
> -               num_sgs += DIV_ROUND_UP(vecs[i].len, chan->max_length);
> +               num_sgs += DIV_ROUND_UP_ULL(vecs[i].len, chan->max_length);
>
>         desc = axi_dmac_alloc_desc(chan, num_sgs);
>         if (!desc)
> @@ -840,7 +840,7 @@ static struct dma_async_tx_descriptor *axi_dmac_prep_dma_cyclic(
>                 return NULL;
>
>         num_periods = buf_len / period_len;
> -       num_segments = DIV_ROUND_UP(period_len, chan->max_length);
> +       num_segments = DIV_ROUND_UP_ULL(period_len, chan->max_length);
>         num_sgs = num_periods * num_segments;
>
>         desc = axi_dmac_alloc_desc(chan, num_sgs);
> --
> 2.47.3
>
