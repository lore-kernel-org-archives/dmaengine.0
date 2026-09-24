Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013059.outbound.protection.outlook.com [40.107.162.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A72C4BE43A;
	Thu, 24 Sep 2026 19:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278234; cv=fail; b=EdDK1B4g0jGMJpNaReOVRXPf598t+9W2e+ePRYpWe6ciHo+Sm0cjOR+KpNNm+Zu2M5XwegQjTocAkKEU1cv37MStVwmZkRucDP/Ge+Ojk4pwP4qx9ZuooE/eDC3rvOt/AUYjwaRyP+mskin4nQp41QjGDz+pd+iV/m7K+j48YUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278234; c=relaxed/simple;
	bh=BWF2+jhRkI4rhfYd3mLALq7K9EybspeXg8DRS/i2OgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XFRdzpvHXh5iS/iHYcsPBajaH+155fQ5/g4l/H9nNVBvvwgx+2qFODNdeIRfIJlDZlcyroIp6mzAZz+fqsA6gThGnP7amr9PEr+fqfIw02da//mitrlzjbnA45bOh/7dSDDesX3p+CEtK1NPQK+E6F39WtGASR3bHV2O2cV+WqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bVjXqC5R; arc=fail smtp.client-ip=40.107.162.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bVjXqC5R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1J1HzfVnxARkyVuWND+3Fta3irsmXldRHT01CdcKM4QF+7Eo+hePp7sJ+M3qdTuxHPBKxYwb//7swDEUBq0T6ISt5pQbKXupBZ2ZJXgnyM77ZNKIMGuMddeAe/GDmBPZjld4JjuM0sCodiu0uB5yRLFNSKNEwKaNP9pgo4e+Uxh+8JOqJzwiAh57/ahepmM4RlrWe/8ESCiUg4Hg/577lsydaG9or15Uvhvipk1+/fqeyyYezJvOC7RmpxkoJasF4UGNH01B2HLQdehKUC4lSOgmwYYF+wdTxfsdIyrAqpBHtpXNDtg3RsbQV8QG/+BCrU5ZgNOtCqrxz5RZTSLYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JEmmtJBMSckDkNQCyrsw0PRf8xs15H3lSvTN4RBQgc=;
 b=Unb1kP2JP2+UDcbB3VD1nXLDZ+qVCy7lSfr4z3XiNP8IFMlek4YAqALKT/i1pmqT/eV8UVZJ/lIjIrKnlkoJEBio8mFDPp3l/aJ55UTgnEkGT6uP+G/0U2jey+ya5FSAc2qYLqLItWarfAAeW+m0HPjF75M2jfIc8DRp1JQhts4eb7cc5hxmOG6Fx4BoCIfqJ2pVobSJMz6i+KyJZH6s/9QmXl2pd1FUsoPHTfZ1+PTnca+536fx2tmRxUMpqMlOB7paWGXcJZNgCzjbTT0j1O7Beo136v+Ohatl8kHWL10hwqay9ZW9pE8EbvPmuLIpQj+kN1THZtjWUEkFuwie7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JEmmtJBMSckDkNQCyrsw0PRf8xs15H3lSvTN4RBQgc=;
 b=bVjXqC5Rd1C28d0k9XqB/2Lvl5D3r9RJdEz5o7xmrO5bAnFCU3uIJWQuLoqrO4+JKXAkomIFvMPSSP2YaOaCehfeO66wdburUBjgeNFd10QNJ1+acp5OztOAOm+27ePQXU1QO3qaF+jty+aBFo1NMrG7tr5V2I0nqNkjYR3IAMS626sHgyeE7DepFf4Y1YNuMPOFINOXdqADU93CvIMsMgacpWW+GhsV93lLOUwBX7u815Xg7EwQLzA2AkvKooQv+rMDIVKOJL6KMVed/niww56hZwPZH+tb5gxchLx63mf0+o7KgiEIApvwOw8qwFbzQi4PzqBBBfjlCrNJP9KtUw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBAPR04MB7317.eurprd04.prod.outlook.com (2603:10a6:10:1b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 19:30:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 19:30:27 +0000
Date: Thu, 24 Sep 2026 15:30:19 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dmaengine: use assign_bit() where applicable
Message-ID: <arV6S-U-ArZubwka@lizhi-Precision-Tower-5810>
References: <20260918141622.3022876-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918141622.3022876-1-peng.fan@oss.nxp.com>
X-ClientProxiedBy: CY5PR15CA0089.namprd15.prod.outlook.com
 (2603:10b6:930:18::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBAPR04MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: 273d1b0f-ed85-465e-ce21-08df1a7249a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|1800799024|7416014|376014|11063799006|3023799007|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	kMIno/5bz5CxcUJsyo7rBLbCzq8XlM/Hm1Avs3yuf7fM6Ji1yAcfswrdvP4bnxFai0L4UaTZ6JS8/UMboZPLI1T2irisy6wnkDc6VUCnvQSPzm/RzzEbwuqDpcYCZsSFGTXEBXRL1VPXze71euS0aFOZki5VufK2RwdM4nZPY10O8ZG53zp+4gEumYj5SDYGgppEzF1e3+TLFJ2TotYViGSTop1d37BsNnoF+ZJ3i+YQGeuNrv6qbNBdTLnqjNAPIBlX/wOV2Qs3vwwerA3xl86lCfu9xAr44NNefw/w4i3J8ftLgGhqR9X6kOfbfA5BlksAufp+becQnXzixP8IYaxpTcByS0ZwfRWakbEJEw+CX8SvQdomwH82LDYQ9l0Z6pDEF8z7ke+WY6SB7/gOnU9UQk9lOkDSBbkHK66Sm8bX2hZKiea8+HLweuRLt1RsoeKHOrDaY6PHkLVgN09VVF3XQqJhbG5t82TUaidxjKlB7ZwC3ZMT70619d+CO2qc3xsGjeuePb+BOZXltCBPNVSAErnDOeJFFGeg8QCp5Yfk6TTrKIQqfHALxcRBU8uf+3ds006RPL43+imzOdaSUQ/HymeGj5lPfb2YHHkLPbf9iVnCw5u9AmANpp5D3vF/WfcfCH2IMFyUP8qzGXsW2GicptGhDXX0/wuj8C+0Gog=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(1800799024)(7416014)(376014)(11063799006)(3023799007)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xG38F++ZsGT6w0Ipb4kyR94CkXCnWKNeZ0t+es69Q1PUMCr69IN1yHKy0T/q?=
 =?us-ascii?Q?Z6DOj1w7U5pNbXynkWzvfMWyyfyzd14QcUHs3FV82P2P9jrib7IbucOAAA6d?=
 =?us-ascii?Q?lrw89LnWYJr+Rl4Y5WAebFtWwXVcj8ys/hXxPiugVOglbkhg389d9E3a36XG?=
 =?us-ascii?Q?l15C3tMAVYov/rrRpCTm0g4qCnNoHuuGcEmIbGu2X3PgXAo8F9jYxJ6OPOLQ?=
 =?us-ascii?Q?qgyBqIhlFxJyLvl8gaYEOpPFzDcplJcfs7udZfsaDyJUA2Va6M6RKH1MENm3?=
 =?us-ascii?Q?jC5SRW85dXn8tqXilcy8mjWRGYDiq6haRmru16yFzi00galq1S6/L+foYzzV?=
 =?us-ascii?Q?jzrFj+pjaMiD+521uSYyd+nknbomIceghpUt3qJnHlrEmRA0BXRg67VdsEFM?=
 =?us-ascii?Q?XZzUH92f4+6r2yILPHVa87FfvQMT6JaSpChNE+yt7VtD9b7ATMbAoqFCsCOg?=
 =?us-ascii?Q?hmrPT6fdv+Yc6gXKIm36xkuAM2QOUHhKF6kwSw0oWMb9UcTyvD240bRokkYw?=
 =?us-ascii?Q?W83HBs8WxiJV5QTgaAhLAcU6K2TnT55PLcsaLBrB8OTaUuujt8B4QtAiVgGz?=
 =?us-ascii?Q?CW19cMUREK9sNZA+ONONkExmfnZVKz4tcimhWvl/Fi8SAZViotByS/yqkI4z?=
 =?us-ascii?Q?UDE4J2TaVC0i8gyU48QOwkQpmHwOVkR48YLhVOz/kJZfQKYZgtslQEArWiit?=
 =?us-ascii?Q?6uvqAq9GzSuMTbMtlcOHwyHSaqEYTVe8+33WgTTNvBlBO54CmalcEQ+6WuZU?=
 =?us-ascii?Q?SPY0M1qDjzyGHIrESoAsl0IvYqVl7VkMW3knAwmNDj9pkdTI04msKmklDAA9?=
 =?us-ascii?Q?hAsAJKR7q0ndBcZmOhS09R52Ud/3SjP/4TmVg+FYLtmgiwv7rTWbkOSRHEHT?=
 =?us-ascii?Q?K7gJso0tghYfvz3sVdnHybyeV/9+YAkl00CCaf4M/4VY89EYz6un15nGfM6i?=
 =?us-ascii?Q?XqNytH1AB25XiEnnsXIpAMau9GpPBxLQ/klQqtv7izYqz33P32dAmXUfZCeD?=
 =?us-ascii?Q?LUCB2vaPWbXfs6nQXOpHZOwhUhwbnBkpzQZepairZZr0zUPb6ByTP0ROVsKz?=
 =?us-ascii?Q?wDJurk03qX7pzxqhrnKYOZdpdKQUrqynw59gnUF7ImlSX9qvrxRm7hqYP7zT?=
 =?us-ascii?Q?sVpBmliCe7EHyWjrEXsuskZ/D7V7oO/5WZfdGEsoXYJhOcIIFghr4oFsFsDO?=
 =?us-ascii?Q?BXy1/lUEE7zMqns2aWPQR+Gacipob71f3J/1/ne46OB7Sd4xzSRsDtQN8eZe?=
 =?us-ascii?Q?9mY9kqd2bcGK8grZz/OUgebXH0BdgsPAongoK/1/4mNgBh1i8VkhwUcn53QU?=
 =?us-ascii?Q?I/YPnMoI4KRwchzX21oz8ZQx/eEZbBp+d/A24rjY/l9ohcBNaeLy1O6i2yn4?=
 =?us-ascii?Q?TkT+RzcIexBmGY99ZKNqKEnBCmwfZarWonsjoaGhCCjsPZv6u7fTRBmOPe2l?=
 =?us-ascii?Q?Ek3QpNWwIFFwgZTBaBQLwhYowTt0dxe4quyZ/b+7iOwSKvcbQqRHhYKcVjN6?=
 =?us-ascii?Q?mEUMTX6Qz6LGQqozm+Z71qn2eFcYlatFtJl1OYAgGDcikct9iH6FdJGjrwBK?=
 =?us-ascii?Q?fUw/mq6IYJhs4k7j97j3vDn75WA9GQ8DBJC25U9KT6VNQbxuf6I94v9Ru5oo?=
 =?us-ascii?Q?kLEqC21tgD6k44r8fkfrljgPBzSUQskSpkvn4V0xB6knxoTqt0WX04c8A6t8?=
 =?us-ascii?Q?rI2EE44nTYhAKkKfiOINO0Pe8/n9yhrHzhhPgmkNQV0266mHVFvRGQslv0ip?=
 =?us-ascii?Q?SVD3zbdyLwR6gln90aykuOrujJx0TfFkf7MtlYpS6RHdFA+xyFdU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273d1b0f-ed85-465e-ce21-08df1a7249a2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 19:30:27.6304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7irn/9DGI+7tLgzhrnLSMqTKDwwLTSdjqiC/Y0zA3g6KhVWxDimSMk7m2lFvjWM7PXYwx5LvDLBKWJEYUcLQo+a6uGXZFe/eUhsjmc4CVuBfvOirL+hy77kV/oivcCxb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7317

On Fri, Sep 18, 2026 at 10:16:17PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Convert open-coded if/else with set_bit/clear_bit and their
> non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
> API.
>
> Done with Coccinelle semantic patch.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/idxd/sysfs.c  |  5 +----
>  drivers/dma/imx-sdma.c    | 15 +++------------
>  drivers/dma/ppc4xx/adma.c | 29 +++++++++--------------------
>  3 files changed, 13 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/dma/idxd/sysfs.c b/drivers/dma/idxd/sysfs.c
> index 6d251095c350..2b0524324089 100644
> --- a/drivers/dma/idxd/sysfs.c
> +++ b/drivers/dma/idxd/sysfs.c
> @@ -1095,10 +1095,7 @@ static ssize_t wq_ats_disable_store(struct device *dev, struct device_attribute
>  	if (rc < 0)
>  		return rc;
>
> -	if (ats_dis)
> -		set_bit(WQ_FLAG_ATS_DISABLE, &wq->flags);
> -	else
> -		clear_bit(WQ_FLAG_ATS_DISABLE, &wq->flags);
> +	assign_bit(WQ_FLAG_ATS_DISABLE, &wq->flags, ats_dis);
>
>  	return count;
>  }
> diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> index 36368835a845..b8a91a0343b5 100644
> --- a/drivers/dma/imx-sdma.c
> +++ b/drivers/dma/imx-sdma.c
> @@ -710,20 +710,11 @@ static int sdma_config_ownership(struct sdma_channel *sdmac,
>  	mcu = readl_relaxed(sdma->regs + SDMA_H_HOSTOVR);
>  	dsp = readl_relaxed(sdma->regs + SDMA_H_DSPOVR);
>
> -	if (dsp_override)
> -		__clear_bit(channel, &dsp);
> -	else
> -		__set_bit(channel, &dsp);
> +	__assign_bit(channel, &dsp, !dsp_override);
>
> -	if (event_override)
> -		__clear_bit(channel, &evt);
> -	else
> -		__set_bit(channel, &evt);
> +	__assign_bit(channel, &evt, !event_override);
>
> -	if (mcu_override)
> -		__clear_bit(channel, &mcu);
> -	else
> -		__set_bit(channel, &mcu);
> +	__assign_bit(channel, &mcu, !mcu_override);
>
>  	writel_relaxed(evt, sdma->regs + SDMA_H_EVTOVR);
>  	writel_relaxed(mcu, sdma->regs + SDMA_H_HOSTOVR);
> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> index 279a431ccae3..39b1c4fd9ca5 100644
> --- a/drivers/dma/ppc4xx/adma.c
> +++ b/drivers/dma/ppc4xx/adma.c
> @@ -350,10 +350,8 @@ static void ppc440spe_desc_init_dma01pq(struct ppc440spe_adma_desc_slot *desc,
>  			 * of the transaction (src, dst, ...)
>  			 */
>  			iter->hw_next = NULL;
> -			if (flags & DMA_PREP_INTERRUPT)
> -				set_bit(PPC440SPE_DESC_INT, &iter->flags);
> -			else
> -				clear_bit(PPC440SPE_DESC_INT, &iter->flags);
> +			assign_bit(PPC440SPE_DESC_INT, &iter->flags,
> +				   flags & DMA_PREP_INTERRUPT);
>  		}
>  	}
>
> @@ -508,10 +506,7 @@ static void ppc440spe_desc_init_memcpy(struct ppc440spe_adma_desc_slot *desc,
>  	desc->src_cnt = 1;
>  	desc->dst_cnt = 1;
>
> -	if (flags & DMA_PREP_INTERRUPT)
> -		set_bit(PPC440SPE_DESC_INT, &desc->flags);
> -	else
> -		clear_bit(PPC440SPE_DESC_INT, &desc->flags);
> +	assign_bit(PPC440SPE_DESC_INT, &desc->flags, flags & DMA_PREP_INTERRUPT);
>
>  	hw_desc->opc = DMA_CDB_OPC_MV_SG1_SG2;
>  }
> @@ -2136,10 +2131,8 @@ static struct ppc440spe_adma_desc_slot *ppc440spe_dma01_prep_mult(
>  					chain_node);
>  		memset(iter->hw_desc, 0, sizeof(struct dma_cdb));
>  		iter->hw_next = NULL;
> -		if (flags & DMA_PREP_INTERRUPT)
> -			set_bit(PPC440SPE_DESC_INT, &iter->flags);
> -		else
> -			clear_bit(PPC440SPE_DESC_INT, &iter->flags);
> +		assign_bit(PPC440SPE_DESC_INT, &iter->flags,
> +			   flags & DMA_PREP_INTERRUPT);
>
>  		hw_desc = iter->hw_desc;
>  		hw_desc->opc = DMA_CDB_OPC_MV_SG1_SG2;
> @@ -2221,10 +2214,8 @@ static struct ppc440spe_adma_desc_slot *ppc440spe_dma01_prep_sum_product(
>  		iter->hw_next = list_entry(iter->chain_node.next,
>  					   struct ppc440spe_adma_desc_slot,
>  					   chain_node);
> -		if (flags & DMA_PREP_INTERRUPT)
> -			set_bit(PPC440SPE_DESC_INT, &iter->flags);
> -		else
> -			clear_bit(PPC440SPE_DESC_INT, &iter->flags);
> +		assign_bit(PPC440SPE_DESC_INT, &iter->flags,
> +			   flags & DMA_PREP_INTERRUPT);
>
>  		hw_desc = iter->hw_desc;
>  		hw_desc->opc = DMA_CDB_OPC_MV_SG1_SG2;
> @@ -2246,10 +2237,8 @@ static struct ppc440spe_adma_desc_slot *ppc440spe_dma01_prep_sum_product(
>  					chain_node);
>  		memset(iter->hw_desc, 0, sizeof(struct dma_cdb));
>  		iter->hw_next = NULL;
> -		if (flags & DMA_PREP_INTERRUPT)
> -			set_bit(PPC440SPE_DESC_INT, &iter->flags);
> -		else
> -			clear_bit(PPC440SPE_DESC_INT, &iter->flags);
> +		assign_bit(PPC440SPE_DESC_INT, &iter->flags,
> +			   flags & DMA_PREP_INTERRUPT);
>
>  		hw_desc = iter->hw_desc;
>  		hw_desc->opc = DMA_CDB_OPC_MV_SG1_SG2;
> --
> 2.51.0
>
