Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795032545;
	b=FHuZ7Rc6anP+UaFxKhgYcok6FJotMPg5u1G+tW2gTBxavBUUCVLuar8qj3HmPIOofn0u
	 DsHmzrFQNCz+TcvtgKU3Tj9JG0RP0CuU2uDvPccf923WbCnzJbwhHnll2k3htrOzlLn7c
	 8Rx1Gy/bF80w7FGqgPi202ynMeuQJEv+pzJfu7znJL1HuELLrfzvb64DFuJYZupGoctMF
	 vtCSKhXnSRxYT95zlWQFNQnuY6Zrip5i9ZZxXeS1kyFNyxOzLQaHF77izkhN4eIo1MIJL
	 GE/2R3ethcrcCDRxK8/v0eAmfDFcy8Sg/iCAB5H+mpKY3W5SSwDzSKCLW9QGD35cCHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032545;
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
	bh=9WRNyeBnZb//q4g6RT7i2qJam+iKp1nuSNo4gJN4AGE=;
	b=E+NjAJh/dQeQXLiTU0k28P/qlAFCPUBy/PL+rv6GIPWwVjN9FqHQsF4hWx2IGBRaJP2t
	 xIxF9sJSVBW+uBqC6QGGHohPmAo9IX3xFIfVUNu+dHdSgqUZMhPHpJlshtkHLUBicUMP3
	 j9rzFf78SYXLlHEfNSVjrmt/ovOhJGr5QFgw2hgp1mu49sC4RFemxpw2ou91dxkS3a6Jc
	 ZoA+pRMlGaegZ9YSvAr+1YoE152bU49gO/r/mGBiw+ePAc7+S+ykc7h9hxc5cKcUTZvRQ
	 9nkadsFdaedoatGlfzhL1tY5Vzb1saKnGxpeVHWBpLlIgGxHlcWH0gyNv0s2yZUCAxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=nRQ3pZm8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.35
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013035.outbound.protection.outlook.com [52.101.83.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ADC606A320;
	Wed, 18 Nov 2026 20:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30ADC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=nRQ3pZm8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NcYdMEYjrNc4eBQTBlNUXCnbeI/aAIoz9udMf6nc0Y9iXJpjM0GkydyiSfeG96ldXqWKpZvuxswragC1DJBmfxoqVHJ+M+ti9PTrltqUBaYsQamQspNpFsSsEEGYVyHU26KSbXWkQ1GBf5/fH03aYlDoseEbJg3e4+NOKFjZmMMfOma1JGOEaAgw8ECCGys6vL7jFENOGaJZ10qXm0YfCwA/neG73v3NfoqGJIN/+A7hPm/Paj5XQkvY/EU2dPfsa5mcmyGVsj7R/wETwQg30LuNJpFxX13uLlGkBk3VPngNYBLirEqoEpHkcfrY/12PsahtEWseHfdwauBCbFlqwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WRNyeBnZb//q4g6RT7i2qJam+iKp1nuSNo4gJN4AGE=;
 b=caGWKUJZWdNA4f7Ju7clM+Y5DI88DmDG2P2IQTD+uu+DM0SIuKUJqeBwbcqokM+3RcxIvFoJE/7HSSX0ouQ/Kk1oNPs+zWL8CvCgrbGOQVyeOz9BH24hpElF/uU/am+AVcWeAsuiV0PnviWCSDahk9Lns8raueugHztkH22ME7jW4wjTqrqHD6Y9jcaq0wyYFhBYMDvk4xt7JAaYXzAV2Rkjy09HXbzgPhgzGzS9glwwORrie4aFyR7lAjhW8tUlWBxI3TT+1GYTWm2z+FbXKJ/ljqI2733zEz5oL4Gh3k7PF+/4tNC/tgBUWXCdofOmp7Mfn/tbrejCRt0mUFvcPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WRNyeBnZb//q4g6RT7i2qJam+iKp1nuSNo4gJN4AGE=;
 b=nRQ3pZm8gtq5lrtNrUB8b9U/GUWArCknuOSX6e469xpkekVcOVDg3aYZdB3n3HkPUQ6L7nrm+TXDnGnEO4eYVOy+ZZj7aPLbD+zXTUvMiw0E0TReKjzltA4/Wk9ErDYDSJMM75hsT0fzVOS1bVeWb56GtD0tVlUofiX7LTVNtVulz0UtQ+V1etw91/aB65XngEk1Quzjb3SuwZVC6yedNplSJkzormD5UIumny8EfmjQOVWO8LqoaLVngDDUoGj3/Rt0/Z6P005Gn8eXZHKuvNI0pxRFjaxfN/I9oxoO0MDQJp9gflEJTraFDo939N883dlUuDEXVlQ3dIivr0JQoQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVUPR04MB12442.eurprd04.prod.outlook.com (2603:10a6:150:346::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 20:09:00 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 20:09:00 +0000
Date: Wed, 18 Nov 2026 14:08:50 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>,
	Maxime Ripard <mripard@kernel.org>,
	Jens Kuske <jenskuske@gmail.com>,
	Jean-Francois Moine <moinejf@free.fr>,
	Hongling Zeng <zenghongling@kylinos.cn>,
	Chengfeng Ye <cyeaa@connect.ust.hk>,
	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/9] dmaengine: sun6i: track paused virtual channels
Message-ID: <av4F0vWw8-eLNKH3@SMW015318>
References: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
 <20261115-submit-sun6i-dma-lifetime-next-v1-v4-7-043cd476a45f@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-7-043cd476a45f@gmail.com>
X-ClientProxiedBy: PH8PR15CA0020.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::20) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVUPR04MB12442:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c9483d4-c39b-4f7a-022d-08df45afc905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|376014|7416014|18002099003|261009223027099003|22082099003|6133799003|3023799007|261021121427099003|5023799004|11063799006|56012099006|261028144727099003|261022075727099003|4143699003|261022105027099003|261026140227099003|261026121527099003|261021123027099003|10067099003|261102123227099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	/6D/2rNB8RFQ+vexlQiXrcusb4mC/4uAvVxHpLLN6S/bb0U+ZI+lZKoqzhUyTV+w+xz9qNsk2otwQbTIPpQzrt9Gg2XyjcqoqHN3pPMsaDEvzUmp1/vLp2oRmcDzBgQzrNX4XRHrl69kzgntdg4t2++uM/+XMDs95WcGwx4y3tSlzcs2mC9BSrCqIvVgLvCTz6S3adVD0JNTgICyrYCvzbXB5pUySkR8jSLJrAffXrVLOI5M9gPXm+7jDPS/icBWI7+7Et4/HH2m2VY1tCQYY2IZDxqdVyR6Nxx4FpGECcCpKzr3eszpvcZzHu5T7LVzmS11zsXak3k7Mj6HvXUiuF3/Aptv7dVrQ6hX7zlx3pSo9gcZp/4ORN5HyrqtoTGiRmPiOIYZ/g0AuE9KqIs2URiFDJoLmau4ngMsPC4ZcqB57YNQaUd5XOEv2MJo7Q2GNL+v9ASVdZp5zmydjzbk6f5pGKWMnWQbnC44IrpJuZzpZno1+PZYDDL5NSnU3m3Jbge173pBOyN7sHuuwil5trXU03NeJGhYzgmiIVqBljaXf/oAvuUUWNeQr4o3eS/5/TnOvZuhm6nMjiaWynVKnkMIFbluZVk34iWkagK2RxPUksi+Qb4PWQ9Vx2RtXVIBaI5GuPSj6UnfjE6apkej3ZY6pPUjkDYlhBnYNO1RbNBK1jV/RRGWq1syg1Yq3mdFL2OUrvQdjVo1KlWr54gGEt7+zO0fmUxsr1+3GPrWxko=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(376014)(7416014)(18002099003)(261009223027099003)(22082099003)(6133799003)(3023799007)(261021121427099003)(5023799004)(11063799006)(56012099006)(261028144727099003)(261022075727099003)(4143699003)(261022105027099003)(261026140227099003)(261026121527099003)(261021123027099003)(10067099003)(261102123227099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hETthZ9vBRT1qrESyd4NR8dVzLljnsconAuSEEBXwuvjX0P/dZbDHneB6MDA?=
 =?us-ascii?Q?cDB72a8+Iyy4xKcqMLeB2iLE4ETQiJgxdWuP7AtKHifyEzrwC/LOQzMbzYp2?=
 =?us-ascii?Q?mEgtNUgHI1v3Zln7Icc2c7sjHt+VdXKDjfsop+QKK462fxZwvSGyQkOSO8WC?=
 =?us-ascii?Q?dar6+KepD3kZrBxOrSrNtFBVnW23F5PFw1mZemo//KgGUD8q5Hm6s3wuBpfi?=
 =?us-ascii?Q?8Nrr/0ykDuka8LvPtNfnrdjh7P65/hLx6arh0GNwVs6UFHh8YyRzGo/rt7Bi?=
 =?us-ascii?Q?W+1k7+BcfxT4UPaDUggO8+2+tafPqK/yw4Z1cRTn8CvrYAFWMcTkO6Ff1Unx?=
 =?us-ascii?Q?C/2kVGTFmtEuJ2bzzMzeFCATlXXtPX6Sf94SrbJBTYVzPK8q8CyIxDlyN0UP?=
 =?us-ascii?Q?dQcNQ/Ici5OBCbybgWBliB8YvqR60rO3SvKB4dUmwc3hF6urwEXOtOaq0jCp?=
 =?us-ascii?Q?Vi7SBYh1qdpSxE1CuaI28sZVm0y6ttRm2AUu5RNJHYvIImMkwDWRNEJc8H+X?=
 =?us-ascii?Q?qTFLwQCZJmldPegT9UcCEvPtFRRqeAT3fpL17hIkxzse7rw3BO/0AhvVnONN?=
 =?us-ascii?Q?zdW+mkrf9qhYcRePfITx/AjhxzKfbhj1hv5btKsZlOQ/shqlQSMsfndrR4Ei?=
 =?us-ascii?Q?T92MOhmmX1mxULc+tL/ltnhNwPRCnwu5a3H/K3yGbYbH9tT4YFhOkt4iUc3A?=
 =?us-ascii?Q?k8SR4VMoI2f1FV5/pqsxu7MN0i9ceuml55gNDDjApl9H/Ryo6l6jnEQYCJii?=
 =?us-ascii?Q?Lp6TRVQlH5wZEgIFd8RFNh/NadCbC39M5+OEOrx37P6xmGRVAgxKadQFRbKi?=
 =?us-ascii?Q?tVtc+RQF3DwvmQdxTD763gsyFJ2vdBb0wgkw/f12b94x3DVrP3AOp7r4Lcfc?=
 =?us-ascii?Q?8q/c7aAofnD8xxf/PewSoJ5E3CSKz8MqlNnXxWSVKpg+bZzZC+g9jkEYD0dH?=
 =?us-ascii?Q?JCS2tkS+sSPGMN0t7AjQRGrCE4Bncbw/RGadQuToNDO4WEcDQIZiNGEhDHi5?=
 =?us-ascii?Q?YduJTjg8lM1kZ0OWr1K7i9PP9dxqqhmGS3HA+wFyKL0mOzQU/3Dj+5PKsUX+?=
 =?us-ascii?Q?Fcm2auR90cYlqYMcbYd0ycvbI3TsWgLaECUhkUpS4dZoTjCp2N1cHp2Ndtra?=
 =?us-ascii?Q?E4SIq57BHOZqaJcUyfCErUT8hsXa9UYoug9pWNvXGK4Fu0poQ7ikj1sP82L/?=
 =?us-ascii?Q?qNA8wUCggfKLUvzijziX8BhDkBE+FFX95u4mrtMG64NfhfuZaXI8cQ7bDaLT?=
 =?us-ascii?Q?Tjcj+49VUHUJYGhpGygjVsRyye7QomZs6PKHxjD0HR0iZBhOYfHrClccH+/5?=
 =?us-ascii?Q?izW3T68+MiRlZoksRqvg2Weujce/zrAdbQS5tb8nDWJaKeRur9bSH/i0MsAe?=
 =?us-ascii?Q?eI2u11iAgjejzfYUDnVgJFGLf2GKCKAP7fs9eQuE2uzteUlRfXLNpjTXezyD?=
 =?us-ascii?Q?cqUDL+Xp8crZPPQrDTMeDmfUC2qjpEw4DLNMxAstIZzVlOamybV617YYv7tO?=
 =?us-ascii?Q?Sxeve77LShfL+tsDAcbg8Wrsg/UPMo0xykMOiULvYRkFzkw0u7JG1/IGj5f4?=
 =?us-ascii?Q?RWZeIZ6r5gAJN2xShegsFA8gVpU3qZtJo+bxjAN87vFdx+vq06+TNPH028y9?=
 =?us-ascii?Q?GdBng9otodQ4uVra4mv7zIzjw9u9VGXRBUCim7b/X2LioZRtoaE/CdUo3ioo?=
 =?us-ascii?Q?ZrHsXubAOfIhvBCps+qAQakFsoroPG8sE2jev9IlHpskqeoaszMure6yZnp7?=
 =?us-ascii?Q?tzCbgXnvWOGr1L5tH1qqLUgFsVsAEVOIH1V1m9nWhhQaHyGb435G?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c9483d4-c39b-4f7a-022d-08df45afc905
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 20:09:00.6181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/wo1cTQZDWNcUg3/b722bxabfgzEhURiGCUn76D5VS3JYPZfBzUlJMiOcI+E0l3VTsMtwOOZ6a5qHgZ9oNrBgbS2PNfARtPjpcw7pY8S+uzdZ3TqeV3xHDvbJDbgamr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12442

On Sun, Nov 15, 2026 at 02:32:55AM -0700, James Hilliard wrote:
> sun6i_dma_tx_status() only returns the cookie state, so a paused but
> incomplete transfer is reported as DMA_IN_PROGRESS. The 8250 RX flush
> path pauses the channel and calls its completion helper before terminating
> it. That helper ignores an in-progress transfer to avoid consuming a new
> RX operation. With sun6i it consequently drops the partial buffer and
> leaves rx_running set, preventing another receive from being submitted.
>
> Track pause state under the channel-assignment lock and report DMA_PAUSED
> for incomplete cookies, including status queries without a residue output.
> Read back the pause register before returning so a posted MMIO write
> has reached the controller when the client inspects the transfer. The
> readback flushes the request; it is not a separate hardware suspension
> acknowledgment. Completed cookies remain DMA_COMPLETE.
>
> Keep paused channels out of the pending queue and do not start a queued
> descriptor when a paused channel's previous descriptor completes. Release
> the completed physical channel so other virtual channels can use it, and
> clear its hardware pause request before reassignment. The paused virtual
> channel retains its queued descriptors until resume.
>
> Resume requeues an unassigned channel only once and schedules the
> allocator, so an idle controller does not require an unrelated completion
> to resume it. Clear the pause state when terminating the channel.
>
> Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/sun6i-dma.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index ab4474f0a8aa..14f1f463005e 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -208,6 +208,7 @@ struct sun6i_vchan {
>  	u8			port;
>  	u8			irq_type;
>  	bool			cyclic;
> +	bool			paused;
>  };
>
>  struct sun6i_dma_dev {
> @@ -539,13 +540,17 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
>  		pchan = vchan->phy;
>
>  		if (pchan && !pchan->desc) {
> -			if (sun6i_dma_start_desc(vchan)) {
> +			if (vchan->paused || sun6i_dma_start_desc(vchan)) {
>  				/*
>  				 * No current txd associated with this channel
>  				 */
>  				dev_dbg(sdev->slave.dev, "pchan %u: free\n",
>  					pchan->idx);
>
> +				/* The next owner must not inherit the pause request. */
> +				writel(DMA_CHAN_PAUSE_RESUME,
> +				       pchan->base + DMA_CHAN_PAUSE);
> +
>  				/* Mark this channel free */
>  				vchan->phy = NULL;
>  				pchan->vchan = NULL;
> @@ -937,10 +942,13 @@ static int sun6i_dma_pause(struct dma_chan *chan)
>  	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc);
>
>  	spin_lock_irqsave(&sdev->lock, flags);
> +	vchan->paused = true;
>  	pchan = vchan->phy;
>  	if (pchan) {
>  		writel(DMA_CHAN_PAUSE_PAUSE,
>  		       pchan->base + DMA_CHAN_PAUSE);
> +		/* Flush the request before clients inspect the transfer. */
> +		readl(pchan->base + DMA_CHAN_PAUSE);
>  	} else {
>  		list_del_init(&vchan->node);
>  	}
> @@ -962,12 +970,14 @@ static int sun6i_dma_resume(struct dma_chan *chan)
>  	spin_lock(&vchan->vc.lock);
>  	pchan = vchan->phy;
>
> +	vchan->paused = false;
>  	if (pchan) {
>  		writel(DMA_CHAN_PAUSE_RESUME,
>  		       pchan->base + DMA_CHAN_PAUSE);
> -	} else if (!list_empty(&vchan->vc.desc_issued)) {
> +	} else if (!list_empty(&vchan->vc.desc_issued) && list_empty(&vchan->node)) {
>  		list_add_tail(&vchan->node, &sdev->pending);
>  	}
> +	tasklet_schedule(&sdev->task);
>
>  	spin_unlock(&vchan->vc.lock);
>  	spin_unlock_irqrestore(&sdev->lock, flags);
> @@ -996,6 +1006,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
>  	}
>
>  	vchan->cyclic = false;
> +	vchan->paused = false;
>  	vchan_get_all_descriptors(&vchan->vc, &head);
>
>  	if (pchan) {
> @@ -1041,6 +1052,8 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
>  	spin_lock_irqsave(&sdev->lock, flags);
>  	spin_lock(&vchan->vc.lock);
>  	ret = dma_cookie_status(chan, cookie, state);
> +	if (ret == DMA_IN_PROGRESS && vchan->paused)
> +		ret = DMA_PAUSED;
>  	if (ret == DMA_COMPLETE || !state)
>  		goto out;
>  	pchan = vchan->phy;
> @@ -1075,7 +1088,7 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
>  	spin_lock(&vchan->vc.lock);
>
>  	if (vchan_issue_pending(&vchan->vc)) {
> -		if (!vchan->phy && list_empty(&vchan->node)) {
> +		if (!vchan->paused && !vchan->phy && list_empty(&vchan->node)) {
>  			list_add_tail(&vchan->node, &sdev->pending);
>  			tasklet_schedule(&sdev->task);
>  			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",
>
> --
> 2.53.0
>
