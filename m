Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE956255E43;
	Fri, 11 Sep 2026 23:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789167712; cv=none; b=gW0/s/NE3q+s3Vit7sWwbvclHQ2uBqFB6RTywL2mrglBZsYHTqglGiGc7Mc0wFgObUyCpKEACBsPPYTb7Q0FjGvFOUOUZxSymkJKdDdRIA1kWW7Mz7Hd9wrTpkqMlMvjJL/qQW7/3Rn5OWucGv4je97spAbYVVGRm9xLTQ0utfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789167712; c=relaxed/simple;
	bh=Lkn6t+flzcX1Jz141eCHG+HamT5VAB4eH22MEYlMaF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Op1y8oZcKsgKBXj7gFF55xXPsKTZNsJUIEGo96pk65DCmGwE9iNwIWdddA5XUtLfnC9M/UkAA8ysJXQ6EXXeaflaGVYw5quuj5eE+Ey/iu9vybrXPhdQEIFcKR2A9JDaDzmN7iM3du48YkRDV2Tr3vKXPtcoNKizUUnb5lVJeoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFsnqESk; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFsnqESk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789167710; x=1820703710;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Lkn6t+flzcX1Jz141eCHG+HamT5VAB4eH22MEYlMaF8=;
  b=MFsnqESkwJHjIHrmLMkLbMVkvGYxfSaC9ldHFBBvUdpsLPA+wB5pbzHT
   tXCxXk9Fg5kKF9pAz0Xja7WhfgBtJyKqxgYkL9d0VS5BHBxRN6UdtaJk5
   pfpHG/1LkEaN4IQBgV6QXtb5KE6gWjT+lRiraNigu/PvolcMFXThomp/g
   XuOa5wNkxuT58KjNLITFedbS/OFQkHZMKWOpU8A04QakVsTLal3qI41I2
   FvVZcDKZ5qd9Bggv4NdBY3ntHRV9/67s/HsyUlUMWopO7aiO8lsOeny7b
   mDfI+j2mYA2kjdwGoVOcfdXh3SyivRG4Zhh2NtQwqfQnKtrpAx9dLB3WU
   Q==;
X-CSE-ConnectionGUID: H1Frq0n8SeaTmHWK3hU47Q==
X-CSE-MsgGUID: FNFHWMrZS1yPSEmAxJj8wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="145149"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="145149"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 16:01:50 -0700
X-CSE-ConnectionGUID: oAyKfhRUQ3GzUzCQDMCTzA==
X-CSE-MsgGUID: UqNcUvhNQJuGrEzYtFoomQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="301945664"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.108.42]) ([10.125.108.42])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 16:01:49 -0700
Message-ID: <cc202de5-87ad-4a87-9e06-73ceb0fd0113@intel.com>
Date: Fri, 11 Sep 2026 16:01:48 -0700
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: ABI: sysfs-driver-dma-idxd: Fix the kernel
 version 6.20.0
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Vinod Koul <vkoul@kernel.org>
Cc: Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Yi Sun <yi.sun@intel.com>, linux-kernel@vger.kernel.org,
 Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org
References: <20260911225737.11411-1-kmehltretter@gmail.com>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <20260911225737.11411-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/11/26 3:57 PM, Karl Mehltretter wrote:
> There is no kernel 6.20: the release after 6.19 was 7.0. The entry came
> in with commit 8308510b9365 ("dmaengine: idxd: Expose DSA3.0
> capabilities through sysfs"), first released in v7.0-rc1. Say 7.0.
> 
> Fixes: 8308510b9365 ("dmaengine: idxd: Expose DSA3.0 capabilities through sysfs")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>  Documentation/ABI/stable/sysfs-driver-dma-idxd | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/stable/sysfs-driver-dma-idxd b/Documentation/ABI/stable/sysfs-driver-dma-idxd
> index 08d030159f0921b1796b19a0fa30e74c96a731bf..5be4e2d5775ff4c6e4bc82c92bf974cb8fdc64da 100644
> --- a/Documentation/ABI/stable/sysfs-driver-dma-idxd
> +++ b/Documentation/ABI/stable/sysfs-driver-dma-idxd
> @@ -138,7 +138,7 @@ Description:	The last executed device administrative command's status/error.
>  
>  What:		/sys/bus/dsa/devices/dsa<m>/dsacaps
>  Date:		April 5, 2026
> -KernelVersion:	6.20.0
> +KernelVersion:	7.0
>  Contact:	dmaengine@vger.kernel.org
>  Description:	The DSA3 specification introduces three new capability
>  		registers: dsacap[0-2]. User components (e.g., configuration

