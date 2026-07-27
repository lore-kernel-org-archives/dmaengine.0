Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD3437F312;
	Mon, 27 Jul 2026 20:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184731; cv=none; b=rchdhCYZ6Pxi4QmwQ+Nh6SwNf2jUUQ4QPVHB/Fd6R49PHv9gpeHCdHzQZi+vO0tIXpOUPtSM4S15f9uHGCZtLfSlv1AxwAsxXw70bM2ennMwX2MCPdGgj1jVOTwM8v1+6WQBYumC3cWcVKtsbA7363i+qswQ1U0VOccuwkMNoms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184731; c=relaxed/simple;
	bh=diuE6tGGuq6hfTBuXi9dNoVvm1OGDS+i6KspaPExI8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JtG/ODhSRiBGnqFxQMiogPW/2vsEi4o64zN0q3MUy1lC6xwEvZ7YcJRXdEt6GXv5vw30ERrie9+Ptkw77CQYthnHU+eJVMlILdSsNcur67nR2z/JigLGC43KnPNv8Q5KTUX5Yboxf+JfzIGSJStsDV0lGLoPLmYNGtL2SnBx+P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uis3wYTs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uis3wYTs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785184729; x=1816720729;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=diuE6tGGuq6hfTBuXi9dNoVvm1OGDS+i6KspaPExI8E=;
  b=Uis3wYTsqBrA4vblGNWpohaiHexP1hkL0Wk/MkkGMoyBTaxXDa97jqoe
   h/WAxFJafIohfGuonhFaWOuP4E/dD5LXLc8BAXiDEEu1Pn5gt2f6wfM/y
   FRGULMAMifpzQITto0nWLeq1rvdT97/PuX/v1W2A8EhgZuZyKdTUq7BVi
   JJZU+i7Unv3ZCX5KEKbXG2RySyLzwCQAOhC/nzgHG32P5Oa71fGofimKf
   CNiB0WgiAQlqZrWvAknfjIBgLQH37/hQcZ1Me4mGga4g0trcEjdX53Ta4
   SwStbVmX82u+uoN4qkLupaCtTEJFUHNoO3aaU0SN63bMM7/124l6Et713
   A==;
X-CSE-ConnectionGUID: HQmiG+haQei1bpqOv+XOFg==
X-CSE-MsgGUID: lp8BKlmRS4mOnjhWLOgC6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="88300859"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="88300859"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 13:38:48 -0700
X-CSE-ConnectionGUID: 226Q3fV0QhCYgR8+mzCPbQ==
X-CSE-MsgGUID: 31ROXGQwTJGDub6rKj4FXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="253173039"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO [10.125.111.47]) ([10.125.111.47])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 13:38:47 -0700
Message-ID: <b7bfce9d-d417-4265-8b0f-5de8cb3cea29@intel.com>
Date: Mon, 27 Jul 2026 13:38:46 -0700
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/64] dmaengine: ioat: convert cleanup tasklet to
 dma_chan BH
To: Allen Pais <allen.lkml@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 David Matlack <dmatlack@google.com>, Lukas Wunner <lukas@wunner.de>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <325f449ad6fca109ec1e8c34e4e12c1952272a8f.1785183549.git.allen.lkml@gmail.com>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <325f449ad6fca109ec1e8c34e4e12c1952272a8f.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/27/26 1:28 PM, Allen Pais wrote:
> Replace the per-channel tasklet with the shared dma_chan BH helper.
> The handler continues to run in softirq context while dmaengine owns
> the common scheduling and teardown mechanism.
> 
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>

Acked-by: Dave Jiang <dave.jiang@intel.com>


