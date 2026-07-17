Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7A43E4C88
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 08:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278478; cv=none; b=KdlXuWxiMN9N0BnsluBIizAOWkC4J0o6cf1+QETar1gNy2yQkk9oaDYrXluqBI7flmPA8ya45+oYejgYYxsXb88qG369YnO6OHVVhYJkUIrOO2rrwHrbobH5kak/xq91jyOKc7R2hBrtaeOweroLEjlGdknIRTz+9g3Oi5Lb7WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278478; c=relaxed/simple;
	bh=Ejdd/suH1lvDkk655iM2tvrTs5uFHgpEFMIoBtZBqGI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OGngwBCDlrAD4vCSzi7WbzHxnxMCaa37ZqNNhl0tG3W/XAijDQ3LKnddckOLHNluf+eJZmDlmbQlrKobcG9mvq/HMJ1PgFR1LZZpM/W2CgwT9eMcUgcT/qg0/2m+ya4Gc4GgTftBgwnv8YXMc5lEHfh430pNmPJwQUnOufNBi5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mgtqlczD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgtqlczD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B41C1F000E9;
	Fri, 17 Jul 2026 08:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784278476;
	bh=ENGnzumt8D1GcA6poLQUJj/CXtLxCWtw/OqiVXTAACw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mgtqlczDJpHYgAbHks060sZWVG46T2vnc8HaNg0969hMJbE/L7IQrNJslh1SW9mmW
	 KmyK+O7MyAWGkxTa8vVjIsg79ivupYmKBd2pwABXc8tqqVxhZ7WdLPAV/wxp5cy6Jc
	 XwTWT3VoLWEIPBClWK+aEb/CA9/j6NaV8907EMJbLiQ73V1mcZOygRNa0AfqOqpFTd
	 EbIoVgBB3Yf+gEqE4qFHhZ9b0kFJFgsYs44Y07XdCrQXkW0cDMR2Nat8CBevGKW77B
	 VyV4qd4ntspcnkBGjIK3q7dcQKEODYhloZ6/XLYxRHQjVkRF4aMh0WH2xeHj5k2O1+
	 eIcjKwLW+q7JA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 09/14] crypto: qce - Remove unused ignore_buf
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-9-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
 <20260717-qcom-qce-cmd-descr-v22-9-ff0d18b27246@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 08:54:35 +0000
Message-Id: <20260717085436.2B41C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Background workqueue is cancelled after DMA channels and memory ar=
e freed, leading to a UAF if the work executes concurrently during device t=
eardown.
- [High] Self-deadlock in `qce_handle_queue` when completing a backlog requ=
est.
--

--- Patch [9]: [PATCH v22 09/14] crypto: qce - Remove unused ignore_buf ---
commit 2247b3c61623eab5bba053110822c8e653d692e5
Author: Bartosz Golaszewski <brgl@kernel.org>

crypto: qce - Remove unused ignore_buf

This commit removes the unused ignore_buf field from the qce_dma_data struc=
t.
It also moves the QCE_IGNORE_BUF_SZ definition to dma.c since it is only
used locally.

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
This is a pre-existing issue, but does device teardown have a race condition
leading to a use-after-free here?

During device unbind, devres executes cleanup actions in reverse order.
In drivers/crypto/qce/core.c:qce_crypto_probe(), the devm action to cancel
the work queue is registered before devm_qce_dma_request() is called:

    ret =3D devm_add_action_or_reset(dev, qce_cancel_work, &qce->done_work);

This means qce_cancel_work() will run after qce_dma_release().

If a dma transfer just completed and scheduled qce->done_work,
qce_dma_release() will terminate pending dma transfers and free dma->result=
_buf
before the worker thread is actually canceled.

Could the worker thread then execute qce_req_done_work() and attempt to sub=
mit
a new dma transfer using the freed dma->result_buf and dma channels?


[Severity: High]
This is another pre-existing issue, but is there a risk of a self-deadlock =
in
qce_handle_queue() when completing a backlog request?

In drivers/crypto/qce/core.c:qce_handle_queue():

    if (backlog) {
        scoped_guard(mutex, &qce->lock)
            crypto_request_complete(backlog, -EINPROGRESS);
    }

The crypto_request_complete() callback is invoked while holding qce->lock.

If the submitter's completion callback immediately submits another request
(which is standard behavior for dm-crypt or ipsec when waiting for queue
space), it calls qce_async_request_enqueue().

This would re-enter qce_handle_queue() and attempt to acquire the same
non-recursive qce->lock again.

Can this cause a kernel thread self-deadlock when the queue is full?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-qcom-qce-c=
md-descr-v22-0-ff0d18b27246@oss.qualcomm.com?part=3D9
