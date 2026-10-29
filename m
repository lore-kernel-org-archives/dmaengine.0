Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793286139;
	b=jJovEj5zKOS857iZuxAc9S5EZKrkN2UVmb6QlSssl3SKv6bvSep3++1h9q+WWb2cvBlI
	 pSp8SMEaCAeZR634qEpPpmidUc8ZQeVVfM4XCH9dz8FzpccGJR3f8+A0/CphA5n25A91Z
	 6HpsBGvn2xwtYBpPHg/Hunspwk641+2JKFLUJT+BovACxmCCImKqHYaEDtDqbJXiHW+ep
	 Lugvg+2d4NvAnyCpbJstBbQosw6z9T1na68rg6dlSlhJdKBvoQ5yQgNztQAWjA8DJYg4J
	 kDTIH47qwwp2BbDyfSl/K/0fcwRNv/xJeA6orYxRXwJiO+ZTZ5AeGziGZSjx53P2VzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286139;
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
	bh=sVOP8XjCaR6Z8nbrqOWtfye2gABOW2qgCi9w6vUtWZ8=;
	b=z3MBip+R1PlZeNRFhlYBI3yaQQ9YKqm5aT4A+DBhLwfJ5N7n2i6akClwkIKFeBMixG60
	 5aXJazncuX1ndEfpguCFLK1DT2Lu1m/boKbD0szEVqo188YWIITOtbSjGAisAlNi57Xh2
	 91qO8VUiRloQJOwykEQQ1Vn7ootHWouHzH8zdVx6VIuiXNLl6yK5hPcud1sIu9vvHC3aJ
	 ZsV9OnjwmEzgxmdG+ZaT3V5lxNh9957lF9G1xkmUot9gPfPin7gF8UNA3xPp5i4AjVFk/
	 lZ+bF7cA9uXAJ69f2lt8GgD6PiInN4hZfVkHqQewmbXuPR4drFc4G9wux7gsNq/jZ7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=qPbpJCaf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.7
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011007.outbound.protection.outlook.com [52.101.70.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A111606A31C;
	Thu, 29 Oct 2026 15:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A111606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=qPbpJCaf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2/+bil0iAACFe8Bse4WazhLc/A+7iY3hmuDWpniSiMxwes8zXnoflHYrNnEBEeWuPA3+dddaX5uTjz1okrpAa5B1/YIrYE7vJA51vOLJx7XQhRy56gaYRb1AsGDaN7rDe3/PI0xaja6NL0a4f0rJzRi+aVeqcVt6UJIPvEggtQ+a170pH1od+aEFWhW9TDlc3pYTj/dGcbYRMGLS919HLaau+pGH2a0BGMOSebyCL8zcdISSywKdOjvNe/u6XJ+RIpusTk5tpJkujbf6BuVpY5stIzVB8FI4ZtYk2b0sgdDIJzWmB66CUaDlRHg6rqgDaKyOqxVvQ6xD3pjmaILRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVOP8XjCaR6Z8nbrqOWtfye2gABOW2qgCi9w6vUtWZ8=;
 b=EJiipiIXeO1eMZA4jvZ1oFFhSpvF9ib4n8N1/j/MKeo8Zt/3++eSuX8LPnvfIn+5J759Y/JoacTFhdxf1LKgw0M4j90LLTNKuC5ouXpuzDSG7qiAkeG6CpevsAROJeQ7r4izINY7hdu7bdINpUOenv+edT6sFO/xqfgFTCuw4RgVyJb/F4Gn/SqSawg3FBPswumphFAixsOMDOrQEJ1ERPjvIvz7TOWBPOdqKw98z/fQflSYK8YqhnryMj0DKjQDhjzlOIo6nK7aQd4JkjNa5vk0y4zEk7SrZg2eMYzysdK65O9qVJpCF4BJRj9VpqGZqx1aoqVgb9032bhB9MZvRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVOP8XjCaR6Z8nbrqOWtfye2gABOW2qgCi9w6vUtWZ8=;
 b=qPbpJCafZ9Lf10ptYukUM+kozJ6TWSau/kZ5lVVok0ybto5kLQG1XsziEV0qHsolegr98NwRNKm5JrVQiDnWXjsLsRsgJjcz97yREJV6tTFTxsySzPligw20+ZZetVEVhmRsvqXvq3a7dpHvdRRVFqz6VdQw5wZirvfLgOt2JsSqcFVoq6nDhuXS/nPOzrcBjYg7i+kt009hUcRZbT78MVWhmdjkxoQaSHYXC+yUJmSXvystZm76zLHu40HuYCYyhy1R0MsYAmYbwmteyrMNWRkQTtHMG2OaS1VNmsXaI43hSd4D1Y4qJAqfcU8NpYA/oAqxRrHuka32Dh7m/vnCoA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB12091.eurprd04.prod.outlook.com (2603:10a6:150:312::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 15:02:14 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 15:02:14 +0000
Date: Thu, 29 Oct 2026 10:02:00 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Jacob Procee <sn125164@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: apple-admac: Fix position one period ahead at
 period boundary
Message-ID: <auNf6KqfgS5Usrfk@SMW015318>
References: <20261029105908.22809-1-sn125164@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029105908.22809-1-sn125164@gmail.com>
X-ClientProxiedBy: PH8P223CA0004.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::29) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB12091:EE_
X-MS-Office365-Filtering-Correlation-Id: 95a7c1af-c493-4682-b1f4-08df35cd9d99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|7416014|376014|1800799024|22082099003|18002099003|56012099006|11063799006|10067099003|261028144727099003|261022075727099003|261022105027099003|261021121427099003|261009223027099003|261026140227099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	EopZ5dikKEs6t20onIchoSqi69azPGNgbDIbAHBhgf7BBFq6XNlqvQ9MrPuCXoD/ToepSqb1r+u6x6IIVW1HkN1t/RU/+R+cGXYVV97BaQuGA8rkkBV3L/3GqbUcJru8SmJF7vq/rwOsRKGrxGLxc/aKEDhk+bexZh/yb0Zpwlsx7EJo4ZFnPypDgU6O2wLGMQB31FtLlNeBs2hT7Hsdo2m0RxkWDXrGAPdLLmYb99FYSX3gowgRtcdz7zt1qJdnYaFM+g6JHskplR9Kc0Ic8CO4Xc6zPDKZFu4xNmVfBiZhWjxNib/QPCTnss+KmRfM+fluyds4WtSwl59l6exkUsEl//4cbKmSWX62+vGzwOJUI8NZliRQeIxBQlNQlN0Ef8GV2q5i/a5aGwEicULY1l9hB/Ug46qCr1ZRREwXsk3j3JDOIMEsBuNefKuwP7aV4UTjqpv9MeiY9jJ8GN15HpfMstsTrWUvan0UFbd1W0nIjZLFV3BHiPzlWEJJi0qUMCVhuU/rLnxtaVq19DbtDRvwV7RLEnI5lofC5Q/l4x6S8IpDZcB3mADyGiTrEhL8lCEQkUV7F/7u/IvoU2N/FPVjXvwFuOKWy8RjlVJEPHNW4DSUVlo6EkAY7iL3/Q+6Y/VVwcLN+fCv6YRg0Zdrg2/xnwrm1721QSB66OqFypA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(7416014)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(261028144727099003)(261022075727099003)(261022105027099003)(261021121427099003)(261009223027099003)(261026140227099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fUREhWaoP7CzVTAx+9GQd8WkevyPMJHW1UgDPjddBFcsbLGk9Zgi2xqKb0sC?=
 =?us-ascii?Q?6MbtvRnK3BJKR91VtjihU63ByFuHoibZZnQGIvEUk+6eVYMOuCCQWoSHGPTz?=
 =?us-ascii?Q?iiGR65Rc132+oHKYcAEF9uk+1oucQyoHw8Yhttb0KMylmcyT7xUy10F+TLYy?=
 =?us-ascii?Q?cnfJK5T6QBWTiaep01C9lIUb8WOY1lsgSau06QfXFOfCAJwi2IbeA9LhvRFg?=
 =?us-ascii?Q?tFaMH3gj4KeTICm9ZTRGAUxR2KxnAL/NQLcgGgpGVCzklYHQCooWot/xKWFa?=
 =?us-ascii?Q?y1SbmX4eBx/sFvsp+2PzDn/8zDG0Bc5kh0+aD4MSxPYQZmeAPXDI6nsQfr9V?=
 =?us-ascii?Q?4o5CAXQUZFUxfhhJRAgAT+oKkImGLg+HUmCRWxUT+bOlfcPWsEsE0nBUmmbH?=
 =?us-ascii?Q?T8/Iy5mwyO4qZ5aa3j+zgnTmUmN8FslDzD4fYZc/9POOsJA+vbaikvkpTnxE?=
 =?us-ascii?Q?/zL3hagven0WTXFpp9UwUa+FoezLhppdjCtkjXABIIUGlKkreMFbtYVDdbek?=
 =?us-ascii?Q?cjjAptFfqXCYIa+SDzMnuKiTdjzbbQJj8B649wZLbgnkCK6PA0Q//N4l2yyx?=
 =?us-ascii?Q?9kQM/a1fUbMecvEd5MBFmsaOQtKTok16qH2+l6HLVZjdouTnlxK5i0HC9Pyd?=
 =?us-ascii?Q?YPCkDoQOqYbX+NLCLADx+dBHSnrdx7m8Nue+oEaZh8ILOcAqjpedgTYPTwiV?=
 =?us-ascii?Q?uzJwyx6fyO65Kr+FKOy/J8KAoAQGp35Ru8O6C805weMNJlf0Bz/y7mjgdfco?=
 =?us-ascii?Q?8bNGYMn7FsOUu0N9v0B2/sy+x0+9qRC6omKv4iFKKmjjgd3Zbb2P0ip1KWJn?=
 =?us-ascii?Q?jpVloUAUmcPAQrktrdJwUzy5O9hnUE0v0uBd0l86d4z33T2V/dvEC/JKOhw6?=
 =?us-ascii?Q?cqh8D7ZY/P4zdyKLhuBu5kG6hGqvZ8LASvDec+UB872xpu3KZmLLDyW9wrL8?=
 =?us-ascii?Q?fxZ4TmQg1Oz2z9Nfs8rBMHcovfbRbZfLKie3G7ImR+V9d7EbCKDWXy0F/IFc?=
 =?us-ascii?Q?XRLcJVd2YS/mg4Z12GaKYdR3wMaZJoi++Y9UOmXjAkllz8aXk/ybfK4ITyVF?=
 =?us-ascii?Q?NeiZa8vK7xkWIVlw/iuKCGj5jRdcE0SW1Z8f7ZANXshzIiou9TMd2h56EzX2?=
 =?us-ascii?Q?t+IrvZhocoJx4pG5RiWMEY9xYRkgPVxS6eHnMVEH50z23trg4JcD7CpnV7Ie?=
 =?us-ascii?Q?EjyEx+19ykXYxTWp52Cj9FHRKsaTMdpuoVjs6yKAEmnGjzluhAoCrWMl1h16?=
 =?us-ascii?Q?QjIY8eHhwo+vaihjLK2nYqpEjmggXyjg8taWzSCCy9jsjcUurDqrkuEjl6uA?=
 =?us-ascii?Q?F6DRiMPZdYNbNEFh7++4B6Y2Whdp5Qgaq/UwXzA+JP8pyMzV993WLvggAvTU?=
 =?us-ascii?Q?xOBXlTjyWzSUSdwVWgrUGFrON3CKYKvlkGGpPMZKrHMwlVq0MWItFRuLS2T1?=
 =?us-ascii?Q?fa3BhLM1MiGyR8YmbSbRjNN1EI6kzWa5c564XaQfCeUeikjCLIlYCqFS3wFd?=
 =?us-ascii?Q?5t2hS/dOgzyrOflkuvRXggJuJaRgccCoYmrBVR8TQjbsRI+PGYgxX+gRoWv3?=
 =?us-ascii?Q?6eq+yxBMvIhOq8B5+8R9yrsYRJ/CiEtGGXcczmVFEFRz65xzSjbUmUCB8JZP?=
 =?us-ascii?Q?Hs3iRgczTEmPXGT4G0vqn4YA5XFSM2RyCrLIG6GN/swibJv5lfAGuRzFGIap?=
 =?us-ascii?Q?dZ0y0bADTyfcXmDduNdMwdsA4eDQYYGfFNHkzN6Bkjf9LGiOCXevZNFid+C5?=
 =?us-ascii?Q?9ysC8eRoakb+NT7g4hqMn8ZCXf9ubG7UI1iMNtt/MQSKNhYF0BNG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a7c1af-c493-4682-b1f4-08df35cd9d99
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 15:02:14.0019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ReHQGzEM3z3zUJmd+qPmV8AkykX77xix9MhblxdYA6Qh59n30c+5Mjuf8g2QMX88JucZP3BYIoNx6QOAlh3FGEQvqkP+flgISmWCIGwpq6V+Vx61eXi9MRX7vuyK2KTc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12091

On Thu, Oct 29, 2026 at 11:59:08AM +0100, Jacob Procee wrote:
> [You don't often get email from sn125164@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Speaker playback on a MacBook Pro 14" (M1 Pro, J314s) underruns at
> irregular intervals, audible as a tick: 8 times in 3.7 hours of
> playback. Where an underrun was caught (4 of 8), the ALSA hw_ptr had
> jumped by one buffer size while about 70 ms of audio was still queued,
> and a kernel trace showed the DMA position stepping back by exactly one
> period at each of the 6 underruns it covered.
>
> admac_cyclic_read_residue() derives the position from the report ring
> (periods finished but not yet reclaimed) and REG_RESIDUE (bytes left in
> the current descriptor). When a descriptor finishes, the residue first
> drops to zero, then the report is posted and the next descriptor is
> loaded. Usually the last two happen together, but occasionally the
> report comes first. A read in that window counts the finished period
> twice:
>
>  - residue2 == 0 with the report already in ring2: the period is
>    counted in nreports and again as the fully consumed current
>    descriptor;
>  - residue1 == 0 with the report already in ring1, and the next
>    descriptor loaded by the time residue2 is read: the
>    residue2 > residue1 branch adds one to a ring1 that already holds
>    the report.
>
> Either way the position is one period ahead. The next read is behind
> it, snd_pcm_update_hw_ptr0() takes the backwards step for a wrap of the
> whole buffer, and the stream underruns.
>
> While the channel runs, a zero residue only occurs between descriptors,
> so read the registers again while either residue is zero. The retries
> are bounded, as the residue also stays zero on a stopped channel or one
> that ran out of descriptors; after the last retry the position is
> computed as before.
>
> With a debug build counting retries, one hour of playback needed a
> retry for 2210 of 3.39 million reads, at most three retries (3.5 us),
> also across pause and stream restart. Both states above showed up in
> the logged register values. There were no underruns in three hours of
> playback with the fix.
>
> Fixes: b127315d9a78 ("dmaengine: apple-admac: Add Apple ADMAC driver")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Jacob Procee <sn125164@gmail.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
