Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7123DA7D2
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 19:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789153240; cv=none; b=OmuetxvkdsUiboHm0KURFcZF2gLAWxaSOBf+LC4IKLM4xHpIrEoHjtYCbwpupouOsBfcYxJ9fYNrR12DjAKQl37ETPhpkEhy9i2M3zw/+urt850CajbwtwYOPcXtOeaDNjnzsWKhoIPA1SddokoqjIsjah+fIZqLM6knWIJj29s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789153240; c=relaxed/simple;
	bh=gRkqm0U6yPqCYa1PqsjbjW+dpCwhfqRGmILPimTZ0s8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iLvNTGBKu7f5zJt3yxmvdxtnVxm8etQo6sxMRgDrdEtr6ImQt2cdLloBuxDTm1OR4jVshD/fhoMr7ZHzYaUa0xV8XSxn+0xNbQ2w108u5ZAMrqQ4GoE2Tr+Ufa2Q9sz+xOwPJeQUfNXk7hx9lDaCzFok4qLqn9KchxYkBWWi3Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0zICqut; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0zICqut"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955201F000FF;
	Fri, 11 Sep 2026 19:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789153238;
	bh=kpk9qhbM5v3QJQQtgmssv5jVXaD7tuI9ZF/sc5fzC3g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R0zICqutmiduTRydo4O+Si/e7rRdb5sPyw62HwJfs5GsVpVubTIc9DFEI/d32+X58
	 cBOT8RMOUjAUFd3z8llnTEJzFhL+7NjCLRMUO6ZodXsyvDNH9ifVBtHPHL+IoxgQgx
	 fVcvEcWidkORpYmApMhm8/yH8brLZhPj4/UkIoDhXgBmGRg4xArxK2Kx8jLdjbc2sS
	 AHlEcXAIas4bhC/fQUDMZcH6/LKMDFDd9wHiIEZYrXk8KAfZn3kmg7BlMmQ1ms/Nc/
	 iiXfzjfHbOeEIksUWim9d4L4AMfrZ19fhEOUs4gWgZ3CyAWdzChRnG15Zbp7RnPs00
	 w5CLykv70yAEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: stm32-dma3: disable the active clock on
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Myeonghun Pak" <mhun512@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260911184841.34222-1-mhun512@gmail.com>
References: <20260911184841.34222-1-mhun512@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 19:00:38 +0000
Message-Id: <20260911190038.955201F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Devres sequence inversion explicitly disables the active clock in =
`remove()` before the DMA device is unregistered, creating a race where cli=
ents can access unclocked hardware.

Pre-existing issues:
- [High] IRQ handler accesses hardware registers without runtime PM protect=
ion, risking a crash if the device is suspended concurrently.
- [High] Missing tasklet_kill() for vchan tasklets causes Use-After-Free an=
d hardware races during device removal.
--

commit 267d53077eeb3e6ecf120df2e24f7e2dab91c06d
Author: Myeonghun Pak <mhun512@gmail.com>

dmaengine: stm32-dma3: disable the active clock on removal

Probe enables the controller clock and runtime suspend disables it.
The remove callback only disables runtime PM, which does not itself
invoke runtime suspend. If the controller is still active, its clock
prepare and enable references therefore remain held after removal.

> diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma=
3.c
> index 4724e7fa0008e..b4d68be5a46b8 100644
> --- a/drivers/dma/stm32/stm32-dma3.c
> +++ b/drivers/dma/stm32/stm32-dma3.c
> @@ -1926,7 +1926,21 @@ static int stm32_dma3_probe(struct platform_device=
 *pdev)
> =20
>  static void stm32_dma3_remove(struct platform_device *pdev)
>  {
> +	struct stm32_dma3_ddata *ddata =3D platform_get_drvdata(pdev);
> +	struct dma_chan *c;
> +
> +	of_dma_controller_free(pdev->dev.of_node);
>  	pm_runtime_disable(&pdev->dev);

[Severity: High]
This isn't a bug introduced by this patch, but can the interrupt handler
stm32_dma3_chan_irq() access unclocked hardware registers if a client
releases a channel concurrently?

The interrupt handler directly reads STM32_DMA3_MISR without acquiring a
runtime PM reference to guarantee the device is powered.

If a client releases a channel, stm32_dma3_free_chan_resources() executes,
dropping the channel lock and calling pm_runtime_put_sync(), which
synchronously suspends the device and disables its clock.

If an interrupt fires just before the lock is acquired in
stm32_dma3_free_chan_resources(), the handler spins. Once the lock is relea=
sed,
the handler proceeds to read the register concurrently with the clock being
disabled by pm_runtime_put_sync(), which can trigger a crash.

> +
> +	list_for_each_entry(c, &ddata->dma_dev.channels, device_node) {
> +		struct stm32_dma3_chan *chan =3D to_stm32_dma3_chan(c);
> +
> +		devm_free_irq(&pdev->dev, chan->irq, chan);

[Severity: High]
This is a pre-existing issue, but does this loop also need to kill pending
vchan tasklets to prevent use-after-free and hardware races?

Virt-dma channels schedule a tasklet (chan->vchan.task) to process asynchro=
nous
completions. If a tasklet was scheduled by an interrupt just before the IRQ=
 was
freed, it remains pending and will execute asynchronously after remove() re=
turns.

At that point, the clock is disabled by remove(), so any hardware access
initiated by the tasklet invoking client callbacks will crash the system. O=
nce
devres frees the channel structures, the running tasklet will also access f=
reed
memory.

> +	}
> +
> +	if (!pm_runtime_status_suspended(&pdev->dev))
> +		clk_disable_unprepare(ddata->clk);

[Severity: High]
Does disabling the clock here create a window where clients can access
unclocked hardware?

The driver registers the DMA device using dmaenginem_async_device_register(=
).
Devres-managed cleanup runs after stm32_dma3_remove() returns. By manually
disabling the controller clock here, there is a window where the DMA device
remains registered and exposed to clients, but its hardware clock is disabl=
ed.

If a client issues a transfer or releases a channel during this window, the
driver might attempt to read or write hardware registers, causing a crash.

> +	pm_runtime_set_suspended(&pdev->dev);
>  }
> =20
>  static int stm32_dma3_runtime_suspend(struct device *dev)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911184841.3422=
2-1-mhun512@gmail.com?part=3D1
