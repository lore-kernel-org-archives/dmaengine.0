Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD79738F624
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 20:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789071488; cv=none; b=tnAFA3Ab6s53hRpwIQ6lG5ejbaSXbTfY3JxlY3kh0EGcd2Wrmu82v8gVtSOXQBwoLzhhOZlWDhntEg2vMD4sX6+0LE7kiINYZdjMknsCoRVdTEBrXO78A3B609uEL+LkyFATWbdFQ8/OkJ4wjq3wf0i9UyI/o4qBkXOlp9wvgjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789071488; c=relaxed/simple;
	bh=dnU+NXZ1HJz/AdNhBfiSDDrR+t2vgIugwDXWCxSD3AQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nqhQW5/cgcxWetP8Y4mMQWWzLwoEwFyLEpmPwMFQvwKuxwqWS3XEJX8yXpqWSTR0MObrPq/Jiw4ySTRxa7YWrUxSGbXC4diz8wCEYDKtnHZMliWRVAzFTgNGJ2alFnPlXORuE4sP3bCr+KsFIkrGPyIPWMUgAOnjaGihJnGAzkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IovMArhb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IovMArhb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6601F000FF;
	Thu, 10 Sep 2026 20:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789071486;
	bh=ObA8kVnaGaafAZB9jQPZknlPpQeeJdtx+17rvoo0oGc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IovMArhbe6YCOGFyY/uZd7n4XDCtvMpuF2fqHdJNi3wUXNIHxWPA5eo6XO0+aiQqL
	 t/5h8S9HDJyRw8393eoiwFpB/HCekKcMsgNuDvONqAIC0qwyUF5s4b+0tpPGwJThrO
	 HYhgI2dOG+gSIvmoGqP2+o8F40QTV1/yF5yLMgnMzs9do8YxJtX6Strzcsi2hjldh4
	 1koELtFDFq7Pq1DsAe7E322o1+zHRioeZEirmeJsH1TQzpJ2hG0HAkKtzpnv0tKsC/
	 KE9JU0VrO9pcwDLJE1HGmh/oE3ep28dCHXouvKCVIUcdNyrAdCkxi1lTywj3kNCcKs
	 a9eKc+ZP/3ZcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv4] dmaengine: fsl_raid: check fsl_re_chan_probe() return
 value
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260910200637.41512-1-rosenp@gmail.com>
References: <20260910200637.41512-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 20:18:05 +0000
Message-Id: <20260910201806.0D6601F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver never frees requested IRQs or unregisters child platfor=
m devices, causing resource leaks and use-after-free on error paths and dri=
ver unbind.
- [High] Returning an error from `dma_async_device_register()` or early ret=
urns in `fsl_re_probe()` fail to unwind successfully probed channels, causi=
ng resource leaks and UAF.
- [High] DMA channels are never added to the DMA device channels list, rend=
ering the driver non-functional.
- [High] Interrupt is requested before private data and hardware are fully =
initialized, risking a NULL pointer dereference in the interrupt handler.
- [High] Channel resources are destroyed before the DMA device is unregiste=
red, allowing concurrent use-after-free.
--

commit df14fae70b7983f30255454748eb310d0c4f9ad9
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: fsl_raid: check fsl_re_chan_probe() return value

The commit fixes a potential NULL pointer dereference in fsl_re_remove_chan=
()
by checking the return value of fsl_re_chan_probe() during device probe and
guarding against NULL entries during removal.

> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 2d86f61105e52..66b7ff0f31f70 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -828,18 +828,32 @@ static int fsl_re_probe(struct platform_device *ofd=
ev)
>  		}
>  		/* Find out the Job Rings present under each JQ */
>  		for_each_child_of_node(np, child) {
> +			if (ridx >=3D FSL_RE_MAX_CHANS) {
> +				dev_warn(dev,
> +					"too many job rings, max %d\n",
> +					FSL_RE_MAX_CHANS);
> +				of_node_put(child);
> +				break;
> +			}
> +
>  			rc =3D of_device_is_compatible(child,
>  					     "fsl,raideng-v1.0-job-ring");
> +			if (!rc)
> +				continue;
> +
>  			rc =3D fsl_re_chan_probe(ofdev, child, ridx, off);

[Severity: High]
This is a pre-existing issue, but does fsl_re_chan_probe() leak resources on
failure and driver unbind?

In fsl_re_chan_probe(), a platform device is created and an interrupt is
requested without devres management:

    chan_ofdev =3D of_platform_device_create(np, NULL, dev);
    ...
    ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);

The error path just returns without unwinding these:

err_free:
    return ret;

Furthermore, fsl_re_remove_chan() destroys the tasklet but does not free the
interrupt or unregister the child device. Since devres will automatically f=
ree
the chan structure on unbind, wouldn't the leaked active interrupt cause a
use-after-free if it fires and accesses the freed chan structure?

[Severity: High]
This is another pre-existing issue, but are the channels ever linked to the
device's channels list?

fsl_re_chan_probe() sets the device pointer:

    chan->chan.device =3D dma_dev;
    chan->chan.private =3D chan;

However, it seems to miss linking the channel into the parent device's
channel list. When dma_async_device_register() is called later, wouldn't it
see an empty channels list and register zero channels, rendering the driver
non-functional?

[Severity: High]
This is a pre-existing issue, but is there a race condition between request=
ing
the interrupt and setting the driver data?

fsl_re_chan_probe() requests the interrupt before setting the driver data:

    ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
    ...
    dev_set_drvdata(chandev, chan);

If the interrupt fires in this window, fsl_re_isr() will read a NULL pointer
from dev_get_drvdata() and unconditionally dereference it:

    re_chan =3D dev_get_drvdata((struct device *)data);
    irqstate =3D in_be32(&re_chan->jrregs->jr_interrupt_status);

Can this lead to a NULL pointer dereference panic?

>  			if (rc) {
> -				fsl_re_chan_probe(ofdev, child, ridx++, off);
> -				re_priv->total_chans++;
> +				dev_err(dev,
> +					"job ring %d probe failed: %d\n",
> +					ridx, rc);
> +				continue;
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
This is a pre-existing issue, but if dma_async_device_register() fails, are
the successfully probed channels abandoned?

When dma_async_device_register() returns an error, the function exits witho=
ut
calling fsl_re_remove() to clean up any channels initialized during earlier
job queue iterations.

Since the interrupts for these channels are not devres-managed, they would
remain active. Once devres frees the associated chan memory, could an
interrupt firing trigger a use-after-free crash?

>  }
> =20
>  static void fsl_re_remove_chan(struct fsl_re_chan *chan)
> @@ -864,7 +878,8 @@ static void fsl_re_remove(struct platform_device *ofd=
ev)
> =20
>  	/* Cleanup chan related memory areas */
>  	for (i =3D 0; i < re_priv->total_chans; i++)
> -		fsl_re_remove_chan(re_priv->re_jrs[i]);
> +		if (re_priv->re_jrs[i])
> +			fsl_re_remove_chan(re_priv->re_jrs[i]);
> =20
>  	/* Unregister the driver */
>  	dma_async_device_unregister(&re_priv->dma_dev);

[Severity: High]
This is a pre-existing issue, but are channel resources destroyed premature=
ly
during driver unbind?

fsl_re_remove_chan() is called for each channel, killing tasklets and freei=
ng
dma pools:

    for (i =3D 0; i < re_priv->total_chans; i++)
        if (re_priv->re_jrs[i])
            fsl_re_remove_chan(re_priv->re_jrs[i]);

Afterward, the device is unregistered:

    dma_async_device_unregister(&re_priv->dma_dev);

Since the subsystem still considers the device active until unregistration
completes, could concurrent or pending requests attempt to use the already
freed pools or schedule the killed tasklets?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910200637.4151=
2-1-rosenp@gmail.com?part=3D1
