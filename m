Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793372058;
	b=Rf8SzAE9dp+jliNRxfAkBDzfwaFnFiPyh9U+E+dLAs/7zg4AbMoJwhDbwo40GYcr4tsQ
	 IVjGTWATK/qtjBTMtblm3Oobg4oj7YGMWdgosKDHH7ERYK+51bayrT9NWvMggSpnc0FaH
	 honXDNrXz9kRvxkeBJINAwF1qj6W9Pzem6K/448rFNlIHxRESl5aP1cTcLXCkuKc5wXEH
	 2Zp3fF2JMPqpHCGup6ukpCdNpna64kNNMhAasUdSWCE32AUJbOfkCJ7Dw8DryHhVCwZZm
	 tc5+UyDzOZYKd/vuWOaTou5MsUlCBpkd5AxxaKUlLmCG+3piLVd0E/d54A2stCWbLSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372058;
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
	bh=PekkYaI9jeM3cEBrqzdhETZRXNgt5DhqUj7o1+zf2b0=;
	b=kXPW9BOSQLx7nDbS20OJTnHQikxYvDS0tdvxaaT5L67WpOn/ySiMWfdYcJHkKU745eE5
	 IzgxjMxUiVwLhQnq1hl5vNdJB8ahvUO3jdsXps4d2/0EtkiMo2Hv9QqZlHeqxTdTtcbyz
	 mhzXdWXgdDwfvAmHtiFq+qYTahvDw1IDDceTuVOj/cGrMod+ZDeXq4Iv6XDlYQIRYUXwy
	 eV0u/OSxSO1VWmref7z3EoXP2r0egpPmD+MrMqiyc1SBdd/TnSxOanueRSUOw7jLOsYCj
	 aiN+xihfaPz9cdkq/SKVmFI0n2J01I6JbtQO38FFlIp5rvrxhA1dSKYJ9Xcr7U0DlYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=NgQo6u1g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.3
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013003.outbound.protection.outlook.com [52.101.72.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B380A606A31C;
	Fri, 30 Oct 2026 14:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B380A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=NgQo6u1g
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSIAMOA5VrsCgMb5zQYqgsn3mOKtao/Q0uo5UXggj68Jl7mtkQ+1xowt3UWq82UWycLL5+VkdmNQOX3saIDs9k1OlzS2RoAgjgFBlS2gR9PzVOVpFins8e5yaI6o4J5iA+3uqlubbTvuHCsp2SMJiqaA2pCBN2xgOhsFhjMh6LaARf2nkwSX5KouJLT60MR2Psm34/KAWN9Lj5ieZLSuD5024K6zzAA1fS2Rifj2QkQvJ0BKhhiLxKEMh8G5MgPPr4/jh1y/Rzovdhpo5xAxIti9m+ykFbcUob/e//rz+ldCbXAI+wVI26tOCok3ut4O+3F0vdeSyWKMWBwfRQv+Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PekkYaI9jeM3cEBrqzdhETZRXNgt5DhqUj7o1+zf2b0=;
 b=M5QSNwN6+2B3zmNlxS3Tsb7MCo5iOZUhc1tmwJ4bs38DtZVSaVPqp7CynQS8+B/jAuPL9i0W5jZMT/+KVD3q7qptWz2jfEcZ2DNFBiZSJ1d6V3epG9aMwhng+2CkAjJy2knTuF6E4tTerKifblyeYQOfjWwdvcxlyNXyzvbn3kt9pHijTSWClGpO7r6mMv6BwdbRHtJI6fu4N+tbYgZWCzwRTWJWKHxSF1J8HXZUFqzMvLChlyF1keD3wcIeylogn4Gn3XfAl/xwFRUJAUvs8o5vfZIzoXQwxYyax5LtCkW6IR6pw0YlqFNbKU4hNRIyHaiKSe3ZpvXENCcuAtUOLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PekkYaI9jeM3cEBrqzdhETZRXNgt5DhqUj7o1+zf2b0=;
 b=NgQo6u1gq4idaTB6Vo1P8dFpPQcug5btezWF0d0/goC0B2Rorw//g2dH/Ss85HRJajxJmzhS7JY2vemv1N+KmwjEfGmZ1KnamKZhfEVUiY7TZRSNVaJ9+YLl/8U90oK5or2xisB2xC9aMHREVZ9OhubT73ibgDnhIf1kIfrir/whZxA1ns1idOxlvhZ6VxQDy0IkUhjymny4RGbdg6Pk8AsXt7hW+vdxq3js/SUp39Ww4zx0f33E+W7B8LetiKTpM3bLqRCPBOJ5Fj6lnjeofq9DjPxtCSn9C8Z35cVm4H5lQWAsa4qqyVoomYDhshqQbEfRdxpeaAOwm38FHDwZ9w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by MI9PR04MB043780.eurprd04.prod.outlook.com
 (2603:10a6:290:84::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 14:54:15 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 14:54:14 +0000
Date: Fri, 30 Oct 2026 09:54:05 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Ziyou Wang (Lenovo)" <ziyou.dev@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Adrian Huang <adrianhuang0701@gmail.com>
Subject: Re: [PATCH] dmaengine: idxd: Fix use-after-free in idxd_remove
Message-ID: <auSvjQ8JKZ1GKWVT@SMW015318>
References: <20260911065547.161522-1-ziyou.dev@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911065547.161522-1-ziyou.dev@gmail.com>
X-ClientProxiedBy: PH0PR07CA0041.namprd07.prod.outlook.com
 (2603:10b6:510:e::16) To AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21)
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
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|MI9PR04MB043780:EE_
X-MS-Office365-Filtering-Correlation-Id: 653d767c-049c-41d7-70b2-08df3695aa63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|19092799006|260925021311599003|260925021911599003|260925022911599003|11063799006|56012099006|261009223027099003|261009223327099003|261009220027099003|261009221727099003|261009221227099003|261026140227099003|261026121527099003|261028144727099003|261021135927099003|261022105027099003|261021123027099003|261022075727099003|261021121427099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	8EVCFpsobgKQserY+0SGj/KZaeMEECs0NIUs0Ccuv69a3dnm+zrTtlHp2JqtQTgiscL7psRHdS6cQ6znNwzM/7TxgYZJZ2kBpRbdp7rlmytq0RHhtvRLLjg6ZTx+SqZS9z5zaIftln4bwD4n/lfVz/en3iIGrORwTXQFvgURBrQXuWrZ06MuZOqUhij3EJ8AzZt6IElemAsgT55AgFA1RoPyU1zFNLCoPWlHeOluFvPKmytgig9JaulbUNPgfd8iuBfONxNEUUhnOAygI6/LtdU6ppWVTGGxqOPA+plbL6d6ioJOCnRWJLLwEFAdSARj/OZU1coBVSc7HALYi4Nb3dVMHrMUuqGQp/sTias+Df/ygRpokBFo2a+6GwviRptoESu2J6K5QVfoAKc6VO9IXsgLbbPJt3iJVrkOFSdr64lb20CpXaNcgZNEZWf3BkBlPE7wwu9jvDa7G+7vM/zGliexPGzLCDCMccGCmM2V4i0PCQ0fkjVWwMQnCGFdH11R70KMhx4A3GBL9G8xVI8AkoVBqIjLKkl8DcltECX4R4RBlEGO2Lg0tZIxFCGIg3eG7770Sji+Z/QK5LpZeGON/ooMi1ZHyQHQa6Txti2XhJ+0GIHXyrUwyBTmHnd4haRH1m8YBfHBAQBliaGXZm7es08y62C2cLmX9SY020I0poM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(19092799006)(260925021311599003)(260925021911599003)(260925022911599003)(11063799006)(56012099006)(261009223027099003)(261009223327099003)(261009220027099003)(261009221727099003)(261009221227099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021135927099003)(261022105027099003)(261021123027099003)(261022075727099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kw+IKM+HoWrmf4GMhetYK3wjFO8sSxxb43PpRPtDMcYacQdBvpxysR5Ck/ff?=
 =?us-ascii?Q?XzTLx+n42wt7jeuYXdNyrhnRTo/5GGG4s5Rdb1jFFyoXivHoEWSWfCg4bu54?=
 =?us-ascii?Q?thPbQcAEwWTOhgLtvY0w5+VNkGbYvnWblAKVjVyGDqk5qqvSX5mSBbntCvp4?=
 =?us-ascii?Q?t4TuLlhGBom6TQQTXrg5JmF/sP1sZgULVTTVMUWNBWm4GNSzlmjCChgdlxVx?=
 =?us-ascii?Q?cE1pGrDjPJPLICMlCuZH1yVakwSqtLUDh1neJimT3AsFC0t36IYbSsa1vRBX?=
 =?us-ascii?Q?P/iMZmuiw6YeL1Tge3OvdfTvNo2sA0zMuezDoISnYx2hT9nlWaTE9n3Q7qay?=
 =?us-ascii?Q?r3EwHWwZ+JarKxrc3Fc0aUS8RIDWTxP402I1xbobI+lIDMaIIG5pxr/Uycjh?=
 =?us-ascii?Q?1+JmiqbVJjd6hYUfFNRnM2FeDFdQLwybdBI5uOOZem7SHYu24ESZ4hQD+CIv?=
 =?us-ascii?Q?7Oe88J76DYsRjh1q5q6Y7ZZyFhAYRY+jrmftqB/cc+GcUI+emY8xzuW9Zz0I?=
 =?us-ascii?Q?VVltKRqN0apK/DL1iXV0dc1eINQDuO5MmTuPgpBnvZkCEtagdUBlfQL0etaV?=
 =?us-ascii?Q?T515gpvjTUE9tflr1Gg3PgG9AArFflzbwmSBrtZjMnfvahFJ9RUz1QusUvkv?=
 =?us-ascii?Q?McaAOr7VSyyi//aaQIHSbqL6kYuroMtpIXr5bTBlduzZiHSNeNvqr8uc4Gy3?=
 =?us-ascii?Q?mNlFECprtyGRfRsdC1Ap05yAGpthl+XLgcjLO+imN91H8oqJCrFiu4bHNQRL?=
 =?us-ascii?Q?wxwANIlVLjO2Na6ycpDAcr6kpMZcbXvJUU6VdIZwNflkUieiOmlBWTxA9rD5?=
 =?us-ascii?Q?Wgmy60GXvn1kNVQBzN1NyncBXy1X2dq+k4/wcX8+WyCvG6SyMgwvUlSeTftY?=
 =?us-ascii?Q?/7laolthFI9AE9jMulGdsuJqKjamKxG0n2BVXqGcIY71OxA9k2UZcRDVmAKf?=
 =?us-ascii?Q?JTIvznDyaLoOhUelVeANeAldmbgwvYu1HTlorFocSvuX2aG9qMUBfJ+An7gU?=
 =?us-ascii?Q?4WWMMXFqiwW7pOcxiYVxb2KHcfQpx2KsXzHVYKKgsLnt0XAouKt161RNffnl?=
 =?us-ascii?Q?1rrGBnc2qN7d/G1HWhe30eNr8j51gvFTt07nR9fLLxUhXreQgx86cTGKYM2D?=
 =?us-ascii?Q?Z8dQFSOaAotGfzztPCs9tQcwbtBeRVEopL+cdfo0H3UqThjdmrOHWZZ9S0Ga?=
 =?us-ascii?Q?hP750Ob6ys63EPqgdFpucpPaa+trI9Wj01j/5pntrg8Ptr5ls0fSSrWNX4u8?=
 =?us-ascii?Q?7e2TZ2UxYhQKdlcwVVh/UjJqBeoySnf9jD2eiJhSgnTBJQWmiNC0K3QszHIO?=
 =?us-ascii?Q?5RYD+xbBSINqK9ZMFyA9rb0dMFThNfW10oRXL5yzhgfmNb0XHwlGLOmc0R+8?=
 =?us-ascii?Q?1TZvD/84NbOeSUwNC6lf7LEM14+m+3otrKDz7eW2HynjqWsbi0t88X962ibL?=
 =?us-ascii?Q?xLyc7lQaJzwnTPvT5AmGZAeDZN1kwwbAgUw0LP6GAjaamzWYl6RNr86DfHH2?=
 =?us-ascii?Q?/6qR8KlmmzfoJuJabtDz9lRLWSdvjifHhly/hDKH+B7rJ2MBI5U6MPzSs6vy?=
 =?us-ascii?Q?IkUZnTLFnTxqGcQPV81lUM72KN6dMRR6+q+S82+VjFzIgJXaKq2yR75Hh+Wx?=
 =?us-ascii?Q?caDMHuEvVqR1ywnGnSBULS2fhIzrVbvw6M8MfvsR8FK1rQeu9TUUnPxVMszj?=
 =?us-ascii?Q?iGKEzAvNgixTJdcy8g4QWbgNJQTKJLp83K583q5DrR/taJ9iHjyOHi36i6ee?=
 =?us-ascii?Q?ohiu2Sc7KOLIHjDGqo7gLM6N2WgC77gT6SK2IttEWnXOq3cDXqOw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 653d767c-049c-41d7-70b2-08df3695aa63
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12445.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 14:54:14.9071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yHDvS/n7v3gUOuVs8npEt5/+QmTwUMyLu8SJ3Tx9mo297fCG2ukKn0pJU3qWnLizh77XCjhzlEvEb87zqpldqlI9X4QpO1/sC7CWTVdRndA1DhyCYIoZs03f5qgqqj/g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB043780

On Fri, Sep 11, 2026 at 02:55:47PM +0800, Ziyou Wang (Lenovo) wrote:
> [You don't often get email from ziyou.dev@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> When unbinding the idxd driver, the following call trace is observed:
>
>   general protection fault, probably for non-canonical address 0x18fc1d6937256657
>   CPU: 117 UID: 0 PID: 3396 Comm: python3 Tainted: G E 7.2.0-rc5-latest+ #11 PREEMPT(lazy)
>   Hardware name: Lenovo WenTian WR5220 G5, BIOS speb50m-2.54
>   RIP: 0010:__refill_objects_node+0x2da/0x5e0
>   Call Trace:
>    <TASK>
>    refill_objects+0x1ee/0x2e0
>    __pcs_replace_empty_main+0x1e1/0x330
>    __kmalloc_noprof+0x503/0x550
>    ext4_htree_store_dirent+0x34/0x110 [ext4]
>    htree_dirblock_to_tree+0x1a9/0x2c0 [ext4]
>    ext4_htree_fill_tree+0x246/0x3d0 [ext4]
>    ext4_readdir+0x863/0x9d0 [ext4]
>    iterate_dir+0xa6/0x260
>    __x64_sys_getdents64+0x76/0x130
>    do_syscall_64+0x98/0x620
>    entry_SYSCALL_64_after_hwframe+0x76/0x7e
>    </TASK>
>
> With the KASAN-enabled kernel, the kernel reports a use-after-free bug:
>
> idxd_unregister_devices() calls device_unregister(wq), which triggers
> the wq release callback and frees wq memory via kfree(). However,
> idxd->wqs[] array still holds the freed pointer. Later, when
> device_unregister(idxd) calls idxd_device_drv_remove(), it accesses
> wq->state through idxd->wqs[], resulting in use-after-free.
>
> The same issue exists for idxd->engines[] and idxd->groups[] arrays.
>
> KASAN report:
>
>   BUG: KASAN: slab-use-after-free in idxd_device_drv_remove+0xc1/0x100 [idxd]
>   Read of size 4 at addr ff1100038d296414 by task python3/3354
>   CPU: 20 UID: 0 PID: 3354 Comm: python3 Tainted: G E 7.2.0-rc5-debug+
>   Hardware name: Lenovo WenTian WR5220 G5, BIOS speb50m-2.54
>
>   Call Trace:
>     <TASK>
>     dump_stack_lvl+0x5b/0x80
>     print_report+0x153/0x4b5
>     kasan_report+0xbc/0xf0
>     idxd_device_drv_remove+0xc1/0x100 [idxd]
>     device_release_driver_internal+0x244/0x2e0
>     bus_remove_device+0x195/0x2b0
>     device_del+0x24b/0x540
>     device_unregister+0x17/0x80
>     idxd_remove+0x3f/0x120 [idxd]
>     pci_device_remove+0x6d/0xf0
>     device_release_driver_internal+0x244/0x2e0
>     unbind_store+0xae/0xb0
>     kernfs_fop_write_iter+0x205/0x2d0
>     vfs_write+0x3a9/0x6b0
>     ksys_write+0xc7/0x160
>     do_syscall_64+0x9c/0x620
>     entry_SYSCALL_64_after_hwframe+0x76/0x7e
>     </TASK>
>
>   Allocated by task 1219:
>     kasan_save_stack+0x20/0x40
>     kasan_save_track+0x14/0x30
>     __kasan_kmalloc+0x9a/0xb0
>     __kmalloc_cache_node_noprof+0x1c6/0x470
>     idxd_pci_probe_alloc+0x103f/0x2430 [idxd]
>     local_pci_probe+0x71/0xd0
>     local_pci_probe_callback+0x20/0x40
>     process_one_work+0x389/0x6a0
>     worker_thread+0x321+0x590
>     kthread+0x1b4/0x200
>     ret_from_fork+0x3bd/0x4d0
>     ret_from_fork_asm+0x1a/0x30
>
>   Freed by task 3354:
>     kasan_save_stack+0x20/0x40
>     kasan_save_track+0x14/0x30
>     kasan_save_free_info+0x3b/0x70
>     __kasan_slab_free+0x6b/0x90
>     kfree+0x1d4/0x520
>     device_release+0x77/0x120
>     kobject_put+0xdb/0x2a0
>     idxd_unregister_devices+0x5b/0x130 [idxd]
>     idxd_remove+0x2f/0x120 [idxd]
>     pci_device_remove+0x6d/0xf0
>     device_release_driver_internal+0x244/0x2e0
>     unbind_store+0xae/0xb0
>     kernfs_fop_write_iter+0x205/0x2d0
>     vfs_write+0x3a9/0x6b0
>     ksys_write+0xc7/0x160
>     do_syscall_64+0x9c/0x620
>     entry_SYSCALL_64_after_hwframe+0x76/0x7e

Can you trim dump to make commit message short.

>
> Fix by taking refs on wq/engine/group conf_dev in idxd_unregister_devices()
> before calling device_unregister(). This prevents their memory from being
> freed until after idxd_device_drv_remove() completes. Add idxd_put_devices()
> to release the refs after all cleanup activities are done.
>
> To reproduce:
>   cd dsa-perf-micros
>   ./scripts/setup_dsa.sh -d dsa0 -w 1 -m s -e 4
>   echo "0000:00:01.0" > /sys/bus/pci/drivers/idxd/unbind

This is typical unbind driver method. So needn't this paragraph.

Frank

>
> Fixes: 47c16ac27d4c ("dmaengine: idxd: fix idxd conf_dev 'struct device' lifetime")
> Suggested-by: Adrian Huang (Lenovo) <adrianhuang0701@gmail.com>
> Signed-off-by: Ziyou Wang (Lenovo) <ziyou.dev@gmail.com>
> ---
> Added a Suggested-by tag for Adrian, as he came up with the idea for this patch.
>
>  drivers/dma/idxd/init.c  | 15 +++++++++++++++
>  drivers/dma/idxd/sysfs.c |  8 ++++++++
>  2 files changed, 23 insertions(+)
>
> diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
> index 4b827a329756..212efbfebacc 100644
> --- a/drivers/dma/idxd/init.c
> +++ b/drivers/dma/idxd/init.c
> @@ -1263,6 +1263,20 @@ static void idxd_shutdown(struct pci_dev *pdev)
>         flush_workqueue(idxd->wq);
>  }
>
> +static void idxd_put_devices(struct idxd_device *idxd)
> +{
> +       int i;
> +
> +       for (i = 0; i < idxd->max_wqs; i++)
> +               put_device(wq_confdev(idxd->wqs[i]));
> +
> +       for (i = 0; i < idxd->max_engines; i++)
> +               put_device(engine_confdev(idxd->engines[i]));
> +
> +       for (i = 0; i < idxd->max_groups; i++)
> +               put_device(group_confdev(idxd->groups[i]));
> +}
> +
>  static void idxd_remove(struct pci_dev *pdev)
>  {
>         struct idxd_device *idxd = pci_get_drvdata(pdev);
> @@ -1284,6 +1298,7 @@ static void idxd_remove(struct pci_dev *pdev)
>         if (device_pasid_enabled(idxd))
>                 idxd_disable_system_pasid(idxd);
>         pci_iounmap(pdev, idxd->reg_base);
> +       idxd_put_devices(idxd);
>         put_device(idxd_confdev(idxd));
>         pci_disable_device(pdev);
>  }
> diff --git a/drivers/dma/idxd/sysfs.c b/drivers/dma/idxd/sysfs.c
> index 6d251095c350..eca96a4dcecd 100644
> --- a/drivers/dma/idxd/sysfs.c
> +++ b/drivers/dma/idxd/sysfs.c
> @@ -1988,21 +1988,29 @@ void idxd_unregister_devices(struct idxd_device *idxd)
>  {
>         int i;
>
> +       /*
> +        * Take a reference count to the idxd device to prevent the
> +        * corresponding idxd context from being freed, as the driver
> +        * still needs it for the remaining cleanup operations.
> +        */
>         for (i = 0; i < idxd->max_wqs; i++) {
>                 struct idxd_wq *wq = idxd->wqs[i];
>
> +               get_device(wq_confdev(wq));
>                 device_unregister(wq_confdev(wq));
>         }
>
>         for (i = 0; i < idxd->max_engines; i++) {
>                 struct idxd_engine *engine = idxd->engines[i];
>
> +               get_device(engine_confdev(engine));
>                 device_unregister(engine_confdev(engine));
>         }
>
>         for (i = 0; i < idxd->max_groups; i++) {
>                 struct idxd_group *group = idxd->groups[i];
>
> +               get_device(group_confdev(group));
>                 device_unregister(group_confdev(group));
>         }
>  }
> --
> 2.53.0
>
