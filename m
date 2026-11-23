Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446323;
	b=GA1aWybxsonUOtb1RdpX2jUnxhGbt0zB9TPu8xsSVlC4DBFV8vx4a2KOeUSLpwifh48Y
	 amodBtLnq/LRMn3fsb1+QdOuQWW/p7UiqFR84bN888TCEjHac2B5S5Qand6zukjLj2jEI
	 6HqvWSn4ApS/eRASshycefqVCwUS068Y5Hf4g4dxDGxjDiW7GyY82eIoWBLxJaONI9gFg
	 vwjt49goMQw4RF3VBWYDVFwX7Mo3DX3OhF17kv3cq8RkOU6dLDGeYpMuogOnog4BDnSgd
	 EGce0qOIRsT3suMbMC3W4loZiog8jSGqRGxFoSHaRWY1d/Q6QgA2Cstb5B1LOGGCDXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446323;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GWqoA/UFyeq+TJq8T6CMtR/+9n963xrXddw0q5O4r1k=;
	b=Aviz6rVIuMciJCpn+DG8sedSHyJtr9BXGdf7/XVPamsoXq+edJJLiwZUVCI0yWsAv1uA
	 B0fy6LF3ZE+e7ENIpqOXi1fn86CEGpzj4zM7aErfLTDvtW0uHh5LtnNWBShp0ZpWSDoye
	 f4EUNf68qLiZfU6mKf4EGqdeKh5YyrA+00l6wDa01edZJ27tGTe2rjzDHzlTmVRZZ5Paw
	 FIwo+o+EnVTrOvIECcNYZvJOv2wzub4qSKah/s1/h72Wr/QbDIPWfNAna5YgRaazVRid8
	 G6sAWbA3oyZROHLi6+K3Aqo3q1OAjJ5g0tEIu9z8SC4J6EpwKE933XiZJUgOrhPPJ2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TzpqlwUK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B24606A31A;
	Mon, 23 Nov 2026 15:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TzpqlwUK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D281F000F4;
	Mon, 23 Nov 2026 15:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446322;
	bh=GWqoA/UFyeq+TJq8T6CMtR/+9n963xrXddw0q5O4r1k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TzpqlwUKGaEl6AB8ac73CXUbFHZF/9mOHLZjup1vG4NTEmQNQGdzTk+18j8rfeuR9
	 AUDceMtRB3++Bo9L6MDi79n1zHqRHnznqjDxE90myeDcztAI8VZbb468jYh4Y/o/cg
	 rNN/4rYIDKa2APlibLRrLgSm4RABmkcR2fj0olBSLJghDqK0PB+u6vN4klzrOhlmbw
	 YSavsmpMZM3ae1RpO8ZEShR9je/WzGWu3fQwD3HA6D9PUOiQS6hDuGoMAuHEM6OsAk
	 tFEPAcrnHrS8JNSbvh12W1SU6QjV44rnVXZbPVKFhFF6wf6C8UsF2BTBmbYRd+pcET
	 nBtX2gJ13nGeg==
Message-ID: <sashiko-outbox-229482@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/28] dmaengine: bcm2835: Fix coding style issues
 and a typo
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrea della Porta" <andrea.porta@suse.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261123145728.29082-2-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-2-andrea.porta@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:05:21 +0000
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
- [Low] dmaengine: bcm2835: commit message claims nonexistent typo fix
--

commit 90d915a14d82485dbf4682dc628270b622babb4c
Author: Andrea della Porta <andrea.porta@suse.com>

> dmaengine: bcm2835: Fix coding style issues and a typo
>
> Fix the coding style issues reported by checkpatch: use u32 instead of
> uint32_t, add the missing parentheses around macro arguments, which
> could lead to operator precedence issues, drop superfluous parentheses
> and long int, and align the function arguments. Also fix a typo in a
> comment ('missmatch').
>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

[Severity: Low]
This isn't a bug, but the "missmatch" comment typo in
bcm2835_dma_create_cb_chain() was already fixed by commit a688efea0f2a
("dmaengine: Fix spelling mistakes"), so this patch does not fix any
typo.  The changelog also omits removing the local variable d and the
chained assignment in bcm2835_dma_start_desc().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123145728.2908=
2-1-andrea.porta@suse.com?part=3D1
