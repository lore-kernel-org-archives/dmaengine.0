Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8635747A0A6
	for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 10:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467707; cv=none; b=uSKpQHWGzLlB8S3XWibQmfDBm81m7b/bNmMH77kcojvC899Vr0AXUCf/4Xcmifhe0QdbyODnKlH3yY8qUpkE/aNHWA1sjJtv/hFWUuyrti+zewxnCNgIJzwnUDF5DSQQf1nKhCfhHHE5kJO+/msAo0dtraVBIpSlp6hJ2YyctSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467707; c=relaxed/simple;
	bh=vki2LAtka/B/sMZ1Ckk0BZKJ8bjVqWGzFouAavKonE0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cmlli2P16/l62XXGZFq7ULfLWiB70azcBEy9qO/4oNf70pJ4tl3/VPi3bh+k5z/Nv1q0EKuW5XfuHc7RpYaeJM/Pon3AJ/YOfvSfJ4N8C02PHFSwFCRz7VAZXUs+HT0hiX/cYMUUHW2dlf+TYFBhgUt/PXgwvE1kxrwjkazGPm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bskg6Z+l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bskg6Z+l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60EC1F000FF;
	Tue, 15 Sep 2026 10:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789467705;
	bh=XLguCkv7eFvo7+Lum+cuEcbf1n9jHtH+fBJtgHxop7o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bskg6Z+lOHVeYrdMvUj8QmJt6xVC8S3OjKV8ssHV4vpFl+rSEauMHar7O/1/502O/
	 1b9GVVUvxdRUIOZeQQ6DDTU992YohxL6mUT+95U4IVFFv687g7/BurYjSTCazBfv5K
	 l5+wQ0mHKbIBZXLsPjv8HO2RU1GCh2O4QIwm2hL3RcEPuLsMhtTb0dw3wdE4jwJUDt
	 gQ4NgHsvxxthDtIQN4zz7mH+VHA18wZePGMCxIkbh6QPX54R2NQdBpujiI6Gh+LViL
	 D2DI8JBs2MVZ8OFEshk6BoIOvD8joMGjTDF0JDHQiMs54vQggZsp1aeZJyHuzU+ycm
	 XFo8tX0V0jtrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 6/7] gpib: fmh_gpib: Replace
 dma_request_slave_channel() by dma_request_chan()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260915100931.3593242-7-andriy.shevchenko@linux.intel.com>
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
 <20260915100931.3593242-7-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 10:21:44 +0000
Message-Id: <20260915102144.B60EC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] gpib: fmh_gpib: unhandled ERR_PTR from dma_request_chan() causes c=
rash in fmh_gpib_detach()
--

commit 7e5dd98fffd0fbb658150cf070a074a056171a33
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

gpib: fmh_gpib: Replace dma_request_slave_channel() by dma_request_chan()

This commit replaces the deprecated dma_request_slave_channel() with
dma_request_chan(). It updates the error checking to use PTR_ERR_OR_ZERO()
appropriately for the new function.

> diff --git a/drivers/gpib/fmh_gpib/fmh_gpib.c b/drivers/gpib/fmh_gpib/fmh=
_gpib.c
> index 5e10e9353fedd..3fdcc673ec8b8 100644
> --- a/drivers/gpib/fmh_gpib/fmh_gpib.c
> +++ b/drivers/gpib/fmh_gpib/fmh_gpib.c
> @@ -1458,10 +1458,11 @@ static int fmh_gpib_attach_impl(struct gpib_board=
 *board, const struct gpib_boar
>  	e_priv->irq =3D irq;
> =20
>  	if (acquire_dma) {
> -		e_priv->dma_channel =3D dma_request_slave_channel(board->dev, "rxtx");
> -		if (!e_priv->dma_channel) {
> +		e_priv->dma_channel =3D dma_request_chan(board->dev, "rxtx");
> +		retval =3D PTR_ERR_OR_ZERO(e_priv->dma_channel);
> +		if (retval) {
>  			dev_err(board->dev, "failed to acquire dma channel \"rxtx\".\n");
> -			return -EIO;
> +			return retval;

[Severity: High]
Does this code leave an ERR_PTR in e_priv->dma_channel on failure?

If dma_request_chan() fails, it returns an error pointer which is stored in
e_priv->dma_channel. When fmh_gpib_attach_impl() returns this error code,
the GPIB core intercepts the attach failure and calls fmh_gpib_detach() to
clean up.

Since fmh_gpib_detach() handles cleanup by checking for NULL:

drivers/gpib/fmh_gpib/fmh_gpib.c:fmh_gpib_detach() {
    ...
    if (e_priv) {
        if (e_priv->dma_channel)
            dma_release_channel(e_priv->dma_channel);
    ...
}

It will evaluate the ERR_PTR as true and attempt to dereference it inside
dma_release_channel(), leading to a kernel oops or panic. Should
e_priv->dma_channel be reset to NULL before returning the error?

>  		}
>  	}
>  	/*

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915100931.3593=
242-1-andriy.shevchenko@linux.intel.com?part=3D6
