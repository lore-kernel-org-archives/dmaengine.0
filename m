Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465BA2248A8;
	Thu, 11 Jun 2026 05:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781157108; cv=none; b=WGW0RzDfYW4ocof+oi7tCfb1wcB/ItaOVw6P7nI2ODJbao0PKAniBZ9VMbBWd4SaGcol7uIIhYmCL9STZQ0yal5qAObJkzTzueOtjP16RifHhu0PrTvR95RbhaXWWDn/9HpI5a1wWpULF+Olp8lNfv5R+z44Z0mc9q1wtRy9qmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781157108; c=relaxed/simple;
	bh=V/WOfSU722F6t47akPL1ckwi/HgU5jrLfYuIBesT0cs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=K0SeBVX41mzz3+GBuzlUnzyqg/HKwKiZdH0IA3D3rsOUqMcMJkr7w+tX18rh4RpBVGnZ2LFhNDlTYKb3mVY7skyg6pYG4XJLJ3qu9+xFo4TDx7jsfBgmvwsBvAZy1ZGAD4puW9XhMsNSPwboRgd8DtgYKYFRLDfKyF8HNbER8yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fV4a9xpb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fV4a9xpb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BAA1F00893;
	Thu, 11 Jun 2026 05:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781157106;
	bh=S23IQtI+0tBaqos80d73BR9DJks0cOyIqYTP5LT43OU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fV4a9xpbGgjpXYucAriw0MR4zES15K73fOTJ7woaPNhczfKJF2/iCCbBualBPzIaQ
	 YxJfyqhMhLqqORx5xpXnLYgvoxoAheqj3vWAGbpJsPyv5gAUzZuz3ilDRYF0UFQxg3
	 Z/ouqYRohzFJj9n6WO8Lw2HtoKYtB8pGr/Ue1v+/gBQPVZnSwQgvxbtMXoTAgLck7K
	 mfzrqsuLBzcubFYj4Pm19fbzaOcelXbiNOUXjBucRn2fD7UiehoXxfT27xFF9w/85U
	 q1SQCW29f8JR7rWfCD93jKLYrPlikTv2By/KMf8Gw3uXi5pus6iTgMhxqyqov83K56
	 /LfctOd12e2GQ==
From: Vinod Koul <vkoul@kernel.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
 Longbin Li <looong.bin@gmail.com>, Yixun Lan <dlan@kernel.org>, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@kernel.org>
In-Reply-To: <20260511063818.463877-1-inochiama@gmail.com>
References: <20260511063818.463877-1-inochiama@gmail.com>
Subject: Re: (subset) [PATCH v6 0/2] riscv: sophgo: allow DMA multiplexer
 set channel number for DMA controller
Message-Id: <178115710130.468137.1246445545709441202.b4-ty@kernel.org>
Date: Thu, 11 Jun 2026 11:21:41 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 11 May 2026 14:38:15 +0800, Inochi Amaoto wrote:
> As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
> the SoC provides a dma multiplexer to reuse the DMA channel. However,
> the dma multiplexer also controlls the DMA interrupt multiplexer, which
> means that the dma multiplexer needs to know the channel number.
> 
> Change the DMA phandle args parsing logic so it can use handshake
> number as channel number if necessary.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: dma: snps,dw-axi-dmac: Add fallback compatible for CV1800B
      commit: 7524fe142b5a772f8421aeee2132cf7e21a00103

Best regards,
-- 
~Vinod


