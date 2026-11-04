Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793821076;
	b=zxBDRGqckPFgnTuInia5KozJPmdL8lqtKsj+pr8nldbLrtsR2YpnDTHsc3g51hLlUhpw
	 aCNfq1LUi6aQHYHU6BBiuGu9kYnm03Qt5tibE+Cw7+xWBfQCw8bjHUy6XDRzHARoPWj0/
	 oee7UDPp6my/B+ojTp6fOa2qeC3vZBotSF2HVdd2SEfK+eR7ged4jwaYZvVfK1whOtE4d
	 8SUwghDje7WGV56nDS0oaVn9oV97UlNf4wCzBQtUe4zuVdvT2zJX4yzRkCSlw2Ci7jI1q
	 yOwq7sii+gM7/bjGno0JKvt5nCPqTZUvpXOi8MBl/5PttxrouTAtjLFY0J7ZOzqHPIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821076;
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
	bh=17LcxMRWTpK+S4an8ixgrCp7XC7KStke6rt6JHkC7e8=;
	b=Lp/d98NDRby4vOngYOXyNnozOweu9sxfXElEn4qaWx5e+p3QyPYwJGzsqC+wrFUmtPyf
	 jZrs1ZccxE3Pwss6ZfZjHpdU0OA3ODr/gpF4lkSRpISpt7CLXFqJaLmeVj7/WSuLb0Evo
	 cZlGmWU4Uw2ZLehiTxti047UUpI3wtdqNcv0Ax8Q3i71txdLWt9MLU49w/SxGMuliWF3l
	 GEp9jLm4PbwbXk9lqKjp5nCQrbtS0Zb2jtmrLVYb4o1cuNwrAV7X2dJYwqUM00XqjNNgg
	 jcCz1CePNQGzoxbT/vhpKKQER+Q73bSg4mgVfDierQRd/5RRLymIav5BmZvjDzsOplA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="B5/mESXO";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.33
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013033.outbound.protection.outlook.com [40.107.159.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB11360B4C2D;
	Wed,  4 Nov 2026 19:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB11360B4C2D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=B5/mESXO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YS6MLyeMfQM8vM8pPyV4DB6iGurwZ3eWbSNJYwm1zAIfH0Eduaq4Yc2tvM2Y+Wkl4XY/ar7r3mdGQdCUY6/6nAgKLVt1AmJu8iLuUiMbmq2l4c9IZ6if7d1PFvHUp8ZH42eu7+7DOS7Hggv2BKuN3+H0IA5NN4yMStRhw2gikUaBK7eBqFT98js/oLxOGi16LH/LSJY8nLyAj4Ktu3bdopzFcv8Kcf4+uRUDJdKCxiKXBIzonuDx43+lj/A41HllmE/eAan5ML/521qAVidfcYg80r1+2Rj73fA4EU0birAS29ekznZBlBqO5IMx31MV/ImPSaGrtuAkI6ObMULciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17LcxMRWTpK+S4an8ixgrCp7XC7KStke6rt6JHkC7e8=;
 b=Zbyz5hHZcTnoKVc59uIaR7SFPRB8elb3IBn+/FH8lzbe0J5FOZcveYTV54/cs/7iq5Rp2DhAf+m0FkG0tM+WOeL8Z9LAi3+nYhzfmMfWSdckTydNkWbRAxi31bunJfmtqKyirc3XVx2YVFF1U9G+x3Sb8WtZacpyxmVA7O4EOXUuE1VdE8gluIzdTRLLB52t2Vltjk48AJgxoC9edJSwtGL2z2CFcsCrUtqujdCAN+bdUV+gKvUSp+vE6gasro/eStTHfr8y1/iUIQOLgVwcCHikJS+fh2aKzTuK+KBubNkJPjIuFvQIUsJmFCX3LuA0TDp+J9LyQB+v/x1GMg5spg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17LcxMRWTpK+S4an8ixgrCp7XC7KStke6rt6JHkC7e8=;
 b=B5/mESXOZlA8dknioRtQDxNf4fj2Wbf59KXwAntkyxquzpExhFMRX1Wu3TVeJydpjNg3DJqnhZidK//c50yuIYshJRkRC5v0iCNkSBtlEAzuk8LEW2kNH9LWH7dhWXVctsIXbVbtG9ZyO+mdtgp7g7oFWxXpVTtLN6mNJxDuB3LQ8tWQUCUGs3qxVHlkRtPaTj29MwYwbdyUVrfbvQqfb95u8xxy807PCOXIiXpj95PGArza4RmQh5WyHHSTPbnN4bquY9udxna1Gyn+rocvqmFPih84opTPhB9INxW881SrovVfXMg8QcjPHfdiAFPQtCbBtl7925GFo2pnZ+KUfA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV1PR04MB10307.eurprd04.prod.outlook.com (2603:10a6:150:1cd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 19:37:51 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 19:37:47 +0000
Date: Wed, 4 Nov 2026 13:37:39 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/5] dmaengine: arm-dma350: Support integration clocks
 and resets
