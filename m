Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD73B4F55DC;
	Thu,  3 Sep 2026 17:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455074; cv=none; b=u27jPHc92E6dV+a30NlPVj6kmgYoYkG+U+QsbWgRWZRjTDO8bmyOFkRtXbEoWncpldGwNyAPiwPSDdpioV7u23j/W/+Fcob1l2dNory9uApxiHxhzhseN/193Eazv5u7ux0mTmqkiYjUdh6VbYrghUQP8UY04Hv80AEWtO5FDj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455074; c=relaxed/simple;
	bh=X2VryrLfGXrW1SfVo+b55sti0YlJA348GbYlDpm9EPY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rinR6ZDUlH9y+Ir/cQK5dbmvJiTjo/7dVJ3fvN9u4s8xniFfL4S9RhfCKJxyJcKKsZxhPqm9s+LAtTdwf0/NWV5h+3cbyrZJrchMRImKh/lBPB+l3QA5I1y/dQ75w7r0WpMENFptgYT23Lmh+iTnWZFOTWNZnmgycljfiAEfQV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXr0mG4h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXr0mG4h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E4D91F00A3D;
	Thu,  3 Sep 2026 17:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455072;
	bh=LZiAV52RXDf9JNv3eWNabRO2S8ojqaaHKEbseO6JITU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RXr0mG4hKlQlbjXzwrpGilppMChl7pCmG/J93JekPdtUYOIRj5R2Pb8pUZTeuW3rY
	 lxrbx/y4mKtbcepTwZ5IHr49daDGy5O/3dA1kC3P9gvvY3WzqQSzWn+k+symlZZ6lm
	 O1xi+6geFbUiwTfvxCZMghnG2VB35+lGsuAe9d7GytFApj578Iul+eOT66Lla7uXcH
	 Npr2oYhbYfcxHfH8idYnoVZl3bsLn//kfMpDfZWjBeSDc0JadzjL5uWCPnzut1D5bh
	 Wx3xVWIHIrSXZStQTIb1Q6z2O6VSFZG5cjKQ+pXw0h8D8GcILtaUpnnLiDgorkJjMu
	 f31rbCNwcUDLw==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Frank Li <Frank.Li@kernel.org>, Eugen Hristev <ehristev@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260724225958.43925-1-rosenp@gmail.com>
References: <20260724225958.43925-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] dmaengine: at_hdmac: fix sparse '__iomem' cast
 warning in memset helpers
Message-Id: <178845507006.1711546.1241811743699948076.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:34:30 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 24 Jul 2026 15:59:58 -0700, Rosen Penev wrote:
> Both atc_prep_dma_memset() and atc_prep_dma_memset_sg() declare vaddr
> as 'void __iomem *' but assign the return of dma_pool_alloc(), which
> returns 'void *' (not iomem memory). This causes sparse to warn about
> a cast removing the __iomem address space at the dereference site.
> 
> The struct field memset_vaddr is also typed as 'int *', which is
> neither the type returned by dma_pool_alloc() nor the type used for
> the actual writes.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: at_hdmac: fix sparse '__iomem' cast warning in memset helpers
      commit: fdae0d0f096c92dd05d3722759fd614ea341e0dc

Best regards,
-- 
~Vinod


