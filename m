Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010054.outbound.protection.outlook.com [52.101.69.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF34C486421;
	Mon, 14 Sep 2026 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401512; cv=fail; b=h8vVUcWbb0zn0G/SqOHpO9lQM2e9fXN3aehqahLz9enaeffq17F9AhzvMrrbQhItUXXxQuBvWvuxZQ9EPFBmHBIRCZ8IBNX+ImmMBiQvOm7q3nziYL4gFq1tmCix6APGA47bYeGf9cU35T2L1sFw1hPzm0IJ8AXw0b+VKITzTK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401512; c=relaxed/simple;
	bh=QCpQHpbmUzW40+oPlhYuUxi1Y+y6JiQx3Ne034HSjWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bW/S1HxniXqTYtgaxevPN+6XF5z7H0SfmI59so8ufKfXJKDtms2Pgdno9nWGQMzbdzMkDjUxqv3kIW9FUHCiPMioNgMMt/BfQNitSqvSI07HqjDOj/6Pqy3HKBsIfga8EMPmqF0V6WeeGbrjjYp7SuwIjb9dwaE12nJj4m8vkYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dk7OBqPz; arc=fail smtp.client-ip=52.101.69.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dk7OBqPz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dwl9Z1bMqK/bdSQeN0ImocVMxT7XNBRS6tn0RHLHUl1yE/jO+mPTvmCL3hUOUBDMdDaos6+GYhcKGkzsk4Z1ZOUeOB0cfGKKpIXZ3YlWUk9VtkfNm3r7Ddx8cj5WmqiBqAnWhKpJpJSXux7nFhldoceBcrZM5MHqpyv/pzoG7V7jq4xKfpIttJd1drWJmUshxoDW1eKjCAiBvCJzIg2Sgvf/5d25TdDGSH7uEvldPx9szpySE4O7ex9+c27LjuBIhM2Ut5BBQ58C+8ASL3zfiuTomtS3idqnjptFdNvXruWkwMSMvtyPe00p3zSv0echVhL2f4Q52YZq5d7f2ZZzLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8T6sLuMjEhaHVf7Bpvg//STWquhKCLiZEjRS/vvpMe8=;
 b=IkRw84OSCAcn8Cw1jFNiC76Fdk9oSHA4sQEQWD2amxIrrgTCC4xgNvf/6sxs0B+6jR8dH5AeZgLSv2BNR84Tro7S2BdQRieiN6IRO3WGw3f0X1rgB/MfJ0k5cNG1KHr8XqdGa4ptde+yX0tKNB6/61nDp2pLGz8bQ9MS32TKNc2CHVkZ/GjBSf4ebsNf9+VhuqJVD/YhuN1n0WEjeZ5d9Z2cvmcJqlZYI531AIEDy8SanSb560WUCLRcZGaXDgujy+GS18jiHaDKZF0lXN3WCyyIfWHHDuUeHfySigQhQ2NV98tI4MYVF/9nX7cGhJ9YVyG370kA02KOKvb8sxBQQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8T6sLuMjEhaHVf7Bpvg//STWquhKCLiZEjRS/vvpMe8=;
 b=dk7OBqPzcBsozcm5KstHtJaKbklcN+hTPWAZRktrU16HRTQMXF91TiVEGpdras+lvST6qvTtA12TvOp1/iFtNbDxzVsI2/6a795cTbvmyOR7rE/kvR1UVSaqxlpk8VJdeEv9bf1L9Z4bFLwJeHXmOnoUdmiwh2mok9Y4Y2AY8e94tmkde+whc5TmwUmJZ5x4m3WScwlwYyaaZ85VuOor9mrrA/9dQA0yPENZbgHZU043dSBipUAezpW+dsP7JRtm/lN5PJCI7mIyq58XCLm5wlCsKclH7T7jOV0FGn7DSO3y+8fjhMGUc5GgJYe070YboiH163sgEBSu8Ya5I1+sRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10952.eurprd04.prod.outlook.com (2603:10a6:800:268::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 15:58:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 15:58:26 +0000
Date: Mon, 14 Sep 2026 11:58:18 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Slavin Liu <bolin.liu@seu.edu.cn>
Cc: frank.li@nxp.com, vkoul@kernel.org, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] dmaengine: fsl-edma: check channel acquisition
 before use
Message-ID: <aqgZmtQwpZoxuTzd@lizhi-Precision-Tower-5810>
References: <20260911060902.94153-1-bolin.liu@seu.edu.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911060902.94153-1-bolin.liu@seu.edu.cn>
X-ClientProxiedBy: PH7P221CA0072.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10952:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ccee9e-7331-4b87-04d1-08df12790335
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|10067099003|3023799007|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	SPDweMaGTt7THeZAoPEqCtf8CODE0dn3SXo/aaEZeXwakisqg2ZUZhqc9uTCuXCP3O0DK4OTg3KDVdVC4NM03pmgwQg377XwfanAJyNacHjx8KkdXWFRGXUyRDcK7NBk5mRsBe9wOL1tGBDH9fKYXgbamtAAfg7fHXemIpohcAzUYV9xP+N24NYfIc+JGVx0XbSx/RsseZlEkmKBfSmNmROh9cIwFHhmxNvRDhbXJF9hpTiPh/Z2Oots8hGXfEbcNtYeLF1VIlld6DW1ssNlWXCP7ztWjb/+xVtnF9QlvyfN0BnBh7JwCfgNncMDQjdUWRgX5LXsPTAozVmMgx1WEpf4AdNt4wM0BsQB4SKPIHtljyJGFWLjLLa7rkV6XDA4x7jgv5+XlnbF4tZyR5AGnUJLYu9twhegoXXgXkU+qX30Fp1yZefWu5teBRRf0wnHHg3CPoU80kOkUil16Yw3lNacjcVNfKhQPqx8sijEpIM9LSWSqr9HfDrvdtoanw0ZVyITMRgVpL+JK8ykJcuoteZCvTgz7X9Kwm215MmXK82aE1GJBwsna1QFPHQF/Rm2J3oaMbMwUtucdWPlEwvLXds0I/mN+i992CNcJmceVIGBKurVknTEDCpuEW0LUDwuv64qlATJfqfwH9lzdv28BQPPkqsg0Fs9szES4uDChzE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hQ2in5LsUH1AJEhDdg4uBt1/B4NSuHzjTyXoE5QSLcZ5gk9J5XIGfh8biklm?=
 =?us-ascii?Q?DIk/NSKN7MXm7d3/SKkNkTmBeswwXONatf1SDOQ0chocpHQH/cM+nNI5zZdZ?=
 =?us-ascii?Q?6oR50kOPJrEYzQ0RaTlAnnJi1gL4kfbRtFHdjpLRDkCGTQx/GwEgVW/hOr/3?=
 =?us-ascii?Q?g2cSIJGJWO55VzzpqcmlcEcoXy3P7Y/rmzvjNvlqPLH06lPYQa+8voCsl6sr?=
 =?us-ascii?Q?fN7FHhFseslte13Xkd1uBwg8D2GHNqCC/c+G/AC/i1eCscalndraMZqUpdIi?=
 =?us-ascii?Q?3hTqQ8ByYO5yTl0dfsA7oXlaJ6BGDKWPi0JjgRVwr3pqkbUrLLy6bRfjcydx?=
 =?us-ascii?Q?AZ6fzDMVKn3l5t9Tqw2OQnzLVYExoztJXcth1K1dhY33yqNZNza89f4beixS?=
 =?us-ascii?Q?KfWiDaR9P7InLBNGd72UYD7Jgsjgxmowg4SlCNQZHGIb2f0PAS1g8jN55Edx?=
 =?us-ascii?Q?7KArR4S1k9MatULe1BVBYuCwq7J/Vo1iC+BRV7HVO/0iGv1oeUtju9N/ZG4D?=
 =?us-ascii?Q?zgbZoc6nZa8LHU4Gl525dm7y5Qhgg2HQjnb0gqpN7APUr60RB45HR1hwtvTu?=
 =?us-ascii?Q?o7SlOp/DURxBWSbLqzJZer6hKh1tMrwCVZ+4CaYGgf/nHCZf0Q1+FSnyl/DR?=
 =?us-ascii?Q?mJj5od9rcQdUW8zIXpB9gRdM9BSYGMHMtOETSqwnLyM+SYXJNUSY16aCI6PS?=
 =?us-ascii?Q?t8/jQJyaTLcOy6Er7wt9SU3mRYOOCk13aaMIW4AnW72QMrhgp5Ry0r3i/lB8?=
 =?us-ascii?Q?rAuE7z+Gy2bPAGkcJoX+Slqv10nIzYjHgDUFB4lMAtJcRwJIe3h1GruKNGqg?=
 =?us-ascii?Q?GtBS0a4lJmfKZEBorgQxOGnDo3xAQT0u4bUG5lh8X13vW4+7jKhxk5cCdtWR?=
 =?us-ascii?Q?csqOREeNnz2TB0IVWcBMUoYGvOt9vYPySzmi7ESDarbhMeMnkPnEFTulUcXU?=
 =?us-ascii?Q?0FcW4oBsNG1vPfCui0XMIA8f4WbvWxFoOt3Y8wymxYo6l/uiv3EzgSLvcozw?=
 =?us-ascii?Q?8ne00eE8siai0qE927ZvYIXEumcU7y77chyck3TSGyYSLiACTIy40azPYK8w?=
 =?us-ascii?Q?9IErQ40MIX/f46rgMOnv7OazcDwqrrg8oYCQkfeCmxt8toATlndZw/Y6Uj4g?=
 =?us-ascii?Q?m1myjNEXZPrBaBTPKscGHra4iKAVEHPQPSN1q+VT7bzezN8FewY0InVFKMk1?=
 =?us-ascii?Q?g/Z+V2FinEHgOSmhx2UFKRM1t5rPEqlMAYwP9uMj4ZK6w9efgDu/Erto5E5Q?=
 =?us-ascii?Q?hrVSPYMsAa2L0rNPPeoMRNVwowd0ur8upaNaFbFRRKHEiqBU1rcyM+yg5nmU?=
 =?us-ascii?Q?P9j+04YNKH1ysxwtHQTGxkQCwHQZyB/tv9rUg/fbkRJZijddou1V54vRfvsy?=
 =?us-ascii?Q?RX7ULX2Va6iEvTeai9A/9Y3kL2xGLrd+qHxHrkdgBi2ExGdo8D/IYNkxKt7m?=
 =?us-ascii?Q?PGFobV+8DFMvOsBYkX0ignq0o17XnJYFuTD2pWRfrZRL4H/RPnL2PFelkAD+?=
 =?us-ascii?Q?IXCumy3g5GHcVq6kldWVxb0VzSuuuy1+jAqoXyCXfP8BRRgsTXRA0r4zrmme?=
 =?us-ascii?Q?kmGCPniaplxJJyXMVdZ4AFoKcaYeqycO7+F/e4Tc9tqOVxmMQGwHCLc338eb?=
 =?us-ascii?Q?5+qTeD9d9xcAnf59NJbbbJe91zI8FcjCu3Lckc3VOVsDzkh2wrHa0Cc7sk/D?=
 =?us-ascii?Q?iBufe6VKBlgTFZom/wNFy8CcaF/fwrggTT8RUPFQwUt+YRD9pp6r5fMA0v0H?=
 =?us-ascii?Q?CfVH7uKsqlk1ErG0mN0zUNiuiPXg7VAoRY8x7vwZu8HYoV/3gSm8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ccee9e-7331-4b87-04d1-08df12790335
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 15:58:26.5949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TLSlBUelC6pqs7bYDOCyJMwCTLM7+xACXp7nWyqmLA+PGO3VJgOeC9MMIgzwiH+ve8MDU04FFaPSSlhlxJMcYfCSlK0lKDv5JrML9ScIfmV9uXa7cDSfautyYjygcHD+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10952

On Fri, Sep 11, 2026 at 02:09:02PM +0800, Slavin Liu wrote:
> dma_get_slave_channel() can return NULL when acquiring a channel fails,
> for example if fsl_edma_alloc_chan_resources() cannot request an IRQ.
> fsl_edma3_xlate() dereferences that return value to update privatecnt.
>
> Acquire and check the channel before publishing its source ID and
> request parameters. A NULL-only check after the existing source-ID
> assignment would leave the failed request marked as in use, causing
> fsl_edma_srcid_in_use() to reject a subsequent request for that source.
> The channel resource-allocation callback does not consume these request
> parameters, so set them only after acquisition succeeds. The existing
> scoped mutex release and successful-channel return are preserved.
>
> Detected by static analysis and reviewed with AI-assisted source auditing.
>
> Fixes: 72f5801a4e2b ("dmaengine: fsl-edma: integrate v3 support")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
> ---

Next time, remove RFC for such patch

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/fsl-edma-main.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
> index d9fb717b5b53..6934ac882697 100644
> --- a/drivers/dma/fsl-edma-main.c
> +++ b/drivers/dma/fsl-edma-main.c
> @@ -326,13 +326,16 @@ static struct dma_chan *fsl_edma3_xlate(struct of_phandle_args *dma_spec,
>  		if ((dma_spec->args[2] & FSL_EDMA_ODD_CH) && !(i & 0x1))
>  			continue;
>
> +		chan = dma_get_slave_channel(chan);
> +		if (!chan)
> +			return NULL;
> +
>  		fsl_chan->srcid = dma_spec->args[0];
>  		fsl_chan->priority = dma_spec->args[1];
>  		fsl_chan->is_rxchan = dma_spec->args[2] & FSL_EDMA_RX;
>  		fsl_chan->is_remote = dma_spec->args[2] & FSL_EDMA_REMOTE;
>  		fsl_chan->is_multi_fifo = dma_spec->args[2] & FSL_EDMA_MULTI_FIFO;
>
> -		chan = dma_get_slave_channel(chan);
>  		chan->device->privatecnt++;
>  		return chan;
>  	}
