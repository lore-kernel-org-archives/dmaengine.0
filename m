Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010011.outbound.protection.outlook.com [52.101.69.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FAF4C33DE;
	Wed, 16 Sep 2026 18:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583027; cv=fail; b=MBQFHIpN59QEHXJ813To/LwoSh3Bdfzu9Q6whi2Q999rdbJfV7mywGajUlAs8G5ff6Wuq0wQjXYCgvFaS/GN91Egipeb7nC6rWRF4wZRxxhcieEQlE3E62rV3HBY/4kzulamn+YOj4TsaVd2jTjq4p8H2CbrDuzs37QSdr8/LME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583027; c=relaxed/simple;
	bh=ITGuhDMQiRthZdbh7t1/iMDqz6Hm4NQ+C5NRKeL69bM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lSNNvGI6H+nk0wSs+w8MucmcEiDtiOOrOi9etFb4HSJox5r3Xi1zCU3mdEecObeiUZ9JM4IV6nMZJQWn5P3lhXXPnGCuI3pAbHq6gA1l/cn/jcS2k/2BFJrj5gRENIkjPV2ruUJJ888jOn3fh/BCwcmn2vsJFI2+4dcyazOYe3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=W7yfY9SH; arc=fail smtp.client-ip=52.101.69.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="W7yfY9SH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPxks7+C3RfJ7Rldm/WX+iBCRXPWIuSyfpM2RBst7Xcg3g3J+RPL3oHVtYtZ5quJ+FD2UJEy23EiMITMKZmY2UQ4yC0xLIGLVEGjhpFQdqOhHmZYUKOXwHPP/O/CxymMMuzt9uzhr1IqjYkYyoaY7phVA19IpcNsrCqDOCpGajKn3X91SbeXSx6KSuYgJi9l3Ee64zTLgS3li3cUlPJ9jWh6nL8uPiWAJN+N34zjocJAWT31azdxTn9/t7NLUfdrBFXBIFrhwVY9pmpcifXNfjo+ecgIkUrMOZIg2mtu5G/Lthoe+/iGZu1UGG0UK31sEgeD0e9Q348TF2tvIEe80w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pjYmuMFZxlU51EA7EijtKLdNUeSAhtQUsohPv++ZE4=;
 b=Rbsm+7EIyFPeOAv/k4n/+5SQi2BRjrRB+S+yZ5mXoE3q3a7ILrkVgA9AFueOETeBMlh2lkuUmBXhex1t3TAVCCMm5EYIMdL/XZXUQiYVo3JMKrCdLnyQvjCRWzAgPMPFt/pAnDOxTp7fKraaeO/t9kNSGr4sdU/achFWPu/hEfDpeNSINr2PGFX56vGrLPPwtyyjM7RBGnULDvCBQlKqSUTNh/23xif4q6Dnu6TKsT/B5/hK7XEW066haso11ZRI1QWaCrJPM7o0yMlq74vmzLQN+73Utw1Yfdd1sEhk+eEIYe99p4gf/70XRiqb0PbD9epWKQFcGkudgXriDlOC6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pjYmuMFZxlU51EA7EijtKLdNUeSAhtQUsohPv++ZE4=;
 b=W7yfY9SHiBvZdgNxwXS3rhpSHUiDOggg4MHwZFQqiV5Lyhtqkl/k9sg4WcfUwbYnL65VdUE8ADjAcJq8JkCyAlll0uayKyMyU2NtNrNsql35xLm+Ypjp+fPkSN6n3UC/BscaF+2cEgKgDsLavX9NZKUYcXDyblnOgxl5kFDiC9Kfjp4sU1cjivDEmELk+1xovAfFi79ufzmSypJURzgB4nFL4D/qrkYhNH4ioPkTJglzeVvoe153FZRbIHPyXycKhqPzAEzT1eSYydTDgHvX+yKV/Kpr8bSkgDgUW4xEt5Ge/MnGkOswIXt5gAUh24Wi8b4YzHQjRdqeUIhNDUOgYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BR0PR04MB084738.eurprd04.prod.outlook.com (2603:10a6:2c8:32::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 18:23:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 18:23:34 +0000
Date: Wed, 16 Sep 2026 13:23:23 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	imx@lists.linux.dev, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/2] dmaengine: fsl-edma: add per-channel IOMMU support
 via iommu-map
Message-ID: <aqrem_EkcQM2t0IE@SMW015318>
References: <20260916-edma-iommu-v1-0-e1731968081e@nxp.com>
 <20260916-edma-iommu-v1-2-e1731968081e@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-edma-iommu-v1-2-e1731968081e@nxp.com>
X-ClientProxiedBy: CY5PR19CA0017.namprd19.prod.outlook.com
 (2603:10b6:930:15::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BR0PR04MB084738:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ccb619e-ff39-4eb3-369e-08df141f9e7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|19092799006|10067099003|56012099006|18002099003|4143699003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	tVjuEeN1ytt+sxuDInPWqKizvS4qpy99kREExQ8e/wgDbciWLrHiiU6K6wD5H6Ya5/NQeH8EqzbcBY7UoQRO4pK+aWVfC6XrDcTOfqFHqyZufarWNWevehgk5EONvealP03i/mbn2Eb90QuwNZklKaetsBHTgCUEkRn2K6vSNlYvxABqrwNyNtISRERT5D0Z4als3KGHMushvvO13aEDudyiACYE7dg4OxvGp7RWVjdqh43+v94KH94tyZ7zapWeGigPXU4ozWvB9UJGbkE00AJkaeXrAF63FQe1xNZ0PheE2a2ZRWEwnOKwxirCp3U5HbGEDcI2OjmkXM9qhxkCQYSUmSFQH0RZZnmSnGxPTfuAnjd/vMlPXZzxlAZCk45khdNLOQGL9QdgmtqWZcka4rLdv/PNgizH3/DR/ahmoUBBtfAWWW/U7qVaIuG0Rdu0wMixCauKpgretQOZ5xv6O1bNpF8TIT7cTmweW7AokMdwIJOUqx3fUitv72ZUrWEuS9E7QJiYOhyx9LNPfXVtJXmj9+bxtMQYjF1Da1dB2epGonAG1Uh0nnbpjOBUcIkZuCwIR+i4K8JJeW6h1ZGSmeKixT7leGJpcvZfVZ/cUrVNTKuTkwsaNzIjI9P7fIKE3Y6VAKsHzA1eSyqxJWzrK9wRYe8AwYdzV+UnLfRlcpI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(19092799006)(10067099003)(56012099006)(18002099003)(4143699003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o3GSMPutrjGzK3THVYaDlbY+e0Nn7gzCYSjpOMNAfswET3pk9bCJVuu9ixVb?=
 =?us-ascii?Q?s0jV8iwvucwzQQ4ikoMDz0RWnoVJNJy6S43b1Zk33Y/zmrXWwFJbNUiufKTd?=
 =?us-ascii?Q?fZXV1AMNOC/OAIdyzBmXVgfwN1Vj27GOCZOIuyyvumEmwEU4pw4r3s7WDV5A?=
 =?us-ascii?Q?vnPAZaJwzdwmEqd3OILzAXqg6nrRZR/7XOKPcqeh9SxoylkR6s2Zq/ERR7NC?=
 =?us-ascii?Q?5Jj9ShUqCiYFsr3vgqWiyQ7Fk7gWBrN3ZLpnnRmHV2U4BDVhhE15F8WsCdmP?=
 =?us-ascii?Q?e2ZRsOVSepKgGfvPWIyrsmLAukA8zF0R62ykNGVo5LBrSaMWkeKr+h2RDg6X?=
 =?us-ascii?Q?c9uMQ8ix/4tJnlidu72C0TBHqh5F76rawoU8rivwaIzhJPR9wyjcJfGcfYG8?=
 =?us-ascii?Q?LNwvUYUkRWXewOvYiY70a1VmPAGSOWbvM6n0I7ecSRMw8eEaa5/ppBOwIjGu?=
 =?us-ascii?Q?Gj4/tItJbvw3+OUsDI0SqZAsfSPY3tZwte4buxYbNLsBM+0Qt0TAq/o/B6Po?=
 =?us-ascii?Q?jnVtqZngORss6eFCUjM55eZWC1AIh1ZpjKCMYx9Tmv5lj2I7gd2BtPoR+qse?=
 =?us-ascii?Q?3mjaesQPwCufEYFfNqZ+0WNHbueNGjeEh3z3JIf6NNpb0iP5V9C8RXa+iw5X?=
 =?us-ascii?Q?k/57bhd4sSUwzgQJKzHDTrAxSbkXtcRbw50/vqqm9pCddj5lKKKak0oGjPaJ?=
 =?us-ascii?Q?0gVrD7dA2vHePtOdikBxcOYsBzQiFSfs9wUEqRJjkQBYqNmNFA7q7C25SAZi?=
 =?us-ascii?Q?Kl183vFfNzFzGXgF2tj3JKDHSS/g/IQCLJPsKfJj4fxYz+JDx2MaVzCZJseG?=
 =?us-ascii?Q?Vl0FImVcYpr3durS6ozIOtYNBimQB9/OVsVDlrXHFln/aEBTDBkk3we9o6hX?=
 =?us-ascii?Q?SFTT4BJ3eyLs4YWqrIE+SjCUtCnq0bdsV5exhgK2p2HDJr4YV/R6CbrGw9GR?=
 =?us-ascii?Q?PwKcCtO1EOqZ1lsKYbOfbfBsxdPsZL/K4+z0UZXrXckl60Xx3lTaJE9pcuPG?=
 =?us-ascii?Q?lRwZOLR+ud9EcpDDv9mbIUlc6x5Vm9xPQfL0r2TChcvQTkltKQwsD+EC2xro?=
 =?us-ascii?Q?tdvW5H9Uw58dcPWxMN3Jh1rWdVxfvi5zgPXQiql42YLeJ9/6TZqoVHttPaQu?=
 =?us-ascii?Q?mao/JKwAwbnLiMFq9xANaYcQhsgMIELXabFDElf5kKXUVBvHZsWLk2GOo554?=
 =?us-ascii?Q?ZhHDsfNMyGlRCANWxNSc1AdWtWHTWiZ5j+/vhJLvmEovyo56G4Vj+HHQen7C?=
 =?us-ascii?Q?It4ptkctID4q2E0Gi1gpyvAMPg4NpNUaIMUTxgLY20hZVKXwJquPeNV3lpTz?=
 =?us-ascii?Q?FolM7HCustErpt2Bt+aHX1J6TdJVi6Fb6kDFpoJKSJI7UcyO4YnuS+SGsG1s?=
 =?us-ascii?Q?5gKFa9n+95SKIDUeVw2hrOiGkykaoG95fzZ9DWRdyb2GkDwIMAlMBde5lbD9?=
 =?us-ascii?Q?dUlvS1vw4EPzYnj+xj40CnOKuj0Baqk0M8QLCmIBitVF4GPu8CaLuBMj9+LD?=
 =?us-ascii?Q?6fGU0je/kAKPfZEQmx7pEW6lUFf86sTWymGcJuw0lVWQu/nq8NzT+7gIbzXh?=
 =?us-ascii?Q?cW9eWLZ7R5X9PYTWIS0/pOovc1fl2TmOh1IrZNPAhr0kehvyW+xU3MkL2mu7?=
 =?us-ascii?Q?+oI/XRPlDRFzat6+gXmME9kZNNe77EGAQ0qpDc1rZpw51lF1P8ak9/Bx3hjw?=
 =?us-ascii?Q?wL4uMxXGRpzk0PhvyuBtL1syhGkrGZTTxcVBfEJXk0cKeQW2wfMJVn81tMJC?=
 =?us-ascii?Q?gHv7QpE6Mhzp/O7VvHLFRA4b+Hg5967qGChNP8uXfRdzmiO1WKzT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ccb619e-ff39-4eb3-369e-08df141f9e7e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 18:23:34.8652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mes73la6dc+5WaGHOpIEEMWLk0fEHJKQS8CFeSNtMzxEG5h+x7H1hyC2mACggMAHbxHKXtx7iKTxacduUyA3YidC0m8POeI+siz+hk47EP/KoPC/crHFQVoiwQby7mLN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB084738

On Wed, Sep 16, 2026 at 11:55:26PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Add iommu-map support so that each eDMA channel can be individually
> mapped to an IOMMU stream ID.
>
> At probe time, fsl_edma_init_chan_iommu() prepares per-channel devices
> by initializing DMA masks and bus pointers so of_dma_configure_id()
> can be called later.
>
> At xlate time, fsl_edma_chan_configure_iommu() looks up the allocated
> channel index in iommu-map. If an entry exists, it calls
> of_dma_configure_id() to attach the IOMMU domain and sets chan_dma_dev
> so dmaengine_get_dma_device() returns the per-channel device.
> Channels without a matching entry operate in bypass mode.
>
> Also switch fsl_edma_prep_slave_dma() and fsl_edma_unprep_slave_dma()
> to use dmaengine_get_dma_device() for DMA resource mapping.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/dma/fsl-edma-common.c |  6 ++--
>  drivers/dma/fsl-edma-common.h |  1 +
>  drivers/dma/fsl-edma-main.c   | 76 ++++++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 80 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> index bb7531c456dfa..58a92ff4ddbe7 100644
> --- a/drivers/dma/fsl-edma-common.c
> +++ b/drivers/dma/fsl-edma-common.c
> @@ -283,8 +283,10 @@ int fsl_edma_resume(struct dma_chan *chan)
>
>  static void fsl_edma_unprep_slave_dma(struct fsl_edma_chan *fsl_chan)
>  {
> +	struct device *dev = dmaengine_get_dma_device(&fsl_chan->vchan.chan);
> +
>  	if (fsl_chan->dma_dir != DMA_NONE)
> -		dma_unmap_resource(fsl_chan->vchan.chan.device->dev,
> +		dma_unmap_resource(dev,
>  				   fsl_chan->dma_dev_addr,
>  				   fsl_chan->dma_dev_size,
>  				   fsl_chan->dma_dir, 0);
> @@ -294,7 +296,7 @@ static void fsl_edma_unprep_slave_dma(struct fsl_edma_chan *fsl_chan)
>  static bool fsl_edma_prep_slave_dma(struct fsl_edma_chan *fsl_chan,
>  				    enum dma_transfer_direction dir)
>  {
> -	struct device *dev = fsl_chan->vchan.chan.device->dev;
> +	struct device *dev = dmaengine_get_dma_device(&fsl_chan->vchan.chan);
>  	enum dma_data_direction dma_dir;
>  	phys_addr_t addr = 0;
>  	u32 size = 0;
> diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
> index 205a964890948..85487763e05ab 100644
> --- a/drivers/dma/fsl-edma-common.h
> +++ b/drivers/dma/fsl-edma-common.h
> @@ -264,6 +264,7 @@ struct fsl_edma_engine {
>  	int			txirq_16_31;
>  	int			errirq;
>  	bool			big_endian;
> +	bool			has_iommu_map;
>  	struct edma_regs	regs;
>  	u64			chan_masked;
>  	struct fsl_edma_chan	chans[] __counted_by(n_chans);
> diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
> index d9fb717b5b53c..eabb0086fc9de 100644
> --- a/drivers/dma/fsl-edma-main.c
> +++ b/drivers/dma/fsl-edma-main.c
> @@ -16,6 +16,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/clk.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/of_dma.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/pm_runtime.h>
> @@ -24,6 +25,7 @@
>
>  #include "fsl-edma-common.h"
>
> +static int fsl_edma_chan_configure_iommu(struct fsl_edma_chan *fsl_chan);

is possible move function here to avoid forware declear?

>  static void fsl_edma_synchronize(struct dma_chan *chan)
>  {
>  	struct fsl_edma_chan *fsl_chan = to_fsl_edma_chan(chan);
> @@ -298,7 +300,7 @@ static struct dma_chan *fsl_edma3_xlate(struct of_phandle_args *dma_spec,
>  	struct dma_chan *chan, *_chan;
>  	struct fsl_edma_chan *fsl_chan;
>  	bool b_chmux;
> -	int i;
> +	int i, ret;
>
>  	if (dma_spec->args_count != 3)
>  		return NULL;
> @@ -332,6 +334,12 @@ static struct dma_chan *fsl_edma3_xlate(struct of_phandle_args *dma_spec,
>  		fsl_chan->is_remote = dma_spec->args[2] & FSL_EDMA_REMOTE;
>  		fsl_chan->is_multi_fifo = dma_spec->args[2] & FSL_EDMA_MULTI_FIFO;
>
> +		if (fsl_edma->has_iommu_map) {

should has_iommu_map be per channel? How about some channel use iommu
but some not?

> +			ret = fsl_edma_chan_configure_iommu(fsl_chan);
> +			if (ret)
> +				return NULL;
> +		}
> +
>  		chan = dma_get_slave_channel(chan);
>  		chan->device->privatecnt++;
>  		return chan;
> @@ -695,6 +703,70 @@ static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_eng
>  	return -EINVAL;
>  }
>
> +/**
> + * fsl_edma_init_chan_iommu - prepare per-channel devices for IOMMU
> + * @pdev: the eDMA platform device
> + * @fsl_edma: the eDMA engine instance
> + *
> + * Must be called after dmaenginem_async_device_register() so that each
> + * channel's chan->dev->device is already registered.
> + *
> + * Initialize DMA mask and bus on each channel device so that
> + * of_dma_configure_id() can be called later at xlate time.
> + */
> +static void fsl_edma_init_chan_iommu(struct platform_device *pdev,
> +				    struct fsl_edma_engine *fsl_edma)
> +{
> +	int i;
> +
> +	if (!of_property_present(pdev->dev.of_node, "iommu-map"))
> +		return;
> +
> +	for (i = 0; i < fsl_edma->n_chans; i++) {
> +		struct fsl_edma_chan *fsl_chan = &fsl_edma->chans[i];
> +		struct device *dev;
> +
> +		if (fsl_edma->chan_masked & BIT(i))
> +			continue;
> +
> +		dev = &fsl_chan->vchan.chan.dev->device;

use new API vchan_chan_dev()

> +		dev->coherent_dma_mask = pdev->dev.coherent_dma_mask;
> +		dev->dma_mask = &dev->coherent_dma_mask;
> +		dev->bus = pdev->dev.bus;

I think these information should be set even without iommu.

> +	}
> +
> +	fsl_edma->has_iommu_map = true;
> +}
> +
> +static int fsl_edma_chan_configure_iommu(struct fsl_edma_chan *fsl_chan)
> +{
> +	struct device *dev = &fsl_chan->vchan.chan.dev->device;

use new API vchan_chan_dev()

> +	struct device_node *np = fsl_chan->edma->dma_dev.dev->of_node;
> +	struct of_phandle_args iommu_spec = {};
> +	u32 chan_id = fsl_chan - fsl_chan->edma->chans;
> +	int ret;
> +
> +	if (fsl_chan->vchan.chan.dev->chan_dma_dev)
> +		return 0;
> +
> +	ret = of_map_iommu_id(np, chan_id, &iommu_spec);
> +	if (ret || !iommu_spec.np)
> +		return 0;
> +	of_node_put(iommu_spec.np);
> +
> +	ret = of_dma_configure_id(dev, np, true, &chan_id);
> +	if (ret) {
> +		dev_err(dev, "DMA configure failed for ch%u: %d\n",
> +			chan_id, ret);

use dev_err_probe() to avoid print error when defer probe

Frank
> +		return ret;
> +	}
> +
> +	fsl_chan->vchan.chan.dev->chan_dma_dev = true;
> +	dev_dbg(dev, "ch%u: IOMMU domain configured\n", chan_id);
> +
> +	return 0;
> +}
> +
>  static int fsl_edma_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> @@ -882,6 +954,8 @@ static int fsl_edma_probe(struct platform_device *pdev)
>  		return dev_err_probe(&pdev->dev, ret,
>  				     "Can't register Freescale eDMA engine.\n");
>
> +	fsl_edma_init_chan_iommu(pdev, fsl_edma);
> +
>  	ret = devm_of_dma_controller_register(&pdev->dev, np,
>  			drvdata->dmamuxs ? fsl_edma_xlate : fsl_edma3_xlate,
>  			fsl_edma);
>
> --
> 2.34.1
>