> ---
>  drivers/dma/ioat/dma.c  | 14 +++++++-------
>  drivers/dma/ioat/dma.h  |  3 +--
>  drivers/dma/ioat/init.c |  2 +-
>  3 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/dma/ioat/dma.c b/drivers/dma/ioat/dma.c
> index ee93b029f9e3..827b46c6354a 100644
> --- a/drivers/dma/ioat/dma.c
> +++ b/drivers/dma/ioat/dma.c
> @@ -110,7 +110,7 @@ irqreturn_t ioat_dma_do_interrupt(int irq, void *data)
>  	for_each_set_bit(bit, &attnstatus, BITS_PER_LONG) {
>  		ioat_chan = ioat_chan_by_index(instance, bit);
>  		if (test_bit(IOAT_RUN, &ioat_chan->state))
> -			tasklet_schedule(&ioat_chan->cleanup_task);
> +			dma_chan_schedule_bh(&ioat_chan->dma_chan);
>  	}
>  
>  	writeb(intrctrl, instance->reg_base + IOAT_INTRCTRL_OFFSET);
> @@ -127,7 +127,7 @@ irqreturn_t ioat_dma_do_interrupt_msix(int irq, void *data)
>  	struct ioatdma_chan *ioat_chan = data;
>  
>  	if (test_bit(IOAT_RUN, &ioat_chan->state))
> -		tasklet_schedule(&ioat_chan->cleanup_task);
> +		dma_chan_schedule_bh(&ioat_chan->dma_chan);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -161,11 +161,11 @@ void ioat_stop(struct ioatdma_chan *ioat_chan)
>  	/* flush inflight timers */
>  	timer_delete_sync(&ioat_chan->timer);
>  
> -	/* flush inflight tasklet runs */
> -	tasklet_kill(&ioat_chan->cleanup_task);
> +	/* flush inflight BH runs */
> +	dma_chan_kill_bh(&ioat_chan->dma_chan);
>  
>  	/* final cleanup now that everything is quiesced and can't re-arm */
> -	ioat_cleanup_event(&ioat_chan->cleanup_task);
> +	ioat_cleanup_event(&ioat_chan->dma_chan);
>  }
>  
>  static void __ioat_issue_pending(struct ioatdma_chan *ioat_chan)
> @@ -690,9 +690,9 @@ static void ioat_cleanup(struct ioatdma_chan *ioat_chan)
>  	spin_unlock_bh(&ioat_chan->cleanup_lock);
>  }
>  
> -void ioat_cleanup_event(struct tasklet_struct *t)
> +void ioat_cleanup_event(struct dma_chan *c)
>  {
> -	struct ioatdma_chan *ioat_chan = from_tasklet(ioat_chan, t, cleanup_task);
> +	struct ioatdma_chan *ioat_chan = to_ioat_chan(c);
>  
>  	ioat_cleanup(ioat_chan);
>  	if (!test_bit(IOAT_RUN, &ioat_chan->state))
> diff --git a/drivers/dma/ioat/dma.h b/drivers/dma/ioat/dma.h
> index e8a880f338c6..4bdb1ae937e4 100644
> --- a/drivers/dma/ioat/dma.h
> +++ b/drivers/dma/ioat/dma.h
> @@ -111,7 +111,6 @@ struct ioatdma_chan {
>  	struct ioatdma_device *ioat_dma;
>  	dma_addr_t completion_dma;
>  	u64 *completion;
> -	struct tasklet_struct cleanup_task;
>  	struct kobject kobj;
>  
>  /* ioat v2 / v3 channel attributes
> @@ -385,7 +384,7 @@ int ioat_reset_hw(struct ioatdma_chan *ioat_chan);
>  enum dma_status
>  ioat_tx_status(struct dma_chan *c, dma_cookie_t cookie,
>  		struct dma_tx_state *txstate);
> -void ioat_cleanup_event(struct tasklet_struct *t);
> +void ioat_cleanup_event(struct dma_chan *c);
>  void ioat_timer_event(struct timer_list *t);
>  int ioat_check_space_lock(struct ioatdma_chan *ioat_chan, int num_descs);
>  void ioat_issue_pending(struct dma_chan *chan);
> diff --git a/drivers/dma/ioat/init.c b/drivers/dma/ioat/init.c
> index 737496391109..314676e1cbc4 100644
> --- a/drivers/dma/ioat/init.c
> +++ b/drivers/dma/ioat/init.c
> @@ -765,7 +765,7 @@ ioat_init_channel(struct ioatdma_device *ioat_dma,
>  	list_add_tail(&ioat_chan->dma_chan.device_node, &dma->channels);
>  	ioat_dma->idx[idx] = ioat_chan;
>  	timer_setup(&ioat_chan->timer, ioat_timer_event, 0);
> -	tasklet_setup(&ioat_chan->cleanup_task, ioat_cleanup_event);
> +	dma_chan_init_bh(&ioat_chan->dma_chan, ioat_cleanup_event);
>  }
>  
>  #define IOAT_NUM_SRC_TEST 6 /* must be <= 8 */

