Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.66.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794939018;
	b=KlQiFnsAYqHkWjSATcvv6s7SJOsuCc80qSmvtfgkU93zbHuLnl+uVWezZqSggMpm/2vP
	 oG3j/8oRXISvfHnVDxRDnYMrGLFhY9DYy4xrU7Z1BNmHBVBBTXczAyFtOF3Bn31Lp69a+
	 9felT9bd8CEq4Id0PZAPFaX2KrUtpiI/Y0EX252nlVx6VN6ZW1Z5SJhZBsWqeR94SCDOV
	 XFpfe282zjNSIwFZLU9DAXpoyW33R1KlldKuH3La1V1fCr6M/HAec8u6i41o38C/prHlt
	 KLnEWpVwn1RBPm+mUMbF2pTivjdwLc1ybQlxpgEoRzbAQCqLIkKp7YDkfkI6KlgEaOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939018;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=NJZYiU/S9Ux/IOVGiEmg183DO87bkZlf0cthc4ga7aQ=;
	b=yVBUO/mY6m+UiLC23RCdCOiCTsi5vj8lz44cFLyuPP5RJK1CNNeLvTqBSJL+I7NwlFJ0
	 DELDjJI9V0jcSA6ZbJqVxg/SDk/hbhxbPwa/Ak/fxMKGy6RB+rFlj8GScV3A6wIs+bry6
	 c2JnNszMfp5MU9s7SmjEIPQ+0Ia/JnzRrkcM9tIInGjz5XwQCwKN3fgK0TV8lttsw02Hu
	 y6EVSFttQ1eyOoBbvYlryjGvtac14gm6Dgi6U/wVmfkFJbAh871h2TmL7Nf4Fn+xC09RP
	 ZvtiUqNXl741+IbDkIf8Vj33RZk09E7Vf4XetJcDwLC6B7XwmufRqRY1x8dj1ZCD8tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=tNwdLBjv;
	arc=fail smtp.remote-ip=52.101.66.33
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012033.outbound.protection.outlook.com [52.101.66.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B62A606A31C
	for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 18:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B62A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=tNwdLBjv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVZDtfD4AG5L9/wf3NAEzo0VLcxalxWhWnJSV3gKu9FcL7KFVQqPV69L90ERQ868OQTGZ+6teJBsQhAhLgjffbCVFqlifuln1ie9mS4oSJyNqj+izyZ0hcJsitL1qoWAvyxY7NsEzYTq8p0j/M6ZaSEPTQS6Inh4b5KITS0bZvw0arJMkz4jGu/C/CbEfVpESjvTcugfrdDm8L/I4/y30azZyp/AOs26buAQhoPcnybPi8Dm0xBv48LDz38qzy5tRsykj0sWwMxWmEsKRn2vLbSSpusUfqqtrEWPQu4HMBdV1wvft/EFPUETzGyZBdDp45o3ttyqjv8jTf8NixXCjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6Wjq/0pjOFmblNphrZ4CpMiGYV8fnghyhQ88Io29qg=;
 b=Xt4u27mo8TbEHkmneHJVX2E3Q2pt3Ix86C+YsLF5yiRkmAxKt249OAwICaqWMuz38fc2Ms/EY+UttFXSMW4PzwZOKy2XlDoVW/R5ydpvKWxcMFOMMxaNz7tK+In06OGlP3L5EHX7EET6Az8p01hyoGhT1GplL7aPjTt0aEr5quRC20Wtkgk7pRNL0X0+32xfufWyn+eZB8ihZItRJIYo0SoXeUoeFR0gGQqhY+MtSlG5nSaC34vN7St2lw2vz/kgg0i1MTOma2niIyIQQ50/GCMIHi9UaAxQBCjltydzR+U4LvhTJlQA8LSV0ksVV+daaCQeGHN34W1pDjDtBD0tPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6Wjq/0pjOFmblNphrZ4CpMiGYV8fnghyhQ88Io29qg=;
 b=tNwdLBjvzhc681CiNrRTEPWtrLF+P/Ez6x2P/BoKhPPhxMfkLX+lnT7EFWSYx13dbyHEsS+PsO8jVhaLo0vgeyBdWPzCUMQz4iie7g/2u4hqnTKeAvzFb2dO+HzEe5LcDUYrS7NOkUL/fsE+5kYA98tsXXxIHjDD/dEBvfZkEF4QdKwzT7IS0NTBffaUAekhvNKhhKaUJ9gYToSfSISWONWB8c2Ik/q7DqijWgG2w7JHyruIW3UhCRpWrSXZ/I67j8yjXcQYcwSC6RdLjGuZgV9lC8FvjqlKsu4PB7Jtb17fsfLH6aqyHOgv95k+fbHItVT/bN2uOsLeoLzO5QBmIA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB8316.eurprd04.prod.outlook.com (2603:10a6:10:246::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 18:10:15 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 18:10:14 +0000
Date: Tue, 17 Nov 2026 13:10:07 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Sungho Kim <sungho.kim@furiosa.ai>, dmaengine@vger.kernel.org,
	vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH] dmaengine: pl330: report a failed transfer through
 callback_result
Message-ID: <avyYf8HgpeuYgjvt@lizhi-Precision-Tower-5810>
References: <20261111152109.1551738-1-sungho.kim@furiosa.ai>
 <sashiko-outbox-209270@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-209270@kernel.org>
X-ClientProxiedBy: PH7P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: b29fbb62-8cde-4c35-4607-08df44d60752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|23010399003|366016|18002099003|6133799003|22082099003|261009221227099003|261009223027099003|4143699003|56012099006|5023799004|11063799006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261022075727099003|261022105027099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	nkGjBUtNh4JJxcph+OcQujrLJF1U7bbLQq+5BSgn2f8ebvlSfT9JhtMF4vP0hfzLZ1KAie7/aL5hhjh+mScu/lkLdp3L6pQtjA8brldHMlUQX7zIXivO6UHVu78xh7fFQBhceiEEtWKua4rrxj2GheMzkkgK482HZ6kPJct4AL8GIHx51pElOC993W5Ql6Y+sZiWdyZD4gZ8BSnIW1CuVKsrZsAQ418nsAZN8+qP7laNlHXX7blVx4nrjXbGp1Z/H+tou8PdonsZHufCaW9+uSCcWFedb9HP1QA2xFs30RRslt0AtwTSIGXMhFrK1CnNqk7JmcsBbq+Jxffh2rIT1XqmU+FYwpBYTmk7UpNkoIpmw3ZivpuaHo8inXap8XfJXw0bOe0K1YwPVR+UYURg21a2xKw7POIw8ENHVb/yvKxLrezyVcmVE8SNj81yTK4FsIFbihSJc9tak/gl7aJ8HkaBvXPGjQUFyZlBZNSQoNZS1cq3UxHtLa6mxB6raOCIVWegkYRLTdG2NSUNJ1PaW3OtSGS+VjKxPVNELFVpBw0VtcGm3jYXebk71PVo+uZBDhRNPjyHzvxxduG7g4ISKD3uGiv5HQz4fr4MBw5zbk0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(23010399003)(366016)(18002099003)(6133799003)(22082099003)(261009221227099003)(261009223027099003)(4143699003)(56012099006)(5023799004)(11063799006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?fZrOw0awHa4E8iXisJiHkzWeQpCXOuVNxM8FPrBktcUGnxz5jS9hB8w2tT?=
 =?iso-8859-1?Q?2foUJ1/hrUXcEIMuawxYk2yz/TzhKhveRMaLJ2f28LIYMLc65QCuTOJcIL?=
 =?iso-8859-1?Q?4kbwpzQtnWrxf4TAOGrH5MMT5DAMUr5mgCn/+fdDny+TWqTfoijXgurWiD?=
 =?iso-8859-1?Q?0r6UpbJg2lU/4R/jY7bdMYbDMf3t6qHP9Glozbc04IsZAV9nhanMQGGAZ0?=
 =?iso-8859-1?Q?sS2IjmAg4c90mnUd74kFCUuEJwl9j/Pb+5s+8GrvBwqJDX/eatP94stguO?=
 =?iso-8859-1?Q?RgxOR/ylotYXo3DTSOYkZTA+Oazx5cPt7XKFtBnjWt3xksZmVLFnXs1Oz3?=
 =?iso-8859-1?Q?+Fz+LYVqX/FLkGGHsvh78jB1FCmCMIsfMULzkq/3LStyizvj41gmJpZBJw?=
 =?iso-8859-1?Q?7kDDOFq0DpSExm0hRcgmd5sCs1wHLUCgH60dtr4rCvRiReJzEIht1LWAca?=
 =?iso-8859-1?Q?10JQ/bG+vaRoAMRavlmp+Db7PUA4Lm06JxC0tN+JWN+WuSG0EjbeXmhfbV?=
 =?iso-8859-1?Q?yu2FU7N23YEFVcs2qNgyuRLXVf+RD2C2Ck+oorHzh6qfDWcas013XhyNbD?=
 =?iso-8859-1?Q?IaQbaZUsGUfdF2/6RG1tVYJbzVu0wyerzpRap/qesl6axjE0PW8rKM5XyB?=
 =?iso-8859-1?Q?YrRenO8ASb17iPnumN1nUA2K/9lrTdblyjb+d+d8O6XLkC3cGRpNCYeCu0?=
 =?iso-8859-1?Q?UfxBIF3xFc9a0DCKhCpeKRVo7vBsKbhWxspMEHdD+fB1bewkN1y0JfBKX+?=
 =?iso-8859-1?Q?Ij6NlLOJWtGHAQa4lV2jpurq+5Xma+XXYHg8q/V+unPPRWpehLx0S6KkEk?=
 =?iso-8859-1?Q?z7di9m7C1Cj15lH/xz5V1gMGkfPP8DMfTGrHv+9F8MhI77L4Ujoejft6cp?=
 =?iso-8859-1?Q?sl9UNuZN0kh3noGpVZj09nvyV4el7XVaO4TTJjTUQmcV5fgabiTQxQky1r?=
 =?iso-8859-1?Q?8jumecVjZX//d4ud7SHOrwPsXOK/8zQpDHGfqPiTdnzEj+Ll4pa1P8duzH?=
 =?iso-8859-1?Q?c2oG9rFtMwSwAu1CIgQIIu6kCkYMqny4V1/O2MlZKCwx8u855nIem4ZjjT?=
 =?iso-8859-1?Q?/TQFuKu/C16xekTxQSbwPJBSzTXmEjJf06wfdSKEKCyg9LaVe9iuPuuSGi?=
 =?iso-8859-1?Q?+FCsfAiCzWW14KCYCjFrZ0EcIKxijizEYA3s/qNnHd04DrAWd3kUxJCLko?=
 =?iso-8859-1?Q?vIf7e/zWLTTbZaRT26Dpn0YQfJwt920XOcqPa+U7/m5Qbv4Ras+2dQR9Hs?=
 =?iso-8859-1?Q?NogLT5YAuzdEhQmtGxU3tf1bRhl4NK2+AZYXms4cotnXnWgeFhC7Uq8HMO?=
 =?iso-8859-1?Q?oA2lZWqN5a8HaSlwlO0k8Sxa+3cKUSMQlEuNXOIRtQQuHbvgXsfSridBNM?=
 =?iso-8859-1?Q?D52ZXragWFl6ROwGydZIk0SY41DqdvZ0lrS27Ea1yTT6fkVQLfmptHiIpd?=
 =?iso-8859-1?Q?9ZG2wLqXw99QdaZc91Ex5zyNY/lRrC8XqYtEpAG8vQTef080qCi7EHRWkD?=
 =?iso-8859-1?Q?DYllT9F6E5CgbNFdml7hmaI1mwnKKJczXvvrGz06gGnNUXS+OHKHV4GwQF?=
 =?iso-8859-1?Q?TPqhWckQhNbiB/oHPFfwgR9rm6wbKr9pe9rEUOZ05K8vIniSta2HTZi5OJ?=
 =?iso-8859-1?Q?+NhILkoDG0KOH0Z61YnboM56BIiDj0Jpfq/oHGqYuyHpaDvIZiodyO5waP?=
 =?iso-8859-1?Q?Q27/H7gjORkxy73FYckhF3ba454xflhhZFPFNOLXK1tbsulh9rksHH5yBO?=
 =?iso-8859-1?Q?yI4v61txLFE4Wmik0jjl3wYv9M9INto2Crps+Ooaq5zRP5rgH+2ee1SQs6?=
 =?iso-8859-1?Q?sxf+779Uf2Ar9HbyAm1zm+6hx48KTPq4tWaaLrboi9T2RlLlaPy6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b29fbb62-8cde-4c35-4607-08df44d60752
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 18:10:14.7052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kU4jy4F2TKPD2oV0D6f5EyGgjQCMAn0Z6hJAGWQxu0EyzSC13SD9lfZQP1rRsO0c68FXfQlYFzGICwhobZJghghRo5kVcZXpuLgY7/laF2IrdHEzgy1RNoCSIAkFggWD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8316

On Wed, Nov 11, 2026 at 04:17:57PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] dmaengine: pl330: out-of-order completion in fill_queue()
>   corrupts pch->result

Please check this one.

Frank

> It also noticed 2 related pre-existing issues this patch does not
> introduce:
> - [High] dmaengine: pl330: synchronous pl330_tasklet() call in
>   pl330_issue_pending() [1]
> - [Critical] dmaengine: pl330: desc_pool list corruption in
>   pl330_terminate_all() [2]
> --
>
> commit 5e7b59c03f80710bfb7ee7db9e4f312f02ac2fb2
> Author: Sungho Kim <sungho.kim@furiosa.ai>
>
> dmaengine: pl330: report a failed transfer through callback_result
>
> This commit records descriptor transfer failures in the PL330 driver and
> reports DMA_TRANS_ABORTED through callback_result when the last descriptor
> of a transaction completes.
>
> > diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> > index 977a9fde80adb..72e83dfdcecbb 100644
> > --- a/drivers/dma/pl330.c
> > +++ b/drivers/dma/pl330.c
>
> [ ... ]
>
> > @@ -2059,6 +2069,7 @@ static inline void fill_queue(struct dma_pl330_chan *pch)
> >  		} else {
> >  			/* Unacceptable request */
> >  			desc->status = DONE;
> > +			desc->result = DMA_TRANS_ABORTED;
> >  			dev_err(pch->dmac->ddma.dev, "%s:%d Bad Desc(%d)\n",
> >  					__func__, __LINE__, desc->txd.cookie);
> >  			tasklet_schedule(&pch->task);
> > @@ -2101,12 +2112,26 @@ static void pl330_tasklet(struct tasklet_struct *t)
> >
> >  	while (!list_empty(&pch->completed_list)) {
> >  		struct dmaengine_desc_callback cb;
> > +		struct dmaengine_result res = { .residue = 0 };
> >
> >  		desc = list_first_entry(&pch->completed_list,
> >  					struct dma_pl330_desc, node);
> >
> >  		dmaengine_desc_get_callback(&desc->txd, &cb);
> >
> > +		/*
> > +		 * callback_result is only on the last descriptor of a transaction
> > +		 * (tx_submit copies just callback to the periods of a cyclic
> > +		 * one), so a failure of an earlier descriptor is held on the
> > +		 * channel until the last one completes.
> > +		 */
> > +		if (pch->result == DMA_TRANS_NOERROR)
> > +			pch->result = desc->result;
> > +		res.result = pch->result;
> > +		if (desc->last)
> > +			pch->result = DMA_TRANS_NOERROR;
> > +		desc->result = DMA_TRANS_NOERROR;
>
> [Severity: Medium]
> Can an out-of-order failure in fill_queue() misattribute pch->result across
> descriptors?
>
> When pl330_submit_req() fails with an error other than -EAGAIN (for example
> -ENOMEM when a request exceeds the microcode buffer), fill_queue() marks
> that descriptor DONE with DMA_TRANS_ABORTED while earlier descriptors on
> pch->work_list are still BUSY in the hardware thread:
>
> drivers/dma/pl330.c:pl330_tasklet() {
> 	list_for_each_entry_safe(desc, _dt, &pch->work_list, node)
> 		if (desc->status == DONE) {
> 			if (!pch->cyclic)
> 				dma_cookie_complete(&desc->txd);
> 			list_move_tail(&desc->node, &pch->completed_list);
> 		}
> }
>
> pl330_tasklet() moves DONE descriptors to pch->completed_list ahead of
> earlier BUSY descriptors.  If an earlier transaction's last descriptor is
> still BUSY when the first descriptor of the next transaction is rejected by
> fill_queue(), the rejected descriptor completes first and sets
> pch->result = DMA_TRANS_ABORTED, which is then reported and cleared when
> the earlier transaction finishes without error.  Similarly, within a
> multi-descriptor transaction, if the last descriptor is rejected while an
> earlier descriptor is BUSY, callback_result runs before the hardware stops
> and resets pch->result to DMA_TRANS_NOERROR; if the in-flight descriptor
> later faults, pch->result is left stuck at DMA_TRANS_ABORTED for the next
> transaction.
>
> >  		if (pch->cyclic) {
> >  			desc->status = PREP;
> >  			list_move_tail(&desc->node, &pch->work_list);
> > @@ -2126,7 +2151,7 @@ static void pl330_tasklet(struct tasklet_struct *t)
> >
> >  		if (dmaengine_desc_callback_valid(&cb)) {
> >  			spin_unlock_irqrestore(&pch->lock, flags);
> > -			dmaengine_desc_callback_invoke(&cb, NULL);
> > +			dmaengine_desc_callback_invoke(&cb, &res);
> >  			spin_lock_irqsave(&pch->lock, flags);
> >  		}
> >  	}
>
> [Severity: High]
> This problem wasn't introduced by this patch, but pl330_issue_pending()
> calls pl330_tasklet() directly in the caller's context [1], running
> completion callbacks synchronously inside dma_async_issue_pending():
>
> drivers/dma/pl330.c:pl330_issue_pending() {
> 	...
> 	list_splice_tail_init(&pch->submitted_list, &pch->work_list);
> 	spin_unlock_irqrestore(&pch->lock, flags);
>
> 	pl330_tasklet(&pch->task);
> }
>
> If a descriptor on pch->work_list was marked DONE by dma_pl330_rqcb() or
> rejected by fill_queue(), a client calling dma_async_issue_pending() under
> its own lock deadlocks when its completion callback re-acquires that lock:
>
>   spin_lock(&client->lock)
>   <hardirq>
>     dma_pl330_rqcb()
>       desc->status = DONE
>       tasklet_schedule(&pch->task)
>   dma_async_issue_pending()
>     pl330_issue_pending()
>       pl330_tasklet(&pch->task)
>         dmaengine_desc_callback_invoke()
>           client_complete_cb()
>             spin_lock(&client->lock)  <-- deadlock
>
> The direct pl330_tasklet() call also races with the scheduled tasklet when
> pch->work_list becomes empty, allowing both contexts to set
> power_down = true and call pm_runtime_put_autosuspend(), underflowing the
> controller's runtime PM usage counter.
>
> [ ... ]
>
> > @@ -2295,6 +2321,7 @@ static int pl330_terminate_all(struct dma_chan *chan)
> >
> >  	power_down = pch->active;
> >  	pch->active = false;
> > +	pch->result = DMA_TRANS_NOERROR;
> >
> >  	/* Mark all desc done */
> >  	list_for_each_entry(desc, &pch->submitted_list, node) {
>
> [Severity: Critical]
> This problem wasn't introduced by this patch, but pl330_terminate_all() and
> pl330_free_chan_resources() splice descriptors back into pl330->desc_pool
> without holding pl330->pool_lock [2]:
>
> drivers/dma/pl330.c:pl330_terminate_all() {
> 	...
> 	list_splice_tail_init(&pch->submitted_list, &pl330->desc_pool);
> 	list_splice_tail_init(&pch->work_list, &pl330->desc_pool);
> 	list_splice_tail_init(&pch->completed_list, &pl330->desc_pool);
> 	spin_unlock_irqrestore(&pch->lock, flags);
> 	...
> }
>
> drivers/dma/pl330.c:pl330_free_chan_resources() {
> 	...
> 	spin_lock_irqsave(&pl330->lock, flags);
> 	...
> 	if (pch->cyclic)
> 		list_splice_tail_init(&pch->work_list, &pch->dmac->desc_pool);
>
> 	spin_unlock_irqrestore(&pl330->lock, flags);
> 	...
> }
>
> Can this corrupt pl330->desc_pool when another channel concurrently
> allocates or frees descriptors under pl330->pool_lock via pluck_desc() or
> add_desc()?
>
> CPU0                              CPU1
> pl330_terminate_all()             pl330_get_desc()
>   spin_lock_irqsave(&pch->lock)     pluck_desc(&pl330->desc_pool,
>                                                &pl330->pool_lock)
>                                       spin_lock_irqsave(&pl330->pool_lock)
>   list_splice_tail_init(...,          list_del_init(&desc->node)
>     &pl330->desc_pool)                  <-- concurrent list mutation
>                                       spin_unlock_irqrestore(&pl330->pool_lock)
>   spin_unlock_irqrestore(&pch->lock)
>
> [1] https://sashiko.dev/#/bug/linux-130356b0-b34d-4ec8-b462-9a2ed651bcf4
> [2] https://sashiko.dev/#/bug/linux-ecddac4a-242e-4dfb-895d-8ed9e5e87844
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261111152109.1551738-1-sungho.kim@furiosa.ai?part=1
