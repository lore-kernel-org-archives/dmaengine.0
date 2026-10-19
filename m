Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436003;
	b=YS5hVywVTRp+ntnNMzi4bAL1NxuIZbfv+SMIfnVz52hgVhth0spCBUgyjY0Mx25juAr6
	 r/U2Qbh876xZuyGlBZBjUDMVdzK3M9jQzGPGdCUPD6n0qfiRpIYKTFmd+ngaijiq9D1+3
	 QUmhm5R5LgDVhT8G3UB7nteCyizW+p+Rt0SIQy2VE4nkPk9jWgrCe5FhY7eMQ/N5YM/rB
	 gO2qZYd4Bz7FGzuENoV4T8rqdFE9ur0D5RD6VVqvlk586y5o4pJymgL7Pfq2WsdYF+R1Q
	 zSZcQDX9zB4c494FwKpMVeJZLNhLHxs+HjJW/MGCsTc8w4F51rcGEJnC4MMGbf7K2lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436003;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=/Heia7Js7NAOvaRAG4jjrS4ZbMF0t0P+D6MzkLv9q1o=;
	b=Lrm79OmFN6urysOxk6CXZGaZ4iOejION8FxbjWLXsF3+q5HuukQSnnm8n0T8I+1u0/ut
	 eknxUaTAPGAW9Cfq19SaY4WihrDQVbEixYeCu+xsm3OLdCYzxDDSZkK1WTt7pA6KW/352
	 FV74Sobz8mYFdZ1aE7sKsseSR8JHvziUFEsNZLkZwEYf2Krkrni7bRmqnj3RlNQk6FRwo
	 82EJoDZrqrSmOpEULHBsy2cG7qUlY4v571nWhfbliHNkTtW3wgpPQxo/QcQYM18MuGcP4
	 K2D8vnopBJzzkiRR8lNpDJo4T7i9LDWw02qFbWbvZ7Vx+5Qr3jxgL8LcjqA/7tD3EXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aBde19DD;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6426606A319;
	Mon, 19 Oct 2026 18:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6426606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aBde19DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792436003; x=1823972003;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VuEy7icT9fbTSCm+kMAIt0yogHe61LbU42LSDLjcECM=;
  b=aBde19DDW1A/mz+W0SRAbcFlWOBI+ieAryCeAxlipQaz0Zt7mEX+SR8T
   RdhY70h8cyyi7wv21b9CURKHDAZpo5FHtg4sauBJ2hyQEeoAay3v/56zX
   Zozf8AAWW2pM/eYqK3Zc4URMN3PGlJxcIC1yqtiexRs4Z1P8CfcWaFf5Q
   hzmiYEKQP4eHpP2Q3NMaw0bjYNXgZP3BDY8Lhi/qOrbpz3K3IDucfgQ3t
   HyAZD0D4Rk/EBxtnMqooY5ROLucAaXvPNGnNZCwyvMonKN2ThRq8qfocS
   ejW+OwnN0iQfNr98X9Py0uhxZY60R3Z5I4OohMGKquDNMl/VWCR9QcDrA
   w==;
X-CSE-ConnectionGUID: GVbQYatPT9aHJhmvslKItQ==
X-CSE-MsgGUID: H25z7J9IT8u+uJvEERac5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1157448"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1157448"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 11:53:14 -0700
X-CSE-ConnectionGUID: 2Y02/8JTSaCL9CIcCmXTsQ==
X-CSE-MsgGUID: wz7d++w5RuyoxnG8GVyj5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="4371319"
Received: from gabaabhi-mobl2.amr.corp.intel.com (HELO [10.125.111.28]) ([10.125.111.28])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 11:53:13 -0700
Message-ID: <d7a9311c-f559-485e-b9bc-30d34188d24e@intel.com>
Date: Mon, 19 Oct 2026 11:53:11 -0700
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
Subject: Re: [PATCH 2/3] dmaengine: idxd: generation-number transaction status
To: Daniel Byrne <daniel1.byrne@intel.com>, Vinod Koul <vkoul@kernel.org>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Frank Li <Frank.Li@kernel.org>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261019150632.4026424-1-daniel1.byrne@intel.com>
 <20261019150632.4026424-3-daniel1.byrne@intel.com>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <20261019150632.4026424-3-daniel1.byrne@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/19/26 8:06 AM, Daniel Byrne wrote:
