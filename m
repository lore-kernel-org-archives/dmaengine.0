Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A5F4F55B5;
	Thu,  3 Sep 2026 17:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455088; cv=none; b=LR/8YKS62YjLDoHCyfROZCVSlfXCdaEiyA9w3WZ/Dhjf/bX1D3CR7ASb/R129HXZN/qZT3eYUBmUJFE04mbnBiyafM3XVnj/suKI3eeoZuZ9JvriPM3ipnFiyxKlC0GYn67xEHHfqTQUJoH4VOAhj03Xa+aSzKhKZ6F8siLGRIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455088; c=relaxed/simple;
	bh=KHCrNVt85gkOaFVguvlYFi/k1Hvmw9YHUXIHAHNb0Y8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dfVn8oHr2DFEaucF6tERYvz9vlNDHitaWIz01siVTfhFURHFFlJElsXiSMoup0VEENQTxxeX2ydRFcL/leWhm7frA0+WBnpWeG2Kk11a1tvl6+09Z/FVLVvmSQuwJ1ftAXS0YW47aAU7eyUJCTi27mF0Ty97G+IUavlfVqta7ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2fUU5fz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2fUU5fz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824041F00A3E;
	Thu,  3 Sep 2026 17:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455086;
	bh=hRvLmpXur8hxPRSoc9ySUg1tIeL16hBlpoKHYH9PMVc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=R2fUU5fzbVnErZCUZ9JTS+Uj6KkqIabTn39MLEotQMSveEMfkhlrIZIYsYeoN2mkx
	 HhrA6ZDdaHQiCEE25jD6bJPM5RoIf1zq5E2DogRg1qy39JNeyFIk+Px8hjltOq04S8
	 JDcrbSLxjXdUvorrx8kWYVNCqULtmqCePlQBsg8rGJsuaaomg5d5uj5fUeU9DVZJ4u
	 4WGVPf7dU1ZzLLzre2gFDjXX2KDettEfenJTYWsCT1dz3UbjbtI1L2ZbSN1Yzo0oKX
	 3hrYYFJocNW0imKnOBckcP0pBvp0fm5mrVNlFaQLOlkr0q6m8DG3Gn4E0/6DF1Qsv7
	 TzcOyvBQ9M+JA==
From: Vinod Koul <vkoul@kernel.org>
To: ludovic.desroches@microchip.com, Frank.Li@kernel.org, djbw@kernel.org, 
 nicolas.ferre@microchip.com, maciej.sosnowski@intel.com, 
 Hongling Zeng <zenghongling@kylinos.cn>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 zhongling0719@126.com, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20260727062917.46905-1-zenghongling@kylinos.cn>
References: <20260727062917.46905-1-zenghongling@kylinos.cn>
Subject: Re: [PATCH RESEND v2] dma: at_hdmac: Use stored IRQ in error path
Message-Id: <178845508308.1711546.260840328236827398.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:34:43 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 27 Jul 2026 14:29:17 +0800, Hongling Zeng wrote:
> When request_irq() succeeds but a later error occurs in at_dma_probe(),
> the error handling path attempts to free the IRQ by calling
> platform_get_irq() again instead of using the already stored IRQ number
> in the local variable 'irq'.
> 
> Use the stored 'irq' variable directly in free_irq() to make the
> code clearer and eliminate smatch warnings about potential IRQ leaks.
> 
> [...]

Applied, thanks!

[1/1] dma: at_hdmac: Use stored IRQ in error path
      commit: 3d79127509bffc92c9083165ff461de73ec9c568

Best regards,
-- 
~Vinod


