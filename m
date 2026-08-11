Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09FC43CEF9;
	Tue, 11 Aug 2026 10:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786445458; cv=none; b=V/DPTcbnmByPCoaiHHs7O+k3Y1Tnxmy/wMScXOPONyQ/jV+wyBZnUAqMvtoJoZSwSfDg8VeC3BMIP3VtvcD3zCQJzKhAhDC6XzbETGtxTsyPb5aV5OVDne/ChNLhzf4onvp4DcMauBwthdlEGyDUdVFiMWkhIMIo+ePhhdRszXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786445458; c=relaxed/simple;
	bh=O6F6S1oO0YjPlm79802tlGZIfXLCiG33MEcQV3bQb0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHmlujk7fskw/d0UkrNuvuUoypNu8jgow1oxY4tfR8uXGxj40M52wmqx+jRd4oZ76dS/AWRd90Cn+UsDN8m8tHXNwJ3rAFVAF2hicpIRTGA29W8YtAi7AaBSzZcohhqtVyxERp5/RDZOW2DDaZE6HklOCJ9E9e/xOYKZBTFYOZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kg5Hh+/E; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kg5Hh+/E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786445452; x=1817981452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O6F6S1oO0YjPlm79802tlGZIfXLCiG33MEcQV3bQb0g=;
  b=Kg5Hh+/ET/doqJgddg35A/wx4BImf/Rlp8iRpHjlZ06fct1vdb1HaXbm
   a8fXozWiRAAkqBxF2eW8W3IVgnHN1QhrNnq1qRcP8V4s3bAt0v0MB1riZ
   bpWKpiYxFQxnHDQ8HW5n0EbRz02ph7Tf7yKXo3rlWyB8pDODV8/jJFIV5
   kJt7vRL9z39HmhV1Z5PGVS0VOzuU4NF4r0evAhNK3sEwfZtZh8nfCkcM6
   9ejZQdsPDjP0jFWDs2TmSCHrTrd2+2QjjOkrCvywx2owUjLjBSr9H4xlO
   Yed3sNXEt1VbhVRNSN5e1nE7c6oR9tPYDqv1tHhryfmA1P9M93sjF4mJr
   g==;
X-CSE-ConnectionGUID: zQ3HFuxhS4Wo+WjsoEdNQg==
X-CSE-MsgGUID: n0H6gog6SfC0nnARGrsUaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="97570357"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="97570357"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 03:50:49 -0700
X-CSE-ConnectionGUID: BoWRjM0dSXykxRBThE/jGw==
X-CSE-MsgGUID: Iwp2h9/9S9OejrI5MzVCew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="286713319"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 03:50:46 -0700
Date: Tue, 11 Aug 2026 13:50:44 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 00/34] dmaengine: migrate channel tasklets to WQ_BH
Message-ID: <anr-hAQN5-jGoRp6@ashevche-desk.local>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 10, 2026 at 11:09:01AM -0700, Allen Pais wrote:
> 
> This series moves DMAengine client completion bottom halves from private
> tasklets to a common per-channel API backed by WQ_BH.
> 
> The first patch introduces the dmaengine_*_bh() API with a tasklet backend
> and converts virt-dma to it. It also updates every driver that directly
> accesses the removed virt_dma_chan tasklet, keeping the patch buildable on
> its own. This separates the driver-facing API from its implementation
> without changing callback context.
> 
> The second patch switches that backend to a dedicated WQ_BH | WQ_PERCPU
> workqueue. WQ_BH keeps callbacks in softirq context, while the common API
> centralizes initialization, scheduling, and synchronization. The
> workqueue helpers remain internal to DMAengine, and dmaengine_kill_bh()
> drains scheduled callbacks to preserve tasklet_kill() semantics.
> 
> The remaining patches convert driver-owned channel completion tasklets.
> Tasklets used for controller-level processing, recovery, or other
> non-client-callback work are deliberately left alone because the
> appropriate replacement may differ by driver.

Right, I would actually expect that virt-dma (and others will follow the
example) will switch to threaded IRQ instead of tasklets.

> As agreed in the RFC discussion, selecting hardirq callback delivery is a
> separate API change and is not part of this series.

-- 
With Best Regards,
Andy Shevchenko


