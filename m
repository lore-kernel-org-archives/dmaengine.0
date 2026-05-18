Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547133E3152
	for <dmaengine@vger.kernel.org>; Mon, 18 May 2026 08:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092961; cv=none; b=k/VJQhko7Z4pyNJpy1XgKw4gtPxXPf7vsZI9YWEeSo+Ch66H+uH76AY0pggPjsKyieNo3E22i9/ORa5zo/PqQpfOpbsA47F+YgCHhVCVqJNg86unnWOKvuCZXt3gVLjCiuFckz6gN1tFQgYUtfPpgWcDnGf5fIZvTxjwy5seP98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092961; c=relaxed/simple;
	bh=CpuDIxYd1+369FpJgQg4IuYg3AFqk+zlKXYLpZkEZvQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R5Xk+Yr6eigBE7YflYigZmQR9inCcZbbYlwJseKvozj0Cdk7rTnBwW7z0kqCaVOZST57sOIUPDhl0QV7R4M3awYuoeBIP7OnOr3g97lZhJQ1tYvBMqVXiLrjszKChGjihPkDJJTZounK8pQ6hfgxr0n8GOTrzOaLTBQJSvN5TYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmzijAMv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HmzijAMv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BB1C2BCB7;
	Mon, 18 May 2026 08:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779092960;
	bh=CpuDIxYd1+369FpJgQg4IuYg3AFqk+zlKXYLpZkEZvQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=HmzijAMviG2fDrmpiGnp53N2b/Fq3vWglHM2kTX3nXsGO7MucvxWOlr+yoWugUY7D
	 oki1QMfTurriN+f2+VHuW0mn0u4gvMjvhcjoeZUYAqurn72lvuLtb8vPWp+8S/i6sk
	 UXwyj5GMq0jblL9Xr3v+F5sJz8KWP+TMOfk3B+wOWiCNfOKrRIkzAhjal3QBmtr5ra
	 zOWehCNw1gypm+wNSadW8WB3I4PIhukRSRY2Nw21QS26euYc6xq8s9gJFkQ2VNnQjO
	 g2Bu9nv0oLg5j6EuabXSQvHqUdTkPCa7pOPS+tOcVq1ik9I9qvt+8cwG44mGEu/7gj
	 meuOytX1zfHsw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: Fix device kref underflow in dma_chan_put()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivank Garg" <shivankg@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260518-dmaengine-kref-fix-v1-1-4d6125048fb7@amd.com>
References: <20260518-dmaengine-kref-fix-v1-1-4d6125048fb7@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 08:29:20 +0000
Message-Id: <20260518082920.B9BB1C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Pre-existing Use-After-Free vulnerabilities in dma_chan_put() and =
dma_release_channel() due to device memory release before teardown complete=
s.
--

commit dcce1cbcc027c7a50b03bed56fe875a7390be677
Author: Shivank Garg <shivankg@amd.com>

dmaengine: Fix device kref underflow in dma_chan_put()

This commit addresses a device kref underflow by ensuring the device refere=
nce
is only dropped when the client count reaches zero, matching the slow-path =
get.

> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -515,7 +515,9 @@ static void dma_chan_put(struct dma_chan *chan)
>  		chan->route_data =3D NULL;
>  	}
> =20
> -	dma_device_put(chan->device);
> +	/* This channel is not in use anymore, drop the device ref */
> +	if (!chan->client_count)
> +		dma_device_put(chan->device);
>  	module_put(dma_chan_to_owner(chan));
>  }

This isn't a bug introduced by this patch, but does this sequence present
a use-after-free risk?

If dma_device_put() drops the final reference to the device (for example,
if the provider module previously unregistered the DMA device), it can
trigger the device release callback and free the dma_device and dma_chan
memory.

If that happens, module_put(dma_chan_to_owner(chan)) will dereference the
freed memory, as dma_chan_to_owner() accesses chan->device->owner.

Additionally, when dma_chan_put() is called from dma_release_channel(),
returning from this function leads to further accesses of the freed memory.
dma_release_channel() continues to access chan->device->privatecnt,
chan->device->cap_mask, chan->slave, and chan->name, which could cause a
series of use-after-free issues during teardown or hot-unplug.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-dmaengine-=
kref-fix-v1-1-4d6125048fb7@amd.com?part=3D1
