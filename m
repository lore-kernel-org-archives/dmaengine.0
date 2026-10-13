Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA30C51DE15;
	Tue, 13 Oct 2026 17:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912085; cv=none; b=FOtsFu2OcxieMJeX0NR+6Q0lj+D8gdL+Vfog0Qpnw3GrCcOtMIkBhZ4upSiXXUdc0iqcnEx00e1Z7dbUwN/mFOtQq/OONuz2qqBdz8WhrAy/ND0BDr46bCj/prZyPAW+2AU1kz3SDdeWPUFvnuz0GP+e68pmPjCgWI/GIxSodBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912085; c=relaxed/simple;
	bh=ubrSW0XXvtBCYba8C5sWcdvydqS5ok5ZAiA1KjkWhI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m5GtqXP/ZQExPiS3yic5XFgxxd1UsbHX+W0LPkYc9WdegCOPBHfOzwtzkCNIXdQQnlBb5OxTG9qHL06GbyFBRHrO+iKvIlgzJMMq/7nl9vqoC3yxVgiuVqVsVrqXAbs6RWeqLpPVtUEkUu/dxLTw4O+2WnXNMvvxXRWyu8+jPPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MXpFb2bf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXpFb2bf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791912084; x=1823448084;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ubrSW0XXvtBCYba8C5sWcdvydqS5ok5ZAiA1KjkWhI8=;
  b=MXpFb2bfPq/dnw9fu6KVf2smpluzMLQYDP7tfzzh6bUtbuZT6Dbr32YK
   HXcZ8TmIIxwmiA/k8VQ45olN0NBb4IsdSJDdhdNijP9TCqjQP/c+Rlg92
   Iu52ktOvspmitXC5NOe3LrthUlQpgUie2J7OmdX3TuO8/eqcDnfrvtXXR
   STUhtyPuF7x+JQiu5jjiDZMmn1EivKJO9Dm3i07Pxfeo+/az6D6AMlDB+
   SMg6O913tJlgq7piccBjQHTIhHzfit2bZLEIVgpYhpOxSod7Ngm/zxlsv
   +r01PZ90+s2Poet7ZNdY30W7YtWZOK8H8/jCCEAu/j/G+li+dW8VIMrff
   g==;
X-CSE-ConnectionGUID: jSciyxEvTn2eCYANeBmxbg==
X-CSE-MsgGUID: lphlMKRhR7iV79hz9pvsig==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="654944"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="654944"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 10:21:11 -0700
X-CSE-ConnectionGUID: rvuX6ehQQnSX7dt/KU0hsw==
X-CSE-MsgGUID: ewEanOD9QIu7uXIdlMC8Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1249070"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO [10.125.109.235]) ([10.125.109.235])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 10:21:10 -0700
Message-ID: <f7bb2804-04ef-4203-aa39-33944652078b@intel.com>
Date: Tue, 13 Oct 2026 10:21:08 -0700
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dmaengine: idxd: fix duplicate memory frees on
 initialization error path
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Fenghua Yu <fenghuay@nvidia.com>, Shuai Xue <xueshuai@linux.alibaba.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, Bogdan Codres <bogdan.codres@windriver.com>
References: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
 <20261012-wt-idxd-fixes-v1-2-30a35a445077@intel.com>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <20261012-wt-idxd-fixes-v1-2-30a35a445077@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/12/26 2:38 PM, Vinicius Costa Gomes wrote:
> From: Steve Wahl <steve.wahl@hpe.com>
> 
> Error paths within idxd_pci_probe_alloc and related functions end up
> attempting to free memory already freed from idxd_conf_device_release
> via put_device.
> 
> This was encountered running in a kexec'd kdump kernel with reduced
> resources, causing the "Device is HALTED!" branch in
> idxd_device_init_reset to be taken.
> 
> [   18.628791] idxd 0000:00:01.0: Device is HALTED!
> [   18.631447] idxd 0000:00:01.0: Intel(R) IDXD DMA Engine init failed
> [   18.631450] ------------[ cut here ]------------
> [   18.631451] ida_free called for id=0 which is not allocated.
> [   18.631462] WARNING: CPU: 0 PID: 11 at lib/idr.c:525 ida_free+0xd3/0x130
> [   18.631474] CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted 6.12.0-1-rt-amd64 #1
> [   18.631477] Hardware name: Dell Inc. PowerEdge XR8720t/0J91KV, BIOS 1.1.3 02/03/2026
> [   18.631478] Workqueue: events work_for_cpu_fn
> [   18.631480] RIP: 0010:ida_free+0xd3/0x130
> [   18.631492] Call Trace:
> [   18.631494]  <TASK>
> [   18.631495]  idxd_pci_probe+0x1b0/0x1860 [idxd]
> [   18.631506]  local_pci_probe+0x43/0xa0
> [   18.631508]  work_for_cpu_fn+0x13/0x20
> [   18.631510]  process_one_work+0x179/0x390
> [   18.631512]  worker_thread+0x237/0x340
> [   18.631517]  kthread+0xc6/0x100
> [   18.631520]  ret_from_fork+0x2d/0x50
> [   18.631524]  ret_from_fork_asm+0x1a/0x30
> [   18.631526]  </TASK>
> 
> In idxd_free and idxd_alloc, do not attempt to free allocations that
> will already have been freed.
> 
> Fixes: 90022b3a6981 ("dmaengine: idxd: fix memory leak in error handling path of idxd_pci_probe")
> Fixes: 46a5cca76c76 ("dmaengine: idxd: fix memory leak in error handling path of idxd_alloc")
> Reported-by: Bogdan Codres <bogdan.codres@windriver.com>
> Link: https://lore.kernel.org/all/akLBL7b2h73pK0AC@ilogsc-qemu.local/
> Signed-off-by: Steve Wahl <steve.wahl@hpe.com>

Missing Vinicius sign off

Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>  drivers/dma/idxd/init.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
> index 4b827a329756..4adb3f3bcd01 100644
> --- a/drivers/dma/idxd/init.c
> +++ b/drivers/dma/idxd/init.c
> @@ -581,9 +581,6 @@ static void idxd_free(struct idxd_device *idxd)
>  		return;
>  
>  	put_device(idxd_confdev(idxd));
> -	bitmap_free(idxd->opcap_bmap);
> -	ida_free(&idxd_ida, idxd->id);
> -	kfree(idxd);
>  }
>  
>  static struct idxd_device *idxd_alloc(struct pci_dev *pdev, struct idxd_driver_data *data)
> @@ -623,8 +620,13 @@ static struct idxd_device *idxd_alloc(struct pci_dev *pdev, struct idxd_driver_d
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
> 

