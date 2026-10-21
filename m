Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792601136;
	b=QDghoBVdC6SAUGIpu9esCTwnflh7kiLa0mlGWTe0jbVkT5+iHzk1/XYa5wZXlKsU0qvv
	 37JO8ryMtvf3TSPxSwe7dD8PK7+hpLeCh532FkxfmelWAM4hQWpB7YN5tgbWnCziiFxg4
	 3qXH5gmy990mzb6wB5VzAMz4x12CZDjSHETOx+ynH9MroU9kv4s8+bgOAgWBDwTX9//MO
	 4ZiU1ZdCobo6qNqfuokLxDf5sO1XCniV8G3uz2Z/JLoBnbfgiJorw4VQA6DpIJt8JqBXj
	 KQyCWk3JXJTNvtKjzzXwC+0NdakrkZTPeHHqpm/DUqzgxbhtg5smHuO9OOiWFf0Fc8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601136;
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
	bh=+GGlFxm9wZXtUIJyfP8nmv0fMVv++fMy+9r9prnZqUw=;
	b=edvtLjtLDDpjYGSdL3Uwc36pTzdt8bRplygtGiMmtRhJLRbCcPSeP/wzCvz6LTGGG66k
	 b/93+9E4nlNBUEyGF18PObA3lHQ1tia/Uk9LsSiBJKlNMvvIwapEAF6lxAbqJ6AsQF8dK
	 sRwtm64dzPNghiq0agI/rgUtsT86Bqeemd6lSW7IH9WXEBM7cns82MRC254gbKitiaOc4
	 ZKVoMQEI58yOTjQ7h6Y3T12T9VmOM4fCiTxvNEGlek3NeA1o/NUGgie2zTw80JJA9AJuM
	 5fmtE45KQiSPrbuHHjHXofIfP+IgowpdrrsuCltPrA6Sc7C10SV4pI7HeIPHdOpFq2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=khV51Q9t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.49
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011049.outbound.protection.outlook.com [52.101.65.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C538E606A31E;
	Wed, 21 Oct 2026 16:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C538E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=khV51Q9t
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LirP8ROAA2fGkT4Uosw257RBoqj2bsRD0AcqLG8xJ3Zlj9mX6MeBMi2IrET7oWg1OWat26vO9N2jN70Pt6wSvRprQDYKW3Zxm9pld1z2lu2YXO2QBYjQDCbegt39NIp/MeaQ1CulxB8hEzsD1LoRJi4spzk9O2NZ95+89xqzdyKIvWdR4rqTqja47QpnKmxN9+TKhZK8bTEVtTpc0Y3sweoOGV4dM0wm3iWhl+O5BbKBGyuzhWBuo2eCtubQkOFkuA/kI8ANMs1wdTk4zif5pjXx/PmB5V2GjMG6iZK5xh4vh2KZBISrEBDPtXvHfUKdVZ755L/e+5QvchgCpIM1yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GGlFxm9wZXtUIJyfP8nmv0fMVv++fMy+9r9prnZqUw=;
 b=PrBcp8JrjrzUEyVcYRS1/vJRkF9aS4tpp5ekX/XOuvKqCkq5Ln1X65E8s2hxnAQJwLFrjBp+MgFT998WiP3K+dKqFtGSDOwqBfK9jU3ga7lpxeC9+i1guo6H1f4+P8pgDZDe/TVcxRdZAiEcaIZyhC/3dwmUMjLlDcFy4JlyCHZ6mXuXlv4vDYwpu+L6KoOYfnl+FGgF+MdUXWJCD70MFiCJ49tcFEi3fjJrI4l4eJQE6pQld31SN+KFTNEk7PX7BLdAFeKJuz8soxVOh2Uc+inaoFuFpdwiwU1FwzEdTb/pGubCgr3YTzjrxav5H6K29QwfnQci1RXmZjZdiwtTSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GGlFxm9wZXtUIJyfP8nmv0fMVv++fMy+9r9prnZqUw=;
 b=khV51Q9tu3nLYieMg56w/Uj0WiTbL6QFHeHHCHukanIMKeC8FizfMUaREiPZxm4P1zwtcYIwOMqaGy4J1UejVX01/lYQDrw+vCGFpWKyJvjFGa9MM2nCxmloBI9w9gFYSceng9sn5954SqPzecI/z6SDZxX/Gja8DZA9pafX2u579/ymTk2zyqVsRRiPn0SjE0WHOzDNiVFfg6vZ8B0E8mDHcrV4KP2UwKjk+OdIk9MwgupLXbO4/wyoKgN6xVDavZ03aFlwc3MWXh4wlSZ6NpyDTkCOO0J8nV2wmByhFCQMeHj3YL1SufC7FlVn8S9SetnO8TFGwvws27iPrX51wA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB830997.eurprd04.prod.outlook.com (2603:10a6:800:364::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 16:45:32 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 16:45:32 +0000
Date: Wed, 21 Oct 2026 12:45:25 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Roland Dreier <rolanddreier@rivian.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dmaengine: dw-axi-dmac: Report failed transfers in
 the descriptor result
Message-ID: <atjsJZtvrfcmNcQW@lizhi-Precision-Tower-5810>
References: <20261006-dw-axi-fixes-v1-0-3b319e456d93@rivian.com>
 <20261006-dw-axi-fixes-v1-2-3b319e456d93@rivian.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-dw-axi-fixes-v1-2-3b319e456d93@rivian.com>
X-ClientProxiedBy: PH7P220CA0096.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::25) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB830997:EE_
X-MS-Office365-Filtering-Correlation-Id: 1daac256-d3a2-4d1c-00eb-08df2f92b8ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|1800799024|23010399003|4143699003|11063799006|261009223027099003|10067099003|261021121427099002|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	clc/FzHEc+EaiLMEhGVtpQpwEJ/NlEDwQh8MLSRLeF1XOFyn5T1MX29a9eYRp9QeKsGcc+5nnVoTzH0ls1fJXRjXshs3zReKQIlyWRvqVa+8arySYm1mcQpf6i/krbrI4mmqszSzc6wq82HNCvZ2B3txuoinAM6LEAocxfZHDylB6k1H/WDBKqXqDU8PW7WxeuNSE/Q/hcAeOtINzDMUWULznBsXaTUrfdyk6kTn6c18BDOt/0PFACFrzYr2EwONRWhJI0/HD+Z1wkuZDGMEqEmLkR+C98KzUzbSz+8z14UivyPFbj94/O3jLJpRM/I/8IstHywUdYTkBlmN0m433cvCpYTmErdGt69kf7OaxwEWsdEGBPH8746k/KP2UuMzW+lGtTzDZ81myh3nmqUTh5qjkAbS6jI4NWoHMMs8qsjX5yYC3QYNcMuqMSvvDUd0ZE3ESrTvQbeupdegvn1caHtBKUxVYkz1MWXrazqX0H7Mva2Vqnf6Sk3eC/Bx1LI5VYDHrCR5dX/iBs75Qv9DaBnFPbIjSC+LN62t19ALN+LS5I0p/9D74jD88NI24fBy4k8s8tzGMKXBUjIljXT0Naz8Pt4qC/Txy5yPbIPqlqWGxIy06A0zZzkmz1GtEW14krRIfY+KNVZQzSv8+nWlcgm/3FUoitU7+T6VzVMVKgM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(261009223027099003)(10067099003)(261021121427099002)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3WwQ+/xJ/e4mWcdpUZ1fQFUp9d9QPRA/s3PUqWJc7LimBRjAzczrRP/AdVLa?=
 =?us-ascii?Q?chat0MGwiq8tHBWjSsyha0zH/wEb+QTb0tyyc9BeR6FlYyanTrG5Fq48hRIi?=
 =?us-ascii?Q?MbhrAtzMUjQtim+YPHFndKnxmeMiJz6IYFL4jQfPey1P9ksEeJND5BfE7lYp?=
 =?us-ascii?Q?VZgQTtko26h99sWu9V6N+RsITAknxT7ZKKPLSzz0NothzciAlgrDBV/0zmDw?=
 =?us-ascii?Q?pg2TDZEcGwtps6B+vPvrbFBXx2Pj2b22u2QSnZjZ0/dN3NfdovIKZHzOWiSj?=
 =?us-ascii?Q?h/I8nCQ2ucrmH9QVJhfyhw7s/fFuee2/rXo/r1roXeu/tDhg6J8HGeQY/QAd?=
 =?us-ascii?Q?xJQ1XAU99lexTIr40gWA35lMIneA8hlHQ6h/KRE+hNoUq2/RO7Cta6kTbvcV?=
 =?us-ascii?Q?SQG73ffh2ORBCLqtNuJ7EbynBJDkmC5WlHLGz4PgQwDGB5F1rlU5WJiyjStN?=
 =?us-ascii?Q?2nSk/Q26u6hnZN61lMhRon6XuJbd5zwx3iF0eZKoOJLcoeK4xltUlzjXwWsW?=
 =?us-ascii?Q?mPucVs0q9eD9z0wrYDEKjiHnX2Oyz1Hh/1VEuNlJ1qTzre9Nysd9M+ZcG9YU?=
 =?us-ascii?Q?rmV56xGY5ePfQxE8T7v7QWIHrL82+WaLpElJD3BeEhMpV0Yz9J7SXGQKSDLD?=
 =?us-ascii?Q?CvgCF6tjL6T1YbQjRXjprsG8uwTzKc0VccQ+uwZnEWfNT4dT7sFt3ZJs3LJf?=
 =?us-ascii?Q?i/nmWEudn522j7xOTg9y6uG01SIpcHY8hVn1fr2xoya1YnezzJmanH/KPVIk?=
 =?us-ascii?Q?H3/TCN4IT/XP/fu5NkBgiUht31GQ8s33LxdlI4fRUMykMG88G6dP/RzVC5Hy?=
 =?us-ascii?Q?u2UxoXkAs79mBKKdppG9FZ6NILepEdeenDw9wbe90iI/4Uz+pcAaMm7Ykj6m?=
 =?us-ascii?Q?oG6O4RG1R+bIFX8spKYpa4w3UH4dSTgv5uecMK9jakjECvWJKO9zNgcPBhBk?=
 =?us-ascii?Q?K1XW4cyxjibLcQL7dI1Z0SCUlT3DNSGSiPDgG20X/vLYj1pKHrB6Aglhbp/l?=
 =?us-ascii?Q?wZNoaFqc2mD4cC1hiDHrw9mNUcBEBY0mx+xM0/dl0E4gqt3PCSAPqkSk1rh3?=
 =?us-ascii?Q?442ubwgkbtjUBw3qX/J6znvw29RDR70eKco2ZAXoTrljubORr7T0Si/Nn6kI?=
 =?us-ascii?Q?FN2n05HwV2V6LWgVYUI9wUUFcJbNGTSOCMDFfdEv/HHnJRG/wI8PUtd/4JEs?=
 =?us-ascii?Q?v8JhzPy72CVbJGYkF2BgwfyuaRQs5Noo9kpSxYrlnCFjLP1FwTu/TMQ2kP5R?=
 =?us-ascii?Q?ACcHidqNEf5DRNciNErOIk/vO2blf8GaZtBRhovoTO1BqbNSFRylilxiC8sF?=
 =?us-ascii?Q?4fKaLO0YjoNXhmN4dCXwH+y3qVLYhtnipWAW7ho9FRXz8vqK0HbiVncC3EjQ?=
 =?us-ascii?Q?Ah1BACEc0tPSPKo+TaZYT3KlmgS32NS2xa/iRWq9vzKE9R/hZfoLWCn9gXZD?=
 =?us-ascii?Q?SUL03NkiBgc6nV5hvg2PXlVYOV7Jdwad5VS/8U5g4mM5n0huTpCCRC/J5kAT?=
 =?us-ascii?Q?tSf6RNLy2GUtdcvY2gjsTNKCND/cdTiWYALefk5EyzU+EPNZj5gROv2wAuqh?=
 =?us-ascii?Q?w5Eu/qsLn//hsj6mt2pFRukmoGXLP8F6fOD9KOVHKEWnvPPDrOZ5qjIA/PS+?=
 =?us-ascii?Q?msHd7RfykWANnsX5fuV6k8MZVNtpF9xJ52jMfb1M2N+ptowt8kchzcgf8Z/y?=
 =?us-ascii?Q?ZF+SspmArugd6PdhTbwr4yl3ZDCwO//YiaPsjOQtuuiVAEVeOxU+Ub0EWt+Y?=
 =?us-ascii?Q?eAqueaGss3R+/Pt9GsXwKQkFNp5Og0VJHhoSdpZbJJjxeRP0vjlK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1daac256-d3a2-4d1c-00eb-08df2f92b8ec
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 16:45:32.4932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9arsn98inUkL97RcyCTigLcXFDQIQfELR6Q3stz4I87E4GiZUD0ZjnPiSbeSqzG+5X44TbJSalt9zy1nkcBVOHIM1V9q9hKob3FA2SC8itpC7K7CiafMCNaFWO6wakGa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB830997

On Tue, Oct 06, 2026 at 01:03:08AM +0000, Roland Dreier wrote:
> axi_chan_handle_err() completes a failed descriptor without updating
> vd->tx_result. So clients using tx_result always get DMA_TRANS_NOERROR,
> even for incomplete / failed transfers (bus error or other reason).
>
> Set the result so a client can detect failures:
>  - DMA_TRANS_READ_FAILED for source decode or slave errors
>  - DMA_TRANS_WRITE_FAILED for destination decode or slave errors
>  - DMA_TRANS_ABORTED for everything else
>
> Assisted-by: LLM
> Signed-off-by: Roland Dreier <rolanddreier@rivian.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> index 813d17a278e7..88362f181207 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -1084,6 +1084,13 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
>  		axi_chan_name(chan), vd->tx.cookie, status);
>  	axi_chan_list_dump_lli(chan, vd_to_axi_desc(vd));
>
> +	if (status & (DWAXIDMAC_IRQ_SRC_DEC_ERR | DWAXIDMAC_IRQ_SRC_SLV_ERR))
> +		vd->tx_result.result = DMA_TRANS_READ_FAILED;
> +	else if (status & (DWAXIDMAC_IRQ_DST_DEC_ERR | DWAXIDMAC_IRQ_DST_SLV_ERR))
> +		vd->tx_result.result = DMA_TRANS_WRITE_FAILED;
> +	else
> +		vd->tx_result.result = DMA_TRANS_ABORTED;
> +
>  	vchan_cookie_complete(vd);
>
>  	/* Try to restart the controller */
>
> --
> 2.54.0
>
