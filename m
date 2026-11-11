Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794436017;
	b=KuO4APd2yynFlVLDEe4PKboAZnvWYfpwdAfValIJ1bLtJe5xx1+loQwGfnhCKDKCcJvY
	 9a8KvLJO/2uk6NhLSL9HAiZD1mG3TXS3f5G4uCrdipqJknaQ8Xb9Lnvh8wL3wczCHFFNf
	 NWkTC3kyFUhqxkBl59xa8z5gYTL/JxTsmzBRCG2zbrYtdAg4eHxLPDaj1bk/klynFyZeZ
	 15oosH7KEqpLsv1fgl7nWc3euLV5SCipnAiZoPoHelYeKrylRWAb78++HV6Nwwr0vIhJD
	 GnEPuWNR4+VKUN+KwB30rW8WN1fAFwFwiF0Kp1uJvTY0HVHJtXA9k+qBkRLkDLMn6CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436017;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WiUMZi2/AQVZvV9XMFn0NHbjDxrd+ndCRcRsOrKUyo4=;
	b=UwBRUUoescmMUipS/+rvIJiclBQ6HpMh2W/ExFvROmFR58QJO2ixYabBDu3GyQzQbMrS
	 EWVatdFgyqOmjg4k0TxthNRl+p5QJ1DJg3QMFe5qqtDSoVuxMq0/JrTYVFiqGe3YQWJEm
	 aveYevXjuwiJwnn1qMBzO2ll1FQARWouXYwjyql+ORARcGrNSjvBllOAc7AE82rBph+Jw
	 TWeJlwASRzX4dH260szTVNSlD8buuzcyJ35E+sa54N4hzRgRrenCtISHDVqBSBPvJGLcu
	 Q7hQx+LNlRwFk1wAln01KitpbyeuuHj/+dJOqU0/2M7XUi1Yui7cggnakOrjzefbxiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmVSQFBl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D3B606A330
	for <dmaengine@vger.kernel.org>; Wed, 11 Nov 2026 22:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmVSQFBl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22051F00A0A;
	Wed, 11 Nov 2026 22:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794436017;
	bh=WiUMZi2/AQVZvV9XMFn0NHbjDxrd+ndCRcRsOrKUyo4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nmVSQFBlWHFk0xFZJey8TX0D8PA2lDJ/ZdbTUB5Iui15QCG0mJOir9QDLjCzGEBrN
	 HXzroSUIIUeFIdID5BWSlCnl1wYmRFlG4aVCiKpLorljlyOD2qY16vFRoC1p3RDSS9
	 TBCGqKqMcYHtFBihf3lt+2+GGOkKxX0cuCwZA0HL+zPIk0SdsZFSXYC3F6hYrctxLy
	 8jusgnBpqK/CKzFWAiDv+ZVtzo07CFrScJdxr67bzJnBmkPTf0PgeQRiFeT9mSX/yP
	 QmofccEomiJ2bLvOStRyIZSGXJvue4HTw1WYqN1Foaq/8B4veuaadEkENgkKrR+QMa
	 K5jxtzaeJzaQw==
Message-ID: <sashiko-outbox-209788@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/10] dmaengine: bestcomm: Defer publishing bcom_eng
 until initialisation completes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261111215349.1983909-8-lee@kernel.org>
References: <20261111215349.1983909-1-lee@kernel.org>
 <20261111215349.1983909-8-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 22:26:56 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] dmaengine: bestcomm: use-after-free in bcom_task_alloc()
  [1]
--

commit 0c7452c3ef4427c8251608e31eaba52df094162d
Author: Lee Jones <lee@kernel.org>

dmaengine: bestcomm: Defer publishing bcom_eng until initialisation complet=
es

This commit initializes struct bcom_engine via a local pointer and defers
publishing it to the global bcom_eng pointer until initialization in
bcom_engine_init() has completed.

> diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestc=
omm.c
> index 241a91936fe8a..dbc3ce5fc4462 100644
> --- a/drivers/dma/bestcomm/bestcomm.c
> +++ b/drivers/dma/bestcomm/bestcomm.c
[ ... ]
> @@ -398,20 +402,20 @@ static int mpc52xx_bcom_probe(struct platform_devic=
e *op)
>  	}
> =20
>  	/* Get a clean struct */
> -	bcom_eng =3D kzalloc_obj(struct bcom_engine);
> -	if (!bcom_eng) {
> +	eng =3D kzalloc_obj(struct bcom_engine);
> +	if (!eng) {
>  		rv =3D -ENOMEM;
>  		goto error_sramclean;
>  	}
> =20
>  	/* Save the node */
> -	bcom_eng->ofnode =3D op->dev.of_node;
> +	eng->ofnode =3D op->dev.of_node;
> =20
> -	bcom_eng->regs =3D regs;
> -	bcom_eng->regs_base =3D res_bcom->start;
> +	eng->regs =3D regs;
> +	eng->regs_base =3D res_bcom->start;
> =20
>  	/* Now, do the real init */
> -	rv =3D bcom_engine_init();
> +	rv =3D bcom_engine_init(eng);
>  	if (rv)
>  		goto error_sramclean;
> =20
> @@ -423,8 +427,7 @@ static int mpc52xx_bcom_probe(struct platform_device =
*op)
> =20
>  	/* Error path */
>  error_sramclean:
> -	kfree(bcom_eng);
> -	bcom_eng =3D NULL;
> +	kfree(eng);
>  	bcom_sram_cleanup();
>  error_ofput:
>  	of_node_put(op->dev.of_node);

[Severity: Critical]
This problem wasn't introduced by this patch, but can mpc52xx_bcom_remove()
trigger a use-after-free in bcom_task_alloc() [1]?

While this patch fixes premature publication of bcom_eng during probe,
mpc52xx_bcom_remove() frees bcom_eng before clearing the global pointer and
without synchronizing against concurrent bcom_task_alloc() callers:

CPU0                              CPU1
bcom_task_alloc()
  if (!bcom_eng)
                                  mpc52xx_bcom_remove()
                                    kfree(bcom_eng);
                                    bcom_eng =3D NULL;
  spin_lock(&bcom_eng->lock);  <-- use-after-free

[1] https://sashiko.dev/#/bug/linux-149609ff-866f-4c27-8adf-ef935bca5f89

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111215349.1983=
909-1-lee@kernel.org?part=3D7
