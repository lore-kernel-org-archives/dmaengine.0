Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C764C8C4A;
	Tue, 22 Sep 2026 07:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060873; cv=none; b=IcTa60NivRoyAkI8gRIui0JaL6VsmLMm65xXJUk0RozmlC8yFDsKXByQ0THa4f9XXM709/mclsL8HsjY2cYHYO7cc+2GcUBBDCrzKT0X0Z+vNGefBbfoRFhYjjLYV8lPPYGParhEq1izS1GRMjpvog/QA3qDvITs+YGU4X0BDzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060873; c=relaxed/simple;
	bh=SmK/3wCulMvKbbZvrX3LwNcL/B88pdBEHVChQYnQk5Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m5ai1Ak/IRRozvqO9EFa/LgWErYhObv6tlFUp8kqw7Z6Lo86TFUwfBWIBbph3pHHb7QsBVkgiMtV32esQM5qmcgp5lAXcUrZKCYKyZ90X+JA3iiQwDtiNVV4HlnqJit/IByqPnG+SOQai9BzGXJZrTe/R5iv9pNDqNB4Ddf0qrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z9N0s3I+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z9N0s3I+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE801F000FF;
	Tue, 22 Sep 2026 07:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790060871;
	bh=uss3OuebqDiChGDUO4Vq5jcXNl9o0lM528c1BHCf+TE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z9N0s3I+i9qns9922abn5wF0vXO8kTP0wzuKVysYhsZTtB/8AtP9z3ef75jH7Gool
	 v8NpX6xy2l0oLnTa2DA/rCW/L69XaptoidXQzJT3ISH6oGec1IyVikKKp67paegbc/
	 PEcIe1HWEqVvLL5+PiET/2n349K69zINUL2tZp9pfWz6BikwCkltMtO/5Kpp52v+c2
	 OFs9/jaEFgF4s2wMnT5GZbHdi06PZF105lGolPDyw5njZ2AN3CGJCzFNDXsBhEKxXk
	 sCxzb4hyy8kc2xk5rM0A1WhURbfA+LwM5ZirKsMcUCIa/FBdg1vR0yC8KoWPWy7DsR
	 bvDgncVL3PnGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 15/19] dmaengine: ti: k3-psil-am62l: Add AM62Lx PSIL
 and PDMA data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260922064902.2719979-16-s-adivi@ti.com>
References: <20260922064902.2719979-1-s-adivi@ti.com>
 <20260922064902.2719979-16-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 07:07:50 +0000
Message-Id: <20260922070751.5AE801F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dmaengine: uninitialized stack variable use in psil_set_new_ep_c=
onfig()
- [Low] dmaengine: misleading error log in psil_set_new_ep_config()
--

commit 3b16508e4409dd766b60b58e1c4dabc6cf392380
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-psil-am62l: Add AM62Lx PSIL and PDMA data

This patch adds PSIL and PDMA data for the AM62Lx SoC. It also introduces a
new PSIL_EP_PDMA_XYMF type and adds a fifo_id field to psil_endpoint_config.

> diff --git a/drivers/dma/ti/k3-psil.c b/drivers/dma/ti/k3-psil.c
> index c4b6f0df46861..580fc553e23fa 100644
> --- a/drivers/dma/ti/k3-psil.c
> +++ b/drivers/dma/ti/k3-psil.c
[ ... ]
> @@ -90,9 +147,22 @@ int psil_set_new_ep_config(struct device *dev, const =
char *name,
>  				       index, &dma_spec))
>  		return -ENOENT;
> =20
> -	thread_id =3D dma_spec.args[0];
> -
> -	dst_ep_config =3D psil_get_ep_config(thread_id);
> +	if (of_device_is_compatible(dma_spec.np, "ti,am62l-dmss-pktdma")) {
> +		bool dev_to_mem;
> +
> +		dst_ep_config =3D psil_get_ep_config_by_id(dma_spec.args[0],

[Severity: Medium]
If a malformed or improperly configured device tree specifies a #dma-cells
value less than 1 for pktdma nodes, of_parse_phandle_with_args() will popul=
ate
fewer elements in dma_spec.args than expected. Because dma_spec is not
zero-initialized, does this code read uninitialized stack memory from
dma_spec.args[0] without verifying dma_spec.args_count >=3D 1?

> +							  true,
> +							  &thread_id, &dev_to_mem);
> +	} else if (of_device_is_compatible(dma_spec.np, "ti,am62l-dmss-bcdma"))=
 {
> +		bool dev_to_mem;
> +
> +		dst_ep_config =3D psil_get_ep_config_by_id(dma_spec.args[2],

[Severity: Medium]
Similarly, if #dma-cells is less than 3 for bcdma nodes, does this code read
uninitialized stack memory from dma_spec.args[2] without verifying
dma_spec.args_count >=3D 3?

> +							  false,
> +							  &thread_id, &dev_to_mem);
> +	} else {
> +		thread_id =3D dma_spec.args[0];
> +		dst_ep_config =3D psil_get_ep_config(thread_id);
> +	}
>  	if (IS_ERR(dst_ep_config)) {
>  		pr_err("PSIL: thread ID 0x%04x not defined in map\n",
>  		       thread_id);

[Severity: Low]
If psil_get_ep_config_by_id() fails to find a matching endpoint, it returns
an error pointer without modifying the thread_id variable, which is
initialized to 0 at the start of the function. Could this lead to misleading
error logs that print 0x0000 instead of the actual channel ID that failed t=
he
lookup?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922064902.2719=
979-1-s-adivi@ti.com?part=3D15
