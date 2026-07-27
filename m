Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121C2371D1F
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186135; cv=none; b=CXEu8te8ey+uGe6BPJge2IMcVdFat0vQ+ce+BUYWwGWHtvKHxqWIk92cFh6kqyX70Oqe3R2OolS56a5TiqMKraeKEDawdNGS8+9CC6afunUdoq/r2Y2SKlqy+HDM2xNqzYlLy1HRMjfNHUOfjBQiYcVDC6pSYYV2DndMKFuMTyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186135; c=relaxed/simple;
	bh=3sjxmaKBKYtjDFLMSQV67IFokoGFgQ4Jq6h6oTW6Poc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZmxTZ1eBgzZpbN11AP0yUBbY05mwpyugcaEaZEpRJRoj+Lbwf91aJA+NPkOrVMZrs7POh3zzrJIQ8B7us5gz/XBBmeSTTYcuaXuEaT9+5Z5dICwR/aW9psz0ZcNZAjLUYUEFFxeb8qNV+2zLjvDJmsHrCeAYOCKpuLfeXWlvAZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYwWKxyp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYwWKxyp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A81981F000E9;
	Mon, 27 Jul 2026 21:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186134;
	bh=f9IlPhjU/86wrcYSlNH/nobBmNv0Vb1Vd9Qg1wuaFiM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CYwWKxyp5z9B9flFw0zwO+olc2gr55iD/FvyKvMvy6jVep0uereTJSkNd0PbiG1Yi
	 T+5N5rmWpBXD7Pr2z3DUuAYQV1cEZEZseB49Gp80D5EBuHUdDokh5qwcHkBA/UWt8/
	 ltCvG2TYdP2O7IeJkdrLfmHAe6KL8FZRF8t75xp0vH4c19OeTu4rGsRQqWK3IyOnYR
	 1usFIxW0esefBFa8AdMA4KPy8afRIUo3Kc+Hs2kiqQhXGX5Bxm05MxkO5kIFX6YpQl
	 rHwwaz2FXsyCkgMgZh8nj1UhN5sX3YCBhe4Yxg7kvScUwct3/XC+HZYQRFkC0hmqMO
	 acpXhRub6n11g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/64] dmaengine: ioat: convert cleanup tasklet to
 dma_chan BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <325f449ad6fca109ec1e8c34e4e12c1952272a8f.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <325f449ad6fca109ec1e8c34e4e12c1952272a8f.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:02:13 +0000
Message-Id: <20260727210213.A81981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The teardown sequence in `ioat_stop()` cancels the timer using `ti=
mer_delete_sync()`, but it can be subsequently re-armed by the final cleanu=
p sequence, leading to a use-after-free when channel resources are freed.
- [High] `ioat_shutdown()` does not flush inflight BH runs, which can lead =
to a use-after-free or crash on module unload.
--

--- Patch [9]: [PATCH v2 09/64] dmaengine: ioat: convert cleanup tasklet to=
 dma_chan BH ---
commit 1d64b3893af8e57fe59c7d2f05e40d26e9aec652
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: ioat: convert cleanup tasklet to dma_chan BH

Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/ioat/dma.c b/drivers/dma/ioat/dma.c
> index ee93b029f9e3d..827b46c6354ad 100644
> --- a/drivers/dma/ioat/dma.c
> +++ b/drivers/dma/ioat/dma.c

[ ... ]

> @@ -161,11 +161,11 @@ void ioat_stop(struct ioatdma_chan *ioat_chan)
>  	/* flush inflight timers */
>  	timer_delete_sync(&ioat_chan->timer);
> =20
> -	/* flush inflight tasklet runs */
> -	tasklet_kill(&ioat_chan->cleanup_task);
> +	/* flush inflight BH runs */
> +	dma_chan_kill_bh(&ioat_chan->dma_chan);
> =20
>  	/* final cleanup now that everything is quiesced and can't re-arm */
> -	ioat_cleanup_event(&ioat_chan->cleanup_task);
> +	ioat_cleanup_event(&ioat_chan->dma_chan);

[Severity: High]
This is a pre-existing issue, but does this sequence inadvertently re-arm
the timer during teardown?

After timer_delete_sync() is called, ioat_cleanup_event() triggers a call
chain that can re-arm the timer unconditionally:

ioat_stop()
   timer_delete_sync(&ioat_chan->timer);
   ioat_cleanup_event()
      ioat_cleanup()
         ioat_cleanup_preamble()
            mod_timer(&ioat_chan->timer, jiffies + COMPLETION_TIMEOUT);

If the timer is re-armed here, could the delayed timer callback execute
after ioat_free_chan_resources() frees the completion pool memory?

Would upgrading timer_delete_sync() to timer_shutdown_sync() properly
prevent the timer from being re-armed?

[Severity: High]
This is also a pre-existing issue, but does ioat_shutdown() in=20
drivers/dma/ioat/init.c have a similar teardown problem with the BH?

In ioat_shutdown(), the driver calls timer_delete_sync() and disables=20
interrupts, but it does not appear to flush inflight BH runs like it does=20
here in ioat_stop().=20

Since the IOAT_RUN bit is not cleared in ioat_shutdown():

drivers/dma/ioat/init.c:ioat_shutdown() {
    ...
    timer_delete_sync(&ioat_chan->timer);
    ioat_reset_hw(ioat_chan);
    ...
    ioat_disable_interrupts(ioat_dma);
}

Could an interrupt firing just before ioat_disable_interrupts() successfully
schedule the BH via dma_chan_schedule_bh()?

If the module is then unloaded, could the scheduled BH execute after=20
release_ioatdma() has freed the channel structures, resulting in a=20
use-after-free?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D9
