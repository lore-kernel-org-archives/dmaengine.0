Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792686537;
	b=Vwom/BS6ObCXFekmjbZjoGDgFVTc4Er01XqUBF8tRlQg/4p6pLFdmwjs1fr6X/3K9ced
	 v/1IflEkWHXysSTC7dpyqVdmfOQjo+NIklJMmlAjU0FjW34apDoPzt4A0BHhZ39jiXIgH
	 B6mNBIqS2HiMG+XEhsWTiXxNZjMemqLID0EPL2kUIMiw3uMipPrFKph/O9MUe4O0cu228
	 G/P9BTJJ1QSgoYuEUM8gOkVGRhr1s37iGyQwUPzyPla4f0+8BxMuceOj1PswJSfZhACTN
	 /0KT+QEI9DhwlMNdcwSuR6MiOBscOmo4bld/e3fnjucXmM7znGWrBWgYhtkTB97KG9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792686537;
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
	bh=JxVvs8kh07+rdyhURSwshuYnSrGrYd8ZDW1qDfaSLvc=;
	b=ce6W3sdITk+PtmkmzIFEbdDXd7mdlZfZoA/Wg3vsPmzNpoy3lZRx4r46w2+nLevCiq1e
	 prp0gaaY4rG+QYoT/5hB7hmlX+AbAXooER/LhmdF7WU/6yE0Z9m1FWUVPH0weT7hXuKZX
	 ct7HUTH4Nx4pXkXJSz1W933TwnGXJazq0845+wNxq1A5kostI6CHiMa0YD4+i+tc7REsr
	 mujdrDMBf3zZgesIyQ0lU9ghGF720ZuM5sT1rXPPXFbZhL+S0wN6E/jpcY1UrbD7LwS2L
	 HNmd8i2K+NtTrZiEc0atva851228mY95OG49k0zsvSbZO2wMvMD+hnlqgzEuk0ZIOdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UFbZk2Zg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.22
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013022.outbound.protection.outlook.com [40.107.159.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADE5606A31B;
	Thu, 22 Oct 2026 16:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AADE5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UFbZk2Zg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAzfT/Tx6IR+Arh/O8m1os4QwhxQmfcyPDxcxucqbi4be9ZRdTAk4Ni579T4vxyNoVRG8OWUnGymRPfKVpJLOxXjRe4ZnnC0Pd1xpr7HHFyD2k+V5aecpJAPocOncaVFO0HlD286sStiwHZaYnhzSjZ9Kr8bHZ/D+r0Xis9/B3c+2hdsrGgcofVgKj2OHHBrL+k/VnBcWBRGptclC7piXkbBldGEnemeV2fR4deWEX1Z4vWgdFTUZFJ6z4pqx700dI7LtHPhERsdaWlBr2tPsyHBDJu1DPlCNjXFu9oxpZcvlRI2tpP7dOQH9HSzav7EbqE/Wxtb1DpKzkQ1FW/3AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxVvs8kh07+rdyhURSwshuYnSrGrYd8ZDW1qDfaSLvc=;
 b=QPj2pA2PIUVEIBafIU30uQ4DhP28koaKhnLr4RmL+o8j3l8PGEM2poPOw++PTaWdjdkImZEU9QdB0W8undAqjCfHVWQmSFtZGHOL14IzyIld0gUDfGAVRIPUf5G/oiZdiLRiFc+EJKfrNivLzoHYob+jUj7TcPOPhcPnyxHrpMdGK33Vi8vFa9iwRbvwNaRF0yT7NROx1yfA4OiLA991WaU7eGe/RcPwHYJrRoWxlbwthx8QJTsmWo0CgRqskuwKF4R8rcdcpBucf8bat4J7bKM9VtmAI4GNgzjVbmDMXzdW/SHb4S2NzuIO0gQGI/y/8w8oE1a1VkSg8jxLGH4z+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxVvs8kh07+rdyhURSwshuYnSrGrYd8ZDW1qDfaSLvc=;
 b=UFbZk2ZgzlwDS6QJiNowTePVrlYZ5sos2z4TzEtGFBDRkA1trda2VgP/q8rFB3s3aPUtKE/qZucp6fgX2Jh6f7vIsCmQIrys+mlQEV5feiGW3/cNiPL7m6hVsxMScz3uXZZsPNHUD1tntIH0Vq4yBKXEK0C46QIf/nvsu0klCEdKFhltkngOQh2o5z9HcJ8tO4q176Luh8sEFlUUY/N9lUZCUlCgXeaYNzSx+qEETrydQu3G535NlY+ajHev6vyb9rIF0AUmzUJzXf1zSqojmjmwT+liBrKxuLWWKNlZVextcamxJuzfmuDLMSboSaQQk+wAxZLoSUGmyA/e4HQUFA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM8PR04MB7348.eurprd04.prod.outlook.com (2603:10a6:20b:1db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 16:28:53 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 16:28:53 +0000
Date: Thu, 22 Oct 2026 11:28:43 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: sun6i: use the channel pause enable bit
Message-ID: <ato5u_Ew-7E3Ll2G@SMW015318>
References: <20261021-submit-sun6i-dma-pause-bit-v1-v1-1-38d286b69dab@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021-submit-sun6i-dma-pause-bit-v1-v1-1-38d286b69dab@gmail.com>
X-ClientProxiedBy: DM6PR02CA0159.namprd02.prod.outlook.com
 (2603:10b6:5:332::26) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM8PR04MB7348:EE_
X-MS-Office365-Filtering-Correlation-Id: 933180d2-b79b-4fa5-c58f-08df30598fbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|7416014|56012099006|11063799006|261021123027099003|261021121427099003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OBGNeT7++iQI0Cn9SDIYIkxBx4qivhkWhnFSzT8cwY2IgGxcgq3WotTYbAfYCeNL+G5gB/vpz1Q9wUPdYK4Mr3yWd2jt1rI+8gm58wprNvi8NklW/oW0kpfTtTG9LU6ML8zIgIEw5iFSvAexaxaR52+khMU04TmKo/JiedE5fejSMtyv7JVauwJuny+0k4TJcOGjjMj/j6ybPzFY+hcrovUG9iYv/zOI1w/kTOuiMf0l260EAGG0rvgfa8MddIV5MFN2r5U2UmZXmH8nXtXjuXbOHtObWMUuHvQg4zWhGkKFl/HHMS84N+YN7uUOsMp+rGME6ZnVjWfX3xUwwFCG4MA2Aa3GvDgL5QT2vDbGq9lgpRzYUSM7s2vXKT/hA9w7h8/pciSYYP+RgrcFXwxAMyLY1ieOcSUS11ZlBFlfDaO5qb+lVWrv7TkCJkoVRLkOxlgK2rifMKZXR5gNoSwKwwmpSAi0a8hqJJB0SUbVXUFrxDhz+b4ebDpf2ijmwjQk6yZ9d8eysi8VlHR3x7rjq580F4jbppF84VLuT3Z6bHXk+qOiPVIhDzWCo928/K+lU/YRx8G9YqEr0jZpnikc9ewYknCjLtYSTCyqv9htq1yqRI3cNuBsU+Q7et0JLs25VYBHn4tpdA+BjVgqnggwnCKn0YI1IUmbrd55hiTmysE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(7416014)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g4FiVgUfK+Q6s979HPu/0Q7WXerWwpoYUKwM/eQREXAxv2suhgQf/ADwGw7M?=
 =?us-ascii?Q?LYrue7LfcAVXBiNawCzG0uXTv3w2fBundvABmwWuLfwp4l8kYTi8ngJeK69+?=
 =?us-ascii?Q?EcHJyW2WCj2wLXxzP2Zn+boU9VQUbqtF6Cp15G9XBw+ztfCN1Rw0fIMHHlOe?=
 =?us-ascii?Q?4XPdX0Lc318sEUqx/2sBi6/GHowiVe27K2EYkXYlTirWXD8OrZeBahxYzDrs?=
 =?us-ascii?Q?r15xL7RclwMO6fikpoAocst4IpcGw2Oz514NLsno87SvMP8az3o0OngvehfA?=
 =?us-ascii?Q?DtsARo+/7/IoYxHl/qNYIyT/3apJwaoSDVCoV2gIGrOYblCAl8+Ujsi4VgBO?=
 =?us-ascii?Q?etLTzpKjAYexR7TOipyji3ubm/rvqnZsCK1tXOGPc2p+OeviGjifaD6rW63E?=
 =?us-ascii?Q?eoMu0J7J2XBaUBUQuyEEoc6XuwOFeudNTWbBB2iN+mDRb8Abxy3IZ4BlnbCY?=
 =?us-ascii?Q?7hOtILu/YjVTOdAsHct3z9m0NG+J36oghxKsE3rZwwIhAe0lLUJ0HcqCJPh3?=
 =?us-ascii?Q?EVT+DZHHrshtFCEpEhssiMg1DqckjY0OzGeTaRXgxCmO6f1LViPJ3tRsqiHm?=
 =?us-ascii?Q?l1qVRq+9FGKlDoTuR6J6LSd5qOh8Qovd52i07GWwaHNiXHhG43hBcYSJk7Vq?=
 =?us-ascii?Q?SSefO9YjauIWhbUQZvUyfO3hQlRVVzG83eESKhd8YxpzLOEEOCUCdGPaFEUr?=
 =?us-ascii?Q?qb4g46ceCJEQyTPfVQylpHa2IDHuHrPObqu7iLDfldMIWH4C6rFw8BMv2/DF?=
 =?us-ascii?Q?kmAeDYTWaB+ZDOdygISrvFbV/34/g1MGRrtsbL/iE9Z9cETK1FXNV9RDaRkj?=
 =?us-ascii?Q?8lyYASWEgqDX9E2JGciIXSP/vdp7RfI6hEyOLOzOnJmmFCgn4TlvLLhyksO8?=
 =?us-ascii?Q?XwCFmQrT8atjuiUPEidB6K4KTlwmLz7MnO2FHIb7BpoRTJ3C2M9rd+hZeH3k?=
 =?us-ascii?Q?1XSDDQZD3KG72RjebLMjk7h5Ux4ve6hP1Vz1g3xQZPrrjuQoU/yr1dr7R997?=
 =?us-ascii?Q?IEE6N4LolZZBOCQEUpDoHmp2nG/G8cD+DMkzL8vqAwYI3CamxwxyHPoiDdvR?=
 =?us-ascii?Q?UveIW0DbUXHx7cTUT+dI9ASSAxhjGEgZzZZV7NKxb8hWatU175MtfZ8MrtqN?=
 =?us-ascii?Q?PjyferrLS/aVQ0I3U3t8PEG96kwAISmxTHJqwFogf9KK4JGYUcM7qXCj5WwO?=
 =?us-ascii?Q?2ZNb23yQonPTuC8N66ZNJPMFYNUTtKBIGnuCSi3QQ0Vq2KO2uH8oAEZ/Jf7f?=
 =?us-ascii?Q?oCjVfKbqfpKKILmL1xEMHiSZA+4XamtnsVkr24uhQp7WkRlnEGFn4SJmC14x?=
 =?us-ascii?Q?pOSBMhU1JfBUWXqz3ROxCGlkO0gJTMKnGWlVtddK1td1uz1111PGSrfOrW46?=
 =?us-ascii?Q?aXRkM2aCcM8W71B+n8KVqqMu7C+dz1nTk/30Wh0jQ/yv69mZ/ObLl/SVmvL+?=
 =?us-ascii?Q?3Edw+7n8aSzn1z3KXTFm41v8T8b1LbMIUXs45tD6dJykEJSqn/XNe1V4dXOc?=
 =?us-ascii?Q?JkYuIUMh5fXvoYdb13XUwk1usbvXar1YY9SqfzUeC0boc45WWXFP1nB6rWIX?=
 =?us-ascii?Q?CBza7Ap6x4dU6Cqlsac7l2sLDsLSJQQkIugBzUIlvZU7twnkV2IHosV2zLPN?=
 =?us-ascii?Q?CAsG6YPcYrDoIeqgLzeGHJ3oFkI/Gldy+7t3NBzZElboy2YDnjXpywPr6i+A?=
 =?us-ascii?Q?pyaFtR4dY7ibKRcetv5Gy+9gqqFgBJUm8Su4GhSD2eyltnPTEWPw6gRxYcwk?=
 =?us-ascii?Q?dVxO9I7xq0sCyw28eEZqzV6nJPVDy0ccOy0ns3p2RQOS+z4ZnK+w?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 933180d2-b79b-4fa5-c58f-08df30598fbb
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 16:28:53.3420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXtB7kCQsuI5BB0B64XJNIk2KY5govDEG+WYh2Eg9+3q6FDXHtaMbNy2Bu97Rqr+N/mpFfB6B1+NBPgYTxXtzv9Qx4SE3gNzWT4h7OWfSatkK+pIjMVY3dbOt7ktixfU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7348

On Wed, Oct 21, 2026 at 03:02:13PM -0600, James Hilliard wrote:
> The channel pause register uses bit 0 to suspend DMA requests. Bit 1 is
> reserved, but sun6i_dma_pause() writes only that bit and returns success.
> An active peripheral transfer can therefore continue while its client
> expects it to be paused, for example while the 8250 driver reads RX
> residue and copies a partially filled receive buffer.
>
> Use bit 0, as specified by the H616 DMA channel pause register.
> This fixes the pause request itself; it does not add paused-state
> reporting or change the handling of transactions already on the bus.
>
> Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/sun6i-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 7704b016aed8..204b0b812431 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -60,7 +60,7 @@
>  #define DMA_CHAN_ENABLE_STOP		0
>
>  #define DMA_CHAN_PAUSE		0x04
> -#define DMA_CHAN_PAUSE_PAUSE		BIT(1)
> +#define DMA_CHAN_PAUSE_PAUSE		BIT(0)
>  #define DMA_CHAN_PAUSE_RESUME		0
>
>  #define DMA_CHAN_LLI_ADDR	0x08
>
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> change-id: 20261021-submit-sun6i-dma-pause-bit-v1-618c1c3877d8
>
> Best regards,
> --
> James Hilliard <james.hilliard1@gmail.com>
>
