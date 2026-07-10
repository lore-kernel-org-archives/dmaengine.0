Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1FC3CB907
	for <dmaengine@vger.kernel.org>; Fri, 10 Jul 2026 08:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783671552; cv=none; b=Bgcvju0bwST2dvbt/+2pocDAxXfPcK+jq6p8D3Tly34jPMzP0QV/K/5P4mhoNnO4opfg3RMqSFYjorpX7N2/ApIhWQ6KluLSMZ+VZ/ZXy4rBByUntXdBMP2Ca77Zu5xH3pkYwEV4tL3C8Qv8y8H4N7Kef6cwtB/a2DBmUwbe88k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783671552; c=relaxed/simple;
	bh=ULOMnsNKl4G1mAHWoupDcrANd94R0fQT5P9InJ0c2gs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UX8ZG9FH7LoIS+ulqiSEsN5q8A/b13VAD1qLHEus0sjtT3Z9oe3bnF0vhgmqSmA6t8YGMF8njH96j8Ml7Zwb8Al6DhMemgBY7SvrdZXPEi5cq418AJanXpcw0pK4FQreVzVXO3yGn+jJc5K0plqSYHxsvCw8WnxQ0KvpmjDYl24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOzWiVAd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOzWiVAd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5226C1F000E9;
	Fri, 10 Jul 2026 08:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783671550;
	bh=6zuzRXEn6KKdNQ7LGKSrXzXDF2z9cPW9C44ima9oMkQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UOzWiVAdH9a1+2QhDSldXZWpzG/UzNIotIwXENnSgRku+dC8TgH/kv4273myrpdJc
	 mWmvhWgnvFPjqN5bcOB3Ik2fPRAX+KoMwL4Kb0vi1OMREmaix9tFdm1Np5RFlW302H
	 Dt0ntahFoIIMSSv8InQXqpLgP09/KTO40iNpHdUHFibjVxgCWK4XIg0o3A1Dm/19iV
	 fAAXkEBG94eKhtKi0kNa4EAeNNynfBf26lv9DDIJQAD0wtO9jviLsT3FLWYYvOL93E
	 ANRuET0F0BVMD8iMlAa4XFUu7WtTNj71uZ9MUHAPayoIbjVqvvssCxSU5c8bsCo/MC
	 fJ1XwgWY0+NfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] dmaengine: dw-edma: Fix HDMA channel status
 register access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260710080903.2392888-2-den@valinux.co.jp>
References: <20260710080903.2392888-1-den@valinux.co.jp>
 <20260710080903.2392888-2-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 08:19:09 +0000
Message-Id: <20260710081910.5226C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware lifecycle mismanagement allows memory corruption via cont=
inuing DMA transfers after `dmaengine_terminate_all`.
--

--- Patch [1]: [PATCH 1/7] dmaengine: dw-edma: Fix HDMA channel status regi=
ster access ---
commit 3731db5499eb78e6e698a87ead1446781041195a
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: dw-edma: Fix HDMA channel status register access
   =20
This commit fixes the argument order for GET_CH_32() in
dw_hdma_v0_core_ch_status(). The previous incorrect order of passing the
channel ID and direction caused the status callback to read from the wrong
HDMA channel status register.

> diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/=
dw-hdma-v0-core.c
> index 632abb8b481cf..2beec876b1842 100644
> --- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
> +++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
> @@ -79,7 +79,7 @@ static enum dma_status dw_hdma_v0_core_ch_status(struct=
 dw_edma_chan *chan)
>  	u32 tmp;
> =20
>  	tmp =3D FIELD_GET(HDMA_V0_CH_STATUS_MASK,
> -			GET_CH_32(dw, chan->id, chan->dir, ch_stat));
> +			GET_CH_32(dw, chan->dir, chan->id, ch_stat));

[Severity: High]
This is a pre-existing issue, but I noticed a potential hardware lifecycle
mismanagement in dw_edma_device_terminate_all() which relies on this status
check.

When dmaengine_terminate_all() is called:

drivers/dma/dw-edma/dw-edma-core.c:dw_edma_device_terminate_all() {
    ...
	} else if (dw_edma_core_ch_status(chan) =3D=3D DMA_COMPLETE) {
    ...
	} else if (chan->request > EDMA_REQ_PAUSE) {
		err =3D -EPERM;
	} else {
		chan->request =3D EDMA_REQ_STOP;
	}

	return err;
}

The function returns success after merely setting chan->request =3D EDMA_RE=
Q_STOP,
without issuing hardware commands to abort the active transfer.

Since the hardware continues reading or writing memory in the background, i=
f a
DMA client unmaps or frees the memory based on this function's successful
return, could the DMA hardware access unmapped or reallocated memory, leadi=
ng
to memory corruption?=20

For cyclic transfers, does this cause the hardware to loop indefinitely?

> =20
>  	if (tmp =3D=3D 1)
>  		return DMA_IN_PROGRESS;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710080903.2392=
888-1-den@valinux.co.jp?part=3D1
