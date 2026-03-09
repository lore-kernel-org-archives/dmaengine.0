Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4749236997D
	for <dmaengine@vger.kernel.org>; Mon,  9 Mar 2026 07:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042394; cv=none; b=Y5x6uo2fJ4eJKhZPS+rWHGlXldRwmlXbYqvm60gcyS+++Ych+CBvKh5Rn5HCxrlKLc32edFjEABUrCECZVPNc61kBNXIq9FpFsiYM0nbMznE2cp5UclFwnE1bOubLj+YT4++YlVx4P2jyAotYf8mof2j2KtYaLzUCx4bZOb9cMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042394; c=relaxed/simple;
	bh=SCIZl1Nx3WI7nZ4zRZqNNM53eFK+Vp48iJcdHuu6Mfg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AHuCwx0sP5W0fL2JNkoeDBrVtiCTV7h/l3B8qVADw5oUbcprsEOoRYkM5KdnP3DMP8FLmA9WxL01KjeRtULg102XnI0eKO9HJN4vkspPkK94nAwNRgEKhgJ3LQOry9G2EMxsAAilHVQd5yTrwjCz46wbYsRXNK62xfgLjX1KIM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L3veRzR+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L3veRzR+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2479C2BCB3;
	Mon,  9 Mar 2026 07:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773042394;
	bh=SCIZl1Nx3WI7nZ4zRZqNNM53eFK+Vp48iJcdHuu6Mfg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=L3veRzR++yejZmJoh+SoxJoXBbCUEgR6KHsO3n3vsPyRqyNbTcg9YDhmwZliM0dGN
	 2ioA8spIPU+eO7AGCt24R1GezWXlQM5s3Wa2nr5P6Tq9wzoKR3wr2j1B4qKWGo0mpb
	 T7HT/eVEAG0o3J1YaNPax7s/K8Y72VsLorMbJcv5ebMqzBGqLzHDh3TKI2RJtjjD6x
	 iPopZ9e9/YGrmEpiIO3MLgbbJ4tz0wXrYGEGzSgxlyqM7yEzyFKQ0ishV1fn5Jy75Q
	 7IZBc+iGXbkzEjamT0TWEHZl7t2ih0R59BY1zK+QHeItoZgSeMQgVyDvNOLwCEocO4
	 +KEIhtdH7LcFQ==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Cc: Kelvin Cao <kelvin.cao@microchip.com>, 
 George Ge <George.Ge@microchip.com>, Christoph Hellwig <hch@infradead.org>, 
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20260302210419.3656-1-logang@deltatee.com>
References: <20260302210419.3656-1-logang@deltatee.com>
Subject: Re: [PATCH v14 0/3] Switchtec Switch DMA Engine Driver
Message-Id: <177304239251.87946.4543423653866080296.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 08:46:32 +0100
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 02 Mar 2026 14:04:16 -0700, Logan Gunthorpe wrote:
> This is v14 of the Switchtec Switch DMA Engine Driver.
> 
> The patchset has been rebased on v7.0-rc2.
> 
> We've addressed a number of issues pointed out by Vinod.
> We continue to push back on processing completions from the hardware
> in switchtec_dma_tx_status() seeing this is the only place to handle
> the completions if interrupts are disabled. A comment was added to
> the code to clarify this point.
> 
> [...]

Applied, thanks!

[1/3] dmaengine: switchtec-dma: Introduce Switchtec DMA engine skeleton
      commit: d9587042b50f69d35a6e05c1b7fc9092e26625a6
[2/3] dmaengine: switchtec-dma: Implement hardware initialization and cleanup
      commit: 30eba9df76adf1294e88214dbf9cea402fa7af37
[3/3] dmaengine: switchtec-dma: Implement descriptor submission
      commit: 3af11daeaeaa6f62494c7cb07265928162b440ab

Best regards,
-- 
~Vinod


