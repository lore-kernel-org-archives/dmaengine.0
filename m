Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F83C70809;
	Sun, 20 Sep 2026 23:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789945242; cv=none; b=FmmfBlhe8NO9/OiMLeP8KFfPPsWC5pvvnwnOy/89w9i9slaFrd6EPtOreSF5Nu8Dc74DZacPwJkRnXKeot8Dyi9MK6WZGMorV+wGGhfIznfJceYabIzE/oQvQMdhNuJ6lL5mzn/aAKrIh2qdxBSvfBxCLheWZCsdJASjw1je4Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789945242; c=relaxed/simple;
	bh=0UkRzPmrmq0m31m7jANON8FHIhemOKefWX3GHfH18pQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XdZMLn00pHwb/zSl/faJYsHvKV3v8/4nMk60ISCTd5jGwXI2Cdl0lvmL45GfyosHlVx4V7HHJixFRsx1x5FVcmFGKjMvysw4PMpxl8L2ru9UoNkENtbo78pOMTGOmkS1M9B8/wF8mn9Bey0IKIy5p5QVjB4CiNKponofoSQB0Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsHfcD0j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsHfcD0j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879691F000FF;
	Sun, 20 Sep 2026 23:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789945241;
	bh=tOs7j+ExQBfm30Uw7majLZ+AeNJn/Hm52Q761lMfXKM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EsHfcD0j5fZbrDxXoUuZLaII0pwziiT/rPsSqPzuB+v8b1ggtOLPtYC/XCvm9NbHG
	 pv7t2AvmAN2c3vTEWlr4UBmK2OQ6D81ixT5SqftFsytnKzRoCr+R6KpyLo9g4PeTlx
	 +68p3BmCknr/sEjaQ7iCz0PcpVoOcXTw2t9ZxRI92bUVBKTEUPi8QsM++Y0lbKi1GA
	 4khl4IWdaURZeskEXcW5KALkwnOWRxoleSQO2ratjIDdh55I7UlW4fcJgKc4rcKOwz
	 G++k87OGq4vN2KlwL8NH/Uy4QhP1iDlqvK0UPRYBj2LoBCBkFosU0DRvlo494rpseb
	 NNqcA6NkRK53A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 17/18] dt-bindings: display: ste,mcde: Deprecate EPOD
 supply
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, dmaengine@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260921-ux500-power-domains-v7-1-v3-17-9352be6b86b1@kernel.org>
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
 <20260921-ux500-power-domains-v7-1-v3-17-9352be6b86b1@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 23:00:40 +0000
Message-Id: <20260920230040.879691F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] drm/mcde: DT ABI breakage drops legacy power support
- [Medium] dt-bindings: ste,mcde: missing power source requirement
--

commit 789856cac8c2df0e09f5a48ab8bacf3e0a2e001e
Author: Linus Walleij <linusw@kernel.org>

dt-bindings: display: ste,mcde: Deprecate EPOD supply

This commit makes epod-supply optional and marks it as deprecated. It=20
instructs the MCDE to use its power domain instead.

> diff --git a/Documentation/devicetree/bindings/display/ste,mcde.yaml b/Do=
cumentation/devicetree/bindings/display/ste,mcde.yaml
> index 05e7e4ebc8820..ee34b65dd13bf 100644
> --- a/Documentation/devicetree/bindings/display/ste,mcde.yaml
> +++ b/Documentation/devicetree/bindings/display/ste,mcde.yaml
> @@ -39,7 +39,8 @@ properties:
>      maxItems: 1
> =20
>    epod-supply:
> -    description: a phandle to the EPOD regulator
> +    description: a phandle to the legacy EPOD regulator
> +    deprecated: true

[Severity: Critical]
The dt-binding deprecates epod-supply in favor of generic power-domains. If
companion driver changes in this series completely drop parsing of
epod-supply and rely solely on pm_runtime to power the hardware, could this
break existing device trees?

Older Device Tree Blobs (DTBs) lack the power-domains property. Because
epod-supply is no longer parsed, the core will not attach the device to the
power domain, and the driver will fail to turn on the hardware.

Could accessing unpowered display registers cause a synchronous external
abort or silent display failure?

Would it be possible to maintain legacy fallback logic in the driver or
dynamically map the regulator to the power domain in the core, rather than
breaking existing DTBs?

[ ... ]
> @@ -103,7 +104,6 @@ required:
>    - interrupts
>    - clocks
>    - clock-names
> -  - epod-supply
>    - vana-supply
> =20
>  additionalProperties: false

[Severity: Medium]
Since epod-supply is being removed from the required list to transition to
power-domains, should power-domains be added to the required list, or
perhaps an anyOf block used to enforce that at least one power source is
provided?

The MCDE hardware requires a power source to function. Without either
epod-supply or power-domains in the required properties, it seems a device
tree omitting both would silently pass schema validation, allowing
incomplete hardware descriptions to be accepted.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-ux500-powe=
r-domains-v7-1-v3-0-9352be6b86b1@kernel.org?part=3D17
