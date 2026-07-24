Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C623385B6;
	Fri, 24 Jul 2026 10:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889693; cv=none; b=BGEIXRSGo5Gn25ByHmbOz3UscKx54xkEKffUsiSl+NtznRT/4zjI3hR487194L3JYGqev/2RLm3fxpURMRFXYN+u6hr+R9ynsF8mULTzMScnQYfDl1Gs+3EMUKPqqeq4wvT15o5ZEMM2d52meG3wSFge144lWsFOQW9QLxx7OVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889693; c=relaxed/simple;
	bh=2V+lJlEIuU5z8p3iuVHex0DNpygaF7n3GDlwwSXqLcI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=geitxUSfkopQFlgu4Y0X77Lrbr3wmWvMhAwWqIensRzBHOJkJFEVBIF/fOV4DSmBmH2WSCWABZqBWjx24nJ7Z1tTRCkCj/EQ+mmN38DYPswQtG4RgfbL1nDbDyXPVQYxudeqjCP3hFvpLOZFP2eKiEXFk4keKpUiwBXqelf1T/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CilSYwFZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CilSYwFZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 095B71F00A3D;
	Fri, 24 Jul 2026 10:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784889692;
	bh=TYLYroIFb4i0mDI2ThGZs6WyAm+2+FmleC8GJuSLwZI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CilSYwFZg8q5CDLkwZgksdlOURz6ygSPhDYlxHQO17U4l18ot+y0jeiTq8tDSmp4E
	 FxtN39e26u8wNKxbTgOF4fb9qZdBilgf3Bue9oXupH4BdPcyFyirporeYSCRnER7uS
	 GR/M6mHrikjbI00F9Cp8lZIjbAAo081A64YNSeavO25ME03JnkAj9Jy4a7tgGBQLhA
	 VXZ23RPhlexRVUcMB1RZ5Cz4fpWv2NbgOXGXYi8USA6iG3m1pmyZ5pP32IJaJBzdV1
	 a7aJJEeBXRY0q5NuhDS7WcxilYiiZoRs62ZK4eGc9/waLTJMMzR/RgGGVPlHw6m+iL
	 LFXobYIttDDqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 07/19] dmaengine: ti: k3-udma: Add variant-specific
 function pointers to udma_dev
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724102115.2854-8-s-adivi@ti.com>
References: <20260724102115.2854-1-s-adivi@ti.com>
 <20260724102115.2854-8-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 10:41:31 +0000
Message-Id: <20260724104132.095B71F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete refactoring leaves hardcoded calls to `navss_psil_pai=
r` and `navss_psil_unpair` instead of using the newly introduced function p=
ointers, breaking variant abstraction.
--

--- Patch [7]: [PATCH v7 07/19] dmaengine: ti: k3-udma: Add variant-specifi=
c function pointers to udma_dev ---
commit 65cd7aad4943c26a3ba6403f632bcb28e9c153d7
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma: Add variant-specific function pointers to udma_dev

Introduce function pointers in the udma_dev structure to allow
variant-specific implementations for certain operations. This prepares
the driver for supporting multiple K3 UDMA variants, such as UDMA v2,
with minimal code duplication.

> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index 40ba114ac81dd..195ff948548c3 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c

[ ... ]

> @@ -3694,6 +3694,14 @@ static int udma_probe(struct platform_device *pdev)
>  		ud->soc_data =3D soc->data;
>  	}
> =20
> +	// Setup function pointers
> +	ud->start =3D udma_start;
> +	ud->stop =3D udma_stop;
> +	ud->reset_chan =3D udma_reset_chan;
> +	ud->decrement_byte_counters =3D udma_decrement_byte_counters;
> +	ud->psil_pair =3D navss_psil_pair;
> +	ud->psil_unpair =3D navss_psil_unpair;

[Severity: Medium]
Are there still hardcoded calls to navss_psil_pair() and navss_psil_unpair()
in this file that should use these new function pointers?

For example, in udma_alloc_chan_resources():

	ret =3D navss_psil_pair(ud, uc->config.src_thread, uc->config.dst_thread);

And in udma_free_chan_resources():

	navss_psil_unpair(ud, uc->config.src_thread, uc->config.dst_thread);

There are similar direct calls remaining in bcdma_alloc_chan_resources() and
pktdma_alloc_chan_resources(). Will this bypass the variant abstraction and
potentially cause a NULL pointer dereference on future UDMA variants that l=
ack
TI-SCI PSI-L support (where tisci_psil_ops might not be configured)?

> +
>  	ret =3D udma_get_mmrs(pdev, ud);
>  	if (ret)
>  		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724102115.2854=
-1-s-adivi@ti.com?part=3D7
