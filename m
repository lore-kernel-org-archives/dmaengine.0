Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20C4374E6D
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641669; cv=none; b=D/2fVrDegaes13znJX1MtiyWUNqS/fWLtIlBWuJiZPC/5k2tFxKDrT3C9BIlVu+2JrjOfYVVnghzrAHAxQw4rJNmfJgtTRCEqlhC+YkBeIFcIImd7WjCiYAms48mm+4/dhEmWqknrIGKubchzW877x4ccJQaaHzPVnc+G6v+9h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641669; c=relaxed/simple;
	bh=TwiumQCjf4i5LCTju5+j9dqXjwpktWPh0JhTFxnxjkc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YERMtPUOAtUUa/8EHKC0kh/qTHmG47rTs7rWAEToSz6s/5VRYm4RSJU6FLTX8qnzm4cchK3B8Kwy3RKl2b1jJoBBGTSauWyEBxAVwHGtbCs2CMi83v7R2tTc9KPmvLLQeHLBjseXVP7OwvEtGOkGKL3MCUkgg0GJ6el2hIt4OdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSw63Yf1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSw63Yf1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C39E1F00A3A;
	Tue, 21 Jul 2026 13:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784641667;
	bh=gGILVfBjnuPD1XR228bvgvkCvEg1Lc1rfFnCAbp6CH4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kSw63Yf1cfcAm7RY3i02APBegnGEQnIxZvCr/PZrkFPTA61atJ6LEl73VBJI9pzvw
	 B5IxMmZES5uniG44s3XN9R4KqcUbeBy5L1ZDDadlYFToje8aLu7U8YmkWvOcNyM5aR
	 wcxfkYx2NB8kZHCJ81WyOUoOyEnuHvIH5c+tuYaIahxRW5Do3rUBp9gsQtSbappnSX
	 UZ38n2edcRn5Gp2kaEYMdYfTXZHTgtFGgJKDTtbQmEQZgPQvjQ3m9pm6dG5HSlPchD
	 TBc7F8A3LYPk5zOXOcXGHFGQKIUrkI2aUM8Nzx/1nQq0A+WHV+QACCSDZ7BumA3F3R
	 whU1kF5xpUzOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 07/14] crypto: qce - Cancel work on device detach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-7-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-7-1be02deffda9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 13:47:46 +0000
Message-Id: <20260721134747.3C39E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Incorrect devres registration order causes Use-After-Free and Use-=
After-Destroy vulnerabilities during driver teardown.

Pre-existing issues:
- [High] The driver acquires a sleeping lock (`mutex`) in a crypto enqueue =
path that can be called from atomic contexts.
--

--- Patch [7]: [PATCH v23 07/14] crypto: qce - Cancel work on device detach=
 ---
commit c537ce289434b17e2b6ebcb9c83403711f835f30
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

crypto: qce - Cancel work on device detach

The patch adds a devres action to cancel the done_work workqueue on device
detach or probe error. It moves the work initialization earlier and ensures
DMA transfers are terminated during DMA release.

Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-94=
5fd1cafbbc%40oss.qualcomm.com?part=3D7

> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index ac74f69914d61..b52a26ffff5ee 100644
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
Will registering the devres action for work cancellation here cause a
use-after-free and use-after-destroy during driver teardown?

Because devres actions are executed in reverse order (LIFO), registering
the work cancellation before DMA and mutex initialization means the work
will be cancelled last during unbind or probe failure.

The teardown sequence would be:
1. mutex_destroy(&qce->lock)
2. qce_dma_release() (terminates DMA, releases channels, frees dma->result_=
buf)
3. qce_cancel_work()

If qce_req_done_work() is already scheduled or executing concurrently,
it will attempt to acquire the destroyed qce->lock, then dequeue
pending requests and submit new operations using the freed DMA channels
and result_buf.

>  	ret =3D devm_qce_dma_request(qce->dev, &qce->dma);
>  	if (ret)
>  		return ret;
> @@ -238,7 +250,6 @@ static int qce_crypto_probe(struct platform_device *p=
dev)
>  	if (ret)
>  		return ret;
> =20
> -	INIT_WORK(&qce->done_work, qce_req_done_work);
>  	crypto_init_queue(&qce->queue, QCE_QUEUE_LENGTH);
> =20
>  	qce->async_req_enqueue =3D qce_async_request_enqueue;

[Severity: High]
This is a pre-existing issue, but could qce_async_request_enqueue() trigger
a kernel warning by acquiring a sleeping lock in an atomic context?

The crypto API allows asynchronous algorithms to have their enqueue functio=
ns
invoked from atomic contexts, such as a softirq. However,
qce_async_request_enqueue() calls qce_handle_queue(), which attempts to
acquire a mutex:

drivers/crypto/qce/core.c:qce_handle_queue() {
	...
	scoped_guard(mutex, &qce->lock) {
		...
	}
	...
}

Can this result in a "BUG: sleeping function called from invalid context"
when processing network traffic like IPsec in softirq?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-qcom-qce-c=
md-descr-v23-0-1be02deffda9@oss.qualcomm.com?part=3D7
