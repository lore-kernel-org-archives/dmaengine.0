Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86834A2A7C;
	Tue, 13 Oct 2026 22:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930892; cv=none; b=dXp09v9O2QojX+dN+vuCHcDhgrQUD4NClp0CwhCpUpGFaG5PdO+tjUlXjXZM4WfYGuaUpu/G2O4UTwR6ERHTFKKaZKShCOeL7hN5x0j2igQcRiHrhhpZnFg60/PvMxV2/YtDf51e3i3CkWH5lbDei5ovfRNB9uoGWLnmdoL9ZWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930892; c=relaxed/simple;
	bh=LhaxcUeXKQMORGDtbxuV5twJ2wtDdlWnUIbGVqMIScQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mMTsDBDNDWP/pj+sopuTtUQPU37BijpnfgtoIB24OEpxeqGQh5pb8cKKtaPoavNukW8riT4biikQ9UfPxEWSOtSUZlT9VoA049xAC/4ONQnhIPkAJalJw7p9YIy+mLA6uROE4e4KqIRXgIG0H5w4uPrmg9mQTp26Lyi8pZd9Az8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a2SyyKm1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a2SyyKm1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791930889; x=1823466889;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=LhaxcUeXKQMORGDtbxuV5twJ2wtDdlWnUIbGVqMIScQ=;
  b=a2SyyKm1xPC5BjI601yQDh0/5urmugRlga+GMgk29h80KZ2vYDs21y4j
   TEg9EmkUEWClif92Cwpif89XN9KXuLKqVxbWQnLTV9Wrgj32T65vCW0eB
   Ozw9DhtyrrNLSf095XEbNE/8BkS0Zw0mNOhnrqWxbW+kSsaMxIE945/hD
   I/0baPD2osEU5g1yXjYa4w1rAQ59adSNWztP1WEiieOIpnIABqNDDODRg
   R51jgDmI7Mc0Bprkw8GnruVIIuUf6d6WR8HGWhei9tzi5SyzWDwS1EMIe
   +HDZrVsMQSaFvxPXWbRTBq2ozvO6Bcjo3RRzCL1TTgUOzO8Pr6dnCN8zP
   w==;
X-CSE-ConnectionGUID: XDOf6u6FSp6UhmGxGNwkhQ==
X-CSE-MsgGUID: P9KxnHZHSOmKkdtmLBA0SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="656119"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="656119"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 15:34:48 -0700
X-CSE-ConnectionGUID: 3QdeiE1fSnapkkWRK+5qxQ==
X-CSE-MsgGUID: 0lBsFLpKS6mjz3aj3ZFe7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1350602"
Received: from vcostago-desk1.jf.intel.com (HELO vcostago-desk1) ([10.241.243.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 15:34:47 -0700
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
To: Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, Frank
 Li <Frank.Li@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>, Shuai Xue
 <xueshuai@linux.alibaba.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, Steve Wahl
 <steve.wahl@hpe.com>
Subject: Re: [PATCH 1/6] dmaengine: idxd: Do not call destroy_workqueue with
 null idxd->wq
In-Reply-To: <88903331-7dff-4732-b443-10e8fcb9699f@intel.com>
References: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
 <20261012-wt-idxd-fixes-v1-1-30a35a445077@intel.com>
 <88903331-7dff-4732-b443-10e8fcb9699f@intel.com>
Date: Tue, 13 Oct 2026 15:34:45 -0700
Message-ID: <87mrshjkl6.fsf@intel.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dave Jiang <dave.jiang@intel.com> writes:

> On 10/12/26 2:38 PM, Vinicius Costa Gomes wrote:
>> From: Steve Wahl <steve.wahl@hpe.com>
>> 
>> Error paths within idxd_pci_probe_alloc and related functions end up
>> calling destroy_workqueue with a null pointer, from
>> idxd_conf_device_release via put_device, because that allocation has
>> not yet occurred when the error is hit.
>> 
>> This was encountered running in a kexec'd kdump kernel with reduced
>> resources, causing the "Device is HALTED!" branch in
>> idxd_device_init_reset to be taken.
>> 
>> In idxd_conf_device_release, check that the workqueue has been
>> allocated before trying to destroy it.
>> 
>> Fixes: 3d33de353b1f ("dmaengine: idxd: Fix not releasing workqueue on .release()")
>> Signed-off-by: Steve Wahl <steve.wahl@hpe.com>
>> Acked-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
> ^ needs a sign off rather than an ack since you posted his patch?
>

Yeah, will add my sign off. 


Cheers,
-- 
Vinicius
