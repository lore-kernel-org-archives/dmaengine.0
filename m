Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010035.outbound.protection.outlook.com [52.101.69.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E412A37E5F7;
	Thu, 16 Jul 2026 17:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784221387; cv=fail; b=jJVOwJwp4Mm8Nd9Hg0n4PHCr/hyqzRK/J9ebUeW3jTB/4YK9A9HHMmamWJWsfD2fAyTKd9H+gXoIg3XNzr2MmomoQ+iTuWfZwbxC5NtGgXSsTJrzYK1m8Ggw0zW4199m5z0ocujyY/hYyfbIn1l4Ko9GmxX5XjISmyb63VDgB5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784221387; c=relaxed/simple;
	bh=9NErgujTYV0DOx1qIDR1+zbFcVikvMKOLF6DxL9ltHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=U380NEAOJgbgvB/zJ1l9dHNiylSDmVrH7fJjyGN6wC2D+MiqTOOjcwyMKVjaRqquakL0MD+hHKStBErxVUk/ZJuzw5asecg4JNBKqx6E2tACRslJew6qFFykSEhvesxpuGcCu3dsH97QlR0++M/pChCAaNrPyBWXAj1jxRIh+qE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=x38ISwYh; arc=fail smtp.client-ip=52.101.69.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="x38ISwYh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dR2FX17/ndGwcmVKARoCgI9hx9L8guhKHtVdwQ8Om9c3V2j2O3nQcYU6giX2kTDRCzL32XnAaYOE7U405vJBUBt/6KO2DDbyuXVElRGJXsrHSTWtzBVF4/Lpyx/Y0vXeeLQz4QBgdw09EvxW1Pd/JgUc1Xn+ukBmHI/jDs098KGOGH+fpZ/u0L4exqENlxd+eR1LKg1SG8N6R5ZFnbdZxG/o3xU7lcLPGdQZbSXQEJwQzhrlffwwBD2eNWl46tyZW/3ePpx4ukYjcW7FEk1LZ7Z8cRuDHXR/KDpG0GSgQWjriMhJzZCWsAISdk9RC7YNrfB60CIuP1hgyC+aMS9qog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p05nj+VqPReyVovDURhEObIP2Dkg4T6vf7UrkO5Avsg=;
 b=mfiWiL7aQIZ1hfxiKUC0uPcwU3sdonZJw30Uq65Hscx//V8/6c2raVKPCucvt5Wp7YMLd3dfgjGqGaLaUU7Wa1H9+Z7PJo7OsFviIpStqiwHcTO6FXVqh5IErmpNaokne7wBLJ2FJ42R+u0KBoca3NyYdDZ0zpCuvJ7XXa7rcZ7HkSaNLTaIDQOyzwJ7BTweVA3wI32BzV/CMAPiVsmKL0f3/5UbZhaXCtWY5X0v1wVk1eHY3V0/ER7orUzaqzLtw60ZQVJdT4INJ/l585M2maCUwYXhW+RNjwi9rmay0GF6AxsH3DNgNCjuGJr2fKaxnE8zXHqD62BchmOoXWYT4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p05nj+VqPReyVovDURhEObIP2Dkg4T6vf7UrkO5Avsg=;
 b=x38ISwYhevV5YiBIAd5iFhN2C21H1QZxjbquobKPavM6XNUSAuSBbAw3gt9WyM+rQc9yXed4bZRs2++T/eDUE2kwtOEjYxM355Rs295Ghw7Y21AjO5xcatiCg9dNy+WrgxlEogJAOrIoX1RLlgp6O6SGGUu+PprmO96DwxeTBT3yIR/tkys2Gcd2jK2SoF6jd+O7vudFQcOAyg65t0sC1L/TXsCQxuhJQA3LiiDZVP836+ZgQoJNoQIMJW8/w8lKGZWc7oeBMDrZ3PXaGrvOG/y/Yj2xc3QSvO3SsfKvcJ+FoX6uAv3kdqjXWmeyX4KpAhXxohbWZ0f/JzO+U2OBmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMVPR04MB12675.eurprd04.prod.outlook.com (2603:10a6:20b:774::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 17:03:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 17:03:03 +0000
Date: Thu, 16 Jul 2026 13:02:57 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] dma: fsl_raid: keep MMIO bases as void __iomem and
 cast at access
Message-ID: <alkOwebrTsoMTX7l@lizhi-Precision-Tower-5810>
References: <20260714233855.870797-1-rosenp@gmail.com>
 <20260714233855.870797-3-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714233855.870797-3-rosenp@gmail.com>
X-ClientProxiedBy: SA1P222CA0193.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMVPR04MB12675:EE_
X-MS-Office365-Filtering-Correlation-Id: 2653a420-772a-471f-b39d-08dee35c18fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|19092799006|366016|18002099003|11063799006|4143699003|22082099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	bq001jp5cNx15uikgxmhiP0cq4UMGb6L1ZrhYmrT1RIuOwEhhowAFShYcbROzmJSYJf/NrhYlp0Y9UFQAxKH50+irDb0IbpN0nkDGWRODZNhYXfm7W+gdnwIp5jBMF5lamEGjnBmpvd2i7dwZxVGNeu+UUTSeTRmAL2MCptPlBaKPN3sHyXHz8MjCt4ciuT8mtuKpy9j1vHlSSxf4UXunwsI+NQUoggurPgmLZgtp7Bi+ebOXT6deiJmbrFIZkB3UYInlgT5bXZNKdsg0Th/2C1fmU8mBwsuPZUAZs8vfewCyoM+qG4MvamotCwDvUMwEFEbntuNlT9Lp1zIJTlYL+4eSQxw1YaMlYfaUUUpp5hYmYLS6ScIlv2cPxIqSwKaVnvhfWlS6Ne350/CAPDMBX3S+v/Qpv2qB2qjXAMWxr7FI1nNUM62TctwdzE5tU4sORiRW4bjiu9Dm2xQv/i0m/uCogcp2qo2hz/9rtEZtDKHlevX1SXugyVejCBO7+X9LplndOBkOHlJD6aYeB1PH5Z7ekylqaFmE5HAe4vzNHNAA5kdhvA10C1ivfDphiR3paw87x4MIF6emBXGdjGz0dm4bZc6oAR02nE/6G4pq8+Lc0bqHLfFyuNoro06Xr2sVcT4mOZMEZoCGxZMQ4doIbtzMK60KUAdob2DUESt8F0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(19092799006)(366016)(18002099003)(11063799006)(4143699003)(22082099003)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CbU+detm+XmKOfoeLP9NMePAhMj4gK6lR9bnMtOdN6wsRp5EYYi1BrjRoOvV?=
 =?us-ascii?Q?N7Rx8AyhaVoOEv8DhmV+00kMcsgQ+vLWEB9K2237xWlVA88aWiwb9fULwPL+?=
 =?us-ascii?Q?MV9s10+0wMdpw4Tkl+H3+XBYftXjhpUVr4HAyoko54Ct2irvEOHzZSPvzW6K?=
 =?us-ascii?Q?ahe5RhnIaeriz+0ZPaNpyyXbZ7sqdqrvVTbwaZIRl6ZGK7vqlJ+RYhQgkupV?=
 =?us-ascii?Q?TTX06z1/WStasW2Y0XFnUtRZCELQ5dXw0Tf1xJ3OCB1If6m3LulQ5gkYHJZY?=
 =?us-ascii?Q?vYGpRqGnOsmsmK1QZdmC/xRGxNbuPqb3ubll7xD6yvdk4NozJ+10ZiPn38kY?=
 =?us-ascii?Q?xwKQFt8DIqc8Yoq43e2HVAq6SmmXWPWDbVNJaGW68n1c4fDx61E27nz/J/DF?=
 =?us-ascii?Q?7l2F3kIyt2eV5G0Crp0Iy9FNMQQAvHUZOU39nWSqaQN2Sl9Iv2BKUPhCsNLD?=
 =?us-ascii?Q?ENqke+V2uaVxql9wCPy0Z2+d5K2cAXLVsrbmlcHuKsT8X3vkNW//GJCaZFPT?=
 =?us-ascii?Q?hK39medni6Y/+7EpqCtD343JAtOFJx2alVzqHxSUnj+6rT4n2+bxcVljbrNC?=
 =?us-ascii?Q?LMSRWnYdqLH5zBO5rRsULwtjXTToMHNoPI3Puk5HXrdRqWYH/Xav0b7fs3Kk?=
 =?us-ascii?Q?g3q9vq2wjZCktbX2Xmfbv1AhVvXlpdhgChcnexKIYXslFzmTbNEUvGpp8w2X?=
 =?us-ascii?Q?8hwX+XevPTc7/2ej3UGdkZal3q7CmyEmkMHq8jNvT9WAqJLprYu14FKQfTNy?=
 =?us-ascii?Q?sCw02WK911wCuNPEozwhVgm9GMmEzYqV8Sy/5ZIKA8nd8qiHqoJJ/tpjSme6?=
 =?us-ascii?Q?qVHg5jaJcR4RD98healUtMRbksulXjZX+Nca/GrpFUOG3m6aEg7I93LTCehG?=
 =?us-ascii?Q?F2Sj5ohY5d73Zlt7+zFWc9HLBhcnS2VJ+RqQcLvXXiYjw1N5YBs7Nmhqx9bS?=
 =?us-ascii?Q?gry8dLccUWwUcFdNyVN+t+VnKklN/Mp9yqGj/3BSKwZQC5E3RFH3bVBYwipW?=
 =?us-ascii?Q?t15G5BTEDx48t6YYXe0Q7rcJS92SfvyNg4JStwfK4xdKpFyE2BES5YEDW67M?=
 =?us-ascii?Q?P3wWH7QmCyYZWlJ3rkscT0hBNdJaUZW5ZXLVdpMf/0fM2DF1eKjI3puKf+1H?=
 =?us-ascii?Q?wzy19R1VsZxqw8+gyu+kceD3eYc2aatYXvRdXPathCkwcuuCekMf5nPACROT?=
 =?us-ascii?Q?oR7e6UUo6Qe9XjS3F8A/8qlJCkUrzLvcSmjK8xepcEM4JDDgFaVsEpYT4AdR?=
 =?us-ascii?Q?NOcztkR3/qOjryhal+E/HVmBCYQ/dz2DZW+ikvzBtpuFYYdeaK06zItixUVH?=
 =?us-ascii?Q?KyLB5EvW2Rul580Qu23Y0fFOgL6XwHfoRXIKC64VQgZJlmDBpuqQ2zWkcF/v?=
 =?us-ascii?Q?o39RSrVBf9J1xdrv8HZvq8UGcBu2B+bH6X10ozo2RsSzdHI+6htZhCjZxJoz?=
 =?us-ascii?Q?7bUgs8voO7HWmcKe7RGS7GaaB5I4Rw69kg4oO3AhDXhTwcX/M2srzNKcn6s3?=
 =?us-ascii?Q?Byf0AHJIB6Unb4b7CPhW5/sHImrR76eV+fVUoMm3Bv+Qf22Hm2eGuCYaxami?=
 =?us-ascii?Q?LYHU+TJeKPsdj0rIDITg0/tjCiz7jgeRw1kJDcOsG01PKpr2S50O5A9EmFlt?=
 =?us-ascii?Q?i9SfERTrlAa2BGOwKEOFUeAC6Kn9AjwxBMdfbwMiyXGFX1ABFIqw1UsFNC09?=
 =?us-ascii?Q?0bacjkH+p6FxOlAj41ChZojL0/2uqNkYkuNAKw0fKvgoWGdHbg/aapxKF06i?=
 =?us-ascii?Q?TRLBKAFn97KDpUMwvT+o67JMwKiZ6ZliJ7tpAhqyoFr+1VlueuK6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2653a420-772a-471f-b39d-08dee35c18fa
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 17:03:03.0854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5VRQ0kMB2ChFUoindC/A3PEO5H5eB+8fG6HlMnzK8Yw6km2iFEy8DNWFfa89cWXXSoHYLNlylMPp8BAcTl9vU7o51jJJyidfRh28Pout39/WDJ29wn3XhB4F9216eiP8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMVPR04MB12675

On Tue, Jul 14, 2026 at 04:38:54PM -0700, Rosen Penev wrote:
> The fsl_re_ctrl and fsl_re_chan_cfg structures describe memory-mapped
> RAID Engine registers accessed only via ioread32be()/iowrite32be(), yet
> the pointers to them (re_regs in struct fsl_re_drv_private, and jrregs
> in struct fsl_re_chan) were not __iomem-qualified, so sparse emitted
> "different address spaces" warnings for every register access.
>
> Store both MMIO bases as a plain void __iomem * and derive jrregs with
> void __iomem * arithmetic from re_regs, rather than carrying typed
> register struct pointers through the driver. Each function that touches
> the registers introduces a local typed pointer (struct fsl_re_ctrl
> __iomem *ctrl / struct fsl_re_chan_cfg __iomem *jr) and uses ->field,
> which is the idiomatic kernel pattern and keeps the registers' __iomem
> qualification intact.

Any document or reference show this is idiomatic kernel pattern?

Frank

>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: https://lore.kernel.org/oe-kbuild-all/202008111749.yy85rFMD%25lkp@intel.com/
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/dma/fsl_raid.c | 66 ++++++++++++++++++++----------------------
>  drivers/dma/fsl_raid.h |  4 +--
>  2 files changed, 34 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 888f55b672a5..47ebdf274331 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -106,15 +106,17 @@ static dma_cookie_t fsl_re_tx_submit(struct dma_async_tx_descriptor *tx)
>  static void fsl_re_issue_pending(struct dma_chan *chan)
>  {
>  	struct fsl_re_chan *re_chan;
> +	struct fsl_re_chan_cfg __iomem *jr;
>  	int avail;
>  	struct fsl_re_desc *desc, *_desc;
>  	unsigned long flags;
>
>  	re_chan = container_of(chan, struct fsl_re_chan, chan);
> +	jr = re_chan->jrregs;
>
>  	spin_lock_irqsave(&re_chan->desc_lock, flags);
>  	avail = FSL_RE_SLOT_AVAIL(
> -		in_be32(&re_chan->jrregs->inbring_slot_avail));
> +		in_be32(&jr->inbring_slot_avail));
>
>  	list_for_each_entry_safe(desc, _desc, &re_chan->submit_q, node) {
>  		if (!avail)
> @@ -127,7 +129,7 @@ static void fsl_re_issue_pending(struct dma_chan *chan)
>
>  		re_chan->inb_count = (re_chan->inb_count + 1) &
>  						FSL_RE_RING_SIZE_MASK;
> -		out_be32(&re_chan->jrregs->inbring_add_job, FSL_RE_ADD_JOB(1));
> +		out_be32(&jr->inbring_add_job, FSL_RE_ADD_JOB(1));
>  		avail--;
>  	}
>  	spin_unlock_irqrestore(&re_chan->desc_lock, flags);
> @@ -158,6 +160,7 @@ static void fsl_re_cleanup_descs(struct fsl_re_chan *re_chan)
>  static void fsl_re_dequeue(struct tasklet_struct *t)
>  {
>  	struct fsl_re_chan *re_chan = from_tasklet(re_chan, t, irqtask);
> +	struct fsl_re_chan_cfg __iomem *jr = re_chan->jrregs;
>  	struct fsl_re_desc *desc, *_desc;
>  	struct fsl_re_hw_desc *hwdesc;
>  	unsigned long flags;
> @@ -167,7 +170,7 @@ static void fsl_re_dequeue(struct tasklet_struct *t)
>  	fsl_re_cleanup_descs(re_chan);
>
>  	spin_lock_irqsave(&re_chan->desc_lock, flags);
> -	count =	FSL_RE_SLOT_FULL(in_be32(&re_chan->jrregs->oubring_slot_full));
> +	count =	FSL_RE_SLOT_FULL(in_be32(&jr->oubring_slot_full));
>  	while (count--) {
>  		found = 0;
>  		hwdesc = &re_chan->oub_ring_virt_addr[re_chan->oub_count];
> @@ -192,8 +195,7 @@ static void fsl_re_dequeue(struct tasklet_struct *t)
>  		oub_count = (re_chan->oub_count + 1) & FSL_RE_RING_SIZE_MASK;
>  		re_chan->oub_count = oub_count;
>
> -		out_be32(&re_chan->jrregs->oubring_job_rmvd,
> -			 FSL_RE_RMVD_JOB(1));
> +		out_be32(&jr->oubring_job_rmvd, FSL_RE_RMVD_JOB(1));
>  	}
>  	spin_unlock_irqrestore(&re_chan->desc_lock, flags);
>  }
> @@ -201,12 +203,12 @@ static void fsl_re_dequeue(struct tasklet_struct *t)
>  /* Per Job Ring interrupt handler */
>  static irqreturn_t fsl_re_isr(int irq, void *data)
>  {
> -	struct fsl_re_chan *re_chan;
> +	struct device *dev = data;
> +	struct fsl_re_chan *re_chan = dev_get_drvdata(dev);
> +	struct fsl_re_chan_cfg __iomem *jr = re_chan->jrregs;
>  	u32 irqstate, status;
>
> -	re_chan = dev_get_drvdata((struct device *)data);
> -
> -	irqstate = in_be32(&re_chan->jrregs->jr_interrupt_status);
> +	irqstate = in_be32(&jr->jr_interrupt_status);
>  	if (!irqstate)
>  		return IRQ_NONE;
>
> @@ -216,13 +218,13 @@ static irqreturn_t fsl_re_isr(int irq, void *data)
>  	 * need to do something more than just crashing
>  	 */
>  	if (irqstate & FSL_RE_ERROR) {
> -		status = in_be32(&re_chan->jrregs->jr_status);
> +		status = in_be32(&jr->jr_status);
>  		dev_err(re_chan->dev, "chan error irqstate: %x, status: %x\n",
>  			irqstate, status);
>  	}
>
>  	/* Clear interrupt */
> -	out_be32(&re_chan->jrregs->jr_interrupt_status, FSL_RE_CLR_INTR);
> +	out_be32(&jr->jr_interrupt_status, FSL_RE_CLR_INTR);
>
>  	tasklet_schedule(&re_chan->irqtask);
>
> @@ -627,6 +629,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
>  	struct device *dev, *chandev;
>  	struct fsl_re_drv_private *re_priv;
>  	struct fsl_re_chan *chan;
> +	struct fsl_re_chan_cfg __iomem *jr;
>  	struct dma_device *dma_dev;
>  	u32 ptr;
>  	u32 status;
> @@ -657,8 +660,8 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
>  		goto err_free;
>  	}
>
> -	chan->jrregs = (struct fsl_re_chan_cfg *)((u8 *)re_priv->re_regs +
> -			off + ptr);
> +	jr = re_priv->re_regs + off + ptr;
> +	chan->jrregs = jr;
>
>  	/* read irq property from dts */
>  	chan->irq = irq_of_parse_and_map(np, 0);
> @@ -709,30 +712,23 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
>  	}
>
>  	/* Program the Inbound/Outbound ring base addresses and size */
> -	out_be32(&chan->jrregs->inbring_base_h,
> -		 chan->inb_phys_addr & FSL_RE_ADDR_BIT_MASK);
> -	out_be32(&chan->jrregs->oubring_base_h,
> -		 chan->oub_phys_addr & FSL_RE_ADDR_BIT_MASK);
> -	out_be32(&chan->jrregs->inbring_base_l,
> -		 chan->inb_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
> -	out_be32(&chan->jrregs->oubring_base_l,
> -		 chan->oub_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
> -	out_be32(&chan->jrregs->inbring_size,
> -		 FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT);
> -	out_be32(&chan->jrregs->oubring_size,
> -		 FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT);
> +	out_be32(&jr->inbring_base_h, chan->inb_phys_addr & FSL_RE_ADDR_BIT_MASK);
> +	out_be32(&jr->oubring_base_h, chan->oub_phys_addr & FSL_RE_ADDR_BIT_MASK);
> +	out_be32(&jr->inbring_base_l, chan->inb_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
> +	out_be32(&jr->oubring_base_l, chan->oub_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
> +	out_be32(&jr->inbring_size, FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT);
> +	out_be32(&jr->oubring_size, FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT);
>
>  	/* Read LIODN value from u-boot */
> -	status = in_be32(&chan->jrregs->jr_config_1) & FSL_RE_REG_LIODN_MASK;
> +	status = in_be32(&jr->jr_config_1) & FSL_RE_REG_LIODN_MASK;
>
>  	/* Program the CFG reg */
> -	out_be32(&chan->jrregs->jr_config_1,
> -		 FSL_RE_CFG1_CBSI | FSL_RE_CFG1_CBS0 | status);
> +	out_be32(&jr->jr_config_1, FSL_RE_CFG1_CBSI | FSL_RE_CFG1_CBS0 | status);
>
>  	dev_set_drvdata(chandev, chan);
>
>  	/* Enable RE/CHAN */
> -	out_be32(&chan->jrregs->jr_command, FSL_RE_ENABLE);
> +	out_be32(&jr->jr_command, FSL_RE_ENABLE);
>
>  	return 0;
>
> @@ -752,6 +748,7 @@ static int fsl_re_probe(struct platform_device *ofdev)
>  	u8 ridx = 0;
>  	struct dma_device *dma_dev;
>  	struct resource *res;
> +	struct fsl_re_ctrl __iomem *re_regs;
>  	int rc;
>  	struct device *dev = &ofdev->dev;
>
> @@ -767,17 +764,18 @@ static int fsl_re_probe(struct platform_device *ofdev)
>  	re_priv->re_regs = devm_ioremap(dev, res->start, resource_size(res));
>  	if (!re_priv->re_regs)
>  		return -EBUSY;
> +	re_regs = re_priv->re_regs;
>
>  	/* Program the RE mode */
> -	out_be32(&re_priv->re_regs->global_config, FSL_RE_NON_DPAA_MODE);
> +	out_be32(&re_regs->global_config, FSL_RE_NON_DPAA_MODE);
>
>  	/* Program Galois Field polynomial */
> -	out_be32(&re_priv->re_regs->galois_field_config, FSL_RE_GFM_POLY);
> +	out_be32(&re_regs->galois_field_config, FSL_RE_GFM_POLY);
>
>  	dev_info(dev, "version %x, mode %x, gfp %x\n",
> -		 in_be32(&re_priv->re_regs->re_version_id),
> -		 in_be32(&re_priv->re_regs->global_config),
> -		 in_be32(&re_priv->re_regs->galois_field_config));
> +		 in_be32(&re_regs->re_version_id),
> +		 in_be32(&re_regs->global_config),
> +		 in_be32(&re_regs->galois_field_config));
>
>  	dma_dev = &re_priv->dma_dev;
>  	dma_dev->dev = dev;
> diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
> index 69d743c04973..6069615e2e1e 100644
> --- a/drivers/dma/fsl_raid.h
> +++ b/drivers/dma/fsl_raid.h
> @@ -256,7 +256,7 @@ struct fsl_re_hw_desc {
>  struct fsl_re_drv_private {
>  	u8 total_chans;
>  	struct dma_device dma_dev;
> -	struct fsl_re_ctrl *re_regs;
> +	void __iomem *re_regs;
>  	struct fsl_re_chan *re_jrs[FSL_RE_MAX_CHANS];
>  	struct dma_pool *cf_desc_pool;
>  	struct dma_pool *hw_desc_pool;
> @@ -273,7 +273,7 @@ struct fsl_re_chan {
>  	struct device *dev;
>  	struct fsl_re_drv_private *re_dev;
>  	struct dma_chan chan;
> -	struct fsl_re_chan_cfg *jrregs;
> +	void __iomem *jrregs;
>  	int irq;
>  	struct tasklet_struct irqtask;
>  	u32 alloc_count;
> --
> 2.55.0
>
