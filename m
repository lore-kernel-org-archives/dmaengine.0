Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732B44A99A;
	Mon, 11 Dec 2023 15:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tfNOIv8W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37ADC433C7;
	Mon, 11 Dec 2023 15:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702307046;
	bh=IrH6aa/oGSpb78xUbgGhpZuk8lP0RCbUq/v+VLpNYcY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=tfNOIv8WYCFmw7THIgtuWaQ7B/p/C11+vUq86HWaXy73S54IfJYPYsA6LJS0F7ve9
	 woS3LiETdWq4UC/Uq8A9bF8rDDba4ZqPLy/JmsgrVBGd1VzSIqS/fgaOiVCFGBxeUT
	 dqVgQC7HbQQthJ/2ls932SgzVStyHDAyeH4Hn5iqz1EStY3VwQfQHvOtZmy3p4PChP
	 BSduI0QyQPWbAbxsGTyy3s63CkpUa6cQDfdDuTGlhr6NtXu7YrbEie4ojfQVECuc0W
	 MKWhPpeuLthVHZJJvmv33Dslb0kOe4mghj6hj/8d8qle1Mnhc07MBWUIvYH87b4BUq
	 /8icIB8tRzj4w==
From: Vinod Koul <vkoul@kernel.org>
To: imx@lists.linux.dev, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20231127214325.2477247-1-Frank.Li@nxp.com>
References: <20231127214325.2477247-1-Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] dmaengine: fsl-edma: fix DMA channel leak in
 eDMAv4
Message-Id: <170230704442.319897.10351287575492933941.b4-ty@kernel.org>
Date: Mon, 11 Dec 2023 20:34:04 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Mon, 27 Nov 2023 16:43:25 -0500, Frank Li wrote:
> Allocate channel count consistently increases due to a missing source ID
> (srcid) cleanup in the fsl_edma_free_chan_resources() function at imx93
> eDMAv4.
> 
> Reset 'srcid' at fsl_edma_free_chan_resources().
> 
> 
> [...]

Applied, thanks!

[1/1] dmaengine: fsl-edma: fix DMA channel leak in eDMAv4
      commit: 4ee632c82d2dbb9e2dcc816890ef182a151cbd99

Best regards,
-- 
~Vinod


