Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B433FE64A;
	Sun, 20 Sep 2026 22:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789945111; cv=none; b=rfZBWt2bOGMNIK3bgVdzdq9rsTsLE6bqPAT4agCClcpQc8d++s9dLSZej20PYo0b5NApBjxD+BO827aMyA6ltqgFj4q73eci6qb/839ODIPZlTXvvqdL/oNfHUCp2vLbGG2dnTCUfz31mCwNkzo1Y66vlbjleVHvu6nf9mYhf3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789945111; c=relaxed/simple;
	bh=HPrgcCZw41raO2NHF6z532uIP7KOIc1nLWl6kXT4HeQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xs2XfxCCyxtmgj2NmCWU40gzdbqrUmv9b9KtkrhBf2HbZAFiXB/kc924JG8T4k+ze5Od5CmlIlu3ixBIydO8n8YWI7T60p0T6ufcM7WP+KsVBE2tg7zHTMPFABpjag9zHIncP+sXRj/S/faJjEg+hAgaYUbHTqWTzjvK5YxylRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEc3hvyU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEc3hvyU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797301F000FF;
	Sun, 20 Sep 2026 22:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789945109;
	bh=vqdXNa7PU0vKrWanHtgF1CuycbEPu3rT6cLqRY4ULwY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JEc3hvyUKmQNOT1JOU9rEaqfpOQ7SIwHD6BdjxafWKLoEEbwA8v0gmZwJxDE3PNfv
	 84+zL5R8XKy6+snaw6vfxtbJOVhITqpmfEUzc8DdCAeudJcii0pEwwYtcFa4RwgnLc
	 lTUsrWYUGSr5S3BVKObjXRZb6mXCK7t0n9ZvQCmpwY5sCPGHpApROf4fYm4j9MNXsY
	 6n/UeF9xP4vRF+jl4RGXDjYw2vOIT0mlFFdFz5d3LvsJOg7TN93VFlNv6lB19M8J0W
	 ZoXQKA8gofL9j8Zvm5pOQWDZltk7lDZEodlnQ3Y79EJjIOr7RvCuWBhDaO8zg50I3Y
	 pBbCQLiksNM/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 13/18] drm/mcde: Use power domain for display power
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, vkoul@kernel.org
In-Reply-To: <20260921-ux500-power-domains-v7-1-v3-13-9352be6b86b1@kernel.org>
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
 <20260921-ux500-power-domains-v7-1-v3-13-9352be6b86b1@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 22:58:29 +0000
Message-Id: <20260920225829.797301F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] pm: incorrect success check for pm_runtime_put_sync_suspend()
--

commit 1421b098d2f7f0ffecc255355537663b64ad9955
Author: Linus Walleij <linusw@kernel.org>

    drm/mcde: Use power domain for display power

This commit replaces explicit EPOD regulator handling with runtime PM.
It uses the MCDE power domain and drops the regulator dependency.

> diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/m=
cde_display.c
> index 257a6e84dd583..52f071bb347c4 100644
> --- a/drivers/gpu/drm/mcde/mcde_display.c
> +++ b/drivers/gpu/drm/mcde/mcde_display.c

[ ... ]

> @@ -1327,9 +1326,9 @@ static void mcde_display_disable(struct drm_simple_=
display_pipe *pipe)
>  		spin_unlock_irq(&crtc->dev->event_lock);
>  	}
> =20
> -	ret =3D regulator_disable(mcde->epod);
> +	ret =3D pm_runtime_put_sync_suspend(mcde->dev);
>  	if (ret)
> -		dev_err(drm->dev, "can't disable EPOD regulator\n");
> +		dev_err(drm->dev, "can't disable MCDE power domain\n");

[Severity: Low]
Does this incorrectly treat a successful return value as an error?

When mcde_display_disable() calls pm_runtime_put_sync_suspend(), the PM core
returns 1 if the device is already suspended. Because this code checks
if (ret) rather than if (ret < 0), the success value of 1 will trigger the
error path.

This will cause a spurious "can't disable MCDE power domain" message to be
printed to the kernel log even when the operation succeeds.

>  	/* Make sure we are powered down (before we may power up again) */
>  	usleep_range(50000, 70000);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-ux500-powe=
r-domains-v7-1-v3-0-9352be6b86b1@kernel.org?part=3D13
