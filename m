Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94933451DA
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 09:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278970; cv=none; b=PoyzjfG4sNLj6k1fn6wC767tBkA5Xi4MaoWK6pwnjURGkOpotcDLV0Er3D5UX5vIoD1xSE8fzTA0JORXcbYZw2GtXjQrXeETr3/cDe1lWRUjcZQ+K4fo7CS8L8VASeRWjY1oakuJ88VBMkpKrzDeFzNMVMY6fQXEroDy5gXpRQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278970; c=relaxed/simple;
	bh=gv8CwNZSsrVDkJijlsJ/EumD2OVigkY9y7fjCwollTQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jWJPjkIZ3EAZr0G4nCsq0tpxRA7PsyJEW+P3uIR74uN/q2wtKc0Vys3gq1ueS3RNE5QWKx33RXwgXY3PObnv/gOUP+EvSVT1e2qvMC1nQqLgKxgWskhBkOObOOHUH0lG5NYt/NDEcwWOZXXdPZY6IXojEIDfmqeXg/OkH7sVjpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzW4RcqW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzW4RcqW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997791F00A3A;
	Fri, 17 Jul 2026 09:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784278967;
	bh=atBwCUUI/c6ZGMOuTyhpFRyMAv/XcrILZV8DecPgr+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BzW4RcqWO0PkXjL98CcToq4GEOABy1p+5Lt/Iy91Pl0xGoNgPzsfLParsp9MClavP
	 r8AItZjHSrcay7cgl1T+fncgRvkj2rtgQCwqjtLzx2NjV2azC8RybnbbPg6y9j2Mqc
	 cAdUKZrIgMxelWVEKvXG/o/3phX3IELW9i69ws9CEpWH0GUBCOsGPvMYjfR9ry1YQ1
	 v9KtrvXOfQ4KwiemhGEZdLycYfx/Dp7jPJvV+5egh4yR5IW4dOUVtezMvwDjfSOqZ2
	 m5YcwkE3bRMxpOa8W8vBjXV3W24HRDZbWeWRJQnomtz1jWEoRcwkpifphrn1qCOCaJ
	 Tj2jzdbfzxAOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 12/14] crypto: qce - Map crypto memory for DMA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-12-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
 <20260717-qcom-qce-cmd-descr-v22-12-ff0d18b27246@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 09:02:46 +0000
Message-Id: <20260717090246.997791F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The workqueue cancellation devres action is registered too early, =
leading to use of a destroyed mutex and freed DMA channels during teardown.
- [Medium] The DMA unmap action `qce_crypto_unmap_dma` is registered in the=
 wrong devres order, causing it to execute before DMA is terminated.

Pre-existing issues:
- [High] Incorrect algorithm unregistration on the failure path in devm_qce=
_register_algs() causes a resource leak and potential use-after-free.
--

--- Patch [12]: [PATCH v22 12/14] crypto: qce - Map crypto memory for DMA -=
--
commit d6ac886b4f29b8b9e4e4a48b6b23f8358b593923
Author: Bartosz Golaszewski <brgl@kernel.org>

crypto: qce - Map crypto memory for DMA

As the first step in converting the driver to using DMA for register
I/O, let's map the crypto memory range.

> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index aa4a0b1774908..4031b4516d651 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -191,10 +191,19 @@ static void qce_cancel_work(void *data)
>  	cancel_work_sync(work);
>  }

[Severity: High]
Is the workqueue cancellation devres action registered too early?

Looking at qce_crypto_probe, devm_add_action_or_reset for qce_cancel_work is
registered before devm_qce_dma_request and devm_mutex_init. Because devres
actions execute in LIFO order on teardown, this means the mutex is poisoned
and DMA channels are released before cancel_work_sync is called.

If qce_req_done_work executes concurrently during unbind or probe failure,
could this lead to locking a destroyed mutex and issuing commands on freed
DMA channels?

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

[Severity: Medium]
Will this DMA unmap action execute before the DMA engine is terminated?

During teardown, the devres LIFO ordering will cause qce_crypto_unmap_dma
to run before qce_dma_terminate, which was registered earlier in
devm_qce_dma_request. Can this unmap the crypto memory from the IOMMU
while the BAM DMA engine is still active, potentially causing an IOMMU faul=
t?

> +	if (ret)
> +		return ret;
> +
>  	return devm_qce_register_algs(qce);

[Severity: High]
This is a pre-existing issue, but does the error rollback loop in
devm_qce_register_algs fail to unregister the correct algorithms?

If ops->register_algs() fails, the rollback iterates backwards through j:

drivers/crypto/qce/core.c:devm_qce_register_algs() {
    ...
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

Because this calls ops->unregister_algs(qce) instead of using
qce_ops[j]->unregister_algs(qce), won't it repeatedly unregister the
currently failed algorithm and leave the previously successful algorithms
active?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-qcom-qce-c=
md-descr-v22-0-ff0d18b27246@oss.qualcomm.com?part=3D12
