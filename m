Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794939198;
	b=GbvoDDv4A5ZwxhYnUYlBxq6hscdLI15UeL264VoMmWlg0VG4+rcaccracd+6od3Qg1JG
	 CYBkNyk0Ufzz6UNHpID3bOjcGYMOuoSBvO81xlfvakDErdawyVsAwNNVJkj/tfoP/Da82
	 kwExzAM2xB3i38mU6Jkf4AVDMiAX1L5n02+dSZvabRsQ0NYxNO4lVsh+LH7IgmoggZpjj
	 gkcWNESWImdpVC+JdTfqmRxtNqFRiizF9mhSzKo7GNFY6P/4pVxpWvLy9QpnwoiiRiY7M
	 cZkyGCRK/kPeuOwSWURCu+dBhR3RjRgnxoi2UO3N5r9Kt97t12tKs24lLX2r7jEIQrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939198;
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
	bh=OW87j3lO4AP1KW+aUA4a/5Dk1YG7RYcrbQjqZEfZC5g=;
	b=Jv0B6jIML1xVfcmKV9lNLrR7EFYAMn4JUaQht51LBVoPvtJm6vX2MARn1kb9qtPRYT5o
	 dw2s0LEN11+KTNEaQF77LRaPE4EtZzC5/g5xumW5601mszhxc6MthCrQsv4F1j7sYkvmq
	 u3hQYVYG9s2RsojE3x3BRHbjVEV8UsBwoyPiaow1TtmXZZ98BinR5KKpzaEXNzjYM8Oe0
	 WVVnkCL1thOYuJ3pXE0X7Mnz8ryFLdFEscr//lTLM9ywsfEQYxiOrgJmxdJHVA0aMVLWy
	 mEwzQgQ6Porn49cAScB8wDmz0bMLBufnGgQvnnnQMJ79W97xZnRTrJDACE8Ps10MQFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="KIL/HF/Y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.29
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010029.outbound.protection.outlook.com [52.101.69.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4209606A31C;
	Tue, 17 Nov 2026 18:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4209606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=KIL/HF/Y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2rPaR4LdkqQm2LuL8ld6iP04+LeBW3dkPQNc6OXlsGSRoAwZpH7bAveoTcYo4AFAcgiNVIaDElhPdXcE9Guxb9b73vBuxbBvUuMzFajB4f1lyRdfzIVyHMQw6nkHfv6r80hXqBu5g5FvrOUVzLfydS2UF521pQPCDYfqZOm99pWDvzD/pjq0LqD1+vU72jbZYtTGLx3CoISGRpgdzAOb6AaI7E1EYhXGZy95vBKpflmVuFMLCSnwZgAfpxye0REGjs15D9Kt5cbKY1dntA2YH3bgGwsV1XhA3bV7JSlpzluPi1h1HNrqq7czXrWwy1qXIJidgvOISyvxI8/bv0k4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OW87j3lO4AP1KW+aUA4a/5Dk1YG7RYcrbQjqZEfZC5g=;
 b=l4M7JjU+o4MO1LQDH6Y6v53mm7r8aENc1I7KBvbOstZL5JVEVY0CUDiqamH5wnFGomRSMfWBQF96Rq6KCjXjKxXAu8NhEr6kjKJVHXT+Btv/uoYo0Atae3BA4ALx5s3X/5qALHRGPt43LYBRNQPHMKZaTJu2gYQcNtP8OC7NfMbTo2biKmHdos/QmDw8/9odSqBqC8GxYW2GtwAGL2ORg610lsTHEdS7tuFKXJW06+EQzw4Wi3jXuK13vtZyiG1rwmXemzJHdubWe6Hw52CXQbwYIorm3gHv9cLys082OkofNbZQOB8npLN6aLjM56WHtvkmFbU7thqD2oeWUw06HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OW87j3lO4AP1KW+aUA4a/5Dk1YG7RYcrbQjqZEfZC5g=;
 b=KIL/HF/YctJpj69Era1wfKgmS1K2rFY8BWprn5tfkWecSKHN2iGAa5XvgOwIfPrvyV2Udzj8C7BY6vwvBsdEcegC+VAPLz8Pigfb9xufY5Oy3A8Y5MER2v4bTPWpMlJPMuvnC27TC/acbxkCtnL5mKFtF66wbRleOXPh/W4Wu/6Ys0EJOEPk7cS/zyJMDNkKeWdQf4ZYuDpew4NltIPa7+gCB9BC25jdnOmIxjV9Y2vK1yyhoqsTMTQdxDqNEZHB6Y0yJWlx7kxwOFi4yS75CDPBPmwpzngtkEOMCU7ssywIchh5DYVGeyTnnWg2Yc+ckML8xOLz+jQUF019DvjiFA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB11663.eurprd04.prod.outlook.com (2603:10a6:10:608::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 18:13:15 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 18:13:15 +0000
Date: Tue, 17 Nov 2026 13:13:07 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Alex Guo <alexguo1023@gmail.com>
Cc: vkoul@kernel.org, afaerber@suse.de, mani@kernel.org,
	Frank.Li@kernel.org, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: owl: Check IRQ lookup result
Message-ID: <avyZM-6gM4amnQMT@lizhi-Precision-Tower-5810>
References: <CAAi4Z-d5eV8FM5sYJj1gqudWyioF++fG8P6uGX_LxbiKSXjekw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAi4Z-d5eV8FM5sYJj1gqudWyioF++fG8P6uGX_LxbiKSXjekw@mail.gmail.com>
X-ClientProxiedBy: PH8P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::21) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB11663:EE_
X-MS-Office365-Filtering-Correlation-Id: 56a407b3-fd9d-4e2b-7325-08df44d672cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|1800799024|18002099003|22082099003|11063799006|56012099006|261028144727099003|261022105027099003|261026140227099003|261021121427099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	PQdrGhBGgt9Dzm1z4CMZTE7GVPy2TCu/ZHPhkchPyaguuHmSCZOIn/jBBGypErzkNaKKiEfap+o7+0diOqXBjLHOpWOS+wRibkM+VtY24qNFUzQxviK8J6NzlZFGeI+lRaFMIZjAZ/qWHAM9zUr/pI+ygFLUxA+UlTNSLAOp1nOy5/fqYMaGd7duJicoNoezF0bxpbQDeZa7gB1EXF9M4aXxNKdTouhIanv+e7+df7TpmVC+D7hmMWIa5l/PY0hHVBKiq9KyLkQqueB/sB2KMdtrSw2x0Y8MkfwCd5FWcOUZK2f4CCKYklQeUSU3E/J4b/jWQASUkbP8gKt8NZfrzlUT3WuBoZAmU1E/Yzq9I5jK4nUVMwHDENkglyLmuKRhRUk8M9Vw2HJTZ0wKXbJFzcrasftNsMtQRSA+2dbh2qDQSYu2Mi5m2vBNjmxMDIteKdFyOG5oQcWG3i0W5RHLCpVLkAu54YfyV6Txv1q3WX8Bksgnj2fpKzvTdi/pumJEDTNsTt6YENrtReISM/cZEHkvyLDBRVLO5wx9EoBLakZMehgN7SCdXm23uAZ8RCqpdUnnzCgvFv2zB56MYuR+XtZOFctff2UXEozHWisPpk5r6Z/+uODb6VpjfBDbN1uU2E4gUIjSTEH0oTGLWpx77NM7xV+2QnAg109cp6/gyo4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(261028144727099003)(261022105027099003)(261026140227099003)(261021121427099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jfUCA1lD7lz+uN3evUsFKH7CBXn1ZNBcMV2dqdvjOH2xyba7GOQJR2vx4SbD?=
 =?us-ascii?Q?tzp3IUfCVMKo/FmMDpsnufxTop7rsC4HbI+til9igdks06/gHYegO40z+n0K?=
 =?us-ascii?Q?8a+gqvWUq/uxBZEjbSNlNCHeIKUf9r+yJP1eLY5jTa2mxmmZw/obtBqSkn66?=
 =?us-ascii?Q?poableEXaHG/w4bwKG3upwoO0n5llRLeWdxPW1ASqE21ZwNf9ghmSsVRxnZW?=
 =?us-ascii?Q?Qaf2bzUlJAVG6/S1gv4nNW0i3kT3JmH6IX3DNUvxgTsh0JmJxARm42ssp6jz?=
 =?us-ascii?Q?ZsVcKjvKgNcmg3qkdvgT/KKmucFBbAV/5q6x+IV4lJ/1McT5z5MStO1D1PjG?=
 =?us-ascii?Q?F0hgRntMSf9IP1RNhifhDuUbtx5F8GRnekld+RijZI3aGHOUDpjGKW8duIIi?=
 =?us-ascii?Q?JCwgJSBNzyf5v+Hbs1c3o5w4kRBUR1FSHZCSfNQnf5uCpumPqVGibARsBTtW?=
 =?us-ascii?Q?ZsD13km3TkWLGi9s+Yh7w+V6nWHA3TV384tjUn2WismgPs+C3TBi5+xvwPNV?=
 =?us-ascii?Q?RV5+mtZ9BHwys6c6hYqiSLmxgLnj0gxxnC9WfOtBoNLpiuKpWdleheLfGC9a?=
 =?us-ascii?Q?uiAfch5b+6juPi4aiMDhLFj+m3lpQnGP6XNls2kpvvcgNQYkfTdc9mezAj1N?=
 =?us-ascii?Q?MRR0U1hudk13GSca4e1FvobKT0gBIhapjk/y7CY0roQ1N9r9jGbf2zbVrP40?=
 =?us-ascii?Q?dOQo5K3GnywqR0cMwT7vjq54jABqI74nuv+hkjN8fewqetyQ6Ca1ZGJsXDTS?=
 =?us-ascii?Q?ZFhslG2HRwdsr6IoiFnVGv+ObkI0S1ge8qXhXQ3zL5RF4yLY3Lc7tOzRzd5B?=
 =?us-ascii?Q?xBviVLumws8zG8USEY9WFcRfGjjvT/BVVNzyB0BYhTcBlR3hC/KajEkvkac/?=
 =?us-ascii?Q?HHSG6Ic26p9IL7hvcFYBtpVpuMoT35yQq3GxW4q2+DZQuVQ3anGczQd9h3EW?=
 =?us-ascii?Q?Gm7ZKt6OCjKShzAP2p1SK7yU1/jc5FE9eUvMqMlg1SlkvbHK/HK8pBu0di3l?=
 =?us-ascii?Q?CPvO/TKeX7teJgANkpOldclLXju/Yl8Brtj3tARXcfLmY3FazT8+6jL4ACBs?=
 =?us-ascii?Q?e8aZeSxLL+iz6rC1VX9naASBWBDntUuYrThBh8dm7TWY1pValOqqrz3TrdbY?=
 =?us-ascii?Q?Y0jjVLKDeuCLQz/U7SCmdVtpzWXNmXKnxTEtOS4UuhyOdgwbggrMzoKFakRV?=
 =?us-ascii?Q?eljSZYKO4IKkFVcFOGEnIA760jrHTa/jaLWpvnou9/DTFwyWoyUvsj+xS/8J?=
 =?us-ascii?Q?byLFr5TVmcpVsX5ZHU3ydvXXF76EatwaA3jenyuMYkm/9JU7hQSozyCA6gEI?=
 =?us-ascii?Q?Y/4sOvRekZ+pfJO17LbmEVzcw0Sn4iOn/WtXOBUzCg3u7WfJOQWlre+xFh+t?=
 =?us-ascii?Q?yyXGF/h0gETmXiGNkylBZQyF12MoNqt1anLHH4Nh7+2td0UpIMwJ5/YD7PY3?=
 =?us-ascii?Q?fG7z1LRSO+TFgp3/rUVr8FnS63DqUvFCl8DPVkPKv1fnO7pClml7gE04kIIj?=
 =?us-ascii?Q?gsMeSWJFOW+XRZ/fYXBTi+W6dwheL8LezgUFdTYFH6Dnri+T26f+wOYK2fKu?=
 =?us-ascii?Q?wMXxaQ4ZSOXVem28UHcSFTnBvh7EIal+ZKnpz2c5+qayQEFaXkUP+OOo1esL?=
 =?us-ascii?Q?zY+UJ9UuMGczML3Sv6Y7WxrXMwS0riQZRqjjKaEXtVZuyRqs9tv6oHJqmSym?=
 =?us-ascii?Q?rVxAkljjatfjQjOuxfzzNY0YFNuVBl97+75mrIFQkYnlwn6JtLu+3DJdQeBW?=
 =?us-ascii?Q?m8ZQpFtZD9oO+0geVbMN4a4NsRA1szmAQWvuq9QUV/qcwEfYh3ng?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a407b3-fd9d-4e2b-7325-08df44d672cb
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 18:13:15.0188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cn2H9XWKcAm09125WtCQewuzLonW2NuPpaJuZqv6EVJ+NqraTAbLsW6g9IiJCI+W2v3I5E2SA3CL3BY1d3nb8YP6kPO9yBqwiyH1pTp+WJ4cZ/7yb2vMsONL5Ux/aG7g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11663

On Sun, Nov 15, 2026 at 02:45:05PM +0800, Alex Guo wrote:
> owl_dma_probe() passes the result of platform_get_irq() to
> devm_request_irq() even when the lookup fails. The request can replace
> the original error with -EINVAL.
>
> Return the lookup error before requesting the DMA interrupt, so a
> deferred probe can be retried.
>
> A similar issue was fixed in commit 47c3e06ed95a
> ("spi: tegra210-quad: Fix missing IRQ check in tegra_qspi_probe").
>

Drop this paragraph.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Fixes: 47e20577c24d ("dmaengine: Add Actions Semi Owl family S900 DMA driver")
> Signed-off-by: Alex Guo <alexguo1023@gmail.com>
> ---
> Build-tested the affected driver object with Clang 18 for arm64.
> No hardware test was performed.
>
>  drivers/dma/owl-dma.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/dma/owl-dma.c b/drivers/dma/owl-dma.c
> index 31a6c6e01a75..daea82718229 100644
> --- a/drivers/dma/owl-dma.c
> +++ b/drivers/dma/owl-dma.c
> @@ -1156,6 +1156,9 @@ static int owl_dma_probe(struct platform_device *pdev)
>          * simplification.
>          */
>         od->irq = platform_get_irq(pdev, 0);
> +       if (od->irq < 0)
> +               return od->irq;
> +
>         ret = devm_request_irq(&pdev->dev, od->irq, owl_dma_interrupt, 0,
>                                dev_name(&pdev->dev), od);
>         if (ret) {
> --
> 2.43.0
