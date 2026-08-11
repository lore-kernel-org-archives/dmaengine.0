Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E6633556D;
	Tue, 11 Aug 2026 17:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786470596; cv=none; b=D921czaIAlXmqk8kdwEVJFUB4twgUTHdWUo1L6uKj6z/HT722QpUr1VrsboFTq14w9c+2t0HlNioznCt9wIcBLj37UYFhNJYP9VREBXTRnrDXnsEAaIEi7kYyJL/4Q4WTrCceuOBDHLc2lDn/VpMUa1Qo+0p28rcCoxw5QMAeV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786470596; c=relaxed/simple;
	bh=Y6ijU6heLtNsNMF5Owm9xErDWTQFc24Fg7EgNsGzdVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3+7zexfWR56laB1tNZJcimzIOkPpEMlZFMlvLjne7BiQc5i/FB2NKm2T4jtiNty/evf+b6aVeU8/cTVjLb/NqkMzSKFXWI1MpqLgki27uH1lHVa20TSNeHzDWNYkIET9XtGJl6CVq5XjTKhZ5xNThZQzqK1jcsP7h3NTW1vKiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNNusXlQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNNusXlQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492651F000E9;
	Tue, 11 Aug 2026 17:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786470595;
	bh=UGXIFB1Wf3r6c2EOpgMJ+G5aqA2QpstTWpzHJL+oBKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CNNusXlQu8z1SLg/XJ0n4W5OBtE5I3SR/+6NwJCR3745DdP4mHtyF+yD9yqt2MyC/
	 15cl1zYt6LxkhnO3ysAUDSjPfaoTqSdhT1ubHHGFo+s6siVI5rHImD5RLL9XzBKhw6
	 lRuT+rNHov2hb5vP/DFFjSNRPOcc8eudGf9choFUvpp7o/Sqj3T6NT7NFgGD4lst0E
	 leFmqYhhPYF7hfR28JdtRJ63zSN+5w4fGUqHUppLsXNpkKb/JUwRypjIqRsuJYFePj
	 AB3fTsBloSxgOnZSbFuqdS6eB/oqM/AApaW66UdRh0urOPIlGG1nJcywk7DwdfOpEr
	 iGWvsCxEZEOUA==
Date: Tue, 11 Aug 2026 23:19:50 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v3 02/34] dmaengine: back channel BH helpers with WQ_BH
Message-ID: <antgvm7jj7eBtDjR@vaman>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <442747fea2d831d2d6257e15a984a494bd7ad6ec.1786384168.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <442747fea2d831d2d6257e15a984a494bd7ad6ec.1786384168.git.allen.lkml@gmail.com>

On 10-08-26, 11:09, Allen Pais wrote:
> Replace the tasklet implementation of the channel BH helpers with a
> dedicated WQ_BH | WQ_PERCPU workqueue. The public dmaengine_*_bh() API and
> its softirq execution context remain unchanged.
> 
> Keep the workqueue operations internal to dmaengine. Drain scheduled work
> in dmaengine_kill_bh() to preserve the completion semantics of
> tasklet_kill().

Thanks Allen, this lgtm. I am asking for to test the series and report
any issues. If all is good, I plan to pick this up in 3 weeks time after
rc1. 

