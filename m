Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851B23A3E97;
	Tue,  1 Sep 2026 07:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246136; cv=none; b=M+qtsn2DT5b354p12zCAetpmMD73TStEyzVpi4jeF/yfGV2Cih7mlCZbOxn7YQ0ijwaBQdY7O43gG0lXIYUwfxFVvSkmrm7Fwu0FEzQvEVLm1yX2ZOfjpEBxmga+a9pb452mDSXpiO8VFR75c/NgxzKDIEdzTmHXiVSRyLgWEXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246136; c=relaxed/simple;
	bh=8NfANyTxN0qCY8pJXcvVvItKtncE2L/XnfaVfiWLtY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9bDF7djjnz38E6lsDblC7vi4fzgSW6sh3YGJQOsE6EJlbkg0AbPVeoKH2MGB42s9d3rdGK8Hmw6ZpGPHwPWS/I95iv5sYzx7jkUTC56ybur6N4IDmwX8isQGOB8CBacJmRFW0wPYC92+gi+Wr0UeDc0IAH/DvYyx+vNvNUw1yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nyf6Y7q5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nyf6Y7q5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788246135; x=1819782135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8NfANyTxN0qCY8pJXcvVvItKtncE2L/XnfaVfiWLtY0=;
  b=Nyf6Y7q59o2hd+mtXzt7MU7u8DUu1cvBAPD5icPke4yEbx9VNxP/eyH1
   ctscnopKKOJxGSrsj0AbD90OPeV4Lx6lx9OfjQFVJbW/UQBOQoUheACdO
   azDXb8ii2q66Ez8RTb1DhjvqXeWFuxdkQcAIs7TkPlazuh6PMuwNgg6yf
   IzUMJx3d5TpMnmJixVv5UTe1VFUN0tB1w/+ShQYTHbzWyxI/jEUqLFGRr
   5vwJvgpWqalChG8ppmUzyrftIb04cgjIKfqbnixuq4m6X0crn5HyBQMtn
   G45sAdT5uV2s06O08dGmCXjPaYRwarfIn9VkhONiPZmXtQfYqDU5UoBNQ
   w==;
X-CSE-ConnectionGUID: vnMS5AspS4CWmL+bFaEl3g==
X-CSE-MsgGUID: icpozkzZSqav67qjMsdX0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88591753"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="88591753"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 00:02:14 -0700
X-CSE-ConnectionGUID: 8h1Dogs5TeWOtcOF/vj75g==
X-CSE-MsgGUID: RCy8PT+NRRKz5S8J5E1DMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="265765738"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.222])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 00:02:12 -0700
Date: Tue, 1 Sep 2026 10:02:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Pandith N <pandith.n@intel.com>,
	Sia Jee Heng <jee.heng.sia@intel.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 4/4] dmaengine: dw-axi-dmac: Use bitfield helpers for
 registers
Message-ID: <apZ4cTZUHWruo828@ashevche-desk.local>
References: <20260901-dma-fix-v2-0-d7f0459ebb14@ultrarisc.com>
 <20260901-dma-fix-v2-4-d7f0459ebb14@ultrarisc.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-dma-fix-v2-4-d7f0459ebb14@ultrarisc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 01, 2026 at 02:16:07PM +0800, Jia Wang wrote:
> The driver open-codes several channel configuration and descriptor
> control bitfield writes with left shifts. Define masks for those fields
> and use FIELD_PREP() when programming the registers.
> 
> Valid field values keep the same encoding. FIELD_PREP() confines values
> to their respective fields, but does not validate handshake numbers
> supplied through DMA specifiers.

...

