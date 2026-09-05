Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7053D5673;
	Sat,  5 Sep 2026 08:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788595951; cv=none; b=grkpx4V7nt6EbrnbUm6CRdngjguo0vXFi/OgkPmOR8K+xxR27F4Ba7URJ9k29j5BysRW0qeCY/1IASc4vMQkMBvyMtFf680g822cLqZ8LgcqZV7gscyOj3aXfO1vGWGTqbIZoadHoe4m1k1DXOzAiVZR6YgR70au/gmCpPe6ZpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788595951; c=relaxed/simple;
	bh=twGdAWZBZ05fb4+QLfejbwpApFgNt4hwjf7CHvu6qnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iswq06ExHVtxYwu6jYrHibXFvpdYzMaRH2Y7HbfyC2e1J3n6jHXaVvia6f8Yh/ElGZWSLDjmq4+BeWQV9s7YSR5/z+sd5mWN6VVkd+LV6YT3ISkrdrRPkld/luaz6Xqw2CdweiZsZpk0w0qi0Eyi1kWg1YVdb7MjMJilVwtUOOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AbnplSVq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AbnplSVq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788595942; x=1820131942;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=twGdAWZBZ05fb4+QLfejbwpApFgNt4hwjf7CHvu6qnY=;
  b=AbnplSVqQ689m501/qJXshCtuq0i+eidVki+x2vGJF3VEroHGSldazYu
   RE58XCM6xzi+HbXKz5ysODSxobv6NZbt6PPJfW0K7pipvyvR8HAWeAJ22
   G8747V90OKFWCJw+vvpE1qKvC2my21wdBf+yWU3ZI7gWGZMGIARWPpFBo
   Y3yb97dEMxqlh4UAsQL++E6Gvkq9TGeGGCvGcHp8veI/4lBwEoQErE1Yl
   gXvsCaD7FjaTIN9ZGeddWYfw2olJ5lyf3OkJ+pDU1aFPvXVSXWmFzZBfX
   wJE/yVffrvVe3lcHhIxDcVeSd9GoPVD5dlASLqmFRRlok8HHM3SmlICQZ
   A==;
X-CSE-ConnectionGUID: 0daAvsPXR6qt9dw76SwmIQ==
X-CSE-MsgGUID: GvtCCwVgT0OicypuYPmFgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88963854"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="88963854"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 01:12:19 -0700
X-CSE-ConnectionGUID: d2AoCfycRCqiwUVlTWIAKA==
X-CSE-MsgGUID: u75Jy/s6RFWx2r+1s2JyTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="274067004"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.105])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 01:12:16 -0700
Date: Sat, 5 Sep 2026 11:12:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Viresh Kumar <vireshk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/4] dma: use designated initializers for acpi_device_id
Message-ID: <apvO3uWUEYX-I2pp@ashevche-desk.local>
References: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Sep 04, 2026 at 03:10:39PM +0100, Pawel Zalewski wrote:
> This series is converting lists that contain the acpi_device_id
> struct, which is defined in the include/linux/device-id/acpi.h
> to make use of named initializers (which they do not use currently).
> This work is part of the on going effort in the kernel associated
> with device-ids [1]
> 
> The plan is to convert acpi_device_id::driver_data to have an anonymous
> union, similarly to what was introduced for PCI and I2C device ID tables.
> The goal is to increase type-safety (as most of the existing casts are gone),
> to improve readability and to make use intent a bit more clear:
> 
> ```
> union {
> 	kernel_ulong_t driver_data;
> 	const void *driver_data_ptr;
> }
> ```
> 
> But for that to work all lists containing the structs need to use named
> initializers first to avoid triggering -Wmissing-braces. I already have
> patches that implement this and touching a lot of kernel subsystmes that
> use the acpi_device_id struct and that list keeps on growing. Therefore,
> I have decided to split the series per every subsystem into:
> - pre-clean-ups that convert the lists to use named initializers (this series)
> - actual implementations that make some of the modules use the new driver_data_ptr
> 
> That way the task can be fragmented into manageable and independent
> chunks of work and makes this effort easier to review.
> 
> Tested builds on x86-64 and a64 in Yocto using 7.3-rc1.

All good to me (with what Frank suggested)
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> [1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/

-- 
With Best Regards,
Andy Shevchenko


