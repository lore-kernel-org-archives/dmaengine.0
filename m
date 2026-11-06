Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975310;
	b=ZXCIaztL8lA5xHc7mCJVSS/nQGcsKk8VgnJfNHHRh0iiit7/6Umf5nz86Xtj8gurhECB
	 CN49E01xNqmPzxpOCe6iSYbjmSRuOqguEXFFJwA9sbtJVMnY0fv33orPDtERg1VpqdHuS
	 BNu6A+mcHvoSqnByLbTPl41YsUDLtddd26FH6CKhz75IYmwwjWuYHAd2ada84gZRGwD+A
	 bqrXIhXuud0aU2qAE/mbuIvz52QUJ8J/jShJx8lsMU6QgQKxtlQBytXBJAltDQm8jC7UC
	 +azSh9rs5dLOQv/f0eJz0LvvFeNxDPIr2a9AOlUwtKxoej7UTid2qgIi3bt+oRuc/Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975310;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5gnVlI3t3VVUoodbzEk4zSr2iu3mmhJbSxzN4GsgLrU=;
	b=vmSHHqv1NH7THRqJLgJfovCMW8432fZ983l0sb+hzDE7VpXNQLrhgAIAIULGX+mh5t/S
	 E0pipCIeNZJNVEAn47TT+USElFN5NwRhtTgZidcY2AfXCQIda2R5hxIWAM1NUheq4+ceL
	 d/E5mPqOZMqzRIN8b0gS+OpXqFDVgaBPx5uvo11HDFFyp6j3/4PX5GWJ5LV6G3WTRmPi6
	 wGzFtzroUdF0+99imxHNmf5gPKj51aQ/jaGYjdLUkU595XbjoZp9ThaeG0cw+En/4aJlk
	 lewY3Mmux8ltLjBFW4VqGxC3RyEjZkd1sAytiMj+gvRV96MFJQmcvtnX/kHBsSbqYrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ltGKwxRh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC66606A32C;
	Fri,  6 Nov 2026 14:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ltGKwxRh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73941F008A1;
	Fri,  6 Nov 2026 14:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793975310;
	bh=5gnVlI3t3VVUoodbzEk4zSr2iu3mmhJbSxzN4GsgLrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ltGKwxRh7GFtJ1PdAlg+eVsMmET1NOOPCZZV1MdFc7xe2BCGDCDdRsMQcnwt4Q/0y
	 Pdt7ZkCj9tdGzFH2zHXtycHf6IeyHc6k7pH/ozeW1uU0vgNNkzxR0icOKaSID7DKNC
	 xahnNCtRKSsJENz3WWq/Heb7Lay/JYUmrVzL9e4Uk5uSNS6Xpu3P/D63SxNVo6AiFB
	 qD8TxPxxouTOMaZZfBuuC7/RgZYU61D9X0TZbW4ONYfGwRwcSoporoBLCeV7Bdu0A8
	 vJ4k3hpqD0t44ZczYPbVjHdDqfTqAQi+nRtqk5uE9cfSvIqdGwjH9nNvIMb/qpgSjH
	 EJFR1Ln8vQJyg==
Date: Fri, 6 Nov 2026 08:28:27 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, dmaengine@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Abin Joseph <abin.joseph@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Frank Li <Frank.Li@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Harini Katakam <harini.katakam@amd.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	git@amd.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: dma: xlnx,zynqmp-dma: Require resets
 for Versal Gen2
Message-ID: <179397530668.3117263.5180945931257421774.robh@kernel.org>
References: <20261106-adma_per_channel_reset_v5-v5-0-f9990669362f@amd.com>
 <20261106-adma_per_channel_reset_v5-v5-1-f9990669362f@amd.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-adma_per_channel_reset_v5-v5-1-f9990669362f@amd.com>


On Fri, 06 Nov 2026 15:40:23 +0530, Golla Nagendra wrote:
> Require the per-channel resets property for Versal Gen2
> DMA devices, which expose dedicated reset lines.
> 
> Making resets required for Versal Gen2 results in an ABI break, but this
> is unavoidable. While the driver works in many scenarios when no other
> firmware has used the DMA prior to Linux boot, there is no guarantee the
> channel is left in a clean state. In observed error scenarios, a reset is
> necessary before Linux can reconfigure the IP after previous use by other
> firmware components. Due to configuration differences or the DMA being
> left in a bad state, DMA functionality fails when sequential software
> components use the channel (e.g., firmware before Linux boot). The channel
> can only be cleanly re-configured after a per-channel reset, making it
> essential. This ABI break is only applied to Versal Gen2 and where the
> per-channel reset capability is available.
> 
> Fixes: 36545c6a68b8 ("dt-bindings: dmaengine: zynqmp_dma: Add a new compatible string")
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---
>  .../bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml    | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

