Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAF43FFD;
	Wed, 26 Aug 2026 01:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787708411; cv=none; b=CGAtEqoHMcXir5uZ2QWC06merRiQONb4hKFSHyVzcIBxTy0n5vsGtNfMuEn730yvdepNsNLZmCl5nReIN89Sr9dsPJbgyqyEZh8W3SmCOgAA2VHqDbfTkez6Kn8W2Xr4ahtycVej5ag6ieEaoAUqzRhx5EHo+uC7UyfGfz9N8Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787708411; c=relaxed/simple;
	bh=WGCRpi6orOk9UOwttd24zXQ/uBCPf/x+jG+t6ezr62o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=De+7oIJZrf5ZtjMXJV79PfSy2wS+Xp6UUD2yEUEYD+4dvBKLxkeOLjTAHLVFRN5NHtEc3NnPT8yUgSUYVOLzcSzIwMYZNqoYVtF03YB+7/RITsSKEg0NPa23BAHAMf/+TPU0gjsSgBUfizXi/56ha1L+GW+rSVQgesDl8SVBxQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJXrCxcL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJXrCxcL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE29C1F000E9;
	Wed, 26 Aug 2026 01:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787708410;
	bh=2gOPYDtPV0Bmv7oHe9KJcm/+v3l4157k0yD31GuqKSs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RJXrCxcLjEcvA3ntnlq3NYvITIappZ5kbw+BVZUj/WzQickR0Oo61MRD4NsVVHE+F
	 mBIHuimyROcPF6Mx4ilH4g7rP72wtybd5E9nGGitVwsAxl4e6L9ieDnsS6F+nUbAwC
	 kBADh+vBZwzZw5iUvfZw9wbdFd+/3YIRGPnVVPsdvj5g+N4kuDd5JEqLdH27hLUb+4
	 rjq6ytXBjllGD3B5lG2F02JN4Yo+Qa4MQlIcCh3a6uPRfiE0DsSLateqqzt5hYxcok
	 wpgk9pUq0Pv6HaiSVIyFGuhcE48gTbAqRMeTPsr4vx/Yi0iPgVj52hKXdlTFlXl0JU
	 3epZDCRylwUcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/5] dmaengine: sun6i-dma: Support variable address
 widths using masks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yuanshen Cao" <alex.caoys@gmail.com>
Cc: linux-sunxi@lists.linux.dev, vkoul@kernel.org, dmaengine@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260826-sun60i-a733-dma-v4-2-dc2f745f40dc@gmail.com>
References: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
 <20260826-sun60i-a733-dma-v4-2-dc2f745f40dc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 01:40:09 +0000
Message-Id: <20260826014009.BE29C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Local redefinition of standard kernel macros `field_get` and `field=
_prep` instead of using the generic implementations from `<linux/bitfield.h=
>`.
- [Low] The newly introduced `field_get` macro is never used.
--

commit f2482b50c417768080bd7de168d315dbd88b3be7
Author: Yuanshen Cao <alex.caoys@gmail.com>

dmaengine: sun6i-dma: Support variable address widths using masks

This patch updates sun6i_dma_set_addr() to use masks for high-address bits,
allowing the driver to support variable address widths for newer Allwinner
SoCs. It also introduces local field_get and field_prep macros.

> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index f305fbfb35453..53c54161e32a9 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -24,6 +24,10 @@
> =20
>  #include "virt-dma.h"
> =20
> +/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> +#define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1))

[Severity: Low]
Is this macro actually needed?

Looking through the rest of the patch, field_get() doesn't seem to be used
anywhere.

> +#define field_prep(_mask, _val)	(((_val) << (ffs(_mask) - 1)) & (_mask))

[Severity: Low]
Could we use the generic implementations from <linux/bitfield.h> instead of
defining field_prep() and field_get() locally?

Redefining these core kernel macros creates a namespace collision, bypasses
the standard bitfield type-safety checks, and risks a build failure if
<linux/bitfield.h> is ever included in this driver.

Additionally, unlike the standard kernel macros, these custom versions
evaluate their arguments multiple times.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-sun60i-a73=
3-dma-v4-0-dc2f745f40dc@gmail.com?part=3D2
