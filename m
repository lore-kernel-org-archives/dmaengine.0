Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30E15221DA
	for <dmaengine@vger.kernel.org>; Mon, 21 Sep 2026 22:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790030213; cv=none; b=mbtk2cbU/oZLu+2u5iGJ9aC4myHD+Q09AXF/EYqjNnwn/WIdPxHYXZECnwgfUfT1VlruZiSdqkQrAEDdXRR8lbLCvjWor4AiQzXCRZJXi6X6CBepwtw9v95qe2+PrTf3XkQFsvZEAim2wFw7TEmzq3/NXdQqBISDttN+r5q93kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790030213; c=relaxed/simple;
	bh=J0TOBDFO/MmP7LDDSIa84PEKWEhTw3zcy5/nwYR1c4c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g60Of0Ytq1RuxdN3HjASGFwy4RI6sdO3sMe5BgksFgxVfuyavLskVQWgQayoUxJYBvMPu16EGY+yuRrXDjKitWiCQ6Z+RKpM4VrEovPrrzVoV4gaJUshu2aYiD/iaZnbII/tz90ugEUtcl1O1xS6LAdbDvxU2OX1amsIitLc1HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=htQty8aE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="htQty8aE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7DF31F000FF;
	Mon, 21 Sep 2026 22:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790030209;
	bh=A8A6p0TDSmw7ptm8EoYwS2WqVT0odtgtox3lPS9HlWQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=htQty8aEdnGeOhI2spvXr3wlt50DBAkPdQYT33SNyUVdhF1C8H5IrpdVw4OiaIX17
	 6ezav3DTK/x5A5r2Y+HIjIrg46RujMZz+szIpewglagauJObA/c45uIKgOIHk237Lo
	 oDQsDm4496dNz5xzepJDkD+LRwyHj0ZlsFqQUKOpIx6cN0HDP/ZnjS2fYKoyIO86Qd
	 RlXUFtNqNdi2qc5FiEPf0JlXUd7z4NyOTyYOuXlYDWWQz2z1a6LqYTVWSipyu2qMa5
	 Idjz8EKvOmJ51TpsyPMjtFKUtjzbxyFA4okrK+o3zm8F5N0fwXnf4E3l6xmWCqKo3g
	 9ujdmpNSoQVVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv8] dmaengine: fsl_raid: check fsl_re_chan_probe() return
 value
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260921222544.52655-1-rosenp@gmail.com>
References: <20260921222544.52655-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 22:36:48 +0000
Message-Id: <20260921223648.D7DF31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dmaengine: fsl_raid: unconditional total_chans increment contrad=
icts commit
--

commit 208ae247c55a1b6bf4d94121e4104ab723b71bae
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: fsl_raid: check fsl_re_chan_probe() return value

The commit adds a check for fsl_re_chan_probe() failure in fsl_re_probe()
to prevent leaving uninitialized array elements in re_jrs[]. It also adds
a cleanup path to correctly tear down channels if an error occurs.

> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 2d86f61105e52..352e8cc9e8c71 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
[ ... ]
> @@ -824,33 +839,46 @@ static int fsl_re_probe(struct platform_device *ofd=
ev)
[ ... ]
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

[Severity: Medium]
The commit message states "only count successfully probed channels", but do=
es
this code still unconditionally increment the counters?

If fsl_re_chan_probe() fails and returns a non-zero rc, it logs an error bu=
t=20
then falls through to increment re_priv->total_chans and ridx since there i=
s=20
no continue statement. This advances the counters even for failed probes,
wasting slots in the fixed-size re_jrs array. Should this include a continue
when rc is non-zero?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921222544.5265=
5-1-rosenp@gmail.com?part=3D1
