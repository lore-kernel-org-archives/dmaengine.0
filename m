Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722424;
	b=qn5Csju8Ok8fcIsuj4oETYgIbdpyGBlJHTAkSjm28CpHepX8uaeP7g6ltDEC3K+dAlrI
	 AUjQZiqnQ4aUJADgdJNbP9YWYq4kCk/dXBP1Urgqx3kNdhqiQGZmdJAekQuXILEBp8f1S
	 afMFf9IQ5DlthYjU7zUkVHTynaToPGxLpWsQG8tiGEEBSMQhOlYwcnfAFXBIp+0LVIc30
	 d+N+PFv5PGoNPwosmHIi5fDvpfhyjFQnuR+sCoJ2EQNYRkiEif6uvXeUGfVXL8Rov+bap
	 +hOA/wyi3OjQi92YnSnKBe2pZgdfTO1jNV6eZOeNNoPh2D/ENzB83LgyE+ARdd2ZaRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722424;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=x/FH5otqYEf36A9OIs9LxoVkpQV/mW7gemnZEwlcnCo=;
	b=s2KukjV5uns7O/PnIF0X0bGZdUKczQAYpCyG6fXDRXNKFIDMVgNMQlzKo22w1RxZOLFw
	 cot3Kqvk7j3uHsrzxtYF28xOpAl3+sJmNGY4Y7SwE/IhtGHfY9g9D8C4PiAu40RbjCW0F
	 fl+WvWRwycA1UyKGATj7MqyW8Kd8ku3tkXKl0LJ1OzSxDQEwBaKvBsg27BT2dhTpfMe0V
	 4bQ9TaSgwjOB9JzohTtG1E7XeBAXF84oHjXImN41Hx2nKG8n2H2X/SZ6EHHYTySbXqU0Q
	 AEERsQa12q5CvtICFO1IzDTdEna4k+gBW04AnfpYRiAM9tKkbfEsUBMca8rXmexSHDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZzXFqdbx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9379D606EE9F
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 16:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZzXFqdbx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4121F00A15;
	Tue,  3 Nov 2026 16:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793722424;
	bh=x/FH5otqYEf36A9OIs9LxoVkpQV/mW7gemnZEwlcnCo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZzXFqdbxpD1TFs0x76YOPs3yuQCGSSzVf+OzQkcJd0bQRBa4etBMAw+9e6HHL8pD/
	 RcVfuFmmDhN/Wn4cZ9G5EcZ+r6HnAH2NygRr+/Z9YpuhpUU8SUF53m84QRdNJSwpmc
	 xL0H/m6fPn/LlaYYMdipHsQtLsG1wMalVsiFK5e2DPBtlwue4+ME5KhRabn8VwmrNA
	 vwtcDkbF3aE8BeS9LPfdbIGdE3WSmvetWehRZ2qxAL8oal1MOPknuoHeIF8NPToAxk
	 ujDNpXDv7vepPYXCAtIwIyl9tT5hzezmv61krmvGBeRmPrP1+pqeEyupsjSMAtvv4o
	 NfeMksuU2irig==
Message-ID: <sashiko-outbox-195706@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] dmaengine: plx_dma: don't invoke client callbacks
 with ring_lock held
Reply-To: sashiko-reviews@lists.linux.dev
To: "Logan Gunthorpe" <logang@deltatee.com>, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261103155202.461725-7-logang@deltatee.com>
References: <20261103155202.461725-1-logang@deltatee.com>
 <20261103155202.461725-7-logang@deltatee.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 16:13:43 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dmaengine: plx_dma: premature teardown in plx_dma_free_chan_resour=
ces()
- [Medium] dmaengine: plx_dma: race in plx_dma_process_desc() when dropping=
 ring_lock
--

commit 3bb7031cbf95b71426caf9709207e0ede88301d6
Author: Logan Gunthorpe <logang@deltatee.com>

dmaengine: plx_dma: don't invoke client callbacks with ring_lock held

This commit updates plx_dma_process_desc() and plx_dma_abort_desc() to copy
and clear descriptor completion callbacks, advance plxdev->tail, and drop
plxdev->ring_lock before invoking the callback to avoid a deadlock when a
callback prepares a new transfer.

Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.ke=
rnel.org

> diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
> index 8c4b19d681ad5..17745f7a5658d 100644
> --- a/drivers/dma/plx_dma.c
> +++ b/drivers/dma/plx_dma.c
> @@ -134,6 +134,7 @@ static struct plx_dma_desc *plx_dma_get_desc(struct p=
lx_dma_dev *plxdev, int i)
> =20
>  static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
>  {
> +	struct dmaengine_desc_callback cb;
>  	struct dmaengine_result res;
>  	struct plx_dma_desc *desc;
>  	u32 flags;
> @@ -165,11 +166,14 @@ static void plx_dma_process_desc(struct plx_dma_dev=
 *plxdev)
> =20
>  		dma_cookie_complete(&desc->txd);
>  		dma_descriptor_unmap(&desc->txd);
> -		dmaengine_desc_get_callback_invoke(&desc->txd, &res);
> +		dmaengine_desc_get_callback(&desc->txd, &cb);
>  		desc->txd.callback =3D NULL;
>  		desc->txd.callback_result =3D NULL;
> -
>  		plxdev->tail++;
> +
> +		spin_unlock_bh(&plxdev->ring_lock);
> +		dmaengine_desc_callback_invoke(&cb, &res);
> +		spin_lock_bh(&plxdev->ring_lock);

[Severity: Medium]
Can dropping plxdev->ring_lock here after calling dma_cookie_complete() and
incrementing plxdev->tail cause descriptor callbacks to run out of order or
concurrently?

plx_dma_process_desc() is called both from the tasklet plx_dma_desc_task()
and from plx_dma_tx_status():

drivers/dma/plx_dma.c:plx_dma_tx_status() {
	ret =3D dma_cookie_status(chan, cookie, txstate);
	if (ret =3D=3D DMA_COMPLETE)
		return ret;

	plx_dma_process_desc(plxdev);

	return dma_cookie_status(chan, cookie, txstate);
}

When plx_dma_tx_status() calls plx_dma_process_desc() in process context and
an interrupt schedules plxdev->desc_task while bottom halves are disabled
under spin_lock_bh(), calling spin_unlock_bh(&plxdev->ring_lock) re-enables
bottom halves and can immediately run plx_dma_desc_task() ->
plx_dma_process_desc() on the same CPU before dmaengine_desc_callback_invok=
e()
is called for the first descriptor. Because plxdev->tail was already
incremented, the tasklet will process subsequent descriptors and invoke
their callbacks ahead of the earlier descriptor's callback.

Similarly, on SMP, while one caller has dropped plxdev->ring_lock to execute
dmaengine_desc_callback_invoke(), a concurrent caller of plx_dma_tx_status()
on another CPU can enter plx_dma_process_desc(), observe the updated
plxdev->tail, and invoke subsequent callbacks concurrently, or observe
DMA_COMPLETE from dma_cookie_status() while the descriptor's callback is
still running.

>  	}
> =20
>  	spin_unlock_bh(&plxdev->ring_lock);
> @@ -177,6 +181,7 @@ static void plx_dma_process_desc(struct plx_dma_dev *=
plxdev)
> =20
>  static void plx_dma_abort_desc(struct plx_dma_dev *plxdev)
>  {
> +	struct dmaengine_desc_callback cb;
>  	struct dmaengine_result res;
>  	struct plx_dma_desc *desc;
> =20
> @@ -192,11 +197,14 @@ static void plx_dma_abort_desc(struct plx_dma_dev *=
plxdev)
> =20
>  		dma_cookie_complete(&desc->txd);
>  		dma_descriptor_unmap(&desc->txd);
> -		dmaengine_desc_get_callback_invoke(&desc->txd, &res);
> +		dmaengine_desc_get_callback(&desc->txd, &cb);
>  		desc->txd.callback =3D NULL;
>  		desc->txd.callback_result =3D NULL;
> -
>  		plxdev->tail++;
> +
> +		spin_unlock_bh(&plxdev->ring_lock);
> +		dmaengine_desc_callback_invoke(&cb, &res);
> +		spin_lock_bh(&plxdev->ring_lock);

[Severity: High]
Does releasing plxdev->ring_lock after advancing plxdev->tail in
plx_dma_process_desc() and plx_dma_abort_desc() allow
plx_dma_free_chan_resources() to finish tearing down the channel while a
callback is still executing on another CPU?

Previously, holding plxdev->ring_lock across the entire loop ensured that
plx_dma_abort_desc() in plx_dma_free_chan_resources() would wait until any
concurrent plx_dma_process_desc() or plx_dma_abort_desc() call finished
invoking all callbacks.

With plxdev->ring_lock dropped around dmaengine_desc_callback_invoke(), if
CPU0 is in plx_dma_remove() -> plx_dma_abort_desc() or plx_dma_tx_status() =
->
plx_dma_process_desc() and advances plxdev->tail to plxdev->head before
dropping plxdev->ring_lock, CPU1 can run dma_release_channel() ->
plx_dma_free_chan_resources():

drivers/dma/plx_dma.c:plx_dma_free_chan_resources() {
	...
	tasklet_kill(&plxdev->desc_task);

	plx_dma_abort_desc(plxdev);

	plx_dma_free_desc(plxdev);
	dma_free_coherent(plxdev->dma_dev.dev, ring_sz, plxdev->hw_ring,
			  plxdev->hw_ring_dma);
}

Because tasklet_kill() only waits for plxdev->desc_task, plx_dma_abort_desc=
()
on CPU1 can acquire plxdev->ring_lock, see plxdev->tail =3D=3D plxdev->head=
, and
return immediately while CPU0 is still inside dmaengine_desc_callback_invok=
e().
plx_dma_free_chan_resources() and dma_release_channel() will then return and
allow the client (such as ntb_transport_free_queue() or ntb_perf) to free t=
he
callback parameter data while the callback is still using it on CPU0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103155202.4617=
25-1-logang@deltatee.com?part=3D6
