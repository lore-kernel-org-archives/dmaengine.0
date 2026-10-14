Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B22485921
	for <dmaengine@vger.kernel.org>; Wed, 14 Oct 2026 22:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792016262; cv=none; b=ZNunittb+4KANQ3gc6u9dE9V7IXiL4cxgwvjyfXnUZJi0+Tv0z3aThZbi2TroshDRxoMMTf7I3U0ONfePweHAAKyVGkHTOJgG3Htla8xIUOKjyZVt3oTvwAaEu8wdwH0HxW4pHSgsZ+tH0gfip96PRZ/F8mu2CPIj1MBZ6O/nAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792016262; c=relaxed/simple;
	bh=1Sx3yxKUHJo8400HYKDvb1N0VkU4ctTa+CDRk/AUm6w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CbMUXb+cS3bM1aRAdc9L3hJ2FuUH0t/rpgRg0rBoEtGBlsID570pimqhiie02mJB6qn3x9FUf7r0x+xgPwNoWNLs6kEakV5vfNZHjRZRItnB3hbvEU07QbnzJpnoN8VLwRzoqJDvfAzI2jPAscd4hvdm61ysqRwJi92X5+8yBzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dzhG4tvb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dzhG4tvb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792016262; x=1823552262;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=1Sx3yxKUHJo8400HYKDvb1N0VkU4ctTa+CDRk/AUm6w=;
  b=dzhG4tvbfchjmS7YCP+d1yXkm4r+VTNippPzhEoVrE+b2kp6sXO8j7ub
   9V3uSHPjbKAI7Szan/lCwNpsfYCew87HOLQkIr/89lI9MDsyOt4m7zz2O
   ivG/PGkRZtak/1UN86bVNY/UBfFQRt12YR4/6T2ano+K1bf9OFqQTlKIn
   5CdleS36jsChtXB5d1TJ8RDMyJh8eLzI7Sg84pTxRhgd8CNEqL8pPePK+
   iAi5Pq7sFlnkH1Mnbn0CRCGmeSXPPgp7nOwmjhGh5/9eRmsif8QXZTdzI
   NMsH2++/QCir422yh8y6cXYAtcH8LciUheB1+U4fWkcWBsA5Depz7F1jo
   Q==;
X-CSE-ConnectionGUID: GONOnoHvT9i0TsVMn5Xc7A==
X-CSE-MsgGUID: u58q8ZAWT5Caq/GLuY0csw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="788690"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="788690"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 15:17:41 -0700
X-CSE-ConnectionGUID: LUaaluVeRnWVTgN/X/Zu0Q==
X-CSE-MsgGUID: r945dxdZQy+rcoX9uIFo9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1603441"
Received: from vcostago-desk1.jf.intel.com (HELO vcostago-desk1) ([10.241.243.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 15:17:40 -0700
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH 5/6] dmaengine: idxd: Fix error code handling in
 idxd_cdev_open()
In-Reply-To: <sashiko-outbox-168650@kernel.org>
References: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
 <20261012-wt-idxd-fixes-v1-5-30a35a445077@intel.com>
 <sashiko-outbox-168650@kernel.org>
Date: Wed, 14 Oct 2026 15:17:39 -0700
Message-ID: <87h5iohqpo.fsf@intel.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] dmaengine: idxd: idxd_cdev_open() masks -ENOMEM from xa_insert()
> - [High] dmaengine: stranded PASID xarray entry on shared FD close breaks fault handling
> - [Medium] dmaengine: idxd: missing idxd_wq_disable_pasid() rollback on ida_alloc() failure
> --
>
> commit 63ea0ebbf579eb846dc4486575508a710df270fc
> Author: Vinicius Costa Gomes <vinicius.gomes@intel.com>
>
> dmaengine: idxd: Fix error code handling in idxd_cdev_open()
>
> idxd_cdev_open() mishandles rc on two error paths: on ida_alloc() failure,
> it jumps to failed_ida without setting rc, returning 0. And when xa_insert()
> returns -EBUSY, rc is left negative and can leak out. This commit fixes
> both paths.
>
>> diff --git a/drivers/dma/idxd/cdev.c b/drivers/dma/idxd/cdev.c
>> index 82b07cf942ef8..abbab9bdd06c3 100644
>> --- a/drivers/dma/idxd/cdev.c
>> +++ b/drivers/dma/idxd/cdev.c
>> @@ -264,8 +264,11 @@ static int idxd_cdev_open(struct inode *inode, struct file *filp)
>>  		mutex_lock(&wq->uc_lock);
>>  		rc = xa_insert(&wq->upasid_xa, pasid, ctx, GFP_KERNEL);
>>  		mutex_unlock(&wq->uc_lock);
>> -		if (rc < 0)
>> -			dev_warn(dev, "PASID entry already exist in xarray.\n");
>> +		if (rc < 0) {
>> +			/* An existing entry is harmless, warn and continue */
>> +			dev_warn(dev, "PASID entry already exists in xarray.\n");
>> +			rc = 0;
>> +		}
>
> [Severity: High]
> Does this code unintentionally mask all negative return codes, including
> -ENOMEM?
>
> xa_insert() can return -ENOMEM if memory allocation fails. By unconditionally
> clearing all negative return codes (rc = 0), this allows the file open to
> succeed without registering the user context in the xarray.
>
> Later, when a subsequent hardware page fault occurs for this PASID,
> idxd_copy_cr() will call xa_load(), fail to find the context, and silently
> drop the completion record.
>

