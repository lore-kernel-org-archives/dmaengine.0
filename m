Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0A84749FF
	for <dmaengine@vger.kernel.org>; Tue, 18 Aug 2026 12:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787057563; cv=none; b=SlcjqwQUiR3wRP2v0HC6b+FNAWp+5DA6SI0VD5O5kyaiYNKY8QWEJXSjRXZ4R+LscBxUyct+JOWr7TS8FXdxN8AR44CfsMiGGAPpz/7kh8ntOtz0vX616hdqvQFu3lGU7TD38zYA017diBpFopy3/e38Ajfz+1MsXcu7rST8RpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787057563; c=relaxed/simple;
	bh=oTEgsdS3BWDIJ6mNWRIXYmuo2OSR1at3K9VGEDhVycg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I48oGL2B3VQCrjdcMN0YTFD4iXbYfXfzKeCt7bTMUvrg45VPuzeP0JNFuvLbmAs4gQPqEz+Yod/3h74m1Fj6NhcOZ3unvQTuIguYOAk4afZbH3Xnuqp5deRfRekkKi1FiFGOg6XZKISJDZ38fCaYR7o08rAgkGIVi22ext3Wjhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IpGs0HnA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IpGs0HnA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E431F000E9;
	Tue, 18 Aug 2026 12:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787057560;
	bh=98KPLXXHPTi8xR/nbL+9JUQ0RuhJsVOA4ejNHf+GXBc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IpGs0HnAVS3FJOE2dE9GwRBsreeg+dqW9uK2hkwfnoyWwfH4/JipnD6hnK9WbkULv
	 JSUnZyg7D+CZeqmoreuNqBfgilRu0X/ROr51Mn4A4gUZZVpF08ZnhLjTqseJVgBcck
	 wC/rTreNex/YDsxdPnbIYdYU/rH9bVab1lqZF+PII1wLRa/9m+pqk9Qw7ccVirvZOs
	 wW1I+isWNUaHTzzAQX2JtV5n1B0dee0TEUlEGXdx1a5o5SxK9ibW7jdHYE3beiiRjL
	 79FyoJ9x6eKOEykTXbyLse/2u8iqsa6n8DFE2tMeqZ++3+wYiHmYilp2vHf/mKEPgo
	 YnN8kuxQv5xEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dma: jz4780: handle clk_prepare_enable() failure in
 probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiawen Liu" <1298662399@qq.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <tencent_BE00B17EBF2A95EADD8B80203B745B9C7609@qq.com>
References: <tencent_BE00B17EBF2A95EADD8B80203B745B9C7609@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 12:52:39 +0000
Message-Id: <20260818125239.E4E431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect teardown ordering in `jz4780_dma_remove()`: `clk_disable=
_unprepare()` is called before `free_irq()`, which can lead to a bus fault.
- [High] The driver mixes devm-managed dmaengine registration with manual t=
eardown in `remove()`, causing the dmaengine to be unregistered after hardw=
are is disabled.
- [High] When descriptor setup fails, the driver erroneously frees the curr=
ently active descriptor instead of the newly allocated descriptor, causing =
memory leaks and a NULL pointer dereference.
- [High] Checking the status of a submitted but unissued transaction while =
the channel is idle causes a NULL pointer dereference.
--

--- Patch [1]: [PATCH] dma: jz4780: handle clk_prepare_enable() failure in =
probe ---
commit 15ac33e185449fe2ef9ed06622c4c9792fca2767
Author: jiawen <1298662399@qq.com>

dma: jz4780: handle clk_prepare_enable() failure in probe

jz4780_dma_probe() ignores the return value of clk_prepare_enable(). If
the clock fails to enable, the driver continues and may later attempt to
disable an unprepared clock on error paths, leading to unbalanced clock
operations. Check the return value and propagate the error immediately,
avoiding the erroneous cleanup.

> diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
> index 6070dfdb7114c..2547fa229a835 100644
> --- a/drivers/dma/dma-jz4780.c
> +++ b/drivers/dma/dma-jz4780.c
> @@ -903,7 +903,9 @@ static int jz4780_dma_probe(struct platform_device *p=
dev)
>  		return ret;
>  	}
> =20
> -	clk_prepare_enable(jzdma->clk);
> +	ret =3D clk_prepare_enable(jzdma->clk);
> +	if (ret)
> +		return ret;
> =20
>  	/* Property is optional, if it doesn't exist the value will remain 0. */
>  	of_property_read_u32_index(dev->of_node, "ingenic,reserved-channels",

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the probe
error handling, I noticed an issue with devm-managed dmaengine registration
mixed with manual teardown in jz4780_dma_remove().

probe() uses dmaenginem_async_device_register(), which defers unregistering
the DMA engine to the devres cleanup phase, occurring after remove() return=
s.

However, in jz4780_dma_remove(), the driver manually kills tasklets, frees =
the
IRQ, and disables the clock:

jz4780_dma_remove() {
    ...
	clk_disable_unprepare(jzdma->clk);
	free_irq(jzdma->irq, jzdma);

	for (i =3D 0; i < jzdma->soc_data->nb_channels; i++)
		tasklet_kill(&jzdma->chan[i].vchan.task);
    ...
}

Does this create a critical window where the DMA controller is still
registered and accessible to dmaengine clients, but its hardware is
shut down? If a client accesses the controller (e.g., via
dmaengine_terminate_all()) during this window, could it access
unclocked registers and cause a bus fault?

[Severity: High]
This is a pre-existing issue, but I also noticed a teardown ordering
problem in jz4780_dma_remove().

clk_disable_unprepare() is called before free_irq():

jz4780_dma_remove() {
    ...
	clk_disable_unprepare(jzdma->clk);
	free_irq(jzdma->irq, jzdma);
    ...
}

If a DMA interrupt fires or is pending after the driver calls
clk_disable_unprepare() but before free_irq() completes, the
jz4780_dma_irq_handler will execute and attempt to read the DMA
controller's registers. Could accessing these registers with the clock
disabled cause an imprecise abort or bus timeout?

[Severity: High]
This isn't a bug introduced by this patch, but I found a potential issue
when descriptor setup fails in jz4780_dma_prep_slave_sg() and
jz4780_dma_prep_dma_cyclic().

The error path frees the channel's active descriptor instead of the newly
allocated local desc:

jz4780_dma_prep_slave_sg() {
    ...
		if (err < 0) {
			jz4780_dma_desc_free(&jzchan->desc->vdesc);
			return NULL;
		}
    ...
}

jzchan->desc points to the currently executing transfer, not the newly
allocated desc. If the channel is idle, jzchan->desc is NULL, wouldn't
this lead to an immediate NULL pointer dereference? If active, could it
free a running descriptor (causing a use-after-free and DMA pool
corruption) while the newly allocated desc is leaked entirely?

[Severity: High]
This is a pre-existing issue, but checking the status of a submitted but
unissued transaction while the channel is idle appears to cause a NULL
pointer dereference in jz4780_dma_tx_status().

If a client driver submits a DMA transaction but has not yet called
dma_async_issue_pending(), the descriptor sits on vchan->desc_submitted.

If the client queries the status via dmaengine_tx_status(),
vchan_find_desc() returns NULL because it only searches the desc_issued
list. The code then evaluates:

jz4780_dma_tx_status() {
    ...
	} else if (cookie =3D=3D jzchan->desc->vdesc.tx.cookie) {
    ...
}

If the channel is idle, jzchan->desc is NULL. Could this fallback check
dereference jzchan->desc without verifying it is not NULL, leading to a
kernel panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_BE00B17EBF2=
A95EADD8B80203B745B9C7609@qq.com?part=3D1
