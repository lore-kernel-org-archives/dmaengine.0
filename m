Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568700;
	b=OM1e5ly+FEZUqRQ7r8veOcMVH0Bg4ixER79Y6PWLWfW6GKMvT+OZ6YY5L0RAYv3fzy+x
	 g3pfW15d0HWUSLHguQ0t0lWnD1oImajh1hy9UG9E8g25wsT5YskVeC+ilk8+4mBj6b23x
	 nSk7in4fX8cVpFfbXEn8TJ3fsLbuPlDwxbnijCOO80MIqqqfD79cboOccofJ6Bpeyd7+h
	 lgvhtGmUK5PFylN9p9EPznOvLViyyQEVXjkynb4WtDAo7iQNzhdkHTb6D3o+F70VRMc1I
	 I1m8zYa3+JVDV5mxQ1m/VAnOvNsNj93hoiROuJzFT2YtQeS6hrTG04lf9E49EAxnI6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568700;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SoZopygXc/qflPlFqntHA6+xMbJ5Q6P9clFSoRDkiD8=;
	b=z/0M7C2kFfRUrEnzxxsV91EG93BUewFNfK8BGAmfQrytSoaCuM7AM0+ieJma3EBpEs2Y
	 LgZk6A4/hYJfiv4dpFl5euNoPLs9mgU91i3DPCCcVXHd71KfWfJ6S1mFJjxGQcima7mhc
	 xs/jjX9rvYXaVIP49k5oj47tkJgWr+3skavc/3p26lCGrR3D0sZYb9Y+iR2j6d026a3qn
	 +WpMPiWQMWYQS4Ve7d5Ep7DUmN4pjO0VNEOFG6ZNbvPDs/iTbxuIUNKphxXAYwIPCSleM
	 a0kM/PUnonj3AJoq/ynB1czZJtSbpYopStQqtf6kmaj0SCMf07MMzw2kRRmVYVrJkbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZbLSDedl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19086606A31C;
	Fri, 13 Nov 2026 11:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZbLSDedl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6DE1F000C4;
	Fri, 13 Nov 2026 11:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794568699;
	bh=SoZopygXc/qflPlFqntHA6+xMbJ5Q6P9clFSoRDkiD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZbLSDedlgS2mED0qQxO7H0ptmDd6qWUnbHVl8QVr0g5CkfTRkXWNYvkgJzIXJotjM
	 j1HI1xWgtfy1j2PLKdd4OvcB6Pm4bPCZvgYx6WTMRndbedxQ0OjHrOklOBuj4dqhpc
	 o1y0eF2z8x5XBIWcSCy4AninawWTuXdHE0OHLIm++telIlnx0qMkw1PinlzLE7fZZT
	 vmsuybr1NVOX7bVwSgBs7BYJ/A3nlCBGurPX2Owo1XQVLkrv+Y4PnRfmpnblhfvNh8
	 yXZJ/fYeXq7JWx+dWlUfzDLV62VG25lwEUdQX4aKIasNpyl+5M3GlLPyBbzo+bXDqT
	 4PXBeglGv5Ojw==
Date: Fri, 13 Nov 2026 12:18:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: dma: qcom-gpi: add SC7180 GPI DMA
Message-ID: <20261113-knowing-oxpecker-of-anger-ad3e38@quoll>
References: <20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com>
 <20261112-sc7180-gpi-dma-v1-1-2a8eceb49563@gmail.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112-sc7180-gpi-dma-v1-1-2a8eceb49563@gmail.com>

On Thu, Nov 12, 2026 at 02:23:22PM +0200, Erikas Bitovtas wrote:
> Document the device tree compatible for the SC7180 GPI DMA controller.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

