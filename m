Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2CB2FC876;
	Thu, 11 Jun 2026 05:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781157082; cv=none; b=SPOpz416PrxADG9toeagpwVDq09xAag2JdPcIHYiq7dh7AvBjZ3LHLcaoWhGN3XKahAZeFau59BjOGbhg/pqwlabmvjjqk4aO3vGLdu90nv9OD6Ske32y4j4BxA/fKoyo3Rs+OmN6/NB5eocDcVz8CN3jvzU6zZxk4oy+mPAtxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781157082; c=relaxed/simple;
	bh=LRVh/Mjk8X1vOWUM9+veeY0ohfXKgE+Jvd+woyEI3oE=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OhmlLaSHLNPE6FqkkII/QVmZlnG1ZHMkZ4Lsaqr+ElJ4cEjYm9/N3AkQLnlqMs4KmFbRBOng56186Dz7r3HWxRZvmnXEwzsMcccsYvFZwkMzV1CNyNHCe04IBMggGUCPqjY9IgmR/WJi3SkZW33QDSNoCzXoAskN/uxpOVmFVFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXf+91Rs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXf+91Rs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A6A61F00898;
	Thu, 11 Jun 2026 05:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781157081;
	bh=RemkpoCDnTZqBstYyXo0MejTmhJR+KFvhfknxwHkkJM=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=KXf+91RscAkOyQ/mijyMEYqS9lQbxVAjkf/UVjbat+VXQDepRWYuK4MOPSNQ2kHPs
	 7zAQ49JEb8R0S9kAQL/WKG5ppmL2wcsY7BlSVekSpVqGVhuBym1iGUqz7AR6NP4G4X
	 PwbhRWdtc0VQT8uZfXB3hI6/pciujovqGIPnNi/wIMf3GA0yEA4R3BBdx4iuojIEmz
	 E35lOIoFcSKSGkR2ztthUaMPQC3nUkclhYW+JlwKaj7PAik8013Fq/aOfdUWFbiyWb
	 vEKoqTfJpDyrNtBCGQGST5djbzT9uQ/0Nsnhbx/gF28zdSlIngY4q8kwJNz+gY3JIw
	 OjPfAOCyQjRKw==
From: Vinod Koul <vkoul@kernel.org>
To: Olivier Dautricourt <olivierdautricourt@gmail.com>, 
 Stefan Roese <sr@denx.de>, Frank Li <Frank.Li@kernel.org>, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tze.yee.ng@altera.com
In-Reply-To: <f6f3b4a2e2eb0eb1a51976de3f5d1ef5bab9bd76.1779697226.git.tze.yee.ng@altera.com>
References: <f6f3b4a2e2eb0eb1a51976de3f5d1ef5bab9bd76.1779697226.git.tze.yee.ng@altera.com>
Subject: Re: [PATCH v2] dma: altera-msgdma: Use memcpy_toio for descriptor
 FIFO writes
Message-Id: <178115707884.468137.4553819272853590376.b4-ty@kernel.org>
Date: Thu, 11 Jun 2026 11:21:18 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 25 May 2026 01:37:30 -0700, tze.yee.ng@altera.com wrote:
> The descriptor FIFO requires that all words of a descriptor are written
> in order, with the control word written last to flush it into the DMA
> engine. Using memcpy() with __force to __iomem is not the correct API
> and does not guarantee appropriate MMIO access on all architectures.
> 
> Replace the descriptor body copy with memcpy_toio(), using
> offsetof(struct msgdma_extended_desc, control) to exclude the control
> word. This matches the previous sizeof(desc->hw_desc) - sizeof(u32)
> length only when control is the last struct member; add a static_assert
> to enforce that layout so a future field after control cannot silently
> break FIFO ordering.
> 
> [...]

Applied, thanks!

[1/1] dma: altera-msgdma: Use memcpy_toio for descriptor FIFO writes
      commit: 94963138cce29f85605d76c94fa1d43a0335ead9

Best regards,
-- 
~Vinod


