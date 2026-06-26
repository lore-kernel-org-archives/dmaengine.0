Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AA83BB677
	for <dmaengine@vger.kernel.org>; Fri, 26 Jun 2026 09:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782467243; cv=none; b=XFfJp2wDP/T+NaALBfTA4GXSRog3MbaK0DA4U3Ir+TjotkKJJj28LSdhPollzQF1uwHL/5uuQxDoA1npBbI/Jf8087t9d7fyXbYQNGGg/7qpXxy++jZwsLoiq5CVj7/19zoZqi1QjIrkqqIvFb5RDvSlT/CnerRNCaZZHOuomZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782467243; c=relaxed/simple;
	bh=UKL3tnkBP9vAozt3awt2X0FMJYeHx0XkHnpwKoIlzbw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oLjEyuNoJtdAfLMSe0BUv0tV3wntZVzW2sHYHjIcqja+Rpaa+gATruwfcabP2ymyVk5J7uon2u629aYFfcnFy8KQ0TcPFJrZyKYrvNV+hIyYWhNQLOMe+PxLQC7keiClqQvxHr1qCPz3r8lWg/l3VpMv8FR0KZZ5q6NVopp+Q9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LoD0cyIh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LoD0cyIh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC9B1F000E9;
	Fri, 26 Jun 2026 09:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782467241;
	bh=9ZfyqbHQWJCNDjBskD6qRiZfKi1JjSnwl2Uwq2m1o/o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LoD0cyIhzDZU+oC5teHybZdAjW7+hIcGJJP1tOLsz21T+hXNMJOy2jCVbWAGDmFZw
	 aH7/l+nNkLrUIksNvhtn0cOP9PxCaxez8Or69KeUyp3uknwt+VwPGi6wfRtO6U8oWn
	 5f0PhWgLnzvbRWc2aDWq9GAW8XJbCoIHRapmpD9krx+nl/+JzT9sY2sZ+zpSLv6U4L
	 p/2IBIhd0YULowfDBEHZEzk6VV+52zpEwvlRJoVSKHZgg9V68x+Na85oibvH8aZKF7
	 Yhz/QAT7DhhvDs8norF/bJ1W3nvfe46WPaV/WrCt2hh3xACtG59a1eqmMvbC5bOOMq
	 UKSqaq4U3edQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dmaengine: xilinx_dma: Fix channel idle state
 management in AXIDMA and MCDMA interrupt handlers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Suraj Gupta" <suraj.gupta2@amd.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260626092656.1563871-2-suraj.gupta2@amd.com>
References: <20260626092656.1563871-1-suraj.gupta2@amd.com>
 <20260626092656.1563871-2-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 09:47:21 +0000
Message-Id: <20260626094721.9FC9B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch claims to fix a race condition for MCDMA channels by con=
ditionally marking the channel as idle only when `active_list` is empty. Ho=
wever, this fix is entirely ineffective because `xilinx_dma_complete_descri=
ptor()` unconditionally empties `active_list` for MCDMA.
--

commit fef85fe49f3788eecfb93a71efa6536e69b799c0
Author: Suraj Gupta <suraj.gupta2@amd.com>

dmaengine: xilinx_dma: Fix channel idle state management in AXIDMA and MCDM=
A interrupt handlers

This patch fixes a race condition in AXIDMA and MCDMA irq handlers by only
marking the channel idle and starting a new transfer when the active list is
empty.

> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index 404235c173538..ca396b7097427 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -1893,8 +1893,10 @@ static irqreturn_t xilinx_mcdma_irq_handler(int ir=
q, void *data)
>  	if (status & XILINX_MCDMA_IRQ_IOC_MASK) {
>  		spin_lock(&chan->lock);
>  		xilinx_dma_complete_descriptor(chan);
> -		chan->idle =3D true;
> -		chan->start_transfer(chan);
> +		if (list_empty(&chan->active_list)) {

[Severity: High]
This is a pre-existing issue, but does this check actually prevent the race
condition for MCDMA channels?

Looking at xilinx_dma_complete_descriptor(), the hardware completion check
is restricted to AXIDMA:

drivers/dma/xilinx/xilinx_dma.c:xilinx_dma_complete_descriptor() {
	list_for_each_entry_safe(desc, next, &chan->active_list, node) {
		if (chan->xdev->dma_config->dmatype =3D=3D XDMA_TYPE_AXIDMA) {
			...
			if (!(seg->hw.status & XILINX_DMA_BD_COMP_MASK) && chan->has_sg)
				break;
		}
		...
		list_del(&desc->node);
		...
	}
}

Because MCDMA descriptors are unconditionally unlinked from active_list
regardless of their actual hardware completion status, active_list will
always be empty after xilinx_dma_complete_descriptor() returns.=20

Will this cause the new idle check to always evaluate to true for MCDMA,
leaving the race condition unaddressed for those channels?

> +			chan->idle =3D true;
> +			chan->start_transfer(chan);
> +		}
>  		spin_unlock(&chan->lock);
>  	}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626092656.1563=
871-1-suraj.gupta2@amd.com?part=3D1
