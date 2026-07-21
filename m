Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9ED374E57
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641683; cv=none; b=YbGXXMhJwMGJCcCkluCyTy18NaJkTQWmwf2ck9/XI1mmiMhtzXqlmw7/EY8Z3lwYKXhOVJr6PCYbBcf8rfsmbtf5CdZM0Fz1jUoBoSQDUCU9pAyZsLpP42znl4gXwrq80+anSsRc2yS768taqO0HTbgaduwa3fXtlBQ8sG+HHFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641683; c=relaxed/simple;
	bh=kNy5PiEZ+fcSAAAHi9Wwqow0BuZD03ifUi/1BZn7cjY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iJ1g2b2rlmhsKa5mhAXnCnRuaZKVRLlCufjKKwDv3Pf30FInOp2x1K6SMqlH3aJqZ24Hf6e4xZxleoaepLpXIaoTSJDML4RiuJYXISFyBNxeWQ3l6uVMWCPLKNKEmx1E5Qp/P/eIT5VJoBiN3w/nvkhDJe+0kjHNynV6cZawqpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bbvya/jV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bbvya/jV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B681F000E9;
	Tue, 21 Jul 2026 13:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784641681;
	bh=5OsLX5mdHa+pd86iDyQqMkiPoVPOUhT0akFFLyb6C/U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bbvya/jVpnnSV/EY3cf/gFL/qT8ssJnsO2C0xP2tMOgieiLMGauql1ZTUJVP7mHFt
	 EQtXiMGOFB25J/idiJrOKGFvVybnBErb3TYO4Kd67UwtRofudoib8/3LqDpSel+0EO
	 v8slcqpds/tTyZCMGTYFhdG2kKSmk/3hk0kZcRl9wKLO1GHb0FfVgKlTDCBOQnFSRj
	 FKlKQ0Kd/nVwbQFKwHRV2xAEj47Oj4+ThdNww1feTrZCNkA3oIKYlIIjsa1Jlc5WIE
	 Ke5OYp9STi0hBUBjBItH9j1r2/NF9dXPZeDzqTFDJQKVPtw95zYpUmD0u58aWFfauf
	 T/DqR0QvivPHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 12/14] crypto: qce - Map crypto memory for DMA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-12-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-12-1be02deffda9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 13:48:00 +0000
Message-Id: <20260721134800.E3B681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Devres LIFO teardown ordering causes DMA channel Use-After-Free an=
d premature IOMMU unmapping.
--

--- Patch [12]: [PATCH v23 12/14] crypto: qce - Map crypto memory for DMA -=
--
commit e48bbe9c29cbad1f2dade29fb3a850939710cf45
Author: Bartosz Golaszewski <brgl@kernel.org>

crypto: qce - Map crypto memory for DMA

This commit maps the crypto memory range for DMA as a first step in
converting the driver to use DMA for register I/O.

> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index aa4a0b1774908..4031b4516d651 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
[ ... ]
> @@ -254,6 +263,18 @@ static int qce_crypto_probe(struct platform_device *=
pdev)
>  	qce->async_req_enqueue =3D qce_async_request_enqueue;
>  	qce->async_req_done =3D qce_async_request_done;
> =20
> +	qce->dma_size =3D resource_size(res);
> +	qce->base_dma =3D dma_map_resource(dev, res->start, qce->dma_size,
> +					 DMA_BIDIRECTIONAL, 0);
> +	qce->base_phys =3D res->start;
> +	ret =3D dma_mapping_error(dev, qce->base_dma);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);

[Severity: High]
Does this devres registration order create a teardown race condition?

Because devres actions execute in reverse (LIFO) order, registering
qce_crypto_unmap_dma here means it will execute first during driver unbind.

Earlier in qce_crypto_probe(), we register the devres to cancel done_work:

	INIT_WORK(&qce->done_work, qce_req_done_work);
	ret =3D devm_add_action_or_reset(dev, qce_cancel_work, &qce->done_work);

And we request the DMA channels:

	ret =3D devm_qce_dma_request(qce);

If the driver is unbound while crypto requests are active, the unmapping of
base_dma happens first. Then the DMA channels are released.

Finally, the done_work is cancelled.

If qce->done_work is pending and executes after the channels are released b=
ut
before cancel_work_sync(), will it access the freed DMA channels and trigger
a use-after-free, or cause BAM DMA faults because the IOMMU mapping was
already removed?

> +	if (ret)
> +		return ret;
> +
>  	return devm_qce_register_algs(qce);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-qcom-qce-c=
md-descr-v23-0-1be02deffda9@oss.qualcomm.com?part=3D12
