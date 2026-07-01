Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCA5431E5C
	for <dmaengine@vger.kernel.org>; Wed,  1 Jul 2026 20:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782937190; cv=none; b=ANZsbTJGKndNeDAggO9peqIZ3e/zzPBDAD1iuKYHLGcpOiCHqcsgeZ7bp4MlEsQU3q675S+UNJaPwHWw0pTAYOuvXmBBwNq2COZ/Njln9H3/WcxcEOX04SxjSckFQtFFjbWb0X44ldfH2ZhYiwFakYQVM2VTeTIhYs2oopjHdrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782937190; c=relaxed/simple;
	bh=Svl6N+HisKSTZPIcQ8toMqBaWph4sjvgoMRrQ9xQGmw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N9K2a6xD++aNDflngYf2He4p0xR8VW3W1sipbLJrVxa35L+6LrIF/io+ArnCJFliq55wAP0oaqXSGXbNskG5x2kLo3kW01lY/Z6JIS+L+XjqaD8BdWnwL/f2Zpa5ArRQagoHhulWd2BO7R0JGSBrRqB7TLgBgXWdTWCaJXJXbCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DBxnVHRn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DBxnVHRn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC101F000E9;
	Wed,  1 Jul 2026 20:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782937188;
	bh=zPAC+4H2Lo24SaxByOgb2wlbBFc4828voT6o6XtgrzQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DBxnVHRnn1lSvGlVfhofygokfMbMsgkHAjn9oX/xUIHHs7v88N61JqmAzWgZIeIOB
	 yoi6EWNZKLBr1iWtrFejMEoffwrZ84LDzw5M3/7DB/dySK36at0f8tpdWj7+cJDN+s
	 /2fygOnS+M21liFpa+J/0uRdo9Q8C2Lfk/5Ru+PMcp1ttqHTZKtV+79tc9qcmaRpxo
	 XlR1CPe1AtyVcspQksa6ck3YKTHavIxBAk4uFuAYNnFH9CeALc1C5OmBKKIZWncPoe
	 JXke9dB2YlGRrPyTACLOWAYkyDCtB72eBE3kSQ3wIPloYYpMxRRvbkNYIKU1mHP3Rp
	 GiVEkIwq7nzMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: mediatek: mtk-uart-apdma: Return -ENOMEM on
 memory allocation failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Zapolskiy" <vz@kernel.org>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260701200703.117929-1-vz@kernel.org>
References: <20260701200703.117929-1-vz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 20:19:48 +0000
Message-Id: <20260701201948.7FC101F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Resource leak due to incorrect cleanup order in `mtk_uart_apdma_re=
move`. `mtk_uart_apdma_free` empties the channel list before `dma_async_dev=
ice_unregister` is called.
- [High] Unbalanced runtime PM usage count due to incorrect reference dropp=
ing in `mtk_uart_apdma_alloc_chan_resources`.
--

commit c96187ec35bc4ba2bbf2baf929c0cd8ec646f5d8
Author: Vladimir Zapolskiy <vz@kernel.org>
dmaengine: mediatek: mtk-uart-apdma: Return -ENOMEM on memory allocation fa=
ilure

If dynamic memory allocation in driver's probe function execution fails, it
should be reported to the driver's framework with -ENOMEM error code.

> diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek=
/mtk-uart-apdma.c
> index c269d84d7bd2b..f74e9a3285887 100644
> --- a/drivers/dma/mediatek/mtk-uart-apdma.c
> +++ b/drivers/dma/mediatek/mtk-uart-apdma.c
> @@ -531,7 +531,7 @@ static int mtk_uart_apdma_probe(struct platform_devic=
e *pdev)
>  	for (i =3D 0; i < mtkd->dma_requests; i++) {
>  		c =3D devm_kzalloc(mtkd->ddev.dev, sizeof(*c), GFP_KERNEL);
>  		if (!c) {
> -			rc =3D -ENODEV;
> +			rc =3D -ENOMEM;
>  			goto err_no_dma;
>  		}

[Severity: High]
This is a pre-existing issue, but does mtk_uart_apdma_remove() have a clean=
up
ordering bug?

mtk_uart_apdma_remove() calls mtk_uart_apdma_free() before calling
dma_async_device_unregister():

drivers/dma/mediatek/mtk-uart-apdma.c:mtk_uart_apdma_remove() {
	...
	mtk_uart_apdma_free(mtkd);

	dma_async_device_unregister(&mtkd->ddev);
	...
}

However, mtk_uart_apdma_free() deletes the channels from the device's list:

drivers/dma/mediatek/mtk-uart-apdma.c:mtk_uart_apdma_free() {
	...
		list_del(&c->vc.chan.device_node);
	...
}

Will this cause dma_async_device_unregister() to find an empty channel list
and skip unregistering the channels, leading to a resource leak?

[Severity: High]
This is also a pre-existing issue, but does mtk_uart_apdma_alloc_chan_resou=
rces()
have an unbalanced runtime PM usage count?

If pm_runtime_resume_and_get() fails, it drops the reference it never
acquired, but the error path calls pm_runtime_put_noidle() anyway:

drivers/dma/mediatek/mtk-uart-apdma.c:mtk_uart_apdma_alloc_chan_resources()=
 {
	...
	ret =3D pm_runtime_resume_and_get(mtkd->ddev.dev);
	if (ret < 0) {
		pm_runtime_put_noidle(chan->device->dev);
		return ret;
	}
	...
}

Additionally, if all initialization succeeds, the function appears to fall
through to the err_pm label, dropping the acquired PM reference while
returning success:

	...
err_pm:
	pm_runtime_put_noidle(mtkd->ddev.dev);
	return ret;
}

Later, mtk_uart_apdma_free_chan_resources() unconditionally drops the
reference again via pm_runtime_put_sync().

Could this cause the PM usage count to drop below zero?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701200703.1179=
29-1-vz@kernel.org?part=3D1
