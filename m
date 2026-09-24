Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAC83BB67F;
	Thu, 24 Sep 2026 21:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286990; cv=none; b=TF1J585sCgEA8aWS8/0lmv5bNsSoxpwwfudJH44Kc/h2O2f8UZ12/H6DueI/JZOwRSWwQCon5WwC45Zz/tvqQRNX/5PsyS2A+z1qD8buTKTZJQ9Xo40RkthX92/FEluPwTxI4Mi1KkWKZgr2R1RnRqkJuU2Jj6DaRu2lIIahkeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286990; c=relaxed/simple;
	bh=1RZnBjypoREpGUu72DCZQsuhWuVJ5JcCBQ73hP7vKJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhebMVffQJYhRQg041q6AIn4Auc5Tw/3Jv/2yOrXjgIs7YLF/FQcy6/wUjdIfHb9fJsM8GpRAeHItq8CpRYDb8QryuuQWhZB0DsKVfTaez9fCoq2XttMKo2y7mYBY59QXLgvLjeWDrQc+6jrdBRsC0HH3HxqCfl3B5RIyCm9veE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ekf1ETPz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ekf1ETPz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F1651F000FF;
	Thu, 24 Sep 2026 21:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790286988;
	bh=DDHfA+QcxCkvAgQ5b9vmBtJHxJq+eo10zKzReXgxSfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ekf1ETPzJmjibOBiAc/gHiPDzRpCd98762RXz6NQfVc2Uz7dj4WghXgcnyJkIGC9h
	 5x//eRgLTPXJik0he+9/JGvhhtcYfZM1OQITTUurnOPylN6zvL8guCtrhA284smebl
	 pxW7fQD9Ki3AXwukC2qVCvNMjHT+pVU0UanxPbECGHTEsHaTIvwdMl9thmueNH9GuH
	 tJ8sMKWLxnnQSctyqOk/AEjPNXZcdOix1MLfuYv9sMr/hUXu5IMIfAmfQlBD14pimM
	 TYv27whYEk/5YR6YqSNZD2OX3xoLoYEaYimSapBQpIQz18uV6cPApWNokio6PLebD4
	 RxmNKAgKhVunA==
Date: Thu, 24 Sep 2026 16:56:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: dma: fsl,edma: add iommu-map property
Message-ID: <179028698602.1895482.8450136905176032994.robh@kernel.org>
References: <20260916-edma-iommu-v1-0-e1731968081e@nxp.com>
 <20260916-edma-iommu-v1-1-e1731968081e@nxp.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-edma-iommu-v1-1-e1731968081e@nxp.com>


On Wed, 16 Sep 2026 23:55:25 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add the iommu-map property to the fsl,edma binding to allow per-channel
> IOMMU stream ID mapping. This enables IOMMU translation for individual
> eDMA channels, where paired channels can share the same stream ID and
> channels without an entry operate in bypass mode.
> 
> Also add a new example using fsl,imx95-edma5 that demonstrates the
> iommu-map usage with per-channel mappings.
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/dma/fsl,edma.yaml          | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

