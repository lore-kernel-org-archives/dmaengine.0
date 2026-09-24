Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44313DEFF1
	for <dmaengine@vger.kernel.org>; Thu, 24 Sep 2026 03:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790221705; cv=none; b=B0p6mACe9VA7sbFMntMMNN+0os1slWfh4SRL+xFHVK+587tdCbGQkDrKqfrbTdBmvyNIiVrjEABETyMiXVeGKNS7EGp0Ht65mMDDTtLZcTtOCcWLOilnYfnB+mLmlNpm47L4MjCaQwJ10CgAbutEwU3yHSFHzrpKOSDMFQBpIC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790221705; c=relaxed/simple;
	bh=RByC2KcCzKhQRQq1B560KSPnrjr0BWu/OeFuIe4raPQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=MqrQfCz7A0IGqzKz49Gr/R6Swc85Uy9WPRAP46GOJNNL7QV2buC/lvgoUDh1La7TwuWpNhFlWlA0Sf4sJGJ4pk+jg5GOoERnS2okzA3crPCXdwHYSqCNEjkiRe+owbfBWc0qYt+AZbxOqiCyL/LROxdxP+/Y5oKGlUQbZePrPGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=DShuNxFQ; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="DShuNxFQ"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790221691; h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
	bh=JkWkow8Jgt3ftkp3L7onfdgYR223Z1puDT1IK+zUdcQ=;
	b=DShuNxFQ0yB2JZZRagu7rR5aOBrgWj6vO0ElGN3zFoMDGTz+3m0pTSruOJrZUWGktpYnV/VxUK0AxFY8z9aMR3WmCHVXVAO9voG0ZLeEvpw7hcp5jYqpR5iuCD6Cw8jF0lFD1BCI2U4TowKSuhc+uMM84fqWET4GuBtK0esnEDY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R221e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XBYWXGR_1790221690;
