Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CFF3C4B83
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 20:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789073928; cv=none; b=hNp+/vy4iIiqBdlGz9a7gjix/aiRDu14c88ncSo1wq7ESayomJ2hEZxTpAv1oui2y6jPIuD3EjF2tf3HiVZBvJ5OsuxWzv1XvK602I7wHkdOEHAsyxLFRk5fLICpfv+mTsPBOBry9E03zJ8CqJoRYaMZVXqRwvVp17hohNqm/BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789073928; c=relaxed/simple;
	bh=tem6cerhUlmMSttCk8GMk62sViSlAvGDaDw+6CZjEsE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BpWtp7mP7dq/CyMd4Lq331lBBcQTCzfI2axhvpvcEDPhjlKnqcA1mZzwcgamJtMzIHNnAttRbYOWff0kPQNRI9I7DssDpIAjVq3MrQ0DeFMBaN8fBIJOD4QMSwCZyo1U3/9aqX6HBmqddlQGn1rqu/1n+IbNfKewRIL5Mb0Rhz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7thicaU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7thicaU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267111F000FF;
	Thu, 10 Sep 2026 20:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789073925;
	bh=NKCZNvW/F6uOp8rUNhsacXm9dq84YvgZY7AW7Bt90P8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O7thicaUev4yVyCbPV3fXpLi6Ym+nZhfh8Z7WSo6dUFuPT2LlZ/6z5N7sGiTx95si
	 Q0kHGs0qIeqDlAHBJres/rwEE7F2eSPv2ydko6kp9fso0x/2aRBVd96AISddns1tiC
	 Jfp4U+u3B7Iz9eQPZ/P2fWgBV40a3SD0T5BCRG8m9rnmJpnrW/UQkH1oEVY5/bkZSv
	 qDJ6AuHkLkXR/USthjPdnJJIySnkgYvogGfn6M6CkCB+Di30Kr7jqVENTrjJt1YjCc
	 pmj8nkXmYo898bfN1BD9z/jdlkfayw1qmhaM8cAGSx5NVOrwU+Me8ABcIPAUVoCuC/
	 nVthb/Ri5PGDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] dmaengine: fsldma: convert to
 platform_get_irq_optional()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260910204625.55367-1-rosenp@gmail.com>
References: <20260910204625.55367-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 20:58:44 +0000
Message-Id: <20260910205845.267111F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Low] The patch introduces an unused label `out_iounmap:`, which will cau=
se a compiler warning and break kernel builds configured with -Werror.

Pre-existing issues:
- [Critical] Missing `tasklet_kill()` during channel removal can lead to a =
use-after-free of the channel structure memory.
- [High] The driver ignores the return value of `dma_async_device_register(=
)`, leading to a silent failure state and potential kernel oops on module r=
emoval.
- [High] The error path in `fsldma_suspend_late` unlocks `desc_lock` for ch=
annels that were already unlocked, leading to a double-unlock kernel panic.
--

commit 8cf71591d829b94cb515a6922619751103de2f0d
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: fsldma: convert to platform_get_irq_optional()

Replace the per-controller irq_of_parse_and_map() call with
platform_get_irq_optional(). The controller IRQ is optional when absent
and the driver falls back to per-channel IRQs. The corresponding
irq_dispose_mapping() calls in the probe error path and remove function
are removed.

> diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
> index 22d62d958abd9..0637a7b2e14d0 100644
> --- a/drivers/dma/fsldma.c
> +++ b/drivers/dma/fsldma.c

[ ... ]

> @@ -1300,7 +1307,7 @@ static int fsldma_of_probe(struct platform_device *=
op)
>  		if (fdev->chan[i])
>  			fsl_dma_chan_remove(fdev->chan[i]);

[Severity: Critical]
This is a pre-existing issue, but does fsl_dma_chan_remove() need to call
tasklet_kill() before freeing the channel memory?

drivers/dma/fsldma.c:fsl_dma_chan_remove() {
	irq_dispose_mapping(chan->irq);
	list_del(&chan->common.device_node);
	iounmap(chan->regs);
	kfree(chan);
}

A tasklet scheduled by the device's IRQ handler can execute after this frees
the channel memory via kfree(chan). The free_irq() function waits for
executing IRQ handlers but does not wait for or kill scheduled tasklets,
potentially leading to a use-after-free.

>  	}
> -	irq_dispose_mapping(fdev->irq);
> +out_iounmap:

[Severity: Low]
Does this introduce an unused label?

The patch introduces out_iounmap:, but nothing seems to jump to it, which
will cause a compiler warning and break kernel builds configured with -Werr=
or.

>  	iounmap(fdev->regs);
>  out_free:
>  	kfree(fdev);

[ ... ]


[Severity: High]
This is a pre-existing issue, but does the driver ignore the return value of
dma_async_device_register() in fsldma_of_probe()?

drivers/dma/fsldma.c:fsldma_of_probe() {
    ...
	dma_async_device_register(&fdev->common);
	return 0;

out_free_fdev:
    ...
}

If dma_async_device_register() fails, it returns a negative error code,
leaving fields like the device IDA and refcount uninitialized or zeroed.
Because the driver ignores this failure, it will complete the probe
successfully.

During module removal, dma_async_device_unregister() will execute on these
uninitialized internal fields, potentially triggering an oops.


[Severity: High]
This is a pre-existing issue, but does fsldma_suspend_late() unlock
desc_lock for channels that were already unlocked?

drivers/dma/fsldma.c:fsldma_suspend_late() {
    ...
	for (i =3D 0; i < FSL_DMA_MAX_CHANS_PER_DEVICE; i++) {
        ...
		spin_lock_bh(&chan->desc_lock);
		if (unlikely(!chan->idle))
			goto out;
        ...
		spin_unlock_bh(&chan->desc_lock);
	}
	return 0;

out:
	for (; i >=3D 0; i--) {
		chan =3D fdev->chan[i];
		if (!chan)
			continue;
		chan->pm_state =3D RUNNING;
		spin_unlock_bh(&chan->desc_lock);
	}
	return -EBUSY;
}

In the forward loop, spin_unlock_bh(&chan->desc_lock) is correctly called on
successful iterations.

If a subsequent channel is not idle, the code jumps to out and iterates
backwards from the failing channel down to 0, unconditionally calling
spin_unlock_bh(&chan->desc_lock) for all previously processed channels.

Can this unlock locks that were already released during the forward loop's
successful iterations, leading to a double-unlock panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910204625.5536=
7-1-rosenp@gmail.com?part=3D1
