Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02843D567E
	for <dmaengine@vger.kernel.org>; Tue, 18 Aug 2026 03:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787025477; cv=none; b=ZhXUU+evyA6by3aEnMReXZptCoPBjvQmW8Szg8vo6ZyEANuN5zn7rjuiQH1AzRS/9Pm2M9gDyR+mnYYnpv5A7C6u58Wc67K+qFDmZL+1UHrZiE3at/ERab7z7nGkquZpENuWBgTCuG/HYQNHdAknRZBP7rA2iAx0duxEEniXHSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787025477; c=relaxed/simple;
	bh=3Apzarf0e6xSfppBruHYS0F2ipNQw1/KBqgBG0g84gY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aqQbo3bWYf/VKMIkcGN1aNn2PwVffud7a7SFl0rg3fhEk9dGCmDUf76Oa9EWPNwFACoSOHv+bdTc6BAkptN/MfXA7oKwJE1K9Q8XP1JW8LmZ0haaeNFBJqDxObI0PIA4UYQHaDqFOEvoMHDvI/24wm5yrhzRnr49Mj9fttRZfBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnGWhl0n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnGWhl0n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2FD41F01577;
	Tue, 18 Aug 2026 03:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787025469;
	bh=lP42UefCUnA+c5nDvx9alHmwo43FKQVkWrSef34YcFw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fnGWhl0neOWuWzgiKLvEU8mzwMZoVNCRFV4C5okwqKrEeYpsYLXRIhhn7IGEk/ubd
	 aG9Ct0yTw+po6VX1+JzV6HZHzLa99GVBTTuFNyc4jknYTZz/gUbj7BYVvCk8mymL39
	 2ewb52eHjDS6eX4FjCpaeIxcFpqJ87NqVVXuyEiRMFEwEQEcw1kXjluvmSe1t0u+mh
	 7iAusLkW8MnnFFNmghKdegNFCQnayAc4RyPpmGWW2+5LzSPR7MxXjc8WsTClzKb7G5
	 /Tb8QB1Jfhihf02mgwKb+XoucNiZbydztl/QNt2flUL0drHwpv5gQ+c2KY1kwjepA9
	 UT2pFafCUTldQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] dmaengine: wait for RCU readers before releasing
 dma_device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivank Garg" <shivankg@amd.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260818-dmaengine-kref-fix-v4-4-c6ef991462a0@amd.com>
References: <20260818-dmaengine-kref-fix-v4-0-c6ef991462a0@amd.com>
 <20260818-dmaengine-kref-fix-v4-4-c6ef991462a0@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 03:57:48 +0000
Message-Id: <20260818035748.B2FD41F01577@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Double list_del_rcu() on device->global_node causing list corrupti=
on or crash when a provider module is removed.
--

--- Patch [4]: [PATCH v4 4/4] dmaengine: wait for RCU readers before releas=
ing dma_device ---
commit 82fe03be2ee5cd7002af0d140a5056712e128cb6
Author: Shivank Garg <shivankg@amd.com>

dmaengine: wait for RCU readers before releasing dma_device

This commit adds a synchronize_rcu() call to dma_device_release() before
the device is freed. This ensures concurrent RCU readers traversing the
dma_device_list finish their traversal, preventing use-after-free bugs.

Link: https://sashiko.dev/#/patchset/20260526-dmaengine-kref-fix-v2-0-3df60=
afac01d@amd.com

> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index d075051dd187c..604c9af199369 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -429,6 +429,12 @@ static void dma_device_release(struct kref *ref)
>  	list_del_rcu(&device->global_node);

[Severity: High]
This is a pre-existing issue, but does this unconditional removal run the
risk of a double list_del_rcu() causing list corruption?

If a DMA provider module is being unloaded concurrently, try_module_get()
can fail in dma_chan_get(). The error paths in find_candidate() and
dmaengine_get() proactively unlink the device:

find_candidate() {
    ...
    err =3D dma_chan_get(chan);
    if (err) {
        if (err =3D=3D -ENODEV) {
            ...
            list_del_rcu(&device->global_node);
        ...
}

However, they do not appear to drop the kref. Later, the module unload
process calls dma_async_device_unregister(), which puts the final kref
and triggers dma_device_release().

Since dma_device_release() unconditionally calls list_del_rcu() again on
the same node, couldn't this crash the kernel by dereferencing LIST_POISON2
during the second removal?

>  	dma_channel_rebalance();
> =20
> +	/*
> +	 * Wait for RCU readers (e.g. dma_issue_pending_all()) that may still
> +	 * be traversing dma_device_list before the device is freed.
> +	 */
> +	synchronize_rcu();
> +
>  	if (device->device_release)
>  		device->device_release(device);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-dmaengine-=
kref-fix-v4-0-c6ef991462a0@amd.com?part=3D4
