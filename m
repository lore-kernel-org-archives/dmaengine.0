Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013029.outbound.protection.outlook.com [52.101.72.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51C538AC65;
	Tue, 25 Aug 2026 15:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787672287; cv=fail; b=mAWrrmJRhvPE8Q0ZDaYejtl0jftJYTKebqqepG2Ygev5dPcuoOXHEJC2PyiWoJw1nYELMoprLiskgYhKM03sTPs24Y9zCaX7F/528dDYFxSqUAaemnPbEl6LMbB46wq4y7WYIREQAwYTt11udVpubgl7AVe762hOhoWlGqgr8Pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787672287; c=relaxed/simple;
	bh=tNdRewXf1EY7QxsBHkDreOa67x3t7YyVz+DLPVihuEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VSTOfmPx9ifz6C7iQMRxi8lYdsQIoqoiGl9UsV/lS28RotN0D61xMqWkBHfxgxcjVDKbj29nle8+qKYWVGE01MB5PW05crshMljY5GZeaPK7gy/0IqakXsVrp9Vh1ivEXOU7hK14zwl6x68FgjjQRCSsubJEXk0assSJKEdbIGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aXx2dLmq; arc=fail smtp.client-ip=52.101.72.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aXx2dLmq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PUnikfKOQDs+LJwFSQDlnwgiU/df7bAO3EidgMYSm++rlUlsvqcMNyn9vAQMmtmxRfazLbydGU9COwIRT6trdcy31vJdCHxLKgk/en9aj2z2rmhiqB6TMbMUa5r/MOPK5vcVNbZvmt4zCxLoIk0gMqFwInYdTmCbWus3UwlHccP75uEMDFFFNvzlET2nusp3y48e+PYKT546X+M7bOl+AYMLas6QC93G6/o4jTi9DKI+eoFIpTJ3oqmdRDHMy+oK3sk3MldNlgJC/IqFXKq2P2/Xi4wENEGu6l7sqIR0nizQIfP3hwk3ZlnQJDvb9ZqO6YEzWfG6vJNj3PL0NldwHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSGa9JmSE9KaHGRbyeDB8Wz+ER8plRGJ79j15sUrjuM=;
 b=Nnw3hG9OIWeVbsc8klLji2f20g3TPb9pc7SDlfU94X1vyqgO2EbT0xvGnCH2PHiPnkkmpcaXuTinhltwLyavYGLEbAtKOFZfg+9kEx++a3hqTjm/bmlZTC93bSKJ3SA4I8MUxaEi3nOZTrfVBu6cu+nbg1fRMxQdAD8q4VdrIpzBMtgkO2T+VoSJewFGedOCN7sWtpPbIcX9Vc/to1JZB40FjKKoLseK8mKV2p9eUftvqONIZa6EL6T1+WsQTVY8vY/P3nOuP6tGPlUWoSFISsqovkHbS0bYpQZQ9AGojTB8GUVOK8NuaE0DCCImK0XGWxJT7FkF/8E2OYitOfx4zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSGa9JmSE9KaHGRbyeDB8Wz+ER8plRGJ79j15sUrjuM=;
 b=aXx2dLmqFoVLJPLxcrWHV7BNG0sOzuLLXMHxvCNbZ1+Z2nX+ZOc8AmbTr6yynPC9CEhfafgCkkVeLKeDmaPi9nBOjyJrKgNpgHSYJtf3GMh3JT30pWr9Vl7ixdJG7wKG1JsZwy64zaKk4raLxxxr12UGbYq9fLDK48ruK/houyH3wo+5CZMQBRHZsnNA//xIeidGqxmeyJVBBPWN3C7YLELayWGKDMy23/C7+UN8FB52w9Cf/uLGVpOyRG3fL9X4vFm7cjNYT9wPhkQkfG/S7LcRyVT5+2hpmMWv7d4cYmA09wRYrz4z1HiieldJw5Wi+r6gtVkxh0OFNlBoISRQ4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 15:38:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 15:38:00 +0000
Date: Tue, 25 Aug 2026 10:37:53 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, dmaengine@vger.kernel.org
Subject: Re: [PATCH 2/4] dmaengine: sh: rcar-dmac: SMMU doesn't need IPMMU
 workaround
Message-ID: <ao220Qqu23yeq1hb@SMW015318>
References: <20260825141542.30901-6-wsa+renesas@sang-engineering.com>
 <20260825141542.30901-8-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825141542.30901-8-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: SA1PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB12038:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc9f2dd-5a3c-40b8-937a-08df02bed83c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|376014|1800799024|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8Q0dbXe2i2yBR0niIRHnmSVYdpiN3B4BcYUWoE060mjXnNGftzE/jHSyROQ9JOuVVTL7FDCWfawrE2qdx8jNlcwel2osN9ol2AJitOSW5H0TxgO7QViSPw0HUJZsDBwf8sbzw7PiL5gigxkcgeW6qcVxw+LeWwAm30qKhTQKqRD80UczP/4XAycRBYO/LjJ5Pw+i+gZVzpCn036VSVOVkzELW19NVP90NXKIuIeTz7ZWpldqVE0Heg58/AxTOYRYPHxx9JhSgCzXAFcBaACDzncQmYAg0CFO9/MmTo4F2srfp+UY51TTYfdYnZmIRs7gNAQijYmrHbeMANcZZnmrSksK8sDTm2yrXWmu6k6NG8vdF3KzO3DGyu3Rp0SOowWnE+mX9iNEFICwJPGFIWJEFtCJ4Sgh5zgh1mw2dNF+5wzPhAqD/Y5THGCkbsGdUifjCiXxSgbsavPtrbzm7/fqRPm0gZQ6GcrZ4ruygHGO5fiCSAquwdmbUOUqDA6idCOWf4hcFM454tTAyGeKWOd1wWEGNU9QOLrWvNUILIC4cTzl5ZljRbd8ZJxI/cf0SY+SGsxboUiJ3Dt0TvAZnlyojk921prGHbJFs5IZV/4TGa369/8S1bqeqOypr+axivSoVV7qP2mQBFC0wpazl+Ce7FDABo7m7KRCZp9p+9OW9UM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yPtjnOE1WiEW3ygK6cW7BJT2cDN/+eC9mlBDUeygI7lm0HiTx6vXBIvst0sl?=
 =?us-ascii?Q?kiWobizXhZ8d6XWjoDABb4bAf7QZ24HY3HsUTo0MgKVj2I8xbZFoC/P5M3WZ?=
 =?us-ascii?Q?p4xGAnCBtEc08vUfs3IG6r2kKzE41Yf4PhCt/yxUjyK2Wo6whZAFh8jZdjrq?=
 =?us-ascii?Q?yq1t29OOOeTZy5hT/q3YsHhDKv3c6r6S+MDsFOx5DNmI78812KgABPUlJwus?=
 =?us-ascii?Q?oJq3jdFRhlodXY+Mxj4Y4G1wllyeDLWqUKBLCRDOaKHvaBE4HV6/YozjVKfP?=
 =?us-ascii?Q?CWhcURwOYGXlPleVh+/mW5lD6m/IBPvafsOnqfMgSftfEPWuUBiFZD42QOm6?=
 =?us-ascii?Q?dMzPb6mzthh93tIPueVrSRRVKs3Qe/FUAYKFBbFzSAHtGSTXy5k1JDdwB0g9?=
 =?us-ascii?Q?J6Yxrr+9WS8OpangyQ7uIsTisvPkXYwV416Mug68Pzu9i4/Ri8JvGQQZpsiY?=
 =?us-ascii?Q?uoKmdz4h0C3XCBeTqYuHeEd0LGlZH7rWKnU6B33M8+NJcmfhIH3KHoyW79kG?=
 =?us-ascii?Q?ecSRvuHYlxXpkmyaDNPQab+uAoY4/fWaQIP5Wfk2Rn9SGs/anKXEiHKgyicI?=
 =?us-ascii?Q?GiImhzRygG0PXOspO+63tsWr4McghW4hKXG5v4+FMw05HBoJCtwz39U7cjvw?=
 =?us-ascii?Q?jbJHcgSRixjUzBKNvKugtBtjuOLFFRI7FgonogfVEOPdDip1674NW32Sk9iK?=
 =?us-ascii?Q?GgX5oASJ1+I/cVklMBHw47eF/ihmbesPczKOtpG8S02HPScLKkRAbfEjjiEQ?=
 =?us-ascii?Q?WIYXnd14lzVcxs9ZspCg1wtYQv4LP8r0cVjwjmHM/Jcy0FdO3+ljMYOcmvnT?=
 =?us-ascii?Q?3cJhaN0yD9mHHokLVy3PTbRx1pav8GTGQ2pc7yv+i6/a5QzH9RUq0dFCQrxL?=
 =?us-ascii?Q?7lLMbW1bOg8b4nlQ13W5/Jl/pZ2LDKN5G2rSPREX06hN2TWdiw2YDX9Oguen?=
 =?us-ascii?Q?gM2pdzXWNht8O8BNdFsuTcQOUHrQINhssDjsdvKb21bpRda+/6ddQG4Wceam?=
 =?us-ascii?Q?aWPovtR7hzVOa1XpqJTbcKzWA3+lP6EwJaRBUH7kmT362SJPQ4O8mOIgz5mv?=
 =?us-ascii?Q?kl+8eBTTbgTB+TRobw3gfnk/hKjQ1Qb+URs8FqhQ0R4OFi489n65S9Bv3jha?=
 =?us-ascii?Q?Pw6ggPFHpskVrvW1dn0nJ7+jLVpsp/Z35Vc+hbDUn9JMkFMZQ1nIH8yt1LVu?=
 =?us-ascii?Q?PmeFP9DG9rQqqP0XOQ1+d2mYsuoPo/MJBa0DADdRY4osJDluC9JE+JThhJ7o?=
 =?us-ascii?Q?V0y6x18ylCJJ90BqQ9vl7yYv3ndZfk6gZU3WcuV2Jk+odCt2pVQ1xVvzfxEQ?=
 =?us-ascii?Q?WPVuA1rZE1ReXEG9AB6cn+fldFYYU3T8hVMULsv9t1J3huzpn5R69N29Frgq?=
 =?us-ascii?Q?EcC6Nih8rmdJTKIi8Ia+T0UCfb0AJzGgt7jksXnhr9ssn+iSOMW6MrPulGqF?=
 =?us-ascii?Q?QI8UtdIVet0fLQUmiZ2P8jnhm6CSOqOD4moHKp8MnGTKCzoKgQoKUOiZIfQC?=
 =?us-ascii?Q?dhYO+oS+vManJsnE580TA5IKPggM420BFN9oRSGonmwBbd7jo+em9BpNbR00?=
 =?us-ascii?Q?7QNgo1SDL2+F7MEoaxcERcpL0EQfW8Uqiyh5vpFTqysnJWwL1Yu5cIkG65j9?=
 =?us-ascii?Q?XK3leJeJmzCgRSZIWvMs9YRj9CVF4YhiWrTBS7WxG/s3oQ3yK4p3k8XZAEIG?=
 =?us-ascii?Q?U04DaYJTqOtwSQI/zp/eRqgzTr8nmpTaqyk1X97Jd+UOQH1yUvZ5kOLXTFk2?=
 =?us-ascii?Q?NKNU7IHXfOmg2n37K26HWLTEydfuIcHzoZ58s6GUaknkHWuisc9C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc9f2dd-5a3c-40b8-937a-08df02bed83c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 15:38:00.7301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /IIW2boKMm67MhiPHk9tecd141y5hEiXQJAO2JCfezv5Pqu+ERoPvuTr0yOLzUSIPWm9YKiiHsMPIwda7R3AnzqsnL0SiSlB25SqIJgksa7JImeZyBU1imywca94j/tL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12038

On Tue, Aug 25, 2026 at 04:15:44PM +0200, Wolfram Sang wrote:
> R-Car Gen5 doesn't use an IPMMU anymore, but a SMMU. So, the workaround
> for the IPMMU becomes optional. Add a flag to distinguish. No functional
> change.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/dma/sh/rcar-dmac.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index cf07c17847d0..9c5210257097 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -219,10 +219,12 @@ struct rcar_dmac {
>   * struct rcar_dmac_of_data - This driver's OF data
>   * @chan_offset_base: DMAC channels base offset
>   * @chan_offset_stride: DMAC channels offset stride
> + * @has_ipmmu: flag telling if DMAC is connected to an IPMMU
>   */
>  struct rcar_dmac_of_data {
>  	u32 chan_offset_base;
>  	u32 chan_offset_stride;
> +	unsigned int has_ipmmu:1;

Nit: most similar case use bool

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  };
>
>  /* -----------------------------------------------------------------------------
> @@ -1877,8 +1879,9 @@ static int rcar_dmac_probe(struct platform_device *pdev)
>  	 * can't use it with the IPMMU. As the IOMMU API operates at the device
>  	 * level we can't disable it selectively, so ignore channel 0 for now if
>  	 * the device is part of an IOMMU group.
> +	 * Not applicable if system uses something else than IPMMU like SMMU.
>  	 */
> -	if (device_iommu_mapped(&pdev->dev))
> +	if (data->has_ipmmu && device_iommu_mapped(&pdev->dev))
>  		dmac->channels_mask &= ~BIT(0);
>
>  	dmac->channels = devm_kcalloc(&pdev->dev, dmac->n_channels,
> @@ -2000,11 +2003,13 @@ static void rcar_dmac_shutdown(struct platform_device *pdev)
>  static const struct rcar_dmac_of_data rcar_dmac_data = {
>  	.chan_offset_base = 0x8000,
>  	.chan_offset_stride = 0x80,
> +	.has_ipmmu = 1,
>  };
>
>  static const struct rcar_dmac_of_data rcar_gen4_dmac_data = {
>  	.chan_offset_base = 0x0,
>  	.chan_offset_stride = 0x1000,
> +	.has_ipmmu = 1,
>  };
>
>  static const struct of_device_id rcar_dmac_of_ids[] = {
> --
> 2.47.3
>
