Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7E33CFF6F
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 06:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785134467; cv=none; b=iE79gTrO8Jt2NimOu80XAs9bJh4MxgZs3FRH81ERaWmYF5oqlZFfb97nbFgIbDY9FDhJREHV8d8oWb5o0eb+kbMR/UZV0uq9f2WA89/pkcFZkbhHevskH9N4lcozLw4pjMI/lf0s6uWVUZzKtM4s09js6BkFBkSKlEJMsz7UeVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785134467; c=relaxed/simple;
	bh=woSHS1VxNHP5wscTz92v20btufHWX7jWcStUFlMwBSQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EvwDpVlU/d0uYvN31JX+Ag2UVXj7VTQ2RWN3c3RpJHzK8fVzPuiUFyIjgINACDOy6C9NdZo0sM3YysyM03Zpj8XaD9Eg/gBbzybfnYiAYq5gtSjnY/vlu0OdgkjDZTZSq+hBvIyXPA8NZmRcQhoKIjRUPBMfKv+bySz+gdhxC3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eu6peQyP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eu6peQyP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5111F000E9;
	Mon, 27 Jul 2026 06:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785134465;
	bh=3k8GduzSmJNhTo4RLWNPKIKCp082Uy5NGksF91ZrhwE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eu6peQyPkNMotK9OnlQJ0Dj+A6pNOOp5HRuzYKga3NR+g4i/fIsC0pKNyAxHRrEwB
	 18K8AoTHyN/a2tgTwJpvl9jYotvMO6+gWhOwTKUdchjWdO60cHzSfcfji65dXzU/e0
	 ZmyTLECpOohH9ugbVP5i6SoFR+RmE/Gdgn37jTeoF1r73sbltpDZ7SIdqVnAhAB9Ny
	 G29x3IZjfce03LH6adhT0rZq9apzI8PdL+tUj2ZIx9o8xPUblc5ew4lDqYa1f72Ixq
	 fEbSeOvU69s1KaDSWFUPa9JKuUqRqxed1BXTC3U0OzfOt5vTfmNsY+FfCu/Y//Wjsb
	 7diYz9PORviaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2] dma: at_hdmac: Use stored IRQ in error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongling Zeng" <zenghongling@kylinos.cn>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260727062917.46905-1-zenghongling@kylinos.cn>
References: <20260727062917.46905-1-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 06:41:05 +0000
Message-Id: <20260727064105.8E5111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing tasklet_kill() in the device remove path can lead to Use-A=
fter-Free if the device is forcibly unbound.
--

--- Patch [1]: [PATCH RESEND v2] dma: at_hdmac: Use stored IRQ in error pat=
h ---
commit a2d04416b94efa75bbae4e7c156c0d75fc20608a
Author: Hongling Zeng <zenghongling@kylinos.cn>

dma: at_hdmac: Use stored IRQ in error path

When request_irq() succeeds but a later error occurs in at_dma_probe(),
the error handling path attempts to free the IRQ by calling
platform_get_irq() again. This commit updates the error handling path
to use the previously stored irq variable instead, clarifying the code
and resolving warnings.

> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index e5b30a57c477a..2a860679b9e1c 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c

[ ... ]

This is a pre-existing issue, but while reviewing the IRQ and teardown
changes in this file, I noticed a potential problem in at_dma_remove():

drivers/dma/at_hdmac.c:at_dma_remove() {
    ...
	list_for_each_entry_safe(chan, _chan, &atdma->dma_device.channels,
			device_node) {
		/* Disable interrupts */
		atc_disable_chan_irq(atdma, chan->chan_id);
		list_del(&chan->device_node);
	}
    ...
}

[Severity: High]
Does this code miss a call to tasklet_kill() for the virtual DMA tasklet?

If a device unbind occurs while a DMA transaction is active, and the DMA
interrupt fires just before free_irq() is called in at_dma_remove(), the
interrupt handler will schedule the virtual DMA tasklet.

Since tasklet_kill() is not called to cancel pending tasklets before
returning, the tasklet remains queued on the CPU softirq list. Once
at_dma_remove() completes and the devres subsystem automatically frees
the atdma memory structure, the tasklet will subsequently execute and
access the freed virt_dma_chan memory. Can this lead to a Use-After-Free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727062917.4690=
5-1-zenghongling@kylinos.cn?part=3D1
