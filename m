Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F4742123C
	for <dmaengine@vger.kernel.org>; Wed,  2 Sep 2026 09:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341950; cv=none; b=mtqcuNqIEikxaM36a4gNmD+AxAB5jQG9zYVaCeKc8E0Pn3k8hx4oelOoujQxF4a9SxbRKwDEAch2p4vQ8tD58OK3252zqvsxkzwInOsbsTLGA0X5MamNA/TPWVGFrWa5qi+FraR79LwphZkvabUGduOXYLjsfwoE2UW3Ob6bEwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341950; c=relaxed/simple;
	bh=0uL78yfDp+ZDAi6BIoCwpKPyUcBmk0ekR7ZO9WJWlyI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UTflXjObRdGYntDnGxmFCS2zY4dKExgTMMDY0xJIOTtvnTu6aq943kVlNS/XUnmCgI3+O7vgzU687yET+NlI7BShu7QwuMIWsTeDfWcUhXJKTsF2xpOGR6IieYwSigK0siSEmtgDzCNOiKUEBEAS1iZXbciLabZ/v1gO+qQhyMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqYjyrJ0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqYjyrJ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA95B1F000E9;
	Wed,  2 Sep 2026 09:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788341947;
	bh=2Z1mGlpxbLqvnQ+/GBmVSephnKvIpAsEYF2ehfJEAMM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iqYjyrJ0EwbqESlKODxnej7HsznWq0n/fOEsRqXGVRFdKNfTokPY0+n9d9pQHlH0E
	 l7QoHQmsrrB2LA8TGae7o9ZmbOSBjk0nknYKYPrvxrEESjDMGe8B5gK2fpT/qzqt55
	 gxi7Xjh5CmPfMYXYeY4IKOZB12lYEldcv1lXusUU5zvpT25k7b0eJefLBuWPKv5JTC
	 r/rVOMBwDFLiQ5A1pi/+jEHvOD8B2eg/YLnLqbRWhROEj7OjGpMV2YU147CMNA8ttH
	 PyPYxwQgo+s57zoCZRmstET3oC8ACzXHvW7oMcCTTnw1eF06SVNik9tbOfrsVJ4ZX+
	 XFCWIluDknOTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] dmaengine: dw-axi-dmac: Fix AXI burst length
 encoding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang" <wangjia@ultrarisc.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260902-dma-fix-v3-1-414c6449fbcc@ultrarisc.com>
References: <20260902-dma-fix-v3-0-414c6449fbcc@ultrarisc.com>
 <20260902-dma-fix-v3-1-414c6449fbcc@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 09:39:07 +0000
Message-Id: <20260902093907.AA95B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Zero-length transfers passed to `dma_chan_prep_dma_memcpy` result =
in negative array indexing and an underflowing infinite loop, leading to se=
vere out-of-bounds access and arbitrary kernel memory corruption.
- [High] Lack of zero-length validation in dw_axi_dma_chan_prep_slave_sg an=
d dw_axi_dma_chan_prep_cyclic can cause divide-by-zero panics.
- [High] The error path for hardware descriptor allocation blindly frees th=
e entire array of requested descriptors without checking for NULL, causing =
a guaranteed NULL pointer dereference.
- [High] Silent data truncation and subsequent NULL pointer dereference in =
scatterlist transfers if lengths are not exact multiples of the computed se=
gment size.
- [High] The driver fails to start the next queued descriptor when a non-cy=
clic transfer completes, leading to stalled DMA channels.
- [Medium] dma_chan_issue_pending unconditionally attempts to start the cha=
nnel even if it is already running, resulting in spurious 'non-idle' errors.
--

commit 212e0a527db7f8f42167aa10e801996bc3ac1256
Author: Jia Wang <wangjia@ultrarisc.com>
Subject: dmaengine: dw-axi-dmac: Fix AXI burst length encoding

This commit fixes AXI decode errors caused by unencoded burst lengths
overflowing hardware fields. It subtracts one from the burst length value
when configuring the hardware descriptors while preserving the actual value
for reporting.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index eebed2474210d..742e08cfab435 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c

[ ... ]

