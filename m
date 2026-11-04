Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829095;
	b=hXojWOZHQF9yKduBH1mUBP0bEOeZtpPJMm0AEKAfVedivfFDsX+jz5UzdfOOKgY+i+dY
	 /JKm4/231jNMT4p9X+6dlR6/hmSbQ6JF4MYsR7wSDOufsBlHtCnwSwTC4LG/ZNdYbPsb8
	 pLADZonlpppypjS5riRbWtMrbs6I4L38AHptQ1VG5kU1/tPuZKT0LJF9q3vdnm6W91Wsc
	 46PAniCxPbSqBhd/Cl+S4oXNXAR807GIhi+ZQj7a6XKXbgWIBeHKRZm8pQYj2fmGcnehN
	 PHWEXQjXomRYKzgooykdWhROgbDdMvFMGsB6km6zyd1d5WS7eAeSa2cgjYUwyOZ46tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829095;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1rZasBo16xO1MtoKEPHKYvMpUtxECpTa6vHG3YccqbM=;
	b=YqvjyfI0YGxcr9eDkVsZGBf6KRviCyTdyz8SjgyEhji1snUlIS7KDlfMU0qqD5yKNMDq
	 vqJjn/DvK1ZonHNV7wdpo0sr3X5A0sknbJKaY0RdFmZvjkTGx5xnVqNN8MrMXgm35OT0h
	 WXlvHByeKmy54v1ukMJdMVPqTKwj/pbM7IUviaR5X2GZxaG523nmfy+mT/Z/6uUz9ofgQ
	 jaWt8p02KoUsOgsnEhIXf39JSt009MCPQIsRga6ziATZgslXKAAct9CNNskiQ7ovuZKRx
	 2BEcBUMCeAkO6c0/l1fo39nvEQExW15KRr2ZJUDlg8of1ZbT54j/PBiOxXwth3hDSPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jNa88aT5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85026070318
	for <dmaengine@vger.kernel.org>; Wed,  4 Nov 2026 21:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jNa88aT5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AAD91F00A17;
	Wed,  4 Nov 2026 21:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793829094;
	bh=1rZasBo16xO1MtoKEPHKYvMpUtxECpTa6vHG3YccqbM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jNa88aT5m2NEEYzuLib9nBhnapkAYgz+FaRxH5GI3AVKrnit2t8eA99/7BUe3siBr
	 NyTra7Ukk/47domlw66pymSc5fYL+Q5vn1RMub5vmMjr5vqPOm+IoJ8WRh3oqtcAOl
	 alLWUdDfXi6M7nJmlZwDBfRr+iMBJh6DEv2SfDNeEIR3O69vZE3p2exYyrCwpOMvTL
	 vibWrLgfhcvoAkWMvLGjEv0KwG0GwC6VCgONHG74ptDT549a5gVi1j4sawQM+9SBr6
	 UM7IxQEFxDpj/Q5PE4SU7PskDiDgieR191iH1Uhj0DwNyv3PKLT3WMc1gItnILcnIN
	 +MNTVQqEZSQWg==
Message-ID: <sashiko-outbox-198158@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: pl330: Bound UNTIL loop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugen Hristev" <ehristev@kernel.org>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261104-b4-pl330-until-v1-1-b541929da163@kernel.org>
References: <20261104-b4-pl330-until-v1-1-b541929da163@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 21:51:33 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dmaengine: pl330: second MMIO read in UNTIL() can miss transient=
 state
--

commit ec02cf0a6d8895f26c57f9c3aaba3b3bd470e676
Author: Eugen Hristev <ehristev@kernel.org>

dmaengine: pl330: Bound UNTIL loop

This commit bounds the UNTIL macro loop with a timeout budget and checks its
return value in pl330_start_thread() to prevent the driver from hanging if a
bus fault leaves a DMA thread stuck in a transitional state.

> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index c2d0b473b8f48..9ced60fef9ffb 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -248,8 +248,15 @@ enum pl330_byteswap {
>   */
>  #define MCODE_BUFF_PER_REQ	256
> =20
> -/* Use this _only_ to wait on transient states */
> -#define UNTIL(t, s)	while (!(_state(t) & (s))) cpu_relax();
> +/* returns true if state reached within loop budget */
> +#define UNTIL(t, s, loops) \
> +	({ \
> +		unsigned long _l =3D (loops); \
> +		while (!(_state(t) & (s)) && _l) { \
> +			cpu_relax(); _l--; \
> +		 } \
> +		!!(_state(t) & (s)); \
> +	 })

[ ... ]

> @@ -1059,12 +1067,24 @@ static bool _trigger(struct pl330_thread *thrd)
> =20
>  static bool pl330_start_thread(struct pl330_thread *thrd)
>  {
> +	/* msecs_to_loops(5) gives the same budget used by _until_dmac_idle */
> +	const unsigned long tout =3D msecs_to_loops(5);
> +
>  	switch (_state(thrd)) {
>  	case PL330_STATE_FAULT_COMPLETING:
> -		UNTIL(thrd, PL330_STATE_FAULTING | PL330_STATE_KILLING);
> +		if (!UNTIL(thrd, PL330_STATE_FAULTING | PL330_STATE_KILLING,
> +			   tout)) {
> +			dev_err(thrd->dmac->ddma.dev,
> +				"pl330: thread stuck in FAULT_COMPLETING\n");
> +			return false;
> +		}
> =20
>  		if (_state(thrd) =3D=3D PL330_STATE_KILLING)
> -			UNTIL(thrd, PL330_STATE_STOPPED)
> +			if (!UNTIL(thrd, PL330_STATE_STOPPED, tout)) {
> +				dev_err(thrd->dmac->ddma.dev,
> +					"pl330: thread stuck KILLING->STOPPED\n");
> +				return false;
> +			}

[Severity: Medium]
Each invocation of _state(thrd) performs an MMIO readl() of the hardware
status register (DS or CS(thrd->id)).

In UNTIL(), after the while loop exits because (_state(t) & (s)) matched, t=
he
macro performs a second MMIO read via !!(_state(t) & (s)) to compute the
return value.

In pl330_start_thread() under PL330_STATE_FAULT_COMPLETING, UNTIL() waits f=
or
PL330_STATE_FAULTING | PL330_STATE_KILLING. Because PL330_STATE_KILLING is a
transient state that automatically transitions to PL330_STATE_STOPPED, what
happens if the while condition observes PL330_STATE_KILLING and exits the
loop, and the hardware finishes transitioning to PL330_STATE_STOPPED before
the trailing !!(_state(t) & (s)) read executes?

Wouldn't the second _state(t) read return PL330_STATE_STOPPED, causing UNTI=
L()
to evaluate to false and making pl330_start_thread() report a false timeout
and fail to start the thread?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-b4-pl330-u=
ntil-v1-1-b541929da163@kernel.org?part=3D1
