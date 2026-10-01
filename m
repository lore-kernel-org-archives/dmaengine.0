Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1732F4B2031;
	Thu,  1 Oct 2026 09:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845722; cv=none; b=MHTia4BGPl6soF/YhGuzZ6aHiZYdTQnRoNJaHYMHoZ0GXNTmJM4O/BxRHkGPB+DYfjDyDAjy5WcSYWBVFTigChY6DZ89sm4+mGCIElFnsWyGh5e5yz2/uLwtPmVGX5OvhH1rIatIHGCzMwoB7eXmdLk3CQW8YAH5vU8pZ0zvMHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845722; c=relaxed/simple;
	bh=WXNlVnoI2VfZEsDH0LkAE/SsfdFZRbuKdn75YznnNUM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=abGM8SzXf8Z6Z+iREEpysX359VMcQLvyOt8yyo3+361SWKHOwdPFM4efVx1BpnnEddSVMSYThWxtLp0zz8e3GGGU2e43W1aSW3B8rwc14OKe4xPimp6pbysJCBOF0FsVWr9hlQZ1wOlg8JObfW7L4BzzrRPJOIBoqXOYsN2hHNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVYDRsql; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVYDRsql"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C2A1F000FF;
	Thu,  1 Oct 2026 09:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790845721;
	bh=Antg2aEnAamoqtlo4IjRtRkHzJ31zsalyQDGYb/LQYg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HVYDRsqlEZM+lrnkemSI6ivcbyHpwccl3Eivgtu1nlNwPkY1zi4sY2568eRcvejMu
	 5NrO2ipxuWB48NiQnfl61v/ZTYMo77a+5rENAQb/uCdG/zxca3zc73wQgr4njSkwDF
	 bSuBfSlQrtBdsSwIQwgo7Kflzasg/+X7Cdyfnt4oz9qGWW2Ftc5NqLiGRyzba1RYVh
	 JakXsjhuF0oqocewYaPCpNfjZ0Bd/XH2gZ6aCmjRnwoWrdJmcq3wJcSH2dYdZ+UZxL
	 WW0gwg0nqoi03Fgfgg6rWBsPkw/Rvw9IdekHuDWZUXdxZCi17eXi0yJQbxkgBCtoH/
	 H/QI5O5q2tJJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 13/19] dt-bindings: dma: ti: Add K3 BCDMA V2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org, robh@kernel.org
In-Reply-To: <20261001084105.1692228-14-s-adivi@ti.com>
References: <20261001084105.1692228-1-s-adivi@ti.com>
 <20261001084105.1692228-14-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 09:08:40 +0000
Message-Id: <20261001090840.93C2A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: dma: ti: missing power-domains property in AM62L BC=
DMA schema
--

commit 9c4ddac8074788bfceb8a94493e2349001561825
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dt-bindings: dma: ti: Add K3 BCDMA V2

New binding document for Texas Instruments K3 Block Copy DMA (BCDMA) V2.
BCDMA V2 is introduced as part of AM62L.

> diff --git a/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma=
.yaml b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
> new file mode 100644
> index 0000000000000..76184485ebcba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - "#dma-cells"
> +  - interrupts
> +  - interrupt-names
> +
> +unevaluatedProperties: false

[Severity: Medium]
Looking at Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
at line 91, since the K3 AM62L architecture utilizes ARM SCMI for device
power management, does this strict evaluation constraint cause device tree
schema validation (make dtbs_check) to fail?

The BCDMA device node will need to explicitly declare a 'power-domains'
property to be powered on. Because neither this schema nor its referenced b=
ase
schema (dma-controller.yaml) define 'power-domains', the dtbs_check tooling
will reject the architecturally required property as unevaluated. Should
'power-domains' be defined in the properties before setting this to false?

> +
> +examples:
> +  - |

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001084105.1692=
228-1-s-adivi@ti.com?part=3D13