> @@ -975,7 +975,7 @@ dma_chan_prep_dma_memcpy(struct dma_chan *dchan, dma_=
addr_t dst_adr,
> =20
>  		reg =3D CH_CTL_H_LLI_VALID;
>  		if (chan->chip->dw->hdata->restrict_axi_burst_len) {
> -			u32 burst_len =3D chan->chip->dw->hdata->axi_rw_burst_len;
> +			u32 burst_len =3D chan->chip->dw->hdata->axi_rw_burst_len - 1;
> =20
>  			reg |=3D (CH_CTL_H_ARLEN_EN |
>  				burst_len << CH_CTL_H_ARLEN_POS |

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential proble=
m=20
in this function for zero-length transfers.

If dma_chan_prep_dma_memcpy() is called with len =3D=3D 0, num starts at 0 =
and
the while (len) loop is skipped. Does this lead to an out-of-bounds
access here:

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dma_chan_prep_dma_memcpy() {
...
    set_desc_last(&desc->hw_desc[num - 1]);
...
}

And subsequently, could this cause an underflowing loop that writes to
arbitrary memory?

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dma_chan_prep_dma_memcpy() {
...
    do {
        hw_desc =3D &desc->hw_desc[--num];
        write_desc_llp(hw_desc, llp | lms);
        llp =3D hw_desc->llp;
    } while (num);
...
}

[Severity: High]
This is a pre-existing issue, but the error path in dma_chan_prep_dma_memcp=
y()
seems like it might dereference a NULL pointer.

If axi_desc_get() fails and the code jumps to err_desc_get, we call
axi_desc_put(desc):

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dma_chan_prep_dma_memcpy() {
...
err_desc_get:
    if (desc)
        axi_desc_put(desc);
...
}

Since the uninitialized elements of desc->hw_desc will have a NULL lli
pointer, does axi_desc_put() crash when it unconditionally calls
dma_pool_free() on the entire array?

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:axi_desc_put() {
...
    dma_pool_free(chan->desc_pool, hw_desc->lli, hw_desc->llp);
...
}

[Severity: High]
This is a pre-existing issue, but I noticed a potential division by zero
elsewhere in this file.

If a caller passes a period_len of 0 to dw_axi_dma_chan_prep_cyclic(),
could this cause a panic?

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dw_axi_dma_chan_prep_cyclic(=
) {
...
    num_periods =3D buf_len / period_len;
...
}

Similarly, in dw_axi_dma_chan_prep_slave_sg(), if any scatterlist element
has a length of 0, num_segments evaluates to 0. Does this macro then cause
a divide-by-zero panic?

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dw_axi_dma_chan_prep_slave_s=
g() {
...
    segment_len =3D DIV_ROUND_UP(sg_dma_len(sg), num_segments);
...
}

[Severity: High]
This is a pre-existing issue, but does dw_axi_dma_chan_prep_slave_sg()
truncate data if the transfer length is not an exact multiple of the
computed segment size?

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dw_axi_dma_chan_prep_slave_s=
g() {
...
        segment_len =3D DIV_ROUND_UP(sg_dma_len(sg), num_segments);
...
    } while (len >=3D segment_len);
...
}

If the loop exits early, the remaining bytes seem to be discarded. Further
down in the function, it loops over all allocated segments:

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dw_axi_dma_chan_prep_slave_s=
g() {
...
    do {
        hw_desc =3D &desc->hw_desc[--num_sgs];
        write_desc_llp(hw_desc, llp | lms);
...
}

Since the earlier loop exited prematurely, the trailing elements in hw_desc
have a NULL lli pointer. Does calling write_desc_llp() on them cause a pani=
c?

[Severity: High]
This is a pre-existing issue, but I have a question about how hardware
queueing is managed. In axi_chan_block_xfer_complete(), after completing a
transfer:

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:axi_chan_block_xfer_complete=
() {
...
    list_del(&vd->node);
    vchan_cookie_complete(vd);
}
out:
...
}

Should this function call axi_chan_start_first_queued() or check
vchan_next_desc to start the next pending transfer? Without it, does a
queued subsequent transfer sit indefinitely without being processed?

[Severity: Medium]
This is a pre-existing issue, but does dma_chan_issue_pending()
unconditionally attempt to start the channel even if it is already actively
processing a transfer?

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dma_chan_issue_pending() {
...
    if (vchan_issue_pending(&chan->vc))
        axi_chan_start_first_queued(chan);
...
}

If the hardware is already active, this leads to a spurious error printed
in axi_chan_block_xfer_start():

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:axi_chan_block_xfer_start() {
...
    if (unlikely(axi_chan_is_hw_enable(chan))) {
        dev_err(chan2dev(chan), "%s is non-idle!\n",
...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-dma-fix-v3=
-0-414c6449fbcc@ultrarisc.com?part=3D1
