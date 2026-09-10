Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE29537AA86
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 20:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789070447; cv=none; b=nijp7fqodpDr43wVY+W1Dc39yyMzqW498X1LgK7PXrZJg0cyoeMjxo8Ls76/6zmc7K6zhYnOMm/nIHX30anhX18FrBxIUg/JX5GF4sMYP2sOIDFpq9exJeOeSs19mpXf5RR54L2SWYQHyTpuw0H8Hp1a8VgQNJj5cwCC9WnkxIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789070447; c=relaxed/simple;
	bh=Raz/Qq0ZUsR6hjkbyUvoPeLrotfvJknnoS83ztxsEW0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hwDCPhhW7SI/bo6P3aNzTpXcn/e1ET68COobK6rV+nXLTw/NbK4h/jYAIT0vkYqdEc1pmLxq2jf6G4KI29JSvWwRsGB7wbM23ydME44x+Uv1FWu7G5XZpcuTZAZtnlHydI3EsPeZZidiMtg/fPujSVlKplkQ9/RSksP8xTcnhE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kr1pXcj/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kr1pXcj/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2781F000FF;
	Thu, 10 Sep 2026 20:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789070445;
	bh=CntYBnlyghtP6q9BDib/0Hh8DRYiHzvAw6US9hOsR0Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kr1pXcj/TmnnN6cWLwOzuzY0KGDmPFBMbE9b/kr32vJqDUDzendE7M0BmMzrjorZu
	 uQFy5UfiD4/9Nkz4VOKNr9nXnFSaCfMJLTvIkzewOEUGuFjKKEnjBKFov6oaZ5qbdE
	 SIy/t86a3maBhFO2GgkvVSBkQj3buv4CQQ6r8bLFnLxanponJqLSFTsZy/GXPGbNBS
	 qnL2AEZZKVS2HYlyMlLByK0+3vXPMddfIWLRm3wP6k+lhf7+kGP+R1g5lIa2fWv94x
	 GV+kNJmGDdF1FXol0RkCm3QzzOL3qOdj7Z0orGaS92s68Tj8bP/E9r+x2KvsHgtUE9
	 hdkVKpyelkqyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] dmaengine: fsl_raid: switch __b32 to u32
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260910194616.34760-1-rosenp@gmail.com>
References: <20260910194616.34760-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 20:00:45 +0000
Message-Id: <20260910200045.6C2781F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The commit message claims that the CDB structures keep their `__be=
32` annotations because they are correctly written via `cpu_to_be32()`. How=
ever, the driver directly assigns native `u32` values to the `cdb32` fields=
 of the XOR, PQ, and MOVE structures without using `cpu_to_be32()`, violati=
ng the claim and leaving an endianness bug on little-endian architectures.
- [High] Lock held while invoking client DMA callback, causing a self-deadl=
ock if the client submits a new transaction.
- [High] Missing `free_irq()` leads to IRQ leak and potential use-after-fre=
e.
- [High] Erroneous bitwise logic for splitting ring base addresses causes s=
ilent truncation.
--

commit 7b9c559b3810d3491f22a6353857e63e9743b1e1
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: fsl_raid: switch __b32 to u32

The register maps in fsl_raid.h annotate every field as __be32, but
they are accessed only through ioread32be()/iowrite32be(), which
already perform the byte swap and take plain u32 __iomem pointers.
The __be32 annotation therefore makes sparse reject each access:

  drivers/dma/fsl_raid.c:116:17: sparse: incorrect type in argument 1
      (different base types) ... got restricted __be32 [noderef] __iomem *

Drop __be32 from struct fsl_re_ctrl and struct fsl_re_chan_cfg; the
descriptor/CDB structures written via cpu_to_be32() keep their
annotations.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608200637.ro1CqMxi-lkp@int=
el.com/
Fixes: 68b7fbc23529 ("dma: fsl_raid: keep MMIO bases as void __iomem and ca=
st at access")
Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Drop __be32 from struct fsl_re_ctrl and struct fsl_re_chan_cfg; the
> descriptor/CDB structures written via cpu_to_be32() keep their
> annotations.

[Severity: High]
This isn't a bug introduced by this patch, but the commit message claims
that the CDB structures keep their __be32 annotations because they are
correctly written via cpu_to_be32().

Is this description accurate? Looking at fsl_re_prep_dma_genq(), the driver
directly assigns native u32 values to the cdb32 field of the XOR structure
without using cpu_to_be32():

drivers/dma/fsl_raid.c:fsl_re_prep_dma_genq() {
    ...
    xor->cdb32 =3D cdb;
    ...
}

Similar direct assignments occur in fsl_re_prep_dma_pq() for pq->cdb32
and fsl_re_prep_dma_memcpy() for move->cdb32.

Could this lead to the DMA hardware receiving a byteswapped command
descriptor block on little-endian architectures, causing it to misinterpret
opcodes and potentially corrupt memory?


[Severity: High]
This is a pre-existing issue, but can a self-deadlock occur if the client
callback submits a new transaction?

drivers/dma/fsl_raid.c:fsl_re_tx_submit() {
    ...
    spin_lock_irqsave(&re_chan->desc_lock, flags);
    ...
}

drivers/dma/fsl_raid.c:fsl_re_dequeue() {
    ...
    fsl_re_desc_done(desc);
    ...
}

If a client submits a new DMA transaction from the callback triggered by
fsl_re_desc_done() while re_chan->desc_lock is still held, fsl_re_tx_submit=
()
will unconditionally attempt to acquire the exact same lock again. Does this
result in a complete system hang?


[Severity: High]
This is a pre-existing issue, but does this code leak the IRQ and potential=
ly
cause a use-after-free?

drivers/dma/fsl_raid.c:fsl_re_chan_probe() {
    ...
    ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
    ...
}

drivers/dma/fsl_raid.c:fsl_re_remove_chan() {
    ...
    tasklet_kill(&chan->irqtask);
    ...
}

The teardown function kills the tasklet but appears to miss the required
free_irq() call. If the module is unloaded or the device is unbound, and an
interrupt fires after the re_chan structure is freed, will the ISR
fsl_re_isr() dereference the freed pointer?


[Severity: High]
This is a pre-existing issue, but is the bitwise logic for splitting ring
base addresses correct here?

drivers/dma/fsl_raid.c:fsl_re_chan_probe() {
    ...
    out_be32(&chan->jrregs->inbring_base_h,
             chan->inb_phys_addr & FSL_RE_ADDR_BIT_MASK);
    out_be32(&chan->jrregs->oubring_base_h,
             chan->oub_phys_addr & FSL_RE_ADDR_BIT_MASK);
    out_be32(&chan->jrregs->inbring_base_l,
             chan->inb_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
    ...
}

This logic appears to use an incorrect mask and shift, truncating the high
bits and completely shifting out the low bits. Could this result in the DMA
rings being placed at the wrong physical memory locations, leading to
immediate DMA failure or memory corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910194616.3476=
0-1-rosenp@gmail.com?part=3D1
