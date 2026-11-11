Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794368374;
	b=k9cVSkuiFk2ZQHYfKSSfliBq44PAeM/3G9FkH/dZZMmkUaoRG20KNoQCNYlRnQ8JxLn3
	 1oh+9qFrWwJQyPtOfgWtnvPpzWZj73A2Y6e9jXfp9ocmcpWaZ317Xr5yWXz9b8QNW8iHJ
	 7lrSRv1XnQ1fV0Jb0IZSZJw5jkk/01+GfYXvi30PYYYMvHxAQjIVQBTn2H0et2figFV5B
	 i28qD/m4jafzKsjFUyV/tSDVLaTuTLERn5jgKj994fO/qcmteqTlqzT1Q2gzevw+Z5K7w
	 VsMbGggxWZiV048h7sRBrIOBaoXj0goy+l0BlDfOmBQW1PN3L5iNDi95vbV19xSQddQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368374;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=l2c2fFzOfzjySeAipItHl+f+wvlC3hKWM3P0lTrOgEU=;
	b=wiFkkhVqyMUfIEn8kLkb7N12CzO/IPgjTgmuLsugykfBKFy+S9ngUFwo0cCOwYMqLmsI
	 gafvC5VSq7WRHBuS7dyxo+Qcmcb7ALiHdR+1lyMHoC8Sz7YshTXgGjwKQjqUSYm/+gxKY
	 7LCbsj6RSRbyhHZ7GHR1SsJ1L7VA2661BEeT4Tsltu7q63gR7EW/5Pb20EAwrkaIp/X/S
	 YzSEviYDDo9acPf8wCYkO+5mUGOoIDzEpcYNBu5g0KhDehJ8nQI9zN1/XuWSvHhc4KNFu
	 cS15jrjXTVUzjGEdZG7mjjbwB7psEAk5vRrY2k/Wy9wXgKTAzvyn+PEbWqcpRQljz2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EFokUFlU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030A1606A31C
	for <dmaengine@vger.kernel.org>; Wed, 11 Nov 2026 03:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EFokUFlU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 572D51F0089F;
	Wed, 11 Nov 2026 03:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794368373;
	bh=l2c2fFzOfzjySeAipItHl+f+wvlC3hKWM3P0lTrOgEU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EFokUFlU1UHPTOTN/1wWccrpWwUzVw/TRsvcKIWuZx8LB79etP53B5sfEzJ4FBrSU
	 Km4VutlSMIZMhp3gAOXw76eYz0kut6Xz/oOjuLSBVwhQS6lbg4NG7N0PTtBa1WeheH
	 YEJ56tmYGQc125iFECj08BMubrFqVfWOO6KxTnPFf3zwwTN1C4unMACgN3z6GYHfMO
	 6wmNTBeKv36h+sjJ/KNCflkWAIQSFulqy0GoeKJt8qcrCQuBVmrfxe/5Tf3iatfsky
	 I2DJh6FCpdBrQH/R5T+hpUClziRKRhKj/6SR0LzNY1cZ24BKqCQkf/Onf764mhSZIt
	 mf6dE/Cx8B01g==
Message-ID: <sashiko-outbox-208213@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] dmaengine: dw-axi-dmac: preserve pending pause
 requests
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261110-submit-dw-axi-dma-stop-pause-v1-v3-4-35fdfba8b61d@gmail.com>
References: <20261110-submit-dw-axi-dma-stop-pause-v1-v3-0-35fdfba8b61d@gmail.com>
 <20261110-submit-dw-axi-dma-stop-pause-v1-v3-4-35fdfba8b61d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 03:39:32 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dmaengine: dw-axi-dmac: stale chan->cyclic across alloc,
  error, and prep failure
--

commit 9842b102714b426daae54ae8ebc997ef84ba1d86
Author: James Hilliard <james.hilliard1@gmail.com>

dmaengine: dw-axi-dmac: preserve pending pause requests

This commit tracks pending channel suspend requests, active descriptors, and
deferred cyclic restarts so pause and resume operations do not lose
hardware suspend acknowledgments or race with transfer completion.

> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma=
/dw-axi-dmac/dw-axi-dmac-platform.c
> index bb305ab94d02b..6f15fcb790a80 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c

[ ... ]

> @@ -543,6 +548,10 @@ static int dma_chan_alloc_chan_resources(struct dma_=
chan *dchan)
>  		pm_runtime_put(chan->chip->dev);
>  		return -ENOMEM;
>  	}
> +	chan->desc =3D NULL;
> +	chan->pause_requested =3D false;
> +	chan->is_paused =3D false;
> +	chan->cyclic_restart =3D false;
>  	dev_vdbg(dmaengine_chan_dev(dchan), "%s: allocating\n", axi_chan_name(c=
han));
> =20
>  	return 0;
> @@ -1087,6 +1096,8 @@ static noinline void axi_chan_handle_err(struct axi=
_dma_chan *chan, u32 status)
>  	vchan_cookie_complete(vd);
> =20
>  	/* Try to restart the controller */
> +	chan->desc =3D NULL;
> +	chan->cyclic_restart =3D false;
>  	axi_chan_start_first_queued(chan);
> =20
>  out:

[Severity: Medium]
Should dma_chan_alloc_chan_resources() and axi_chan_handle_err() also reset
chan->cyclic to false?

chan->cyclic is only cleared on a successful dma_chan_terminate_all(), and
neither dw_axi_dma_chan_prep_slave_sg() nor dma_chan_prep_dma_memcpy()
resets it.  If a prior dma_chan_terminate_all() timed out or was skipped
before channel release, or if a cyclic transfer fails in
axi_chan_handle_err(), chan->cyclic stays true.  Any subsequent non-cyclic
transfer then takes the cyclic branch in axi_chan_block_xfer_complete(),
which skips vchan_cookie_complete() and clearing chan->desc, leaving the
completed descriptor on vc.desc_issued, blocking further queued descriptors,
and re-enabling the hardware channel.

Similarly, dw_axi_dma_chan_prep_cyclic() sets chan->cyclic =3D true before =
the
dw_axi_dma_set_hw_desc() loop and leaves it set if the err_desc_get error
path is taken.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-submit-dw-=
axi-dma-stop-pause-v1-v3-0-35fdfba8b61d@gmail.com?part=3D4
