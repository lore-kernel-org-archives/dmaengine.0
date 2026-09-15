Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4105C3A9DA5
	for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 14:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481811; cv=none; b=LZnXWNF9vfyJOy2AeUebt9Zv9XaCQtXvG/wFqzTlmmAitEeIeHSwIMmkXSCnm9Pp2eLv3yOEFV8ldqQTSsDyGIScqw5zckeR0kKr+mBGaRbD4g/BlDzKQC12qMygJhetZ64WvpNYqWqmoCRWQpKfN1OIGsj1g9d1GdzXuZwataI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481811; c=relaxed/simple;
	bh=bI2gyMh9G/3zUr2TKERJhKe5txT8YKImvCKV2Iy0e+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7GdnrQTxXFDWeqjhtKaTvWK0LXecELaelRtz1GVhpgiY8X5jp9toOEDzBJV34vl1+KylsT2G5fSbMza3/sepilO8HNudeMnUENGDWZAZrX1eCxSbButbZARDHicl8PjOzW0S9/IhdlggZSBNI0Ts763P0Ij/DKYpsZ1BZU7i6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MavEsIwO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MavEsIwO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789481809; x=1821017809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bI2gyMh9G/3zUr2TKERJhKe5txT8YKImvCKV2Iy0e+Y=;
  b=MavEsIwOD7oQ4yN3n03Yuxd71Bp7tkJ0h/xqAkqcYSkAouVIvjKxl2As
   9wXaDnFGl/bUwzUS2bvLVtt5OuPoU/Q9iiqf/vJk2Cymrv2FHVIKNvT2U
   BNOxDVFmeF3vd2ITO8TdDQJq38pcB+IidLAUzYhtRg87EAdNAKjLsHS4O
   x35/w4DpD4Q1qu6o6JDDKqRA6EJ0G864Q1hnCYTx40kQzWZV7tW4BTX36
   TeUtvy/I2+4kSwvJgHU5Jr6TuEnHrvWDvAQFHQg8zl98nmcyef3yHcvMz
   hn6sP//ST0+n2LjOm80/LQTkTrNQ1/6Fy/KIn6QbIhY5UbkIRDy990dIr
   g==;
X-CSE-ConnectionGUID: 6+kE+2qbRziDK8i5umba8w==
X-CSE-MsgGUID: PdVDe90KTge6IO8lqDVy4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89689256"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89689256"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 07:16:49 -0700
X-CSE-ConnectionGUID: DYeU3tcnScevhiQO9Q6e6Q==
X-CSE-MsgGUID: NekwTE0IRoiCcCW9eQ2Lqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="274974742"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.57])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 07:16:35 -0700
Date: Tue, 15 Sep 2026 17:16:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH v1 6/7] gpib: fmh_gpib: Replace
 dma_request_slave_channel() by dma_request_chan()
Message-ID: <aqlTQZDECmYVSjmB@ashevche-desk.local>
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
 <20260915100931.3593242-7-andriy.shevchenko@linux.intel.com>
 <20260915102144.B60EC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915102144.B60EC1F000FF@smtp.kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 15, 2026 at 10:21:44AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] gpib: fmh_gpib: unhandled ERR_PTR from dma_request_chan() causes crash in fmh_gpib_detach()

Same as per patch 2.

-- 
With Best Regards,
Andy Shevchenko


