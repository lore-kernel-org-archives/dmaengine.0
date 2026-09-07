Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5D330C179;
	Mon,  7 Sep 2026 03:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788752657; cv=none; b=iqIyEgJVjBHlf5Q9LE4i9rJsHRvnY3DsbFsr2LDaWgckuznHRkhDyc7ZO5kcum4VcESuKPc1Pd2eUzdIs0CSLXqe+sW+gHzD5wx2omOEqJWpGbG0bI142QosAPlvC+opDZGpnA/7WEd+gm8V3Ln4FV07qqRn9eFzF9zUMuF1ylI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788752657; c=relaxed/simple;
	bh=IoK3GmSX0p91W+tHiKX/rJ5ZtxEHId6IvhJbXRY5dWo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nBCXWZm9IILpSqZowXUFD9OrOr4wY96TuEePxtp+9HCwbrdnIuOhgiSQ4dqZ+eS2ND4qIEkmJFTiFLz7HAhKG3JdEWhp0pW89hidnU/lRuabTUeLaVVsbBKcH7xW00RYWVbBLcGvrjw8jlftFayZmEqxlvkrthvj1xSa08gNf40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMJOOFPQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMJOOFPQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208221F00A3A;
	Mon,  7 Sep 2026 03:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788752655;
	bh=p0kIItM6Z6m3qe8sckdYPwjq1U//kYDb7L4V8cxfvoU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kMJOOFPQa5CZ/bf5kHb0KBiixmeui6JxFYhUU5d62dImGGWltI1RAB6ahXc4SdSdU
	 dJmEr8xGNO0CF3/O7MimdVvpjC56qY8WUgIOTtY/DX+rFY52XdZR03qzk9cbZDrMMA
	 8lIqzLY74dpYEUFsPH/EAK2aCJAROUUumzxqAULuelf9pSXiiZJDy1jqVrytCM15UB
	 OyAWlvEfsgaIJSQfcZRE8N9xXgmHIyXvlwT/ONyN/KG+z9PhKeFUW76CO+Ty3VaCCu
	 3ktZfzaT18XOZonbwNxAOBZkYV68ZuNX2yz7b8EqcTpJ2AQ9lTg/Mp0saZN9bnMTnn
	 y1e2WlbbY2+TA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 4/5] dmaengine: cix-sky1-dma350: Add Sky1 integration
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jelly Jia" <Jelly.Jia@cixtech.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260907033404.596839-5-Jelly.Jia@cixtech.com>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20260907033404.596839-5-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 03:44:14 +0000
Message-Id: <20260907034415.208221F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Race condition allocating DMA buffers due to delayed reserved memo=
ry attachment.
- [High] Infinite probe deferral if the child 'arm,dma-350' device node is =
disabled.
- [Medium] Improper mixing of pulse and level reset semantics leads to igno=
red errors and potential power-off failures.
- [Medium] Leaking partially populated child platform devices on `of_platfo=
rm_populate` error path.
--

commit a340fbf6d0923e08511995628a9b9b856250a6c8
Author: Jelly Jia <Jelly.Jia@cixtech.com>

dmaengine: cix-sky1-dma350: Add Sky1 integration driver

Add a CIX Sky1 integration driver for Arm DMA-350 instances. The driver
manages clocks, reset, optional interrupt routing, optional reserved
memory attachment, and populates the child Arm DMA-350 controller.

> diff --git a/drivers/dma/cix-sky1-dma350.c b/drivers/dma/cix-sky1-dma350.c
> new file mode 100644
> index 0000000000000..5904453f34818
> --- /dev/null
> +++ b/drivers/dma/cix-sky1-dma350.c

[ ... ]

> +static int cix_sky1_dma350_enable_resources(struct device *dev)
> +{
> +	struct cix_sky1_dma350 *data =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D clk_bulk_prepare_enable(data->num_clks, data->clks);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D reset_control_reset(data->reset);
> +	if (ret)
> +		goto err_disable_clks;

[ ... ]

> +static void cix_sky1_dma350_disable_resources(struct device *dev)
> +{
> +	struct cix_sky1_dma350 *data =3D dev_get_drvdata(dev);
> +
> +	reset_control_assert(data->reset);

[Severity: Medium]
Is it safe to mix pulse and level reset semantics here?

The enable path uses reset_control_reset() for a pulse, but the disable path
uses reset_control_assert() for a level assertion.

If the underlying reset controller only implements the .reset callback
(pulse), reset_control_assert() will return -ENOTSUPP. Because the return
value is ignored, won't this silently fail to reset the hardware during
unbind or system suspend, leaving it active?

> +	clk_bulk_disable_unprepare(data->num_clks, data->clks);
> +}
> +
> +static int cix_sky1_dma350_attach_reserved_mem(struct device *dev)
> +{
> +	struct cix_sky1_dma350 *data =3D dev_get_drvdata(dev);
> +	struct platform_device *child_pdev;
> +	struct device_node *child_np;
> +	int ret;
> +
> +	if (!of_property_present(dev->of_node, "memory-region"))
> +		return 0;
> +
> +	child_np =3D of_get_compatible_child(dev->of_node, "arm,dma-350");
> +	if (!child_np)
> +		return -ENODEV;
> +
> +	child_pdev =3D of_find_device_by_node(child_np);
> +	of_node_put(child_np);
> +	if (!child_pdev)
> +		return -EPROBE_DEFER;

[Severity: High]
Can this lead to an infinite probe deferral loop if the child device node is
disabled in the device tree?

of_get_compatible_child() does not check the node's availability, so it will
return the child node even if it has status =3D "disabled". Because
of_platform_populate() correctly skips disabled nodes, no device will be
instantiated.

As a result, of_find_device_by_node() will return NULL, causing the driver
to continually return -EPROBE_DEFER instead of ignoring the disabled device.

> +
> +	/*
> +	 * Reserved memory is attached after the child has probed. This relies
> +	 * on arm-dma350 not allocating coherent command buffers in probe;
> +	 * those allocations happen per descriptor at prep time.
> +	 */
> +	ret =3D of_reserved_mem_device_init_by_idx(&child_pdev->dev,
> +						 dev->of_node, 0);

[Severity: High]
Is there a race condition with allocating DMA buffers here?

of_platform_populate() in the probe function synchronously instantiates and
probes the child device, exposing it to the rest of the system.

Could a concurrent DMA client request a channel and prepare a transfer befo=
re
cix_sky1_dma350_attach_reserved_mem() executes? If that happens, allocations
might draw from the default system pool instead of the designated reserved
region, potentially causing hardware faults.

> +	if (ret) {
> +		put_device(&child_pdev->dev);
> +		return ret;
> +	}

[ ... ]

> +static int cix_sky1_dma350_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	ret =3D cix_sky1_dma350_enable_resources(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable resources\n");
> +
> +	ret =3D of_platform_populate(dev->of_node, NULL, NULL, dev);
> +	if (ret)
> +		goto err_disable_resources;

[Severity: Medium]
Does this leak partially populated child platform devices?

If of_platform_populate() encounters an error while instantiating multiple
children, it breaks and returns an error without cleaning up the ones it
already created.

Bypassing err_depopulate here prevents cleanup of platform devices created
prior to the failure, permanently leaking them.

> +
> +	ret =3D cix_sky1_dma350_attach_reserved_mem(dev);
> +	if (ret)
> +		goto err_depopulate;
> +
> +	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907033404.5968=
39-1-Jelly.Jia@cixtech.com?part=3D4
