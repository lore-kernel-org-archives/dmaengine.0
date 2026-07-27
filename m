Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDBA3CEBA7;
	Mon, 27 Jul 2026 06:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785133481; cv=none; b=kn5K0iaHblsKCro60GLNNIpdT7i7gsD8NTS5DqAsoRytXzkTiA4Lvd0sXhkaEIotq76tSaHQlLnTpSugDdTio3bj6AhLB/0Jw403nTSlhBFtf0jmuQbcdg1pV41jpHjxe5PoE53w9AMeWipPTFjpA51cAF7lNJbadfZpuoQszwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785133481; c=relaxed/simple;
	bh=e/Qm0ygvwArkLixVP6HfmnqEoZ46P5tEb5kLjnC3MQs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M7VB6eyjKy2Gj2DZzAEDeg7dBcJUytH+emJHuaux58qaXYnspL3NIOE3ikOOOzTcNzPOCxTpYGA5cHf11ZuckyH+oJGPftBJw3/L3BDvHXUqPz+ll7NxhL0nDpkHI7TWe7kSUZhJz4c8dGOms8NsyipiOc2qCIMa1BvhsIHfqFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oKueM1I/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKueM1I/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944BF1F000E9;
	Mon, 27 Jul 2026 06:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785133477;
	bh=08nxweUymXn6XGaoI7VOrTMa7mGE9CUrqSv8xcbaPpw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oKueM1I/BhDis/lIKRq6CTIdt2g3upXSQyKzmfl+6GgD1R66QNJDKoc4UfYi+3epd
	 fWYXt3Rx8kcohxGWJ52ih/AAN9k7LaPP5mLoarE29Xep643eNCIK6cFsbqNI6hr5QK
	 JfdMpZE4HHXPdteAF0JawNIycReFy0WKNPA1C+OAmFj3C9TTEPgb0UTLekqXXG8xAo
	 HlC8qk+QSTVbLtYP4qWx5RhHH5RA1zQajOX4sfAHTz9OnoSjPvj4m3N5F3pdM2lxCS
	 tPxAJjcxHd5zgH7ZdQvA3A/RdzMFmdN4cl5B6nZInGowWucMJoNDlr8+hGKLixJRnh
	 2xAcIA+VlMvxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v5] dmaengine: sun6i-dma: Fix use-after-free in
 error handling  paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongling Zeng" <zenghongling@kylinos.cn>
Cc: vkoul@kernel.org, linux-sunxi@lists.linux.dev, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260727061142.44195-1-zenghongling@kylinos.cn>
References: <20260727061142.44195-1-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 06:24:37 +0000
Message-Id: <20260727062437.944BF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing input validation in `sun6i_dma_prep_dma_cyclic()` leads to=
 a divide-by-zero panic or a NULL pointer dereference when setting up the c=
yclic list.
- [High] Failing to validate `sg_len > 0` in `sun6i_dma_prep_slave_sg()` al=
lows submission of an empty descriptor, leading to a hardware fault.
- [High] A race condition in `sun6i_dma_tx_status()` leads to a Use-After-F=
ree when querying the status of a transfer.
--

--- Patch [1]: [PATCH RESEND v5] dmaengine: sun6i-dma: Fix use-after-free i=
n error handling  paths ---
commit f42009e17697997cd6fc8eda0aef5712caa48d76
Author: Hongling Zeng <zenghongling@kylinos.cn>
Subject: dmaengine: sun6i-dma: Fix use-after-free in error handling paths

This commit fixes a use-after-free in the error handling paths of the
sun6i-dma driver by refactoring the descriptor cleanup into a new helper
function. It also introduces a virtual descriptor freeing helper for vchan.

> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index a9a254dbf8cb9..7a79f346250a5 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c

[ ... ]

> @@ -788,10 +795,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_pre=
p_slave_sg(
>  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
> =20
>  err_lli_free:

[Severity: High]
This isn't a bug introduced by this patch, but does the validation in
sun6i_dma_prep_slave_sg() need to check for empty scatterlists?

The function checks if the scatterlist pointer is valid:

if (!sgl)
    return NULL;

However, if sg_len is 0, the for_each_sg() loop is bypassed entirely.
This leaves txd->p_lli as 0.  When this descriptor is later executed by
sun6i_dma_start_desc(), the hardware LLI address register is programmed
with physical address 0:

writel(pchan->desc->p_lli, pchan->base + DMA_CHAN_LLI_ADDR);

Could this cause a hardware fault by instructing the DMA controller to
fetch its configuration from physical address 0?

> -	for (p_lli =3D txd->p_lli, v_lli =3D txd->v_lli; v_lli;
> -	     p_lli =3D v_lli->p_lli_next, v_lli =3D v_lli->v_lli_next)
> -		dma_pool_free(sdev->pool, v_lli, p_lli);
> -	kfree(txd);
> +	sun6i_dma_free_desc(sdev, txd);
>  	return NULL;
>  }

[ ... ]

> @@ -869,10 +873,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_pre=
p_dma_cyclic(
>  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
> =20
>  err_lli_free:

[Severity: High]
This is a pre-existing issue, but I noticed a potential divide-by-zero
and NULL pointer dereference in sun6i_dma_prep_dma_cyclic().

If a caller passes period_len as 0, does this calculation cause a
divide-by-zero exception?

unsigned int i, periods =3D buf_len / period_len;

Additionally, if buf_len is less than period_len, periods evaluates to 0.
This skips the allocation loop entirely, leaving the prev pointer
uninitialized (NULL).  Would the subsequent attempt to make the list
cyclic cause a NULL pointer dereference?

prev->p_lli_next =3D txd->p_lli;

> -	for (p_lli =3D txd->p_lli, v_lli =3D txd->v_lli; v_lli;
> -	     p_lli =3D v_lli->p_lli_next, v_lli =3D v_lli->v_lli_next)
> -		dma_pool_free(sdev->pool, v_lli, p_lli);
> -	kfree(txd);
> +	sun6i_dma_free_desc(sdev, txd);
>  	return NULL;
>  }

[ ... ]

[Severity: High]
This is a pre-existing issue, but I noticed a potential race condition
when querying the status of a transfer.

In sun6i_dma_tx_status(), the function queries dma_cookie_status()
outside the channel lock:

ret =3D dma_cookie_status(chan, cookie, state);

If the cookie status is DMA_IN_PROGRESS, can the thread be preempted
before taking the lock?

During this window, the hardware interrupt could fire, completing the
transfer and triggering the vchan_complete tasklet which frees the
descriptor memory.

When sun6i_dma_tx_status() resumes and acquires the lock, it might fail
to find the descriptor in the pending lists and fall back to calculating
the size using the active physical channel state:

bytes =3D sun6i_get_chan_size(pchan);

Inside sun6i_get_chan_size(), this would dereference the freed descriptor:

pos =3D pchan->desc->p_lli;

Since pchan->desc is cleared by sun6i_dma_tasklet running sequentially
afterwards, could this lead to a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727061142.4419=
5-1-zenghongling@kylinos.cn?part=3D1
