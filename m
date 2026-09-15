Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3422935F5ED
	for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 07:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789457879; cv=none; b=P9QxhcgzBeAcd3tRy429L4JG8oVBohE3LthY7v2gqGgmIOT1o+dwS9klqDwV6839bBUVdieG/ewYX5Vc8aGA7tDogBF1MlCxtpLSz5ggm6d3eyMAoECasGDuwIA0D8FhoguxuxeuFb/iolYTlswNwf36yap/qDPT+4gT7nO48QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789457879; c=relaxed/simple;
	bh=SNEwaVoFEMQxvZNakVchWZxuOjq2Bs9l0ecbrpXQi84=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HWLT0zELOmUlk9JsAUWVzPXOAWiXVuNhIqphIf/ZJip4BoLxbLLpGBiZNRIQ6DtDrETIMg8qntKq6uljl54/gucmg0p8VAqp2AR/Gdug3aO1LfR1tVb+wkMoHMiC8l9sn19tsF3H/1A3niBlSVZv2mwYDS+pi0Ql47vpjb709VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBODOn73; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBODOn73"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3F71F000FF;
	Tue, 15 Sep 2026 07:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789457877;
	bh=KfINZdElU1kc4TW/MwrVeUNaZtbhVpHkw+KXpzcKd5Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YBODOn738o+NYwsBn9QJZwwS/iWs/kCR//c4+M0n/jhKIO/4Usf5CE4X1GDf/+eDL
	 fecXMZYEqbH+c7YWOyw/7VbV0s35tec0vyrS3XhQ4/l2l8OvvSLSsZRZ2EHmtu9H3L
	 I6c+YEx28XuitAaGQqFKmmev0RG6D8iYJNGUNBEldfQisRLBg17lLgWX8wrb6blVN7
	 dg/jW4adkvP9aXmD1QyF24PEk84yabwlNV4m/CzL0jIPUXBFWdFRI363+Lp/xcWPpC
	 kpjbvJHuO88srBNcZ+yAQrJlURmYSypI87WHpojA1/T3G8rFi+pIrmuY8jJLhtpEEW
	 g4MIKqkuhEhcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv4] dmaengine: bestcomm: gen_bd: fix out-of-bounds access
 in PSC parameter lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260915072608.57887-1-rosenp@gmail.com>
References: <20260915072608.57887-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 07:37:57 +0000
Message-Id: <20260915073757.7D3F71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dmaengine: bestcomm: useless struct declaration mixed with code
--

commit b34f7960c5a14d5c07b8bccee4d8da1a3d8c6985
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: bestcomm: gen_bd: fix out-of-bounds access in PSC parameter look=
up

The bcom_psc_params[] array has 6 entries (indices 0-5), but
bcom_psc_gen_bd_rx_init() checked against MPC52xx_PSC_MAXNUM which can
be 12 when CONFIG_PPC_MPC512x is set, allowing indices 6-11 to pass
and read past the array. The tx init function had no bounds check at
all.

> diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_bd.c
> index 8a24a5cbc2633..43e5bdd6937ec 100644
> --- a/drivers/dma/bestcomm/gen_bd.c
> +++ b/drivers/dma/bestcomm/gen_bd.c
[ ... ]
> @@ -336,6 +336,9 @@ EXPORT_SYMBOL_GPL(bcom_psc_gen_bd_rx_init);
>  struct bcom_task *
>  bcom_psc_gen_bd_tx_init(unsigned psc_num, int queue_len, phys_addr_t fif=
o)
>  {
> +	if (psc_num >=3D ARRAY_SIZE(bcom_psc_params))
> +		return NULL;
> +
>  	struct psc;

[Severity: Low]
Is this struct psc; declaration needed here? It appears to be a useless
forward declaration that is now awkwardly positioned after an active
statement in bcom_psc_gen_bd_tx_init().

>  	return bcom_gen_bd_tx_init(queue_len, fifo,
>  				   bcom_psc_params[psc_num].tx_initiator,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915072608.5788=
7-1-rosenp@gmail.com?part=3D1
