Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF22440A32
	for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 19:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789500002; cv=none; b=SDb6hlMPikIOZyen/5AZQFV9moW6qRbk9kK+ZA3czgWh+I1oW87VjeLCnN0DjHi45iVlGCEHSvUHhvcjtUejBbVrrKSN3CUGXGD7ise9Fy1MsxHV5KU94KKUJkQzjglMwsWZnpG71m/5zxfpttgztK1U2kMEMbCfn1kvOYzyW80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789500002; c=relaxed/simple;
	bh=bTdYFqmBgZYmVTKWKJgwtBhFAo2Aui8kU4HrMDmaEZg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JTCxAk/WbaQP3EmTNVSuqp/OJAjjf5cMUIVJYLOOgDNagzm+1xWHKMSz87rzWLTWMlem7g4Kb1fjlt/yWcBa6tR4P5aMLtwDIJrwfwKqz2PIdMnRZ7GrQ6Kz8uz9OgiWlhUat1tWxcQuWGKadDqFOnlr46T7CdL9fImYxGzr+I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EcvouOHu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EcvouOHu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E561F000FF;
	Tue, 15 Sep 2026 19:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789500000;
	bh=jS5YuHhXpsAoPbryYhKvxrcyKtVcuiJHXtVZCZgdos4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EcvouOHusmaP7hhhaCg4D9llJ00WSwsezsdldKpHx4jCh2ZWYTz++Sko9D45kLJ9B
	 AU/a7Qxt+QETagz1lYWMvaujrrqAovkA22R7CCFUHylhVscBtmNEAsBt06yRPeTlph
	 Y3I5H091smHJKDLEbftsZpspm00wEXTLysJwWoEWEsaPyLQxGjITnouOZgJmAjsKMB
	 TO1ZDX+bnKqF6IZtAiLiKlJL7ilMVvFGrQ0NfS32bLeRl7E2rKQTsv/tEb6T/CX6kD
	 D8gHuqxf78VS0QY7HezYwtAmKAdW5Pu9zWUWPVrcvkkNJXYs5/RvCSL1CMMNWFGDSx
	 vamc+jq/93MLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv5] dmaengine: fsl_raid: check fsl_re_chan_probe() return
 value
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260915190047.86218-1-rosenp@gmail.com>
References: <20260915190047.86218-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 19:19:59 +0000
Message-Id: <20260915192000.79E561F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: fsl_raid: orphaning partially probed channels causes UA=
F and leaks
--

commit ee451ab6878ff5841fcdf93363ca664a0b821373
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: fsl_raid: check fsl_re_chan_probe() return value
   =20
fsl_re_probe() ignores the return value of fsl_re_chan_probe() and
unconditionally increments total_chans. When a channel fails to probe
(for example, an IRQ mapping failure) its re_jrs[] slot is left NULL, yet
total_chans still advances, so fsl_re_remove_chan() later dereferences the
NULL pointer during device removal.

> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 2d86f61105e52..8c57250ecea6a 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -828,18 +828,27 @@ static int fsl_re_probe(struct platform_device *ofd=
ev)
>  		}
>  		/* Find out the Job Rings present under each JQ */
>  		for_each_child_of_node(np, child) {
> -			rc =3D of_device_is_compatible(child,
> -					     "fsl,raideng-v1.0-job-ring");
> +			if (ridx >=3D FSL_RE_MAX_CHANS) {
> +				dev_warn(dev, "too many job rings, max %d\n", FSL_RE_MAX_CHANS);
> +				of_node_put(child);
> +				break;
> +			}
> +
> +			rc =3D of_device_is_compatible(child, "fsl,raideng-v1.0-job-ring");
> +			if (!rc)
> +				continue;
> +
> +			rc =3D fsl_re_chan_probe(ofdev, child, ridx, off);
>  			if (rc) {
> -				fsl_re_chan_probe(ofdev, child, ridx++, off);
> -				re_priv->total_chans++;
> +				dev_err(dev, "job ring %d probe failed: %d\n", ridx, rc);
> +				continue;

[Severity: High]
Does this code risk orphaning a partially probed channel, leading to a
use-after-free?

If fsl_re_chan_probe() in drivers/dma/fsl_raid.c fails late during its
execution (for example, if a DMA pool allocation fails), it will have
already assigned:
re_priv->re_jrs[ridx] =3D chan;
and registered an IRQ handler and a tasklet.

By calling continue without incrementing ridx, the next loop iteration in
fsl_re_probe() will overwrite re_priv->re_jrs[ridx]. This leaves the
partially initialized channel orphaned, meaning its tasklet will not be
killed during driver teardown. When devres eventually frees the chan
structure, an active tasklet or IRQ will access the freed memory.

>  			}
> +			ridx++;
> +			re_priv->total_chans++;
>  		}
>  	}
> =20
> -	dma_async_device_register(dma_dev);
> -
> -	return 0;
> +	return dma_async_device_register(dma_dev);

[Severity: High]
This isn't a bug introduced by this patch, but does returning this error
code expose a use-after-free if dma_async_device_register() fails?

If dma_async_device_register() fails, fsl_re_probe() in drivers/dma/fsl_rai=
d.c
now returns the error code, which triggers devres cleanup and frees the chan
structures. However, since the driver allocates IRQs using the non-devm
request_irq() in fsl_re_chan_probe() and lacks an error unwinding path, the
IRQ handlers remain active. When a hardware interrupt fires after the probe
failure, the handler will access the freed chan memory.

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915190047.8621=
8-1-rosenp@gmail.com?part=3D1
