Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794863836;
	b=WGvilPAVVaYC9rxaL0dGdL/nU+xP/7lpTp7Xf3GTSVs823Tjkrns2Uln0IF9Mn9vlEUL
	 l4qLbGCTIrd0bEBhyR++mNIGVYRz8ian/ZWNbRJj/EYBB/mmhM3RvFYqIf/bucXRAmoY0
	 hfUwa5+lwPYbQzQptkgJbq8lYHAhi3sc4P7Ayag5JEeWcVuChoS6skkNwKoYx83bcr5iP
	 eZm6dRFQJuP68up8/I77pDDY6gJm6wyVQYApVdmzq73WkVMBWVf8WbvuPPF78EXf2N3jn
	 pvQxKDp72I9Zs1uEa5Uh8+Rmd+EEHFpsctBecG66uTO0dKAiZr2B/qxnfnq/tte5cDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863836;
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
	bh=mfO8DiaRh3wenQzubOKYPF7iEI2cDcx8TThqI7BcLnw=;
	b=q+6qod/8E0S1HzP+S0SrV5uGJHCnGFrNTEUQx+vpIKIhge0xjIwTIpR8qp0jDQOBBmWr
	 K5gTtNWTB50/5JW8/VyM+pNoQ4qrChmDf5Hmqju0qu3J35UZ4JiT3tFOP0cDERIlOFhrn
	 fR3Z2FZREkNbRYNQbRrgsNYZhhOnvSP3G5U7thJQvwT72mShGUZ3kH1JqELJNN2LcUtd0
	 EWdk6HDm6rK2By16eHA/ML0plZYMjMPRJOPYy7VH49J1EXCK/uvL6rqbmK4w/0Zus8GxO
	 d57CU74ApobEa3FfdxNkuLzvo5+6MxfZxeOxxSUyBMSTREHwTd/LE7qorOob3/0H6Sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=laDJe1EW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.40
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013040.outbound.protection.outlook.com [40.107.162.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18133606A31C;
	Mon, 16 Nov 2026 21:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18133606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=laDJe1EW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtOyVLss0x2CLkd/sdkLpOVkmIgd+gtgXIv3emYpy41q66JZ3njRKSuiwr2G/Gg0zJbi6B5Soer1szsDUV2tqpTWdr3RTi+KDQ4lPwkT7E8VZhDFqB1Qfm0WqmAQchxRUhZwInAPlNElygt9ai5OnEf2aXkv8HTczYN8izhysn0has0Zm/2FAUfN9lhIErCy1iVANnbsL+ZxIYtH2nH3EikLAbIgSVJVknPC9/PvNROaBazalX+5Acfuy20ZteOGuLnVAmTGOjVzAS3ek+odkOsGQxfTxEgpcR0u1vmWbvpQYwe+Thuocw+xcKiYUMquMIOJXoif6s7XCdjszIwDiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfO8DiaRh3wenQzubOKYPF7iEI2cDcx8TThqI7BcLnw=;
 b=by/STV5egJ+ejV6wqSSI2Zs5Ju4AZKClt7wVgIngL7XBGZLfjzTqfzRGhNO3uxgz8i8zh8M+6Z2eM72UP2cpvjkhbE5kZ0pAi52XErUJvslDq+0rAi/RabdLtHBLuGrthWNhdjwZ8ws3YhSYNU+PgwjSpZEiWMC4DEOl/kRKEF3b+bqeWJzSKjobVXpu3ArGoz/cFPI5izb9WdMvIBX06muBxR8n3TZ86lIdfl3VQzOGjmW83mfNjUP+vjvyWwpQFu5wU1w4zPgkranxmjdJqCsqknhgCCdJU3nxcoOKvTj7v49+fUAfamdJG8J+meXSIZ0J/wa4U4d9YcMjgUALXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mfO8DiaRh3wenQzubOKYPF7iEI2cDcx8TThqI7BcLnw=;
 b=laDJe1EWtoSxLcNrDXviUDpgTrZ+9Tzw4i4mbNXQ3r2QwUn6Iunt5F6Z89yZvipwr+yWpySx8li+sXtthSTsLzBMb9m01PUnwLknkquGbAv0DR2P7b4kJRdZqeM9up9tYSB3IpAHynKiVguRwSaExP78lCEYM8+sxalP+OGUctEMW7AAhqB1mP/+9TtLEhkyYGRJXqoJKhnIJw27WN8+eg6t1RwIr5CMQMLePJYY007PJ1FQTsjIpr5M6qlpW+QfW8I5dNTEdscprxDLJqscFV2aAHeV43jR0OMSe5LrCjEFTe1y3GtVCTEuH73Md0cW1ERxK8InPtNpL8yztgDvow==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by BR2PPFA055FEBBE.eurprd04.prod.outlook.com (2603:10a6:2d0::cf) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 21:17:13 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 21:17:13 +0000
Date: Mon, 16 Nov 2026 15:17:03 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: amelie.delaunay@foss.st.com, vkoul@kernel.org,
	dmaengine@vger.kernel.org, Frank.Li@kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ae878000@gmail.com
Subject: Re: [PATCH v2 1/2] dmaengine: stm32-dma3: unregister the OF DMA
 provider on removal
Message-ID: <avtyzyLz4Ak_RsLW@SMW015318>
References: <CAGEsz8ENCW++SA9cdh5=2EVmto=2-2axzTwuNhaKv+xW02Vvtg@mail.gmail.com>
 <CAGEsz8Gj01qFUzbEqymn8oPM6puJkaJoD6QLGabFnG9kzMYF=g@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGEsz8Gj01qFUzbEqymn8oPM6puJkaJoD6QLGabFnG9kzMYF=g@mail.gmail.com>
X-ClientProxiedBy: PH7PR17CA0014.namprd17.prod.outlook.com
 (2603:10b6:510:324::29) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|BR2PPFA055FEBBE:EE_
X-MS-Office365-Filtering-Correlation-Id: 8796cabb-776f-4cac-e52d-08df4426fbf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|19092799006|10067099003|4143699003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5ZeIYJh87seGmWwAHQR9LhobyKneNqwHRY2K5LeQI6qzS4fi5xoqT/oKNd9bvU8WRTIrnIkMurDvY6T9fABVIUiWOJZDsPmwOxQuQBRp+qfvFNiTZoFnCxdtSi7amQ2L5SWq7tzY1hb/7q9m988XcrM0V7zJ2K5G8zjdHKsyXwVp49XWn9DSWrxM36nHN+RiLs18yTJgUbwBBZeFBxGETTKDVcE8Rtk/6oiDqcv2iPPf7HEvv3QBw68isgN144EaBfnY3+unCOu4OaQwFHBFmdkmdHhSuRpNBcZTZLg5XR7oMFakyF0tE8e+465/uPV94Dqzr+L0m5BomdMaI1Lcwk0bJTEdEe1RAfOqujM5oeDi9bMou03ZYIDSoMA1RDPnDNwraG7MeuZu08yj9BDp88tlJN2QXarCCKXR8/l78RqshSunyKsRgGKgRzj2g0QB0X2crJnEpLyn5fMGIoMfHwdtJoYT6ZWxKSjmPuIfZRnuHTzqqKvdOguLk0sPexBop60supmyTkq6qBf4CPV2JJuevxwm8rxjKdiXESmeergiIzFWlMw28QSkr6q+mgCabnyXo1GubXMejrqMPxqWbBh7DCts8UTixpnbofyjI6lvspMo6AmIKN7rQ7ufW3ES+U3bHvaK5ba3i5TBmdMRF0kj8C8zuyAP+Oa8C32k0hE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(19092799006)(10067099003)(4143699003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b/x24GYTGxottglLfwNwRkiFmvt7Lo1Tb8n2wX2GSueYLseEHBt5/98fGVjo?=
 =?us-ascii?Q?j9fNvoFIByWnpQPqWwrLrFfgaRLFLEUIjO34cAzCB53+1cmrFSzdaI4YRUz4?=
 =?us-ascii?Q?IAjIAvQRL1Chu9c3d/ZbwJkWMrYYywKQ6VZxeBVr9UlU3JoY1eW9XNm0kMz7?=
 =?us-ascii?Q?ccvDWFwLUeoIHR8JW1Q/eLcfWmWM9snckqcGa7BYKc/hPdlhq5cPHw54EmUw?=
 =?us-ascii?Q?FLewe3zxaEgbsj7wVF5y+ckYJWJF372b+xThVBDtOYYGiP6kloovNwzKjUiN?=
 =?us-ascii?Q?/iDbsbLZa3qUPl0AM3Zh+Mgp+wqyga+NLv+hXEqc8ZN0ydihOuRpe+3EcDVs?=
 =?us-ascii?Q?n9HNyB0IcsU70+mPT88J9ACT9B+Z3Bpp3xiwvV6qvqq6fgJkoZsgKOgO4Qnu?=
 =?us-ascii?Q?o5Ncw0Qc1BRWzdA69YMt2SfplylnGoc7v5TQYfcInIkAYwEVPYh4CjleGT2n?=
 =?us-ascii?Q?E8p9zdQSZFwb7cGL3SbgCqhlJh59/Hw39kUm8ZLl67balkTYY5dUVyNi1SbL?=
 =?us-ascii?Q?4kp4aK6HBQjUgWMDW44Ao8LsfsR/+718kY0HdljceP8DDaXva0WD53kqbN0m?=
 =?us-ascii?Q?47F+/ni9IrsOPy+qFyULWEpUaus4WZbLYA/C9NqcHJ5l7Przp8FZOwKtpc4z?=
 =?us-ascii?Q?qqDlnVyp924RZ9PVO9a1PXoSJ1UXCgPo3CnOKY/8+SlDK4ek6H79gOkcTwg3?=
 =?us-ascii?Q?YtPvqkC4KAfO0doqdE0kBsvH2/wGGisPyQ+Rcx69uOipP2pZBrjo+Fl/wCfz?=
 =?us-ascii?Q?5S4XKcZXMwNSGG6eJSBlBXPZCTRnUnwx4FSqpFsaFxBNJyukf2Yfn2EvHnPP?=
 =?us-ascii?Q?ZQGjpCDwfSqWirnhaFHzYx6Jr/f0Z1FJZSVov3QSvX6ep3X+aN9cZU87dl89?=
 =?us-ascii?Q?EY/UdNpvP8eJUI8ZMwSumyFqMwRMw4n6+hetmV+mhzy+i3cCmRTJl9RzJpHB?=
 =?us-ascii?Q?T+8shkqZ8yGnPNLi1dk5FBqukl4A2xrWcL1JHRhnklBtfNbL9NQAewUtb2pR?=
 =?us-ascii?Q?E48chwFD4k56cy/paDtTJ1nyd/m8KlIZ+tnCJFBZ0YWomLbCB4zHC7OHPa/v?=
 =?us-ascii?Q?KI8FwBRnzJL8SPqv82QFFDjPxa+5lb00Mo9wEUNxbm3URKgnuE1FRVYYCYe0?=
 =?us-ascii?Q?JReiaogzXdNzfE6GaWxUXBM0CGICNpJglWO5WcVoZ3OMn+UAmvCwliSEXL4u?=
 =?us-ascii?Q?EKNEsn9k+JZnIQtSEDRv1563Zvan+fc2al7pETF1cUlipamyXPae7SV0zShS?=
 =?us-ascii?Q?vjIO8oLh7PssE88ifM8sDbDWEzIYbWNFTXpFtgDRh5e2gyJ30TbmDrUs2bBn?=
 =?us-ascii?Q?gH+Ba0NNajWvbWvEBRd5Z0KYWqoY+LyUBUm7iSKrcztOqlDkhX8X3uV8YnBC?=
 =?us-ascii?Q?8C3NwKOB9ZSoLCIFPtdsaUkMNStksphxiHyjDmZrFJC41DCICpRvqgT0mGiy?=
 =?us-ascii?Q?oP8hrdfNbtYpCleWmooN+tRGMHWzE7KivkJxk1nr37LuwdNP8NtXIcHmQDSY?=
 =?us-ascii?Q?FL16Q7vqC307jvnViA6oyuvHZgYCFPTnu/4+smHxTO/wQdSLiH5UnOreaEVH?=
 =?us-ascii?Q?0QGS7OSDpVt20jvIm1WoHytEed6EMWsSaqf0QJV2S9QQV//iSR5BuZYCPw5g?=
 =?us-ascii?Q?6QMB5WH2HHyCWqcdMBGTFfPiRfa2knT3DEzgMX2kJasADWOczHS0i78b7rGa?=
 =?us-ascii?Q?2eLTslH3ux1aX3uabpbycAP5HltIjaHHsrORlQk1jq6YgaBZbbVh4JY7+nN8?=
 =?us-ascii?Q?lb2DdRpJSBYO4DQW0XDL0liHb1QZoaXcG0VxT6djHCRsNMbnFD/4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8796cabb-776f-4cac-e52d-08df4426fbf3
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 21:17:13.8507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j2IbpSaJ0dCPTGGLVR0w8uDj4GvFaXeAx/hlQxjbIbwVvI3vXl/otjJGkmU6lXky9Ofgq/+KQU69LXHAKUVTjJ02njocDQW7mrH27vhpJwBKK6uCqln45axlvITNUZja
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PPFA055FEBBE

On Mon, Nov 09, 2026 at 07:03:42PM -0600, Myeonghun Pak wrote:
> Probe registers an OF DMA controller, but remove does not unregister it.
> The OF DMA helpers retain the driver's data pointer after managed cleanup
> frees it, leaving a stale provider entry for subsequent channel requests.
>
> Unregister the OF DMA controller before tearing down the device resources.
> There are no fallible operations after its registration in probe, so no
> matching probe error path is needed.
>
> Fixes: f561ec8b2b33 ("dmaengine: Add STM32 DMA3 support")
>
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> No hardware runtime testing.
>
> diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
> --- a/drivers/dma/stm32/stm32-dma3.c
> +++ b/drivers/dma/stm32/stm32-dma3.c
> @@ -1921,6 +1921,7 @@
>
>  static void stm32_dma3_remove(struct platform_device *pdev)
>  {
> +	of_dma_controller_free(pdev->dev.of_node);

devm_of_dma_controller_register() to fix this

Frank

>  	pm_runtime_disable(&pdev->dev);
>  }
>
>
>
> On Tue, 10 Nov 2026 00:42:55 +0000, mhun512@gmail.com wrote:
> > Split OF provider teardown from the managed clock cleanup requested in the
> > review of the original patch. Patch 1 unregisters the provider on removal;
> > patch 2 returns the active clock reference after managed DMA/IRQ teardown.
> >
> > Keep the existing remove-time runtime PM disable barrier. Check initial PM
> > activation failure, and let devres handle later probe failures. Remove the
> > manual IRQ-free loop from the original submission.
> >
> > No hardware runtime testing.
