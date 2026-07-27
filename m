Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010064.outbound.protection.outlook.com [52.101.84.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D66D3CCFB8
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 19:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785179708; cv=fail; b=rq24aCNiYGwGJSjuAJBuLsrjIvQapHM8LqzON7xIoXknLSRGbNMA/tXvC3Irbdp4Y1TmWTb1y+45UAj3usKbh8CUBiDN1QLgNyTw5nlUjYjzovsCUCqSwvX+VeLdg1s2Z8T3G6Dah2hUdMnEKBrNmvToQURU4ePbKfo97Kje/Oo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785179708; c=relaxed/simple;
	bh=+1LALkV2/vQehLJP3mKUHYgJxfVKT7F1ug+H0ie83Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RAyy19gpxWfzNf4mQMeXFeNbZ+HxfBM6S2acNuWR1ewrIALvV92LXEzyBbs/eL+4IeR0oiokhn4BD8EGY1ZJ4Sy7Ng50Ye93WU/r+zwkceB3MQmmwanBSVM51x+iQlnTS4Plj39HN4+qbRd+cZv6yLNCbIH5FdAvz9XeRws5FkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ewfm/zIS reason="signature verification failed"; arc=fail smtp.client-ip=52.101.84.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ewfm/zIS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qhek5D5lansDyGD5bC/jg6Ud3/W/FlcGBT7rkCgunDPncCC6bhNoPMxRQuNzte1+kJ6/nqTkIkY81kDwGEQnGVYm6n71j+0VTZBiVL7TWsi8ywlmorQimRm/dx41DN4Q/1AUh3lUVLblAWPIAjKMW00FQP7hbxA4Fs+zMBSvkuoZDtuNS75elZzmBQiC6g7KcmmDnYq16QLw0uSn5hA6oNJAH9HjZTEP1DzYzQiNKg3AgYCtYt8jMjB/CR3d/n0RR3msqPffj3NP2+iz27C0YK3tbj0i8wBkvXRgfmOvHuRf+v+p3KxDPSPPTNNJN6N7mDUFBfyrJAw1hjPw+l32sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hc3UlCiYNMJ8OpXNpz4RQg3CVdxb+pGdSq4HXBaPZ+c=;
 b=TeQuALEfVg0jKqO6tRda50e2Hi9J4n6jzFqUXmM2GMeG8hpvjsc4OtwLKXlTARNdQdDF1eT/mdCXOf37aXWOQHH3UiNd9ycX4Rms6H9vmASwjNr9IUedKpEKxFiLQ7WwkColh7n41tKgOOdUOOkr7scejFmKORWPCjyeQWAuJsBBrQV3C0bakYJkxTM4dQiERhuAC5gQVqq4qqEdF6ZnDk3E9KKTeZsFtqTXdqgMlp1v6YznUEo9oOzwwf0qXPe0CDwBSdAl2zcQeyduRauHWp4lAzWiykT+xFQNY5zUA6BrNI7ldfV5zy5esG+FCpDNV+Kg2wsd7Hjm9KBdiAaIZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hc3UlCiYNMJ8OpXNpz4RQg3CVdxb+pGdSq4HXBaPZ+c=;
 b=Ewfm/zISYGwqdA+1ZTH8D0iMtcA8QPrSveqfavecJWSHrTtA4ReeLi/iFH6H9uYvL2gYNPpSyotRVhhFG/AEpNKDUUzBCDn3LSjRdxEgw6MDW2DyKHJkDrWc1RUMOesHHfNh7847OCMdvmN230Y/EIbeDOMTnej5GbqWwblzCNTfs82HF9mEPhAPf8KpoN3KrNoc1U1xmBETE2kGd8vQDzFSJRvQCIPoZhDZFPEyGp3UMsnLSVWpSlAweWKeIpt2Ol5FxyQxoJ6IFv4K3phLg+YKpr2gJMI8hTSk84droJHrMiqertbGtlyMWptCYUXsufxzFBvmd3wF55+j57+32w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB7885.eurprd04.prod.outlook.com (2603:10a6:102:ce::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Mon, 27 Jul
 2026 19:15:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 19:15:04 +0000
Date: Mon, 27 Jul 2026 15:14:57 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Koichiro Den <den@valinux.co.jp>, vkoul@kernel.org, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH v3 07/24] dmaengine: dw-edma: Centralize LL doorbell
 decisions
Message-ID: <ameuMbdF6wSvDunJ@lizhi-Precision-Tower-5810>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-8-den@valinux.co.jp>
 <20260727172326.2C5C81F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260727172326.2C5C81F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH7P222CA0025.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: bb624946-de45-47a5-0ac7-08deec135cf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|23010399003|4143699003|56012099006|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	OSayBMEFeWuqz80KjzxjY8/VPZMgbz2opCMvsdOg1vXHpZ0gKR39pSIsJdJhv1BjzWcrkgy2aYgeAGryI64/1W/EyYOvGecx35fRAjf3UaaZQLoZ5A/7VCN7wollcjjQS5mBmszzn5vfEV0r6qfKSg30JaZhjK0c35t/rRizB+VMm4ahc8E5iLmTnnIs52Bx75CHU5oRrqmqaHP+hIDcMCpPPmD6hPkXXxFoKDfEkg/ZJLmojbWrs7l0ER6ocYjm55zgvoBiYXTVtddzMx7Z3bpQ9k+EZeukGU5awdqtbSHv8yxmD6lSEIsAjC1ufaTcf5Cv/UG2rE4N/MObY/fo3oxufezKOzicrsW+xMXKOCIj1OPGF1YhZj9hNl7qnKeV7VTkRdQ9gN5daYw91u7hmpMNr6Xs/N8xxhE3INJBPMKEIUDt/QGaW64NMWgg92Sqqqbx2yBm6GkWBZ/qHxI6/DC9rOoKhSHmxrBpyIVsX2LWp9WdqLcqqjxT5uTN4EVdusNjUMS5Guox44jjdH4gTmSwle2ddFWdoc/z6/jPAIR3BI+04ZPj6HjDGpyMCBhuqQU7tayUXhfG9xChaxsq3iiFplpYav0X2uHmwxMDi9E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(23010399003)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?FdFb6VKJCSU8bLZTY7J4zhY08KnGjV5NMXzDyNWENhY+mcSmU+QNFa1QtE?=
 =?iso-8859-1?Q?EiYgcyMnhGDXHy6Bu9UlPjal1YSjfqYFRfUlkfN+AGhFzhoRXVnMU6hX0N?=
 =?iso-8859-1?Q?EbJaaqmCrg7+MXg7UIzME71Uu10tEXTijrhetUKP7/FX/hyIpTZgFzyvlY?=
 =?iso-8859-1?Q?+ivuC4apwLtiNhodwahVPW4IOWgGRm/ZeYgP3Ht+uqgjQmMs9JRRWPD2el?=
 =?iso-8859-1?Q?vV8BCTrhLToX37A/4OTebQmmVkOUJP9LCMOLsYXq+kmiBVwlRhszuRUnBm?=
 =?iso-8859-1?Q?anwPzwtyuFYhXPN1zkyK+3QanSJfvY4yOYiccu5y/K6JFisJK8q1fTcCdm?=
 =?iso-8859-1?Q?zD1RsIStTLUSdDMwzP9iroZNnxDjzRYd17XNT4bVnVspzO75R3mWvboI1M?=
 =?iso-8859-1?Q?UxiYHBUTAZZVzK5sAa6lfV+HpG94wnYAzzErvc3ToUN/L7W/rUHfLYq25E?=
 =?iso-8859-1?Q?nloyNdoH83VuDWxu+9M+kELOdxCFM+2JiKvJJ5p3N29EGPKG8BLC44Up8h?=
 =?iso-8859-1?Q?1P7dwIidoRxthPBmMqffQSF6EJZ9qgIq1jXgw9SFhi+2C0iSS1Fgm08DXS?=
 =?iso-8859-1?Q?0G7GZwqqc+dkb2kCOMYrDN+zNNp2lE3zDABtiyEWIpszsumRSxKtkd00k4?=
 =?iso-8859-1?Q?/k5fdzjgCPPTbfd0AG171nzu+OlC6pR0J1yeTckGvrFWMGbQOXirzIQWt/?=
 =?iso-8859-1?Q?Ju36Ald63lWmC+1meFTz5oNxI144X19gcIMaJVaSsUraZ4ENPh6sgIfhJU?=
 =?iso-8859-1?Q?LavDm0GEs7X0siJWmYElUDI44if9dPHY/uOIWikcMIDrMY2d+sEoaMRitJ?=
 =?iso-8859-1?Q?vzz/Ilslb8pbWwUZYgsE0DmpNKjgOfmet+h+HkhTv0vSlgFVkMJn6f+qdy?=
 =?iso-8859-1?Q?8r9A9hoVKx9TRKQQA/dr96f1zRZunEhoe4Qbl4OeetwrSeHvrAs+d7zRVi?=
 =?iso-8859-1?Q?VTPYSnkzOD6S5j+q4Jee8tWtRHLOh/Apz+4X1WWN24OLB0LxkNhrtJ9K0e?=
 =?iso-8859-1?Q?ZeOqBanMjIHjgng+7v9aMcL+DI7OLUm/gqDoWbFskm8qKOY1E/9Hf8TlHf?=
 =?iso-8859-1?Q?sASwBGLBwKFHpkHIiRGKH8VU+HxYLC+JyRDPJaOXUppsy9PeLcFKlqFFnT?=
 =?iso-8859-1?Q?rLEcNJGdouyJ2aP69jjhh9pzvV4Gd/Xuxg7joYOis9u7ecDTaIm1pVMk6X?=
 =?iso-8859-1?Q?yk9ewRi2j62D8xstD3quikBDmY3WfecLC5fYeLubAmmuItGINeJJ5q0tbQ?=
 =?iso-8859-1?Q?UdUoh4rcU2qDa5PmnJ06FJ1UDhz84SZZ1ZOEkGan3nhhbYQ7CuLZITRFrG?=
 =?iso-8859-1?Q?MggHyCxPZQhXhetQRSLA4JI2ElgoIctiP8mVVlyoq0EmVI3baHn5bujR73?=
 =?iso-8859-1?Q?BGteil4V3Faw0oOgFSGftQdSwQPa0Lum8auY9+Y48kIN0wHvJgncURHL6R?=
 =?iso-8859-1?Q?UrmJOoj6EOfctskRvzWh8dAm0i3onpF+hkcrps2MtQq7xMh1ALxA69mwIA?=
 =?iso-8859-1?Q?mtb05thNXXs78zNcxSVPwDU6SxL8xcjCheUubD9ymUHvvtj4l/8+c9ufSO?=
 =?iso-8859-1?Q?ggWwJYq80Px3JRrdTJpmLXshx9FwL0OOa+7sZYTCwe2Hh9DgkECEyKf0+n?=
 =?iso-8859-1?Q?M4IoWlqvHg0mHHY1gvFlcA/Aersntf9O4MZ7x/kANq211lIdgPd+37YPRV?=
 =?iso-8859-1?Q?AfW3JQmvEv/N0KNPCOQJbZubshb+8Eqm4SEALJ1R0so/ozLKoAeRl7iOGe?=
 =?iso-8859-1?Q?i8eKyXtMpinS69zfEscPhGHevwEgPEOO9lRpkN3bDH/1IY3oVptT6wD4/t?=
 =?iso-8859-1?Q?UhSBP9qh0MGEO8kWJ6KSE7jRcIO7i+YdReFOmHdI8dPUoVrfN1FP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb624946-de45-47a5-0ac7-08deec135cf9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 19:15:04.2908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iumbfvPzGgRaOkgas2g+m8VXg5/p2MK0CtmcQihapokYZlwIdXvKrsjOzoA0LdZ5Q7fWDVRcg2ZJ7cWCZGlHRksOb4rfkulxJTFcmBn9BNTTfI/w64TFIIFkX41a/6jD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7885

On Mon, Jul 27, 2026 at 05:23:25PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The DONE interrupt handler fails to clear EDMA_REQ_STOP and EDMA_REQ_PAUSE if the descriptor list is empty, contradicting the commit message's stated intent to prepare for LL progress reclamation.
> --
>
> --- Patch [7]: [PATCH v3 07/24] dmaengine: dw-edma: Centralize LL doorbell decisions ---
> commit ee61354242533ea66a01a91592b3314e404a95eb
> Author: Koichiro Den <den@valinux.co.jp>
>
> dmaengine: dw-edma: Centralize LL doorbell decisions
>
> LL fill currently rings the doorbell every time. This patch moves that decision
> to dw_edma_core_ch_maybe_doorbell(), which rings only for a BUSY LL channel with
> pending entries. This centralization prevents EDMA_REQ_STOP completion from
> restarting terminated work.
>
> > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > index b419ff2becf9e..c036510dabcb3 100644
> > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > +++ b/drivers/dma/dw-edma/dw-edma-core.c
>
> [ ... ]
>
> > @@ -733,6 +743,8 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
> >  	default:
> >  		break;
> >  	}
>
> [Severity: Medium]
> Will this lead to a permanent channel hang when LL progress reclamation is
> introduced?
>
> Looking at dw_edma_done_interrupt() just above this change, the DONE interrupt
> handler fails to clear EDMA_REQ_STOP and EDMA_REQ_PAUSE if the descriptor list
> is empty:
>
> drivers/dma/dw-edma/dw-edma-core.c:dw_edma_done_interrupt()
> 	case EDMA_REQ_STOP:
> 		vd = vchan_next_desc(&chan->vc);
> 		if (!vd)
> 			break;
>
> 		dw_edma_finish_termination(chan);
> 		break;
>
> The commit "Dispatch DONE interrupts by channel request" explicitly claims to
> restructure the code so that STOP and PAUSE still have state to update even
> when no descriptor remains.
>
> However, the implementation adds if (!vd) break; which completely skips the
> state updates when no descriptor remains.
>
> If a future patch asynchronously removes the last descriptor before the DONE
> interrupt handles an EDMA_REQ_STOP, won't the channel remain permanently
> stuck in EDMA_REQ_STOP without completing termination, leading to an infinite
> loop in dw_edma_wait_termination?

Is it true?

Frank
>
> > +	dw_edma_core_ch_maybe_doorbell(chan);
> > +
> >  	spin_unlock_irqrestore(&chan->vc.lock, flags);
> >  }
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260727170323.2321369-1-den@valinux.co.jp?part=7
