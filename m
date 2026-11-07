Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794089975;
	b=nctj1hCHBe41p2AfB7mx2fxrAHtP+mxG5sw9u616dMETpGySkG9uYvQ+n2VVdz95G2I+
	 WsZdezBUSnkCmaKm+lNUyIPgE9XSF8FgTWumQvx4UA1GpVGD49W6HplITD27D2Rd8h02M
	 NSRbyhPrM2UiLzjd28g54vvuYo3ROir4d8jvM2RyxNg/ttxfcxk1UuFuD/FfvnHkllOzx
	 eYqIboFoyRdu6lQf8z+kZCR9zt+rkwWV5JhdctCVr7P22KwZWImSIThsCKtfrjG6AmHok
	 dSAEXNlbAjZmBk4Lp/dPkIi9Ib32FpCVKv6FlG315JhCqazSJCks8NjyFezvgLw+4iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794089975;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6yTshcC+kMNtusEXrIUTVAXfstX6kUxzoCO1/pFNKRs=;
	b=xsSy3WaXn7/1+CTjxN4/WLpQHi8s7SRqQhzyAfVGvuz5f0ZdKU9lEsRLrcNGiy4dajLK
	 4P0rOuSzXbHr/H2x+MRW3lBQjGRlUpNjFcRirp5tqnzEhIKxDO2EIUVmQHr5/TDv0qgMg
	 +BcuVPx1mjjZgYRSzpWiVEn483BMwxob1adt3zXxcS2D3iQ0lxEDCw8pJwG0gBoAlkibN
	 fHncnChSMiWT6iTuHC25g34aioLMIS6XWW8lzPM4qf7iOmbm6Jm1DWAmDLWh8xF7qOiqM
	 fjzANcPhHfYK3e45WaXs1lY1N72AWqc3MvrsR6Ek9ZyAA+agNgegb72s0xM79HPY+wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ly3ZAZ8Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D557606A32C
	for <dmaengine@vger.kernel.org>; Sat,  7 Nov 2026 22:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ly3ZAZ8Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B44F1F0089F;
	Sat,  7 Nov 2026 22:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794089975;
	bh=6yTshcC+kMNtusEXrIUTVAXfstX6kUxzoCO1/pFNKRs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ly3ZAZ8YQw+Ul+WtXey20Xbml7522/DY6Yqk8sN8U0w2pTP61ZUJ5P0A43i6HhqBK
	 SvrkjuFaGndqefThHD9Uy9ZO34AIKIWdfq7J08SE9ptfByRf4xfHeKi28sfwCeS6cH
	 gdYuJV7NiT2a5Rwo7xHo9Vx1pPVSUbzwKZhP+GXAdFgXBLqu4+VM7SLDKFgv1WSNtR
	 cMtQEPHqhAOz3QYzqRuOxhKZ2/DFipHo+ohtEBMBZv336Cf4glMYRfHWWE1os68/mJ
	 xqU5pmfwka4vQTZb1Ynv/Reedepks3160Wk2z4xBv40LK6Er8bc7jtSubWAImXhqov
	 lrBx7qpGpBzGQ==
Message-ID: <sashiko-outbox-203364@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: qcom: hidma: avoid world-writable channel
 sysfs files
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hungyu Lin" <dennylin0707@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261107221500.96825-1-dennylin0707@gmail.com>
References: <20261107221500.96825-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 22:19:34 +0000
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
- [Critical] dmaengine: qcom: hidma_mgmt: kobject leak and UAF in
  hidma_mgmt_init_sys() [1]
--

commit 44ad6eea44504d623e4ff527b7da4680661c450d
Author: Hungyu Lin <dennylin0707@gmail.com>

dmaengine: qcom: hidma: avoid world-writable channel sysfs files

This commit restricts the per-channel priority and weight sysfs attributes
in hidma_mgmt_init_sys() from world-writable (S_IRUGO | S_IWUGO) to 0644.

> diff --git a/drivers/dma/qcom/hidma_mgmt_sys.c b/drivers/dma/qcom/hidma_m=
gmt_sys.c
> index 9672ef9ee8fc0..53b991752e805 100644
> --- a/drivers/dma/qcom/hidma_mgmt_sys.c
> +++ b/drivers/dma/qcom/hidma_mgmt_sys.c
> @@ -265,13 +265,13 @@ int hidma_mgmt_init_sys(struct hidma_mgmt_dev *mdev)
>  	/* populate parameters that are per channel */
>  	for (i =3D 0; i < mdev->dma_channels; i++) {
>  		rc =3D create_sysfs_entry_channel(mdev, "priority",
> -						(S_IRUGO | S_IWUGO), i,
> +						0644, i,
>  						mdev->chroots[i]);
>  		if (rc)
>  			return rc;
> =20
>  		rc =3D create_sysfs_entry_channel(mdev, "weight",
> -						(S_IRUGO | S_IWUGO), i,
> +						0644, i,
>  						mdev->chroots[i]);
>  		if (rc)
>  			return rc;

[Severity: Critical]
This problem wasn't introduced by this patch, but does hidma_mgmt_init_sys()
leak kobjects and leave dangling sysfs attributes on failure or driver
unbind [1]?

If any step in hidma_mgmt_init_sys() fails, it returns without calling
kobject_put() on chanops or mdev->chroots[i] or removing previously created
sysfs files, and hidma_mgmt_driver has no .remove callback to clean them up
on unbind either.  Because the attribute structs, names, and mdev itself are
allocated with devm_kmalloc(), devres frees them on probe failure or device
unbind while the sysfs files remain exposed, causing a use-after-free when
userspace reads or writes those attributes.

[1] https://sashiko.dev/#/bug/linux-68f0e3d9-2e4a-4922-9d34-c92a40fad2aa

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107221500.9682=
5-1-dennylin0707@gmail.com?part=3D1
