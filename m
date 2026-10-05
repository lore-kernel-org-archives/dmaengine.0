Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769614BFE85;
	Mon,  5 Oct 2026 15:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214980; cv=none; b=Ha91Ll0Ah6HrutJxMP7FGBaOH3FzTTUVwLrY2pBXmi8Lt77KScq77223yZb/IwcixWiAMYV+p1vBq3H0dKZJeSSP2MsjI6tpBzkqSJyPrUE6LN0kbGI5IfnpYxGOqJtGrHXjZZNzFN0QRz2c2vG1jarotNDhqgV+hDgUJG19aKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214980; c=relaxed/simple;
	bh=gdB/KvslXV8Xv6p2gfqBGK/V6u5XNCsT8g6iWwz9MsY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i+sYMCST1yLSXJXL9sk5+8HChVojM+SeEBJyiz4EQDxkmx+1nO/E7DXlWwvPcgwGqTOMfZT9WdJtYUncKF808uyM00u6cuhtgpEqA9DPi9p5EHrCJU6RKQ+oxtWRWq3tgsIoXgtbwppKVolkJDZSAojmREx9opHvjXu59uwWIq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKuN2C4V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKuN2C4V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B97F1F000FF;
	Mon,  5 Oct 2026 15:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214977;
	bh=3Uli3qJzdxDmhMetE65SwSEJBObD0AmWiQfg1Q4vFqQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eKuN2C4VgSMw6YWLjklPJY+m+rH6ot7rkUFDI4eRPSojfedne1QoOYG3xljLf1hhP
	 pBFIf75t/k4EHrMSRBiTAYdCQ1gRY7r4U5/UKpQqGl0NIE5+e/pemn8EotwOV2gIic
	 4DzSAEd4w02m24aKSrOmOyHsNVwUp3GWnczl8GInSMAWM2wxNwAUVhKjLipbjaTsJN
	 YdPCrEF45Gc5eBbXWI+kG13l0KbN9eVknH2gXxsyyNYWF+v60hIjG5kqOjc1HNzUL0
	 DJztbsnkl9bNpVbOcO/1WtcqHR9HciQylTmoKAy1ZPNQ2GKu9OpCiOBRjnr/wnrdMD
	 n8BMgAGrAcdlw==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Yuanshen Cao <alex.caoys@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
References: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
Subject: Re: [PATCH v5 0/5] dmaengine: sun6i-dma: Add support for Allwinner
 A733 DMA controller
Message-Id: <179121497373.358863.1015427192725194332.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 17:42:53 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 26 Aug 2026 02:40:26 +0000, Yuanshen Cao wrote:
> This patch series introduces support for the Allwinner A733 DMA
> controller in the `sun6i-dma` driver.
> 
> The A733 DMA controller differs from previous generations in several key
> ways:
> - Support for higher addresses (up to 32G).
> - A different interrupt register layout and mapping.
> - A different number of channels per interrupt register.
> 
> [...]

Applied, thanks!

[1/5] dmaengine: sun6i-dma: Refactor to support A733 interrupt and register handling
      commit: 3b18c8e460760a7993c54f9d591b1b758349b1b3
[2/5] dmaengine: sun6i-dma: Support variable address widths using masks
      commit: 4ec2d7bbbf2c79a63469b4a027cd522abdbfb2f9
[3/5] dmaengine: sun6i-dma: Add num_channels_per_reg for flexible interrupt mapping
      commit: 9ab1198158a5e6b1d24677970cdd30aba2d39d37
[4/5] dt-bindings: dmaengine: sun50i-a64-dma: Add allwinner,sun60i-a733-dma compatible string
      commit: 714f0410eaf057b3fe19e4b9c9028406e38a29d0
[5/5] dmaengine: sun6i-dma: Implement support for Allwinner A733 DMA controller
      commit: 779867c3a5309561e056f9c3c55e5d1dcc7717c9

Best regards,
-- 
~Vinod


