Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2535544A3E8;
	Tue, 11 Aug 2026 13:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455609; cv=none; b=dsfnse9WrCDrr9Jgle8wn70cxTYz8jnPnlUgYJgELSqchVug7L9VVOP0id7MZy2uOGwmfV+IeOXGsSa5L6oaWSv96AUcFz0O/I3P6PIA+9cxHdqy7TdHRMxZbdjGjVKckZ06FWrr5PZY0E9UdIUuFDSJ0seuekP5IKd10joIj/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455609; c=relaxed/simple;
	bh=RV+x2uthJEw4exa2tz6NdfdqyDlbeVZT1Zy0gak9NWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VzYe7iOMYlwJBvHmOpxRCRWVcWQ+azS/ZCC21sPfqN8qaOs/K3l67sOLq53wGrUX1HZDHynHc/t/jyipIIENDEWgyzvHqPHev0udymC07fKdzSRwt3evTP7HDtxWSXtypxPPl0zb6w9gbPN4pygK4B5FMR+uZ4oSbV07SfYEOsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CgPgcW+g; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CgPgcW+g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786455594; x=1817991594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RV+x2uthJEw4exa2tz6NdfdqyDlbeVZT1Zy0gak9NWQ=;
  b=CgPgcW+g7mW7dnb7Wqkle55Mdb/kNCnbOVtuKHaqgQ9LCtlnzpkiSQJq
   hHOolqQXfgzOf5EkpEKBVcBR1TJOQopF1LAW16zruA7iiA8lCEHcfbg9V
   eZxUkNLPyYpyoVOfI3dkhK1l1zyxMVgsi2reOh9SlHz8L06WMHZZgKX5X
   qvArj/3sGUs1WlldTzyiiBenVNSRAnQNi0aJdUxydMMVq3LXsYDM/o86X
   s/jxxNAoJ6Nuie+UkY3LlvZeozeXoVfL95DxpfBkCcZVmbZmBxz+s97qa
   ElP5tXZ/TdTia4cJ4UalfX22z4PCcFPO9UoqOw8yScP/KGUFJmPObJGse
   Q==;
X-CSE-ConnectionGUID: lrfKZEoDRa6Ktg1LfI8Wwg==
X-CSE-MsgGUID: xZL4Q/BcRIWQTPAqQCDBmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="109776111"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="109776111"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 06:39:49 -0700
X-CSE-ConnectionGUID: KJjLedjNSU+sbZhklezrqQ==
X-CSE-MsgGUID: g2Aq/07AQuieUSW/dETReg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="263385501"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 06:39:47 -0700
Date: Tue, 11 Aug 2026 16:39:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 2/2] dmaengine: Consistently define pci_device_ids
 using named initializers
Message-ID: <ansmIBcCdXlkOS4W@ashevche-desk.local>
References: <cover.1784547700.git.u.kleine-koenig@baylibre.com>
 <148354eaf657c30428c678baaef07b2ff9888c00.1784547700.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <148354eaf657c30428c678baaef07b2ff9888c00.1784547700.git.u.kleine-koenig@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 20, 2026 at 02:03:49PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> The .driver_data member of the various struct pci_device_id arrays were
> initialized by list expressions. This isn't easily readable if you're
> not into PCI. Using named initializers is more explicit and thus easier
> to parse.
> 
> While touching these arrays, unify the list terminators to be just an
> empty struct with no trailing comma.
> 
> This change doesn't introduce changes to the compiled pci_device_id
> arrays, which was confirmed using x86 and arm64 builds.

...

> +++ b/drivers/dma/dw-edma/dw-edma-pcie.c

>  static const struct pci_device_id dw_edma_pcie_id_table[] = {
>  	{ PCI_DEVICE_DATA(SYNOPSYS, EDDA, &snps_edda_data) },
>  	{ PCI_VDEVICE(XILINX, PCI_DEVICE_ID_XILINX_B054),
> -	  (kernel_ulong_t)&xilinx_mdb_data },
> +	  .driver_data = (kernel_ulong_t)&xilinx_mdb_data },
>  	{ PCI_VDEVICE(XILINX, PCI_DEVICE_ID_XILINX_B00F),
>  	  .driver_data = (kernel_ulong_t)&xilinx_cpm6_dma_data },

It's inconsistent and can use PCI_DEVICE_DATA() in all cases.

>  	{ }

...

> +++ b/drivers/dma/pch_dma.c

>  static const struct pci_device_id pch_dma_id_table[] = {
> -	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_EG20T_PCH_DMA_8CH), 8 },
> -	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_EG20T_PCH_DMA_4CH), 4 },
> -	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7213_DMA1_8CH), 8}, /* UART Video */
> -	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7213_DMA2_8CH), 8}, /* PCMIF SPI */
> -	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7213_DMA3_4CH), 4}, /* FPGA */
> -	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7213_DMA4_12CH), 12}, /* I2S */
> -	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7223_DMA1_4CH), 4}, /* UART */
> -	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7223_DMA2_4CH), 4}, /* Video SPI */
> -	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7223_DMA3_4CH), 4}, /* Security */
> -	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7223_DMA4_4CH), 4}, /* FPGA */
> -	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7831_DMA1_8CH), 8}, /* UART */
> -	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7831_DMA2_4CH), 4}, /* SPI */
> -	{ 0, },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_EG20T_PCH_DMA_8CH), .driver_data = 8 },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_EG20T_PCH_DMA_4CH), .driver_data = 4 },
> +	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7213_DMA1_8CH), .driver_data = 8 },		/* UART Video */
> +	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7213_DMA2_8CH), .driver_data = 8 },		/* PCMIF SPI */
> +	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7213_DMA3_4CH), .driver_data = 4 },		/* FPGA */
> +	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7213_DMA4_12CH), .driver_data = 12 },	/* I2S */
> +	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7223_DMA1_4CH), .driver_data = 4 },		/* UART */
> +	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7223_DMA2_4CH), .driver_data = 4 },		/* Video SPI */
> +	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7223_DMA3_4CH), .driver_data = 4 },		/* Security */
> +	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7223_DMA4_4CH), .driver_data = 4 },		/* FPGA */
> +	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7831_DMA1_8CH), .driver_data = 8 },		/* UART */
> +	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7831_DMA2_4CH), .driver_data = 4 },		/* SPI */
> +	{ }
>  };

And I'm still strongly against this churn, which also makes lines too long.

PCI_DEVICE_DATA() makes it condensed and moves the burden of any future
conversions to the macro without touching users again.

-- 
With Best Regards,
Andy Shevchenko


