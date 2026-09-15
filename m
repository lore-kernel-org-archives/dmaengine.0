Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B0D34C9A3
	for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 14:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481093; cv=none; b=KNxsTIMFXRgb7vmhcdFmrt+qdwiwuxbqKRqg+pxTez7hEpcpLC0Fk/ofmpsGXBCCx/UJT7adGMh2NoReUf9q1PT43biHaOu2eEivrV+VDUIZuMQg/tZ87ASUG8ig0Sgweo6qlxuTCCSGIDMJ1dNfUM9bQIjImbz/s8B2Ps8XZ7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481093; c=relaxed/simple;
	bh=L0qterpQYn/VPPgDdYJ3Awgh18qSJV6Vv76uWZ0gIi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CyUdZs9rg1ryTu2n2A2urvHErKqaVLSsnhMI8pNCox8WADezG7DfTCNc/uJwCljZljRgLPeq14t/qpKTY+Zc4ijtZBmR1RQzdeMajGJlPH5j530qG7gtUb0PBsnz9CjAr2aF9kjHJXyozzwXyt95KBYsxAM3fuVVMtweQzVnBV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gSExv5Pf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gSExv5Pf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789481090; x=1821017090;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L0qterpQYn/VPPgDdYJ3Awgh18qSJV6Vv76uWZ0gIi4=;
  b=gSExv5PfNG+lkLqNAWj5u5yCMNJyZradNq/v2SKHzu/mopXwfXQAnc98
   Kw/LNfnQwVXO1I6jUd3xx2chxYecrZrvdNIZYphEWWZENJcgrIBmFwjAa
   wAPDXHVZim+tz10QnG4dhyQ9J1JeZqpgtNU5TAdQG7Y73Ek/+3TK5poKN
   Ol0FS7/Akf4jYPZiOCehQImtoDocqwT27WQeBjTK2Zsx6iBxwwPtgJ+jm
   NaVVbqtstoCmy+8IlNzILhkDiEjL+dpLHekSFQhq9abXdW033qruS1xgp
   kHI6gxP1r/FK7+SNhGisLzcnvslRlQktUSZnuc8frXAB11LrgcoxrV6HH
   A==;
X-CSE-ConnectionGUID: +XtO3+3XTJWwqiZ6sUlUzw==
X-CSE-MsgGUID: LDpNiMndTvqpuaxtENKdhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93668692"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93668692"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 07:04:48 -0700
X-CSE-ConnectionGUID: osL1LnVbS/C2GcEUDY4/rQ==
X-CSE-MsgGUID: DGV/tngsTWmBSbArdt8vfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="266804253"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.57])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 07:04:47 -0700
Date: Tue, 15 Sep 2026 17:04:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH v1 2/7] ASoC: sprd: Replace dma_request_slave_channel()
 by dma_request_chan()
Message-ID: <aqlQfDz1YFN_C0cu@ashevche-desk.local>
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
 <20260915100931.3593242-3-andriy.shevchenko@linux.intel.com>
 <20260915101925.1CF461F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915101925.1CF461F000FF@smtp.kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 15, 2026 at 10:19:24AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ASoC: sprd: crash in dma_release_channel() due to ERR_PTR leak
> --
> 
> commit 5e4c398ebe4c03b68c30e555198977e4ad4905e4
> Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> ASoC: sprd: Replace dma_request_slave_channel() by dma_request_chan()
> 
> This commit replaces deprecated dma_request_slave_channel calls with
> dma_request_chan. It updates the error checking from NULL checks to
> IS_ERR.
> 
> > diff --git a/sound/soc/sprd/sprd-pcm-compress.c b/sound/soc/sprd/sprd-pcm-compress.c
> > index e5249924b54d9..5613c25fffd73 100644
> > --- a/sound/soc/sprd/sprd-pcm-compress.c
> > +++ b/sound/soc/sprd/sprd-pcm-compress.c
> > @@ -153,11 +153,10 @@ static int sprd_platform_compr_dma_config(struct snd_soc_component *component,
> >  		return -EINVAL;
> >  	}
> >  
> > -	dma->chan = dma_request_slave_channel(dev,
> > -					      dma_params->chan_name[channel]);
> > -	if (!dma->chan) {
> > +	dma->chan = dma_request_chan(dev, dma_params->chan_name[channel]);
> > +	if (IS_ERR(dma->chan)) {
> 
> [Severity: High]
> If dma_request_chan fails, does this leak the error pointer into the compress
> stream's persistent dma array?
> 
> When the file descriptor is closed or cleaned up, the free path in
> sprd_platform_compr_free() will attempt to release the channel:
> 
>     if (dma->chan) {
>         dma_release_channel(dma->chan);
>         dma->chan = NULL;
>     }
> 
> Since the error path doesn't clear the error pointer from dma->chan, the if
> check evaluates to true. Will dma_release_channel() then dereference the error
> pointer and crash?

> >  		dev_err(dev, "failed to request dma channel\n");
> > -		return -ENODEV;
> > +		return PTR_ERR(dma->chan);
> >  	}

Granted, I will add an amendment to dma_release_chan() to be NULL and ERR_PTR
aware.

-- 
With Best Regards,
Andy Shevchenko


