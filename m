Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F7C3C3F7B
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187042; cv=none; b=lhVlkgDpFhbRo5A5P6jyvbyHQz8qaCSbzUvbsA4YGbGoMidG3EydZ2gdYhqKh3l2wqwrIWdpmjzAIYj5Jyl1ZQOVwJCN8kmT2NFH7VsfACKFiKtAnGQhTzKlGYA77ZT84DaFdMfMJ7/vEd54m+pvLak2XatjeFt2OBqqTOWKa6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187042; c=relaxed/simple;
	bh=rEQ6TP1t1S59Lu8WtIInCjUp3K3sFbPL1wqAc3ygj0Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WJ9JoZqEMA4Jf6sFZjvLTiVi6WUJkVMTuYuTlVkBUIld3DTbHgkao/OcAn1jnn96fB/H9QGXoHQ9wmWcc2xONDbUAiJARDp49T5CD03OTLFlSn1VZ6exxveZ1BuAanbwGwrpHJ/0QSGDZrUMoYa++XOxB3D8tlQhJkrsVYrBAdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+g+/jGa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+g+/jGa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332D31F000E9;
	Mon, 27 Jul 2026 21:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785187041;
	bh=LB1oejMlDPXlo1MiaIPMH3bC2dM1m2w0itGpQyXrWCo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e+g+/jGank0n+Tb3rofKcZ0ylQHesSpdfAddPYSizokDtwVP8ZoH2aWEbROm+GSDH
	 ZyKL53XHdRRsEZnxZVn7G0VH3cRE1hYbQTGXDagSvd18Q41LAD6FwMZ3AnB+D2EUZM
	 JykpxtFeqLyERmsEgOyKybKzHDe+IetZegpfnoh4V4Ca320gfu3ciFs28HHiNfzKYr
	 6VOw9vWzoe5Tm2gE7qADZiORddMuaVqoPXQV/tpSJiHH2VzcNa94jRn7XGtl/vMr+G
	 /Vfg1JSXRrrexGYMJ6b7hEhygvIVk5SpwlkAsaGi/D/Hz54Q4q84bIkmcocIsUJpbN
	 bkAoT4IBu5Ebw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 58/64] dmaengine: qcom-adm: use dma_chan_kill_bh
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <295b8a8c7e6a8e3da7a7eb1f632906569c5ab87a.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <295b8a8c7e6a8e3da7a7eb1f632906569c5ab87a.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:17:20 +0000
Message-Id: <20260727211721.332D31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Teardown race condition in adm_dma_remove() leading to use-after-f=
ree
- [High] Missing device_synchronize callback exposes DMA clients to use-aft=
er-free
--

--- Patch [58]: [PATCH v2 58/64] dmaengine: qcom-adm: use dma_chan_kill_bh =
---
commit be25e9ce5563c30843636df639280bce697e48d5
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: qcom-adm: use dma_chan_kill_bh

virt-dma now dispatches completion callbacks through per-channel BH
work instead of its tasklet. Cancel that work during teardown before
channel storage is released.

> diff --git a/drivers/dma/qcom/qcom_adm.c b/drivers/dma/qcom/qcom_adm.c
> index 07fbe32d31fa4..ea24e2de51544 100644
> --- a/drivers/dma/qcom/qcom_adm.c
> +++ b/drivers/dma/qcom/qcom_adm.c
> @@ -918,8 +918,8 @@ static void adm_dma_remove(struct platform_device *pd=
ev)
>  		/* mask IRQs for this channel/EE pair */
>  		writel(0, adev->regs + ADM_CH_RSLT_CONF(achan->id, adev->ee));
> =20
> -		tasklet_kill(&adev->channels[i].vc.task);
> -		adm_terminate_all(&adev->channels[i].vc.chan);
> +		dma_chan_kill_bh(&achan->vc.chan);

[Severity: High]
This is a pre-existing issue, but does this sequence leave a window for a
use-after-free?

If adm_dma_remove() calls dma_chan_kill_bh() before devm_free_irq()
synchronizes with the interrupt handler, a concurrent interrupt can still
fire:

cpu1
adm_dma_remove()
    writel(0, ...)
    dma_chan_kill_bh()

cpu2
adm_dma_irq()
    vchan_cookie_complete()
        dma_chan_schedule_bh()=20

Because cpu1 proceeds to devm_free_irq() which waits for the interrupt hand=
ler
to finish but does not flush the newly queued bottom-half work, the device
context is subsequently freed. The workqueue could then execute the schedul=
ed
bottom-half work on the freed memory.=20

Could devm_free_irq() be explicitly called before tearing down the channels?

[Severity: High]
This isn't a bug introduced by this patch, but does this driver also lack a
device_synchronize callback during its initialization in adm_dma_probe()?

When clients call dmaengine_terminate_sync() to abort transactions, it reli=
es
on device_synchronize (usually mapped to vchan_synchronize) to wait for
callbacks to complete.

Without it, dmaengine_terminate_sync() returns immediately, and clients may
free their buffers while the virt-dma bottom-half work is still executing.

Can this lead to a use-after-free in the client's completion callback?

> +		adm_terminate_all(&achan->vc.chan);
>  	}
> =20
>  	devm_free_irq(adev->dev, adev->irq, adev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D58
