Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B964A92C7;
	Thu, 10 Sep 2026 14:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049223; cv=none; b=SZ60YFa6Y+5kNoHRf2j5iaypV8u3t9f/4JchwcoSC2sfW9fEuwZn+UIpUJ/q/envP2kNNnFrxR8v7/2KhD3/56RSGUcP5T7C+YybMakCz1lDIAVrockEEhpITom4NZtR8sRi09DEVhn3AacxgsHZGqXiuCjHS0/oG7mimQruyVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049223; c=relaxed/simple;
	bh=5DHdKcRKwAfFGni7QRiH+4tP8t072mH5hmmI//qR5rE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aGEizX9w6gTNtHV+mXRRs5fsH44zIU8m8nSAaykaMtv9kFEBoOMheXUU+GOrihnDuIRAI7mh9Ud62ql8p8APyS1pZ7a+AspA780kwbq2tgpGorK3RX8eKwLkY6+d/3Er/SlncKGjcVd45FZ0tFLHOrMzTg0sdahb4/Em+aF2xlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BlCzojX3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BlCzojX3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6871F000FF;
	Thu, 10 Sep 2026 14:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049222;
	bh=76FpYM6Ge1vqPMazt7qg6DlSjkLRIZk420Qx/acPMmw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BlCzojX3Q0bsYwxm2sTiXEjuFBoLHnV+YcU812sF5drsbQCRV5Ibt2uztD1+ZxxOn
	 9RizU3GtxvtH6g3YEvf0NPdzI3dssg1CWFYF5gjaAetdBhQhYl53FElaEClrlegJSZ
	 /s9lUxID1mLHAGuhTQSoA8cz/cptKmWfn5lNJQvqsZFA4bRaAXspTh1Id6xch4GoxD
	 nDDRMaGuphtnMa7pk5c0IHEvzObUsKOGmFpg2SoykVpSqN4RWMmAl3aeYWLrR8W9yG
	 moR+luPjvreVWPqvTDrCnWj5ipZzYPSdvDukwDFhXIKMEpFcR/dmI2N1N7cPCCNhj+
	 4DdngHBzbZGSA==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Kedareswara rao Appana <appana.durga.rao@xilinx.com>, 
 Alex Bereza <alex@bereza.email>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260818-fix-hw-buf-desc-after-cyclic-mode-v2-1-530ff44c6a81@bereza.email>
References: <20260818-fix-hw-buf-desc-after-cyclic-mode-v2-1-530ff44c6a81@bereza.email>
Subject: Re: [PATCH v2] dmaengine: xilinx_dma: Fix hardware buffer
 descriptor chain after cyclic DMA
Message-Id: <178904921939.109109.4260321202940337828.b4-ty@kernel.org>
Date: Thu, 10 Sep 2026 19:36:59 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 18 Aug 2026 09:36:29 +0200, Alex Bereza wrote:
> Using the DMA in cyclic mode modifies the hardware buffer descriptor
> chain in xilinx_dma_prep_dma_cyclic so that the last descriptor used by
> the cyclic transfer points back to the first descriptor, but it never
> restores the original descriptor ring. This breaks using non-cyclic mode
> after cyclic mode with an error like:
> 
>   xilinx-vdma 86000000.dma: Channel 00000000354d5c8d has errors 100, cdr 6de40000 tdr 6de40400
> 
> [...]

Applied, thanks!

[1/1] dmaengine: xilinx_dma: Fix hardware buffer descriptor chain after cyclic DMA
      commit: 7ed1e3070c9b4bbd67d5519e14711038dd53ab13

Best regards,
-- 
~Vinod


