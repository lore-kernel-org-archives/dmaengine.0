Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9A620E030;
	Thu, 10 Sep 2026 13:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047817; cv=none; b=p6s1lSPHK84GejXwLNQxTn/rSe22YAwySaH659W6P32lfW77NqDSL9gk6NDbJV3v/xFXKSb3TAdLNr+yMTFLoiD70dqfbaD6aUhS9GQWx3LM2vJG0Jz882yFj3BOXP8B71EhTkzAhXxa6C/MpZMpdLpSO7BGyrdFuf8yZPH1hJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047817; c=relaxed/simple;
	bh=G5gcz1lcmEBhs7/N8SEY2p4bfnBRsbM9v20mq6G8sos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRcy1bL+a7e07ezzpAF6Fnht5KCb5Ynm4fPJsKclVM6pxUQH+AuOnCheSj8Nx6IVLVh0DI06Nqu5Y1BumWj2irTAUkv471eQjhkA6GA//lkzr/o06sUykWz5rw0vp7XhkZ3oexiHfS9oGNX0Y/t655QHr9tggE1LXok0ZD5z33s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9FQzpHI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9FQzpHI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4130D1F000FF;
	Thu, 10 Sep 2026 13:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789047816;
	bh=uB1mKCaFDZWuyK3DGUmrZXpgsZnUvWGB2ld0lL3Ic3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h9FQzpHISbB7i98A4hcOB1r65ny8i+NhCf8KZGRtNYOOS78isJaiBUlL8at1hCHrd
	 J2d0QD7XCAUJz5/rNbaacZbVESK1Lx7KnJgTr0PQczAfzj4RrUCtZK54o1S3fxH5JL
	 CHAow3IJG3/n5u41wB1Gx+xLYNlK3pKyK1jE9M3s8TwG97iNmoE7Tyj7cqbedoMEDv
	 2Jv6JEEqvB7NgEbYBpwGJyn/iKT0jEk8oyGwPcQNeQdi6gkJV+oxAANJAxpDm3a+H/
	 J0CgAOvwebxb+KDP2tOcj1bHnsYPO/pu8uXGF85d9ACoBX/wQzk6SO6in6aTasQJiY
	 oeCaTrPucgR7Q==
Date: Thu, 10 Sep 2026 19:13:31 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: fsl_raid: fix sparse warnings
Message-ID: <aqK0A4TFCM-laOab@parshuram>
References: <20260820002816.17382-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820002816.17382-1-rosenp@gmail.com>

On 19-08-26, 17:28, Rosen Penev wrote:
> The register maps in fsl_raid.h annotate every field as __be32, but
> they are accessed only through ioread32be()/iowrite32be(), which
> already perform the byte swap and take plain u32 __iomem pointers.
> The __be32 annotation therefore makes sparse reject each access:
> 
>   drivers/dma/fsl_raid.c:116:17: sparse: incorrect type in argument 1
>       (different base types) ... got restricted __be32 [noderef] __iomem *
> 
> Drop __be32 from struct fsl_re_ctrl and struct fsl_re_chan_cfg; the
> descriptor/CDB structures written via cpu_to_be32() keep their
> annotations.
> 
> Also fix the remaining sparse warnings in fsl_raid.c:
> 
>   - compare the desc pointer with !desc instead of desc <= 0 in the
>     three prep functions,
>   - byte swap cdb32 with cpu_to_be32() when programming the XOR, PQ
>     and MOVE command descriptor blocks; the plain u32 assignment is
>     broken on little-endian hosts.

Can you split the change per warning type? Also, the subject should
describe the change and fix something.


