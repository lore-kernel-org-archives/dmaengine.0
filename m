Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013047.outbound.protection.outlook.com [52.101.72.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8027133C502
	for <dmaengine@vger.kernel.org>; Fri, 14 Aug 2026 20:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786740539; cv=fail; b=quH/YYKx4TGN1NQh3EG4M/eHiV1trHM4xnlAZL342MzCcvrRQEZtzL2N+nNeYpNmjsy84+qGDKEYIKrDS7A/WwIjKRT8bpdWSA+0R8BcH3HdorLnwGRwn3yf7vygGPCXCkgJUzmAECNnXi4HRqeyj8eoBkXmC+nN32M81b8A9C8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786740539; c=relaxed/simple;
	bh=LSiXLNtxgab+HOJPJ8mWfroYrYW26rb1dQlj+fFtQcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qtcIRFYTF8CFDrOmhVlsgFXoK7DwSMC/AqxG/ytQyiCBFg3ag+F8rGYUxIQFLEqYiJF0Jr+c07eYlh9uGDy96TYrKP9gq789FFPJ+tvY2m0WDqlMa6Ma/6D+G0aXY2QpHbvEeLE+A1hizCFmPxO780K0fK29FyljFIUlh/NmUC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QsqTmYZe reason="signature verification failed"; arc=fail smtp.client-ip=52.101.72.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QsqTmYZe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tvEhS8naVmSQVYMTysqhBl5JSedL8H75lW3JV5UXDxYuuqGilfmf02C9HHBGW+w6pqEd9HbUsTK0aoXUBaydGidTdRa9Ynb0evWQF5jyIwjJXR+tvaG1n1Vj4+21uSOkmhD6C3ZknoYlJuD7otJQUl6LvnLaOx+L8EzX7DeJg8sv9xPxNTmp9xSeqOMy/bAceBktQMbTG4kvHm9uULgePGIF5PctLoJCMiDszzdiJyPMEsS/VNtuL7aMYadaIcJZXWE5aevDtOlOrzriqktzg1bISdG7z3WFLwOAp4CZMvVQzjN7lsoHE5hImKYd/Oim5Amm02SmAlAogC3jucsRGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSUlQ+UB1+vyk4/G9dqexdedCRKWEXDxWX4S1gAzkzk=;
 b=PE3BD+wicfzT8PjnBcD4IuSiO+HPfPYaS6iZd07BMGsHAwARzxKdguZ6mntf1vb9wO274BeFEnd+urgWGABxJuIKBX5CGR9P5+QwdxaSoKWiKahOgeZTrrRe7CJbUmYqgMPA21AjjpTHV5dxrFVJhPGyl6zT3Ksl7H+Bdo/hVFN/A6Y5AZE4F+h+2OcGiGFTes5dZior5rAhJeyHaUmkoImHuIZ6rW3QhpZ1X+4/5Ijj7CBySfwvG8srSZ3exK+6YDj8ig3CqGsD0eC7ukGTwR8lcdBKmi01LwSRSPm0Nu2LeEYOJkpgA+MTxs5bBh8K/GZwtfqpeWoxT8aaHIAc6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSUlQ+UB1+vyk4/G9dqexdedCRKWEXDxWX4S1gAzkzk=;
 b=QsqTmYZepOZ/roH6qeha4hNpR61V4ct+3A1MwvPpzvKssthuOqMMq6uBKCKdcJkH/GYXhvHqEPPENbSElN4jAW2jQ/bCQBVJudZiNQiEbfNVmhoCIH66OwmKMpOITkaNUqywiYBI1/BJqQssQvEnRQtpVl5dovJYSuXbe1CBS7/6khjZSlIJDt76vRAkS0My1a4lBEGdokxvOA5LgYH99yywfK4NbOV7haEQkQlK3rxWs+A0fK90BOTajFst0MTfIFP7cw6yzFzOUNRskMcf2EPaTzx3ey1yxpJCoQhi17qX/NIQ+SeU+kXN+pgku/XGgQ4H5XKwIxJZdizSZKYQcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB6904.eurprd04.prod.outlook.com (2603:10a6:20b:106::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 20:48:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 20:48:54 +0000
Date: Fri, 14 Aug 2026 16:48:47 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Rosen Penev <rosenp@gmail.com>, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org, vkoul@kernel.org
Subject: Re: [PATCH] dma: at_hdmac: add device_synchronize callback
Message-ID: <an9_L-bR8wJ8VcFK@lizhi-Precision-Tower-5810>
References: <20260724232301.50237-1-rosenp@gmail.com>
 <20260724233556.8B4A11F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260724233556.8B4A11F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH7PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:510:339::34) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: ba7f59d7-8d86-41e1-8374-08defa4573f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|1800799024|366016|6133799003|10067099003|5023799004|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	26/w/Dzb7mRzjcGu/hljeMiqLlBULNIeB79oJ/bLP9fZ+ScnpJEMgCoHGXU9Kui23O8dmWE3DgLWTwrpaqbL0x3RCi0iKPAJedTs5iJeYP51rfyvdfAatHwvXR6tk8lxO4pwAgaC62SMPVdRZDhnA19nOHfQyCeCEGjuZzW7xnwk8JPhzgXtk2OJ+FTuIf8Hpj5ipUeRYqm9/L/NfqNhY+a7jOemRdXmcbOgKYuPNPR14AqEvAVlz6Wg+dviQPHlddYLmEP7xOKYOb3r8ryNxxvI/Jd7rT9QN+lb6ifR5HakcncHHZsgOqqgSvwyJbLp/IbS49lqLQgVIAz65q8IvqO0so7ShdjkO0jfy0YW3+xgDB6yJiQ3PKQ2qAzDk/TWLVh+QAguVnOfXNoyBG/3ZfGKIGrWs8djC0mYaCzsa3sCk64dW4mnc/1Tolsggz1kGRjfKNjlcHrPAJh/grB7ZHQjTG6qMMFJ2XvQhCMlvDESPn+ROq5sYnnKWybdcEmyZopN7toXPjFmlBYxW6PtDEaJ5ZrUeVV6ZOOreojtLRnUo3lZ2KdVAX1KFiRke5ndgqYY4Gopb3FLuR0C8Um2snjCMuSeF9vOSLA5IQhmb/w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(5023799004)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Ge0E8SpEYSlpL0enFCR0uKEEKpY69cGvP+YegrmgMeaJrptGYjRMrairiA?=
 =?iso-8859-1?Q?ZdChMgr2Kya6NqaC3L+lUvT+GAAdwpQ/A+a64ppyUao/P42/eMID/GBjn+?=
 =?iso-8859-1?Q?kTKxZP4bkem32Dlp8mDxGTqtDfc6870TaQj4B+mlvuVQotj4SGXIiTWhlY?=
 =?iso-8859-1?Q?he97v/XBua5tNNQK1i0qIGhgyZpJmyoAYNL9q9a04NHrYTkTmA5KQ0+n8s?=
 =?iso-8859-1?Q?NxiNJSvXmY+bCVCmcV1jOENR5JfQx5EYzlswebxX/WF91MYbtM4D6oJyRL?=
 =?iso-8859-1?Q?jtzZdW3iRe+QQ47Mu5SXJ64NoEK635doVXPFpiyBPBtWim9h4EXBfl0+8r?=
 =?iso-8859-1?Q?kJHsdx8UJVcUS5yp7HRyFH10KKlecgrMT3O8OucxYpdzC3w0mJXt1xgql/?=
 =?iso-8859-1?Q?2K/CJ4VUKdGJsTJucw+qsK387+v74ZEjSJ+xrhAQzoWHBMm0aIq/TdKljt?=
 =?iso-8859-1?Q?lxeAuq6pwsPPsTGETUDEbio0UbwGBC/J21XyDGBOshCMdROg4dUoDLk2sT?=
 =?iso-8859-1?Q?sv5JSDoxMg6aW61IJxyonulw5mQXA5W8J/Gu+58xfEORv4YcSm6nxb9IUS?=
 =?iso-8859-1?Q?YZFj1FqaWInC1DJCxef3RhUg230nv/KrsFfJXBdMfS5FybUEzEK1EeQU9W?=
 =?iso-8859-1?Q?p3OvMjDGVT+yXkhLpdkJdSgxQh0i/NVUWyVCm7B3uOIgM60WCQbVX6w5sj?=
 =?iso-8859-1?Q?ljzZGq9GIjxZ04NsPvKSyU17xqsmeRzKskhNsWPM3bfOfXTeTHgTVNwSNi?=
 =?iso-8859-1?Q?XHAEW4qmHTlWcte8c346IDFNBXZ4IuO8Yr2pyhBYPruMO+lhq0BeoTyvwN?=
 =?iso-8859-1?Q?A/abwo64RMaMeyegeuSWf3o1QDQH8DV9hz0qLIqH2h1QERE6Dq7xMRYiAH?=
 =?iso-8859-1?Q?4cEAE1uZk9R2EtJorEQC6aIw5AnW38udo8M9dXgjc2bK6hxWpce3/ayBat?=
 =?iso-8859-1?Q?eZvMPf4wMs/uYl54stVgsIplKBgQn8CvNlF4fgbajvA5V1Th+5uAtdiuni?=
 =?iso-8859-1?Q?MGu8DQiObtqWhHgtsLY1zl6o2mJqGn6/m8YezGh2tewd+b6aInVrZru1ze?=
 =?iso-8859-1?Q?Ns/Sh82xS3pMVgRdFXB1Rm/ftvX3D/H0fGv1DMrYYUKe6drMrZuxzzn1Um?=
 =?iso-8859-1?Q?lty1zbyuhO3O5NprzF9TTXZyxYKEE8dHwl7aQ90IEnXzqKnZCXk8H69SeX?=
 =?iso-8859-1?Q?Uu+trMMs9OHgJnas0DjUlwdRAi8/yq2ehoQxImgZPsmZSKrKeVMmXsovY7?=
 =?iso-8859-1?Q?ZG2WfJRTKiCkEQL/Kg5HTEc02FvXF8jKUL08WHbtYfFajefGhQoZBVQPlh?=
 =?iso-8859-1?Q?DOZJm1gq6/b3rK/2T6A0ZMzpQibR4Qa3WTT4PHTOM01UAVWNUFrPUNvYAi?=
 =?iso-8859-1?Q?cRu0lFMoOoz31hOBjE9LOjjCd2j5rHZVtEZ+TNpSP0aJNBWV53xsiV6loz?=
 =?iso-8859-1?Q?1vJwuT9Bm6dxUaIfxm6RIEqXfUbCET4EsSGOcpt/9uVIR+KJVSHWIALRst?=
 =?iso-8859-1?Q?Er0F5N2Hh1r8OUNqYja7uyvIaF4pLNvCHXmqbGnDyINM7KK92TIgp8SJrO?=
 =?iso-8859-1?Q?6CMGxfMZg6kC0AunT9n87AwdmprEOVxT614oc/CNOMOTGJUtozXYPCeAN9?=
 =?iso-8859-1?Q?l9m4rwlWSl+KqcS701XRZ2TYjQM9mUQljUYvL/4R6AJE4TajdxdGw/Ji56?=
 =?iso-8859-1?Q?k/RUPxQpiT0Af9ea5tBrB680l8El9f/N3GyLXGwykWH/K8nuJEBQ8DRr0V?=
 =?iso-8859-1?Q?cR2TNUntGY3x8hgxmawn/Qg2yGr863JGooGyHKn12w1kHN3JYjklQxgMpJ?=
 =?iso-8859-1?Q?FxI8OmOv3OCrk0RZ/H10giVep9v5O0E/dAsz9qBhq9BgpO0P5RmD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba7f59d7-8d86-41e1-8374-08defa4573f1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 20:48:53.9431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3AceozTexAw2yAhi2LM1cXHuVoWpbciQUGlRnXSRaj0f4xWmEM/QAH/olGEX1DY6eJgxqd1LBnUVue+MTVQKRGjmVEcGEuVJSCSwdVWvOrN/40kg3fcy3bxrqQaTLnFO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6904

On Fri, Jul 24, 2026 at 11:35:56PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Adding `device_synchronize` is insufficient to fix descriptor synchronization races because `atc_terminate_all()` still prematurely frees active/terminated descriptors, causing a Use-After-Free.
> --
>
> --- Patch [1]: [PATCH] dma: at_hdmac: add device_synchronize callback ---
> commit cf29784e04ea139aef404987d19236faf066af03
> Author: Rosen Penev <rosenp@gmail.com>
>
> dma: at_hdmac: add device_synchronize callback
>
> Implement the device_synchronize callback for the atmel DMA driver by adding
> atc_synchronize() which calls vchan_synchronize() on the associated virt
> channel. This ensures proper synchronization of pending descriptors when
> requested by the DMA framework.
>
> > diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> > index e5b30a57c477a..96233eb7a3c6e 100644
> > --- a/drivers/dma/at_hdmac.c
> > +++ b/drivers/dma/at_hdmac.c
> > @@ -1616,6 +1616,13 @@ static int atc_resume(struct dma_chan *chan)
> >  	return 0;
> >  }
> >
> > +static void atc_synchronize(struct dma_chan *chan)
> > +{
> > +	struct at_dma_chan *atchan = to_at_dma_chan(chan);
> > +
> > +	vchan_synchronize(&atchan->vc);
> > +}
>
> [Severity: High]
> This is a pre-existing issue, but does adding device_synchronize fully resolve
> the descriptor synchronization races?
>
> When dmaengine_terminate_sync() is called, it first invokes
> device_terminate_all() (which maps to atc_terminate_all()) and then calls
> device_synchronize().
>
> Looking at atc_terminate_all(), it currently stops the hardware and moves the
> active cyclic descriptor to the desc_terminated list, but then immediately
> extracts and frees all lists:
>
> atc_terminate_all() {
>         ...
>         if (atchan->desc) {
>                 vchan_terminate_vdesc(&atchan->desc->vd);
>                 ...
>         }
>
>         vchan_get_all_descriptors(&atchan->vc, &list);
>         ...
>         vchan_dma_desc_free_list(&atchan->vc, &list);
> }
>
> If the period completion tasklet (vchan_complete()) is concurrently executing
> on another CPU, the cyclic descriptor will be freed out from under it. By the
> time atc_synchronize() is called to wait for the tasklet via tasklet_kill(),
> the memory is already freed.
>
> Can this result in a use-after-free when the tasklet calls
> dmaengine_desc_callback_invoke() and computes an address based on the freed
> pointer?
>
> Should atc_terminate_all() avoid extracting and freeing the desc_terminated
> list so vchan_synchronize() can clean it up safely after the tasklet finishes?
>

Please check this issue

Frank

> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260724232301.50237-1-rosenp@gmail.com?part=1
