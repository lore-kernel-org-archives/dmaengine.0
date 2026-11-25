Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795635737;
	b=g5KVDkkp9eK6VoC8w8QUrLFDKC7QLH9LYgp2ZvR1zOg1hmYu0xOebsLNrVDX47EOuAJc
	 bra0TimbwA3IkifUovTbi2bYmS0lN/zEvxlAjcyXv7YhQdtV1fa2it9Ju8Sxv123pNCK3
	 gXyVQ6qEI7/Z3mzjiiwJ5m5F5y2PJJU0JAjGVirDh8f+jC17ugI8IXYVPUxE/GG8WoAmm
	 NmId7EjV2f2DJDdY+R/7rXiQyFEwpDZQ7rFOO0wfAYf3AunwyGxr1EwnNi1nSCKi1tM7X
	 wjUY23v6Ak7Nock8qcoPp/SWB/7w75g61DVJM3uWRjvofXY3yfrTwx8w6FUsKKDEd3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635737;
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
	bh=mFZy1Pk6dVXQtfpP5GKHVgvdWPwLpuIZh9Y2S55Vr70=;
	b=yFA0kcpVnRBu0KJeTQZbWPnz9Aew5GDWpqJsYmjBq1+a+ofoSY982Bal5ORUWnalvNQf
	 1vNr7nNE+PNO69SrU5R+WR6JAQyNjG6pu1hX4yE4whH25unNVlGik9Ui2dTyc0uSy/Yk1
	 6Aytw9+qI9Uko5vNRvnV7kmNtUA09hJg4QQpCHNzBqJmG1N14D8/HIVWVzf3fg3AHnVz4
	 LjdiKMA5jUHwgAQ6hnMR8d0SfuMN6LQ+xVZ2bpOlnPcdt5fgJRxfLawZLGbN+eXzZZJ8g
	 IvuXTsZ956vEGvjVAkMlH6521WqoG43h9e7gfEXFuL0R/dQI5mzXoZI2SCpw4EpIiew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="o/3X/3YO";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.71
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012071.outbound.protection.outlook.com [52.101.66.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C41606A31E
	for <dmaengine@vger.kernel.org>; Wed, 25 Nov 2026 19:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09C41606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=o/3X/3YO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cgr5NmQ1lkQd3qG+AmcULOj0QVM5yvGTP/N1zEM+cibnBXojAz5zf/q8daI4rRsllxGehpHxFN85oWkPxtK3Fmybd2MV3VN8CJlCrzcqbTcgqx4BlAP1WkQXIkN9YAvFxs4qXzHiUEOfpmx8icVLnlthXwmGqfQciiKnc4mc7nDumgTGy/0rCisjijrvOJ+MQxd+TgCnlbsgEbbYwsO3sfgxG1bwSjmpRhDkoUgJaIREI2Wg1LUmlazBsyYNzt4xH/TlMaTGw+tYXr+cSayEgMepmivjiVUsq03GnA55mOvncGnWGBrySygqxxmIHy4g7R9fJb5lyGTLgD0oT2yiTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFZy1Pk6dVXQtfpP5GKHVgvdWPwLpuIZh9Y2S55Vr70=;
 b=vdcDQt3Ol8Y7WNc3TKmEVt+EMtV8M8V1TDMwMt+r97OJxZjP9jSbnUBs0pSxiwjMpU6I2nZHT+V2rfEaI25ldBWQPwVlif8mwmpKRax2yZfnLw7M8ym2oDr6QR9IF9V3B4psEsxT86H/SAP9JHf+LDW6s8ys+9irITYOzfMUqS/f5CimcHdQvJWwfweCh1ykTvfnumQh812lDLMucey8ae2xCwzYa8ISsnbsBr4HGW5PsqhNpwXQEN4clg58apoE6JXypT+oB2yD0MGeoNNcZXNHtA86YTcTYmVndUZmKKnujZZliENgoQsBRVLoJI98ii4pr6bRIOmsHlmO9Yi4wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFZy1Pk6dVXQtfpP5GKHVgvdWPwLpuIZh9Y2S55Vr70=;
 b=o/3X/3YOa1ZI1kYunGF9iW+3sOEgHIN+dDP1l/DpLY/1c+mtRumouSBASeFZb2QbmwOdvIDusRDtROjdFIqke4fPyjC4jz4C19JOm6XE1+n4Zp9992e0JsZWOViLlP6TG5anYgsun+oLnko+B3licxzYeV0Ai5uukiQUd9vEigYfbqJqpL/UBsaDgBxihnOtjHLdVzHHitVJNWVVKpGyc1XNI3KrU/c8idYni2SQC1jfgmY8kYOJ7BVGchbAwOA/z0rOpkwoPYqg/HUWWxrOimw+BR8sEnMqX81RH9JZxgyTKDGb4k8sKqz+Mog6IcSCjIddP6VrDCyZN0gaq7PvSg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB10183.eurprd04.prod.outlook.com (2603:10a6:150:1c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 19:42:11 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 19:42:11 +0000
Date: Wed, 25 Nov 2026 13:42:01 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: sashiko-reviews@lists.linux.dev, dmaengine@vger.kernel.org,
	vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v5 4/4] dmaengine: switchtec-dma: add pmon sysfs
 attributes
Message-ID: <awc6CeW_vnMQBWPe@SMW015318>
References: <20261124155024.920403-1-logang@deltatee.com>
 <20261124155024.920403-5-logang@deltatee.com>
 <sashiko-outbox-231501@kernel.org>
 <awXfpjkv0MBDvYyK@lizhi-Precision-Tower-5810>
 <9f243227-c668-4980-8cd2-8c7e45940cf6@deltatee.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f243227-c668-4980-8cd2-8c7e45940cf6@deltatee.com>
X-ClientProxiedBy: PH7PR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:510:23d::8) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB10183:EE_
X-MS-Office365-Filtering-Correlation-Id: e2733806-f989-449b-f550-08df4b2c32cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|376014|261026140227099003|261022105027099003|261022115727099003|10067099003|261022113327099003|261026121527099003|261022075727099003|261021123027099003|261021130227099003|261102123227099003|261021121427099003|261028144727099003|261009223027099003|3023799007|6133799003|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	zO359H6V0Ns/WPhePDuUEjGxpFQ7j7EH/X9ym31nBrIe/2RI1zy7pm7Ri1IqhCtQV6IVjPiZrvMUSW+ZFc6+wi4Mz04E/LrCW0TXBQsRyc5f/jVtJBJSmFM9dh9QC1If5mUzCuSr6oTlyJitwjKJPKP92Cd9N9ihYpXodm+PE8LUmc7mDXMxpaYbVmkiJmHu6a78jnwoSSpW+7fO8GysHc61uUqfUQMgizF4/9K4JYlacf8Xt40URYuCkaQhROwvL08o++8imeaoSpUzI3nuw2sXET2RLqQ36fq2/OAzvJLV5jSnCCS8dbq6CLuUtIN6Iezvpfb3pqAlLkO8cJMe+BWROMZA2ySHKKAvZuIpykf8KAOM8Gyl5Itt0BeUlro4gABtUfkFmRLRm47NORAQ7f33NAyUYJ6z0z4fKNo6zDcI1glpsVZgw8nKuczXANNA3z/HAwyAdT8E2UcfY7a4J+gxe5IIDzT9IPiluNFy0TYAM9bl/SLN3yYBEWsc16I3SQqm5PmfBf1JHT/dkYI2SOlMe1XUwStuHdgRAQsvFDTKS13djBGW0QFoTsJNi7NqBio84G0hFanYI/fY0ErvJsF3nJAU4ZhUbMMcdrE7rNN+qpwoIlVwa9SrXpcuGGZc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(376014)(261026140227099003)(261022105027099003)(261022115727099003)(10067099003)(261022113327099003)(261026121527099003)(261022075727099003)(261021123027099003)(261021130227099003)(261102123227099003)(261021121427099003)(261028144727099003)(261009223027099003)(3023799007)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M5N/WwzAAQYWezScAskSpfgAhzwuP/2aVvuchXuYYc0SXOoMYhHjtSe5mvYi?=
 =?us-ascii?Q?7HZKRU9jUDlXKeQuwC92uasx+pUqDzl1vNl4/MWw0IeqSQou4rogDxBf+wAI?=
 =?us-ascii?Q?KUGQWXq/Jk4SPsHJnd9upRRPDQ6B5NFh05qs+mVSw2hIdBc/hmXx6xzesLx1?=
 =?us-ascii?Q?fENpEQH6KHfiWWgNi/TUwhqSg01GOZUgd3GV6oT0v1Hh1/cTZOivf/TBhpNN?=
 =?us-ascii?Q?WAwirbHWt/Yya7f1dIC/IDMQe58B7jl7eQYeQtZ0pUOuHXqrmOcs9nUvjDVD?=
 =?us-ascii?Q?Epygn3QdhEQlW2Ko1bnU9Pjj1lNKMRectHSByi62ghRlKu2MObR4klG1KIkV?=
 =?us-ascii?Q?WIZb9wf1+6PzRY0NWLfNvvjQynFsAWlx1qgk/QoVQq/xcIPT20WRbzS6u3wq?=
 =?us-ascii?Q?mVt3BadOX3jYXStsd4lzSnyAR6JyvQ4KeIAUz/C6LULtSv8uyOw7bjIZkKNd?=
 =?us-ascii?Q?WoORzVrh/5iEdjW3tbA8HZvnC7HJ+I970d/NGHij9LT3teTbZxH7GQqAPxby?=
 =?us-ascii?Q?6Yuw0m0gnua2LK5tG/Rj8Glc7eyC6KWxeUSmffCBvtYKgbBzQI/rFKjbGqTZ?=
 =?us-ascii?Q?VtgC3rM/fMz7JqOWjsPmATOMiIizH5vrPYGIvVQSj0plJHUDgiOPCWiQ7yE4?=
 =?us-ascii?Q?3psqChI9pjwMz6RWqlruRwa9rh+0YjYToMVCDf7jVvN2kKK+cjK76eQ37zqP?=
 =?us-ascii?Q?8RnZw1PQJKVVo0YlwTSgY6QeJcSJafHKru1Pf4CJ8TPhcqRorJPVFJOVmZMs?=
 =?us-ascii?Q?EKbaPqlz7OxNdUJC9jEi0TBXvoeT8Vb9ZBxYIAjmBcqWmbeE++IQDPVzye9a?=
 =?us-ascii?Q?wxeLwK1/NX3FUEWfzPjVo4shms2KSykvfubEQVp/29kZCfIdcDjSR5nVMF2+?=
 =?us-ascii?Q?lF3b+FeA+q00lhb7n5kRJeLBsmElIwDvQlUuN3hwRblNxavHYivaNwlIOaPi?=
 =?us-ascii?Q?mYhfGDYyVMz59vTz39axDScTmvxWxF0VLS/jrUQWSHMPK9wAfF8D6EZyKR9w?=
 =?us-ascii?Q?Lo1xv+EOsTGMKRdh10y69LNrbm+FSD7PuLb9TdX1a9PhWdl5946iaDCE2XiT?=
 =?us-ascii?Q?AiRGSHkkcVeROgdGdUENe15JcwhQc9Q93Bc8pOyBhTW7/JDV9LQWvf/r4gFV?=
 =?us-ascii?Q?4PnedSgfFSjUxXvwrVxEvdr3j7nulNTgsj2oQ4M5qrF/949sD4J3E3lQk4YB?=
 =?us-ascii?Q?kv7jXbPlyrtYl6lt6hput42AZg4iCYouPqiUoSlKgczqyudgzln+zxeK9h4a?=
 =?us-ascii?Q?ykZ5nmfU0K3AW02JTUgZoX9yaPW1DbDMeSjbBVqMYTAYPKCjFxHDsHe3jXwi?=
 =?us-ascii?Q?0X4pjdKU6hJKOLUJQ0jpKLDIMbNkLU/KI4BJn825Bf+P6Pbas8qAIbY1WiaE?=
 =?us-ascii?Q?L8BXiZYbk4wDukSwlA4bmTPsyDU/tsroONJnLbO8VZ69bdYo6ZOAiPQgwWHO?=
 =?us-ascii?Q?UtZRkKFF5FQkfbU8QYH7j6xVG9sZtWzzVMZ4Lk0rjvJn/nDAcseIbJQ67SdV?=
 =?us-ascii?Q?rfudaTeLbv6uOqO1FHH0I9PnmARjL5GE7y3iQt55P1gd8vE9llGd/FGCi/6Q?=
 =?us-ascii?Q?f1MEgXe3mid8F4v7AZnvaVDpQNn9pXOSS9JWGew2Ma/OkRLLugHmPvSH7xbl?=
 =?us-ascii?Q?W3E+S/mjK98omtPTNdj2c9KHlUsAQEmISVfUd6F6KT/QVB2VP785AqRdghRs?=
 =?us-ascii?Q?lczAx9xMUYzfTz3+uus02EmZXw/IGYquTIBWubSluLcG91P/5o1m4c8zWyxi?=
 =?us-ascii?Q?FuBLB1KLM/ase8QfvSChpeNxefoF6i1rlT1xKHs6WBN6Llbb752R?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2733806-f989-449b-f550-08df4b2c32cb
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 19:42:11.4999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8YJfJ49a2/oCLKT1UVd1hUiBuxlQ3qVerVTmomp39CsGVrHXWLzWjDDK9OlI3DUh4aBAydm8YV34lNl1Og8ElOiO/zqDTZykml/3O3pCVTY8QhQe51aBoUl7BpfGtrg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10183

