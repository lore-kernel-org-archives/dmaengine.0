Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1AD3B8413;
	Mon, 31 Aug 2026 16:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192144; cv=fail; b=vDXFjvawTznUbfYuDloss3fENBfFpwRWj+9YqKEuDuoxlvpZ2Nni+jCbkdqW7h3Kr7jqaibcJ8owMogZpB+U1dTMkc1T0nBIqus8FnT0+kc78SqWqAqBsinXlS2y4+tfEWekiR0oCiavYDNRvJBa56tSVsI620BvyCBL7uqOm7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192144; c=relaxed/simple;
	bh=/NVpOFHZsfrZ8yVZfNbADvA0IUvmZ2ubKNaQiiU4JlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rMNKO4ykZAKF7HUUkU76+l1HIGKO6CZlJJRncdQXDQeb1v4XjOYD/yf370xTOhaqdMVnyXZ2WJbglwNHzYej3EKQW6LqSX7xtRBZkkkj5BzW6AcnPD7ZHjsPVGIW9zRCDozeTWn2DtBaRnWBIH6mYPVUcETSnEOkRV51GIY6en8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NFHhAQxo; arc=fail smtp.client-ip=52.101.72.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NFHhAQxo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KvAQJSmCVzFaQ6EBExPTXMKZuRRtvDklu07HihFSuS85cvxoVlu7pn6YIZNORHsz14uBb0Kptpc2eUUWZbe9/p66e3k6cU1jEoXW95CeqFJ7pd5VZiLw59pnOFrkBAWVyvOwS7MalWQ8GB6EXTT22IIfXeJOOljU3/JQkXMF+G4EmZsra9tG5obWEC8uT/GucExC/CXS7Ht7+bMJAF068IX5NyJG/FLcAHEVWcdCD120tj1JE7j0jieQ0g0TJGzZUh6TEqU3dbRgsO5eKV29gCzvjIzktJRWVFxV3e5uPawanO8izoks9sFqkfDYqfydKPY8osUbB4iCiJhhn3YoIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=In2GcR7gGVoYJUlt/Juj7bSdtZRJXn/Dx42yMgtT4dA=;
 b=PY/grOSwlCnuMNWJLUKdPO32q7xiut4Bhru7KT20inwnQ7EFhsJ+EGFIkiRxjP7zmM94Zkf41Qd2/hj7zJlB+m3YUAsdvo3Qk1YylpDG3rSH6DP69IhwWw8HalrB7GfTLVyiVa1JsFILG0MAf0lNfGC27xGhQqn4vu1eIqEPx21pxbcgyxVCZ8t37AfMxhOC4YoHXZM4+o69Zu98dXHWMiZfpNdZ6FepyZZ/hz578N5qsTXlgpxd49U8kugcD2MVWbp7s2HmFAA9eVWSCfnbYJLCY2fnFF/tCW28xyhJQjSLb2fSEvGhKwX1v2FSibg1hu0qCb2ZkXzx3CnUQS11tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=In2GcR7gGVoYJUlt/Juj7bSdtZRJXn/Dx42yMgtT4dA=;
 b=NFHhAQxo41v7bgWe1J8Wl3+Pu5EEt7iEjeTEb7uAHxi5ThlhePZS1IFU0Yxl324gewVqolNwzYOLG3idXJpJEA/zZO7J+FYdlgMuS946kj89R95/3cjox8nXU93B0s9THQKBSZTXT14/6URFD9rrMtIK6nY9wNB/Wn/3nCR6epbc4MQ2SrzLN5PDTmXe+SmCvihhQBYWmyD2teV8SZcdPpNJT7MPcpvotbuvWwv7eIL8+jmVAqwagCN4IiRaEXLpvb7Sdo8vHh+jk+khn6I9kSw/a/6M5h32D9ufFsjYMCSzAsLYVmzsB5jY1CrlLrzQnbwlwygbRhfcpiFIp02C6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MI9PR04MB923983.eurprd04.prod.outlook.com (2603:10a6:290:87::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 16:02:19 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 16:02:19 +0000
Date: Mon, 31 Aug 2026 11:02:11 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dmaengine: dw-edma: Account for the MSI vector
 offset
Message-ID: <apWlg1phyv6iNbhE@SMW015318>
References: <20260828163611.2691264-1-den@valinux.co.jp>
 <20260828163611.2691264-4-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828163611.2691264-4-den@valinux.co.jp>
X-ClientProxiedBy: CYZPR14CA0034.namprd14.prod.outlook.com
 (2603:10b6:930:a0::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MI9PR04MB923983:EE_
X-MS-Office365-Filtering-Correlation-Id: a152e908-4ac9-4943-9dec-08df07793c26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|22082099003|18002099003|56012099006|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	5vtPG157yCg/aOQCkrY77IE5ChBEtPNUog9R696Od3/3xEau2xEVi7s4kBcbMZ7qDPho+9JujZpeOxKU8TVO431/MvESxwv2BiTfViQALp9O79mXM8SBPTfrVfLOoEokC/OYMczlmsOpHWDT4Y+iLYn48qpZ5s2NuK8KHu+hygPsk7kq2YxQ3C6AWGWpbihxJu9d26z8q9c0ugEhTfZN9w7JufACyhgc2Q75v921wCgbykAljwrf76pcu5HPVcvfxngTf+TJB9DHE2oWNUImpiWfzBYgtBo+xSpv68/yH8WD4L1WCNHzP+Gflh9VhHz7ZL/LLF0EPgXzzfa7wZQzOrZucgQQ5OFVO0RaGv/DOS8yQrLbEjgkaCYUyCKS7OCYdFnhMYac9yXWbm+XNGpaVNLIdrLXviIwrRmAZjIApZUzjSPl0NrZ8WsYD0gQiYoQPyFQC6MeMVNKIlKNfFVFCkCyeloTiQBrwS2019nBjVOHfvU78VhO575o4ZDupH6QJPJBQZHw78caJv4TLOU0KzAY6pBwN9/eublxR3reCGS//p79NcC7W1k3k2oHGyDZPK0b8WKsQNVHgGx2YRFjUn4wWr2TM55uOzhcWTC4/VM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(4143699003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y4ReckpIEpvbOi3b6eZGLJuQOju2o3YluRLaJ3jtCqNB6Yc9H6d5JquzBotP?=
 =?us-ascii?Q?WggVMFDR7BwE+UJihr6eUgXoUAid1i2i7lu6SFUyDcC8q4SKdCvq8GMNeqK1?=
 =?us-ascii?Q?NrOkqHdfqxsnV+nncf57BRgqjtlo8tK+EwzkFm+IiztGkdxuiJ4XfSd2cuD0?=
 =?us-ascii?Q?xRR64fXO7HjsEkK5rrxRwl7LCwrucqbFE8yyoC3nZSlrkDBRrYcKbJdkp/T2?=
 =?us-ascii?Q?w/LPzcOiimMzcKmLzDMjkM06QFCXFawQrqL8IOHEik4f1q38WGuuAChdPdDC?=
 =?us-ascii?Q?JUgKTGSR3RLffEvF89oDapvDOLCY9/l4CFhjgPdHTnP//zzOWOKPDYJkG7Fc?=
 =?us-ascii?Q?YskXoyPsuso4PVBlAJeU1U14DIIkNo9B78PRCurB44vd63JXQOemrJ3HqFmO?=
 =?us-ascii?Q?pvympEHWOs07bNBy3Yz4bWKFC/xmXriUQDUHixpFScBIfm9lH8d9vM+qbmxQ?=
 =?us-ascii?Q?7W1jKZLsj+Y3Mh6cexZzabSit4PWpVM4q9HLwv+IU0brs3+abjc6WH29jn87?=
 =?us-ascii?Q?xleQEdOIfLDDQ00yVlcki/BVUvHhKyvfBaXBxoNYyMITCpeWzsoqb71tKfc2?=
 =?us-ascii?Q?c57/ID1DCv63FYfMdT/2gfT1xFFOBcClyFosGh+pe8IroVM00KGYNogWNPrA?=
 =?us-ascii?Q?wsmrdn3m2ECusqjQjlIruK6QQX083/TTS5Qf2tsnwWUoP17leqxrIT5kl5kn?=
 =?us-ascii?Q?sbEoA1GFuEv2LiIAfs4JKsWDB0xwF3O2BHMtJcXNKyHIZctlx+TYOU8kv0aT?=
 =?us-ascii?Q?CiRG/6itSSbeU34IbkbX2PTSq3+PWc7PpHgYWUo9TrhccbRJqXpD++HV+Y6Z?=
 =?us-ascii?Q?PZGC1RUSLmzXv4pPPBUQ39/qT3VPQ2ykcXX8xHmPcAgdjCLj+zB9ELjeuDDv?=
 =?us-ascii?Q?Frt4ZxT69R6da9j4Cr/lk2FLvn1khznuNpohawdG5EqE9NfNQe8gyp6mt//M?=
 =?us-ascii?Q?jNW+hItO8HAIUZWZvtJwLEfJlRr3oFuqvcVgvD8DTAvErIHccarcI2VFXfQJ?=
 =?us-ascii?Q?Es2dH+bpvj9DuBL3sV6yXP17KiDO3quSpAeVEiBctIxVrrKZG34oSpR3MMd5?=
 =?us-ascii?Q?g/cyYw5kXjmiSiExU+02vSaZ7vgkwuO4JSfiMLvaxt57oSAOZrRdizWK9ZY8?=
 =?us-ascii?Q?DrrXfSZjWpz56WJJj/wiModyril2xI2IykPOk10pfJm6kxisUR9K8wybuYRw?=
 =?us-ascii?Q?3hHB/ASjetr0EudacGT9myNZCg0pphJ/msy30qxDG7s1T74wZ9AUi8sPKFU7?=
 =?us-ascii?Q?0NYnlF682acK5woAkw3LY5rt1Jx5QSzT2qZdfhMOGkXgYGehwZ48i7XW87HM?=
 =?us-ascii?Q?PJ6UImSJMvbG/63pnRMbvjPbYjeveHUYnbO4PodYUaPwAr0kOnCEOZTz6yKp?=
 =?us-ascii?Q?f+ecEQkRGwjLvBuyCD89zwYnWG94Bpbwt/G1YLK156jehh3uZ892rfVtxmjz?=
 =?us-ascii?Q?geDinDTrN6NkyTbRpBaujWmr2JWx4YGW2rTu95JLaZH+PbDZnH6GxSZ4Hj8C?=
 =?us-ascii?Q?vhXsn6CQD7vjDmcE0fpXxEH9OkhNPkukXINfQlY3a8w3JVR1Q18d4/SkinxQ?=
 =?us-ascii?Q?KgoxHcIyIWvtJ8cU+Y/mxcS5r2+QyKqa1ktotsQAmWzn6XWRiSm3XY/wxig+?=
 =?us-ascii?Q?CTAr+rANe7oXQC3VSPG2Uu9C52voxsZKktxeKgwnh+wMbM/4vmsR0grPUZ8A?=
 =?us-ascii?Q?d//b/hDDx36HwN5/Jmw+lZnZ622ioyWbnTdo+KodJ4NZkKbCk9LaiC6e2rh1?=
 =?us-ascii?Q?JPuGnqOTYVoRMLVo7aEs0juOcuW3TlBOhzTIEyjaTVt7Og27PNUC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a152e908-4ac9-4943-9dec-08df07793c26
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 16:02:19.4436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oqyTJydly1I+twvYLeClqNI4JirHbPej6csIouASaUyID/5sRkRhgEbMLMr0qrRYsng6qwI1XUWfS4swyfpb66gZSd+YUOnbTeYbjwz5qqUpmFzHyNcX6Vf+YGqQoHj8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB923983

On Sat, Aug 29, 2026 at 01:36:11AM +0900, Koichiro Den wrote:
> get_cached_msi_msg() returns the base message shared by a multi-MSI
> descriptor. dw-edma currently derives per-channel data from its local IRQ
> index and does not adjust a common IRQ at all. Both assume eDMA starts at
> the descriptor's first vector.
>
> That is not true when eDMA receives a tail subset. Compose each message
> from the IRQ offset relative to the descriptor base in both paths.
>
> While at it, avoid reading PCI MSI attributes from descriptors owned by
> non-PCI devices.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
>   - Rework v1 patch 5 for an MSI allocation shared with vNTB.
>     https://lore.kernel.org/r/20260312165005.1148676-6-den@valinux.co.jp/
>
>  drivers/dma/dw-edma/dw-edma-core.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index a8c6bd508fcd..6af8a414e4a2 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -7,6 +7,7 @@
>   */
>
>  #include <linux/module.h>
> +#include <linux/pci.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/kernel.h>
> @@ -1075,12 +1076,23 @@ static inline void dw_edma_dec_irq_alloc(int *nr_irqs, u32 *alloc, u16 cnt)
>  	}
>  }
>
> +static void dw_edma_compose_msi(int irq, struct msi_msg *msi)
> +{
> +	struct msi_desc *desc = irq_get_msi_desc(irq);
> +
> +	if (!desc)
> +		return;
> +
> +	get_cached_msi_msg(irq, msi);
> +	if (dev_is_pci(desc->dev) && !desc->pci.msi_attrib.is_msix)
> +		msi->data += irq - desc->irq;
> +}
> +
>  static int dw_edma_irq_request(struct dw_edma *dw,
>  			       u32 *wr_alloc, u32 *rd_alloc)
>  {
>  	struct dw_edma_chip *chip = dw->chip;
>  	struct device *dev = dw->chip->dev;
> -	struct msi_desc *msi_desc;
>  	int i, err = 0;
>  	u32 ch_cnt;
>  	int irq;
> @@ -1105,8 +1117,7 @@ static int dw_edma_irq_request(struct dw_edma *dw,
>  			return err;
>  		}
>
> -		if (irq_get_msi_desc(irq))
> -			get_cached_msi_msg(irq, &dw->irq[0].msi);
> +		dw_edma_compose_msi(irq, &dw->irq[0].msi);
>
>  		dw->nr_irqs = 1;
>  	} else {
> @@ -1129,12 +1140,7 @@ static int dw_edma_irq_request(struct dw_edma *dw,
>  					  &dw->irq[i]);
>  			if (err)
>  				goto err_irq_free;
> -			msi_desc = irq_get_msi_desc(irq);
> -			if (msi_desc) {
> -				get_cached_msi_msg(irq, &dw->irq[i].msi);
> -				if (!msi_desc->pci.msi_attrib.is_msix)
> -					dw->irq[i].msi.data = dw->irq[0].msi.data + i;
> -			}
> +			dw_edma_compose_msi(irq, &dw->irq[i].msi);
>  		}
>
>  		dw->nr_irqs = i;
> --
> 2.51.0
>
