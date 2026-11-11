Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794435981;
	b=2DbxqcTVCSpnFeiDIFyPrTa0kWnYZSjN+c7tYMh9fOHRhHSyfghZAwXcWoY4ICgst2Fr
	 nDTW/xh8iOt3M/4+2/Inuqw29Yhn0oxj8mSaTe5hbzIt81nT7o5fjhOSNgzQ7MtU7ojL0
	 MWFMXjKFNuwoguEvRxxSJsOLot5AXZamZd5+HLp1e8UuEoGbLVJKkcTK8qAnjqDvXjkn6
	 nQq5jKVDsePDVphy2/9PYXKJog+PlbInQUvEjf4VIFUjyh1RMKe/zJ7OR/njWR1AwiEHV
	 aQu96e27K3or+gwTIpL7FPTaqDSf79ezCdhODzU0pcVtOovh636vkt54yIKEqWIRmAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794435981;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qifDE77Ev2v6Kj1nQ0JfjCV5EXBkywh03NTqONcjmu4=;
	b=ws/3qSwV+uJjMYgG4BXwbSemRDTkevslA9ci+FMOJaMnMZuCPfKQAgIi56++pqg8PFJQ
	 R8SnzXP7EVrB7+ZSkKijVjPMXopc42Ytr1PK3y2Mkhb7U1KRHNj7dZf5Byhg7KsBlLPgc
	 4dlp9rswRHu2LQkMxPiTbKBWNi8P0gnOW3rxnaD4Sm7CcyQcWraWdpeB83u8gT0CWQWu/
	 PhZJk7huW/LGAoBpIu5rp4TjW09FPzl0sFGTRkB2XnvZmxH/BlwJjANExN227HcYRcj7G
	 BtOGVJeV06jSWYzdVR7CLayLnljYlv/KO44770RuuIi89mqm7jD9gNM2G0xzjLvUqHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BBWR1wnH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72358606A31C
	for <dmaengine@vger.kernel.org>; Wed, 11 Nov 2026 22:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BBWR1wnH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FDF71F00A05;
	Wed, 11 Nov 2026 22:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794435981;
	bh=qifDE77Ev2v6Kj1nQ0JfjCV5EXBkywh03NTqONcjmu4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BBWR1wnH7shZIOZ4tzA9o6myQrr+ovp8j2N/PhWONl3gUjGheKw388WER9MwOp90O
	 3JkQrj0kjzxDMKJuUuGJCgCSINdtHxxmfvcCI6FJ871O8gAAehEWSMZfImJiZI1JCz
	 fitj4bgNsPRr1kHfCY9nnfVMw5Svsfgzfx3gs+DuBv/WpD2/lc7roRFt/XKM2auiIo
	 wJy2QZ0tXYbt+XtI+LthFNgJtc/c8EiFDV3xAwQfg3g+a1l1ih00DmnvKnPKz32hHI
	 hWN7vabsKO8PxZ/vSXjleuEukgUqNhgDjNDdYmQeFjPnuSKybsQ+I71FJPmBdaOSyP
	 DbFQHuGG7ndSA==
Message-ID: <sashiko-outbox-209787@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/10] dmaengine: jz4780: Fix descriptor cleanup on
 hwdesc setup failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261111215349.1983909-10-lee@kernel.org>
References: <20261111215349.1983909-1-lee@kernel.org>
 <20261111215349.1983909-10-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 22:26:20 +0000
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
- [Low] dmaengine: jz4780: Fixes trailer cites wrong introducing commit
--

commit 689fd02184422d0b30aad68612dbfd11c23b8306
Author: Lee Jones <lee@kernel.org>

> dmaengine: jz4780: Fix descriptor cleanup on hwdesc setup failure
>=20
> When jz4780_dma_setup_hwdesc() fails in jz4780_dma_prep_slave_sg() or
> jz4780_dma_prep_dma_cyclic(), the error paths pass &jzchan->desc->vdesc
> to jz4780_dma_desc_free() instead of the newly allocated &desc->vdesc.
> This leaks the newly allocated descriptor and either dereferences NULL
> when jzchan->desc is NULL or frees the currently active descriptor while
> it is still in flight.  Furthermore, jz4780_dma_desc_free() derives
> jzchan from vdesc->tx.chan, which is not yet initialised before
> vchan_tx_prep() is called.
>=20
> Initialise desc->vdesc.tx.chan in jz4780_dma_desc_alloc() and pass
> &desc->vdesc to jz4780_dma_desc_free() in the preparation error paths.
>=20
> Fixes: d894fc6046fe ("dmaengine: jz4780: add driver for the Ingenic JZ478=
0 DMA controller")
> Closes: https://sashiko.dev/#/bug/linux-b39121ef-5ffb-401a-9d04-0afccd467=
bde
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

[Severity: Low]
In d894fc6046fe ("dmaengine: jz4780: add driver for the Ingenic JZ4780 DMA
controller"), the preparation error paths did not call
jz4780_dma_desc_free() at all.  The broken
jz4780_dma_desc_free(&jzchan->desc->vdesc) calls before vchan_tx_prep()
were added later by fc878efe84c3 ("dmaengine: jz4780: fix resource leaks
on error exit return"), so the Fixes tag should be:

  Fixes: fc878efe84c3 ("dmaengine: jz4780: fix resource leaks on error exit=
 return")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111215349.1983=
909-1-lee@kernel.org?part=3D9
