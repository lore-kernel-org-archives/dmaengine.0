Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8575208DC;
	Tue, 13 Oct 2026 17:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911925; cv=none; b=X2znsc+HEVohYS5DlZd4P0e9gZkAVYoxMkJXPfuCGZmxv1NzSg64IMAt2txTdOKVUgfzh/EcPtqGx6P5sleUa05Q5V87lqeGK/RNKGcGMS20cnHy2F4UDncEHlRD1GL+FcVmb5S84VqvUkIdOQce65pH0vWJIekTTjFZKc/yL8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911925; c=relaxed/simple;
	bh=hy7uMoaIIZ7biCRxdqldWn224Ufta9r46+3rd5Fw4do=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nz7/iIPBqNgqJiJobWLiic17CITGoz2yuH9W4zw22HQ0nrQyW/FAO9udPlryKkhmlQuuxCKva6optD5AuDTP7SGADia2ztKpzlIYzwaeVdoEGq8J/z8FdBSKHj78xY0ILeLj/T1uiw05Dq0Bxv7qnsHZRdFGfBZcy1dtdV8Oqhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DuI/rqPH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DuI/rqPH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791911925; x=1823447925;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hy7uMoaIIZ7biCRxdqldWn224Ufta9r46+3rd5Fw4do=;
  b=DuI/rqPHLPiVhLPPaEAGbMK/BGBFnbBydh76Sr7QBog9Zf8HVK/Li8iZ
   asntdUdyk87WqP1uEdrvQRtknJlA4w3ra2+FGxxE/IY2MhLcevRcRWjZn
   c+3x4SXbJ3xXahPYgsG3MfogFNC+V3l+DcnlN89sz/r6excW2Tp5HXHiB
   3WzrrgTRP45724si7NCYWJqKRasYt2/D3o4hdixhlxZO8+J3XFox+Ggu8
   f98ip+nNnLnSMUnM8/H498CH4GTDpYqFhdQ3T1sbWhGapRW3VR21YpoOR
   KACIWUEc+QZ+hjWaWm606Mbg+lGRQQT8/uaB4MnJNpseW4YxdN6oZ69+W
   g==;
X-CSE-ConnectionGUID: g3xPu7m7SRqJqysj5wUj9A==
X-CSE-MsgGUID: FdYBCV6NQ1OFgqr9oc/N6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="740337"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="740337"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 10:18:44 -0700
X-CSE-ConnectionGUID: 4xgGuyZJS2y8XTB7pLl07Q==
X-CSE-MsgGUID: 6vbAGK1+TdeegSCW0oyY7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1106841"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO [10.125.109.235]) ([10.125.109.235])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 10:18:43 -0700
Message-ID: <88903331-7dff-4732-b443-10e8fcb9699f@intel.com>
Date: Tue, 13 Oct 2026 10:18:42 -0700
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dmaengine: idxd: Do not call destroy_workqueue with
 null idxd->wq
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Fenghua Yu <fenghuay@nvidia.com>, Shuai Xue <xueshuai@linux.alibaba.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steve Wahl <steve.wahl@hpe.com>
References: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
 <20261012-wt-idxd-fixes-v1-1-30a35a445077@intel.com>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <20261012-wt-idxd-fixes-v1-1-30a35a445077@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/12/26 2:38 PM, Vinicius Costa Gomes wrote:
> From: Steve Wahl <steve.wahl@hpe.com>
> 
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
> Signed-off-by: Steve Wahl <steve.wahl@hpe.com>
> Acked-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
^ needs a sign off rather than an ack since you posted his patch?


With Frank's comment addressed,
Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
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
> 

