Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1683E5A1D;
	Mon, 27 Jul 2026 21:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186896; cv=none; b=jZ7O+FKtEZ0edzonreiCxHF2ODKvhmeXakAA27GO0TIgkXTV/TScCcgujNQQGey0weoaLxSnrHVCFWIwKjMGc0Zm43/VGVi6JVkYHtryOsAMwDUA0hJvqGYi5lKi8bDBFzgJIV//BNQqJvVeNdNtWQ6hlOlWTgMPlKVZa2xJDy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186896; c=relaxed/simple;
	bh=Gf7c3EiW/pt9IgXYND8PjS34jzBS9+kFvZ3RR5+cT8Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OXOyrG2C0jg4EwXl7nhYBIGCBmylhL94COxAti1uT+XymgvkT7GOnUt7gMIDUwI8Dhiq+le+VLtng+J7jCL2UwOUxF07/p6z6J1oD6ZHHJ3hq/pqVxDR4iLC8NF5P5I0hXniTNZfiS9yakAYqblLP1RtrV5fOmy0uR8L3txB1gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fjY9+J3G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fjY9+J3G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5E91F000E9;
	Mon, 27 Jul 2026 21:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186895;
	bh=Ln0RrUor0KbNXC7gE3sd3fRO+0oBq/OmpAGFQ5WFjmk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fjY9+J3GjbblUXZUmDpU11eQs+p5SOh9AF/V4c+Ook8EPYxEkVahagQ9xLHZXjTRH
	 n0C3IebFGFFlQcTrvF4cWkoRYIYmsicDjVlMD96jACJNJiKT9KeptyNTp9/BGFlO+V
	 AsUF9b1koMzWzdVHbbCP08ziGfAIF4aoZV+BmvkgWYKMQxJw1r+lkwJN1RzXLmTeHB
	 7k4BkOih47GK5RLDGaJDpoeWxMqyTgrGks5FQWA5v/a6DmDsQyoZzjzMCS9XxrR99w
	 MO20ThhcFXFM8sEDm5F7SRllWSHUD2XbxeFq3+GtlA0XdQUSpwU0XVj/XzsxyEPi2j
	 FBBxgJ0qPdJNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 39/64] dmaengine: fsl-edma-common: kill vchan BH on
 teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <b0bf2faa89ea57cfdd9da400bdacf41fae75a6f8.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <b0bf2faa89ea57cfdd9da400bdacf41fae75a6f8.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:14:54 +0000
Message-Id: <20260727211454.EC5E91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Bypassed DMA channel teardown leading to resource leaks and Us=
e-After-Free via dangling sysfs nodes.
--

--- Patch [39]: [PATCH v2 39/64] dmaengine: fsl-edma-common: kill vchan BH =
on teardown ---
commit 72f422b1de100bcd764808c0c9305bd937347a17
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: fsl-edma-common: kill vchan BH on teardown

This commit updates virt-dma cleanup to use dma_chan_kill_bh() instead of
tasklet_kill() when tearing down channels in fsl_edma_cleanup_vchan().

> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> index bb7531c456dfa..70b40e60c39a0 100644
> --- a/drivers/dma/fsl-edma-common.c
> +++ b/drivers/dma/fsl-edma-common.c
> @@ -915,7 +915,7 @@ void fsl_edma_cleanup_vchan(struct dma_device *dmadev)
>  	list_for_each_entry_safe(chan, _chan,
>  				&dmadev->channels, vchan.chan.device_node) {
>  		list_del(&chan->vchan.chan.device_node);

[Severity: Critical]
This is a pre-existing issue, but does unlinking the channel here bypass
the core DMA engine channel teardown?

During driver removal (for example, in fsl_edma_remove() or
mcf_edma_remove()), calling list_del() before dma_async_device_unregister()
means the core unregister function will see an empty dmadev->channels list.

If the channels are unlinked prematurely, dma_async_device_unregister()
skips __dma_async_device_channel_unregister() for all channels. Can this
leave dangling sysfs nodes active and leak resources like IDAs or percpu
memory, potentially leading to a use-after-free if devres subsequently
frees the underlying channel structures while the sysfs files remain
accessible?

(Note: This same unlinking pattern before unregister also appears to exist
in mtk_cqdma_remove() and sprd_dma_remove()).

> -		tasklet_kill(&chan->vchan.task);
> +		dma_chan_kill_bh(&chan->vchan.chan);
>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D39
