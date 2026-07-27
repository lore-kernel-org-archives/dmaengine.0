Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25FA3E51E6
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186557; cv=none; b=TYxqJ7z+h6VIISY4KjTxroV1oAL1s0l98ct2VISbOgZG163W+RH/3hIN6H7ZGT6TtC0HJamANwZAI2QVDPGlvdFqaAygKsXWvMLH3VIKaW7KYqbPQXhQ6fKC8wNSe6n/0edmLAitbpx5UAORXIN3+t3VgP+yszXf/0LMo94gmf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186557; c=relaxed/simple;
	bh=SAR+Ec1IbOGCxgJQwQ/3IdvazAlbmDjyoo0HXvwarbQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=puhXRlE1JcC0PhFnSorL5CZid6oKjOEe/ttQSmDLQH+urvBBXRB1vVLz5766feCgQrZXuNVw6EitF3jSsp3c48g9VYW06sWW2HA607YqH8yf5uDK2p3ytZNj0rPUaJ/5A/KVY614+r+Pl12FvOTsKYfMZItTNLAy2tlL/JEBSf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oo9SXrbK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oo9SXrbK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0871F00A3D;
	Mon, 27 Jul 2026 21:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186555;
	bh=N1GQJsrJLBU46nTvq5ciG1St0dFmqiDta2NJKTQmAhA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Oo9SXrbKzaXzbxYTKJ6mkYJ1ZMZ+X7Bu9/imzqAVo37LxVBVRv4xK67iLvOVALnM0
	 4Qq5NXpg1JYtkBn4RYbpvRny7XfbVqyW7/sXPHt9Qii7y7xsWQkSU8fcwF0Nxzp6n7
	 b2wE5LmBIOYSHQpS667fbL6MtWlyBiBEJI0yfTfD2zpwaeURvRxrxRgCp1UMHqpm70
	 Zj2DUg4PkUaiXkgceQge7ytESsoZEfn1wHmWIQRhbgUp1bB8fmysovb+pBwbSbB1Oi
	 roc2VTkV2KtxnuY59dIHP9JG13+v0CkpASgRmtaZ/ieTG8B35EdeB29pT1+0rlILBe
	 tmDK9eaXyOWZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 42/64] dmaengine: jz4780: kill vchan BH on teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <95741599738bb33731b9a1148fa2c7045a2fbdb2.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <95741599738bb33731b9a1148fa2c7045a2fbdb2.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:09:15 +0000
Message-Id: <20260727210915.6C0871F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Use-after-free and arbitrary physical memory corruption during=
 descriptor setup failure
- [High] Hardware teardown race in jz4780_dma_remove due to incorrect devre=
s ordering
- [High] NULL Pointer Dereference in jz4780_dma_tx_status
--

--- Patch [42]: [PATCH v2 42/64] dmaengine: jz4780: kill vchan BH on teardo=
wn ---
commit 80e35ad454b351671c271c48790a44cd6f63d096
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: jz4780: kill vchan BH on teardown

This commit updates virt-dma cleanup to use dma_chan_kill_bh() instead of
tasklet_kill().

> diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
> index 6070dfdb7114c..45c1096563e32 100644
> --- a/drivers/dma/dma-jz4780.c
> +++ b/drivers/dma/dma-jz4780.c
> @@ -1019,7 +1019,7 @@ static void jz4780_dma_remove(struct platform_devic=
e *pdev)
>  	free_irq(jzdma->irq, jzdma);
> =20
>  	for (i =3D 0; i < jzdma->soc_data->nb_channels; i++)
> -		tasklet_kill(&jzdma->chan[i].vchan.task);
> +		dma_chan_kill_bh(&jzdma->chan[i].vchan.chan);

[Severity: High]
This is a pre-existing issue, but does disabling the hardware clock here
before devres gets a chance to unregister the DMA device create a race
condition?

If an interrupt fires or a client accesses the DMA engine (for example,
calling dmaengine_terminate_all()) during or immediately after
jz4780_dma_remove(), it appears this would trigger a fatal MMIO fault
because the device clock is already disabled.

>  }
> =20
>  static const struct jz4780_dma_soc_data jz4740_dma_soc_data =3D {

[Severity: High]
This is a pre-existing issue, but is there a risk of a NULL pointer
dereference in jz4780_dma_tx_status() when a transfer isn't active?

drivers/dma/dma-jz4780.c:jz4780_dma_tx_status() {
    ...
	} else if (cookie =3D=3D jzchan->desc->vdesc.tx.cookie) {
    ...
}

If a client prepares and submits a descriptor, moving it to the desc_submit=
ted
list, and then polls its status before it is issued, vchan_find_desc()
would return NULL. If no transfer is active, jzchan->desc is NULL, which
seems to lead to an unguarded dereference in this branch.


[Severity: Critical]
This is a pre-existing issue, but could the error paths during descriptor
setup lead to a use-after-free and potential physical memory corruption?

drivers/dma/dma-jz4780.c:jz4780_dma_prep_slave_sg() {
    ...
			jz4780_dma_desc_free(&jzchan->desc->vdesc);
			return NULL;
    ...
}

If jz4780_dma_setup_hwdesc() fails, the error path frees jzchan->desc.
However, jzchan->desc appears to hold the currently active, running
descriptor rather than the newly allocated one. Does this free the running
descriptor while the DMA controller is still executing it? This pattern also
appears to exist in jz4780_dma_prep_dma_cyclic().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D42
