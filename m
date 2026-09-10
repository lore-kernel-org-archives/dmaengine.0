Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F0849EC47;
	Thu, 10 Sep 2026 14:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049434; cv=none; b=EFcgEe2mspNeb2BgxXq9pJN9sOfaO4ZaMkweD66agsLwVX+FU42//ZlQHa4dTw5V+PZlSyh69OVWES+jsRw9CBNv96FylAOHLD8QeZQt+Lu/BECJ4tYBud+tykVLduZOJnHehhBe8sktwiThftM+s13M3I2NpoRilVBFNJ5g/V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049434; c=relaxed/simple;
	bh=W8J7o2tGrE8bmJt/NQdfhPyMM2tGAexIb7zF5l1uoks=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jpW1RamPoyiaQEafnrO6myerOp6/2mENHbF+TCsA1nTkZpHHB4Yd2cdb5wzs68By0FVap0FbgyjYoW+AFxPIbbUIeEsjVxAsTZ+oU88pjdgE62mL8E68+LFPcpD3F82gTMCsyJx2vt2djWR5sTwS2yw5t2/0iUUv6ClAo9GJ4Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpeecQ2w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpeecQ2w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D1E1F00893;
	Thu, 10 Sep 2026 14:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049433;
	bh=aSJlejv5iaVbiAkyqv/b7LzmZwHxLBshA8S4am7+R1k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lpeecQ2wpwuZt/sWvQVBRcnB2QZwFn/wq4oKIe5zbYhl1wcVEBZXQjk4ePLRlVUcu
	 Ilg7t4kzmrveL41SnHAo5hv8OT9TIZIa1PdAS2jelQt0ZTjU+Ih0iZUYxd72XHelPH
	 eeiORp5BzR3g7FqIpL1y8D3ejO6L1yd7/2rN4h7lp3pJNGnOtjS2eOMR4ZZKmBPD5E
	 F4jiUfa0FHgnOn/jrfsaEsYGqK9m23oSPd6Cw9q5FFVPNqsG02X0fgGH7dVUDzBY4f
	 Gv4XBe7ZFYinLce4NCEOTQiBpqQAMX50W66uq6/FDb9HVYqXzlk4yhRSpPZ59Dzzt0
	 otEzkKjBzL1VA==
From: Vinod Koul <vkoul@kernel.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Frank Li <Frank.Li@kernel.org>, Pandith N <pandith.n@intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Jia Wang <wangjia@ultrarisc.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20260902-dma-fix-v3-0-414c6449fbcc@ultrarisc.com>
References: <20260902-dma-fix-v3-0-414c6449fbcc@ultrarisc.com>
Subject: Re: [PATCH v3 0/4] dmaengine: dw-axi-dmac: Fix burst encoding, LLI
 dump and priority
Message-Id: <178904942953.118320.924635574169760656.b4-ty@kernel.org>
Date: Thu, 10 Sep 2026 19:40:29 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 02 Sep 2026 17:26:10 +0800, Jia Wang wrote:
> This series fixes AXI burst length encoding, an out-of-bounds access in
> the error-path LLI dump, and the CH_CFG2 channel priority field position.
> 
> It also converts register field definitions and programming to GENMASK()
> and FIELD_PREP().
> 
> The series was tested with dmatest on all eight channels using
> snps,axi-max-burst-len = <256>. All channels completed without errors. It
> was also build-tested on RISC-V with CONFIG_DW_AXI_DMAC as both a module
> and built-in.
> 
> [...]

Applied, thanks!

[1/4] dmaengine: dw-axi-dmac: Fix AXI burst length encoding
      commit: 0d59891c42e11c3840276d8a632dbc355d6ddc4f
[2/4] dmaengine: dw-axi-dmac: Fix LLI dump out-of-bounds access
      commit: e6b49f8016ee8b642e8e495d1704342ee0b35d72
[3/4] dmaengine: dw-axi-dmac: Fix CH_CFG2 channel priority position
      commit: 2a9013c20c46216b92ff09e2283b5244a91c59da
[4/4] dmaengine: dw-axi-dmac: Use bitfield helpers for registers
      commit: a72f75e1f5552df8765920b678a9037b7f31a91c

Best regards,
-- 
~Vinod


