Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010024.outbound.protection.outlook.com [52.101.84.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4DE43B6F3;
	Wed, 30 Sep 2026 19:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797032; cv=fail; b=VzIVufBQ4T8JDt8vncXdkds/UT8H3jZBgoEz9WnR6Mu4tg96QArltVVuHWe3rpNIB6ZwSOSHrIOs6IsXcp0Fb9d4huFC3F6xT4aNKDrD7MiGCN1BPFiTjRDuydSLZhHMiIgHM/pvLF9+N08vfZWY01IA2Lrsy+zJlwi25/VzKzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797032; c=relaxed/simple;
	bh=r2NeiwxwzjvVI0LQyqvm6l2MP6wJ8gSJ0ULdXH0RiDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WjHxzqP3/g1Nm/3aTkxeFbB+jv1emYTv740TItIRBzzSo1uiQbNoTOBBUzA+D+lJNX73W5X/bB+iqwpBoBHWdGAZnC/oDpbrHu6IzjcxlHasZh+qy7kM/ghTOztfKlb8iJ06QFqp4JPqCWla579m6RReEjAnPf1ff9d/NhzQP6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MH6xXSQf; arc=fail smtp.client-ip=52.101.84.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MH6xXSQf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p3QSSnlj5XPcxmL0IhUZHp1ngzm5/5jr0WQsXnl3lwsYZASiqRFNaNJg+gjsR/nmHIRQ209llqUQcz9Li02wpfngbQhj1oO0foJZwaDtaZ6TwrVd5IKOvnQvJsBrbXXJHEzfR0D51b5NG2hmrgRVxF9ix+/E712coRUgWw4fc+Vs6fmmDG86mLMBdGyr5RA1hMgrcaEnv0Lw5S3tRGpUGXK1BFTF08enHttxeFmMmfcAEWovxTZ3UHCSEX7CfqthzuLcnN0sgg7dssJNd29Zz5EETYJeBkLbqh3nwMzXPDbSGgTNHURPAVKAoXnEI/geGYhKvvBZy58PgeuHfh+k/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0THXl+KCU1b06SiOaLwPcLdBM4QR/RGl6qm73/f/Udk=;
 b=bzF+56c/1GM/ffCoX99rtlBoAwI1QeIRDwC5SVZQ9wwQ7/p4Q/FpZDBVXrinNXgdg16QR7uukLQsZBfUzqWtc9NK4Y7UvFu0dbDYskwZVLBqhzxBCRdf3hSv9UL4doJgMUAfF/orJtuqYXA6oFJ/3XpEljivwdyUEF+FsYctEliECznGFo8uhKdWxIbUWWX/3bGa+pn0Ip44E5e7xxDza9cXhNe4RcG7gJGYAwIeYAummgnegiftxaMFN7ZSL1yrdyJQSebCwmykpTR8QRd4zW3S3KXYbJLVIMNLKLaomzLqd3oIqrssD9b2ykb01IKECtfuTcq0YiNOELxvwKgBUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0THXl+KCU1b06SiOaLwPcLdBM4QR/RGl6qm73/f/Udk=;
 b=MH6xXSQfhbNSvGHfclgixc1oWuKZsA6aJO8OsKzIi5mjviUMOYoSd3lF48LO8vC2rhT76Bd0GVzma+RNeoZteFdcncmrtMgw77yIfQ7wU079FxnLKZrz8Zzc5Hy0i91eQrYiz2Oa4oIkHpOFNltM1GTfetH4I64XHTKBG++Nk9B/etruXXPj0hNewD1aCsZ1L5CqCHDGrnaXSMyGx5lz0C0Fr93maBnuYMGEmSnX+K05cfaZ0qbHZpf+9PEfvuaIjX2LoyEqJs45s2ep1V5KHevV2xTgkuDiZD+/YoxXHcPBpwGCeiQw5qZcKGPvv5GcljworlqO22F7C6XvL5xKnA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB9781.eurprd04.prod.outlook.com (2603:10a6:10:4e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 19:37:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 19:37:01 +0000
Date: Wed, 30 Sep 2026 15:36:54 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 21/24] dmaengine: ste_dma40: Fix V4B event group
 mapping
Message-ID: <ar1k1jTz4EdBdBfE@lizhi-Precision-Tower-5810>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
 <20260927-dma40-fixes-v7-21-89f595e8851d@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927-dma40-fixes-v7-21-89f595e8851d@kernel.org>
X-ClientProxiedBy: PH7PR17CA0015.namprd17.prod.outlook.com
 (2603:10b6:510:324::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB9781:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa384fd-b556-4e08-026d-08df1f2a32af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|1800799024|18002099003|22082099003|4143699003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	iG1eQtdRxRxP2uE/jJI4MUs+5Pcwrd23o8xuW/qHUJOTIzEZyEZVmnAVhTfzMlVav6XHq0xCP32iT9StcNpLTT2w1I8LvEN1Y7zw/c+Xo5GRsl6mLEcH0Ayq9wR+MOxktcvCCgyMdGnyftLDr3hZiwYNp78Oxp5OJ401S2iDc4pwPKey/5wEKHjPLfBAMSK989eFNLSzFQdcjq1Zeo1SUqEI9iMWZS2EVyaarA5yH+nn5Pu9gC7EsPxd/0sNlvUUYqbqRVAMLVLoL0I+D5ayGXr53La1wLpeQea+yfvYOvozap68uAkwVjEokOFJv9zhMy3Fjl1QfvaGZRwLmHvcDxMSw+CFpeofE182jmyqezmlarPLBR6xRqMnyTmmoll4a6sMSMl2GVvsDEYzBbVWMbHgNhsuJOuM4U1frbvvDzMhh1tIX3hIi9PJW6jjnlD+6mPoeorULfYNNuMqUlhrZ3s7nU37EhRhmkgCwWoNQPQtRgOaE92leNIVewx3ZqliLnoK09YrT4hGcRwIylCE3vkh4CvlFE7RGnYfhNuUesODaKtfFIgqliHFedOoq/a14GPLl9JyyMbIpnekrWQSyCHbCcD8rfViA2+HpeDP3o+WxsHUDC40Epw0pjXc8wZfdeW1Fn3HvKXxNtiTY0qRsRQGhtm/PMqbChfPydfvfzY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(1800799024)(18002099003)(22082099003)(4143699003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X/mXbkkHSLbONL2/2j1Vga7Q5Ygl8j21Xo0GoZpYKkfKQG02W1infuWRJGMd?=
 =?us-ascii?Q?tnPXFrdt0z9wHw/jx1ouCdTNMDqZWQVnh1iO/3j+56V+pnJePHs9cvyZ6xrs?=
 =?us-ascii?Q?8wrmR5fnBI3pC83VfbZiAaiytPC7NT0NyL+Z5Ro7nX4GTVSuE1/V558cKv3Z?=
 =?us-ascii?Q?kJsEhOCp7kplKcXnhVSSr+GYRwU8Pi6QKLNu76vhEi2DtsDcvDUZEMoI86xg?=
 =?us-ascii?Q?wp5Fb9HVf8LwJYK5nEIvYWUlDS2XWJHZPGvW/5bc2uyqo0W87sQcQfOLamr3?=
 =?us-ascii?Q?Tl7ks1c2ZQ3tqo4opEzlCMiXOrMuWmPOYnfBJfEMZtEAK0D3A2MwtOrHJENW?=
 =?us-ascii?Q?FBO6tcH+JHFWyl8jXlZLUSvPat2bblWLaM856ZpKBy/G2iTxJPzwVoczBPFG?=
 =?us-ascii?Q?rP9z5rIkxn0+sNsba+5dTWHCAcPjNXA825kIgcxQX4JJ798WGqlrddbCfLBk?=
 =?us-ascii?Q?R4nwHCWfg4TTZtur+C0r53pvvmJBbfKZslvI1BAR28KNoQvTnLnxyr7mL1Kw?=
 =?us-ascii?Q?LP243pNROnulnFkLV8WUbZ8CdxprhNn8Gr2rtZiXGrY5cxaKXXGEHpcxSrbv?=
 =?us-ascii?Q?zAN91Sd8aKH9yNaVQsTluZkjAvQl0bHvzEuvqxzeyA6RykT9YMAJ1TGznu+u?=
 =?us-ascii?Q?K21UXcBx3VW1+ggWYIGX5KpbVXwPrUx6Jojknb030cRNcnyFZWdPiDUPu3Hr?=
 =?us-ascii?Q?wabnBGb4SEzpaaunoDXeHqcVTBHBJiUkmLnEXukVLlz3ftXjipglz5fcKyeB?=
 =?us-ascii?Q?5Vae4iznyP4TD2X8HrnFLX0eNk30FA5lJFghhBnpRi4VLmEZOdrOzj8dWKZr?=
 =?us-ascii?Q?0GKGX1knNYp62538r5vI0xox9Jf6ZZ+L6XB+bN7nv+la2W0Ji3WF1sQc5yUk?=
 =?us-ascii?Q?zYiBYwx4k5o4HEZ3j+oej8awKKIvc3dPcYdbvByIsr8r5fnIlaT0P3/iydeQ?=
 =?us-ascii?Q?XQgoc/T3RPaAnC07EDQZ3OPFhpGZkWob/e3tTnlb54UR58UaUv3FdwkAtAyh?=
 =?us-ascii?Q?7ywdMxW9sYlf5ukHeClqd8NiH0+Sc2RyXeRm3yjQfVXZqirT8VeikZcAX7WY?=
 =?us-ascii?Q?hxCYdANak4f4uksItwgRcTfcRrlf9AWOAATCfnVvEjRIZwPGF81j6jpBqKUv?=
 =?us-ascii?Q?xVw8qaDzdVKPjIubuvDY5y16tXOeR7UhH8/pXV4snFzH7mdUI5+fbNEcJFtH?=
 =?us-ascii?Q?pzzrG7XG4b89Tk2O654khI+G1qrj5i9NadScMMLLnn1YM1utCoxE4uKvPEWK?=
 =?us-ascii?Q?/oGidqCLpVtBfIsjerXc9BnHcGKDJNHVDOKANIYXQyUAa5x9djd0zp3TdWXN?=
 =?us-ascii?Q?u1zVZVRtWV4mt5H0zUFDVpnB63Gs2L7IkWEqv73n6ruPXWN7/UDdW4FGsRHx?=
 =?us-ascii?Q?Bf13P6njPdMseyaMReZZUzeS4RakI6ZOFA1gNCDcdPPdKlHybbRACSiLRMkx?=
 =?us-ascii?Q?PoKRe2hK/QSxkp8KGWo0fvf90Hf/cOpiEjpY78qk2h1jP+ORz0D4fwUkzzq0?=
 =?us-ascii?Q?uCjmKi7z9YJuThPIKvScGWIVO7/gSQ69RKg/diuIH8YpebNcf5QUrNrXCMbe?=
 =?us-ascii?Q?ta2CxdYmbtWgwGvN+KPqez3+qXDGWvwj/UwhoT2EqH9wX620hi9Xub05iOgr?=
 =?us-ascii?Q?7a2q3RFm9gOdriyqTIIVQi2FGKw4IRtSlmrxvMGTmHeRmsKw//rFgC8C9MgX?=
 =?us-ascii?Q?VXl9LTtHXwzrMYFzWTEJesFTDDrVWEd0w+kAUGBsxSw5rMjQz2397UKMmQ1c?=
 =?us-ascii?Q?hjpTwfzDxvO2PWtfJBRLVMirifb//MDPgwknhbY9NPrg7w8ENd8O?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa384fd-b556-4e08-026d-08df1f2a32af
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 19:37:01.0920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZSXJWWb2IqKA5+bCBCg1OUIhLa5Rhv7rwjeLM1Pw+oO0xf8hBN2LhbNIWL6BvGERUTmly3s9AuPZ9fmPiq+F07v8hqr63nXiOMHl2CrRdYKDqbNkJfY20s28Xo34eIbU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9781

On Sun, Sep 27, 2026 at 11:03:34AM +0200, Linus Walleij wrote:
> DMA40 physical resources are connected in pairs to event groups. The
> mapping repeats after each complete set of groups.
>
> D40_GROUP_SIZE and D40_PHYS_TO_GROUP() encode the four-group V4A layout.
> On V4B, which has five groups, resources 8 and 9 are consequently offered
> both to event groups 0 and 4. The GCC clock bookkeeping also treats these
> resources as group 0 instead of group 4.
>
> Derive the physical-resource stride and reverse mapping from the
> variant-specific number of event groups. This preserves the V4A mapping
> and gives V4B a ten-resource stride: resources 8 and 9 belong only to
> group 4, while resources 10 and 11 repeat group 0.
>
> Fixes: 3cb645dc85a0 ("dmaengine: ste_dma40: support more than 128 event lines")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c    | 47 ++++++++++++++++++++++++++++++++--------------
>  drivers/dma/ste_dma40_ll.h |  2 --
>  2 files changed, 33 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 91dc143f9a80..a5471a9157cd 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -85,6 +85,7 @@ struct stedma40_platform_data {
>  /* Number of event groups per hardware register layout */
>  #define D40_EVENT_GROUPS_V4A 4
>  #define D40_EVENT_GROUPS_V4B 5
> +#define D40_PHYS_PER_EVENT_GROUP 2
>
>  /* Max number of logical channels per physical channel */
>  #define D40_MAX_LOG_CHAN_PER_PHY 32
> @@ -2027,6 +2028,12 @@ static bool d40_alloc_mask_free(struct d40_phy_res *phy, bool is_src,
>  	return is_free;
>  }
>
> +static int d40_phy_to_group(struct d40_base *base, int phy)
> +{
> +	return (phy / D40_PHYS_PER_EVENT_GROUP) %
> +	       base->gen_dmac.num_event_groups;
> +}
> +
>  static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
>  {
>  	int dev_type = d40c->dma_cfg.dev_type;
> @@ -2037,11 +2044,14 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
>  	int j;
>  	int log_num;
>  	int num_phy_chans;
> +	int phy_group_stride;
>  	bool is_src;
>  	bool is_log = d40c->dma_cfg.mode == STEDMA40_MODE_LOGICAL;
>
>  	phys = d40c->base->phy_res;
>  	num_phy_chans = d40c->base->num_phy_chans;
> +	phy_group_stride = D40_PHYS_PER_EVENT_GROUP *
> +			   d40c->base->gen_dmac.num_event_groups;
>
>  	if (d40c->dma_cfg.dir == DMA_DEV_TO_MEM) {
>  		log_num = 2 * dev_type;
> @@ -2075,13 +2085,18 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
>  				}
>  			}
>  		} else
> -			for (j = 0; j < d40c->base->num_phy_chans;
> -			     j += D40_GROUP_SIZE) {
> -				int phy_num = j  + event_group * 2;
> -				if (phy_num + 1 >= num_phy_chans)
> +			for (j = 0; j < num_phy_chans;
> +			     j += phy_group_stride) {
> +				int phy_num = j + event_group *
> +					      D40_PHYS_PER_EVENT_GROUP;
> +
> +				if (phy_num + D40_PHYS_PER_EVENT_GROUP >
> +				    num_phy_chans)
>  					break;
>
> -				for (i = phy_num; i < phy_num + 2; i++) {
> +				for (i = phy_num;
> +				     i < phy_num + D40_PHYS_PER_EVENT_GROUP;
> +				     i++) {
>  					if (d40_alloc_mask_set(&phys[i],
>  							       is_src,
>  							       0,
> @@ -2100,9 +2115,10 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
>  		return -EINVAL;
>
>  	/* Find logical channel */
> -	for (j = 0; j < d40c->base->num_phy_chans; j += D40_GROUP_SIZE) {
> -		int phy_num = j + event_group * 2;
> -		if (phy_num + 1 >= num_phy_chans)
> +	for (j = 0; j < num_phy_chans; j += phy_group_stride) {
> +		int phy_num = j + event_group * D40_PHYS_PER_EVENT_GROUP;
> +
> +		if (phy_num + D40_PHYS_PER_EVENT_GROUP > num_phy_chans)
>  			break;
>
>  		if (d40c->dma_cfg.use_fixed_channel) {
> @@ -2129,14 +2145,17 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
>  		 * channels.
>  		 */
>  		if (is_src) {
> -			for (i = phy_num; i < phy_num + 2; i++) {
> +			for (i = phy_num;
> +			     i < phy_num + D40_PHYS_PER_EVENT_GROUP;
> +			     i++) {
>  				if (d40_alloc_mask_set(&phys[i], is_src,
>  						       event_line, is_log,
>  						       first_phy_user))
>  					goto found_log;
>  			}
>  		} else {
> -			for (i = phy_num + 1; i >= phy_num; i--) {
> +			for (i = phy_num + D40_PHYS_PER_EVENT_GROUP - 1;
> +			     i >= phy_num; i--) {
>  				if (d40_alloc_mask_set(&phys[i], is_src,
>  						       event_line, is_log,
>  						       first_phy_user))
> @@ -3307,9 +3326,9 @@ static int __init d40_phy_res_init(struct d40_base *base)
>  			base->phy_res[i].allocated_src = D40_ALLOC_PHY;
>  			base->phy_res[i].allocated_dst = D40_ALLOC_PHY;
>  			base->phy_res[i].reserved = true;
> -			gcc |= D40_DREG_GCC_EVTGRP_ENA(D40_PHYS_TO_GROUP(i),
> +			gcc |= D40_DREG_GCC_EVTGRP_ENA(d40_phy_to_group(base, i),
>  						       D40_DREG_GCC_SRC);
> -			gcc |= D40_DREG_GCC_EVTGRP_ENA(D40_PHYS_TO_GROUP(i),
> +			gcc |= D40_DREG_GCC_EVTGRP_ENA(d40_phy_to_group(base, i),
>  						       D40_DREG_GCC_DST);
>
>
> @@ -3329,9 +3348,9 @@ static int __init d40_phy_res_init(struct d40_base *base)
>  		base->phy_res[chan].allocated_src = D40_ALLOC_PHY;
>  		base->phy_res[chan].allocated_dst = D40_ALLOC_PHY;
>  		base->phy_res[chan].reserved = true;
> -		gcc |= D40_DREG_GCC_EVTGRP_ENA(D40_PHYS_TO_GROUP(chan),
> +		gcc |= D40_DREG_GCC_EVTGRP_ENA(d40_phy_to_group(base, chan),
>  					       D40_DREG_GCC_SRC);
> -		gcc |= D40_DREG_GCC_EVTGRP_ENA(D40_PHYS_TO_GROUP(chan),
> +		gcc |= D40_DREG_GCC_EVTGRP_ENA(d40_phy_to_group(base, chan),
>  					       D40_DREG_GCC_DST);
>  		num_phy_chans_avail--;
>  	}
> diff --git a/drivers/dma/ste_dma40_ll.h b/drivers/dma/ste_dma40_ll.h
> index 2e30e9a94a1e..55090cb31057 100644
> --- a/drivers/dma/ste_dma40_ll.h
> +++ b/drivers/dma/ste_dma40_ll.h
> @@ -16,8 +16,6 @@
>
>  #define D40_TYPE_TO_GROUP(type) (type / 16)
>  #define D40_TYPE_TO_EVENT(type) (type % 16)
> -#define D40_GROUP_SIZE 8
> -#define D40_PHYS_TO_GROUP(phys) ((phys & (D40_GROUP_SIZE - 1)) / 2)
>
>  /* Most bits of the CFG register are the same in log as in phy mode */
>  #define D40_SREG_CFG_MST_POS		15
>
> --
> 2.55.0
>
