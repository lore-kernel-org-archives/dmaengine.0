Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807714;
	b=kU7iet2CWNjj0nTPup1HI8YsJBgSUWJ9/8kDSePwqSRS/jY1vfnz/c9DbUQSVCFnaEfw
	 MUbV67l32p8taC+9mh/gOZEItQqNoH+vqzawccXzsDk+Xw1CSfSAfgMO/NAzSlTkDKUgz
	 Wrq5qnnwCNSwkMvu4wsyjKEerqVOfQ4AJ8RC3N/L3h1ykMk/Rzd7sHjFvYmHrBGYRw3V2
	 9H73TFPPiVM76HXx8Cidn3hFLvpv5sYdDAhsP6YggXAMOcYxKaySkxEpwIDCOcID4vHp8
	 oZP+xKm3DwX/FgU/yilNKugS223Uxv+i3rMdsUVYEjiJNQHpIe2GeRDIICtXjjLRKFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807714;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qSLyklIDSVoX0kFoLUWVFXeJZGVPGpNwXgvIVYCmBpY=;
	b=rrITIK7L3fcy9U8OUfTPq2PL/+1OciUhLa+8jSanYY8X5rYqmj4CpB4mrX10ovZdNzBd
	 k4l1JwLjKSDO3sXwNxVwQLP/qOLQJQHZAwJK+usxsIx1F2uyqZ5DQ9CkKB/crK7QdEkmk
	 cfOyX2hDu/yvwF4FXe+++PYGeMfp5VsmDGieC9bqRyp654wXSDv5mAHxoWAjW0YGcRRm9
	 uuU/tW8ol0pwhK2iiFY157ZEUgLi/5nnNxvTNRkiSji2db6MLav5pU+MDSdA3PlNGuIR6
	 DX9DyCVem+04mdyllLPJBeANJoQwSiwcBLwlZyeFpMpyGyuXLAPAgyDtmSXYks4vnLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GhQIvgee;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55877606A326
	for <dmaengine@vger.kernel.org>; Wed,  4 Nov 2026 15:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GhQIvgee
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6971F000C1;
	Wed,  4 Nov 2026 15:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793807714;
	bh=qSLyklIDSVoX0kFoLUWVFXeJZGVPGpNwXgvIVYCmBpY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GhQIvgee/4hvSZn5lRQmjbzh/Ezssd+NvRWGWZONI5rLrO4kpfpP1+VT4M5t3l6dA
	 TbRoTm3kEnzlYYoMJvLlie0Dh52zYJE40J+TgyZxqoI1ywwapnt2AGkQL/DCMBw5fh
	 fzQUYn7/sAaHD+9Z4j9DXQIrBn7Eco4oxKk+gnftqYQX52DWSvw8qJzBPUa0wXATYJ
	 GWh789GJm1WfjEiGBPLw7N+Wy5q2ql4WtRCpjRtTZ4KFlcNJdnJgyf9QxznFtLLOXy
	 RvFHpv/M4mFvIREgwqozp0g/D7c0yfTCnal/bgAmNtaC1gZDcYaK6oxNRuJrEcDABP
	 SPuyA60SkofJQ==
Message-ID: <sashiko-outbox-197555@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dmaengine: pl08x: Release the reset before reading
 registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Yang" <mmyangfl@gmail.com>, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261104154542.3131916-2-mmyangfl@gmail.com>
References: <20261104154542.3131916-1-mmyangfl@gmail.com>
 <20261104154542.3131916-2-mmyangfl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 15:55:13 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dmaengine: pl08x: exclusive reset breaks shared resets in pl08x_pr=
obe()
- [Medium] dmaengine: pl08x: MMIO mapping leak on reset error in pl08x_prob=
e()
--

commit 5b724fceef572df4410288b36fa49f5ba64ab7da
Author: David Yang <mmyangfl@gmail.com>

dmaengine: pl08x: Release the reset before reading registers

This commit acquires an optional exclusive reset control and deasserts it
in pl08x_probe() before accessing device registers, covering devices whose
device tree nodes specify arm,primecell-periphid and therefore bypass
amba_read_periphid().

> diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
> index 543c2eb8cfa81..33ad6c42cd7fb 100644
> --- a/drivers/dma/amba-pl08x.c
> +++ b/drivers/dma/amba-pl08x.c

[ ... ]

> @@ -2725,6 +2727,16 @@ static int pl08x_probe(struct amba_device *adev, c=
onst struct amba_id *id)
>  		goto out_no_ioremap;
>  	}
> =20
> +	/* Release the reset before reading registers */
> +	rst =3D devm_reset_control_get_optional_exclusive(&adev->dev, NULL);

[Severity: High]
Could requesting an exclusive reset control here break platforms where the
PL08x reset line is shared with other peripherals?

In drivers/amba/bus.c, amba_read_periphid() acquires a shared reset control:

	rstc =3D of_reset_control_array_get_optional_shared(dev->dev.of_node);

On StarFive JH7110 (arch/riscv/boot/dts/starfive/jh7110.dtsi), the PL080 no=
de
sdma (dma-controller@16008000) carries arm,primecell-periphid and shares the
JH7110_STGRST_SEC_AHB reset with crypto@16000000 and rng@1600c000. Both
starfive_cryp_probe() in drivers/crypto/starfive/jh7110-cryp.c and
starfive_trng_probe() in drivers/char/hw_random/jh7110-trng.c request that
reset line via devm_reset_control_get_shared().

When pl08x_probe() calls devm_reset_control_get_optional_exclusive(),
__reset_control_get_internal() in drivers/reset/core.c rejects mixing shared
and exclusive controls on the same reset line:

	if (WARN_ON(!rstc->shared || !shared))
		return ERR_PTR(-EBUSY);

Additionally, manually calling reset_control_deassert() without a devm acti=
on
leaves the reset deasserted if pl08x_probe() fails later or when the driver
is unbound. Would devm_reset_control_get_optional_shared_deasserted() avoid
both issues?

> +	if (IS_ERR(rst)) {
> +		ret =3D PTR_ERR(rst);
> +		goto out_no_ioremap;
> +	}
> +	ret =3D reset_control_deassert(rst);
> +	if (ret)
> +		goto out_no_ioremap;

[Severity: Medium]
Does jumping to out_no_ioremap here leak the pl08x->base MMIO mapping when
getting or deasserting the reset fails (for example, with -EPROBE_DEFER)?

In pl08x_probe(), pl08x->base has already been mapped via ioremap() right
before this block, while the error cleanup labels at the bottom of
pl08x_probe() are ordered as:

out_no_platdata:
	iounmap(pl08x->base);
out_no_ioremap:
	kfree(pl08x);

Should these error paths jump to out_no_platdata instead of out_no_ioremap =
so
that pl08x->base is unmapped?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104154542.3131=
916-1-mmyangfl@gmail.com?part=3D1
