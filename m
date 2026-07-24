Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006C041DDF6;
	Fri, 24 Jul 2026 10:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889700; cv=none; b=ZvmY+TIOkcpgyMsaX0s6jCS5PtoKYHOD9AW22BTMXOIxUVcx4sczjsCtPieek/uE24nRaK8QYbEmH4lPKxbU5GPopkrqBrparnEtP+F5+exjbAtO9ZpBwMf+fJDFS2XAyOQEhVOL7kxXESSrjaVvGhzN1TOPgs33/FKkXpjVh5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889700; c=relaxed/simple;
	bh=WVDGlabZDVmWe07SZfxb3rPDcO1YMF6MDU3jMHI7Snc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j5Li6XK4GZZ8ynBmhpwK1cfsKvKmMpPzrapMuDpGdeDsd7hNHJwW1nASJ+TnbmPSecTJ3hOqwy7KSIPrOVZYInHZR3BSiUNFtNRyCOucwKhPuWXuGGsOY0SwdgE4YslY6eoFAwhngocOVGZ9gC+lSFnK3TA7QlfQ2CEszg0UiPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ayUSbWTm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ayUSbWTm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7631F000E9;
	Fri, 24 Jul 2026 10:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784889698;
	bh=X40X+lovPid0C3aZ/AjnGKXlJ6Yk4rU4PlahQ74A5G8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ayUSbWTmClvxp2CmeGxGeeW/BvSJgKjAdhFb+CP3ztayyK/2Iy2X/FMXxxSb07e6s
	 bH1bwSLTHHcMfS9IOUHKX6Gfrdj2xifI6JYd5CursUwjRMH1r/OniQe/aHMXjvj0v3
	 INeMlasxLuh+vLbYlXhJEB49V/vwXrihygtilCgOXbqkExqFsEjXgytvk/eIT1k3uh
	 1QTjOC5D1WhUl/sFy7PNNj1cPwHxp8BS31fTdVsSL8Dz2Agke9Xcn56lxk5hwPAUvU
	 j+Y6G1XV5J4hBJvBEzb0iptElZBei4Te3rhUL5k1ahAyX2UODJUlv9qdUgUlw92K0w
	 V+VUaufohhoRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 01/19] dmaengine: ti: k3-udma: Fix sporadic crash on
 AM62x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260724102115.2854-2-s-adivi@ti.com>
References: <20260724102115.2854-1-s-adivi@ti.com>
 <20260724102115.2854-2-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 10:41:37 +0000
Message-Id: <20260724104138.2E7631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The commit claims to fix a sporadic crash by zero-initializing `ri=
ng_init_data`, but this is a placebo that masks the true root cause.

Pre-existing issues:
- [High] Incorrect use of `INIT_DELAYED_WORK_ONSTACK` on heap-allocated cha=
nnel objects causes a debug objects leak.
- [Medium] Permanent memory and DMA mapping leak on probe error paths for `=
udma_setup_rx_flush` buffers.
--

--- Patch [1]: [PATCH v7 01/19] dmaengine: ti: k3-udma: Fix sporadic crash =
on AM62x ---
commit 5866c70a265652a85a02f5cc7fc41a1ae2f5bfae
Author: Vignesh Raghavendra <vigneshr@ti.com>

dmaengine: ti: k3-udma: Fix sporadic crash on AM62x

This commit attempts to fix a sporadic crash during ring pop on AM62x by
zero-initializing ring_init_data on the stack, stating that uninitialized
garbage led to junk addresses.

> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index fb21e0df5ab7b..48f4db777d924 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c
> @@ -5484,7 +5484,7 @@ static int udma_probe(struct platform_device *pdev)
>  	if (ud->match_data->type =3D=3D DMA_TYPE_UDMA) {
>  		ud->ringacc =3D of_k3_ringacc_get_by_phandle(dev->of_node, "ti,ringacc=
");
>  	} else {
> -		struct k3_ringacc_init_data ring_init_data;
> +		struct k3_ringacc_init_data ring_init_data =3D { 0 };
> =20
>  		ring_init_data.tisci =3D ud->tisci_rm.tisci;
>  		ring_init_data.tisci_dev_id =3D ud->tisci_rm.tisci_dev_id;

[Severity: High]
Is zero-initializing this structure actually addressing the root cause, or=
=20
could it be masking a stack layout issue?

Since struct k3_ringacc_init_data is exactly 16 bytes on 64-bit platforms
with no padding, and every single field is explicitly assigned right after
declaration, it shouldn't be structurally possible for it to contain
uninitialized garbage that is actually read by the subsequent initialization
functions.=20

Could this change merely be shifting the stack layout and hiding an
out-of-bounds access or uninitialized pointer elsewhere in the driver?

[Severity: Medium]
This is a pre-existing issue, but are there missing DMA unmap calls on the
probe failure paths?

When udma_setup_rx_flush() succeeds, it maps memory for DMA:

drivers/dma/ti/k3-udma.c:udma_setup_rx_flush() {
    ...
    rx_flush->buffer_paddr =3D dma_map_single(dev, rx_flush->buffer_vaddr,
                                            rx_flush->buffer_size,
                                            DMA_TO_DEVICE);
    ...
}

If a later initialization step fails in udma_probe(), such as device
registration, the driver returns immediately without cleaning up those
mappings:

drivers/dma/ti/k3-udma.c:udma_probe() {
    ...
    ret =3D dma_async_device_register(&ud->ddev);
    if (ret) {
        dev_err(dev, "failed to register slave DMA engine: %d\n", ret);
        return ret;
    }
    ...
}

Will this result in a permanent resource leak of the mapped DMA space if=20
probe aborts?

[Severity: High]
This is a pre-existing issue, but does using the _ONSTACK variant for
heap-allocated channels create a leak of debug objects?

During channel allocation for both bcdma and pktdma, the work item is
initialized using INIT_DELAYED_WORK_ONSTACK():

drivers/dma/ti/k3-udma.c:bcdma_alloc_chan_resources() {
    ...
    INIT_DELAYED_WORK_ONSTACK(&uc->tx_drain.work,
                              udma_check_tx_completion);
    ...
}

The channel structure is heap-allocated via devm_kcalloc(). Using the
_ONSTACK macro on heap memory registers a debug object that strictly
requires a matching destroy_work_on_stack() call to free.=20

Since destroy_work_on_stack() is never called in udma_free_chan_resources(),
doesn't this permanently leak a debug object every time a channel is
requested by a client?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724102115.2854=
-1-s-adivi@ti.com?part=3D1
