Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558ED2E0B5C
	for <dmaengine@vger.kernel.org>; Fri, 22 May 2026 15:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779465449; cv=none; b=X+40qIcfiyqHdlalymJMkS4ojeXMbxnlqZ0CegBUF8IZ3nZ/xpbOJXBgnTv/Kf0t/B3FkN+QxznKqBXI8LH180FFJ7FehJIJMDse+VgEFg5zZ9XWUY1xbGTFmVCQZEoayPra00cD6kcHSwv/BjtI/4aU+wgIjuMCrsQnLTRoEsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779465449; c=relaxed/simple;
	bh=Ob/oRg4wuD1+teyO3FlmqSiOpssxkwWMLwfJWlX6YoQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eqnX1878xZCMlnE2nh2coifLmPjR3XFDjgm2V8t9IkzS9iOKyhb+5V+thKk0/HkPK3Ya7vbaPuvWqLTrOkN2k1zZJyS7DD/7zcI4w72lRX456ugJLOzlAo8R4fIDFcPeyc4WIzjQ2kovU1lvEBHYOFOqPLRPHNmjyJ6WuoBipt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4RdEpFx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4RdEpFx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 826841F000E9;
	Fri, 22 May 2026 15:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779465448;
	bh=PkVvNpIB4fa9t9c1afCoKb72mEe0tzKmxUaIQjsTZmw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R4RdEpFxyKBhcXz+x7U7B+HRGU4vNSjIBbyM8dnfG/w1EPoVc5TjOgswIXH5IsRF/
	 8jq9j+zG8aX7G6kjg3z5agawcC1ZeEUU0i6VNcC530eqk1a5lzJf2QM/kuXj0ok8jN
	 qt8r8QZ+YMluxiJQ1YUQkNweLE78FC2llON/9rxuXMwjwnUEoUs4uQSch7F1Q8O8MU
	 abl9132Jnp8T8PiowuQbbRsaZb9aSav+NR2hOxNfmBkIgWJ2w/X6PmUWX4X7QbdaYl
	 wcdOL2tFIFoFmXIDJdmXBT+WSIals1JgOUadJEkzksobss7jocV70kPHOpTZJYPNsd
	 83qx6S2HFgz3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 07/14] crypto: qce - Cancel work on device detach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260522-qcom-qce-cmd-descr-v18-7-99103926bafc@oss.qualcomm.com>
References: <20260522-qcom-qce-cmd-descr-v18-7-99103926bafc@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 15:57:27 +0000
Message-Id: <20260522155727.826841F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Use-After-Free and use-after-destroy due to incorrect devres t=
eardown order and failure to terminate DMA
--

commit 0f67c777aabfb3f1a0c7fc27fd7a72ea41205a70
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

crypto: qce - Cancel work on device detach

This commit attempts to clean up a previously uncancelled work struct on
device detach by setting up a devres action. It moves the initialization=20
earlier in the probe routine, with the stated goal of avoiding work=20
cancellation before outstanding DMA transfers are terminated.

Fixes: eb7986e5e14d ("crypto: qce - convert tasklet to workqueue")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-94=
5fd1cafbbc%40oss.qualcomm.com?part=3D7

> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index b966f3365b7de..f671946cf7351 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c

[ ... ]

> @@ -227,6 +234,11 @@ static int qce_crypto_probe(struct platform_device *=
pdev)
>  	if (ret)
>  		return ret;
> =20
> +	INIT_WORK(&qce->done_work, qce_req_done_work);
> +	ret =3D devm_add_action_or_reset(dev, qce_cancel_work, &qce->done_work);
> +	if (ret)
> +		return ret;
> +
>  	ret =3D devm_qce_dma_request(qce->dev, &qce->dma);

[Severity: Critical]
Does this devres teardown order cause a use-after-free and use-after-destroy
on device detach?

Because devres actions are executed in LIFO order, registering
qce_cancel_work() before devm_qce_dma_request() and devm_mutex_init() means
the work will be cancelled after the DMA resources are freed and the mutex =
is
destroyed.

The commit message mentions moving the initialization earlier to allow
outstanding DMA transfers to terminate. However, devm_qce_dma_request()
registers qce_dma_release() which frees dma->result_buf, but it does not
explicitly terminate the DMA hardware (e.g., via dmaengine_terminate_sync()=
).

If a DMA transfer is active during teardown, won't the BAM DMA hardware
continue running and write into the freed dma->result_buf?

When the hardware eventually finishes, the DMA completion callback could
access the freed result buffer and schedule done_work. Since
cancel_work_sync() might have already run, this could result in
qce_req_done_work() executing with freed resources and a destroyed mutex.

Could we explicitly stop the DMA hardware first, then cancel the workqueue,
and finally free the memory and locks?

>  	if (ret)
>  		return ret;

[ ... ]

> @@ -239,7 +251,6 @@ static int qce_crypto_probe(struct platform_device *p=
dev)
>  	if (ret)
>  		return ret;
> =20
> -	INIT_WORK(&qce->done_work, qce_req_done_work);
>  	crypto_init_queue(&qce->queue, QCE_QUEUE_LENGTH);
> =20
>  	qce->async_req_enqueue =3D qce_async_request_enqueue;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-qcom-qce-c=
md-descr-v18-0-99103926bafc@oss.qualcomm.com?part=3D7
