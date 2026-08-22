Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5177E263F5D
	for <dmaengine@vger.kernel.org>; Sat, 22 Aug 2026 19:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787427313; cv=none; b=fbu5t9UdolWWeEPiPqkmVxy7zEQdhbj2aNYtkM9KkWTSnkg+bIWBjehR9d8DA/dytZEsveQ4/sB2NYoFoUvDzIsIA0uHykc8Mec3HCeSUwxM0YE9e03Ft+aOOu6yF/PHjavqAnTUhvGd/1+ifbRXE9LlQPkXZ5Z0WeB5MU2Qtk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787427313; c=relaxed/simple;
	bh=bETp04cQdlb9f7i+YnB+Y5hqYqQ+gXDOUBWL9+KGUKU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rAQVKyLDSMJdC8+O7SMp250Ky8FHRI+4WKPK3QYktV4Q1QZVGJ2b5Fd669PokXjyIbU1L5UWAhIdEUMkgfsfukVd8UrDHMe4Qw8vyWQ+1Fsw9n/kJ8k/mrMvGpd0AnQeoRwe7nubCw+Rc6xBZ6rH81mqu18MYgZd8EYnMY1zxxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TwqgVZ5m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TwqgVZ5m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E481F00A3A;
	Sat, 22 Aug 2026 19:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787427311;
	bh=MJBrTT1KL/VWB182OiX+Trlq8W+6MQ1iZHFxK8duP0M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TwqgVZ5meH6FDY+pyPzYuMEJ2FKvd1G3gnv0ECce0Pk/cHrn3jFvc33VMSAOvAGK1
	 KJSkclfY7ykusDpTSXBnEBUvBDG0xUpBMCaWX7OCVtvNex6oBJelosDELEVz/2hAQy
	 aA/04qA6bBqd3vSWHxJc148IuF34CMClhGWoa24KmgQECoBl/uWNIetAGzPj7DT173
	 viC/+U35brw4NEfHFVfIN5KuCHA6UGTjlD2seDbtZvcfKDZIUVpFisjeSv8ElYp2UP
	 WcUrNyvpWKhSiHdCrejAjxO6lgRZZ7TBXjEOG1ZckfVrGSH5kPs82bI7l8J91B3947
	 FAjFawdene6Ng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] dmaengine: Fix device kref underflow in
 dma_chan_put()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivank Garg" <shivankg@amd.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260822-dmaengine-kref-fix-v5-2-d4a4ee47d927@amd.com>
References: <20260822-dmaengine-kref-fix-v5-0-d4a4ee47d927@amd.com>
 <20260822-dmaengine-kref-fix-v5-2-d4a4ee47d927@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Aug 2026 19:35:10 +0000
Message-Id: <20260822193511.85E481F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but dropping the las=
t device reference in `dma_chan_put()` triggers device deallocation, leadin=
g to a Use-After-Free access in `dma_release_channel()`. While a subsequent=
 patch in the series ('commit "dmaengine: fix use-after-free in dma_chan_pu=
t() and dma_release_channel()"') fixes a UAF inside `dma_chan_put()`, it fa=
ils to address the subsequent UAF in `dma_release_channel()` itself.
--

--- Patch [2]: [PATCH v5 2/4] dmaengine: Fix device kref underflow in dma_c=
han_put() ---
commit 3c7cc7c5c7f5082cf18d425005421e76b4f2aada
Author: Shivank Garg <shivankg@amd.com>

dmaengine: Fix device kref underflow in dma_chan_put()
   =20
dma_chan_get() takes chan->device->ref only on the slow path:
   =20
        /* no kref on fast path */
        if (chan->client_count) {
                __module_get(owner);
                chan->client_count++;
                return 0;
        }
        if (!try_module_get(owner))
                return -ENODEV;
        if (!dma_device_get(chan->device)) { // calls kref_get_unless_zero()

[ ... ]
   =20
Fixes: 8ad342a86359 ("dmaengine: Add reference counting to dma_device struc=
t")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Signed-off-by: Shivank Garg <shivankg@amd.com>

> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index cb3b7bccce1f4..f2760b039d932 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -520,7 +520,9 @@ static void dma_chan_put(struct dma_chan *chan)
>  		chan->route_data =3D NULL;
>  	}
> =20
> -	dma_device_put(chan->device);
> +	/* This channel is not in use anymore, drop the device ref */
> +	if (!chan->client_count)
> +		dma_device_put(chan->device);
[Severity: High]
This is a pre-existing issue, but dropping the last device reference in
dma_chan_put() can trigger device deallocation, leading to a use-after-free
access in dma_release_channel().

When a DMA provider device is unregistered while a client still holds a cha=
nnel,
the provider's dma_async_device_unregister() drops its initial reference.
Later, when the client releases the channel by calling dma_release_channel(=
),
it calls dma_chan_put() which drops the final reference to the dma_device.
This causes the device and its embedded dma_chan structures to be freed.

Immediately after dma_chan_put() returns, dma_release_channel() dereferences
the freed memory:

drivers/dma/dmaengine.c:dma_release_channel() {
	...
	dma_chan_put(chan);

	if (chan->slave) {
		sysfs_remove_link(&chan->dev->device.kobj, DMA_SLAVE_NAME);
	...
}

While a subsequent patch in this series fixes a use-after-free inside
dma_chan_put(), it appears to leave this subsequent use-after-free in
dma_release_channel() unaddressed.

Could the channel sysfs cleanup and debugfs frees happen before we drop the
final device reference?

>  	module_put(dma_chan_to_owner(chan));
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260822-dmaengine-=
kref-fix-v5-0-d4a4ee47d927@amd.com?part=3D2
