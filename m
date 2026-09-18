Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477624B4035
	for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 12:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733389; cv=none; b=B/qY9vBL31JdyIRA5rJxfKSoLzsJAHaj+k76ga9fkr3Go0KYyIhfKktc+HGBcLRdKqB+oVGKTPkJX/FdEyK4wHKvoWCFVFaZfnUtVW3Z8nN6pOrZARfsEPjQNGI+3aKhsXCQYt6y9nyfmtI46DjP6mKMQdxhhnpZz/ywaFNeMeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733389; c=relaxed/simple;
	bh=1XsG/Vr7PmOYzPGWuTFz82APafEVlGl52vDdkWh0kCk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cOpSANIu/UxL+lvVwmeNmJlDZneM427kctwW52jkXXWh+Xw6REja1KeCZaqov9u/6lRPtKkR3Purq3ivdfbaBLBsmATB+lvgZoTXsWKH9l5hFncxy5UEyk0ajLNczRoFQr2d0TgMd8/lsHZmwTsJcyxVTtremqQnPilj/N0hH4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gjr94kzQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gjr94kzQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38E71F000FF;
	Fri, 18 Sep 2026 12:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789733387;
	bh=EjA0vHKvK94FhMLY+rL2LmriAhIGMbkG2sYgMwOH+fc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gjr94kzQavOJqT6547zOEjDCk+6cp+FB/Ipr+i0X1X/0TgX3R38yHWKqNbhbS+8ND
	 uw56k0zGl5kybXG7fBO2Q1cEpm6CYMXgzW/GEQVwvyfmd2AETiwwK8824JhACEHCZ/
	 WeD477/0kNDUzIymjJpgnH410SZ4OD53BLadnb/TrA4chNd10p/zpjsWm1L2LUbgnG
	 NzvfpC38vYVFtB3zDyft1mLOmf8uQjpqBnHwtqPOkESHIaScWMNHG37YIb5QhtaswE
	 a6Llk3UW3+Sge0AIqtC2seBguavWUSIqw0sISGA0Ud8JcapODF9qFh76sfpz3/NBC7
	 0tBHKcQ1xSbuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] gpib: fmh_gpib: Replace
 dma_request_slave_channel() by dma_request_chan()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260918113727.1898998-7-andriy.shevchenko@linux.intel.com>
References: <20260918113727.1898998-1-andriy.shevchenko@linux.intel.com>
 <20260918113727.1898998-7-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 12:09:47 +0000
Message-Id: <20260918120947.A38E71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] gpib: leaking -EPROBE_DEFER to userspace via ioctl
--

commit ed7181f3c8edddd4643c5d2a68386dacb851bb22
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

gpib: fmh_gpib: Replace dma_request_slave_channel() by dma_request_chan()

This commit replaces the deprecated dma_request_slave_channel() with
dma_request_chan() in the fmh_gpib driver. It propagates the specific
error code returned by dma_request_chan() rather than returning a hardcoded
-EIO.

> diff --git a/drivers/gpib/fmh_gpib/fmh_gpib.c b/drivers/gpib/fmh_gpib/fmh=
_gpib.c
> index 5e10e9353fedd..4ab9b0a317fdb 100644
> --- a/drivers/gpib/fmh_gpib/fmh_gpib.c
> +++ b/drivers/gpib/fmh_gpib/fmh_gpib.c
> @@ -1458,11 +1458,15 @@ static int fmh_gpib_attach_impl(struct gpib_board=
 *board, const struct gpib_boar
>  	e_priv->irq =3D irq;
> =20
>  	if (acquire_dma) {
> -		e_priv->dma_channel =3D dma_request_slave_channel(board->dev, "rxtx");
> -		if (!e_priv->dma_channel) {
> +		struct dma_chan *tmp_chan;
> +
> +		tmp_chan =3D dma_request_chan(board->dev, "rxtx");
> +		retval =3D PTR_ERR_OR_ZERO(tmp_chan);
> +		if (retval) {
>  			dev_err(board->dev, "failed to acquire dma channel \"rxtx\".\n");
> -			return -EIO;
> +			return retval;

[Severity: Medium]
Could this leak -EPROBE_DEFER to userspace?

If dma_request_chan() fails due to an unavailable DMA controller, it returns
-EPROBE_DEFER. Because fmh_gpib_attach_impl() is called when a userspace
application configures the board via the IBONL ioctl:

ibioctl()
  online_ioctl()
    ibonline()
      attach()
        fmh_gpib_attach_impl()

This kernel-internal error code would be returned directly across the sysca=
ll
boundary.

Userspace applications expecting standard POSIX error codes like -EIO, -EAG=
AIN,
or -ENODEV might break when encountering -EPROBE_DEFER.

>  		}
> +		e_priv->dma_channel =3D tmp_chan;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918113727.1898=
998-1-andriy.shevchenko@linux.intel.com?part=3D6
