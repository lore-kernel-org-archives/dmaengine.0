Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49573352020
	for <dmaengine@vger.kernel.org>; Fri, 24 Jul 2026 23:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784936158; cv=none; b=b71gw8y99tw/E63IX0j+/yeC8cGRwcA0bAFWKfXEo8j/blCt8MMGXK9cygYQDxGWSqWvMssMiwcxg8XDFk1rbfs4JHYvQ6+u2TQgqp5ZJ9hfQyYy6kwYFEbKLnQqjlH3QEC9AnMwsMSIgy40CPPDnLOK7vw7m/sNfbTW7Kv+CYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784936158; c=relaxed/simple;
	bh=rR6i4faiV6TxqN+vp5MEpwaUuH2istgSlPiEeLBJsM8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OZg4g1VLWSb+MhhUmwzkk/WkWbvwscW3s/AAR4T03kiMEBpB9QFxP+Mo1kNXwqhNF386A5CSjxNpcb5befr7HL+cLluM3ZNIjHkZqXWD51WJP/vVtu/RWuofNwKBhejkRKA6t+cgi+SQcqENyz1zK7MO2hh4vhX1c7KxaXYTVsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gEG2gR4r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gEG2gR4r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B4A11F000E9;
	Fri, 24 Jul 2026 23:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784936156;
	bh=HLZNuYDn/u7Kq3ycviFBas07x43B4w7mjndCUYnk9/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gEG2gR4rPH0Do3TFmjJQcoDCZB53soupoIBzSm2tI5LiMPZchKg5UxXpSB/xtQabt
	 9qKH1WBZhpUFZjzVPnkFw9B60EsjLm1gdbCRRYtCcs91hu0TKOCd9VDnMZcW3IRDHj
	 BBiY567RhY8hph23XPr8flZV1yU7rH/3/Hfjsx/1QyUt97oN+qeDlkyM5DYu4V/MeM
	 RitC1apCL4GfS4oYKlt7cI+/GTG62qaQxFPHGO8LLbMwl2tX3RrRY3Q2HviotV5RVV
	 Sy3libw04/7Wx+5gZ8xw5wnLcNVuFZGGmFFqmyNfDVowGWD7GmqUxOCChPGjutEaiT
	 g5UNLdL5lJDRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dma: at_hdmac: add device_synchronize callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260724232301.50237-1-rosenp@gmail.com>
References: <20260724232301.50237-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 23:35:56 +0000
Message-Id: <20260724233556.8B4A11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Adding `device_synchronize` is insufficient to fix descriptor sync=
hronization races because `atc_terminate_all()` still prematurely frees act=
ive/terminated descriptors, causing a Use-After-Free.
--

--- Patch [1]: [PATCH] dma: at_hdmac: add device_synchronize callback ---
commit cf29784e04ea139aef404987d19236faf066af03
Author: Rosen Penev <rosenp@gmail.com>

dma: at_hdmac: add device_synchronize callback

Implement the device_synchronize callback for the atmel DMA driver by adding
atc_synchronize() which calls vchan_synchronize() on the associated virt
channel. This ensures proper synchronization of pending descriptors when
requested by the DMA framework.

> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index e5b30a57c477a..96233eb7a3c6e 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c
> @@ -1616,6 +1616,13 @@ static int atc_resume(struct dma_chan *chan)
>  	return 0;
>  }
> =20
> +static void atc_synchronize(struct dma_chan *chan)
> +{
> +	struct at_dma_chan *atchan =3D to_at_dma_chan(chan);
> +
> +	vchan_synchronize(&atchan->vc);
> +}

[Severity: High]
This is a pre-existing issue, but does adding device_synchronize fully reso=
lve
the descriptor synchronization races?

When dmaengine_terminate_sync() is called, it first invokes
device_terminate_all() (which maps to atc_terminate_all()) and then calls
device_synchronize().

Looking at atc_terminate_all(), it currently stops the hardware and moves t=
he
active cyclic descriptor to the desc_terminated list, but then immediately
extracts and frees all lists:

atc_terminate_all() {
        ...
        if (atchan->desc) {
                vchan_terminate_vdesc(&atchan->desc->vd);
                ...
        }

        vchan_get_all_descriptors(&atchan->vc, &list);
        ...
        vchan_dma_desc_free_list(&atchan->vc, &list);
}

If the period completion tasklet (vchan_complete()) is concurrently executi=
ng
on another CPU, the cyclic descriptor will be freed out from under it. By t=
he
time atc_synchronize() is called to wait for the tasklet via tasklet_kill(),
the memory is already freed.

Can this result in a use-after-free when the tasklet calls
dmaengine_desc_callback_invoke() and computes an address based on the freed
pointer?

Should atc_terminate_all() avoid extracting and freeing the desc_terminated
list so vchan_synchronize() can clean it up safely after the tasklet finish=
es?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724232301.5023=
7-1-rosenp@gmail.com?part=3D1
