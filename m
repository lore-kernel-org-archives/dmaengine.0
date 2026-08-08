Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE13337EFF3
	for <dmaengine@vger.kernel.org>; Sat,  8 Aug 2026 11:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786189050; cv=none; b=nYeLKoTLJvR1TmMA6Lcl5bltuDLqhjlcyr4J6/aBbbqCgrW3cQLBrmfDEIl0iLPn78ROmoBPn7I6vgt52XDMy1Aj5vUuq86aGmK5FxeOBCFiZIyL/PPyfu3OFvFIjsywQYPrxZqqpiZw4eFqBcvGPI/HQU16pOii9uep6PdWoco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786189050; c=relaxed/simple;
	bh=iwaqq0HX7OC/K71+sqhLPrfii+wHoxS/4+GuHFBkG1Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NFfA9L0Kpb+tvsGEdhucyMm7pEXvQqCkk/S+pD8Kwn9a2rXiWFR2SjzLRectfrhNNvpK5ZuAy6+5rqGzcTOa9NDpjiCScZGdJhBGV7cnMhDNAR0oUz8s3EhJvJuYiQ6u7CLHukPSc4lZdsbZ6XkV1/7OHqnouqgfxR0DSeEkwIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dy7gPknM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dy7gPknM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515791F000E9;
	Sat,  8 Aug 2026 11:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786189048;
	bh=4iHlGLlSwB0zUTlMyK0VsWgkuhbw7Mwjz53Gpg0cY14=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dy7gPknMToGk69UFTE10fsIWw2l5Oct8ofcRa+GjFNTEeeIZl1bfJ5ThYVzDJJazN
	 597oBlowvpmtGhcYdoqBLBCTHIybvoANFjzYjXdJQeC8SKGHaE9bMiqYQOYOMSIL9P
	 69SoXHlKDj5VU1faL5K1HgzQy3oKN5n0EEG8DVmY0k7Jv+GV7fJ5GnEARFMIGuCTMH
	 sjonmBi/9QO/dIIiC8FarVunzVfuWMZWgXtOIIWlLXq8i0/wj/VoZ6US9Yk1e3oWhj
	 fvLAp19Eejf4cZ5TofNUCZKwhXqVAPx5jz2Z6LCmxpAzdx7U7gO5dLnGkLsw/Xtk6C
	 kz2dt4Zl9yPBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: qcom: hidma_mgmt: fix autosuspend cleanup on
 probe failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260808112043.2781244-1-lgs201920130244@gmail.com>
References: <20260808112043.2781244-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 11:37:27 +0000
Message-Id: <20260808113728.515791F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Missing sysfs teardown and `.remove` callback leads to memory =
leaks on probe failure and a critical Use-After-Free / NULL pointer derefer=
ence upon driver unbind.
- [High] The return value of `pm_runtime_get_sync()` is ignored, risking un=
clocked register accesses and system panics.
- [High] Sysfs files are exposed to userspace before the driver data is ful=
ly initialized, allowing a NULL pointer dereference.
- [High] The `hidma_mgmt_setup` function updates hardware registers via rea=
d-modify-write sequences and is reachable concurrently via sysfs without an=
y locking.
- [Medium] Global module parameters are permanently overwritten with device=
-specific properties during probe, breaking support for multiple device ins=
tances.
--

--- Patch [1]: [PATCH] dmaengine: qcom: hidma_mgmt: fix autosuspend cleanup=
 on probe failure ---
commit e3267e79e146ae55fb7b58fe0ff314bb28430310
Author: Guangshuo Li <lgs201920130244@gmail.com>

dmaengine: qcom: hidma_mgmt: fix autosuspend cleanup on probe failure

hidma_mgmt_probe() calls pm_runtime_use_autosuspend(), but its failure
path does not call the matching pm_runtime_dont_use_autosuspend()
before disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during cleanup, this reference is not dropped and usage_count remains
unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() call to the probe
failure path before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management=
 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

