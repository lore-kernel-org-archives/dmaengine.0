Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013053.outbound.protection.outlook.com [40.107.162.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84573B100A;
	Wed, 19 Aug 2026 19:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787168569; cv=fail; b=qaQHaY2htjc1xcqkQPFNIkgZ0w+HwWbZiR2DNlsr84z5UjohdwcUC9xiLWgc1Rctih2xcUktCldIV+EiiskAV3yWs8bcKYzjIMIc0fihOk57XuDVIKU7NkuMWKXBdVQ8ah3epdLnYO8Uh8DiYHGt1VVzlQ5A9k7bSktduGGBTgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787168569; c=relaxed/simple;
	bh=ZLqsjxsNT5PWmkj5OH85mOjrB1Fj+MsoDz1UxFBiGw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FV2LGBpyWfJ4dhiRLoNg5oATy2C1gbpA8iveESZHD3kLqfgZ05fYJQaigl4BK5a2dl389/Wz680cGCODUf+vnRDOQGH3vXmEjdbY8X6M4VA6ZVLTn2j8JinjRAQDfJdLIir8HBsA2jGJ6QYelBOF89ctRQ1QssHM1YOM4Z9AC2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hpwqBChx; arc=fail smtp.client-ip=40.107.162.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hpwqBChx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zKzmaOkb8yIl/sRzEsz12F5roZAthM8o48MrBcJGIvjSlFf1nT9VBUIQxqtTegVAr29FUWYqP/jhCsQF1p+O47rWhoZJPFV3orGoUrKK2bgRAOD6AAyzo+1eKv4RK16ziuGXbODJvi3bILPgvZC2DkCHOIcOrCZUrOnMwNi6h1aqByp92/ZdXKb5UAarPJc7OGH6gW4N7wcuyN9XipCGnQ/HYvSzsUVgP8f8WzOEXytT9wWv+oPAOoujBNPWKK0eSc2saYEC1iDYqPf9uO1SGmpFOuARPQB1JaADZeO0CeFVYyz5GQeey97Nc0gR5Vdo453Uf9AxowNmPUR2Z0lkGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Zu3j+hHqQBsEpaRjsYs5QItSZ8npOZTAaDRgwBzohc=;
 b=PWfvL43tNVNuK5mGRE872H686DiFAuKnyZ1FrUrLMjg6XvpiP0U9fz69l2OcQ4+0b6SRp7u7LHnOiyPUbIWjmS2hlfIJeBnA4CgAxfVNAgn9QcyVtrAhLYPBhpn81BEfnWKVFsxIMRNN6BBHS8heNfBr1sYZdacUZYJzEungpz0P6nftPzQ3Gl+LvXlIyfSOEip6q8O/feO5n9KrAzM4ouKdddfuhIuZRwg2evhlhBAFHPTPNYYBYuNlE69QSATfH2nJQwiA3qYyl/B49a/5SGbrVUbAR6tMR3MGmiIYUV8N5pm6LgKwU+XN4zLT5rr6vUXk1NhjpIezBE8Uu0AVnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Zu3j+hHqQBsEpaRjsYs5QItSZ8npOZTAaDRgwBzohc=;
 b=hpwqBChx0zpp2Et1923x+zyP13wcGEvC9fYgNNs0iJstgJ2Nvg98prKCHBZFAhp7KOQBVNG6MwIaVLvMNP6a+5LZA+pjSWf64GVO9Vrpzq53pt68CXBtBNOH3Iu2Ijqc2GijdYeaIR1sGqn7GTxdnL9timQms4xByFfzyAjbd8S5QnIheFomMucr7GGgcKz1IkQawpqzQdhKIr+ig97raHgXugD+rkMxdJgKwwmdUaTODnYDccxPvHUDB6xN1LT1a61FAgCOMjMmN66mOjledY06OONtGNSThq15BWhqaEtJteEHWT7fWAWj8pPvGE4DVvi9H+2y61KzZWQ4/C9wwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA2PR04MB10335.eurprd04.prod.outlook.com (2603:10a6:102:419::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 19:42:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 19:42:42 +0000
Date: Wed, 19 Aug 2026 15:42:35 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Alexander.Chesnokov@kaspersky.com
Cc: peter.ujfalusi@gmail.com, vkoul@kernel.org, grygorii.strashko@ti.com,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org, Pavel.Zhigulin@kaspersky.com,
	Oleg.Kazakov@kaspersky.com
Subject: Re: [PATCH v3] dmaengine: ti: k3-udma-glue: fix NULL dereference in
 k3_udma_glue_release_rx_chn()
Message-ID: <aoYHK2vV8B49ETVY@lizhi-Precision-Tower-5810>
References: <20260812053426.3521589-1-Alexander.Chesnokov@kaspersky.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812053426.3521589-1-Alexander.Chesnokov@kaspersky.com>
X-ClientProxiedBy: PH7PR02CA0030.namprd02.prod.outlook.com
 (2603:10b6:510:33d::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA2PR04MB10335:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c82f959-5be8-4e8b-77e9-08defe2a08ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|56012099006|10067099003|6133799003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	z4m5vsyJGl2P/I6SCZJAbl3LcuFX36ANQiFi/KenBYg85a0e1mAuV8XXETu+LRgvG5R8agWACyvN97PxjSLIGezLuV9i0RIKH8Ta0IBVCUhkY9sspjpdmxtMZQjF0ygmvz/JCZPbhn053b9B7RNx7mkGpIw13i5WR6N7Wrt5l0gxiN8MN9IrU9h4MmtNgC5EQFUNk776UBtew3JkuT/UKXVtvYlboO4+c0bKTnqQ+XVgtDuliuPY4ZGajUjrzRlzWzvIQtxpA0I3edvX2QCRwFrdH4NBX4uf5FeN/oSd0Wu8LxgtFCmblX0dS2wbpCK9zPiAC8AJbsgnhp1ROQEDT9f7l6TN/70VcVwFSpu2Y5uAsL95h3Zdw+eLv5bSbH2eT/E/ai1NI8/5QCJUFxmKQXHU9KjD0BPsApLS4CiwD5sRhDhhsDlB/ibYLHDfS4763x+7kgt+AFZxHor7f05+EjSjxh6F4Es9uWN/i0DWxDNEj3AMBYtkbSXY5nZ1KrDUnE7kejP6ggEioy7hFwO89LfJEn6SzJqqc2SF+xGhuUq46XgmKVzJARBxcVVhEPS9l0/Dd/+efrpjgFJhD65EK0tTl+OShtnEvzULY+MtbbDRwWFHnAKBFg6W/6LlpTaPOhbtSspq0sQCIgI3j0WAOHMwR74xsSB4y5fZgj6b2b4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2q3fZTX5Gh2R559WWWDz1PFiym4rOjtlzmJomVZI06TpWhUEHnD4USTFTDUC?=
 =?us-ascii?Q?7y3jZS2KaCOduj7Z0jE2O9tREz1O8AF77Q7jQ847J/jalyiocC4jVw3/zEWe?=
 =?us-ascii?Q?4wnBpsJvRXfQwQLN9ZnsrfFkqW2p+QNxEK48+w5ARtDC0o0gSAvDSmsvH0tj?=
 =?us-ascii?Q?YUDXSrnZZMGpPvmxUFkrdluHfqhUnC/1snkCS6Myy9KQdyFGb3ierBrKkwet?=
 =?us-ascii?Q?/8MEZssbqVpQJpM2b/jVMJB2oEhFPgAkmT/PBb+B5Iv4/YeZda9GeqfwXgwf?=
 =?us-ascii?Q?pGu5uxp2edWwiiKevjWg7YBC164NGnzvKG09DAX+brHexK+0bOofys2PbUzW?=
 =?us-ascii?Q?zCXj/HJMGxs+nQ38ge50QZSPFBR/xegqjCFnShOIlKIFr4ZJS13adDb+tN3F?=
 =?us-ascii?Q?D9+GWM5CzH36IbUuMI+zwa6ZmSSCZbb4h5Q7I+jHwgdW+YvbKbFgHhjf4Rvf?=
 =?us-ascii?Q?M8UAB9sjUMtOPayGyeS0MyFPhDgqkCJHz9rzfDlcgfqfBShjTia3vjDPDuGL?=
 =?us-ascii?Q?jqic4cOzJVjWKuANsIbHU0WWzzAjnUhcNg8ldjsDVqJ4TQOTKsOUsIPnkIbM?=
 =?us-ascii?Q?TNpkhz7W8qyEq2n4dF/iIASHc4fy3Dm57R0Q/030c6cHH6g1y3mWp8/sg5ax?=
 =?us-ascii?Q?n6vbG9qPKMY8uKOeXgcBzc+TyNj3DN4eE9ov7eGhRng9EoaHDcg1FTsdXKNV?=
 =?us-ascii?Q?N+CS1rPgGv8AqWKu4bDQjo9cswArb9aix53RZoq71HE3ggrolStCt0peQBr4?=
 =?us-ascii?Q?dT6kjhwJwl7/3R4wTjZ7MJ7k+lwRRrv0VnOb8Q5hCCYOFQHgwQsDyAS7D1+d?=
 =?us-ascii?Q?kh5Q8SG+gyywhO4zUh8/3Dip71JP4cNl+mEUwaqZlWCLthCcG46MlGRzCKTK?=
 =?us-ascii?Q?N1AyKtZtDtT44PXXUS75XxPgyd/9CbN53i5tqKP4ysC05Pe1+f3qFKxmECyV?=
 =?us-ascii?Q?sDIll6JbFYQlv9DlhY+nlL0w0B3KeUjbpaWVG32e3W/q2aysTqTMnla1q3xF?=
 =?us-ascii?Q?pTdehUR5rZmfPQ/TTOWRMUODtx/ezhyGXMiTNMbINmPe0JJJ/ebTCvrwb5p+?=
 =?us-ascii?Q?Vt6V+IGM0NIQ9/Ox8uaY4kOHjwgrvJItc7K63JNzu9R7oaVf7CSvYLVBIk0S?=
 =?us-ascii?Q?H0LFEVz9zBIT/24tZUzK5IYlsiqcEUKUrJ/mh2Fr4ds/jbN/sxx8ICTSjpB3?=
 =?us-ascii?Q?ykAMNhyU2viSWHFppKtzLfT6Mluc3GTDbV3I46iqf9vveTUcl/Q0eERCOJ/X?=
 =?us-ascii?Q?58vYB1LwlboFbXiwpuqyXttq36yVYVPOTPhJK3wyGnW75s/pAPwF1rW5ajIY?=
 =?us-ascii?Q?ImpQPUzRL/NxlapzNMHtCku+6r0Wc6oDJEmDvDF8r1oUEitrj68id3k9uWg0?=
 =?us-ascii?Q?Yf0Zlu2DbKirFX6QFKkc8TBBYaw034EY71WYoMOLY0UhEiYZdhkvoOmLpC7r?=
 =?us-ascii?Q?ot7KhwO1rim1V6v1eJsG0BUWdsFYJ7n04DR9BsVXcSRzZ+FwTKqG1ujJQSZf?=
 =?us-ascii?Q?gF7xgFRY6VwgeKZRzzjUqv4imVMBVGd056ZbzNNMiIzukIiDzTlBVxvt8dk2?=
 =?us-ascii?Q?uNePxkEJrFKDxIIyOyXI/cKBByMbGX2wGiXBVV0ZDE2beFerxdqjqeYEP7NU?=
 =?us-ascii?Q?zFzSzSkHqWLjh3mXRfrkuRZsuif1Ifxs/9YR1HQ4yYUiKo3csLnOmtXkChYN?=
 =?us-ascii?Q?YIvF/hU1BMoOudV7q7zQyRgM7VwAHanclezI/xk4CHNnOzxpibNMRAky0R1B?=
 =?us-ascii?Q?r6GnsbKlCh1ds0AbjvRg1g4J7crsMELIHHqJtWGO8Zhi4GC1GxzY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c82f959-5be8-4e8b-77e9-08defe2a08ee
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 19:42:42.7234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ngJmsCygXEjvRT6jVeXA07UrMDBv/kVnt99mvK/S0+ycXc93YEPpHDtPL6oG9xzv5FlzaPti2b5WZA+GjGPCBcVgBTuhAt+DqllTIUi4j5GImuKZ+6rgG+2N9Ju+73ys
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10335

On Wed, Aug 12, 2026 at 08:34:26AM +0300, Alexander.Chesnokov@kaspersky.com wrote:
> From: Alexander Chesnokov <Alexander.Chesnokov@kaspersky.com>
>
> If devm_kcalloc() for rx_chn->flows fails in a channel request function,
> the error path calls k3_udma_glue_release_rx_chn(), which dereferences
> the NULL rx_chn->flows pointer in k3_udma_glue_release_rx_flow().
>
> Skip the flow release loop in k3_udma_glue_release_rx_chn() when
> rx_chn->flows is not allocated.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: d70241913413 ("dmaengine: ti: k3-udma: Add glue layer for non DMAengine users")
> Cc: stable@vger.kernel.org
> Reported-by: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
> Signed-off-by: Alexander Chesnokov <Alexander.Chesnokov@kaspersky.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> v3: guard the flow release loop in k3_udma_glue_release_rx_chn() instead
> of reordering the flow_num assignment. Covers all error paths in both
> request functions.
> v2: https://lore.kernel.org/all/20251006124258.1132312-1-Pavel.Zhigulin@kaspersky.com/
>
>  drivers/dma/ti/k3-udma-glue.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
> index 4f1aeb81e9c7..a739e60b0764 100644
> --- a/drivers/dma/ti/k3-udma-glue.c
> +++ b/drivers/dma/ti/k3-udma-glue.c
> @@ -1103,8 +1103,9 @@ void k3_udma_glue_release_rx_chn(struct k3_udma_glue_rx_channel *rx_chn)
>  		rx_chn->psil_paired = false;
>  	}
>
> -	for (i = 0; i < rx_chn->flow_num; i++)
> -		k3_udma_glue_release_rx_flow(rx_chn, i);
> +	if (rx_chn->flows)
> +		for (i = 0; i < rx_chn->flow_num; i++)
> +			k3_udma_glue_release_rx_flow(rx_chn, i);
>
>  	if (xudma_rflow_is_gp(rx_chn->common.udmax, rx_chn->flow_id_base))
>  		xudma_free_gp_rflow_range(rx_chn->common.udmax,
> --
> 2.43.0
>
