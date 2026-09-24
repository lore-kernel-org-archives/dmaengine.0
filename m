Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338704457A3
	for <dmaengine@vger.kernel.org>; Thu, 24 Sep 2026 09:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790241021; cv=none; b=nZ6p4YI/v07SRzCGNJdVVvQppEbsWXcXiHwMBHG/DI5V00tvpuBGhjkfuCl6xMf5A5OjllTkJMwG2dp9K0nNdvF/zgeY+Pp9hkbUGL+a9UheXbRtWYSEpVGsHQ+CwfhRJ+cQkh4ogznyfhu1yvMuImOjuXF6B+iR4o5c0KeFOIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790241021; c=relaxed/simple;
	bh=VBKmwpzl3VN5cEmKokfATAy4BQ8gFLCw/xRt0ztTGWE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hdQHuEI07nbHivUgc4T77pPAM45YzsDZ57SeNRdrPexXhlDUrLkXeUwluEDjscWTuV3zpPuTqW2slr3pjD/YgqWmV25GDrrEDHYgfJN6mETY+g4k9mlUE5/4PH8BT/Jyd94DVI9j2EpHc/d5CnFB+fBA2oHk5iJS1GFBtcuhLCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L2hSoeT/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L2hSoeT/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834221F00898;
	Thu, 24 Sep 2026 09:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790241019;
	bh=oAUq9pzRfpDJO0u/f0FvxdnYVzEf3eDzNROAPKIum7k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L2hSoeT/0hvrPy+FqJAg5V77pt5W9LY6kJh4NDNg/+UH4ZmvGn7JeL2SdJFKTKVK7
	 b/pjQDlSNmg9vCieXQXZUo7ep7v37NtntuyjLfXXj7wy3JjJSu9JAMhVoaL/DPUbkD
	 e1ScxfBMOjxlt4OUwYpvocav3Jg1U2ZcWsQ9oxEgZ6+j2nBS/tENAKyguevzvKieCC
	 R/OBxs692XL2lk6D+N+zJeheaXtgsrS9MD7qVsMz3IEQjJjh4NaMHHdU59kGtkKiGq
	 ZWwDtis24Bh5Wa8gT00Ttz2oboDvcruk/HLByeFyWRHsBsTEnviMp384GRyLQSfM3h
	 EaVVpQwFpO+Sw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 11/23] dmaengine: ste_dma40: Fix DMA registration
 unwind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260924-dma40-fixes-v6-11-fdb6755020a2@kernel.org>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
 <20260924-dma40-fixes-v6-11-fdb6755020a2@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 09:10:19 +0000
Message-Id: <20260924091019.834221F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: ste_dma40: tasklet UAF on devm_add_action_or_reset fail=
ure
--

commit 9ae706f948ab2a5c18bdce25be150382cc3a9c26
Author: Linus Walleij <linusw@kernel.org>

dmaengine: ste_dma40: Fix DMA registration unwind

This commit adds tasklet cleanup actions to the DMAengine registration devr=
es
group. It aims to ensure tasklets are drained before freeing probe resources
on registration failure.

Closes: https://lore.kernel.org/dmaengine/20260819225215.5EA2F1F000E9@smtp.=
kernel.org/

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 36f4cbd4da364..87b5f1d97ac23 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c

[ ... ]

> @@ -3088,6 +3100,11 @@ static int __init d40_dmaengine_init(struct d40_ba=
se *base,
> =20
>  	d40_ops_init(base, &base->dma_slave);
> =20
> +	err =3D devm_add_action_or_reset(base->dev, d40_kill_tasklets,
> +				       &base->dma_slave);
> +	if (err)
> +		goto exit;
> +

[Severity: High]
If devm_add_action_or_reset() fails here, it will immediately execute
d40_kill_tasklets(). Because the device interrupt was enabled earlier in
the probe routine via enable_irq(), could an interrupt fire immediately
after this premature cleanup and reschedule the tasklet?

>  	err =3D dmaenginem_async_device_register(&base->dma_slave);
> =20
>  	if (err) {

[ ... ]

> @@ -3852,20 +3881,33 @@ static int __init d40_probe(struct platform_devic=
e *pdev)

[ ... ]

>  	dev_info(base->dev, "initialized\n");
>  	return 0;
> =20
> + release_dmaenginem:
> +	if (irq_requested) {
> +		free_irq(base->irq, base);
> +		irq_requested =3D false;
> +	}
> +	devres_release_group(dev, dmaenginem_reg_group);

[Severity: High]
If we reach this error path because devm_add_action_or_reset() failed,
the tasklet cleanup action was never registered.

Since free_irq() is called here but there is no subsequent tasklet drain,
does this leave any tasklet that was rescheduled after the initial failure
still pending?

Could this result in a use-after-free when the tasklet executes on the
memory freed during the destroy_cache path?

>   destroy_cache:
>  	if (base->lcla_pool.dma_addr)
>  		dma_unmap_single(base->dev, base->lcla_pool.dma_addr,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-dma40-fixe=
s-v6-0-fdb6755020a2@kernel.org?part=3D11
