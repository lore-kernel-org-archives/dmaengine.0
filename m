Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C339D42902E
	for <dmaengine@vger.kernel.org>; Wed,  2 Sep 2026 21:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788386104; cv=none; b=dFc1kw9cS0NhDWKwcFsxqs5peIKH9B5/dBuBD6kIEzGan0JpC4RsHIqZRcAWemvgK9e6rd+65Z41Xuyg8NMVl3Uumd9p9HJRI8VIk+ZW56fwZiMwOFRxp4L7vnCv3iq6cZdbkYwotu1Yw4tkxCuR6b9qr1SRNLKx9C+tierfYco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788386104; c=relaxed/simple;
	bh=zAOPgcFI2i84cOx3MewgHPVoIVXF7gp8Ld61iw+0DIM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bGn05p1jiaJXb61iekl/2uXqaONg4CKGnB1uCkPfk3by8p8wnY1eP3h/VtiUp9OLFgtlfd+8DTFrGMv5BFqC6dODb+D/9m9k0HKvEUUgQeMMeQZ7Ftz6ZT+V/m99zYEqnCtqeLRC710TOAzycQUUrkgbcATtOZouuAgLJNL2Ims=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PAOCVBLG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PAOCVBLG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2079E1F000E9;
	Wed,  2 Sep 2026 21:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788386092;
	bh=/SIv8Vcedir9UTBZvWVYwauwCii8lAPbJcgLKyLdgxI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PAOCVBLGYBUwEwEWCaiPNmeOKzcptMjFA5dvgxwFBsSKkXkLFpXtbMLGZS8IbVmbN
	 mfWFP61Vji6m52W03HMBMAtFJiN0nQmuyWN5vMXuTPgE6X/MPiu5wa4n9A4vnzRa1g
	 B1wfxK1xWwh/mkT061i4f8U4+aGNA8O77D4J0jMU2+U4pj7+oEEVdPeqiAxbUeM/Cz
	 3wHSbFV5RQr1a1R3bhy5MZE8W999A0qFHEJMPMOvsxNiPf2I5ba9l0qKmuELlqnLXj
	 JT1eOqtOF0MMCNRTRZr1v9whrkztlXnVEa8Q4sC73Pp1VDhILKX6hXYCXSLK11Ro7J
	 6Ahqkm8daZqxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] dmaengine: bestcomm: ioremap early
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260902214612.311207-1-rosenp@gmail.com>
References: <20260902214612.311207-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 21:54:51 +0000
Message-Id: <20260902215452.2079E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The globally exported `bcom_eng` pointer is freed but not nullifie=
d on the probe error path, leaving a dangling pointer.
--

commit c9ef17db56df7b3bc923fc0c2ee2b7acf55e223b
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: bestcomm: ioremap early

This commit replaces the open-coded resource lookup and cleanup in the
bestcomm driver probe and remove paths with the managed
devm_platform_get_and_ioremap_resource() helper, simplifying error handling.

> diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestc=
omm.c
> index 432b43520ddc9..44ff4a42376b1 100644
> --- a/drivers/dma/bestcomm/bestcomm.c
> +++ b/drivers/dma/bestcomm/bestcomm.c
[ ... ]
> @@ -439,10 +422,6 @@ static int mpc52xx_bcom_probe(struct platform_device=
 *op)
>  	return 0;
> =20
>  	/* Error path */
> -error_unmap:
> -	iounmap(bcom_eng->regs);
> -error_release:
> -	release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
>  error_sramclean:
>  	kfree(bcom_eng);

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for the global
bcom_eng pointer to be left dangling here?

On the error path when mpc52xx_bcom_probe() fails (e.g., if
bcom_engine_init() returns an error), kfree(bcom_eng) is called but bcom_eng
is not explicitly reset to NULL.

Could local system drivers (like those in drivers/net/ethernet/freescale/)
calling exported functions such as bcom_task_alloc() bypass safety checks
since bcom_eng is not NULL, and proceed to dereference freed memory
(for instance, when attempting to acquire bcom_eng->lock)?

>  	bcom_sram_cleanup();

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902214612.3112=
07-1-rosenp@gmail.com?part=3D1
