Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611682045AD
	for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 20:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784234828; cv=none; b=VHCDfRHmKIhQft4kJP/+AFE8m5jEQRspOqosFhUpqHnPd/MDNtrPvpGiZXfm0n9wrFnhC9qcB5IEYidfgxWLRHexAYvuvpJSC2lXE+JCXig46dthJ7yiNpsyaYODfguAK0Jz9mrB45WTZU0qs9wwRIHscPHofEXbKgmFs5S8GPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784234828; c=relaxed/simple;
	bh=BASo4aagZyjuZjvwsC2yx8Tntdaflnb3LC5yn6ZXHIo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H0pPC4JqDJl5rC7oQbgdQUYCXPdOtTnWDthjmfJS20+rozQPyt9jvPG3gqFxdIGDfQYiCFNmPjgJsypgb7KmEeUvY7Ip1k2lQ9hq1TbBARhDgibm56vd105dW6P+QV/8c585uEE7TdBc1Pq6+ewYS161pPV4Jj1NP7CA95zpLdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWghn+Ss; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWghn+Ss"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE111F000E9;
	Thu, 16 Jul 2026 20:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784234827;
	bh=oxNK7Hyt5PMmiGhlxH1FmPMLl438nDs62D1Nt9IW2V0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EWghn+Ss/W4xDma1BF2OvAL6oRUqEuQeu6eHSxy2HdcX4lT32vnHgj+kXno11ZRsi
	 Z7VQiiZ/WyxSm245RXcXvGmdguipv3qYnh9YMMl3X57+jdCVZe20vg6vDcuz3s0NAv
	 ctisUh6sESFvPnv0/ZoFOvWNYhcvF+Ib1OVhIEm1zbFgeYil3vhe2OKEcAwNNImFY3
	 FssNDK6FvMo4BqwFWSiBAslnOsgJeqV3u2lwkqx9gb0DgnTngptL8KE7u+eaJ6nhHj
	 Y9adEYeu8QGILyx1cuBAti25MdaDu1iMaYfl0h6XbBK4+icXITa8AZb2cjC+HX8bKN
	 X+pufIIsWBxMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2 2/4] dma: fsl_raid: set final bit via fill_cfd_frame()
 argument
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260716202949.677290-3-rosenp@gmail.com>
References: <20260716202949.677290-1-rosenp@gmail.com>
 <20260716202949.677290-3-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 20:47:06 +0000
Message-Id: <20260716204706.BDE111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:

New issues:
- [High] Integer underflow leading to wild pointer dereference when src_cnt=
 =3D=3D 0.
- [Medium] The commit message claims to fix an endianness issue by setting =
a bit before a 'single cpu_to_be32() store', but this byte-swap is complete=
ly missing from the modified code.

Pre-existing issues:
- [High] Multiple severe out-of-bounds writes in `fsl_re_prep_dma_pq()` cor=
rupt the Command Descriptor Block (CDB) when `DMA_PREP_CONTINUE` is set.
- [High] Missing IRQ cleanup leaves the interrupt handler active after modu=
le unload.
- [High] Incorrect teardown sequence frees DMA channel resources before unr=
egistering the DMA device.
- [High] Ignored probe failures lead to uninitialized or partially initiali=
zed channels being torn down, causing NULL pointer dereferences or double f=
rees.
- [High] Recursive locking deadlock when invoking DMA client callback.
- [High] Race condition due to prematurely enabling interrupts before initi=
alization is complete.
- [High] DMA transfers of exactly 1MB will be silently truncated to 0 bytes=
 due to `FSL_RE_CF_LENGTH_MASK` mismatch.
--

--- Patch [1]: [PATCHv2 2/4] dma: fsl_raid: set final bit via fill_cfd_fram=
e() argument ---
commit 62a6bad1aef1e87fcc87f1d390c2ed3be7152732
Author: Rosen Penev <rosenp@gmail.com>

dma: fsl_raid: set final bit via fill_cfd_frame() argument

