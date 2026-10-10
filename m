Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B43E3FFF8E
	for <dmaengine@vger.kernel.org>; Sat, 10 Oct 2026 12:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637015; cv=none; b=SSyOVzzbkEimwfgnYP13PBzapIlKEuq8mtUgqd3fqzKgVSCWz6ifq3Gtzj1sEwBzYxwvp8J2cdtNGnKiapvBYQPlx24EsAfmpUfKKxwWsOa3fw+JwPnngugtunkg6Dzp2MlBjP+NEbfeOHyzgN+H/J5y0/Ytls/bc7TdlOGytQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637015; c=relaxed/simple;
	bh=tIjMAMBD040rFcPf0qqH4qyKJP5RGc4NxISbe2N4SvY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=OIGWBMluKxc5+aUSltMldTFlqq50g+s8SxsZ/ufcT6/wIS4BatG3HdxRLSMc5dWIFRFm/vTOJ11MIo+9uIkMAJGChAXtYQkYoHpXXKUE9AhHBCZNaPnJZPwD+FjxBB32nxIjZ5gi+Ie81Q7wxBxVxeaPljCoi9ccYsFKUe2i9k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bb1vexVa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bb1vexVa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0A21F000FF;
	Sat, 10 Oct 2026 12:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791637014;
	bh=zgsKPzfqAp/B5j5mDHaQX3mLaK8suHAGdFRyJiafe7s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bb1vexVarU7BNjvUZ3A5Jrm2r8UHYOylM1/5ydwYfeHuHILJfM+Hu1H0U6CwXf0o1
	 uiGdPG+mjVx66IpLVcqiBHEY5TmshEAvqcal6NIDA0P0jvjRb5KO6z18NDxS81xf/G
	 uFokoqcbuI/Hx7tAn8YysMcZE2OSk2ZTCzTRekS2NsT3hZwozsboF1oGBtdLnfzZhI
	 CKUik4AJuPK5sHdue4I6Bf8aLiGc5uVpx8WzjQtovbk1a0zI7KPbVOxbpEjG/ihK+7
	 gVCG1GeWKdipMXK4on5Dzq2HySVPqhQVByuIQxidkqWKZQ61ESHO2swQBkGPE+egr2
	 XYbldna9C+UlQ==
Message-ID: <sashiko-outbox-166553@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/8] dmaengine: plx_dma: unmap descriptor before
 completing cookie
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20261010124348.19055-7-wsa+renesas@sang-engineering.com>
References: <20261010124348.19055-1-wsa+renesas@sang-engineering.com>
 <20261010124348.19055-7-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 12:56:53 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dmaengine: plx_dma: deadlock in plx_dma_process_desc due to missin=
g _bh
- [High] dmaengine: plx_dma: recursive deadlock when client submits from ca=
llback
--

commit ad3cf51e19996d2f8cb3cdd66ceba6e9d034f3e7
Author: Wolfram Sang <wsa+renesas@sang-engineering.com>

dmaengine: plx_dma: unmap descriptor before completing cookie

To ensure that buffers are flushed, make sure that the descriptor gets
unmapped before completing the cookie.

Link: https://lore.kernel.org/r/20261009093745.539924-1-vkoul@kernel.org

> diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
> index 409898e92c320..7b0fd9843b6a1 100644
> --- a/drivers/dma/plx_dma.c
> +++ b/drivers/dma/plx_dma.c
> @@ -156,8 +156,8 @@ static void plx_dma_process_desc(struct plx_dma_dev *=
plxdev)
>  		else
>  			res.result =3D DMA_TRANS_READ_FAILED;
> =20
> -		dma_cookie_complete(&desc->txd);
>  		dma_descriptor_unmap(&desc->txd);
> +		dma_cookie_complete(&desc->txd);
>  		dmaengine_desc_get_callback_invoke(&desc->txd, &res);

[Severity: High]
Is it possible for a deadlock to occur here due to how ring_lock is acquire=
d?

In plx_dma_process_desc(), ring_lock is acquired using spin_lock() without
disabling bottom halves. If it is called from process context via
plx_dma_tx_status() or plx_dma_abort_desc() and is interrupted by the
plx_dma_desc_task() tasklet, the tasklet will attempt to acquire ring_lock
on the same CPU.

[Severity: High]
Does this code risk a recursive deadlock if a client submits a new
transaction from its completion callback?

plx_dma_process_desc() invokes the client callback synchronously while
holding ring_lock. If a client callback queues the next transaction via
dmaengine_prep_dma_memcpy(), it will enter plx_dma_prep_memcpy() which
attempts to acquire ring_lock again, deadlocking on the same CPU:

drivers/dma/plx_dma.c:plx_dma_prep_memcpy() {
    ...
    spin_lock_bh(&plxdev->ring_lock);
    ...
}

Standard DMA engine patterns require drivers to drop their primary locks
before invoking client callbacks.

>  		desc->txd.callback =3D NULL;
>  		desc->txd.callback_result =3D NULL;
> @@ -183,8 +183,8 @@ static void plx_dma_abort_desc(struct plx_dma_dev *pl=
xdev)
>  		res.residue =3D desc->orig_size;
>  		res.result =3D DMA_TRANS_ABORTED;
> =20
> -		dma_cookie_complete(&desc->txd);
>  		dma_descriptor_unmap(&desc->txd);
> +		dma_cookie_complete(&desc->txd);
>  		dmaengine_desc_get_callback_invoke(&desc->txd, &res);

[Severity: High]
Can a recursive deadlock also happen during abort operations?

Similar to plx_dma_process_desc(), plx_dma_abort_desc() invokes the client
callback synchronously while holding ring_lock (acquired via
spin_lock_bh()). A client queuing a new transaction from this callback
would attempt to acquire the same lock.

>  		desc->txd.callback =3D NULL;
>  		desc->txd.callback_result =3D NULL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010124348.1905=
5-1-wsa+renesas@sang-engineering.com?part=3D6
