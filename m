Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD5239D6CE;
	Tue, 12 May 2026 22:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778624311; cv=none; b=b3sPE511bNGYk9gMaeBCKeaZUA9ipNrM4rvcbNLInmnwrlkLsA/WeC5yl1hPg0LppVSqNym3OmT8fhpP9KaWC0xPg0V9i01loYc9nDWq7QHEL0O4nw+5/zS0manXDcA5PXEPBxjdNHg7mb+RkVWlkWaNyWhuzIJDdu09AphLQmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778624311; c=relaxed/simple;
	bh=TTrcV+tl8jNIouLBzWAhXn7QW9/sf2i2hkZiIGuXrfg=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GwvmYAoTitQx/2ekgOdUBmi/1cJCIsE5PG3VDVXQ6UMNkrujhkqInj12/kKrjVmUXsoYQ5EAnwELe5O2wOJvoUZkxne4xCsZormtcpO5awF1iWleCB3LfG1/A7JfdXyAUGajzKQr2wGVfbySXcn7+jtXrZbgCAvo+IyCLX9zZP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ms/7J8An; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ms/7J8An"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35494C2BCB0;
	Tue, 12 May 2026 22:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778624310;
	bh=TTrcV+tl8jNIouLBzWAhXn7QW9/sf2i2hkZiIGuXrfg=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date:From;
	b=Ms/7J8AnBN4fqwJNk1XUMcSy6ZLh0JrEf+S+4ZiQ2XPZi1PpTA36jvqJJiaODHgqm
	 PRREzBuc6S+t1va/0+UjX9vFhS3AjfEdDtdjeTr3ATENYWvdXw7icMkqvI53KOAE8n
	 7CIN8OpTJJo4aYG05EWtr0zmlHYa7E+5KsvxNCQVP6OTOp4zy9s25hzDu2V2YHLpIa
	 3A46xRxQrspcLhDBP0m717xEa6XQczX2WEP2NsIkPIZEaMGyAjMPMP4rVsSIN+3hVr
	 sQqhTdK1N/mkErOBLWSamgJrrcLXpmHuEGfZVKfuASA2rDSx8yD+xiuoq76uupzfmD
	 if01bLSATrkow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: Consolidate "sram" property definition
Reply-To: sashiko@lists.linux.dev
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, krzk+dt@kernel.org, dmaengine@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260511165942.2774868-1-robh@kernel.org>
References: <20260511165942.2774868-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 22:18:29 +0000
Message-Id: <20260512221830.35494C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The global `sram-consumer.yaml` schema causes `dtbs_check` valid=
ation failures due to a namespace collision with standard `sram` child node=
s.
--

commit b3fd675e204900532756fc42297dea0b1787d10f
Author: Rob Herring (Arm) <robh@kernel.org>

dt-bindings: Consolidate "sram" property definition

The "sram" property has become a de facto standard property, so create a
common schema for it and drop all the duplicated definitions.

[ ... ]

> diff --git a/Documentation/devicetree/bindings/sram/sram-consumer.yaml b/=
Documentation/devicetree/bindings/sram/sram-consumer.yaml
> new file mode 100644
> index 0000000000000..f00087bd2879b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sram/sram-consumer.yaml
> @@ -0,0 +1,26 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sram/sram-consumer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SRAM Consumers
> +
> +maintainers:
> +  - Rob Herring <robh@kernel.org>
> +
> +select: true
> +
> +properties:
> +  sram:
> +    description:
> +      Phandles to one or more reserved on-chip SRAM regions. The regions
> +      should be defined as child nodes of the respective SRAM node, and
> +      should be defined as per the generic bindings in,
> +      Documentation/devicetree/bindings/sram/sram.yaml
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Will this cause dtbs_check validation failures due to a namespace collision
with standard sram child nodes?

Because select: true makes this apply globally, it intercepts the "sram"
key for all nodes. In dt-schema, properties and child nodes share the exact
same namespace.

A child node named sram without a unit-address (which is permitted by
sram.yaml and exists in device trees like arch/powerpc/boot/dts/ebony.dts)
is represented in the YAML output as a JSON object assigned to the "sram"
key of its parent.

When dt-validate evaluates the parent node, this global schema will attempt
to validate the child node object against the phandle-array constraints,
triggering a schema validation error because an object is not an array.

Is there a way to limit the selection so it doesn't match these child
nodes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511165942.2774=
868-1-robh@kernel.org?part=3D1
