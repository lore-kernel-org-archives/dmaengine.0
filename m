Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D393D88F7
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785185992; cv=none; b=ogbpFKCu+cctWeVFN9Ic/KQVNXfZ8RVtmNvHJc2lFuI2rECfPbanmZROFcdoZ+1xIoblz+aD5QUptLh85DYpbQGbo09Z0IrfPcRPvvlhIjjahzFYNzrHagCBgsvhfuc2STY7rW1aQXweUkziUPj190lOhqV4ncG/9APkxqJSAkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785185992; c=relaxed/simple;
	bh=YNCZRcjW8g7dmtHNsS1cUDhDxroAZPOeBDQon+GNOlU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gMpjmcPbHmF9mXObcsApP8gTlPnTicn7mSdrs3Gra6q4aV21fkFOV25b0FFlP9/iHPjgFCowbZXfM7Vx4nSMz3+SyQA8xeFMS62BspliHeDZd5Q69s9BSonwDu6q5HPQWfC4np1p6bgdMnHID1nroJ9SzlELEGJZqtcx+FokRBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5qnpTjm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5qnpTjm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230C11F00A3D;
	Mon, 27 Jul 2026 20:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785185991;
	bh=I0YGPVlz4V6NECdsQhqPwP2qyPViRm6wktERi6BXQx8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O5qnpTjm2Z8P3AdOw1D+R1T2L/HoqMpcuJzDftjbe573snGNd9MBCAXSOf1Zk18cJ
	 RTUv4Y1HkDi9ZyuC8aM4Yaky9wQJAkIP4ElpAgLhYsmigWrWingUVGoOSTBPeD5Ora
	 qj/bauxT2Zv7lqzn+dRFIjTF2DI/dbqgISorw8g5/SUlKnEE1Gq4066U5D5ZJpyvfM
	 9d8pKEsHFDeRW3FVrd3uzlNIF79Bamn9mczWzpIjqyvKpXX575VmmlNu0pRyWZqhLd
	 9kNyinE47Y04hwt/uWAKFfUPF6ipt+nTQRyU7bQPpi1yyzw2ihxGahEM6slcPsnNY7
	 NU8EZQ+HmLZSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 20/64] dmaengine: xilinx-dpdma: kill vchan BH on
 remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <8b19dea06fbd41cc1cd6425c20485614598747fd.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <8b19dea06fbd41cc1cd6425c20485614598747fd.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 20:59:50 +0000
Message-Id: <20260727205951.230C11F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Premature clock disable and delayed IRQ free expose the driver to =
synchronous external aborts during teardown and probe error paths.
- [High] Hardware registers are accessed during probe before the AXI clock =
is prepared and enabled.
- [High] Concurrent modification of virt-dma `desc_issued` list due to miss=
ing `chan->vchan.lock`.
--

--- Patch [20]: [PATCH v2 20/64] dmaengine: xilinx-dpdma: kill vchan BH on =
remove ---
commit b6ee3342e2955cfec74b9591a7918040bbe546f8
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: xilinx-dpdma: kill vchan BH on remove

virt-dma now dispatches completion callbacks through per-channel BH
work. Cancel that work when removing a channel, while retaining the
driver's separate error-handling tasklet.

> diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilin=
x_dpdma.c
> index d9a3542c4531c..2ec82064fd2ed 100644
> --- a/drivers/dma/xilinx/xilinx_dpdma.c
> +++ b/drivers/dma/xilinx/xilinx_dpdma.c
> @@ -1685,6 +1685,7 @@ static void xilinx_dpdma_chan_remove(struct xilinx_=
dpdma_chan *chan)
>  		return;
> =20
>  	tasklet_kill(&chan->err_task);
> +	dma_chan_kill_bh(&chan->vchan.chan);
>  	list_del(&chan->vchan.chan.device_node);
>  }

[Severity: High]
This is a pre-existing issue, but does the driver disable the clock too
early during teardown and probe error paths?

Looking at xilinx_dpdma_remove(), the AXI clock is disabled before calling
xilinx_dpdma_chan_remove() to kill the tasklets and BHs:

drivers/dma/xilinx/xilinx_dpdma.c:xilinx_dpdma_remove() {
...
	clk_disable_unprepare(xdev->axi_clk);

	for (i =3D 0; i < ARRAY_SIZE(xdev->chan); i++)
		xilinx_dpdma_chan_remove(xdev->chan[i]);
...
}

Similarly, in the xilinx_dpdma_probe() error path, the clock is disabled
before tasklets are killed and before the shared IRQ is freed:

drivers/dma/xilinx/xilinx_dpdma.c:xilinx_dpdma_probe() {
...
error_dma_async:
	clk_disable_unprepare(xdev->axi_clk);
error:
	for (i =3D 0; i < ARRAY_SIZE(xdev->chan); i++)
		xilinx_dpdma_chan_remove(xdev->chan[i]);

	free_irq(xdev->irq, xdev);
...
}

Could this cause synchronous external aborts if an active shared IRQ handle=
r,
tasklet, or BH attempts to access hardware registers while the clock is
disabled?

[Severity: High]
This is a pre-existing issue, but are hardware registers accessed during
probe before the AXI clock is prepared and enabled?

In xilinx_dpdma_probe(), dpdma_hw_init() is called early to disable
interrupts and clear statuses, which accesses hardware registers:

drivers/dma/xilinx/xilinx_dpdma.c:xilinx_dpdma_probe() {
...
	dpdma_hw_init(xdev);

	xdev->irq =3D platform_get_irq(pdev, 0);
...
}

However, the clock is enabled much later in the probe sequence:

drivers/dma/xilinx/xilinx_dpdma.c:xilinx_dpdma_probe() {
...
	ret =3D clk_prepare_enable(xdev->axi_clk);
	if (ret) {
...
}

Will this cause a synchronous external abort on device probe if the
bootloader hasn't already enabled the clock?

[Severity: High]
This is a pre-existing issue, but does xilinx_dpdma_chan_handle_err()
modify the virt-dma desc_issued list without the correct lock?

It appears to modify chan->vchan.desc_issued without holding
chan->vchan.lock:

drivers/dma/xilinx/xilinx_dpdma.c:xilinx_dpdma_chan_handle_err() {
...
	if (!chan->desc.pending &&
	    list_empty(&chan->vchan.desc_issued)) {
		active->error =3D true;
		list_add_tail(&active->vdesc.node,
			      &chan->vchan.desc_issued);
...
}

The virt-dma layer expects chan->vchan.lock to protect the desc_issued list,
as seen in xilinx_dpdma_terminate_all() where chan->vchan.lock is taken:

drivers/dma/xilinx/xilinx_dpdma.c:xilinx_dpdma_terminate_all() {
...
	spin_lock_irqsave(&chan->vchan.lock, flags);
	vchan_get_all_descriptors(&chan->vchan, &descriptors);
	spin_unlock_irqrestore(&chan->vchan.lock, flags);
...
}

Could this concurrent modification lead to linked list corruption if a
hardware channel error occurs while a client calls
dmaengine_terminate_async()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D20
