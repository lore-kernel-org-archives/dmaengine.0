Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9703148CFC
	for <dmaengine@vger.kernel.org>; Sun, 18 Oct 2026 04:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792297155; cv=none; b=L/qI9zeIXLp1mqTN/LhrgLFwd2wIgBfG9bxx9p2ghIhhfj4J1hNOqr38ncak8EpCetSLfwwT2ULYuJS/PkN2FuBlJZSME87fb8Qf7PESSVuMq7Ta06znHkEoDvluCo81k74ofZfxsllsN53zt3UMWjuE8bgdhJ2noCx7+QWZYso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792297155; c=relaxed/simple;
	bh=cxZnFnyFLtiaZ/eyy7tpZ9dsw/vG/y8ZAa6zVOXjsDk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=T3JtlHXDsfMXSu/wxCLxj1gowKeELIHQ2pBKg+0uvIMluJYbiWl7La56LjNjRcLOkOMgTt9QJbh8d/akPluUZtUBAtygKU/sP/BUEI47kzAG6bRLmq7HYt0CnKxk9s77CJ0fWDWp+6oQETBQMYJulF3+hHH4uvd0c5Tb6w1KNls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zd5uoHUC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zd5uoHUC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0601F000C4;
	Sun, 18 Oct 2026 04:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792297149;
	bh=Udwn1v3lSsiPk+ubf3B/k0BVe9apkFMwpretpZ7YhsQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zd5uoHUCyIpKbL/oLQMfEAr3ax0CTOhGzJRCougaWwVEpcRsqqaOvR6jMrlSzQFBw
	 r23yUjS/cTD4ksqzUt5OS/vC1Vs+tT8c0Gz97vTnyn1GduWSFpniYEWPCRFFuzS+SB
	 bR4rI1Xm07lTelH8hh4wDlgeFIuyJQBsKeAUznRzYV+iVSW7YdNWx2Dp8bBSKabZpL
	 XR+0Pfo1J9GeYjIv8w7ng1zoDN71LQsQSZqow6VpEYViUw47zZIHh+WjOR0T+qSN1f
	 TOcs5E5nVtQc30htNRnahabWK83fTtdZABKgOtetM77be0vZIavxBpyUTUJ2luAk0g
	 /WsEyPuEPa4uA==
Message-ID: <sashiko-outbox-175925@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] dmaengine: ep93xx: drain tasklet before freeing
 channel resources
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiale Yao" <yaojiale02@163.com>, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261018040724.534641-2-yaojiale02@163.com>
References: <20261018040724.534641-1-yaojiale02@163.com>
 <20261018040724.534641-2-yaojiale02@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 04:19:09 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: ep93xx: free_list spliced before tasklet_kill() leaks d=
escriptors
--

commit 2aab3bd053da4cc14229fbf115862f410d9ef2f3
Author: Jiale Yao <yaojiale02@163.com>

dmaengine: ep93xx: drain tasklet before freeing channel resources

This commit frees the channel IRQ and kills the channel tasklet in
ep93xx_dma_free_chan_resources() before freeing descriptors and disabling t=
he
clock.

> diff --git a/drivers/dma/ep93xx_dma.c b/drivers/dma/ep93xx_dma.c
> index 311e55a97ba9f..6134e9ca699dc 100644
> --- a/drivers/dma/ep93xx_dma.c
> +++ b/drivers/dma/ep93xx_dma.c
> @@ -1015,11 +1015,13 @@ static void ep93xx_dma_free_chan_resources(struct=
 dma_chan *chan)
>  	list_splice_init(&edmac->free_list, &list);
>  	spin_unlock_irqrestore(&edmac->lock, flags);
> =20
> +	free_irq(edmac->irq, edmac);
> +	tasklet_kill(&edmac->tasklet);

[Severity: High]
Should free_irq() and tasklet_kill() be called before checking edmac->active
and splicing edmac->free_list in ep93xx_dma_free_chan_resources()?

In ep93xx_dma_tasklet(), completed descriptors are moved from edmac->active
to a stack-local list under edmac->lock, and only returned to
edmac->free_list after dropping the lock:

drivers/dma/ep93xx_dma.c:ep93xx_dma_tasklet() {
    ...
	if (desc) {
		if (desc->complete) {
			/* mark descriptor complete for non cyclic case only */
			if (!test_bit(EP93XX_DMA_IS_CYCLIC, &edmac->flags))
				dma_cookie_complete(&desc->txd);
			list_splice_init(&edmac->active, &list);
		}
		dmaengine_desc_get_callback(&desc->txd, &cb);
	}
	spin_unlock_irq(&edmac->lock);

	/* Pick up the next descriptor from the queue */
	ep93xx_dma_advance_work(edmac);

	/* Now we can release all the chained descriptors */
	list_for_each_entry_safe(desc, d, &list, node) {
		dma_descriptor_unmap(&desc->txd);\
		ep93xx_dma_desc_put(edmac, desc);
	}
    ...
}

If ep93xx_dma_tasklet() is running concurrently and has already spliced
edmac->active into its local list and dropped edmac->lock,
ep93xx_dma_free_chan_resources() will splice edmac->free_list into its own
local list before waiting in tasklet_kill(&edmac->tasklet). While
tasklet_kill() waits for the tasklet to finish, ep93xx_dma_desc_put() will
place those in-flight struct ep93xx_dma_desc descriptors back onto
edmac->free_list, where they will not be freed by the subsequent kfree()
loop.

Additionally, if a tasklet scheduled by ep93xx_dma_interrupt() on
INTERRUPT_DONE has not yet entered its locked section when
ep93xx_dma_free_chan_resources() starts, edmac->active will still be
non-empty and hit BUG_ON(!list_empty(&edmac->active)) at the top of
ep93xx_dma_free_chan_resources().

Would draining the IRQ and tasklet before the BUG_ON() checks and
list_splice_init(&edmac->free_list, &list) avoid leaking descriptors and
hitting the BUG_ON()?

> +
>  	list_for_each_entry_safe(desc, d, &list, node)
>  		kfree(desc);
> =20
>  	clk_disable_unprepare(edmac->clk);
> -	free_irq(edmac->irq, edmac);
>  }
> =20
>  /**

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018040724.5346=
41-1-yaojiale02@163.com?part=3D1
