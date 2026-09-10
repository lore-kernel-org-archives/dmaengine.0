Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D0827703
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 00:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788998479; cv=none; b=Z6elCqNzOB9eVY1RWIxq/dvAYJ2jOLBhsl4rWIKLqxZqwmr2njpZfuQ88Jj5eFVbGJj1LjcExt7YcAeR+um3Vbjh9sGIydtI7jzviLCBdz9ulCd8Mv5Rhv9x+nYpRiO+PYIoeEa9ofDV9t+HDVPZMDn0eriBj9DEvC3dNl/MDdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788998479; c=relaxed/simple;
	bh=vLsV3oEC7kaPU9uufm41f0/G5De605v1wZaU3/zrGxI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SAba6p01bmdL58BqNJkvwuFY/u/7zHx0X9J1XZOFwnayA7uXgDkhyrFzJs5CdTcQ5PW84DMlz624Kv5PwObdiWk0ts2M/iUoAkyqwvS9Xkpzop0MI8oV8XD8UnPeYnKEKVRe/7GdVQgZn+lIShyZHhquf3IkKuhQ/M7G98WjrQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YW8xA84H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YW8xA84H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6D91F000FF;
	Thu, 10 Sep 2026 00:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788998477;
	bh=AZ6aFoX1wd52JHEoK98F5Pc7VbKrWlnXcEsnsbAMbKY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YW8xA84HUalTO6cQwy0CSmMCmocIj09QJ7taSMlWtaSJehtTAls5EMQ4m5Xb/2ROO
	 vmi3vWRQqRB68VkVRIZlX/qEZFklYrnFE3jIgmvezNFVxDxumeQ0mf6peRk6Sn6kpt
	 W3tUVJ+oK2ZijFDxGk54garhLBtWC2LKq8l5GH/Um4cHRLrScn6GcYdMFds48Mbosd
	 wmyQiDC+VhTBxnIqivv7+x+hSW9J2Jy2jlP/t+H+BghQKpK/Pu8Rvp/SDigB01pra8
	 5vbt7AGPtUmNMaQ++9svgWZS7WFE5yoIg7mqaxhhXVSnEuk6GVEJ9w9q3hpnHfxs3X
	 neIt4sJMhYi8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: mv_xor: return descriptor to free pool on
 io_win failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260909234924.103418-1-rosenp@gmail.com>
References: <20260909234924.103418-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 00:01:16 +0000
Message-Id: <20260910000117.4E6D91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Concurrent access to shared MBUS window configuration in `mv_xor_a=
dd_io_win` without synchronization leads to arbitrary DMA memory corruption.
- [High] Missing `tasklet_kill()` during channel removal leads to Use-After=
-Free.
- [High] `free_irq()` is called after freeing DMA descriptors, risking Use-=
After-Free in the interrupt handler.
--

commit 8b478eae94fa4a954430bcc670fc167e9a399a15
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: mv_xor: return descriptor to free pool on io_win failure

When mv_xor_prep_dma_xor() allocates a descriptor slot and then
mv_xor_add_io_win() fails in the source-address loop, the slot
stays on the allocated list and is never reclaimed. This returns
the slot to the free pool under the channel lock before returning
NULL on failure.

> diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> index 25ed61f1b0899..dd4f150d5fb12 100644
> --- a/drivers/dma/mv_xor.c
> +++ b/drivers/dma/mv_xor.c
> @@ -583,8 +583,13 @@ mv_xor_prep_dma_xor(struct dma_chan *chan, dma_addr_=
t dest, dma_addr_t *src,
>  		while (src_cnt--) {
>  			/* Check if a new window needs to get added for 'src' */
>  			ret =3D mv_xor_add_io_win(mv_chan, src[src_cnt]);

[Severity: High]
This isn't a bug introduced by this patch, but can this concurrent access
corrupt the MBUS window mappings?

mv_xor_prep_dma_xor() is called concurrently on multiple channels sharing t=
he
same XOR device. It calls mv_xor_add_io_win() which performs an unprotected
read:

	win_enable =3D readl(base + WINDOW_BAR_ENABLE(0));

It then modifies the shared device-level window cache:

	xordev->win_start[i] =3D addr;
	xordev->win_end[i] =3D addr + size;

And writes the clobbered value back to the hardware:

	writel(win_enable, base + WINDOW_BAR_ENABLE(0));

Since this lacks synchronization across channels, could this race condition
lead to the DMA engine accessing incorrect physical addresses?

> -			if (ret)
> +			if (ret) {
> +				spin_lock_bh(&mv_chan->lock);
> +				list_move_tail(&sw_desc->node,
> +					       &mv_chan->free_slots);
> +				spin_unlock_bh(&mv_chan->lock);
>  				return NULL;
> +			}
>  			mv_desc_set_src_addr(sw_desc, src_cnt, src[src_cnt]);
>  		}
>  	}

[Severity: High]
This is a pre-existing issue, but does the channel teardown leak the pending
background execution context?

Looking at mv_xor_channel_remove(), it frees the interrupt handler and DMA
device but neglects to call tasklet_kill(&mv_chan->irq_tasklet):

static int mv_xor_channel_remove(struct mv_xor_chan *mv_chan)
{
	struct dma_chan *chan, *_chan;
	[ ... ]

Since free_irq() does not wait for tasklets to finish, can a pending tasklet
execute asynchronously after mv_xor_channel_remove() returns and devres has
freed the mv_chan memory, resulting in a use-after-free?


[Severity: High]
This is a pre-existing issue, but does the teardown order risk a
use-after-free in the interrupt handler?

In mv_xor_channel_remove(), the DMA memory used by the hardware and IRQ
handler is freed here:

	dma_free_wc(dev, MV_XOR_POOL_SIZE,
			  mv_chan->dma_desc_pool_virt, mv_chan->dma_desc_pool);

The interrupt handler is freed later:

	free_irq(mv_chan->irq, mv_chan);

If a hardware interrupt fires between these two calls, or is already running
on another CPU, wouldn't it trigger the interrupt handler and subsequently
schedule the tasklet?=20

This would access the already-freed descriptor memory
(mv_chan->dma_desc_pool_virt). Should the teardown order disable and free
IRQs before freeing the resources the IRQ handler relies on?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909234924.1034=
18-1-rosenp@gmail.com?part=3D1
