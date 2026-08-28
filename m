Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5FBF394EB0
	for <dmaengine@vger.kernel.org>; Fri, 28 Aug 2026 09:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787909607; cv=none; b=rJwffkreg5cWuBMK61mDIitQNNWbcWz+aXVGNjjLFqCwGQZMYEX+AMAhZChawO86Pil4HRhdW/Bxfb2OjinCSDSBCVO6Yy0TjPEaDysLmI20zxE63Fzasxiim38hXyAPkQ4AvbuKWQYXdi2U6wlmugQmz22uNQrHTVFxdqJhVZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787909607; c=relaxed/simple;
	bh=C4h3yj0iHoXs5kGLZfz4anjxOrVJMmKT6fz1oblOh8g=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=tmRoISHuKBu0cahXRYy5lb74YGwwRYfDF47ZdkXbTRji9S/Avf5+XUV6sBERQMtt8aWu7qSMkK0dUWZkFLHiW1HJk0RqSm8FWQ5SUJHZM3kXH4FVg0U8vU5Fa6iCHO/O7zQHQxEJJ6GKbsGf5LWw65Q6WoMr26mNAjNZacCy/a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=c4o5ma1S; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="c4o5ma1S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=JvsF1XMDlXzWyk8fe4qPlxh68e6z0KROY
	B37rgDtJrk=; b=c4o5ma1S4dnIAp4wbT4zL6cK6VXbT+4ikvs+AN283eu4vCQgJ
	c8CNSce3W10KfvzsgQuEmJECfbUjSrbWvoJXB3YAh1sSGb0BiRM1f1XI5oHS1AHA
	hGqnIo1sLH6BZHd/e7X+EewtZ20AllHbQQMZ79IMGxInDSN0z4xFj4qFks=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwCn1s3mVZFqoWoBAA--.604S2;
	Fri, 28 Aug 2026 17:33:26 +0800 (CST)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 2/2] dmaengine: dw-axi-dmac: Fix LLI dump out-of-bounds
 access
From: Jia Wang <wangjia@ultrarisc.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jia Wang <wangjia@ultrarisc.com>, Frank.Li@kernel.org, 
 dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260828010412.6971A1F000E9@smtp.kernel.org>
References: <20260828-dma-fix-v1-0-a6947f487e07@ultrarisc.com>
 <20260828-dma-fix-v1-2-a6947f487e07@ultrarisc.com>
 <20260828010412.6971A1F000E9@smtp.kernel.org>
Date: Fri, 28 Aug 2026 17:33:13 +0800
Message-Id: <178790959342.157024.10638059543034966572.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787909593; l=4919;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=C4h3yj0iHoXs5kGLZfz4anjxOrVJMmKT6fz1oblOh8g=;
 b=Y1U1UREsrNcr1aoxfSlWbIFdzpoJOeRyFZXAWUqQce2uiDaG6eL7cCAV5Be0fA9lqwEoLfXYw
 LRGGXsYf/3qAKyZIZVqdHmT0b5hF2WQpiFkQu/4JX5qesmQ9b/16AYj
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwCn1s3mVZFqoWoBAA--.604S2
X-Coremail-Antispam: 1UD129KBjvJXoWxurWUWw4rWF43Kr4kuF43trb_yoW7Jr17pF
	W5Jay5tFy0gF93Ja1kXa1UAFy5Aa1UJFy0kr45Kr1IvFn3CwnavFsrKayF9FnrGrnYvF42
	vF40k34fAF1UAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUva14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyT
	uYvjfUYNVyDUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAMEWqPrHsAIwAXsa

