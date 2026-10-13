Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F34F52E050;
	Tue, 13 Oct 2026 20:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924798; cv=none; b=aVB+fosJB2DuugKq1mnN8vm2dLEL4MqH2YMQIIm1jGGv9pERSA1Hj937/rmQbnG8DWd5FyeLhXL9ydY2AoCj5Ft3EkGp7M1X/FO+pdT62E35QdEH5jZnvp3X97TY1cpJCEpLvhqK1/wKAdzzWlbhtV6N07tWccOMUUS32eOmLWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924798; c=relaxed/simple;
	bh=UVNWOJGTtBiwJFwqiBZnC2r1Rg0UYdAGT2BPsnvMjsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WP1KvJrTEDQVS8jeyLfjC8UfynZlggjxzbfD0RjIpVFKbRmcibyYYR6vrq2oG2XrfIHfatS7IUwELIUBb8QYbeDnSYmqyQVqP+NQTYDGtofrbIRq20fTTeGsb5mFzj5gso2pW2Fx4HrNaXN6Go0JWX0Ilo6fkwG7c9WqQWqI37Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYZtmJ3J; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYZtmJ3J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791924797; x=1823460797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UVNWOJGTtBiwJFwqiBZnC2r1Rg0UYdAGT2BPsnvMjsU=;
  b=PYZtmJ3JepwvJe8VDnpcom9dbdftwjzt5l1vAI35nh8qps5NuPf4T4t7
   dmbCQJYdgkM5MecYh2C3210h3uCq5PGJa8nQn3kqiNlgnwSW1mUkRmDUm
   P0PA92WhGyVIrNv6Qj9JnyslqCy+Ul23SycGHH+z9AMcp3Up2HaD1U7u/
   m+oTXPcSZlyRqGf/QFI/Kx4LGbmp+gTQVv6jb1oW53Pb0skHV9nwPpqVm
   Vurg07YCs2Q8yVhT0bUDP8V91hfT6LcH/Y3J+vUbBDT49TZzAlSM4ydki
   zCwaFBTz17HQgRyW+o+DvbSzkj7Y+S9HIAV0MM/pnDREe/Er5W23KlolQ
   A==;
X-CSE-ConnectionGUID: JDwESw4UQfaNlmgbhz4EDA==
X-CSE-MsgGUID: gWIbZSWLTOKyv6hC8T9jBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="555576"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="555576"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 13:53:17 -0700
X-CSE-ConnectionGUID: 8dyQYGQFTxm45ly37VT2nA==
X-CSE-MsgGUID: YY3Sm9JmTbOinpYzN0c9cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3017963"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 13:53:15 -0700
Date: Tue, 13 Oct 2026 23:53:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank.Li@oss.nxp.com
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] dmaengine: shdma: move shdma_chan and shdma_desc
 structs to private header
Message-ID: <as6aN76S6O2M39_l@ashevche-desk.local>
References: <20261013203433.337893-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013203433.337893-1-Frank.Li@oss.nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 13, 2026 at 04:34:23PM -0400, Frank.Li@oss.nxp.com wrote:

> Move struct shdma_chan and struct shdma_desc from the public header
> include/linux/shdma-base.h into the driver-private header
> drivers/dma/sh/shdma.h. These structs are only used internally by the
> shdma driver and do not need to be exposed to external users.
> 
> Prepare to make struct dma_async_tx_descriptor private.

This kind of changes I like!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


