Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E294F55D2;
	Thu,  3 Sep 2026 17:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455108; cv=none; b=sG+uvIcjwQz+FaY1fDxNupGjNEm4NVxpanmM/afZ+xfjWyQV1vvOfs8mA6OPKSwPr5l2ksSQJ7aLT2IPcDUUat6IzNYkNY5I/03T2hhQjXtT+TxUnvSrNVG1S7hidKQ5uPFnXjKn2c2hhcKVp1Tm8+o74HuVifN+LyTALLOQ2z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455108; c=relaxed/simple;
	bh=p07uZ7FKygNIF6DAQDrb9RUIZ0n99bow+JTgwGbYj4w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QocHLhUEsGbClGfewc1a9z2W4Yj3zK31pIRWgUjHJlbwwA+AcJD1OwhFGqsniadrF2Nt9TqG58ihnxea71HgQs5lsAHQQJW0tugHTYmjkOT0rHOISj5jixfg4B3aIU+oJQLgzzPctQ0/3LgFYzf8hdYIE3RR/1Xs0Hr3P8KOS2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQkFDoZp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQkFDoZp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BFBB1F00A3D;
	Thu,  3 Sep 2026 17:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455106;
	bh=OCn8oBmYiFHJMBFXjevxwqL0vd5Yzx7QLGHyDzpjsyg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YQkFDoZpWRDi/qx56Wyt7xkjZVgqDI0Hc6qvApGwrxssCENvXScZJo7W9H4XpIFYo
	 n5tfDtDGn2SER0qJg+5wdsp5sSrrVWb6OjeyHfG3XTQ0iNF/yDmKPhdGdNN/4E3ddm
	 53zsVz/5xiemr4tBQ61ieR0IYqwuvz82DWK1EwOkMKBMeZ34yODwQf+cMZ6yPEMqtv
	 PY7jxothmg+PBPUgE0okws4phn2w90nc5D82OS7QFJXCd48rePiS6Lc6wqhT48W9c3
	 FjAOQufgXyoAUaOvu2eIU1Oh+elTuwz94+3tiFo48sF/Aoib/FF52/nWYrPBx93fTE
	 WMngL+WbXCIRA==
From: Vinod Koul <vkoul@kernel.org>
To: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Cc: Frank.Li@kernel.org, Frank.li@oss.nxp.com, Eugeniy.Paltsev@synopsys.com, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260816054858.2667380-1-nagachaithanya9911@gmail.com>
References: <an3y4lS-ZE4CdJ7R@SMW015318>
 <20260816054858.2667380-1-nagachaithanya9911@gmail.com>
Subject: Re: [PATCH v2] dmaengine: dw-axi-dmac: convert clock handling to
 clk_bulk API
Message-Id: <178845510398.1711546.13415827033389675878.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:35:03 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sun, 16 Aug 2026 05:48:58 +0000, Chaithanya Lagisetty wrote:
> The driver managed its two mandatory clocks (core-clk and cfgr-clk)
> individually. This was error prone: axi_dma_resume() enabled cfgr_clk
> and then core_clk, and if enabling core_clk failed it returned the
> error without disabling cfgr_clk, leaving the clock refcount
> unbalanced.
> 
> Convert the driver to the clk_bulk API. The two clocks are always
> acquired, enabled and disabled together, so a clk_bulk_data array
> expresses this naturally and shrinks the get/enable/disable paths.
> clk_bulk_prepare_enable() also unwinds any clock it already enabled
> when a later one fails, which fixes the resume imbalance.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: dw-axi-dmac: convert clock handling to clk_bulk API
      commit: 110126f425c34a2b189e10e74eec7644e1b47827

Best regards,
-- 
~Vinod


