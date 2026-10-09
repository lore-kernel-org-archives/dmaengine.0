Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D6D4A3D23;
	Fri,  9 Oct 2026 10:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540902; cv=none; b=q+LLPCmJJdb8ZvIw4Kb2i7YN1DiaNcZb9XWAtBhS0bTbDdw6N8VDud30EW93sQCQzng+oDDnwI1jU8kyemyyWVyDkjpzdJw/LDVvKCcRAgEMuggECxV7FAOsNNE8TraROQMeYKer8Yn7aLee7ERxgmZmEeyb33eSBZitu6rInLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540902; c=relaxed/simple;
	bh=4GREgrAnn5EwT8hPlmnxOdJ6lcQhM/EiJ+KkQ/qq/Dg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F2NwvzGVSmDBya96S/QfujmDNTvodCROmunKKywyJgntMsouEDv1Gc6Hf6uT/fk4heodFjPlodY7Etf25l80WawArLiB8dh+/AkeZVv7Fb7xfQpfBOBBDkJ3eLXaDefh8YNTUJTisjeb9ywh7/TD6NArlVxOAu9/lTk9+XSBoIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qi+NrNAv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qi+NrNAv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3F61F000FF;
	Fri,  9 Oct 2026 10:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540901;
	bh=VVqaM/cBXG8IN5SK2GwWOvCfhQl+ciR30TodxRC57lA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Qi+NrNAv7bRZo4O8AbjMnRVjTjiHG0jH9swau95y154wdnmSAlo0t3kd0IRZRDOJy
	 5d4fsugWEOTpbQ8M7YV99/pV0zBfLIfD4jTLVkUE4SDW+5r+J5NMp4tPo3x+pDJCRO
	 hgt8JUyEUTj05R8GtxPvRrz8pFm3KIfGJQaSzdRYYRDn4ZQTkm5ZrcjtEhpLCJRMZz
	 KCk7TkrBJMDJU4GiR56/DLNCo5ZWA+XFrr/d5m+//NR/QyGXbC53tTeeJGHA8KRoQO
	 1W87DipHf0HHhLEYB1nLDQEQMGmUADn+8AFcOYTjDRPtWkxpcq3qgp2w5QqkXSoW98
	 gDxk7QU5jJEDA==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20261002202341.253152-1-Frank.Li@oss.nxp.com>
References: <20261002202341.253152-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH 1/1] dmaengine: add dmaengine_get_provider_device() API
Message-Id: <179154089879.553139.15809990665785569211.b4-ty@kernel.org>
Date: Fri, 09 Oct 2026 12:14:58 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 02 Oct 2026 16:23:40 -0400, Frank.Li@oss.nxp.com wrote:
> Add dmaengine_get_provider_device() API and kernel doc for
> dmaengine_get_dma_device() to describe the difference.
> 
> dmaengine_get_dma_device() is used for DMA mapping because some DMA
> engines provide per-channel iommu mapping.
> 
> dmaengine_get_provider_device() is used to find a DMA engine channel
> by a filter function.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: add dmaengine_get_provider_device() API
      commit: 61527d7e6998e87b3acd04f1cd2f4d6814385051

Best regards,
-- 
~Vinod


