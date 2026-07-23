Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A52A3F58F0
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 08:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796936; cv=none; b=PyfmvF2y5eMTJa77iecxCb5O0oo+3PzgD1CL+qqT9ModAPzHH4HZo11OwMCoe73kBPqP3rl1n3ow+pQBR2ZueAiUUo2kFFvUCIARcmp+ZAoACUBfqsr3DwNXv/SfY0nifhxoKClgvszn0RwPXz/cuzlxwvtNDvhDMaJ/pICShpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796936; c=relaxed/simple;
	bh=JTK8NiYCNIqgqj9aM1Bm3QcbUeS5KiyDhkJR2AlbL0U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FJNjPYZVbY2go4IvMh7KjPNsjdGo8VmmaHNSCafmcJIA1pNtKJXPL8Dr+KGr8Z9mMAclGyi2W1YAftXj1SNpwM3md/y9OtIAqu4IbirGMemMPijRe/8p54asp7HIXgJOQazSGsHhS1yLCfERDzQHifyjJn7GfSnxd7sqwHzkXI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jwswytyY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jwswytyY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EBC51F000E9;
	Thu, 23 Jul 2026 08:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784796934;
	bh=Xp+erNy49LWUQb1SAqY0daXdeMa0LbrD9p/OdlBMfz4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jwswytyYDVFgx8SQ4gIwZiw+RRCv6mhWRYOT1ne7PHqEPwHVjy8jeQgjVratDeOqh
	 nfKkpT3DXw2fKZNYbx0Y6ZEgW190pyLIJVK3quxBQBn+Mki4QUXwtRj+uWkYsUrtDk
	 ZLEHDO1K7u+kVaL1RBieOkf1tq+prnoYSUlaGN26VUtVgZdnD9o6xeVNuCC5aHOYKE
	 4ohMpbYdowqGSHIaTpuZ3x7ec5METB8ZF5yV+J4U8g4XmBsPM5AOtXnRwm6xmp8z5G
	 bUehVhFs5oxEWF9VlL9VlO70Vih+04Ku5tJRMhZS1waAaZiNTIqVQyeS2NJIgqFt9w
	 r4VgIiVW1v2KQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/19] dmaengine: dw-edma: Dispatch DONE interrupts
 by channel request
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260723084150.521366-8-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
 <20260723084150.521366-8-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 08:55:33 +0000
Message-Id: <20260723085534.6EBC51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Channel state machine can get permanently stuck if a delayed inter=
rupt arrives after a termination timeout (or if the interrupt never arrives=
).
--

--- Patch [7]: [PATCH v2 07/19] dmaengine: dw-edma: Dispatch DONE interrupt=
s by channel request ---
commit 820c52e0edf662b1111ec33a334d76d30c13a546
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Dispatch DONE interrupts by channel request

This patch modifies the DONE interrupt path to handle the channel request
first before looking at the issued descriptor list. The change is intended
to keep the existing behavior without introducing functional changes.

> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
[ ... ]
> @@ -682,41 +682,43 @@ static void dw_edma_done_interrupt(struct dw_edma_c=
han *chan)
[ ... ]
> +	case EDMA_REQ_STOP:
> +		vd =3D vchan_next_desc(&chan->vc);
> +		if (!vd)
>  			break;

[Severity: High]
This is a pre-existing issue, but does this early break leave the channel
permanently stuck in EDMA_ST_BUSY if a delayed interrupt arrives after a
termination timeout?

If a driver calls dmaengine_terminate_sync() and the hardware hangs,
dw_edma_wait_termination() will time out. Then
dw_edma_free_chan_resources() calls vchan_free_chan_resources(),
clearing the descriptor list.

If a delayed interrupt arrives afterward, dw_edma_done_interrupt() handles
EDMA_REQ_STOP but hits this if (!vd) check because the list is now empty.

By breaking early, the code skips resetting chan->request =3D EDMA_REQ_NONE
and chan->status =3D EDMA_ST_IDLE. Will this cause subsequent calls to
dw_edma_alloc_chan_resources() to fail with -EBUSY and permanently leak
the DMA channel resource?

> +
> +		dw_edma_terminate_all_descs(chan);
> +		chan->request =3D EDMA_REQ_NONE;
> +		chan->status =3D EDMA_ST_IDLE;
> +		break;
> +
> +	default:
> +		break;
>  	}
>  	spin_unlock_irqrestore(&chan->vc.lock, flags);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723084150.5213=
66-1-den@valinux.co.jp?part=3D7
