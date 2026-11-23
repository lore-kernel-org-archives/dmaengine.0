Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446575;
	b=cvMdeRvHxts5YgjGTjg91+mwvj/KLnn+6RDdiz3ckBLqXe6BNX16m8tQRWQ7RTV7M28k
	 qx21rmC0CT7NyzAz6insJTDbZIa5Mvvojp6PlAPEkdv2RgYS7u5ionE4DOkgZaTjn2K2u
	 fj07Zb3KdI4MPeG6PiBD4/EWsegf7dEYoqNLblXTq1TV2MFukqh/PAxhUwNTJLMeqAAkw
	 0VyNWi78QFjaRdEe+t3p+HD4eZpCejWjDXEMeM78v/YZHrUnMmD02MoOeasdc3RufHmaV
	 CD/LKQJbbbDcKCuCp/fFDvLpvOdYIiLMKZ0qbbOxxEYa2DNClQGpkCmP7/PZtOcLtgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446575;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wVXSdMeNEfqQBbJ5Sbtiolb3/XI7bF/YftxyzEeo27k=;
	b=FN8rJprC2ftoH07ahSBzeNAEoKqoGgX8nd0t5dx9g8a0sB4k6KqAhWXm44NbUhY+UByg
	 vFjouyqQhaj/owBFy6y57UTX11LL9Do8tb+Q1Ew1sjCgKoCOZpbrYRXp2DnYGHwn0y7ly
	 Z/DSUV3dsmNIHxtg7+L0pNVF0dodpoeCpGibNhP6xMDYP2xrR8f7jDWZX63Ukqe3/Zjra
	 /9HexfhchMe3TltvYg++Nw8Ft5MKlAebl4kHfneE7sjzgOY8XO4PEiuckLBef/xmIjZNp
	 k9Lpw9j4gXNBxFYhNnKltBHnrvifD1AOBJEEmX2fIWTjB9kIpkNFUuLId56QmwvAY2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oXwkw8rM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88E2606A31A;
	Mon, 23 Nov 2026 15:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oXwkw8rM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159F21F000D3;
	Mon, 23 Nov 2026 15:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446575;
	bh=wVXSdMeNEfqQBbJ5Sbtiolb3/XI7bF/YftxyzEeo27k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oXwkw8rMqaLSGOtTgEQl/wh5QIGuP2rN+fhqUELJ/1WqqmpnvzCWGGcKrgjSY17P1
	 xJGFexJ/zwF734DjZWpCFPnDMfT0JpgGJHdIAhu2Rgpp136nY5olZatXjm7fNUI6y5
	 5lKWGP9YfOTWLvPDUC4kmMGy7Ihv4a8pNMKK2LKgwMKuu39+ASX/ELHCRHAIYVQjWX
	 KIkUw6jPISdS38ve89H7qoTry+MkndZxyJKJG+5qIUuH4VoMHMh7HSd/IKrAPUd3BH
	 JN2y4ZI7dESZoxPIvCKZAzKM5LZC4mheZXQmo6trddh5shedcCgF4w5G86TnVh6LuZ
	 Bmq6Y1nYvwORw==
Message-ID: <sashiko-outbox-229500@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/28] dmaengine: bcm2835: Add NO_WAIT_RESP,
 DMA_WIDE_SOURCE and DMA_WIDE_DEST flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrea della Porta" <andrea.porta@suse.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261123145728.29082-4-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-4-andrea.porta@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:09:34 +0000
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
- [Medium] dmaengine: bcm2835: stale c->dreq flags used in
  bcm2835_dma_prep_dma_memcpy()
--

commit 05a74b3bafa3990da181e6875af63b349a17f80c
Author: Phil Elwell <phil@raspberrypi.com>

dmaengine: bcm2835: Add NO_WAIT_RESP, DMA_WIDE_SOURCE and DMA_WIDE_DEST flag

This commit adds support for the BCM2835_DMA_NO_WAIT_RESP,
BCM2835_DMA_WIDE_SOURCE, and BCM2835_DMA_WIDE_DEST flags encoded in the DT
DMA dreq cell and applies them when preparing DMA descriptors.

> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index 690f5ba1c4399..118ba2f71dc8b 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c

[ ... ]

> @@ -605,8 +620,9 @@ static struct dma_async_tx_descriptor *bcm2835_dma_pr=
ep_dma_memcpy(
>  {
>  	struct bcm2835_chan *c =3D to_bcm2835_dma_chan(chan);
>  	struct bcm2835_desc *d;
> -	u32 info =3D BCM2835_DMA_D_INC | BCM2835_DMA_S_INC;
> -	u32 extra =3D BCM2835_DMA_INT_EN | BCM2835_DMA_WAIT_RESP;
> +	u32 info =3D BCM2835_DMA_D_INC | BCM2835_DMA_S_INC |
> +		   WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
> +	u32 extra =3D BCM2835_DMA_INT_EN;

[Severity: Medium]
Can bcm2835_dma_prep_dma_memcpy() inherit stale c->dreq flags from a
previously released DT slave channel?

c->dreq is only set in bcm2835_dma_xlate() and is not cleared in
bcm2835_dma_free_chan_resources() or bcm2835_dma_alloc_chan_resources().
If a DT slave channel with upper flag bits in c->dreq is freed and later
allocated by a non-DT DMA_MEMCPY caller via dma_request_chan_by_mask()
(such as vc4_dsi_bind() for 4-byte register writes in
dsi_dma_workaround_write()), bcm2835_dma_prep_dma_memcpy() will program
control blocks with unintended 128-bit transfer widths or without
BCM2835_DMA_WAIT_RESP.

Resetting c->dreq to 0 in bcm2835_dma_free_chan_resources() would avoid
leaking DT flags across channel allocations.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123145728.2908=
2-1-andrea.porta@suse.com?part=3D3
