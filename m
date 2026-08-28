Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA07A346A14
	for <dmaengine@vger.kernel.org>; Fri, 28 Aug 2026 16:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787936110; cv=none; b=X+y4NTAGbv28PFLg8On0K47LMgK1JdkA8fTBFEK/OH7YQer023j2Hen+5o6jfxEV+qFc9d80nh3WkyflpTFuD9IvxCE8YBZIf2r4VQQXSudLoFb9sANFri0fvXgmvb8iq6Brk6OCjb+OimAVcue0oPKH5rwdOB9ldfIXz1LDgsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787936110; c=relaxed/simple;
	bh=/NXePixh8InoJ31/01CjqG1Bi4OfzMCfNaDbpdOm6+o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KyeU2rVHKyfkgc0Q4z8VWj7BjWhoie6HcEKBnsmmuvizrhbrMgZICoSGxKPAQWo77cUyGFT7phQU3tBXe9xAR3vdHpQ4W+6pvFLdsitGoBU8dK6ts7HivVvzRiE1jhS/bIrur9pP3j4+I7SHcCu1BevFFtgTy/XJ9uRGPYTaTLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFS9m8pz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFS9m8pz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358CB1F000E9;
	Fri, 28 Aug 2026 16:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787936108;
	bh=7yY4qXlbHzT4AzVdSmAfyQMhn/UTbdGjd7zbyuUaJmg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XFS9m8pz3+TWo/WDvas25lHxkFueGq4dv7wCojjSeSDY/VhWyGnkfYm2L5gKOZ2dm
	 qkkyUoRIOeqYZjR5YMsqxsR5RQJnptnrH+k5rTmrifpS+i3+cdaLX6kCyw27fOHKz3
	 5pXla1XHcA8+JUg0aLLKNMCM2WBzlw7Cc1Brj2wfBBf4x/PNmI12zgBm09s/PQA7e5
	 Ts93nMMf4XkCeWBvLwkBkXRu0qI65++96YWAqOMPoaIrS4tVRKFZTmgH7TdPusXly7
	 PcnZZhRDBvViZuVAW9P4vlsr94EgxBsj5tuL0/yuKbuNp71SBKVgMKK3P9IVeJWpGR
	 KxDqeeR+SeYaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dmaengine: Allow drivers to assign static
 channel IDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Koichiro Den" <den@valinux.co.jp>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260828163611.2691264-2-den@valinux.co.jp>
References: <20260828163611.2691264-1-den@valinux.co.jp>
 <20260828163611.2691264-2-den@valinux.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 16:55:07 +0000
Message-Id: <20260828165508.358CB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect error handling for `device_register()` violates the driv=
er model API, leading to a memory leak of device internals and potential Us=
e-After-Free.
--

commit a264234e1c749394dbf84d5c9e286ff9f6d8a114
Author: Koichiro Den <den@valinux.co.jp>

dmaengine: Allow drivers to assign static channel IDs

The dmaengine core assigns channel IDs in registration order. Let a driver
request an exact channel ID before device registration. Reserve static IDs
through the existing IDA so they remain unique, while retaining automatic
IDA allocation as the default.

Link: https://lore.kernel.org/r/20260813063757.3131865-2-den@valinux.co.jp/
Link: https://lore.kernel.org/r/an4TXwT37vWYEzCn@SMW015318/

> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 6ffd8bd82154a..cc64a4679e6fa 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c

[ ... ]

> @@ -1089,11 +1090,13 @@ static int __dma_async_device_channel_register(st=
ruct dma_device *device,
>  		goto err_free_local;
>  	}
> =20
> -	/*
> -	 * When the chan_id is a negative value, we are dynamically adding
> -	 * the channel. Otherwise we are static enumerating.
> -	 */
> -	chan->chan_id =3D ida_alloc(&device->chan_ida, GFP_KERNEL);
> +	if (chan->chan_id & DMA_CHAN_ID_STATIC) {
> +		id =3D chan->chan_id & ~DMA_CHAN_ID_STATIC;
> +		chan->chan_id =3D ida_alloc_range(&device->chan_ida, id, id,
> +						GFP_KERNEL);
> +	} else {
> +		chan->chan_id =3D ida_alloc(&device->chan_ida, GFP_KERNEL);
> +	}
>  	if (chan->chan_id < 0) {
>  		pr_err("%s: unable to alloc ida for chan: %d\n",
>  		       __func__, chan->chan_id);

[Severity: High]
This isn't a bug introduced by this patch, but does this error handling
leak device internals and risk a use-after-free?

Looking at __dma_async_device_channel_register() further down in this
function, if device_register(&chan->dev->device) fails:

	rc =3D device_register(&chan->dev->device);
	if (rc)
		goto err_out_ida;
	...
 err_out_ida:
	ida_free(&device->chan_ida, chan->chan_id);
 err_free_dev:
	kfree(chan->dev);

When device_register() returns an error, the initial reference taken by
kobject_init() still needs to be dropped. Doesn't calling kfree(chan->dev)
directly skip the internal dev->p cleanup triggered by put_device(),
permanently leaking dev->p?

Also, if the failure occurs late in device_add() after sysfs files have
been exposed, userspace might have opened them. Could freeing the memory
directly while userspace holds a reference to the kobject result in a
use-after-free upon subsequent access?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828163611.2691=
264-1-den@valinux.co.jp?part=3D1
