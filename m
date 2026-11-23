Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427345;
	b=4AxuxL0HKSHp3t3xgWJ0zISsEXO8L16L/l3dSn59/hBBpBYP5qoM8c1bJyNXxABhKBdJ
	 EOgR4o5UZHgeZ0Bf9NdBZQ4tYAycSN3Iun2rchxiU6cwr1LMjecWt532/T5AcoDyC+hI6
	 0YpBCGIBnP6bFAM1cAeVbiGbAaUz5BOOaKofVHt4ySZitH9ilEhu/diahmEvhE1UyYKtv
	 nhmMepRU5pgNtC4Kp93jgq0SKwnI+o6aDkHhPoOK8bbulz6urh+NuTwtsQ4OVUtxOu1Jv
	 C5HMzLZpkbVIyEWpe/hHiFmktWB+GpntU4FSseZQvJOd4k8scrhUSqg5OfS29abNlbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427345;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=FUV/UoOBr/J6VY5krtiDaidQIeLgBTXxPj1B21P7IyY=;
	b=2Jx+ngfdH3kqXq1oAtrjlb8PdVqJGRdU/NndJRiatn52JlghlwNX4lgWTzQww5nO7S5J
	 HHLE9MHX+ZnQD+6aaVCLzNbF41sIsZTLHsQEKSaJT3D8uAKLQVritJ/RHe8TFyqkTbqrb
	 gT0jOnBTdnXGsguoPbvQr9F9xlKoXrppxkJCmqxaGVC9pNNmq+bKTTmvGvwMI+LDFav6W
	 BFFRL7GvqeYbv/WRya/FYsRA4AKYROmI4ywLuBodQKtIV+d45cmlQfGOiqE+7hzYIHai1
	 2GKTwnRCBhQUzzOQ3Fp0beSrOmsbDvSqkhDivkRCEDcZ8FitJwB7WH+bmr8h4kdKyTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FrA9Wssl;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9338D606A31A;
	Mon, 23 Nov 2026 09:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9338D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FrA9Wssl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795427345; x=1826963345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mKeY8d2xWdIsSGaHzmL0LiD0HoPYA5papgqXVJCBlWI=;
  b=FrA9Wssla9ukfgCDmPjFFjsuMc55eNP1UEdT1Y2Jtjahe7U4UBBWQ66B
   S6/mUG8J/IAjPbVMAsCVrYHdcZ7j7JyN+qj7UiU0EyJBCuVVy2diLhIaT
   QQL2drCToljoDLOIO1W/IhkX7MdsgaDkmx7DOtJrW/81TajCtfYicgbbJ
   F2TQKj1daO6eJt793BJcmyWJisIF02xHxOEDfygKG/EmnrI7Z++2vZ2j5
   z8/Ul1PrgOymOMErU4lQqPWofbTvGIyRfdesv+pigbjyJLtCBJT/v+Z24
   NEScVZY6O/aqeGY95Q/GlpSyKhvTbflVuJ0I7B1QffuwM7+wkdPDVYfe7
   A==;
X-CSE-ConnectionGUID: qMSGyxuiQ6aSrWSyRK3BNg==
X-CSE-MsgGUID: xcaDzy08SlWBUZntmdCfOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4121839"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4121839"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 01:49:04 -0800
X-CSE-ConnectionGUID: 7sJ0TC2JQa2OxIi6kqHNlw==
X-CSE-MsgGUID: D7r8MFobSSCJb+ypfE4Rsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="13240187"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 01:49:02 -0800
Date: Mon, 23 Nov 2026 11:48:59 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: shyckless@gmail.com
Cc: ludovic.desroches@microchip.com, vkoul@kernel.org, Frank.Li@kernel.org,
	dave.jiang@intel.com, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, allen.lkml@gmail.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] dmaengine: idma64: Kill the channel tasklets in
 remove again
Message-ID: <awQMCxhy6BurLowU@ashevche-desk.local>
References: <20261123-dma-chancnt-v2-0-241b1672883e@gmail.com>
 <20261123-dma-chancnt-v2-2-241b1672883e@gmail.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-dma-chancnt-v2-2-241b1672883e@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 23, 2026 at 01:17:38AM +0000, Suyuan Wang via B4 Relay wrote:
> 
> idma64_remove() frees the IRQ and then kills the channel tasklets, as
> the comment there says, so that no tasklet scheduled by the interrupt
> runs after removal:
> 
> 	for (i = 0; i < idma64->dma.chancnt; i++) {
> 		...
> 		tasklet_kill(&idma64c->vchan.task);
> 	}
> 
> Since commit e81274cd6b52 ("dmaengine: add support to dynamic
> register/unregister of channels"), dma_async_device_unregister()
> unregisters each channel and decrements dma.chancnt for it, so the
> count is 0 when this loop runs and no tasklet is killed. A tasklet
> scheduled by an interrupt can then run after the devm-allocated idma64
> and its channels have been freed.
> 
> Read the channel count before unregistering the device.
> 
> Found with a static analysis tool and checked by hand.

You have to wait a sensible time before resubmission.
Look at the v1 and act accordingly.

-- 
With Best Regards,
Andy Shevchenko