On 2026-08-28 01:04 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The exact same out-of-bounds array access bug that this commit fixes in `axi_chan_list_dump_lli()` remains unpatched in `axi_chan_block_xfer_complete()`, compounded by a TOCTOU race.
> - [High] A flawed SG iteration loop in `dw_axi_dma_chan_prep_slave_sg()` exits prematurely, silently truncating transfers and causing an immediate NULL pointer dereference panic.
> - [High] On descriptor allocation error paths, `axi_desc_put()` will attempt to free `NULL` pointers to the DMA pool and incorrectly subtract unallocated counts from `chan->descs_allocated`, leading to kernel panics and counter corruption.
> --
> 
> commit c635f1f1d2b17ebcac96fbdff2d3244d2e75fb83
> Author: Jia Wang <wangjia@ultrarisc.com>
> 
> dmaengine: dw-axi-dmac: Fix LLI dump out-of-bounds access
> 
> axi_chan_list_dump_lli() uses the channel-wide descs_allocated count to
> walk the hw_desc[] array of a single transaction. If multiple
> transactions have allocated LLIs, the channel count can exceed the
> transaction-local nr_hw_descs and make the DMA error path read past the
> end of hw_desc[].
> 
> > diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > index 742e08cfab435..858004b5a8467 100644
> > --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > @@ -1052,10 +1052,9 @@ static void axi_chan_dump_lli(struct axi_dma_chan *chan,
> >  static void axi_chan_list_dump_lli(struct axi_dma_chan *chan,
> >  				   struct axi_dma_desc *desc_head)
> >  {
> > -	int count = atomic_read(&chan->descs_allocated);
> >  	int i;
> >  
> > -	for (i = 0; i < count; i++)
> > +	for (i = 0; i < desc_head->nr_hw_descs; i++)
> >  		axi_chan_dump_lli(chan, &desc_head->hw_desc[i]);
> >  }
> 
> [Severity: High]
> This is a pre-existing issue, but the exact same out-of-bounds array access
> bug that this commit fixes in axi_chan_list_dump_lli() remains unpatched in
> axi_chan_block_xfer_complete():
> 
> drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:axi_chan_block_xfer_complete() {
>     ...
>     int count = atomic_read(&chan->descs_allocated);
>     ...
>     for (i = 0; i < count; i++) {
>         hw_desc = &desc->hw_desc[i];
>     ...
> }
> 
> Does this function also need to be updated to use desc->nr_hw_descs for
> its loop limit? Using the channel-wide count (which is fetched outside the
> channel spinlock, presenting a TOCTOU race) could cause an out-of-bounds read
> on desc->hw_desc[]. If the garbage memory happens to match llp, it will modify
> the memory via hw_desc->lli->ctl_hi.
> 
> 
> [Severity: High]
> This is a pre-existing issue, but looking at dw_axi_dma_chan_prep_slave_sg(),
> is there a flaw in the SG iteration loop?
> 
> drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dw_axi_dma_chan_prep_slave_sg() {
>     ...
>     segment_len = DIV_ROUND_UP(sg_dma_len(sg), num_segments);
>     ...
>     } while (len >= segment_len);
>     ...
>     write_desc_llp(hw_desc, llp | lms);
>     ...
> }
> 
> If a DMA client submits a scatter-gather list where the length does not evenly
> divide into the hardware maximum block size (e.g., length 4097 and block
> length 4096 gives a segment_len of 2049, leaving 2048 bytes), the condition
> while (len >= segment_len) evaluates to false and exits the loop prematurely.
> 
> Does this silent truncation leave trailing descriptors uninitialized, causing an
> immediate NULL pointer dereference panic when write_desc_llp() tries to access
> hw_desc->lli?
> 
> 
> [Severity: High]
> This is a pre-existing issue, but does axi_desc_put() safely handle error
> rollbacks?
> 
> drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:axi_desc_put() {
>     ...
>     for (i = 0; i < desc->nr_hw_descs; i++) {
>         ...
>         dma_pool_free(chan->desc_pool, hw_desc->lli, hw_desc->llp);
>         ...
>     }
>     ...
>     atomic_sub(descs_put, &chan->descs_allocated);
> }
> 
> If descriptor initialization fails midway (e.g., due to OOM causing -ENOMEM),
> the error path calls axi_desc_put(). Because it unconditionally iterates over
> all desc->nr_hw_descs elements, won't it pass NULL hw_desc->lli pointers to
> dma_pool_free() for unallocated entries, resulting in a panic?
> 
> Additionally, will subtracting the full capacity (descs_put) from
> chan->descs_allocated cause an underflow when only partially allocated?
> 

Thanks, confirmed. This is a real pre-existing SG split-loop bug and will be
fixed separately.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260828-dma-fix-v1-0-a6947f487e07@ultrarisc.com?part=2
> 

Best regards,
Jia Wang


