Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794454297;
	b=ulzI7YIvyO8f8mfmp6i+U8YZEwLd/tPvlYrCcevKpZ3e4bFjzCiSKX5NaFUdirkBqL/u
	 yn2FZ+Ns8Rfs8LzHIX9SdjrhAr5kTU4Lf/VjvJuoXRwL/rYgcqQII4uTGAmr3VUoGtTkZ
	 R4d/TDyYNvg5NQYg75agF1OyCXe485VBotvpxNqvA5qWLiu8302N2CYER/AO5xhpL7RFA
	 1edO6yzCgfr1ygROCgrS1XXad8cuYNI6QiJbrZ0m/KtEnELF7AMGLVLNb75v6/rKSWD+u
	 BMw5yVzamb2odaZW/VmmiO2N38BjNJaNvx1qw/IWJB/OA8pl1uIYo596BaNJac8r8jA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794454297;
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
	bh=IWUJsBsqljMWRegQMaCbmZGXlzIrDhY/dVWBhLMGRzw=;
	b=MQXjV1ocR8pmPXTguO5lBivvzKzsg56XSyPWtYX1hTqgTLB1WHtySJ8b2Kjl2mHWt42p
	 E7VJZE+JnxQG0bgK6PO0ukAH+Lug4Z3iX4QP9+lGPivjEFnl/xzBYNTVtMEo/X4aW2aoX
	 Q1T0bp2iOx1jjbBMO+zC9RDhMPG/s/XeYcji8TP87eqAuJiDc03a8ZwMGqzI8os6MbjAx
	 WXqgWCJQWteOCvGG8BQl0Kag/PLdvfn85fotgk/fz2xOYBdScII9qKyqRRhqYKUc25oIn
	 1KkPoz2OL30+4zyUauo4VsnI908SHRwdnNMXjAfywwWXZTUz1Pgtcpao0bZdtf0KxCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wW4raIkw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.57
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013057.outbound.protection.outlook.com [40.107.159.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8CC606A321;
	Thu, 12 Nov 2026 03:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A8CC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wW4raIkw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsYHGwnbPygqOnEy7ssFtTarpGiRF3PdQg3oEi9dBa9HKzb2WipIT6BD871ge3lRsi9D1NW9U10Hlsv+hZgnZ7ZZ1jHPmPYJwCn6N37KhPG9d9JLRj0rkFMYH4TWHbsa0WBMQEMAizYrkdbwa/7lZp6vnRU2HhorXgWaGK68fsOZChd8klhuFKyys6ICD1WCbUS4bzbQXD4mlVrHJhXM0tEHcj2bpkVu7eeZ2XObN7PSyhkfZGr6zo/1b3tSjhqWvdBgF+9jlXN0PehH19QuK0tMX5HiiAAfPdhFDLpoZeSpcX4whkiu3g4pMxuVEb4IqSkxrXjFq5fGsNe7zj999w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWUJsBsqljMWRegQMaCbmZGXlzIrDhY/dVWBhLMGRzw=;
 b=iYgtNND0c3YasF4u5y3S7VXBHwUgZwE03XY1y9apXcN6MVabxjYo85Di6iabxb9/PrRf8HkxZ8PKAQX6UpR4PxLZizvokxpu97IEdHQ2q7Fhqd+E7Sd3XKvqrARCn1Z15mE9XJUzloQaL8NvYK3LegjeKGYFyfpvFwDftBIkNrDV3SUjyQkCkzMNtSIqmdwx8PV76YL0555qXiubJmciRwVq4MGli8PfZL/JJtcdW0rzS4wevl0ZJhr+ilPqHP/w1MPXePdV4YGVfyXEGtH4Ozidc4rBPia/ZwsGQgxfID2Q0y2/h/9XhWUhNcP5u9+yuJYSpgYt9sqRxSL5t+kpZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWUJsBsqljMWRegQMaCbmZGXlzIrDhY/dVWBhLMGRzw=;
 b=wW4raIkwWI23PkgU6mtEW/rvEL6Lr66O6znwpHYVDfD95HuGb0X24maBtW7qUYGYoqWiv29qLzAP/99rXJaw9huIX/ykHYRSyfvWh7NfiCA+exv8vJgGTff3v23X+bva564RhrALr+eKofDJi/OVuQs/seKfuxFm/D7p4AHDeWl8LEOJYvPS/EEC/3DNbbqFo05sMc3cQ9JhxbajHobktTnQSAuENWqjhD+0o15WLU/v+X6WBZLg/k5dK5qHm6GTZbEzEr690yg+ZasS0coEQWlL8GDyER3IfXAV7L9bX0fNJQ45M36qyJB3KvBPMGEIgBzOBIe74e/7Sni8NtbDWQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by GV2PR04MB11960.eurprd04.prod.outlook.com
 (2603:10a6:150:2f5::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Thu, 12 Nov
 2026 03:31:34 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 03:31:33 +0000
Date: Wed, 11 Nov 2026 21:31:22 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: dw-edma: Clear chip->dw after removal
Message-ID: <avUzCg9LRo6tjDPB@SMW015318>
References: <20261110082433.1798391-1-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110082433.1798391-1-den@valinux.co.jp>
X-ClientProxiedBy: DS0PR17CA0023.namprd17.prod.outlook.com
 (2603:10b6:8:191::24) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|GV2PR04MB11960:EE_
X-MS-Office365-Filtering-Correlation-Id: a4f2808e-ef96-4343-0b64-08df406d7269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|19092799006|261028144727099003|261026140227099003|261021121427099003|261021123027099003|261026135527099003|261009223027099003|261026121527099003|261102123227099003|261022105027099003|261102130727099003|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	iWoeyITtiMKAVjBbf0UfuzVKy9P/KdM/EVBOi8UpaKr+N7BeM6m5/wxeimxrm/dzKBrG+DV8fipJq/OcU4CGbXr2EJewe/56nNAI6XNTYwHWAqPH6ulv/IAcHB1CQIl2OpULGWcwbs560Hqi4LppjWHqbnGPyVgMm5THOYA49ONsYM93KjZBdPlFQFIlGM6X0IR37MgWqFEdnCybYzeNAIsxNalfyk/zOs9Fg5TOKs47pysc6VHYNzFKyGZeBDi+ufuSjxxxYpa9z++sZsxmPL6l8CmsV7zWlkMECD567UKgI08Ls5F0Zm4fcwaOfzFmwO6PgIwYhFRAy98b69DYjdDTl3V7srfnYbRjLwIM7owdmq7j0BTUwxQuoUdC0LJ7XYzRJB/jwURsUrTMdBcWGfCbHHlR6F0hw4EC5vr4Z+GPVkO3S5IlbyLR4YOQrCp8MtYkh0VEf6cbZ03unp9dpSjhiS6ADPFbRDxPXYrxFOJ7Rz9K2pM4FpFqg99pbRDptU5f/titFB+AYFJcmHUxGzX+KAeTDMnvAHpNPb+AT2t1ole/kEtYMMYvEcFLKqDKt6c2SNogT6GbC+UTvJKz79JSq3aHgWGvto2rGJrkIA4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(19092799006)(261028144727099003)(261026140227099003)(261021121427099003)(261021123027099003)(261026135527099003)(261009223027099003)(261026121527099003)(261102123227099003)(261022105027099003)(261102130727099003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EhrvCwJpfTTqwqPtf7uaP4ffC+D7Ej328FEib0IJ8FMikN1XJAMFmFOf02Pm?=
 =?us-ascii?Q?k8b15UuSGmGeLdZjUWgGSPBFB8ns4FxJ3Axjl40SHh04sY/a+PJcomSSl+90?=
 =?us-ascii?Q?pSm9D8ImL69O7DWhrasbBzoIzofyD46GeiK0eZBJmoivNaSMRUvc5iTUSpQE?=
 =?us-ascii?Q?X2nISoKrDzcL46brr5zaGS0fncB9JCSpQMn6bUNv4JlKtx92FeVgzFPOC+zE?=
 =?us-ascii?Q?jCiuO1rVtmQYSPp0L+9koUY0A5ZqYdhcGimV0BPVgUPQDlme6E2m4v6Jz67T?=
 =?us-ascii?Q?j0upvDbatqpII6MjhAZEkRh3mq3e0YK9qk8zhQM8jYnG0hgM7rougGmrBJh9?=
 =?us-ascii?Q?haBZ7ezOQb0wUCQBEPuN4bER6+4teZNR8vSH+XxOs3QHA0BYtzvq6Z6yQEGy?=
 =?us-ascii?Q?GxgrgqRh3n/U+Z6JiZRrRsDPrEZL8EteogRpLFaHlKOzAEogWhGujAP5Ds+X?=
 =?us-ascii?Q?wIhUtT3oHDlbMwT1GmX16GANOhMtsN1Jt6pAPKgYugG/VaSQn1KkKVr2765T?=
 =?us-ascii?Q?iuRDz+HGkFCXQYcCXuy+1iHmAeG/zgDuwKk7fCbx+QfxiWrzr6hnJo5+RYXJ?=
 =?us-ascii?Q?8zN8CIynu/xHWOXJtUGP5dj1mOp2vkehBCopR9W6jOivdX82SIwk/P9qqQ7Y?=
 =?us-ascii?Q?UlO/8op32N2tLwL6ccFfe/X/m2/n3/rpsuvLnk8Y2tq5CuMyrV3Nwkk3utJa?=
 =?us-ascii?Q?JOoelpTztGx6+l+L1J80/XbjFvVSnGBJUCj3btyeUwgTgKOW6OrSn2m5Or9H?=
 =?us-ascii?Q?1jy88yAnunplE4SAiB+i9zsEAOI8XaZMdGojgJEtXt7u1G95P/liqqJbQwER?=
 =?us-ascii?Q?3PMCJPJ4lL6ptISSqm1qk7hcaH/OjvBemioy/67kVNRxLadsXEdll3IYe/1v?=
 =?us-ascii?Q?Bal9dErDFMw6VF0OBtZ9CETFBwGsPlxDNpJxolrZbSBDzjkb8NuSPtpMsuhq?=
 =?us-ascii?Q?a/XzcocWqa4vBsUx/zSgaxrXR7zeW6Or7h/1YBkAK9QAVzj5GbONAyx0oFCR?=
 =?us-ascii?Q?FVPrSBnYOM43brmdBSXTXXkOGvEQwP0anokT4HbDqSfOmAbGi6Q7HQa33UyU?=
 =?us-ascii?Q?rqypVJbqYqCPKqqjbjvgestoSzd15xVtCWIOUsjOacxK6wVMQabCGPlX2a/v?=
 =?us-ascii?Q?WP9719UaFfU7wCNk7OJ71n1332uuMg5JN5wEjMPPUZkiX6j56lc+vdYKxOkZ?=
 =?us-ascii?Q?+X1/FOFrN0/NRyzF2y3ssosETdKxVY3CRvdE/tDLEVCIbrcG4CZp7iSY10B1?=
 =?us-ascii?Q?u/FXD2AL73o2D6WBdLqoNGyj58COhas4q3xtXO9gnLclsYvIWOFt2WgkOquf?=
 =?us-ascii?Q?a2jcPJRL7P6hVufPaqKCLFSepv++Oc0DMjLFvCuCBeaW6VOwmDqfHCnE2F8Y?=
 =?us-ascii?Q?ZNOcFDLneV4jGch32JFKmWrJuz7cZBLUqeX3BTpQ/NliDEMV7nYSaG4LNYjW?=
 =?us-ascii?Q?fPAAHC9eX4nBNXucwrmPe0Yad6sIXlQxVXdY7YsI/KywGEFy233uHoFbw6DG?=
 =?us-ascii?Q?rZZmW3KlYfn7K0lFDzBA50UtSFaMqHj9auv135vSPWqqPmayjbAvvH9W5DNL?=
 =?us-ascii?Q?R02R3gwVaPBlqHS6Yu3NqokBsnJ5twABb4gic/LG4DyF8xZVME0ZLHfRFvSn?=
 =?us-ascii?Q?5WRIktzh0XYwPYkZU06v8IKyjK9O4mg2AKk4+9ozCZasiUYpsS8b1WGoK4MX?=
 =?us-ascii?Q?D8I/rlTSiclaNV+xBlIMWzE4ca0xRsKeNCGcE06ccfceaYrPZ+piKxS1O9v4?=
 =?us-ascii?Q?H5IBCbv1+3nKCKp1uhfPlmNw4x2fkOOizl4G1pDMxPxm4N5XgqK4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f2808e-ef96-4343-0b64-08df406d7269
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 03:31:33.5242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zKd2wsWuDIO2t1rG5s4ZSO8JlnNhCcFDQKOy7N7MjfPwpeM9VmW8GTy6xYcxNzbqyBoQ/zr8ExXsqQXL1Y8Q4xjvjMHqkjFk+Q5ZmOuTziysdiANe7sXu87b5YBhyHJs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11960

On Tue, Nov 10, 2026 at 05:24:33PM +0900, Koichiro Den wrote:
> dw_edma_remove() unregisters the DMA device and releases its resources,
> but leaves chip->dw set, so the pointer no longer indicates whether the
> eDMA instance is still registered. Some in-tree glue drivers call
> dw_pcie_ep_deinit() when dw_pcie_ep_init_registers() fails. If
> initialization has already removed eDMA, deinitialization attempts to
> tear down the same instance again.
>
> Regardless of whether those error paths are reworked, clear chip->dw on
> removal to match its assignment on successful probe. This also lets the
> existing NULL check skip repeated teardown.
>
> Fixes: 869bc5253406 ("PCI: dwc: ep: Fix DBI access failure for drivers requiring refclk from host")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20261022082230.3164834-1-den@valinux.co.jp?part=2
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/dw-edma/dw-edma-core.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index d682074eaa0e..daa2084485d5 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -1509,6 +1509,8 @@ int dw_edma_remove(struct dw_edma_chip *chip)
>  		list_del(&chan->vc.chan.device_node);
>  	}
>
> +	chip->dw = NULL;
> +
>  	return err;
>  }
>  EXPORT_SYMBOL_GPL(dw_edma_remove);
>
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> --
> 2.54.0
>
