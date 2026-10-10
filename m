Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013050.outbound.protection.outlook.com [52.101.72.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286243921ED;
	Sat, 10 Oct 2026 02:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791599458; cv=fail; b=TB4B7s6OcUmfgwkXAktLZ7kI+T9/B7wI0XvRrS1sjBCvNKRkSS7JVynHAj15LABcTrFaRruvlszlEs7IDuy9pLKcoPeOYZUEgcgkqMjmRcNvTlMJQ2yhFsdfu8ZEvxtPzg08zzEwQX+CKpLYbvZEVzr6XdV/BT9sgnMcBC9smgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791599458; c=relaxed/simple;
	bh=tF3sFYd3gtYFHwtY9kMZOjO7HY4NYv2CEDKmxr0pBT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t1MUUTW+jYKLXBDH1ytrlyoq+cZxbrKeE9Vod0CggyIXzBE/EP2KoQWiDSvMUOOIpfDiWWCj6sVW9c6/Jgyy1WySm8nyqt8B0js/8LJJHRuwU9qY8fkXCep6rRxZPzewKADwQRSArYoPqpTHJnL73oxxa/921SipIkfk+H7mMoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=udTjv4Un; arc=fail smtp.client-ip=52.101.72.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="udTjv4Un"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/uTxrZa1mvuBHyytuctVIW56QhlCRokVcxAH9e0PFKYxY5Md6JfFru+oeYAxpTWI/4TxRm4GUB+gzVkvCGD3+qqpvUAZ7tlZd7y35GpmGv7ehyA4MRTu4jVI7kSySuUuNlCYOGDwSAWao5hM4PnutSGDT8ecGHNdqYpohSwlWQLhSl4licVXxxBRDas2L6IXoWssCYSJlQH54cNNN5QUKJVZ45MzNwv9XoHc6Iq9L0xxjk1nzTHamXTrJYPDvDk5ytU25hbKBrG1eVo16yvKmIxYdHyk/fDMEmc8pqT6P3YB+Cs2KvCsgV3NPIcDYN6UhOADIeXFLlaDv6NXiJtMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvgoCeub70DcLSpRZ7dy0U6IHPdhhrxPrl1fULs0buc=;
 b=vS63HC327Wy1JEbmiXOxapgLyYkG1cg+NZA967OsPgVbpS8++AiNx6hn4coQ/lyU6bGGfUrKms6t8E4nwRjz5yu2Zk2yt6ueRp4kZDIa+BQMTWB0sjBgpEy/37f5LNqC58S4XyBlM/aL/VOxfdnt/xCLzRWkVrJaX45Z06pwKkjMo4Mbgqk9H+1QhhcULe6RmdDqjiJ+WNVlNtrESjpS7+hvDXmYSAd02BKGyM5HBKZgrbidP9pnYqld5OoL//DECofQ2peizqtISnwk0ZNjlhrwvVhb+AY9MLjvoh5k7jGN+bqU3KQSWoDYHnUO8Q0EFNCz0wNYshhtd8osOvf9SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvgoCeub70DcLSpRZ7dy0U6IHPdhhrxPrl1fULs0buc=;
 b=udTjv4UnbpOYj0G3AjudnOqTwtf6ug8UedWhhoNawtFm2MgXKqRaGUx4NtGV92/A7NpGz5ZiATD0eNa/UJiZVzcOciBOWBcGF8vZ4VIRbplZ7ExPyno1svmMoTrU5VWIk4fMk6NkwOEQdsk9mw+ZJYvJ9FkeG1wNAhGYMV5Nnlsjwx2W5FZ8OSrqwPoIXVkcBajEAVAgwuGkcH96PU1Z3FCKLidchP/SCD+0HRRLdN3W59gN4cohV4nO+hig+kkWDmOhXvxLDA1n4TXzn/PAZth5NI11eF1Na78ysbA5ixjYFmxHSb4pYKu1TZHHvR0erJnarHDLL16lEzEQki5eYg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS5PR04MB9855.eurprd04.prod.outlook.com (2603:10a6:20b:652::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Sat, 10 Oct
 2026 02:30:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Sat, 10 Oct 2026
 02:30:52 +0000
Date: Fri, 9 Oct 2026 21:30:49 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] dmaengine: ste_dma40: Preserve the LCPA I/O address space
Message-ID: <asmjWVMGZCD2-o0N@SMW015318>
References: <20261010-dma40-smatch-fix-v1-1-26ca10043957@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010-dma40-smatch-fix-v1-1-26ca10043957@kernel.org>
X-ClientProxiedBy: AM0PR10CA0021.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::31) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS5PR04MB9855:EE_
X-MS-Office365-Filtering-Correlation-Id: 74f3cc26-3461-44a1-6cfd-08df26768125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|10067099003|56012099006|6133799003|261009223027099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oPxxR7OpIhyZuXjKmtsj2a/DcQX1/1IxG44o1HnqAGKpwZbrikyGrF6Hru6OgfQTML4b/jHsylrt+dftOgxCFJaoNa2YzVUMNLvlDPgZwpB0rh9/D5zqq6R1JANE0H3vtEMuUpV8//ot7DcuBarLtYvWdTmfMwwlCK90RaX2vwBJauCw3fsYEk9N3SKyjM1bUDXnZSbTJDjNHLltfu0D5J8FR6/P75F1hPvEaP+nbaCHNDY4DIU7lpiARfrYYFKRv13aNmZO1LPr9j77Y8WtOBII6O8iHNqix2iTlvK+bw2Wo3QnGoIlhFP8Yp/myyDrkTETUmrxqye4PLHJgvXWZxJngzJfFmJ3Ohnm24Zl9rxBsbZKSyRKeSp4V9bD8ztMYBa11Py+k/ejCsa5M2rMOgNSvucBc/DFKDbKl9HP9xqlBlO1Uyp6VGg5dBXDz3zNahfBLDd4RRHSCY0CNr6nPT05byj99f1mkL7mhI7tMTPOikz9dNGArAsIhPK6AAZRDVS16VQIKeB9KyMe59qCPuE8r3QEAOCwAOuG01NPz8V/kriQvhu5sA2TCMLIAqyDSGf4If93bdL0UjoOOEygU5SEbvCP48+LeYAfwiLc6v6ZleiTV4+AeX+I9WDRgnpY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(10067099003)(56012099006)(6133799003)(261009223027099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d3bUdUiqbX5gmdVXqo1k3LrkvmoYHq5Eb80ueFuCxDrZ4YV9s8u0VqcN3BxM?=
 =?us-ascii?Q?8TRKt6vQUHJZ5OJBELyoRvTiQs+EUrNQ1r+OguuBt4GFBrY+egqO2RZQBl13?=
 =?us-ascii?Q?59Ub//Mmbaq87+XD/dOgjFcr6jfMAvnMAmH+kgz7WFYtpfll+4Ygx00/5ToM?=
 =?us-ascii?Q?0RVujVQmQquP0Jannl7CqItQmBKsPBpEcgvhQnzdPQRmFJgaEkJ+VZl9Z0ZQ?=
 =?us-ascii?Q?XPaoo7B41ImS8cxN2NnhZ1UtjRBGG9zXK0PiRH/go7w4hs9JcxQ9kG4ZRlBc?=
 =?us-ascii?Q?cLfHsbS0FuK5gcP1rJB+QwWOUqXviigdz4bJufm6bjtRKg3IAnhFBbl7dbq3?=
 =?us-ascii?Q?NEKRLautPM25mYTirAuIECe0BoRf8t7X57GmmkY7oSz1WKkvZNz7lm7G+4Dt?=
 =?us-ascii?Q?oGUKa+Xca9vcw8nT5BkECtwaMf3YznHolVZ4U4LdNMGTibEmmCx+4HW5oID/?=
 =?us-ascii?Q?NSnZPSPv6LCuZ+FKmxZZmRCpAht71zcj18G3uyr3tUIUMt5xDgCdQifw3nKS?=
 =?us-ascii?Q?vSgXEKJWHQC+hkHZb5175Gmtt7Es/zIDt5gL/rn0GABviO+o3l8EUn+SZ+sb?=
 =?us-ascii?Q?znazSH39cCbD2chDrzWKk/cRHGrusifVU/z8zDONAL3TWNVpF+zlhz2CldrG?=
 =?us-ascii?Q?QQSudoRfd0DZjMh8TcpzHs23MIjm1WLTMucXR9fTp/C0Z6sYOJGAXXC9Okbw?=
 =?us-ascii?Q?vZt3EHpdcADkrvHHFUa+VLDPlCRvb+bTnEBlvjzwTlIk0cIuLyubWkyJo4Em?=
 =?us-ascii?Q?5JI+Bk7YNyhF667EuFGbkGdjl9wBgQ0gLan0ApTHGUS8xMHpZMORUNq11ZFC?=
 =?us-ascii?Q?OF0AXgjBg6ms7Jdm6yWfZQf6f3kdKDiGnAFCICLbht3Bw67RJQKXYJsSp08G?=
 =?us-ascii?Q?66WkeoccQn+pW4XcYvLHaiw+fjGc7pQUfgjK6ZwYE38MDPwY222Bls3Bpnv1?=
 =?us-ascii?Q?+TmilJvz4ps8Bb2BjXjRisIZztEFuGEexRHzE2IdyHE5RFuHElJxrJ4cGR9w?=
 =?us-ascii?Q?iOIiImvtIHnq9xQh+9P/vNEQVRuOZnGSX4FMWVhhXEglAG6mFKoO+a/DoLkA?=
 =?us-ascii?Q?v0f5/fDYfnVhCPwwiVGTz1By7LF4hT6gFJabt/JkkuOtGOCNM23me/7GC8Ox?=
 =?us-ascii?Q?EBCIGJoo+HGnZRJmWXqcPCwCL/5XDUsKMitSXvumTni0sryy9D7jkCaAP/8n?=
 =?us-ascii?Q?KeYinEV7lMkkrvSfjRw2J3iUud1hmmBJ52N6IO1GRpscx9B5ADrJZ2K30uK/?=
 =?us-ascii?Q?+l9U1OQ568jKbMaEXsUqyGLsdFghkIwAaHx589MDG+5dJgYAYmJrL4zH/SlD?=
 =?us-ascii?Q?96u6cHjG7O7XZIMfs569XUagB8K0w1M6drSuwsCzYUDMWt5BrfBzL5EshJMl?=
 =?us-ascii?Q?PRcQcMPQx/gnFn1qHdoKRnZM9c5tzuzbbGzhVjk+NbARktgNTmM71pZc3BBP?=
 =?us-ascii?Q?PjRTBsRMZ8p5WhDcwcqvEOXDXn0hBLTxEPK4fwyS4P+kmbYPyguBOfGL24GD?=
 =?us-ascii?Q?RPGyPxy8qrjcHS9G9pU/pcnyz3fsuNlwODIquZPRd5SCmI/I+2F+9y6l9FGS?=
 =?us-ascii?Q?6Ofv1plBiKBJiN9cTgctaF6BJEtDA9u3FtaqkDP+Ze8yA9EIqRZDfUcslOcS?=
 =?us-ascii?Q?rAIJOenLOihqpJgd49fJR6BXE1YpAYQAs80uezWqU99iQJ9Hr5JpdQBvH++Z?=
 =?us-ascii?Q?QcnzJRhTDUTItnAXB2tSVckRznKhNCw8NG419kYk5PUOLN/hUfFl8s/ky0lg?=
 =?us-ascii?Q?6j+c40sK/p8yYuAju8MyMubARtGSl/1P1YpHKRjOiLi7/OuVB5p5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f3cc26-3461-44a1-6cfd-08df26768125
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 02:30:52.6226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/L0wHX/NPWEIM9UiiNhSuwfzYHBKBjaoOZwf6r65/XT+oPfwwxmGvu2Nc4ibytB0XDelqx8wIRRw7eMITMeYFCAyvAayspjhkfT7JCBhpW/sYT4v+ZGZvUjky+koaz7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9855