On Tue, Nov 24, 2026 at 04:53:30PM -0600, Logan Gunthorpe wrote:
>
>
> On 2026-11-24 13:04, Frank Li wrote:
> > On Tue, Nov 24, 2026 at 03:59:03PM +0000, sashiko-bot@kernel.org wrote:
> >> Thank you for your contribution! Sashiko AI review found 1 potential
> >> issue to consider:
> >> - [Low] dmaengine: switchtec-dma: multi-line menu output in
> >>   latency_selector_show()
> >> --
> >>
> >> commit 88f647b9334dbbed040eb8ea50d2882f9874a0c9
> >> Author: Logan Gunthorpe <logang@deltatee.com>
> >>
> >> dmaengine: switchtec-dma: add pmon sysfs attributes
> >>
> >> This commit adds a "switchtec-pmon" sysfs attribute group to expose
> >> Switchtec DMA performance monitor registers per channel.
> >>
> >>> diff --git a/drivers/dma/switchtec_dma.c b/drivers/dma/switchtec_dma.c
> >>> index 1ebe17095c61a..774b418330ed7 100644
> >>> --- a/drivers/dma/switchtec_dma.c
> >>> +++ b/drivers/dma/switchtec_dma.c
> >> [ ... ]
> >>> @@ -1215,8 +1222,274 @@ static const struct attribute_group switchtec_config_group = {
> >>>  	.attrs = switchtec_config_attrs,
> >>>  };
> >> [ ... ]
> >>> +static ssize_t latency_selector_show(struct device *dev,
> >>> +				     struct device_attribute *attr, char *page)
> >>> +{
> >> [ ... ]
> >>> +	len = sysfs_emit(page,
> >>> +			 "To select a latency type, write the type number\n");
> >>> +	len += sysfs_emit_at(page, len, "(1 ~ 5) to latency_selector\n\n");
> >>> +
> >>> +	len += sysfs_emit_at(page, len, "Latency Types:\n");
> >>> +	len += sysfs_emit_at(page, len, "(1) SE Fetch latency");
> >>> +	if (lat & SWITCHTEC_LAT_SE_FETCH)
> >>> +		len += sysfs_emit_at(page, len, " (*)\n");
> >>> +	else
> >>> +		len += sysfs_emit_at(page, len, "\n");
> >>> +
> >>> +	len += sysfs_emit_at(page, len, "(2) VDM latency");
> >>> +	if (lat & SWITCHTEC_LAT_VDM)
> >>> +		len += sysfs_emit_at(page, len, " (*)\n");
> >>> +	else
> >>> +		len += sysfs_emit_at(page, len, "\n");
> >>> +
> >>> +	len += sysfs_emit_at(page, len, "(3) Read Immediate latency");
> >>> +	if (lat & SWITCHTEC_LAT_RD_IMM)
> >>> +		len += sysfs_emit_at(page, len, " (*)\n");
> >>> +	else
> >>> +		len += sysfs_emit_at(page, len, "\n");
> >>> +
> >>> +	len += sysfs_emit_at(page, len, "(4) SE Processing latency");
> >>> +	if (lat & SWITCHTEC_LAT_SE_PROCESS)
> >>> +		len += sysfs_emit_at(page, len, " (*)\n");
> >>> +	else
> >>> +		len += sysfs_emit_at(page, len, "\n");
> >>> +
> >>> +	len += sysfs_emit_at(page, len, "(5) FW NP TLP latency");
> >>> +	if (lat & SWITCHTEC_LAT_FW_NP)
> >>> +		len += sysfs_emit_at(page, len, " (*)\n");
> >>> +	else
> >>> +		len += sysfs_emit_at(page, len, "\n");
> >>> +
> >>> +	return len;
> >>> +}
> >>> +
> >>> +static ssize_t latency_selector_store(struct device *dev,
> >>> +				      struct device_attribute *attr,
> >>> +				      const char *page, size_t count)
> >>> +{
> >> [ ... ]
> >>> +	if (kstrtoint(page, 0, &lat_type) < 0)
> >>> +		return -EINVAL;
> >>
> >> [Severity: Low]
> >> Does latency_selector_show() violate the sysfs one-value-per-file rule in
> >> Documentation/filesystems/sysfs.rst?
> >>
> >> Reading latency_selector emits multi-line usage instructions and a
> >> numbered menu marking the active bit with "(*)", whereas
> >> latency_selector_store() parses a single integer from 1 to 5 via
> >> kstrtoint(), so the attribute's output cannot be parsed as a single value
> >> or written back to the file.  Could latency_selector expose a single value
> >> (or a single-line space-separated list of tokens with brackets around the
> >> active selection, documented under Documentation/ABI/), or move the
> >> human-formatted menu to debugfs?
> >
> > Yes, this is one problem, which need be addressed.
> > the sysfs one-value-per-file rule
> I responded to this in v4[1].
>
> We were really hoping to skirt that rule seeing we view the self
> documenting feature of the field worth having. If you really want to
> push this issue please let us know so we can create a new version
> promptly. I'd really like to get this merged this cycle.

I don't think it is critical now and marked at patchwork to wait for vinod
to pick.

sys interface is ABI. It may become difficult to change it in future. I
suggest consider it to debugfs or follow sysfs rule during wait for
vinod.

Frank

>
> Thanks,
>
> Logan
>
>
> [1]
> https://lore.kernel.org/all/dbe72187-4c12-4a8f-a63f-0c4238e50ec5@deltatee.com/
