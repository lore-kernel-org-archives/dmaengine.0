Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010023.outbound.protection.outlook.com [52.101.84.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CE4438030;
	Wed, 15 Jul 2026 19:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784142091; cv=fail; b=smgtsZyyRBET9Gb2CgtlqiZJcJrwt/N2S7dtGCmBKeMuzf84Tx72T9EboKwrH3LI8rfrNw+dNG3TUULDdJMHTJzRfdhrxrcQwlqMyEFDOYOw9r5Zi0kFx3exJTG6P+OiPcjIsHtSCVz6k7qQ71UTShRBidlbg+6sIE23ZxUBd6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784142091; c=relaxed/simple;
	bh=oet0Yah3ovQ1YbfoYyc11x31UDxXvjYZa/ABj7H+phM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mu58VbsfSGrlYnlV6o14UOy0dG+FdA77ZdBQssAh3oNd86+KJhTItjYBcDJ/pUcav/LwpfwbKAyb7jfgjNRq1OxOP6wDJFS9WYt659BUL4/qWgvF12Y3OW3c+aQ1QDLWB+iE79hA1EN3cIbGifgPTLx/VKM7b0hxsnFE5jcwSKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jOwmXjf8; arc=fail smtp.client-ip=52.101.84.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jOwmXjf8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ah+jDTasckcvefZEslYqJQtL1Ei2iNQ5nGy+33W+bKkSdHWk79Erlto0jc9G6E7NnTd0F24O6JIiCLj1uoSiMJrkixlLW2OdK5LQgOaqmGDCaB5/4JcK43fFYC8/MwoZyv1e1ZDoylvDz1sG1y9CqdmfyRprzzjfWQLdY21778tfaT8RCoYXYnIhAP/VM4DfxXdvyiBjfB6MA54Q7cryaDXR3/l0vlQ/n3mzmoORb3K6Ey8M/nxuf5vvpHJp9GJW+/yenwkv1CWMPwRLRYtjxau1VFjUt6TpOJexc4bJjniuSGg5697hkmzN4efR2kGy6iEjPNxwab2s1sGzf+DXxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9T3gaGHDdq8Iii6NmClm/Y4vfq/Bt16Q6GC1jooEYOQ=;
 b=kWUJB28xVQT2GOr/UYYtQYf1fvWF/gTeU9vLQHB10FSglVvV3ZUtBjJZSXcMU+c8zxSI3+2I4h8am+unxD+rRjv7r6K5O4Qwbd2/h5imMs+qD8pZudGvfyv86zcqo4AI2rbZ85P862sclWsQdPRUOSJFg4D31X9WGiGMysix02jd5JTjCvFwIZnUhK/MQK8Ot7n5LvEozv8RBKLyif7DoQB1Nv9h36E9UNuNb+p9//6vQaeCa7317RD7IJmzBVU9INqAzcVuJ8WXB3BZnCRbpg8Hq3AJGJ6UBGwX42OaCig+lYAdFlN+kg39fQZ5xlaBpmciUHxVu0AI7oy4TTl1mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9T3gaGHDdq8Iii6NmClm/Y4vfq/Bt16Q6GC1jooEYOQ=;
 b=jOwmXjf8o6Unnscf8Mcz9FRWnr8d/1t0ziWRaH9r+UNHomHifUGR0GyJIsZZOjmN9cBwnKGhw38akpAXHDP7Qp4BdjMV5iSz00y/VyCCdATdp8hveLWtqxCBFXQktsMWy1BD32qPnnCDdEuZr13m5/rNYo3HeiUwuBqLPfWRiRcnJ03QOjQ6QISewowGc3tdh5zNNHIhD3uJsMYpfqqdiFBjofygHCw8iH0oVxwxnRrZP89G+DiJXQkCc7seXQux9ssRMnqe9IhGSLNlA6txvtNA/lNB9XKKnHTH5d0bFnlOAt9rJeNd27xBMeY2pNM20mTcIZ/g4PxY0X+uWet2aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB11481.eurprd04.prod.outlook.com (2603:10a6:800:2c8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Wed, 15 Jul
 2026 19:00:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Wed, 15 Jul 2026
 19:00:39 +0000
Date: Wed, 15 Jul 2026 14:00:30 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Cai Huoqing <cai.huoqing@linux.dev>,
	Serge Semin <fancer.lancer@gmail.com>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/9] dmaengine: dw-edma: Clear stale requests on
 termination
Message-ID: <alfYzrWZgfTurDVm@SMW015318>
References: <20260715175740.1110404-1-den@valinux.co.jp>
 <20260715175740.1110404-7-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715175740.1110404-7-den@valinux.co.jp>
X-ClientProxiedBy: SA0PR12CA0008.namprd12.prod.outlook.com
 (2603:10b6:806:6f::13) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB11481:EE_
X-MS-Office365-Filtering-Correlation-Id: 57d01735-df25-44d6-781d-08dee2a35bf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|7416014|19092799006|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uTmOceQwONmSgXdMlt97m7WQTSidooHclXuaQzGCrJMmV1ORvoOLn9WjZcU0OaLQl9JW8AbJAsWW0Jg+a5BjX2NXeOpKG068vcEmxw5Wvt6UeC435JUaaqXpF/UWlZjsI143pzAnTrbIR9ruY+GPOvrHqN6K3ebkPWVb5yKHE8F3uJgdJYMhx2HM5icld5GHToQ8pT0BtazABVjoaAo1KrgJuAg+2Sb8xLx08TZmc5MJgv+nRSgUXTKCtP1LEXeUNVCqz5FadnhP7+d/PyfbbCQXfhsRd0JOsJatTGbKXDKpU9equnGDrIQszHMGGALUGC7EfjZtVPXFQxoAX1VCgyVlM3Hl0PrGB9MHP1LU1OJ5peWNrt1g/B3bxgZ/T+le1mR054Nyz2F+t83rhG5ivvT7qffxLylPShieq20bNJwXrx0fTTKJnmLg/pY0e7BXNGQMhLDablaH5j0ABrM7c38HaTF2o48AyNLRnatcVmdsbSdBEUVrImHsxT22KNfkntSoM78744bdSiWYmC5SEJxNbtdmxokmbI7EKRGN8U7VWPkVFxyzOZopZtGSdcMyXqemi3qDvE9LOPbB5KWngtMs96BtOGfHsg6rF+iUQw+NtwJ+9J9082IQqBZuDfCWmzbWBtQcfBXf8POsz9pPWnIwu/4EWFHoMGop4Uw2eoA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(7416014)(19092799006)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iRfpdgWfBw8XvGgDiQkkx3RkdEMqOBOR+dAN2X8+DsMcVeOedg2kCmcHqSHQ?=
 =?us-ascii?Q?E4KGTIFynO3BWEaySk11GXxUAUJi0/WGHDLAcsNxSHdlDaVcsQmSQGGSMaAr?=
 =?us-ascii?Q?xFPiTM/El84FxPeC8Cdwz9t6qfZkfeCKIg4dUhZiDvwXgMosB3s9pTlOhS3p?=
 =?us-ascii?Q?FqhObqq97JgnGrpjIeLtePv8QH72pICzXKBx4uCQ6LKo0aSlltCHXEQwAW+5?=
 =?us-ascii?Q?yyLxpTwaTuF6XW4+1axTf1JIcUV8scc+617rByBfluOSMVR6i71AY9IVClmM?=
 =?us-ascii?Q?AlGRfa9kPE4tZLyCUJmvUjJ061iYwB5jyFRM5SYeBan/HwX7VHHDUKngJYLM?=
 =?us-ascii?Q?K6cUBMbjv+V0grmzgAPOfrR1sFrEIB5jf49Yk/T7PYp8rXkB2d4mV4X2THC3?=
 =?us-ascii?Q?KZSd6M4lnH23FIZEcubpfawRGqbIKvGZi/sMud4tgDyyjCndqkkmuj1GI11n?=
 =?us-ascii?Q?56lxG7xZfS0tvvDaQnk/yOYq84522Y4SO3XFs+oEwLTRCRxEpM6kq3FcY2Hv?=
 =?us-ascii?Q?fD/0mZG6JGUH6mOIwtPghuiMDI3WJ0KphVcs95CuEN6SzP0RhH/XjOS7zGjY?=
 =?us-ascii?Q?vWM9GIKrmVyeEm9VtsDFTIIN7kp83bb67XD5bKri4is1OpJG/Hzu/vmUcsKJ?=
 =?us-ascii?Q?SsArM5i5AdykFTg2+1uPF+6ETDlr4rYO5sb74Q1rp9S/3/oG2Ab/Ja4yZcfM?=
 =?us-ascii?Q?oqMcbDBqdacot5InuBfuv7/hduoUQy1zwGHnlmZiCJ+FluTzjadzMHzWaWhm?=
 =?us-ascii?Q?oCArLXN9pLDC+HGqRJf04CtemPsgAfefMuf4hW2pEjVN/7qphSosJs3ZwoMG?=
 =?us-ascii?Q?ZE+8wcqtjM1GZMb7Sszdf5ThiD1zLKusao6crPaa94M4QS82iyWCvARcS/PZ?=
 =?us-ascii?Q?3+peZRXffWibaIHExvmfxoMjV7656X6iQZn+M5ixA/1hSzCOkFGWaWWzcepw?=
 =?us-ascii?Q?dURvTEX+FbPjZXB0awUwqnT8tMyp43v6H6biOYK1rG1/uGwxyswSoOwuX1Ok?=
 =?us-ascii?Q?6q8/h5cp+tq3eFqCEOuC1KTaDFELkSn2Bfen1VfFi5b1dGVit5pwMiz+OrGj?=
 =?us-ascii?Q?3ky2/ES+qqpMHOtSzyVygXHE0uSXUuJ62v04REN1dIoDg2zf1rEDvBP9gK8j?=
 =?us-ascii?Q?hfBZDkuFYRHFXxGVujNLbuO6t9HLEiaoQgTe3om7G//Tkb578FPaRiU7oU5P?=
 =?us-ascii?Q?rigJlcask3R7IG8024NekGz1ljQjYjgedzRW3E+lXOsicBkSwCz2M0UglNVz?=
 =?us-ascii?Q?9MXp6Qupnbuh8MHLTsGHRvJ4u5VDNGo9+I4VmD/v31P9r0ZrrOXrX5mwmZzj?=
 =?us-ascii?Q?mjyOmSzVZ44XLF1/3/qpk0oDsnSL2+bwSVV5KrsUP9GZor0Eeflz6IVOTMmm?=
 =?us-ascii?Q?4n5t86DICJ0uGZMMZk2Eyd0vv+cPjfODGQB+9KcwpFiLYCp+DhDM84BKuCPv?=
 =?us-ascii?Q?I66MoXu8OFZlPvJa+300YTxh+JMZh8/XX9kjiZp2DjZ/XvbIZ78J6xFzxMnU?=
 =?us-ascii?Q?T+lZfykf80ELyuzSjKKcbaWGWyFrlnTSeoYAxm3KnwNiQaeWt4+UgiA/Ghml?=
 =?us-ascii?Q?KGK6f7KnYZIpEPFQ1lph01/D2V1bRCCHifEpGkPWL813lL+zTHjiOPa+2XOu?=
 =?us-ascii?Q?Y/p3EzINoEec+/JYZlCOUMBE5mAn4oy7++25LaZbbnc4KUWnnjGRwdAmKhiz?=
 =?us-ascii?Q?mc9KPrxf/J4aHpOkhTfE5kHeP6wifObemeZq1/qT+D/59fdzVTLwSI/1nc36?=
 =?us-ascii?Q?+N+gH9czJXY5eZTWOM2c+YuEvwpYIJ0jU4y9Q/OND6wZGmVF299D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d01735-df25-44d6-781d-08dee2a35bf9
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 19:00:39.0225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qEE76zqXsODv6H7f/2g+AL67U+RKMvhwKnciXlR+Eupr1CZOAHd/WiSoKrrItzmZVSlH/Ms+3GV/p5WKyQcVw+Z+WK6DflS+r9/hGLFS/qtQc7EAlw+KXK4vm1xjpgmr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11481

On Thu, Jul 16, 2026 at 02:57:37AM +0900, Koichiro Den wrote:
> terminate_all() can deconfigure a channel immediately when it is already
> unconfigured, paused, idle, or stopped in hardware. A pending PAUSE
> request can survive these paths and block issue_pending() after the
> channel is configured again.
>
> Clear request whenever termination leaves the channel deconfigured. A
> running channel remains configured while its STOP request is pending, so
> the interrupt handler can still consume that request.
>
> Fixes: e63d79d1ffcd ("dmaengine: Add Synopsys eDMA IP core driver")
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Changes in v3:
>   - New patch for a pre-existing stale request issue. (Sashiko)
>
>  drivers/dma/dw-edma/dw-edma-core.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index 8b0e2af734da..2369b4c4630b 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -369,6 +369,8 @@ static int dw_edma_device_terminate_all(struct dma_chan *dchan)
>  	} else {
>  		chan->request = EDMA_REQ_STOP;
>  	}
> +	if (!chan->configured)
> +		chan->request = EDMA_REQ_NONE;
>  	spin_unlock_irqrestore(&chan->vc.lock, flags);
>
>  	return err;
> --
> 2.51.0
>
