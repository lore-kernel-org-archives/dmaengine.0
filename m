Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168874;
	b=0Qg4z0NDLEjg9R2y0YfqSHa7TjQbkAYmzIVixvprTDxC82ufbf8V+v2s24EMiUZL1cJV
	 aTeIfrJCFusgbUBqn+S8iufCjztF6+iS8prUdLRvX5TXvv8j8mCjB5LSO5h87DuDScESd
	 3dyqFRvPWzpc85a6dPHUKnEzf8xDoCPOrpCTgP6iKff2N5EWEOlC0EvJql8F+vTikbVpp
	 v1MFEsoQE/oqhKS5JuaCscI9aTdJx1JYjm9qlIXwxrhGarslIwOdei8c1Gn4oUUkfywee
	 ddymXcL2Ta+anHyp3WnIl8OnkE+ObZohBwQhdpKuIgsM4dB20O+bSIHwYzUQuOtUJtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168874;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=2iGpZRMj92nkG71mPvOSkY4E7rAqM7fEmk8vg3NlSjw=;
	b=P/S9gaHt/6sn0qsvzBz/CjqaI5lnI/23Mz2z2JetzuuU+UFvlzYIWAEN3KDYB8zfUX4P
	 vDoyTYCG41AF7337q7PYELOGJSewZ1u5X6l8qSUnOWhEMhfNBg4Goh1J2vBqZvNDjJiO3
	 WsuhJuRCSirA/0hWy8u0iN8+1wcDw67Uyol2UTxPYlyPhuLXkeAzIeX7xhNLHxkeTRl2Q
	 8mAd8QAXhWtiUiZrNtbTwTWvKxi0zuCJnogfpRJJT2o5NFgRpkSPNWx1KVcnsozLnzhI9
	 LfsgMoS1tFRHyoZ/q1zafa6AZts6BMKOERXDFOBqRHcLHh+i8hmB+Ua6ncKZ2nINZLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iaDQDnEh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D9860A262B;
	Fri, 20 Nov 2026 10:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iaDQDnEh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 106211F000EB;
	Fri, 20 Nov 2026 10:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795168873;
	bh=2iGpZRMj92nkG71mPvOSkY4E7rAqM7fEmk8vg3NlSjw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=iaDQDnEhFhBsXe4VtHkCGSRlci6yoG2hMW9v8VNHkRIdOZHHNCADNozjXOiJqdYL8
	 vDWbpKag/eErDDSGv14Fp7vLMaKy12JnYYsYMKkjHaZACClzcsbCIJZs0mik3fG2Wu
	 ZlFqlqZSTWM8JH4hVbnN8SjcxSGTLLLXmiU77FrHN6YYJNpxBHE6zTdU6WYcQbhMh5
	 qfoyN19fDP/ZFJdkbC5mF1vxj08E9iedhLNlFz5kHRk7vikvOGRvRH8yTyt5kAGI0d
	 nZkOzbrfKAL+7jvN8loVCKaNMP7EAC86TPn+C6S4FwXd5dgD1/bjjtnkBrSjePFDPU
	 auwddZ9+9K+UA==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Randy Dunlap <rdunlap@infradead.org>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20261013203433.337893-1-Frank.Li@oss.nxp.com>
References: <20261013203433.337893-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH 1/1] dmaengine: shdma: move shdma_chan and shdma_desc
 structs to private header
Message-Id: <179516887070.45276.17681245678832282840.b4-ty@kernel.org>
Date: Fri, 20 Nov 2026 15:31:10 +0530
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 13 Oct 2026 16:34:23 -0400, Frank.Li@oss.nxp.com wrote:
> Move struct shdma_chan and struct shdma_desc from the public header
> include/linux/shdma-base.h into the driver-private header
> drivers/dma/sh/shdma.h. These structs are only used internally by the
> shdma driver and do not need to be exposed to external users.
> 
> Prepare to make struct dma_async_tx_descriptor private.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: shdma: move shdma_chan and shdma_desc structs to private header
      commit: 2e02fb103be058cf8b2fb24112a74a2715e090f0

Best regards,
-- 
~Vinod


