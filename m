Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5B4370AD8;
	Mon,  5 Oct 2026 15:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214971; cv=none; b=bMMIJBbFarQSLde3NEBRBdAOWFh6myJcn2h/OvBxF9zZewsgGyuNta73Zm6WcD/t48NobwLfhIlLfDWqBzBO1dgqg2bqJaa42uepj1vkPlXuYFF5XdmZFq5Q9j6pq+lg6XYZh84CHYM9sSz+xrS6E+Y5d/7qlS7Ht7qyZcNSJhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214971; c=relaxed/simple;
	bh=U277+VjZMmRGeI9tBgFMuSii9tnGTe2xZJ0HPOLL1X0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=omo/wuTGBt8w37hAii5lXHz3B8/3UkjVXgmN0r4AztHihERS1EHxPZHnfOkq2rX9OVHh2npWFv/eTxxSluiFtO3l3VW3OUbzFpKRZ/BWu9BDrywpv9QU8mlMHNMLBAear/6zGKly0P+k+D7Y7vrwIO1t8diWlv5s/yrycIa5Cq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZC8YyUnD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZC8YyUnD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71DAF1F000FF;
	Mon,  5 Oct 2026 15:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214970;
	bh=sQ7RSYyT3cLRkC1Nnb0MYxgUy/2pyM+dk4gXv9EWeEs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZC8YyUnDbNlygEjKKP6rMCMjU+76qc0xOxn35yCihKjTT3jCoUTSMbTGgBr+34hcH
	 SJte4rTnZ/XBfH36xCTXB8PHwilPwYCmp5LgRZ0qZW9PCNJlY9bCER1M+ZHpFRFR/f
	 loPaDX7QDh/m4TQWbJEix1CfdAOODbhAR4qeLBox6mZw5LVAdG5pzrwb0miNM/TMLi
	 DfBZNDJmARMjx9xZdh7u5xyrEDIah/SK1bGA6lkqlo5Wv4Bs3BljIvgnviy8E0j1lr
	 njHxmc8EacqPzCxfyUAiP7OK4g7ycyYngc/xt+uEzm2ZSHfX6PHuKsqfdHA4AmgxuR
	 Rmg4ioqx7saAg==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260911-fsl-edma-dyn-sg-v10-0-700eb72def57@bootlin.com>
References: <20260911-fsl-edma-dyn-sg-v10-0-700eb72def57@bootlin.com>
Subject: Re: [PATCH v10 0/2] dmaengine: fsl-edma: Scatter/gather
 improvements
Message-Id: <179121496809.358863.5036968996455847544.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 17:42:48 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3


On Fri, 11 Sep 2026 15:11:35 +0200, Benoît Monin wrote:
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


