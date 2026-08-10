Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B45230C147;
	Mon, 10 Aug 2026 15:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786377405; cv=none; b=NT/9F/3SJ16nC9YsZwro8OcYM4YXqECh6xWAOkb6WI+6PWGIMVFbIGyUPCIhkRx8rKylQaXhG2jflutQ310kMQzaZ51oof+dmH5DUaoaTOhxkH5rnAA9Gu4UTf3r6q/ijDy5Qcduu1RmvF+191GRUQcG05pdeDFNa+1s6eioQ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786377405; c=relaxed/simple;
	bh=ClRRSUw8jh6c0DyM0v0Kd+CvoGUyqO9LFJPCx09Vbog=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e8nYuid+skmJQZkD0uoCC59+hWO34r9uNgc95EC5c+Uu6G2J5gXOjROgZVFmjmn0cnKt7ZEocA9hW9uwaFct+MBBlMJtjjJvAA9TJcOun5mNdTfIYS9GxqU8SewAkskIpFTH6XpQtgQkjfAX+II85574483iydnTkwk3Ei4z7dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+fT2Yr5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+fT2Yr5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB241F000E9;
	Mon, 10 Aug 2026 15:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786377403;
	bh=gT2LF6ue5m0Qil2qlStiS9gBCa1sa1DKZWkY+ca+sJY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H+fT2Yr5BhANh24QTPri2eHrFEjYRKK92NKJFT7IUVna9RgYn+IPaSD5k/iVA6ahd
	 ban4mPB5EfQXXVjkMejcMLMGgSIH9gVGbg9SeLDR35g2a5OhGBa/Mx6J0K1tRDZEDQ
	 bGBM47mTBbFw6YY3g6W5DpWaM6zPA7iO4MbVvx9yc+fLp1NpnItmniJrTxo7BQeSCk
	 8rQC0lj6S9UVUp6eR5XVm3T2rgW0O3Wn3cMlK37IRIKD+FpQI5a9O6uaXoVSULqa9V
	 e2BTxcrb5Yvcs0DUt9aC8vgng5tSskTpvgc+j8KDrx5ArKW/nDh0mADS/liI2yuEuK
	 POUHRCpjI0alA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 05/19] dmaengine: ti: k3-udma: move descriptor
 management to k3-udma-common.c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260810151423.1948224-6-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-6-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:56:42 +0000
Message-Id: <20260810155642.DBB241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Swapped arguments to `cppi5_trdesc_calc_size` causes heap buff=
er under-allocation.
- [High] Missing `.remove` callback in platform driver leads to UAF on modu=
le unload.
- [High] Global channel state overwritten without locks during descriptor p=
reparation.
- [High] Race condition between teardown IRQ and `udma_free_chan_resources`=
 causes Double Free.
- [High] Zero-length scatterlist (`sglen =3D=3D 0`) causes out-of-bounds ar=
ray access and wild pointer dereference.
--

--- Patch [5]: [PATCH v8 05/19] dmaengine: ti: k3-udma: move descriptor man=
agement to k3-udma-common.c ---
commit 2f5a11e37f11d6bdbc83b58ccea07da9ab136d47
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma: move descriptor management to k3-udma-common.c

Refactor the K3 UDMA driver by moving all DMA descriptor handling
functions from k3-udma.c to a new common library, k3-udma-common.c.
This prepares the driver for supporting new K3 UDMA v2 variant.
No functional changes intended.

> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-com=
mon.c
> new file mode 100644
> index 0000000000000..3130805a8ec40
> --- /dev/null
> +++ b/drivers/dma/ti/k3-udma-common.c
[ ... ]
> +	if (uc->use_dma_pool) {
> +		hwdesc->cppi5_desc_size =3D uc->config.hdesc_size;
> +		hwdesc->cppi5_desc_vaddr =3D dma_pool_zalloc(uc->hdesc_pool,
> +							   GFP_NOWAIT,
> +							   &hwdesc->cppi5_desc_paddr);
> +	} else {
> +		hwdesc->cppi5_desc_size =3D cppi5_trdesc_calc_size(tr_size,
> +								 tr_count);

[Severity: Critical]
This is a pre-existing issue, but are the arguments to
cppi5_trdesc_calc_size() swapped here?

The function signature expects the count first and then the size, but it
is called with tr_size as the first argument.

When processing a scatterlist with a large number of segments where the
count exceeds the size, could this result in an under-allocation and
a subsequent heap buffer overflow?

[ ... ]
> +		d->residue +=3D sg_dma_len(sgent);
> +	}
> +
> +	cppi5_tr_csf_set(&tr_req[tr_idx - 1].flags,
> +			 CPPI5_TR_CSF_SUPR_EVT | CPPI5_TR_CSF_EOP);

