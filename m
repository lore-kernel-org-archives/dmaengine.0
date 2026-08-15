Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D933939A2;
	Sat, 15 Aug 2026 10:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786790914; cv=none; b=X5E0JLQnMWoWV8zPKTxKdcLyYW+rXYyCT6BIK1gVvlNGegwAaee6dNhvwI1HzXT/wz2DR38/AYDb54Ea3Xa9TRkBGpPQc1hJ6JOW5qapFt68pgeAUf6y/8qk+cjFxMWy2q6syJVT64Gvd4yxdE17AY0ZZJBBBj0uEOQPV3okyZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786790914; c=relaxed/simple;
	bh=lqvZNHYWhIg/rMHEjZmH+vaj/H1v6BeEf9cNr540WWk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lbb4XOiFH32wdEOaPd5PAOljGchauDFMBZ6CPGXImPk7m04kfDzsrPW+W5pEuK1LBBNFApQhBj/JNPiS66TtWUlbstg2A9zdQ34u2HbAtf4rGXH6TsI5cui+Y37QE5IAwVVDRtPEyDNo42Q35FWuC/byJIN/84CXbCc6EtGFEXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qva1RkXK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qva1RkXK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7D41F000E9;
	Sat, 15 Aug 2026 10:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786790913;
	bh=rtpOKHM2S2yIFx0o7Vp8IBCciQ8zAjyXyQR5LKXQZts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qva1RkXKmktQv7y0hq0OP8ahGbG6MF6CwgQmsl2r3EHIM42phdvUoLNUbuCHO3yXr
	 jluSHaGaEDrIrSV0es92E88uMYi6TsyDATsJ5lfuUZcLhJ+1T/aOQetFcAvxMyMF8W
	 vVj6VJ6Fxoe4fRCweEaNMP5VZOfnRlnK6g9UkzL/8ZgG6R6w5HfijRmb1ORQxzgC3o
	 mODTZq8fVISR7Q63qPQaWM075jb/RR9/+XAoNhDwAtXX0AYtK+xcpxM97OoRCPlC1H
	 chIeu1/VIUZ2gQM1vlmvN/EzQcfmT73H5NEsgc31Ll50KZU4fYYApvTfvxG2VBAgxk
	 aGClBYJflZokQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] dmaengine: apple-admac: Add M3 generation ADMACs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260815-t603x-admac-v4-2-1149e342dcb0@chaosmail.tech>
References: <20260815-t603x-admac-v4-0-1149e342dcb0@chaosmail.tech>
 <20260815-t603x-admac-v4-2-1149e342dcb0@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 10:48:32 +0000
Message-Id: <20260815104832.9C7D41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hardcoded channel-specific bitmask written to global registers dur=
ing per-channel configuration.
--

--- Patch [2]: [PATCH v4 2/2] dmaengine: apple-admac: Add M3 generation ADM=
ACs ---
commit 64ebea6bdd03b6d431f7550dfd48b4169f531022
Author: Sasha Finkelstein <k@chaosmail.tech>

dmaengine: apple-admac: Add M3 generation ADMACs

This commit adds support for M3 generation ADMACs present on t8122 and t603x
SoCs. It introduces additional writes to unknown registers required for
these hardware variants to operate correctly.

> diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
> --- a/drivers/dma/apple-admac.c
> +++ b/drivers/dma/apple-admac.c
> @@ -39,10 +39,14 @@
> =20
>  #define FLAG_DESC_NOTIFY	BIT(16)
> =20
> +#define T8122_UNK_28_VAL	0x200000
> +

[ ... ]

> @@ -747,6 +756,11 @@ static int admac_device_config(struct dma_chan *chan,
>  	u32 bus_width =3D readl_relaxed(ad->base + REG_BUS_WIDTH(adchan->no)) &
>  		~(BUS_WIDTH_WORD_SIZE | BUS_WIDTH_FRAME_SIZE);
> =20
> +	if (ad->hw->set_unk28) {
> +		writel_relaxed(T8122_UNK_28_VAL, ad->base + REG_UNK_28);
> +		writel_relaxed(T8122_UNK_28_VAL, ad->base + REG_UNK_2C);
> +	}
> +

[Severity: High]
Does this hardcode the configuration for a specific channel pair?

T8122_UNK_28_VAL is defined as 0x200000, which equals BIT(21). In this DMA
controller, global registers typically operate using a channel pair bitmask
calculated as 1 << (ch / 2), making BIT(21) correspond to channel pair 21
(channels 42 and 43).

Because this is called in the per-channel admac_device_config(),
configuring any channel will unconditionally write the bitmask for channel
pair 21 to these global registers.

Should this value be dynamically calculated based on adchan->no, or if it
is genuinely a one-time global constant, should it be written once during
admac_probe() instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815-t603x-adma=
c-v4-0-1149e342dcb0@chaosmail.tech?part=3D2
