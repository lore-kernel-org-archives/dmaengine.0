Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019963;
	b=XjZFm/1CpQfW8yd4JbGN95HqvM1mQ9DGRhShrAS5Yq0u1cnBTqcCbc8+EE3i4rI+HohP
	 Pse/fNwDVszfXJZYrsWE2/b90c/yISdc2Gq96/xvYUpA9JeEI7k6ta2A8zmzYN+jBmKvu
	 LUuZhflC6dmyuP49MzMncMnObY2c6W1ru5eV0QNUbiZkMWiS4UE0H6Zrj1RhEKxIJ8/Q6
	 RmA1mc606Y71iX/45Y11D6kx1vIFZjrykRH8bu1xCkd/ciScG62jA5Gzcnlbvx0D4XY9G
	 3HtLNgMPMHlqMtsqUauEzLXueKjDqaq60/gGez+XqCrtXOw4kGBxVJmaMdrTS6Mr2hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019963;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kkH6KT9YgQEaQIh5o/b6uPpY8JBnN++SCpsirUSYIMg=;
	b=ugCDCMuCu1cw6JMd04g159l5NHaXYV8AUSRwnkE9v/guYeNal+qeTEsCR7XbYkj/HFpK
	 1EHuEppkpiDRvRU609F7RQeRc8Lc6MYzug5Qm8lqhzbAfw+1h8JKA90eedCF5pBWni8PX
	 yRy9nXQEZscc95YVfWOuLpTro60pbez+fckaNpXPu74sh9ioyKQxZwY+IRisvpHkAqseF
	 5ec7BZJPHpqwV0QyTycy8bzKbvyjEUw6TpkkSTiNQbT+Y/hmNk4ilTN/Wp8Tgxgvpu3OZ
	 QTbxP+L7Ff9Pg4nF2Rm4MdWIRpkYCs4rgqXwHtGeGUTuivvXNVHAJCuPFc7IXFlXNkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nGVgDUiM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E66606A31A;
	Mon, 26 Oct 2026 13:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nGVgDUiM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F5C1F01825;
	Mon, 26 Oct 2026 13:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793019963;
	bh=kkH6KT9YgQEaQIh5o/b6uPpY8JBnN++SCpsirUSYIMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nGVgDUiMGFXaMuKbSKxB371FMh8PTYvCoWvT1f7VOqYXWQ7ADd9TxLV/SOGd39w6U
	 iDQSx/byR9RVxqov//2NuHebyElBymxH12n47VtKd3+ewQloh0TRiNidfuY2uNHXw9
	 iCVZkZijw+xzg+9kWPAYtWzmWklL9H27uNx8GS6LBo/ojWn1Z8AsfhIZtfcRpoRuuu
	 j8FJ7Day0uicms0AplX+kCU66V50Ks6q5V1DT9la2oYoIkhtLery0jVbSwx0Nij0rM
	 NzC4VBvZB0ZfAEppayRCzn9LtCqJ781yXnrzi+WnV0eN3bvC9Lrf175COtUAH/hcKR
	 34nwjozNoDlRg==
Date: Mon, 26 Oct 2026 08:05:59 -0500
From: Rob Herring <robh@kernel.org>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH v3] dt-bindings: dma: qcom,bam-dma: Allow memory-region
 property
Message-ID: <20261026130559.GB3598537-robh@kernel.org>
References: <20261021-qcom-bam-dma-vmid-ext-v3-1-299355e8dd3b@oss.qualcomm.com>
 <20261022140139.GA952798-robh@kernel.org>
 <adffece9-165b-4576-b111-6aa40a443734@oss.qualcomm.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adffece9-165b-4576-b111-6aa40a443734@oss.qualcomm.com>

On Fri, Oct 23, 2026 at 12:05:50PM +0530, Vishnu Santhosh wrote:
> 
> On 22-10-2026 07:31 pm, Rob Herring wrote:
> > On Wed, Oct 21, 2026 at 11:22:35AM +0530, Vishnu Santhosh wrote:
> > > Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
> > > domain, preventing it from accessing BAM descriptor FIFOs allocated from
> > > arbitrary host memory.
> > > 
> > > Add an optional memory-region property to constrain DMA allocations made
> > > by the BAM DMA controller to a restricted DMA pool. Access permissions
> > > for the remote execution environment are managed separately.
> > dma-ranges is normally how address restrictions for a device are
> > defined. Why can't that be used here?
> > 
> > Rob
> 
> The constraint here is access permission, not addressing. The modem can
> only access a carve-out that is assigned to it through SCM.

The reason for the constraint doesn't really matter.

> The soc bus on Shikra already has an identity dma-ranges covering
> 64GB [1], so there is no addressing limitation to describe. dma-ranges
> does not reserve memory, so allocations would still come from the
> general page allocator, outside the assigned carve-out, and modem
> accesses to them trigger an XPU violation. It also applies to every
> device on the bus.

It's a bit awkward that dma-ranges needs to be in a parent node. So you 
would need to put the device in its own bus node. But if dma-ranges is 
in place, DMA allocations will only come from within that range.


> The A2 BAM on Shikra is not behind an IOMMU. restricted-dma-pool
> provides a dedicated, per-device region, which is the setup it was
> introduced for no IOMMU, with firmware restricting device accesses to
> specific regions [2]. Stephan suggested this approach on v1 of the
> BAM-DMUX series [3]. The BAM DMA controller and BAM-DMUX reference the
> same pool, so a single assignment covers both the descriptor FIFOs and
> the data buffers.

I suppose that since the memory region is dynamic, 'memory-region' makes 
sense here. If firmware determined the address of the region, I'd 
probably feel differently.

Rob
