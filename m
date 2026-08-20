Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BEE453A2B
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 13:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787232583; cv=none; b=K51fAdH2Isuaj0/4sN60CeHjCB9aF1V5Gq3oICil+O9UJGl89QM/rtc1gI4l0CSG8P0SFzFNpyU/QU/B0AQPOomxNPCiVqF6RvLwWDF5LfQXADnQZiDuapNaoyxVpkjRLLZVTupN/cvkyWcbfDsMlBgjj2itSNkRjj5SPNOxEhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787232583; c=relaxed/simple;
	bh=5XZ0/8d603AgDvgxfm8Q//4Gne1YBDZUmPXrWXyEA1I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rdl8bqQv3TykNFV5qSy/F4eyIBKTI7TLE+6e8Vq/v4+5/qJwvSASkz4FJIdLvC/22aKT9M9ml9nZAzoVWSyzglvBnougM7sKamNG0hRBA6IifLn/68t3FS0zd/iTra8hIuscfR2hjpbAWOLmGV4cxR/GDAGWfdhw08MmLEWP1NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IOwZlh8Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IOwZlh8Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019D71F00A3D;
	Thu, 20 Aug 2026 13:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787232582;
	bh=CIEY/fLYO7xaoSjUEipVqzZeENsq7SB5j+R0mI0WRLI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IOwZlh8ZQuU7JQ50teyIAssruUUHBoEXwv75eXa89gpfloCLYoFm28eDQYMGbYb0C
	 ysmu9/PQNeaVLh3fKcVhZb5XTSc44dn/4WziEN3PvpPqtjjvAJBYIM92cJeBUEe1SW
	 gOvCNFBvuWLmPQF4E8pRAAFSZjaw3bihR6ZMS5q7Lp/XwCx3kHANg/fy2bKa8t7o24
	 0nz3fPmOh5YXV02LIFo2nHhygdWV6Bg5n2HApaMG9hMUXy0AvNRn25zGK6OkRBiZYL
	 wmigXdt4cHHUFo4RDiMS73fBFvbdKAYvefILvwBMicFC9GuQ29O0yTpAKFdQPS/J6A
	 Y8k3Vv1htvW6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/13] dmaengine: ste_dma40: Fix probe runtime PM
 disable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260820-dma40-fixes-v2-7-63238334c707@kernel.org>
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
 <20260820-dma40-fixes-v2-7-63238334c707@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 13:29:41 +0000
Message-Id: <20260820132942.019D71F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] request_irq() is called before PM runtime is enabled, which can ca=
use an IRQ storm if an interrupt is pending.
- [High] The driver systematically ignores the return value of pm_runtime_g=
et_sync(), failing to handle resume errors.
--

--- Patch [7]: [PATCH v2 07/13] dmaengine: ste_dma40: Fix probe runtime PM =
disable ---
commit 95c55fe7afd321bc228d4b1a735de2f4eb7a79fc
Author: Linus Walleij <linusw@kernel.org>

dmaengine: ste_dma40: Fix probe runtime PM disable

This commit fixes an issue where some d40_probe() error paths disable
runtime PM even if it was never enabled for the device. It introduces a
boolean flag to track whether runtime PM was actually enabled, keeping the
disable_depth balanced during probe failures.

Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.=
kernel.org/

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 739e47941d0cc..0c9094b4c4ade 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
[ ... ]
> @@ -3633,6 +3634,7 @@ static int __init d40_probe(struct platform_device =
*pdev)
>  	pm_runtime_mark_last_busy(base->dev);
>  	pm_runtime_set_active(base->dev);
>  	pm_runtime_enable(base->dev);
> +	runtime_pm_enabled =3D true;

[Severity: High]
This is a pre-existing issue, but request_irq() is called before PM
runtime is enabled, which could cause an IRQ storm if an interrupt is
pending.

If an interrupt triggers before runtime PM is enabled, the ISR
d40_handle_interrupt() fails to clear it:

d40_handle_interrupt() {
    ...
    ret =3D pm_runtime_get_if_active(base->dev);
    if (ret <=3D 0)
        return IRQ_NONE;
    ...
}

Because pm_runtime_get_if_active() returns an error when runtime PM is
disabled, the handler returns IRQ_NONE without clearing the hardware
interrupt. This causes the interrupt to continually re-trigger.

Could the request_irq() call be moved after pm_runtime_enable() to
prevent this?

[Severity: High]
This is a pre-existing issue, but the driver systematically ignores the
return value of pm_runtime_get_sync().

If the device fails to resume due to PM subsystem issues or memory
pressure, does this cause the driver to access powered-off hardware
registers?

For example, in d40_queue_start():

d40_queue_start() {
    ...
    pm_runtime_get_sync(d40c->base->dev);
    /* hardware accesses follow */
    ...
}

Similar unchecked calls exist in d40_pause(), d40_resume(), and
d40_free_dma(). Could these be updated to check for negative error codes
and abort if the resume fails?

> =20
>  	dma_set_max_seg_size(base->dev, STEDMA40_MAX_SEG_SIZE);
> =20
> @@ -3678,7 +3680,8 @@ static int __init d40_probe(struct platform_device =
*pdev)
>  		regulator_disable(base->lcpa_regulator);
>  		regulator_put(base->lcpa_regulator);
>  	}
> -	pm_runtime_disable(base->dev);
> +	if (runtime_pm_enabled)
> +		pm_runtime_disable(base->dev);
> =20
>   report_failure:
>  	d40_err(dev, "probe failed\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-dma40-fixe=
s-v2-0-63238334c707@kernel.org?part=3D7
