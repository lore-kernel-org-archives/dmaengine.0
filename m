Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794943558;
	b=3Hadh/w3hascGgS2tn8U9rFy76HMH8SEZKyZUamcGwmXr1e+AeTq/lliJxgBCrRlYF6U
	 pHUjwxLixvMPqnLwIrMMldQcXTh9WbQMJ3sqpyY7ty3vsUyzBU893qA547DKOY1ujNfvL
	 AhYbBi1VC8oYzScsRNqNeCqxjz01AYz/pX74pFTYgmsbv+LthsEhsXs0mNrvWQfTf9Uf3
	 7LcqJSNGWqAcKKhwCKhi0rq+r+ia02kcXZpQXXVjIe/e/OVv5dyVpUPk94E9uiWwhQFHC
	 cOPOQWzaFhxyBDOHqcpBFibWxCoSIWaFdQc2anYKOvZZ4iXL9LxQM4GeOLMp87BJH7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943558;
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
	bh=oEiACTb3Tt8j2UJ7hb7AMg9dk08244tc7ii64TuKb9M=;
	b=UtGeLXlybplz/TwS7womH1GbpLBYagW3SvUdml21hVYKwhFvMGiTgssFI9llyn25WzSa
	 kQ8T4VdosTBhLwkKyX27Mw+rbLxVJ4jqXZu3HhEm0FWG2aNdbSqnC0tGWWih2Zxwb9Moe
	 0a0yK4q0rEWWBWRUC1phjI+gC4Nc+cMVIbXF002Y5ItyqcbMprMzNFvquVCBmIi/LSQhQ
	 CethLNMWOjg7L6RriyjVFCH7li6bobSg3XjaHR4XmjGRTXJWmQ/caoHWNE/wmacehEsDl
	 88AtCDTpmDNE8gVVuezgaFmbAZlur1eNznKmOraLb+bbxcX2Ws4kOS8NAn7XS3xIwBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uFqKAL4e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.62
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011062.outbound.protection.outlook.com [40.107.130.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D79606A31C;
	Tue, 17 Nov 2026 19:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3D79606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uFqKAL4e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VurmxH95j4JS6my9NQV6mi2KG6VzChaDrlfs4JedHzvP1d57pMSjPBxPES/fT+bC/qDmrz4WhrGmc0ecmGgEuLO7+RsVo5k4q+KojSP0mH5sppNxLk7RlSB8W8o3G5U5lMer7UY2/pujON0aM/O7Bb5cyaxXjCLWH/ViaRnUkbs0NUIriiVXypjR+PK3MdyNHk0nCGXoWxaeMuwgLOeEw8Qn8Erzlm890n7pHUu/BXep6p3bpD7NBmSHxXshLmgqGpepv1dW//TItF09e0lO5R/4C8lROBEJU7EInYjhBGIbjxjQf992SIbWMa0Co4S+a3nEpScWBiDZ6wFhRqeh3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEiACTb3Tt8j2UJ7hb7AMg9dk08244tc7ii64TuKb9M=;
 b=k5Dtxd2pFdUbZ2jHSvDC2KOGkMYEpXBTz1+Kw42JwVBJ6+0HzyHGOS+CuSHcXf5fKKjVI8ikQxO8owywJ7brrq/9r8gTdoMq4IGNs8mbljOGCmxPXUrXvPri+6rT1MD8RTCC+8WynzcysF18RQC7SzJFGTKOKV1eHrNrYnyPe2Kosn0t72QwM88fcNYPhQ9+SyEvsrBDOBrtoJiuQiCsduh7cS57OfjNQmdXnq1+UqnnldsTa12i1JZcfMcBRlr8sWIwQ1+PWzZV/tFLqZBlOjivyLcl8nfMOEPGzEOrPgSnMCGm8fziiFJBAzDnBpBRIG3cgm4yx42qz+OlwWI/xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEiACTb3Tt8j2UJ7hb7AMg9dk08244tc7ii64TuKb9M=;
 b=uFqKAL4erHkRT4po/Kbo8xfhGtW4lNoWuRZV/6QB2gfWEqRdbPj+lTubSYx3Eg7urT/1cJTBjWNsq4b2s4crAsyL+bYNf5d6nfdQP99FusZkHQg2CsTBLtN4QSBV0tt1w1FFAkGe+IcFV+PS+GODBIfCW0K4qpW9ZqgtTvWyuA7HFWATV79TPLE/lvNhj1f+x6lawc+z7DVyWiRQkaAeDqlahjBOVhBMZnNXSoVNguxb1u6oBEucreB0jPZ8FeSizgg6Frh/EeV6HXKRfncy3l/8gwXjJteaRTP/vIcfLumKu2vxa1orf58Gg0+DMmU6FPnubilc1E84lMm8ckL7bA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS5PR04MB9944.eurprd04.prod.outlook.com (2603:10a6:20b:682::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 19:25:54 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 19:25:54 +0000
Date: Tue, 17 Nov 2026 14:25:46 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.li@nxp.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v3 4/6] dmaengine: plx_dma: add dma_rmb() after observing
 write-back status
Message-ID: <avyqOgwLE2B5rQW5@lizhi-Precision-Tower-5810>
References: <20261117165135.746241-1-logang@deltatee.com>
 <20261117165135.746241-5-logang@deltatee.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117165135.746241-5-logang@deltatee.com>
X-ClientProxiedBy: PH7PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:510:339::12) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS5PR04MB9944:EE_
X-MS-Office365-Filtering-Correlation-Id: a16f20c3-06be-4048-528f-08df44e09901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|19092799006|10067099003|4143699003|5023799004|56012099006|11063799006|261021121427099003|261021123027099003|261026121527099003|261022075727099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nRa98X5PzQN/ttCzP6JxDTHqLjWIWaNSiWHJsHXff4Zibo/XKtmphgcn0G0d0vIyeu/6SQPzgzdaRFlX0XOlgCA/RIzvrIrDgg6OHrWUnc5MaoBA0to3b2SyE8BjpP28yMCW0AYuIxl1jlWfXBMbaFwYeKxgPQkQYN0Oqbnl7SQyyH3ck7NWhOxClHcCrh441g8xFa5PdkMmuWZoFU8HVpapHe63TyPXcg+NwsQvDHOYTrFxSNrgqOuYPElyOsJ/c2AyzTthShGDB6RaHebygDhkJo7Efuq8nElhFw+Fz+An0I1lwJtwEg+/BjbZaCzcMvFn88v1t+Vw2lZsEsrOiK+XGjj1NgpVoH6x89SEGue58NAgHdX5LgHht93NQtEXWrivSva+GtcBrbTWbF5nZZ5NJaooZS4ZrHMKk7ZoS0/z24g42lNFffptUuLFdYxs9I+yVdLZe9t0jydBbUhTQAOPq6wS5PUptiM3Z0vLj/T+VgVtToF+UMt36FALZnhreFpD/0p8ll6I35Cx/qR3p+YFH19pdYPGf9hlzHP3+f6Ww8L73gxN2Grdie4Qg4kIPT3JMh4oVDMVUR2oZImlA4S72/Uxe6excYCmrmFPHhg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(19092799006)(10067099003)(4143699003)(5023799004)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(261026121527099003)(261022075727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YV/7emN3ceNMGyqNCj3lWlhGFXvK82hBuxesGM4KmKL81z1cFgWBBcONfOz6?=
 =?us-ascii?Q?/ZhrMD0aq6WRMcP8pBPfUf8/fY0c6M+OPWcI9K2uMIMkM1z8hyJVNijFc09/?=
 =?us-ascii?Q?eSSR0dgxsqHX7JZdwt0XyWqX8Rz1tAH23f0pfSLrueOkS8LdNHr6MwpQLU6r?=
 =?us-ascii?Q?8ew81bjnWzcZK8G6nd5q1tN8Xkhtjc02pYRGMEDov87YKJvbXg9XNePuWnXD?=
 =?us-ascii?Q?wDkH4MIXvYKijVuiX0N3vk2f0skNj/eiXR1yxOBbBTfYmMVfgL6lfpSfrX3U?=
 =?us-ascii?Q?Jdbdxa6scW4IZX2fePNSfAGCMt4FqGMaj66RmVvQJ9IGJNbK7Rxrf+JLqpLt?=
 =?us-ascii?Q?kNja1FiPOTmV+MVFgXbMZPf9/UrA1h/4uhHPuQ/WhtJlp1eihV/KXvU3t59r?=
 =?us-ascii?Q?W1dbhL8xHZ2Qvo4l70y01K0MFnRzoI+t03HZcHEyoYCmrbJz+tefKjq0kHz0?=
 =?us-ascii?Q?pBlp19LkniHmwqO0CcXUzrAkPgweUz8fOFcffK8vK4dEE1Wp6ppp/JFmL4l3?=
 =?us-ascii?Q?pvRZhgW4iCXlHkWqmREPMNETFNCjG5oMrtpfdPPMdnOSiIQZQbIz26fGGN1Q?=
 =?us-ascii?Q?qLFIsmY7A3hSr8v0WkrQ2TJKb9a1mtGdny55I2HqbMll5Nrf5DJJt04rw/zf?=
 =?us-ascii?Q?zLTjFYtXJTonAYreT/vhzU2xbAVSQtrp+wVpqvb5W5ZnTywulNo6X9rLCPus?=
 =?us-ascii?Q?znOJ2qBDJ5cBDfNrlz4ZVx58SUhOyEJLEiu1sqgmI00rc45Hr9BRS4fI3I4b?=
 =?us-ascii?Q?pp4RCRtmUsmzJoYJXOqlbL0eke9ygjuDoTgby5lUyvvYBkO/62PEuhmR8PR4?=
 =?us-ascii?Q?tTRHleoXcFr6YX3Anu1B9XOuF42cm6GeoyKIQw4aKkzMRGiit3vE0oTnkS2O?=
 =?us-ascii?Q?jqthFb6ag/M8EbNc9DkDP2GCVLZ5jSeUA4XFH7Fwr4kAfNzzuA6w2MPso0DY?=
 =?us-ascii?Q?cRTO2mQ+2cGGvyvyTb3zHRfEkfbJNZLTHZdT9DoFcPn7FB6uiYHs9ZUBikre?=
 =?us-ascii?Q?GlnhVwo1mEaGpYq33hd3PHAlt+6/KCnV0AhfrXKX97q+2d1GpHuVL+Vy0BGH?=
 =?us-ascii?Q?yzCQ2kxUT6UfRyuNBOOSpJJpuhhek49cN+EcCafcvEkIcGP5ZF0crMmhOVtV?=
 =?us-ascii?Q?JIKFpsLBalr2lJ7K3wTVrLwIuDbc3Sp8kVgTuz7P62CaB2xqctmskKq7Vi4O?=
 =?us-ascii?Q?jbzAbunkP7lCM1Je5gBcKmd3XqoRVeD+Q5S6jKyXojhchLwa+a5PBTTGrd6g?=
 =?us-ascii?Q?E1r87fy8HXxgD63UOqr4WPJMR8c3mWlJYjO7M9fAa7otplnSGgD5+sv05Xco?=
 =?us-ascii?Q?IwXqVtQr0Rkmf/XkH+jncESd8VKL8QIELjNe6AT57ONSweuKEssEDrLSmQaJ?=
 =?us-ascii?Q?Evjk9jibdBLjfAz9hgEej+tRQJDjkXiyDYdpWkXBULWwTv9PEuMus2t5gnS8?=
 =?us-ascii?Q?JtuwwJNlzdQFM0sFJny2Xj4gmLZitWsk3KHnoM5+Mu4HkT5zc5PpM61ADTB8?=
 =?us-ascii?Q?65MmhCLVj0hlh7GfrBFcLcDIeupmj9UXXCOUsmKwOHozYezhOtwRo8ICgy7l?=
 =?us-ascii?Q?5a25iXD6qj2H4/QSx4XXDOFG1k9DXcU0dAdFXTe9/tXsBLaKcZllaN7iBhcN?=
 =?us-ascii?Q?/GFiDuYovZ40iFgNDm2U4ac4VmPtKoe/OCsuUgSOrQAbyMF+CU5mQPuJoI3N?=
 =?us-ascii?Q?XnJzwLSFVaWFiFXH7wpq9nzK3bWKbK+EE+1JCn59Ccns0CktusApPAcaiu/k?=
 =?us-ascii?Q?d+3Hnpe05JOq2yzEX90Kn3M9CWCVAQn5F0NCA+L8iH4Zn+3fsZBw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a16f20c3-06be-4048-528f-08df44e09901
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 19:25:54.1107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wodyk3ajCtlKvhewn/Gxb7Ndw4tEYx15Bob5SEt5O68OHjPYTyoC078uOVc7Q3Gpqj1ynzYvaOVC2WJKTko0FkGp7QxaP/ZdNmnvG5YB5N6NiuN2p/pF85DOMc0Z4S+L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9944

On Tue, Nov 17, 2026 at 10:51:33AM -0600, Logan Gunthorpe wrote:
> Completing a descriptor involves two loads that must be ordered:
>
> 1. Reading desc->hw->flags_and_size and checking that VALID is clear.
> 2. Reading the destination buffer, which may happen in:
>    a. dma_unmap_page() via dmaengine_unmap(), when a bounce buffer
>       is in use.
>    b. The client's callback, or its processing after polling with
>       tx_status().
>
> On a weakly ordered CPU like arm64, nothing forces load 2 to happen
> after load 1, even though load 2 is only reached when load 1 says the
> transfer is done. The CPU can predict that the VALID check won't
> break out of the loop and issue load 2 early. If the device hadn't
> finished writing at that moment, load 2 returns stale data, and when
> load 1 then confirms the prediction nothing is redone, so the stale
> data is used. This is the load-load control dependency case described
> in Documentation/memory-barriers.txt.
>
> Add a dma_rmb() after the status check so loads after it can't be
> satisfied before the status read.
>
> Fixes: 4d3df16840a2 ("dmaengine: plx-dma: Implement descriptor submission")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.kernel.org
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/plx_dma.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
> index d3b814933989..7af29b901bd5 100644
> --- a/drivers/dma/plx_dma.c
> +++ b/drivers/dma/plx_dma.c
> @@ -148,6 +148,13 @@ static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
>  		if (flags & PLX_DESC_FLAG_VALID)
>  			break;
>
> +		/*
> +		 * Don't allow any read of the data the device wrote to be
> +		 * performed before the status read above shows the
> +		 * descriptor is complete.
> +		 */
> +		dma_rmb();
> +
>  		res.residue = desc->orig_size - (flags & PLX_DESC_SIZE_MASK);
>
>  		if (flags & PLX_DESC_WB_SUCCESS)
> --
> 2.47.3
>
