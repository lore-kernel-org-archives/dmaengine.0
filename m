Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6589F4BD798;
	Tue, 15 Sep 2026 17:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493792; cv=none; b=Mcui22U4c0IzPWIefMUZ/UWjWhmwBJCY5n2/JC2OrLRCoHOnT8hkUB/fEFc7QiKfwLTWUnknGo2Rp7F3GH/EZAEwjqLEDugLg7g6ukiy2LH2yIjFa65a6h3yzys363YhdkwMaq4bLeX3WeQxg5ufyPXFYODeMDjQl65Hcb1+x5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493792; c=relaxed/simple;
	bh=ElA5Jn3lABWzrF98P44iApdoL+EuJ2c9kfsvmn2wTl0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LY1hLxNb3Dv1AJFP1ev0/gEQBHviJ95tKwZnm0N6wvwi8+cxRsXmIPsUowTQ1x6hovBhNuGEcoEbBsoecnQxIqCxd2CnoljBT2nx1iu498BbI37CrCnuBdJPIoaVJC693uBni/y3gRfaEw8Wj4CtMTdzOVsN3bGdsS/xCZm8i54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afiCR1v5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afiCR1v5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143081F000FF;
	Tue, 15 Sep 2026 17:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493789;
	bh=pcdBqCyKpSLusVdM7IagHkaMfvPdLXkzn1gyiEf9p5o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=afiCR1v5pPGV5NTrucW0pjnEfc4qUNDSGMNp2wAaPeaYEqs2S+SYg52i0g2nq9f+0
	 AOfxT/yaKHH8iL1OHgLebrSmNygAIvW98AxjPxudlpjFNl/ZK4xZFYPULrYmOPjmr8
	 DUqu48xDHlQrtMTrcnfyRp8PauB4jWdWA0CmDjKQayLffasXFUfAYQPGerRkwIGvaK
	 wZ1kdkF4S5fDZlmKyJqkA6Ef3L7gXw7wE0OLTdyAeO3+yei8HoUj99ALf17yeEuoL/
	 Cs0OCKCzcSJdbQpzEYxjLtScvn+HJqg/mNsqiPIoksgJMxbUZ5pazL5AWjdvFttAy1
	 QAypmoS+5yftA==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Zhang Wei <zw@zh-kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260910202453.47887-1-rosenp@gmail.com>
References: <20260910202453.47887-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] dmaengine: fsldma: fix kernel-doc param names to
 match function signatures
Message-Id: <178949378765.248239.7839228857014022727.b4-ty@kernel.org>
Date: Tue, 15 Sep 2026 23:06:27 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 10 Sep 2026 13:24:53 -0700, Rosen Penev wrote:
> Fix kernel-doc warnings where the documented parameter names
> (@chan) no longer match the actual function signatures (@dchan),
> and add the missing @cookie and @txstate parameters to
> fsl_tx_status.
> 
> 

Applied, thanks!

[1/1] dmaengine: fsldma: fix kernel-doc param names to match function signatures
      commit: eb18901d481971c4ee938f59b0256ee8f02e0ce7

Best regards,
-- 
~Vinod


