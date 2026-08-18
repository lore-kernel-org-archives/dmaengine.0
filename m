Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A33383992;
	Tue, 18 Aug 2026 14:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787064002; cv=none; b=RDxLLEy1PY5oLYfyrkV0EGKlNKwPegLzjFjiMqSHMKkG1ru7tDHoq2unE/x4Mryg7wwnZ1nCjEFoNIvEPZDj+mYIX+4hz/ietTpG10y4/pShYxyhbC8QsrJld8tZZwqmhym79Kwc5JhRM9KtIgqc3rtQvOhVucjolHc8T0Dd+Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787064002; c=relaxed/simple;
	bh=jJRy33Qw7gjf5VazTIiKnqGCkIY94g82CDMejK8skQM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=begTS3t6kFEhf5tGRtmaom4mvqtff8VlWXAwyJmbCupX1asLDRi3p5/XhbTJIRQBglyfef2hDjjMLN9noP5msRJL0hlfEI2SZRo+fCBU+27ezJP8/575eASKdgoDP4N00maT9eOuMWr2NVEoxrfbsEHElr8nrVLmvVZyUR4IgCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVr6at1Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BVr6at1Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62EDD1F000E9;
	Tue, 18 Aug 2026 14:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787063997;
	bh=er/0nV7w+oGeRHh6AqEbsRwMsWqcUWi2VR+u+1xufFo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BVr6at1ZWynlzycbyMfW5uRRkUD2T6Rm0TBEyd8rxIIqqw74GzM2QQxPWnjjuXHTu
	 ZHTIjbYy4gnz72PsVGGziqzbtbVtPeUm3EHiqkaIqnMZ9KTz7cF2+1SuMIgtkdMKm5
	 U1X5y1frj6Kmww7FuXXz6eCx17cpoUzoZVC4sH6sMk5rjbVViMvbeh1srqjbekWIq2
	 TCdy1Mw/4TEH60cCCOt7fmi9SFWPMFxVUjbnnPs+nBHsazKUFL1ZDdXDiEfAAUko6y
	 HwOitv1LstV/zXB9d/yu6JpQcnqFum9e0toO10DM27J8VsFOnYR4ftBCaKNceQIdmc
	 pEVBT19WTsBKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/7] dt-bindings: usb: ti,musb-am33xx: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org, dmaengine@vger.kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, Frank.Li@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260818-ti-am33-usb-v2-4-66fd44d66824@gmail.com>
References: <20260818-ti-am33-usb-v2-0-66fd44d66824@gmail.com>
 <20260818-ti-am33-usb-v2-4-66fd44d66824@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 14:39:56 +0000
Message-Id: <20260818143957.62EDD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing type reference for `mentor,ram-bits` vendor property in DT =
schema.
--

--- Patch [4]: [PATCH v2 4/7] dt-bindings: usb: ti,musb-am33xx: Convert to =
DT schema ---
commit cf3529cd6795cb99eba5fc624b9972e24548b4e8
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: usb: ti,musb-am33xx: Convert to DT schema

This commit converts the TI AM33xx MUSB text bindings to DT schema. It
also introduces several updates during the conversion, such as allowing an
optional vbus interrupt and adding interface-type and phy-names properties
natively used by the dm816x hardware.

> diff --git a/Documentation/devicetree/bindings/usb/ti,musb-am33xx.yaml b/=
Documentation/devicetree/bindings/usb/ti,musb-am33xx.yaml
> new file mode 100644
> index 0000000000000..cc01edc75d11e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,musb-am33xx.yaml
[ ... ]
> +  mentor,num-eps:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Specifies the number of endpoints.
> +    const: 16
> +
> +  mentor,ram-bits:
> +    description: Specifies the ram address size.
> +    const: 12

[Severity: Low]
Will this cause schema validation to fail during make dt_binding_check?

Without a type reference, the array <12> in device trees might be validated
as a matrix against const: 12 instead of a scalar integer, causing a type
mismatch error.=20

Should this include a $ref to /schemas/types.yaml#/definitions/uint32
similar to mentor,num-eps?

> +
> +  mentor,power:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Controller supply capacity (in mA) when operating in ho=
st mode.
> +    const: 500

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-ti-am33-us=
b-v2-0-66fd44d66824@gmail.com?part=3D4
