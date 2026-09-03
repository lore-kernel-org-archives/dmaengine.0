Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B894B541B;
	Thu,  3 Sep 2026 14:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445339; cv=none; b=n6IFv0ZRox6s8SvazGNkrjtqNVQI+duxZVXOTlRWcBubxZRzLL/PHOk8r183ZLBj9q8scnRI0eN3Zh64xiLlI/cG2Yjx/IaO2JjLk6JAsVRPgluQAqqNCHVIZD7l1ihjriDqTecf3+7TJzn8PSyZIp9d1RqXyDxk3Sx/Fg5/aZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445339; c=relaxed/simple;
	bh=XeGA7IFu70Zy8Bz29wq4ctu5R0v98O27RSS9/I8XdJE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TrpaNf6/+R4v2Fpo/tLcR8S1cEoMfKO2fxLJGUY3Rq/DB8H2RNKlx3leVeIqiGafr6Zt7uJeYgrd23JbJ4OhpJRV/NsucenGkj1U1xvqF/i3rj5ozSUoVrA7cZ377sa275NnkBcq9XYazFeJrojn/mlVS608iPVIV0ZqO3Tvr74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KX1mA0x5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KX1mA0x5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D31461F000E9;
	Thu,  3 Sep 2026 14:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788445331;
	bh=KdD9Tw8Bq2XATFpgzPVQ8BAqD4i0QEMOICMFXAOz4Bo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KX1mA0x53BFevefQBgZyuUeSHH/3FGNfXHTtP5/4HJa/Mb04b1TiKJuJuFwxLjD1a
	 8PvURcmXBm4qEHKLCB+ze0fD9GC/FIPLkX9fqOwCqnFcWjFeZ2RQgRYQz8TNyj3NaT
	 BnNhOqCQlMfKWNezF9d5KU17zP7H+diTqDqy+MTNppLwuT9+QDJfpdFiMP8smc2PgN
	 CJlc2tmapqmkUMA2BHBF2Y9/0ephgi4I71+yqf7b8G2LrpmeOHTgfBr8hFWrhcBibq
	 jxHQYZBmlG455AI4zFYynWTH3TEgy/F4vt/uZe6R7M7EfZrWtoqLtYkO6Gte4iM49I
	 pIEF8tV2XQE/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] dmaengine: imx-sdma: Use __assign_bit() for
 ownership configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260903-dma-mask-v1-3-211ffd12c236@nxp.com>
References: <20260903-dma-mask-v1-0-211ffd12c236@nxp.com>
 <20260903-dma-mask-v1-3-211ffd12c236@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 14:22:10 +0000
Message-Id: <20260903142210.D31461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unsynchronized read-modify-write on global SDMA hardware registers=
 across multiple channels.
--

commit 4ddf0614a2ae2b19c08cb7e599c4ee441c688f95
Author: Peng Fan <peng.fan@nxp.com>

dmaengine: imx-sdma: Use __assign_bit() for ownership configuration

This commit refactors sdma_config_ownership() by replacing multiple
if/else blocks containing __set_bit() and __clear_bit() with single
calls to __assign_bit().

> diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> index 63261ab6402b9..da565409beaaa 100644
> --- a/drivers/dma/imx-sdma.c
> +++ b/drivers/dma/imx-sdma.c
> @@ -710,20 +710,9 @@ static int sdma_config_ownership(struct sdma_channel=
 *sdmac,
>  	mcu =3D readl_relaxed(sdma->regs + SDMA_H_HOSTOVR);
>  	dsp =3D readl_relaxed(sdma->regs + SDMA_H_DSPOVR);
> =20
> -	if (dsp_override)
> -		__clear_bit(channel, &dsp);
> -	else
> -		__set_bit(channel, &dsp);
> -
> -	if (event_override)
> -		__clear_bit(channel, &evt);
> -	else
> -		__set_bit(channel, &evt);
> -
> -	if (mcu_override)
> -		__clear_bit(channel, &mcu);
> -	else
> -		__set_bit(channel, &mcu);
> +	__assign_bit(channel, &dsp, !dsp_override);
> +	__assign_bit(channel, &evt, !event_override);
> +	__assign_bit(channel, &mcu, !mcu_override);
> =20
>  	writel_relaxed(evt, sdma->regs + SDMA_H_EVTOVR);
>  	writel_relaxed(mcu, sdma->regs + SDMA_H_HOSTOVR);

[Severity: High]
This isn't a bug introduced by this patch, but does this read-modify-write
sequence require an engine-wide lock?

If multiple DMA clients (such as serial or audio drivers) concurrently call
functions like dmaengine_slave_config() for different channels, could they
race while modifying the global SDMA_H_EVTOVR, SDMA_H_HOSTOVR, and
SDMA_H_DSPOVR hardware registers?

Since the registers are read into local variables, modified, and written ba=
ck
without serialization, could concurrent calls to sdma_config_ownership() ca=
use
one channel to inadvertently overwrite the configuration of another?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-dma-mask-v=
1-0-211ffd12c236@nxp.com?part=3D3