On Sat, Oct 10, 2026 at 12:58:53AM +0200, Linus Walleij wrote:
> The LCPA area is mapped with devm_ioremap(), but lcpa_base and the
> per-channel lcpa pointer lack __iomem annotations. This loses the I/O
> address space and makes sparse warn when d40_current_addr() assigns
> LCPA register addresses to its __iomem pointers.
>
> Annotate both pointers and the LCPA argument of d40_log_lli_lcpa_write()
> to preserve the I/O address space from the mapping to the register
> accessors. This also fixes the existing LCPA read and write warnings
> without changing the generated code.
>
> Fixes: c80edceff29e ("dmaengine: ste_dma40: Fix cyclic transfer residue")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610090216.pjMRxhRL-lkp@intel.com/
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c    | 4 ++--
>  drivers/dma/ste_dma40_ll.c | 8 ++++----
>  drivers/dma/ste_dma40_ll.h | 2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index d3cc2c512ccf..74dd4cbdc3c0 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -509,7 +509,7 @@ struct d40_chan {
>  	u32				 src_def_cfg;
>  	u32				 dst_def_cfg;
>  	struct d40_def_lcsp		 log_def;
> -	struct d40_log_lli_full		*lcpa;
> +	struct d40_log_lli_full __iomem	*lcpa;
>  	/* Runtime reconfiguration */
>  	dma_addr_t			runtime_addr;
>  	enum dma_transfer_direction	runtime_direction;
> @@ -617,7 +617,7 @@ struct d40_base {
>  	/* Physical half channels */
>  	struct d40_phy_res		 *phy_res;
>  	struct d40_lcla_pool		  lcla_pool;
> -	void				 *lcpa_base;
> +	void __iomem			 *lcpa_base;
>  	dma_addr_t			  phy_lcpa;
>  	resource_size_t			  lcpa_size;
>  	struct kmem_cache		 *desc_slab;
> diff --git a/drivers/dma/ste_dma40_ll.c b/drivers/dma/ste_dma40_ll.c
> index 4c489b126cb2..3be7f5b1abb0 100644
> --- a/drivers/dma/ste_dma40_ll.c
> +++ b/drivers/dma/ste_dma40_ll.c
> @@ -333,10 +333,10 @@ static void d40_log_lli_link(struct d40_log_lli *lli_dst,
>  		(dlos << D40_MEM_LCSP1_SLOS_POS);
>  }
>
> -void d40_log_lli_lcpa_write(struct d40_log_lli_full *lcpa,
> -			   struct d40_log_lli *lli_dst,
> -			   struct d40_log_lli *lli_src,
> -			   int next, unsigned int flags)
> +void d40_log_lli_lcpa_write(struct d40_log_lli_full __iomem *lcpa,
> +			    struct d40_log_lli *lli_dst,
> +			    struct d40_log_lli *lli_src,
> +			    int next, unsigned int flags)
>  {
>  	d40_log_lli_link(lli_dst, lli_src, next, flags);
>
> diff --git a/drivers/dma/ste_dma40_ll.h b/drivers/dma/ste_dma40_ll.h
> index 55090cb31057..ca9d07649361 100644
> --- a/drivers/dma/ste_dma40_ll.h
> +++ b/drivers/dma/ste_dma40_ll.h
> @@ -455,7 +455,7 @@ int d40_log_sg_to_lli(struct scatterlist *sg,
>  		      u32 lcsp13, /* src or dst*/
>  		      u32 data_width1, u32 data_width2);
>
> -void d40_log_lli_lcpa_write(struct d40_log_lli_full *lcpa,
> +void d40_log_lli_lcpa_write(struct d40_log_lli_full __iomem *lcpa,
>  			    struct d40_log_lli *lli_dst,
>  			    struct d40_log_lli *lli_src,
>  			    int next, unsigned int flags);
>
> ---
> base-commit: 511afae96d89847f753fcab6b3a597f0281be9d5
> change-id: 20261010-dma40-smatch-fix-42fce06d4f25
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>
