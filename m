Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0177A35CB8C
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827349; cv=none; b=uU1EaEa3/1eULoKSugNnRd1aDLmFEYK1a3rlJ84RJx0o/cwGXWi4VdeaiW9Q7GJBtpCFS+If1V/qkw/whg+U2yGTBatMR1+lPkm5bg63WkmC67/0bmcGHhyHWbLucAM7TS3BH+AtKG8wuULSKAICC+4BQ+3h4JEfJgGyJPQ00K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827349; c=relaxed/simple;
	bh=huZj57WamJDzTgmMvxGXprOZieFTasvyLIUpuO2CoOs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gGKoyMF27DYVNIiLb0h3So9JJyh1nfde4JNXMQe8eMTlHp5UfMf5uKy7v+NqBHrstEZMSyd6WCXgmqnRjtyI/gSXm1w1QwUc2/U3QNgnvvfixKjW83benepqbeqiUfCrw6otlDMX/yMnoM8Vax3g+BUl6CQ+g1wV6nsG1UIc8GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXcX0X5H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXcX0X5H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD2C1F000E9;
	Thu, 23 Jul 2026 17:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784827347;
	bh=8k1vBDk13xWNsWVcdeMAKkGeW2yqRzFQjytlx/w0IYg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QXcX0X5HF/h4+YJnKZbgaqAtT0Aek7+aLrvJ07BeRN4sSV8nIU2NoBv7Hd3K35B/z
	 2QJtIBo4DKGanSpBThfGguqHVfuYl7IKJhO+Vs7fL3Km83jERJ8qwW1qe/gh/Cs379
	 vtEB1GzioGSnQBAvdl5Rn8XhnYbn8bXadke35GLDjLZ1p7tTkvRKhHYDONu2i3wlxO
	 PITMuvC1s6FpRveN3raGrq/4wu9xNyEAkhQ84KuwbWT/vNWKu97hVqaMKagF2Q4VbI
	 llERW2QGReW6UJC47wSWpqW95VARgdZ4EiIfS894wFBf5PG5W4Xyx+/13Sp+P5hucX
	 lc6suTOymwiPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 11/14] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-11-4f87bb4d9938@oss.qualcomm.com>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
 <20260723-qcom-qce-cmd-descr-v24-11-4f87bb4d9938@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 17:22:19 +0000
Message-Id: <20260723172227.4AD2C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `qce_req_done_work` workqueue can execute after DMA channels a=
nd buffers are freed and the mutex is destroyed during driver unbind or pro=
be failure, leading to a Use-After-Free.
--

--- Patch [11]: [PATCH v24 11/14] crypto: qce - Use existing devres APIs in=
 devm_qce_dma_request() ---
commit cf8f5860fd6dc6e67b916d54bc1e6df1f121860b
Author: Bartosz Golaszewski <brgl@kernel.org>

crypto: qce - Use existing devres APIs in devm_qce_dma_request()

This commit switches devm_qce_dma_request() to use devm_kmalloc() and
devm_dma_alloc_chan(). This allows dropping the manual release function
and shrinking the error handling paths.

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

[Severity: High]
This is a pre-existing issue, but does relying on devm unwinding here expose
a use-after-free during driver unbind?

Because qce_cancel_work is registered via devm_add_action_or_reset() early
in qce_crypto_probe() (before the DMA and mutex allocations), devres LIFO
cleanup will run it last.

This means during unbind, devm_mutex_init() unwinds, followed by these
devm DMA and buffer allocations, and finally qce_cancel_work executes.

If a DMA callback fires just before qce_dma_terminate executes, it can
schedule qce->done_work on the system workqueue. The pending
qce_req_done_work() can then execute concurrently with or after these
resources are freed:

drivers/crypto/qce/core.c:qce_req_done_work() {
    ...
    scoped_guard(mutex, &qce->lock) {
        req =3D qce->req;
        qce->req =3D NULL;
    }

    if (req)
        crypto_request_complete(req, qce->result);

    qce_handle_queue(qce, NULL);
}

Could this lead to locking a destroyed mutex and accessing the freed
DMA channels and memory buffer if userspace keeps an AF_ALG socket open
with pending requests?

> -	dma->rxchan =3D dma_request_chan(dev, "rx");
> -	if (IS_ERR(dma->rxchan)) {
> -		ret =3D dev_err_probe(dev, PTR_ERR(dma->rxchan),
> -				    "Failed to get RX DMA channel\n");
> -		goto error_rx;
> -	}
> -
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-qcom-qce-c=
md-descr-v24-0-4f87bb4d9938@oss.qualcomm.com?part=3D11
