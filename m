Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61078376BC2
	for <dmaengine@vger.kernel.org>; Wed,  8 Jul 2026 02:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783478447; cv=none; b=ZPiOSPb7+gVIOGy5zxyMnfvtEs+ykkLO481yvvknFVZHOTXCtS8tlg8ro+9axdwApsshkQaBkdhS9NX0JM9tYVbJsYDxbYPHprX0yYK5OI9kLStY/7CUnxGdEoYRUHV43IJZQ6U7NwdS0XTfH69VX7FoZseoWquKBeqpSnzFWF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783478447; c=relaxed/simple;
	bh=yEjeclicVMLZmnnSFc5qeJgl3FwcTC2FEf9Pn3BMlyM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FVMoQMK5IdMot6YCDsAgTp36GeZjNhEUimek6+RSoWpD7qx27crmzG/gQlC1Od9MtY07joQaFXBMIYiaz42WubAugWNo691yQIcEoRSEVOpHy2aFMA+Cdmp5o1rk/ywhvNITAJ7/KqMndPPq7mLgXZKNtgMANhbXpgAAWNUREQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YqdEnR5u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqdEnR5u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01AA1F000E9;
	Wed,  8 Jul 2026 02:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783478446;
	bh=/HgBN/pEr/YIPgVXDWVVmy4GC0wPs/BWiRdntxdt6mw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YqdEnR5ulxG3hPD+hqfWOeH3gVPgb6RZWwhD8kwDHt78tcthNGxPiJWyAn1ivq5s6
	 ii/hUH3AdnPM2G2p1um1K0IywypGsdLoS2m6BE3t61s35EXoqW1zUpWsssd7lM4any
	 ljYmtQDzb4gqvCx8hWtImKuzWzJYlUcJBKfMF7rGbw37PG5w6yumh8r/PtgyFDZpEG
	 EVydIfq+NzVXJvf36OR1Yq9maDkjEQRHoAbfWh8HF7k8NCbFSdmpq2xhgBH+m5arUC
	 du4j4n85J9frfibWCkk+18WOyFmytPgeaM17qc2TO81izb5jqXs+HP8HWI+cnGai1u
	 o00AJuVHxWVNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dma: at_hdmac: Fix use-after-free by proper tasklet
  cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongling Zeng" <zenghongling@kylinos.cn>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260708023035.27194-1-zenghongling@kylinos.cn>
References: <20260708023035.27194-1-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 02:40:45 +0000
Message-Id: <20260708024045.F01AA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Mismatch between commit message and implementation regarding lis=
t_empty() check
--

--- Patch [1]: [PATCH v3] dma: at_hdmac: Fix use-after-free by proper taskl=
et  cleanup ---
commit e5bf642ad51db020b1e407d27b314f3478d2609a
Author: Hongling Zeng <zenghongling@kylinos.cn>

dma: at_hdmac: Fix use-after-free by proper tasklet cleanup

This commit addresses a use-after-free vulnerability in the cleanup and pro=
be
error paths of the at_hdmac driver. It ensures free_irq() is called before
killing tasklets and freeing other resources, properly synchronizing with
running IRQ handlers.

Closes: https://lore.kernel.org/all/20260604073945.54B311F00898@smtp.kernel=
.org/

> Change in v3:
[ ... ]
> - Replace incorrect channels.next !=3D NULL check (always true after
>   INIT_LIST_HEAD) with proper list_empty() check
[ ... ]
> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index e5b30a57c477a..044a0fb38b7a9 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c
[ ... ]
> @@ -1940,6 +1940,20 @@ static void at_dma_off(struct at_dma *atdma)
>  		cpu_relax();
>  }
> =20
> +static void at_dma_cleanup_channels(struct at_dma *atdma)
> +{
> +	struct dma_chan *chan, *_chan;
> +	int i =3D 0;
> +
> +	list_for_each_entry_safe(chan, _chan, &atdma->dma_device.channels,
> +			device_node) {

[Severity: Medium]
This isn't a bug, but the v3 changelog explicitly mentions replacing an
incorrect channels.next check with a proper list_empty() check. Does this
function actually implement that check?

While list_for_each_entry_safe() inherently handles empty lists correctly,
making an explicit check functionally unnecessary, there appears to be a
direct contradiction between the stated changes and the final code.

Should the commit message be updated to reflect that the check was simply
removed entirely, or was the list_empty() check accidentally omitted here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708023035.2719=
4-1-zenghongling@kylinos.cn?part=3D1