> diff --git a/drivers/dma/qcom/hidma_mgmt.c b/drivers/dma/qcom/hidma_mgmt.c
> index 4805ce390ffac..470c88f36d256 100644
> --- a/drivers/dma/qcom/hidma_mgmt.c
> +++ b/drivers/dma/qcom/hidma_mgmt.c
> @@ -168,7 +168,11 @@ static int hidma_mgmt_probe(struct platform_device *=
pdev)
>  	pm_runtime_set_autosuspend_delay(&pdev->dev, HIDMA_AUTOSUSPEND_TIMEOUT);
>  	pm_runtime_use_autosuspend(&pdev->dev);
>  	pm_runtime_set_active(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> +
> +	rc =3D devm_pm_runtime_enable(&pdev->dev);
> +	if (rc)
> +		return rc;
> +
>  	pm_runtime_get_sync(&pdev->dev);

[Severity: High]
This is a pre-existing issue, but is it safe to ignore the return value of
pm_runtime_get_sync() here?

If power or clock enabling fails, pm_runtime_get_sync() returns a negative
error code. By unconditionally ignoring this return value, the driver assum=
es
the hardware is powered on and proceeds to map and access I/O memory:

    virtaddr =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);

Later, hidma_mgmt_setup() calls readl() on the hardware registers.

Could this lead to unclocked hardware register accesses resulting in bus er=
rors
or system panics?

> =20
>  	virtaddr =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);

[ ... ]

> @@ -310,7 +314,6 @@ static int hidma_mgmt_probe(struct platform_device *p=
dev)
>  	return 0;
>  out:
>  	pm_runtime_put_sync_suspend(&pdev->dev);
> -	pm_runtime_disable(&pdev->dev);
>  	return rc;
>  }

[Severity: Critical]
This isn't a bug introduced by this patch, but does this driver lack a .rem=
ove
callback and sysfs teardown?

Looking at hidma_mgmt_driver, there is no .remove callback defined.
Additionally, hidma_mgmt_init_sys() creates sysfs entries using
device_create_file(), but these are never removed on probe failure or unbin=
d.

Could this lead to a memory leak on probe failure, and a use-after-free or
NULL pointer dereference if devres frees the structures while the sysfs fil=
es
are still accessible after unbind?

[Severity: Medium]
This is a pre-existing issue, but does hidma_mgmt_probe() permanently
overwrite the global module parameter max_write_request?

In hidma_mgmt_probe():

    if (max_write_request &&
        (max_write_request !=3D mgmtdev->max_write_request)) {
        ...
        mgmtdev->max_write_request =3D max_write_request;
    } else {
        max_write_request =3D mgmtdev->max_write_request;
    }

Since max_write_request is a global module parameter, if a second device
instance probes, wouldn't it see a non-zero global parameter and incorrectly
overwrite its own values with the values hijacked from the first device?

[Severity: High]
This isn't a bug introduced by this patch, but are sysfs files exposed to
userspace before the driver data is fully initialized?

In hidma_mgmt_probe(), hidma_mgmt_init_sys() is called before
platform_set_drvdata():

    rc =3D hidma_mgmt_init_sys(mgmtdev);
    ...
    platform_set_drvdata(pdev, mgmtdev);

If userspace accesses these sysfs files in this exact time window,
show_values() in hidma_mgmt_sys.c calls dev_get_drvdata() which would return
NULL. The sysfs handlers then blindly dereference this pointer.

Could this race condition allow an unprivileged local user to trigger a NULL
pointer dereference?

[Severity: High]
This is a pre-existing issue, but does hidma_mgmt_setup() update hardware
registers without any locking?

The sysfs store handlers like set_priority() in hidma_mgmt_sys.c are
world-writable and modify shared state:

    tmp =3D mdev->priority[i];
    mdev->priority[i] =3D val;
    rc =3D hidma_mgmt_setup(mdev);

Inside hidma_mgmt_setup(), it performs read-modify-write sequences on shared
hardware registers:

    val =3D readl(mgmtdev->virtaddr + HIDMA_MAX_BUS_REQ_LEN_OFFSET);
    val &=3D ~(HIDMA_MAX_BUS_REQ_LEN_MASK << HIDMA_MAX_BUS_WR_REQ_BIT_POS);
    ...
    writel(val, mgmtdev->virtaddr + HIDMA_MAX_BUS_REQ_LEN_OFFSET);

Could concurrent writes from userspace to these sysfs files corrupt the
hardware configuration state and driver internal variables due to the lack =
of
serialization?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808112043.2781=
244-1-lgs201920130244@gmail.com?part=3D1
