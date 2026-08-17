Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB673AAF67;
	Mon, 17 Aug 2026 22:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787004078; cv=none; b=aqGBiljDxiW1Hy+OfX3j5MYoaobKqsjXLwEKY6ppJL6wHDEBLxOYscmf8M2iUWugq3pZKIcfgEmTwT9ioly2NVz3PaFORl9c87HQnpI1lC6Svw7bqYLXeumEvhU3WtSw0tn1i2SjbxKA1DyyU49boj643cLesEOlge9FAUGdxmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787004078; c=relaxed/simple;
	bh=toCQS+o/cUOBhMYvgWCXgikm1eODmb7jrGPnw1/I2Tc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B48zUfajv7mp3EqvJKKV+FwAK+X7vG0vX28wppeBtpDlai02RRZ5vcPOyx/IR31ujpgaKiu+prA9VHsrHe7XSjyFVO5K4QSw/hO/3adQVTkSleAdsDFTLD+F+1AhSsifNG3Jv8sp9VzP8VJPiNJ4o+PLliTNb1b7aFYdaUgvoZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ILFj3rjm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ILFj3rjm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52651F000E9;
	Mon, 17 Aug 2026 22:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787004077;
	bh=pliYGYHtdmdARCEEqN30Evggu96lW3D1pLldHpVZD84=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ILFj3rjmvjmwyEREN1/OorRSbPgRBhn5atFMf9r7CYTSS2meEksSRxI2yplvlQBPj
	 2Ijn3H92+0oJK3xjwZ/X2IIEXBhXuBcphb/H+ECHaaGtFduUhMM5qZUC/MbpUaVm0f
	 sdVgia6whbg0t6ZcHvEHa4QTLyjxiOjhhJNHrEKgHG4YpovA9AXjZxxmZbJr3Fy7g9
	 rsRpVT3vOfAIPH0II7sWs+S9mFIwrfziga05P9C+mCSnEDX6xqy+zIWqFG3jYY6xlK
	 Y1u8tCjXKofi3uZYACB2rFIAMgfo2I0PNWECLVAtm0olLq1gI/HwGX9kuwjDgdJhEi
	 COtqe04xBEshw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/7] dt-bindings: usb: ti,da830-musb: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: olteanv@gmail.com, dmaengine@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260818-ti-am33-usb-v1-7-69ac5f92df45@gmail.com>
References: <20260818-ti-am33-usb-v1-0-69ac5f92df45@gmail.com>
 <20260818-ti-am33-usb-v1-7-69ac5f92df45@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 22:01:16 +0000
Message-Id: <20260817220116.C52651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `dma-names` property lacks the string pattern constraint define=
d in the original text binding.
--

--- Patch [7]: [PATCH 7/7] dt-bindings: usb: ti,da830-musb: Convert to DT s=
chema ---
commit 39394a808ae75fe269a96ac3b8ee7106aa98c9ea
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: usb: ti,da830-musb: Convert to DT schema

This commit converts the TI DA8xx/OMAP-L1x MUSB text bindings to device tree
schema format. It also adds required address and size cells properties since
the DA8xx MUSB node acts as a parent bus for the CPPI41 DMA controller.

> diff --git a/Documentation/devicetree/bindings/usb/ti,da830-musb.yaml b/D=
ocumentation/devicetree/bindings/usb/ti,da830-musb.yaml
> new file mode 100644
> index 0000000000000..c54bdfb4d1ad9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,da830-musb.yaml

[ ... ]

> +  dmas:
> +    minItems: 1
> +    maxItems: 8
> +
> +  dma-names:
> +    minItems: 1
> +    maxItems: 8

[Severity: Low]
Does this code drop the naming constraint defined in the original text bind=
ing?

The previous text document specified: "Use rxN for receive and txN for
transmit endpoints. N specifies the endpoint number."

This definition lacks an items section with a pattern constraint (such as
pattern: "^(rx|tx)[1-4]$") to enforce the expected endpoint naming. Without
this constraint, the schema will allow invalid device trees with arbitrary
dma-names to silently pass validation.

> +
> +  vbus-supply:
> +    description: Phandle to a regulator providing the USB bus power.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-ti-am33-us=
b-v1-0-69ac5f92df45@gmail.com?part=3D7