> Implement device_tx_status() by reading the addressed descriptor's
> completion record. The cookie encodes the descriptor id in its lower
> 16 bits and a generation number in the 14 bits above, so a query
> against a recycled descriptor sees a stale cookie and reads
> DMA_COMPLETE. The generation wraps after 16383 submissions of the same
> slot; the contract is that a client polls a cookie to its terminal
> answer, or abandons it, before its slot has been reused 16383 times,
> which every in-tree polling client satisfies by construction.
> 
> Descriptors with a completion interrupt armed stay with the IRQ
> handler: a generic client such as dmatest may request an interrupt,
> and reading such a descriptor's completion record here would race with
> the handler recycling it. tx_status therefore reports DMA_IN_PROGRESS
> while such a cookie is live and the stale-cookie check answers once the
> handler has completed it. Whether a descriptor is interrupt-armed
> travels in the cookie, in the bit below the sign bit, since the
> descriptor's own flags are rewritten when the handler recycles it.
> 
> A polled descriptor has two terminal answers. Its completion record
> gives the first; the query retires the descriptor and reports
> DMA_COMPLETE or DMA_ERROR from the status. The second is DMA_ERROR for
> a descriptor outstanding on a work queue or a device that is no longer
> enabled, since nothing will complete it; the slot is retired only when
> the device halted, which kills it for good. Descriptors carry the
> device's reset epoch from submit time for that, and the halt stores its
> state before it bumps the epoch, so a poll that read the old epoch and
> the halted state reads the epoch again and retires on a mismatch. The
> same epoch lets device_synchronize() treat a drain that a halt ended
> as complete, since the halt killed everything the drain covered.
> 
> Switch the prep callbacks' descriptor allocation to IDXD_OP_NONBLOCK:
> prep callbacks may not sleep, and on an exhausted pool they return NULL
> so the caller falls back. Direct kernel clients such as iaa_crypto keep
> the blocking allocator path. This gives dmaengine_async_is_tx_complete()
> exact per-descriptor results for polling clients on a device whose work
> queues complete out of order across a group's engines.
> 
> Assisted-by: Claude:claude-opus-5-5
> Assisted-by: Claude:claude-fable-5-1
> Signed-off-by: Daniel Byrne <daniel1.byrne@intel.com>
> ---
>  drivers/dma/idxd/device.c |   1 +
>  drivers/dma/idxd/dma.c    | 158 ++++++++++++++++++++++++++++++++++++--
>  drivers/dma/idxd/idxd.h   |   3 +
>  drivers/dma/idxd/irq.c    |   8 ++
>  4 files changed, 165 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/dma/idxd/device.c b/drivers/dma/idxd/device.c
> index 5ccdc5ff8d53..68a7de74f9e6 100644
> --- a/drivers/dma/idxd/device.c
> +++ b/drivers/dma/idxd/device.c
> @@ -155,6 +155,7 @@ int idxd_wq_alloc_resources(struct idxd_wq *wq)
>  			desc->iax_completion = &wq->iax_compls[i];
>  		desc->compl_dma = wq->compls_addr + idxd->data->compl_size * i;
>  		desc->id = i;
> +		desc->gen = 1;
>  		desc->wq = wq;
>  		desc->cpu = -1;
>  	}
> diff --git a/drivers/dma/idxd/dma.c b/drivers/dma/idxd/dma.c
> index 0a7517cb51f2..dd5a9d9274ce 100644
> --- a/drivers/dma/idxd/dma.c
> +++ b/drivers/dma/idxd/dma.c
> @@ -12,6 +12,20 @@
>  #include "registers.h"
>  #include "idxd.h"
>  
> +#define DMA_COOKIE_BITS (sizeof(dma_cookie_t) * 8)
> +/*
> + * The descriptor id takes the lower 16 bits of the cookie.
> + */
> +#define DESC_ID_BITS 16
> +#define DESC_ID_MASK ((1 << DESC_ID_BITS) - 1)
> +/*
> + * The generation takes the 14 bits above the id. Since dma_cookie_t is
> + * signed, the upper-most bit is left for the sign, and the bit below it
> + * records that the descriptor completes by interrupt.
> + */
> +#define IDXD_COOKIE_RCI BIT(DMA_COOKIE_BITS - 2)
> +#define DESC_GEN_MAX ((1 << (DMA_COOKIE_BITS - DESC_ID_BITS - 2)) - 1)
> +
>  static inline struct idxd_wq *to_idxd_wq(struct dma_chan *c)
>  {
>  	struct idxd_dma_chan *idxd_chan;
> @@ -93,7 +107,7 @@ idxd_dma_prep_interrupt(struct dma_chan *c, unsigned long flags)
>  		return NULL;
>  
>  	op_flag_setup(flags, &desc_flags);
> -	desc = idxd_alloc_desc(wq, IDXD_OP_BLOCK);
> +	desc = idxd_alloc_desc(wq, IDXD_OP_NONBLOCK);
>  	if (IS_ERR(desc))
>  		return NULL;
>  
> @@ -120,7 +134,7 @@ idxd_dma_submit_memcpy(struct dma_chan *c, dma_addr_t dma_dest,
>  		return NULL;
>  
>  	op_flag_setup(flags, &desc_flags);
> -	desc = idxd_alloc_desc(wq, IDXD_OP_BLOCK);
> +	desc = idxd_alloc_desc(wq, IDXD_OP_NONBLOCK);
>  	if (IS_ERR(desc))
>  		return NULL;
>  
> @@ -154,11 +168,128 @@ static void idxd_dma_free_chan_resources(struct dma_chan *chan)
>  		idxd_wq_refcount(wq));
>  }
>  
> +/*
> + * A cookie has exactly one polling owner, the client that submitted the
> + * transaction. Observing a terminal completion record here retires and
> + * recycles the descriptor, since a polled descriptor has no interrupt
> + * and nobody else will. Two contexts polling the same live cookie
> + * would race that recycle, which every in-tree dmaengine polling
> + * client already avoids by construction.
> + */
>  static enum dma_status idxd_dma_tx_status(struct dma_chan *dma_chan,
>  					  dma_cookie_t cookie,
>  					  struct dma_tx_state *txstate)
>  {
> -	return DMA_OUT_OF_ORDER;
> +	struct idxd_wq *wq;
> +	struct idxd_desc *desc;
> +	u32 idx;
> +	u8 status;
> +
> +	if (txstate)
> +		memset(txstate, 0, sizeof(*txstate));
> +
> +	if (dma_submit_error(cookie))
> +		return DMA_ERROR;
> +
> +	wq = to_idxd_wq(dma_chan);
> +
> +	idx = cookie & DESC_ID_MASK;
> +	if (idx >= wq->num_descs)
> +		return DMA_ERROR;
> +
> +	desc = wq->descs[idx];
> +
> +	/*
> +	 * Descriptors with a completion interrupt armed (RCI) are
> +	 * completed and recycled by the IRQ handler. Reading their
> +	 * completion record here would race with the handler, and so
> +	 * would reading the recycled descriptor's flags, which is why
> +	 * the property travels in the cookie the caller owns. The handler
> +	 * invalidates the cookie on completion, so a matching cookie means
> +	 * the command is still in progress.
> +	 */
> +	if (cookie & IDXD_COOKIE_RCI)
> +		return READ_ONCE(desc->txd.cookie) == cookie ?
> +			DMA_IN_PROGRESS : DMA_COMPLETE;
> +
> +	if (desc->txd.cookie != cookie) {
> +		/*
> +		 * The cookie belongs to an old transaction that has
> +		 * already completed and been recycled.
> +		 */
> +		return DMA_COMPLETE;
> +	}
> +
> +	status = desc->completion->status & DSA_COMP_STATUS_MASK;
> +
> +	if (status) {
> +		/* Capture completion record fields before desc is freed below. */
> +		u8 fault_info = desc->completion->fault_info;
> +		u64 fault_addr = desc->completion->fault_addr;
> +
> +		/*
> +		 * Check against the original status because ABORT is
> +		 * software defined as 0xff, which DSA_COMP_STATUS_MASK
> +		 * can mask out.
> +		 */
> +		if (unlikely(desc->completion->status == IDXD_COMP_DESC_ABORT))
> +			idxd_dma_complete_txd(desc, IDXD_COMPLETE_ABORT, true, NULL, NULL);
> +		else
> +			idxd_dma_complete_txd(desc, IDXD_COMPLETE_NORMAL, true, NULL, NULL);
> +
> +		dev_dbg(&wq->idxd->pdev->dev,
> +			"dsa completion: status=0x%02x fault_info=0x%02x fault_addr=0x%llx\n",
> +			status, fault_info, fault_addr);
> +
> +		if (status == DSA_COMP_SUCCESS)
> +			return DMA_COMPLETE;
> +
> +		return DMA_ERROR;
> +	}
> +
> +	/*
> +	 * The descriptor is genuinely outstanding. A polled descriptor
> +	 * carries no interrupt, so nothing but this function will ever
> +	 * retire it, and a work queue or device that is no longer enabled
> +	 * will not complete it either. Report the failure instead of
> +	 * leaving the caller polling forever.
> +	 *
> +	 * A descriptor submitted before a device halt is dead for good:
> +	 * the halt ended the engines and the reset that follows starts
> +	 * them empty, so its record will never be written even once the
> +	 * device is enabled again. Only in that case can the descriptor
> +	 * be retired here safely; otherwise the pool would shrink by one
> +	 * for every descriptor caught by a halt.
> +	 */
> +	if (desc->epoch != READ_ONCE(wq->idxd->reset_epoch)) {
> +		idxd_dma_complete_txd(desc, IDXD_COMPLETE_ABORT, true, NULL, NULL);
> +		return DMA_ERROR;
> +	}
> +	/*
> +	 * A device that is no longer enabled runs nothing it holds, so an
> +	 * outstanding descriptor on it has failed. A halt stores its state
> +	 * before it bumps the epoch, and this poll may have read the epoch
> +	 * before the halt and the state after it, so the epoch is read
> +	 * again: only the retire frees the slot of a descriptor the halt
> +	 * caught. A halted device whose epoch still matches is between the
> +	 * two stores, and the next poll retires the descriptor. The submit
> +	 * reads the state after the stamp, so it refuses a descriptor
> +	 * stamped with the bumped epoch.
> +	 */
> +	if (wq->idxd->state != IDXD_DEV_ENABLED) {
> +		if (desc->epoch != READ_ONCE(wq->idxd->reset_epoch)) {
> +			idxd_dma_complete_txd(desc, IDXD_COMPLETE_ABORT, true,
> +					      NULL, NULL);
> +			return DMA_ERROR;
> +		}
> +		if (wq->idxd->state == IDXD_DEV_HALTED)
> +			return DMA_IN_PROGRESS;
> +		return DMA_ERROR;
> +	}
> +	if (wq->state != IDXD_WQ_ENABLED)
> +		return DMA_ERROR;
> +
> +	return DMA_IN_PROGRESS;
>  }
>  
>  /*
> @@ -177,7 +308,17 @@ static dma_cookie_t idxd_dma_tx_submit(struct dma_async_tx_descriptor *tx)
>  	int rc;
>  	struct idxd_desc *desc = container_of(tx, struct idxd_desc, txd);
>  
> -	cookie = dma_cookie_assign(tx);
> +	cookie = (desc->gen << DESC_ID_BITS) | (desc->id & DESC_ID_MASK);
> +	if (desc->hw->flags & IDXD_OP_FLAG_RCI)
> +		cookie |= IDXD_COOKIE_RCI;
> +
> +	if (desc->gen == DESC_GEN_MAX)
> +		desc->gen = 1;
> +	else
> +		desc->gen++;
> +
> +	tx->cookie = cookie;
> +	desc->epoch = READ_ONCE(wq->idxd->reset_epoch);
>  
>  	rc = idxd_submit_desc(wq, desc);
>  	if (rc < 0) {
> @@ -219,6 +360,7 @@ static void idxd_dma_synchronize(struct dma_chan *c)
>  {
>  	struct idxd_wq *wq = to_idxd_wq(c);
>  	LIST_HEAD(quarantined);
> +	u32 epoch;
>  
>  	/*
>  	 * dmaengine_synchronize() promises the client that its memory may
> @@ -240,7 +382,13 @@ static void idxd_dma_synchronize(struct dma_chan *c)
>  	 * Only a device reset ends the exposure of the client's memory.
>  	 */
>  	idxd_wq_quarantine_take(wq, &quarantined);
> -	if (!idxd_wq_drain(wq)) {
> +	/*
> +	 * A halt during the drain kills every descriptor submitted before
> +	 * it, which is all of them, and a reset that followed may have
> +	 * ended the drain itself. Such a drain is as good as complete.
> +	 */
> +	epoch = READ_ONCE(wq->idxd->reset_epoch);
> +	if (!idxd_wq_drain(wq) || READ_ONCE(wq->idxd->reset_epoch) != epoch) {
>  		idxd_wq_quarantine_free(wq, &quarantined);
>  		WRITE_ONCE(wq->stuck, false);
>  		return;
> diff --git a/drivers/dma/idxd/idxd.h b/drivers/dma/idxd/idxd.h
> index b0cfd7101174..7fe5ec6c3bf3 100644
> --- a/drivers/dma/idxd/idxd.h
> +++ b/drivers/dma/idxd/idxd.h
> @@ -349,6 +349,7 @@ struct idxd_device {
>  	spinlock_t cmd_lock;	/* spinlock for device commands */
>  	struct completion *cmd_done;
>  	u32 cmd_seq;		/* bumps when a command starts running */
> +	u32 reset_epoch;	/* bumps on every device halt */
>  	struct idxd_group **groups;
>  	struct idxd_wq **wqs;
>  	struct idxd_engine **engines;
> @@ -447,9 +448,11 @@ struct idxd_desc {
>  	struct list_head list;
>  	int id;
>  	int cpu;
> +	u16 gen;
>  	u16 terminate_gen;	/* the queue's terminate_gen at an
>  				 * interrupt-armed submit
>  				 */
> +	u32 epoch;		/* the device reset_epoch at submit */
>  	struct idxd_wq *wq;
>  };
>  
> diff --git a/drivers/dma/idxd/irq.c b/drivers/dma/idxd/irq.c
> index 8217698056bb..5e34790359ee 100644
> --- a/drivers/dma/idxd/irq.c
> +++ b/drivers/dma/idxd/irq.c
> @@ -508,6 +508,14 @@ static irqreturn_t idxd_halt(struct idxd_device *idxd)
>  	gensts.bits = ioread32(idxd->reg_base + IDXD_GENSTATS_OFFSET);
>  	if (gensts.state == IDXD_DEVICE_STATE_HALT) {
>  		idxd->state = IDXD_DEV_HALTED;
> +		/*
> +		 * Every descriptor submitted before this point is dead: the
> +		 * device will never write its completion record. Pollers
> +		 * compare their descriptor's epoch against this to retire
> +		 * such descriptors instead of waiting for a record that never
> +		 * comes.
> +		 */
> +		WRITE_ONCE(idxd->reset_epoch, idxd->reset_epoch + 1);
>  		if (gensts.reset_type == IDXD_DEVICE_RESET_SOFTWARE) {
>  			/* The reinit below re-enables the queues, so revive them. */
>  			idxd_wqs_halt_flush(idxd, true);


LLM suggests possible race:
1. Recording the count too early. idxd_dma_tx_submit() saves the reset count into desc->epoch (dma.c:321) before calling idxd_submit_desc(). Until __idxd_submit_desc() checks idxd->state (submit.c:230) and takes wq_active, the submitter holds no lock and no reference.

2. The halt doesn't wait for this submitter. idxd_halt() (irq.c:509-529) sets HALTED and increments reset_epoch, then calls idxd_wqs_halt_flush(idxd, true). That flush's idxd_wq_kill() waits only for submitters holding wq_active, so it never waits on ours. It then revives wq_active and queues idxd_device_reinit().

3. Recovery finishes. idxd_device_reinit() (irq.c:32-70) resets, configures and enables the device, which sets ENABLED (device.c:810). It then re-enables the queue (device.c:217). Nothing in this path touches the descriptors or desc->epoch.

4. The descriptor runs on the new device. The submitter resumes and passes both state checks and the tryget. It then posts the descriptor, which still carries the old count, and the reset device runs it.

5. The poll frees it early. The first poll after the post sees status 0, and the descriptor matches the cookie. The desc->epoch != reset_epoch branch (dma.c:264-267) then calls idxd_dma_complete_txd(..., true, ...), which frees the slot. It returns DMA_ERROR while the copy is still running.

6. The late write corrupts the next user. __get_desc() clears the completion record when the slot is reused (submit.c:19). The device then writes its record to the same dener can see a result for a transfer that hasn't run.

LLM suggested fix:
Move the reset-count read (desc->epoch) out of idxd_dma_tx_submit() and into __idxd_submit_desc(), after the submitter holds wq_active and before the second state check. On the halt side, order the state store before the count store.

--- a/drivers/dma/idxd/dma.c
+++ b/drivers/dma/idxd/dma.c
@@ static dma_cookie_t idxd_dma_tx_submit(struct dma_async_tx_descriptor *tx)
        tx->cookie = cookie;
-       desc->epoch = READ_ONCE(wq->idxd->reset_epoch);

        rc = idxd_submit_desc(wq, desc);
--- a/drivers/dma/idxd/submit.c
+++ b/drivers/dma/idxd/submit.c
@@ static int __idxd_submit_desc(struct idxd_wq *wq, struct idxd_desc *desc,
        smp_rmb();
+       /*
+        * Stamp under wq_active: a halt that bumps the epoch after this
+        * read waits in idxd_wq_kill() for the reference, so an old stamp
+        * proves the post came before that halt's flush. A halt stores its
+        * state before its bump, so a bumped stamp fails the check below.
+        */
+       desc->epoch = READ_ONCE(idxd->reset_epoch);
+       smp_rmb();
        if (idxd->state != IDXD_DEV_ENABLED) {
                percpu_ref_put(&wq->wq_active);
                return -EIO;
        }
--- a/drivers/dma/idxd/irq.c
+++ b/drivers/dma/idxd/irq.c
@@ static irqreturn_t idxd_halt(struct idxd_device *idxd)
        if (gensts.state == IDXD_DEVICE_STATE_HALT) {
                idxd->state = IDXD_DEV_HALTED;
+               /* Pairs with the smp_rmb() after the submit's epoch stamp. */
+               smp_wmb();
                /*
                 * Every descriptor submitted before this point is dead: the
