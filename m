Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F48C381E96
	for <dmaengine@vger.kernel.org>; Thu,  2 Jul 2026 15:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783005928; cv=none; b=DRE1FCzlfQFSNCjkAQb33M6/pchHb2EAT/B3iTrF/IDBwK0TnuRKgikcG3L71Ev8oaqASrf1EvrUFzvrAEec42xbAXrIX/ILsGYjVfL2AVpLgcAbdaiYw5LYNOGBGjypk+G4uE4TNJoPO4vUtQzde2YlylrJeLb4iNOFPsYGwk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783005928; c=relaxed/simple;
	bh=nPp7tCW21B1G2xtjOJ5l7kC4vVGd5+2qxvhgHTsuyd8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UQnjZYBKqcoIpCrfFc9fjvuPdW1EcakPGvtYHf+KEDw8z5fVOeHQk7t6eSRqYz3nBD4d3wnaURXilM8NbQh6cskjGf6GltlVrR59trA1XU7na+IUvcG5VgqmiptmUIwKU/uKhCPrdQAFoZqOp7MCq6tYsdXEJ+Ha6649+FF7Gyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWN8sBUL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWN8sBUL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66B51F00A3A;
	Thu,  2 Jul 2026 15:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783005926;
	bh=NcsNrksdrPM4tBhpuukCzWqBRyNUb4wrgMSeL9A/Y4A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lWN8sBULB3uBdvaYkofB4WrMUl3+YNCAws+HMnKWbvqgu6/WibDdxgpMjVXSsQJaQ
	 mFLsjNt/yPI+/lMoJhq6TfIoRNQ0DjP/6W9YDdsvty5fkZQw96H74eJdy0FxNofHgy
	 ZWM9zgNFqMQ16BYMOUQVGzNu/S3oirCSQEULss1oXJyG4TDohpSC5BNWHvDlvqVQi1
	 y05bhEjhD1UvM2K2kfEtB+mf0OFfXTFy1cU+Kojq1efaDpl7xE+nQgBDvNN9gm3nSn
	 4JxwYxlTos1Tb2sah79xRilpMCmm8oIgVKYyKGCLSiSBIjXoztPhKzIM23JUkvZfZl
	 eGtEOufd7dDyQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kelvin Cao <kelvin.cao@microchip.com>, 
 Logan Gunthorpe <logang@deltatee.com>, David Carlier <devnexen@gmail.com>
Cc: dmaengine@vger.kernel.org
In-Reply-To: <20260317083252.13224-1-devnexen@gmail.com>
References: <20260317083252.13224-1-devnexen@gmail.com>
Subject: Re: [PATCH] dmaengine: switchtec-dma: fix FIELD_GET misuse when
 programming SE threshold
Message-Id: <178300592530.726714.16124040528136338861.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 20:55:25 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 17 Mar 2026 08:32:52 +0000, David Carlier wrote:
> FIELD_GET(SE_THRESH_MASK, thresh) extracts bits [31:23] from thresh and
> right-shifts them, which is the inverse of the intended operation. Since
> thresh is derived from se_buf_len / 2 (at most 255), bits [31:23] are
> always zero, so the SE threshold is never actually programmed into the
> register.
> 
> Use FIELD_PREP() instead to correctly left-shift thresh into bits [31:23]
> of the valid_en_se register, consistent with the FIELD_PREP usage for
> the perf tuner config just above.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: switchtec-dma: fix FIELD_GET misuse when programming SE threshold
      commit: 9d12eb98582fec2578d17e025b13740dcfb57d8e

Best regards,
-- 
~Vinod