> 
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
>  drivers/dma/dmaengine.c   | 59 ++++++++++++++++++++++++++++++++-------
>  include/linux/dmaengine.h | 10 +++----
>  2 files changed, 54 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index d8fc7eb71b48..e00f73a18e99 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -54,6 +54,7 @@
>  #include <linux/rcupdate.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> +#include <linux/workqueue.h>
>  
>  #include "dmaengine.h"
>  
> @@ -61,6 +62,7 @@ static DEFINE_MUTEX(dma_list_mutex);
>  static DEFINE_IDA(dma_ida);
>  static LIST_HEAD(dma_device_list);
>  static long dmaengine_ref_count;
> +static struct workqueue_struct *dmaengine_bh_wq;
>  
>  /* --- debugfs implementation --- */
>  #ifdef CONFIG_DEBUG_FS
> @@ -1428,9 +1430,34 @@ static void dmaengine_destroy_unmap_pool(void)
>  	}
>  }
>  
> -static void dma_chan_bh_entry(struct tasklet_struct *tasklet)
> +static void dmaengine_destroy_bh_wq(void)
>  {
> -	struct dma_chan *chan = from_tasklet(chan, tasklet, bh_tasklet);
> +	if (!dmaengine_bh_wq)
> +		return;
> +
> +	destroy_workqueue(dmaengine_bh_wq);
> +	dmaengine_bh_wq = NULL;
> +}
> +
> +static bool dmaengine_queue_bh_work(struct work_struct *work)
> +{
> +	if (WARN_ON(!dmaengine_bh_wq))
> +		return false;
> +
> +	return queue_work(dmaengine_bh_wq, work);
> +}
> +
> +static void dmaengine_flush_bh_work(struct work_struct *work)
> +{
> +	if (!work)
> +		return;
> +
> +	flush_work(work);
> +}
> +
> +static void dma_chan_bh_entry(struct work_struct *work)
> +{
> +	struct dma_chan *chan = container_of(work, struct dma_chan, bh_work);
>  	dmaengine_bh_work_fn fn = READ_ONCE(chan->bh_work_fn);
>  
>  	if (fn)
> @@ -1446,7 +1473,7 @@ void dmaengine_init_bh(struct dma_chan *chan, dmaengine_bh_work_fn fn)
>  		return;
>  
>  	chan->bh_work_fn = fn;
> -	tasklet_setup(&chan->bh_tasklet, dma_chan_bh_entry);
> +	INIT_WORK(&chan->bh_work, dma_chan_bh_entry);
>  	chan->bh_work_initialized = true;
>  }
>  EXPORT_SYMBOL_GPL(dmaengine_init_bh);
> @@ -1456,8 +1483,7 @@ bool dmaengine_schedule_bh(struct dma_chan *chan)
>  	if (WARN_ON(!chan->bh_work_initialized))
>  		return false;
>  
> -	tasklet_schedule(&chan->bh_tasklet);
> -	return true;
> +	return dmaengine_queue_bh_work(&chan->bh_work);
>  }
>  EXPORT_SYMBOL_GPL(dmaengine_schedule_bh);
>  
> @@ -1466,7 +1492,7 @@ void dmaengine_kill_bh(struct dma_chan *chan)
>  	if (!chan->bh_work_initialized)
>  		return;
>  
> -	tasklet_kill(&chan->bh_tasklet);
> +	dmaengine_flush_bh_work(&chan->bh_work);
>  }
>  EXPORT_SYMBOL_GPL(dmaengine_kill_bh);
>  
> @@ -1666,15 +1692,28 @@ EXPORT_SYMBOL_GPL(dma_run_dependencies);
>  
>  static int __init dma_bus_init(void)
>  {
> -	int err = dmaengine_init_unmap_pool();
> +	int err;
>  
> +	dmaengine_bh_wq = alloc_workqueue("dmaengine_bh",
> +					  WQ_BH | WQ_PERCPU, 0);
> +	if (!dmaengine_bh_wq)
> +		return -ENOMEM;
> +
> +	err = dmaengine_init_unmap_pool();
>  	if (err)
> -		return err;
> +		goto err_destroy_wq;
>  
>  	err = class_register(&dma_devclass);
> -	if (!err)
> -		dmaengine_debugfs_init();
> +	if (err)
> +		goto err_destroy_pool;
>  
> +	dmaengine_debugfs_init();
> +	return 0;
> +
> +err_destroy_pool:
> +	dmaengine_destroy_unmap_pool();
> +err_destroy_wq:
> +	dmaengine_destroy_bh_wq();
>  	return err;
>  }
>  arch_initcall(dma_bus_init);
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index a1437bdbda9b..9f1a5405f6b0 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -12,7 +12,7 @@
>  #include <linux/scatterlist.h>
>  #include <linux/bitmap.h>
>  #include <linux/types.h>
> -#include <linux/interrupt.h>
> +#include <linux/workqueue.h>
>  #include <asm/page.h>
>  
>  /**
> @@ -339,9 +339,9 @@ struct dma_router {
>   * @router: pointer to the DMA router structure
>   * @route_data: channel specific data for the router
>   * @private: private data for certain client-channel associations
> - * @bh_tasklet: bottom-half tasklet stored per-channel
> - * @bh_work_fn: callback executed when @bh_tasklet runs
> - * @bh_work_initialized: indicates whether @bh_tasklet has been initialized
> + * @bh_work: bottom-half work item stored per-channel
> + * @bh_work_fn: callback executed when @bh_work runs
> + * @bh_work_initialized: indicates whether @bh_work has been initialized
>   */
>  struct dma_chan {
>  	struct dma_device *device;
> @@ -367,7 +367,7 @@ struct dma_chan {
>  	void *route_data;
>  
>  	void *private;
> -	struct tasklet_struct bh_tasklet;
> +	struct work_struct bh_work;
>  	dmaengine_bh_work_fn bh_work_fn;
>  	bool bh_work_initialized;
>  };
> -- 
> 2.43.0

-- 
~Vinod
