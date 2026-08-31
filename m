Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23F3373BE8;
	Mon, 31 Aug 2026 23:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219327; cv=none; b=fvl8881VrIprNw3s0D/uEYCWV+z26vv5///uh49Na7jPRdFhWaQTNj84fUKBvtZByUqxKOPZpS38PgeWrmqIg6avgJYT92hnfmXD0LJIuAM9Yvb1uxCnBnAga8WdaD1cN36HJ36DTNl+oJB+BwOmSazhJZjn13gZWKvSud/j7/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219327; c=relaxed/simple;
	bh=dcH48gseYQvmA2mf7QXpOuBF4m8uFA4lDDDhhydM2zY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u3Qh19xSdL7fNguEqhY5oCd76etyK+h7dM5AJg/jnCiWfBo+QLZV7qi5QxsgOyjN26A4/BHwue1mygJKBb3YpwvU60/XJFDa95xBJAm7IYboP3p79EhTzTL4x8SArMZjUwYmMgI8YJ5DntD/K2WAPY7VLxErT4NQcU/kYBGrIpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJYwG6DZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJYwG6DZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4681F000E9;
	Mon, 31 Aug 2026 23:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788219325;
	bh=g9I3Oo7PhjFlWmSSidw0playH4A3ME8hXe8Tj1GcN0E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZJYwG6DZvr8En9vM39ymPkh5a3PU/av/z4VzlWXKWfPd5CeGFc8fhDolMqZO83XFw
	 BBv3rZh/tAf5DCYZQGfwrWuHWRU7+INDiBM1niBiw/AfizlcJqGsAw+5DkUye6KJnq
	 D/kTrAmm8kH2mzUJ/wUB5OwG1AhkmTo9z6MjdrGr998i8FPUqDCB/2R70B7CPxiF/o
	 SXpY/lYFpyYAcz7VeUzk8UVNRe6xyb1Jj9/txyrnY6wk4iIzPa/LQImrz+ghHd7WaM
	 GklBnbe+QFj1FJATFP9TY1ecU4hmClnHMgbv0xtWy3XX8r/R01HM97laUIkxaGo8r2
	 67HPLMvoLNTSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: dma: ti,cppi41: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: linux-phy@lists.infradead.org, dmaengine@vger.kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <20260901-ti-am33-usb-v3-1-5e15c617d2e9@gmail.com>
References: <20260901-ti-am33-usb-v3-0-5e15c617d2e9@gmail.com>
 <20260901-ti-am33-usb-v3-1-5e15c617d2e9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 23:35:24 +0000
Message-Id: <20260831233524.DA4681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The `interrupts` property is not marked as required for the `ti,=
da830-cppi41` hardware variant, allowing incomplete nodes to pass schema va=
lidation.
- [Low] Missing property type definitions for deprecated custom properties =
`#dma-channels` and `#dma-requests`.
- [Low] The unit address in the example node name does not match the first =
`reg` address.
--

commit efe52f34688a9f85bd73ed6d80af2e1107be14ba
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: dma: ti,cppi41: Convert to DT schema
   =20
This commit converts the TI CPPI 4.1 DMA controller text bindings to DT
schema. It merges ti,am3359-cppi41 and ti,da830-cppi41 into a single schema
and adds undocumented properties like power-domains to match existing device
tree usage.

> diff --git a/Documentation/devicetree/bindings/dma/ti/ti,cppi41.yaml b/Do=
cumentation/devicetree/bindings/dma/ti/ti,cppi41.yaml
> new file mode 100644
> index 0000000000000..a8c28e8ada072
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/ti/ti,cppi41.yaml
> @@ -0,0 +1,109 @@
[ ... ]
> +  power-domains:
> +    maxItems: 1
> +
> +  "#dma-channels":
> +    description: Deprecated, use dma-channels instead.
> +    deprecated: true
> +
> +  "#dma-requests":
> +    description: Deprecated, use dma-requests instead.
> +    deprecated: true

[Severity: Low]
Are the #dma-channels and #dma-requests custom properties missing a type
definition?

The schema tool strictly requires all properties that do not match core
regex patterns to have an explicit type via a reference. Without a type
definition, does this regression cause schema validation to fail when
checking the bindings?

> +
> +required:
> +  - compatible
[ ... ]
> +allOf:
> +  - $ref: /schemas/dma/dma-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,am3359-cppi41
[ ... ]
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 3
> +        reg-names:
> +          items:
> +            - const: controller
> +            - const: scheduler
> +            - const: queuemgr

[Severity: Medium]
Should the interrupts property be marked as required in this else block for
the ti,da830-cppi41 hardware variant?

If incomplete nodes pass schema validation without an interrupts property,
won't this regression cause the driver probe to fail when it attempts to pa=
rse
and map the interrupt?

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    dma-controller@7402000 {
> +        compatible =3D "ti,am3359-cppi41";
> +        reg =3D <0x47400000 0x1000>,

[Severity: Low]
Is the unit address in the dma-controller@7402000 node name mismatched with
the first reg address?

The node name uses 7402000, but the first register address is 0x47400000.
Will this formatting regression cause a compiler warning when the examples =
are
evaluated?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-ti-am33-us=
b-v3-0-5e15c617d2e9@gmail.com?part=3D1
