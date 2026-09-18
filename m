Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF3E4E73B3
	for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 14:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743317; cv=none; b=Sf7EgPkx9BhN1bn8ACDZ/F/t2kKbIQdOZnul20mlrJTlqe5NMFjfRNV99DHb3+Y5vaRi6NhafgruZs+s9cOUkRW8XdAbWcmzYiEBxOLzzPHAgCgIf7cn+0PkpH8Z4UKawvZbzMW8QB3ziI5ryi5MRL7xE8aQkN0bXF3ABN7+qwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743317; c=relaxed/simple;
	bh=ZL6cYPMJhXiIsT7Pc5akfvYGdMuxWucw5pjxHidtFM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HzpCdixgLTZWY9nl7LZY5CnHkminZtCSr329bDt38q3gDDE+RU8cD4LsmqRchz35/psxiL3IM/tUlZdBFT/bIvdiDU7QgMap0fky+yB0dL9/VK5c06aQGuuf8kOldBwH1qBn+IBDOmhsvHZoVg+jkyERqwEtsRlkzIoaK3sQPjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tzxdiwks; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tzxdiwks"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB5F1F0089C
	for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 14:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743314;
	bh=ZL6cYPMJhXiIsT7Pc5akfvYGdMuxWucw5pjxHidtFM4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Tzxdiwksdi3HM6Y8wIoOXU1RCocmsFRwdSDkOpZkNMuJ+NwnU97t1F/90zYlDILV9
	 7RBJPx5cJjcKXBNFXiKjSVxglvDLJj5Lx/FqseO34hjIuqAXD177qHGQ+mHb3rFaHD
	 UzNbpE3znTFsnaiy8FItdjgYu5qfBdcLr07ZsRrFVmGS1RFd8rGuHiivK3MAj7orJH
	 wGoTlXQRZgEXFFiXB/uOgs17eYFFnPMN4cnObo/MqbMWHaDDEEMt5x6ET6F9ufhBkU
	 /DTRWb7pAEA4axlYxQ8uv3YuhDIn9kROqKi5hkRWflsxoGETHTo4bzGq7k0k81pjjO
	 nC+8TYwe8hcng==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c5231570so457589e87.2
        for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 07:55:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxxhareqVEKVKY5HDoIVUHmnNpTx+l+YMyRqMaosZEmt6atsjrjlp2r1BaN2ogcyOCuS6WiPfofF40=@vger.kernel.org
X-Gm-Message-State: AFuF++lw91THRN48198zoIApXqSz/FU80DijZdYDE/6B/v6gUNowzlh7
	4rnHIZvrr34HJyI2n1PiKf8bDQl2meNb6YNbdZ2fXEN0eRFf1SjvQJHxj7g1t+W8t8mLLHfOl8j
	kcrs6Pw80Icx3aQtmox4QBloJwvxdKe0=
X-Received: by 2002:a05:6512:10cb:b0:5b6:e07:8f95 with SMTP id
 2adb3069b0e04-5b8c18057d1mr853526e87.24.1789743312600; Fri, 18 Sep 2026
 07:55:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-dmaengine-fixes-v1-1-7e10da1633c1@kernel.org> <aq1L-UJ4ehCj3aNS@SMW015318>
In-Reply-To: <aq1L-UJ4ehCj3aNS@SMW015318>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 16:55:00 +0200
X-Gmail-Original-Message-ID: <CAD++jLn8Eou7X+b7bnBjk0bFFvwOGfc3c_qS5r-eRj173N1_0A@mail.gmail.com>
X-Gm-Features: AcwNN1Xzdm-yovEjrE_eALR4htrFm9GqsM-Ch_mhVrcPq62JVjF5tfAtXusU2ac
Message-ID: <CAD++jLn8Eou7X+b7bnBjk0bFFvwOGfc3c_qS5r-eRj173N1_0A@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: Use unique debugfs names
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 4:34=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
> On Fri, Sep 18, 2026 at 11:15:14AM +0200, Linus Walleij wrote:

> > DMA40 registers multiple dma_device instances for the same platform
> > device.
>
> d40_dmaengine_init() ? I see just register one dmaengine device. I think
> it may have other problems.

It certainly has other problems because I have a serires of 21 patches
and counting just for the dma40 driver, haha :D

But this patch addresses a real problem.

They are declared together in struct d40_base.

Each gets its own channel list through d40_chan_init(), which points
every channel back to the corresponding dma_device:

d40c->chan.device =3D dma;
list_add_tail(&d40c->chan.device_node, &dma->channels);

All three deliberately receive the same parent device in
See d40_ops_init():

dev->dev =3D base->dev;

They are then registered independently:

dmaenginem_async_device_register(&base->dma_slave);
dmaenginem_async_device_register(&base->dma_memcpy);
dmaenginem_async_device_register(&base->dma_both);

Yours,
Linus Walleij
