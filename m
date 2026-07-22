Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC60943BDAE;
	Wed, 22 Jul 2026 15:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784734384; cv=none; b=I/tSXifDKtO/dtxKwI+KXE7DC25O8FVfEAcTYdDvy1qHyHzRV3YL79gR/qbYPjqMsXxBd+AnkX2Zelya9yUfCockR/eq/F5zet7eF8Gk3IJQHPqL7X+JOUCzdMqsHHa2/whoh3PbZmmcgOVC1Ed3ya6r2IPvUs+B7LUstCY/HJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784734384; c=relaxed/simple;
	bh=+dvhJmSk7v30m0FTGA2dBEu4s0VprWbe+kWDTrfOmRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJXDlSTOZjR4u0ESNbHo1VqHe97y7MeFjqtaTm5MuNhZc8ih7nh8js5Pv/hlyFRtn8SG4iMd8h5EPMW497glF2He/rLLkRtotuAaE7ZIkZTq0H3BBpnf4sUe7ChkGZFnsgfe7+OgQ9ECH8wpzauCzFqauKv5+fi3sOy98utEKaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXceiEvp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXceiEvp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 375801F000E9;
	Wed, 22 Jul 2026 15:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784734382;
	bh=jCyeQsC/NQtE44e6R3XTzjbmHyTKitYrYZlzJuxW7pc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fXceiEvpxZMx7DzEdab8714T1YNNcabB3VkKFWr6cFo2JLsO5EnKLHAknt48UHnZy
	 x5BRXB0N3iPiCsoPVvXCwHKwjIWcjIyoQXiHXInsEhJUvKvxHHUIPVnfIdfwznQYPp
	 msgjaT/L31N3L2rZHAa89gAj+ZHCab7VCtPtmqmHTY0RlAnJhmskj06tPYpa7pitqH
	 7+HDty/qRcuqs1OFnDdyT4e3Ify0rlTgC81DjFbIyKRMnY5dKOE/FzaCeRr7HGc5nx
	 qWMZXHNGbjoA3UEavy3yAMaGAFzMJsXJ2hVUSzaC0Cz44hmgis3nG35GRGCSft7fyH
	 Q8ufF//E9rNAg==
Date: Wed, 22 Jul 2026 10:33:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: chris.lew@oss.qualcomm.com, dmaengine@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Frank Li <Frank.Li@kernel.org>,
	Andy Gross <agross@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: dma: qcom,bam-dma: Add optional
 qcom,vmid property
Message-ID: <178473437962.973796.9171369311202714598.robh@kernel.org>
References: <20260714-qcom-bam-dma-vmid-ext-v1-0-cef87c57b7dc@oss.qualcomm.com>
 <20260714-qcom-bam-dma-vmid-ext-v1-1-cef87c57b7dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-qcom-bam-dma-vmid-ext-v1-1-cef87c57b7dc@oss.qualcomm.com>


On Tue, 14 Jul 2026 10:30:22 +0530, Vishnu Santhosh wrote:
> A SoC can have multiple BAM DMA instances. Some of these BAMs are
> powered by a remote processor that enforces XPU (eXternal Protection
> Unit) access control and reads the per-channel descriptor FIFOs as an
> AXI master under that remote processor's execution environment, so
> their FIFOs must be accessible to the remote processor's VMID; other
> BAM instances on the same SoC are not behind such a remote processor
> and must not have this property set.
> 
> Add an optional qcom,vmid property listing the destination VMID(s)
> that the affected BAM instance's descriptor FIFOs must be accessible
> to. HLOS is always the source owner and must not be listed.
> 
> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/dma/qcom,bam-dma.yaml      | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

