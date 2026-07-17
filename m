Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E7A35E1B8
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 09:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784279144; cv=none; b=U2YtTy6h1UCveVaeiyComiJh5COBmcBn4n+9e33FniMrsW3uMiklXEZWnm8iGgue8Fz8okn4jKcF37gJHP4T8FWUB45JqIk8Mdn5dDjXIMDKaGFXHzlN19m8yRGcO+bC1nwhqs0HlyizbTZmf9SNjOXrlHu6J0XKRokmOIsh1BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784279144; c=relaxed/simple;
	bh=XaFw7pFdUCVqWDEWA6piLP/Slu5H9d/NR3wUHAAMEsI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qeXhBhAUokzmRIcNnCFDEXFE6LYaeblt1PesvLI/uSys/HFOGsEBhfPkrvF4IgtEYr+5qNdGm91YE62sHw33GpjgThRfJ9SyJE04qIOIQUqUZ4ssoCZRTilf22/QaQeIlq9ADiTqeDg1lSlYFw3l/unbiIVm+EQAF5d0p9o+MWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ok1PimG4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ok1PimG4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2E81F000E9;
	Fri, 17 Jul 2026 09:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784279142;
	bh=HJbL0/9zj/3fArLDKRQzPJtrL66ifBEebG+XKf0if3c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ok1PimG41WD9djmesCCxYN4UjJr/srgZOTTB/uz08c3YoU+gRklYS6eDb7k1RtdSs
	 uFjCoBJqTtgu77kHzzNtU0wmt9iPr4rRXoWiIxZGYroW6Ve9qXHEif2F6vgaxbICj5
	 A+njOqo9nhiGtn4Iz7dSt3VFQlFRGbHveGk88ZJgffgKYFC+pr97nFFPUWbqBd3k77
	 0KRnSQEP2qKyYiXKg2Nno/p5GPhG+KtatMLV5TaHbVVy2JY1ualsa6Knau6TODXhza
	 +YpRw3dGXkj4T7x4t3fbbR7KE90ghjVzaHOKDHjXPSkcxdkp+royHJI06midyV/XK6
	 9+u/+BzuJGCdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 11/14] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-11-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
 <20260717-qcom-qce-cmd-descr-v22-11-ff0d18b27246@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 09:05:41 +0000
Message-Id: <20260717090542.4A2E81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The crypto request completion work (`qce->done_work`) is cancelled=
 after the DMA channels and result buffer are released, leading to a Use-Af=
ter-Free if the work executes concurrently during device unbind.
--

--- Patch [11]: [PATCH v22 11/14] crypto: qce - Use existing devres APIs in=
 devm_qce_dma_request() ---
commit 7b0cecb1f8e81a661dc520eb8657f4134a795b47
Author: Bartosz Golaszewski <brgl@kernel.org>

crypto: qce - Use existing devres APIs in devm_qce_dma_request()

Switch to devm_kmalloc() and devm_dma_alloc_chan() in
devm_qce_dma_request(). This allows us to drop two labels and shrink the
function.

> diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
> index d60efb5c26d88..26347e9fc078a 100644
> --- a/drivers/crypto/qce/dma.c
> +++ b/drivers/crypto/qce/dma.c

[ ... ]

> @@ -21,40 +21,25 @@ int devm_qce_dma_request(struct qce_device *qce)
>  {
>  	struct qce_dma_data *dma =3D &qce->dma;
>  	struct device *dev =3D qce->dev;
> -	int ret;
> =20
> -	dma->txchan =3D dma_request_chan(dev, "tx");
> +	dma->result_buf =3D devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BU=
F_SZ, GFP_KERNEL);
> +	if (!dma->result_buf)
> +		return -ENOMEM;
> +
> +	dma->txchan =3D devm_dma_request_chan(dev, "tx");
>  	if (IS_ERR(dma->txchan))
>  		return dev_err_probe(dev, PTR_ERR(dma->txchan),
>  				     "Failed to get TX DMA channel\n");
> =20
> -	dma->rxchan =3D dma_request_chan(dev, "rx");
> -	if (IS_ERR(dma->rxchan)) {
> -		ret =3D dev_err_probe(dev, PTR_ERR(dma->rxchan),
> -				    "Failed to get RX DMA channel\n");
> -		goto error_rx;
> -	}
> -
> -	dma->result_buf =3D kmalloc(QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ,
> -				  GFP_KERNEL);
> -	if (!dma->result_buf) {
> -		ret =3D -ENOMEM;
> -		goto error_nomem;
> -	}
> -
> -	return devm_add_action_or_reset(dev, qce_dma_release, dma);
> +	dma->rxchan =3D devm_dma_request_chan(dev, "rx");
> +	if (IS_ERR(dma->rxchan))
> +		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
> +				     "Failed to get RX DMA channel\n");
> =20
> -error_nomem:
> -	dma_release_channel(dma->rxchan);
> -error_rx:
> -	dma_release_channel(dma->txchan);
> -	return ret;
> +	return devm_add_action_or_reset(dev, qce_dma_terminate, dma);

[Severity: High]
This isn't a bug introduced by this patch, but this devres conversion
highlights an existing cleanup ordering issue that could lead to a
Use-After-Free.

In drivers/crypto/qce/core.c:qce_crypto_probe(), the devres action to
cancel the work is registered before requesting DMA resources:

	INIT_WORK(&qce->done_work, qce_req_done_work);
	ret =3D devm_add_action_or_reset(dev, qce_cancel_work, &qce->done_work);
	if (ret)
		return ret;

	ret =3D devm_qce_dma_request(qce);

Because devres actions execute in reverse order of registration (LIFO), dur=
ing
device unbind, devm_qce_dma_request()'s devres actions will run first. This
means qce_dma_terminate() will execute, and the devm-allocated rxchan, txch=
an,
and result_buf will be freed.

Only after these DMA resources are gone will qce_cancel_work() run.

If done_work was already scheduled by a DMA callback before
dmaengine_terminate_sync() executed, could the workqueue thread run
qce_req_done_work() after the resources are freed, accessing the freed
channels and result_buf?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-qcom-qce-c=
md-descr-v22-0-ff0d18b27246@oss.qualcomm.com?part=3D11
