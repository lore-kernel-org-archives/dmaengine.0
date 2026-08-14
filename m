Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011009.outbound.protection.outlook.com [52.101.70.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289C13C660C;
	Fri, 14 Aug 2026 21:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786741963; cv=fail; b=D6FRsXb3Ullmzo5KZnyHooJFHHx1biSquWWH1eOaMk41s3n7cgplGbyLKnoo8j+vH+L8gTJnHTdZiQ6us4WWKtLlYImXBrHy2QAgmOLCFyw5VaNSzFi0x8L7iIrCrQAZihuO65W4tmycFNkUCvbLL2lSAXCgbKefzd9EE6wzu54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786741963; c=relaxed/simple;
	bh=opWY4ORCKFnwVJDtD6j05E7fNm7tstfIIrOy0Jv4HNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ixz1FqpJhX+D2wd/H3jCdZHEOnTBhxiqsfeaGoCSSibFPxPc+C78EkMOdyCWYcejIUlJtuLSVkTUZiHHPJj2qXfQfpsP21BMlqcUgQGbJtCZ7nZt5cXG/jhVhIH7YRh59eDcis9RpazyoAtoFtsAbx4HD3mW39JYItPn6GAegYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nSlq8XDm; arc=fail smtp.client-ip=52.101.70.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nSlq8XDm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N28yd1iAX/6+jDMFDzr0frsPs3jrN20D4klXJ66gwxrVNH26BzjU7cJHEm2jZazqHj7sEs8TeYseSWsPE1z1X7rwwHE2spZVMdt+MOSC0wtIs+O/Snqb8L2TXHCgmsl3p41MVQnu5JCPAU2isv6tJIGByLqbGez1BMEgCv/stOUNX6SLjR/8X3sK+K3MPFgPXu2pBmcNLbmQDQDzroadAlJFsUWxyp5fEF7bOvHTEW2sQk0Rkq6RIH/2gv0f3ADnPByaX/xUM6xr+n0SINrtuA4WtM+PJ9iSGhkD775632P0I0JwLsgXKxvWOTzOYbj/5h6BXmk/HQqKOTVpCmILtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIB11DHZ+0m/7+IK5rbR5aivXa449AnM28J5RBAO5bw=;
 b=lbyYoJK9kKKws6y69fNqKqxgcx7F/8atlCgsk/AnfTJZD06Dj7uRI4uGqQL+LzyLOdMfcaPVju71mZP5iXVEgCBHqgbvQOfWnHSrNdBtMKWAzDiNn/JPa6yXqgyfFJhmBmLB2hdb1nkz4F7utfCx+Dcn06KMhcYOyVZW3s4qE3gKjGwDq7u7V6PvVQQUsy2VY8wqd5Ca9GDeB5/2LolGawA26mmDNNScAu9ePXzK8IRHZMNjJNMsm3iPG0WrzZiXJxr1RhQDQfNY3nUhtvfBnQqNnas3T5ZrS6DYyWOM1jkpMpdRPIue+wH7pp0+nOq3m5abvekUlcbWfuLVX4zf5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIB11DHZ+0m/7+IK5rbR5aivXa449AnM28J5RBAO5bw=;
 b=nSlq8XDmauucH+PvK4bJKHfPFbsjdWmrgZeJDwM/6x26uTFIGwLP69XkH5fe1dG+uHCaiVYlvrkdnGDLYUswfOQjSjsKrR2IJSFAsYFMOiSl5GeTNKPvil8lQimWEXQ4GpGKyzWE4xKoUTgo2QyUVaa6TEL3kPIaa6BdMW8u4U+P4jBz30hYtJprCjJr7ac7vO5iZpURBOEbS3MjnavXiezifP03RHvuj5p7/qpZYlAXimrT4Mp6KvFmitZ51CwbLcMKNTAT/DigDsl2nG5HlNfFqqpO77hXHQC/MpbWsY7zdHl7JY2iTeWblW2jsK0QbKMPHq3lNPZQQRxyoN43nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8255.eurprd04.prod.outlook.com (2603:10a6:102:1ce::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 21:12:37 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 21:12:37 +0000
Date: Fri, 14 Aug 2026 17:12:30 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Eugen Hristev <ehristev@kernel.org>,
	"moderated list:MICROCHIP AT91 DMA DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] dmaengine: at_hdmac: fix sparse '__iomem' cast warning
 in memset helpers
Message-ID: <an-EvmZ2BtoKW8kX@lizhi-Precision-Tower-5810>
References: <20260724225958.43925-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724225958.43925-1-rosenp@gmail.com>
X-ClientProxiedBy: PH8P223CA0007.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8255:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b921a66-43f5-4318-c864-08defa48c43f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|376014|366016|1800799024|10067099003|6133799003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TedVwOgDKByYfTpshWtvIvuRyIfrwCKXMMAUGcUAIbMzNA/UvUI5Amwo2srOtrJrODsTFn4qZtdMmf0B+4Atd9HozoWohWrt25fAWw1nK/QxZZRv9bXNH3Q74+pg01I0eLN7BplHoMG+p3dE9Y2Ti6jHuyviZectZMLO9/DW/nftcT+D1j2QUDopoG3iq6E1gMu/Vr54mj/fIS6SxsydhMVVgIXCfhxShy4HjQvbxM6/CSxq2o0eSBFNoWPxin/1qjcxB7n+2v0GiZpkBTsNBGcpjzerSRmGOAnQKqWWKALbNlIyOyrhIUufnsQIOIgX1GjDKbtZoaegf3XdH555n5x8JRNqK+ThbSMdzfi+huS+Ndf/N/3hfsZOhJHfiJoSyYqv1KLeXQ8CoqWWA/PPLTbx7963JV70AhgtYCBzjOipoEpWKRz3cGjzpVQRQYYkf366ZL1m4QPyC092OtqtVixphQexAyBqe6bKp3Fk1e1dvj9X85UXF/ZswnxBL/Zqpu+U6V5623tj+4Ngrt+5rKuSLUw6u/3CE5C+tMPo1+1xqEwDyKgcWXWQn+P8mbsnwnoYVj/bldREV2SVGiPoSJApZXCo6ulN5WrXZkEa4AmlTnJzrc4yRmyjZoPce956uEKLV+7ngADXFStilcMIRt5f8CobF2olpNmdOixhGMA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(376014)(366016)(1800799024)(10067099003)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rtCuwEuodNNxlzAavESKMCeOYjDkCH35VT1HkRMep3cBQlN6+jXxjXOWyQzC?=
 =?us-ascii?Q?WM7SFo5zyVjPsB1XXMZhpc3xZ3UMLptUvTEsljbN/NggRPwmDHINhu1di9FC?=
 =?us-ascii?Q?Hrsg5UKyMZrC6uOD7gBeO2LVrYBIi1/5Pm9m7uJlblsIzcDsCVSarzD8iVWP?=
 =?us-ascii?Q?2x8ofaHzIQQl/5YQXNH56E3WEbeWx8uzpygk2U6d1smaV1VT0z1u2ZbX+xq0?=
 =?us-ascii?Q?//sGsRs4YLpnf2K0JAcx3O7g2/G2rQg5VxNJVF3VOs47qX/kTJZhvYAIyz62?=
 =?us-ascii?Q?xa9vMNiktG2hUnBzgmbB5Cv5ItsXas3/wIoBZtQ1hHn8HjZk6j3RiQcyC0VA?=
 =?us-ascii?Q?01f40QmWUpX3VndtIvCyh/wA6BSLESqTjGqxqpGiQ8tRU9bI+KKHV0lSIzJF?=
 =?us-ascii?Q?3kcI+JwJWwpjl3UKcZ8UK700rWlLcIpJjvReWoUlEUG/WlVFMHGc/6/dqIGk?=
 =?us-ascii?Q?+MopQJEu7aNbv/vLJCDiP5IAyosxGT95CkzmD408yCBXLrbjAO3A0xwwFJN8?=
 =?us-ascii?Q?sxYk1l3f9qSwfbif46+prQPfmxeb/P5YMIPnu2FEOt1dx8tFkzbhNq93BlOT?=
 =?us-ascii?Q?9Y0FtbH5L58ymEIQUw3wprqjSXldmxAW0pg8cVK9p3RSgaTmVe6/xTLdCnoL?=
 =?us-ascii?Q?tJaMUfTsW4XmqqHi9en+U1i0nkEOJM4QiQ1ONElrE9vaEFRt7mzWcCbs16MU?=
 =?us-ascii?Q?FI8DcK68Za+qNyZx6SSi1HByUQqaIJkdhds66V7SS94hlNzpXOYa68tLy0sI?=
 =?us-ascii?Q?eFkvoRjBjg7KO/FDyQApQRUcax/OCyaKOYDRewn9VDuP4VY6KNqzo2c+TbMx?=
 =?us-ascii?Q?Vmw5n7BlA0YH6Ua5qa54XMM8Yj1p84Kt967LBQL8+ldhEHLcRedTC/aGIUaL?=
 =?us-ascii?Q?BKqgQeJsZrnmyedRMAHvdDPSzFt+9OYQRj61erzkUACMC5A6hG4WlfQ3Thwo?=
 =?us-ascii?Q?m585wjKwxVGZUHqMqHu9CqMYmFiJEW9GznSHI0gHIr4aWx/V9TzJBXgSTvpU?=
 =?us-ascii?Q?sktIQxHZ/XcwVqqpivYW4rfTo1zFmAPRZemHHxtp72qLIDaUwwxZabuhQtVw?=
 =?us-ascii?Q?P/lguA3jftR+Qisxqn2f0QXwGiDmrvuw1Hp7LgTygqjKLUnu2Wqh46qrvpk/?=
 =?us-ascii?Q?X/bqm1UhEGnH41PCmGu+ZdFiwKMzcNz9dHyJsNMcRDj6dxQSecgEn+LNeULP?=
 =?us-ascii?Q?0Yuh6DZnxTmz2SQ+Ht9mk5ifCdy171efexXZIEb1+Fn5iOMgn823qnD6+0ES?=
 =?us-ascii?Q?IyPxgDXICLsEiu4wtKwJD+E2GZ87i+BY82E2iBsdHBuCbC21vN8+0dS03x8q?=
 =?us-ascii?Q?e9sfNKr1ZBwZ/tKvxZgz8nabizZ6DbO2ybmJj9mnNh8CUtQWDBhHOLh2WMdQ?=
 =?us-ascii?Q?IHQ6XUiuzjpupkk9RTW/HFwXEDOxurUrFM12f6PEe1QCOVQNVKn37P4E/rnL?=
 =?us-ascii?Q?2LpCXrquvEqThueH9sVu4On8tWJvKdIeQZvMxp1alipq/BefqGTPdHCF8gk1?=
 =?us-ascii?Q?QXSA7EQqwwkkfxatA1h4guDg0xuqHTMQP7nrJPJ0Rmv9mYvxizbLbvRhjR7b?=
 =?us-ascii?Q?cjBcb+ilncnmAm5xL5rmHU61Zvakp/HS1WjQj1V3rM2rhYmav0ofJvE/XRvQ?=
 =?us-ascii?Q?oXW9RyvPX/r0BOOlTYmxNZ6QrstnGc2yf4q+yir1QsyIFDQTzFN+KArEo12Z?=
 =?us-ascii?Q?DbvdwVKbB5FPHg1WP9Aw4NZxEQhec8859bGYbMjYKIP3n4W7PS1H9uEDvsFk?=
 =?us-ascii?Q?fzlDUCQCjXPwzLmoqrcV5N+3ic5Hp4nG62m3oMVa79u9ZUvRgg5K?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b921a66-43f5-4318-c864-08defa48c43f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 21:12:37.2005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phRykUaBAscjlNGS9piC31R4YLNF05awuQp84yO9wMxvyfmJOaEgsG89MZ/fnlNp+76AWmGiSt7f5yOBEOmEeSl78fR0AItkKVO+RuBpMH26CgYS5+cWGFS/jFnBXZ0d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8255

On Fri, Jul 24, 2026 at 03:59:58PM -0700, Rosen Penev wrote:
> Both atc_prep_dma_memset() and atc_prep_dma_memset_sg() declare vaddr
> as 'void __iomem *' but assign the return of dma_pool_alloc(), which
> returns 'void *' (not iomem memory). This causes sparse to warn about
> a cast removing the __iomem address space at the dereference site.
>
> The struct field memset_vaddr is also typed as 'int *', which is
> neither the type returned by dma_pool_alloc() nor the type used for
> the actual writes.
>
> Fix by declaring vaddr as 'u32 *' in both functions and changing
> memset_vaddr in struct at_desc from 'int *' to 'u32 *'. This matches
> the actual usage and eliminates the need for the (u32 *) cast.
>
> Fixes: 5d8c5bea0da9 ("dmaengine: at_hdmac: add COMPILE_TEST support")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202607231110.8MqNRj0Q-lkp@intel.com/
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  v2: remove extra cast
>  drivers/dma/at_hdmac.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index 7b6aa9bbc3c8..f24e64219fb5 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c
> @@ -244,7 +244,7 @@ struct at_desc {
>  	/* Memset temporary buffer */
>  	bool				memset_buffer;
>  	dma_addr_t			memset_paddr;
> -	int				*memset_vaddr;
> +	u32				*memset_vaddr;
>  	struct atdma_sg			sg[] __counted_by(sglen);
>  };
>
> @@ -1097,7 +1097,7 @@ atc_prep_dma_memset(struct dma_chan *chan, dma_addr_t dest, int value,
>  	struct at_dma_chan	*atchan = to_at_dma_chan(chan);
>  	struct at_dma		*atdma = to_at_dma(chan->device);
>  	struct at_desc		*desc;
> -	void __iomem		*vaddr;
> +	u32			*vaddr;
>  	dma_addr_t		paddr;
>  	char			fill_pattern;
>  	int			ret;
> @@ -1126,10 +1126,10 @@ atc_prep_dma_memset(struct dma_chan *chan, dma_addr_t dest, int value,
>  	/* Only the first byte of value is to be used according to dmaengine */
>  	fill_pattern = (char)value;
>
> -	*(u32*)vaddr = (fill_pattern << 24) |
> -		       (fill_pattern << 16) |
> -		       (fill_pattern << 8) |
> -		       fill_pattern;
> +	*vaddr = (fill_pattern << 24) |
> +		 (fill_pattern << 16) |
> +		 (fill_pattern << 8) |
> +		  fill_pattern;
>
>  	desc = kzalloc_flex(*desc, sg, 1, GFP_ATOMIC);
>  	if (!desc)
> @@ -1168,7 +1168,7 @@ atc_prep_dma_memset_sg(struct dma_chan *chan,
>  	struct at_dma		*atdma = to_at_dma(chan->device);
>  	struct at_desc		*desc;
>  	struct scatterlist	*sg;
> -	void __iomem		*vaddr;
> +	u32			*vaddr;
>  	dma_addr_t		paddr;
>  	size_t			total_len = 0;
>  	int			i;
> @@ -1189,7 +1189,7 @@ atc_prep_dma_memset_sg(struct dma_chan *chan,
>  			__func__);
>  		return NULL;
>  	}
> -	*(u32*)vaddr = value;
> +	*vaddr = value;
>
>  	desc = kzalloc_flex(*desc, sg, sg_len, GFP_ATOMIC);
>  	if (!desc)
> --
> 2.55.0
>
