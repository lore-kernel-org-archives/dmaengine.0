Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D751A38E10F
	for <dmaengine@vger.kernel.org>; Wed, 17 Jun 2026 12:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781699255; cv=none; b=TAAK6IPfyFVFFceoXRem896nG0waVLJI7qIjpSKICynyaUuIp4hpZdDj+KIPdn3trJFhxQwA1cS0mtlmYTlDH8p5SxXRGIifrOXarx1IhFG+b4/gv0+TTwmdAbV2226AMwtqgR9skapJ0QzSw3e3yW+PtbtHHktcabBycOZKHkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781699255; c=relaxed/simple;
	bh=coGTH+ai/EdtJ/pV8rzRoim16icEfnXu3izHfsRuO3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K/q2eFQ8b7Q6X1S/JilELoWok3+W+mi/k4o8xYsyfUjJdAE89oYGMruRR8UJTWhXvo8LOu0HBicaXKnIW0D2rJzuwWZcwkDwe/5vK5NfnODXMJzCrjq+krSt5A07zDmEosnY8pPZldKs9mkjhZmG84jF6pugpv73C3F6WWwumV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=a7KySyGe; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="a7KySyGe"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781699241; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=UOaeKlTEqnKfX3m8cG2ZAXAIi2ATpKcn29L6O+YG3oc=;
	b=a7KySyGepPC+lmMsVg0OPCeieQ3hqH7o/K/x82L0y7awdLRoZHdGd2DChhuzC/Z1xYsSqjat5P9Q7cvnRgQ8j3snlIhuLao085YA9zhC/W51FK/5R5ecMxzmXBS2k7CR6/kVoSg6B/0s9E9usrRa2JV97hKRwlHOT6imVnSKn5I=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0X53j-uN_1781699239;
Received: from 30.178.84.6(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0X53j-uN_1781699239 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 17 Jun 2026 20:27:20 +0800
Message-ID: <e94a190f-c6da-4390-8f0b-183e39a773d3@linux.alibaba.com>
Date: Wed, 17 Jun 2026 20:27:18 +0800
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dmaengine: idxd: Fix use-after-free of idxd_wq
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, Xunlei Pang <xlpang@linux.alibaba.com>,
 oliver.yang@linux.alibaba.com
References: <20260415095030.42183-1-kanie@linux.alibaba.com>
 <87tsstwt1p.fsf@intel.com>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <87tsstwt1p.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Vinicius,
     I notice that this patch is still not merged
into mainline, could you plz merge this patch?

Best Regards,
Guixin Liu

在 2026/4/30 01:54, Vinicius Costa Gomes 写道:
> Guixin Liu <kanie@linux.alibaba.com> writes:
>
>> We found an idxd_wq use-after-free issue with kasan
>> when remove the idxd PCI device:
>>
>> BUG: KASAN: slab-use-after-free in idxd_device_drv_remove+0x1f8/0x240 [idxd]
>> Call Trace:
>>    <TASK>
>>    dump_stack_lvl+0x32/0x50
>>    print_address_description.constprop.0+0x2c/0x390
>>    ? idxd_device_drv_remove+0x1f8/0x240 [idxd]
>>    print_report+0xba/0x280
>>    ? kasan_addr_to_slab+0x9/0xa0
>>    ? idxd_device_drv_remove+0x1f8/0x240 [idxd]
>>    kasan_report+0xab/0xe0
>>    ? idxd_device_drv_remove+0x1f8/0x240 [idxd]
>>    idxd_device_drv_remove+0x1f8/0x240 [idxd]
>>    device_release_driver_internal+0x391/0x560
>>    bus_remove_device+0x1f5/0x3f0
>>    device_del+0x392/0x990
>>    ? __pfx_device_del+0x10/0x10
>>    ? kobject_cleanup+0x117/0x360
>>    ? idxd_unregister_devices+0x229/0x320 [idxd]
>>    device_unregister+0x13/0xa0
>>    idxd_remove+0x4f/0x1b0 [idxd]
>>    pci_device_remove+0xa7/0x1d0
>>    device_release_driver_internal+0x391/0x560
>>    ? pci_pme_active+0x1e/0x450
>>    pci_stop_bus_device+0x10a/0x150
>>    pci_stop_and_remove_bus_device_locked+0x16/0x30
>>    remove_store+0xcf/0xe0
>>
>> Freed by task 15535:
>>    kasan_save_stack+0x1c/0x40
>>    kasan_set_track+0x21/0x30
>>    kasan_save_free_info+0x27/0x40
>>    ____kasan_slab_free+0x171/0x240
>>    slab_free_freelist_hook+0xde/0x190
>>    __kmem_cache_free+0x19e/0x310
>>    device_release+0x98/0x210
>>    kobject_cleanup+0x102/0x360
>>    idxd_unregister_devices+0xb3/0x320 [idxd]
>>    dxd_remove+0x3f/0x1b0 [idxd]
>>    pci_device_remove+0xa7/0x1d0
>>    device_release_driver_internal+0x391/0x560
>>    pci_stop_bus_device+0x10a/0x150
>>    pci_stop_and_remove_bus_device_locked+0x16/0x30
>>    remove_store+0xcf/0xe0
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
> All questions that I had after the AI review are handled:
>
> Acked-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
>
>
> Cheers,

