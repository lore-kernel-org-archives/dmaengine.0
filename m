Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013011.outbound.protection.outlook.com [40.107.162.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AABC3FC5B9;
	Tue, 13 Oct 2026 14:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902130; cv=fail; b=FZJnpGJyfeJy5l1vyF56JFqnoS+lmpG4QqTgEubW7NIWbL/uQx6RPAyXVXatDduulzC5ZiTrYMJlKnEjH+DqerpI25fE4W4ijMnXrnHTKEyWz0GmULWAAN3AyH9Zkib5iS0GKifm5jqo+VAPW8NgPehOxEx76Z3xap9k1luJzYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902130; c=relaxed/simple;
	bh=O9yOnctpQh6OXnBdOpHvb1DCbew7CgrLehZAV+9T5vU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kdsVf4AhTUck9Xcs5vWSKBT+hQf74PUUan6gDxRRH4yqMuypr7oWf3CVCAAceLEgs40tHwiwTj4KZyKbQtdT8phy9vBKdlEp9i/Ar1L8IdPopFswARTb3MZ13/UO86jLb22iJia4hB50O6/IkDKfaK0BTkdy8yG/a3fUM0PGWYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IXvA8Uua; arc=fail smtp.client-ip=40.107.162.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IXvA8Uua"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MoDzqSYN57KAHuEeZEGuhEPEpL9MROW0GP1W9WKK231eSPow99p4FrtDZikUZRCJ5R7iz9CU36ytLG++nyLhSHnpptMTlfCHOoqKhEYwTgQUIep6ybi+hk29YTw0bG2EJly7GCBXPi3pdFWkrSpggTPKXsvM23D8I8HiuBF+FwCqynj2tGCZwelDIjxOln1f7jH5neboZ8kV8Qn1EZ6zStAYre4JSQrThdMhDvCm1lOEpHaB8ctByQN6wlubT+p/+aoK21nRmG0uusZtQ4x8w6nQu41OD45lei9xRJcohpkJXZcV6EyPLlJKzX032pRnm22WBb+Wfs/+xkQB9RZe1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFZhOPcYJ+Ch3JXUDXPCR2vxWk60wbzoBDU1DuholaY=;
 b=hBxJi4kMc8I92Qs4a06EoF5D1K6NxYaT3SPkbU4k2ZsBC1xtBmwoREVqIAOfS8Pz92ENawYnaj2tM+7TTyrutmnH7eY+eJ1Ps4UthkII5ap3ZqffNvPquUF9eFGH7SzSs6er1/mTwEtPTSfTrxSTrBc8j9IKMml64WXhpwRgmHxeW64qrWd7b8bRqThH6lNivORWEvagA66snDrN4BqWKiVWlMZQlRw4J8X+2klqBwqqUtc52qvjvPo5lfwX+eQeuYEoklpnzUJnpxISMBY1KSST8MNomgHCEA5N464p/cai55C59ebI4B6IzkvjrivTAexbtxiGEOPv56wUPW809Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFZhOPcYJ+Ch3JXUDXPCR2vxWk60wbzoBDU1DuholaY=;
 b=IXvA8UuaEgY52H5p5aeQsIrui/OrXvTMb1JUC542MKqIgxuUNeZvzWILbaTBK8iLmrRk5SnXlGrpgcb1jqC9fcCbWvo4lSunhhdJ4vflfxc1nyEuJRmCpv/4WEmSoc1sN1h+e23lnEL7DCNI+AI/tXNGYfgR6X5g4vT/SziSgXAlzrjy8bsXRshQpQ0TRfnINOIS8TifPBaE9kMUXOF2+QAlCWLxIYFi/Aaqz4e6hocXJwiDLzjvO3XvhEzL/k/rvQyKTrBy21vO6EjHqfsCdd4bRkayV9RXQDNd3LAO3Q0f3vbvWq4bmYyITqdZY3ob5tXGxMR9P9T8uQC5FFdz3Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7444.eurprd04.prod.outlook.com (2603:10a6:20b:1de::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 14:35:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 14:35:27 +0000
Date: Tue, 13 Oct 2026 09:35:18 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: xianwei.zhao@amlogic.com
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] dmaengine: amlogic: Fix little-endian variable
 operations issue
Message-ID: <as5Bpuw5Ddj6UiSf@SMW015318>
References: <20261013-fix-a9-dma-v2-1-860146b2ef57@amlogic.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-fix-a9-dma-v2-1-860146b2ef57@amlogic.com>
X-ClientProxiedBy: PH5P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: bac9e149-d1c5-4c2e-fcb1-08df29373909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|23010399003|6133799003|22082099003|18002099003|10067099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	heazRishvxZ2wJMQ1ZOJXOJoZdQYf57cFjaSpIjPTTubsEFgC8WYd+Fiupv9iz3nCqv4MnhiO9S582QFmhs2EyNfbGw2svOv35c0egDlq/R7K45ZRR7H+Jut6MmmJA1/BQbHMmT6zgIEBUPFmID+Q08rppE+FIEMp+itOyzsNyNV+Uf2CyJ3f221lQdWKB36qg3ZP6Eh87oZ0m0oBS2SH8Vr5m9FwhtzgBHFm2DZNlxfad09QJaXQzttG15r5EfcixrZfYfupceI/T8NyPicofhMUfadevFc9zHylhYzRORq1tfFqS++2TZ3e1oO8nSPxjDR2FC3uUy+Z4s9ovrLkcVyoZlbfT8Hm8n0QpW6b7Joks4ohh8hiVPOnOJqA4G/65Hv526vDEozI3Rg/ArqwsN6b9O3d5G4UcnjkoV1T1nFFAf+zsUILVu8hdTet4MUG/veEQUtU7N9xSZFSE7RRuIsvRsqshBsWxyL/VqMnnshG1U6120COF57BPEkcs2wqLYUwFv28EZHa42v7Nun7UA1kTzh827BBHrYKNB0ZVCCzDpScEIVmdAV/FPJH/k0oSo4M8PMCNpZX/WeC3huXhewowP4LCDkz59ec5k0A2lfk4l5GY4a81JbLvzpUpal
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(10067099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rH5B6KRtA3Sb1LDbTmkCqh/+T0i7qhzH5zfapDArUrdjfB9XQAvSGPeRYR47?=
 =?us-ascii?Q?qEzztGi8L6PGHhIhJBjLpcp8RsnTEnhQmieeoUmDk1+cI8bQzRMWRolIxbPr?=
 =?us-ascii?Q?JINGIDN5NuLN0KdqDdHIjJFP2UWe5Q0WOxNg0vor2B/77x+UZxLFCgL5Nttn?=
 =?us-ascii?Q?I00jdpWWeC0tWG6xK0Huo51I2dLx8VdZr84xp9VPEYPOfUQQOA7pTsvmucJC?=
 =?us-ascii?Q?8LPlkrinBUCDM5pvmlNaso1/EgXg5n8cTwORefqgkrxeWZZdRZHNwF2HHIEV?=
 =?us-ascii?Q?Pskz1MDioGVe4M2JiQdv0EiRcP15qxHb8H9lFawUIWleFTPz4BrO2q03om6S?=
 =?us-ascii?Q?O5om1X2gZp5eui4LtlifAtZhX0V9Vr+o62tUjGEiBuaAy3fNNx6QpjsCFh1J?=
 =?us-ascii?Q?P8iNAm0CZPQuZvLjL/H8qG7lDAkJGqrOb9TDNLKRDRAm3Y5DCNtS20wGlR6h?=
 =?us-ascii?Q?oQi46cFG2NsbehKqkKiHEFCtVf+cZC4DJsUoK41z87pLXKB/QFc/MsRc2Zom?=
 =?us-ascii?Q?CjrTOppgK5ippt9EJNaWDZ6sC6xsZgvND2dPv9EWKXBUfSBn+6ciSR+PEC9I?=
 =?us-ascii?Q?NroVA/rdonil3w0fLVkH5bkhwK/AbJxjQSEjGw4IERcOVhKY5vkqdP4/UAWW?=
 =?us-ascii?Q?wKCaxm1ndb32HDedVLKJMAih6dZ7UWtUhqptFFr5s3/9Hm3AwLG1Fj0lPJIy?=
 =?us-ascii?Q?BGv0lhhPfyJzarFR+t9cXLUIHVpCRKatwW//e/hcqwy+FuGTFDOm7J//O10Y?=
 =?us-ascii?Q?hVaPcOPmO9zZ1urwlUVKg19hwSnXjU1vqb1uUValvX6m6r9WmfVlfcfwOvXQ?=
 =?us-ascii?Q?zxK+Tl+GlSov67sTBdpnVPBR9gVHC3DMT41ovR43EBtPouudXYwxptUx/IeP?=
 =?us-ascii?Q?TulL5t4V6Wmqje5J/Rl1eRU+OshHz5BZvOzbSqaqEhMuWz7LZ3+8H1+LRD2b?=
 =?us-ascii?Q?qkA7ljVzL6qY6wVDlvXzKiOjhjPaqsNYyv0FxIUf6KoyEoU36ctHwai+D3OP?=
 =?us-ascii?Q?ailpWmJG7jY/ZB3mzcx+u/RA86z5nA3rLG8qURuY7cHp8aIMlN1UAvO3yaln?=
 =?us-ascii?Q?rk85RBWm/EOevR4A0vSYeenW0Cu5E8HoWp4X/lENUlHX/gyetULyFaYhBd+n?=
 =?us-ascii?Q?AhwljHa0spLqpP+DRMtUEsTbwg8X7AZERSmkpmxiwRU0TFg4jTXVoBOOADGN?=
 =?us-ascii?Q?TcLJHF7JYrN90Tc4HfYFxFDj8aQujjoPcAPetGsk98H5AzDfg4K9Obxac/KK?=
 =?us-ascii?Q?yxlDol6EQ5cvg1AC79YGOxrQqMrpPh1WwielB0aUsgIIBPEcM2xzXlRYXVQX?=
 =?us-ascii?Q?rnj8wBPw0qON2+TF0lX/zDKOWIGN6BUZwUrkr5/3fjyT44Dd2A1dCVWwidIX?=
 =?us-ascii?Q?uS3q1fd7uCJt2hL4rbdw5Fh5NMFIqZOGi3yRKUJ9MIdVKDDOncvd2MIS6P2n?=
 =?us-ascii?Q?pjfaB2v8qhxdO2TPlTEr4eeiBIa67PYb2uUjftjbaCj/Vyj93R5EPontB1+S?=
 =?us-ascii?Q?OkSzDiYSaqEAHqYxt5C8aqhMsz5SRockvOHVvNMmwHF9UmRW7sIeqaFasyxx?=
 =?us-ascii?Q?qUl9QbffFGmIDdZR8jZRNtEyrYzegDibR4/8cIMxVI+ApkzwKbAlvMosrQ6A?=
 =?us-ascii?Q?2E+xo0J2+0HlHKwLzPjAaDmGg5IEt6993YjcQaRsB9QgVk3XuIwpGu8SKkI5?=
 =?us-ascii?Q?V5UkDI++mGXK+2AsVapChbklUUOrciuOzZjPhcPgJOTlPRHSphWcBtc2LPkv?=
 =?us-ascii?Q?OUI9SRBihkwz9qiHcoRUoQldi4rRjXDuD6TkUekZzphWrYTnLE2C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bac9e149-d1c5-4c2e-fcb1-08df29373909
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 14:35:26.9774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqznBPYgu+m1mFmKot4iDkN5JvJTiKSXVdW2/uy84RyANxr4FiAdevFji2bdT+q/ErhfMwJkmAi/imjVngMouDP/OmGV51aiAwY9KkMk99DYQ1dMeaMD12oxqLP5KsoW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7444

On Tue, Oct 13, 2026 at 03:21:11AM +0000, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> In dma_async_tx_descriptor function,fix the situation where the operation
> processing of the little-endian variable requires corresponding conversion.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610060235.PuCxWQdk-lkp@intel.com/
> Fixes: b84b5197e344 ("dmaengine: amlogic: Add general DMA driver for A9")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Fix the operation little-endian variable issue.
> ---
> Changes in v2:
> - Simplify processing and rename subject to 'dmaengine', suggested by Frank.
> - Link to v1: https://lore.kernel.org/r/20261012-fix-a9-dma-v1-1-2d83008f3e32@amlogic.com
> ---
>  drivers/dma/amlogic-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/amlogic-dma.c b/drivers/dma/amlogic-dma.c
> index 78ee2337ae71..dbd23d29397d 100644
> --- a/drivers/dma/amlogic-dma.c
> +++ b/drivers/dma/amlogic-dma.c
> @@ -321,7 +321,7 @@ static struct dma_async_tx_descriptor *aml_dma_prep_slave_sg
>
>  	/* the last sg set eoc flag */
>  	sg_link--;
> -	sg_link->ctl |= LINK_EOC;
> +	sg_link->ctl |= cpu_to_le32(LINK_EOC);
>
>  	return vchan_tx_prep(&aml_chan->vchan, &aml_desc->vd, flags);
>  }
>
> ---
> base-commit: 42c31fec1ca76b8b5f7759def122d418dff2cd4b
> change-id: 20261012-fix-a9-dma-4be7e61ba653
>
> Best regards,
> --
> Xianwei Zhao <xianwei.zhao@amlogic.com>
>
>
