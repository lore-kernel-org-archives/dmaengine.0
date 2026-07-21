Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CDE3ABD95;
	Tue, 21 Jul 2026 11:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784633099; cv=none; b=cfrReNulMYl042zm8aDyQqfC/ELTU1x2HtrpwW7q9MkAueacrv6EQBold3UGgstm8tt7gmk4jtcMPGQ4fR3T/WU6tLWoRW+A0jV7RT0YkhiA6xN2x2v44COUdHXsM+lrCN4U2lYOOHW9j/4yfly8n6O3ageTHJ4FYIyDm3x28dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784633099; c=relaxed/simple;
	bh=+YZDDUsQaCP1QUUWGKT9x7MWk3CFWjZWqFFalIYp1ug=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GsJcLmMRTlYBivgVKAr4YhxDb4V04NmLAXosZRWnRpUgrVkTZ30+XAwZlF96zTpCastIdOxNtkIEuryYQeq92iiHy6kA3ZtTIF/seby0sUS5ZwOOlPLFgOjjHsokqDlPVHxXs8ZLz357e7oz1iW8SUcj1SLY62bBzREuF1dOX+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dP566OQM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dP566OQM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BFA11F000E9;
	Tue, 21 Jul 2026 11:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784633096;
	bh=KlRYJm8wbZB8t05h5x7ya6RjDCHWOCBizsKQYSw8qzg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dP566OQMN7VnMgLPBq9j+CH5ypXhC+6ltihPoa0yXtWFiBj8VBQgk2PUuSp+jS/R9
	 prB67QaSkL2CIAs0oeyJH27oU2ism5DjwNbXMuW0vV5SQ5pvo9DmEs3snjXx1iURGr
	 dlDSH56w5rMrjQ2aEykaB7ayznXeQI1E67BfX3zVh/iPPE+H3Nng53qdZfNOkqJY8c
	 6HUEA88oIDADuu5qmC2Zqrb4cgmwpbvgO587DwvW36usCEmdgIoRjEV3W2lYvteHr8
	 OrP+YyfgIk1NiEHywRAWPhbFTr+RfsPD+nPU4r9F0gLTVmZvOhfMJrIm/Oga//XVe+
	 BVNu3JlBzCVww==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Koichiro Den <den@valinux.co.jp>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260717050308.2144108-1-den@valinux.co.jp>
References: <20260717050308.2144108-1-den@valinux.co.jp>
Subject: Re: [PATCH v5 00/14] dmaengine: dw-edma: Prepare for PCI EP DMA
 (part 1/3)
Message-Id: <178463309373.96200.2863024789492214005.b4-ty@kernel.org>
Date: Tue, 21 Jul 2026 16:54:53 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 17 Jul 2026 14:02:54 +0900, Koichiro Den wrote:
> This is v5, part 1 of three series for PCI endpoint DMA.
> 
> The three series are:
> 
>   * part 1: dmaengine: dw-edma: Prepare for PCI EP DMA
>   * part 2: PCI: endpoint: Expose endpoint DMA resources
>   * part 3: PCI: endpoint: Add PCI DMA endpoint function
> 
> [...]

Applied, thanks!

[01/14] dmaengine: dw-edma: Factor out HDMA interrupt setup helper
        commit: 3e5933f2003e89d733b8d3a3a026ab9af411fbb5
[02/14] dmaengine: dw-edma: Add per-channel interrupt routing control
        commit: 9c317842eceece7efbaf07ac1a08c5d5e8be7ad0
[03/14] dmaengine: dw-edma: Add core quiesce operations
        commit: c9c25b2f32601409a53845b41183a29c8260f33e
[04/14] dmaengine: dw-edma: Initialize IRQ data before requesting IRQs
        commit: 647217abea849d3d45f8cb0b8ee5b78d50f26985
[05/14] dmaengine: dw-edma: Add partial channel ownership mode
        commit: b24a5e9db6863567df1a10fcd29e01467672c56e
[06/14] dmaengine: dw-edma-pcie: Track non-LL mode in DMA data
        commit: 1415d6d1f101398441da43e82a076afe1c5aebd3
[07/14] dmaengine: dw-edma-pcie: Add capability match data
        commit: f3468b998a00c1491b774af188d5f741c64a1c71
[08/14] dmaengine: dw-edma-pcie: Rename vsec_data to dma_data
        commit: 6cb89b38dcd7e2144c7af8c6c6bc9d30e84b73c9
[09/14] dmaengine: dw-edma-pcie: Add platform ops to match data
        commit: f8850e66ae8b3f2809b665375ba9a7106a4779f8
[10/14] dmaengine: dw-edma-pcie: Add register offset match flag
        commit: 9504c24325ede003d111cd004e56803969764355
[11/14] dmaengine: dw-edma-pcie: Factor out descriptor block address lookup
        commit: 6f3328acabc4b78de2545bc4b4d2c8c7a4988624
[12/14] dmaengine: dw-edma-pcie: Handle optional data blocks
        commit: 81964f539601f3dcbf1ed64979aa9b5ae0e4adf4
[13/14] dmaengine: dw-edma-pcie: Add chip flags to match data
        commit: 1d68178b3404737af2cee6c7b4395de3de6dccaa
[14/14] dmaengine: dw-edma: Program endpoint function numbers
        commit: 0613e7934ee233d726af8d8c89f251a1c4df738d

Best regards,
-- 
~Vinod


