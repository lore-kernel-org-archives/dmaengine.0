Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013002.outbound.protection.outlook.com [52.101.83.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9213D0BE1;
	Tue, 13 Oct 2026 14:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903322; cv=fail; b=KcuZ0p+bTb+s5wFSItnoOJp96H49FMDsUaEiY0yWSet0IMOr7ufDdTv72BHum7cbX4qLWUqg5aGAokSc6lJaAiCwHRfsRCV09v9qa5dRg6sTISACZNv07K8NGRT2dFhZbL/e09eszsPheDXJPldQsu4c342/dunwi23TuPuHYfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903322; c=relaxed/simple;
	bh=+7uD1qeoNrtWIKPK4kxzmWqsPONpnGJrOuUEmgPmiuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pMigCZSTZAvVR8DqDO8vzmJJp9k3Jdkgj1BgcHiaCjJV6EjP3on0bSvolbOkoN0O3pjuhG+zsJKqhcGOcQeb1Q3uJ3nbugPHN99fMBh25vKj0mKWJtiaUOyXaO9XvFd/jlkpSs8bkSNjpyIxY6NYesIQFUFUtsjbDbS+JshxjZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CEKXrD4Y; arc=fail smtp.client-ip=52.101.83.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CEKXrD4Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aw7+trSvtfLYh3k+TZA40Zf2OGq9InELjSbU2lFG2H6K5quGu4qPpywfqaDgycYoqYm8TJLlDRWg1jikSpyhCfmIEH3o6nJlAiZEfHjsOQ+o2hs3nto2mAvLWYB9KmwGuxkIBs8/IP6HuSt+jC6pHXTdlFbEe5yut2MUmQG4wl3mRm85jTPolHCJAM1ox8uIrM01bZBJweDJh/0OanEDQIYA6ytYzbmhscNLhuNPpdfZRG9H/TIHMfzm5GP1ARpxjQxwwQ0sswYfjziT8eGjOshDzXoWPUEv1LqGK8hKSwwBWpCZ9gVh7V12XU1USkngiia8huJuzK3nwsUAA3ddzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eivp8cwGZX6BKr4DuJWyXBfqiqvrN247HN/4Xw349tg=;
 b=rn9K6+guekyw0mBfmJfLUpfLQls+VSoz1mouNBKfxEzAxG39TdsiIioZ0j749fQLOt/28qihLnyygVvKHDiSzs8x2iWOLHzcJNP5UyMzl+/VYTpEcZ5gse/1Dp1v+gqwuEPL2XD+UtHg66QWGMLZbqp1J62weCygvS3k5A8y72+C5CWcZTrvsDEIRRzyNinez1GMkOJtXU8mhWPTyoQws13jOd8QqZ/B4kiJ9o/ZWclBpPEKgQzGJzhXs0CiFj7MIgPmBp1HzJ6FNcEkyddqsYT2d7KJO12AYAjFEkfKXwM2tMaIkCTFMkI7JAOrkDGLStMeVraOvbe3Gc+cJWyjwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eivp8cwGZX6BKr4DuJWyXBfqiqvrN247HN/4Xw349tg=;
 b=CEKXrD4YJP/oEFX3wGwTIxShVNWdpjbL7thjT7AXwVk8cAzXxWlJxW4H/fKAm3sl6WR8miVHerU/pUJUIhzPj3WBKWHkhnFsiwgZ8zI8OfqWeA21y1HRE+Yg36lIss4lhxNp0dWRRYlMNCjctn5RguTm+UuLSSDJmHCs1+QeSeDgfGvzbXijrahhWfc7Wh0AmIly5oMDRd6/dvmVjR6Ks2iKlcrOIs8it+6XpHu6DUu7gzHr/Yctd09YSrcqzkFqvTh+AyidbEb2A6JtydbOedGAMBUJJ+sQ/O5QqhI82qRClSBe2VryzvEs1h8eFRaUL2nHCazohxnAmcdntE917g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11358.eurprd04.prod.outlook.com (2603:10a6:102:4ef::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 14:55:17 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 14:55:17 +0000
Date: Tue, 13 Oct 2026 09:55:03 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, Steve Wahl <steve.wahl@hpe.com>
Subject: Re: [PATCH 1/6] dmaengine: idxd: Do not call destroy_workqueue with
 null idxd->wq
Message-ID: <as5GR-3kOfI47wQc@SMW015318>
References: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
 <20261012-wt-idxd-fixes-v1-1-30a35a445077@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-wt-idxd-fixes-v1-1-30a35a445077@intel.com>
X-ClientProxiedBy: CY5PR19CA0037.namprd19.prod.outlook.com
 (2603:10b6:930:1a::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11358:EE_
X-MS-Office365-Filtering-Correlation-Id: 77dd5355-ff1f-4aed-585a-08df2939fe65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|19092799006|56012099006|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	cQ6Pa/esH61TsA1tmBfPPHGzeWS53ci/Z8ImBgnhJ71j06vI2zejUPzDPZG/cN8AYkh/6Onva6NYZ6Uce+JP0dCvBgbGMjkWrg8SZGfczYr3415TJjwKV8vdZJ0M4aW8pNLm0J+bIH3wp1hH+evzXcjtWggk7GTFY0B0yNX5+4+AVAAyFy6oGM8O2jiP/Ntf07CAancZJWl4ej6i9IqLsm58VJDbCEiyuMqBJiudu5NavGAq2/8zm1cxwWsKXfr+KDQqgMdnTzAKVhS95H2UDw86lEZrnIxPpra7sTZooMtrpsANgKRYcEqil9rWHa0VsKU5jpd1KkHK6GGoNmxQdxs7w32x1HQZNJk2bAeZ63yGVhgqZSTc6xMOlN45sq0hej+Rc2EQpPL2nMZg7DUfbpKEZIirq0eTWyHbdmM3ewzPb/279O88ktVqVrtpE9ItVI+p0diKiToeuZMLV6gPDl5isJMr1fPxrBJsRAE9YhAzsrsy7kBWQbvZNEyNAVkdk4d9zH0J7Orm40gkfO9kKIcxOCkhflhXIMHp7QOqwf8SgvwBJqGHCT00ljwsXQIexQSCxBJdhkn8JNart5ntY1wS2eCIGf0FDWrWcHJdZc1gjvCsuSOK0ooI8BL8uhv2gw2In0TwOeq1HLdWmoxBtcL3b1Ecjj61J2Xd3tUlZ2Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(19092799006)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5MPCwLi26kVxRUGbsavWxyoSD8sejn36rhoua3tzFAaAPHerSl1VcyeCPdsZ?=
 =?us-ascii?Q?h1M92EGqarBjciMoaqA6QmwlHqKEEcftEQRGjY9kf5Rx43fQrBxLNEwLNUnE?=
 =?us-ascii?Q?tojNnZL1dJe8CSNo/pzOKB33X9FAaS6bswV48Vvz9bk4MHPzNMPSDNZ4itng?=
 =?us-ascii?Q?+tTi6e3N/KINTIinml5tqZhsTMKM74ycHexnGo/ZGT2bhSt1nvWtD5z23h9h?=
 =?us-ascii?Q?wT2IEmGfoUVfGPOrUJTrkmcu6XXgjySFMqG6h63iKnk8a4RKJOQWSj+Ov8DS?=
 =?us-ascii?Q?qj5AeX4VNvCfFsjOrdQqxm59RmfkdlheM+/JJ4YePgAPXo4+rCgKiwNnfhv1?=
 =?us-ascii?Q?m9Zh6nzTjVJZXYW5WdArWxMumdFBR94Y4v0Ytd0sitJAp7Y2u/5M+632EHni?=
 =?us-ascii?Q?xDlWihpu5wKEYvUv0ggxMK5FWzfZU/ZdykraLif/Fu9mC5O1XFeo+d/Zrm1j?=
 =?us-ascii?Q?vwDQIVNM3Pa91yC2fAc3lmAtMHlMSaxKt/XmCN6BXIffK7D2XLlwWMdb76S9?=
 =?us-ascii?Q?lNK9k432M+tVHa9e+9U2H1cSWhcAovT9lLRBrePNvZuHEBzv3R21ZD12chU3?=
 =?us-ascii?Q?O+tJ6Hi0zpVyjE6MM0GJKC+0dbsPxLp22LgABqmbjdsz54HmHNQlSUysOFG7?=
 =?us-ascii?Q?KoqfvJr0Lm+/fgPQef9M+CWO+1tVRjITTK8LFTvJWji/MjTxwz7qV1QjRbh9?=
 =?us-ascii?Q?sJGKrRNVQP9dBrgm0HX/szs+Tde92ItpJqjj8SOOHHuu9hKDm7XGgXjybJO0?=
 =?us-ascii?Q?/ExJDgEwjulORWhdwVKTk0+q5t9o/kJEc8z7Z8+Me7AlwDWgr1/DyFv/1bvX?=
 =?us-ascii?Q?ofRbciJIQMAVJ/t0J90QLReItAqXYiKqeNf1/DEY5gJnsg24/buNX/8d7Ycn?=
 =?us-ascii?Q?tB0h7g5nDkNo/1Gf7QzZndB0XKaedDvBRQwQxyh3C/xczzBYhhwWvZQq96YC?=
 =?us-ascii?Q?4oZrpP5vAjyCVTMYpzTfSrdG3BvbH/re+t4z8s6rT8EhJTwm4W2Fd0Ep4kLB?=
 =?us-ascii?Q?TVQiUmqgFgRTHlny3QAD2+KQzWz+hfcdQwweKZEvQuD2kDGRKxHz/l9x6WYB?=
 =?us-ascii?Q?FzKhxwH5OzPxHwvQcxP/ZXi507WoPGRWIq7wtECvgKsQQIV/jry4RO2poNjK?=
 =?us-ascii?Q?7AXuuWcoaCi28uEtDls7RUtU08vO61B41SRtYI6HXSUDSweMZ+8Z0VYw1viX?=
 =?us-ascii?Q?7QMuJWA1UZDzAbH05xGg+QQXTVymotk2ODVDZkcF+lpFO0N1NFyBmRCkI1xd?=
 =?us-ascii?Q?EyNZag3McFC4YIe/WlWRFZm9lMpLFk0MhyaiEEomo9sdKPneDvw5MBeFBEJ0?=
 =?us-ascii?Q?bIGLhVuivKPjvMAZ3qOid3+BIO6uOZSXGJn/yZDPUgEEynkVmmDi+u92S7u8?=
 =?us-ascii?Q?JwiE6k4DGearaccow0A2dWHzZIC+gC3J92oatRRF/gFxUnqYH9L/uACXmFdT?=
 =?us-ascii?Q?XbWHsInvPwKIdJhm1/k5Th6czke53cZUU7//wdV+MMzIiCmHmPC5T72nS3mI?=
 =?us-ascii?Q?gzf+2QSSZzGZToFrse9McIwXAnxqfi0f6ZKjCX0N15mgx7NmiMfDnXjkZLVo?=
 =?us-ascii?Q?jo2BJahFA/t9ZjGh0vq+TBURVGmFhnjYnWk61zoNbdD72/ntqr8WeUYErnGQ?=
 =?us-ascii?Q?PJyXwniTO3tSyxXTbJiEOPZzfP+AWybrrX202fvIHamEaxb8sXIfFDQZZeFE?=
 =?us-ascii?Q?OFOR6lhSPDgko5nirK0XLu1h5GW89BZPzQW8volxqosKgMgFyjXGv9yZGMZx?=
 =?us-ascii?Q?0YjVR+xNFWWeTGerKpSbpXVh/B3Kjg6yyOCNaJbepjHiYDp0Fzzl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77dd5355-ff1f-4aed-585a-08df2939fe65
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 14:55:17.0916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkPSnok3BSJBtsiAM1Saw01JW8+HPLsx8O28MgLwLkVyUlgcUaEp6lBlMWifjS/lkXKEEkFS7EZBDR+5NKmwbvIhTOpd1xSefnP5L2nE9W5pdzOQhtYwE4fBPMxpe/ZE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11358

On Mon, Oct 12, 2026 at 02:38:04PM -0700, Vinicius Costa Gomes wrote:
> From: Steve Wahl <steve.wahl@hpe.com>
>
> Error paths within idxd_pci_probe_alloc and related functions end up
> calling destroy_workqueue with a null pointer, from

all funciton need (), include subject.

destroy_workqueue()

Frank

> idxd_conf_device_release via put_device, because that allocation has
> not yet occurred when the error is hit.
>
> This was encountered running in a kexec'd kdump kernel with reduced
> resources, causing the "Device is HALTED!" branch in
> idxd_device_init_reset to be taken.
>
> In idxd_conf_device_release, check that the workqueue has been
> allocated before trying to destroy it.
>
> Fixes: 3d33de353b1f ("dmaengine: idxd: Fix not releasing workqueue on .release()")
> Signed-off-by: Steve Wahl <steve.wahl@hpe.com>
> Acked-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
> ---
>  drivers/dma/idxd/sysfs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/idxd/sysfs.c b/drivers/dma/idxd/sysfs.c
> index 6d251095c350..d5ffc641c856 100644
> --- a/drivers/dma/idxd/sysfs.c
> +++ b/drivers/dma/idxd/sysfs.c
> @@ -1836,7 +1836,8 @@ static void idxd_conf_device_release(struct device *dev)
>  {
>  	struct idxd_device *idxd = confdev_to_idxd(dev);
>
> -	destroy_workqueue(idxd->wq);
> +	if (idxd->wq)
> +		destroy_workqueue(idxd->wq);
>  	kfree(idxd->groups);
>  	bitmap_free(idxd->wq_enable_map);
>  	kfree(idxd->wqs);
>
> --
> 2.56.0
>
