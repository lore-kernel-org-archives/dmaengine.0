Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792531951;
	b=Lugwmdsq2hnPR19y3Ud8EoFhUU7mqf4z3/gKn3l2CPijIBexvWVMLbLj3BcGtjtr2D/D
	 YIf9YoB0booHREEEho1+HDsJ01cIOlAHij5LNfuE9V7FKgnYOIuBNX9cJfq1nium3rBL9
	 DXa2GTJHaedBtdbTRy0Yij17p9aLqXymD3+vrMYEBoC/QWqn2vi/F7GDqke6kaCI7+wLq
	 saGaatINZxKk+45aaeNvfFAR7UqKGzE7niuPdT8QKezUX45YN+oj6r/RVLlge4Ml38zo6
	 /dHWFEQ1rr4J/ClWHe8mSVauPtGWfOQtiFPC1kBnZ1SBjA3t40ZQOW6ZVLH3BxB2JUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792531951;
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
	bh=1uFMX1oazWVnRMmcU7THiyyjjwfTkj1cQBo4YEcex5Q=;
	b=sqMBVKLdb6eFfeTNOZF/8/brKniuje7/wFTbcImnXkTzTflkip5NiK1DwZGAXa67Oz3o
	 tjhXpKFSILJQqeOd1+BdmmYeSgRcwOa2APB/VbTBxiIAAK7MJBdj/uUGv5WtdMK7wbw3T
	 b5k+7N77O2bd5BR0l+CHPTP7EYORjcLmaKbCanrcGQ5e1CluIV7YF6Q6wKxQfdmvKC1rW
	 vxMPgRIVW9eYniWaEs5fsA6sZfKQGInXQ1RVG7BlI/3q9eJ0CVDHY4Vt2MnwJl6qUKgO9
	 RTX5H0UEpi5wD7Q2Ybr+mZUx0srpmvSQOn0MIh/6brY+8mHU3zimBonvQSBcICf9lLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=nBmH06AE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.29
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010029.outbound.protection.outlook.com [52.101.84.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28816606A319;
	Tue, 20 Oct 2026 21:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28816606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=nBmH06AE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fjz5H5Q+iwp22b7C//4/y6DHjB+tF2Y7BYNdyRZo3CcudSCA236B76BNrbrVsxEWfI5V+dVsj/ZwxFOn74L5TGKf7QiXIdy2RPix8ts73bGx1PecHp0LRTzUhAJ+GsSsol1SiFA5N+Vl42FU5ESdbO1OPyRsjjx/zq8usnhMBVX10101DuEjS9rHWYdM1mucWrd9qRFZasQLUt/b6iaSLM8pUues3SmejUWqLbSTRDVO+UzyMS6UhHaJZGbJEbYk8BM7I4fsRF5RyYsbPnSJ12m68rFW281mVi6bxJ0TcFLyN2y7tvEQ9olFUW5hjFD473yfjCSU5V07VwkzYH59Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1uFMX1oazWVnRMmcU7THiyyjjwfTkj1cQBo4YEcex5Q=;
 b=veZFHsDnqkGGyPdmxxuXQVXWaO3A7gW2mrz4rxF2/mQK0zo4w4pAgMnh29UZf8ZF970qqf4mSjKaCyivqxtBuAVwdSg/cn721kxT/raKFKYttSdgLCnIMGpFHCg1QnrTeNbeHDQieUSzp2f70i3255Nm7/vqQEOLj40Jh7b2QpgQTK1qNOf7qdhUs7bPzW924pw33Cx2BLBfXaFrdKLg6ARNRuw7Ig/SWPyWN+PTRGW17tiEJlbJva9dx6pRRLh/C1/mqUkeqjuMigzeai+MLmJZV4ay+J80JVX8w+NDATT0KECEqWAJH2gHibfbwUWVq/ylcbmGJJ7sUVf/h3uyKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1uFMX1oazWVnRMmcU7THiyyjjwfTkj1cQBo4YEcex5Q=;
 b=nBmH06AE6jHnPMARbBKqEn+rDyPxtv0UoBn3qYBo63cF/w4zbxSsTFIFoU5cv628l3ZpTpPb9R1pMo8IPHiovvdMmEO8O3y6riiwuNEygdbwBt33DaFR7eFFfhwvDPRwYJFh8lF7hWXpXpPz4bGtUHK9vnBfmFnT6N+ppnUuV/x1bQiboS7USEoi/CgOgVN2vC37H5x5KX/NuGC7X9F0KqkEb1KtqtiMDSZeP2UUFO862cz8/OqSejfS/JYrjhg2DutITY0/+yHRvDIp0oeV4P/Syu3ASXiCQQvnJ6bjnw0P0En6lkFMjzeGSkbEWS2Xn3ZqgRtC13gioLXJ574mDw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PR3PR04MB7210.eurprd04.prod.outlook.com (2603:10a6:102:8f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 21:32:28 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 21:32:28 +0000
Date: Tue, 20 Oct 2026 17:32:21 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Stefan Roese <sr@denx.de>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] dmaengine: mv_xor: protect MBUS window access with a
 spinlock
Message-ID: <atfd5TfQKFlJLSqv@lizhi-Precision-Tower-5810>
References: <20260917232702.127923-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917232702.127923-1-rosenp@gmail.com>
X-ClientProxiedBy: PH0PR07CA0046.namprd07.prod.outlook.com
 (2603:10b6:510:e::21) To AMBPR04MB12445.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PR3PR04MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d241a0-cb04-4579-229c-08df2ef1a385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|10067099003|22082099003|18002099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	8ICwy3KI2yOF0w+VzB9cKA6+64L0M98P+tcDbTYNVby6yuQMLL8co2nA/+hveFjfv+RBWzIbcELE7ZlQDAfMCOmsgS+Xc6+JDcpLPHkc57lXMOl8766IrWL8sATEzMSbxuxnEQsmW+rp21dhjRE3EosMMwFia+QxODv6PEj9CWi0gM9cr1e4dcdtjsVYTSlxZGORWK4/kmz1/X91w6sbVMFT3wKqxXEY5V2P8WMWVtEcIjexcrpiK5w6qT0KC5UtVagpbDh5LPPySPuWVv0XH/DY/Rya4eMtk+J7G9vaDbz2ow2QuLvHBPs5Zl83vWGdfDriR8FCdgSWdrGDYOABZYsii06Cnu31N/Dr3zF9A7kJOn89Pwi2yIpvsKwrwoZl/ifKPZWc4gyo2bm41wyWvg1GJp1+MIjOI0oRRbGRTNRSWKWj4oc7VZ2sRzbepSbyIIo5vSAGkhl8q+Dsz3hRjZzD3ozktp+SOGPsQHkJZZXh7mTE9FSvfpcw9RlpiH4z3NW8Y8VGgEg9yCc1xW9vwZeN70FxlmpamTbNr125raobc9C73VpqBR3jNdGkpYVAmiP0dagAn5GYzllsmEMJfXwDTEmF3LdmkNo6vssZVESTQw8tow6j/Hr0rF/hgdmw51i/cJiSENv6sMq9qCwYAUCRBBZkphcmY7ceRoPWhH4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(10067099003)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YnTDrbg2clIi0+WqXzlNPrRf4G8cX58mBeXqrGmtg9pwwtHPWPgw52+cjgGD?=
 =?us-ascii?Q?MW4JcOji/IfjdymstlZJY5hOkHBlpwKgtCPhvd7qE/UMJNzMvjNH7L7l7LHQ?=
 =?us-ascii?Q?jQo1XD5GQAEGRmvMH3ug98nrVs932S5NdWxgscQMl98DofatWjeM37kSr8Mt?=
 =?us-ascii?Q?lB4nWvkUV2JuleWJrjwTEN8Y8ATVf6SZ6H7ImmvVULtwg0h95WILc0//GFpo?=
 =?us-ascii?Q?4L1exNCeeE9nczYlavd+5wDgEPJx/Xe5/M9WLIqKYaHyMJJ44Qgw5Js7o056?=
 =?us-ascii?Q?AS7jXxi+O8eSQy8tqMYCkuN+fBwlTMnaQzUL5zNV1eueQasSiFHMONXw27ph?=
 =?us-ascii?Q?XUK/2a0Ajqs35tvWRyLcNKW/6UuUwaSmoMFtqd7ajuMx4COiyQcNSSelRANG?=
 =?us-ascii?Q?YRVJ7V6/HSCF9yR6ahsewStT1HIh+gud5eWC9Ui/ulwnKgYnoLF52znp1Q3r?=
 =?us-ascii?Q?NU5Bc3ltWmzLIGTH+BKsoS+PltNS91Z2NnPigqb/ng471RRpgmoBJUi36Bqy?=
 =?us-ascii?Q?9keiRuYRgL9Pp50XXjtvNphdFqrrTNOyY4N+BtBd5TM6aYrxUtuq0ooy5qiq?=
 =?us-ascii?Q?u4laF/MBFotMa+pd2g0wOH2+0dJzl4ZPUoDbe+bSYn4+Q28ZtOuR79sOybQj?=
 =?us-ascii?Q?4SIUIlMALf0H5ZsS7rlxiZ5u+mgcfQ+Ye7TfngYUrO46LbzmvgMuZy+KTfHm?=
 =?us-ascii?Q?9c49ETqATELYdnKFknaTU7HiRypSPKrxtSdaGpRkguiV66NILq3zJGCGzBeq?=
 =?us-ascii?Q?zWyNZHjtjQDLRI/kzVsJCMJG+KbRbIqqA5FSZ/OqN/8wlsXkqeYYDInqoNp9?=
 =?us-ascii?Q?E3nT+SEzfoqKzQy7b/co2J/ztKAvkyNyc5s4jqz6ZSWxNKwuGSRaqd5jwGgU?=
 =?us-ascii?Q?4GrQ8cgbYDVF2lkWto9oufV6dQ8m+Ho95vcYRo5M5AZKJbzE7Dw6GQsXzGZG?=
 =?us-ascii?Q?JSL92P1Z15s3A5pUTVb0KCmQLvXRZx+I5G/HPInknXbrQU8T1LOkgCvDi6zH?=
 =?us-ascii?Q?1kIEP1nOkPMO7cWetsk1lOMLRG1DGtUPDCgUmVwPURk2peF9kknPraC3NOFY?=
 =?us-ascii?Q?YO4FtCWp0+ewntU8zDSGhciv8HHCsqrkMencqiR2j2/QAOfX9sWxxUBA33KN?=
 =?us-ascii?Q?BrBK0XIYEHlsG7kJ755/Rockm0UQt7SXGsoJA9KqaBWSlZ/XEHjU8Gc+hkE7?=
 =?us-ascii?Q?d64Vqfcqwb0x3nr6KNpbIap5g+ewh8m7KFT4hC1Z4C1Nk7ZDEDO5TBLRIwvW?=
 =?us-ascii?Q?sDJ+fJoRNQVD7Ss9iRnUQvTvzGv1jdO9oWVpCoaBMYN9966dBfNxi8RThsnU?=
 =?us-ascii?Q?6mO2aOBw5WijH/cAlf5SIzMHOLNtvolfuTTktz1I+vkzsk3fEI4ZpLdR3unq?=
 =?us-ascii?Q?fuMgxXm0A82agRGlkXJRRtvCz85Tw8EJUT28fpfFrrc9ZabW8YCttZczB5Th?=
 =?us-ascii?Q?fBu0Yy3hURa55v6VOve5gpR6Oa2ddkbUubfpudQI9cKOXg1DRtetI5Rr5qdm?=
 =?us-ascii?Q?/NuxAmxOzNuTRw3IWgPhZ6CUFtO11+ChTAcBL/8TVVIVVmZTlGcu/KGi6iiG?=
 =?us-ascii?Q?bVKunq2vP3paBYmnf9Zvk5zVKuY5NwMBvie94SHezTs0SeG/4MxptRv3gaY2?=
 =?us-ascii?Q?LYvwX95qu7KpBY4+OS4P3ssABA45FxugTUn4/CkncF0szQlvEAasTAl7PGLV?=
 =?us-ascii?Q?gw02yilWeBRB+6RVHgeE7nd8xgvxTlqjC2xsR2by4RnTISX5nVlDEmWBGp32?=
 =?us-ascii?Q?pSArDlemWeHIyjbZOjIY/hiabZhxLRdVusjJO5q8kvQj2MM251Gm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d241a0-cb04-4579-229c-08df2ef1a385
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12445.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 21:32:28.0645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkXbI69mZCc+tmoF8SKPVCKNB4TtpvWqnWYbXYYtq2iLi0i1pHqs5YMQYAtY/dqnIb1MCIvbExlyvuBEH1Ad2eXvrENCzZRQLz9dO25K5vsWT1trU/oGoDmTsIxiTGyU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7210

On Thu, Sep 17, 2026 at 04:27:02PM -0700, Rosen Penev wrote:
> mv_xor_add_io_win() reads and writes shared MBUS window registers
> and updates the shared win_start/win_end arrays in mv_xor_device.
> Multiple DMA channels can call this function concurrently via
> mv_xor_prep_dma_xor(), leading to races where two threads can
> select the same free window slot, corrupt the registers, or produce
> inconsistent cached state.
>
> Add a spinlock to struct mv_xor_device and hold it across the
> register read-modify-write and cache update in mv_xor_add_io_win().
>
> Fixes: 77ff7a706f01 ("mv_xor: Add support for IO (PCIe) src/dst areas")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: use guard()
>  drivers/dma/mv_xor.c | 3 +++
>  drivers/dma/mv_xor.h | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> index c4e0dce3ca64..da8eea8789ae 100644
> --- a/drivers/dma/mv_xor.c
> +++ b/drivers/dma/mv_xor.c
> @@ -494,6 +494,8 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv_chan, u32 addr)
>  	if (xordev->xor_type == XOR_ARMADA_37XX)
>  		return 0;
>
> +	guard(spinlock_irqsave)(&xordev->win_lock);
> +
>  	/*
>  	 * Loop over the cached windows to check, if the requested area
>  	 * is already mapped. If this the case, nothing needs to be done
> @@ -1345,6 +1347,7 @@ static int mv_xor_probe(struct platform_device *pdev)
>
>  	platform_set_drvdata(pdev, xordev);
>
> +	spin_lock_init(&xordev->win_lock);
>
>  	/*
>  	 * We need to know which type of XOR device we use before
> diff --git a/drivers/dma/mv_xor.h b/drivers/dma/mv_xor.h
> index c87cefd38a07..034db4d0bfb1 100644
> --- a/drivers/dma/mv_xor.h
> +++ b/drivers/dma/mv_xor.h
> @@ -80,6 +80,7 @@ struct mv_xor_device {
>  	struct clk	     *clk;
>  	struct mv_xor_chan   *channels[MV_XOR_MAX_CHANNELS];
>  	int		     xor_type;
> +	spinlock_t	     win_lock;

check patch require all lock have comments for it.

Frank

>
>  	u32                  win_start[WINDOW_COUNT];
>  	u32                  win_end[WINDOW_COUNT];
> --
> 2.55.0
>
