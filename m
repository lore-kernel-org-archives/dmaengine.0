Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B344305674;
	Tue,  7 Jul 2026 22:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463628; cv=none; b=fYmRu0KlsJ1Y8wj9NXow2YeHd3Mnm/p2pB/RwXbEEx/mEH9SRObsQUpLYM6jAzrnibBGTY8DBgevHRux911AeyZRhaBaf/aC7gq2gj+xNmj/uZiqse5YDJ3O/iJd/Cpd06UgQPcmpZcttFcypi3DbU+Zy84FVET2+9uhtkU91ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463628; c=relaxed/simple;
	bh=A/cPWjlCTqppjiC3r6VqPzErIepco3ZsCNc/8MIetrc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=qq9iLoOoJFPIWyyFSZy+n1aXfUPp4qAF+auUvzeEuDPt2moTSwbSeGObrWJCgCzfZ0j/KyxYI3HDC5B4zpNSwgXiD2QWLYDSPmz3TeOs04JHlLnK6KZ3T6Y63q0ux+hzeuf+KJfc65Yt2jEFskOeaT5fekNnKaZuP/PbTIxyzRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n93krCgB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n93krCgB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890C91F000E9;
	Tue,  7 Jul 2026 22:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783463626;
	bh=g+LifxB+QsWGTZ7oP/yAFMI7T4DiYAnNEVFq+VdDCEc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=n93krCgB88v/aBiOsZEMyU4ZGcw0wiSNi1Xv0QFB3RBrFyXe1vKRk64g1feEOYRfa
	 F89ZkaAOyJl7k5/BaLTnUbglWyC5vxcFVyYyVUuKJnLGaP9lu28YiPPShltJgbVNAF
	 XTnUeiISDtBtvFueySOyWCXpm/+crf1mJKyfELxVAdTRWMcs9t3QlNo2FcNBY7uez1
	 Pv1pMH7ongRdUdYaPfgm8uE0Fi4zz6oVf621Y/4+H+suAiYhe+KvUWJnO2tuvUfeIc
	 n99MprjDSeHcUxhSlSRewDotmrlptPFEJzdupVyTHuaRQQJn6v5YCOYGuCbr0twc1D
	 q9cvJjJpRU3GA==
Date: Tue, 07 Jul 2026 17:33:45 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: dmaengine@vger.kernel.org, Frank Li <Frank.Li@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, daniel.baluta@gmail.com, 
 goledhruva@gmail.com, linux-kernel@vger.kernel.org, simona.toaca@nxp.com, 
 m-chawdhry@ti.com, devicetree@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
In-Reply-To: <20260708-ti-dma-crossbar-v1-1-f62796428f13@gmail.com>
References: <20260708-ti-dma-crossbar-v1-1-f62796428f13@gmail.com>
Message-Id: <178346362587.299900.10175616533527803058.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: dma: ti,dma-crossbar: Convert to DT
 schema


On Wed, 08 Jul 2026 02:59:01 +0530, Bhargav Joshi wrote:
> Convert Texas Instruments DMA Crossbar from text to DT schema
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../bindings/dma/ti,dra7-dma-crossbar.yaml         | 105 +++++++++++++++++++++
>  .../devicetree/bindings/dma/ti-dma-crossbar.txt    |  68 -------------
>  2 files changed, 105 insertions(+), 68 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/dma/ti,dra7-dma-crossbar.example.dtb: /example-0/dma-controller@4a056000: failed to match any schema with compatible: ['ti,omap4430-sdma']

doc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt
MAINTAINERS: Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt

See https://patchwork.kernel.org/project/devicetree/patch/20260708-ti-dma-crossbar-v1-1-f62796428f13@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

