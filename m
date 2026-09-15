Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB4E2FE56A
	for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 14:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481381; cv=none; b=tlBr7VYwm2DdVWSJIrtYuRLRK5zzt57Q/bTO9QxNfRxk/gLtH+xlVKd8lUj+SF01FzuewXAK+xdr90mhtMybemfgaV3MADy6Zxt6B4LUo1VuF2Gp/k1kl69hxC4z9qfK2WZ3wCYuy4kVyw3bdwRRChSArPRSG8k/BIcCRRGmA2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481381; c=relaxed/simple;
	bh=uIRY0ZWa8K+3bz6ni2xKCR2p4G+lNf8KI/MZOrm9raM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T74yifO9+fElcU82yq/A+VU5Q3aEu6tVS/T3aSZpV8/3QbjpZMH0uysojxN5Pf3sayInbxgvK+f57OGkpRaSeaqqt1y9uWLEkp7L8CPbgb6et1reFCnfJBd0xSlNUqAQOGuC6BhoXwtezBzEBjD3iRBQHVol1bAz9fUp0KlugSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PC1FKBgg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PC1FKBgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789481380; x=1821017380;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uIRY0ZWa8K+3bz6ni2xKCR2p4G+lNf8KI/MZOrm9raM=;
  b=PC1FKBggd85HvXb0Pr6Hi7HgijpX3IZ4kLIhpEWap4T8qxQWcA1ZrqvX
   tAtvIL7vfKlqg76wskEbzpOPHP0moW9FQCvlQDVGJJh4cvl5Oc4BzKOXb
   bjQd0EiJQ7dVOtYdRn8QgW1HP5yFLwQpOQVzZ3kBa2PP76KJLMmO09k4H
   xf/OGHXCduBWEvNH7F5F5wVOjgtJDgbu1DCuwQ0ZboTRDb+K0otZxTK8O
   Inio0HATDU6w1HRqOandPSVv5nKavE85XG5VK3uOBbPMiHBAK2qx0bCmy
   lKdqRDc+sT27XAbpO76OTTC4+D/2zU2DiYyucz6tGaqrFqIY5c2BellFd
   g==;
X-CSE-ConnectionGUID: 8h99MP2qQECDM5JlkOoG2g==
X-CSE-MsgGUID: 1D3EmEprTUeAcdJH5dI4yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93669382"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93669382"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 07:09:39 -0700
X-CSE-ConnectionGUID: VGSpCWDhSJelZopvyLdHQg==
X-CSE-MsgGUID: ChXHPza8Sney6t8xUx41TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269746190"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.57])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 07:09:37 -0700
Date: Tue, 15 Sep 2026 17:09:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v1 4/7] ASoC: pxa: Replace dma_request_slave_channel() by
 dma_request_chan()
Message-ID: <aqlRnynN2Z9somFz@ashevche-desk.local>
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
 <20260915100931.3593242-5-andriy.shevchenko@linux.intel.com>
 <20260915102128.F10841F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915102128.F10841F00893@smtp.kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 15, 2026 at 10:21:28AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] UAPI: -EPROBE_DEFER leaked to user-space open() via pxa2xx_pcm_open()
> --

[ ... ]

> > -	return snd_dmaengine_pcm_open(
> > -		substream, dma_request_slave_channel(snd_soc_rtd_to_cpu(rtd, 0)->dev,
> > -						     dma_params->chan_name));
> > +	chan = dma_request_chan(snd_soc_rtd_to_cpu(rtd, 0)->dev, dma_params->chan_name);
> > +	ret = PTR_ERR_OR_ZERO(chan);
> > +	if (ret)
> > +		return ret;
> 
> [Severity: Medium]
> Will this leak the kernel-internal -EPROBE_DEFER error code to user-space?
> 
> If dma_request_chan() fails because the DMA driver isn't loaded yet, it
> can return -EPROBE_DEFER.  Since pxa2xx_pcm_open() returns this directly, 
> the -EPROBE_DEFER error code would be passed up to snd_pcm_open() and 
> returned to the user-space application calling open() on the ALSA device.
> 
> In the old code, dma_request_slave_channel() returned NULL on failure,
> and snd_dmaengine_pcm_open() mapped that NULL to -ENXIO. Could we map the
> error here to a standard user-facing error like -ENXIO when 
> dma_request_chan() fails?

Sure, makes sense.

> > +	return snd_dmaengine_pcm_open(substream, chan);

-- 
With Best Regards,
Andy Shevchenko


