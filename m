Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682F43264F1;
	Mon, 10 Aug 2026 16:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786379893; cv=none; b=JaBypU2X0/MykF1x4bkxsPxatek1Qph48IHUuOA1/qt3PBRxgv4wlIqxhz7YYizQ9U5VZKohN335rBFBbVRA4QEq8ay7srwAG2V0jN2yAUtJ6CnRfy0XQ0+NMp7+J0zq0cu/fMM16G+sai2qw22h1ddgAq++jfGwEGHdrwqMJt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786379893; c=relaxed/simple;
	bh=wLQrxmYswGRtd7Df117hNkm4qRvwp5DSkbl/br5ceuI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nRXSiPH1MjrhnQqlTb5qigO7RRJ92uXdHeT1rvR7yQLo8SIyCgA9fnOLGHO1UNjqXMFzxXfcjCW6Dvm11JXcZtrT4ncq+4cEGD+HYkjW2VbAtAoK5Kp6POQ/tVvioLk6dV21kut1tHGk2xAemG/t3zrphE4TIyN/lmEXvbMxT/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCQz6Ytq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCQz6Ytq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856221F000E9;
	Mon, 10 Aug 2026 16:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786379891;
	bh=WfdMv/8ZXyGsLoEO4C/zcVHY34hVkspoQFa93Xc1SGI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YCQz6Ytq7UKe21rTVTefNwCVnXwCWDgM5hCP2ZKJVzESsZaU949rEogHH5QTbjCqy
	 jEfb3cBEjJtC8AKFPJxZlY6Qtni9thg6ZvOyGdAhUmQXpDmdMq/N7SGNtRkkMs9aJ6
	 FRAljLkFXdj4Do+65YKd38WEMk00+gNgjBUDjR/II7i2UEfMQE/h+QMWvkYP0DV7OV
	 X1sST9QghB0RO4WL7PY+biKcHoC3ZPveP1k7jIMttqjlpG0+urCQ3XcjPL2/Lw+Q3K
	 NQSrEAGm35QDsDuNrmTqfl7mVvOolvB/JAYmFDJIGVX/BSF7RwKTbAR1tWa865TD6C
	 5H/1dvN3+SbDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 12/19] drivers: soc: ti: k3-ringacc: handle absence
 of tisci
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260810151423.1948224-13-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-13-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 16:38:09 +0000
Message-Id: <20260810163810.856221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The direct register fallback in `k3_ringacc_ring_reconfig_qmode_=
sci` uses zero-initialized fields to destructively clear the ring's base ad=
dress and size.
--

--- Patch [12]: [PATCH v8 12/19] drivers: soc: ti: k3-ringacc: handle absen=
ce of tisci ---
commit 19dd5943c68e7ce05e29d608e96d6376a6ce8fed
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

drivers: soc: ti: k3-ringacc: handle absence of tisci

This commit adds direct register writes to handle platforms like AM62L that=
=20
do not have tisci firmware. It modifies the reset, free, configuration,=20
and reconfiguration paths to write directly to ring configuration registers=
=20
when tisci is absent.

> diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
> --- a/drivers/soc/ti/k3-ringacc.c
> +++ b/drivers/soc/ti/k3-ringacc.c
[ ... ]
> @@ -501,10 +568,25 @@ static void k3_ringacc_ring_reconfig_qmode_sci(stru=
ct k3_ring *ring,
>  	ring_cfg.valid_params =3D TI_SCI_MSG_VALUE_RM_RING_MODE_VALID;
>  	ring_cfg.mode =3D mode;
> =20
> -	ret =3D ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
> -	if (ret)
> -		dev_err(ringacc->dev, "TISCI reconf qmode fail (%d) ring_idx %d\n",
> -			ret, ring->ring_id);
> +	if (!ringacc->tisci) {
> +		u32 reg;
> +
> +		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
> +		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
> +				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
> +				&ring->cfg->ba_hi);
> +
> +		reg =3D readl(&ring->cfg->size);
> +		reg &=3D ~K3_DMARING_CFG_SIZE_MASK;
> +		reg |=3D ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
> +
> +		writel(reg, &ring->cfg->size);

[Severity: Medium]
Does this code accidentally clear the ring's base address and size instead =
of
just reconfiguring the mode?

Because ring_cfg is zero-initialized at the start of the function:

struct ti_sci_msg_rm_ring_cfg ring_cfg =3D { 0 };

The addr_lo, addr_hi, asel, and count fields are never populated in
k3_ringacc_ring_reconfig_qmode_sci() before being used here. Will this write
zeros to ba_lo, ba_hi, and size, corrupting the live memory mapping?

Even if this path is currently unreachable because platforms like AM62L do =
not
enable the dma_ring_reset_quirk, this might still cause hardware misconfigu=
ration
if the quirk is used on future platforms without TISCI.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810151423.1948=
224-1-s-adivi@ti.com?part=3D12
