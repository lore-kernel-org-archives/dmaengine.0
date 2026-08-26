Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A338349363A;
	Wed, 26 Aug 2026 01:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787708612; cv=none; b=K70aRkJeiHtNKpTS3miYnZtzLKcvTPPfxqMlbUXGfZ7fISJFi4cOsB/nIWJL8HmpnU091aXmNa5Yw+tHqY2WAjrEn64GrAcv8tU9khTYzqsKm5w8Jvh7vX2/27LCSRHX+iqmbrzYnaLta0mIPfteABdrTybTPfAM4PNk+CJ8CV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787708612; c=relaxed/simple;
	bh=rV1VLOgRSrUWmCldSmD6FDk+aLIVUgy9SFt8FmGX9jk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TuYIAqA3wvryB2aUqNhqrdLvxjmKr0rETOgEzK8A3XA0shzOkfr+jD4WcMDWCxlaw1oW4fIB781lX4KW9AQrilQlMwR1mlZ7CGb3pvYMx0yBOVJ8T+y8ehV3I4hIyI2/dL7/olKw++azZT3FsG/1bRVjQOKDUkFeFmuczeIylBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZ4bO4k/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZ4bO4k/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6CD1F000E9;
	Wed, 26 Aug 2026 01:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787708611;
	bh=iDcxWWxjICe3jLCvzIh9X8/how+eVQoGL5bopI2cusg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JZ4bO4k/qIF+hTOIzlx5HSkzxkX/luswaWuAWU9euMHn0/dumBvG75b8kjGvo7YwC
	 byP+il3+tn2b6fTggoIm4X5jSRRXNbVIee6yK9VXNciXi3O/KVlRXSanvyGdOpibWe
	 j5PEuDOvYAtRIAjcT6iRc9qHOBfEKK5Gk+Vqht9Hq3SSaJ8MpAEO5AbBsMvXUPZrlF
	 lzvxuRji9qqPAn2Y+AeaJFOSps6VQ9KxOv+Uac8JivgaTSvCG/k2CRRvxjbATrpLZh
	 orB4rkOG9uhOzd8hQtD96vdGwsk1bBRy1Lvc/adVNnXmC8sPUqeTsMjqILjVGQJFBe
	 dSeE0X8cQW0mg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/5] dmaengine: sun6i-dma: Add num_channels_per_reg
 for flexible interrupt mapping
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yuanshen Cao" <alex.caoys@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260826-sun60i-a733-dma-v4-3-dc2f745f40dc@gmail.com>
References: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
 <20260826-sun60i-a733-dma-v4-3-dc2f745f40dc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 01:43:30 +0000
Message-Id: <20260826014330.EF6CD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Integer division truncation in `sun6i_dma_interrupt` loop bound si=
lently drops interrupts for higher-numbered channels.
- [High] Incorrect physical channel indexing in `sun6i_dma_interrupt` misro=
utes interrupts for higher channels.
- [High] TOCTOU race in `sun6i_dma_interrupt` leads to a NULL pointer deref=
erence on channel teardown.
--

commit 0015717509538d0aa3c622981170b196ad6d4d64
Author: Yuanshen Cao <alex.caoys@gmail.com>

dmaengine: sun6i-dma: Add num_channels_per_reg for flexible interrupt mappi=
ng

The `sun6i-dma` driver previously assumed a fixed number of channels per
interrupt register. The A733 has a different interrupt structure where the
number of channels per register may differ, so add `num_channels_per_reg` to
`struct sun6i_dma_config` to make the interrupt handling logic hardware-agn=
ostic.

> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 53c54161e32a9..b96d7d90f6b53 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c

[ ... ]

> @@ -585,7 +587,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void =
*dev_id)
>  	int i, j, ret =3D IRQ_NONE;
>  	u32 status;
> =20
> -	for (i =3D 0; i < sdev->num_pchans / DMA_IRQ_CHAN_NR; i++) {
> +	for (i =3D 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i=
++) {

[Severity: High]
This isn't a bug introduced by this patch, but does this loop silently igno=
re
higher-numbered channels in sun6i_dma_interrupt() due to integer division
truncation?

If the total number of channels is not perfectly divisible by the channels =
per
register (e.g. Allwinner H3 has 12 channels, 8 per register), this calculat=
ion
truncates the remainder. For H3, 12 / 8 truncates to 1, causing the loop to
only process i =3D 0 (channels 0-7) and skip i =3D 1 (channels 8-11), stall=
ing
those higher channels.

The patch correctly uses DIV_ROUND_UP() in sun6i_dma_dump_com_regs(), should
it be used here as well?

>  		status =3D sun6i_read_irq_stat(sdev, i);
>  		if (!status)
>  			continue;
> @@ -595,7 +597,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void =
*dev_id)
> =20
>  		sun6i_write_irq_stat(sdev, i, status);
> =20
> -		for (j =3D 0; (j < DMA_IRQ_CHAN_NR) && status; j++) {
> +		for (j =3D 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
>  			pchan =3D sdev->pchans + j;

[Severity: High]
This is a pre-existing issue, but does this array indexing misroute interru=
pts
for channels in subsequent registers?

The index calculation in sun6i_dma_interrupt() completely ignores the regis=
ter
index `i`. For instance, if an interrupt fires on channel 8 (which is in
register i=3D1, offset j=3D0), this will retrieve sdev->pchans[0] instead of
sdev->pchans[8], erroneously completing channel 0's active transfer.
Shouldn't this incorporate i * sdev->cfg->num_channels_per_reg?

>  			vchan =3D pchan->vchan;
>  			if (vchan && (status & vchan->irq_type)) {

[Severity: High]
This is a pre-existing issue, but does this lockless check introduce a TOCT=
OU
race leading to a NULL pointer dereference on channel teardown?

If a client driver concurrently terminates the channel (e.g., during device
removal) and sun6i_dma_terminate_all() sets pchan->desc to NULL, this code
can evaluate the following block where pchan->desc->vd is dereferenced:

                if (vchan->cyclic) {
                    vchan_cyclic_callback(&pchan->desc->vd);
                } else {
                    spin_lock(&vchan->vc.lock);
                    vchan_cookie_complete(&pchan->desc->vd);

Since the cyclic path takes no locks and the non-cyclic path doesn't re-ver=
ify
pchan->desc after taking the lock, could this crash when the pointer becomes
NULL mid-execution?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-sun60i-a73=
3-dma-v4-0-dc2f745f40dc@gmail.com?part=3D3
