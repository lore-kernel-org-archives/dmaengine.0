Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010039.outbound.protection.outlook.com [52.101.69.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6F5477285;
	Thu, 20 Aug 2026 15:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787239870; cv=fail; b=UYcmmgZHXweW7pq7KQ7HsULllqLWMj1Ny5ou7nvIH/XjicHmB2bB5i/oxzcgu+gpOylGafODfmp6Td5posadZOpnJf9Z+WjlN1MRq9kNq1JvSDGXvmcSMXO6EfXGcb31rgraGFRlHpgpdSdsbtx26Sfkcsz0BpuXEucpEAfhRls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787239870; c=relaxed/simple;
	bh=lYy1GE0ffmmhtBpQqobKCWaKEo9G1XLXHg2uAZLNCkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XE0TYAW8RTzzJFcJ/G8qa9qP57u+aAfPhAOIIGZsjK0T7+Odh9RVvH24vzkbQLJjCp0nTjFq418ftGHYPA7q2P9iiv47jsNdHoDqF7QXJzaFV3WeD4R+AQgYBlcdYwGg6qHdL4Vm+NZ6QhyidJZB0JcFy2JluP2f0tBi5yyk6gI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xG/qUfzF; arc=fail smtp.client-ip=52.101.69.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xG/qUfzF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnCxrA7viXF0tFuUs53HoMaiQsjDFO0BEcolyHxi+KKa87lWyxTsJs8paiENXzExMXgL55CLWWlppdMsKnpKcgU5Yc/YLIlXp1hEmi3Wj877xNQ0XKAWvJGgU8HorKsTuPKR8ENeZhhfmjMGs+ad1lFqIZRl5A9iHNEs/it4VSQY3pesfXNWPTC/g2KqYz1VbhruGcfSMcExYSbY9HaD8P+wMQRk3JPaIJK8Nb1V9iSDnSz8jFdvcOfSIMMapRCBBnh+eugp/ovIkGNWEHCxnQSKAklG+FEqS6liz+aC+2FzUSpVP/FQWozEwvKpA6Rf+903Wq/R+ecrZKMqpGnxkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0klbduANX+glOSuNOkjj/5LE4AfPBmVIT5+kyLilIs=;
 b=VfSzL9uUThEVAsJ+LO77j/LYujFP0HQVeDclCYB70rnk7MVk+hJtoscEk6G38T2zgGEuHaFGUCYmhrWNyceqRgj2M86Nw8KGqJ/Oqv6DmLDT/LUJc15RTSweVREoDUxkpY9N2PZ5jfTRqJbLQYqoT+SvUgwiAIlaf1u4dhc/p5h16Hz47X0+02nY60hg1tBSeER4qhUNJoi4KRzI2z10lLnD62irIVdHNAyJ17C6c/Br+4s6FDoOC5GmEgF8bgc207WPdpxvmZp6Djy2JK0MxoiNUNECXCU4qn0w1/GXnnmvri3+4RYedj/IX3Of8vfCZGQnpHdu4bokcOth+nJbRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0klbduANX+glOSuNOkjj/5LE4AfPBmVIT5+kyLilIs=;
 b=xG/qUfzFmCat4/33N3T1c2MKKd+VizgSoLL3Znfe1K3rzA/QBXF7082z3uc+eYRW+6Aa1WBbtyLKii9np/c/NipyopBOLbnveGhScHxS+nbNN3hh49M7BCdleplpDjV6GykWs/1d95w4UCLCIhfDTXrb9KMkRX5KuA0CztmdgbU6JJWw0Z98bJskk/vqRIwG7HDKIimR3IWUlyNrxyBI8k1Oxl8QjerdC0Y0jqwQwkkbbvIjtlfwF0H3w9pVOJsKprbMKc1tqdmeA7OfG/8bx0wW9h9HcqqXp1Lhnfe2NpK1Q1R4koIlUTZwRA12GwJSmGHes84sW2lnX6Y32Mk3Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VE1PR04MB7278.eurprd04.prod.outlook.com (2603:10a6:800:1b1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 15:31:05 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 15:31:05 +0000
Date: Thu, 20 Aug 2026 10:30:57 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Harninder Rai <harninder.rai@freescale.com>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: fsl_raid: zero CF descriptor pool allocations
Message-ID: <aocdsaLxgGORJaqx@SMW015318>
References: <20260820031654.28450-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820031654.28450-1-rosenp@gmail.com>
X-ClientProxiedBy: SA0PR12CA0012.namprd12.prod.outlook.com
 (2603:10b6:806:6f::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VE1PR04MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: cb5d120b-c59c-4f82-4922-08defed00c51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|19092799006|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	y5KNgAWbK1bAgfZG5+uwgjKhonbaFDQUayZy34t84KWfN3aoJENmmva1FbBzErnNDxlxU7SIwvG64NB8/CdAkncs3ouSxLzAxhW73nWQYrDGWfFZlNE5K3HM4iH0DOwQSAqtbJF6liOBtiwwWCJCzDvfkaLNW37iCH7cthCSNUKtHzreelgHQ0WR8OhlBNwY9jW8647/RRVQyibk0XI41CbnVnTiQQDi0rmj7aRVnuMyPGmfT5zRl1ZBS8oLEiLJkfo7yErWkpaB145SX03KjGxhjt4NwRVT9hZxdn38jgugzuP1+tTsnKoE+n1XGMeIpJt21t6UbLTxy+tbj/yZxBoDuhGf7l3YbQueRefRc+nsvuOpWHuvcgtBa+NHHjWrJCKyCUbry6XJn6dY7vpTwbY1/lj3ejC4Y8d8e3hY/wLBFrJa9XzQ/QiQFBkjv0eoo5rP2iLYNd+wgmq2b30/uFysLZGjceaoR9xRXFPj8ovybq8BtCcaEmJo1C1zOzm3hrjZg8nVzARhIHef33QpRXXt42UChd1tQsC9rRkj1kDPg34zxEwiS/J29wR5UO9whPxfqCjOigEmDiKjzv56ydrXo47uCgr7m1Elr23HArUAmdvm6yxL+QqFWOO2uqqVrGs40RDdTcoASvcUfeufUu2HeXG++HjrJJtVyCiEQkc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(19092799006)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BsnSsllo3OTo/8qpAy54cnlImOMDR5CFDXJ1BkPDo97/q+rC/H/bw5ws9D5b?=
 =?us-ascii?Q?YMYgJxyNC3BTvwAtEf7FNCA7MaE9YvyJ7j7CfrmX+LA7a7ALTpGeMq68gMRY?=
 =?us-ascii?Q?oFk6wX/N+LH+PooQUBewoN1co+g/eZSbAB6C3U2j10zIew/8MiZvwZLupZWb?=
 =?us-ascii?Q?sEMgNN3Fgsz2nsHISiKXXIkpwghhUquAOe+1coJNnvEVXEzzRyNavk5K4SSW?=
 =?us-ascii?Q?sIM390iqoX9Ve1yqQrmr4d4qd+F62sOkA9iyxgUtV8E/EhKxDLTIdjceofAa?=
 =?us-ascii?Q?JdA+RDG6kiWi7K9dTZzrNUhxX/Ijzp/DnT/l9HJenS6Zw9FjYilo3cz1vHn6?=
 =?us-ascii?Q?N6zQ3+vB04XQpy1ZveBnfdHTUnSHHkkKH9w6yD5DNFF7qp2dLnY4oXeXlikD?=
 =?us-ascii?Q?+XaC2ddyVK0NJ2yAqc/J25jQz6nSvqFa4264OKiWKIADS1xw1BfCM32/OB7W?=
 =?us-ascii?Q?vMk6ZdrBb9D8tUPbRTcTdgQdCtTqt94TXZiHHLEBaeITPiK23eMXro9A6onQ?=
 =?us-ascii?Q?+KqC/NKpUcYFBdNBFKor/hexmNMWUF7i7D7Fv2r5bR7HDCzBeYWyLmefgGgj?=
 =?us-ascii?Q?hm0BPTfmaRI8kuNpVL60z+GeEudZRRiijkuDZhiKDs5irg3YlMIO6GbOR4ln?=
 =?us-ascii?Q?KdDx02va7gnnFAkYflNmBReUIFEGmIkg3iPuzj3npTHZoKTbCLva/G6LSMub?=
 =?us-ascii?Q?ex+OB/CEMucfVYyFQRhsKY9P1C4pM8OvfgISQ2Dy3ow/zgB1YeZUPlZ4psB8?=
 =?us-ascii?Q?zhv3t2gO9gWEbyWtaQOmI+yOLBejKTClU7BP7oYk+Oa/y+hvCN/3VLuEIDUH?=
 =?us-ascii?Q?DV3QWk4FLtzpXfsZJEoqkKk2OGcKvhtpcvpl8/qWhviFJtprZgKonKMTHXfE?=
 =?us-ascii?Q?dlIAOTMHR/4VFsAyG2AZB3swNzupZvZtnyfj1/EYe0GP1+GqDxNl2mDIXRHP?=
 =?us-ascii?Q?UjVlTs1t23Lf37m5ELVrXWMOwhDZnGNpmfURlpDlVUCxFf2m94tUUkIuRR8H?=
 =?us-ascii?Q?i4vY+gT7hGcvGShnGGSIKV00VD991smd/dsowDvXFYWNewWDXkaiQxXrN53i?=
 =?us-ascii?Q?ftjY6NWwvh28ZLaNZnISjF07gUZLb9lBcCureB6vE2q3xhSUKwgklmE5LB22?=
 =?us-ascii?Q?qFvyEkfrnkf0EMmIDNUajoNnuMxMiauZhUqeR+1/o6XSLrkACABX39KcfFEs?=
 =?us-ascii?Q?TuhZEB3477LlJjKLj94gw3PERFu7WjqZzIF5xjcCtcrhipN3svgOXSaigRLk?=
 =?us-ascii?Q?zoQlLjPHvDiIQxT+obaruNTBzpniR1eVZHds1NVmWWv9y/gSSg3hm5drBRDh?=
 =?us-ascii?Q?Mb6dEmJ6SLagGezw09l6Y30F05BKHH/LqmJVHrJsKnl8PpH609WusA21F/TY?=
 =?us-ascii?Q?QS1biPItQaWLlo/ShaMRoPCXTmGQXIrzkDdTAI6OvKytYLo9ktF7Pl9XBK80?=
 =?us-ascii?Q?avy+YvTSCCb7PCiLjV5tHpVVw6IP7dIjLAex9rbcpRbU38TNZtSa4jIyId8T?=
 =?us-ascii?Q?PDh6o7ITWmiOln8FjjI17OxKRRRW5pOA44XpvCI30+P9CnFrWx9ja/Q/ef+j?=
 =?us-ascii?Q?ZeJvQHris9eRvK1Zu9F0qYC5h77ixF8D18JzhGzPZkPAWq58Q7RzfFa6gdQl?=
 =?us-ascii?Q?Xfbc3lkwO6KJ/YQBPF0+rD6I4egFBjjYOkOQ92G7OOMIKxsyBjDx1fmS57Uj?=
 =?us-ascii?Q?TgTaa1kA+E/7MhZkwVW8ajNZlEf0WRug98GSduK0DeGon29xvr5zTwFvBfDg?=
 =?us-ascii?Q?RZ5CUPcLJj6FG9heN0SUg7oWgiZgx82LOvn5qt6MbvcqUiA/RsXk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5d120b-c59c-4f82-4922-08defed00c51
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 15:31:04.9272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3URhUvgKMecsuvQdIYiD08HM67HoJJ9nDJAOhh8g1xnZeOnH9DDpDhd4kbdA2Eh51hqfrU2K4Gte7JVBTm2kEL+C91E1N86ZMW8farY4sAysYUkisVknmOyvTxNT1XFb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7278

On Wed, Aug 19, 2026 at 08:16:54PM -0700, Rosen Penev wrote:
> The compound frame descriptors and embedded CDBs are allocated from the
> cf_desc_pool with dma_pool_alloc(), which does not zero the memory. Only
> cdb32, the gfm coefficients and the frame address/length fields are
> programmed; the dpi_dest_spec/dpi_src_spec fields in the CDBs and the
> rbro32 field of each frame are left uninitialized. The hardware reads
> the whole block (frame 0 length is sizeof(struct fsl_re_xor_cdb) or
> sizeof(struct fsl_re_pq_cdb)), so uninitialized heap contents are
> exposed to the device on each new descriptor.
>
> Use dma_pool_zalloc() in both fsl_re_chan_alloc_desc() and
> fsl_re_alloc_chan_resources() so the descriptor and CDB memory is
> zeroed before it is handed to the RAID engine.
>
> Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
> Assisted-by: opencode:deepseek-v4-flash-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/fsl_raid.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 2d86f61105e5..1c316d85cfec 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -295,8 +295,8 @@ static struct fsl_re_desc *fsl_re_chan_alloc_desc(struct fsl_re_chan *re_chan,
>  		if (!desc)
>  			return NULL;
>
> -		cf = dma_pool_alloc(re_chan->re_dev->cf_desc_pool, GFP_NOWAIT,
> -				    &paddr);
> +		cf = dma_pool_zalloc(re_chan->re_dev->cf_desc_pool, GFP_NOWAIT,
> +				     &paddr);
>  		if (!cf) {
>  			kfree(desc);
>  			return NULL;
> @@ -584,8 +584,8 @@ static int fsl_re_alloc_chan_resources(struct dma_chan *chan)
>  		if (!desc)
>  			break;
>
> -		cf = dma_pool_alloc(re_chan->re_dev->cf_desc_pool, GFP_KERNEL,
> -				    &paddr);
> +		cf = dma_pool_zalloc(re_chan->re_dev->cf_desc_pool, GFP_KERNEL,
> +				     &paddr);
>  		if (!cf) {
>  			kfree(desc);
>  			break;
> --
> 2.55.0
>
