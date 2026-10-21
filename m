Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792618304;
	b=oUQQMsRgRogZ8BUg92CNP5syji3lxXysJjOlo7Svcm8GkPYL7j7xPrWKyVFsUF/6uNOl
	 lJLgWOcMW0VRZJ+nGMr/0pwMSe2MuoRv5tHnFicJHtiUriK3R+5rXPj/BBTowBhPCtOuN
	 TQ3F7ybd6pc9GEApQTGcVdXXC761uoAxmubBqmz8Z3KrDSntZVG4Y4AiQEwIHVuyU2VDX
	 l/F6S1YCoIEqZgj/dSk0SdU5xyy7/6VzjYSEA7iPv1LiY0RUwKn/8J5/cGbGl/t0Gnk5T
	 UTo8jvywLhRMpA1+DuJ3CUwF4/ixvZbx1XAw/sjxUdur5aXJj8dGWbk+YizhoSaU4Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792618304;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RalpsOhcVQmmJ2YUWdFB4XOgfSOQE8n8Imlg3kjcUa8=;
	b=vtGtEgbmfuf4ydSmOVymlU8Lx7b/p33Qf9bkFHnXrRXRNNDujC9Jm5GyfB9pS8Bhw3Sl
	 B3aA2GBqqotoke/kOmPARGKIOsOwwYUaMhLd8cxLGhZleOMOtMuSiHYP1thxSdEzmYYkE
	 fbKq3duhvPiik4x7ApRWOjj2TAA2syIKhq5wyuzUeGvCmdO+tUBeUdpsEGLBON9IE7qbh
	 hXcNklYWkgyE3hGd2Apd/vQc/ASVe+NftjXLbmIJEp01p51CjLmlJJRZBLm20rdQYpPZr
	 +SN40Qv/xa47BalvdOIIA94SW1Wp4NVbU90lUHZg/V3w9kZR8zfl+iUsmU1hK3s9pnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OUSbUfFP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BA6606A31A
	for <dmaengine@vger.kernel.org>; Wed, 21 Oct 2026 21:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OUSbUfFP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E4A51F000C1;
	Wed, 21 Oct 2026 21:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792618303;
	bh=RalpsOhcVQmmJ2YUWdFB4XOgfSOQE8n8Imlg3kjcUa8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OUSbUfFPKL8rOvr/SkHi+MDSr/eK1HKrW6Kn+VeG1pMUP+GLn4XVFTJY89P6kQXqR
	 y2gR0DvqChOsN7MreCEWSQE2z7B7SpwcFQU6lZ7H32WXYaI+X6b4DZyEZuigEQ/N2C
	 MWRyWTvRdG/B7FEZ5a/pbkSETI6mQ4gxUAuCsr0In28/mLgY+gE0isj36+AYd+5X9V
	 6ZR1/B8b1IckBjGiPIuS8sCpFTb0DD9/WIqhJObh5Shw4MSPYtaKhHuSYbkDQAOENv
	 CgVBNYRMN4QN1aDI+2Ve+adSA+6xmpTECCTe/1FgYMa2d9am3aZwOXcezUB0T+049h
	 8dcGZ8lgpQubA==
Message-ID: <sashiko-outbox-180707@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: dw: synchronize completion callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261021-submit-dw-dma-synchronize-v1-v1-1-6af85c2d6f69@gmail.com>
References: <20261021-submit-dw-dma-synchronize-v1-v1-1-6af85c2d6f69@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 21:31:42 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: dw: tasklet_kill() in dwc_synchronize() drops shared ta=
sklet runs
--

commit 095fd30b59df2969f093996b0e32af6cace0812f
Author: James Hilliard <james.hilliard1@gmail.com>

dmaengine: dw: synchronize completion callbacks

This commit implements the device_synchronize callback for the DesignWare D=
MA
controller by calling tasklet_kill() on the shared controller tasklet to wa=
it
for in-flight completion callbacks.

> diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
> index dd75f97a33b3d..eb3f5ce471a22 100644
> --- a/drivers/dma/dw/core.c
> +++ b/drivers/dma/dw/core.c
> @@ -965,6 +965,14 @@ static int dwc_terminate_all(struct dma_chan *chan)
>  	return 0;
>  }
> =20
> +static void dwc_synchronize(struct dma_chan *chan)
> +{
> +	struct dw_dma *dw =3D to_dw_dma(chan->device);
> +
> +	/* Callbacks run outside the channel lock in the controller tasklet. */
> +	tasklet_kill(&dw->tasklet);
> +}

[Severity: High]
Can calling tasklet_kill() on the shared dw->tasklet here drop a concurrent
tasklet_schedule() from another active channel and leave controller
interrupts permanently masked?

In kernel/softirq.c, tasklet_action_common() clears TASKLET_STATE_SCHED
before invoking dw_dma_tasklet(). When dwc_synchronize() calls
tasklet_kill(), it acquires TASKLET_STATE_SCHED via wait_on_bit_lock(),
waits for TASKLET_STATE_RUN to clear in tasklet_unlock_wait(), and then
clears TASKLET_STATE_SCHED:

kernel/softirq.c:tasklet_kill() {
    ...
    wait_on_bit_lock(&t->state, TASKLET_STATE_SCHED, TASK_UNINTERRUPTIBLE);

    tasklet_unlock_wait(t);
    tasklet_clear_sched(t);
}

While tasklet_kill() holds TASKLET_STATE_SCHED, dw_dma_tasklet() can finish
and re-enable MASK.XFER and MASK.ERROR across all channels before clearing
TASKLET_STATE_RUN:

drivers/dma/dw/core.c:dw_dma_tasklet() {
    ...
    /* Re-enable interrupts */
    channel_set_bit(dw, MASK.XFER, dw->all_chan_mask);
    channel_set_bit(dw, MASK.ERROR, dw->all_chan_mask);
}

If dw_dma_interrupt() fires for another active channel while tasklet_kill()
still holds TASKLET_STATE_SCHED, the interrupt handler masks XFER, BLOCK,
and ERROR across all channels and calls tasklet_schedule(&dw->tasklet):

drivers/dma/dw/core.c:dw_dma_interrupt() {
    ...
    channel_clear_bit(dw, MASK.XFER, dw->all_chan_mask);
    channel_clear_bit(dw, MASK.BLOCK, dw->all_chan_mask);
    channel_clear_bit(dw, MASK.ERROR, dw->all_chan_mask);
    ...
    tasklet_schedule(&dw->tasklet);
}

Because TASKLET_STATE_SCHED is already set by tasklet_kill(),
tasklet_schedule() sees test_and_set_bit(TASKLET_STATE_SCHED, &t->state)
return true and skips __tasklet_schedule(). When tasklet_kill() then calls
tasklet_clear_sched(), the scheduled run is lost without dw->tasklet ever
being queued, leaving MASK.XFER and MASK.ERROR disabled for the entire
controller.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-submit-dw-=
dma-synchronize-v1-v1-1-6af85c2d6f69@gmail.com?part=3D1