Message-ID: <auuJg0QladV4nRIA@SMW015318>
References: <20261104124411.296640-1-Jelly.Jia@cixtech.com>
 <20261104124411.296640-5-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104124411.296640-5-Jelly.Jia@cixtech.com>
X-ClientProxiedBy: DS7P222CA0016.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::8)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV1PR04MB10307:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b711fea-bbf0-48dd-3f8f-08df3aab1ab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|376014|23010399003|1800799024|6133799003|10067099003|22082099003|18002099003|56012099006|4143699003|11063799006|261022105027099003|261102123227099003|261028144727099003|261026140227099003|261022075727099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	wuJy50R92B+2/XgWpUodWElcC29T3RIG7nxYlvPWIPTliSADA7jvLXAlpMJ5XF/YJ+qojVJTMjVB3qGiG79dpUVWAo2cWPEvzYNHFBBEJqPK1xx8qLSrU/n9LboMn8WaP+xV5LwkmY4W+1f2q9tg/XVX6L7JW5cZHsAkBUU8/nYfF474XaNeuFVghCFNASLiS/pv7VuU/PomiQFjj4w9tWGp/3YegOFATn06D+IXwbEfodiIuN+TiqtOv94HYpmuipljH1/cFN7tblUjl1+ZqkGbBxPLC+fcL2FDSpfcjx/xWL3RxT3deijg9j6z7JwnCpbpxQI0dR1pNsEPn2O1RKV5BNTGbRIvaIafi4zeRgNScsShSYDKnyyOTH+2IO+53ybuxxMOdORsGWZGKe16xxKfJaGSEfN1fy07znYCW9v5vfARg8jqIYHZa3FAOpkXE2akhx+/4QCnALuNhuo7HB+bYZ7j4Uqc8EJdXBhBgsg/B3XzFHTYlpbw5tA9JCEESilircmZC2p79sp6P5XR25B+yzrldw1OPfCVvg/aO2f+Ae0hjju9FDdSNfhIma4E4eCIGLFDL+fsUTGBs7hsYYYFIOeNc3wGJkxC9ehBkA3tfnIb9UnDWyqccS4hg04J/qVE2DFznQtDSRUKFRM0DX2wqpz0K0i23mH4AFgKNLs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(261022105027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261022075727099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MUBQ5kUi0TkMPtydUhh4sKrpqt3R2+j1MS5yE+EgcrAilxF7CMFSYxYtCpTo?=
 =?us-ascii?Q?Lo89YgiLQRF4VlStepI6q5QK0ba/P3YwWspzsq4C15eFqMnsoQPuCf1wNez5?=
 =?us-ascii?Q?1QDLMLKP5dSgqhNpVmUmtlJXo80olZXv7HEpr8cikKGMYTl8laImRxk2Sci0?=
 =?us-ascii?Q?TpWBcRiWKQ+IKYTOhiTu6sva8+OcEskJy823VuES+HveC/r1AyBNBp0Pjzwk?=
 =?us-ascii?Q?ytS+Om74wBzZwI5dwNmChupc96NkU8djpdqVIvXJsXTI8Sz0JrZX2ChkUM9S?=
 =?us-ascii?Q?/vbgkIpvSM915FjaAF/rTahIGWD2UNZGgshLjnhwtMNltWdbkPQupQHgKvJl?=
 =?us-ascii?Q?fpWwGj8LGZnmS0/5Sh6OZc+HnK+A8jBJP7j7RvkhbCHN09AVEAbwDnhsSlF7?=
 =?us-ascii?Q?71Q4b8Hw4Q4Fjfb7KhlaNBzJPE+oOJfg7Rx4y94ouyr41Xw4gASrVC8qQFHD?=
 =?us-ascii?Q?CkWRfJaWpGYATxgrY6fcnfd3RNqoshPVZ1HDV/ERmSC76SvRWA7NKVgx8/Fj?=
 =?us-ascii?Q?0ZqP7hH/dZpoaY897P+8ipGo6GmPTfPUDzN5Cxr7m9e+rEkEAKMJcQfA8358?=
 =?us-ascii?Q?bHq4LTAp1OSf5M/2nBsdEHhu1Vti4GgDCdrpC6KHAspcrxdCYGsK4/1S4HOZ?=
 =?us-ascii?Q?BUCTvBmBJJlP81G4M53OzVHXGRsfO1f192h/tsEWqh5l7k2vbNUyZ8ujtNhw?=
 =?us-ascii?Q?mwdxvwrhWNXTS3k5FkNEDlz8d4s4ioZ7PfnQny7+EwFipFuflOces99Z1/Hz?=
 =?us-ascii?Q?SliEwM7yGzEdbLWt1ezv9ZqWrtnfOuOjf4OZeUfGWgtYYURzvYWqxPFtpCtF?=
 =?us-ascii?Q?WNxDxrtfi4RUnj7ip8JMTG5yFi1hdMnvlXUSdodVMGnKFlBSoz06B6UHRRG5?=
 =?us-ascii?Q?Io1lKUNoice8wj2EgBXlvl4FcqDamxsEM//AkkfYHfR7ET39dco2VOJjNBh1?=
 =?us-ascii?Q?vJVtOCsVDydVhXUKZ52yj5m2KhE6W1z+bA3AB5y3eu0WEJfxXD5n1h+mgyI8?=
 =?us-ascii?Q?wuKC29jQ25lm7SxCeYz0zHGqaqCLei60SL4BdCZDghOacWAj6FEwR9UuZ+ou?=
 =?us-ascii?Q?RWSeUrfLZOTff1jNWGCYFt5I5CXSImS1GXzm5ZGosZg+byDhWCQ3kKA0iY/5?=
 =?us-ascii?Q?vvtTvHRR+cwUt8oVh7l+VykMpqY+yAPiYn+NLcE1HPgXUQJYUjq3FIE2vN0e?=
 =?us-ascii?Q?a2oWOL1VIPYmvT16sGeYU5hHt2OXYXuomXdoZ1x6FHNRdIhEKrw8gxJhRkyY?=
 =?us-ascii?Q?ATaJWVAMjSBFrqv1TQP4BM4+YFpmxJjxgwOGa78K4qr25mzHUz3WzfTWXgIi?=
 =?us-ascii?Q?njbv7LX3qEuVgpOvfbZmBJwIFGAKpGICvodrAwYR/+8GgbyQ1/Yu8l/h8URK?=
 =?us-ascii?Q?IHfeu/auqAqw5u7wB6JsdaIPzzRtZbpTqJvQxr5GP5u+t1O6+IIjPD6tVpJV?=
 =?us-ascii?Q?IUmPZTBKGSGV5bXYTNWSAj91P+x50+k2g7xQWZjlyhoc2mR72SWWVOUDb1sT?=
 =?us-ascii?Q?hWkHGLunE3KQU+nJflefzEk1cfZM5pYpt9Okp6HOzU/FXOniW6Kt6MxuKcaE?=
 =?us-ascii?Q?i42qO5SjZ6BSUeevS+MupWN8b8g8SLW/k4Nw1uth6MAh0jL4RXu9wAkWPakO?=
 =?us-ascii?Q?u3yintkVklglBremmmWo7s9iiHygM95bpas/NN5pm/fEE7q7CO26JRX8zZtl?=
 =?us-ascii?Q?PjnVByTVP7CucE9x13JuGvJStwmAn5loBQz+v5ePPAPvDrM3kuPpouUcde/V?=
 =?us-ascii?Q?8TPT/DuksTIjtD7D3dz9C2EwVaLr9/uoEtxRIna7yDIyS3MN/3Ck?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b711fea-bbf0-48dd-3f8f-08df3aab1ab9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 19:37:47.3798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RFBo6q2P+aTGjBaPTUNErqvbJxlCzYuloMzK1vQ1RDjcUh4EBATawpcAwJ3ZFvV2xtkRoEX17aGOYKQwEHaM656CNFDPrQ2JZriiWYbJhmxoa6jwSMPIDMfYTP7DVu5q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10307

On Wed, Nov 04, 2026 at 08:44:10PM +0800, Jelly Jia wrote:
> DMA-350 integrations may gate the controller with a clock or hold it in
> reset. Enable an optional clock and deassert an optional reset before
> accessing the controller registers.
>
> Use the deasserted reset helper rather than requesting a reset pulse.
> This also supports reset controllers that only implement assert and
> deassert operations.
>
> Both resources remain optional, so existing integrations without them
> are unchanged.
>
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/arm-dma350.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index cfe3bacfab68..2f22f8a0ab47 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c
> @@ -4,6 +4,7 @@
>
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
> +#include <linux/clk.h>
>  #include <linux/dmaengine.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dmapool.h>
> @@ -14,6 +15,7 @@
>  #include <linux/module.h>
>  #include <linux/overflow.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>
> @@ -1247,12 +1249,24 @@ static void d350_free_chan_resources(struct dma_chan *chan)
>  static int d350_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	struct reset_control *reset;
> +	struct clk *clk;
>  	struct d350 *dmac;
>  	void __iomem *base;
>  	u32 reg;
>  	int ret, nchan, dw, aw, r, p;
>  	bool coherent, memset;
>
> +	clk = devm_clk_get_optional_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "failed to enable clock\n");
> +
> +	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
> +	if (IS_ERR(reset))
> +		return dev_err_probe(dev, PTR_ERR(reset),
> +				     "failed to deassert reset\n");
> +
>  	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
> --
> 2.54.0
>
