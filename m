Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756DA38AC8C
	for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 15:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784216565; cv=none; b=udeuEahClYBiElulodptcxg/Npz+NAPuOMFmv0622VJy2WBwgcgeGKCmVB4oxBR2h2244vI+CXkQ1NS3t/BTmhpXvz/U0Gms5Wko8n/jkoMMPVyb4S/thag2kRT0+PocwbZcoWPrE3QWzml9FMsPFaWLHBwW23dnJX0RvrsC5oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784216565; c=relaxed/simple;
	bh=KvHiRUCgUdMm0wbOsp0LUqMISOMFAPxfq92rb2dUN3k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C9bZdm9k2lFLpbSWkAGugy7t68fQ1ZHO0R78d8iZSUStw1GR1KdmQZtmgXpzd7OVgPQEqxe1iD/3VDac9Xytez8q6JomzZYBqnWFDLtBFiG/Xf547LajR/+C3CqEVklC9a7vejNxWH29CPRojNs42iVzmi3lg16x7INygZXPOlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2CW0/s3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2CW0/s3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA5571F000E9;
	Thu, 16 Jul 2026 15:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784216563;
	bh=DGX0o6LC6BPAsU9WNCyJF1tgPDZqtFXGfykR7WURvhw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D2CW0/s3SztBq1/YViHJ546+MSZg9OdJsgXwg0863sH6wKRRWHXBzCjnfPp+6AwvP
	 uHRklOIk6NkDMdH9ApivDuluRNDJfKVpiGaS4c0NrAUpXHdRhG1J159vIWA7195iCK
	 wQLofhMLOJlKC092w+TUHFBL6vorlbVtwoTuKCatc14aXIdhaP6tVFhcM17QJF8p4U
	 G3NuIWB+gPvipWFRxxq6zmnItIEjBSqbgl0N9UG1bVDirPp4qd4cG1WyALXng071OH
	 rMLsIKq60blWLYA11HWNOI/Se9oq8e9dUnM04Y7C0PyV3cI9aFMK99fZSjRMeEV/DS
	 HE4IjYogmYUXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/9] dmaengine: dw-edma: Serialize abort state
 updates
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260716152503.1747922-4-den@valinux.co.jp>
References: <20260716152503.1747922-1-den@valinux.co.jp>
 <20260716152503.1747922-4-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 15:42:42 +0000
Message-Id: <20260716154242.CA5571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Missing lock in dw_edma_device_pause and dw_edma_device_resume=
 causes Data Race and Use-After-Free.
- [High] Permanent channel stall when resuming from PAUSE due to bypassed d=
escriptor completion.
- [High] Unexpected hardware abort leaves queued descriptors stranded indef=
initely.
--

--- Patch [3]: [PATCH v4 3/9] dmaengine: dw-edma: Serialize abort state upd=
ates ---
commit 4837da5eb731c888cd532d74c75c719d7336551e
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Serialize abort state updates

This commit fixes a race condition where issue_pending() could observe an
inconsistent state. It extends the critical section in
dw_edma_abort_interrupt() to cover the channel request and status updates.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 972c7ea18d46b..daf70df59e077 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -736,9 +736,9 @@ static void dw_edma_abort_interrupt(struct dw_edma_ch=
an *chan)
>  		list_del(&vd->node);
>  		vchan_cookie_complete(vd);
>  	}
> -	spin_unlock_irqrestore(&chan->vc.lock, flags);
>  	chan->request =3D EDMA_REQ_NONE;
>  	chan->status =3D EDMA_ST_IDLE;

[Severity: High]
This is a pre-existing issue, but does an unexpected hardware abort leave
queued descriptors stranded indefinitely here?

On a hardware abort (not requested by software), dw_edma_abort_interrupt()
fetches the single active descriptor, completes it with DMA_TRANS_ABORTED,
and unconditionally transitions the channel to EDMA_ST_IDLE.

Could this ignore any queued descriptors remaining in vc->desc_issued?
Since the hardware is now marked IDLE without processing the remaining
queue, it seems these descriptors are permanently stranded until the
client initiates a new dmaengine_issue_pending() call.

> +	spin_unlock_irqrestore(&chan->vc.lock, flags);
>  }

[Severity: Critical]
This isn't a bug introduced by this patch, but is there a missing lock in
dw_edma_device_pause() and dw_edma_device_resume() that could cause a data
race and use-after-free?

The dmaengine API allows clients to call dmaengine_resume() and
dmaengine_pause() without driver-level locks. In dw_edma_device_pause()
and dw_edma_device_resume(), the state is modified locklessly:

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_device_pause() {
    ...
    chan->request =3D EDMA_REQ_PAUSE;
    ...
}

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_device_resume() {
    ...
    chan->status =3D EDMA_ST_BUSY;
    dw_edma_start_transfer(chan);
    ...
}

If dw_edma_device_resume() is called concurrently with an interrupt handled
on another CPU, could both CPUs execute dw_edma_start_transfer() on the
same descriptor?

Both would access the same child chunk, pass it to dw_edma_core_start(),
and free it, which could result in list corruption and a use-after-free:

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_start_transfer() {
    ...
    list_del(&child->list);
    kfree(child);
    ...
}


[Severity: High]
This is a pre-existing issue, but can the channel stall permanently when
resuming from PAUSE due to bypassed descriptor completion?

When the final chunk of a transfer finishes, its chunks_alloc drops to 0.
If EDMA_REQ_PAUSE is handled in this interrupt, the switch in
dw_edma_done_interrupt() bypasses the completion logic, leaving the fully
finished descriptor in the issued list:

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_done_interrupt() {
    ...
        case EDMA_REQ_PAUSE:
            chan->request =3D EDMA_REQ_NONE;
            chan->status =3D EDMA_ST_PAUSE;
            break;
    ...
}

Later, dw_edma_device_resume() sets the state to BUSY unconditionally:

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_device_resume() {
    ...
    chan->status =3D EDMA_ST_BUSY;
    dw_edma_start_transfer(chan);
    ...
}

Because the chunk list is empty, dw_edma_start_transfer() fails to start
the hardware and returns 0. Could this mismatched software state leave
the channel permanently deadlocked in a BUSY state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716152503.1747=
922-1-den@valinux.co.jp?part=3D3
