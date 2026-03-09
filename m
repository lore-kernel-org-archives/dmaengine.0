Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A8636BCC3
	for <dmaengine@vger.kernel.org>; Mon,  9 Mar 2026 07:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042401; cv=none; b=rfhrDhpDA3whC8b880HakfrLNgCsNp7kT0Ot5prn7xECIpXWjXaUxF5fKb4Ji3jriFzGMo6KjeZwAShYuxFHXR9RUeArjpqFMA2hGnmUYFWs/47dRtAIFQvsIMXMWj9sUwS78w8cj+G+Gk7Sszj/Zag6mtyGxyb9KaLMwYEJkF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042401; c=relaxed/simple;
	bh=jCkmSwHTUIHXewAEgBSmJOigS29+4b2q/NJmdI1AotY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WbINVapwerM+XwBH+dMdr2eXoiibBxi2IFfMv1ywXMq3jWpnoSEh5vFSwDfhvlWo4CJN3yfvRzxsFJ5vVTDw734oaTpdWhAdffXPEAqZCRuzWgxPs83hF66UaKw7KDSKYA+NjmYf8cRmXqUyJ4+g3nL9P0pVX2TrskT8XF1Pqvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aF9OrJtC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aF9OrJtC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88FC6C2BCB7;
	Mon,  9 Mar 2026 07:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773042401;
	bh=jCkmSwHTUIHXewAEgBSmJOigS29+4b2q/NJmdI1AotY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aF9OrJtCTPYzWHs1zyaR7wZeyJIa7zMwA+2hCfuP9D83tJNCst+z22jLGuPu2ywMV
	 cS5uBBD10yf4fmH4W3xNShrkpSzTJ7gVRddZaNtZQzce1/zwoAE4SiAlShqlnKOVrT
	 Bz6Ywu9jHS0lIJ838CR7eyel7/GwOsg4JHiBBuTuz11Edp+ZdYOSxUoETt+XMGcOpS
	 bi1Xd7lSt/SRm8jjtVY9dO1tEV34wZLNhCLIhDG6fKGbrui4fAsqla0XuKDYiFU0Sn
	 obnjDioFOJ/fQW2zk9O8I344oMG/Z+Dt2MdEmRz/DGgyltx6/b82enOQOAHuMMQkTL
	 qt0gz7Y7sM6IQ==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>
In-Reply-To: <20260227022905.233721-1-vkoul@kernel.org>
References: <20260227022905.233721-1-vkoul@kernel.org>
Subject: Re: [PATCH] dmaengine: xilinx: Update kernel-doc comments
Message-Id: <177304240024.87946.3593205371074892767.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 08:46:40 +0100
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 27 Feb 2026 07:59:05 +0530, Vinod Koul wrote:
> Two members of struct xdma_desc_block are not descibed leading to
> warnings, document them.
> 
> Warning: drivers/dma/xilinx/xdma.c:75 struct member 'last_interrupt' not described in 'xdma_chan'
> Warning: drivers/dma/xilinx/xdma.c:75 struct member 'stop_requested' not described in 'xdma_chan'
> 
> 
> [...]

Applied, thanks!

[1/1] dmaengine: xilinx: Update kernel-doc comments
      commit: 65ca1121f7be4cc0391f6d80fa87eac6f7d847a5

Best regards,
-- 
~Vinod


