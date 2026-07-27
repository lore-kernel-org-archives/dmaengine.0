Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F9D3E5ED8
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186445; cv=none; b=nMMjHNcfCKADEG44jnspNJDIzHLz6NwURD8tvtQ4tnHbfEXI67prybNi5e7BXX+wCFEvSBcqYua7lOL+3ScxrdvoZzg9vY1jvqS2eey9mUx1sMYrLCwR9/fDDl8r1G/7O2XZBom6fX5C+mXIGzUDMPutraMN0MngUpTxC32hjPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186445; c=relaxed/simple;
	bh=2+M958USvvPuy7qv3Y0HrOmV+bd9E11MB02VmpZB4nI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KudnQXNmO0YW6KHovuKFSvAxwofZjsKXQHDslM/sHSpusiHhZFXVU2DuE84MZifial1/Fy05rfQ0fHP+Ig6XYsU83oarvGVyb8Ha9CCark+TIi2U5uf4O1nhr6MvRcKVhuEH9DYh1UhdFZz0jKPknhFfkl2n4q0HRXfTkVqdUrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwrxDd4l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwrxDd4l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1BA11F00A3A;
	Mon, 27 Jul 2026 21:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186444;
	bh=964AK4PxK3H/nHQ2OIA4vnnt/sFev9rZhbz1KDPJYuM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lwrxDd4lHxDikbMn0JjTNFUPHNotrAYpr8ZHRpWt6t7jIoSq+tSBF//8yIG1E/IGb
	 U6XiWSWpr7vAKSzKo4UfXnpZqhGgytrUJ3mzlESaJq0eXP2tb5GHI6rINGmXAy7N9j
	 S11t71Azh3u3POKz50UdQhQk/RxsN6oO0Y02QX2nSR1OTjrEytwjxyS5gMDAov63ve
	 QosPMpVOy6Tyokzb6rCABhovVGqJ/X34sDW3Mc+waIE4ZCfr/7fx8eL/g6dFKlqLtE
	 mFj6O/bQx/RTXCDgIElA1YgxV2AoT3XPcZPkBH/4fvGWCvykE/HnFnUN6vJ17YerlQ
	 MKWTD4iKdp4OQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 37/64] dmaengine: idma64: kill vchan BH on teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <2c94850384fc8c4f1a8847a1bc1d1aa69591b7fd.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <2c94850384fc8c4f1a8847a1bc1d1aa69591b7fd.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:07:23 +0000
Message-Id: <20260727210723.E1BA11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The channel cleanup loop in idma64_remove() is dead code, leading =
to a Use-After-Free of bottom-half work items.
- [High] A race condition during device removal can cause an unhandled inte=
rrupt storm.
- [High] Use-After-Free due to missing device_release callback with devres-=
managed core structure.
--

--- Patch [37]: [PATCH v2 37/64] dmaengine: idma64: kill vchan BH on teardo=
wn ---
commit e368659298f3842bf78bcfc4c53afeb968ac845c
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: idma64: kill vchan BH on teardown

Use dma_chan_kill_bh() for virt-dma cleanup.

> diff --git a/drivers/dma/idma64.c b/drivers/dma/idma64.c
> index 5fcd1befc92da..8e25d828e553d 100644
> --- a/drivers/dma/idma64.c
> +++ b/drivers/dma/idma64.c
> @@ -617,14 +617,14 @@ static void idma64_remove(struct idma64_chip *chip)
> =20
>  	/*
>  	 * Explicitly call devm_request_irq() to avoid the side effects with
> -	 * the scheduled tasklets.
> +	 * scheduled BH work.
>  	 */
>  	devm_free_irq(chip->dev, chip->irq, idma64);

[Severity: High]
This is a pre-existing issue, but does calling devm_free_irq() after
dma_async_device_unregister() create a race condition that can cause an
interrupt storm?

The earlier call to dma_async_device_unregister() iterates over the channels
and decrements idma64->dma.chancnt to 0.

If a hardware interrupt triggers in the narrow window before devm_free_irq()
disables it, idma64_irq() executes this loop:

idma64_irq() {
    ...
    for (i =3D 0; i < idma64->dma.chancnt; i++)
        idma64_chan_irq(idma64, i, status_err, status_xfer);
    ...
}

Because chancnt is 0, it skips clearing the active hardware interrupt but
still returns IRQ_HANDLED. Will the hardware continually re-assert the
uncleared interrupt and hang the CPU?

> =20
>  	for (i =3D 0; i < idma64->dma.chancnt; i++) {
>  		struct idma64_chan *idma64c =3D &idma64->chan[i];
> =20
> -		tasklet_kill(&idma64c->vchan.task);
> +		dma_chan_kill_bh(&idma64c->vchan.chan);
>  	}
>  }

[Severity: High]
This is a pre-existing issue, but will this cleanup loop ever execute?

Since the preceding call to dma_async_device_unregister() decrements
idma64->dma.chancnt to 0 before we reach this loop, the loop is completely
skipped and dma_chan_kill_bh() is never called.

When devres subsequently frees the idma64 structure, won't any pending
bottom-half work items execute on freed memory?

[Severity: High]
This is also a pre-existing issue, but is there a use-after-free risk becau=
se
struct idma64 is allocated with devm_kzalloc() but lacks a
dma_device->device_release callback?

When the driver unbinds and idma64_remove() completes, devres will
automatically free the idma64 structure:

idma64_probe() {
    ...
    idma64 =3D devm_kzalloc(chip->dev, sizeof(*idma64), GFP_KERNEL);
    ...
}

If a DMA client still holds a reference to a channel, won't the client
dereference the freed idma64 memory when accessing or releasing the channel
later, since the DMA core manages reference counts via device->ref?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D37
