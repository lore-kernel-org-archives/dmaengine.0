Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1B022A817
	for <dmaengine@vger.kernel.org>; Thu, 11 Jun 2026 04:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781150860; cv=none; b=K0+WqOy8Hbtso/T6lZ35b1Jx5F5CYyZ2/JUZ/Zxg16XvG+Jj4jUqGq0ggntTYqMJ4AiB5il9nmpFzm+nt7DgRdWDydKc6l3+NerEIHNhnF9zZc3kbCTr1/yu8C4Ig9XB4L99ctyjqtMOFS/2D2Ubl81GaqoKWqh68kD6w8UD/K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781150860; c=relaxed/simple;
	bh=YE5ZHM0+j0REStDaeyKHdGQ+VXlLcMH1fHLQsySIwQc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tyMd2hS1NaD/Jy9Hg32iJVKOmY2d+sacpW93rMRsLoX6j2P4vWzJr3B8HmyLWrbliCzMTJtU9BS8hkRXQC2fcJYhN926YjYSnsHZUtElAHjPEz5VNp1xSmuC5BJim1EBNku9kja/OUn5SXCUjoCEsS3/e5q5xcHJQwd4OEBGMSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ggXB7TVk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ggXB7TVk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62FF11F00893;
	Thu, 11 Jun 2026 04:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781150858;
	bh=8NBAYdHokWAZIo6BvY5SbF+0e7pmBPKqva/JFwspnag=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ggXB7TVkjEyukFQdXiUaY0YxHx/ggWsYUGf2EpEAXOZqy3/NSjWEvwnY2FZa6dDtO
	 J4EOhN3AFCa+HhPLn/VsZHY2LRrstFFlGtyd9zOrGEzq8F3siz2Ub37PqilQvIctrp
	 ySrWsmhHoTinpN1DGzoOo/PByx6UZGKBnIgUfobGHgJ0BeWN1Nwda++WzcdHdFZXUZ
	 rxLTCyoVowUdypxrYXhHooQqexKFcT6EcZ6WoJOVth5yGn9crc6hksf6BpKeadI/3F
	 R4BIaXGECHyVuww/zn4vxeZLkn/Hn8SP9BRfnLkpzx1gstCaPsZh+CRiMMjXXGnfep
	 eXEsTyC8FsB5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv4 13/15] dmaengine: fsldma: replace irq_of_parse_and_map
 with of_irq_get
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260611035245.13439-14-rosenp@gmail.com>
References: <20260611035245.13439-14-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 04:07:37 +0000
Message-Id: <20260611040738.62FF11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Diagnostic print incorrectly evaluates negative error codes, pre=
venting fallback to the controller IRQ.

Pre-existing issues:
- [High] The driver does not kill the channel tasklet before freeing the ch=
annel structure, risking a use-after-free.
- [High] The return value of dma_async_device_register() is ignored.
--

commit b6458c2f1ed9edcf2ad0905771c28bd59e93cd71
Author: Rosen Penev <rosenp@gmail.com>
Subject: dmaengine: fsldma: replace irq_of_parse_and_map with of_irq_get

This commit replaces irq_of_parse_and_map() with of_irq_get() in the fsldma
driver. It also modifies the error handling in fsldma_request_irqs() to
properly propagate negative error codes, such as -EPROBE_DEFER, instead of
just checking for zero.

> diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
> index 22d62d958abd9..b2259f8f69ab9 100644
> --- a/drivers/dma/fsldma.c
> +++ b/drivers/dma/fsldma.c

[ ... ]

> @@ -1185,7 +1191,7 @@ static int fsl_dma_chan_probe(struct fsldma_device =
*fdev,
>  	dma_cookie_init(&chan->common);
> =20
>  	/* find the IRQ line, if it exists in the device tree */
> -	chan->irq =3D irq_of_parse_and_map(node, 0);
> +	chan->irq =3D of_irq_get(node, 0);
> =20
>  	/* Add the channel to DMA device channel list */
>  	list_add_tail(&chan->common.device_node, &fdev->common.channels);
> =20
>  	dev_info(fdev->dev, "#%d (%s), irq %d\n", chan->id, compatible,
>  		 chan->irq ? chan->irq : fdev->irq);

[Severity: Medium]
Since chan->irq can now be a negative error code on failure, will the terna=
ry
operator (chan->irq ? ...) evaluate to true? If so, does this mean the driv=
er
will print the negative error code instead of falling back to the controlle=
r's
IRQ (fdev->irq) in the kernel log?

[Severity: High]
This is a pre-existing issue and was not introduced by this patch, but
should the driver kill the channel tasklet before freeing the channel
structure?

drivers/dma/fsldma.c:fsl_dma_chan_remove() {
	irq_dispose_mapping(chan->irq);
	list_del(&chan->common.device_node);
	iounmap(chan->regs);
	kfree(chan);
}

The driver schedules chan->tasklet in its interrupt handler, but during
device removal or probe error unwinding, fsl_dma_chan_remove() unmaps
I/O and frees chan without calling tasklet_kill(&chan->tasklet). Could
a tasklet scheduled just before teardown execute after chan has been
freed, causing a use-after-free?

[Severity: High]
This is a pre-existing issue and was not introduced by this patch, but
is it safe to ignore the return value of dma_async_device_register()?

drivers/dma/fsldma.c:fsldma_of_probe() {
    ...
	err =3D fsldma_request_irqs(fdev);
	if (err) {
		dev_err(fdev->dev, "unable to request IRQs\n");
		goto out_free_fdev;
	}

	dma_async_device_register(&fdev->common);
	return 0;

out_free_fdev:
    ...
}

If registration fails (e.g., due to memory allocation failure or
validation issues), fsldma_of_probe() will still return 0 (success).
This leaves the driver bound to an unregistered DMA device. When the
device is later removed, dma_async_device_unregister() will be called
on it, which might lead to undefined behavior.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611035245.1343=
9-14-rosenp@gmail.com?part=3D1
