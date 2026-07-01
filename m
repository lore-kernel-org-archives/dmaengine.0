Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4F33F482D;
	Wed,  1 Jul 2026 09:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782898755; cv=none; b=jt2KKgAcnkRXtn9wkorxY29FyNv4sgZihEnFNQUIRBuRcUbr74ZogmYKoYvrG/r3KywGyrtD7msrvPe/aeE6c3K6rZBOZ2AR4JoITfPXldq/esxvyPmG0OfjpeLL48Rw9xve/tiUn959YAcA4Q4EgVUFexM22SbhkRlcIqhzBUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782898755; c=relaxed/simple;
	bh=W93f+t4Vn80OMpbdusuluMLHRIUrPWy0Dc8BLra/56E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oJOc+cnIfbrVbpTGDOhX6hR/+cRVPZwCn7azIQQz+oi6cpmfAIAYr+2746K8e+dZLM65jKQuYJExMO6+uIz0Qcx5hgzbyl5pqjzFXf0cQ1qyv2Qv+dr21QPApOTtV9iUn2vOg7B6GJc1Z6ul9VDTkwAiT8xpmgIzfwH2ezx14Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XysRCfLd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XysRCfLd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F11B1F000E9;
	Wed,  1 Jul 2026 09:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782898754;
	bh=+rCsQDn3Tc5CmoegcHXhp+OXlMYSIqvUFitheqB8XbQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XysRCfLdLQ/mlFFB0HhC9ufDYGgRmY78p7rFhNT6xWQ+1yifleIOwEyajVGvyl7ma
	 Tf9MmKyM3Q17GmgdM0tD628lo1shedAIlBHdb4DSrVHCJQv9/Cuwb12AisbhX3RMVQ
	 RcxXZL2whkvIsXAOV+OCR7VAi+py7bxUbs6BRKU/8oli13rZ4Kl84W/Fo/Hsj7eT5H
	 8crW/3FqWtg3TS1VPLIIVndyT7AugWDjrqemR63M0U4NAsug6UtabewGmY1A4htyPM
	 +4ZQBOnXZZ6Q9WUXkFCY/UUN3VdGmxDid7CVokhobDhgfV6gj5NrVWYmnhpPO2FnHn
	 CDnlFzzF5syFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/5] dmaengine: fsl-edma: convert DMAMUX clock
 handling to bulk clock API
Reply-To: sashiko-reviews@lists.linux.dev
To: joy.zou@oss.nxp.com
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260701-b4-edma-runtime-opt-v6-3-354ff4229c00@oss.nxp.com>
References: <20260701-b4-edma-runtime-opt-v6-0-354ff4229c00@oss.nxp.com>
 <20260701-b4-edma-runtime-opt-v6-3-354ff4229c00@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 09:39:13 +0000
Message-Id: <20260701093914.0F11B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Changing from `devm_clk_get_enabled` to `devm_clk_bulk_get_optiona=
l` silently ignores missing DMAMUX clocks, which were previously mandatory =
and can lead to synchronous bus errors.
--

commit 7885b2482d67d70ba7ccdebb1cd210d1f8dc8ba2
Author: Joy Zou <joy.zou@nxp.com>

dmaengine: fsl-edma: convert DMAMUX clock handling to bulk clock API

Convert the DMAMUX clock management from individual clock operations to the
bulk clock API to simplify the code. Prepare to add edma engine runtime pm
support.

> diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
> --- a/drivers/dma/fsl-edma-main.c
> +++ b/drivers/dma/fsl-edma-main.c
[ ... ]
> @@ -751,23 +750,37 @@ static int fsl_edma_probe(struct platform_device *p=
dev)
[ ... ]
> -		fsl_edma->muxclk[i] =3D devm_clk_get_enabled(&pdev->dev, clkname);
> -		if (IS_ERR(fsl_edma->muxclk[i]))
> -			return dev_err_probe(&pdev->dev,
> -					     PTR_ERR(fsl_edma->muxclk[i]),
> -					     "Missing DMAMUX block clock.\n");
> +		ret =3D devm_clk_bulk_get_optional(&pdev->dev, fsl_edma->drvdata->dmam=
uxs,
> +						 fsl_edma->muxclk);

[Severity: High]
Does this change to an optional clock fetch risk a synchronous bus error?

Previously, devm_clk_get_enabled() was used, which would fail probe if the
clock was missing. By switching to devm_clk_bulk_get_optional(), a missing
DMAMUX clock in the device tree will be silently ignored.

If the clocks are missing, devm_clk_bulk_get_optional() returns 0 and sets
the clock pointers to NULL. The subsequent clk_bulk_prepare_enable() call
will succeed safely. However, the driver will later unconditionally access =
the
unclocked DMAMUX registers:

drivers/dma/fsl-edma-common.c:fsl_edma_chan_mux() {
    ...
    if (fsl_chan->edma->drvdata->flags & FSL_EDMA_DRV_CONFIG32)
        mux_configure32(fsl_chan, muxaddr, ch_off, slot, enable);
    else
        mux_configure8(fsl_chan, muxaddr, ch_off, slot, enable);
    ...
}

Could this lead to a kernel panic when accessing the unclocked registers?
Should this use devm_clk_bulk_get() instead so probe correctly fails for
missing mandatory clocks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-b4-edma-ru=
ntime-opt-v6-0-354ff4229c00@oss.nxp.com?part=3D3
