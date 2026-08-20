Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3547E450401
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 13:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787232589; cv=none; b=Jjzk/gIe81JBD4piUP5zJcZYPAWqV6vYXJ5F+ztd702E4o9ywZ/qppM8yX2OVwNSNa14ldKMX4Ko0k2kKWSjKa1z08as1p4guZwnQVhU7it6VR2E5SkApKq496DFl50zbTzkbnEsrwDk4dmt+0mQ/c3PghoPbSLaSpdmvtBuuE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787232589; c=relaxed/simple;
	bh=wHE2Vo5bGJOcapIeFw712n0putYoI2aZEqezxj+Fp+Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TgG0UMb/Xs7mU81KzKgd+3azcTMjji0mpsMenE/IRHudGm6ek2nu6ANj73vkDYWGSV9qd14SjjY4PdmiTVAJ1ikU8C85QbJetsd7YV7IJybstBq6o8s1g4WUPBuZX7FAz0oBspg3Jk00Lvq7m9GiDkOTM+Xa5u7Q4rx8u9S47Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fEjk2OV2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fEjk2OV2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10EC1F00A3A;
	Thu, 20 Aug 2026 13:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787232588;
	bh=BPRgsAJZ8sbTm53gjnJM8CuYmRrFW7Ajs9YF7+/oPEc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fEjk2OV2oyA6XHPcyQYSIEVwF/85FHpqyrAowMJ2XOWAscdn/d98hGxfpdUpkIg9q
	 EyaK+Ee7blu0uTiq49YoXE6aSHZi7cNm/jshkm6/4+KcAyghPKNiZSsHi2GQpLwTrG
	 apAhwPk4jIyo2CEwLgL3KIwAqHUFkqkZ1oeR0t4JcFgOF1FJLDMb2Q46dDCSeAj8f2
	 FuBNWfqqOsf5ZbnheEpJdALf7XTPHQHj1ynmpLJ6Omw8SQvHrH0zp/6V9S83K0Jott
	 +Yt1bFTaMO3KmVhI+g1DmHX+xO/h1kZd85Kapo4ErMSklcVet2O1ng+4Dte+0NHUqn
	 hrnq4qrukyNwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/13] dmaengine: ste_dma40: Fix memcpy channel
 parsing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260820-dma40-fixes-v2-9-63238334c707@kernel.org>
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
 <20260820-dma40-fixes-v2-9-63238334c707@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 13:29:47 +0000
Message-Id: <20260820132947.C10EC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds array access in `d40_phy_res_init` due to unvalidate=
d `disabled-channels` property values.
- [Medium] Leaked OF node reference from `of_parse_phandle()` in `d40_probe=
()`.
- [Medium] Global `dma40_memcpy_channels` array is modified without locking=
, preventing multiple instances of the device from configuring correctly.
- [Medium] Unvalidated `args_count` in `d40_xlate` leads to reading uniniti=
alized stack memory.
- [Medium] The driver fails to probe if the optional 'memcpy-channels' prop=
erty is missing from the device tree.
--

--- Patch [9]: [PATCH v2 09/13] dmaengine: ste_dma40: Fix memcpy channel pa=
rsing ---
commit 50b8205871db7013fde7fb8ac4433303d26eb570
Author: Linus Walleij <linusw@kernel.org>

dmaengine: ste_dma40: Fix memcpy channel parsing

d40_of_probe() validates the memcpy-channels property against
D40_MEMCPY_MAX_CHANS, but reads the property directly into
dma40_memcpy_channels. That array has fewer entries, so a long property
can overwrite adjacent data.

Validate the property length against ARRAY_SIZE(dma40_memcpy_channels)
before reading it into the array.

Closes: https://lore.kernel.org/dmaengine/20260819225215.5EA2F1F000E9@smtp.=
kernel.org/

> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 8cf73b37f8bfd..4e840846466b8 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -3470,7 +3470,8 @@ static int __init d40_of_probe(struct device *dev,
>  	list =3D of_get_property(np, "memcpy-channels", &num_memcpy);
>  	num_memcpy /=3D sizeof(*list);
> =20
> -	if (num_memcpy > D40_MEMCPY_MAX_CHANS || num_memcpy <=3D 0) {
> +	if (num_memcpy > ARRAY_SIZE(dma40_memcpy_channels) ||
> +	    num_memcpy <=3D 0) {

[Severity: Medium]
This is a pre-existing issue, but does this cause the probe to fail if the
"memcpy-channels" property is completely omitted from the device tree? If
of_get_property() returns NULL, num_memcpy would be 0, which triggers this
error path. Should this property be strictly required, or can the driver
continue without it?

[Severity: Medium]
This is also a pre-existing issue, but does reading the "memcpy-channels"
property directly into the global dma40_memcpy_channels array cause problems
if there are multiple instances of this device? It seems probing subsequent
instances would silently overwrite the global array and corrupt the channel
mapping for previously probed controllers.

>  		d40_err(dev,
>  			"Invalid number of memcpy channels specified (%d)\n",
>  			num_memcpy);

[ ... ]

[Severity: Medium]
This isn't a bug introduced by this patch, but does d40_probe() leak an OF
node reference?

drivers/dma/ste_dma40.c:d40_probe() {
    ...
    np_lcpa =3D of_parse_phandle(np, "sram", 0);
    ...
}

The of_parse_phandle() call increments the node's reference count, but I
don't see a matching of_node_put() to release it. Can this cause a memory
leak when the driver probes?

[Severity: High]
This is a pre-existing issue, but is it possible for malformed device tree
values to cause an out-of-bounds write here?

drivers/dma/ste_dma40.c:d40_phy_res_init() {
    ...
    base->phy_res[chan].allocated_src =3D D40_ALLOC_PHY;
    ...
}

It appears d40_of_probe() reads the "disabled-channels" property but only
verifies the element count, without validating the actual channel integers.
If those unvalidated values are used as direct indices in d40_phy_res_init(=
),
could this corrupt the heap array?

[Severity: Medium]
This is a pre-existing issue, but does d40_xlate() read uninitialized memory
if the device tree is misconfigured?

drivers/dma/ste_dma40.c:d40_xlate() {
    ...
    flags =3D dma_spec->args[2];
    ...
}

If a device tree incorrectly specifies a dma-cells value less than 3, the
args array would only be partially initialized by of_parse_phandle_with_arg=
s().
Could unconditionally accessing args[2] without verifying args_count lead to
reading uninitialized stack data?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-dma40-fixe=
s-v2-0-63238334c707@kernel.org?part=3D9
