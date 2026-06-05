Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B2036F918
	for <dmaengine@vger.kernel.org>; Fri,  5 Jun 2026 22:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697604; cv=none; b=A01K7UyZkwG6t2MSW0/cxlFSRlimcPxXJ5r6i4qGLbQlRO5jOw0dzaDAzoMS+n3ExOuZGtftf2MB02ieTK1Tu00sUdzTz8jkX9lr0FR7r7fruWayy1vo9T6+6Gq3UusL3X1xkohsGUAuMws1Hn3VSS7b3pWg2nffJvqLQquR4vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697604; c=relaxed/simple;
	bh=Zi+xFmw2B8b0ZXz0pY3cUswjhl1K+LAraJKBrNqXhY0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sj82HwDiD8pe7cJ5vDG8PbeRkQMcTq1GXF4GqOKrgjbwUjFVhapCylN6XsZemH0iD45KFaZ9vh4yHd0/h9Ziz3mGklIljmNQLLdyY+kRPhmUQHA+iMjBMsjN+BugQZuQNzlgwzDuobL+MFsPmZ10oaojMyrsaUGDhIeOKwcxCwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ayrtXKvr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ayrtXKvr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AAB41F00898;
	Fri,  5 Jun 2026 22:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780697603;
	bh=BVlz12vF1RDV9prL+4BxZb1kG5qoNlE9ATv2txCEX7c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ayrtXKvrR05HXjhMSvWZyqRmJNuXn2Ho1P/iKSGCaLw8LQqWEjBfDndMsxLfCF9pN
	 haEsoVRk3ZAqSwW5H6ukDHVbFCvozVHa5ONIQvCAwsIOIY0GIK56pP9kFPPFGbVVca
	 DRDwsVzzQzfIXVcYDNALCMZE4V7g6uzmoIcqyhz30fxFHvh75al/MbHBHM63cHze1n
	 tZV6v427lM1w5NgWo5pV+6Ggn88+P7jPQwh7oFrAWzBFH2q0FFpBLdT9MD5n1XNS2R
	 8lRn1bZCKZG3rnsAs/wrYtuFpUZ9+f7jLO1a2p1o+I5+p88qH3s7KkhRy2PNC8t3ti
	 N4XVOKjxL2Lhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/10] dmaengine: fsldma: convert channel ioremap to
 devm_of_iomap
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260605220134.43295-8-rosenp@gmail.com>
References: <20260605220134.43295-8-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 22:13:22 +0000
Message-Id: <20260605221323.3AAB41F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing `irq_dispose_mapping()` for per-channel IRQs causes a mapp=
ing leak when a channel is removed.
- [High] Failure to propagate `-EPROBE_DEFER` and other negative error code=
s from `of_irq_get()`.
--

commit 6845fba6088aa0e893f716aacd6cf99383012ca1
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: fsldma: convert channel ioremap to devm_of_iomap

Replace of_iomap with devm_of_iomap for per-channel register
mappings. This eliminates the iounmap calls in both the probe
error path and fsl_dma_chan_remove, and simplifies the error
handling by returning directly on failure.

> diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
> index ee6e595c2972c..0d73ce3dbfe6a 100644
> --- a/drivers/dma/fsldma.c
> +++ b/drivers/dma/fsldma.c

[ ... ]

> @@ -1192,17 +1189,12 @@ static int fsl_dma_chan_probe(struct fsldma_devic=
e *fdev,
>  		 chan->irq ? chan->irq : fdev->irq);
> =20
>  	return 0;

[Severity: High]
Is there a failure to propagate -EPROBE_DEFER and other negative error codes
from of_irq_get() here?

The commit 'dmaengine: fsldma: replace irq_of_parse_and_map with of_irq_get'
switched to of_irq_get() specifically to handle negative error codes such as
-EPROBE_DEFER.

However, the error handling logic in fsldma_request_irqs() maps all values =
<=3D
0 to -ENODEV:

drivers/dma/fsldma.c:fsldma_request_irqs() {
	...
		if (chan->irq <=3D 0) {
			chan_err(chan, "interrupts property missing in device tree\n");
			return -ENODEV;
		}
	...
}

This forces negative error codes like -EPROBE_DEFER to become -ENODEV,
defeating the purpose of the migration by permanently aborting the probe
instead of deferring it.

> -
> -out_iounmap_regs:
> -	iounmap(chan->regs);
> -	return err;
>  }
> =20
>  static void fsl_dma_chan_remove(struct fsldma_chan *chan)
>  {
>  	tasklet_kill(&chan->tasklet);
>  	list_del(&chan->common.device_node);
> -	iounmap(chan->regs);

[Severity: High]
Are we leaking the IRQ mapping when removing the channel?

In an earlier patch in the series ('dmaengine: fsldma: convert to
platform_get_irq_optional()'), the call to irq_dispose_mapping(chan->irq) w=
as
removed from fsl_dma_chan_remove().

However, chan->irq is acquired using of_irq_get() (or previously
irq_of_parse_and_map()), which internally calls irq_create_of_mapping() and
allocates a mapping in the IRQ domain.

This mapping must be explicitly disposed of. Because the cleanup call was
removed and never re-introduced, the IRQ mapping is permanently leaked
whenever a DMA channel is removed or the driver unbinds.

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605220134.4329=
5-1-rosenp@gmail.com?part=3D7
