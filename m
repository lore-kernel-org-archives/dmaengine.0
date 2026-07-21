Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B47375ADD
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641669; cv=none; b=u1KMUBy2gr6PEN0NyDlsNr1e6PoT4BFi+XiYm518ztrDfJRr97pLf4rc9/uyFBKm5r3eg+uHssHbGy3lfP8va6gDFb283BThCU2Bb34JygAY70+Jim9W6CG8oSECMwK93igy/9U9flxuhv30P/oxZQDR8s2s+cusqPvEP73nRHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641669; c=relaxed/simple;
	bh=77ioNMHdPiHjZ+lwa03Ktlfs6RSuHQFRhCKmBrcUXk0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EzpicX3w3nbcPAqhQQ8zNfkmv5KPpijUs9w/7QdctvmFjgOgaB70AUH1BuK+kee2cnETEriGCgXKc9HKt7dga4DcbZBFesayUjbfofJujx265RARzcudCLC1psTWVIIZZSba1qVOMs80xEYxcNfb9pERBsbZ9LCYjVQ2gx+S1Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z2NRD235; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z2NRD235"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086301F00A3D;
	Tue, 21 Jul 2026 13:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784641668;
	bh=xsZNUSoLIDGs4GCFcK0CLG3IeE3ZdKCszYiVli717jA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z2NRD235SswYepAJ30FQ1l1aDbDx+gEEqNVvRzJZGsY5cD5AZSgimx0+NIk5cTc8B
	 bjz76VlDOYplwUALCa3+WNfRCg/oAXBx6bvpCWZazpgJzjJP9S9gHowSHEMCiAUVoT
	 ti9PLO+GkZVbBZ2EDMbCJOuJBAjsSGfcei+UC7am1QYTBtMByM42MEEwUhdgCJom/r
	 na+qyJaz7aWe7zNkamkrCaeZmGHlCHFharmuShe6v/koTVtxbc0jFeB/i/lvTmUW8U
	 J9idOcjcf5jD/20UHYdoHh0O/NVyVIVPEgGyIrSm+IiD6FHOI9YvCgjd04lt2jkrke
	 0e/+h+IDDzQTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 11/14] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-11-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-11-1be02deffda9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 13:47:47 +0000
Message-Id: <20260721134748.086301F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Race condition during device unbind leads to Use-After-Free of des=
troyed mutex, released DMA channels, and freed DMA buffers due to incorrect=
 devres registration order.
--

--- Patch [11]: [PATCH v23 11/14] crypto: qce - Use existing devres APIs in=
 devm_qce_dma_request() ---
commit 4763bdc65678beffe23d93e69645b76ed7ebda22
Author: Bartosz Golaszewski <brgl@kernel.org>

crypto: qce - Use existing devres APIs in devm_qce_dma_request()

Switch to devm_kmalloc() and devm_dma_alloc_chan() in devm_qce_dma_request(=
).
This allows us to drop two labels and shrink the function.

> diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
> --- a/drivers/crypto/qce/dma.c
> +++ b/drivers/crypto/qce/dma.c
> @@ -12,49 +12,34 @@
[ ... ]
>  int devm_qce_dma_request(struct qce_device *qce)
>  {
>  	struct qce_dma_data *dma =3D &qce->dma;
>  	struct device *dev =3D qce->dev;
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
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does the devres registration
order create a race condition during device unbind?

In drivers/crypto/qce/core.c:qce_crypto_probe(), the qce_cancel_work action
is registered before devm_qce_dma_request() and devm_mutex_init():

	INIT_WORK(&qce->done_work, qce_req_done_work);
	ret =3D devm_add_action_or_reset(dev, qce_cancel_work, &qce->done_work);
	if (ret)
		return ret;

	ret =3D devm_qce_dma_request(qce);
	if (ret)
		return ret;
	...
	ret =3D devm_mutex_init(qce->dev, &qce->lock);

Since devres unwinds in reverse (LIFO) order, during unbind the mutex is
destroyed and DMA resources are freed before qce_cancel_work() can synchron=
ize
qce->done_work.

If a concurrent completion schedules qce->done_work, could qce_req_done_wor=
k()
execute after these resources are destroyed?

drivers/crypto/qce/core.c:qce_req_done_work()
	...
	scoped_guard(mutex, &qce->lock) {
		req =3D qce->req;
		qce->req =3D NULL;
	}

Would this lead to a use-after-free on the destroyed mutex and released
DMA resources?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-qcom-qce-c=
md-descr-v23-0-1be02deffda9@oss.qualcomm.com?part=3D11
