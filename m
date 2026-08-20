Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15CA4582C7
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 13:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787232605; cv=none; b=O3+R0KV9EZxwE8kNSYyVt0FJwFGtOul4cwpvgwM3EEF5+xAxJ1xjMoLdFqB3LTo3ejepGHkVBnNRiCfRc5MISagcnQW89hyo+JSzo91ucQHNMtDRcGNzmhyLsVvMMdXzR9Fk3o6n8hamWXMk46vRe4HZvTs5zW6ZODYUZJG58BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787232605; c=relaxed/simple;
	bh=cjWJdEiLvEiwGLCePBLCJaTgmG8KDmmt9/vFYyzbyj8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gwt5TKPUckm6zYchvqR3BkyKK85og8YLpu4oxCidmbX895/TGaSR/X7sXUdm8pyfItNJ9s/TY9pUx9W5U6kgWdLUem9+4Uoxv0mnsglG35W/fnja/P8wZf7V3vNl+oLDO9wt73QkIFvDv6jhXQ+YIvC8UhvUrwr8nqxBVPaAafc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lld3zE31; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lld3zE31"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A9F1F00A3E;
	Thu, 20 Aug 2026 13:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787232604;
	bh=Okpi/gbkjxG7Sz10doU0vD8M9R17ctz7ApZdFUNCpDA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lld3zE31eA7ayHDcU+Ud3y2n5BAD+gJogiXlxCIZ3asoTbA07/sTmyAAUHW0Lbjlv
	 TIlWxOfrdyOYD0u5iw/NZRetdPV/SeLI5XQ3w4YVL+fH683wp/dprt2hTU7ey/4wgf
	 hw7TpIa0rWGZhOYVb7JfpAzCjXdXHgwGKEY5t3D1pI7VilNeuLPYxHL6cgf5NzzYZf
	 ZjNXGfB7eMkDYSbt0QxwMpnX/lxW+NNaf8jlp1k/essJw/Mb9eerVDT/sg3WRHHmzI
	 4ietdDSkJANrGQtaMJsHekOUN8Xbe0iq+yPwcELHysklldnQ89s4G+5QckCGx2ZQuR
	 2a+4oHgmNZY4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/13] dmaengine: ste_dma40: Fix failed start cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260820-dma40-fixes-v2-1-63238334c707@kernel.org>
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
 <20260820-dma40-fixes-v2-1-63238334c707@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 13:30:03 +0000
Message-Id: <20260820133004.49A9F1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Out-of-order descriptor completion corrupts dmaengine cookie tra=
cking.
- [Medium] Failed cyclic descriptors are moved to the `done` list, causing =
a permanent tasklet soft-lock.

Pre-existing issues:
- [High] The return value of pm_runtime_get_sync() is ignored, risking hard=
ware access on a powered-off device.
--

--- Patch [1]: [PATCH v2 01/13] dmaengine: ste_dma40: Fix failed start clea=
nup ---
commit b33a3592aafc5e2714045326450fe12077ee3161
Author: Linus Walleij <linusw@kernel.org>

dmaengine: ste_dma40: Fix failed start cleanup

This commit addresses a bug where d40_queue_start() returned NULL on start
failure without unwinding the transfer state or clearing the busy flag. It
introduces an error path to complete the descriptor through the tasklet and
balance the runtime PM reference.

Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.=
kernel.org/

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -1531,8 +1531,15 @@ static struct d40_desc *d40_queue_start(struct d40=
_chan *d40c)
>  	if (d40d !=3D NULL) {
>  		if (!d40c->busy) {
>  			d40c->busy =3D true;
>  			pm_runtime_get_sync(d40c->base->dev);

[Severity: High]
This is a pre-existing issue, but is it safe to ignore the return value of
pm_runtime_get_sync() here?

If the power domain fails to resume, the driver might proceed with hardware
register accesses like d40_desc_load() and d40_start() while the device is
powered off, which could trigger a synchronous external abort.

[ ... ]
> =20
>  		/* Start dma job */
>  		err =3D d40_start(d40c);
> =20
> -		if (err)
> -			return NULL;
> +		if (err) {
> +			d40_desc_remove(d40d);
> +			d40_desc_done(d40c, d40d);

[Severity: Medium]
Does calling d40_desc_done() here break dmaengine cookie tracking by
completing descriptors out-of-order?

If dma_tc_handle() calls d40_queue_start() and this new descriptor fails to
start, it is placed into the done list. Then dma_tc_handle() proceeds to
place the successfully completed old descriptor into the done list. Since it
is a FIFO queue, the newly failed descriptor gets processed before the old
successful one, which could cause the channel's completed cookie to go
backwards.

[Severity: Medium]
Also, if the descriptor is cyclic, could moving it to the done list upon
failure cause a permanent tasklet soft-lock?

The dma_tasklet() deliberately skips removing cyclic descriptors from the
done list:

dma_tasklet() {
        ...
        if (!d40d->cyclic) {
                if (async_tx_test_ack(&d40d->txd)) {
                        d40_desc_remove(d40d);
        ...
}

If a failed cyclic descriptor is forced into the done list, it looks like it
would never be dequeued, causing the tasklet to infinitely loop and starve
other DMA jobs.

> +			d40c->pending_tx++;
> +			d40c->busy =3D false;
> +			pm_runtime_put_autosuspend(d40c->base->dev);
> +			tasklet_schedule(&d40c->tasklet);
> +			return ERR_PTR(err);
> +		}
>  	}
> =20
>  	return d40d;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-dma40-fixe=
s-v2-0-63238334c707@kernel.org?part=3D1
