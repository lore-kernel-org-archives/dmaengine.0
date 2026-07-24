Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD337432E64;
	Fri, 24 Jul 2026 11:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784890857; cv=none; b=LfY2WJodtwWut4UkC7mDb1Rr+jSYziDs/lXcIpWkbzeze8ZNJ8dqKFF5fRsMpkNUNchxrVZWiH4FmysRYO4OgkFhuv0kzYD0G4Mv2I5i+QwX8NqtEeYdXaEHXSWiAF1STNdIK7b18HsUFfNiTjPxELjxNHK0VqEdUQ00ljAB6Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784890857; c=relaxed/simple;
	bh=E/xuj6vnXo54y2rVYGSvFIsMtMRNmVOwPy7i2KEPz9w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rDr1kSfNDsW/PgzZqy0gXPiMsPkIWPlTFsTkppzuIVEBjAUcHDZfooYXZDJrxPYYXa7Akd9yvmkr0WZ2hUcgANydimcTFoVlok7I1JObxngbeAUF/ys7aCYWiAAB5aQZEqgt6/XBa6dNJ44M1xK0/AmRbx/q39OvFt+2jP5iPms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BMAGuXv9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BMAGuXv9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D70141F01808;
	Fri, 24 Jul 2026 11:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784890853;
	bh=fm+rLF6HVPABbPtIx+8pzb1XR7I5wiGmOuJeK/hrbiI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BMAGuXv9aktJC07cPbMqT4/xKBQMD9MneUKxuR4p0I/Byj6WBjE80IchwrBpnRdxc
	 jn8aenavw6rZ5jNkN+b17BxLm+JMBX9qq3PWx7xWqUxOgg9VZA8IQIvadjtWL1D1RZ
	 qYDxpqvH6UFwaBb4otnc3KdsqeqyQeNJNepmReU74jMyDl/F7jXQecsmgaolxZ3uDm
	 YlBYDDouFCUDZC2ejrBOdQ1KH3DoZgJDSGXE1v6crn8kLHkszXHdOhkTIUsLtQUuPy
	 Hg+2uGCjg4kzSOe4bbW86nwa5Az/mqiw8AzPDcVIWRqBCyatat2ClChPbU/mqRTGUC
	 FBAj/nC7Hliow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 19/19] dmaengine: ti: k3-udma: Validate resource ID
 and fix logging in reservation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724102115.2854-20-s-adivi@ti.com>
References: <20260724102115.2854-1-s-adivi@ti.com>
 <20260724102115.2854-20-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 11:00:52 +0000
Message-Id: <20260724110052.D70141F01808@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Time-Of-Check to Time-Of-Use (TOCTOU) race condition during resour=
ce allocation in `__udma_reserve_##res`.
--

--- Patch [19]: [PATCH v7 19/19] dmaengine: ti: k3-udma: Validate resource =
ID and fix logging in reservation ---
commit 86a1fdf2aa8a699bc22b0d6deb37073e3a9709cd
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-udma: Validate resource ID and fix logging in reservation

This commit adds bounds checking for resource IDs in the reservation macro,
returns -EBUSY instead of -ENOENT for in-use resources, and fixes the
resource name logging.

> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-com=
mon.c
> index d7c148ad694f9..dec4c2ed24e04 100644
> --- a/drivers/dma/ti/k3-udma-common.c
> +++ b/drivers/dma/ti/k3-udma-common.c
> @@ -2011,9 +2011,14 @@ struct udma_##res *__udma_reserve_##res(struct udm=
a_dev *ud,	\
>  					       int id)			\
>  {									\
>  	if (id >=3D 0) {							\
> +		if (id >=3D ud->res##_cnt) {				\
> +			dev_err(ud->dev,				\
> +				#res " id %d is out of bounds.\n", id);	\
> +			return ERR_PTR(-EINVAL);			\
> +		}							\
>  		if (test_bit(id, ud->res##_map)) {			\
> -			dev_err(ud->dev, "res##%d is in use\n", id);	\
> -			return ERR_PTR(-ENOENT);			\
> +			dev_err(ud->dev, #res "%d is in use\n", id);	\
> +			return ERR_PTR(-EBUSY);			\
>  		}							\

[Severity: High]
This is a pre-existing issue, but does this reservation logic contain a
Time-Of-Check to Time-Of-Use (TOCTOU) race condition?

If two networking drivers execute their probe or initialization functions
asynchronously, they could both call into __udma_reserve_##res()
simultaneously.=20

Whether using an explicit ID and calling test_bit(), or passing -1 and
calling find_next_zero_bit() later in this macro, both threads could
observe the same channel bit as 0. Both would then independently execute:

    set_bit(id, ud->res##_map);
    return &ud->res##s[id];

This would assign the exact same hardware channel pointer to independent
subsystems, which could lead to undefined behavior when both drivers attempt
to configure or transmit on the same channel.=20

Are these bit operations protected by a lock higher up in the call chain?

>  	} else {							\
>  		int start;						\

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724102115.2854=
-1-s-adivi@ti.com?part=3D19
