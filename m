Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A52437479
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387011; cv=none; b=VhcA1KM0sYkUySnT0mbhfNhoM8hwB2U5RrZJY2aas+V/GjPcG5aXia9UuL3IzC5Cem0lmMc/zCVEbPRYdCdSheqaNGpxpBve/hWY/VDpvnkfG9b0E3M4tiG3ybo1e8LOig4FZqXjwxjWGxCzRkaTdWiTLoJUzWA8Eda4+/kGfdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387011; c=relaxed/simple;
	bh=MQ3bPks5guTy0IYopYhgBP1U1N+HcDOxCSaYY9MEDRY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RIbUZRDRViDpZNE043dXI5sqladtsVS7x2yALtOBKzHOmoS+96hChUzCrqRtajKYJED6sHa9IJyrFiBCGLXzi9QL9ZwnuYGiPolZxhzAkH7MSvAikLn0Qd1yTFEjGkKzrZlqdmHrybxcb6BlFfEWhjwLxuNGHAGuUWFB7NlxFl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LE+BjYsp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LE+BjYsp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A93D1F000E9;
	Mon, 10 Aug 2026 18:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387009;
	bh=EcwBii+H+k9zFzBIcUJbxp6inVyMWqRK8y4jVDXQ1js=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LE+BjYsp16RXeM96fFFnypZTiKck3nL5GZJ1f7pN1skgYBvHfPVziyDXftiWsHk81
	 +1YD0WT1aCEBrnmFRYiLCwa6x0HY4AqtYK1VhIHQewCg9OJGzxTEEy7kCyo9f3hweA
	 GS1Qj13ap0ME0dSA1cWO6wIlV5dZhJAsGszgmNrrzVyVMP5Ax7nEQqYwuB+NQE3aYP
	 lU8N/UTcUnCIlkTYLratpfncIXKtETv9DS7n79wxALJGk1SgkyeVCfq7njGNhHlB7t
	 ifNaoSWbxns5NJHrKICYz9/mWuW7Po71lXDlXDT3p99YhiEAY4Z64WQGI5ZTnk0a/N
	 oyfpXirIBeJkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 16/34] dmaengine: ppc4xx: replace irq tasklet with
 dmaengine BH
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <476a24b72cd4aa6bf62b120fc80965830616331c.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <476a24b72cd4aa6bf62b120fc80965830616331c.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:36:48 +0000
Message-Id: <20260810183649.5A93D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free due to missing dmaengine_kill_bh() on the probe err=
or path.
- [High] Self-deadlock in the bottom-half callback when processing dependen=
t DMA transactions on the same channel.
--

--- Patch [16]: [PATCH v3 16/34] dmaengine: ppc4xx: replace irq tasklet wit=
h dmaengine BH ---
commit 4ccd13b8e7ec3566e05878b1ca91b9e88ad9043a
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: ppc4xx: replace irq tasklet with dmaengine BH

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> index 279a431ccae38..bc10c2b5dd12e 100644
> --- a/drivers/dma/ppc4xx/adma.c
> +++ b/drivers/dma/ppc4xx/adma.c
> @@ -1658,9 +1658,9 @@ static void __ppc440spe_adma_slot_cleanup(struct pp=
c440spe_adma_chan *chan)
>  /**
>   * ppc440spe_adma_tasklet - clean up watch-dog initiator
>   */
> -static void ppc440spe_adma_tasklet(struct tasklet_struct *t)
> +static void ppc440spe_adma_tasklet(struct dma_chan *c)
>  {
> -	struct ppc440spe_adma_chan *chan =3D from_tasklet(chan, t, irq_tasklet);
> +	struct ppc440spe_adma_chan *chan =3D to_ppc440spe_adma_chan(c);
> =20
>  	spin_lock_nested(&chan->lock, SINGLE_DEPTH_NESTING);
>  	__ppc440spe_adma_slot_cleanup(chan);

[Severity: High]
This is a pre-existing issue, but does this locking sequence cause a
self-deadlock when processing dependent transactions?

If the callback processes a dependent transaction targeting the same channe=
l,
dma_run_dependencies() will call the submit callback:

ppc440spe_adma_tasklet()
  spin_lock_nested(&chan->lock, ...)
  __ppc440spe_adma_slot_cleanup()
    ppc440spe_adma_run_tx_complete_actions()
      dma_run_dependencies()
        ppc440spe_adma_tx_submit()
          spin_lock_bh(&chan->lock)

Since the non-recursive spinlock is already held by this CPU, will this
immediately deadlock?

Should the lock be dropped prior to evaluating completion callbacks or
dependencies?

[ ... ]

> @@ -4137,7 +4137,7 @@ static int ppc440spe_adma_probe(struct platform_dev=
ice *ofdev)
>  	chan->common.device =3D &adev->common;
>  	dma_cookie_init(&chan->common);
>  	list_add_tail(&chan->common.device_node, &adev->common.channels);
> -	tasklet_setup(&chan->irq_tasklet, ppc440spe_adma_tasklet);
> +	dmaengine_init_bh(&chan->common, ppc440spe_adma_tasklet);

[Severity: High]
This isn't a bug introduced by this patch, but could this lead to a
use-after-free during probe failure?

If an early hardware interrupt fires during probe, ppc440spe_adma_eot_handl=
er()
will schedule this bottom half.

If a subsequent initialization step fails, the error path releases the
interrupt via free_irq(), but does not cancel the scheduled bottom half:

err_dev_reg:
	ppc440spe_adma_release_irqs(adev, chan);
err_irq:
...
err_page_alloc:
	kfree(chan);

If the bottom half executes after kfree(chan), will it access freed memory?

Should dmaengine_kill_bh() be added to the probe error path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786384168.gi=
t.allen.lkml@gmail.com?part=3D16
