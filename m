Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04D63E5EFB
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186886; cv=none; b=jTa6V6Be7JAVU41qldyWYarYktS6VJmpqleWBWW3KRy6LhLicUxltETDs7fLgOLILV9uqkiGfX+nn9X8TlXSOtDbcRMtQQDa7y4zZ0UevCLfKo9rIumTU5UdDRfxnJNsXvOg5yiUCnQtrU3YkyGfJgJTs7NKCE3k2kJh5TpsKQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186886; c=relaxed/simple;
	bh=sDuZOpcIplktBmImTXgZSr3xnNMxv4VSsGMST6vdXfA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TUwe+QILDOz9/bX+bii+0eE3yaouSAciNjqbBL1EnwwEDaRW2pcIXvK5N3MCyzOwBdxZdXKk5flPMSH5J4ib2VFSbs6rPruIClVO6yBhncIyZpU+sEbtEZsXWTsFppSDeDQnLpPRqvKlgePxH6KYqh+s6KRxjotsjsWx3Z+MtMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1iqhllx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1iqhllx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BCBD1F000E9;
	Mon, 27 Jul 2026 21:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186884;
	bh=bc5NIcyChLYuoOhdqVZDdS/RPJQU1nN1bomxfMZaiWI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m1iqhllxia71yc86PojNJj/Bk06sSwCCDyQ6e+LmJ/Qy5f6GPQmDKZCjl0r3YeQqB
	 Db/YYshfyp5MOIsEAZwSvu5o+ZKuwBUOBeC4hDdTEG3mAMbtA7Iaru5dXmeliSMJOD
	 T1lv/+1MVUMeB+yWjp/SDJec9AtH+htMWcXvT1dIE2Pw+jtUvH+f/UThzVqIW+vpn2
	 Xj012U2ZjCKNdvhrYtGbgRX12LdMU/5EP1fBbwTpPFTtdJCjcOE19ggyHWAycwVidv
	 NqjVbm3LjjrsHUaXs+BUtgNXhm1XXDOMM8e9xfBqfNW7GzazI1hHdnNds5G7Y+miMz
	 eCMO2WLSXcmDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 45/64] dmaengine: mtk-uart-apdma: kill vchan BH on
 teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <dd94300feb7feaa826b8fb75e1f22c82a6f54bf4.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <dd94300feb7feaa826b8fb75e1f22c82a6f54bf4.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:14:43 +0000
Message-Id: <20260727211444.2BCBD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Resource leak on driver unbind due to prematurely emptying the DMA=
 channels list.
- [High] Use-After-Free of channel context due to orphaned IRQ handler on u=
nbind.
- [High] Double decrement of PM runtime usage counter on failure in channel=
 allocation.
--

--- Patch [45]: [PATCH v2 45/64] dmaengine: mtk-uart-apdma: kill vchan BH o=
n teardown ---
commit 58283f2545c03ebd5b55eff5e9a5d8fdde273b4d
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: mtk-uart-apdma: kill vchan BH on teardown

Use dma_chan_kill_bh() for virt-dma cleanup.

> diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek=
/mtk-uart-apdma.c
> index c269d84d7bd2b..4d89927922f52 100644
> --- a/drivers/dma/mediatek/mtk-uart-apdma.c
> +++ b/drivers/dma/mediatek/mtk-uart-apdma.c
> @@ -312,7 +312,7 @@ static void mtk_uart_apdma_free_chan_resources(struct=
 dma_chan *chan)
> =20
>  	free_irq(c->irq, chan);

[Severity: High]
This is a pre-existing issue, but is it possible for a use-after-free
to occur on unbind?

The IRQ is requested without devres tracking in
mtk_uart_apdma_alloc_chan_resources(). It is only freed here in
mtk_uart_apdma_free_chan_resources().

If the driver is unbound while a client still actively holds a channel,
mtk_uart_apdma_remove() completes without forcing the channel to be
freed and without disabling the active IRQ. Since the mtk_chan context
is managed by devres, it is automatically freed upon remove() completion.
If a hardware interrupt fires after this, could the orphaned handler
dereference the already-freed mtk_chan structure?

> -	tasklet_kill(&c->vc.task);
> +	dma_chan_kill_bh(&c->vc.chan);
> =20
>  	vchan_free_chan_resources(&c->vc);
> =20
> @@ -463,7 +463,7 @@ static void mtk_uart_apdma_free(struct mtk_uart_apdma=
dev *mtkd)
>  			struct mtk_chan, vc.chan.device_node);
> =20
>  		list_del(&c->vc.chan.device_node);

[Severity: High]
This isn't a bug introduced by this patch, but does this list removal
cause a resource leak during driver unbind?

In mtk_uart_apdma_remove(), the driver calls mtk_uart_apdma_free()
before dma_async_device_unregister(). This loop explicitly removes
each channel via list_del(), leaving the mtkd->ddev.channels list empty.

Immediately after, dma_async_device_unregister() iterates over the
now-empty device->channels list to tear down the channels. Because the
list is empty, does this cause the teardown to be entirely skipped,
permanently leaking the per-CPU chan->local memory, IDR slots, and
leaving orphaned sysfs nodes?

> -		tasklet_kill(&c->vc.task);
> +		dma_chan_kill_bh(&c->vc.chan);
>  	}
>  }

[Severity: High]
This is a pre-existing issue, but does mtk_uart_apdma_alloc_chan_resources()
double decrement the PM runtime usage counter on failure?

drivers/dma/mediatek/mtk-uart-apdma.c:mtk_uart_apdma_alloc_chan_resources()=
 {
    ...
    ret =3D pm_runtime_resume_and_get(mtkd->ddev.dev);
    if (ret < 0) {
        pm_runtime_put_noidle(chan->device->dev);
        return ret;
    }
    ...
}

Since pm_runtime_resume_and_get() intrinsically drops the PM runtime
usage counter if it fails (returns < 0), does calling pm_runtime_put_noidle=
()
again in the error path result in a double decrement and unbalanced
runtime PM state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D45
