Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FF94F55DB;
	Thu,  3 Sep 2026 17:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455100; cv=none; b=ZPbj5niL3XQYFNttbrDv+rwalM0CSgthKkLk6Fv9Htb0rJlyGDaO7QsDJa2cMkBmVhZeSk5emR5yCwwwopGRPTltFmcLVHScEj1dmCY4TAqytOccYI54OfpZ5tECqYH4kLqtjWt1lzkSR72fKs+C7TIjy66ik3vIR6+D3WEd6ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455100; c=relaxed/simple;
	bh=EzEbSQ0Sz5OBojozL/be6ahJbK77uZ955dHzodA8Qdg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U/uC2XrK5BmKUrz1lYmycDVsohzP6QxYbkeVOmzV73kqjtIqr+OnmfNBmTTMhGzZKjbv7ze9ZNqlZFq4jAwbiR0M6gRgbSbIwkpdvvo4UIP2c5eX3MnzvjwkcC3bMqJ5H8Fn54BU1smgDn5qzQQqKQcC2Ia0BpjN5YkSVDKPduU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fRlf0DDq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fRlf0DDq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834C31F00A3E;
	Thu,  3 Sep 2026 17:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455098;
	bh=vYNQ8VX97EaCI8U1DSIB17rVPQxvYw0f7K2FluDPZoA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fRlf0DDq8TN6EgULfeOX0yIZMBB7GUdK+mj9D9bekyGgEh2BNMC1L7IJekf/p2DVq
	 Pn3NvubYZgZHRUvymmmiYJnqeKh59Eqr4nkN4bDQV/JEUcKjo6pUf+5+Ynkm3Zqlus
	 Z64xrDe2tcaQTNYeeEFyClqxVEZ1K5kSJ8Gwip2isGTt6mXVOwT1jHRkCr6hozdwuk
	 bVln045yaTHz6nG7MtBU1Kf2jrA+O6ST7p4vY03P6yO5x8Ck91GNeD/TybBN5Rwt+t
	 UMgerG8ngVxK6aqaed3bcvATkbjJa6QHvR4RCR1mGFd7ixY4eQmN3c79w2A1xln/+d
	 VrJce9NYZ9uTA==
From: Vinod Koul <vkoul@kernel.org>
To: Frank.Li@kernel.org, michal.simek@amd.com, 
 Golla Nagendra <nagendra.golla@amd.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, git@amd.com
In-Reply-To: <20260814045616.1661199-1-nagendra.golla@amd.com>
References: <20260814045616.1661199-1-nagendra.golla@amd.com>
Subject: Re: [PATCH V2 0/8] dmaengine: zynqmp_dma: Fix error paths and
 follow-up cleanups
Message-Id: <178845509608.1711546.18424966399852946639.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:34:56 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 14 Aug 2026 10:26:08 +0530, Golla Nagendra wrote:
> This series fixes error-path cleanup issues in alloc/probe flows and
> applies follow-up cleanups in the Xilinx ZynqMP DMA driver.
> 
> This series fixes error-path cleanup issues in alloc/probe flows and
> applies follow-up cleanups in the Xilinx ZynqMP DMA driver.
> 
> Patch 1 fixes runtime PM rollback when sw_desc_pool allocation fails
> after pm_runtime_resume_and_get().
> 
> [...]

Applied, thanks!

[1/8] dmaengine: zynqmp_dma: Fix PM rollback on sw_desc_pool alloc failure
      commit: a073a5796b3b95062f2c1ecf6ab446cb2596f38e
[2/8] dmaengine: zynqmp_dma: Free sw_desc_pool on desc_pool_v alloc failure
      commit: 25cfbf610a7277e0b08195953fb6aaf8b64cf845
[3/8] dmaengine: zynqmp_dma: Fix chan probe/remove error handling
      commit: 3f30db282c28cc35a502aa1cec34fb642854b057
[4/8] dmaengine: zynqmp_dma: Fix stale kerneldoc comments
      commit: 584f033c5c7954a412781e9089247cd6f47ae73e
[5/8] dmaengine: zynqmp_dma: Fix minor whitespace
      commit: 5089056bf050e3231313d873e0bc1ed0c63e5418
[6/8] dmaengine: zynqmp_dma: Use of_dma_is_coherent for dma-coherent
      commit: ce71cd145014d50ce4f9358c23c933b60f205cdd
[7/8] dmaengine: zynqmp_dma: Reject zero-length memcpy transfers
      commit: fec4a5a61945e641eb9ce89e24598ee19a78cebc
[8/8] dmaengine: zynqmp_dma: Remove unused define and duplicate IRQ bit
      commit: 868457a86a585d0ff04f03ecca2a5737561f23e7

Best regards,
-- 
~Vinod


