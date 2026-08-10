Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F8F36403C;
	Mon, 10 Aug 2026 16:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786378012; cv=none; b=FjxK9QcduozvchZiitbLsWlRKQpsGWqWf2jB24yxCy0VVPwvNumrgT2Cig5JI3dkYZxnxoqqPrSM211995xjSygGvrZGxcFwJmIa1uDJKzwey4dJkTCZA9su6imnkAaLnEMYlENdwxQacCzK5IN7yTQ7GSwxAnJuPdEE9T9iYr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786378012; c=relaxed/simple;
	bh=0acIkpWQ1UHEveoY9idOXrswXKOoOMr8FvaeMAVQFPY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uFXMZCCV4xFrCP1NzUAESs9nNwcOH0UWoiOIb7zpXs/IEgEe59itJtXMhM63OiAqfu8P5PLiRPL13jCNHVprOa8ui8HNoEyR9gIUJ03WiBoGHgoSnTzbS+OWnUxL+jJGrJyAPcBKGbLTwZIa2OymK2R+xhzwl6tzqhDTna1AkFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+/DmUFs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+/DmUFs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48DAF1F000E9;
	Mon, 10 Aug 2026 16:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786378006;
	bh=DjnbAFM7x8by+KRHWumU07zwwL6KP+NCBDejLIm0Tg8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m+/DmUFsXJlLQiRym/e4iWIunK/bqF/q7oOS3pAjjxu3BBhH9lOx2XdRfXLs3rDtf
	 DaAflPLGaZofHqe0Tn28bSaE1IL+IeHErW3v3cAQlGSCXZ5/9rKqozffCogAK4tYpt
	 nDBOAtUUXcOfRlNSLkRl8l8FfoiRvgx3xu+of5GC+8lZXy65iWepJ3tWwhsXn0A+p3
	 l2P1QfcGLZTqT3t6IYMM/GwjTHu4q1i5rXD8YKzfxcPQZLUJkoSZvtYEzmel1rfOc5
	 rE/75USKziNTtK2y9Dg4xlWpQb4s9ft00yg3tOAMRX03Yf+j/iPkEQhYWKGeKSDmF6
	 10iEFs3MA/iqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 07/19] dmaengine: ti: k3-udma: Add variant-specific
 function pointers to udma_dev
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: dmaengine@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260810151423.1948224-8-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-8-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 16:06:45 +0000
Message-Id: <20260810160646.48DAF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Unconditional invocation of optional psil_pair and psil_unpair f=
unction pointers leads to potential NULL pointer dereferences.

Pre-existing issues:
- [High] Debug objects leak due to misuse of INIT_DELAYED_WORK_ONSTACK for =
heap-allocated work items.
- [High] Unconditional destruction of hdesc_pool in the error path of pktdm=
a_alloc_chan_resources causes a double-free.
--

--- Patch [7]: [PATCH v8 07/19] dmaengine: ti: k3-udma: Add variant-specifi=
c function pointers to udma_dev ---
commit e169d39794002b63060719c1aeef8f8eb77d45c6
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma: Add variant-specific function pointers to udma_dev

Introduce function pointers in the udma_dev structure to allow
variant-specific implementations for certain operations.
This prepares the driver for supporting multiple K3 UDMA variants,
such as UDMA v2, with minimal code duplication.

> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index 40ba114ac81dd..c44a12157e65f 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c
[ ... ]
> @@ -1663,7 +1663,7 @@ static int udma_alloc_chan_resources(struct dma_cha=
n *chan)
>  	}
> =20
>  	/* PSI-L pairing */
> -	ret =3D navss_psil_pair(ud, uc->config.src_thread, uc->config.dst_threa=
d);
> +	ret =3D ud->psil_pair(ud, uc->config.src_thread, uc->config.dst_thread);

[Severity: Medium]
Will this crash if a future variant does not support PSI-L pairing?

The wrapper function xudma_navss_psil_pair() checks if ud->psil_pair is set
before calling it, but this direct call does not. If a future variant leaves
this pointer unassigned, couldn't this result in a NULL pointer dereference?

[ ... ]
> @@ -1849,8 +1849,8 @@ static int bcdma_alloc_chan_resources(struct dma_ch=
an *chan)
>  		uc->use_dma_pool =3D true;
>  	} else if (uc->config.dir !=3D DMA_MEM_TO_MEM) {
>  		/* PSI-L pairing */
> -		ret =3D navss_psil_pair(ud, uc->config.src_thread,
> -				      uc->config.dst_thread);
> +		ret =3D ud->psil_pair(ud, uc->config.src_thread,
> +				    uc->config.dst_thread);

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a pre-existing iss=
ue
in bcdma_alloc_chan_resources() and pktdma_alloc_chan_resources(). It looks
like the work item is initialized as a stack object but it's embedded within
the heap-allocated struct udma_chan:

	INIT_DELAYED_WORK_ONSTACK(&uc->tx_drain.work,
				  udma_check_tx_completion);

Since destroy_delayed_work_on_stack() is never called when the channel is
freed, wouldn't every allocation/free cycle leak a debug object, eventually
leading to ODEBUG OOM warnings?

[ ... ]
> @@ -2083,7 +2083,7 @@ static int pktdma_alloc_chan_resources(struct dma_c=
han *chan)
>  err_irq_free:
>  	uc->irq_num_ring =3D 0;
>  err_psi_free:
> -	navss_psil_unpair(ud, uc->config.src_thread, uc->config.dst_thread);
> +	ud->psil_unpair(ud, uc->config.src_thread, uc->config.dst_thread);
>  	uc->psil_paired =3D false;
>  err_res_free:
>  	udma_free_tx_resources(uc);

[Severity: High]
This is a pre-existing issue, but the error path in=20
pktdma_alloc_chan_resources() unconditionally destroys the dma pool:

err_res_free:
	udma_free_tx_resources(uc);
	udma_free_rx_resources(uc);
	udma_reset_uchan(uc);
	dma_pool_destroy(uc->hdesc_pool);

If a channel is freed (leaving uc->hdesc_pool as a dangling pointer), and
later re-requested but fails early in the allocation process, wouldn't this
jump to err_res_free and cause a double-free of the pool?

Unlike other paths, there's no check for uc->use_dma_pool here.

[ ... ]
> @@ -2374,8 +2374,8 @@ static void udma_free_chan_resources(struct dma_cha=
n *chan)
> =20
>  	/* Release PSI-L pairing */
>  	if (uc->psil_paired) {
> -		navss_psil_unpair(ud, uc->config.src_thread,
> -				  uc->config.dst_thread);
> +		ud->psil_unpair(ud, uc->config.src_thread,
> +				uc->config.dst_thread);

[Severity: Medium]
As mentioned earlier, does this need a check for ud->psil_unpair being
non-NULL to avoid a potential panic if a future variant lacks PSI-L pairing
support?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810151423.1948=
224-1-s-adivi@ti.com?part=3D7
