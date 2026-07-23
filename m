Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780B237C925
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 17:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827410; cv=none; b=Jl+xsVjsCRP9asiPa/yQeP18ci7H1S7rch3vesOcV8muGU+mfbgLnwCbPwisL2YZntu/0XpjZbmNTv11FmyUgD6dtv0JsIRpz2oCMxpVkrY6PPApJbhdKarMwzEjSzbxlRmIUyZxgBJGZKk0FXpQXvXmJB8Bz0eRSAxxUmTmUS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827410; c=relaxed/simple;
	bh=Sqxuk4QVyjSgg1xSnOSPR++qsst+WhJOkXTQmaCtI8Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q01qKMXvykWAzHKFTDcDcPsfXMpVJGrdK9RiHqnqL8RezGOmCDr74PRoO6CBvXxz6son0lQjAlM6PTWrsgnovGWSj6n93VOzduykEkdFK+xrG943ghrot6qThw2cUneNglp/E53+5FRQD4JI9QaWg6WB6p0FYuYo02AOYdW7gsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=adSh8ZkG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="adSh8ZkG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6BA1F000E9;
	Thu, 23 Jul 2026 17:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784827409;
	bh=verp0Tt8xwFqKG49ZYZaY0V3Khpb8WGi5tyGsSGcMyg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=adSh8ZkGQMMiapY9gVDPCcsmxwah3VoI9DkOe6WLI+jggA/FPRv3FmhjKSk40Eo+H
	 xhc/V9jmtz7CqYXts8TNImuzjCZy8cUIzIy/5VGM3k15+s0TsL8EWUsD0b1lEU/ztR
	 fEyUEa3MnMuGrUoN9SjEyGjZMkk5rY+fyFIwUveU49Na0TONr9/nt5SPV5nkY1JvSO
	 0EII707ZYv/4Rjj6V6sUrlQwVQIg/ZEpux7jdRUMfvgz+m3Hy9ZV9pM5OFJO/c8YtS
	 NH6NRKM+3bcJ/Q/wt4thkkAG3szXq1e5zE/HD3xCzxba5SZsdTlASP3ZwNAtgEK0Or
	 ZZeK21FTOBCTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 07/14] crypto: qce - Cancel work on device detach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-7-4f87bb4d9938@oss.qualcomm.com>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
 <20260723-qcom-qce-cmd-descr-v24-7-4f87bb4d9938@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 17:23:28 +0000
Message-Id: <20260723172328.EA6BA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The devres cleanup ordering causes DMA resources to be freed befor=
e the workqueue is canceled, leading to a Use-After-Free if the worker thre=
ad executes during or after device removal.
- [High] The workqueue is canceled via devres after `qce->lock` is destroye=
d, leading to a destroyed mutex being acquired by the worker thread during =
device unbind.

Pre-existing issues:
- [High] Pending and active crypto requests are dropped without completion =
callbacks during unbind, causing callers to hang indefinitely.
--

--- Patch [7]: [PATCH v24 07/14] crypto: qce - Cancel work on device detach=
 ---
commit 18eff3b6a1db4cc05cfe7a212e77c903df420ca2
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

crypto: qce - Cancel work on device detach

This commit adds a devres action to cancel the done_work workqueue during
device detach or probe error. It also adds DMA termination to the DMA
release devres action to ensure transfers are stopped.

Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-94=
5fd1cafbbc%40oss.qualcomm.com?part=3D7

> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c

[ ... ]

> @@ -226,6 +233,11 @@ static int qce_crypto_probe(struct platform_device *=
pdev)
>  	if (ret)
>  		return ret;
> =20
> +	INIT_WORK(&qce->done_work, qce_req_done_work);
> +	ret =3D devm_add_action_or_reset(dev, qce_cancel_work, &qce->done_work);
> +	if (ret)
> +		return ret;
> +

[Severity: High]
Will this devres registration order cause a use-after-free or a destroyed
mutex access during device removal?

Since devres actions are executed in LIFO order, registering the work
cancellation here means it will execute after the DMA release and mutex
destruction callbacks registered later in qce_crypto_probe().

During teardown, the DMA release devres action runs first:

qce_dma_release() {
        dmaengine_terminate_sync(dma->txchan);
        ...
        dma_release_channel(dma->txchan);
        kfree(dma->result_buf);
}

Later, the mutex is destroyed by devm_mutex_release().

Finally, qce_cancel_work() is called. If the worker thread
qce_req_done_work() executes in this window before the work is cancelled,
won't it try to acquire the destroyed qce->lock and access the freed DMA
channels and buffers?

>  	ret =3D devm_qce_dma_request(qce->dev, &qce->dma);
>  	if (ret)
>  		return ret;

[ ... ]

> diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
> --- a/drivers/crypto/qce/dma.c
> +++ b/drivers/crypto/qce/dma.c
> @@ -13,6 +13,8 @@ static void qce_dma_release(void *data)
>  {
>  	struct qce_dma_data *dma =3D data;
> =20
> +	dmaengine_terminate_sync(dma->txchan);
> +	dmaengine_terminate_sync(dma->rxchan);

[Severity: High]
This is a pre-existing issue, but does terminating the DMA channels here
abandon pending crypto requests?

When dmaengine_terminate_sync() stops the active transfer, the completion
callback for the active request will not execute. Additionally, any pending
requests in qce->queue are dropped without invoking their completion
callbacks when the device is unbound.

Will this cause upper-layer threads waiting on these crypto requests to
hang indefinitely?

>  	dma_release_channel(dma->txchan);
>  	dma_release_channel(dma->rxchan);
>  	kfree(dma->result_buf);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-qcom-qce-c=
md-descr-v24-0-4f87bb4d9938@oss.qualcomm.com?part=3D7
