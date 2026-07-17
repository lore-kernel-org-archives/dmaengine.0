Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FAA3947B8;
	Fri, 17 Jul 2026 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784291741; cv=none; b=O4+qgcwNQXOV5YuBXeVazs24iu2oJz18Xn8tIsA+gILcvqS/85BdoKmDhRyoHFu/1wAEnWDsr/5YasF/+Y8XF2eeGfrRlP/gkv2IjvqR+KM6xo2obE4qwaR+cmg7BOUa53PkI2FeD4cGn7VO4Lc+V7uWoNlynQEHBzJl+TDYXPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784291741; c=relaxed/simple;
	bh=crAxDYFWBsPoHYtJplTfaWrNlreEKCmvFcOGRjlhvWk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iVk9niqffvQpKjlzUyU5fzHwVEAbjRol8ayDXePC2KBcdVb4oH6OVuREB+WLYkLs+fK+10Y1r426hm1JamW0noAwLbiwKL2cw1Ci+4dbJNgTpafV6MAp5WJQx6+AE4feBn05LctB8PeSlGVo4xznKseG0RVgMn2eJFSjxzhk7Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NzxcOn7E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NzxcOn7E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF6C91F000E9;
	Fri, 17 Jul 2026 12:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784291739;
	bh=eQBV55pjnPQzDP+7XLl0sT2CKxbeF7SyKYEGPiZVinQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NzxcOn7E2r9Xy1DDG2MutRPBR1JRlm+9Wd6wqR0bviRX5uhKgenCqXRxOyllvSOBH
	 4D4hbAJqEGGRY2n/W9gC6YKLzNGswuU12ocXS4xynXmjdGikdMpfduSYHjS62H76gA
	 OAGOfqWEPY3HmPzpYKVrlI3iJZEXtPDeOMCZZ8QByoXzrC3tyEUx9NVXoyINGNMZO/
	 0U1G8ZxreuM5HwiUDuONVFnnBrK/UaL4qd/WTS8LmfcNw9YPaDXP3xJwXmhmaFq6v9
	 jWT3T/HKGIuJK3RLFXRp/W+6h0HG5Wkasxi9JRmrzfFLIqh+d6qC9DW/rEFXwJS/rc
	 rcrj+ddlt//bg==
From: Vinod Koul <vkoul@kernel.org>
To: peter.chen@cixtech.com, fugang.duan@cixtech.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, ychuang3@nuvoton.com, 
 schung@nuvoton.com, robin.murphy@arm.com, Frank.Li@kernel.org, 
 Jun Guo <jun.guo@cixtech.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260521072924.3000282-1-jun.guo@cixtech.com>
References: <20260521072924.3000282-1-jun.guo@cixtech.com>
Subject: Re: (subset) [PATCH v7 0/2] dmaengine: arm-dma350: handle shared
 channel IRQ wiring on sky1
Message-Id: <178429173437.1176696.17881383591434929640.b4-ty@kernel.org>
Date: Fri, 17 Jul 2026 18:05:34 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 21 May 2026 15:29:22 +0800, Jun Guo wrote:
> This series updates DMA-350 support for the SKY1 integration where all
> DMA
> channel interrupt outputs are wired to the same GIC SPI.
> 
> Patch 1 enables DMANSECCTRL.INTREN_ANYCHINTR in the driver so
> per-channel
> interrupt status is propagated even when channels share one parent IRQ
> line.
> 
> [...]

Applied, thanks!

[1/2] dmaengine: arm-dma350: enable ANYCH interrupt for shared IRQ wiring
      commit: 643c1e1ae3eb3cd9be31e83c2240e41849a6cb56

Best regards,
-- 
~Vinod


