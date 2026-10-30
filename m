Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793376075;
	b=L+3IMW0H3j9ZDiAwsp3x2hFZKGlvDRkPvvuoDDO9cOI14tLp3mNRHR4WPnCTuA7k89BD
	 H5bpjjpNul80slOmlwD2LS3sdKYlFl88QDNY5lVhfSOAbKwZqDFuhlqLLPm6tCHKon1bG
	 CmhskHKNXpB01d9mFLJKLy/9/SjA4XsmvaTKAtXXRI+tytZRtz3tn2NRRIOPQW6/KTfSS
	 IPm9/AdErULMjkYVb9YyEwUkpMsdDY58flEctcMNEmyKUgP2OV6IGKgPFDljRgGhE+WsC
	 1u2nr9zbaNcPBNN3VCPOJQ5hbf27xKZgE80P1XcMdRM/CEGYb/NeRU7NC9nNdDMzQVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793376075;
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
	bh=OJCENJzW/bBXYLvzrsTgkm5MhsQXeAEIrE5rKIN1Uro=;
	b=bNClchFJTe8+gXN2o0c2mDf6kexZUovI+PF1CDM5wV2woReKOhfCiRSG2qMSZ8d8zsRt
	 bVgeBU3iEGC9MLOGFgtiTPq+rl93n2SWWEfFjvaeppY96TqSwb1cAuJd0+k+4b4k7Pnx4
	 w74IRPcQ57XaniIHn43gHcWGC5TMHrpMIzxUSBZuGuSQOkjBmbVoK/NBdzVQ07g1+F+6o
	 2x0aDpo3cIBGlbX/lRlzS04rLjQ+pV/BHPTRaT80Bq5BYfzgrB6QAQnC+t3B8PfDzQGkU
	 lPbDJInFGTBXoK94yDsAziO8WHV+AXJq+og2nnTLrc97HrzBrdIFsdES6DZRYD5NWsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dQ7LQTSr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.18
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013018.outbound.protection.outlook.com [40.107.162.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66203606A31A;
	Fri, 30 Oct 2026 16:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66203606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dQ7LQTSr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D6sLoZupINlJXp4RwtPiWBaqbGVIRuRt4DEXPbPB92AZ+gaUtHB60S07Inu1qSqT6dtRgjDbGK0IAikOVrjEh5vmppUC47H5O+UGmOKThl4RhGBgrGuiIwavEWXrkX6j8k52J8olwcdxQostFlSrfiroc5fondQ4hApUPOn+9FDJVOleIRZbGPQ767iGIOOdVBVJTYgTvOYIRp3GgiWxS8mT2HeLUz2e7xgubtOLGSilNfNTNPgKKlNKE5ENtxAatGzfsBPk+9yr6FAHvI5SuyCkN4oKl7J5X4GxOwlIh4Zwncku1oOTLiZiweuGSYwhZjEGKYnAoGqpqie1N6Z0gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJCENJzW/bBXYLvzrsTgkm5MhsQXeAEIrE5rKIN1Uro=;
 b=P3Lg+2btdueF5/T4Ys/VG9W0mWWPXFkeo684lrZP1KEa6S36A6nlNBftL7X5OnalL8qggNsJbZE/1m5rQKvx9TZO/JNbJx6eUewot+f9usjEFHmXgxoNHS0c7cF8NioRD6oJqoY2W1RY1WVhfjn6ZZ/gIoDWzY8TREbWE4f62yGWkG6JY2YoFMSDERjlB6qrWxJx3PCE3CexAJKF5dxa0QYaClUEj3cXmPZX6zbCajqX94Ywpi+XirMirD23dexTGlBwzy2y/6ZJSCLZUqsZODX5+rpz9ZiID6E1+DdCf290gVpG4RC5JVh00k1jOLE/3RxMLCd5tDWURdUlXRzKVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJCENJzW/bBXYLvzrsTgkm5MhsQXeAEIrE5rKIN1Uro=;
 b=dQ7LQTSr4+q3E/Phun7MjaEff2JU2A0BbhxA0iQUGEbnxopm361jhSt5KIPOokAT/KHX9b89+hj5gXy5a0QFR6/Mxzn3PBD+Eq/YItK8nxPm8NmtqLbcllaYbG8UvKgCpUvCOrDhjTX32V/bEZtoak+xIXqmnZs26Z1s4SoJciCosu9g/GKWDU2ZvhJfy+cph63eTxyKkktf81S9nbKQpCH0CVHGRliR+vJ87JSlTscAdUvK4/5ag0fNNn7qW3eATkTWl5zlEosZBTyKd+HAyxYsQK3kBwfM94So7bhsXJ7t3Lp+3TlS2fiEaINbtZg9iXgpUHUSylMXd0a/uf29oA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by BR0PR04MB385734.eurprd04.prod.outlook.com
 (2603:10a6:2c8:61::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 16:01:12 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 16:01:11 +0000
Date: Fri, 30 Oct 2026 11:01:02 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Joshua Crofts <crofts@kernel.org>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/3] dmaengine: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <auS_PrwhMwhc5BNk@SMW015318>
References: <20261030145901.1393-1-crofts@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030145901.1393-1-crofts@kernel.org>
X-ClientProxiedBy: DM6PR07CA0100.namprd07.prod.outlook.com
 (2603:10b6:5:337::33) To AMBPR04MB12445.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|BR0PR04MB385734:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ff3483d-8a3c-43b6-3654-08df369f04c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|1800799024|18002099003|22082099003|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261022075727099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261009223027099003|261009221227099003;
X-Microsoft-Antispam-Message-Info:
	3KISJCyzKO5+H/m4a+nFK6CmQVZWph0V+Id2SqVNTSeTquIjIL/cbu+Z6HjljpVn4ETE5KqbzJ1rriDjuyk9V/jUZNGatI4dpyc/o1tDa7cx49atoKR2t1Pu7DIYs/mq7AJgoUEHsQGZoxz8mFyeqWQW/1h/Me/YfEwgYL/HjMVdTBqpgmzp8sMoqREIr7ye1zqysBpcwqCnYUHdY+z3X3lx0gGb664ojCm+Qewb6V9q35yY/YuCxBBu3/h6XL5BxPITsNu+uq+IzZl697gs6d4EnNhkT8s5uJIV8keILNDs+O5NdD2MUQxVFI4I4OzZjK0JINtY11W789L4LURhqp8WsRZMeQZZKS4v9xuEoyrq8CR11V/rcB2qu2B+n9JRZNRl5P2rQF6tcAB+Tb47G0WLcaRep7yxJeACC5aMbhP6ShyWKvPuiV6/nxq+g36cjTe9QwI2rWUfANGNkQ/ae6evcJSyWw7p7rUNL8JfEV0Nq5ByrBp+QNPyuFi5XocAhVx3LMohqcq1ST8IcNm+2ADhsHLZYY9N/qQduD/Y7qpkJO5uuNX438l850oJ77G1MDqtQ3ApM41bDwjcNnTm1WBALMucA+NycmnwKH7OGtXsXE1iYhxN2omvJ/Fu137fnMTJDE5tC88JqtGEbV3E3h2hZr88z2NZbgPp0jCaGVI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(1800799024)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261009223027099003)(261009221227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?isMU4RI2ryY0g0l2zDFiby2AOd1fD+f6WfhCps61lqwQoUmFpB86B4VONLD2?=
 =?us-ascii?Q?85vbqJr0Zn1lL7JHVsY95rYdQ2Pay01D5D/w8Qo7NczTnoL4r1yMdQNlXk/f?=
 =?us-ascii?Q?CCLMfmF4kk6VO9kEhzEjjpXfsqgO5O1j5k9bYSJ89DfyyqMKppATqSKtGnJE?=
 =?us-ascii?Q?lbtt5Qmp5bGnKYNsakdFAk/luMxus+F4/0/qyqWalcylJ7VkYqN1AOq0gQwA?=
 =?us-ascii?Q?+fpf8brp1zdXi0Mkn7PcPFy4xIhsAyRqoxQRNfGehQM0byH+PEZ4fazDucGj?=
 =?us-ascii?Q?gkdEbLTPXrtDK8UheU291DOAGKZpptYU3iBgX42de1t5RESfIvKhRD2LXp3y?=
 =?us-ascii?Q?Fc15LCYfGJ9BScg7f4GE0KZmsJaHDuASsJuiX2bQid2MV62Lmmetg6YMqKc7?=
 =?us-ascii?Q?wzNFBwhJunMDpzmD6UCFHdQy6f7lyTs2ZdnKlZXv9EXudjqVWgoZqYDFsR6L?=
 =?us-ascii?Q?+JLrp4BR7BJub7UFcgOgOCZEYFHcTLcdlQm9iikKGSI0GaiNacpcvlvZBbj7?=
 =?us-ascii?Q?JjuVGVElgX8WKrXnxl6kQCpnSZDkCuuv/Btkowo39g8IOntL7BlY0jTnp4KN?=
 =?us-ascii?Q?HUcGPZXvOwH8gFO2ZJ5q6cpzEYnfsmezRIUGp7CmTiEDxoLFu8ySoHbcrA2m?=
 =?us-ascii?Q?4n4gh9+6YBJtTjAX8RiMR4qwxey1roljjc73AUWrK8S1VxrfbuO1dMTlCwlI?=
 =?us-ascii?Q?gSGqqBz488ESLuYaV3ImbwMb3bZ73lzF+5MP3d0YybLaTSeXdxBhcSpN9sg9?=
 =?us-ascii?Q?LjjTJEqOkLoRfRn2zu6dzaKv24UBmeRJtpZQnhtAyjUfBLlssujRTnQ+M1US?=
 =?us-ascii?Q?JPUJETiwcipOynVfgqkF3cme8meMt+RV5SMcDG+3n6ceBoJZ9F2nniBPdV3I?=
 =?us-ascii?Q?oRP3xcuzRV4uF5ZDUfSHxUIsmAdd2ebzBUUZNgrzxim8u/52EKv1WB7S4bTs?=
 =?us-ascii?Q?0UdHJz4hZCzUwx11wd+UD/ZvjvmWr/K4EYEHMJDEUFvWcYYrrYeiIuVE4Qwv?=
 =?us-ascii?Q?QuiD74PwkI4zyx+C+upa7G3HkpN+wb3kjHR9+/MYeqO/JMoapjJh/2Ri2hr8?=
 =?us-ascii?Q?EKkYJxH986pTw+ZBsijTijIsoFWOPOSW+G7vn/YGwFm+xg/uw7NucTCvV1fS?=
 =?us-ascii?Q?lTtjtfZhFmJ5vfAEGsRGx+lk0wJCu7PJFRx6yoszYeYUIS1GBjipABBEwdF+?=
 =?us-ascii?Q?Zlw5pvjCpKLHuECkZwOjKzX8jhb8/oof2q/xifsoepiHX3vSBOLieIXWvZIK?=
 =?us-ascii?Q?vxv1YgHzvv8G/tHoy7qvdbErJfXTNQetAITvRZljcohUuaV1DW1zlFjlcSPA?=
 =?us-ascii?Q?4cjRpR9YfPHNadoIS2WmMhy+TlUiaSwuor4EClF6ro/3sAyiFwEiX+np3rGN?=
 =?us-ascii?Q?E05RRl++Zi78ZYAu2ApdLIo6V596OOjXh8nQZ7uVZzwoRPqbfNpx5K2MD4LX?=
 =?us-ascii?Q?cCjwp9z3kZDF/NbQy7D1VmIw7IourgZxvEPqox175xyiowcJwnX2T5lNXuz9?=
 =?us-ascii?Q?zkp178hM8ltQixIugmYnByOhfF4phbvMlw0oMsKKUGGR5wUq2RTilGsRY+3R?=
 =?us-ascii?Q?TfppsAMtwX664NhQ/vlFFgJpqxUHyIRkhN5sDPeo4t5i3jjxnG8EQwrb0wnS?=
 =?us-ascii?Q?L+aG3QdlwE3zr8orlLcvpOOzAv194+1kXx4TNvj6YcMWYyOwQL9kDAETwm4V?=
 =?us-ascii?Q?UaRklVDHmSgwd5bquAuGRCylGdc1tR5QEGFgk17PLmoxUSiAi83UlJQgkC05?=
 =?us-ascii?Q?A0Rfne61qr/ib6qOVyRdr1EPA+MDd7xd1t2jkQGz2M0ryobEya5/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff3483d-8a3c-43b6-3654-08df369f04c1
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12445.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 16:01:11.9663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/8anWG9iJPKTsERFkVRylZkhd4Hiz/m5nxkaRRxNqplWnwTgZTUkxl1ShZFodBo87F8Dei6Yz9PR81j3xlrXfiKJRx3kZVVsYaefVwrghlvKJV/a6Bz+DQhNL+p1j2H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB385734

On Fri, Oct 30, 2026 at 02:58:58PM +0000, Joshua Crofts wrote:
> [You don't often get email from crofts@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
>
> Remove the redundant function calls.
>
> Joshua Crofts (3):
>   dmaengine: at_xdmac: remove redundant
>     pm_runtime_dont_use_autosuspend() calls
>   dmaengine: qcom: remove redundant pm_runtime_dont_use_autosuspend()
>     calls
>   dmaengine: ti: remove redundant pm_runtime_dont_use_autosuspend()
>     calls

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>  drivers/dma/at_xdmac.c     | 2 --
>  drivers/dma/qcom/bam_dma.c | 1 -
>  drivers/dma/ti/cppi41.c    | 5 +----
>  3 files changed, 1 insertion(+), 7 deletions(-)
>
>
> base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
> --
> 2.47.3
>
