Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53701476CC3
	for <dmaengine@vger.kernel.org>; Wed, 30 Sep 2026 23:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790809538; cv=none; b=ExFSaCgQYjXx6W++M5tUJH+7GLUtx5SujAVqH3IssYRcVodmh4PiZVOvaDGYKmP0GEPuAlB+ohbp+zxKkrseBwPxBpSOBt0s2yvOg5RZ8tm3lqf3otg5hEtAZIG04dAkI0yf6kBagsPppfjdr7IK7MHGg049BGLl2Z/cN00UAaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790809538; c=relaxed/simple;
	bh=CYDGSPSpaGuMhYsn11CQdhAo2ZiISTRskHxVJqgQYCk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DF6trTLJS2YUeXuWjumldb4rsJaaGCoC37Noc30IiT8Njb6pfGRGd9b0OS5vtHJO0WAR0NMmMwQw9F+F5zrWS/4mJLvaOtBB0bhPMqZ+uPFAjyYcsrDpzML6w1eWZChduhWHnWtuU1274MJzFAz1cOeHwR8sAqLfNwsLfxCCJxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dNnNyVEJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dNnNyVEJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790809534; x=1822345534;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=CYDGSPSpaGuMhYsn11CQdhAo2ZiISTRskHxVJqgQYCk=;
  b=dNnNyVEJ/9kbUieFIsy73Gix4VqmWb2WR2mJg/c124bblB2PfghARQNy
   IqzibtwUJ/P6D/oU39c6LEJ1mkd4IZE8CDcfJDMSR+YOXAgdHHIO6FB5B
   ph3gdBvxoN/T/Y7ifYQS6yl0Sd8mTk1HrdhB1XWz7DuiA+dcTQV6X4Fzn
   S1wBP2mxJLj+YS53D6LaACXa2nBUzWW+K6DseOGg+5vHLXVqihvMKsJuw
   nSxis4hlqRNiTD6jiyuYlV/XPY1oGVlrJ5WnCbcsJa2myKGpjTS3knLV3
   s+aXPLI7jAXs/LAnyVWHpcvIIwaqrzdr/tkhTYXmNA4kCw+pqvAn00aQg
   Q==;
X-CSE-ConnectionGUID: aRAk6VWbScK46uz86DqKLA==
X-CSE-MsgGUID: Yi2eisDWQMu7dWuY8WJhuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90511918"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="90511918"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 16:05:30 -0700
X-CSE-ConnectionGUID: tWm0P6BeQWCktwpKyt6GWQ==
X-CSE-MsgGUID: YHw/FE9dRoCJgi75uhM6Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="273630113"
Received: from vcostago-desk1.jf.intel.com (HELO vcostago-desk1) ([10.88.27.141])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 16:05:30 -0700
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
To: Guixin Liu <kanie@linux.alibaba.com>, Dave Jiang <dave.jiang@intel.com>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, Xunlei Pang <xlpang@linux.alibaba.com>,
 oliver.yang@linux.alibaba.com
Subject: Re: [PATCH v2] dmaengine: idxd: Fix use-after-free of idxd_wq
In-Reply-To: <87tsstwt1p.fsf@intel.com>
References: <20260415095030.42183-1-kanie@linux.alibaba.com>
 <87tsstwt1p.fsf@intel.com>
Date: Wed, 30 Sep 2026 16:05:29 -0700
Message-ID: <8733uql4qu.fsf@intel.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vinicius Costa Gomes <vinicius.gomes@intel.com> writes:

> Guixin Liu <kanie@linux.alibaba.com> writes:
>
>> We found an idxd_wq use-after-free issue with kasan
>> when remove the idxd PCI device:
>>
>> BUG: KASAN: slab-use-after-free in idxd_device_drv_remove+0x1f8/0x240 [idxd]
>> Call Trace:
>>   <TASK>
>>   dump_stack_lvl+0x32/0x50
>>   print_address_description.constprop.0+0x2c/0x390
>>   ? idxd_device_drv_remove+0x1f8/0x240 [idxd]
>>   print_report+0xba/0x280
>>   ? kasan_addr_to_slab+0x9/0xa0
>>   ? idxd_device_drv_remove+0x1f8/0x240 [idxd]
>>   kasan_report+0xab/0xe0
>>   ? idxd_device_drv_remove+0x1f8/0x240 [idxd]
>>   idxd_device_drv_remove+0x1f8/0x240 [idxd]
>>   device_release_driver_internal+0x391/0x560
>>   bus_remove_device+0x1f5/0x3f0
>>   device_del+0x392/0x990
>>   ? __pfx_device_del+0x10/0x10
>>   ? kobject_cleanup+0x117/0x360
>>   ? idxd_unregister_devices+0x229/0x320 [idxd]
>>   device_unregister+0x13/0xa0
>>   idxd_remove+0x4f/0x1b0 [idxd]
>>   pci_device_remove+0xa7/0x1d0
>>   device_release_driver_internal+0x391/0x560
>>   ? pci_pme_active+0x1e/0x450
>>   pci_stop_bus_device+0x10a/0x150
>>   pci_stop_and_remove_bus_device_locked+0x16/0x30
>>   remove_store+0xcf/0xe0
>>
>> Freed by task 15535:
>>   kasan_save_stack+0x1c/0x40
>>   kasan_set_track+0x21/0x30
>>   kasan_save_free_info+0x27/0x40
>>   ____kasan_slab_free+0x171/0x240
>>   slab_free_freelist_hook+0xde/0x190
>>   __kmem_cache_free+0x19e/0x310
>>   device_release+0x98/0x210
>>   kobject_cleanup+0x102/0x360
>>   idxd_unregister_devices+0xb3/0x320 [idxd]
>>   dxd_remove+0x3f/0x1b0 [idxd]
>>   pci_device_remove+0xa7/0x1d0
>>   device_release_driver_internal+0x391/0x560
>>   pci_stop_bus_device+0x10a/0x150
>>   pci_stop_and_remove_bus_device_locked+0x16/0x30
>>   remove_store+0xcf/0xe0
>>
>> In the idxd_remove() flow, when execution reaches
>> idxd_unregister_devices(), all idxd_wq instances have already been
>> freed. Subsequently, when device_unregister(idxd_confdev(idxd)) is
>> executed, it calls into idxd_device_drv_remove() which accesses the
>> already-freed idxd_wq. This fix resolves the issue by calling
>> device_release_driver() before idxd_unregister_devices().
>>
>> Fixes: 98da0106aac0d ("dmanegine: idxd: fix resource free ordering on driver removal")
>> Co-developed-by: Shuai Xue <xueshuai@linux.alibaba.com>
>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>> Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
>> ---
>
> All questions that I had after the AI review are handled:
>
> Acked-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
>

Messing with /sys/bus/pci/drivers/idxd/unbind I was able to reproduce
this issue without KASAN (KASAN makes it 100% reproducible), so:

Tested-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>


Cheers,
-- 
Vinicius
