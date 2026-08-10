Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8623438009
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386937; cv=none; b=o2ME/MiM3NLJ0UQVi7uw150ClLOOgw/4CtVw4VseAGbPuOkhaFh7FkIvXYjMNN+/KL6/f1AsqUi+zf/DTv5cFLUAweA3iKZzf8Cq8kNegpNWAKbfZaZUsL7ENRqWwoN3v+Taq7gSbwOtSEh9Sza3UwTjdxNhGdEgcAqfGTBR+UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386937; c=relaxed/simple;
	bh=sJ+vrOTru9/gLJ+OcjJXYgHKX/FweeTZ+Ny6n3txC+I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jUyM+iyqWvA07z0ThzAxd0iSdpYXNodvfr8ITB4f9o7ZJCr3kvHxcVlRBpBtvfRufGzEmjqTGeSGj85GDpLvOV/hTv1OpuCepJjXTE6KT6aWagMtd8vwsZfeqhegZMUnmiA9Nbv8W1k5m7pAbF7U6Q8z+SjsJZ1bGiD5IkViBL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TMesU8fg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TMesU8fg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4011E1F000E9;
	Mon, 10 Aug 2026 18:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786386936;
	bh=7YwFaWIifUI6DeM5FK+ol+rd6Q2VPa2agh+gNN2Sfpo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TMesU8fglPTvM9w3nNhjG2OIrHRrUqm2DABWBKcL09Qe15CsHI+DomneQC+DSeR82
	 FwGUx72IqZJqxdvqR2wd+Q1ObLQ8YNChCp3W1rWSEMbQrTKUZ8ee+wIrtrgl0fzHAU
	 rJ+F16skVaCF6+XrhSUTyq26rbzbtuKbuHWUheEF2haOodqBZpboSHI62xYcwdcnz7
	 IJ44yTz71/IhazjkYdulWgM/i1LHEIt0fpyQNWzt2S35kAxnqkaNbk2qKCFlygOKE3
	 W6YuTkRPXbPzXZPhUelhgv4TQB+6QLJKBkqxvZ8/oiOdCK2Ays98LM5DXG59Q87ItO
	 YKi0kWQg84vDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 21/34] dmaengine: zynqmp-dma: switch completion
 tasklet to dmaengine BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <56dce14420ecdf8665c0e03b5f3a42004d33eadd.1786384169.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <56dce14420ecdf8665c0e03b5f3a42004d33eadd.1786384169.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:35:35 +0000
Message-Id: <20260810183536.4011E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Dropping the channel lock during list iteration allows concurr=
ent list modifications, leading to an infinite loop and severe memory corru=
ption.
- [High] Pre-existing PM runtime reference count leak in the probe error pa=
th.
--

--- Patch [21]: [PATCH v3 21/34] dmaengine: zynqmp-dma: switch completion t=
asklet to dmaengine BH ---
commit 31456cd82dd8bdc7d99216cfcc194b9aecb47fb3
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: zynqmp-dma: switch completion tasklet to dmaengine BH

This commit replaces the per-channel tasklet with the shared dmaengine BH
helper. The handler continues to run in softirq context while dmaengine
owns the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_=
dma.c
> index f6a812e49ddca..e396a35f0e0d5 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but I noticed a potential regression in the
probe error path.

In zynqmp_dma_probe(), if pm_runtime_resume_and_get() succeeds, it
increments the usage count. If a subsequent initialization step like
zynqmp_dma_chan_probe() fails, the execution jumps to err_disable_pm:

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_probe() {
    ...
	ret =3D pm_runtime_resume_and_get(zdev->dev);
    ...
	ret =3D zynqmp_dma_chan_probe(zdev, pdev);
	if (ret) {
		dev_err_probe(&pdev->dev, ret, "Probing channel failed\n");
		goto err_disable_pm;
	}
    ...
err_disable_pm:
	if (!pm_runtime_enabled(zdev->dev))
		zynqmp_dma_runtime_suspend(zdev->dev);
	pm_runtime_disable(zdev->dev);
	return ret;
}

Because pm_runtime_enabled(zdev->dev) is true, it skips calling
zynqmp_dma_runtime_suspend(zdev->dev). The function then calls
pm_runtime_disable() and returns the error.

Does this regression miss calling pm_runtime_put_noidle() to balance the
usage count or taking any action to power off the device?


[Severity: Critical]
This is a pre-existing issue, but I noticed a regression when iterating
over the done list.

In zynqmp_dma_chan_desc_cleanup(), the code iterates over chan->done_list
using list_for_each_entry_safe(). For each descriptor, it temporarily
drops chan->lock to invoke the client callback:

drivers/dma/xilinx/zynqmp_dma.c:zynqmp_dma_chan_desc_cleanup() {
    ...
	list_for_each_entry_safe(desc, next, &chan->done_list, node) {
		struct dmaengine_desc_callback cb;

		dmaengine_desc_get_callback(&desc->async_tx, &cb);
		if (dmaengine_desc_callback_valid(&cb)) {
			spin_unlock_irqrestore(&chan->lock, irqflags);
			dmaengine_desc_callback_invoke(&cb, NULL);
			spin_lock_irqsave(&chan->lock, irqflags);
		}
    ...
}

If a concurrent thread or the callback itself calls
dmaengine_terminate_all(), zynqmp_dma_free_descriptors() will execute.
This acquires the lock and unconditionally moves all descriptors from
done_list (including the cached next descriptor) to free_list.

When the callback completes, the loop resumes with desc =3D next. Because
next is now linked in free_list, the loop termination condition
&desc->node !=3D &chan->done_list will never be met.

Could this regression cause an infinite loop and arbitrary memory
corruption as it iterates off the end of free_list?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D21
