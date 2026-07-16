Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5D8344D92
	for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 20:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784234693; cv=none; b=pT3it5lZbQ5kCrWhp2XylgyZkEC3YnpudAIrVwTZICvzdgkcKFS5B1zM0Z59O5RMED0uM4CWtr+X9SF1aIZyR9Cl4rK4E1OPArccYAbWh7JgshINwXb2FIrtTSM/mci/6eKiQdGAjb5WzzEsXg4wS9ZdfER7guzyEiV0k6mdGoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784234693; c=relaxed/simple;
	bh=IsPmV62nWUTz5EH2rvYF0JyGSw+tw7PO2ynsIsee4NQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GQMt6e693MPjzrf4CIUNk3lCL/CxLMehcDON8aHef7q6sIrur/ItLJ5I1NzGPWZ4zDSKpKJXBeDYsTpnsUziwQWIiOJ3+sbRH61G5L8j/1bfUnCFswhsFnLB352ZCfbp4w7rI5/ojevPuaLCdFWznvLP6dTBnwCukv5ugu0483Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owgePKUh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owgePKUh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE17C1F000E9;
	Thu, 16 Jul 2026 20:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784234692;
	bh=sPmOG+oxznfd9Z1D7rPFLvQdHFLtYbAYUwHi0pYdctE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=owgePKUhLOiuUitxVu/dn4ZmGqPkPImpcsQmemh8xdzRg2VTnFkEjhhxDH83GXuFp
	 s0R/KnA9gv+X38RkIlDQk3cGLBsA6kCgOyNjJjbQvzppUxaN6WjDbObseSr41bKKQi
	 QXE+l1+I1KCQbm4T1YBzLkWgJQ5dou1MI9GOI/Epk3IgcfbTl0Z/2jFo+XKYQfgpOM
	 WZ4ls05Rrq3QMmR4syg742DhtJ6hzEEc5GhDCLZ0bSMRhQY0h09QDbzFQLJRQS1vu0
	 gWtSoLaGo185O1YjCIJlfVAKMR3x2og4yvUSz/Us8VvjDo7s3RGJvyoNV/c2fHwAuc
	 LBWRTZXiVqIBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2 1/4] dma: fsl_raid: convert descriptor stores to
 big-endian
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260716202949.677290-2-rosenp@gmail.com>
References: <20260716202949.677290-1-rosenp@gmail.com>
 <20260716202949.677290-2-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 20:44:51 +0000
Message-Id: <20260716204451.DE17C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Bitwise OR operation on a __be32 field using a host-endian constan=
t introduces data corruption.

Pre-existing issues:
- [High] Incomplete endianness conversion for command descriptor blocks lea=
ves the driver broken on little-endian platforms.
--

--- Patch [1]: [PATCHv2 1/4] dma: fsl_raid: convert descriptor stores to bi=
g-endian ---
commit 4b4dfb0a314d465959f6268650dc8a30d7c69bd2
Author: Rosen Penev <rosenp@gmail.com>

dma: fsl_raid: convert descriptor stores to big-endian

The descriptor structs (fsl_re_cmpnd_frame / fsl_re_hw_desc) are
in-memory but their fields are __be32, because the structures are handed
to the device as big-endian. The driver stored CPU-endian u32 values
into them directly, which is both wrong (the engine would see
byte-swapped lengths/addresses) and flagged by sparse as a base-type
mismatch. Wrap those stores in cpu_to_be32().

Fixes: https://lore.kernel.org/oe-kbuild-all/202008111749.yy85rFMD%25lkp@in=
tel.com/

> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 99945845d8b5e..2778d07a05e86 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -242,9 +242,9 @@ static void fill_cfd_frame(struct fsl_re_cmpnd_frame =
*cf, u8 index,
>  	u32 efrl =3D length & FSL_RE_CF_LENGTH_MASK;
> =20
>  	efrl |=3D final << FSL_RE_CF_FINAL_SHIFT;
> -	cf[index].efrl32 =3D efrl;
> -	cf[index].addr_high =3D upper_32_bits(addr);
> -	cf[index].addr_low =3D lower_32_bits(addr);
> +	cf[index].efrl32 =3D cpu_to_be32(efrl);

[Severity: High]
Since this function now writes a big-endian value to efrl32, doesn't this
cause a regression later when a host-endian bitwise OR is applied?

In fsl_re_prep_dma_genq():

	/* Setting the final bit in the last source buffer frame in CFD */
	cf[i - 1].efrl32 |=3D 1 << FSL_RE_CF_FINAL_SHIFT;

Since efrl32 now contains a byte-swapped value on little-endian architectur=
es,
won't this host-endian bitwise OR place the final flag in the wrong byte and
corrupt the lower bits of the length field?=20

The same pattern also occurs in fsl_re_prep_dma_pq().

[Severity: High]
This is a pre-existing issue, but while you are fixing endianness, should t=
he
cdb32 field in the command descriptor blocks also be converted?

For example, in fsl_re_prep_dma_genq():

	xor =3D desc->cdb_addr;
	xor->cdb32 =3D cdb;

And similarly in fsl_re_prep_dma_pq() and fsl_re_prep_dma_memcpy(), a
host-endian u32 is assigned directly to the __be32 cdb32 field. Doesn't this
leave the driver broken on little-endian platforms?

> +	cf[index].addr_high =3D cpu_to_be32(upper_32_bits(addr));
> +	cf[index].addr_low =3D cpu_to_be32(lower_32_bits(addr));
>  }

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716202949.6772=
90-2-rosenp@gmail.com?part=3D1
