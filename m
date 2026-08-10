Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D199D360EE1;
	Mon, 10 Aug 2026 16:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786379184; cv=none; b=UV9mwV16mU8roeFrVKQJRzOo4X+nz7YEcBggPhN5oIFvM2JBp9bftZoVatYeOd57OOpxppIMHh/TRCPvQ2SOZE0/UvcetS14QS+UAkrYqmM2/GSy9YRNhFlejeGGyw7O+fn3GcU5AVyTM3Z9ocfsMozPO0+RJCfNbwxSnh+6IWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786379184; c=relaxed/simple;
	bh=xTGDB9c4HJmoJr74YWuFOHFxvga20nCMHnjQoNeblG8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=th+d1mRwFpkbPt7sCTl2LmeGd8sJO0olBylxZ3b7Uxdv7uvGdlDQQWwiabZnPf3QquvOHiC72Ir0uQEV53ZQApKzd0xC2PPhFXBZjMU/Rr8lIGc3UPcJxwZ/Tu2YyOKikU4dKNOFe5wX7OQKaQEXbm80P+pIvqzWwum+gIv8Zao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxADMDW8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxADMDW8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 269D91F000E9;
	Mon, 10 Aug 2026 16:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786379172;
	bh=HfdbpIjn7/8pwvw9Am9qKpSTZrdzUxlUtgal3K3VLvo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NxADMDW8BFO+EUHFbPe9ns96tolZ6evCbXvRU0IsyOExly9q9f2TKMXFB/nJmmlX9
	 x1/HLrfNfekMFIFwnHZFnmimE5MXVeb+IPDCd9/70Gnvw4ac0+1wZojRcRcwY/2QLv
	 jUylwh8vSQKD1Qkgk8w+Rt6Re0OpfmYYKcMdedprxkggGMEmM3f0uLhxqa3tBmfO9t
	 v3R0AKpxFmhwb1DXWoiCmHxKq/WMPYlZ/OF+s8VoAlp35VYwQr1boJb71SpBI6KMUH
	 N+dM34pleyetUtXh65SQYS7Vqj5ahQ+yWCeXb05fgWzE/LHAppsDuozKJh3a2vC/A9
	 Rzd7vbs6+7R8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 09/19] dmaengine: ti: k3-udma: move resource
 management functions to k3-udma-common.c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260810151423.1948224-10-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-10-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 16:26:11 +0000
Message-Id: <20260810162612.269D91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] The refactored `udma_free_chan_resources` introduces a state leak =
by conditionally clearing `uc->psil_paired`, which can lead to a NULL point=
er dereference during subsequent error handling.

Pre-existing issues:
- [High] An integer overflow in `__udma_free_gp_rflow_range` bypasses bound=
s checks and allows writing zeroes over a huge area of memory.
- [High] `udma_get_chan_pair()` can perform an out-of-bounds array and bitm=
ap access if `tchan_tpl.start_idx` is greater than the calculated `end` bou=
ndary.
- [High] The delayed work `udma_check_tx_completion` does not handle `uc->d=
esc` becoming NULL during its execution, which can lead to an infinite loop=
 (deadlock) or a Use-After-Free.
- [High] The `UDMA_RESERVE_RESOURCE` macro does not bounds-check the reques=
ted `id` against `ud->res##_cnt` before performing bitmap operations, leadi=
ng to out-of-bounds memory accesses.
- [High] Lack of bounds checking on `tflow_id` in `udma_get_tchan` leads to=
 out-of-bounds bitmap accesses.
--

--- Patch [9]: [PATCH v8 09/19] dmaengine: ti: k3-udma: move resource manag=
ement functions to k3-udma-common.c ---
commit 5154d89b8961f97e1c19dede29d91f31da71af6d
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Subject: dmaengine: ti: k3-udma: move resource management functions to k3-u=
dma-common.c

Move functions responsible for allocation and release of udma resources such
as channels, rings and flows from k3-udma.c to the common k3-udma-common.c
file. The implementation of these functions is largely shared between K3 UD=
MA
and K3 UDMA v2. This refactor improves code reuse and maintainability across
multiple variants.

> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-com=
mon.c
> index 892b88a220f18..d93017a26bf1a 100644
> --- a/drivers/dma/ti/k3-udma-common.c
> +++ b/drivers/dma/ti/k3-udma-common.c

[ ... ]

