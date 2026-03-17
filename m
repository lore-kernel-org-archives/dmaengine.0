Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C162D9796;
	Tue, 17 Mar 2026 11:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773746868; cv=none; b=laWOv4OywXBPtbZhsSe+TDS4TtLBDuELCV4RFwebeAkkAa3tnWa09Uws8t12Al7kH17lVDKLSn4oasK09SIJCBu+Z57IygSZ7WPUz5gEGOfbwwdfDuZlmmo+W1fXIrlfAiRSlfAuHd+7ZTAUpi4x6IhyBj48nxtgNg7j7k8At5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773746868; c=relaxed/simple;
	bh=k60n7rIsHTQCJ1JUsN0o0C8TVxX9c3H5zo5Xx7is9QE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u3twzZnwitfpAyAHOqT7iemEEwQVn3Ju94Bb7gFIOh+n220T24qWBGETUzyatGUy1iPNFEoYbLeiIQ2xLLcU1LedgQQO6Zoy+zJYiKEfmQ/hU0KC1Ls8ZO6ucJwTgExhUCjX/6u3rc5RxWBV2MXga5KiTNeUUGBZMSjzNIbGMB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/Tk4A6v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/Tk4A6v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05352C4CEF7;
	Tue, 17 Mar 2026 11:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773746867;
	bh=k60n7rIsHTQCJ1JUsN0o0C8TVxX9c3H5zo5Xx7is9QE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A/Tk4A6vamLp3o6wEm8v0NoGM6RZcUb6LJuMJ82n6YJx3Onntn+ciBEwiNKI2PfbF
	 jzqNbRTNI9RPYGpm/sAIvFddG6dyL7+L2mOf3GXgut9KqFl/qVHGvVH+kBCApFALwN
	 joFR6J56V9+KMyefcWoYI3Wc+lFMzMXsEVfF5HFBVhrpscTpij6nmGUZfWg1/5fXu1
	 hovLIKzcqls5UqwG6uxsMxwzRDWt47XNhTBENvVoMp16W3YCKezwCza5aqlhUAVlK7
	 Qi/7VdO29sPiOpKdIG/APECfSC/ggkNbapdiS6P5Lf+qhjDIuXza/M6OMVzVHwitzN
	 iXkbqS9Fo133A==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Marek Vasut <marex@nabladev.com>
Cc: Michal Simek <michal.simek@amd.com>, 
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 Rahul Navale <rahul.navale@ifm.com>, Sasha Levin <sashal@kernel.org>, 
 Suraj Gupta <suraj.gupta2@amd.com>, 
 Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260316221728.160139-1-marex@nabladev.com>
References: <20260316221728.160139-1-marex@nabladev.com>
Subject: Re: [PATCH] dmaengine: xilinx: xilinx_dma: Fix dma_device
 directions
Message-Id: <177374686462.337094.8706717983323051098.b4-ty@kernel.org>
Date: Tue, 17 Mar 2026 16:57:44 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 16 Mar 2026 23:16:54 +0100, Marek Vasut wrote:
> Unlike chan->direction , struct dma_device .directions field is a
> bitfield. Turn chan->direction into a bitfield to make it compatible
> with struct dma_device .directions .
> 
> 

Applied, thanks!

[1/1] dmaengine: xilinx: xilinx_dma: Fix dma_device directions
      commit: e9cc95397bb7da13fe8a5b53a2f23cfaf9018ade

Best regards,
-- 
~Vinod


