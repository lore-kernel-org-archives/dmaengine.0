Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794435838;
	b=M+XpjCnvwSIGDcamWHvbmMIP+Kzs+YIjasEnvhoZQLlq68gsI4Cj1BvCFsMLCPePh8gf
	 Vy5nmJxdLN0Cq8gW1MYvK79fUkfMzjTBRppSPJwcIVcJvtXSUNAuhF2Vaj/pHr32+Mza9
	 PbF7MMMYzJXDfeG6fit9BFvwbM8ZcV0AdsPnPsc4L+CWxUWERtAfdNCkRsBWrNAxDeANu
	 qifV5WBtUpD47p9RQxHS9MJ7OxVKmHpJn6Vj2rTeP3CYjLAyZ4m7DovqDjm7WELAQWk2s
	 6SeuwDzyRTzYXHcyuxTM9eYNjm00vOL/pKRiUCZcpYnGXwzjBfKbkV3dwF/yYifBqbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794435838;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bZ89Jn9VIjdiavN+kLqyRgxItfyiVxGGc3kvXdqBBDI=;
	b=vwKDymhCkxKoS+FolpwZL/FOkBcFo02ZWnJ+nB5O7kosAjx6SaJ6ZFwY18ftqXoFligw
	 NqbhoaC7sp90GhsK8HhCpoWr0Y2Mq4RV6xLazHasP3bwkwhtZ1p+gymLsvNAOQfPwQFvL
	 eL5jLP83RUexnsTg6jqvfwR9ZluHPXgVvvGsZgdVQhWddWz1+JW8d4t9cyFXxDF4f6Hda
	 PEELENyWuqFcSwY6oAGl7E1ExHEi3luzPkZbRsPrxJ5vBdLSbOtX26wWPJMczW/nt4XGI
	 0B3ddZIs0ERW9zgeC6fnDPQB2/AI/u7q0eYZt/JAu7Wh0r1ZrPWSGdl/L9EiEZlDRyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oTUgPE0e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E97606A32E
	for <dmaengine@vger.kernel.org>; Wed, 11 Nov 2026 22:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oTUgPE0e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7267A1F00A05;
	Wed, 11 Nov 2026 22:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794435837;
	bh=bZ89Jn9VIjdiavN+kLqyRgxItfyiVxGGc3kvXdqBBDI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oTUgPE0eoRJRwPRut0dTlzBGfpudzqKst4hgWYili0kK4RMHOOT9G5hNt5mMf/Oj/
	 EdFk8o3V7xilwLRYDXUC285GeQpZlH7UEpPfrC2HlBFY+yyh8iSnI3ZlQHxjfbhQdV
	 mlvst8veaMX+X8dIor+00ivRyBnbUEFEoA44FYZRsLL9qfluuxZV4lKWQ+dxOhoMto
	 +rpO/evayXnLpAvdQrZ3S7tzX5J8b8I5WgoFKuL1ZHN46ngJJkfqAnit81wZ0O8dRa
	 hGDsbyRt723E2epymWSSrfnqIr8jqo/0gdf7c6giCFsw2HlbyICl68LcayMpI8Ohyn
	 JYr5FBpXjss6w==
Message-ID: <sashiko-outbox-209783@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/10] dmaengine: amlogic: Destroy free_wq after devres
 DMA device unregistration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261111215349.1983909-6-lee@kernel.org>
References: <20261111215349.1983909-1-lee@kernel.org>
 <20261111215349.1983909-6-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 22:23:57 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Medium] dmaengine: amlogic: missing platform_get_irq() error check in
  aml_dma_probe() [1]
--

commit 2bde83d0cee966b150690899ee8af15d0fb91330
Author: Lee Jones <lee@kernel.org>

dmaengine: amlogic: Destroy free_wq after devres DMA device unregistration

This commit switches aml_dma->free_wq to devm_alloc_ordered_workqueue() so
that the workqueue is cleaned up on probe failure and destroyed after
devres unregisters the DMA device on removal.

> diff --git a/drivers/dma/amlogic-dma.c b/drivers/dma/amlogic-dma.c
> index 684121d13fcab..791bd82743d31 100644
> --- a/drivers/dma/amlogic-dma.c
> +++ b/drivers/dma/amlogic-dma.c
> @@ -620,7 +620,7 @@ static int aml_dma_probe(struct platform_device *pdev)
>  	if (!aml_dma)
>  		return -ENOMEM;
> =20
> -	aml_dma->free_wq =3D alloc_ordered_workqueue("aml_dma_free", 0);
> +	aml_dma->free_wq =3D devm_alloc_ordered_workqueue(&pdev->dev, "aml_dma_=
free", 0);
>  	if (!aml_dma->free_wq)
>  		return -ENOMEM;
> =20

[Severity: Medium]
This problem wasn't introduced by this patch, but should aml_dma_probe()
check aml_dma->irq for errors after calling platform_get_irq() [1]?

drivers/dma/amlogic-dma.c:aml_dma_probe() {
    ...
	aml_dma->irq =3D platform_get_irq(pdev, 0);
    ...
	ret =3D devm_request_irq(&pdev->dev, aml_dma->irq, aml_dma_interrupt_handl=
er,
			       0, dev_name(&pdev->dev), aml_dma);
}

If platform_get_irq() returns a negative error code such as -EPROBE_DEFER,
passing aml_dma->irq to devm_request_irq() converts it to a large unsigned
IRQ number that fails with -EINVAL, turning probe deferral into a
permanent probe failure.

[1] https://sashiko.dev/#/bug/linux-bec1576a-66f2-4328-8c01-0836c0f63d2a

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111215349.1983=
909-1-lee@kernel.org?part=3D5
