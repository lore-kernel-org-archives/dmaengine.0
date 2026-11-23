Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427260;
	b=5tA0JdI2cDCRqO9Ms4wcV5C2urw2z8gCAHoS0KGG56vZLaERfm3bUe/XrGqZkH+JbRCF
	 pkggadr+bY+uKLPz/eBXlq1Q1nO0t4IUXiPdFJNeDqZ8ryzxErcDOh2A3eHXMgKsKbf6U
	 raBtjSHsytRai8a4C31LYOvIH798IpYpMUFezQN2nO9XITdhc1CzV1Dpsdn7KbyzZ2Ozc
	 koxRqoUN5TqCyBZoE53TA8ngYgVXbkSk86wq4VlsN8YbItGOuZf4525cofdgyl5jqbSLp
	 okSpYVT+fuNJ9QXkINJkio2blycu38Y2KE2xGk0fRbSrvkb5bARh1l+XJAGMjhoaggw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427260;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=zzWv4H1+U9iplq31+U5iHclnegDq86PpCpjZyuT2H2U=;
	b=knywwPjsF/AY39bgfUa0bhxfAPHZF2OZekcb5zXum8pLs5B0usr9GB2aFONe+G7/a9f5
	 TXh6kEJ4R8B43rlKj6xGDkvaUmJ5TD87AlIa9VSTGVqj6pydMXTQN1n9mkasFiq4aHOnn
	 H0qw/QgmM6oF9eGTk9i+tcqLXDMdu8q5RKLt+FmlHKm0FaJTCMsvAwPWiZCJsEmMJZrO/
	 VqokNK9V/Fw0FPAeRPvhX7mOcJiUE4z8UM+fsnLZQMx7gmjN3MafRjn+sAp+9kox1SWcb
	 lgNLMiAj5wfL21Eq7U3P7EUDCjTVbr0eGzmRqSwg3Bnarx5I64C4zzqd7FmigqixxTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=giDCRiB1;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E16606A31A;
	Mon, 23 Nov 2026 09:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E16606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=giDCRiB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795427260; x=1826963260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M3OZ4V+vGK+Zwqy8bv0Zk+Ks9b1GF359E3mPZrg3CSQ=;
  b=giDCRiB1VyE0IY2LYlf7/nq8aYgvZHwloCZemmRwNnMIiVue9rl3TELd
   9S3X4LatZFdOxT8A7LdoKZRzNfpP1bKhUUzgUzEax37QijzkdWSlR2O23
   E8jpOxDZZ7OzdhJEfqbp8563aKpJZpE6whU/97pX+/cvmo/5R0QJEB1re
   lk0Qt6SnkLeHhSliBlbA2AxP1jDrtA8mBfbL+t6vOly5crDdgyj4jbtKM
   uGon7vKsTVpvcwwQo2mnqj7+AoTqq+wqh+8EdMDkngdNAWbA536302Uzb
   lyh0l3rKWCRASKYGZDzlZ7dM+479FYi8fnCSP9nTtM76kY1HVAdCefaxj
   w==;
X-CSE-ConnectionGUID: kezZfpTdQqi1QGoT5kEGDg==
X-CSE-MsgGUID: 8CiJhY0dTySutWvF1MpwEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4208922"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4208922"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 01:47:40 -0800
X-CSE-ConnectionGUID: COa1wF7OTpqIvtihc3Z4pw==
X-CSE-MsgGUID: cjozTIkEQjSSWrYP/R0ZmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11562577"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 01:47:37 -0800
Date: Mon, 23 Nov 2026 11:47:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: shyckless@gmail.com
Cc: vkoul@kernel.org, ludovic.desroches@microchip.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank.Li@kernel.org, allen.lkml@gmail.com, dave.jiang@intel.com,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH 2/2] dmaengine: idma64: Kill the channel tasklets in
 remove again
Message-ID: <awQLtiL_OfuoMpAj@ashevche-desk.local>
References: <20261123-dma-chancnt-v1-0-f0eea0a4bb63@gmail.com>
 <20261123-dma-chancnt-v1-2-f0eea0a4bb63@gmail.com>
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
In-Reply-To: <20261123-dma-chancnt-v1-2-f0eea0a4bb63@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 23, 2026 at 12:53:07AM +0000, Suyuan Wang via B4 Relay wrote:
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

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> +	/* dma_async_device_unregister() decrements dma.chancnt to 0 */
> +	unsigned short nr_chan = idma64->dma.chancnt;

Which makes me think that we need to draw a line between private and
non-private members in the respective DMA data types. With this field
it's probably better to mark it with __private, or add another one
with that annotation and use it internally in DMAengine core.

-- 
With Best Regards,
Andy Shevchenko


