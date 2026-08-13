Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05F8480DE0;
	Thu, 13 Aug 2026 14:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786630215; cv=none; b=QZPAUPDzBDtcBda4/MkddGLG9UrC45xuxW0FWXBQm9SnhpmyaBOZbAaT5+5RaYFkg/aVyysLLRNwKj1oZLItmCdHpbbRJAPJvvrW8n0W/Z0RKt1VLUmwuTYPHEDLJ5Mu4s4dC+myBzOITTBEe6sD3zIfl3kGzFMdd91l29FPdAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786630215; c=relaxed/simple;
	bh=pa77bsxZNhMmMFjHaPbzefovp0biK0ITc128dry+Q44=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t4zDkKbd8ReGmCrO5U9RjW/qatTQXvHSdG+81olkx9MjQmTjLXrRJERhhkmcCf1M/KLON5ISA9ub68tEVpJRGHsps9OEzG2r9uLG/8+157Wi3+w7Z5/XGCJvHYafdBUTOD2fnHAKgsho7PE5Y32THNO6ZjrR/X2wbil7vfTZ0jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j4zGJBpR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j4zGJBpR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5ADE1F000E9;
	Thu, 13 Aug 2026 14:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786630213;
	bh=CAIEfs1efMxeWKKS1RKrDvE3gpYg6w73+tQ5ULFba4Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j4zGJBpRw7awrDvW1p2iCFvIeJ+k7sMhY8uqMYBx274EVYYFf0Kim3DOJSYXPm0rw
	 8zh7s4W2dxs+U9CMAruGeTAQgGReajqlN2IiY8+K5fa56ygWe9YKPtqwSBDk7gm+F4
	 Iyk8J7h+hSl93Ex+RDbHRJgOa76+pgbd1aOZ1ROfz5NFcsNFpoQ5RAQM+a8EWEMlmH
	 H0Iv4jbRvbcrHo//Ad8G+0kuUE6rScTAY0kiBL94RDmrNNX9VtBlppZmyexFeOAwpO
	 msxiRe21FNHiY8Kl6QbOIdAu+KX9tlzbb5jif1vH/lEcdegMkB7jodtwqV+h7OfHBm
	 JDwtPBmFbZtxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/4] dt-bindings: i2c: qcom,i2c-geni: Document
 multi-owner controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Kumar Savaliya" <mukesh.savaliya@oss.qualcomm.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, dmaengine@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260813140047.1006478-2-mukesh.savaliya@oss.qualcomm.com>
References: <20260813140047.1006478-1-mukesh.savaliya@oss.qualcomm.com>
 <20260813140047.1006478-2-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 14:10:12 +0000
Message-Id: <20260813141012.B5ADE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema documents a runtime restriction for `qcom,qup-multi-o=
wner` but fails to enforce it programmatically, allowing invalid device tre=
es to pass validation.
--

--- Patch [1]: [PATCH v9 1/4] dt-bindings: i2c: qcom,i2c-geni: Document mul=
ti-owner controller support ---
commit 744011d8e769def492430680cc665ca844b312d6
Author: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

dt-bindings: i2c: qcom,i2c-geni: Document multi-owner controller support

This commit documents a new qcom,qup-multi-owner property for QUP-based I2C
controllers that are shared with other system processors. It instructs the
operating system to avoid assuming exclusive ownership of the hardware.

> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yam=
l b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> index 51534953a69cf..ed9b029603fdf 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml

[ ... ]

> @@ -60,6 +60,22 @@ properties:
>    power-domains:
>      maxItems: 1
> =20
> +  qcom,qup-multi-owner:
> +    type: boolean
> +    description:
> +      Indicates that the QUP-based controller is shared with one or more
> +      other system processors and must not be assumed to have exclusive
> +      ownership by the operating system.
> +
> +      The associated GPIOs must not be reconfigured into a sleep state
> +      during runtime suspend, as doing so may disrupt transactions
> +      initiated by another owner of the controller.

[Severity: Medium]
The prose correctly documents that the GPIOs must not be put into a sleep
state when this property is present, but should this be enforced
programmatically in the schema?

Without an allOf conditional block restricting pinctrl-names to maxItems: 1
and disallowing pinctrl-1, device trees that mistakenly provide a sleep
pinctrl state alongside qcom,qup-multi-owner will silently pass
dt_binding_check and dtbs_check.

At runtime, the power management core would then automatically apply the sl=
eep
state during runtime suspend, which disrupts the hardware as warned against=
 in
the description.

> +
> +      Each owner is responsible for maintaining any resource votes
> +      required for operation of the shared controller (for example clock=
s,
> +      power domains, interconnect bandwidth, or other platform-specific
> +      resources)
>
>    reg:
>      maxItems: 1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813140047.1006=
478-1-mukesh.savaliya@oss.qualcomm.com?part=3D1
