Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8649372075
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641478; cv=none; b=JChjsnQRJBypJnIKCfVb7wKBhwyjAwq+0+02g/jKsIQx7XlNM03GMnLTHvAX6pwNL6sfOwoW6UHnjiQl59Qp0BaLFHmfmuCUNLO8spCbFkQwqVzYnhrp/H/Y0R+ULkx4GgDGSPej+LqXyS87VkG5GAd52IOXuMwpxbXgVm0yUTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641478; c=relaxed/simple;
	bh=DypH6c2AfF/irKDQ32zw7M4xqFa+bM7Rti4eCEQ4VK0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lM2f38u06BnbvPTGRNv/9qbYsXEh1dLoOLVaHEFAEGJ2FPGrzYvRlwUccijP16ELdNnmi8b8sbSIzJnD60qcHLaWe2uB5e59II5cuwfENhVzDr1umMplRLBSB49Ji3VScXabGdQX/sEG1ljkzxV41pkUx2xy4PKkhFJm6RsB0y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bgzwjxiZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bgzwjxiZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694E71F00A3A;
	Tue, 21 Jul 2026 13:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784641476;
	bh=/y4aeF8UFul+pz8Uchw/cHsa/pvI92jkXrPfzOXQ658=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bgzwjxiZP0DWIMim+5U7TPs+7stYkJrQujdvPkjspOxVV35K0g2prvg7kV7a/zGaS
	 uvyndCoaCxrcalNmIBOfTJzVU73VdN28FExlcunJktFiFeAZWlY7C80da75nlG2y6o
	 a7vgf13WeOZx2eooFQMsqBp/DF3kI2oF9KqPgFRsmi7AXAM27DOawfLE9mIS39/iO7
	 duMET0t8qPJhb39N+7hkmB66KrOphGSlGO0qxVvM7X+Hil6f1heB0KAZI/T1HBzhSz
	 K6neEP88rSEsW/55kXAYnk6iJMFC/PzTyvRk0ER3TcmAWf4Y/C3UjqAg0BLU1/jqFc
	 o2mDnux2HBZUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 10/14] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-10-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-10-1be02deffda9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 13:44:35 +0000
Message-Id: <20260721134436.694E71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Device unbind sequence incorrectly releases DMA channels and frees=
 memory before the background work item is cancelled, allowing the work ite=
m to trigger a Use-After-Free on these resources.
--

--- Patch [10]: [PATCH v23 10/14] crypto: qce - Simplify arguments of devm_=
qce_dma_request() ---
commit 6680b197a5f4cdb8f7389167e1c7991cd29ab241
Author: Bartosz Golaszewski <brgl@kernel.org>
Subject: crypto: qce - Simplify arguments of devm_qce_dma_request()

This function can extract all the information it needs from struct
qce_device alone so simplify its arguments. This is done in preparation
for adding support for register I/O over DMA which will require
accessing even more fields from struct qce_device.

> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index dd860435d2c47..aa4a0b1774908 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -237,7 +237,7 @@ static int qce_crypto_probe(struct platform_device *p=
dev)
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D devm_qce_dma_request(qce->dev, &qce->dma);
> +	ret =3D devm_qce_dma_request(qce);

[Severity: High]
Does this devres teardown order create a use-after-free during device unbin=
d?

In qce_crypto_probe(), devm_add_action_or_reset() is called for qce_cancel_=
work
before calling devm_qce_dma_request():

drivers/crypto/qce/core.c:qce_crypto_probe() {
    ...
	INIT_WORK(&qce->done_work, qce_req_done_work);
	ret =3D devm_add_action_or_reset(dev, qce_cancel_work, &qce->done_work);
	if (ret)
		return ret;
    ...
	ret =3D devm_qce_dma_request(qce);
    ...
}

Since devres actions execute in reverse order of registration, the DMA reso=
urces
freed in qce_dma_release() (which is registered inside devm_qce_dma_request)
will be released before the background work is cancelled.

If the device is unbound while a crypto request is pending, qce_dma_release=
()
will free the DMA channels and the heap-allocated dma->result_buf.

The background work qce->done_work could then run, dequeue the next request,
and submit it to the freed DMA channels via qce_dma_prep_sgs(), writing to =
the
freed dma->result_buf.

A later fix in commit "crypto: qce - Cancel work on device detach" resolves
this inverted teardown order by grouping termination and freeing together.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-qcom-qce-c=
md-descr-v23-0-1be02deffda9@oss.qualcomm.com?part=3D10
