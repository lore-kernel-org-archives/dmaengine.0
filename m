Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810167;
	b=O7ts9qbrpH+7uBqUwHfLUaApbxWMoq4NwDzPCaEiGg7KR0Y7nssr3QhzP8bxfVnD7mqU
	 DjLH2fA5SNV/WRmg3X0ps/TwlQmn3PyGOj5ubmoXf0qK7SdpCcVIxf4ewh2xzjMkqhYMW
	 eY5Xi/SH/yCbBRpMbt+NGuL9o3mMwLMGiCQNru4trcT7355Nkpqwg+P+xXZSt7YSMuPcy
	 331RTrwcsqFZLcBSD40yXDcKVPMN/GR4ZRINXGtnVywmxAeId0GLwUseY1r5kDgXa+xex
	 Jlu73itSpEsuCIVV7cP5Zs17bFs4mclcuH7Yu5MfpI4GGWOviJMNElfLgJTPyjiSqSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810167;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Hmnoclkqj6xDyFefhRcVZYNa9h7beRIkbNpwD5NV6KE=;
	b=Q6SNxaEvxX9I+WepycdpihqSwQa3d/4F2VfcCT+FRv4c1JnFvDDZtXE8hBrtgGYKKLRx
	 XAF0PAoZty9ZIj3a4pv6vN+2x+5CcbqFwf5OG4HHaw6KQvArGYtT62+xzwa+X/vfYxYSU
	 C5+LmFlSRqW9l7CV55FhbdJVp/ueQ3fWSD1QSwbU6Mo6pdob/hdvcnJ82X8ynxw8491LQ
	 3wri+s0xouw12NyFExoldoapsEXiJT2Cvwd2a8L2USMSZZqZ0TYIhuPONVEAjqVgfU5g7
	 ee1o6MUiYCqf/mMPjiHvPZ0NrcjZvcTZ2Wc5HYX5JHInLTJw8wE/vgDRfQMAZrj6bCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="jbR/li/P";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2E4606A32F
	for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 06:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jbR/li/P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8B41F000C4;
	Mon, 16 Nov 2026 06:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794810167;
	bh=Hmnoclkqj6xDyFefhRcVZYNa9h7beRIkbNpwD5NV6KE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jbR/li/PgDgfNigpOeWjwLnrHUVi7jj872hCVKasa4ewu4ZMp/yQekkeFOJW6auhH
	 0jUpOzyhonQeclYpk+L8k2izkIaosHfRj0xynSqqkZVpz2I6l+EMOBEeW201BSLMHR
	 qLYxaMSiB/fAD4GJED9RGo1K3vvPfjZnFdQ7l0fFzknVGqRD1hcDLrtOTGLjD/psmt
	 YU7YcNrXD72gS/FWVswR4UmTx/hYyPs7CM9F9fr+XDLSntNII09M97knKzSrMsOKIT
	 Vsy4uzuEj2bGBDXpq8eI2klEcloprjlrrzfC26+IsJ6Ys8OeJenr5bHtJI2Ubf+psq
	 GBKfMB4tWQCmQ==
Message-ID: <sashiko-outbox-216269@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/7] dmaengine: dw-axi-dmac: serialize interrupt
 status with channel reuse
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-7-bcb23d1e7029@gmail.com>
References: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
 <20261115-submit-dw-axi-dma-stop-pause-v1-v6-7-bcb23d1e7029@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 06:22:46 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dmaengine: dw-axi-dmac: premature axi_req_irqs() call in
  dw_probe()
--

commit 6c849580a58ee4adc45dc13e6749fbe0bf5958b1
Author: James Hilliard <james.hilliard1@gmail.com>

dmaengine: dw-axi-dmac: serialize interrupt status with channel reuse

This commit moves channel interrupt status reading and clearing under
chan->vc.lock, clears all channel interrupts in dma_chan_terminate_all(),
and moves axi_req_irqs() after vchan_init() in dw_probe().

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index 97098367535f0..0116c44d3bef1 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c

[ ... ]

> @@ -1599,10 +1596,6 @@ static int dw_probe(struct platform_device *pdev)
>  	if (!dw->chan)
>  		return -ENOMEM;
> =20
> -	ret =3D axi_req_irqs(pdev, chip);
> -	if (ret)
> -		return ret;
> -
>  	INIT_LIST_HEAD(&dw->dma.channels);
>  	for (i =3D 0; i < hdata->nr_channels; i++) {
>  		struct axi_dma_chan *chan =3D &dw->chan[i];
> @@ -1616,6 +1609,10 @@ static int dw_probe(struct platform_device *pdev)
>  		vchan_init(&chan->vc, &dw->dma);
>  	}
> =20
> +	ret =3D axi_req_irqs(pdev, chip);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Is axi_req_irqs() still called too early in dw_probe()?

axi_req_irqs() registers dw_axi_dma_interrupt() with IRQF_SHARED, so the
handler can run immediately when another device on the shared line
asserts an interrupt or when CONFIG_DEBUG_SHIRQ is enabled.  At this
point in dw_probe(), axi_dma_resume() has not yet enabled chip->clks,
axi_dma_hw_init() has not masked channel interrupts, and
dmaenginem_async_device_register() has not allocated
chan->vc.chan.chan_dev:

drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dw_probe() {
	...
	ret =3D axi_dma_resume(chip);
	if (ret < 0)
		goto err_pm_disable;

	axi_dma_hw_init(chip);

	pm_runtime_put(chip->dev);

	ret =3D dmaenginem_async_device_register(&dw->dma);
	...
}

If dw_axi_dma_interrupt() runs before those steps, it accesses DMAC
registers while the clocks are disabled, enables global DMAC interrupts
before per-channel interrupts are masked, and dereferences a NULL
chan->vc.chan.chan_dev in axi_chan_name() or vchan_chan_dev().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115-submit-dw-=
axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com?part=3D7
