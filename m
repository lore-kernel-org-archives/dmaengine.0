Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792435024;
	b=d/NJ+F6s22W59SNrxUeQ6a3eg80ybcLRh4goDPV5H74HZ0216yEPLmFMownYlhch3NkM
	 gd3biHwn9nxo6fzsFcx9h0jqfkKJ6RfeMsTit4YP29HB7edI0qB4eh/myW69jQHG+P6l9
	 +XvN5Vf0BS2ceUL1NZ4kT35ojdJLoeXw+5HEa3UJDhttpeG/+6XnLntU5x73rfgcpHmqp
	 KYNVFYwqSM07sQ6u5eCRibkrmu6dTjztVzh9GPPo6c635VFZKyQ7rUWXHtGs7SBvZQlCF
	 LG4o9T75zyknOynD0kkEXX8XZWNgXX7rVwj+S9RAUc7/V9QAE49ALgbpQPXd37BdO+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435024;
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
	bh=b3lRXQWQxD9ae/ou/DI5aEmOcAYEKKay1BQZaxAG7OA=;
	b=LMnZV6R+kX1Ehn5pBJdVWQ6vYXmvnfc5IjRbeKjeeNoyccRJkl66mEDoQlNpN1CWidtt
	 MKR9EFXMLyvU/fcEH+8x5C/8nxKDdRhbZgzY+kXyrWV1KzSNt8qKc3leFNoyZVG/HZq8P
	 yiOrSlXnC2QLeAxzgmzMFfZMLCGmQ9y8wqfI1mnMKf4rnJUs6Fcy43LFzCe/noeGNz0ZF
	 zMZ30ledn66Wvor5CHyy36R9ZJG45p6jNwUs98aUlCOUMUTAm9tunfCjR7nWo54ZFushz
	 4DSopf+9nH/JMKfYGcxtMFgTijx0MCiSEPyu32PtYtD+HvHjj0EspPXCfEXYDR7r3ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Sh8aGAqX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.64
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011064.outbound.protection.outlook.com [40.107.130.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F7B606A31B;
	Mon, 19 Oct 2026 18:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03F7B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Sh8aGAqX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwy8QvMsBE11MY+wEUvLl6CedxHFsC9wXbsFT5G03itV+O5Yd0841aZs6xxNzExOtuHd7Rhw2X17k7mK6rinBjOMplutQD2hQhqr3E9ugYx1ppdOAYdGm9yo5ejTT6xdtRH846MNSg61AAnHpfH9lhHMX8qStzRcipDSw2mLk8Su3K63eDN+3aDpQlMKj7HKJNHp5kTERIJ9yYsNvO+olaxE7e6mkfhnAi9xX6zkmQsBx7NPMd2Tmp/RAGvCFAZ1d2DSE13Fa6WNevE97zz6YodzNTxDnGHCimV7zTHdVOYo4wmLs0kjkZbeAFcD6dSiQPnpHsIiby9wXojQvaASzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3lRXQWQxD9ae/ou/DI5aEmOcAYEKKay1BQZaxAG7OA=;
 b=zLVRb3QuyqtUnlq4thBkabRW3+l3Refvc/NHWDHfBzek8YX2ytdhmEIoLp2jpA12QSfYBieLoPfHOxHqKhP9pWvLP1jb81EK7KWrvCVVJk0g3eKAz4vtrmMI52+ueU9cveQZON7/RdbG767sZCuRfAYadvbvTcj6wk4CiNDJ1nGEani8moAAa9yCLybSsC984PYmxoGhnc1qWfNo7HZe4k6jNihsvhiufyfX2j65jCgdKaswtRuJfNlP8yRDYbkKHZTLczwFJfVYevC1/OyG2roZ/umpzTF4W408KbhnEnS772j6Pfq4JpJEbA8ti07xsCSmAKnkQu5vQMd7lrujtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3lRXQWQxD9ae/ou/DI5aEmOcAYEKKay1BQZaxAG7OA=;
 b=Sh8aGAqX+i6qfwjwK/zxbMpVof6HvZ4K3YX40KkS++mI0QrUZQxAZ+sYzGorwhB1oMDOGRr9yk2jk16hakzm1pYmO1A9Agzi7sEasQ5i4cJyo7ipMd8c7aN/A987rkqOIRqRH7+7MqwHK1YekjBmrD16w8aulxBgw/jFCe33uWNgnHkYct6uMszseDBLj/1Kkt6Y6oloR3+8o9sf75ZOh54WCbwQqNIbna2GLZ7ZNZ/vl9YV+ty1H3N5o0qj6bLv1xSkJ3FY+H+duSyKmitglJ14a5PK4GSeTDb89YHT2xmcJIUt0a8QP99Kwc0yUaW7lhbJ9a75Akms9aBoB6hupw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB9734.eurprd04.prod.outlook.com (2603:10a6:150:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 18:36:57 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:36:56 +0000
Date: Mon, 19 Oct 2026 13:36:46 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Daniel Byrne <daniel1.byrne@intel.com>
Cc: Vinod Koul <vkoul@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
	Fenghua Yu <fenghua.yu@intel.com>, Frank Li <Frank.Li@kernel.org>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dmaengine: add dmaengine_async_is_tx_complete() for
 channel status queries
Message-ID: <atZjPjTz8iJQKFNj@SMW015318>
References: <20261019150632.4026424-1-daniel1.byrne@intel.com>
 <20261019150632.4026424-2-daniel1.byrne@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019150632.4026424-2-daniel1.byrne@intel.com>
X-ClientProxiedBy: PH7P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::27) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB9734:EE_
X-MS-Office365-Filtering-Correlation-Id: 734be38f-1f84-44de-0e4c-08df2e0ff42d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|19092799006|23010399003|1800799024|261009223027099003|10067099003|56012099006|3023799007|22082099003|18002099003|5023799004|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	ycxNkJSPUyQztm8D36cUUd2gSwNzFAlNJqmm2M6rdkDfmw8wOpVjW9vCDmFXHWxqDARncTTvVmh6eb35qjFp0RsCL39xxAxoKmAhZl+VzrHmsDzGeAEOlQ+zTkYHWCSulTdfGxTH8Eqwc4RlY7GsS3P/tcrQbNEF2Ru8cc2yy3X0sHCtyvXSnD0IU+/AOzkoDi/r1OsaJ/Yq1bD8mrGqfP2VnHRptfXzhpUBbGK6VLh2oOWMvRmQNMpBeHmPOojzkpUWxG3dLco+r+3hhABJcjuytwyOqAT6zbmoBvvqW/rhoINyq4oPQ1zmNdPMOt4nWqjxAZnnf1qSmlaR7zNjs3axWcfX4FU3LZbI50kOkU7O6cx3BPGPuN4GFUSGgbvUhWbNRDvzE+sRPjt9K1Z4GOUD6AExSP84LI5I3HxJz5dPRluCneb7Lh0I1kh2Mj4ytzCIUOEjDBktu+rWHRq+IybQZmSluEBHVh/2QrmoQKKpGAA6/s0bXhY3qoMd7j2EyI1teOtg/7IpFRAB2gGVLVdjRuN4VERw5T7hwpOsMjiLgoPo+HaroJtMS7ozBQCLrpXGVRRi6gJaGG993m4DA9HGEXrH58gaH/8+17qmiunvI89q5qngPslKPjJPrAZJ1WskrK+iOLd7jAlyXjDhrLtI0VG69kxH7gSjsMX8xlw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003)(5023799004)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yu+oxRD9J09G591cntWyGMDI8HMJSmfu0DZE3SmAeyivHkJuAGs+mBwBy6C2?=
 =?us-ascii?Q?wC8q7flG+rbQW3kfGl20kfkFaqbbpyk9S5K91QEVPsIO4l+Dqv+1t2hVIhNK?=
 =?us-ascii?Q?/e47BYw2K0oDZBVg5KaPoceeV1xgxbF/MpsR3A7iTqUlHpECO6KS80E5UZdf?=
 =?us-ascii?Q?PcPjyr+wJWBfJeEqcGkse5ukvpzhDj0agF1fFwDPAFlwmvjzryNbOkUBvzMY?=
 =?us-ascii?Q?6tZvinsMmW20MGAZmdQavQyiMYnGiccnQKGXrWwB8/leoPB3WSDMZzzPh4KI?=
 =?us-ascii?Q?S6h+mu+AVQV9fGj67sZ4q8lykTsi12jRqU/6GdDN4Jt2M0yoOD/H+N7v3BYT?=
 =?us-ascii?Q?RlZlDOYP1hixI4+nf954NyMTYx+CEneCUYk4J6+LONSe0DruFnrsHSyWL9Om?=
 =?us-ascii?Q?LTd3e0qEOXn1q1uQ551Xh8sWNB4IZ6op21hQwjn8DliO3vrblJkvNb880Ujx?=
 =?us-ascii?Q?4ET2ZW9iNxN+GEwy3wmC9U8g1fB0ijkogrfLw+xiKENnxB3pdpCTPJeZcvDC?=
 =?us-ascii?Q?iAeOT63+zhNP5nWuFEstu5YVVrs9CJgNyXdQ4XptQem2ALnafmd6URm4sFDh?=
 =?us-ascii?Q?VNVuTkTBGSe6oDdEvjowMBKrqrWijVbgyCx9huY1hVUxyxiyfB22MGNnB+mm?=
 =?us-ascii?Q?OPZudXz1Wxll40T9wM4Fx+w1ScF7MeBKuM6Q+smwIQ2EDuI9LYEOnwIQyfea?=
 =?us-ascii?Q?yy4qyuiSwjSyMiWKn481e26lvBhHChR5sUo+U7FO3WyUXuuJwKfmUetuRvAO?=
 =?us-ascii?Q?zCOmX6IsjkrsZY7OgD84ewJGk6GPvzoSCN0GLNQeNFJfU3I6pYy1Jj90CENQ?=
 =?us-ascii?Q?eU4ci1ZMNRyOMuYSXQP9rqiecKk0HsyfQGV1B+YbBxA+zRbx5+CkNI0AaIsW?=
 =?us-ascii?Q?XyTAQy40LCgHTMz3olQKWRUG9mrKtWT920VNdJJqfySLjUYdmMK8odL07Fb4?=
 =?us-ascii?Q?XJvxoLfB6Xsn3ncGFDHy8f1ehmRn8xpzavY9y59pQ+xdXUl5PMo/0IYs3VoH?=
 =?us-ascii?Q?sj2JlXPjD+lOB+f1uOKpEKZOYVg1wKjbthrl6MRshwgIBV5D5oBVdCDJg4dY?=
 =?us-ascii?Q?BIGPVXo8YvnOBUDG7+AfQ4O8q0AZT3ahYAGl/TNVAVB0Hb7mM0Uq0h4y0w7T?=
 =?us-ascii?Q?zl+GFlGm0SURMtEPCgfSrvwSY/wuG8LgdaSTeCT84FxDMg+4hJCn3nM0+lpW?=
 =?us-ascii?Q?9v7PSXJHKeGJw5ZORiwu7ahrObyDqQ3QWVL9ae9+g+xaZpm6H+Y5ajkFJeeO?=
 =?us-ascii?Q?+xPbDIXxYtnEptAH21QWbFWAQUWxeBVG2QHjmLac/aM/Y+gDLQBUxk3xnLhq?=
 =?us-ascii?Q?nLqBrkLm5QRPMy369sN9sNcicutJPKeaf42d0RS8HSxruSEfzsEuPlTRvkMC?=
 =?us-ascii?Q?QVKM58OIwcNXHqg4vOKuX3u/fgPdPRosLJZsI+iTIXS4+1PPCn6Uk1lizG5O?=
 =?us-ascii?Q?48v9FHNpiMtO4DOlazuXz9pMUU6fErvu6xE1Cw3bywhTqJ00gLcmC0WNOAZ4?=
 =?us-ascii?Q?JVQYsbFTlr/CMQQXHTjEhPSdLuBOcbE0LzZhi76Q21W5eBx6C/r6HzogRExo?=
 =?us-ascii?Q?N1xibn4IPbG9YsD2ittEHG4PjRYEkn+zr1yPWgADNlGWJAYom3JMmM+yCCgK?=
 =?us-ascii?Q?JsFXCj8sYe6wum0qJ4j0lRXS7QryJSGPUUy1jgdTInu4TV5kem4nae1q3GYB?=
 =?us-ascii?Q?UaF82iT2ci/aDF67iurs9ZIwH0avFQ8Tihipu+uvIzciQmQaQ4qU7NhFpZLI?=
 =?us-ascii?Q?hln6Wi/E6pa1Lsm8haQVhFZyw/AzaB6R+I1C4TCyNV1EQazZWla6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 734be38f-1f84-44de-0e4c-08df2e0ff42d
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:36:56.7794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSzmnOQlQu+XLEjVKmC5Fh4eT2fJvsoXi6Zgoq9p41CBtSuba5GDKZrQ/WnZKUH21rcWaoF5h+SbN3BFWYHarK/VPx/38wNmiQB2tT06dXy0gUWciNADXJpP522OX5sw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9734

