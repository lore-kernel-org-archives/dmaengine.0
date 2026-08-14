Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013027.outbound.protection.outlook.com [40.107.162.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A443E172E;
	Fri, 14 Aug 2026 21:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786741238; cv=fail; b=OKOv8LdPUrNqt4HCwi1jma5NcUebvWMWqtAwd+gZz76vT4ySDIrvCkFN8vulkU13k1BkFlrUXFpuEk7EUffLQ3nvCzay7IW4yYVBVmBzWz7aibZU+xntHwOSlsnWY6KS8bc+Rj+hVgFd3Q25F3RGkyh3zy8Qd3DoHG91lzSnCYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786741238; c=relaxed/simple;
	bh=4n8QEXiChFXF4TS73w6z3ZnlS2NXApjPMVa0w5Bzw9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DWGB+FR8EovFEn7Uv7c1NFskrXH2pFGJDzcZqmAmn2ec08tBcX1ZA5gRd4yXQ5JPkrEbelSEKdJnhkQMM0s1JAfkZHIBstvxGTBw/Qdu0WGvP2J7egGgAqRmQ57+i+IbSvqbI0gLcNL/UxphaEVsPoarXhGrtn2S3DWKz0ayH1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e2elMv3w; arc=fail smtp.client-ip=40.107.162.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e2elMv3w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTMfIi1QYFFJePUjD+9A9ZuIaE7K+IEUEpJGd4NcQWaJsHzUbu1iZyvIG/BqK7Nv/wCXeC4+c6+fWzg0fCWdCt7G73ga5myu7q3hoCGkXMrin/IFyGjCdvtxCiKTr6sqFBlM/EwUVIrVnlXZULIIGqfIXFRIA3kHvnuDZv4wE+9h3AIXhtFPEECmnsa+hVtHwGNUA3SiRHTbfEwRmov2veShPepIo8HaFeaeoIZOFeEUNHJC8TsH1+X/3J8hg9xXClcbOfWnnZ5rZ7xNrgvs6+cGrL7QhJSq5NvCfDg/Q8OYlqu9xOP264tgJ+4SsXsWaU3uL6I2rcHMhzzO5+KYnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dAStj+yBFxT0WSlnFCF1yO3ETomsTMKWvNY2BbT0sw=;
 b=aP9fT2aApjNvLMTRlYbqJB3fKHiWheW0tSsRLLV/fK7RPVeIJUzHO9pFK1L3LRkBBPw8Eodif2ww6ZSzLjVFQA3jyftKP3GNIc1doYxLaI2CUmQSv86Tul5uBBT4JnB085TNr+deAk6Ad+k3HaopHjnItkm3bMUJ7vSqfZXqBdaj41noNDVoxxrngiyfbZ7hdNttFcQYX8+82NMg4DN+Hr9pRrHcNzL+0+GA8rXRHNYOkkd/KrtLqgrUppNWDuzSf3u+3mMWfaiabHJzcdOJHayH2atD3MAnOG2v+TNs+H8VWKGZ8+u17xH3XKkg2eoMYoEmu9DVVRxlGqg9knLmqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dAStj+yBFxT0WSlnFCF1yO3ETomsTMKWvNY2BbT0sw=;
 b=e2elMv3wu3l25IQE/jopDFgPXAK3byjglfdmRxOugxzT/eNzNCFcO/UUCm2K0iMbyJTy7cAWwnFgSNoRspLZk66BP8JIRRJCDLKdtzoyR5UEYBx2xvHgmnsXEiSwllt4+Rh0dj+MaKSobN6+UqiIN9AvBNCDTfjzrrs6kBh4j3TrF1SQeJOttBsDxINEsYFyAFIPqfIrYIfu7OE7I0J3i770WHs7b0iOJgZ2+75ppF9OuaG4N89PI845mIBdJVd4zMRT60jwcvX5QXJ2KFEdDkLbLwCfISCd1lXWAyhTdQ1qVRS1rK6f6vBdb19gpST1FZsIeYwbRWBBqX+M9W1/eQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by ZR6PR04MB993147.eurprd04.prod.outlook.com (2603:10a6:910:e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 21:00:30 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 21:00:30 +0000
Date: Fri, 14 Aug 2026 17:00:21 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: sun6i: fix use-after-free in descriptor error
 path
Message-ID: <an-B5SdpGfsJoudH@lizhi-Precision-Tower-5810>
References: <20260810102044.1725649-1-nagachaithanya9911@gmail.com>
 <an9nNnRMAzhHcjlS@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <an9nNnRMAzhHcjlS@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SN7PR18CA0002.namprd18.prod.outlook.com
 (2603:10b6:806:f3::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|ZR6PR04MB993147:EE_
X-MS-Office365-Filtering-Correlation-Id: c9622263-7029-49fe-2d60-08defa4712db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|7416014|1800799024|366016|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	83U57skLoJHHhD5aWLClcg9gn+d6ZyTBchI9agRkD60A9j0nuvAPJe8gV9PSBgnjUTEY+hZtReyqx2lnYzOGeTK3vg7z9OU0EXyVipGhnoGOyrQ9NN8/kmlIOH4Ua/AQbTaiAPQET0BrCFZFhFtnnw1fF5tHpP9utIoX9eYNsimqFxf/UD5RaLH+mNs1bHJZEW+5biNOZdvhpIvdDysfd3R2PR8NoI8+WgIV3sdypjx2iudz97SEMnJ7tIu0rq5UYeTr5VoqsuGxZ0noMZBxEZ1C374Knpz6GYwtBVWqMt1ADbJwHzXrjlKWK+JlOMIiQDSMGop0grNCrJFlGweLIds6faDFWqMV9hPiWrxpIqxkb4AHVDDchSFJ93JhIad2sCiKQmlgRro97wg8m0562SX/GVVfcdFDxX3SoT5v3yeyHu19El41SRdGI0I5dVcll/xPXP9iXq59h4Gci8PYo+XjrK76NKaMZRjVYCToCQ/aakVKo/aA6BQ5604uRTm6ci1pvD2dqLohp+VaQDaoTHrEpbEJcgmpVDFL5C+LwfJ+C9BHDAo0GsXrSzVmlJcRpBUyXiNYyljZZ4LOFr/pwRb12Uz/9C5iHbsiwgwBQPNDzUchoZJNTyFFWTP/mRDemE3LzUPzk+rCEQTRZEMgO7Q818vHTyYGEm3mRxLhdqE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(7416014)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a58D4RhMKLbqh20/MQf46r+XRDO1QsCm+1raBIvq/mS26qf/LjT2qOrlDGUv?=
 =?us-ascii?Q?jRPvd2FJ50eftnEfVvHZBvRH8WPKG0jflao6D7Z0lZCGDV+VPOV7BvOAeGYa?=
 =?us-ascii?Q?TZnPYHA8X1hHm4waV9k+qACK6uvqTpFxGLUiLs7sNJpDgebtVN052WdHdGZ7?=
 =?us-ascii?Q?bLnPXUHg+jDdnnMBChawNTyrIw5zr8SpvRh4Y+b4Pvw1sx19w4iO45dMOg0E?=
 =?us-ascii?Q?6z5YTiVo9BiQlzeCZfObiAzTSXiqfzbydkdk/W1j7T9+EAQETgxgEymn5MCJ?=
 =?us-ascii?Q?OLax9Kov88FsE0u221EXhKLt8KGjZJGHP3scJYf70J42JBCLOPKAD3HsxIxi?=
 =?us-ascii?Q?9I1osXOrRuc0JrYON9pxMcS53xV/lfDbbFTCHTBsGaeENbqSPU8j5SfMzO9k?=
 =?us-ascii?Q?WVrsFIfSnIjbfw2c8b9HhTopdWVnux9IsNvaPDX+t5rzlXIoX6TXxqI5irdL?=
 =?us-ascii?Q?5EVptk1YqXgJBajlASqIvJS1F8AuDTMapFA/lbhJ6beCheT2d/3MvbRYcdqd?=
 =?us-ascii?Q?JSKr8PyLAtxOPLDXrHPguwsd38iF8zODOXyrkC1N/XfOQ5iARRDRO00W5dPT?=
 =?us-ascii?Q?5XwVaGE0n9Qrdo4aICJMOezT9EWIKcoFJLE8U3ETMQC6hIxbtGHrpjHxSnWa?=
 =?us-ascii?Q?tBZI4K0l0JYXA2hkJGP24yRjqKfnfmnRBHLPT/4BgcZlAywkxthfFPFPp2k4?=
 =?us-ascii?Q?7JKhkKvuPQlmSWweqbM4XWLS7l5h5EntfVbooqHr02nbv+1kxbtP3Exto+jb?=
 =?us-ascii?Q?1P6pDfUvjm1Hk3IVKFYzL+OFbD2auCxvPCSij3RlT6lR/tN3Q5OWbH+pxkBS?=
 =?us-ascii?Q?tFms0G7GDiLHgM3TWeeSLWdUMjlOx2D0EF8k9kRk3UyCrGgV4Z/slwKL403r?=
 =?us-ascii?Q?AsnrEAWxBoprPXP39CFrjoccz0xG2da6Aa+aIhHO5BpwUP+newNx/QR2O7aj?=
 =?us-ascii?Q?hEuuPL205bbBy/7ueCVQ7fkgEeEBP3/W7y+B3FX05Fppn+pI06r0WUcpoIQh?=
 =?us-ascii?Q?Vjaafd5GbsTNOnNf4kziY3HZtLMs6pHdG3gjcU9iAWZ7ZAV0Y/UKqrpPyAlI?=
 =?us-ascii?Q?9LEX2HmInFho6mvfAke3/miY/D9XuZ5ZPYwRgPIwg2MRoFQa2WftJn5OeZpr?=
 =?us-ascii?Q?rlzwz3vB9KvBzsHZPTjsFG+Z6khcTL8nIEa0jWdhNIo1vLA9yVuAl5nPQlSZ?=
 =?us-ascii?Q?Fq8wZqQneyO6hJS/wYusVLFPOk9x1JIBd1PkLNpjqNkN0E+W5GPAjn8LHt3v?=
 =?us-ascii?Q?4uXQ1cI70QMRc66IOhQNOqtKO7K5OyUfo/Uh2ATIW0g9vWvbOYNGa1P6FJ4Q?=
 =?us-ascii?Q?pVqz34IIcueQ9vYsbuXM9Bqzr+LoQ27tTz7ag4Pdze3z4t9IABxUN9vQVp05?=
 =?us-ascii?Q?gBIoxuKBxt8tXhQljDuQc6jJqlDrjJAnP2EMTaoJGUjkjb10ouYQQqY75w0F?=
 =?us-ascii?Q?29ZXLd0tJzBFdSzGEpl1GcVPYuNtYMGE+cdLO6s5PW/dw2MmPYoE6pKjTw5Q?=
 =?us-ascii?Q?YxPS8LGWFuiydT3pAC2QZ4CzICGY5meemuDaOwseU2fEJQnld7sBsy8Bl7dx?=
 =?us-ascii?Q?2T/IytfErkLgdlmHD6i2Y7gEBPScnmcS9J1YXr4BQsDpn6VcCDOFRiPVg5xP?=
 =?us-ascii?Q?RjP3TWv2yv4i3lvQpF52ir2iyEnc0gnfE5aYzLqjHN5E0aUn175Ns7EV+xjf?=
 =?us-ascii?Q?AIEVo22R3hQ08Qj0vSiS1ZswdgRXPF7OYSb83lhaXZeoLvJd+ezkHAr4ZPBw?=
 =?us-ascii?Q?fiesq/TcmTCHVCCwH3+aJzAydhFWFwOB8ueF4/TUrCoCvyDG5/rM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9622263-7029-49fe-2d60-08defa4712db
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 21:00:30.0971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UywrAKgNy+FC9ui7PvDfjCsu2ncPr+JDXimhnxtj425qPGdTfj3CGYFB2rRmIljOjIkwSsvUQWf5saJmZVu5dUZ/iiokOgYSPp+kZcKe2dNrAQfi8xv5BIT9XlZ8jkaS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB993147

On Fri, Aug 14, 2026 at 03:06:30PM -0400, Frank Li wrote:
> On Mon, Aug 10, 2026 at 10:20:44AM +0000, Chaithanya Lagisetty wrote:
> > The err_lli_free cleanup loops in sun6i_dma_prep_slave_sg() and
> > sun6i_dma_prep_dma_cyclic() free each LLI node with dma_pool_free()
> > and then dereference the freed node to obtain v_lli_next and
> > p_lli_next for the next loop iteration.
> >
> > Save the next pointers before freeing, matching the pattern already used
> > in sun6i_dma_free_desc().
> >
> > Fixes: 9aa48806edb8 ("dmaengine: sun6i: Do not use virt_to_phys")
> > Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
> > ---
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Drop review-by, I prefer use below method to fix

https://patchwork.kernel.org/project/linux-dmaengine/patch/20260727061142.44195-1-zenghongling@kylinos.cn/

Frank
>
> >  drivers/dma/sun6i-dma.c | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> > index f47a326dd7ff..2439fa6564f2 100644
> > --- a/drivers/dma/sun6i-dma.c
> > +++ b/drivers/dma/sun6i-dma.c
> > @@ -720,10 +720,10 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
> >  	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
> >  	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
> >  	struct dma_slave_config *sconfig = &vchan->cfg;
> > -	struct sun6i_dma_lli *v_lli, *prev = NULL;
> > +	struct sun6i_dma_lli *v_lli, *v_next, *prev = NULL;
> >  	struct sun6i_desc *txd;
> >  	struct scatterlist *sg;
> > -	dma_addr_t p_lli;
> > +	dma_addr_t p_lli, p_next;
> >  	u32 lli_cfg;
> >  	int i, ret;
> >
> > @@ -789,8 +789,11 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
> >
> >  err_lli_free:
> >  	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
> > -	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
> > +	     p_lli = p_next, v_lli = v_next) {
> > +		v_next = v_lli->v_lli_next;
> > +		p_next = v_lli->p_lli_next;
> >  		dma_pool_free(sdev->pool, v_lli, p_lli);
> > +	}
> >  	kfree(txd);
> >  	return NULL;
> >  }
> > @@ -806,9 +809,9 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
> >  	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
> >  	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
> >  	struct dma_slave_config *sconfig = &vchan->cfg;
> > -	struct sun6i_dma_lli *v_lli, *prev = NULL;
> > +	struct sun6i_dma_lli *v_lli, *v_next, *prev = NULL;
> >  	struct sun6i_desc *txd;
> > -	dma_addr_t p_lli;
> > +	dma_addr_t p_lli, p_next;
> >  	u32 lli_cfg;
> >  	unsigned int i, periods = buf_len / period_len;
> >  	int ret;
> > @@ -870,8 +873,11 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
> >
> >  err_lli_free:
> >  	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
> > -	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
> > +	     p_lli = p_next, v_lli = v_next) {
> > +		v_next = v_lli->v_lli_next;
> > +		p_next = v_lli->p_lli_next;
> >  		dma_pool_free(sdev->pool, v_lli, p_lli);
> > +	}
> >  	kfree(txd);
> >  	return NULL;
> >  }
> > --
> > 2.43.0
> >
