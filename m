Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3044F1A9F8C;
	Thu,  2 Jul 2026 16:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008226; cv=none; b=Z2uVq2HdhcEpdRV0qpV39ADzEu7P39VAg5rhnAWeVp/Lz5u3o+dXO3zVkfoN05sAPiIJufTXDs3MW/1NeTCyj/wMVp7QmWeTSVkMT5Yldm2UezLf0Fd6d0LDS3ON3QQfVSWSXa8ymsRTiBkC0uXJRxAYJETSlluS6mQhobd67f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008226; c=relaxed/simple;
	bh=2W5jI5Z0ruU7sjL+sATlklT+n3cwAfJOAOb87kLkQX8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ANdohWk6Km0amaR9p7elPKSvlQlOyKGbALQxO3+pYk2/pM+CMlISp6n76rW/sDY5YZbzev3tGNsBbtcJhKeuFANPxyX4joZnMoiCuG83QbyEeCvwnku8wgviEVLKT9jynu03xZDb5x5AvWR48PIqonrpap6tG+FxmU9GgxjOFhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XDmHyGxW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XDmHyGxW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 330CD1F000E9;
	Thu,  2 Jul 2026 16:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008225;
	bh=rzDg6Eu0nRR4p4AkNSCywRzTxAwA/c7nHfpbUiOlcNE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XDmHyGxWFNpd+TXH31F8Y65qId4sMIqFOB/0x0UMCZtGjx1jtvshcuYYeASiYxTcO
	 dBk8EX9wQiBK4XTNWdHEODZqN7CNateo63o+1QQ1ZvG4nSZXjJrskVxNclS9QB7c7j
	 rwg8IqwC+anXaKa8AEZsX058hCfCTFGZQptu/CQh8NPFr7uGPg+uGZ5sDofleZ+Qrc
	 M7VuuR01jXbWi+uD3guMuH8+vnhHmmYaZ9sG6fppmDOjLvvJTzaqLOY5cSK/ZT5XM2
	 hqqdwi6jI1+WYZjlmYitdaD/B7kkTG9JB78Ch+suKYQ3lztkYEPlBBDEhwtL3M2VBW
	 li4EWV8pKpXMQ==
From: Vinod Koul <vkoul@kernel.org>
To: Frank.Li@kernel.org, michal.simek@amd.com, dev@folker-schwesinger.de, 
 Suraj Gupta <suraj.gupta2@amd.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260626092656.1563871-1-suraj.gupta2@amd.com>
References: <20260626092656.1563871-1-suraj.gupta2@amd.com>
Subject: Re: [PATCH v3 0/3] dmaengine: xilinx_dma: Fixes and optimizations
 for AXIDMA and MCDMA channel management
Message-Id: <178300822284.756665.15130671466547971043.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 21:33:42 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 26 Jun 2026 14:56:53 +0530, Suraj Gupta wrote:
> This patch series addresses issues and optimizations in the Xilinx
> AXI DMA and MCDMA drivers:
> 1. Fix channel idle state management in the interrupt handlers.
> 2. Enable transfer chaining by removing unnecessary idle restrictions.
> 3. Optimize control register writes and channel start logic.
> 
> Note: The patches in this series were part of following IRQ coalescing
> series which is under discussion:
> https://lore.kernel.org/all/20250710101229.804183-1-suraj.gupta2@amd.com/
> 
> [...]

Applied, thanks!

[1/3] dmaengine: xilinx_dma: Fix channel idle state management in AXIDMA and MCDMA interrupt handlers
      commit: 0b6d055edb55ecadadf54e930c2b4fab76fa9a5a
[2/3] dmaengine: xilinx_dma: Enable transfer chaining for AXIDMA and MCDMA by removing idle restriction
      commit: 6078690034790131b9a59081bdf30e26de2254af
[3/3] dmaengine: xilinx_dma: Optimize control register write and channel start logic for AXIDMA and MCDMA in corresponding start_transfer()
      commit: 887b3119380cde56f648130029062c223341a1b3

Best regards,
-- 
~Vinod


