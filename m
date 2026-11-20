Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795197972;
	b=4qZmnjO4dlc+JuHxp64k8oEkCSuK5qWf8kg5qA++c9QFew4SR/JrEEOy0rPB093DAdCQ
	 aDu56D+oS2ZKGLUIJPaEh5N7KEbj32k4/Tl+sTyipISkki4uRbDOKweBE1OQF0HyTg83q
	 p37xSFZDf2QcGNeZhzZOHgbM/JddbV3++1YCc3+nleKZcrcvODWWD0jQ0bsJPM/V0wej2
	 sZeWNIsA46jU/Z5cdX75L8XRxDtmWx9hz4aFTD8DbeBQkKCgfHHedPM3R/jvm8EteHr3m
	 AzAUIwHeHNvzss2Dqb4uTvFe7Yx4s22Z0vxtobac/T4yvF1cFnUoJjV20SEf+IE3dPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197972;
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
	bh=Fkx1Jr5QRyNUCvLU1DZk373fPKJe+3ZsiI6Vpir5xtY=;
	b=uxDzP3Wrughyi55etWkhPjDO5RbfkjY1It3ChFwVoTPWUD+Lo9d1ojEjHclaFNf9ltlH
	 JAj1Be1+1IDM16xbb3e8JJZ0cP7t8WpT7sK3d4PskQ1jcu9AVYdbLP6ied6jfC+UtBWxm
	 teYb8jyCrMaOF7yEoiwW7dOkbCyqvwTkbMGwqvT7x5GdWRXp2Jip+DZN4UIsEeQHPuZCq
	 YhvB/CzJQWjT5X5y/a1bMBQ66qblnCVy4OsdLu21i06pzApDGpWULdZZZYFwJkxnWrAT7
	 VKiixqc/5/Ytc+2FQNcbNLSqkmFk78ZV+wTdUZVc/S94yKuoNSR8MnX/JskcLqOqi+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=F7dgIbhx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.16
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011016.outbound.protection.outlook.com [40.107.130.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A5C606B108;
	Fri, 20 Nov 2026 18:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10A5C606B108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=F7dgIbhx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NT4ZvuuJ5vbwXtnMsWbDwPysY3b2e8h8/LQDCNZBgC28iLlb7xrDT3WqwPu+uRf0QDwRiO4JjPPXr3UM/9uGqgkWSuF1A0baDz+3DNeLyQgWZgI8xJl18IHQR20oYokfN8rMLzN2dFF+NnpTeK0TYIb0Uy+cs8ehrKpA7w0km7sGl0LddxJHm/LAq1Q20xj7J+cewbq63kotGwx6zautFQRB1vuXdDIXW5oRgKU6I8v4hDYlXxjPMQcz/iAs3a09ooO92CozpNnIWLqk+heQladqWfLso5dwj1w6hg4CtYjJR6yXhfLd9RzClbNtc0Zn6V0p0sSDEtj3pttyHbnIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fkx1Jr5QRyNUCvLU1DZk373fPKJe+3ZsiI6Vpir5xtY=;
 b=h+P2Tvyv+WSPLbI9alopje8GfbfhbpKlMBisxMvzQ4kYnRok4rx4vrF50qL9cSgGBPdq19rg+jAFtavHQj93LQPj8MypxkVcw491w4rq9S5Vj2LxEun5cTDZ//jZBXeY6Dq49UfMOooXk43piWcFde5w8wZ41H/aWH0kVE5Kx3SmsFesWsu5SJqyouGjmqHAoG32GirZ8WjxG1kzWpfZBfxqpVxbTB/dHyZgPiqeZnnEaIT1wkyc/iMOBymfylCi/6yHGOqAD6nNLe5Ly/nfo6sfb3mHjjYlQWZvPM4OTyJQbyNVB9o6X0/+Pvnm5L+C0dWLsmiHrK4JipDZxdPtcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fkx1Jr5QRyNUCvLU1DZk373fPKJe+3ZsiI6Vpir5xtY=;
 b=F7dgIbhx1ffNQO+73z8MSmaGHnFqBt0sjmqeY9qyCI88bcBnQtY6dwV4LqeIbRSz03lfZpHPENJW8sR4Umj0ziA7Yb1/ZYwOUT6XnnnfVj4TdvIYZ224Ua5hixusbBMyLuzmEjxP3TOB/nvYRbCw44hunOHdWEenkgMArgcBvam6QNLeW9zFUiDMsDUnPYPTQJBh+hrMD9WJI4RsXPbCRg9HELLaQqk9OXq34TuCSVL5mB8+KAerkLLnfyHuxA+1a4E8vjeuWWYuPT+Sxl5pg8Af+udN7bFLRKu/1EVkKWSelQf84GJkJVOk1qogLatxJbWUGvmvhl85y8vLlOO/pw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AMBPR04MB522251.eurprd04.prod.outlook.com (2603:10a6:20b:7da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 18:06:07 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 18:06:07 +0000
Date: Fri, 20 Nov 2026 12:05:57 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] dmaengine: stm32-dma3: replace hardcoded LLI size
 with aligned descriptor size
Message-ID: <awCMBWXquRi3_WFZ@SMW015318>
References: <20261120-dma3-fixes-v1-0-f29c1f437399@foss.st.com>
 <20261120-dma3-fixes-v1-4-f29c1f437399@foss.st.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-dma3-fixes-v1-4-f29c1f437399@foss.st.com>
X-ClientProxiedBy: PH8PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::10) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AMBPR04MB522251:EE_
X-MS-Office365-Filtering-Correlation-Id: f9f24b6b-db1b-4284-9646-08df4730f307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|376014|1800799024|18002099003|22082099003|11063799006|56012099006|4143699003|261022075727099003|261021123027099003|261102123227099003|261009223027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	+vr4q2zY5zlAt+PfnIcjtst8eVUnGxcUxba7E4ygtmiVHGfjCOOPbuLHzhtxKYgkKMlh3iXQ8PrX0ZQozTFAgMkZetk0uurIfXTHa6LrGl+EvZPGJWz+ZZw0HizKd1AqYDDdv/9/xdoZYK6p9RRXhg8eVr7LqhsM3Y+6tySs0GLKTuwPMrXUmZYiqdd8oQV5+SJ+Gqhi1STVPamBp32/YoxXIhqCxIC4q4zDaPFgzCpTHJdm5KhGxsz2QU+XVcS9Sug0DRs6Xo52FyoZqkHUSKm3dS57S9Cw0E5i76jmO6oQ4ul7q7DF31FFNMELpYQaoye2eIeX8i4tStVD8tbtAwTqeoQTgKe1VTmic7UBwK29V3towzI+6jSX1m2QoiwGO/Hj9Tpn8szPac81chX8Fdyv6NBpj3MFd/qnfuafwTti/fOO+NxnDP8IeMEyuxKffMQUkUH/gioA4qU0ipfeXzQGqKCy8C+kiCn1eWUTIsfTp1b+hLMkr1e+TIUbpxkDl0MqZGIXh8EpGDXagV84G9o7CyQUqrAem/lg9cNRfwUTCI6OI7IcdVKHVXTbw8zB7ESjYiAbhEjGCcTYwbL71whe36IhoEH2+wnchcY/XmUY5DOkuECuDVql8TBYabZJYJr20UvVcXne7+PcJrPt9YHMSvP0Sqlbw5GPd0o1r1Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(261022075727099003)(261021123027099003)(261102123227099003)(261009223027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4f95sQ8sgzzYyLEe4rcBjQenNpjFRG0Ed8IN+PL1uAN9WuBMozZi/1LZTVfH?=
 =?us-ascii?Q?THLU5Vzl4WOoG7SYNdDiOTQqvFBZK/cTbJ6FiKNnYjzGP2TrSbMUydncJATn?=
 =?us-ascii?Q?BVcghsHm64xTxg4eTs4nmp6nITEtAMWa0BZeB9fBND/GuBzycrqCMJUqhYcM?=
 =?us-ascii?Q?Evsm7e8njzKKwp9lmpG6TnYVLViObhywWNHhu9aXJ6fXYGAiki7qJJqH/cDO?=
 =?us-ascii?Q?HKYrb/aApW2GpGkz5FQIjXhcn9fLwt0hVWbp/lbIhpbwpbnr/Y6+i57ym9vO?=
 =?us-ascii?Q?6NObg8yk4XCUhPlCNq5YS9yB9HX1GYRe3QMkkeDh3LR8078kc2dhR0gOC/Rv?=
 =?us-ascii?Q?A6Kc0vz5AQdEe+qq2capJGWlO8HKcnHmshYQIwVADD5b45zqW5ofZ7rbhza+?=
 =?us-ascii?Q?EyzzcohGrKysJRtOBZT1xFSnfM0e8OERbP3gsFQfBoxgM3KPh05rlwObL3Nu?=
 =?us-ascii?Q?tfuN2Xk4oSdUN+flg8YjVUDsBl7mIWbd/tQuh1YtJNBmRQi9kdhrLu89Jda2?=
 =?us-ascii?Q?gWp9YiAXj01UDtvppTpGqf+1PpUfYAxRoKTxYaZnBQ3dTH48gEPvBXRnxFMc?=
 =?us-ascii?Q?qD9VvwQblSSWlUGIVODoYH2WcIowSx4ru3YJnRFBcfUTdK+CTvZ/XtBd8bV1?=
 =?us-ascii?Q?m9ueFLR6cEH+DIcoXcyj3f5SYa4rLl18TSN53L/O39Ka0sQkopy0PZ+WBGbE?=
 =?us-ascii?Q?cnr6tfSfmqIVc9BomJm9fbtMuqM2QkowYLufnVdUREo0bYtAL26s5x9AKmiW?=
 =?us-ascii?Q?nq0cP1EwiHYflO1zbleHE1UZ+5BI6/xG66gJFrcCAb9kF2vmjJF2ksnklmdi?=
 =?us-ascii?Q?3ERk08mAAOMl39M0qHIFvtvec28CHyhV3CYneveg2G33VicAGhaRyepefM0d?=
 =?us-ascii?Q?vtYyGL+Celf/1Yr2HjTU7lZnexxK1KYfsEhDbLmUuNWmN+Z+NEfxGPgeJu0k?=
 =?us-ascii?Q?pqOwrcrWFDkaRF4MT/esUY2cuvTzP1lJ1ooXTtjqwcAfQ1UltNSwsLQfL7m0?=
 =?us-ascii?Q?bZ2nvVHVJnubGGGhcWSl4E2UL/4o0xJ7oaozFHrfAQDSxZa1CrL5dQnXIhrD?=
 =?us-ascii?Q?yKMU4ixeuSIDJYpfJp7opgkfyue8Vo9xpkjKrA/dR7e97jpNfKoAqunVDegW?=
 =?us-ascii?Q?Pgacee7AXSEi1PH64SBXr0AE00Dj15iJCA2+5UnbODHGsqY4cla2m4PiofA8?=
 =?us-ascii?Q?ZhpIK1NtnUAleIWVsPBRv8gD13JsjdaTSQphhVSdsp4OoHv3EAUX5oZGduO2?=
 =?us-ascii?Q?Kt3Pz9v8ke/Gt3Ek41HtJXiYuyf3UQSnA6rGO4Tpo2qfUyjcZwdMNPVkavu8?=
 =?us-ascii?Q?gH4hIJSHyMoOC5jw14UqeAiHnEwnK981MeR7TJfIepfrXzywziUN1oID81CM?=
 =?us-ascii?Q?a0rl0fIlOsDrcZhwF6RrPz4pzW0LL6SgUWl3PEEEKg3ywIBFyUyKPXKSSkSW?=
 =?us-ascii?Q?98/udopRpPO8vyY2IgS2v6qLCol7bdzUYmfSpbRz/MTmlOaHr5gTaA9xlsYc?=
 =?us-ascii?Q?x8bkAWyAiJPnR/l48EA+QGN1FvUliUfHgZNID5GdTq1OQcMuREafD9LCno8j?=
 =?us-ascii?Q?fRx4Yp9qqCc4eTqYLzZC8AjdLMuxkd5L2xwCrFUZWLGQ9ghS/zulYVbADqjw?=
 =?us-ascii?Q?axfrtqPq83tcIZWXVDuJY94fIQRR74pyjA5yGt1s94RrAxXoldYvH3ZDMmy7?=
 =?us-ascii?Q?eGjgHu6N4QPPF4PQY136Mh1Dk8OWPvm+BAWbDACtWO2EwwThJveTPC2v0eA+?=
 =?us-ascii?Q?mIm0N0wkRZBhgBMdsiM9z4l5IQqfcCTZr6LkMDKUCEueet3ee7x9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f24b6b-db1b-4284-9646-08df4730f307
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 18:06:07.3439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRwtUal7x3prZb0eaMYvtE/P9C9mIQrV8KHdJdT9Cjc57YgbQb6enBS837m/eiSA5/OCvtZKZDuocmmaEqqeIdODHOZnvdI4CGZxohrzGTxQFjUmPbPl7uNakkirJDgf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB522251

On Fri, Nov 20, 2026 at 10:18:04AM +0100, Amelie Delaunay wrote:
> The DMA3 driver currently hardcodes a 32-byte descriptor size when
> computing the maximum linked-list size and validating the number of
> descriptors to allocate.
>
> Compute the descriptor size from the aligned size of
> struct stm32_dma3_hwdesc, introduce a dedicated STM32_DMA3_MAX_DESC_COUNT
> macro, and use it both for the segment size limit (STM32_DMA3_MAX_SEG_SIZE)
> and for the descriptor count check (in stm32_dma3_chan_desc_alloc()).
>
> This also corrects the maximum descriptor count: CLLR_LA holds the offset
> to the next descriptor, so for a descriptor size of N bytes the last
> valid descriptor is at offset (count - 1) * N, and the maximum number of
> descriptors is (CLLR_LA / N) + 1.
>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/stm32/stm32-dma3.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
> index 7c509a69f5e5..e5724c4b2c84 100644
> --- a/drivers/dma/stm32/stm32-dma3.c
> +++ b/drivers/dma/stm32/stm32-dma3.c
> @@ -251,12 +251,14 @@ struct stm32_dma3_hwdesc {
>  } __packed __aligned(32);
>
>  /*
> - * CLLR_LA / sizeof(struct stm32_dma3_hwdesc) represents the number of hdwdesc that can be addressed
> - * by the pointer to the next linked-list data structure. The __aligned forces the 32-byte
> - * alignment. So use hardcoded 32. Multiplied by the max block size of each item, it represents
> - * the sg size limitation.
> + * (CLLR_LA / STM32_DMA3_DESC_SIZE) + 1 represents the number of hwdesc that can be addressed
> + * by the pointer to the next linked-list data structure.
> + * Multiplied by the max block size of each item, it represents the sg size limitation.
>   */
> -#define STM32_DMA3_MAX_SEG_SIZE		((CLLR_LA / 32) * STM32_DMA3_MAX_BLOCK_SIZE)
> +#define STM32_DMA3_DESC_SIZE		ALIGN(sizeof(struct stm32_dma3_hwdesc), \
> +					      __alignof__(struct stm32_dma3_hwdesc))
> +#define STM32_DMA3_MAX_DESC_COUNT	((CLLR_LA / STM32_DMA3_DESC_SIZE) + 1)
> +#define STM32_DMA3_MAX_SEG_SIZE		(STM32_DMA3_MAX_DESC_COUNT * STM32_DMA3_MAX_BLOCK_SIZE)
>
>  /*
>   * Linked-list items
> @@ -401,11 +403,10 @@ static struct stm32_dma3_swdesc *stm32_dma3_chan_desc_alloc(struct stm32_dma3_ch
>  	dma_addr_t base_addr = 0;
>
>  	/*
> -	 * If the memory to be allocated for the number of hwdesc (6 u32 members but 32-bytes
> -	 * aligned) is greater than the maximum address of CLLR_LA, then the last items can't be
> -	 * addressed, so abort the allocation.
> +	 * If the memory to be allocated for the number of hwdesc is greater than the maximum
> +	 * addressable by CLLR_LA, then the last items can't be addressed, so abort the allocation.
>  	 */
> -	if ((count * 32) > CLLR_LA) {
> +	if (count > STM32_DMA3_MAX_DESC_COUNT) {
>  		dev_err(vchan_chan_dev(&chan->vchan), "Transfer is too big (> %luB)\n", STM32_DMA3_MAX_SEG_SIZE);
>  		return NULL;
>  	}
>
> --
> 2.43.0
>
