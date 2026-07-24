Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C983DA7E6;
	Fri, 24 Jul 2026 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889234; cv=none; b=MB/Z0gCbM3RRHM4GlDcEs49krlc/URidbJcGVF1Kj93Tb5CqWxevLbtuADMhVrf5yiR/Ld9cKITdDtatp4GNmw+5fIY4U3jPP0xCRLu3tw7GojPIebVsWAF//0FtwcxJWrrPWvqXVfOL78mC9VmhIYfO36J6DhD3hVc5n38g0Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889234; c=relaxed/simple;
	bh=T/sK1EA2TugehqFj/664iWi9H/Pt+TIRMccvc77cYfY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uFrGgRt5IMamiGMQs7AHXqXhQb2tvVfA8iqp7nE6VC4ZtXqZTHgvr9OMUv4AccMvjh9wYH3s7UehnJAlP2HKC5KtRRlO5QtYy18rI8wZa7adgZYvo9kn2JnbwG/AAVU0Te10j8t/giVvOYx+0r19FO/FdqYujtSLfedU3s21U+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kbcqb2FN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kbcqb2FN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F311F000E9;
	Fri, 24 Jul 2026 10:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784889233;
	bh=XQEbzmBQidx0QIgRtdLwVwBmC04W3NJxDYSYd6uRPVs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kbcqb2FNZMBvqxJqa343qjVJliNH/ZvcJyq0jeZR9W5L4zVCjMGr/vqmAeC9UzDcQ
	 DaqSn+U0aAivdELeIsz0URKiSH8CTq9iWmf5uvIL5TqrdZe69N4HycUxf8xRAfJFet
	 GvHdZndGlYPtg+QlkGEF8pqQJBJ8r/4aJaLz+52j60uOLt6rKd9b//CLY84h39RZ+p
	 Iv4Q7zD6soVQnZQVHw3ojanUKPtsYakltuJ6RCSFAaTclNj6Fp2PHnzjs261XXDi6N
	 F4cMfyBYrm2tXqFxrg6jb+lqtNvQZa4OUQXA5Z3PUaEGDBPUJktdNeojhm5/AKy3AQ
	 jY4hn9v49undQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 06/19] dmaengine: ti: k3-udma: move ring management
 functions to k3-udma-common.c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260724102115.2854-7-s-adivi@ti.com>
References: <20260724102115.2854-1-s-adivi@ti.com>
 <20260724102115.2854-7-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 10:33:52 +0000
Message-Id: <20260724103352.A2F311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A concurrent interrupt can lead to a double-free or use-after-free=
 of `uc->terminated_desc` and a race on ring reset during channel teardown =
in `udma_free_chan_resources`.
--

--- Patch [6]: [PATCH v7 06/19] dmaengine: ti: k3-udma: move ring managemen=
t functions to k3-udma-common.c ---
commit cd5ab4996b5e12e7dbc4883f2a24b4c6b573b3a1
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma: move ring management functions to k3-udma-common.c

Relocate the ring management functions such as push, pop, and reset
from k3-udma.c to k3-udma-common.c file. These operations are
common across multiple K3 UDMA variants and will be reused by
future implementations like K3 UDMA v2.

> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-com=
mon.c
> index daf5f19dfb3ab..fc5e2c99ee28a 100644
> --- a/drivers/dma/ti/k3-udma-common.c
> +++ b/drivers/dma/ti/k3-udma-common.c

[ ... ]

> @@ -1239,5 +1239,108 @@ void udma_desc_pre_callback(struct virt_dma_chan =
*vc,

[ ... ]

> +void udma_reset_rings(struct udma_chan *uc)
> +{
> +	struct k3_ring *ring1 =3D NULL;
> +	struct k3_ring *ring2 =3D NULL;

[ ... ]

> +	if (ring1)
> +		k3_ringacc_ring_reset_dma(ring1,
> +					  k3_ringacc_ring_get_occ(ring1));
> +	if (ring2)
> +		k3_ringacc_ring_reset(ring2);
> +
> +	/* make sure we are not leaking memory by stalled descriptor */
> +	if (uc->terminated_desc) {
> +		udma_desc_free(&uc->terminated_desc->vd);
> +		uc->terminated_desc =3D NULL;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(udma_reset_rings);

[Severity: High]
This is a pre-existing issue, but can this lead to a double-free or
use-after-free of uc->terminated_desc during channel teardown?

If a hardware teardown times out during udma_synchronize(), it falls back t=
o a
hard reset via udma_reset_chan(), which calls udma_free_chan_resources().

udma_free_chan_resources() accesses uc->terminated_desc and calls
udma_reset_rings() without holding uc->vc.lock, before synchronizing and
freeing the IRQ handler.

If a delayed Teardown Completion Message (TDCM) interrupt fires concurrentl=
y,
udma_ring_irq_handler() will acquire uc->vc.lock and free uc->terminated_de=
sc:

drivers/dma/ti/k3-udma.c:udma_ring_irq_handler() {
    ...
    if (uc->terminated_desc) {
        udma_desc_free(&uc->terminated_desc->vd);
        uc->terminated_desc =3D NULL;
    }
    ...
}

Since udma_reset_rings() does not hold the lock, could both threads enter
udma_desc_free() for the same descriptor, or could udma_reset_rings()
dereference a NULL pointer if the handler sets it to NULL just before acces=
s?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724102115.2854=
-1-s-adivi@ti.com?part=3D6
