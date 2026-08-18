Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480F23B774A
	for <dmaengine@vger.kernel.org>; Tue, 18 Aug 2026 04:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787025617; cv=none; b=CV7bXa9nzccP+eqYWTuucBKy2lZ5HPuJCLF1OKt7SeFNdIC9hH4DedDcLylp712FWr35s7HpjYTsw5iXoTuzxxi+RfH+K43qLk81zeFKvv3fUSmmClU+gnszUPx7f4vxLa258j1poBL/tHVnOW3YvwiY7ncHe+bV8hFQXjS1hxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787025617; c=relaxed/simple;
	bh=fb4xkXmTEIOjKSy5ic8q1bX7xBbcrmyVaEyIaj2Il84=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EvMhA9KyJY8DS2rIjaWlvMYQFlsoDbAYPBSPCXR8SBIAhr4t9kg2xP1TgdhiLJQQSvWoqvXfyOpWKNVdl58/3+RKigjPH8vuazSbxCN6DjS7z/nzDcDZi9TKaI2+SeBqYgx9JXnQp46PyzSdxOVg4bl7+dL9GG9A71BBGlNjXWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHQ97NqB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DHQ97NqB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B8B1F000E9;
	Tue, 18 Aug 2026 04:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787025615;
	bh=YbrZqmHoAC81Xf7tx/xkX92vLaLkEbang79QVUOXRkI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DHQ97NqBkUqYJ5uarVQ9FE7m3pb2pQUPV7nQg7ir6CVChHUV6L42Jdstj/qyb2wP7
	 UP+v6zttCHb5jc40zIcbPaAd7tniPRnufyygKz6DViw/IvcF+kZU32aekv1ZiIZLji
	 EeIx/fpU3SdmvIoW6yzbzGCcaTpZQ3eCU5IKF9jU3pTtA89W1INgBVjHeJeEfH96SM
	 aBExAWdjViaI4TBJj2Sqchw4/P9zc0cj9X0TSMhfn5gVGg1hbSxttFRCbQnuI//JW1
	 9R4rMWWHesUvvoQa9v6err3kYMLJ3xJ7eKlDP956Xk6snd7ey9WLhk+XrEYcZWKhJx
	 JZvwp1Q2smFgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] dmaengine: add dma_device_get() helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivank Garg" <shivankg@amd.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260818-dmaengine-kref-fix-v4-1-c6ef991462a0@amd.com>
References: <20260818-dmaengine-kref-fix-v4-0-c6ef991462a0@amd.com>
 <20260818-dmaengine-kref-fix-v4-1-c6ef991462a0@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 04:00:15 +0000
Message-Id: <20260818040015.95B8B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Double list_del_rcu() on device->global_node causing kernel pa=
nic.
- [High] Use-after-free in dma_chan_put() when dereferencing chan->device->=
owner.
- [High] Unbalanced dma_device_put() in dma_chan_put() causes kref underflo=
w.
--

--- Patch [1]: [PATCH v4 1/4] dmaengine: add dma_device_get() helper ---
commit bb05480fd3a83327685100c3fb961c2f1ceadfda
Author: Shivank Garg <shivankg@amd.com>

dmaengine: add dma_device_get() helper

This commit adds a dma_device_get() helper function to pair with the existi=
ng
dma_device_put() for symmetry. It wraps the open-coded kref_get_unless_zero=
()
and adds a lockdep assertion to ensure dma_list_mutex is held.

> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 6ffd8bd82154a..77638dc16e71d 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -433,6 +433,12 @@ static void dma_device_release(struct kref *ref)
>  		device->device_release(device);
>  }

[Severity: Critical]
This is a pre-existing issue, but can this lead to a double free causing a
kernel panic?

If a module is concurrently unloaded while a client queries for DMA channel=
s,
try_module_get() can fail. When it fails, callers like dmaengine_get() remo=
ve
the device from the list:

drivers/dma/dmaengine.c:dmaengine_get() {
    ...
    if (err =3D=3D -ENODEV) {
        /* module removed before we could use it */
        list_del_rcu(&device->global_node);
        break;
    }
    ...
}

The concurrent module unregistration will subsequently call
dma_async_device_unregister(), which drops the device reference and eventua=
lly
invokes dma_device_release().=20

However, dma_device_release() unconditionally calls
list_del_rcu(&device->global_node) again on the already unlinked node. Does
this need a check to prevent dereferencing the poisoned list pointers?

> =20
> +static bool dma_device_get(struct dma_device *device)
> +{
> +	lockdep_assert_held(&dma_list_mutex);
> +	return kref_get_unless_zero(&device->ref);
> +}
> +
>  static void dma_device_put(struct dma_device *device)
>  {
>  	lockdep_assert_held(&dma_list_mutex);
> @@ -460,8 +466,7 @@ static int dma_chan_get(struct dma_chan *chan)
>  	if (!try_module_get(owner))
>  		return -ENODEV;
> =20
> -	ret =3D kref_get_unless_zero(&chan->device->ref);
> -	if (!ret) {
> +	if (!dma_device_get(chan->device)) {

[Severity: High]
This isn't a bug introduced by this patch, but does this create a kref
underflow?

In dma_chan_get(), if a channel already has clients, it skips acquiring the
device reference but still increments the client count:

drivers/dma/dmaengine.c:dma_chan_get() {
    ...
    /* The channel is already in use, update client count */
    if (chan->client_count) {
        __module_get(owner);
        chan->client_count++;
        return 0;
    }
    ...
}

However, dma_chan_put() appears to call dma_device_put() unconditionally for
every decrement of client_count. Will a shared channel drop the device
reference multiple times while only acquiring it once?


[Severity: High]
This is also a pre-existing issue, but can this sequence result in a
use-after-free?

In dma_chan_put(), the device reference is dropped:

drivers/dma/dmaengine.c:dma_chan_put() {
    ...
    dma_device_put(chan->device);
    module_put(dma_chan_to_owner(chan));
    ...
}

If this is the final reference, the device struct could be freed by
dma_device_put(). The very next line expands dma_chan_to_owner(chan) into
chan->device->owner, dereferencing the potentially freed chan and chan->dev=
ice
pointers.

Should the owner pointer be cached locally before dropping the device
reference?

>  		ret =3D -ENODEV;
>  		goto module_put_out;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-dmaengine-=
kref-fix-v4-0-c6ef991462a0@amd.com?part=3D1