>  {
>  	u32 cfg_lo, cfg_hi;
>  
> -	cfg_lo = (config->dst_multblk_type << CH_CFG_L_DST_MULTBLK_TYPE_POS |
> -		  config->src_multblk_type << CH_CFG_L_SRC_MULTBLK_TYPE_POS);
> +	cfg_lo = FIELD_PREP(CH_CFG_L_DST_MULTBLK_TYPE, config->dst_multblk_type) |
> +		 FIELD_PREP(CH_CFG_L_SRC_MULTBLK_TYPE, config->src_multblk_type);

Personally I would duplicate this to make each branch self-contained.

>  	if (chan->chip->dw->hdata->reg_map_8_channels &&
>  	    !chan->chip->dw->hdata->use_cfg2) {
> -		cfg_hi = config->tt_fc << CH_CFG_H_TT_FC_POS |
> -			 config->hs_sel_src << CH_CFG_H_HS_SEL_SRC_POS |
> -			 config->hs_sel_dst << CH_CFG_H_HS_SEL_DST_POS |
> -			 config->src_per << CH_CFG_H_SRC_PER_POS |
> -			 config->dst_per << CH_CFG_H_DST_PER_POS |
> -			 config->prior << CH_CFG_H_PRIORITY_POS;

		cfg_lo = FIELD_PREP(CH_CFG_L_DST_MULTBLK_TYPE, config->dst_multblk_type) |
			 FIELD_PREP(CH_CFG_L_SRC_MULTBLK_TYPE, config->src_multblk_type);

> +		cfg_hi = FIELD_PREP(CH_CFG_H_TT_FC, config->tt_fc) |
> +			 FIELD_PREP(CH_CFG_H_HS_SEL_SRC, config->hs_sel_src) |
> +			 FIELD_PREP(CH_CFG_H_HS_SEL_DST, config->hs_sel_dst) |
> +			 FIELD_PREP(CH_CFG_H_SRC_PER, config->src_per) |
> +			 FIELD_PREP(CH_CFG_H_DST_PER, config->dst_per) |
> +			 FIELD_PREP(CH_CFG_H_PRIORITY, config->prior);
>  	} else {
> -		cfg_lo |= config->src_per << CH_CFG2_L_SRC_PER_POS |
> -			  config->dst_per << CH_CFG2_L_DST_PER_POS;
> -		cfg_hi = config->tt_fc << CH_CFG2_H_TT_FC_POS |
> -			 config->hs_sel_src << CH_CFG2_H_HS_SEL_SRC_POS |
> -			 config->hs_sel_dst << CH_CFG2_H_HS_SEL_DST_POS |
> -			 config->prior << CH_CFG2_H_PRIORITY_POS;
> +		cfg_lo |= FIELD_PREP(CH_CFG2_L_SRC_PER, config->src_per) |
> +			  FIELD_PREP(CH_CFG2_L_DST_PER, config->dst_per);

		cfg_lo = FIELD_PREP(CH_CFG_L_DST_MULTBLK_TYPE, config->dst_multblk_type) |
			 FIELD_PREP(CH_CFG_L_SRC_MULTBLK_TYPE, config->src_multblk_type) |
			 FIELD_PREP(CH_CFG2_L_SRC_PER, config->src_per) |
			 FIELD_PREP(CH_CFG2_L_DST_PER, config->dst_per);

> +		cfg_hi = FIELD_PREP(CH_CFG2_H_TT_FC, config->tt_fc) |
> +			 FIELD_PREP(CH_CFG2_H_HS_SEL_SRC, config->hs_sel_src) |
> +			 FIELD_PREP(CH_CFG2_H_HS_SEL_DST, config->hs_sel_dst) |
> +			 FIELD_PREP(CH_CFG2_H_PRIORITY, config->prior);
>  	}

...

> -		reg = (DWAXIDMAC_BURST_TRANS_LEN_4 << CH_CTL_L_DST_MSIZE_POS |
> -		       DWAXIDMAC_BURST_TRANS_LEN_4 << CH_CTL_L_SRC_MSIZE_POS |
> -		       xfer_width << CH_CTL_L_DST_WIDTH_POS |
> -		       xfer_width << CH_CTL_L_SRC_WIDTH_POS |
> -		       DWAXIDMAC_CH_CTL_L_INC << CH_CTL_L_DST_INC_POS |
> -		       DWAXIDMAC_CH_CTL_L_INC << CH_CTL_L_SRC_INC_POS);
> +		reg = (FIELD_PREP(CH_CTL_L_DST_MSIZE, DWAXIDMAC_BURST_TRANS_LEN_4) |
> +		       FIELD_PREP(CH_CTL_L_SRC_MSIZE, DWAXIDMAC_BURST_TRANS_LEN_4) |
> +		       FIELD_PREP(CH_CTL_L_DST_WIDTH, xfer_width) |
> +		       FIELD_PREP(CH_CTL_L_SRC_WIDTH, xfer_width) |
> +		       FIELD_PREP(CH_CTL_L_DST_INC, DWAXIDMAC_CH_CTL_L_INC) |
> +		       FIELD_PREP(CH_CTL_L_SRC_INC, DWAXIDMAC_CH_CTL_L_INC));

Unneeded parentheses.

-- 
With Best Regards,
Andy Shevchenko


