Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EA83E51FF
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186651; cv=none; b=tvWtsKIrGbn3/IeyQ+Lry8EAeG9C2JdrUhIStoEhwhXCdytDnKeEdeJFyGff3kL/HAE3wfGcpwG9Q/b1YlITQ4Yd/3GuW1+d5I8bnNNhwv8JJoAXLOdnLPNQapyV6iW5GdipY69avsmd9V5Xo7UQjNkEEtvuwQtCD6jHH6VC1lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186651; c=relaxed/simple;
	bh=h7LGSqAChRGvJua2VCZK5bAUvnEe6+1sKbBQolAQHyk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aLZrfjt8uz7bNbT5J2XzeGzhVEGsJvcym6lneI/voVmNo1MkoMQYkkNhUdXaC2EEVJieBxDcmTLFo3C7K7+QnSeP1o0IiLNE6OYz8sRvpIsNMedldqZxozufZIELL3l0qO2Zv4DvjY49vcmcEeJQGBvGTQBVcevirSwG5xm7P2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HOK8rFmY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HOK8rFmY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B33C1F000E9;
	Mon, 27 Jul 2026 21:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186650;
	bh=oqHCQdzk8MJggZQI8S0VMVe1dB1gqzz0BBJHHUJJ7WA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HOK8rFmYZbxT1QEp/kzALRGelZo2fdKOR6hKZfdeXZOTePKJtKSAx/ayu/3ZCh2iI
	 jx6Ke/3pWYDtBRA/UjpyMwQqgzP7wadf4GgZq3XQ8OXpBbJX4rN0Pb6jYViZIZiuAZ
	 yLzea72TxM7s693gFklqqto+NNZ7Zptkl5aQhUXmZFPjva/8rbbx3FXEN+fT7A2D7N
	 oEtKQqOwo8Z/Dr0V88JUnUZA/2u3Uj5JepEl06E0j+nK3bODGj9HGhYF/JZLEPIghv
	 5pwX5IlNLEXh7iba0okOIMTv199EvCiXBd/dkye9fpJeNil5XDslq+ChNcOKYJdtKu
	 kTyEgB6BcOvQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 43/64] dmaengine: pxa_dma: kill vchan BH on teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <df261bff5e82b39bce1b6a93e7c0ffac21c33dd3.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <df261bff5e82b39bce1b6a93e7c0ffac21c33dd3.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:10:49 +0000
Message-Id: <20260727211050.0B33C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Prematurely deleting channels from `dmadev->channels` during drive=
r removal bypasses the dmaengine core's unregistration logic, permanently b=
reaking module reload.
- [High] Critical Use-After-Free vulnerability on driver unbind due to impr=
oper devres cleanup ordering and failure to quiesce the hardware.
- [High] Missing `of_dma_controller_free()` on driver removal leaves a dang=
ling pointer in the OF DMA list.
- [High] Potential Use-After-Free on the probe error path due to missing sy=
nchronization of bottom-half work.
--

--- Patch [43]: [PATCH v2 43/64] dmaengine: pxa_dma: kill vchan BH on teard=
own ---
commit 542f54f4e01925d8e48b9a9c649593d23bb50a91
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: pxa_dma: kill vchan BH on teardown

Use dma_chan_kill_bh() for virt-dma cleanup.

> diff --git a/drivers/dma/pxa_dma.c b/drivers/dma/pxa_dma.c
> index fa2ee0b3e09f8..d57e5e0c422cb 100644
> --- a/drivers/dma/pxa_dma.c
> +++ b/drivers/dma/pxa_dma.c
> @@ -1215,7 +1215,7 @@ static void pxad_free_channels(struct dma_device *d=
madev)
>  	list_for_each_entry_safe(c, cn, &dmadev->channels,
>  				 vc.chan.device_node) {
>  		list_del(&c->vc.chan.device_node);

[Severity: High]
This is a pre-existing issue, but does this premature list deletion bypass =
the
dmaengine core's unregistration logic?

In pxad_remove(), the driver calls pxad_free_channels(), which uses list_de=
l()
to manually remove each channel from dmadev->channels. The core framework's
dma_async_device_unregister() is executed subsequently as a devres action a=
nd
relies on traversing dmadev->channels to unregister each channel.

Because the list has been artificially emptied,
__dma_async_device_channel_unregister() is never invoked, skipping
device_unregister(), ida_free(), and free_percpu(). Will this leak sysfs
nodes (e.g., "dma0chan0") and cause permanent sysfs name collisions on
subsequent module loads?

> -		tasklet_kill(&c->vc.task);
> +		dma_chan_kill_bh(&c->vc.chan);
>  	}
>  }

[Severity: High]
This is a pre-existing issue, but is there a use-after-free vulnerability on
driver unbind due to improper devres cleanup ordering?

During initialization, pxad_init_phys() requests IRQs via devm_request_irq(=
),
and subsequently pxad_init_dmadev() allocates channel memory via
devm_kzalloc(). Because devres releases resources in reverse order, the cha=
nnel
memory is freed before the IRQ is released.

Since pxad_remove() fails to mask interrupts or explicitly stop the DMA
hardware, if the hardware asserts an interrupt during this window:

drivers/dma/pxa_dma.c:pxad_chan_handler() {
    ...
    struct pxad_chan *chan =3D phy->vchan;
    ...
    spin_lock(&chan->vc.lock);
    ...
}

Will this dereference the already freed phy->vchan pointer and attempt to
acquire a freed spinlock if an interrupt fires during teardown?

[Severity: High]
This is also a pre-existing issue, but does driver removal leave a dangling
pointer in the OF DMA list?

In pxad_probe(), the driver registers its DMA controller using
of_dma_controller_register(), adding an of_dma structure to the global
of_dma_list. However, neither pxad_remove() nor any error path calls
of_dma_controller_free().

When the driver is unbound, will the of_dma structure remain in the global
list, containing pointers to the freed pdev memory and the unloaded
pxad_dma_xlate code, leading to a use-after-free if subsequent DMA requests
from other devices traverse the DT?

[Severity: High]
This is a pre-existing issue, but is there a potential use-after-free on the
probe error path due to missing synchronization of bottom-half work?

In pxad_probe(), if of_dma_controller_register() fails, the function returns
an error without flushing bottom-half work:

drivers/dma/pxa_dma.c:pxad_probe() {
    ...
    if (ret < 0) {
        dev_err(pdev->slave.dev,
                "of_dma_controller_register failed\n");
        return ret;
    }
    ...
}

Because dmaenginem_async_device_register() executes prior to this failure, =
the
DMA controller is briefly globally visible. If an external client requests a
channel and queues bh_work during this window, will the devres cleanup free
the channel memory before the asynchronous work executes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D43
