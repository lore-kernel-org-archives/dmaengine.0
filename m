Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EF93B27C1;
	Tue, 25 Aug 2026 06:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787638575; cv=none; b=aLu3ZVqfEQsCgaUu9ghSEiRXYOy5Xk9G/svcqn0XSchv7wCCRIuU2HuPKU0xz9aHEpIbj7InpTUMDsW5oaRj4qQjUq9oaGEVhy5sPY7M3YOJXJ4h2eEjVAq1GxpsjoQdtqjnLWPY+JHpQ2McV0101i5PjBZfoI+OZeZfdv1BRK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787638575; c=relaxed/simple;
	bh=gHV/jEFUn/UvVi7G5x6E/vP8WpKp6MEv+8jtZZeOo7Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DglAnL7/gI9S3OxxfmlDE2CNEJoewStZ0RNKqFKS5HKsO40O50LBAmsodyc5PHuEhNVE4z2ypq71hWvHEAjO9cUfAjjwcPLDzCGAgTqRrvughKj/0Cbbxx5Ux93NbupnCoQFJYK49++aOjnoa9wF6gv/vekDMlB1y2Sv01d02jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJ2x1S5l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJ2x1S5l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF231F000E9;
	Tue, 25 Aug 2026 06:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787638574;
	bh=iV0eBnNPqKswDHKPALp7zP+fLvDeCx0PQ4J4PlKVRt8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nJ2x1S5ll55hOZZQ1i/oYbiHv6XFiZqHlot7ffpgBX+rNCHvCZXUBul3c92hDVI8C
	 VZqVJ+4jQgnEEdXVmfTAYqTbAHqVtqqV5Plb5BbE/1eQs6nuHW9dv8pFZxTmXSXRfo
	 jHEp/o71FCaSWZdFUH9SX/5AMAUsv41fWt1BBtN1pzXfvMOCthW1yQ0p9S+eoHgF6b
	 v8jX/T3Neiac7qlfiq7EAG0LLArEDDvhvNKKNlmVxKsGVZWT+S5Ek688U7eyDo3kkE
	 8htfLktHFR1S6GCsv8qu4iy1ao6w1tdiyJORtbksSxKrQWdT/iHwEEr9xIVw9U1x0j
	 2X8bHRpRB3o0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/12] dt-bindings: net: snps,dwmac: Add compatible for
 UltraRISC DP1000 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang" <wangjia@ultrarisc.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260824-ultrarisc-dts-v1-8-61ab7aebe9e5@ultrarisc.com>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
 <20260824-ultrarisc-dts-v1-8-61ab7aebe9e5@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 06:16:13 +0000
Message-Id: <20260825061613.9EF231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The new compatible string is added to the `properties` list but =
not the `select` block, and there is no dedicated schema file provided, mea=
ning standalone nodes will silently bypass schema validation.
--

--- Patch [8]: [PATCH 08/12] dt-bindings: net: snps,dwmac: Add compatible f=
or UltraRISC DP1000 SoC ---
commit 95065ea02f1035ffe918e5e47353de103a5fb1ff
Author: Jia Wang <wangjia@ultrarisc.com>

dt-bindings: net: snps,dwmac: Add compatible for UltraRISC DP1000 SoC

This commit adds the SoC-specific compatible string for the UltraRISC
DP1000 GMAC controller to the DesignWare MAC binding properties.

> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Docu=
mentation/devicetree/bindings/net/snps,dwmac.yaml
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -119,6 +119,7 @@ properties:
>          - starfive,jh7110-dwmac
>          - tesla,fsd-ethqos
>          - thead,th1520-gmac
> +        - ultrarisc,dp1000-gmac

[Severity: Medium]
Will standalone nodes using this compatible string bypass schema validation?

It appears this string was added to the properties list, but without a
corresponding addition to a select block or a dedicated schema file.

When a compatible string is added to properties:compatible:contains:enum,
the dt-schema tool considers it a valid, documented string globally and
suppresses undocumented compatible warnings.

However, without a selection mechanism, no schema will select a node using
this string without its generic fallbacks. Incomplete or invalid
standalone configurations might completely bypass schema validation and
fail silently without tooling warnings.

Does this compatible need to be added to the select block in snps,dwmac.yaml
to ensure standalone configurations are properly validated?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-ultrarisc-=
dts-v1-0-61ab7aebe9e5@ultrarisc.com?part=3D8
