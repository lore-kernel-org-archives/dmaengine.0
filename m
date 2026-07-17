Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3BA3DBD55
	for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 08:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278617; cv=none; b=dRyoB2EuRl1cXUTGjmPh40i0cnybEkJingma9vVOCyoFKY8Z/MRiYvoesx3kUxLZGVDR3omeYpu3OobYONrjfD54rXpxwNjNYymIHa4o9MxPHUnsCk/qbiMyXu3b/YIh0xMDRkhiIGga+3rk3YmWuS6To0TMTbcLShCDPJmBgw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278617; c=relaxed/simple;
	bh=x3L6KVwEMUM7HFI03NQSw7aaBUgzNIjck10NVMgTsvY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jdiP12m7tjr+RSxDNKXRWMTggj/KKHqpR4Mj5JUCshTvCNaHHlWhAN5AA2uN7wrKZelhNz2c0dLLMws0ik0SkHIwgnHhwpWCd3euDdRcRHMfbzE9yGv/UHM5z5PuaiyXZE5z+lqHI5RU5Vg9B51DoG0z/EuDySrGtJF8TVHzymc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MuMVNHlW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MuMVNHlW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C0AB1F00A3E;
	Fri, 17 Jul 2026 08:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784278615;
	bh=nZB3ZkngEfgc3X2hnn7uAuZLgwpwvO/3U/xRJ29FHiY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MuMVNHlWV9Q1uDue3q10bmY5tvd3sJ1sGYCvXeafHi+bhQF+lmFIwAUEYpVirb4Sd
	 neJUM17CcncBmp0TnHk22S3HKfZhoqT2jV0pUAltkux07kNYJeT0qQ+CEjjnTGIO0+
	 ClBX6ATsDc160LB6KivGN6LdMCKeHgPgoJ7ZqooZ4qarUNMscIz0/E+FR1ipz/kiHc
	 iKQnDqcrN5nIXM1sISJDekQDpMaee1BK1m+zP8J+iVXhaJoAMJppisFLTNo124vkHx
	 YqO74eKYE7obbb+7MDqG2qKe794ivHghBP7X9oLNyZ813G9X6DsmdPn+vaNUVnTiPe
	 kk268gEjJpQ/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 07/14] crypto: qce - Cancel work on device detach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-7-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
 <20260717-qcom-qce-cmd-descr-v22-7-ff0d18b27246@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 08:56:54 +0000
Message-Id: <20260717085655.9C0AB1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The devres teardown order allows the workqueue to execute after th=
e mutex is destroyed and DMA resources are freed, leading to Use-After-Dest=
roy and Use-After-Free vulnerabilities.
--

--- Patch [7]: [PATCH v22 07/14] crypto: qce - Cancel work on device detach=
 ---
commit 6d9da6ba83fc4e0d03cfd0b8d7734f1b49da2f07
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

crypto: qce - Cancel work on device detach

The commit moves the initialization of the workqueue earlier in the probe
sequence and adds a devres action to ensure it is cancelled on device detach
or probe error. It also ensures all DMA transfers are terminated synchronou=
sly
during the DMA release action.

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
This isn't a bug introduced by this patch, but does this devres registration
order leave a window for use-after-free and use-after-destroy during teardo=
wn?

Devres actions execute in LIFO order based on registration. Because
qce_cancel_work() is registered here before devm_qce_dma_request() and
devm_mutex_init() are called later in the probe function, the teardown
process will execute in this order:

1. devm_mutex_init teardown (mutex is destroyed)
2. devm_qce_dma_request teardown (DMA channels and buffers are freed)
3. qce_cancel_work() executes

If qce_req_done_work() is scheduled and runs after the mutex is destroyed or
the DMA resources are freed, but before qce_cancel_work() completes, could =
it
access the destroyed mutex or freed DMA resources?

>  	ret =3D devm_qce_dma_request(qce->dev, &qce->dma);
>  	if (ret)
>  		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-qcom-qce-c=
md-descr-v22-0-ff0d18b27246@oss.qualcomm.com?part=3D7
