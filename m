Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4821841A55E
	for <dmaengine@vger.kernel.org>; Wed, 15 Jul 2026 18:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784139312; cv=none; b=l3Q1Nvi+HrfiMMUdAVaf32b2G/kdrADhR+Zdz56HEuMQNE4tzLmG7W60sK/m8Mout1nmRVot9qI0gUnVOAyyXlQoWuaa03gpN9SK8pRFR+yJe7TMf3ge7DCiCwMVXTplSntX/NPV9+bHcBfrqgGDsmJW5i4XztGbN8Ng+OfrOeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784139312; c=relaxed/simple;
	bh=qyEdOt7ZOl8hDr7wbxfp67jDQwDAhQQ00JZ/iIYYJRY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FOGSnQG+vN+w182QcozoUmRh6tjGQdq2G6+RSx+ZqkwRK0iHuzS9z6jXkwJskYuAHdF6aLAhHKQ3DU2UhAzXnk80xfFgPog0fUur/M2Wq7sdzALyoyAdy4LRwN4ASh0wcTJVTEq76Bgny/txWXMjGSj3wt8/cyUx9JGG+KShW6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+FuU2uh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+FuU2uh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7B41F000E9;
	Wed, 15 Jul 2026 18:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784139309;
	bh=AzvpDC/erhFdxak285iKgBSEagsZScILgZtZPAx1zoo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B+FuU2uhbVJDeRmgHhI7u/CyB5NSsYde5+MfDOn1fHcbBFTgHYLzD4yMm84tfztf6
	 b7K4ZoacOlY6w3C/ExL22igoQyLk4niy/FKxxLHsTQIh8rwgcfPJA7HcVrd6uQSHXY
	 3qoU2A7O/1KTwMIVhgOlWB8Gypo3v1UPBJr2DDj+7o7l7WFd8/dqxZt3yAaPELzkVw
	 uAx94i/RWoYQrXtl3OYOB8tUzp6tNh/IYmXIOtypzy8BLNUKarC5P45+BZeVb2v3Uz
	 QeSpd3TBM1trAAi6Z+rDw/dlAaoxqhAJzxQGkSCjYC7tvxHOnReiZhFFZ3gIhYba0c
	 tTNWCr+Fcfcig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/9] dmaengine: dw-edma: Complete descriptors before
 pausing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260715175740.1110404-5-den@valinux.co.jp>
References: <20260715175740.1110404-1-den@valinux.co.jp>
 <20260715175740.1110404-5-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 18:15:08 +0000
Message-Id: <20260715181509.0B7B41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing locking in `dw_edma_device_pause()` and `dw_edma_device_re=
sume()` leads to data races, list corruption, double free, and channel dead=
lock.
--

--- Patch [4]: [PATCH v3 4/9] dmaengine: dw-edma: Complete descriptors befo=
re pausing ---
commit 59c4b510d7df19eb3243d231516e5c29dab50d72
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Complete descriptors before pausing

This patch modifies dw_edma_start_transfer() usage on resume to set the
channel state to idle if no transfer can be started. It also adds logic
to ignore done interrupts when the channel is paused and ensures
descriptors are completed during a pause request.

> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-=
edma-core.c
> index 272b034057469..b06b299661c02 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -327,7 +327,8 @@ static int dw_edma_device_resume(struct dma_chan *dch=
an)
>  		err =3D -EPERM;
>  	} else {
>  		chan->status =3D EDMA_ST_BUSY;
> -		dw_edma_start_transfer(chan);
> +		if (!dw_edma_start_transfer(chan))
> +			chan->status =3D EDMA_ST_IDLE;

[Severity: High]
This is a pre-existing issue, but does dw_edma_device_resume() execute this
path without holding chan->vc.lock?

The dw_edma_start_transfer() function manipulates virt-dma lists, frees
chunk metadata, and invokes vchan_next_desc() which expects the lock to
be held:

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_start_transfer()
    vd =3D vchan_next_desc(&chan->vc);

A concurrent interrupt in dw_edma_done_interrupt() also takes the lock
and can call dw_edma_start_transfer(). Could this race lead to linked
list corruption, double frees, or lockdep panics?

Additionally, does dw_edma_device_pause() similarly modify chan->request
locklessly?

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_device_pause()
    else
        chan->request =3D EDMA_REQ_PAUSE;

Could this cause data races with dw_edma_done_interrupt() when
dmaengine_pause() and dmaengine_resume() are called while transfers are
ongoing?

>  	}
> =20
>  	return err;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715175740.1110=
404-1-den@valinux.co.jp?part=3D4
