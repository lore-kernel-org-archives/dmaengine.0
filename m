Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273663403E1;
	Wed, 12 Aug 2026 07:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786519450; cv=none; b=F1h7aE0x8JJhInCyw0oCh1zLfb5SAOz2ge+Q83k6JWvEGX7oSgqD+fnlPVgdevVBZhxpmlRtbkDLsaT/XIX6M2lthHQABRy7spRiitNzbpORzLylv+svHmu4SPppBiK+NLgXGXd7uFFk3Ucua1igndpYfb4cenRFulmyONa1wv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786519450; c=relaxed/simple;
	bh=hvklKzrXYrQ52MrsuKWJZ7yff1f3FuCoojOnMb9Lrlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jAWjrv08EHOfI83Au19cXJKf1kk4sblZ1HW9uy2Yd2OJWVlIDkd//p6sqf2gJeCf5BwAprZrESF2HAY5Ldw3iEYsFA0HdSi7gJg3lWFQUpYbMv3IRi5eE3hXSLEEUpKrlHFeL7uepftDV1GMMhiRGSof7Xta96YO3PvQ+5r4Z9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DEpJx80v; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DEpJx80v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786519448; x=1818055448;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hvklKzrXYrQ52MrsuKWJZ7yff1f3FuCoojOnMb9Lrlk=;
  b=DEpJx80vB+qSxskBFM5CjjzoluzNkB2URK6eRetXqOSJ4Y0iMfjoU/wQ
   D6s+2s9Cg+W0l473P8d3sH2BmBcDehFAocraaf7XVYZyWv4SlL4hw4Qiw
   xd83LiGb/BLFipCc90x9zoKU8igEs3W/zUzvk0mWlD2LKZn6nmuzvt+Rt
   fDT5NmP693QnuZsaJ8e6e7hPI8QdPMGXwYgwbVMm+qT3w+aerg/boqUnO
   WcHr0vvrsOSY8yD+TTwZHKG2k5Tv7T4eSbS55ilk6Lx0MKzMloNDxkymx
   /FrXEMmgTPCKAb+S3WDmfhS3q386dv/fnfhHrbZ/jxNQq4tI4SLqY30/I
   A==;
X-CSE-ConnectionGUID: I5sOOfUtS3S5Y+fTsFn/Xw==
X-CSE-MsgGUID: 0QoC2W5AQ1+API1c+0kxQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="90875867"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="90875867"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:24:07 -0700
X-CSE-ConnectionGUID: XnZFETg6S4GBvdzkBdNynw==
X-CSE-MsgGUID: ByHVJu9dSxStM/bpisNqYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="264151433"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.92])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:24:05 -0700
Date: Wed, 12 Aug 2026 10:24:02 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Allen <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 00/34] dmaengine: migrate channel tasklets to WQ_BH
Message-ID: <anwfkhYop3TlDC6h@ashevche-desk.local>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <anr-hAQN5-jGoRp6@ashevche-desk.local>
 <CAOMdWSJyTovoEvokaHeOZEu2Z7UVhF8X2_uetcKn0_FySgtn9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMdWSJyTovoEvokaHeOZEu2Z7UVhF8X2_uetcKn0_FySgtn9A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Aug 11, 2026 at 01:44:49PM -0700, Allen wrote:

...

> > > The remaining patches convert driver-owned channel completion tasklets.
> > > Tasklets used for controller-level processing, recovery, or other
> > > non-client-callback work are deliberately left alone because the
> > > appropriate replacement may differ by driver.
> >
> > Right, I would actually expect that virt-dma (and others will follow the
> > example) will switch to threaded IRQ instead of tasklets.
> 
>   I had not considered a full virt-dma conversion for this series. Looking
>   at the driver, that would also involve its descriptor pool, queue and
>   active lists, software LLP and cyclic handling, and residue reporting. It
>   would therefore be a substantially broader change than moving callback
>   delivery to the common channel BH.
> 
>   My intention here was to leave the existing descriptor lifecycle and
>   scheduling unchanged and only move callback invocation out of the
>   controller tasklet. I think converting the driver to virt-dma would be
>   better handled as a separate series with hardware testing.
> 
>   If you would prefer not to add the completed list ahead of such a
>   conversion, I can drop this patch from the current series and leave the
>   DW driver unchanged for now.

I think this is unneeded churn for DW DMA driver. It requires a much bigger
refactoring and cleaning up.

-- 
With Best Regards,
Andy Shevchenko


