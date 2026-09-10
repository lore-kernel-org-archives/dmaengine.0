Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011043.outbound.protection.outlook.com [52.101.70.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AD334041C;
	Thu, 10 Sep 2026 01:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003780; cv=fail; b=Y9beWb3pAhz8h2g6upNbJCDo8ju3MQqO8nWnYSrVlfjAcyfAXUTuHSLKoGLQklS5XUQSY3yxvm7gJecXH3RAH3tNzQ/6ZkDpxbn7+fezCgofkZNdF6R9WV0PgVSgui7UAcqG/giXiQbKe8oULSkYkRhnEdUqXckaqR0eVH2Q9UE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003780; c=relaxed/simple;
	bh=XAjElhtTMvJUy6BMCXloJrGS7qjK1gBP7BVG4jROKs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GaNEjs94Hyw5fIDnF3JTPkQqYk7gciG3dy5azHrIM4no57zHvUPnbwIeJPw5y7Ju9ifwD3SSK5WLgkJcCjlENJpCBbD51PBh7K+HE9HBD5/bqor+rVJjdgBXns5IChWpbBAZxpWIsCCsvJPdxd1Xa2RIO8gC4OAmDtloYaAbcF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hveixBWC; arc=fail smtp.client-ip=52.101.70.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hveixBWC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7wOHJUq3fuc1sHd7Ke84pk2wY7+ffVChxCViArZ3cF0WiFJ1HWXE58hLByKB/v1UqVMKSPIdpGw/UwbR/bfIvssDq2oIkwaG4K0XR1xA2GXcxIPXzjho16ve8X4S2JE87T1YqneBffq4bZ/kX6uAztAnYtdLvNR88mqHdullS6IqBxzpN69jiG6KNmOcOxKhju2csc349Ql9mJJvFhtWgLp1gSWhJblR9Erq2FwX+/9pKeRuPcFiCB3G5BxmqLbhUyTxYlnTa5U9OzGMycbQswPWdJ1rEHbbpnVHCerI9Hqt2mQhlJK/2jat7ZfC18bkr03NA5TADGFoNMq3L2FBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6o7MjzKVJojfN1ELt4FGTKb4DoRA84wW90yHNPk270=;
 b=HGkkkeO7Ga9SHgRAh5yUFCeUVf3rvqkHVg0yTfPOONRfGDGIw1CxyKkErWXilnX0Q12wYHsU58gUFPFrmqLkMaCqW4r0yc/l7laiBPkqdjpET/nnjItIjnvP0uT2/GIvqxrgZescXYnJhEvNjVrbSbIuJF1gyj1I8aZ5QClDFTapTLfKSA2Q8ixqqlRJ5uq2t2oxM30po1LuTX8a7fhar6B3FWkRgL8Tdwk/0TMajuJ/0lqIBM2PoV9n3uzYlGhgbN8uVjlpXutL60ZsHuGFbxmqT2X4rNnO5sn5kRd+tSDMSYqiR+HPDRC9wPm2b4oB2ZtTYiDNS3JmJYl+VMzH7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6o7MjzKVJojfN1ELt4FGTKb4DoRA84wW90yHNPk270=;
 b=hveixBWCXf2Q8mPPs8kmF9nkvI4vpz+w4+TjdOV88CzL/ok4RMlD0WUMvRvq4GALi1yijEUbCGhE0+jv1o4cPkUucUCNmjZkewejfgEgqEMoHecR8xP/HU+5O5lSPBYSjtdmpIHVwDWhrJuvzu6iPkbCVRpq69QmgvLuHjspiTPiHauYW5+mqvSvpIyAYVLRN1Wu9t+PjKH7tCXuQ9i3qSfwB9yAxYF/CLnX1vKjaeyAtcVDOlVr48digaqSIJ3Gz4hIWIWbl/c3hlGexqLkF/LJAuKJK47dKl7GbQdVOHsCaFDqpy1s0sw4q2DNBAlEhPFNKN0ltn6AqZIBoTZOzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MI9PR04MB879416.eurprd04.prod.outlook.com (2603:10a6:290:ba::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 01:29:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 01:29:35 +0000
Date: Wed, 9 Sep 2026 20:29:24 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Maciej Sosnowski <maciej.sosnowski@intel.com>,
	Lennert Buytenhek <buytenh@marvell.com>,
	Dan Williams <djbw@kernel.org>, Saeed Bishara <saeed@marvell.com>,
	Nicolas Pitre <nico@marvell.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: mv_xor: add missing dma_wmb() barriers before
 descriptor chain start
Message-ID: <aqIH9NnlUuGXu3Wf@SMW015318>
References: <20260909234646.102344-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909234646.102344-1-rosenp@gmail.com>
X-ClientProxiedBy: CY5PR13CA0054.namprd13.prod.outlook.com
 (2603:10b6:930:11::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MI9PR04MB879416:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ba61299-cc98-40e6-1958-08df0edaf8b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|19092799006|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xbkLIF/bHLgpGBbwSJ9sjB5j6LSEJLDuCOUiSE456e8YQFJXkrJT83HjgI6aQBR7r996KkHFgCi9bprETLYIGCSKKG1n6xdGtui4/wsyZTJbsix+BTHXAk6NTlhHuhwYFsKzS3GVqZtyu0N2+HRiklQjV4fPhZU4o5pwuncI2EX8f9bmka7R9FDBPeHuOQ/4FT+yFK8MefsiuTgYbV04XOrqIn8KDoH4hwFVa+Qx4whoCuDGGzMJPzqgeTIYAzGnoxXBBUJRA2uN0QaE9aKuWLjSmHwipsY0ag0Uyl6NKf3tNVxQogMNhnDgnxLEwBXe9mUtoI/RK5xdkanXo0AOOhM5+9oU2kP7IVo2FuQOy3PaOMCplxgRAGpxwOuQNz6tATL7j0y04dAmEA3s/BhXsV/iMiBYgZRvxsYG9CB/Yr6rkGEEQ/cVaYkgibNEo9wiBWNMvisDknFUL3gbtAlr3Wohke1EDJZQMTJwacok2YzV5WOtKdqCBwLTpaqNw/8vvDVa+DYfKWAY/KG3zDR61t845GlpMO3SmIqj8kFcgtPer94WFBnPDdL3aB1acrGz8lQ9ZYW18uozpoRjagD56BqhBzYYaUFc8hDRXriRhCGMei5lQbegxLOlmhKYplTK+N6d/9skd4y1RjidE3BwK/m62xiiYJ2o+3C06e4VDr8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(19092799006)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kUgU6h4eGa0GUngHriZhYYVXo6HYuAutBoQTMmIkVadQ6CPRTSpidX26bwWu?=
 =?us-ascii?Q?sZJoRURGItgocANR63NU4rFFqagn16jaI4LHS1ydNa2KySaKwzzJOOoz+Jdp?=
 =?us-ascii?Q?mGweIRyeqETVdrs/CgH8XrWHzhlE7Sy6WqqPoauRZvaQOD3OHBcMYuobEflC?=
 =?us-ascii?Q?wNs0mOVBYK3eGa5rZtCMvHMcc8JNX0BUtxWd8iv+QloALT2Kt/XJOKfac//P?=
 =?us-ascii?Q?etaDvhN5rAsn2JgfXMFtjlW5hRibk14JBujg3jwcwJKMKc29oaexyfZeJyWW?=
 =?us-ascii?Q?rdPBGF2cdvsk0Sa8k05SP/J5GcVrgPe0e7Jh6zOnyjXkOVKdbodGSeFfnYyQ?=
 =?us-ascii?Q?yQdFVMyxEeJ01VQ0x4+6chartfVnK32WLhjrDN9z123BY0Lavi9PNmLEGWt3?=
 =?us-ascii?Q?GDznYZf3JXIgNfUMAZTxj/uIOrLyNvtE8VvZiyVh9W7m9ZjpwaX5ydy8e8LQ?=
 =?us-ascii?Q?fayxur7a78AhuKZyWbO/cQoLliJ8NZ2iLsyiIvhHx8EJbJ0MIiJTS1XcoHHA?=
 =?us-ascii?Q?ViOcpoEmKYo/Uxbdte1rEb3cro7ROGKdu+uAPzHQSZn/Mwlx8Kb+Y8ISJAQQ?=
 =?us-ascii?Q?v+w8BG3ezg35YANVhKMtdxiMBp/XbgM3ZYXREq8V5YdBuRTvNUEhtraM0MCH?=
 =?us-ascii?Q?XoxqFB46I+qYdAEKc9b3otv+CeG0XEDLodP6QOcFcFSqKo73xBJ1h1H07kFV?=
 =?us-ascii?Q?mwPhXUD2Dv+T7d95V4Vio4LeOAUgjqNNWl5K2Jxzv2yhSvwOWY6g8mj17xkP?=
 =?us-ascii?Q?03zDXudSwd38ZFrdZMmE1SgVURjYL2DR54HM05BMIabeCc7ChoYkvyYpo8QL?=
 =?us-ascii?Q?A6HGYrbEQyt/6GP5snp1w+9DYm2SILZlGcJYa+mW2Ulg4xv+4mWkBIwj74lG?=
 =?us-ascii?Q?cSVjUMjtqVbTHQbFtKFMmmTnq3IuftOugp+NEgsehKYWPjfAI438IbPx3pOx?=
 =?us-ascii?Q?lHYycF5P7kaWI8bwavOTqg+hH2hFSFUXfdqHpzr39AQTbt+rbUwRV0H/TTj0?=
 =?us-ascii?Q?QG9ztHzZYnkHmNdLnqwnCZYPsO9HiegUhNsAysIzA0obS57oMJD0QWJ2Z+ve?=
 =?us-ascii?Q?r7TADtmx4nfcuXHOi8lcE/GSjnxgpnwKgPlxdSQZ80UNYD4hMrCyX0zv0Xxd?=
 =?us-ascii?Q?blA7gpZq7uWRjXbS9LWhiv3vYDle79/TySku5dUzDtrxEghB6Syc01lpJX3N?=
 =?us-ascii?Q?8fWYqo9pfYOLv0ajiCjeeV1rwLMZbNx8KaesH2Z4JQ5nOWlwP+sGpDV0ihzn?=
 =?us-ascii?Q?pUMwuPbIJSbSolgR0b4jQkA0BAGjmsB7VgqA/SAVzhhqELZD8wevHkebZnsx?=
 =?us-ascii?Q?ZfiLsIThfoSRUp0ZU0hk/cOc99kaNiO/nlnjH5f92Te49Kn0iEjHkN9yWqxc?=
 =?us-ascii?Q?ypftGwVQpXNpjJ42M5SbCQ79bGBIx17IpufZEL3aiP4hXz9OA3bslxY1RYAE?=
 =?us-ascii?Q?uxpA/PU5De/xTy63YNmskoPB35vdRpFtBZ4u+/R6I9NWLKmJvu1RY8jMCeHg?=
 =?us-ascii?Q?gred1bYXSJ7JFwMt2Wlf6ByZFgvnZU9HiZWNleYRVCQKDVFDig6TzsfaWZaF?=
 =?us-ascii?Q?B1nbkzxGIy5CaztukVxYlwv/UIhaH84ef3yu7IKlf+Q4no8xNDVy+iIhUOdb?=
 =?us-ascii?Q?/p1bqMubtjTSDHxbi4NGzEjavJkkD+jAW88frjHBLzh8NQLooeILR6cpFwjn?=
 =?us-ascii?Q?4JrOTE3FrXsfqy+rEnaydpByPQ2r6AY6Bc2+lRKlpQU6QGpq1pPd3SQVAz4K?=
 =?us-ascii?Q?fdKp8TCFaiULw/qRYss5g3AlQ4SM1rKzUPloRHQSRxChLg/APxqa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba61299-cc98-40e6-1958-08df0edaf8b2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 01:29:35.1854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7m1MaTUlobTxyskfSnMUWdm9fVYFVPJ6knEXhOoIQF5JaUPIX7ZpBYa4FNhxyuBsdV+du+kF0MAVm8dkgV7QSB65FB7sXgKqixDrOXJ6qmFJkOydMsEYACu4roypHFX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB879416

On Wed, Sep 09, 2026 at 04:46:46PM -0700, Rosen Penev wrote:
> The descriptor data written to coherent memory must be visible to the
> DMA engine before the HW registers that trigger processing are written.
>
> Add a dma_wmb() before mv_chan_set_next_descriptor() in
> mv_chan_start_new_chain() to order descriptor fields before the
> descriptor-pointer write.
>
> Add a dma_wmb() after mv_desc_set_next_desc() in
> mv_chan_handle_chain_append() to order the chain link write before
> the subsequent check of the current-descriptor register. Without the
> barrier the hardware may observe stale descriptor data.
>
> Fixes: ff7b04796d98 ("DMA engine driver for Marvell XOR engine")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/dma/mv_xor.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> index 24f22db5dfa1..6db7dafac9c8 100644
> --- a/drivers/dma/mv_xor.c
> +++ b/drivers/dma/mv_xor.c
> @@ -181,6 +181,7 @@ static void mv_chan_start_new_chain(struct mv_xor_chan *mv_chan,
>  	dev_dbg(mv_chan_to_devp(mv_chan), "%s %d: sw_desc %p\n",
>  		__func__, __LINE__, sw_desc);
>
> +	dma_wmb();
>  	/* set the hardware chain */
>  	mv_chan_set_next_descriptor(mv_chan, sw_desc->async_tx.phys);
>
> @@ -409,6 +410,7 @@ mv_xor_tx_submit(struct dma_async_tx_descriptor *tx)
>
>  		/* fix up the hardware chain */
>  		mv_desc_set_next_desc(old_chain_tail, sw_desc->async_tx.phys);
> +		dma_wmb();

mv_chan_set_next_descriptor() implement is wrong, it should use writel()
instead of writel_relax().

Frank

>
>  		/* if the channel is not busy */
>  		if (!mv_chan_is_busy(mv_chan)) {
> --
> 2.55.0
>
