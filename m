Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6547F1E492D;
	Sat, 25 Jul 2026 12:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784982936; cv=none; b=lFAQ1DOzGzgMCAMHhf3OcJibUIIWx2kBw8vXjWwaokBdtGww+j+6AiY9xCC+qGhr2GwoVDFwG8k9pADXQQYLSKJ6HN2lMBOq72ilsQgPcfJO1yNXpks40MIu8ziRmE5q5eEFYGiG/2iTzUPQZc0mbqInacpOMsTRB91ztKRS8p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784982936; c=relaxed/simple;
	bh=4qCQdaM9dOGRg5e8Y66mDNI9/3y8p18DT8QxyhsWwdA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X/vM+GTgcXnDLiGE8qJIa+3/4BSvCzTmomVwcJy5hrTwBDMOy6OPMHrJD8ymv2/Mz2pWoOO07mI4vr0h2Y/RYPP7gds/eXAZ6nBxcPiYEbDOQFMBHxeq9yXqPqtLFhN47ojJlArJBbhhLLImost21tXOD1N6gesc/IqZ/6UTZpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZgYWc9fS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZgYWc9fS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 972861F000E9;
	Sat, 25 Jul 2026 12:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784982935;
	bh=14j3s6VceEsHb91H5pJ7MWrS8NMUkLwu4jqXDFTd81I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZgYWc9fSvbyJjERuPdpzi/+toBAGz26GZlt/76EnWChuqUGL0fYeZivQCGpqW1dEW
	 GsfsdQUvImrv7bvGPnTxVuP+ONtTRU0trzhw7PqwL9srDdUcyNwBgyuAJW96pE1jt4
	 EH4/QCt1b2mvuBVgG2Ye7mPJ3kHG5BWakXD7nUKK+7vKSQUO5g/y1W1Ad54ZeBM/zp
	 D+oeICXum5oJeCxl4maiDeoLhwejnQQKL1pqGm18V7PAPszStmhQ5NPnWhZbtpcLFe
	 CkcRmVwS3n8KMPc8LfAQLJEnThxE5r9oKAnSRh2qOMtQuq28wBByuQNG93g6Es2QFB
	 OskqaorlQ19Zw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dmaengine: apple-admac: Add M3 generation ADMACs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260725-t603x-admac-v1-2-6a4dec023f02@chaosmail.tech>
References: <20260725-t603x-admac-v1-0-6a4dec023f02@chaosmail.tech>
 <20260725-t603x-admac-v1-2-6a4dec023f02@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 12:35:34 +0000
Message-Id: <20260725123534.972861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Typo in the hardware data structure name for the Apple M1 (t8103) S=
oC.

Pre-existing issues:
- [High] Tasklets are not killed on device unbind, leading to a use-after-f=
ree when scheduled tasklets run after driver data is freed.
--

--- Patch [2]: [PATCH 2/2] dmaengine: apple-admac: Add M3 generation ADMACs=
 ---
commit f948efc911901cc77f53f693f8dbf1d4ad04e169
Author: Sasha Finkelstein <k@chaosmail.tech>

dmaengine: apple-admac: Add M3 generation ADMACs

This commit adds support for the ADMACs found on Apple t8122 and t603x SoCs.
It introduces additional register writes required for correct operation on
these platforms, and updates the device match table accordingly.

> diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
> index 14a5ee14a4815..7ee9a59081c1a 100644
> --- a/drivers/dma/apple-admac.c
> +++ b/drivers/dma/apple-admac.c

[ ... ]

> @@ -935,9 +954,18 @@ static void admac_remove(struct platform_device *pde=
v)
>  	reset_control_rearm(ad->rstc);
>  }

[Severity: High]
This is a pre-existing issue, but does this code leave scheduled tasklets
running after the driver is unbound?

If the device is unbound via sysfs, admac_remove() is called and frees the
IRQ, but it does not appear to stop scheduled tasklets for its channels.
If an interrupt fires just before free_irq() and schedules a tasklet,
the software tasklet won't be canceled.

Since the driver uses devm-allocated memory for struct admac_data, that
memory is automatically freed after admac_remove() returns. If the tasklet
runs after this, could it lead to a use-after-free? Should we be calling
tasklet_kill() for all active channels before returning?

> +static const struct admac_hw admac_t8013_hw =3D {

[Severity: Low]
This isn't a bug, but should this be named admac_t8103_hw to match the
apple,t8103-admac compatible string it targets?

> +	.set_unk28 =3D false,
> +};
> +
> +static const struct admac_hw admac_t8122_hw =3D {
> +	.set_unk28 =3D true,
> +};
> +
>  static const struct of_device_id admac_of_match[] =3D {
> -	{ .compatible =3D "apple,t8103-admac", },
> -	{ .compatible =3D "apple,admac", },
> +	{ .compatible =3D "apple,t8122-admac", .data =3D &admac_t8122_hw },
> +	{ .compatible =3D "apple,t8103-admac", .data =3D &admac_t8013_hw },
> +	{ .compatible =3D "apple,admac", .data =3D &admac_t8013_hw },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, admac_of_match);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725-t603x-adma=
c-v1-0-6a4dec023f02@chaosmail.tech?part=3D2
