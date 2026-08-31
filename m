Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67750470451
	for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 15:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190593; cv=none; b=a7Lm24jaieAJA8A9H2MMh1p8DyVPPSLFCOJyYjOFrV9Z6Ok2FaON6ic1lUjIzfUjdfC/FYcv2VEBuAvKYDkINV4c8hIgsPqkL+PtFch/gYpRTNAv0I8DSeSAr6tZAXpbZMkw4zTcoL3OubisVgPWgobJPOXy2XCT1bLuNA+k0b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190593; c=relaxed/simple;
	bh=wZ3RtsZHYvFlIwgKj0gQ87sg+31XSoVtYxJJusiqZbY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A8Uy4+sfUPRkJUMxv7ZrqhECnPmDmUJtac+uwmySkbCWdWFNaEDZU4hcG2Ea8Nhhml7Si7YeBGhQayqV5PM4TQ3+sSZ9sMHwSOmrjR5skF2pkspwfQUTN5JTg8xn15GGNLJ9jnFupaHDQoa93HKNFaOW+H9wLQhLZ9Z9F/aznyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FMwNWtYS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FMwNWtYS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5BB31F000E9;
	Mon, 31 Aug 2026 15:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788190592;
	bh=joMUGhwUTusbq7TaU8TzTVffOiQZOAjGBi+yJZOuIEc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FMwNWtYSdYtDzLB+GeKHb8tH0Z264TGVHx91uZTK4gv0If6ydOl7uX0Fxr5jmXy86
	 diLinfzG57oIW7b3zYnC2O3xX/PZpBzi5otzE6ktqR2Z4T7yiLMojTC3q8mOdpzUpI
	 dXOh/KfSwUks7fI/imEwIeOkxUCuc7xivcYWakMhqcS+/VqTGL4s1GFISa2Xn0/G+d
	 hNlfAP4omWwwmyGeJ5qDCW3Ou1jN8ymNsOZyG15/4n9SdpxoEqu7+ZKZQppPnbkupO
	 iEYxaf077cud0YYxXS7nJkM1XlziIzt6pcfqkkuWGx9sZgbXqkHWZYquOA2dd45feh
	 5iDBB+pXUNgWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-6.12] dmaengine: altera-msgdma: Use
 memcpy_toio for descriptor FIFO writes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260831133314.4125787-290-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-290-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 15:36:31 +0000
Message-Id: <20260831153631.C5BB31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Low] Duplicate `static_assert` declaration.

Pre-existing issues:
- [Critical] Inconsistent MMIO accessor variants used for the same FIFO, ca=
using data corruption on big-endian architectures.
- [Critical] Handling of zero-length transfers allocates a descriptor witho=
ut accounting for it, causing out-of-bounds memory writes if the free list =
is empty.
- [High] Unbounded `mdelay(1)` loop while holding a spinlock with interrupt=
s disabled.
- [High] Interrupt handler is registered before the spinlock and lists it r=
elies on are initialized.
--

commit 53559846cb40149ec4edf05249c1dcd2c2956df1
Author: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

dmaengine: altera-msgdma: Use memcpy_toio for descriptor FIFO writes

This commit fixes an issue where the descriptor body copy was using memcpy()
with a cast to __iomem, which does not guarantee proper MMIO access across
all architectures. It replaces the body copy with memcpy_toio(), excluding
the final control word which is still written separately.

Link: https://patch.msgid.link/f6f3b4a2e2eb0eb1a51976de3f5d1ef5bab9bd76.177=
9697226.git.tze.yee.ng@altera.com

