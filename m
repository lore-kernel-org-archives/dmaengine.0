Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793119166;
	b=h6VgUiPO3TXmOdX/iTahopznF0gGcWAdQ1GyQVUxZn+lV3XOQi01R5CptdKuW444Lu14
	 yym3dGoSsq6vmI1gKP4FK/3OXt9u5Ohcr6hC2j5uHoOu9OHlAA7SXZ1X3o8DahkixNu+1
	 UG5ZnNZrx/K4XeFx1Ha2obgWdrcRRRmbNgl5HlvRiD8azDpMCaXJvw1f7mBg3kWL3hoR5
	 bu3Rf0wC98cZdFamQzLyz7WY2hkvzU8wZDtXDjJnAaS2nlomt8XmPMGv5SQ/yVP2Irm4a
	 LkQx9kQhD8Jlg/4bPt+tEQeAC1nWHaQG3CILCnYEA74UOMkWYOrpsJJovxJa4UKSAyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119166;
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
	bh=bsSSL1v6kG7ZPxtFD+LkBFbCWBFQWy1eNk2FJQSikKg=;
	b=e+AA9uEZ47Vt53wsAanAzpMYs4LinYCgVnxtZcg9ALdFv1uQOrckBRVqJ9/7UxL2HDuW
	 U354mMQLjIthc2P3KKOVddaTYJJQWEyf96/ZS1J5vBi1Zr39aeTJ5xqeuNY/XkUxC2itr
	 j3uDhUNcXd8+mjujJ2/2p/MHmrfhMxzrwr/7Hq84TKwI0vh8iiObcgDit53GwQ7WVRVS9
	 FWZrkiNO69AKPGLazAYI0hxV4BR1y4KAoDrXSAsBNC7T/74mR78g9/t+qJkNYv7+Ubl8+
	 b0aPvyKHtCcjrKepY48LtWWWa9yXg+R1T75KLQ00wDT26ZdAoaUeirkGvD99tUw48Dg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=LSFilaTs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.23
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010023.outbound.protection.outlook.com [52.101.69.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4315606A325;
	Tue, 27 Oct 2026 16:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4315606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=LSFilaTs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gS0Orzh98YoHdr+jrK9SLhtLHXIHrfBx7L5BnUMLOfqAPagtEJ3t6MXhr0gayA6wYGLqGhoybsqN8+/BcHIdFtlXFWo1PDkwMThY54H8wR8My5l4h988jICJnaf2T1Ryv2pLbZOxMM106FjO5OoPR0Jn2FdbCFFD1UC8Z87zxmtNgx0HeDarEtWPWQ9kbmZYHWWDsyRf/M7oN/+hJBCyWlUvae0KOlZHwDWnpxEYwAY8r+vSkTcI5zyFm6myyPV53alHEsciUuUE1mDySHKIhoNWnJz8fqjX7LkNum6fxPRWk7vk9VS3K1zLXGO0tMF1IkGL616zT+CQyn9AiU7rpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsSSL1v6kG7ZPxtFD+LkBFbCWBFQWy1eNk2FJQSikKg=;
 b=j63VHtfozUgw0jc/DaOwybXDghjzTNVUNJY882sJJ05j4nogUAwgcHHpetTxqJ0Ga1E2uQJjV9tH6WL4f8hlQz1wvy3tOcSLgH/OBbqOmMjf/cFqtz7rvu77KQwGngNZMPM2Mfc1SMQE8eXoMxC68a2dgXpQp9YNdGE17xLcMA8N9plaz7u49YLbV/n93aqqI5lWJXpF0J+737dkiKKgtnjn64k/aEyd1BsvzFELy/mb6ddT24SfTPE32lWYkZFIvb0VCY6Aypn50SCEUJS8YBUd9zsOnr++AJZ8MfpBZFOvr6HUttFvU3adDqPbStCcwzKfU5kBQfjz/GcJ48pIdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsSSL1v6kG7ZPxtFD+LkBFbCWBFQWy1eNk2FJQSikKg=;
 b=LSFilaTs5l7PSKN0XcQmavM0gLePOxId1F6ba+opxb/Qa7V7+mFgssrYeVVQqYzW0wPECyPsDczDHOD7Wxd9PcB2dFPIdtvhTJoa30ZHHzZG0bpv76j3zxjHw8xBtmZSTJovNWCsne2IhzYbvkXyxEe6RhE9XB6PP0W+15WaSAYrjfhrdkyOytcOx6dSgComhLd8crQWMCVS3DmDv5eCjHjuR5r0kpgcW7h12o/8cZC4OGIM1mmAjraNzYY6VaEwTVjNWJqvG12hpEHidTM/GEX2C4vs70Req7DX/jtzzG0uw+y69DXm5Jxq2wXJ3WEpsMV576NifVlTQjsFhbAVxA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by WA4PR04MB805442.eurprd04.prod.outlook.com (2603:10a6:1d0:2c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 16:39:20 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 16:39:20 +0000
Date: Tue, 27 Oct 2026 12:39:13 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: "Jeff C. Jensen" <kernel@nullptr.com>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Suraj Gupta <suraj.gupta2@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Alex Bereza <alex@bereza.email>,
	Folker Schwesinger <dev@folker-schwesinger.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dmaengine: xilinx_dma: Fix cyclic period count
 truncation
Message-ID: <auDTsTibC3c_W5B8@lizhi-Precision-Tower-5810>
References: <20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com>
 <20261022-xilinx-dma-work-v1-2-20faea2e7a80@nullptr.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-xilinx-dma-work-v1-2-20faea2e7a80@nullptr.com>
X-ClientProxiedBy: DS7PR03CA0344.namprd03.prod.outlook.com
 (2603:10b6:8:55::28) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|WA4PR04MB805442:EE_
X-MS-Office365-Filtering-Correlation-Id: be961a7e-26a9-4e43-3b64-08df3448d9c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|19092799006|366016|376014|23010399003|1800799024|4143699003|11063799006|56012099006|261021121427099003|261021123027099003|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	f+IV4oL3KgcmqWP6GoHvF5oBq31rxpXjX4IfmgcSijdqxYIXXRi53cDhYka6gecfM6/ksRvxCQjwlHQdS4aGTF8H9bBovmEG5wRiUJspG34BR5f1OZ8R0cesdz8emjR4Q/yUuGe1UOZtIWhoBmY9DX0DpFHLic08ZooZ8W7SZ63TuTJcHuFZE+SGHkIUG3Lgc0NsseB0v+Y/zk4sMqIpGm5NI+3wIs2TFdcz26WwI9I3P4iET+9OIRzcUcAgLiIDvR4JO2ollnpcwbCEeWu2K4ILrjKEjcN/EEHOtTIUBCM658IjVE1nVNr0IfHUTufiEt7t0S7bXBIm0Mt5qYRzS2S7jl56QHNA0CJYNGLJYdGmZmDv3qq6PBveLejyQpTvnoChjTySgYbsl3KHyowOmv5s2UTccVfRNXEJaxT8dU31AYk5sS7Uhczox7N0nfnfKgUhwqsOedvHWuO04XTaX+0LFy8UHeC+Y/lgS1FH1DYlL+T7uMxdfzkJn0Yj7tnyG6Jvm+M+smTEdRL2KlTsZ1eSyYvZh22qP6qW6yVQiWOfEFGTvOe5yJwnb+rj7vjkjwTIPar0gIj7lPxIyta2XOkNpP+KdS6cuS9I9928oolOw8UTDT3v2C2mYI+U0UtQKL9CmA4vkhs4WU3NGrAvpWgbeB2+n3IB1y63TZuloxs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(366016)(376014)(23010399003)(1800799024)(4143699003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wgz4WoHkrzlsrOkf4afof+s/cG5lqAemhUxaeDEIGLYyniyRRxPFcJkFMnud?=
 =?us-ascii?Q?VHMKJBdF94/yTBDPPbkpq//wWTBlZUZHgytw4FjlzW9zdTPHJcBDorkvP6Dd?=
 =?us-ascii?Q?7/HNTI/YbuXhaj0EAyCbP2goqlyDsaHiCKDk1A6Hp2plgusDGxxNJ0Rxrbef?=
 =?us-ascii?Q?aoJgmsVBm1yojAubW1dK5myF6ZARP5sS69NE8+b9CiRG7PVUTK0qSsckyDxe?=
 =?us-ascii?Q?S4obWezxsAc5AGySTdR8quQvfgZ7INj8Ak5ucnnLcQipg6DiblOyChdtlfby?=
 =?us-ascii?Q?FYh1y/zUplwYkUbWcI2MKCYD5H73+P51aZs2/EF0AqYps77HaIHcOC7RScO1?=
 =?us-ascii?Q?XswAkitjZ64sGmrZ01chI/9kAL5YNM7igW9rUd//W7NgFCGNatbJVWLDcJJu?=
 =?us-ascii?Q?fGmaEM50tULYgCPAJz7hJx6+AR+LJcmRAg0o9KLViW5z5+Yk5hg1h6ZYYgMN?=
 =?us-ascii?Q?o2bMJnSiz/GtBUr4rVNJgdQJT/4tTnYa7H7EaZbdOjCjJtLoaJhyxCx1FTLJ?=
 =?us-ascii?Q?Wxl0sHCiC15wQb8JSrwzFdOh3DVsWnGj6NCSB4iA61e4rxoq/zYC23hsU1vC?=
 =?us-ascii?Q?oaNpRZmYvTuBLDRMoAkXxWEZ50+9IyclpOcgYIlEZ1OnI5Or/YITImDhm2BG?=
 =?us-ascii?Q?La/NO+7tGJ6Rg6r3nJCe2xMbx4Dg9NT+PXGzLRQ+tPsGd+UwEAmxP20exW18?=
 =?us-ascii?Q?Sk9Xn2Uw8IzmVRibrZFgncppTBJ4n1Yj76EVMi3e+5qNpuynX3mEpcpURAP3?=
 =?us-ascii?Q?PXPHVqHrT6/jpsavGsTenVizfkoXGYIXT2wmZKEr77V08r/xoWrRFifCr4jP?=
 =?us-ascii?Q?Shs4nAYesIQNMIWJB43vJUp3nQfVNe5JJYrwk+JnGmp0hUmRBHgjObDKN75J?=
 =?us-ascii?Q?9GDeqfwf1JrhfSQZ8R29H1jIQT4MrHtS2PescWNG76dN+nso/RvIJf5A7+k3?=
 =?us-ascii?Q?kLqZvKKVSQfbogJHt2vIZk/jDPz3pbaG+LY5zoBEVET6lP6uQiPxHZ+BwPdJ?=
 =?us-ascii?Q?8z83HUG/vcS2r3ISKuuGwp2QTAnLmOed72BMIu8o0UlwFkW14KsemCYp3rAt?=
 =?us-ascii?Q?zDr3MPOaHXiW5UUs0hDHBzFQI15+L5/go6rEg8GFIRpIxeAz3hObPHIO9yKn?=
 =?us-ascii?Q?kL+189JZxuOfrFS4qBV8YE1a5vgB3nNqd99esf8VSbDPHVBK5VnDlE+9MUvi?=
 =?us-ascii?Q?wne9kVas1B7NBCSbWM8wWo5AfFv8rVF4nu7hr6TSxTez42Gh2IbaM1eT3Qmm?=
 =?us-ascii?Q?Di8Fj2Pjzw6cGGAL5inaJxzdBRsHRPgGO9jFUJblK8kWraCgvFKt1tECEbsg?=
 =?us-ascii?Q?JgEllhV8vEiSJIp+UWAg+IRMTlIMB+xQ6JyHSFRkmC/TSgaZH2qLMq3PtkXN?=
 =?us-ascii?Q?bkL8A4DA9cKwPa4+7db2FPd8Ez0TqbaKZGM98mcgbvYbzVCCsKdMNMk3ka24?=
 =?us-ascii?Q?hZW3rKeaP2QLjcXxDiBLKeHdxeWp2E2NgImmsmZzEyTXuItyLgPhjUL1ynsj?=
 =?us-ascii?Q?BnE6Mb7y0zq3ob3zz5KR67dmb90f1nt8chd7Z73la3efLpYd0yQUqZsV5Ono?=
 =?us-ascii?Q?iQdFSvQEJ8jicAHLQvsg78oBgv5GyGW+CKcBeXnqeRvVDg5AOmLMFxTe2Gce?=
 =?us-ascii?Q?Lb6WgyRNv+XoJKiRG/uudvjU79b+6X7zwhBcK+aPHW0e0zJtEh3lqcdm2jtA?=
 =?us-ascii?Q?Sf39epX2jM3gSv3Pa6fBBLO/Yw+K/Lt+zYvfF74IWXfLdWS0CSljKO75HlmX?=
 =?us-ascii?Q?4tKArHtJ++gx5w1/f8NkFqj9tvnDqGMPN3zVYJATs/txYi4ZKH6N?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be961a7e-26a9-4e43-3b64-08df3448d9c7
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 16:39:20.6586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFvst7Kc3AVO4NHNISp2ytqmpMDx6xZvlqQEpqLp+4TOjNOln8cHcOLErqTn7Al5pnBRC45SOreSFHc9kWGBN16Va+aGU3gX7R9JrvgAi+AdpbBWskNzJk5O4Ng9VQt0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA4PR04MB805442

On Thu, Oct 22, 2026 at 03:11:31PM -0700, Jeff C. Jensen wrote:
> xilinx_dma_prep_dma_cyclic() stores buf_len / period_len, a size_t
> quotient, in an unsigned int. On 64-bit builds the count can be
> truncated: a buffer of 2^32 + 1 bytes split into 1-byte periods becomes
> a single period, and the transfer covers one byte of the buffer the
> client asked for.
>
> Compute the quotient as a size_t and reject it if it exceeds
> XILINX_DMA_NUM_DESCS before narrowing it. Each period needs at least one
> hardware descriptor, so a larger count could never be prepared from the
> pool anyway.
>
> Fixes: 92d794dfb699 ("dmaengine: vdma: Add support for cyclic dma mode")
> Assisted-by: Claude:claude-fable-5-1
> Signed-off-by: Jeff C. Jensen <kernel@nullptr.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/xilinx/xilinx_dma.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index 5ccc9f9d58a3..aa714effd10d 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -2454,7 +2454,7 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_dma_cyclic(
>  	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
>  	struct xilinx_dma_tx_descriptor *desc;
>  	struct xilinx_axidma_tx_segment *segment, *head_segment, *prev = NULL;
> -	size_t copy, sg_used;
> +	size_t copy, sg_used, periods;
>  	unsigned int num_periods;
>  	int i;
>  	u32 reg;
> @@ -2462,10 +2462,11 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_dma_cyclic(
>  	if (!period_len)
>  		return NULL;
>
> -	num_periods = buf_len / period_len;
> -
> -	if (!num_periods)
> +	/* a period takes at least one descriptor */
> +	periods = buf_len / period_len;
> +	if (!periods || periods > XILINX_DMA_NUM_DESCS)
>  		return NULL;
> +	num_periods = periods;
>
>  	if (!is_slave_direction(direction))
>  		return NULL;
>
> --
> 2.43.0
>
