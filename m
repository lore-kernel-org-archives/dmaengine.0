Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010015.outbound.protection.outlook.com [52.101.69.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820344A1DFF;
	Wed,  2 Sep 2026 16:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365348; cv=fail; b=S4FRuE5ektOyZvJj2sQ7QQoohxctdDAIhu8U/6y2t4qz7mSnH3n3ziBWtYOEkN9IrXOmVJRH4n4VDQndLmkmRwSN/Rd96l851AnOEgAmSGjaPXwYT34QjK1yBoXyq8/3vdv0PyihxsNLoiPnYWPkpypSG5b57/li9AssQ50sFKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365348; c=relaxed/simple;
	bh=ZePrjdY+sMwxY/Ouww7mQYku3lsjx2Wtt4ffuBCJRyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YwmeJt94jvijfNVikPM7dwg2nRQiCn+NemWMCu0T9dlSl714HebPtz6/Fn8w4Ucsqlsk/kI65wMEdigtlw5l6iC0jxwvFAcvmBI8TNSsbOQ6OpIITWFwFIM37r257Mf30KocTawlPU/XSGVeJAQwtBMMXqwEgVKegxUlhNAhjWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TtXiWllm; arc=fail smtp.client-ip=52.101.69.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TtXiWllm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ut1IMTMjAN0dsE92xUfmoLSv35cEZDDnXM+csE0qT1o/EuMFr02ephvL+f7o+DlaGDZPaBXnm1p+jbqVXUWVEjzD2kFcwmd3yBwUpZt9BT9BoamE5iZ2R4kFmu0F3MJNHl3ModsDZwUgisvvzyNeUTpFmx0NHCoqLmgZd5Ybrg0hyNSS9NEEceFtUj/p285BvHUkbuZwbZw9tUy6pRB2oTTP8TazcYAN4Mp3APjwlIxy5snuiA+qjNOEcB/IIkDBZZXzBKYOC0/N9/Y7goFZnNN1dkUbomNtlrZS/0n4IzcaLtdBF64BsPUQLbQZ6S2AF9x2MJTvAMJeatZu5jj3ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFJd72ZwP/9KqtiFoTdLAkVig2RwokgAJ/e7KmoU8i8=;
 b=YjYdhFx9V98Wzj9YID4tYqEu/yoPTZNPh4KyveOUXy7+UkKmv3FZnvyIjTgvn7hhxOjW/Hk2+YAGwFfyZrqu+h0h2UlM97hzmMHtbvNCrtxf0bzw9tAdDpPQgiGV8CuG9UEIWPqd18tXSYEpX99W7o4HCFcsMBUnNq/ZcE+P+S/NxvBXwioz42qrXHQOAfGNPcBO0tfLxckN7QxcDr71yGbSmr7jrim0ruaginMLMGQBHOENt9ZZWIVuRceiSQ0r9ePjmmae+OqabHoFGwk+mW3mZFdLUcuV8hFpPu6fRjKoZjeavoWGP1DmgGMugqAvpOmtISLRSQLsVvVzG67uaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFJd72ZwP/9KqtiFoTdLAkVig2RwokgAJ/e7KmoU8i8=;
 b=TtXiWllm3SDaFARuCjfqV/rU5zXwWiZzRQuhpft+ozfwzBZqLRYjfDJkm4X8to8dOPwamLMa5FjkagBqimfcyYi5qT6TRt3SYcFHXcDqj8txrM9vgxzrDzMJT2TOi1epqxuOY598AyqZ3PszD1MlQH7ACJzO1Rl4nd4OLNgVn+VEGBxzxw/Jtykq0rDz+XQ7yESau+25g9mlExhNSuwUDRLo/CCOog5MN1yjlHWgYuqkzwTlGxCgFCkfjUWxB4c1bQloae7YpAQazTjh6GDeJOjaMOk3okylN97NS8spVMmtOzvYzjpJTkgwk4Mgeo1kyJfa475ckwLHTsa+TMPz/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PR3PR04MB7211.eurprd04.prod.outlook.com (2603:10a6:102:93::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 16:09:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 16:09:02 +0000
Date: Wed, 2 Sep 2026 11:08:53 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Pandith N <pandith.n@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sia Jee Heng <jee.heng.sia@intel.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 4/4] dmaengine: dw-axi-dmac: Use bitfield helpers for
 registers
Message-ID: <aphKFW_klyNwOU21@SMW015318>
References: <20260902-dma-fix-v3-0-414c6449fbcc@ultrarisc.com>
 <20260902-dma-fix-v3-4-414c6449fbcc@ultrarisc.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902-dma-fix-v3-4-414c6449fbcc@ultrarisc.com>
X-ClientProxiedBy: PH1PEPF000132FB.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::2c) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PR3PR04MB7211:EE_
X-MS-Office365-Filtering-Correlation-Id: 140881b9-e273-443e-1167-08df090c80f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|23010399003|11063799006|6133799003|56012099006|10067099003|22082099003|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WTw7eNPqOYmzooU+t6X2DfkzapJuztrM/R3CdTGPRHBF6NQgvSNRrIF17KMnSNbw+G3ua+meWUj1byPnCwTdkq5mxKbf8iRtq9qGdOQtEWse7M5f8QBz+9Wooug4Xa5QCsGuar0ND+ZdCa391lrBYd02uXnxZbRJpqx2tSXR0cdi279D1cFu5oywxuZWyUo8lK/LAD3UTrBhERlWGCCTxaCONXt0a48rjlk5oDEtyMIljZplUFnjMdbidHuXRkYJOAEecctNqE1uW2Xs0ES67VDMsNRhkpOkuwj/3MUXxpzOGLZxGbSTR/T8g8urZh5Bg/7R88dYFrWiKSS6ed6uOT55ylNhxmMmhKnaWmDgsXtbQdxJ10CYDW2pKgrd8K9X2bELRC5uXvBtvRy84Z97IjYM6h1CLhYY0pUGySDl46fRkaRimhe+IhTWiOn3JDwHwovKlZblQhYozkpGpKApD3IW4iOXmALCWjHgBUyTorvUBSwa23OfE+wSX+O5ZCWz56vG4gr6ZBJH4EtJceWUFOlUiH5F0dxUvtDrZpyyLiUCSfZgTSk7rbz+JIba0o2NhpELmw4q3ivTQDXHd/mCNcbqvjOBsKEBl8h/EO3LiqnxxzXCLUhS1W267QrPchy6iOjBj0T/PJGN0Oev8D967fUl2x68GWnY7WKAaTc2fK0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(23010399003)(11063799006)(6133799003)(56012099006)(10067099003)(22082099003)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cW100CsJDCPBWpKmpQ4SrTTI1q1sr9ppD+M8uUdBBtk7VHba8pbI9IHbbDj9?=
 =?us-ascii?Q?gMPkxxQ5I5SL/sexBkNMwo6+goab/wAUyqrmzCmsJmLgHAP7hxhqiQDAHu6O?=
 =?us-ascii?Q?utWMlX2y/g+iEJvOXlkmXSNWUHgEFuQpdkH9FspMUJM/xItTPKOizK4PGe8O?=
 =?us-ascii?Q?UQo/D4tS7EKGpekw8/YGSrplQRsl+3WcasETIoca0ivRVU26Z72IVl9l1Tm1?=
 =?us-ascii?Q?lgrmi+AiEXiJFgo2xjfuUiASUmOaLQnBzTu66KLykFB/GTA7gPrVHUAgPNaG?=
 =?us-ascii?Q?In9cKOqxSmOHjPF9zff46UAUyPYzjdT2VC8ZxK6kM5QTo42W0tqqz7IOZDFS?=
 =?us-ascii?Q?tynU/uv9IY+1pTpud7O7lP+iWhWhJXX5ZMaBLMLwOQZJsryUABWJtJKJkEG9?=
 =?us-ascii?Q?J/wg5lpWG2D5WzxX2q3Lsdy/5m3QBFodNqzPksD+JfzJ/Q3pJBcqRJn5ZwpF?=
 =?us-ascii?Q?q56Gg21ju6L62hftPnlmXSADEEa3YlhrbPKJv86rPRvP3q9SSYP+4deXvdkp?=
 =?us-ascii?Q?smUqy+WT3L/gKkTnrosM9f8KrHX//oe56WCZ7eo6b38OfRA28VBniAu1KLS4?=
 =?us-ascii?Q?+wV+MsNjNBybCcwh08+jQyA+vJUb1thL1FgcUdJ1hcpMb1sdMczyIq1CjYsY?=
 =?us-ascii?Q?RyaG9FnBIfZ+hn4bm6JdE2RsK03GaKvlzUTyUtUUp/DIwgeYWVL2JHXJZ5yQ?=
 =?us-ascii?Q?87L8X/3hodKSq9z+EUf2oxBW9sp2tSmBgqIJSwGk2SZrXyOCx4c20y4Y8aON?=
 =?us-ascii?Q?4NjRcWWYvmPosjnt2PxF+u7wiK5OgXoxcZkc9/gunE2Kx5/319sv+cOgBhoD?=
 =?us-ascii?Q?4LvnhMwa5UCRRD93VRg7d7QOCoziDHh5tzohJUcB1NgelgezIB7keq4/2gYx?=
 =?us-ascii?Q?kLfluvTEKn4wT3xgzK5n2JY4nMLuDXc7Eh4WhzxfPDZsP2tHb5C81fKkJyWy?=
 =?us-ascii?Q?RWYypgXaDAQcWhHaw+tqA9NMPGTpbkVkFx1Y8pBBOBD4SpdFbJVWQQs5vzzd?=
 =?us-ascii?Q?8kLnYpnEQDLHCETVaqKX8mluFr6N9DwyHEttJGvbPt4vyVx7KiI0ssQR1BNK?=
 =?us-ascii?Q?lfojLN0QfHe6tbyvxXs+y17LM257+f/oWzApWR5flTMTNn3SvSt0zox/BG6B?=
 =?us-ascii?Q?qjeRQOCdrQvBPVt2LVcn45i2zudvTxtp/PxtDbksMthzliKnYUbjxQbhSZDJ?=
 =?us-ascii?Q?xtnegGNZ55PIJa6lW5VLW0iFgV39a0M4+66MInBvfe+hdOtjgWatcnBcPBms?=
 =?us-ascii?Q?GcVoYweZkWdH7trIErD6o95BHW+bp0y02E3RKAkZjy7C9XglOWhLxvCtfWff?=
 =?us-ascii?Q?g3IBYf56dlv34b5Bg7ZnDOTZ/zfyx4qYx/LDJMRx21mGcL6hkVvxn7f/GGKi?=
 =?us-ascii?Q?YFDDjML8Xu7qL0DMJ4YiigUMQh458O499WidDORH9vVSo7yAXV5OZwYz2ZiF?=
 =?us-ascii?Q?eLqy4bjPUQkiNH9dW9MaiX84yrVyWaSxF0lmMLTTwe4s8YRnbzqIOpbkl6VD?=
 =?us-ascii?Q?DaEC0TL/YoWnDPRPVbYa6mzAlhG0uEWlF2Mo5AmSy0e4Msss3H3+HfZXlTkf?=
 =?us-ascii?Q?/XUj+H8mIMeNjrdkemgUQbMxLlmCdIrCGuMuSadzCTXuI/eIDtKPJTtLCR9l?=
 =?us-ascii?Q?MHtuyGZgZ8qhCFmdJfuhlqk5cHB2qwB1heiiEljzDVd68SxHPbLBMPl2yOXH?=
 =?us-ascii?Q?19SKXPwLMQ72D7sRWk4cbX+zE7CAQa94KnHov5/AqVYuuVJlEKktwdG0U3c6?=
 =?us-ascii?Q?h8xwwX00lnI4xMTQpRrClChpqsd++ZRajr+NLD1VyT+XcoZy8kYq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 140881b9-e273-443e-1167-08df090c80f9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 16:09:02.0761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RBzesF8RpPF20jB+wYR7LxDbYiNQ0xknUL1TEsfssT+UhEqvoHRRrx5YcW22FpJHRMQh/QradyDCJBSefAI3lTi62RAZCQCJM9/eYTfgATPcKimYLL9klWkBYXwGDvdk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7211

