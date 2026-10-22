Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792688282;
	b=ZKO67a/MHOxHf24paBW9rUTxHTxa6f9S3semyLhFFO2td1IsRdBbYlegu5UxnB33i9cM
	 IoflL4HXdCQMc2eCuwiWkCG57uRwGKAZVM6tPVesyVsfBxuqMKFVFo3cXOmE/nd2DSc/A
	 6CI6VEgXo8fOW7LFBTyUzAr0mowcCmXyy4qjgH/ftT/u/WubxlHaTHVOJinyvYCsmPIF3
	 UfdSUNmRIqfr3I1RFgm9C0DJZc39CufxFaajZigwHch1P/1WWmuU2jJfHl1StxlWlIkgi
	 gvJ0oFzvEauuiy7ndQHidLan6xuvAMjII9c8aPgZIYQJLP63NrKkHSYsRDcslQ5Cz0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688282;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=MvylJ0DIExBqu7eTCyfw43GRQQ6ZBl4PNGmJv2yfmAY=;
	b=vMbU2WiSEcFS1qjFdeKSCTU0wok1CZUQTVMq9phsefrOsfh1AdCdo84KmrvI9AALG1lk
	 fefVSzZD0XrCgW+kOYtHmhbHgOSs2a4Z9HXMRCADGzEG/GEk/SeWhbbwhA02xwz+sB2Gk
	 j6tu8G2vTYgu8MjiWAn5HOdMKZDAlmp4Fza5lC3Fwnc4fzRBoyCXGb9/dpFByypW2HNWp
	 mPJNqTjPSp8jINLN9vD+iNwLJ99q1NKUkDtDUlRCTxVrK9ccBoHGB11TvtyHZZl832loq
	 kfhbrFKqi5E3LhftowO3i5b9jG3EP5RcC7Jk1mi0MtAps8JaRv1BcvsqjAKCpPxF9jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YzrGFkq0;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1210D606A319;
	Thu, 22 Oct 2026 16:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1210D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YzrGFkq0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792688282; x=1824224282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lJVG0ygpDDg7UhuzM/XM4Ql0nJbI3qvmKCL5NVlKWJ8=;
  b=YzrGFkq0zTzsJBU3IH+2ahx5rBDVE+dThvvoxq1ujjGzFUQjMGBh+NSz
   0vUrE/rvVrCwJ9a4kSrup+4Grn4HesgisbB+3Bn7rSuHf5Vqso/XnGfT3
   qhybkTjGWPrACHsy7iK+8eOj0TeDwQi8JdYNUaHAFLpmIwR9ZFdqoACry
   YspxLuROij/Ln/SQyi3dCCiexzLphD2Fwo2EANsMQoK4XISTSqNgoeJP9
   LHdltid4sNyZx9+fQkPQhSqmFoOrJjFhpaeCIZEYaijrtkXkAM/ZcB05X
   GyAHDPNsTjsgGQKYRvuqKCb3CiAz9DrlUfJkNmOTB8BLfQvyYujuMaUqw
   Q==;
X-CSE-ConnectionGUID: W2M6EXK+QO6kddzu4frPOg==
X-CSE-MsgGUID: 231gnev2QvW4VWPiXi6W5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1345300"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1345300"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 09:58:01 -0700
X-CSE-ConnectionGUID: Qzhc3AN6Svmt36Ioz07Ibw==
X-CSE-MsgGUID: Qdjs/ne0RE6rYx8/hzlQQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3322514"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 09:57:59 -0700
Date: Thu, 22 Oct 2026 19:57:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: dw: synchronize completion callbacks
Message-ID: <atpAlTyKLYfikKQ8@ashevche-desk.local>
References: <20261021-submit-dw-dma-synchronize-v1-v1-1-6af85c2d6f69@gmail.com>
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
In-Reply-To: <20261021-submit-dw-dma-synchronize-v1-v1-1-6af85c2d6f69@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 21, 2026 at 03:14:14PM -0600, James Hilliard wrote:
> The controller tasklet can remove a descriptor from active_list and
> invoke its callback outside the channel lock. Terminating the channel
> does not wait for that callback, and there is no device_synchronize
> hook. A client can therefore reuse callback state or release its buffers
> after dmaengine_synchronize() while an old callback still uses them.
> 
> Drain the controller tasklet from device_synchronize, outside the
> channel lock. This also waits for callbacks on the other channels
> because the tasklet is shared, without stopping their hardware
> transfers. Clients must continue to exclude new submissions on the
> channel being synchronized.

This doesn't change the driver behaviour and all on users to follow the correct
flow.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


