Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7366439F88;
	Tue, 11 Aug 2026 10:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786444234; cv=none; b=Lp+GclOZO+PHQzO/YjxEseK7e8axNz/uQKMDRYo/cQmOzXeusqGmrYttsGJTUr/oYOsVkrAeKtt/2t/p+9O2LkN+lL8QN7824KaT0UIcoqsfbU7Uf1uu4SJx5+d6kJ3cVkWomXJM1b1c3d0nhN8sU1NrIeRSvinjiv5DcLob07c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786444234; c=relaxed/simple;
	bh=/hF/tAwvqUTzPNFfGRZyFpIpmJVyOfr6fLpdLfIPntc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZrbq0TxN4nywa/Pr42wXOKw3EGtSTKadjKBGZtXBIUWrDeRwYXZ5O3MqZm5FtWR+A/fpwKJ+uf2pUhTymVYlLoYoi5CRmE82wVzuOAjwHvSSw8XVewr5/cZXu6WZbHh6hFBBHF8Q1GelxhJ10RWEdcdFuFul2cpYB6Rbb+DMlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JICToVKF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JICToVKF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786444232; x=1817980232;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/hF/tAwvqUTzPNFfGRZyFpIpmJVyOfr6fLpdLfIPntc=;
  b=JICToVKFmw5prLKZqXxdTfqSPOdpq00o4/SNBx7Pw8qHnQ9wg/F6iMwF
   6cNdb7X99wIMEGPsvf5TrolJX80n4RiLuPEuMW4E6o2YKMfCWzMpUCZ0k
   toc8TyqW8c9EpKp37TnNKHO9/zO7ss+nVAuA2HANZBfbxjplhajWBX/8h
   AMfM3pOVxskoKSGhw8C+8Kvs25XhBkyKsWv/7IRF7Q68zmm6/ofSOR6Jv
   0h911gegArlR76gNTdzozmld5W9u2Ab4WHMbcdaNqtK/0x2njfz6IO9XP
   zJrl07Kg6a7hgIv7HX6KphOT9RYe02TAhxsf4sWxOlKrpGv3iZIEWG7iA
   Q==;
X-CSE-ConnectionGUID: PUjtUsbwSk620ZNL7NOZQg==
X-CSE-MsgGUID: /dI2JmDZRTmc5MxOFW180A==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="90654073"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="90654073"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 03:30:30 -0700
X-CSE-ConnectionGUID: ijbj3H/OTGaTHsDRCAl0Bw==
X-CSE-MsgGUID: XfULfVfMR1edgFUtjzfQJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="259992453"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 03:30:28 -0700
Date: Tue, 11 Aug 2026 13:30:26 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 00/34] dmaengine: migrate channel tasklets to WQ_BH
Message-ID: <anr5wmSsxvO0ZXOx@ashevche-desk.local>
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
> Hi Arnd, Vinod and Frank,
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
> 
> As agreed in the RFC discussion, selecting hardirq callback delivery is a
> separate API change and is not part of this series.
> 
> Earlier discussion:
> https://lore.kernel.org/all/20260108080332.2341725-1-allen.lkml@gmail.com/

Never reply with a new version of such a long series into the same thread (of
the previous version of it), it's now a mess in the mail thread.

-- 
With Best Regards,
Andy Shevchenko


