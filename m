Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D5B81ACD;
	Sat, 27 Jun 2026 00:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782521262; cv=none; b=LH2RuftpCI2A4lFtAM4Z8z/xiJLDyniPzQB+LLhboqU8W6zdMqRauqKJH+UwSJCXKlfifwF/Okm4yJZt8JI+O/6Q62pTldyQ27LEOh4y8xpqdmbOi0fYedI6zm2+4B1paLfpEWqqXPzPKiMsT50+Qh4rQxLjS98I/zkWSW/C4EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782521262; c=relaxed/simple;
	bh=lrnUPg5em0i1CDypHqzk08sLZqxPv0nrfkDNeDG1uDY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gwbLi5REmjPl2hb1mp7FtyBVGq0kiDm0Bmry7dRThNZovwIdb1cUBU1dfTCDNwCOG/BcOoTtAELeF/W29gqjEfRwvgm1oMWDto1eJ1fqZ/z9eFp21oUSIefhxiSxO0x6g849ZQRXQdabZLlF/QuJ6inws0kKghGwtoYN1pswZ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7Az4U9I; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7Az4U9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782521260; x=1814057260;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=lrnUPg5em0i1CDypHqzk08sLZqxPv0nrfkDNeDG1uDY=;
  b=c7Az4U9IAumuSji0HBEcLNkXEnTHFv6HzD77Af13Hr2YLlQLW0MnJH18
   DDzSRbhjc3hS/i1v0cFvkK+1fCd7/8fnV/WuAGPhUJ14UTigscUWvCuYc
   aDCuwbcJhBflsEbir68KAQfPp+zixE8X2E/TiJGxDB0D3WwuAD+bkZn6J
   I+tmdKTD1GvI9QO7iDE0bkrxSUIdeEVsZETbUDnFlGHE/T/SnodfS/2HL
   ua/ZHYzecoiAJOrTAkMtVGA3XDUp9oaQsbSEnYdafpHtQj7soBMJD2k+0
   qpqdwDWeYXk+yr1hCxsgUO8886D2eP/d3agGGPYStq2qodPDr+6mE65qC
   g==;
X-CSE-ConnectionGUID: 8V9Ij+QRS9WFsYBgvvV2pg==
X-CSE-MsgGUID: mKcaqJNySLOBMTZHQWrCXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="87158130"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="87158130"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 17:47:40 -0700
X-CSE-ConnectionGUID: msU7cCiKTsWyH7yxj6mxDw==
X-CSE-MsgGUID: R0b7X2LuTVO9Yr5bV3ON4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="245065174"
Received: from vcostago-desk1.jf.intel.com (HELO vcostago-desk1) ([10.88.27.144])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 17:47:39 -0700
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
To: Steve Wahl <steve.wahl@hpe.com>, Steve Wahl <steve.wahl@hpe.com>, Dave
 Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, Frank Li
 <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Russ Anderson <rja@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>
Subject: Re: [PATCH v2 1/2] dmaengine: idxd: Do not call destroy_workqueue
 with null idxd->wq
In-Reply-To: <20260522203414.336549-1-steve.wahl@hpe.com>
References: <20260522203414.336549-1-steve.wahl@hpe.com>
Date: Fri, 26 Jun 2026 17:47:38 -0700
Message-ID: <87se68izbp.fsf@intel.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Steve Wahl <steve.wahl@hpe.com> writes:

> Error paths within idxd_pci_probe_alloc and related functions end up
> calling destroy_workqueue with a null pointer, from
> idxd_conf_device_release via put_device, because that allocation has
> not yet occurred when the error is hit.
>
> This was encountered running in a kexec'd kdump kernel with reduced
> resources, causing the "Device is HALTED!" branch in
> idxd_device_init_reset to be taken.
>
> In idxd_conf_device_release, check that the workqueue has been
> allocated before trying to destroy it.
>
> Fixes: 3d33de353b1f ("dmaengine: idxd: Fix not releasing workqueue on .release()")
>
> Signed-off-by: Steve Wahl <steve.wahl@hpe.com>
> ---



> v2: split into two patches as requested by Vinicius Costa
>
>  drivers/dma/idxd/sysfs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/idxd/sysfs.c b/drivers/dma/idxd/sysfs.c
> index 6d251095c350..d5ffc641c856 100644
> --- a/drivers/dma/idxd/sysfs.c
> +++ b/drivers/dma/idxd/sysfs.c
> @@ -1836,7 +1836,8 @@ static void idxd_conf_device_release(struct device *dev)
>  {
>  	struct idxd_device *idxd = confdev_to_idxd(dev);
>  
> -	destroy_workqueue(idxd->wq);
> +	if (idxd->wq)
> +		destroy_workqueue(idxd->wq);
>  	kfree(idxd->groups);
>  	bitmap_free(idxd->wq_enable_map);
>  	kfree(idxd->wqs);
> -- 
> 2.51.0
>

-- 
Vinicius
