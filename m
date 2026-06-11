Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1690A366066
	for <dmaengine@vger.kernel.org>; Thu, 11 Jun 2026 21:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781213102; cv=none; b=jcjdEpM+jlnFWc5sjXYKJoPqZxSm6xpcjsQSuFZgcgj+wn04zSV/5ybWuhxEJ79PoWywov/7KKpyNbIkRPap0O/S5smiQerc93nptNk6AfckfbkwBFAt2uXt5PTdrVnOYm6noaM3JKbNNmdq25lzrDe7IgP+PlJHbYfUNCfsp/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781213102; c=relaxed/simple;
	bh=emI4AVt1TFHRj76jZzOhp4VU+zQCV6nQWgg2QM6tKNE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hL0HJ5iK+jYle60V0MpRJ7AKkdU5cJvuYDjIgAxQNMyQ05yc8kGhto/oIF+u1UiYdMJca8pPl4FU5fWBayZZ+7W/DD+s6CTdrh4NPEEhXdj4q9ewGT+zeX62fofIrRLpkoKATZoHNH8+ER0X5TQT8FJAW688KtBgPnlZ7kjGi3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G3AZdCcn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G3AZdCcn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C511F000E9;
	Thu, 11 Jun 2026 21:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781213100;
	bh=ZUscYHXn1TjePUIFe4+LH/vOGtM7EcbuouHSueR6ug0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G3AZdCcn0JwDLxO1mzZ6eJ+/8xHrMZdgTzlXE4PJsua3Q98ej5GdoF0/6dTPV9Pmb
	 uSk/NSblO5vEfvsa7UdQKGVHyxNEFB+ZRfNQGsZ1SKN8aMdK/3gs6VEmjTmPuJVinq
	 HcWEpPg5zRgBeL2/rhVOKgVx/ftTiTVyZ5o5LzfOe9UlFEiF5k8JSMpi3PfngJ937X
	 AnHFUcmYzrs3xQYF/wVGhZ14Uy8EYzLQ7ZybnhKpYZXBwvqWDlKUMoh0C3rxgJrnI9
	 mngjKnoX+kLax41FA3kLenfhFLfHbJ5/uOGSoqpXxSxezMCn5vkmE/nNCuf/4mITBt
	 HL9HInt/ccX1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2 2/9] dmaengine: mv_xor: fix use-after-free in probe
 error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260611210721.81979-3-rosenp@gmail.com>
References: <20260611210721.81979-3-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 21:24:59 +0000
Message-Id: <20260611212500.74C511F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Calling `tasklet_kill()` before `free_irq()` in `mv_xor_channel_re=
move()` leaves a race window where an already-executing interrupt handler c=
an reschedule the tasklet, resulting in a use-after-free.

Pre-existing issues:
- [High] Missing `tasklet_kill()` in the `mv_xor_channel_add()` error path =
leaves a pending tasklet that can access freed memory if initialization fai=
ls.
--

commit 79a37fa3f544ad8d57b96e286e15552cea6f20be
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: mv_xor: fix use-after-free in probe error path

This commit attempts to fix a use-after-free in the probe error path by
masking hardware interrupts and calling tasklet_kill() at the start of
mv_xor_channel_remove(). This is intended to ensure no new interrupts can
schedule the tasklet during teardown.

> diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> index 25ed61f1b0899..8e8902bbda9ac 100644
> --- a/drivers/dma/mv_xor.c
> +++ b/drivers/dma/mv_xor.c
[ ... ]
> @@ -1011,6 +1019,9 @@ static int mv_xor_channel_remove(struct mv_xor_chan=
 *mv_chan)
>  	struct dma_chan *chan, *_chan;
>  	struct device *dev =3D mv_chan->dmadev.dev;
> =20
> +	mv_chan_mask_interrupts(mv_chan);
> +	tasklet_kill(&mv_chan->irq_tasklet);

[Severity: High]
Could calling tasklet_kill() here, before free_irq(), leave a race window?

While mv_chan_mask_interrupts() prevents new interrupts from being raised by
the hardware, it does not stop an interrupt handler that is already
executing on another CPU.

If tasklet_kill() runs concurrently while the ISR is executing but before
it calls tasklet_schedule(), tasklet_kill() will see the tasklet is neither
scheduled nor running, and return immediately. The ISR will then schedule
the tasklet.

Later in mv_xor_channel_remove():

	free_irq(mv_chan->irq, mv_chan);

free_irq() waits for the ISR to finish but does not cancel the newly
scheduled tasklet. When the mv_chan structure is subsequently freed via
devres, might the pending tasklet execute on freed memory?

Should tasklet_kill() be called after free_irq() ensures no ISR is running?

> +
>  	dma_async_device_unregister(&mv_chan->dmadev);
> =20
>  	dma_free_wc(dev, MV_XOR_POOL_SIZE,

[Severity: High]
This is a pre-existing issue, but does the mv_xor_channel_add() error path
also need a tasklet_kill() call?

During mv_xor_channel_add(), the self-test functions submit DMA transactions
that trigger real hardware interrupts, scheduling mv_chan->irq_tasklet.

If a self-test times out or dma_async_device_register() fails, the code
jumps to the err_free_irq label, which calls free_irq() but omits
tasklet_kill().

Since the mv_chan structure is devm-allocated, it will be automatically
freed when the probe function returns an error. Could the pending tasklet
then execute on freed memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611210721.8197=
9-3-rosenp@gmail.com?part=3D1