> +int __udma_free_gp_rflow_range(struct udma_dev *ud, int from, int cnt)
> +{
> +	if (from < ud->rchan_cnt)
> +		return -EINVAL;
> +	if (from + cnt > ud->rflow_cnt)
> +		return -EINVAL;

[Severity: High]
This is a pre-existing issue, but can the signed integer addition overflow
here, bypassing the bounds check?

If a large positive value is passed for cnt (such as INT_MAX), the signed
addition from + cnt could wrap around to a negative integer. This would
bypass the validation check entirely.

The function subsequently calls bitmap_clear(ud->rflow_gp_map_allocated,
from, cnt). Because bitmap_clear() expects an unsigned int for the number
of bits, the negative cnt would convert to a massive unsigned integer,
which could zero out large amounts of adjacent kernel memory.

[ ... ]

> +#define UDMA_RESERVE_RESOURCE(res)					\
> +struct udma_##res *__udma_reserve_##res(struct udma_dev *ud,	\
> +					       enum udma_tp_level tpl,	\
> +					       int id)			\
> +{									\
> +	if (id >=3D 0) {							\
> +		if (test_bit(id, ud->res##_map)) {			\

[Severity: High]
This is a pre-existing issue, but does this macro need a bounds check
against ud->res##_cnt before checking the bitmap?

When id >=3D 0 is provided (for instance, from a mapped_channel_id populated
via the Device Tree), the macro directly evaluates test_bit(id,
ud->res##_map).

If a misconfigured or abnormally large ID is supplied, it appears this would
cause an out-of-bounds read and write on the resource bitmaps.

[ ... ]

> +int udma_get_tchan(struct udma_chan *uc)
> +{

[ ... ]

> +	if (ud->tflow_cnt) {
> +		int tflow_id;
> +
> +		/* Only PKTDMA have support for tx flows */
> +		if (uc->config.default_flow_id >=3D 0)
> +			tflow_id =3D uc->config.default_flow_id;
> +		else
> +			tflow_id =3D uc->tchan->id;
> +
> +		if (test_bit(tflow_id, ud->tflow_map)) {

[Severity: High]
This is a pre-existing issue, but could an unvalidated tflow_id cause an
out-of-bounds memory access on the tflow_map bitmap?

In udma_get_tchan(), tflow_id takes the value of
uc->config.default_flow_id, which comes from client configuration. The
function directly proceeds to call test_bit(tflow_id, ud->tflow_map)
without verifying that tflow_id is less than ud->tflow_cnt.

[ ... ]

> +int udma_get_chan_pair(struct udma_chan *uc)
> +{

[ ... ]

> +	/*
> +	 * Try to use the highest TPL channel pair for MEM_TO_MEM channels
> +	 * Note: in UDMAP the channel TPL is symmetric between tchan and rchan
> +	 */
> +	chan_id =3D ud->tchan_tpl.start_idx[ud->tchan_tpl.levels - 1];
> +	for (; chan_id < end; chan_id++) {
> +		if (!test_bit(chan_id, ud->tchan_map) &&
> +		    !test_bit(chan_id, ud->rchan_map))
> +			break;
> +	}
> +
> +	if (chan_id =3D=3D end)
> +		return -ENOENT;
> +
> +	set_bit(chan_id, ud->tchan_map);
> +	set_bit(chan_id, ud->rchan_map);

[Severity: High]
This is a pre-existing issue, but will this exact-match check fail to
prevent out-of-bounds accesses if the starting index is greater than end?

The function calculates end =3D min(ud->tchan_cnt, ud->rchan_cnt) and sets
the initial chan_id. If the start index already exceeds end, the for loop
condition is immediately false and does not execute.

Because chan_id is greater than end, the check if (chan_id =3D=3D end) fail=
s to
catch it. The code then proceeds to call set_bit() with the out-of-bounds
chan_id. Would using chan_id >=3D end be safer here?

[ ... ]

> +void udma_free_chan_resources(struct dma_chan *chan)
> +{
> +	struct udma_chan *uc =3D to_udma_chan(chan);
> +	struct udma_dev *ud =3D to_udma_dev(chan->device);
> +
> +	udma_terminate_all(chan);
> +	if (uc->terminated_desc) {
> +		ud->reset_chan(uc, false);
> +		udma_reset_rings(uc);
> +	}
> +
> +	cancel_delayed_work_sync(&uc->tx_drain.work);

[Severity: High]
This is a pre-existing issue, but can the delayed work
udma_check_tx_completion() indefinitely sleep or re-arm if uc->desc becomes
NULL during termination?

If udma_terminate_all() is called concurrently, it sets uc->desc =3D NULL a=
nd
calls cancel_delayed_work(). If the work is already running and sleeping in
usleep_range(), the cancellation fails.

When the work wakes up and re-acquires the lock, it might see uc->desc as
NULL:

udma_check_tx_completion()
    if (uc->desc) {
        residue_diff =3D uc->tx_drain.residue;
        ...
    }
    if (!desc_done) {
        ...
    }

If it skips the block, desc_done remains false. It then subtracts the old
residue from residue_diff. If residue_diff hits 0, it calls
schedule_delayed_work() to re-arm the timer on a channel that is being
freed, causing a use-after-free. If it doesn't hit 0, it sleeps again
infinitely because residue is never updated, which deadlocks
cancel_delayed_work_sync() here in the teardown path.

[ ... ]

> +	if (uc->irq_num_udma > 0) {
> +		free_irq(uc->irq_num_udma, uc);
> +
> +		uc->irq_num_udma =3D 0;
> +	}
> +
> +	/* Release PSI-L pairing */
> +	if (uc->psil_paired && ud->psil_unpair) {
> +		ud->psil_unpair(ud, uc->config.src_thread,
> +				uc->config.dst_thread);
> +		uc->psil_paired =3D false;
> +	}

[Severity: High]
Does this new structure leak the psil_paired state if ud->psil_unpair is
NULL?

By placing the uc->psil_paired =3D false assignment inside the conditional
block that checks ud->psil_unpair, the flag is never cleared if the
function pointer is missing.

Subsequently, udma_reset_uchan(uc) zeroes out the config but leaves
uc->psil_paired intact. If the channel is later reallocated and an error
occurs during allocation, the error handling path err_psi_free in
bcdma_alloc_chan_resources() checks if (uc->psil_paired) and
unconditionally dereferences ud->psil_unpair. Since it is NULL, this could
cause a kernel panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810151423.1948=
224-1-s-adivi@ti.com?part=3D9
