Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53C0367F27;
	Mon,  9 Mar 2026 07:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042231; cv=none; b=bJ/lUyt7tGoud/iIDcxo9UVa6oefgYT/uNQJSTyZaGke12T2XbBU39AzT5BT6eTTUaRsvYM1JhMkf0DgyWcVxGGI+ajsX6OJjyK15R8xE+tAEhR8V1iPE99eXjBHu4qAHoxp/5r1J81U3JKozdnv5IGgMMLqgw5NSMSrDD2q4QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042231; c=relaxed/simple;
	bh=lZZKVhRMK0MaELynDO5IE2fxGhEn83gLbdSckMRB8pE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gD8lpUTycfKm0Rt38a8C0GFRHIRg/bXG+10lHUedoW0YbqFHih0JOZ+j4eafw4h2oGkBE7kOAKM1sDy39GvcIplLehXqblchNWILTpOF6YlrdtaQUx0sPn+12ao8/FBgMPLfdWx6xanXDqiVjfxgF+DsC4oZuyPdSZ63SnpoKLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJXXszp4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJXXszp4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B7E9C19423;
	Mon,  9 Mar 2026 07:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773042231;
	bh=lZZKVhRMK0MaELynDO5IE2fxGhEn83gLbdSckMRB8pE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nJXXszp4tiFB25LtgyWLhe/0q/xDnGp0wZwXkAuoEo1RaJC75AdCjdh5xIlSle0cM
	 tUjvOGSTfukW1MYrDp8h+7qCkaZsV5FuYq1xRqe/Xt0ZpoznnOpgXgtgdTn0EJioFk
	 7izfEjVgQy6ZCCyC18b6pzrU4Zr4hihIU2tldIjiDhib4fE7FUie0pZ5aAhF/pkP14
	 KndApV7fab/EZNk51t6kx+I0nZTHMrF1U9M5eFFExNdIldCeCfQPamqTij6ktmF5m/
	 CGZDCPJc3SBsHW0XLG/TmkaiWQCjuJLYNqqOo5QDpER42c+i/aL5+p2rBETFaWtU/V
	 PGWA1AbFWr34g==
From: Vinod Koul <vkoul@kernel.org>
To: Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>, 
 Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Max Zhen <max.zhen@amd.com>, 
 Sonal Santan <sonal.santan@amd.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251014061309.283468-1-alexander.stein@ew.tq-group.com>
References: <20251014061309.283468-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] dmaengine: xilinx: xdma: Fix regmap init error
 handling
Message-Id: <177304222898.79304.9472475091542211377.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 08:43:48 +0100
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 14 Oct 2025 08:13:08 +0200, Alexander Stein wrote:
> devm_regmap_init_mmio returns an ERR_PTR() upon error, not NULL.
> Fix the error check and also fix the error message. Use the error code
> from ERR_PTR() instead of the wrong value in ret.
> 
> 

Applied, thanks!

[1/1] dmaengine: xilinx: xdma: Fix regmap init error handling
      commit: e0adbf74e2a0455a6bc9628726ba87bcd0b42bf8

Best regards,
-- 
~Vinod


