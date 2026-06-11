Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5F9319601
	for <dmaengine@vger.kernel.org>; Thu, 11 Jun 2026 21:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781212943; cv=none; b=ZN5tmwml9n9Efi83ql6e+dDoP8YVFwa+AYdZROZfyCuZ3WYXpMvryE6H67aWi0izjrZ6I4+TqHRaS5Y8EqJqLpAqwL49hozrix0xiIk6Jmh8nMzn2UYEd1V1gFkl+V3Q8qgDcZYF816PgjRI8f6g2AopBbZAw8CKpZKwxNYwX9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781212943; c=relaxed/simple;
	bh=t4EQwdjitey3qVCz6kFAztpuU+xp1LJAHE5rYnJ+tzs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Kjr5Nv1Ujih/RaNjw8XNPrY6IJvgWd19/RkUf11Y+9kCC7uRmbb2VCskqDCrf3EBZqVYSs2R1yTiB+E0/doS/H/ZD6Iek9t0MbFq8uqOOP1ilRa8ZQYH8ttjc46WaZ5aHhXVWvq9dr1MTcCeKZn90vcB3f+qgo5gT5xOKF73bUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MeA2WIn/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MeA2WIn/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32591F00A3D;
	Thu, 11 Jun 2026 21:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781212942;
	bh=niRmbtG2iU2I+/MwHEuRdAVA6M9BgcYVzZn2a/8ZIyI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MeA2WIn/E5x3ZdlS7cp1Umn3GH9bJ12DMoy+lUkE3fp9U7XdFurJ4Ypzd8cHG9Kf1
	 kINDkHjyxhBwBxRBHMf+3xSgrkSoq7kHCoMygzcstmkLcbTNTsnHpqI7ed4ztR6u67
	 djANQ7IJbd7Ag2vXp9l5VIjyQxk7IJY8FY8Eapf94qR/NanxQg9mTfVYQNx/6AASnz
	 nGMBsotKZzOm+lrtnAfOc1fuYbbc57hcOdfaQ98YaZxuvjGhRk9lt300nvz2QRDXB7
	 tc4aGzBu2mVjy6YSkN0OGVxvk7qZCbzxKB7ztbfT6xlsZ87vhZhQOaQsLxGDSmEmk8
	 faCK4JKXQK7tg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2 7/9] dmaengine: mv_xor: use devm for dma pool and irq
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260611210721.81979-8-rosenp@gmail.com>
References: <20260611210721.81979-8-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 21:22:21 +0000
Message-Id: <20260611212221.F32591F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Resource lifecycle violation: calling irq_dispose_mapping() before=
 deferred devm_request_irq() cleanup leaks irqaction and risks interrupt st=
orms.

Pre-existing issues:
- [High] Missing tasklet_kill() during channel teardown leads to potential =
Use-After-Free.
--

commit 0b6db2f64d537fd27d8bdc62bf8f9fac24eb05c8
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: mv_xor: use devm for dma pool and irq
   =20
Replace dma_alloc_wc() with dmam_alloc_attrs() and request_irq() with
devm_request_irq(). This eliminates the need for manual cleanup of the dma
pool and irq in both the channel remove function and the channel add
error labels, removing the err_free_irq and err_free_dma labels entirely.

> diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> index 25ed61f1b0899..2176be478c86b 100644
> --- a/drivers/dma/mv_xor.c
> +++ b/drivers/dma/mv_xor.c

[ ... ]

> @@ -1025,8 +1023,6 @@ static int mv_xor_channel_remove(struct mv_xor_chan=
 *mv_chan)
>  		list_del(&chan->device_node);
>  	}
> =20
> -	free_irq(mv_chan->irq, mv_chan);
> -
>  	return 0;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but the driver never calls
tasklet_kill(&mv_chan->irq_tasklet) during device teardown here in
mv_xor_channel_remove().

If an interrupt fires and schedules the tasklet during a probe failure,
could the tasklet execute after devres has freed the mv_chan structure,
resulting in a Use-After-Free?

This risk might be exacerbated by removing the synchronous free_irq() call
here, which previously helped silence interrupts earlier in the teardown
process.

[ ... ]

> @@ -1138,14 +1134,14 @@ mv_xor_channel_add(struct mv_xor_device *xordev,
>  		ret =3D mv_chan_memcpy_self_test(mv_chan);
>  		dev_dbg(&pdev->dev, "memcpy self test returned %d\n", ret);
>  		if (ret)
> -			goto err_free_irq;
> +			goto err_unmap_dst;
>  	}

[Severity: High]
By deferring the interrupt teardown to devres, could this lead to an issue
where the IRQ mapping is disposed before devm can execute free_irq()?

Looking at mv_xor_probe() which calls mv_xor_channel_add(), if a channel
fails to add, it explicitly calls irq_dispose_mapping() on the error path:

drivers/dma/mv_xor.c:mv_xor_probe() {
    ...
    if (IS_ERR(chan)) {
        ret =3D PTR_ERR(chan);
        irq_dispose_mapping(irq);
        goto err_channel_add;
    }
    ...
}

It also disposes the mapping for previously successful channels during clea=
nup:

drivers/dma/mv_xor.c:mv_xor_probe() {
    ...
err_channel_add:
    for (i =3D 0; i < MV_XOR_MAX_CHANNELS; i++) {
        if (xordev->channels[i]) {
            mv_xor_channel_remove(xordev->channels[i]);
            if (pdev->dev.of_node)
                irq_dispose_mapping(xordev->channels[i]->irq);
        }
    }
    ...
}

Since devres runs after probe() completes, this destroys the IRQ descriptor
while the interrupt is still actively requested. When devres later invokes
free_irq(), it might fail to find the descriptor, resulting in a leak of
the irqaction structure.

Additionally, since the error path no longer calls free_irq() synchronously,
does this leave the interrupt unmasked during probe teardown, risking
interrupt storms?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611210721.8197=
9-8-rosenp@gmail.com?part=3D1
