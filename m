Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A13535F602;
	Wed, 20 May 2026 20:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779307805; cv=none; b=QEkWnXuejTkCpQtUp1FGCeGpP3UHwwo2sF2cKmOP8UdxUdUlPmOjRgpJyuTnH5PqIJZnA76GJKoyZqYsJ50gpzIFTMWEwViY3UkKnZ+WsyM83fv5PsWrHe/qCntCKETj4ex0fdgVhWUL2QgjGb5jjac1so7eZwwj5y44jTRQMf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779307805; c=relaxed/simple;
	bh=hFZqPe44LeYy9w35pIl7ovr5lgpcnh61kL6QW1dLZLU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IEJkEHY04+NXWeZpmk/R76aHWY98VWkFGqufrCiEQ16G3v+K9vMo3D3MG7zXQT/gGrieoQZbupxT06G7iI1iUFW/AH8R1BGWEchMeqtSTtKePMmi2DhaY4TgeIMXHjUQEOjJVL4nJD/pk5loS7uonEwsxZrRzFAmitsWVnrWHYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ELOjclwm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELOjclwm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779307804; x=1810843804;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=hFZqPe44LeYy9w35pIl7ovr5lgpcnh61kL6QW1dLZLU=;
  b=ELOjclwmZHP62ytqc9dHLLpCaMJF4qnIadgK704B2DENj6MI7YOm4izR
   emLlQ6MVTzietI30CGHfUBu5Bp7c6fc7a0j8XCK7r9B5ajNCRN1IbIrhx
   SfKfQGiZK8aCGt1aWIhiHhJZZxs3kZ8SZsCJIAzh0SkS4Lb1mGJ3cYLX/
   zAorJ1Nz5qa1d78VReI8iUY1ZA1mbwUMCBkCmlQHa1Z/lmZgyP27gwmz9
   eqX0fVGH4DueIyoj/S43pj7CxpZxF3SJZJDijLHbvbxBLKyAQ/eNKyyTV
   iiU4SX0DTkyit/+hodjit55DrBpkifONAt6C/T8mV/3Cxn2wgF9q0GzOo
   w==;
X-CSE-ConnectionGUID: MSMPkMjxReWp9Ykk6sPO6A==
X-CSE-MsgGUID: vOtKVknZSZihifgV4sxu6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="97788586"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="97788586"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 13:10:04 -0700
X-CSE-ConnectionGUID: x44GSC8wTnC2+3ULMaVVKg==
X-CSE-MsgGUID: oeI4cJZPTnuPH+xvXSgAdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="236047361"
Received: from vcostago-desk1.jf.intel.com (HELO vcostago-desk1) ([10.88.27.144])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 13:10:03 -0700
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
To: Steve Wahl <steve.wahl@hpe.com>, Steve Wahl <steve.wahl@hpe.com>, Dave
 Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, Frank Li
 <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Russ Anderson <rja@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>
Subject: Re: [PATCH] dmaengine: idxd: fix problems on initialization error
 path.
In-Reply-To: <20260520143732.119407-1-steve.wahl@hpe.com>
References: <20260520143732.119407-1-steve.wahl@hpe.com>
Date: Wed, 20 May 2026 13:10:03 -0700
Message-ID: <878q9du9k4.fsf@intel.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Steve,

Steve Wahl <steve.wahl@hpe.com> writes:

> Some error paths within idxd_pci_probe_alloc and functions it calls
> did not keep proper track of what has already been allocated or freed,
> resulting in calling destroy_workqueue with a null pointer, and once
> that was fixed, attempting to free structures more than once.  These
> conditions were hit running in a kexec'd kdump kernel with reduced
> resources, causing the "Device is HALTED!" branch in
> idxd_device_init_reset to be taken.
>
> In idxd_conf_device_release, check that the workqueue has been
> allocated before trying to destroy it.  And in idxd_free and
> idxd_alloc, do not attempt to free allocations that
> idxd_conf_device_release, called through put_device, will already have
> freed.
>
> Fixes: 3d33de353b1f ("dmaengine: idxd: Fix not releasing workqueue on .release()")
>
> Signed-off-by: Steve Wahl <steve.wahl@hpe.com>
> ---
>  drivers/dma/idxd/init.c  | 10 ++++++----
>  drivers/dma/idxd/sysfs.c |  3 ++-
>  2 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
> index f1cfc7790d95..227e323cc5a0 100644
> --- a/drivers/dma/idxd/init.c
> +++ b/drivers/dma/idxd/init.c
> @@ -607,9 +607,6 @@ static void idxd_free(struct idxd_device *idxd)
>  		return;
>  
>  	put_device(idxd_confdev(idxd));
> -	bitmap_free(idxd->opcap_bmap);
> -	ida_free(&idxd_ida, idxd->id);
> -	kfree(idxd);
>  }
>  
>  static struct idxd_device *idxd_alloc(struct pci_dev *pdev, struct idxd_driver_data *data)
> @@ -649,8 +646,13 @@ static struct idxd_device *idxd_alloc(struct pci_dev *pdev, struct idxd_driver_d
>  	return idxd;
>  
>  err_name:
> +	/*
> +	 * once device_initialize(conf_dev) is called,
> +	 * put_device(conf_dev) will end up calling
> +	 * idxd_conf_device_release() which will free the rest.
> +	 */
>  	put_device(conf_dev);
> -	bitmap_free(idxd->opcap_bmap);
> +	return NULL;
>  err_opcap:
>  	ida_free(&idxd_ida, idxd->id);
>  err_ida:

I think that this first part should be a separate patch.

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

And this another.


Cheers,
-- 
Vinicius
