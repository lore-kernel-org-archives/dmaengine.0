Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D963423786
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 17:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785172744; cv=none; b=UwgT4StKvbRawWve8fX7wjPhH4qp7K3LvRyROIkiJ0zxN7FUu/NiJXiHUny8glqOfE/0PcwTMnyNuv68q52LfNX6QKP/nBclETe8DVjiDZ+8j3+JuBk7Fc7eUuzz0MtR7M671H9VOoSeJDIqKmd5iqA+I06OmbH1Q8iGjpn51DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785172744; c=relaxed/simple;
	bh=IpC99D9nVcfr1VCPJrkfmezu3eooo6d8g8L9FwiKWSk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vd/yQblomr+SHBWwQshRYr+Z6lylVQgP1DdIVbkS2C+IFp+xb4vK8cH5RomV7kmC4njoG8kwdNvQmYOC2nmNA2mP/COjWe7U6iHvjPiENIylQvruptXPDet3K/dRtlE9ySCKAkglm5NyzuPtfjoo7Wqune4vMc2OSzouqpHsKTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQrQkJqL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQrQkJqL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 583A71F00A3A;
	Mon, 27 Jul 2026 17:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785172741;
	bh=ONj/AOVGqWj7XCaFmi5iV5nI5abyyQBqffOSWFYNqsY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dQrQkJqLf/hwKFDbnpLtKFlAESDeTNOooyK4gEUU0eXkR1+2OiuuqIU9DOwT3dnld
	 +aUO8LEScbYVetlF4Q4IlbOqYnMJlZw/Dmf0nTWJ374MpaEkKl9h7wiTJSVADi2Sg1
	 vROlr7YubO/SoqqMIsAXhK1LKhN0gONEIpR/E0yPAsGgf0e9RuagpMEiwwZN1qitEf
	 +LkF6Ccf61Dm2E5n0s23/Z35Ek7lBIRMss7lRHzsi10vE7zCRar5JAUUmXFEPN6ock
	 ZZLeG3rHAOwJvGMg2te/ulMzWA5fwOq+To8nZbUlYx7x/Cj3Mv3cB0tVkBo/erHtdp
	 Ar3T7/6qiyysQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 12/24] dmaengine: dw-edma: Keep channels stopped
 while ABORT is pending
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260727170323.2321369-13-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
 <20260727170323.2321369-13-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 17:19:00 +0000
Message-Id: <20260727171901.583A71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Skipping coalesced DONE and LL events during an ABORT permanently =
strands successfully completed or pending fully-published descriptors in th=
e software queue, causing resource leaks, hangs, and silent data corruption.
--

--- Patch [12]: [PATCH v3 12/24] dmaengine: dw-edma: Keep channels stopped =
while ABORT is pending ---
commit 2cbef110fae6e22ffd20e7452128a0fd69fc4545
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Keep channels stopped while ABORT is pending

This commit delays deferred handling of ABORT interrupts until the worker r=
uns.
It introduces a pending flag to block channel restarts and other progress
consumers until the ABORT cleanup finishes.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 3970b066dca22..5bf08ff0fe464 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c

[ ... ]

> @@ -880,12 +941,14 @@ static void dw_edma_irq_work(struct work_struct *wo=
rk)
>  	do {
>  		events =3D atomic_xchg(&chan->irq_pending, 0);
> =20
> +		/* ABORT cleanup makes coalesced DONE and LL work stale. */
> +		if ((events & DW_EDMA_DEFERRED_ABORT) &&
> +		    dw_edma_abort_interrupt(chan))
> +			continue;
>  		if (events & DW_EDMA_DEFERRED_DONE)
>  			dw_edma_done_interrupt(chan);
>  		if (events & DW_EDMA_DEFERRED_LL)
>  			dw_edma_ll_interrupt(chan);
> -		if (events & DW_EDMA_DEFERRED_ABORT)
> -			dw_edma_abort_interrupt(chan);
>  	} while (atomic_read(&chan->irq_pending));
>  }

[Severity: High]
Does skipping the DONE events here strand pending and successfully completed
descriptors if the events coalesce?

If two or more descriptors are submitted and fully published to the hardware
ring, and the first completes successfully (DONE) while the second fails
(ABORT), these IRQs can coalesce.

When dw_edma_irq_work() encounters the continue statement above, it discards
the DONE event.=20

dw_edma_abort_interrupt() then pops only the first descriptor, which actual=
ly
succeeded, and incorrectly completes it as DMA_TRANS_ABORTED.

The second descriptor, which actually failed, remains stuck in the desc_iss=
ued
list.

Later calls to dw_edma_start_transfer() skip it because it is fully
published:

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_start_transfer() {
    ...
		/* A fully published descriptor may still be pending in hardware. */
		if (desc->start_burst =3D=3D desc->nburst)
			continue;
    ...
}

Will this permanently break the driver when a subsequent valid transfer
completes and dw_edma_ll_clean_pending() hits the WARN_ON_ONCE
(desc->ll_start !=3D chan->ll_done)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727170323.2321=
369-1-den@valinux.co.jp?part=3D12
