Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E337F371885;
	Fri, 14 Aug 2026 14:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786718773; cv=none; b=leyxDq96K4/cu2RZjpD+Dj0d6bCPjiU961RATBL/5GPZzFpNTe+q6Yroa8Wa/bR0+0rtQn/JjGsO7EIMkCfuqmhqWSqoysHlw5/vcTkL+l4neLMd71mqGq4Z57syDcq0TXDS0exWT+O0IRGzV+jQJ5U0jdisP8SNvG0U77QWuRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786718773; c=relaxed/simple;
	bh=I0WFvX8RTZdATBN2gb4+xitiGIlR3y6IIRZ4faYlcXo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BrK4HewSntahI/PcsmayTZEWmQ+4NBkXdpMrCv0O/GrQRYjHq8MziPBALZSFAH1dkTQmejAtyKukB65CCs7Mfe0yUqsy77NgEOE4201XJFKDzeOhOdtZMJHOjwBnl88m+8+IHv+uGh7yFQL4SEpDnVD/9vpTigpCU0Wy1L+V0qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8xYHKeR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8xYHKeR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84BF81F000E9;
	Fri, 14 Aug 2026 14:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786718771;
	bh=pAPSdXnw6hjPlsx26GYqX83B7oNE2wdnLFQUOydAFG0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O8xYHKeRhvANlDV7O3H0KK/goiCyTus2bAVe/90a3pyJGs+60lEbKqRUx5MQgET0D
	 4f/kZswOc+LfmzmhvMVjl/qamlNEzHKUmrpqyqAwISCMMKMHqZQdFF0fCPDmJuY34A
	 CM9+qTaFAer7fI0or5g8M18XHLXN7npzA1Sgp3x+/SMajuJFC2+OutpcHU9Evmrzn+
	 bkqWgwHrHZ+S2of7mRMf3SkSGHMTwq8ittus29bkdzZKvV/8rcQ3HlLY1X1/clwNRj
	 JJkilC/e+BorZQlXvoz1TsfFqthlrI7MBCHnfGPfKEoPO+vTUQq8hxtFZpTOYTsrYp
	 sAKHhPHFXOcRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] dmaengine: sun6i: fix undefined behaviour in
 sun6i_dma_tx_status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Lugnberg" <christian.lugnberg@soundtrack.io>
Cc: linux-sunxi@lists.linux.dev, vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260814142708.79120-3-christian.lugnberg@soundtrack.io>
References: <20260814142708.79120-1-christian.lugnberg@soundtrack.io>
 <20260814142708.79120-3-christian.lugnberg@soundtrack.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 14:46:11 +0000
Message-Id: <20260814144611.84BF81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Lockless read of `vchan->phy` leads to Time-of-Check to Time-o=
f-Use (TOCTOU) Use-After-Free and state corruption.
- [Critical] Interrupt handler races with terminate_all, causing a NULL poi=
nter dereference.
- [High] sun6i_dma_tx_status incorrectly reports the residue of the active =
descriptor for unissued descriptors due to missing cookie validation.
- [High] Deadlock risk due to plain spin_lock() usage on sdev->lock which i=
s shared with a softirq context.
--

--- Patch [2]: [PATCH v2 2/2] dmaengine: sun6i: fix undefined behaviour in =
sun6i_dma_tx_status ---
commit fc20cb9c5238894b0536bcd9408e43b44dedb04e
Author: Christian Lugnberg <christian.lugnberg@soundtrack.io>

dmaengine: sun6i: fix undefined behaviour in sun6i_dma_tx_status

sun6i_dma_tx_status() calls vchan_find_desc() to look up the virtual
descriptor for a given cookie, before checking whether the pointer
vd is NULL. This patch moves the check inside the guard to ensure it is
only reached with a valid pointer.

> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index eb060ba2d4738..070101c109a3f 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -984,7 +984,6 @@ static enum dma_status sun6i_dma_tx_status(struct dma=
_chan *chan,
>  	struct sun6i_pchan *pchan =3D vchan->phy;

[Severity: Critical]
This is a pre-existing issue, but does this lockless read of vchan->phy
introduce a time-of-check to time-of-use (TOCTOU) use-after-free risk?

If sun6i_dma_tasklet concurrently frees this physical channel and allocates
it to a different stream, by the time sun6i_dma_tx_status() acquires the lo=
ck
below and calls sun6i_get_chan_size(pchan), the descriptor might belong to
another channel and could be concurrently freed. Could this cause a
use-after-free when iterating txd->v_lli?

>  	struct sun6i_dma_lli *lli;
>  	struct virt_dma_desc *vd;
[ ... ]
> @@ -996,9 +995,9 @@ static enum dma_status sun6i_dma_tx_status(struct dma=
_chan *chan,
>  	spin_lock_irqsave(&vchan->vc.lock, flags);
> =20
>  	vd =3D vchan_find_desc(&vchan->vc, cookie);
> -	txd =3D to_sun6i_desc(&vd->tx);
> =20
>  	if (vd) {
> +		struct sun6i_desc *txd =3D to_sun6i_desc(&vd->tx);
>  		for (lli =3D txd->v_lli; lli !=3D NULL; lli =3D lli->v_lli_next)
>  			bytes +=3D lli->len;
>  	} else if (!pchan || !pchan->desc) {

[Severity: High]
This is a pre-existing issue, but does this fallback logic incorrectly repo=
rt
the residue of the active descriptor for unissued descriptors?

When queried for a submitted but unissued descriptor, vchan_find_desc() ret=
urns
NULL because the descriptor is in desc_submitted instead of desc_issued. The
code then falls back to calculating residue for the currently running trans=
fer
using pchan->desc in the else block, without verifying if
pchan->desc->vd.tx.cookie matches the requested cookie.

While reviewing the file, I noticed a couple of other pre-existing issues:

[Severity: Critical]
This is a pre-existing issue, but is there a race condition between the
interrupt handler and sun6i_dma_terminate_all() that can lead to a NULL
pointer dereference?

If sun6i_dma_interrupt() reads vchan locklessly and proceeds to handle it,
while sun6i_dma_terminate_all() concurrently runs on another CPU, acquires
vchan->vc.lock, and clears pchan->desc to NULL:

drivers/dma/sun6i-dma.c:sun6i_dma_interrupt() {
    ...
    vchan_cyclic_callback(&pchan->desc->vd);
    ...
    vchan_cookie_complete(&pchan->desc->vd);
    ...
}

Will the lockless call to vchan_cyclic_callback() or the subsequent call to
vchan_cookie_complete() dereference a NULL pointer since the descriptor cou=
ld
have just been cleared?

[Severity: High]
This is a pre-existing issue, but is there a deadlock risk due to plain
spin_lock() usage on sdev->lock?

In sun6i_dma_terminate_all() and sun6i_dma_pause():

drivers/dma/sun6i-dma.c:sun6i_dma_pause() {
    ...
    spin_lock(&sdev->lock);
    ...
}

These functions acquire sdev->lock using a plain spin_lock() from process
context, leaving softirqs enabled. If a softirq interrupts the CPU while the
lock is held, and sun6i_dma_tasklet (running in softirq context) attempts to
acquire the same lock via spin_lock_irq(&sdev->lock), might this result in a
deadlock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814142708.7912=
0-1-christian.lugnberg@soundtrack.io?part=3D2