On Mon, Oct 19, 2026 at 08:06:30AM -0700, Daniel Byrne wrote:
> [You don't often get email from daniel1.byrne@intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Add dmaengine_async_is_tx_complete() as the client API for polling the
> completion of one transaction. Like dma_async_is_tx_complete(), which
> it deprecates, it routes the query to the channel's device_tx_status()
> callback; the change is that it drops the @last and @used outputs,
> which only make sense for providers that complete in cookie order.
> A provider that tracks per-descriptor state can answer exactly from
> that state, and a high-rate in-kernel polling user, the io_uring DSA
> copy offload to be posted separately, depends on such answers.

Does it should wrap dmaengine_tx_status()?  from naming conversion

dmaengine_async_is_tx_complete() should return bool type.

>
> The kernel-doc says how far such an answer goes. It is exact for a
> transaction submitted without DMA_PREP_INTERRUPT, on the first query
> that reports it finished. An interrupt-armed transaction reports its
> result through callback_result, and a cookie whose descriptor has been
> retired reads DMA_COMPLETE. The client guide's advice to pause or stop
> the channel before a query points at that text.

I don't that it is true. Supposed user can always poll state regardless if
set DMA_PREP_INTERRUPT.

>
> dma_async_is_complete() was only used through dma_cookie_status(), so
> delete it from the client header and open-code the cookie-window
> comparison there.

> Move dma_set_tx_state(), which only providers call,
> from the client header into drivers/dma/dmaengine.h; every in-tree

Use sperate patch for such movement.

Frank