> diff --git a/drivers/dma/altera-msgdma.c b/drivers/dma/altera-msgdma.c
> index a203fdd84950e..e1811a9be0bbe 100644
> --- a/drivers/dma/altera-msgdma.c
> +++ b/drivers/dma/altera-msgdma.c
> @@ -498,6 +498,11 @@ static void msgdma_copy_one(struct msgdma_device *md=
ev,
>  {
>  	void __iomem *hw_desc =3D mdev->desc;
> =20
> +	/* Ensure control is the last field =E2=80=94 required for correct FIFO=
 flush ordering */
> +	static_assert(offsetof(struct msgdma_extended_desc, control) =3D=3D
> +		      sizeof(struct msgdma_extended_desc) - sizeof(u32),
> +		      "control must be the last field in msgdma_extended_desc");
> +
>  	/*
>  	 * Check if the DESC FIFO it not full. If its full, we need to wait
>  	 * for at least one entry to become free again
>  	 */
>  	while (ioread32(mdev->csr + MSGDMA_CSR_STATUS) &
>  	       MSGDMA_CSR_STAT_DESC_BUF_FULL)
>  		mdelay(1);

[Severity: High]
This is a pre-existing issue, but could this unbounded mdelay(1) loop cause=
 a
hard lockup?

This function is called by msgdma_issue_pending() and msgdma_irq_handler()
which both hold mdev->lock and disable local interrupts. Busy-waiting for
milliseconds inside an IRQ-disabled atomic context will stall the CPU and
cause a hard lockup if the hardware stalls.

> =20
> +	/* Ensure control is the last field =E2=80=94 required for correct FIFO=
 flush ordering */
> +	static_assert(offsetof(struct msgdma_extended_desc, control) =3D=3D
> +			sizeof(struct msgdma_extended_desc) - sizeof(u32),
> +			"control must be the last field in msgdma_extended_desc");
> +

[Severity: Low]
this isn't a bug, but you've duplicated this static_assert statement from
a few lines above.

>  	/*
> -	 * The descriptor needs to get copied into the descriptor FIFO
> -	 * of the DMA controller. The descriptor will get flushed to the
> -	 * FIFO, once the last word (control word) is written. Since we
> -	 * are not 100% sure that memcpy() writes all word in the "correct"
> -	 * order (address from low to high) on all architectures, we make
> -	 * sure this control word is written last by single coding it and
> -	 * adding some write-barriers here.
> +	 * Copy the descriptor into the descriptor FIFO of the DMA controller,
> +	 * excluding the control word. The FIFO is flushed and the descriptor
> +	 * becomes valid once the control word is written last.
>  	 */
> -	memcpy((void __force *)hw_desc, &desc->hw_desc,
> -	       sizeof(desc->hw_desc) - sizeof(u32));
> +	memcpy_toio(hw_desc, &desc->hw_desc,
> +		    offsetof(struct msgdma_extended_desc, control));
> =20
>  	/* Write control word last to flush this descriptor into the FIFO */
>  	mdev->idle =3D false;
>  	wmb();
>  	iowrite32(desc->hw_desc.control, hw_desc +
>  		  offsetof(struct msgdma_extended_desc, control));

[Severity: Critical]
This is a pre-existing issue, but does mixing memcpy_toio() and iowrite32()=
 on
the same hardware FIFO corrupt descriptor data on big-endian platforms?

The patch uses memcpy_toio() which preserves CPU byte order for the first 28
bytes of the descriptor, and iowrite32() which performs CPU-to-little-endian
byteswapping on big-endian architectures for the final 4-byte control word.

Writing to the same hardware FIFO with mixed accessor variants violates the
subsystem guidelines and ensures the descriptor will be malformed on
big-endian platforms.

[Severity: High]
This is a pre-existing issue, but is the interrupt handler registered before
the spinlock and lists it relies on are initialized?

drivers/dma/altera-msgdma.c:msgdma_probe() {
[ ... ]
	ret =3D devm_request_irq(&pdev->dev, mdev->irq, msgdma_irq_handler,
			       0, dev_name(&pdev->dev), mdev);
	if (ret)
		return ret;

	tasklet_setup(&mdev->irq_tasklet, msgdma_tasklet);

	dma_cookie_init(&mdev->dmachan);

	spin_lock_init(&mdev->lock);
[ ... ]
}

If a shared or spurious interrupt fires immediately during device probe,
msgdma_irq_handler() will attempt to lock the uninitialized mdev->lock and
access uninitialized list heads.

[Severity: Critical]
This is a pre-existing issue, but does a zero-length transfer bypass the fr=
ee
list capacity check and cause out-of-bounds memory writes?

drivers/dma/altera-msgdma.c:msgdma_prep_memcpy() {
[ ... ]
	desc_cnt =3D DIV_ROUND_UP(len, MSGDMA_MAX_TRANS_LEN);

	spin_lock_irqsave(&mdev->lock, irqflags);
	if (desc_cnt > mdev->desc_free_cnt) {
		spin_unlock_irqrestore(&mdev->lock, irqflags);
		dev_dbg(mdev->dev, "mdev %p descs are not available\n", mdev);
		return NULL;
	}
	mdev->desc_free_cnt -=3D desc_cnt;
	spin_unlock_irqrestore(&mdev->lock, irqflags);

	do {
		/* Allocate and populate the descriptor */
		new =3D msgdma_get_descriptor(mdev);
[ ... ]
}

If len =3D=3D 0, desc_cnt evaluates to 0. The bounds check passes even if
mdev->desc_free_cnt is 0. The function then unconditionally enters the do-w=
hile
loop and allocates a descriptor without accounting for it.

When msgdma_get_descriptor() calls list_first_entry() on the empty free_lis=
t,
it will return an invalid pointer aliasing the device struct. Subsequent
list_del() and hardware descriptor initialization will corrupt adjacent mem=
ory
inside mdev.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831133314.4125=
787-290-sashal@kernel.org?part=3D1
