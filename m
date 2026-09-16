Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B58F4307A0
	for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 23:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789600335; cv=none; b=PvvazYrQKhfxN8oFT8cJgH3lnHJh8X/ol6AWkhJfeNwKWXN93Z8pcfWjXg1PF+t1tRLClVXQfmSbENoitKn9wzQF2hbpjQ/GbN+31XGGoPoj1p+jsT5OOHMQKTgMAJ1dXxy4weMwG7xmBLHPPBfE4tSFVrEKVuUNQzl32WtPhZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789600335; c=relaxed/simple;
	bh=S+zW9kIiIp3c2XUGdXjGhO+byFXJTGJ0mjLOBgTAyag=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GZSbefgABOgfub7JU0TxrlEksNdv0w4tbmfyQOs+IrdEr6KQbH7TJigOucp+qNUGzB7pnJq6ycG7NOxOsb7Eap47l0ixISyuVNAbrqkaMAloTuC4sxCp8ZebZr2GF6+vBtfcG+SFY2vlG39+g1hDvY8VD74zUlUTJK3g8ZwuH5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gFt6B01y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gFt6B01y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD6BF1F000FF;
	Wed, 16 Sep 2026 23:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789600334;
	bh=VB/t2FAe6jk69xjN1PjNNezo5mQKR3Fg6gqU2hoR5j8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gFt6B01yads2zTyJVBQ2B1T29IYSvKwyZ6/vncHGfyhza6UfevHOaCvqHyhF/rwua
	 LRipSwBPwE4nLjA6ZWER+KwLDTvXFbtgu099OYctMqQwYqwHR3vvd54td1xdLYSLdg
	 pWAVd58d7AZVIw4Uf4UXQKDvw2NBi90YYnwBFQ5sMEpUQ5JYhxaU3kayMAu46fiie7
	 7el8zINkIT+7tPvlXpDSGIUPl01KSP2ftcs8uXEcE6eeiDjjZ0igSGI5joN6u/RNjo
	 NtjOS2ZgBpXYfwHEPJuBWKeaqLt/bXDH40Xo66MnG9ZcpWP3G4TXLsD4PDP+loLAGZ
	 PZGw8PHYtv2gA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv6] dmaengine: fsl_raid: check fsl_re_chan_probe() return
 value
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260916230228.283615-1-rosenp@gmail.com>
References: <20260916230228.283615-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 23:12:13 +0000
Message-Id: <20260916231213.AD6BF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dmaengine: fsl_raid: decoupling total_chans from ridx leaks channe=
ls on remove
- [Medium] dmaengine: fsl_raid: unconditionally incrementing ridx for incom=
patible nodes exhausts slots
--

commit 698d683c6c412a8530d330dc178b5712397be8bf
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: fsl_raid: check fsl_re_chan_probe() return value
   =20
This commit modifies fsl_re_probe to check the return value of
fsl_re_chan_probe and only increment total_chans on success. It also adds
NULL checks during channel removal in fsl_re_remove to prevent dereferencing
uninitialized slots.

> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 2d86f61105e52..83856d554b12b 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -828,18 +828,30 @@ static int fsl_re_probe(struct platform_device *ofd=
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
> +			if (!rc) {
> +				ridx++;
> +				continue;
> +			}

[Severity: Medium]
When iterating child nodes, if a node is not compatible, does this code
incorrectly increment ridx?

This could waste limited job ring capacity (FSL_RE_MAX_CHANS) by advancing =
the
internal logical index for child nodes that are not job rings.

> +
> +			rc =3D fsl_re_chan_probe(ofdev, child, ridx, off);
>  			if (rc) {
> -				fsl_re_chan_probe(ofdev, child, ridx++, off);
> -				re_priv->total_chans++;
> +				dev_err(dev, "job ring %d probe failed: %d\n", ridx, rc);
> +				ridx++;
> +				continue;
>  			}
> +			ridx++;
> +			re_priv->total_chans++;

[Severity: High]
If any child node fails to probe or is skipped as incompatible, ridx is
incremented but total_chans is not. Does this create a persistent mismatch
between the array index and the channel count?

A subsequent successful probe would store the channel in re_priv->re_jrs at
an index greater than or equal to total_chans.

[ ... ]
> @@ -864,7 +876,8 @@ static void fsl_re_remove(struct platform_device *ofd=
ev)
> =20
>  	/* Cleanup chan related memory areas */
>  	for (i =3D 0; i < re_priv->total_chans; i++)
> -		fsl_re_remove_chan(re_priv->re_jrs[i]);
> +		if (re_priv->re_jrs[i])
> +			fsl_re_remove_chan(re_priv->re_jrs[i]);

[Severity: High]
Does this cleanup loop miss successfully populated channels stored at indic=
es
greater than or equal to total_chans?

Since total_chans is used as the exclusive upper bound, successfully probed
channels placed at higher indices (due to previous skipped or failed nodes)
could be bypassed and leaked during device removal.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916230228.2836=
15-1-rosenp@gmail.com?part=3D1