Will fix. Should have thought of -ENOMEM.

> [Severity: High]
> If a process opens multiple file descriptors to a shared IDXD workqueue,
> does treating -EBUSY as harmless leave the second FD stranded when the first
> FD is closed?
>
> When the first open succeeds, the context is inserted into the upasid_xa
> xarray. The second open fails the xa_insert with -EBUSY, which this code
> explicitly treats as harmless and continues, leaving the first context in
> the xarray.
>
> However, when the process closes the first file descriptor,
> idxd_xa_pasid_remove() successfully matches and removes the first context
> from the xarray:
>
> drivers/dma/idxd/cdev.c:idxd_xa_pasid_remove() {
> 	ptr = xa_cmpxchg(&wq->upasid_xa, ctx->pasid, ctx, NULL, GFP_KERNEL);
> }
>
> The second file descriptor remains open and active, but its PASID is no
> longer mapped in the xarray. If a hardware fault occurs for this PASID,
> idxd_copy_cr() will fail to find the context in the xarray, warn
> 'No user context', and silently drop the completion record.
>
>>  
>>  		if (wq_dedicated(wq)) {
>>  			rc = idxd_wq_set_pasid(wq, pasid);
>> @@ -279,6 +282,7 @@ static int idxd_cdev_open(struct inode *inode, struct file *filp)
>>  	idxd_cdev = wq->idxd_cdev;
>>  	ctx->id = ida_alloc(&file_ida, GFP_KERNEL);
>>  	if (ctx->id < 0) {
>> +		rc = ctx->id;
>>  		dev_warn(dev, "ida alloc failure\n");
>>  		goto failed_ida;
>>  	}

Another pre-existing issue. Will try to fix on v2, from a quick look,
seems that this one is one of the messier ones, that might need a
separate series. Let's see.

>
> [Severity: Medium]
> Does the failed_ida error path leak the PASID hardware configuration?
>
> During open(), if the WQ is dedicated, idxd_wq_set_pasid() programs the
> hardware WQ with the calling process's PASID. If the subsequent ida_alloc()
> fails, the error path (failed_ida) unbinds the PASID from the IOMMU and
> removes it from the xarray:
>
> drivers/dma/idxd/cdev.c:idxd_cdev_open() {
>     ...
> failed_ida:
> failed_set_pasid:
> 	if (device_user_pasid_enabled(idxd))
> 		idxd_xa_pasid_remove(ctx);
> failed_get_pasid:
> 	if (device_user_pasid_enabled(idxd) && !IS_ERR_OR_NULL(sva))
> 		iommu_sva_unbind_device(sva);
>     ...
> }
>
> However, it fails to call idxd_wq_disable_pasid() to clear it from the
> hardware WQ. This leaves the hardware WQ in the ENABLED state programmed
> with a stale, unbound PASID.
>

Another pre-existing issue, but should be more or less straightfoward to
fix. Will fix on v2.


Cheers,
-- 
Vinicius