> 
> No warnings remain.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202608200637.ro1CqMxi-lkp@intel.com/
> Fixes: 68b7fbc23529 ("dma: fsl_raid: keep MMIO bases as void __iomem and cast at access")
> Assisted-by: opencode:deepseek-v4-flash-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/dma/fsl_raid.c | 12 +++++-----
>  drivers/dma/fsl_raid.h | 54 +++++++++++++++++++++---------------------
>  2 files changed, 33 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index a35ddc1297ce..524a7329c3c4 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -350,7 +350,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_genq(
>  	}
>  
>  	desc = fsl_re_chan_alloc_desc(re_chan, flags);
> -	if (desc <= 0)
> +	if (!desc)
>  		return NULL;
>  
>  	if (scf && (flags & DMA_PREP_CONTINUE)) {
> @@ -365,7 +365,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_genq(
>  	cdb |= FSL_RE_INTR_ON_ERROR << FSL_RE_CDB_ERROR_SHIFT;
>  	cdb |= FSL_RE_DATA_DEP << FSL_RE_CDB_DEPEND_SHIFT;
>  	xor = desc->cdb_addr;
> -	xor->cdb32 = cdb;
> +	xor->cdb32 = cpu_to_be32(cdb);
>  
>  	if (scf) {
>  		/* compute q = src0*coef0^src1*coef1^..., * is GF(8) mult */
> @@ -474,7 +474,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_pq(
>  		src_cnt += 3;
>  
>  	desc = fsl_re_chan_alloc_desc(re_chan, flags);
> -	if (desc <= 0)
> +	if (!desc)
>  		return NULL;
>  
>  	/* Filling GenQQ CDB */
> @@ -485,7 +485,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_pq(
>  	cdb |= FSL_RE_DATA_DEP << FSL_RE_CDB_DEPEND_SHIFT;
>  
>  	pq = desc->cdb_addr;
> -	pq->cdb32 = cdb;
> +	pq->cdb32 = cpu_to_be32(cdb);
>  
>  	p = pq->gfm_q1;
>  	/* Init gfm_q1[] */
> @@ -558,7 +558,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_memcpy(
>  	}
>  
>  	desc = fsl_re_chan_alloc_desc(re_chan, flags);
> -	if (desc <= 0)
> +	if (!desc)
>  		return NULL;
>  
>  	/* Filling move CDB */
> @@ -568,7 +568,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_memcpy(
>  	cdb |= FSL_RE_DATA_DEP << FSL_RE_CDB_DEPEND_SHIFT;
>  
>  	move = desc->cdb_addr;
> -	move->cdb32 = cdb;
> +	move->cdb32 = cpu_to_be32(cdb);
>  
>  	/* Filling frame 0 of CFD with move CDB */
>  	cf = desc->cf_addr;
> diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
> index 748047996bbc..1b6f6b82c7d3 100644
> --- a/drivers/dma/fsl_raid.h
> +++ b/drivers/dma/fsl_raid.h
> @@ -109,59 +109,59 @@
>  
>  struct fsl_re_ctrl {
>  	/* General Configuration Registers */
> -	__be32 global_config;	/* Global Configuration Register */
> +	u32 global_config;	/* Global Configuration Register */
>  	u8     rsvd1[4];
> -	__be32 galois_field_config; /* Galois Field Configuration Register */
> +	u32 galois_field_config; /* Galois Field Configuration Register */
>  	u8     rsvd2[4];
> -	__be32 jq_wrr_config;   /* WRR Configuration register */
> +	u32 jq_wrr_config;	/* WRR Configuration register */
>  	u8     rsvd3[4];
> -	__be32 crc_config;	/* CRC Configuration register */
> +	u32 crc_config;		/* CRC Configuration register */
>  	u8     rsvd4[228];
> -	__be32 system_reset;	/* System Reset Register */
> +	u32 system_reset;	/* System Reset Register */
>  	u8     rsvd5[252];
> -	__be32 global_status;	/* Global Status Register */
> +	u32 global_status;	/* Global Status Register */
>  	u8     rsvd6[832];
> -	__be32 re_liodn_base;	/* LIODN Base Register */
> +	u32 re_liodn_base;	/* LIODN Base Register */
>  	u8     rsvd7[1712];
> -	__be32 re_version_id;	/* Version ID register of RE */
> -	__be32 re_version_id_2; /* Version ID 2 register of RE */
> +	u32 re_version_id;	/* Version ID register of RE */
> +	u32 re_version_id_2;	/* Version ID 2 register of RE */
>  	u8     rsvd8[512];
> -	__be32 host_config;	/* Host I/F Configuration Register */
> +	u32 host_config;	/* Host I/F Configuration Register */
>  };
>  
>  struct fsl_re_chan_cfg {
>  	/* Registers for JR interface */
> -	__be32 jr_config_0;	/* Job Queue Configuration 0 Register */
> -	__be32 jr_config_1;	/* Job Queue Configuration 1 Register */
> -	__be32 jr_interrupt_status; /* Job Queue Interrupt Status Register */
> +	u32 jr_config_0;	/* Job Queue Configuration 0 Register */
> +	u32 jr_config_1;	/* Job Queue Configuration 1 Register */
> +	u32 jr_interrupt_status; /* Job Queue Interrupt Status Register */
>  	u8     rsvd1[4];
> -	__be32 jr_command;	/* Job Queue Command Register */
> +	u32 jr_command;		/* Job Queue Command Register */
>  	u8     rsvd2[4];
> -	__be32 jr_status;	/* Job Queue Status Register */
> +	u32 jr_status;		/* Job Queue Status Register */
>  	u8     rsvd3[228];
>  
>  	/* Input Ring */
> -	__be32 inbring_base_h;	/* Inbound Ring Base Address Register - High */
> -	__be32 inbring_base_l;	/* Inbound Ring Base Address Register - Low */
> -	__be32 inbring_size;	/* Inbound Ring Size Register */
> +	u32 inbring_base_h;	/* Inbound Ring Base Address Register - High */
> +	u32 inbring_base_l;	/* Inbound Ring Base Address Register - Low */
> +	u32 inbring_size;	/* Inbound Ring Size Register */
>  	u8     rsvd4[4];
> -	__be32 inbring_slot_avail; /* Inbound Ring Slot Available Register */
> +	u32 inbring_slot_avail; /* Inbound Ring Slot Available Register */
>  	u8     rsvd5[4];
> -	__be32 inbring_add_job;	/* Inbound Ring Add Job Register */
> +	u32 inbring_add_job;	/* Inbound Ring Add Job Register */
>  	u8     rsvd6[4];
> -	__be32 inbring_cnsmr_indx; /* Inbound Ring Consumer Index Register */
> +	u32 inbring_cnsmr_indx; /* Inbound Ring Consumer Index Register */
>  	u8     rsvd7[220];
>  
>  	/* Output Ring */
> -	__be32 oubring_base_h;	/* Outbound Ring Base Address Register - High */
> -	__be32 oubring_base_l;	/* Outbound Ring Base Address Register - Low */
> -	__be32 oubring_size;	/* Outbound Ring Size Register */
> +	u32 oubring_base_h;	/* Outbound Ring Base Address Register - High */
> +	u32 oubring_base_l;	/* Outbound Ring Base Address Register - Low */
> +	u32 oubring_size;	/* Outbound Ring Size Register */
>  	u8     rsvd8[4];
> -	__be32 oubring_job_rmvd; /* Outbound Ring Job Removed Register */
> +	u32 oubring_job_rmvd;	/* Outbound Ring Job Removed Register */
>  	u8     rsvd9[4];
> -	__be32 oubring_slot_full; /* Outbound Ring Slot Full Register */
> +	u32 oubring_slot_full;	/* Outbound Ring Slot Full Register */
>  	u8     rsvd10[4];
> -	__be32 oubring_prdcr_indx; /* Outbound Ring Producer Index */
> +	u32 oubring_prdcr_indx;	/* Outbound Ring Producer Index */
>  };
>  
>  /*
> -- 
> 2.55.0
> 

-- 
~Vinod