Received: from 30.178.84.73(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XBYWXGR_1790221690 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 24 Sep 2026 11:48:11 +0800
Message-ID: <a8548bef-3a6e-4faf-975b-aba5fda89634@linux.alibaba.com>
Date: Thu, 24 Sep 2026 11:48:08 +0800
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dmaengine: idxd: Fix use-after-free of idxd_wq
From: Guixin Liu <kanie@linux.alibaba.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org, Xunlei Pang <xlpang@linux.alibaba.com>,
 oliver.yang@linux.alibaba.com,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Frank Li <Frank.Li@kernel.org>, Dave Jiang <dave.jiang@intel.com>
References: <20260415095030.42183-1-kanie@linux.alibaba.com>
In-Reply-To: <20260415095030.42183-1-kanie@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Vinod, could you please apply this patch? 
This patch was from a long time ago.

Best Regards,
Guixin Liu

在 2026/4/15 17:50, Guixin Liu 写道:
> We found an idxd_wq use-after-free issue with kasan
> when remove the idxd PCI device:
>
> BUG: KASAN: slab-use-after-free in idxd_device_drv_remove+0x1f8/0x240 [idxd]
> Call Trace:
>   <TASK>
>   dump_stack_lvl+0x32/0x50
>   print_address_description.constprop.0+0x2c/0x390
>   ? idxd_device_drv_remove+0x1f8/0x240 [idxd]
>   print_report+0xba/0x280
>   ? kasan_addr_to_slab+0x9/0xa0
>   ? idxd_device_drv_remove+0x1f8/0x240 [idxd]
>   kasan_report+0xab/0xe0
>   ? idxd_device_drv_remove+0x1f8/0x240 [idxd]
>   idxd_device_drv_remove+0x1f8/0x240 [idxd]
>   device_release_driver_internal+0x391/0x560
>   bus_remove_device+0x1f5/0x3f0
>   device_del+0x392/0x990
>   ? __pfx_device_del+0x10/0x10
>   ? kobject_cleanup+0x117/0x360
>   ? idxd_unregister_devices+0x229/0x320 [idxd]
>   device_unregister+0x13/0xa0
>   idxd_remove+0x4f/0x1b0 [idxd]
>   pci_device_remove+0xa7/0x1d0
>   device_release_driver_internal+0x391/0x560
>   ? pci_pme_active+0x1e/0x450
>   pci_stop_bus_device+0x10a/0x150
>   pci_stop_and_remove_bus_device_locked+0x16/0x30
>   remove_store+0xcf/0xe0
>
> Freed by task 15535:
>   kasan_save_stack+0x1c/0x40
>   kasan_set_track+0x21/0x30
>   kasan_save_free_info+0x27/0x40
>   ____kasan_slab_free+0x171/0x240
>   slab_free_freelist_hook+0xde/0x190
>   __kmem_cache_free+0x19e/0x310
>   device_release+0x98/0x210
>   kobject_cleanup+0x102/0x360
>   idxd_unregister_devices+0xb3/0x320 [idxd]
>   dxd_remove+0x3f/0x1b0 [idxd]
>   pci_device_remove+0xa7/0x1d0
>   device_release_driver_internal+0x391/0x560
>   pci_stop_bus_device+0x10a/0x150
>   pci_stop_and_remove_bus_device_locked+0x16/0x30
>   remove_store+0xcf/0xe0
>
> In the idxd_remove() flow, when execution reaches
> idxd_unregister_devices(), all idxd_wq instances have already been
> freed. Subsequently, when device_unregister(idxd_confdev(idxd)) is
> executed, it calls into idxd_device_drv_remove() which accesses the
> already-freed idxd_wq. This fix resolves the issue by calling
> device_release_driver() before idxd_unregister_devices().
>
> Fixes: 98da0106aac0d ("dmanegine: idxd: fix resource free ordering on driver removal")
> Co-developed-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
> ---
> v1 -> v2:
>   1. Call device_release_driver() in advance instead of swapping the order of
>      device_unregister() and idxd_unregister_devices().
>   2. Add Co-developed-by: Shuai Xue <xueshuai@linux.alibaba.com>.
>  drivers/dma/idxd/init.c | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
> index f1cfc7790d95..3b0a0363ca65 100644
> --- a/drivers/dma/idxd/init.c
> +++ b/drivers/dma/idxd/init.c
> @@ -1293,13 +1293,30 @@ static void idxd_remove(struct pci_dev *pdev)
>  {
>  	struct idxd_device *idxd = pci_get_drvdata(pdev);
>  
> +	/*
> +	 * The idxd sub-driver's remove callback (idxd_device_drv_remove())
> +	 * iterates idxd->wqs[] and accesses wq objects. We must unbind the
> +	 * sub-driver before idxd_unregister_devices() frees these objects,
> +	 * otherwise a use-after-free occurs.
> +	 *
> +	 * We cannot simply reorder device_unregister(idxd_confdev) before
> +	 * idxd_unregister_devices() because device_del() -> kobject_del()
> +	 * recursively removes the parent's sysfs directory, which destroys
> +	 * children's sysfs entries. Subsequent device_unregister() on the
> +	 * children then fails with "sysfs group 'power' not found".
> +	 *
> +	 * Use device_release_driver() to only unbind the driver (triggering
> +	 * idxd_device_drv_remove()) without touching sysfs. Then safely
> +	 * unregister children before the parent.
> +	 */
> +	device_release_driver(idxd_confdev(idxd));
>  	idxd_unregister_devices(idxd);
> +
>  	/*
> -	 * When ->release() is called for the idxd->conf_dev, it frees all the memory related
> -	 * to the idxd context. The driver still needs those bits in order to do the rest of
> -	 * the cleanup. However, we do need to unbound the idxd sub-driver. So take a ref
> -	 * on the device here to hold off the freeing while allowing the idxd sub-driver
> -	 * to unbind.
> +	 * When ->release() is called for the idxd->conf_dev, it frees all the
> +	 * memory related to the idxd context. The driver still needs those bits
> +	 * in order to do the rest of the cleanup. So take a ref on the device
> +	 * here to hold off the freeing.
>  	 */
>  	get_device(idxd_confdev(idxd));
>  	device_unregister(idxd_confdev(idxd));

