Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70492420E81
	for <dmaengine@vger.kernel.org>; Mon, 13 Jul 2026 13:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948594; cv=none; b=JLFxblUmvvQv3cUz+oqK6Z9NgK90kZPMl6v0KPcJt9+a//CehP0i6Yzf+sd0OrD2v1Wx0Fqs7pBycmZGuswOFAeO4lNR7rAE/G1qS7xYeegf9ZwyFy+n6eumyvMwUiz3KhZsuOa2GpqV+Bo/WZEGEjoo4xpA3SfoQoOpfFBDmBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948594; c=relaxed/simple;
	bh=J044Gtm8DcSYm8tYlUzkIMrj+EJZlvfG/vqrgrbzK/o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mUYhzcoS5212vuhLyyVgqgKbtQIxu19cyf3At6KzobnF+BqIK0aKu1WOEKwfcPyJq1FzV5jEOAQe9DeWAQ9AjDsUPZ0brKscdsR1PZT0XjUS8njYqhTg5ypQskg/S0Qdl7xD5R9GcX67wnDGpUMt1vu5su5k13Hx4VBKBK/e3F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sz2yh/vK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sz2yh/vK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB9F1F00A3A;
	Mon, 13 Jul 2026 13:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783948593;
	bh=LRjzYM1cX1ClXE/Dabt0y9RHfE/ZrArFEr0LssL6CsI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sz2yh/vKrDe4Jv6VVx5ItQcFucnRmbtWWAJaa2W5FzEyG9f0GLojkZh7hwjzIkT5X
	 0z5rCBS6xMlOLmSKelHSQmOC8WBkKi/BQ9aZlBs32SlGwRwk6OPKsx6JS4jKj8wyyX
	 cZSVGeaTaGHe+ZbWvXll7r5T9aOCgJGl1gF0/qfDxd0QmLWVzaC7bJCmVooyuOHVzW
	 uwbKYecBpBa7h5bMWpiWT6HxjyjD1Fh6hvaPKBr9f50JlEfo0yXahlv8sLCV0s3v6J
	 L1h2CGyzi7cVO8S9lgXvEnbJgrF8qaNrCkvE06biSnNC1kF9ChAdWjGBdE6nRFLYX0
	 pzt0Ees9eUHLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v21 11/14] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260713-qcom-qce-cmd-descr-v21-11-bc2583e18475@oss.qualcomm.com>
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
 <20260713-qcom-qce-cmd-descr-v21-11-bc2583e18475@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 13:16:32 +0000
Message-Id: <20260713131632.DFB9F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The crypto request workqueue can execute after DMA channels and th=
e result buffer have been freed, leading to a Use-After-Free during device =
unbind or probe failure.
--

--- Patch [11]: [PATCH v21 11/14] crypto: qce - Use existing devres APIs in=
 devm_qce_dma_request() ---
commit ae30a428f07757ca3220181d917faca67619bbbd
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
> @@ -12,49 +12,34 @@
> =20
>  #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
> =20
> -static void qce_dma_release(void *data)
> +static void qce_dma_terminate(void *data)
>  {
>  	struct qce_dma_data *dma =3D data;
> =20
>  	dmaengine_terminate_sync(dma->txchan);
>  	dmaengine_terminate_sync(dma->rxchan);
> -	dma_release_channel(dma->txchan);
> -	dma_release_channel(dma->rxchan);
> -	kfree(dma->result_buf);
>  }
> =20
>  int devm_qce_dma_request(struct qce_device *qce)
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
This is a pre-existing issue, but does this devres registration order leave=
 a
use-after-free window during device unbind or probe failure?

In qce_crypto_probe() in drivers/crypto/qce/core.c, qce_cancel_work is
registered before calling devm_qce_dma_request():

	INIT_WORK(&qce->done_work, qce_req_done_work);
	ret =3D devm_add_action_or_reset(dev, qce_cancel_work, &qce->done_work);
	if (ret)
		return ret;

	ret =3D devm_qce_dma_request(qce);

Because devres actions execute in reverse order of registration, during unb=
ind
the DMA resources and result_buf registered here in devm_qce_dma_request()
will be freed first. Then, qce_cancel_work() will finally be executed to ca=
ncel
the workqueue.

If a crypto request completes and schedules qce->done_work just before or
during teardown, could the worker execute concurrently and access the alrea=
dy
freed DMA channels and result_buf inside qce_handle_queue()?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-qcom-qce-c=
md-descr-v21-0-bc2583e18475@oss.qualcomm.com?part=3D11