The final-frame bit is now passed as the "final" argument of
fill_cfd_frame() (as fsl_re_prep_dma_memcpy already did) and set in CPU
order before the single cpu_to_be32() store, replacing the previous
read-modify-write of the __be32 efrl32 field.

[Severity: Medium]
The commit message claims to fix an endianness issue by setting a bit before
a single cpu_to_be32() store, but this byte-swap appears to be missing from
the modified code.  Looking at fill_cfd_frame() in drivers/dma/fsl_raid.c,
the native integer is assigned directly to the __be32 field:

    cf[index].efrl32 =3D efrl;

Could this leave the type mismatch unresolved and the endianness bug in
place on little-endian hardware?

> ---
>  drivers/dma/fsl_raid.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 99945845d8b5e..a4feaa9a1c628 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -374,11 +374,11 @@ static struct dma_async_tx_descriptor *fsl_re_prep_=
dma_genq(
>  	for (i =3D 2, j =3D 0; j < save_src_cnt; i++, j++)
>  		fill_cfd_frame(cf, i, len, src[j], 0);
> =20
> +	/* Fill the last frame and mark it final */
>  	if (cont_q)
> -		fill_cfd_frame(cf, i++, len, dest, 0);
> -
> -	/* Setting the final bit in the last source buffer frame in CFD */
> -	cf[i - 1].efrl32 |=3D 1 << FSL_RE_CF_FINAL_SHIFT;
> +		fill_cfd_frame(cf, i, len, dest, 1);
> +	else
> +		fill_cfd_frame(cf, i - 1, len, src[j - 1], 1);

[Severity: High]
Does this code cause an integer underflow when fsl_re_prep_dma_genq() is
called with src_cnt =3D=3D 0?

If the loop initializing cf frames is completely skipped, j remains 0
(unsigned), causing j - 1 to underflow to UINT_MAX.  This could lead to a
wild pointer dereference when accessing src[j - 1].

>  	return &desc->async_tx;
>  }

[ ... ]

> @@ -504,16 +504,16 @@ static struct dma_async_tx_descriptor *fsl_re_prep_=
dma_pq(
>  			p[save_src_cnt + 2] =3D 1;
>  			fill_cfd_frame(cf, i++, len, dest[0], 0);
>  			fill_cfd_frame(cf, i++, len, dest[1], 0);
> -			fill_cfd_frame(cf, i++, len, dest[1], 0);
> +			fill_cfd_frame(cf, i++, len, dest[1], 1);

[Severity: High]
This is a pre-existing issue, but does this continuation path write out of
bounds?

When dmaengine_prep_dma_pq is called with DMA_PREP_CONTINUE and a
src_cnt of 14 to 16, the driver artificially increments src_cnt by 3 (up to
19).  This causes the loop initializing gfm_q1 (and subsequently scf copyin=
g)
to overflow the fixed-size 16-byte arrays.

Additionally, the continuation frames are written to cf[19], cf[20], and
cf[21], which overflows the 20-frame limit and can corrupt the adjacent
hardware Command Descriptor Block (CDB) structure.

>  		} else {
>  			dev_err(re_chan->dev, "PQ tx continuation error!\n");
>  			return NULL;
>  		}
> +	} else {
> +		/* Mark the last source buffer frame final */
> +		fill_cfd_frame(cf, i - 1, len, src[j - 1], 1);

[Severity: High]
Similar to the issue in fsl_re_prep_dma_genq(), does this access cause an
integer underflow if fsl_re_prep_dma_pq() is called with src_cnt =3D=3D 0?

>  	}
> =20
> -	/* Setting the final bit in the last source buffer frame in CFD */
> -	cf[i - 1].efrl32 |=3D 1 << FSL_RE_CF_FINAL_SHIFT;
> -
>  	return &desc->async_tx;
>  }

[ ... ]

[Severity: High]
This is a pre-existing issue, but does fsl_re_remove_chan() leak the
interrupt handler after module unload?

