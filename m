Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F0B3AC0FA;
	Fri, 18 Sep 2026 14:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742266; cv=none; b=aeELm9liMa808CDVdecmsV+I3/3QdkM+5hndg4vfy2VK1ZC++QoFtPhX+ReVfaiSQc7O8qd7rv8tGMXbtYf03wmdovWfkqFLrR5bGFtKr2JWlBBv669e1ljaqO19IS4chnPZfcb3DVUbsDWdTb5TBpN1a3xnie9FbxGjof7vu4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742266; c=relaxed/simple;
	bh=cT9MZUefqqkKw7WHWzzp8+aaN83F67m383N8MtMYnbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c0Z3DoV5m5wVPBfQaCLzEux06EsF74rZdvnozzRo+GuBsEXX2L+20Z9MPjRqSzVro8p4BlmD2QqEnPoOiCfEDEfXNHAqufsQyK4OYUYbMorJIrfA+PN0/bduH1QidZga0SsLGj2WSuX/h5jBW3sQWrf6hcW7s1RFdHYOSC44IEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AjY9bkoJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AjY9bkoJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789742264; x=1821278264;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cT9MZUefqqkKw7WHWzzp8+aaN83F67m383N8MtMYnbw=;
  b=AjY9bkoJsIT/R8BJrlxzdq3A859Y/hT9d2kH2QPA7kSbsfPGgJDzFzx0
   WAvZgRM7RI1W6VRsgyb29tVqOO87jta8+s4ia6aD2iGAbma3K/CtzUbgD
   botg4oAGkZ0l0zsbAXHqjW6HqGEic+BGonVH2oXRfdLpvSUR9AzX7jtC8
   qzPlz+qRoOw1di2j4C+sTMyWF0X530ZuApia2CzrCxTQUr1FcWk6Pce4R
   JrnXPfSsqZ0lLvzxpLJPGGyXzCBPVFq5eudjovXK3XWbgopwqw/cpV4UI
   Hstg5d15VDqRANumhNuprDoxcypcpdgta+pekzPnplrVw4LXGtPrwA3wU
   w==;
X-CSE-ConnectionGUID: HBi372p2QFa5vnlkj+1r2w==
X-CSE-MsgGUID: 5eb8b8FaQSuj0aRtDzTndQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100850520"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="100850520"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 07:37:43 -0700
X-CSE-ConnectionGUID: 3Vkr41R3Tu+QsrJlbrlgVg==
X-CSE-MsgGUID: a9tY0WWmS7ioSf8PSh08gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="270737077"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO [10.125.109.117]) ([10.125.109.117])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 07:37:42 -0700
Message-ID: <8616f55f-9703-42d3-8d3e-7fdfb6a8a5ff@intel.com>
Date: Fri, 18 Sep 2026 07:37:41 -0700
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: use assign_bit() where applicable
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260918141622.3022876-1-peng.fan@oss.nxp.com>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <20260918141622.3022876-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/18/26 7:16 AM, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert open-coded if/else with set_bit/clear_bit and their
> non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
> API.
> 
> Done with Coccinelle semantic patch.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
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

