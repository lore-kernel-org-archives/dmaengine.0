Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793675203;
	b=3wYroJR1o+yRWLi0mhSeeaZpv+uFyVYUtTdtNJexIHkYt5hTiH5pzNfPh/7+6rybLDqo
	 p4ZC7Img1+NWIun6n2L965IKo9JEpa52UoGgfvGvLIqJkyi4GNwbL2qBD1iWZNrvbsUK0
	 KdnxkLHSUw2G1jNrISiqXVqbgnS6LBwMa9irf8zHlK8TKLhkfFWXqgRppCL4awSpVmOJc
	 XDdxstTlk7iltA/Gj0WqveIbeiNXb0NeIoyZBi0N/Npx6pbpcAegFKemvmY4uilj4M7Tf
	 0GChErfKyEFU//9iyJNR/kj6Jk9cLrqhjwpTNPlHmk+Z62NVjdJvqxNF1wzbrzc+k+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793675203;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ZXANpVCuJ4qy5gTEXXf6h/3KhfLrPNAUqqGRYxjpQ34=;
	b=W0s+QUOaInUIEjXalYjv0qg/C6oqBmUVJeFIThLAMEV2MbPo+3ahUc0v7KE4mkPS/C1z
	 VL6eTVFmL+6bFRpt1Mxllf81+ngIqvan2r62g7H7+GQ8hg5pUWTetxvvUDFlriX4NRfZF
	 fjiCZKZeVhOIRC2Nh9NygmU/mCys6pd+2Plov0DcZuTJXi/zy52fvhxrI6S3hOpvByKhv
	 GnZaBuyIBpbRSfA02+/DuiWJ+H9Xz1w0S+4TE6tTN2OyHCUVAgXQSnXlB4gxdjI4I2Phi
	 wuI3nMlgC40fINpDj+GAqO42doO+N1QoubeBMmApmNfiV0dKEcBYvB6HwBY/pOfVfqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=PjxkVWzO;
	arc=none smtp.remote-ip=115.124.30.110
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9D4606A327
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 03:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F9D4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=PjxkVWzO
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793675200; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=ZXANpVCuJ4qy5gTEXXf6h/3KhfLrPNAUqqGRYxjpQ34=;
	b=PjxkVWzO6sKPK2+BV4Nnyfj98LM5dDQ42foh/dCznYu2RS5FHuIclm5o3RhXTsiX4yLdvB7rOx0Mcwh9BL2YgkMT9biM4RK4g7OEFDs7qfb4uLquq4WHtuzLJRia6IfweYOmeYrkpTNLg/MiGZ4lyKuZqXepk6lMPgE7/w2DEEw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R641e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XE0djMh_1793675198;
Received: from 30.178.83.74(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XE0djMh_1793675198 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 03 Nov 2026 11:06:39 +0800
Message-ID: <5e80342d-c51f-4514-a8b3-49529cae60b5@linux.alibaba.com>
Date: Tue, 3 Nov 2026 11:06:38 +0800
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dmaengine: idxd: Fix use-after-free of idxd_wq
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, Xunlei Pang <xlpang@linux.alibaba.com>,
 oliver.yang@linux.alibaba.com
References: <20260415095030.42183-1-kanie@linux.alibaba.com>
 <87tsstwt1p.fsf@intel.com> <8733uql4qu.fsf@intel.com>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <8733uql4qu.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/1 07:05, Vinicius Costa Gomes 写道:
> Vinicius Costa Gomes <vinicius.gomes@intel.com> writes:
>
>> Guixin Liu <kanie@linux.alibaba.com> writes:
>>
>>> We found an idxd_wq use-after-free issue with kasan
>>> when remove the idxd PCI device:
>>>
>>> BUG: KASAN: slab-use-after-free in idxd_device_drv_remove+0x1f8/0x240 [idxd]
>>> Call Trace:
>>>   <TASK>
>>>   dump_stack_lvl+0x32/0x50
>>>   print_address_description.constprop.0+0x2c/0x390
>>>   ? idxd_device_drv_remove+0x1f8/0x240 [idxd]
>>>   print_report+0xba/0x280
>>>   ? kasan_addr_to_slab+0x9/0xa0
>>>   ? idxd_device_drv_remove+0x1f8/0x240 [idxd]
>>>   kasan_report+0xab/0xe0
>>>   ? idxd_device_drv_remove+0x1f8/0x240 [idxd]
>>>   idxd_device_drv_remove+0x1f8/0x240 [idxd]
>>>   device_release_driver_internal+0x391/0x560
>>>   bus_remove_device+0x1f5/0x3f0
>>>   device_del+0x392/0x990
>>>   ? __pfx_device_del+0x10/0x10
>>>   ? kobject_cleanup+0x117/0x360
>>>   ? idxd_unregister_devices+0x229/0x320 [idxd]
>>>   device_unregister+0x13/0xa0
>>>   idxd_remove+0x4f/0x1b0 [idxd]
>>>   pci_device_remove+0xa7/0x1d0
>>>   device_release_driver_internal+0x391/0x560
>>>   ? pci_pme_active+0x1e/0x450
>>>   pci_stop_bus_device+0x10a/0x150
>>>   pci_stop_and_remove_bus_device_locked+0x16/0x30
>>>   remove_store+0xcf/0xe0
>>>
>>> Freed by task 15535:
>>>   kasan_save_stack+0x1c/0x40
>>>   kasan_set_track+0x21/0x30
>>>   kasan_save_free_info+0x27/0x40
>>>   ____kasan_slab_free+0x171/0x240
>>>   slab_free_freelist_hook+0xde/0x190
>>>   __kmem_cache_free+0x19e/0x310
>>>   device_release+0x98/0x210
>>>   kobject_cleanup+0x102/0x360
>>>   idxd_unregister_devices+0xb3/0x320 [idxd]
>>>   dxd_remove+0x3f/0x1b0 [idxd]
>>>   pci_device_remove+0xa7/0x1d0
>>>   device_release_driver_internal+0x391/0x560
>>>   pci_stop_bus_device+0x10a/0x150
>>>   pci_stop_and_remove_bus_device_locked+0x16/0x30
>>>   remove_store+0xcf/0xe0
>>>
>>> In the idxd_remove() flow, when execution reaches
>>> idxd_unregister_devices(), all idxd_wq instances have already been
>>> freed. Subsequently, when device_unregister(idxd_confdev(idxd)) is
>>> executed, it calls into idxd_device_drv_remove() which accesses the
>>> already-freed idxd_wq. This fix resolves the issue by calling
>>> device_release_driver() before idxd_unregister_devices().
>>>
>>> Fixes: 98da0106aac0d ("dmanegine: idxd: fix resource free ordering on driver removal")
>>> Co-developed-by: Shuai Xue <xueshuai@linux.alibaba.com>
>>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>>> Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
>>> ---
>> All questions that I had after the AI review are handled:
>>
>> Acked-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
>>
> Messing with /sys/bus/pci/drivers/idxd/unbind I was able to reproduce
> this issue without KASAN (KASAN makes it 100% reproducible), so:
>
> Tested-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
>
>
> Cheers,
Thanks for the testing, could this patch be applied in 7.4?

Best Regards,
Guixin Liu

