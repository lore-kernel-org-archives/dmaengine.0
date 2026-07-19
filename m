Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F973B6368;
	Sun, 19 Jul 2026 18:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784485993; cv=none; b=P/qwFdKl6f3rbYwdmn1DnPujHbClEJ7QVkU/cnp46AQdLRnUM77LKxfx5wmn4dkp7lOOor3KBKH0pYhpTFaJ65OzzKc4bh5Zoy4SU2Wl9pyQ1dfQfK1IrgFHVLuT6QzFW7eUv6yweaOLloT9/44bzuzMMLVxlA+XThi0KnZkhg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784485993; c=relaxed/simple;
	bh=F+m0hJKLRRHTVDONSqx2Gh+20BsxNKmsm/K9bCIvD/8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QWaxmTCyyi79P+xtAM6m8FH+aTYzFhYeMMaVAX88FY2KJ8fVsGKg8B4U2cbvG1nbPmucVe8j11M1HE3bMxQKc7VkL+0YY5EvxadCbigTxCcijH4eMpUKylg1PShbcYk1Cnbq1XCH1qXZWeSRSNkWVgzLGBcG1XPSCYljXnLwOjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BIfEaF3J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BIfEaF3J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397841F00A3A;
	Sun, 19 Jul 2026 18:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784485991;
	bh=q4RB9nFp3ihovuaAmOWN/xIdk+m45mlyfb2xDRE/hw4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BIfEaF3JVotwkGFiGnegYKUa0/XKKMdkGWPTK48VaMjxUoNemoRR2M79euguhYblN
	 VVdVhqT9QLEbJdiGzLoEODLJm5vmfpbc0WgfT25U0qzew8Rq7Rbqqo555hj8OiwaU9
	 kbLemstswnP+gS0m2yK8QURZAKPgmkRhZklk8OSGDi0hi74IF+fLaZQAhwoTWH3qZy
	 sv6j/4KJy8mCMavzg6WtQnk7gVLepbJAlzeqWf3zymFXhQltM9uyM3P6g3CynMTAyh
	 89OYYRnClbtbQoP20g2arvLmIsHLxNIARK3yIdXSgXsQOBENQAFpn4Uf6kuQ3yKwA4
	 lHvb+z+8T3AOg==
From: Vinod Koul <vkoul@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Cai Huoqing <cai.huoqing@linux.dev>, Serge Semin <fancer.lancer@gmail.com>, 
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
 Koichiro Den <den@valinux.co.jp>
Cc: Devendra K Verma <devendra.verma@amd.com>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260717180639.2643243-1-den@valinux.co.jp>
References: <20260717180639.2643243-1-den@valinux.co.jp>
Subject: Re: [PATCH v5 0/9] dmaengine: dw-edma: Fixes and interrupt-path
 groundwork
Message-Id: <178448598884.1267529.6421446402772059480.b4-ty@kernel.org>
Date: Mon, 20 Jul 2026 00:03:08 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sat, 18 Jul 2026 03:06:30 +0900, Koichiro Den wrote:
> This series collects dw-edma fixes and interrupt-path groundwork, mostly
> split from v1 of the "Support dynamic LL appends" series.
> 
> Apart from minor adjustments to patches 4 and 8 for the new base, the only
> change is Frank's Reviewed-by tag on patch 2.
> 
>   v4: https://lore.kernel.org/r/20260716152503.1747922-1-den@valinux.co.jp/
>   v3: https://lore.kernel.org/r/20260715175740.1110404-1-den@valinux.co.jp/
>   v2: https://lore.kernel.org/r/20260710080903.2392888-1-den@valinux.co.jp/
>  (v1: https://lore.kernel.org/r/20260615154111.2174161-1-den@valinux.co.jp/)
> 
> [...]

Applied, thanks!

[1/9] dmaengine: dw-edma: Fix HDMA channel status register access
      commit: ef1b080e03acc83d5bde841da67036985acd50dc
[2/9] dmaengine: dw-edma: Terminate all descriptors without callbacks
      commit: 99109a51efd28c9a661fbfb9469b023c517b31d1
[3/9] dmaengine: dw-edma: Serialize abort state updates
      commit: dd80e259f65d932634e26d366570d71669ef6654
[4/9] dmaengine: dw-edma: Complete descriptors before pausing
      commit: c154060016a9db2ac889bfdb0a3c1322f9be8ded
[5/9] dmaengine: dw-edma: Serialize channel state checks
      commit: f7d1619f3e10c619b62c6cd6d95371b5c526c85a
[6/9] dmaengine: dw-edma: Clear stale requests on termination
      commit: c0d9c6275adcca7c0ca5f4270bf88026f9864bd1
[7/9] dmaengine: dw-edma-pcie: Drop redundant pci_free_irq_vectors()
      commit: eb4022c1fae2bb029178779bc2b1fe84a9510dbf
[8/9] dmaengine: dw-edma: Snapshot the v0 interrupt status once per handler pass
      commit: 5b0a8818fc5237676bdcd9659180e1edf8e943d7
[9/9] dmaengine: dw-edma: Defer channel IRQ handling to workqueue
      commit: 35de39e4511f00a87f814b5f0afeb082a8fbc5d7

Best regards,
-- 
~Vinod


