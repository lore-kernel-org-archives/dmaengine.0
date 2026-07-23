Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71448330647
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 09:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797278; cv=none; b=oHqOJTiy7H3AyKAnMgjnCmdSEodxcoekb3t0gleVVE3dgzZkay7LczF7cLR1XXJ0TkfbiUnM01q2bbMANEhYSOseZxdfJMJmeESYUyw3wCbU2AUzcJ7sBapscnoy0asinsHMxHX89HV/9poLAI8CvWZwFrGI0A4jsWB4V3Pxzzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797278; c=relaxed/simple;
	bh=QoTaYPKSlgu/3AbCMs1MlS8OMqJQhnVY7PSz3wE23lM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TMRjeBS07z7LK3pRrk8Hv0vJM73BuBHJCIGjUIpj5Ndi1ayfmGwvyfoduE+ejNH69GKYyZVXD+uy+qHXcrYd2OX7XHfSwyXrg62rhkIQCBziigYIKDak61UTJ8gg3B/lQyDanIAElZWfVkQ0Cms32P4o1XHdRaQ3CYxvH1LqK0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1418B1F000E9;
	Thu, 23 Jul 2026 09:01:17 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/19] dmaengine: dw-edma: Reclaim issued descriptors
 from IRQ-paired LL progress
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260723084150.521366-10-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-10-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 09:01:12 +0000
Message-Id: <20260723090117.1418B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Processing EDMA_REQ_STOP unconditionally terminates descriptor=
s and marks the channel IDLE on any interrupt, leaving the hardware running=
 against freed memory.
- [High] Hardware abort interrupts fail to reset the continuous ring buffer=
 state, permanently deadlocking the DMA channel for subsequent descriptors.
--

--- Patch [9]: [PATCH v2 09/19] dmaengine: dw-edma: Reclaim issued descript=
ors from IRQ-paired LL progress ---
commit b319de2e00cdfc3228e59ce503f4609c77c06d4b
Author: Koichiro Den <den@valinux.co.jp>
Date:   Thu Jul 23 08:41:40 2026 +0000

    dmaengine: dw-edma: Reclaim issued descriptors from IRQ-paired LL progr=
ess
   =20
    Dynamic append can put entries from several descriptors in the ring.
    Track the consumed boundary in ll_done, reuse consumed entries, and
    complete descriptors in issued order. Keep one data entry free so a
    physical index is unambiguous within the active producer window.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index e88bfb417ad4a..44a0ff906f2f7 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
[ ... ]
> @@ -726,14 +890,15 @@ static void dw_edma_done_interrupt(struct dw_edma_c=
han *chan)
>  			break;
>  		}
> =20
> -		chan->status =3D dw_edma_start_transfer(chan) ? EDMA_ST_BUSY : EDMA_ST=
_IDLE;
> +		active =3D false;
> +		if (vd)
> +			active =3D dw_edma_start_transfer(chan);
> +		if (!chan->non_ll)
> +			active =3D dw_edma_ll_pending(chan);
> +		chan->status =3D active ? EDMA_ST_BUSY : EDMA_ST_IDLE;
>  		break;
> =20
>  	case EDMA_REQ_STOP:
> -		vd =3D vchan_next_desc(&chan->vc);
> -		if (!vd)
> -			break;
> -
>  		dw_edma_terminate_all_descs(chan);
>  		chan->request =3D EDMA_REQ_NONE;
>  		chan->status =3D EDMA_ST_IDLE;
>  		break;

[Severity: Critical]
If a client calls dmaengine_terminate_all(), it sets chan->request to
EDMA_REQ_STOP without immediately writing a hardware stop command.

If the DMA engine then fires a progress interrupt, such as a periodic
watermark or eDMA block completion, before it has actually stopped, does
this unconditionally terminate all descriptors and mark the channel IDLE?

If the client sees the termination complete and frees the DMA buffers, but
the hardware is still executing the remainder of the continuous circular
ring buffer against the freed memory, could this lead to a use-after-free
and IOMMU faults?

[ ... ]
> @@ -789,12 +954,34 @@ static void dw_edma_queue_irq_work(struct dw_edma_c=
han *chan,
>  	queue_work(chan->dw->wq, &chan->irq_work);
>  }
> =20
[ ... ]
> -static void dw_edma_abort_interrupt_deferred(struct dw_edma_chan *chan)
> +static void dw_edma_abort_interrupt_deferred(struct dw_edma_chan *chan,
> +					     bool stopped)
>  {
>  	dw_edma_queue_irq_work(chan, DW_EDMA_IRQ_ABORT);
>  }

[Severity: High]
Does dw_edma_abort_interrupt() completely reset the continuous ring buffer
state when handling a hardware abort?

If the hardware encounters a bus error and fires an ABORT interrupt, it
appears dw_edma_abort_interrupt() pops a single descriptor and sets the
channel to IDLE, but fails to clear chan->ll_valid or flush the remaining
published descriptors.

When the next transfer is submitted, would dw_edma_start_transfer() skip
resetting and re-enabling the channel hardware (via
dw_edma_core_ch_enable) because ll_valid is still true?

Could this leave the hardware permanently halted while software blindly
appends to the stale ring?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723084150.5213=
66-1-den@valinux.co.jp?part=3D9
