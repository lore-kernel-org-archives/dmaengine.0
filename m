Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4751D413D69
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 22:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672971; cv=none; b=gY3Se7CoT3GyETF4T1cIqcbjgs6pZqm+IE3/3BeYWO9YdcSfrNYc99dCPoMJ+lC8SgRwIqsulNMco5pN8eVll9ppPcQvQ0TtlDpS6eyplqquMwr7p/vukOR3Nd3XOcL0gb3TymaKF73imTu7DJit1FY+HBKEjvTwVHPR16eT6w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672971; c=relaxed/simple;
	bh=9XePM3TkUlfXmIbdsJxwDWQ9fZUOi+HXY0nSgZpNBok=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oz8qzmmLe77XNgmr1nGwDrVEw/OkyDQMe7Fw4p7K/XaDJEuQXz7OSWLKrQBJa1h7jP4CAxkLRMSqeDez31dTAPa7M6XeYef/f7vcSebx8netmD/gc9tIxltU9sb+NjzYBw2dehoyFOrt24YD/Snm6qHK2m80yDTZwA4Zj0gBGzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TtvZYEy6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtvZYEy6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77961F00A3A;
	Tue, 21 Jul 2026 22:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784672970;
	bh=XAHLxwNLD1XuwI9amhfF/vozUvyUnK2i/xuG5rG2Ugg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TtvZYEy66qx7WXtARx9NTN0tMeKPMBbotf38V4iv/L1HNWfcqIlNEn+gW8+70NFd/
	 P/mttS92r6w9l484lAjuvp9k1FqEz35WB11OeEXnoWCBeD18yOR/XdpoG4xRpgcAqG
	 V7P4RDqABEaczzkhyRnYEiWWW5uh9vYh0Ike06D/17rXjXzqn3n++udnrvbCge1vf/
	 BumJHttQusp37Qq4pBuXxFkzCUny9fYBhSaBv8ZFu1vd3ove0ix4DNLDRZI/XImQhB
	 l6WiysUmDSU9PMo8V0gHZALFvWOAEiGdCVEbGEkPjyvOLRkUP5OS5sqWC0n6/fnSOL
	 FhWv52YGzSjmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv3] dmaengine: fsl_raid: check fsl_re_chan_probe() return
 value
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260721221807.664865-1-rosenp@gmail.com>
References: <20260721221807.664865-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 22:29:29 +0000
Message-Id: <20260721222929.C77961F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver fails to clean up requested IRQs, IRQ mappings, and pla=
tform devices on channel probe error paths and during driver removal, leadi=
ng to resource leaks and potential use-after-free crashes.
- [High] The driver initializes DMA channels but fails to actually add them=
 to the dma_device's channel list, preventing registration and rendering th=
e driver completely non-functional.
- [High] Failing to read the 'reg' property of a subsequent job queue node =
causes a direct return, permanently leaking all resources for successfully =
probed channels from earlier iterations.
- [High] The return value of `dma_async_device_register()` is ignored, whic=
h can lead to IDA double-free bugs and kernel crashes during driver removal=
 if registration fails.
- [High] Channel tasklets and DMA descriptor rings are freed before disabli=
ng the hardware and unregistering the DMA device, causing a use-after-free =
race condition during driver removal.
--

--- Patch [1]: [PATCHv3] dmaengine: fsl_raid: check fsl_re_chan_probe() ret=
urn value ---
commit 28b38bba753033b4ceec348d232f01622ff9794d
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: fsl_raid: check fsl_re_chan_probe() return value

This commit addresses an issue where fsl_re_probe() ignored the return
value of fsl_re_chan_probe(). By checking the return value and only
counting successfully probed channels, it prevents fsl_re_remove_chan()
from dereferencing a NULL pointer during device removal.

> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 99945845d8b5e..4c83cde7a7388 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -832,13 +832,30 @@ static int fsl_re_probe(struct platform_device *ofd=
ev)
>  		for_each_child_of_node(np, child) {

[Severity: High]
This isn't a bug introduced by this patch, but is there a resource leak if
multiple job queues are present and a subsequent one fails to probe?

Just above this loop in fsl_re_probe(), the driver iterates over job queue
nodes:

    rc =3D of_property_read_u32(np, "reg", &off);
    if (rc) {
        dev_err(dev, "Reg property not found in JQ node\n");
        return -ENODEV;
    }

If the driver successfully processes one job queue, and then encounters a
failure reading the "reg" property of the next node, it directly returns
-ENODEV.

Doesn't this bypass the cleanup logic for any channels that were
successfully probed during the earlier iterations?

>  			rc =3D of_device_is_compatible(child,
>  					     "fsl,raideng-v1.0-job-ring");
> +			if (!rc)
> +				continue;
> +
> +			if (ridx >=3D FSL_RE_MAX_CHANS) {
> +				dev_warn(dev,
> +					"too many job rings, max %d\n",
> +					FSL_RE_MAX_CHANS);
> +				of_node_put(child);
> +				goto done;
> +			}
> +
> +			rc =3D fsl_re_chan_probe(ofdev, child, ridx, off);

[Severity: High]
This isn't a bug introduced by this patch, but does the driver ever actually
link the initialized channels into the DMA device's channel list?

Looking at fsl_re_chan_probe(), it initializes the channel:

    chan->chan.device =3D dma_dev;
    chan->chan.private =3D chan;

But it appears to never call list_add_tail() to add the channel to
dma_dev->channels.

When dma_async_device_register() iterates over the channel list, won't it
see an empty list and register 0 channels, rendering the driver
non-functional?

>  			if (rc) {
> -				fsl_re_chan_probe(ofdev, child, ridx++, off);
> -				re_priv->total_chans++;
> +				dev_err(dev,
> +					"job ring %d probe failed: %d\n",
> +					ridx, rc);
> +				continue;
>  			}
> +			ridx++;
> +			re_priv->total_chans++;
>  		}
>  	}
> =20
> +done:
>  	dma_async_device_register(dma_dev);

[Severity: High]
This isn't a bug introduced by this patch, but should the return value of
dma_async_device_register() be checked here?

If registration fails (for example, due to memory allocation failure), the
driver remains bound but its DMA ID is freed internally by the DMA subsyste=
m.

Later, when the driver unbinds, fsl_re_remove() unconditionally calls
dma_async_device_unregister(), which will attempt to free the already-freed
IDA and decrement a zeroed kref.

Could this result in a kernel oops during removal?

> =20
>  	return 0;
>  }

[ ... ]

> @@ -866,7 +883,8 @@ static void fsl_re_remove(struct platform_device *ofd=
ev)
> =20
>  	/* Cleanup chan related memory areas */
>  	for (i =3D 0; i < re_priv->total_chans; i++)
> -		fsl_re_remove_chan(re_priv->re_jrs[i]);
> +		if (re_priv->re_jrs[i])
> +			fsl_re_remove_chan(re_priv->re_jrs[i]);

[Severity: High]
This isn't a bug introduced by this patch, but does the driver fail to clean
up requested IRQs and platform devices during removal?

Looking at fsl_re_remove_chan(), it only kills the tasklet and frees the DMA
pools:

static void fsl_re_remove_chan(struct fsl_re_chan *chan)
{
    tasklet_kill(&chan->irqtask);
    dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
                  chan->inb_phys_addr);
    ...
}

It doesn't seem to call free_irq(), irq_dispose_mapping(), or
of_platform_device_destroy(). The error path err_free inside
fsl_re_chan_probe() has the same behavior.

If the module is unloaded, wouldn't the interrupt remain active, potentially
causing a use-after-free in fsl_re_isr() if it fires?

> =20
>  	/* Unregister the driver */
>  	dma_async_device_unregister(&re_priv->dma_dev);

[Severity: High]
This isn't a bug introduced by this patch, but does the teardown order in
fsl_re_remove() cause a race condition?

The driver frees the channel DMA memory regions and kills the tasklets in
the loop above before it disables the hardware (via jr_command) and before
it calls dma_async_device_unregister().

If the DMA engine is actively processing rings when removal begins, could it
access the freed physical memory before the device is unregistered?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721221807.6648=
65-1-rosenp@gmail.com?part=3D1
