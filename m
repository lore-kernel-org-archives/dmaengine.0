Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC8F368950
	for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 14:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481416; cv=none; b=LrDmH8WJc9TmMLAEmU5nLuNFHxrgmiNoFNl4N86SIdGc1tk+ww8UTuqnkG3cNxnZyu3UqPMlHgspaKmzK0cKEA5AzkoX/96ygQiT3v0Ryistfy2rQkzONY7ni2KnWmqLcmOIQwkj8r8qPoVDJitAuBwft2xsz2LRlMmXf4U3fA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481416; c=relaxed/simple;
	bh=Y54jozGOvE5eFQGSw+HVi9XUX2fLMhLII1Ic1ZjRdMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryY8vAXWJkgi0MkHp4ixaJmV/1UwMCgpH6+Rg1kNc74x1XiUfFfBQERFOTw/QaXS/NzLt5tX1XR7+SdG2I6mJwmOSxVzfD53yKIR+TEBE2kVBV5q2ldn2OgJZmthamQ/jZonnmmsqE2Ok3k2sEeE/iOBgGp+v1oa4l8nOgV9bnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mzF2qPR9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mzF2qPR9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789481415; x=1821017415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y54jozGOvE5eFQGSw+HVi9XUX2fLMhLII1Ic1ZjRdMY=;
  b=mzF2qPR9zA44hMQywoicTJEP+r4zp4RjKAHbRoHI7OCWVNJ1JSE913GM
   rdR1aCOVml+xe9HLlt/Q6XtBO7nduvQOYFwZAusKgOQ3gZcejGVaWfqYM
   AQ2fjnVYCjz8qagxLyR2aavqQH76RoChNFVObchUWOwuq4tmsHa27OFpB
   9u+6FIsA2bbhizCNMe5w2sc0STdXFt4kvpED1rVsm9mQX3aBwTz59uhqD
   1KHIcO/02vsKoJ9dUSMJXW7lTwU7F7EjKn2CcZiEG5qZ9QcNLf3jkc+N4
   FfTpsQxvc8cE14z7ldx+3G/1zKXVDo+zcBzl9BRRObGqAW8V5oZVCiwd7
   g==;
X-CSE-ConnectionGUID: mfZcvVg7TlqZkMsDr4ywpw==
X-CSE-MsgGUID: sAby2iQXQ9iiM37LwLmrEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100442035"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100442035"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 07:10:14 -0700
X-CSE-ConnectionGUID: vPfG/nNuQXWOvhv0BHF0dg==
X-CSE-MsgGUID: tJObRpe5TXe8j390dUZAVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="268739173"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.57])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 07:10:12 -0700
Date: Tue, 15 Sep 2026 17:10:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v1 5/7] ASoC: fsl_asrc: Replace
 dma_request_slave_channel() by dma_request_chan()
Message-ID: <aqlRwt9gfFVielwa@ashevche-desk.local>
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
 <20260915100931.3593242-6-andriy.shevchenko@linux.intel.com>
 <20260915102513.1D7C01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915102513.1D7C01F00893@smtp.kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 15, 2026 at 10:25:12AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] sound: fsl_asrc: dma_release_channel() dereferences ERR_PTR in fsl_asrc_dma_hw_free

Same answer as per patch 2.

-- 
With Best Regards,
Andy Shevchenko


