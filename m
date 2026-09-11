Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6D43D1AB3
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 22:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789165609; cv=none; b=jMhAZwEV7s9XFMeKTbL2b099i9dqjZh6QFzTuFdndRP2spBaS2M3yrqgB625OC5pVYG087gxnKSMfZ8I9jZeO4dO8ZrbP1PM9C3RWeawDUkI9IkVh3+vadBGMVDMG638Mu2UVd+BDLzPhorIpfnZDlo5f8jS1YhuXYbx4dX5P4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789165609; c=relaxed/simple;
	bh=643k+I5LTYrDI6j3hcO9dk8C1dtZUfRtc7djzx9UTGM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U6pmoER0eMgGZjhmg10Z2+s2VnC0U3JSRqvL2w0G7JZ7RIECmFAZL/K/X/e2oKlUFI1O064IDtOE9sgqcaVKN9StObf8GASig4wbHNyYzY+7PvVqRIhzDR30HqbnvJ9DGqqKB19o0xqWHTrPmg/sFFzqtpFxbLrm0gTT1eYv++E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNEwuqhu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNEwuqhu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF24E1F000FF;
	Fri, 11 Sep 2026 22:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789165601;
	bh=JcoNHxoY4ThsAH65NOfHxP3sMHJg9aZeu+Ly9CTYwDk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KNEwuqhurTsUJU2WcqYRTg32mk9W7AeEKl3sTh0yXXmbIvS6FI9Pc+hESFiX1Um1I
	 6shs0o6w4sVfATuqoOteK7M93+68VQPlZtzEnWIe0bd3iuUXaFC3wzh5i/rAC5VrHQ
	 vg0UZEcHyCHTfHQywedmTp5fJY5hwlwKDQzwPo7Zo9VclpBi6wBaEn3aqvDsdO7vay
	 5z628OmeOwzogx7ntUeQ9z7hKX53ZXV1/NIEZmHLQj0885j7QBsvXwvYjSgJQkb6Ya
	 0FrQJnn6cz1wx0dgRixWRcsgqIfkltPeJIHa4KnSQDhLFDJD5OFdw3aMc9r5k/VupU
	 WbfLUG18a56Lw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] dmaengine: ppc4xx: convert irq_of_parse_and_map() to
 platform_get_irq()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260911221230.179406-1-rosenp@gmail.com>
References: <20260911221230.179406-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 22:26:41 +0000
Message-Id: <20260911222641.AF24E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Using platform_get_irq() for an optional error IRQ causes spurio=
us error logs and improper deferred probe handling.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but there is a lockl=
ess traversal of `chan->chain` in hardirq context while it is concurrently =
mutated in process/softirq context.
- [High] This problem wasn't introduced by this patch, but the global list =
`ppc440spe_adma_chan_list` is modified and traversed without any synchroniz=
ation.
--

commit 905b47acf0bc2689f9a6c8d641b95aa9d8afae93
Author: Rosen Penev <rosenp@gmail.com>

    dmaengine: ppc4xx: convert irq_of_parse_and_map() to platform_get_irq()
   =20
    Replace irq_of_parse_and_map() with platform_get_irq(), which is the
    preferred way to obtain IRQ resources from platform devices. This
    eliminates the corresponding irq_dispose_mapping() calls.

> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> index 279a431ccae38..f159c887c6a60 100644
> --- a/drivers/dma/ppc4xx/adma.c
> +++ b/drivers/dma/ppc4xx/adma.c
> @@ -3865,28 +3865,25 @@ static int ppc440spe_adma_setup_irqs(struct ppc44=
0spe_adma_device *adev,
>  				     int *initcode)
>  {
>  	struct platform_device *ofdev;
>  	int ret;
> =20
>  	ofdev =3D container_of(adev->dev, struct platform_device, dev);
>  	if (adev->id !=3D PPC440SPE_XOR_ID) {
> -		adev->err_irq =3D irq_of_parse_and_map(np, 1);
> -		if (!adev->err_irq) {
> +		adev->err_irq =3D platform_get_irq(ofdev, 1);
> +		if (adev->err_irq < 0) {

[Severity: Medium]
Will this log a spurious error message during normal probe of devices witho=
ut
an error IRQ?

platform_get_irq() calls dev_err_probe() when the IRQ is missing, which will
print an error before the driver's own warning below.

Also, if the IRQ controller is not yet ready and platform_get_irq() returns
-EPROBE_DEFER, will this error be swallowed, preventing proper probe deferr=
al?

Should platform_get_irq_optional() be used instead?

>  			dev_warn(adev->dev, "no err irq resource?\n");
>  			*initcode =3D PPC_ADMA_INIT_IRQ2;
> -			adev->err_irq =3D -ENXIO;
>  		} else
>  			atomic_inc(&ppc440spe_adma_err_irq_ref);
>  	} else {
>  		adev->err_irq =3D -ENXIO;
>  	}

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but does
ppc440spe_adma_device_clear_eot_status() traverse the channel chain lockles=
sly
in hardirq context while it can be concurrently modified?

drivers/dma/ppc4xx/adma.c:ppc440spe_adma_device_clear_eot_status() {
    ...
				/*
				 * Update the status of corresponding
				 * descriptor.
				 */
				list_for_each_entry(iter, &chan->chain,
				    chain_node) {
					if (iter->phys =3D=3D phys)
						break;
				}
    ...
}

This is called from the hardirq handler, while the list is modified in proc=
ess
or softirq context with only spin_lock_bh() held, which does not disable
hardirqs:

drivers/dma/ppc4xx/adma.c:ppc440spe_adma_tx_submit() {
    ...
	spin_lock_bh(&chan->lock);
    ...
	if (unlikely(list_empty(&chan->chain))) {
		/* first peer */
		list_splice_init(&sw_desc->group_list, &chan->chain);
    ...
}

Can this lead to list corruption or crashes when the hardirq preempts the l=
ist
modification?


[Severity: High]
This is a pre-existing issue, but is the global ppc440spe_adma_chan_list
modified and traversed without any synchronization?

drivers/dma/ppc4xx/adma.c:ppc440spe_adma_probe() {
    ...
	ref =3D kmalloc_obj(*ref);
	if (ref) {
		ref->chan =3D &chan->common;
		INIT_LIST_HEAD(&ref->node);
		list_add_tail(&ref->node, &ppc440spe_adma_chan_list);
	}
    ...
}

This list is traversed locklessly by external callers:

drivers/dma/ppc4xx/adma.c:ppc440spe_async_tx_find_best_channel() {
    ...
	list_for_each_entry(ref, &ppc440spe_adma_chan_list, node) {
		if (dma_has_cap(cap, ref->chan->device->cap_mask)) {
    ...
}

Could this cause a kernel panic if ppc440spe_async_tx_find_best_channel() is
called concurrently with device probe or remove?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911221230.1794=
06-1-rosenp@gmail.com?part=3D1
