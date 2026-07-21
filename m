Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5927C374A05
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641573; cv=none; b=h0M05qD7F+08ovc3NByX5OEoUYx2CYzgiADGg27xOKWKEP7O1NomICPp2hTrfPQDVa1x4n8g6R5XBN9sHkosD0uhVqannoweAUxIZtGKYLRmjxycn8hWrnAbnzfRKgEm2o/6nxS8inB7Gue3UQz40aEhedPBby0illR8NRt7hO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641573; c=relaxed/simple;
	bh=lm/GmSV0H4zIoKZJirF1rN0VXO1gmOjb4M8ssIRXJQc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kh/mkYpijcJ9UQU/WI46AYpAR2YNBiomMObMscGugtxqj28aKVVmSmPMgoFyz4d2iYbgYhOWyqcqnQkQODgVX5Q5C4g65YQHzmxHi5HOYzC+hngZogIblLuFA43c8Ir0Ei81OTbibmTAETqwmtl1ILwH2Jiq5+NPkkXDzq1saCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GDDFMVVG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GDDFMVVG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18F01F000E9;
	Tue, 21 Jul 2026 13:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784641571;
	bh=15WTx3wAKG7TnYXE+MHZ13EW7rqfiEKBG5V0aCIj3bo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GDDFMVVGooHKMI3UPXNzKOzxPfRVY9nufC3Iix8JzXJWi8N9L7llTfK5YxkqqUoxp
	 PX6mn/cTrr+uA7RwgTDVkippVH/Q8vVoy0A7AhWKwSxn7CYVN3mElJP5dzC4gCP5KC
	 WoyvfTVF3b+SvX8npK789YCtXn6JknEPwaQby4TLa+ArbjeXTjmG41yHPIqCi7YIGk
	 nxeHey6iAOWt2aLipJ2d7U63ETUkyNrPqmXLwOUB51pw1+t9mBPkmbB2+RKzU7Ejhh
	 Kyn5J5SVn3z12YpJyJeAA0bG7PkFbrgxfbwm5Zi39k0XA8SQ+7oqcuwAor6OhD1asu
	 DF5qjaVvAYAmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 09/14] crypto: qce - Remove unused ignore_buf
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-9-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-9-1be02deffda9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 13:46:11 +0000
Message-Id: <20260721134611.A18F01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The DMA channels and `result_buf` are released before the asynchro=
nous request workqueue (`done_work`) is cancelled, leading to a Use-After-F=
ree of DMA channels and buffer during driver unbind.
--

--- Patch [9]: [PATCH v23 09/14] crypto: qce - Remove unused ignore_buf ---
commit c6ae497c31e39eb0af424aa124dcc9493834ad11
Author: Bartosz Golaszewski <brgl@kernel.org>

crypto: qce - Remove unused ignore_buf
   =20
This commit removes the unused ignore_buf field from the qce_dma_data
structure. It also cleans up the associated offset calculation in the
DMA request initialization.

> diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
> index 7ec9d72fd690f..d1daa229361aa 100644
> --- a/drivers/crypto/qce/dma.c
> +++ b/drivers/crypto/qce/dma.c

[ ... ]

> @@ -43,8 +45,6 @@ int devm_qce_dma_request(struct device *dev, struct qce=
_dma_data *dma)
>  		goto error_nomem;
>  	}
> =20
> -	dma->ignore_buf =3D dma->result_buf + QCE_RESULT_BUF_SZ;
> -
>  	return devm_add_action_or_reset(dev, qce_dma_release, dma);

[Severity: High]
This is a pre-existing issue, but registering qce_dma_release() here creates
a teardown order problem with the asynchronous request workqueue.

In drivers/crypto/qce/core.c, qce_crypto_probe() registers the cleanup acti=
on
for qce->done_work before this DMA request:

qce_crypto_probe() {
    INIT_WORK(&qce->done_work, qce_req_done_work);
    devm_add_action_or_reset(dev, qce_cancel_work, &qce->done_work);
    ...
    devm_qce_dma_request(qce->dev, &qce->dma);
}

Because devres uses a LIFO execution order during unbind, qce_dma_release()
will execute before the workqueue is canceled.=20

If a user unbinds the driver while crypto operations are ongoing,
qce_dma_release() will free the DMA channels and dma->result_buf. If a DMA
completion interrupt had already scheduled qce->done_work, that work sits
pending.=20

When qce_cancel_work() finally runs, cancel_work_sync() will flush the work,
allowing qce_req_done_work() to call qce_handle_queue() and attempt to subm=
it
the next request using the already-freed dma->result_buf and DMA channels.

Could the workqueue cleanup be registered after the DMA request to ensure=20
done_work is explicitly canceled before the DMA channels and buffers are=20
released?

> =20
>  error_nomem:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-qcom-qce-c=
md-descr-v23-0-1be02deffda9@oss.qualcomm.com?part=3D9
