Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19D843031C
	for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 14:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558451; cv=none; b=Qfn7+1k9nwIzm1wUGbKx2yq1iKGeqt/8me7LiZ+KC+Q7z58k4NK/CjqS0kmhc9MARIZA0gMp7CGglYJH+msQBSHBm+T0/c9sUfw/Cgrx5aARZ1n9fLqKOCihpnYTucG1sCj38O5ZWVL/ah8YGLgTQwIltUH6IgWlWEMrZfrUt1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558451; c=relaxed/simple;
	bh=/cYwpaH7VwjI5QcsHnIZ3+BFTgoU448nYU1oEepTs0Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SXlrmh1lk+08ujuv4gZqg/sUUjH2cntbMngLMmuHC/NRVXMm2zy4c+WHwkrRYtA18bpMXERjhMH0pbW2lBJD5QXSOqOcQPzbvGQJnfWESuhmtlhAdTBffehuWLSIBjBZMO0zJOG3tTkh6qxtK2zFTo56XbTtwePGPdVevH112Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gloCBfem; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gloCBfem"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DDE01F00ACA;
	Mon, 20 Jul 2026 14:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784558449;
	bh=6MI1jE8CJVyZC8dLY7rIeC2LsyzpHyHkT3L/CWXYPoU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gloCBfemD4dthkqTlNTojHIE1n/wiarGn5TFZFLYuhphlhSOBCdwdvC5gdFx6LGJo
	 iCmSSqlnD5sfwQQNL4KAqlB267HNoVKmP5Iqxdl5zXt2uBzhVCGD4slznBMg9HdTRz
	 LGrqJ7xy1aa80KGgLp53MbqHMHx0Zt64qLMC+ad2RM6RRnGsRjaBwnhEFSwhsdhWNY
	 n7TjEmkzKqX9wUjnCgR889Oe2Hp2xzokaLDUjDxkqeiT2LAQ36QLZOCQiVZqiIONO0
	 0O2tEvxr2MNW75heSaDOd4h2F6tYoX7rN9Z4XTNNkN7ssNC+ryR/YVgMy8Atfv2HPk
	 C/Gukp5UI61cg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: loongson1-apb-dma: fix residue calculation
 for queued descriptors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mahad Ibrahim" <mahad.ibrahim.dev@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260720142538.2766-1-mahad.ibrahim.dev@gmail.com>
References: <20260720142538.2766-1-mahad.ibrahim.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 14:40:48 +0000
Message-Id: <20260720144049.6DDE01F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calling `issue_pending` while a transfer is active forcefully rest=
arts the active transfer from the beginning.
- [High] The DMA IRQ handler fails to start the next pending descriptor whe=
n the current transfer completes.
- [High] Zero-length scatterlists or cyclic configurations with buf_len < p=
eriod_len cause NULL pointer dereferences and memory corruption.
- [High] IRQ and devres leak on resource allocation failure.
- [High] Lockless read-modify-write race on the shared global `LS1X_DMA_CTR=
L` register corrupts commands and stops wrong channels.
- [High] Idle hardware causes false-positive LLI matches, reporting partial=
 residue for pending transfers.
- [Medium] The driver stalls the CPU for up to 3ms inside a `spinlock_irqsa=
ve` critical section.
- [Medium] The driver tracks `bus_width` globally per channel rather than p=
er descriptor, corrupting residue calculations.
--

--- Patch [1]: [PATCH] dmaengine: loongson1-apb-dma: fix residue calculatio=
n for queued descriptors ---
commit 62e04cef060bef1de9eb6ca4a2d6840c563a954f
Author: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>

dmaengine: loongson1-apb-dma: fix residue calculation for queued descriptors

This commit fixes a bug in ls1x_dma_tx_status() where the loop locating the
current descriptor could wrap around to the list head. The wrapped pointer
caused the subsequent list_for_each_entry_from() to stop immediately, resul=
ting
in a residue of 0 being reported.

> diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loong=
son/loongson1-apb-dma.c
> index 89786cbd20ab5..8bb6e6e5719df 100644
> --- a/drivers/dma/loongson/loongson1-apb-dma.c
> +++ b/drivers/dma/loongson/loongson1-apb-dma.c
> @@ -439,6 +439,7 @@ static enum dma_status ls1x_dma_tx_status(struct dma_=
chan *dchan,
[ ... ]
>  			/* locate the current lli */
>  			next_phys =3D chan->curr_lli->hw[LS1X_DMADESC_NEXT];
>  			list_for_each_entry(lli, &desc->lli_list, node)
> -				if (lli->hw[LS1X_DMADESC_NEXT] =3D=3D next_phys)
> +				if (lli->hw[LS1X_DMADESC_NEXT] =3D=3D next_phys) {
> +					found =3D true;
>  					break;
> -
> -			dev_dbg(chan2dev(dchan), "current lli_phys=3D%pad",
> -				&lli->phys);
> +				}

[Severity: High]
This is a pre-existing issue, but might idle hardware cause false-positive
LLI matches and bypass the newly added fallback logic?

The final LLI of all non-cyclic descriptors is initialized with NEXT =3D=3D=
 0.
When the hardware is idle after a previous transfer, its next_phys register
remains 0.

If a client queries the status of a pending, unstarted descriptor, will the
driver incorrectly match next_phys =3D 0 to the descriptor's final LLI, set=
ting
found =3D true, and report only the length of the last segment as the resid=
ue
instead of the full size?

> +
> +			if (!found)
> +				lli =3D list_first_entry(&desc->lli_list,
> +						       struct ls1x_dma_lli, node);
> +			else
> +				dev_dbg(chan2dev(dchan), "current lli_phys=3D%pad",
> +					&lli->phys);
> =20
>  			/* count the residues */
>  			list_for_each_entry_from(lli, &desc->lli_list, node)

[Severity: Medium]
This isn't a bug introduced by this patch, but will tracking bus_width
globally per channel rather than per descriptor corrupt residue calculation=
s?

In ls1x_dma_prep_lli(), the bus width for a specific transfer is cached
globally in chan->bus_width. Later, ls1x_dma_tx_status() calculates the
residue:

	bytes +=3D lli->hw[LS1X_DMADESC_LENGTH] * chan->bus_width;

If a client queues multiple transfers with different configurations or
directions on the same channel, will querying the status of older transfers
use the width of the most recently prepared transfer and result in an
incorrect byte count?

[Severity: High]
This is a pre-existing issue, but does calling vchan_issue_pending() while a
transfer is active forcefully restart the active transfer from the beginnin=
g?

When vchan_issue_pending() is called, it moves submitted descriptors to the
issued list and returns true if the list is not empty.

In ls1x_dma_issue_pending(), it unconditionally fetches the first descripto=
r:

	if (vchan_issue_pending(&chan->vc)) {
		struct virt_dma_desc *vd =3D vchan_next_desc(&chan->vc);
		...
		ls1x_dma_start(chan, &lli->phys);
	}

Because vchan_next_desc() returns the currently running transfer (it is only
removed upon completion), this immediately calls ls1x_dma_start() and
instructs the hardware to begin a new transfer at the active descriptor's
start address.

Can this destroy the current hardware state machine and restart the ongoing
transfer, leading to data corruption?

[Severity: High]
This isn't a bug introduced by this patch, but is it possible that the DMA =
IRQ
handler fails to start the next pending descriptor when the current transfer
completes?

When a non-cyclic transfer completes, ls1x_dma_irq_handler() removes the
completed descriptor from the issued list and marks it complete:

	} else {
		list_del(&vd->node);
		vchan_cookie_complete(vd);
	}

It does not fetch the next queued descriptor or call ls1x_dma_start() to
initiate the next transfer.

If a client submits multiple descriptors, will the channel stall indefinite=
ly
after finishing the first one?

[Severity: High]
This is a pre-existing issue, but can zero-length scatterlists or cyclic
configurations with buf_len < period_len cause NULL pointer dereferences and
memory corruption?

In ls1x_dma_prep_dma_cyclic(), if buf_len < period_len, sg_len becomes 0.
ls1x_dma_prep_lli() is then called with sg_len =3D=3D 0, bypassing the iter=
ation
loop, leaving lli and first pointers uninitialized.

If is_cyclic is true, the driver immediately dereferences the NULL first
pointer:

	if (is_cyclic) {
		lli->hw[LS1X_DMADESC_NEXT] =3D first->phys | LS1X_DMA_NEXT_VALID;
		chan->is_cyclic =3D is_cyclic;
	}

If is_cyclic is false, it returns success with an empty lli_list.
When ls1x_dma_issue_pending() processes it:

	lli =3D list_first_entry(&desc->lli_list, struct ls1x_dma_lli, node);
	ls1x_dma_start(chan, &lli->phys);

Can this force list_first_entry() to return a garbage offset and instruct
the hardware to execute from random memory addresses?

[Severity: High]
This isn't a bug introduced by this patch, but is there an IRQ and devres
leak on resource allocation failure?

ls1x_dma_alloc_chan_resources() dynamically registers an IRQ handler using
devm_request_irq().

If subsequent allocations like dma_pool_create() fail:

	if (!chan->lli_pool)
		return -ENOMEM;

It returns an error without calling devm_free_irq(). The DMA engine core
handles the failure but does not call the corresponding free_chan_resources=
()
callback on allocation failure.

Will the IRQ handler remain permanently registered, allowing devm allocatio=
ns
to accumulate and potentially exhausting memory or registering duplicate
handlers upon repeated client requests?

[Severity: High]
This is a pre-existing issue, but can a lockless read-modify-write race on
the shared global LS1X_DMA_CTRL register corrupt commands and stop wrong
channels?

The LS1X_DMA_CTRL register is a single global register mapped to
chan->reg_base and shared across all DMA channels. ls1x_dma_stop() performs=
 a
lockless read-modify-write:

	int val =3D readl(chan->reg_base + LS1X_DMA_CTRL);

	writel(val | LS1X_DMA_STOP, chan->reg_base + LS1X_DMA_CTRL);

Because it does not clear the previous channel ID field in val, does it send
the STOP command to whichever channel was last written to the register, even
if ls1x_dma_stop() was called for a different channel?

Will concurrent operations using per-channel locks in ls1x_dma_start() and
ls1x_dma_query() also silently race and corrupt the register?

[Severity: Medium]
This isn't a bug introduced by this patch, but could stalling the CPU for up
to 3ms inside a spinlock_irqsave() critical section be problematic?

ls1x_dma_tx_status() acquires a per-channel spinlock and disables interrupt=
s.
It then calls ls1x_dma_query(), which loops polling the hardware:

	ret =3D readl_poll_timeout_atomic(chan->reg_base + LS1X_DMA_CTRL, val,
					!(val & LS1X_DMA_ASK_VALID), 0, 3000);

Can stalling a CPU for 3000 microseconds with interrupts masked degrade sys=
tem
latency and trigger soft lockup detectors under worst-case hardware delays?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720142538.2766=
-1-mahad.ibrahim.dev@gmail.com?part=3D1
