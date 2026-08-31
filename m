Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4236B3CBE84
	for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 09:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170323; cv=none; b=kjDoBTGGG6M+hGolXkVGnjqbXwirAD1SHDBIJutpGIX/d0MkTt1mS8+xk84d6vvBKUk02Y6Sfqy7j+9IAA3U6lfH/pL0eMK8rydHXa8ljCiX3Onlb0PMPzuzmAoJCDin9SqOzIaYc+B0hK9aSv6Qxdy9YVF4mz4hrfz3djCNbGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170323; c=relaxed/simple;
	bh=H2/yG5AMlJokpYlOwfDlXVwEjxrqJxcSALBOMXOl8eo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qooHR0AhLaFJxKeUZ50t2OBKcFJVXoRyBb1ckMoRbIf69GBgtQ537QlddXaQQvOnvmBNE43PvyJFoPANqS6ECKW4F0DXreGzeKQt91Ud3ccu21UEIhI/fZm+XTMz18gEsnTCsrjmdU2vb/KIfAQOuIM908xkLlssIERcAaWyM7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIsntAp1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIsntAp1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64061F00A3D;
	Mon, 31 Aug 2026 09:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788170322;
	bh=7cS/VLBROAtM3ojRf/wqwWgLpZrXKhVSL8/7Zrrc6pA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XIsntAp10wxR6j6q4l1ogkqS26+B2LjoiHjiRej0WqVLdwg2yovjn+TA3ikKK6RL+
	 duyZtoAvfBpO+AzI627Lsa0F/vRITKa00qhV2+Yk/nxuXcX6hN14RHvorX5H1nCxSg
	 TGqfguB6NJ3nSlvY/NnPy/GxzCjlQBtEWQIGeTY+q2T5/UKooAYxtah9nXkCx6muGU
	 nXeBitvDx+gsk5KZQpNi0y+327D9Ajs3GfGgmTQ+yAf2VNDHMSSRFW+97E5V3TFfh3
	 BMpZnPfIlxhgiX5v8ODhMAj0G0jCvxQayYzMfdlEqAgP5a7E1M2TdqSixot8PEASn7
	 EZ4bN6f9E5c+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: dw-axi-dmac: fix cfgr_clk leak when core_clk
 enable fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Li Youhong" <dayou5941@163.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260831094438.2244538-1-dayou5941@163.com>
References: <20260831094438.2244538-1-dayou5941@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 09:58:41 +0000
Message-Id: <20260831095841.B64061F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Probe error paths in `dw_probe()` fail to properly unwind PM runti=
me usage counts, suspend hardware, disable clocks, and kill tasklets.
- [High] `dw_remove()` manually manages clocks without considering PM runti=
me state, ignores return values, and permanently leaks clocks.
- [High] Premature registration of a shared IRQ handler exposes uninitializ=
ed spinlocks and disabled clocks to asynchronous execution.
- [High] `axi_req_irqs()` silently fails to handle negative error codes fro=
m `platform_irq_count()`, turning probe deferral into a permanent functiona=
l failure.
- [High] `axi_req_irqs()` causes an out-of-bounds heap write if the Device =
Tree provides more interrupts than `DMAC_MAX_CHANNELS`.
- [High] Manual removal of channels from the DMA device list in `dw_remove(=
)` permanently leaks sysfs entries and percpu memory.
--

commit e8b14e92b204535fe4c9b4b46beb8535c9f3137d
Author: Li Youhong <liyouhong@kylinos.cn>

dmaengine: dw-axi-dmac: fix cfgr_clk leak when core_clk enable fails

This commit modifies axi_dma_resume() to fix a clock leak. If enabling core=
_clk
fails, it now disables cfgr_clk on the error path before returning.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index eebed2474210d..6ccb3fcfa3972 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -1335,8 +1335,10 @@ static int axi_dma_resume(struct axi_dma_chip *chi=
p)
>  		return ret;
> =20
>  	ret =3D clk_prepare_enable(chip->core_clk);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		clk_disable_unprepare(chip->cfgr_clk);
>  		return ret;
> +	}
> =20
>  	axi_dma_enable(chip);
>  	axi_dma_irq_enable(chip);

