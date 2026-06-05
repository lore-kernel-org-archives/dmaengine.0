Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE281314D06
	for <dmaengine@vger.kernel.org>; Fri,  5 Jun 2026 22:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697711; cv=none; b=Y9fS3w16K1DAWxrgdm6XW9tqwrMS8sfG+iF8lWBlg6zqf2Tad5lAboLMrmO/aYd3nZAucNJWMh0rpLL+EgQcgku8j364A/CV5cy8v+ZBVwcTChnNaJ0uxH44bduRmlOynYZ4k+jcY+GSzOHMoqmQwqm78OTsiPJ3vJmAHulLdG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697711; c=relaxed/simple;
	bh=CC25I477E5gx/raook8grms/9PcBZM15S8sZGjm7MfM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DSTq2mNKl+ze/soiSz/BGnanR7UQ83yQwwXwBD4/jy1YT/M35nczsAcOdqO8YMWZko9uJdYfgW2bdzggfBoK53/n7SvqHpQla9ou+XqMYdVTYc30MuLK/3heqFWsKdKV+H1Vn9lj8sw0MF9wDVRFhhKhMJh7aWgzWC9NsEakG9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NgeovF74; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NgeovF74"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B61C1F00893;
	Fri,  5 Jun 2026 22:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780697710;
	bh=TE0Efr8TfiRQ/M+pND4vWkirWizfV0AF996f4WGWw6w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NgeovF74Zsy3L21r9zXkwNtyBn+rLNa2pg8VtXv/rG83ccn+ng9UZWBhMUWF/6wGY
	 05VFGr0VQ5858UVWRhoWa2q2eI5oaMwBynr5DhoSu0qaQAvfRtQVrVTDqGKfKs7EYQ
	 Vk2XZZtCqK5nZBcqYUNaM7w3V/K5EVNpvqZjoY0h21E4+Ska5UPhbT1tz1IOYJxM0X
	 3rYF5Rs3yg0UI2lClIaiEXG6rRueYkQyqNthhsgzivWC2l6FzYBM+xIMjyQ004godf
	 VGpWKXpZh8r44tzBe0lcBuoKEvsnHKAOESi08Z6sWUJIMRIK7FSehn9SJ0WwA6YglM
	 JHkoNRwW6TJcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/10] dmaengine: fsldma: convert channel allocation to
 devm_kzalloc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260605220134.43295-7-rosenp@gmail.com>
References: <20260605220134.43295-7-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 22:15:09 +0000
Message-Id: <20260605221510.3B61C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Permanent IRQ mapping leak due to missing `irq_dispose_mapping()=
` for channels.
--

commit 0a179f7b88544d88df0377a17f9feb95d32cd67e
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: fsldma: convert channel allocation to devm_kzalloc

This commit converts fsl_dma_chan_probe from using kzalloc_obj to
devm_kzalloc. It ties the channel lifetime to the parent DMA device and
removes the need for kfree in the probe error path and the remove function.

> diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
> --- a/drivers/dma/fsldma.c
> +++ b/drivers/dma/fsldma.c
[ ... ]
> @@ -1208,7 +1203,6 @@ static void fsl_dma_chan_remove(struct fsldma_chan =
*chan)
>  	tasklet_kill(&chan->tasklet);
>  	list_del(&chan->common.device_node);
>  	iounmap(chan->regs);
> -	kfree(chan);
>  }

[Severity: Medium]
Earlier in the patch series, the call to irq_dispose_mapping() for chan->irq
was removed from fsl_dma_chan_remove().

Although IRQ parsing is updated to use of_irq_get(), that function still
internally allocates an IRQ mapping via irq_create_of_mapping().

Without a matching irq_dispose_mapping() during teardown, does unbinding
the driver permanently leak the IRQ mapping for each channel?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605220134.4329=
5-1-rosenp@gmail.com?part=3D6
