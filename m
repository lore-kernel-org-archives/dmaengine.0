Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E003A874C
	for <dmaengine@vger.kernel.org>; Wed, 30 Sep 2026 07:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753639; cv=pass; b=CsWS17s8tfvOiYd6Js2YT7p8kzGb6pXCAr/L55+errdRFnyXUntVbWdj+tvl+SiFGgcvTCSsvpOFFm+TnJ/rH99txzNQ1XgZ4i1YMzAL+9KIs9x+pfsBVWxaJwH7Tx8gQZ9K6E1PnaQ4Ir1GYvDLio5ZahvkOH+iibtBGaAq8WQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753639; c=relaxed/simple;
	bh=ZQ9na8R6Owx5vwwgbJYlV2OYkT7SQ1YuPUuVW7uDu60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gWztXI09vFqkehghZF7lK8/+ETT93u08jyD4XKwP1gb+PDFNVaHZRRyYDlRlw5gxxmIXyiwHSJVa1JGaHXw5+oQUsv0FLklwJMGEIpW9DJ/AchMWkWzM4vb/bb31haAnYy2L2DjlL6JdjFTAHIpQ8X335nVOyn85ySzSs6ssXpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRxZvETw; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRxZvETw"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4aa8d881so5345520d50.1
        for <dmaengine@vger.kernel.org>; Wed, 30 Sep 2026 00:33:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790753635; cv=none;
        d=google.com; s=arc-20260327;
        b=Ii8AoPdWP8FOT67FEKP5HhknJ85uNPey0M2t6z0r+lFs5a2MhDx0odHH/2oAOmJI/c
         UIbv5r7d/9f36AebcEWMpQqWKr6CAu9rk+PvtcGNMrVjAGzDBeauvNDHo//I88HSnqMk
         iJRnRpw8mkG++O2QoUJjh9+ZrDfdzMk9u5Y3ONOCVoblKfnWJvwdi7/CT0Vx42HeTDrs
         5yhW1BtvcvXQYJLA1bggQ58uGUOt51jjuUMUSnSAUUObkeKwIUTAJcwRWq/qhZGYXgv/
         AVVGs1KN4748w///E0riyczzCrWCD6glP0BIUxE4pDCaISLy0Z5To4PtCQfzKp/h3PVj
         NAUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TD0e04Vq0+240ahadbGbuwsBitSBioXyF7M7tnlL6kU=;
        fh=pX8XyJHg9BalEX4uFmDj+eq8glZx80gNUJ0obGAN2DY=;
        b=KEQrSQ29p9MIEntnRBAya8DgH7+JNK7IOK+G2BT0TzhdFfdWYwP3DGXi59tdrSvRiv
         s8wuw/nRq42dvcq3mD/V1oaFSY9eCpbUJkhXCvYSgVloz1RP7Bx9nGTlPuk0PV1rmlTf
         zcAdGH2UqQj9Py4zjDpyREAc1wk8dTNkABwCsMbcP5g+lMrpU5aHExspDOxz++3YfSZB
         WEuU4NuMDg49Q4jK0OP3dODyi3//XsiGFL2sYwu3e4qJQCXFhU/qakelTgSdWkKtp4nd
         vQ3liu1DJWsaeeH8phYXsongxjBth2XiHgsficHk3C87JI6dLp7Ke3v2sF2tTRmqC09e
         owfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753635; x=1791358435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TD0e04Vq0+240ahadbGbuwsBitSBioXyF7M7tnlL6kU=;
        b=RRxZvETw1csmOpk2NlyBiaKR2FkYPnoh5drFAar2txGEz6JbAW/2QF+Zs/DvCMlmX8
         Qs183SGXr2472RZ3IbFudib+kuy+5nXd3UezA0gNWVtwZpewtAKA/FIfHSJhtIJNKuh8
         VCo0zsQnt3Y3URgfBnxrwdDgzxBbkezH7717TBFValEkysLB49EPz6r2D5enaUVfZJUz
         vwc/2+ZQZwYzs4ypfPRLO77G+d6w+MH+lKhWVc29IqZrMJy1/XArROfBVyJep05o4hJG
         ygDaFrabSUPit4XaApRPTURnv1M1z8sjLa2akTaV+z3Kw7H0IDmJwkeTbW93kUUixUFm
         KA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753635; x=1791358435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TD0e04Vq0+240ahadbGbuwsBitSBioXyF7M7tnlL6kU=;
        b=2dBvxcLIyXQJOXkKL9v0ciYdKGvD+UD9A+u8AnpwKezqlJWO1rg3qC1HkowV49uX2q
         skwzNeVQkUOoQSOjuRAvIN8qU+fQmdIB/CB+KJa3itHNYwl778mNF4DxpQfud7t3PA/C
         LQ/a0GoMMfJNyqAeeF3TiPUe3BK8pJ+GgLlaZcg5uAkqA0FINWUZ86AgLJF3UaPVp3Ib
         DMnwBMYh/XheaurpEqC2FqyxbuV8NVhnr49eo0Y5FTBAKMNlAL75Xk30oq+RpFJmIMtU
         9F74n3nMrM6SF1Wcgc0y04UL+TLP3nyXsP5Zgov0iq3nq6Fvb7ZT5xNNuRgBQSNjOAxV
         IV2w==