On Wed, Sep 02, 2026 at 05:26:14PM +0800, Jia Wang wrote:
> The driver open-codes several channel configuration and descriptor
> control bitfield writes with left shifts. Define masks for those fields
> and use FIELD_PREP() when programming the registers.
>
> Valid field values keep the same encoding. FIELD_PREP() confines values
> to their respective fields, but does not validate handshake numbers
> supplied through DMA specifiers.
>
> Suggested-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 75 +++++++++++++-------------
>  drivers/dma/dw-axi-dmac/dw-axi-dmac.h          | 44 +++++++--------
>  2 files changed, 61 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> index 61230d2b1c56..b4aa6461684c 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -7,6 +7,7 @@
>   * Author: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
>   */
>
> +#include <linux/bitfield.h>
>  #include <linux/bitops.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> @@ -101,23 +102,25 @@ static inline void axi_chan_config_write(struct axi_dma_chan *chan,
>  {
>  	u32 cfg_lo, cfg_hi;
>
> -	cfg_lo = (config->dst_multblk_type << CH_CFG_L_DST_MULTBLK_TYPE_POS |
> -		  config->src_multblk_type << CH_CFG_L_SRC_MULTBLK_TYPE_POS);
>  	if (chan->chip->dw->hdata->reg_map_8_channels &&
>  	    !chan->chip->dw->hdata->use_cfg2) {
> -		cfg_hi = config->tt_fc << CH_CFG_H_TT_FC_POS |
> -			 config->hs_sel_src << CH_CFG_H_HS_SEL_SRC_POS |
> -			 config->hs_sel_dst << CH_CFG_H_HS_SEL_DST_POS |
> -			 config->src_per << CH_CFG_H_SRC_PER_POS |
> -			 config->dst_per << CH_CFG_H_DST_PER_POS |
> -			 config->prior << CH_CFG_H_PRIORITY_POS;
> +		cfg_lo = FIELD_PREP(CH_CFG_L_DST_MULTBLK_TYPE, config->dst_multblk_type) |
> +			 FIELD_PREP(CH_CFG_L_SRC_MULTBLK_TYPE, config->src_multblk_type);
> +		cfg_hi = FIELD_PREP(CH_CFG_H_TT_FC, config->tt_fc) |
> +			 FIELD_PREP(CH_CFG_H_HS_SEL_SRC, config->hs_sel_src) |
> +			 FIELD_PREP(CH_CFG_H_HS_SEL_DST, config->hs_sel_dst) |
> +			 FIELD_PREP(CH_CFG_H_SRC_PER, config->src_per) |
> +			 FIELD_PREP(CH_CFG_H_DST_PER, config->dst_per) |
> +			 FIELD_PREP(CH_CFG_H_PRIORITY, config->prior);
>  	} else {
> -		cfg_lo |= config->src_per << CH_CFG2_L_SRC_PER_POS |
> -			  config->dst_per << CH_CFG2_L_DST_PER_POS;
> -		cfg_hi = config->tt_fc << CH_CFG2_H_TT_FC_POS |
> -			 config->hs_sel_src << CH_CFG2_H_HS_SEL_SRC_POS |
> -			 config->hs_sel_dst << CH_CFG2_H_HS_SEL_DST_POS |
> -			 config->prior << CH_CFG2_H_PRIORITY_POS;
> +		cfg_lo = FIELD_PREP(CH_CFG_L_DST_MULTBLK_TYPE, config->dst_multblk_type) |
> +			 FIELD_PREP(CH_CFG_L_SRC_MULTBLK_TYPE, config->src_multblk_type) |
> +			 FIELD_PREP(CH_CFG2_L_SRC_PER, config->src_per) |
> +			 FIELD_PREP(CH_CFG2_L_DST_PER, config->dst_per);
> +		cfg_hi = FIELD_PREP(CH_CFG2_H_TT_FC, config->tt_fc) |
> +			 FIELD_PREP(CH_CFG2_H_HS_SEL_SRC, config->hs_sel_src) |
> +			 FIELD_PREP(CH_CFG2_H_HS_SEL_DST, config->hs_sel_dst) |
> +			 FIELD_PREP(CH_CFG2_H_PRIORITY, config->prior);
>  	}
>  	axi_chan_iowrite32(chan, CH_CFG_L, cfg_lo);
>  	axi_chan_iowrite32(chan, CH_CFG_H, cfg_hi);
> @@ -677,19 +680,19 @@ static int dw_axi_dma_set_hw_desc(struct axi_dma_chan *chan,
>  	case DMA_MEM_TO_DEV:
>  		reg_width = __ffs(chan->config.dst_addr_width);
>  		device_addr = chan->config.dst_addr;
> -		ctllo = reg_width << CH_CTL_L_DST_WIDTH_POS |
> -			mem_width << CH_CTL_L_SRC_WIDTH_POS |
> -			DWAXIDMAC_CH_CTL_L_NOINC << CH_CTL_L_DST_INC_POS |
> -			DWAXIDMAC_CH_CTL_L_INC << CH_CTL_L_SRC_INC_POS;
> +		ctllo = FIELD_PREP(CH_CTL_L_DST_WIDTH, reg_width) |
> +			FIELD_PREP(CH_CTL_L_SRC_WIDTH, mem_width) |
> +			FIELD_PREP(CH_CTL_L_DST_INC, DWAXIDMAC_CH_CTL_L_NOINC) |
> +			FIELD_PREP(CH_CTL_L_SRC_INC, DWAXIDMAC_CH_CTL_L_INC);
>  		block_ts = len >> mem_width;
>  		break;
>  	case DMA_DEV_TO_MEM:
>  		reg_width = __ffs(chan->config.src_addr_width);
>  		device_addr = chan->config.src_addr;
> -		ctllo = reg_width << CH_CTL_L_SRC_WIDTH_POS |
> -			mem_width << CH_CTL_L_DST_WIDTH_POS |
> -			DWAXIDMAC_CH_CTL_L_INC << CH_CTL_L_DST_INC_POS |
> -			DWAXIDMAC_CH_CTL_L_NOINC << CH_CTL_L_SRC_INC_POS;
> +		ctllo = FIELD_PREP(CH_CTL_L_SRC_WIDTH, reg_width) |
> +			FIELD_PREP(CH_CTL_L_DST_WIDTH, mem_width) |
> +			FIELD_PREP(CH_CTL_L_DST_INC, DWAXIDMAC_CH_CTL_L_INC) |
> +			FIELD_PREP(CH_CTL_L_SRC_INC, DWAXIDMAC_CH_CTL_L_NOINC);
>  		block_ts = len >> reg_width;
>  		break;
>  	default:
> @@ -708,8 +711,8 @@ static int dw_axi_dma_set_hw_desc(struct axi_dma_chan *chan,
>  	if (chan->chip->dw->hdata->restrict_axi_burst_len) {
>  		burst_len = chan->chip->dw->hdata->axi_rw_burst_len - 1;
>  		ctlhi |= CH_CTL_H_ARLEN_EN | CH_CTL_H_AWLEN_EN |
> -			 burst_len << CH_CTL_H_ARLEN_POS |
> -			 burst_len << CH_CTL_H_AWLEN_POS;
> +			 FIELD_PREP(CH_CTL_H_ARLEN, burst_len) |
> +			 FIELD_PREP(CH_CTL_H_AWLEN, burst_len);
>  	}
>
>  	hw_desc->lli->ctl_hi = cpu_to_le32(ctlhi);
> @@ -724,8 +727,8 @@ static int dw_axi_dma_set_hw_desc(struct axi_dma_chan *chan,
>
>  	hw_desc->lli->block_ts_lo = cpu_to_le32(block_ts - 1);
>
> -	ctllo |= DWAXIDMAC_BURST_TRANS_LEN_4 << CH_CTL_L_DST_MSIZE_POS |
> -		 DWAXIDMAC_BURST_TRANS_LEN_4 << CH_CTL_L_SRC_MSIZE_POS;
> +	ctllo |= FIELD_PREP(CH_CTL_L_DST_MSIZE, DWAXIDMAC_BURST_TRANS_LEN_4) |
> +		 FIELD_PREP(CH_CTL_L_SRC_MSIZE, DWAXIDMAC_BURST_TRANS_LEN_4);
>  	hw_desc->lli->ctl_lo = cpu_to_le32(ctllo);
>
>  	set_desc_src_master(hw_desc);
> @@ -977,19 +980,19 @@ dma_chan_prep_dma_memcpy(struct dma_chan *dchan, dma_addr_t dst_adr,
>  		if (chan->chip->dw->hdata->restrict_axi_burst_len) {
>  			u32 burst_len = chan->chip->dw->hdata->axi_rw_burst_len - 1;
>
> -			reg |= (CH_CTL_H_ARLEN_EN |
> -				burst_len << CH_CTL_H_ARLEN_POS |
> -				CH_CTL_H_AWLEN_EN |
> -				burst_len << CH_CTL_H_AWLEN_POS);
> +			reg |= CH_CTL_H_ARLEN_EN |
> +			       FIELD_PREP(CH_CTL_H_ARLEN, burst_len) |
> +			       CH_CTL_H_AWLEN_EN |
> +			       FIELD_PREP(CH_CTL_H_AWLEN, burst_len);
>  		}
>  		hw_desc->lli->ctl_hi = cpu_to_le32(reg);
>
> -		reg = (DWAXIDMAC_BURST_TRANS_LEN_4 << CH_CTL_L_DST_MSIZE_POS |
> -		       DWAXIDMAC_BURST_TRANS_LEN_4 << CH_CTL_L_SRC_MSIZE_POS |
> -		       xfer_width << CH_CTL_L_DST_WIDTH_POS |
> -		       xfer_width << CH_CTL_L_SRC_WIDTH_POS |
> -		       DWAXIDMAC_CH_CTL_L_INC << CH_CTL_L_DST_INC_POS |
> -		       DWAXIDMAC_CH_CTL_L_INC << CH_CTL_L_SRC_INC_POS);
> +		reg = FIELD_PREP(CH_CTL_L_DST_MSIZE, DWAXIDMAC_BURST_TRANS_LEN_4) |
> +		      FIELD_PREP(CH_CTL_L_SRC_MSIZE, DWAXIDMAC_BURST_TRANS_LEN_4) |
> +		      FIELD_PREP(CH_CTL_L_DST_WIDTH, xfer_width) |
> +		      FIELD_PREP(CH_CTL_L_SRC_WIDTH, xfer_width) |
> +		      FIELD_PREP(CH_CTL_L_DST_INC, DWAXIDMAC_CH_CTL_L_INC) |
> +		      FIELD_PREP(CH_CTL_L_SRC_INC, DWAXIDMAC_CH_CTL_L_INC);
>  		hw_desc->lli->ctl_lo = cpu_to_le32(reg);
>
>  		set_desc_src_master(hw_desc);
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> index 97451bb8b16a..b4ed241e87e2 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> @@ -234,9 +234,9 @@ static inline struct axi_dma_chan *dchan_to_axi_dma_chan(struct dma_chan *dchan)
>
>  /* CH_CTL_H */
>  #define CH_CTL_H_ARLEN_EN		BIT(6)
> -#define CH_CTL_H_ARLEN_POS		7
> +#define CH_CTL_H_ARLEN			GENMASK(14, 7)
>  #define CH_CTL_H_AWLEN_EN		BIT(15)
> -#define CH_CTL_H_AWLEN_POS		16
> +#define CH_CTL_H_AWLEN			GENMASK(23, 16)
>
>  enum {
>  	DWAXIDMAC_ARWLEN_1		= 0,
> @@ -258,8 +258,8 @@ enum {
>  /* CH_CTL_L */
>  #define CH_CTL_L_LAST_WRITE_EN		BIT(30)
>
> -#define CH_CTL_L_DST_MSIZE_POS		18
> -#define CH_CTL_L_SRC_MSIZE_POS		14
> +#define CH_CTL_L_DST_MSIZE		GENMASK(21, 18)
> +#define CH_CTL_L_SRC_MSIZE		GENMASK(17, 14)
>
>  enum {
>  	DWAXIDMAC_BURST_TRANS_LEN_1	= 0,
> @@ -274,11 +274,11 @@ enum {
>  	DWAXIDMAC_BURST_TRANS_LEN_1024
>  };
>
> -#define CH_CTL_L_DST_WIDTH_POS		11
> -#define CH_CTL_L_SRC_WIDTH_POS		8
> +#define CH_CTL_L_DST_WIDTH		GENMASK(13, 11)
> +#define CH_CTL_L_SRC_WIDTH		GENMASK(10, 8)
>
> -#define CH_CTL_L_DST_INC_POS		6
> -#define CH_CTL_L_SRC_INC_POS		4
> +#define CH_CTL_L_DST_INC		BIT(6)
> +#define CH_CTL_L_SRC_INC		BIT(4)
>  enum {
>  	DWAXIDMAC_CH_CTL_L_INC		= 0,
>  	DWAXIDMAC_CH_CTL_L_NOINC
> @@ -288,17 +288,17 @@ enum {
>  #define CH_CTL_L_SRC_MAST		BIT(0)
>
>  /* CH_CFG_H */
> -#define CH_CFG_H_PRIORITY_POS		17
> -#define CH_CFG_H_DST_PER_POS		12
> -#define CH_CFG_H_SRC_PER_POS		7
> -#define CH_CFG_H_HS_SEL_DST_POS		4
> -#define CH_CFG_H_HS_SEL_SRC_POS		3
> +#define CH_CFG_H_PRIORITY		GENMASK(19, 17)
> +#define CH_CFG_H_DST_PER		GENMASK(15, 12)
> +#define CH_CFG_H_SRC_PER		GENMASK(10, 7)
> +#define CH_CFG_H_HS_SEL_DST		BIT(4)
> +#define CH_CFG_H_HS_SEL_SRC		BIT(3)
>  enum {
>  	DWAXIDMAC_HS_SEL_HW		= 0,
>  	DWAXIDMAC_HS_SEL_SW
>  };
>
> -#define CH_CFG_H_TT_FC_POS		0
> +#define CH_CFG_H_TT_FC			GENMASK(2, 0)
>  enum {
>  	DWAXIDMAC_TT_FC_MEM_TO_MEM_DMAC	= 0,
>  	DWAXIDMAC_TT_FC_MEM_TO_PER_DMAC,
> @@ -311,8 +311,8 @@ enum {
>  };
>
>  /* CH_CFG_L */
> -#define CH_CFG_L_DST_MULTBLK_TYPE_POS	2
> -#define CH_CFG_L_SRC_MULTBLK_TYPE_POS	0
> +#define CH_CFG_L_DST_MULTBLK_TYPE	GENMASK(3, 2)
> +#define CH_CFG_L_SRC_MULTBLK_TYPE	GENMASK(1, 0)
>  enum {
>  	DWAXIDMAC_MBLK_TYPE_CONTIGUOUS	= 0,
>  	DWAXIDMAC_MBLK_TYPE_RELOAD,
> @@ -321,13 +321,13 @@ enum {
>  };
>
>  /* CH_CFG2 */
> -#define CH_CFG2_L_SRC_PER_POS		4
> -#define CH_CFG2_L_DST_PER_POS		11
> +#define CH_CFG2_L_SRC_PER		GENMASK(9, 4)
> +#define CH_CFG2_L_DST_PER		GENMASK(16, 11)
>
> -#define CH_CFG2_H_TT_FC_POS		0
> -#define CH_CFG2_H_HS_SEL_SRC_POS	3
> -#define CH_CFG2_H_HS_SEL_DST_POS	4
> -#define CH_CFG2_H_PRIORITY_POS		15
> +#define CH_CFG2_H_TT_FC			GENMASK(2, 0)
> +#define CH_CFG2_H_HS_SEL_SRC		BIT(3)
> +#define CH_CFG2_H_HS_SEL_DST		BIT(4)
> +#define CH_CFG2_H_PRIORITY		GENMASK(19, 15)
>
>  /**
>   * DW AXI DMA channel interrupts
>
> --
> 2.34.1
>
