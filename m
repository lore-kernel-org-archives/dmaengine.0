Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A823D3AB284;
	Tue, 13 Oct 2026 17:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912633; cv=none; b=c/Og/v3Rxm4B3nqpQYsMb2Oo/xSHSfQecbwL6ZoFvWf4BDwcxiUfFukroIgqX3rcHoMrVibZvgmiC2Kdi3B9BJI82HgYn64uDflK98keVcQlPPvPqD8TQoSJztaaO7QtLfT89Ow1V+sny85cXEhmG0kp9pN4bQzQqgOOHoj9JXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912633; c=relaxed/simple;
	bh=UcpZTfwKxL1YBwr3EUIGYnSVJVbtjoSinaXKwgwAX5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ksID1L5lCEZrJN0xpmMCEAYH8EERj1NZNiiMwPzD77QyJI9leB/Ukf237S6r5Nd5T+B+jBApnpkH0bN0PAG7VDZrpOu2ONYwdmwTtV7i3MVjX6eSookURgYdBC2h76axQIwH0NVgzhLHQUVkw3ipSJAVBICqdTHNwrb2Gl5w/K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nxfgGVbE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxfgGVbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791912632; x=1823448632;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UcpZTfwKxL1YBwr3EUIGYnSVJVbtjoSinaXKwgwAX5E=;
  b=nxfgGVbEbmomUx1iv42IR11L5kDRYLOZCu4P401plrHvCsbDh9rWkBkv
   KYcV45r7mcn9yx3MyfKubrFu6qLF1KrxBzKuR0X9XGZ1BICdLoFjythop
   vALjdHcIdDb6DlX+A5aFEzvrparZ8yPMmrGbOoKce6m4BB9VdNlS8T+uB
   9Msf8oB7A0y6mBsEjQwmyELTS193YbI/NKkQXPMDVpBJKWkmr0x5+BjLb
   X789cgcYejgAvqqDtGEK55wlN3IYZX1er47zFbH9xKemJW3V6QCo4t5IS
   lhUmLv0jPJ/0uXVflYCfpHNUm9WWLFJjxiAP9tsUZzxuYJbxGEGaW5Ilk
   A==;
X-CSE-ConnectionGUID: /xha6wgtTLSszoM0+GmiRw==
X-CSE-MsgGUID: ryyvR4moS46+TusFQlgXKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="678711"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="678711"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 10:30:30 -0700
X-CSE-ConnectionGUID: 33eYYNmiQPGenNtPYjEMkg==
X-CSE-MsgGUID: MPgmNzm0RPqWlVpb8OwrFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1411680"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO [10.125.109.235]) ([10.125.109.235])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 10:30:29 -0700
Message-ID: <c58db0c6-3484-436e-892a-a818785996f6@intel.com>
Date: Tue, 13 Oct 2026 10:30:27 -0700
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dmaengine: idxd: Fix potential double free on probe
 error path
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Fenghua Yu <fenghuay@nvidia.com>, Shuai Xue <xueshuai@linux.alibaba.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
 <20261012-wt-idxd-fixes-v1-3-30a35a445077@intel.com>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <20261012-wt-idxd-fixes-v1-3-30a35a445077@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/12/26 2:38 PM, Vinicius Costa Gomes wrote:
> On the probe error path the device is released via put_device() ->
> idxd_conf_device_release(), which frees idxd->wq and the idxd->wqs,
> idxd->engines, idxd->groups and idxd->wq_enable_map arrays. The
> idxd_clean_*() helpers and the idxd_setup_*() error unwind paths free
> the same objects, so they get freed twice.
> 
> With commit ec2d428b2e32 ("dmaengine: idxd: fix double free of wq,
> engine, and group structs") we made use of the kobject lifetime to
> keep track of device memory allocations. These deallocations were left
> behind. Remove them as idxd_conf_device_release() is already taking
> care of that.
> 
> Fixes: 3d33de353b1f ("dmaengine: idxd: Fix not releasing workqueue on .release()")
> Link: https://lore.kernel.org/all/20260615103932.61828-1-bogdan.codres@windriver.com/
> Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>  drivers/dma/idxd/init.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
> index 4adb3f3bcd01..8cf478c5b26d 100644
> --- a/drivers/dma/idxd/init.c
> +++ b/drivers/dma/idxd/init.c
> @@ -166,8 +166,6 @@ static void idxd_clean_wqs(struct idxd_device *idxd)
>  		conf_dev = wq_confdev(idxd->wqs[i]);
>  		put_device(conf_dev);
>  	}
> -	bitmap_free(idxd->wq_enable_map);
> -	kfree(idxd->wqs);
>  }
>  
>  static int idxd_setup_wqs(struct idxd_device *idxd)
> @@ -245,11 +243,8 @@ static int idxd_setup_wqs(struct idxd_device *idxd)
>  		conf_dev = wq_confdev(idxd->wqs[i]);
>  		put_device(conf_dev);
>  	}
> -	bitmap_free(idxd->wq_enable_map);
>  
>  err_free_wqs:
> -	kfree(idxd->wqs);
> -
>  	return rc;
>  }
>  
> @@ -262,7 +257,6 @@ static void idxd_clean_engines(struct idxd_device *idxd)
>  		conf_dev = engine_confdev(idxd->engines[i]);
>  		put_device(conf_dev);
>  	}
> -	kfree(idxd->engines);
>  }
>  
>  static int idxd_setup_engines(struct idxd_device *idxd)
> @@ -308,7 +302,6 @@ static int idxd_setup_engines(struct idxd_device *idxd)
>  		conf_dev = engine_confdev(idxd->engines[i]);
>  		put_device(conf_dev);
>  	}
> -	kfree(idxd->engines);
>  
>  	return rc;
>  }
> @@ -320,7 +313,6 @@ static void idxd_clean_groups(struct idxd_device *idxd)
>  	for (i = 0; i < idxd->max_groups; i++) {
>  		put_device(group_confdev(idxd->groups[i]));
>  	}
> -	kfree(idxd->groups);
>  }
>  
>  static int idxd_setup_groups(struct idxd_device *idxd)
> @@ -378,7 +370,6 @@ static int idxd_setup_groups(struct idxd_device *idxd)
>  		group = idxd->groups[i];
>  		put_device(group_confdev(group));
>  	}
> -	kfree(idxd->groups);
>  
>  	return rc;
>  }
> @@ -388,7 +379,6 @@ static void idxd_cleanup_internals(struct idxd_device *idxd)
>  	idxd_clean_groups(idxd);
>  	idxd_clean_engines(idxd);
>  	idxd_clean_wqs(idxd);
> -	destroy_workqueue(idxd->wq);
>  }
>  
>  static int idxd_init_evl(struct idxd_device *idxd)
> @@ -459,7 +449,6 @@ static int idxd_setup_internals(struct idxd_device *idxd)
>  	return 0;
>  
>   err_evl:
> -	destroy_workqueue(idxd->wq);
>   err_wkq_create:
>  	idxd_clean_groups(idxd);
>   err_group:
> 

