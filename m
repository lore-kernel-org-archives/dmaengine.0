Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B357E3D5666
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 21:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186657; cv=none; b=pESgIUoNLqV1VlCwNQt9q4GBtYrF8kCobkQF6N3l8jJWrQQFHrB7yTljHbDgD+wgKxrdxqtzZvlY6SqH28OR+Sz28qCr3AcKlmY9cFXTOnx1DYAPiRCPLF1hE5gW4egMDyB3QT3G00e/S2tEJsDLMhNMT7rZPKwz1B/MrGeOwTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186657; c=relaxed/simple;
	bh=DASkxreBR5dJ3sFMsu7dWlG4rebbk8ZAuL36/abZit8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q6UIxvowPahT2/kE+b/lN/L0iNXlpsJe9N8YeIpZ9igYtNEU7Yg/zTHWCTV0shcoL32wOma9rMmm6tDK5FMS2/KQatdvqeWRLUEwEjPSTu51CPxvhPl10BqBv4cswaFPJAp2A/XPt5olix4nfcFGUFKAB8WpRhHCsIR3hO5+G44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKKzSPJn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKKzSPJn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68801F000E9;
	Mon, 27 Jul 2026 21:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785186656;
	bh=rvsa+IVEpyFo0CJOduCssr+bDbNEUn4KKOWB8DYNhxA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fKKzSPJnuOFuE8H1jDORg1Ow/FyxHxB6s+FTWr7EHuaPmw9/MFEfw0gby/lsj2dGX
	 HzxZYjPqHnUxi5Mcv7cpgV0HT1yTWZgF1m2MHCjM3DcGjFQG9MW2i8Y5jscClR8Fpa
	 jf1otlY+5DuT4DFnzJyJOzxr/e7Q2E7xnfVChFgzIXNc/qErBGS1iRWRIxE/a0pzGa
	 WsGdEBxQn1I5I3o8w83XRxU5vkeaBVlx/8n/tnX0d33E82OazUiudQUdLmDyYEfoqV
	 JW23qWXSEIJNAk7vIfw1KQRSXjP556DoaOVtP1HFbkZ2k1Ox+wBwtPJWVrSngQmmPD
	 8uxO8Xxdomurw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 41/64] dmaengine: hsu: kill vchan BH on teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Allen Pais" <allen.lkml@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <5fb51b38a020076248ec76bf643825ea9ca81b8a.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com>
 <5fb51b38a020076248ec76bf643825ea9ca81b8a.1785183549.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:10:55 +0000
Message-Id: <20260727211055.C68801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch series structure breaks `git bisect` due to a build fa=
ilure in the `hsu` driver.
--

--- Patch [41]: [PATCH v2 41/64] dmaengine: hsu: kill vchan BH on teardown =
---
commit 53bdccad0464307508ef64c4477dc5f1414579fd
Author: Allen Pais <allen.lkml@gmail.com>

dmaengine: hsu: kill vchan BH on teardown

Use dma_chan_kill_bh() for virt-dma cleanup.

> diff --git a/drivers/dma/hsu/hsu.c b/drivers/dma/hsu/hsu.c
> index f62d60d7bc6b7..1a7f9df735a43 100644
> --- a/drivers/dma/hsu/hsu.c
> +++ b/drivers/dma/hsu/hsu.c
> @@ -500,7 +500,7 @@ int hsu_dma_remove(struct hsu_dma_chip *chip)
>  	for (i =3D 0; i < hsu->nr_channels; i++) {
>  		struct hsu_dma_chan *hsuc =3D &hsu->chan[i];
> =20
> -		tasklet_kill(&hsuc->vchan.task);

[Severity: Medium]
Will this series structure break git bisect?

If the earlier commit "dmaengine: add tasklet-backed channel BH helpers"
removes the task member from struct virt_dma_chan, any kernel checkout
between that commit and this one will fail to compile if the hsu driver is
enabled because it still references hsuc->vchan.task in hsu_dma_remove().

Should the series be reordered so that affected drivers are converted to us=
e the
new API before the task member is removed?

> +		dma_chan_kill_bh(&hsuc->vchan.chan);
>  	}
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785183549.gi=
t.allen.lkml@gmail.com?part=3D41
