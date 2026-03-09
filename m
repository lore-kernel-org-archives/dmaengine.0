Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B21E36B05B;
	Mon,  9 Mar 2026 07:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042400; cv=none; b=at9zs7JuIlkWnCoJy7eZ8Q9GqIoHVeL0CxsYBJbEIBe3wQmOh7r/dNI2Zx1a0IkSBBhAH89yafRZpU5DT5XzSL9L4eVQ9S1msG+edKPV24qvJk/SdGiLg4J8LtQlDoIPOo0rdAV7W3sc9Pk0tsYjdfldrmuS2L4MEg7LM6w9b7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042400; c=relaxed/simple;
	bh=MqMvEoRBqg3HfVVhazESgwgga+R5Tb9n6w5xmlgDpsE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UbVfmnQMD1XJK5drBtIYZGy1uIJNIlmL5kEPc3j61cqQlJTZG+NaM90o6IwVgG6MFQv8MTDi9spM4/lWsuNlfYeh6v7XXeQRmqvac7n5awjSZTAAZziWwF9GIUjCTAO+g61DTwJEu0Vo1UiHyaCNDOWucZQlpsiZWVMT8jAhuWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dl48wO27; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dl48wO27"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF569C2BCB8;
	Mon,  9 Mar 2026 07:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773042399;
	bh=MqMvEoRBqg3HfVVhazESgwgga+R5Tb9n6w5xmlgDpsE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Dl48wO27LvHl67q6iSjqyQJSxbenBV/YWgB3XL4RcTXvRC/OVRMkAh74EFXW/hzG2
	 oB3s5UXrmcyGYikItR2Lx2T6beDjlPa6O6uUBeLgMVLXQP6/Xl3uu+lI7CEpkd228o
	 IUwHCiqbGyxD/cuaD1AeAvyMss39vVgvp0mgtZipKGFU7yvtVeY4ckz+QYqAE8vE8+
	 aRHLhxwMkd6evw8Lr4bT+Q5nfoSg+CO8aU+7sOIM2ctpC79F56GXInX9HO14bR8r1B
	 xbkOV0sFJYoaWOVFWQYdCaumsfjJkkU1t0M1qqw0iEEPFPvw6boVyaIbT6unUKdCOb
	 V3tEOpaALYs6w==
From: Vinod Koul <vkoul@kernel.org>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org
In-Reply-To: <20260301011203.3062658-1-rdunlap@infradead.org>
References: <20260301011203.3062658-1-rdunlap@infradead.org>
Subject: Re: [PATCH] dmaengine: qcom: qcom-gpi-dma.h: fix all kernel-doc
 warnings
Message-Id: <177304239843.87946.4987914035842747572.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 08:46:38 +0100
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sat, 28 Feb 2026 17:12:03 -0800, Randy Dunlap wrote:
> Add missing enum descriptions and spell one struct member correctly
> to avoid kernel-doc warnings:
> 
> Warning: include/linux/dma/qcom-gpi-dma.h:15 Enum value 'SPI_TX' not
>  described in enum 'spi_transfer_cmd'
> Warning: include/linux/dma/qcom-gpi-dma.h:15 Enum value 'SPI_RX' not
>  described in enum 'spi_transfer_cmd'
> Warning: include/linux/dma/qcom-gpi-dma.h:15 Enum value 'SPI_DUPLEX' not
>  described in enum 'spi_transfer_cmd'
> Warning: include/linux/dma/qcom-gpi-dma.h:80 struct member 'multi_msg' not
>  described in 'gpi_i2c_config'
> 
> [...]

Applied, thanks!

[1/1] dmaengine: qcom: qcom-gpi-dma.h: fix all kernel-doc warnings
      commit: 7b84a00dd3528d980f1f35fd2c5015f72dc3f62a

Best regards,
-- 
~Vinod


