Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D740419315
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 06:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616414; cv=none; b=QaTdTbNQE8xDhVdiBe8xfg22p+kj8BAKVTrdKwcj795dZbJkMuGZPlm/Pt2fB1ykNlw6YXFQBDmJlezsn5RDbSIRG/7ra6ht5JmwTP76Ot0rZiZHho1Qi7G6pR6nJ6FTt4UIa5N8d7eA+n5KMEYnkWOaNTMeNxvsfNoA5zgCfCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616414; c=relaxed/simple;
	bh=Zws/PsXKJtLpxxAV9YnCjOFm2PtMtvsj1+sCwXZJXJ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q1Q6J4HlKTRmOr3SzQHX7MpojfHVWIOIrxNKbM498Jn8Fh8pJaUtB4zXdKWxSwl116LWB9clRInXz1O7i7spgZ76krziXk85QOv7HNzjcQ1FM3Z46h/jk/cMMnCaYLtEnMbM4TH9Q2wblilQ+0LuA9LJwV6PPrv1NYvuKa006pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=faZRtG/w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="faZRtG/w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF39E1F000E9;
	Tue, 21 Jul 2026 06:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784616413;
	bh=Bu21m6vSAdHNh2qAifs/pecfIlb07gcsnvyDh+xoKts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=faZRtG/wRqm0i1cAMGg13hQNsdmlSZKr1gAhsveRYwAuyCh+IwmoOwH33X+7u8T/E
	 Ljw2rvjzQ4rBH8Sv59dTj8dHZGPoerJgXyRgFQzkB2P3yINC2m/p2AOEJhgt+AMcX3
	 Dgsv1RjBogbMWlQV2ckD34ggkO+/ghX7XJLCrWj6PkWOhN0fMzmjn9bSh85MC3to9w
	 6MhPgVjGTVN76lO5k6y3Yoty+7WRZ3mPIIfozD6JjZhl9iCLdt3LSY1xmuk1ub5vsc
	 WnXQI20nni1/h0RP87ze0r9xB7YhzSoyijma0hlrgglseTaCG+uL7QpgS/B3wCSGai
	 hi8zB6A9t6juw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/14] dmaengine: dw-edma: Add partial channel
 ownership mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260721062815.4117887-6-den@valinux.co.jp>
References: <20260721062815.4117887-1-den@valinux.co.jp>
 <20260721062815.4117887-6-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 06:46:52 +0000
Message-Id: <20260721064652.CF39E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Teardown asymmetry / UAF risk in dw_edma_remove
--

--- Patch [5]: [PATCH v6 05/14] dmaengine: dw-edma: Add partial channel own=
ership mode ---
commit 4c8696aea18fd0130d8ca7adb9a53eadf014e468
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Add partial channel ownership mode

This commit adds a partial ownership flag for DesignWare eDMA instances
representing a subset of channels. It modifies initialization and teardown
to use a limited quiesce path instead of full core resets, preserving
controller-wide state owned by the peer.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index ee9a8c32adf4c..c9df5bbe23925 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c

[ ... ]

> @@ -1213,14 +1268,16 @@ int dw_edma_remove(struct dw_edma_chip *chip)
>  	struct dw_edma_chan *chan, *_chan;
>  	struct device *dev =3D chip->dev;
>  	struct dw_edma *dw =3D chip->dw;
> -	int i;
> +	int i, err =3D 0;
> =20
>  	/* Skip removal if no private data found */
>  	if (!dw)
>  		return -ENODEV;
> =20
> -	/* Disable eDMA */
> -	dw_edma_core_off(dw);
> +	if (chip->flags & DW_EDMA_CHIP_PARTIAL)
> +		err =3D dw_edma_core_quiesce(dw);
> +	else
> +		dw_edma_core_off(dw);

[Severity: High]
This is a pre-existing issue, but does the teardown sequence in
dw_edma_remove() risk a use-after-free during device unbind?

Looking at dw_edma_remove() in drivers/dma/dw-edma/dw-edma-core.c, the core=
 is
disabled here, IRQs are freed, and the workqueue is destroyed via
destroy_workqueue(dw->wq). Only after these steps are completed is the devi=
ce
unregistered from the DMA subsystem via dma_async_device_unregister(&dw->dm=
a).

Since the device is still exposed to the DMA engine subsystem during this
window, could a client request a channel or submit a new DMA transfer, caus=
ing
the driver to queue operations on the already destroyed workqueue or program
disabled hardware?

>  	/* Free irqs */
>  	for (i =3D (dw->nr_irqs - 1); i >=3D 0; i--)

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721062815.4117=
887-1-den@valinux.co.jp?part=3D5
