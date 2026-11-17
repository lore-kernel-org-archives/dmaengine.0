Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794938388;
	b=yBDkjVdjPM527xSPUtupFgLVzBUpcZz6P2NWBf0FGLSHaMzuEUkInALFHWGwDDG/h6W2
	 n8UEcoYWAZh8Qlj3MBeiqxTxwV8m2Hgu9axOz80LVrg0HUkTuuufcqD+XtylwVKJsXDgy
	 VOJPhaq/8BKzrB8cEd1+Ryrhaepy0HvXG2YAp4HjCk58AnYa5AWlWG635Kn08j7Qdh3fP
	 jiSw0AQIYHXokDZ4Ikma5tA2jRIWzY1eqWVYGu9o2Hd6/CppAVkbshg3y5pJRSPtFRgD6
	 tSAo+uGKqHruWmbwkk0hycmyMNU+YZb4yFB7m01ZrCl0Et2KaZw67rhiExgqHJTLffA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938388;
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
	bh=B2T5SEmhoR7nNnYCSXkt4w3vpbti48DzRL0exdU3ihE=;
	b=ZwIYLiuTLkEHlh6Y/5DNDWhhw2guuTa4Ug/osUv3xmsXHb/zMpjoaMePGB1Ss3p9JA7y
	 DEFNOiQAX1asSZc7UVJUae++f+mAB23LzZDOdL28RNCuMuuE24+I1DuW8VjM+7pl7iDuq
	 hNTEnGPa6KuOCzqfC5zefWGXQZTgHu41P4JfDqBwrYHTuu6Hl/2lcKzAOq5bhPy9F/xVp
	 +FYN8ZAxBg3a05YI3WMf29pTToEdQ19w/M83GZ1IGcYnqkWA4kTWcGSao6q9tosElLD6+
	 gxMX4KpN3yjkx0GqP9sLmnn5UxLEr+N/723ciLlYDYRTLg9pgTTOXJ0bPO5hU/oQzzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dJIRysDw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.18
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013018.outbound.protection.outlook.com [52.101.72.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EC3606A31C;
	Tue, 17 Nov 2026 17:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91EC3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dJIRysDw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxfVNelie/ovzvAmZU/dGtJIVQUTQCJ3XxsmcSY70eJj1q5wZfL2EMjV1dzOciTpYBabrIbSQuYCj1yNN2+w0GGDPW3TC7NDTzKV86GeQvZ/ZDJ5hCVQwaArCXK3QWJs/O6UjGDnkc+4q0k6MFdJfunAZq5/anzQZ9D0sdLcTns4YKEHWTGZBrHy8w5HtWMMLP8bwC9d7htsmwABTbQgEkizB7wqIBH10y68ySc1Hy5C6gy9YNgc8efnt9dQRqpbMqwSMs+VMajrJjgGBAxGsPY2QMITnByEByuR2LvqKnDurMMTrWRaV6VcJ39H80KZyPvoAgZ7Ahg9NsPtuUUsrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2T5SEmhoR7nNnYCSXkt4w3vpbti48DzRL0exdU3ihE=;
 b=RXml1ilYr5iTy90tf4L7CbRUtytEq1fvGxUxJHvYP+y+fC5hyuoxiBJx4jz6UGZxXJUeUZR/3GSkDYPBdX1jHChKbpFcTTgA94X+lRs+DqXKDqNn+ARx47SlMQnulH3CSfJN4DVm9ZP9yqWQMLW/S7HYSdo2yf9jR8kwdC5pn/86cxSPwRblWnMen04XiqJXkL+gDnxKui5bdLdon1Fnle8h8JSOUjMb6g5dhq6UsxLEOwbh0HV7QK5zJkzKSU3QgXhv8Q1dShpomsam8Z47pYRfN0x5N9EjUOjIbJQbsSPhtfq4LRv90n43mgD+YXphk7BKiwQ07vKTq7O4GcBvfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2T5SEmhoR7nNnYCSXkt4w3vpbti48DzRL0exdU3ihE=;
 b=dJIRysDwy6Dvc7lbDxiII6BRql+e0jwmvyMEJVQiX6DHRHzkBePBY2Thz3YnQARjD/zVl3oX14y6cIkQZ9B2uSMC4pUbdf3z9fKVWie0kdlNd8HrimiYDsyMUFLSzFgZBGOO50v1pQMakgGVdJAntMZnyLciQGZTU3MuB2I4CQyZ6nrz64vTFIg/CI0Lzg/WhEgZAY1FbyLSvSrem/kK1u+YPN/Ms2y2XJQKLaPEq0LPMr/w3mBOhHMV0tEVrOu2XObW2j5okzZlIWOnHjXaYCA7NWbAcDgtjGdjByEMg+KG2Tk6Yg26qXi0iKdQVZrHQuLkeLUm3DRakFpWSbnFnA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by BR0PR04MB608003.eurprd04.prod.outlook.com (2603:10a6:2c8:49::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 17:59:44 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 17:59:44 +0000
Date: Tue, 17 Nov 2026 12:59:36 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.li@nxp.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Dave Jiang <dave.jiang@intel.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Kelvin Cao <kelvin.cao@microchip.com>
Subject: Re: [PATCH v4 1/4] dmaengine: add per-channel sysfs attribute groups
 via chan_groups
Message-ID: <avyWCL7TzS9JX4Ys@lizhi-Precision-Tower-5810>
References: <20261110173137.623764-1-logang@deltatee.com>
 <20261110173137.623764-2-logang@deltatee.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110173137.623764-2-logang@deltatee.com>
X-ClientProxiedBy: PH0P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::22) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|BR0PR04MB608003:EE_
X-MS-Office365-Filtering-Correlation-Id: d35d0f40-6e23-43d9-ed27-08df44d48fb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|23010399003|366016|18002099003|6133799003|22082099003|261009223027099003|11063799006|56012099006|4143699003|261026135527099003|261102123227099003|261102130727099003|261028144727099003|10067099003|261026140227099003|261026121527099003|261021121427099003|261022075727099003|261026130827099003|261022105027099003|261022113327099003|261021123027099003|261022115727099003|261021130227099003|261021133027099003|261021135927099003|5023799004;
X-Microsoft-Antispam-Message-Info:
	RPzNHdUmQ+wvosJsh+CFmBHmiKqh5QOMpFe99E0N3H63GQeTgXf4psR7i8LC97HqF6zrOKTV7rqcE1V9PqqI0TL+vezAKFN/DKSerFAo33c+ei33Kn5bpwfgNiTi2DZiEffVEtijELq2dR5DeOdM2unrtIqIMeXw/K11oY5W2giHCGQ+7Ppt8mgRdMYTcNLp0DJ89xIiqSwBPy8gQEi5DVdPbsJq/dvhhNIoSDUhQEDT95natDghxZYuN8sOuv+TCSQiGJN8LeV3JMyGncWASjHIYOz0pqDKVfeqBT9PqNNE+341Z8P9gfKzPhcOLd+G7r3oOP8tgBL2+2CqkOoZUwLdleRPYuUEQDJaDz8X8pSJs3VBzIEIDnf9YHL46hjhpOwhWX3JPi/KC2WXXR6tMTCxbMWGk2UhSU0BMzwxMxOBmyEL9JWTbGFwcB+loiXtXCMOn62IPCNIu+vPQiWtx8ofgeIv0qpC4HwWtL7lD0GWeUVJbQvmEUHi2RLWMt0CwziGoiP1Va/1bbBRrSM+AHVztYyFdoKbhWKU952DBZmeKkZD5gt5/AF18ABQ9/IE56oSYjqRYADrixFoZcHEmer5nxiun9DFFPLRVGje4Nv5esGC6xoEdhBZrEcNclFrcGDeneXn0Kv5XWTxp/w/UQZNBmiRnaJA8s57hs3q8Xc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(23010399003)(366016)(18002099003)(6133799003)(22082099003)(261009223027099003)(11063799006)(56012099006)(4143699003)(261026135527099003)(261102123227099003)(261102130727099003)(261028144727099003)(10067099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261026130827099003)(261022105027099003)(261022113327099003)(261021123027099003)(261022115727099003)(261021130227099003)(261021133027099003)(261021135927099003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oB2dtexN9YQbh3X8PRTmSb8WX5HJ77ecqHYYyHg2K6HYOXsMvI3siMVGOLNL?=
 =?us-ascii?Q?gfhuqb+Ks+dhJ9Um5sRHLOPcdYLI3W/EErD/5YFLrXn2D7YrJ3DbP/bkFDAj?=
 =?us-ascii?Q?tYxSqRI88Yn9WUZ1g8hhxyy2rBB1KTyCYBPd0RwKw7Ktl7Sh/Neue6xKtPSV?=
 =?us-ascii?Q?i3dPYD+Q+Z4WJRjxtAdPGPg1GGZJl/wnZS6eToiHhc4Wv4Ufi+QbmmkfKOLl?=
 =?us-ascii?Q?CLP7qP6OBq2KPZiG8L8d+RVj4Io2fnl6ADgWmYCl8qyyhEuK6wWHSabhMDPX?=
 =?us-ascii?Q?L7GtJ2SL+KOjtx+6I9hSa4L/NWXVmTxeCfsSipfAn1kglLle/HZwMRaYabL6?=
 =?us-ascii?Q?0RZGegBKiqDm3OutiKNMO1B8RDukEnHN2hytTWcQSNcZI5+ealn5Ek3Nskfc?=
 =?us-ascii?Q?K4IWe+P7oEMIX9yf/pMgZbjYi1LEFkv1F5f1NakQ9nLbT/0dDu69Ep7GJDxq?=
 =?us-ascii?Q?6gLG8zxmJ8TrqOJFsD2tVQo8HLD/IHOjqrFpwLsAo+DQbOQ0DBVlDvCm9hYz?=
 =?us-ascii?Q?MK3c4y2UXyxrp+5Vc+oBiDaOW5YZBpj6Gn4RbkAQjYFmbh+6M3VWFw6Lnu5v?=
 =?us-ascii?Q?YWL//s/9UoVgPyi8xoRDfrlGX3HdroRDxmA8MC1uA1hZMJytcKgnxm2McXPc?=
 =?us-ascii?Q?9aoeWqot/YCykP1GDeYbvqKeH2KuMMFfkgTvR9+ZL7IdRbm7k4mJZzll774F?=
 =?us-ascii?Q?+x5gFD69lOnyGcDCU9JiL4Qzz0CmEsTL9Fry1fMlivJFVLuV9JNg0YRSugav?=
 =?us-ascii?Q?QC/Zi8UiyGIULmtrL5ZdQ7tgWcGuYv8RWRQykPhkatWZgBPadgi+Xg/7J01m?=
 =?us-ascii?Q?VmJ2IHYtYxMkFdF7X5sJe4ZDVmz2PoOfaIwSAqSAPQXZ/EUEa91cBxQ8MQ8t?=
 =?us-ascii?Q?ZG61SpO8KmcL54Mz44HQCtg5xjPIDFAxCt+UJK8eZM5NG/jhYbXeUGGsOGcH?=
 =?us-ascii?Q?Njg4Pfe0lUBNA1EBNJ49spFl4xRBxiGi/BaHMo8Ow06RHB0HT54r6XbyH4q7?=
 =?us-ascii?Q?IFv5eWiOewO5fvYdYZSiKyVsOQGlCA2Xrjk6Rit2rxnM/cg6DjHV4Bw/6/3x?=
 =?us-ascii?Q?Zk9HzbGRyJSRoBye/q6jzsJM+UYTcmT3kh3BriBCCeT5eXOK3jRicmtadiRl?=
 =?us-ascii?Q?yL/nKC75cNxsqt95CMPu3Vj5/O9+7ODeN/+yM9K9PiGyF+VwftToB8NTmcuZ?=
 =?us-ascii?Q?r//3JLbT50qJ3xn+HFYfN+myIJpT2h1hYjzjcnv4eDQlqv6GXXV9hLswQ9YK?=
 =?us-ascii?Q?XZxy0BMUj4UcqXVF597WE/MrVHfcuQKEzTv0sKq8qAKG1w8s9bv3y7OVi3eP?=
 =?us-ascii?Q?eZKSjGmWWClvHv8ZNL6ZDxluqO77lirrgXSiwSce+k2cR4tLwNnTv6hjzo7C?=
 =?us-ascii?Q?1+iGbcUEwCuzl0fHBeDAhjqZ8e0CV6+wuK+n6HFwQlZgW21oTuFdrrL1RRHQ?=
 =?us-ascii?Q?7AYpGJI9sOK44g5tFB6Iyi2i5yIQUTETw30FTCMJxY4i/LJysirOsooybkvi?=
 =?us-ascii?Q?QXBeuIiZrT11QvlxGTiIJtNLWAzuMmsVR1ECcnme1yYSEmBrSUxLBcelTlqD?=
 =?us-ascii?Q?5RCOEvbQaWUSApFrmYJns+qGOxEeSZAcouF9sDq4rzC5JNNIV5RmfhTFrsOJ?=
 =?us-ascii?Q?npKw05eIC/YZa6R0BtBriWJ/yJciP+Tqy0wlJlyQp+xIqNuht5m+LeonlxYV?=
 =?us-ascii?Q?84SGQ/Ix5XjstYpDvKMQ3T6SRngEONkzG8PJ8ELLjMfHrJdbMQf+ewxv8OTi?=
 =?us-ascii?Q?2ysCvjW+r2nfNksen801Z+p3dnQjCBa+yVKL43awVRWtVwupYeLk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d35d0f40-6e23-43d9-ed27-08df44d48fb9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 17:59:44.5909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pStjKBdzGDfyq1UkwtJGmP7jngjhy3GVus1XgyCTNM3zJLjmjEQ/5xOb1su9G/SagNB6lY64uuB3p+D96f66GOrnp0gSXVgYMFFuOhySQt/GgKciNWBT7AgDROdPu5Nf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB608003

On Tue, Nov 10, 2026 at 11:31:33AM -0600, Logan Gunthorpe wrote:
> Each channel already gets its own struct device (dma_chan_dev),
> registered with device_register()/device_unregister() and torn down
> correctly by chan_dev_release(). Let drivers add their own sysfs
> attributes to that device directly, via a new dma_device.chan_groups
> field.
>
> This avoids drivers needing a second, separately-managed kobject to
> expose driver-specific attributes. That's a use-after-free issue:
> kobject_put() can invoke the ktype's release() and free the structure
> embedding dma_chan while the core (or the driver) still expects to
> reference it afterward, so avoiding it requires careful ordering and
> bookkeeping that's easy to get wrong. The channel's struct device
> already has the correct lifetime, and sysfs_create_group() supports
> the same named-subdirectory layout (attribute_group.name) that a bare
> kobject would provide.
>
> To let show()/store() callbacks safely recover the struct dma_chan from
> the struct device they're attached to without exposing dma_list_mutex
> itself to drivers, add a small dmaengine_chan_from_dev_lock() /
> dmaengine_chan_from_dev_unlock() pair that take / release the lock, and
> wrap them in a dmaengine_chan_from_dev CLASS so callers can write:
>
> 	CLASS(dmaengine_chan_from_dev, c)(dev);
> 	if (!c)
> 		return -ENODEV;
>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> ---
>  drivers/dma/dmaengine.c   | 27 +++++++++++++++++++++++++++
>  drivers/dma/dmaengine.h   | 19 +++++++++++++++++++
>  include/linux/dmaengine.h |  4 ++++
>  3 files changed, 50 insertions(+)
>
> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 34be53487a21..38f601bf41e1 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -161,6 +161,32 @@ static struct dma_chan *dev_to_dma_chan(struct device *dev)
>  	return chan_dev->chan;
>  }
>
> +/**
> + * dmaengine_chan_from_dev_lock - take dma_list_mutex and convert a channel's
> + *	struct device to its dma_chan
> + * @dev: the channel's struct device, embedded in struct dma_chan_dev
> + *
> + * Returns NULL if the channel has already been unregistered. Pairs with
> + * dmaengine_chan_from_dev_unlock(); see the dmaengine_chan_from_dev CLASS in
> + * drivers/dma/dmaengine.h.
> + */
> +struct dma_chan *dmaengine_chan_from_dev_lock(struct device *dev)
> +{
> +	mutex_lock(&dma_list_mutex);
> +	return dev_to_dma_chan(dev);
> +}
> +EXPORT_SYMBOL_GPL(dmaengine_chan_from_dev_lock);
> +
> +/**
> + * dmaengine_chan_from_dev_unlock - release the channel lookup lock
> + * @chan: unused; matches the value produced by dmaengine_chan_from_dev_lock()
> + */
> +void dmaengine_chan_from_dev_unlock(struct dma_chan *chan)
> +{
> +	mutex_unlock(&dma_list_mutex);
> +}
> +EXPORT_SYMBOL_GPL(dmaengine_chan_from_dev_unlock);
> +
>  static ssize_t memcpy_count_show(struct device *dev,
>  				 struct device_attribute *attr, char *buf)
>  {
> @@ -1117,6 +1143,7 @@ static int __dma_async_device_channel_register(struct dma_device *device,
>
>  	dmaengine_chan_dev(chan)->class = &dma_devclass;
>  	dmaengine_chan_dev(chan)->parent = device->dev;
> +	dmaengine_chan_dev(chan)->groups = device->chan_groups;

if echo channel have same groups, why need copy it to dma_chan?

>  	chan->chan_dev->chan = chan;
>  	chan->chan_dev->dev_id = device->dev_id;
>  	spin_lock_init(&chan->lock);
> diff --git a/drivers/dma/dmaengine.h b/drivers/dma/dmaengine.h
> index 42a3cfa7e597..f03248a091df 100644
> --- a/drivers/dma/dmaengine.h
> +++ b/drivers/dma/dmaengine.h
> @@ -214,6 +214,25 @@ int dma_async_device_channel_register(struct dma_device *device,
>  void dma_async_device_channel_unregister(struct dma_device *device,
>  					 struct dma_chan *chan);
>
> +/*
> + * dmaengine_chan_from_dev_lock() / dmaengine_chan_from_dev_unlock() bracket
> + * a critical section across which a channel's struct device can be safely
> + * converted back to its struct dma_chan: dmaengine_chan_from_dev_lock()
> + * returns NULL if the channel has already been unregistered, and the lock

where return NULL when already been unregistered

static struct dma_chan *dev_to_dma_chan(struct device *dev)
{
        struct dma_chan_dev *chan_dev;

        chan_dev = container_of(dev, typeof(*chan_dev), device);
        return chan_dev->chan;
}

Frank
> + * it takes must be held for as long as the returned channel (or anything
> + * derived from it) is accessed.
> + *
> + * Use these through the dmaengine_chan_from_dev CLASS below rather than calling
> + * them directly.
> + */
> +struct dma_chan *dmaengine_chan_from_dev_lock(struct device *dev);
> +void dmaengine_chan_from_dev_unlock(struct dma_chan *chan);
> +
> +DEFINE_CLASS(dmaengine_chan_from_dev, struct dma_chan *,
> +	     dmaengine_chan_from_dev_unlock(_T),
> +	     dmaengine_chan_from_dev_lock(dev),
> +	     struct device *dev)
> +
>  #ifdef CONFIG_DEBUG_FS
>  #include <linux/debugfs.h>
>
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index 805668fbe437..944c8b0f5848 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -839,6 +839,9 @@ struct dma_filter {
>   * @dev: struct device reference for dma mapping api
>   * @owner: owner module (automatically set based on the provided dev)
>   * @chan_ida: unique channel ID
> + * @chan_groups: optional NULL-terminated array of sysfs attribute groups
> + *	added to each channel's struct device, for driver-specific per-channel
> + *	attributes
>   * @src_addr_widths: bit mask of src addr widths the device supports
>   *	Width is specified in bytes, e.g. for a device supporting
>   *	a width of 4 the mask should have BIT(4) set.
> @@ -923,6 +926,7 @@ struct dma_device {
>  	struct device *dev;
>  	struct module *owner;
>  	struct ida chan_ida;
> +	const struct attribute_group **chan_groups;
>
>  	u32 src_addr_widths;
>  	u32 dst_addr_widths;
> --
> 2.47.3
>
