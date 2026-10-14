Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5A9340A6B
	for <dmaengine@vger.kernel.org>; Wed, 14 Oct 2026 22:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792015839; cv=none; b=uoUEu2Sb6NUNANaCmyWOVuENMbtS26Ipcc5CxpEd2cTpzlfFge/4T+jgOPYlzkClhkg62S1ZfgEJ28bno4Lm2702OFke7u8pa8QjKgpuusWYQAa2fA8bf8w0rZ0AgYIXC1JgQx06fQ0K8zUCbM2B8AI31tQLyRj1vCwFgsmUj0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792015839; c=relaxed/simple;
	bh=pKAcm4Kqm1dKJllzZZnlTXz/3gmGAfsNfatEJraEOYc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mpuhM31XAASfrr3QJHJZ+m+u8Vs++k9jNCw1oHLZ/nAWNkbEtUAtxIWsNNMHjtIxkVVjE/3DZNicdxK0y1/Bbf7Vm0ADBbLGYYlzrPnC6/h+heFeNz1VTEQ53bawAhs6t3U1D+fiBAcYUIpqMH7Rxk+iwqKttoZT7riL+hKSZvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kEFDc+s0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kEFDc+s0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792015831; x=1823551831;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=pKAcm4Kqm1dKJllzZZnlTXz/3gmGAfsNfatEJraEOYc=;
  b=kEFDc+s0zYRb7JjNKNsfnPAYLeK319WP/g/fSgBRIVOIBD68XFpVUC/f
   V8AVYIijRdwvKlTDmmBpHjoBqpnbQAo4afg6mRI/0DbZi7QYJgdhjGjo8
   smTjT/ELfNhJV4v5fgmHhiFMFCRPBKyUHyKoy4n1Pk4R54Vx25dvLSCpo
   qNpHTEBuq47010azy9jB5ehfQzHczjf4uYu9iZzqZYlLHO1z+MZ0J8bO3
   90Pcy5zSY7MffSsVO6viNgTS6umw3JTPqNBZEP/gItN2FAvhQxTrs0NUr
   wwRyOW9cuft58Ps3OZgjsXDG1fwbXhS1bDuT897yhvXRc3N+ZsIIcGPAx
   w==;
X-CSE-ConnectionGUID: FD9gaksFSlKMJaBylHexHA==
X-CSE-MsgGUID: m7BPup+cTlyYjU1QMB7DIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="795904"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="795904"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 15:10:30 -0700
X-CSE-ConnectionGUID: clFvw3IIR3C6AWihzHzTPg==
X-CSE-MsgGUID: yQ/UaToXQli7m33qHNFKeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1866754"
Received: from vcostago-desk1.jf.intel.com (HELO vcostago-desk1) ([10.241.243.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 15:10:29 -0700
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH 4/6] dmaengine: idxd: Fix unwind bounds in device
 registration error paths
In-Reply-To: <sashiko-outbox-168646@kernel.org>
References: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
 <20261012-wt-idxd-fixes-v1-4-30a35a445077@intel.com>
 <sashiko-outbox-168646@kernel.org>
Date: Wed, 14 Oct 2026 15:10:28 -0700
Message-ID: <87o6cwhr1n.fsf@intel.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] dmaengine: idxd: UAF/double-free on device registration failure
> --
>
> commit 571be93356be3fdc63d0506588c4e560e5d9eccc
> Author: Vinicius Costa Gomes <vinicius.gomes@intel.com>
>
> dmaengine: idxd: Fix unwind bounds in device registration error paths
>
> When registering the per-idxd wq, engine, or group devices, a failure partway
> through must roll back exactly the devices already added. This commit fixes
> an underflow loop by starting the rollback at i instead of i - 1.
>
>> diff --git a/drivers/dma/idxd/sysfs.c b/drivers/dma/idxd/sysfs.c
>> index d5ffc641c8567..e828292e5fb88 100644
>> --- a/drivers/dma/idxd/sysfs.c
>> +++ b/drivers/dma/idxd/sysfs.c
>> @@ -1876,7 +1876,7 @@ static int idxd_register_engine_devices(struct idxd_device *idxd)
>>  	return 0;
>>  
>>  cleanup:
>> -	j = i - 1;
>> +	j = i;
>>  	for (; i < idxd->max_engines; i++) {
>>  		engine = idxd->engines[i];
>>  		put_device(engine_confdev(engine));
>
> [Severity: High]
> Does this error handling sequence lead to a double-free of the child devices?
>
> If device registration fails partway, this local cleanup path drops the refcounts
> on the child device kobjects via put_device() and device_unregister(), which
> frees them.
>
> The failure then cascades up to idxd_register_devices(), which rolls back
> previously registered child devices (like WQs), also freeing them. Crucially,
> the pointers in idxd->engines and idxd->wqs are left dangling.
>
> Then, the error is returned to idxd_pci_probe_alloc(), which unwinds by jumping
> to err_dev_register and explicitly calling idxd_cleanup():
>
> drivers/dma/idxd/init.c:idxd_pci_probe_alloc() {
>     ...
> 	rc = idxd_register_devices(idxd);
> 	if (rc) {
> 		dev_err(dev, "IDXD sysfs setup failed\n");
> 		goto err_dev_register;
> 	}
>     ...
>  err_dev_register:
> 	idxd_cleanup(idxd);
>     ...
> }
>
> idxd_cleanup() invokes idxd_cleanup_internals(), which iterates over the arrays
> via idxd_clean_engines() and calls put_device() again on the dangling pointers:
>
> drivers/dma/idxd/init.c:idxd_clean_engines() {
> 	for (i = 0; i < idxd->max_engines; i++) {
> 		conf_dev = engine_confdev(idxd->engines[i]);
> 		put_device(conf_dev);
> 	}
> }
>
> Could this secondary cleanup access the freed device pointer and execute a
> double-put, causing a use-after-free?
>
> [ ... ]

This wasn't easy to parse at all. But I think (with help from AI, kind
of funny) that I get it now. This is an pre-existing issue, will try to
fix on v2 unless it makes the series become too messy.


Cheers,
-- 
Vinicius