[Severity: High]
This isn't a bug introduced by this patch, but what happens if a consumer
submits a zero-length scatterlist?

If sglen is 0, the tr_idx variable remains 0. Does this result in a
write to tr_req[-1], causing an out-of-bounds access and corrupting
the descriptor header?

[ ... ]
> +	if (d->residue >=3D SZ_4M) {
> +		dev_err(uc->ud->dev,
> +			"%s: Transfer size %u is over the supported 4M range\n",
> +			__func__, d->residue);
> +		udma_free_hwdesc(uc, d);
> +		kfree(d);
> +		return NULL;
> +	}
> +
> +	h_desc =3D d->hwdesc[0].cppi5_desc_vaddr;
> +	cppi5_hdesc_set_pktlen(h_desc, d->residue);

[Severity: High]
This is a pre-existing issue, but similar to the above, if a consumer
provides a zero-length scatterlist, the flexible array hwdesc is
allocated with zero elements.

Since the code unconditionally accesses the first element of the flexible
array to retrieve h_desc, could this lead to an out-of-bounds pointer
dereference and memory corruption?

[ ... ]
> +	if (!burst)
> +		burst =3D 1;
> +
> +	uc->config.tx_flags =3D tx_flags;

[Severity: High]
This isn't a bug introduced by this patch, but it looks like the global
channel state is being modified without holding the vc.lock.

If a consumer prepares multiple descriptors concurrently with different
flags, could the last prepared descriptor overwrite the channel state?

When udma_is_desc_really_done() checks the flags later, this might cause
it to skip the stall check and falsely complete the transfer while data
remains in the DMA fabric.

[ ... ]
> +	if (dir !=3D uc->config.dir) {
> +		dev_err(chan->device->dev,
> +			"%s: chan%d is for %s, not supporting %s\n",
> +			__func__, uc->id,
> +			dmaengine_get_direction_text(uc->config.dir),
> +			dmaengine_get_direction_text(dir));
> +		return NULL;
> +	}
> +
> +	uc->cyclic =3D true;

[Severity: High]
This is a pre-existing issue, but similar to the tx_flags modification,
this global channel state is being updated without holding any lock.

Can this lead to the same race conditions and data corruption if
concurrently modified?

I also noticed a few other pre-existing issues in the surrounding
driver code that might be worth looking into while refactoring.

[Severity: High]
In drivers/dma/ti/k3-udma.c, there appears to be a race condition between
udma_free_chan_resources() and the teardown IRQ handler:

udma_free_chan_resources() {
    ...
    udma_terminate_all(chan);
    if (uc->terminated_desc) {
        udma_reset_chan(uc, false);
        udma_reset_rings(uc);
    }
}

The udma_reset_rings() function checks for uc->terminated_desc and frees
it without holding the lock.

If udma_terminate_all() triggers a hardware teardown completion message,
and the IRQ handler concurrently takes the lock and frees the descriptor,
do both threads end up freeing the same terminated_desc, leading to a
double free?

[Severity: High]
Also in drivers/dma/ti/k3-udma.c, the platform_driver definition lacks
a remove callback:

static struct platform_driver udma_driver =3D {
    .driver =3D {
        .name =3D "ti-k3-udma",
        .of_match_table =3D udma_of_match,
        .suppress_bind_attrs =3D true,
    },
    .probe =3D udma_probe,
};

Because this is a tristate module, if the driver is unloaded via rmmod,
the registrations from udma_probe() are not symmetrically torn down.

Since devres will free the memory while the DMA engine subsystem retains
pointers to it, could this cause a use-after-free upon the next DMA access?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810151423.1948=
224-1-s-adivi@ti.com?part=3D5
