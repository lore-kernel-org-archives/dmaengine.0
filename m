Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795864490;
	b=j9EWPgXL3aYqgjGKex3wh+YBhNpj6u9bBYdPiam9Ql7/JY/RLHnjEqct5osGdWi4tKn8
	 F3rQwNFvYi5eD3ajS69g2kQOWn05JQsBXDvkqx21Zna5OoVSYGAop9WfKF5TJBHuWpQWc
	 +lJi/ocIZbIUgld+IKGo2dOaoD2zLxnUl/p4nDAmKOXEFrWEpPjy5J8PVMFBQSxyMUM6t
	 zL7pvvbEwJSuRWqXcojp6Rd2IZ/GTUoeXQXUU27gBbumkEY92U8OZzPEO1uiyMi4ZeYVS
	 jcCtKCtdyQfo5KXMeDQhL2wIlLSsQHaZmOkDJS6q5dd/xbzsmCEzQKFmPv01gzUHr0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795864490;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=w60korkLhHQT2VJ0nh9m46ubK0kSyIA3HuVm/hY63HA=;
	b=RLSyuUUEurF/Rf3/1HjWeutsNUBXN7fMyv/idx+K4qNfNnAae/XtCHU93J47FqZCDqT2
	 mviK3hV+KuuUuxjSDfrODMlpWEZrZitUeahyKBWokEIG587Oocn98m3dnXqPfnE5IUjvT
	 3Dd49RKjD2s9dSa8ODopZJwB4T9CG9ZpUtpVdxW7vOYOnJ1WGPQGOUmVK6oUcnO/vsfHN
	 7kfxLFNP4u6vAK3ONFlCVrGLqBS+PrXxXYdq+hVzT5a9hr2Ijf9D5axpN56a4RhR5AS57
	 lgFcnvWBfZT297Kuwh6GvkDcD2kj8gmEosJRPSQJW+/BmF3VY35CIclIttO961ZOCsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VicaLT+0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651BC606A31F
	for <dmaengine@vger.kernel.org>; Sat, 28 Nov 2026 11:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VicaLT+0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAED11F000C1;
	Sat, 28 Nov 2026 11:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795864490;
	bh=w60korkLhHQT2VJ0nh9m46ubK0kSyIA3HuVm/hY63HA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VicaLT+05iSbHQxrF5LbEGcYkh/cJqadNvl1Ju+zp7bBZ/8twcyrzpkWgZ80PUPEz
	 T8Tx364LPhbVKQnTWlTA+xxHSoNduYWWIQJM8b7y8lLO+X2tGB7aZtnLnvLvymXiqn
	 f4PHlav3cnj3Szp2e361HzACe/2GQ1CuId815nIYshMPakfGpcQ4H1LV7bXqFaCX/A
	 ZMTBTMPC4edMYJxymgho2VDNKDY0JTdocbHPUu74+S8/Rd61W67GeEMI1hKAlMG8ks
	 EqQJGnW6Vy7CiX0NzTzCahJxCO3nc97E+lHl3EPsHYT52ycSBMc5rf+PQG6T++zZxE
	 dbKvDzW3pFupw==
Message-ID: <sashiko-outbox-238652@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dmaengine: ti: k3-udma: Withdraw the DMA providers
 on removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tian Xuechen" <202300460064@mail.sdu.edu.cn>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261128110224.875369-2-202300460064@mail.sdu.edu.cn>
References: <20261128110224.875369-1-202300460064@mail.sdu.edu.cn>
 <20261128110224.875369-2-202300460064@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 11:14:49 +0000
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
- [Critical] dmaengine: ti: k3-udma: missing workqueue cancellation in
  udma_driver [1]
--

commit c1fb8f8e2baaa454720ded377f244f55b66ebe93
Author: Tian Xuechen <202300460064@mail.sdu.edu.cn>

dmaengine: ti: k3-udma: Withdraw the DMA providers on removal

This commit switches the DMA device and OF DMA controller registrations in
udma_probe() to devres-managed helpers so they are unregistered on driver
removal.

> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index 75bd1977fb423..1349585711b80 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c
> @@ -5619,7 +5619,7 @@ static int udma_probe(struct platform_device *pdev)
>  	/* Configure the copy_align to the maximum burst size the device suppor=
ts */
>  	ud->ddev.copy_align =3D udma_get_copy_align(ud);
> =20
> -	ret =3D dma_async_device_register(&ud->ddev);
> +	ret =3D dmaenginem_async_device_register(&ud->ddev);
>  	if (ret) {
>  		dev_err(dev, "failed to register slave DMA engine: %d\n", ret);
>  		return ret;
> @@ -5627,11 +5627,9 @@ static int udma_probe(struct platform_device *pdev)
> =20
>  	platform_set_drvdata(pdev, ud);
> =20
> -	ret =3D of_dma_controller_register(dev->of_node, udma_of_xlate, ud);
> -	if (ret) {
> +	ret =3D devm_of_dma_controller_register(dev, dev->of_node, udma_of_xlat=
e, ud);
> +	if (ret)
>  		dev_err(dev, "failed to register of_dma controller\n");
> -		dma_async_device_unregister(&ud->ddev);
> -	}
> =20
>  	return ret;
>  }

[Severity: Critical]
This problem wasn't introduced by this patch, but can unloading the module
leave ud->purge_work or uc->tx_drain.work pending after devres frees
struct udma_dev [1]?

udma_probe() allocates ud and its channels with devm_kzalloc() and
initializes ud->purge_work (udma_purge_desc_work()) and uc->tx_drain.work
(udma_check_tx_completion()), while udma_driver has no .remove callback
and registers no devm action to cancel them.  If the module is unloaded
while either work item is queued, the worker can run after devres frees ud
and cause a use-after-free.

[1] https://sashiko.dev/#/bug/linux-ab017a54-94b4-4224-b85f-161bcb4066df

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128110224.8753=
69-1-202300460064@mail.sdu.edu.cn?part=3D1
