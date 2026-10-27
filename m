Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793117876;
	b=3XyX1PSg0mQqDdH13ekjITwDN3kFGuovuAjNYICF8IHuXFjgbS96375xAOzvbhXzKRjc
	 RBOMSfLL+TP7sfgyYEzyGUKC1AArf0Aef8clzrc3C7Ll/JcTErcgOCG9Yf82ifEgfmAOD
	 so3GrO2ZQ1EWGk9o3H2VBljCZ2Klg46dAsdVlWs+6nAvcfHSzucgZePMHarxcJkaluQCP
	 PrBIlJazoMFxufPEvhbdRgY5WA7MuTRZz+LukGZ5pzDuZA687MlmRV/PNUrNDtf7CM6FJ
	 J1CpdNDNOl8MziN8+ZDS8I3HDPDU8QxsI2kOG34P/BeFoPuXE31ttVImKLo1FWxczVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117876;
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
	bh=238m2E0b1By3jUvmcQFbpskC+qfa2mf8FJHIGXPBWEc=;
	b=dVcaGedJHURp6mlCVWe7T6RkPOBLqhbd5sxHrln/18/8vDfI/ZYPByl5540UaQNYaPu2
	 KPA/T2tM+C+P4xcfNMF5lfF+7ZN/CcXo59/3nQ3WIQT/jpUv7wKdkYsdBGjvq67/9tf1K
	 4xlMUqoDeNulpEOPMR4b+cOfsQ2oGC60kWLk/YuAzTchlDijB6IFVHhm2CO/HeHgNo04a
	 wwd0dZHJdIVsUgdFQabP103A00b6m5z4tWGo64LThLdJILAu/NG2AB8qIS00E+hlB8ARw
	 IrZNPWQF3G5EMihlK+t3cJ72xRg47gLcGJl9PHZ+8pmpgYitqyctJdVwZHatwy2Jlsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mygeovsg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.8
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011008.outbound.protection.outlook.com [52.101.70.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0605606A31A;
	Tue, 27 Oct 2026 16:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0605606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mygeovsg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHuaLXp34I4piqU0rZ4FXRiJgstFVC5KE8F8KllhLFdCsOtg++pG+N3KGc3z6I1gpr7G7Pz/+8Rwm1MnU2oQhLwVE/JYuOEv7Wn5afcU5fM0/3yA/TsKhZZSaSWqA/gx/EDWLsy0OyR12Pp+xJpfaHJBBzybKOPoHVAxUNuCj6q+OHotbLuhlQXLJPXp98LGxnCGq8Ps/w+As5GTSfxkrF/hcR6R68fQFUG1NkIJO5wZG4fZOMqUv/MRFMnJwjG4SnZG9hKNpdz6JwCUAaDT4sZ7OP3QxPm0NWCR8YEtkfN5eOY5uYZfkXLxy9GyyI8x+HPz5SJDtir68QJkMLpyBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=238m2E0b1By3jUvmcQFbpskC+qfa2mf8FJHIGXPBWEc=;
 b=m7k/9KOc8sw4YPy+vh6v2PC4trmVAnbgqGw9HF7JPSiNaORjfdSFVyuYnTdgE3gd5V3Qds4dh0WZeCU0jfmwpCJ0y25nM4SuSBwdCXS645WaU6K+LuJRIovuNfNGaG8BzcjQWzKEgsR8XjvQnXXoRYd20+FusTg24FrDweBSLVd00cRCwQ6L+gfNXVsBuopxRd3usb+r9dpzeQQAmfnbCh7utbHdcX/468+nlwFaD6Yt/3JaHSRPMRr3Cj96Mk//Q4FZNjvD574p7JrTxSMMmFZrh8sCmdAL3FkzhtsIzxAIqEqwrYK+ecU4akZXix8JhYPLVaw5MkAhrUo5RM8GYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=238m2E0b1By3jUvmcQFbpskC+qfa2mf8FJHIGXPBWEc=;
 b=mygeovsgoDo7noJv04fEDFeCaTwzQK+GNVkjGlBoMd4cR736MIQ78e4zPnOeCxAP/vz405wmjzGm/MqZIGEGqv5oPEpAeBc3ZN9nRo5la158jqL56LOtJIWPrxt6Yke2lqUelZxRxP/lzmnxZBo8q0V061C2aV1SyxB9/odDNPmRcYrB/d+8WAaxogFCOF8YycX/tidyr6M7xDKSdRVBuWfdScDV/TVzHixLoLB1FNtjFL0etr6Wvdt1A6QQZuvXqU3nYbN+24XqDoevPUToUaEptXtGbfZ7CoNJi1xusHavi4shdSdaAzEaXWkVOTvO7tJpxbFw4BbZKCSxpMsHaw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB12031.eurprd04.prod.outlook.com (2603:10a6:800:312::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 16:17:51 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 16:17:51 +0000
Date: Tue, 27 Oct 2026 12:17:44 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: mediatek: uart: synchronize completion
 callbacks
Message-ID: <auDOqLln9_ra__hY@lizhi-Precision-Tower-5810>
References: <20261022-submit-mtk-uart-dma-synchronize-v1-v2-1-fdaef0e2edd6@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-submit-mtk-uart-dma-synchronize-v1-v2-1-fdaef0e2edd6@gmail.com>
X-ClientProxiedBy: DS1PR07CA0017.namprd07.prod.outlook.com
 (2603:10b6:8:44d::14) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB12031:EE_
X-MS-Office365-Filtering-Correlation-Id: eb9c973b-5dab-437a-46a9-08df3445d92e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|1800799024|261009223027099003|261021121427099003|261022105027099003|261022075727099003|10067099003|56012099006|261026140227099003|18002099003|22082099003|261026121527099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	0CL43RHcpirsqnQRYa0v/gXtSgSrlDhZj1H3VeJPgzYDdRJQvuYUwplUqXV0mwTMAinX1UNmeRb1Hmhp1KaIVRd30XHR0oc60lA4ffcFUXXD0q2LQ4is7Dndy+5MKf/7VgFBPSBy3blCsBWafapX61nd66PbgK2dtWS366zDkauvOYzPEzJ+4njO3q48KENajk9UHs0tPDH5ktCNJzpMg4qQ1EfrHQuMj751Ti7e9hNm4qPH83lIyzXNL+yXjob5Wx3E5W4459dREdLtgUUrGHUWfJCyQ0ikKSTf0LJtKdZCanXDBNynbl/4Dg6fgC+Sc0r8qeKdN/ZYqFkHqqGuaS/65krbcrjiQ+C9Zp+9xOH+GUcG0djFRwUaWrgnE8Oz7VqCCDvHpbszqZlttdCZJINsecXnRhVXiKYxkuy+djxPgXycB9HRvmX7GPAOP6V9lnpeSNFr8e4VvEiMn+S8+GU8m2w5SmHBPnHhyTIuSBR/IuqOF05x83u6PFbgk8vAIE8UR8u6buys5BTBRH4oxkCvYjyEuhI2w5nUs9FmK/lc44RvL34pGY3r4VXgsrRiKWCaq2eD4H3GMKKWu+2ir+rd3xx0OeA8/3pi5L2B53vkmjckqAdcaiWAc//8W2Cu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(1800799024)(261009223027099003)(261021121427099003)(261022105027099003)(261022075727099003)(10067099003)(56012099006)(261026140227099003)(18002099003)(22082099003)(261026121527099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4/dKmwZwFTNpFGlNxbUpp2JTEjl9h4yjwMoYXDPl5vkqF7yikX1PHpbHC1bl?=
 =?us-ascii?Q?hIc1GJOHODl06KeLk6h+vPwMC71ItY4O53nwQzN70K4RJA438gl5fMMZv9Gu?=
 =?us-ascii?Q?C19bK37Uek7nLKn46EWQsJJx6pJe4uwu9YRO+u5C0xmhTd9H2ZA3kyqKvVaT?=
 =?us-ascii?Q?d8r3yRkvMdkwtuUYkxWqAhIwVCrMtItdTz7rPuMFJmaC9sT85l3OoOKFE9EG?=
 =?us-ascii?Q?YP2jH03z3NruswNuBdDl/zW1OkninGtqrM4svgC3G59iyQ+eOk/ZL2Jk3Rft?=
 =?us-ascii?Q?TvgnYZt/N8q1uKlTyjaEtPo38u7KEkoJbaUp0y+GmNZB2IJwZzvGxdNzUgDn?=
 =?us-ascii?Q?u55pB7O8YC9zfsakDPLZr5VhoZzKjRZZ5ohZJIX68YJx36IhPq9HekJgbIm6?=
 =?us-ascii?Q?sA2Bvrw+N51d1Gt42/gt0+8QT0vHJHZu5woLhz2p5WqRNVYlOMs2myT1ucy0?=
 =?us-ascii?Q?UN+sZMjOsW4ulan30SRJ0z1nWQZ54YyoTGSDsin47BJOSWJTOj5utcl4CWfA?=
 =?us-ascii?Q?7p2VzPy9TuMgL2q2nnmjJgPY5rbO/iU4YFd/Cs0oMLkDdJlFDQy9Cd5d8ms4?=
 =?us-ascii?Q?8bZ1sB3/SAms343jHnWf0B47ZZ0+vLshlwIWqUTYvP9flhFOBkKcoj5XzUyZ?=
 =?us-ascii?Q?b5Jz54XL4lhBOVc3bWsqxukVbf1YEdkYO6n3bdZTyTsMLQiZPHlzBYBoXd1S?=
 =?us-ascii?Q?QFCJJNu6aG3Gnag/XXtcKndyg0kYkb2lb+PXICFVujci/D5JAtOcdKWXGkhW?=
 =?us-ascii?Q?WZWP7Gx/0bTBlKgYkQ7hwgA9NS3Vks8iAlextaj79RqBzJ/j+DXMoCgwVDgi?=
 =?us-ascii?Q?Jd1ZMION7LnIU5TtAJljQ6ilXPSR4mH7ExmOH5M0KJ8p7OnKpmP3oZFz7gKW?=
 =?us-ascii?Q?jRt6PIAQmXgkDr4ahShJadcT2Pn9/P45HQwyIQ1uoAj2t7Fs3Y38ePHXTR4x?=
 =?us-ascii?Q?QouTf160JJFEaoGpwtcpNOKARK6DhrgbTwVFDm5knF4dEH/H8Uo7Z6KEG4Mh?=
 =?us-ascii?Q?7eTqdJg/RE2ep9J/YBMlFBjyhCV+RzAX/fJ5Fdjv5gKtBTO30YEFqwNfO4rV?=
 =?us-ascii?Q?z1yRmz+bzDXIfFUNJjKp+j0ZdCD706UWC1fgmBe3iECOPApSfhtTU4w68+Vj?=
 =?us-ascii?Q?Ijgdi3/73P98Y6H1qn4Vl8YC0zT6TUPw8I+Jug80Uu1cK70WtiO4HKMWnsNU?=
 =?us-ascii?Q?IGbuZs59kVz2OhlxmIziW0oBLmHwQaXwOQd6zB+yxvyP5SNUyRwLKTX4bt62?=
 =?us-ascii?Q?w5+PIQCOmKJPHcU3XfQI2Ek0hZKUoyVMS2NEPP+4SjEXT9D3Z5wSj09zIlxa?=
 =?us-ascii?Q?ziIF3/4e5d+8NOe0vDSLXW9btiv1BmcOo5xjJZ2oxN5EnQM3OwRz2iDwr74p?=
 =?us-ascii?Q?TebFwofRj8VKGBql3lSYWrhV6ZblE98sPyP36rvPSt5Ny+yc4R2s1mLMLt4W?=
 =?us-ascii?Q?4gvllcxGwMJloIbFkwIvYtwq1k07RGw+nnNT3Kd9riunHLpGMWBplVGUfk+y?=
 =?us-ascii?Q?+Z1HZJwgyWuyFYcKxNU8oL1uufW+FnRfW2s7iyilaq7ditpMoUHbKdtMhNRc?=
 =?us-ascii?Q?cGAhSMZCgi5jImBYZo+gr3TQvwI06P4rk/kGBWdC9/8380n3jJ/e6/q3wORR?=
 =?us-ascii?Q?h1XQyR04WQ9RyS/n3zyh+NeRdLdEIBltH78qtr9wHwKJkqzJdLuN2JiTc8f+?=
 =?us-ascii?Q?bzEhf9BrnFRQBUpnoZhSD3/tKXB4dEiGZr52++uwbIr1m+h3w3fjXyu/9+oU?=
 =?us-ascii?Q?jDezSPw0CqAGFc0tSu+RemTlrZWj2mp8l87Tpah54iyhKFy2P5KO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9c973b-5dab-437a-46a9-08df3445d92e
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 16:17:51.1650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCUHN4LJCpdb6xAhLNVevXhgaiWYGdsL16z36pVfEJEJdwqps9RIXs5fIwTCUPdndnJET6fzXvlc1nEWdlN0ZRRr5ai8E2NHA7dccziSVhJkoziRi1LHdHD2AkjBE5CU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12031

On Thu, Oct 22, 2026 at 01:40:54PM -0600, James Hilliard wrote:
> Terminating a UART APDMA channel waits for its interrupt handler, but
> completion callbacks run in the virt-dma tasklet. A callback already
> removed from desc_completed can still be running after termination
> returns. With no device_synchronize hook, dmaengine_synchronize() does
> not wait for that callback either.
>
> Add vchan_dma_synchronize() with the DMAengine callback signature and
> use it for UART APDMA. The shared helper wraps vchan_synchronize() so
> drivers can assign it directly to device_synchronize. Document that the
> termination path must have stopped the channel and prevented new
> callbacks before using it.
>
> This lets clients finish asynchronous cancellation before reusing
> callback state or freeing DMA buffers. Keep the callback wait out of
> device_terminate_all so it can be performed without locks acquired by
> the callback.
>
> Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
> Suggested-by: Frank Li <Frank.li@oss.nxp.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes in v2:
> - Add a documented vchan_dma_synchronize(struct dma_chan *) helper in
>   virt-dma.h and use it directly as the UART APDMA device_synchronize
>   callback, following Frank Li's review [0].
> - Link to v1: https://patch.msgid.link/20261021-submit-mtk-uart-dma-synchronize-v1-v1-1-4f7718cfef41@gmail.com
>
> [0] https://lore.kernel.org/r/atoz6M7RHU14_a3J@SMW015318/
> ---
>  drivers/dma/mediatek/mtk-uart-apdma.c |  1 +
>  drivers/dma/virt-dma.h                | 15 +++++++++++++++

Can you create seperate patch for
1: Add vchan_dma_synchronize() and replace all existings dmaengine driver
like stm32_dma_synchronize() with this API.

2: Add for mtk-uart-apdma.c

Frank

>  2 files changed, 16 insertions(+)
>
> diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
> index f74e9a328588..6bc4f20d8b06 100644
> --- a/drivers/dma/mediatek/mtk-uart-apdma.c
> +++ b/drivers/dma/mediatek/mtk-uart-apdma.c
> @@ -514,6 +514,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
>  	mtkd->ddev.device_config = mtk_uart_apdma_slave_config;
>  	mtkd->ddev.device_pause = mtk_uart_apdma_device_pause;
>  	mtkd->ddev.device_terminate_all = mtk_uart_apdma_terminate_all;
> +	mtkd->ddev.device_synchronize = vchan_dma_synchronize;
>  	mtkd->ddev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
>  	mtkd->ddev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
>  	mtkd->ddev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
> diff --git a/drivers/dma/virt-dma.h b/drivers/dma/virt-dma.h
> index 59d9eabc8b67..f1fc3bf48275 100644
> --- a/drivers/dma/virt-dma.h
> +++ b/drivers/dma/virt-dma.h
> @@ -234,4 +234,19 @@ static inline void vchan_synchronize(struct virt_dma_chan *vc)
>  	vchan_dma_desc_free_list(vc, &head);
>  }
>
> +/**
> + * vchan_dma_synchronize - DMAengine callback to synchronize a virtual channel
> + * @chan: DMA channel to synchronize
> + *
> + * Use as device_synchronize when device_terminate_all has stopped the channel
> + * and prevented new callbacks from being scheduled. This waits for callbacks
> + * and frees terminated descriptors through vchan_synchronize().
> + *
> + * Context: non-atomic context, with no locks held that callbacks need.
> + */
> +static inline void vchan_dma_synchronize(struct dma_chan *chan)
> +{
> +	vchan_synchronize(to_virt_chan(chan));
> +}
> +
>  #endif
>
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> change-id: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574
>
> Best regards,
> --
> James Hilliard <james.hilliard1@gmail.com>
>
