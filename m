Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0164D0A04;
	Mon,  5 Oct 2026 15:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215000; cv=none; b=D+qzFwnR84E4+cMOlokzieS9J6NkPjlEPLEPgcrtWt2Wgo0qaOnd3XCemo3AvXscs/sy99UsvfOmyOmHCQmjOEwk9OUz9B/NKMhhGOeMUtI5d1PyH/4oK8dUyTC66se9EdpTbH3KjD6nrKtgBR8wj9j0+SftIXcgnRxMxQ8G46Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215000; c=relaxed/simple;
	bh=P49NR6dcRTuPbEuy8QuNgr8D2RHKrFVs6xijIMz6kbs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sX0tecw+fhXEQdD9h+c1YshoApVtoJSbvoR+H+azp0oJTqiUrMTFYmpsUNKFm6W8FpKE+SgAQKTdoEEw0wDpWwI+Qo5Jzhtq3jj9h3v9N02CNeueeP9WtOrhuIzoSaTNl/r6URdYKfB/VHuNmeB2pzCaWJAc5wDxZn2AzUa54FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQwunsMT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQwunsMT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF531F00893;
	Mon,  5 Oct 2026 15:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214998;
	bh=0ESQITYD3rZ/xg13TMbz3+mGQE1O3MEj4TuWcylvhhs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aQwunsMT2XLpachvExRoAYO2Yr4UUuzqwzSv02+Gqg9NJGh1ZQKDZVxyx4S4twBdd
	 BnvANHxu3RC/8Ewsi90Xh6SnsQWJ9UvCRZ4zXGgylNlMVQ9ZtodR6inflPIIJ/nXKy
	 JLaBoo6c12cbm5vByN99FjGs4UNs3ABtT7gvZ0mJPHcE5S8UB2sGw7JEEcb/bFH2Ts
	 0p3qSjLFZVv9eKd3aNoGVHkDym/8EP9FiREuf7SOZDZ32Kx6cugwLd+aJXIq6Y3fat
	 fAt5/43gDXm5tNpOoPGyCIcsQXFwbGUDoKe/nfnhEA7ael9wPZCUauqW6vlTP+C1mX
	 /kCp8eZwLE2lQ==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916-fsl-edma-dyn-sg-v11-0-02792de71b92@bootlin.com>
References: <20260916-fsl-edma-dyn-sg-v11-0-02792de71b92@bootlin.com>
Subject: Re: [PATCH v11 0/2] dmaengine: fsl-edma: Scatter/gather
 improvements
Message-Id: <179121499695.358863.2184122173863410504.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 17:43:16 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3


On Wed, 16 Sep 2026 10:24:10 +0200, Benoît Monin wrote:
> This series adds support for scatter/gather DMA transfers via dma_vec
> and dynamic descriptor chaining to the Freescale eDMA controller driver.
> 
> The first patch implements the .device_prep_peripheral_dma_vec() callback,
> enabling the DMA engine to accept an array of dma_vec structures. This
> callback supports both regular and cyclic transfer modes.
> 
> [...]

Applied, thanks!

[1/2] dmaengine: fsl-edma: Implement device_prep_peripheral_dma_vec
      commit: e2174129ddb293552ab7832439606848348f0370
[2/2] dmaengine: fsl-edma: Support dynamic scatter/gather chaining
      commit: 2c9f5e95f41898b506b132d7698d270ed6a13583

Best regards,
-- 
~Vinod


