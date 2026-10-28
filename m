Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793207158;
	b=CfDYQWlkSCm3rdvrd/3UQvW199nieZKDfahTzBc/PdM0+Uh0vscW1z/izGFmOjE5r9d0
	 O+4mghlT0W33+iNM+6vDumDE1lsMBE5T8e9ePxWo1GYAKHZF+07SYk8JkJX+7mGaa0xpt
	 8bX2hFkEPsDCeh93wM6n/H2HmiH97s9OhSwXvjieIOEyIq2ilb4wgDJqshhY1yHk+j1pF
	 hvS2uvYavFnQ95pjccyKWxYq6byNGPH3GKYDSnMd7RMKrteNtTSg3nmVarRTs8HQsIvFc
	 f2BQqUrdHwqKx3+ubyfGbwnMt6KolXwbiGA+hLvSCUCnrfVFpt+FD5RqZjwijpX8YMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207158;
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
	bh=CUmnbaCJ7pd5NBAxcV9NjP+78L98ZBtyC/aojqVMqfg=;
	b=kZZvoIvWM9ZwH40PqQGioCjF+zPwW8EufgtxNrzjhMVf4j1ootNAUQD9j21e78V0Qtv/
	 ctwNTe3u4DKNh1sJH6MhYVdPLEwBFriaIyGjWo2xxYNhtls+Gk/Fl0KM0qGDxMrvUhfq6
	 q2gWUvJyvWD5nN91K0I0xHgcQ15E+nTmEgFeZgnIkgqGC9B7JGMGxRuS/pf+7ajfy+BUa
	 CoYyN4Vq03urCIQqukranAmBoEeGxqf6k16CPaJBzhW+9fQGjnPy0jYQY3XIUWlzGlaaI
	 ngZRCyykYz2a86ElwgjKC4fTYAdDBPhVReW9hqgB9qS6F+LmOA94pyPopachL9cXpTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=tJ1nuE7g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.16
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011016.outbound.protection.outlook.com [40.107.130.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5516606A31D;
	Wed, 28 Oct 2026 17:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5516606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=tJ1nuE7g
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JC3Oo7nvV7rwtdaTTV1kIdirpfPPviRcc3XhNQzWjbAVUSyFBHbgNQphnWLcRZc1aZrPvoksfdY3JoRCbVRLw/sKj/vDVv9//ngIzoyWu8BCs8Y3eI+WvLW3a+XrEPspipN8bCxy/AVTUiTgwtJAhM8Tq12nPn7ENfQE+yjEuOgkisx3RHZpMix2N1j7C0uaziOlEdV2AL/kKeiAXKXTIhvHohBZdZ9i24DnJyH6QPMCyT5bSU07iGNYg1+HlWCHSmmY113cX5ZUumBuWrnL27OfN472Iwv/OQon0tX0ZYJG+UvVtpgNZuWyws4Iyj62Deln9WNTPEDzPMywVumO4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUmnbaCJ7pd5NBAxcV9NjP+78L98ZBtyC/aojqVMqfg=;
 b=bzp6BVsb8q16t665R1bSD3AeThTD81k8PX+rgaW83AJK2PN+5DdXgMZe6hpFr6YG4aRJQxJdwi2puiaph4NEpN+lRLf4UMqhcjKLhjRRd51Xb33nD6BksYK+DDBg8H0eETAV1+xbEWtF+uvKt01bQb8AXouU6Ju3tlscNutg6kA/6A5JBhoZaACL7/tPXzhAziiTQb4SViNJ7hVdhvNWRpD70X+MOoauVIG/u/Opzf/BwUjJZcMj50e3Z9WOe+1cFd5mOLqM/9qSmvuaPZ/gN36FY4djdybYWM1bI1ALGupDAVURkOP1+Lg5lL04NMPxJGbCi9h8jQOlYLgdVcDjuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUmnbaCJ7pd5NBAxcV9NjP+78L98ZBtyC/aojqVMqfg=;
 b=tJ1nuE7g08SAB+xfuw+gj9haHbvrzMvwYnncO/x/IrnvRvdCdfMPqV2Hh4cR4Q2/GcrSvsqgt/u0a7Sekmnuj/cI2fsxnjjmZXxS+YETSdk26FQ6Gu9doz0NCP5z60kwi4yyuB4XelBEZ8+X14oEDBzb+6/WN6207kTl+K6XwsFLc8dD8I7q0ZCTmz1djenD8KILcMDxstubewgXg4h4RzjnioE3Ne4AnerE2gkm4Lxymlrd8R5s0TKacWZmiq4m+BBP68dF3S/XyrEX1WUv7JfHQuIz8ckEi15n6dL3Tt3CtUJ19AduieInyvbIdjTeM1ZJXuL8/kcd1OJAPTWV9A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by OSKPR04MB11341.eurprd04.prod.outlook.com (2603:10a6:e10:98::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 17:05:54 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 17:05:54 +0000
Date: Wed, 28 Oct 2026 13:05:45 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Li Ximo <lixicaicai@gmail.com>
Cc: Sinan Kaya <okaya@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Wang Haoran <haoranwangsec@gmail.com>
Subject: Re: [PATCH] dmaengine: qcom: hidma: fix wild pointer stored in
 mchan->running when active list is empty
Message-ID: <auIrac9AMf1Jwwt3@lizhi-Precision-Tower-5810>
References: <20261023073154.744365-1-lixicaicai@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023073154.744365-1-lixicaicai@gmail.com>
X-ClientProxiedBy: SJ0PR13CA0098.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|OSKPR04MB11341:EE_
X-MS-Office365-Filtering-Correlation-Id: e0abd5cd-2381-449d-c4c1-08df3515ba35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|23010399003|6133799003|18002099003|22082099003|56012099006|5023799004|11063799006|261026140227099003|261026121527099003|261021121427099003|261021123027099003|10067099003|261022105027099003|261022075727099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	f20I0TM/ORbd5ws+Q4Bxrw+CY7PxFnKDCS5lpbjuGopnl5N3jN9/tNedum6+HQHT/zfmN8vi+7L19PWIUbvG92CH0aqwfwl5I0Y1WBCM7WZi6GerylX2pWfhRvw0kqomKWYtS5CT8McEubciBUgXG/iC1W88Iz8C6nrVa9f6r2it+2azPwH5G+JCwRrXomMfo6gmfKi+Gy6M8KC49ImfDPLSBCg2fN7qaO1tpkAgBhbzl3CsgWqgc23jSErdGJFt8mPUn5PH+z6LTBKp6Tadcwo4pJX9uuUJStKh0C+adqjqnFzJwep8yBQEXXvCLipjdROz4uyL4Is3+FBVB1KKVGMee4W4TUXHag6QH6nIHD9U7bTbHq7JGcNNkLtnGtXRaotjzJk6GuQL+Sd5XpUmws2FtiLypprRWaUhBppj0qEu6PAhIGzcTU+lAiqcN9NXFBlllA7a1io4ExcpIy0m6HFVEDCy4/1sk9H1FA70c8hlt5DSBF1bK06+2Bd2MdMX3FBV21CK1Pz4il/DJDzBQngvIlczFMQzkbY14QwDroH+bxhvXvXZUa/TtPcHkDLE7+zijVasOtfami+AjaVld6I18NDhB6DOUF1J8ZYxq5UQ9JK5Ei4kjRrcBuVwoETXrDt1x5i9flOuP/D6h+zwlrXPu0MRFizqrQjETTAPtXo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(5023799004)(11063799006)(261026140227099003)(261026121527099003)(261021121427099003)(261021123027099003)(10067099003)(261022105027099003)(261022075727099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?il7eNoMELBnROmYi+RaTMgaaKxVrMeLtOzUeDz3b5RXNu8RyqPhSzPcS6Nsn?=
 =?us-ascii?Q?/5BnaCSHVrkL2vNfDrUHAU4fmiyGS93YXn5qzU+S86po7XEFazOHxI4JNQqA?=
 =?us-ascii?Q?o2oT9ndr7niU++t6RO5dmw0kD1ekfPjIxfsy7dNe2gJGhquyuI4nEu9vxX0s?=
 =?us-ascii?Q?QvsnJGyI0xcqiYmAcAneN2iN1vBCrU4RKbox1/LyaAxR8eiGVEV0n0PhwV71?=
 =?us-ascii?Q?mkKOt/CiGCxyDoP5XaEmBtFBygj+ZtH5SlP4dV7p7oHMvnNeD5rFRzyEl720?=
 =?us-ascii?Q?UzUU9W31iSxKaKLpR/peu5gBfoXz7/FbkoGXgJC57eFLbUT770l9QsUBODDg?=
 =?us-ascii?Q?TD63pusjDizdyaWdFDeMo78V6Gh56PRkNiOeTIARR7Eo1uCpd61bC4RsnI10?=
 =?us-ascii?Q?z9qaU0rcxDC967iYNUF9MDacIKjEX4U2RV+ntlZu5paQ1rXdEOlkGwFE75vg?=
 =?us-ascii?Q?EuFt3K2c5+DIrk8yhFZxOQ5x4GnLZ/3yU8jELmfYj1F+Ung7w85qMFNNvGG/?=
 =?us-ascii?Q?zRcCY0Vy57RMdD1gdE2o3eIsl8mzUZNNQD4zdb0vjdFhvTR/+wvVejQw8uDm?=
 =?us-ascii?Q?Fbq6jpbU9+Iu+MooHXsLs3jkQZl3C6uBAEBNtOl18dPjRg1BUO5AD0lZ/QmV?=
 =?us-ascii?Q?vMWT4LvzNcke9Amz5oNZJgDheGISqPsUfUA97u4lLG3fHn9a6jQZsT5tYT7k?=
 =?us-ascii?Q?mhk7NTL9x3UMfbAQDfD/wTgcbm8ezyADbrvUsPXcEtsNYfhNvktWkJc8iAB4?=
 =?us-ascii?Q?knJyc6FbqS/A2d8D9euNELbu2nbAIMYMZTawphJzjvQdBuiUD0CgjrKoc6Z8?=
 =?us-ascii?Q?OFQAmKEkK9KkUcgSD04ODwUjCqj5ZrysH6BPnHRP4zfFUXGOUbDaGy9Wrqwg?=
 =?us-ascii?Q?9HGZW/dUHmucXhlsAYDsY4Wj7W6h6ojZkimmXJEb18vXpMQh8Bmvt+qEtIDi?=
 =?us-ascii?Q?cU68e3DzU2ypiupYu3gIt5FfqG0oM8CHx/kVfSamXPJRL79VsMvBkzc0Qffk?=
 =?us-ascii?Q?Q26RxavndlD2TA4hY8PzRHF5QWMwhza77x7bCe5y1pOj1lburCVrAq7O19kS?=
 =?us-ascii?Q?5SbvVlMyIQorttBBoGgdPbnUlfye8KnfN+d7n6TBCZy9cWF7s2ykk9rC0DsX?=
 =?us-ascii?Q?m2jt0DZdStVHD9pb9WSnvtvS9GMCnCDOzLL3bfgTmpGPXkEwMqPJwOI7kNzb?=
 =?us-ascii?Q?4mTwFaBxhHfHXIhZiJGcKmhT2DJJjJBnNItMUjAsFpNaqxf/5J6E//HhfEUg?=
 =?us-ascii?Q?9krNFo6+Mge2P+ZHr1inZEVuarjbAPP67XkHR+4dWQbHvD9x2slzx0jyPiyv?=
 =?us-ascii?Q?8426Rd15BNt8AB/0z4wJuHwcbx/i93MS55XkrYZQQVrQud2U/hw4JoJNgyh9?=
 =?us-ascii?Q?8/Uj98MFxkSlsK6xuUYvY7QdWzXOMe/AUdEWLj1Gv2y7ZTU3SyIUAfg040om?=
 =?us-ascii?Q?ngN7AGkL3vhg6SSOz9Qi2qk4Pa2rPIXTWxYt3wup0+C38q9jwnVbgC5yJyYp?=
 =?us-ascii?Q?QZoWKCi+Tg7knZ11zNILngzbc2TKc6bgiC+XHvBbYNDGKsq5u5fsBXrfJd29?=
 =?us-ascii?Q?TrfOWtZGPFCc18D70zU89jxjBwCdidVwGvC6NMFTSTu0aW/4Wg88TzuoyxFh?=
 =?us-ascii?Q?Jar0d8smfvEUR7N43UKM2VzRBuL94MUnCRvXVUw+i8cpX63yH6RsTV9iy/Yp?=
 =?us-ascii?Q?d+JHGCKXaejXXJ5aEIefZ+tmsX9d8KDxEqkIBUdFLYL8pFyM3QV8kpfs4Z8W?=
 =?us-ascii?Q?7KVzs5FFH9kRarjzfvUCl5nRQc6SD5VNnB3pgrg+u1jPcr7pOhzg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0abd5cd-2381-449d-c4c1-08df3515ba35
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 17:05:54.5196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MGijBDq4wMtTgeeUxD7RWQiwhoJqacilaCy0lw4VmaqGzNo+UYRRe/OJa6hzOTBb0rbgDfDZh9rRjtGd3eGcNMia1YX5IfT2Ma5nJJFgm5T0WKOLRET/UF/L6rzCvFGS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11341

On Fri, Oct 23, 2026 at 03:31:54PM +0800, Li Ximo wrote:
> From: Wang Haoran <haoranwangsec@gmail.com>
>
> While auditing list_first_entry() users we found two call sites in the
> HIDMA driver that invoke it on mchan->active without verifying the list
> is non-empty. list_first_entry() never returns NULL: on an empty list
> head->next == head, so container_of() produces a bogus non-NULL pointer
> into the enclosing hidma_chan structure instead. That wild pointer is
> stored into mchan->running, and is later dereferenced in
> hidma_tx_status() where "if (mchan->running) runcookie =
> mchan->running->desc.cookie" passes precisely because the pointer is
> not NULL, yielding an out-of-bounds read / memory corruption.
>
> The list can be empty at both sites on entirely normal paths. In
> hidma_callback(), the completed descriptor is first moved from active
> to completed; when it was the last active descriptor, the subsequent
> list_first_entry() runs on the now-empty list. In
> hidma_issue_pending(), a client calling dma_async_issue_pending()
> without any queued descriptor leaves both queued and active empty, and
> the "if (!mchan->running)" branch then fetches the "first" entry of an
> empty active list.
>
> Fix both sites by switching to list_first_entry_or_null(), which
> returns NULL for an empty list. This makes the existing NULL check on
> mchan->running in hidma_tx_status() effective, so the paused-channel
> cookie query takes the -EINVAL path instead of dereferencing a wild
> pointer. Both call sites already run under mchan->lock, so no
> additional locking is needed.
>

Can you use simple words.

dmaengine: qcom: hidma: fix memory corruption when active list is empty

list_first_entry() does not check if the list is empty. When mchan->active
is empty it returns a bogus pointer, which causing memory corruption.

Use list_first_entry_or_null() instead.

Frank

> Reported-by: Wang Haoran <haoranwangsec@gmail.com>
> Reported-by: Li Ximo <lixicaicai@gmail.com>> Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
> ---
>  drivers/dma/qcom/hidma.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
> index c939635be..925c912e0 100644
> --- a/drivers/dma/qcom/hidma.c
> +++ b/drivers/dma/qcom/hidma.c
> @@ -176,8 +176,9 @@ static void hidma_callback(void *data)
>  		queued = true;
>
>  		/* calculate the next running descriptor */
> -		mchan->running = list_first_entry(&mchan->active,
> -						  struct hidma_desc, node);
> +		mchan->running = list_first_entry_or_null(&mchan->active,
> +							  struct hidma_desc,
> +							  node);
>  	}
>  	spin_unlock_irqrestore(&mchan->lock, irqflags);
>
> @@ -238,9 +239,10 @@ static void hidma_issue_pending(struct dma_chan *dmach)
>  	}
>
>  	if (!mchan->running) {
> -		struct hidma_desc *desc = list_first_entry(&mchan->active,
> -							   struct hidma_desc,
> -							   node);
> +		struct hidma_desc *desc;
> +
> +		desc = list_first_entry_or_null(&mchan->active,
> +						struct hidma_desc, node);
>  		mchan->running = desc;
>  	}
>  	spin_unlock_irqrestore(&mchan->lock, flags);
> --
> 2.30.2
>
