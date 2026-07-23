Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4FB360EF4
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827386; cv=none; b=NeXVTWdXcGdkz3HoQVBd5Ls5xSOXgVOe+udPIyyPM3pTXYoQgwLJaBef9Keo5Xkoaa119mSRO0mDFIrJL+0nDaylkIJaaaalc/M4M78uyXz9KxpJ+Rh6M/X0folrSRNTZwuLDZQNydHq+d5YgAKmFe9zqfm7SwGdkznkND02Jgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827386; c=relaxed/simple;
	bh=sSo4oKQmRwGr5Ydo8KSbPWyz2Y2jrrd66Essvkw1CsI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Kt2V+9uvxGphvrmsrnYni64Qiwp/Nbs7RB2eRmzDz4YjOUEDXTybca3shyuhJTSG5jS5iWnxCe8jjx/Pum2L9k0DoK7OQbFu4SAdiGRK/kf/bMxMv28eaXMLoO/zhoK0RDoYe3hl6Ma0SsBRBm76mKYrcQZQ/ZHXlFVuULX6TsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EiSCkRb4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EiSCkRb4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D7B1F000E9;
	Thu, 23 Jul 2026 17:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784827383;
	bh=bClzTYKY7HQqS8CjU+RpMSWNMK5R6V5aloxW/wJTmkg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EiSCkRb49p6UiDUR1UDPrGD7sriacpMiNC83O/JUWKLphLTSugg5ZP3X6UtVrYIjZ
	 FWDke27qZmZdIppUbEp29cPbLeoUDjnN/0OqiFONHrDiBTC9VA+g2n8+/YMvMndBjI
	 dpmbm/BXuquuf87UFUWwMZ/ao3baMsugZ7KVUze8IXrtqAJ/i6NEyFj6EDcE9S0tpW
	 XjUtiM/qw8LAq/TrraCU1YjqPK+dv4qPKDGd1g6c4f+EdaCZoCbSgIEJXaawpbc4Ei
	 wYFU1wcC+Dj3EJVHCdTLhDNBaWTOQ2Aab/wRNfbH2ni4GrfDXBc7P1l2tlHrekcBiS
	 CPwh+XLCoRPEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 12/14] crypto: qce - Map crypto memory for DMA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-12-4f87bb4d9938@oss.qualcomm.com>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
 <20260723-qcom-qce-cmd-descr-v24-12-4f87bb4d9938@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 17:23:02 +0000
Message-Id: <20260723172303.39D7B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The DMA mapped MMIO resource is unmapped before the DMA engine is =
terminated during device removal or probe failure, creating a use-after-unm=
ap vulnerability and risking IOMMU faults.

Pre-existing issues:
- [High] In `devm_qce_register_algs()`, if registration fails for an algori=
thm, the error path repeatedly unregisters the wrong algorithm instead of t=
he successfully registered ones.
- [High] Unregistering dynamically allocated algorithms without providing a=
 `cra_destroy` callback leads to a Use-After-Free of the algorithm structur=
e if the driver is unbound while active `tfm` instances exist.
--

--- Patch [12]: [PATCH v24 12/14] crypto: qce - Map crypto memory for DMA -=
--
commit d1125c072d35c0bbd33322f8359a962c55484182
Author: Bartosz Golaszewski <brgl@kernel.org>
Date:   Thu Jul 23 17:09:18 2026 +0000

    crypto: qce - Map crypto memory for DMA
   =20
    As the first step in converting the driver to using DMA for register
    I/O, let's map the crypto memory range.

> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index aa4a0b1774908..4031b4516d651 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c

[ ... ]

> @@ -254,6 +263,18 @@ static int qce_crypto_probe(struct platform_device *=
pdev)
>  	qce->async_req_enqueue =3D qce_async_request_enqueue;
>  	qce->async_req_done =3D qce_async_request_done;
> =20
> +	qce->dma_size =3D resource_size(res);
> +	qce->base_dma =3D dma_map_resource(dev, res->start, qce->dma_size,
> +					 DMA_BIDIRECTIONAL, 0);
> +	qce->base_phys =3D res->start;
> +	ret =3D dma_mapping_error(dev, qce->base_dma);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
> +	if (ret)
> +		return ret;

[Severity: High]
Does this create a risk of unmapping the DMA memory before the DMA engine
is stopped during unbind or probe failure?

Because devres executes actions in strict LIFO order, and this
devm_add_action_or_reset() is called after devm_qce_dma_request(qce)
(which happens earlier in qce_crypto_probe()), qce_crypto_unmap_dma()
will run before the DMA termination callbacks registered by
devm_qce_dma_request().

Could this lead to an IOMMU fault or memory corruption if the device is
unbound while a DMA transaction is still running on an active tfm?

> +
>  	return devm_qce_register_algs(qce);

[Severity: High]
This isn't a bug introduced by this patch, but looking at
devm_qce_register_algs() called here, does the error handling loop repeated=
ly
unregister the wrong algorithm?

drivers/crypto/qce/core.c:devm_qce_register_algs() {
	for (i =3D 0; i < ARRAY_SIZE(qce_ops); i++) {
		ops =3D qce_ops[i];
		ret =3D ops->register_algs(qce);
		if (ret) {
			for (j =3D i - 1; j >=3D 0; j--)
				ops->unregister_algs(qce);
			return ret;
		}
	}
    ...
}

Inside the inner loop, it iterates with j, but ops is not updated to
qce_ops[j]. Would this cause it to unregister the failed algorithm multiple
times, while leaving the previously successfully registered ones active and
leaking resources?

[Severity: High]
This is a pre-existing issue, but I noticed another problem when these
algorithms are unregistered. Does unregistering dynamically allocated
algorithms without setting a cra_destroy callback lead to a use-after-free
if there are active tfm instances?

For example, in drivers/crypto/qce/sha.c:qce_ahash_unregister():

    crypto_unregister_ahash(&tmpl->alg.ahash);
    list_del(&tmpl->entry);
    kfree(tmpl);

If an active tfm still exists (e.g. from an AF_ALG socket),
crypto_unregister_ahash() doesn't wait for refcounts to reach zero. The
tmpl struct containing the algorithm is immediately freed. When the tfm is
later destroyed, will it attempt to decrement the refcount on the freed
alg structure, resulting in memory corruption?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-qcom-qce-c=
md-descr-v24-0-4f87bb4d9938@oss.qualcomm.com?part=3D12
