Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A453E7633
	for <dmaengine@vger.kernel.org>; Wed, 29 Jul 2026 14:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785336697; cv=none; b=L4t0ESXTQW875q//2P1/5HKuBDU2ajD5BAP1BHD7xo5L2SaGt7h96qLe1oUL5auZaNKMmsGFtl8GnZxO5p1Ll2kSltMlG4G8Ap13VAH9W/AJ+PQuO5Bu1HBaSnTdwxGefiq4Y+3zxZ8fn1IgQpksHvDgChUxuhnF1Mh8xOVOf6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785336697; c=relaxed/simple;
	bh=S48+ngmyl35P0G4FJTKKAyHqKMd+9t6v2WvBytwf/YA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TdicDbCTPzDAiI5ROoLfB69g13dqBw+VhJotQsxzo06E7x5gO+U70+S5oiz+piBOX0bemfUQIHCsgEwu8liE+Zkbr4oSVy7iS1POGVL/28hpqu84xxz5ioqQ3BBqdqdEJ4nKsR4PHHx0dGO8+UaWiBJTfBcWBKuOXtfcX5TsFRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmrdEUBd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HmrdEUBd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540A51F00A3A;
	Wed, 29 Jul 2026 14:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785336696;
	bh=pbNx2y9ZcoKmbp6T95uGnDK9qhGKn9vh0hRtfptH4mk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HmrdEUBdb4zvB0ObAWgXyY5B61R2uA+/V9bkixF/BuVIAZn+WwBFXhKHCahW4C8GA
	 Je0kt9gMGXzMgjuaazWmoSWQvIb0rMiEujP9iXil/hqmYIxghv4QfanIE9Y3O9UVSg
	 gT8K4gkB63vUU4dvNhQGkxE8DLTDYQPI7/RTsfQJg/9XKCyiqcphk3Io8zfUWlmaqT
	 ktcaRTog1yn+h2S7yPd2yiZVzLjCkx/DU5Hvy/By5c+LWYpu8JAN8zKErxN6C4IlOE
	 fhnZX9Y123C69h/1divNI+tBuLE/73LOLmJQ60W/q+ss8W1GTH2zYo9FOfLJRydaeY
	 FK+IbW7WBSr4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/24] dmaengine: dw-edma: Make DMA link list work as
 a circular buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260729143036.3087722-5-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
 <20260729143036.3087722-5-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 14:51:35 +0000
Message-Id: <20260729145136.540A51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware abort interrupt silently stalls pending descriptors and s=
ets channel to IDLE, risking use-after-free on subsequent transfers
--

--- Patch [4]: [PATCH v4 04/24] dmaengine: dw-edma: Make DMA link list work=
 as a circular buffer ---
commit e57484a362fa80a92a80a905cb57fb2805286319
Author: Frank Li <Frank.Li@nxp.com>
dmaengine: dw-edma: Make DMA link list work as a circular buffer

This commit modifies the driver to operate the DMA linked list as a
circular ring buffer instead of rebuilding it per transfer. It also adds
ring resets after channel stops to prevent inheriting occupied slots.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 6a25a050b89c4..d7a8a43b71d64 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
[ ... ]
> @@ -685,6 +748,8 @@ static void dw_edma_abort_interrupt(struct dw_edma_ch=
an *chan)
>  		list_del(&vd->node);
>  		vchan_cookie_complete(vd);
>  	}
> +	if (!chan->non_ll)
> +		dw_edma_core_reset_ll(chan);
>  	chan->request =3D EDMA_REQ_NONE;
>  	chan->status =3D EDMA_ST_IDLE;
>  	spin_unlock_irqrestore(&chan->vc.lock, flags);

[Severity: High]
This is a pre-existing issue, but does dw_edma_abort_interrupt() leave stale
descriptors in the desc_issued queue?

When a hardware abort interrupt occurs, the active descriptor is aborted
and removed, but the remaining queued descriptors are not flushed. Since
the channel status is set directly to EDMA_ST_IDLE, will a subsequent
dma_async_issue_pending() silently resume executing these stale descriptors?

If a client assumed the batch was canceled and freed the memory, would
the DMA engine accessing these leftover descriptors cause a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729143036.3087=
722-1-den@valinux.co.jp?part=3D4