[Severity: High]
This isn't a bug introduced by this patch, but looking at dw_probe(),=20
there are multiple error paths that appear to leak resources when failing:

	pm_runtime_get_noresume(chip->dev);
	ret =3D axi_dma_resume(chip);
	if (ret < 0)
		goto err_pm_disable;

When axi_dma_resume() fails, the goto bypasses pm_runtime_put_noidle(),
which permanently leaks the PM runtime usage counter.

Additionally, if dmaenginem_async_device_register() fails:

	pm_runtime_put(chip->dev);

	ret =3D dmaenginem_async_device_register(&dw->dma);
	if (ret)
		goto err_pm_disable;
...
err_pm_disable:
	pm_runtime_disable(chip->dev);

Since pm_runtime_put() schedules an async suspend, calling
pm_runtime_disable() immediately after cancels the pending suspend. This
leaves the hardware active and clocks permanently enabled. axi_dma_suspend()
and tasklet_kill() are also not called here. If an incoming interrupt fires
before the devm-managed IRQ is freed, could it schedule a tasklet that
executes after the channel memory has been freed by devres?

[Severity: High]
This is a pre-existing issue, but does dw_remove() properly manage
clocks and PM state?

static void dw_remove(struct platform_device *pdev)
{
...
	/* Enable clk before accessing to registers */
	clk_prepare_enable(chip->cfgr_clk);
	clk_prepare_enable(chip->core_clk);
...
	pm_runtime_disable(chip->dev);
	axi_dma_suspend(chip);
...

The return values for clk_prepare_enable() are ignored, which could cause a
synchronous bus error on subsequent register accesses if the clocks fail to
enable. Furthermore, if the device was already active with clocks enabled,
this blind increment raises the count to 2. The subsequent call to
axi_dma_suspend() decrements it back to 1, permanently leaking the clocks.

[Severity: High]
This is a pre-existing issue, but could the shared IRQ requested in dw_prob=
e()
fire too early?

	ret =3D axi_req_irqs(pdev, chip);
	if (ret)
		return ret;

	INIT_LIST_HEAD(&dw->dma.channels);

axi_req_irqs() requests the IRQ with IRQF_SHARED before vchan_init()
initializes the channel spinlocks and before axi_dma_resume() enables the
device clocks. If another device sharing the same IRQ line triggers an
interrupt during this window, dw_axi_dma_interrupt() will immediately execu=
te.
Will this cause it to read DMA registers without a clock and acquire
uninitialized spinlocks?

[Severity: High]
This is a pre-existing issue, but does axi_req_irqs() properly handle probe
deferral and negative error codes?

static int axi_req_irqs(struct platform_device *pdev, struct axi_dma_chip *=
chip)
{
	int irq_count =3D platform_irq_count(pdev);
	int ret;

	for (int i =3D 0; i < irq_count; i++) {

If platform_irq_count() returns a negative error code like -EPROBE_DEFER,
irq_count is negative. The loop condition i < irq_count evaluates to false
immediately, bypassing the loop. This silently hides the error and returns =
0,
resulting in a successful probe without any interrupts registered.

[Severity: High]
This is a pre-existing issue, but does axi_req_irqs() prevent an out-of-bou=
nds
write when processing the interrupts?

	for (int i =3D 0; i < irq_count; i++) {
		chip->irq[i] =3D platform_get_irq(pdev, i);

chip->irq is a statically sized array of DMAC_MAX_CHANNELS elements. If the
device tree provides more interrupts than DMAC_MAX_CHANNELS, won't this loop
overwrite memory past the end of the array?

[Severity: High]
This is a pre-existing issue, but does dw_remove() cause memory and sysfs
entry leaks by prematurely removing channels?

	list_for_each_entry_safe(chan, _chan, &dw->dma.channels,
				 vc.chan.device_node) {
		list_del(&chan->vc.chan.device_node);
		tasklet_kill(&chan->vc.task);
	}

By manually calling list_del() and emptying the list, the devres unregistra=
tion
callback (dmaenginem_async_device_unregister) will iterate over an empty li=
st.
Does this cause it to skip calling device_unregister() and free_percpu() for
the channels?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831094438.2244=
538-1-dayou5941@163.com?part=3D1