X-Gm-Message-State: AFuF++mWw/KQfnus0Bzn6NK30/Be9voG6YFSC1KELylDhlpSJKX5o0oA
	1oQSCyfPr5B2JGn1ixP6YUV0TKNciTia36bKjhdYQ7Xjcs9GhAm2SFiyf5ozcaedhyyV3Gd1EbF
	zl7PWFfdFevU1zcy0hoOzbyJYKzjBcS8=
X-Gm-Gg: AYBFou2QLJeHsYPyp+LE5U2XW/EtTsqMxb7HNH4/0qesupJLzBE7zA75vhIiIrx4GA0
	KD7saXy0MSCrXbzaM4W84s+uQSdN4O8peYPCJVc4JehfgoFnjlOkLTje0rj0Wn4bgzR1GYlH84Q
	wTGwLw3l200D6yV1BNA7W7zW1RZMScczo1wA19xYXASX5DeDcYeghlcT0XMqF6EkVR0o7ATcYiA
	GWDuM92SgRe0ql1LWcgkq7h5SVDpK0w6gqE7dMxTnXsWLSJOeeyLLZ5xO2ppD1OPkBTVrD958UV
	rxAIRetNKHQ4ebM1r9Y9blY9qKoUIUmPmdA8XoM2exXF5N/AeiaLQ5IaWuK7yze4
X-Received: by 2002:a05:690e:4411:b0:671:1b72:bd0f with SMTP id
 956f58d0204a3-676834ef47amr147001d50.58.1790753635586; Wed, 30 Sep 2026
 00:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929194434.29937-1-ginger.jzllee@gmail.com>
 <20260930071916.35722-1-ginger.jzllee@gmail.com> <0593ff86-c6ab-4c64-88a3-e500ed335760@web.de>
In-Reply-To: <0593ff86-c6ab-4c64-88a3-e500ed335760@web.de>
From: Ginger <ginger.jzllee@gmail.com>
Date: Wed, 30 Sep 2026 09:33:44 +0200
X-Gm-Features: AclHuK8bAkNOdRlVNFbch7Bc0dDjNYgJqW4vj7CakOzQrTXiV9dA3JxcFXe9oWY
Message-ID: <CAGp+u1aTQvE_o=nObMb0LvuwmdFukG9qBeKGDvwcf5-ckG9xyg@mail.gmail.com>
Subject: Re: [PATCH v3] dmaengine: tegra186-gpc-dma: Read channel state under
 the lock
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 9:25=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> > My static analyzer detected a potential issue in the dmag engine.
>
>                                                        DMA?
>
>
> =E2=80=A6
> > ---
> > v3:
> >  - Acknowledge the usage of static analysis in detecting this problem.
> > ---
> >  drivers/dma/tegra186-gpc-dma.c | 5 +++--=E2=80=A6
>
> Under which circumstances will additional background information become a=
vailable?
>

The static analyzer is a research-based one, built upon the LLVM IR.
The analysis is founded
on a symbolic model (not an ML model) for concurrency bugs. And due to
the anonymity
requirements, I am afraid I cannot reveal further information.

>> Were any more of your contributions supported by advanced source code an=
alysis tools?

If you meant AI tools, then at this stage, no. For this patch, I have
used AI tools to help phrase
the patch better, but I did not use them for code analysis.

Sincerely,
Ginger