The function kills the tasklet and frees memory, but fails to call
free_irq(chan->irq, chan->dev).  This could leave the ISR active after the
driver is unloaded, potentially causing a use-after-free on the next
hardware interrupt:

drivers/dma/fsl_raid.c:fsl_re_remove_chan() {
    ...
	tasklet_kill(&chan->irqtask);
    ...
}

[Severity: High]
This is a pre-existing issue, but does fsl_re_remove() free DMA channel
resources before unregistering the DMA device?

The teardown sequence iterates over channels to destroy their rings before
notifying the DMA core.  This creates a race condition where a concurrent
client might submit a new DMA request into already freed memory:

drivers/dma/fsl_raid.c:fsl_re_remove() {
    ...
	/* Cleanup chan related memory areas */
	for (i =3D 0; i < re_priv->total_chans; i++)
		fsl_re_remove_chan(re_priv->re_jrs[i]);
=09
	/* Unregister the driver */
	dma_async_device_unregister(&re_priv->dma_dev);
    ...
}

[Severity: High]
This is a pre-existing issue, but does fsl_re_probe() ignore probe failures
and blindly increment the active channel count?

drivers/dma/fsl_raid.c:fsl_re_probe() {
    ...
		if (rc) {
			fsl_re_chan_probe(ofdev, child, ridx++, off);
			re_priv->total_chans++;
		}
    ...
}

If fsl_re_chan_probe() fails, re_jrs[i] remains NULL.  During unload, the
teardown loop unconditionally dereferences it:

drivers/dma/fsl_raid.c:fsl_re_remove() {
    ...
	for (i =3D 0; i < re_priv->total_chans; i++)
		fsl_re_remove_chan(re_priv->re_jrs[i]);
    ...
}

Could this lead to a NULL pointer dereference in tasklet_kill() if a channel
failed to probe?

[Severity: High]
This is a pre-existing issue, but can fsl_re_dequeue() cause a recursive
locking deadlock if the client submits a new transaction from the callback?

fsl_re_dequeue() acquires desc_lock and holds it while executing the client
callback:

drivers/dma/fsl_raid.c:fsl_re_dequeue() {
    ...
	spin_lock_irqsave(&re_chan->desc_lock, flags);
	...
		fsl_re_desc_done(desc);
    ...
}

If the callback implements request chaining, fsl_re_tx_submit() will attempt
to synchronously re-acquire the exact same desc_lock:

drivers/dma/fsl_raid.c:fsl_re_tx_submit() {
    ...
	spin_lock_irqsave(&re_chan->desc_lock, flags);
    ...
}

[Severity: High]
This is a pre-existing issue, but does fsl_re_chan_probe() enable interrupts
before initialization is complete?

The IRQ is requested before drvdata is persistently linked to the device:

drivers/dma/fsl_raid.c:fsl_re_chan_probe() {
    ...
	ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
	...
	dev_set_drvdata(chandev, chan);
    ...
}

If a pending or spurious interrupt fires immediately, fsl_re_isr() will call
dev_get_drvdata(), which returns NULL, and then dereference it:

drivers/dma/fsl_raid.c:fsl_re_isr() {
    ...
	re_chan =3D dev_get_drvdata((struct device *)data);

	irqstate =3D in_be32(&re_chan->jrregs->jr_interrupt_status);
    ...
}

[Severity: High]
This is a pre-existing issue, but does fill_cfd_frame() silently truncate
1MB transfers to 0 bytes?

drivers/dma/fsl_raid.c:fill_cfd_frame() {
    ...
	u32 efrl =3D length & FSL_RE_CF_LENGTH_MASK;
    ...
}

FSL_RE_MAX_DATA_LEN is defined as 1024*1024 (0x100000), allowing exactly 1M=
B.
However, if FSL_RE_CF_LENGTH_MASK is 0x000FFFFF (20 bits), the bitwise-AND
operation will silently truncate a 1MB transfer to 0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716202949.6772=
90-3-rosenp@gmail.com?part=3D1
