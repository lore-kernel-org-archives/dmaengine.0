Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AFC445AFB;
	Wed,  7 Oct 2026 10:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370553; cv=none; b=Is9DS5TsSIs76kXAeNOvf3vyMmm/QXb/X+3XC8rXERqnnYMGEJzSS+VssTc49f8XmVUakpk/sf4BpqHYTe+pjyyLzeLJHNxFHeLiWjIxJV94lgQCm21riIt3yDzE+nkMI2r8ZAk2fKgvSvPBAFQQ53DtVPFeZHqMOltFEL7tvak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370553; c=relaxed/simple;
	bh=I/am39Bh+IelP86Kvkx9Z2cX2onP1LoCjIEQ99g3z/w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=igNXRTfvsQvq6KfRSwPaHnqvpXKV2/Rnpxnfw3O+66qI5EeYUBMWUjYo/AVqNJ5DGGAo8qWJMG0RJe/j8c7NB1/u/H47w/8DKBexHpsXRe4BIHZCS2hCELI3Xl+8baBngYCXkqBdUolLLvp+OewwYkHAC+yMRya/5y/7E2wdUXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k6+KxbXM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k6+KxbXM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2702E1F0089B;
	Wed,  7 Oct 2026 10:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791370526;
	bh=3vpRsjpWxfB8ptXTd+086mRjAag6Y9FVuaPbEu7Nosw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k6+KxbXM4Z2RrSYUMvKPafipfjq24bc83Ft0QvNpq1SyoTLrnUqGyikquW/cogzB3
	 PyCKzc98R7EIZCjlsQ1N3H6lSWwqogt1KNxi/ftH37V1UJxknxAwR8MnR0BNvFs5Ft
	 oTvN7EkPhgUSRAhjETGAFTL7x5+8GOqH8FtBP1cc03HJzdPT/FP09+O7mgR+AM+7JF
	 IHnDc64onxOX0A7jIzEW8CW6L5nsL+I64Ws9MrsRaYkN0HemViDASzSHtFy4l8EnZR
	 KbNfmBrLfqxtT4uOwc8gmNRJ5U2LMVq2mDpiMPRLRs3BlQusphKyCs0utN3ENFa0Fj
	 CTv/XHbzMecgQ==
Message-ID: <sashiko-outbox-162889@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 12/20] dmaengine: ti: k3-udma: pin owning module
 while glue clients hold a udma_dev
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, vkoul@kernel.org, conor+dt@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261007102936.2402427-13-s-adivi@ti.com>
References: <20261007102936.2402427-1-s-adivi@ti.com>
 <20261007102936.2402427-13-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 10:55:25 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dmaengine: k3-udma: Use-After-Free in of_xudma_dev_get() due to ea=
rly put_device()
- [High] dmaengine: ti: UAF due to empty device release for devm-managed st=
ruct
--

commit e6a1539a79f1c7e4abab14f6ce986bc9198ba376
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma: pin owning module while glue clients hold a udma_dev

This commit modifies the k3-udma driver to pin the owning module when a glue
client obtains a udma_dev pointer. It sets the ddev.owner field, uses
try_module_get() in of_xudma_dev_get(), and introduces xudma_dev_put() to
release the module reference when a channel is released.

> diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
> index 70eaf7ee57e68..f9e2a1e1e0a50 100644
> --- a/drivers/dma/ti/k3-udma-glue.c
> +++ b/drivers/dma/ti/k3-udma-glue.c
> @@ -466,6 +466,9 @@ void k3_udma_glue_release_tx_chn(struct k3_udma_glue_=
tx_channel *tx_chn)
>  		device_unregister(&tx_chn->common.chan_dev);
>  		tx_chn->common.chan_dev.parent =3D NULL;
>  	}
> +
> +	if (!IS_ERR_OR_NULL(tx_chn->common.udmax))
> +		xudma_dev_put(tx_chn->common.udmax);

[Severity: High]
Does device_unregister() here cause a use-after-free regression because tx_=
chn
is a devm-managed structure with an empty release function?

When tx_chn is allocated with devm_kzalloc() in k3_udma_glue_request_tx_chn=
(),
its embedded chan_dev is registered. The device class release function
k3_udma_chan_dev_release() is deliberately empty because the structure is
devm-managed.

If unprivileged userspace holds an active reference to chan_dev's sysfs
directory (e.g., keeping a file descriptor open) during driver unbind, the
kobject remains alive after device_unregister() returns. Devres will then f=
ree
tx_chn. When userspace finally closes the file descriptor, kobject_put() wi=
ll
access the already-freed tx_chn memory.

Could this be fixed by managing the memory lifecycle through the kobject
release callback instead of devres?

[ ... ]

> diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-pr=
ivate.c
> index 44c097fff5ee6..d2501e074bcfb 100644
> --- a/drivers/dma/ti/k3-udma-private.c
> +++ b/drivers/dma/ti/k3-udma-private.c
> @@ -54,10 +54,26 @@ struct udma_dev *of_xudma_dev_get(struct device_node =
*np, const char *property)
>  		return ERR_PTR(-EPROBE_DEFER);
>  	}
> =20
> +	/*
> +	 * Callers keep using ud (via function pointers stored in it, e.g.
> +	 * ud->psil_pair) after this call returns, bypassing the dmaengine
> +	 * core's own try_module_get() protection. Pin the owning driver's
> +	 * module here so it can't be unloaded out from under a live glue
> +	 * client; xudma_dev_put() releases it.
> +	 */
> +	if (!try_module_get(ud->ddev.owner))

[Severity: High]
Can this code cause a use-after-free regression by dereferencing
ud->ddev.owner?

Looking at of_xudma_dev_get(), put_device(&pdev->dev) is called right before
this block:

drivers/dma/ti/k3-udma-private.c:of_xudma_dev_get() {
...
	ud =3D platform_get_drvdata(pdev);
	put_device(&pdev->dev);
	if (!ud) {
...
	}
...

If put_device() drops the final reference to the device (for example, due t=
o a
concurrent device removal or DT overlay teardown), the device is unregister=
ed
and its devres-managed memory, including the ud structure, could be freed
immediately.

Calling try_module_get(ud->ddev.owner) would then dereference a freed point=
er.
Should try_module_get() be called before put_device() to ensure ud remains
valid?

> +		return ERR_PTR(-ENODEV);
> +
>  	return ud;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007102936.2402=
427-1-s-adivi@ti.com?part=3D12
