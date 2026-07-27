Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BFA3D5C1D
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785185864; cv=none; b=UyrZOJfIYqR/XfMTnnQH3Bi/N3gzcuVlILJz9EAoUPDLlbchL0ZVG5QvpbBh5r1A9zbm0vzwx01Jdv174KQuEd4DUUXUCtQCNURi4zC4JAwEkmGt8aIg6OVrQT4lA+mxBNKHtR0OA9xrFHi0nj05abzfQjc5n2RzqfuF6GEqPcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785185864; c=relaxed/simple;
	bh=PLDAdKdtocMiCSOzlsjqOy7Kf5nXfEydfJoT4zLyfJc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dIF1DbTfBhRwCkk5VWEkYnE+7iGOU21FIfZKzsikWQB0ak/kvsuOVS0GfFlJCJVhGbAnZ4Rn7a9D3PUAs4jl2pUz2+URJMPcOWJoOzbY2obXmHoEO5QCXMG2iH+yayyyU2U5HZ9Qqln9AdV54D0KIFXiNdz5ryJeinIkaIax11M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZT4rfFQo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZT4rfFQo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8238F1F000E9;
	Mon, 27 Jul 2026 20:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785185862;
	bh=Qn1HQBCqoI+UR4MfrAdy8h15/ddB8Bp4T6duw9BoVA0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZT4rfFQo6DX6CcAKAKSxaJLTNIsYyixEkcX/46NTq7jLc9TMUx2ffCFbdPY0p6nqU
	 qIkZebrqm6BTtkn+EorqNcsLa0GTduZMQsUm0VK1q0yVJ1juHkPFZ3ZKA9mio0jzTG
	 J8wWYpCeDJMR/BvKOSJaCeZLYAmL8jzZxWyFIKQUK93tpDBxLqV8lRs1N5d7+W7sLH
	 F+8xJaZZrkWPoKPqs7YESd4IWrcVj4C9kmEeKZJfcmNrT3Hxmngd/ZSpkgn1o93cCR
	 MJRHy+ksVBVlS/s+VFnv7mllEYbbf2O3M5Vs0ZbycKkSt6x//1xBftp0v9KJPPT89j
	 cPC1INnlYWzbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/64] dmaengine: mv_xor: convert irq tasklet to
 dma_chan BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <f558c55dfee41aa28bf47f32c15e7c56be003c39.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <f558c55dfee41aa28bf47f32c15e7c56be003c39.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 20:57:42 +0000
Message-Id: <20260727205742.8238F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver fails to explicitly cancel pending bottom-half work dur=
ing module removal and initialization error paths, leading to a Use-After-F=
ree.
- [High] Interrupts are requested and unmasked before the channel spinlock =
is initialized, creating a race condition that can lead to locking an unini=
tialized spinlock.
- [High] Recursive deadlock when submitting dependent operations from the c=
ompletion handler.
--

--- Patch [12]: [PATCH v2 12/64] dmaengine: mv_xor: convert irq tasklet to =
dma_chan BH ---
commit a6fdd06d107411d5248196d2bc3b3e3a0282f10d
Author: Allen Pais <allen.lkml@gmail.com>
Subject: dmaengine: mv_xor: convert irq tasklet to dma_chan BH

This patch replaces the per-channel tasklet with the shared dma_chan BH
helper. The handler continues to run in softirq context while dmaengine
owns the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> index 25ed61f1b0899..3a70d565e1ef0 100644
> --- a/drivers/dma/mv_xor.c
> +++ b/drivers/dma/mv_xor.c

[ ... ]

> @@ -336,9 +336,9 @@ static void mv_chan_slot_cleanup(struct mv_xor_chan *=
mv_chan)
>  		mv_chan->dmachan.completed_cookie =3D cookie;
>  }
> =20
> -static void mv_xor_tasklet(struct tasklet_struct *t)
> +static void mv_xor_tasklet(struct dma_chan *c)
>  {
> -	struct mv_xor_chan *chan =3D from_tasklet(chan, t, irq_tasklet);
> +	struct mv_xor_chan *chan =3D to_mv_xor_chan(c);
> =20
>  	spin_lock(&chan->lock);
>  	mv_chan_slot_cleanup(chan);
>  	spin_unlock(&chan->lock);
>  }

[Severity: High]
This is a pre-existing issue, but can this sequence lead to a recursive
deadlock? Looking at mv_xor_tasklet(), it holds the lock while running
cleanup:

mv_xor_tasklet()
    spin_lock(&chan->lock);
    mv_chan_slot_cleanup(chan);

If mv_chan_slot_cleanup() processes completed slots and invokes
dma_run_dependencies(), the dependent operations might be submitted to the
same channel:

mv_chan_slot_cleanup()
    mv_desc_run_tx_complete_actions()
        dma_run_dependencies()
            mv_xor_tx_submit()
                spin_lock_bh(&mv_chan->lock);

Would this recursive lock attempt cause a system hang, or is there something
preventing dependencies from being queued on the same channel?

[ ... ]

> @@ -1107,7 +1107,7 @@ mv_xor_channel_add(struct mv_xor_device *xordev,
> =20
>  	mv_chan->mmr_base =3D xordev->xor_base;
>  	mv_chan->mmr_high_base =3D xordev->xor_high_base;
> -	tasklet_setup(&mv_chan->irq_tasklet, mv_xor_tasklet);
> +	dma_chan_init_bh(&mv_chan->dmachan, mv_xor_tasklet);
> =20
>  	/* clear errors before enabling interrupts */
>  	mv_chan_clear_err_status(mv_chan);

[Severity: High]
This is a pre-existing issue, but does the initialization error path proper=
ly
cancel the bottom half work before the channel structure is freed?

If a failure occurs later in mv_xor_channel_add() (like self-tests failing),
the code jumps to err_free_irq:

err_free_irq:
    free_irq(mv_chan->irq, mv_chan);
err_free_dma:
    ...

Should dma_chan_kill_bh() be called here and in mv_xor_channel_remove() to
ensure scheduled work doesn't execute after mv_chan is freed?

[Severity: High]
This is also a pre-existing issue, but is it possible for an interrupt to
fire before the channel spinlock is initialized?

In mv_xor_channel_add(), request_irq() is called and interrupts are unmasked
before the lock is initialized:

mv_xor_channel_add()
    request_irq(..., mv_xor_interrupt_handler, ...);
    mv_chan_unmask_interrupts(mv_chan);
    ...
    spin_lock_init(&mv_chan->lock);

If a spurious interrupt fires immediately and schedules the BH work, could
mv_xor_tasklet() attempt to acquire an uninitialized lock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D12
