Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E612B21E097
	for <dmaengine@vger.kernel.org>; Sat, 10 Oct 2026 12:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636847; cv=none; b=laHXKWxK37g1WP3eNfzmwb/xWcw7LUz8QDTkGaprcD63Sv/T+OwonHrmDzBgbA49XVb16CEZZRTIB4ORf/cCiTN/iG2uOx+WepdE1cGseh2/SJIR3C59i3Z+gUS5tHJWDrZAh+fqz3HKI+e8hZagSQIq3sf2WXz2QP7qrPpr7YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636847; c=relaxed/simple;
	bh=VhdIjTd7iSss3mlXuGBl/ibM1kSoQ4AI7QiKsPX22Uc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=UCBYI8dQ8WHNzYJ17aF4WXsLCKkDDOvjkZbOYc/ZagpGSqevR+txg59Z82gqUXJSVRVQJ5iBEQunvhAJmvJpt5trykqCWmgvfasA6rPOlpa3qQxJMc6ljpKjMI+9oF9UMZ8W2NNZAtrjcM/SipoJVNBOxuV4aVIVm4b8MfkOm3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VN2UttSF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VN2UttSF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E4A1F000FF;
	Sat, 10 Oct 2026 12:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791636846;
	bh=tfpFnqBEvpSm21z9UjNrdQYToX6ZRQGdRC+ewcCt/9I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VN2UttSF/2mixXH277kBYI5lSd/Obk9QjAA5A83jLjlwNmpSP154UYV3R0eUq6/un
	 U+HAyBDQnadPDbXfo+p5FT5s6p2GcxKX1reojBJ7b1ZgmakxkD6l7SVK9RtYMCArCz
	 7oqctMQp4+b5zz8bFPyMKomCSvdlO063D9omI75MWrWAHJTRJ7+yUtzf7mlixNLX/k
	 njuvMJwV3DVn/JNg4FuJcTp9sDzDRFe+munhVOh8ejkA1eNLYXDDROTRwSCfgz8d8i
	 HFaHUKzo9MRrrCNRTx5OpO2qflb64sELiGcVO2DyDIgjPKNRFcsdvXAJpJegW0atZU
	 3/1H3SKXk/8xw==
Message-ID: <sashiko-outbox-166551@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/8] dmaengine: switchtec-dma: unmap descriptor before
 completing cookie
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261010124348.19055-8-wsa+renesas@sang-engineering.com>
References: <20261010124348.19055-1-wsa+renesas@sang-engineering.com>
 <20261010124348.19055-8-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 12:54:05 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: switchtec-dma: recursive deadlock when invoking callbac=
k with complete_lock held
--

commit ffea26942d7e62541800c95b1e3d4d09f66f0c18
Author: Wolfram Sang <wsa+renesas@sang-engineering.com>

dmaengine: switchtec-dma: unmap descriptor before completing cookie

This commit ensures that the descriptor gets unmapped before completing the
cookie to ensure that buffers are flushed.

Link: https://lore.kernel.org/r/20261009093745.539924-1-vkoul@kernel.org

> diff --git a/drivers/dma/switchtec_dma.c b/drivers/dma/switchtec_dma.c
> index a386c3a284e6e..84a0a2e5e8722 100644
> --- a/drivers/dma/switchtec_dma.c
> +++ b/drivers/dma/switchtec_dma.c
> @@ -486,8 +486,8 @@ switchtec_dma_cleanup_completed(struct switchtec_dma_=
chan *swdma_chan)
>  		}
> =20
>  		do {
> -			dma_cookie_complete(&desc->txd);
>  			dma_descriptor_unmap(&desc->txd);
> +			dma_cookie_complete(&desc->txd);
>  			dmaengine_desc_get_callback_invoke(&desc->txd, &res);

[Severity: High]
Can this lead to a recursive deadlock if the client callback queries the DMA
status or terminates the transfer?

In switchtec_dma_cleanup_completed(), complete_lock is acquired earlier in =
the
function. If the DMA client's completion callback invokes dmaengine_tx_stat=
us()
or dmaengine_terminate_all(), those APIs will call into the driver's
switchtec_dma_tx_status() or switchtec_dma_terminate_all() functions.

switchtec_dma_tx_status() calls switchtec_dma_cleanup_completed(), which
attempts to re-acquire complete_lock.

switchtec_dma_terminate_all() also attempts to acquire complete_lock direct=
ly:

switchtec_dma_terminate_all()
    spin_lock_bh(&swdma_chan->complete_lock);

Since spin_lock_bh is not recursive, would this result in a deadlock?

>  			desc->txd.callback =3D NULL;
>  			desc->txd.callback_result =3D NULL;
[ ... ]
> @@ -529,8 +529,8 @@ switchtec_dma_abort_desc(struct switchtec_dma_chan *s=
wdma_chan, int force)
>  		res.residue =3D desc->orig_size;
>  		res.result =3D DMA_TRANS_ABORTED;
> =20
> -		dma_cookie_complete(&desc->txd);
>  		dma_descriptor_unmap(&desc->txd);
> +		dma_cookie_complete(&desc->txd);
>  		if (!force)
>  			dmaengine_desc_get_callback_invoke(&desc->txd, &res);

[Severity: High]
Does this code have the same deadlock regression as switchtec_dma_cleanup_c=
ompleted()
since complete_lock is also held when switchtec_dma_abort_desc() invokes the
callback?

>  		desc->txd.callback =3D NULL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010124348.1905=
5-1-wsa+renesas@sang-engineering.com?part=3D7
