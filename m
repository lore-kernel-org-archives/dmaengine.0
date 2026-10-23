Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792726161;
	b=VV1SVgVG+nprVhB2trnntMrQRC0ikS473baVDPQzQN3jJ14Cxs+mugRs0pDu6gm7rr2T
	 DMOnS1UFkvkibP5UwwUinh2l6J1k7q7E1m5naqLCLUHxJrtBBtei93Khh/YETY8Efxq9S
	 r8zRZN9CwcVdrTGEd7R7+P9of12YJCVnSuXf8TDHYk3t7S4IbVL0yy+QBzsO3u7pXw33M
	 /xiTr1i27j0YyOdJjHPCRM0BzEpt9iodFM8swqjmZrPhO98PCw0YP/zFSg93c9sueWhmZ
	 ncJq9zkO0XlZm7G89Y5I7SkL4mr4CelGuTCfnPLeL24Qy3Gzkewu9Onhd8sFPEghXhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792726161;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4efaqNWbhFidhIfyEU3qcV79MwYWAxEDO7wFGEZtXAA=;
	b=CwTHYTEFfe3t54Y5iPVKpuQQF30MINh7M7bOi/VZF+dghL5HNCjXGY8+mzGoXtDKVasq
	 xmIAZn+Zh6U++D2Vbwz3LMkAongtaJqUbJZj4A2pl+n7Bamaj0qNPZP+FXm7EapeUzHM1
	 juV2i4MJzmIUa4scRxi0shTUjyr7+5PWqUawhH6tsd6BSp/Wf4r6EOgQdqfAnFI5JL427
	 gSF1YtOiEWaqI7SMiiGoRSc2UTLL4cEdpBOpdtGANhAGAroIHODP6mKN/VoGTBYhkGE5r
	 yCRuHHpzksF3NSDoEVvreJj4J0hD67g5tWfo50EkjsXGk/0gTiM6vqeSy68Zp5JXmmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VIjNy5r+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD6A606A31D;
	Fri, 23 Oct 2026 03:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VIjNy5r+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E201F01829;
	Fri, 23 Oct 2026 03:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792726160;
	bh=4efaqNWbhFidhIfyEU3qcV79MwYWAxEDO7wFGEZtXAA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VIjNy5r+4vDUxJ0HohoTr5sPNG4T4+T/5ipyUdoWqQNeCtv24W3oPnQ03VzTuavun
	 6U1g1sRNo7XrSZ3LkFfJOeDuzhS9NXHuq+ELmzeiiQznacac8wDv0THmMl76FpW3oz
	 9Z4lC4cqI9FL33QX/aSM4AaAsHhUIbwKcyFY81AoRZSAbcrX750GFaXJTAzZ8lR9eC
	 vpMQjQcrIGHYvk9PmRcCS7dAkHnVnUn+PVgIHjkQLxNF3xeXyo3p9cFvCIQp1YNBRB
	 AaDgKD1tFRES9n+GMARSYXnSM5btjtvk0Ugp6eYVIy3jA8PbdIB6gQ6DlxGoMeVScS
	 cGHkQJdSdpkYw==
Message-ID: <sashiko-outbox-182268@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] dmaengine: sun6i: track paused virtual channels
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-sunxi@lists.linux.dev, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-4-01085f684c9f@gmail.com>
References: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
 <20261022-submit-sun6i-dma-lifetime-next-v1-v1-4-01085f684c9f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 03:29:20 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dmaengine: sun6i: UAF and pchan starvation in sun6i_dma_tasklet() =
when paused
--

commit 668628da200a577f2488b0d26796212d9a34a3f9
Author: James Hilliard <james.hilliard1@gmail.com>

dmaengine: sun6i: track paused virtual channels

This commit adds pause state tracking to virtual channels in the sun6i DMA
driver so sun6i_dma_tx_status() reports DMA_PAUSED for incomplete transfers
and paused channels do not start new descriptors or enter the pending queue.

> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index cd0562de7def1..7ac6693a041eb 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
[ ... ]
> @@ -538,7 +539,7 @@ static void sun6i_dma_tasklet(struct tasklet_struct *=
t)
> =20
>  		pchan =3D vchan->phy;
> =20
> -		if (pchan && pchan->done) {
> +		if (pchan && pchan->done && !vchan->paused) {

[Severity: High]
What happens if a non-cyclic descriptor completes in sun6i_dma_interrupt()
just before or concurrently with sun6i_dma_pause()?

When a non-cyclic transfer finishes, sun6i_dma_interrupt() marks the cookie
complete and sets pchan->done:

drivers/dma/sun6i-dma.c:sun6i_dma_interrupt() {
	...
	} else {
		vchan_cookie_complete(&pchan->desc->vd);
		pchan->done =3D pchan->desc;
	}
	...
}

vchan_cookie_complete() places &pchan->desc->vd on vc->desc_completed and
schedules vc->task (vchan_complete()). That tasklet runs independently of
vchan->paused and frees pchan->desc along with its LLI pool entries via
vchan_complete() -> vchan_vdesc_fini() -> sun6i_dma_free_desc_virt() ->
sun6i_dma_free_desc().

Previously, sun6i_dma_tasklet() always entered the pchan && pchan->done blo=
ck
and called sun6i_dma_start_desc(), which either replaced pchan->desc with t=
he
next issued descriptor or cleared pchan->desc and pchan->done to NULL before
detaching pchan from vchan.

With the added !vchan->paused check, sun6i_dma_tasklet() skips this cleanup
completely while the channel is paused. Doesn't this leave pchan->desc and
pchan->done holding dangling pointers to the freed struct sun6i_desc, while
also keeping the idle physical channel pchan pinned to the paused vchan and
starving other pending virtual channels in sdev->pending?

If a caller then queries sun6i_dma_tx_status() with a non-NULL state for a
submitted-but-unissued cookie (on vc.desc_submitted, which vchan_find_desc()
does not search), vd is NULL while pchan->desc is still non-NULL:

drivers/dma/sun6i-dma.c:sun6i_dma_tx_status() {
	...
	vd =3D vchan_find_desc(&vchan->vc, cookie);
	txd =3D to_sun6i_desc(&vd->tx);

	if (vd) {
		for (lli =3D txd->v_lli; lli !=3D NULL; lli =3D lli->v_lli_next)
			bytes +=3D lli->len;
	} else if (!pchan || !pchan->desc) {
		bytes =3D 0;
	} else {
		bytes =3D sun6i_get_chan_size(pchan);
	}
	...
}

Won't sun6i_get_chan_size(pchan) then dereference the freed pchan->desc and
walk its freed txd->v_lli chain?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-submit-sun=
6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com?part=3D4
