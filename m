Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795792908;
	b=fphE6IIxwr+tQmUOwBCX01P5UlDA8YyzQ/PagEyvRsQOViF3pQF0KdrLt2/zq0YT2IP+
	 CfQxCHQAwsAtV9K6W77YLjFDARXYT/JrMLZ/G012jsNKM7T/+RZJuzoQ/2r/G73B2qHgN
	 MkeQ/cRzu52LmbP1+RzoFByeD8kYVxxB+wC5YcwPSnTQy7UUYG231scARzr6FwQjy/bH9
	 csrSc3q7TzG5K7YItp3RC156T08IiQMN4nM6XQwFxM9zE43VGvSVKiCKIg2M97Hlj6eaZ
	 hEy1qRxsw5EN8kbCqIKqamGKPRYVtbFx0SpQ3+4EWo0XGVT7UNBr6eYwW36HKbJV5jw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792908;
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
	bh=1DBTB8Ci/n3Y6k0vm9aXcB7uNV+yLwIidGst8DrwTb8=;
	b=qegcUtLGcYXZoMSqTngTusQ4rvOc1vvg5RSKFfWEu2pz0SDbANPs3t2AwJiYWqw+ZaNQ
	 cBrjE02ffb490jl/cvIOW0CQMT5OGEKX3O2GxgEsDNmAK7cN7KkxbIugQ5inlry8ttvt2
	 /xhF8OH5+CxA/cQOIK8IX7MIzX4HMmAIYefAUZCi0Xx1eqcGrK2UE+DfJYuLSglgGWru2
	 M9fLopO10bYqs/+T62bgtwCNbxTUXgdvfo05pnk6/egYGGlDWZ6SREnv+eYwYJEcWHOKM
	 LSVpVcxlBWgSuKcFImpGffJYaPncnlX0wCVSxFr5bjVky+swg+vz2eA8wyZZQO/9IMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lp13waer;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.11
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013011.outbound.protection.outlook.com [52.101.72.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEDC606A31C;
	Fri, 27 Nov 2026 15:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FEDC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lp13waer
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfW2AE4nnrfwUXpVemLiZzHdwlYBhIxPXn/zwUe6+CojW28vjmAn8MppJCZwu6HyFakIDuaIqbFTOL+/zbSHddTR2voo+eOm+zMcAQwnl2p1nqDHzhBUbpczRSTPtuTy+QtPcj/xPYJWMBYUPACAnH+FdVuSzZDbe+a9m9bsz35sSlNYLbFzaBqsx3gN4FZh4qvUFj1hRZ7L1VI81597BSOhArx+9VeSO/6Rzqb/RSZRod7d0L7xhLC0U6t+kQ0RMwnaq4gE4Vg94Dt8mz+e5k4UniV6tAUbKsub1trdAp9AVUDlzkp2Kt1ReElogj/RcZuB/FYavVRYbUSARhjDiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DBTB8Ci/n3Y6k0vm9aXcB7uNV+yLwIidGst8DrwTb8=;
 b=ATe8/1X2xsyQS15FvlwdOIsH3n8vDYZIVmqu47m2Em/vtbYu9A7d9yndypATyFAF+BDleefTng3e6khnQKYWG7Bb5VUsc3ySFVFOxtEdhjY5KOs7hJklLwBssNhGU/ULVft4p/3EbPa4XHl25uQaXhoGmKDQnTkwMHZTeQN3zwyqk4ZzuWrIJWat1b/MLLMIZjCoR8WxQr8K1zpjBcIhUpsiaKARl5Ln+rrzFDZwmE19jaji/Lk67eTLFikpfEmEM5saEKRcDyNPfkqmv+8yTH9nu1Mcv2xbQt7PE6hxyjExBaGDB384Soepdwha4Rj2v68JMOdv+CNTpkxyV5HQgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DBTB8Ci/n3Y6k0vm9aXcB7uNV+yLwIidGst8DrwTb8=;
 b=lp13waerdcsIKVOgPKHWOfcWxqi/imn20+S8pkkZzY7Mg+5G72ikKoGPZCH7vWe50hjndgAU7oFJneNvrtla7S23TrKWNgg2pSnxhFEVi54dpRjJp6uoR4V0BjIs55UrPunDX0kYSa4Hn9MsReOe/uzWgBkvIYYRJa6rqR2UtiGTs6h3qi1qAdJfSBr8L1QaYPCxNbrZn84uZkVG9zLqf8dhZ9IwJ1ZzofVSjry//EKftRndgkKlSFADlQX5V9uxuqlEtQrF/jv93ikvSc3+JJyOlYO/L2mtq4dDvI1XfwWLLdQ3Q6iOqKXFi7sryGJTjBwQ0Q7pB5Ctu/hP5LOEPg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM8PR04MB7730.eurprd04.prod.outlook.com (2603:10a6:20b:242::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 15:21:44 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 15:21:44 +0000
Date: Fri, 27 Nov 2026 09:21:35 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Tian Xuechen <202300460064@mail.sdu.edu.cn>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, vz@mleia.com,
	piotr.wojtaszczyk@timesys.com, manabian@gmail.com, robh@kernel.org,
	saravanak@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dmaengine: of: Add managed DMA router registration
Message-ID: <awmf_2AvjLr8WH8S@SMW015318>
References: <20261127110400.379397-1-202300460064@mail.sdu.edu.cn>
 <20261127110400.379397-2-202300460064@mail.sdu.edu.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127110400.379397-2-202300460064@mail.sdu.edu.cn>
X-ClientProxiedBy: CPCP307CA0005.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM8PR04MB7730:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c0d7b6-67bf-4579-c789-08df4c9a2555
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|19092799006|10067099003|56012099006|11063799006|261021121427099003|261022075727099003|261022105027099003|261026140227099003|261102123227099003|261028144727099003|261009223027099003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	VgeutxBEg72lwm8F6bvRP/fXoEtDPCnp3aacFZTSRxhOtuLDUzN+NXEuQENEdrn9e9qQuiBTgcEoz0Ib/frUVKbyKO1VAI1NyRGcOwIGD20up6RgHwS6qEjeJsAnnO7IVMhhPpCnrvo3bEpWx5CGLJ2oj7TVz4MqW+Ovg9ygGQH9SCna/L0R7KQ5DfkDB/eld99CalNXllSiJSnnd0BJiNzguosASFXYu5igVfX/Flk/6OegCbIp60jnpuLD3MtTvtlwCzU1ebvUyi/yiQykkexmNp8VWfNwoeJVXK4KvcPBYkYsjpsTyS8f2Kl/7kjKWa9DI/xfEzLy0hUxJb81PgBlAHRthITd0IDm1PJTL2Vv4YNSxfmc0Ra91Rc9DexcKRdaW28od52hnWjVLKVi/rzQ4EpP+IhAyOI0IxF/Y/+5bAbgCMQRCFFbKam8ZJy28VdLtWFWhu5eXziP2pUPNx/o+rUhQg1DU79ZVABpTiegoUQXylyfkJkCKHPf3pG/fTM6p/gOKD72Jq1RbB3fcWTdyJj1M406hgKGLCawxS8iXu6pgxRDuP5EV0EnKFXl1b0yb461KOcFYobYnN6E6bS2aAs69MzXjC5A/+oer7VGrK9QBVU+0Cj7AAuMDmsnaZYJniz/PtHz3yBTW9F3Nbpudu7M+7eV7Jh8SflcsaE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(19092799006)(10067099003)(56012099006)(11063799006)(261021121427099003)(261022075727099003)(261022105027099003)(261026140227099003)(261102123227099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?URhg8j0gGJhphJkcE9Eear+/J9xK8ODBmEmVZFBmnFerZdjK++8F7xa7yCXN?=
 =?us-ascii?Q?Tgb3JNHrllR68fAndOROwiIBJcfiD7qSdv58EGuCw9iQyZVbmCdxQES489YG?=
 =?us-ascii?Q?lLWpsKEFzZFRdyw0PF0tIoJiiOcBc+p4Y/pyQ4opjLkxNxGa99HWh1wO9fZ9?=
 =?us-ascii?Q?ByvH6g4kmBsKQnpnI9+WQM8TNnvFv57T1HaDEo3Z5j1r5JF3gWzNHKXd5czJ?=
 =?us-ascii?Q?FKu2c9OREqx5KwP0c70k8AaSIMRJdzyRoiJ/kZD+9fBHJRESnhvO29AgTUr5?=
 =?us-ascii?Q?r57Q8IGus3elDzwYY9dc/PCoHljjHJ1HHeJESAMfL0zfwabdSXyoanNpQKgV?=
 =?us-ascii?Q?fOP1Ft5gXeYbeg+GU7A6rHCWVZi4DSHsbz26p3ogGZDUhHfszC88ynSbLNpG?=
 =?us-ascii?Q?0J8JjPJnm1dqaGo8Z53FnIhMMOsLiyEAAgZK1L8LTj8sFtep57wOYrVK39SR?=
 =?us-ascii?Q?0oIWNB6BF6H3AuR7VwODTsU0TrLn9NRsmnUeYG9ZwOcHpkciA3EBo12+ycS1?=
 =?us-ascii?Q?0FECC8KGE+E6ie6FgFREemRkd6gYNYaVJnlQ3w59sY93JwUk30GpbfNctYj8?=
 =?us-ascii?Q?Sv7Ku9iYSiq5fdo11d00sO1RDxt7SqPVhNAr8kxoqJeB15Mt1tvE4r3+ND0A?=
 =?us-ascii?Q?sem8Axz9iyxcdd11nqVZq5zYnzoeRj7SnxwEgKP+4oX3jPCFpJeCuycH8++j?=
 =?us-ascii?Q?X8NZstieZ9nS5m9CWTaYZRY/0GZarkSMxpGFKYuIyeQ/2QW+uwUCbVXVta/Z?=
 =?us-ascii?Q?9lTZGWB7p4OnTi3tGTw3Bk350NlngLDrFnm9GFUkDRPEwJZhpgQD2me5nIRk?=
 =?us-ascii?Q?/NcLHE6xzviGuvM0i9bbmL4sYwOcPwyvukmXUte1980fu+vwDElWHFAkJTsQ?=
 =?us-ascii?Q?bmysWIo5Rjuyv1tt9uGo/VpIH2QsYKrZolRKRGJ3WkAsqdQPuWnb7PTmK+rQ?=
 =?us-ascii?Q?qNKuw9PVCtlc4YY57o6ZUN/fQZBg/76KrSzkHIdvCtHW0ZPlHW3Ou3vEAY43?=
 =?us-ascii?Q?U8+/Y1VWCtQzX8J0+EEyB9tXHY4fwU6AQW2fbz3TQZFEgFxRXnZk1sGZx+Nd?=
 =?us-ascii?Q?+clGmuFGe5Q5zSLl1D8ypDtBxLO9vUTpWLbA6XeSH6xNHe9BNjIIPn/46BzQ?=
 =?us-ascii?Q?e+FxFWhdwAXiStB4iBHyioFyojS5Tjwbx6SjvRiEnk9gT2p2tmQw50liCvCD?=
 =?us-ascii?Q?fvuUuKm7xFt/gvHmvyVbn9gX+FRe2INXlXiE1/2pPYSafQjoKsCx/8JW6iAx?=
 =?us-ascii?Q?1PeunwxXH6NLRqM3qI+lXzLLl9rkigGE0HOQAJWRAuoXdQfqXsozbL2s0EC2?=
 =?us-ascii?Q?Wm4XLeBzQa1PzzThKe69tJc9aaiDXycmSetUwlsPszeKoWgMIrrWeY05cy5R?=
 =?us-ascii?Q?A1XKszO0PChpW8DTE3vgJXSl+NPcPhlrGngubpjlY0YwRAytuojxuL+M8wtB?=
 =?us-ascii?Q?7rj5qgVEVnE9UVDW3w1bPbh10wGYf5QihDTlU/IdGYTP3iBe5Cz2iiMfGZzU?=
 =?us-ascii?Q?18rYWGafp2YKwq6rdhzPVELtCgoQ4gsvFdkvYyEyb0Z7O+SSemqMvN9h7S/v?=
 =?us-ascii?Q?ATDFBRfoCIAVhpwmm9G+oQDJ4OLNkPFv5xZetxTpNB5jzRO9uCPb69YujIOS?=
 =?us-ascii?Q?VeMfqoln872Ptn3ozhR4H9U1cg+4fnB2WK5RejMdcs9vTW6TyyuJNMVbUT0K?=
 =?us-ascii?Q?o1KmeJ98gbA9he7oa9B8UDmivk6FDH+rgWvVYYETGYADY1w4Sxgi10Ajfg88?=
 =?us-ascii?Q?h/yG1vxT/A5Ht6P5X8/dp1c2NF8dp28rTgAJ93rWRX9pac3yhOd6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c0d7b6-67bf-4579-c789-08df4c9a2555
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:21:44.7411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSgL0Sg/5QBdns311bHLOf2+kD5EuK6RTZ0jw/aOtoW0bJToAICrHfhfB3URZGstseN0S10SQ8pyF21ENBkWxcn5gHSM///CRRl0aU59Qk/LLxPgajcBD8nIpt5NE7fb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7730

On Fri, Nov 27, 2026 at 07:03:58PM +0800, Tian Xuechen wrote:
> Add devm_of_dma_router_register() to unregister a router when its
> device is detached. Reuse the controller cleanup action, since routers
> share the same OF registry. If registering the cleanup action fails,
> remove the newly registered router immediately.
>
> Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
>   - Add the reusable managed router helper.
>
>  include/linux/of_dma.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/include/linux/of_dma.h b/include/linux/of_dma.h
> index 16b08234d03b..7f9198ea9627 100644
> --- a/include/linux/of_dma.h
> +++ b/include/linux/of_dma.h
> @@ -64,6 +64,21 @@ extern int of_dma_router_register(struct device_node *np,
>  		struct dma_router *dma_router);
>  #define of_dma_router_free of_dma_controller_free
>
> +static inline int
> +devm_of_dma_router_register(struct device *dev, struct device_node *np,
> +			    void *(*of_dma_route_allocate)
> +			    (struct of_phandle_args *, struct of_dma *),
> +			    struct dma_router *dma_router)
> +{
> +	int ret;
> +
> +	ret = of_dma_router_register(np, of_dma_route_allocate, dma_router);
> +	if (ret)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev, __of_dma_controller_free, np);
> +}
> +
>  extern struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
>  						     const char *name);
>  extern struct dma_chan *of_dma_simple_xlate(struct of_phandle_args *dma_spec,
> @@ -103,6 +118,15 @@ static inline int of_dma_router_register(struct device_node *np,
>
>  #define of_dma_router_free of_dma_controller_free
>
> +static inline int
> +devm_of_dma_router_register(struct device *dev, struct device_node *np,
> +			    void *(*of_dma_route_allocate)
> +			    (struct of_phandle_args *, struct of_dma *),
> +			    struct dma_router *dma_router)
> +{
> +	return -ENODEV;
> +}
> +
>  static inline struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
>  						     const char *name)
>  {
> --
> 2.43.0
>
