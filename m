Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8905634B43F
	for <dmaengine@vger.kernel.org>; Sat, 19 Sep 2026 00:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789779278; cv=none; b=uGu5FSEv6XoH9lO3mCatm4Lpo/hGg/rFVPOOeHGamSJ9oLb+o3Wod3CdVE+J+ENZUdy/oVnXX3p/DvncGXPHoot9pNOO2hWJufQzIaGc4FIczFpZ57vNJVUAZ+VJDpGf9oIQSSpkScr1jYH+ooSQGimD47r+JknEJEYw4GTHLz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789779278; c=relaxed/simple;
	bh=i2exAnxUsv/xKIDw/XWFUPxshO7CPrwRQ3tSPa/Jhfw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KchqDhqIqYRHGkwtXareH7amdv2FzZcCU3e4FOKnuaRF0Fk4DSkJCKgy9ZDbl47ozGSj9iefRv6pJvXKQJ4LxNvjGWBtqOhONJP/BWUkMq6JimJi4Edn+DXays7nNrCv/xY+sVxYaya5KOUGt49UADkMHiqd5xJQ5lSPa/8pLBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MPdx0r4g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPdx0r4g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590B11F000FF;
	Sat, 19 Sep 2026 00:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789779275;
	bh=/t6sD8Lc5l+trDqWjk+4IV7TvQN7yRqjBQTpIFfsa+8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MPdx0r4gHPi180s+hciFi3g/InvzMbzZmcT3+tod10APrXquEp9h7gw5wnkogQQts
	 yq0oVKMvrey4fkEUE0KT7eXtI9c5nYRKoixZ1CNMoDA/Fa2hltLwfbxEFKds/oR6sG
	 don5ovj0mO27KVIcqLOfTDxJm/d07WG8ajy1R8mDCA/q/qIIxYNJYBV+SXkxldr0ov
	 bcavKG6r+JP3H+ltSDwfAaJIcBTWzItl8sK0z08xlYDKNoaATVHaOMo8TQuugylMSo
	 QbkEsxVapOMp7JgJJJy692W19c45c48gBq/3EdurC9hS/NZnvfQhd/94qJmN4w6C+1
	 EVyWkgbEApU3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv7] dmaengine: fsl_raid: check fsl_re_chan_probe() return
 value
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260919004349.736044-1-rosenp@gmail.com>
References: <20260919004349.736044-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Sep 2026 00:54:34 +0000
Message-Id: <20260919005435.590B11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: fsl_raid: Use-After-Free due to missing unwind on dma_a=
sync_device_register failure
--

commit d02780e2d0d4fd4ead4e7e3dafdee9eccab11cf0
Author: Rosen Penev <rosenp@gmail.com>

    dmaengine: fsl_raid: check fsl_re_chan_probe() return value

    fsl_re_probe() ignores the return value of fsl_re_chan_probe() and
    unconditionally increments total_chans. When a channel fails to probe
    (for example, an IRQ mapping failure) its re_jrs[] slot is left NULL, y=
et
    total_chans still advances, so fsl_re_remove_chan() later dereferences =
the
    NULL pointer during device removal.
   =20
    Check return value and guard fsl_re_remove() against NULL entries.

> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 2d86f61105e52..3530546a68e40 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
[ ... ]
> @@ -828,18 +832,24 @@ static int fsl_re_probe(struct platform_device *ofd=
ev)
>  		}
>  		/* Find out the Job Rings present under each JQ */
>  		for_each_child_of_node(np, child) {
> -			rc =3D of_device_is_compatible(child,
> -					     "fsl,raideng-v1.0-job-ring");
> -			if (rc) {
> -				fsl_re_chan_probe(ofdev, child, ridx++, off);
> -				re_priv->total_chans++;
> +			if (!of_device_is_compatible(child, "fsl,raideng-v1.0-job-ring"))
> +				continue;
> +
> +			if (ridx >=3D FSL_RE_MAX_CHANS) {
> +				dev_warn(dev, "too many job rings, max %d\n", FSL_RE_MAX_CHANS);
> +				of_node_put(child);
> +				break;
>  			}
> +
> +			rc =3D fsl_re_chan_probe(ofdev, child, ridx, off);
> +			if (rc)
> +				dev_err(dev, "job ring %d probe failed: %d\n", ridx, rc);
> +			re_priv->total_chans++;
> +			ridx++;
>  		}
>  	}
> =20
> -	dma_async_device_register(dma_dev);
> -
> -	return 0;
> +	return dma_async_device_register(dma_dev);

[Severity: High]
Does propagating the error from dma_async_device_register() leave the
hardware interrupts active?

If dma_async_device_register() fails, the probe function now returns the er=
ror
and aborts. The driver core will then automatically free all devm-managed
memory, including the chan structures allocated in fsl_re_chan_probe().

However, because fsl_re_chan_probe() requests a hardware IRQ via a non-devm
request_irq() without any unwind path in fsl_re_probe() to call free_irq(),=
 the
hardware interrupts will remain active.

If the hardware asserts an interrupt after the probe has failed and the
memory is freed, fsl_re_isr() could be invoked, which would dereference the
freed chan pointer and schedule a freed tasklet, causing a use-after-free
and kernel crash.

This isn't a bug introduced by this patch, but there is also a pre-existing
early return in fsl_re_probe() that demonstrates the same lack of channel
cleanup:

drivers/dma/fsl_raid.c:fsl_re_probe() {
    ...
		rc =3D of_property_read_u32(np, "reg", &off);
		if (rc) {
			dev_err(dev, "Reg property not found in JQ node\n");
			return -ENODEV;
		}
    ...
}

Should fsl_re_probe() provide a cleanup path to manually free the interrupts
and other resources if dma_async_device_register() or subsequent job queue
probes fail?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919004349.7360=
44-1-rosenp@gmail.com?part=3D1
