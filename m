Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EB041D223;
	Tue, 22 Sep 2026 09:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069807; cv=none; b=g6Y76EFW3e920MOMdqyDcvfUXHeMlDWT2kV8GC5aIsD45J8xX1SMRFcYIYGtbvxb3w3QE4ireIo6iV+VppK86fN70Cd6aLBlUI2xA+NoVmBrK255LAFRtXQhPk4v/X9F4T3dfuyJ+vHWnp3fJ4zhCkYqLLmfE5IHAcFqh8jomKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069807; c=relaxed/simple;
	bh=NjrjMUrUEDoaoxo1HBdx12UHTuUvP5cKzqBHcR6Y4nQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jg5IiwuuYyOu+j+676lFgdwBUSkIt7M5qCXYWBqn696k1TbiMFvn8lXNAQUxQTtlHNmZcWd6qjRWGJXOxruVy1z7IXeqG7rhFKr+8DkJaLMrvC7165T9XhlcJjcfzlI32NUbo2AZ8aJBQYK+UT2EqXe6QuwmrfaJutYwFW2zmZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OMZ10AEC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OMZ10AEC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCE11F000FF;
	Tue, 22 Sep 2026 09:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790069805;
	bh=MGDgPVCu/oQZqPrCeAouJ72D+PR3oFOIXDFf2xVwlPg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OMZ10AECWE0WS7XslYgL0cj+fs84dJs/6jCRflOkkPP0Z3kEOq1emTw330KHIptu4
	 EE+xuWSDzfrTkMtbwIfyJTIrsDo0uhH8CmHI5eyO8OomAg5fWSp2sVoUirt784MU5h
	 g6UgscwHPIr1DR/7PCZUEcn3Wfmhz8iUeP43lvwbCZ5G0MV2Z1AMwEeUEcnM+EdoA1
	 SM06rdk9vssXLtA723UbOLJ8Z9r3OBTb3VEQTTdPUme/aa/B1xaA8z3/vStrDUoHqf
	 82DrO92SXMnCnTQ44hl33zqOFCws3Ksi1K6wgYEVoatg2zfQ7NBInxxiAzEskkQEWD
	 peB0mp1H0OOTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] dmaengine: loongson: Add Loongson-2K0300 APB DMA
 mux driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, robh@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <a7d2dae38291f9d23e5a930a394bc85d6c1db438.1790068409.git.zhoubinbin@loongson.cn>
References: <cover.1790068409.git.zhoubinbin@loongson.cn>
 <a7d2dae38291f9d23e5a930a394bc85d6c1db438.1790068409.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 09:36:44 +0000
Message-Id: <20260922093645.1FCE11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] dmaengine: loongson: fix UAF of parent DMA node on route allocation
- [High] dmaengine: loongson: fix NULL pointer dereference on routing error=
 paths
- [Low] dmaengine: loongson: remove unused 'shift' field from mapping struc=
ture
--

commit c46c8efe97ecad5eafdc1a9b6a37374efa172f8a
Author: Binbin Zhou <zhoubinbin@loongson.cn>

dmaengine: loongson: Add Loongson-2K0300 APB DMA mux driver

This commit adds a DMA mux driver for the Loongson-2K0300 SoC. It exposes t=
he
routing fields in the chip global configuration registers as an OF DMA rout=
er,
which validates the specifier, programs the route, and forwards the transla=
tion
to the parent CMC DMA controller.

> diff --git a/drivers/dma/loongson/loongson2-apb-dmamux.c b/drivers/dma/lo=
ongson/loongson2-apb-dmamux.c
> new file mode 100644
> index 0000000000000..b6f1f4112d612
> --- /dev/null
> +++ b/drivers/dma/loongson/loongson2-apb-dmamux.c

[ ... ]

> +struct loongson2_dmamux_map {
> +	u32 reg;
> +	u32 mask;
> +	u8 shift;

[Severity: Low]
Is this shift field needed? Code inspection shows it is initialized in the
ls2k0300_dmamux_maps array for all entries but is never read.=20

The routing logic in loongson2_dmamux_set_route() correctly manages the
shift operation implicitly using the field_prep() macro, which extracts
the shift directly from the compile-time constant mask.

> +	enum loongson2_dmamux_type type;
> +	u32 high_reg;
> +	u8 high_shift;
> +};

[ ... ]

> +static void *loongson2_dmamux_route_allocate(struct of_phandle_args *dma=
_spec,
> +					     struct of_dma *ofdma)
> +{

[ ... ]

> +	/* Program the SoC-specific route register */
> +	ret =3D loongson2_dmamux_set_route(mux, request, channel);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	/*
> +	 * Rewrite dma_spec so the kernel router framework uses it to look
> +	 * up the parent DMA controller and invoke its xlate.
> +	 */
> +	dma_spec->np =3D mux->dma_np;

[Severity: High]
Does this need to increment the reference count on the cached device node?

Looking at the OF DMA framework, of_dma_router_xlate() explicitly calls
of_node_put(dma_spec_target.np) after translating the channel request. Since
this assignment directly copies the pointer without taking a reference via
of_node_get(), will each DMA request unconditionally decrement the reference
count of the cached parent device node, leading to a premature release?

> +	dma_spec->args[0] =3D channel;
> +	dma_spec->args[1] =3D flags;
> +	dma_spec->args_count =3D mux->config->parent_args_count;
> +
> +	return NULL;
> +}

[ ... ]

> +static int loongson2_dmamux_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	mux->dma_router.dev =3D dev;
> +	mux->dma_router.route_free =3D NULL;

[Severity: High]
Will setting this callback to NULL cause a panic on error paths?

In the framework's of_dma_router_xlate() function, if the parent DMA
controller is not yet available (triggering -EPROBE_DEFER), the framework
unconditionally executes ofdma->dma_router->route_free(...) without
checking if the callback exists.

Could this crash the kernel if the parent CMC DMA controller probes after
the peripheral?

> +
> +	platform_set_drvdata(pdev, mux);
> +
> +	ret =3D of_dma_router_register(dev->of_node, loongson2_dmamux_route_all=
ocate,
> +				     &mux->dma_router);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790068409.gi=
t.zhoubinbin@loongson.cn?part=3D3
